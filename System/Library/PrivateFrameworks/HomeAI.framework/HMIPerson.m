@interface HMIPerson
+ (BOOL)supportsSecureCoding;
+ (id)personFromHomePerson:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMIPerson)initWithCoder:(id)a3;
- (HMIPerson)initWithUUID:(id)a3 name:(id)a4;
- (HMIPerson)initWithUUID:(id)a3 name:(id)a4 personLinks:(id)a5;
- (NSSet)personLinks;
- (NSString)name;
- (NSUUID)UUID;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIPerson

- (HMIPerson)initWithUUID:(id)a3 name:(id)a4
{
  v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 set];
  v10 = [(HMIPerson *)self initWithUUID:v8 name:v7 personLinks:v9];

  return v10;
}

- (HMIPerson)initWithUUID:(id)a3 name:(id)a4 personLinks:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11 = v10;
    v22.receiver = self;
    v22.super_class = (Class)HMIPerson;
    v12 = [(HMIPerson *)&v22 init];
    if (v12)
    {
      uint64_t v13 = [v8 copy];
      UUID = v12->_UUID;
      v12->_UUID = (NSUUID *)v13;

      uint64_t v15 = [v9 copy];
      name = v12->_name;
      v12->_name = (NSString *)v15;

      uint64_t v17 = [v11 copy];
      personLinks = v12->_personLinks;
      v12->_personLinks = (NSSet *)v17;
    }
    return v12;
  }
  else
  {
    v20 = (HMIPerson *)_HMFPreconditionFailure();
    return (HMIPerson *)[(HMIPerson *)v20 attributeDescriptions];
  }
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMIPerson *)self UUID];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  id v7 = [(HMIPerson *)self name];
  id v8 = [MEMORY[0x263F42610] defaultFormatter];
  id v9 = (void *)[v6 initWithName:@"name" value:v7 options:2 formatter:v8];
  v15[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMIPerson *)self personLinks];
  v12 = (void *)[v10 initWithName:@"personLinks" value:v11];
  v15[2] = v12;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  return v13;
}

+ (id)personFromHomePerson:(id)a3
{
  id v3 = a3;
  v4 = [v3 personLinks];
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_21);

  id v6 = [HMIPerson alloc];
  id v7 = [v3 UUID];
  id v8 = [v3 name];

  id v9 = [(HMIPerson *)v6 initWithUUID:v7 name:v8 personLinks:v5];
  return v9;
}

id __34__HMIPerson_personFromHomePerson___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMIPersonSourceUUIDPair personSourceUUIDPairFromPersonLink:a2];
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
    id v7 = [(HMIPerson *)self UUID];
    id v8 = [v6 UUID];
    if ([v7 isEqual:v8]
      && ([(HMIPerson *)self name],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [v6 name],
          id v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = HMFEqualObjects(),
          v10,
          v9,
          v11))
    {
      v12 = [(HMIPerson *)self personLinks];
      uint64_t v13 = [v6 personLinks];
      char v14 = HMFEqualObjects();
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

- (unint64_t)hash
{
  v2 = [(HMIPerson *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMIPerson *)self UUID];
  [v4 encodeObject:v5 forKey:@"HMIP.ck.u"];

  id v6 = [(HMIPerson *)self name];
  [v4 encodeObject:v6 forKey:@"HMIP.ck.n"];

  id v7 = [(HMIPerson *)self personLinks];
  [v4 encodeObject:v7 forKey:@"HMIP.ck.pl"];
}

- (HMIPerson)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIP.ck.u"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIP.ck.n"];
  id v7 = (void *)MEMORY[0x263EFFA08];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  id v9 = [v7 setWithArray:v8];

  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HMIP.ck.pl"];
  if (v5)
  {
    int v11 = [(HMIPerson *)self initWithUUID:v5 name:v6 personLinks:v10];
    v12 = v11;
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x22A641C70]();
    int v11 = self;
    char v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      _os_log_impl(&dword_225DC6000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@", (uint8_t *)&v17, 0x16u);
    }
    v12 = 0;
  }

  return v12;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)personLinks
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLinks, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end