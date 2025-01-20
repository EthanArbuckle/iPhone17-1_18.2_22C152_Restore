@interface AACustodianController
- (AACustodianController)init;
- (AACustodianController)initWithDaemonConnectionProvider:(id)a3 analyticsReporter:(id)a4;
- (AACustodianController)initWithDaemonXPCEndpoint:(id)a3;
- (BOOL)cancelCustodianRecoveryWithSessionID:(id)a3 error:(id *)a4;
- (void)_retryingGenerateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4;
- (void)_retryingValidateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4;
- (void)availableRecoveryFactorsWithCompletion:(id)a3;
- (void)displayInvitationUIWithUUID:(id)a3 completion:(id)a4;
- (void)displayTrustedContactFlowWithModel:(id)a3 completion:(id)a4;
- (void)fetchCachedTrustedContactsWithCompletion:(id)a3;
- (void)fetchCustodianHealthStatusWithCompletion:(id)a3;
- (void)fetchCustodianPasswordResetInformationWithSessionID:(id)a3 completion:(id)a4;
- (void)fetchCustodianRecoveryConfigurationWithCompletion:(id)a3;
- (void)fetchCustodianRecoveryKeysWithSessionID:(id)a3 completion:(id)a4;
- (void)fetchCustodianshipInfoWithCompletion:(id)a3;
- (void)fetchCustodianshipInfoWithUUID:(id)a3 completion:(id)a4;
- (void)fetchSuggestedCustodiansForUpsellWithCompletion:(id)a3;
- (void)fetchSuggestedCustodiansWithCompletion:(id)a3;
- (void)fetchTrustedContactsWithCompletion:(id)a3;
- (void)generateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4;
- (void)performTrustedContactsDataSyncWithCompletion:(id)a3;
- (void)preflightCustodianRecoveryWithCompletion:(id)a3;
- (void)pullTrustedContactsFromCloudKitWithCompletion:(id)a3;
- (void)reSendCustodianInvitationWithCustodianID:(id)a3 completion:(id)a4;
- (void)removeCustodian:(id)a3 completion:(id)a4;
- (void)repairCustodians:(id)a3 completion:(id)a4;
- (void)repairCustodians:(id)a3 remove:(id)a4 completion:(id)a5;
- (void)respondToCustodianRequestWithResponse:(id)a3 completion:(id)a4;
- (void)setupCustodianshipWithContext:(id)a3 completion:(id)a4;
- (void)startCustodianRecoveryWithContext:(id)a3 completion:(id)a4;
- (void)startHealthCheckWithCompletion:(id)a3;
- (void)startManateeMigrationWithCompletion:(id)a3;
- (void)stopBeingCustodian:(id)a3 completion:(id)a4;
- (void)validateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4;
@end

@implementation AACustodianController

- (AACustodianController)init
{
  return [(AACustodianController *)self initWithDaemonXPCEndpoint:0];
}

- (AACustodianController)initWithDaemonXPCEndpoint:(id)a3
{
  id v4 = a3;
  v5 = [[AACustodianDaemonConnection alloc] initWithListenerEndpoint:v4];

  v6 = [(AACustodianController *)self initWithDaemonConnectionProvider:v5 analyticsReporter:0];
  return v6;
}

- (AACustodianController)initWithDaemonConnectionProvider:(id)a3 analyticsReporter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AACustodianController;
  v9 = [(AACustodianController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemonConnection, a3);
    if (v8)
    {
      v11 = (AAAnalyticsReporting *)v8;
    }
    else
    {
      v11 = +[AAAnalyticsRTCReporter reporter];
    }
    analyticsReporter = v10->_analyticsReporter;
    v10->_analyticsReporter = v11;
  }
  return v10;
}

- (void)setupCustodianshipWithContext:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/set-up-custodianship", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  v13 = _AASignpostLogSystem();
  objc_super v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SetupCustodianship", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetupCustodianship  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__9;
  v40 = __Block_byref_object_dispose__9;
  v16 = self;
  v41 = v16;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke;
  v29[3] = &unk_1E5A4AA98;
  p_long long buf = &buf;
  os_signpost_id_t v32 = v10;
  uint64_t v33 = v12;
  id v17 = v7;
  id v30 = v17;
  v18 = (void *)MEMORY[0x1A622F430](v29);
  daemonConnection = v16->_daemonConnection;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_24;
  v27[3] = &unk_1E5A48680;
  id v20 = v18;
  id v28 = v20;
  v21 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v27];
  v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [v6 debugDescription];
    *(_DWORD *)v35 = 138412290;
    v36 = v23;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Setting up custodianship: %@", v35, 0xCu);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_26;
  v25[3] = &unk_1E5A4AAC0;
  id v24 = v20;
  id v26 = v24;
  [v21 setupCustodianshipWithContext:v6 completion:v25];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SetupCustodianship", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  objc_super v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    uint64_t v16 = a1[6];
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    uint64_t v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetupCustodianship  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  uint64_t v19 = a1[4];
  if (v19) {
    (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v5, v6);
  }
}

void __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_24_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_26_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)respondToCustodianRequestWithResponse:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/custodian-invitation-response", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  v13 = _AASignpostLogSystem();
  objc_super v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RespondToCustodianRequest", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  double v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RespondToCustodianRequest  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__9;
  uint64_t v38 = __Block_byref_object_dispose__9;
  uint64_t v16 = self;
  v39 = v16;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke;
  v29[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v32 = v10;
  uint64_t v33 = v12;
  id v17 = v7;
  id v30 = v17;
  int v18 = (void *)MEMORY[0x1A622F430](v29);
  daemonConnection = v16->_daemonConnection;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_27;
  v27[3] = &unk_1E5A48680;
  id v20 = v18;
  id v28 = v20;
  uint64_t v21 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v27];
  __int16 v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Responding to a custodian request.", v26, 2u);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_28;
  v24[3] = &unk_1E5A48680;
  id v23 = v20;
  id v25 = v23;
  [v21 respondToInviteWithContext:v6 completion:v24];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RespondToCustodianRequest", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  uint64_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    objc_super v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RespondToCustodianRequest  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);
  }
}

void __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_27_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_28_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Responded to the custodian request successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeCustodian:(id)a3 completion:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/custodian-remove", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AASignpostLogSystem();
  objc_super v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RemoveCustodian", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveCustodian  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__9;
  uint64_t v42 = __Block_byref_object_dispose__9;
  uint64_t v16 = self;
  v43 = v16;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52__AACustodianController_removeCustodian_completion___block_invoke;
  v31[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v34 = v10;
  uint64_t v35 = v12;
  id v17 = v7;
  id v32 = v17;
  uint64_t v18 = (void *)MEMORY[0x1A622F430](v31);
  daemonConnection = v16->_daemonConnection;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __52__AACustodianController_removeCustodian_completion___block_invoke_29;
  v29[3] = &unk_1E5A48680;
  id v20 = v18;
  id v30 = v20;
  __int16 v21 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v29];
  int v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v6 UUIDString];
    *(_DWORD *)v37 = 138412290;
    uint64_t v38 = v23;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Removing custodian with ID %@.", v37, 0xCu);
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __52__AACustodianController_removeCustodian_completion___block_invoke_30;
  v26[3] = &unk_1E5A48658;
  id v24 = v6;
  id v27 = v24;
  id v25 = v20;
  id v28 = v25;
  [v21 removeCustodian:v24 completion:v26];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __52__AACustodianController_removeCustodian_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveCustodian", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  uint64_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    objc_super v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveCustodian  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);
  }
}

