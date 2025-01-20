@interface HMMTRControllerWrapper
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)cachedDeviceControllerShouldResume;
- (BOOL)isRVCEnabled;
- (HMMTRControllerFactory)factory;
- (HMMTRControllerParameters)startupParams;
- (HMMTRControllerWrapper)initWithWorkQueue:(id)a3 factory:(id)a4 startupParams:(id)a5 name:(id)a6 entityIdentifier:(id)a7;
- (MTRDeviceController)cachedDeviceController;
- (MTRDeviceController)controller;
- (NSMutableArray)revokeHandlers;
- (NSString)name;
- (NSUUID)entityIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (id)privateDescription;
- (void)_revokeAvailable:(BOOL)a3;
- (void)registerRevokeHandlerWithQueue:(id)a3 handler:(id)a4;
- (void)remove;
- (void)replaceStartupParams:(id)a3;
- (void)resume;
- (void)setCachedDeviceController:(id)a3;
- (void)setCachedDeviceControllerShouldResume:(BOOL)a3;
- (void)setFactory:(id)a3;
- (void)shutdown;
- (void)suspend;
- (void)suspendOrShutdown;
@end

@implementation HMMTRControllerWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDeviceController, 0);
  objc_storeStrong((id *)&self->_revokeHandlers, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_startupParams, 0);
}

- (void)setCachedDeviceControllerShouldResume:(BOOL)a3
{
  self->_cachedDeviceControllerShouldResume = a3;
}

- (BOOL)cachedDeviceControllerShouldResume
{
  return self->_cachedDeviceControllerShouldResume;
}

- (void)setCachedDeviceController:(id)a3
{
}

- (MTRDeviceController)cachedDeviceController
{
  return self->_cachedDeviceController;
}

- (NSMutableArray)revokeHandlers
{
  return self->_revokeHandlers;
}

- (void)setFactory:(id)a3
{
}

- (HMMTRControllerFactory)factory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  return (HMMTRControllerFactory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSUUID)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (id)logIdentifier
{
  v3 = NSString;
  v4 = [(HMMTRControllerWrapper *)self name];
  v5 = [v3 stringWithFormat:@"%@/%p", v4, self];

  return v5;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMMTRControllerWrapper *)self name];
  v5 = (void *)[v3 initWithName:@"Name" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)privateDescription
{
  id v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMMTRControllerWrapper *)self name];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)_revokeAvailable:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [(HMMTRControllerWrapper *)self revokeHandlers];
  uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __43__HMMTRControllerWrapper__revokeAvailable___block_invoke;
        block[3] = &unk_265377ED8;
        block[4] = v9;
        block[5] = self;
        BOOL v13 = a3;
        dispatch_async(v10, block);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

void __43__HMMTRControllerWrapper__revokeAvailable___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) handler];
  char v3 = v2[2](v2, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  if ((v3 & 1) == 0)
  {
    v4 = [*(id *)(a1 + 40) workQueue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __43__HMMTRControllerWrapper__revokeAvailable___block_invoke_2;
    v5[3] = &unk_265376E98;
    int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    dispatch_async(v4, v5);
  }
}

void __43__HMMTRControllerWrapper__revokeAvailable___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) revokeHandlers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (BOOL)isRVCEnabled
{
  return (_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED() != 0;
}

- (HMMTRControllerWrapper)initWithWorkQueue:(id)a3 factory:(id)a4 startupParams:(id)a5 name:(id)a6 entityIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HMMTRControllerWrapper;
  v18 = [(HMMTRControllerWrapper *)&v25 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_workQueue, a3);
    objc_storeWeak((id *)&v19->_factory, v14);
    uint64_t v20 = [v15 copy];
    startupParams = v19->_startupParams;
    v19->_startupParams = (HMMTRControllerParameters *)v20;

    objc_storeStrong((id *)&v19->_name, a6);
    objc_storeStrong((id *)&v19->_entityIdentifier, a7);
    uint64_t v22 = [MEMORY[0x263EFF980] array];
    revokeHandlers = v19->_revokeHandlers;
    v19->_revokeHandlers = (NSMutableArray *)v22;
  }
  return v19;
}

