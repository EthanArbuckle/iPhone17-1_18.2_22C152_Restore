@interface QLRemoteItemViewController
- (BOOL)canClickToToggleFullscreen;
- (BOOL)canEnterFullScreen;
- (BOOL)canPinchToDismiss;
- (BOOL)canShowNavBar;
- (BOOL)canShowToolBar;
- (BOOL)canSwipeToDismiss;
- (BOOL)presenterShouldHandleLoadingView:(id)a3 readyToDisplay:(id)a4;
- (QLRemoteItemViewController)init;
- (QLRemotePreviewHostViewController)remoteViewController;
- (id)fullscreenBackgroundColor;
- (id)printer;
- (void)_loadRemoteViewControllerForContext:(id)a3;
- (void)_performLoadHandlerIfNeeded;
- (void)_performSetUpWithRemoteViewController:(id)a3 extension:(id)a4 request:(id)a5 hostContext:(id)a6;
- (void)_registerLoadingHandler:(id)a3;
- (void)dealloc;
- (void)dismissQuickLook;
- (void)forwardMessageToHostOfCustomViewController:(id)a3 completionHandler:(id)a4;
- (void)getFrameWithCompletionBlock:(id)a3;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)numberOfPagesWithSize:(CGSize)a3 completionHandler:(id)a4;
- (void)pdfDataForPageAtIndex:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)prepareForDrawingPages:(_NSRange)a3 ofSize:(CGSize)a4;
- (void)presentShareSheetWithPopoverTracker:(id)a3 customSharedURL:(id)a4 dismissCompletion:(id)a5;
- (void)previewControllerDidUpdatePreferredContentSize:(id)a3;
- (void)previewControllerDidUpdateTitle:(id)a3;
- (void)previewControllerWantsFullScreen:(BOOL)a3;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)provideCurrentPageAndVisibleRectWithCompletionHandler:(id)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setRemoteViewController:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation QLRemoteItemViewController

- (QLRemoteItemViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)QLRemoteItemViewController;
  v2 = [(QLItemViewController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(QLRemoteItemViewController *)v2 view];
    [v4 setAccessibilityIdentifier:@"QLRemoteItemViewControllerHostViewAccessibilityIdentifier"];

    uint64_t v5 = objc_opt_new();
    hostViewControllerProxy = v3->_hostViewControllerProxy;
    v3->_hostViewControllerProxy = (QLCustomItemViewControllerHostProxy *)v5;

    [(QLCustomItemViewControllerHostProxy *)v3->_hostViewControllerProxy setDelegate:v3];
    v3->_needsSetup = 1;
    v3->_readyToLoad = 0;
    v7 = v3;
  }

  return v3;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)QLRemoteItemViewController;
  id v6 = a3;
  [(QLItemViewController *)&v10 setAppearance:v6 animated:v4];
  [(QLPreviewExtensionHostContext *)self->_hostContext setAppearance:v6 animated:v4];

  if (([(NSExtension *)self->_extension ql_isPreviewExtensionThatHaveCustomPresentationView] & 1) == 0)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__QLRemoteItemViewController_setAppearance_animated___block_invoke;
    aBlock[3] = &unk_2642F5430;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    v8 = v7;
    if (v4) {
      [MEMORY[0x263F82E00] animateWithDuration:v7 animations:0.2];
    }
    else {
      (*((void (**)(void *))v7 + 2))(v7);
    }
  }
}

void __53__QLRemoteItemViewController_setAppearance_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appearance];
  [v2 topInset];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1136), "setConstant:");

  v3 = [*(id *)(a1 + 32) appearance];
  [v3 bottomInset];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1144), "setConstant:");

  id v4 = [*(id *)(a1 + 32) view];
  [v4 setNeedsLayout];
}

- (void)previewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isAppearing = 1;
  -[QLPreviewExtensionHostContext previewWillAppear:](self->_hostContext, "previewWillAppear:");
  v5.receiver = self;
  v5.super_class = (Class)QLRemoteItemViewController;
  [(QLItemViewController *)&v5 previewWillAppear:v3];
}

