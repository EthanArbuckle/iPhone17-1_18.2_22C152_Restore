@interface MTSThreadScanResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MTSThreadScanResult)initWithCoder:(id)a3;
- (MTSThreadScanResult)initWithNetworkName:(id)a3 panID:(id)a4 extendedPANID:(id)a5 channel:(id)a6 extendedAddress:(id)a7 rssi:(id)a8 version:(id)a9 lqi:(id)a10;
- (NSData)extendedAddress;
- (NSNumber)channel;
- (NSNumber)extendedPANID;
- (NSNumber)lqi;
- (NSNumber)panID;
- (NSNumber)rssi;
- (NSNumber)version;
- (NSString)networkName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTSThreadScanResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lqi, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_extendedAddress, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_extendedPANID, 0);
  objc_storeStrong((id *)&self->_panID, 0);

  objc_storeStrong((id *)&self->_networkName, 0);
}

- (NSNumber)lqi
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)rssi
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)extendedAddress
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)channel
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)extendedPANID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)panID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)networkName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MTSThreadScanResult *)self networkName];
  [v4 encodeObject:v5 forKey:@"MTSTSR.ck.networkName"];

  v6 = [(MTSThreadScanResult *)self panID];
  [v4 encodeObject:v6 forKey:@"MTSTSR.ck.panID"];

  v7 = [(MTSThreadScanResult *)self extendedPANID];
  [v4 encodeObject:v7 forKey:@"MTSTSR.ck.extendedPANID"];

  v8 = [(MTSThreadScanResult *)self channel];
  [v4 encodeObject:v8 forKey:@"MTSTSR.ck.channel"];

  v9 = [(MTSThreadScanResult *)self extendedAddress];
  [v4 encodeObject:v9 forKey:@"MTSTSR.ck.extendedAddress"];

  v10 = [(MTSThreadScanResult *)self rssi];
  [v4 encodeObject:v10 forKey:@"MTSTSR.ck.rssi"];

  v11 = [(MTSThreadScanResult *)self version];
  [v4 encodeObject:v11 forKey:@"MTSTSR.ck.version"];

  id v12 = [(MTSThreadScanResult *)self lqi];
  [v4 encodeObject:v12 forKey:@"MTSTSR.ck.lqi"];
}

- (MTSThreadScanResult)initWithCoder:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MTSTSR.ck.networkName"];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MTSTSR.ck.panID"];
  uint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MTSTSR.ck.extendedPANID"];
  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MTSTSR.ck.channel"];
  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MTSTSR.ck.extendedAddress"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MTSTSR.ck.rssi"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MTSTSR.ck.version"];
  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MTSTSR.ck.lqi"];
  id v12 = (void *)v8;
  v13 = (void *)v7;
  v14 = (void *)v6;
  v15 = (void *)v5;
  v16 = (void *)v4;
  v17 = (void *)v11;
  if (v16 && v15 && v14 && v13 && v12 && v9 && v10 && v11)
  {
    v18 = [(MTSThreadScanResult *)self initWithNetworkName:v16 panID:v15 extendedPANID:v14 channel:v13 extendedAddress:v12 rssi:v9 version:v10 lqi:v11];
    v25 = v18;
  }
  else
  {
    v23 = v10;
    context = (void *)MEMORY[0x245697870]();
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138545410;
      v28 = v26;
      __int16 v29 = 2112;
      v30 = v16;
      __int16 v31 = 2112;
      v32 = v15;
      __int16 v33 = 2112;
      v34 = v14;
      __int16 v35 = 2112;
      v36 = v13;
      __int16 v37 = 2112;
      v38 = v12;
      __int16 v39 = 2112;
      v40 = v9;
      __int16 v41 = 2112;
      v42 = v23;
      __int16 v43 = 2112;
      v44 = v17;
      _os_log_impl(&dword_2450FD000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded networkName: %@, panID: %@, extendedPANID: %@, channel: %@, extendedAddress: %@, rssi: %@, version: %@, lqi: %@", buf, 0x5Cu);
    }
    v25 = v19;

    v18 = 0;
    v10 = v23;
  }

  return v18;
}