- (void)registerRevokeHandlerWithQueue:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMMTRControllerWrapper *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HMMTRControllerWrapper_registerRevokeHandlerWithQueue_handler___block_invoke;
  block[3] = &unk_265378900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __65__HMMTRControllerWrapper_registerRevokeHandlerWithQueue_handler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) revokeHandlers];
  id v2 = [[HMMTRControllerWrapperRevokeHandlerInfo alloc] initWithHandler:*(void *)(a1 + 48) queue:*(void *)(a1 + 40)];
  [v3 addObject:v2];
}

- (void)shutdown
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Shutting down", buf, 0xCu);
  }
  id v7 = [(HMMTRControllerWrapper *)v4 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HMMTRControllerWrapper_shutdown__block_invoke;
  block[3] = &unk_265378638;
  block[4] = v4;
  dispatch_async(v7, block);
}

void __34__HMMTRControllerWrapper_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) cachedDeviceController];
  id v3 = [v2 controllerNodeID];

  v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Shutting down Matter controller with Node ID %@", (uint8_t *)&v11, 0x16u);
  }
  v8 = [MEMORY[0x263F54020] sharedInstance];
  id v9 = [*(id *)(a1 + 32) cachedDeviceController];
  [v8 removeDeviceController:v9];

  id v10 = [*(id *)(a1 + 32) cachedDeviceController];
  [v10 shutdown];

  [*(id *)(a1 + 32) setCachedDeviceController:0];
  [*(id *)(a1 + 32) _revokeAvailable:0];
}

- (void)suspend
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Suspending stack", buf, 0xCu);
  }
  id v7 = [(HMMTRControllerWrapper *)v4 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HMMTRControllerWrapper_suspend__block_invoke;
  block[3] = &unk_265378638;
  block[4] = v4;
  dispatch_async(v7, block);
}

void __33__HMMTRControllerWrapper_suspend__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setCachedDeviceControllerShouldResume:0];
  id v2 = [*(id *)(a1 + 32) cachedDeviceController];
  id v3 = [v2 controllerNodeID];

  v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Suspending Matter controller with Node ID %@", (uint8_t *)&v9, 0x16u);
  }
  v8 = [*(id *)(a1 + 32) cachedDeviceController];
  [v8 suspend];

  [*(id *)(a1 + 32) _revokeAvailable:0];
}

- (void)suspendOrShutdown
{
  if ([(HMMTRControllerWrapper *)self isRVCEnabled])
  {
    [(HMMTRControllerWrapper *)self suspend];
  }
  else
  {
    [(HMMTRControllerWrapper *)self shutdown];
  }
}

- (void)resume
{
  if ([(HMMTRControllerWrapper *)self isRVCEnabled])
  {
    id v3 = [(HMMTRControllerWrapper *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__HMMTRControllerWrapper_resume__block_invoke;
    block[3] = &unk_265378638;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

void __32__HMMTRControllerWrapper_resume__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setCachedDeviceControllerShouldResume:1];
  id v2 = [*(id *)(a1 + 32) cachedDeviceController];
  int v3 = [v2 isSuspended];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) cachedDeviceController];
    id v5 = [v4 controllerNodeID];

    id v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = *(id *)(a1 + 32);
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Resuming Matter controller with Node ID %@", (uint8_t *)&v11, 0x16u);
    }
    id v10 = [*(id *)(a1 + 32) cachedDeviceController];
    [v10 resume];

    [*(id *)(a1 + 32) _revokeAvailable:1];
  }
}

