@interface HMPerson
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMPerson)initWithCoder:(id)a3;
- (HMPerson)initWithUUID:(id)a3;
- (NSArray)attributeDescriptions;
- (NSSet)personLinks;
- (NSString)description;
- (NSString)name;
- (NSString)shortDescription;
- (NSUUID)UUID;
- (NSUUID)externalPersonUUID;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExternalPersonUUID:(id)a3;
- (void)setName:(id)a3;
- (void)setPersonLinks:(id)a3;
@end

@implementation HMPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalPersonUUID, 0);
  objc_storeStrong((id *)&self->_personLinks, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setExternalPersonUUID:(id)a3
{
}

- (NSUUID)externalPersonUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPersonLinks:(id)a3
{
}

- (NSSet)personLinks
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMPerson *)self UUID];
  v6 = (void *)[v4 initWithName:@"UUID" value:v5];
  [v3 addObject:v6];

  v7 = [(HMPerson *)self name];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
    v9 = [(HMPerson *)self name];
    v10 = [MEMORY[0x1E4F65538] defaultFormatter];
    v11 = (void *)[v8 initWithName:@"name" value:v9 options:0 formatter:v10];
    [v3 addObject:v11];
  }
  v12 = [(HMPerson *)self personLinks];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
    v15 = [(HMPerson *)self personLinks];
    v16 = (void *)[v14 initWithName:@"personLinks" value:v15];
    [v3 addObject:v16];
  }
  v17 = [(HMPerson *)self externalPersonUUID];

  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F653F8]);
    v19 = [(HMPerson *)self externalPersonUUID];
    v20 = (void *)[v18 initWithName:@"External Person UUID" value:v19];
    [v3 addObject:v20];
  }
  v21 = (void *)[v3 copy];

  return (NSArray *)v21;
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

- (HMPerson)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMP.ck.u"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMP.ck.n"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v9 = [v7 setWithArray:v8];
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HMP.ck.pl"];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMP.ck.epu"];
  if (v5)
  {
    v12 = [(HMPerson *)self initWithUUID:v5];
    [(HMPerson *)v12 setName:v6];
    [(HMPerson *)v12 setPersonLinks:v10];
    [(HMPerson *)v12 setExternalPersonUUID:v11];
    uint64_t v13 = v12;
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v18 = 138543618;
      v19 = v16;
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMPerson *)self UUID];
  [v4 encodeObject:v5 forKey:@"HMP.ck.u"];

  v6 = [(HMPerson *)self name];
  [v4 encodeObject:v6 forKey:@"HMP.ck.n"];

  v7 = [(HMPerson *)self personLinks];
  [v4 encodeObject:v7 forKey:@"HMP.ck.pl"];

  id v8 = [(HMPerson *)self externalPersonUUID];
  [v4 encodeObject:v8 forKey:@"HMP.ck.epu"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMutablePerson allocWithZone:a3];
  v5 = [(HMPerson *)self UUID];
  v6 = [(HMPerson *)v4 initWithUUID:v5];

  v7 = [(HMPerson *)self name];
  [(HMPerson *)v6 setName:v7];

  id v8 = [(HMPerson *)self personLinks];
  [(HMPerson *)v6 setPersonLinks:v8];

  v9 = [(HMPerson *)self externalPersonUUID];
  [(HMPerson *)v6 setExternalPersonUUID:v9];

  return v6;
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
  v2 = [(HMPerson *)self UUID];
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
    v7 = [(HMPerson *)self UUID];
    id v8 = [v6 UUID];
    if ([v7 isEqual:v8]
      && ([(HMPerson *)self name],
          v9 = objc_claimAutoreleasedReturnValue(),
          [v6 name],
          v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = HMFEqualObjects(),
          v10,
          v9,
          v11))
    {
      v12 = [(HMPerson *)self personLinks];
      uint64_t v13 = [v6 personLinks];
      if ([v12 isEqualToSet:v13])
      {
        id v14 = [(HMPerson *)self externalPersonUUID];
        v15 = [v6 externalPersonUUID];
        char v16 = HMFEqualObjects();
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (HMPerson)initWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v14.receiver = self;
    v14.super_class = (Class)HMPerson;
    id v6 = [(HMPerson *)&v14 init];
    if (v6)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v5);
      UUID = v6->_UUID;
      v6->_UUID = (NSUUID *)v7;

      uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
      personLinks = v6->_personLinks;
      v6->_personLinks = (NSSet *)v9;
    }
    return v6;
  }
  else
  {
    v12 = (HMAccessCodeModificationResponse *)_HMFPreconditionFailure();
    [(HMAccessCodeModificationResponse *)v12 .cxx_destruct];
  }
  return result;
}

@end