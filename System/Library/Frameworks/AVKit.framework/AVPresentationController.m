@interface AVPresentationController
- (AVObservationController)observationController;
- (AVPresentationContainerView)presentedPresentationContainerView;
- (AVPresentationContext)context;
- (AVPresentationController)initWithPresentationController:(id)a3 presentedViewController:(id)a4 presentingViewController:(id)a5 withConfiguration:(id)a6;
- (BOOL)dismissed;
- (BOOL)dismissing;
- (BOOL)presented;
- (BOOL)presenting;
- (BOOL)shouldPresentInFullscreen;
- (BOOL)shouldRemovePresentersView;
- (UIView)containerView;
- (UIViewController)presentedViewController;
- (UIViewController)presentingViewController;
- (UIWindow)presentationWindowForDisablingAutorotation;
- (id)presentedView;
- (void)_ensureOrientation:(int64_t)a3 enablingMixedOrientations:(BOOL)a4;
- (void)_observeSceneDidBecomeActiveForRestoringRotatability;
- (void)_prepareDismissingTransitionContext;
- (void)containerViewWillLayoutSubviews;
- (void)dealloc;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setPresentationWindowForDisablingAutorotation:(id)a3;
@end

@implementation AVPresentationController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationWindowForDisablingAutorotation);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_presentedPresentationContainerView);

  objc_destroyWeak((id *)&self->_presentationController);
}

- (void)setPresentationWindowForDisablingAutorotation:(id)a3
{
}

- (UIWindow)presentationWindowForDisablingAutorotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationWindowForDisablingAutorotation);

  return (UIWindow *)WeakRetained;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (AVPresentationContext)context
{
  return self->_context;
}

- (void)_observeSceneDidBecomeActiveForRestoringRotatability
{
  id v2 = [(AVPresentationController *)self observationController];
  [v2 startObservingNotificationForName:*MEMORY[0x1E4FB2E80] object:0 notificationCenter:0 observationHandler:&__block_literal_global_9811];
}

void __80__AVPresentationController__observeSceneDidBecomeActiveForRestoringRotatability__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [a4 object];
  v7 = [v5 context];
  v8 = [v7 presentedViewController];
  v9 = [v8 view];
  v10 = [v9 window];
  v11 = [v10 windowScene];

  if (v6 == v11)
  {
    v12 = _AVLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v5 presentationWindowForDisablingAutorotation];
      int v19 = 136315394;
      v20 = "-[AVPresentationController _observeSceneDidBecomeActiveForRestoringRotatability]_block_invoke";
      __int16 v21 = 2048;
      v22 = v13;
      _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s Enabling autorotation for window: %p", (uint8_t *)&v19, 0x16u);
    }
    [v5 setPresentationWindowForDisablingAutorotation:0];
    v14 = [v5 context];
    v15 = [v14 presentationWindow];
    v16 = [v15 windowScene];
    objc_msgSend(v5, "_ensureOrientation:enablingMixedOrientations:", objc_msgSend(v16, "interfaceOrientation"), 1);

    v17 = [v5 context];
    v18 = [v17 presentedViewController];
    [v18 setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = [(AVPresentationController *)self context];
  v6 = [v5 dismissingTransition];
  if ([v6 wasCancelledWithInactiveScene])
  {
    v7 = [(AVPresentationController *)self context];
    v8 = [v7 presentedViewController];
    v9 = [v8 view];
    v10 = [v9 window];
    v11 = [v10 windowScene];
    BOOL v12 = [v11 activationState] != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  v13 = _AVLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "NO";
    *(_DWORD *)buf = 136315650;
    v27 = "-[AVPresentationController dismissalTransitionDidEnd:]";
    v29 = "completed";
    __int16 v28 = 2080;
    if (v3) {
      v14 = "YES";
    }
    __int16 v30 = 2080;
    v31 = v14;
    _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

  v15 = [(AVPresentationController *)self context];
  v16 = [v15 dismissingTransition];
  int v17 = [v16 hasAVKitAnimator];

  if (v17)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __54__AVPresentationController_dismissalTransitionDidEnd___block_invoke;
    v24[3] = &unk_1E5FC33E0;
    v24[4] = self;
    BOOL v25 = v3;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v24];
  }
  else if (!v3)
  {
    v18 = [(AVPresentationController *)self context];
    [v18 setDismissingTransition:0];
  }
  if (v12)
  {
    int v19 = [(AVPresentationController *)self presentationWindowForDisablingAutorotation];

    if (!v19)
    {
      v20 = [(AVPresentationController *)self context];
      __int16 v21 = [v20 presentationWindow];
      [(AVPresentationController *)self setPresentationWindowForDisablingAutorotation:v21];

      v22 = _AVLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [(AVPresentationController *)self presentationWindowForDisablingAutorotation];
        *(_DWORD *)buf = 136315394;
        v27 = "-[AVPresentationController dismissalTransitionDidEnd:]";
        __int16 v28 = 2048;
        v29 = v23;
        _os_log_impl(&dword_1B05B7000, v22, OS_LOG_TYPE_DEFAULT, "%s Disabling autorotation for window: %p", buf, 0x16u);
      }
    }
  }
}

