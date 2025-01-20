@interface SKCloudServiceSetupViewController
- (BOOL)isModalInPresentation;
- (SKCloudServiceSetupConfiguration)configuration;
- (SKCloudServiceSetupViewController)initWithCoder:(id)a3;
- (SKCloudServiceSetupViewController)initWithConfiguration:(id)a3;
- (SKCloudServiceSetupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_errorWithCode:(int64_t)a3 errorDescriptionLocalizationKey:(id)a4;
- (id)delegate;
- (void)_didReceiveRemoteViewController:(id)a3;
- (void)_dismissCloudServiceSetupViewControllerWithAnimation:(BOOL)a3 completion:(id)a4;
- (void)_reloadWithActiveCloudServiceSetupReloadContext;
- (void)_remoteViewControllerExtensionWasInterrupted;
- (void)_reportCompletionForInlineOfferUnsupported;
- (void)_reportErrorForMissingSystemMusicApplication;
- (void)_requestRemoteViewController;
- (void)cloudServiceSetupRemoteViewController:(id)a3 didFinishLoadingWithSuccess:(BOOL)a4 error:(id)a5;
- (void)cloudServiceSetupRemoteViewController:(id)a3 requestsDismissalWithAnimation:(BOOL)a4 completion:(id)a5;
- (void)cloudServiceSetupRemoteViewController:(id)a3 requestsDismissingSafariViewControllerAnimated:(BOOL)a4 completion:(id)a5;
- (void)cloudServiceSetupRemoteViewController:(id)a3 requestsPresentingSafariViewControllerWithURL:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)dealloc;
- (void)handleSafariScriptURL:(id)a3;
- (void)loadWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler;
- (void)overrideCreditCardPresentationWithCompletion:(id)a3;
- (void)overrideRedeemCameraPerformAction:(int64_t)a3 withObject:(id)a4;
- (void)reloadWithContext:(id)a3;
- (void)safariViewController:(id)a3 didCompleteInitialLoad:(BOOL)a4;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setModalInPresentation:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SKCloudServiceSetupViewController

- (SKCloudServiceSetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = objc_alloc_init(SKCloudServiceSetupConfiguration);
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 infoDictionary];

  v8 = [v7 objectForKey:@"CFBundleIdentifier"];
  [(SKCloudServiceSetupConfiguration *)v5 setApplicationIdentifier:v8];

  v9 = [v7 objectForKey:@"CFBundleVersion"];
  [(SKCloudServiceSetupConfiguration *)v5 setApplicationVersion:v9];

  [(SKCloudServiceSetupConfiguration *)v5 setTargetsFinanceApplication:1];
  [(SKCloudServiceSetupConfiguration *)v5 setForPublicSDK:1];
  v10 = [(SKCloudServiceSetupViewController *)self initWithConfiguration:v5];

  return v10;
}

- (SKCloudServiceSetupViewController)initWithCoder:(id)a3
{
  return [(SKCloudServiceSetupViewController *)self initWithNibName:0 bundle:0];
}

