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
  BOOL v3 = [(HMFWoWLANInfo *)self supportsSleepConfig];
  v4 = NSString;
  if (v3)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[HMFWoWLANInfo version](self, "version"));
    v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMFWoWLANInfo wakeType](self, "wakeType"));
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[HMFWoWLANInfo wakePort](self, "wakePort"));
    v8 = [(HMFWoWLANInfo *)self wakeAddressString];
    v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMFWoWLANInfo wakePacketType](self, "wakePacketType"));
    v10 = [v4 stringWithFormat:@"<Version: %@, Wake Type: %@, Wake Port: %@, Wake Address: %@, Wake Packet Type: %@>", v5, v6, v7, v8, v9];
  }
  else
  {
    v5 = [(HMFWoWLANInfo *)self primaryMACAddress];
    v6 = [(HMFWoWLANInfo *)self additionalMACAddresses];
    v10 = [v4 stringWithFormat:@"<Primary Address: %@, Additional MAC Addresses: %@>", v5, v6];
  }

  return v10;
}

- (NSString)wakeAddressString
{
  if ([(HMFWoWLANInfo *)self supportsSleepConfig]
    && [(HMFWoWLANInfo *)self wakePacketType] == 1)
  {
    BOOL v3 = [(HMFWoWLANInfo *)self wakeAddress];

    if (v3)
    {
      id v4 = objc_alloc(MEMORY[0x263F42558]);
      v5 = [(HMFWoWLANInfo *)self wakeAddress];
      v6 = (void *)[v4 initWithAddressData:v5];

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
          uint64_t v11 = [v10 bytes];
          uint64_t v12 = 0;
          while (*(unsigned __int8 *)(v11 + v12) == 255)
          {
            if (++v12 == 6)
            {
              for (uint64_t i = 0; i != 6; ++i)
                v20[i] = *(unsigned char *)(v11 + 6 + i);
              uint64_t v14 = v11 + 6;
              uint64_t v15 = 1;
LABEL_20:
              uint64_t v16 = 0;
              while (*(unsigned __int8 *)(v14 + v16) == v20[v16])
              {
                if (++v16 == 6)
                {
                  ++v15;
                  v14 += 6;
                  if (v15 != 16) {
                    goto LABEL_20;
                  }
                  id v17 = objc_alloc(MEMORY[0x263F42558]);
                  v18 = [MEMORY[0x263EFF8F8] dataWithBytes:v20 length:6];
                  v19 = (void *)[v17 initWithAddressData:v18];

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
    unsigned __int16 v5 = [v4 decodeIntegerForKey:@"HMFCI.woWLAN.WakePort"];
    unsigned __int8 v6 = [v4 decodeIntegerForKey:@"HMFCI.woWLAN.version"];
    uint64_t v7 = [v4 decodeIntegerForKey:@"HMFCI.woWLAN.wakeType"];
    uint64_t v8 = [v4 decodeIntegerForKey:@"HMFCI.woWLAN.wakePacketType"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFCI.woWLAN.wakePattern"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFCI.woWLAN.WakeAddress"];

    uint64_t v11 = [(HMFWoWLANInfo *)self initWithWakeVersion:v6 wakePort:v5 wakeAddress:v10 wakeType:v7 wakePacketType:v8 wakePattern:v9];
  }
  else
  {
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFCI.woWLAN.pID"];
    v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"HMFCI.woWLAN.sIDs"];

    uint64_t v11 = [(HMFWoWLANInfo *)self initWithPrimaryIdentifier:v9 wifiIdentifiers:v10];
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
    uint64_t v7 = [(HMFWoWLANInfo *)self additionalMACAddresses];
    [v12 encodeObject:v7 forKey:@"HMFCI.woWLAN.sIDs"];
  }
  if ([(HMFWoWLANInfo *)self supportsSleepConfig])
  {
    [v12 encodeBool:1 forKey:@"HMFCI.woWLAN.sleepConfig"];
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo version](self, "version"), @"HMFCI.woWLAN.version");
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo wakePort](self, "wakePort"), @"HMFCI.woWLAN.WakePort");
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo wakeType](self, "wakeType"), @"HMFCI.woWLAN.wakeType");
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo wakePacketType](self, "wakePacketType"), @"HMFCI.woWLAN.wakePacketType");
    uint64_t v8 = [(HMFWoWLANInfo *)self wakeAddress];

    if (v8)
    {
      id v9 = [(HMFWoWLANInfo *)self wakeAddress];
      [v12 encodeObject:v9 forKey:@"HMFCI.woWLAN.WakeAddress"];
    }
    v10 = [(HMFWoWLANInfo *)self wakePattern];

    if (v10)
    {
      uint64_t v11 = [(HMFWoWLANInfo *)self wakePattern];
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
    uint64_t v7 = [(HMFWoWLANInfo *)self primaryMACAddress];
    uint64_t v8 = [(HMFWoWLANInfo *)v6 primaryMACAddress];
    int v9 = HMFEqualObjects();

    if (!v9) {
      goto LABEL_15;
    }
    v10 = [(HMFWoWLANInfo *)self additionalMACAddresses];
    uint64_t v11 = [(HMFWoWLANInfo *)v6 additionalMACAddresses];
    int v12 = HMFEqualObjects();

    if (!v12) {
      goto LABEL_15;
    }
    int v13 = [(HMFWoWLANInfo *)self version];
    if (v13 != [(HMFWoWLANInfo *)v6 version]) {
      goto LABEL_15;
    }
    int64_t v14 = [(HMFWoWLANInfo *)self wakeType];
    if (v14 != [(HMFWoWLANInfo *)v6 wakeType]) {
      goto LABEL_15;
    }
    int v15 = [(HMFWoWLANInfo *)self wakePort];
    if (v15 != [(HMFWoWLANInfo *)v6 wakePort]) {
      goto LABEL_15;
    }
    int64_t v16 = [(HMFWoWLANInfo *)self wakePacketType];
    if (v16 != [(HMFWoWLANInfo *)v6 wakePacketType]) {
      goto LABEL_15;
    }
    BOOL v17 = [(HMFWoWLANInfo *)self supportsSleepConfig];
    if (v17 != [(HMFWoWLANInfo *)v6 supportsSleepConfig]) {
      goto LABEL_15;
    }
    v18 = [(HMFWoWLANInfo *)self wakePattern];
    v19 = [(HMFWoWLANInfo *)v6 wakePattern];
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
    int64_t v5 = v4 ^ [(HMFWoWLANInfo *)self wakePacketType] ^ v3;
    uint64_t v6 = [(HMFWoWLANInfo *)self wakePort];
    uint64_t v7 = [(HMFWoWLANInfo *)self wakePattern];
    uint64_t v8 = v5 ^ v6 ^ [v7 hash];
    int v9 = [(HMFWoWLANInfo *)self wakeAddress];
    unint64_t v10 = v8 ^ [v9 hash];
  }
  else
  {
    uint64_t v7 = [(HMFWoWLANInfo *)self primaryMACAddress];
    unint64_t v10 = [v7 hash];
  }

  return v10;
}

