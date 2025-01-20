@interface COStateService
+ (id)serviceWithDelegate:(id)a3;
- (BOOL)_applicableToCluster:(id)a3;
- (COEndpointMonitor)endpointMonitor;
- (COStateService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5;
- (NSDictionary)connectedClients;
- (double)doorbellDelay;
- (id)_stateSetByClientsForAddOn:(id)a3;
- (id)_stateSetByClientsForSuite:(id)a3 cluster:(id)a4;
- (void)_addOnAdded:(id)a3;
- (void)_addOnRemoved:(id)a3;
- (void)_checkinClientWithSuite:(id)a3 clusters:(id)a4;
- (void)_cleanupDisconnectedClient:(id)a3;
- (void)_clientLost:(id)a3;
- (void)_configureServiceInterfacesOnConnection:(id)a3;
- (void)_informClientsOfUpdates:(id)a3 removals:(id)a4 inCluster:(id)a5;
- (void)_setIsWriting:(BOOL)a3 forClient:(id)a4;
- (void)addObserverWithPredicate:(id)a3 suite:(id)a4 interestClusters:(id)a5;
- (void)addOn:(id)a3 receivedUpdates:(id)a4 removals:(id)a5;
- (void)compositionForCluster:(id)a3 withCallback:(id)a4;
- (void)doorbellDelayWithCallback:(id)a3;
- (void)endpointAvailableInHomeChanged:(BOOL)a3;
- (void)removeKeyPaths:(id)a3 targetClusters:(id)a4 withCallback:(id)a5;
- (void)removeObserverWithPredicate:(id)a3;
- (void)requestCompositionForCluster:(id)a3 withCallback:(id)a4;
- (void)setConnectedClients:(id)a3;
- (void)setDictionary:(id)a3 suite:(id)a4 interestClusters:(id)a5 targetCluster:(id)a6 withCallback:(id)a7;
- (void)setDoorbellDelay:(double)a3;
- (void)setEndpointMonitor:(id)a3;
- (void)stateForAddOn:(id)a3 withCallback:(id)a4;
@end

@implementation COStateService

+ (id)serviceWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [[COServiceListenerProvider alloc] initWithServiceName:@"com.apple.coordination.state" entitlement:@"com.apple.private.coordination.state"];
  v5 = objc_alloc_init(COStateAddOnProvider);
  v6 = [[COStateService alloc] initWithListenerProvider:v4 addOnProvider:v5 delegate:v3];

  return v6;
}

- (COStateService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)COStateService;
  v5 = [(COService *)&v11 initWithListenerProvider:a3 addOnProvider:a4 delegate:a5];
  if (v5)
  {
    v6 = (NSDictionary *)objc_alloc_init(NSDictionary);
    connectedClients = v5->_connectedClients;
    v5->_connectedClients = v6;

    v5->_doorbellDelay = 0.2;
    v8 = objc_alloc_init(COEndpointMonitor);
    endpointMonitor = v5->_endpointMonitor;
    v5->_endpointMonitor = v8;

    [(COEndpointMonitor *)v5->_endpointMonitor setDelegate:v5];
    [(COEndpointMonitor *)v5->_endpointMonitor startMonitoring];
    [(COService *)v5 _serviceReady];
  }
  return v5;
}

- (void)_clientLost:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COStateService;
  id v4 = a3;
  [(COService *)&v5 _clientLost:v4];
  -[COStateService _cleanupDisconnectedClient:](self, "_cleanupDisconnectedClient:", v4, v5.receiver, v5.super_class);
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)COStateService;
  id v4 = a3;
  [(COService *)&v21 _configureServiceInterfacesOnConnection:v4];
  objc_super v5 = (void *)MEMORY[0x263F08D80];
  v6 = &unk_26D3F6A48;
  v7 = objc_msgSend(v5, "interfaceWithProtocol:", v6, v21.receiver, v21.super_class);
  v8 = [MEMORY[0x263F33F40] _allowedClusterClasses];
  [v7 setClasses:v8 forSelector:sel_requestCompositionForCluster_withCallback_ argumentIndex:0 ofReply:0];

  v9 = [MEMORY[0x263F33F40] _allowedClusterClasses];
  v10 = [v9 setByAddingObject:objc_opt_class()];

  [v7 setClasses:v10 forSelector:sel_addObserverWithPredicate_suite_interestClusters_ argumentIndex:2 ofReply:0];
  [v7 setClasses:v10 forSelector:sel_setDictionary_suite_interestClusters_targetCluster_withCallback_ argumentIndex:2 ofReply:0];
  [v7 setClasses:v10 forSelector:sel_setDictionary_suite_interestClusters_targetCluster_withCallback_ argumentIndex:3 ofReply:0];
  [v7 setClasses:v10 forSelector:sel_removeKeyPaths_targetClusters_withCallback_ argumentIndex:1 ofReply:0];
  objc_super v11 = [v7 classesForSelector:sel_setDictionary_suite_interestClusters_targetCluster_withCallback_ argumentIndex:0 ofReply:1];

  v12 = [MEMORY[0x263F33F40] _allowedClusterClasses];
  v13 = [v11 setByAddingObjectsFromSet:v12];

  [v7 setClasses:v13 forSelector:sel_setDictionary_suite_interestClusters_targetCluster_withCallback_ argumentIndex:0 ofReply:1];
  v14 = [v7 classesForSelector:sel_removeKeyPaths_targetClusters_withCallback_ argumentIndex:0 ofReply:1];

  v15 = [MEMORY[0x263F33F40] _allowedClusterClasses];
  v16 = [v14 setByAddingObjectsFromSet:v15];

  [v7 setClasses:v16 forSelector:sel_removeKeyPaths_targetClusters_withCallback_ argumentIndex:0 ofReply:1];
  [v4 setExportedInterface:v7];
  [v4 setExportedObject:self];
  v17 = &unk_26D406500;

  v18 = [MEMORY[0x263F08D80] interfaceWithProtocol:v17];

  v19 = [v18 classesForSelector:sel_changesObserved_forPredicate_ argumentIndex:0 ofReply:0];

  v20 = [v19 setByAddingObject:objc_opt_class()];

  [v18 setClasses:v20 forSelector:sel_changesObserved_forPredicate_ argumentIndex:0 ofReply:0];
  [v4 setRemoteObjectInterface:v18];
}

- (void)_addOnAdded:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(COService *)self _clustersForAddOn:v4];
  v6 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218498;
    v9 = self;
    __int16 v10 = 2048;
    id v11 = v4;
    __int16 v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p AddOn %p added for clusters %@. Seeding mesh state", (uint8_t *)&v8, 0x20u);
  }

  v7 = [(COStateService *)self _stateSetByClientsForAddOn:v4];
  [v4 setMeshState:v7];
  [v4 setDelegate:self];
}

- (void)_addOnRemoved:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(COService *)self _clustersForAddOn:v4];
  id v6 = v4;
  v7 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v16 = self;
    __int16 v17 = 2048;
    id v18 = v6;
    __int16 v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p AddOn %p removed for clusters %@", buf, 0x20u);
  }

  int v8 = [v6 meshState];
  v9 = [(COStateService *)self _stateSetByClientsForAddOn:v6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __32__COStateService__addOnRemoved___block_invoke;
  v12[3] = &unk_2645CCF60;
  v12[4] = self;
  id v13 = v6;
  id v14 = v5;
  id v10 = v5;
  id v11 = v6;
  determineStateChanges(v8, v9, v12);
}

