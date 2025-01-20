@interface FLPreferencesFollowUpItemListViewController
- (UIViewController)presentationContext;
- (id)_viewModel;
- (id)detailSpecifiersForFollowUpItem:(id)a3;
- (id)followUpItemSpecifiers;
- (id)specifiers;
- (void)_dismissFlowWithError:(id)a3;
- (void)_showRadarPromptForItem:(id)a3 action:(id)a4;
- (void)actionTapped:(id)a3;
- (void)handleURL:(id)a3;
- (void)preflightNetworkConnectivityForHandler:(id)a3 withCompletionHandler:(id)a4;
- (void)reloadSpecifiers;
- (void)setPresentationContext:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)startPresentingForHandler:(id)a3 withRemoteController:(id)a4;
@end

@implementation FLPreferencesFollowUpItemListViewController

- (id)_viewModel
{
  viewModel = self->_viewModel;
  if (!viewModel)
  {
    v4 = [(FLPreferencesFollowUpItemListViewController *)self specifier];
    v5 = [v4 propertyForKey:*MEMORY[0x263F352B0]];
    v6 = self->_viewModel;
    self->_viewModel = v5;

    objc_initWeak(&location, self);
    v7 = self->_viewModel;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__FLPreferencesFollowUpItemListViewController__viewModel__block_invoke;
    v9[3] = &unk_2645F26F0;
    objc_copyWeak(&v10, &location);
    [(FLViewModel *)v7 setItemChangeHandler:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    viewModel = self->_viewModel;
  }

  return viewModel;
}

void __57__FLPreferencesFollowUpItemListViewController__viewModel__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained followUpItemSpecifiers];
    uint64_t v4 = [v3 count];

    v5 = _FLLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = v4;
      _os_log_impl(&dword_221DA3000, v5, OS_LOG_TYPE_DEFAULT, "FLPreferencesFollowUpItemListViewController: reloading specifiers due to change, specifiers count: %ld", (uint8_t *)&v8, 0xCu);
    }

    if (v2[174]) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    if (v6)
    {
      v7 = _FLLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_221DA3000, v7, OS_LOG_TYPE_DEFAULT, "FLPreferencesFollowUpItemListViewController: dismissing, zero specifiers and no action handler", (uint8_t *)&v8, 2u);
      }

      [v2 _dismissFlowWithError:0];
    }
    else if (v4 >= 1)
    {
      [v2 reloadSpecifiers];
    }
  }
}

- (void)setSpecifier:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F602D0];
  id v5 = a3;
  BOOL v6 = [v5 propertyForKey:v4];
  [(FLPreferencesFollowUpItemListViewController *)self setTitle:v6];

  v7.receiver = self;
  v7.super_class = (Class)FLPreferencesFollowUpItemListViewController;
  [(FLPreferencesFollowUpItemListViewController *)&v7 setSpecifier:v5];
}

- (void)reloadSpecifiers
{
  v2.receiver = self;
  v2.super_class = (Class)FLPreferencesFollowUpItemListViewController;
  [(FLPreferencesFollowUpItemListViewController *)&v2 reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [(FLPreferencesFollowUpItemListViewController *)self followUpItemSpecifiers];
    BOOL v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)handleURL:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_221DA3000, v4, OS_LOG_TYPE_DEFAULT, "Processing preference URL: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)followUpItemSpecifiers
{
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(FLPreferencesFollowUpItemListViewController *)self _viewModel];
  int v5 = [v4 allPendingItems];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __69__FLPreferencesFollowUpItemListViewController_followUpItemSpecifiers__block_invoke;
  v12 = &unk_2645F2718;
  id v13 = v3;
  v14 = self;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:&v9];

  uint64_t v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);

  return v7;
}

void __69__FLPreferencesFollowUpItemListViewController_followUpItemSpecifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) detailSpecifiersForFollowUpItem:a2];
  [v2 addObjectsFromArray:v3];
}

- (id)detailSpecifiersForFollowUpItem:(id)a3
{
  return +[FLPreferencesFollowUpItemListSpeficierFactory detailSpecifiersForFollowUpItem:a3 target:self selector:sel_actionTapped_];
}

