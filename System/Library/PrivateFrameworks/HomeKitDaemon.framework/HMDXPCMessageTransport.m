@interface HMDXPCMessageTransport
+ (HMDXPCMessageTransport)accessorySetupTransport;
+ (HMDXPCMessageTransport)defaultTransport;
+ (id)logCategory;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (HMDProcessMonitor)processMonitor;
- (HMDXPCMessageTransport)initWithConfiguration:(id)a3;
- (HMDXPCMessageTransport)initWithConfiguration:(id)a3 listener:(id)a4 processMonitor:(id)a5 appProtectionGuard:(id)a6;
- (NSArray)connections;
- (NSDictionary)stateDump;
- (OS_dispatch_queue)queue;
- (id)clientConnectionFactory;
- (id)logIdentifier;
- (void)connectionDidActivate:(id)a3;
- (void)connectionDidDeactivate:(id)a3;
- (void)connectionDidInvalidate:(id)a3;
- (void)connectionDidStart:(id)a3;
- (void)handleProcessStateDidChangeNotification:(id)a3;
- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setClientConnectionFactory:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDXPCMessageTransport

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientConnectionFactory, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_mutableConnections, 0);
  objc_storeStrong((id *)&self->_appProtectionGuard, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
}

- (void)setClientConnectionFactory:(id)a3
{
}

- (id)clientConnectionFactory
{
  return objc_getProperty(self, a2, 80, 1);
}

- (HMDProcessMonitor)processMonitor
{
  return (HMDProcessMonitor *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v53 = v10;
    __int16 v54 = 2112;
    id v55 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@New XPC connection requested: %@", buf, 0x16u);
  }
  v11 = [(HMDXPCMessageTransport *)v8 clientConnectionFactory];
  v12 = [(HMDXPCMessageTransport *)v8 queue];
  v13 = ((void (**)(void, id, void *))v11)[2](v11, v6, v12);

  if (v8) {
    configuration = v8->_configuration;
  }
  else {
    configuration = 0;
  }
  uint64_t v15 = [(HMXPCMessageTransportConfiguration *)configuration requiredEntitlements];
  uint64_t v16 = [v13 entitlements];
  uint64_t v17 = v16 & v15;
  if ((v16 & v15) != v15)
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = v8;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      v25 = HMXPCClientEntitlementsToComponents(v17 ^ v15);
      *(_DWORD *)buf = 138543874;
      v53 = v24;
      __int16 v54 = 2112;
      id v55 = v25;
      __int16 v56 = 2112;
      v57 = v13;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Rejecting connection missing entitlements %@: %@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  if (v8) {
    v18 = v8->_configuration;
  }
  else {
    v18 = 0;
  }
  if (![(HMXPCMessageTransportConfiguration *)v18 requiresHomeDataAccess]) {
    goto LABEL_22;
  }
  if (([v13 isAuthorizedForHomeDataAccess] & 1) == 0)
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = v8;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      v28 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "clientPid"));
      *(_DWORD *)buf = 138543618;
      v53 = v27;
      __int16 v54 = 2112;
      id v55 = v28;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Rejecting connection from client with PID %@ because it is not authorized for Home data access", buf, 0x16u);
    }
LABEL_16:

    BOOL v26 = 0;
    goto LABEL_29;
  }
  if (v8) {
    appProtectionGuard = v8->_appProtectionGuard;
  }
  else {
    appProtectionGuard = 0;
  }
  v20 = appProtectionGuard;
  if (v6) {
    [v6 auditToken];
  }
  else {
    memset(v51, 0, sizeof(v51));
  }
  uint64_t v29 = *MEMORY[0x263F0C7A8];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke;
  v49[3] = &unk_264A22AD8;
  v49[4] = v8;
  id v50 = v13;
  [(HMDAppProtectionGuard *)v20 initiateAuthenticationForApplicationWithBundleIdentifier:v29 onBehalfOfProcessWithAuditToken:v51 completion:v49];

