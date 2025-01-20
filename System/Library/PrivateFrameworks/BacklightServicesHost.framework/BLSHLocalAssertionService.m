@interface BLSHLocalAssertionService
- (BLSHLocalAssertionService)initWithOSInterfaceProvider:(id)a3;
- (BLSHOSInterfaceProviding)osInterfaceProvider;
- (id)activeAssertionDescription;
- (id)activeAssertionForIdentifier:(os_unfair_lock_s *)a1;
- (id)existingAttributeHandlerForClasses:(uint64_t)a1;
- (void)_queue_acquireDeferredAssertion:(void *)a3 completion:;
- (void)acquireAssertion:(char)a3 skipSleepCheck:;
- (void)acquireAssertion:(id)a3;
- (void)addObserver:(id)a3;
- (void)cancelAssertion:(id)a3 withError:(id)a4;
- (void)notifyObserversWithBlock:(uint64_t)a1;
- (void)pauseAssertion:(id)a3;
- (void)queue_acquireAssertion:(char)a3 skipSleepCheck:;
- (void)queue_cancelAssertion:(void *)a3 withError:;
- (void)queue_pauseAssertion:(uint64_t)a1;
- (void)queue_registerAttributeHandler:(void *)a3 forAttributeClasses:;
- (void)queue_restartAssertionTimeoutTimer:(uint64_t)a1;
- (void)queue_resumeAssertion:(uint64_t)a1;
- (void)queue_willCancelAssertion:(uint64_t)a1;
- (void)registerAttributeHandler:(id)a3 forAttributeClasses:(id)a4;
- (void)removeObserver:(id)a3;
- (void)replaceWithService:(id)a3;
- (void)restartAssertionTimeoutTimer:(id)a3;
- (void)resumeAssertion:(id)a3;
- (void)willCancelAssertion:(id)a3;
@end

@implementation BLSHLocalAssertionService

- (BLSHLocalAssertionService)initWithOSInterfaceProvider:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BLSHLocalAssertionService;
  v6 = [(BLSHLocalAssertionService *)&v27 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    attributeHandlers = v7->_attributeHandlers;
    v7->_attributeHandlers = (NSMutableDictionary *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:517 capacity:8];
    activeAssertions = v7->_activeAssertions;
    v7->_activeAssertions = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    pausedAssertions = v7->_pausedAssertions;
    v7->_pausedAssertions = (NSMutableArray *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    queue_deferredAcquisitionAssertions = v7->_queue_deferredAcquisitionAssertions;
    v7->_queue_deferredAcquisitionAssertions = (NSMutableSet *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:2];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v16;

    objc_storeStrong((id *)&v7->_osInterfaceProvider, a3);
    v18 = objc_alloc_init(BLSHAggregatedSystemActivityAssertionFactory);
    aggregatedAssertionFactory = v7->_aggregatedAssertionFactory;
    v7->_aggregatedAssertionFactory = v18;

    dispatch_workloop_t inactive = dispatch_workloop_create_inactive("BLSHLocalAssertionService workloop");
    rootWorkloop = v7->_rootWorkloop;
    v7->_rootWorkloop = (OS_dispatch_workloop *)inactive;

    dispatch_workloop_set_scheduler_priority();
    dispatch_activate((dispatch_object_t)v7->_rootWorkloop);
    dispatch_queue_t v22 = dispatch_queue_create_with_target_V2("BLSHLocalAssertionService queue", 0, (dispatch_queue_t)v7->_rootWorkloop);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v22;

    objc_initWeak(&location, v7);
    objc_copyWeak(&v25, &location);
    v7->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v7;
}

uint64_t __57__BLSHLocalAssertionService_initWithOSInterfaceProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = -[BLSHLocalAssertionService activeAssertionDescription]((uint64_t)WeakRetained);
  uint64_t v3 = BLSStateDataWithTitleDescriptionAndHints();

  return v3;
}

