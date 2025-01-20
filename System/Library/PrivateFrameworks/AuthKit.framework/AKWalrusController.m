@interface AKWalrusController
- (AKWalrusController)init;
- (void)PCSAuthContextForWebSessionIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5;
- (void)PCSAuthContextForWebSessionUUID:(id)a3 serviceName:(id)a4 completion:(id)a5;
- (void)postWalrusStateUpdateToServerWithContext:(id)a3 urlBagKey:(id)a4 username:(id)a5 password:(id)a6 completion:(id)a7;
- (void)removeAllPCSAuthCredentialWithCompletion:(id)a3;
- (void)verifyEnableWalrusAllowedWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKWalrusController

- (AKWalrusController)init
{
  v7.receiver = self;
  v7.super_class = (Class)AKWalrusController;
  v2 = [(AKWalrusController *)&v7 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F47010]) initWithServiceName:@"com.apple.ak.walrus.xpc" remoteProtocol:&unk_1EE4622F0 options:0];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F47008]) initWithRemoteServiceConfig:v3 delegate:v2];
    remoteService = v2->_remoteService;
    v2->_remoteService = (AAFXPCSession *)v4;

    [(AAFXPCSession *)v2->_remoteService resume];
  }
  return v2;
}

- (void)PCSAuthContextForWebSessionIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _os_activity_create(&dword_193494000, "walrus-authkit/fetch-pcs-auth-context", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__8;
  v23[4] = __Block_byref_object_dispose__8;
  v12 = self;
  v24 = v12;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__AKWalrusController_PCSAuthContextForWebSessionIdentifier_serviceName_completion___block_invoke;
  v20[3] = &unk_1E57615C8;
  v22 = v23;
  id v13 = v10;
  id v21 = v13;
  v14 = (void *)MEMORY[0x1996FE880](v20);
  remoteService = v12->_remoteService;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__AKWalrusController_PCSAuthContextForWebSessionIdentifier_serviceName_completion___block_invoke_2;
  v18[3] = &unk_1E575EAC0;
  id v16 = v14;
  id v19 = v16;
  v17 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v18];
  [v17 PCSAuthContextForWebSessionIdentifier:v8 serviceName:v9 completion:v16];

  _Block_object_dispose(v23, 8);
  os_activity_scope_leave(&state);
}

void __83__AKWalrusController_PCSAuthContextForWebSessionIdentifier_serviceName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__AKWalrusController_PCSAuthContextForWebSessionIdentifier_serviceName_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __83__AKWalrusController_PCSAuthContextForWebSessionIdentifier_serviceName_completion___block_invoke_2_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)PCSAuthContextForWebSessionUUID:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 UUIDString];
  [(AKWalrusController *)self PCSAuthContextForWebSessionIdentifier:v10 serviceName:v9 completion:v8];
}

- (void)removeAllPCSAuthCredentialWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_193494000, "walrus-authkit/remove-all-pcs-auth-credentials", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__8;
  v17[4] = __Block_byref_object_dispose__8;
  v6 = self;
  v18 = v6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__AKWalrusController_removeAllPCSAuthCredentialWithCompletion___block_invoke;
  v14[3] = &unk_1E575F1E8;
  id v16 = v17;
  id v7 = v4;
  id v15 = v7;
  id v8 = (void *)MEMORY[0x1996FE880](v14);
  remoteService = v6->_remoteService;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__AKWalrusController_removeAllPCSAuthCredentialWithCompletion___block_invoke_2;
  v12[3] = &unk_1E575EAC0;
  id v10 = v8;
  id v13 = v10;
  v11 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v12];
  [v11 removeAllPCSAuthCredentialWithCompletion:v10];

  _Block_object_dispose(v17, 8);
  os_activity_scope_leave(&state);
}

void __63__AKWalrusController_removeAllPCSAuthCredentialWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
  id v5 = a2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__AKWalrusController_removeAllPCSAuthCredentialWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__AKWalrusController_removeAllPCSAuthCredentialWithCompletion___block_invoke_2_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifyEnableWalrusAllowedWithContext:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__8;
  v33[4] = __Block_byref_object_dispose__8;
  id v8 = self;
  v34 = v8;
  id v9 = _os_activity_create(&dword_193494000, "walrus-authkit/verify-walrus-enable-allowed", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  id v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate(v10);
  uint64_t v13 = v12;

  v14 = _AKSignpostLogSystem();
  id v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VerifyEnableWalrusAllowed", " enableTelemetry=YES ", buf, 2u);
  }

  id v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v36 = v11;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: VerifyEnableWalrusAllowed  enableTelemetry=YES ", buf, 0xCu);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke;
  v27[3] = &unk_1E5760E68;
  v29 = v33;
  os_signpost_id_t v30 = v11;
  uint64_t v31 = v13;
  id v17 = v7;
  id v28 = v17;
  v18 = (void *)MEMORY[0x1996FE880](v27);
  remoteService = v8->_remoteService;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_78;
  v25[3] = &unk_1E575EAC0;
  id v20 = v18;
  id v26 = v20;
  id v21 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_79;
  v23[3] = &unk_1E575EAC0;
  id v22 = v20;
  id v24 = v22;
  [v21 verifyEnableWalrusAllowedWithContext:v6 completion:v23];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v33, 8);
}

