@interface GKExtensionRemoteViewController
+ (BOOL)dismissAutomaticallyAfterExtensionCompletion;
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)initialItemsForExtension;
+ (void)setupCallbackBlocksForExtension:(id)a3 withParentViewController:(id)a4;
+ (void)viewControllerForExtension:(id)a3 inputItems:(id)a4 completionHandler:(id)a5;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (GKExtensionRemoteViewController)init;
- (NSExtension)extension;
- (id)extensionObjectProxy;
- (id)requestIdentifier;
- (int64_t)_desiredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)cancelExtension;
- (void)dealloc;
- (void)extensionIsCanceling;
- (void)extensionIsFinishing;
- (void)hostApp:(id)a3 grantingAccessExtensionSandbox:(id)a4 replyWithEndpoint:(id)a5;
- (void)messageFromClient:(id)a3;
- (void)messageFromExtension:(id)a3;
- (void)sendMessageToExtension:(id)a3;
- (void)setExtension:(id)a3;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setRequestIdentifier:(id)a3;
- (void)tearDownExtensionWithReply:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKExtensionRemoteViewController

- (GKExtensionRemoteViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)GKExtensionRemoteViewController;
  v2 = [(GKExtensionRemoteViewController *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v5 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v5 = 0), v5))
    {
      [(GKExtensionRemoteViewController *)v2 setModalPresentationStyle:17];
    }
    else
    {
      [(GKExtensionRemoteViewController *)v2 setModalPresentationStyle:16];
      v6 = [MEMORY[0x1E4F63A10] sharedTheme];
      [v6 formSheetSize];
      -[GKExtensionRemoteViewController setPreferredContentSize:](v2, "setPreferredContentSize:");
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F63A10] sharedTheme];
  [v3 clearResourceCache];

  v4.receiver = self;
  v4.super_class = (Class)GKExtensionRemoteViewController;
  [(_UIRemoteViewController *)&v4 dealloc];
}

+ (void)setupCallbackBlocksForExtension:(id)a3 withParentViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_initWeak(&location, v6);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__GKExtensionRemoteViewController_setupCallbackBlocksForExtension_withParentViewController___block_invoke;
  v7[3] = &unk_1E5F65718;
  objc_copyWeak(&v8, &location);
  [v5 setRequestInterruptionBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __92__GKExtensionRemoteViewController_setupCallbackBlocksForExtension_withParentViewController___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ExtensionErrorDomain" code:-5900 userInfo:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__GKExtensionRemoteViewController_setupCallbackBlocksForExtension_withParentViewController___block_invoke_2;
  v4[3] = &unk_1E5F64710;
  id v5 = v2;
  id v3 = v2;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v6);
}

void __92__GKExtensionRemoteViewController_setupCallbackBlocksForExtension_withParentViewController___block_invoke_2(uint64_t a1)
{
  if (!*MEMORY[0x1E4F63860]) {
    id v2 = (id)GKOSLoggers();
  }
  id v3 = *MEMORY[0x1E4F63850];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
    __92__GKExtensionRemoteViewController_setupCallbackBlocksForExtension_withParentViewController___block_invoke_2_cold_1(a1, v3);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained extensionDidFinishWithError:*(void *)(a1 + 32)];
  }
}

+ (void)viewControllerForExtension:(id)a3 inputItems:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v7)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5F65768;
    v14 = v15;
    id v12 = v7;
    id v13 = v10;
    [v12 instantiateViewControllerWithInputItems:v8 connectionHandler:v11];

    _Block_object_dispose(v15, 8);
  }
  else if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke;
    block[3] = &unk_1E5F639B0;
    id v17 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v10 = (void *)MEMORY[0x1E4F636D8];
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKExtensionRemoteViewController.m", 104, "+[GKExtensionRemoteViewController viewControllerForExtension:inputItems:completionHandler:]_block_invoke_2");
  id v12 = [v10 dispatchGroupWithName:v11];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_3;
  v24[3] = &unk_1E5F65740;
  id v25 = v9;
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 48);
  id v26 = v13;
  uint64_t v30 = v14;
  id v15 = v12;
  id v27 = v15;
  id v28 = v8;
  id v29 = v7;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  [v15 perform:v24];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_20;
  v21[3] = &unk_1E5F63988;
  id v19 = *(id *)(a1 + 40);
  id v22 = v15;
  id v23 = v19;
  id v20 = v15;
  [v20 notifyOnMainQueueWithBlock:v21];
}

