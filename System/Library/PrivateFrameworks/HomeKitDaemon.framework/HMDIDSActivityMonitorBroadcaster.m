@interface HMDIDSActivityMonitorBroadcaster
+ (id)criteria;
+ (id)logCategory;
- (HMDIDSActivityMonitor)activityMonitor;
- (HMDIDSActivityMonitorBroadcaster)initWithActivityMonitor:(id)a3;
- (HMDIDSActivityMonitorBroadcaster)initWithActivityMonitor:(id)a3 timer:(id)a4 xpcActivityInterface:(id)a5;
- (HMDIDSActivityMonitorBroadcasterPushTokenDataSource)dataSource;
- (HMDXPCActivityInterfacing)xpcActivityInterface;
- (OS_dispatch_queue)queue;
- (id)logIdentifier;
- (void)_refreshBroadcastSubscription;
- (void)_registerForXPCPoll;
- (void)configureWithDataSource:(id)a3;
- (void)configureWithQueue:(id)a3;
- (void)dataSourceDidUpdate:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setQueue:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDIDSActivityMonitorBroadcaster

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityInterface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_activityMonitor, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
}

- (HMDXPCActivityInterfacing)xpcActivityInterface
{
  return (HMDXPCActivityInterfacing *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDIDSActivityMonitorBroadcasterPushTokenDataSource)dataSource
{
  return (HMDIDSActivityMonitorBroadcasterPushTokenDataSource *)objc_getProperty(self, a2, 32, 1);
}

- (HMDIDSActivityMonitor)activityMonitor
{
  return (HMDIDSActivityMonitor *)objc_getProperty(self, a2, 24, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDIDSActivityMonitorBroadcaster *)self activityMonitor];
  v3 = [v2 logIdentifier];

  return v3;
}

- (void)dataSourceDidUpdate:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDIDSActivityMonitorBroadcaster *)self dataSource];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(HMDIDSActivityMonitorBroadcaster *)self queue];

    if (v7)
    {
      v8 = (void *)MEMORY[0x230FBD990]();
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        int v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Data source updated, resuming debounce timer", (uint8_t *)&v12, 0xCu);
      }
      [(HMFTimer *)v9->_debounceTimer resume];
    }
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDIDSActivityMonitorBroadcaster *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Debounce timer fired, rebuilding observer list", (uint8_t *)&v10, 0xCu);
  }
  [(HMDIDSActivityMonitorBroadcaster *)v7 _refreshBroadcastSubscription];
}

- (void)_refreshBroadcastSubscription
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = +[HMDAppleAccountManager sharedManager];
  id v4 = [v3 account];
  uint64_t v5 = [v4 currentDevice];

  if (v5)
  {
    v6 = [(HMDIDSActivityMonitorBroadcaster *)self dataSource];
    uint64_t v7 = *MEMORY[0x263F49E00];
    v8 = [(HMDIDSActivityMonitorBroadcaster *)self queue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __65__HMDIDSActivityMonitorBroadcaster__refreshBroadcastSubscription__block_invoke;
    v13[3] = &unk_264A28890;
    v13[4] = self;
    [v6 pushTokensForDevicesObservingSubjectDevice:v5 subActivity:v7 queue:v8 completionHandler:v13];
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Current Device not yet determined, deferring IDS Activty broadcast", buf, 0xCu);
    }
  }
}

void __65__HMDIDSActivityMonitorBroadcaster__refreshBroadcastSubscription__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [v11 count];
  uint64_t v5 = [*(id *)(a1 + 32) activityMonitor];
  v6 = v5;
  uint64_t v7 = *MEMORY[0x263F49E00];
  if (v4)
  {
    v8 = [MEMORY[0x263EFFA08] setWithArray:v11];
    [v6 broadcastSubActivity:v7 toPushTokens:v8];

    uint64_t v9 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v9 + 16))
    {
      *(unsigned char *)(v9 + 16) = 1;
      [*(id *)(a1 + 32) _registerForXPCPoll];
    }
  }
  else
  {
    [v5 stopBroadcastingSubActivity:*MEMORY[0x263F49E00]];

    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
    int v10 = [*(id *)(a1 + 32) xpcActivityInterface];
    [v10 unregisterXPCActivityWithActivityIdentifier:@"com.apple.homed.idsBroadcaster"];
  }
}