- (id)activeAssertionDescription
{
  if (a1)
  {
    v2 = objc_opt_new();
    uint64_t v3 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    id v4 = *(id *)(a1 + 24);
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    int v26 = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __55__BLSHLocalAssertionService_activeAssertionDescription__block_invoke;
    v19[3] = &unk_264532DD8;
    v19[4] = a1;
    id v5 = v4;
    id v20 = v5;
    id v6 = v2;
    id v21 = v6;
    dispatch_queue_t v22 = &v23;
    [v6 appendBodySectionWithName:@"activeAssertions" openDelimiter:@"[" closeDelimiter:@"]" block:v19];
    *((_DWORD *)v24 + 6) = 0;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __55__BLSHLocalAssertionService_activeAssertionDescription__block_invoke_2;
    uint64_t v14 = &unk_264532DD8;
    uint64_t v15 = a1;
    id v7 = v5;
    id v16 = v7;
    id v8 = v6;
    id v17 = v8;
    v18 = &v23;
    [v8 appendBodySectionWithName:@"pausedAssertions" openDelimiter:@"[" closeDelimiter:@"]" block:&v11];
    os_unfair_lock_unlock(v3);
    v9 = objc_msgSend(v8, "description", v11, v12, v13, v14, v15);

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __55__BLSHLocalAssertionService_activeAssertionDescription__block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [*(id *)(a1[4] + 16) objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = (void *)a1[5];
        v9 = [v7 identifier];
        LOBYTE(v8) = [v8 containsObject:v9];

        if ((v8 & 1) == 0)
        {
          uint64_t v10 = NSString;
          uint64_t v11 = (void *)a1[6];
          uint64_t v12 = *(void *)(a1[7] + 8);
          uint64_t v13 = (*(_DWORD *)(v12 + 24) + 1);
          *(_DWORD *)(v12 + 24) = v13;
          uint64_t v14 = objc_msgSend(v10, "stringWithFormat:", @"%d", v13);
          id v15 = (id)[v11 appendObject:v7 withName:v14];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

void __55__BLSHLocalAssertionService_activeAssertionDescription__block_invoke_2(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [*(id *)(a1[4] + 16) objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = (void *)a1[5];
        v9 = [v7 identifier];
        LODWORD(v8) = [v8 containsObject:v9];

        if (v8)
        {
          uint64_t v10 = NSString;
          uint64_t v11 = (void *)a1[6];
          uint64_t v12 = *(void *)(a1[7] + 8);
          uint64_t v13 = (*(_DWORD *)(v12 + 24) + 1);
          *(_DWORD *)(v12 + 24) = v13;
          uint64_t v14 = objc_msgSend(v10, "stringWithFormat:", @"%d", v13);
          id v15 = (id)[v11 appendObject:v7 withName:v14];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

- (id)existingAttributeHandlerForClasses:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__4;
    id v15 = __Block_byref_object_dispose__4;
    id v16 = 0;
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    uint64_t v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__BLSHLocalAssertionService_existingAttributeHandlerForClasses___block_invoke;
    v8[3] = &unk_264532E00;
    id v9 = v3;
    uint64_t v10 = &v11;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
    os_unfair_lock_unlock(v4);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __64__BLSHLocalAssertionService_existingAttributeHandlerForClasses___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 firstObjectCommonWithArray:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)activeAssertionForIdentifier:(os_unfair_lock_s *)a1
{
  uint64_t v2 = (uint64_t)a1;
  if (a1)
  {
    id v3 = a1 + 20;
    id v4 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 80));
    uint64_t v2 = [*(id *)(v2 + 16) objectForKey:v4];

    os_unfair_lock_unlock(v3);
  }

  return (id)v2;
}

- (void)registerAttributeHandler:(id)a3 forAttributeClasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__BLSHLocalAssertionService_registerAttributeHandler_forAttributeClasses___block_invoke;
  block[3] = &unk_2645327C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __74__BLSHLocalAssertionService_registerAttributeHandler_forAttributeClasses___block_invoke(uint64_t a1)
{
}

- (void)queue_registerAttributeHandler:(void *)a3 forAttributeClasses:
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v25 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = -[BLSHLocalAssertionService existingAttributeHandlerForClasses:](a1, v5);
    if (v6)
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"cannot register handler for classes:%@ overlaps existing handler for classes:%@", v5, v6 format];
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
      [*(id *)(a1 + 8) setObject:v25 forKey:v5];
      id v7 = NSAllMapTableValues(*(NSMapTable **)(a1 + 16));
      id v8 = (void *)[*(id *)(a1 + 24) copy];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
      id v9 = bls_assertions_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BLSHLocalAssertionService queue_registerAttributeHandler:forAttributeClasses:]();
      }
      uint64_t v24 = a1;

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id obj = v7;
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            id v15 = [v14 descriptor];
            id v16 = [v15 attributesOfClasses:v5];
            long long v17 = [v14 identifier];
            int v18 = [v8 containsObject:v17];

            if (v18)
            {
              long long v19 = [v16 indexesOfObjectsPassingTest:&__block_literal_global_6];
              uint64_t v20 = [v16 objectsAtIndexes:v19];

              id v16 = (void *)v20;
            }
            if ([v16 count])
            {
              uint64_t v21 = bls_assertions_log();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                dispatch_queue_t v22 = NSStringFromBLSAssertingObject();
                *(_DWORD *)buf = 134218754;
                uint64_t v31 = v24;
                __int16 v32 = 2114;
                id v33 = v25;
                __int16 v34 = 2114;
                v35 = v16;
                __int16 v36 = 2114;
                v37 = v22;
                _os_log_debug_impl(&dword_21FCFC000, v21, OS_LOG_TYPE_DEBUG, "%p will now activate (registered handler:%{public}@) attributes:%{public}@ from assertion:%{public}@", buf, 0x2Au);
              }
              [v25 activateAttributes:v16 fromAssertion:v14 forService:v24];
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
        }
        while (v11);
      }

      id v6 = 0;
    }
  }
}