void __52__AACustodianController_removeCustodian_completion___block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__AACustodianController_removeCustodian_completion___block_invoke_29_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__AACustodianController_removeCustodian_completion___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__AACustodianController_removeCustodian_completion___block_invoke_30_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) UUIDString];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Custodian %@ removed successfully.", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stopBeingCustodian:(id)a3 completion:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/stop-being-custodian", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AASignpostLogSystem();
  objc_super v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "StopBeingCustodian", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StopBeingCustodian  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__9;
  uint64_t v42 = __Block_byref_object_dispose__9;
  uint64_t v16 = self;
  v43 = v16;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __55__AACustodianController_stopBeingCustodian_completion___block_invoke;
  v31[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v34 = v10;
  uint64_t v35 = v12;
  id v17 = v7;
  id v32 = v17;
  uint64_t v18 = (void *)MEMORY[0x1A622F430](v31);
  daemonConnection = v16->_daemonConnection;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __55__AACustodianController_stopBeingCustodian_completion___block_invoke_31;
  v29[3] = &unk_1E5A48680;
  id v20 = v18;
  id v30 = v20;
  __int16 v21 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v29];
  int v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v6 UUIDString];
    *(_DWORD *)v37 = 138412290;
    uint64_t v38 = v23;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Ending custodianship with ID %@.", v37, 0xCu);
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__AACustodianController_stopBeingCustodian_completion___block_invoke_32;
  v26[3] = &unk_1E5A48658;
  id v24 = v6;
  id v27 = v24;
  id v25 = v20;
  id v28 = v25;
  [v21 stopBeingCustodian:v24 completion:v26];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __55__AACustodianController_stopBeingCustodian_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "StopBeingCustodian", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  uint64_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    objc_super v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StopBeingCustodian  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);
  }
}

