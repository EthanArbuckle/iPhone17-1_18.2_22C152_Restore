@interface HMDResidentStatusChannelManager
+ (id)logCategory;
- (BOOL)_residentStatusChannelNeededForBundleIdentifier:(id)a3 applicationState:(unint64_t)a4;
- (BOOL)_shouldChannelBeRunning;
- (HMDIDSServerBag)idsServerBag;
- (HMDProcessMonitor)processMonitor;
- (HMDResidentStatusChannel)residentStatusChannel;
- (HMDResidentStatusChannelManager)initWithResidentStatusChannel:(id)a3 notificationCenter:(id)a4 queue:(id)a5 timerProvider:(id)a6 idsServerBag:(id)a7 processMonitor:(id)a8;
- (HMDResidentStatusChannelManager)initWithResidentStatusChannel:(id)a3 queue:(id)a4 idsServerBag:(id)a5;
- (HMDTimerProvider)timerProvider;
- (HMFTimer)unsubscribeFromChannelDebounceTimer;
- (NSMutableSet)clientIdentifiers;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)queue;
- (id)logIdentifier;
- (void)_configureWithExistingProcesses:(id)a3;
- (void)_evaluateChannelConnectionStateWithCurrentClientIdentifierCount:(unint64_t)a3 previousClientIdentifierCount:(unint64_t)a4;
- (void)_handleForegroundStateChangedForBundleIdentifier:(id)a3 applicationState:(unint64_t)a4;
- (void)_startUnsubscribeFromChannelDebounceTimer;
- (void)_stopUnsubscribeFromChannelDebounceTimer;
- (void)addClientWithIdentifier:(id)a3;
- (void)configure;
- (void)handleProcessAdded:(id)a3;
- (void)handleProcessInfoStateChanged:(id)a3;
- (void)handleProcessRemoved:(id)a3;
- (void)removeClientWithIdentifier:(id)a3;
- (void)setUnsubscribeFromChannelDebounceTimer:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDResidentStatusChannelManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_destroyWeak((id *)&self->_idsServerBag);
  objc_storeStrong((id *)&self->_unsubscribeFromChannelDebounceTimer, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_residentStatusChannel, 0);
  objc_storeStrong((id *)&self->_clientIdentifiers, 0);
}

- (HMDProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (HMDIDSServerBag)idsServerBag
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsServerBag);
  return (HMDIDSServerBag *)WeakRetained;
}

- (void)setUnsubscribeFromChannelDebounceTimer:(id)a3
{
}

- (HMFTimer)unsubscribeFromChannelDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 48, 1);
}

- (HMDTimerProvider)timerProvider
{
  return self->_timerProvider;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMDResidentStatusChannel)residentStatusChannel
{
  return self->_residentStatusChannel;
}

- (id)logIdentifier
{
  v2 = [(HMDResidentStatusChannelManager *)self residentStatusChannel];
  v3 = [v2 home];
  v4 = [v3 uuid];
  v5 = [v4 UUIDString];

  return v5;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  v5 = [(HMDResidentStatusChannelManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDResidentStatusChannelManager *)self unsubscribeFromChannelDebounceTimer];

  if (v6 == v4)
  {
    [(HMDResidentStatusChannelManager *)self _stopUnsubscribeFromChannelDebounceTimer];
    if (![(HMDResidentStatusChannelManager *)self _shouldChannelBeRunning])
    {
      id v7 = [(HMDResidentStatusChannelManager *)self residentStatusChannel];
      [v7 stop];
    }
  }
}

- (void)_stopUnsubscribeFromChannelDebounceTimer
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(HMDResidentStatusChannelManager *)self unsubscribeFromChannelDebounceTimer];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping unsubscribe from channel debounce timer", (uint8_t *)&v9, 0xCu);
    }
    v8 = [(HMDResidentStatusChannelManager *)v5 unsubscribeFromChannelDebounceTimer];
    [v8 suspend];

    [(HMDResidentStatusChannelManager *)v5 setUnsubscribeFromChannelDebounceTimer:0];
  }
}

