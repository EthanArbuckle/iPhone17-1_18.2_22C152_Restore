@interface HMDIDSActivityMonitorHomeManagerDataSource
+ (id)logCategory;
- (HMDHomeManager)homeManager;
- (HMDIDSActivityMonitorBroadcasterPushTokenDataSourceDelegate)delegate;
- (HMDIDSActivityMonitorHomeManagerDataSource)initWithHomeManager:(id)a3;
- (dispatch_queue_t)pushTokens;
- (void)_handleCurrentDeviceOrAccountUpdated:(id)a3;
- (void)_handleDeviceAdded:(id)a3;
- (void)_handleDeviceRemoved:(id)a3;
- (void)_handleHomeAdded:(id)a3;
- (void)_startUpdateTask;
- (void)_updatePushTokens:(void *)a3 completionHandler:;
- (void)_updateWithCompletionHandler:(uint64_t)a1;
- (void)pushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)startWithNotificationCenter:(id)a3;
@end

@implementation HMDIDSActivityMonitorHomeManagerDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTask, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_pushTokens, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDIDSActivityMonitorBroadcasterPushTokenDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HMDIDSActivityMonitorBroadcasterPushTokenDataSourceDelegate *)WeakRetained;
}

- (void)_handleHomeAdded:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Home added, updating", (uint8_t *)&v9, 0xCu);
  }
  if (v6) {
    -[HMDIDSActivityMonitorHomeManagerDataSource _updateWithCompletionHandler:]((uint64_t)v6, 0);
  }
}

- (void)_updateWithCompletionHandler:(uint64_t)a1
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__HMDIDSActivityMonitorHomeManagerDataSource__updateWithCompletionHandler___block_invoke;
  v6[3] = &unk_264A2F870;
  v6[4] = a1;
  id v5 = v3;
  id v7 = v5;
  dispatch_async(v4, v6);
}

void __75__HMDIDSActivityMonitorHomeManagerDataSource__updateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 40));
    id v3 = [*(id *)(v1 + 32) device];
    if (v3)
    {
      id v4 = [MEMORY[0x263EFF9C0] set];
      id v5 = [(id)v1 homeManager];
      v6 = [v5 homes];
      *(void *)&long long v42 = MEMORY[0x263EF8330];
      *((void *)&v42 + 1) = 3221225472;
      v43 = __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke;
      v44 = &unk_264A21F90;
      id v45 = v3;
      id v7 = v4;
      id v46 = v7;
      objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v42);

      if ([v7 count])
      {
        objc_initWeak(&location, (id)v1);
        *(void *)&long long aBlock = MEMORY[0x263EF8330];
        *((void *)&aBlock + 1) = 3221225472;
        v38 = __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke_30;
        v39 = &unk_264A20DC0;
        objc_copyWeak(&v41, &location);
        id v30 = v2;
        id v40 = v30;
        v31 = _Block_copy(&aBlock);
        v8 = [v7 allObjects];
        int v9 = (void *)MEMORY[0x230FBD990]();
        id v10 = (id)v1;
        HMFGetOSLogHandle();
        uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v34 = v12;
          __int16 v35 = 2112;
          v36 = v8;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Querying endpoints for these destinations: %@", buf, 0x16u);
        }
        v13 = [MEMORY[0x263F4A058] sharedInstance];
        v14 = +[HMDIDSServiceManager sharedIDSServiceName];
        v15 = [MEMORY[0x263F4A050] refreshIDInfo];
        id v16 = *(id *)(v1 + 40);
        char v17 = [v13 idInfoForDestinations:v8 service:v14 infoTypes:1 options:v15 listenerID:@"com.apple.homed.idsActivityMonitor" queue:v16 completionBlock:v31];

        if ((v17 & 1) == 0)
        {
          v18 = (void *)MEMORY[0x230FBD990]();
          id v19 = v10;
          HMFGetOSLogHandle();
          v20 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v34 = v21;
            __int16 v35 = 2112;
            v36 = v8;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to query somehow: %@", buf, 0x16u);
          }
          -[HMDIDSActivityMonitorHomeManagerDataSource _updatePushTokens:completionHandler:]((uint64_t)v19, 0, v30);
        }

        objc_destroyWeak(&v41);
        objc_destroyWeak(&location);
      }
      else
      {
        v26 = (void *)MEMORY[0x230FBD990]();
        id v27 = (id)v1;
        v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = HMFGetLogIdentifier();
          LODWORD(aBlock) = 138543362;
          *(void *)((char *)&aBlock + 4) = v29;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find any user destinations associated with the current device", (uint8_t *)&aBlock, 0xCu);
        }
        -[HMDIDSActivityMonitorHomeManagerDataSource _updatePushTokens:completionHandler:]((uint64_t)v27, 0, v2);
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x230FBD990]();
      id v23 = (id)v1;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        LODWORD(v42) = 138543362;
        *(void *)((char *)&v42 + 4) = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch tokens, currentDevice unavailable", (uint8_t *)&v42, 0xCu);
      }
      -[HMDIDSActivityMonitorHomeManagerDataSource _updatePushTokens:completionHandler:]((uint64_t)v23, 0, v2);
    }
  }
}