- (SKCloudServiceSetupViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKCloudServiceSetupViewController;
  v5 = [(SKCloudServiceSetupViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (SKCloudServiceSetupConfiguration *)v6;

    [(SKCloudServiceSetupViewController *)v5 setModalPresentationStyle:2];
    [(SKCloudServiceSetupViewController *)v5 _requestRemoteViewController];
  }

  return v5;
}

- (void)dealloc
{
  remoteViewContainerViewController = self->_remoteViewContainerViewController;
  if (remoteViewContainerViewController)
  {
    [(_UIResilientRemoteViewContainerViewController *)remoteViewContainerViewController willMoveToParentViewController:0];
    if ([(_UIResilientRemoteViewContainerViewController *)self->_remoteViewContainerViewController isViewLoaded])
    {
      id v4 = [(_UIResilientRemoteViewContainerViewController *)self->_remoteViewContainerViewController view];
      [v4 removeFromSuperview];
    }
    [(_UIResilientRemoteViewContainerViewController *)self->_remoteViewContainerViewController removeFromParentViewController];
  }
  v5.receiver = self;
  v5.super_class = (Class)SKCloudServiceSetupViewController;
  [(SKCloudServiceSetupViewController *)&v5 dealloc];
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)setModalInPresentation:(BOOL)a3
{
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(&cfstr_ChangingTheVal.isa, v4);
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SKCloudServiceSetupViewController;
  [(SKCloudServiceSetupViewController *)&v7 viewDidLoad];
  v3 = [(SKCloudServiceSetupViewController *)self view];
  id v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  remoteViewContainerViewController = self->_remoteViewContainerViewController;
  if (remoteViewContainerViewController)
  {
    uint64_t v6 = [(_UIResilientRemoteViewContainerViewController *)remoteViewContainerViewController view];
    [v3 addSubview:v6];
  }
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SKCloudServiceSetupViewController;
  [(SKCloudServiceSetupViewController *)&v13 viewDidLayoutSubviews];
  v3 = [(SKCloudServiceSetupViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(_UIResilientRemoteViewContainerViewController *)self->_remoteViewContainerViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKCloudServiceSetupViewController;
  [(SKCloudServiceSetupViewController *)&v5 viewDidAppear:a3];
  self->_isFullyAppeared = 1;
  alertController = self->_alertController;
  if (alertController) {
    [(SKCloudServiceSetupViewController *)self presentViewController:alertController animated:1 completion:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKCloudServiceSetupViewController;
  [(SKCloudServiceSetupViewController *)&v6 viewWillAppear:a3];
  if (self->_alertController)
  {
    double v4 = [(SKCloudServiceSetupViewController *)self view];
    objc_super v5 = [MEMORY[0x1E4FB1618] clearColor];
    [v4 setBackgroundColor:v5];

    [v4 setOpaque:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKCloudServiceSetupViewController;
  [(SKCloudServiceSetupViewController *)&v4 viewWillDisappear:a3];
  self->_isFullyAppeared = 0;
}

- (void)safariViewController:(id)a3 didCompleteInitialLoad:(BOOL)a4
{
  objc_super v4 = objc_msgSend(MEMORY[0x1E4FA81D8], "sharedConfig", a3, a4);
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  double v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (!v8) {
    goto LABEL_10;
  }
  v11[0] = 0;
  LODWORD(v10) = 2;
  double v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    double v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v11, v10);
    free(v9);
    SSFileLog();
LABEL_10:
  }
}

- (void)safariViewControllerDidFinish:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x1E4FA81D8], "sharedConfig", a3);
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  double v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (!v8) {
    goto LABEL_10;
  }
  v12[0] = 0;
  LODWORD(v11) = 2;
  double v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    double v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v12, v11);
    free(v9);
    SSFileLog();
LABEL_10:
  }
  safariViewController = self->_safariViewController;
  self->_safariViewController = 0;
}

- (void)cloudServiceSetupRemoteViewController:(id)a3 didFinishLoadingWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v10 = a5;
  double v7 = (void (**)(void *, BOOL))_Block_copy(self->_loadCompletionHandler);
  if (v7)
  {
    id loadCompletionHandler = self->_loadCompletionHandler;
    self->_id loadCompletionHandler = 0;

    uint64_t v9 = (uint64_t)v10;
    if (!v10 && !v5)
    {
      uint64_t v9 = [(SKCloudServiceSetupViewController *)self _errorWithCode:0 errorDescriptionLocalizationKey:@"UNKNOWN_ERROR"];
    }
    id v10 = (id)v9;
    v7[2](v7, v5);
  }
}

- (void)cloudServiceSetupRemoteViewController:(id)a3 requestsDismissalWithAnimation:(BOOL)a4 completion:(id)a5
{
}

