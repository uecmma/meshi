#!/bin/sh

set -e

if [ -z "$PREFIX" ]; then
  PREFIX=''
fi

ASSET_INSTALL_DIR="$PREFIX/etc/meshi"
mkdir -p "$ASSET_INSTALL_DIR"
cp meshi.list "$ASSET_INSTALL_DIR"

COMMAND_INSTALL_DIR="$PREFIX/opt/local/bin"
mkdir -p "$COMMAND_INSTALL_DIR"
cp meshi "$COMMAND_INSTALL_DIR/meshi"
case "$(uname -s)" in
  Darwin ) sed -i '' -e "s|/etc/|$PREFIX/etc/|g" "$COMMAND_INSTALL_DIR/meshi" ;;
  * ) sed -ie "s|/etc/|$PREFIX/etc/|g" "$COMMAND_INSTALL_DIR/meshi" ;;
esac

