@interface HDMaintenanceWorkCoordinator
- (BOOL)startNextOperationWithNameImmediately:(id)a3;
- (BOOL)suspended;
- (HDMaintenanceWorkCoordinator)init;
- (id)diagnosticDescription;
- (id)takeMaintenanceSuspensionAssertionForOwner:(id)a3;
- (void)_lock_cancelActiveTimeoutTimer;
- (void)_lock_considerStartingNextPendingOperation;
- (void)_lock_prepareToStartOperationImmediately:(uint64_t)a1;
- (void)_lock_startTimeoutTimerForActiveOperations;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)cancelAllOperations;
- (void)dealloc;
- (void)enqueueMaintenanceOperation:(id)a3;
- (void)operationDidFinish:(id)a3;
- (void)startOperationImmediately:(id)a3;
@end

@implementation HDMaintenanceWorkCoordinator

- (HDMaintenanceWorkCoordinator)init
{
  v14.receiver = self;
  v14.super_class = (Class)HDMaintenanceWorkCoordinator;
  v2 = [(HDMaintenanceWorkCoordinator *)&v14 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    managementQueue = v2->_managementQueue;
    v2->_managementQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = HKCreateConcurrentDispatchQueueWithQOSClass();
    maintenanceWorkQueue = v2->_maintenanceWorkQueue;
    v2->_maintenanceWorkQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingOperations = v2->_pendingOperations;
    v2->_pendingOperations = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeOperations = v2->_activeOperations;
    v2->_activeOperations = v9;

    v11 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    assertionManager = v2->_assertionManager;
    v2->_assertionManager = v11;

    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v2->_assertionManager, "addObserver:forAssertionIdentifier:queue:", v2, @"_HDMaintenanceWorkCoordinatorSuspensionAssertion;",
      v2->_managementQueue);
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDMaintenanceWorkCoordinator _lock_cancelActiveTimeoutTimer]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)HDMaintenanceWorkCoordinator;
  [(HDMaintenanceWorkCoordinator *)&v4 dealloc];
}

- (void)_lock_cancelActiveTimeoutTimer
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 56);
    if (v2)
    {
      dispatch_source_cancel(v2);
      uint64_t v3 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;
    }
  }
}

- (BOOL)suspended
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_suspended;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)enqueueMaintenanceOperation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [v4 setEnqueuedTime:CFAbsoluteTimeGetCurrent()];
  if (self->_suspended)
  {
    _HKInitializeLogging();
    uint64_t v5 = HKLogInfrastructure();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v4;
      v6 = "%{public}@: Enqueued (suspended)";
LABEL_4:
      v7 = v5;
      uint32_t v8 = 12;
LABEL_8:
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
    }
  }
  else
  {
    uint64_t v9 = [(NSMutableSet *)self->_activeOperations count];
    _HKInitializeLogging();
    uint64_t v5 = HKLogInfrastructure();
    BOOL v10 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (!v9)
    {
      if (!v10) {
        goto LABEL_9;
      }
      int v13 = 138543362;
      id v14 = v4;
      v6 = "%{public}@: Enqueued for immediate start";
      goto LABEL_4;
    }
    if (v10)
    {
      uint64_t v11 = [(NSMutableArray *)self->_pendingOperations count];
      activeOperations = self->_activeOperations;
      int v13 = 138543874;
      id v14 = v4;
      __int16 v15 = 2048;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      v18 = activeOperations;
      v6 = "%{public}@: Enqueued (%ld pending, current active operations: %{public}@)";
      v7 = v5;
      uint32_t v8 = 32;
      goto LABEL_8;
    }
  }
LABEL_9:

  [(NSMutableArray *)self->_pendingOperations addObject:v4];
  -[HDMaintenanceWorkCoordinator _lock_considerStartingNextPendingOperation]((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_considerStartingNextPendingOperation
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (![*(id *)(a1 + 48) count] && !*(unsigned char *)(a1 + 32))
    {
      v2 = [*(id *)(a1 + 40) firstObject];
      if (v2)
      {
        [*(id *)(a1 + 48) addObject:v2];
        [*(id *)(a1 + 40) removeObjectAtIndex:0];
        -[HDMaintenanceWorkCoordinator _lock_startTimeoutTimerForActiveOperations](a1);
        uint64_t v3 = *(NSObject **)(a1 + 24);
        v4[0] = MEMORY[0x1E4F143A8];
        v4[1] = 3221225472;
        v4[2] = __74__HDMaintenanceWorkCoordinator__lock_considerStartingNextPendingOperation__block_invoke;
        v4[3] = &unk_1E62F31C0;
        id v5 = v2;
        uint64_t v6 = a1;
        dispatch_async(v3, v4);
      }
    }
  }
}

- (void)startOperationImmediately:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDMaintenanceWorkCoordinator _lock_prepareToStartOperationImmediately:]((uint64_t)self, v5);
  os_unfair_lock_unlock(p_lock);
  [v5 startWithCompletionDelegate:self fromImmediateRequest:1];
}