uint64_t __80__BLSHLocalAssertionService_queue_registerAttributeHandler_forAttributeClasses___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canBePaused] ^ 1;
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)pauseAssertion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__BLSHLocalAssertionService_pauseAssertion___block_invoke;
  v7[3] = &unk_2645322D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __44__BLSHLocalAssertionService_pauseAssertion___block_invoke(uint64_t a1)
{
}

- (void)queue_pauseAssertion:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 identifier];
    id v6 = -[BLSHLocalAssertionService activeAssertionForIdentifier:]((os_unfair_lock_s *)a1, v5);

    if (v6)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
      int v7 = [*(id *)(a1 + 24) containsObject:v5];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
      id v8 = bls_assertions_log();
      id v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[BLSHLocalAssertionService queue_pauseAssertion:]();
        }
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v20 = a1;
          __int16 v21 = 2114;
          dispatch_queue_t v22 = v4;
          _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_DEFAULT, "%p will pause assertion:%{public}@", buf, 0x16u);
        }

        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
        [*(id *)(a1 + 24) addObject:v5];
        id v9 = [*(id *)(a1 + 8) copy];
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
        uint64_t v10 = [v4 descriptor];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __50__BLSHLocalAssertionService_queue_pauseAssertion___block_invoke;
        v15[3] = &unk_264532E48;
        id v16 = v10;
        uint64_t v17 = a1;
        id v11 = v4;
        id v18 = v11;
        id v12 = v10;
        [v9 enumerateKeysAndObjectsUsingBlock:v15];
        [v11 serviceDidPause];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __50__BLSHLocalAssertionService_queue_pauseAssertion___block_invoke_35;
        v13[3] = &unk_264532E70;
        v13[4] = a1;
        id v14 = v11;
        -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v13);
      }
    }
    else
    {
      id v9 = bls_assertions_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BLSHLocalAssertionService queue_pauseAssertion:]();
      }
    }
  }
}

void __50__BLSHLocalAssertionService_queue_pauseAssertion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) attributesOfClasses:a2];
  int v7 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_34];
  id v8 = [v6 objectsAtIndexes:v7];

  if ([v8 count])
  {
    id v9 = bls_assertions_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = NSStringFromBLSAssertingObject();
      int v12 = 134218754;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      id v15 = v5;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      long long v19 = v11;
      _os_log_debug_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_DEBUG, "%p handler:%{public}@ will deactivate (pause) attributes:%{public}@ from assertion:%{public}@", (uint8_t *)&v12, 0x2Au);
    }
    [v5 deactivateAttributes:v8 fromAssertion:*(void *)(a1 + 48) forService:*(void *)(a1 + 40)];
  }
}

uint64_t __50__BLSHLocalAssertionService_queue_pauseAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 canBePaused];
}

void __50__BLSHLocalAssertionService_queue_pauseAssertion___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 service:*(void *)(a1 + 32) didPauseAssertion:*(void *)(a1 + 40)];
  }
}