- (void)previewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isVisible = 1;
  -[QLPreviewExtensionHostContext previewDidAppear:](self->_hostContext, "previewDidAppear:");
  v5.receiver = self;
  v5.super_class = (Class)QLRemoteItemViewController;
  [(QLItemViewController *)&v5 previewDidAppear:v3];
}

- (void)previewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isAppearing = 0;
  self->_isVisible = 0;
  -[QLPreviewExtensionHostContext previewWillDisappear:](self->_hostContext, "previewWillDisappear:");
  v5.receiver = self;
  v5.super_class = (Class)QLRemoteItemViewController;
  [(QLItemViewController *)&v5 previewWillDisappear:v3];
}

- (void)previewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  -[QLPreviewExtensionHostContext previewDidDisappear:](self->_hostContext, "previewDidDisappear:");
  v5.receiver = self;
  v5.super_class = (Class)QLRemoteItemViewController;
  [(QLItemViewController *)&v5 previewDidDisappear:v3];
}

- (BOOL)canEnterFullScreen
{
  return 1;
}

- (BOOL)canClickToToggleFullscreen
{
  return 0;
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (BOOL)canShowNavBar
{
  extension = self->_extension;
  if (extension) {
    return [(NSExtension *)extension ql_isPreviewExtensionThatHaveCustomPresentationView] ^ 1;
  }
  else {
    return 1;
  }
}

- (BOOL)canShowToolBar
{
  extension = self->_extension;
  if (extension) {
    return [(NSExtension *)extension ql_isPreviewExtensionThatHaveCustomPresentationView] ^ 1;
  }
  else {
    return 1;
  }
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  [(QLRemoteItemViewController *)self _registerLoadingHandler:a5];
  [(QLRemoteItemViewController *)self _loadRemoteViewControllerForContext:v7];
}

- (void)_loadRemoteViewControllerForContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_needsSetup)
  {
    self->_needsSetup = 0;
    id v6 = [v4 item];
    id v7 = [v6 fetcher];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [v5 item];
      objc_super v9 = [v8 fetcher];
    }
    else
    {
      objc_super v9 = 0;
    }

    objc_initWeak(&location, self);
    objc_super v10 = [MEMORY[0x263F628F8] sharedManager];
    if (v9)
    {
      v11 = [v9 info];
      v12 = [v11 applicationBundleIdentifier];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __66__QLRemoteItemViewController__loadRemoteViewControllerForContext___block_invoke;
      v16[3] = &unk_2642F71C0;
      v13 = &v17;
      objc_copyWeak(&v17, &location);
      [v10 remoteViewControllerForContentType:0 applicationBundleIdentifier:v12 extensionType:0 generatonType:2 withCompletionHandler:v16];
    }
    else
    {
      v11 = [v5 contentType];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __66__QLRemoteItemViewController__loadRemoteViewControllerForContext___block_invoke_2;
      v14[3] = &unk_2642F71C0;
      v13 = &v15;
      objc_copyWeak(&v15, &location);
      [v10 remoteViewControllerForContentType:v11 applicationBundleIdentifier:0 extensionType:0 generatonType:1 withCompletionHandler:v14];
    }

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __66__QLRemoteItemViewController__loadRemoteViewControllerForContext___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v8 = (id *)(a1 + 32);
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained _performSetUpWithRemoteViewController:v11 extension:v12 request:v10 hostContext:v9];
}

void __66__QLRemoteItemViewController__loadRemoteViewControllerForContext___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v8 = (id *)(a1 + 32);
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained _performSetUpWithRemoteViewController:v11 extension:v12 request:v10 hostContext:v9];
}

