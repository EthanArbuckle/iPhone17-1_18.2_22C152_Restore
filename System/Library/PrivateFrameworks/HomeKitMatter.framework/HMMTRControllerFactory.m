@interface HMMTRControllerFactory
+ (id)factoryParamsWithCommonStorage;
+ (id)logCategory;
- (BOOL)enabled;
- (BOOL)factoryOperationEnabled;
- (BOOL)matterFactoryRunning;
- (BOOL)usesCommonStorage;
- (HMMTRControllerFactory)initWithWorkQueue:(id)a3 factoryParams:(id)a4;
- (HMMTRControllerFactoryStorage)storage;
- (MTRDeviceControllerFactoryParams)factoryParams;
- (NSMutableArray)controllerWrappers;
- (NSMutableSet)disablingTokens;
- (OS_dispatch_queue)workQueue;
- (id)_createControllerForGetter:(id)a3;
- (id)_createControllerUsingCommonStorageWithStartupParams:(id)a3;
- (id)_createControllerUsingOwnStorageWithStartupParams:(id)a3;
- (id)_createControllerWithStartupParams:(id)a3;
- (id)disableNormalOperation;
- (id)sharedDeviceControllerFactory;
- (id)stackStorageWithStartupParams:(id)a3 operationalKeyPairTLV:(id)a4;
- (id)wrapperWithName:(id)a3 startupParams:(id)a4 entityIdentifier:(id)a5;
- (void)_removeGetter:(id)a3;
- (void)_restartMatterControllerFactory;
- (void)_revokeAvailable:(BOOL)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)enableNormalOperationWithToken:(id)a3;
- (void)setFactoryOperationEnabled:(BOOL)a3;
- (void)setMatterFactoryRunning:(BOOL)a3;
@end

@implementation HMMTRControllerFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disablingTokens, 0);
  objc_storeStrong((id *)&self->_controllerWrappers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_factoryParams, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (NSMutableSet)disablingTokens
{
  return self->_disablingTokens;
}

- (void)setFactoryOperationEnabled:(BOOL)a3
{
  self->_factoryOperationEnabled = a3;
}

- (BOOL)factoryOperationEnabled
{
  return self->_factoryOperationEnabled;
}

- (NSMutableArray)controllerWrappers
{
  return self->_controllerWrappers;
}

- (void)setMatterFactoryRunning:(BOOL)a3
{
  self->_matterFactoryRunning = a3;
}

- (BOOL)matterFactoryRunning
{
  return self->_matterFactoryRunning;
}

- (HMMTRControllerFactoryStorage)storage
{
  return self->_storage;
}

- (MTRDeviceControllerFactoryParams)factoryParams
{
  return self->_factoryParams;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)usesCommonStorage
{
  return self->_usesCommonStorage;
}

- (void)_revokeAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(HMMTRControllerFactory *)self controllerWrappers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        v10 = [MEMORY[0x263F54020] sharedInstance];
        v11 = [v9 cachedDeviceController];
        [v10 removeDeviceController:v11];

        v12 = [v9 cachedDeviceController];
        [v12 shutdown];

        [v9 setCachedDeviceController:0];
        [v9 _revokeAvailable:v3];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)_createControllerUsingOwnStorageWithStartupParams:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 controllerParams2];
  uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 fabricID];
    *(_DWORD *)buf = 138543618;
    v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Creating controller that uses own storage for fabric ID: %@", buf, 0x16u);
  }
  id v18 = 0;
  v11 = (void *)[objc_alloc(MEMORY[0x263F10DB0]) initWithParameters:v5 error:&v18];
  id v12 = v18;
  if (!v11)
  {
    long long v13 = (void *)MEMORY[0x2533B64D0]();
    long long v14 = v7;
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create controller: %@", buf, 0x16u);
    }
  }

  return v11;
}

- (id)_createControllerUsingCommonStorageWithStartupParams:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 controllerParams];
  uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 fabricID];
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Creating controller that uses common storage for fabric ID: %@", buf, 0x16u);
  }
  v11 = [(HMMTRControllerFactory *)v7 sharedDeviceControllerFactory];
  id v22 = 0;
  id v12 = [v11 createControllerOnExistingFabric:v5 error:&v22];
  id v13 = v22;
  long long v14 = v13;
  if (v12)
  {
    id v15 = v13;
  }
  else
  {
    id v21 = v13;
    id v12 = [v11 createControllerOnNewFabric:v5 error:&v21];
    id v15 = v21;

    if (!v12)
    {
      long long v16 = (void *)MEMORY[0x2533B64D0]();
      v17 = v7;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v24 = v19;
        __int16 v25 = 2112;
        id v26 = v15;
        _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to create controller: %@", buf, 0x16u);
      }
      id v12 = 0;
    }
  }

  return v12;
}

