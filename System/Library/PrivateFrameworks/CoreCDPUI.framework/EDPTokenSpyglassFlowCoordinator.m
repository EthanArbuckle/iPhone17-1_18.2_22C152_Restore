@interface EDPTokenSpyglassFlowCoordinator
- (AAUIGrandSlamRemoteUIPresenter)presenter;
- (AIDAAccountManager)accountManager;
- (EDPTokenSpyglassFlowCoordinator)initWithRequest:(id)a3 presentingViewController:(id)a4;
- (NSURLRequest)request;
- (UIViewController)presentingViewController;
- (id)accountsForAccountManager:(id)a3;
- (void)loadViewWithCompletion:(id)a3;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation EDPTokenSpyglassFlowCoordinator

- (EDPTokenSpyglassFlowCoordinator)initWithRequest:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EDPTokenSpyglassFlowCoordinator;
  v8 = [(EDPTokenSpyglassFlowCoordinator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(EDPTokenSpyglassFlowCoordinator *)v8 setRequest:v6];
    [(EDPTokenSpyglassFlowCoordinator *)v9 setPresentingViewController:v7];
  }

  return v9;
}

- (void)loadViewWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F26D70]);
  id v6 = [MEMORY[0x263EFB210] defaultStore];
  id v7 = (void *)[v5 initWithAccountStore:v6];
  [(EDPTokenSpyglassFlowCoordinator *)self setAccountManager:v7];

  v8 = [(EDPTokenSpyglassFlowCoordinator *)self accountManager];
  [v8 setDelegate:self];

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v9 = (void *)getAAUIGrandSlamRemoteUIPresenterClass_softClass;
  uint64_t v25 = getAAUIGrandSlamRemoteUIPresenterClass_softClass;
  if (!getAAUIGrandSlamRemoteUIPresenterClass_softClass)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __getAAUIGrandSlamRemoteUIPresenterClass_block_invoke;
    v21[3] = &unk_26433D708;
    v21[4] = &v22;
    __getAAUIGrandSlamRemoteUIPresenterClass_block_invoke((uint64_t)v21);
    v9 = (void *)v23[3];
  }
  v10 = v9;
  _Block_object_dispose(&v22, 8);
  id v11 = [v10 alloc];
  v12 = [(EDPTokenSpyglassFlowCoordinator *)self accountManager];
  v13 = [(EDPTokenSpyglassFlowCoordinator *)self presentingViewController];
  v14 = (void *)[v11 initWithAccountManager:v12 presenter:v13];
  [(EDPTokenSpyglassFlowCoordinator *)self setPresenter:v14];

  v15 = [(EDPTokenSpyglassFlowCoordinator *)self presenter];
  [v15 setDelegate:self];

  v16 = [(EDPTokenSpyglassFlowCoordinator *)self presenter];
  v17 = [(EDPTokenSpyglassFlowCoordinator *)self request];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__EDPTokenSpyglassFlowCoordinator_loadViewWithCompletion___block_invoke;
  v19[3] = &unk_26433CBB0;
  id v20 = v4;
  id v18 = v4;
  [v16 loadRequest:v17 completion:v19];
}

void __58__EDPTokenSpyglassFlowCoordinator_loadViewWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__EDPTokenSpyglassFlowCoordinator_loadViewWithCompletion___block_invoke_2;
  block[3] = &unk_26433CF20;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __58__EDPTokenSpyglassFlowCoordinator_loadViewWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[EDPTokenSpyglassFlowCoordinator remoteUIRequestComplete:error:](v4);
  }
}

- (id)accountsForAccountManager:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263F34328], "sharedInstance", a3);
  id v4 = [v3 primaryAppleAccount];

  if (v4)
  {
    uint64_t v8 = *MEMORY[0x263F26D28];
    v9[0] = v4;
    id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[EDPTokenSpyglassFlowCoordinator accountsForAccountManager:](v6);
    }

    id v5 = (void *)MEMORY[0x263EFFA78];
  }

  return v5;
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (AAUIGrandSlamRemoteUIPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_presenter, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)remoteUIRequestComplete:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[EDPTokenSpyglassFlowCoordinator remoteUIRequestComplete:error:]";
  _os_log_debug_impl(&dword_2187CF000, log, OS_LOG_TYPE_DEBUG, "%s: Doing nothing.", (uint8_t *)&v1, 0xCu);
}

- (void)accountsForAccountManager:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[EDPTokenSpyglassFlowCoordinator accountsForAccountManager:]";
  _os_log_error_impl(&dword_2187CF000, log, OS_LOG_TYPE_ERROR, "%s: No primary account found. Returning empty dictionary", (uint8_t *)&v1, 0xCu);
}

@end