- (void)_performSetUpWithRemoteViewController:(id)a3 extension:(id)a4 request:(id)a5 hostContext:(id)a6
{
  v48[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  objc_storeStrong((id *)&self->_extension, a4);
  id v14 = a5;
  p_remoteViewController = &self->_remoteViewController;
  objc_storeStrong((id *)&self->_remoteViewController, a3);
  p_hostContext = &self->_hostContext;
  objc_storeStrong((id *)&self->_hostContext, a6);
  [(QLPreviewExtensionHostContext *)self->_hostContext setRemoteItemViewController:self];
  [(QLRemotePreviewHostViewController *)self->_remoteViewController setRemoteItemViewController:self];
  [(QLRemotePreviewHostViewController *)self->_remoteViewController setExtension:v12];
  [(QLRemotePreviewHostViewController *)self->_remoteViewController setRequest:v14];

  if (self->_remoteViewController && *p_hostContext)
  {
    id v47 = v11;
    id v17 = [(QLRemotePreviewHostViewController *)self->_remoteViewController parentViewController];

    if (v17)
    {
      [(QLRemotePreviewHostViewController *)*p_remoteViewController willMoveToParentViewController:0];
      v18 = [(QLRemotePreviewHostViewController *)*p_remoteViewController view];
      [v18 removeFromSuperview];

      [(QLRemotePreviewHostViewController *)*p_remoteViewController removeFromParentViewController];
    }
    [(QLRemoteItemViewController *)self addChildViewController:*p_remoteViewController];
    v19 = [(QLRemoteItemViewController *)self view];
    v20 = [(QLRemotePreviewHostViewController *)*p_remoteViewController view];
    [v19 addSubview:v20];

    [(_UIRemoteViewController *)*p_remoteViewController didMoveToParentViewController:self];
    v21 = [(QLRemotePreviewHostViewController *)*p_remoteViewController view];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

    v22 = [(QLRemotePreviewHostViewController *)*p_remoteViewController view];
    v23 = [v22 leftAnchor];
    v24 = [(QLRemoteItemViewController *)self view];
    v25 = [v24 leftAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [(QLRemotePreviewHostViewController *)*p_remoteViewController view];
    v28 = [v27 rightAnchor];
    v29 = [(QLRemoteItemViewController *)self view];
    v30 = [v29 rightAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    [v31 setActive:1];

    v32 = (void *)MEMORY[0x263F08938];
    v33 = [(QLRemotePreviewHostViewController *)*p_remoteViewController view];
    v34 = [(QLRemoteItemViewController *)self view];
    v35 = [v32 constraintWithItem:v33 attribute:3 relatedBy:0 toItem:v34 attribute:3 multiplier:1.0 constant:0.0];
    topConstraint = self->_topConstraint;
    self->_topConstraint = v35;

    v37 = (void *)MEMORY[0x263F08938];
    v38 = [(QLRemoteItemViewController *)self view];
    v39 = [(QLRemotePreviewHostViewController *)*p_remoteViewController view];
    v40 = [v37 constraintWithItem:v38 attribute:4 relatedBy:0 toItem:v39 attribute:4 multiplier:1.0 constant:0.0];
    bottomConstraint = self->_bottomConstraint;
    self->_bottomConstraint = v40;

    v42 = [(QLRemoteItemViewController *)self view];
    v43 = self->_bottomConstraint;
    v48[0] = self->_topConstraint;
    v48[1] = v43;
    v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];
    [v42 addConstraints:v44];

    [(QLPreviewExtensionHostContext *)*p_hostContext setHostViewControllerProxy:self->_hostViewControllerProxy];
    if (self->_isAppearing) {
      [(QLPreviewExtensionHostContext *)*p_hostContext previewWillAppear:0];
    }
    id v11 = v47;
    if (self->_isVisible) {
      [(QLPreviewExtensionHostContext *)*p_hostContext previewDidAppear:0];
    }
  }
  readyToDisplay = (void (**)(void))self->_readyToDisplay;
  if (readyToDisplay)
  {
    readyToDisplay[2]();
    id v46 = self->_readyToDisplay;
    self->_readyToDisplay = 0;
  }
  self->_readyToLoad = 1;
  [(QLRemoteItemViewController *)self _performLoadHandlerIfNeeded];
}

- (void)_performLoadHandlerIfNeeded
{
  if (self->_readyToLoad)
  {
    loadHandler = (void (**)(id, SEL))self->_loadHandler;
    if (loadHandler)
    {
      loadHandler[2](loadHandler, a2);
      id v4 = self->_loadHandler;
      self->_loadHandler = 0;
    }
  }
}

- (void)_registerLoadingHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke;
  aBlock[3] = &unk_2642F6EE8;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = _Block_copy(aBlock);
  id loadHandler = self->_loadHandler;
  self->_id loadHandler = v6;

  [(QLRemoteItemViewController *)self _performLoadHandlerIfNeeded];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[150] && (id v4 = (void *)WeakRetained[140]) != 0)
    {
      id v5 = [WeakRetained contents];
      id v6 = [v3 context];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke_309;
      v14[3] = &unk_2642F7210;
      id v15 = v3;
      id v16 = *(id *)(a1 + 32);
      [v4 loadPreviewControllerWithContents:v5 context:v6 completionHandler:v14];

      id v7 = v15;
    }
    else
    {
      v8 = (NSObject **)MEMORY[0x263F62940];
      id v9 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        id v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        id v10 = v9;
        id v11 = [v3 context];
        id v12 = [v11 contentType];
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_FAULT, "Failed to get an extension for QuickLook (contentType %@) #Remote", buf, 0xCu);
      }
      uint64_t v13 = *(void *)(a1 + 32);
      id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.quicklook.QLRemoteItemViewController" code:1 userInfo:0];
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v7);
    }
  }
}

