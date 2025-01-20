@interface HMDIDSServiceManager
+ (HMDIDSServiceManager)sharedManager;
+ (NSString)sharedIDSServiceName;
+ (id)logCategory;
- (HMDIDSActivityMonitorBroadcaster)activityBroadcaster;
- (HMDIDSActivityMonitorObserver)activityObserver;
- (HMDIDSService)hmmmEnergyService;
- (HMDIDSService)hmmmService;
- (HMDIDSService)legacyService;
- (HMDIDSService)proxyService;
- (HMDIDSService)service;
- (HMDIDSService)streamService;
- (HMDIDSServiceManager)initWithDefaults;
- (HMDIDSServiceManager)initWithMainService:(id)a3 legacyService:(id)a4 hmmmService:(id)a5 hmmmEnergyService:(id)a6 proxyService:(id)a7 streamService:(id)a8 notificationCenter:(id)a9;
- (dispatch_queue_t)applicationBundleIdentifiersThatNeedWakingMessages;
- (void)addProxyServiceLinkPreferencesAssertionHolder:(id)a3;
- (void)configure;
- (void)handleProcessInfoStateChanged:(id)a3;
- (void)retrieveFirewallWithQueue:(id)a3 completion:(id)a4;
- (void)setActivityMonitorDataSource:(id)a3;
- (void)unconfigure;
@end

@implementation HMDIDSServiceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_proxyLinkPreferenceAssertion);
  objc_storeStrong((id *)&self->_activityMonitor, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_activityObserver, 0);
  objc_storeStrong((id *)&self->_activityBroadcaster, 0);
  objc_storeStrong((id *)&self->_streamService, 0);
  objc_storeStrong((id *)&self->_proxyService, 0);
  objc_storeStrong((id *)&self->_legacyService, 0);
  objc_storeStrong((id *)&self->_hmmmEnergyService, 0);
  objc_storeStrong((id *)&self->_hmmmService, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifiersThatNeedWakingMessages, 0);
}

- (HMDIDSActivityMonitorObserver)activityObserver
{
  return (HMDIDSActivityMonitorObserver *)objc_getProperty(self, a2, 72, 1);
}

- (HMDIDSActivityMonitorBroadcaster)activityBroadcaster
{
  return (HMDIDSActivityMonitorBroadcaster *)objc_getProperty(self, a2, 64, 1);
}

- (HMDIDSService)streamService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 56, 1);
}

- (HMDIDSService)proxyService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 48, 1);
}

- (HMDIDSService)legacyService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 40, 1);
}

- (HMDIDSService)hmmmEnergyService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 32, 1);
}

- (HMDIDSService)hmmmService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 24, 1);
}

- (HMDIDSService)service
{
  return (HMDIDSService *)objc_getProperty(self, a2, 16, 1);
}

- (void)retrieveFirewallWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDIDSServiceManager *)self service];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__HMDIDSServiceManager_retrieveFirewallWithQueue_completion___block_invoke;
  v10[3] = &unk_264A15338;
  id v11 = v6;
  id v9 = v6;
  [v8 retrieveFirewallWithQueue:v7 completion:v10];
}

uint64_t __61__HMDIDSServiceManager_retrieveFirewallWithQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleProcessInfoStateChanged:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"processInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v8 bundleIdentifier];
    if ([v9 length])
    {
      if (self) {
        workQueue = self->_workQueue;
      }
      else {
        workQueue = 0;
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__HMDIDSServiceManager_handleProcessInfoStateChanged___block_invoke;
      block[3] = &unk_264A2F2F8;
      block[4] = self;
      id v20 = v8;
      id v21 = v9;
      dispatch_async(workQueue, block);
    }
    else
    {
      v15 = (void *)MEMORY[0x230FBD990]();
      v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v23 = v18;
        __int16 v24 = 2112;
        id v25 = v4;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing process info application bundle identifier: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v14;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Bad process info notification object: %@", buf, 0x16u);
    }
  }
}

