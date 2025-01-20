@interface CKHandwritingPresentationController
- (BOOL)actualVisibility;
- (BOOL)foregrounded;
- (BOOL)isHandwritingLandscape;
- (BOOL)requestedVisibility;
- (BOOL)requestedVisibilityShouldBeAnimated;
- (BOOL)suppressAppearanceCallbacksBecauseOfFirstInitialization;
- (CKBrowserItemPayload)cachedPluginPayload;
- (CKBrowserItemPayload)pluginPayload;
- (CKDeviceOrientationManager)deviceOrientationManager;
- (CKHandwritingBrowserViewControllerProtocol)browserViewController;
- (CKHandwritingPresentationController)init;
- (CKHandwritingPresentationControllerDelegate)delegate;
- (CKHandwritingViewControllerSendDelegate)cachedSendDelegate;
- (CKHandwritingWindow)handwritingWindow;
- (CKScheduledUpdater)animationScheduledUpdater;
- (NSString)pluginBundleID;
- (int64_t)initialInterfaceOrientation;
- (void)_doInitialization;
- (void)_flushHandwritingWindowCacheIfNeeded;
- (void)_handleApplicationDidEnterBackground:(id)a3;
- (void)_handleApplicationWillEnterForeground:(id)a3;
- (void)_loadCachedPayloadIntoBrowser;
- (void)_updateVisibilityState;
- (void)dealloc;
- (void)setActualVisibility:(BOOL)a3;
- (void)setAnimationScheduledUpdater:(id)a3;
- (void)setBrowserViewController:(id)a3;
- (void)setCachedPluginPayload:(id)a3;
- (void)setCachedSendDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceOrientationManager:(id)a3;
- (void)setForegrounded:(BOOL)a3;
- (void)setHandwritingWindow:(id)a3;
- (void)setInitialInterfaceOrientation:(int64_t)a3;
- (void)setPluginPayload:(id)a3;
- (void)setRequestedVisibility:(BOOL)a3;
- (void)setRequestedVisibilityShouldBeAnimated:(BOOL)a3;
- (void)setSendDelegate:(id)a3;
- (void)setSuppressAppearanceCallbacksBecauseOfFirstInitialization:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CKHandwritingPresentationController