void __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F63860];
  if (*(void *)(a1 + 32))
  {
    if (!v4) {
      id v5 = (id)GKOSLoggers();
    }
    id v6 = (void *)*MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_3_cold_2(a1, v6);
    }
    [*(id *)(a1 + 48) setObject:*(void *)(a1 + 32) forKeyedSubscript:@"error"];
    v3[2](v3);
  }
  else
  {
    if (!v4) {
      id v7 = (id)GKOSLoggers();
    }
    id v8 = (void *)*MEMORY[0x1E4F63868];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
      __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_3_cold_1(a1, v8);
    }
    id v9 = [*(id *)(a1 + 40) _extensionContextForUUID:*(void *)(a1 + 64)];
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 56);
    [v11 setExtension:v10];
    [v11 setRequestIdentifier:*(void *)(a1 + 64)];
    [v9 setRemoteViewController:v11];
    [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:@"remoteViewController"];

    v3[2](v3);
  }
}

void __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"remoteViewController"];
    id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"error"];
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);
  }
}

+ (id)initialItemsForExtension
{
  v14[6] = *MEMORY[0x1E4F143B8];
  v13[0] = @"StatusBarHeightKey";
  id v2 = NSNumber;
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 statusBarHeight];
  id v4 = objc_msgSend(v2, "numberWithDouble:");
  v14[0] = v4;
  v13[1] = @"HostPIDKey";
  id v5 = [NSNumber numberWithInt:getpid()];
  v14[1] = v5;
  v13[2] = @"CurrentGameKey";
  id v6 = [MEMORY[0x1E4F636F0] currentGame];
  v14[2] = v6;
  v13[3] = @"LocalPlayerKey";
  id v7 = [MEMORY[0x1E4F63760] localPlayer];
  v14[3] = v7;
  v13[4] = @"RTLKey";
  id v8 = [NSNumber numberWithBool:GKShouldLayoutRTL()];
  v14[4] = v8;
  v13[5] = @"LocalizationsKey";
  id v9 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v10 = [v9 preferredLocalizations];
  v14[5] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];

  return v11;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)GKExtensionRemoteViewController;
  [(GKExtensionRemoteViewController *)&v5 viewDidLoad];
  id v3 = [(GKExtensionRemoteViewController *)self view];
  [v3 setBackgroundColor:0];

  id v4 = [(GKExtensionRemoteViewController *)self view];
  [v4 setOpaque:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [MEMORY[0x1E4F63760] local];
  [v5 hideAccessPoint];

  v10.receiver = self;
  v10.super_class = (Class)GKExtensionRemoteViewController;
  [(_UIRemoteViewController *)&v10 viewWillAppear:v3];
  id v6 = [MEMORY[0x1E4F63A18] shared];
  [v6 setIsShowingRemoteUI:1];

  id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v9 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v9 = 0), v9)) {
    [(UIViewController *)self _gkSaveStatusBarStyleAnimated:v3 setToStyle:[(GKExtensionRemoteViewController *)self _desiredStatusBarStyle]];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKExtensionRemoteViewController;
  -[_UIRemoteViewController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  objc_super v5 = [MEMORY[0x1E4F63A18] shared];
  [v5 setIsShowingRemoteUI:0];

  [(UIViewController *)self _gkRestoreStatusBarStyle:v3];
  id v6 = [MEMORY[0x1E4F63760] local];
  [v6 showAccessPoint];
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (int64_t)_desiredStatusBarStyle
{
  return 300;
}

+ (BOOL)dismissAutomaticallyAfterExtensionCompletion
{
  return 0;
}

- (void)cancelExtension
{
  id v4 = [(GKExtensionRemoteViewController *)self extension];
  BOOL v3 = [(GKExtensionRemoteViewController *)self requestIdentifier];
  [v4 cancelExtensionRequestWithIdentifier:v3];
}

- (void)sendMessageToExtension:(id)a3
{
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  id v4 = [(GKExtensionRemoteViewController *)self extensionObjectProxy];
  [v4 messageFromClient:v5];
}

- (void)extensionIsCanceling
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() dismissAutomaticallyAfterExtensionCompletion])
  {
    BOOL v3 = [(GKExtensionRemoteViewController *)self presentingViewController];
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
  id v5 = @"MessageCommandKey";
  v6[0] = &unk_1F0811FB8;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v4];
}

