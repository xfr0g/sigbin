#!/bin/bash
# Author: xfr0g
# Date: 2024
# Description: SIGBIN is a Bash script that searches for the social media accounts of the given username.

# Colors
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
WB='\033[1;37m'
NC='\033[1;0m'

# Interface
echo -e "${GREEN} _______ _________ _______  ______  _________ _       "
echo -e "${GREEN}(  _____ \\__   __/(  ____ \(  ___ \ \__   __/( (    /|"
echo -e "${GREEN}| (    \/   ) (   | (    \/| (   ) )   ) (   |  \  ( |"
echo -e "${GREEN}| (_____    | |   | |      | (__/ /    | |   |   \ | |"
echo -e "${GREEN}(_____  )   | |   | | ____ |  __ (     | |   | (\ \) |"
echo -e "${GREEN}      ) |   | |   | | \_  )| (  \ \    | |   | | \   |"
echo -e "${GREEN}/\____) |___) (___| (___) || )___) )___) (___| )  \  |"
echo -e "${GREEN}\_______)\_______/(_______)|/ \___/ \_______/|/    )_)"
echo -e "${YELLOW}[ Author: ${RED}xfr0g ${YELLOW}]                     [ Version: ${RED}1.0 ${YELLOW}]"
echo

# Before we start, let's check if a file named username.txt exists. If it does, then we will remove it and create a new one. If it doesn't, then we will continue to create one.
if [ -e username.txt ] 
 then                   
     echo "Removing username.txt file..."
     rm -rf username.txt
     echo "Creating a new one..."
     touch username.txt 
else
	echo "Creating username.txt file..."
	touch username.txt
fi

# Take input from endpoint user
echo
echo -ne "${GREEN}[${WB}*${GREEN}] Enter username: ${NC}"
read username

# We will use curl command to send a request and scrape a few social media websites.
# We will also use sleep command to sleep our system 1 second after getting a result from a website and appending it to our file.
# Facebook, Instagram, X, TikTok, Youtube, Wattpad, Snapchat, Github, LinkedIn, Pinterest, Reddit
echo                                                                                              
echo -e "${GREEN}[${WB}*${GREEN}] ${WB}Searching on:\n"

# Facebook
echo -e "${GREEN}[${WB}*${GREEN}] ${WB}Facebook..." 
ch_fb=$(curl -sL "https://www.facebook.com/$username" | grep -q 'available right now'; echo $?)

if [[ $ch_fb -eq 1 ]]
then
	echo -e "${GREEN}[${YELLOW}+${GREEN}] ${WB}Found: ${NC}https://www.facebook.com/$username\n"
	echo "https://www.facebook.com/$username" > username.txt
	sleep 2
elif [[ $ch_fb -eq 0 ]]
then
	echo -e "${GREEN}[${RED}-${GREEN}] ${NC}Not Found\n"
	sleep 2
fi

# Instagram
echo -e "${GREEN}[${WB}*${GREEN}] ${WB}Instagram..."
ch_ig=$(curl -sL "https://www.instagram.com/$username" | grep -q 'broken'; echo $?)

if [[ $ch_ig -eq 1 ]]  
then       
    echo -e "${GREEN}[${YELLOW}+${GREEN}] ${WB}Found: ${NC}https://www.instagram.com/$username\n"
	echo "https://www.instagram.com/$username" >> username.txt
	sleep 2
elif [[ $ch_ig -eq 0 ]]
then       
    echo -e "${GREEN}[${RED}-${GREEN}] ${NC}Not Found\n"
	sleep 2
fi

# Twitter
echo -e "${GREEN}[${WB}*${GREEN}] ${WB}Twitter..."
ch_x=$(curl -sL "https://www.twitter.com/$username" | grep -q 'this account'; echo $?)

if [[ $ch_x -eq 1 ]]  
then       
	echo -e "${GREEN}[${YELLOW}+${GREEN}] ${WB}Found: ${NC}https://www.twitter.com/$username\n"
	echo "https://www.twitter.com/$username" >> username.txt
	sleep 2
elif [[ $ch_x -eq 0 ]]
then       
	echo -e "${GREEN}[${RED}-${GREEN}] ${NC}Not Found\n"
	sleep 2
fi

# Tiktok
echo -e "${GREEN}[${WB}*${GREEN}] ${WB}Tiktok..."
ch_tk=$(curl -sL -w "%{http_code}" "https://www.tiktok.com/@$username" -o /dev/null)

if [[ $ch_tk -eq 200 ]]  
then       
	echo -e "${GREEN}[${YELLOW}+${GREEN}] ${WB}Found: ${NC}https://www.tiktok.com/@$username\n"
	echo "https://www.tiktok.com/@$username" >> username.txt
	sleep 2
else
	echo -e "${GREEN}[${RED}-${GREEN}] ${NC}Not Found\n"
	sleep 2
fi