- (void)_updatePushTokens:(void *)a3 completionHandler:
{
  id v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (!v5)
    {
      id v5 = [MEMORY[0x263EFFA08] set];
    }
    id v7 = v5;
    v8 = -[HMDIDSActivityMonitorHomeManagerDataSource pushTokens]((dispatch_queue_t *)a1);
    char v9 = [v8 isEqual:v7];

    id v5 = v7;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    objc_storeStrong((id *)(a1 + 16), v7);

    if ((v9 & 1) == 0)
    {
      if (v6) {
        intptr_t v10 = 9;
      }
      else {
        intptr_t v10 = 17;
      }
      uint64_t v11 = dispatch_get_global_queue(v10, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__HMDIDSActivityMonitorHomeManagerDataSource__updatePushTokens_completionHandler___block_invoke;
      block[3] = &unk_264A2F7F8;
      block[4] = a1;
      dispatch_async(v11, block);
    }
    if (v6) {
      v6[2](v6, 1);
    }
  }
}

void __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 residentEnabledDevices];
  int v5 = [v4 containsObject:*(void *)(a1 + 32)];

  if (v5)
  {
    v6 = [v3 users];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_264A20D98;
    id v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);
  }
}

void __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    char v9 = WeakRetained[5];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke_31;
    v15[3] = &unk_264A2EE30;
    v15[4] = WeakRetained;
    id v16 = v5;
    id v17 = v6;
    id v18 = *(id *)(a1 + 32);
    dispatch_async(v9, v15);
  }
  else
  {
    intptr_t v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = objc_opt_class();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v20 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@HMDIDSActivityMonitorHomeManagerDataSource died before IDS returned results", buf, 0xCu);
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, 1);
    }
  }
}

void __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke_31(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(dispatch_queue_t **)(a1 + 32);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = v2;
  id v6 = v3;
  if (v1)
  {
    dispatch_assert_queue_V2(v1[5]);
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = v1;
    char v9 = HMFGetOSLogHandle();
    intptr_t v10 = v9;
    if (v4)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        *(_DWORD *)id v16 = 138543618;
        *(void *)&v16[4] = v11;
        *(_WORD *)&v16[12] = 2112;
        *(void *)&v16[14] = v4;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received IDS info: %@", v16, 0x16u);
      }
      v12 = [MEMORY[0x263EFF9C0] set];
      *(void *)id v16 = MEMORY[0x263EF8330];
      *(void *)&v16[8] = 3221225472;
      *(void *)&v16[16] = __93__HMDIDSActivityMonitorHomeManagerDataSource__handleIDSQueryResults_error_completionHandler___block_invoke;
      id v17 = &unk_264A20E10;
      id v18 = v8;
      id v19 = v12;
      id v13 = v12;
      [v4 enumerateKeysAndObjectsUsingBlock:v16];
      uint64_t v14 = (void *)[v13 copy];
      -[HMDIDSActivityMonitorHomeManagerDataSource _updatePushTokens:completionHandler:]((uint64_t)v8, v14, v6);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)id v16 = 138543618;
        *(void *)&v16[4] = v15;
        *(_WORD *)&v16[12] = 2112;
        *(void *)&v16[14] = v5;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch IDS info: %@", v16, 0x16u);
      }
      -[HMDIDSActivityMonitorHomeManagerDataSource _updatePushTokens:completionHandler:]((uint64_t)v8, 0, v6);
    }
  }
}

