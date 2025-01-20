@interface QLRemotePreviewCollection
- (BOOL)_addGrabbingViewIfNecessaryWithWidth:(double)a3;
- (BOOL)_isNavigationControllerGrabbingViewForInteractivePopNeeded;
- (BOOL)allowInteractiveTransitions;
- (BOOL)isAvailable;
- (BOOL)isRemote;
- (QLPreviewCollectionHostContext)hostContext;
- (QLRemotePreviewCollection)accessoryViewController;
- (id)accessoryView;
- (id)navigationScreenEdgePanGestureRecognizer;
- (id)request;
- (void)_presentViewControllerForError:(id)a3;
- (void)_resetRemoteConfiguration;
- (void)_updateTouchGrabbingView;
- (void)actionSheetDidDismiss;
- (void)configureAsAccessoryViewContainerForPreviewCollection:(id)a3;
- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6;
- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7;
- (void)documentMenuActionWillBegin;
- (void)getPreviewCollectionUUIDWithCompletionHandler:(id)a3;
- (void)hostApplicationDidBecomeActive;
- (void)hostApplicationDidEnterBackground:(BOOL)a3;
- (void)hostSceneWillDeactivate;
- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4;
- (void)hostViewControllerBackgroundColorChanged:(id)a3;
- (void)invalidateServiceWithCompletionHandler:(id)a3;
- (void)keyCommandWasPerformed:(id)a3;
- (void)keyCommandsWithCompletionHandler:(id)a3;
- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3;
- (void)notifyStateRestorationUserInfo:(id)a3;
- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3;
- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3;
- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3;
- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4;
- (void)requestLockForCurrentItem;
- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5;
- (void)setAccessoryViewController:(id)a3;
- (void)setAllowInteractiveTransitions:(BOOL)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setHostApplicationBundleIdentifier:(id)a3;
- (void)setHostContext:(id)a3;
- (void)setIsAvailable:(BOOL)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setLoadingString:(id)a3;
- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4;
- (void)setRequest:(id)a3;
- (void)setScreenEdgePanWidth:(double)a3;
- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3;
- (void)startTransitionWithSourceViewProvider:(id)a3 transitionController:(id)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7;
- (void)tearDownTransition:(BOOL)a3;
- (void)toolbarButtonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)toolbarButtonsForTraitCollection:(id)a3 withCompletionHandler:(id)a4;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation QLRemotePreviewCollection

- (BOOL)isRemote
{
  return 1;
}

- (id)accessoryView
{
  v2 = [(QLRemotePreviewCollection *)self accessoryViewController];
  v3 = [v2 view];

  return v3;
}

- (void)configureAsAccessoryViewContainerForPreviewCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(QLRemotePreviewCollection *)self hostContext];
  [v5 configureAsAccessoryViewContainerForPreviewCollection:v4];
}

- (void)getPreviewCollectionUUIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLRemotePreviewCollection *)self hostContext];
  [v5 getPreviewCollectionUUIDWithCompletionHandler:v4];
}

- (void)_presentViewControllerForError:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  stateManager = self->_stateManager;
  if (stateManager)
  {
    v6 = [(QLPreviewControllerStateProtocolHostOnly *)stateManager currentItem];

    if (v6)
    {
      v7 = (NSObject **)MEMORY[0x263F62940];
      v8 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        v8 = *v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v4;
        _os_log_impl(&dword_217F61000, v8, OS_LOG_TYPE_ERROR, "View service did terminate with error: %@ #Remote", buf, 0xCu);
      }
      [(QLRemotePreviewCollection *)self setIsAvailable:0];
      [(QLRemotePreviewCollection *)self _resetRemoteConfiguration];
      v9 = objc_opt_new();
      v10 = [(QLRemotePreviewCollection *)self childViewControllers];
      v11 = (void *)[v10 copy];
      [v11 enumerateObjectsUsingBlock:&__block_literal_global_334];

      v12 = [(QLPreviewControllerStateProtocolHostOnly *)self->_stateManager currentItem];
      v13 = [(QLPreviewControllerStateProtocolHostOnly *)self->_stateManager currentItem];
      v14 = [v13 createPreviewContext];
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __60__QLRemotePreviewCollection__presentViewControllerForError___block_invoke_2;
      v21 = &unk_2642F5F00;
      v22 = self;
      id v15 = v9;
      id v23 = v15;
      [v15 loadPreviewControllerIfNeededWithContents:v12 context:v14 completionHandler:&v18];

      v16 = objc_msgSend(v4, "domain", v18, v19, v20, v21, v22);
      if ([v16 isEqualToString:@"com.apple.quicklook.previewcollection"])
      {
        uint64_t v17 = [v4 code];

        if (v17 == 1) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      [(QLPreviewControllerStateProtocolHostOnly *)self->_stateManager remoteViewControllerWasInvalidated];
LABEL_12:
    }
  }
}