- (void)_startUnsubscribeFromChannelDebounceTimer
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(HMDResidentStatusChannelManager *)self unsubscribeFromChannelDebounceTimer];

  if (!v3)
  {
    id v4 = [(HMDResidentStatusChannelManager *)self idsServerBag];
    v5 = [v4 statusKitUnsubscribeFromChannelDebounceTimeSec];

    if (v5)
    {
      uint64_t v6 = [v5 doubleValue];
      double v8 = v7;
    }
    else
    {
      double v8 = 300.0;
    }
    int v9 = (void *)MEMORY[0x230FBD990](v6);
    v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v12;
      __int16 v21 = 2048;
      double v22 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting unsubscribe from channel debounce timer with time set to %f", (uint8_t *)&v19, 0x16u);
    }
    v13 = [(HMDResidentStatusChannelManager *)v10 timerProvider];
    v14 = [v13 timerWithTimeInterval:0 options:v8];
    [(HMDResidentStatusChannelManager *)v10 setUnsubscribeFromChannelDebounceTimer:v14];

    v15 = [(HMDResidentStatusChannelManager *)v10 unsubscribeFromChannelDebounceTimer];
    [v15 setDelegate:v10];

    queue = v10->_queue;
    v17 = [(HMDResidentStatusChannelManager *)v10 unsubscribeFromChannelDebounceTimer];
    [v17 setDelegateQueue:queue];

    v18 = [(HMDResidentStatusChannelManager *)v10 unsubscribeFromChannelDebounceTimer];
    [v18 resume];
  }
}

- (BOOL)_shouldChannelBeRunning
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(HMDResidentStatusChannelManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDResidentStatusChannelManager *)self clientIdentifiers];
  uint64_t v5 = [v4 count];

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  double v7 = self;
  double v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = HMFGetLogIdentifier();
    v10 = HMFBooleanToString();
    uint64_t v11 = [(HMDResidentStatusChannelManager *)v7 clientIdentifiers];
    int v13 = 138543874;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    __int16 v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Evaluated shouldChannelBeRunning: %@ (clientIdentifiers: %@)", (uint8_t *)&v13, 0x20u);
  }
  return v5 != 0;
}

- (void)_evaluateChannelConnectionStateWithCurrentClientIdentifierCount:(unint64_t)a3 previousClientIdentifierCount:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v7 = [(HMDResidentStatusChannelManager *)self queue];
  dispatch_assert_queue_V2(v7);

  double v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    v12 = [(HMDResidentStatusChannelManager *)v9 clientIdentifiers];
    int v14 = 138544130;
    __int16 v15 = v11;
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    __int16 v21 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Evaluating channel connection state (currentCount: %lu previousCount: %lu, clientIdentifiers: %@)", (uint8_t *)&v14, 0x2Au);
  }
  if ((a3 != 0) != (a4 != 0))
  {
    if ([(HMDResidentStatusChannelManager *)v9 _shouldChannelBeRunning])
    {
      [(HMDResidentStatusChannelManager *)v9 _stopUnsubscribeFromChannelDebounceTimer];
      int v13 = [(HMDResidentStatusChannelManager *)v9 residentStatusChannel];
      [v13 start];
    }
    else
    {
      [(HMDResidentStatusChannelManager *)v9 _startUnsubscribeFromChannelDebounceTimer];
    }
  }
}

