@interface HMCHIPAccessoryPairing
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMCHIPAccessoryPairing)initWithCoder:(id)a3;
- (HMCHIPAccessoryPairing)initWithIdentifier:(id)a3 home:(id)a4;
- (HMCHIPHome)home;
- (NSArray)attributeDescriptions;
- (NSNumber)identifier;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)UUID;
- (NSUUID)systemCommissionerPairingUUID;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)operationalIdentity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSystemCommissionerPairingUUID:(id)a3;
@end

@implementation HMCHIPAccessoryPairing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemCommissionerPairingUUID, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setSystemCommissionerPairingUUID:(id)a3
{
}

- (NSUUID)systemCommissionerPairingUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (HMCHIPHome)home
{
  return (HMCHIPHome *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)operationalIdentity
{
  v3 = [(HMCHIPAccessoryPairing *)self home];
  v4 = [v3 ecosystem];
  v5 = [v4 rootPublicKey];

  v6 = [(HMCHIPAccessoryPairing *)self identifier];
  v7 = [[HMCHIPAccessoryOperationalIdentity alloc] initWithRootPublicKey:v5 nodeID:v6];

  return v7;
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMCHIPAccessoryPairing *)self identifier];
  v6 = (void *)[v4 initWithName:@"Identifier" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMCHIPAccessoryPairing *)self home];
  v9 = (void *)[v7 initWithName:@"Home" value:v8];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMCHIPAccessoryPairing *)self systemCommissionerPairingUUID];
  v12 = (void *)[v10 initWithName:@"System Commissioner Pairing UUID" value:v11];
  [v3 addObject:v12];

  v13 = (void *)[v3 copy];

  return (NSArray *)v13;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMCHIPAccessoryPairing)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCAP.ck.identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCAP.ck.home"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCAP.ck.systemCommissionerPairingUUID"];
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v16 = 138543874;
      v17 = v11;
      __int16 v18 = 2112;
      v19 = v5;
      __int16 v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded identifier: %@ home: %@", (uint8_t *)&v16, 0x20u);
    }
    v14 = 0;
  }
  else
  {
    v12 = [(HMCHIPAccessoryPairing *)self initWithIdentifier:v5 home:v6];
    [(HMCHIPAccessoryPairing *)v12 setSystemCommissionerPairingUUID:v7];
    v13 = v12;
    v14 = v13;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMCHIPAccessoryPairing *)self identifier];
  [v4 encodeObject:v5 forKey:@"HMCAP.ck.identifier"];

  v6 = [(HMCHIPAccessoryPairing *)self home];
  [v4 encodeObject:v6 forKey:@"HMCAP.ck.home"];

  id v7 = [(HMCHIPAccessoryPairing *)self systemCommissionerPairingUUID];
  [v4 encodeObject:v7 forKey:@"HMCAP.ck.systemCommissionerPairingUUID"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMutableCHIPAccessoryPairing allocWithZone:a3];
  v5 = [(HMCHIPAccessoryPairing *)self identifier];
  v6 = [(HMCHIPAccessoryPairing *)self home];
  id v7 = [(HMCHIPAccessoryPairing *)v4 initWithIdentifier:v5 home:v6];

  BOOL v8 = [(HMCHIPAccessoryPairing *)self systemCommissionerPairingUUID];
  [(HMCHIPAccessoryPairing *)v7 setSystemCommissionerPairingUUID:v8];

  return v7;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v2 = [(HMCHIPAccessoryPairing *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
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
    id v7 = [(HMCHIPAccessoryPairing *)self identifier];
    BOOL v8 = [v6 identifier];
    if ([v7 isEqualToNumber:v8])
    {
      v9 = [(HMCHIPAccessoryPairing *)self home];
      id v10 = [v6 home];
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

- (HMCHIPAccessoryPairing)initWithIdentifier:(id)a3 home:(id)a4
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
    v23 = (void *)_HMFPreconditionFailure();
    return (HMCHIPAccessoryPairing *)+[HMAccessory networkRouterStatusFromWiFiSatelliteStatus:v25];
  }
  v26.receiver = self;
  v26.super_class = (Class)HMCHIPAccessoryPairing;
  v9 = [(HMCHIPAccessoryPairing *)&v26 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSNumber *)v10;

    uint64_t v12 = [v8 copy];
    home = v9->_home;
    v9->_home = (HMCHIPHome *)v12;

    id v14 = v8;
    id v15 = v6;
    self;
    uint64_t v16 = [v15 integerValue];

    uint64_t v27 = v16;
    v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v27 length:8];
    __int16 v18 = (void *)MEMORY[0x1E4F29128];
    v19 = [v14 UUID];

    uint64_t v20 = objc_msgSend(v18, "hmf_UUIDWithNamespace:data:", v19, v17);

    UUID = v9->_UUID;
    v9->_UUID = (NSUUID *)v20;
  }
  return v9;
}

@end