- (void)notifyObserversWithBlock:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    id v5 = [*(id *)(a1 + 40) allObjects];
    os_unfair_lock_unlock(v4);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          v3[2](v3, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)resumeAssertion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__BLSHLocalAssertionService_resumeAssertion___block_invoke;
  v7[3] = &unk_2645322D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __45__BLSHLocalAssertionService_resumeAssertion___block_invoke(uint64_t a1)
{
}

- (void)queue_resumeAssertion:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 identifier];
    id v6 = -[BLSHLocalAssertionService activeAssertionForIdentifier:]((os_unfair_lock_s *)a1, v5);

    if (v6)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
      char v7 = [*(id *)(a1 + 24) containsObject:v5];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
      id v8 = bls_assertions_log();
      uint64_t v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v20 = a1;
          __int16 v21 = 2114;
          dispatch_queue_t v22 = v4;
          _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_DEFAULT, "%p will resume assertion:%{public}@", buf, 0x16u);
        }

        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
        [*(id *)(a1 + 24) removeObject:v5];
        uint64_t v9 = [*(id *)(a1 + 8) copy];
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
        uint64_t v10 = [v4 descriptor];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke;
        v15[3] = &unk_264532E48;
        id v16 = v10;
        uint64_t v17 = a1;
        id v11 = v4;
        id v18 = v11;
        id v12 = v10;
        [v9 enumerateKeysAndObjectsUsingBlock:v15];
        [v11 serviceDidResume];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke_41;
        v13[3] = &unk_264532E70;
        v13[4] = a1;
        id v14 = v11;
        -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v13);
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[BLSHLocalAssertionService queue_resumeAssertion:]();
      }
    }
    else
    {
      uint64_t v9 = bls_assertions_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BLSHLocalAssertionService queue_resumeAssertion:]();
      }
    }
  }
}

void __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) attributesOfClasses:a2];
  char v7 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_40];
  id v8 = [v6 objectsAtIndexes:v7];

  if ([v8 count])
  {
    uint64_t v9 = bls_assertions_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke_cold_1();
    }

    [v5 activateAttributes:v8 fromAssertion:*(void *)(a1 + 48) forService:*(void *)(a1 + 40)];
  }
}

uint64_t __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 canBePaused];
}

void __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 service:*(void *)(a1 + 32) didResumeAssertion:*(void *)(a1 + 40)];
  }
}

- (void)willCancelAssertion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__BLSHLocalAssertionService_willCancelAssertion___block_invoke;
  v7[3] = &unk_2645322D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__BLSHLocalAssertionService_willCancelAssertion___block_invoke(uint64_t a1)
{
}

- (void)queue_willCancelAssertion:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    [v3 serviceWillCancel];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __55__BLSHLocalAssertionService_queue_willCancelAssertion___block_invoke;
    v5[3] = &unk_264532E70;
    v5[4] = a1;
    id v6 = v4;
    -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v5);
  }
}

void __55__BLSHLocalAssertionService_queue_willCancelAssertion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 service:*(void *)(a1 + 32) willCancelAssertion:*(void *)(a1 + 40)];
  }
}

- (void)acquireAssertion:(id)a3
{
}

- (void)acquireAssertion:(char)a3 skipSleepCheck:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    char v7 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__BLSHLocalAssertionService_acquireAssertion_skipSleepCheck___block_invoke;
    block[3] = &unk_2645326F8;
    block[4] = a1;
    id v9 = v5;
    char v10 = a3;
    dispatch_async(v7, block);
  }
}

void __61__BLSHLocalAssertionService_acquireAssertion_skipSleepCheck___block_invoke(uint64_t a1)
{
}

