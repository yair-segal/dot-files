# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac

CLICOLOR=1
LSCOLORS=ExFxBxDxCxegedabagacad

function title {
  echo -ne "\033]0;"$*"\007"
}

## history stuff
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

## aliases
alias ll='ls -halF'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias grep='grep -n --color=auto'

# Add git branch to promptif its present to PS1
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$CLICOLOR" = 1 ]; then
  PS1='\[\e[01;32m\]\u@mac \[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
  PS1="\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] "
fi

# handy shortcuts
alias ports='sudo lsof -iTCP -sTCP:LISTEN -n -P'
alias tunnels="echo 'displaying ssh tunnels' && sudo lsof -i -n | awk 'NR==1 || /ssh/'"


# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
