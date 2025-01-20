@interface AKCustodianController
- (AKCustodianController)init;
- (AKCustodianController)initWithDaemonXPCEndpoint:(id)a3;
- (void)dealloc;
- (void)fetchCustodianDataRecoveryKeyWithContext:(id)a3 completion:(id)a4;
- (void)fetchCustodianRecoveryCodeConfigurationWithCompletion:(id)a3;
- (void)fetchCustodianRecoveryTokenWithContext:(id)a3 completion:(id)a4;
- (void)finalizeCustodianSetupWithContext:(id)a3 completion:(id)a4;
- (void)initiateCustodianSetupWithContext:(id)a3 completion:(id)a4;
- (void)performTrustedContactsDataSync:(id)a3 completion:(id)a4;
- (void)revokeCustodianWithContext:(id)a3 completion:(id)a4;
- (void)sendEmbargoEndNotificationFeedbackWithContext:(id)a3 urlKey:(id)a4 completion:(id)a5;
- (void)startCustodianRecoveryRequestWithContext:(id)a3 completion:(id)a4;
- (void)startCustodianRecoveryTransactionWithContext:(id)a3 completion:(id)a4;
- (void)updateCustodianRecoveryKeyWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKCustodianController

- (AKCustodianController)init
{
  return [(AKCustodianController *)self initWithDaemonXPCEndpoint:0];
}

- (AKCustodianController)initWithDaemonXPCEndpoint:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKCustodianController;
  v5 = [(AKCustodianController *)&v9 init];
  if (v5)
  {
    v6 = [[AKCustodianDaemonConnection alloc] initWithListenerEndpoint:v4];
    daemonConnection = v5->_daemonConnection;
    v5->_daemonConnection = v6;
  }
  return v5;
}

- (void)initiateCustodianSetupWithContext:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__15;
  v34[4] = __Block_byref_object_dispose__15;
  v8 = self;
  v35 = v8;
  objc_super v9 = _os_activity_create(&dword_193494000, "custodian-authkit/initiate-custodian", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate(v10);
  uint64_t v13 = v12;

  v14 = _AKSignpostLogSystem();
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CustodianSetupStart", " enableTelemetry=YES ", buf, 2u);
  }

  v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v37 = v11;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianSetupStart  enableTelemetry=YES ", buf, 0xCu);
  }

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke;
  v28[3] = &unk_1E5762750;
  os_signpost_id_t v31 = v11;
  uint64_t v32 = v13;
  v30 = v34;
  id v17 = v7;
  id v29 = v17;
  v18 = (void *)MEMORY[0x1996FE880](v28);
  daemonConnection = v8->_daemonConnection;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke_17;
  v26[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v27 = v20;
  v21 = [(AKCustodianDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v26];
  v22 = _AKLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v37 = (os_signpost_id_t)v6;
    _os_log_impl(&dword_193494000, v22, OS_LOG_TYPE_DEFAULT, "Calling out to remote custodian service to initiate custodian for context %@", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke_19;
  v24[3] = &unk_1E5762778;
  id v23 = v20;
  id v25 = v23;
  [v21 initiateCustodianSetupWithContext:v6 completion:v24];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v34, 8);
}

void __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  v8 = _AKSignpostLogSystem();
  objc_super v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CustodianSetupStart", (const char *)&unk_19357E265, (uint8_t *)&v16, 2u);
  }

  os_signpost_id_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[6];
    int v16 = 134218240;
    uint64_t v17 = v12;
    __int16 v18 = 2048;
    double v19 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:CustodianSetupStart ", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v13 = *(void *)(a1[5] + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;

  uint64_t v15 = a1[4];
  if (v15) {
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
  }
}