- (void)queue_acquireAssertion:(char)a3 skipSleepCheck:
{
  v62[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    char v7 = [v5 identifier];
    if (!v7)
    {
      id v8 = objc_alloc(MEMORY[0x263F29968]);
      uint64_t v9 = getpid();
      char v7 = objc_msgSend(v8, "initWithClientPid:hostPid:count:", v9, getpid(), objc_msgSend(MEMORY[0x263F29968], "nextCount"));
      char v10 = bls_assertions_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v7;
        *(_WORD *)&buf[22] = 2114;
        v57 = v6;
        _os_log_debug_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_DEBUG, "%p created identifer:%{public}@ for local assertion:%{public}@", buf, 0x20u);
      }

      [v6 setIdentifier:v7];
    }
    id v11 = -[BLSHLocalAssertionService activeAssertionForIdentifier:]((os_unfair_lock_s *)a1, v7);
    BOOL v12 = v11 == 0;

    if (v12)
    {
      id v17 = [v6 descriptor];
      v60[0] = objc_opt_class();
      v60[1] = objc_opt_class();
      id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
      long long v19 = [v17 attributesOfClasses:v18];
      uint64_t v20 = [v19 count];

      if ((a3 & 1) != 0
        || !v20
        || ([*(id *)(a1 + 88) systemSleepMonitor],
            __int16 v21 = objc_claimAutoreleasedReturnValue(),
            char v22 = [v21 isAwakeOrAbortingSleep],
            v21,
            (v22 & 1) != 0))
      {
        uint64_t v23 = bls_assertions_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v6;
          _os_log_impl(&dword_21FCFC000, v23, OS_LOG_TYPE_DEFAULT, "%p will acquire assertion:%{public}@", buf, 0x16u);
        }

        [*(id *)(a1 + 32) removeObject:v7];
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
        [*(id *)(a1 + 16) setObject:v6 forKey:v7];
        id v24 = (id)[*(id *)(a1 + 8) copy];
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
        id v25 = [v17 attributes];
        long long v26 = (void *)[v25 mutableCopy];

        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_66;
        v38[3] = &unk_264532F38;
        id v39 = v17;
        uint64_t v40 = a1;
        long long v27 = v6;
        v41 = v27;
        id v28 = v26;
        id v42 = v28;
        [v24 enumerateKeysAndObjectsUsingBlock:v38];
        if ([v28 count])
        {
          long long v29 = bls_assertions_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            NSStringFromBLSAssertingObject();
            v30 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            *(void *)&uint8_t buf[4] = a1;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v28;
            *(_WORD *)&buf[22] = 2114;
            v57 = v30;
            _os_log_impl(&dword_21FCFC000, v29, OS_LOG_TYPE_INFO, "%p (no handler) will delay activation of attributes:%{public}@ for assertion:%{public}@", buf, 0x20u);
          }
        }
        [v27 serviceDidAcquire];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_67;
        v36[3] = &unk_264532E70;
        v36[4] = a1;
        v37 = v27;
        -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v36);
      }
      else
      {
        [*(id *)(a1 + 32) addObject:v7];
        uint64_t v31 = (void *)mach_continuous_time();
        id v32 = *(id *)(a1 + 88);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v57 = __Block_byref_object_copy__4;
        v58 = __Block_byref_object_dispose__4;
        id v33 = NSStringFromBLSAssertingObject();
        id v59 = +[BLSHSystemWaker wakerWithIdentifier:v33 osInterfaceProvider:v32];

        objc_initWeak(&location, (id)a1);
        __int16 v34 = bls_assertions_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v52 = 134218242;
          uint64_t v53 = a1;
          __int16 v54 = 2114;
          v55 = v6;
          _os_log_impl(&dword_21FCFC000, v34, OS_LOG_TYPE_INFO, "%p system about to sleep - will defer acquiring assertion:%{public}@", v52, 0x16u);
        }

        v35 = *(void **)(*(void *)&buf[8] + 40);
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_58;
        v43[3] = &unk_264532F10;
        objc_copyWeak(v47, &location);
        v44 = v6;
        v47[1] = v31;
        id v24 = v32;
        id v45 = v24;
        v46 = buf;
        [v35 wakeWithCompletion:v43];

        objc_destroyWeak(v47);
        objc_destroyWeak(&location);
        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      long long v13 = bls_assertions_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[BLSHLocalAssertionService queue_acquireAssertion:skipSleepCheck:]();
      }

      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v61 = *MEMORY[0x263F08320];
      v62[0] = @"already acquired assertion";
      id v15 = [NSDictionary dictionaryWithObjects:v62 forKeys:&v61 count:1];
      id v16 = [v14 errorWithDomain:*MEMORY[0x263F29920] code:2 userInfo:v15];

      [v6 serviceFailedToAcquireWithError:v16];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke;
      v49[3] = &unk_264532E98;
      v49[4] = a1;
      v50 = v6;
      id v51 = v16;
      id v17 = v16;
      -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v49);
    }
  }
}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 service:a1[4] failedToAcquireAssertion:a1[5] withError:a1[6]];
  }
}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_58(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[9];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_2;
    block[3] = &unk_264532EE8;
    block[4] = WeakRetained;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 64);
    id v12 = v5;
    uint64_t v15 = v6;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v13 = v7;
    uint64_t v14 = v8;
    dispatch_async(v4, block);
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    char v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_3;
  v8[3] = &unk_264532EC0;
  void v8[4] = v3;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 64);
  id v9 = v4;
  uint64_t v12 = v5;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v10 = v6;
  uint64_t v11 = v7;
  -[BLSHLocalAssertionService _queue_acquireDeferredAssertion:completion:](v3, v4, v8);
}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = bls_assertions_log();
  uint64_t v5 = v4;
  if (a2) {
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled(v4, v6))
  {
    if (a2) {
      uint64_t v7 = @"for assertion";
    }
    else {
      uint64_t v7 = @"but assertion was already canceled";
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = NSStringFromBLSAssertingObject();
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    uint64_t v11 = v10;
    uint64_t v12 = [*(id *)(a1 + 48) systemSleepMonitor];
    int v15 = 134219010;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    __int16 v23 = 1024;
    int v24 = [v12 hasSleepBeenRequested];
    _os_log_impl(&dword_21FCFC000, v5, v6, "%p system awoke  %@:\"%{public}@\" elapsed:%.4lfs hasSleepBeenRequested:%{BOOL}u", (uint8_t *)&v15, 0x30u);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) invalidate];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;
}

