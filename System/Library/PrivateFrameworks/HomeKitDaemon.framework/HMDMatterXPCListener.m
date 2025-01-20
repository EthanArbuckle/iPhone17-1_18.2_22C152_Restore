@interface HMDMatterXPCListener
+ (id)logCategory;
- (BOOL)connection:(id)a3 allowsOperationWithHome:(id)a4 operationType:(int64_t)a5 nodeId:(id)a6 commandId:(id)a7 endpointId:(id)a8 clusterId:(id)a9 attributeId:(id)a10;
- (BOOL)connection:(id)a3 sendMessagePayloadToPrimaryResident:(id)a4 responseHandler:(id)a5 error:(id *)a6;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)sendMessage:(id)a3 homeUUID:(id)a4 error:(id *)a5;
- (HMDHomeManager)homeManager;
- (HMDMatterXPCListener)initWithHomeManager:(id)a3;
- (HMDProcessMonitor)processMonitor;
- (NSMutableSet)mutableConnections;
- (NSXPCListener)listener;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)processMonitorQueue;
- (OS_dispatch_queue)workQueue;
- (id)_homeForUUID:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDMatterXPCListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableConnections, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_processMonitorQueue, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
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

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (BOOL)sendMessage:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(HMDMatterXPCListener *)self _homeForUUID:v9];
  v11 = v10;
  if (!v10)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    v14 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_13:
      BOOL v16 = 0;
      goto LABEL_14;
    }
    v18 = HMFGetLogIdentifier();
    int v24 = 138543362;
    v25 = v18;
    v19 = "%{public}@MTRPluginClientConnection sendMessage: supplied an invalid home, failing to send message";
    v20 = v14;
    uint32_t v21 = 12;
LABEL_12:
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v24, v21);

    goto LABEL_13;
  }
  if (![v10 _sendMatterHMFMessageRequest:v8])
  {
    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
    }
    v12 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    v14 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v18 = HMFGetLogIdentifier();
    int v24 = 138543874;
    v25 = v18;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    v19 = "%{public}@ *** MTRPluginClientConnection sendMessage: %@ homeUUID: %@  failed";
    v20 = v14;
    uint32_t v21 = 32;
    goto LABEL_12;
  }
  v12 = (void *)MEMORY[0x230FBD990]();
  v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = HMFGetLogIdentifier();
    int v24 = 138543874;
    v25 = v15;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@MTRPluginClientConnection sendMessage: %@ homeUUID: %@  succeeded", (uint8_t *)&v24, 0x20u);
  }
  BOOL v16 = 1;
LABEL_14:

  return v16;
}

- (BOOL)connection:(id)a3 sendMessagePayloadToPrimaryResident:(id)a4 responseHandler:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 homeUUID];
  v13 = [(HMDMatterXPCListener *)self _homeForUUID:v12];

  if (!v13)
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    uint32_t v21 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      int v25 = 138543362;
      __int16 v26 = v22;
      v23 = "%{public}@MTRPluginClientConnection sendMessage: supplied an invalid home, failing to send message";
LABEL_10:
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v25, 0xCu);
    }
LABEL_11:
    BOOL v20 = 0;
    goto LABEL_12;
  }
  char v14 = [v13 _sendMatterMessagePayloadToPrimaryResident:v10 responseHandler:v11];
  v15 = (void *)MEMORY[0x230FBD990]();
  BOOL v16 = self;
  v17 = HMFGetOSLogHandle();
  v18 = v17;
  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      int v25 = 138543362;
      __int16 v26 = v22;
      v23 = "%{public}@ *** MTRPluginClientConnection _sendMatterMessagePayloadToPrimaryResident failed";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v19 = HMFGetLogIdentifier();
    int v25 = 138543362;
    __int16 v26 = v19;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@MTRPluginClientConnection _sendMatterMessagePayloadToPrimaryResident succeeded", (uint8_t *)&v25, 0xCu);
  }
  BOOL v20 = 1;
LABEL_12:

  return v20;
}