- (unint64_t)hash
{
  id v3 = [(MTSThreadScanResult *)self panID];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(MTSThreadScanResult *)self extendedPANID];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(MTSThreadScanResult *)self networkName];
  uint64_t v8 = [v7 hash];
  v9 = [(MTSThreadScanResult *)self channel];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(MTSThreadScanResult *)self extendedAddress];
  uint64_t v12 = [v11 hash];
  v13 = [(MTSThreadScanResult *)self rssi];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(MTSThreadScanResult *)self version];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  v17 = [(MTSThreadScanResult *)self lqi];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    uint64_t v7 = [(MTSThreadScanResult *)self networkName];
    uint64_t v8 = [v6 networkName];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(MTSThreadScanResult *)self panID];
      uint64_t v10 = [v6 panID];
      if ([v9 isEqualToNumber:v10])
      {
        uint64_t v11 = [(MTSThreadScanResult *)self extendedPANID];
        uint64_t v12 = [v6 extendedPANID];
        if ([v11 isEqualToNumber:v12])
        {
          v13 = [(MTSThreadScanResult *)self channel];
          __int16 v29 = [v6 channel];
          v30 = v13;
          if ([v13 isEqualToNumber:v29])
          {
            uint64_t v14 = [(MTSThreadScanResult *)self extendedAddress];
            v27 = [v6 extendedAddress];
            v28 = v14;
            if ([v14 isEqualToData:v27])
            {
              v15 = [(MTSThreadScanResult *)self rssi];
              v25 = [v6 rssi];
              v26 = v15;
              if ([v15 isEqualToNumber:v25])
              {
                uint64_t v16 = [(MTSThreadScanResult *)self version];
                uint64_t v17 = [v6 version];
                v24 = (void *)v16;
                unint64_t v18 = (void *)v16;
                v19 = (void *)v17;
                if ([v18 isEqualToNumber:v17])
                {
                  v23 = [(MTSThreadScanResult *)self lqi];
                  v22 = [v6 lqi];
                  char v20 = [v23 isEqualToNumber:v22];
                }
                else
                {
                  char v20 = 0;
                }
              }
              else
              {
                char v20 = 0;
              }
            }
            else
            {
              char v20 = 0;
            }
          }
          else
          {
            char v20 = 0;
          }
        }
        else
        {
          char v20 = 0;
        }
      }
      else
      {
        char v20 = 0;
      }
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (MTSThreadScanResult)initWithNetworkName:(id)a3 panID:(id)a4 extendedPANID:(id)a5 channel:(id)a6 extendedAddress:(id)a7 rssi:(id)a8 version:(id)a9 lqi:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v34 = a5;
  id obj = a6;
  id v33 = a6;
  id v18 = a7;
  id v32 = a8;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v17)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v34)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v33)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v18)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v19)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v20)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  v22 = v21;
  if (!v21)
  {
LABEL_19:
    __int16 v29 = (void *)_HMFPreconditionFailure();
    return (MTSThreadScanResult *)+[MTSThreadScanResult supportsSecureCoding];
  }
  v35.receiver = self;
  v35.super_class = (Class)MTSThreadScanResult;
  v23 = [(MTSThreadScanResult *)&v35 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    networkName = v23->_networkName;
    v23->_networkName = (NSString *)v24;

    objc_storeStrong((id *)&v23->_panID, a4);
    objc_storeStrong((id *)&v23->_extendedPANID, a5);
    objc_storeStrong((id *)&v23->_channel, obj);
    uint64_t v26 = [v18 copy];
    extendedAddress = v23->_extendedAddress;
    v23->_extendedAddress = (NSData *)v26;

    objc_storeStrong((id *)&v23->_rssi, v32);
    objc_storeStrong((id *)&v23->_version, a9);
    objc_storeStrong((id *)&v23->_lqi, a10);
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end