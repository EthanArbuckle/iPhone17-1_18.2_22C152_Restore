@interface HMCHIPHome
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMCHIPEcosystem)ecosystem;
- (HMCHIPHome)initWithCoder:(id)a3;
- (HMCHIPHome)initWithIdentifier:(id)a3 index:(id)a4 name:(id)a5 ecosystem:(id)a6;
- (HMCHIPHome)initWithIdentifier:(id)a3 name:(id)a4 ecosystem:(id)a5;
- (NSArray)attributeDescriptions;
- (NSNumber)identifier;
- (NSNumber)index;
- (NSString)description;
- (NSString)name;
- (NSString)shortDescription;
- (NSUUID)UUID;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCHIPHome

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecosystem, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (HMCHIPEcosystem)ecosystem
{
  return (HMCHIPEcosystem *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMCHIPHome *)self identifier];
  v6 = (void *)[v4 initWithName:@"Identifier" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMCHIPHome *)self index];
  v9 = (void *)[v7 initWithName:@"Index" value:v8];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMCHIPHome *)self name];
  v12 = (void *)[v10 initWithName:@"Name" value:v11];
  [v3 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v14 = [(HMCHIPHome *)self ecosystem];
  v15 = (void *)[v13 initWithName:@"Ecosystem" value:v14];
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

- (HMCHIPHome)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCH.ck.identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCH.ck.index"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCH.ck.name"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCH.ck.ecosystem"];
  v9 = (void *)v8;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v7 == 0 || v8 == 0)
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    v16 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v19 = 138544386;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = v5;
      __int16 v23 = 2112;
      v24 = v6;
      __int16 v25 = 2112;
      v26 = v7;
      __int16 v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded identifier: %@ index: %@ name: %@ ecosystem: %@", (uint8_t *)&v19, 0x34u);
    }
    v17 = 0;
  }
  else
  {
    v16 = [(HMCHIPHome *)self initWithIdentifier:v5 index:v6 name:v7 ecosystem:v8];
    v17 = v16;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMCHIPHome *)self identifier];
  [v4 encodeObject:v5 forKey:@"HMCH.ck.identifier"];

  v6 = [(HMCHIPHome *)self index];
  [v4 encodeObject:v6 forKey:@"HMCH.ck.index"];

  id v7 = [(HMCHIPHome *)self name];
  [v4 encodeObject:v7 forKey:@"HMCH.ck.name"];

  id v8 = [(HMCHIPHome *)self ecosystem];
  [v4 encodeObject:v8 forKey:@"HMCH.ck.ecosystem"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMutableCHIPHome allocWithZone:a3];
  v5 = [(HMCHIPHome *)self identifier];
  v6 = [(HMCHIPHome *)self index];
  id v7 = [(HMCHIPHome *)self name];
  id v8 = [(HMCHIPHome *)self ecosystem];
  v9 = [(HMCHIPHome *)v4 initWithIdentifier:v5 index:v6 name:v7 ecosystem:v8];

  return v9;
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
  v2 = [(HMCHIPHome *)self identifier];
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
    id v7 = [(HMCHIPHome *)self identifier];
    id v8 = [v6 identifier];
    if ([v7 isEqualToNumber:v8])
    {
      v9 = [(HMCHIPHome *)self index];
      BOOL v10 = [v6 index];
      if ([v9 isEqualToNumber:v10])
      {
        v11 = [(HMCHIPHome *)self name];
        v12 = [v6 name];
        if ([v11 isEqualToString:v12])
        {
          v16 = [(HMCHIPHome *)self ecosystem];
          id v13 = [v6 ecosystem];
          char v14 = [v16 isEqual:v13];
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (HMCHIPHome)initWithIdentifier:(id)a3 name:(id)a4 ecosystem:(id)a5
{
  return [(HMCHIPHome *)self initWithIdentifier:a3 index:&unk_1EEF081A8 name:a4 ecosystem:a5];
}

- (HMCHIPHome)initWithIdentifier:(id)a3 index:(id)a4 name:(id)a5 ecosystem:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  char v14 = v13;
  if (!v13)
  {
LABEL_11:
    v33 = (HMSettingLanguageValue *)_HMFPreconditionFailure();
    [(HMSettingLanguageValue *)v33 .cxx_destruct];
    return result;
  }
  v35.receiver = self;
  v35.super_class = (Class)HMCHIPHome;
  v15 = [(HMCHIPHome *)&v35 init];
  if (v15)
  {
    uint64_t v16 = [v10 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSNumber *)v16;

    uint64_t v18 = [v11 copy];
    index = v15->_index;
    v15->_index = (NSNumber *)v18;

    uint64_t v20 = [v12 copy];
    name = v15->_name;
    v15->_name = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    ecosystem = v15->_ecosystem;
    v15->_ecosystem = (HMCHIPEcosystem *)v22;

    id v24 = v14;
    id v25 = v10;
    self;
    uint64_t v26 = [v25 integerValue];

    uint64_t v36 = v26;
    __int16 v27 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v36 length:8];
    v28 = (void *)MEMORY[0x1E4F29128];
    uint64_t v29 = [v24 UUID];

    uint64_t v30 = objc_msgSend(v28, "hmf_UUIDWithNamespace:data:", v29, v27);

    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v30;
  }
  return v15;
}

@end