LABEL_22:
  [v13 setDelegate:v8];
  [v6 setExportedObject:v13];
  if (v8)
  {
    [v6 setExportedInterface:v8->_exportedInterface];
    remoteObjectInterface = v8->_remoteObjectInterface;
  }
  else
  {
    [v6 setExportedInterface:0];
    remoteObjectInterface = 0;
  }
  [v6 setRemoteObjectInterface:remoteObjectInterface];
  v31 = [(HMDXPCMessageTransport *)v8 processMonitor];
  v39 = [v31 processInfoForXPCConnection:v6];

  [v13 setProcessInfo:v39];
  os_unfair_lock_lock_with_options();
  if (v8) {
    mutableConnections = v8->_mutableConnections;
  }
  else {
    mutableConnections = 0;
  }
  v33 = mutableConnections;
  [(NSMutableSet *)v33 addObject:v13];

  os_unfair_lock_unlock(&v8->_lock);
  objc_initWeak(&location, v8);
  objc_initWeak(&from, v13);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke_118;
  v44[3] = &unk_264A26E10;
  objc_copyWeak(&v45, &location);
  objc_copyWeak(&v46, &from);
  [v6 setInterruptionHandler:v44];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke_119;
  v41[3] = &unk_264A26E10;
  objc_copyWeak(&v42, &location);
  objc_copyWeak(&v43, &from);
  v34 = (void *)MEMORY[0x230FBD990]([v6 setInvalidationHandler:v41]);
  v35 = v8;
  HMFGetOSLogHandle();
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v53 = v37;
    __int16 v54 = 2112;
    id v55 = v13;
    _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Resuming new XPC connection: %@", buf, 0x16u);
  }
  [v6 resume];
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  BOOL v26 = 1;
LABEL_29:

  return v26;
}

void __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  v8 = HMFGetOSLogHandle();
  v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v17 = 138543618;
      v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      v12 = "%{public}@Successfully initiated authentication for app protection for connection: %@";
      v13 = v9;
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v10 = HMFGetLogIdentifier();
    uint64_t v16 = *(void *)(a1 + 40);
    int v17 = 138543874;
    v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v16;
    __int16 v21 = 2112;
    id v22 = v5;
    v12 = "%{public}@Failed to initiate authentication for app protection for connection %@: %@";
    v13 = v9;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 32;
    goto LABEL_6;
  }
}

void __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke_118(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = WeakRetained;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Daemon received interruption for %@", (uint8_t *)&v8, 0x16u);
  }
}

void __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke_119(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = WeakRetained;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v17 = v7;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Daemon received invalidation for %@", buf, 0x16u);
  }
  if (v5 && v3)
  {
    os_unfair_lock_lock_with_options();
    id v8 = *((id *)v5 + 7);
    [v8 removeObject:v3];

    id v9 = *((id *)v5 + 7);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke_120;
    v14[3] = &unk_264A1E4E0;
    id v10 = v3;
    id v15 = v10;
    LOBYTE(v8) = objc_msgSend(v9, "na_any:", v14);

    os_unfair_lock_unlock((os_unfair_lock_t)v5 + 4);
    [v10 invalidate];
    id v11 = [v10 processInfo];
    uint64_t v12 = v11;
    if ((v8 & 1) == 0 && ([v11 shouldMonitor] & 1) == 0)
    {
      v13 = [v5 processMonitor];
      [v13 removeProcess:v12];
    }
  }
}

BOOL __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke_120(uint64_t a1, void *a2)
{
  id v3 = [a2 processInfo];
  int v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 32) processInfo];
  BOOL v6 = v4 == [v5 identifier];

  return v6;
}

- (void)connectionDidInvalidate:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDXPCMessageTransport *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [MEMORY[0x263F08A00] defaultCenter];
  id v8 = @"connection";
  v9[0] = v4;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"HMDXPCClientConnectionDidInvalidateNotification" object:self userInfo:v7];
}

- (void)connectionDidDeactivate:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDXPCMessageTransport *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [MEMORY[0x263F08A00] defaultCenter];
  id v8 = @"connection";
  v9[0] = v4;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"HMDXPCClientConnectionDidDeactivateNotification" object:self userInfo:v7];
}

- (void)connectionDidActivate:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDXPCMessageTransport *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [MEMORY[0x263F08A00] defaultCenter];
  id v8 = @"connection";
  v9[0] = v4;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"HMDXPCClientConnectionDidActivateNotification" object:self userInfo:v7];
}

- (void)connectionDidStart:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDXPCMessageTransport *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [MEMORY[0x263F08A00] defaultCenter];
  id v8 = @"connection";
  v9[0] = v4;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"HMDXPCClientConnectionDidStartNotification" object:self userInfo:v7];
}

- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMFMessageTransport *)self delegate];
  [v8 messageTransport:v7 didReceiveMessage:v6];
}