void __32__COStateService__addOnRemoved___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134219010;
    uint64_t v22 = v8;
    __int16 v23 = 2048;
    uint64_t v24 = v9;
    __int16 v25 = 2112;
    id v26 = v5;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    uint64_t v30 = v10;
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p removal of %p updating %@ and removing %@ for clusters %@", buf, 0x34u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(a1 + 32), "_informClientsOfUpdates:removals:inCluster:", v5, v6, *(void *)(*((void *)&v16 + 1) + 8 * v15++), (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (BOOL)_applicableToCluster:(id)a3
{
  id v3 = [a3 configuration];
  unint64_t v4 = ((unint64_t)[v3 requiredServices] >> 1) & 1;

  return v4;
}

- (void)addOn:(id)a3 receivedUpdates:(id)a4 removals:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COService *)self dispatchQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__COStateService_addOn_receivedUpdates_removals___block_invoke;
  v15[3] = &unk_2645CB458;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __49__COStateService_addOn_receivedUpdates_removals___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [v3 connectedClients];
    *(_DWORD *)buf = 134218754;
    id v18 = v3;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = v5;
    __int16 v23 = 2048;
    uint64_t v24 = [v6 count];
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "StateService %p receivedUpdates %@ and removals %@. Service has %ld connectedClients", buf, 0x2Au);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_clustersForAddOn:", *(void *)(a1 + 56), 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(a1 + 32) _informClientsOfUpdates:*(void *)(a1 + 40) removals:*(void *)(a1 + 48) inCluster:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)stateForAddOn:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(COService *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__COStateService_stateForAddOn_withCallback___block_invoke;
  block[3] = &unk_2645CB330;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __45__COStateService_stateForAddOn_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [*(id *)(a1 + 32) _clustersForAddOn:*(void *)(a1 + 40)];
  uint64_t v23 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v33;
    uint64_t v25 = v2;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v3;
        uint64_t v4 = *(void *)(*((void *)&v32 + 1) + 8 * v3);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v27 = [*(id *)(a1 + 32) connectedClients];
        uint64_t v5 = [v27 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v29;
          do
          {
            uint64_t v8 = 0;
            uint64_t v26 = v6;
            do
            {
              if (*(void *)v29 != v7) {
                objc_enumerationMutation(v27);
              }
              uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * v8);
              id v10 = [*(id *)(a1 + 32) connectedClients];
              id v11 = [v10 objectForKeyedSubscript:v9];

              id v12 = [v11 clusters];
              LODWORD(v10) = [v12 containsObject:v4];

              if (v10)
              {
                uint64_t v13 = a1;
                long long v14 = [v11 suite];
                long long v15 = [v2 objectForKeyedSubscript:v14];
                if (v15)
                {
                  id v16 = [v11 suite];
                  id v17 = [v2 objectForKeyedSubscript:v16];
                  id v18 = (void *)[v17 mutableCopy];
                }
                else
                {
                  id v18 = [MEMORY[0x263EFF9A0] dictionary];
                }

                __int16 v19 = [v11 stateForCluster:v4];
                if (v19) {
                  [v18 addEntriesFromDictionary:v19];
                }
                v2 = v25;
                if ([v18 count])
                {
                  uint64_t v20 = [v11 suite];
                  [v25 setObject:v18 forKey:v20];
                }
                a1 = v13;
                uint64_t v6 = v26;
              }

              ++v8;
            }
            while (v6 != v8);
            uint64_t v6 = [v27 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v6);
        }

        uint64_t v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v23);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)addObserverWithPredicate:(id)a3 suite:(id)a4 interestClusters:(id)a5
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(COService *)self currentClient];
  id v12 = [(COStateService *)self connectedClients];
  uint64_t v13 = [v12 objectForKey:v11];

  if (!v13) {
    [(COStateService *)self _checkinClientWithSuite:v9 clusters:v10];
  }
  v45 = v10;
  v46 = v9;
  long long v14 = [(COStateService *)self connectedClients];
  long long v15 = (void *)[v14 mutableCopy];

  id v16 = [v15 objectForKey:v11];
  id v17 = (void *)[v16 mutableCopy];
  id v18 = COCoreLogForCategory(6);
  v53 = self;
  v55 = v16;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = [v11 connection];
    int v20 = [v19 processIdentifier];
    __int16 v21 = [v55 suite];
    uint64_t v22 = [v55 clusters];
    *(_DWORD *)buf = 67109890;
    int v76 = v20;
    id v16 = v55;
    __int16 v77 = 2112;
    id v78 = v8;
    __int16 v79 = 2112;
    v80 = v21;
    __int16 v81 = 2112;
    v82 = v22;
    _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "Adding observer for client %d with predicate %@ for suite %@ and clusters %@ ", buf, 0x26u);

    self = v53;
  }

  [v17 addObserverWithPredicate:v8];
  v43 = v17;
  v50 = v11;
  [v15 setObject:v17 forKey:v11];
  v44 = v15;
  [(COStateService *)self setConnectedClients:v15];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = [v16 clusters];
  uint64_t v56 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v56)
  {
    char v23 = 0;
    v54 = 0;
    uint64_t v52 = *(void *)v68;
    uint64_t v49 = *MEMORY[0x263F33DF0];
    uint64_t v48 = *MEMORY[0x263F33E00];
    uint64_t v47 = *MEMORY[0x263F33DF8];
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v68 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        uint64_t v26 = [(COService *)self _addOnForCluster:v25];
        id v27 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v57 = v25;
        v58 = v26;
        if (v26)
        {
          long long v28 = [v26 meshState];
          long long v29 = [v16 suite];
          long long v30 = [v28 objectForKeyedSubscript:v29];
        }
        else
        {
          long long v28 = [v16 suite];
          long long v30 = [(COStateService *)self _stateSetByClientsForSuite:v28 cluster:v25];
        }

        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v31 = v30;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v63 objects:v73 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v64;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v64 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void *)(*((void *)&v63 + 1) + 8 * j);
              if ([v8 evaluateWithObject:v36])
              {
                v37 = [v31 objectForKeyedSubscript:v36];
                [v27 setObject:v37 forKey:v36];

                char v23 = 1;
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v63 objects:v73 count:16];
          }
          while (v33);
        }

        if (v23)
        {
          v71[0] = v49;
          v71[1] = v48;
          v72[0] = v57;
          v72[1] = v27;
          v71[2] = v47;
          uint64_t v38 = [MEMORY[0x263EFFA08] set];
          v72[2] = v38;
          uint64_t v39 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:3];

          v40 = [v50 connection];
          v59[0] = MEMORY[0x263EF8330];
          v59[1] = 3221225472;
          v59[2] = __66__COStateService_addObserverWithPredicate_suite_interestClusters___block_invoke;
          v59[3] = &unk_2645CCF88;
          self = v53;
          v59[4] = v53;
          id v60 = v40;
          id v61 = v50;
          uint64_t v62 = v57;
          id v41 = v40;
          v42 = [v41 remoteObjectProxyWithErrorHandler:v59];
          [v42 changesObserved:v39 forPredicate:v8];

          v54 = (void *)v39;
        }
        else
        {
          self = v53;
        }
        id v16 = v55;
      }
      uint64_t v56 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v56);
  }
  else
  {
    v54 = 0;
  }
}

