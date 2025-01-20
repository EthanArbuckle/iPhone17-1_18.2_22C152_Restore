@interface AKFidoUIController
- (AAFXPCSession)remoteService;
- (AKFidoUIController)init;
- (AKFidoUIController)initWithXPCSession:(id)a3;
- (void)registerFidoKeyWithContext:(id)a3 completion:(id)a4;
- (void)setRemoteService:(id)a3;
- (void)verifyFidoKeyWithContext:(id)a3 completion:(id)a4;
- (void)verifyFidoKeyWithFidoContext:(id)a3 completion:(id)a4;
- (void)verifyFidoRecoveryWithContext:(id)a3 recoveryToken:(id)a4 completion:(id)a5;
@end

@implementation AKFidoUIController

- (AKFidoUIController)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F47010]);
  v4 = (void *)[v3 initWithServiceName:*MEMORY[0x1E4F4EE60] remoteProtocol:&unk_1F1F424B0 options:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F47008]) initWithRemoteServiceConfig:v4 delegate:self];
  v6 = [(AKFidoUIController *)self initWithXPCSession:v5];

  return v6;
}

- (AKFidoUIController)initWithXPCSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKFidoUIController;
  v6 = [(AKFidoUIController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteService, a3);
    [(AAFXPCSession *)v7->_remoteService resume];
  }

  return v7;
}

- (void)registerFidoKeyWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1C38C1000, "fido-authkit/register-key", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  objc_super v9 = self;
  v21 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke;
  v17[3] = &unk_1E6490088;
  v19 = v20;
  id v10 = v7;
  id v18 = v10;
  v11 = (void *)MEMORY[0x1C8777520](v17);
  remoteService = v9->_remoteService;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke_2;
  v15[3] = &unk_1E648EF50;
  id v13 = v11;
  id v16 = v13;
  v14 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v15];
  [v14 registerFidoKeyWithContext:v6 completion:v13];

  _Block_object_dispose(v20, 8);
  os_activity_scope_leave(&state);
}

void __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _AKLogFido();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifyFidoKeyWithFidoContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1C38C1000, "fido-authkit/verify-fido-key", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  objc_super v9 = self;
  v21 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__AKFidoUIController_verifyFidoKeyWithFidoContext_completion___block_invoke;
  v17[3] = &unk_1E64900B0;
  v19 = v20;
  id v10 = v7;
  id v18 = v10;
  v11 = (void *)MEMORY[0x1C8777520](v17);
  remoteService = v9->_remoteService;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__AKFidoUIController_verifyFidoKeyWithFidoContext_completion___block_invoke_2;
  v15[3] = &unk_1E648EF50;
  id v13 = v11;
  id v16 = v13;
  v14 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v15];
  [v14 verifyFidoKeyWithFidoContext:v6 completion:v13];

  _Block_object_dispose(v20, 8);
  os_activity_scope_leave(&state);
}

void __62__AKFidoUIController_verifyFidoKeyWithFidoContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__AKFidoUIController_verifyFidoKeyWithFidoContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _AKLogFido();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__AKFidoUIController_verifyFidoKeyWithFidoContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifyFidoKeyWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1C38C1000, "fido-authkit/verify-context-key", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  objc_super v9 = self;
  v21 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__AKFidoUIController_verifyFidoKeyWithContext_completion___block_invoke;
  v17[3] = &unk_1E64900D8;
  v19 = v20;
  id v10 = v7;
  id v18 = v10;
  v11 = (void *)MEMORY[0x1C8777520](v17);
  remoteService = v9->_remoteService;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__AKFidoUIController_verifyFidoKeyWithContext_completion___block_invoke_2;
  v15[3] = &unk_1E648EF50;
  id v13 = v11;
  id v16 = v13;
  v14 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v15];
  [v14 verifyFidoKeyWithContext:v6 completion:v13];

  _Block_object_dispose(v20, 8);
  os_activity_scope_leave(&state);
}

void __58__AKFidoUIController_verifyFidoKeyWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__AKFidoUIController_verifyFidoKeyWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _AKLogFido();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__AKFidoUIController_verifyFidoKeyWithContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifyFidoRecoveryWithContext:(id)a3 recoveryToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1C38C1000, "fido-authkit/verify-recovery-key", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__1;
  v23[4] = __Block_byref_object_dispose__1;
  v12 = self;
  v24 = v12;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__AKFidoUIController_verifyFidoRecoveryWithContext_recoveryToken_completion___block_invoke;
  v20[3] = &unk_1E64900D8;
  v22 = v23;
  id v13 = v10;
  id v21 = v13;
  v14 = (void *)MEMORY[0x1C8777520](v20);
  remoteService = v12->_remoteService;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__AKFidoUIController_verifyFidoRecoveryWithContext_recoveryToken_completion___block_invoke_2;
  v18[3] = &unk_1E648EF50;
  id v16 = v14;
  id v19 = v16;
  v17 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v18];
  [v17 verifyFidoRecoveryWithContext:v8 recoveryToken:v9 completion:v16];

  _Block_object_dispose(v23, 8);
  os_activity_scope_leave(&state);
}

void __77__AKFidoUIController_verifyFidoRecoveryWithContext_recoveryToken_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__AKFidoUIController_verifyFidoRecoveryWithContext_recoveryToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _AKLogFido();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__AKFidoUIController_verifyFidoRecoveryWithContext_recoveryToken_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AAFXPCSession)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
}

- (void).cxx_destruct
{
}

void __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1C38C1000, v0, v1, "Connection to remote FIDO service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __62__AKFidoUIController_verifyFidoKeyWithFidoContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1C38C1000, v0, v1, "Connection to remote FIDO service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __58__AKFidoUIController_verifyFidoKeyWithContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1C38C1000, v0, v1, "Connection to remote FIDO service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __77__AKFidoUIController_verifyFidoRecoveryWithContext_recoveryToken_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1C38C1000, v0, v1, "Connection to remote FIDO service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

@end