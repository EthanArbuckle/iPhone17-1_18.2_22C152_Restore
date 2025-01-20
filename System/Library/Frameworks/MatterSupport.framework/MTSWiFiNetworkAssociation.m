@interface MTSWiFiNetworkAssociation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MTSWiFiNetworkAssociation)initWithCoder:(id)a3;
- (MTSWiFiNetworkAssociation)initWithSSID:(id)a3 credentials:(id)a4;
- (NSData)credentials;
- (NSData)ssid;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTSWiFiNetworkAssociation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);

  objc_storeStrong((id *)&self->_ssid, 0);
}

- (NSData)credentials
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)ssid
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MTSWiFiNetworkAssociation *)self ssid];
  [v4 encodeObject:v5 forKey:@"MTSWNA.ck.ssid"];

  id v6 = [(MTSWiFiNetworkAssociation *)self credentials];
  [v4 encodeObject:v6 forKey:@"MTSWNA.ck.credentials"];
}

- (MTSWiFiNetworkAssociation)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSWNA.ck.ssid"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSWNA.ck.credentials"];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = (void *)MEMORY[0x245697870]();
    v12 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v15 = 138543874;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v5;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2450FD000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded ssid: %@, credentials: %@", (uint8_t *)&v15, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = [(MTSWiFiNetworkAssociation *)self initWithSSID:v5 credentials:v6];
    v13 = v12;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(MTSWiFiNetworkAssociation *)self ssid];
  uint64_t v4 = [v3 hash];
  v5 = [(MTSWiFiNetworkAssociation *)self credentials];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(MTSWiFiNetworkAssociation *)self ssid];
    BOOL v8 = [v6 ssid];
    if ([v7 isEqual:v8])
    {
      v9 = [(MTSWiFiNetworkAssociation *)self credentials];
      v10 = [v6 credentials];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (MTSWiFiNetworkAssociation)initWithSSID:(id)a3 credentials:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  BOOL v8 = v7;
  if (!v7)
  {
LABEL_7:
    int v15 = (void *)_HMFPreconditionFailure();
    return (MTSWiFiNetworkAssociation *)+[MTSWiFiNetworkAssociation supportsSecureCoding];
  }
  v17.receiver = self;
  v17.super_class = (Class)MTSWiFiNetworkAssociation;
  v9 = [(MTSWiFiNetworkAssociation *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    ssid = v9->_ssid;
    v9->_ssid = (NSData *)v10;

    uint64_t v12 = [v8 copy];
    credentials = v9->_credentials;
    v9->_credentials = (NSData *)v12;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end