- (BOOL)isHandwritingLandscape
{
  v3 = [(CKHandwritingPresentationController *)self handwritingWindow];
  if (v3)
  {
    v4 = [(CKHandwritingPresentationController *)self handwritingWindow];
    int v5 = [v4 isHidden] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_doInitialization
{
  v3 = [(CKHandwritingPresentationController *)self handwritingWindow];

  if (!v3)
  {
    v4 = [CKHandwritingWindow alloc];
    int v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 bounds];
    double v7 = v6;
    v8 = [MEMORY[0x1E4F42D90] mainScreen];
    [v8 bounds];
    v9 = -[CKHandwritingWindow initWithFrame:](v4, "initWithFrame:", 0.0, 0.0, v7);
    [(CKHandwritingPresentationController *)self setHandwritingWindow:v9];

    v10 = [(CKHandwritingPresentationController *)self handwritingWindow];
    [v10 setLevel:1.79769313e308];

    v11 = [(CKHandwritingPresentationController *)self handwritingWindow];
    [v11 _setWindowControlsStatusBarOrientation:0];

    v12 = [MEMORY[0x1E4F42D90] mainScreen];
    v13 = [(CKHandwritingPresentationController *)self handwritingWindow];
    [v13 setScreen:v12];

    v14 = [(CKHandwritingPresentationController *)self handwritingWindow];
    v15 = +[CKUIBehavior sharedBehaviors];
    [v15 presentationControllerWindowLevel];
    objc_msgSend(v14, "setWindowLevel:");

    v16 = [(CKHandwritingPresentationController *)self handwritingWindow];
    v17 = [MEMORY[0x1E4F43058] keyWindow];
    v18 = [v17 windowScene];
    [v16 setWindowScene:v18];
  }
  v19 = [(CKHandwritingPresentationController *)self browserViewController];

  if (!v19)
  {
    v20 = [MEMORY[0x1E4F6BC18] sharedInstance];
    v21 = [(CKHandwritingPresentationController *)self pluginBundleID];
    id v33 = [v20 balloonPluginForBundleID:v21];

    id v22 = objc_alloc((Class)[v33 browserClass]);
    v23 = [(CKHandwritingPresentationController *)self browserViewController];
    char v24 = objc_opt_respondsToSelector();

    if (v24) {
      uint64_t v25 = [v22 initWithBalloonPlugin:v33 dataSource:0];
    }
    else {
      uint64_t v25 = [v22 initWithBalloonPlugin:v33];
    }
    v26 = (void *)v25;
    [(CKHandwritingPresentationController *)self setBrowserViewController:v25];
    v27 = [(CKHandwritingPresentationController *)self handwritingWindow];
    v28 = [v27 rootViewController];
    v29 = [(CKHandwritingPresentationController *)self browserViewController];

    if (v28 != v29)
    {
      v30 = [(CKHandwritingPresentationController *)self browserViewController];
      v31 = [(CKHandwritingPresentationController *)self handwritingWindow];
      [v31 setRootViewController:v30];

      [(CKHandwritingPresentationController *)self setSuppressAppearanceCallbacksBecauseOfFirstInitialization:1];
    }
    [(CKHandwritingPresentationController *)self _loadCachedPayloadIntoBrowser];
    v32 = [(CKHandwritingPresentationController *)self cachedSendDelegate];
    [v26 setSendDelegate:v32];
  }
}

- (BOOL)requestedVisibilityShouldBeAnimated
{
  return self->_requestedVisibilityShouldBeAnimated;
}

- (void)_updateVisibilityState
{
  BOOL v4 = [(CKHandwritingPresentationController *)self requestedVisibility];
  if (v4 != [(CKHandwritingPresentationController *)self actualVisibility])
  {
    BOOL v5 = [(CKHandwritingPresentationController *)self requestedVisibility];
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x2020000000;
    BOOL v58 = 0;
    BOOL v58 = [(CKHandwritingPresentationController *)self requestedVisibilityShouldBeAnimated];
    if (!v5)
    {
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x3032000000;
      v47 = __Block_byref_object_copy__62;
      v48 = __Block_byref_object_dispose__62;
      id v49 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_71;
      aBlock[3] = &unk_1E562B170;
      aBlock[4] = self;
      aBlock[5] = &v55;
      id v49 = _Block_copy(aBlock);
      v19 = [(CKHandwritingPresentationController *)self browserViewController];
      [v19 viewWillDisappear:*((unsigned __int8 *)v56 + 24)];

      v20 = [(CKHandwritingPresentationController *)self delegate];
      int v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        id v22 = [(CKHandwritingPresentationController *)self delegate];
        [v22 handwritingPresentationControllerWillHideHandwriting:self];
      }
      if (*((unsigned char *)v56 + 24))
      {
        v23 = [(CKHandwritingPresentationController *)self animationScheduledUpdater];
        [v23 beginHoldingUpdatesForKey:@"UpdatingVisibility"];

        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_2_76;
        v42[3] = &unk_1E5620C40;
        v42[4] = self;
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_3;
        v41[3] = &unk_1E562B198;
        v41[4] = self;
        v41[5] = &v44;
        [MEMORY[0x1E4F42FF0] animateWithDuration:v42 animations:v41 completion:0.25];
      }
      else
      {
        (*(void (**)(void))(v45[5] + 16))();
      }
      _Block_object_dispose(&v44, 8);

      goto LABEL_28;
    }
    double v6 = [MEMORY[0x1E4F42C68] sharedInstance];
    [v6 disableInterfaceAutorotation:1];

    double v7 = [(CKHandwritingPresentationController *)self deviceOrientationManager];

    if (!v7)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:a2, self, @"CKHandwritingPresentationController.m", 161, @"Please set a device orientation manager on %@ before setting it to be visible", self object file lineNumber description];
    }
    v8 = [(CKHandwritingPresentationController *)self deviceOrientationManager];
    [v8 beginListeningForOrientationEventsWithKey:@"HandwritingVisible"];

    [(CKHandwritingPresentationController *)self _doInitialization];
    v9 = [(CKHandwritingPresentationController *)self handwritingWindow];
    [v9 setHidden:0];

    if (![(CKHandwritingPresentationController *)self suppressAppearanceCallbacksBecauseOfFirstInitialization])
    {
      v10 = [(CKHandwritingPresentationController *)self browserViewController];
      [v10 viewWillAppear:*((unsigned __int8 *)v56 + 24)];
    }
    v11 = [(CKHandwritingPresentationController *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v13 = [(CKHandwritingPresentationController *)self delegate];
      [v13 handwritingPresentationControllerWillShowHandwriting:self];
    }
    v14 = [(CKHandwritingPresentationController *)self handwritingWindow];
    [v14 setEatOrientationEvents:0];

    if ([(CKHandwritingPresentationController *)self initialInterfaceOrientation])
    {
      int64_t v15 = [(CKHandwritingPresentationController *)self initialInterfaceOrientation];
      if (v15 == 3)
      {
        char v24 = [MEMORY[0x1E4F42948] currentDevice];
        [v24 setOrientation:3];

        uint64_t v25 = [(CKHandwritingPresentationController *)self handwritingWindow];
        [v25 _updateInterfaceOrientationFromDeviceOrientation:0];

        v18 = [(CKHandwritingPresentationController *)self handwritingWindow];
        [v18 setEatOrientationEvents:1];
      }
      else
      {
        if (v15 != 4) {
          goto LABEL_21;
        }
        v16 = [MEMORY[0x1E4F42948] currentDevice];
        [v16 setOrientation:4];

        v17 = [(CKHandwritingPresentationController *)self handwritingWindow];
        [v17 _updateInterfaceOrientationFromDeviceOrientation:0];

        v18 = [(CKHandwritingPresentationController *)self handwritingWindow];
        [v18 setEatOrientationEvents:1];
      }
    }
LABEL_21:
    if (*((unsigned char *)v56 + 24))
    {
      v26 = [(CKHandwritingPresentationController *)self animationScheduledUpdater];
      [v26 beginHoldingUpdatesForKey:@"UpdatingVisibility"];

      v27 = [(CKHandwritingPresentationController *)self browserViewController];
      v28 = [v27 view];
      [v28 setAlpha:0.0];

      CGAffineTransformMakeScale(&v54, 0.800000012, 0.800000012);
      v29 = [(CKHandwritingPresentationController *)self browserViewController];
      v30 = [v29 view];
      CGAffineTransform v53 = v54;
      [v30 setTransform:&v53];

      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke;
      v52[3] = &unk_1E5620C40;
      v52[4] = self;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_2;
      v51[3] = &unk_1E5620BF0;
      v51[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v52 animations:v51 completion:0.25];
    }
    else
    {
      v31 = [(CKHandwritingPresentationController *)self browserViewController];
      v32 = [v31 view];
      [v32 setAlpha:1.0];

      id v33 = [(CKHandwritingPresentationController *)self browserViewController];
      v34 = [v33 view];
      long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v50[0] = *MEMORY[0x1E4F1DAB8];
      v50[1] = v35;
      v50[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v34 setTransform:v50];

      [(CKHandwritingPresentationController *)self setActualVisibility:1];
      if ([(CKHandwritingPresentationController *)self suppressAppearanceCallbacksBecauseOfFirstInitialization])
      {
        [(CKHandwritingPresentationController *)self setSuppressAppearanceCallbacksBecauseOfFirstInitialization:0];
      }
      else
      {
        v36 = [(CKHandwritingPresentationController *)self browserViewController];
        [v36 viewDidAppear:0];
      }
      v37 = [(CKHandwritingPresentationController *)self delegate];
      char v38 = objc_opt_respondsToSelector();

      if (v38)
      {
        v39 = [(CKHandwritingPresentationController *)self delegate];
        [v39 handwritingPresentationControllerDidShowHandwriting:self];
      }
    }
LABEL_28:
    _Block_object_dispose(&v55, 8);
  }
}