void __55__AACustodianController_stopBeingCustodian_completion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__AACustodianController_stopBeingCustodian_completion___block_invoke_31_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__AACustodianController_stopBeingCustodian_completion___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__AACustodianController_stopBeingCustodian_completion___block_invoke_32_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) UUIDString];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Custodianship %@ has been ended.", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchCachedTrustedContactsWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/fetch-cached-trusted-contacts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AASignpostLogSystem();
  os_signpost_id_t v7 = _AASignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchCachedTrustedContacts", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  double v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCachedTrustedContacts  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  os_signpost_id_t v34 = __Block_byref_object_copy__9;
  uint64_t v35 = __Block_byref_object_dispose__9;
  uint64_t v13 = self;
  uint64_t v36 = v13;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke;
  v26[3] = &unk_1E5A4A010;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v7;
  uint64_t v30 = v9;
  id v14 = v4;
  id v27 = v14;
  int v15 = (void *)MEMORY[0x1A622F430](v26);
  daemonConnection = v13->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_34;
  v24[3] = &unk_1E5A48680;
  id v17 = v15;
  id v25 = v17;
  uint64_t v18 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  __int16 v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetching cached trusted contacts.", v23, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_35;
  v21[3] = &unk_1E5A48D68;
  id v20 = v17;
  id v22 = v20;
  [v18 fetchCachedTrustedContactsWithCompletion:v21];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCachedTrustedContacts", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    uint64_t v16 = (void *)a1[6];
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    id v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCachedTrustedContacts  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  if (a1[4])
  {
    __int16 v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetched cached trusted contacts: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_34_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_35_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTrustedContactsWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/fetch-trusted-contacts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AASignpostLogSystem();
  os_signpost_id_t v7 = _AASignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchTrustedContacts", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  os_signpost_id_t v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchTrustedContacts  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  os_signpost_id_t v34 = __Block_byref_object_copy__9;
  uint64_t v35 = __Block_byref_object_dispose__9;
  uint64_t v13 = self;
  uint64_t v36 = v13;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke;
  v26[3] = &unk_1E5A4A010;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v7;
  uint64_t v30 = v9;
  id v14 = v4;
  id v27 = v14;
  double v15 = (void *)MEMORY[0x1A622F430](v26);
  daemonConnection = v13->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_36;
  v24[3] = &unk_1E5A48680;
  id v17 = v15;
  id v25 = v17;
  int v18 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  __int16 v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v23 = 0;
    _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetching trusted contacts.", v23, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_37;
  v21[3] = &unk_1E5A48D68;
  id v20 = v17;
  id v22 = v20;
  [v18 fetchTrustedContactsWithCompletion:v21];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchTrustedContacts", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    uint64_t v16 = (void *)a1[6];
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    id v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchTrustedContacts  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  if (a1[4])
  {
    __int16 v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetched trusted contacts: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_36(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_36_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_37_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCustodianshipInfoWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/fetch-custodianship-info", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AASignpostLogSystem();
  os_signpost_id_t v7 = _AASignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchCustodianshipInfo", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  os_signpost_id_t v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCustodianshipInfo  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  os_signpost_id_t v34 = __Block_byref_object_copy__9;
  uint64_t v35 = __Block_byref_object_dispose__9;
  uint64_t v13 = self;
  uint64_t v36 = v13;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke;
  v26[3] = &unk_1E5A4A010;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v7;
  uint64_t v30 = v9;
  id v14 = v4;
  id v27 = v14;
  double v15 = (void *)MEMORY[0x1A622F430](v26);
  daemonConnection = v13->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_38;
  v24[3] = &unk_1E5A48680;
  id v17 = v15;
  id v25 = v17;
  int v18 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  __int16 v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v23 = 0;
    _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetching custodianship info.", v23, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_39;
  v21[3] = &unk_1E5A48D68;
  id v20 = v17;
  id v22 = v20;
  [v18 fetchCustodianshipInfoWithCompletion:v21];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCustodianshipInfo", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    uint64_t v16 = (void *)a1[6];
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    id v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianshipInfo  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  if (a1[4])
  {
    __int16 v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetched custodianship info: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_38_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_39_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCustodianshipInfoWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/fetch-custodianship-info-with-uuid", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AASignpostLogSystem();
  id v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FetchCustodianshipInfoWithUUID", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  double v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCustodianshipInfoWithUUID  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__9;
  uint64_t v38 = __Block_byref_object_dispose__9;
  uint64_t v16 = self;
  v39 = v16;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __67__AACustodianController_fetchCustodianshipInfoWithUUID_completion___block_invoke;
  v29[3] = &unk_1E5A4AAE8;
  p_long long buf = &buf;
  os_signpost_id_t v32 = v10;
  uint64_t v33 = v12;
  id v17 = v7;
  id v30 = v17;
  int v18 = (void *)MEMORY[0x1A622F430](v29);
  daemonConnection = v16->_daemonConnection;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__AACustodianController_fetchCustodianshipInfoWithUUID_completion___block_invoke_41;
  v27[3] = &unk_1E5A48680;
  id v20 = v18;
  id v28 = v20;
  id v21 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v27];
  __int16 v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Fetching custodianship info.", v26, 2u);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __67__AACustodianController_fetchCustodianshipInfoWithUUID_completion___block_invoke_42;
  v24[3] = &unk_1E5A4AB10;
  id v23 = v20;
  id v25 = v23;
  [v21 fetchCustodianshipInfoWithUUID:v6 completion:v24];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __67__AACustodianController_fetchCustodianshipInfoWithUUID_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCustodianshipInfoWithUUID", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    uint64_t v16 = (void *)a1[6];
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    id v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianshipInfoWithUUID  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  if (a1[4])
  {
    __int16 v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetched custodianship info: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __67__AACustodianController_fetchCustodianshipInfoWithUUID_completion___block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_38_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__AACustodianController_fetchCustodianshipInfoWithUUID_completion___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_39_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSuggestedCustodiansWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/fetch-suggested-custodians", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AASignpostLogSystem();
  os_signpost_id_t v7 = _AASignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchSuggestedCustodians", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  os_signpost_id_t v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchSuggestedCustodians  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  os_signpost_id_t v34 = __Block_byref_object_copy__9;
  uint64_t v35 = __Block_byref_object_dispose__9;
  uint64_t v13 = self;
  uint64_t v36 = v13;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke;
  v26[3] = &unk_1E5A4A010;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v7;
  uint64_t v30 = v9;
  id v14 = v4;
  id v27 = v14;
  double v15 = (void *)MEMORY[0x1A622F430](v26);
  daemonConnection = v13->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke_43;
  v24[3] = &unk_1E5A48680;
  id v17 = v15;
  id v25 = v17;
  int v18 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  __int16 v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v23 = 0;
    _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetching suggested custodians.", v23, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke_44;
  v21[3] = &unk_1E5A48D68;
  id v20 = v17;
  id v22 = v20;
  [v18 fetchSuggestedCustodiansWithCompletion:v21];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchSuggestedCustodians", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    uint64_t v16 = (void *)a1[6];
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    id v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchSuggestedCustodians  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  if (a1[4])
  {
    __int16 v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetched suggested custodians: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke_43(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_38_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke_44_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSuggestedCustodiansForUpsellWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/fetch-suggested-custodians-for-upsell", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AASignpostLogSystem();
  os_signpost_id_t v7 = _AASignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchSuggestedCustodiansForUpsell", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v30 = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchSuggestedCustodiansForUpsell  enableTelemetry=YES ", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __73__AACustodianController_fetchSuggestedCustodiansForUpsellWithCompletion___block_invoke;
  v24[3] = &unk_1E5A4AB38;
  os_signpost_id_t v26 = v7;
  uint64_t v27 = v9;
  id v13 = v4;
  void v24[4] = self;
  id v25 = v13;
  id v14 = (void *)MEMORY[0x1A622F430](v24);
  daemonConnection = self->_daemonConnection;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__AACustodianController_fetchSuggestedCustodiansForUpsellWithCompletion___block_invoke_45;
  v22[3] = &unk_1E5A48680;
  id v16 = v14;
  id v23 = v16;
  id v17 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v22];
  int v18 = _AALogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "Fetching suggested custodians for upsell .", buf, 2u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__AACustodianController_fetchSuggestedCustodiansForUpsellWithCompletion___block_invoke_46;
  v20[3] = &unk_1E5A48D68;
  id v19 = v16;
  id v21 = v19;
  [v17 fetchSuggestedCustodiansForUpsellWithCompletion:v20];

  os_activity_scope_leave(&state);
}

void __73__AACustodianController_fetchSuggestedCustodiansForUpsellWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v8 = _AASignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    uint64_t v11 = _AAErrorUnderlyingError(v6);
    int v18 = 67240192;
    LODWORD(v19) = [v11 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v9, OS_SIGNPOST_INTERVAL_END, v10, "FetchSuggestedCustodiansForUpsell", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }
  os_signpost_id_t v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = (double)Nanoseconds / 1000000000.0;
    id v14 = (void *)a1[6];
    double v15 = _AAErrorUnderlyingError(v6);
    int v16 = [v15 code];
    int v18 = 134218496;
    id v19 = v14;
    __int16 v20 = 2048;
    double v21 = v13;
    __int16 v22 = 1026;
    int v23 = v16;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchSuggestedCustodiansForUpsell  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }
  if (a1[5])
  {
    id v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "Fetched suggested custodians for upsell: %@", (uint8_t *)&v18, 0xCu);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __73__AACustodianController_fetchSuggestedCustodiansForUpsellWithCompletion___block_invoke_45(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_38_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__AACustodianController_fetchSuggestedCustodiansForUpsellWithCompletion___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    os_signpost_id_t v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__AACustodianController_fetchSuggestedCustodiansForUpsellWithCompletion___block_invoke_46_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCustodianHealthStatusWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/fetch-custodian-health", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AASignpostLogSystem();
  os_signpost_id_t v7 = _AASignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchCustodianHealthStatus", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  os_signpost_id_t v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCustodianHealthStatus  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  os_signpost_id_t v34 = __Block_byref_object_copy__9;
  uint64_t v35 = __Block_byref_object_dispose__9;
  double v13 = self;
  uint64_t v36 = v13;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke;
  v26[3] = &unk_1E5A4A010;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v7;
  uint64_t v30 = v9;
  id v14 = v4;
  id v27 = v14;
  double v15 = (void *)MEMORY[0x1A622F430](v26);
  daemonConnection = v13->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke_47;
  v24[3] = &unk_1E5A48680;
  id v17 = v15;
  id v25 = v17;
  int v18 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  id v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v23 = 0;
    _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetching custodian health status.", v23, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke_48;
  v21[3] = &unk_1E5A48D68;
  id v20 = v17;
  id v22 = v20;
  [v18 fetchCustodianHealthStatusWithCompletion:v21];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    double v13 = _AAErrorUnderlyingError(v6);
    int v20 = 67240192;
    LODWORD(v21) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCustodianHealthStatus", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    int v16 = (void *)a1[6];
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v20 = 134218496;
    id v21 = v16;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianHealthStatus  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }
  if (a1[4])
  {
    id v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetched health info: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke_47(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_38_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke_48_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startCustodianRecoveryWithContext:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/start-recovery", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  double v13 = _AASignpostLogSystem();
  id v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "StartCustodianRecovery", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  double v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StartCustodianRecovery  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  os_signpost_id_t v34 = __Block_byref_object_copy__9;
  uint64_t v35 = __Block_byref_object_dispose__9;
  int v16 = self;
  uint64_t v36 = v16;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke;
  v26[3] = &unk_1E5A4AB60;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v10;
  uint64_t v30 = v12;
  id v17 = v7;
  id v27 = v17;
  int v18 = (void *)MEMORY[0x1A622F430](v26);
  daemonConnection = v16->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke_50;
  v24[3] = &unk_1E5A48680;
  id v20 = v18;
  id v25 = v20;
  id v21 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  __int16 v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v23 = 0;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Initiating custodian recovery request.", v23, 2u);
  }

  [v21 startCustodianRecoveryWithContext:v6 completion:v20];
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
}

void __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    double v13 = _AAErrorUnderlyingError(v6);
    int v22 = 67240192;
    LODWORD(v23) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "StartCustodianRecovery", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    int v16 = (void *)a1[6];
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v22 = 134218496;
    id v23 = v16;
    __int16 v24 = 2048;
    double v25 = v15;
    __int16 v26 = 1026;
    int v27 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StartCustodianRecovery  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 0x1Cu);
  }
  id v19 = _AALogSystem();
  id v20 = v19;
  if (v5)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "Custodian recovery started successfully with recovery ID: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v21 = a1[4];
  if (v21) {
    (*(void (**)(uint64_t, id, id))(v21 + 16))(v21, v5, v6);
  }
}