void __66__COStateService_addObserverWithPredicate_suite_interestClusters___block_invoke(uint64_t a1)
{
  v2 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __66__COStateService_addObserverWithPredicate_suite_interestClusters___block_invoke_cold_1(a1);
  }
}

- (void)removeObserverWithPredicate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(COService *)self currentClient];
  uint64_t v6 = [(COStateService *)self connectedClients];
  uint64_t v7 = (void *)[v6 mutableCopy];

  id v8 = [v7 objectForKey:v5];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 mutableCopy];
    id v11 = COCoreLogForCategory(6);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [v5 connection];
      int v12 = [v15 processIdentifier];
      uint64_t v13 = [v9 suite];
      long long v14 = [v9 clusters];
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)id v17 = v12;
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v4;
      *(_WORD *)&v17[14] = 2112;
      *(void *)&v17[16] = v13;
      __int16 v18 = 2112;
      __int16 v19 = v14;
      _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "Removing observer for client %d with predicate %@ for suite %@ and clusters %@ ", buf, 0x26u);
    }
    [v10 removeObserverWithPredicate:v4];
    [v7 setObject:v10 forKey:v5];
    [(COStateService *)self setConnectedClients:v7];
  }
  else
  {
    id v10 = COCoreLogForCategory(6);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)id v17 = v5;
      *(_WORD *)&v17[8] = 2112;
      *(void *)&v17[10] = v4;
      _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "Client [%p] wants to remove an observer for predicate %@ but is not checked in", buf, 0x16u);
    }
  }
}

- (void)setDictionary:(id)a3 suite:(id)a4 interestClusters:(id)a5 targetCluster:(id)a6 withCallback:(id)a7
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v33 = a4;
  id v34 = a5;
  id v12 = a6;
  id v36 = a7;
  v40 = [(COService *)self currentClient];
  uint64_t v13 = [(COStateService *)self connectedClients];
  long long v14 = [v13 objectForKey:v40];

  if (!v14) {
    [(COStateService *)self _checkinClientWithSuite:v33 clusters:v34];
  }
  long long v15 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v40 connection];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = [v16 processIdentifier];
    *(_WORD *)v71 = 2112;
    *(void *)&v71[2] = v39;
    *(_WORD *)&v71[10] = 2112;
    *(void *)&v71[12] = v12;
    _os_log_impl(&dword_2217C1000, v15, OS_LOG_TYPE_DEFAULT, "Client %d setting values %@ in clusters %@", buf, 0x1Cu);
  }
  *(void *)buf = 0;
  *(void *)v71 = buf;
  *(void *)&v71[8] = 0x3032000000;
  *(void *)&v71[16] = __Block_byref_object_copy__14;
  v72 = __Block_byref_object_dispose__14;
  id v73 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__14;
  v67[4] = __Block_byref_object_dispose__14;
  id v68 = [MEMORY[0x263EFF9C0] set];
  id v17 = [(COStateService *)self connectedClients];
  uint64_t v38 = [v17 objectForKey:v40];

  [(COStateService *)self _setIsWriting:1 forClient:v40];
  uint64_t v63 = 0;
  long long v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v12;
  uint64_t v18 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v18)
  {
    uint64_t v37 = *(void *)v60;
    do
    {
      uint64_t v41 = v18;
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v60 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        __int16 v21 = -[COService _addOnForCluster:](self, "_addOnForCluster:", v20, v33);
        objc_initWeak(&location, self);
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke;
        v53[3] = &unk_2645CCFB0;
        objc_copyWeak(&v57, &location);
        id v22 = v40;
        id v54 = v22;
        id v23 = v39;
        id v55 = v23;
        uint64_t v56 = v20;
        uint64_t v24 = MEMORY[0x223C8B4A0](v53);
        uint64_t v25 = (void *)v24;
        if (v21)
        {
          ++v64[3];
          uint64_t v26 = [v38 suite];
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke_2;
          v42[3] = &unk_2645CD000;
          objc_copyWeak(&v52, &location);
          uint64_t v49 = &v63;
          id v27 = v23;
          id v43 = v27;
          uint64_t v44 = v20;
          id v45 = v22;
          v50 = v67;
          id v28 = v25;
          v51 = buf;
          v46 = self;
          id v47 = v28;
          id v48 = v36;
          [v21 setDictionary:v27 suite:v26 withCallback:v42];

          objc_destroyWeak(&v52);
        }
        else
        {
          (*(void (**)(uint64_t))(v24 + 16))(v24);
          long long v29 = [MEMORY[0x263EFF9A0] dictionary];
          long long v30 = [v38 suite];
          [v29 setObject:v23 forKey:v30];

          [(COStateService *)self _informClientsOfUpdates:v29 removals:MEMORY[0x263EFFA78] inCluster:v20];
        }

        objc_destroyWeak(&v57);
        objc_destroyWeak(&location);
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v18);
  }

  if (!v64[3])
  {
    [(COStateService *)self _setIsWriting:0 forClient:v40];
    id v31 = [(COStateService *)self connectedClients];
    uint64_t v32 = [v31 objectForKey:v40];

    if ([v32 disconnected]) {
      [(COStateService *)self _cleanupDisconnectedClient:v40];
    }
    else {
      (*((void (**)(id, void))v36 + 2))(v36, *(void *)(*(void *)v71 + 40));
    }
  }
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(buf, 8);
}

void __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained connectedClients];
    uint64_t v5 = (void *)[v4 mutableCopy];

    id v31 = v5;
    uint64_t v6 = [v5 objectForKey:*(void *)(v1 + 32)];
    uint64_t v26 = (void *)[v6 mutableCopy];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v32 = v3;
    id obj = [v3 connectedClients];
    uint64_t v29 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v29)
    {
      uint64_t v28 = *(void *)v42;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v42 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = v7;
          uint64_t v8 = *(void *)(*((void *)&v41 + 1) + 8 * v7);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          uint64_t v9 = v1;
          id v10 = [*(id *)(v1 + 40) allKeys];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v38 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                id v16 = [v32 connectedClients];
                id v17 = [v16 objectForKeyedSubscript:v8];
                uint64_t v18 = (void *)[v17 mutableCopy];

                [v18 removeKeyPath:v15 cluster:*(void *)(v9 + 48)];
                [v31 setObject:v18 forKey:v8];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
            }
            while (v12);
          }

          uint64_t v7 = v30 + 1;
          uint64_t v1 = v9;
        }
        while (v30 + 1 != v29);
        uint64_t v29 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v29);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    __int16 v19 = [*(id *)(v1 + 40) allKeys];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          uint64_t v25 = [*(id *)(v1 + 40) objectForKeyedSubscript:v24];
          [v26 setValue:v25 forKeyPath:v24 cluster:*(void *)(v1 + 48)];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v21);
    }

    [v31 setObject:v26 forKey:*(void *)(v1 + 32)];
    uint64_t v3 = v32;
    [v32 setConnectedClients:v31];
  }
}

void __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke_3;
    block[3] = &unk_2645CCFD8;
    uint64_t v23 = *(void *)(a1 + 80);
    id v15 = v3;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(a1 + 48);
    id v16 = v7;
    uint64_t v17 = v8;
    id v10 = v9;
    uint64_t v11 = *(void *)(a1 + 88);
    id v18 = v10;
    uint64_t v24 = v11;
    id v12 = *(id *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 96);
    uint64_t v20 = v5;
    id v21 = v12;
    uint64_t v25 = v13;
    uint64_t v19 = *(void *)(a1 + 56);
    id v22 = *(id *)(a1 + 72);
    dispatch_async(v6, block);
  }
}

