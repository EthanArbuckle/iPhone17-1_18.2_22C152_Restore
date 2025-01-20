@interface HMDHomeManagerHH2SharedUserLastSyncManager
+ (id)shortDescription;
- (BOOL)_shouldExpire;
- (BOOL)_shouldPushNow;
- (BOOL)isManagingUserWithMergeID:(id)a3;
- (BOOL)isValid;
- (HMDHomeManagerHH2SharedUserLastSyncManager)initWithHomeManager:(id)a3 archivePaths:(id)a4;
- (NSString)description;
- (double)_expireInterval;
- (double)_interval;
- (double)_nextInterval;
- (double)_pushInterval;
- (id)shortDescription;
- (void)_pushAllUserSyncData;
- (void)_removeAllUserLastSyncData;
- (void)_scheduleNextPush;
- (void)configure;
- (void)removeUserLastSyncData:(id)a3;
- (void)scheduleNextPush;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDHomeManagerHH2SharedUserLastSyncManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_managedMergeIDs, 0);
  objc_storeStrong((id *)&self->_homeToUserMap, 0);
  objc_storeStrong((id *)&self->_userLastSyncs, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (id)shortDescription
{
  v2 = objc_opt_class();
  return (id)[v2 shortDescription];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 64, 1);
  }
  else {
    id Property = 0;
  }
  if (Property == v5)
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Timer fired, pushing last sync to shared users", buf, 0xCu);
    }
    if (self) {
      workQueue = v8->_workQueue;
    }
    else {
      workQueue = 0;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__HMDHomeManagerHH2SharedUserLastSyncManager_timerDidFire___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = v8;
    dispatch_async(workQueue, block);
  }
}

uint64_t __59__HMDHomeManagerHH2SharedUserLastSyncManager_timerDidFire___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pushAllUserSyncData];
}

- (void)_pushAllUserSyncData
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    homeToUserMap = self->_homeToUserMap;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    homeToUserMap = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
  }
  obj = homeToUserMap;
  uint64_t v19 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v29 + 1) + 8 * v20);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        if (self) {
          id v5 = self->_homeToUserMap;
        }
        else {
          id v5 = 0;
        }
        id v21 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v4];
        uint64_t v6 = [v21 countByEnumeratingWithState:&v25 objects:v37 count:16];
        if (v6)
        {
          uint64_t v22 = *(void *)v26;
          do
          {
            uint64_t v7 = 0;
            do
            {
              if (*(void *)v26 != v22) {
                objc_enumerationMutation(v21);
              }
              v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
              v9 = (void *)MEMORY[0x230FBD990]();
              v10 = self;
              v11 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                v12 = HMFGetLogIdentifier();
                v13 = [v8 user];
                *(_DWORD *)buf = 138543618;
                v34 = v12;
                __int16 v35 = 2112;
                v36 = v13;
                _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Pushing last sync for %@", buf, 0x16u);
              }
              objc_initWeak((id *)buf, v10);
              if (self) {
                id WeakRetained = objc_loadWeakRetained((id *)&v10->_homeManager);
              }
              else {
                id WeakRetained = 0;
              }
              v23[0] = MEMORY[0x263EF8330];
              v23[1] = 3221225472;
              v23[2] = __66__HMDHomeManagerHH2SharedUserLastSyncManager__pushAllUserSyncData__block_invoke;
              v23[3] = &unk_264A27740;
              objc_copyWeak(&v24, (id *)buf);
              v23[4] = v8;
              [WeakRetained pushChangesForHH2SharedUserLastSync:v8 completion:v23];

              objc_destroyWeak(&v24);
              objc_destroyWeak((id *)buf);
              ++v7;
            }
            while (v6 != v7);
            uint64_t v15 = [v21 countByEnumeratingWithState:&v25 objects:v37 count:16];
            uint64_t v6 = v15;
          }
          while (v15);
        }

        ++v20;
      }
      while (v20 != v19);
      uint64_t v16 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v29 objects:v38 count:16];
      uint64_t v19 = v16;
    }
    while (v16);
  }
}

