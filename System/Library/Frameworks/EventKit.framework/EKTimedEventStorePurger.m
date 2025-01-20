@interface EKTimedEventStorePurger
- (BOOL)ignoreLowLevelDatabaseChangedNotifications;
- (BOOL)internalPurgingAllowed;
- (BOOL)purgingAllowed;
- (EKEventStore)internalStore;
- (EKTimedEventStorePurger)init;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)timer;
- (double)internalTimeout;
- (double)timeout;
- (id)acquireCachedEventStoreOrCreate:(BOOL)a3;
- (id)changedBlock;
- (id)creationBlock;
- (id)internalChangedBlock;
- (id)internalCreationBlock;
- (void)_addPersistentNotificationObservers;
- (void)_databaseChangedExternally;
- (void)_eventStoreChangedNotification:(id)a3;
- (void)_fireChangedBlock;
- (void)_removePersistentNotificationObservers;
- (void)_removeTransientEventStoreChangeObserver;
- (void)_resetIdleTimer;
- (void)_uninstallTimer;
- (void)dealloc;
- (void)setCallbackQueue:(id)a3;
- (void)setChangedBlock:(id)a3;
- (void)setCreationBlock:(id)a3;
- (void)setIgnoreLowLevelDatabaseChangedNotifications:(BOOL)a3;
- (void)setInternalChangedBlock:(id)a3;
- (void)setInternalCreationBlock:(id)a3;
- (void)setInternalPurgingAllowed:(BOOL)a3;
- (void)setInternalStore:(id)a3;
- (void)setInternalTimeout:(double)a3;
- (void)setPurgingAllowed:(BOOL)a3;
- (void)setTimeout:(double)a3;
- (void)setTimer:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation EKTimedEventStorePurger

- (void)_resetIdleTimer
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Purging is disallowed.  Will not set up an idle timer for [%@].", v2, v3, v4, v5, v6);
}

void __59__EKTimedEventStorePurger_acquireCachedEventStoreOrCreate___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) internalStore];
  uint64_t v4 = a1 + 40;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint8_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    goto LABEL_2;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    v7 = [*v2 internalCreationBlock];
    uint64_t v8 = v7[2]();
    uint64_t v9 = *(void *)(*(void *)v4 + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*v2 setInternalStore:*(void *)(*(void *)(*(void *)v4 + 8) + 40)];
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __59__EKTimedEventStorePurger_acquireCachedEventStoreOrCreate___block_invoke_cold_1();
    }
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:*v2 selector:sel__eventStoreChangedNotification_ name:@"EKEventStoreChangedNotification" object:*(void *)(*(void *)(*(void *)v4 + 8) + 40)];

    [*v2 setIgnoreLowLevelDatabaseChangedNotifications:1];
    if (*(void *)(*(void *)(*(void *)v4 + 8) + 40)) {
LABEL_2:
    }
      [*v2 _resetIdleTimer];
  }
}

- (EKEventStore)internalStore
{
  return self->_internalStore;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void)setInternalStore:(id)a3
{
}

- (void)setIgnoreLowLevelDatabaseChangedNotifications:(BOOL)a3
{
  self->_ignoreLowLevelDatabaseChangedNotifications = a3;
}

- (double)internalTimeout
{
  return self->_internalTimeout;
}

- (BOOL)internalPurgingAllowed
{
  return self->_internalPurgingAllowed;
}

- (id)internalCreationBlock
{
  return self->_internalCreationBlock;
}

