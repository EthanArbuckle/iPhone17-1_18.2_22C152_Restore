@interface RPBroadcastActivityViewController
+ (void)loadBroadcastActivityViewControllerWithHandler:(void *)handler;
+ (void)loadBroadcastActivityViewControllerWithPreferredExtension:(NSString *)preferredExtension handler:(void *)handler;
+ (void)loadBroadcastActivityViewControllerWithPreferredExtension:(id)a3 handler:(id)a4 broadcastActivitiesNotInstalledAlertTitle:(id)a5 broadcastActivitiesNotInstalledAlertMessage:(id)a6 atPoint:(CGPoint)a7 fromWindow:(id)a8;
+ (void)viewControllerForExtension:(id)a3 inputItems:(id)a4 completionHandler:(id)a5;
- (RPBroadcastActivityHostViewController)hostViewController;
- (UIPopoverPresentationController)popoverPresentationControllerProxy;
- (id)delegate;
- (id)didFinishHandler;
- (id)popoverPresentationController;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6;
- (void)setDelegate:(id)delegate;
- (void)setDidFinishHandler:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setPopoverPresentationControllerProxy:(id)a3;
@end

@implementation RPBroadcastActivityViewController

+ (void)loadBroadcastActivityViewControllerWithPreferredExtension:(NSString *)preferredExtension handler:(void *)handler
{
}

+ (void)loadBroadcastActivityViewControllerWithHandler:(void *)handler
{
}

