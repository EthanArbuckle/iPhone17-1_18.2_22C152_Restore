@interface AKSignInWithAppleController
- (AAFXPCSession)remoteService;
- (AKSignInWithAppleController)init;
- (AKSignInWithAppleController)initWithXPCSession:(id)a3;
- (void)cancelAppIconRequestForClientID:(id)a3 completion:(id)a4;
- (void)configureRemoteInterface:(id)a3;
- (void)deleteAllItemsFromDepartedGroupWithContext:(id)a3 completion:(id)a4;
- (void)fetchAccountsWithContext:(id)a3 completion:(id)a4;
- (void)fetchAppIconForClientID:(id)a3 iconSize:(CGSize)a4 completion:(id)a5;
- (void)fetchEULAForClientID:(id)a3 completion:(id)a4;
- (void)fetchSharedGroupsWithContext:(id)a3 completion:(id)a4;
- (void)fetchSignInWithApplePrivateEmailCountWithCompletion:(id)a3;
- (void)leaveGroupWithContext:(id)a3 completion:(id)a4;
- (void)participantRemovedWithContext:(id)a3 participantID:(id)a4 completion:(id)a5;
- (void)performHealthCheckWithContext:(id)a3 completion:(id)a4;
- (void)performTokenRotationWithContext:(id)a3 completion:(id)a4;
- (void)remoteServiceDidInterrupt;
- (void)remoteServiceDidInvalidate;
- (void)revokeAcccountWithContext:(id)a3 completion:(id)a4;
- (void)setRemoteService:(id)a3;
- (void)shareAccountWithContext:(id)a3 withGroup:(id)a4 completion:(id)a5;
- (void)unshareAccountWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKSignInWithAppleController

- (AKSignInWithAppleController)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F47010]) initWithServiceName:@"com.apple.ak.signinwithapple.xpc" remoteProtocol:&unk_1EE462470 options:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F47008]) initWithRemoteServiceConfig:v3 delegate:self];
  v5 = [(AKSignInWithAppleController *)self initWithXPCSession:v4];

  return v5;
}

- (AKSignInWithAppleController)initWithXPCSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKSignInWithAppleController;
  v6 = [(AKSignInWithAppleController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteService, a3);
    [(AAFXPCSession *)v7->_remoteService resume];
  }

  return v7;
}

- (void)remoteServiceDidInterrupt
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Connection to SignInWithApple remote service was interrupted", v1, 2u);
}

- (void)remoteServiceDidInvalidate
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Connection to SignInWithApple remote service was invalidated", v1, 2u);
}

- (void)configureRemoteInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v10 forSelector:sel_fetchAccountsWithContext_completion_ argumentIndex:0 ofReply:1];
  [v4 setClasses:v10 forSelector:sel_fetchAppIconForClientID_iconSize_completion_ argumentIndex:0 ofReply:1];
  [v4 setClasses:v10 forSelector:sel_shareAccountWithContext_withGroup_completion_ argumentIndex:0 ofReply:1];
}

- (void)fetchAccountsWithContext:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_193494000, "SignInWithApple/fetchAccounts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  v13 = _AKSignpostLogSystem();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwAFetchAccounts", " enableTelemetry=YES ", buf, 2u);
  }

  v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v29 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAFetchAccounts  enableTelemetry=YES ", buf, 0xCu);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__AKSignInWithAppleController_fetchAccountsWithContext_completion___block_invoke;
  v23[3] = &unk_1E57625E0;
  v23[4] = self;
  os_signpost_id_t v25 = v10;
  uint64_t v26 = v12;
  id v16 = v7;
  id v24 = v16;
  v17 = (void *)MEMORY[0x1996FE880](v23);
  remoteService = self->_remoteService;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__AKSignInWithAppleController_fetchAccountsWithContext_completion___block_invoke_101;
  v21[3] = &unk_1E575EAC0;
  id v19 = v17;
  id v22 = v19;
  v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v21];
  [v20 fetchAccountsWithContext:v6 completion:v19];

  os_activity_scope_leave(&state);
}

