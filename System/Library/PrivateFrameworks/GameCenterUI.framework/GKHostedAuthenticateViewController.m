@interface GKHostedAuthenticateViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers;
- (BOOL)disablesSignIn;
- (BOOL)isRotationLocked;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutomaticallyForwardRotationMethods;
- (BOOL)shouldAutorotate;
- (GKAuthenticateHostViewController)extensionHostViewController;
- (GKHostedAuthenticateViewController)init;
- (NSError)error;
- (id)completionHandler;
- (id)dismissCompletionHandler;
- (id)remoteViewReadyHandler;
- (int64_t)mode;
- (unint64_t)origin;
- (void)_setupChildViewController;
- (void)_setupExtensionHostViewController;
- (void)continueWithMode:(int64_t)a3;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)extensionDidFinishWithError:(id)a3;
- (void)finishAuthenticationWithError:(id)a3;
- (void)onboardingFlowDidSignOut;
- (void)setCompletionHandler:(id)a3;
- (void)setDisablesSignIn:(BOOL)a3;
- (void)setDismissCompletionHandler:(id)a3;
- (void)setError:(id)a3;
- (void)setExtensionHostViewController:(id)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setMode:(int64_t)a3;
- (void)setOrigin:(unint64_t)a3;
- (void)setRemoteViewReadyHandler:(id)a3;
- (void)setRotationLocked:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKHostedAuthenticateViewController

- (GKHostedAuthenticateViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKHostedAuthenticateViewController;
  result = [(GKHostedAuthenticateViewController *)&v3 init];
  if (result)
  {
    result->_rotationLocked = 1;
    result->_origin = 0;
  }
  return result;
}

- (void)dealloc
{
  [(GKExtensionRemoteViewController *)self->_extensionHostViewController cancelExtension];
  v3.receiver = self;
  v3.super_class = (Class)GKHostedAuthenticateViewController;
  [(GKHostedAuthenticateViewController *)&v3 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F63760] local];
  [v5 hideAccessPoint];

  v6 = [(GKHostedAuthenticateViewController *)self extensionHostViewController];

  if (!v6) {
    [(GKHostedAuthenticateViewController *)self _setupExtensionHostViewController];
  }
  v7.receiver = self;
  v7.super_class = (Class)GKHostedAuthenticateViewController;
  [(GKHostedAuthenticateViewController *)&v7 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKHostedAuthenticateViewController;
  [(GKHostedAuthenticateViewController *)&v4 viewDidDisappear:a3];
  BOOL v3 = [MEMORY[0x1E4F63760] local];
  [v3 showAccessPoint];
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", a3);
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1) {
    uint64_t v6 = 16;
  }
  else {
    uint64_t v6 = 2;
  }
  v7.receiver = self;
  v7.super_class = (Class)GKHostedAuthenticateViewController;
  [(GKHostedAuthenticateViewController *)&v7 setModalPresentationStyle:v6];
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (void)continueWithMode:(int64_t)a3
{
  self->_mode = a3;
  if ([(GKHostedAuthenticateViewController *)self mode] == 2) {
    [(GKHostedAuthenticateViewController *)self setRotationLocked:0];
  }

  [(GKHostedAuthenticateViewController *)self _setupChildViewController];
}

- (void)_setupChildViewController
{
  BOOL v3 = [(GKHostedAuthenticateViewController *)self view];
  [v3 setAlpha:1.0];

  [(GKHostedAuthenticateViewController *)self setWantsFullScreenLayout:1];
  objc_super v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1)
  {
    [(GKHostedAuthenticateViewController *)self setModalInPresentation:1];
    [(GKHostedAuthenticateViewController *)self setModalPresentationStyle:16];
    uint64_t v6 = [MEMORY[0x1E4F63A10] sharedTheme];
    [v6 authenticateExtensionFormSheetSize];
    -[GKHostedAuthenticateViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
  else
  {
    [(GKHostedAuthenticateViewController *)self setModalPresentationStyle:17];
    [(GKHostedAuthenticateViewController *)self _setIgnoreAppSupportedOrientations:1];
  }
  if (!self->_extensionHostViewController)
  {
    [(GKHostedAuthenticateViewController *)self _setupExtensionHostViewController];
  }
}

- (void)_setupExtensionHostViewController
{
  BOOL v3 = +[GKAuthenticateHostViewController authenticateExtension];
  if (v3)
  {
    +[GKExtensionRemoteViewController setupCallbackBlocksForExtension:v3 withParentViewController:self];
    [(GKHostedAuthenticateViewController *)self _beginDelayingPresentation:&__block_literal_global_38 cancellationHandler:5.0];
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __71__GKHostedAuthenticateViewController__setupExtensionHostViewController__block_invoke_13;
    v4[3] = &unk_1E5F64330;
    objc_copyWeak(&v5, &location);
    v4[4] = self;
    +[GKExtensionRemoteViewController viewControllerForExtension:v3 inputItems:0 completionHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

uint64_t __71__GKHostedAuthenticateViewController__setupExtensionHostViewController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    objc_super v4 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_cold_1(v4);
    }
  }
  return a2 ^ 1u;
}

void __71__GKHostedAuthenticateViewController__setupExtensionHostViewController__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v34, (id *)(a1 + 40));
  if (v5)
  {
    id v7 = v5;
    id v8 = objc_loadWeakRetained(&v34);
    [v8 setExtensionHostViewController:v7];

    v36[0] = &unk_1F08121B0;
    v35[0] = @"MessageCommandKey";
    v35[1] = @"MessageParamKey";
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "origin"));
    v36[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

    [v7 sendMessageToExtension:v10];
    id v11 = objc_loadWeakRetained(&v34);
    [v11 addChildViewController:v7];

    id v12 = objc_loadWeakRetained(&v34);
    v13 = [v12 view];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v22 = [v7 view];
    objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

    id v23 = objc_loadWeakRetained(&v34);
    v24 = [v23 view];
    v25 = [v7 view];
    [v24 addSubview:v25];

    id v26 = objc_loadWeakRetained(&v34);
    [v7 didMoveToParentViewController:v26];

    id v27 = objc_loadWeakRetained(&v34);
    [v7 setDelegate:v27];
  }
  else
  {
    id v7 = objc_loadWeakRetained(&v34);
    [v7 extensionDidFinishWithError:v6];
  }

  id v28 = objc_loadWeakRetained(&v34);
  v29 = [v28 remoteViewReadyHandler];

  if (v29)
  {
    id v30 = objc_loadWeakRetained(&v34);
    v31 = [v30 remoteViewReadyHandler];
    id v32 = objc_loadWeakRetained(&v34);
    v33 = [v32 extensionHostViewController];
    ((void (**)(void, void *, void))v31)[2](v31, v33, 0);
  }
  objc_destroyWeak(&v34);
}