void __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke_17_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v5 debugDescription];
    int v9 = 138412546;
    os_signpost_id_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote custodian initiation call: %@. Error: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finalizeCustodianSetupWithContext:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__15;
  v34[4] = __Block_byref_object_dispose__15;
  v8 = self;
  v35 = v8;
  int v9 = _os_activity_create(&dword_193494000, "authkit/custodian-finalize-custodian", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_signpost_id_t v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate(v10);
  uint64_t v13 = v12;

  v14 = _AKSignpostLogSystem();
  uint64_t v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CustodianSetupFinalize", " enableTelemetry=YES ", buf, 2u);
  }

  int v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v37 = v11;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianSetupFinalize  enableTelemetry=YES ", buf, 0xCu);
  }

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke;
  v28[3] = &unk_1E5760E68;
  os_signpost_id_t v31 = v11;
  uint64_t v32 = v13;
  v30 = v34;
  id v17 = v7;
  id v29 = v17;
  __int16 v18 = (void *)MEMORY[0x1996FE880](v28);
  daemonConnection = v8->_daemonConnection;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_20;
  v26[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v27 = v20;
  v21 = [(AKCustodianDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v26];
  v22 = _AKLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v37 = (os_signpost_id_t)v6;
    _os_log_impl(&dword_193494000, v22, OS_LOG_TYPE_DEFAULT, "Calling out to remote custodian service to finalize custodian for context %@", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_21;
  v24[3] = &unk_1E575EAC0;
  id v23 = v20;
  id v25 = v23;
  [v21 finalizeCustodianSetupWithContext:v6 completion:v24];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v34, 8);
}

void __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v5 = _AKSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[6];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v6, OS_SIGNPOST_INTERVAL_END, v7, "CustodianSetupFinalize", (const char *)&unk_19357E265, (uint8_t *)&v13, 2u);
  }

  v8 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[6];
    int v13 = 134218240;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    double v16 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:CustodianSetupFinalize ", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v10 = *(void *)(a1[5] + 8);
  os_signpost_id_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  uint64_t v12 = a1[4];
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);
  }
}

