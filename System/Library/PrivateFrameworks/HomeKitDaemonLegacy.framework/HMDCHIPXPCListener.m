@interface HMDCHIPXPCListener
+ (id)logCategory;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (HMDCHIPXPCListener)initWithHomeManager:(id)a3;
- (HMDHomeManager)homeManager;
- (HMDProcessMonitor)processMonitor;
- (NSMutableSet)mutableConnections;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (NSXPCListener)listener;
- (OS_dispatch_queue)processMonitorQueue;
- (OS_dispatch_queue)workQueue;
- (id)createClientConnectionWithRemoteObjectProxy:(id)a3 homeManager:(id)a4 connection:(id)a5 backgroundModeEntitled:(BOOL)a6;
- (void)start;
- (void)stop;
@end

@implementation HMDCHIPXPCListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableConnections, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_processMonitorQueue, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (NSMutableSet)mutableConnections
{
  return self->_mutableConnections;
}

- (HMDProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (OS_dispatch_queue)processMonitorQueue
{
  return self->_processMonitorQueue;
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v48 = v11;
    __int16 v49 = 2112;
    id v50 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@New CHIP XPC connection requested: %@", buf, 0x16u);
  }
  if (v7)
  {
    [v7 auditToken];
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
  }
  if (TCCAccessCheckAuditToken())
  {
    v12 = [v7 valueForEntitlement:@"com.apple.developer.homekit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    char v15 = [v14 BOOLValue];
    if (v15)
    {
      v16 = [v7 valueForEntitlement:@"com.apple.developer.homekit.background-mode"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
      id v18 = v17;

      uint64_t v19 = [v18 BOOLValue];
      v20 = (void *)MEMORY[0x1D9452090]();
      v21 = v9;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = HMFGetLogIdentifier();
        v24 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        v48 = v23;
        __int16 v49 = 2112;
        id v50 = v24;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@XPC connect entitlement for background mode: %@", buf, 0x16u);
      }
      v25 = [(os_unfair_lock_s *)v21 exportedInterface];
      [v7 setExportedInterface:v25];

      v26 = [(os_unfair_lock_s *)v21 remoteObjectInterface];
      [v7 setRemoteObjectInterface:v26];

      LODWORD(v26) = [v7 processIdentifier];
      v27 = [v7 remoteObjectProxy];
      v28 = [(os_unfair_lock_s *)v21 homeManager];
      v29 = [(os_unfair_lock_s *)v21 createClientConnectionWithRemoteObjectProxy:v27 homeManager:v28 connection:v7 backgroundModeEntitled:v19];

      os_unfair_lock_lock_with_options();
      v30 = [(os_unfair_lock_s *)v21 mutableConnections];
      [v30 addObject:v29];

      os_unfair_lock_unlock(v21 + 2);
      [v7 setExportedObject:v29];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __57__HMDCHIPXPCListener_listener_shouldAcceptNewConnection___block_invoke;
      v42[3] = &unk_1E6A054E0;
      int v44 = (int)v26;
      v42[4] = v21;
      id v43 = v29;
      id v31 = v29;
      [v7 setInvalidationHandler:v42];
      v32 = [(os_unfair_lock_s *)v21 workQueue];
      [v7 _setQueue:v32];

      [v7 resume];
    }
    else
    {
      v37 = (void *)MEMORY[0x1D9452090]();
      v38 = v9;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v48 = v40;
        __int16 v49 = 2112;
        id v50 = v7;
        _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@XPC connection does not have public HomeKit entitlement: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v33 = (void *)MEMORY[0x1D9452090]();
    v34 = v9;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v48 = v36;
      __int16 v49 = 2112;
      id v50 = v7;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@XPC connection has no permission to access Home data: %@", buf, 0x16u);
    }
    char v15 = 0;
  }

  return v15;
}

void __57__HMDCHIPXPCListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    id v18 = v5;
    __int16 v19 = 1024;
    int v20 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@CHIP XPC client invalidated: %d", buf, 0x12u);
  }
  [*(id *)(a1 + 40) deregisterReportHandlers];
  id v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v8 = [*(id *)(a1 + 32) mutableConnections];
  [v8 removeObject:*(void *)(a1 + 40)];

  os_unfair_lock_unlock(v7);
  v9 = [*(id *)(a1 + 40) processInfo];
  v10 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v11 = [*(id *)(a1 + 32) mutableConnections];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__HMDCHIPXPCListener_listener_shouldAcceptNewConnection___block_invoke_89;
  v15[3] = &unk_1E6A054B8;
  id v12 = v9;
  id v16 = v12;
  char v13 = objc_msgSend(v11, "na_any:", v15);

  os_unfair_lock_unlock(v10);
  if ((v13 & 1) == 0 && ([v12 shouldMonitor] & 1) == 0)
  {
    id v14 = [*(id *)(a1 + 32) processMonitor];
    [v14 removeProcess:v12];
  }
}

