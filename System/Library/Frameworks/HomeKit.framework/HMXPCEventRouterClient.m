@interface HMXPCEventRouterClient
+ (id)logCategory;
- (BOOL)isActive;
- (BOOL)useBackgroundTaskAssertion;
- (HMEPersistentConnectionClient)eventRouterClient;
- (HMFMessageDispatcher)messageDispatcher;
- (HMXPCEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 messageDispatcher:(id)a5 changeRegistrationsMessageName:(id)a6 updateMessageName:(id)a7 notificationCenter:(id)a8 useBackgroundTaskAssertion:(BOOL)a9 eventRouterClientFactory:(id)a10;
- (HMXPCEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 messageDispatcher:(id)a5 changeRegistrationsMessageName:(id)a6 updateMessageName:(id)a7 storeReadHandle:(id)a8 storeWriteHandle:(id)a9 useBackgroundTaskAssertion:(BOOL)a10;
- (NSNotificationCenter)notificationCenter;
- (NSString)changeRegistrationsMessageName;
- (NSString)updateMessageName;
- (NSUUID)identifier;
- (OS_dispatch_queue)workQueue;
- (id)forwardingTopicsForTopics:(id)a3;
- (id)logIdentifier;
- (id)messageDestination;
- (unint64_t)willWriteToStore;
- (void)_handleUpdateEventsMessage:(id)a3;
- (void)configure;
- (void)finishedWritingToStore:(unint64_t)a3;
- (void)handleActiveAssertionSendState:(id)a3;
- (void)handleDidBecomeActive:(id)a3;
- (void)handleWillResignActive:(id)a3;
- (void)reconnect;
- (void)sendChangeRegistrationsMessageWithAddedFilters:(id)a3 removedFilters:(id)a4 completion:(id)a5;
- (void)setIsActive:(BOOL)a3;
@end

@implementation HMXPCEventRouterClient

void __35__HMXPCEventRouterClient_configure__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[HMXPCEventRouterClient reconnect](WeakRetained);
    id WeakRetained = v2;
  }
}

- (void)reconnect
{
  if (a1)
  {
    id v2 = [a1 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__HMXPCEventRouterClient_reconnect__block_invoke;
    block[3] = &unk_1E59452E8;
    block[4] = a1;
    dispatch_async(v2, block);
  }
}

- (HMXPCEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 messageDispatcher:(id)a5 changeRegistrationsMessageName:(id)a6 updateMessageName:(id)a7 storeReadHandle:(id)a8 storeWriteHandle:(id)a9 useBackgroundTaskAssertion:(BOOL)a10
{
  id v15 = a4;
  id v16 = a8;
  id v17 = a9;
  v18 = (void *)MEMORY[0x1E4F28EB8];
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  v23 = [v18 defaultCenter];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __185__HMXPCEventRouterClient_initWithMessageTargetUUID_queue_messageDispatcher_changeRegistrationsMessageName_updateMessageName_storeReadHandle_storeWriteHandle_useBackgroundTaskAssertion___block_invoke;
  v31[3] = &unk_1E593E680;
  id v32 = v15;
  id v33 = v16;
  id v34 = v17;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  LOBYTE(v29) = a10;
  v27 = [(HMXPCEventRouterClient *)self initWithMessageTargetUUID:v22 queue:v26 messageDispatcher:v21 changeRegistrationsMessageName:v20 updateMessageName:v19 notificationCenter:v23 useBackgroundTaskAssertion:v29 eventRouterClientFactory:v31];

  return v27;
}

- (HMXPCEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 messageDispatcher:(id)a5 changeRegistrationsMessageName:(id)a6 updateMessageName:(id)a7 notificationCenter:(id)a8 useBackgroundTaskAssertion:(BOOL)a9 eventRouterClientFactory:(id)a10
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (void (**)(void))a10;
  v29.receiver = self;
  v29.super_class = (Class)HMXPCEventRouterClient;
  id v20 = [(HMXPCEventRouterClient *)&v29 init];
  id v21 = v20;
  if (v20)
  {
    v20->_lock._os_unfair_lock_opaque = 0;
    v20->_useBackgroundTaskAssertion = a9;
    v20->_isActive = 1;
    objc_storeStrong((id *)&v20->_identifier, a3);
    objc_storeStrong((id *)&v21->_workQueue, a4);
    objc_storeStrong((id *)&v21->_messageDispatcher, a5);
    objc_storeStrong((id *)&v21->_changeRegistrationsMessageName, a6);
    objc_storeStrong((id *)&v21->_updateMessageName, a7);
    objc_storeStrong((id *)&v21->_notificationCenter, a8);
    uint64_t v22 = v19[2](v19);
    eventRouterClient = v21->_eventRouterClient;
    v21->_eventRouterClient = (HMEPersistentConnectionClient *)v22;

    -[HMEPersistentConnectionClient setDelegate:](v21->_eventRouterClient, "setDelegate:", v21, v25, v26, v27, v28);
  }

  return v21;
}

id __185__HMXPCEventRouterClient_initWithMessageTargetUUID_queue_messageDispatcher_changeRegistrationsMessageName_updateMessageName_storeReadHandle_storeWriteHandle_useBackgroundTaskAssertion___block_invoke(void *a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F69F70]) initWithQueue:a1[4] storeReadHandle:a1[5] storeWriteHandle:a1[6]];

  return v1;
}

