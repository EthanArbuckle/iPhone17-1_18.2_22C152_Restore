@interface DKPresenter
+ (void)presentInSettings;
+ (void)presentUsingParentViewController:(id)a3;
+ (void)presentUsingParentViewController:(id)a3 completion:(id)a4;
+ (void)presentUsingParentViewController:(id)a3 configuration:(id)a4 completion:(id)a5;
+ (void)presentUsingParentViewController:(id)a3 configuration:(id)a4 willPresent:(id)a5 completion:(id)a6;
@end

@implementation DKPresenter

+ (void)presentUsingParentViewController:(id)a3
{
  id v4 = a3;
  id v5 = +[DKConfiguration defaultConfiguration];
  [a1 presentUsingParentViewController:v4 configuration:v5 completion:0];
}

+ (void)presentUsingParentViewController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[DKConfiguration defaultConfiguration];
  [a1 presentUsingParentViewController:v7 configuration:v8 completion:v6];
}

+ (void)presentUsingParentViewController:(id)a3 configuration:(id)a4 completion:(id)a5
{
}

+ (void)presentUsingParentViewController:(id)a3 configuration:(id)a4 willPresent:(id)a5 completion:(id)a6
{
  id v9 = a3;
  v10 = (void (**)(id, DKEraseFlow *))a5;
  id v11 = a6;
  id v12 = a4;
  v13 = objc_alloc_init(DKNavigationController);
  v14 = objc_opt_new();
  [(DKNavigationController *)v13 pushViewController:v14 animated:0];
  v15 = [[DKEraseFlow alloc] initWithNavigationController:v13 configuration:v12];

  if (v10) {
    v10[2](v10, v15);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __85__DKPresenter_presentUsingParentViewController_configuration_willPresent_completion___block_invoke;
  v20[3] = &unk_264CF1098;
  v21 = v15;
  v22 = v13;
  id v23 = v14;
  id v24 = v11;
  id v16 = v11;
  id v17 = v14;
  v18 = v13;
  v19 = v15;
  [(DKEraseFlow *)v19 showFlowContainerFromParentViewController:v9 completion:v20];
}

void __85__DKPresenter_presentUsingParentViewController_configuration_willPresent_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __85__DKPresenter_presentUsingParentViewController_configuration_willPresent_completion___block_invoke_2;
  v3[3] = &unk_264CF1098;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v4 prepareFlow:v3];
}

void __85__DKPresenter_presentUsingParentViewController_configuration_willPresent_completion___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) startFlow];
  v3 = [*(id *)(a1 + 40) viewControllers];
  id v5 = (id)[v3 mutableCopy];

  [v5 removeObject:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) setViewControllers:v5 animated:0];
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

+ (void)presentInSettings
{
  id v2 = _DKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_237B3F000, v2, OS_LOG_TYPE_DEFAULT, "Launching settings...", v5, 2u);
  }

  v3 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v4 = [NSURL URLWithString:@"prefs://root=General&path=Reset/exitBuddy"];
  [v3 openSensitiveURL:v4 withOptions:0];
}

@end