- (id)_createControllerWithStartupParams:(id)a3
{
  id v4 = a3;
  if ([v4 usesCommonStorageDelegate]) {
    [(HMMTRControllerFactory *)self _createControllerUsingCommonStorageWithStartupParams:v4];
  }
  else {
  uint64_t v5 = [(HMMTRControllerFactory *)self _createControllerUsingOwnStorageWithStartupParams:v4];
  }

  return v5;
}

- (void)_removeGetter:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing controller wrapper: %@", (uint8_t *)&v12, 0x16u);
  }
  v9 = [(HMMTRControllerFactory *)v6 controllerWrappers];
  [v9 removeObject:v4];

  v10 = [(HMMTRControllerFactory *)v6 controllerWrappers];
  uint64_t v11 = [v10 count];

  if (!v11) {
    [(HMMTRControllerFactory *)v6 _restartMatterControllerFactory];
  }
}

- (id)_createControllerForGetter:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    v9 = HMFBooleanToString();
    int v42 = 138543874;
    v43 = v8;
    __int16 v44 = 2112;
    id v45 = v4;
    __int16 v46 = 2112;
    v47 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating controller for %@ in enabled state: %@", (uint8_t *)&v42, 0x20u);
  }
  if (v6->_enabled)
  {
    if (![(HMMTRControllerFactory *)v6 matterFactoryRunning]) {
      [(HMMTRControllerFactory *)v6 _restartMatterControllerFactory];
    }
    v10 = [v4 startupParams];
    uint64_t v11 = [(HMMTRControllerFactory *)v6 _createControllerWithStartupParams:v10];
    [v4 setCachedDeviceController:v11];

    int v12 = (void *)MEMORY[0x2533B64D0]();
    id v13 = v6;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      uint64_t v16 = [v4 name];
      v17 = [v4 cachedDeviceController];
      id v18 = [v17 controllerNodeID];
      v19 = [v4 startupParams];
      v20 = [v19 fabricID];
      int v42 = 138544130;
      v43 = v15;
      __int16 v44 = 2112;
      id v45 = v16;
      __int16 v46 = 2112;
      v47 = v18;
      __int16 v48 = 2112;
      v49 = v20;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Started Matter controller '%@' with Node ID %@ on fabric ID %@", (uint8_t *)&v42, 0x2Au);
    }
    id v21 = [v4 cachedDeviceController];

    if (v21)
    {
      id v22 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v23 = v13;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        __int16 v25 = HMFGetLogIdentifier();
        id v26 = [v4 entityIdentifier];
        int v42 = 138543618;
        v43 = v25;
        __int16 v44 = 2112;
        id v45 = v26;
        _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Registering new device controller entityIdentifier: %@", (uint8_t *)&v42, 0x16u);
      }
      uint64_t v27 = [MEMORY[0x263F54020] sharedInstance];
      char v28 = objc_opt_respondsToSelector();

      v29 = [MEMORY[0x263F54020] sharedInstance];
      v30 = [v4 cachedDeviceController];
      if (v28)
      {
        v31 = [v4 entityIdentifier];
        [v29 addDeviceController:v30 forEntityWithIdentifier:v31];
      }
      else
      {
        [v29 addDeviceController:v30];
      }

      if ([v4 cachedDeviceControllerShouldResume])
      {
        v33 = (void *)MEMORY[0x2533B64D0]();
        v34 = v23;
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = HMFGetLogIdentifier();
          v37 = [v4 cachedDeviceController];
          v38 = [v37 controllerNodeID];
          int v42 = 138543618;
          v43 = v36;
          __int16 v44 = 2112;
          id v45 = v38;
          _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_INFO, "%{public}@Resuming Matter controller with Node ID %@", (uint8_t *)&v42, 0x16u);
        }
        v39 = [v4 cachedDeviceController];
        [v39 resume];
      }
      v40 = [MEMORY[0x263F54010] sharedInstance];
      [v40 start];
    }
    v32 = [v4 cachedDeviceController];
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (void)_restartMatterControllerFactory
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(HMMTRControllerFactory *)self usesCommonStorage])
  {
    BOOL v3 = (void *)MEMORY[0x2533B64D0]();
    id v4 = self;
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v6;
      _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Restarting controller factory", buf, 0xCu);
    }
    uint64_t v7 = [(HMMTRControllerFactory *)v4 sharedDeviceControllerFactory];
    [v7 stopControllerFactory];
    uint64_t v8 = [(HMMTRControllerFactory *)v4 storage];
    [v8 clear];

    v9 = [(HMMTRControllerFactory *)v4 factoryParams];
    id v16 = 0;
    char v10 = [v7 startControllerFactory:v9 error:&v16];
    id v11 = v16;

    if (v10)
    {
      [(HMMTRControllerFactory *)v4 setMatterFactoryRunning:1];
    }
    else
    {
      int v12 = (void *)MEMORY[0x2533B64D0]();
      id v13 = v4;
      __int16 v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v18 = v15;
        __int16 v19 = 2112;
        id v20 = v11;
        _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to start: %@", buf, 0x16u);
      }
    }
  }
}

