@interface FARemoteServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismissAndExit;
- (void)_main_dismissAndExit;
- (void)_presentAsChildViewController:(id)a3;
- (void)_removeChildViewControllers;
- (void)_showFamilyFlow;
- (void)_showLoadingView;
- (void)dealloc;
- (void)dismissModalRUIController:(id)a3 completion:(id)a4;
- (void)presentModalRUIController:(id)a3 completion:(id)a4;
- (void)replaceModalRUIController:(id)a3 byController:(id)a4 completion:(id)a5;
- (void)ruiDidDismissAlertController:(id)a3;
- (void)ruiPresentAlertController:(id)a3;
- (void)startFlowWithContext:(id)a3;
- (void)viewDidLoad;
@end

@implementation FARemoteServiceViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)FARemoteServiceViewController;
  [(FARemoteServiceViewController *)&v2 viewDidLoad];
}

- (void)presentModalRUIController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(FARemoteServiceViewController *)self _presentAsChildViewController:v7];
  if (v6) {
    v8 = v6;
  }
  else {
    v8 = &__block_literal_global_15;
  }
  id v11 = _Block_copy(v8);

  v9 = [(FARemoteServiceViewController *)self _remoteViewControllerProxy];
  uint64_t v10 = [v7 ruiModalPresentationStyle];

  [v9 presentWithRUIModalPresentationStyle:v10 completion:v11];
}

- (void)dismissModalRUIController:(id)a3 completion:(id)a4
{
  if (a4) {
    id v5 = a4;
  }
  else {
    id v5 = &__block_literal_global_24;
  }
  id v7 = (void (**)(void))_Block_copy(v5);
  v7[2]();
  id v6 = [(FARemoteServiceViewController *)self _remoteViewControllerProxy];
  [v6 dismissWithCompletion:&__block_literal_global_26];
}

- (void)replaceModalRUIController:(id)a3 byController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(FARemoteServiceViewController *)self _remoteViewControllerProxy];
  uint64_t v12 = [v8 ruiModalPresentationStyle];
  uint64_t v13 = [v9 ruiModalPresentationStyle];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __83__FARemoteServiceViewController_replaceModalRUIController_byController_completion___block_invoke;
  v17[3] = &unk_2643493F0;
  v17[4] = self;
  id v18 = v9;
  id v19 = v8;
  id v20 = v10;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  [v11 replaceModalRUIControllerWithStyle:v12 byController:v13 completion:v17];
}

uint64_t __83__FARemoteServiceViewController_replaceModalRUIController_byController_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _presentAsChildViewController:*(void *)(a1 + 40)];
  objc_super v2 = [*(id *)(a1 + 48) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 48) removeFromParentViewController];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)ruiPresentAlertController:(id)a3
{
  id v4 = a3;
  id v5 = [(FARemoteServiceViewController *)self childViewControllers];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [(FARemoteServiceViewController *)self presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    id v7 = [(FARemoteServiceViewController *)self _remoteViewControllerProxy];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__FARemoteServiceViewController_ruiPresentAlertController___block_invoke;
    v8[3] = &unk_264348AE0;
    v8[4] = self;
    id v9 = v4;
    [v7 presentAlertProxyWithCompletion:v8];
  }
}

uint64_t __59__FARemoteServiceViewController_ruiPresentAlertController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)ruiDidDismissAlertController:(id)a3
{
  id v4 = [(FARemoteServiceViewController *)self childViewControllers];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    id v6 = [(FARemoteServiceViewController *)self _remoteViewControllerProxy];
    [v6 dismissAlertProxyWithCompletion:&__block_literal_global_28];
  }
}

- (void)startFlowWithContext:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_circleContext, a3);
  if ([(FACircleContext *)self->_circleContext activityIndicatorStyle] == 1)
  {
    uint64_t v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
    id v6 = [(FARemoteServiceViewController *)self view];
    [v6 setBackgroundColor:v5];

    [(FARemoteServiceViewController *)self _showLoadingView];
  }
  [(FARemoteServiceViewController *)self _showFamilyFlow];
}