void __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke_3(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  --*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  if (*(void *)(a1 + 32))
  {
    v2 = COCoreLogForCategory(6);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke_3_cold_1(a1);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) addObject:*(void *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) count])
    {
      uint64_t v10 = *MEMORY[0x263F33E30];
      id v3 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) allObjects];
      v11[0] = v3;
      id v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

      uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F33E28] code:-1002 userInfo:v4];
      uint64_t v6 = *(void *)(*(void *)(a1 + 112) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    [*(id *)(a1 + 64) _setIsWriting:0 forClient:*(void *)(a1 + 56)];
    uint64_t v8 = [*(id *)(a1 + 72) connectedClients];
    uint64_t v9 = [v8 objectForKey:*(void *)(a1 + 56)];

    if ([v9 disconnected]) {
      [*(id *)(a1 + 72) _cleanupDisconnectedClient:*(void *)(a1 + 56)];
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    }
  }
}

- (void)removeKeyPaths:(id)a3 targetClusters:(id)a4 withCallback:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v27 = a4;
  id v29 = a5;
  long long v33 = [(COService *)self currentClient];
  uint64_t v8 = [(COStateService *)self connectedClients];
  uint64_t v32 = [v8 objectForKey:v33];

  uint64_t v9 = COCoreLogForCategory(6);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v32)
  {
    if (v10)
    {
      uint64_t v11 = [v33 connection];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = [v11 processIdentifier];
      *(_WORD *)&uint8_t buf[8] = 2112;
      *(void *)&buf[10] = v31;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v27;
      _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "Client %d removing keyPaths %@ in clusters %@", buf, 0x1Cu);
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__14;
    *(void *)&long long v64 = __Block_byref_object_dispose__14;
    *((void *)&v64 + 1) = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x3032000000;
    v60[3] = __Block_byref_object_copy__14;
    v60[4] = __Block_byref_object_dispose__14;
    id v61 = [MEMORY[0x263EFF9C0] set];
    [(COStateService *)self _setIsWriting:1 forClient:v33];
    uint64_t v56 = 0;
    id v57 = &v56;
    uint64_t v58 = 0x2020000000;
    uint64_t v59 = 0;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v27;
    uint64_t v12 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v12)
    {
      uint64_t v30 = *(void *)v53;
      do
      {
        uint64_t v34 = v12;
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v53 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          id v15 = [(COService *)self _addOnForCluster:v14];
          objc_initWeak(&location, self);
          v46[0] = MEMORY[0x263EF8330];
          v46[1] = 3221225472;
          v46[2] = __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke;
          v46[3] = &unk_2645CCFB0;
          objc_copyWeak(&v50, &location);
          id v16 = v33;
          id v47 = v16;
          id v17 = v31;
          id v48 = v17;
          uint64_t v49 = v14;
          uint64_t v18 = MEMORY[0x223C8B4A0](v46);
          uint64_t v19 = (void *)v18;
          if (v15)
          {
            ++v57[3];
            uint64_t v20 = [v32 suite];
            v35[0] = MEMORY[0x263EF8330];
            v35[1] = 3221225472;
            v35[2] = __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke_2;
            v35[3] = &unk_2645CD050;
            objc_copyWeak(&v45, &location);
            long long v42 = &v56;
            id v21 = v17;
            id v36 = v21;
            uint64_t v37 = v14;
            long long v43 = v60;
            id v22 = v19;
            long long v44 = buf;
            id v40 = v22;
            long long v38 = self;
            id v39 = v16;
            id v41 = v29;
            [v15 removeKeyPaths:v21 suite:v20 withCallback:v35];

            objc_destroyWeak(&v45);
          }
          else
          {
            (*(void (**)(uint64_t))(v18 + 16))(v18);
            uint64_t v23 = [MEMORY[0x263EFF9A0] dictionary];
            uint64_t v24 = [v32 suite];
            [v23 setObject:v17 forKey:v24];

            [(COStateService *)self _informClientsOfUpdates:MEMORY[0x263EFFA78] removals:v23 inCluster:v14];
          }

          objc_destroyWeak(&v50);
          objc_destroyWeak(&location);
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v12);
    }

    if (!v57[3])
    {
      [(COStateService *)self _setIsWriting:0 forClient:v33];
      uint64_t v25 = [(COStateService *)self connectedClients];
      uint64_t v26 = [v25 objectForKey:v33];

      if ([v26 disconnected]) {
        [(COStateService *)self _cleanupDisconnectedClient:v33];
      }
      else {
        (*((void (**)(id, void))v29 + 2))(v29, *(void *)(*(void *)&buf[8] + 40));
      }
    }
    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(v60, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v31;
      LOWORD(v64) = 2112;
      *(void *)((char *)&v64 + 2) = v27;
      _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%p Client [%p] wants to remove keypaths [%@] in clusters [%@] but is not checked in", buf, 0x2Au);
    }

    (*((void (**)(id, void))v29 + 2))(v29, 0);
  }
}

void __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained connectedClients];
    uint64_t v5 = (void *)[v4 mutableCopy];

    uint64_t v6 = [v5 objectForKey:*(void *)(a1 + 32)];
    id v7 = (void *)[v6 mutableCopy];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "removeKeyPath:cluster:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), *(void *)(a1 + 48), (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    [v5 setObject:v7 forKey:*(void *)(a1 + 32)];
    [v3 setConnectedClients:v5];
  }
}

void __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke_3;
    block[3] = &unk_2645CD028;
    uint64_t v21 = *(void *)(a1 + 80);
    id v13 = v3;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v14 = v7;
    uint64_t v15 = v8;
    uint64_t v22 = *(void *)(a1 + 88);
    id v9 = *(id *)(a1 + 64);
    uint64_t v23 = *(void *)(a1 + 96);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void **)(a1 + 56);
    id v19 = v9;
    uint64_t v16 = v10;
    id v17 = v11;
    uint64_t v18 = v5;
    id v20 = *(id *)(a1 + 72);
    dispatch_async(v6, block);
  }
}

void __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke_3(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  --*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = COCoreLogForCategory(6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke_3_cold_1(a1, v2, v3);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) addObject:*(void *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) count])
    {
      uint64_t v11 = *MEMORY[0x263F33E30];
      id v4 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) allObjects];
      v12[0] = v4;
      uint64_t v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

      uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F33E28] code:-1002 userInfo:v5];
      uint64_t v7 = *(void *)(*(void *)(a1 + 112) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    [*(id *)(a1 + 56) _setIsWriting:0 forClient:*(void *)(a1 + 64)];
    id v9 = [*(id *)(a1 + 72) connectedClients];
    uint64_t v10 = [v9 objectForKey:*(void *)(a1 + 64)];

    if ([v10 disconnected]) {
      [*(id *)(a1 + 72) _cleanupDisconnectedClient:*(void *)(a1 + 64)];
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    }
  }
}

- (void)doorbellDelayWithCallback:(id)a3
{
  id v5 = a3;
  [(COStateService *)self doorbellDelay];
  (*((void (**)(id))a3 + 2))(v5);
}