- (id)logIdentifier
{
  if (self) {
    self = (HMDXPCMessageTransport *)self->_configuration;
  }
  return (id)[(HMDXPCMessageTransport *)self machServiceName];
}

- (void)handleProcessStateDidChangeNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDXPCMessageTransport *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"processInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = [(HMDXPCMessageTransport *)self connections];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
LABEL_6:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
      id v16 = [v15 processInfo];

      if (v16 != v9) {
        break;
      }
      [v15 handleProcessStateDidChange];
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263EFF980];
  id v9 = [(HMDXPCMessageTransport *)self connections];
  id v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v11 = [(HMDXPCMessageTransport *)self connections];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v62 objects:v82 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v63 != v15) {
          objc_enumerationMutation(v11);
        }
        long long v17 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        if ([v17 sendMessage:v6 error:0])
        {
          ++v14;
        }
        else
        {
          long long v18 = [v17 shortDescription];
          [v10 addObject:v18];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v62 objects:v82 count:16];
    }
    while (v13);

    if (v14)
    {
      long long v19 = (void *)MEMORY[0x230FBD990]();
      long long v20 = self;
      __int16 v21 = HMFGetOSLogHandle();
      id v61 = v7;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v59 = HMFGetLogIdentifier();
        uint64_t v58 = [v6 name];
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        uint64_t v22 = [v6 identifier];

        if (v22)
        {
          uint64_t v23 = [v6 identifier];
          [v23 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F42690];
        }
        long long v70 = *(_OWORD *)buf;
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        v39 = [v6 destination];
        id v40 = [v39 target];

        if (v40)
        {
          v41 = [v6 destination];
          id v42 = [v41 target];
          [v42 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x263F42690];
        }
        long long v69 = *(_OWORD *)buf;
        id v43 = [(HMDXPCMessageTransport *)v20 connections];
        uint64_t v44 = [v43 count];
        id v45 = [v6 sendPolicy];
        *(_DWORD *)buf = 138545410;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v58;
        __int16 v72 = 1042;
        *(_DWORD *)v73 = 16;
        *(_WORD *)&v73[4] = 2098;
        *(void *)&v73[6] = &v70;
        *(_WORD *)&v73[14] = 1040;
        *(_DWORD *)&v73[16] = 16;
        __int16 v74 = 2096;
        v75 = &v69;
        __int16 v76 = 2050;
        v77 = v14;
        __int16 v78 = 2050;
        uint64_t v79 = v44;
        __int16 v80 = 2114;
        v81 = v45;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Sent message %{public}@(%{public,uuid_t}.16P) with target %{uuid_t}.16P to %{public}lu/%{public}lu clients with message send policy %{public}@", buf, 0x54u);

        id v7 = v61;
        long long v19 = v57;
      }

      id v46 = (void *)MEMORY[0x230FBD990]();
      v47 = v20;
      v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        v49 = HMFGetLogIdentifier();
        id v50 = [v6 shortDescription];
        v51 = [v6 messagePayload];
        v52 = (void *)MEMORY[0x263EFFA08];
        v68[0] = @"kAuthorizationDataKey";
        v68[1] = @"kAccessoryPairingPasswordKey";
        v68[2] = @"kAccessoryName";
        v68[3] = @"kServiceName";
        v68[4] = @"kActionSetName";
        v68[5] = @"kTriggerName";
        v68[6] = @"kZoneName";
        v68[7] = @"kHomeName";
        v68[8] = @"kRoomName";
        v68[9] = @"kAccessoryInfoSerialNumberKey";
        v68[10] = @"kUserIDKey";
        v68[11] = @"kUserIDsKey";
        v68[12] = @"kUserDisplayNameKey";
        v68[13] = @"kUserNamesKey";
        [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:14];
        v53 = v60 = v46;
        __int16 v54 = [v52 setWithArray:v53];
        id v55 = [v51 secureDescriptionWithBlacklistKeys:v54];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v49;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v50;
        __int16 v72 = 2114;
        *(void *)v73 = v55;
        *(_WORD *)&v73[8] = 2114;
        *(void *)&v73[10] = v10;
        _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_DEBUG, "%{public}@Sent message %{public}@ with payload: %{public}@ (skipped ineligible clients: %{public}@)", buf, 0x2Au);

        id v7 = v61;
        id v46 = v60;
      }
      __int16 v56 = _Block_copy(v7);
      v36 = v56;
      if (v56) {
        (*((void (**)(void *, void))v56 + 2))(v56, 0);
      }
      goto LABEL_36;
    }
  }
  else
  {
  }
  v24 = (void *)MEMORY[0x230FBD990]();
  v25 = self;
  BOOL v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = HMFGetLogIdentifier();
    v28 = [v6 name];
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    uint64_t v29 = [v6 identifier];

    if (v29)
    {
      v30 = [v6 identifier];
      [v30 getUUIDBytes:buf];
    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x263F42690];
    }
    long long v67 = *(_OWORD *)buf;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    v31 = [v6 destination];
    v32 = [v31 target];

    if (v32)
    {
      v33 = [v6 destination];
      v34 = [v33 target];
      [v34 getUUIDBytes:buf];
    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x263F42690];
    }
    long long v66 = *(_OWORD *)buf;
    v35 = [v6 sendPolicy];
    *(_DWORD *)buf = 138544898;
    *(void *)&uint8_t buf[4] = v27;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v28;
    __int16 v72 = 1042;
    *(_DWORD *)v73 = 16;
    *(_WORD *)&v73[4] = 2098;
    *(void *)&v73[6] = &v67;
    *(_WORD *)&v73[14] = 1040;
    *(_DWORD *)&v73[16] = 16;
    __int16 v74 = 2096;
    v75 = &v66;
    __int16 v76 = 2114;
    v77 = v35;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Not sending message %{public}@(%{public,uuid_t}.16P) with target %{uuid_t}.16P because no clients are eligible for send policy: %{public}@", buf, 0x40u);
  }
  v36 = [MEMORY[0x263F087E8] hmErrorWithCode:54 description:@"Failed to send message." reason:@"No eligible clients" suggestion:0];
  v37 = _Block_copy(v7);
  v38 = v37;
  if (v37) {
    (*((void (**)(void *, void *))v37 + 2))(v37, v36);
  }

