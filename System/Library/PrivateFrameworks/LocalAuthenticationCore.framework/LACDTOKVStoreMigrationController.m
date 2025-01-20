@interface LACDTOKVStoreMigrationController
- (LACDTOKVStoreMigrationController)initWithKVStore:(id)a3 defaults:(id)a4 workQueue:(id)a5;
- (void)_migrateStrictModeKeyIfNeededWithCompletion:(id)a3;
- (void)performMigrationIfNeeded;
@end

@implementation LACDTOKVStoreMigrationController

- (LACDTOKVStoreMigrationController)initWithKVStore:(id)a3 defaults:(id)a4 workQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOKVStoreMigrationController;
  v12 = [(LACDTOKVStoreMigrationController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_defaults, a4);
    objc_storeStrong((id *)&v13->_workQueue, a5);
  }

  return v13;
}

- (void)performMigrationIfNeeded
{
}

void __60__LACDTOKVStoreMigrationController_performMigrationIfNeeded__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (a2)
  {
    v6 = LACLogDTOStorage();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = NSStringFromLACDTOKVStoreKey(0);
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "Migration of key: %{public}@ did finish successfully", (uint8_t *)&v8, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    v6 = LACLogDTOStorage();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __60__LACDTOKVStoreMigrationController_performMigrationIfNeeded__block_invoke_cold_1((uint64_t)v5, v6);
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_migrateStrictModeKeyIfNeededWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(LACGlobalDomainDTO *)self->_defaults isDTOStrictModeEnabled];
  if (v5)
  {
    v6 = LACLogDTOStorage();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = NSStringFromLACDTOKVStoreKey(0);
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "Migration of key: '%{public}@' will start", buf, 0xCu);
    }
    if ([v5 BOOLValue])
    {
      objc_initWeak((id *)buf, self);
      store = self->_store;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __80__LACDTOKVStoreMigrationController__migrateStrictModeKeyIfNeededWithCompletion___block_invoke;
      v9[3] = &unk_2653B57C8;
      objc_copyWeak(&v11, (id *)buf);
      id v10 = v4;
      [(LACDTOKVStore *)store valueForKey:0 completion:v9];

      objc_destroyWeak(&v11);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(LACGlobalDomainDTO *)self->_defaults setIsDTOStrictModeEnabled:0];
      (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __80__LACDTOKVStoreMigrationController__migrateStrictModeKeyIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      int v8 = NSString;
      id v9 = NSStringFromLACDTOKVStoreKey(0);
      id v10 = [v8 stringWithFormat:@"Could not migrate value for key: '%@'", v9];

      uint64_t v11 = *(void *)(a1 + 32);
      v12 = +[LACError errorWithCode:-1000 underlyingError:v6 debugDescription:v10];
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
    }
    else if ([v5 BOOLValue])
    {
      v13 = (void *)*((void *)WeakRetained + 1);
      uint64_t v14 = __80__LACDTOKVStoreMigrationController__migrateStrictModeKeyIfNeededWithCompletion___block_invoke_2();
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __80__LACDTOKVStoreMigrationController__migrateStrictModeKeyIfNeededWithCompletion___block_invoke_3;
      v16[3] = &unk_2653B57A0;
      id v15 = *(id *)(a1 + 32);
      v16[4] = WeakRetained;
      id v17 = v15;
      [v13 processWriteRequest:v14 completion:v16];
    }
    else
    {
      [*((id *)WeakRetained + 2) setIsDTOStrictModeEnabled:0];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

LACDTOMutableKVStoreWriteRequest *__80__LACDTOKVStoreMigrationController__migrateStrictModeKeyIfNeededWithCompletion___block_invoke_2()
{
  v0 = [[LACDTOKVStoreValue alloc] initWithBoolValue:1];
  v1 = [[LACDTOMutableKVStoreWriteRequest alloc] initWithKey:4 value:v0];
  [(LACDTOMutableKVStoreWriteRequest *)v1 setBypassEntitlements:1];

  return v1;
}

void __80__LACDTOKVStoreMigrationController__migrateStrictModeKeyIfNeededWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    v3 = NSString;
    id v4 = NSStringFromLACDTOKVStoreKey(0);
    id v5 = [v3 stringWithFormat:@"Could not migrate value for key: '%@'", v4];

    uint64_t v6 = *(void *)(a1 + 40);
    v7 = +[LACError errorWithCode:-1000 underlyingError:v8 debugDescription:v5];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setIsDTOStrictModeEnabled:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __60__LACDTOKVStoreMigrationController_performMigrationIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromLACDTOKVStoreKey(0);
  int v5 = 138543618;
  uint64_t v6 = v4;
  __int16 v7 = 2114;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "Migration of key: %{public}@ did fail (error=%{public}@)", (uint8_t *)&v5, 0x16u);
}

@end