- (void)_checkinClientWithSuite:(id)a3 clusters:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(COService *)self currentClient];
  id v9 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 connection];
    *(_DWORD *)buf = 67109634;
    int v25 = [v10 processIdentifier];
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "Client %d checking in with suite %@ and clusters %@", buf, 0x1Cu);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", *(void *)(*((void *)&v19 + 1) + 8 * v15++), (void)v19);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  uint64_t v16 = [[COStateClientInfo alloc] initWithSuite:v6 clusters:v11];
  id v17 = [(COStateService *)self connectedClients];
  uint64_t v18 = (void *)[v17 mutableCopy];

  [v18 setObject:v16 forKey:v8];
  [(COStateService *)self setConnectedClients:v18];
}

- (void)_informClientsOfUpdates:(id)a3 removals:(id)a4 inCluster:(id)a5
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v58 = a3;
  id v57 = a4;
  id v8 = a5;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v9 = [(COStateService *)self connectedClients];
  uint64_t v10 = [v9 allKeys];

  id obj = v10;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v82 objects:v89 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v83;
    long long v43 = v78;
    uint64_t v56 = *MEMORY[0x263F33DF0];
    uint64_t v55 = *MEMORY[0x263F33E00];
    uint64_t v54 = *MEMORY[0x263F33DF8];
    id v45 = v8;
    v46 = self;
    uint64_t v44 = *(void *)v83;
    do
    {
      uint64_t v14 = 0;
      uint64_t v47 = v12;
      do
      {
        if (*(void *)v83 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v82 + 1) + 8 * v14);
        uint64_t v16 = [(COStateService *)self connectedClients];
        id v17 = [v16 objectForKeyedSubscript:v15];

        uint64_t v18 = [v17 clusters];
        if ([v18 containsObject:v8])
        {
          id v50 = v18;
          uint64_t v51 = v14;
          long long v19 = [v15 connection];
          v77[0] = MEMORY[0x263EF8330];
          v77[1] = 3221225472;
          v78[0] = __61__COStateService__informClientsOfUpdates_removals_inCluster___block_invoke;
          v78[1] = &unk_2645CCF88;
          v78[2] = self;
          id v20 = v19;
          id v79 = v20;
          v80 = v15;
          id v61 = v8;
          id v81 = v61;
          uint64_t v49 = v20;
          long long v53 = [v20 remoteObjectProxyWithErrorHandler:v77];
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v21 = [v17 observers];
          long long v22 = [v21 allKeys];

          id v52 = v22;
          uint64_t v62 = [v22 countByEnumeratingWithState:&v73 objects:v88 count:16];
          if (v62)
          {
            uint64_t v59 = *(void *)v74;
            long long v60 = v17;
            do
            {
              for (uint64_t i = 0; i != v62; ++i)
              {
                if (*(void *)v74 != v59) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v24 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                int v25 = [v17 suite];
                __int16 v26 = [v58 objectForKeyedSubscript:v25];

                id v27 = [v17 suite];
                uint64_t v63 = [v57 objectForKeyedSubscript:v27];

                long long v64 = [MEMORY[0x263EFF9A0] dictionary];
                [v64 setObject:v61 forKey:v56];
                __int16 v28 = [MEMORY[0x263EFF9A0] dictionary];
                id v29 = [MEMORY[0x263EFF9C0] set];
                long long v69 = 0u;
                long long v70 = 0u;
                long long v71 = 0u;
                long long v72 = 0u;
                id v30 = v26;
                uint64_t v31 = [v30 countByEnumeratingWithState:&v69 objects:v87 count:16];
                if (v31)
                {
                  uint64_t v32 = v31;
                  uint64_t v33 = *(void *)v70;
                  do
                  {
                    for (uint64_t j = 0; j != v32; ++j)
                    {
                      if (*(void *)v70 != v33) {
                        objc_enumerationMutation(v30);
                      }
                      uint64_t v35 = *(void *)(*((void *)&v69 + 1) + 8 * j);
                      if ([v24 evaluateWithObject:v35])
                      {
                        id v36 = [v30 objectForKeyedSubscript:v35];
                        [v28 setObject:v36 forKey:v35];
                      }
                    }
                    uint64_t v32 = [v30 countByEnumeratingWithState:&v69 objects:v87 count:16];
                  }
                  while (v32);
                }

                [v64 setObject:v28 forKey:v55];
                long long v67 = 0u;
                long long v68 = 0u;
                long long v65 = 0u;
                long long v66 = 0u;
                id v37 = v63;
                uint64_t v38 = [v37 countByEnumeratingWithState:&v65 objects:v86 count:16];
                if (v38)
                {
                  uint64_t v39 = v38;
                  uint64_t v40 = *(void *)v66;
                  do
                  {
                    for (uint64_t k = 0; k != v39; ++k)
                    {
                      if (*(void *)v66 != v40) {
                        objc_enumerationMutation(v37);
                      }
                      uint64_t v42 = *(void *)(*((void *)&v65 + 1) + 8 * k);
                      if ([v24 evaluateWithObject:v42]) {
                        [v29 addObject:v42];
                      }
                    }
                    uint64_t v39 = [v37 countByEnumeratingWithState:&v65 objects:v86 count:16];
                  }
                  while (v39);
                }

                [v64 setObject:v29 forKey:v54];
                if ([v28 count] || objc_msgSend(v29, "count")) {
                  [v53 changesObserved:v64 forPredicate:v24];
                }

                id v17 = v60;
              }
              uint64_t v62 = [v52 countByEnumeratingWithState:&v73 objects:v88 count:16];
            }
            while (v62);
          }

          id v8 = v45;
          self = v46;
          uint64_t v13 = v44;
          uint64_t v12 = v47;
          uint64_t v18 = v50;
          uint64_t v14 = v51;
        }

        ++v14;
      }
      while (v14 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v82 objects:v89 count:16];
    }
    while (v12);
  }
}

void __61__COStateService__informClientsOfUpdates_removals_inCluster___block_invoke(uint64_t a1)
{
  v2 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__COStateService__informClientsOfUpdates_removals_inCluster___block_invoke_cold_1(a1);
  }
}

- (id)_stateSetByClientsForSuite:(id)a3 cluster:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v21 = [MEMORY[0x263EFF9A0] dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = [(COStateService *)self connectedClients];
  id v9 = [v8 allKeys];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v15 = [(COStateService *)self connectedClients];
        uint64_t v16 = [v15 objectForKeyedSubscript:v14];

        id v17 = [v16 suite];
        int v18 = [v17 isEqualToString:v6];

        if (v18)
        {
          long long v19 = [v16 stateForCluster:v7];
          [v21 addEntriesFromDictionary:v19];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  return v21;
}

- (id)_stateSetByClientsForAddOn:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v23 = self;
  id v20 = v4;
  [(COService *)self _clustersForAddOn:v4];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v6;
        uint64_t v7 = *(void *)(*((void *)&v30 + 1) + 8 * v6);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v8 = [(COStateService *)v23 connectedClients];
        id v9 = [v8 allValues];

        uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v27 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              uint64_t v15 = [v14 stateForCluster:v7];
              if ([v15 count])
              {
                uint64_t v16 = [v14 suite];
                id v17 = [v5 objectForKey:v16];
                int v18 = (void *)[v17 mutableCopy];

                if (!v18)
                {
                  int v18 = [MEMORY[0x263EFF9A0] dictionary];
                }
                [v18 addEntriesFromDictionary:v15];
                [v5 setObject:v18 forKey:v16];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v11);
        }

        uint64_t v6 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }

  return v5;
}