LABEL_36:
}

- (NSDictionary)stateDump
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [(HMDXPCMessageTransport *)self connections];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_95_99711);

  id v6 = @"Connections";
  v7[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

uint64_t __35__HMDXPCMessageTransport_stateDump__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stateDump];
}

- (NSArray)connections
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    mutableConnections = self->_mutableConnections;
  }
  else {
    mutableConnections = 0;
  }
  id v5 = mutableConnections;
  id v6 = [(NSMutableSet *)v5 allObjects];

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v6;
}

- (void)stop
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping XPC message transport", (uint8_t *)&v8, 0xCu);
  }
  if (v4) {
    listener = v4->_listener;
  }
  else {
    listener = 0;
  }
  [(HMDXPCListener *)listener stop];
}

- (void)start
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v14 = 138543362;
    uint64_t v15 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting XPC message transport", (uint8_t *)&v14, 0xCu);
  }
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  int v8 = HMDProcessMonitorProcessStateDidChangeNotification;
  id v9 = [(HMDXPCMessageTransport *)v4 processMonitor];
  [v7 addObserver:v4 selector:sel_handleProcessStateDidChangeNotification_ name:v8 object:v9];

  if (v4) {
    listener = v4->_listener;
  }
  else {
    listener = 0;
  }
  [(HMDXPCListener *)listener setDelegate:v4];
  uint64_t v11 = [(HMDXPCMessageTransport *)v4 queue];
  if (v4)
  {
    [(HMDXPCListener *)v4->_listener setQueue:v11];

    [(HMDXPCListener *)v4->_listener start];
    configuration = v4->_configuration;
  }
  else
  {
    [0 setQueue:v11];

    [0 start];
    configuration = 0;
  }
  id v13 = [(HMXPCMessageTransportConfiguration *)configuration serverStartNotification];
  notify_post((const char *)[v13 UTF8String]);
}

- (OS_dispatch_queue)queue
{
  if (self) {
    self = (HMDXPCMessageTransport *)self->_configuration;
  }
  return [(HMDXPCMessageTransport *)self queue];
}

- (HMDXPCMessageTransport)initWithConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [HMDXPCListener alloc];
    id v7 = objc_alloc(MEMORY[0x263F08D88]);
    int v8 = [v5 machServiceName];
    id v9 = (void *)[v7 initWithMachServiceName:v8];
    uint64_t v10 = [(HMDXPCListener *)v6 initWithXPCListener:v9];

    uint64_t v11 = [HMDProcessMonitor alloc];
    uint64_t v12 = [v5 queue];
    id v13 = [(HMDProcessMonitor *)v11 initWithQueue:v12];

    int v14 = objc_alloc_init(HMDAppProtectionGuard);
    uint64_t v15 = [(HMDXPCMessageTransport *)self initWithConfiguration:v5 listener:v10 processMonitor:v13 appProtectionGuard:v14];

    return v15;
  }
  else
  {
    long long v17 = (HMDXPCMessageTransport *)_HMFPreconditionFailure();
    return [(HMDXPCMessageTransport *)v17 initWithConfiguration:v19 listener:v20 processMonitor:v21 appProtectionGuard:v22];
  }
}

