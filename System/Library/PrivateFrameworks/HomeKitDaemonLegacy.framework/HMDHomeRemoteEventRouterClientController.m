@interface HMDHomeRemoteEventRouterClientController
- (BOOL)client:(id)a3 isIdsIdentifier:(id)a4 ofAccessory:(id)a5;
- (BOOL)clientIsEnabled:(id)a3;
- (BOOL)isCachedEventSourceCurrentProcess;
- (BOOL)isCurrentDevicePrimaryResident;
- (BOOL)isNetworkAvailable;
- (BOOL)isPrimaryResidentClientConnected;
- (BOOL)routerClientShouldRestrictMessagingToLocalOnly:(id)a3;
- (BOOL)routerClientSupportsFragmentMessageForServerIdentifier:(id)a3;
- (HMDHomeManager)homeManager;
- (HMDHomeRemoteEventRouterClientController)initWithMessageTargetUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5 requestMessageName:(id)a6 updateMessageName:(id)a7 multiHopFetchResponseMessageName:(id)a8 clientUserMessagePolicy:(id)a9 currentAccessoryUUID:(id)a10 assertionController:(id)a11;
- (HMDHomeRemoteEventRouterClientController)initWithMessageTargetUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5 routerClientFactory:(id)a6 requestMessageName:(id)a7 updateMessageName:(id)a8 multiHopFetchResponseMessageName:(id)a9 clientUserMessagePolicy:(id)a10 currentAccessoryUUID:(id)a11 assertionController:(id)a12 remoteTransportStartFuture:(id)a13 delegatingRouterFactory:(id)a14;
- (HMEDelegatingEventRouter)residentDelegatingEventRouter;
- (NSUUID)homeUUID;
- (id)client:(id)a3 forwardingTopicsForTopics:(id)a4;
- (id)delegatingRouter:(id)a3 filteredTopics:(id)a4 forRouter:(id)a5;
- (id)delegatingRouter:(id)a3 upstreamTopicsFor:(id)a4;
- (id)dumpStateDescription;
- (id)primaryResidentChangeMonitorForRouterClient:(id)a3;
- (id)routerClientMessageDestination:(id)a3 serverIdentifier:(id *)a4;
- (id)routerClientPrimaryResidentDeviceIdentifier:(id)a3;
- (void)_sendNetworkAvailableOnStartingMessaging:(uint64_t)a1;
- (void)client:(id)a3 connectDidFailWithError:(id)a4;
- (void)client:(id)a3 connectionStatusDidChange:(BOOL)a4;
- (void)client:(id)a3 didReceiveFetchedCachedEvents:(id)a4;
- (void)createResidentRouterForAccessoryUUID:(id)a3;
- (void)delegatingRouter:(id)a3 fetchCachedEventsForTopics:(id)a4 forRouter:(id)a5 cachedEventCollection:(id)a6;
- (void)discoverPrimaryResidentForEventRouterClient:(id)a3;
- (void)fetchWithFilters:(id)a3 completion:(id)a4;
- (void)networkAvailabilityDidChange:(BOOL)a3;
- (void)removeResidentRouterForAccessoryUUID:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)updateCurrentAccessoryUUID:(id)a3;
@end

@implementation HMDHomeRemoteEventRouterClientController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteTransportStartFuture, 0);
  objc_storeStrong((id *)&self->_currentAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_residentClients, 0);
  objc_storeStrong((id *)&self->_remoteEventRouterPrimaryResidentClient, 0);
  objc_storeStrong((id *)&self->_routerClientFactory, 0);
  objc_storeStrong((id *)&self->_clientUserMessagePolicy, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_multiHopFetchResponseMessageName, 0);
  objc_storeStrong((id *)&self->_updateMessageName, 0);
  objc_storeStrong((id *)&self->_requestMessageName, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_residentDelegatingEventRouter, 0);
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (HMEDelegatingEventRouter)residentDelegatingEventRouter
{
  return (HMEDelegatingEventRouter *)objc_getProperty(self, a2, 16, 1);
}