void __60__QLRemotePreviewCollection__presentViewControllerForError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 willMoveToParentViewController:0];
  v2 = [v3 view];
  [v2 removeFromSuperview];

  [v3 removeFromParentViewController];
}

void __60__QLRemotePreviewCollection__presentViewControllerForError___block_invoke_2(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) addChildViewController:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) view];
  id v3 = [*(id *)(a1 + 40) view];
  [v2 addSubview:v3];

  [*(id *)(a1 + 40) didMoveToParentViewController:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [*(id *)(a1 + 32) view];
  v6 = (void *)MEMORY[0x263F08938];
  uint64_t v17 = @"error";
  v7 = [*(id *)(a1 + 40) view];
  v18[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v9 = [v6 constraintsWithVisualFormat:@"H:|[error]|" options:0 metrics:0 views:v8];
  [v5 addConstraints:v9];

  v10 = [*(id *)(a1 + 32) view];
  v11 = (void *)MEMORY[0x263F08938];
  id v15 = @"error";
  v12 = [*(id *)(a1 + 40) view];
  v16 = v12;
  v13 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v14 = [v11 constraintsWithVisualFormat:@"V:|[error]|" options:0 metrics:0 views:v13];
  [v10 addConstraints:v14];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(QLRemotePreviewCollection *)self _resetRemoteConfiguration];
  id v5 = [v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x263F83E20]])
  {
    uint64_t v6 = [v4 code];

    if (v6 == 1)
    {
      v7 = (NSObject **)MEMORY[0x263F62940];
      v8 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        v8 = *v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = v8;
        v10 = [(QLRemotePreviewCollection *)self request];
        int v16 = 138412546;
        id v17 = v4;
        __int16 v18 = 2112;
        uint64_t v19 = v10;
        _os_log_impl(&dword_217F61000, v9, OS_LOG_TYPE_INFO, "Preview collection view service did terminate normally (error: %@). Cancelling request: %@ #Remote", (uint8_t *)&v16, 0x16u);
      }
      v11 = [(QLRemotePreviewCollection *)self request];

      if (v11)
      {
        v12 = +[QLPreviewCollection quickLookExtension];
        v13 = [(QLRemotePreviewCollection *)self request];
        [v12 cancelExtensionRequestWithIdentifier:v13];
      }
      goto LABEL_15;
    }
  }
  else
  {
  }
  v14 = (NSObject **)MEMORY[0x263F62940];
  id v15 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_217F61000, v15, OS_LOG_TYPE_ERROR, "Preview collection viewServiceDidTerminateWithError: %@ #Remote", (uint8_t *)&v16, 0xCu);
  }
  [(QLRemotePreviewCollection *)self _presentViewControllerForError:v4];
LABEL_15:
}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(QLRemotePreviewCollection *)self setIsAvailable:0];
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  uint64_t v6 = [(QLRemotePreviewCollection *)self hostContext];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __90__QLRemotePreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke;
  v16[3] = &unk_2642F5430;
  v7 = v5;
  id v17 = v7;
  [v6 preparePreviewCollectionForInvalidationWithCompletionHandler:v16];

  dispatch_group_enter(v7);
  v8 = [(QLRemotePreviewCollection *)self accessoryViewController];
  v9 = [v8 hostContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__QLRemotePreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_2642F5430;
  id v15 = v7;
  v10 = v7;
  [v9 preparePreviewCollectionForInvalidationWithCompletionHandler:v14];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__QLRemotePreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_3;
  block[3] = &unk_2642F5F28;
  id v13 = v4;
  id v11 = v4;
  dispatch_group_notify(v10, MEMORY[0x263EF83A0], block);
}