- (HMDXPCMessageTransport)initWithConfiguration:(id)a3 listener:(id)a4 processMonitor:(id)a5 appProtectionGuard:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  int v14 = v13;
  if (!v13)
  {
LABEL_11:
    uint64_t v26 = _HMFPreconditionFailure();
    return (HMDXPCMessageTransport *)__91__HMDXPCMessageTransport_initWithConfiguration_listener_processMonitor_appProtectionGuard___block_invoke(v26);
  }
  v27.receiver = self;
  v27.super_class = (Class)HMDXPCMessageTransport;
  uint64_t v15 = [(HMDXPCMessageTransport *)&v27 init];
  if (v15)
  {
    uint64_t v16 = [v10 copy];
    configuration = v15->_configuration;
    v15->_configuration = (HMXPCMessageTransportConfiguration *)v16;

    objc_storeStrong((id *)&v15->_listener, a4);
    objc_storeStrong((id *)&v15->_processMonitor, a5);
    objc_storeStrong((id *)&v15->_appProtectionGuard, a6);
    SEL v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mutableConnections = v15->_mutableConnections;
    v15->_mutableConnections = v18;

    uint64_t v20 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E4E8CE8];
    exportedInterface = v15->_exportedInterface;
    v15->_exportedInterface = (NSXPCInterface *)v20;

    uint64_t v22 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E6169E0];
    remoteObjectInterface = v15->_remoteObjectInterface;
    v15->_remoteObjectInterface = (NSXPCInterface *)v22;

    id clientConnectionFactory = v15->_clientConnectionFactory;
    v15->_id clientConnectionFactory = &__block_literal_global_84_99734;
  }
  return v15;
}

HMDXPCClientConnection *__91__HMDXPCMessageTransport_initWithConfiguration_listener_processMonitor_appProtectionGuard___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[HMDXPCClientConnection alloc] initWithConnection:v5 queue:v4];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_99754 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_99754, &__block_literal_global_112_99755);
  }
  v2 = (void *)logCategory__hmf_once_v10_99756;
  return v2;
}

void __37__HMDXPCMessageTransport_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_99756;
  logCategory__hmf_once_v10_99756 = v0;
}

+ (HMDXPCMessageTransport)accessorySetupTransport
{
  if (accessorySetupTransport_onceToken != -1) {
    dispatch_once(&accessorySetupTransport_onceToken, &__block_literal_global_16_99761);
  }
  v2 = (void *)accessorySetupTransport_accessorySetupTransport;
  return (HMDXPCMessageTransport *)v2;
}

void __49__HMDXPCMessageTransport_accessorySetupTransport__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F0E5F0]);
  id v3 = (id)[v0 initWithMachServiceName:*MEMORY[0x263F0DE60]];
  [v3 setRequiredEntitlements:1];
  [v3 setRequiresHomeDataAccess:0];
  v1 = [[HMDXPCMessageTransport alloc] initWithConfiguration:v3];
  v2 = (void *)accessorySetupTransport_accessorySetupTransport;
  accessorySetupTransport_accessorySetupTransport = (uint64_t)v1;
}

+ (HMDXPCMessageTransport)defaultTransport
{
  if (defaultTransport_onceToken != -1) {
    dispatch_once(&defaultTransport_onceToken, &__block_literal_global_99765);
  }
  v2 = (void *)defaultTransport_defaultTransport;
  return (HMDXPCMessageTransport *)v2;
}

void __42__HMDXPCMessageTransport_defaultTransport__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F0E5F0]);
  id v3 = (id)[v0 initWithMachServiceName:*MEMORY[0x263F0DE88]];
  [v3 setRequiredEntitlements:1];
  [v3 setRequiresHomeDataAccess:1];
  v1 = [[HMDXPCMessageTransport alloc] initWithConfiguration:v3];
  v2 = (void *)defaultTransport_defaultTransport;
  defaultTransport_defaultTransport = (uint64_t)v1;
}

@end