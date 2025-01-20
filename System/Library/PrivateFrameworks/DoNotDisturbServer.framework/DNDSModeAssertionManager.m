@interface DNDSModeAssertionManager
- (BOOL)_saveDataToBackingStoreWithError:(id *)a3;
- (DNDSModeAssertionManager)initWithBackingStore:(id)a3 clientDetailsProvider:(id)a4;
- (DNDSModeAssertionManager)initWithBackingStoreURL:(id)a3 clientDetailsProvider:(id)a4;
- (NSString)sysdiagnoseDataIdentifier;
- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6;
- (id)clientDetailsForClientIdentifier:(id)a3;
- (id)modeAssertionInvalidationsMatchingPredicate:(id)a3;
- (id)modeAssertionsMatchingPredicate:(id)a3;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (id)updateModeAssertionsWithContextHandler:(id)a3 error:(id *)a4;
- (void)_loadDataFromBackingStore;
- (void)_resolveTransactionForModeAssertionStore;
- (void)dealloc;
@end

@implementation DNDSModeAssertionManager

- (DNDSModeAssertionManager)initWithBackingStoreURL:(id)a3 clientDetailsProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[DNDSJSONBackingStore alloc] initWithRecordClass:objc_opt_class() fileURL:v7 versionNumber:8];

  v9 = [(DNDSModeAssertionManager *)self initWithBackingStore:v8 clientDetailsProvider:v6];
  return v9;
}

- (DNDSModeAssertionManager)initWithBackingStore:(id)a3 clientDetailsProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDSModeAssertionManager;
  v9 = [(DNDSModeAssertionManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingStore, a3);
    [(DNDSBackingStore *)v10->_backingStore setDelegate:v10];
    objc_storeStrong((id *)&v10->_clientDetailsProvider, a4);
    v10->_storeLock._os_unfair_lock_opaque = 0;
    [(DNDSModeAssertionManager *)v10 _loadDataFromBackingStore];
    DNDSRegisterSysdiagnoseDataProvider(v10);
  }

  return v10;
}

- (void)dealloc
{
  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSModeAssertionManager;
  [(DNDSModeAssertionManager *)&v3 dealloc];
}

- (id)modeAssertionsMatchingPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__DNDSModeAssertionManager_modeAssertionsMatchingPredicate___block_invoke;
  v12[3] = &unk_1E69743E0;
  v14 = &v15;
  id v5 = v4;
  id v13 = v5;
  id v11 = 0;
  id v6 = [(DNDSModeAssertionManager *)self updateModeAssertionsWithContextHandler:v12 error:&v11];
  id v7 = v11;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeAssertionManager modeAssertionsMatchingPredicate:]();
    }
    id v8 = (void *)v16[5];
    v16[5] = MEMORY[0x1E4F1CBF0];
  }
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __60__DNDSModeAssertionManager_modeAssertionsMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 modeAssertionsMatchingPredicate:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (id)modeAssertionInvalidationsMatchingPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__DNDSModeAssertionManager_modeAssertionInvalidationsMatchingPredicate___block_invoke;
  v12[3] = &unk_1E69743E0;
  v14 = &v15;
  id v5 = v4;
  id v13 = v5;
  id v11 = 0;
  id v6 = [(DNDSModeAssertionManager *)self updateModeAssertionsWithContextHandler:v12 error:&v11];
  id v7 = v11;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeAssertionManager modeAssertionInvalidationsMatchingPredicate:]();
    }
    id v8 = (void *)v16[5];
    v16[5] = MEMORY[0x1E4F1CBF0];
  }
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __72__DNDSModeAssertionManager_modeAssertionInvalidationsMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 modeAssertionInvalidationsMatchingPredicate:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (id)updateModeAssertionsWithContextHandler:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = (uint64_t (**)(id, DNDSModeAssertionManagerUpdateContext *))a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v7 = _os_activity_create(&dword_1D3052000, "com.apple.donotdisturb.ModeAssertionManager.updateModeAssertions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  p_storeLock = &self->_storeLock;
  os_unfair_lock_lock(&self->_storeLock);
  id v9 = (void *)MEMORY[0x1D9430630]();
  v10 = [[DNDSModeAssertionManagerUpdateContext alloc] initWithStore:self->_store clientDetailsProvider:self->_clientDetailsProvider];
  int v11 = v6[2](v6, v10);
  objc_super v12 = DNDSLogAssertionManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v22 = v11;
    _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Executed handler; return=%{BOOL}d", buf, 8u);
  }
  if (v11)
  {
    id v13 = [(DNDSModeAssertionManagerUpdateContext *)v10 store];
    if ([(DNDSModeAssertionStore *)self->_store isEqual:v13])
    {
      id v14 = 0;
    }
    else
    {
      v16 = (DNDSModeAssertionStore *)[v13 copy];
      store = self->_store;
      self->_store = v16;

      id v19 = 0;
      [(DNDSModeAssertionManager *)self _saveDataToBackingStoreWithError:&v19];
      id v14 = v19;
      [(DNDSModeAssertionManager *)self _resolveTransactionForModeAssertionStore];
    }
    uint64_t v15 = [(DNDSModeAssertionManagerUpdateContext *)v10 updateResult];
  }
  else
  {
    uint64_t v15 = +[DNDSModeAssertionUpdateResult emptyResult];
    id v14 = 0;
  }

  os_unfair_lock_unlock(p_storeLock);
  if (a4 && v14) {
    *a4 = v14;
  }
  os_activity_scope_leave(&state);

  return v15;
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  return +[DNDSModeAssertionStore upgradeDictionaryRepresentation:a4 fromVersionNumber:a5 toVersionNumber:a6];
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.server.ModeAssertionManager";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  p_storeLock = &self->_storeLock;
  os_unfair_lock_lock(&self->_storeLock);
  id v6 = [(DNDSModeAssertionStore *)self->_store sysdiagnoseDictionaryRepresentation];
  os_unfair_lock_unlock(p_storeLock);
  return v6;
}

