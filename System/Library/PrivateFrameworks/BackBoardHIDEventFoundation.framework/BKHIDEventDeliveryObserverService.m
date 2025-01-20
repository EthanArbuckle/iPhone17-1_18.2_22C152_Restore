@interface BKHIDEventDeliveryObserverService
- (BKHIDEventDeliveryObserverService)init;
- (BKHIDEventDeliveryObserverService)initWithServer:(id)a3;
- (id)setObservesDeferringResolutions:(id)a3;
- (void)_locked_postChainsToObservingClients;
- (void)connectionDidTerminate:(id)a3 process:(id)a4;
- (void)deliveryChainDidUpdate:(id)a3 forIdentity:(id)a4 reason:(id)a5;
- (void)setObservesDeferringChainIdentities:(id)a3;
@end

@implementation BKHIDEventDeliveryObserverService

void __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_msgSend(v5, "setPid:", objc_msgSend(*(id *)(a1 + 32), "pid"));
  v3 = [*(id *)(a1 + 32) token];
  if (v3) {
    [v5 setToken:v3];
  }
  [v5 setEnvironment:*(void *)(a1 + 40)];
  [v5 setDisplay:*(void *)(a1 + 48)];
  if (*(void *)(a1 + 56) == *(void *)(a1 + 64)) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [v5 setPolicyStatus:v4];
}

uint64_t __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 integerValue];

  return [v2 addIndex:v3];
}

- (id)setObservesDeferringResolutions:(id)a3
{
  server = self->_server;
  id v5 = a3;
  v6 = [(BKHIDDomainServiceServer *)server currentConnection];
  v7 = [(BKHIDDomainServiceServer *)self->_server userInfoForConnection:v6];
  if (!v7)
  {
    v7 = objc_alloc_init(_BKEventObserverConnectionRecord);
    [(BKHIDDomainServiceServer *)self->_server setUserInfo:v7 forConnection:v6];
  }
  v8 = [v6 remoteToken];
  int v9 = [v8 pid];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v11 = [v5 BOOLValue];

  if (v11)
  {
    if (v7) {
      v7->_observingLocalPolicy = 1;
    }
    v12 = [(BSMutableIntegerMap *)self->_lock_observationsByPID objectForKey:v9];
  }
  else
  {
    v12 = 0;
    if (v7) {
      v7->_observingLocalPolicy = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (void)deliveryChainDidUpdate:(id)a3 forIdentity:(id)a4 reason:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v49 = self;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v11 = BKLogEventDelivery();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1CFDE2000, v11, OS_LOG_TYPE_DEFAULT, "chain did update (%{public}@) %{public}@", buf, 0x16u);
  }
  v43 = v10;

  id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  lock_identityToPIDToObservations = self->_lock_identityToPIDToObservations;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke;
  v63[3] = &unk_1E6871150;
  id v40 = v12;
  id v64 = v40;
  v14 = v63;
  if (lock_identityToPIDToObservations)
  {
    v15 = [(NSMutableDictionary *)lock_identityToPIDToObservations->_trunkToBranchDictionary objectForKey:v9];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __43__BKThreeLevelForest_enumerateTrunk_block___block_invoke;
    v67 = &unk_1E6871240;
    v68 = v14;
    [v15 enumerateKeysAndObjectsUsingBlock:buf];
  }
  [(NSMutableDictionary *)v49->_lock_identityToChain setObject:v8 forKeyedSubscript:v9];
  v16 = v49->_lock_identityToPIDToObservations;
  if (v16) {
    [(NSMutableDictionary *)v16->_trunkToBranchDictionary removeObjectForKey:v9];
  }
  v47 = objc_msgSend(v8, "environment", v40);
  v48 = [v8 compatibilityDisplay];
  if (!v48)
  {
    v48 = [v8 display];
  }
  v17 = [v8 deferringPath];
  uint64_t v46 = [v17 count];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    uint64_t v45 = *(void *)v60;
    uint64_t v21 = 0xFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        v23 = v9;
        uint64_t v24 = v21;
        if (*(void *)v60 != v45) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v21 = [v25 pid];
        v26 = (void *)MEMORY[0x1E4F4F2F8];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke_2;
        v54[3] = &unk_1E6871178;
        v54[4] = v25;
        id v55 = v47;
        id v56 = v48;
        uint64_t v57 = v20 + i + 1;
        uint64_t v58 = v46;
        v27 = [v26 build:v54];
        v28 = v49->_lock_identityToPIDToObservations;
        v29 = [NSNumber numberWithInt:v21];
        uint64_t v30 = (uint64_t)v28;
        id v9 = v23;
        -[BKThreeLevelForest addLeaf:toBranch:trunk:](v30, v27, v29, v23);

        if ((int)v24 >= 1 && v24 != v21)
        {
          uint64_t v31 = (uint64_t)v49->_lock_identityToPIDToObservations;
          v32 = [NSNumber numberWithInt:v24];
          -[BKThreeLevelForest addLeaf:toBranch:trunk:](v31, v27, v32, v23);
        }
      }
      v20 += i;
      uint64_t v19 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
    }
    while (v19);
  }

  v33 = v49->_lock_identityToPIDToObservations;
  if (v33)
  {
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trunkToBranchDictionary = v33->_trunkToBranchDictionary;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __58__BKThreeLevelForest_dictionaryContainingBranchesToLeaves__block_invoke;
    v67 = &unk_1E6871290;
    v33 = (BKThreeLevelForest *)v34;
    v68 = v33;
    [(NSMutableDictionary *)trunkToBranchDictionary enumerateKeysAndObjectsUsingBlock:buf];
  }
  v36 = (void *)[(BKThreeLevelForest *)v33 mutableCopy];

  id v37 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke_3;
  v51[3] = &unk_1E68711A0;
  id v52 = v36;
  id v53 = v37;
  id v38 = v37;
  id v39 = v36;
  [v41 enumerateIndexesUsingBlock:v51];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke_4;
  v50[3] = &unk_1E68711C8;
  v50[4] = v49;
  [v39 enumerateKeysAndObjectsUsingBlock:v50];
  -[BKHIDEventDeliveryObserverService _locked_postChainsToObservingClients]((uint64_t)v49);
  os_unfair_lock_unlock(lock);
}

