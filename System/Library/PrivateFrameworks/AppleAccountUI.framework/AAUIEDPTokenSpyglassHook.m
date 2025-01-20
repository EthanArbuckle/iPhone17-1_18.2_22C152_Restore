@interface AAUIEDPTokenSpyglassHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (void)_launchEDPTokenPane:(id)a3 completion:(id)a4;
- (void)_showEDPTokenPaneWithToken:(id)a3 onViewController:(id)a4 sender:(id)a5 completion:(id)a6;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation AAUIEDPTokenSpyglassHook

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(AAUIEDPTokenSpyglassHook *)self _launchEDPTokenPane:v7 completion:v6];
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"edp:recoverytoken"];

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

  char v7 = [v6 isEqualToString:@"edp:recoverytoken"];
  return v7;
}

- (void)_launchEDPTokenPane:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = [WeakRetained presentationContextForHook:self];

  objc_initWeak(&location, self);
  id v10 = objc_alloc(MEMORY[0x263F343F0]);
  v11 = +[AAUICDPHelper cdpContextForPrimaryAccount];
  v12 = (void *)[v10 initWithContext:v11];

  objc_initWeak(&from, v12);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke;
  v15[3] = &unk_263F93E08;
  objc_copyWeak(&v18, &location);
  id v13 = v7;
  id v17 = v13;
  id v14 = v9;
  id v16 = v14;
  objc_copyWeak(&v19, &from);
  [v12 fetchEDPTokenWithCompletion:v15];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

void __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      [WeakRetained _showEDPTokenPaneWithToken:v5 onViewController:a1[4] sender:WeakRetained completion:a1[5]];
    }
    else
    {
      v11 = _AAUILogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_cold_2();
      }

      v12 = [[AAUIEDPStateValidator alloc] initWithPresentingViewController:a1[4]];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_40;
      v13[3] = &unk_263F93DE0;
      objc_copyWeak(&v17, a1 + 7);
      v13[4] = v8;
      id v16 = a1[5];
      id v14 = 0;
      id v15 = a1[4];
      [(AAUIEDPStateValidator *)v12 repairPrimaryAppleAccountEDPStateWithCompletion:v13];

      objc_destroyWeak(&v17);
    }
  }
  else
  {
    v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_cold_1();
    }

    id v10 = a1[5];
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

void __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_40(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = WeakRetained;
  if (a2)
  {
    if (WeakRetained)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_41;
      v13[3] = &unk_263F93DB8;
      v13[4] = *(void *)(a1 + 32);
      id v16 = *(id *)(a1 + 56);
      id v14 = *(id *)(a1 + 40);
      id v15 = *(id *)(a1 + 48);
      [v7 fetchEDPTokenWithCompletion:v13];

      goto LABEL_13;
    }
    v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_40_cold_1();
    }

    uint64_t v12 = *(void *)(a1 + 56);
    if (v12)
    {
      id v10 = *(void (**)(void))(v12 + 16);
      goto LABEL_12;
    }
  }
  else
  {
    v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_40_cold_2();
    }

    uint64_t v9 = *(void *)(a1 + 56);
    if (v9)
    {
      id v10 = *(void (**)(void))(v9 + 16);
LABEL_12:
      v10();
    }
  }
LABEL_13:
}

void __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_41(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_41_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 56);
    if (v8) {
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _showEDPTokenPaneWithToken:*(void *)(a1 + 40) onViewController:*(void *)(a1 + 48) sender:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
  }
}

- (void)_showEDPTokenPaneWithToken:(id)a3 onViewController:(id)a4 sender:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __90__AAUIEDPTokenSpyglassHook__showEDPTokenPaneWithToken_onViewController_sender_completion___block_invoke;
  v17[3] = &unk_263F927F8;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v17);
}

void __90__AAUIEDPTokenSpyglassHook__showEDPTokenPaneWithToken_onViewController_sender_completion___block_invoke(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __90__AAUIEDPTokenSpyglassHook__showEDPTokenPaneWithToken_onViewController_sender_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x263F34A00] makeSwiftUIViewForEDPTokenInSpyglassWithRecoveryToken:*(void *)(a1 + 32) presentingViewController:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) showViewController:v3 sender:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, 1, 0);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_209754000, v0, OS_LOG_TYPE_ERROR, "Unable to show EDP token screen because strongSelf is nil.", v1, 2u);
}

void __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_209754000, v0, OS_LOG_TYPE_DEBUG, "Attempting to repair EDP state.", v1, 2u);
}

void __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_40_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_209754000, v0, OS_LOG_TYPE_ERROR, "Unable to show EDP token screen because strongCDPController is nil.", v1, 2u);
}

void __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_40_cold_2()
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0(&dword_209754000, v0, v1, "%@ - Unable to repair EDP state. Stopping flow with error %@", v2, v3, v4, v5, v6);
}

void __59__AAUIEDPTokenSpyglassHook__launchEDPTokenPane_completion___block_invoke_41_cold_1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0(&dword_209754000, v0, v1, "%@ - Unable to fetch EDP token after repair. Stopping flow with error %@", v2, v3, v4, v5, v6);
}

void __90__AAUIEDPTokenSpyglassHook__showEDPTokenPaneWithToken_onViewController_sender_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_209754000, v0, OS_LOG_TYPE_DEBUG, "Presenting EDP Token Spyglass Pane", v1, 2u);
}

@end