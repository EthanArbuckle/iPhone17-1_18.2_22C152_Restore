@interface HMDHomePrimaryResidentInitialReachabilityManager
+ (id)logCategory;
- (HMDHome)home;
- (HMDHomePrimaryResidentInitialReachabilityManager)initWithUUID:(id)a3 workQueue:(id)a4;
- (HMDHomePrimaryResidentInitialReachabilityManager)initWithUUID:(id)a3 workQueue:(id)a4 notificationCenter:(id)a5 dataSource:(id)a6;
- (HMDHomePrimaryResidentInitialReachabilityManagerDataSource)dataSource;
- (HMDResidentReachabilityState)persistedState;
- (NSNotificationCenter)notificationCenter;
- (NSNumber)initialReachability;
- (NSString)key;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)clearPersistedState;
- (void)configureWithHome:(id)a3;
- (void)handleHomeRemovedNotification:(id)a3;
- (void)handlePrimaryResidentUpdateNotification:(id)a3;
- (void)handlePrimaryResidentUpdated:(id)a3 reason:(id)a4;
- (void)handleResidentDeviceEnabledStateChangeNotification:(id)a3;
- (void)handleResidentDeviceManagerUpdateResidentNotification:(id)a3;
- (void)persistState:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation HMDHomePrimaryResidentInitialReachabilityManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHomePrimaryResidentInitialReachabilityManagerDataSource)dataSource
{
  return (HMDHomePrimaryResidentInitialReachabilityManagerDataSource *)objc_getProperty(self, a2, 8, 1);
}

- (void)clearPersistedState
{
  v3 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self dataSource];
  v4 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self key];
  [v5 persistDataValueToNoBackupStore:0 withKey:v4];
}

- (void)persistState:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v14 = 0;
  v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v14];
  id v7 = v14;
  if (v6)
  {
    v8 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self dataSource];
    v9 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self key];
    [v8 persistDataValueToNoBackupStore:v6 withKey:v9];
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to persist primary resident reachability state, encoding failed: %@", buf, 0x16u);
    }
  }
}

- (HMDResidentReachabilityState)persistedState
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self dataSource];
  id v5 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self key];
  v6 = [v4 dataValueFromNoBackupStoreWithKey:v5];

  if (v6)
  {
    id v15 = 0;
    id v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v15];
    id v8 = v15;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      v11 = self;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v17 = v13;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode primary resident reachability state: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return (HMDResidentReachabilityState *)v7;
}

- (void)handlePrimaryResidentUpdated:(id)a3 reason:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self persistedState];
  v10 = [(HMDResidentReachabilityState *)v9 residentDeviceIdentifier];
  v11 = [v6 identifier];
  int v12 = HMFEqualObjects();

  if (v12)
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      int v28 = 138543874;
      v29 = v16;
      __int16 v30 = 2112;
      id v31 = v7;
      __int16 v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping primary resident update for reason: %@, because resident device identifier found in peristed state: %@", (uint8_t *)&v28, 0x20u);
    }
  }
  else if (v6)
  {
    __int16 v17 = [HMDResidentReachabilityState alloc];
    __int16 v18 = [v6 identifier];
    id v19 = -[HMDResidentReachabilityState initWithResidentDeviceIdentifier:isReachable:](v17, "initWithResidentDeviceIdentifier:isReachable:", v18, [v6 isReachable]);

    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      int v28 = 138543874;
      v29 = v23;
      __int16 v30 = 2112;
      id v31 = v7;
      __int16 v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Persisting primary resident reachability state for reason %@:%@", (uint8_t *)&v28, 0x20u);
    }
    [(HMDHomePrimaryResidentInitialReachabilityManager *)v21 persistState:v19];
  }
  else
  {
    v24 = (void *)MEMORY[0x230FBD990]();
    v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v27;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Clearing persisted reachability state for reason: %@ because primary resident is nil", (uint8_t *)&v28, 0x16u);
    }
    [(HMDHomePrimaryResidentInitialReachabilityManager *)v25 clearPersistedState];
  }
}

