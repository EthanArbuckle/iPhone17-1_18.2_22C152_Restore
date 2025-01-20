@interface HMPersonLink
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMPersonLink)initWithCoder:(id)a3;
- (HMPersonLink)initWithPersonUUID:(id)a3 personManagerUUID:(id)a4;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)personManagerUUID;
- (NSUUID)personUUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMPersonLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personManagerUUID, 0);

  objc_storeStrong((id *)&self->_personUUID, 0);
}

- (NSUUID)personManagerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMPersonLink *)self personUUID];
  v5 = (void *)[v3 initWithName:@"Person UUID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMPersonLink *)self personManagerUUID];
  v8 = (void *)[v6 initWithName:@"Person Manager UUID" value:v7];
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

- (HMPersonLink)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMPL.ck.pu"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMPL.ck.pmu"];
  v7 = (void *)v6;
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
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v15 = 138543874;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v5;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded personUUID: %@ personManagerUUID: %@", (uint8_t *)&v15, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = [(HMPersonLink *)self initWithPersonUUID:v5 personManagerUUID:v6];
    v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMPersonLink *)self personUUID];
  [v4 encodeObject:v5 forKey:@"HMPL.ck.pu"];

  id v6 = [(HMPersonLink *)self personManagerUUID];
  [v4 encodeObject:v6 forKey:@"HMPL.ck.pmu"];
}

- (unint64_t)hash
{
  id v3 = [(HMPersonLink *)self personUUID];
  uint64_t v4 = [v3 hash];

  v5 = [(HMPersonLink *)self personManagerUUID];
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
    v7 = [(HMPersonLink *)self personUUID];
    BOOL v8 = [v6 personUUID];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMPersonLink *)self personManagerUUID];
      v10 = [v6 personManagerUUID];
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

- (HMPersonLink)initWithPersonUUID:(id)a3 personManagerUUID:(id)a4
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
    int v15 = (void *)_HMFPreconditionFailure();
    return (HMPersonLink *)+[HMPersonLink shortDescription];
  }
  v17.receiver = self;
  v17.super_class = (Class)HMPersonLink;
  v9 = [(HMPersonLink *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    personUUID = v9->_personUUID;
    v9->_personUUID = (NSUUID *)v10;

    uint64_t v12 = [v8 copy];
    personManagerUUID = v9->_personManagerUUID;
    v9->_personManagerUUID = (NSUUID *)v12;
  }
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

@end