void __54__AVPresentationController_dismissalTransitionDidEnd___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  BOOL v3 = [v2 presentedPresentationContainerView];
  [v3 willBeginAdjustingOrientation];

  v4 = [*(id *)(a1 + 32) presentedView];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v61[0] = *MEMORY[0x1E4F1DAB8];
  v61[1] = v5;
  v61[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v4 setTransform:v61];

  if (!*(unsigned char *)(a1 + 40))
  {
    if ([*(id *)(a1 + 32) shouldRemovePresentersView])
    {
      v6 = [*(id *)(a1 + 32) presentingViewController];
      v7 = [v6 viewIfLoaded];
      v8 = [*(id *)(a1 + 32) containerView];
      int v9 = [v7 isDescendantOfView:v8];

      if (v9)
      {
        v10 = [*(id *)(a1 + 32) presentingViewController];
        for (uint64_t i = [v10 view];
        {
          BOOL v12 = (void *)i;

          v13 = [v12 superview];
          v14 = [*(id *)(a1 + 32) containerView];

          if (!v12 || v13 == v14) {
            break;
          }
          v10 = v12;
          [v12 superview];
        }
        [v12 removeFromSuperview];
      }
    }
    v15 = *(void **)(a1 + 32);
    v16 = [v15 context];
    int v17 = [v16 dismissingTransition];
    objc_msgSend(v15, "_ensureOrientation:enablingMixedOrientations:", objc_msgSend(v17, "initialInterfaceOrientation"), 1);

    v18 = [*(id *)(a1 + 32) containerView];
    [v18 bounds];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    v27 = [*(id *)(a1 + 32) presentedView];
    objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

    __int16 v28 = [*(id *)(a1 + 32) containerView];
    [v28 bounds];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v37 = [*(id *)(a1 + 32) context];
    v38 = [v37 backgroundView];
    objc_msgSend(v38, "setFrame:", v30, v32, v34, v36);

    v39 = [*(id *)(a1 + 32) containerView];
    [v39 bounds];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    v48 = [*(id *)(a1 + 32) context];
    v49 = [v48 touchBlockingView];
    objc_msgSend(v49, "setFrame:", v41, v43, v45, v47);

    v50 = [*(id *)(a1 + 32) context];
    v51 = [v50 rotatableWindowViewController];
    v52 = v51;
    if (v51)
    {
      objc_msgSend(v51, "avkit_setNeedsUpdatePreferencesIfNeeded");
    }
    else
    {
      v53 = [*(id *)(a1 + 32) context];
      v54 = [v53 presentedViewController];
      objc_msgSend(v54, "avkit_setNeedsUpdatePreferencesIfNeeded");
    }
    v55 = [*(id *)(a1 + 32) context];
    [v55 setDismissingTransition:0];
  }
  v56 = [*(id *)(a1 + 32) context];
  v57 = [v56 presentedPresentationContainerView];
  [v57 didStopTransition];

  if (*(unsigned char *)(a1 + 40))
  {
    v58 = [*(id *)(a1 + 32) context];
    v59 = [v58 rotatableSecondWindow];
    [v59 setHidden:1];

    v60 = [*(id *)(a1 + 32) context];
    [v60 setRotatableSecondWindow:0];
  }
}

