@interface AAUICDPRepairHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_performCDPRepairWithAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUICDPRepairHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"cdp:repair"];

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

  char v7 = [v6 isEqualToString:@"cdp:repair"];
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(AAUICDPRepairHook *)self _performCDPRepairWithAttributes:v7 completion:v6];
}

- (void)_performCDPRepairWithAttributes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Starting CDP flow", buf, 2u);
  }

  objc_opt_class();
  v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F63828]];

  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = [WeakRetained presentationContextForHook:self];
  v14 = +[AAUICDPHelper helperWithPresenter:v13];

  objc_msgSend(v14, "setForceInline:", objc_msgSend(v11, "BOOLValue"));
  v15 = [v14 cdpStateControllerForPrimaryAccount];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__AAUICDPRepairHook__performCDPRepairWithAttributes_completion___block_invoke;
  v17[3] = &unk_263F92B30;
  id v18 = v6;
  id v16 = v6;
  [v15 repairCloudDataProtectionStateWithCompletion:v17];
}

void __64__AAUICDPRepairHook__performCDPRepairWithAttributes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "CDP Repair flow finished: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
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

- (void).cxx_destruct
{
}

@end