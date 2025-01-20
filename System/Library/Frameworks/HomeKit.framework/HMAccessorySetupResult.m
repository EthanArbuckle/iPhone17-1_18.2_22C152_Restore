@interface HMAccessorySetupResult
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessorySetupResult)initWithCoder:(id)a3;
- (HMAccessorySetupResult)initWithHomeUniqueIdentifier:(id)a3 accessoryUniqueIdentifiers:(id)a4;
- (NSArray)accessoryUniqueIdentifiers;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)homeUniqueIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessorySetupResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifiers, 0);

  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
}

- (NSArray)accessoryUniqueIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)homeUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessorySetupResult *)self homeUniqueIdentifier];
  v5 = (void *)[v3 initWithName:@"Home ID" value:v4];
  v12[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessorySetupResult *)self accessoryUniqueIdentifiers];
  v8 = [v7 componentsJoinedByString:@","];
  v9 = (void *)[v6 initWithName:@"Accessory IDs" value:v8];
  v12[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return (NSArray *)v10;
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

- (HMAccessorySetupResult)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMASR.ck.homeUniqueIdentifier"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HMASR.ck.accessoryUniqueIdentifiers"];

  if (v5 && v9)
  {
    v10 = [(HMAccessorySetupResult *)self initWithHomeUniqueIdentifier:v5 accessoryUniqueIdentifiers:v9];
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
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded homeUniqueIdentifier: %@ accessoryUniqueIdentifiers: %@", (uint8_t *)&v16, 0x20u);
    }
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessorySetupResult *)self homeUniqueIdentifier];
  [v4 encodeObject:v5 forKey:@"HMASR.ck.homeUniqueIdentifier"];

  id v6 = [(HMAccessorySetupResult *)self accessoryUniqueIdentifiers];
  [v4 encodeObject:v6 forKey:@"HMASR.ck.accessoryUniqueIdentifiers"];
}

- (unint64_t)hash
{
  id v3 = [(HMAccessorySetupResult *)self homeUniqueIdentifier];
  uint64_t v4 = [v3 hash];

  v5 = [(HMAccessorySetupResult *)self accessoryUniqueIdentifiers];
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
    v7 = [(HMAccessorySetupResult *)self homeUniqueIdentifier];
    v8 = [v6 homeUniqueIdentifier];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMAccessorySetupResult *)self accessoryUniqueIdentifiers];
      v10 = [v6 accessoryUniqueIdentifiers];
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

- (HMAccessorySetupResult)initWithHomeUniqueIdentifier:(id)a3 accessoryUniqueIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (![v8 count])
  {
LABEL_7:
    v13 = (void *)_HMFPreconditionFailure();
    return (HMAccessorySetupResult *)+[HMAccessorySetupResult shortDescription];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMAccessorySetupResult;
  v10 = [(HMAccessorySetupResult *)&v15 init];
  char v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_homeUniqueIdentifier, a3);
    objc_storeStrong((id *)&v11->_accessoryUniqueIdentifiers, a4);
  }

  return v11;
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

@end