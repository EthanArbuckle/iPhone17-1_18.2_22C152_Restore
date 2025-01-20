@interface HMAccessoryAccessCodeConstraintsFetchResponseValue
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessCodeConstraints)constraints;
- (HMAccessoryAccessCodeConstraintsFetchResponseValue)initWithAccessory:(id)a3 constraints:(id)a4 error:(id)a5;
- (HMAccessoryAccessCodeConstraintsFetchResponseValue)initWithCoder:(id)a3;
- (NSArray)attributeDescriptions;
- (NSError)error;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)accessoryUUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation HMAccessoryAccessCodeConstraintsFetchResponseValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (HMAccessCodeConstraints)constraints
{
  return (HMAccessCodeConstraints *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self accessoryUUID];
  v5 = (void *)[v3 initWithName:@"accessoryUUID" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self constraints];
  v8 = (void *)[v6 initWithName:@"constraints" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self error];
  v11 = (void *)[v9 initWithName:@"error" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return (NSArray *)v12;
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

- (HMAccessoryAccessCodeConstraintsFetchResponseValue)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryAccessCodeConstraintsFetchResponseValueCodingKeyAccessoryUUID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryAccessCodeConstraintsFetchResponseValueCodingKeyConstraints"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryAccessCodeConstraintsFetchResponseValueCodingKeyError"];
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = (void *)MEMORY[0x19F3A64A0]();
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
      v20 = v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessoryUUID: %@, constraints: %@", (uint8_t *)&v15, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self initWithAccessory:v5 constraints:v6 error:v7];
    v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self accessoryUUID];
  [v4 encodeObject:v5 forKey:@"HMAccessoryAccessCodeConstraintsFetchResponseValueCodingKeyAccessoryUUID"];

  id v6 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self constraints];
  [v4 encodeObject:v6 forKey:@"HMAccessoryAccessCodeConstraintsFetchResponseValueCodingKeyConstraints"];

  id v7 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self error];
  [v4 encodeObject:v7 forKey:@"HMAccessoryAccessCodeConstraintsFetchResponseValueCodingKeyError"];
}

- (unint64_t)hash
{
  id v3 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self accessoryUUID];
  uint64_t v4 = [v3 hash];
  v5 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self constraints];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self error];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
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
    id v7 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self accessoryUUID];
    unint64_t v8 = [v6 accessoryUUID];
    if ([v7 isEqual:v8])
    {
      id v9 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self constraints];
      v10 = [v6 constraints];
      if ([v9 isEqual:v10])
      {
        v11 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)self error];
        v12 = [v6 error];
        char v13 = HMFEqualObjects();
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (HMAccessoryAccessCodeConstraintsFetchResponseValue)initWithAccessory:(id)a3 constraints:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMAccessoryAccessCodeConstraintsFetchResponseValue;
  v11 = [(HMAccessoryAccessCodeConstraintsFetchResponseValue *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    accessoryUUID = v11->_accessoryUUID;
    v11->_accessoryUUID = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    constraints = v11->_constraints;
    v11->_constraints = (HMAccessCodeConstraints *)v14;

    objc_storeStrong((id *)&v11->_error, a5);
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