- (id)clientDetailsForClientIdentifier:(id)a3
{
  return [(DNDSClientDetailsProvider *)self->_clientDetailsProvider clientDetailsForIdentifier:a3];
}

- (void)_loadDataFromBackingStore
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to load assertion database, will request a radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

BOOL __53__DNDSModeAssertionManager__loadDataFromBackingStore__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 invalidationDate];
  [v2 timeIntervalSinceDate:v3];
  BOOL v5 = v4 > 3024000.0;

  return v5;
}

BOOL __53__DNDSModeAssertionManager__loadDataFromBackingStore__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 requestDate];
  [v2 timeIntervalSinceDate:v3];
  BOOL v5 = v4 > 3024000.0;

  return v5;
}

- (void)_resolveTransactionForModeAssertionStore
{
  uint64_t v3 = [(DNDSModeAssertionStore *)self->_store assertions];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__DNDSModeAssertionManager__resolveTransactionForModeAssertionStore__block_invoke;
  v10[3] = &unk_1E6973720;
  v10[4] = self;
  double v4 = objc_msgSend(v3, "bs_filter:", v10);

  BOOL v5 = [(DNDSModeAssertionStore *)self->_store invalidations];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__DNDSModeAssertionManager__resolveTransactionForModeAssertionStore__block_invoke_2;
  v9[3] = &unk_1E6973FA0;
  v9[4] = self;
  uint8_t v6 = objc_msgSend(v5, "bs_filter:", v9);

  if (![v4 count] && !objc_msgSend(v6, "count"))
  {
    nonPersistentAssertionTransaction = self->_nonPersistentAssertionTransaction;
    self->_nonPersistentAssertionTransaction = 0;
    goto LABEL_6;
  }
  if (!self->_nonPersistentAssertionTransaction)
  {
    id v7 = (OS_os_transaction *)os_transaction_create();
    nonPersistentAssertionTransaction = self->_nonPersistentAssertionTransaction;
    self->_nonPersistentAssertionTransaction = v7;
LABEL_6:
  }
}

uint64_t __68__DNDSModeAssertionManager__resolveTransactionForModeAssertionStore__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 source];
  double v4 = [v3 clientIdentifier];

  BOOL v5 = [*(id *)(*(void *)(a1 + 32) + 24) clientDetailsForIdentifier:v4];
  if ([v5 isPersistentAssertionClient])
  {
    uint64_t v6 = 0;
  }
  else if ([v5 isUserInteractionClient])
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = [v4 hasPrefix:@"com.apple.private.dndtool"];
  }

  return v6;
}

