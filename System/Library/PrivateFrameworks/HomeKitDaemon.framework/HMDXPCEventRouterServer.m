@interface HMDXPCEventRouterServer
+ (id)logCategory;
- (BOOL)shouldAllowEvent:(id)a3 topic:(id)a4 connection:(id)a5;
- (HMDXPCEventRouterServer)initWithMessageUUID:(id)a3 dataSource:(id)a4 changeRegistrationsMessageName:(id)a5 updateEventsMessageName:(id)a6 messageDispatcher:(id)a7 queue:(id)a8 notificationCenter:(id)a9 persistentConnectionServerFactory:(id)a10;
- (HMDXPCEventRouterServer)initWithMessageUUID:(id)a3 dataSource:(id)a4 changeRegistrationsMessageName:(id)a5 updateEventsMessageName:(id)a6 messageDispatcher:(id)a7 queue:(id)a8 notificationCenter:(id)a9 subscriptionProvider:(id)a10 registrationEventRouter:(id)a11 storeReadHandle:(id)a12;
- (HMDXPCEventRouterServerDataSource)dataSource;
- (HMEPersistentConnectionServer)persistentConnectionServer;
- (HMFMessageDispatcher)messageDispatcher;
- (NSNotificationCenter)notificationCenter;
- (NSString)changeRegistrationsMessageName;
- (NSString)updateEventsMessageName;
- (NSUUID)messageUUID;
- (OS_dispatch_queue)workQueue;
- (id)dumpStateDescription;
- (id)logIdentifier;
- (id)server:(id)a3 expandedTopicsForTopics:(id)a4;
- (id)server:(id)a3 upstreamTopicsForTopic:(id)a4;
- (uint64_t)isConnectionActive:(uint64_t)a1;
- (unint64_t)debounceTimeForConnection:(id)a3;
- (void)_handleChangeRegistrationsRequest:(id)a3;
- (void)handleConnectionActiveStateChange:(id)a3;
- (void)handleXPCConnectionInvalidated:(id)a3;
- (void)registerForMessages;
- (void)sendUpdatedCachedEvents:(id)a3 toConnection:(id)a4;
- (void)sendUpdatedEvents:(id)a3 toConnection:(id)a4;
@end

@implementation HMDXPCEventRouterServer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_updateEventsMessageName, 0);
  objc_storeStrong((id *)&self->_changeRegistrationsMessageName, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_persistentConnectionServer, 0);
}

- (HMDXPCEventRouterServerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDXPCEventRouterServerDataSource *)WeakRetained;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)updateEventsMessageName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)changeRegistrationsMessageName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)messageUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMEPersistentConnectionServer)persistentConnectionServer
{
  return (HMEPersistentConnectionServer *)objc_getProperty(self, a2, 8, 1);
}

- (id)dumpStateDescription
{
  v2 = NSString;
  v3 = [(HMDXPCEventRouterServer *)self persistentConnectionServer];
  v4 = [v3 dumpStateDescription];
  v5 = [v2 stringWithFormat:@"[HMDXPCEventRouterServer server: %@]", v4];

  return v5;
}

- (id)server:(id)a3 expandedTopicsForTopics:(id)a4
{
  id v5 = a4;
  v6 = [(HMDXPCEventRouterServer *)self dataSource];
  v7 = [v6 expandedTopicsForTopics:v5];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF8C0] array];
  }
  v9 = v8;

  return v9;
}

- (id)server:(id)a3 upstreamTopicsForTopic:(id)a4
{
  v4 = +[HMDHomeEventsGenerated upstreamClientTopicForTopic:a4];
  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", v4);

  return v5;
}

- (unint64_t)debounceTimeForConnection:(id)a3
{
  return 10;
}