void __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_20_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_21_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Successfully finalized custodianship.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)revokeCustodianWithContext:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__15;
  v25[4] = __Block_byref_object_dispose__15;
  v8 = self;
  v26 = v8;
  uint64_t v9 = _os_activity_create(&dword_193494000, "authkit/custodian-revoke-custodian", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke;
  v21[3] = &unk_1E575F1E8;
  id v23 = v25;
  id v10 = v7;
  id v22 = v10;
  os_signpost_id_t v11 = (void *)MEMORY[0x1996FE880](v21);
  daemonConnection = v8->_daemonConnection;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_2;
  v19[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v20 = v13;
  uint64_t v14 = [(AKCustodianDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v19];
  __int16 v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Calling out to remote custodian service to revoke custodian for context %@", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_22;
  v17[3] = &unk_1E575EAC0;
  id v16 = v13;
  id v18 = v16;
  [v14 revokeCustodianWithContext:v6 completion:v17];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);
}

void __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_22_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Successfully revoked custodianship.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateCustodianRecoveryKeyWithContext:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__15;
  v25[4] = __Block_byref_object_dispose__15;
  v8 = self;
  v26 = v8;
  uint64_t v9 = _os_activity_create(&dword_193494000, "authkit/custodian-update-key", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke;
  v21[3] = &unk_1E575F1E8;
  id v23 = v25;
  id v10 = v7;
  id v22 = v10;
  os_signpost_id_t v11 = (void *)MEMORY[0x1996FE880](v21);
  daemonConnection = v8->_daemonConnection;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_2;
  v19[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v20 = v13;
  uint64_t v14 = [(AKCustodianDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v19];
  __int16 v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Updating idMS recovery key with context %@", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_23;
  v17[3] = &unk_1E575EAC0;
  id v16 = v13;
  id v18 = v16;
  [v14 updateCustodianRecoveryKeyWithContext:v6 completion:v17];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);
}

void __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_23_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated recovery key with idMS.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startCustodianRecoveryRequestWithContext:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "custodian-authkit/start-custodian-recovery", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  id v13 = _AKSignpostLogSystem();
  uint64_t v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CustodianRecoveryStart", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  __int16 v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianRecoveryStart  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__15;
  v33 = __Block_byref_object_dispose__15;
  id v16 = self;
  v34 = v16;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __77__AKCustodianController_startCustodianRecoveryRequestWithContext_completion___block_invoke;
  v24[3] = &unk_1E57627A0;
  os_signpost_id_t v27 = v10;
  uint64_t v28 = v12;
  p_long long buf = &buf;
  id v17 = v7;
  id v25 = v17;
  id v18 = (void *)MEMORY[0x1996FE880](v24);
  daemonConnection = v16->_daemonConnection;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__AKCustodianController_startCustodianRecoveryRequestWithContext_completion___block_invoke_25;
  v22[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v23 = v20;
  v21 = [(AKCustodianDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v22];
  [v21 startCustodianRecoveryRequestWithContext:v6 completion:v20];

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __77__AKCustodianController_startCustodianRecoveryRequestWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  v8 = _AKSignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CustodianRecoveryStart", (const char *)&unk_19357E265, (uint8_t *)&v17, 2u);
  }

  uint64_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)a1[6];
    int v17 = 134218240;
    id v18 = v12;
    __int16 v19 = 2048;
    double v20 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:CustodianRecoveryStart ", (uint8_t *)&v17, 0x16u);
  }

  id v13 = _AKLogSystem();
  uint64_t v14 = v13;
  if (v5)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "startCustodianRecoveryRequestWithContext completed with response: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    __77__AKCustodianController_startCustodianRecoveryRequestWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v15 = *(void *)(a1[5] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __77__AKCustodianController_startCustodianRecoveryRequestWithContext_completion___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCustodianRecoveryCodeConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_193494000, "custodian-authkit/fetch-code-config", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__15;
  void v17[4] = __Block_byref_object_dispose__15;
  id v6 = self;
  id v18 = v6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__AKCustodianController_fetchCustodianRecoveryCodeConfigurationWithCompletion___block_invoke;
  v14[3] = &unk_1E575EEC8;
  id v16 = v17;
  id v7 = v4;
  id v15 = v7;
  v8 = (void *)MEMORY[0x1996FE880](v14);
  daemonConnection = v6->_daemonConnection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__AKCustodianController_fetchCustodianRecoveryCodeConfigurationWithCompletion___block_invoke_26;
  v12[3] = &unk_1E575EAC0;
  id v10 = v8;
  id v13 = v10;
  uint64_t v11 = [(AKCustodianDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v12];
  [v11 fetchCustodianRecoveryCodeConfigurationWithCompletion:v10];

  _Block_object_dispose(v17, 8);
  os_activity_scope_leave(&state);
}

void __79__AKCustodianController_fetchCustodianRecoveryCodeConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "fetchCustodianRecoveryCodeConfiguration completed with result: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __79__AKCustodianController_fetchCustodianRecoveryCodeConfigurationWithCompletion___block_invoke_cold_1();
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__AKCustodianController_fetchCustodianRecoveryCodeConfigurationWithCompletion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startCustodianRecoveryTransactionWithContext:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "custodian-authkit/custodian-recovery-circle", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AKSignpostLogSystem();
  uint64_t v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    id v15 = [v6 recoverySessionID];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v15;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CustodianRecoveryMessage", " RecoverySessionID=%{public,signpost.telemetry:string1,name=RecoverySessionID}@  enableTelemetry=YES ", buf, 0xCu);
  }
  id v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [v6 recoverySessionID];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v17;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianRecoveryMessage  RecoverySessionID=%{public,signpost.telemetry:string1,name=RecoverySessionID}@  enableTelemetry=YES ", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v33 = __Block_byref_object_copy__15;
  v34 = __Block_byref_object_dispose__15;
  id v18 = self;
  uint64_t v35 = v18;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke;
  v26[3] = &unk_1E5760E18;
  os_signpost_id_t v29 = v10;
  uint64_t v30 = v12;
  uint64_t v28 = buf;
  id v19 = v7;
  id v27 = v19;
  double v20 = (void *)MEMORY[0x1996FE880](v26);
  daemonConnection = v18->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke_28;
  v24[3] = &unk_1E575EAC0;
  id v22 = v20;
  id v25 = v22;
  id v23 = [(AKCustodianDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  [v23 startCustodianRecoveryTransactionWithContext:v6 completion:v22];

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);
}

