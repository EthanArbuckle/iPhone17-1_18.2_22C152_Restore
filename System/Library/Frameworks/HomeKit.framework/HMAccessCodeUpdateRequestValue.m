@interface HMAccessCodeUpdateRequestValue
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessCodeUpdateRequestValue)initWithAccessoryAccessCodeValue:(id)a3 updatedAccessCodeValue:(id)a4;
- (HMAccessCodeUpdateRequestValue)initWithCoder:(id)a3;
- (HMAccessCodeValue)updatedAccessCodeValue;
- (HMAccessoryAccessCodeValue)accessoryAccessCodeValue;
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

@implementation HMAccessCodeUpdateRequestValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestName, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_updatedAccessCodeValue, 0);

  objc_storeStrong((id *)&self->_accessoryAccessCodeValue, 0);
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

- (HMAccessCodeValue)updatedAccessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessoryAccessCodeValue)accessoryAccessCodeValue
{
  return (HMAccessoryAccessCodeValue *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessCodeUpdateRequestValue *)self accessoryAccessCodeValue];
  v5 = (void *)[v3 initWithName:@"accessoryAccessCodeValue" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessCodeUpdateRequestValue *)self updatedAccessCodeValue];
  v8 = (void *)[v6 initWithName:@"updatedAccessCodeValue" value:v7];
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

- (HMAccessCodeUpdateRequestValue)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeUpdateRequestValueCodingKeyAccessoryAccessCodeValue"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeUpdateRequestValueCodingKeyUpdatedAccessCodeValue"];
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
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessoryAccessCodeValue: %@, updatedAccessCodeValue: %@,", (uint8_t *)&v15, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = [(HMAccessCodeUpdateRequestValue *)self initWithAccessoryAccessCodeValue:v5 updatedAccessCodeValue:v6];
    v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessCodeUpdateRequestValue *)self accessoryAccessCodeValue];
  [v4 encodeObject:v5 forKey:@"HMAccessCodeUpdateRequestValueCodingKeyAccessoryAccessCodeValue"];

  id v6 = [(HMAccessCodeUpdateRequestValue *)self updatedAccessCodeValue];
  [v4 encodeObject:v6 forKey:@"HMAccessCodeUpdateRequestValueCodingKeyUpdatedAccessCodeValue"];
}

- (unint64_t)hash
{
  id v3 = [(HMAccessCodeUpdateRequestValue *)self accessoryAccessCodeValue];
  uint64_t v4 = [v3 hash];
  v5 = [(HMAccessCodeUpdateRequestValue *)self updatedAccessCodeValue];
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
    v7 = [(HMAccessCodeUpdateRequestValue *)self accessoryAccessCodeValue];
    BOOL v8 = [v6 accessoryAccessCodeValue];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMAccessCodeUpdateRequestValue *)self updatedAccessCodeValue];
      v10 = [v6 updatedAccessCodeValue];
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

- (NSUUID)accessoryUUID
{
  v2 = [(HMAccessCodeUpdateRequestValue *)self accessoryAccessCodeValue];
  id v3 = [v2 accessoryUUID];

  return (NSUUID *)v3;
}

- (HMAccessCodeUpdateRequestValue)initWithAccessoryAccessCodeValue:(id)a3 updatedAccessCodeValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMAccessCodeUpdateRequestValue;
  BOOL v8 = [(HMAccessCodeUpdateRequestValue *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accessoryAccessCodeValue = v8->_accessoryAccessCodeValue;
    v8->_accessoryAccessCodeValue = (HMAccessoryAccessCodeValue *)v9;

    uint64_t v11 = [v7 copy];
    updatedAccessCodeValue = v8->_updatedAccessCodeValue;
    v8->_updatedAccessCodeValue = (HMAccessCodeValue *)v11;
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