@interface DNDSUserAvailabilityIntentLauncher
- (DNDSUserAvailabilityIntentLauncher)initWithApplicationRecord:(id)a3 available:(BOOL)a4;
- (void)_cleanupWithError:(id)a3 completion:(id)a4;
- (void)launchIntentExtensionWithCompletion:(id)a3;
@end

@implementation DNDSUserAvailabilityIntentLauncher

- (DNDSUserAvailabilityIntentLauncher)initWithApplicationRecord:(id)a3 available:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDSUserAvailabilityIntentLauncher;
  v8 = [(DNDSUserAvailabilityIntentLauncher *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_applicationRecord, a3);
    v9->_available = a4;
  }

  return v9;
}

- (void)launchIntentExtensionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F30730]);
  id v6 = objc_alloc(MEMORY[0x1E4F30438]);
  id v7 = [NSNumber numberWithInt:!self->_available];
  v8 = (void *)[v6 initWithIsFocused:v7];
  v9 = (void *)[v5 initWithFocusStatus:v8];

  v10 = [(LSApplicationRecord *)self->_applicationRecord bundleIdentifier];
  [v9 _setLaunchId:v10];

  objc_super v11 = (INCExtensionConnection *)[objc_alloc(MEMORY[0x1E4F70BF8]) initWithIntent:v9];
  connection = self->_connection;
  self->_connection = v11;

  objc_initWeak(&location, self);
  [(INCExtensionConnection *)self->_connection setRequiresTCC:0];
  v13 = self->_connection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke;
  v24[3] = &unk_1E69744C8;
  objc_copyWeak(&v26, &location);
  id v14 = v4;
  id v25 = v14;
  [(INCExtensionConnection *)v13 setTimeoutHandler:v24];
  v15 = self->_connection;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_4;
  v21[3] = &unk_1E69744C8;
  objc_copyWeak(&v23, &location);
  id v16 = v14;
  id v22 = v16;
  [(INCExtensionConnection *)v15 setInterruptionHandler:v21];
  v17 = self->_connection;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_5;
  v19[3] = &unk_1E6974518;
  v19[4] = self;
  id v18 = v16;
  id v20 = v18;
  [(INCExtensionConnection *)v17 resumeWithCompletionHandler:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR)) {
    __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_cold_1();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _cleanupWithError:v3 completion:*(void *)(a1 + 32)];
  }
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR)) {
    __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_4_cold_1();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _cleanupWithError:v3 completion:*(void *)(a1 + 32)];
  }
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR)) {
      __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_5_cold_1();
    }
    [*(id *)(a1 + 32) _cleanupWithError:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_6;
    v9[3] = &unk_1E69744F0;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    [v5 handleIntentWithCompletionHandler:v9];
  }
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR)) {
      __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_6_cold_1();
    }
    objc_super v11 = *(void **)(a1 + 32);
    v12 = [v7 underlyingError];
    [v11 _cleanupWithError:v12 completion:*(void *)(a1 + 40)];
  }
  else if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(a1 + 32) + 25), 1u) & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) reset];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 8);
    *(void *)(v8 + 8) = 0;

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, id, void))(v10 + 16))(v10, v5, 0);
    }
  }
}

- (void)_cleanupWithError:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void, id))a4;
  if ((atomic_exchange(&self->_completionFiredFlag._Value, 1u) & 1) == 0)
  {
    [(INCExtensionConnection *)self->_connection reset];
    connection = self->_connection;
    self->_connection = 0;

    if (v6) {
      v6[2](v6, 0, v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "INCExtensionConnection timeout!! %{public}@", v2, v3, v4, v5, v6);
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "INCExtensionConnection interrupted!! %{public}@", v2, v3, v4, v5, v6);
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "INCExtensionConnection resumeWithCompletionHandler error!! %{public}@", v2, v3, v4, v5, v6);
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "INCExtensionConnection proxy handle error!! %{public}@", v2, v3, v4, v5, v6);
}

@end