void __67__AKSignInWithAppleController_fetchAccountsWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v8 = _AKSignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v18 = 67240192;
    LODWORD(v19) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SiwAFetchAccounts", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  uint64_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    int v14 = [v6 code];
    int v18 = 134218496;
    uint64_t v19 = v13;
    __int16 v20 = 2048;
    double v21 = v12;
    __int16 v22 = 1026;
    int v23 = v14;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAFetchAccounts  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  v15 = _AKLogSiwa();
  id v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "Completed fetch SiwA accounts successfully", (uint8_t *)&v18, 2u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __67__AKSignInWithAppleController_fetchAccountsWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v17 = a1[5];
  if (v17) {
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);
  }
}

uint64_t __67__AKSignInWithAppleController_fetchAccountsWithContext_completion___block_invoke_101(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)revokeAcccountWithContext:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_193494000, "SignInWithApple/revokeAccount", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AKSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwARevokeAccount", " enableTelemetry=YES ", buf, 2u);
  }

  v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v32 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwARevokeAccount  enableTelemetry=YES ", buf, 0xCu);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__AKSignInWithAppleController_revokeAcccountWithContext_completion___block_invoke;
  v26[3] = &unk_1E575F120;
  os_signpost_id_t v28 = v10;
  uint64_t v29 = v12;
  id v16 = v7;
  id v27 = v16;
  uint64_t v17 = (void *)MEMORY[0x1996FE880](v26);
  remoteService = self->_remoteService;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  int v23 = __68__AKSignInWithAppleController_revokeAcccountWithContext_completion___block_invoke_104;
  uint64_t v24 = &unk_1E575EAC0;
  id v19 = v17;
  id v25 = v19;
  __int16 v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:&v21];
  objc_msgSend(v20, "revokeAcccountWithContext:completion:", v6, v19, v21, v22, v23, v24);

  os_activity_scope_leave(&state);
}

void __68__AKSignInWithAppleController_revokeAcccountWithContext_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  id v7 = _AKSignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwARevokeAccount", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  os_signpost_id_t v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[5];
    int v13 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwARevokeAccount  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  int v14 = _AKLogSiwa();
  v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Successfully revoked SiwA account", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __68__AKSignInWithAppleController_revokeAcccountWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __68__AKSignInWithAppleController_revokeAcccountWithContext_completion___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchEULAForClientID:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_193494000, "SignInWithApple/appEULAFetch", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  int v13 = _AKSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwAFetchEULA", " enableTelemetry=YES ", buf, 2u);
  }

  v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v29 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAFetchEULA  enableTelemetry=YES ", buf, 0xCu);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__AKSignInWithAppleController_fetchEULAForClientID_completion___block_invoke;
  v23[3] = &unk_1E5762608;
  v23[4] = self;
  os_signpost_id_t v25 = v10;
  uint64_t v26 = v12;
  id v16 = v7;
  id v24 = v16;
  int v17 = (void *)MEMORY[0x1996FE880](v23);
  remoteService = self->_remoteService;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__AKSignInWithAppleController_fetchEULAForClientID_completion___block_invoke_106;
  v21[3] = &unk_1E575EAC0;
  id v19 = v17;
  id v22 = v19;
  double v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v21];
  [v20 fetchEULAForClientID:v6 completion:v16];

  os_activity_scope_leave(&state);
}

void __63__AKSignInWithAppleController_fetchEULAForClientID_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  uint64_t v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v19 = 67240192;
    LODWORD(v20) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SiwAFetchEULA", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    int v14 = [v6 code];
    int v19 = 134218496;
    uint64_t v20 = v13;
    __int16 v21 = 2048;
    double v22 = v12;
    __int16 v23 = 1026;
    int v24 = v14;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAFetchEULA  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  uint64_t v15 = [v5 length];
  id v16 = _AKLogSiwa();
  int v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "Successfully fetched EULA", (uint8_t *)&v19, 2u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    __63__AKSignInWithAppleController_fetchEULAForClientID_completion___block_invoke_cold_1();
  }

  uint64_t v18 = a1[5];
  if (v18) {
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v5, v6);
  }
}

