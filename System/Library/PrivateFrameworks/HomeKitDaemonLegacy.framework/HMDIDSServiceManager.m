@interface HMDIDSServiceManager
+ (HMDIDSServiceManager)sharedManager;
+ (NSString)sharedIDSServiceName;
+ (id)logCategory;
- (HMDIDSActivityMonitorBroadcaster)activityBroadcaster;
- (HMDIDSActivityMonitorObserver)activityObserver;
- (HMDIDSService)modernService;
- (HMDIDSService)proxyService;
- (HMDIDSService)service;
- (HMDIDSService)streamService;
- (HMDIDSServiceManager)initWithDefaults;
- (HMDIDSServiceManager)initWithMainService:(id)a3 modernService:(id)a4 proxyService:(id)a5 streamService:(id)a6 notificationCenter:(id)a7;
- (dispatch_queue_t)applicationBundleIdentifiersThatNeedWakingMessages;
- (void)addProxyServiceLinkPreferencesAssertionHolder:(id)a3;
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
  objc_storeStrong((id *)&self->_modernService, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifiersThatNeedWakingMessages, 0);
}

- (HMDIDSActivityMonitorObserver)activityObserver
{
  return (HMDIDSActivityMonitorObserver *)objc_getProperty(self, a2, 56, 1);
}

- (HMDIDSActivityMonitorBroadcaster)activityBroadcaster
{
  return (HMDIDSActivityMonitorBroadcaster *)objc_getProperty(self, a2, 48, 1);
}

- (HMDIDSService)streamService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 40, 1);
}

- (HMDIDSService)proxyService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 32, 1);
}

- (HMDIDSService)modernService
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
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__HMDIDSServiceManager_retrieveFirewallWithQueue_completion___block_invoke;
  v10[3] = &unk_1E6A05DB8;
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
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
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__HMDIDSServiceManager_handleProcessInfoStateChanged___block_invoke;
      block[3] = &unk_1E6A19668;
      block[4] = self;
      id v20 = v8;
      id v21 = v9;
      dispatch_async(workQueue, block);
    }
    else
    {
      v15 = (void *)MEMORY[0x1D9452090]();
      v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v23 = v18;
        __int16 v24 = 2112;
        id v25 = v4;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing process info application bundle identifier: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v14;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Bad process info notification object: %@", buf, 0x16u);
    }
  }
}

void __54__HMDIDSServiceManager_handleProcessInfoStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Handling process info notification: %@", buf, 0x16u);
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
      if ([&unk_1F2DC6970 containsObject:v13])
      {
        LODWORD(v9) = 0;
      }
      else
      {
        v15 = [v11 bundleIdentifier];
        LODWORD(v9) = [&unk_1F2DC6970 containsObject:v15] ^ 1;
      }
    }
  }

  v16 = -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 32));
  v17 = v16;
  uint64_t v18 = *(void *)(a1 + 48);
  if (v9)
  {
    [v16 addObject:v18];

    v19 = (void *)MEMORY[0x1D9452090]();
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
    v45 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_DEBUG, "%{public}@No changes to waking priority list for '%{mask.hash}@'", buf, 0x20u);
    }
    return;
  }
  v27 = -[HMDIDSServiceManager applicationBundleIdentifiersThatNeedWakingMessages](*(dispatch_queue_t **)(a1 + 32));
  [v27 removeObject:*(void *)(a1 + 48)];

  v19 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, v25, buf, 0x2Au);
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

    v35 = (void *)MEMORY[0x1D9452090]();
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
        _os_log_impl(&dword_1D49D5000, v42, v43, v41, buf, v44);
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
    dispatch_assert_queue_V2(a1[8]);
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
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HMDIDSServiceManager_addProxyServiceLinkPreferencesAssertionHolder___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __70__HMDIDSServiceManager_addProxyServiceLinkPreferencesAssertionHolder___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D9452090]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3 || (WeakRetained = (_HMDIDSProxyLinkPreferenceAssertion *)objc_loadWeakRetained((id *)(v3 + 80))) == 0)
  {
    v5 = [_HMDIDSProxyLinkPreferenceAssertion alloc];
    id v6 = [*(id *)(a1 + 32) proxyService];
    WeakRetained = [(_HMDIDSProxyLinkPreferenceAssertion *)v5 initWithIDSProxyService:v6];

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      objc_storeWeak((id *)(v7 + 80), WeakRetained);
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

- (void)setActivityMonitorDataSource:(id)a3
{
  id v4 = a3;
  v5 = [(HMDIDSServiceManager *)self activityObserver];
  [v5 configureWithDataSource:v4];

  id v6 = [(HMDIDSServiceManager *)self activityBroadcaster];
  [v6 configureWithDataSource:v4];
}

- (HMDIDSServiceManager)initWithMainService:(id)a3 modernService:(id)a4 proxyService:(id)a5 streamService:(id)a6 notificationCenter:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v42 = a6;
  id v41 = a7;
  v43.receiver = self;
  v43.super_class = (Class)HMDIDSServiceManager;
  v16 = [(HMDIDSServiceManager *)&v43 init];
  if (v16)
  {
    id v40 = v15;
    v17 = [MEMORY[0x1E4F65548] productInfo];
    if (!v17)
    {
      id v39 = v14;
      context = (void *)MEMORY[0x1D9452090]();
      uint64_t v18 = v16;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v20 = v37 = v13;
        *(_DWORD *)buf = 138543362;
        v45 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Unable to determine current product info, this may limit available IDS services", buf, 0xCu);

        id v13 = v37;
      }

      id v14 = v39;
    }
    objc_storeStrong((id *)&v16->_notificationCenter, a7);
    uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
    applicationBundleIdentifiersThatNeedWakingMessages = v16->_applicationBundleIdentifiersThatNeedWakingMessages;
    v16->_applicationBundleIdentifiersThatNeedWakingMessages = (NSMutableSet *)v21;

    objc_storeStrong((id *)&v16->_service, a3);
    objc_storeStrong((id *)&v16->_modernService, a4);
    objc_storeStrong((id *)&v16->_proxyService, a5);
    objc_storeStrong((id *)&v16->_streamService, a6);
    uint64_t v23 = [HMDIDSActivityMonitor alloc];
    __int16 v24 = +[HMDIDSServiceManager sharedIDSServiceName];
    uint64_t v25 = [(HMDIDSActivityMonitor *)v23 initWithActivity:@"com.apple.HomeKit" serviceIdentifier:v24];
    activityMonitor = v16->_activityMonitor;
    v16->_activityMonitor = (HMDIDSActivityMonitor *)v25;

    v27 = [[HMDIDSActivityMonitorBroadcaster alloc] initWithActivityMonitor:v16->_activityMonitor];
    activityBroadcaster = v16->_activityBroadcaster;
    v16->_activityBroadcaster = v27;

    v29 = [[HMDIDSActivityMonitorObserver alloc] initWithActivityMonitor:v16->_activityMonitor];
    activityObserver = v16->_activityObserver;
    v16->_activityObserver = v29;

    HMDispatchQueueNameString();
    id v31 = objc_claimAutoreleasedReturnValue();
    v32 = (const char *)[v31 UTF8String];
    int v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v34 = dispatch_queue_create(v32, v33);
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v34;

    id v15 = v40;
  }

  return v16;
}