- (void)_lock_prepareToStartOperationImmediately:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    _HKInitializeLogging();
    id v4 = HKLogInfrastructure();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Running immediately", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 48) addObject:v3];
    [*(id *)(a1 + 40) removeObject:v3];
    -[HDMaintenanceWorkCoordinator _lock_startTimeoutTimerForActiveOperations](a1);
  }
}

- (BOOL)startNextOperationWithNameImmediately:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  pendingOperations = self->_pendingOperations;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__HDMaintenanceWorkCoordinator_startNextOperationWithNameImmediately___block_invoke;
  v9[3] = &unk_1E6303560;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSMutableArray *)pendingOperations hk_firstObjectPassingTest:v9];
  if (v7)
  {
    -[HDMaintenanceWorkCoordinator _lock_prepareToStartOperationImmediately:]((uint64_t)self, v7);
    os_unfair_lock_unlock(&self->_lock);
    [v7 startWithCompletionDelegate:self fromImmediateRequest:1];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  return v7 != 0;
}

uint64_t __70__HDMaintenanceWorkCoordinator_startNextOperationWithNameImmediately___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)cancelAllOperations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = self->_pendingOperations;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "cancel", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_pendingOperations removeAllObjects];
  [(NSMutableSet *)self->_activeOperations removeAllObjects];
  -[HDMaintenanceWorkCoordinator _lock_cancelActiveTimeoutTimer]((uint64_t)self);
  -[HDMaintenanceWorkCoordinator _lock_considerStartingNextPendingOperation]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_startTimeoutTimerForActiveOperations
{
  location[16] = *(id *)MEMORY[0x1E4F143B8];
  v2 = (const os_unfair_lock *)(a1 + 8);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if ([*(id *)(a1 + 48) count])
  {
    if (!*(void *)(a1 + 56))
    {
      dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 16));
      uint64_t v4 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v3;

      objc_initWeak(location, (id)a1);
      uint64_t v5 = *(NSObject **)(a1 + 56);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __74__HDMaintenanceWorkCoordinator__lock_startTimeoutTimerForActiveOperations__block_invoke;
      handler[3] = &unk_1E62F6BD0;
      objc_copyWeak(&v18, location);
      dispatch_source_set_event_handler(v5, handler);
      objc_destroyWeak(&v18);
      objc_destroyWeak(location);
    }
    os_unfair_lock_assert_owner(v2);
    double Current = CFAbsoluteTimeGetCurrent();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:location count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      double v11 = Current;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) timeoutTime];
          if (v11 < v13) {
            double v11 = v13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:location count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = Current;
    }

    double v14 = v11 - Current;
    __int16 v15 = *(NSObject **)(a1 + 56);
    dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    dispatch_source_set_timer(v15, v16, (unint64_t)(v14 * 1000000000.0), (unint64_t)(v14 * 0.25 * 1000000000.0));
    dispatch_activate(*(dispatch_object_t *)(a1 + 56));
  }
  else
  {
    -[HDMaintenanceWorkCoordinator _lock_cancelActiveTimeoutTimer](a1);
  }
}

uint64_t __74__HDMaintenanceWorkCoordinator__lock_considerStartingNextPendingOperation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startWithCompletionDelegate:*(void *)(a1 + 40) fromImmediateRequest:0];
}

void __74__HDMaintenanceWorkCoordinator__lock_startTimeoutTimerForActiveOperations__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (os_unfair_lock_s *)(WeakRetained + 8);
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    dispatch_source_t v3 = (void *)*((void *)WeakRetained + 6);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __47__HDMaintenanceWorkCoordinator__timeoutDidFire__block_invoke;
    v27[3] = &__block_descriptor_40_e32_B16__0__HDMaintenanceOperation_8l;
    *(CFAbsoluteTime *)&v27[4] = Current;
    uint64_t v4 = objc_msgSend(v3, "hk_filter:", v27);
    if ([v4 count])
    {
      long long v20 = v4;
      long long v21 = (os_unfair_lock_s *)(WeakRetained + 8);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v34 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v24 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            int v11 = objc_msgSend(v10, "faultOnTimeout", v20, v21);
            _HKInitializeLogging();
            long long v12 = HKLogInfrastructure();
            double v13 = v12;
            if (v11)
            {
              if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              {
                [v10 elapsedTime];
                uint64_t v15 = v14;
                [v10 timeout];
                *(_DWORD *)buf = 138543874;
                v29 = v10;
                __int16 v30 = 2048;
                uint64_t v31 = v15;
                __int16 v32 = 2048;
                uint64_t v33 = v16;
                _os_log_fault_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_FAULT, "%{public}@: Timeout exceeded (%02.lfs elapsed of %02.lfs allowed)", buf, 0x20u);
              }
            }
            else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              [v10 elapsedTime];
              uint64_t v18 = v17;
              [v10 timeout];
              *(_DWORD *)buf = 138543874;
              v29 = v10;
              __int16 v30 = 2048;
              uint64_t v31 = v18;
              __int16 v32 = 2048;
              uint64_t v33 = v19;
              _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Timeout exceeded (%02.lfs elapsed of %02.lfs allowed)", buf, 0x20u);
            }

            [*((id *)WeakRetained + 6) removeObject:v10];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v34 count:16];
        }
        while (v7);
      }

      -[HDMaintenanceWorkCoordinator _lock_startTimeoutTimerForActiveOperations](WeakRetained);
      -[HDMaintenanceWorkCoordinator _lock_considerStartingNextPendingOperation](WeakRetained);
      uint64_t v4 = v20;
      v1 = v21;
    }
    os_unfair_lock_unlock(v1);
  }
}