- (void)delegatingRouter:(id)a3 fetchCachedEventsForTopics:(id)a4 forRouter:(id)a5 cachedEventCollection:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([(HMDHomeRemoteEventRouterClientController *)self isCurrentDevicePrimaryResident])
  {
    id v12 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      id v16 = self ? objc_getProperty(self, v15, 96, 1) : 0;
      id v17 = [v16 eventRouterClient];

      if (v14 != v17)
      {
        uint64_t v18 = objc_msgSend(v9, "na_filter:", &__block_literal_global_88);

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v30 = v10;
        v31 = (void *)v18;
        if (self)
        {
          v20 = self;
          id Property = objc_getProperty(self, v19, 104, 1);
        }
        else
        {
          v20 = 0;
          id Property = 0;
        }
        id v22 = Property;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v35 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              id v28 = [v27 eventRouterClient];

              if (v14 == v28)
              {
                [v11 willAddAdditionalEvents];
                v29 = [v27 eventRouterClient];
                v32[0] = MEMORY[0x1E4F143A8];
                v32[1] = 3221225472;
                v32[2] = __120__HMDHomeRemoteEventRouterClientController_delegatingRouter_fetchCachedEventsForTopics_forRouter_cachedEventCollection___block_invoke_2;
                v32[3] = &unk_1E6A08400;
                v32[4] = v20;
                v32[5] = v27;
                id v33 = v11;
                [v27 client:v29 fetchWithFilters:v31 isMultiHop:0 completion:v32];
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v24);
        }

        id v10 = v30;
        id v9 = v31;
      }
    }
  }
}

void __120__HMDHomeRemoteEventRouterClientController_delegatingRouter_fetchCachedEventsForTopics_forRouter_cachedEventCollection___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 40);
      int v17 = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch events from router: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  v15 = *(void **)(a1 + 48);
  id v16 = objc_msgSend(v8, "na_map:", &__block_literal_global_92);
  [v15 addEventInfoItems:v16];

  [*(id *)(a1 + 48) didFinishAddingAdditionalEvents];
}

id __120__HMDHomeRemoteEventRouterClientController_delegatingRouter_fetchCachedEventsForTopics_forRouter_cachedEventCollection___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  v4 = (objc_class *)MEMORY[0x1E4F69F40];
  id v5 = a3;
  id v6 = a2;
  id v7 = (void *)[[v4 alloc] initWithEvent:v5 topic:v6];

  return v7;
}

uint64_t __120__HMDHomeRemoteEventRouterClientController_delegatingRouter_fetchCachedEventsForTopics_forRouter_cachedEventCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F2E7A0] decodeTopic:a2];
  uint64_t v3 = [v2 isIndexTopic] ^ 1;

  return v3;
}

- (id)delegatingRouter:(id)a3 upstreamTopicsFor:(id)a4
{
  return +[HMDHomeEventsGenerated upstreamTopicsForTopic:a4];
}

- (id)delegatingRouter:(id)a3 filteredTopics:(id)a4 forRouter:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v11 = v9;
  if (!v11)
  {
LABEL_19:
    id v23 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_25;
  }
  if (self) {
    id Property = objc_getProperty(self, v10, 96, 1);
  }
  else {
    id Property = 0;
  }
  id v13 = [Property eventRouterClient];

  if (v11 != v13)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    if (self) {
      id v15 = objc_getProperty(self, v14, 104, 1);
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          objc_msgSend(v21, "eventRouterClient", (void)v29);
          id v22 = (id)objc_claimAutoreleasedReturnValue();

          if (v22 == v11)
          {
            uint64_t v24 = [v21 accessoryUUID];
            uint64_t v25 = [(HMDHomeRemoteEventRouterClientController *)self homeUUID];
            id v23 = +[HMDAccessoryEventsGenerated forwardingTopicsForTopics:v7 residentAccessoryUUID:v24 homeUUID:v25];

            goto LABEL_24;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    goto LABEL_19;
  }
  if (self && (id v26 = objc_getProperty(self, v14, 112, 1)) != 0)
  {
    id v16 = v26;
    id v23 = +[HMDAccessoryEventsGenerated topicsRemovingAccessoryTopics:v7 accessoryUUID:objc_getProperty(self, v27, 112, 1)];
LABEL_24:
  }
  else
  {
    id v23 = v7;
  }
LABEL_25:

  return v23;
}

- (BOOL)isCachedEventSourceCurrentProcess
{
  return 0;
}

- (void)client:(id)a3 didReceiveFetchedCachedEvents:(id)a4
{
  id v6 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  [WeakRetained clientController:self didReceiveFetchedCachedEvents:v6 source:self];
}

