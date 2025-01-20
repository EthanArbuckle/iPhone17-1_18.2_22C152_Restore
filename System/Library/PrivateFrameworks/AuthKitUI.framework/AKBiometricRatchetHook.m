@interface AKBiometricRatchetHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (id)_biometricRatchetUIContextFromAttributes:(id)a3;
- (void)_armBiometricRatchetWithServerAttributes:(id)a3 completion:(id)a4;
- (void)_updateResponseWithContext;
- (void)_updateResponseWithRatchetResult:(id)a3;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation AKBiometricRatchetHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"ak:bioratchet"];

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

  char v7 = [v6 isEqualToString:@"ak:bioratchet"];
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(AKBiometricRatchetHook *)self _armBiometricRatchetWithServerAttributes:v7 completion:v6];
}

- (void)_armBiometricRatchetWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (AKBiometricRatchetController *)objc_alloc_init(MEMORY[0x1E4F4EFD8]);
  biometricRatchetController = self->_biometricRatchetController;
  self->_biometricRatchetController = v8;

  objc_opt_class();
  id v10 = [v6 objectForKeyedSubscript:@"context"];
  if (objc_opt_isKindOfClass()) {
    v11 = (NSString *)v10;
  }
  else {
    v11 = 0;
  }

  context = self->_context;
  self->_context = v11;

  if (self->_context) {
    v13 = (__CFString *)self->_context;
  }
  else {
    v13 = &stru_1F1EE8138;
  }
  objc_storeStrong((id *)&self->_context, v13);
  if ([(AKBiometricRatchetController *)self->_biometricRatchetController isDTOEnabled])
  {
    v14 = [(AKBiometricRatchetHook *)self _biometricRatchetUIContextFromAttributes:v6];
    v15 = self->_biometricRatchetController;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__AKBiometricRatchetHook__armBiometricRatchetWithServerAttributes_completion___block_invoke;
    v17[3] = &unk_1E648F988;
    v17[4] = self;
    id v18 = v7;
    [(AKBiometricRatchetController *)v15 armWithContext:v14 completion:v17];
  }
  else
  {
    v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[AKDTOBiometryHook _performDTOBiometricsWithServerAttributes:completion:](v16);
    }

    [(AKBiometricRatchetHook *)self _updateResponseWithContext];
    if (v7) {
      (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
    }
  }
}

void __78__AKBiometricRatchetHook__armBiometricRatchetWithServerAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__AKBiometricRatchetHook__armBiometricRatchetWithServerAttributes_completion___block_invoke_cold_2((uint64_t)v6, v8);
    }

    [*(id *)(a1 + 32) _updateResponseWithContext];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      id v10 = *(void (**)(void))(v9 + 16);
LABEL_10:
      v10();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __78__AKBiometricRatchetHook__armBiometricRatchetWithServerAttributes_completion___block_invoke_cold_1((uint64_t)v5, v8);
    }

    [*(id *)(a1 + 32) _updateResponseWithRatchetResult:v5];
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      id v10 = *(void (**)(void))(v11 + 16);
      goto LABEL_10;
    }
  }
}

- (id)_biometricRatchetUIContextFromAttributes:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v7 = [WeakRetained presentationContextForHook:self];

  v8 = _AKLogSystem();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AKBiometricRatchetHook _biometricRatchetUIContextFromAttributes:]((uint64_t)v7, v9);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[AKBiometricRatchetHook _biometricRatchetUIContextFromAttributes:](v9);
  }

  id v10 = [[AKBiometricRatchetUIContext alloc] initWithAttributes:v5 presentationContext:v7];

  return v10;
}

- (void)_updateResponseWithRatchetResult:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  char v4 = [a3 ratchetState];
  objc_msgSend(v4, "toString:", objc_msgSend(v4, "rawState"));
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![(__CFString *)v5 length])
  {

    id v5 = @"undefined";
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F95F60]);
  v9[0] = @"ratchetState";
  v9[1] = @"context";
  context = self->_context;
  v10[0] = v5;
  v10[1] = context;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v6 setAdditionalPayload:v8];

  [(AKBiometricRatchetHook *)self setServerHookResponse:v6];
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

  [(AKBiometricRatchetHook *)self setServerHookResponse:v3];
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
  objc_storeStrong((id *)&self->_biometricRatchetController, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

void __78__AKBiometricRatchetHook__armBiometricRatchetWithServerAttributes_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Received response from arming ratchet call: %@", (uint8_t *)&v2, 0xCu);
}

void __78__AKBiometricRatchetHook__armBiometricRatchetWithServerAttributes_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_ERROR, "Error during arming ratchet: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_biometricRatchetUIContextFromAttributes:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "biometricRatchetUIContext - passing nil presentation context", v1, 2u);
}

- (void)_biometricRatchetUIContextFromAttributes:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "biometricRatchetUIContext - passing presentation context - %@", (uint8_t *)&v2, 0xCu);
}

@end