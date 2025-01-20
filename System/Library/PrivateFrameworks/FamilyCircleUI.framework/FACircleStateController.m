@interface FACircleStateController
- (BOOL)_contextRequiresRemoteService:(id)a3;
- (BOOL)_processRequiresSpringBoardServices;
- (BOOL)isCanceled;
- (FACirclePresenter)circlePresenter;
- (FACircleStateController)init;
- (FACircleStateController)initWithPresenter:(id)a3;
- (FACircleStateController)initWithRequestConfigurator:(id)a3 presenter:(id)a4 circlePresenterFactory:(id)a5;
- (FARequestConfigurator)requestConfigurator;
- (RUIStyle)customRUIStyle;
- (UIViewController)presenter;
- (id)_whitelistedInProcessClients;
- (id)circlePresenterFactory;
- (id)completion;
- (id)presentationHandler;
- (int64_t)modalPresentationStyle;
- (unint64_t)presentationType;
- (void)_ensurePresenterWithCompletion:(id)a3;
- (void)_performOperationWithContext:(id)a3 viewController:(id)a4 completion:(id)a5;
- (void)_presentFlowUsingSpringBoardWithContext:(id)a3 completion:(id)a4;
- (void)_presentPlatformUnsupportedAlertWithCompletion:(id)a3;
- (void)_presentViewServiceWithContext:(id)a3 viewController:(id)a4 completion:(id)a5;
- (void)cancel;
- (void)circlePresenterDidPresent:(id)a3;
- (void)dealloc;
- (void)performOperationWithContext:(id)a3 completion:(id)a4;
- (void)performWithContext:(id)a3 completion:(id)a4;
- (void)remoteViewControllerDidStartFlow:(id)a3;
- (void)setCirclePresenter:(id)a3;
- (void)setCirclePresenterFactory:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCustomRUIStyle:(id)a3;
- (void)setIsCanceled:(BOOL)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setPresentationHandler:(id)a3;
- (void)setPresentationType:(unint64_t)a3;
- (void)setPresenter:(id)a3;
- (void)setRequestConfigurator:(id)a3;
@end

@implementation FACircleStateController

- (FACircleStateController)initWithRequestConfigurator:(id)a3 presenter:(id)a4 circlePresenterFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)FACircleStateController;
  v12 = [(FACircleStateController *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestConfigurator, a3);
    objc_storeWeak((id *)&v13->_presenter, v10);
    v14 = _Block_copy(v11);
    id circlePresenterFactory = v13->_circlePresenterFactory;
    v13->_id circlePresenterFactory = v14;

    v13->_isCanceled = 0;
    v16 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v17 = [v16 userInterfaceIdiom];

    uint64_t v18 = 2;
    if (v17 != 1) {
      uint64_t v18 = -2;
    }
    v13->_modalPresentationStyle = v18;
  }

  return v13;
}

- (void)cancel
{
  [(FACircleStateController *)self setIsCanceled:1];
  v3 = [(FACircleStateController *)self circlePresenter];
  [v3 cancel];

  [(FACircleStateController *)self setCirclePresenter:0];
  v4 = [(FACircleStateController *)self completion];

  if (v4)
  {
    objc_msgSend(MEMORY[0x263F087E8], "fa_familyErrorWithCode:", -1018);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = [(FACircleStateController *)self completion];
    v6 = (void *)[objc_alloc(MEMORY[0x263F3BEF0]) initWithLoadSuccess:0 error:v7 userInfo:0];
    ((void (**)(void, void *))v5)[2](v5, v6);

    [(FACircleStateController *)self setCompletion:0];
  }
}

- (FACircleStateController)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F3BFA8]);
  v4 = [(FACircleStateController *)self initWithRequestConfigurator:v3 presenter:0 circlePresenterFactory:&__block_literal_global_9];

  return v4;
}

FACirclePresenter *__31__FACircleStateController_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [[FACirclePresenter alloc] initWithPresenter:v5 context:v4];

  return v6;
}

- (FACircleStateController)initWithPresenter:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F3BFA8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(FACircleStateController *)self initWithRequestConfigurator:v6 presenter:v5 circlePresenterFactory:&__block_literal_global_22];

  return v7;
}

FACirclePresenter *__45__FACircleStateController_initWithPresenter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[FACirclePresenter alloc] initWithPresenter:v5 context:v4];

  return v6;
}

- (void)performOperationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__FACircleStateController_performOperationWithContext_completion___block_invoke;
  v8[3] = &unk_264348E70;
  id v9 = v6;
  id v7 = v6;
  [(FACircleStateController *)self performWithContext:a3 completion:v8];
}

void __66__FACircleStateController_performOperationWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    uint64_t v4 = [v3 loadSuccess];
    id v5 = [v3 error];

    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
  }
}