void __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AKSignpostLogSystem();
  v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CustodianRecoveryMessage", (const char *)&unk_19357E265, (uint8_t *)&v16, 2u);
  }

  os_signpost_id_t v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[6];
    int v16 = 134218240;
    uint64_t v17 = v11;
    __int16 v18 = 2048;
    double v19 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:CustodianRecoveryMessage ", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v12 = _AKLogSystem();
  uint64_t v13 = v12;
  if (a2)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "startCustodianRecoveryTransactionWithContext completed successfully", (uint8_t *)&v16, 2u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v14 = *(void *)(a1[5] + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

void __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke_28_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCustodianRecoveryTokenWithContext:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "custodian-authkit/fetch-recovery-token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AKSignpostLogSystem();
  uint64_t v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    id v15 = [v6 recoverySessionID];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v15;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CustodianRecoveryToken", " RecoverySessionID=%{public,signpost.telemetry:string1,name=RecoverySessionID}@  enableTelemetry=YES ", buf, 0xCu);
  }
  int v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v6 recoverySessionID];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v17;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianRecoveryToken  RecoverySessionID=%{public,signpost.telemetry:string1,name=RecoverySessionID}@  enableTelemetry=YES ", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v33 = __Block_byref_object_copy__15;
  v34 = __Block_byref_object_dispose__15;
  __int16 v18 = self;
  uint64_t v35 = v18;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke;
  v26[3] = &unk_1E5760E40;
  os_signpost_id_t v29 = v10;
  uint64_t v30 = v12;
  uint64_t v28 = buf;
  id v19 = v7;
  id v27 = v19;
  uint64_t v20 = (void *)MEMORY[0x1996FE880](v26);
  daemonConnection = v18->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke_30;
  v24[3] = &unk_1E575EAC0;
  id v22 = v20;
  id v25 = v22;
  id v23 = [(AKCustodianDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  [v23 fetchCustodianRecoveryTokenWithContext:v6 completion:v22];

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);
}

void __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CustodianRecoveryToken", (const char *)&unk_19357E265, (uint8_t *)&v17, 2u);
  }

  uint64_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)a1[6];
    int v17 = 134218240;
    id v18 = v12;
    __int16 v19 = 2048;
    double v20 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:CustodianRecoveryToken ", (uint8_t *)&v17, 0x16u);
  }

  uint64_t v13 = _AKLogSystem();
  uint64_t v14 = v13;
  if (v6)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "fetchCustodianRecoveryTokenWithContext completed with token: %@", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v15 = *(void *)(a1[5] + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

void __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke_30_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCustodianDataRecoveryKeyWithContext:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "custodian-authkit/fetch-wrap-rkc", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AKSignpostLogSystem();
  uint64_t v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    uint64_t v15 = [v6 recoverySessionID];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v15;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CustodianDataRecoveryKey", " RecoverySessionID=%{public,signpost.telemetry:string1,name=RecoverySessionID}@  enableTelemetry=YES ", buf, 0xCu);
  }
  int v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [v6 recoverySessionID];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v17;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianDataRecoveryKey  RecoverySessionID=%{public,signpost.telemetry:string1,name=RecoverySessionID}@  enableTelemetry=YES ", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v33 = __Block_byref_object_copy__15;
  v34 = __Block_byref_object_dispose__15;
  id v18 = self;
  uint64_t v35 = v18;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke;
  v26[3] = &unk_1E57627A0;
  os_signpost_id_t v29 = v10;
  uint64_t v30 = v12;
  uint64_t v28 = buf;
  id v19 = v7;
  id v27 = v19;
  double v20 = (void *)MEMORY[0x1996FE880](v26);
  daemonConnection = v18->_daemonConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke_31;
  v24[3] = &unk_1E575EAC0;
  id v22 = v20;
  id v25 = v22;
  id v23 = [(AKCustodianDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v24];
  [v23 fetchCustodianDataRecoveryKeyWithContext:v6 completion:v22];

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);
}

void __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CustodianDataRecoveryKey", (const char *)&unk_19357E265, (uint8_t *)&v17, 2u);
  }

  uint64_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)a1[6];
    int v17 = 134218240;
    id v18 = v12;
    __int16 v19 = 2048;
    double v20 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:CustodianDataRecoveryKey ", (uint8_t *)&v17, 0x16u);
  }

  uint64_t v13 = _AKLogSystem();
  uint64_t v14 = v13;
  if (v5)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "fetchCustodianDataRecoveryKey completed with response: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v15 = *(void *)(a1[5] + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

