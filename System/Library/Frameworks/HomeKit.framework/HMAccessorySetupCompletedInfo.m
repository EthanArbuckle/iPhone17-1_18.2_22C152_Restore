@interface HMAccessorySetupCompletedInfo
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessorySetupCompletedInfo)initWithCoder:(id)a3;
- (HMAccessorySetupCompletedInfo)initWithHomeUUID:(id)a3 addedAccessoryUUIDs:(id)a4;
- (NSArray)addedAccessoryUUIDs;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)homeUUID;
- (NSString)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessorySetupCompletedInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);

  objc_storeStrong((id *)&self->_addedAccessoryUUIDs, 0);
}

- (NSString)homeUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)addedAccessoryUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessorySetupCompletedInfo)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeuuid"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"uuids"];

  if (v5 && v9)
  {
    v10 = [(HMAccessorySetupCompletedInfo *)self initWithHomeUUID:v5 addedAccessoryUUIDs:v9];
    v11 = v10;
  }
  else
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v10 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v16 = 138543874;
      v17 = v14;
      __int16 v18 = 2112;
      v19 = v5;
      __int16 v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded homeUUID: %@ addedAccessoryUUIDs: %@", (uint8_t *)&v16, 0x20u);
    }
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessorySetupCompletedInfo *)self homeUUID];
  [v4 encodeObject:v5 forKey:@"homeuuid"];

  id v6 = [(HMAccessorySetupCompletedInfo *)self addedAccessoryUUIDs];
  [v4 encodeObject:v6 forKey:@"uuids"];
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMAccessorySetupCompletedInfo *)self homeUUID];
  v5 = (void *)[v3 initWithName:@"Home UUID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessorySetupCompletedInfo *)self addedAccessoryUUIDs];
  v8 = (void *)[v6 initWithName:@"Added Accessory UUIDs" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
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

- (unint64_t)hash
{
  id v3 = [(HMAccessorySetupCompletedInfo *)self homeUUID];
  uint64_t v4 = [v3 hash];
  v5 = [(HMAccessorySetupCompletedInfo *)self addedAccessoryUUIDs];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
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
    v7 = [(HMAccessorySetupCompletedInfo *)self homeUUID];
    v8 = [v6 homeUUID];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(HMAccessorySetupCompletedInfo *)self addedAccessoryUUIDs];
      v10 = [v6 addedAccessoryUUIDs];
      char v11 = [v9 isEqualToArray:v10];
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

- (HMAccessorySetupCompletedInfo)initWithHomeUUID:(id)a3 addedAccessoryUUIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMAccessorySetupCompletedInfo;
  v8 = [(HMAccessorySetupCompletedInfo *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    homeUUID = v8->_homeUUID;
    v8->_homeUUID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    addedAccessoryUUIDs = v8->_addedAccessoryUUIDs;
    v8->_addedAccessoryUUIDs = (NSArray *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end