void __54__HMDIDSServiceManager_handleProcessInfoStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v52 = v5;
    __int16 v53 = 2112;
    uint64_t v54 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Handling process info notification: %@", buf, 0x16u);
  }
  id v7 = -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 32));
  uint64_t v8 = [v7 count];

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v10 state];
    if (v12 == -1)
    {
      LODWORD(v9) = [v11 isEntitledForSPIAccess];
    }
    else if (v12 == 2)
    {
      v14 = [v11 applicationInfo];
      LODWORD(v9) = v14 == 0;
    }
    else if (v12)
    {
      LODWORD(v9) = 0;
    }
    else
    {
      v13 = [v11 applicationIdentifier];
      if ([&unk_26E473D98 containsObject:v13])
      {
        LODWORD(v9) = 0;
      }
      else
      {
        v15 = [v11 bundleIdentifier];
        LODWORD(v9) = [&unk_26E473D98 containsObject:v15] ^ 1;
      }
    }
  }

  v16 = -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 32));
  v17 = v16;
  uint64_t v18 = *(void *)(a1 + 48);
  if (v9)
  {
    [v16 addObject:v18];

    v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = *(id *)(a1 + 32);
    id v21 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    v22 = HMFGetLogIdentifier();
    uint64_t v23 = *(void *)(a1 + 48);
    __int16 v24 = -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 32));
    *(_DWORD *)buf = 138544130;
    v52 = v22;
    __int16 v53 = 2160;
    uint64_t v54 = 1752392040;
    __int16 v55 = 2112;
    uint64_t v56 = v23;
    __int16 v57 = 2112;
    id v58 = v24;
    id v25 = "%{public}@Added '%{mask.hash}@' to waking message priority list: %@";
    goto LABEL_20;
  }
  int v26 = [v16 containsObject:v18];

  if (!v26)
  {
    v45 = (void *)MEMORY[0x230FBD990]();
    id v46 = *(id *)(a1 + 32);
    v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      v48 = HMFGetLogIdentifier();
      uint64_t v49 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v52 = v48;
      __int16 v53 = 2160;
      uint64_t v54 = 1752392040;
      __int16 v55 = 2112;
      uint64_t v56 = v49;
      _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_DEBUG, "%{public}@No changes to waking priority list for '%{mask.hash}@'", buf, 0x20u);
    }
    return;
  }
  v27 = -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 32));
  [v27 removeObject:*(void *)(a1 + 48)];

  v19 = (void *)MEMORY[0x230FBD990]();
  id v20 = *(id *)(a1 + 32);
  id v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = HMFGetLogIdentifier();
    uint64_t v28 = *(void *)(a1 + 48);
    __int16 v24 = -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 32));
    *(_DWORD *)buf = 138544130;
    v52 = v22;
    __int16 v53 = 2160;
    uint64_t v54 = 1752392040;
    __int16 v55 = 2112;
    uint64_t v56 = v28;
    __int16 v57 = 2112;
    id v58 = v24;
    id v25 = "%{public}@Removed '%{mask.hash}@' from waking message priority list: %@";
LABEL_20:
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, v25, buf, 0x2Au);
  }
LABEL_21:

  v29 = -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 32));
  uint64_t v30 = [v29 count];

  if (!v8 && v30)
  {
    uint64_t v31 = 2;
    goto LABEL_27;
  }
  if (v8 && !v30)
  {
    uint64_t v31 = 1;
LABEL_27:
    v32 = [*(id *)(a1 + 32) service];
    id v50 = 0;
    int v33 = [v32 setWakingPushPriority:v31 error:&v50];
    id v34 = v50;

    v35 = (void *)MEMORY[0x230FBD990]();
    id v36 = *(id *)(a1 + 32);
    v37 = HMFGetOSLogHandle();
    v38 = v37;
    if (v33)
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v39 = HMFGetLogIdentifier();
        v40 = [(id)objc_opt_class() sharedIDSServiceName];
        *(_DWORD *)buf = 138543874;
        v52 = v39;
        __int16 v53 = 2114;
        uint64_t v54 = (uint64_t)v40;
        __int16 v55 = 2048;
        uint64_t v56 = v31;
        v41 = "%{public}@Set waking push priority for service '%{public}@' to %ld";
        v42 = v38;
        os_log_type_t v43 = OS_LOG_TYPE_INFO;
        uint32_t v44 = 32;
LABEL_32:
        _os_log_impl(&dword_22F52A000, v42, v43, v41, buf, v44);
      }
    }
    else if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      v40 = [(id)objc_opt_class() sharedIDSServiceName];
      *(_DWORD *)buf = 138544130;
      v52 = v39;
      __int16 v53 = 2114;
      uint64_t v54 = (uint64_t)v40;
      __int16 v55 = 2048;
      uint64_t v56 = v31;
      __int16 v57 = 2112;
      id v58 = v34;
      v41 = "%{public}@Failed to set waking push priority for service '%{public}@' to %ld: %@";
      v42 = v38;
      os_log_type_t v43 = OS_LOG_TYPE_ERROR;
      uint32_t v44 = 42;
      goto LABEL_32;
    }
  }
}