uint64_t __63__AKSignInWithAppleController_fetchEULAForClientID_completion___block_invoke_106(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAppIconForClientID:(id)a3 iconSize:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_193494000, "SignInWithApple/appIconFetch", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  double v12 = _AKSignpostLogSystem();
  os_signpost_id_t v13 = _AKSignpostCreate(v12);
  uint64_t v15 = v14;

  id v16 = _AKSignpostLogSystem();
  int v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SiwAFetchAppIcon", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v18 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v35 = v13;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAFetchAppIcon  enableTelemetry=YES ", buf, 0xCu);
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __75__AKSignInWithAppleController_fetchAppIconForClientID_iconSize_completion___block_invoke;
  v29[3] = &unk_1E5762630;
  os_signpost_id_t v31 = v13;
  uint64_t v32 = v15;
  id v19 = v10;
  id v30 = v19;
  uint64_t v20 = (void *)MEMORY[0x1996FE880](v29);
  remoteService = self->_remoteService;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __75__AKSignInWithAppleController_fetchAppIconForClientID_iconSize_completion___block_invoke_108;
  id v27 = &unk_1E575EAC0;
  id v22 = v20;
  id v28 = v22;
  __int16 v23 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:&v24];
  objc_msgSend(v23, "fetchAppIconForClientID:iconSize:completion:", v9, v19, width, height, v24, v25, v26, v27);

  os_activity_scope_leave(&state);
}

void __75__AKSignInWithAppleController_fetchAppIconForClientID_iconSize_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v8 = _AKSignpostLogSystem();
  id v9 = v8;
  os_signpost_id_t v10 = a1[5];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v19 = 67240192;
    LODWORD(v20) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SiwAFetchAppIcon", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[5];
    int v14 = [v6 code];
    int v19 = 134218496;
    uint64_t v20 = v13;
    __int16 v21 = 2048;
    double v22 = v12;
    __int16 v23 = 1026;
    int v24 = v14;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAFetchAppIcon  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  uint64_t v15 = [v5 data];

  id v16 = _AKLogSiwa();
  int v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "Successfully fetched app icon", (uint8_t *)&v19, 2u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    __75__AKSignInWithAppleController_fetchAppIconForClientID_iconSize_completion___block_invoke_cold_1();
  }

  uint64_t v18 = a1[4];
  if (v18) {
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v5, v6);
  }
}

uint64_t __75__AKSignInWithAppleController_fetchAppIconForClientID_iconSize_completion___block_invoke_108(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelAppIconRequestForClientID:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_193494000, "SignInWithApple/cancelAppIconFetch", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AKSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwACancelAppIcon", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v32 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwACancelAppIcon  enableTelemetry=YES ", buf, 0xCu);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__AKSignInWithAppleController_cancelAppIconRequestForClientID_completion___block_invoke;
  v26[3] = &unk_1E575F120;
  os_signpost_id_t v28 = v10;
  uint64_t v29 = v12;
  id v16 = v7;
  id v27 = v16;
  int v17 = (void *)MEMORY[0x1996FE880](v26);
  remoteService = self->_remoteService;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  __int16 v23 = __74__AKSignInWithAppleController_cancelAppIconRequestForClientID_completion___block_invoke_109;
  int v24 = &unk_1E575EAC0;
  id v19 = v17;
  id v25 = v19;
  uint64_t v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:&v21];
  objc_msgSend(v20, "cancelAppIconRequestForClientID:completion:", v6, v16, v21, v22, v23, v24);

  os_activity_scope_leave(&state);
}

void __74__AKSignInWithAppleController_cancelAppIconRequestForClientID_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  id v7 = _AKSignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwACancelAppIcon", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  os_signpost_id_t v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[5];
    int v13 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwACancelAppIcon  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  int v14 = _AKLogSiwa();
  uint64_t v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Successfully cancel app icon fetch", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __74__AKSignInWithAppleController_cancelAppIconRequestForClientID_completion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __74__AKSignInWithAppleController_cancelAppIconRequestForClientID_completion___block_invoke_109(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)shareAccountWithContext:(id)a3 withGroup:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = _os_activity_create(&dword_193494000, "SignInWithApple/shareCredential", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  uint64_t v12 = _AKSignpostLogSystem();
  os_signpost_id_t v13 = _AKSignpostCreate(v12);
  uint64_t v15 = v14;

  uint64_t v16 = _AKSignpostLogSystem();
  int v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SiwAShareCredential", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v18 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v32 = v13;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAShareCredential  enableTelemetry=YES ", buf, 0xCu);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__AKSignInWithAppleController_shareAccountWithContext_withGroup_completion___block_invoke;
  v26[3] = &unk_1E5762658;
  void v26[4] = self;
  os_signpost_id_t v28 = v13;
  uint64_t v29 = v15;
  id v19 = v10;
  id v27 = v19;
  double v20 = (void *)MEMORY[0x1996FE880](v26);
  remoteService = self->_remoteService;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __76__AKSignInWithAppleController_shareAccountWithContext_withGroup_completion___block_invoke_111;
  v24[3] = &unk_1E575EAC0;
  id v22 = v20;
  id v25 = v22;
  uint64_t v23 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v24];
  [v23 shareAccountWithContext:v8 withGroup:v9 completion:v22];

  os_activity_scope_leave(&state);
}