- (id)forwardingTopicsForTopics:(id)a3
{
  return +[HMAccessoryEventTopic filterTopicsReplacingWithIndex:a3];
}

- (HMEPersistentConnectionClient)eventRouterClient
{
  return (HMEPersistentConnectionClient *)objc_getProperty(self, a2, 64, 1);
}

- (void)configure
{
  v3 = [(HMXPCEventRouterClient *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMXPCEventRouterClient_configure__block_invoke;
  block[3] = &unk_1E59452E8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

void __35__HMXPCEventRouterClient_configure__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = [*(id *)(a1 + 32) messageDispatcher];
  v3 = [v2 transport];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __35__HMXPCEventRouterClient_configure__block_invoke_2;
  id v17 = &unk_1E59455B8;
  objc_copyWeak(&v18, &location);
  [v5 registerReconnectionHandler:&v14];
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "messageDispatcher", v14, v15, v16, v17);
    v8 = [v6 updateMessageName];
    [v7 registerForMessage:v8 receiver:v6 selector:sel__handleUpdateEventsMessage_];

    v9 = *(void **)(a1 + 32);
    if (v9)
    {
      v10 = [v9 notificationCenter];
      [v10 removeObserver:v9];

      v11 = [v9 notificationCenter];
      [v11 addObserver:v9 selector:sel_handleWillResignActive_ name:*MEMORY[0x1E4F43710] object:0];

      v12 = [v9 notificationCenter];
      [v12 addObserver:v9 selector:sel_handleDidBecomeActive_ name:*MEMORY[0x1E4F43648] object:0];

      v13 = [v9 notificationCenter];
      [v13 addObserver:v9 selector:sel_handleActiveAssertionSendState_ name:@"HMActiveAssertionDidSendStateNotification" object:0];
    }
  }
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)updateMessageName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

void __35__HMXPCEventRouterClient_reconnect__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) workQueue];
    dispatch_assert_queue_V2(v2);

    if ([v1 isActive])
    {
      id v7 = [v1 eventRouterClient];
      [v7 didReconnect];
    }
    else
    {
      v3 = (void *)MEMORY[0x19F3A64A0]();
      id v4 = v1;
      id v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v9 = v6;
        _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Will not connect as not active", buf, 0xCu);
      }
    }
  }
}

- (void)handleDidBecomeActive:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(HMXPCEventRouterClient *)self isActive])
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Reconnect on active", (uint8_t *)&v9, 0xCu);
    }
    [(HMXPCEventRouterClient *)v6 setIsActive:1];
    -[HMXPCEventRouterClient reconnect](v6);
  }
}

- (BOOL)isActive
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_isActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventRouterClient, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_updateMessageName, 0);
  objc_storeStrong((id *)&self->_changeRegistrationsMessageName, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)useBackgroundTaskAssertion
{
  return self->_useBackgroundTaskAssertion;
}

- (NSString)changeRegistrationsMessageName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)handleWillResignActive:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Going dormant on becoming inactive", (uint8_t *)&v9, 0xCu);
  }
  [(HMXPCEventRouterClient *)v6 setIsActive:0];
}

