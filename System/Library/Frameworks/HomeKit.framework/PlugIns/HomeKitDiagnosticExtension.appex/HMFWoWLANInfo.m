@interface HMFWoWLANInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsSleepConfig;
- (HMFWoWLANInfo)initWithCoder:(id)a3;
- (HMFWoWLANInfo)initWithPrimaryIdentifier:(id)a3 wifiIdentifiers:(id)a4;
- (HMFWoWLANInfo)initWithWakeVersion:(unsigned __int8)a3 wakePort:(unsigned __int16)a4 wakeAddress:(id)a5 wakeType:(int64_t)a6 wakePacketType:(int64_t)a7 wakePattern:(id)a8;
- (NSArray)additionalMACAddresses;
- (NSData)primaryMACAddress;
- (NSData)wakeAddress;
- (NSData)wakePattern;
- (NSString)wakeAddressString;
- (id)description;
- (int64_t)wakePacketType;
- (int64_t)wakeType;
- (unint64_t)hash;
- (unsigned)version;
- (unsigned)wakePort;
- (void)encodeWithCoder:(id)a3;
- (void)setWakeAddress:(id)a3;
- (void)setWakePattern:(id)a3;
@end

@implementation HMFWoWLANInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakePattern, 0);
  objc_storeStrong((id *)&self->_wakeAddress, 0);
  objc_storeStrong((id *)&self->_additionalMACAddresses, 0);

  objc_storeStrong((id *)&self->_primaryMACAddress, 0);
}

- (void)setWakePattern:(id)a3
{
}

- (NSData)wakePattern
{
  return self->_wakePattern;
}

- (unsigned)version
{
  return self->_version;
}

- (int64_t)wakePacketType
{
  return self->_wakePacketType;
}

- (int64_t)wakeType
{
  return self->_wakeType;
}

- (void)setWakeAddress:(id)a3
{
}

- (NSData)wakeAddress
{
  return self->_wakeAddress;
}

- (unsigned)wakePort
{
  return self->_wakePort;
}

- (BOOL)supportsSleepConfig
{
  return self->_supportsSleepConfig;
}

- (NSArray)additionalMACAddresses
{
  return self->_additionalMACAddresses;
}

- (NSData)primaryMACAddress
{
  return self->_primaryMACAddress;
}

- (id)description
{
  if ([(HMFWoWLANInfo *)self supportsSleepConfig])
  {
    v3 = +[NSNumber numberWithUnsignedChar:[(HMFWoWLANInfo *)self version]];
    v4 = +[NSNumber numberWithInteger:[(HMFWoWLANInfo *)self wakeType]];
    v5 = +[NSNumber numberWithUnsignedShort:[(HMFWoWLANInfo *)self wakePort]];
    v6 = [(HMFWoWLANInfo *)self wakeAddressString];
    v7 = +[NSNumber numberWithInteger:[(HMFWoWLANInfo *)self wakePacketType]];
    v8 = +[NSString stringWithFormat:@"<Version: %@, Wake Type: %@, Wake Port: %@, Wake Address: %@, Wake Packet Type: %@>", v3, v4, v5, v6, v7];
  }
  else
  {
    v3 = [(HMFWoWLANInfo *)self primaryMACAddress];
    v4 = [(HMFWoWLANInfo *)self additionalMACAddresses];
    v8 = +[NSString stringWithFormat:@"<Primary Address: %@, Additional MAC Addresses: %@>", v3, v4];
  }

  return v8;
}

