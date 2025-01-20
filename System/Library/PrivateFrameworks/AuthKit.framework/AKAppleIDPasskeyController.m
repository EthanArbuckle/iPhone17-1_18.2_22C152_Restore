@interface AKAppleIDPasskeyController
- (AAFXPCSession)remoteService;
- (AKAppleIDPasskeyController)init;
- (AKAppleIDPasskeyController)initWithXPCSession:(id)a3;
- (void)appleIDPasskeyStatusWithContext:(id)a3 completion:(id)a4;
- (void)remoteServiceDidInterrupt;
- (void)remoteServiceDidInvalidate;
- (void)setRemoteService:(id)a3;
- (void)setupAppleIDPasskeyWithContext:(id)a3 completion:(id)a4;
- (void)unenrollAppleIDPasskeyWithContext:(id)a3 completion:(id)a4;
- (void)verifyAppleIDPasskeyWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKAppleIDPasskeyController

- (AKAppleIDPasskeyController)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F47010]) initWithServiceName:@"com.apple.ak.appleidpasskey.xpc" remoteProtocol:&unk_1EE462230 options:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F47008]) initWithRemoteServiceConfig:v3 delegate:self];
  v5 = [(AKAppleIDPasskeyController *)self initWithXPCSession:v4];

  return v5;
}

- (AKAppleIDPasskeyController)initWithXPCSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAppleIDPasskeyController;
  v6 = [(AKAppleIDPasskeyController *)&v9 init];
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
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Connection to AppleIDPasskey remote service was interrupted", v1, 2u);
}

- (void)remoteServiceDidInvalidate
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Connection to AppleIDPasskey remote service was invalidated", v1, 2u);
}

- (void)setupAppleIDPasskeyWithContext:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "AppleIDPasskey/setupAppleIDPasskey", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_super v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  v13 = _AKSignpostLogSystem();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AppleIDPasskeySetup", " enableTelemetry=YES ", buf, 2u);
  }

  v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v29 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AppleIDPasskeySetup  enableTelemetry=YES ", buf, 0xCu);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__AKAppleIDPasskeyController_setupAppleIDPasskeyWithContext_completion___block_invoke;
  v23[3] = &unk_1E57610C0;
  v23[4] = self;
  os_signpost_id_t v25 = v10;
  uint64_t v26 = v12;
  id v16 = v7;
  id v24 = v16;
  v17 = (void *)MEMORY[0x1996FE880](v23);
  remoteService = self->_remoteService;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__AKAppleIDPasskeyController_setupAppleIDPasskeyWithContext_completion___block_invoke_69;
  v21[3] = &unk_1E575EAC0;
  id v19 = v17;
  id v22 = v19;
  v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v21];
  [v20 setupAppleIDPasskeyWithContext:v6 completion:v19];

  os_activity_scope_leave(&state);
}

void __72__AKAppleIDPasskeyController_setupAppleIDPasskeyWithContext_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AKSignpostLogSystem();
  v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "AppleIDPasskeySetup", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  os_signpost_id_t v10 = _AKSignpostLogSystem();
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
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AppleIDPasskeySetup  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  v14 = _AKLogPasskey();
  v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Completed AppleID passkey setup successfully", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __72__AKAppleIDPasskeyController_setupAppleIDPasskeyWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[5];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __72__AKAppleIDPasskeyController_setupAppleIDPasskeyWithContext_completion___block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifyAppleIDPasskeyWithContext:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "AppleIDPasskey/verifyAppleIDPasskey", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  int v13 = _AKSignpostLogSystem();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AppleIDPasskeyVerification", " enableTelemetry=YES ", buf, 2u);
  }

  v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v29 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AppleIDPasskeyVerification  enableTelemetry=YES ", buf, 0xCu);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__AKAppleIDPasskeyController_verifyAppleIDPasskeyWithContext_completion___block_invoke;
  v23[3] = &unk_1E57610E8;
  v23[4] = self;
  os_signpost_id_t v25 = v10;
  uint64_t v26 = v12;
  id v16 = v7;
  id v24 = v16;
  int v17 = (void *)MEMORY[0x1996FE880](v23);
  remoteService = self->_remoteService;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__AKAppleIDPasskeyController_verifyAppleIDPasskeyWithContext_completion___block_invoke_72;
  v21[3] = &unk_1E575EAC0;
  id v19 = v17;
  id v22 = v19;
  double v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v21];
  [v20 verifyAppleIDPasskeyWithContext:v6 completion:v19];

  os_activity_scope_leave(&state);
}

void __73__AKAppleIDPasskeyController_verifyAppleIDPasskeyWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v18 = 67240192;
    LODWORD(v19) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "AppleIDPasskeyVerification", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
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
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AppleIDPasskeyVerification  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  v15 = _AKLogPasskey();
  id v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "Completed AppleID passkey verification successfully", (uint8_t *)&v18, 2u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __73__AKAppleIDPasskeyController_verifyAppleIDPasskeyWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v17 = a1[5];
  if (v17) {
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);
  }
}

