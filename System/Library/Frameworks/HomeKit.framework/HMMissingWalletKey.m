@interface HMMissingWalletKey
+ (id)missingWalletKeyWithValue:(id)a3 home:(id)a4;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessory)accessory;
- (HMMissingWalletKey)initWithAccessory:(id)a3 user:(id)a4;
- (HMUser)user;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (unint64_t)hash;
@end

@implementation HMMissingWalletKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

- (HMUser)user
{
  return (HMUser *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMMissingWalletKey *)self accessory];
  v5 = [v4 uuid];
  v6 = (void *)[v3 initWithName:@"accessoryUUID" value:v5];
  v13[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMMissingWalletKey *)self user];
  v9 = [v8 uuid];
  v10 = (void *)[v7 initWithName:@"userUUID" value:v9];
  v13[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  return (NSArray *)v11;
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
  id v3 = [(HMMissingWalletKey *)self accessory];
  v4 = [v3 uniqueIdentifier];
  uint64_t v5 = [v4 hash];
  v6 = [(HMMissingWalletKey *)self user];
  id v7 = [v6 uniqueIdentifier];
  unint64_t v8 = [v7 hash] ^ v5;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_7;
  }
  id v7 = [(HMMissingWalletKey *)self accessory];
  unint64_t v8 = [v7 uniqueIdentifier];
  v9 = [v6 accessory];
  v10 = [v9 uniqueIdentifier];
  int v11 = HMFEqualObjects();

  if (v11)
  {
    v12 = [(HMMissingWalletKey *)self user];
    v13 = [v12 uniqueIdentifier];
    v14 = [v6 user];
    v15 = [v14 uniqueIdentifier];
    char v16 = HMFEqualObjects();
  }
  else
  {
LABEL_7:
    char v16 = 0;
  }

  return v16;
}

- (HMMissingWalletKey)initWithAccessory:(id)a3 user:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMissingWalletKey;
  v9 = [(HMMissingWalletKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_user, a4);
  }

  return v10;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)missingWalletKeyWithValue:(id)a3 home:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accessoryUUID];
  v9 = [v7 accessoryWithUUID:v8];

  v10 = [v6 userUUID];
  int v11 = [v7 userWithUUID:v10];

  if (v9 && v11)
  {
    objc_super v12 = [[HMMissingWalletKey alloc] initWithAccessory:v9 user:v11];
  }
  else
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = a1;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      char v16 = HMFGetLogIdentifier();
      v17 = [v6 accessoryUUID];
      v18 = [v6 userUUID];
      int v20 = 138544386;
      v21 = v16;
      __int16 v22 = 2112;
      v23 = v17;
      __int16 v24 = 2112;
      v25 = v18;
      __int16 v26 = 2112;
      v27 = v9;
      __int16 v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not create HMMissingWalletKey with accessoryUUID: %@, userUUID: %@, accessory: %@, user: %@", (uint8_t *)&v20, 0x34u);
    }
    objc_super v12 = 0;
  }

  return v12;
}

@end