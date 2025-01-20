@interface HMFWifiNetworkAssociation
- (BOOL)requiresPassword;
- (HMFMACAddress)BSSID;
- (HMFMACAddress)MACAddress;
- (HMFMACAddress)gatewayMACAddress;
- (HMFWifiNetworkAssociation)initWithMACAddress:(id)a3 SSID:(id)a4 requiresPassword:(BOOL)a5 BSSID:(id)a6 gatewayIPAddress:(id)a7 gatewayMACAddress:(id)a8;
- (NSString)SSID;
- (NSString)gatewayIPAddress;
@end

@implementation HMFWifiNetworkAssociation

- (HMFWifiNetworkAssociation)initWithMACAddress:(id)a3 SSID:(id)a4 requiresPassword:(BOOL)a5 BSSID:(id)a6 gatewayIPAddress:(id)a7 gatewayMACAddress:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v22 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMFWifiNetworkAssociation;
  v18 = [(HMFWifiNetworkAssociation *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_MACAddress, a3);
    objc_storeStrong((id *)&v19->_SSID, a4);
    v19->_requiresPassword = a5;
    objc_storeStrong((id *)&v19->_BSSID, a6);
    objc_storeStrong((id *)&v19->_gatewayIPAddress, a7);
    objc_storeStrong((id *)&v19->_gatewayMACAddress, a8);
  }

  return v19;
}

- (HMFMACAddress)MACAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)SSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (HMFMACAddress)BSSID
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)gatewayIPAddress
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (HMFMACAddress)gatewayMACAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayMACAddress, 0);
  objc_storeStrong((id *)&self->_gatewayIPAddress, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
}

@end