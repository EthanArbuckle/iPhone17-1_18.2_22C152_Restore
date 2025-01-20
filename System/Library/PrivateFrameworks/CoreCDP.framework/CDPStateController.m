@interface CDPStateController
- (BOOL)deleteRecoveryKeyWithError:(id *)a3;
- (BOOL)isDeviceEscrowRecordRecoverable:(id *)a3;
- (BOOL)isManateeAvailable:(id *)a3;
- (BOOL)isRecoveryKeyAvailableWithError:(id *)a3;
- (BOOL)isWalrusRecoveryKeyAvailableWithError:(id *)a3;
- (BOOL)shouldPerformAuthenticatedRepairWithOptionForceFetch:(BOOL)a3 error:(id *)a4;
- (BOOL)shouldPerformRepairWithOptionForceFetch:(BOOL)a3 error:(id *)a4;
- (BOOL)shouldPerformSilentEscrowRecordRepairUsingCache:(BOOL)a3 error:(id *)a4;
- (BOOL)updateLastSilentEscrowRecordRepairAttemptDate:(id)a3 error:(id *)a4;
- (BOOL)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError:(id *)a3;
- (CDPStateController)init;
- (id)createEDPLivenessDictionaryWithContext:(id)a3 error:(id *)a4;
- (id)generateRandomRecoveryKey:(id *)a3;
- (void)_handleCloudDataProtectionStateWithCompletion:(id)a3;
- (void)attemptToEscrowPreRecord:(id)a3 completion:(id)a4;
- (void)attemptToEscrowPreRecord:(id)a3 preRecordUUID:(id)a4 secretType:(unint64_t)a5 completion:(id)a6;
- (void)authenticateAndDeleteRecoveryKeyWithCompletion:(id)a3;
- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:(id)a3;
- (void)deleteRecoveryKey:(id)a3;
- (void)deviceEscrowRecordRecoverableWithContext:(id)a3 completion:(id)a4;
- (void)fetchEDPTokenWithCompletion:(id)a3;
- (void)fetchEscrowRecordDevicesWithContext:(id)a3 usingCache:(BOOL)a4 completion:(id)a5;
- (void)finishCyrusFlowAfterTermsAgreementWithContext:(id)a3;
- (void)finishOfflineLocalSecretChangeWithCompletion:(id)a3;
- (void)generateEscrowRecordReportUsingCache:(BOOL)a3 completion:(id)a4;
- (void)generateNewRecoveryKey:(id)a3;
- (void)handleCloudDataProtectionStateWithCompletion:(id)a3;
- (void)handleURLActionWithInfo:(id)a3;
- (void)handleURLActionWithInfo:(id)a3 completion:(id)a4;
- (void)isRecoveryKeyAvailableWithCompletion:(id)a3;
- (void)isWalrusRecoveryKeyAvailableWithCompletion:(id)a3;
- (void)localSecretChangedTo:(id)a3 secretType:(unint64_t)a4 completion:(id)a5;
- (void)performSilentEscrowRecordRepairWithCompletion:(id)a3;
- (void)recoverAndSynchronizeWithSquirrel:(id)a3;
- (void)recoverWithSquirrel:(id)a3;
- (void)repairCloudDataProtectionStateWithCompletion:(id)a3;
- (void)repairEDPStateWithCompletion:(id)a3;
- (void)setKeyChainSyncCompatibilityState:(unint64_t)a3 withAltDSID:(id)a4;
- (void)shouldPerformRepairWithOptionForceFetch:(BOOL)a3 completion:(id)a4;
- (void)shouldPerformSilentEscrowRecordRepairUsingCache:(BOOL)a3 completion:(id)a4;
- (void)startCircleApplicationApprovalServer:(id)a3;
- (void)startCircleApplicationApprovalServerSkipEscrowFetches:(id)a3;
- (void)startSilentEscrowRecordRepairWithCompletion:(id)a3;
- (void)validateEDPIdentitiesWithContext:(id)a3 completion:(id)a4;
- (void)verifyRecoveryKey:(id)a3;
@end

@implementation CDPStateController

- (CDPStateController)init
{
  v3.receiver = self;
  v3.super_class = (Class)CDPStateController;
  return [(CDPController *)&v3 init];
}

- (BOOL)isManateeAvailable:(id *)a3
{
  v5 = _os_activity_create(&dword_2182AE000, "cdp/manatee-availability", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "Requesting manatee state...", buf, 2u);
  }

  v7 = [CDPManateeStateController alloc];
  v8 = [(CDPController *)self context];
  v9 = [(CDPManateeStateController *)v7 initWithContext:v8];

  id v15 = 0;
  BOOL v10 = [(CDPManateeStateController *)v9 isManateeAvailable:&v15];
  id v11 = v15;
  if (v10)
  {
    v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "Manatee is available", buf, 2u);
    }
  }
  else
  {
    v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CDPStateController isManateeAvailable:]();
    }

    if (a3) {
      *a3 = v11;
    }
  }

  os_activity_scope_leave(&state);
  return v10;
}

- (void)handleCloudDataProtectionStateWithCompletion:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke;
  v12[3] = &unk_264317A00;
  v12[4] = self;
  v12[5] = v15;
  v12[6] = v13;
  v5 = (void *)MEMORY[0x21D4671C0](v12);
  v6 = (void *)[objc_alloc(MEMORY[0x263F203F8]) initWithMaxRetries:2];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_2_30;
  v8[3] = &unk_264317A70;
  id v7 = v4;
  id v9 = v7;
  BOOL v10 = v15;
  id v11 = v13;
  [v6 scheduleTask:v5 shouldRetry:&__block_literal_global_12 completionHandler:v8];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
}

void __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_2;
  v6[3] = &unk_2643179D8;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v7 = v3;
  id v5 = v3;
  [v4 _handleCloudDataProtectionStateWithCompletion:v6];
}

uint64_t __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_2(void *a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

uint64_t __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_28(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cdp_indicatesDaemonConnectionWasInterrupted");
}

void __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_2_30(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_3;
  v8[3] = &unk_264317A48;
  id v5 = *(id *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 40);
  id v9 = v4;
  id v10 = v5;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_3(void *a1)
{
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24), *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24), a1[4]);
  }
  return result;
}

- (void)_handleCloudDataProtectionStateWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2182AE000, "cdp/statemachine-handle", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _CDPSignpostLogSystem();
  os_signpost_id_t v7 = _CDPSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _CDPSignpostLogSystem();
  long long v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HandleCloudDataProtectionState", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v12 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: HandleCloudDataProtectionState  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  v13 = self;
  v35 = v13;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __68__CDPStateController__handleCloudDataProtectionStateWithCompletion___block_invoke;
  v25[3] = &unk_264317A98;
  os_signpost_id_t v28 = v7;
  uint64_t v29 = v9;
  p_long long buf = &buf;
  id v14 = v4;
  id v26 = v14;
  id v15 = (void *)MEMORY[0x21D4671C0](v25);
  char v16 = [(CDPController *)v13 daemonConn];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __68__CDPStateController__handleCloudDataProtectionStateWithCompletion___block_invoke_33;
  v23[3] = &unk_264317090;
  id v17 = v15;
  id v24 = v17;
  v18 = [v16 daemonWithErrorHandler:v23];

  v19 = _CDPLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEFAULT, "Requesting start of CDP state machine...", v22, 2u);
  }

  v20 = [(CDPController *)v13 context];
  v21 = [(CDPController *)v13 uiProviderProxy];
  [v18 handleCloudDataProtectionStateWithContext:v20 uiProvider:v21 completion:v17];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __68__CDPStateController__handleCloudDataProtectionStateWithCompletion___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v9 = _CDPSignpostLogSystem();
  id v10 = v9;
  os_signpost_id_t v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v20 = 67240192;
    *(_DWORD *)v21 = [v7 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v10, OS_SIGNPOST_INTERVAL_END, v11, "HandleCloudDataProtectionState", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v20, 8u);
  }

  v12 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = (double)Nanoseconds / 1000000000.0;
    uint64_t v14 = a1[6];
    int v15 = [v7 code];
    int v20 = 134218496;
    *(void *)v21 = v14;
    *(_WORD *)&v21[8] = 2048;
    *(double *)v22 = v13;
    *(_WORD *)&uint8_t v22[8] = 1026;
    int v23 = v15;
    _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: HandleCloudDataProtectionState  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }

  uint64_t v16 = *(void *)(a1[5] + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = 0;

  uint64_t v18 = a1[4];
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v18 + 16))(v18, a2, a3, v7);
  }
  v19 = _CDPLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 67109634;
    *(_DWORD *)v21 = a2;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = a3;
    *(_WORD *)v22 = 2112;
    *(void *)&v22[2] = v7;
    _os_log_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEFAULT, "State machine completed shouldCompleteSignIn=%{BOOL}d cloudDataProtectionEnabled=%{BOOL}d error=%@", (uint8_t *)&v20, 0x18u);
  }
}

