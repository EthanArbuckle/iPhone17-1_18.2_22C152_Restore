@interface ILClassificationUIExtensionHostViewController
- (ILClassificationExtensionShellViewController)shellViewController;
- (ILClassificationReportingController)reportingController;
- (ILClassificationRequest)classificationRequest;
- (ILClassificationResponse)classificationResponse;
- (ILClassificationUIExtensionHostContext)extensionHostContext;
- (ILClassificationUIExtensionHostViewController)initWithClassificationRequest:(id)a3 sender:(id)a4 isoCountryCode:(id)a5;
- (ILClassificationUIExtensionHostViewControllerDelegate)delegate;
- (NSCopying)extensionRequestIdentifier;
- (NSExtension)extension;
- (NSString)isoCountryCode;
- (NSString)sender;
- (OS_dispatch_queue)queue;
- (UINavigationController)navigationController;
- (id)initUnactivatedVCWithRequest:(id)a3 sender:(id)a4 isoCountryCode:(id)a5;
- (id)logErrorWithMessage:(id)a3;
- (void)activateExtensionWithCompletion:(id)a3;
- (void)blockNumber:(id)a3 withCountryCode:(id)a4;
- (void)context:(id)a3 didBecomeReadyForClassificationResponse:(BOOL)a4;
- (void)didCompleteClassificationRequestWithResponse:(id)a3;
- (void)finish;
- (void)launchSettings;
- (void)presentBlockAlertWithCompletion:(id)a3;
- (void)setClassificationResponse:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionHostContext:(id)a3;
- (void)setExtensionRequestIdentifier:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setSender:(id)a3;
- (void)setShellViewController:(id)a3;
- (void)userDidFinishForExtensionShellViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ILClassificationUIExtensionHostViewController

- (ILClassificationUIExtensionHostViewController)initWithClassificationRequest:(id)a3 sender:(id)a4 isoCountryCode:(id)a5
{
  v5 = [(ILClassificationUIExtensionHostViewController *)self initUnactivatedVCWithRequest:a3 sender:a4 isoCountryCode:a5];
  [(ILClassificationUIExtensionHostViewController *)v5 activateExtensionWithCompletion:0];
  return v5;
}

- (id)initUnactivatedVCWithRequest:(id)a3 sender:(id)a4 isoCountryCode:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ILClassificationUIExtensionHostViewController;
  v12 = [(ILClassificationUIExtensionHostViewController *)&v21 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, MEMORY[0x263EF83A0]);
    objc_storeStrong((id *)&v13->_classificationRequest, a3);
    objc_storeStrong((id *)&v13->_sender, a4);
    objc_storeStrong((id *)&v13->_isoCountryCode, a5);
    v14 = [[ILClassificationReportingController alloc] initWithHostViewController:v13];
    reportingController = v13->_reportingController;
    v13->_reportingController = v14;

    v16 = objc_alloc_init(ILClassificationExtensionShellViewController);
    shellViewController = v13->_shellViewController;
    v13->_shellViewController = v16;

    [(ILClassificationExtensionShellViewController *)v13->_shellViewController setDelegate:v13];
    uint64_t v18 = [objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v13->_shellViewController];
    navigationController = v13->_navigationController;
    v13->_navigationController = (UINavigationController *)v18;
  }
  return v13;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)ILClassificationUIExtensionHostViewController;
  [(ILClassificationUIExtensionHostViewController *)&v10 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] whiteColor];
  v4 = [(ILClassificationUIExtensionHostViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(ILClassificationUIExtensionHostViewController *)self view];
  v6 = [(ILClassificationUIExtensionHostViewController *)self navigationController];
  v7 = [v6 view];
  [v5 addSubview:v7];

  v8 = [(ILClassificationUIExtensionHostViewController *)self navigationController];
  [(ILClassificationUIExtensionHostViewController *)self addChildViewController:v8];

  id v9 = [(ILClassificationUIExtensionHostViewController *)self navigationController];
  [v9 didMoveToParentViewController:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ILClassificationUIExtensionHostViewController;
  [(ILClassificationUIExtensionHostViewController *)&v6 viewDidDisappear:a3];
  v4 = [(ILClassificationUIExtensionHostViewController *)self extension];
  v5 = [(ILClassificationUIExtensionHostViewController *)self extensionRequestIdentifier];
  [v4 cancelExtensionRequestWithIdentifier:v5];
}

- (void)activateExtensionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F0EF60] sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke;
  v7[3] = &unk_264CD9838;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 activateWithCompletion:v7];
}

