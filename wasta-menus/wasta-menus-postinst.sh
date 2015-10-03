#!/bin/bash

# ==============================================================================
# wasta-menus: wasta-menus-postinst.sh
#
#   This script is automatically run by the postinst configure step on
#       installation of wasta-base-setup.  It can be manually re-run, but is
#       only intended to be run at package installation.  
#
#   2015-09-27 rik: initial script
#
# ==============================================================================

# ------------------------------------------------------------------------------
# Check to ensure running as root
# ------------------------------------------------------------------------------
#   No fancy "double click" here because normal user should never need to run
if [ $(id -u) -ne 0 ]
then
	echo
	echo "You must run this script with sudo." >&2
	echo "Exiting...."
	sleep 5s
	exit 1
fi

# ------------------------------------------------------------------------------
# Initial Setup
# ------------------------------------------------------------------------------

echo
echo "*** Beginning wasta-menus-postinst.sh"
echo

# Setup Diretory for later reference
DIR=/usr/share/wasta-menus

# ------------------------------------------------------------------------------
# Configuring Wasta Menus Default Apps
# ------------------------------------------------------------------------------
echo
echo "*** Installing wasta-menus-default-apps.txt in update-alternatives system"
echo
#   Use priority 10 so that regional packages will override as default
update-alternatives --install /etc/wasta-menus-default-apps.txt \
    wasta-menus-default-apps $DIR/resources/wasta-menus-default-apps.txt 10

# ------------------------------------------------------------------------------
# Finished
# ------------------------------------------------------------------------------
echo
echo "*** Finished with wasta-menus-postinst.sh"
echo

exit 0
