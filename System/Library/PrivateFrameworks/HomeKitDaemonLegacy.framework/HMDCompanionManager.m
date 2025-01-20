@interface HMDCompanionManager
+ (BOOL)isCompatibleCompanionDevice:(id)a3;
+ (id)logCategory;
+ (id)sharedManager;
+ (id)shortDescription;
- (HMDCompanionManager)init;
- (HMDDevice)companion;
- (HMDIDSService)service;
- (id)attributeDescriptions;
- (void)__initializeConnectedDevices;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation HMDCompanionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (HMDIDSService)service
{
  return self->_service;
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCompanionManager *)self service];

  if (v8 == v6)
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v12;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Connected devices changed: %@", (uint8_t *)&v13, 0x16u);
    }
    __HMDCompanionManagerUpdateWithConnectedDevices(v10, v7);
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCompanionManager *)self service];

  if (v8 == v6)
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v12;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Devices changed: %@", buf, 0x16u);
    }
    int v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v19, "isConnected", (void)v20)) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }

    __HMDCompanionManagerUpdateWithConnectedDevices(v10, v13);
  }
}

- (HMDDevice)companion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_companion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)__initializeConnectedDevices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCompanionManager *)self service];
  v4 = [v3 devices];

  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "isConnected", (void)v12)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  __HMDCompanionManagerUpdateWithConnectedDevices(self, v5);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDCompanionManager *)self companion];
  v5 = (void *)[v3 initWithName:@"Companion" value:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (HMDCompanionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)HMDCompanionManager;
  v2 = [(HMDCompanionManager *)&v12 init];
  if (v2)
  {
    HMDispatchQueueNameString();
    id v3 = objc_claimAutoreleasedReturnValue();
    v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[HMDIDSServiceManager sharedManager];
    uint64_t v9 = [v8 proxyService];
    service = v2->_service;
    v2->_service = (HMDIDSService *)v9;

    [(HMDIDSService *)v2->_service addDelegate:v2 queue:v2->_queue];
    [(HMDCompanionManager *)v2 __initializeConnectedDevices];
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_67623 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_67623, &__block_literal_global_67624);
  }
  v2 = (void *)logCategory__hmf_once_v7_67625;
  return v2;
}

uint64_t __34__HMDCompanionManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_67625;
  logCategory__hmf_once_v7_67625 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  return @"Companion Manager";
}

+ (BOOL)isCompatibleCompanionDevice:(id)a3
{
  return 0;
}

+ (id)sharedManager
{
  id v3 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v4 = [v3 productPlatform];

  if (v4 == 3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__HMDCompanionManager_sharedManager__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedManager_onceToken_67634 != -1) {
      dispatch_once(&sharedManager_onceToken_67634, block);
    }
    id v5 = (id)sharedManager_companionManager;
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

uint64_t __36__HMDCompanionManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedManager_companionManager;
  sharedManager_companionManager = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

@end