- (void)_locked_postChainsToObservingClients
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v20 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v20)
    {
      uint64_t v19 = *(void *)v24;
      do
      {
        uint64_t v2 = 0;
        do
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v3 = *(void *)(*((void *)&v23 + 1) + 8 * v2);
          uint64_t v4 = [*(id *)(a1 + 8) userInfoForConnection:v3];
          uint64_t v5 = v4;
          if (v4)
          {
            id v6 = *(id *)(v4 + 24);
            v7 = *(void **)(v5 + 16);
          }
          else
          {
            id v6 = 0;
            v7 = 0;
          }
          id v8 = v7;
          if ([v8 count])
          {
            uint64_t v21 = v3;
            id v22 = v6;
            id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id v10 = v8;
            uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v28;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v28 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  v15 = [*(id *)(a1 + 48) objectForKey:*(void *)(*((void *)&v27 + 1) + 8 * i)];
                  if (v15) {
                    [v9 addObject:v15];
                  }
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
              }
              while (v12);
            }

            uint64_t v3 = v21;
            id v6 = v22;
          }
          else
          {
            id v9 = 0;
          }

          if (([v6 count] || objc_msgSend(v9, "count")) && (BSEqualObjects() & 1) == 0)
          {
            if (v5) {
              objc_storeStrong((id *)(v5 + 24), v9);
            }
            v16 = [*(id *)(a1 + 8) remoteTargetForServiceConnection:v3];
            [v16 didUpdateDeferringChains:v9];
          }
          ++v2;
        }
        while (v2 != v20);
        uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
        uint64_t v20 = v17;
      }
      while (v17);
    }
  }
}

void __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v6 = [v4 objectForKey:v5];

  if (!v6)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = [NSNumber numberWithUnsignedInteger:a2];
    [v8 setObject:v7 forKey:v9];
  }
}