- (void)replaceStartupParams:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v16 = v8;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Replacing startup params", buf, 0xCu);
  }
  int v9 = [(HMMTRControllerWrapper *)v6 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HMMTRControllerWrapper_replaceStartupParams___block_invoke;
  block[3] = &unk_265376E98;
  block[4] = v6;
  id v14 = v4;
  id v10 = v4;
  dispatch_sync(v9, block);

  int v11 = [(HMMTRControllerWrapper *)v6 workQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__HMMTRControllerWrapper_replaceStartupParams___block_invoke_91;
  v12[3] = &unk_265378638;
  v12[4] = v6;
  dispatch_async(v11, v12);
}

void __47__HMMTRControllerWrapper_replaceStartupParams___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) cachedDeviceController];
    id v7 = [v6 controllerNodeID];
    int v18 = 138543618;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Shutting down Matter controller with Node ID %@", (uint8_t *)&v18, 0x16u);
  }
  v8 = [MEMORY[0x263F54020] sharedInstance];
  int v9 = [*(id *)(a1 + 32) cachedDeviceController];
  [v8 removeDeviceController:v9];

  id v10 = [*(id *)(a1 + 32) cachedDeviceController];
  [v10 shutdown];

  [*(id *)(a1 + 32) setCachedDeviceController:0];
  uint64_t v11 = [*(id *)(a1 + 40) copy];
  uint64_t v12 = *(void *)(a1 + 32);
  __int16 v13 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v11;

  id v14 = (void *)MEMORY[0x2533B64D0]();
  id v15 = *(id *)(a1 + 32);
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    int v18 = 138543362;
    uint64_t v19 = v17;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Replaced startup params", (uint8_t *)&v18, 0xCu);
  }
}

uint64_t __47__HMMTRControllerWrapper_replaceStartupParams___block_invoke_91(uint64_t a1)
{
  return [*(id *)(a1 + 32) _revokeAvailable:1];
}

- (void)remove
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing", buf, 0xCu);
  }
  id v7 = [(HMMTRControllerWrapper *)v4 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HMMTRControllerWrapper_remove__block_invoke;
  block[3] = &unk_265378638;
  block[4] = v4;
  dispatch_async(v7, block);
}

void __32__HMMTRControllerWrapper_remove__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) cachedDeviceController];
  id v3 = [v2 controllerNodeID];

  id v4 = [MEMORY[0x263F54020] sharedInstance];
  id v5 = [*(id *)(a1 + 32) cachedDeviceController];
  [v4 removeDeviceController:v5];

  id v6 = [*(id *)(a1 + 32) cachedDeviceController];
  [v6 shutdown];

  [*(id *)(a1 + 32) setCachedDeviceController:0];
  id v7 = [*(id *)(a1 + 32) factory];
  [v7 _removeGetter:*(void *)(a1 + 32)];

  v8 = (void *)MEMORY[0x2533B64D0]([*(id *)(a1 + 32) setFactory:0]);
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    __int16 v13 = v11;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Removed by Shutting down Matter controller with Node ID %@", (uint8_t *)&v12, 0x16u);
  }
}

- (MTRDeviceController)controller
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Obtaining device controller", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__2964;
  v23 = __Block_byref_object_dispose__2965;
  id v24 = 0;
  id v7 = [(HMMTRControllerWrapper *)v4 workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __36__HMMTRControllerWrapper_controller__block_invoke;
  v15[3] = &unk_265377F28;
  v15[4] = v4;
  v15[5] = &buf;
  dispatch_sync(v7, v15);

  v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = v4;
  HMFGetOSLogHandle();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)uint64_t v16 = 138543618;
    uint64_t v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Obtained device controller: %p", v16, 0x16u);
  }
  id v13 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return (MTRDeviceController *)v13;
}

uint64_t __36__HMMTRControllerWrapper_controller__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachedDeviceController];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v3 cachedDeviceController];
  }
  else
  {
    [v3 factory];
    uint64_t v4 = [(id)objc_claimAutoreleasedReturnValue() _createControllerForGetter:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  return MEMORY[0x270F9A758]();
}

- (HMMTRControllerParameters)startupParams
{
  return self->_startupParams;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12 != -1) {
    dispatch_once(&logCategory__hmf_once_t12, &__block_literal_global_3047);
  }
  id v2 = (void *)logCategory__hmf_once_v13;
  return v2;
}

uint64_t __37__HMMTRControllerWrapper_logCategory__block_invoke()
{
  logCategory__hmf_once_id v13 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end