- (BOOL)connection:(id)a3 allowsOperationWithHome:(id)a4 operationType:(int64_t)a5 nodeId:(id)a6 commandId:(id)a7 endpointId:(id)a8 clusterId:(id)a9 attributeId:(id)a10
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v54 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  uint32_t v21 = (void *)MEMORY[0x230FBD990]();
  v22 = self;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v25 = id v24 = v17;
    *(_DWORD *)buf = 138543874;
    v56 = v25;
    __int16 v57 = 2112;
    id v58 = v15;
    __int16 v59 = 2112;
    id v60 = v16;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@connection:%@, allowsOperationWithHome %@", buf, 0x20u);

    id v17 = v24;
  }

  __int16 v26 = [v15 context];
  uint64_t v27 = [v26 objectForKey:@"HMDMTRPluginClientConnectionHMDProcessInfo"];

  if (v27)
  {
    if (v16)
    {
      __int16 v28 = [(HMDMatterXPCListener *)v22 _homeForUUID:v16];
      if (v28)
      {
        if ([v27 isForegrounded] & 1) != 0 || (objc_msgSend(v15, "backgroundModeEntitled"))
        {
          BOOL v29 = 1;
LABEL_19:

          goto LABEL_20;
        }
        context = (void *)MEMORY[0x230FBD990]();
        v22;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v53 = v16;
          id v44 = v15;
          id v45 = v20;
          id v46 = v19;
          id v47 = v18;
          v49 = id v48 = v17;
          *(_DWORD *)buf = 138543362;
          v56 = v49;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@MTRPluginClientConnection is not foregrounded, and not allowed to run in background, denying access", buf, 0xCu);

          id v17 = v48;
          id v18 = v47;
          id v19 = v46;
          id v20 = v45;
          id v15 = v44;
          id v16 = v53;
        }
      }
      else
      {
        id v52 = v17;
        context = (void *)MEMORY[0x230FBD990]();
        v40 = v22;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v56 = v42;
          __int16 v57 = 2112;
          id v58 = v16;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@MTRPluginClientConnection supplied an invalid home, denying access (UUID: %@)", buf, 0x16u);
        }
        id v17 = v52;
      }

      BOOL v29 = 0;
      goto LABEL_19;
    }
    uint64_t v30 = (void *)MEMORY[0x230FBD990]();
    v31 = v22;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v51 = 0;
      id v33 = v15;
      id v34 = v20;
      id v35 = v19;
      id v36 = v18;
      v38 = id v37 = v17;
      *(_DWORD *)buf = 138543362;
      v56 = v38;
      v39 = "%{public}@MTRPluginClientConnection passed in an empty homeUUID, denying access";
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v30 = (void *)MEMORY[0x230FBD990]();
    v31 = v22;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v51 = v16;
      id v33 = v15;
      id v34 = v20;
      id v35 = v19;
      id v36 = v18;
      v38 = id v37 = v17;
      *(_DWORD *)buf = 138543362;
      v56 = v38;
      v39 = "%{public}@MTRPluginClientConnection had no process info attached to it, denying access";
LABEL_13:
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, v39, buf, 0xCu);

      id v17 = v37;
      id v18 = v36;
      id v19 = v35;
      id v20 = v34;
      id v15 = v33;
      id v16 = v51;
    }
  }

  BOOL v29 = 0;
LABEL_20:

  return v29;
}