BOOL __57__HMDCHIPXPCListener_listener_shouldAcceptNewConnection___block_invoke_89(uint64_t a1, void *a2)
{
  id v3 = [a2 processInfo];
  int v4 = [v3 identifier];
  BOOL v5 = v4 == [*(id *)(a1 + 32) identifier];

  return v5;
}

- (id)createClientConnectionWithRemoteObjectProxy:(id)a3 homeManager:(id)a4 connection:(id)a5 backgroundModeEntitled:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a3;
  v11 = [(HMDCHIPXPCListener *)self processMonitor];
  id v12 = [[HMDXPCConnection alloc] initWithXPCConnection:v9];
  char v13 = [v11 processInfoForXPCConnection:v12];

  id v14 = [HMDCHIPXPCClientConnection alloc];
  char v15 = [(HMDCHIPXPCListener *)self homeManager];
  uint64_t v16 = [v9 processIdentifier];

  v17 = [(HMDCHIPXPCListener *)self workQueue];
  id v18 = [(HMDCHIPXPCClientConnection *)v14 initWithRemoteObjectProxy:v10 homeManager:v15 pid:v16 processInfo:v13 backgroundModeEntitled:v6 workQueue:v17];

  return v18;
}

- (void)stop
{
  id v2 = [(HMDCHIPXPCListener *)self listener];
  [v2 suspend];
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  int v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    BOOL v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Starting CHIP XPC listener", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMDCHIPXPCListener *)v4 listener];
  [v7 resume];
}

- (HMDCHIPXPCListener)initWithHomeManager:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HMDCHIPXPCListener;
  BOOL v5 = [(HMDCHIPXPCListener *)&v29 init];
  BOOL v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    HMDispatchQueueNameString();
    id v7 = objc_claimAutoreleasedReturnValue();
    int v8 = (const char *)[v7 UTF8String];
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v13 = [v12 initWithMachServiceName:*MEMORY[0x1E4F2E4A8]];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v13;

    [(NSXPCListener *)v6->_listener _setQueue:v6->_workQueue];
    [(NSXPCListener *)v6->_listener setDelegate:v6];
    uint64_t v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2E35BE0];
    exportedInterface = v6->_exportedInterface;
    v6->_exportedInterface = (NSXPCInterface *)v15;

    uint64_t v17 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2F0B170];
    remoteObjectInterface = v6->_remoteObjectInterface;
    v6->_remoteObjectInterface = (NSXPCInterface *)v17;

    objc_storeWeak((id *)&v6->_homeManager, v4);
    HMDispatchQueueNameString();
    id v19 = objc_claimAutoreleasedReturnValue();
    int v20 = (const char *)[v19 UTF8String];
    uint64_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create(v20, v21);
    processMonitorQueue = v6->_processMonitorQueue;
    v6->_processMonitorQueue = (OS_dispatch_queue *)v22;

    v24 = [[HMDProcessMonitor alloc] initWithQueue:v6->_processMonitorQueue];
    processMonitor = v6->_processMonitor;
    v6->_processMonitor = v24;

    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mutableConnections = v6->_mutableConnections;
    v6->_mutableConnections = v26;
  }
  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11 != -1) {
    dispatch_once(&logCategory__hmf_once_t11, &__block_literal_global_2122);
  }
  id v2 = (void *)logCategory__hmf_once_v12;
  return v2;
}

uint64_t __33__HMDCHIPXPCListener_logCategory__block_invoke()
{
  logCategory__hmf_once_id v12 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end