- (dispatch_queue_t)applicationBundleIdentifiersThatNeedWakingMessages
{
  if (a1)
  {
    v2 = a1;
    dispatch_assert_queue_V2(a1[10]);
    a1 = v2[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addProxyServiceLinkPreferencesAssertionHolder:(id)a3
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
  v7[2] = __70__HMDIDSServiceManager_addProxyServiceLinkPreferencesAssertionHolder___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __70__HMDIDSServiceManager_addProxyServiceLinkPreferencesAssertionHolder___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x230FBD990]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3 || (WeakRetained = (_HMDIDSProxyLinkPreferenceAssertion *)objc_loadWeakRetained((id *)(v3 + 96))) == 0)
  {
    v5 = [_HMDIDSProxyLinkPreferenceAssertion alloc];
    id v6 = [*(id *)(a1 + 32) proxyService];
    WeakRetained = [(_HMDIDSProxyLinkPreferenceAssertion *)v5 initWithIDSProxyService:v6];

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      objc_storeWeak((id *)(v7 + 96), WeakRetained);
    }
  }
  objc_setAssociatedObject(*(id *)(a1 + 40), "HMD.ProxyIDSServiceAssertion", WeakRetained, (void *)1);
}

- (void)unconfigure
{
  v2 = self;
  if (self) {
    self = (HMDIDSServiceManager *)self->_notificationCenter;
  }
  [(HMDIDSServiceManager *)self removeObserver:v2];
}

- (void)configure
{
  v2 = self;
  if (self) {
    self = (HMDIDSServiceManager *)self->_notificationCenter;
  }
  [(HMDIDSServiceManager *)self addObserver:v2 selector:sel_handleProcessInfoStateChanged_ name:HMDProcessMonitorProcessStateDidChangeNotification object:0];
}

- (void)setActivityMonitorDataSource:(id)a3
{
  id v4 = a3;
  v5 = [(HMDIDSServiceManager *)self activityObserver];
  [v5 configureWithDataSource:v4];

  id v6 = [(HMDIDSServiceManager *)self activityBroadcaster];
  [v6 configureWithDataSource:v4];
}

- (HMDIDSServiceManager)initWithMainService:(id)a3 legacyService:(id)a4 hmmmService:(id)a5 hmmmEnergyService:(id)a6 proxyService:(id)a7 streamService:(id)a8 notificationCenter:(id)a9
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v47 = a3;
  id v16 = a4;
  id v46 = a5;
  id obj = a6;
  id v45 = a6;
  id v44 = a7;
  id v43 = a8;
  id v42 = a9;
  v48.receiver = self;
  v48.super_class = (Class)HMDIDSServiceManager;
  v17 = [(HMDIDSServiceManager *)&v48 init];
  if (v17)
  {
    uint64_t v18 = [MEMORY[0x263F42620] productInfo];
    if (!v18)
    {
      id v40 = v16;
      v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = v17;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = v39 = v19;
        *(_DWORD *)buf = 138543362;
        id v50 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Unable to determine current product info, this may limit available IDS services", buf, 0xCu);

        v19 = v39;
      }

      uint64_t v18 = 0;
      id v16 = v40;
    }
    objc_storeStrong((id *)&v17->_notificationCenter, a9);
    uint64_t v23 = [MEMORY[0x263EFF9C0] set];
    applicationBundleIdentifiersThatNeedWakingMessages = v17->_applicationBundleIdentifiersThatNeedWakingMessages;
    v17->_applicationBundleIdentifiersThatNeedWakingMessages = (NSMutableSet *)v23;

    objc_storeStrong((id *)&v17->_service, a3);
    objc_storeStrong((id *)&v17->_legacyService, a4);
    objc_storeStrong((id *)&v17->_proxyService, a7);
    objc_storeStrong((id *)&v17->_streamService, a8);
    id v25 = [HMDIDSActivityMonitor alloc];
    int v26 = +[HMDIDSServiceManager sharedIDSServiceName];
    uint64_t v27 = [(HMDIDSActivityMonitor *)v25 initWithActivity:@"com.apple.HomeKit" serviceIdentifier:v26];
    activityMonitor = v17->_activityMonitor;
    v17->_activityMonitor = (HMDIDSActivityMonitor *)v27;

    v29 = [[HMDIDSActivityMonitorBroadcaster alloc] initWithActivityMonitor:v17->_activityMonitor];
    activityBroadcaster = v17->_activityBroadcaster;
    v17->_activityBroadcaster = v29;

    uint64_t v31 = [[HMDIDSActivityMonitorObserver alloc] initWithActivityMonitor:v17->_activityMonitor];
    activityObserver = v17->_activityObserver;
    v17->_activityObserver = v31;

    HMDispatchQueueNameString();
    id v33 = objc_claimAutoreleasedReturnValue();
    id v34 = (const char *)[v33 UTF8String];
    v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v36 = dispatch_queue_create(v34, v35);
    workQueue = v17->_workQueue;
    v17->_workQueue = (OS_dispatch_queue *)v36;

    objc_storeStrong((id *)&v17->_hmmmService, a5);
    objc_storeStrong((id *)&v17->_hmmmEnergyService, obj);
  }
  return v17;
}

