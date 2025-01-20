@interface CDPEDPTokenHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIObjectModel)objectModel;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (void)_attachRecoveryToken:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setObjectModel:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation CDPEDPTokenHook

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(CDPEDPTokenHook *)self _attachRecoveryToken:v7 completion:v6];
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"edp:attachrecoverytoken"];

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

  char v7 = [v6 isEqualToString:@"edp:attachrecoverytoken"];
  return v7;
}

- (void)_attachRecoveryToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  stateController = self->_stateController;
  if (!stateController)
  {
    id v9 = objc_alloc(MEMORY[0x263F343F0]);
    v10 = [MEMORY[0x263F34350] contextForPrimaryAccount];
    v11 = (CDPStateController *)[v9 initWithContext:v10];
    v12 = self->_stateController;
    self->_stateController = v11;

    stateController = self->_stateController;
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__CDPEDPTokenHook__attachRecoveryToken_completion___block_invoke;
  v15[3] = &unk_26433D7B8;
  id v13 = v7;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  id v14 = v6;
  id v16 = v14;
  [(CDPStateController *)stateController fetchEDPTokenWithCompletion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __51__CDPEDPTokenHook__attachRecoveryToken_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__CDPEDPTokenHook__attachRecoveryToken_completion___block_invoke_cold_3((uint64_t)v6, v8);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __51__CDPEDPTokenHook__attachRecoveryToken_completion___block_invoke_cold_2(v8);
    }

    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v11 = NSURL;
      v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"url"];
      id v13 = [WeakRetained[4] sourceURL];
      id v14 = [v11 URLWithString:v12 relativeToURL:v13];

      v15 = [v5 componentsJoinedByString:@"-"];
      id v16 = objc_msgSend(v15, "aaf_toBase64EncodedString");

      id v17 = objc_alloc_init(MEMORY[0x263F637C8]);
      id v18 = [MEMORY[0x263F089E0] requestWithURL:v14];
      uint64_t v19 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"httpMethod"];
      v20 = (void *)v19;
      if (v19) {
        v21 = (__CFString *)v19;
      }
      else {
        v21 = @"GET";
      }
      [v18 setHTTPMethod:v21];

      [v18 setValue:v16 forHTTPHeaderField:@"X-Apple-I-RT"];
      [v17 setContinuationRequest:v18];
      objc_storeStrong(WeakRetained + 3, v17);
      uint64_t v22 = *(void *)(a1 + 40);
      if (v22) {
        (*(void (**)(uint64_t, uint64_t, void))(v22 + 16))(v22, 1, 0);
      }
    }
    else
    {
      v23 = _CDPLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __51__CDPEDPTokenHook__attachRecoveryToken_completion___block_invoke_cold_1(v23);
      }

      uint64_t v24 = *(void *)(a1 + 40);
      if (v24) {
        (*(void (**)(uint64_t, void, void))(v24 + 16))(v24, 0, 0);
      }
    }
  }
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

- (RUIObjectModel)objectModel
{
  return self->_objectModel;
}

- (void)setObjectModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectModel, 0);
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_stateController, 0);
}

void __51__CDPEDPTokenHook__attachRecoveryToken_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2187CF000, log, OS_LOG_TYPE_ERROR, "Unable to attach EDP token to the header due to strongSelf being nil.", v1, 2u);
}

void __51__CDPEDPTokenHook__attachRecoveryToken_completion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2187CF000, log, OS_LOG_TYPE_DEBUG, "Successfully fetched EDP token.", v1, 2u);
}

void __51__CDPEDPTokenHook__attachRecoveryToken_completion___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2187CF000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch EDP token due to error %@", (uint8_t *)&v2, 0xCu);
}

@end