void __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke_50_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCustodianRecoveryConfigurationWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/fetch-configuration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AASignpostLogSystem();
  os_signpost_id_t v7 = _AASignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchCustodianRecoveryConfiguration", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  os_signpost_id_t v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCustodianRecoveryConfiguration  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__9;
  os_signpost_id_t v32 = __Block_byref_object_dispose__9;
  double v13 = self;
  uint64_t v33 = v13;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke;
  v23[3] = &unk_1E5A4AB88;
  p_long long buf = &buf;
  os_signpost_id_t v26 = v7;
  uint64_t v27 = v9;
  id v14 = v4;
  id v24 = v14;
  double v15 = (void *)MEMORY[0x1A622F430](v23);
  daemonConnection = v13->_daemonConnection;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke_52;
  v21[3] = &unk_1E5A48680;
  id v17 = v15;
  id v22 = v17;
  int v18 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v21];
  id v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Fetching custodian configuration.", v20, 2u);
  }

  [v18 fetchCustodianRecoveryConfigurationWithCompletion:v17];
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
}

void __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    double v13 = _AAErrorUnderlyingError(v6);
    int v22 = 67240192;
    LODWORD(v23) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCustodianRecoveryConfiguration", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    int v16 = (void *)a1[6];
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v22 = 134218496;
    id v23 = v16;
    __int16 v24 = 2048;
    double v25 = v15;
    __int16 v26 = 1026;
    int v27 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianRecoveryConfiguration  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 0x1Cu);
  }
  id v19 = _AALogSystem();
  id v20 = v19;
  if (v5)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "Custodian recovery configuration fetched successfully with configuration: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke_cold_1();
  }

  uint64_t v21 = a1[4];
  if (v21) {
    (*(void (**)(uint64_t, id, id))(v21 + 16))(v21, v5, v6);
  }
}

void __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke_52(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke_52_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/generate-code", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  double v13 = _AASignpostLogSystem();
  id v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "GenerateCustodianRecoveryCode", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  double v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GenerateCustodianRecoveryCode  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__9;
  uint64_t v44 = __Block_byref_object_dispose__9;
  int v16 = self;
  v45 = v16;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke;
  v34[3] = &unk_1E5A4ABB0;
  p_long long buf = &buf;
  os_signpost_id_t v38 = v10;
  uint64_t v39 = v12;
  id v17 = v6;
  id v35 = v17;
  id v18 = v7;
  id v36 = v18;
  id v19 = (void *)MEMORY[0x1A622F430](v34);
  objc_initWeak(&location, v16);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke_53;
  v30[3] = &unk_1E5A4ABD8;
  objc_copyWeak(&v32, &location);
  id v20 = v17;
  id v31 = v20;
  uint64_t v21 = (void *)MEMORY[0x1A622F430](v30);
  int v22 = (void *)[objc_alloc(MEMORY[0x1E4F47068]) initWithMaxRetries:1];
  id v23 = _AALogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_signpost_id_t v29 = 0;
    _os_log_impl(&dword_1A11D8000, v23, OS_LOG_TYPE_DEFAULT, "Scheduling recovery code generation through retry scheduler", v29, 2u);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke_56;
  v26[3] = &unk_1E5A4AC00;
  id v24 = v19;
  id v28 = v24;
  id v25 = v22;
  id v27 = v25;
  [v25 scheduleTask:v21 shouldRetry:0 completionHandler:v26];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    double v13 = _AAErrorUnderlyingError(v6);
    int v24 = 67240192;
    LODWORD(v25) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "GenerateCustodianRecoveryCode", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v24, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    int v16 = *(void **)(a1 + 56);
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v24 = 134218496;
    id v25 = v16;
    __int16 v26 = 2048;
    double v27 = v15;
    __int16 v28 = 1026;
    int v29 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GenerateCustodianRecoveryCode  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v24, 0x1Cu);
  }
  id v19 = _AALogSystem();
  id v20 = v19;
  if (v5)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [*(id *)(a1 + 32) custodianUUID];
      int v22 = [v21 UUIDString];
      int v24 = 138412290;
      id v25 = v22;
      _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "Custodian recovery code was generated successfully for custodian: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v23 = *(void *)(a1 + 40);
  if (v23) {
    (*(void (**)(uint64_t, id, id))(v23 + 16))(v23, v5, v6);
  }
}

void __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _retryingGenerateCustodianRecoveryCodeWithContext:*(void *)(a1 + 32) completion:v3];
  }
  else
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Cannot call daemon to generate custodian recovery code as custodian controller is deallocated", v7, 2u);
    }
  }
}

void __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    id v8 = v9;
  }
  else {
    id v8 = 0;
  }

  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v7);
}

- (void)_retryingGenerateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F46FC8];
  id v9 = [v6 altDSID];
  os_signpost_id_t v10 = [v6 telemetryFlowID];
  uint64_t v11 = [v8 analyticsEventWithName:@"com.apple.appleaccount.custodian.generate" altDSID:v9 flowID:v10];

  os_signpost_id_t v12 = self->_analyticsReporter;
  daemonConnection = self->_daemonConnection;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __86__AACustodianController__retryingGenerateCustodianRecoveryCodeWithContext_completion___block_invoke;
  v27[3] = &unk_1E5A4A698;
  id v14 = v11;
  id v28 = v14;
  double v15 = v12;
  int v29 = v15;
  id v16 = v7;
  id v30 = v16;
  id v17 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v27];
  int v18 = _AALogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "Calling daemon to generate custodian recovery code", buf, 2u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__AACustodianController__retryingGenerateCustodianRecoveryCodeWithContext_completion___block_invoke_60;
  v22[3] = &unk_1E5A4AC28;
  id v23 = v14;
  int v24 = v15;
  id v25 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  [v17 generateCustodianRecoveryCodeWithContext:v6 completion:v22];
}

void __86__AACustodianController__retryingGenerateCustodianRecoveryCodeWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __86__AACustodianController__retryingGenerateCustodianRecoveryCodeWithContext_completion___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) updateTaskResultWithError:v3];
  [*(id *)(a1 + 40) sendEvent:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __86__AACustodianController__retryingGenerateCustodianRecoveryCodeWithContext_completion___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 updateTaskResultWithError:v6];
  [*(id *)(a1 + 40) sendEvent:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)validateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/validate-code", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  double v13 = _AASignpostLogSystem();
  id v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ValidateCustodianRecoveryCode", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  double v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ValidateCustodianRecoveryCode  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__9;
  uint64_t v42 = __Block_byref_object_dispose__9;
  id v16 = self;
  v43 = v16;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke;
  v33[3] = &unk_1E5A4AC50;
  p_long long buf = &buf;
  os_signpost_id_t v36 = v10;
  uint64_t v37 = v12;
  id v17 = v7;
  id v34 = v17;
  int v18 = (void *)MEMORY[0x1A622F430](v33);
  objc_initWeak(&location, v16);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke_62;
  v29[3] = &unk_1E5A4ABD8;
  objc_copyWeak(&v31, &location);
  id v19 = v6;
  id v30 = v19;
  id v20 = (void *)MEMORY[0x1A622F430](v29);
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F47068]) initWithMaxRetries:1];
  int v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v28 = 0;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Scheduling validate recovery code through retry scheduler", v28, 2u);
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke_63;
  v25[3] = &unk_1E5A4AC00;
  id v23 = v18;
  id v27 = v23;
  id v24 = v21;
  id v26 = v24;
  [v24 scheduleTask:v20 shouldRetry:0 completionHandler:v25];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    double v13 = _AAErrorUnderlyingError(v6);
    int v22 = 67240192;
    LODWORD(v23) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "ValidateCustodianRecoveryCode", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    id v16 = (void *)a1[6];
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v22 = 134218496;
    id v23 = v16;
    __int16 v24 = 2048;
    double v25 = v15;
    __int16 v26 = 1026;
    int v27 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: ValidateCustodianRecoveryCode  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 0x1Cu);
  }
  id v19 = _AALogSystem();
  id v20 = v19;
  if (v5)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "Custodian code verification successful with context: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v21 = a1[4];
  if (v21) {
    (*(void (**)(uint64_t, id, id))(v21 + 16))(v21, v5, v6);
  }
}