- (void)client:(id)a3 connectDidFailWithError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v9 && (isKindOfClass & 1) != 0)
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    }
    else {
      id WeakRetained = 0;
    }
    [WeakRetained clientController:self primaryClientConnectMessageFailWithError:v6];
  }
}

- (void)client:(id)a3 connectionStatusDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v9;
  if (v9 && (isKindOfClass & 1) != 0)
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    }
    else {
      id WeakRetained = 0;
    }
    [WeakRetained clientController:self connectionStatusDidChange:v4];

    id v7 = v9;
  }
  MEMORY[0x1F41817F8](isKindOfClass, v7);
}

- (BOOL)client:(id)a3 isIdsIdentifier:(id)a4 ofAccessory:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  id v10 = [WeakRetained deviceForAccessoryUUID:v8 forRemoteEventRouterClientController:self];

  id v11 = [v10 deviceAddress];
  id v12 = [v11 idsIdentifier];
  char v13 = objc_msgSend(v12, "hmf_isEqualToUUID:", v7);

  return v13;
}

- (BOOL)clientIsEnabled:(id)a3
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  char v5 = [WeakRetained isCurrentUserRestrictedForRemoteEventRouterClientController:self] ^ 1;

  return v5;
}

- (void)discoverPrimaryResidentForEventRouterClient:(id)a3
{
  uint64_t v3 = self;
  if (self) {
    self = (HMDHomeRemoteEventRouterClientController *)objc_loadWeakRetained((id *)&self->_dataSource);
  }
  BOOL v4 = self;
  [(HMDHomeRemoteEventRouterClientController *)self discoverPrimaryResidentForEventRouterClientController:v3];
}

- (id)client:(id)a3 forwardingTopicsForTopics:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDHomeRemoteEventRouterClientController *)self homeManager];
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    id v8 = [v5 allObjects];
    id v9 = +[HMDHomeEventsGenerated expandedTopicsWithTopics:v8 homeManager:v6];
    id v10 = [v7 setWithArray:v9];
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

- (BOOL)routerClientShouldRestrictMessagingToLocalOnly:(id)a3
{
  return 0;
}

- (BOOL)routerClientSupportsFragmentMessageForServerIdentifier:(id)a3
{
  return 1;
}

- (id)primaryResidentChangeMonitorForRouterClient:(id)a3
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  id v5 = [WeakRetained primaryResidentChangeMonitorForRemoteEventRouterClientController:self];

  return v5;
}

- (id)routerClientPrimaryResidentDeviceIdentifier:(id)a3
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  id v5 = [WeakRetained primaryResidentDeviceIdentifierForRemoteEventRouterClientController:self];

  return v5;
}

- (BOOL)isNetworkAvailable
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  char v4 = [WeakRetained isNetworkAvailableForRemoteEventRouterClientController:self];

  return v4;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  }
  else {
    id WeakRetained = 0;
  }
  char v4 = [WeakRetained isCurrentDevicePrimaryResidentForRemoteEventRouterClientController:self];

  return v4;
}

- (id)routerClientMessageDestination:(id)a3 serverIdentifier:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (self)
  {
    id Property = objc_getProperty(self, v6, 32, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v10 = objc_getProperty(self, v9, 40, 1);
    if (objc_getProperty(self, v11, 96, 1) != v7)
    {
      long long v29 = a4;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v13 = objc_getProperty(self, v12, 104, 1);
      goto LABEL_4;
    }
  }
  else
  {
    long long v29 = a4;
    dispatch_assert_queue_V2(0);
    if (v7)
    {
      id v10 = 0;
      id WeakRetained = 0;
      id v13 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
LABEL_4:
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = 0;
        uint64_t v18 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v32 != v18) {
              objc_enumerationMutation(v14);
            }
            if (*(id *)(*((void *)&v31 + 1) + 8 * i) == v7)
            {
              uint64_t v20 = [v7 accessoryUUID];
              uint64_t v21 = [WeakRetained deviceForAccessoryUUID:v20 forRemoteEventRouterClientController:self];

              uint64_t v22 = [v7 identifier];

              uint64_t v17 = (void *)v21;
              id v10 = (id)v22;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v16);
      }
      else
      {
        uint64_t v17 = 0;
      }

      a4 = v29;
      if (v17) {
        goto LABEL_16;
      }
      goto LABEL_21;
    }
    id WeakRetained = 0;
    id v10 = 0;
  }
  uint64_t v17 = objc_msgSend(WeakRetained, "deviceForPrimaryResidentForRemoteEventRouterClientController:", self, v29);
  if (v17)
  {
LABEL_16:
    objc_msgSend(v17, "identifier", v29);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = [[HMDRemoteDeviceMessageDestination alloc] initWithTarget:v10 device:v17];
    goto LABEL_24;
  }
