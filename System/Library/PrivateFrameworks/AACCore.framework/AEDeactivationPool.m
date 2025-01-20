@interface AEDeactivationPool
- (id)initWithPolicyStore:(void *)a3 performancePrimitives:(void *)a4 persistentDeactivations:(void *)a5 queue:;
- (void)deactivateWithCompletion:(uint64_t)a1;
@end

@implementation AEDeactivationPool

- (id)initWithPolicyStore:(void *)a3 performancePrimitives:(void *)a4 persistentDeactivations:(void *)a5 queue:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)AEDeactivationPool;
    a1 = (id *)objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      uint64_t v14 = [v12 copy];
      id v15 = a1[1];
      a1[1] = (id)v14;

      objc_storeStrong(a1 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a5);
    }
  }

  return a1;
}

- (void)deactivateWithCompletion:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v21 = v3;
    v24 = objc_opt_new();
    v5 = dispatch_group_create();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = *(id *)(a1 + 8);
    uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          dispatch_group_enter(v5);
          id v10 = AECoreLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = -[AEPersistentDeactivation deactivation](v9);
            id v12 = [v11 identifier];
            *(_DWORD *)buf = 138543362;
            v33 = v12;
            _os_log_impl(&dword_23D508000, v10, OS_LOG_TYPE_DEFAULT, "Running deactivation: %{public}@", buf, 0xCu);
          }
          id v13 = -[AEPersistentDeactivation deactivation](v9);
          uint64_t v14 = AELoggingCategoryForEvent([v13 event]);

          id v15 = *(id *)(a1 + 24);
          v16 = -[AEPersistentDeactivation deactivation](v9);
          objc_super v17 = [v16 identifier];
          v18 = [v15 beginIntervalWithCategory:v14 name:v17];

          v19 = -[AEPersistentDeactivation deactivation](v9);
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __47__AEDeactivationPool_deactivateWithCompletion___block_invoke;
          v27[3] = &unk_264EA3B68;
          v27[4] = v18;
          v27[5] = v9;
          v27[6] = a1;
          v27[7] = v24;
          v27[8] = v5;
          [v19 deactivateWithCompletion:v27];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    v20 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__AEDeactivationPool_deactivateWithCompletion___block_invoke_1;
    block[3] = &unk_264EA37D0;
    v4 = v21;
    block[4] = v24;
    id v26 = v21;
    dispatch_group_notify(v5, v20, block);
  }
}

void __47__AEDeactivationPool_deactivateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) endInterval];
  if (v3
    && (-[AEPersistentDeactivation deactivation](*(void *)(a1 + 40)),
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isFailable],
        v4,
        !v5))
  {
    v19 = AECoreLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __47__AEDeactivationPool_deactivateWithCompletion___block_invoke_cold_2((uint64_t *)(a1 + 40), v3, v19);
    }

    v20 = AECoreLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = -[AEPersistentDeactivation deactivation](*(void *)(a1 + 40));
      v22 = [v21 identifier];
      *(_DWORD *)buf = 138543362;
      v25 = v22;
      _os_log_impl(&dword_23D508000, v20, OS_LOG_TYPE_DEFAULT, "Scratchpad will NOT be removed for failed deactivation with ID=%{public}@", buf, 0xCu);
    }
    id v13 = *(id *)(a1 + 56);
    objc_sync_enter(v13);
    [*(id *)(a1 + 56) addObject:v3];
    objc_sync_exit(v13);
  }
  else
  {
    uint64_t v6 = AECoreLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = -[AEPersistentDeactivation deactivation](*(void *)(a1 + 40));
      v8 = [v7 identifier];
      *(_DWORD *)buf = 138543362;
      v25 = v8;
      _os_log_impl(&dword_23D508000, v6, OS_LOG_TYPE_DEFAULT, "Removing scratchpad for completed deactivation with ID=%{public}@", buf, 0xCu);
    }
    uint64_t v9 = *(void **)(a1 + 48);
    if (v9) {
      uint64_t v9 = (void *)v9[2];
    }
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v12 = -[AEPersistentDeactivation scratchpadIdentifier](v10);
    id v13 = [v11 readOnlyScratchpadForIdentifier:v12];

    id v23 = 0;
    char v14 = [v13 removeWithError:&v23];
    id v15 = v23;
    if (v15) {
      char v16 = v14;
    }
    else {
      char v16 = 1;
    }
    if ((v16 & 1) == 0)
    {
      objc_super v17 = AECoreLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __47__AEDeactivationPool_deactivateWithCompletion___block_invoke_cold_1((uint64_t *)(a1 + 40), v17);
      }

      id v18 = *(id *)(a1 + 56);
      objc_sync_enter(v18);
      [*(id *)(a1 + 56) addObject:v15];
      objc_sync_exit(v18);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __47__AEDeactivationPool_deactivateWithCompletion___block_invoke_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_performancePrimitives, 0);
  objc_storeStrong((id *)&self->_policyStore, 0);
  objc_storeStrong((id *)&self->_persistentDeactivations, 0);
}

void __47__AEDeactivationPool_deactivateWithCompletion___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = -[AEPersistentDeactivation deactivation](*a1);
  v4 = [v3 identifier];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_23D508000, a2, OS_LOG_TYPE_ERROR, "An error occurred removing the scratchpad for deactivation with ID=%{public}@", (uint8_t *)&v5, 0xCu);
}

void __47__AEDeactivationPool_deactivateWithCompletion___block_invoke_cold_2(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v5 = -[AEPersistentDeactivation deactivation](*a1);
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = objc_msgSend(a2, "ae_verboseDescription");
  int v8 = 138543618;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  id v11 = v7;
  _os_log_error_impl(&dword_23D508000, a3, OS_LOG_TYPE_ERROR, "Encountered error running deactivation: %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);
}

@end