@interface CDPWalrusStateController
- (BOOL)shouldOpenGate;
- (CDPWalrusStateController)initWithContext:(id)a3;
- (id)_makeAnalyticsEvent:(unint64_t)a3 state:(id)a4 error:(id)a5;
- (id)combinedWalrusStatus:(id *)a3;
- (unint64_t)walrusStatus:(id *)a3;
- (void)_startObservingWalrusStateChangeNotification;
- (void)broadcastWalrusStateChange;
- (void)combinedWalrusStatusWithCompletion:(id)a3;
- (void)pcsKeysForServices:(id)a3 completion:(id)a4;
- (void)repairWalrusStatusWithCompletion:(id)a3;
- (void)updateWalrusStatus:(unint64_t)a3 authenticatedContext:(id)a4 completion:(id)a5;
- (void)walrusStatusWithCompletion:(id)a3;
@end

@implementation CDPWalrusStateController

- (void)walrusStatusWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_2182AE000, "Walrus: Fetching status.", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = objc_alloc_init(CDPDaemonConnection);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke;
  v16[3] = &unk_264317090;
  id v7 = v4;
  id v17 = v7;
  v8 = [(CDPDaemonConnection *)v6 daemonWithErrorHandler:v16];
  context = self->_context;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_25;
  v14 = &unk_264317238;
  id v10 = v7;
  id v15 = v10;
  [v8 walrusStatusWithContext:context completion:&v11];
  [(CDPWalrusStateController *)self _startObservingWalrusStateChangeNotification];

  os_activity_scope_leave(&state);
}

- (void)_startObservingWalrusStateChangeNotification
{
  id v2 = +[CDPWalrusNotificationHandler sharedInstance];
  [v2 startObservingWalrusStateChangeNotification];
}

void __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = _CDPLogSystem();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_25_cold_2();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_25_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_25_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to fetch walrus status with error: %@", v2, v3, v4, v5, v6);
}

- (CDPWalrusStateController)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPWalrusStateController;
  uint64_t v5 = [(CDPWalrusStateController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[CDPContext preflightContext:v4];
    context = v5->_context;
    v5->_context = (CDPContext *)v6;
  }
  return v5;
}

void __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)walrusStatus:(id *)a3
{
  uint64_t v5 = _os_activity_create(&dword_2182AE000, "Walrus: Fetching status.", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v6 = objc_alloc_init(CDPDaemonConnection);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__CDPWalrusStateController_walrusStatus___block_invoke;
  v12[3] = &unk_264317260;
  v12[4] = &v13;
  id v7 = [(CDPDaemonConnection *)v6 synchronousDaemonWithErrorHandler:v12];
  context = self->_context;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__CDPWalrusStateController_walrusStatus___block_invoke_27;
  v11[3] = &unk_264317288;
  v11[4] = &v13;
  v11[5] = &v19;
  [v7 walrusStatusWithContext:context completion:v11];
  if (a3) {
    *a3 = (id) v14[5];
  }
  [(CDPWalrusStateController *)self _startObservingWalrusStateChangeNotification];
  unint64_t v9 = v20[3];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  os_activity_scope_leave(&state);

  return v9;
}

void __41__CDPWalrusStateController_walrusStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __41__CDPWalrusStateController_walrusStatus___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __41__CDPWalrusStateController_walrusStatus___block_invoke_27_cold_2();
    }
  }
  else
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_25_cold_1();
    }
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)combinedWalrusStatusWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_2182AE000, "Walrus: Fetching combined status.", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = objc_alloc_init(CDPDaemonConnection);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke;
  v16[3] = &unk_264317090;
  id v7 = v4;
  id v17 = v7;
  v8 = [(CDPDaemonConnection *)v6 daemonWithErrorHandler:v16];
  context = self->_context;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_29;
  v14 = &unk_2643172B0;
  id v10 = v7;
  id v15 = v10;
  [v8 combinedWalrusStatusWithContext:context completion:&v11];
  [(CDPWalrusStateController *)self _startObservingWalrusStateChangeNotification];

  os_activity_scope_leave(&state);
}

void __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_cold_1();
  }

  uint64_t v5 = objc_alloc_init(CDPCombinedWalrusStatus);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_29_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_29_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)combinedWalrusStatus:(id *)a3
{
  id v5 = _os_activity_create(&dword_2182AE000, "Walrus: Fetching combined status.", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v6 = objc_alloc_init(CDPDaemonConnection);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__CDPWalrusStateController_combinedWalrusStatus___block_invoke;
  v12[3] = &unk_264317260;
  v12[4] = &v13;
  id v7 = [(CDPDaemonConnection *)v6 synchronousDaemonWithErrorHandler:v12];
  context = self->_context;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__CDPWalrusStateController_combinedWalrusStatus___block_invoke_31;
  v11[3] = &unk_2643172D8;
  v11[4] = &v13;
  v11[5] = &v19;
  [v7 combinedWalrusStatusWithContext:context completion:v11];
  if (a3) {
    *a3 = (id) v14[5];
  }
  id v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  os_activity_scope_leave(&state);
  return v9;
}

void __49__CDPWalrusStateController_combinedWalrusStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __49__CDPWalrusStateController_combinedWalrusStatus___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_29_cold_2();
    }
  }
  else
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __49__CDPWalrusStateController_combinedWalrusStatus___block_invoke_31_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v5;
}

