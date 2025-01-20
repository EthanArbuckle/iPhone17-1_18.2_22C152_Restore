@interface HMMTRFabricConnectionRequest
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)_hasActiveAccessoryConnections;
- (BOOL)_hasPendingAccessoryConnections;
- (BOOL)_removeFromActiveIPConnections:(id)a3;
- (BOOL)_removeFromActiveThreadConnections:(id)a3;
- (BOOL)_removeFromActiveThreadWEDConnections:(id)a3;
- (BOOL)_tryMergeIntoExistingConnection:(id)a3;
- (BOOL)abortOperationsForConnectionRequest:(id)a3 reason:(id)a4;
- (BOOL)active;
- (BOOL)hasPendingHighPriorityConnectionRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)systemCommissionerFabric;
- (HMFTimer)idleTimer;
- (HMMTRAccessoryServerBrowser)browser;
- (HMMTRFabricConnectionRequest)initWithQueue:(id)a3 browser:(id)a4 fabricID:(id)a5 systemCommissionerFabric:(BOOL)a6;
- (NSNumber)fabricID;
- (OS_dispatch_queue)workQueue;
- (id)activeIPConnectionRequests;
- (id)activeThreadConnectionRequests;
- (id)activeThreadWEDConnectionRequests;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (id)pendingConnectionRequests;
- (id)privateDescription;
- (unint64_t)hash;
- (unsigned)fabricIdleTime;
- (void)_addToActiveIPConnections:(id)a3;
- (void)_addToActiveThreadConnections:(id)a3;
- (void)_addToActiveThreadWEDConnections:(id)a3;
- (void)_addToPendingConnections:(id)a3;
- (void)_calculateFabricIdleTime;
- (void)_connectPendingConnections;
- (void)_kickIdleTimer;
- (void)_removeFromPendingConnections:(id)a3;
- (void)_restartConnectionIdleTimer:(double)a3;
- (void)_updateActiveThreadWEDConnectionsIdleTime:(unsigned __int8)a3;
- (void)_updateConnectionIdleTime:(unsigned __int8)a3;
- (void)abortAllOperationsWithReason:(id)a3;
- (void)connectToAccessoryWhenAllowed:(id)a3;
- (void)dispatchBlock:(id)a3;
- (void)operationsCompletedForAccessoryConnectionRequest:(id)a3;
- (void)retryOperations;
- (void)setActive:(BOOL)a3;
- (void)setFabricIdleTime:(unsigned __int8)a3;
- (void)startOperations;
- (void)stopOperations;
- (void)suspendOperations;
- (void)timerDidFire:(id)a3;
- (void)updateAllConnectionIdleTimeoutsToMinimum;
@end

@implementation HMMTRFabricConnectionRequest

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_pendingConnectionRequests, 0);
  objc_storeStrong((id *)&self->_activeThreadWEDConnectionRequests, 0);
  objc_storeStrong((id *)&self->_activeThreadConnectionRequests, 0);
  objc_storeStrong((id *)&self->_activeIPConnectionRequests, 0);
}

- (HMMTRAccessoryServerBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  return (HMMTRAccessoryServerBrowser *)WeakRetained;
}

- (HMFTimer)idleTimer
{
  return self->_idleTimer;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setFabricIdleTime:(unsigned __int8)a3
{
  self->_fabricIdleTime = a3;
}

- (unsigned)fabricIdleTime
{
  return self->_fabricIdleTime;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)systemCommissionerFabric
{
  return self->_systemCommissionerFabric;
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (unint64_t)hash
{
  v2 = [(HMMTRFabricConnectionRequest *)self fabricID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMMTRFabricConnectionRequest *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    char v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(HMMTRFabricConnectionRequest *)v5 fabricID];
    v7 = [(HMMTRFabricConnectionRequest *)self fabricID];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
LABEL_5:
    char v8 = 0;
  }
LABEL_7:

  return v8;
}

- (id)attributeDescriptions
{
  v23[6] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = [(HMMTRFabricConnectionRequest *)self fabricID];
  v21 = (void *)[v3 initWithName:@"FabricID" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMMTRFabricConnectionRequest *)self systemCommissionerFabric];
  v20 = HMFBooleanToString();
  v5 = (void *)[v4 initWithName:@"SystemCommissionerFabric" value:v20];
  v23[1] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMMTRFabricConnectionRequest *)self activeIPConnectionRequests];
  char v8 = (void *)[v6 initWithName:@"ActiveIPRequests:" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMMTRFabricConnectionRequest *)self activeThreadConnectionRequests];
  v11 = (void *)[v9 initWithName:@"ActiveThreadRequests:" value:v10];
  v23[3] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMMTRFabricConnectionRequest *)self activeThreadWEDConnectionRequests];
  v14 = (void *)[v12 initWithName:@"ActiveThreadWEDRequests:" value:v13];
  v23[4] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  v16 = [(HMMTRFabricConnectionRequest *)self pendingConnectionRequests];
  v17 = (void *)[v15 initWithName:@"PendingRequests:" value:v16];
  v23[5] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:6];

  return v18;
}

- (id)privateDescription
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMMTRFabricConnectionRequest *)self fabricID];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)logIdentifier
{
  id v3 = NSString;
  id v4 = [(HMMTRFabricConnectionRequest *)self fabricID];
  BOOL v5 = [(HMMTRFabricConnectionRequest *)self systemCommissionerFabric];
  id v6 = &stru_2702A0B38;
  if (v5) {
    id v6 = @"/ system commissioner";
  }
  v7 = [v3 stringWithFormat:@"%@%@", v4, v6];

  return v7;
}

- (void)dispatchBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMMTRFabricConnectionRequest *)self workQueue];
  dispatch_async(v5, v4);
}

