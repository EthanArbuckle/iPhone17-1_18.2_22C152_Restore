@interface AAUISecurityCodeVerifyHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (void)_verifySecurityCodeWithServerAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation AAUISecurityCodeVerifyHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"icsc:verify"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char v4 = [v3 clientInfo];

  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  char v7 = [v6 isEqualToString:@"icsc:verify"];
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(AAUISecurityCodeVerifyHook *)self _verifySecurityCodeWithServerAttributes:v7 completion:v6];
}

- (void)_verifySecurityCodeWithServerAttributes:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Verifying security code with server attributes (%@)", buf, 0xCu);
  }

  v9 = [(AAUISecurityCodeVerifyHook *)self delegate];
  v10 = [v9 presentationContextForHook:self];

  v11 = [[AAUID2DEncryptionFlowContext alloc] initWithType:7];
  objc_opt_class();
  id v12 = [v6 objectForKeyedSubscript:*MEMORY[0x263F63828]];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  int v14 = [v13 BOOLValue];
  if (v14)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  [(CDPUIDeviceToDeviceEncryptionFlowContext *)v11 setForceInlinePresentation:isKindOfClass & 1];
  v16 = [[AAUIManateeStateValidator alloc] initWithFlowContext:v11 withPresentingViewController:v10];
  v17 = (RUIServerHookResponse *)objc_alloc_init(MEMORY[0x263F637C8]);
  serverHookResponse = self->_serverHookResponse;
  self->_serverHookResponse = v17;

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __81__AAUISecurityCodeVerifyHook__verifySecurityCodeWithServerAttributes_completion___block_invoke;
  v21[3] = &unk_263F93150;
  v22 = v11;
  v23 = self;
  id v24 = v7;
  id v19 = v7;
  v20 = v11;
  [(AAUIManateeStateValidator *)v16 verifyAndRepairManateeWithCompletion:v21];
}

void __81__AAUISecurityCodeVerifyHook__verifySecurityCodeWithServerAttributes_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AAUILogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Successfully verified or repaired security code, will attempt to respond with PET", (uint8_t *)&v15, 2u);
    }

    v8 = [*(id *)(a1 + 32) repairContext];
    v9 = [v8 cachedLocalSecret];

    v10 = [*(id *)(a1 + 32) repairContext];
    id v7 = [v10 passwordEquivToken];

    v11 = _AAUILogSystem();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9 && v7)
    {
      if (v12)
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Determined that local secret was created or validated, attaching PET to server hook response", (uint8_t *)&v15, 2u);
      }

      v11 = [NSDictionary dictionaryWithObject:v7 forKey:@"password"];
      [*(id *)(*(void *)(a1 + 40) + 16) setAdditionalPayload:v11];
    }
    else if (v12)
    {
      id v13 = @"NO";
      if (v9) {
        int v14 = @"YES";
      }
      else {
        int v14 = @"NO";
      }
      if (v7) {
        id v13 = @"YES";
      }
      int v15 = 138412546;
      v16 = v14;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Unable to attach PET to server hook response (hasCachedLocalSecret: %@, hasPET: %@)", (uint8_t *)&v15, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __81__AAUISecurityCodeVerifyHook__verifySecurityCodeWithServerAttributes_completion___block_invoke_cold_1((uint64_t)v5, v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
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
}

void __81__AAUISecurityCodeVerifyHook__verifySecurityCodeWithServerAttributes_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Failed to verify and repair security code with error: %@", (uint8_t *)&v2, 0xCu);
}

@end