- (void)compositionForCluster:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = [(COService *)self _addOnForCluster:v6];
  id v9 = [v8 meshController];
  uint64_t v56 = 0;
  id v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = __Block_byref_object_copy__14;
  long long v60 = __Block_byref_object_dispose__14;
  id v61 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  if (v9)
  {
    uint64_t v10 = [v9 leader];
    uint64_t v11 = [v9 nodes];
    uint64_t v12 = (void *)[v11 mutableCopy];

    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __53__COStateService_compositionForCluster_withCallback___block_invoke;
    v52[3] = &unk_2645CD0A0;
    id v44 = v10;
    id v53 = v44;
    id v54 = v8;
    uint64_t v55 = &v56;
    [v12 enumerateObjectsUsingBlock:v52];
    long long v43 = v12;
    uint64_t v13 = [v9 nodeManager];
    uint64_t v14 = [v13 nodeForMe];

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v16 = [v14 IDSIdentifier];
    [v15 setObject:v16 forKey:*MEMORY[0x263F33E68]];

    [v15 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F33E80]];
    uint64_t v17 = [v14 HomeKitIdentifier];
    if (v17) {
      [v15 setObject:v17 forKey:*MEMORY[0x263F33E38]];
    }
    uint64_t v42 = (void *)v17;
    int v18 = [v9 me];
    long long v19 = v18;
    if (v44 && [v18 isEqual:v44]) {
      [v15 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F33E78]];
    }
    id v20 = [v19 dictionaryRepresentation];
    [v15 setObject:v20 forKey:*MEMORY[0x263F33E70]];

    id v21 = [v14 underlyingNode];
    uint64_t v22 = [v21 state];

    long long v23 = +[CONode descriptionForState:v22];
    [v15 setObject:v23 forKey:*MEMORY[0x263F33E98]];

    uint64_t v24 = +[CONode statusFromState:v22];
    [v15 setObject:v24 forKey:*MEMORY[0x263F33EA0]];

    uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "generation"));
    [v15 setObject:v25 forKey:*MEMORY[0x263F33E58]];

    long long v26 = [v9 ballot];
    if (v26)
    {
      uint64_t v46 = 0;
      uint64_t v47 = &v46;
      uint64_t v48 = 0x3032000000;
      uint64_t v49 = __Block_byref_object_copy__14;
      id v50 = __Block_byref_object_dispose__14;
      id v51 = objc_alloc_init(MEMORY[0x263EFF8C0]);
      long long v27 = [v26 candidates];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __53__COStateService_compositionForCluster_withCallback___block_invoke_3;
      v45[3] = &unk_2645CD078;
      v45[4] = &v46;
      [v27 enumerateObjectsUsingBlock:v45];

      [v15 setObject:v47[5] forKey:*MEMORY[0x263F33E40]];
      _Block_object_dispose(&v46, 8);
    }
    unint64_t v28 = [v9 electionStart];
    unint64_t v29 = [v9 electionEnd];
    double v30 = 0.0;
    double v31 = 0.0;
    BOOL v32 = v29 >= v28;
    unint64_t v33 = v29 - v28;
    if (v33 != 0 && v32)
    {
      double v31 = (double)v33 / 1000000000.0;
      double v30 = (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v29) / 1000000000.0;
    }
    uint64_t v34 = [NSNumber numberWithDouble:v30];
    [v15 setObject:v34 forKey:*MEMORY[0x263F33E10]];

    uint64_t v35 = [NSNumber numberWithDouble:v31];
    [v15 setObject:v35 forKey:*MEMORY[0x263F33E08]];

    uint64_t v36 = NSNumber;
    [v9 pingMinimum];
    id v37 = objc_msgSend(v36, "numberWithDouble:");
    [v15 setObject:v37 forKey:*MEMORY[0x263F33E20]];

    uint64_t v38 = NSNumber;
    [v9 pingMaximum];
    uint64_t v39 = objc_msgSend(v38, "numberWithDouble:");
    [v15 setObject:v39 forKey:*MEMORY[0x263F33E18]];

    uint64_t v40 = [(id)v57[5] arrayByAddingObject:v15];
    id v41 = (void *)v57[5];
    v57[5] = v40;
  }
  v7[2](v7, v57[5], 0);
  _Block_object_dispose(&v56, 8);
}

void __53__COStateService_compositionForCluster_withCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = [v3 IDSIdentifier];
  [v4 setObject:v5 forKey:*MEMORY[0x263F33E68]];

  uint64_t v42 = [v3 HomeKitIdentifier];
  if (v42) {
    [v4 setObject:v42 forKey:*MEMORY[0x263F33E38]];
  }
  if (*(void *)(a1 + 32))
  {
    id v6 = [v3 remote];
    int v7 = [v6 isEqual:*(void *)(a1 + 32)];

    if (v7) {
      [v4 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F33E78]];
    }
  }
  id v44 = [v3 remote];
  if (v44)
  {
    id v8 = [v44 dictionaryRepresentation];
    [v4 setObject:v8 forKey:*MEMORY[0x263F33E70]];
  }
  id v9 = [v3 underlyingNode];
  uint64_t v10 = [v9 state];

  uint64_t v11 = +[CONode descriptionForState:v10];
  [v4 setObject:v11 forKey:*MEMORY[0x263F33E98]];

  uint64_t v12 = +[CONode statusFromState:v10];
  [v4 setObject:v12 forKey:*MEMORY[0x263F33EA0]];

  uint64_t v13 = [v3 underlyingNode];
  id v45 = [v13 lastElectionInfoReceived];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v45, "generation"));
  [v4 setObject:v14 forKey:*MEMORY[0x263F33E58]];

  long long v43 = [v45 ballot];
  if (v43)
  {
    uint64_t v51 = 0;
    id v52 = &v51;
    uint64_t v53 = 0x3032000000;
    id v54 = __Block_byref_object_copy__14;
    uint64_t v55 = __Block_byref_object_dispose__14;
    id v56 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    uint64_t v15 = [v43 candidates];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __53__COStateService_compositionForCluster_withCallback___block_invoke_2;
    v50[3] = &unk_2645CD078;
    v50[4] = &v51;
    [v15 enumerateObjectsUsingBlock:v50];

    [v4 setObject:v52[5] forKey:*MEMORY[0x263F33E40]];
    _Block_object_dispose(&v51, 8);
  }
  uint64_t v16 = NSNumber;
  uint64_t v17 = [v3 underlyingNode];
  [v17 lastHeard];
  int v18 = objc_msgSend(v16, "numberWithDouble:");
  [v4 setObject:v18 forKey:*MEMORY[0x263F33E88]];

  long long v19 = NSNumber;
  id v20 = [v3 underlyingNode];
  id v21 = objc_msgSend(v19, "numberWithBool:", objc_msgSend(v20, "hasOutstandingProbe"));
  [v4 setObject:v21 forKey:*MEMORY[0x263F33E60]];

  uint64_t v22 = [*(id *)(a1 + 40) meshController];
  long long v23 = [v22 nodeManager];
  id v41 = [v23 nodeControllers];

  uint64_t v24 = [v3 IDSIdentifier];
  uint64_t v25 = [v41 objectForKey:v24];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v26 = [v25 transports];
  id v27 = (id)[v26 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v47;
LABEL_12:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v47 != v28) {
        objc_enumerationMutation(v26);
      }
      double v30 = *(void **)(*((void *)&v46 + 1) + 8 * v29);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v27 == (id)++v29)
      {
        id v27 = (id)[v26 countByEnumeratingWithState:&v46 objects:v57 count:16];
        if (v27) {
          goto LABEL_12;
        }
        goto LABEL_21;
      }
    }
    id v27 = v30;

    if (!v27) {
      goto LABEL_22;
    }
    double v31 = NSNumber;
    [v27 averageRequestTime];
    long long v26 = objc_msgSend(v31, "numberWithDouble:");
    [v4 setObject:v26 forKey:*MEMORY[0x263F33E90]];
  }