void __76__AKSignInWithAppleController_shareAccountWithContext_withGroup_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v8 = _AKSignpostLogSystem();
  id v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v18 = 67240192;
    LODWORD(v19) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SiwAShareCredential", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  double v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[6];
    int v14 = [v6 code];
    int v18 = 134218496;
    uint64_t v19 = v13;
    __int16 v20 = 2048;
    double v21 = v12;
    __int16 v22 = 1026;
    int v23 = v14;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAShareCredential  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  uint64_t v15 = _AKLogSiwa();
  uint64_t v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "SiwA account shared successfully", (uint8_t *)&v18, 2u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __76__AKSignInWithAppleController_shareAccountWithContext_withGroup_completion___block_invoke_cold_1();
  }

  uint64_t v17 = a1[5];
  if (v17) {
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);
  }
}

uint64_t __76__AKSignInWithAppleController_shareAccountWithContext_withGroup_completion___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unshareAccountWithContext:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_193494000, "SignInWithApple/unshareCredential", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AKSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwAUnshareCredential", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v32 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAUnshareCredential  enableTelemetry=YES ", buf, 0xCu);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__AKSignInWithAppleController_unshareAccountWithContext_completion___block_invoke;
  v26[3] = &unk_1E575F120;
  os_signpost_id_t v28 = v10;
  uint64_t v29 = v12;
  id v16 = v7;
  id v27 = v16;
  uint64_t v17 = (void *)MEMORY[0x1996FE880](v26);
  remoteService = self->_remoteService;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  int v23 = __68__AKSignInWithAppleController_unshareAccountWithContext_completion___block_invoke_112;
  uint64_t v24 = &unk_1E575EAC0;
  id v19 = v17;
  id v25 = v19;
  __int16 v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:&v21];
  objc_msgSend(v20, "unshareAccountWithContext:completion:", v6, v19, v21, v22, v23, v24);

  os_activity_scope_leave(&state);
}

void __68__AKSignInWithAppleController_unshareAccountWithContext_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  id v7 = _AKSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwAUnshareCredential", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  os_signpost_id_t v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[5];
    int v13 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAUnshareCredential  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  int v14 = _AKLogSiwa();
  uint64_t v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Successfully unshared SiwA account", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __68__AKSignInWithAppleController_unshareAccountWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __68__AKSignInWithAppleController_unshareAccountWithContext_completion___block_invoke_112(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)leaveGroupWithContext:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_193494000, "SignInWithApple/leaveGroup", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  int v13 = _AKSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwALeaveGroup", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v32 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwALeaveGroup  enableTelemetry=YES ", buf, 0xCu);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__AKSignInWithAppleController_leaveGroupWithContext_completion___block_invoke;
  v26[3] = &unk_1E575F120;
  os_signpost_id_t v28 = v10;
  uint64_t v29 = v12;
  id v16 = v7;
  id v27 = v16;
  int v17 = (void *)MEMORY[0x1996FE880](v26);
  remoteService = self->_remoteService;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __64__AKSignInWithAppleController_leaveGroupWithContext_completion___block_invoke_113;
  uint64_t v24 = &unk_1E575EAC0;
  id v19 = v17;
  id v25 = v19;
  double v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:&v21];
  objc_msgSend(v20, "leaveGroupWithContext:completion:", v6, v19, v21, v22, v23, v24);

  os_activity_scope_leave(&state);
}

