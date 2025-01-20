@interface HMHomeAccessCodeValue
+ (BOOL)supportsSecureCoding;
+ (id)homeAccessCodeValueWithStringValue:(id)a3 label:(id)a4;
+ (id)homeAccessCodeValueWithStringValue:(id)a3 removedUserInfo:(id)a4;
+ (id)homeAccessCodeValueWithStringValue:(id)a3 userUUID:(id)a4;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessCodeUserInformationValue)userInformationValue;
- (HMAccessCodeValue)accessCodeValue;
- (HMHomeAccessCodeValue)initWithAccessCodeValue:(id)a3 userInformationValue:(id)a4;
- (HMHomeAccessCodeValue)initWithCoder:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMHomeAccessCodeValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInformationValue, 0);

  objc_storeStrong((id *)&self->_accessCodeValue, 0);
}

- (HMAccessCodeUserInformationValue)userInformationValue
{
  return (HMAccessCodeUserInformationValue *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessCodeValue)accessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMHomeAccessCodeValue *)self accessCodeValue];
  v5 = (void *)[v3 initWithName:@"accessCodeValue" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMHomeAccessCodeValue *)self userInformationValue];
  v8 = (void *)[v6 initWithName:@"userInformationValue" value:v7];
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

- (HMHomeAccessCodeValue)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeAccessCodeValueCodingKeyAccessCodeValue"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeAccessCodeValueCodingKeyUserInformationValue"];
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
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessCodeValue: %@, userInformationValue: %@,", (uint8_t *)&v15, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = [(HMHomeAccessCodeValue *)self initWithAccessCodeValue:v5 userInformationValue:v6];
    v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMHomeAccessCodeValue *)self accessCodeValue];
  [v4 encodeObject:v5 forKey:@"HMHomeAccessCodeValueCodingKeyAccessCodeValue"];

  id v6 = [(HMHomeAccessCodeValue *)self userInformationValue];
  [v4 encodeObject:v6 forKey:@"HMHomeAccessCodeValueCodingKeyUserInformationValue"];
}

- (unint64_t)hash
{
  id v3 = [(HMHomeAccessCodeValue *)self accessCodeValue];
  uint64_t v4 = [v3 hash];
  v5 = [(HMHomeAccessCodeValue *)self userInformationValue];
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
    v7 = [(HMHomeAccessCodeValue *)self accessCodeValue];
    BOOL v8 = [v6 accessCodeValue];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMHomeAccessCodeValue *)self userInformationValue];
      v10 = [v6 userInformationValue];
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

- (HMHomeAccessCodeValue)initWithAccessCodeValue:(id)a3 userInformationValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMHomeAccessCodeValue;
  BOOL v8 = [(HMHomeAccessCodeValue *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accessCodeValue = v8->_accessCodeValue;
    v8->_accessCodeValue = (HMAccessCodeValue *)v9;

    uint64_t v11 = [v7 copy];
    userInformationValue = v8->_userInformationValue;
    v8->_userInformationValue = (HMAccessCodeUserInformationValue *)v11;
  }
  return v8;
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

+ (id)homeAccessCodeValueWithStringValue:(id)a3 removedUserInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HMAccessCodeUserInformationValue alloc] initWithSimpleLabel:0 labelIdentifier:0 userUUID:0 removedUserInfo:v5];

  BOOL v8 = [[HMAccessCodeValue alloc] initWithStringValue:v6];
  uint64_t v9 = [[HMHomeAccessCodeValue alloc] initWithAccessCodeValue:v8 userInformationValue:v7];

  return v9;
}

+ (id)homeAccessCodeValueWithStringValue:(id)a3 label:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HMAccessCodeUserInformationValue alloc] initWithSimpleLabel:v5 labelIdentifier:0 userUUID:0 removedUserInfo:0];

  BOOL v8 = [[HMAccessCodeValue alloc] initWithStringValue:v6];
  uint64_t v9 = [[HMHomeAccessCodeValue alloc] initWithAccessCodeValue:v8 userInformationValue:v7];

  return v9;
}

+ (id)homeAccessCodeValueWithStringValue:(id)a3 userUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HMAccessCodeUserInformationValue alloc] initWithSimpleLabel:0 labelIdentifier:0 userUUID:v5 removedUserInfo:0];

  BOOL v8 = [[HMAccessCodeValue alloc] initWithStringValue:v6];
  uint64_t v9 = [[HMHomeAccessCodeValue alloc] initWithAccessCodeValue:v8 userInformationValue:v7];

  return v9;
}

@end