- (void)performWithContext:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v19 = v6;
    _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "Performing operation with context: %{private}@", buf, 0xCu);
  }

  [(FACircleStateController *)self setCompletion:v7];
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__FACircleStateController_performWithContext_completion___block_invoke;
  aBlock[3] = &unk_264349628;
  objc_copyWeak(&v17, (id *)buf);
  id v9 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__FACircleStateController_performWithContext_completion___block_invoke_2;
  v12[3] = &unk_2643496C8;
  objc_copyWeak(&v15, (id *)buf);
  id v10 = v6;
  id v13 = v10;
  id v11 = v9;
  id v14 = v11;
  [(FACircleStateController *)self _ensurePresenterWithCompletion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __57__FACircleStateController_performWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained completion];

  if (v4)
  {
    id v5 = [WeakRetained completion];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
  [WeakRetained setCompletion:0];
}

void __57__FACircleStateController_performWithContext_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!v5)
  {
    v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "No presenter provided", buf, 2u);
    }
  }
  if ([a1[4] isPlatformSupported])
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__FACircleStateController_performWithContext_completion___block_invoke_24;
    aBlock[3] = &unk_264349678;
    objc_copyWeak(&v22, a1 + 6);
    id v19 = a1[4];
    id v9 = v5;
    id v20 = v9;
    id v21 = a1[5];
    id v10 = _Block_copy(aBlock);
    if ([WeakRetained _contextRequiresRemoteService:a1[4]])
    {
      if ([WeakRetained _processRequiresSpringBoardServices])
      {
        id v11 = _FALogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2189F0000, v11, OS_LOG_TYPE_DEFAULT, "Presenting flow using springboard...", buf, 2u);
        }

        [WeakRetained _presentFlowUsingSpringBoardWithContext:a1[4] completion:a1[5]];
      }
      else
      {
        id v14 = _FALogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2189F0000, v14, OS_LOG_TYPE_DEFAULT, "Presenting flow using UIRemoteViewController...", buf, 2u);
        }

        [WeakRetained _presentViewServiceWithContext:a1[4] viewController:v9 completion:a1[5]];
      }
    }
    else
    {
      v12 = _FALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __57__FACircleStateController_performWithContext_completion___block_invoke_2_cold_1(v12);
      }

      id v13 = a1[4];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __57__FACircleStateController_performWithContext_completion___block_invoke_27;
      v15[3] = &unk_2643496A0;
      id v16 = v10;
      id v17 = a1[5];
      [WeakRetained _performOperationWithContext:v13 viewController:v9 completion:v15];
    }
    objc_destroyWeak(&v22);
  }
  else
  {
    [WeakRetained _presentPlatformUnsupportedAlertWithCompletion:a1[5]];
  }
}

void __57__FACircleStateController_performWithContext_completion___block_invoke_24(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "Renewing credentials and trying operation one more time...", buf, 2u);
  }

  v8 = [WeakRetained requestConfigurator];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__FACircleStateController_performWithContext_completion___block_invoke_25;
  v10[3] = &unk_264349650;
  objc_copyWeak(&v15, a1 + 7);
  id v11 = a1[4];
  id v12 = a1[5];
  id v14 = a1[6];
  char v16 = a2;
  id v9 = v5;
  id v13 = v9;
  [v8 renewCredentialsWithCompletion:v10];

  objc_destroyWeak(&v15);
}

void __57__FACircleStateController_performWithContext_completion___block_invoke_25(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v6 = WeakRetained;
  if (a2)
  {
    [WeakRetained _performOperationWithContext:*(void *)(a1 + 32) viewController:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F3BEF0]) initWithLoadSuccess:*(unsigned __int8 *)(a1 + 72) error:*(void *)(a1 + 48) userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __57__FACircleStateController_performWithContext_completion___block_invoke_27(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 error];
  uint64_t v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F3BDC0]];

  id v6 = [v3 domain];
  if ([v6 isEqualToString:*MEMORY[0x263F3BDB8]] && objc_msgSend(v3, "code") == -1002)
  {
    uint64_t v7 = [v5 statusCode];

    if (v7 == 401)
    {
      (*(void (**)(void, uint64_t, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v8 loadSuccess], v3);
      goto LABEL_7;
    }
  }
  else
  {
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_7:
}

- (void)_presentPlatformUnsupportedAlertWithCompletion:(id)a3
{
  id v4 = a3;
  id v19 = [(FACircleStateController *)self presenter];
  id v5 = (void *)MEMORY[0x263F82418];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"FEATURE_NOT_SUPPORTED_TITLE" value:&stru_26CA2C800 table:@"Localizable"];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"FEATURE_NOT_SUPPORTED_DESCRIPTION" value:&stru_26CA2C800 table:@"Localizable"];
  id v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  id v11 = (void *)MEMORY[0x263F827E8];
  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v11 imageNamed:@"family" inBundle:v12];

  [v10 setImage:v13];
  id v14 = (void *)MEMORY[0x263F82400];
  id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v16 = [v15 localizedStringForKey:@"OK" value:&stru_26CA2C800 table:@"Localizable"];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __74__FACircleStateController__presentPlatformUnsupportedAlertWithCompletion___block_invoke;
  v20[3] = &unk_264349588;
  id v21 = v4;
  id v17 = v4;
  uint64_t v18 = [v14 actionWithTitle:v16 style:0 handler:v20];
  [v10 addAction:v18];

  [v19 presentViewController:v10 animated:1 completion:0];
}