# Youtube
echo -e "${GREEN}[${WB}*${GREEN}] ${WB}Youtube..."
ch_yt=$(curl -sL "https://www.youtube.com/@$username" | grep -q 'sorry about that'; echo $?)

if [[ $ch_yt -eq 1 ]]  
then       
	echo -e "${GREEN}[${YELLOW}+${GREEN}] ${WB}Found: ${NC}https://www.youtube.com/@$username\n"
	echo "https://www.youtube.com/@$username" >> username.txt
	sleep 2
elif [[ $ch_yt -eq 0 ]]
then       
	echo -e "${GREEN}[${RED}-${GREEN}] ${NC}Not Found\n"
	sleep 2
fi

# Wattpad
echo -e "${GREEN}[${WB}*${GREEN}] ${WB}Wattpad..."
ch_wp=$(curl -sL "https://www.wattpad.com/user/$username" | grep -q 'user not found'; echo $?)

if [[ $ch_wp -eq 1 ]]  
then       
	echo -e "${GREEN}[${YELLOW}+${GREEN}] ${WB}Found: ${NC}https://www.wattpad.com/user/$username\n"
	echo "https://www.wattpad.com/user/$username" >> username.txt
	sleep 2
elif [[ $ch_wp -eq 0 ]]
then       
	echo -e "${GREEN}[${RED}-${GREEN}] ${NC}Not Found\n"
	sleep 2
fi

# Snapchat
echo -e "${GREEN}[${WB}*${GREEN}] ${WB}Snapchat..."
ch_sc=$(curl -sL "https://www.snapchat.com/add/$username" | grep -q 'content not found'; echo $?)

if [[ $ch_sc -eq 1 ]]  
then       
	echo -e "${GREEN}[${YELLOW}+${GREEN}] ${WB}Found: ${NC}https://www.snapchat.com/add/$username\n"
	echo "https://www.snapchat.com/add/$username" >> username.txt
	sleep 2
elif [[ $ch_sc -eq 0 ]]
then       
	echo -e "${GREEN}[${RED}-${GREEN}] ${NC}Not Found\n"
	sleep 2
fi

# Github
echo -e "${GREEN}[${WB}*${GREEN}] ${WB}Github..."
ch_gh=$(curl -sL -w "%{http_code}" "https://www.github.com/$username" -o /dev/null)

if [[ $ch_gh -eq 200 ]]  
then       
	echo -e "${GREEN}[${YELLOW}+${GREEN}] ${WB}Found: ${NC}https://www.github.com/$username\n"
	echo "https://www.github.com/$username" >> username.txt
	sleep 2
else
	echo -e "${GREEN}[${RED}-${GREEN}] ${NC}Not Found\n"
	sleep 2
fi

# LinkedIn
echo -e "${GREEN}[${WB}*${GREEN}] ${WB}LinkedIn..."
ch_li=$(curl -sL "https://www.linkedin.com/$username" | grep -q 'page not found'; echo $?)

if [[ $ch_li -eq 1 ]]  
then       
	echo -e "${GREEN}[${YELLOW}+${GREEN}] ${WB}Found: ${NC}https://www.linkedin.com/$username\n"
	echo "https://www.linkedin.com/$username" >> username.txt
	sleep 2
elif [[ $ch_li -eq 0 ]]
then       
	echo -e "${GREEN}[${RED}-${GREEN}] ${NC}Not Found\n"
	sleep 2
fi

# Pinterest
echo -e "${GREEN}[${WB}*${GREEN}] ${WB}Pinterest..."
ch_pt=$(curl -sL "https://www.pinterest.com/$username" | grep -q 'not found'; echo $?)

if [[ $ch_pt -eq 1 ]]  
then       
	echo -e "${GREEN}[${YELLOW}+${GREEN}] ${WB}Found: ${NC}https://www.pinterest.com/$username\n"
	echo "https://www.pinterest.com/$username" >> username.txt
	sleep 2
elif [[ $ch_pt -eq 0 ]]
then       
	echo -e "${GREEN}[${RED}-${GREEN}] ${NC}Not Found\n"
	sleep 2
fi

# Reddit
echo -e "${GREEN}[${WB}*${GREEN}] ${WB}Reddit..."
ch_rd=$(curl -sL "https://www.reddit.com/user/$username" | head -n1 | grep -q 'HTTP/2 404' ; echo $?)

if [[ $ch_rd -eq 1 ]]  
then       
	echo -e "${GREEN}[${YELLOW}+${GREEN}] ${WB}Found: ${NC}https://www.reddit.com/user/$username\n"
	echo "https://www.reddit.com/user/$username" >> username.txt
	sleep 2
elif [[ $ch_rd -eq 0 ]]
then       
	echo -e "${GREEN}[${RED}-${GREEN}] ${NC}Not Found\n"
	sleep 2
fi

echo -e "${NC}Finished! All positive results are stored in username.txt"
echo -e "${NC}Exiting now."
exit 1