void __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setActualVisibility:1];
  int v2 = [*(id *)(a1 + 32) suppressAppearanceCallbacksBecauseOfFirstInitialization];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setSuppressAppearanceCallbacksBecauseOfFirstInitialization:0];
  }
  else
  {
    BOOL v4 = [v3 browserViewController];
    [v4 viewDidAppear:1];
  }
  BOOL v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [*(id *)(a1 + 32) delegate];
    [v7 handwritingPresentationControllerDidShowHandwriting:*(void *)(a1 + 32)];
  }
  id v8 = [*(id *)(a1 + 32) animationScheduledUpdater];
  [v8 endHoldingUpdatesForKey:@"UpdatingVisibility"];
}

- (void)_handleApplicationDidEnterBackground:(id)a3
{
  [(CKHandwritingPresentationController *)self setForegrounded:0];

  [(CKHandwritingPresentationController *)self _flushHandwritingWindowCacheIfNeeded];
}

- (CKHandwritingPresentationController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKHandwritingPresentationController;
  int v2 = [(CKHandwritingPresentationController *)&v7 init];
  if (v2)
  {
    v3 = [[CKScheduledUpdater alloc] initWithTarget:v2 action:sel__updateVisibilityState];
    [(CKHandwritingPresentationController *)v2 setAnimationScheduledUpdater:v3];

    BOOL v4 = [(CKHandwritingPresentationController *)v2 animationScheduledUpdater];
    [v4 setUpdateSynchronouslyIfPossible:1];

    [(CKHandwritingPresentationController *)v2 setForegrounded:1];
    BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__handleApplicationWillEnterForeground_ name:*MEMORY[0x1E4F43708] object:0];
    [v5 addObserver:v2 selector:sel__handleApplicationDidEnterBackground_ name:*MEMORY[0x1E4F43660] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  BOOL v4 = [(CKHandwritingPresentationController *)self animationScheduledUpdater];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)CKHandwritingPresentationController;
  [(CKHandwritingPresentationController *)&v5 dealloc];
}

