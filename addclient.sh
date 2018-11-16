# Generates the custom client.ovpn
client=$(hostname)_$1
cd /etc/openvpn/easy-rsa/
./easyrsa build-client-full $client nopass
mkdir /etc/openvpn/clients/
cp /etc/openvpn/client-common.txt /etc/openvpn/clients/$client.ovpn
echo "<ca>" >> /etc/openvpn/clients/$client.ovpn
cat /etc/openvpn/easy-rsa/pki/ca.crt >> /etc/openvpn/clients/$client.ovpn
echo "</ca>" >> /etc/openvpn/clients/$client.ovpn
echo "<cert>" >> /etc/openvpn/clients/$client.ovpn
cat /etc/openvpn/easy-rsa/pki/issued/$client.crt >> /etc/openvpn/clients/$client.ovpn
echo "</cert>" >> /etc/openvpn/clients/$client.ovpn
echo "<key>" >> /etc/openvpn/clients/$client.ovpn
cat /etc/openvpn/easy-rsa/pki/private/$client.key >> /etc/openvpn/clients/$client.ovpn
echo "</key>" >> /etc/openvpn/clients/$client.ovpn
echo "<tls-auth>" >> /etc/openvpn/clients/$client.ovpn
cat /etc/openvpn/ta.key >> /etc/openvpn/clients/$client.ovpn
echo "</tls-auth>" >> /etc/openvpn/clients/$client.ovpn
mv /etc/openvpn/clients/$client.ovpn ~/httpserver
echo "Success!"