- (void)_registerForXPCPoll
{
  objc_initWeak(&location, self);
  v3 = [(HMDIDSActivityMonitorBroadcaster *)self xpcActivityInterface];
  uint64_t v4 = +[HMDIDSActivityMonitorBroadcaster criteria];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__HMDIDSActivityMonitorBroadcaster__registerForXPCPoll__block_invoke;
  v5[3] = &unk_264A25D20;
  objc_copyWeak(&v6, &location);
  [v3 registerXPCActivityWithActivityIdentifier:@"com.apple.homed.idsBroadcaster" criteria:v4 activityBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__HMDIDSActivityMonitorBroadcaster__registerForXPCPoll__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__HMDIDSActivityMonitorBroadcaster__registerForXPCPoll__block_invoke_89;
    block[3] = &unk_264A2F7F8;
    block[4] = v5;
    dispatch_async(v6, block);
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@XPCActivity handler was invoked after monitor was deallocated", buf, 0xCu);
    }
  }
}

uint64_t __55__HMDIDSActivityMonitorBroadcaster__registerForXPCPoll__block_invoke_89(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshBroadcastSubscription];
}

- (void)configureWithDataSource:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_9:
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  id v6 = [(HMDIDSActivityMonitorBroadcaster *)self dataSource];

  if (v6) {
    goto LABEL_9;
  }
  [(HMDIDSActivityMonitorBroadcaster *)self setDataSource:v5];
  [v5 setDelegate:self];
  uint64_t v7 = [(HMDIDSActivityMonitorBroadcaster *)self queue];

  if (v7)
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Queue and data source set, starting debounce timer", (uint8_t *)&v12, 0xCu);
    }
    [(HMFTimer *)v9->_debounceTimer resume];
  }
}

- (void)configureWithQueue:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_9:
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  id v6 = [(HMDIDSActivityMonitorBroadcaster *)self queue];

  if (v6) {
    goto LABEL_9;
  }
  [(HMFTimer *)self->_debounceTimer setDelegateQueue:v5];
  [(HMDIDSActivityMonitorBroadcaster *)self setQueue:v5];
  uint64_t v7 = [(HMDIDSActivityMonitorBroadcaster *)self dataSource];

  if (v7)
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Queue and data source set, starting debounce timer", (uint8_t *)&v12, 0xCu);
    }
    [(HMFTimer *)self->_debounceTimer resume];
  }
}

- (HMDIDSActivityMonitorBroadcaster)initWithActivityMonitor:(id)a3
{
  id v4 = (void *)MEMORY[0x263F42608];
  id v5 = a3;
  id v6 = [v4 sharedPreferences];
  uint64_t v7 = [v6 preferenceForKey:@"activityMonitorBroadcastDebounceDelay"];
  v8 = [v7 numberValue];
  [v8 doubleValue];
  double v10 = v9;

  id v11 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:v10];
  int v12 = objc_alloc_init(HMDXPCActivityInterface);
  uint64_t v13 = [(HMDIDSActivityMonitorBroadcaster *)self initWithActivityMonitor:v5 timer:v11 xpcActivityInterface:v12];

  return v13;
}

- (HMDIDSActivityMonitorBroadcaster)initWithActivityMonitor:(id)a3 timer:(id)a4 xpcActivityInterface:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDIDSActivityMonitorBroadcaster;
  int v12 = [(HMDIDSActivityMonitorBroadcaster *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activityMonitor, a3);
    objc_storeStrong((id *)&v13->_debounceTimer, a4);
    [(HMFTimer *)v13->_debounceTimer setDelegate:v13];
    objc_storeStrong((id *)&v13->_xpcActivityInterface, a5);
    v13->_isBroadcasting = 0;
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_196778 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_196778, &__block_literal_global_95_196779);
  }
  v2 = (void *)logCategory__hmf_once_v10_196780;
  return v2;
}

void __47__HMDIDSActivityMonitorBroadcaster_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_196780;
  logCategory__hmf_once_v10_196780 = v0;
}

+ (id)criteria
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF8218]);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x263EF8270], 1);
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x263EF82A0], 1);
  return empty;
}

@end