- (void)setExtensionHostViewController:(id)a3
{
  id v5 = (GKAuthenticateHostViewController *)a3;
  if (self->_extensionHostViewController != v5)
  {
    objc_storeStrong((id *)&self->_extensionHostViewController, a3);
    id v6 = (void *)MEMORY[0x1E4F1CA60];
    id v7 = +[GKExtensionRemoteViewController initialItemsForExtension];
    id v8 = [v6 dictionaryWithDictionary:v7];

    v9 = [NSNumber numberWithInteger:self->_mode];
    [v8 setObject:v9 forKeyedSubscript:@"AuthenticateModeKey"];

    objc_initWeak(&location, self);
    extensionHostViewController = self->_extensionHostViewController;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__GKHostedAuthenticateViewController_setExtensionHostViewController___block_invoke;
    v11[3] = &unk_1E5F64358;
    objc_copyWeak(&v12, &location);
    [(GKExtensionRemoteViewController *)extensionHostViewController setInitialState:v8 withReply:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __69__GKHostedAuthenticateViewController_setExtensionHostViewController___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __69__GKHostedAuthenticateViewController_setExtensionHostViewController___block_invoke_2;
  v1[3] = &unk_1E5F634E8;
  objc_copyWeak(&v2, &to);
  dispatch_async(MEMORY[0x1E4F14428], v1);
  objc_destroyWeak(&v2);
  objc_destroyWeak(&to);
}

void __69__GKHostedAuthenticateViewController_setExtensionHostViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endDelayingPresentation];
}

- (void)extensionDidFinishWithError:(id)a3
{
  [(GKHostedAuthenticateViewController *)self finishAuthenticationWithError:a3];
  [(GKAuthenticateHostViewController *)self->_extensionHostViewController willMoveToParentViewController:0];
  objc_super v4 = [(GKAuthenticateHostViewController *)self->_extensionHostViewController view];
  [v4 removeFromSuperview];

  [(GKAuthenticateHostViewController *)self->_extensionHostViewController removeFromParentViewController];

  [(GKHostedAuthenticateViewController *)self setExtensionHostViewController:0];
}

- (void)finishAuthenticationWithError:(id)a3
{
  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3);
    [(GKHostedAuthenticateViewController *)self setCompletionHandler:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)GKHostedAuthenticateViewController;
  [(GKHostedAuthenticateViewController *)&v5 dismissViewControllerAnimated:1 completion:&__block_literal_global_22];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  objc_super v5 = [(GKHostedAuthenticateViewController *)self error];
  if ([v5 code] == 2 || -[GKHostedAuthenticateViewController mode](self, "mode") == 2)
  {
    [(GKHostedAuthenticateViewController *)self finishAuthenticationWithError:v5];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
    id v7 = [v6 accountService];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__GKHostedAuthenticateViewController_dismissViewControllerAnimated_completion___block_invoke;
    v8[3] = &unk_1E5F65008;
    v8[4] = self;
    [v7 authenticatePlayerWithExistingCredentialsWithHandler:v8];
  }
}

uint64_t __79__GKHostedAuthenticateViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishAuthenticationWithError:");
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return !self->_rotationLocked;
}

- (void)setRotationLocked:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (self->_rotationLocked != v3)
    {
      self->_rotationLocked = v3;
      if (!v3)
      {
        objc_super v5 = objc_opt_class();
        [v5 attemptRotationToDeviceOrientation];
      }
    }
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__GKHostedAuthenticateViewController_setRotationLocked___block_invoke;
    v6[3] = &unk_1E5F63D68;
    v6[4] = self;
    BOOL v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __56__GKHostedAuthenticateViewController_setRotationLocked___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRotationLocked:*(unsigned __int8 *)(a1 + 40)];
}

- (void)onboardingFlowDidSignOut
{
  id v3 = [MEMORY[0x1E4F28C58] userErrorForCode:6 underlyingError:0];
  [(GKHostedAuthenticateViewController *)self finishAuthenticationWithError:v3];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)disablesSignIn
{
  return self->_disablesSignIn;
}

- (void)setDisablesSignIn:(BOOL)a3
{
  self->_disablesSignIn = a3;
}

- (BOOL)isRotationLocked
{
  return self->_rotationLocked;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (id)remoteViewReadyHandler
{
  return self->_remoteViewReadyHandler;
}

- (void)setRemoteViewReadyHandler:(id)a3
{
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (GKAuthenticateHostViewController)extensionHostViewController
{
  return self->_extensionHostViewController;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_storeStrong((id *)&self->_extensionHostViewController, 0);
  objc_storeStrong(&self->_remoteViewReadyHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end