- (void)updateAllConnectionIdleTimeoutsToMinimum
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    v7 = [(HMMTRFabricConnectionRequest *)v4 fabricID];
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    __int16 v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@updateAllConnectionIdleTimeoutsToMinimum for fabricID: %@", buf, 0x16u);
  }
  char v8 = [MEMORY[0x263EFF9B0] orderedSet];
  p_lock = &v4->_lock;
  os_unfair_lock_lock_with_options();
  v10 = [(NSMutableOrderedSet *)v4->_pendingConnectionRequests array];
  [v8 addObjectsFromArray:v10];

  v11 = [(NSMutableOrderedSet *)v4->_activeIPConnectionRequests array];
  [v8 addObjectsFromArray:v11];

  id v12 = [(NSMutableOrderedSet *)v4->_activeThreadConnectionRequests array];
  [v8 addObjectsFromArray:v12];

  v13 = [(NSMutableOrderedSet *)v4->_activeThreadWEDConnectionRequests array];
  [v8 addObjectsFromArray:v13];

  os_unfair_lock_unlock(p_lock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "updateConnectionIdleTime:", 0, (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void)abortAllOperationsWithReason:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    char v8 = HMFGetLogIdentifier();
    id v9 = [(HMMTRFabricConnectionRequest *)v6 fabricID];
    *(_DWORD *)buf = 138543618;
    v31 = v8;
    __int16 v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@abortAllOperations for fabricID: %@", buf, 0x16u);
  }
  [(HMMTRFabricConnectionRequest *)v6 setActive:0];
  v10 = [(HMMTRFabricConnectionRequest *)v6 idleTimer];
  [v10 suspend];

  v11 = [MEMORY[0x263EFF9B0] orderedSet];
  os_unfair_lock_lock_with_options();
  id v12 = [(NSMutableOrderedSet *)v6->_pendingConnectionRequests array];
  [v11 addObjectsFromArray:v12];

  v13 = [(NSMutableOrderedSet *)v6->_activeIPConnectionRequests array];
  [v11 addObjectsFromArray:v13];

  id v14 = [(NSMutableOrderedSet *)v6->_activeThreadConnectionRequests array];
  [v11 addObjectsFromArray:v14];

  uint64_t v15 = [(NSMutableOrderedSet *)v6->_activeThreadWEDConnectionRequests array];
  [v11 addObjectsFromArray:v15];

  os_unfair_lock_unlock(&v6->_lock);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = *(void **)(*((void *)&v25 + 1) + 8 * v19);
        long long v21 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
        [v20 abortAllPendingOperations:v21];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __61__HMMTRFabricConnectionRequest_abortAllOperationsWithReason___block_invoke;
  v23[3] = &unk_265376E98;
  v23[4] = v6;
  id v24 = v4;
  id v22 = v4;
  [(HMMTRFabricConnectionRequest *)v6 dispatchBlock:v23];
}

void __61__HMMTRFabricConnectionRequest_abortAllOperationsWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) browser];
  [v2 _operationsCompletedForFabricConnectionRequest:*(void *)(a1 + 32) reason:*(void *)(a1 + 40)];
}

- (BOOL)abortOperationsForConnectionRequest:(id)a3 reason:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    id v12 = [v6 nodeID];
    int v21 = 138543618;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@abortOperationsForConnectionRequest for accessoryConnectionRequest for nodeID: %@", (uint8_t *)&v21, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  uint64_t v13 = [(NSMutableOrderedSet *)v9->_activeIPConnectionRequests indexOfObject:v6];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL
    || ([(NSMutableOrderedSet *)v9->_activeIPConnectionRequests objectAtIndex:v13],
        (id v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v15 = [(NSMutableOrderedSet *)v9->_activeThreadConnectionRequests indexOfObject:v6];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL
      || ([(NSMutableOrderedSet *)v9->_activeThreadConnectionRequests objectAtIndex:v15],
          (id v14 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v16 = [(NSMutableOrderedSet *)v9->_activeThreadWEDConnectionRequests indexOfObject:v6];
      if (v16 == 0x7FFFFFFFFFFFFFFFLL
        || ([(NSMutableOrderedSet *)v9->_activeThreadWEDConnectionRequests objectAtIndex:v16],
            (id v14 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v19 = [(NSMutableOrderedSet *)v9->_pendingConnectionRequests indexOfObject:v6];
        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        {
          os_unfair_lock_unlock(&v9->_lock);
        }
        else
        {
          id v14 = [(NSMutableOrderedSet *)v9->_pendingConnectionRequests objectAtIndex:v19];
          os_unfair_lock_unlock(&v9->_lock);
          if (v14) {
            goto LABEL_10;
          }
        }
        BOOL v18 = 0;
        goto LABEL_15;
      }
    }
  }
  os_unfair_lock_unlock(&v9->_lock);
LABEL_10:
  uint64_t v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
  [v14 abortAllPendingOperations:v17];

  BOOL v18 = 1;
LABEL_15:

  return v18;
}

- (void)retryOperations
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(HMMTRFabricConnectionRequest *)self active])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__HMMTRFabricConnectionRequest_retryOperations__block_invoke;
    v7[3] = &unk_265378638;
    v7[4] = self;
    [(HMMTRFabricConnectionRequest *)self dispatchBlock:v7];
  }
  else
  {
    id v3 = (void *)MEMORY[0x2533B64D0]();
    id v4 = self;
    BOOL v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v9 = v6;
      __int16 v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalid state, expecting to be active for retryOperations for %@", buf, 0x16u);
    }
  }
}

uint64_t __47__HMMTRFabricConnectionRequest_retryOperations__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v5;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@retryOperations", buf, 0xCu);
  }
  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = *(id *)(a1 + 32);
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    uint64_t v27 = v10;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);
  }
  v11 = [*(id *)(a1 + 32) browser];
  [v11 operationsStartedForFabricConnectionRequest:*(void *)(a1 + 32)];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "server", (void)v19);
        [v17 triggerEstablishingMatterSubscription];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return [*(id *)(a1 + 32) _connectPendingConnections];
}

- (void)suspendOperations
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __49__HMMTRFabricConnectionRequest_suspendOperations__block_invoke;
  v2[3] = &unk_265378638;
  v2[4] = self;
  [(HMMTRFabricConnectionRequest *)self dispatchBlock:v2];
}

void __49__HMMTRFabricConnectionRequest_suspendOperations__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v5;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@suspendOperations", (uint8_t *)&v13, 0xCu);
  }
  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = *(id *)(a1 + 32);
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = *(void *)(a1 + 32);
    int v13 = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%@", (uint8_t *)&v13, 0x16u);
  }
  [*(id *)(a1 + 32) setActive:0];
  if (([*(id *)(a1 + 32) _hasActiveAccessoryConnections] & 1) == 0)
  {
    v11 = [*(id *)(a1 + 32) idleTimer];
    [v11 suspend];

    id v12 = [*(id *)(a1 + 32) idleTimer];
    [v12 fire];
  }
}

- (void)stopOperations
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __46__HMMTRFabricConnectionRequest_stopOperations__block_invoke;
  v2[3] = &unk_265378638;
  v2[4] = self;
  [(HMMTRFabricConnectionRequest *)self dispatchBlock:v2];
}