void __68__CDPStateController__handleCloudDataProtectionStateWithCompletion___block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__CDPStateController__handleCloudDataProtectionStateWithCompletion___block_invoke_33_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)repairCloudDataProtectionStateWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2182AE000, "cdp/statemachine-repair", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _CDPSignpostLogSystem();
  os_signpost_id_t v7 = _CDPSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _CDPSignpostLogSystem();
  os_signpost_id_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RepairCloudDataProtectionState", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v12 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RepairCloudDataProtectionState  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  double v13 = self;
  v35 = v13;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke;
  v25[3] = &unk_264317AE8;
  os_signpost_id_t v28 = v7;
  uint64_t v29 = v9;
  p_long long buf = &buf;
  id v14 = v4;
  id v26 = v14;
  int v15 = (void *)MEMORY[0x21D4671C0](v25);
  uint64_t v16 = [(CDPController *)v13 daemonConn];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_37;
  v23[3] = &unk_264317090;
  id v17 = v15;
  id v24 = v17;
  uint64_t v18 = [v16 daemonWithErrorHandler:v23];

  v19 = _CDPLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEFAULT, "Requesting repair of CDP state...", v22, 2u);
  }

  int v20 = [(CDPController *)v13 context];
  v21 = [(CDPController *)v13 uiProviderProxy];
  [v18 repairCloudDataProtectionStateWithContext:v20 uiProvider:v21 completion:v17];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  os_signpost_id_t v7 = _CDPSignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v22) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RepairCloudDataProtectionState", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  id v10 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = *(void *)(a1 + 48);
    int v13 = [v5 code];
    *(_DWORD *)long long buf = 134218496;
    uint64_t v22 = v12;
    __int16 v23 = 2048;
    double v24 = v11;
    __int16 v25 = 1026;
    int v26 = v13;
    _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RepairCloudDataProtectionState  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_35;
  block[3] = &unk_264317AC0;
  char v20 = a2;
  id v18 = v5;
  long long v16 = *(_OWORD *)(a1 + 32);
  id v14 = (id)v16;
  long long v19 = v16;
  id v15 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_35(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    v8[0] = 67109378;
    v8[1] = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "State machine repair completed didRepair=%{BOOL}d error=%@", (uint8_t *)v8, 0x12u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

void __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_37_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)repairEDPStateWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _os_activity_create(&dword_2182AE000, "cdp/edp-state-repair", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = _CDPSignpostLogSystem();
  os_signpost_id_t v7 = _CDPSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _CDPSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RepairEDPState", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  uint64_t v12 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RepairEDPState  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  int v13 = self;
  v35 = v13;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __51__CDPStateController_repairEDPStateWithCompletion___block_invoke;
  v25[3] = &unk_264317AE8;
  os_signpost_id_t v28 = v7;
  uint64_t v29 = v9;
  p_long long buf = &buf;
  id v14 = v4;
  id v26 = v14;
  id v15 = (void *)MEMORY[0x21D4671C0](v25);
  long long v16 = [(CDPController *)v13 daemonConn];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __51__CDPStateController_repairEDPStateWithCompletion___block_invoke_39;
  v23[3] = &unk_264317090;
  id v17 = v15;
  id v24 = v17;
  id v18 = [v16 daemonWithErrorHandler:v23];

  long long v19 = _CDPLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEFAULT, "Requesting repair of EDP state...", v22, 2u);
  }

  char v20 = [(CDPController *)v13 context];
  v21 = [(CDPController *)v13 uiProviderProxy];
  [v18 repairEDPStateWithContext:v20 uiProvider:v21 completion:v17];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __51__CDPStateController_repairEDPStateWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  os_signpost_id_t v7 = _CDPSignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v22) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RepairEDPState", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  uint64_t v10 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = *(void *)(a1 + 48);
    int v13 = [v5 code];
    *(_DWORD *)long long buf = 134218496;
    uint64_t v22 = v12;
    __int16 v23 = 2048;
    double v24 = v11;
    __int16 v25 = 1026;
    int v26 = v13;
    _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RepairEDPState  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CDPStateController_repairEDPStateWithCompletion___block_invoke_38;
  block[3] = &unk_264317AC0;
  char v20 = a2;
  id v18 = v5;
  long long v16 = *(_OWORD *)(a1 + 32);
  id v14 = (id)v16;
  long long v19 = v16;
  id v15 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __51__CDPStateController_repairEDPStateWithCompletion___block_invoke_38(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    v8[0] = 67109378;
    v8[1] = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "EDP repair completed didRepair=%{BOOL}d error=%@", (uint8_t *)v8, 0x12u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

void __51__CDPStateController_repairEDPStateWithCompletion___block_invoke_39(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__CDPStateController_repairEDPStateWithCompletion___block_invoke_39_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startCircleApplicationApprovalServer:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__3;
  v19[4] = __Block_byref_object_dispose__3;
  int v5 = self;
  char v20 = v5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke;
  v16[3] = &unk_264317B38;
  id v18 = v19;
  id v6 = v4;
  id v17 = v6;
  os_signpost_id_t v7 = (void *)MEMORY[0x21D4671C0](v16);
  uint64_t v8 = [(CDPController *)v5 daemonConn];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke_3;
  v14[3] = &unk_264317090;
  id v9 = v7;
  id v15 = v9;
  uint64_t v10 = [v8 daemonWithErrorHandler:v14];

  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v13 = 0;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "Requesting start of accepting sharing session...", v13, 2u);
  }

  uint64_t v12 = [(CDPController *)v5 context];
  [v10 startCircleApplicationApprovalServerWithContext:v12 completion:v9];

  _Block_object_dispose(v19, 8);
}

void __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke_2;
  block[3] = &unk_264317B10;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  long long v11 = v8;
  char v12 = a2;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startCircleApplicationApprovalServerSkipEscrowFetches:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Requesting start of accepting sharing session, skipping escrow fetches...", v7, 2u);
  }

  id v6 = [(CDPController *)self context];
  objc_msgSend(v6, "set_skipEscrowFetches:", 1);

  [(CDPStateController *)self startCircleApplicationApprovalServer:v4];
}

- (void)recoverAndSynchronizeWithSquirrel:(id)a3
{
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__3;
  v20[4] = __Block_byref_object_dispose__3;
  id v5 = self;
  v21 = v5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __56__CDPStateController_recoverAndSynchronizeWithSquirrel___block_invoke;
  v17[3] = &unk_264317B38;
  long long v19 = v20;
  id v6 = v4;
  id v18 = v6;
  id v7 = (void *)MEMORY[0x21D4671C0](v17);
  long long v8 = [(CDPController *)v5 daemonConn];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__CDPStateController_recoverAndSynchronizeWithSquirrel___block_invoke_3;
  void v15[3] = &unk_264317090;
  id v9 = v7;
  id v16 = v9;
  id v10 = [v8 daemonWithErrorHandler:v15];

  long long v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "Requesting repair and synchronization of CDP state with Squirrel...", v14, 2u);
  }

  char v12 = [(CDPController *)v5 context];
  int v13 = [(CDPController *)v5 uiProviderProxy];
  [v10 recoverAndSynchronizeSquirrelWithContext:v12 uiProvider:v13 completion:v9];

  _Block_object_dispose(v20, 8);
}

void __56__CDPStateController_recoverAndSynchronizeWithSquirrel___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CDPStateController_recoverAndSynchronizeWithSquirrel___block_invoke_2;
  block[3] = &unk_264317B10;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  long long v11 = v8;
  char v12 = a2;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__CDPStateController_recoverAndSynchronizeWithSquirrel___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __56__CDPStateController_recoverAndSynchronizeWithSquirrel___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_37_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recoverWithSquirrel:(id)a3
{
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__3;
  v20[4] = __Block_byref_object_dispose__3;
  id v5 = self;
  v21 = v5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __42__CDPStateController_recoverWithSquirrel___block_invoke;
  v17[3] = &unk_264317B38;
  long long v19 = v20;
  id v6 = v4;
  id v18 = v6;
  id v7 = (void *)MEMORY[0x21D4671C0](v17);
  long long v8 = [(CDPController *)v5 daemonConn];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __42__CDPStateController_recoverWithSquirrel___block_invoke_3;
  void v15[3] = &unk_264317090;
  id v9 = v7;
  id v16 = v9;
  id v10 = [v8 daemonWithErrorHandler:v15];

  long long v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "Requesting repair of CDP state with Squirrel...", v14, 2u);
  }

  char v12 = [(CDPController *)v5 context];
  int v13 = [(CDPController *)v5 uiProviderProxy];
  [v10 recoverSquirrelWithContext:v12 uiProvider:v13 completion:v9];

  _Block_object_dispose(v20, 8);
}

void __42__CDPStateController_recoverWithSquirrel___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__CDPStateController_recoverWithSquirrel___block_invoke_2;
  block[3] = &unk_264317B10;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  long long v11 = v8;
  char v12 = a2;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __42__CDPStateController_recoverWithSquirrel___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __42__CDPStateController_recoverWithSquirrel___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_37_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)attemptToEscrowPreRecord:(id)a3 preRecordUUID:(id)a4 secretType:(unint64_t)a5 completion:(id)a6
{
}

- (void)attemptToEscrowPreRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__3;
  v22[4] = __Block_byref_object_dispose__3;
  long long v8 = self;
  __int16 v23 = v8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke;
  v19[3] = &unk_264317B38;
  v21 = v22;
  id v9 = v7;
  id v20 = v9;
  id v10 = (void *)MEMORY[0x21D4671C0](v19);
  long long v11 = [(CDPController *)v8 daemonConn];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke_3;
  v17[3] = &unk_264317090;
  id v12 = v10;
  id v18 = v12;
  int v13 = [v11 daemonWithErrorHandler:v17];

  id v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "Informing daemon of attempting to escrow preRecord...", v16, 2u);
  }

  id v15 = [(CDPController *)v8 context];
  [v13 attemptToEscrowPreRecord:v6 context:v15 completion:v12];

  _Block_object_dispose(v22, 8);
}