void __66__HMDHomeManagerHH2SharedUserLastSyncManager__pushAllUserSyncData__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (a2) {
    [WeakRetained removeUserLastSyncData:*(void *)(a1 + 32)];
  }
  else {
    [WeakRetained scheduleNextPush];
  }
}

- (void)removeUserLastSyncData:(id)a3
{
  id v4 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__HMDHomeManagerHH2SharedUserLastSyncManager_removeUserLastSyncData___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __69__HMDHomeManagerHH2SharedUserLastSyncManager_removeUserLastSyncData___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) user];
    uint64_t v7 = [v6 uuid];
    int v24 = 138543618;
    long long v25 = v5;
    __int16 v26 = 2112;
    long long v27 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Removing user after sync %@", (uint8_t *)&v24, 0x16u);
  }
  [*(id *)(a1 + 40) removeArchiveFromLocalDisk];
  id v8 = *(void **)(a1 + 32);
  if (v8) {
    id v8 = (void *)v8[5];
  }
  v9 = *(void **)(a1 + 40);
  v10 = v8;
  v11 = [v9 homeUUID];
  v12 = [v10 objectForKeyedSubscript:v11];

  [v12 removeObject:*(void *)(a1 + 40)];
  if (![v12 count])
  {
    v13 = *(void **)(a1 + 32);
    if (v13) {
      v13 = (void *)v13[5];
    }
    v14 = *(void **)(a1 + 40);
    uint64_t v15 = v13;
    uint64_t v16 = [v14 homeUUID];
    [v15 setObject:0 forKeyedSubscript:v16];
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    uint64_t v18 = *(void **)(v17 + 40);
  }
  else {
    uint64_t v18 = 0;
  }
  if (![v18 count])
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = *(id *)(a1 + 32);
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v24 = 138543362;
      long long v25 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Last user archive removed", (uint8_t *)&v24, 0xCu);
    }
    uint64_t v23 = *(void *)(a1 + 32);
    if (v23) {
      *(unsigned char *)(v23 + 12) = 0;
    }
  }
  [*(id *)(a1 + 32) _scheduleNextPush];
}

- (void)_removeAllUserLastSyncData
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    homeToUserMap = self->_homeToUserMap;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    homeToUserMap = 0;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
  }
  obj = homeToUserMap;
  uint64_t v20 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v27 + 1) + 8 * v4);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v21 = v4;
        if (self) {
          id v6 = self->_homeToUserMap;
        }
        else {
          id v6 = 0;
        }
        id v22 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v5];
        uint64_t v7 = [v22 countByEnumeratingWithState:&v23 objects:v35 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v24 != v9) {
                objc_enumerationMutation(v22);
              }
              v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              v12 = (void *)MEMORY[0x230FBD990]();
              v13 = self;
              v14 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                uint64_t v15 = HMFGetLogIdentifier();
                uint64_t v16 = [v11 user];
                *(_DWORD *)buf = 138543618;
                long long v32 = v15;
                __int16 v33 = 2112;
                v34 = v16;
                _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing last sync for %@", buf, 0x16u);
              }
              [v11 removeArchiveFromLocalDisk];
            }
            uint64_t v8 = [v22 countByEnumeratingWithState:&v23 objects:v35 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v17 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v27 objects:v36 count:16];
      uint64_t v20 = v17;
    }
    while (v17);
  }

  if (self)
  {
    objc_storeStrong((id *)&self->_homeToUserMap, 0);
    self->_valid = 0;
  }
}