void __64__AKSignInWithAppleController_leaveGroupWithContext_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  id v7 = _AKSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwALeaveGroup", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  os_signpost_id_t v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[5];
    int v13 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwALeaveGroup  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  int v14 = _AKLogSiwa();
  uint64_t v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Successfully completed group departure", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __64__AKSignInWithAppleController_leaveGroupWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __64__AKSignInWithAppleController_leaveGroupWithContext_completion___block_invoke_113(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteAllItemsFromDepartedGroupWithContext:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_193494000, "SignInWithApple/deleteGroupItems", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  int v13 = _AKSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwADeleteGroupItems", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v32 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwADeleteGroupItems  enableTelemetry=YES ", buf, 0xCu);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __85__AKSignInWithAppleController_deleteAllItemsFromDepartedGroupWithContext_completion___block_invoke;
  v26[3] = &unk_1E575F120;
  os_signpost_id_t v28 = v10;
  uint64_t v29 = v12;
  id v16 = v7;
  id v27 = v16;
  int v17 = (void *)MEMORY[0x1996FE880](v26);
  remoteService = self->_remoteService;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __85__AKSignInWithAppleController_deleteAllItemsFromDepartedGroupWithContext_completion___block_invoke_114;
  uint64_t v24 = &unk_1E575EAC0;
  id v19 = v17;
  id v25 = v19;
  double v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:&v21];
  objc_msgSend(v20, "deleteAllItemsFromDepartedGroupWithContext:completion:", v6, v19, v21, v22, v23, v24);

  os_activity_scope_leave(&state);
}

void __85__AKSignInWithAppleController_deleteAllItemsFromDepartedGroupWithContext_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  id v7 = _AKSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwADeleteGroupItems", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  os_signpost_id_t v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[5];
    int v13 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwADeleteGroupItems  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  int v14 = _AKLogSiwa();
  uint64_t v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Successfully deleted all items from group", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __85__AKSignInWithAppleController_deleteAllItemsFromDepartedGroupWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __85__AKSignInWithAppleController_deleteAllItemsFromDepartedGroupWithContext_completion___block_invoke_114(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)participantRemovedWithContext:(id)a3 participantID:(id)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = _os_activity_create(&dword_193494000, "SignInWithApple/participantRemoved", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  uint64_t v12 = _AKSignpostLogSystem();
  os_signpost_id_t v13 = _AKSignpostCreate(v12);
  uint64_t v15 = v14;

  uint64_t v16 = _AKSignpostLogSystem();
  int v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SiwAParticipantRemoved", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v18 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v35 = v13;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAParticipantRemoved  enableTelemetry=YES ", buf, 0xCu);
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __86__AKSignInWithAppleController_participantRemovedWithContext_participantID_completion___block_invoke;
  v29[3] = &unk_1E575F120;
  os_signpost_id_t v31 = v13;
  uint64_t v32 = v15;
  id v19 = v10;
  id v30 = v19;
  double v20 = (void *)MEMORY[0x1996FE880](v29);
  remoteService = self->_remoteService;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __86__AKSignInWithAppleController_participantRemovedWithContext_participantID_completion___block_invoke_115;
  id v27 = &unk_1E575EAC0;
  id v22 = v20;
  id v28 = v22;
  uint64_t v23 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:&v24];
  objc_msgSend(v23, "participantRemovedWithContext:participantID:completion:", v8, v9, v22, v24, v25, v26, v27);

  os_activity_scope_leave(&state);
}

void __86__AKSignInWithAppleController_participantRemovedWithContext_participantID_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  id v7 = _AKSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwAParticipantRemoved", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  id v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[5];
    int v13 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAParticipantRemoved  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  uint64_t v14 = _AKLogSiwa();
  uint64_t v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Successfully performed actions after participant removal.", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __86__AKSignInWithAppleController_participantRemovedWithContext_participantID_completion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __86__AKSignInWithAppleController_participantRemovedWithContext_participantID_completion___block_invoke_115(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSharedGroupsWithContext:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_193494000, "SignInWithApple/fetchSharedGroups", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  int v13 = _AKSignpostLogSystem();
  uint64_t v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwAFetchSharedGroups", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v32 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAFetchSharedGroups  enableTelemetry=YES ", buf, 0xCu);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __71__AKSignInWithAppleController_fetchSharedGroupsWithContext_completion___block_invoke;
  v26[3] = &unk_1E575F120;
  os_signpost_id_t v28 = v10;
  uint64_t v29 = v12;
  id v16 = v7;
  id v27 = v16;
  int v17 = (void *)MEMORY[0x1996FE880](v26);
  remoteService = self->_remoteService;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __71__AKSignInWithAppleController_fetchSharedGroupsWithContext_completion___block_invoke_116;
  uint64_t v24 = &unk_1E575EAC0;
  id v19 = v17;
  id v25 = v19;
  double v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:&v21];
  objc_msgSend(v20, "fetchSharedGroupsWithContext:completion:", v6, v19, v21, v22, v23, v24);

  os_activity_scope_leave(&state);
}