void __46__HMMTRFabricConnectionRequest_stopOperations__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    int v12 = 138543362;
    int v13 = v5;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@stopOperations", (uint8_t *)&v12, 0xCu);
  }
  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = *(id *)(a1 + 32);
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = *(void *)(a1 + 32);
    int v12 = 138543618;
    int v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%@", (uint8_t *)&v12, 0x16u);
  }
  [*(id *)(a1 + 32) setActive:0];
  v11 = [*(id *)(a1 + 32) idleTimer];
  [v11 suspend];
}

- (void)startOperations
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __47__HMMTRFabricConnectionRequest_startOperations__block_invoke;
  v2[3] = &unk_265378638;
  v2[4] = self;
  [(HMMTRFabricConnectionRequest *)self dispatchBlock:v2];
}

uint64_t __47__HMMTRFabricConnectionRequest_startOperations__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    int v13 = 138543362;
    __int16 v14 = v5;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@startOperations", (uint8_t *)&v13, 0xCu);
  }
  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = *(id *)(a1 + 32);
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = *(void *)(a1 + 32);
    int v13 = 138543618;
    __int16 v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%@", (uint8_t *)&v13, 0x16u);
  }
  v11 = [*(id *)(a1 + 32) browser];
  [v11 operationsStartedForFabricConnectionRequest:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) setActive:1];
  return [*(id *)(a1 + 32) _connectPendingConnections];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    char v8 = HMFGetLogIdentifier();
    int v14 = 138543362;
    __int16 v15 = v8;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@No activity on fabric, releasing connection", (uint8_t *)&v14, 0xCu);
  }
  id v9 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v10 = v6;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = HMFGetLogIdentifier();
    int v14 = 138543618;
    __int16 v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_DEBUG, "%{public}@%@", (uint8_t *)&v14, 0x16u);
  }
  int v13 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:3];
  [(HMMTRFabricConnectionRequest *)v10 abortAllOperationsWithReason:v13];
}

- (void)_kickIdleTimer
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_DEBUG, "%{public}@_kickIdleTimer", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMMTRFabricConnectionRequest *)v4 idleTimer];
  [v7 resume];
}

- (BOOL)_hasPendingAccessoryConnections
{
  id v2 = [(HMMTRFabricConnectionRequest *)self pendingConnectionRequests];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_hasActiveAccessoryConnections
{
  BOOL v3 = [(HMMTRFabricConnectionRequest *)self activeIPConnectionRequests];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 1;
  }
  BOOL v5 = [(HMMTRFabricConnectionRequest *)self activeThreadConnectionRequests];
  uint64_t v6 = [v5 count];

  if (v6) {
    return 1;
  }
  id v9 = [(HMMTRFabricConnectionRequest *)self activeThreadWEDConnectionRequests];
  BOOL v7 = [v9 count] != 0;

  return v7;
}

- (void)operationsCompletedForAccessoryConnectionRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__HMMTRFabricConnectionRequest_operationsCompletedForAccessoryConnectionRequest___block_invoke;
  v6[3] = &unk_265376E98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HMMTRFabricConnectionRequest *)self dispatchBlock:v6];
}

void __81__HMMTRFabricConnectionRequest_operationsCompletedForAccessoryConnectionRequest___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 40) nodeID];
    int v15 = 138543618;
    __int16 v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Marking operation complete for accessory request: %@", (uint8_t *)&v15, 0x16u);
  }
  if (([*(id *)(a1 + 32) _removeFromActiveIPConnections:*(void *)(a1 + 40)] & 1) == 0
    && ([*(id *)(a1 + 32) _removeFromActiveThreadConnections:*(void *)(a1 + 40)] & 1) == 0
    && ([*(id *)(a1 + 32) _removeFromActiveThreadWEDConnections:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(a1 + 32) _removeFromPendingConnections:*(void *)(a1 + 40)];
  }
  id v7 = [*(id *)(a1 + 32) idleTimer];
  if (([v7 isRunning] & 1) != 0
    || ([*(id *)(a1 + 32) _hasActiveAccessoryConnections] & 1) != 0)
  {

LABEL_10:
    [*(id *)(a1 + 32) _connectPendingConnections];
    return;
  }
  char v8 = [*(id *)(a1 + 32) _hasPendingAccessoryConnections];

  if (v8) {
    goto LABEL_10;
  }
  id v9 = (void *)MEMORY[0x2533B64D0]();
  id v10 = *(id *)(a1 + 32);
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    int v15 = 138543362;
    __int16 v16 = v12;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Marking fabric as idle due to all pending accessory lifeTimer expiring", (uint8_t *)&v15, 0xCu);
  }
  int v13 = *(void **)(a1 + 32);
  int v14 = [v13 idleTimer];
  [v13 timerDidFire:v14];
}

- (void)_connectPendingConnections
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMMTRFabricConnectionRequest *)self active];
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (!v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v40 = v24;
      __int16 v41 = 2112;
      v42 = v5;
      uint64_t v25 = "%{public}@Fabric is currently inactive, do not connect any pending connections: %@";
      __int16 v26 = v7;
      os_log_type_t v27 = OS_LOG_TYPE_INFO;
      uint32_t v28 = 22;
LABEL_27:
      _os_log_impl(&dword_252495000, v26, v27, v25, buf, v28);
    }
LABEL_28:

    return;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    char v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v40 = v8;
    __int16 v41 = 2112;
    v42 = v5;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Connecting pending connections for fabric %@", buf, 0x16u);
  }
  id v9 = [(HMMTRFabricConnectionRequest *)v5 pendingConnectionRequests];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = v5;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v40 = v24;
      uint64_t v25 = "%{public}@No more pending connections";
      __int16 v26 = v7;
      os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
      uint32_t v28 = 12;
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  v11 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int v12 = [(HMMTRFabricConnectionRequest *)v5 pendingConnectionRequests];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        __int16 v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v17 hasPendingHighPriorityConnectionRequest])
        {
          [(HMMTRFabricConnectionRequest *)v5 _removeFromPendingConnections:v17];
          [(HMMTRFabricConnectionRequest *)v5 connectToAccessoryWhenAllowed:v17];
        }
        else
        {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v14);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * j);
        -[HMMTRFabricConnectionRequest _removeFromPendingConnections:](v5, "_removeFromPendingConnections:", v23, (void)v29);
        [(HMMTRFabricConnectionRequest *)v5 connectToAccessoryWhenAllowed:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v20);
  }
}