- (void)_prepareDismissingTransitionContext
{
  BOOL v3 = objc_alloc_init(AVPresentationContextTransition);
  v4 = [(AVPresentationController *)self context];
  [v4 setDismissingTransition:v3];

  long long v5 = [(AVPresentationController *)self presentedViewController];
  v6 = [v5 transitionCoordinator];
  uint64_t v7 = [v6 isInteractive];
  v8 = [(AVPresentationController *)self context];
  int v9 = [v8 dismissingTransition];
  [v9 setWasInitiallyInteractive:v7];

  v10 = [(AVPresentationController *)self presentedViewController];
  v11 = [v10 transitioningDelegate];
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();
  BOOL v12 = [(AVPresentationController *)self context];
  v13 = [v12 dismissingTransition];
  [v13 setHasAVKitAnimator:v7 & 1];

  v14 = [(AVPresentationController *)self containerView];
  v15 = [v14 window];
  if ([v15 autorotates])
  {
    v16 = (void *)*MEMORY[0x1E4FB2608];
    int v17 = [(AVPresentationController *)self containerView];
    v18 = [v17 window];
    uint64_t v19 = [v16 _supportedInterfaceOrientationsForWindow:v18];
  }
  else
  {
    int v17 = [(AVPresentationController *)self containerView];
    v18 = [v17 window];
    uint64_t v19 = 1 << [v18 _windowInterfaceOrientation];
  }

  double v20 = [(AVPresentationController *)self presentingViewController];
  if ([v20 shouldAutorotate])
  {
  }
  else
  {
    double v21 = [(AVPresentationController *)self presentingViewController];
    uint64_t v22 = [v21 supportedInterfaceOrientations];
    double v23 = [(AVPresentationController *)self containerView];
    double v24 = [v23 window];
    unint64_t v25 = (1 << [v24 _windowInterfaceOrientation]) & (unint64_t)~v22;

    if (!v25)
    {
      double v26 = [(AVPresentationController *)self containerView];
      v27 = [v26 window];
      uint64_t v28 = 1 << [v27 _windowInterfaceOrientation];

      goto LABEL_9;
    }
  }
  double v26 = [(AVPresentationController *)self presentingViewController];
  uint64_t v28 = [v26 supportedInterfaceOrientations];
LABEL_9:

  uint64_t v29 = v28 & v19;
  double v30 = [(AVPresentationController *)self context];
  double v31 = [v30 dismissingTransition];
  [v31 setPresenterSupportedOrientations:v29];

  double v32 = [(AVPresentationController *)self context];
  double v33 = [v32 presentationWindow];
  double v34 = [v33 windowScene];
  uint64_t v35 = [v34 interfaceOrientation];
  double v36 = [(AVPresentationController *)self context];
  v37 = [v36 dismissingTransition];
  [v37 setInitialInterfaceOrientation:v35];

  id v42 = [(AVPresentationController *)self context];
  v38 = [v42 presentationWindow];
  uint64_t v39 = [v38 interfaceOrientation];
  double v40 = [(AVPresentationController *)self context];
  double v41 = [v40 dismissingTransition];
  [v41 setFinalInterfaceOrientation:v39];
}

- (void)dismissalTransitionWillBegin
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v34 = "-[AVPresentationController dismissalTransitionWillBegin]";
    __int16 v35 = 1024;
    int v36 = 249;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v4 = [(AVPresentationController *)self containerView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(AVPresentationController *)self context];
  v14 = [v13 backgroundView];
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  v15 = [(AVPresentationController *)self containerView];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v24 = [(AVPresentationController *)self context];
  unint64_t v25 = [v24 touchBlockingView];
  objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);

  [(AVPresentationController *)self _prepareDismissingTransitionContext];
  double v26 = [(AVPresentationController *)self context];
  v27 = [v26 dismissingTransition];
  LODWORD(v25) = [v27 hasAVKitAnimator];

  if (v25)
  {
    uint64_t v28 = [(AVPresentationController *)self context];
    uint64_t v29 = [v28 presentedPresentationContainerView];
    [v29 willBeginAdjustingOrientation];

    double v30 = [(AVPresentationController *)self context];
    double v31 = [v30 dismissingTransition];
    -[AVPresentationController _ensureOrientation:enablingMixedOrientations:](self, "_ensureOrientation:enablingMixedOrientations:", [v31 finalInterfaceOrientation], 0);

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __56__AVPresentationController_dismissalTransitionWillBegin__block_invoke;
    v32[3] = &unk_1E5FC4698;
    v32[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v32];
  }
}