- (id)acquireCachedEventStoreOrCreate:(BOOL)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__17;
  id v15 = 0;
  uint64_t v5 = [(EKTimedEventStorePurger *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__EKTimedEventStorePurger_acquireCachedEventStoreOrCreate___block_invoke;
  block[3] = &unk_1E5B977C8;
  block[4] = self;
  block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (EKTimedEventStorePurger)init
{
  v10.receiver = self;
  v10.super_class = (Class)EKTimedEventStorePurger;
  uint64_t v2 = [(EKTimedEventStorePurger *)&v10 init];
  if (v2)
  {
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v3 = objc_claimAutoreleasedReturnValue();
    uint64_t v4 = (const char *)[v3 UTF8String];

    dispatch_queue_t v5 = dispatch_queue_create(v4, 0);
    [(EKTimedEventStorePurger *)v2 setWorkQueue:v5];

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v6 = objc_claimAutoreleasedReturnValue();
    v7 = (const char *)[v6 UTF8String];

    dispatch_queue_t v8 = dispatch_queue_create(v7, 0);
    [(EKTimedEventStorePurger *)v2 setCallbackQueue:v8];

    [(EKTimedEventStorePurger *)v2 _addPersistentNotificationObservers];
  }
  return v2;
}

- (void)dealloc
{
  [(EKTimedEventStorePurger *)self _uninstallTimer];
  [(EKTimedEventStorePurger *)self _removePersistentNotificationObservers];
  [(EKTimedEventStorePurger *)self _removeTransientEventStoreChangeObserver];
  v3.receiver = self;
  v3.super_class = (Class)EKTimedEventStorePurger;
  [(EKTimedEventStorePurger *)&v3 dealloc];
}

- (void)setTimeout:(double)a3
{
  dispatch_queue_t v5 = [(EKTimedEventStorePurger *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__EKTimedEventStorePurger_setTimeout___block_invoke;
  v6[3] = &unk_1E5B97778;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __38__EKTimedEventStorePurger_setTimeout___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) internalTimeout];
  double v4 = v3;
  if (vabdd_f64(v3, *(double *)(a1 + 40)) >= 2.22044605e-16)
  {
    dispatch_queue_t v5 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = NSNumber;
      dispatch_queue_t v8 = v5;
      BOOL v9 = [v7 numberWithDouble:v4];
      objc_super v10 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
      int v11 = 138412802;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      v14 = v9;
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_debug_impl(&dword_1A4E47000, v8, OS_LOG_TYPE_DEBUG, "Changing timeout in [%@] from [%@] to [%@].", (uint8_t *)&v11, 0x20u);
    }
    [*(id *)(a1 + 32) setInternalTimeout:*(double *)(a1 + 40)];
    return [*(id *)(a1 + 32) _resetIdleTimer];
  }
  return result;
}

- (double)timeout
{
  uint64_t v7 = 0;
  dispatch_queue_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  double v3 = [(EKTimedEventStorePurger *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__EKTimedEventStorePurger_timeout__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __34__EKTimedEventStorePurger_timeout__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) internalTimeout];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setCreationBlock:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(EKTimedEventStorePurger *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__EKTimedEventStorePurger_setCreationBlock___block_invoke;
  v7[3] = &unk_1E5B96BA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __44__EKTimedEventStorePurger_setCreationBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeTransientEventStoreChangeObserver];
  [*(id *)(a1 + 32) setInternalStore:0];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setInternalCreationBlock:v3];
}

- (id)creationBlock
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__5;
  int v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  uint64_t v3 = [(EKTimedEventStorePurger *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__EKTimedEventStorePurger_creationBlock__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (void *)MEMORY[0x1A6266730](v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __40__EKTimedEventStorePurger_creationBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalCreationBlock];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setChangedBlock:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(EKTimedEventStorePurger *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__EKTimedEventStorePurger_setChangedBlock___block_invoke;
  v7[3] = &unk_1E5B96BA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __43__EKTimedEventStorePurger_setChangedBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInternalChangedBlock:*(void *)(a1 + 40)];
}

- (id)changedBlock
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__5;
  int v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  uint64_t v3 = [(EKTimedEventStorePurger *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__EKTimedEventStorePurger_changedBlock__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (void *)MEMORY[0x1A6266730](v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __39__EKTimedEventStorePurger_changedBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalChangedBlock];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setPurgingAllowed:(BOOL)a3
{
  dispatch_queue_t v5 = [(EKTimedEventStorePurger *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__EKTimedEventStorePurger_setPurgingAllowed___block_invoke;
  v6[3] = &unk_1E5B977A0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __45__EKTimedEventStorePurger_setPurgingAllowed___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) internalPurgingAllowed];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != result)
  {
    [*(id *)(a1 + 32) setInternalPurgingAllowed:v3 != 0];
    uint64_t v4 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    {
      dispatch_queue_t v5 = v4;
      id v6 = CalBooleanAsString();
      BOOL v7 = CalBooleanAsString();
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_debug_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_DEBUG, "Set 'purgingAllowed' from [%@] to [%@] in [%@]", (uint8_t *)&v9, 0x20u);
    }
    return [*(id *)(a1 + 32) _resetIdleTimer];
  }
  return result;
}

- (BOOL)purgingAllowed
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int v3 = [(EKTimedEventStorePurger *)self workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__EKTimedEventStorePurger_purgingAllowed__block_invoke;
  v5[3] = &unk_1E5B96F20;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __41__EKTimedEventStorePurger_purgingAllowed__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) internalPurgingAllowed];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __42__EKTimedEventStorePurger__resetIdleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    __42__EKTimedEventStorePurger__resetIdleTimer__block_invoke_cold_2();
    if (!WeakRetained) {
      goto LABEL_8;
    }
  }
  else if (!WeakRetained)
  {
    goto LABEL_8;
  }
  [WeakRetained setIgnoreLowLevelDatabaseChangedNotifications:0];
  uint64_t v2 = [WeakRetained internalStore];
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __42__EKTimedEventStorePurger__resetIdleTimer__block_invoke_cold_1();
    }
    [WeakRetained _removeTransientEventStoreChangeObserver];
    [WeakRetained setInternalStore:0];
  }
  [WeakRetained _uninstallTimer];