- (void)handleHomeRemovedNotification:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self home];
  id v6 = [v5 residentDeviceManager];
  int v7 = [v6 isCurrentDeviceAvailableResident];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not handling home removed notification because current device is a resident", buf, 0xCu);
    }
  }
  else
  {
    int v12 = [v4 userInfo];
    v13 = [v12 objectForKey:@"HMDHomeNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Received notification home removed: %@", buf, 0x16u);
    }
    uint64_t v20 = [v5 uuid];
    v21 = [v15 uuid];
    int v22 = [v20 isEqual:v21];

    if (v22)
    {
      v23 = [(HMDHomePrimaryResidentInitialReachabilityManager *)v17 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__HMDHomePrimaryResidentInitialReachabilityManager_handleHomeRemovedNotification___block_invoke;
      block[3] = &unk_264A2F7F8;
      block[4] = v17;
      dispatch_async(v23, block);
    }
  }
}

uint64_t __82__HMDHomePrimaryResidentInitialReachabilityManager_handleHomeRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Clearing persisted reachability state because home was removed", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) clearPersistedState];
}

- (void)handleResidentDeviceEnabledStateChangeNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if ([v7 isCurrentDevice])
  {
    if ([v7 isEnabled])
    {
      id v8 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __103__HMDHomePrimaryResidentInitialReachabilityManager_handleResidentDeviceEnabledStateChangeNotification___block_invoke;
      block[3] = &unk_264A2F7F8;
      block[4] = self;
      dispatch_async(v8, block);
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Not handling resident enabled state change, because it is not for current device: %@", buf, 0x16u);
    }
  }
}

uint64_t __103__HMDHomePrimaryResidentInitialReachabilityManager_handleResidentDeviceEnabledStateChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Clearing persisted reachability state because current device became resident", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) clearPersistedState];
}

- (void)handleResidentDeviceManagerUpdateResidentNotification:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 object];
  if ([v6 conformsToProtocol:&unk_26E55F8B0]) {
    int v7 = v6;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;

  if ([v8 isCurrentDeviceAvailableResident])
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      int v35 = 138543362;
      v36 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Not handling resident update notification because current device is a resident", (uint8_t *)&v35, 0xCu);
    }
  }
  else
  {
    v13 = [v4 userInfo];
    id v14 = [v13 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    __int16 v16 = v15;

    id v17 = [v8 primaryResidentDevice];
    char v18 = [v17 isEqual:v16];

    if (v18)
    {
      id v19 = [HMDResidentReachabilityState alloc];
      uint64_t v20 = [(HMDResidentReachabilityState *)v16 identifier];
      v21 = [(HMDResidentReachabilityState *)v19 initWithResidentDeviceIdentifier:v20 isReachable:[(HMDResidentReachabilityState *)v16 isReachable]];

      int v22 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self persistedState];
      int v23 = [v22 isEqual:v21];

      v24 = (void *)MEMORY[0x230FBD990]();
      v25 = self;
      v26 = HMFGetOSLogHandle();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
      if (v23)
      {
        if (v27)
        {
          id v28 = HMFGetLogIdentifier();
          uint64_t v29 = [(HMDHomePrimaryResidentInitialReachabilityManager *)v25 persistedState];
          int v35 = 138543874;
          v36 = v28;
          __int16 v37 = 2112;
          v38 = v29;
          __int16 v39 = 2112;
          v40 = v21;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Not handling resident update notification because peristed state: %@ is equal to state: %@", (uint8_t *)&v35, 0x20u);
        }
      }
      else
      {
        if (v27)
        {
          uint64_t v34 = HMFGetLogIdentifier();
          int v35 = 138543618;
          v36 = v34;
          __int16 v37 = 2112;
          v38 = v21;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Persisting primary resident reachability state: %@", (uint8_t *)&v35, 0x16u);
        }
        [(HMDHomePrimaryResidentInitialReachabilityManager *)v25 persistState:v21];
      }
    }
    else
    {
      __int16 v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = self;
      __int16 v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = HMFGetLogIdentifier();
        int v35 = 138543618;
        v36 = v33;
        __int16 v37 = 2112;
        v38 = v16;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Not handling resident update notification because it is for non-primary resident device: %@", (uint8_t *)&v35, 0x16u);
      }
    }
  }
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 object];
  if ([v6 conformsToProtocol:&unk_26E55F8B0]) {
    int v7 = v6;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;

  if ([v8 isCurrentDeviceAvailableResident])
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      int v17 = 138543362;
      char v18 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Not handling primary resident updated notification because current device is a resident", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    v13 = [v4 userInfo];
    id v14 = [v13 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    [(HMDHomePrimaryResidentInitialReachabilityManager *)self handlePrimaryResidentUpdated:v16 reason:@"Notification"];
  }
}