- (void)_showLoadingView
{
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __49__FARemoteServiceViewController__showLoadingView__block_invoke;
  id v10 = &unk_264349EA0;
  objc_copyWeak(&v11, &location);
  v3 = +[FASwiftUIHostingControllerProvider getLoadingControllerWithCancelAction:&v7];
  id v4 = objc_alloc(MEMORY[0x263F829B8]);
  uint64_t v5 = objc_msgSend(v4, "initWithRootViewController:", v3, v7, v8, v9, v10);
  id v6 = [v5 navigationBar];
  [v6 setRequestedContentSize:3];

  [(FARemoteServiceViewController *)self _presentAsChildViewController:v5];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__FARemoteServiceViewController__showLoadingView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _remoteViewControllerProxy];
  [v1 dismissWithCompletion:&__block_literal_global_31];
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA80358];
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA80790];
}

- (void)_showFamilyFlow
{
  v3 = [[FACircleStateController alloc] initWithPresenter:self];
  [(FACircleStateController *)v3 setPresentationType:1];
  circleContext = self->_circleContext;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__FARemoteServiceViewController__showFamilyFlow__block_invoke;
  v6[3] = &unk_2643495B0;
  v6[4] = self;
  uint64_t v7 = v3;
  uint64_t v5 = v3;
  [(FACircleStateController *)v5 _performOperationWithContext:circleContext viewController:self completion:v6];
}

uint64_t __48__FARemoteServiceViewController__showFamilyFlow__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _remoteViewControllerProxy];
  [v5 operationFinishedWithResponse:v4];

  id v6 = *(void **)(a1 + 32);
  return [v6 _dismissAndExit];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl(&dword_2189F0000, v3, OS_LOG_TYPE_DEFAULT, "%@ deallocated", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)FARemoteServiceViewController;
  [(FARemoteServiceViewController *)&v4 dealloc];
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)_removeChildViewControllers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(FARemoteServiceViewController *)self childViewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v9 = [v8 view];
        [v9 removeFromSuperview];

        [(FARemoteServiceViewController *)self removeChildViewController:v8 notifyDidMove:1];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_presentAsChildViewController:(id)a3
{
  id v27 = a3;
  [(FARemoteServiceViewController *)self _removeChildViewControllers];
  [(FARemoteServiceViewController *)self addChildViewController:v27];
  uint64_t v4 = [(FARemoteServiceViewController *)self view];
  uint64_t v5 = [v27 view];
  [v4 addSubview:v5];

  uint64_t v6 = [v27 view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v7 = [v27 view];
  uint64_t v8 = [v7 topAnchor];
  id v9 = [(FARemoteServiceViewController *)self view];
  long long v10 = [v9 topAnchor];
  long long v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  long long v12 = [v27 view];
  long long v13 = [v12 bottomAnchor];
  id v14 = [(FARemoteServiceViewController *)self view];
  uint64_t v15 = [v14 bottomAnchor];
  id v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [v27 view];
  id v18 = [v17 leftAnchor];
  id v19 = [(FARemoteServiceViewController *)self view];
  id v20 = [v19 leftAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = [v27 view];
  v23 = [v22 rightAnchor];
  v24 = [(FARemoteServiceViewController *)self view];
  v25 = [v24 rightAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  [v27 didMoveToParentViewController:self];
}

- (void)_dismissAndExit
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__FARemoteServiceViewController__dismissAndExit__block_invoke;
  block[3] = &unk_2643489F8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__FARemoteServiceViewController__dismissAndExit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_dismissAndExit");
}

- (void)_main_dismissAndExit
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(FARemoteServiceViewController *)self _remoteViewControllerProxy];
  [v3 dismissWithCompletion:&__block_literal_global_56];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupConnection, 0);
  objc_storeStrong((id *)&self->_circleContext, 0);
}

@end