void __56__AVPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  uint64_t v3 = [v2 rotatableSecondWindow];
  if (v3)
  {
    v4 = (void *)v3;
    double v5 = [*(id *)(a1 + 32) presentingViewController];
    double v6 = [v5 viewIfLoaded];
    int v7 = [v6 _isInAWindow];

    if (!v7) {
      goto LABEL_5;
    }
    double v8 = [*(id *)(a1 + 32) presentingViewController];
    double v9 = [v8 view];
    [v9 _setViewDelegateContentOverlayInsetsAreClean:0];

    double v10 = [*(id *)(a1 + 32) presentingViewController];
    double v11 = [v10 view];
    [v11 setNeedsLayout];

    double v12 = [*(id *)(a1 + 32) context];
    v13 = [v12 presentationWindow];
    [v13 setNeedsLayout];

    id v2 = [*(id *)(a1 + 32) context];
    v14 = [v2 presentationWindow];
    [v14 layoutIfNeeded];
  }
LABEL_5:
  v15 = [*(id *)(a1 + 32) containerView];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v24 = [*(id *)(a1 + 32) context];
  unint64_t v25 = [v24 backgroundView];
  objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);

  id v36 = [*(id *)(a1 + 32) containerView];
  [v36 bounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v34 = [*(id *)(a1 + 32) context];
  __int16 v35 = [v34 touchBlockingView];
  objc_msgSend(v35, "setFrame:", v27, v29, v31, v33);
}