- (void)cloudServiceSetupRemoteViewController:(id)a3 requestsPresentingSafariViewControllerWithURL:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (self->_safariViewController)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __141__SKCloudServiceSetupViewController_cloudServiceSetupRemoteViewController_requestsPresentingSafariViewControllerWithURL_animated_completion___block_invoke;
    v17[3] = &unk_1E5FAA800;
    v17[4] = self;
    id v18 = v10;
    id v19 = v11;
    BOOL v21 = v7;
    id v20 = v12;
    [(SKCloudServiceSetupViewController *)self cloudServiceSetupRemoteViewController:v18 requestsDismissingSafariViewControllerAnimated:0 completion:v17];
  }
  else
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    objc_super v13 = (void *)getSFSafariViewControllerClass_softClass;
    uint64_t v26 = getSFSafariViewControllerClass_softClass;
    if (!getSFSafariViewControllerClass_softClass)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __getSFSafariViewControllerClass_block_invoke;
      v22[3] = &unk_1E5FA9A30;
      v22[4] = &v23;
      __getSFSafariViewControllerClass_block_invoke((uint64_t)v22);
      objc_super v13 = (void *)v24[3];
    }
    v14 = v13;
    _Block_object_dispose(&v23, 8);
    v15 = (SFSafariViewController *)[[v14 alloc] initWithURL:v11];
    safariViewController = self->_safariViewController;
    self->_safariViewController = v15;

    [(SFSafariViewController *)self->_safariViewController setDelegate:self];
    [(SFSafariViewController *)self->_safariViewController setModalPresentationStyle:3];
    [(SKCloudServiceSetupViewController *)self presentViewController:self->_safariViewController animated:v7 completion:v12];
  }
}

uint64_t __141__SKCloudServiceSetupViewController_cloudServiceSetupRemoteViewController_requestsPresentingSafariViewControllerWithURL_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cloudServiceSetupRemoteViewController:*(void *)(a1 + 40) requestsPresentingSafariViewControllerWithURL:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)cloudServiceSetupRemoteViewController:(id)a3 requestsDismissingSafariViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  id v10 = v9;
  safariViewController = self->_safariViewController;
  if (safariViewController)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __133__SKCloudServiceSetupViewController_cloudServiceSetupRemoteViewController_requestsDismissingSafariViewControllerAnimated_completion___block_invoke;
    v12[3] = &unk_1E5FAA4E0;
    v12[4] = self;
    objc_super v13 = v9;
    [(SFSafariViewController *)safariViewController dismissViewControllerAnimated:v6 completion:v12];
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

uint64_t __133__SKCloudServiceSetupViewController_cloudServiceSetupRemoteViewController_requestsDismissingSafariViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 1024);
  *(void *)(v2 + 1024) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)overrideCreditCardPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__SKCloudServiceSetupViewController_overrideCreditCardPresentationWithCompletion___block_invoke;
  v6[3] = &unk_1E5FA9BB8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __82__SKCloudServiceSetupViewController_overrideCreditCardPresentationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  uint64_t v2 = (void *)getSUCreditCardReaderViewControllerClass_softClass_0;
  uint64_t v10 = getSUCreditCardReaderViewControllerClass_softClass_0;
  if (!getSUCreditCardReaderViewControllerClass_softClass_0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getSUCreditCardReaderViewControllerClass_block_invoke_0;
    v6[3] = &unk_1E5FA9A30;
    v6[4] = &v7;
    __getSUCreditCardReaderViewControllerClass_block_invoke_0((uint64_t)v6);
    uint64_t v2 = (void *)v8[3];
  }
  v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = objc_alloc_init(v3);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
  [v4 setCompletionBlock:*(void *)(a1 + 40)];
  [v5 setModalPresentationStyle:0];
  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
}