void __74__FACircleStateController__presentPlatformUnsupportedAlertWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F087E8], "fa_familyErrorWithCode:", -1003);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F3BEF0]) initWithLoadSuccess:0 error:v3 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_ensurePresenterWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void *, void))a3;
  id v4 = [(FACircleStateController *)self presenter];
  if (v4)
  {
    v6[2](v6, v4, 0);
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3BDB8] code:-1000 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v5);
  }
}

- (void)setPresenter:(id)a3
{
  p_presenter = &self->_presenter;
  id v5 = a3;
  objc_storeWeak((id *)p_presenter, v5);
  [(FACirclePresenter *)self->_circlePresenter setPresenter:v5];
}

- (BOOL)_contextRequiresRemoteService:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    unint64_t v16 = [(FACircleStateController *)self presentationType];
    _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "presentationtype: %lu", (uint8_t *)&v15, 0xCu);
  }

  if ([(FACircleStateController *)self presentationType] == 1)
  {
    char v6 = 0;
  }
  else if ([(FACircleStateController *)self presentationType] == 2)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [(FACircleStateController *)self _whitelistedInProcessClients];
    id v8 = [v4 clientBundleID];
    id v9 = [v8 lowercaseString];
    int v10 = [v7 containsObject:v9];

    id v11 = _FALogSystem();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        id v13 = [v4 clientBundleID];
        int v15 = 138412290;
        unint64_t v16 = (unint64_t)v13;
        _os_log_impl(&dword_2189F0000, v11, OS_LOG_TYPE_DEFAULT, "%@ is allowed in process UI", (uint8_t *)&v15, 0xCu);
      }
    }
    else if (v12)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_2189F0000, v11, OS_LOG_TYPE_DEFAULT, "Context requires remote service", (uint8_t *)&v15, 2u);
    }
    char v6 = v10 ^ 1;
  }
  return v6;
}

- (id)_whitelistedInProcessClients
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.preferences", @"com.apple.bridge", 0);
}

- (BOOL)_processRequiresSpringBoardServices
{
  uint64_t v2 = [MEMORY[0x263F82438] sharedApplication];
  char v3 = [v2 isSuspended];

  return v3;
}

- (void)_presentFlowUsingSpringBoardWithContext:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v12 = @"FARemoteAlertServiceUserInfoContextData";
  char v6 = [a3 dataRepresentation];
  v13[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];

  id v8 = objc_alloc_init(MEMORY[0x263F3BF80]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__FACircleStateController__presentFlowUsingSpringBoardWithContext_completion___block_invoke;
  v10[3] = &unk_264348E70;
  id v11 = v5;
  id v9 = v5;
  [v8 launchOutOfProcessUIWithOptions:v7 completion:v10];
}

void __78__FACircleStateController__presentFlowUsingSpringBoardWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__FACircleStateController__presentFlowUsingSpringBoardWithContext_completion___block_invoke_2;
  v6[3] = &unk_264348F58;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __78__FACircleStateController__presentFlowUsingSpringBoardWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_presentViewServiceWithContext:(id)a3 viewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t modalPresentationStyle = self->_modalPresentationStyle;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__FACircleStateController__presentViewServiceWithContext_viewController_completion___block_invoke;
  v16[3] = &unk_2643496F0;
  id v19 = v10;
  int64_t v20 = modalPresentationStyle;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  id v15 = +[FARemoteViewController requestViewControllerWithCompletion:v16];
}

void __84__FACircleStateController__presentViewServiceWithContext_viewController_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [v8 setModalPresentationStyle:a1[8]];
  if (v5)
  {
    uint64_t v6 = a1[7];
    if (v6)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x263F3BEF0]) initWithLoadSuccess:0 error:v5 userInfo:0];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
  }
  else
  {
    [v8 setDelegate:a1[4]];
    [v8 startFlowWithContext:a1[5] viewController:a1[6] completion:a1[7]];
  }
}

