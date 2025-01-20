@interface HAPBLEAccessoryCache
+ (BOOL)supportsSecureCoding;
+ (int64_t)currentDiscoveryVersion;
- (BOOL)isEqual:(id)a3;
- (HAPBLEAccessoryCache)initWithCoder:(id)a3;
- (HAPBLEAccessoryCache)initWithPairingIdentifier:(id)a3;
- (HAPBLEPeripheralInfo)peripheralInfo;
- (NSMutableArray)cachedServices;
- (NSNumber)lastKeyBagIdentityIndexFailingPV;
- (NSNumber)metadataVersion;
- (NSString)pairingIdentifier;
- (id)description;
- (id)getCachedServiceWithUUID:(id)a3;
- (id)saveBlock;
- (int64_t)discoveryVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)save;
- (void)setDiscoveryVersion:(int64_t)a3;
- (void)setLastKeyBagIdentityIndexFailingPV:(id)a3;
- (void)setPeripheralInfo:(id)a3;
- (void)setSaveBlock:(id)a3;
- (void)updateCurrentPairingIdentityIndexIfNeededForKeyBag:(id)a3;
- (void)updateWithPeripheralInfo:(id)a3;
- (void)updateWithService:(id)a3;
@end

@implementation HAPBLEAccessoryCache

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveBlock, 0);
  objc_storeStrong((id *)&self->_lastKeyBagIdentityIndexFailingPV, 0);
  objc_storeStrong((id *)&self->_cachedServices, 0);
  objc_storeStrong((id *)&self->_peripheralInfo, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);

  objc_storeStrong((id *)&self->_metadataVersion, 0);
}

- (void)setSaveBlock:(id)a3
{
}

- (id)saveBlock
{
  return self->_saveBlock;
}

- (void)setDiscoveryVersion:(int64_t)a3
{
  self->_discoveryVersion = a3;
}

- (int64_t)discoveryVersion
{
  return self->_discoveryVersion;
}

- (NSNumber)lastKeyBagIdentityIndexFailingPV
{
  return self->_lastKeyBagIdentityIndexFailingPV;
}

- (NSMutableArray)cachedServices
{
  return self->_cachedServices;
}

- (void)setPeripheralInfo:(id)a3
{
}

- (HAPBLEPeripheralInfo)peripheralInfo
{
  return self->_peripheralInfo;
}

- (NSString)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (NSNumber)metadataVersion
{
  return self->_metadataVersion;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = [(HAPBLEAccessoryCache *)self cachedServices];
  v5 = objc_msgSend(v3, "stringWithFormat:", @"\n\nList of Services: %tu\n", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(HAPBLEAccessoryCache *)self cachedServices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      v11 = v5;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v5 = [v11 stringByAppendingFormat:@"%@", *(void *)(*((void *)&v16 + 1) + 8 * v10)];

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v12 = NSString;
  v13 = [(HAPBLEAccessoryCache *)self peripheralInfo];
  v14 = [v12 stringWithFormat:@"%@ %@", v13, v5];

  return v14;
}

- (void)updateCurrentPairingIdentityIndexIfNeededForKeyBag:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HAPBLEAccessoryCache *)self lastKeyBagIdentityIndexFailingPV];

  if (v5)
  {
    v6 = [(HAPBLEAccessoryCache *)self lastKeyBagIdentityIndexFailingPV];
    uint64_t v7 = [v6 longLongValue] + 1;

    if ([v4 isValidIndex:v7])
    {
      uint64_t v8 = (void *)MEMORY[0x1D944E080]();
      uint64_t v9 = self;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        v12 = [NSNumber numberWithInteger:v7];
        v13 = [(HAPBLEAccessoryCache *)v9 pairingIdentifier];
        int v16 = 138543874;
        long long v17 = v11;
        __int16 v18 = 2114;
        long long v19 = v12;
        __int16 v20 = 2114;
        uint64_t v21 = v13;
        _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating keybag identity index to %{public}@ for %{public}@.", (uint8_t *)&v16, 0x20u);
      }
      uint64_t v14 = [v4 getCurrentIndexInBag];
      [v4 setCurrentIndexInBag:v7];
      v15 = [v4 currentIdentity];

      if (!v15) {
        [v4 setCurrentIndexInBag:v14];
      }
    }
  }
}