void __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke_31_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendEmbargoEndNotificationFeedbackWithContext:(id)a3 urlKey:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_193494000, "custodian-authkit/embargo-feedback", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  uint64_t v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "Starting call to send embargo end notification feedback to IdMS with context: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__15;
  v33 = __Block_byref_object_dispose__15;
  uint64_t v13 = self;
  v34 = v13;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke;
  v25[3] = &unk_1E57627C8;
  id v14 = v8;
  id v26 = v14;
  p_long long buf = &buf;
  id v15 = v10;
  id v27 = v15;
  int v16 = (void *)MEMORY[0x1996FE880](v25);
  daemonConnection = v13->_daemonConnection;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_32;
  id v23 = &unk_1E575EAC0;
  id v18 = v16;
  id v24 = v18;
  __int16 v19 = [(AKCustodianDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:&v20];
  objc_msgSend(v19, "sendEmbargoEndNotificationFeedbackWithContext:urlKey:completion:", v14, v9, v18, v20, v21, v22, v23);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);
}

void __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _AKLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) transactionID];
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "sendEmbargoEndNotification completed without error for transactionID: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_32_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performTrustedContactsDataSync:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__15;
  void v25[4] = __Block_byref_object_dispose__15;
  id v8 = self;
  id v26 = v8;
  int v9 = _os_activity_create(&dword_193494000, "custodian-authkit/perform-trustedContacts-sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__AKCustodianController_performTrustedContactsDataSync_completion___block_invoke;
  v21[3] = &unk_1E57627F0;
  id v23 = v25;
  id v10 = v7;
  id v22 = v10;
  uint64_t v11 = (void *)MEMORY[0x1996FE880](v21);
  daemonConnection = v8->_daemonConnection;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__AKCustodianController_performTrustedContactsDataSync_completion___block_invoke_2;
  v19[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v20 = v13;
  id v14 = [(AKCustodianDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v19];
  id v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Starting call to perform trusted contacts data sync with IdMS: %@", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__AKCustodianController_performTrustedContactsDataSync_completion___block_invoke_34;
  v17[3] = &unk_1E5762818;
  id v16 = v13;
  id v18 = v16;
  [v14 performTrustedContactsDataSync:v6 completion:v17];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);
}

void __67__AKCustodianController_performTrustedContactsDataSync_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __67__AKCustodianController_performTrustedContactsDataSync_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_32_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__AKCustodianController_performTrustedContactsDataSync_completion___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 debugDescription];
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Result of trusted contacts data sync call: %@. Error: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "%@ deallocated", v1, 0xCu);
}

- (void).cxx_destruct
{
}

void __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Initiated Custodian with remote custodian service returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Finalized Custodian setup with remote custodian service returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Error finalizing custodianship: %{public}@", v2, v3, v4, v5, v6);
}

void __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Revoke custodian with remote custodian service returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Error revoking custodianship: %{public}@", v2, v3, v4, v5, v6);
}

void __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Update recovery key returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Error updating recovery key: %{public}@", v2, v3, v4, v5, v6);
}

void __77__AKCustodianController_startCustodianRecoveryRequestWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "startCustodianRecoveryRequestWithContext completed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __79__AKCustodianController_fetchCustodianRecoveryCodeConfigurationWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch custodian recovery code configuration with error: %{public}@", v2, v3, v4, v5, v6);
}

void __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "startCustodianRecoveryTransactionWithContext completed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "XPC Connection failed or interrupted with error: %@ on call: startCustodianRecoveryTransactionWithContext", v2, v3, v4, v5, v6);
}

void __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "fetchCustodianRecoveryTokenWithContext completed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke_30_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "XPC Connection failed or interrupted with error: %@ on call: fetchCustodianRecoveryTokenWithContext", v2, v3, v4, v5, v6);
}

void __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch custodian data recovery key with error: %{public}@", v2, v3, v4, v5, v6);
}

void __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "XPC Connection failed or interrupted with error: %@ on call: fetchCustodianDataRecoveryKeyWithContext", v2, v3, v4, v5, v6);
}

void __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "sendEmbargoEndNotificationFeedback failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "XPC Connection failed or interrupted with error: %@ on call: sendEmbargoEndNotificationFeedbackWithContext", v2, v3, v4, v5, v6);
}

@end