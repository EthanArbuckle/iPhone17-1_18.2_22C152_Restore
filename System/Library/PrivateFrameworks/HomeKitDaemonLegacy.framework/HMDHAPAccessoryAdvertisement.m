@interface HMDHAPAccessoryAdvertisement
- (BOOL)isEqual:(id)a3;
- (BOOL)pairingPresent;
- (HMDHAPAccessoryAdvertisement)initWithIdentifier:(id)a3 name:(id)a4 categoryIdentifier:(id)a5 pairingPresent:(BOOL)a6 setupHash:(id)a7;
- (NSData)setupHash;
- (id)description;
- (unint64_t)hash;
- (void)setSetupHash:(id)a3;
@end

@implementation HMDHAPAccessoryAdvertisement

- (void).cxx_destruct
{
}

- (void)setSetupHash:(id)a3
{
}

- (NSData)setupHash
{
  return self->_setupHash;
}

- (BOOL)pairingPresent
{
  return self->_pairingPresent;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDHAPAccessoryAdvertisement *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMDAccessoryAdvertisement *)self identifier];
      v8 = [(HMDAccessoryAdvertisement *)v6 identifier];
      if ([v7 isEqual:v8])
      {
        v9 = [(HMDHAPAccessoryAdvertisement *)self setupHash];
        v10 = [(HMDHAPAccessoryAdvertisement *)v6 setupHash];
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
  }
  return v11;
}

- (unint64_t)hash
{
  v3 = [(HMDAccessoryAdvertisement *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(HMDHAPAccessoryAdvertisement *)self setupHash];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)HMDHAPAccessoryAdvertisement;
  uint64_t v4 = [(HMDAccessoryAdvertisement *)&v9 description];
  [(HMDHAPAccessoryAdvertisement *)self pairingPresent];
  v5 = HMFBooleanToString();
  unint64_t v6 = [(HMDHAPAccessoryAdvertisement *)self setupHash];
  v7 = [v3 stringWithFormat:@"[ %@, pairingPresent: %@, setupHash = %@]", v4, v5, v6];

  return v7;
}

- (HMDHAPAccessoryAdvertisement)initWithIdentifier:(id)a3 name:(id)a4 categoryIdentifier:(id)a5 pairingPresent:(BOOL)a6 setupHash:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = +[HMDHAPMetadata getSharedInstance];
  v16 = [v15 categoryForIdentifier:v12];

  if (!v16)
  {
    v16 = [v15 categoryForOther];
  }
  id v17 = objc_alloc(MEMORY[0x1E4F2E520]);
  v18 = [v16 uuidStr];
  v19 = [v16 catDescription];
  v20 = (void *)[v17 initWithType:v18 name:v19];

  v21 = [MEMORY[0x1E4F2E7B0] cachedInstanceForHMAccessoryCategory:v20];

  v24.receiver = self;
  v24.super_class = (Class)HMDHAPAccessoryAdvertisement;
  v22 = [(HMDAccessoryAdvertisement *)&v24 initWithIdentifier:v14 name:v13 category:v21];

  return v22;
}

@end