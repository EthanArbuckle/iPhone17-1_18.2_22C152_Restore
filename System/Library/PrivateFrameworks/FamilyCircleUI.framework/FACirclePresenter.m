@interface FACirclePresenter
- (FACirclePresenter)init;
- (FACirclePresenter)initWithPresenter:(id)a3 context:(id)a4;
- (FACirclePresenterDelegate)delegate;
- (RUIStyle)customRUIStyle;
- (UIViewController)presenter;
- (id)_serverHookHandlerWithRemoteUIController:(id)a3;
- (void)cancel;
- (void)circleRemoteUIDelegate:(id)a3 completedWithResponse:(id)a4;
- (void)circleRemoteUIDelegateDidPresent:(id)a3;
- (void)loadRequest:(id)a3 completion:(id)a4;
- (void)setCustomRUIStyle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresenter:(id)a3;
@end

@implementation FACirclePresenter

- (FACirclePresenter)init
{
  return 0;
}

- (FACirclePresenter)initWithPresenter:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FACirclePresenter;
  v9 = [(FACirclePresenter *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presenter, a3);
    v11 = (RemoteUIController *)objc_alloc_init(MEMORY[0x263F637E8]);
    remoteUIController = v10->_remoteUIController;
    v10->_remoteUIController = v11;

    [(RemoteUIController *)v10->_remoteUIController fa_registerFamilyRUIViews];
    [(RemoteUIController *)v10->_remoteUIController setHostViewController:v10->_presenter];
    v13 = [[FAProfilePictureStore alloc] initWithFamilyCircle:0];
    familyPictureStore = v10->_familyPictureStore;
    v10->_familyPictureStore = v13;

    v15 = [FACircleRemoteUIDelegate alloc];
    v16 = [(FACirclePresenter *)v10 _serverHookHandlerWithRemoteUIController:v10->_remoteUIController];
    uint64_t v17 = [(FACircleRemoteUIDelegate *)v15 initWithContext:v8 serverHookHandler:v16 pictureStore:v10->_familyPictureStore];
    remoteUIDelegate = v10->_remoteUIDelegate;
    v10->_remoteUIDelegate = (FACircleRemoteUIDelegate *)v17;

    [(FACircleRemoteUIDelegate *)v10->_remoteUIDelegate setDelegate:v10];
    [(FACircleRemoteUIDelegate *)v10->_remoteUIDelegate configureHookHandlersForRUIController:v10->_remoteUIController];
    [(RemoteUIController *)v10->_remoteUIController setDelegate:v10->_remoteUIDelegate];
  }

  return v10;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
  id v5 = a3;
  [(RemoteUIController *)self->_remoteUIController setHostViewController:self->_presenter];
}

- (void)cancel
{
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = 0;
}

- (id)_serverHookHandlerWithRemoteUIController:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F25D38];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = objc_msgSend(MEMORY[0x263F25D38], "fcui_defaultFresnoServerHooks");
  id v7 = (void *)[v5 initWithRemoteUIController:v4 hooks:v6];

  return v7;
}

- (void)loadRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id completion = self->_completion;
  id v8 = a4;
  v9 = (void (**)(void, void))v8;
  if (completion)
  {
    v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FACirclePresenter loadRequest:completion:](v10);
    }

    v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3BDB8] code:-1000 userInfo:0];
    v12 = (void *)[objc_alloc(MEMORY[0x263F3BEF0]) initWithLoadSuccess:0 error:v11 userInfo:0];
    ((void (**)(void, void *))v9)[2](v9, v12);
  }
  else
  {
    v13 = (void *)[v8 copy];

    id v14 = self->_completion;
    self->_id completion = v13;

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __44__FACirclePresenter_loadRequest_completion___block_invoke;
    v15[3] = &unk_264348AE0;
    v15[4] = self;
    id v16 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v15);
  }
}

uint64_t __44__FACirclePresenter_loadRequest_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) loadRequest:*(void *)(a1 + 40) completion:0];
}

- (void)setCustomRUIStyle:(id)a3
{
  objc_storeStrong((id *)&self->_customRUIStyle, a3);
  id v5 = a3;
  [(RemoteUIController *)self->_remoteUIController setStyle:self->_customRUIStyle];
}

- (void)circleRemoteUIDelegate:(id)a3 completedWithResponse:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 loadSuccess];
    id v8 = [v5 error];
    v10[0] = 67109378;
    v10[1] = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "FACirclePresenter - FACircleRemoteUIDelegate completedWithSuccess: %d error: %@", (uint8_t *)v10, 0x12u);
  }
  if (self->_completion)
  {
    v9 = _FALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_2189F0000, v9, OS_LOG_TYPE_DEFAULT, "FACirclePresenter - we have a completion, calling back", (uint8_t *)v10, 2u);
    }

    (*((void (**)(void))self->_completion + 2))();
  }
}

- (void)circleRemoteUIDelegateDidPresent:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 circlePresenterDidPresent:self];
  }
}

- (UIViewController)presenter
{
  return self->_presenter;
}

- (RUIStyle)customRUIStyle
{
  return self->_customRUIStyle;
}

- (FACirclePresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FACirclePresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customRUIStyle, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_familyPictureStore, 0);
  objc_storeStrong((id *)&self->_remoteUIDelegate, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
}

- (void)loadRequest:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2189F0000, log, OS_LOG_TYPE_ERROR, "Circle presenter already in use, bailing!", v1, 2u);
}

@end