void __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke_309(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v8 = (void *)v7[140];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke_2;
  v11[3] = &unk_2642F71E8;
  id v12 = v7;
  id v13 = v5;
  id v14 = v6;
  id v15 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v5;
  [v8 getPrinterProxyWithCompletionHandler:v11];
}

void __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke_2(id *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)a1[4] + 144, a2);
  if (a1[5])
  {
    id v5 = (NSObject **)MEMORY[0x263F62940];
    id v6 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = a1[5];
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_ERROR, "Error while trying to get printer proxy: %@ #Remote", buf, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)a1[4] + 141, a1[6]);
  }
  v8 = [*((id *)a1[4] + 141) objectForKeyedSubscript:@"preferredContentSize"];
  [v8 CGSizeValue];
  objc_msgSend(a1[4], "setPreferredContentSize:");

  id v9 = [*((id *)a1[4] + 141) objectForKeyedSubscript:@"title"];
  [a1[4] setTitle:v9];

  id v11 = a1[7];
  id v10 = a1[5];
  QLRunInMainThread();
}

uint64_t __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke_310(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)dealloc
{
  [(QLPreviewExtensionHostContext *)self->_hostContext invalidateServiceWithCompletionHandler:&__block_literal_global_312];
  v3.receiver = self;
  v3.super_class = (Class)QLRemoteItemViewController;
  [(QLRemoteItemViewController *)&v3 dealloc];
}

- (id)printer
{
  if (!self->_printer) {
    self = 0;
  }
  return self;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(QLRemotePreviewHostViewController *)self->_remoteViewController willMoveToParentViewController:0];
  id v5 = [(QLRemotePreviewHostViewController *)self->_remoteViewController view];
  [v5 removeFromSuperview];

  [(QLRemotePreviewHostViewController *)self->_remoteViewController removeFromParentViewController];
  extension = self->_extension;
  self->_extension = 0;

  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

  hostContext = self->_hostContext;
  self->_hostContext = 0;

  id v9 = [v4 domain];
  if ([v9 isEqualToString:*MEMORY[0x263F83E20]])
  {
    uint64_t v10 = [v4 code];

    if (v10 == 1)
    {
      id v11 = (NSObject **)MEMORY[0x263F62940];
      id v12 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        id v12 = *v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v4;
        _os_log_impl(&dword_217F61000, v12, OS_LOG_TYPE_INFO, "Quick Look extension view service did terminate normally (error: %@). #Remote", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_13;
    }
  }
  else
  {
  }
  id v13 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v14 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v14 = *v13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_217F61000, v14, OS_LOG_TYPE_ERROR, "Quick Look extension view service did terminate with error: %@ #Remote", (uint8_t *)&v16, 0xCu);
  }
  [(QLItemViewController *)self notifyDelegatesDidFailWithError:v4];
  id v15 = [(QLItemViewController *)self delegate];
  [v15 previewItemViewControllerWantsUpdateOverlay:self animated:1];

LABEL_13:
}

- (void)previewControllerDidUpdateTitle:(id)a3
{
  [(QLRemoteItemViewController *)self setTitle:a3];
  id v4 = [(QLItemViewController *)self delegate];
  [v4 previewItemViewControllerDidUpdateTitle:self];
}

