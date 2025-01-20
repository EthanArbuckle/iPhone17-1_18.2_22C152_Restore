@interface HMDLaunchHandler
+ (HMDLaunchHandler)sharedHandler;
+ (id)logCategory;
- (HMDFileManager)fileManager;
- (HMDLaunchHandler)init;
- (HMDLaunchHandler)initWithRelaunchPlistFileURL:(id)a3 fileManager:(id)a4 jetsamPriorityHandler:(id)a5;
- (NSMutableSet)registeredRelaunchClients;
- (NSURL)relaunchPlistFileURL;
- (OS_dispatch_queue)handlerQueue;
- (id)jetsamPriorityHandler;
- (void)_setJetsamPriorityElevated:(BOOL)a3;
- (void)_updateOrRemoveRelaunchPlist;
- (void)deregisterRelaunchClientWithUUID:(id)a3;
- (void)registerRelaunchClientWithUUID:(id)a3;
- (void)removePersistentRelaunchRegistrationsIfNecessary;
@end

@implementation HMDLaunchHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredRelaunchClients, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong(&self->_jetsamPriorityHandler, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_relaunchPlistFileURL, 0);
}

- (NSMutableSet)registeredRelaunchClients
{
  return self->_registeredRelaunchClients;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (id)jetsamPriorityHandler
{
  return self->_jetsamPriorityHandler;
}

- (HMDFileManager)fileManager
{
  return self->_fileManager;
}

- (NSURL)relaunchPlistFileURL
{
  return self->_relaunchPlistFileURL;
}

- (void)_setJetsamPriorityElevated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = [(HMDLaunchHandler *)self handlerQueue];
  dispatch_assert_queue_V2(v5);

  if (v3) {
    uint64_t v6 = 14;
  }
  else {
    uint64_t v6 = 15;
  }
  v7 = [(HMDLaunchHandler *)self jetsamPriorityHandler];
  int v8 = v7[2](v7, v6);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      v14 = HMFBooleanToString();
      int v17 = 138543874;
      v18 = v13;
      __int16 v19 = 2112;
      v20 = v14;
      __int16 v21 = 1024;
      int v22 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to set jetsam priority elevated to %@: %d", (uint8_t *)&v17, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v15 = HMFGetLogIdentifier();
    v16 = HMFBooleanToString();
    int v17 = 138543618;
    v18 = v15;
    __int16 v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully set jetsam priority elevated to %@", (uint8_t *)&v17, 0x16u);
  }
}

- (void)_updateOrRemoveRelaunchPlist
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDLaunchHandler *)self handlerQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HMDLaunchHandler *)self registeredRelaunchClients];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    uint64_t v23 = [(HMDLaunchHandler *)self fileManager];
    v24 = [(HMDLaunchHandler *)self relaunchPlistFileURL];
    int v25 = [v23 fileExistsAtURL:v24];

    if (!v25) {
      return;
    }
    v26 = [(HMDLaunchHandler *)self fileManager];
    v27 = [(HMDLaunchHandler *)self relaunchPlistFileURL];
    id v40 = 0;
    int v28 = [v26 removeItemAtURL:v27 error:&v40];
    id v8 = v40;

    v29 = (void *)MEMORY[0x230FBD990]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    v32 = v31;
    if (v28)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v33 = HMFGetLogIdentifier();
        v34 = [(HMDLaunchHandler *)v30 relaunchPlistFileURL];
        *(_DWORD *)buf = 138543618;
        v44 = v33;
        __int16 v45 = 2112;
        v46 = v34;
        v35 = "%{public}@Successfully removed relaunch plist file at %@";
        v36 = v32;
        os_log_type_t v37 = OS_LOG_TYPE_INFO;
        uint32_t v38 = 22;
LABEL_15:
        _os_log_impl(&dword_22F52A000, v36, v37, v35, buf, v38);
      }
    }
    else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v33 = HMFGetLogIdentifier();
      v34 = [(HMDLaunchHandler *)v30 relaunchPlistFileURL];
      *(_DWORD *)buf = 138543874;
      v44 = v33;
      __int16 v45 = 2112;
      v46 = v34;
      __int16 v47 = 2112;
      id v48 = v8;
      v35 = "%{public}@Failed to remove relaunch plist file at %@: %@";
      v36 = v32;
      os_log_type_t v37 = OS_LOG_TYPE_ERROR;
      uint32_t v38 = 32;
      goto LABEL_15;
    }

    goto LABEL_17;
  }
  v41 = @"KeepAliveClients";
  uint64_t v6 = [(HMDLaunchHandler *)self registeredRelaunchClients];
  v7 = [v6 allObjects];
  v42 = v7;
  id v8 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];

  v9 = [(HMDLaunchHandler *)self fileManager];
  v10 = [(HMDLaunchHandler *)self relaunchPlistFileURL];
  id v39 = 0;
  int v11 = [v9 writeDictionary:v8 toURL:v10 error:&v39];
  id v12 = v39;

  v13 = (void *)MEMORY[0x230FBD990]();
  v14 = self;
  v15 = HMFGetOSLogHandle();
  v16 = v15;
  if (v11)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v17 = HMFGetLogIdentifier();
      v18 = [(HMDLaunchHandler *)v14 relaunchPlistFileURL];
      *(_DWORD *)buf = 138543618;
      v44 = v17;
      __int16 v45 = 2112;
      v46 = v18;
      __int16 v19 = "%{public}@Successfully wrote relaunch plist file at %@";
      v20 = v16;
      os_log_type_t v21 = OS_LOG_TYPE_INFO;
      uint32_t v22 = 22;
