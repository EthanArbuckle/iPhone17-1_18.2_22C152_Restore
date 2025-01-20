@interface LACSharedModeProcessor
- (BOOL)canProcessRequest:(id)a3;
- (LACSharedModeProcessor)initWithReplyQueue:(id)a3 dataSource:(id)a4 policyTraitsManager:(id)a5 policyCoordinator:(id)a6;
- (void)_processRequest:(id)a3 completion:(id)a4;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACSharedModeProcessor

void __53__LACSharedModeProcessor__processRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = LACLogSharedMode();
  os_log_type_t v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v7 = 138543618;
    id v8 = WeakRetained;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl(&dword_254F14000, v4, v5, "%{public}@ Policy update for shared mode finished err=%{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__LACSharedModeProcessor_processRequest_configuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = LACLogSharedMode();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v6 = 138543362;
    id v7 = WeakRetained;
    _os_log_impl(&dword_254F14000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  os_log_type_t v5 = +[LACEvaluationResult resultWithNext:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

LACMutableSharedModeDataSourceRequestOptions *__53__LACSharedModeProcessor__processRequest_completion___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LACMutableSharedModeDataSourceRequestOptions);
  id v3 = [*(id *)(a1 + 32) options];
  uint64_t v4 = [NSNumber numberWithInteger:1000];
  os_log_type_t v5 = [v3 objectForKeyedSubscript:v4];
  -[LACMutableSharedModeDataSourceRequestOptions setIsPreflight:](v2, "setIsPreflight:", [v5 BOOLValue]);

  return v2;
}

void __53__LACSharedModeProcessor__processRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_log_type_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [*((id *)WeakRetained + 4) policyTraitsForSharedMode:v3];
    id v7 = (void *)v5[3];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__LACSharedModeProcessor__processRequest_completion___block_invoke_3;
    v8[3] = &unk_2653B5FB0;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    id v9 = *(id *)(a1 + 32);
    [v7 updatePolicyEvaluationWithTraits:v6 completion:v8];

    objc_destroyWeak(&v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyTraitsManager, 0);
  objc_storeStrong((id *)&self->_policyCoordinator, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

- (LACSharedModeProcessor)initWithReplyQueue:(id)a3 dataSource:(id)a4 policyTraitsManager:(id)a5 policyCoordinator:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LACSharedModeProcessor;
  v15 = [(LACSharedModeProcessor *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_replyQueue, a3);
    objc_storeStrong((id *)&v16->_dataSource, a4);
    objc_storeStrong((id *)&v16->_policyTraitsManager, a5);
    objc_storeStrong((id *)&v16->_policyCoordinator, a6);
  }

  return v16;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(LACSharedModeProcessor *)self canProcessRequest:v8])
  {
    id v11 = LACLogSharedMode();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v18 = self;
      _os_log_impl(&dword_254F14000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will start", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66__LACSharedModeProcessor_processRequest_configuration_completion___block_invoke;
    v13[3] = &unk_2653B55B0;
    objc_copyWeak(&v16, (id *)buf);
    id v15 = v10;
    id v14 = v8;
    [(LACSharedModeProcessor *)self _processRequest:v14 completion:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v12 = +[LACEvaluationResult resultWithNext:v8];
    (*((void (**)(id, void *))v10 + 2))(v10, v12);
  }
}

- (BOOL)canProcessRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 acl];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [v4 acl],
        id v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = +[LACAccessControl checkACLAllowsAll:v7],
        v7,
        v6,
        v8))
  {
    id v9 = LACLogSharedMode();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = self;
      _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ not needed for this request type", (uint8_t *)&v12, 0xCu);
    }

    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_processRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  dataSource = self->_dataSource;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__LACSharedModeProcessor__processRequest_completion___block_invoke;
  v15[3] = &unk_2653B5F88;
  id v9 = v6;
  id v16 = v9;
  BOOL v10 = __53__LACSharedModeProcessor__processRequest_completion___block_invoke((uint64_t)v15);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__LACSharedModeProcessor__processRequest_completion___block_invoke_2;
  v12[3] = &unk_2653B5C98;
  objc_copyWeak(&v14, &location);
  id v11 = v7;
  id v13 = v11;
  [(LACSharedModeDataSource *)dataSource fetchSharedModeWithOptions:v10 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

@end