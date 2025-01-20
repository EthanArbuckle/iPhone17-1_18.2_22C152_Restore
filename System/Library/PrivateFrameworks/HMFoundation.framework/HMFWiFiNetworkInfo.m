@interface HMFWiFiNetworkInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNetworkInfo:(id)a3;
- (HMFMACAddress)MACAddress;
- (HMFWiFiNetworkInfo)initWithCoder:(id)a3;
- (HMFWiFiNetworkInfo)initWithMACAddress:(id)a3 SSID:(id)a4;
- (HMFWiFiNetworkInfo)initWithMACAddress:(id)a3 SSID:(id)a4 BSSID:(id)a5 gatewayIPAddress:(id)a6 gatewayMACAddress:(id)a7;
- (NSString)SSID;
- (NSString)networkBSSID;
- (NSString)networkGatewayIPAddress;
- (NSString)networkGatewayMACAddress;
- (NSString)propertyDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFWiFiNetworkInfo

- (HMFWiFiNetworkInfo)initWithMACAddress:(id)a3 SSID:(id)a4
{
  return [(HMFWiFiNetworkInfo *)self initWithMACAddress:a3 SSID:a4 BSSID:0 gatewayIPAddress:0 gatewayMACAddress:0];
}

- (HMFWiFiNetworkInfo)initWithMACAddress:(id)a3 SSID:(id)a4 BSSID:(id)a5 gatewayIPAddress:(id)a6 gatewayMACAddress:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v24 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13 || v14 && ![v14 length])
  {
    v20 = (void *)MEMORY[0x19F3A87A0]();
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543874;
      v27 = v22;
      __int16 v28 = 2112;
      id v29 = v13;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_impl(&dword_19D57B000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot create HMFWiFiNetworkInfo with MACAddress: %@ and SSID: %@", buf, 0x20u);
    }
    v18 = 0;
    goto LABEL_9;
  }
  v25.receiver = self;
  v25.super_class = (Class)HMFWiFiNetworkInfo;
  v17 = [(HMFWiFiNetworkInfo *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_MACAddress, a3);
    objc_storeStrong((id *)&v18->_SSID, a4);
    objc_storeStrong((id *)&v18->_networkBSSID, a5);
    objc_storeStrong((id *)&v18->_networkGatewayIPAddress, a6);
    v19 = (NSString *)v16;
    self = (HMFWiFiNetworkInfo *)v18->_networkGatewayMACAddress;
    v18->_networkGatewayMACAddress = v19;
LABEL_9:
  }
  return v18;
}

- (NSString)propertyDescription
{
  v3 = NSString;
  v4 = [(HMFWiFiNetworkInfo *)self MACAddress];
  v5 = [(HMFWiFiNetworkInfo *)self SSID];
  v6 = [v3 stringWithFormat:@" MACAddress=%@ SSID=%@", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(HMFWiFiNetworkInfo *)self isEqualToNetworkInfo:v4];

  return v5;
}

- (BOOL)isEqualToNetworkInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMFWiFiNetworkInfo *)self MACAddress];
  v6 = [v4 MACAddress];
  if ([v5 isEqualToAddress:v6])
  {
    v7 = [(HMFWiFiNetworkInfo *)self SSID];
    v8 = [v4 SSID];
    char v9 = HMFEqualObjects(v7, v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(HMFWiFiNetworkInfo *)self MACAddress];
  uint64_t v4 = [v3 hash];

  BOOL v5 = [(HMFWiFiNetworkInfo *)self SSID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFWiFiNetworkInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMF.MACAddress"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMF.SSID"];

  v7 = [(HMFWiFiNetworkInfo *)self initWithMACAddress:v5 SSID:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMFWiFiNetworkInfo *)self MACAddress];
  [v4 encodeObject:v5 forKey:@"HMF.MACAddress"];

  id v6 = [(HMFWiFiNetworkInfo *)self SSID];
  [v4 encodeObject:v6 forKey:@"HMF.SSID"];
}

- (HMFMACAddress)MACAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)SSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)networkBSSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)networkGatewayIPAddress
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)networkGatewayMACAddress
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkGatewayMACAddress, 0);
  objc_storeStrong((id *)&self->_networkGatewayIPAddress, 0);
  objc_storeStrong((id *)&self->_networkBSSID, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
}

@end