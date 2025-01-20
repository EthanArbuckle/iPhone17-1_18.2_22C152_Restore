@interface HMDAccessoryProfile
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (HMDAccessory)accessory;
- (HMDAccessoryProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5;
- (HMDAccessoryProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5 workQueue:(id)a6;
- (HMDAccessoryProfile)initWithCoder:(id)a3;
- (HMFMessageDispatcher)msgDispatcher;
- (NSArray)services;
- (NSString)contextID;
- (NSString)description;
- (NSString)logIdentifier;
- (NSUUID)contextSPIUniqueIdentifier;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)dumpState;
- (id)findServiceWithType:(id)a3;
- (id)runtimeState;
- (unint64_t)hash;
- (void)configureWithMessageDispatcher:(id)a3 configurationTracker:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDAccessoryProfile

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (id)runtimeState
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  v6 = [v5 UUIDString];
  [v4 encodeObject:v6 forKey:@"HM.accessoryProfileUUID"];

  v7 = [(HMDAccessoryProfile *)self accessory];
  [v4 encodeConditionalObject:v7 forKey:@"accessory"];

  id v8 = [(HMDAccessoryProfile *)self services];
  [v4 encodeObject:v8 forKey:@"services"];
}

- (NSArray)services
{
  return self->_services;
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccessoryProfile *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMDAccessoryProfile *)self uniqueIdentifier];
      id v8 = [(HMDAccessoryProfile *)v6 uniqueIdentifier];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSUUID)contextSPIUniqueIdentifier
{
  unint64_t v3 = +[HMDProcessInfo privateClientIdentifierSalt];
  id v4 = (void *)MEMORY[0x1E4F29128];
  v5 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  v6 = objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:identifierSalt:", v5, v3);

  return (NSUUID *)v6;
}

- (NSString)contextID
{
  unint64_t v3 = NSString;
  id v4 = [(HMDAccessoryProfile *)self accessory];
  v5 = [v4 contextID];
  v6 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  v7 = [v3 stringWithFormat:@"%@:%@", v5, v6];

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (HMDAccessoryProfile)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
  id v6 = objc_alloc(MEMORY[0x1E4F29128]);
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.accessoryProfileUUID"];
  id v8 = (void *)[v6 initWithUUIDString:v7];

  char v9 = (void *)MEMORY[0x1E4F1CAD0];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v11 = [v9 setWithArray:v10];
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"services"];

  v13 = [(HMDAccessoryProfile *)self initWithAccessory:v5 uniqueIdentifier:v8 services:v12];
  return v13;
}

- (id)findServiceWithType:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(HMDAccessoryProfile *)self services];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 serviceType];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)configureWithMessageDispatcher:(id)a3 configurationTracker:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  char v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    char v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    __int16 v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring profile: %@", buf, 0x16u);
  }
  if (v6)
  {
    if (v7) {
      dispatch_group_enter(v7);
    }
    v12 = [(HMDAccessoryProfile *)v9 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__HMDAccessoryProfile_configureWithMessageDispatcher_configurationTracker___block_invoke;
    block[3] = &unk_1E6A19668;
    block[4] = v9;
    id v14 = v6;
    long long v15 = v7;
    dispatch_async(v12, block);
  }
}

void __75__HMDAccessoryProfile_configureWithMessageDispatcher_configurationTracker___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) registerForMessages];
  [*(id *)(a1 + 32) handleInitialState];
  v2 = *(NSObject **)(a1 + 48);
  if (v2)
  {
    dispatch_group_leave(v2);
  }
}

- (NSString)description
{
  v2 = NSString;
  unint64_t v3 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  id v4 = [v2 stringWithFormat:@"identifier: %@", v3];

  return (NSString *)v4;
}

- (id)dumpState
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  unint64_t v3 = [(HMDAccessoryProfile *)self description];
  id v4 = [v2 dictionaryWithObject:v3 forKey:*MEMORY[0x1E4F64EA0]];

  return v4;
}

- (HMDAccessoryProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5 workQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HMDAccessoryProfile;
  id v14 = [(HMDAccessoryProfile *)&v26 init];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    uniqueIdentifier = v14->_uniqueIdentifier;
    v14->_uniqueIdentifier = (NSUUID *)v15;

    objc_storeStrong((id *)&v14->_workQueue, a6);
    objc_storeWeak((id *)&v14->_accessory, v10);
    if (v12)
    {
      v17 = (void *)[v12 copy];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1C978] array];
    }
    __int16 v18 = v17;
    objc_storeStrong((id *)&v14->_services, v17);

    v19 = [v10 home];
    uint64_t v20 = NSString;
    v21 = [v19 name];
    v22 = [v10 name];
    uint64_t v23 = [v20 stringWithFormat:@"%@/%@/%@", v21, v22, v11];
    logIdentifier = v14->_logIdentifier;
    v14->_logIdentifier = (NSString *)v23;
  }
  return v14;
}

- (HMDAccessoryProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  HMDispatchQueueNameString();
  id v11 = objc_claimAutoreleasedReturnValue();
  id v12 = (const char *)[v11 UTF8String];
  id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
  uint64_t v15 = [(HMDAccessoryProfile *)self initWithAccessory:v10 uniqueIdentifier:v9 services:v8 workQueue:v14];

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_116944 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_116944, &__block_literal_global_116945);
  }
  v2 = (void *)logCategory__hmf_once_v2_116946;
  return v2;
}

uint64_t __34__HMDAccessoryProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_116946;
  logCategory__hmf_once_v2_116946 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end