LABEL_21:
  uint64_t v24 = (void *)MEMORY[0x1D9452090]();
  uint64_t v25 = self;
  id v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v36 = v27;
    __int16 v37 = 2112;
    id v38 = v7;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine destination for event router client: %@", buf, 0x16u);
  }
  id v23 = 0;
LABEL_24:

  return v23;
}

- (void)fetchWithFilters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = objc_getProperty(self, v7, 32, 1);
  }
  else {
    id Property = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HMDHomeRemoteEventRouterClientController_fetchWithFilters_completion___block_invoke;
  block[3] = &unk_1E6A193D0;
  block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(Property, block);
}

void __72__HMDHomeRemoteEventRouterClientController_fetchWithFilters_completion___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v25 = *(id *)(a1 + 40);
  id v23 = v2;
  if (v1)
  {
    id Property = objc_getProperty(v1, v3, 32, 1);
    dispatch_assert_queue_V2(Property);
    if ([v1 isCurrentDevicePrimaryResident])
    {
      id v6 = dispatch_group_create();
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x3032000000;
      v36[3] = __Block_byref_object_copy__20883;
      v36[4] = __Block_byref_object_dispose__20884;
      id v37 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = objc_getProperty(v1, v7, 104, 1);
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v33;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v33 != v9) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
            id v12 = objc_msgSend(v1, "residentDelegatingEventRouter", v23);
            id v13 = [v11 eventRouter];
            id v14 = [v13 synchronousSubscriptionProvider];
            uint64_t v15 = [v1 delegatingRouter:v12 filteredTopics:v25 forRouter:v14];

            uint64_t v16 = objc_msgSend(v15, "na_filter:", &__block_literal_global_20885);

            if ([v16 count])
            {
              dispatch_group_enter(v6);
              uint64_t v17 = [v11 eventRouterClient];
              v29[0] = MEMORY[0x1E4F143A8];
              v29[1] = 3221225472;
              v29[2] = __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke_3;
              v29[3] = &unk_1E6A083D8;
              long long v31 = v36;
              v29[4] = v1;
              v29[5] = v11;
              long long v30 = v6;
              [v11 client:v17 fetchWithFilters:v16 isMultiHop:0 completion:v29];
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v8);
      }

      uint64_t v19 = objc_getProperty(v1, v18, 32, 1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke_81;
      block[3] = &unk_1E6A15810;
      id v27 = v23;
      id v28 = v36;
      dispatch_group_notify(v6, v19, block);

      _Block_object_dispose(v36, 8);
    }
    else
    {
      id v20 = objc_getProperty(v1, v5, 96, 1);
      uint64_t v22 = objc_msgSend(objc_getProperty(v1, v21, 96, 1), "eventRouterClient");
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke;
      v38[3] = &unk_1E6A083B0;
      uint64_t v39 = v23;
      [v20 client:v22 fetchWithFilters:v25 isMultiHop:1 completion:v38];

      id v6 = v39;
    }
  }
}

uint64_t __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void *)(v11 + 40);
  id v12 = (id *)(v11 + 40);
  if (!v13) {
    objc_storeStrong(v12, a4);
  }
  os_unfair_lock_unlock(v10);
  if (v9)
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(a1 + 40);
      int v19 = 138543618;
      id v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch events from router: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t __73__HMDHomeRemoteEventRouterClientController__fetchWithFilters_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F2E7A0] decodeTopic:a2];
  uint64_t v3 = [v2 isIndexTopic] ^ 1;

  return v3;
}

