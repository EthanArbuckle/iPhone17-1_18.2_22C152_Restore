@interface AKBiometricRatchetController
- (AKBiometricRatchetController)init;
- (BOOL)isDTOEnabled;
- (id)currentRachetState;
- (void)armWithContext:(id)a3 completion:(id)a4;
- (void)cancelWithReason:(id)a3 completion:(id)a4;
- (void)currentRachetState;
- (void)isCriticalEditAllowedForAltDSID:(id)a3 completion:(id)a4;
- (void)isDTOEnabled;
- (void)stateWithCompletion:(id)a3;
@end

@implementation AKBiometricRatchetController

- (AKBiometricRatchetController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AKBiometricRatchetController;
  result = [(AKBiometricRatchetController *)&v3 init];
  if (result) {
    result->_dtoLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)stateWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F30B68]);
  v5 = +[AKBiometricRatchetUtility ratchetIdentifier];
  v6 = (void *)[v4 initWithIdentifier:v5];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__AKBiometricRatchetController_stateWithCompletion___block_invoke;
  v8[3] = &unk_1E5761C38;
  id v9 = v3;
  id v7 = v3;
  [v6 stateWithCompletion:v8];
}

void __52__AKBiometricRatchetController_stateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__AKBiometricRatchetController_stateWithCompletion___block_invoke_cold_1((uint64_t)v6, v7);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
  }
  else
  {
    id v9 = +[AKBiometricRatchetUtility stateFromLARatchetState:v5];
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v9, 0);
    }
  }
}

- (void)armWithContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  p_context = &self->_context;
  objc_storeStrong((id *)&self->_context, a3);
  id v9 = (void (**)(id, void, uint64_t))a4;
  LOBYTE(self) = objc_opt_respondsToSelector();
  uint64_t v10 = _AKLogSystem();
  v11 = v10;
  if (self)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AKBiometricRatchetController armWithContext:completion:](v11);
    }

    [(AKBiometricRatchetContext *)*p_context presentRatchetUIWithCompletion:v9];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AKBiometricRatchetController armWithContext:completion:](v11);
    }

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
    v9[2](v9, 0, v12);

    id v9 = (void (**)(id, void, uint64_t))v12;
  }
}

- (void)cancelWithReason:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F30B68];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = +[AKBiometricRatchetUtility ratchetIdentifier];
  uint64_t v10 = (void *)[v8 initWithIdentifier:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__AKBiometricRatchetController_cancelWithReason_completion___block_invoke;
  v12[3] = &unk_1E575EAC0;
  id v13 = v5;
  id v11 = v5;
  [v10 cancelWithReason:v7 completion:v12];
}

uint64_t __60__AKBiometricRatchetController_cancelWithReason_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)isDTOEnabled
{
  p_dtoLock = &self->_dtoLock;
  os_unfair_lock_lock(&self->_dtoLock);
  id v3 = [MEMORY[0x1E4F30B80] sharedInstance];
  if ([v3 isFeatureSupported])
  {
    id v4 = [MEMORY[0x1E4F30B80] sharedInstance];
    if ([v4 isFeatureAvailable])
    {
      id v5 = [MEMORY[0x1E4F30B80] sharedInstance];
      char v6 = [v5 isFeatureEnabled];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  os_unfair_lock_unlock(p_dtoLock);
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(AKBiometricRatchetController *)v6 isDTOEnabled];
  }

  return v6;
}

- (void)isCriticalEditAllowedForAltDSID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(AKAppleIDAuthenticationController);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__AKBiometricRatchetController_isCriticalEditAllowedForAltDSID_completion___block_invoke;
  v10[3] = &unk_1E575EEF0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [(AKAppleIDAuthenticationController *)v7 getUserInformationForAltDSID:v9 completion:v10];
}

void __75__AKBiometricRatchetController_isCriticalEditAllowedForAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__AKBiometricRatchetController_isCriticalEditAllowedForAltDSID_completion___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
LABEL_8:
      v9();
    }
  }
  else
  {
    uint64_t v10 = [v5 criticalAccountEditsAllowed];
    [v10 BOOLValue];

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      id v9 = *(void (**)(void))(v11 + 16);
      goto LABEL_8;
    }
  }
}

- (id)currentRachetState
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = _AKSignpostLogSystem();
  os_signpost_id_t v3 = _AKSignpostCreate(v2);
  uint64_t v5 = v4;

  id v6 = _AKSignpostLogSystem();
  id v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "RatchetFetchState", " enableTelemetry=YES ", (uint8_t *)&v19, 2u);
  }

  uint64_t v8 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134217984;
    os_signpost_id_t v20 = v3;
    _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RatchetFetchState  enableTelemetry=YES ", (uint8_t *)&v19, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F30B80] sharedInstance];
  uint64_t v10 = [v9 ratchetState];

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v3, v5);
  id v12 = _AKSignpostLogSystem();
  id v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_193494000, v13, OS_SIGNPOST_INTERVAL_END, v3, "RatchetFetchState", (const char *)&unk_19357E265, (uint8_t *)&v19, 2u);
  }

  v14 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218240;
    os_signpost_id_t v20 = v3;
    __int16 v21 = 2048;
    double v22 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_193494000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:RatchetFetchState ", (uint8_t *)&v19, 0x16u);
  }

  v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[AKBiometricRatchetController currentRachetState](v10);
  }

  v16 = +[AKBiometricRatchetUtility stateFromLARatchetState:v10];
  v17 = _AKLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[AKBiometricRatchetController currentRachetState](v16);
  }

  return v16;
}

- (void).cxx_destruct
{
}

void __52__AKBiometricRatchetController_stateWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Ratchet stateWithCompletion failed with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)armWithContext:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Presenting Ratchet UI", v1, 2u);
}

- (void)armWithContext:(os_log_t)log completion:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Ratchet UI context doesn't respond to presentBiometricRatchetArmingUIWithCompletion", v1, 2u);
}

- (void)isDTOEnabled
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = @"NO";
  if (a1) {
    int v2 = @"YES";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_193494000, a2, OS_LOG_TYPE_DEBUG, "dtoEnabled: %@", (uint8_t *)&v3, 0xCu);
}

void __75__AKBiometricRatchetController_isCriticalEditAllowedForAltDSID_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Failed to fetch user info for altDSID (%@) with error (%@)", (uint8_t *)&v4, 0x16u);
}

- (void)currentRachetState
{
  [a1 rawValue];
  OUTLINED_FUNCTION_0_0(&dword_193494000, v1, v2, "LARatchet state: %lu", v3, v4, v5, v6, 0);
}

@end