- (void)repairWalrusStatusWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _os_activity_create(&dword_2182AE000, "Walrus: Repair walrus status.", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  id v5 = objc_alloc_init(CDPDaemonConnection);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke;
  v11[3] = &unk_264317090;
  id v6 = v3;
  id v12 = v6;
  id v7 = [(CDPDaemonConnection *)v5 daemonWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_32;
  v9[3] = &unk_264317090;
  id v8 = v6;
  id v10 = v8;
  [v7 repairWalrusWithCompletion:v9];

  os_activity_scope_leave(&state);
}

void __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_32_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)broadcastWalrusStateChange
{
  id v3 = objc_alloc_init(CDPDaemonConnection);
  uint64_t v2 = [(CDPDaemonConnection *)v3 synchronousDaemonWithErrorHandler:&__block_literal_global_3];
  [v2 broadcastWalrusStateChange];
}

void __54__CDPWalrusStateController_broadcastWalrusStateChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_cold_1();
  }
}

- (id)_makeAnalyticsEvent:(unint64_t)a3 state:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_context eventName:@"com.apple.corecdp.walrusStateChange" category:0x26C984850];
  uint64_t v11 = v10;
  uint64_t v12 = *MEMORY[0x263F20330];
  if (v9)
  {
    [v10 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v12];
    [v11 populateUnderlyingErrorsStartingWithRootError:v9];
  }
  else
  {
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v12];
  }
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:a3];
  [v11 setObject:v13 forKeyedSubscript:@"targetWalrusStatus"];

  if (v8)
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "escrowWalrusStatus"));
    [v11 setObject:v14 forKeyedSubscript:@"escrowWalrusStatus"];

    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "octagonWalrusStatus"));
    [v11 setObject:v15 forKeyedSubscript:@"octagonWalrusStatus"];

    v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "pcsWalrusStatus"));
    [v11 setObject:v16 forKeyedSubscript:@"pcsWalrusStatus"];
  }
  return v11;
}

- (void)updateWalrusStatus:(unint64_t)a3 authenticatedContext:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = _os_activity_create(&dword_2182AE000, "Walrus: Updating status", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  uint64_t v11 = objc_alloc_init(CDPDaemonConnection);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __79__CDPWalrusStateController_updateWalrusStatus_authenticatedContext_completion___block_invoke;
  v18[3] = &unk_264317300;
  v18[4] = self;
  unint64_t v20 = a3;
  id v12 = v9;
  id v19 = v12;
  uint64_t v13 = [(CDPDaemonConnection *)v11 daemonWithErrorHandler:v18];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__CDPWalrusStateController_updateWalrusStatus_authenticatedContext_completion___block_invoke_36;
  v15[3] = &unk_264317328;
  v15[4] = self;
  unint64_t v17 = a3;
  id v14 = v12;
  id v16 = v14;
  [v13 updateWalrusStatus:a3 authenticatedContext:v8 completion:v15];

  os_activity_scope_leave(&state);
}

void __79__CDPWalrusStateController_updateWalrusStatus_authenticatedContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__CDPWalrusStateController_updateWalrusStatus_authenticatedContext_completion___block_invoke_cold_1();
  }

  id v5 = [*(id *)(a1 + 32) _makeAnalyticsEvent:*(void *)(a1 + 48) state:0 error:v3];
  id v6 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
  [v6 sendEvent:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79__CDPWalrusStateController_updateWalrusStatus_authenticatedContext_completion___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = _CDPLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __79__CDPWalrusStateController_updateWalrusStatus_authenticatedContext_completion___block_invoke_36_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Walrus status update has been completed successfully.", v11, 2u);
  }

  id v9 = [*(id *)(a1 + 32) _makeAnalyticsEvent:*(void *)(a1 + 48) state:v6 error:v5];

  id v10 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
  [v10 sendEvent:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)pcsKeysForServices:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _os_activity_create(&dword_2182AE000, "Walrus: Fetch PCS Identities", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = objc_alloc_init(CDPDaemonConnection);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke;
  v16[3] = &unk_264317090;
  id v9 = v6;
  id v17 = v9;
  id v10 = [(CDPDaemonConnection *)v8 daemonWithErrorHandler:v16];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke_38;
  v13[3] = &unk_264317350;
  id v11 = v5;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [v10 pcsKeysForServices:v11 completion:v13];

  os_activity_scope_leave(&state);
}

void __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke_cold_1(v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = objc_alloc_init(NSDictionary);
  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v6, v3);
}

void __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke_38_cold_1(a1, v6, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)shouldOpenGate
{
  return 1;
}

- (void).cxx_destruct
{
}

void __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while fetching walrus status: %{public}@", v2, v3, v4, v5, v6);
}

void __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2182AE000, v0, v1, "Walrus status - %lu", v2, v3, v4, v5, v6);
}

void __41__CDPWalrusStateController_walrusStatus___block_invoke_27_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to fetch walrus status with error - %@", v2, v3, v4, v5, v6);
}

void __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while fetching walrus combined status: %{public}@", v2, v3, v4, v5, v6);
}

void __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2182AE000, v0, v1, "Walrus combined status %@", v2, v3, v4, v5, v6);
}

void __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_29_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to fetch walrus combined status with error: %@", v2, v3, v4, v5, v6);
}

void __49__CDPWalrusStateController_combinedWalrusStatus___block_invoke_31_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while repairing walrus status: %@.", v2, v3, v4, v5, v6);
}

void __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to repair walrus status with error: %@", v2, v3, v4, v5, v6);
}

void __79__CDPWalrusStateController_updateWalrusStatus_authenticatedContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while updating walrus status: %{public}@.", v2, v3, v4, v5, v6);
}

void __79__CDPWalrusStateController_updateWalrusStatus_authenticatedContext_completion___block_invoke_36_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to update walrus status with error %@", v2, v3, v4, v5, v6);
}

void __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "XPC Error while fetching PCS identities - %@", v4, 0xCu);
}

void __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke_38_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_2182AE000, a3, OS_LOG_TYPE_ERROR, "Failed to fetch PCS identities for services %@ with error: %@", (uint8_t *)&v6, 0x16u);
}

@end