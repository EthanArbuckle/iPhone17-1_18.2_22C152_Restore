@interface HMDAccessoryNetworkProtectionGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDAccessoryNetworkProtectionGroup)initWithCoder:(id)a3;
- (HMDAccessoryNetworkProtectionGroup)initWithModel:(id)a3;
- (HMDAccessoryNetworkProtectionGroup)initWithUUID:(id)a3 manufacturer:(id)a4 category:(id)a5 targetProtectionMode:(int64_t)a6;
- (HMDHome)home;
- (NSNumber)category;
- (NSString)description;
- (NSString)manufacturer;
- (NSUUID)uuid;
- (id)modelForVersion:(int64_t)a3;
- (id)modelWithObjectChangeType:(unint64_t)a3;
- (int64_t)targetProtectionMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setHome:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setTargetProtectionMode:(int64_t)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDAccessoryNetworkProtectionGroup

- (unint64_t)hash
{
  v2 = [(HMDAccessoryNetworkProtectionGroup *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  int v4 = objc_msgSend(v13, "hmd_isForXPCTransport");
  int v5 = objc_msgSend(v13, "hmd_isForXPCTransportEntitledForSPIAccess");
  if ((objc_msgSend(v13, "hmd_isForRemoteGatewayCoder") & 1) == 0)
  {
    if ((v4 ^ 1 | v5) == 1)
    {
      v6 = [(HMDAccessoryNetworkProtectionGroup *)self uuid];
      [v13 encodeObject:v6 forKey:*MEMORY[0x1E4F2C4A0]];

      v7 = [(HMDAccessoryNetworkProtectionGroup *)self manufacturer];
      [v13 encodeObject:v7 forKey:*MEMORY[0x1E4F2C470]];

      int64_t v8 = [(HMDAccessoryNetworkProtectionGroup *)self targetProtectionMode];
      [v13 encodeInteger:v8 forKey:*MEMORY[0x1E4F2C480]];
    }
    if (v4)
    {
      if (!v5) {
        goto LABEL_9;
      }
      v9 = (void *)MEMORY[0x1E4F2E520];
      v10 = [(HMDAccessoryNetworkProtectionGroup *)self category];
      v11 = [v9 categoryWithCategoryIdentifier:v10];

      v12 = (__CFString *)*MEMORY[0x1E4F2C468];
    }
    else
    {
      v11 = [(HMDAccessoryNetworkProtectionGroup *)self category];
      v12 = @"HMDAccessoryNetworkProtectionGroupCategoryCodingKey";
    }
    [v13 encodeObject:v11 forKey:v12];
  }
LABEL_9:
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)targetProtectionMode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t targetProtectionMode = self->_targetProtectionMode;
  os_unfair_lock_unlock(p_lock);
  return targetProtectionMode;
}

- (NSString)manufacturer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int v4 = self->_manufacturer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)category
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int v4 = self->_category;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    v14 = [v10 transactionResult];
    if ([v13 propertyWasSet:@"targetProtectionMode"])
    {
      int64_t v15 = [(HMDAccessoryNetworkProtectionGroup *)self targetProtectionMode];
      v16 = [v13 targetProtectionMode];
      uint64_t v17 = [v16 integerValue];

      if (v15 != v17)
      {
        v18 = [v13 targetProtectionMode];
        -[HMDAccessoryNetworkProtectionGroup setTargetProtectionMode:](self, "setTargetProtectionMode:", [v18 integerValue]);

        [v14 markChanged];
        v19 = [(HMDAccessoryNetworkProtectionGroup *)self uuid];
        v41[0] = v19;
        v40[1] = *MEMORY[0x1E4F2C488];
        v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessoryNetworkProtectionGroup targetProtectionMode](self, "targetProtectionMode"));
        v41[1] = v20;
        v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];

        v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v22 postNotificationName:@"HMDAccessoryNetworkProtectionGroupProtectionModeUpdated" object:self userInfo:v21];
      }
    }
    uint64_t v23 = [v13 manufacturer];
    if (v23)
    {
      v24 = (void *)v23;
      v25 = [(HMDAccessoryNetworkProtectionGroup *)self manufacturer];
      v26 = [v13 manufacturer];
      char v27 = HMFEqualObjects();

      if ((v27 & 1) == 0)
      {
        v28 = [v13 manufacturer];
        [(HMDAccessoryNetworkProtectionGroup *)self setManufacturer:v28];

        [v14 markChanged];
      }
    }
    uint64_t v29 = [v13 category];
    if (v29)
    {
      v30 = (void *)v29;
      v31 = [(HMDAccessoryNetworkProtectionGroup *)self category];
      v32 = [v13 category];
      char v33 = HMFEqualObjects();

      if ((v33 & 1) == 0)
      {
        v34 = [v13 category];
        [(HMDAccessoryNetworkProtectionGroup *)self setCategory:v34];

        [v14 markChanged];
      }
    }
    [v10 respondWithPayload:0];
  }
  else
  {
    v35 = (void *)MEMORY[0x1D9452090]();
    v36 = self;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v43 = v38;
      __int16 v44 = 2112;
      id v45 = v11;
      __int16 v46 = 2112;
      id v47 = (id)objc_opt_class();
      id v39 = v47;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);
    }
    v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v10 respondWithError:v14];
  }
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    int v14 = 138543874;
    int64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = (id)objc_opt_class();
    id v12 = v19;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", (uint8_t *)&v14, 0x20u);
  }
  id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  [v7 respondWithError:v13];
}