- (void)previewControllerDidUpdatePreferredContentSize:(id)a3
{
  [a3 CGSizeValue];
  -[QLRemoteItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  id v4 = [(QLItemViewController *)self delegate];
  [v4 previewItemViewControllerDidUpdatePreferredContentSize:self];
}

- (void)previewControllerWantsFullScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(QLItemViewController *)self delegate];
  [v5 previewItemViewController:self wantsFullScreen:v3];
}

- (BOOL)presenterShouldHandleLoadingView:(id)a3 readyToDisplay:(id)a4
{
  id v6 = (void (**)(void))a4;
  int v7 = objc_msgSend(MEMORY[0x263F628F8], "ql_isPreviewExtensionThatHaveCustomPresentationViewForItem:", a3);
  char v8 = v7;
  if (v6 && v7)
  {
    if (self->_remoteViewController)
    {
      v6[2](v6);
    }
    else
    {
      id v9 = _Block_copy(v6);
      id readyToDisplay = self->_readyToDisplay;
      self->_id readyToDisplay = v9;
    }
  }

  return v8 ^ 1;
}

- (id)fullscreenBackgroundColor
{
  if ([(NSExtension *)self->_extension ql_isPreviewExtensionThatHaveCustomPresentationView])
  {
    BOOL v3 = [MEMORY[0x263F825C8] clearColor];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)QLRemoteItemViewController;
    BOOL v3 = [(QLItemViewController *)&v5 fullscreenBackgroundColor];
  }

  return v3;
}

- (void)numberOfPagesWithSize:(CGSize)a3 completionHandler:(id)a4
{
}

- (void)prepareForDrawingPages:(_NSRange)a3 ofSize:(CGSize)a4
{
}

- (void)pdfDataForPageAtIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
}

- (void)provideCurrentPageAndVisibleRectWithCompletionHandler:(id)a3
{
}

- (void)presentShareSheetWithPopoverTracker:(id)a3 customSharedURL:(id)a4 dismissCompletion:(id)a5
{
  objc_storeStrong((id *)&self->_popoverTracker, a3);
  id v8 = a5;
  id v9 = a4;
  id v10 = [(QLItemViewController *)self delegate];
  [v10 previewItemViewController:self wantsToShowShareSheetWithPopoverTracker:self customSharedURL:v9 dismissCompletion:v8];
}

- (void)dismissQuickLook
{
  id v3 = [(QLItemViewController *)self delegate];
  [v3 previewItemViewControllerWantsToDismissQuickLook:self];
}

- (void)forwardMessageToHostOfCustomViewController:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  QLRunInMainThread();
}

void __91__QLRemoteItemViewController_forwardMessageToHostOfCustomViewController_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 previewItemViewController:*(void *)(a1 + 32) wantsToForwardMessageToHost:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)getFrameWithCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  popoverTracker = self->_popoverTracker;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__QLRemoteItemViewController_getFrameWithCompletionBlock___block_invoke;
  v12[3] = &unk_2642F5E90;
  id v6 = v4;
  id v13 = v6;
  id v7 = [(QLRemotePopoverTracker *)popoverTracker synchronousRemoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__QLRemoteItemViewController_getFrameWithCompletionBlock___block_invoke_2;
  v9[3] = &unk_2642F7238;
  id v8 = v6;
  id v10 = v8;
  objc_copyWeak(&v11, &location);
  [v7 getFrameWithCompletionBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __58__QLRemoteItemViewController_getFrameWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

void __58__QLRemoteItemViewController_getFrameWithCompletionBlock___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = [WeakRetained view];
  id v12 = objc_loadWeakRetained(v10);
  id v13 = [v12 remoteViewController];
  uint64_t v14 = [v13 view];
  objc_msgSend(v11, "convertRect:fromView:", v14, a2, a3, a4, a5);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
}

- (QLRemotePreviewHostViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong(&self->_loadHandler, 0);
  objc_storeStrong(&self->_readyToDisplay, 0);
  objc_storeStrong((id *)&self->_hostViewControllerProxy, 0);
  objc_storeStrong((id *)&self->_popoverTracker, 0);
  objc_storeStrong((id *)&self->_printer, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_hostContext, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end