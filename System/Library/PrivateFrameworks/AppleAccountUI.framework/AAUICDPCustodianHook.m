@interface AAUICDPCustodianHook
- (AAUICDPCustodianHook)initWithAccountManager:(id)a3 contactsProvider:(id)a4;
- (AAUICDPCustodianHook)initWithAccountManager:(id)a3 contactsProvider:(id)a4 cdpContext:(id)a5;
- (AAUIContactsProvider)contactsProvider;
- (AAUICustodianSetupFlowController)setupFlowController;
- (AIDAAccountManager)accountManager;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (id)_custodianInlineSetupFlowNavigationController;
- (id)setupCompletion;
- (void)_callSetupCompletionWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_custodianInlineSetupFlowNavigationController;
- (void)_performInlineCustodianSetupWithIsADPUpsellFlow:(BOOL)a3 completion:(id)a4;
- (void)custodianSetupFlowControllerDidFinish:(id)a3 withError:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSetupCompletion:(id)a3;
- (void)setSetupFlowController:(id)a3;
@end

@implementation AAUICDPCustodianHook

- (AAUICDPCustodianHook)initWithAccountManager:(id)a3 contactsProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AAUICDPCustodianHook initWithAccountManager:contactsProvider:]();
  }

  v9 = [(AAUICDPCustodianHook *)self initWithAccountManager:v7 contactsProvider:v6 cdpContext:0];
  return v9;
}

- (AAUICDPCustodianHook)initWithAccountManager:(id)a3 contactsProvider:(id)a4 cdpContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)AAUICDPCustodianHook;
  v11 = [(AAUICDPCustodianHook *)&v22 init];
  if (v11)
  {
    if (v8)
    {
      v12 = (AIDAAccountManager *)v8;
      accountManager = v11->_accountManager;
      v11->_accountManager = v12;
    }
    else
    {
      v14 = _AAUILogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AAUICDPCustodianHook initWithAccountManager:contactsProvider:cdpContext:]();
      }

      id v15 = objc_alloc(MEMORY[0x263F26D70]);
      accountManager = [MEMORY[0x263EFB210] defaultStore];
      uint64_t v16 = [v15 initWithAccountStore:accountManager];
      v17 = v11->_accountManager;
      v11->_accountManager = (AIDAAccountManager *)v16;
    }
    if (v9)
    {
      v18 = (AAUIContactsProvider *)v9;
    }
    else
    {
      v19 = _AAUILogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[AAUICDPCustodianHook initWithAccountManager:contactsProvider:cdpContext:]();
      }

      v18 = objc_alloc_init(AAUIContactsProvider);
    }
    contactsProvider = v11->_contactsProvider;
    v11->_contactsProvider = v18;

    objc_storeStrong((id *)&v11->_cdpContext, a5);
  }

  return v11;
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"custodian:add"];

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

  char v7 = [v6 isEqualToString:@"custodian:add"];
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = [v6 clientInfo];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if ([v10 isEqualToString:@"custodian:add"])
  {
    objc_opt_class();
    v11 = [v6 clientInfo];
    id v12 = [v11 objectForKeyedSubscript:@"context"];
    if (objc_opt_isKindOfClass()) {
      v13 = (NSString *)v12;
    }
    else {
      v13 = 0;
    }

    hookClientContext = self->_hookClientContext;
    self->_hookClientContext = v13;

    BOOL v17 = [(NSString *)self->_hookClientContext isEqualToString:@"adpEnroll"];
    v18 = _AAUILogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_hookClientContext;
      v20[0] = 67109378;
      v20[1] = v17;
      __int16 v21 = 2112;
      objc_super v22 = v19;
      _os_log_impl(&dword_209754000, v18, OS_LOG_TYPE_DEFAULT, "isADPUpsellFlow=%{BOOL}d because clientContext=%@", (uint8_t *)v20, 0x12u);
    }

    [(AAUICDPCustodianHook *)self _performInlineCustodianSetupWithIsADPUpsellFlow:v17 completion:v7];
  }
  else
  {
    v14 = _AAUILogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AAUICDPCustodianHook processObjectModel:completion:]();
    }

    id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25638] code:-7000 userInfo:0];
    [(AAUICDPCustodianHook *)self _callSetupCompletionWithSuccess:0 error:v15];
  }
}