- (id)dumpStateDescription
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v4 = [MEMORY[0x1E4F28E78] stringWithString:@"[HMDHomeRemoteEventRouterClientController"];
  if (self)
  {
    id v5 = objc_msgSend(objc_getProperty(self, v3, 96, 1), "dumpStateDescription");
    [v4 appendFormat:@" primary resident client:%@", v5];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id Property = objc_getProperty(self, v6, 104, 1);
  }
  else
  {
    uint64_t v16 = [0 dumpStateDescription];
    [v4 appendFormat:@" primary resident client:%@", v16];

    id Property = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
  }
  id v8 = Property;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dumpStateDescription];
        [v4 appendFormat:@" resident client:%@", v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  [v4 appendString:@"]"];
  id v14 = (void *)[v4 copy];

  return v14;
}

- (BOOL)isPrimaryResidentClientConnected
{
  if (self)
  {
    self = (HMDHomeRemoteEventRouterClientController *)objc_getProperty(self, a2, 96, 1);
    uint64_t v2 = vars8;
  }
  return [(HMDHomeRemoteEventRouterClientController *)self isConnected];
}

- (void)networkAvailabilityDidChange:(BOOL)a3
{
  char v4 = self;
  if (self) {
    self = (HMDHomeRemoteEventRouterClientController *)objc_getProperty(self, a2, 32, 1);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__HMDHomeRemoteEventRouterClientController_networkAvailabilityDidChange___block_invoke;
  v5[3] = &unk_1E6A19B58;
  v5[4] = v4;
  BOOL v6 = a3;
  dispatch_async(&self->super, v5);
}

uint64_t __73__HMDHomeRemoteEventRouterClientController_networkAvailabilityDidChange___block_invoke(uint64_t result, const char *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(result + 32);
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(result + 40);
    id Property = objc_getProperty(*(id *)(result + 32), a2, 32, 1);
    dispatch_assert_queue_V2(Property);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = objc_getProperty(v2, v5, 104, 1);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "networkAvailabilityDidChange:", v3 != 0, (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    return objc_msgSend(objc_getProperty(v2, v11, 96, 1), "networkAvailabilityDidChange:", v3 != 0);
  }
  return result;
}

- (void)removeResidentRouterForAccessoryUUID:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__HMDHomeRemoteEventRouterClientController_removeResidentRouterForAccessoryUUID___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __81__HMDHomeRemoteEventRouterClientController_removeResidentRouterForAccessoryUUID___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v1 = *(id **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v1)
  {
    id Property = objc_getProperty(v1, v2, 32, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained(v1 + 9);
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      if ([WeakRetained isMessagedHomepodSettingsEnabledForClientController:v1]
        && [v6 isCurrentDeviceResidentCapableForRemoteEventRouterClientController:v1])
      {
        id v27 = v6;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v8 = objc_msgSend(objc_getProperty(v1, v7, 104, 1), "copy");
        uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:buf count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          SEL v11 = 0;
          uint64_t v12 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v29 != v12) {
                objc_enumerationMutation(v8);
              }
              long long v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              long long v15 = [v14 accessoryUUID];
              int v16 = objc_msgSend(v15, "hmf_isEqualToUUID:", v3);

              if (v16)
              {
                id v17 = v14;

                SEL v11 = v17;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:buf count:16];
          }
          while (v10);
        }
        else
        {
          SEL v11 = 0;
        }

        uint64_t v22 = (void *)MEMORY[0x1D9452090]();
        uint64_t v23 = v1;
        uint64_t v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v25 = HMFGetLogIdentifier();
          *(_DWORD *)long long v32 = 138543874;
          long long v33 = v25;
          __int16 v34 = 2112;
          long long v35 = v11;
          __int16 v36 = 2112;
          id v37 = v3;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Removing %@ client resident event router(s) for accessory: %@", v32, 0x20u);
        }
        objc_msgSend(objc_getProperty(v23, v26, 104, 1), "removeObject:", v11);

        id v6 = v27;
      }
    }
    else
    {
      long long v18 = (void *)MEMORY[0x1D9452090]();
      long long v19 = v1;
      long long v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int16 v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v21;
        __int16 v40 = 2112;
        id v41 = v3;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot create resident router for accessory: %@ due to nil datasource", buf, 0x16u);
      }
    }
  }
}