- (void)connectToAccessoryWhenAllowed:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__HMMTRFabricConnectionRequest_connectToAccessoryWhenAllowed___block_invoke;
  v6[3] = &unk_265376E98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HMMTRFabricConnectionRequest *)self dispatchBlock:v6];
}

void __62__HMMTRFabricConnectionRequest_connectToAccessoryWhenAllowed___block_invoke(uint64_t a1)
{
  uint64_t v132 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 40) nodeID];
    *(_DWORD *)buf = 138543618;
    v123 = v5;
    __int16 v124 = 2112;
    unint64_t v125 = (unint64_t)v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@connectToAccessoryWhenAllowed - nodeID = %@", buf, 0x16u);
  }
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    unint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v123 = v10;
    __int16 v124 = 2112;
    unint64_t v125 = v11;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);
  }
  [*(id *)(a1 + 40) setParentFabricRequest:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 32) _tryMergeIntoExistingConnection:*(void *)(a1 + 40)])
  {
    int v12 = (void *)MEMORY[0x2533B64D0]();
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v123 = v15;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@merged into existing connection", buf, 0xCu);
    }
    return;
  }
  if ([*(id *)(a1 + 32) active])
  {
    __int16 v16 = [*(id *)(a1 + 40) server];
    __int16 v17 = v16;
    if (!v16)
    {
      long long v32 = (void *)MEMORY[0x2533B64D0]();
      id v33 = *(id *)(a1 + 32);
      long long v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        long long v35 = HMFGetLogIdentifier();
        long long v36 = [*(id *)(a1 + 40) nodeID];
        *(_DWORD *)buf = 138543618;
        v123 = v35;
        __int16 v124 = 2112;
        unint64_t v125 = (unint64_t)v36;
        _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_INFO, "%{public}@Accessory server disappeared, aborting all requests for nodeID %@", buf, 0x16u);
      }
      uint64_t v23 = *(void **)(a1 + 40);
      id v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F41FD8];
      uint64_t v26 = 2;
      goto LABEL_21;
    }
    if ([v16 isDisabled])
    {
      id v18 = (void *)MEMORY[0x2533B64D0]();
      id v19 = *(id *)(a1 + 32);
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        long long v22 = [*(id *)(a1 + 40) nodeID];
        *(_DWORD *)buf = 138543618;
        v123 = v21;
        __int16 v124 = 2112;
        unint64_t v125 = (unint64_t)v22;
        _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Accessory server is disabled, aborting all requests for nodeID %@", buf, 0x16u);
      }
      uint64_t v23 = *(void **)(a1 + 40);
      id v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F41FD8];
      uint64_t v26 = 12;
LABEL_21:
      v37 = [v24 errorWithDomain:v25 code:v26 userInfo:0];
      [v23 abortAllPendingOperations:v37];
LABEL_22:

LABEL_23:
      return;
    }
    v38 = [*(id *)(a1 + 32) browser];
    v39 = [*(id *)(a1 + 40) server];
    char v40 = [v38 isOperationAllowedForAccessoryServer:v39];

    if ((v40 & 1) == 0)
    {
      v47 = (void *)MEMORY[0x2533B64D0]();
      id v48 = *(id *)(a1 + 32);
      v49 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
LABEL_32:

        [*(id *)(a1 + 32) _addToPendingConnections:*(void *)(a1 + 40)];
        goto LABEL_23;
      }
      v50 = HMFGetLogIdentifier();
      v51 = [*(id *)(a1 + 40) nodeID];
      *(_DWORD *)buf = 138543618;
      v123 = v50;
      __int16 v124 = 2112;
      unint64_t v125 = (unint64_t)v51;
      v52 = "%{public}@Operations currently not allowed for this nodeID. Adding accessory connection request for nodeID %"
            "@ to pending queue";
