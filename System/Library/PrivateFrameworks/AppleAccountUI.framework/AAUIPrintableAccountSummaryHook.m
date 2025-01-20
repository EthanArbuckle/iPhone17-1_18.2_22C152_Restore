@interface AAUIPrintableAccountSummaryHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (void)_launchPrintableSummaryFlow:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation AAUIPrintableAccountSummaryHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"recovery:print"];

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

  char v7 = [v6 isEqualToString:@"recovery:print"];
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(AAUIPrintableAccountSummaryHook *)self _launchPrintableSummaryFlow:v7 completion:v6];
}

- (void)_launchPrintableSummaryFlow:(id)a3 completion:(id)a4
{
  id v5 = a4;
  BOOL v6 = +[AAUIFeatureFlags isPrintableSummaryEnabled];
  id v7 = _AAUILogSystem();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "_launchPrintableSummaryFlow: Launching Printable Summary Flow.", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = [WeakRetained presentationContextForHook:self];

    v10 = +[AAUIPrintableAccountRecoverySummaryViewFactory createWithContext:@"hook"];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __74__AAUIPrintableAccountSummaryHook__launchPrintableSummaryFlow_completion___block_invoke;
    v11[3] = &unk_263F920E8;
    id v12 = v5;
    [v8 presentViewController:v10 animated:1 completion:v11];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[AAUIPrintableAccountSummaryHook _launchPrintableSummaryFlow:completion:](v8);
  }
}

uint64_t __74__AAUIPrintableAccountSummaryHook__launchPrintableSummaryFlow_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
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

- (void)_launchPrintableSummaryFlow:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "_launchPrintableSummaryFlow: Printable Summary is disabled.", v1, 2u);
}

@end