- (void)_performInlineCustodianSetupWithIsADPUpsellFlow:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void *)[a4 copy];
  [(AAUICDPCustodianHook *)self setSetupCompletion:v6];

  id v18 = [(AAUICDPCustodianHook *)self _custodianInlineSetupFlowNavigationController];
  id v7 = objc_alloc(MEMORY[0x263F824A8]);
  id v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  id v9 = [v8 localizedStringForKey:@"BACK" value:&stru_26BD39CD8 table:@"Localizable"];
  id v10 = (void *)[v7 initWithTitle:v9 style:0 target:0 action:0];
  v11 = [v18 topViewController];
  id v12 = [v11 navigationItem];
  [v12 setBackBarButtonItem:v10];

  v13 = [AAUICustodianSetupFlowController alloc];
  v14 = [(AAUICDPCustodianHook *)self accountManager];
  id v15 = [(AAUICustodianSetupFlowController *)v13 initWithAccountManager:v14 navigationController:v18 isADPUpsellFlow:v4 cdpContext:self->_cdpContext];
  [(AAUICDPCustodianHook *)self setSetupFlowController:v15];

  uint64_t v16 = [(AAUICDPCustodianHook *)self setupFlowController];
  [v16 setDelegate:self];

  BOOL v17 = [(AAUICDPCustodianHook *)self setupFlowController];
  [v17 start];
}

- (void)custodianSetupFlowControllerDidFinish:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AAUICDPCustodianHook custodianSetupFlowControllerDidFinish:withError:]();
    }

    id v9 = [v6 navigationController];
    id v10 = [v9 presentingViewController];

    v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[AAUICDPCustodianHook custodianSetupFlowControllerDidFinish:withError:]();
    }

    if (v10)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke;
      v19[3] = &unk_263F926B8;
      v19[4] = self;
      id v20 = v7;
      [v10 dismissViewControllerAnimated:1 completion:v19];
    }
    else
    {
      [(AAUICDPCustodianHook *)self _callSetupCompletionWithSuccess:0 error:v7];
    }
  }
  else
  {
    if (![(NSString *)self->_hookClientContext isEqualToString:@"adpEnroll"]) {
      [(AAUICDPCustodianHook *)self _callSetupCompletionWithSuccess:1 error:0];
    }
    id v12 = [(AAUICDPCustodianHook *)self contactsProvider];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      objc_initWeak(&location, self);
      v14 = [(AAUICDPCustodianHook *)self contactsProvider];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke_62;
      v16[3] = &unk_263F92FB8;
      objc_copyWeak(&v17, &location);
      [v14 fetchWalrusEligibleCustodiansForExpansionCohortsWithCompletion:v16];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      id v15 = _AAUILogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[AAUICDPCustodianHook custodianSetupFlowControllerDidFinish:withError:]();
      }
    }
  }
}

uint64_t __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callSetupCompletionWithSuccess:0 error:*(void *)(a1 + 40)];
}

void __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke_62_cold_2();
    }

    id v9 = WeakRetained;
    uint64_t v10 = 0;
    id v11 = v6;
LABEL_9:
    [v9 _callSetupCompletionWithSuccess:v10 error:v11];
    goto LABEL_10;
  }
  uint64_t v12 = [v5 count];
  char v13 = _AAUILogSystem();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "Found at least one eligible custodian for walrus expansion cohort.", v16, 2u);
    }

    id v9 = WeakRetained;
    uint64_t v10 = 1;
    id v11 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke_62_cold_1();
  }

  id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25638] code:-7003 userInfo:0];
  [WeakRetained _callSetupCompletionWithSuccess:0 error:v15];