void __90__QLRemotePreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke(uint64_t a1)
{
}

void __90__QLRemotePreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
}

uint64_t __90__QLRemotePreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLRemotePreviewCollection *)self hostContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__QLRemotePreviewCollection_invalidateServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_2642F5EB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 invalidateServiceWithCompletionHandler:v7];
}

void __68__QLRemotePreviewCollection_invalidateServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) accessoryViewController];
  v2 = [v3 hostContext];
  [v2 invalidateServiceWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_resetRemoteConfiguration
{
  id v2 = [MEMORY[0x263F629A8] sharedInstance];
  [v2 setRemoteObserver:0];
}

- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4
{
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(QLPreviewCollectionHostContext *)self->_hostContext setHostApplicationBundleIdentifier:v4];
  }
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6
{
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7
{
  BOOL v7 = a7;
  id v15 = a5;
  id v12 = a6;
  objc_storeStrong((id *)&self->_stateManager, a6);
  hostContext = self->_hostContext;
  if (hostContext)
  {
    [(QLPreviewCollectionHostContext *)hostContext configureWithNumberOfItems:a3 currentPreviewItemIndex:a4 itemProvider:v15 stateManager:v12 fullScreen:v7];
  }
  else
  {
    v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.quicklook.previewcollection" code:1 userInfo:0];
    [(QLRemotePreviewCollection *)self _presentViewControllerForError:v14];
  }
}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)hostSceneWillDeactivate
{
}

- (void)hostApplicationDidEnterBackground:(BOOL)a3
{
}

- (void)hostApplicationDidBecomeActive
{
}

- (void)toolbarButtonsForTraitCollection:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)toolbarButtonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  v9 = (NSObject **)MEMORY[0x263F62940];
  v10 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = NSStringFromSelector(a2);
    int v13 = 138412546;
    v14 = v12;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_INFO, "Calling %@ on the service (%@) #Remote", (uint8_t *)&v13, 0x16u);
  }
  if (self->_isAvailable)
  {
    [(QLPreviewCollectionHostContext *)self->_hostContext toolbarButtonPressedWithIdentifier:v7 completionHandler:v8];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4
{
}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
}

- (void)actionSheetDidDismiss
{
}

- (void)documentMenuActionWillBegin
{
}

- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3
{
}

- (void)requestLockForCurrentItem
{
}

- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void)keyCommandsWithCompletionHandler:(id)a3
{
}

- (void)keyCommandWasPerformed:(id)a3
{
}

- (void)startTransitionWithSourceViewProvider:(id)a3 transitionController:(id)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7
{
}

- (void)tearDownTransition:(BOOL)a3
{
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
}

- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3
{
}

- (void)notifyStateRestorationUserInfo:(id)a3
{
}

- (void)setAllowInteractiveTransitions:(BOOL)a3
{
}

- (void)setLoadingString:(id)a3
{
}

- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3
{
}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
}

- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)setIsContentManaged:(BOOL)a3
{
}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
}

- (void)setScreenEdgePanWidth:(double)a3
{
  self->_edgeNavigationGestureWidth = a3;
  [(QLRemotePreviewCollection *)self _updateTouchGrabbingView];
  if (objc_opt_respondsToSelector())
  {
    hostContext = self->_hostContext;
    [(QLPreviewCollectionHostContext *)hostContext setScreenEdgePanWidth:a3];
  }
}