- (void)setLastKeyBagIdentityIndexFailingPV:(id)a3
{
  id v5 = a3;
  if ((HMFEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastKeyBagIdentityIndexFailingPV, a3);
    [(HAPBLEAccessoryCache *)self save];
  }
}

- (void)save
{
  v2 = [(HAPBLEAccessoryCache *)self saveBlock];
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (void)updateWithService:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HAPBLEAccessoryCache *)self cachedServices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 isEqual:v4])
        {
          [v10 updateWithService:v4];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v5 = [(HAPBLEAccessoryCache *)self cachedServices];
  [v5 addObject:v4];
LABEL_11:
}

- (id)getCachedServiceWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HAPBLEAccessoryCache *)self cachedServices];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 serviceUUID];
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (HAPBLEAccessoryCache)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HAPBLEAccessoryCache;
  id v5 = [(HAPBLEAccessoryCache *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MV"];
    metadataVersion = v5->_metadataVersion;
    v5->_metadataVersion = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PI"];
    pairingIdentifier = v5->_pairingIdentifier;
    v5->_pairingIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PIN"];
    peripheralInfo = v5->_peripheralInfo;
    v5->_peripheralInfo = (HAPBLEPeripheralInfo *)v10;

    long long v12 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    long long v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"CS"];
    cachedServices = v5->_cachedServices;
    v5->_cachedServices = (NSMutableArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PVX"];
    lastKeyBagIdentityIndexFailingPV = v5->_lastKeyBagIdentityIndexFailingPV;
    v5->_lastKeyBagIdentityIndexFailingPV = (NSNumber *)v17;

    v5->_discoveryVersion = [v4 decodeIntegerForKey:@"DV"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(HAPBLEAccessoryCache *)self pairingIdentifier];
  [v9 encodeObject:v4 forKey:@"PI"];

  id v5 = [(HAPBLEAccessoryCache *)self peripheralInfo];
  [v9 encodeObject:v5 forKey:@"PIN"];

  uint64_t v6 = [(HAPBLEAccessoryCache *)self cachedServices];
  [v9 encodeObject:v6 forKey:@"CS"];

  uint64_t v7 = [(HAPBLEAccessoryCache *)self metadataVersion];
  [v9 encodeObject:v7 forKey:@"MV"];

  uint64_t v8 = [(HAPBLEAccessoryCache *)self lastKeyBagIdentityIndexFailingPV];
  [v9 encodeObject:v8 forKey:@"PVX"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[HAPBLEAccessoryCache discoveryVersion](self, "discoveryVersion"), @"DV");
}

- (void)updateWithPeripheralInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPBLEAccessoryCache *)self peripheralInfo];
  id v7 = [v5 accessoryName];

  [(HAPBLEAccessoryCache *)self setPeripheralInfo:v4];
  uint64_t v6 = [(HAPBLEAccessoryCache *)self peripheralInfo];
  [v6 updateAccessoryName:v7];
}

- (unint64_t)hash
{
  v2 = [(HAPBLEAccessoryCache *)self pairingIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HAPBLEAccessoryCache *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(HAPBLEAccessoryCache *)self pairingIdentifier];
      id v7 = [(HAPBLEAccessoryCache *)v5 pairingIdentifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (HAPBLEAccessoryCache)initWithPairingIdentifier:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HAPBLEAccessoryCache;
  uint64_t v6 = [(HAPBLEAccessoryCache *)&v12 init];
  if (v6)
  {
    uint64_t v7 = HAPGetHAPMetadataVersion();
    metadataVersion = v6->_metadataVersion;
    v6->_metadataVersion = (NSNumber *)v7;

    objc_storeStrong((id *)&v6->_pairingIdentifier, a3);
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    cachedServices = v6->_cachedServices;
    v6->_cachedServices = (NSMutableArray *)v9;
  }
  return v6;
}

+ (int64_t)currentDiscoveryVersion
{
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  return HAPIsHH2Enabled_hh2Enabled;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end