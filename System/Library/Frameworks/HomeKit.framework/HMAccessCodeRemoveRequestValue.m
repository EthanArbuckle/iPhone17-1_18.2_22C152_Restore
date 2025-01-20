@interface HMAccessCodeRemoveRequestValue
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessCodeRemoveRequestValue)initWithAccessoryAccessCodeValue:(id)a3;
- (HMAccessCodeRemoveRequestValue)initWithCoder:(id)a3;
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

@implementation HMAccessCodeRemoveRequestValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestName, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);

  objc_storeStrong((id *)&self->_accessoryAccessCodeValue, 0);
}

- (void)setGuestName:(id)a3
{
}

- (NSString)guestName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserUUID:(id)a3
{
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessoryAccessCodeValue)accessoryAccessCodeValue
{
  return (HMAccessoryAccessCodeValue *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessCodeRemoveRequestValue *)self accessoryAccessCodeValue];
  v5 = (void *)[v3 initWithName:@"accessoryAccessCodeValue" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
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

- (HMAccessCodeRemoveRequestValue)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeRemoveRequestValueCodingKeyAccessoryAccessCodeValue"];
  if (v5)
  {
    v6 = [(HMAccessCodeRemoveRequestValue *)self initWithAccessoryAccessCodeValue:v5];
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v6 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = 0;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessoryAccessCodeValue: %@,", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessCodeRemoveRequestValue *)self accessoryAccessCodeValue];
  [v4 encodeObject:v5 forKey:@"HMAccessCodeRemoveRequestValueCodingKeyAccessoryAccessCodeValue"];
}

- (unint64_t)hash
{
  v2 = [(HMAccessCodeRemoveRequestValue *)self accessoryAccessCodeValue];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMAccessCodeRemoveRequestValue *)self accessoryAccessCodeValue];
    v8 = [v6 accessoryAccessCodeValue];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSUUID)accessoryUUID
{
  v2 = [(HMAccessCodeRemoveRequestValue *)self accessoryAccessCodeValue];
  unint64_t v3 = [v2 accessoryUUID];

  return (NSUUID *)v3;
}

- (HMAccessCodeRemoveRequestValue)initWithAccessoryAccessCodeValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessCodeRemoveRequestValue;
  id v5 = [(HMAccessCodeRemoveRequestValue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    accessoryAccessCodeValue = v5->_accessoryAccessCodeValue;
    v5->_accessoryAccessCodeValue = (HMAccessoryAccessCodeValue *)v6;
  }
  return v5;
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