@interface BKSHIDEventObserver
+ (BKSHIDEventObserver)sharedInstance;
- (BKSHIDEventObserver)init;
- (NSSet)deferringObservations;
- (id)_init;
- (id)addDeferringObserver:(id)a3;
- (id)addObservingClient:(id)a3 forChainObserver:(id)a4;
- (void)_lock_disableObservation;
- (void)_lock_enableObservation;
- (void)_lock_resetChainObserverPredicates;
- (void)didUpdateDeferringChains:(id)a3;
- (void)didUpdateDeferringObservations:(id)a3;
@end

@implementation BKSHIDEventObserver

- (void)didUpdateDeferringObservations:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (BSEqualObjects())
  {
    v6 = 0;
  }
  else
  {
    v7 = (NSSet *)[v4 copy];
    lock_deferringObservations = self->_lock_deferringObservations;
    self->_lock_deferringObservations = v7;

    v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMapTable count](self->_lock_deferringAssertionsToObservers, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v9 = [(NSMapTable *)self->_lock_deferringAssertionsToObservers objectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          [v6 addObject:*(void *)(*((void *)&v23 + 1) + 8 * v13++)];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v11);
    }
  }
  os_unfair_lock_unlock(p_lock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "deferringResolutionsChanged", (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (NSSet)deferringObservations
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if ([(NSMapTable *)self->_lock_deferringAssertionsToObservers count])
  {
    uint64_t v4 = [(NSSet *)self->_lock_deferringObservations copy];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  v5 = (void *)v4;
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v5;
}

- (id)addDeferringObserver:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      uint64_t v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      long long v19 = v14;
      __int16 v20 = 2048;
      long long v21 = self;
      __int16 v22 = 2114;
      long long v23 = @"BKSHIDEventObserver.m";
      __int16 v24 = 1024;
      int v25 = 145;
      __int16 v26 = 2114;
      v27 = v11;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1F6A4);
  }
  v6 = v5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v7 = objc_alloc(MEMORY[0x1E4F4F838]);
  v8 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v6];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__BKSHIDEventObserver_addDeferringObserver___block_invoke;
  v15[3] = &unk_1E5440C98;
  v15[4] = self;
  v9 = (void *)[v7 initWithIdentifier:@"BKSHIDEventObserver-deferringObserver" forReason:v8 invalidationBlock:v15];

  if (![(NSMapTable *)self->_lock_deferringAssertionsToObservers count]) {
    [(BKSHIDEventObserver *)self _lock_enableObservation];
  }
  [(NSMapTable *)self->_lock_deferringAssertionsToObservers setObject:v6 forKey:v9];
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (void)_lock_enableObservation
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [(BSServiceConnection *)self->_connection remoteTarget];
  id v6 = [v3 setObservesDeferringResolutions:MEMORY[0x1E4F1CC38]];

  if (v6)
  {
    uint64_t v4 = (NSSet *)v6;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  lock_deferringObservations = self->_lock_deferringObservations;
  self->_lock_deferringObservations = v4;
}

+ (BKSHIDEventObserver)sharedInstance
{
  if (sharedInstance_onceToken_3207 != -1) {
    dispatch_once(&sharedInstance_onceToken_3207, &__block_literal_global_3208);
  }
  v2 = (void *)sharedInstance___instance;
  return (BKSHIDEventObserver *)v2;
}

void __28__BKSHIDEventObserver__init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED7719E8];
  id v5 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED779310];
  id v6 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"BKHIDEventDeliveryObserver"];
  [v6 setServer:v5];
  [v6 setClient:v4];
  [v3 setInterface:v6];
  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  id v7 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v7];

  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __28__BKSHIDEventObserver__init__block_invoke_2;
  uint64_t v11 = &unk_1E5440C70;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v12 = *(id *)(a1 + 32);
  [v3 setInterruptionHandler:&v8];
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_100, v8, v9, v10, v11);

  objc_destroyWeak(&v13);
}