void __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = ILDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 identifier];
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_2375F8000, v7, OS_LOG_TYPE_DEFAULT, "Instantiating remote view controller for extension identifier %@", buf, 0xCu);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke_12;
    v16[3] = &unk_264CD97E8;
    uint64_t v10 = *(void *)(a1 + 32);
    id v9 = (id *)(a1 + 32);
    v16[4] = v10;
    id v11 = v5;
    id v17 = v11;
    id v18 = v9[1];
    [v11 instantiateViewControllerWithInputItems:MEMORY[0x263EFFA68] connectionHandler:v16];
    objc_initWeak((id *)buf, *v9);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke_22;
    v14[3] = &unk_264CD9810;
    objc_copyWeak(&v15, (id *)buf);
    [v11 setRequestInterruptionBlock:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v12 = [*(id *)(a1 + 32) logErrorWithMessage:@"Failed to determine ui classification extension"];
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v12);
    }
  }
}

void __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v10);

  id v11 = v9;
  if (v7 && v8)
  {
    [*(id *)(a1 + 32) setExtension:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setExtensionRequestIdentifier:v7];
    v12 = [*(id *)(a1 + 40) _extensionContextForUUID:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = ILDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v8;
        _os_log_impl(&dword_2375F8000, v13, OS_LOG_TYPE_DEFAULT, "Successfully instantiated remote view controller %@", buf, 0xCu);
      }

      v14 = *(void **)(a1 + 32);
      id v15 = [v14 queue];
      [v12 setDelegate:v14 queue:v15];

      [*(id *)(a1 + 32) setExtensionHostContext:v12];
      v16 = ILDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [*(id *)(a1 + 32) classificationRequest];
        *(_DWORD *)buf = 138412546;
        id v29 = v8;
        __int16 v30 = 2112;
        v31 = v17;
        _os_log_impl(&dword_2375F8000, v16, OS_LOG_TYPE_DEFAULT, "Preparing view controller %@ for classification request %@", buf, 0x16u);
      }
      id v18 = [*(id *)(a1 + 32) classificationRequest];
      [v12 prepareForClassificationRequest:v18];

      v19 = [*(id *)(a1 + 32) shellViewController];
      [v19 displayExtensionViewController:v8 forExtension:*(void *)(a1 + 40)];

      v20 = v11;
    }
    else
    {
      v25 = *(void **)(a1 + 32);
      v26 = [NSString stringWithFormat:@"Could not obtain extension host context of class %@: %@", objc_opt_class(), v12];
      v20 = [v25 logErrorWithMessage:v26];
    }
  }
  else
  {
    uint64_t v21 = NSString;
    v22 = *(void **)(a1 + 32);
    v23 = [*(id *)(a1 + 40) identifier];
    v24 = [v21 stringWithFormat:@"Failed to instantiate view controller with extension identifier %@: %@", v23, v11];
    v20 = [v22 logErrorWithMessage:v24];
  }
  uint64_t v27 = *(void *)(a1 + 48);
  if (v27) {
    (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v20);
  }
}

void __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke_22_cold_1((uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finish];
}

- (void)userDidFinishForExtensionShellViewController:(id)a3
{
  id v4 = [(ILClassificationUIExtensionHostViewController *)self extensionHostContext];
  id v5 = [(ILClassificationUIExtensionHostViewController *)self classificationRequest];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __94__ILClassificationUIExtensionHostViewController_userDidFinishForExtensionShellViewController___block_invoke;
  v6[3] = &unk_264CD9860;
  v6[4] = self;
  [v4 classificationResponseForRequest:v5 completion:v6];
}

uint64_t __94__ILClassificationUIExtensionHostViewController_userDidFinishForExtensionShellViewController___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) didCompleteClassificationRequestWithResponse:a2];
  }
  return result;
}

- (void)context:(id)a3 didBecomeReadyForClassificationResponse:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(ILClassificationUIExtensionHostViewController *)self shellViewController];
  [v5 setEnableFinishOption:v4];
}