- (HMFWoWLANInfo)initWithWakeVersion:(unsigned __int8)a3 wakePort:(unsigned __int16)a4 wakeAddress:(id)a5 wakeType:(int64_t)a6 wakePacketType:(int64_t)a7 wakePattern:(id)a8
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v15 = a5;
  id v16 = a8;
  if (v15)
  {
    v25.receiver = self;
    v25.super_class = (Class)HMFWoWLANInfo;
    BOOL v17 = [(HMFWoWLANInfo *)&v25 init];
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
    v19 = v18;
    int v20 = v19;
  }
  else
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v19 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      char v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid wake address", buf, 0xCu);
    }
    int v20 = 0;
  }

  return v20;
}

- (HMFWoWLANInfo)initWithPrimaryIdentifier:(id)a3 wifiIdentifiers:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v7 || [v8 count])
  {
    v17.receiver = self;
    v17.super_class = (Class)HMFWoWLANInfo;
    unint64_t v10 = [(HMFWoWLANInfo *)&v17 init];
    p_isa = (id *)&v10->super.super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_primaryMACAddress, a3);
      objc_storeStrong(p_isa + 3, a4);
    }
    self = p_isa;
    int v12 = self;
  }
  else
  {
    int64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v19 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalid inputs for HMFWoWLANInfo.", buf, 0xCu);
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