- (void)_performOperationWithContext:(id)a3 viewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(FACircleStateController *)self requestConfigurator];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke;
  v14[3] = &unk_264349740;
  objc_copyWeak(&v18, &location);
  id v12 = v8;
  id v15 = v12;
  id v13 = v10;
  unint64_t v16 = self;
  id v17 = v13;
  [v11 requestForContext:v12 withCompletion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (!v5)
  {
    id v12 = _FALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke_cold_1(a1, v12);
    }

    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F3BDB8];
    uint64_t v11 = -1001;
    goto LABEL_7;
  }
  if ([WeakRetained isCanceled])
  {
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F3BDB8];
    uint64_t v11 = -1018;
LABEL_7:
    id v13 = [v9 errorWithDomain:v10 code:v11 userInfo:0];
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = (void *)[objc_alloc(MEMORY[0x263F3BEF0]) initWithLoadSuccess:0 error:v13 userInfo:0];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

    goto LABEL_11;
  }
  unint64_t v16 = [v8 circlePresenterFactory];
  id v17 = [v8 presenter];
  id v18 = ((void (**)(void, void *, void))v16)[2](v16, v17, *(void *)(a1 + 32));
  [v8 setCirclePresenter:v18];

  id v19 = [v8 customRUIStyle];

  if (v19)
  {
    int64_t v20 = [v8 circlePresenter];
    id v21 = [v8 customRUIStyle];
    [v20 setCustomRUIStyle:v21];
  }
  uint64_t v22 = *(void *)(a1 + 40);
  v23 = [v8 circlePresenter];
  [v23 setDelegate:v22];

  v24 = [v8 circlePresenter];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke_66;
  v25[3] = &unk_264349718;
  objc_copyWeak(&v28, (id *)(a1 + 56));
  id v26 = *(id *)(a1 + 32);
  id v27 = *(id *)(a1 + 48);
  [v24 loadRequest:v5 completion:v25];

  objc_destroyWeak(&v28);
LABEL_11:
}

void __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke_66(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCirclePresenter:0];
  int v5 = [v3 loadSuccess];
  id v6 = _FALogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138477827;
      uint64_t v10 = v8;
      _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "Successfully completed flow for context: %{private}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke_66_cold_1(a1, v3, v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2189F0000, a2, OS_LOG_TYPE_DEBUG, "%@ deallocated", (uint8_t *)&v2, 0xCu);
}

- (void)remoteViewControllerDidStartFlow:(id)a3
{
  presentationHandler = (void (**)(void))self->_presentationHandler;
  if (presentationHandler) {
    presentationHandler[2]();
  }
}

- (void)circlePresenterDidPresent:(id)a3
{
  presentationHandler = (void (**)(id, SEL, id))self->_presentationHandler;
  if (presentationHandler)
  {
    presentationHandler[2](presentationHandler, a2, a3);
    id v5 = self->_presentationHandler;
    self->_presentationHandler = 0;
  }
}

- (UIViewController)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (UIViewController *)WeakRetained;
}

- (id)presentationHandler
{
  return self->_presentationHandler;
}

- (void)setPresentationHandler:(id)a3
{
}

- (unint64_t)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(unint64_t)a3
{
  self->_presentationType = a3;
}

- (RUIStyle)customRUIStyle
{
  return self->_customRUIStyle;
}

- (void)setCustomRUIStyle:(id)a3
{
}

- (int64_t)modalPresentationStyle
{
  return self->_modalPresentationStyle;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  self->_int64_t modalPresentationStyle = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (FACirclePresenter)circlePresenter
{
  return self->_circlePresenter;
}

- (void)setCirclePresenter:(id)a3
{
}

- (FARequestConfigurator)requestConfigurator
{
  return self->_requestConfigurator;
}

- (void)setRequestConfigurator:(id)a3
{
}

- (id)circlePresenterFactory
{
  return self->_circlePresenterFactory;
}

- (void)setCirclePresenterFactory:(id)a3
{
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_circlePresenterFactory, 0);
  objc_storeStrong((id *)&self->_requestConfigurator, 0);
  objc_storeStrong((id *)&self->_circlePresenter, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_customRUIStyle, 0);
  objc_storeStrong(&self->_presentationHandler, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

void __57__FACircleStateController_performWithContext_completion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2189F0000, log, OS_LOG_TYPE_DEBUG, "Presenting flow in client process...", v1, 2u);
}

void __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 32) eventType];
  int v4 = 138477827;
  id v5 = v3;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "Failed to find URL for event type: %{private}@", (uint8_t *)&v4, 0xCu);
}

void __82__FACircleStateController__performOperationWithContext_viewController_completion___block_invoke_66_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a2 error];
  int v6 = 138478083;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  int v9 = v5;
  _os_log_error_impl(&dword_2189F0000, a3, OS_LOG_TYPE_ERROR, "Failed to complete flow for context: %{private}@, error: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end