- (id)modelForVersion:(int64_t)a3
{
  if (a3 < 4)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = [(HMDAccessoryNetworkProtectionGroup *)self modelWithObjectChangeType:1];
    int v5 = [(HMDAccessoryNetworkProtectionGroup *)self manufacturer];
    [v4 setManufacturer:v5];

    id v6 = [(HMDAccessoryNetworkProtectionGroup *)self category];
    [v4 setCategory:v6];

    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessoryNetworkProtectionGroup targetProtectionMode](self, "targetProtectionMode"));
    [v4 setTargetProtectionMode:v7];
  }
  return v4;
}

- (id)modelWithObjectChangeType:(unint64_t)a3
{
  int v5 = [HMDAccessoryNetworkProtectionGroupModel alloc];
  id v6 = [(HMDAccessoryNetworkProtectionGroup *)self uuid];
  id v7 = [(HMDAccessoryNetworkProtectionGroup *)self home];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  return v9;
}

- (HMDAccessoryNetworkProtectionGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C4A0]];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C470]];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAccessoryNetworkProtectionGroupCategoryCodingKey"];
  uint64_t v8 = [v4 decodeIntegerForKey:*MEMORY[0x1E4F2C480]];

  id v9 = [(HMDAccessoryNetworkProtectionGroup *)self initWithUUID:v5 manufacturer:v6 category:v7 targetProtectionMode:v8];
  return v9;
}

- (void)setCategory:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  category = self->_category;
  self->_category = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setManufacturer:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  manufacturer = self->_manufacturer;
  self->_manufacturer = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setTargetProtectionMode:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_int64_t targetProtectionMode = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = [(HMDAccessoryNetworkProtectionGroup *)self uuid];
  int v5 = [(HMDAccessoryNetworkProtectionGroup *)self manufacturer];
  id v6 = [(HMDAccessoryNetworkProtectionGroup *)self category];
  [(HMDAccessoryNetworkProtectionGroup *)self targetProtectionMode];
  id v7 = HMAccessoryNetworkProtectionModeAsString();
  uint64_t v8 = [v3 stringWithFormat:@"[ uuid = %@, manufacturer = %@, category = %@, targetProtectionMode = %@ ]", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccessoryNetworkProtectionGroup *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v5 = v4;
    }
    else {
      int v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      id v7 = [(HMDAccessoryNetworkProtectionGroup *)self uuid];
      uint64_t v8 = [(HMDAccessoryNetworkProtectionGroup *)v6 uuid];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (HMDAccessoryNetworkProtectionGroup)initWithModel:(id)a3
{
  id v4 = a3;
  int v5 = [v4 uuid];
  id v6 = [v4 manufacturer];
  id v7 = [v4 category];
  uint64_t v8 = [v4 targetProtectionMode];

  char v9 = -[HMDAccessoryNetworkProtectionGroup initWithUUID:manufacturer:category:targetProtectionMode:](self, "initWithUUID:manufacturer:category:targetProtectionMode:", v5, v6, v7, [v8 integerValue]);
  return v9;
}

- (HMDAccessoryNetworkProtectionGroup)initWithUUID:(id)a3 manufacturer:(id)a4 category:(id)a5 targetProtectionMode:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDAccessoryNetworkProtectionGroup;
  int v14 = [(HMDAccessoryNetworkProtectionGroup *)&v17 init];
  int64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_uuid, a3);
    objc_storeStrong((id *)&v15->_manufacturer, a4);
    objc_storeStrong((id *)&v15->_category, a5);
    v15->_int64_t targetProtectionMode = a6;
  }

  return v15;
}

@end