BOOL __47__HDMaintenanceWorkCoordinator__timeoutDidFire__block_invoke(uint64_t a1, void *a2)
{
  [a2 timeoutTime];
  return v3 <= *(double *)(a1 + 32);
}

- (id)takeMaintenanceSuspensionAssertionForOwner:(id)a3
{
  id v4 = a3;
  [(HDMaintenanceWorkCoordinator *)self willChangeValueForKey:@"suspended"];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F65CC8]), "initWithAssertionIdentifier:ownerIdentifier:", @"_HDMaintenanceWorkCoordinatorSuspensionAssertion;",
                 v4);

  os_unfair_lock_lock(&self->_lock);
  self->_suspended = 1;
  [(HDAssertionManager *)self->_assertionManager takeAssertion:v5];
  os_unfair_lock_unlock(&self->_lock);
  [(HDMaintenanceWorkCoordinator *)self didChangeValueForKey:@"suspended"];

  return v5;
}

- (void)operationDidFinish:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_activeOperations removeObject:v5];

  -[HDMaintenanceWorkCoordinator _lock_considerStartingNextPendingOperation]((uint64_t)self);

  os_unfair_lock_unlock(p_lock);
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  id v5 = a3;
  [(HDMaintenanceWorkCoordinator *)self willChangeValueForKey:@"suspended"];
  os_unfair_lock_lock(&self->_lock);
  char v6 = [v5 hasActiveAssertionForIdentifier:@"_HDMaintenanceWorkCoordinatorSuspensionAssertion;"];

  self->_suspended = v6;
  if ((v6 & 1) == 0) {
    -[HDMaintenanceWorkCoordinator _lock_considerStartingNextPendingOperation]((uint64_t)self);
  }
  os_unfair_lock_unlock(&self->_lock);

  [(HDMaintenanceWorkCoordinator *)self didChangeValueForKey:@"suspended"];
}

- (id)diagnosticDescription
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_alloc(MEMORY[0x1E4F28E78]);
  if ([(NSMutableSet *)self->_activeOperations count]) {
    id v5 = "ACTIVE";
  }
  else {
    id v5 = "quiescent";
  }
  char v6 = objc_msgSend(v4, "initWithFormat:", @"%s (%ld pending)", v5, -[NSMutableArray count](self->_pendingOperations, "count"));
  if (self->_suspended)
  {
    uint64_t v7 = [(HDAssertionManager *)self->_assertionManager activeAssertionsForIdentifier:@"_HDMaintenanceWorkCoordinatorSuspensionAssertion;"];
    uint64_t v8 = objc_msgSend(v7, "hk_map:", &__block_literal_global_133);
    uint64_t v9 = [v8 allObjects];
    uint64_t v10 = [v9 componentsJoinedByString:@", "];

    [v6 appendFormat:@" SUSPENDED (%@)", v10];
  }
  if ([(NSMutableSet *)self->_activeOperations count])
  {
    objc_msgSend(v6, "appendFormat:", @"\n\tACTIVE (%ld):", -[NSMutableSet count](self->_activeOperations, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v11 = self->_activeOperations;
    uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          [v6 appendFormat:@"\n\t\t**: %@", *(void *)(*((void *)&v21 + 1) + 8 * i)];
        }
        uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }
  }
  if ([(NSMutableArray *)self->_pendingOperations count])
  {
    objc_msgSend(v6, "appendFormat:", @"\n\tPending (%ld):", -[NSMutableArray count](self->_pendingOperations, "count"));
    if ([(NSMutableArray *)self->_pendingOperations count])
    {
      unint64_t v16 = 0;
      do
      {
        unint64_t v17 = v16 + 1;
        uint64_t v18 = -[NSMutableArray objectAtIndexedSubscript:](self->_pendingOperations, "objectAtIndexedSubscript:");
        [v6 appendFormat:@"\n\t\t%2ld: %@", v17, v18];

        unint64_t v19 = [(NSMutableArray *)self->_pendingOperations count];
        unint64_t v16 = v17;
      }
      while (v17 < v19);
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

uint64_t __53__HDMaintenanceWorkCoordinator_diagnosticDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 ownerIdentifier];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_timeoutSource, 0);
  objc_storeStrong((id *)&self->_activeOperations, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_maintenanceWorkQueue, 0);

  objc_storeStrong((id *)&self->_managementQueue, 0);
}

@end