- (void)didCompleteClassificationRequestWithResponse:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ILClassificationUIExtensionHostViewController *)self queue];
  dispatch_assert_queue_V2(v5);

  [(ILClassificationUIExtensionHostViewController *)self setClassificationResponse:v4];
  id v6 = ILDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(ILClassificationUIExtensionHostViewController *)self classificationRequest];
    *(_DWORD *)buf = 138412546;
    v25 = v7;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_2375F8000, v6, OS_LOG_TYPE_DEFAULT, "Host VC didCompleteClassificationRequest: %@ with response: %@", buf, 0x16u);
  }
  uint64_t v8 = [v4 action];
  if ((unint64_t)(v8 - 1) < 2)
  {
    id v11 = [(ILClassificationUIExtensionHostViewController *)self reportingController];
    v12 = [(ILClassificationUIExtensionHostViewController *)self extension];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke;
    v22 = &unk_264CD98B0;
    v23 = self;
    uint64_t v13 = &v19;
    goto LABEL_8;
  }
  if (!v8)
  {
    [(ILClassificationUIExtensionHostViewController *)self finish];
    goto LABEL_10;
  }
  if (v8 == 3)
  {
    id v9 = [(ILClassificationUIExtensionHostViewController *)self sender];
    uint64_t v10 = [(ILClassificationUIExtensionHostViewController *)self isoCountryCode];
    [(ILClassificationUIExtensionHostViewController *)self blockNumber:v9 withCountryCode:v10];

    id v11 = [(ILClassificationUIExtensionHostViewController *)self reportingController];
    v12 = [(ILClassificationUIExtensionHostViewController *)self extension];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_3;
    id v17 = &unk_264CD98B0;
    id v18 = self;
    uint64_t v13 = &v14;
LABEL_8:
    objc_msgSend(v11, "reportResponse:forExtension:withCompletion:", v4, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  }
LABEL_10:
}

uint64_t __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentedViewController];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_2;
    v5[3] = &unk_264CD9888;
    v5[4] = v3;
    return [v3 dismissViewControllerAnimated:0 completion:v5];
  }
  else
  {
    return [v3 finish];
  }
}

uint64_t __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

uint64_t __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentedViewController];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_4;
    v6[3] = &unk_264CD9888;
    v6[4] = v3;
    return [v3 dismissViewControllerAnimated:0 completion:v6];
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_6;
    v5[3] = &unk_264CD9888;
    v5[4] = v3;
    return [v3 presentBlockAlertWithCompletion:v5];
  }
}

uint64_t __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_5;
  v3[3] = &unk_264CD9888;
  v3[4] = v1;
  return [v1 presentBlockAlertWithCompletion:v3];
}

uint64_t __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

uint64_t __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

- (void)finish
{
  id v3 = ILDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2375F8000, v3, OS_LOG_TYPE_DEFAULT, "Finished, invoking didCompleteClassificationRequest", v7, 2u);
  }

  id v4 = [(ILClassificationUIExtensionHostViewController *)self delegate];
  id v5 = [(ILClassificationUIExtensionHostViewController *)self classificationRequest];
  id v6 = [(ILClassificationUIExtensionHostViewController *)self classificationResponse];
  [v4 controller:self didCompleteClassificationRequest:v5 withResponse:v6];
}