- (void)setSendDelegate:(id)a3
{
  id v4 = a3;
  [(CKHandwritingPresentationController *)self setCachedSendDelegate:v4];
  id v5 = [(CKHandwritingPresentationController *)self browserViewController];
  [v5 setSendDelegate:v4];
}

- (void)setPluginPayload:(id)a3
{
  [(CKHandwritingPresentationController *)self setCachedPluginPayload:a3];

  [(CKHandwritingPresentationController *)self _loadCachedPayloadIntoBrowser];
}

- (CKBrowserItemPayload)pluginPayload
{
  v3 = [(CKHandwritingPresentationController *)self browserViewController];

  if (v3)
  {
    id v4 = [(CKHandwritingPresentationController *)self browserViewController];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      char v6 = [(CKHandwritingPresentationController *)self browserViewController];
      if ([v6 supportsResumablePayload])
      {
        objc_super v7 = [v6 resumablePayload];
      }
      else
      {
        objc_super v7 = 0;
      }
    }
    else
    {
      objc_super v7 = 0;
    }
    [(CKHandwritingPresentationController *)self setCachedPluginPayload:v7];
  }
  else
  {
    objc_super v7 = [(CKHandwritingPresentationController *)self cachedPluginPayload];
  }

  return (CKBrowserItemPayload *)v7;
}

- (void)setVisible:(BOOL)a3
{
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CKHandwritingPresentationController *)self requestedVisibility] != a3)
  {
    [(CKHandwritingPresentationController *)self setRequestedVisibility:v5];
    [(CKHandwritingPresentationController *)self setRequestedVisibilityShouldBeAnimated:v4];
    id v7 = [(CKHandwritingPresentationController *)self animationScheduledUpdater];
    [v7 setNeedsUpdate];
  }
}

- (NSString)pluginBundleID
{
  return (NSString *)(id)*MEMORY[0x1E4F6CBD8];
}

- (void)_handleApplicationWillEnterForeground:(id)a3
{
}

void __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) browserViewController];
  v3 = [v2 view];
  [v3 setAlpha:1.0];

  BOOL v4 = [*(id *)(a1 + 32) browserViewController];
  BOOL v5 = [v4 view];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v7[0] = *MEMORY[0x1E4F1DAB8];
  v7[1] = v6;
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v5 setTransform:v7];
}

uint64_t __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_71(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) handwritingWindow];
  [v2 setHidden:1];

  v3 = [*(id *)(a1 + 32) browserViewController];
  [v3 viewDidDisappear:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

  BOOL v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    long long v6 = [*(id *)(a1 + 32) delegate];
    [v6 handwritingPresentationControllerDidHideHandwriting:*(void *)(a1 + 32)];
  }
  id v7 = [*(id *)(a1 + 32) deviceOrientationManager];
  [v7 endListeningForOrientationEventsWithKey:@"HandwritingVisible"];

  [*(id *)(a1 + 32) setActualVisibility:0];
  id v8 = [MEMORY[0x1E4F42C68] sharedInstance];
  [v8 disableInterfaceAutorotation:0];

  v9 = *(void **)(a1 + 32);

  return [v9 _flushHandwritingWindowCacheIfNeeded];
}

void __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_2_76(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) browserViewController];
  v3 = [v2 view];
  [v3 setAlpha:0.0];

  CGAffineTransformMakeScale(&v7, 0.800000012, 0.800000012);
  BOOL v4 = [*(id *)(a1 + 32) browserViewController];
  char v5 = [v4 view];
  CGAffineTransform v6 = v7;
  [v5 setTransform:&v6];
}