LABEL_10:
}

- (id)_custodianInlineSetupFlowNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = [WeakRetained presentationContextForHook:self];

  if (!v4)
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(AAUICDPCustodianHook *)v7 _custodianInlineSetupFlowNavigationController];
    }

    id v6 = objc_alloc_init(MEMORY[0x263F829B8]);
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AAUICDPCustodianHook _custodianInlineSetupFlowNavigationController]();
    }

    id v6 = v4;
LABEL_9:
    id v15 = v6;
    goto LABEL_18;
  }
  uint64_t v16 = [v4 navigationController];
  id v17 = _AAUILogSystem();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    if (v18) {
      [(AAUICDPCustodianHook *)v17 _custodianInlineSetupFlowNavigationController];
    }

    id v26 = v16;
  }
  else
  {
    if (v18) {
      -[AAUICDPCustodianHook _custodianInlineSetupFlowNavigationController]();
    }

    id v26 = (id)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v4];
  }
  id v15 = v26;

LABEL_18:
  return v15;
}

- (void)_callSetupCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(AAUICDPCustodianHook *)self setupCompletion];

  uint64_t v8 = _AAUILogSystem();
  uint64_t v9 = (uint64_t)v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AAUICDPCustodianHook _callSetupCompletionWithSuccess:error:](v4, (uint64_t)v6, (os_log_t)v9);
    }

    uint64_t v9 = [(AAUICDPCustodianHook *)self setupCompletion];
    (*(void (**)(uint64_t, BOOL, id))(v9 + 16))(v9, v4, v6);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[AAUICDPCustodianHook _callSetupCompletionWithSuccess:error:]();
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

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (AAUIContactsProvider)contactsProvider
{
  return self->_contactsProvider;
}

- (id)setupCompletion
{
  return self->_setupCompletion;
}

- (void)setSetupCompletion:(id)a3
{
}

- (AAUICustodianSetupFlowController)setupFlowController
{
  return self->_setupFlowController;
}

- (void)setSetupFlowController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupFlowController, 0);
  objc_storeStrong(&self->_setupCompletion, 0);
  objc_storeStrong((id *)&self->_contactsProvider, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hookClientContext, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
}

- (void)initWithAccountManager:contactsProvider:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_209754000, v0, OS_LOG_TYPE_DEBUG, "Instantiating AAUICDPCustodianHook with nil cdpContext", v1, 2u);
}

- (void)initWithAccountManager:contactsProvider:cdpContext:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Passed in contacts provider should not be nil. Creating a new one.", v2, v3, v4, v5, v6);
}

- (void)initWithAccountManager:contactsProvider:cdpContext:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Passed in account manager should not be nil. Creating one with the default account store.", v2, v3, v4, v5, v6);
}

- (void)processObjectModel:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Not proceeding with inline custodian setup. Action=(%@)", v2, v3, v4, v5, v6);
}

- (void)custodianSetupFlowControllerDidFinish:withError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "AppleAccount changes have not yet integrated", v2, v3, v4, v5, v6);
}

- (void)custodianSetupFlowControllerDidFinish:withError:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_209754000, v0, v1, "Dismissing from landing screen %@", v2, v3, v4, v5, v6);
}

- (void)custodianSetupFlowControllerDidFinish:withError:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Encountered an error while finishing custodian setup flow: %@.", v2, v3, v4, v5, v6);
}

void __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke_62_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "No eligible custodians found for walrus expansion cohort.", v2, v3, v4, v5, v6);
}

void __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke_62_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Failed to fetch custodians for Walrus expansion cohort due to error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_custodianInlineSetupFlowNavigationController
{
}

- (void)_callSetupCompletionWithSuccess:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Completion handler was not set.", v2, v3, v4, v5, v6);
}

- (void)_callSetupCompletionWithSuccess:(os_log_t)log error:.cold.2(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "AAUICDPCustodianHook: Calling completion with success=(%d) error=(%@)", (uint8_t *)v3, 0x12u);
}

@end