- (void)actionTapped:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_221DA3000, v5, OS_LOG_TYPE_DEFAULT, "FLPreferencesFollowUpItemListViewController: action tapped, %@, handling it", buf, 0xCu);
  }

  if (!self->_actionHandler)
  {
    id v6 = objc_alloc_init(FLSpecifierTapHandler);
    actionHandler = self->_actionHandler;
    self->_actionHandler = v6;

    [(FLSpecifierTapHandler *)self->_actionHandler setDelegate:self];
    int v8 = self->_actionHandler;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__FLPreferencesFollowUpItemListViewController_actionTapped___block_invoke;
    v9[3] = &unk_2645F2740;
    void v9[4] = self;
    id v10 = v4;
    [(FLSpecifierTapHandler *)v8 actionTapped:v10 eventSource:4 withCompletionHandler:v9];
  }
}

void __60__FLPreferencesFollowUpItemListViewController_actionTapped___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"SUCCESS";
    }
    int v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_221DA3000, v6, OS_LOG_TYPE_DEFAULT, "FLPreferencesFollowUpItemListViewController: action handler success? %@", (uint8_t *)&v13, 0xCu);
  }

  if ((a2 & 1) == 0)
  {
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = [*(id *)(a1 + 40) propertyForKey:*MEMORY[0x263F352A8]];
    id v10 = [*(id *)(a1 + 40) propertyForKey:*MEMORY[0x263F352A0]];
    [v8 _showRadarPromptForItem:v9 action:v10];
  }
  [*(id *)(a1 + 32) _dismissFlowWithError:v5];
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 1392);
  *(void *)(v11 + 1392) = 0;
}

- (void)startPresentingForHandler:(id)a3 withRemoteController:(id)a4
{
  if (self->_presentationContext) {
    self = (FLPreferencesFollowUpItemListViewController *)self->_presentationContext;
  }
  [(FLPreferencesFollowUpItemListViewController *)self presentViewController:a4 animated:1 completion:0];
}

- (void)preflightNetworkConnectivityForHandler:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [FLNetworkStatePrompter alloc];
  if (self->_presentationContext) {
    presentationContext = (FLPreferencesFollowUpItemListViewController *)self->_presentationContext;
  }
  else {
    presentationContext = self;
  }
  int v8 = [(FLNetworkStatePrompter *)v6 initWithPresenter:presentationContext];
  [(FLNetworkStatePrompter *)v8 preflightNetworkStateWithCompletionHandler:v5];
}

- (void)_showRadarPromptForItem:(id)a3 action:(id)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x263F35370] currentEnvironment];
  int v9 = [v8 isInternal];

  if (v9)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __78__FLPreferencesFollowUpItemListViewController__showRadarPromptForItem_action___block_invoke;
    v15[3] = &unk_2645F2768;
    id v16 = v7;
    id v17 = v6;
    id v10 = +[FLAlertControllerAction actionWithTitle:@"Tap-To-Radar" style:1 handler:v15];
    v18[0] = v10;
    uint64_t v11 = +[FLAlertControllerAction actionWithTitle:@"Dismiss" style:0 handler:0];
    v18[1] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];

    int v13 = [NSString stringWithFormat:@"Follow Up Error [INTERNAL]"];
    v14 = [NSString stringWithFormat:@"Did you notice an error? If so, file a radar."];
    +[FLAlertControllerHelper presentAlertWithTitle:v13 message:v14 actions:v12 presentingController:self];
  }
}

void __78__FLPreferencesFollowUpItemListViewController__showRadarPromptForItem_action___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) label];
  objc_super v2 = [NSString stringWithFormat:@"We failed to handle a CFU action [%@]", v7];
  id v3 = (void *)MEMORY[0x263F353C0];
  id v4 = NSString;
  id v5 = [*(id *)(a1 + 40) extensionIdentifier];
  id v6 = [v4 stringWithFormat:@"CFU extension failure: [%@]", v5];
  [v3 tapToRadarWithTitle:v6 initialMessage:v2];
}

- (void)_dismissFlowWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FLPreferencesFollowUpItemListViewController *)self followUpItemSpecifiers];
  uint64_t v6 = [v5 count];

  id v7 = _FLLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_impl(&dword_221DA3000, v7, OS_LOG_TYPE_DEFAULT, "FLPreferencesFollowUpItemListViewController: Checking dismiss flow with error %@, specifiers count: %ld", (uint8_t *)&v8, 0x16u);
  }

  if (v6) {
    [(FLPreferencesFollowUpItemListViewController *)self reloadSpecifiers];
  }
  else {
    [(FLPreferencesFollowUpItemListViewController *)self popRecursivelyToRootController];
  }
}

- (UIViewController)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end