- (id)_homeForUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(HMDMatterXPCListener *)self homeManager];
  v6 = [v5 homes];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 uuid];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v63 = v10;
    __int16 v64 = 2112;
    id v65 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@New Matter XPC connection requested: %@", buf, 0x16u);
  }
  if (v6)
  {
    [v6 auditToken];
  }
  else
  {
    long long v59 = 0u;
    long long v58 = 0u;
  }
  if (TCCAccessCheckAuditToken())
  {
    id v11 = [v6 valueForEntitlement:@"com.apple.developer.homekit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v12 = v11;
    }
    else {
      char v12 = 0;
    }
    id v13 = v12;

    long long v14 = [v6 valueForEntitlement:@"com.apple.private.homekit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v15 = v14;
    }
    else {
      long long v15 = 0;
    }
    id v49 = v15;

    if ([v13 BOOLValue] & 1) != 0 || (objc_msgSend(v49, "BOOLValue"))
    {
      long long v16 = [v6 valueForEntitlement:@"com.apple.developer.homekit.background-mode"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v17 = v16;
      }
      else {
        long long v17 = 0;
      }
      id v18 = v17;

      uint64_t v19 = [v18 BOOLValue];
      id v20 = (void *)MEMORY[0x230FBD990]();
      uint32_t v21 = v8;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = HMFGetLogIdentifier();
        id v24 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        v63 = v23;
        __int16 v64 = 2112;
        id v65 = v24;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Matter XPC connect entitlement for background mode: %@", buf, 0x16u);
      }
      uint64_t v25 = [v6 processIdentifier];
      __int16 v26 = [(os_unfair_lock_s *)v21 processMonitor];
      uint64_t v27 = [[HMDXPCConnection alloc] initWithXPCConnection:v6];
      __int16 v28 = [v26 processInfoForXPCConnection:v27];

      id v60 = @"HMDMTRPluginClientConnectionHMDProcessInfo";
      uint64_t v61 = v28;
      BOOL v29 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      id v30 = objc_alloc(MEMORY[0x263F54018]);
      v31 = [(os_unfair_lock_s *)v21 delegateQueue];
      v32 = (void *)[v30 initWithClientConnection:v6 backgroundModeEntitled:v19 pid:v25 context:v29 delegate:v21 delegateQueue:v31];

      id v33 = [MEMORY[0x263F54028] sharedInstance];
      [v33 addClientConnection:v32];

      os_unfair_lock_lock_with_options();
      id v34 = [(os_unfair_lock_s *)v21 mutableConnections];
      [v34 addObject:v32];

      os_unfair_lock_unlock(v21 + 2);
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __59__HMDMatterXPCListener_listener_shouldAcceptNewConnection___block_invoke;
      v54[3] = &unk_264A22C98;
      v54[4] = v21;
      int v57 = v25;
      id v35 = v32;
      id v55 = v35;
      id v56 = v28;
      id v36 = v28;
      [v6 setInvalidationHandler:v54];
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __59__HMDMatterXPCListener_listener_shouldAcceptNewConnection___block_invoke_2;
      v51[3] = &unk_264A22CC0;
      int v53 = v25;
      v51[4] = v21;
      id v52 = v35;
      id v37 = v35;
      [v6 setInterruptionHandler:v51];
      v38 = [(os_unfair_lock_s *)v21 workQueue];
      [v6 _setQueue:v38];

      [v37 resume];
      BOOL v39 = 1;
    }
    else
    {
      id v44 = (void *)MEMORY[0x230FBD990]();
      id v45 = v8;
      id v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        id v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v63 = v47;
        __int16 v64 = 2112;
        id v65 = v6;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Matter XPC connection does not have required HomeKit entitlements: %@", buf, 0x16u);
      }
      BOOL v39 = 0;
    }
  }
  else
  {
    v40 = (void *)MEMORY[0x230FBD990]();
    v41 = v8;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v63 = v43;
      __int16 v64 = 2112;
      id v65 = v6;
      _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Matter XPC connection has no permission to access Home data: %@", buf, 0x16u);
    }
    BOOL v39 = 0;
  }

  return v39;
}

