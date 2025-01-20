@interface CDPFollowUpController
- (BOOL)clearFollowUpWithContext:(id)a3 error:(id *)a4;
- (BOOL)postFollowUpWithContext:(id)a3 error:(id *)a4;
- (CDPFollowUpController)init;
- (void)dealloc;
- (void)invalidate;
@end

@implementation CDPFollowUpController

- (CDPFollowUpController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDPFollowUpController;
  v2 = [(CDPFollowUpController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CDPDaemonConnection);
    daemonConn = v2->_daemonConn;
    v2->_daemonConn = v3;
  }
  return v2;
}

- (BOOL)postFollowUpWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = _os_activity_create(&dword_2182AE000, "cdp: post follow up", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  daemonConn = self->_daemonConn;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__CDPFollowUpController_postFollowUpWithContext_error___block_invoke;
  v13[3] = &unk_264317260;
  v13[4] = &v18;
  v9 = [(CDPDaemonConnection *)daemonConn synchronousDaemonWithErrorHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__CDPFollowUpController_postFollowUpWithContext_error___block_invoke_17;
  v12[3] = &unk_264317580;
  v12[4] = &v14;
  v12[5] = &v18;
  [v9 postFollowUpWithContext:v6 completion:v12];
  if (a4) {
    *a4 = (id) v19[5];
  }
  char v10 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  os_activity_scope_leave(&state);
  return v10;
}

void __55__CDPFollowUpController_postFollowUpWithContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __55__CDPFollowUpController_postFollowUpWithContext_error___block_invoke_cold_1((uint64_t)v4, v5);
  }
}

void __55__CDPFollowUpController_postFollowUpWithContext_error___block_invoke_17(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "Posted follow ups (%{BOOL}d) with error: %@", (uint8_t *)v9, 0x12u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (BOOL)clearFollowUpWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_2182AE000, "cdp: clear follow up", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  daemonConn = self->_daemonConn;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__CDPFollowUpController_clearFollowUpWithContext_error___block_invoke;
  v13[3] = &unk_264317260;
  v13[4] = &v18;
  v9 = [(CDPDaemonConnection *)daemonConn synchronousDaemonWithErrorHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__CDPFollowUpController_clearFollowUpWithContext_error___block_invoke_19;
  v12[3] = &unk_264317580;
  v12[4] = &v14;
  v12[5] = &v18;
  [v9 clearFollowUpWithContext:v6 completion:v12];
  if (a4) {
    *a4 = (id) v19[5];
  }
  char v10 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  os_activity_scope_leave(&state);
  return v10;
}

void __56__CDPFollowUpController_clearFollowUpWithContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __56__CDPFollowUpController_clearFollowUpWithContext_error___block_invoke_cold_1((uint64_t)v4, v5);
  }
}

void __56__CDPFollowUpController_clearFollowUpWithContext_error___block_invoke_19(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "Cleared follow ups (%{BOOL}d) with error: %@", (uint8_t *)v9, 0x12u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (void)dealloc
{
  [(CDPFollowUpController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CDPFollowUpController;
  [(CDPFollowUpController *)&v3 dealloc];
}

- (void)invalidate
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "Invalidating connection", v1, 2u);
}

- (void).cxx_destruct
{
}

void __55__CDPFollowUpController_postFollowUpWithContext_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "XPC Error posting a follow up: %@", (uint8_t *)&v2, 0xCu);
}

void __56__CDPFollowUpController_clearFollowUpWithContext_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "XPC Error cleaning up follow ups: %@", (uint8_t *)&v2, 0xCu);
}

@end