void __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke_2;
  block[3] = &unk_264317B10;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  long long v11 = v8;
  char v12 = a2;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)localSecretChangedTo:(id)a3 secretType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  id v42 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__3;
  v34[4] = __Block_byref_object_dispose__3;
  id v10 = self;
  v35 = v10;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke;
  v28[3] = &unk_264317BB0;
  v31 = &v37;
  id v11 = v8;
  uint64_t v32 = v34;
  unint64_t v33 = a4;
  id v29 = v11;
  id v12 = v9;
  id v30 = v12;
  int v13 = (void *)MEMORY[0x21D4671C0](v28);
  id v14 = [(CDPController *)v10 daemonConn];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_41;
  v24[3] = &unk_264317BD8;
  uint64_t v27 = v36;
  id v15 = v13;
  id v25 = v15;
  id v16 = v12;
  id v26 = v16;
  uint64_t v17 = [v14 daemonWithErrorHandler:v24];
  id v18 = (void *)v38[5];
  v38[5] = v17;

  long long v19 = _CDPLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v23 = 0;
    _os_log_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEFAULT, "Informing daemon of local secret change...", v23, 2u);
  }

  id v20 = (void *)v38[5];
  v21 = [(CDPController *)v10 context];
  uint64_t v22 = [(CDPController *)v10 uiProviderProxy];
  [v20 localSecretChangedTo:v11 secretType:a4 context:v21 uiProvider:v22 completion:v15];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v37, 8);
}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_2;
  block[3] = &unk_264317B88;
  uint64_t v6 = *(void *)(a1 + 48);
  id v11 = v5;
  uint64_t v14 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = v8;
  id v12 = v7;
  id v13 = *(id *)(a1 + 40);
  char v17 = a2;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = _CDPLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_2_cold_1();
    }

    id v3 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 72);
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) context];
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) uiProviderProxy];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_40;
    void v13[3] = &unk_264317B60;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 64);
    id v14 = v8;
    uint64_t v16 = v9;
    id v15 = *(id *)(a1 + 48);
    [v3 localSecretChangedTo:v4 secretType:v5 context:v6 uiProvider:v7 completion:v13];
  }
  else if (*(void *)(a1 + 48))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;

    id v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v12();
  }
}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_40(void *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = a1[4];
  id v7 = _CDPLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_40_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(*(void *)(a1[6] + 8) + 40) uiProviderProxy];
    uint64_t v10 = [*(id *)(*(void *)(a1[6] + 8) + 40) context];
    v14[0] = 67109634;
    v14[1] = a2;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Local Secret Updated after retry: %{BOOL}d. UIProxy: %@. Context: %@", (uint8_t *)v14, 0x1Cu);
  }
  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;

  uint64_t v13 = a1[5];
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v5);
  }
}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_41(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_41_cold_1();
  }

  if (*(void *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v5 = a1[5];
    if (v5) {
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
    }
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
  }
}

- (void)finishOfflineLocalSecretChangeWithCompletion:(id)a3
{
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__3;
  v20[4] = __Block_byref_object_dispose__3;
  uint64_t v5 = self;
  v21 = v5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__CDPStateController_finishOfflineLocalSecretChangeWithCompletion___block_invoke;
  v17[3] = &unk_264317B38;
  uint64_t v19 = v20;
  id v6 = v4;
  id v18 = v6;
  id v7 = (void *)MEMORY[0x21D4671C0](v17);
  id v8 = [(CDPController *)v5 daemonConn];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__CDPStateController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_3;
  void v15[3] = &unk_264317090;
  id v9 = v7;
  id v16 = v9;
  uint64_t v10 = [v8 daemonWithErrorHandler:v15];

  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to finish offline local secret change...", v14, 2u);
  }

  id v12 = [(CDPController *)v5 context];
  uint64_t v13 = [(CDPController *)v5 uiProviderProxy];
  [v10 finishOfflineLocalSecretChangeWithContext:v12 uiProvider:v13 completion:v9];

  _Block_object_dispose(v20, 8);
}

void __67__CDPStateController_finishOfflineLocalSecretChangeWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CDPStateController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_2;
  block[3] = &unk_264317B10;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  long long v11 = v8;
  char v12 = a2;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __67__CDPStateController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __67__CDPStateController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_41_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finishCyrusFlowAfterTermsAgreementWithContext:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__3;
  void v23[4] = __Block_byref_object_dispose__3;
  id v5 = self;
  double v24 = v5;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke;
  v20[3] = &unk_264317B38;
  uint64_t v22 = v23;
  id v6 = v4;
  id v21 = v6;
  id v7 = (void *)MEMORY[0x21D4671C0](v20);
  long long v8 = [(CDPController *)v5 daemonConn];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke_3;
  v18[3] = &unk_264317090;
  id v9 = v7;
  id v19 = v9;
  id v10 = [v8 daemonWithErrorHandler:v18];

  long long v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v12 = [(CDPController *)v5 context];
    uint64_t v13 = [v12 altDSID];
    id v14 = [(CDPController *)v5 context];
    uint64_t v15 = [v14 type];
    *(_DWORD *)long long buf = 138412546;
    id v26 = v13;
    __int16 v27 = 2048;
    uint64_t v28 = v15;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to finish secure terms flow for %@ with type %ld", buf, 0x16u);
  }
  id v16 = [(CDPController *)v5 context];
  __int16 v17 = [(CDPController *)v5 uiProviderProxy];
  [v10 finishCyrusFlowAfterTermsAgreementWithContext:v16 uiProvider:v17 completion:v9];

  _Block_object_dispose(v23, 8);
}

void __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke_2;
  block[3] = &unk_264317B10;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  long long v11 = v8;
  char v12 = a2;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldPerformRepairWithOptionForceFetch:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v7 = _os_activity_create(&dword_2182AE000, "cdp: repair state check", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__3;
  __int16 v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  long long v8 = [(CDPController *)self daemonConn];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  _DWORD v14[2] = __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke;
  v14[3] = &unk_264317260;
  void v14[4] = &v19;
  id v9 = [v8 synchronousDaemonWithErrorHandler:v14];

  id v10 = [(CDPController *)self context];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke_42;
  void v13[3] = &unk_264317580;
  void v13[4] = &v19;
  v13[5] = &v15;
  [v9 shouldPerformRepairForContext:v10 forceFetch:v5 completion:v13];

  if (a4) {
    *a4 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  os_activity_scope_leave(&state);
  return v11;
}

void __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  BOOL v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke_cold_1();
  }
}

void __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke_42(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)shouldPerformRepairWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _os_activity_create(&dword_2182AE000, "cdp/should-perform-repair", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__3;
  v22[4] = __Block_byref_object_dispose__3;
  long long v8 = self;
  __int16 v23 = v8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke;
  v19[3] = &unk_264317B38;
  uint64_t v21 = v22;
  id v9 = v6;
  id v20 = v9;
  id v10 = (void *)MEMORY[0x21D4671C0](v19);
  char v11 = [(CDPController *)v8 daemonConn];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2;
  v17[3] = &unk_264317090;
  id v12 = v10;
  id v18 = v12;
  uint64_t v13 = [v11 daemonWithErrorHandler:v17];

  id v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "Requesting to check if repair should be performed on the CDP state", v16, 2u);
  }

  uint64_t v15 = [(CDPController *)v8 context];
  [v13 shouldPerformRepairForContext:v15 forceFetch:v4 completion:v12];

  _Block_object_dispose(v22, 8);
  os_activity_scope_leave(&state);
}

void __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldPerformAuthenticatedRepairWithOptionForceFetch:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v7 = _os_activity_create(&dword_2182AE000, "cdp: authenticated repair state check", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__3;
  __int16 v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v8 = [(CDPController *)self daemonConn];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  _DWORD v14[2] = __81__CDPStateController_shouldPerformAuthenticatedRepairWithOptionForceFetch_error___block_invoke;
  v14[3] = &unk_264317260;
  void v14[4] = &v19;
  id v9 = [v8 synchronousDaemonWithErrorHandler:v14];

  id v10 = [(CDPController *)self context];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__CDPStateController_shouldPerformAuthenticatedRepairWithOptionForceFetch_error___block_invoke_43;
  void v13[3] = &unk_264317580;
  void v13[4] = &v19;
  v13[5] = &v15;
  [v9 shouldPerformAuthenticatedRepairForContext:v10 forceFetch:v5 completion:v13];

  if (a4) {
    *a4 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  os_activity_scope_leave(&state);
  return v11;
}

void __81__CDPStateController_shouldPerformAuthenticatedRepairWithOptionForceFetch_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  BOOL v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __81__CDPStateController_shouldPerformAuthenticatedRepairWithOptionForceFetch_error___block_invoke_cold_1();
  }
}