LABEL_11:
      _os_log_impl(&dword_22F52A000, v20, v21, v19, buf, v22);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v17 = HMFGetLogIdentifier();
    v18 = [(HMDLaunchHandler *)v14 relaunchPlistFileURL];
    *(_DWORD *)buf = 138543874;
    v44 = v17;
    __int16 v45 = 2112;
    v46 = v18;
    __int16 v47 = 2112;
    id v48 = v12;
    __int16 v19 = "%{public}@Failed to write relaunch plist file at %@: %@";
    v20 = v16;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    uint32_t v22 = 32;
    goto LABEL_11;
  }

LABEL_17:
}

- (void)deregisterRelaunchClientWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDLaunchHandler *)self handlerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HMDLaunchHandler_deregisterRelaunchClientWithUUID___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__HMDLaunchHandler_deregisterRelaunchClientWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v14 = 138543618;
    v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Deregistering client for relaunch: %@", (uint8_t *)&v14, 0x16u);
  }
  v7 = [*(id *)(a1 + 32) registeredRelaunchClients];
  id v8 = [*(id *)(a1 + 40) UUIDString];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    v10 = [*(id *)(a1 + 32) registeredRelaunchClients];
    int v11 = [*(id *)(a1 + 40) UUIDString];
    [v10 removeObject:v11];

    [*(id *)(a1 + 32) _updateOrRemoveRelaunchPlist];
    id v12 = [*(id *)(a1 + 32) registeredRelaunchClients];
    uint64_t v13 = [v12 count];

    if (!v13) {
      [*(id *)(a1 + 32) _setJetsamPriorityElevated:0];
    }
  }
}

- (void)registerRelaunchClientWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDLaunchHandler *)self handlerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HMDLaunchHandler_registerRelaunchClientWithUUID___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __51__HMDLaunchHandler_registerRelaunchClientWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v14 = 138543618;
    v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Registering client for relaunch: %@", (uint8_t *)&v14, 0x16u);
  }
  v7 = [*(id *)(a1 + 32) registeredRelaunchClients];
  id v8 = [*(id *)(a1 + 40) UUIDString];
  char v9 = [v7 containsObject:v8];

  if ((v9 & 1) == 0)
  {
    v10 = [*(id *)(a1 + 32) registeredRelaunchClients];
    int v11 = [*(id *)(a1 + 40) UUIDString];
    [v10 addObject:v11];

    [*(id *)(a1 + 32) _updateOrRemoveRelaunchPlist];
    id v12 = [*(id *)(a1 + 32) registeredRelaunchClients];
    uint64_t v13 = [v12 count];

    if (v13 == 1) {
      [*(id *)(a1 + 32) _setJetsamPriorityElevated:1];
    }
  }
}

- (void)removePersistentRelaunchRegistrationsIfNecessary
{
  id v3 = [(HMDLaunchHandler *)self handlerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMDLaunchHandler_removePersistentRelaunchRegistrationsIfNecessary__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __68__HMDLaunchHandler_removePersistentRelaunchRegistrationsIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    char v9 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Removing persistent relaunch registrations if necessary", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 32) registeredRelaunchClients];
  uint64_t v7 = [v6 count];

  if (!v7) {
    [*(id *)(a1 + 32) _updateOrRemoveRelaunchPlist];
  }
}

- (HMDLaunchHandler)initWithRelaunchPlistFileURL:(id)a3 fileManager:(id)a4 jetsamPriorityHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDLaunchHandler;
  int v11 = [(HMDLaunchHandler *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    relaunchPlistFileURL = v11->_relaunchPlistFileURL;
    v11->_relaunchPlistFileURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_fileManager, a4);
    int v14 = _Block_copy(v10);
    id jetsamPriorityHandler = v11->_jetsamPriorityHandler;
    v11->_id jetsamPriorityHandler = v14;

    __int16 v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.homed.HMDLaunchHandler", v16);
    handlerQueue = v11->_handlerQueue;
    v11->_handlerQueue = (OS_dispatch_queue *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9C0] set];
    registeredRelaunchClients = v11->_registeredRelaunchClients;
    v11->_registeredRelaunchClients = (NSMutableSet *)v19;
  }
  return v11;
}

- (HMDLaunchHandler)init
{
  id v3 = NSURL;
  id v4 = (id)launchdAssertionPlistPath;
  uint64_t v5 = [v3 fileURLWithPath:v4];

  uint64_t v6 = objc_alloc_init(HMDFileManager);
  uint64_t v7 = [(HMDLaunchHandler *)self initWithRelaunchPlistFileURL:v5 fileManager:v6 jetsamPriorityHandler:&__block_literal_global_185349];

  return v7;
}

uint64_t __24__HMDLaunchHandler_init__block_invoke()
{
  getpid();
  return memorystatus_control();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_185358 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_185358, &__block_literal_global_8_185359);
  }
  v2 = (void *)logCategory__hmf_once_v10_185360;
  return v2;
}

void __31__HMDLaunchHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_185360;
  logCategory__hmf_once_v10_185360 = v0;
}

+ (HMDLaunchHandler)sharedHandler
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HMDLaunchHandler_sharedHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHandler_onceToken_185365 != -1) {
    dispatch_once(&sharedHandler_onceToken_185365, block);
  }
  v2 = (void *)sharedHandler_sharedHandler;
  return (HMDLaunchHandler *)v2;
}

void __33__HMDLaunchHandler_sharedHandler__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedHandler_sharedHandler;
  sharedHandler_sharedHandler = (uint64_t)v1;
}

@end