- (void)_updateTouchGrabbingView
{
  if (self->_edgeNavigationGestureWidth >= 0.0
    && [(QLRemotePreviewCollection *)self _isNavigationControllerGrabbingViewForInteractivePopNeeded])
  {
    id v3 = [(QLRemotePreviewCollection *)self navigationScreenEdgePanGestureRecognizer];
    [v3 _edgeRegionSize];
    double v5 = v4;

    double edgeNavigationGestureWidth = self->_edgeNavigationGestureWidth;
    if (edgeNavigationGestureWidth <= 0.0)
    {
      id v7 = self;
      double edgeNavigationGestureWidth = v5;
    }
    else
    {
      if (edgeNavigationGestureWidth >= v5) {
        double edgeNavigationGestureWidth = v5;
      }
      id v7 = self;
    }
    [(QLRemotePreviewCollection *)v7 _addGrabbingViewIfNecessaryWithWidth:edgeNavigationGestureWidth];
  }
  else
  {
    touchGrabbingView = self->_touchGrabbingView;
    if (touchGrabbingView)
    {
      [(UIView *)touchGrabbingView removeFromSuperview];
      v9 = self->_touchGrabbingView;
      self->_touchGrabbingView = 0;
    }
  }
}

- (BOOL)_isNavigationControllerGrabbingViewForInteractivePopNeeded
{
  id v3 = [(QLRemotePreviewCollection *)self navigationController];
  double v4 = [v3 viewControllers];
  double v5 = [v4 objectAtIndex:0];

  id v6 = self;
  id v7 = v6;
  for (BOOL i = v6 == 0; v7 && v7 != v5; BOOL i = v7 == 0)
  {
    v9 = v7;
    id v7 = [v7 parentViewController];
  }
  if (v3) {
    BOOL v10 = i;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_addGrabbingViewIfNecessaryWithWidth:(double)a3
{
  double v5 = [(QLRemotePreviewCollection *)self view];
  [v5 bounds];
  double v7 = v6;

  touchGrabbingView = self->_touchGrabbingView;
  if (touchGrabbingView)
  {
    [(UIView *)touchGrabbingView frame];
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.width = a3;
    v16.size.height = v7;
    if (!CGRectEqualToRect(v15, v16)) {
      -[UIView setFrame:](self->_touchGrabbingView, "setFrame:", 0.0, 0.0, a3, v7);
    }
    return 0;
  }
  if (a3 <= 0.0) {
    return 0;
  }
  v9 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, a3, v7);
  BOOL v10 = self->_touchGrabbingView;
  self->_touchGrabbingView = v9;

  id v11 = [(UIView *)self->_touchGrabbingView layer];
  BOOL v12 = 1;
  [v11 setHitTestsAsOpaque:1];

  [(UIView *)self->_touchGrabbingView setUserInteractionEnabled:0];
  [(UIView *)self->_touchGrabbingView setAutoresizingMask:20];
  int v13 = [(QLRemotePreviewCollection *)self view];
  [v13 addSubview:self->_touchGrabbingView];

  return v12;
}

- (id)navigationScreenEdgePanGestureRecognizer
{
  id v2 = [(QLRemotePreviewCollection *)self navigationController];
  id v3 = [v2 _builtinInteractionController];

  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v4 = [v3 screenEdgePanGestureRecognizer];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (id)request
{
  return objc_getProperty(self, a2, 1520, 1);
}

- (void)setRequest:(id)a3
{
}

- (QLRemotePreviewCollection)accessoryViewController
{
  return (QLRemotePreviewCollection *)objc_getProperty(self, a2, 1528, 1);
}

- (void)setAccessoryViewController:(id)a3
{
}

- (QLPreviewCollectionHostContext)hostContext
{
  return (QLPreviewCollectionHostContext *)objc_getProperty(self, a2, 1536, 1);
}

- (void)setHostContext:(id)a3
{
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (BOOL)allowInteractiveTransitions
{
  return self->_allowInteractiveTransitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostContext, 0);
  objc_storeStrong((id *)&self->_accessoryViewController, 0);
  objc_storeStrong(&self->_request, 0);
  objc_storeStrong((id *)&self->_touchGrabbingView, 0);

  objc_storeStrong((id *)&self->_stateManager, 0);
}

@end