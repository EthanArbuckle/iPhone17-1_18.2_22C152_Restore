@interface AKInheritanceController
- (AAFXPCSession)remoteService;
- (AKInheritanceController)init;
- (AKInheritanceController)initWithXPCSession:(id)a3;
- (void)_setupBeneficiaryAliasWithInheritanceContext:(id)a3 completion:(id)a4;
- (void)fetchManifestOptionsWithInheritanceContext:(id)a3 completion:(id)a4;
- (void)removeBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4;
- (void)setRemoteService:(id)a3;
- (void)setupBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4;
- (void)updateBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4;
@end

@implementation AKInheritanceController

- (AKInheritanceController)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F47010]) initWithServiceName:@"com.apple.ak.inheritance.xpc" remoteProtocol:&unk_1EE442D68 options:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F47008]) initWithRemoteServiceConfig:v3 delegate:self];
  v5 = [(AKInheritanceController *)self initWithXPCSession:v4];

  return v5;
}

- (AKInheritanceController)initWithXPCSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKInheritanceController;
  v6 = [(AKInheritanceController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteService, a3);
    [(AAFXPCSession *)v7->_remoteService resume];
  }

  return v7;
}

- (void)fetchManifestOptionsWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "inheritance-authkit/fetch-dataclass-rules", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
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
  v17[2] = __81__AKInheritanceController_fetchManifestOptionsWithInheritanceContext_completion___block_invoke;
  v17[3] = &unk_1E575F778;
  v19 = v20;
  id v10 = v7;
  id v18 = v10;
  v11 = (void *)MEMORY[0x1996FE880](v17);
  remoteService = v9->_remoteService;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__AKInheritanceController_fetchManifestOptionsWithInheritanceContext_completion___block_invoke_2;
  v15[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v16 = v13;
  v14 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v15];
  [v14 fetchManifestOptionsWithInheritanceContext:v6 completion:v13];

  _Block_object_dispose(v20, 8);
  os_activity_scope_leave(&state);
}

void __81__AKInheritanceController_fetchManifestOptionsWithInheritanceContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__AKInheritanceController_fetchManifestOptionsWithInheritanceContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __81__AKInheritanceController_fetchManifestOptionsWithInheritanceContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setupBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_193494000, "inheritance-authkit/persist-manifest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
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
  v17[2] = __77__AKInheritanceController_setupBeneficiaryWithInheritanceContext_completion___block_invoke;
  v17[3] = &unk_1E575F1E8;
  v19 = v20;
  id v10 = v7;
  id v18 = v10;
  v11 = (void *)MEMORY[0x1996FE880](v17);
  remoteService = v9->_remoteService;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__AKInheritanceController_setupBeneficiaryWithInheritanceContext_completion___block_invoke_2;
  v15[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v16 = v13;
  v14 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v15];
  [v14 setupBeneficiaryWithInheritanceContext:v6 completion:v13];

  _Block_object_dispose(v20, 8);
  os_activity_scope_leave(&state);
}

void __77__AKInheritanceController_setupBeneficiaryWithInheritanceContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
  id v5 = a2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__AKInheritanceController_setupBeneficiaryWithInheritanceContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__AKInheritanceController_setupBeneficiaryWithInheritanceContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_193494000, "inheritance-authkit/update-beneficiary", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
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
  v17[2] = __78__AKInheritanceController_updateBeneficiaryWithInheritanceContext_completion___block_invoke;
  v17[3] = &unk_1E575F1E8;
  v19 = v20;
  id v10 = v7;
  id v18 = v10;
  v11 = (void *)MEMORY[0x1996FE880](v17);
  remoteService = v9->_remoteService;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__AKInheritanceController_updateBeneficiaryWithInheritanceContext_completion___block_invoke_2;
  v15[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v16 = v13;
  v14 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v15];
  [v14 updateBeneficiaryWithInheritanceContext:v6 completion:v13];

  _Block_object_dispose(v20, 8);
  os_activity_scope_leave(&state);
}

void __78__AKInheritanceController_updateBeneficiaryWithInheritanceContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
  id v5 = a2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__AKInheritanceController_updateBeneficiaryWithInheritanceContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__AKInheritanceController_updateBeneficiaryWithInheritanceContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_193494000, "inheritance-authkit/remove-beneficiary", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
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
  v17[2] = __78__AKInheritanceController_removeBeneficiaryWithInheritanceContext_completion___block_invoke;
  v17[3] = &unk_1E575F1E8;
  v19 = v20;
  id v10 = v7;
  id v18 = v10;
  v11 = (void *)MEMORY[0x1996FE880](v17);
  remoteService = v9->_remoteService;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__AKInheritanceController_removeBeneficiaryWithInheritanceContext_completion___block_invoke_2;
  v15[3] = &unk_1E575EAC0;
  id v13 = v11;
  id v16 = v13;
  v14 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v15];
  [v14 removeBeneficiaryWithInheritanceContext:v6 completion:v13];

  _Block_object_dispose(v20, 8);
  os_activity_scope_leave(&state);
}

void __78__AKInheritanceController_removeBeneficiaryWithInheritanceContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
  id v5 = a2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__AKInheritanceController_removeBeneficiaryWithInheritanceContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__AKInheritanceController_removeBeneficiaryWithInheritanceContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setupBeneficiaryAliasWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AKDevice currentDevice];
  char v9 = [v8 isInternalBuild];

  if (v9)
  {
    id v10 = _os_activity_create(&dword_193494000, "inheritance-authkit/create-beneficiary-alias", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__1;
    v22[4] = __Block_byref_object_dispose__1;
    v11 = self;
    v23 = v11;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __83__AKInheritanceController__setupBeneficiaryAliasWithInheritanceContext_completion___block_invoke;
    v19[3] = &unk_1E575F7A0;
    v21 = v22;
    id v20 = v7;
    v12 = (void *)MEMORY[0x1996FE880](v19);
    remoteService = v11->_remoteService;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __83__AKInheritanceController__setupBeneficiaryAliasWithInheritanceContext_completion___block_invoke_2;
    v17[3] = &unk_1E575EAC0;
    id v14 = v12;
    id v18 = v14;
    v15 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v17];
    [v15 _setupBeneficiaryAliasWithInheritanceContext:v6 completion:v14];

    _Block_object_dispose(v22, 8);
    os_activity_scope_leave(&state);
  }
  else
  {
    id v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AKInheritanceController _setupBeneficiaryAliasWithInheritanceContext:completion:](v16);
    }

    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7026);
    (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v10);
  }
}

void __83__AKInheritanceController__setupBeneficiaryAliasWithInheritanceContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__AKInheritanceController__setupBeneficiaryAliasWithInheritanceContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __83__AKInheritanceController__setupBeneficiaryAliasWithInheritanceContext_completion___block_invoke_2_cold_1();
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

void __81__AKInheritanceController_fetchManifestOptionsWithInheritanceContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to remote inheritance service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __77__AKInheritanceController_setupBeneficiaryWithInheritanceContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to remote inheritance service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __78__AKInheritanceController_updateBeneficiaryWithInheritanceContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to remote inheritance service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

void __78__AKInheritanceController_removeBeneficiaryWithInheritanceContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to remote inheritance service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

- (void)_setupBeneficiaryAliasWithInheritanceContext:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Not an Internal Build. Aborting beneficiary alias setup", v1, 2u);
}

void __83__AKInheritanceController__setupBeneficiaryAliasWithInheritanceContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_193494000, v0, v1, "Connection to remote inheritance service to %s returned an error: %@", v2, v3, v4, v5, 2u);
}

@end