void __59__HMDMatterXPCListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = *(_DWORD *)(a1 + 56);
    *(_DWORD *)buf = 138543618;
    long long v16 = v5;
    __int16 v17 = 1024;
    int v18 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Matter XPC client invalidated: %d", buf, 0x12u);
  }
  [*(id *)(a1 + 40) invalidated];
  id v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  uint64_t v8 = [*(id *)(a1 + 32) mutableConnections];
  [(id)v8 removeObject:*(void *)(a1 + 40)];

  os_unfair_lock_unlock(v7);
  LODWORD(v8) = [*(id *)(a1 + 40) pid];
  id v9 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v10 = [*(id *)(a1 + 32) mutableConnections];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__HMDMatterXPCListener_listener_shouldAcceptNewConnection___block_invoke_20;
  v13[3] = &__block_descriptor_36_e35_B16__0__MTRPluginClientConnection_8l;
  int v14 = v8;
  LOBYTE(v8) = objc_msgSend(v10, "na_any:", v13);

  os_unfair_lock_unlock(v9);
  if ((v8 & 1) == 0 && ([*(id *)(a1 + 48) shouldMonitor] & 1) == 0)
  {
    id v11 = [*(id *)(a1 + 32) processMonitor];
    [v11 removeProcess:*(void *)(a1 + 48)];
  }
  char v12 = [MEMORY[0x263F54028] sharedInstance];
  [v12 removeClientConnection:*(void *)(a1 + 40)];
}

void __59__HMDMatterXPCListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = *(_DWORD *)(a1 + 48);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Matter XPC client interrupted: %d", (uint8_t *)&v8, 0x12u);
  }
  [*(id *)(a1 + 40) interrupted];
  id v7 = [MEMORY[0x263F54028] sharedInstance];
  [v7 removeClientConnection:*(void *)(a1 + 40)];
}

BOOL __59__HMDMatterXPCListener_listener_shouldAcceptNewConnection___block_invoke_20(uint64_t a1, void *a2)
{
  return [a2 pid] == *(_DWORD *)(a1 + 32);
}

- (void)stop
{
  id v3 = [MEMORY[0x263F54028] sharedInstance];
  [v3 stop];

  id v4 = [(HMDMatterXPCListener *)self listener];
  [v4 suspend];
}

- (void)start
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Starting Matter XPC listener", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [MEMORY[0x263F54028] sharedInstance];
  int v8 = [(HMDMatterXPCListener *)v4 workQueue];
  [v7 startWithDelegate:v4 queue:v8];

  id v9 = [(HMDMatterXPCListener *)v4 listener];
  [v9 resume];
}

- (HMDMatterXPCListener)initWithHomeManager:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HMDMatterXPCListener;
  v5 = [(HMDMatterXPCListener *)&v30 init];
  int v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    HMDispatchQueueNameString();
    id v7 = objc_claimAutoreleasedReturnValue();
    int v8 = (const char *)[v7 UTF8String];
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    delegateQueue = v6->_delegateQueue;
    v6->_delegateQueue = (OS_dispatch_queue *)v10;

    HMDispatchQueueNameString();
    id v12 = objc_claimAutoreleasedReturnValue();
    id v13 = (const char *)[v12 UTF8String];
    int v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v15;

    id v17 = objc_alloc(MEMORY[0x263F08D88]);
    uint64_t v18 = [v17 initWithMachServiceName:*MEMORY[0x263F0DE98]];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v18;

    [(NSXPCListener *)v6->_listener _setQueue:v6->_workQueue];
    [(NSXPCListener *)v6->_listener setDelegate:v6];
    objc_storeWeak((id *)&v6->_homeManager, v4);
    HMDispatchQueueNameString();
    id v20 = objc_claimAutoreleasedReturnValue();
    uint32_t v21 = (const char *)[v20 UTF8String];
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create(v21, v22);
    processMonitorQueue = v6->_processMonitorQueue;
    v6->_processMonitorQueue = (OS_dispatch_queue *)v23;

    uint64_t v25 = [[HMDProcessMonitor alloc] initWithQueue:v6->_processMonitorQueue];
    processMonitor = v6->_processMonitor;
    v6->_processMonitor = v25;

    uint64_t v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mutableConnections = v6->_mutableConnections;
    v6->_mutableConnections = v27;
  }
  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_163830 != -1) {
    dispatch_once(&logCategory__hmf_once_t25_163830, &__block_literal_global_163831);
  }
  v2 = (void *)logCategory__hmf_once_v26_163832;
  return v2;
}

void __35__HMDMatterXPCListener_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v26_163832;
  logCategory__hmf_once_v26_163832 = v0;
}

@end