LABEL_21:

LABEL_22:
  BOOL v32 = NSNumber;
  unint64_t v33 = [v3 underlyingNode];
  uint64_t v34 = objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "discoveryType"));
  [v4 setObject:v34 forKey:*MEMORY[0x263F33E50]];

  uint64_t v35 = NSNumber;
  uint64_t v36 = [v3 underlyingNode];
  id v37 = objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v36, "connectionType"));
  [v4 setObject:v37 forKey:*MEMORY[0x263F33E48]];

  uint64_t v38 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) arrayByAddingObject:v4];
  uint64_t v39 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v40 = *(void **)(v39 + 40);
  *(void *)(v39 + 40) = v38;
}

void __53__COStateService_compositionForCluster_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v7 = [a2 dictionaryRepresentation];
  uint64_t v4 = [v3 arrayByAddingObject:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __53__COStateService_compositionForCluster_withCallback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v7 = [a2 dictionaryRepresentation];
  uint64_t v4 = [v3 arrayByAddingObject:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)requestCompositionForCluster:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    [(COStateService *)self compositionForCluster:v6 withCallback:v7];
  }
  else
  {
    id v8 = [(COService *)self _addOnForCluster:v6];
    id v9 = [v8 meshController];
    uint64_t v51 = 0;
    id v52 = &v51;
    uint64_t v53 = 0x3032000000;
    id v54 = __Block_byref_object_copy__14;
    uint64_t v55 = __Block_byref_object_dispose__14;
    id v56 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    if (v9)
    {
      uint64_t v10 = [v9 leader];
      uint64_t v11 = [v9 trackers];
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __60__COStateService_requestCompositionForCluster_withCallback___block_invoke;
      v48[3] = &unk_2645CD0C8;
      id v12 = v10;
      id v49 = v12;
      id v50 = &v51;
      [v11 enumerateNodeStateTrackersUsingBlock:v48];

      uint64_t v13 = [v9 listener];
      uint64_t v14 = v13;
      if (v13)
      {
        uint64_t v15 = [v13 client];
        uint64_t v39 = [v15 localDevice];

        uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v17 = [v14 IDSIdentifier];
        [v16 setObject:v17 forKey:*MEMORY[0x263F33E68]];

        [v16 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F33E80]];
        uint64_t v18 = [v39 homeKitIdentifier];
        if (v18) {
          [v16 setObject:v18 forKey:*MEMORY[0x263F33E38]];
        }
        uint64_t v38 = (void *)v18;
        uint64_t v40 = [v9 me];
        if (v12 && [v40 isEqual:v12]) {
          [v16 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F33E78]];
        }
        long long v19 = [v40 dictionaryRepresentation];
        [v16 setObject:v19 forKey:*MEMORY[0x263F33E70]];

        id v20 = COMeshControllerStateDescription([v9 state]);
        [v16 setObject:v20 forKey:*MEMORY[0x263F33E98]];

        id v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "generation"));
        [v16 setObject:v21 forKey:*MEMORY[0x263F33E58]];

        uint64_t v22 = [v9 ballot];
        if (v22)
        {
          uint64_t v42 = 0;
          long long v43 = &v42;
          uint64_t v44 = 0x3032000000;
          id v45 = __Block_byref_object_copy__14;
          long long v46 = __Block_byref_object_dispose__14;
          id v47 = objc_alloc_init(MEMORY[0x263EFF8C0]);
          long long v23 = [v22 candidates];
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __60__COStateService_requestCompositionForCluster_withCallback___block_invoke_3;
          v41[3] = &unk_2645CD078;
          v41[4] = &v42;
          [v23 enumerateObjectsUsingBlock:v41];

          [v16 setObject:v43[5] forKey:*MEMORY[0x263F33E40]];
          _Block_object_dispose(&v42, 8);
        }
        unint64_t v24 = [v9 electionStart];
        unint64_t v25 = [v9 electionEnd];
        double v26 = 0.0;
        double v27 = 0.0;
        BOOL v28 = v25 >= v24;
        unint64_t v29 = v25 - v24;
        if (v29 != 0 && v28)
        {
          double v27 = (double)v29 / 1000000000.0;
          double v26 = (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v25) / 1000000000.0;
        }
        double v30 = [NSNumber numberWithDouble:v26];
        [v16 setObject:v30 forKey:*MEMORY[0x263F33E10]];

        double v31 = [NSNumber numberWithDouble:v27];
        [v16 setObject:v31 forKey:*MEMORY[0x263F33E08]];

        BOOL v32 = NSNumber;
        [v9 pingMinimum];
        unint64_t v33 = objc_msgSend(v32, "numberWithDouble:");
        [v16 setObject:v33 forKey:*MEMORY[0x263F33E20]];

        uint64_t v34 = NSNumber;
        [v9 pingMaximum];
        uint64_t v35 = objc_msgSend(v34, "numberWithDouble:");
        [v16 setObject:v35 forKey:*MEMORY[0x263F33E18]];

        uint64_t v36 = [(id)v52[5] arrayByAddingObject:v16];
        id v37 = (void *)v52[5];
        v52[5] = v36;
      }
    }
    v7[2](v7, v52[5], 0);
    _Block_object_dispose(&v51, 8);
  }
}