- (void)handleActiveAssertionSendState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:@"HMActiveAssertionActiveStateNotificationKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      int v10 = [v9 BOOLValue];
      uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
      v12 = self;
      v13 = HMFGetOSLogHandle();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if (v14)
        {
          uint64_t v15 = HMFGetLogIdentifier();
          int v17 = 138543362;
          id v18 = v15;
          _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Received notification for active state", (uint8_t *)&v17, 0xCu);
        }
        [(HMXPCEventRouterClient *)v12 handleDidBecomeActive:v4];
      }
      else
      {
        if (v14)
        {
          id v16 = HMFGetLogIdentifier();
          int v17 = 138543362;
          id v18 = v16;
          _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Received notification for inactive state", (uint8_t *)&v17, 0xCu);
        }
        [(HMXPCEventRouterClient *)v12 handleWillResignActive:v4];
      }
    }
  }
}

- (void)_handleUpdateEventsMessage:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMXPCEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMXPCEventRouterClient *)self isActive])
  {
    v6 = [v4 messagePayload];
    id v7 = objc_msgSend(v6, "hmf_dataForKey:", @"HM.subbroker.events");

    if (v7)
    {
      v8 = [[HMXPCEventRouterProtoEventsMessage alloc] initWithData:v7];
      id v9 = (void *)MEMORY[0x19F3A64A0]();
      int v10 = self;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = HMFGetLogIdentifier();
        v13 = [(HMXPCEventRouterProtoEventsMessage *)v8 events];
        uint64_t v14 = [v13 count];
        uint64_t v15 = [(HMXPCEventRouterProtoEventsMessage *)v8 cachedEvents];
        int v30 = 138543874;
        v31 = v12;
        __int16 v32 = 2048;
        uint64_t v33 = v14;
        __int16 v34 = 2048;
        uint64_t v35 = [v15 count];
        _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Received updated events: %lu cached: %lu", (uint8_t *)&v30, 0x20u);
      }
      id v16 = [(HMXPCEventRouterProtoEventsMessage *)v8 events];
      uint64_t v17 = [v16 count];

      if (v17)
      {
        id v18 = [(HMXPCEventRouterProtoEventsMessage *)v8 events];
        uint64_t v19 = objc_msgSend(v18, "na_map:", &__block_literal_global_28);

        id v20 = [(HMXPCEventRouterClient *)v10 eventRouterClient];
        [v20 processReceivedEventsFromMessage:v19];
      }
      id v21 = [(HMXPCEventRouterProtoEventsMessage *)v8 cachedEvents];
      uint64_t v22 = [v21 count];

      if (v22)
      {
        v23 = [(HMXPCEventRouterProtoEventsMessage *)v8 cachedEvents];
        id v24 = objc_msgSend(v23, "na_map:", &__block_literal_global_30);

        id v25 = [(HMXPCEventRouterClient *)v10 eventRouterClient];
        [v25 processReceivedCachedEventsFromMessage:v24];
      }
    }
  }
  else
  {
    id v26 = (void *)MEMORY[0x19F3A64A0]();
    id v27 = self;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_super v29 = HMFGetLogIdentifier();
      int v30 = 138543362;
      v31 = v29;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Fail message as not active", (uint8_t *)&v30, 0xCu);
    }
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v4 respondWithError:v7];
  }
}

uint64_t __53__HMXPCEventRouterClient__handleUpdateEventsMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F69F40] fromProtobuff:a2];
}

uint64_t __53__HMXPCEventRouterClient__handleUpdateEventsMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F69F40] fromProtobuff:a2];
}

- (void)setIsActive:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_isActive = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)finishedWritingToStore:(unint64_t)a3
{
  if ([(HMXPCEventRouterClient *)self useBackgroundTaskAssertion])
  {
    id v4 = [MEMORY[0x1E4F42738] sharedApplication];
    [v4 endBackgroundTask:a3];
  }
}

- (unint64_t)willWriteToStore
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (![(HMXPCEventRouterClient *)self useBackgroundTaskAssertion]) {
    return 0;
  }
  v3 = [MEMORY[0x1E4F42738] sharedApplication];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__HMXPCEventRouterClient_willWriteToStore__block_invoke;
  v10[3] = &unk_1E593E6D8;
  v10[4] = self;
  v10[5] = 0;
  unint64_t v4 = [v3 beginBackgroundTaskWithName:@"HomeKitEventStore" expirationHandler:v10];

  if (v4 == *MEMORY[0x1E4F43740])
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Could not create BTA successfully", buf, 0xCu);
    }
  }
  return v4;
}

