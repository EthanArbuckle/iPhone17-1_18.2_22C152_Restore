@interface AAUIAuthKitRecoveryHook
- (AKAppleIDServerUIDataHarvester)serverDataHarvester;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (id)_cdpStateUIProvider;
- (void)harvestDataFromResponse:(id)a3;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setServerDataHarvester:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation AAUIAuthKitRecoveryHook

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = [(AAUIAuthKitRecoveryHook *)self serverDataHarvester];
  v7 = [v6 harvestedData];

  [(AAUIAuthKitRecoveryHook *)self setServerHookResponse:0];
  [(AAUIAuthKitRecoveryHook *)self setServerDataHarvester:0];
  v8 = [MEMORY[0x263F290F8] recoveryContextWithServerInfo:v7];
  id v9 = objc_alloc(MEMORY[0x263F29210]);
  v10 = [(AAUIAuthKitRecoveryHook *)self _cdpStateUIProvider];
  v11 = (void *)[v9 initWithContext:v8 uiProvider:v10];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__AAUIAuthKitRecoveryHook_processObjectModel_completion___block_invoke;
  v14[3] = &unk_263F92F90;
  v14[4] = self;
  id v15 = v8;
  id v16 = v5;
  id v12 = v5;
  id v13 = v8;
  [v11 presentNativeRecoveryUIWithCompletion:v14];
}

void __57__AAUIAuthKitRecoveryHook_processObjectModel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = [MEMORY[0x263F29210] shouldSendServerResponseForRecoveredInfo:v5 withRecoveryError:v6];
  v8 = _AAUILogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Recovered info, proceeding with rest of the flow...", buf, 2u);
    }

    id v10 = objc_alloc_init(MEMORY[0x263F637C8]);
    [*(id *)(a1 + 32) setServerHookResponse:v10];

    v11 = [MEMORY[0x263F29210] requestForRecoveryCompletionWithContext:*(void *)(a1 + 40) recoveredInfo:v5 recoveryError:v6];
    id v12 = [*(id *)(a1 + 32) serverHookResponse];
    [v12 setContinuationRequest:v11];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Recovery flow ended with client error... %@", buf, 0xCu);
    }

    id v13 = [*(id *)(a1 + 32) delegate];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __57__AAUIAuthKitRecoveryHook_processObjectModel_completion___block_invoke_30;
    v14[3] = &unk_263F92070;
    id v16 = *(id *)(a1 + 48);
    id v15 = v6;
    [v13 dismissObjectModelsAnimated:1 completion:v14];
  }
}

uint64_t __57__AAUIAuthKitRecoveryHook_processObjectModel_completion___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)_cdpStateUIProvider
{
  id v3 = objc_alloc(MEMORY[0x263F34A08]);
  v4 = [(AAUIAuthKitRecoveryHook *)self delegate];
  id v5 = [v4 presentationContextForHook:self];
  id v6 = (void *)[v3 initWithPresentingViewController:v5];

  [v6 setForceInlinePresentation:1];
  return v6;
}

- (BOOL)shouldMatchElement:(id)a3
{
  return 0;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v4 = a3;
  id v5 = [(AAUIAuthKitRecoveryHook *)self serverDataHarvester];
  [v5 harvestDataFromServerUIObjectModel:v4];

  objc_opt_class();
  id v6 = [(AAUIAuthKitRecoveryHook *)self serverDataHarvester];
  int v7 = [v6 harvestedData];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F28EE8]];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if ([v9 isEqualToString:*MEMORY[0x263F28EF8]]) {
    char v10 = 1;
  }
  else {
    char v10 = [v9 isEqualToString:*MEMORY[0x263F28F00]];
  }

  return v10;
}

- (void)harvestDataFromResponse:(id)a3
{
  id v4 = a3;
  id v5 = [(AAUIAuthKitRecoveryHook *)self serverDataHarvester];
  [v5 harvestDataFromServerHTTPResponse:v4];
}

- (AKAppleIDServerUIDataHarvester)serverDataHarvester
{
  serverDataHarvester = self->_serverDataHarvester;
  if (!serverDataHarvester)
  {
    id v4 = (AKAppleIDServerUIDataHarvester *)objc_alloc_init(MEMORY[0x263F292C0]);
    id v5 = self->_serverDataHarvester;
    self->_serverDataHarvester = v4;

    serverDataHarvester = self->_serverDataHarvester;
  }
  return serverDataHarvester;
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

- (void)setServerDataHarvester:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDataHarvester, 0);
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end