- (void)_scheduleNextPush
{
  v2 = self;
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (self) {
    self = (HMDHomeManagerHH2SharedUserLastSyncManager *)self->_workQueue;
  }
  dispatch_assert_queue_V2(&self->super.super);
  id v3 = (void *)MEMORY[0x230FBD990]();
  uint64_t v4 = v2;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v23 = 138543362;
    long long v24 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Scheduling last push to shared users after migration.", (uint8_t *)&v23, 0xCu);
  }
  if ([(HMDHomeManagerHH2SharedUserLastSyncManager *)v4 _shouldExpire])
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = v4;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v23 = 138543362;
      long long v24 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Pushes have expired, removing last user sync data.", (uint8_t *)&v23, 0xCu);
    }
    [(HMDHomeManagerHH2SharedUserLastSyncManager *)v8 _removeAllUserLastSyncData];
  }
  if ([(HMDHomeManagerHH2SharedUserLastSyncManager *)v4 isValid])
  {
    id v11 = objc_alloc(MEMORY[0x263F42658]);
    [(HMDHomeManagerHH2SharedUserLastSyncManager *)v4 _nextInterval];
    v12 = objc_msgSend(v11, "initWithTimeInterval:options:", 1);
    v14 = v12;
    if (v2)
    {
      objc_setProperty_atomic(v4, v13, v12, 64);

      objc_msgSend(objc_getProperty(v4, v15, 64, 1), "setDelegate:", v4);
      id Property = objc_getProperty(v4, v16, 64, 1);
    }
    else
    {

      [0 setDelegate:0];
      id Property = 0;
    }
    [Property resume];
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = v4;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v23 = 138543362;
      long long v24 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@No longer valid, not scheduling another push", (uint8_t *)&v23, 0xCu);
    }
    if (v2) {
      objc_setProperty_atomic(v19, v22, 0, 64);
    }
  }
}

- (void)scheduleNextPush
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__HMDHomeManagerHH2SharedUserLastSyncManager_scheduleNextPush__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __62__HMDHomeManagerHH2SharedUserLastSyncManager_scheduleNextPush__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleNextPush];
}

- (double)_nextInterval
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!self)
  {
    dispatch_assert_queue_V2(0);
LABEL_7:
    _HMFPreconditionFailure();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!objc_getProperty(self, v3, 56, 1)) {
    goto LABEL_7;
  }
  [(HMDHomeManagerHH2SharedUserLastSyncManager *)self _interval];
  double v5 = v4;
  uint64_t v7 = objc_msgSend(objc_getProperty(self, v6, 56, 1), "timeIntervalSinceNow");
  double v9 = -(v8 - (double)((uint64_t)(v8 / v5) + 1) * v5);
  v10 = (void *)MEMORY[0x230FBD990](v7);
  id v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    int v15 = 138543618;
    SEL v16 = v13;
    __int16 v17 = 2048;
    double v18 = v9;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Determined next interval to be %f from now", (uint8_t *)&v15, 0x16u);
  }
  return v9;
}

- (BOOL)_shouldExpire
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    if (objc_getProperty(self, v3, 56, 1))
    {
      [(HMDHomeManagerHH2SharedUserLastSyncManager *)self _expireInterval];
      double v5 = v4;
      objc_msgSend(objc_getProperty(self, v6, 56, 1), "timeIntervalSinceNow");
      return v7 >= v5;
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
  double v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@No creationDate determined, cannot determine pushes have expired", (uint8_t *)&v13, 0xCu);
  }
  return 1;
}

