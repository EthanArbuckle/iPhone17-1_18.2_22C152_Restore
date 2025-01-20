@interface AKDTOBiometryHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (void)_performDTOBiometricsWithServerAttributes:(id)a3 completion:(id)a4;
- (void)_updateResponseWithContext;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation AKDTOBiometryHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"ak:biometrics"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char v4 = [v3 clientInfo];

  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F95F88]];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  char v7 = [v6 isEqualToString:@"ak:biometrics"];
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(AKDTOBiometryHook *)self _performDTOBiometricsWithServerAttributes:v7 completion:v6];
}

- (void)_performDTOBiometricsWithServerAttributes:(id)a3 completion:(id)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F4EFD8]);
  objc_opt_class();
  id v9 = [v6 objectForKeyedSubscript:@"context"];
  if (objc_opt_isKindOfClass()) {
    v10 = (NSString *)v9;
  }
  else {
    v10 = 0;
  }

  context = self->_context;
  self->_context = v10;

  if (self->_context) {
    v12 = (__CFString *)self->_context;
  }
  else {
    v12 = &stru_1F1EE8138;
  }
  objc_storeStrong((id *)&self->_context, v12);
  if ([v8 isDTOEnabled])
  {
    objc_opt_class();
    id v13 = [v6 objectForKeyedSubscript:@"fallback"];
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    if (v14) {
      uint64_t v16 = [v14 BOOLValue];
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    v24[0] = &unk_1F1F036F0;
    v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"DTO_BIOMETRY_FALLBACK_ALERT_SUBTITLE" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
    v24[1] = &unk_1F1F03708;
    v25[0] = v19;
    v20 = [NSNumber numberWithBool:v16];
    v25[1] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__AKDTOBiometryHook__performDTOBiometricsWithServerAttributes_completion___block_invoke;
    v22[3] = &unk_1E648F6A0;
    v22[4] = self;
    id v23 = v7;
    [v17 evaluatePolicy:1025 options:v21 reply:v22];
  }
  else
  {
    v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[AKDTOBiometryHook _performDTOBiometricsWithServerAttributes:completion:](v15);
    }

    [(AKDTOBiometryHook *)self _updateResponseWithContext];
    if (v7) {
      (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
    }
  }
}

void __74__AKDTOBiometryHook__performDTOBiometricsWithServerAttributes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [*(id *)(a1 + 32) _updateResponseWithContext];
  id v5 = _AKLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __74__AKDTOBiometryHook__performDTOBiometricsWithServerAttributes_completion___block_invoke_cold_2(v6);
    }

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      id v8 = *(void (**)(void))(v7 + 16);
LABEL_10:
      v8();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __74__AKDTOBiometryHook__performDTOBiometricsWithServerAttributes_completion___block_invoke_cold_1(v6);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      id v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_10;
    }
  }
}

- (void)_updateResponseWithContext
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F95F60]);
  context = self->_context;
  id v6 = @"context";
  v7[0] = context;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 setAdditionalPayload:v5];

  [(AKDTOBiometryHook *)self setServerHookResponse:v3];
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_performDTOBiometricsWithServerAttributes:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "DTO feature not enabled, no arming required, sending success back", v1, 2u);
}

void __74__AKDTOBiometryHook__performDTOBiometricsWithServerAttributes_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "Biometry succeeded, sending success response back to IdMS", v1, 2u);
}

void __74__AKDTOBiometryHook__performDTOBiometricsWithServerAttributes_completion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "Biometry failed, sending failure response back to IdMS", v1, 2u);
}

@end