uint64_t __37__BKSHIDEventObserver_sharedInstance__block_invoke()
{
  id v0 = [[BKSHIDEventObserver alloc] _init];
  uint64_t v1 = sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_init
{
  v17.receiver = self;
  v17.super_class = (Class)BKSHIDEventObserver;
  v2 = [(BKSHIDEventObserver *)&v17 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)Serial;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    lock_deferringAssertionsToObservers = v2->_lock_deferringAssertionsToObservers;
    v2->_lock_deferringAssertionsToObservers = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
    lock_deferringObservations = v2->_lock_deferringObservations;
    v2->_lock_deferringObservations = (NSSet *)v7;

    objc_initWeak(&location, v2);
    uint64_t v9 = +[BKSHIDServiceConnection clientConnectionForServiceWithName:@"BKHIDEventDeliveryObserver"];
    connection = v2->_connection;
    v2->_connection = (BSServiceConnection *)v9;

    uint64_t v11 = v2->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __28__BKSHIDEventObserver__init__block_invoke;
    v13[3] = &unk_1E5441380;
    id v14 = v2;
    objc_copyWeak(&v15, &location);
    [(BSServiceConnection *)v11 configureConnection:v13];
    [(BSServiceConnection *)v2->_connection activate];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lock_allChainObserverPredicates, 0);
  objc_storeStrong((id *)&self->_lock_identityToChainMatches, 0);
  objc_storeStrong((id *)&self->_lock_chainObserverContainers, 0);
  objc_storeStrong((id *)&self->_lock_deferringObservations, 0);
  objc_storeStrong((id *)&self->_lock_deferringAssertionsToObservers, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (void)didUpdateDeferringChains:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_lock_identityToChainMatches mutableCopy];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v14 = [v13 identity];
        [v6 setObject:v13 forKey:v14];

        id v15 = [v13 identity];
        [v7 removeObjectForKey:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v10);
  }
  v32 = v8;

  uint64_t v16 = (NSMutableDictionary *)[v6 copy];
  lock_identityToChainMatches = self->_lock_identityToChainMatches;
  self->_lock_identityToChainMatches = v16;

  __int16 v18 = (void *)[(NSMutableSet *)self->_lock_chainObserverContainers copy];
  os_unfair_lock_unlock(p_lock);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
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
        __int16 v24 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        int v25 = [v24 requestedChainIdentity];
        __int16 v26 = [v7 objectForKey:v25];

        if (v26)
        {
          v27 = [v24 observingClient];
          uint64_t v28 = [v24 observerInterface];
          [v27 observer:v28 deliveryChainDidUpdate:0];
        }
        uint64_t v29 = [v6 objectForKey:v25];
        if (v29)
        {
          v30 = [v24 observingClient];
          v31 = [v24 observerInterface];
          [v30 observer:v31 deliveryChainDidUpdate:v29];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v21);
  }
}

- (void)_lock_disableObservation
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = [(BSServiceConnection *)self->_connection remoteTarget];
  id v4 = (id)[v3 setObservesDeferringResolutions:MEMORY[0x1E4F1CC28]];

  lock_deferringObservations = self->_lock_deferringObservations;
  self->_lock_deferringObservations = 0;
}

- (void)_lock_resetChainObserverPredicates
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  [(NSMutableSet *)self->_lock_allChainObserverPredicates removeAllObjects];
  if (!self->_lock_allChainObserverPredicates)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    lock_allChainObserverPredicates = self->_lock_allChainObserverPredicates;
    self->_lock_allChainObserverPredicates = v3;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_lock_chainObserverContainers;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = self->_lock_allChainObserverPredicates;
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "requestedChainIdentity", (void)v14);
        [(NSMutableSet *)v10 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [(BSServiceConnection *)self->_connection remoteTarget];
  id v13 = [(NSMutableSet *)self->_lock_allChainObserverPredicates allObjects];
  [v12 setObservesDeferringChainIdentities:v13];
}

