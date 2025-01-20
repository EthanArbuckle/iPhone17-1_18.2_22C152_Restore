@interface LAAuthorizationViewController
- (BOOL)active;
- (LAAuthorizationViewController)initWithConfiguration:(id)a3 completion:(id)a4;
- (LAAuthorizationViewControllerDelegate)delegate;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (int64_t)preferredStatusBarStyle;
- (uint64_t)dismissFromContainerViewController;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_finishWithError:(uint64_t)a1;
- (void)_prepareRemoteView;
- (void)_presentRemoteView;
- (void)didProvideAuthorizationRequirementWithReply:(id)a3;
- (void)dismiss;
- (void)loadView;
- (void)presentInContainerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)sheetDidFinishWithError:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation LAAuthorizationViewController

- (LAAuthorizationViewController)initWithConfiguration:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LAAuthorizationViewController;
  v9 = [(LAAuthorizationViewController *)&v15 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    uint64_t v11 = MEMORY[0x2455CBB70](v8);
    id completion = v10->_completion;
    v10->_id completion = (id)v11;

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v10 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];
  }
  return v10;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)LAAuthorizationViewController;
  -[LAAuthorizationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  id v7 = [(LAAuthorizationViewController *)self view];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, width, height);
}

- (int64_t)modalPresentationStyle
{
  if ([(LACUIAuthenticatorServiceConfiguration *)self->_configuration style]) {
    return 0;
  }
  else {
    return 6;
  }
}

- (int64_t)modalTransitionStyle
{
  return 2 * ([(LACUIAuthenticatorServiceConfiguration *)self->_configuration style] == 0);
}

- (int64_t)preferredStatusBarStyle
{
  if ([(LACUIAuthenticatorServiceConfiguration *)self->_configuration style]) {
    return 0;
  }
  v3 = [MEMORY[0x263F82670] currentDevice];
  int64_t v2 = [v3 userInterfaceIdiom] != 1;

  return v2;
}

- (void)loadView
{
  v3 = objc_opt_new();
  [(LAAuthorizationViewController *)self setView:v3];

  -[LAAuthorizationViewController _prepareRemoteView]((id *)&self->super.super.super.isa);
}

- (void)_prepareRemoteView
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 122);

    if (!WeakRetained)
    {
      objc_initWeak(&location, a1);
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __51__LAAuthorizationViewController__prepareRemoteView__block_invoke;
      v3[3] = &unk_26506ED20;
      objc_copyWeak(&v4, &location);
      +[_AuthorizationRemoteViewControllerHost requestViewControllerWithConnectionHandler:v3];
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __51__LAAuthorizationViewController__prepareRemoteView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      objc_super v8 = LA_LOG_0();
      os_log_type_t v9 = LALogTypeForInternalError();
      if (os_log_type_enabled(v8, v9))
      {
        int v15 = 138412290;
        id v16 = v6;
        _os_log_impl(&dword_23F450000, v8, v9, "Could not obtain remote VC %@", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v10 = (uint64_t)WeakRetained;
      uint64_t v11 = v6;
LABEL_11:
      -[LAAuthorizationViewController _finishWithError:](v10, v11);
      goto LABEL_12;
    }
    if (([v5 conformsToProtocol:&unk_26F339AD0] & 1) == 0)
    {
      v13 = LA_LOG_0();
      os_log_type_t v14 = LALogTypeForInternalError();
      if (os_log_type_enabled(v13, v14))
      {
        int v15 = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_23F450000, v13, v14, "Received remote VC has unexpected type %@", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v10 = (uint64_t)WeakRetained;
      uint64_t v11 = 0;
      goto LABEL_11;
    }
    objc_storeWeak(WeakRetained + 122, v5);
    id v12 = objc_loadWeakRetained(WeakRetained + 122);
    [v12 setDelegate:WeakRetained];

    -[LAAuthorizationViewController _presentRemoteView]((uint64_t)WeakRetained);
  }
LABEL_12:
}

- (void)_finishWithError:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    v3 = *(void **)(a1 + 984);
    if (v3)
    {
      id v4 = (void (**)(void, void))[v3 copy];
      id v5 = *(void **)(a1 + 984);
      *(void *)(a1 + 984) = 0;

      objc_msgSend((id)a1, "dismissViewControllerAnimated:completion:", objc_msgSend(*(id *)(a1 + 992), "style") == 1, &__block_literal_global_64);
      ((void (**)(void, id))v4)[2](v4, v6);
    }
  }
}

