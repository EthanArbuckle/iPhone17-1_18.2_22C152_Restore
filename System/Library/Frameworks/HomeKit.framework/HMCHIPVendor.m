@interface HMCHIPVendor
+ (BOOL)supportsSecureCoding;
+ (id)UUIDFromIdentifier:(id)a3;
+ (id)shortDescription;
- (BOOL)isAppleVendor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemCommissionerVendor;
- (HMCHIPVendor)initWithCoder:(id)a3;
- (HMCHIPVendor)initWithIdentifier:(id)a3 name:(id)a4;
- (NSArray)attributeDescriptions;
- (NSNumber)identifier;
- (NSString)description;
- (NSString)name;
- (NSString)shortDescription;
- (NSUUID)UUID;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleVendor:(BOOL)a3;
- (void)setSystemCommissionerVendor:(BOOL)a3;
@end

@implementation HMCHIPVendor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setSystemCommissionerVendor:(BOOL)a3
{
  self->_systemCommissionerVendor = a3;
}

- (BOOL)isSystemCommissionerVendor
{
  return self->_systemCommissionerVendor;
}

- (void)setAppleVendor:(BOOL)a3
{
  self->_appleVendor = a3;
}

- (BOOL)isAppleVendor
{
  return self->_appleVendor;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMCHIPVendor *)self identifier];
  v6 = (void *)[v4 initWithName:@"Identifier" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMCHIPVendor *)self name];
  v9 = (void *)[v7 initWithName:@"Name" value:v8];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMCHIPVendor *)self isAppleVendor];
  v11 = HMFBooleanToString();
  v12 = (void *)[v10 initWithName:@"Is Apple Vendor" value:v11];
  [v3 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMCHIPVendor *)self isSystemCommissionerVendor];
  v14 = HMFBooleanToString();
  v15 = (void *)[v13 initWithName:@"Is System Commissioner" value:v14];
  [v3 addObject:v15];

  v16 = (void *)[v3 copy];

  return (NSArray *)v16;
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

- (HMCHIPVendor)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCV.ck.identifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCV.ck.name"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v15 = 138543874;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v5;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded identifier: %@ name: %@", (uint8_t *)&v15, 0x20u);
    }
    id v13 = 0;
  }
  else
  {
    v12 = [(HMCHIPVendor *)self initWithIdentifier:v5 name:v6];
    -[HMCHIPVendor setAppleVendor:](v12, "setAppleVendor:", [v4 decodeBoolForKey:@"HMCV.ck.isAppleVendor"]);
    -[HMCHIPVendor setSystemCommissionerVendor:](v12, "setSystemCommissionerVendor:", [v4 decodeBoolForKey:@"HMCV.ck.isSystemCommissionerVendor"]);
    id v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(HMCHIPVendor *)self identifier];
  [v6 encodeObject:v4 forKey:@"HMCV.ck.identifier"];

  v5 = [(HMCHIPVendor *)self name];
  [v6 encodeObject:v5 forKey:@"HMCV.ck.name"];

  objc_msgSend(v6, "encodeBool:forKey:", -[HMCHIPVendor isAppleVendor](self, "isAppleVendor"), @"HMCV.ck.isAppleVendor");
  objc_msgSend(v6, "encodeBool:forKey:", -[HMCHIPVendor isSystemCommissionerVendor](self, "isSystemCommissionerVendor"), @"HMCV.ck.isSystemCommissionerVendor");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMutableCHIPVendor allocWithZone:a3];
  v5 = [(HMCHIPVendor *)self identifier];
  id v6 = [(HMCHIPVendor *)self name];
  id v7 = [(HMCHIPVendor *)v4 initWithIdentifier:v5 name:v6];

  [(HMCHIPVendor *)v7 setAppleVendor:[(HMCHIPVendor *)self isAppleVendor]];
  [(HMCHIPVendor *)v7 setSystemCommissionerVendor:[(HMCHIPVendor *)self isSystemCommissionerVendor]];
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

+ (id)UUIDFromIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUIDString:@"9E8B0B4A-EB40-4566-A9B4-65FFCE246CC9"];
  uint64_t v6 = [v4 integerValue];

  uint64_t v10 = v6;
  id v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v10 length:8];
  BOOL v8 = objc_msgSend(MEMORY[0x1E4F29128], "hmf_UUIDWithNamespace:data:", v5, v7);

  return v8;
}

- (unint64_t)hash
{
  v2 = [(HMCHIPVendor *)self identifier];
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
    id v7 = [(HMCHIPVendor *)self identifier];
    BOOL v8 = [v6 identifier];
    if ([v7 isEqualToNumber:v8])
    {
      v9 = [(HMCHIPVendor *)self name];
      uint64_t v10 = [v6 name];
      if ([v9 isEqualToString:v10]
        && (int v11 = [(HMCHIPVendor *)self isAppleVendor],
            v11 == [v6 isAppleVendor]))
      {
        BOOL v13 = [(HMCHIPVendor *)self isSystemCommissionerVendor];
        int v12 = v13 ^ [v6 isSystemCommissionerVendor] ^ 1;
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

- (HMCHIPVendor)initWithIdentifier:(id)a3 name:(id)a4
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
    __int16 v17 = (HMHomeCloudShareResponse *)_HMFPreconditionFailure();
    [(HMHomeCloudShareResponse *)v17 .cxx_destruct];
    return result;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMCHIPVendor;
  v9 = [(HMCHIPVendor *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSNumber *)v10;

    uint64_t v12 = [v8 copy];
    name = v9->_name;
    v9->_name = (NSString *)v12;

    uint64_t v14 = +[HMCHIPVendor UUIDFromIdentifier:v6];
    UUID = v9->_UUID;
    v9->_UUID = (NSUUID *)v14;
  }
  return v9;
}

@end