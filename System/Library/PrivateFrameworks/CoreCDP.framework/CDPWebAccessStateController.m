@interface CDPWebAccessStateController
- (unint64_t)webAccessStatus:(id *)a3;
- (void)updateWebAccessStatus:(unint64_t)a3 completion:(id)a4;
- (void)webAccessStatusWithCompletion:(id)a3;
@end

@implementation CDPWebAccessStateController

- (void)webAccessStatusWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = _os_activity_create(&dword_2182AE000, "Web access: Fetching status.", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  v5 = objc_alloc_init(CDPDaemonConnection);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke;
  v11[3] = &unk_264317090;
  id v6 = v3;
  id v12 = v6;
  v7 = [(CDPDaemonConnection *)v5 daemonWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_17;
  v9[3] = &unk_264317238;
  id v8 = v6;
  id v10 = v8;
  [v7 webAccessStatusWithCompletion:v9];

  os_activity_scope_leave(&state);
}

void __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _CDPLogSystem();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_17_cold_1((uint64_t)v5, v7);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = a2;
      _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "Web access status - %lu", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v7 = +[CDPWebAccessNotificationHandler sharedInstance];
    [v7 startObservingWebAccessStateChangeNotification];
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)webAccessStatus:(id *)a3
{
  v4 = _os_activity_create(&dword_2182AE000, "Web access: Fetching status.", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id v5 = objc_alloc_init(CDPDaemonConnection);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__CDPWebAccessStateController_webAccessStatus___block_invoke;
  v10[3] = &unk_264317260;
  v10[4] = &v11;
  uint64_t v6 = [(CDPDaemonConnection *)v5 synchronousDaemonWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__CDPWebAccessStateController_webAccessStatus___block_invoke_20;
  v9[3] = &unk_264317288;
  void v9[4] = &v11;
  v9[5] = &v17;
  [v6 webAccessStatusWithCompletion:v9];
  if (a3) {
    *a3 = (id) v12[5];
  }
  unint64_t v7 = v18[3];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  os_activity_scope_leave(&state);

  return v7;
}

void __47__CDPWebAccessStateController_webAccessStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void __47__CDPWebAccessStateController_webAccessStatus___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __47__CDPWebAccessStateController_webAccessStatus___block_invoke_20_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    uint64_t v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      uint64_t v10 = a2;
      _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Web access status - %lu", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v7 = +[CDPWebAccessNotificationHandler sharedInstance];
    [v7 startObservingWebAccessStateChangeNotification];
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)updateWebAccessStatus:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = _os_activity_create(&dword_2182AE000, "Web access: Updating status", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  uint64_t v7 = objc_alloc_init(CDPDaemonConnection);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke;
  v13[3] = &unk_264317090;
  id v8 = v5;
  id v14 = v8;
  int v9 = [(CDPDaemonConnection *)v7 daemonWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke_21;
  v11[3] = &unk_264317090;
  id v10 = v8;
  id v12 = v10;
  [v9 updateWebAccessStatus:a3 completion:v11];

  os_activity_scope_leave(&state);
}

void __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _CDPLogSystem();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke_21_cold_1(v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Web access status update has been completed successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_17_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch web access status with error: %@", (uint8_t *)&v2, 0xCu);
}

void __47__CDPWebAccessStateController_webAccessStatus___block_invoke_20_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch web access status with error - %@", (uint8_t *)&v2, 0xCu);
}

void __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke_21_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "Failed to update web access status with error %@", (uint8_t *)&v4, 0xCu);
}

@end