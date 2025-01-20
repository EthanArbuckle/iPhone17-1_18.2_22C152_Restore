@interface HMMediaSystemComponent
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)mediaSystemComponentWithDictionary:(id)a3 home:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)mergeRoleWithComponent:(id)a3;
- (HMAccessory)accessory;
- (HMMediaProfile)mediaProfile;
- (HMMediaSystemComponent)initWithCoder:(id)a3;
- (HMMediaSystemComponent)initWithMediaProfile:(id)a3 role:(id)a4;
- (HMMediaSystemComponent)initWithUUID:(id)a3 mediaProfile:(id)a4 role:(id)a5;
- (HMMediaSystemRole)role;
- (NSString)description;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)logIdentifier;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)serialize;
- (unint64_t)hash;
- (void)_unconfigure;
- (void)_updateAccessoryReference:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setRole:(id)a3;
@end

@implementation HMMediaSystemComponent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_role, 0);

  objc_destroyWeak((id *)&self->_mediaProfile);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [HMMutableMediaSystemComponent alloc];
  v5 = [(HMMediaSystemComponent *)self mediaProfile];
  v6 = [(HMMediaSystemComponent *)self role];
  v7 = [(HMMediaSystemComponent *)v4 initWithMediaProfile:v5 role:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_60217 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_60217, &__block_literal_global_60218);
  }
  v2 = (void *)logCategory__hmf_once_v1_60219;

  return v2;
}

uint64_t __37__HMMediaSystemComponent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_60219;
  logCategory__hmf_once_v1_60219 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)mediaSystemComponentWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v5 = kMediaSystemComponentUUIDCodingKey;
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v7, "hmf_UUIDForKey:", v5);
  v9 = objc_msgSend(v7, "hmf_UUIDForKey:", @"kAccessoryUUID");
  v10 = objc_msgSend(v7, "hmf_dictionaryForKey:", kMediaSystemComponentRoleCodingKey);

  v11 = [[HMMediaSystemRole alloc] initWithDictionary:v10];
  v12 = [v6 accessories];

  v13 = objc_msgSend(v12, "hmf_firstObjectWithUUID:", v9);

  v14 = [v13 mediaProfile];
  v15 = [[HMMediaSystemComponent alloc] initWithUUID:v8 mediaProfile:v14 role:v11];

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HMMediaSystemComponent alloc];
  uint64_t v5 = [(HMMediaSystemComponent *)self mediaProfile];
  id v6 = [(HMMediaSystemComponent *)self role];
  id v7 = [(HMMediaSystemComponent *)v4 initWithMediaProfile:v5 role:v6];

  return v7;
}

- (BOOL)mergeRoleWithComponent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMMediaSystemComponent *)self role];
  id v6 = [v4 role];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [v4 role];
      int v15 = 138543618;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating component role: %@ during merge", (uint8_t *)&v15, 0x16u);
    }
    v13 = [v4 role];
    [(HMMediaSystemComponent *)v9 setRole:v13];
  }
  return v7 ^ 1;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    BOOL v7 = [(HMMediaSystemComponent *)self mergeRoleWithComponent:v6];
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get component for merge", (uint8_t *)&v13, 0xCu);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (id)serialize
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(HMMediaSystemComponent *)self uuid];
  uint64_t v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:kMediaSystemComponentUUIDCodingKey];

  id v6 = [(HMMediaSystemComponent *)self accessory];
  BOOL v7 = [v6 uuid];
  v8 = [v7 UUIDString];
  [v3 setObject:v8 forKeyedSubscript:@"kAccessoryUUID"];

  v9 = [(HMMediaSystemComponent *)self role];
  v10 = [v9 serialize];
  [v3 setObject:v10 forKeyedSubscript:kMediaSystemComponentRoleCodingKey];

  v11 = (void *)[v3 copy];

  return v11;
}

- (void)setAccessory:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_accessory, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMAccessory)accessory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  os_unfair_lock_unlock(p_lock);

  return (HMAccessory *)WeakRetained;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  BOOL v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)setRole:(id)a3
{
  id v4 = (HMMediaSystemRole *)a3;
  os_unfair_lock_lock_with_options();
  role = self->_role;
  self->_role = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMMediaSystemRole)role
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_role;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMMediaProfile)mediaProfile
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  id v5 = [WeakRetained mediaProfile];

  os_unfair_lock_unlock(p_lock);

  return (HMMediaProfile *)v5;
}

- (HMMediaSystemComponent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMediaSystemComponent *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kMediaSystemComponentUUIDCodingKey];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
    objc_storeWeak((id *)&v5->_accessory, v8);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kMediaSystemComponentRoleCodingKey];
    role = v5->_role;
    v5->_role = (HMMediaSystemRole *)v9;
  }
  return v5;
}

- (void)_updateAccessoryReference:(id)a3
{
  id v4 = [a3 accessories];
  id v5 = [(HMMediaSystemComponent *)self accessory];
  uint64_t v6 = [v5 uuid];
  objc_msgSend(v4, "hmf_firstObjectWithUUID:", v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [(HMMediaSystemComponent *)self setAccessory:v7];
}

- (unint64_t)hash
{
  v2 = [(HMMediaSystemComponent *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMMediaSystemComponent *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      id v7 = [(HMMediaSystemComponent *)self uuid];
      v8 = [(HMMediaSystemComponent *)v6 uuid];
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        uint64_t v9 = [(HMMediaSystemComponent *)self role];
        v10 = [(HMMediaSystemComponent *)v6 role];
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
  }
  return v11;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HMMediaSystemComponent *)self uuid];
  uint64_t v6 = [(HMMediaSystemComponent *)self accessory];
  id v7 = [v6 uniqueIdentifier];
  v8 = [(HMMediaSystemComponent *)self role];
  uint64_t v9 = [v3 stringWithFormat:@"<%@ uuid: %@ accessory identifier: %@ role: %@>", v4, v5, v7, v8];

  return (NSString *)v9;
}

- (id)logIdentifier
{
  v2 = [(HMMediaSystemComponent *)self uuid];
  unint64_t v3 = [v2 UUIDString];

  return v3;
}

- (void)_unconfigure
{
  [(HMMediaSystemComponent *)self setAccessory:0];

  [(HMMediaSystemComponent *)self setRole:0];
}

- (HMMediaSystemComponent)initWithUUID:(id)a3 mediaProfile:(id)a4 role:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMMediaSystemComponent;
  v12 = [(HMMediaSystemComponent *)&v16 init];
  int v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    v14 = [v10 accessory];
    objc_storeWeak((id *)&v13->_accessory, v14);

    objc_storeStrong((id *)&v13->_role, a5);
  }

  return v13;
}

- (HMMediaSystemComponent)initWithMediaProfile:(id)a3 role:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 UUID];
  id v10 = [(HMMediaSystemComponent *)self initWithUUID:v9 mediaProfile:v8 role:v7];

  return v10;
}

@end