void __81__CDPStateController_shouldPerformAuthenticatedRepairWithOptionForceFetch_error___block_invoke_43(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)generateEscrowRecordReportUsingCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_2182AE000, "cdp/generate-escrow-record-report", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = _CDPSignpostLogSystem();
  os_signpost_id_t v9 = _CDPSignpostCreate(v8);
  uint64_t v11 = v10;

  id v12 = _CDPSignpostLogSystem();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v30) = v4;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "GenerateEscrowRecordReport", " enableTelemetry=YES  UseCache=%{public,signpost.telemetry:number2,name=UseCache}d ", buf, 8u);
  }

  id v14 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    os_signpost_id_t v30 = v9;
    __int16 v31 = 1026;
    BOOL v32 = v4;
    _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GenerateEscrowRecordReport  enableTelemetry=YES  UseCache=%{public,signpost.telemetry:number2,name=UseCache}d ", buf, 0x12u);
  }

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __70__CDPStateController_generateEscrowRecordReportUsingCache_completion___block_invoke;
  v24[3] = &unk_264317C00;
  void v24[4] = self;
  os_signpost_id_t v26 = v9;
  uint64_t v27 = v11;
  id v15 = v6;
  id v25 = v15;
  id v16 = (void *)MEMORY[0x21D4671C0](v24);
  uint64_t v17 = [(CDPController *)self daemonConn];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__CDPStateController_generateEscrowRecordReportUsingCache_completion___block_invoke_45;
  v22[3] = &unk_264317090;
  id v18 = v16;
  id v23 = v18;
  uint64_t v19 = [v17 synchronousDaemonWithErrorHandler:v22];

  id v20 = _CDPLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v30) = v4;
    _os_log_impl(&dword_2182AE000, v20, OS_LOG_TYPE_DEFAULT, "Generating escrow record report (usingCache: %{BOOL}d)", buf, 8u);
  }

  uint64_t v21 = [(CDPController *)self context];
  [v19 generateEscrowRecordStatusReportForContext:v21 usingCache:v4 withCompletion:v18];

  os_activity_scope_leave(&state);
}

void __70__CDPStateController_generateEscrowRecordReportUsingCache_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  id v8 = _CDPSignpostLogSystem();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v9, OS_SIGNPOST_INTERVAL_END, v10, "GenerateEscrowRecordReport", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  uint64_t v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    int v14 = [v6 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v14;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GenerateEscrowRecordReport  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  if (v6)
  {
    id v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __70__CDPStateController_generateEscrowRecordReportUsingCache_completion___block_invoke_cold_1();
    }
  }
  uint64_t v16 = a1[5];
  if (v16) {
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }
}

uint64_t __70__CDPStateController_generateEscrowRecordReportUsingCache_completion___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:(id)a3
{
  id v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__3;
  v21[4] = __Block_byref_object_dispose__3;
  id v5 = self;
  int v22 = v5;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke;
  v18[3] = &unk_264317B38;
  double v20 = v21;
  id v6 = v4;
  id v19 = v6;
  uint64_t v7 = (void *)MEMORY[0x21D4671C0](v18);
  id v8 = _os_activity_create(&dword_2182AE000, "cdp/authenticate-and-generate-rk", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = [(CDPController *)v5 daemonConn];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_47;
  void v15[3] = &unk_264317090;
  id v10 = v7;
  id v16 = v10;
  uint64_t v11 = [v9 daemonWithErrorHandler:v15];

  double v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CDPStateController authenticateAndGenerateNewRecoveryKeyWithCompletion:]();
  }

  uint64_t v13 = [(CDPController *)v5 context];
  int v14 = [(CDPController *)v5 uiProviderProxy];
  [v11 authenticateAndGenerateNewRecoveryKeyWithContext:v13 uiProvider:v14 completion:v10];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v21, 8);
}

void __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_2;
  block[3] = &unk_264317B10;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  long long v11 = v8;
  char v12 = a2;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_2_cold_1(a1);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

void __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_47(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_47_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateNewRecoveryKey:(id)a3
{
  id v4 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__3;
  v27[4] = __Block_byref_object_dispose__3;
  id v5 = self;
  uint64_t v28 = v5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__3;
  void v25[4] = __Block_byref_object_dispose__3;
  id v26 = (id)objc_opt_new();
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __45__CDPStateController_generateNewRecoveryKey___block_invoke;
  v21[3] = &unk_264317C28;
  uint64_t v23 = v25;
  id v24 = v27;
  id v6 = v4;
  id v22 = v6;
  id v7 = (void *)MEMORY[0x21D4671C0](v21);
  long long v8 = _os_activity_create(&dword_2182AE000, "cdp/generate-rk", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = [(CDPController *)v5 daemonConn];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  int v17 = __45__CDPStateController_generateNewRecoveryKey___block_invoke_3;
  uint64_t v18 = &unk_264317090;
  id v10 = v7;
  id v19 = v10;
  long long v11 = [v9 daemonWithErrorHandler:&v15];

  char v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CDPStateController generateNewRecoveryKey:]();
  }

  uint64_t v13 = [(CDPController *)v5 context];
  int v14 = [(CDPController *)v5 uiProviderProxy];
  [v11 generateNewRecoveryKeyWithContext:v13 uiProvider:v14 completion:v10];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
}

void __45__CDPStateController_generateNewRecoveryKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) reportRecoveryKeyTaskFinishedWithSuccess:a2 error:v5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __45__CDPStateController_generateNewRecoveryKey___block_invoke_2;
  v8[3] = &unk_264317B10;
  uint64_t v11 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  char v12 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __45__CDPStateController_generateNewRecoveryKey___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __45__CDPStateController_generateNewRecoveryKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CDPStateController_generateNewRecoveryKey___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)authenticateAndDeleteRecoveryKeyWithCompletion:(id)a3
{
  id v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__3;
  void v21[4] = __Block_byref_object_dispose__3;
  id v5 = self;
  id v22 = v5;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke;
  v18[3] = &unk_264317B38;
  double v20 = v21;
  id v6 = v4;
  id v19 = v6;
  id v7 = (void *)MEMORY[0x21D4671C0](v18);
  long long v8 = _os_activity_create(&dword_2182AE000, "cdp/authenticate-and-delete-rk", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = [(CDPController *)v5 daemonConn];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_49;
  void v15[3] = &unk_264317090;
  id v10 = v7;
  id v16 = v10;
  uint64_t v11 = [v9 daemonWithErrorHandler:v15];

  char v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CDPStateController authenticateAndDeleteRecoveryKeyWithCompletion:]();
  }

  uint64_t v13 = [(CDPController *)v5 context];
  int v14 = [(CDPController *)v5 uiProviderProxy];
  [v11 authenticateAndDeleteRecoveryKeyWithContext:v13 uiProvider:v14 completion:v10];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v21, 8);
}

void __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_2;
  block[3] = &unk_264317B10;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  long long v11 = v8;
  char v12 = a2;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_2_cold_1(a1);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

void __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_49_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteRecoveryKey:(id)a3
{
  id v4 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__3;
  v27[4] = __Block_byref_object_dispose__3;
  id v5 = self;
  uint64_t v28 = v5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__3;
  void v25[4] = __Block_byref_object_dispose__3;
  id v26 = (id)objc_opt_new();
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __40__CDPStateController_deleteRecoveryKey___block_invoke;
  v21[3] = &unk_264317C28;
  uint64_t v23 = v25;
  id v24 = v27;
  id v6 = v4;
  id v22 = v6;
  id v7 = (void *)MEMORY[0x21D4671C0](v21);
  long long v8 = _os_activity_create(&dword_2182AE000, "cdp/delete-rk", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = [(CDPController *)v5 daemonConn];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  int v17 = __40__CDPStateController_deleteRecoveryKey___block_invoke_3;
  uint64_t v18 = &unk_264317090;
  id v10 = v7;
  id v19 = v10;
  long long v11 = [v9 daemonWithErrorHandler:&v15];

  char v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CDPStateController deleteRecoveryKey:]();
  }

  uint64_t v13 = [(CDPController *)v5 context];
  int v14 = [(CDPController *)v5 uiProviderProxy];
  [v11 deleteRecoveryKeyWithContext:v13 uiProvider:v14 completion:v10];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
}

void __40__CDPStateController_deleteRecoveryKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) reportRecoveryKeyTaskFinishedWithSuccess:a2 error:v5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __40__CDPStateController_deleteRecoveryKey___block_invoke_2;
  v8[3] = &unk_264317B10;
  uint64_t v11 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  char v12 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __40__CDPStateController_deleteRecoveryKey___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __40__CDPStateController_deleteRecoveryKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __40__CDPStateController_deleteRecoveryKey___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifyRecoveryKey:(id)a3
{
  id v4 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__3;
  v27[4] = __Block_byref_object_dispose__3;
  id v5 = self;
  uint64_t v28 = v5;
  id v6 = objc_opt_new();
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __40__CDPStateController_verifyRecoveryKey___block_invoke;
  v23[3] = &unk_264317B60;
  id v7 = v6;
  id v24 = v7;
  id v26 = v27;
  id v8 = v4;
  id v25 = v8;
  id v9 = (void *)MEMORY[0x21D4671C0](v23);
  id v10 = _os_activity_create(&dword_2182AE000, "cdp/verify-rk", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  uint64_t v11 = [(CDPController *)v5 daemonConn];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __40__CDPStateController_verifyRecoveryKey___block_invoke_3;
  double v20 = &unk_264317090;
  id v12 = v9;
  id v21 = v12;
  uint64_t v13 = [v11 daemonWithErrorHandler:&v17];

  int v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[CDPStateController verifyRecoveryKey:]();
  }

  uint64_t v15 = [(CDPController *)v5 context];
  uint64_t v16 = [(CDPController *)v5 uiProviderProxy];
  [v13 verifyRecoveryKeyWithContext:v15 uiProvider:v16 completion:v12];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v27, 8);
}