void __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke_62(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _retryingValidateCustodianRecoveryCodeWithContext:*(void *)(a1 + 32) completion:v3];
  }
  else
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Cannot call daemon to generate custodian recovery code as custodian controller is deallocated", v7, 2u);
    }
  }
}

void __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    id v8 = v9;
  }
  else {
    id v8 = 0;
  }

  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v7);
}

- (void)_retryingValidateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Calling daemon to verify custodian recovery code", buf, 2u);
  }

  id v9 = (void *)MEMORY[0x1E4F46FC8];
  os_signpost_id_t v10 = [v7 altDSID];
  uint64_t v11 = [v7 telemetryFlowID];
  os_signpost_id_t v12 = [v9 analyticsEventWithName:@"com.apple.appleaccount.CustodianRecovery" altDSID:v10 flowID:v11];

  double v13 = self->_analyticsReporter;
  daemonConnection = self->_daemonConnection;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __86__AACustodianController__retryingValidateCustodianRecoveryCodeWithContext_completion___block_invoke;
  v26[3] = &unk_1E5A4A698;
  id v15 = v12;
  id v27 = v15;
  id v16 = v13;
  uint64_t v28 = v16;
  id v17 = v6;
  id v29 = v17;
  int v18 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v26];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__AACustodianController__retryingValidateCustodianRecoveryCodeWithContext_completion___block_invoke_65;
  v22[3] = &unk_1E5A4AC78;
  id v23 = v15;
  __int16 v24 = v16;
  id v25 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  [v18 validateCustodianRecoveryCodeWithContext:v7 completion:v22];
}

void __86__AACustodianController__retryingValidateCustodianRecoveryCodeWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __86__AACustodianController__retryingValidateCustodianRecoveryCodeWithContext_completion___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) updateTaskResultWithError:v3];
  [*(id *)(a1 + 40) sendEvent:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __86__AACustodianController__retryingValidateCustodianRecoveryCodeWithContext_completion___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 updateTaskResultWithError:v6];
  [*(id *)(a1 + 40) sendEvent:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchCustodianRecoveryKeysWithSessionID:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/fetch-keys", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  double v13 = _AASignpostLogSystem();
  id v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FetchCustodianRecoveryKeys", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  id v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCustodianRecoveryKeys  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__9;
  id v35 = __Block_byref_object_dispose__9;
  id v16 = self;
  os_signpost_id_t v36 = v16;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke;
  v26[3] = &unk_1E5A4ACA0;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v10;
  uint64_t v30 = v12;
  id v17 = v7;
  id v27 = v17;
  int v18 = (void *)MEMORY[0x1A622F430](v26);
  daemonConnection = v16->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_67;
  v24[3] = &unk_1E5A48680;
  id v20 = v18;
  id v25 = v20;
  id v21 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  int v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v23 = 0;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Calling daemon service to fetch custodian recovery keys", v23, 2u);
  }

  [v21 fetchCustodianRecoveryKeysWithSessionID:v6 completion:v20];
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
}

void __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    double v13 = _AAErrorUnderlyingError(v6);
    int v22 = 67240192;
    LODWORD(v23) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCustodianRecoveryKeys", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    id v16 = (void *)a1[6];
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v22 = 134218496;
    id v23 = v16;
    __int16 v24 = 2048;
    double v25 = v15;
    __int16 v26 = 1026;
    int v27 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianRecoveryKeys  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 0x1Cu);
  }
  id v19 = _AALogSystem();
  id v20 = v19;
  if (v5)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "Fetched recovery keys successfully with keys: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_cold_1();
  }

  uint64_t v21 = a1[4];
  if (v21) {
    (*(void (**)(uint64_t, id, id))(v21 + 16))(v21, v5, v6);
  }
}

void __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_67_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)cancelCustodianRecoveryWithSessionID:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/custodian-cancel-recovery", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = _AASignpostLogSystem();
  os_signpost_id_t v9 = _AASignpostCreate(v8);
  uint64_t v11 = v10;

  os_signpost_id_t v12 = _AASignpostLogSystem();
  double v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CancelCustodianRecovery", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CancelCustodianRecovery  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__9;
  v41 = __Block_byref_object_dispose__9;
  id v42 = 0;
  daemonConnection = self->_daemonConnection;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __68__AACustodianController_cancelCustodianRecoveryWithSessionID_error___block_invoke;
  v32[3] = &unk_1E5A4ACC8;
  v32[4] = &buf;
  id v16 = [(AACustodianDaemonConnectionProviding *)daemonConnection synchronousRemoteObjectProxyWithErrorHandler:v32];
  id v17 = _AALogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v34 = 0;
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "Calling daemon service to cancel custodian recovery", v34, 2u);
  }

  int v18 = (id *)(*((void *)&buf + 1) + 40);
  id obj = *(id *)(*((void *)&buf + 1) + 40);
  int v19 = [v16 cancelCustodianRecoveryWithSessionID:v6 error:&obj];
  objc_storeStrong(v18, obj);
  unint64_t Nanoseconds = _AASignpostGetNanoseconds(v9, v11);
  uint64_t v21 = _AASignpostLogSystem();
  int v22 = v21;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    id v23 = _AAErrorUnderlyingError(*(void **)(*((void *)&buf + 1) + 40));
    int v24 = [v23 code];
    *(_DWORD *)id v34 = 67240192;
    *(_DWORD *)id v35 = v24;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v22, OS_SIGNPOST_INTERVAL_END, v9, "FetchCustodianRecoveryKeys", " Error=%{public,signpost.telemetry:number2,name=Error}d ", v34, 8u);
  }
  double v25 = _AASignpostLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v26 = _AAErrorUnderlyingError(*(void **)(*((void *)&buf + 1) + 40));
    int v27 = [v26 code];
    *(_DWORD *)id v34 = 134218496;
    *(void *)id v35 = v9;
    *(_WORD *)&v35[8] = 2048;
    *(double *)&v35[10] = (double)Nanoseconds / 1000000000.0;
    __int16 v36 = 1026;
    int v37 = v27;
    _os_log_impl(&dword_1A11D8000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianRecoveryKeys  Error=%{public,signpost.telemetry:number2,name=Error}d ", v34, 0x1Cu);
  }
  uint64_t v28 = _AALogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)id v34 = 67109378;
    *(_DWORD *)id v35 = v19;
    *(_WORD *)&uint8_t v35[4] = 2112;
    *(void *)&v35[6] = v29;
    _os_log_impl(&dword_1A11D8000, v28, OS_LOG_TYPE_DEFAULT, "Custodian recovery canceled with result: %i, error: %@", v34, 0x12u);
  }

  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v19;
}