- (void)presentBlockAlertWithCompletion:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(ILClassificationUIExtensionHostViewController *)self sender];
    *(_DWORD *)buf = 138412290;
    v38 = v5;
    _os_log_impl(&dword_2375F8000, v4, OS_LOG_TYPE_DEFAULT, "Present block alert for: %@", buf, 0xCu);
  }
  id v6 = NSString;
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"%@_HAS_BLOCKED_%@_MESSAGE" value:&stru_26EA54150 table:@"IdentityLookupUI"];
  id v9 = [(ILClassificationUIExtensionHostViewController *)self extension];
  uint64_t v10 = [v9 _plugIn];
  id v11 = [v10 localizedContainingName];
  v12 = [(ILClassificationUIExtensionHostViewController *)self sender];
  uint64_t v13 = objc_msgSend(v6, "stringWithFormat:", v8, v11, v12);

  uint64_t v14 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"NUMBER_HAS_BEEN_BLOCKED" value:&stru_26EA54150 table:@"IdentityLookupUI"];
  id v17 = [v14 alertControllerWithTitle:v16 message:v13 preferredStyle:1];

  id v18 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v20 = [v19 localizedStringForKey:@"OKAY" value:&stru_26EA54150 table:@"IdentityLookupUI"];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __81__ILClassificationUIExtensionHostViewController_presentBlockAlertWithCompletion___block_invoke;
  v35[3] = &unk_264CD98D8;
  id v21 = v29;
  id v36 = v21;
  v22 = [v18 actionWithTitle:v20 style:0 handler:v35];
  [v17 addAction:v22];

  v23 = (void *)MEMORY[0x263F1C3F0];
  v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"SETTINGS" value:&stru_26EA54150 table:@"IdentityLookupUI"];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __81__ILClassificationUIExtensionHostViewController_presentBlockAlertWithCompletion___block_invoke_53;
  v33[3] = &unk_264CD9900;
  v33[4] = self;
  id v34 = v21;
  id v26 = v21;
  id v27 = [v23 actionWithTitle:v25 style:0 handler:v33];
  [v17 addAction:v27];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__ILClassificationUIExtensionHostViewController_presentBlockAlertWithCompletion___block_invoke_54;
  block[3] = &unk_264CD9928;
  id v31 = v17;
  uint64_t v32 = self;
  id v28 = v17;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __81__ILClassificationUIExtensionHostViewController_presentBlockAlertWithCompletion___block_invoke(uint64_t a1)
{
  v2 = ILDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2375F8000, v2, OS_LOG_TYPE_DEFAULT, "User dismissed report and block alert controller", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __81__ILClassificationUIExtensionHostViewController_presentBlockAlertWithCompletion___block_invoke_53(uint64_t a1)
{
  v2 = ILDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2375F8000, v2, OS_LOG_TYPE_DEFAULT, "User launched settings", v4, 2u);
  }

  [*(id *)(a1 + 32) launchSettings];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __81__ILClassificationUIExtensionHostViewController_presentBlockAlertWithCompletion___block_invoke_54(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = ILDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2375F8000, v2, OS_LOG_TYPE_DEFAULT, "Present reportAndBlockAlert: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
}

- (void)launchSettings
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2375F8000, log, OS_LOG_TYPE_ERROR, "Error opening url: %@ (%@)", (uint8_t *)&v3, 0x16u);
}

- (void)blockNumber:(id)a3 withCountryCode:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = ILDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_2375F8000, v7, OS_LOG_TYPE_DEFAULT, "blocking number: %@ with country code: %@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v8 = (void *)CUTWeakLinkClass();
  id v9 = (void *)CUTWeakLinkClass();
  uint64_t v10 = [v8 sharedPrivacyManager];
  id v11 = [v9 phoneNumberWithDigits:v5 countryCode:v6];
  [v10 setBlockIncomingCommunication:1 forPhoneNumber:v11];
}

- (id)logErrorWithMessage:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[ILClassificationUIExtensionHostViewController logErrorWithMessage:]((uint64_t)v3, v4);
  }

  id v5 = (void *)MEMORY[0x263F087E8];
  id v9 = @"ErrorMessage";
  v10[0] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"ILClassificationUIExtensionHostViewController" code:0 userInfo:v6];

  return v7;
}

- (ILClassificationUIExtensionHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ILClassificationUIExtensionHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (ILClassificationRequest)classificationRequest
{
  return self->_classificationRequest;
}

- (ILClassificationResponse)classificationResponse
{
  return self->_classificationResponse;
}

- (void)setClassificationResponse:(id)a3
{
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (ILClassificationExtensionShellViewController)shellViewController
{
  return self->_shellViewController;
}

- (void)setShellViewController:(id)a3
{
}

- (ILClassificationUIExtensionHostContext)extensionHostContext
{
  return self->_extensionHostContext;
}

- (void)setExtensionHostContext:(id)a3
{
}

- (ILClassificationReportingController)reportingController
{
  return self->_reportingController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingController, 0);
  objc_storeStrong((id *)&self->_extensionHostContext, 0);
  objc_storeStrong((id *)&self->_shellViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_classificationResponse, 0);
  objc_storeStrong((id *)&self->_classificationRequest, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke_22_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2375F8000, a2, OS_LOG_TYPE_ERROR, "handling interruption for extension with identifier: %@", (uint8_t *)&v2, 0xCu);
}

- (void)logErrorWithMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2375F8000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end