- (id)sharedDeviceControllerFactory
{
  return (id)[MEMORY[0x263F10DC0] sharedInstance];
}

- (void)enableNormalOperationWithToken:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Enabling normal operation with token %@", buf, 0x16u);
  }
  id v11 = [(HMMTRControllerFactory *)v8 workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__HMMTRControllerFactory_enableNormalOperationWithToken___block_invoke;
  v13[3] = &unk_265376E98;
  v13[4] = v8;
  id v14 = v6;
  id v12 = v6;
  dispatch_async(v11, v13);
}

void __57__HMMTRControllerFactory_enableNormalOperationWithToken___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) disablingTokens];
  [v2 removeObject:*(void *)(a1 + 40)];

  BOOL v3 = [*(id *)(a1 + 32) disablingTokens];
  uint64_t v4 = [v3 count];

  if (!v4) {
    uint64_t v5 = [*(id *)(a1 + 32) _setEnabled:1];
  }
  id v6 = (void *)MEMORY[0x2533B64D0](v5);
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Voted normal operation with token %@", (uint8_t *)&v11, 0x16u);
  }
}

- (id)disableNormalOperation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Disabling normal operation with token %@", buf, 0x16u);
  }
  uint64_t v8 = [(HMMTRControllerFactory *)v5 workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__HMMTRControllerFactory_disableNormalOperation__block_invoke;
  v13[3] = &unk_265376E98;
  v13[4] = v5;
  id v9 = v3;
  id v14 = v9;
  dispatch_async(v8, v13);

  uint64_t v10 = v14;
  id v11 = v9;

  return v11;
}

void __48__HMMTRControllerFactory_disableNormalOperation__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) disablingTokens];
  [v2 addObject:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x2533B64D0]([*(id *)(a1 + 32) _setEnabled:0]);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Disabled normal operation with token %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)stackStorageWithStartupParams:(id)a3 operationalKeyPairTLV:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Dumping stack storage for params: %@", buf, 0x16u);
  }
  uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 v13 = [v6 ipk];
  [v12 setObject:v13 forKeyedSubscript:@"IPK"];

  id v14 = (void *)MEMORY[0x263F10CC0];
  uint64_t v15 = [v6 rootCertificate];
  id v16 = [v14 convertX509Certificate:v15];
  [v12 setObject:v16 forKeyedSubscript:@"f/1/r"];

  __int16 v17 = (void *)MEMORY[0x263F10CC0];
  id v18 = [v6 operationalCertificate];
  uint64_t v19 = [v17 convertX509Certificate:v18];
  [v12 setObject:v19 forKeyedSubscript:@"f/1/n"];

  uint64_t v26 = 0x12C1384002515;
  char v27 = 24;
  id v20 = [v6 vendorID];
  LOWORD(v18) = [v20 unsignedShortValue];

  *(_WORD *)((char *)&v26 + 3) = (_WORD)v18;
  uint64_t v21 = [MEMORY[0x263EFF8F8] dataWithBytes:&v26 length:9];
  [v12 setObject:v21 forKeyedSubscript:@"f/1/m"];

  [v12 setObject:v7 forKeyedSubscript:@"f/1/o"];
  *(void *)buf = 0x104013602002415;
  *(_WORD *)&buf[8] = 6168;
  id v22 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:10];
  [v12 setObject:v22 forKeyedSubscript:@"g/fidx"];

  uint64_t v25 = 0x1829625600002615;
  uint64_t v23 = [MEMORY[0x263EFF8F8] dataWithBytes:&v25 length:8];
  [v12 setObject:v23 forKeyedSubscript:@"g/lkgt"];

  return v12;
}