- (void)overrideRedeemCameraPerformAction:(int64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SKCloudServiceSetupViewController_overrideRedeemCameraPerformAction_withObject___block_invoke;
  block[3] = &unk_1E5FA9C08;
  id v9 = v6;
  int64_t v10 = a3;
  block[4] = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __82__SKCloudServiceSetupViewController_overrideRedeemCameraPerformAction_withObject___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 1
    && (id v2 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 976)), v2, !v2))
  {
    uint64_t v12 = 0;
    objc_super v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v4 = (void *)getSURedeemCameraViewControllerClass_softClass_0;
    uint64_t v15 = getSURedeemCameraViewControllerClass_softClass_0;
    if (!getSURedeemCameraViewControllerClass_softClass_0)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getSURedeemCameraViewControllerClass_block_invoke_0;
      location[3] = &unk_1E5FA9A30;
      location[4] = &v12;
      __getSURedeemCameraViewControllerClass_block_invoke_0((uint64_t)location);
      id v4 = (void *)v13[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v12, 8);
    id v6 = objc_alloc_init(v5);
    objc_initWeak(location, *(id *)(a1 + 32));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__SKCloudServiceSetupViewController_overrideRedeemCameraPerformAction_withObject___block_invoke_2;
    v9[3] = &unk_1E5FA9BE0;
    objc_copyWeak(&v10, location);
    [v6 setCodeHandler:v9];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
    [v7 setModalPresentationStyle:0];
    [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 976), v6);

    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 976));

    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 976));
      [v8 performAction:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
    }
  }
}

void __82__SKCloudServiceSetupViewController_overrideRedeemCameraPerformAction_withObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained[123] remoteViewController];
    id v6 = [v5 serviceViewControllerProxy];
    [v6 redeemCameraCodeDetected:v7];
  }
}