void __68__AACustodianController_cancelCustodianRecoveryWithSessionID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_67_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)fetchCustodianPasswordResetInformationWithSessionID:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/fetch-recovery-token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  double v13 = _AASignpostLogSystem();
  id v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FetchCustodianPasswordResetInfo", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  double v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCustodianPasswordResetInfo  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  __int16 v36 = __Block_byref_object_copy__9;
  int v37 = __Block_byref_object_dispose__9;
  id v16 = self;
  os_signpost_id_t v38 = v16;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__AACustodianController_fetchCustodianPasswordResetInformationWithSessionID_completion___block_invoke;
  v27[3] = &unk_1E5A4ACF0;
  p_long long buf = &buf;
  os_signpost_id_t v31 = v10;
  uint64_t v32 = v12;
  id v17 = v6;
  id v28 = v17;
  id v18 = v7;
  id v29 = v18;
  int v19 = (void *)MEMORY[0x1A622F430](v27);
  daemonConnection = v16->_daemonConnection;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __88__AACustodianController_fetchCustodianPasswordResetInformationWithSessionID_completion___block_invoke_69;
  v25[3] = &unk_1E5A48680;
  id v21 = v19;
  id v26 = v21;
  int v22 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v25];
  id v23 = _AALogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v24 = 0;
    _os_log_impl(&dword_1A11D8000, v23, OS_LOG_TYPE_DEFAULT, "Calling daemon service to fetch custodian recovery token", v24, 2u);
  }

  [v22 fetchCustodianPasswordResetInformationWithSessionID:v17 completion:v21];
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
}

void __88__AACustodianController_fetchCustodianPasswordResetInformationWithSessionID_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[7], a1[8]);
  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[7];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    double v13 = _AAErrorUnderlyingError(v6);
    int v23 = 67240192;
    LODWORD(v24) = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCustodianPasswordResetInfo", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v23, 8u);
  }
  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    uint64_t v16 = a1[7];
    id v17 = _AAErrorUnderlyingError(v6);
    int v18 = [v17 code];
    int v23 = 134218496;
    uint64_t v24 = v16;
    __int16 v25 = 2048;
    double v26 = v15;
    __int16 v27 = 1026;
    int v28 = v18;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianPasswordResetInfo  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v23, 0x1Cu);
  }
  int v19 = _AALogSystem();
  id v20 = v19;
  if (v5)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = a1[4];
      int v23 = 138412290;
      uint64_t v24 = v21;
      _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "Fetched recovery token successfully for sessionID: %@", (uint8_t *)&v23, 0xCu);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __88__AACustodianController_fetchCustodianPasswordResetInformationWithSessionID_completion___block_invoke_cold_1();
  }

  uint64_t v22 = a1[5];
  if (v22) {
    (*(void (**)(uint64_t, id, id))(v22 + 16))(v22, v5, v6);
  }
}

void __88__AACustodianController_fetchCustodianPasswordResetInformationWithSessionID_completion___block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_67_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startHealthCheckWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/custodian-health-check", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AASignpostLogSystem();
  os_signpost_id_t v7 = _AASignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "StartHealthCheck", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  os_signpost_id_t v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StartHealthCheck  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__9;
  uint64_t v35 = __Block_byref_object_dispose__9;
  double v13 = self;
  __int16 v36 = v13;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__AACustodianController_startHealthCheckWithCompletion___block_invoke;
  v26[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v7;
  uint64_t v30 = v9;
  id v14 = v4;
  id v27 = v14;
  double v15 = (void *)MEMORY[0x1A622F430](v26);
  daemonConnection = v13->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_70;
  v24[3] = &unk_1E5A48680;
  id v17 = v15;
  id v25 = v17;
  int v18 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  int v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v23 = 0;
    _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Starting health check", v23, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_71;
  v21[3] = &unk_1E5A48680;
  id v20 = v17;
  id v22 = v20;
  [v18 startHealthCheckWithCompletion:v21];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __56__AACustodianController_startHealthCheckWithCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v7 = _AASignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "StartHealthCheck", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  uint64_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    id v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StartHealthCheck  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);
  }
}

void __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_70(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_70_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_71(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_71_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performTrustedContactsDataSyncWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/trusted-contacts-data-sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AASignpostLogSystem();
  os_signpost_id_t v7 = _AASignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PerformTrustedContactsDataSync", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  double v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformTrustedContactsDataSync  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__9;
  uint64_t v35 = __Block_byref_object_dispose__9;
  uint64_t v13 = self;
  __int16 v36 = v13;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke;
  v26[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v7;
  uint64_t v30 = v9;
  id v14 = v4;
  id v27 = v14;
  int v15 = (void *)MEMORY[0x1A622F430](v26);
  daemonConnection = v13->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_72;
  v24[3] = &unk_1E5A48680;
  id v17 = v15;
  id v25 = v17;
  uint64_t v18 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  __int16 v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Performing trusted contacts data sync", v23, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_73;
  v21[3] = &unk_1E5A48680;
  id v20 = v17;
  id v22 = v20;
  [v18 performTrustedContactsDataSyncWithCompletion:v21];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v7 = _AASignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PerformTrustedContactsDataSync", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  uint64_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    id v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformTrustedContactsDataSync  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);
  }
}

void __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_72(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_72_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_73(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_73_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startManateeMigrationWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/start-manatee-migration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AASignpostLogSystem();
  os_signpost_id_t v7 = _AASignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "StartManateeMigration", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  double v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StartManateeMigration  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__9;
  uint64_t v35 = __Block_byref_object_dispose__9;
  uint64_t v13 = self;
  __int16 v36 = v13;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke;
  v26[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v7;
  uint64_t v30 = v9;
  id v14 = v4;
  id v27 = v14;
  int v15 = (void *)MEMORY[0x1A622F430](v26);
  daemonConnection = v13->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_74;
  v24[3] = &unk_1E5A48680;
  id v17 = v15;
  id v25 = v17;
  uint64_t v18 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  __int16 v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Calling out to remote custodian service to start Manatee migration.", v23, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_75;
  v21[3] = &unk_1E5A48680;
  id v20 = v17;
  id v22 = v20;
  [v18 startManateeMigrationWithCompletion:v21];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v7 = _AASignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "StartManateeMigration", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  uint64_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    id v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StartManateeMigration  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  if (a1[4])
  {
    uint64_t v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Manatee migration completed", (uint8_t *)&v17, 2u);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_74(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_74_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_75_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pullTrustedContactsFromCloudKitWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/pull-trusted-contacts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AASignpostLogSystem();
  os_signpost_id_t v7 = _AASignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PullTrustedContacts", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  double v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PullTrustedContacts  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__9;
  id v34 = __Block_byref_object_dispose__9;
  uint64_t v13 = self;
  uint64_t v35 = v13;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke;
  v25[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v28 = v7;
  uint64_t v29 = v9;
  id v14 = v4;
  id v26 = v14;
  int v15 = (void *)MEMORY[0x1A622F430](v25);
  daemonConnection = v13->_daemonConnection;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_76;
  v23[3] = &unk_1E5A48680;
  id v17 = v15;
  id v24 = v17;
  uint64_t v18 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v23];
  __int16 v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[AACustodianController pullTrustedContactsFromCloudKitWithCompletion:](v19);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_77;
  v21[3] = &unk_1E5A48680;
  id v20 = v17;
  id v22 = v20;
  [v18 pullTrustedContactsFromCloudKitWithCompletion:v21];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v7 = _AASignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = _AAErrorUnderlyingError(v3);
    int v19 = 67240192;
    LODWORD(v20) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PullTrustedContacts", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }
  uint64_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    id v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v19 = 134218496;
    uint64_t v20 = v13;
    __int16 v21 = 2048;
    double v22 = v12;
    __int16 v23 = 1026;
    int v24 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PullTrustedContacts  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }
  uint64_t v16 = _AALogSystem();
  id v17 = v16;
  if (v3)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_cold_1(v17);
  }

  uint64_t v18 = a1[4];
  if (v18) {
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v3);
  }
}

void __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_76(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_76_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)displayTrustedContactFlowWithModel:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/display-trusted-contact-flow-ui", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AASignpostLogSystem();
  id v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "DisplayTrustedContactFlow", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: DisplayTrustedContactFlow  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__9;
  os_signpost_id_t v38 = __Block_byref_object_dispose__9;
  uint64_t v16 = self;
  uint64_t v39 = v16;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke;
  v29[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v32 = v10;
  uint64_t v33 = v12;
  id v17 = v7;
  id v30 = v17;
  uint64_t v18 = (void *)MEMORY[0x1A622F430](v29);
  daemonConnection = v16->_daemonConnection;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_78;
  v27[3] = &unk_1E5A48680;
  id v20 = v18;
  id v28 = v20;
  __int16 v21 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v27];
  double v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v26 = 0;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Displaying trusted contact flow from view service.", v26, 2u);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_79;
  v24[3] = &unk_1E5A48680;
  id v23 = v20;
  id v25 = v23;
  [v21 displayTrustedContactFlowWithModel:v6 completion:v24];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "DisplayTrustedContactFlow", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  uint64_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    id v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: DisplayTrustedContactFlow  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);
  }
}