- (BOOL)shouldAllowEvent:(id)a3 topic:(id)a4 connection:(id)a5
{
  id v5 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  id v8 = v7;
  if (v7) {
    char v9 = [v7 isEntitledForSPIAccess];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (void)sendUpdatedCachedEvents:(id)a3 toConnection:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  v10 = (void *)MEMORY[0x230FBD990]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v32 = v14;
      __int16 v33 = 2048;
      uint64_t v34 = [v6 count];
      __int16 v35 = 2112;
      id v36 = v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Sending cached events: %ld to connection: %@", buf, 0x20u);
    }
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = v11;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v32 = v18;
      __int16 v33 = 2112;
      uint64_t v34 = (uint64_t)v6;
      __int16 v35 = 2112;
      id v36 = v7;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Sending cached events: %@ to connection: %@", buf, 0x20u);
    }
    v19 = objc_msgSend(v6, "na_map:", &__block_literal_global_43);
    id v20 = objc_alloc_init(MEMORY[0x263F0E8E8]);
    v21 = (void *)[v19 mutableCopy];
    [v20 setCachedEvents:v21];

    v22 = objc_msgSend(v20, "data", *MEMORY[0x263F0DE78]);
    v30 = v22;
    v23 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

    v24 = (void *)MEMORY[0x263F42568];
    v25 = [(HMDXPCEventRouterServer *)v16 updateEventsMessageName];
    v26 = [(HMDXPCEventRouterServer *)v16 messageTargetUUID];
    v27 = [v24 entitledMessageWithName:v25 identifier:v26 messagePayload:v23];

    [v9 sendMessage:v27 completionHandler:0];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v28;
      __int16 v33 = 2112;
      uint64_t v34 = (uint64_t)v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain xpc connection from %@", buf, 0x16u);
    }
  }
}

uint64_t __64__HMDXPCEventRouterServer_sendUpdatedCachedEvents_toConnection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pbEventInfo];
}

- (void)sendUpdatedEvents:(id)a3 toConnection:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  v10 = (void *)MEMORY[0x230FBD990]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v32 = v14;
      __int16 v33 = 2048;
      uint64_t v34 = [v6 count];
      __int16 v35 = 2112;
      id v36 = v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Sending events: %ld to connection: %@", buf, 0x20u);
    }
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = v11;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v32 = v18;
      __int16 v33 = 2112;
      uint64_t v34 = (uint64_t)v6;
      __int16 v35 = 2112;
      id v36 = v7;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Sending events: %@ to connection: %@", buf, 0x20u);
    }
    v19 = objc_msgSend(v6, "na_map:", &__block_literal_global_40);
    id v20 = objc_alloc_init(MEMORY[0x263F0E8E8]);
    v21 = (void *)[v19 mutableCopy];
    [v20 setEvents:v21];

    v22 = objc_msgSend(v20, "data", *MEMORY[0x263F0DE78]);
    v30 = v22;
    v23 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

    v24 = (void *)MEMORY[0x263F42568];
    v25 = [(HMDXPCEventRouterServer *)v16 updateEventsMessageName];
    v26 = [(HMDXPCEventRouterServer *)v16 messageTargetUUID];
    v27 = [v24 entitledMessageWithName:v25 identifier:v26 messagePayload:v23];

    [v9 sendMessage:v27 completionHandler:0];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v28;
      __int16 v33 = 2112;
      uint64_t v34 = (uint64_t)v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain xpc connection from %@", buf, 0x16u);
    }
  }
}

uint64_t __58__HMDXPCEventRouterServer_sendUpdatedEvents_toConnection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pbEventInfo];
}

- (void)handleConnectionActiveStateChange:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDXPCEventRouterServer *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__HMDXPCEventRouterServer_handleConnectionActiveStateChange___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HMDXPCEventRouterServer_handleConnectionActiveStateChange___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[HMDXPCEventRouterSever] Received notification that connection active state changed: %@", (uint8_t *)&v13, 0x16u);
  }
  if (v4)
  {
    id v9 = *(void **)(a1 + 40);
    id v10 = v4;
    if (v9)
    {
      v11 = [v9 workQueue];
      dispatch_assert_queue_V2(v11);

      if ((-[HMDXPCEventRouterServer isConnectionActive:]((uint64_t)v9, v10) & 1) == 0)
      {
        v12 = [v9 persistentConnectionServer];
        [v12 disconnectConnection:v10];
      }
    }
  }
}

- (uint64_t)isConnectionActive:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 processInfo];
    int v6 = [v5 shouldMonitor];

    if (v6)
    {
      id v7 = [v4 sendPolicyParameters];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
      id v9 = v8;

      a1 = [v9 isActive];
    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

- (void)handleXPCConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDXPCEventRouterServer *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HMDXPCEventRouterServer_handleXPCConnectionInvalidated___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__HMDXPCEventRouterServer_handleXPCConnectionInvalidated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"connection"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v6 = v4;

  if (v6)
  {
    id v5 = [*(id *)(a1 + 40) persistentConnectionServer];
    [v5 didInvalidateConnection:v6];
  }
}