void __93__HMDIDSActivityMonitorHomeManagerDataSource__handleIDSQueryResults_error_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  char v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    intptr_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = [v6 endpoints];
    *(_DWORD *)buf = 138543874;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@IDS destination '%@' has endpoints: %@", buf, 0x20u);
  }
  v12 = [v6 endpoints];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __93__HMDIDSActivityMonitorHomeManagerDataSource__handleIDSQueryResults_error_completionHandler___block_invoke_36;
  v13[3] = &unk_264A20DE8;
  id v14 = *(id *)(a1 + 40);
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
}

void __93__HMDIDSActivityMonitorHomeManagerDataSource__handleIDSQueryResults_error_completionHandler___block_invoke_36(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 pushToken];
  [v2 addObject:v3];
}

void __82__HMDIDSActivityMonitorHomeManagerDataSource__updateOnQueueWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 accountHandle];
  id v3 = [v4 URI];
  [v2 addObject:v3];
}

- (dispatch_queue_t)pushTokens
{
  if (a1)
  {
    id v2 = a1;
    dispatch_assert_queue_V2(a1[5]);
    a1 = v2[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __82__HMDIDSActivityMonitorHomeManagerDataSource__updatePushTokens_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataSourceDidUpdate:*(void *)(a1 + 32)];
}

- (void)_handleCurrentDeviceOrAccountUpdated:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    intptr_t v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Current device or account updated, updating", (uint8_t *)&v9, 0xCu);
  }
  if (v6) {
    -[HMDIDSActivityMonitorHomeManagerDataSource _updateWithCompletionHandler:]((uint64_t)v6, 0);
  }
}

- (void)_handleDeviceRemoved:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self) {
    appleAccountManager = self->_appleAccountManager;
  }
  else {
    appleAccountManager = 0;
  }
  id v6 = [(HMDAppleAccountManager *)appleAccountManager account];
  id v7 = [v4 object];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    int v9 = [v4 userInfo];
    intptr_t v10 = [v9 objectForKeyedSubscript:@"HMDDeviceNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v16;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Device removed from account, updating: %@", (uint8_t *)&v17, 0x16u);
    }
    if (self) {
      -[HMDIDSActivityMonitorHomeManagerDataSource _updateWithCompletionHandler:]((uint64_t)v14, 0);
    }
  }
}

- (void)_handleDeviceAdded:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self) {
    appleAccountManager = self->_appleAccountManager;
  }
  else {
    appleAccountManager = 0;
  }
  id v6 = [(HMDAppleAccountManager *)appleAccountManager account];
  id v7 = [v4 object];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    int v9 = [v4 userInfo];
    intptr_t v10 = [v9 objectForKeyedSubscript:@"HMDDeviceNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v16;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Device added or updated on account, updating: %@", (uint8_t *)&v17, 0x16u);
    }
    if (self) {
      -[HMDIDSActivityMonitorHomeManagerDataSource _updateWithCompletionHandler:]((uint64_t)v14, 0);
    }
  }
}

- (void)pushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __125__HMDIDSActivityMonitorHomeManagerDataSource_pushTokensForDevicesObservingSubjectDevice_subActivity_queue_completionHandler___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workQueue, block);
}