+ (void)loadBroadcastActivityViewControllerWithPreferredExtension:(id)a3 handler:(id)a4 broadcastActivitiesNotInstalledAlertTitle:(id)a5 broadcastActivitiesNotInstalledAlertMessage:(id)a6 atPoint:(CGPoint)a7 fromWindow:(id)a8
{
  v56[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  v12 = (void (**)(id, void, id))a4;
  id v47 = a5;
  id v46 = a6;
  v13 = objc_alloc_init(RPBroadcastActivityViewController);
  [(RPBroadcastActivityViewController *)v13 setDidFinishHandler:v12];
  v14 = [MEMORY[0x263F086E0] mainBundle];
  v15 = [v14 infoDictionary];
  v16 = [v15 objectForKeyedSubscript:@"CFBundleIcons"];
  v17 = [v16 objectForKeyedSubscript:@"CFBundlePrimaryIcon"];

  objc_opt_class();
  v45 = v13;
  if (objc_opt_isKindOfClass())
  {
    v18 = [v17 objectForKeyedSubscript:@"CFBundleIconFiles"];
    id v19 = [v18 firstObject];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v17;
    }
    else {
      id v19 = 0;
    }
  }
  v55[0] = @"RPBroadcastExtensionKeyExtensionHostInfoAppName";
  uint64_t v20 = [v14 _rpLocalizedAppName];
  v21 = (void *)v20;
  if (v20) {
    v22 = (__CFString *)v20;
  }
  else {
    v22 = &stru_26D117F38;
  }
  v55[1] = @"RPBroadcastExtensionKeyExtensionHostInfoBundleID";
  v56[0] = v22;
  v23 = [v14 bundleIdentifier];
  v56[1] = v23;
  v24 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
  v25 = (void *)[v24 mutableCopy];

  v43 = v19;
  v26 = [MEMORY[0x263F1C6B0] imageNamed:v19];
  v27 = v26;
  if (v26)
  {
    v28 = UIImagePNGRepresentation(v26);
    [v25 setObject:v28 forKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoAppIcon"];
  }
  v30 = v46;
  v29 = v47;
  if (v47) {
    [v25 setObject:v47 forKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoBroadcastActivitiesNotInstalledAlertTitle"];
  }
  if (v46) {
    [v25 setObject:v46 forKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoBroadcastActivitiesNotInstalledAlertMessage"];
  }
  if (v11) {
    [v25 setObject:v11 forKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoPreferredExtension"];
  }
  v44 = v17;
  id v52 = 0;
  v31 = [MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.ReplayKit.RPBroadcastActivityViewControllerExtension" error:&v52];
  id v32 = v52;
  if (v32)
  {
    v12[2](v12, 0, v32);
    v33 = v45;
  }
  else
  {
    id v34 = objc_alloc_init(MEMORY[0x263F08810]);
    v35 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"RPBroadcastExtensionKeyExtensionHostInfo" attributes:0];
    [v34 setAttributedTitle:v35];

    id v36 = objc_alloc(MEMORY[0x263F088E0]);
    v37 = (void *)[v36 initWithItem:v25 typeIdentifier:*MEMORY[0x263F01A08]];
    v54 = v37;
    [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
    v38 = id v42 = v11;
    [v34 setAttachments:v38];

    uint64_t v39 = objc_opt_class();
    id v53 = v34;
    v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __208__RPBroadcastActivityViewController_loadBroadcastActivityViewControllerWithPreferredExtension_handler_broadcastActivitiesNotInstalledAlertTitle_broadcastActivitiesNotInstalledAlertMessage_atPoint_fromWindow___block_invoke;
    v48[3] = &unk_26451DCD8;
    v33 = v45;
    v49 = v45;
    id v50 = 0;
    v51 = v12;
    v41 = (void *)v39;
    v30 = v46;
    [v41 viewControllerForExtension:v31 inputItems:v40 completionHandler:v48];

    id v11 = v42;
    v29 = v47;
  }
}

void __208__RPBroadcastActivityViewController_loadBroadcastActivityViewControllerWithPreferredExtension_handler_broadcastActivitiesNotInstalledAlertTitle_broadcastActivitiesNotInstalledAlertMessage_atPoint_fromWindow___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __208__RPBroadcastActivityViewController_loadBroadcastActivityViewControllerWithPreferredExtension_handler_broadcastActivitiesNotInstalledAlertTitle_broadcastActivitiesNotInstalledAlertMessage_atPoint_fromWindow___block_invoke_2;
  v5[3] = &unk_26451DCB0;
  id v6 = v3;
  id v7 = a1[4];
  id v9 = a1[6];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __208__RPBroadcastActivityViewController_loadBroadcastActivityViewControllerWithPreferredExtension_handler_broadcastActivitiesNotInstalledAlertTitle_broadcastActivitiesNotInstalledAlertMessage_atPoint_fromWindow___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  id v17 = *(id *)(a1 + 32);
  [v2 setModalPresentationStyle:6];
  id v3 = [MEMORY[0x263F1C550] clearColor];
  id v4 = [*(id *)(a1 + 40) view];
  [v4 setBackgroundColor:v3];

  [*(id *)(a1 + 40) setHostViewController:v17];
  [v17 setBroadcastActivityViewController:*(void *)(a1 + 40)];
  v5 = [*(id *)(a1 + 40) view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [v17 view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  [*(id *)(a1 + 40) addChildViewController:v17];
  v15 = [*(id *)(a1 + 40) view];
  v16 = [v17 view];
  [v15 addSubview:v16];

  [v17 didMoveToParentViewController:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (void)viewControllerForExtension:(id)a3 inputItems:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __93__RPBroadcastActivityViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke;
    v9[3] = &unk_26451DD00;
    id v10 = v7;
    id v11 = v8;
    [v10 instantiateViewControllerWithInputItems:a4 connectionHandler:v9];
  }
}

void __93__RPBroadcastActivityViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v11 = v7;
  double v9 = [*(id *)(a1 + 32) _extensionContextForUUID:a2];
  [v9 setHostViewController:v11];
  if (v8)
  {
    NSLog(&cfstr_ErrorInstantia_0.isa, [v8 code]);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
    }
  }
}

- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v21)
  {
    double v12 = [MEMORY[0x263F1C408] sharedApplication];
    [v12 openURL:v21 options:MEMORY[0x263EFFA78] completionHandler:0];
  }
  double v13 = [(RPBroadcastActivityViewController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    if (a6)
    {
      v15 = [(RPBroadcastActivityViewController *)self delegate];
      v16 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5801 userInfo:MEMORY[0x263EFFA78]];
      id v17 = v15;
      v18 = self;
      id v19 = 0;
      uint64_t v20 = v16;
    }
    else
    {
      v15 = [[RPBroadcastController alloc] initWithExtensionBundleID:v11 broadcastURL:v10];
      id v17 = [(RPBroadcastActivityViewController *)self delegate];
      v16 = v17;
      v18 = self;
      id v19 = v15;
      uint64_t v20 = 0;
    }
    [v17 broadcastActivityViewController:v18 didFinishWithBroadcastController:v19 error:v20];
  }
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  if (a3 == 7)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x263F1C8A0]) initWithPresentedViewController:self->_hostViewController presentingViewController:self];
    [(RPBroadcastActivityViewController *)self setPopoverPresentationControllerProxy:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)RPBroadcastActivityViewController;
    -[RPBroadcastActivityViewController setModalPresentationStyle:](&v5, sel_setModalPresentationStyle_);
  }
}

- (id)popoverPresentationController
{
  return self->_popoverPresentationControllerProxy;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__RPBroadcastActivityViewController_dismissViewControllerAnimated_completion___block_invoke;
  v7[3] = &unk_26451D920;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

id __78__RPBroadcastActivityViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)RPBroadcastActivityViewController;
  return objc_msgSendSuper2(&v3, sel_dismissViewControllerAnimated_completion_, 0, v1);
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (UIPopoverPresentationController)popoverPresentationControllerProxy
{
  return self->_popoverPresentationControllerProxy;
}

- (void)setPopoverPresentationControllerProxy:(id)a3
{
}

- (RPBroadcastActivityHostViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
}

- (id)didFinishHandler
{
  return self->_didFinishHandler;
}

- (void)setDidFinishHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishHandler, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_popoverPresentationControllerProxy, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end