void __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_78(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_78_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_79(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_79_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Displayed trusted contact flow UI successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)displayInvitationUIWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/display-invitation-ui", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AASignpostLogSystem();
  id v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "DisplayInvitationUI", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  int v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: DisplayInvitationUI  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__9;
  os_signpost_id_t v38 = __Block_byref_object_dispose__9;
  uint64_t v16 = self;
  uint64_t v39 = v16;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke;
  v29[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v32 = v10;
  uint64_t v33 = v12;
  id v17 = v7;
  id v30 = v17;
  uint64_t v18 = (void *)MEMORY[0x1A622F430](v29);
  daemonConnection = v16->_daemonConnection;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_80;
  v27[3] = &unk_1E5A48680;
  id v20 = v18;
  id v28 = v20;
  __int16 v21 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v27];
  int v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v26 = 0;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Displaying invitation UI from view service.", v26, 2u);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_81;
  v24[3] = &unk_1E5A48680;
  id v23 = v20;
  id v25 = v23;
  [v21 displayCustodianInviteWithUUID:v6 completion:v24];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "DisplayInvitationUI", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  uint64_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    id v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: DisplayInvitationUI  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);
  }
}

void __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_80_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_81(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_81_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Displayed invitation UI successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reSendCustodianInvitationWithCustodianID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/resend-invite", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__9;
  void v22[4] = __Block_byref_object_dispose__9;
  os_signpost_id_t v9 = self;
  uint64_t v23 = v9;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__AACustodianController_reSendCustodianInvitationWithCustodianID_completion___block_invoke;
  v19[3] = &unk_1E5A48C10;
  __int16 v21 = v22;
  id v10 = v7;
  id v20 = v10;
  uint64_t v11 = (void *)MEMORY[0x1A622F430](v19);
  daemonConnection = v9->_daemonConnection;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__AACustodianController_reSendCustodianInvitationWithCustodianID_completion___block_invoke_2;
  v17[3] = &unk_1E5A48680;
  id v13 = v11;
  id v18 = v13;
  id v14 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v17];
  int v15 = _AALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "Calling daemon service to resend invitation.", v16, 2u);
  }

  [v14 reSendCustodianInvitationWithCustodianID:v6 completion:v13];
  _Block_object_dispose(v22, 8);

  os_activity_scope_leave(&state);
}

void __77__AACustodianController_reSendCustodianInvitationWithCustodianID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __77__AACustodianController_reSendCustodianInvitationWithCustodianID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__AACustodianController_reSendCustodianInvitationWithCustodianID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)availableRecoveryFactorsWithCompletion:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"AACustodianController.m", 779, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/available-recovery-factors", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  id v7 = _AASignpostLogSystem();
  os_signpost_id_t v8 = _AASignpostCreate(v7);
  uint64_t v10 = v9;

  uint64_t v11 = _AASignpostLogSystem();
  double v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchAvailableRecoveryFactors", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  id v13 = _AASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAvailableRecoveryFactors  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__9;
  uint64_t v37 = __Block_byref_object_dispose__9;
  id v14 = self;
  os_signpost_id_t v38 = v14;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke;
  v28[3] = &unk_1E5A4AD18;
  p_long long buf = &buf;
  os_signpost_id_t v31 = v8;
  uint64_t v32 = v10;
  id v15 = v5;
  id v29 = v15;
  uint64_t v16 = (void *)MEMORY[0x1A622F430](v28);
  daemonConnection = v14->_daemonConnection;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_93;
  v26[3] = &unk_1E5A48680;
  id v18 = v16;
  id v27 = v18;
  __int16 v19 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v26];
  id v20 = _AALogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v25 = 0;
    _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "Fetching available recovery factors", v25, 2u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_94;
  v23[3] = &unk_1E5A48588;
  id v21 = v18;
  id v24 = v21;
  [v19 availableRecoveryFactorsWithCompletion:v23];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v9 = _AASignpostLogSystem();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    double v12 = _AAErrorUnderlyingError(v5);
    int v19 = 67240192;
    LODWORD(v20) = [v12 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchAvailableRecoveryFactors", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }
  id v13 = _AASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)Nanoseconds / 1000000000.0;
    uint64_t v15 = a1[6];
    uint64_t v16 = _AAErrorUnderlyingError(v5);
    int v17 = [v16 code];
    int v19 = 134218496;
    uint64_t v20 = v15;
    __int16 v21 = 2048;
    double v22 = v14;
    __int16 v23 = 1026;
    int v24 = v17;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchAvailableRecoveryFactors  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }
  uint64_t v18 = a1[4];
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, id))(v18 + 16))(v18, a2, v5);
  }
}

void __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_93(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_93_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_94(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_94_cold_1();
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)repairCustodians:(id)a3 remove:(id)a4 completion:(id)a5
{
}

- (void)repairCustodians:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/custodian-repair", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AASignpostLogSystem();
  os_signpost_id_t v10 = _AASignpostCreate(v9);
  uint64_t v12 = v11;

  id v13 = _AASignpostLogSystem();
  double v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RepairCustodians", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  uint64_t v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RepairCustodians  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  os_signpost_id_t v38 = __Block_byref_object_copy__9;
  uint64_t v39 = __Block_byref_object_dispose__9;
  uint64_t v16 = self;
  uint64_t v40 = v16;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __53__AACustodianController_repairCustodians_completion___block_invoke;
  v28[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v31 = v10;
  uint64_t v32 = v12;
  id v17 = v7;
  id v29 = v17;
  uint64_t v18 = (void *)MEMORY[0x1A622F430](v28);
  daemonConnection = v16->_daemonConnection;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __53__AACustodianController_repairCustodians_completion___block_invoke_95;
  v26[3] = &unk_1E5A48680;
  id v20 = v18;
  id v27 = v20;
  __int16 v21 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v26];
  double v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v34 = 138412290;
    id v35 = v6;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Repairing custodians %@", v34, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __53__AACustodianController_repairCustodians_completion___block_invoke_96;
  v24[3] = &unk_1E5A48680;
  id v23 = v20;
  id v25 = v23;
  [v21 repairCustodians:v6 completion:v24];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __53__AACustodianController_repairCustodians_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AASignpostLogSystem();
  os_signpost_id_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RepairCustodians", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  uint64_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    double v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RepairCustodians  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);
  }
}