void __125__HMDIDSActivityMonitorHomeManagerDataSource_pushTokensForDevicesObservingSubjectDevice_subActivity_queue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = -[HMDIDSActivityMonitorHomeManagerDataSource pushTokens](*(dispatch_queue_t **)(a1 + 32));
  id v3 = [v2 allObjects];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id v5 = (void *)v5[4];
  }
  id v6 = v5;
  id v7 = [v6 device];
  id v8 = [v7 pushToken];
  [v4 removeObject:v8];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __125__HMDIDSActivityMonitorHomeManagerDataSource_pushTokensForDevicesObservingSubjectDevice_subActivity_queue_completionHandler___block_invoke_2;
  v12[3] = &unk_264A2F870;
  id v9 = *(NSObject **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v13 = v4;
  id v14 = v10;
  id v11 = v4;
  dispatch_async(v9, v12);
}

void __125__HMDIDSActivityMonitorHomeManagerDataSource_pushTokensForDevicesObservingSubjectDevice_subActivity_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)startWithNotificationCenter:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDIDSActivityMonitorHomeManagerDataSource *)self homeManager];
  id v6 = [v5 capabilitiesController];
  id v7 = [v6 currentResidentCapabilities];
  char v8 = [v7 isResidentCapable];

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);
    }
    [v4 addObserver:v10 selector:sel__handleDeviceAdded_ name:@"HMDAccountAddedDeviceNotification" object:0];
    [v4 addObserver:v10 selector:sel__handleDeviceRemoved_ name:@"HMDAccountRemovedDeviceNotification" object:0];
    if (v10)
    {
      [v4 addObserver:v10 selector:sel__handleCurrentDeviceOrAccountUpdated_ name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:v10->_appleAccountManager];
      [v4 addObserver:v10 selector:sel__handleCurrentDeviceOrAccountUpdated_ name:@"HMDAppleAccountManagerAccountUpdatedNotification" object:v10->_appleAccountManager];
      [v4 addObserver:v10 selector:sel__handleHomeAdded_ name:@"HMDHomeAddedNotification" object:0];
      -[HMDIDSActivityMonitorHomeManagerDataSource _startUpdateTask]((id *)&v10->super.isa);
      -[HMDIDSActivityMonitorHomeManagerDataSource _updateWithCompletionHandler:]((uint64_t)v10, 0);
    }
    else
    {
      [v4 addObserver:0 selector:sel__handleCurrentDeviceOrAccountUpdated_ name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:0];
      [v4 addObserver:0 selector:sel__handleCurrentDeviceOrAccountUpdated_ name:@"HMDAppleAccountManagerAccountUpdatedNotification" object:0];
      [v4 addObserver:0 selector:sel__handleHomeAdded_ name:@"HMDHomeAddedNotification" object:0];
    }
  }
  else
  {
    if (v12)
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Not starting on this non-resident-capable device", buf, 0xCu);
    }
    if (v10) {
      workQueue = v10->_workQueue;
    }
    else {
      workQueue = 0;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__HMDIDSActivityMonitorHomeManagerDataSource_startWithNotificationCenter___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = v10;
    dispatch_async(workQueue, block);
  }
}

void __74__HMDIDSActivityMonitorHomeManagerDataSource_startWithNotificationCenter___block_invoke(uint64_t a1)
{
}

