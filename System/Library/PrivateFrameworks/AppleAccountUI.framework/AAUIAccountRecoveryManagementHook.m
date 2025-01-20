@interface AAUIAccountRecoveryManagementHook
- (AAUIAccountRecoveryManagementHook)initWithAccountManager:(id)a3 recoveryContactsViewModel:(id)a4;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (unint64_t)_presentationTypeForString:(id)a3;
- (void)_presentWithBasePresentationMode:(id)a3 fromCurrentViewController:(id)a4 completion:(id)a5;
- (void)_showAccountRecoveryManagementWithServerAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUIAccountRecoveryManagementHook

- (AAUIAccountRecoveryManagementHook)initWithAccountManager:(id)a3 recoveryContactsViewModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIAccountRecoveryManagementHook;
  v9 = [(AAUIAccountRecoveryManagementHook *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_recoveryContactsViewModel, a4);
  }

  return v10;
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"recoveryOptions:show"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKey:*MEMORY[0x263F63818]];
  char v5 = [v4 isEqualToString:@"recoveryOptions:show"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(AAUIAccountRecoveryManagementHook *)self _showAccountRecoveryManagementWithServerAttributes:v7 completion:v6];
}

- (void)_showAccountRecoveryManagementWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F63848]];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AAUIAccountRecoveryManagementHook _showAccountRecoveryManagementWithServerAttributes:completion:]((uint64_t)v9, v10);
  }

  self->_presentationType = [(AAUIAccountRecoveryManagementHook *)self _presentationTypeForString:v9];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v28 = [WeakRetained presentationContextForHook:self];

  objc_super v12 = [[AAUID2DEncryptionFlowContext alloc] initWithType:2];
  v13 = [AAUIManateeStateValidator alloc];
  v14 = [(AAUIManateeStateValidator *)v13 initWithFlowContext:v12 withPresentingViewController:v24[5]];
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke;
  v17[3] = &unk_263F927D0;
  v15 = v14;
  v18 = v15;
  objc_copyWeak(&v21, &location);
  v20 = &v23;
  id v16 = v7;
  id v19 = v16;
  [(AAUIManateeStateValidator *)v15 repairIfPrimaryAppleAccountIsCDP:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v23, 8);
}

void __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && a2)
  {
    if (+[AAUIFeatureFlags isSignInSecurityRedesignEnabled])
    {
      id v7 = _AAUILogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke_cold_1(v7);
      }

      id v8 = +[AAUIRecoveryContactsViewFactory createWithViewModel:WeakRetained[2]];
      id v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    else
    {
      id v8 = [[AAUIAccountRecoveryViewController alloc] initWithAccountManager:WeakRetained[1]];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      if (!WeakRetained[3])
      {
        [WeakRetained _presentWithBasePresentationMode:v8 fromCurrentViewController:*(void *)(v11 + 40) completion:*(void *)(a1 + 40)];
        goto LABEL_13;
      }
      id v9 = *(void **)(v11 + 40);
    }
    [v9 showViewController:v8 sender:WeakRetained];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_13:

    goto LABEL_14;
  }
  v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke_cold_2((id *)(a1 + 56), (uint64_t)v5, v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_14:
}

- (void)_presentWithBasePresentationMode:(id)a3 fromCurrentViewController:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  objc_opt_class();
  id v10 = v8;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  objc_opt_class();
  objc_opt_class();
  id v12 = [v11 hostViewController];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  v14 = _AAUILogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2112;
    id v29 = v13;
    _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "Base presentation was specified. Dismissing current vc %@ as modal %@ and showing on host %@.", buf, 0x20u);
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __107__AAUIAccountRecoveryManagementHook__presentWithBasePresentationMode_fromCurrentViewController_completion___block_invoke;
  v19[3] = &unk_263F927F8;
  id v20 = v10;
  id v21 = v13;
  id v22 = v7;
  id v23 = v9;
  id v15 = v9;
  id v16 = v7;
  id v17 = v13;
  id v18 = v10;
  [v18 dismissViewControllerAnimated:1 completion:v19];
}

uint64_t __107__AAUIAccountRecoveryManagementHook__presentWithBasePresentationMode_fromCurrentViewController_completion___block_invoke(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __107__AAUIAccountRecoveryManagementHook__presentWithBasePresentationMode_fromCurrentViewController_completion___block_invoke_cold_1(a1, v2);
  }

  [*(id *)(a1 + 40) pushViewController:*(void *)(a1 + 48) animated:1];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (unint64_t)_presentationTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F63838]])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F63840]])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F63850]])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
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
  objc_storeStrong((id *)&self->_recoveryContactsViewModel, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_showAccountRecoveryManagementWithServerAttributes:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Found presentation type %@ from attributes", (uint8_t *)&v2, 0xCu);
}

void __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Presenting new Recovery Contacts UI", v1, 2u);
}

void __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1);
  int v6 = 138412546;
  uint64_t v7 = objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_209754000, a3, OS_LOG_TYPE_ERROR, "%@ - Unable to validate CDP state. Stopping flow with error %@", (uint8_t *)&v6, 0x16u);
}

void __107__AAUIAccountRecoveryManagementHook__presentWithBasePresentationMode_fromCurrentViewController_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Finished dismissing currentViewController %@, now showing host %@", (uint8_t *)&v4, 0x16u);
}

@end