void __61__CKHandwritingPresentationController__updateVisibilityState__block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) animationScheduledUpdater];
  [v2 endHoldingUpdatesForKey:@"UpdatingVisibility"];
}

- (void)_flushHandwritingWindowCacheIfNeeded
{
  if (![(CKHandwritingPresentationController *)self foregrounded]
    && ![(CKHandwritingPresentationController *)self actualVisibility]
    && ![(CKHandwritingPresentationController *)self requestedVisibility])
  {
    v3 = [(CKHandwritingPresentationController *)self browserViewController];

    if (v3)
    {
      [(CKHandwritingPresentationController *)self setBrowserViewController:0];
      BOOL v4 = [(CKHandwritingPresentationController *)self handwritingWindow];
      [v4 setRootViewController:0];
    }
    char v5 = [(CKHandwritingPresentationController *)self handwritingWindow];

    if (v5)
    {
      [(CKHandwritingPresentationController *)self setHandwritingWindow:0];
    }
  }
}

- (void)_loadCachedPayloadIntoBrowser
{
  v3 = [(CKHandwritingPresentationController *)self browserViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(CKHandwritingPresentationController *)self browserViewController];
    if ([v6 supportsResumablePayload])
    {
      char v5 = [(CKHandwritingPresentationController *)self cachedPluginPayload];
      [v6 setResumablePayload:v5];
    }
  }
}

- (CKHandwritingPresentationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKHandwritingPresentationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKDeviceOrientationManager)deviceOrientationManager
{
  return self->_deviceOrientationManager;
}

- (void)setDeviceOrientationManager:(id)a3
{
}

- (int64_t)initialInterfaceOrientation
{
  return self->_initialInterfaceOrientation;
}

- (void)setInitialInterfaceOrientation:(int64_t)a3
{
  self->_initialInterfaceOrientation = a3;
}

- (CKHandwritingWindow)handwritingWindow
{
  return self->_handwritingWindow;
}

- (void)setHandwritingWindow:(id)a3
{
}

- (CKHandwritingBrowserViewControllerProtocol)browserViewController
{
  return self->_browserViewController;
}

- (void)setBrowserViewController:(id)a3
{
}

- (CKScheduledUpdater)animationScheduledUpdater
{
  return self->_animationScheduledUpdater;
}

- (void)setAnimationScheduledUpdater:(id)a3
{
}

- (BOOL)requestedVisibility
{
  return self->_requestedVisibility;
}

- (void)setRequestedVisibility:(BOOL)a3
{
  self->_requestedVisibility = a3;
}

- (BOOL)actualVisibility
{
  return self->_actualVisibility;
}

- (void)setActualVisibility:(BOOL)a3
{
  self->_actualVisibility = a3;
}

- (void)setRequestedVisibilityShouldBeAnimated:(BOOL)a3
{
  self->_requestedVisibilityShouldBeAnimated = a3;
}

- (CKHandwritingViewControllerSendDelegate)cachedSendDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedSendDelegate);

  return (CKHandwritingViewControllerSendDelegate *)WeakRetained;
}

- (void)setCachedSendDelegate:(id)a3
{
}

- (CKBrowserItemPayload)cachedPluginPayload
{
  return self->_cachedPluginPayload;
}

- (void)setCachedPluginPayload:(id)a3
{
}

- (BOOL)suppressAppearanceCallbacksBecauseOfFirstInitialization
{
  return self->_suppressAppearanceCallbacksBecauseOfFirstInitialization;
}

- (void)setSuppressAppearanceCallbacksBecauseOfFirstInitialization:(BOOL)a3
{
  self->_suppressAppearanceCallbacksBecauseOfFirstInitialization = a3;
}

- (BOOL)foregrounded
{
  return self->_foregrounded;
}

- (void)setForegrounded:(BOOL)a3
{
  self->_foregrounded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPluginPayload, 0);
  objc_destroyWeak((id *)&self->_cachedSendDelegate);
  objc_storeStrong((id *)&self->_animationScheduledUpdater, 0);
  objc_storeStrong((id *)&self->_browserViewController, 0);
  objc_storeStrong((id *)&self->_handwritingWindow, 0);
  objc_storeStrong((id *)&self->_deviceOrientationManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end