uint64_t __68__DNDSModeAssertionManager__resolveTransactionForModeAssertionStore__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 assertion];
  double v4 = [v3 source];
  BOOL v5 = [v4 clientIdentifier];

  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) clientDetailsForIdentifier:v5];
  if ([v6 isPersistentAssertionClient])
  {
    uint64_t v7 = 0;
  }
  else if ([v6 isUserInteractionClient])
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = [v5 hasPrefix:@"com.apple.private.dndtool"];
  }

  return v7;
}

- (BOOL)_saveDataToBackingStoreWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)[(DNDSModeAssertionStore *)self->_store mutableCopy];
  uint64_t v6 = [v5 assertions];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__DNDSModeAssertionManager__saveDataToBackingStoreWithError___block_invoke;
  v24[3] = &unk_1E6973720;
  v24[4] = self;
  uint64_t v7 = objc_msgSend(v6, "bs_filter:", v24);

  [v5 setAssertions:v7];
  id v8 = [v5 invalidations];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__DNDSModeAssertionManager__saveDataToBackingStoreWithError___block_invoke_2;
  v23[3] = &unk_1E6973FA0;
  v23[4] = self;
  id v9 = objc_msgSend(v8, "bs_filter:", v23);

  [v5 setInvalidations:v9];
  v10 = [v5 invalidationRequests];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __61__DNDSModeAssertionManager__saveDataToBackingStoreWithError___block_invoke_3;
  v22[3] = &unk_1E6974008;
  v22[4] = self;
  int v11 = objc_msgSend(v10, "bs_filter:", v22);

  [v5 setInvalidationRequests:v11];
  backingStore = self->_backingStore;
  id v21 = 0;
  uint64_t v13 = [(DNDSBackingStore *)backingStore writeRecord:v5 error:&v21];
  id v14 = v21;
  if (v13)
  {
    if (v13 == 1)
    {
      uint64_t v19 = DNDSLogAssertionManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v26 = v14;
        v16 = "Failed to write store, but error can be ignored; error=%{public}@";
        uint64_t v17 = v19;
        uint32_t v18 = 12;
        goto LABEL_11;
      }
    }
    else if (v13 == 2)
    {
      uint64_t v15 = DNDSLogAssertionManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "Wrote out store to file";
        uint64_t v17 = v15;
        uint32_t v18 = 2;
LABEL_11:
        _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeAssertionManager _saveDataToBackingStoreWithError:]();
    }
    _DNDSRequestRadar(@"Failed to write store", v14, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSModeAssertionManager.m", 290);
  }
  if (a3 && v14) {
    *a3 = v14;
  }

  return v13 == 2;
}

uint64_t __61__DNDSModeAssertionManager__saveDataToBackingStoreWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [a2 source];
  double v4 = [v3 clientIdentifier];
  BOOL v5 = [v2 clientDetailsForIdentifier:v4];

  uint64_t v6 = [v5 isPersistentAssertionClient];
  return v6;
}

uint64_t __61__DNDSModeAssertionManager__saveDataToBackingStoreWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [a2 assertion];
  double v4 = [v3 source];
  BOOL v5 = [v4 clientIdentifier];
  uint64_t v6 = [v2 clientDetailsForIdentifier:v5];

  uint64_t v7 = [v6 isPersistentAssertionClient];
  return v7;
}

uint64_t __61__DNDSModeAssertionManager__saveDataToBackingStoreWithError___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 source];
  double v4 = v3;
  if (v3)
  {
    BOOL v5 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v6 = [v3 clientIdentifier];
    uint64_t v7 = [v5 clientDetailsForIdentifier:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [v7 isPersistentAssertionClient];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonPersistentAssertionTransaction, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

- (void)modeAssertionsMatchingPredicate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Unable to find assertions, will return default: error=%{public}@", v2, v3, v4, v5, v6);
}

- (void)modeAssertionInvalidationsMatchingPredicate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Unable to find assertion invalidations, will return default: error=%{public}@", v2, v3, v4, v5, v6);
}

- (void)_saveDataToBackingStoreWithError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to write store, will request radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end