- (NSString)wakeAddressString
{
  if ([(HMFWoWLANInfo *)self supportsSleepConfig]
    && (id)[(HMFWoWLANInfo *)self wakePacketType] == (id)1)
  {
    v3 = [(HMFWoWLANInfo *)self wakeAddress];

    if (v3)
    {
      id v4 = objc_alloc((Class)HMFMACAddress);
      v5 = [(HMFWoWLANInfo *)self wakeAddress];
      id v6 = [v4 initWithAddressData:v5];

      v7 = [v6 formattedString];
    }
    else
    {
      v7 = [(HMFWoWLANInfo *)self wakePattern];

      if (v7)
      {
        id v9 = [(HMFWoWLANInfo *)self wakePattern];
        v10 = v9;
        if (v9 && (unint64_t)[v9 length] >= 0x66)
        {
          v11 = [v10 bytes];
          uint64_t v12 = 0;
          while (v11[v12] == 255)
          {
            if (++v12 == 6)
            {
              for (uint64_t i = 0; i != 6; ++i)
                v20[i] = v11[i + 6];
              v14 = v11 + 6;
              uint64_t v15 = 1;
LABEL_20:
              uint64_t v16 = 0;
              while (v14[v16] == v20[v16])
              {
                if (++v16 == 6)
                {
                  ++v15;
                  v14 += 6;
                  if (v15 != 16) {
                    goto LABEL_20;
                  }
                  id v17 = objc_alloc((Class)HMFMACAddress);
                  v18 = +[NSData dataWithBytes:v20 length:6];
                  id v19 = [v17 initWithAddressData:v18];

                  v7 = [v19 formattedString];

                  goto LABEL_13;
                }
              }
              break;
            }
          }
        }
        v7 = 0;
LABEL_13:
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (HMFWoWLANInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeBoolForKey:@"HMFCI.woWLAN.sleepConfig"])
  {
    unsigned __int16 v5 = (unsigned __int16)[v4 decodeIntegerForKey:@"HMFCI.woWLAN.WakePort"];
    unsigned __int8 v6 = [v4 decodeIntegerForKey:@"HMFCI.woWLAN.version"];
    id v7 = [v4 decodeIntegerForKey:@"HMFCI.woWLAN.wakeType"];
    id v8 = [v4 decodeIntegerForKey:@"HMFCI.woWLAN.wakePacketType"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFCI.woWLAN.wakePattern"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFCI.woWLAN.WakeAddress"];

    v11 = [(HMFWoWLANInfo *)self initWithWakeVersion:v6 wakePort:v5 wakeAddress:v10 wakeType:v7 wakePacketType:v8 wakePattern:v9];
  }
  else
  {
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFCI.woWLAN.pID"];
    v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"HMFCI.woWLAN.sIDs"];

    v11 = [(HMFWoWLANInfo *)self initWithPrimaryIdentifier:v9 wifiIdentifiers:v10];
  }
  uint64_t v12 = v11;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(HMFWoWLANInfo *)self primaryMACAddress];

  if (v4)
  {
    unsigned __int16 v5 = [(HMFWoWLANInfo *)self primaryMACAddress];
    [v12 encodeObject:v5 forKey:@"HMFCI.woWLAN.pID"];
  }
  unsigned __int8 v6 = [(HMFWoWLANInfo *)self additionalMACAddresses];

  if (v6)
  {
    id v7 = [(HMFWoWLANInfo *)self additionalMACAddresses];
    [v12 encodeObject:v7 forKey:@"HMFCI.woWLAN.sIDs"];
  }
  if ([(HMFWoWLANInfo *)self supportsSleepConfig])
  {
    [v12 encodeBool:1 forKey:@"HMFCI.woWLAN.sleepConfig"];
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo version](self, "version"), @"HMFCI.woWLAN.version");
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo wakePort](self, "wakePort"), @"HMFCI.woWLAN.WakePort");
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo wakeType](self, "wakeType"), @"HMFCI.woWLAN.wakeType");
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo wakePacketType](self, "wakePacketType"), @"HMFCI.woWLAN.wakePacketType");
    id v8 = [(HMFWoWLANInfo *)self wakeAddress];

    if (v8)
    {
      id v9 = [(HMFWoWLANInfo *)self wakeAddress];
      [v12 encodeObject:v9 forKey:@"HMFCI.woWLAN.WakeAddress"];
    }
    v10 = [(HMFWoWLANInfo *)self wakePattern];

    if (v10)
    {
      v11 = [(HMFWoWLANInfo *)self wakePattern];
      [v12 encodeObject:v11 forKey:@"HMFCI.woWLAN.wakePattern"];
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMFWoWLANInfo *)a3;
  if (self == v4)
  {
    char v23 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int16 v5 = v4;
    }
    else {
      unsigned __int16 v5 = 0;
    }
    unsigned __int8 v6 = v5;
    if (!v6) {
      goto LABEL_15;
    }
    id v7 = [(HMFWoWLANInfo *)self primaryMACAddress];
    id v8 = [(HMFWoWLANInfo *)v6 primaryMACAddress];
    int v9 = HMFEqualObjects();

    if (!v9) {
      goto LABEL_15;
    }
    v10 = [(HMFWoWLANInfo *)self additionalMACAddresses];
    v11 = [(HMFWoWLANInfo *)v6 additionalMACAddresses];
    int v12 = HMFEqualObjects();

    if (!v12) {
      goto LABEL_15;
    }
    unsigned int v13 = [(HMFWoWLANInfo *)self version];
    if (v13 != [(HMFWoWLANInfo *)v6 version]) {
      goto LABEL_15;
    }
    id v14 = [(HMFWoWLANInfo *)self wakeType];
    if (v14 != (id)[(HMFWoWLANInfo *)v6 wakeType]) {
      goto LABEL_15;
    }
    unsigned int v15 = [(HMFWoWLANInfo *)self wakePort];
    if (v15 != [(HMFWoWLANInfo *)v6 wakePort]) {
      goto LABEL_15;
    }
    id v16 = [(HMFWoWLANInfo *)self wakePacketType];
    if (v16 != (id)[(HMFWoWLANInfo *)v6 wakePacketType]) {
      goto LABEL_15;
    }
    unsigned int v17 = [(HMFWoWLANInfo *)self supportsSleepConfig];
    if (v17 != [(HMFWoWLANInfo *)v6 supportsSleepConfig]) {
      goto LABEL_15;
    }
    v18 = [(HMFWoWLANInfo *)self wakePattern];
    id v19 = [(HMFWoWLANInfo *)v6 wakePattern];
    int v20 = HMFEqualObjects();

    if (v20)
    {
      v21 = [(HMFWoWLANInfo *)self wakeAddress];
      v22 = [(HMFWoWLANInfo *)v6 wakeAddress];
      char v23 = HMFEqualObjects();
    }
    else
    {
LABEL_15:
      char v23 = 0;
    }
  }
  return v23;
}

