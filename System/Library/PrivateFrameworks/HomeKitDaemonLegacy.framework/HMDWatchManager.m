@interface HMDWatchManager
+ (BOOL)isCompatibleWatchDevice:(id)a3;
+ (id)logCategory;
+ (id)sharedManager;
+ (id)shortDescription;
- (BOOL)isPairedWithWatch;
- (HMDIDSService)service;
- (HMDWatchManager)init;
- (NSArray)connectedWatches;
- (NSArray)watches;
- (id)attributeDescriptions;
- (id)connectedWatchFromDeviceID:(id)a3;
- (void)__initializeConnectedDevices;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation HMDWatchManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_connectedWatches, 0);
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
  id v8 = [(HMDWatchManager *)self service];

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
    __HMDWatchManagerUpdateWithConnectedDevices(v10, v7);
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDWatchManager *)self service];

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

    __HMDWatchManagerUpdateWithConnectedDevices(v10, v13);
  }
}

- (id)connectedWatchFromDeviceID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_connectedWatches;
  id v7 = (id)[(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "remoteDestinationString", (void)v14);
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSArray)connectedWatches
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_connectedWatches;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isPairedWithWatch
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_pairedWithWatch;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSArray)watches
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDWatchManager *)self service];
  id v4 = [v3 devices];
  v5 = (void *)[v4 copy];

  long long v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (+[HMDWatchManager isCompatibleWatchDevice:v11])
        {
          char v12 = [HMDDevice alloc];
          int v13 = [(HMDWatchManager *)self service];
          long long v14 = [(HMDDevice *)v12 initWithService:v13 device:v11];

          if (v14) {
            [v17 addObject:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  long long v15 = (void *)[v17 copy];
  return (NSArray *)v15;
}

- (void)__initializeConnectedDevices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDWatchManager *)self service];
  id v4 = [v3 devices];

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
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (+[HMDWatchManager isCompatibleWatchDevice:](HMDWatchManager, "isCompatibleWatchDevice:", v11, (void)v12)&& [v11 isConnected])
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  __HMDWatchManagerUpdateWithConnectedDevices(self, v5);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMDWatchManager *)self connectedWatches];
  v5 = (void *)[v3 initWithName:@"Connected Watches" value:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (HMDWatchManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)HMDWatchManager;
  v2 = [(HMDWatchManager *)&v14 init];
  if (v2)
  {
    HMDispatchQueueNameString();
    id v3 = objc_claimAutoreleasedReturnValue();
    id v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1C978] array];
    connectedWatches = v2->_connectedWatches;
    v2->_connectedWatches = (NSArray *)v8;

    v10 = +[HMDIDSServiceManager sharedManager];
    uint64_t v11 = [v10 proxyService];
    service = v2->_service;
    v2->_service = (HMDIDSService *)v11;

    [(HMDIDSService *)v2->_service addDelegate:v2 queue:v2->_queue];
    [(HMDWatchManager *)v2 __initializeConnectedDevices];
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_151165 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_151165, &__block_literal_global_151166);
  }
  v2 = (void *)logCategory__hmf_once_v8_151167;
  return v2;
}

uint64_t __30__HMDWatchManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8_151167;
  logCategory__hmf_once_v8_151167 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  return @"Watch Manager";
}

+ (BOOL)isCompatibleWatchDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 productName];
  v5 = [v3 productVersion];

  LODWORD(v3) = NRWatchOSVersion();
  return (v3 & 0xFFFE0000) != 0;
}

+ (id)sharedManager
{
  if (+[HMDDeviceCapabilities isCompanionCapable])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__HMDWatchManager_sharedManager__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedManager_onceToken_151176 != -1) {
      dispatch_once(&sharedManager_onceToken_151176, block);
    }
    id v3 = (id)sharedManager_watchManager;
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

uint64_t __32__HMDWatchManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedManager_watchManager;
  sharedManager_watchManager = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

@end