- (HMDIDSServiceManager)initWithDefaults
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[HMDIDSServiceManager sharedIDSServiceName];
  id v4 = (void *)MEMORY[0x1D9452090]();
  v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v38 = 138543618;
    id v39 = v7;
    __int16 v40 = 2112;
    id v41 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Using IDS service %@", (uint8_t *)&v38, 0x16u);
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:v3];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.home"];
  id v10 = [MEMORY[0x1E4F65548] productInfo];
  id v11 = v10;
  if (v10)
  {
    if ([v10 productPlatform] == 3
      || +[HMDDeviceCapabilities isCompanionCapable])
    {
      uint64_t v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = v5;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = HMFGetLogIdentifier();
        int v38 = 138543362;
        id v39 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Starting proxy service", (uint8_t *)&v38, 0xCu);
      }
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.willow.proxy"];
    }
    else
    {
      v16 = 0;
    }
    uint64_t v22 = [v11 productPlatform];
    if ((unint64_t)(v22 - 1) >= 5)
    {
      if (!v22)
      {
        uint64_t v30 = (void *)MEMORY[0x1D9452090]();
        id v31 = v5;
        v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = int v33 = v3;
          int v38 = 138543362;
          id v39 = v34;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine platform, this may limit available IDS services", (uint8_t *)&v38, 0xCu);

          uint64_t v3 = v33;
        }
      }
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x1D9452090]();
      __int16 v24 = v5;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        int v26 = v9;
        v27 = v8;
        v29 = uint64_t v28 = v3;
        int v38 = 138543362;
        id v39 = v29;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Starting stream service", (uint8_t *)&v38, 0xCu);

        uint64_t v3 = v28;
        id v8 = v27;
        uint64_t v9 = v26;
      }

      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.willow.stream"];
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = v5;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      int v38 = 138543362;
      id v39 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine current product info, this may limit available IDS services", (uint8_t *)&v38, 0xCu);
    }
    uint64_t v21 = 0;
    v16 = 0;
  }
  v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v36 = [(HMDIDSServiceManager *)v5 initWithMainService:v8 modernService:v9 proxyService:v16 streamService:v21 notificationCenter:v35];

  return v36;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18 != -1) {
    dispatch_once(&logCategory__hmf_once_t18, &__block_literal_global_4280);
  }
  v2 = (void *)logCategory__hmf_once_v19;
  return v2;
}

uint64_t __35__HMDIDSServiceManager_logCategory__block_invoke()
{
  logCategory__hmf_once_v19 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

+ (NSString)sharedIDSServiceName
{
  return (NSString *)@"com.apple.private.alloy.willow";
}

+ (HMDIDSServiceManager)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
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
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Creating a sharedIDSServiceManager", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v6 = [objc_alloc(*(Class *)(a1 + 32)) initWithDefaults];
  uint64_t v7 = (void *)sharedManager_sharedIDSServiceManager;
  sharedManager_sharedIDSServiceManager = v6;

  return [(id)sharedManager_sharedIDSServiceManager configure];
}

@end