- (void)createResidentRouterForAccessoryUUID:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__HMDHomeRemoteEventRouterClientController_createResidentRouterForAccessoryUUID___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __81__HMDHomeRemoteEventRouterClientController_createResidentRouterForAccessoryUUID___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v1 = *(id **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v1)
  {
    id Property = objc_getProperty(v1, v2, 32, 1);
    dispatch_assert_queue_V2(Property);
    id WeakRetained = objc_loadWeakRetained(v1 + 9);
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      if ([WeakRetained isMessagedHomepodSettingsEnabledForClientController:v1]
        && [v6 isCurrentDeviceResidentCapableForRemoteEventRouterClientController:v1])
      {
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v8 = objc_getProperty(v1, v7, 104, 1);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v55 objects:v66 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v56;
          while (2)
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v56 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = [*(id *)(*((void *)&v55 + 1) + 8 * i) accessoryUUID];
              int v14 = objc_msgSend(v13, "hmf_isEqualToUUID:", v3);

              if (v14)
              {
                v48 = (void *)MEMORY[0x1D9452090]();
                v49 = v1;
                v50 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                {
                  v51 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v60 = v51;
                  __int16 v61 = 2112;
                  id v62 = v3;
                  _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_INFO, "%{public}@Not creating resident router for accessory (%@) as it already exists.", buf, 0x16u);
                }

                goto LABEL_22;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v55 objects:v66 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        v54 = [v6 messageDispatcherForRemoteEventRouterClientController:v1];
        v53 = [v6 notificationCenterForRemoteEventRouterClientController:v1];
        uint64_t v15 = [v6 eventStoreReadHandleForRemoteEventRouterClientController:v1];
        int v16 = [v6 eventStoreWriteHandleForRemoteEventRouterClientController:v1];
        id v18 = objc_getProperty(v1, v17, 88, 1);
        id v20 = objc_getProperty(v1, v19, 40, 1);
        id v22 = objc_getProperty(v1, v21, 32, 1);
        id v24 = objc_getProperty(v1, v23, 48, 1);
        id v26 = objc_getProperty(v1, v25, 56, 1);
        v52 = (void *)v15;
        long long v28 = objc_msgSend(v18, "residentClientWithAccessoryUUID:homeUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:storeReadHandle:storeWriteHandle:", v3, v20, v22, v1, v54, v53, v24, v26, objc_getProperty(v1, v27, 64, 1), v15, v16);

        uint64_t v29 = [v1 isCurrentDevicePrimaryResident];
        uint64_t v30 = [v1 isNetworkAvailable];
        id v65 = objc_getProperty(v1, v31, 80, 1);
        long long v32 = (void *)MEMORY[0x1E4F1C978];
        id v33 = v65;
        __int16 v34 = [v32 arrayWithObjects:&v65 count:1];

        [v28 configureIsPrimaryResident:v29 networkAvailable:v30 additionalPolicies:v34];
        -[HMDHomeRemoteEventRouterClientController _sendNetworkAvailableOnStartingMessaging:]((uint64_t)v1, v28);
        long long v35 = [v1 residentDelegatingEventRouter];
        __int16 v36 = [v28 eventRouter];
        id v37 = [v36 synchronousSubscriptionProvider];
        [v35 registerSubRouter:v37];

        uint64_t v39 = objc_msgSend(objc_getProperty(v1, v38, 104, 1), "addObject:", v28);
        __int16 v40 = (void *)MEMORY[0x1D9452090](v39);
        id v41 = v1;
        uint64_t v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v60 = v43;
          __int16 v61 = 2112;
          id v62 = v3;
          __int16 v63 = 2112;
          v64 = v28;
          _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Created resident router for accessory: %@, client: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      v44 = (void *)MEMORY[0x1D9452090]();
      v45 = v1;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = HMFGetLogIdentifier();
        *(_DWORD *)v66 = 138543618;
        v67 = v47;
        __int16 v68 = 2112;
        id v69 = v3;
        _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@Cannot create resident router for accessory: %@ due to nil datasource", v66, 0x16u);
      }
    }
LABEL_22:
  }
}

- (void)_sendNetworkAvailableOnStartingMessaging:(uint64_t)a1
{
  id v3 = a2;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__20883;
  v9[4] = __Block_byref_object_dispose__20884;
  id v4 = *(id *)(a1 + 120);
  id v10 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__HMDHomeRemoteEventRouterClientController__sendNetworkAvailableOnStartingMessaging___block_invoke;
  v6[3] = &unk_1E6A08388;
  v6[4] = a1;
  id v5 = v3;
  id v7 = v5;
  id v8 = v9;
  [v4 getResultWithCompletion:v6];

  _Block_object_dispose(v9, 8);
}