- (BOOL)_residentStatusChannelNeededForBundleIdentifier:(id)a3 applicationState:(unint64_t)a4
{
  v14[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a4 | 2) == 2)
  {
    uint64_t v6 = *MEMORY[0x263F0C7A8];
    v14[0] = *MEMORY[0x263F0C748];
    v14[1] = v6;
    v14[2] = *MEMORY[0x263F0D238];
    double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
    if (isInternalBuild())
    {
      uint64_t v8 = *MEMORY[0x263F0C940];
      v13[0] = *MEMORY[0x263F0C938];
      v13[1] = v8;
      v13[2] = *MEMORY[0x263F0CF40];
      int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
      uint64_t v10 = [v7 arrayByAddingObjectsFromArray:v9];

      double v7 = (void *)v10;
    }
    char v11 = [v7 containsObject:v5];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)_handleForegroundStateChangedForBundleIdentifier:(id)a3 applicationState:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(HMDResidentStatusChannelManager *)self _residentStatusChannelNeededForBundleIdentifier:v6 applicationState:a4])
  {
    [(HMDResidentStatusChannelManager *)self addClientWithIdentifier:v6];
  }
  else
  {
    double v7 = [(HMDResidentStatusChannelManager *)self clientIdentifiers];
    int v8 = [v7 containsObject:v6];

    if (v8)
    {
      [(HMDResidentStatusChannelManager *)self removeClientWithIdentifier:v6];
    }
    else
    {
      int v9 = (void *)MEMORY[0x230FBD990]();
      uint64_t v10 = self;
      char v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = HMFGetLogIdentifier();
        int v13 = 138543874;
        int v14 = v12;
        __int16 v15 = 2160;
        uint64_t v16 = 1752392040;
        __int16 v17 = 2112;
        id v18 = v6;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@No changes to resident status channel clients for '%{mask.hash}@'", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

- (void)_configureWithExistingProcesses:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__HMDResidentStatusChannelManager__configureWithExistingProcesses___block_invoke;
  v3[3] = &unk_264A242F8;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

void __67__HMDResidentStatusChannelManager__configureWithExistingProcesses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];
  if ([v4 length])
  {
    int v5 = [v3 shouldMonitor];
    id v6 = *(void **)(a1 + 32);
    if (v5)
    {
      uint64_t v7 = [v3 state];
      int v8 = v6;
      int v9 = v4;
    }
    else
    {
      int v8 = *(void **)(a1 + 32);
      int v9 = v4;
      uint64_t v7 = 0;
    }
    [v8 _handleForegroundStateChangedForBundleIdentifier:v9 applicationState:v7];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      __int16 v15 = v13;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Missing process info application bundle identifier: %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (NSMutableSet)clientIdentifiers
{
  id v3 = [(HMDResidentStatusChannelManager *)self queue];
  dispatch_assert_queue_V2(v3);

  clientIdentifiers = self->_clientIdentifiers;
  return clientIdentifiers;
}

- (void)handleProcessRemoved:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDResidentStatusChannelManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HMDResidentStatusChannelManager_handleProcessRemoved___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__HMDResidentStatusChannelManager_handleProcessRemoved___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"processInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 bundleIdentifier];
    if ([v6 length])
    {
      if (([v5 shouldMonitor] & 1) == 0)
      {
        uint64_t v7 = (void *)MEMORY[0x230FBD990]();
        id v8 = *(id *)(a1 + 40);
        int v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v10 = HMFGetLogIdentifier();
          int v21 = 138543618;
          uint64_t v22 = v10;
          __int16 v23 = 2112;
          id v24 = v5;
          _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Handling process info removed notification: %@", (uint8_t *)&v21, 0x16u);
        }
        [*(id *)(a1 + 40) _handleForegroundStateChangedForBundleIdentifier:v6 applicationState:1];
      }
    }
    else
    {
      __int16 v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 40);
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        __int16 v20 = *(void **)(a1 + 32);
        int v21 = 138543618;
        uint64_t v22 = v19;
        __int16 v23 = 2112;
        id v24 = v20;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing process info application bundle identifier: %@", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 40);
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      __int16 v15 = *(void **)(a1 + 32);
      int v21 = 138543618;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      id v24 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Bad process removed notification object: %@", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)handleProcessAdded:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentStatusChannelManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HMDResidentStatusChannelManager_handleProcessAdded___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__HMDResidentStatusChannelManager_handleProcessAdded___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"processInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 bundleIdentifier];
    if ([v6 length])
    {
      if (([v5 shouldMonitor] & 1) == 0)
      {
        uint64_t v7 = (void *)MEMORY[0x230FBD990]();
        id v8 = *(id *)(a1 + 40);
        int v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v10 = HMFGetLogIdentifier();
          int v21 = 138543618;
          uint64_t v22 = v10;
          __int16 v23 = 2112;
          id v24 = v5;
          _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Handling process info added notification: %@", (uint8_t *)&v21, 0x16u);
        }
        [*(id *)(a1 + 40) _handleForegroundStateChangedForBundleIdentifier:v6 applicationState:0];
      }
    }
    else
    {
      __int16 v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 40);
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        __int16 v20 = *(void **)(a1 + 32);
        int v21 = 138543618;
        uint64_t v22 = v19;
        __int16 v23 = 2112;
        id v24 = v20;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing process info application bundle identifier: %@", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 40);
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      __int16 v15 = *(void **)(a1 + 32);
      int v21 = 138543618;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      id v24 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Bad process added notification object: %@", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)handleProcessInfoStateChanged:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"processInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    int v9 = [v8 bundleIdentifier];
    if (v9)
    {
      uint64_t v10 = [(HMDResidentStatusChannelManager *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__HMDResidentStatusChannelManager_handleProcessInfoStateChanged___block_invoke;
      block[3] = &unk_264A2F2F8;
      block[4] = self;
      id v21 = v8;
      id v22 = v9;
      dispatch_async(v10, block);
    }
    else
    {
      __int16 v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v24 = v19;
        __int16 v25 = 2112;
        id v26 = v4;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing process info application bundle identifier: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      __int16 v15 = [v4 userInfo];
      *(_DWORD *)buf = 138543874;
      id v24 = v14;
      __int16 v25 = 2112;
      id v26 = v4;
      __int16 v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not find process info in notification user info for %@: %@", buf, 0x20u);
    }
  }
}

uint64_t __65__HMDResidentStatusChannelManager_handleProcessInfoStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Handling state changed notification for process info: %@", (uint8_t *)&v8, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_handleForegroundStateChangedForBundleIdentifier:applicationState:", *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "state"));
}

