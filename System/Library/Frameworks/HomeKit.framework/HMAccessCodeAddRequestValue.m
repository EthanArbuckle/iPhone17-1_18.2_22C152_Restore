@interface HMAccessCodeAddRequestValue
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessCodeAddRequestValue)initWithAccessCodeValue:(id)a3 accessoryUUID:(id)a4;
- (HMAccessCodeAddRequestValue)initWithCoder:(id)a3;
- (HMAccessCodeValue)accessCodeValue;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)guestName;
- (NSString)shortDescription;
- (NSUUID)accessoryUUID;
- (NSUUID)userUUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGuestName:(id)a3;
- (void)setUserUUID:(id)a3;
@end

@implementation HMAccessCodeAddRequestValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestName, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);

  objc_storeStrong((id *)&self->_accessCodeValue, 0);
}

- (void)setGuestName:(id)a3
{
}

- (NSString)guestName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserUUID:(id)a3
{
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessCodeValue)accessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessCodeAddRequestValue *)self accessCodeValue];
  v5 = (void *)[v3 initWithName:@"accessCodeValue" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessCodeAddRequestValue *)self accessoryUUID];
  v8 = (void *)[v6 initWithName:@"accessoryUUID" value:v7];
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

- (HMAccessCodeAddRequestValue)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeAddRequestValueCodingKeyAccessCodeValue"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeAddRequestValueCodingKeyAccessoryUUID"];
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
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessCodeValue: %@, accessoryUUID: %@,", (uint8_t *)&v15, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = [(HMAccessCodeAddRequestValue *)self initWithAccessCodeValue:v5 accessoryUUID:v6];
    v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessCodeAddRequestValue *)self accessCodeValue];
  [v4 encodeObject:v5 forKey:@"HMAccessCodeAddRequestValueCodingKeyAccessCodeValue"];

  id v6 = [(HMAccessCodeAddRequestValue *)self accessoryUUID];
  [v4 encodeObject:v6 forKey:@"HMAccessCodeAddRequestValueCodingKeyAccessoryUUID"];
}

- (unint64_t)hash
{
  id v3 = [(HMAccessCodeAddRequestValue *)self accessCodeValue];
  uint64_t v4 = [v3 hash];
  v5 = [(HMAccessCodeAddRequestValue *)self accessoryUUID];
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
    v7 = [(HMAccessCodeAddRequestValue *)self accessCodeValue];
    BOOL v8 = [v6 accessCodeValue];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMAccessCodeAddRequestValue *)self accessoryUUID];
      v10 = [v6 accessoryUUID];
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

- (HMAccessCodeAddRequestValue)initWithAccessCodeValue:(id)a3 accessoryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMAccessCodeAddRequestValue;
  BOOL v8 = [(HMAccessCodeAddRequestValue *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accessCodeValue = v8->_accessCodeValue;
    v8->_accessCodeValue = (HMAccessCodeValue *)v9;

    uint64_t v11 = [v7 copy];
    accessoryUUID = v8->_accessoryUUID;
    v8->_accessoryUUID = (NSUUID *)v11;
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

@end