void __71__AKSignInWithAppleController_fetchSharedGroupsWithContext_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  id v7 = _AKSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwAFetchSharedGroups", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  os_signpost_id_t v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[5];
    int v13 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAFetchSharedGroups  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  uint64_t v14 = _AKLogSiwa();
  uint64_t v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Successfully fetched shared groups", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __71__AKSignInWithAppleController_fetchSharedGroupsWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __71__AKSignInWithAppleController_fetchSharedGroupsWithContext_completion___block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performTokenRotationWithContext:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_193494000, "SignInWithApple/performTokenRotation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  int v13 = _AKSignpostLogSystem();
  uint64_t v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwAPerformTokenRotation", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v32 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAPerformTokenRotation  enableTelemetry=YES ", buf, 0xCu);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__AKSignInWithAppleController_performTokenRotationWithContext_completion___block_invoke;
  v26[3] = &unk_1E575F120;
  os_signpost_id_t v28 = v10;
  uint64_t v29 = v12;
  id v16 = v7;
  id v27 = v16;
  int v17 = (void *)MEMORY[0x1996FE880](v26);
  remoteService = self->_remoteService;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __74__AKSignInWithAppleController_performTokenRotationWithContext_completion___block_invoke_117;
  uint64_t v24 = &unk_1E575EAC0;
  id v19 = v17;
  id v25 = v19;
  double v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:&v21];
  objc_msgSend(v20, "performTokenRotationWithContext:completion:", v6, v19, v21, v22, v23, v24);

  os_activity_scope_leave(&state);
}

void __74__AKSignInWithAppleController_performTokenRotationWithContext_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  id v7 = _AKSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwAPerformTokenRotation", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  os_signpost_id_t v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[5];
    int v13 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAPerformTokenRotation  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  uint64_t v14 = _AKLogSiwa();
  uint64_t v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Successfully performed token rotation", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __74__AKSignInWithAppleController_performTokenRotationWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __74__AKSignInWithAppleController_performTokenRotationWithContext_completion___block_invoke_117(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performHealthCheckWithContext:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_193494000, "SignInWithApple/performHealthCheck", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  int v13 = _AKSignpostLogSystem();
  uint64_t v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwAPerformHealthCheck", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v32 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAPerformHealthCheck  enableTelemetry=YES ", buf, 0xCu);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __72__AKSignInWithAppleController_performHealthCheckWithContext_completion___block_invoke;
  v26[3] = &unk_1E575F120;
  os_signpost_id_t v28 = v10;
  uint64_t v29 = v12;
  id v16 = v7;
  id v27 = v16;
  int v17 = (void *)MEMORY[0x1996FE880](v26);
  remoteService = self->_remoteService;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __72__AKSignInWithAppleController_performHealthCheckWithContext_completion___block_invoke_118;
  uint64_t v24 = &unk_1E575EAC0;
  id v19 = v17;
  id v25 = v19;
  double v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:&v21];
  objc_msgSend(v20, "performHealthCheckWithContext:completion:", v6, v19, v21, v22, v23, v24);

  os_activity_scope_leave(&state);
}