void __42__HMXPCEventRouterClient_willWriteToStore__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  unint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543618;
    v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@Background task token %lu expired", (uint8_t *)&v7, 0x16u);
  }
}

- (void)sendChangeRegistrationsMessageWithAddedFilters:(id)a3 removedFilters:(id)a4 completion:(id)a5
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(HMXPCEventRouterProtoChangeRegistrationsMessage);
  if ([v8 count])
  {
    v12 = (void *)[v8 mutableCopy];
    [(HMXPCEventRouterProtoChangeRegistrationsMessage *)v11 setTopicFilterAdditions:v12];
  }
  if ([v9 count])
  {
    uint64_t v13 = (void *)[v9 mutableCopy];
    [(HMXPCEventRouterProtoChangeRegistrationsMessage *)v11 setTopicFilterRemovals:v13];
  }
  if ([v8 count] || objc_msgSend(v9, "count"))
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F654B0];
    uint64_t v15 = [(HMXPCEventRouterClient *)self changeRegistrationsMessageName];
    id v16 = [(HMXPCEventRouterClient *)self messageDestination];
    v31 = @"HM.subbroker.payload";
    uint64_t v17 = [(HMXPCEventRouterProtoChangeRegistrationsMessage *)v11 data];
    __int16 v32 = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v19 = [v14 messageWithName:v15 destination:v16 payload:v18];

    objc_initWeak(location, self);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    id v27 = __99__HMXPCEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_completion___block_invoke;
    id v28 = &unk_1E5944188;
    objc_copyWeak(&v30, location);
    id v29 = v10;
    [v19 setResponseHandler:&v25];
    id v20 = [(HMXPCEventRouterClient *)self messageDispatcher];
    [v20 sendMessage:v19 completionHandler:0];

    objc_destroyWeak(&v30);
    objc_destroyWeak(location);
  }
  else
  {
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v24;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Expected additions or removals but have none.", (uint8_t *)location, 0xCu);
    }
    uint64_t v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    (*((void (**)(id, void, void *))v10 + 2))(v10, MEMORY[0x1E4F1CC08], v19);
  }
}

void __99__HMXPCEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __99__HMXPCEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_completion___block_invoke_2;
    v10[3] = &unk_1E5944360;
    id v11 = v5;
    v12 = v8;
    id v14 = *(id *)(a1 + 32);
    id v13 = v6;
    dispatch_async(v9, v10);
  }
}

void __99__HMXPCEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)MEMORY[0x19F3A64A0]();
    id v3 = *(id *)(a1 + 40);
    unint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 32);
      int v20 = 138543618;
      id v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to change registrations with error: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  if (*(void *)(a1 + 56))
  {
    int v7 = objc_msgSend(*(id *)(a1 + 48), "hmf_dataForKey:", @"HM.subbroker.events");
    id v8 = [[HMXPCEventRouterProtoEventsMessage alloc] initWithData:v7];
    id v9 = [MEMORY[0x1E4F1C9E8] dictionary];
    id v10 = [(HMXPCEventRouterProtoEventsMessage *)v8 cachedEvents];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      v12 = [(HMXPCEventRouterProtoEventsMessage *)v8 cachedEvents];
      id v13 = objc_msgSend(v12, "na_map:", &__block_literal_global_19);

      uint64_t v14 = [MEMORY[0x1E4F69F40] eventsMapFromEventInfos:v13];

      id v9 = (void *)v14;
    }
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = *(id *)(a1 + 40);
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = [v9 count];
      int v20 = 138543618;
      id v21 = v18;
      __int16 v22 = 2048;
      uint64_t v23 = v19;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Changed registrations and received %lu events", (uint8_t *)&v20, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __99__HMXPCEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_completion___block_invoke_16(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F69F40] fromProtobuff:a2];
}

- (id)logIdentifier
{
  id v2 = [(HMXPCEventRouterClient *)self identifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  unint64_t v4 = [(HMXPCEventRouterClient *)self messageTargetUUID];
  id v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0 != -1) {
    dispatch_once(&logCategory__hmf_once_t0, &__block_literal_global_1902);
  }
  id v2 = (void *)logCategory__hmf_once_v1;

  return v2;
}

uint64_t __37__HMXPCEventRouterClient_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1;
  logCategory__hmf_once_uint64_t v1 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end