- (void)_startUpdateTask
{
  if (a1)
  {
    objc_opt_class();
    id v2 = self;
    location[0] = (id)MEMORY[0x263EF8330];
    location[1] = (id)3221225472;
    location[2] = __64__HMDIDSActivityMonitorHomeManagerDataSource_updateTaskInterval__block_invoke;
    location[3] = &__block_descriptor_40_e5_v8__0l;
    location[4] = v2;
    if (updateTaskInterval_token != -1) {
      dispatch_once(&updateTaskInterval_token, location);
    }
    double v3 = *(double *)&updateTaskInterval_updateTaskInterval;
    id v4 = (void *)[objc_alloc(MEMORY[0x263F086C0]) initWithIdentifier:@"com.apple.homed.idsActivityMonitor.update"];
    [v4 setRepeats:1];
    [v4 setInterval:v3];
    [v4 setTolerance:v3 * 0.25];
    objc_storeStrong(a1 + 6, v4);
    objc_initWeak(location, v4);
    objc_initWeak(&from, a1);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __62__HMDIDSActivityMonitorHomeManagerDataSource__startUpdateTask__block_invoke;
    v5[3] = &unk_264A20D70;
    objc_copyWeak(&v6, &from);
    objc_copyWeak(&v7, location);
    [v4 scheduleWithBlock:v5];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
}

void __62__HMDIDSActivityMonitorHomeManagerDataSource__startUpdateTask__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = [v5 shouldDefer];
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = WeakRetained;
    id v9 = HMFGetOSLogHandle();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v10)
      {
        id v11 = HMFGetLogIdentifier();
        int v17 = 138543362;
        id v18 = v11;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Deferring background update", (uint8_t *)&v17, 0xCu);
      }
      v3[2](v3, 2);
    }
    else
    {
      if (v10)
      {
        id v16 = HMFGetLogIdentifier();
        int v17 = 138543362;
        id v18 = v16;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Performing background update", (uint8_t *)&v17, 0xCu);
      }
      -[HMDIDSActivityMonitorHomeManagerDataSource _updateWithCompletionHandler:]((uint64_t)v8, v3);
    }
  }
  else
  {
    BOOL v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = objc_opt_class();
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@HMDIDSActivityMonitorHomeManagerDataSource died before scheduled activity could run", (uint8_t *)&v17, 0xCu);
    }
    v3[2](v3, 1);
  }
}

void __64__HMDIDSActivityMonitorHomeManagerDataSource_updateTaskInterval__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42608] sharedPreferences];
  double v3 = [v2 preferenceForKey:@"idsActivityMonitorUpdateInterval"];
  id v4 = [v3 numberValue];

  if (v4)
  {
    uint64_t v5 = [v4 doubleValue];
    uint64_t v7 = *(void *)&v6;
    if (v6 > 2.22044605e-16)
    {
      id v8 = (void *)MEMORY[0x230FBD990](v5);
      id v9 = *(id *)(a1 + 32);
      BOOL v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = HMFGetLogIdentifier();
        int v12 = 138543618;
        id v13 = v11;
        __int16 v14 = 2048;
        uint64_t v15 = v7;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Overriding default update interval: %f", (uint8_t *)&v12, 0x16u);
      }
      updateTaskInterval_updateTaskInterval = v7;
    }
  }
}

- (void)start
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [(HMDIDSActivityMonitorHomeManagerDataSource *)self startWithNotificationCenter:v3];
}

- (HMDIDSActivityMonitorHomeManagerDataSource)initWithHomeManager:(id)a3
{
  id v5 = a3;
  double v6 = +[HMDAppleAccountManager sharedManager];
  id v7 = v5;
  id v8 = v6;
  if (!self) {
    goto LABEL_5;
  }
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDIDSActivityMonitorHomeManagerDataSource;
    id v9 = [(HMDIDSActivityMonitorHomeManagerDataSource *)&v15 init];
    self = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_homeManager, a3);
      objc_storeStrong((id *)&self->_appleAccountManager, v6);
      BOOL v10 = [v7 workQueue];
      workQueue = self->_workQueue;
      self->_workQueue = v10;
    }
LABEL_5:

    return self;
  }
  id v13 = (void *)_HMFPreconditionFailure();
  return (HMDIDSActivityMonitorHomeManagerDataSource *)+[HMDIDSActivityMonitorHomeManagerDataSource logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_134851 != -1) {
    dispatch_once(&logCategory__hmf_once_t20_134851, &__block_literal_global_134852);
  }
  id v2 = (void *)logCategory__hmf_once_v21_134853;
  return v2;
}

void __57__HMDIDSActivityMonitorHomeManagerDataSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v21_134853;
  logCategory__hmf_once_v21_134853 = v0;
}

@end