void __85__HMDHomeRemoteEventRouterClientController__sendNetworkAvailableOnStartingMessaging___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v7 + 72));
      uint64_t v9 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v9 = 0;
      id WeakRetained = 0;
    }
    int v10 = [WeakRetained isNetworkAvailableForRemoteEventRouterClientController:v9];

    if (v10)
    {
      uint64_t v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = *(id *)(a1 + 32);
      long long v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = HMFGetLogIdentifier();
        uint64_t v15 = *(void *)(a1 + 40);
        int v18 = 138543618;
        SEL v19 = v14;
        __int16 v20 = 2112;
        uint64_t v21 = v15;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Mark network as available on transport start %@", (uint8_t *)&v18, 0x16u);
      }
      [*(id *)(a1 + 40) networkAvailabilityDidChange:1];
    }
  }
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  SEL v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = 0;
}

- (void)updateCurrentAccessoryUUID:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__HMDHomeRemoteEventRouterClientController_updateCurrentAccessoryUUID___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __71__HMDHomeRemoteEventRouterClientController_updateCurrentAccessoryUUID___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 112, 1);
  }
  if ((objc_msgSend(Property, "hmf_isEqualToUUID:", *(void *)(a1 + 40)) & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id v6 = *(void **)(a1 + 40);
      objc_setProperty_atomic(v5, v4, v6, 112);
    }
  }
}

- (NSUUID)homeUUID
{
  if (self)
  {
    self = (HMDHomeRemoteEventRouterClientController *)objc_getProperty(self, a2, 40, 1);
    uint64_t v2 = vars8;
  }
  return (NSUUID *)self;
}

- (HMDHomeRemoteEventRouterClientController)initWithMessageTargetUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5 routerClientFactory:(id)a6 requestMessageName:(id)a7 updateMessageName:(id)a8 multiHopFetchResponseMessageName:(id)a9 clientUserMessagePolicy:(id)a10 currentAccessoryUUID:(id)a11 assertionController:(id)a12 remoteTransportStartFuture:(id)a13 delegatingRouterFactory:(id)a14
{
  v63[1] = *(id *)MEMORY[0x1E4F143B8];
  id v61 = a3;
  id obj = a4;
  id v60 = a4;
  id v55 = a5;
  id v19 = a8;
  id v59 = a6;
  id v58 = a7;
  id v57 = a8;
  id v56 = a9;
  id v54 = a10;
  id v53 = a11;
  id v20 = a12;
  id v52 = a13;
  uint64_t v21 = (void (**)(id, HMDHomeRemoteEventRouterClientController *))a14;
  v62.receiver = self;
  v62.super_class = (Class)HMDHomeRemoteEventRouterClientController;
  uint64_t v22 = [(HMDHomeRemoteEventRouterClientController *)&v62 init];
  SEL v23 = v22;
  if (v22)
  {
    v22->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v22->_workQueue, obj);
    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    residentClients = v23->_residentClients;
    v23->_residentClients = (NSMutableArray *)v24;

    objc_storeStrong((id *)&v23->_messageTargetUUID, a3);
    objc_storeStrong((id *)&v23->_currentAccessoryUUID, a11);
    objc_storeWeak((id *)&v23->_dataSource, v55);
    objc_storeStrong((id *)&v23->_requestMessageName, a7);
    objc_storeStrong((id *)&v23->_updateMessageName, v19);
    objc_storeStrong((id *)&v23->_multiHopFetchResponseMessageName, a9);
    objc_storeStrong((id *)&v23->_clientUserMessagePolicy, a10);
    objc_storeStrong((id *)&v23->_routerClientFactory, a6);
    uint64_t v26 = v21[2](v21, v23);
    residentDelegatingEventRouter = v23->_residentDelegatingEventRouter;
    v23->_residentDelegatingEventRouter = (HMEDelegatingEventRouter *)v26;

    objc_storeStrong((id *)&v23->_remoteTransportStartFuture, a13);
    uint64_t v28 = [v55 messageDispatcherForRemoteEventRouterClientController:v23];
    v49 = [v55 notificationCenterForRemoteEventRouterClientController:v23];
    v51 = v20;
    uint64_t v29 = [v55 eventStoreReadHandleForRemoteEventRouterClientController:v23];
    uint64_t v30 = [v55 eventStoreWriteHandleForRemoteEventRouterClientController:v23];
    SEL v31 = (void *)v28;
    uint64_t v32 = [v59 primaryResidentClientWithMessageTargetUUID:v61 queue:v60 dataSource:v23 messageDispatcher:v28 notificationCenter:v49 requestMessageName:v58 updateMessageName:v57 multiHopFetchResponseMessageName:v56 storeReadHandle:v29 storeWriteHandle:v30];
    remoteEventRouterPrimaryResidentClient = v23->_remoteEventRouterPrimaryResidentClient;
    v23->_remoteEventRouterPrimaryResidentClient = (HMDRemoteEventRouterPrimaryResidentClient *)v32;

    __int16 v34 = v23->_remoteEventRouterPrimaryResidentClient;
    uint64_t v35 = [(HMDHomeRemoteEventRouterClientController *)v23 isCurrentDevicePrimaryResident];
    uint64_t v36 = [(HMDHomeRemoteEventRouterClientController *)v23 isNetworkAvailable];
    v63[0] = objc_getProperty(v23, v37, 80, 1);
    SEL v38 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v39 = v21;
    id v40 = v63[0];
    id v41 = [v38 arrayWithObjects:v63 count:1];
    [(HMDRemoteEventRouterClient *)v34 configureIsPrimaryResident:v35 networkAvailable:v36 additionalPolicies:v41];

    [v51 registerClient:v23->_remoteEventRouterPrimaryResidentClient];
    uint64_t v42 = v23->_residentDelegatingEventRouter;
    v43 = [(HMDRemoteEventRouterClient *)v23->_remoteEventRouterPrimaryResidentClient eventRouter];
    v44 = [v43 synchronousSubscriptionProvider];
    v45 = v42;
    uint64_t v21 = v39;
    [(HMEDelegatingEventRouter *)v45 registerSubRouter:v44];

    [(HMDHomeRemoteEventRouterClientController *)(uint64_t)v23 _sendNetworkAvailableOnStartingMessaging:v23->_remoteEventRouterPrimaryResidentClient];
    id v20 = v51;
  }
  return v23;
}