- (BOOL)_shouldPushNow
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    if (objc_getProperty(self, v3, 56, 1))
    {
      [(HMDHomeManagerHH2SharedUserLastSyncManager *)self _interval];
      double v5 = v4;
      [(HMDHomeManagerHH2SharedUserLastSyncManager *)self _pushInterval];
      double v7 = v6;
      objc_msgSend(objc_getProperty(self, v8, 56, 1), "timeIntervalSinceNow");
      double v10 = v5 * (double)(uint64_t)(v9 / v5);
      v12 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeInterval:sinceDate:", objc_getProperty(self, v11, 56, 1), v10);
      v14 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeInterval:sinceDate:", objc_getProperty(self, v13, 56, 1), v7 + v10);
      uint64_t v15 = [MEMORY[0x263EFF910] date];
      if ([v15 compare:v12] == 1 && objc_msgSend(v15, "compare:", v14) == -1)
      {
        SEL v16 = (void *)MEMORY[0x230FBD990]();
        uint64_t v21 = self;
        double v18 = HMFGetOSLogHandle();
        BOOL v20 = 1;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v22 = HMFGetLogIdentifier();
          int v28 = 138543874;
          long long v29 = v22;
          __int16 v30 = 2112;
          long long v31 = v12;
          __int16 v32 = 2112;
          __int16 v33 = v14;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Pushing now because current time falls between start of interval, %@, and end of push interval, %@", (uint8_t *)&v28, 0x20u);
        }
      }
      else
      {
        SEL v16 = (void *)MEMORY[0x230FBD990]();
        __int16 v17 = self;
        double v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = HMFGetLogIdentifier();
          int v28 = 138543874;
          long long v29 = v19;
          __int16 v30 = 2112;
          long long v31 = v12;
          __int16 v32 = 2112;
          __int16 v33 = v14;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Not pushing now because does not fall between start of interval, %@, and end of push interval, %@", (uint8_t *)&v28, 0x20u);
        }
        BOOL v20 = 0;
      }

      return v20;
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
  int v23 = (void *)MEMORY[0x230FBD990]();
  long long v24 = self;
  uint64_t v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    long long v26 = HMFGetLogIdentifier();
    int v28 = 138543362;
    long long v29 = v26;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@No creationDate determined, cannot determine if push can start now", (uint8_t *)&v28, 0xCu);
  }
  return 0;
}

- (double)_pushInterval
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  SEL v3 = [v2 preferenceForKey:@"hh2SharedUserLastSyncPushInterval"];
  double v4 = [v3 numberValue];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)_expireInterval
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  SEL v3 = [v2 preferenceForKey:@"hh2SharedUserLastSyncExpire"];
  double v4 = [v3 numberValue];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)_interval
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  SEL v3 = [v2 preferenceForKey:@"hh2SharedUserLastSyncInterval"];
  double v4 = [v3 numberValue];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (BOOL)isManagingUserWithMergeID:(id)a3
{
  if (self) {
    self = (HMDHomeManagerHH2SharedUserLastSyncManager *)self->_managedMergeIDs;
  }
  return [(HMDHomeManagerHH2SharedUserLastSyncManager *)self containsObject:a3];
}