- (void)_ensureOrientation:(int64_t)a3 enablingMixedOrientations:(BOOL)a4
{
  if (!a4)
  {
    double v11 = objc_msgSend(MEMORY[0x1E4FB1618], "clearColor", a3);
    double v12 = [(AVPresentationController *)self context];
    v13 = [v12 rotatableSecondWindow];
    [v13 setBackgroundColor:v11];

    v55 = [(AVPresentationController *)self context];
    v14 = [(AVFullScreenViewController *)v55 avFullScreenViewController];
    [v14 attachContentView];
    goto LABEL_10;
  }
  double v5 = [(AVPresentationController *)self context];
  if ([v5 allowsSecondWindowPresentations])
  {
    double v6 = [(AVPresentationController *)self context];
    if ([v6 wasInitiallyPresentedWithoutSecondWindow])
    {
LABEL_6:

      goto LABEL_7;
    }
    int v7 = [(AVPresentationController *)self context];
    double v8 = [v7 presentationWindow];
    double v9 = [(AVPresentationController *)self context];
    double v10 = [v9 presentedViewController];
    if (objc_msgSend(v8, "avkit_supportsAutorotationForInterfaceOrientationMask:", objc_msgSend(v10, "supportedInterfaceOrientations")))
    {

      goto LABEL_6;
    }
    v15 = [(AVPresentationController *)self context];
    double v16 = [v15 presentationWindow];
    char v17 = objc_msgSend(v16, "avkit_canAttemptSecondWindowForRotability");

    if ((v17 & 1) == 0) {
      goto LABEL_8;
    }
    double v18 = [(AVPresentationController *)self context];
    double v19 = [v18 avFullScreenViewController];

    if (!v19) {
      return;
    }
    double v20 = [(AVPresentationController *)self context];
    double v21 = [v20 rotatableSecondWindow];
    [v21 setHidden:1];

    id v22 = objc_alloc(MEMORY[0x1E4FB1F48]);
    double v23 = [(AVPresentationController *)self containerView];
    double v24 = [v23 window];
    unint64_t v25 = [v24 windowScene];
    double v26 = (void *)[v22 initWithWindowScene:v25];
    double v27 = [(AVPresentationController *)self context];
    [v27 setRotatableSecondWindow:v26];

    double v28 = [(AVPresentationController *)self context];
    double v29 = [v28 presentationWindow];
    [v29 windowLevel];
    double v31 = v30 + 1.0;

    if (v31 >= *MEMORY[0x1E4FB3120]) {
      double v31 = *MEMORY[0x1E4FB3120];
    }
    double v32 = [(AVPresentationController *)self context];
    double v33 = [v32 rotatableSecondWindow];
    [v33 setWindowLevel:v31];

    v55 = objc_alloc_init(AVFullScreenViewController);
    double v34 = [(AVPresentationController *)self context];
    __int16 v35 = [v34 rotatableSecondWindow];
    [v35 setRootViewController:v55];

    id v36 = [(AVPresentationController *)self context];
    uint64_t v37 = [v36 avFullScreenViewController];
    v38 = [(AVPresentationController *)self context];
    uint64_t v39 = [v38 rotatableWindowViewController];
    [v39 setSourceFullScreenViewController:v37];

    double v40 = [(AVPresentationController *)self context];
    double v41 = [v40 avFullScreenViewController];
    id v42 = [v41 delegate];
    double v43 = [(AVPresentationController *)self context];
    double v44 = [v43 rotatableWindowViewController];
    [v44 setDelegate:v42];

    double v45 = [(AVPresentationController *)self context];
    double v46 = [v45 rotatableWindowViewController];
    double v47 = [(AVPresentationController *)self context];
    v48 = [v47 avFullScreenViewController];
    [v48 setAssociatedFullScreenViewController:v46];

    v49 = [(AVPresentationController *)self context];
    v50 = [v49 rotatableSecondWindow];
    v51 = [v50 rootViewController];
    [v51 _setIgnoreAppSupportedOrientations:1];

    v52 = [(AVPresentationController *)self context];
    v53 = [v52 rotatableSecondWindow];
    [v53 setHidden:0];

    v14 = [(AVPresentationController *)self context];
    v54 = [v14 rotatableWindowViewController];
    [v54 attachContentView];

LABEL_10:
    goto LABEL_11;
  }
LABEL_7:

LABEL_8:
  v55 = [(AVPresentationController *)self context];
  [(AVFullScreenViewController *)v55 setWasInitiallyPresentedWithoutSecondWindow:1];
LABEL_11:
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = "NO";
    *(_DWORD *)buf = 136315650;
    v13 = "-[AVPresentationController presentationTransitionDidEnd:]";
    v15 = "completed";
    __int16 v14 = 2080;
    if (v3) {
      double v6 = "YES";
    }
    __int16 v16 = 2080;
    char v17 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

  int v7 = [(AVPresentationController *)self context];
  double v8 = [v7 presentingTransition];
  int v9 = [v8 hasAVKitAnimator];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__AVPresentationController_presentationTransitionDidEnd___block_invoke;
    v10[3] = &unk_1E5FC33E0;
    v10[4] = self;
    BOOL v11 = v3;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v10];
  }
}

void __57__AVPresentationController_presentationTransitionDidEnd___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  BOOL v3 = [v2 presentedView];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v43[0] = *MEMORY[0x1E4F1DAB8];
  v43[1] = v4;
  v43[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v43];

  if (*(unsigned char *)(a1 + 40))
  {
    double v5 = *(void **)(a1 + 32);
    double v6 = [v5 context];
    int v7 = [v6 presentingTransition];
    objc_msgSend(v5, "_ensureOrientation:enablingMixedOrientations:", objc_msgSend(v7, "finalInterfaceOrientation"), 1);

    double v8 = [*(id *)(a1 + 32) containerView];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    char v17 = [*(id *)(a1 + 32) context];
    uint64_t v18 = [v17 presentedView];
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

    double v19 = [*(id *)(a1 + 32) containerView];
    [v19 bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v28 = [*(id *)(a1 + 32) context];
    double v29 = [v28 backgroundView];
    objc_msgSend(v29, "setFrame:", v21, v23, v25, v27);

    double v30 = [*(id *)(a1 + 32) containerView];
    [v30 bounds];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    uint64_t v39 = [*(id *)(a1 + 32) context];
    double v40 = [v39 touchBlockingView];
    objc_msgSend(v40, "setFrame:", v32, v34, v36, v38);
  }
  double v41 = [*(id *)(a1 + 32) context];
  id v42 = [v41 presentedPresentationContainerView];
  [v42 didStopTransition];
}

