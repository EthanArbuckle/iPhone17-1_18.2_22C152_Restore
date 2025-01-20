@interface _HMAccessoryProfile
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAccessory)accessory;
- (HMHome)home;
- (NSArray)services;
- (NSString)assistantIdentifier;
- (NSString)description;
- (NSUUID)profileUniqueIdentifier;
- (NSUUID)uniqueIdentifier;
- (_HMAccessoryProfile)initWithCoder:(id)a3;
- (_HMAccessoryProfile)initWithUUID:(id)a3 services:(id)a4;
- (_HMContext)context;
- (unint64_t)hash;
- (void)__configureWithContext:(id)a3 accessory:(id)a4;
- (void)_recomputeAssistantIdentifier;
- (void)_unconfigureContext;
- (void)recomputeAssistantIdentifier;
- (void)setAssistantIdentifier:(id)a3;
@end

@implementation _HMAccessoryProfile

- (unint64_t)hash
{
  v2 = [(_HMAccessoryProfile *)self profileUniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)profileUniqueIdentifier
{
  return self->_profileUniqueIdentifier;
}

- (NSArray)services
{
  return self->_services;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_profileUniqueIdentifier);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)__configureWithContext:(id)a3 accessory:(id)a4
{
  objc_storeStrong((id *)&self->_context, a3);
  id v6 = a4;
  objc_storeWeak((id *)&self->_accessory, v6);
  v7 = [v6 home];

  objc_storeWeak((id *)&self->_home, v7);

  [(_HMAccessoryProfile *)self _registerNotificationHandlers];
}

- (_HMContext)context
{
  return self->_context;
}

- (_HMAccessoryProfile)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.accessoryProfileUUID"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v9 = [v7 setWithArray:v8];
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"services"];

  if (v6 && v10)
  {
    v11 = [(_HMAccessoryProfile *)self initWithUUID:v6 services:v10];
    if (v11)
    {
      v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
      objc_storeWeak((id *)&v11->_accessory, v12);
    }
    v13 = v11;
    v14 = v13;
  }
  else
  {
    v15 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v19 = 138543874;
      v20 = v17;
      __int16 v21 = 2112;
      v22 = v6;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded profileUniqueIdentifier: %@ services: %@", (uint8_t *)&v19, 0x20u);
    }
    v14 = 0;
  }

  return v14;
}

- (_HMAccessoryProfile)initWithUUID:(id)a3 services:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HMAccessoryProfile;
  v8 = [(_HMAccessoryProfile *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v6);
    profileUniqueIdentifier = v8->_profileUniqueIdentifier;
    v8->_profileUniqueIdentifier = (NSUUID *)v9;

    objc_storeStrong((id *)&v8->_services, a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HMAccessoryProfile *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(_HMAccessoryProfile *)self profileUniqueIdentifier];
      id v7 = [(_HMAccessoryProfile *)v5 profileUniqueIdentifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = [(_HMAccessoryProfile *)self accessory];
  v5 = [(_HMAccessoryProfile *)self profileUniqueIdentifier];
  id v6 = [v5 UUIDString];
  id v7 = [v3 stringWithFormat:@"_HMAccessoryProfile %@: %@", v4, v6];

  return (NSString *)v7;
}

- (HMAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);

  return (HMAccessory *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_profileUniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (HMHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);

  return (HMHome *)WeakRetained;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (void)recomputeAssistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(_HMAccessoryProfile *)self _recomputeAssistantIdentifier];

  os_unfair_lock_unlock(p_lock);
}

- (NSString)assistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    [(_HMAccessoryProfile *)self _recomputeAssistantIdentifier];
    assistantIdentifier = self->_assistantIdentifier;
  }
  v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)_recomputeAssistantIdentifier
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_services, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_services;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = NSString;
        v10 = [*(id *)(*((void *)&v15 + 1) + 8 * v8) instanceID];
        v11 = [v9 stringWithFormat:@"%@", v10];
        [v3 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  objc_super v12 = [(_HMAccessoryProfile *)self profileUniqueIdentifier];
  hm_assistantIdentifierWithSalts(@"SV", (uint64_t)v12, (uint64_t)v3);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v13;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  return 0;
}

- (void)_unconfigureContext
{
  unint64_t v3 = [(_HMContext *)self->_context messageDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  context = self->_context;
  self->_context = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end