- (void)_presentRemoteView
{
  if (a1)
  {
    if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
    {
      objc_initWeak(buf, (id)a1);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__LAAuthorizationViewController__presentRemoteView__block_invoke;
      block[3] = &unk_26506ED48;
      v43 = &v47;
      objc_copyWeak(&v47, buf);
      dispatch_async(MEMORY[0x263EF83A0], block);
LABEL_9:
      objc_destroyWeak(v43);
      objc_destroyWeak(buf);
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 976));
    if (WeakRetained)
    {
      v3 = WeakRetained;
      id v4 = [(id)a1 view];
      id v5 = [v4 subviews];
      id v6 = objc_loadWeakRetained((id *)(a1 + 976));
      id v7 = [v6 view];
      char v8 = [v5 containsObject:v7];

      if ((v8 & 1) == 0)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.LocalAuthentication.ui.presented", 0, 0, 1u);
        uint64_t v10 = LA_LOG_0();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_23F450000, v10, OS_LOG_TYPE_INFO, "Presenting remote UI", (uint8_t *)buf, 2u);
        }

        uint64_t v11 = [(id)a1 view];
        id v12 = objc_loadWeakRetained((id *)(a1 + 976));
        v13 = [v12 view];
        [v11 addSubview:v13];

        id v14 = objc_loadWeakRetained((id *)(a1 + 976));
        int v15 = [v14 view];
        [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

        id v16 = objc_loadWeakRetained((id *)(a1 + 976));
        uint64_t v17 = [v16 view];
        v18 = [v17 topAnchor];
        v19 = [(id)a1 view];
        v20 = [v19 topAnchor];
        v21 = [v18 constraintEqualToAnchor:v20];
        [v21 setActive:1];

        id v22 = objc_loadWeakRetained((id *)(a1 + 976));
        v23 = [v22 view];
        v24 = [v23 bottomAnchor];
        v25 = [(id)a1 view];
        v26 = [v25 bottomAnchor];
        v27 = [v24 constraintEqualToAnchor:v26];
        [v27 setActive:1];

        id v28 = objc_loadWeakRetained((id *)(a1 + 976));
        v29 = [v28 view];
        v30 = [v29 leadingAnchor];
        v31 = [(id)a1 view];
        v32 = [v31 leadingAnchor];
        v33 = [v30 constraintEqualToAnchor:v32];
        [v33 setActive:1];

        id v34 = objc_loadWeakRetained((id *)(a1 + 976));
        v35 = [v34 view];
        v36 = [v35 trailingAnchor];
        v37 = [(id)a1 view];
        v38 = [v37 trailingAnchor];
        v39 = [v36 constraintEqualToAnchor:v38];
        [v39 setActive:1];

        id v40 = objc_loadWeakRetained((id *)(a1 + 976));
        [(id)a1 addChildViewController:v40];

        objc_initWeak(buf, (id)a1);
        id v41 = objc_loadWeakRetained((id *)(a1 + 976));
        uint64_t v42 = *(void *)(a1 + 992);
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __51__LAAuthorizationViewController__presentRemoteView__block_invoke_58;
        v44[3] = &unk_26506EB38;
        v43 = &v45;
        objc_copyWeak(&v45, buf);
        [v41 startWithConfiguration:v42 reply:v44];

        goto LABEL_9;
      }
    }
  }
}

void __51__LAAuthorizationViewController__presentRemoteView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[LAAuthorizationViewController _presentRemoteView]();
    id WeakRetained = v2;
  }
}

void __51__LAAuthorizationViewController__presentRemoteView__block_invoke_58(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__LAAuthorizationViewController__presentRemoteView__block_invoke_2;
    v7[3] = &unk_26506EB10;
    objc_copyWeak(&v9, v4);
    id v8 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v7);

    objc_destroyWeak(&v9);
  }
}

void __51__LAAuthorizationViewController__presentRemoteView__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v3 = LA_LOG_0();
    os_log_type_t v4 = LALogTypeForInternalError();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_23F450000, v3, v4, "Failed to start with error (%@).", (uint8_t *)&v6, 0xCu);
    }

    -[LAAuthorizationViewController _finishWithError:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
  }
}

- (void)dismiss
{
  if ([(LAAuthorizationViewController *)self active])
  {
    objc_initWeak(location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __40__LAAuthorizationViewController_dismiss__block_invoke;
    v5[3] = &unk_26506EB38;
    objc_copyWeak(&v6, location);
    [WeakRetained stopWithReply:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(location);
  }
  else
  {
    os_log_type_t v4 = LA_LOG_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_23F450000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring dismiss request for inactive sheet", (uint8_t *)location, 2u);
    }
  }
}

void __40__LAAuthorizationViewController_dismiss__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.LocalAuthentication.ui.dismissed", 0, 0, 1u);
  if (v3 && WeakRetained)
  {
    id v6 = LA_LOG_0();
    os_log_type_t v7 = LALogTypeForInternalError();
    if (os_log_type_enabled(v6, v7))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_23F450000, v6, v7, "Failed to dismiss with error (%@).", (uint8_t *)&v8, 0xCu);
    }

    -[LAAuthorizationViewController _finishWithError:]((uint64_t)WeakRetained, v3);
  }
}

- (BOOL)active
{
  return self->_completion != 0;
}

- (void)presentInContainerViewController:(id)a3
{
  id v4 = a3;
  if ([(LAAuthorizationViewController *)self active])
  {
    [v4 presentViewController:self animated:1 completion:&__block_literal_global_4];
  }
  else
  {
    uint64_t v5 = LA_LOG_0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_23F450000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring presentation request for inactive sheet", v6, 2u);
    }
  }
}

- (uint64_t)dismissFromContainerViewController
{
  if (result)
  {
    v1 = (void *)result;
    BOOL v2 = [*(id *)(result + 992) style] == 1;
    return [v1 dismissViewControllerAnimated:v2 completion:&__block_literal_global_64];
  }
  return result;
}

- (void)sheetDidFinishWithError:(id)a3
{
}

- (void)didProvideAuthorizationRequirementWithReply:(id)a3
{
  id v9 = (void (**)(id, void *))a3;
  uint64_t v4 = [(LAAuthorizationViewController *)self delegate];
  if (v4
    && (uint64_t v5 = (void *)v4,
        [(LAAuthorizationViewController *)self delegate],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    int v8 = [(LAAuthorizationViewController *)self delegate];
    [v8 authorizationController:self didProvideAuthorizationRequirementWithReply:v9];
  }
  else
  {
    int v8 = [MEMORY[0x263F104E0] internalErrorWithMessage:@"Password validation not available"];
    v9[2](v9, v8);
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v4 = [MEMORY[0x263F104E0] errorWithCode:-4];
  -[LAAuthorizationViewController _finishWithError:]((uint64_t)self, v4);
}

- (LAAuthorizationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LAAuthorizationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_destroyWeak((id *)&self->_remoteVC);
}

@end