uint64_t __73__AKAppleIDPasskeyController_verifyAppleIDPasskeyWithContext_completion___block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unenrollAppleIDPasskeyWithContext:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "AppleIDPasskey/unenrollAppleIDPasskey", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _AKSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AppleIDPasskeyUnenroll", " enableTelemetry=YES ", buf, 2u);
  }

  v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v29 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AppleIDPasskeyUnenroll  enableTelemetry=YES ", buf, 0xCu);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__AKAppleIDPasskeyController_unenrollAppleIDPasskeyWithContext_completion___block_invoke;
  v23[3] = &unk_1E57610C0;
  v23[4] = self;
  os_signpost_id_t v25 = v10;
  uint64_t v26 = v12;
  id v16 = v7;
  id v24 = v16;
  uint64_t v17 = (void *)MEMORY[0x1996FE880](v23);
  remoteService = self->_remoteService;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__AKAppleIDPasskeyController_unenrollAppleIDPasskeyWithContext_completion___block_invoke_73;
  v21[3] = &unk_1E575EAC0;
  id v19 = v17;
  id v22 = v19;
  __int16 v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v21];
  [v20 unenrollAppleIDPasskeyWithContext:v6 completion:v19];

  os_activity_scope_leave(&state);
}

void __75__AKAppleIDPasskeyController_unenrollAppleIDPasskeyWithContext_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _AKSignpostLogSystem();
  v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v8, OS_SIGNPOST_INTERVAL_END, v9, "AppleIDPasskeyUnenroll", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  os_signpost_id_t v10 = _AKSignpostLogSystem();
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
    _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AppleIDPasskeyUnenroll  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  int v14 = _AKLogPasskey();
  v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Completed AppleID passkey unenroll successfully", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __75__AKAppleIDPasskeyController_unenrollAppleIDPasskeyWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v16 = a1[5];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __75__AKAppleIDPasskeyController_unenrollAppleIDPasskeyWithContext_completion___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)appleIDPasskeyStatusWithContext:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_193494000, "AppleIDPasskey/appleIDPasskeyStatus", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_193494000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AppleIDPasskeyStatus", " enableTelemetry=YES ", buf, 2u);
  }

  v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v29 = v10;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AppleIDPasskeyStatus  enableTelemetry=YES ", buf, 0xCu);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__AKAppleIDPasskeyController_appleIDPasskeyStatusWithContext_completion___block_invoke;
  v23[3] = &unk_1E57610E8;
  v23[4] = self;
  os_signpost_id_t v25 = v10;
  uint64_t v26 = v12;
  id v16 = v7;
  id v24 = v16;
  int v17 = (void *)MEMORY[0x1996FE880](v23);
  remoteService = self->_remoteService;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__AKAppleIDPasskeyController_appleIDPasskeyStatusWithContext_completion___block_invoke_74;
  v21[3] = &unk_1E575EAC0;
  id v19 = v17;
  id v22 = v19;
  double v20 = [(AAFXPCSession *)remoteService remoteServiceProxyWithErrorHandler:v21];
  [v20 appleIDPasskeyStatusWithContext:v6 completion:v19];

  os_activity_scope_leave(&state);
}

void __73__AKAppleIDPasskeyController_appleIDPasskeyStatusWithContext_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v18 = 67240192;
    LODWORD(v19) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_193494000, v9, OS_SIGNPOST_INTERVAL_END, v10, "AppleIDPasskeyStatus", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
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
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AppleIDPasskeyStatus  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  v15 = _AKLogPasskey();
  id v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "Completed AppleID passkey status successfully", (uint8_t *)&v18, 2u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __73__AKAppleIDPasskeyController_appleIDPasskeyStatusWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v17 = a1[5];
  if (v17) {
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);
  }
}

uint64_t __73__AKAppleIDPasskeyController_appleIDPasskeyStatusWithContext_completion___block_invoke_74(uint64_t a1)
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

void __72__AKAppleIDPasskeyController_setupAppleIDPasskeyWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "AppleID passkey setup failed with error: %@", v2, v3, v4, v5, v6);
}

void __73__AKAppleIDPasskeyController_verifyAppleIDPasskeyWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "AppleID passkey verification failed with error: %@", v2, v3, v4, v5, v6);
}

void __75__AKAppleIDPasskeyController_unenrollAppleIDPasskeyWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "AppleID passkey unenroll failed with error: %@", v2, v3, v4, v5, v6);
}

void __73__AKAppleIDPasskeyController_appleIDPasskeyStatusWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "AppleID passkey status failed with error: %@", v2, v3, v4, v5, v6);
}

@end