void __40__CDPStateController_verifyRecoveryKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) reportRecoveryKeyTaskFinishedWithSuccess:a2 error:v5];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CDPStateController_verifyRecoveryKey___block_invoke_2;
  block[3] = &unk_264317B10;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v8;
  long long v11 = v8;
  char v12 = a2;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __40__CDPStateController_verifyRecoveryKey___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __40__CDPStateController_verifyRecoveryKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __40__CDPStateController_verifyRecoveryKey___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)deleteRecoveryKeyWithError:(id *)a3
{
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = __Block_byref_object_copy__3;
  id v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  id v5 = [(CDPController *)self daemonConn];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__CDPStateController_deleteRecoveryKeyWithError___block_invoke;
  v16[3] = &unk_264317260;
  void v16[4] = &v17;
  id v6 = [v5 synchronousDaemonWithErrorHandler:v16];

  id v7 = _os_activity_create(&dword_2182AE000, "cdp/delete-rk", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  long long v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPStateController deleteRecoveryKey:]();
  }

  id v9 = [(CDPController *)self context];
  id v10 = [(CDPController *)self uiProviderProxy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  _DWORD v14[2] = __49__CDPStateController_deleteRecoveryKeyWithError___block_invoke_52;
  v14[3] = &unk_264317580;
  void v14[4] = &v23;
  void v14[5] = &v17;
  [v6 deleteRecoveryKeyWithContext:v9 uiProvider:v10 completion:v14];

  int v11 = *((unsigned __int8 *)v24 + 24);
  if (a3 && !*((unsigned char *)v24 + 24))
  {
    *a3 = (id) v18[5];
    int v11 = *((unsigned __int8 *)v24 + 24);
  }
  BOOL v12 = v11 != 0;
  os_activity_scope_leave(&state);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v12;
}

void __49__CDPStateController_deleteRecoveryKeyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __40__CDPStateController_deleteRecoveryKey___block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __49__CDPStateController_deleteRecoveryKeyWithError___block_invoke_52(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)isRecoveryKeyAvailableWithError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  double v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  id v4 = [(CDPController *)self daemonConn];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__CDPStateController_isRecoveryKeyAvailableWithError___block_invoke;
  void v15[3] = &unk_264317260;
  void v15[4] = &v16;
  uint64_t v5 = [v4 synchronousDaemonWithErrorHandler:v15];

  id v6 = _os_activity_create(&dword_2182AE000, "cdp/rk-availability", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPStateController isRecoveryKeyAvailableWithError:]();
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__CDPStateController_isRecoveryKeyAvailableWithError___block_invoke_53;
  void v13[3] = &unk_264317580;
  void v13[4] = &v22;
  v13[5] = &v16;
  [v5 isRecoveryKeyAvailableWithCompletion:v13];
  long long v8 = (void *)v17[5];
  if (v8)
  {
    if (a3) {
      *a3 = v8;
    }
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CDPStateController isRecoveryKeyAvailableWithError:]();
    }
  }
  else
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *((unsigned __int8 *)v23 + 24);
      *(_DWORD *)long long buf = 67109120;
      int v27 = v10;
      _os_log_impl(&dword_2182AE000, v9, OS_LOG_TYPE_DEFAULT, "Recovery key availability - %{BOOL}d", buf, 8u);
    }
  }

  BOOL v11 = *((unsigned char *)v23 + 24) != 0;
  os_activity_scope_leave(&state);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v11;
}

void __54__CDPStateController_isRecoveryKeyAvailableWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__CDPStateController_isRecoveryKeyAvailableWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __54__CDPStateController_isRecoveryKeyAvailableWithError___block_invoke_53(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)isRecoveryKeyAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__3;
  void v18[4] = __Block_byref_object_dispose__3;
  uint64_t v19 = self;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke;
  void v15[3] = &unk_264317B38;
  uint64_t v17 = v18;
  id v5 = v4;
  id v16 = v5;
  id v6 = (void *)MEMORY[0x21D4671C0](v15);
  id v7 = _os_activity_create(&dword_2182AE000, "cdp/rk-availability", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  long long v8 = objc_alloc_init(CDPDaemonConnection);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_2;
  v12[3] = &unk_264317090;
  id v9 = v5;
  id v13 = v9;
  int v10 = [(CDPDaemonConnection *)v8 daemonWithErrorHandler:v12];
  BOOL v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CDPStateController isRecoveryKeyAvailableWithError:]();
  }

  [v10 isRecoveryKeyAvailableWithCompletion:v6];
  os_activity_scope_leave(&state);

  _Block_object_dispose(v18, 8);
}

void __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v16 = a2;
    _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "Recovery key availability - %{BOOL}d", buf, 8u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_54;
  block[3] = &unk_264317B10;
  long long v10 = *(_OWORD *)(a1 + 32);
  id v8 = (id)v10;
  long long v13 = v10;
  char v14 = a2;
  id v12 = v5;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_54(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isWalrusRecoveryKeyAvailableWithError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  double v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  id v4 = [(CDPController *)self daemonConn];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__CDPStateController_isWalrusRecoveryKeyAvailableWithError___block_invoke;
  void v15[3] = &unk_264317260;
  void v15[4] = &v16;
  id v5 = [v4 synchronousDaemonWithErrorHandler:v15];

  id v6 = _os_activity_create(&dword_2182AE000, "cdp/walrus-rk-availability", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPStateController isWalrusRecoveryKeyAvailableWithError:]();
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__CDPStateController_isWalrusRecoveryKeyAvailableWithError___block_invoke_56;
  void v13[3] = &unk_264317580;
  void v13[4] = &v22;
  v13[5] = &v16;
  [v5 isWalrusRecoveryKeyAvailableWithCompletion:v13];
  id v8 = (void *)v17[5];
  if (v8)
  {
    if (a3) {
      *a3 = v8;
    }
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CDPStateController isWalrusRecoveryKeyAvailableWithError:]();
    }
  }
  else
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *((unsigned __int8 *)v23 + 24);
      *(_DWORD *)long long buf = 67109120;
      int v27 = v10;
      _os_log_impl(&dword_2182AE000, v9, OS_LOG_TYPE_DEFAULT, "Walrus Recovery key availability - %{BOOL}d", buf, 8u);
    }
  }

  BOOL v11 = *((unsigned char *)v23 + 24) != 0;
  os_activity_scope_leave(&state);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v11;
}

void __60__CDPStateController_isWalrusRecoveryKeyAvailableWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__CDPStateController_isWalrusRecoveryKeyAvailableWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __60__CDPStateController_isWalrusRecoveryKeyAvailableWithError___block_invoke_56(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)isWalrusRecoveryKeyAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__3;
  void v18[4] = __Block_byref_object_dispose__3;
  uint64_t v19 = self;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke;
  void v15[3] = &unk_264317B38;
  uint64_t v17 = v18;
  id v5 = v4;
  id v16 = v5;
  id v6 = (void *)MEMORY[0x21D4671C0](v15);
  id v7 = _os_activity_create(&dword_2182AE000, "cdp/walrus-rk-availability", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = objc_alloc_init(CDPDaemonConnection);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_2;
  v12[3] = &unk_264317090;
  id v9 = v5;
  id v13 = v9;
  int v10 = [(CDPDaemonConnection *)v8 daemonWithErrorHandler:v12];
  BOOL v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CDPStateController isWalrusRecoveryKeyAvailableWithError:]();
  }

  [v10 isWalrusRecoveryKeyAvailableWithCompletion:v6];
  os_activity_scope_leave(&state);

  _Block_object_dispose(v18, 8);
}

void __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v16 = a2;
    _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "Walrus Recovery key availability - %{BOOL}d", buf, 8u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_57;
  block[3] = &unk_264317B10;
  long long v10 = *(_OWORD *)(a1 + 32);
  id v8 = (id)v10;
  long long v13 = v10;
  char v14 = a2;
  id v12 = v5;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_57(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError:(id *)a3
{
  id v5 = _os_activity_create(&dword_2182AE000, "cdp/verify-rk-observing-systems-have-matching-state", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__3;
  uint64_t v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v6 = [(CDPController *)self daemonConn];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  _DWORD v14[2] = __82__CDPStateController_verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError___block_invoke;
  v14[3] = &unk_264317260;
  void v14[4] = &v19;
  id v7 = [v6 synchronousDaemonWithErrorHandler:v14];

  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Verifying all systems agree on RK state", buf, 2u);
  }

  id v9 = [(CDPController *)self context];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__CDPStateController_verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError___block_invoke_58;
  v12[3] = &unk_264317580;
  void v12[4] = &v19;
  v12[5] = &v15;
  [v7 verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:v9 completion:v12];

  if (a3) {
    *a3 = (id) v20[5];
  }
  char v10 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  os_activity_scope_leave(&state);
  return v10;
}

void __82__CDPStateController_verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke_cold_1();
  }
}

void __82__CDPStateController_verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError___block_invoke_58(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)generateRandomRecoveryKey:(id *)a3
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__3;
  id v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  char v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  id v5 = [(CDPController *)self daemonConn];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__CDPStateController_generateRandomRecoveryKey___block_invoke;
  void v13[3] = &unk_264317260;
  void v13[4] = &v14;
  id v6 = [v5 synchronousDaemonWithErrorHandler:v13];

  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPStateController generateNewRecoveryKey:]();
  }

  id v8 = [(CDPController *)self context];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__CDPStateController_generateRandomRecoveryKey___block_invoke_59;
  v12[3] = &unk_264317C50;
  void v12[4] = &v20;
  v12[5] = &v14;
  [v6 generateRandomRecoveryKeyWithContext:v8 completion:v12];

  id v9 = (void *)v21[5];
  if (a3 && !v9)
  {
    *a3 = (id) v15[5];
    id v9 = (void *)v21[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __48__CDPStateController_generateRandomRecoveryKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CDPStateController_generateNewRecoveryKey___block_invoke_3_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __48__CDPStateController_generateRandomRecoveryKey___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)handleURLActionWithInfo:(id)a3
{
}

- (void)handleURLActionWithInfo:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Handling URL action: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [v6 objectForKeyedSubscript:@"command"];
  if ([v9 isEqualToString:@"rejoin"])
  {
    [(CDPStateController *)self repairCloudDataProtectionStateWithCompletion:v7];
  }
  else if ([v9 isEqualToString:@"offline-secret-change"])
  {
    [(CDPStateController *)self finishOfflineLocalSecretChangeWithCompletion:v7];
  }
  else if ([v9 isEqualToString:@"regenerate"])
  {
    [(CDPStateController *)self generateNewRecoveryKey:v7];
  }
}