- (void)presentationTransitionWillBegin
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v75 = 136315394;
    v76 = "-[AVPresentationController presentationTransitionWillBegin]";
    __int16 v77 = 1024;
    int v78 = 157;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v75, 0x12u);
  }

  long long v4 = objc_alloc_init(AVPresentationContextTransition);
  double v5 = [(AVPresentationController *)self context];
  [v5 setPresentingTransition:v4];

  double v6 = [(AVPresentationController *)self presentedViewController];
  int v7 = [v6 transitionCoordinator];
  uint64_t v8 = [v7 isInteractive];
  double v9 = [(AVPresentationController *)self context];
  double v10 = [v9 presentingTransition];
  [v10 setWasInitiallyInteractive:v8];

  double v11 = [(AVPresentationController *)self presentedViewController];
  double v12 = [v11 transitioningDelegate];
  objc_opt_class();
  LOBYTE(v8) = objc_opt_isKindOfClass();
  double v13 = [(AVPresentationController *)self context];
  double v14 = [v13 presentingTransition];
  [v14 setHasAVKitAnimator:v8 & 1];

  double v15 = [(AVPresentationController *)self containerView];
  double v16 = [v15 window];
  if ([v16 autorotates])
  {
    char v17 = (void *)*MEMORY[0x1E4FB2608];
    uint64_t v18 = [(AVPresentationController *)self containerView];
    double v19 = [v18 window];
    uint64_t v20 = [v17 _supportedInterfaceOrientationsForWindow:v19];
  }
  else
  {
    uint64_t v18 = [(AVPresentationController *)self containerView];
    double v19 = [v18 window];
    uint64_t v20 = 1 << [v19 _windowInterfaceOrientation];
  }

  double v21 = [(AVPresentationController *)self presentingViewController];
  if ([v21 shouldAutorotate])
  {
    double v22 = [(AVPresentationController *)self presentingViewController];
    uint64_t v23 = [v22 supportedInterfaceOrientations];
  }
  else
  {
    double v22 = [(AVPresentationController *)self containerView];
    double v24 = [v22 window];
    uint64_t v23 = 1 << [v24 _windowInterfaceOrientation];
  }
  double v25 = [(AVPresentationController *)self context];
  double v26 = [v25 presentingTransition];
  [v26 setPresenterSupportedOrientations:v23 & v20];

  double v27 = [(AVPresentationController *)self context];
  double v28 = [v27 presentedViewController];
  [v28 _setIgnoreAppSupportedOrientations:1];

  double v29 = [(AVPresentationController *)self context];
  double v30 = [v29 presentationWindow];
  double v31 = [v30 windowScene];
  uint64_t v32 = [v31 interfaceOrientation];
  double v33 = [(AVPresentationController *)self context];
  double v34 = [v33 presentingTransition];
  [v34 setInitialInterfaceOrientation:v32];

  double v35 = [(AVPresentationController *)self context];
  double v36 = [v35 presentationWindow];
  uint64_t v37 = [v36 interfaceOrientation];
  double v38 = [(AVPresentationController *)self context];
  uint64_t v39 = [v38 presentingTransition];
  [v39 setFinalInterfaceOrientation:v37];

  double v40 = [(AVPresentationController *)self context];
  double v41 = [v40 presentingTransition];
  LODWORD(v37) = [v41 hasAVKitAnimator];

  if (v37)
  {
    id v42 = [(AVPresentationController *)self presentedView];
    [v42 setAutoresizingMask:0];

    double v43 = [(AVPresentationController *)self containerView];
    [v43 bounds];
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    v52 = [(AVPresentationController *)self presentedView];
    objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

    v53 = [(AVPresentationController *)self containerView];
    [v53 bounds];
    double v55 = v54;
    double v57 = v56;
    double v59 = v58;
    double v61 = v60;
    v62 = [(AVPresentationController *)self context];
    v63 = [v62 backgroundView];
    objc_msgSend(v63, "setFrame:", v55, v57, v59, v61);

    v64 = [(AVPresentationController *)self containerView];
    [v64 bounds];
    double v66 = v65;
    double v68 = v67;
    double v70 = v69;
    double v72 = v71;
    v73 = [(AVPresentationController *)self context];
    v74 = [v73 touchBlockingView];
    objc_msgSend(v74, "setFrame:", v66, v68, v70, v72);
  }
}