- (void)loadWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler
{
  id v6 = options;
  id v7 = completionHandler;
  id v8 = (void (**)(void *, void, void *))_Block_copy(self->_loadCompletionHandler);
  if (v8)
  {
    id loadCompletionHandler = self->_loadCompletionHandler;
    self->_id loadCompletionHandler = 0;

    id v10 = [(SKCloudServiceSetupViewController *)self _errorWithCode:0 errorDescriptionLocalizationKey:@"CLOUD_SERVICE_SETUP_VIEW_CONTROLLER_LOAD_PREEMPTED"];
    v8[2](v8, 0, v10);
  }
  if (+[SKCloudServiceController authorizationStatus] == SKCloudServiceAuthorizationStatusAuthorized)
  {
    if (self->_isUnableToLoadRemoteViewController)
    {
      id v11 = (void *)[v7 copy];
      id v12 = self->_loadCompletionHandler;
      self->_id loadCompletionHandler = v11;

      [(SKCloudServiceSetupViewController *)self _reportErrorForMissingSystemMusicApplication];
      goto LABEL_47;
    }
    if (self->_isInlineOfferUnsupported)
    {
      uint64_t v14 = (void *)[v7 copy];
      id v15 = self->_loadCompletionHandler;
      self->_id loadCompletionHandler = v14;

      [(SKCloudServiceSetupViewController *)self _reportCompletionForInlineOfferUnsupported];
      goto LABEL_47;
    }
    v16 = [(NSDictionary *)v6 objectForKey:@"SKCloudServiceSetupOptionsActionKey"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v20 = [(SKCloudServiceSetupViewController *)self _errorWithCode:0 errorDescriptionLocalizationKey:@"CLOUD_SERVICE_SETUP_VIEW_CONTROLLER_REQUIRES_ACTION"];
      (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v20);

LABEL_46:
      goto LABEL_47;
    }
    v17 = (void *)[(NSDictionary *)v6 mutableCopy];
    v42 = objc_alloc_init(SKCloudServiceSetupReloadContext);
    [(SKCloudServiceSetupReloadContext *)v42 setAction:v16];
    [v17 removeObjectForKey:@"SKCloudServiceSetupOptionsActionKey"];
    id v18 = [(NSDictionary *)v6 objectForKey:@"adamId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v18, "unsignedLongLongValue"));
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [v17 removeObjectForKey:@"adamId"];
        BOOL v21 = 0;
LABEL_19:
        v40 = [(NSDictionary *)v6 objectForKey:@"at"];
        if (v40)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v17 removeObjectForKey:@"at"];
          }
        }
        v39 = [(NSDictionary *)v6 objectForKey:@"ct"];
        if (v39)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v17 removeObjectForKey:@"ct"];
          }
        }
        v38 = [(NSDictionary *)v6 objectForKey:@"messageId"];
        if (v38)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v17 removeObjectForKey:@"messageId"];
          }
        }
        v35 = v18;
        v22 = [(NSDictionary *)v6 objectForKey:@"_SKCloudServiceSetupOptionsUserInfoKey"];
        objc_opt_class();
        v34 = v22;
        if (objc_opt_isKindOfClass()) {
          id v23 = v22;
        }
        else {
          id v23 = 0;
        }
        v36 = v16;
        uint64_t v24 = [(NSDictionary *)v6 objectForKey:@"_SKCloudServiceSetupOptionsAudioAccessorySerialNumberKey"];
        objc_opt_class();
        v37 = (void *)v24;
        v41 = v21;
        if (objc_opt_isKindOfClass())
        {
          id v25 = (id)[v23 mutableCopy];
          if (!v25) {
            id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          [v25 setObject:v37 forKey:@"audioAccessorySerialNumber"];
          uint64_t v26 = [v25 copy];

          id v23 = (id)v26;
          BOOL v21 = v41;
        }
        [v17 removeObjectForKey:@"_SKCloudServiceSetupOptionsAudioAccessorySerialNumberKey"];
        v27 = [(NSDictionary *)v6 objectForKey:@"_SKCloudServiceSetupOptionsAudioAccessoryUniqueDeviceIdentifierKey"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v28 = (id)[v23 mutableCopy];
          if (!v28) {
            id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          [v28 setObject:v27 forKey:@"audioAccessoryGUID"];
          uint64_t v29 = [v28 copy];

          id v23 = (id)v29;
          BOOL v21 = v41;
        }
        [v17 removeObjectForKey:@"_SKCloudServiceSetupOptionsAudioAccessoryUniqueDeviceIdentifierKey"];
        [(SKCloudServiceSetupReloadContext *)v42 setUserInfo:v23];
        [v17 removeObjectForKey:@"_SKCloudServiceSetupOptionsUserInfoKey"];
        if ([(SKCloudServiceSetupConfiguration *)self->_configuration forPublicSDK]) {
          [v17 setObject:@"true" forKey:@"sdk"];
        }
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ([v17 count])
        {
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __71__SKCloudServiceSetupViewController_loadWithOptions_completionHandler___block_invoke;
          v43[3] = &unk_1E5FA9DA0;
          id v31 = v30;
          id v44 = v31;
          [v17 enumerateKeysAndObjectsUsingBlock:v43];
          if ([v31 count]) {
            [(SKCloudServiceSetupReloadContext *)v42 setQueryItems:v31];
          }

          BOOL v21 = v41;
        }
        v32 = (void *)[v7 copy];
        id v33 = self->_loadCompletionHandler;
        self->_id loadCompletionHandler = v32;

        [(SKCloudServiceSetupViewController *)self reloadWithContext:v42];
        v16 = v36;
        goto LABEL_46;
      }
      id v19 = v18;
    }
    BOOL v21 = v19;
    [v17 removeObjectForKey:@"adamId"];
    if (v21) {
      [v17 setObject:v21 forKey:@"adamId"];
    }
    goto LABEL_19;
  }
  if (v7)
  {
    objc_super v13 = [(SKCloudServiceSetupViewController *)self _errorWithCode:6 errorDescriptionLocalizationKey:@"PERMISSION_DENIED"];
    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v13);
  }
LABEL_47:
}

void __71__SKCloudServiceSetupViewController_loadWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [MEMORY[0x1E4F290C8] queryItemWithName:v7 value:v5];
      if (v6) {
        [*(id *)(a1 + 32) addObject:v6];
      }
    }
  }
}

