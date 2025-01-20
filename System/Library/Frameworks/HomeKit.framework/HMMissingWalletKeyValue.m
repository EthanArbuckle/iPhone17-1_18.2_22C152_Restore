@interface HMMissingWalletKeyValue
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
+ (id)valueForMissingWalletKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMMissingWalletKeyValue)initWithAccessoryUUID:(id)a3 userUUID:(id)a4;
- (HMMissingWalletKeyValue)initWithCoder:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)accessoryUUID;
- (NSUUID)userUUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMMissingWalletKeyValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUUID, 0);

  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMMissingWalletKeyValue *)self accessoryUUID];
  v5 = (void *)[v3 initWithName:@"accessoryUUID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMMissingWalletKeyValue *)self userUUID];
  v8 = (void *)[v6 initWithName:@"userUUID" value:v7];
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

- (HMMissingWalletKeyValue)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMissingWalletKeyValueCodingKeyAccessoryUUID"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMMissingWalletKeyValueCodingKeyUserUUID"];
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
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessoryUUID: %@, userUUID: %@", (uint8_t *)&v15, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = [(HMMissingWalletKeyValue *)self initWithAccessoryUUID:v5 userUUID:v6];
    v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMMissingWalletKeyValue *)self accessoryUUID];
  [v4 encodeObject:v5 forKey:@"HMMissingWalletKeyValueCodingKeyAccessoryUUID"];

  id v6 = [(HMMissingWalletKeyValue *)self userUUID];
  [v4 encodeObject:v6 forKey:@"HMMissingWalletKeyValueCodingKeyUserUUID"];
}

- (unint64_t)hash
{
  id v3 = [(HMMissingWalletKeyValue *)self accessoryUUID];
  uint64_t v4 = [v3 hash];
  v5 = [(HMMissingWalletKeyValue *)self userUUID];
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
    v7 = [(HMMissingWalletKeyValue *)self accessoryUUID];
    BOOL v8 = [v6 accessoryUUID];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMMissingWalletKeyValue *)self userUUID];
      v10 = [v6 userUUID];
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

- (HMMissingWalletKeyValue)initWithAccessoryUUID:(id)a3 userUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMMissingWalletKeyValue;
  BOOL v8 = [(HMMissingWalletKeyValue *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accessoryUUID = v8->_accessoryUUID;
    v8->_accessoryUUID = (NSUUID *)v9;

    uint64_t v11 = [v7 copy];
    userUUID = v8->_userUUID;
    v8->_userUUID = (NSUUID *)v11;
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

+ (id)valueForMissingWalletKey:(id)a3
{
  id v3 = a3;
  id v4 = [HMMissingWalletKeyValue alloc];
  v5 = [v3 accessory];
  id v6 = [v5 uuid];
  id v7 = [v3 user];

  BOOL v8 = [v7 uuid];
  uint64_t v9 = [(HMMissingWalletKeyValue *)v4 initWithAccessoryUUID:v6 userUUID:v8];

  return v9;
}

@end