void __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 intValue];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v8;
  id v17 = v8;
  if (v7)
  {
    id v9 = v8;
    if (!v8) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    id v10 = [*(id *)(v7 + 24) objectForKey:(int)v6];
    if (!v10) {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    if ((BSEqualObjects() & 1) != 0 || ![v9 count] && !objc_msgSend(v10, "count")) {
      goto LABEL_18;
    }
    uint64_t v11 = [v9 count];
    uint64_t v12 = *(void **)(v7 + 24);
    if (v11)
    {
      if (!v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F4F788]);
        v14 = *(void **)(v7 + 24);
        *(void *)(v7 + 24) = v13;

        uint64_t v12 = *(void **)(v7 + 24);
      }
      [v12 setObject:v9 forKey:(int)v6];
    }
    else
    {
      [v12 removeObjectForKey:(int)v6];
    }

    id v9 = [*(id *)(*(void *)(a1 + 32) + 8) connectionForPID:v6];
    if (v9)
    {
      uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 8) userInfoForConnection:v9];
      id v10 = (id)v15;
      if (v15 && *(unsigned char *)(v15 + 8))
      {
        v16 = [*(id *)(*(void *)(a1 + 32) + 8) remoteTargetForServiceConnection:v9];
        [v16 didUpdateDeferringObservations:v17];
      }
LABEL_18:
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_identityToChain, 0);
  objc_storeStrong((id *)&self->_lock_identityToPIDToObservations, 0);
  objc_storeStrong((id *)&self->_lock_deferringChainObserverConnections, 0);
  objc_storeStrong((id *)&self->_lock_observationsByPID, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

- (void)connectionDidTerminate:(id)a3 process:(id)a4
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v6 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_lock_deferringChainObserverConnections removeObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)setObservesDeferringChainIdentities:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BKHIDDomainServiceServer *)self->_server currentConnection];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = [v5 remoteToken];
  if ([v7 hasEntitlement:@"com.apple.backboardd.globalDeferringChainObserver"])
  {
    id v9 = [(BKHIDDomainServiceServer *)self->_server userInfoForConnection:v5];
    if (v9
      || (id v9 = objc_alloc_init(_BKEventObserverConnectionRecord),
          [(BKHIDDomainServiceServer *)self->_server setUserInfo:v9 forConnection:v5],
          v9))
    {
      objc_setProperty_nonatomic_copy(v9, v8, v4, 16);
    }
    lock_deferringChainObserverConnections = self->_lock_deferringChainObserverConnections;
    if (!lock_deferringChainObserverConnections)
    {
      uint64_t v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v12 = self->_lock_deferringChainObserverConnections;
      self->_lock_deferringChainObserverConnections = v11;

      lock_deferringChainObserverConnections = self->_lock_deferringChainObserverConnections;
    }
    [(NSMutableSet *)lock_deferringChainObserverConnections addObject:v5];
    -[BKHIDEventDeliveryObserverService _locked_postChainsToObservingClients]((uint64_t)self);
  }
  else
  {
    id v13 = BKLogEventDelivery();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v7 pid];
      v14 = BSProcessDescriptionForPID();
      int v15 = 134217984;
      v16 = v14;
      _os_log_error_impl(&dword_1CFDE2000, v13, OS_LOG_TYPE_ERROR, "'%public@' tried to observe deferring chains. That's illegal.", (uint8_t *)&v15, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (BKHIDEventDeliveryObserverService)initWithServer:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKHIDEventDeliveryObserverService;
  id v6 = [(BKHIDEventDeliveryObserverService *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_identityToChain = v7->_lock_identityToChain;
    v7->_lock_identityToChain = v8;

    id v10 = objc_alloc_init(BKThreeLevelForest);
    lock_identityToPIDToObservations = v7->_lock_identityToPIDToObservations;
    v7->_lock_identityToPIDToObservations = v10;

    objc_storeStrong((id *)&v7->_server, a3);
    [(BKHIDDomainServiceServer *)v7->_server activate];
  }

  return v7;
}

- (BKHIDEventDeliveryObserverService)init
{
  uint64_t v3 = [BKHIDDomainServiceServer alloc];
  uint64_t v4 = *MEMORY[0x1E4F4F200];
  id v5 = BKLogEventDelivery();
  id v6 = [(BKHIDDomainServiceServer *)v3 initWithDelegate:self serverTarget:self serverProtocol:&unk_1F26888F0 clientProtocol:&unk_1F268BA08 serviceName:v4 queue:0 log:v5 entitlement:0];

  uint64_t v7 = [(BKHIDEventDeliveryObserverService *)self initWithServer:v6];
  return v7;
}

@end