- (void)reloadWithContext:(id)a3
{
  id v4 = a3;
  uint64_t activeCloudServiceSetupReloadContext = (uint64_t)self->_activeCloudServiceSetupReloadContext;
  if ((id)activeCloudServiceSetupReloadContext != v4)
  {
    id v8 = v4;
    uint64_t activeCloudServiceSetupReloadContext = [(id)activeCloudServiceSetupReloadContext isEqual:v4];
    id v4 = v8;
    if ((activeCloudServiceSetupReloadContext & 1) == 0)
    {
      id v6 = (SKCloudServiceSetupReloadContext *)[v8 copy];
      id v7 = self->_activeCloudServiceSetupReloadContext;
      self->_uint64_t activeCloudServiceSetupReloadContext = v6;

      uint64_t activeCloudServiceSetupReloadContext = [(SKCloudServiceSetupViewController *)self _reloadWithActiveCloudServiceSetupReloadContext];
      id v4 = v8;
    }
  }

  MEMORY[0x1F41817F8](activeCloudServiceSetupReloadContext, v4);
}

- (void)handleSafariScriptURL:(id)a3
{
  remoteViewContainerViewController = self->_remoteViewContainerViewController;
  id v4 = a3;
  id v5 = [(_UIResilientRemoteViewContainerViewController *)remoteViewContainerViewController remoteViewController];
  id v6 = [v5 serviceViewControllerProxy];

  [v6 handleSafariScriptURL:v4];
}

- (id)_errorWithCode:(int64_t)a3 errorDescriptionLocalizationKey:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a4;
  id v7 = [v5 bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:v6 value:&stru_1F08A7B80 table:0];

  if (v8)
  {
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKErrorDomain" code:a3 userInfo:v9];

  return v10;
}

- (void)_reportErrorForMissingSystemMusicApplication
{
  id v5 = (void (**)(id, void, void *))_Block_copy(self->_loadCompletionHandler);
  if (v5)
  {
    id loadCompletionHandler = self->_loadCompletionHandler;
    self->_id loadCompletionHandler = 0;

    id v4 = [(SKCloudServiceSetupViewController *)self _errorWithCode:0 errorDescriptionLocalizationKey:@"CLOUD_SERVICE_SETUP_VIEW_CONTROLLER_MISSING_SYSTEM_MUSIC_APPLICATION"];
    v5[2](v5, 0, v4);
  }
}

- (void)_reportCompletionForInlineOfferUnsupported
{
  id v4 = (void (**)(id, uint64_t, void))_Block_copy(self->_loadCompletionHandler);
  if (v4)
  {
    id loadCompletionHandler = self->_loadCompletionHandler;
    self->_id loadCompletionHandler = 0;

    v4[2](v4, 1, 0);
  }
}

- (void)_requestRemoteViewController
{
  v3 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:@"com.apple.Music.StoreFlowExtension" error:0];
  if (v3)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__SKCloudServiceSetupViewController__requestRemoteViewController__block_invoke;
    v11[3] = &unk_1E5FAA828;
    objc_copyWeak(&v12, &location);
    [v3 setRequestInterruptionBlock:v11];
    [(SKCloudServiceSetupViewController *)self _beginDelayingPresentation:&__block_literal_global_9 cancellationHandler:3.0];
    id v4 = (void *)MEMORY[0x1E4FB2260];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__SKCloudServiceSetupViewController__requestRemoteViewController__block_invoke_2;
    v9[3] = &unk_1E5FAA870;
    objc_copyWeak(&v10, &location);
    id v5 = [v4 instantiateWithExtension:v3 completion:v9];
    remoteViewContainerViewController = self->_remoteViewContainerViewController;
    self->_remoteViewContainerViewController = v5;

    [(SKCloudServiceSetupViewController *)self addChildViewController:self->_remoteViewContainerViewController];
    if ([(SKCloudServiceSetupViewController *)self isViewLoaded])
    {
      id v7 = [(SKCloudServiceSetupViewController *)self view];
      id v8 = [(_UIResilientRemoteViewContainerViewController *)self->_remoteViewContainerViewController view];
      [v7 addSubview:v8];
    }
    [(_UIResilientRemoteViewContainerViewController *)self->_remoteViewContainerViewController didMoveToParentViewController:self];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_isUnableToLoadRemoteViewController = 1;
    [(SKCloudServiceSetupViewController *)self _reportErrorForMissingSystemMusicApplication];
  }
}

