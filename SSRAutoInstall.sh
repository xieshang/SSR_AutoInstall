check_soft(){
	wget --no-check-certificate https://raw.githubusercontent.com/xieshang/SSR_AutoInstall/master/shadowsocks-all.sh
	chmod +x shadowsocks-all.sh
	apt-get update
	apt-get -y install screen
	screen_name=$"SSR"
	screen -dmS $screen_name
	cmd=$"./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log";
	screen -x -S $screen_name -p 0 -X stuff "$cmd"
	screen -x -S $screen_name -p 0 -X stuff $'\n'
}


# Initialization step
    $check_soft
    ;;
esac
