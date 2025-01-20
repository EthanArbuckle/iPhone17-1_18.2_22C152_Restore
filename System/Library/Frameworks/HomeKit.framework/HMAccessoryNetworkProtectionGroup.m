@interface HMAccessoryNetworkProtectionGroup
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAccessoryCategory)category;
- (HMAccessoryNetworkProtectionGroup)initWithCoder:(id)a3;
- (HMAccessoryNetworkProtectionGroup)initWithUUID:(id)a3 manufacturer:(id)a4 category:(id)a5 protectionMode:(int64_t)a6;
- (HMHome)home;
- (NSArray)accessories;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)manufacturer;
- (NSString)shortDescription;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (int64_t)targetProtectionMode;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setHome:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setTargetProtectionMode:(int64_t)a3;
- (void)updateProtectionMode:(int64_t)a3 completion:(id)a4;
@end

@implementation HMAccessoryNetworkProtectionGroup

- (void)setHome:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMAccessoryNetworkProtectionGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryNetworkProtectionGroupUUIDCodingKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryNetworkProtectionGroupManufacturerCodingKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryNetworkProtectionGroupCategoryCodingKey"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"HMAccessoryNetworkProtectionGroupProtectionModeCodingKey"];

  v9 = [(HMAccessoryNetworkProtectionGroup *)self initWithUUID:v5 manufacturer:v6 category:v7 protectionMode:v8];
  return v9;
}

- (HMAccessoryNetworkProtectionGroup)initWithUUID:(id)a3 manufacturer:(id)a4 category:(id)a5 protectionMode:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMAccessoryNetworkProtectionGroup;
  v14 = [(HMAccessoryNetworkProtectionGroup *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_uuid, a3);
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", v11);
    uniqueIdentifier = v15->_uniqueIdentifier;
    v15->_uniqueIdentifier = (NSUUID *)v16;

    objc_storeStrong((id *)&v15->_manufacturer, a4);
    uint64_t v18 = +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:v13];
    category = v15->_category;
    v15->_category = (HMAccessoryCategory *)v18;

    v15->_targetProtectionMode = a6;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_destroyWeak((id *)&self->_home);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMAccessoryNetworkProtectionGroup *)self uniqueIdentifier];
  id v5 = (void *)[v3 initWithName:@"uniqueIdentifier" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessoryNetworkProtectionGroup *)self manufacturer];
  uint64_t v8 = (void *)[v6 initWithName:@"manufacturer" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMAccessoryNetworkProtectionGroup *)self category];
  id v11 = (void *)[v9 initWithName:@"category" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMAccessoryNetworkProtectionGroup targetProtectionMode](self, "targetProtectionMode"));
  v14 = (void *)[v12 initWithName:@"targetProtectionMode" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return (NSArray *)v15;
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

- (void)updateProtectionMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(HMAccessoryNetworkProtectionGroup *)self home];
  [v7 updateAccessoryNetworkProtectionGroup:self protectionMode:a3 completion:v6];
}

- (NSArray)accessories
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(HMAccessoryNetworkProtectionGroup *)self home];
  id v5 = [v4 accessories];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v10 networkProtectionGroupUUID];
        id v12 = [(HMAccessoryNetworkProtectionGroup *)self uuid];
        int v13 = [v11 isEqual:v12];

        if (v13) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v14 = (void *)[v3 copy];

  return (NSArray *)v14;
}

- (void)setTargetProtectionMode:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_targetProtectionMode = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)targetProtectionMode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t targetProtectionMode = self->_targetProtectionMode;
  os_unfair_lock_unlock(p_lock);
  return targetProtectionMode;
}

- (void)setCategory:(id)a3
{
  id v4 = (HMAccessoryCategory *)a3;
  os_unfair_lock_lock_with_options();
  category = self->_category;
  self->_category = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMAccessoryCategory)category
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_category;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setManufacturer:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  manufacturer = self->_manufacturer;
  self->_manufacturer = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)manufacturer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_manufacturer;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMHome)home
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);

  return (HMHome *)WeakRetained;
}

- (BOOL)mergeFromNewObject:(id)a3
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
    uint64_t v7 = [(HMAccessoryNetworkProtectionGroup *)self manufacturer];
    uint64_t v8 = [v6 manufacturer];
    char v9 = HMFEqualObjects();

    if ((v9 & 1) == 0)
    {
      v10 = [v6 manufacturer];
      [(HMAccessoryNetworkProtectionGroup *)self setManufacturer:v10];
    }
    id v11 = [(HMAccessoryNetworkProtectionGroup *)self category];
    id v12 = [v6 category];
    char v13 = HMFEqualObjects();

    if (v13)
    {
      char v14 = v9 ^ 1;
    }
    else
    {
      v15 = [v6 category];
      [(HMAccessoryNetworkProtectionGroup *)self setCategory:v15];

      char v14 = 1;
    }
    int64_t v16 = [(HMAccessoryNetworkProtectionGroup *)self targetProtectionMode];
    if (v16 != [v6 targetProtectionMode])
    {
      -[HMAccessoryNetworkProtectionGroup setTargetProtectionMode:](self, "setTargetProtectionMode:", [v6 targetProtectionMode]);
      char v14 = 1;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
  char v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end