LABEL_31:
      _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_INFO, v52, buf, 0x16u);

      goto LABEL_32;
    }
    __int16 v41 = [*(id *)(a1 + 32) browser];
    v42 = [v41 threadRadioManager];
    char v43 = [v42 deviceSupportsThreadService];

    unint64_t v44 = [v17 linkLayerType];
    if ([v17 isWEDDevice]
      && ([v17 eMACAddress], v45 = objc_claimAutoreleasedReturnValue(), v45, v45))
    {
      int v46 = 1;
    }
    else
    {
      if (v44 < 3) {
        goto LABEL_34;
      }
      if (v44 != 4)
      {
        v56 = (void *)MEMORY[0x2533B64D0]();
        id v57 = *(id *)(a1 + 32);
        v58 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v59 = HMFGetLogIdentifier();
          v60 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v123 = v59;
          __int16 v124 = 2048;
          unint64_t v125 = v44;
          __int16 v126 = 2112;
          v127 = v60;
          _os_log_impl(&dword_252495000, v58, OS_LOG_TYPE_INFO, "%{public}@Unsupported linkLayerType: %ld for request %@", buf, 0x20u);
        }
        uint64_t v23 = *(void **)(a1 + 40);
        id v24 = (void *)MEMORY[0x263F087E8];
        uint64_t v25 = *MEMORY[0x263F41FD8];
        uint64_t v26 = 5;
        goto LABEL_21;
      }
      int v46 = 0;
    }
    v53 = *(void **)(a1 + 32);
    if ((v43 & 1) == 0) {
      goto LABEL_43;
    }
    v54 = [v53 browser];
    if (![v54 connectionRequestSuspended])
    {

      if ((v46 & 1) == 0) {
        goto LABEL_54;
      }
LABEL_62:
      v81 = [*(id *)(a1 + 32) browser];
      v82 = [v81 threadRadioManager];
      int v83 = [v82 isThreadNetworkConnected];

      v84 = *(void **)(a1 + 32);
      if (!v83)
      {
        v85 = [v84 activeThreadConnectionRequests];
        uint64_t v86 = [v85 count];

        if (v86)
        {
          v47 = (void *)MEMORY[0x2533B64D0]();
          id v48 = *(id *)(a1 + 32);
          v49 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_INFO)) {
            goto LABEL_32;
          }
          v50 = HMFGetLogIdentifier();
          v51 = [*(id *)(a1 + 40) nodeID];
          *(_DWORD *)buf = 138543618;
          v123 = v50;
          __int16 v124 = 2112;
          unint64_t v125 = (unint64_t)v51;
          v52 = "%{public}@Waiting for active thread operations to complete, add to pending queue for nodeID %@";
          goto LABEL_31;
        }
        v98 = [*(id *)(a1 + 32) activeThreadWEDConnectionRequests];
        uint64_t v99 = [v98 count];

        if (v99)
        {
          v100 = (void *)MEMORY[0x2533B64D0]();
          id v101 = *(id *)(a1 + 32);
          v102 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
          {
            v103 = HMFGetLogIdentifier();
            v104 = [*(id *)(a1 + 40) nodeID];
            *(_DWORD *)buf = 138543618;
            v123 = v103;
            __int16 v124 = 2112;
            unint64_t v125 = (unint64_t)v104;
            _os_log_impl(&dword_252495000, v102, OS_LOG_TYPE_INFO, "%{public}@Too many active WED session, add to pending queue for nodeID %@", buf, 0x16u);
          }
          [*(id *)(a1 + 32) _addToPendingConnections:*(void *)(a1 + 40)];
          [*(id *)(a1 + 32) _updateActiveThreadWEDConnectionsIdleTime:1];
          goto LABEL_23;
        }
        v114 = [*(id *)(a1 + 32) browser];
        v115 = [v114 threadRadioManager];
        int v116 = [v115 isReadyToEstablishWEDConnection];

        if (v116)
        {
          [*(id *)(a1 + 32) _addToActiveThreadWEDConnections:*(void *)(a1 + 40)];
          goto LABEL_23;
        }
        v105 = (void *)MEMORY[0x2533B64D0]();
        id v106 = *(id *)(a1 + 32);
        v107 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
        {
          v108 = HMFGetLogIdentifier();
          v109 = [*(id *)(a1 + 40) nodeID];
          *(_DWORD *)buf = 138543618;
          v123 = v108;
          __int16 v124 = 2112;
          unint64_t v125 = (unint64_t)v109;
          v110 = "%{public}@Not ready to establish a WED session, add to pending queue for nodeID %@";
          goto LABEL_78;
        }
        goto LABEL_79;
      }
      goto LABEL_68;
    }
    if ([v17 isPaired])
    {
      char v55 = [v17 isPairingInProgress];

      if ((v55 & 1) == 0)
      {
        if (v46) {
          goto LABEL_62;
        }
LABEL_54:
        v70 = [*(id *)(a1 + 32) activeThreadWEDConnectionRequests];
        uint64_t v71 = [v70 count];

        if (v71)
        {
          v47 = (void *)MEMORY[0x2533B64D0]();
          id v48 = *(id *)(a1 + 32);
          v49 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_INFO)) {
            goto LABEL_32;
          }
          v50 = HMFGetLogIdentifier();
          v51 = [*(id *)(a1 + 40) nodeID];
          *(_DWORD *)buf = 138543618;
          v123 = v50;
          __int16 v124 = 2112;
          unint64_t v125 = (unint64_t)v51;
          v52 = "%{public}@Active WED session, add thread request to pending queue for nodeID %@";
          goto LABEL_31;
        }
        v87 = [*(id *)(a1 + 32) browser];
        v88 = [v87 threadRadioManager];
        int v89 = [v88 isThreadNetworkConnected];

        if (!v89)
        {
          v105 = (void *)MEMORY[0x2533B64D0]();
          id v106 = *(id *)(a1 + 32);
          v107 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
          {
            v108 = HMFGetLogIdentifier();
            v109 = [*(id *)(a1 + 40) nodeID];
            *(_DWORD *)buf = 138543618;
            v123 = v108;
            __int16 v124 = 2112;
            unint64_t v125 = (unint64_t)v109;
            v110 = "%{public}@Thread is not connected, add request to pending queue for nodeID %@";
LABEL_78:
            _os_log_impl(&dword_252495000, v107, OS_LOG_TYPE_INFO, v110, buf, 0x16u);
          }
LABEL_79:

          [*(id *)(a1 + 32) _addToPendingConnections:*(void *)(a1 + 40)];
          int v111 = [*(id *)(a1 + 32) systemCommissionerFabric];
          v37 = [*(id *)(a1 + 32) browser];
          v112 = [v37 threadRadioManager];
          v113 = [*(id *)(a1 + 32) fabricID];
          if (v111) {
            [v112 startThreadRadioForSystemCommissionerFabricID:v113];
          }
          else {
            [v112 startThreadRadioForHomeWithFabricID:v113];
          }

          goto LABEL_22;
        }
        v84 = *(void **)(a1 + 32);
LABEL_68:
        [v84 _addToActiveThreadConnections:*(void *)(a1 + 40)];
        goto LABEL_23;
      }
    }
    else
    {
    }
    v61 = [*(id *)(a1 + 32) browser];
    v62 = [v61 threadRadioManager];
    int v63 = [v62 isThreadNetworkConnected];

    if (v63)
    {
      v64 = (void *)MEMORY[0x2533B64D0]();
      id v65 = *(id *)(a1 + 32);
      v66 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        v67 = HMFGetLogIdentifier();
        v68 = [*(id *)(a1 + 40) nodeID];
        v69 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v123 = v67;
        __int16 v124 = 2112;
        unint64_t v125 = (unint64_t)v68;
        __int16 v126 = 2112;
        v127 = v69;
        _os_log_impl(&dword_252495000, v66, OS_LOG_TYPE_INFO, "%{public}@Accessory connection request for nodeID: %@ (isWED: %@) is for accessory getting paired, handling as normal thread connection since thread is connected", buf, 0x20u);
      }
      if ((v46 & 1) == 0) {
        goto LABEL_54;
      }
      goto LABEL_62;
    }
    if (v46)
    {
      v72 = [*(id *)(a1 + 32) browser];
      v73 = [v72 threadRadioManager];
      int v74 = [v73 isReadyToEstablishWEDConnection];

      if (v74)
      {
        v75 = (void *)MEMORY[0x2533B64D0]();
        id v76 = *(id *)(a1 + 32);
        v77 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          v78 = HMFGetLogIdentifier();
          v79 = [*(id *)(a1 + 40) nodeID];
          v80 = HMFBooleanToString();
          *(_DWORD *)buf = 138543874;
          v123 = v78;
          __int16 v124 = 2112;
          unint64_t v125 = (unint64_t)v79;
          __int16 v126 = 2112;
          v127 = v80;
          _os_log_impl(&dword_252495000, v77, OS_LOG_TYPE_INFO, "%{public}@Accessory connection request for nodeID: %@ (isWED: %@) is for accessory getting paired, handling as normal WED connection since we're ready to establish WED connection", buf, 0x20u);
        }
        goto LABEL_62;
      }
    }
    v90 = (void *)MEMORY[0x2533B64D0]();
    id v91 = *(id *)(a1 + 32);
    v92 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      v118 = HMFGetLogIdentifier();
      v117 = [*(id *)(a1 + 40) nodeID];
      v93 = HMFBooleanToString();
      v120 = [*(id *)(a1 + 32) browser];
      v119 = [v120 threadRadioManager];
      [v119 isThreadNetworkConnected];
      v94 = HMFBooleanToString();
      [*(id *)(a1 + 32) browser];
      v95 = v121 = v90;
      v96 = [v95 threadRadioManager];
      [v96 isReadyToEstablishWEDConnection];
      v97 = HMFBooleanToString();
      *(_DWORD *)buf = 138544386;
      v123 = v118;
      __int16 v124 = 2112;
      unint64_t v125 = (unint64_t)v117;
      __int16 v126 = 2112;
      v127 = v93;
      __int16 v128 = 2112;
      v129 = v94;
      __int16 v130 = 2112;
      v131 = v97;
      _os_log_impl(&dword_252495000, v92, OS_LOG_TYPE_INFO, "%{public}@Accessory connection request for nodeID: %@ (isWED: %@) is for accessory getting paired, add to active IP list because !isThreadNetworkConnected(%@) and !isReadyToEstablishWEDConnection(%@)", buf, 0x34u);

      v90 = v121;
    }