- (void)fetchEscrowRecordDevicesWithContext:(id)a3 usingCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int v10 = _os_activity_create(&dword_2182AE000, "cdp/fetch-escrow-devices", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__3;
  void v24[4] = __Block_byref_object_dispose__3;
  id v11 = self;
  id v25 = v11;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __80__CDPStateController_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke;
  v21[3] = &unk_264317C78;
  uint64_t v23 = v24;
  id v12 = v9;
  id v22 = v12;
  long long v13 = (void *)MEMORY[0x21D4671C0](v21);
  uint64_t v14 = [(CDPController *)v11 daemonConn];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __80__CDPStateController_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke_3;
  v19[3] = &unk_264317090;
  id v15 = v13;
  id v20 = v15;
  uint64_t v16 = [v14 daemonWithErrorHandler:v19];

  uint64_t v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v18 = 0;
    _os_log_impl(&dword_2182AE000, v17, OS_LOG_TYPE_DEFAULT, "Requesting list of escrow-record associated devices", v18, 2u);
  }

  [v16 fetchEscrowRecordDevicesWithContext:v8 usingCache:v6 completion:v15];
  _Block_object_dispose(v24, 8);

  os_activity_scope_leave(&state);
}

void __80__CDPStateController_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__CDPStateController_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke_2;
  block[3] = &unk_264317380;
  id v9 = *(id *)(a1 + 32);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __80__CDPStateController_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

void __80__CDPStateController_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deviceEscrowRecordRecoverableWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_2182AE000, "cdp/device-escrow-record-recoverable", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__3;
  void v22[4] = __Block_byref_object_dispose__3;
  id v9 = self;
  uint64_t v23 = v9;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__CDPStateController_deviceEscrowRecordRecoverableWithContext_completion___block_invoke;
  v19[3] = &unk_264317CC8;
  uint64_t v21 = v22;
  id v10 = v7;
  id v20 = v10;
  id v11 = (void *)MEMORY[0x21D4671C0](v19);
  id v12 = [(CDPController *)v9 daemonConn];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__CDPStateController_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_3;
  v17[3] = &unk_264317090;
  id v13 = v11;
  id v18 = v13;
  id v14 = [v12 daemonWithErrorHandler:v17];

  id v15 = _CDPLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_2182AE000, v15, OS_LOG_TYPE_DEFAULT, "Checking for the current device's ecrow record being recoverable", v16, 2u);
  }

  [v14 deviceEscrowRecordRecoverableWithContext:v6 completion:v13];
  _Block_object_dispose(v22, 8);

  os_activity_scope_leave(&state);
}

void __74__CDPStateController_deviceEscrowRecordRecoverableWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __74__CDPStateController_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_2;
  v8[3] = &unk_264317CA0;
  id v6 = *(id *)(a1 + 32);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __74__CDPStateController_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __74__CDPStateController_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isDeviceEscrowRecordRecoverable:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = _os_activity_create(&dword_2182AE000, "cdp/synchronous-device-escrow-record-recoverable", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__CDPStateController_isDeviceEscrowRecordRecoverable___block_invoke;
  v12[3] = &unk_264317CF0;
  void v12[4] = self;
  v12[5] = &v13;
  void v12[6] = a3;
  id v6 = (void *)MEMORY[0x21D4671C0](v12);
  id v7 = [(CDPController *)self daemonConn];
  id v8 = [v7 synchronousDaemonWithErrorHandler:v6];

  id v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = self;
    _os_log_impl(&dword_2182AE000, v9, OS_LOG_TYPE_DEFAULT, "%@: Checking current device's escrow record recoverability", buf, 0xCu);
  }

  id v10 = [(CDPController *)self context];
  [v8 deviceEscrowRecordRecoverableWithContext:v10 completion:v6];

  LOBYTE(v10) = *((unsigned char *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);
  os_activity_scope_leave(&state);

  return (char)v10;
}

void __54__CDPStateController_isDeviceEscrowRecordRecoverable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__CDPStateController_isDeviceEscrowRecordRecoverable___block_invoke_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 == 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) && *(void *)(a1 + 48)) {
    **(void **)(a1 + 48) = v3;
  }
}

- (BOOL)shouldPerformSilentEscrowRecordRepairUsingCache:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = _os_activity_create(&dword_2182AE000, "cdp/should-perform-silent-escrow-record-repair-sync", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = _CDPSignpostLogSystem();
  os_signpost_id_t v9 = _CDPSignpostCreate(v8);
  uint64_t v11 = v10;

  id v12 = _CDPSignpostLogSystem();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ShouldPerformSilentEscrowRecordRepairSync", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  id v14 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ShouldPerformSilentEscrowRecordRepairSync  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v29 = 0;
  os_signpost_id_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__3;
  uint64_t v39 = __Block_byref_object_dispose__3;
  id v40 = 0;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke;
  v28[3] = &unk_264317D18;
  v28[7] = v9;
  v28[8] = v11;
  void v28[4] = self;
  v28[5] = &buf;
  v28[6] = &v29;
  uint64_t v15 = (void *)MEMORY[0x21D4671C0](v28);
  char v16 = [(CDPController *)self daemonConn];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  id v25 = __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke_74;
  char v26 = &unk_264317090;
  id v17 = v15;
  id v27 = v17;
  id v18 = [v16 synchronousDaemonWithErrorHandler:&v23];

  id v19 = _CDPLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v34 = 67109120;
    BOOL v35 = v5;
    _os_log_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEFAULT, "Synchronously checking if silent escrow record repair should be performed (usingCache: %{BOOL}d)", v34, 8u);
  }

  uint64_t v20 = [(CDPController *)self context];
  [v18 shouldPerformSilentEscrowRecordRepairWithContext:v20 usingCache:v5 completion:v17];

  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }
  BOOL v21 = *((unsigned char *)v30 + 24) != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v29, 8);
  os_activity_scope_leave(&state);

  return v21;
}

void __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[7], a1[8]);
  id v7 = _CDPSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[7];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = [*(id *)(*(void *)(a1[5] + 8) + 40) code];
    int v19 = 67240192;
    LODWORD(v20) = v10;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v8, OS_SIGNPOST_INTERVAL_END, v9, "ShouldPerformSilentEscrowRecordRepairSync", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[7];
    int v14 = [*(id *)(*(void *)(a1[5] + 8) + 40) code];
    int v19 = 134218496;
    uint64_t v20 = v13;
    __int16 v21 = 2048;
    double v22 = v12;
    __int16 v23 = 1026;
    int v24 = v14;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: ShouldPerformSilentEscrowRecordRepairSync  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  uint64_t v15 = _CDPLogSystem();
  char v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 67109120;
    LODWORD(v20) = a2;
    _os_log_impl(&dword_2182AE000, v16, OS_LOG_TYPE_DEFAULT, "Escrow record repair is needed: %{BOOL}d", (uint8_t *)&v19, 8u);
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
  uint64_t v17 = *(void *)(a1[5] + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v5;
}

uint64_t __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke_74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)shouldPerformSilentEscrowRecordRepairUsingCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _os_activity_create(&dword_2182AE000, "cdp/should-perform-silent-escrow-record-repair-async", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = _CDPSignpostLogSystem();
  os_signpost_id_t v9 = _CDPSignpostCreate(v8);
  uint64_t v11 = v10;

  double v12 = _CDPSignpostLogSystem();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ShouldPerformSilentEscrowRecordRepairAsync", " enableTelemetry=YES ", buf, 2u);
  }

  int v14 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v30 = v9;
    _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ShouldPerformSilentEscrowRecordRepairAsync  enableTelemetry=YES ", buf, 0xCu);
  }

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __81__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke;
  v24[3] = &unk_264317D40;
  void v24[4] = self;
  os_signpost_id_t v26 = v9;
  uint64_t v27 = v11;
  id v15 = v6;
  id v25 = v15;
  char v16 = (void *)MEMORY[0x21D4671C0](v24);
  uint64_t v17 = [(CDPController *)self daemonConn];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __81__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke_75;
  v22[3] = &unk_264317090;
  id v18 = v16;
  id v23 = v18;
  int v19 = [v17 daemonWithErrorHandler:v22];

  uint64_t v20 = _CDPLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v30) = v4;
    _os_log_impl(&dword_2182AE000, v20, OS_LOG_TYPE_DEFAULT, "Checking if silent escrow record repair should be performed (usingCache: %{BOOL}d)", buf, 8u);
  }

  __int16 v21 = [(CDPController *)self context];
  [v19 shouldPerformSilentEscrowRecordRepairWithContext:v21 usingCache:v4 completion:v18];

  os_activity_scope_leave(&state);
}