- (unint64_t)hash
{
  if ([(HMFWoWLANInfo *)self supportsSleepConfig])
  {
    uint64_t v3 = [(HMFWoWLANInfo *)self version];
    int64_t v4 = [(HMFWoWLANInfo *)self wakeType];
    unint64_t v5 = v4 ^ [(HMFWoWLANInfo *)self wakePacketType] ^ v3;
    uint64_t v6 = [(HMFWoWLANInfo *)self wakePort];
    id v7 = [(HMFWoWLANInfo *)self wakePattern];
    unint64_t v8 = v5 ^ v6 ^ (unint64_t)[v7 hash];
    int v9 = [(HMFWoWLANInfo *)self wakeAddress];
    id v10 = (id)(v8 ^ (unint64_t)[v9 hash]);
  }
  else
  {
    id v7 = [(HMFWoWLANInfo *)self primaryMACAddress];
    id v10 = [v7 hash];
  }

  return (unint64_t)v10;
}

- (HMFWoWLANInfo)initWithWakeVersion:(unsigned __int8)a3 wakePort:(unsigned __int16)a4 wakeAddress:(id)a5 wakeType:(int64_t)a6 wakePacketType:(int64_t)a7 wakePattern:(id)a8
{
  id v15 = a5;
  id v16 = a8;
  if (v15)
  {
    v25.receiver = self;
    v25.super_class = (Class)HMFWoWLANInfo;
    unsigned int v17 = [(HMFWoWLANInfo *)&v25 init];
    v18 = v17;
    if (v17)
    {
      v17->_supportsSleepConfig = 1;
      v17->_version = a3;
      v17->_wakePort = a4;
      objc_storeStrong((id *)&v17->_wakeAddress, a5);
      v18->_wakeType = a6;
      v18->_wakePacketType = a7;
      objc_storeStrong((id *)&v18->_wakePattern, a8);
    }
    id v19 = v18;
    int v20 = v19;
  }
  else
  {
    id v19 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      char v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid wake address", buf, 0xCu);
    }
    int v20 = 0;
  }

  return v20;
}

- (HMFWoWLANInfo)initWithPrimaryIdentifier:(id)a3 wifiIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v7 || [v8 count])
  {
    v17.receiver = self;
    v17.super_class = (Class)HMFWoWLANInfo;
    id v10 = [(HMFWoWLANInfo *)&v17 init];
    v11 = (id *)v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_primaryMACAddress, a3);
      objc_storeStrong(v11 + 3, a4);
    }
    self = v11;
    int v12 = self;
  }
  else
  {
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalid inputs for HMFWoWLANInfo.", buf, 0xCu);
    }
    int v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end