LABEL_34:
    v53 = *(void **)(a1 + 32);
LABEL_43:
    [v53 _addToActiveIPConnections:*(void *)(a1 + 40)];
    goto LABEL_23;
  }
  os_log_type_t v27 = (void *)MEMORY[0x2533B64D0]();
  id v28 = *(id *)(a1 + 32);
  long long v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    long long v30 = HMFGetLogIdentifier();
    long long v31 = [*(id *)(a1 + 40) nodeID];
    *(_DWORD *)buf = 138543618;
    v123 = v30;
    __int16 v124 = 2112;
    unint64_t v125 = (unint64_t)v31;
    _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_INFO, "%{public}@Fabric is not active. Adding accessory connection request for nodeID %@ to pending queue", buf, 0x16u);
  }
  [*(id *)(a1 + 32) _addToPendingConnections:*(void *)(a1 + 40)];
}

- (BOOL)hasPendingHighPriorityConnectionRequest
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(HMMTRFabricConnectionRequest *)self pendingConnectionRequests];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) hasPendingHighPriorityConnectionRequest])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_removeFromPendingConnections:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableOrderedSet *)self->_pendingConnectionRequests containsObject:v4])
  {
    [(NSMutableOrderedSet *)self->_pendingConnectionRequests removeObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    id v5 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v6 = self;
    long long v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      long long v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      long long v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Removed pending connection to accessory: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_addToPendingConnections:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableOrderedSet *)self->_pendingConnectionRequests containsObject:v4])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    [(NSMutableOrderedSet *)self->_pendingConnectionRequests addObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    id v5 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v6 = self;
    long long v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      long long v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      long long v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Pending connection to accessory: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (id)pendingConnectionRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = [(NSMutableOrderedSet *)self->_pendingConnectionRequests array];
  uint64_t v6 = [v4 arrayWithArray:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)_tryMergeIntoExistingConnection:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(NSMutableOrderedSet *)self->_activeIPConnectionRequests indexOfObject:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL
    && ([(NSMutableOrderedSet *)self->_activeIPConnectionRequests objectAtIndex:v5],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    || (uint64_t v7 = [(NSMutableOrderedSet *)self->_activeThreadConnectionRequests indexOfObject:v4],
        v7 != 0x7FFFFFFFFFFFFFFFLL)
    && ([(NSMutableOrderedSet *)self->_activeThreadConnectionRequests objectAtIndex:v7],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v8 = 1;
    goto LABEL_9;
  }
  uint64_t v9 = [(NSMutableOrderedSet *)self->_activeThreadWEDConnectionRequests indexOfObject:v4];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [(NSMutableOrderedSet *)self->_activeThreadWEDConnectionRequests objectAtIndex:v9];
    int v10 = [v6 wedConnectionPending];
    if (v6)
    {
      int v8 = v10 ^ 1;
LABEL_9:
      os_unfair_lock_unlock(&self->_lock);
      [v6 mergeAccessoryConnectionRequest:v4];
      if (v8) {
        [v6 executeAllPendingOperations];
      }
      goto LABEL_15;
    }
  }
  uint64_t v11 = [(NSMutableOrderedSet *)self->_pendingConnectionRequests indexOfObject:v4];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_unfair_lock_unlock(&self->_lock);
LABEL_16:
    BOOL v12 = 0;
    goto LABEL_17;
  }
  uint64_t v6 = [(NSMutableOrderedSet *)self->_pendingConnectionRequests objectAtIndex:v11];
  os_unfair_lock_unlock(&self->_lock);
  if (!v6) {
    goto LABEL_16;
  }
  [v6 mergeAccessoryConnectionRequest:v4];
LABEL_15:
  [(HMMTRFabricConnectionRequest *)self _kickIdleTimer];

  BOOL v12 = 1;
LABEL_17:

  return v12;
}

- (BOOL)_removeFromActiveThreadWEDConnections:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  int v5 = [(NSMutableOrderedSet *)self->_activeThreadWEDConnectionRequests containsObject:v4];
  if (v5)
  {
    [(NSMutableOrderedSet *)self->_activeThreadWEDConnectionRequests removeObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed active thread WED connection for accessory %@", buf, 0x16u);
    }
    int v10 = [v4 server];
    uint64_t v11 = v10;
    if (!v10 || ([v10 hasPreferredLocalLink] & 1) != 0) {
      goto LABEL_12;
    }
    BOOL v12 = [(HMMTRFabricConnectionRequest *)v7 browser];
    if ([v12 connectionRequestSuspended])
    {
      uint64_t v13 = [(HMMTRFabricConnectionRequest *)v7 browser];
      uint64_t v14 = [v4 server];
      char v15 = [v13 isOperationAllowedForAccessoryServer:v14];

      if (v15) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    [v11 handleWEDDisconnectedWhileNotPairing];
LABEL_12:

    __int16 v16 = [(HMMTRFabricConnectionRequest *)v7 browser];
    __int16 v17 = [v16 threadRadioManager];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __70__HMMTRFabricConnectionRequest__removeFromActiveThreadWEDConnections___block_invoke;
    long long v22 = &unk_265378660;
    uint64_t v23 = v7;
    id v24 = v4;
    [v17 connectToAccessoryWithExtendedMACAddress:0 completion:&v19];

    [(HMMTRFabricConnectionRequest *)v7 _calculateFabricIdleTime];
    goto LABEL_13;
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_13:

  return v5;
}

void __70__HMMTRFabricConnectionRequest__removeFromActiveThreadWEDConnections___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = [*(id *)(a1 + 40) server];
      int v9 = 138543874;
      int v10 = v7;
      __int16 v11 = 2112;
      BOOL v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to disconnect from WED accessory %@, error %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)_updateActiveThreadWEDConnectionsIdleTime:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(HMMTRFabricConnectionRequest *)self activeThreadWEDConnectionRequests];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) updateConnectionIdleTime:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(HMMTRFabricConnectionRequest *)self _calculateFabricIdleTime];
}