void __65__SKCloudServiceSetupViewController__requestRemoteViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    id v5 = [v2 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      int v6 = v4;
    }
    else {
      int v6 = v4 & 2;
    }
    if (v6)
    {
      v9[0] = 0;
      LODWORD(v8) = 2;
      id v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_12:

        [WeakRetained _remoteViewControllerExtensionWasInterrupted];
        goto LABEL_13;
      }
      id v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, v9, v8);
      free(v7);
      SSFileLog();
    }

    goto LABEL_12;
  }
LABEL_13:
}

uint64_t __65__SKCloudServiceSetupViewController__requestRemoteViewController__block_invoke_116()
{
  return 0;
}

void __65__SKCloudServiceSetupViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  int v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _didReceiveRemoteViewController:v4];
}

- (void)_didReceiveRemoteViewController:(id)a3
{
  [a3 setDelegate:self];
  [(SKCloudServiceSetupViewController *)self _endDelayingPresentation];
  self->_isRemoteViewControllerReady = 1;

  [(SKCloudServiceSetupViewController *)self _reloadWithActiveCloudServiceSetupReloadContext];
}

- (void)_reloadWithActiveCloudServiceSetupReloadContext
{
  if (self->_isRemoteViewControllerReady && self->_activeCloudServiceSetupReloadContext)
  {
    int v3 = [(_UIResilientRemoteViewContainerViewController *)self->_remoteViewContainerViewController remoteViewController];
    id v4 = [v3 serviceViewControllerProxy];

    if (!self->_hasInitializedServiceViewController)
    {
      [v4 applyConfiguration:self->_configuration];
      self->_hasInitializedServiceViewController = 1;
    }
    [v4 reloadWithContext:self->_activeCloudServiceSetupReloadContext];
  }
}

- (void)_dismissCloudServiceSetupViewControllerWithAnimation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v6 = (void (**)(void))a4;
  id v7 = [(SKCloudServiceSetupViewController *)self parentViewController];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v16 = 138543618;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = v7;
      LODWORD(v15) = 22;
      objc_super v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_12:

        goto LABEL_14;
      }
      id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v16, v15);
      free(v13);
      SSFileLog();
    }

    goto LABEL_12;
  }
  [(SKCloudServiceSetupViewController *)self dismissViewControllerAnimated:v4 completion:v6];
LABEL_14:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained cloudServiceSetupViewControllerDidDismiss:self];
  }
  if (v6 && v7) {
    v6[2](v6);
  }
}

- (void)_remoteViewControllerExtensionWasInterrupted
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    int v3 = [(SKCloudServiceSetupViewController *)self transitionCoordinator];
    if (v3)
    {
      BOOL v4 = v3;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __81__SKCloudServiceSetupViewController__remoteViewControllerExtensionWasInterrupted__block_invoke_2;
      v5[3] = &unk_1E5FAA898;
      v5[4] = self;
      [v3 animateAlongsideTransition:0 completion:v5];
    }
    else if (self->_isFullyAppeared)
    {
      [(SKCloudServiceSetupViewController *)self _dismissCloudServiceSetupViewControllerWithAnimation:1 completion:0];
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__SKCloudServiceSetupViewController__remoteViewControllerExtensionWasInterrupted__block_invoke;
    block[3] = &unk_1E5FA9A08;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __81__SKCloudServiceSetupViewController__remoteViewControllerExtensionWasInterrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _remoteViewControllerExtensionWasInterrupted];
}

uint64_t __81__SKCloudServiceSetupViewController__remoteViewControllerExtensionWasInterrupted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _remoteViewControllerExtensionWasInterrupted];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (SKCloudServiceSetupConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_safariViewController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong(&self->_loadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_activeCloudServiceSetupReloadContext, 0);
  objc_storeStrong((id *)&self->_remoteViewContainerViewController, 0);

  objc_destroyWeak((id *)&self->_presentedRedeemCameraViewController);
}

@end