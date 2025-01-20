@interface MSSetupViewController
- (MSServiceAccount)serviceAccount;
- (MSSetupViewController)initWithServiceAccount:(id)a3;
- (MSSetupViewController)initWithServiceAccount:(id)a3 testFlags:(unint64_t)a4;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)createExtension;
- (id)createExtensionItemWithServiceAccount:(id)a3;
- (unint64_t)testFlags;
- (void)_setChildViewController:(id)a3;
- (void)dealloc;
- (void)extensionHandleConnection:(id)a3 viewController:(id)a4 error:(id)a5;
- (void)requestDismiss;
@end

@implementation MSSetupViewController

- (MSSetupViewController)initWithServiceAccount:(id)a3
{
  return [(MSSetupViewController *)self initWithServiceAccount:a3 testFlags:0];
}

- (MSSetupViewController)initWithServiceAccount:(id)a3 testFlags:(unint64_t)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MSSetupViewController;
  v8 = [(MSSetupViewController *)&v19 initWithNibName:0 bundle:0];
  if (v8)
  {
    NSLog(&cfstr_CreatingMsview.isa);
    objc_storeStrong((id *)&v8->_serviceAccount, a3);
    v8->_testFlags = a4;
    [(MSSetupViewController *)v8 _beginDelayingPresentation:0 cancellationHandler:3.0];
    [(MSSetupViewController *)v8 setModalPresentationStyle:2];
    uint64_t v9 = [(MSSetupViewController *)v8 createExtension];
    extension = v8->_extension;
    v8->_extension = (NSExtension *)v9;

    v11 = [(MSSetupViewController *)v8 createExtensionItemWithServiceAccount:v8->_serviceAccount];
    if (v11)
    {
      objc_initWeak(&location, v8);
      v12 = v8->_extension;
      v20[0] = v11;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __58__MSSetupViewController_initWithServiceAccount_testFlags___block_invoke;
      v16[3] = &unk_2647756D8;
      objc_copyWeak(&v17, &location);
      [(NSExtension *)v12 instantiateViewControllerWithInputItems:v13 connectionHandler:v16];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    v14 = v8;
  }
  return v8;
}

void __58__MSSetupViewController_initWithServiceAccount_testFlags___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained extensionHandleConnection:v9 viewController:v8 error:v7];
}

- (void)dealloc
{
  if (self->_extensionRequest) {
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
  }
  v3.receiver = self;
  v3.super_class = (Class)MSSetupViewController;
  [(MSSetupViewController *)&v3 dealloc];
}

- (void)requestDismiss
{
}

- (void)extensionHandleConnection:(id)a3 viewController:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  NSLog(&cfstr_HandlingExtens.isa);
  id v10 = v8;
  [(MSSetupViewController *)self _setChildViewController:v10];
  id extensionRequest = self->_extensionRequest;
  self->_id extensionRequest = v7;

  [v10 setHost:self];
  [(MSSetupViewController *)self _endDelayingPresentation];
}

- (id)createExtension
{
  objc_initWeak(&location, self);
  id v9 = 0;
  v2 = [MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.mediaservicesbroker.ViewService" error:&v9];
  id v3 = v9;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__MSSetupViewController_createExtension__block_invoke;
  v7[3] = &unk_264775728;
  objc_copyWeak(&v8, &location);
  [v2 setRequestCancellationBlock:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__MSSetupViewController_createExtension__block_invoke_3;
  v5[3] = &unk_264775750;
  objc_copyWeak(&v6, &location);
  [v2 setRequestInterruptionBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v2;
}

void __40__MSSetupViewController_createExtension__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__MSSetupViewController_createExtension__block_invoke_2;
  block[3] = &unk_264775700;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __40__MSSetupViewController_createExtension__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __40__MSSetupViewController_createExtension__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__MSSetupViewController_createExtension__block_invoke_4;
  block[3] = &unk_264775700;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __40__MSSetupViewController_createExtension__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (id)createExtensionItemWithServiceAccount:(id)a3
{
  v17[3] = *MEMORY[0x263EF8340];
  id v15 = 0;
  v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v15];
  id v5 = v15;
  id v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F08810]);
    id v9 = [MEMORY[0x263F086E0] mainBundle];
    id v10 = [v9 bundleIdentifier];

    NSLog(&cfstr_CreateExtensio.isa, self->_testFlags);
    v16[0] = @"bundleID";
    v16[1] = @"mediaService";
    v11 = &stru_26D978A38;
    if (v10) {
      v11 = v10;
    }
    v17[0] = v11;
    v17[1] = v4;
    v16[2] = @"testUIFlags";
    v12 = [NSNumber numberWithUnsignedLong:self->_testFlags];
    v17[2] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
    [v8 setUserInfo:v13];
  }
  else
  {
    NSLog(&cfstr_NoContextDataE.isa, v5);
    id v8 = 0;
  }

  return v8;
}

- (void)_setChildViewController:(id)a3
{
  v28[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_childViewController = &self->_childViewController;
  BOOL v7 = [(_MSRemoteViewController *)self->_childViewController view];
  [v7 removeFromSuperview];

  [(_MSRemoteViewController *)self->_childViewController removeFromParentViewController];
  objc_storeStrong((id *)&self->_childViewController, a3);
  if (self->_childViewController)
  {
    [(_MSRemoteViewController *)self->_childViewController willMoveToParentViewController:self];
    id v8 = [v5 view];
    id v9 = [(MSSetupViewController *)self view];
    [v9 frame];
    objc_msgSend(v8, "setFrame:");

    [(MSSetupViewController *)self addChildViewController:*p_childViewController];
    id v10 = [(MSSetupViewController *)self view];
    [v10 addSubview:v8];

    v26 = [v8 widthAnchor];
    v27 = [(MSSetupViewController *)self view];
    v25 = [v27 widthAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v28[0] = v24;
    v22 = [v8 heightAnchor];
    v23 = [(MSSetupViewController *)self view];
    v21 = [v23 heightAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v28[1] = v20;
    v18 = [v8 centerXAnchor];
    objc_super v19 = [(MSSetupViewController *)self view];
    v11 = [v19 centerXAnchor];
    v12 = [v18 constraintEqualToAnchor:v11];
    v28[2] = v12;
    v13 = [v8 centerYAnchor];
    v14 = [(MSSetupViewController *)self view];
    id v15 = [v14 centerYAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v28[3] = v16;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];

    [MEMORY[0x263F08938] activateConstraints:v17];
    [(_UIRemoteViewController *)*p_childViewController didMoveToParentViewController:self];
  }
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_childViewController;
}

- (MSServiceAccount)serviceAccount
{
  return self->_serviceAccount;
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceAccount, 0);
  objc_storeStrong(&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_extension, 0);

  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end