LABEL_8:
}

- (void)_uninstallTimer
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Uninstalling dispatch timer in [%@]", v2, v3, v4, v5, v6);
}

- (void)_addPersistentNotificationObservers
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Adding persistent notification observers for [%@]", v2, v3, v4, v5, v6);
}

- (void)_removePersistentNotificationObservers
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Removing persistent notification observers for [%@]", v2, v3, v4, v5, v6);
}

- (void)_databaseChangedExternally
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A4E47000, v1, OS_LOG_TYPE_DEBUG, "[%@] received notification: [%@]", v2, 0x16u);
}

void __53__EKTimedEventStorePurger__databaseChangedExternally__block_invoke(uint64_t a1)
{
  os_log_t v1 = (void **)(a1 + 32);
  if ([*(id *)(a1 + 32) ignoreLowLevelDatabaseChangedNotifications])
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __53__EKTimedEventStorePurger__databaseChangedExternally__block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v2 = *v1;
    [v2 _fireChangedBlock];
  }
}

- (void)_removeTransientEventStoreChangeObserver
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, v0, v1, "Removing transient event store change observer for event store [%@] in [%@]");
}

- (void)_eventStoreChangedNotification:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKTimedEventStorePurger _eventStoreChangedNotification:]();
  }
  if (!+[EKChangeListener isSyncStatusChangeNotification:v4])
  {
    uint64_t v5 = [(EKTimedEventStorePurger *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__EKTimedEventStorePurger__eventStoreChangedNotification___block_invoke;
    block[3] = &unk_1E5B96E08;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

uint64_t __58__EKTimedEventStorePurger__eventStoreChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fireChangedBlock];
}

- (void)_fireChangedBlock
{
  __int16 v3 = [(EKTimedEventStorePurger *)self internalChangedBlock];
  if (v3)
  {
    id v4 = [(EKTimedEventStorePurger *)self callbackQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__EKTimedEventStorePurger__fireChangedBlock__block_invoke;
    v5[3] = &unk_1E5B96BA8;
    v5[4] = self;
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __44__EKTimedEventStorePurger__fireChangedBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    __44__EKTimedEventStorePurger__fireChangedBlock__block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void)setInternalTimeout:(double)a3
{
  self->_internalTimeout = a3;
}

- (void)setInternalCreationBlock:(id)a3
{
}

- (id)internalChangedBlock
{
  return self->_internalChangedBlock;
}

- (void)setInternalChangedBlock:(id)a3
{
}

- (BOOL)ignoreLowLevelDatabaseChangedNotifications
{
  return self->_ignoreLowLevelDatabaseChangedNotifications;
}

- (void)setInternalPurgingAllowed:(BOOL)a3
{
  self->_internalPurgingAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalStore, 0);
  objc_storeStrong(&self->_internalChangedBlock, 0);
  objc_storeStrong(&self->_internalCreationBlock, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __59__EKTimedEventStorePurger_acquireCachedEventStoreOrCreate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, v0, v1, "No existing store was found in [%@].  Created event store: [%@].");
}

void __42__EKTimedEventStorePurger__resetIdleTimer__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, v0, v1, "Clearing event store: [%@] in [%@]");
}

void __42__EKTimedEventStorePurger__resetIdleTimer__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Idle timer fired in [%@].", v2, v3, v4, v5, v6);
}

void __53__EKTimedEventStorePurger__databaseChangedExternally__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_DEBUG, "Ignored low-level [%@] notification in [%@].", v1, 0x16u);
}

- (void)_eventStoreChangedNotification:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, v0, v1, "[%@] received notification: [%@]");
}

void __44__EKTimedEventStorePurger__fireChangedBlock__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end