void __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AKSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "VerifyEnableWalrusAllowed", (const char *)&unk_19357E265, (uint8_t *)&v13, 2u);
  }

  id v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[6];
    int v13 = 134218240;
    uint64_t v14 = v11;
    __int16 v15 = 2048;
    double v16 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:VerifyEnableWalrusAllowed ", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v12 = a1[4];
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);
  }
}

void __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_78(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_78_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_79(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_79_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Successfully verified allowed to enable walrus status.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)postWalrusStateUpdateToServerWithContext:(id)a3 urlBagKey:(id)a4 username:(id)a5 password:(id)a6 completion:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__8;
  v42[4] = __Block_byref_object_dispose__8;
  uint64_t v17 = self;
  v43 = v17;
  v18 = _os_activity_create(&dword_193494000, "walrus-authkit/post-walrus-state-update-to-server", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v18, &state);
  id v19 = _AKSignpostLogSystem();
  os_signpost_id_t v20 = _AKSignpostCreate(v19);
  uint64_t v22 = v21;

  v23 = _AKSignpostLogSystem();
  id v24 = v23;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PostWalrusStateUpdateToServer", " enableTelemetry=YES ", buf, 2u);
  }

  v25 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v45 = v20;
    _os_log_impl(&dword_193494000, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PostWalrusStateUpdateToServer  enableTelemetry=YES ", buf, 0xCu);
  }

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke;
  v36[3] = &unk_1E5760E68;
  v38 = v42;
  os_signpost_id_t v39 = v20;
  uint64_t v40 = v22;
  id v26 = v16;
  id v37 = v26;
  v27 = (void *)MEMORY[0x1996FE880](v36);
  remoteService = v17->_remoteService;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_80;
  v34[3] = &unk_1E575EAC0;
  id v29 = v27;
  id v35 = v29;
  os_signpost_id_t v30 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v34];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_81;
  v32[3] = &unk_1E575EAC0;
  id v31 = v29;
  id v33 = v31;
  [v30 postWalrusStateUpdateToServerWithContext:v12 urlBagKey:v13 username:v14 password:v15 completion:v32];

  os_activity_scope_leave(&state);
  _Block_object_dispose(v42, 8);
}

void __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AKSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PostWalrusStateUpdateToServer", (const char *)&unk_19357E265, (uint8_t *)&v13, 2u);
  }

  id v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[6];
    int v13 = 134218240;
    uint64_t v14 = v11;
    __int16 v15 = 2048;
    double v16 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PostWalrusStateUpdateToServer ", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v12 = a1[4];
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);
  }
}

void __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_80_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_81(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_81_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Successfully posted walrus state update status to server.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __83__AKWalrusController_PCSAuthContextForWebSessionIdentifier_serviceName_completion___block_invoke_2_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_4(&dword_193494000, v2, v3, "Connection to Walrus remote service '%s' returned an error: %@", v4, v5, v6, v7, 2u);
}

void __63__AKWalrusController_removeAllPCSAuthCredentialWithCompletion___block_invoke_2_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_4(&dword_193494000, v2, v3, "Connection to Walrus remote service '%s' returned an error: %@", v4, v5, v6, v7, 2u);
}

void __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_78_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_4(&dword_193494000, v2, v3, "Connection to Walrus remote service '%s' returned an error: %@", v4, v5, v6, v7, 2u);
}

void __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_79_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Error verifying whether user is allowed to enable walrus - %{public}@", (uint8_t *)&v2, 0xCu);
}

void __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_80_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_4(&dword_193494000, v2, v3, "Connection to Walrus remote service '%s' returned an error: %@", v4, v5, v6, v7, 2u);
}

void __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_81_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Error updating walrus state update status to server - %{public}@", (uint8_t *)&v2, 0xCu);
}

@end