- (void)removeClientWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentStatusChannelManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HMDResidentStatusChannelManager_removeClientWithIdentifier___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __62__HMDResidentStatusChannelManager_removeClientWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) clientIdentifiers];
  uint64_t v3 = [v2 count];

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v13 = 138543618;
    int v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing client with identifier: %@", (uint8_t *)&v13, 0x16u);
  }
  int v9 = [*(id *)(a1 + 32) clientIdentifiers];
  [v9 removeObject:*(void *)(a1 + 40)];

  __int16 v10 = [*(id *)(a1 + 32) clientIdentifiers];
  uint64_t v11 = [v10 count];

  return [*(id *)(a1 + 32) _evaluateChannelConnectionStateWithCurrentClientIdentifierCount:v11 previousClientIdentifierCount:v3];
}

- (void)addClientWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentStatusChannelManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HMDResidentStatusChannelManager_addClientWithIdentifier___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __59__HMDResidentStatusChannelManager_addClientWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) clientIdentifiers];
  uint64_t v3 = [v2 count];

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v13 = 138543618;
    int v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Adding client with identifier: %@", (uint8_t *)&v13, 0x16u);
  }
  int v9 = [*(id *)(a1 + 32) clientIdentifiers];
  [v9 addObject:*(void *)(a1 + 40)];

  __int16 v10 = [*(id *)(a1 + 32) clientIdentifiers];
  uint64_t v11 = [v10 count];

  return [*(id *)(a1 + 32) _evaluateChannelConnectionStateWithCurrentClientIdentifierCount:v11 previousClientIdentifierCount:v3];
}

- (void)configure
{
  uint64_t v3 = [(HMDResidentStatusChannelManager *)self notificationCenter];
  [v3 addObserver:self selector:sel_handleProcessInfoStateChanged_ name:HMDProcessMonitorProcessStateDidChangeNotification object:0];

  if (isInternalBuild())
  {
    id v4 = [(HMDResidentStatusChannelManager *)self notificationCenter];
    [v4 addObserver:self selector:sel_handleProcessAdded_ name:@"HMDProcessMonitorProcessAddedNotification" object:0];

    id v5 = [(HMDResidentStatusChannelManager *)self notificationCenter];
    [v5 addObserver:self selector:sel_handleProcessRemoved_ name:@"HMDProcessMonitorProcessRemovedNotification" object:0];
  }
  id v6 = [(HMDResidentStatusChannelManager *)self processMonitor];
  id v7 = [v6 processes];

  [(HMDResidentStatusChannelManager *)self _configureWithExistingProcesses:v7];
}

- (HMDResidentStatusChannelManager)initWithResidentStatusChannel:(id)a3 queue:(id)a4 idsServerBag:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x263F08A00];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 defaultCenter];
  int v13 = objc_opt_new();
  int v14 = +[HMDXPCMessageTransport defaultTransport];
  __int16 v15 = [v14 processMonitor];
  uint64_t v16 = [(HMDResidentStatusChannelManager *)self initWithResidentStatusChannel:v11 notificationCenter:v12 queue:v10 timerProvider:v13 idsServerBag:v9 processMonitor:v15];

  return v16;
}

- (HMDResidentStatusChannelManager)initWithResidentStatusChannel:(id)a3 notificationCenter:(id)a4 queue:(id)a5 timerProvider:(id)a6 idsServerBag:(id)a7 processMonitor:(id)a8
{
  id v25 = a3;
  id v24 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMDResidentStatusChannelManager;
  uint64_t v19 = [(HMDResidentStatusChannelManager *)&v26 init];
  __int16 v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_residentStatusChannel, a3);
    objc_storeStrong((id *)&v20->_notificationCenter, a4);
    objc_storeStrong((id *)&v20->_queue, a5);
    objc_storeStrong((id *)&v20->_timerProvider, a6);
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9C0], "set", v24, v25);
    clientIdentifiers = v20->_clientIdentifiers;
    v20->_clientIdentifiers = (NSMutableSet *)v21;

    objc_storeWeak((id *)&v20->_idsServerBag, v17);
    objc_storeStrong((id *)&v20->_processMonitor, a8);
  }

  return v20;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_182713 != -1) {
    dispatch_once(&logCategory__hmf_once_t20_182713, &__block_literal_global_182714);
  }
  v2 = (void *)logCategory__hmf_once_v21_182715;
  return v2;
}

void __46__HMDResidentStatusChannelManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v21_182715;
  logCategory__hmf_once_v21_182715 = v0;
}

@end