- (void)_handleChangeRegistrationsRequest:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDXPCEventRouterServer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 transport];

  if (!v6)
  {
    v30 = (void *)MEMORY[0x230FBD990]();
    v31 = self;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      __int16 v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v52 = v33;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@No transport on message.", buf, 0xCu);
    }
    uint64_t v34 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Did not find transport" reason:@"Need xpc connection" suggestion:0];
    goto LABEL_24;
  }
  if (([v4 isEntitledForSPIAccess] & 1) == 0)
  {
    __int16 v35 = (void *)MEMORY[0x230FBD990]();
    id v36 = self;
    uint64_t v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v52 = v38;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Not entitled.", buf, 0xCu);
    }
    uint64_t v34 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
LABEL_24:
    id v9 = (id)v34;
    [v4 respondWithError:v34];
    goto LABEL_25;
  }
  id v7 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    char v10 = -[HMDXPCEventRouterServer isConnectionActive:]((uint64_t)self, v9);
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    int v13 = HMFGetOSLogHandle();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v52 = v15;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Found xpc connection in message", buf, 0xCu);
      }
      id v16 = [v4 dataForKey:*MEMORY[0x263F0DE80]];
      if (v16)
      {
        uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F0E8E0]) initWithData:v16];
        v18 = [v17 topicFilterAdditions];
        uint64_t v19 = objc_msgSend(v18, "na_map:", &__block_literal_global_26);
        id v20 = (void *)v19;
        v21 = (void *)MEMORY[0x263EFFA68];
        if (v19) {
          v22 = (void *)v19;
        }
        else {
          v22 = (void *)MEMORY[0x263EFFA68];
        }
        id v23 = v22;

        v24 = [v17 topicFilterRemovals];
        uint64_t v25 = objc_msgSend(v24, "na_map:", &__block_literal_global_29);
        v26 = (void *)v25;
        if (v25) {
          v27 = (void *)v25;
        }
        else {
          v27 = v21;
        }
        id v28 = v27;

        uint64_t v29 = [(HMDXPCEventRouterServer *)v12 persistentConnectionServer];
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __61__HMDXPCEventRouterServer__handleChangeRegistrationsRequest___block_invoke_3;
        v49[3] = &unk_264A23A78;
        v49[4] = v12;
        id v50 = v4;
        [v29 changeRegistrationsForConnection:v9 topicFilterAdditions:v23 topicFilterRemovals:v28 completion:v49];
      }
      else
      {
        v45 = (void *)MEMORY[0x230FBD990]();
        v46 = v12;
        v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v52 = v48;
          _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@No message payload present.", buf, 0xCu);
        }
        uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        [v4 respondWithError:v17];
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v52 = v44;
        __int16 v53 = 2112;
        id v54 = v9;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Connection is not active %@", buf, 0x16u);
      }
      [v4 respondWithSuccess];
    }
  }
  else
  {
    v39 = (void *)MEMORY[0x230FBD990]();
    v40 = self;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v52 = v42;
      _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Transport is not XPC connection.", buf, 0xCu);
    }
    v43 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Transport is not XPC" reason:@"Need xpc connection" suggestion:0];
    [v4 respondWithError:v43];

    id v9 = 0;
  }
LABEL_25:
}

void __61__HMDXPCEventRouterServer__handleChangeRegistrationsRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    [*(id *)(a1 + 40) respondWithError:v6];
  }
  else
  {
    id v8 = objc_msgSend(v5, "na_map:", &__block_literal_global_32_10990);
    id v9 = objc_alloc_init(MEMORY[0x263F0E8E8]);
    char v10 = (void *)[v8 mutableCopy];
    [v9 setCachedEvents:v10];

    uint64_t v13 = *MEMORY[0x263F0DE78];
    v11 = [v9 data];
    v14[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

    [*(id *)(a1 + 40) respondWithPayload:v12];
  }
}

id __61__HMDXPCEventRouterServer__handleChangeRegistrationsRequest___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = (objc_class *)MEMORY[0x263F49388];
  id v5 = a3;
  id v6 = a2;
  id v7 = (void *)[[v4 alloc] initWithEvent:v5 topic:v6];

  id v8 = [v7 pbEventInfo];

  return v8;
}

uint64_t __61__HMDXPCEventRouterServer__handleChangeRegistrationsRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", a2);
}

uint64_t __61__HMDXPCEventRouterServer__handleChangeRegistrationsRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", a2);
}