- (AVPresentationContainerView)presentedPresentationContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedPresentationContainerView);

  return (AVPresentationContainerView *)WeakRetained;
}

- (id)presentedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  BOOL v3 = [WeakRetained presentedView];

  return v3;
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  BOOL v3 = [WeakRetained containerView];

  return (UIView *)v3;
}

- (UIViewController)presentedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  BOOL v3 = [WeakRetained presentedViewController];

  return (UIViewController *)v3;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  BOOL v3 = [WeakRetained presentingViewController];

  return (UIViewController *)v3;
}

- (void)containerViewWillLayoutSubviews
{
  if ([(AVPresentationController *)self presented])
  {
    BOOL v3 = [(AVPresentationController *)self containerView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = [(AVPresentationController *)self presentedView];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    double v13 = [(AVPresentationController *)self containerView];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v22 = [(AVPresentationController *)self context];
    uint64_t v23 = [v22 backgroundView];
    objc_msgSend(v23, "setFrame:", v15, v17, v19, v21);

    id v34 = [(AVPresentationController *)self containerView];
    [v34 bounds];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    uint64_t v32 = [(AVPresentationController *)self context];
    double v33 = [v32 touchBlockingView];
    objc_msgSend(v33, "setFrame:", v25, v27, v29, v31);
  }
}

- (BOOL)dismissed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  char v3 = [WeakRetained dismissed];

  return v3;
}

- (BOOL)presented
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  char v3 = [WeakRetained presented];

  return v3;
}

- (BOOL)presenting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  char v3 = [WeakRetained presenting];

  return v3;
}

- (BOOL)dismissing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  char v3 = [WeakRetained dismissing];

  return v3;
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (BOOL)shouldRemovePresentersView
{
  id v2 = [(AVPresentationController *)self presentedViewController];
  BOOL v3 = [v2 modalPresentationStyle] == 0;

  return v3;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(AVObservationController *)self->_observationController stopAllObservation];
  BOOL v3 = [(AVPresentationController *)self presentationWindowForDisablingAutorotation];
  [v3 endDisablingInterfaceAutorotation];

  double v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [(AVPresentationController *)self presentationWindowForDisablingAutorotation];
    *(_DWORD *)buf = 136315394;
    double v9 = "-[AVPresentationController dealloc]";
    __int16 v10 = 2048;
    double v11 = v5;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s Enabling autorotation for window: %p", buf, 0x16u);
  }
  [(AVPresentationController *)self setPresentationWindowForDisablingAutorotation:0];
  double v6 = _AVLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v9 = "-[AVPresentationController dealloc]";
    __int16 v10 = 1024;
    LODWORD(v11) = 72;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v7.receiver = self;
  v7.super_class = (Class)AVPresentationController;
  [(AVPresentationController *)&v7 dealloc];
}

- (AVPresentationController)initWithPresentationController:(id)a3 presentedViewController:(id)a4 presentingViewController:(id)a5 withConfiguration:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AVPresentationController;
  uint64_t v12 = [(AVPresentationController *)&v21 init];
  double v13 = _AVLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "-[AVPresentationController initWithPresentationController:presentedViewController:presentingViewController:wit"
          "hConfiguration:]";
    __int16 v24 = 1024;
    int v25 = 51;
    _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  if (v12)
  {
    objc_storeWeak((id *)&v12->_presentationController, v9);
    double v14 = [v10 view];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v15 = [v10 view];
      objc_storeWeak((id *)&v12->_presentedPresentationContainerView, v15);
    }
    else
    {
      objc_storeWeak((id *)&v12->_presentedPresentationContainerView, 0);
    }

    double v16 = [[AVPresentationContext alloc] initWithPresentationController:v12 configuration:v11];
    context = v12->_context;
    v12->_context = v16;

    double v18 = [[AVObservationController alloc] initWithOwner:v12];
    observationController = v12->_observationController;
    v12->_observationController = v18;

    [(AVPresentationController *)v12 _observeSceneDidBecomeActiveForRestoringRotatability];
  }

  return v12;
}

@end