- (id)logIdentifier
{
  v2 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self uuid];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)configureWithHome:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDHomePrimaryResidentInitialReachabilityManager *)self setHome:v4];
  id v6 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self notificationCenter];
  int v7 = [v4 residentDeviceManager];
  [v6 addObserver:self selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v7];

  id v8 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self notificationCenter];
  uint64_t v9 = [v4 residentDeviceManager];
  [v8 addObserver:self selector:sel_handleResidentDeviceManagerUpdateResidentNotification_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:v9];

  v10 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self notificationCenter];
  [v10 addObserver:self selector:sel_handleResidentDeviceEnabledStateChangeNotification_ name:@"HMDResidentDeviceEnabledStateChangedNotification" object:0];

  v11 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self notificationCenter];
  int v12 = [v4 homeManager];
  [v11 addObserver:self selector:sel_handleHomeRemovedNotification_ name:@"HMDHomeRemovedNotification" object:v12];

  v13 = [v4 residentDeviceManager];
  if ([v13 isCurrentDeviceAvailableResident])
  {
    id v14 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self persistedState];

    if (v14)
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = self;
      int v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        char v18 = HMFGetLogIdentifier();
        int v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Clearing persisted state since current device this device is enabled as a resident", (uint8_t *)&v20, 0xCu);
      }
      [(HMDHomePrimaryResidentInitialReachabilityManager *)v16 clearPersistedState];
    }
  }
  else
  {
    uint64_t v19 = [v13 primaryResidentDevice];
    [(HMDHomePrimaryResidentInitialReachabilityManager *)self handlePrimaryResidentUpdated:v19 reason:@"Configure"];
  }
}

- (NSNumber)initialReachability
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self persistedState];
  if (v4)
  {
    id v5 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self home];
    uint64_t v6 = [v5 residentDeviceManager];
    int v7 = [(id)v6 primaryResidentUUID];

    id v8 = [v4 residentDeviceIdentifier];
    LOBYTE(v6) = [v7 isEqual:v8];

    if (v6)
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isReachable"));
    }
    else
    {
      id v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = HMFGetLogIdentifier();
        int v19 = 138543874;
        int v20 = v17;
        __int16 v21 = 2112;
        uint64_t v22 = v7;
        __int16 v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Returning reachability as nil, primary resident UUID: %@ not found in persisted state: %@", (uint8_t *)&v19, 0x20u);
      }
      uint64_t v9 = 0;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      int v19 = 138543362;
      int v20 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Returning reachability as nil, no persisted state", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return (NSNumber *)v9;
}

- (HMDHomePrimaryResidentInitialReachabilityManager)initWithUUID:(id)a3 workQueue:(id)a4 notificationCenter:(id)a5 dataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDHomePrimaryResidentInitialReachabilityManager;
  id v15 = [(HMDHomePrimaryResidentInitialReachabilityManager *)&v21 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dataSource, a6);
    objc_storeStrong((id *)&v16->_uuid, a3);
    int v17 = [v11 UUIDString];
    uint64_t v18 = [v17 stringByAppendingString:@"-primary-resident-reachability-state"];
    key = v16->_key;
    v16->_key = (NSString *)v18;

    objc_storeStrong((id *)&v16->_notificationCenter, a5);
    objc_storeStrong((id *)&v16->_workQueue, a4);
  }

  return v16;
}

- (HMDHomePrimaryResidentInitialReachabilityManager)initWithUUID:(id)a3 workQueue:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F08A00];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 defaultCenter];
  v10 = objc_alloc_init(HMDHomePrimaryResidentInitialReachabilityManagerDataSource);
  id v11 = [(HMDHomePrimaryResidentInitialReachabilityManager *)self initWithUUID:v8 workQueue:v7 notificationCenter:v9 dataSource:v10];

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_245904 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_245904, &__block_literal_global_245905);
  }
  v2 = (void *)logCategory__hmf_once_v5_245906;
  return v2;
}

void __63__HMDHomePrimaryResidentInitialReachabilityManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_245906;
  logCategory__hmf_once_v5_245906 = v0;
}

@end