- (id)addObservingClient:(id)a3 forChainObserver:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v22 = NSString;
    objc_opt_class();
    long long v23 = (objc_class *)objc_opt_class();
    __int16 v24 = NSStringFromClass(v23);
    int v25 = [v22 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"observer", v24];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = NSStringFromSelector(a2);
      v27 = (objc_class *)objc_opt_class();
      uint64_t v28 = NSStringFromClass(v27);
      *(_DWORD *)buf = 138544642;
      v41 = v26;
      __int16 v42 = 2114;
      uint64_t v43 = v28;
      __int16 v44 = 2048;
      v45 = self;
      __int16 v46 = 2114;
      v47 = @"BKSHIDEventObserver.m";
      __int16 v48 = 1024;
      int v49 = 178;
      __int16 v50 = 2114;
      v51 = v25;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA3C7C0);
  }
  uint64_t v9 = v8;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v29 = NSString;
    v30 = (objc_class *)[v9 classForCoder];
    if (!v30) {
      v30 = (objc_class *)objc_opt_class();
    }
    v31 = NSStringFromClass(v30);
    objc_opt_class();
    v32 = (objc_class *)objc_opt_class();
    long long v33 = NSStringFromClass(v32);
    long long v34 = [v29 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"observer", v31, v33];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v35 = NSStringFromSelector(a2);
      long long v36 = (objc_class *)objc_opt_class();
      long long v37 = NSStringFromClass(v36);
      *(_DWORD *)buf = 138544642;
      v41 = v35;
      __int16 v42 = 2114;
      uint64_t v43 = v37;
      __int16 v44 = 2048;
      v45 = self;
      __int16 v46 = 2114;
      v47 = @"BKSHIDEventObserver.m";
      __int16 v48 = 1024;
      int v49 = 178;
      __int16 v50 = 2114;
      v51 = v34;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA3C900);
  }

  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = objc_alloc_init(_BKChainObserverContainer);
  [(_BKChainObserverContainer *)v10 setObservingClient:v7];
  uint64_t v11 = [BKSEventDeferringChainIdentity alloc];
  id v12 = [v9 display];
  id v13 = [v9 deferringEnvironment];
  long long v14 = [(BKSEventDeferringChainIdentity *)v11 initWithDisplay:v12 environment:v13];
  [(_BKChainObserverContainer *)v10 setRequestedChainIdentity:v14];

  [(_BKChainObserverContainer *)v10 setObserverInterface:v9];
  lock_chainObserverContainers = self->_lock_chainObserverContainers;
  if (!lock_chainObserverContainers)
  {
    long long v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v17 = self->_lock_chainObserverContainers;
    self->_lock_chainObserverContainers = v16;

    lock_chainObserverContainers = self->_lock_chainObserverContainers;
  }
  [(NSMutableSet *)lock_chainObserverContainers addObject:v10];
  __int16 v18 = [NSString stringWithFormat:@"<%@:%p>", v9, v9];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __59__BKSHIDEventObserver_addObservingClient_forChainObserver___block_invoke;
  v38[3] = &unk_1E5441BB0;
  v38[4] = self;
  long long v39 = v10;
  uint64_t v19 = v10;
  uint64_t v20 = +[BKSSimplerAssertion assertionWithDescription:v18 invalidationBlock:v38];

  [(BKSHIDEventObserver *)self _lock_resetChainObserverPredicates];
  os_unfair_lock_unlock(&self->_lock);

  return v20;
}

void __59__BKSHIDEventObserver_addObservingClient_forChainObserver___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_lock_resetChainObserverPredicates");
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  os_unfair_lock_unlock(v2);
}

void __44__BKSHIDEventObserver_addDeferringObserver___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 16));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v7];

  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:v7];
    if (![*(id *)(*(void *)(a1 + 32) + 24) count])
    {
      objc_msgSend(*(id *)(a1 + 32), "_lock_disableObservation");
      uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 32);
      *(void *)(v5 + 32) = v4;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

void __28__BKSHIDEventObserver__init__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = (const os_unfair_lock *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = (os_unfair_lock *)WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_assert_not_owner(WeakRetained + 4);
    os_unfair_lock_lock(v4 + 4);
    [v7 activate];
    if ([*(id *)&v4[6]._os_unfair_lock_opaque count]) {
      [(os_unfair_lock *)v4 _lock_enableObservation];
    }
    if ([*(id *)(*(void *)(a1 + 32) + 56) count])
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 64) remoteTarget];
      uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 56) allObjects];
      [v5 setObservesDeferringChainIdentities:v6];
    }
    os_unfair_lock_unlock(v4 + 4);
  }
}

void __28__BKSHIDEventObserver__init__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = BKLogEventDelivery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_error_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_ERROR, "BKSHIDEventObserver invalidated - backboardd must have unloaded, exiting…", v4, 2u);
  }

  exit(0);
}

- (BKSHIDEventObserver)init
{
  uint64_t v4 = [NSString stringWithFormat:@"init is not allowed on BKSHIDEventObserver"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    long long v14 = self;
    __int16 v15 = 2114;
    long long v16 = @"BKSHIDEventObserver.m";
    __int16 v17 = 1024;
    int v18 = 81;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventObserver *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end