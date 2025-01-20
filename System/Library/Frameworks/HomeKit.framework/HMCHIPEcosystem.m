@interface HMCHIPEcosystem
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)owned;
- (HMCHIPEcosystem)initWithCoder:(id)a3;
- (HMCHIPEcosystem)initWithRootPublicKey:(id)a3 vendor:(id)a4;
- (HMCHIPEcosystem)initWithRootPublicKey:(id)a3 vendor:(id)a4 owned:(BOOL)a5;
- (HMCHIPVendor)vendor;
- (NSArray)attributeDescriptions;
- (NSData)rootPublicKey;
- (NSString)description;
- (NSString)name;
- (NSString)shortDescription;
- (NSUUID)UUID;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCHIPEcosystem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (BOOL)owned
{
  return self->_owned;
}

- (HMCHIPVendor)vendor
{
  return (HMCHIPVendor *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)rootPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMCHIPEcosystem *)self rootPublicKey];
  v6 = (void *)[v4 initWithName:@"Root Public Key" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMCHIPEcosystem *)self vendor];
  v9 = (void *)[v7 initWithName:@"Vendor" value:v8];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMCHIPEcosystem *)self owned];
  v11 = HMFBooleanToString();
  v12 = (void *)[v10 initWithName:@"Owned" value:v11];
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

- (HMCHIPEcosystem)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDPE.ck.rootPublicKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDPE.ck.vendor"];
  uint64_t v7 = [v4 decodeBoolForKey:@"MTSDPE.ck.owned"];
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    v9 = v6;
    id v10 = v5;
LABEL_9:
    v11 = [(HMCHIPEcosystem *)self initWithRootPublicKey:v5 vendor:v6 owned:v7];
    v12 = v11;
    goto LABEL_13;
  }
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCE.ck.rootPublicKey"];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCE.ck.vendor"];

  if (v10 && v9)
  {
    v6 = v9;
    v5 = v10;
    goto LABEL_9;
  }
  v13 = (void *)MEMORY[0x19F3A64A0]();
  v11 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = HMFGetLogIdentifier();
    int v17 = 138543874;
    v18 = v15;
    __int16 v19 = 2112;
    v20 = v10;
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded rootPublicKey: %@ vendor: %@", (uint8_t *)&v17, 0x20u);
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(HMCHIPEcosystem *)self rootPublicKey];
  [v6 encodeObject:v4 forKey:@"MTSDPE.ck.rootPublicKey"];

  v5 = [(HMCHIPEcosystem *)self vendor];
  [v6 encodeObject:v5 forKey:@"MTSDPE.ck.vendor"];

  objc_msgSend(v6, "encodeBool:forKey:", -[HMCHIPEcosystem owned](self, "owned"), @"MTSDPE.ck.owned");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMutableCHIPEcosystem allocWithZone:a3];
  v5 = [(HMCHIPEcosystem *)self rootPublicKey];
  id v6 = [(HMCHIPEcosystem *)self vendor];
  uint64_t v7 = [(HMCHIPEcosystem *)v4 initWithRootPublicKey:v5 vendor:v6];

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
  v2 = [(HMCHIPEcosystem *)self rootPublicKey];
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
    uint64_t v7 = [(HMCHIPEcosystem *)self rootPublicKey];
    BOOL v8 = [v6 rootPublicKey];
    if ([v7 isEqualToData:v8])
    {
      v9 = [(HMCHIPEcosystem *)self vendor];
      id v10 = [v6 vendor];
      if ([v9 isEqual:v10])
      {
        BOOL v11 = [(HMCHIPEcosystem *)self owned];
        int v12 = v11 ^ [v6 owned] ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (NSString)name
{
  v2 = [(HMCHIPEcosystem *)self vendor];
  unint64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (HMCHIPEcosystem)initWithRootPublicKey:(id)a3 vendor:(id)a4 owned:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v10 = v9;
  if (!v9)
  {
LABEL_7:
    uint64_t v23 = (HMCHIPEcosystem *)_HMFPreconditionFailure();
    return [(HMCHIPEcosystem *)v23 initWithRootPublicKey:v25 vendor:v26];
  }
  v27.receiver = self;
  v27.super_class = (Class)HMCHIPEcosystem;
  BOOL v11 = [(HMCHIPEcosystem *)&v27 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    rootPublicKey = v11->_rootPublicKey;
    v11->_rootPublicKey = (NSData *)v12;

    uint64_t v14 = [v10 copy];
    vendor = v11->_vendor;
    v11->_vendor = (HMCHIPVendor *)v14;

    v11->_owned = a5;
    id v16 = v10;
    id v17 = v8;
    self;
    v18 = (void *)MEMORY[0x1E4F29128];
    __int16 v19 = [v16 UUID];

    uint64_t v20 = objc_msgSend(v18, "hmf_UUIDWithNamespace:data:", v19, v17);

    UUID = v11->_UUID;
    v11->_UUID = (NSUUID *)v20;
  }
  return v11;
}

- (HMCHIPEcosystem)initWithRootPublicKey:(id)a3 vendor:(id)a4
{
  return [(HMCHIPEcosystem *)self initWithRootPublicKey:a3 vendor:a4 owned:0];
}

@end