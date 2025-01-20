@interface AAUIAccountBeneficiaryManagementHook
- (AAUIAccountBeneficiaryManagementHook)initWithAccountManager:(id)a3 legacyContactsViewModel:(id)a4;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_showAccountBeneficiaryManagementWithServerAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUIAccountBeneficiaryManagementHook

- (AAUIAccountBeneficiaryManagementHook)initWithAccountManager:(id)a3 legacyContactsViewModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIAccountBeneficiaryManagementHook;
  v9 = [(AAUIAccountBeneficiaryManagementHook *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_legacyContactsViewModel, a4);
  }

  return v10;
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"inheritance:show"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKey:@"action"];
  char v5 = [v4 isEqualToString:@"inheritance:show"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(AAUIAccountBeneficiaryManagementHook *)self _showAccountBeneficiaryManagementWithServerAttributes:v7 completion:v6];
}

- (void)_showAccountBeneficiaryManagementWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12;
  v25 = __Block_byref_object_dispose__12;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v26 = [WeakRetained presentationContextForHook:self];

  v9 = [[AAUID2DEncryptionFlowContext alloc] initWithType:3];
  v10 = [AAUIManateeStateValidator alloc];
  v11 = [(AAUIManateeStateValidator *)v10 initWithFlowContext:v9 withPresentingViewController:v22[5]];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __105__AAUIAccountBeneficiaryManagementHook__showAccountBeneficiaryManagementWithServerAttributes_completion___block_invoke;
  v14[3] = &unk_263F940A0;
  objc_super v12 = v11;
  v15 = v12;
  objc_copyWeak(&v19, &location);
  v18 = &v21;
  v16 = self;
  id v13 = v7;
  id v17 = v13;
  [(AAUIManateeStateValidator *)v12 verifyAndRepairManateeWithCompletion:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v21, 8);
}

void __105__AAUIAccountBeneficiaryManagementHook__showAccountBeneficiaryManagementWithServerAttributes_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (a2)
  {
    if (+[AAUIFeatureFlags isSignInSecurityRedesignEnabled])
    {
      id v7 = _AAUILogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __105__AAUIAccountBeneficiaryManagementHook__showAccountBeneficiaryManagementWithServerAttributes_completion___block_invoke_cold_1(v7);
      }

      id v8 = +[AAUILegacyContactsViewFactory createWithViewModel:WeakRetained[2]];
    }
    else
    {
      id v8 = [[AAUIAccountBeneficiaryViewController alloc] initWithAccountManager:*(void *)(*(void *)(a1 + 40) + 8)];
    }
    v11 = v8;
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) showViewController:v8 sender:WeakRetained];

    v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke_cold_2((id *)(a1 + 64), (uint64_t)v5, v9);
    }

    v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v10();
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legacyContactsViewModel, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __105__AAUIAccountBeneficiaryManagementHook__showAccountBeneficiaryManagementWithServerAttributes_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Presenting new Legacy Contacts UI", v1, 2u);
}

@end