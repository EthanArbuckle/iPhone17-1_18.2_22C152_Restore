@interface HMDMediaSystemComponent
+ (BOOL)supportsSecureCoding;
+ (id)accessoryForMediaSystemComponentWithDictionary:(id)a3 home:(id)a4;
+ (id)logCategory;
+ (id)mediaSystemComponentWithDictionary:(id)a3 home:(id)a4;
- (HMDAccessory)accessory;
- (HMDMediaProfile)mediaProfile;
- (HMDMediaSystemComponent)initWithCoder:(id)a3;
- (HMDMediaSystemComponent)initWithUUID:(id)a3 accessory:(id)a4 role:(id)a5;
- (HMMediaSystemRole)role;
- (NSUUID)uuid;
- (OS_dispatch_queue)propertyQueue;
- (id)attributeDescriptions;
- (id)dumpState;
- (id)logIdentifier;
- (id)serialize;
- (void)encodeWithCoder:(id)a3;
- (void)setRole:(id)a3;
@end

@implementation HMDMediaSystemComponent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

- (OS_dispatch_queue)propertyQueue
{
  return self->_propertyQueue;
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDMediaSystemComponent *)self uuid];
  [v4 encodeObject:v5 forKey:*MEMORY[0x263F0EA70]];

  v6 = [(HMDMediaSystemComponent *)self accessory];
  [v4 encodeConditionalObject:v6 forKey:@"accessory"];

  id v7 = [(HMDMediaSystemComponent *)self role];
  [v4 encodeObject:v7 forKey:*MEMORY[0x263F0EA68]];
}

- (HMDMediaSystemComponent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0EA70]];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0EA68]];

  v8 = [(HMDMediaSystemComponent *)self initWithUUID:v5 accessory:v6 role:v7];
  return v8;
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

- (HMDMediaProfile)mediaProfile
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = WeakRetained;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 mediaProfile];

  os_unfair_lock_unlock(p_lock);
  return (HMDMediaProfile *)v7;
}

- (id)serialize
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(HMDMediaSystemComponent *)self uuid];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F0EA70]];

  id v6 = [(HMDMediaSystemComponent *)self accessory];
  id v7 = [v6 uuid];
  v8 = [v7 UUIDString];
  [v3 setObject:v8 forKeyedSubscript:@"kAccessoryUUID"];

  v9 = [(HMDMediaSystemComponent *)self role];
  v10 = [v9 serialize];
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x263F0EA68]];

  v11 = (void *)[v3 copy];
  return v11;
}

- (id)dumpState
{
  return 0;
}

- (id)logIdentifier
{
  v2 = [(HMDMediaSystemComponent *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)attributeDescriptions
{
  v16[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = [(HMDMediaSystemComponent *)self uuid];
  v5 = (void *)[v3 initWithName:@"uuid" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  id v7 = [(HMDMediaSystemComponent *)self accessory];
  v8 = [v7 uuid];
  v9 = (void *)[v6 initWithName:@"accessoryUUID" value:v8];
  v16[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMDMediaSystemComponent *)self role];
  [v11 type];
  v12 = HMMediaSystemRoleTypeAsString();
  v13 = (void *)[v10 initWithName:@"roleType" value:v12];
  v16[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

  return v14;
}

- (HMDMediaSystemComponent)initWithUUID:(id)a3 accessory:(id)a4 role:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDMediaSystemComponent;
  v12 = [(HMDMediaSystemComponent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    objc_storeWeak((id *)&v13->_accessory, v10);
    objc_storeStrong((id *)&v13->_role, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_152611 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_152611, &__block_literal_global_152612);
  }
  v2 = (void *)logCategory__hmf_once_v5_152613;
  return v2;
}

void __38__HMDMediaSystemComponent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_152613;
  logCategory__hmf_once_v5_152613 = v0;
}

+ (id)mediaSystemComponentWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v5, "hmf_UUIDForKey:", *MEMORY[0x263F0EA70]);
  if (v7)
  {
    v8 = +[HMDMediaSystemComponent accessoryForMediaSystemComponentWithDictionary:v5 home:v6];
    if (v8)
    {
      id v9 = objc_msgSend(v5, "hmf_dictionaryForKey:", *MEMORY[0x263F0EA68]);
      id v10 = (void *)[objc_alloc(MEMORY[0x263F0E560]) initWithDictionary:v9];
      if (v10)
      {
        id v11 = [[HMDMediaSystemComponent alloc] initWithUUID:v7 accessory:v8 role:v10];
      }
      else
      {
        v18 = (void *)MEMORY[0x230FBD990]();
        v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = HMFGetLogIdentifier();
          int v22 = 138543618;
          v23 = v20;
          __int16 v24 = 2112;
          id v25 = v5;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Role entry is nil - cannot create mediaSystemComponent with %@", (uint8_t *)&v22, 0x16u);
        }
        id v11 = 0;
      }
    }
    else
    {
      objc_super v15 = (void *)MEMORY[0x230FBD990]();
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        int v22 = 138543874;
        v23 = v17;
        __int16 v24 = 2112;
        id v25 = v5;
        __int16 v26 = 2112;
        id v27 = v6;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@accessory cannot be looked up - cannot create mediaSystemComponent with %@in home %@", (uint8_t *)&v22, 0x20u);
      }
      id v11 = 0;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v22 = 138543618;
      v23 = v14;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@mediaComponentUUID is nil - cannot create mediaSystemComponent with %@", (uint8_t *)&v22, 0x16u);
    }
    id v11 = 0;
  }

  return v11;
}

+ (id)accessoryForMediaSystemComponentWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v5, "hmf_UUIDForKey:", @"kAccessoryUUID");
  if (v7)
  {
    v8 = [v6 accessories];
    id v9 = objc_msgSend(v8, "hmf_firstObjectWithUUID:", v7);
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v14 = 138543874;
      objc_super v15 = v12;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@accessoryUUID is nil transaction dictionary - cannot find accessory with %@in home %@", (uint8_t *)&v14, 0x20u);
    }
    id v9 = 0;
  }

  return v9;
}

@end