- (void)extensionIsFinishing
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() dismissAutomaticallyAfterExtensionCompletion])
  {
    BOOL v3 = [(GKExtensionRemoteViewController *)self presentingViewController];
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
  id v5 = @"MessageCommandKey";
  v6[0] = &unk_1F0811FD0;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(GKExtensionRemoteViewController *)self sendMessageToExtension:v4];
}

- (id)extensionObjectProxy
{
  BOOL v3 = [(GKExtensionRemoteViewController *)self extension];
  id v4 = [(GKExtensionRemoteViewController *)self requestIdentifier];
  id v5 = [v3 _extensionContextForUUID:v4];

  id v6 = [v5 _auxiliaryConnection];
  objc_super v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_30];

  return v7;
}

void __55__GKExtensionRemoteViewController_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = (void *)*MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    __58__GKChallengeIssueHostViewController_extensionObjectProxy__block_invoke_cold_1(v4, v2);
  }
}

- (void)messageFromClient:(id)a3
{
  id v4 = a3;
  id v5 = [(GKExtensionRemoteViewController *)self extensionObjectProxy];
  [v5 messageFromClient:v4];
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v11 = (id)[a3 mutableCopy];
  objc_super v7 = NSNumber;
  uint64_t v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "userInterfaceIdiom"));
  [v11 setObject:v9 forKeyedSubscript:@"HostUserInterfaceIdiom"];

  objc_super v10 = [(GKExtensionRemoteViewController *)self extensionObjectProxy];
  [v10 setInitialState:v11 withReply:v6];
}

- (void)hostApp:(id)a3 grantingAccessExtensionSandbox:(id)a4 replyWithEndpoint:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(GKExtensionRemoteViewController *)self extensionObjectProxy];
  [v11 hostApp:v10 grantingAccessExtensionSandbox:v9 replyWithEndpoint:v8];
}

- (void)tearDownExtensionWithReply:(id)a3
{
  id v5 = a3;
  id v4 = [(GKExtensionRemoteViewController *)self extensionObjectProxy];
  if (objc_opt_respondsToSelector()) {
    [v4 tearDownExtensionWithReply:v5];
  }
}

- (void)messageFromExtension:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  id v6 = GKExtensionProtocolSecureCodedClasses();
  id v14 = 0;
  objc_super v7 = [v4 unarchivedObjectOfClasses:v6 fromData:v5 error:&v14];

  id v8 = v14;
  if (v8)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v9 = (id)GKOSLoggers();
    }
    id v10 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKExtensionRemoteViewController messageFromExtension:]((uint64_t)v8, v10);
    }
  }
  id v11 = [v7 objectForKeyedSubscript:@"MessageCommandKey"];
  uint64_t v12 = [v11 integerValue];

  if (v12 == 2)
  {
    [(GKExtensionRemoteViewController *)self extensionIsFinishing];
  }
  else if (v12 == 1)
  {
    id v13 = [MEMORY[0x1E4F63760] localPlayer];
    [v13 reportAuthenticationLoginCanceled];

    [(GKExtensionRemoteViewController *)self extensionIsCanceling];
  }
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (id)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

void __92__GKExtensionRemoteViewController_setupCallbackBlocksForExtension_withParentViewController___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "Extension request interrupted with error: %@", (uint8_t *)&v3, 0xCu);
}

void __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSNumber;
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v4 = a2;
  uint64_t v5 = [v2 numberWithInteger:v3];
  OUTLINED_FUNCTION_0_6();
  _os_log_debug_impl(&dword_1AF250000, v4, OS_LOG_TYPE_DEBUG, "Received _UIRemoteViewController for Game Center extension: %@, connectionHandler call count: %@, remoteViewController: %@", v6, 0x20u);
}

void __91__GKExtensionRemoteViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_3_cold_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSNumber;
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v4 = a2;
  uint64_t v5 = [v2 numberWithInteger:v3];
  OUTLINED_FUNCTION_0_6();
  _os_log_error_impl(&dword_1AF250000, v4, OS_LOG_TYPE_ERROR, "Error instantiating remote view controller for extension: %@, connectionHandler call count: %@, error: %@", v6, 0x20u);
}

- (void)messageFromExtension:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "error while decoding messageFromExtension archive in UIRemoteViewController:%@", (uint8_t *)&v2, 0xCu);
}

@end