- (void)registerForMessages
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [(HMDXPCEventRouterServer *)self messageDispatcher];
  id v4 = [(HMDXPCEventRouterServer *)self changeRegistrationsMessageName];
  id v5 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v9[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v3 registerForMessage:v4 receiver:self policies:v6 selector:sel__handleChangeRegistrationsRequest_];

  id v7 = [(HMDXPCEventRouterServer *)self notificationCenter];
  [v7 addObserver:self selector:sel_handleXPCConnectionInvalidated_ name:@"HMDXPCClientConnectionDidInvalidateNotification" object:0];

  id v8 = [(HMDXPCEventRouterServer *)self notificationCenter];
  [v8 addObserver:self selector:sel_handleConnectionActiveStateChange_ name:@"HMDHomeManagerConnectionActiveStateUpdatedNotification" object:0];
}

- (id)logIdentifier
{
  v2 = [(HMDXPCEventRouterServer *)self messageUUID];
  id v3 = [v2 UUIDString];

  return v3;
}

- (HMDXPCEventRouterServer)initWithMessageUUID:(id)a3 dataSource:(id)a4 changeRegistrationsMessageName:(id)a5 updateEventsMessageName:(id)a6 messageDispatcher:(id)a7 queue:(id)a8 notificationCenter:(id)a9 persistentConnectionServerFactory:(id)a10
{
  id v29 = a3;
  id v17 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v18 = a9;
  uint64_t v19 = (void (**)(void))a10;
  v30.receiver = self;
  v30.super_class = (Class)HMDXPCEventRouterServer;
  id v20 = [(HMDXPCEventRouterServer *)&v30 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_messageUUID, a3);
    objc_storeWeak((id *)&v21->_dataSource, v17);
    objc_storeStrong((id *)&v21->_messageDispatcher, a7);
    objc_storeStrong((id *)&v21->_workQueue, a8);
    objc_storeStrong((id *)&v21->_notificationCenter, a9);
    objc_storeStrong((id *)&v21->_changeRegistrationsMessageName, a5);
    objc_storeStrong((id *)&v21->_updateEventsMessageName, a6);
    uint64_t v22 = v19[2](v19);
    persistentConnectionServer = v21->_persistentConnectionServer;
    v21->_persistentConnectionServer = (HMEPersistentConnectionServer *)v22;

    [(HMEPersistentConnectionServer *)v21->_persistentConnectionServer setDelegate:v21];
    [(HMEPersistentConnectionServer *)v21->_persistentConnectionServer setDataSource:v21];
  }

  return v21;
}

- (HMDXPCEventRouterServer)initWithMessageUUID:(id)a3 dataSource:(id)a4 changeRegistrationsMessageName:(id)a5 updateEventsMessageName:(id)a6 messageDispatcher:(id)a7 queue:(id)a8 notificationCenter:(id)a9 subscriptionProvider:(id)a10 registrationEventRouter:(id)a11 storeReadHandle:(id)a12
{
  id v16 = a8;
  id v17 = a10;
  id v18 = a11;
  id v19 = a12;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __217__HMDXPCEventRouterServer_initWithMessageUUID_dataSource_changeRegistrationsMessageName_updateEventsMessageName_messageDispatcher_queue_notificationCenter_subscriptionProvider_registrationEventRouter_storeReadHandle___block_invoke;
  v28[3] = &unk_264A15DD8;
  id v29 = v16;
  id v30 = v17;
  id v31 = v18;
  id v32 = v19;
  id v20 = v19;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  v24 = [(HMDXPCEventRouterServer *)self initWithMessageUUID:a3 dataSource:a4 changeRegistrationsMessageName:a5 updateEventsMessageName:a6 messageDispatcher:a7 queue:v23 notificationCenter:a9 persistentConnectionServerFactory:v28];

  return v24;
}

id __217__HMDXPCEventRouterServer_initWithMessageUUID_dataSource_changeRegistrationsMessageName_updateEventsMessageName_messageDispatcher_queue_notificationCenter_subscriptionProvider_registrationEventRouter_storeReadHandle___block_invoke(void *a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x263F493B8]) initWithQueue:a1[4] provider:a1[5] registrationEventRouter:a1[6] storeReadHandle:a1[7] logCategory:"XPCEventRouter.Server"];
  return v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_11012 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_11012, &__block_literal_global_11013);
  }
  v2 = (void *)logCategory__hmf_once_v1_11014;
  return v2;
}

void __38__HMDXPCEventRouterServer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_11014;
  logCategory__hmf_once_v1_11014 = v0;
}

@end