- (void)_queue_acquireDeferredAssertion:(void *)a3 completion:
{
  id v8 = a2;
  uint64_t v5 = a3;
  if (a1)
  {
    os_log_type_t v6 = [v8 identifier];
    uint64_t v7 = [*(id *)(a1 + 32) containsObject:v6];
    if (v7)
    {
      [*(id *)(a1 + 32) removeObject:v6];
      -[BLSHLocalAssertionService queue_acquireAssertion:skipSleepCheck:](a1, v8, 1);
    }
    v5[2](v5, v7);
  }
}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_66(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  os_log_type_t v6 = [*(id *)(a1 + 32) attributesOfClasses:a2];
  if ([v6 count])
  {
    uint64_t v7 = bls_assertions_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_66_cold_1();
    }

    [v5 activateAttributes:v6 fromAssertion:*(void *)(a1 + 48) forService:*(void *)(a1 + 40)];
    [*(id *)(a1 + 56) removeObjectsInArray:v6];
  }
}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 service:*(void *)(a1 + 32) didAcquireAssertion:*(void *)(a1 + 40)];
  }
}

- (void)cancelAssertion:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__BLSHLocalAssertionService_cancelAssertion_withError___block_invoke;
  block[3] = &unk_2645327C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __55__BLSHLocalAssertionService_cancelAssertion_withError___block_invoke(uint64_t a1)
{
}