void __81__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _CDPSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v8, OS_SIGNPOST_INTERVAL_END, v9, "ShouldPerformSilentEscrowRecordRepairAsync", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  uint64_t v10 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[6];
    int v13 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: ShouldPerformSilentEscrowRecordRepairAsync  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  int v14 = _CDPLogSystem();
  id v15 = v14;
  if (v5)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109120;
    LODWORD(v18) = a2;
    _os_log_impl(&dword_2182AE000, v15, OS_LOG_TYPE_DEFAULT, "Should perform silent escrow record repair: %{BOOL}d", (uint8_t *)&v17, 8u);
  }

  uint64_t v16 = a1[5];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __81__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke_75(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startSilentEscrowRecordRepairWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2182AE000, "cdp/start-silent-escrow-record-repair", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _CDPSignpostLogSystem();
  os_signpost_id_t v7 = _CDPSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _CDPSignpostLogSystem();
  double v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "StartSilentEscrowRecordRepair", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v12 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v28 = v7;
    _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StartSilentEscrowRecordRepair  enableTelemetry=YES ", buf, 0xCu);
  }

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __66__CDPStateController_startSilentEscrowRecordRepairWithCompletion___block_invoke;
  v22[3] = &unk_264317D40;
  void v22[4] = self;
  os_signpost_id_t v24 = v7;
  uint64_t v25 = v9;
  id v13 = v4;
  id v23 = v13;
  int v14 = (void *)MEMORY[0x21D4671C0](v22);
  id v15 = [(CDPController *)self daemonConn];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __66__CDPStateController_startSilentEscrowRecordRepairWithCompletion___block_invoke_76;
  v20[3] = &unk_264317090;
  id v16 = v14;
  id v21 = v16;
  int v17 = [v15 daemonWithErrorHandler:v20];

  uint64_t v18 = _CDPLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2182AE000, v18, OS_LOG_TYPE_DEFAULT, "Requesting start of silent escrow record repair...", buf, 2u);
  }

  __int16 v19 = [(CDPController *)self context];
  [v17 startSilentEscrowRecordRepairWithContext:v19 completion:v16];

  os_activity_scope_leave(&state);
}

void __66__CDPStateController_startSilentEscrowRecordRepairWithCompletion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v7 = _CDPSignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v8, OS_SIGNPOST_INTERVAL_END, v9, "StartSilentEscrowRecordRepair", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  uint64_t v10 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[6];
    int v13 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StartSilentEscrowRecordRepair  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  int v14 = _CDPLogSystem();
  id v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_2182AE000, v15, OS_LOG_TYPE_DEFAULT, "Successfully started silent escrow record repair", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __66__CDPStateController_startSilentEscrowRecordRepairWithCompletion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[5];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __66__CDPStateController_startSilentEscrowRecordRepairWithCompletion___block_invoke_76(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performSilentEscrowRecordRepairWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2182AE000, "cdp/perform-silent-escrow-record-repair", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _CDPSignpostLogSystem();
  os_signpost_id_t v7 = _CDPSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _CDPSignpostLogSystem();
  double v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PerformSilentEscrowRecordRepair", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v12 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v28 = v7;
    _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformSilentEscrowRecordRepair  enableTelemetry=YES ", buf, 0xCu);
  }

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __68__CDPStateController_performSilentEscrowRecordRepairWithCompletion___block_invoke;
  v22[3] = &unk_264317D40;
  void v22[4] = self;
  os_signpost_id_t v24 = v7;
  uint64_t v25 = v9;
  id v13 = v4;
  id v23 = v13;
  int v14 = (void *)MEMORY[0x21D4671C0](v22);
  id v15 = [(CDPController *)self daemonConn];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __68__CDPStateController_performSilentEscrowRecordRepairWithCompletion___block_invoke_77;
  v20[3] = &unk_264317090;
  id v16 = v14;
  id v21 = v16;
  int v17 = [v15 daemonWithErrorHandler:v20];

  uint64_t v18 = _CDPLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2182AE000, v18, OS_LOG_TYPE_DEFAULT, "Performing silent escrow record repair...", buf, 2u);
  }

  __int16 v19 = [(CDPController *)self context];
  [v17 performSilentEscrowRecordRepairWithContext:v19 completion:v16];

  os_activity_scope_leave(&state);
}

void __68__CDPStateController_performSilentEscrowRecordRepairWithCompletion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v7 = _CDPSignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PerformSilentEscrowRecordRepair", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  uint64_t v10 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[6];
    int v13 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformSilentEscrowRecordRepair  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  int v14 = _CDPLogSystem();
  id v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_2182AE000, v15, OS_LOG_TYPE_DEFAULT, "Successfully performed silent escrow record repair", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __68__CDPStateController_performSilentEscrowRecordRepairWithCompletion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[5];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __68__CDPStateController_performSilentEscrowRecordRepairWithCompletion___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)updateLastSilentEscrowRecordRepairAttemptDate:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_signpost_id_t v7 = _os_activity_create(&dword_2182AE000, "cdp/update-last-silent-escrow-record-repair-attempt-date", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__3;
  os_signpost_id_t v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __74__CDPStateController_updateLastSilentEscrowRecordRepairAttemptDate_error___block_invoke;
  v20[3] = &unk_264317D68;
  void v20[4] = self;
  id v8 = v6;
  id v21 = v8;
  int v22 = &v30;
  uint64_t v23 = &v24;
  os_signpost_id_t v9 = (void *)MEMORY[0x21D4671C0](v20);
  uint64_t v10 = [(CDPController *)self daemonConn];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__CDPStateController_updateLastSilentEscrowRecordRepairAttemptDate_error___block_invoke_78;
  v18[3] = &unk_264317090;
  id v11 = v9;
  id v19 = v11;
  uint64_t v12 = [v10 synchronousDaemonWithErrorHandler:v18];

  int v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v36 = v8;
    _os_log_impl(&dword_2182AE000, v13, OS_LOG_TYPE_DEFAULT, "Requesting update of silent escrow record repair attempt date to %@...", buf, 0xCu);
  }

  int v14 = [(CDPController *)self context];
  [v12 updateLastSilentEscrowRecordRepairAttemptDate:v8 context:v14 completion:v11];

  int v15 = *((unsigned __int8 *)v31 + 24);
  if (a4 && !*((unsigned char *)v31 + 24))
  {
    *a4 = (id) v25[5];
    int v15 = *((unsigned __int8 *)v31 + 24);
  }
  BOOL v16 = v15 != 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  os_activity_scope_leave(&state);

  return v16;
}

void __74__CDPStateController_updateLastSilentEscrowRecordRepairAttemptDate_error___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  os_signpost_id_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      int v11 = 138412290;
      uint64_t v12 = v8;
      _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "Successfully updated last silent escrow record repair attempt date to %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __74__CDPStateController_updateLastSilentEscrowRecordRepairAttemptDate_error___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
  uint64_t v9 = *(void *)(a1[7] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

uint64_t __74__CDPStateController_updateLastSilentEscrowRecordRepairAttemptDate_error___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setKeyChainSyncCompatibilityState:(unint64_t)a3 withAltDSID:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  os_signpost_id_t v7 = _os_activity_create(&dword_2182AE000, "cdp/sos-compatibility-state-updated", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v22.opaque[0] = 0;
  v22.opaque[1] = 0;
  os_activity_scope_enter(v7, &v22);
  uint64_t v8 = _CDPSignpostLogSystem();
  os_signpost_id_t v9 = _CDPSignpostCreate(v8);
  uint64_t v11 = v10;

  uint64_t v12 = _CDPSignpostLogSystem();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SetKeyChainSyncCompatibilityState", " enableTelemetry=YES ", buf, 2u);
  }

  int v14 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v24 = v9;
    _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetKeyChainSyncCompatibilityState  enableTelemetry=YES ", buf, 0xCu);
  }

  int v15 = [(CDPController *)self daemonConn];
  BOOL v16 = [v15 daemonWithErrorHandler:&__block_literal_global_80];

  int v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2182AE000, v17, OS_LOG_TYPE_DEFAULT, "Requesting setKeyChainSyncCompatibilityState", buf, 2u);
  }

  [v16 setKeyChainSyncCompatibilityState:a3 withAltDSID:v6];
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v9, v11);
  id v19 = _CDPSignpostLogSystem();
  double v20 = v19;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v24) = a3;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v20, OS_SIGNPOST_INTERVAL_END, v9, "SetKeyChainSyncCompatibilityState", " sosCompatibilityType=%{public,signpost.telemetry:number1,name=sosCompatibilityType}d ", buf, 8u);
  }

  id v21 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218496;
    os_signpost_id_t v24 = v9;
    __int16 v25 = 2048;
    double v26 = (double)Nanoseconds / 1000000000.0;
    __int16 v27 = 1026;
    int v28 = a3;
    _os_log_impl(&dword_2182AE000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetKeyChainSyncCompatibilityState  sosCompatibilityType=%{public,signpost.telemetry:number1,name=sosCompatibilityType}d ", buf, 0x1Cu);
  }

  os_activity_scope_leave(&v22);
}

void __68__CDPStateController_setKeyChainSyncCompatibilityState_withAltDSID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_37_cold_1();
  }
}

- (void)validateEDPIdentitiesWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_2182AE000, "cdp/edp-health-status", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __66__CDPStateController_validateEDPIdentitiesWithContext_completion___block_invoke;
  v19[3] = &unk_264317D90;
  void v19[4] = self;
  id v9 = v7;
  id v20 = v9;
  uint64_t v10 = (void *)MEMORY[0x21D4671C0](v19);
  uint64_t v11 = [(CDPController *)self daemonConn];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__CDPStateController_validateEDPIdentitiesWithContext_completion___block_invoke_82;
  v17[3] = &unk_264317090;
  id v12 = v10;
  id v18 = v12;
  uint64_t v13 = [v11 daemonWithErrorHandler:v17];

  int v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v16 = 0;
    _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "Checking for EDP health status", v16, 2u);
  }

  int v15 = [(CDPController *)self uiProviderProxy];
  [v13 validateEDPIdentitiesWithContext:v6 uiProvider:v15 completion:v12];

  os_activity_scope_leave(&state);
}