void __53__AACustodianController_repairCustodians_completion___block_invoke_95(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__AACustodianController_repairCustodians_completion___block_invoke_95_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__AACustodianController_repairCustodians_completion___block_invoke_96(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__AACustodianController_repairCustodians_completion___block_invoke_96_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Custodians repaired successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)preflightCustodianRecoveryWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A11D8000, "custodian-appleaccount/preflight-custodian-recovery", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AASignpostLogSystem();
  os_signpost_id_t v7 = _AASignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PreflightCustodianRecovery", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  double v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PreflightCustodianRecovery  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__9;
  id v35 = __Block_byref_object_dispose__9;
  uint64_t v13 = self;
  uint64_t v36 = v13;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke;
  v26[3] = &unk_1E5A49FE8;
  p_long long buf = &buf;
  os_signpost_id_t v29 = v7;
  uint64_t v30 = v9;
  id v14 = v4;
  id v27 = v14;
  int v15 = (void *)MEMORY[0x1A622F430](v26);
  daemonConnection = v13->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_97;
  v24[3] = &unk_1E5A48680;
  id v17 = v15;
  id v25 = v17;
  uint64_t v18 = [(AACustodianDaemonConnectionProviding *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  __int16 v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Starting Preflight custodian recovery in CustodianController", v23, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_98;
  v21[3] = &unk_1E5A48680;
  id v20 = v17;
  id v22 = v20;
  [v18 preflightCustodianRecoveryWithCompletion:v21];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  os_signpost_id_t v7 = _AASignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = _AAErrorUnderlyingError(v3);
    int v17 = 67240192;
    LODWORD(v18) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PreflightCustodianRecovery", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  uint64_t v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    id v14 = _AAErrorUnderlyingError(v3);
    int v15 = [v14 code];
    int v17 = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v12;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightCustodianRecovery  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);
  }
}

void __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_97(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_97_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_98(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_98_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Preflight custodian recovery successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_encryptedPRKC, 0);
  objc_storeStrong((id *)&self->_ownerCustodianAltDSID, 0);

  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

void __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for setting up custodianship return an error: %@", v2, v3, v4, v5, v6);
}

void __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_26_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Custodian setup failed: %@", v2, v3, v4, v5, v6);
}

void __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for responding to custodian requests returned an error: %@", v2, v3, v4, v5, v6);
}

void __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error responding to custodian requests: %@", v2, v3, v4, v5, v6);
}

void __52__AACustodianController_removeCustodian_completion___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for removing custodian returned an error: %@", v2, v3, v4, v5, v6);
}

void __52__AACustodianController_removeCustodian_completion___block_invoke_30_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error removing custodian: %@", v2, v3, v4, v5, v6);
}

void __55__AACustodianController_stopBeingCustodian_completion___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection returned an error: %@", v2, v3, v4, v5, v6);
}

void __55__AACustodianController_stopBeingCustodian_completion___block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error ending custodianship: %@", v2, v3, v4, v5, v6);
}

void __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_34_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for fetching cached trusted contacts returned an error: %@", v2, v3, v4, v5, v6);
}

void __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error fetching cached trusted contacts: %@", v2, v3, v4, v5, v6);
}

void __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_36_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for fetching trusted contacts returned an error: %@", v2, v3, v4, v5, v6);
}

void __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_37_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error fetching trusted contacts: %@", v2, v3, v4, v5, v6);
}

void __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_38_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection returned an error: %@", v2, v3, v4, v5, v6);
}

void __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_39_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error fetching custodianship info: %@", v2, v3, v4, v5, v6);
}

void __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke_44_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error fetching suggested custodians: %@", v2, v3, v4, v5, v6);
}

void __73__AACustodianController_fetchSuggestedCustodiansForUpsellWithCompletion___block_invoke_46_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error fetching suggested custodiansor upsell : %@", v2, v3, v4, v5, v6);
}

void __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke_48_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error fetching health status: %@", v2, v3, v4, v5, v6);
}

void __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Custodian recovery failed to start with error: %@", v2, v3, v4, v5, v6);
}

void __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke_50_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for starting custodian recovery request returned an error: %@", v2, v3, v4, v5, v6);
}

void __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Custodian recovery configuration failed to fetch with error: %@", v2, v3, v4, v5, v6);
}

void __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke_52_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for fetching custodian configuration returned an error: %@", v2, v3, v4, v5, v6);
}

void __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Custodian recovery code failed to be generated with error: %@", v2, v3, v4, v5, v6);
}

void __86__AACustodianController__retryingGenerateCustodianRecoveryCodeWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for generating custodian recovery code returned an error: %@", v2, v3, v4, v5, v6);
}

void __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Custodian code verification failed with error: %@", v2, v3, v4, v5, v6);
}

void __86__AACustodianController__retryingValidateCustodianRecoveryCodeWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for validating custodian recovery code returned an error: %@", v2, v3, v4, v5, v6);
}

void __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch recovery keys with error: %@", v2, v3, v4, v5, v6);
}

void __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_67_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for fetching recovery keys returned an error: %@", v2, v3, v4, v5, v6);
}

void __88__AACustodianController_fetchCustodianPasswordResetInformationWithSessionID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch recovery token with error: %@", v2, v3, v4, v5, v6);
}

void __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_70_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for health check return an error: %@", v2, v3, v4, v5, v6);
}

void __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_71_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Custodian health check failed: %@", v2, v3, v4, v5, v6);
}

void __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_72_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for trusted contacts data sync returned an error: %@", v2, v3, v4, v5, v6);
}

void __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_73_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Performing trusted contacts data sync failed: %@", v2, v3, v4, v5, v6);
}

void __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_74_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for starting Manatee migration return an error: %@", v2, v3, v4, v5, v6);
}

void __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_75_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Manatee migration failed: %@", v2, v3, v4, v5, v6);
}

- (void)pullTrustedContactsFromCloudKitWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "Calling out to remote custodian service to pull trusted contacts from CloudKit.", v1, 2u);
}

void __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "Completed pulling trusted contacts from CloudKit", v1, 2u);
}

void __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to pull trusted contacts from CloudKit: %@", v2, v3, v4, v5, v6);
}

void __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_76_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for pulling trusted contacts from CloudKit return an error: %@", v2, v3, v4, v5, v6);
}

void __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_78_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for displaying trusted contact flow returned an error: %@", v2, v3, v4, v5, v6);
}

void __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_79_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Displayed trusted contact flow with error %@", v2, v3, v4, v5, v6);
}

void __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_80_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for displaying invitation UI returned an error: %@", v2, v3, v4, v5, v6);
}

void __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_81_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Displayed invitation UI with error %@", v2, v3, v4, v5, v6);
}

void __77__AACustodianController_reSendCustodianInvitationWithCustodianID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for resending invitation encountered error: %@", v2, v3, v4, v5, v6);
}

void __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_93_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for fetching available recovery factors returned an error: %@", v2, v3, v4, v5, v6);
}

void __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_94_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Fetching available recovery factors failed: %@", v2, v3, v4, v5, v6);
}

void __53__AACustodianController_repairCustodians_completion___block_invoke_95_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for repairing custodian returned an error: %@", v2, v3, v4, v5, v6);
}

void __53__AACustodianController_repairCustodians_completion___block_invoke_96_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error repairing error: %@", v2, v3, v4, v5, v6);
}

void __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_97_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AppleAccount daemon connection for Preflighting custodian returned an error: %@", v2, v3, v4, v5, v6);
}

void __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_98_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Preflight custodian recovery failed: %@", v2, v3, v4, v5, v6);
}

@end