- (void)configure
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  SEL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  double v4 = self;
  double v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v57 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Determining pre-migration last users sync data", buf, 0xCu);
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  if (v4) {
    userLastSyncs = v4->_userLastSyncs;
  }
  else {
    userLastSyncs = 0;
  }
  SEL v8 = userLastSyncs;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v52 objects:v60 count:16];
  SEL v11 = &OBJC_IVAR___HMDNetworkRouterFirewallRuleWAN__portEnd;
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v53;
    *(void *)&long long v10 = 138543618;
    long long v47 = v10;
    uint64_t v49 = *(void *)v53;
    v48 = v8;
    do
    {
      uint64_t v14 = 0;
      uint64_t v50 = v12;
      do
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v52 + 1) + 8 * v14);
        objc_msgSend(v15, "configure", v47);
        if ([v15 isValid])
        {
          SEL v16 = [v15 user];
          __int16 v17 = [v16 accountIdentifier];
          double v18 = [v17 senderCorrelationIdentifier];

          if (v18)
          {
            if (v4) {
              managedMergeIDs = v4->_managedMergeIDs;
            }
            else {
              managedMergeIDs = 0;
            }
            [(NSMutableSet *)managedMergeIDs addObject:v18];
          }
          if (v4) {
            BOOL v20 = *(Class *)((char *)&v4->super.super.isa + v11[277]);
          }
          else {
            BOOL v20 = 0;
          }
          id v21 = v20;
          id v22 = [v15 homeUUID];
          int v23 = [v21 objectForKeyedSubscript:v22];

          if (!v23)
          {
            int v23 = [MEMORY[0x263EFF980] array];
            if (v4) {
              long long v24 = *(Class *)((char *)&v4->super.super.isa + v11[277]);
            }
            else {
              long long v24 = 0;
            }
            id v25 = v24;
            long long v26 = [v15 homeUUID];
            [v25 setObject:v23 forKeyedSubscript:v26];
          }
          id Property = (id)[v23 addObject:v15];
          if (!v4 || (id Property = objc_getProperty(v4, v28, 56, 1)) == 0)
          {
            long long v29 = (void *)MEMORY[0x230FBD990](Property);
            __int16 v30 = v4;
            long long v31 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              __int16 v32 = HMFGetLogIdentifier();
              __int16 v33 = [v15 creationDate];
              *(_DWORD *)buf = v47;
              v57 = v32;
              __int16 v58 = 2112;
              v59 = v33;
              _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Using creationDate from %@", buf, 0x16u);

              uint64_t v13 = v49;
              SEL v8 = v48;
            }

            __int16 v35 = [v15 creationDate];
            if (v4) {
              objc_setProperty_atomic(v30, v34, v35, 56);
            }

            SEL v11 = &OBJC_IVAR___HMDNetworkRouterFirewallRuleWAN__portEnd;
          }

          uint64_t v12 = v50;
        }
        else
        {
          v36 = (void *)MEMORY[0x230FBD990]();
          uint64_t v37 = v4;
          v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            uint64_t v39 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v57 = v39;
            _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Problem unarchiving last user sync data, removing archive", buf, 0xCu);

            uint64_t v13 = v49;
          }

          [v15 removeArchiveFromLocalDisk];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v40 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v52 objects:v60 count:16];
      uint64_t v12 = v40;
    }
    while (v40);
  }

  if (v4)
  {
    objc_storeStrong((id *)&v4->_userLastSyncs, 0);
    v41 = *(Class *)((char *)&v4->super.super.isa + v11[277]);
  }
  else
  {
    v41 = 0;
  }
  if ([v41 count])
  {
    if (v4)
    {
      v4->_valid = 1;
      workQueue = v4->_workQueue;
    }
    else
    {
      workQueue = 0;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__HMDHomeManagerHH2SharedUserLastSyncManager_configure__block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = v4;
    dispatch_async(workQueue, block);
  }
  else
  {
    v43 = (void *)MEMORY[0x230FBD990]();
    v44 = v4;
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v57 = v46;
      _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@No pre-migration last users sync data found", buf, 0xCu);
    }
  }
}

uint64_t __55__HMDHomeManagerHH2SharedUserLastSyncManager_configure__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) _shouldPushNow];
  SEL v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  double v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      double v7 = HMFGetLogIdentifier();
      int v10 = 138543362;
      SEL v11 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Determined within push window, start pushing to shared users now", (uint8_t *)&v10, 0xCu);
    }
    return [*(id *)(a1 + 32) _pushAllUserSyncData];
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      SEL v11 = v9;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Not within push window, scheduling pushing to shared users", (uint8_t *)&v10, 0xCu);
    }
    return [*(id *)(a1 + 32) _scheduleNextPush];
  }
}

- (HMDHomeManagerHH2SharedUserLastSyncManager)initWithHomeManager:(id)a3 archivePaths:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)HMDHomeManagerHH2SharedUserLastSyncManager;
  SEL v8 = [(HMDHomeManagerHH2SharedUserLastSyncManager *)&v33 init];
  if (v8)
  {
    HMDispatchQueueNameString();
    id v9 = objc_claimAutoreleasedReturnValue();
    int v10 = (const char *)[v9 UTF8String];
    SEL v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v8->_homeManager, v6);
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    homeToUserMap = v8->_homeToUserMap;
    v8->_homeToUserMap = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x263EFF980] array];
    userLastSyncs = v8->_userLastSyncs;
    v8->_userLastSyncs = (NSMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9C0] set];
    managedMergeIDs = v8->_managedMergeIDs;
    v8->_managedMergeIDs = (NSMutableSet *)v18;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v20 = v7;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v29 + 1) + 8 * v24);
          long long v26 = [HMDHomeManagerHH2SharedUserLastSync alloc];
          long long v27 = -[HMDHomeManagerHH2SharedUserLastSync initWithArchivePath:](v26, "initWithArchivePath:", v25, (void)v29);
          [(NSMutableArray *)v8->_userLastSyncs addObject:v27];

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v22);
    }
  }
  return v8;
}

+ (id)shortDescription
{
  int v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end