- (void)_addToActiveThreadWEDConnections:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(NSMutableOrderedSet *)self->_activeThreadWEDConnectionRequests indexOfObject:v4];
  activeThreadWEDConnectionRequests = self->_activeThreadWEDConnectionRequests;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableOrderedSet *)activeThreadWEDConnectionRequests addObject:v4];
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = -[NSMutableOrderedSet objectAtIndex:](activeThreadWEDConnectionRequests, "objectAtIndex:");
    [v7 mergeAccessoryConnectionRequest:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v8 = [(HMMTRFabricConnectionRequest *)self idleTimer];
  [v8 suspend];

  if (v7)
  {
    if ([v4 wedConnectionPending])
    {
      uint64_t v9 = (void *)MEMORY[0x2533B64D0]();
      long long v10 = self;
      long long v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        long long v12 = HMFGetLogIdentifier();
        long long v13 = [v4 nodeID];
        *(_DWORD *)buf = 138543618;
        __int16 v27 = v12;
        __int16 v28 = 2112;
        uint64_t v29 = v13;
        _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@WED connection is still pending for request: %@", buf, 0x16u);
      }
    }
    else
    {
      [v7 executeAllPendingOperations];
      [(HMMTRFabricConnectionRequest *)self _kickIdleTimer];
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      __int16 v17 = HMFGetLogIdentifier();
      id v18 = [v4 nodeID];
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Adding active thread WED connection for request: %@", buf, 0x16u);
    }
    [v4 setWedConnectionPending:1];
    [v4 updateConnectionIdleTime:2];
    [(HMMTRFabricConnectionRequest *)v15 _calculateFabricIdleTime];
    [v4 kickIdleTimer];
    [(HMMTRFabricConnectionRequest *)v15 _kickIdleTimer];
    uint64_t v19 = [v4 server];
    uint64_t v20 = [v19 eMACAddress];
    uint64_t v21 = [v20 dataUsingEncoding:4];

    long long v22 = [(HMMTRFabricConnectionRequest *)v15 browser];
    uint64_t v23 = [v22 threadRadioManager];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __65__HMMTRFabricConnectionRequest__addToActiveThreadWEDConnections___block_invoke;
    v24[3] = &unk_265378660;
    v24[4] = v15;
    id v25 = v4;
    [v23 connectToAccessoryWithExtendedMACAddress:v21 completion:v24];
  }
}

void __65__HMMTRFabricConnectionRequest__addToActiveThreadWEDConnections___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__HMMTRFabricConnectionRequest__addToActiveThreadWEDConnections___block_invoke_2;
  v6[3] = &unk_265376F38;
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 dispatchBlock:v6];
}

void __65__HMMTRFabricConnectionRequest__addToActiveThreadWEDConnections___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)MEMORY[0x2533B64D0]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = [*(id *)(a1 + 48) server];
      id v7 = [*(id *)(a1 + 48) server];
      uint64_t v8 = [v7 eMACAddress];
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138544130;
      __int16 v16 = v5;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to establish WED connection to accessory %@ with emac %@, error %@", (uint8_t *)&v15, 0x2Au);
    }
    [*(id *)(a1 + 48) abortAllPendingOperations:*(void *)(a1 + 32)];
    long long v10 = [*(id *)(a1 + 40) browser];
    uint64_t v11 = *(void *)(a1 + 40);
    long long v12 = [MEMORY[0x263F087E8] hmmtrErrorWithCode:14];
    [v10 _operationsCompletedForFabricConnectionRequest:v11 reason:v12];
  }
  else
  {
    [*(id *)(a1 + 48) setWedConnectionPending:0];
    long long v13 = [*(id *)(a1 + 48) server];
    [v13 triggerEstablishingMatterSubscription];

    [*(id *)(a1 + 48) executeAllPendingOperations];
    id v14 = *(void **)(a1 + 40);
    [v14 _kickIdleTimer];
  }
}

- (id)activeThreadWEDConnectionRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = [(NSMutableOrderedSet *)self->_activeThreadWEDConnectionRequests array];
  uint64_t v6 = [v4 arrayWithArray:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)_removeFromActiveThreadConnections:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  int v5 = [(NSMutableOrderedSet *)self->_activeThreadConnectionRequests containsObject:v4];
  if (v5)
  {
    [(NSMutableOrderedSet *)self->_activeThreadConnectionRequests removeObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      long long v10 = [v4 nodeID];
      int v12 = 138543618;
      long long v13 = v9;
      __int16 v14 = 2112;
      int v15 = v10;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed active thread connection for accessory %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  return v5;
}

- (void)_addToActiveThreadConnections:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(NSMutableOrderedSet *)self->_activeThreadConnectionRequests indexOfObject:v4];
  activeThreadConnectionRequests = self->_activeThreadConnectionRequests;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableOrderedSet *)activeThreadConnectionRequests addObject:v4];
    id v7 = 0;
  }
  else
  {
    id v7 = -[NSMutableOrderedSet objectAtIndex:](activeThreadConnectionRequests, "objectAtIndex:");
    [v7 mergeAccessoryConnectionRequest:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v8 = [(HMMTRFabricConnectionRequest *)self idleTimer];
  [v8 suspend];

  if (v7)
  {
    [v7 executeAllPendingOperations];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x2533B64D0]();
    long long v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = HMFGetLogIdentifier();
      long long v13 = [v4 nodeID];
      int v15 = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v13;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Adding active thread connection for request: %@", (uint8_t *)&v15, 0x16u);
    }
    [v4 updateConnectionIdleTime:0];
    [(HMMTRFabricConnectionRequest *)v10 _calculateFabricIdleTime];
    __int16 v14 = [v4 server];
    [v14 triggerEstablishingMatterSubscription];

    [v4 executeAllPendingOperations];
  }
  [(HMMTRFabricConnectionRequest *)self _kickIdleTimer];
}