void __60__COStateService_requestCompositionForCluster_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 node];
  unint64_t v5 = [v3 state];
  unint64_t v6 = [v3 status];
  uint64_t v7 = [v3 lastGenerationReceived];
  BOOL v32 = [v3 lastBallotReceived];
  [v3 lastHeard];
  double v9 = v8;
  unsigned int v31 = [v3 hasOutstandingProbe];
  uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v11 = [v4 IDSIdentifier];
  [v10 setObject:v11 forKey:*MEMORY[0x263F33E68]];

  id v12 = [v4 HomeKitIdentifier];
  if (v12) {
    [v10 setObject:v12 forKey:*MEMORY[0x263F33E38]];
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v13 = [v4 remote];
    int v14 = [v13 isEqual:*(void *)(a1 + 32)];

    if (v14) {
      [v10 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F33E78]];
    }
  }
  uint64_t v15 = [v4 remote];
  uint64_t v16 = v15;
  if (v15)
  {
    uint64_t v17 = [v15 dictionaryRepresentation];
    [v10 setObject:v17 forKey:*MEMORY[0x263F33E70]];
  }
  uint64_t v18 = COMeshControllerStateDescription(v5);
  [v10 setObject:v18 forKey:*MEMORY[0x263F33E98]];

  long long v19 = COMeshNodeStateTrackerStatusDescription(v6);
  [v10 setObject:v19 forKey:*MEMORY[0x263F33EA0]];

  id v20 = [NSNumber numberWithUnsignedLongLong:v7];
  [v10 setObject:v20 forKey:*MEMORY[0x263F33E58]];

  if (v32)
  {
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000;
    id v37 = __Block_byref_object_copy__14;
    uint64_t v38 = __Block_byref_object_dispose__14;
    id v39 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    id v21 = [v32 candidates];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __60__COStateService_requestCompositionForCluster_withCallback___block_invoke_2;
    v33[3] = &unk_2645CD078;
    v33[4] = &v34;
    [v21 enumerateObjectsUsingBlock:v33];

    [v10 setObject:v35[5] forKey:*MEMORY[0x263F33E40]];
    _Block_object_dispose(&v34, 8);
  }
  uint64_t v22 = [NSNumber numberWithDouble:v9];
  [v10 setObject:v22 forKey:*MEMORY[0x263F33E88]];

  long long v23 = [NSNumber numberWithBool:v31];
  [v10 setObject:v23 forKey:*MEMORY[0x263F33E60]];

  unint64_t v24 = NSNumber;
  [v4 averageRequestTime];
  unint64_t v25 = objc_msgSend(v24, "numberWithDouble:");
  [v10 setObject:v25 forKey:*MEMORY[0x263F33E90]];

  double v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "discoveryType"));
  [v10 setObject:v26 forKey:*MEMORY[0x263F33E50]];

  double v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "connectionType"));
  [v10 setObject:v27 forKey:*MEMORY[0x263F33E48]];

  uint64_t v28 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) arrayByAddingObject:v10];
  uint64_t v29 = *(void *)(*(void *)(a1 + 40) + 8);
  double v30 = *(void **)(v29 + 40);
  *(void *)(v29 + 40) = v28;
}

void __60__COStateService_requestCompositionForCluster_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v7 = [a2 dictionaryRepresentation];
  uint64_t v4 = [v3 arrayByAddingObject:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __60__COStateService_requestCompositionForCluster_withCallback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v7 = [a2 dictionaryRepresentation];
  uint64_t v4 = [v3 arrayByAddingObject:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)_setIsWriting:(BOOL)a3 forClient:(id)a4
{
  BOOL v4 = a3;
  id v13 = a4;
  unint64_t v6 = [(COStateService *)self connectedClients];
  id v7 = [v6 objectForKey:v13];

  double v8 = (void *)[v7 mutableCopy];
  uint64_t v9 = [v8 outstandingWriteCount];
  if (v4) {
    uint64_t v10 = v9 + 1;
  }
  else {
    uint64_t v10 = v9 - 1;
  }
  [v8 setOutstandingWriteCount:v10];
  if ([v8 outstandingWriteCount] < 0) {
    [v8 setOutstandingWriteCount:0];
  }
  uint64_t v11 = [(COStateService *)self connectedClients];
  id v12 = (void *)[v11 mutableCopy];

  [v12 setObject:v8 forKey:v13];
  [(COStateService *)self setConnectedClients:v12];
}

- (void)_cleanupDisconnectedClient:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v28 = self;
  uint64_t v5 = [(COStateService *)self connectedClients];
  unint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 outstandingWriteCount];
  double v8 = COCoreLogForCategory(6);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 < 1)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      id v37 = v4;
      _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "Cleaning up client %p ", buf, 0xCu);
    }
    double v27 = v4;

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [v6 clusters];
    uint64_t v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v26 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v17 = [v6 stateForCluster:v16];
          uint64_t v18 = (void *)MEMORY[0x263EFFA08];
          long long v19 = [v17 allKeys];
          id v20 = [v18 setWithArray:v19];

          id v21 = [MEMORY[0x263EFF9A0] dictionary];
          uint64_t v22 = [v6 suite];
          [v21 setObject:v20 forKey:v22];

          long long v23 = [(COService *)v28 _addOnForCluster:v16];
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __45__COStateService__cleanupDisconnectedClient___block_invoke;
          v29[3] = &unk_2645CC258;
          v29[4] = v16;
          id v30 = v27;
          [v23 sendStateUpdates:0 removals:v21 withCallback:v29];
          [(COService *)v28 _releaseAssertionForCluster:v16];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v14);
    }

    unint64_t v24 = [(COStateService *)v28 connectedClients];
    uint64_t v10 = (void *)[v24 mutableCopy];

    id v4 = v27;
    [v10 removeObjectForKey:v27];
    [(COStateService *)v28 setConnectedClients:v10];
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      id v37 = v4;
      _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "Client %p lost but it has outstanding writes. Defering cleanup", buf, 0xCu);
    }

    uint64_t v10 = (void *)[v6 mutableCopy];
    [v10 setDisconnected:1];
    uint64_t v11 = [(COStateService *)v28 connectedClients];
    id v12 = (void *)[v11 mutableCopy];

    [v12 setObject:v10 forKey:v4];
    [(COStateService *)v28 setConnectedClients:v12];
  }
}

void __45__COStateService__cleanupDisconnectedClient___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) connection];
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    double v8 = v4;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "Removed keys for cluster %@ set by client %p", (uint8_t *)&v5, 0x16u);
  }
}

- (void)endpointAvailableInHomeChanged:(BOOL)a3
{
  int v5 = [(COService *)self dispatchQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__COStateService_endpointAvailableInHomeChanged___block_invoke;
  v6[3] = &unk_2645CD0F0;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

uint64_t __49__COStateService_endpointAvailableInHomeChanged___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 40)) {
      int v3 = 89;
    }
    else {
      int v3 = 78;
    }
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "Endpoint availability changed to %c", (uint8_t *)v6, 8u);
  }

  double v4 = 0.2;
  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 1.0;
  }
  return [*(id *)(a1 + 32) setDoorbellDelay:v4];
}

- (NSDictionary)connectedClients
{
  return self->_connectedClients;
}

- (void)setConnectedClients:(id)a3
{
}

- (COEndpointMonitor)endpointMonitor
{
  return self->_endpointMonitor;
}

- (void)setEndpointMonitor:(id)a3
{
}

- (double)doorbellDelay
{
  return self->_doorbellDelay;
}

- (void)setDoorbellDelay:(double)a3
{
  self->_doorbellDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointMonitor, 0);
  objc_storeStrong((id *)&self->_connectedClients, 0);
}

void __66__COStateService_addObserverWithPredicate_suite_interestClusters___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 40) processIdentifier];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_1(&dword_2217C1000, v1, v2, "%p failed to notify client %d %@ of the initial state in cluster %@", v3, v4, v5, v6, v7);
}

void __82__COStateService_setDictionary_suite_interestClusters_targetCluster_withCallback___block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 56) connection];
  [v1 processIdentifier];
  OUTLINED_FUNCTION_1_1(&dword_2217C1000, v2, v3, "Failed to set state %@ in cluster %@ for client %d. Error = %@", v4, v5, v6, v7, 2u);
}

void __61__COStateService_removeKeyPaths_targetClusters_withCallback___block_invoke_3_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *a2;
  int v6 = 138412802;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_2217C1000, log, OS_LOG_TYPE_ERROR, "Failed to remove keyPaths %@ for cluster %@. Error = %@", (uint8_t *)&v6, 0x20u);
}

void __61__COStateService__informClientsOfUpdates_removals_inCluster___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 40) processIdentifier];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_1(&dword_2217C1000, v1, v2, "%p failed to notify client %d %@ of state changes in cluster %@", v3, v4, v5, v6, v7);
}

@end