- (HMDHomeRemoteEventRouterClientController)initWithMessageTargetUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5 requestMessageName:(id)a6 updateMessageName:(id)a7 multiHopFetchResponseMessageName:(id)a8 clientUserMessagePolicy:(id)a9 currentAccessoryUUID:(id)a10 assertionController:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v29 = a11;
  id v28 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  SEL v23 = objc_alloc_init(HMDHomeRemoteEventRouterClientFactory);
  uint64_t v30 = +[HMDSecureRemoteMessageTransport defaultTransport];
  SEL v27 = [v30 startFuture];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __226__HMDHomeRemoteEventRouterClientController_initWithMessageTargetUUID_workQueue_dataSource_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_clientUserMessagePolicy_currentAccessoryUUID_assertionController___block_invoke;
  v33[3] = &unk_1E6A08360;
  id v34 = v16;
  id v35 = v17;
  id v24 = v17;
  id v25 = v16;
  uint64_t v32 = [(HMDHomeRemoteEventRouterClientController *)self initWithMessageTargetUUID:v25 workQueue:v24 dataSource:v22 routerClientFactory:v23 requestMessageName:v21 updateMessageName:v20 multiHopFetchResponseMessageName:v19 clientUserMessagePolicy:v18 currentAccessoryUUID:v28 assertionController:v29 remoteTransportStartFuture:v27 delegatingRouterFactory:v33];

  return v32;
}

id __226__HMDHomeRemoteEventRouterClientController_initWithMessageTargetUUID_workQueue_dataSource_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_clientUserMessagePolicy_currentAccessoryUUID_assertionController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 UUIDString];
  id v6 = [@"Client.EventRouter.Delegating." stringByAppendingString:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F69F30]);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = v6;
  int v10 = objc_msgSend(v7, "initWithQueue:dataSource:storeReadHandle:logCategory:identifier:", v8, v4, 0, objc_msgSend(v9, "UTF8String"), *(void *)(a1 + 32));

  return v10;
}

@end