- (void)queue_cancelAssertion:(void *)a3 withError:
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [v5 identifier];
    id v8 = &off_21FD8B000;
    if ([*(id *)(a1 + 32) containsObject:v7])
    {
      id v9 = bls_assertions_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v33 = a1;
        __int16 v34 = 2114;
        id v35 = v5;
        _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_INFO, "%p removing deferred assertion and notifying observers %{public}@", buf, 0x16u);
      }

      [*(id *)(a1 + 32) removeObject:v7];
    }
    else
    {
      id v10 = -[BLSHLocalAssertionService activeAssertionForIdentifier:]((os_unfair_lock_s *)a1, v7);

      if (!v10)
      {
        uint64_t v22 = bls_assertions_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v33 = a1;
          __int16 v34 = 2114;
          id v35 = v5;
          _os_log_impl(&dword_21FCFC000, v22, OS_LOG_TYPE_INFO, "%p already cancelled assertion %{public}@", buf, 0x16u);
        }

        goto LABEL_17;
      }
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
      int v11 = [*(id *)(a1 + 24) containsObject:v7];
      [*(id *)(a1 + 16) removeObjectForKey:v7];
      [*(id *)(a1 + 24) removeObject:v7];
      id v12 = (void *)[*(id *)(a1 + 8) copy];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
      id v13 = bls_assertions_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v33 = a1;
        __int16 v34 = 2114;
        id v35 = v5;
        __int16 v36 = 1024;
        LODWORD(v37) = v11;
        _os_log_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_DEFAULT, "%p will cancel assertion:%{public}@ wasPaused:%{BOOL}u", buf, 0x1Cu);
      }

      uint64_t v14 = [v5 descriptor];
      int v15 = [v14 attributes];
      uint64_t v16 = (void *)[v15 mutableCopy];

      if (v11)
      {
        __int16 v17 = [v16 indexesOfObjectsPassingTest:&__block_literal_global_71];
        [v16 removeObjectsAtIndexes:v17];
      }
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __61__BLSHLocalAssertionService_queue_cancelAssertion_withError___block_invoke_2;
      v26[3] = &unk_264532F60;
      char v31 = v11;
      id v27 = v14;
      uint64_t v28 = a1;
      id v29 = v5;
      id v18 = v16;
      id v30 = v18;
      id v19 = v14;
      [v12 enumerateKeysAndObjectsUsingBlock:v26];
      if ([v18 count])
      {
        uint64_t v20 = bls_assertions_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          __int16 v21 = NSStringFromBLSAssertingObject();
          *(_DWORD *)buf = 134218498;
          uint64_t v33 = a1;
          __int16 v34 = 2114;
          id v35 = v18;
          __int16 v36 = 2114;
          v37 = v21;
          _os_log_impl(&dword_21FCFC000, v20, OS_LOG_TYPE_INFO, "%p (still no handler) will not cancel attributes:%{public}@ for assertion:%{public}@", buf, 0x20u);
        }
      }

      id v8 = &off_21FD8B000;
    }
    [v5 serviceDidCancelWithError:v6];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = *((void *)v8 + 55);
    v23[2] = __61__BLSHLocalAssertionService_queue_cancelAssertion_withError___block_invoke_74;
    v23[3] = &unk_264532E98;
    v23[4] = a1;
    id v24 = v5;
    id v25 = v6;
    -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v23);

LABEL_17:
  }
}

uint64_t __61__BLSHLocalAssertionService_queue_cancelAssertion_withError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canBePaused] ^ 1;
}

void __61__BLSHLocalAssertionService_queue_cancelAssertion_withError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) attributesOfClasses:a2];
  id v7 = v6;
  if (*(unsigned char *)(a1 + 64))
  {
    id v8 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_73];
    uint64_t v9 = [v7 objectsAtIndexes:v8];

    id v7 = (void *)v9;
  }
  if ([v7 count])
  {
    id v10 = bls_assertions_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = NSStringFromBLSAssertingObject();
      int v13 = 134218754;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v5;
      __int16 v17 = 2114;
      id v18 = v7;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      _os_log_debug_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_DEBUG, "%p handler:%{public}@ will deactivate (cancel) attributes:%{public}@ from assertion:%{public}@", (uint8_t *)&v13, 0x2Au);
    }
    [v5 deactivateAttributes:v7 fromAssertion:*(void *)(a1 + 48) forService:*(void *)(a1 + 40)];
    [*(id *)(a1 + 56) removeObjectsInArray:v7];
  }
}

uint64_t __61__BLSHLocalAssertionService_queue_cancelAssertion_withError___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 canBePaused] ^ 1;
}

void __61__BLSHLocalAssertionService_queue_cancelAssertion_withError___block_invoke_74(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 service:a1[4] didCancelAssertion:a1[5] withError:a1[6]];
  }
}

- (void)restartAssertionTimeoutTimer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__BLSHLocalAssertionService_restartAssertionTimeoutTimer___block_invoke;
  v7[3] = &unk_2645322D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __58__BLSHLocalAssertionService_restartAssertionTimeoutTimer___block_invoke(uint64_t a1)
{
}