void __72__AKSignInWithAppleController_performHealthCheckWithContext_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  id v7 = _AKSignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwAPerformHealthCheck", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  os_signpost_id_t v10 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[5];
    int v13 = [v5 code];
    int v17 = 134218496;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAPerformHealthCheck  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  uint64_t v14 = _AKLogSiwa();
  uint64_t v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Successfully performed health check", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __72__AKSignInWithAppleController_performHealthCheckWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __72__AKSignInWithAppleController_performHealthCheckWithContext_completion___block_invoke_118(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSignInWithApplePrivateEmailCountWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_193494000, "SignInWithApple/fetchSIWAHMECount", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AKSignpostLogSystem();
  os_signpost_id_t v7 = _AKSignpostCreate(v6);
  uint64_t v9 = v8;

  os_signpost_id_t v10 = _AKSignpostLogSystem();
  double v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SiwAFetchHMECount", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v12 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v29 = v7;
    _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAFetchHMECount  enableTelemetry=YES ", buf, 0xCu);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __83__AKSignInWithAppleController_fetchSignInWithApplePrivateEmailCountWithCompletion___block_invoke;
  v23[3] = &unk_1E5762680;
  os_signpost_id_t v25 = v7;
  uint64_t v26 = v9;
  id v13 = v4;
  id v24 = v13;
  uint64_t v14 = (void *)MEMORY[0x1996FE880](v23);
  remoteService = self->_remoteService;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  double v20 = __83__AKSignInWithAppleController_fetchSignInWithApplePrivateEmailCountWithCompletion___block_invoke_120;
  __int16 v21 = &unk_1E575EAC0;
  id v16 = v14;
  id v22 = v16;
  int v17 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:&v18];
  objc_msgSend(v17, "fetchSignInWithApplePrivateEmailCountWithCompletion:", v16, v18, v19, v20, v21);

  os_activity_scope_leave(&state);
}

void __83__AKSignInWithAppleController_fetchSignInWithApplePrivateEmailCountWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v8 = _AKSignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = a1[5];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v18 = 67240192;
    LODWORD(v19) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SiwAFetchHMECount", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  double v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = a1[5];
    int v14 = [v6 code];
    int v18 = 134218496;
    uint64_t v19 = v13;
    __int16 v20 = 2048;
    double v21 = v12;
    __int16 v22 = 1026;
    int v23 = v14;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAFetchHMECount  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  uint64_t v15 = _AKLogSiwa();
  id v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "Successfully fetched SIWA HME Count", (uint8_t *)&v18, 2u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __83__AKSignInWithAppleController_fetchSignInWithApplePrivateEmailCountWithCompletion___block_invoke_cold_1();
  }

  uint64_t v17 = a1[4];
  if (v17) {
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);
  }
}

uint64_t __83__AKSignInWithAppleController_fetchSignInWithApplePrivateEmailCountWithCompletion___block_invoke_120(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
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

void __67__AKSignInWithAppleController_fetchAccountsWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Fetch SiwA accounts failed with error: %@", v2, v3, v4, v5, v6);
}

void __68__AKSignInWithAppleController_revokeAcccountWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to revoke SiwA account with error: %@", v2, v3, v4, v5, v6);
}

void __63__AKSignInWithAppleController_fetchEULAForClientID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch EULA with error: %@", v2, v3, v4, v5, v6);
}

void __75__AKSignInWithAppleController_fetchAppIconForClientID_iconSize_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch app icon with error: %@", v2, v3, v4, v5, v6);
}

void __74__AKSignInWithAppleController_cancelAppIconRequestForClientID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to cancel app icon fetch with error: %@", v2, v3, v4, v5, v6);
}

void __76__AKSignInWithAppleController_shareAccountWithContext_withGroup_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "SiwA account sharing failed with error: %@", v2, v3, v4, v5, v6);
}

void __68__AKSignInWithAppleController_unshareAccountWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to unshare SiwA account with error: %@", v2, v3, v4, v5, v6);
}

void __64__AKSignInWithAppleController_leaveGroupWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to complete group departure with error: %@", v2, v3, v4, v5, v6);
}

void __85__AKSignInWithAppleController_deleteAllItemsFromDepartedGroupWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to deleted all items from group with error: %@", v2, v3, v4, v5, v6);
}

void __86__AKSignInWithAppleController_participantRemovedWithContext_participantID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to perform actions after participant removal with error: %@", v2, v3, v4, v5, v6);
}

void __71__AKSignInWithAppleController_fetchSharedGroupsWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch shared groups with error: %@", v2, v3, v4, v5, v6);
}

void __74__AKSignInWithAppleController_performTokenRotationWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to perform token rotation with error: %@", v2, v3, v4, v5, v6);
}

void __72__AKSignInWithAppleController_performHealthCheckWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to perform health check with error: %@", v2, v3, v4, v5, v6);
}

void __83__AKSignInWithAppleController_fetchSignInWithApplePrivateEmailCountWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to fetch SIWA HME count with error: %@", v2, v3, v4, v5, v6);
}

@end