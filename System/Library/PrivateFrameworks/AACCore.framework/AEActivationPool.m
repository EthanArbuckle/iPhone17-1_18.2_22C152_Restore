@interface AEActivationPool
- (id)initWithPolicyStore:(void *)a3 performancePrimitives:(void *)a4 invalidationHandler:(void *)a5 activations:(void *)a6 queue:;
- (void)activateWithCompletion:(id *)a1;
@end

@implementation AEActivationPool

- (id)initWithPolicyStore:(void *)a3 performancePrimitives:(void *)a4 invalidationHandler:(void *)a5 activations:(void *)a6 queue:
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)AEActivationPool;
    a1 = (id *)objc_msgSendSuper2(&v22, sel_init);
    if (a1)
    {
      uint64_t v17 = MEMORY[0x23ED033D0](v14);
      id v18 = a1[2];
      a1[2] = (id)v17;

      uint64_t v19 = [v15 copy];
      id v20 = a1[1];
      a1[1] = (id)v19;

      objc_storeStrong(a1 + 3, a2);
      objc_storeStrong(a1 + 4, a3);
      objc_storeStrong(a1 + 5, a6);
    }
  }

  return a1;
}

- (void)activateWithCompletion:(id *)a1
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64_t v19 = v3;
    v26 = objc_opt_new();
    v25 = objc_opt_new();
    id v24 = a1[3];
    id v22 = a1[2];
    v5 = dispatch_group_create();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v23 = a1;
    id obj = a1[1];
    uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          dispatch_group_enter(v5);
          v10 = AECoreLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            v11 = [v9 identifier];
            *(_DWORD *)buf = 138543362;
            v35 = v11;
            _os_log_impl(&dword_23D508000, v10, OS_LOG_TYPE_INFO, "Running activation: %{public}@", buf, 0xCu);
          }
          id v12 = [v9 identifier];
          id v13 = [v24 writeOnlyScratchpadForIdentifier:v12];

          id v14 = AELoggingCategoryForEvent([v9 event]);
          id v15 = v23[4];
          id v16 = [v9 identifier];
          uint64_t v17 = [v15 beginIntervalWithCategory:v14 name:v16];

          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __43__AEActivationPool_activateWithCompletion___block_invoke;
          v29[3] = &unk_264EA3848;
          v29[4] = v17;
          v29[5] = v9;
          v29[6] = v26;
          v29[7] = v25;
          v29[8] = v5;
          [v9 activateWithScratchpad:v13 invalidationHandler:v22 completion:v29];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v7);
    }

    id v18 = v23[5];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__AEActivationPool_activateWithCompletion___block_invoke_2;
    block[3] = &unk_264EA3870;
    v4 = v19;
    block[4] = v25;
    block[5] = v26;
    id v28 = v19;
    dispatch_group_notify(v5, v18, block);
  }
}

void __43__AEActivationPool_activateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) endInterval];
  if (v6)
  {
    uint64_t v7 = AECoreLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __43__AEActivationPool_activateWithCompletion___block_invoke_cold_1(a1, v6, v7);
    }

    id v8 = *(id *)(a1 + 48);
    objc_sync_enter(v8);
    [*(id *)(a1 + 48) addObject:v6];
    objc_sync_exit(v8);
  }
  if (v5)
  {
    v9 = [AEPersistentDeactivation alloc];
    v10 = [*(id *)(a1 + 40) identifier];
    v11 = -[AEPersistentDeactivation initWithScratchpadIdentifier:deactivation:]((id *)&v9->super.isa, v10, v5);

    id v12 = *(id *)(a1 + 56);
    objc_sync_enter(v12);
    [*(id *)(a1 + 56) addObject:v11];
    objc_sync_exit(v12);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __43__AEActivationPool_activateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = (id)[*(id *)(a1 + 32) copy];
  id v3 = (void *)[*(id *)(a1 + 40) copy];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_performancePrimitives, 0);
  objc_storeStrong((id *)&self->_policyStore, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_activations, 0);
}

void __43__AEActivationPool_activateWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [*(id *)(a1 + 40) identifier];
  id v6 = objc_msgSend(a2, "ae_verboseDescription");
  int v7 = 138543618;
  id v8 = v5;
  __int16 v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_23D508000, a3, OS_LOG_TYPE_ERROR, "Encountered error running activation: %{public}@. Error: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end