- (HMDIDSServiceManager)initWithDefaults
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[HMDIDSServiceManager sharedIDSServiceName];
  id v4 = (void *)MEMORY[0x230FBD990]();
  v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v40 = v7;
    __int16 v41 = 2112;
    uint64_t v42 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Using IDS service %@", buf, 0x16u);
  }
  v38 = (void *)v3;
  uint64_t v8 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:v3];
  if (_os_feature_enabled_impl())
  {
    uint64_t v36 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.alarms-timers"];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.energykit"];
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v36 = 0;
  }
  v37 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.willow"];
  id v10 = [MEMORY[0x263F42620] productInfo];
  id v11 = v10;
  if (!v10)
  {
    v17 = (void *)v8;
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    v19 = v5;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v40 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine current product info, this may limit available IDS services", buf, 0xCu);
    }
    v22 = 0;
    id v16 = 0;
    goto LABEL_20;
  }
  if ([v10 productPlatform] == 3
    || +[HMDDeviceCapabilities isCompanionCapable])
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    v13 = v5;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v40 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Starting proxy service", buf, 0xCu);
    }
    id v16 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.willow.proxy"];
  }
  else
  {
    id v16 = 0;
  }
  uint64_t v23 = [v11 productPlatform];
  v17 = (void *)v8;
  if ((unint64_t)(v23 - 1) < 5)
  {
    __int16 v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = v5;
    int v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v40 = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Starting stream service", buf, 0xCu);
    }
    v22 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.willow.stream"];
    goto LABEL_20;
  }
  if (v23)
  {
    v22 = 0;
LABEL_20:
    uint64_t v28 = (void *)v36;
    goto LABEL_21;
  }
  v32 = (void *)MEMORY[0x230FBD990]();
  id v33 = v5;
  id v34 = HMFGetOSLogHandle();
  uint64_t v28 = (void *)v36;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v35 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v40 = v35;
    _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine platform, this may limit available IDS services", buf, 0xCu);
  }
  v22 = 0;
LABEL_21:
  v29 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v30 = [(HMDIDSServiceManager *)v5 initWithMainService:v17 legacyService:v37 hmmmService:v28 hmmmEnergyService:v9 proxyService:v16 streamService:v22 notificationCenter:v29];

  return v30;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18 != -1) {
    dispatch_once(&logCategory__hmf_once_t18, &__block_literal_global_5716);
  }
  v2 = (void *)logCategory__hmf_once_v19;
  return v2;
}

void __35__HMDIDSServiceManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v19;
  logCategory__hmf_once_v19 = v0;
}

+ (NSString)sharedIDSServiceName
{
  return (NSString *)@"com.apple.private.alloy.home";
}

+ (HMDIDSServiceManager)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HMDIDSServiceManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedIDSServiceManager;
  return (HMDIDSServiceManager *)v2;
}

uint64_t __37__HMDIDSServiceManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Creating a sharedIDSServiceManager", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v6 = [objc_alloc(*(Class *)(a1 + 32)) initWithDefaults];
  uint64_t v7 = (void *)sharedManager_sharedIDSServiceManager;
  sharedManager_sharedIDSServiceManager = v6;

  return [(id)sharedManager_sharedIDSServiceManager configure];
}

@end