- (id)wrapperWithName:(id)a3 startupParams:(id)a4 entityIdentifier:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [HMMTRControllerWrapper alloc];
  uint64_t v12 = [(HMMTRControllerFactory *)self workQueue];
  __int16 v13 = [(HMMTRControllerWrapper *)v11 initWithWorkQueue:v12 factory:self startupParams:v9 name:v8 entityIdentifier:v10];

  id v14 = [(HMMTRControllerFactory *)self workQueue];
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  uint64_t v31 = __73__HMMTRControllerFactory_wrapperWithName_startupParams_entityIdentifier___block_invoke;
  v32 = &unk_265376E98;
  v33 = self;
  uint64_t v15 = v13;
  v34 = v15;
  dispatch_sync(v14, &v29);

  uint64_t v21 = (void *)MEMORY[0x2533B64D0](v16, v17, v18, v19, v20);
  id v22 = self;
  uint64_t v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = HMFGetLogIdentifier();
    uint64_t v25 = objc_msgSend(v9, "fabricID", v29, v30, v31, v32, v33);
    *(_DWORD *)buf = 138543874;
    v36 = v24;
    __int16 v37 = 2112;
    v38 = v15;
    __int16 v39 = 2112;
    v40 = v25;
    _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@New controller wrapper %@ for fabric ID %@", buf, 0x20u);
  }
  uint64_t v26 = v34;
  char v27 = v15;

  return v27;
}

void __73__HMMTRControllerFactory_wrapperWithName_startupParams_entityIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controllerWrappers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (HMMTRControllerFactory)initWithWorkQueue:(id)a3 factoryParams:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HMMTRControllerFactory;
  id v9 = [(HMMTRControllerFactory *)&v25 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    if (v8)
    {
      uint64_t v11 = objc_alloc_init(HMMTRControllerFactoryStorage);
      storage = v10->_storage;
      v10->_storage = v11;

      uint64_t v13 = [objc_alloc(MEMORY[0x263F10DC8]) initWithStorage:v10->_storage];
      factoryParams = v10->_factoryParams;
      v10->_factoryParams = (MTRDeviceControllerFactoryParams *)v13;

      uint64_t v15 = [v8 otaProviderDelegate];
      [(MTRDeviceControllerFactoryParams *)v10->_factoryParams setOtaProviderDelegate:v15];

      uint64_t v16 = [v8 productAttestationAuthorityCertificates];
      [(MTRDeviceControllerFactoryParams *)v10->_factoryParams setProductAttestationAuthorityCertificates:v16];

      uint64_t v17 = [v8 certificationDeclarationCertificates];
      [(MTRDeviceControllerFactoryParams *)v10->_factoryParams setCertificationDeclarationCertificates:v17];

      uint64_t v18 = [v8 port];
      [(MTRDeviceControllerFactoryParams *)v10->_factoryParams setPort:v18];

      -[MTRDeviceControllerFactoryParams setShouldStartServer:](v10->_factoryParams, "setShouldStartServer:", [v8 shouldStartServer]);
      char v19 = 1;
    }
    else
    {
      char v19 = 0;
    }
    v10->_usesCommonStorage = v19;
    uint64_t v20 = [MEMORY[0x263EFF980] array];
    controllerWrappers = v10->_controllerWrappers;
    v10->_controllerWrappers = (NSMutableArray *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9C0] set];
    disablingTokens = v10->_disablingTokens;
    v10->_disablingTokens = (NSMutableSet *)v22;

    v10->_enabled = 1;
  }

  return v10;
}

- (BOOL)enabled
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(HMMTRControllerFactory *)self workQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__HMMTRControllerFactory_enabled__block_invoke;
  v5[3] = &unk_265377F28;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __33__HMMTRControllerFactory_enabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)_setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x2533B64D0](self, a2);
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    char v9 = HMFBooleanToString();
    id v10 = HMFBooleanToString();
    int v12 = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@enabled: %@ -> %@", (uint8_t *)&v12, 0x20u);
  }
  if (v6->_enabled != v3)
  {
    v6->_enabled = v3;
    [(HMMTRControllerFactory *)v6 _revokeAvailable:v3];
    if (!v3)
    {
      if ([(HMMTRControllerFactory *)v6 usesCommonStorage])
      {
        uint64_t v11 = [(HMMTRControllerFactory *)v6 sharedDeviceControllerFactory];
        [v11 stopControllerFactory];
        [(HMMTRControllerFactory *)v6 setMatterFactoryRunning:0];
      }
    }
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33 != -1) {
    dispatch_once(&logCategory__hmf_once_t33, &__block_literal_global_211);
  }
  id v2 = (void *)logCategory__hmf_once_v34;
  return v2;
}

uint64_t __37__HMMTRControllerFactory_logCategory__block_invoke()
{
  logCategory__hmf_once_v34 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

+ (id)factoryParamsWithCommonStorage
{
  id v2 = objc_alloc(MEMORY[0x263F10DC8]);
  BOOL v3 = objc_alloc_init(HMMTRControllerFactoryStorage);
  id v4 = (void *)[v2 initWithStorage:v3];

  return v4;
}

@end