- (void)queue_restartAssertionTimeoutTimer:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [v3 descriptor];
    id v6 = [v5 attributeOfClass:v4];

    if (v6)
    {
      id v7 = [v3 identifier];
      id v8 = -[BLSHLocalAssertionService activeAssertionForIdentifier:]((os_unfair_lock_s *)a1, v7);

      if (v8)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
        uint64_t v18 = 0;
        __int16 v19 = &v18;
        uint64_t v20 = 0x3032000000;
        uint64_t v21 = __Block_byref_object_copy__4;
        uint64_t v22 = __Block_byref_object_dispose__4;
        id v23 = 0;
        uint64_t v9 = *(void **)(a1 + 8);
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __64__BLSHLocalAssertionService_queue_restartAssertionTimeoutTimer___block_invoke;
        v17[3] = &unk_264532F88;
        v17[4] = &v18;
        v17[5] = v4;
        [v9 enumerateKeysAndObjectsUsingBlock:v17];
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
        if (v19[5])
        {
          id v10 = bls_assertions_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218498;
            uint64_t v26 = a1;
            __int16 v27 = 2114;
            uint64_t v28 = v6;
            __int16 v29 = 2114;
            id v30 = v3;
            _os_log_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_INFO, "%p will restart timer:%{public}@ for assertion:%{public}@", buf, 0x20u);
          }

          uint64_t v11 = (void *)v19[5];
          id v24 = v6;
          id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
          [v11 activateAttributes:v12 fromAssertion:v3 forService:a1];

          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __64__BLSHLocalAssertionService_queue_restartAssertionTimeoutTimer___block_invoke_78;
          v15[3] = &unk_264532E70;
          void v15[4] = a1;
          id v16 = v3;
          -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v15);
        }
        else
        {
          uint64_t v14 = bls_assertions_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218498;
            uint64_t v26 = a1;
            __int16 v27 = 2114;
            uint64_t v28 = v6;
            __int16 v29 = 2114;
            id v30 = v3;
            _os_log_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_INFO, "%p (no handler) will not restart timeout:%{public}@ for assertion:%{public}@", buf, 0x20u);
          }
        }
        _Block_object_dispose(&v18, 8);
      }
      else
      {
        int v13 = bls_assertions_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[BLSHLocalAssertionService queue_restartAssertionTimeoutTimer:]();
        }
      }
    }
    else
    {
      id v7 = bls_assertions_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[BLSHLocalAssertionService queue_restartAssertionTimeoutTimer:]();
      }
    }
  }
}

void __64__BLSHLocalAssertionService_queue_restartAssertionTimeoutTimer___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([a2 containsObject:*(void *)(a1 + 40)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

void __64__BLSHLocalAssertionService_queue_restartAssertionTimeoutTimer___block_invoke_78(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 service:*(void *)(a1 + 32) didRestartTimeoutTimerForAssertion:*(void *)(a1 + 40)];
  }
}

- (void)replaceWithService:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSUInteger v5 = [(NSMapTable *)self->_activeAssertions count];
  os_unfair_lock_unlock(p_lock);
  if (v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"BLSLocalAssertionService does not support replacement with %@", v6 format];
  }
}

- (BLSHOSInterfaceProviding)osInterfaceProvider
{
  return self->_osInterfaceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rootWorkloop, 0);
  objc_storeStrong((id *)&self->_aggregatedAssertionFactory, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue_deferredAcquisitionAssertions, 0);
  objc_storeStrong((id *)&self->_pausedAssertions, 0);
  objc_storeStrong((id *)&self->_activeAssertions, 0);

  objc_storeStrong((id *)&self->_attributeHandlers, 0);
}

- (void)queue_registerAttributeHandler:forAttributeClasses:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "%p registered handler for attributes:%{public}@");
}

- (void)queue_pauseAssertion:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "%p paused cancelled assertion %{public}@");
}

- (void)queue_pauseAssertion:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_21FCFC000, v0, v1, "%p already paused assertion %{public}@");
}

- (void)queue_resumeAssertion:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "%p resumed cancelled assertion %{public}@");
}

- (void)queue_resumeAssertion:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_21FCFC000, v0, v1, "%p already resumed assertion %{public}@");
}

void __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke_cold_1()
{
  uint64_t v0 = NSStringFromBLSAssertingObject();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_2(&dword_21FCFC000, v1, v2, "%p will activate (resume) attributes:%{public}@ from assertion:%{public}@", v3, v4, v5, v6, v7);
}

- (void)queue_acquireAssertion:skipSleepCheck:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_21FCFC000, v0, v1, "%p already acquired assertion %{public}@");
}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_66_cold_1()
{
  uint64_t v0 = NSStringFromBLSAssertingObject();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_2(&dword_21FCFC000, v1, v2, "%p will activate (acquire) attributes:%{public}@ from assertion:%{public}@", v3, v4, v5, v6, v7);
}

- (void)queue_restartAssertionTimeoutTimer:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_21FCFC000, v0, v1, "%p cannot restart timer without BLSTimeoutDurationAttribute for assertion %{public}@");
}

- (void)queue_restartAssertionTimeoutTimer:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_21FCFC000, v0, v1, "%p cannot restart timer for unacquired assertion %{public}@");
}

@end