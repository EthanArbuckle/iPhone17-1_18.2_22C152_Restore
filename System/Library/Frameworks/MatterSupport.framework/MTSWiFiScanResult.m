@interface MTSWiFiScanResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MTSWiFiScanResult)initWithCoder:(id)a3;
- (MTSWiFiScanResult)initWithSSID:(id)a3 rssi:(id)a4 security:(unsigned __int8)a5 band:(unsigned __int8)a6;
- (NSData)ssid;
- (NSNumber)rssi;
- (unint64_t)hash;
- (unsigned)band;
- (unsigned)security;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTSWiFiScanResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssi, 0);

  objc_storeStrong((id *)&self->_ssid, 0);
}

- (unsigned)band
{
  return self->_band;
}

- (unsigned)security
{
  return self->_security;
}

- (NSNumber)rssi
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)ssid
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(MTSWiFiScanResult *)self ssid];
  [v6 encodeObject:v4 forKey:@"MTSWSR.ck.ssid"];

  v5 = [(MTSWiFiScanResult *)self rssi];
  [v6 encodeObject:v5 forKey:@"MTSWSR.ck.rssi"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[MTSWiFiScanResult security](self, "security"), @"MTSWSR.ck.security");
  objc_msgSend(v6, "encodeInteger:forKey:", -[MTSWiFiScanResult band](self, "band"), @"MTSWSR.ck.band");
}

- (MTSWiFiScanResult)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSWSR.ck.ssid"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSWSR.ck.rssi"];
  unsigned __int8 v7 = [v4 decodeIntegerForKey:@"MTSWSR.ck.security"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"MTSWSR.ck.band"];
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10 = (void *)MEMORY[0x245697870](v8);
    v13 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v16 = 138543874;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v5;
      __int16 v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2450FD000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded ssid: %@, rssi: %@", (uint8_t *)&v16, 0x20u);
    }
    v14 = 0;
  }
  else
  {
    v13 = [(MTSWiFiScanResult *)self initWithSSID:v5 rssi:v6 security:v7 band:v8];
    v14 = v13;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(MTSWiFiScanResult *)self ssid];
  uint64_t v4 = [v3 hash];
  v5 = [(MTSWiFiScanResult *)self rssi];
  uint64_t v6 = [v5 hash] ^ v4;
  unsigned __int8 v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[MTSWiFiScanResult security](self, "security"));
  uint64_t v8 = v6 ^ [v7 hash];
  BOOL v9 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[MTSWiFiScanResult band](self, "band"));
  unint64_t v10 = v8 ^ [v9 hash];

  return v10;
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
    unsigned __int8 v7 = [(MTSWiFiScanResult *)self ssid];
    uint64_t v8 = [v6 ssid];
    if ([v7 isEqual:v8])
    {
      BOOL v9 = [(MTSWiFiScanResult *)self rssi];
      unint64_t v10 = [v6 rssi];
      if ([v9 isEqual:v10]
        && (int v11 = -[MTSWiFiScanResult security](self, "security"), v11 == [v6 security]))
      {
        int v12 = [(MTSWiFiScanResult *)self band];
        BOOL v13 = v12 == [v6 band];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (MTSWiFiScanResult)initWithSSID:(id)a3 rssi:(id)a4 security:(unsigned __int8)a5 band:(unsigned __int8)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  int v12 = v11;
  if (!v11)
  {
LABEL_7:
    v17 = (void *)_HMFPreconditionFailure();
    return (MTSWiFiScanResult *)+[MTSWiFiScanResult supportsSecureCoding];
  }
  v19.receiver = self;
  v19.super_class = (Class)MTSWiFiScanResult;
  BOOL v13 = [(MTSWiFiScanResult *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    ssid = v13->_ssid;
    v13->_ssid = (NSData *)v14;

    objc_storeStrong((id *)&v13->_rssi, a4);
    v13->_security = a5;
    v13->_band = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end