- (id)activeThreadConnectionRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v5 = [(NSMutableOrderedSet *)self->_activeThreadConnectionRequests array];
  uint64_t v6 = [v4 arrayWithArray:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)_removeFromActiveIPConnections:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  int v5 = [(NSMutableOrderedSet *)self->_activeIPConnectionRequests containsObject:v4];
  if (v5)
  {
    [(NSMutableOrderedSet *)self->_activeIPConnectionRequests removeObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      long long v10 = [v4 nodeID];
      int v12 = 138543618;
      long long v13 = v9;
      __int16 v14 = 2112;
      int v15 = v10;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed active IP connection for accessory %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  return v5;
}

- (void)_addToActiveIPConnections:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(NSMutableOrderedSet *)self->_activeIPConnectionRequests indexOfObject:v4];
  activeIPConnectionRequests = self->_activeIPConnectionRequests;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableOrderedSet *)activeIPConnectionRequests addObject:v4];
    id v7 = 0;
  }
  else
  {
    id v7 = -[NSMutableOrderedSet objectAtIndex:](activeIPConnectionRequests, "objectAtIndex:");
    [v7 mergeAccessoryConnectionRequest:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v8 = [(HMMTRFabricConnectionRequest *)self idleTimer];
  [v8 suspend];

  if (v7)
  {
    [v7 executeAllPendingOperations];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x2533B64D0]();
    long long v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = HMFGetLogIdentifier();
      long long v13 = [v4 nodeID];
      int v14 = 138543618;
      int v15 = v12;
      __int16 v16 = 2112;
      __int16 v17 = v13;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Adding active IP connection for request: %@", (uint8_t *)&v14, 0x16u);
    }
    [v4 updateConnectionIdleTime:0];
    [(HMMTRFabricConnectionRequest *)v10 _calculateFabricIdleTime];
    [v4 executeAllPendingOperations];
  }
  [(HMMTRFabricConnectionRequest *)self _kickIdleTimer];
}

- (id)activeIPConnectionRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v5 = [(NSMutableOrderedSet *)self->_activeIPConnectionRequests array];
  uint64_t v6 = [v4 arrayWithArray:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_restartConnectionIdleTimer:(double)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HMMTRFabricConnectionRequest *)self idleTimer];
  int v6 = [v5 isRunning];

  id v7 = [(HMMTRFabricConnectionRequest *)self idleTimer];
  [v7 suspend];

  uint64_t v8 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v9 = self;
  long long v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v16 = 138543618;
    __int16 v17 = v11;
    __int16 v18 = 2048;
    double v19 = a3;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Updating FabricConnectionRequest Idle time to: %f", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v12 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:a3];
  idleTimer = v9->_idleTimer;
  v9->_idleTimer = (HMFTimer *)v12;

  int v14 = [(HMMTRFabricConnectionRequest *)v9 workQueue];
  [(HMFTimer *)v9->_idleTimer setDelegateQueue:v14];

  [(HMFTimer *)v9->_idleTimer setDelegate:v9];
  if (v6)
  {
    int v15 = [(HMMTRFabricConnectionRequest *)v9 idleTimer];
    [v15 resume];
  }
}

- (void)_updateConnectionIdleTime:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if ([(HMMTRFabricConnectionRequest *)self fabricIdleTime] != a3
    && [(HMMTRFabricConnectionRequest *)self _hasActiveAccessoryConnections])
  {
    [(HMMTRFabricConnectionRequest *)self setFabricIdleTime:v3];
    double v5 = 35.0;
    if (v3 != 1) {
      double v5 = 15.0;
    }
    [(HMMTRFabricConnectionRequest *)self _restartConnectionIdleTimer:v5];
  }
}

- (void)_calculateFabricIdleTime
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [(HMMTRFabricConnectionRequest *)self activeThreadWEDConnectionRequests];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) connectionIdleTime] == 2)
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(HMMTRFabricConnectionRequest *)self _updateConnectionIdleTime:v4];
}

- (HMMTRFabricConnectionRequest)initWithQueue:(id)a3 browser:(id)a4 fabricID:(id)a5 systemCommissionerFabric:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HMMTRFabricConnectionRequest;
  int v14 = [(HMMTRFabricConnectionRequest *)&v29 init];
  int v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_workQueue, a3);
    objc_storeWeak((id *)&v15->_browser, v12);
    v15->_active = 0;
    uint64_t v16 = [v13 copy];
    fabricID = v15->_fabricID;
    v15->_fabricID = (NSNumber *)v16;

    v15->_systemCommissionerFabric = a6;
    uint64_t v18 = [MEMORY[0x263EFF9B0] orderedSet];
    activeIPConnectionRequests = v15->_activeIPConnectionRequests;
    v15->_activeIPConnectionRequests = (NSMutableOrderedSet *)v18;

    uint64_t v20 = [MEMORY[0x263EFF9B0] orderedSet];
    activeThreadConnectionRequests = v15->_activeThreadConnectionRequests;
    v15->_activeThreadConnectionRequests = (NSMutableOrderedSet *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9B0] orderedSet];
    activeThreadWEDConnectionRequests = v15->_activeThreadWEDConnectionRequests;
    v15->_activeThreadWEDConnectionRequests = (NSMutableOrderedSet *)v22;

    uint64_t v24 = [MEMORY[0x263EFF9B0] orderedSet];
    pendingConnectionRequests = v15->_pendingConnectionRequests;
    v15->_pendingConnectionRequests = (NSMutableOrderedSet *)v24;

    v15->_fabricIdleTime = 0;
    uint64_t v26 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:15.0];
    idleTimer = v15->_idleTimer;
    v15->_idleTimer = (HMFTimer *)v26;

    [(HMFTimer *)v15->_idleTimer setDelegateQueue:v11];
    [(HMFTimer *)v15->_idleTimer setDelegate:v15];
  }

  return v15;
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t64 != -1) {
    dispatch_once(&logCategory__hmf_once_t64, &__block_literal_global_4834);
  }
  id v2 = (void *)logCategory__hmf_once_v65;
  return v2;
}

uint64_t __43__HMMTRFabricConnectionRequest_logCategory__block_invoke()
{
  logCategory__hmf_once_id v65 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end