void __66__CDPStateController_validateEDPIdentitiesWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __66__CDPStateController_validateEDPIdentitiesWithContext_completion___block_invoke_cold_1();
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v10 + 16))(v10, a2, v7, v8);
  }
}

void __66__CDPStateController_validateEDPIdentitiesWithContext_completion___block_invoke_82(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchEDPTokenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2182AE000, "cdp/fetch-edp-token", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = [(CDPController *)self daemonConn];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__CDPStateController_fetchEDPTokenWithCompletion___block_invoke;
  void v15[3] = &unk_264317090;
  id v7 = v4;
  id v16 = v7;
  id v8 = [v6 daemonWithErrorHandler:v15];

  id v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2182AE000, v9, OS_LOG_TYPE_DEFAULT, "Fetching EDP Token...", buf, 2u);
  }

  uint64_t v10 = [(CDPController *)self context];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__CDPStateController_fetchEDPTokenWithCompletion___block_invoke_85;
  v12[3] = &unk_264317DB8;
  void v12[4] = self;
  id v11 = v7;
  id v13 = v11;
  [v8 fetchEDPTokenForContext:v10 completion:v12];

  os_activity_scope_leave(&state);
}

void __50__CDPStateController_fetchEDPTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2_cold_1();
  }

  if (*(void *)(a1 + 32))
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __50__CDPStateController_fetchEDPTokenWithCompletion___block_invoke_84;
      v5[3] = &unk_264317CA0;
      id v7 = *(id *)(a1 + 32);
      id v6 = v3;
      dispatch_async(MEMORY[0x263EF83A0], v5);
    }
  }
}

uint64_t __50__CDPStateController_fetchEDPTokenWithCompletion___block_invoke_84(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __50__CDPStateController_fetchEDPTokenWithCompletion___block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __50__CDPStateController_fetchEDPTokenWithCompletion___block_invoke_2;
      block[3] = &unk_264317380;
      id v10 = *(id *)(a1 + 40);
      id v8 = v5;
      id v9 = v6;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __50__CDPStateController_fetchEDPTokenWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)createEDPLivenessDictionaryWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_2182AE000, "cdp/edp-health-liveness-payload", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x3032000000;
  int v28 = __Block_byref_object_copy__3;
  uint64_t v29 = __Block_byref_object_dispose__3;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  os_activity_scope_state_s v22 = __Block_byref_object_copy__3;
  uint64_t v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __67__CDPStateController_createEDPLivenessDictionaryWithContext_error___block_invoke;
  v18[3] = &unk_264317DE0;
  void v18[4] = self;
  void v18[5] = &v25;
  v18[6] = &v19;
  id v8 = (void *)MEMORY[0x21D4671C0](v18);
  id v9 = [(CDPController *)self daemonConn];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__CDPStateController_createEDPLivenessDictionaryWithContext_error___block_invoke_87;
  v16[3] = &unk_264317090;
  id v10 = v8;
  id v17 = v10;
  id v11 = [v9 synchronousDaemonWithErrorHandler:v16];

  id v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v15 = 0;
    _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "Creating EDP liveness health payload...", v15, 2u);
  }

  [v11 createEDPLivenessDictionaryWithContext:v6 completion:v10];
  if (a4) {
    *a4 = (id) v26[5];
  }
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  os_activity_scope_leave(&state);
  return v13;
}

void __67__CDPStateController_createEDPLivenessDictionaryWithContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __67__CDPStateController_createEDPLivenessDictionaryWithContext_error___block_invoke_cold_2();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __67__CDPStateController_createEDPLivenessDictionaryWithContext_error___block_invoke_cold_1();
  }
}

uint64_t __67__CDPStateController_createEDPLivenessDictionaryWithContext_error___block_invoke_87(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isManateeAvailable:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Manatee is not available, error: %{public}@", v2, v3, v4, v5, v6);
}

void __68__CDPStateController__handleCloudDataProtectionStateWithCompletion___block_invoke_33_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while starting state machine: %@", v2, v3, v4, v5, v6);
}

void __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_37_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while repairing state: %@", v2, v3, v4, v5, v6);
}

void __51__CDPStateController_repairEDPStateWithCompletion___block_invoke_39_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while repairing EDP state: %@", v2, v3, v4, v5, v6);
}

void __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while accepting sharing session: %@", v2, v3, v4, v5, v6);
}

void __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while attempting to escrow preRecord: %@", v2, v3, v4, v5, v6);
}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Processing Local Secret Change failed: %@. Attempting one retry.", v2, v3, v4, v5, v6);
}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_40_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Retrying Local Secret Change failed: %@.", v2, v3, v4, v5, v6);
}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_41_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while updating local secret: %@", v2, v3, v4, v5, v6);
}

void __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while finishing Cyrus secure terms flow: %@", v2, v3, v4, v5, v6);
}

void __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while checking recovery existence: %@", v2, v3, v4, v5, v6);
}

void __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to get remote object proxy for CDP daemon: %@", v2, v3, v4, v5, v6);
}

void __81__CDPStateController_shouldPerformAuthenticatedRepairWithOptionForceFetch_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while checking authenticated repair state: %@", v2, v3, v4, v5, v6);
}

void __70__CDPStateController_generateEscrowRecordReportUsingCache_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to generate escrow record report: %{public}@", v2, v3, v4, v5, v6);
}

- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Attempting to authenticate and then generate a recovery key", v2, v3, v4, v5, v6);
}

void __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21D4671C0](*(void *)(a1 + 40));
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_0(&dword_2182AE000, v4, v5, "Calling completion %@ with result %@ and error %@", v6, v7, v8, v9, v10);
}

void __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_47_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC error while authenticating and then generating a recovery key: %@", v2, v3, v4, v5, v6);
}

- (void)generateNewRecoveryKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Attempting to generate a new recovery key", v2, v3, v4, v5, v6);
}

void __45__CDPStateController_generateNewRecoveryKey___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while generating a recovery key: %@", v2, v3, v4, v5, v6);
}

- (void)authenticateAndDeleteRecoveryKeyWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Attempting to authenticate and then delete recovery key", v2, v3, v4, v5, v6);
}

void __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_49_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC error while authenticating and then deleting a recovery key: %@", v2, v3, v4, v5, v6);
}

- (void)deleteRecoveryKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Attempting to delete a recovery key", v2, v3, v4, v5, v6);
}

void __40__CDPStateController_deleteRecoveryKey___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while deleting a recovery key: %@", v2, v3, v4, v5, v6);
}

- (void)verifyRecoveryKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Attempting to verify the recovery key", v2, v3, v4, v5, v6);
}

void __40__CDPStateController_verifyRecoveryKey___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while verifying a recovery key: %@", v2, v3, v4, v5, v6);
}

- (void)isRecoveryKeyAvailableWithError:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to fetch recovery key availability with error %@", v2, v3, v4, v5, v6);
}

- (void)isRecoveryKeyAvailableWithError:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Attempting to fetch recovery key state", v2, v3, v4, v5, v6);
}

void __54__CDPStateController_isRecoveryKeyAvailableWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while fetching recovery key state: %@", v2, v3, v4, v5, v6);
}

void __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to fetch recovery key availability with error %@", v2, v3, v4, v5, v6);
}

void __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2182AE000, v0, OS_LOG_TYPE_ERROR, "XPC Error while fetching recovery key availability.", v1, 2u);
}

- (void)isWalrusRecoveryKeyAvailableWithError:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to fetch walrus recovery key availability with error %@", v2, v3, v4, v5, v6);
}

- (void)isWalrusRecoveryKeyAvailableWithError:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Attempting to fetch walrus recovery key state", v2, v3, v4, v5, v6);
}

void __60__CDPStateController_isWalrusRecoveryKeyAvailableWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while fetching walrus recovery key state: %@", v2, v3, v4, v5, v6);
}

void __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to walrus fetch recovery key availability with error %@", v2, v3, v4, v5, v6);
}

void __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2182AE000, v0, OS_LOG_TYPE_ERROR, "XPC Error while fetching walrus recovery key availability.", v1, 2u);
}

void __54__CDPStateController_isDeviceEscrowRecordRecoverable___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_2182AE000, v0, v1, "%@: Failed to find recoverable escrow record for current device with error (%@)");
}

void __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to check if escrow record repair is needed with error: %@", v2, v3, v4, v5, v6);
}

void __66__CDPStateController_startSilentEscrowRecordRepairWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to start silent escrow record repair: %@", v2, v3, v4, v5, v6);
}

void __68__CDPStateController_performSilentEscrowRecordRepairWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to perform silent escrow record repair: %@", v2, v3, v4, v5, v6);
}

void __74__CDPStateController_updateLastSilentEscrowRecordRepairAttemptDate_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to update last silent escrow record repair attempt date: %@", v2, v3, v4, v5, v6);
}

void __66__CDPStateController_validateEDPIdentitiesWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_2182AE000, v0, v1, "Failed to validate EDP identities: %{public}@, healthState: %ld");
}

void __67__CDPStateController_createEDPLivenessDictionaryWithContext_error___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_2182AE000, v0, OS_LOG_TYPE_DEBUG, "EDP livness dictionary=%@", v1, 0xCu);
}

void __67__CDPStateController_createEDPLivenessDictionaryWithContext_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to validate EDP identities with error: %@", v2, v3, v4, v5, v6);
}

@end