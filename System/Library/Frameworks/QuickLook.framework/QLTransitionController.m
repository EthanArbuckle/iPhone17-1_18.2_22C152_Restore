@interface QLTransitionController
- ($9F4668F2352A2F7A80B9EC1B630AA830)_requiredVisualStateTransitions;
- (BOOL)forceDismissalIfNeeded;
- (BOOL)hasPerformedTransition;
- (BOOL)showing;
- (NSDate)setupDate;
- (QLCustomTransitioning)animatedController;
- (QLPreviewController)previewController;
- (QLTransitionContext)quickLookTransitionContext;
- (QLTransitionController)initWithCoder:(id)a3;
- (UIViewController)presenterViewController;
- (UIViewControllerContextTransitioning)transitionContext;
- (double)duration;
- (double)transitionDuration:(id)a3;
- (id)transitionDriver;
- (unint64_t)transitionState;
- (void)_completeBackgroundTransition:(BOOL)a3;
- (void)_completeOverlayTransition:(BOOL)a3;
- (void)_performForcedDismissal;
- (void)_performStartBlockIfNeeded;
- (void)_performTransition;
- (void)_prepareTimedForcedDismissal;
- (void)_updateBackgroundTransitionWithProgress:(double)a3;
- (void)_updateOverlayTransitionWithProgress:(double)a3;
- (void)_view:(id)a3 applyFrameFromTransitionContextAsFinalFrame:(BOOL)a4 isToView:(BOOL)a5;
- (void)animateTransition:(id)a3;
- (void)completeTransition:(BOOL)a3;
- (void)completeTransition:(BOOL)a3 withDuration:(double)a4;
- (void)setDuration:(double)a3;
- (void)setHasPerformedTransition:(BOOL)a3;
- (void)setQuickLookTransitionContext:(id)a3;
- (void)setSetupDate:(id)a3;
- (void)setShowing:(BOOL)a3;
- (void)setTransitionContext:(id)a3;
- (void)setTransitionState:(unint64_t)a3;
- (void)setUpWithTransitionContext:(id)a3 completionHandler:(id)a4;
- (void)tearDownTransition:(BOOL)a3;
- (void)updateTransitionWithProgress:(double)a3;
@end

@implementation QLTransitionController

- (void)setUpWithTransitionContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v71 = a3;
  id v6 = a4;
  v7 = (NSObject **)MEMORY[0x263F62940];
  v8 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v78 = self;
    __int16 v79 = 2112;
    id v80 = v71;
    _os_log_impl(&dword_217F61000, v8, OS_LOG_TYPE_INFO, "QLTransitionController (%@) is being setup (%@). #AppearanceTransition", buf, 0x16u);
  }
  v9 = objc_msgSend(MEMORY[0x263EFF910], "date", v71);
  [(QLTransitionController *)self setSetupDate:v9];

  [(QLTransitionController *)self setTransitionContext:v72];
  if (_os_feature_enabled_impl())
  {
    v10 = [(QLTransitionController *)self previewController];
    [v10 updateStatusBarAnimated:0];

    v11 = [(QLTransitionController *)self previewController];
    v12 = [v11 view];
    [v12 layoutIfNeeded];
  }
  v13 = [(QLTransitionController *)self previewController];
  v14 = [v13 delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    if ([(QLTransitionController *)self showing]) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 3;
    }
    v17 = [(QLTransitionController *)self previewController];
    v18 = [v17 delegate];
    v19 = [(QLTransitionController *)self previewController];
    [v18 previewController:v19 willTransitionToState:v16];
  }
  v20 = [(QLTransitionController *)self transitionContext];
  v21 = [v20 containerView];

  v22 = [(QLTransitionController *)self transitionContext];
  v23 = [v22 viewForKey:*MEMORY[0x263F83C18]];

  v24 = [(QLTransitionController *)self transitionContext];
  v25 = [v24 viewForKey:*MEMORY[0x263F83C08]];

  if ([(QLTransitionController *)self showing])
  {
    [v21 addSubview:v23];
    [v23 setHidden:1];
  }
  else
  {
    v26 = [(QLTransitionController *)self previewController];
    v27 = [v26 view];
    [v21 insertSubview:v23 below:v27];
  }
  [(QLTransitionController *)self _view:v25 applyFrameFromTransitionContextAsFinalFrame:0 isToView:0];
  [(QLTransitionController *)self _view:v23 applyFrameFromTransitionContextAsFinalFrame:1 isToView:1];
  v28 = [QLTransitionContext alloc];
  v29 = [(QLTransitionController *)self previewController];
  v30 = [(QLTransitionController *)self transitionContext];
  v31 = [v30 viewControllerForKey:*MEMORY[0x263F83C10]];
  v32 = [(QLTransitionContext *)v28 initWithQLPreviewController:v29 containerView:v21 toViewController:v31];
  [(QLTransitionController *)self setQuickLookTransitionContext:v32];

  v33 = [MEMORY[0x263F825C8] clearColor];
  v34 = [(QLTransitionController *)self previewController];
  v35 = [v34 view];
  [v35 setBackgroundColor:v33];

  id v36 = objc_alloc(MEMORY[0x263F82E00]);
  [v21 bounds];
  v37 = (UIView *)objc_msgSend(v36, "initWithFrame:");
  transitionBackgroundView = self->_transitionBackgroundView;
  self->_transitionBackgroundView = v37;

  v39 = [(QLTransitionController *)self previewController];
  v40 = [v39 _preferredBackgroundColor];
  [(UIView *)self->_transitionBackgroundView setBackgroundColor:v40];

  v41 = self->_transitionBackgroundView;
  v42 = [(QLTransitionController *)self previewController];
  v43 = [v42 view];
  [v21 insertSubview:v41 below:v43];

  v44 = [(QLTransitionController *)self previewController];
  BOOL v45 = [v44 presentationMode] == 1;

  if (v45)
  {
    v46 = [(QLTransitionController *)self previewController];
    if ([v46 fullScreen])
    {
      BOOL v47 = [(QLTransitionController *)self showing];

      if (v47)
      {
LABEL_20:
        v52 = [(QLTransitionController *)self previewController];
        v53 = [v52 internalNavigationController];
        disabledNavigationController = self->_disabledNavigationController;
        self->_disabledNavigationController = v53;

        v55 = [(UINavigationController *)self->_disabledNavigationController view];
        [v55 setUserInteractionEnabled:0];

        goto LABEL_21;
      }
      v48 = [(QLTransitionController *)self previewController];
      v49 = [v48 navigationController];
      v50 = [v49 navigationBar];
      [v50 setAlpha:0.01];

      v46 = [(QLTransitionController *)self previewController];
      v51 = [v46 toolbarController];
      [v51 setOriginalToolbarAlpha:0.0];
    }
    goto LABEL_20;
  }
LABEL_21:
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v56 = [(QLTransitionController *)self previewController];
    [v56 updateStatusBarAnimated:1];
  }
  [(QLTransitionController *)self updateTransitionWithProgress:0.0];
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke;
  aBlock[3] = &unk_2642F5B68;
  objc_copyWeak(&v76, (id *)buf);
  id v57 = v6;
  id v75 = v57;
  id v58 = v23;
  id v74 = v58;
  v59 = _Block_copy(aBlock);
  id startTransitionBlock = self->_startTransitionBlock;
  self->_id startTransitionBlock = v59;

  v61 = [(QLTransitionController *)self previewController];
  v62 = [v61 currentAnimator];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();

  if ((([(QLTransitionController *)self showing] | isKindOfClass) & 1) == 0) {
    [(QLTransitionController *)self _prepareTimedForcedDismissal];
  }
  v64 = [(QLTransitionController *)self previewController];
  v65 = [v64 previewCollection];
  int v66 = [v65 isAvailable];

  if (v66)
  {
    v67 = [(QLTransitionController *)self previewController];
    v68 = [v67 previewCollection];
    int v69 = [v68 isRemote];

    if (v69)
    {
      v70 = [(QLTransitionController *)self quickLookTransitionContext];
      [v70 prepareContextToSend];
    }
    QLRunInBackgroundThread();
  }
  else
  {
    [(QLTransitionController *)self _performStartBlockIfNeeded];
  }

  objc_destroyWeak(&v76);
  objc_destroyWeak((id *)buf);
}

void __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke(id *a1)
{
  objc_copyWeak(&v4, a1 + 6);
  id v3 = a1[5];
  id v2 = a1[4];
  QLRunInMainThread();

  objc_destroyWeak(&v4);
}

void __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setTransitionState:1];

  id v4 = (void *)MEMORY[0x263F82E00];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_3;
  v17[3] = &unk_2642F5AF8;
  objc_copyWeak(&v18, v2);
  [v4 animateWithDuration:v17 animations:0.2];
  id v5 = objc_loadWeakRetained(v2);
  int v6 = [v5 showing];

  if (v6)
  {
    id v7 = objc_loadWeakRetained(v2);
    [v7 updateTransitionWithProgress:0.0];
  }
  v8 = (NSObject **)MEMORY[0x263F62940];
  v9 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    id v11 = objc_loadWeakRetained(v2);
    *(_DWORD *)buf = 138412290;
    id v20 = v11;
    _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_INFO, "QLTransitionController (%@) setup is done, calling handler to perform transition. #AppearanceTransition", buf, 0xCu);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(void))(v12 + 16))();
  }
  id v13 = objc_loadWeakRetained(v2);
  v14 = [v13 quickLookTransitionContext];
  char v15 = [v14 sourceView];
  [v15 setHidden:1];

  id v16 = objc_loadWeakRetained(v2);
  LODWORD(v13) = [v16 showing];

  if (v13) {
    [*(id *)(a1 + 32) setHidden:0];
  }
  objc_destroyWeak(&v18);
}

void __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained previewController];
  [v1 setNeedsStatusBarAppearanceUpdate];
}

void __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = (NSObject **)MEMORY[0x263F62940];
  id v3 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl(&dword_217F61000, v3, OS_LOG_TYPE_INFO, "QLTransitionController (%@) is notifying preview collection about transition #AppearanceTransition", buf, 0xCu);
  }
  id v5 = [*(id *)(a1 + 32) previewController];
  int v6 = [v5 previewCollection];
  id v7 = [*(id *)(a1 + 32) quickLookTransitionContext];
  v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v8 showing];
  uint64_t v10 = *(unsigned __int8 *)(a1 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_8;
  v11[3] = &unk_2642F5430;
  v11[4] = *(void *)(a1 + 32);
  [v6 startTransitionWithSourceViewProvider:v7 transitionController:v8 presenting:v9 useInteractiveTransition:v10 completionHandler:v11];
}

uint64_t __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_8()
{
  return QLRunInMainThread();
}

uint64_t __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_2_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performStartBlockIfNeeded];
}

- (void)_prepareTimedForcedDismissal
{
}

void __54__QLTransitionController__prepareTimedForcedDismissal__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  QLRunInMainThread();
  objc_destroyWeak(&v1);
}

void __54__QLTransitionController__prepareTimedForcedDismissal__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v4 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = objc_loadWeakRetained(v1);
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, "Forced dismissal of QLPreviewController after timeout with animator: %@ #PreviewController", (uint8_t *)&v8, 0xCu);
    }
    id v7 = objc_loadWeakRetained(v1);
    [v7 _performForcedDismissal];
  }
}

- (void)_performStartBlockIfNeeded
{
  id startTransitionBlock = (void (**)(id, SEL))self->_startTransitionBlock;
  if (startTransitionBlock)
  {
    startTransitionBlock[2](startTransitionBlock, a2);
    id v4 = self->_startTransitionBlock;
    self->_id startTransitionBlock = 0;
  }
}

- (void)completeTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = (NSObject **)MEMORY[0x263F62940];
  id v6 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    int v8 = NSStringFromBOOL();
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_INFO, "QLTransitionController is completing transition. didComplete:%@ #AppearanceTransition", (uint8_t *)&v9, 0xCu);
  }
  [(QLTransitionController *)self _completeOverlayTransition:v3];
  [(QLTransitionController *)self _completeBackgroundTransition:v3];
}

- (void)tearDownTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v41 = *MEMORY[0x263EF8340];
  [(QLTransitionController *)self setTransitionState:2];
  id v5 = (NSObject **)MEMORY[0x263F62940];
  id v6 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    int v8 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412290;
    v40 = v8;
    _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_INFO, "QLTransitionController is tearing down transition. didComplete:%@ #AppearanceTransition", buf, 0xCu);
  }
  [(QLTransitionController *)self _performStartBlockIfNeeded];
  int v9 = [(QLTransitionController *)self previewController];
  [v9 updateStatusBarAnimated:1];

  uint64_t v10 = [(QLTransitionController *)self transitionContext];
  uint64_t v11 = [v10 viewForKey:*MEMORY[0x263F83C18]];

  uint64_t v12 = [(QLTransitionController *)self transitionContext];
  uint64_t v13 = [v12 viewForKey:*MEMORY[0x263F83C08]];

  uint64_t v14 = [(QLTransitionController *)self previewController];
  [MEMORY[0x263F158F8] begin];
  char v15 = [(QLTransitionController *)self quickLookTransitionContext];
  id v16 = [v15 sourceView];
  [v16 setHidden:0];

  [MEMORY[0x263F158F8] commit];
  [MEMORY[0x263F158F8] flush];
  v17 = [(QLTransitionController *)self previewController];
  [v17 _updateBackgroundColor];

  [(UIView *)self->_transitionBackgroundView removeFromSuperview];
  if (v3)
  {
    [(QLTransitionController *)self _view:v13 applyFrameFromTransitionContextAsFinalFrame:1 isToView:0];
    [(QLTransitionController *)self _view:v11 applyFrameFromTransitionContextAsFinalFrame:1 isToView:1];
  }
  id v18 = [(UINavigationController *)self->_disabledNavigationController view];
  [v18 setUserInteractionEnabled:1];

  disabledNavigationController = self->_disabledNavigationController;
  self->_disabledNavigationController = 0;

  id v20 = [(QLTransitionController *)self previewController];
  uint64_t v21 = [v20 previewCollection];
  int v22 = [v21 isRemote];

  if (v22)
  {
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    v35 = __45__QLTransitionController_tearDownTransition___block_invoke;
    id v36 = &unk_2642F55E0;
    id v37 = v14;
    BOOL v38 = v3;
    dispatch_async(MEMORY[0x263EF83A0], &v33);
    v23 = v37;
  }
  else
  {
    v24 = *v5;
    if (!*v5)
    {
      QLSInitLogging();
      v24 = *v5;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F61000, v24, OS_LOG_TYPE_INFO, "About to tearDownTransition with non-remote previewCollection #AppearanceTransition", buf, 2u);
    }
    v23 = [v14 previewCollection];
    [v23 tearDownTransition:v3];
  }

  v25 = [(QLTransitionController *)self transitionContext];
  [v25 completeTransition:v3];

  v26 = [(QLTransitionController *)self previewController];
  v27 = [v26 delegate];
  char v28 = objc_opt_respondsToSelector();

  if (v28)
  {
    if ([(QLTransitionController *)self showing]) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = 3;
    }
    v30 = [(QLTransitionController *)self previewController];
    v31 = [v30 delegate];
    v32 = [(QLTransitionController *)self previewController];
    [v31 previewController:v32 didTransitionToState:v29];
  }
}

void __45__QLTransitionController_tearDownTransition___block_invoke(uint64_t a1)
{
  id v2 = (NSObject **)MEMORY[0x263F62940];
  BOOL v3 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    BOOL v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_217F61000, v3, OS_LOG_TYPE_INFO, "About to tearDownTransition with remote previewCollection #AppearanceTransition", v5, 2u);
  }
  id v4 = [*(id *)(a1 + 32) previewCollection];
  [v4 tearDownTransition:*(unsigned __int8 *)(a1 + 40)];
}

- (UIViewController)presenterViewController
{
  p_transitionContext = &self->_transitionContext;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_transitionContext);
    id WeakRetained = [v4 viewControllerForKey:*MEMORY[0x263F83C00]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = objc_loadWeakRetained((id *)p_transitionContext);
      uint64_t v6 = [v5 viewControllerForKey:*MEMORY[0x263F83C10]];

      id WeakRetained = (void *)v6;
    }
  }

  return (UIViewController *)WeakRetained;
}

- (QLPreviewController)previewController
{
  p_transitionContext = &self->_transitionContext;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_transitionContext);
    id WeakRetained = [v4 viewControllerForKey:*MEMORY[0x263F83C00]];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = objc_loadWeakRetained((id *)p_transitionContext);
      uint64_t v6 = [v5 viewControllerForKey:*MEMORY[0x263F83C10]];

      id WeakRetained = (void *)v6;
    }
  }

  return (QLPreviewController *)WeakRetained;
}

- (void)_performTransition
{
  if (![(QLTransitionController *)self hasPerformedTransition])
  {
    [(QLTransitionController *)self setHasPerformedTransition:1];
    BOOL v3 = (void *)MEMORY[0x263F82E00];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
    [(QLTransitionController *)self transitionDuration:WeakRetained];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __44__QLTransitionController__performTransition__block_invoke;
    v6[3] = &unk_2642F5430;
    v6[4] = self;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __44__QLTransitionController__performTransition__block_invoke_2;
    v5[3] = &unk_2642F5458;
    v5[4] = self;
    objc_msgSend(v3, "animateWithDuration:animations:completion:", v6, v5);
  }
}

uint64_t __44__QLTransitionController__performTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTransitionWithProgress:1.0];
}

uint64_t __44__QLTransitionController__performTransition__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransition:1];
  id v2 = *(void **)(a1 + 32);

  return [v2 tearDownTransition:1];
}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_transitionContext, v4);
  objc_initWeak(&location, self);
  id v5 = [(QLTransitionController *)self previewController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__QLTransitionController_animateTransition___block_invoke;
  v6[3] = &unk_2642F5B90;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v5 waitForPreviewCollectionWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __44__QLTransitionController_animateTransition___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__QLTransitionController_animateTransition___block_invoke_2;
  v5[3] = &unk_2642F5AF8;
  objc_copyWeak(&v6, v2);
  [WeakRetained setUpWithTransitionContext:v4 completionHandler:v5];

  objc_destroyWeak(&v6);
}

void __44__QLTransitionController_animateTransition___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performTransition];
}

- (void)updateTransitionWithProgress:(double)a3
{
}

uint64_t __55__QLTransitionController_updateTransitionWithProgress___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateOverlayTransitionWithProgress:*(double *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);

  return [v2 _updateBackgroundTransitionWithProgress:v3];
}

- (void)completeTransition:(BOOL)a3 withDuration:(double)a4
{
  self->_duration = a4;
  QLRunInMainThread();
}

uint64_t __58__QLTransitionController_completeTransition_withDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:*(unsigned __int8 *)(a1 + 40)];
}

- ($9F4668F2352A2F7A80B9EC1B630AA830)_requiredVisualStateTransitions
{
  double v3 = [(QLTransitionController *)self previewController];
  uint64_t v4 = [v3 presentationMode];

  id v5 = [(QLTransitionController *)self previewController];
  uint64_t v6 = [v5 presentationMode];

  id v7 = [(QLTransitionController *)self previewController];
  int v8 = [v7 fullScreen];

  int v9 = [(QLTransitionController *)self previewController];
  uint64_t v10 = [v9 previousNavigationVCState];
  int v11 = [v10 toolBarHidden];

  uint64_t v12 = [(QLTransitionController *)self previewController];
  uint64_t v13 = [v12 toolbarController];
  int v14 = [v13 isOriginalToolbarHidden];

  char v15 = [(QLTransitionController *)self previewController];
  id v16 = [v15 toolbarController];
  int v17 = [v16 isAccessoryViewHidden];

  int v18 = v14 ^ 1;
  uint64_t v19 = 0x10000000000;
  if (v4 == 2)
  {
    int v20 = 1;
    uint64_t v21 = 0x1000000;
  }
  else
  {
    if ((v8 & (v6 != 1)) == 0) {
      uint64_t v19 = 0;
    }
    if (v8 & (v6 != 1) | v18 & 1)
    {
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v19 = 0x10000000000;
      if (v11 | v17) {
        uint64_t v19 = 0;
      }
    }
    int v20 = v8;
  }
  BOOL v22 = v6 == 1;
  int v23 = v20 | v18 | v11 | v17;
  uint64_t v24 = 0x100000000;
  if (v23) {
    uint64_t v24 = 0;
  }
  uint64_t v25 = 0x10000;
  if (v20 | v11 ^ 1 | v17 & v14) {
    uint64_t v25 = 0;
  }
  uint64_t v26 = 256;
  if (v20 | v14 | v11 | v17) {
    uint64_t v26 = 0;
  }
  uint64_t v27 = v23 ^ 1u;
  uint64_t v28 = 0x1000000000000;
  if (v11) {
    uint64_t v28 = 0;
  }
  BOOL v29 = v22 & v8;
  if ((v22 & v8) != 0) {
    uint64_t v30 = v28;
  }
  else {
    uint64_t v30 = 0;
  }
  BOOL v31 = v20 == 0;
  uint64_t v32 = 0x100000000000000;
  if (v31) {
    uint64_t v32 = 0;
  }
  uint64_t v33 = v21 | v32 | v19 | v30 | v25 | v24 | v26 | v27;
  result.var0 = v33;
  result.var1 = BYTE1(v33);
  result.var2 = BYTE2(v33);
  result.var3 = BYTE3(v33);
  result.var4 = BYTE4(v33);
  result.var5 = BYTE5(v33);
  result.var6 = BYTE6(v33);
  result.var7 = HIBYTE(v33);
  result.var8 = v29;
  return result;
}

- (void)_updateOverlayTransitionWithProgress:(double)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v6 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v59 = 134217984;
    double v60 = a3;
    _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_INFO, "QLTransitionController is updating overlay with progress:%f #AppearanceTransition", (uint8_t *)&v59, 0xCu);
  }
  uint64_t v7 = [(QLTransitionController *)self _requiredVisualStateTransitions];
  uint64_t v8 = v7;
  char v10 = v9;
  if (v7)
  {
    if ([(QLTransitionController *)self showing]) {
      double v11 = 1.0 - a3;
    }
    else {
      double v11 = a3;
    }
    uint64_t v12 = [(QLTransitionController *)self previewController];
    uint64_t v13 = [v12 toolbarController];
    [v13 setAccessoryViewAlpha:v11];

    if ((v8 & 0x100) == 0)
    {
LABEL_7:
      if ((v8 & 0x10000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((v7 & 0x100) == 0)
  {
    goto LABEL_7;
  }
  int v14 = [(QLTransitionController *)self previewController];
  char v15 = [v14 toolbarController];
  BOOL v16 = [(QLTransitionController *)self showing];
  double v17 = 1.0 - a3;
  if (!v16) {
    double v17 = a3;
  }
  [v15 setAccessoryViewHiddenProgress:v17];

  int v18 = [(QLTransitionController *)self previewController];
  uint64_t v19 = [v18 toolbarController];
  [v19 updateLayout];

  if ((v8 & 0x10000) == 0)
  {
LABEL_8:
    if ((v8 & 0x1000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_20;
  }
LABEL_17:
  int v20 = [(QLTransitionController *)self previewController];
  uint64_t v21 = [v20 toolbarController];
  BOOL v22 = [v21 originalToolbar];
  [v22 _removeAllAnimations:1];

  int v23 = [(QLTransitionController *)self previewController];
  uint64_t v24 = [v23 toolbarController];
  BOOL v25 = [(QLTransitionController *)self showing];
  double v26 = 1.0 - a3;
  if (!v25) {
    double v26 = a3;
  }
  [v24 setHiddenProgress:v26];

  uint64_t v27 = [(QLTransitionController *)self previewController];
  uint64_t v28 = [v27 toolbarController];
  [v28 updateLayout];

  if ((v8 & 0x1000000) != 0)
  {
LABEL_20:
    if ([(QLTransitionController *)self showing]) {
      double v29 = a3;
    }
    else {
      double v29 = 1.0 - a3;
    }
    uint64_t v30 = [(QLTransitionController *)self previewController];
    uint64_t v31 = [v30 toolbarController];
    [(id)v31 setToolbarAlpha:v29];

    uint64_t v32 = [(QLTransitionController *)self previewController];
    LOBYTE(v31) = [v32 fullScreen];

    if ((v31 & 1) == 0)
    {
      if ([(QLTransitionController *)self showing]) {
        double v33 = a3;
      }
      else {
        double v33 = 1.0 - a3;
      }
      uint64_t v34 = [(QLTransitionController *)self previewController];
      [v34 setToolbarGradientAlpha:v33];
    }
  }
LABEL_28:
  if ((v8 & 0x10000000000) == 0)
  {
    if ((v8 & 0x1000000000000) == 0) {
      goto LABEL_30;
    }
LABEL_36:
    uint64_t v41 = [(QLTransitionController *)self previewController];
    v42 = [v41 toolbarController];
    [v42 restoreOriginalConfiguration];

    v43 = [(QLTransitionController *)self previewController];
    v44 = [v43 toolbarController];
    BOOL v45 = [v44 originalToolbar];
    [v45 _removeAllAnimations:1];

    if ([(QLTransitionController *)self showing]) {
      double v46 = 1.0 - a3;
    }
    else {
      double v46 = a3;
    }
    BOOL v47 = [(QLTransitionController *)self previewController];
    v48 = [v47 toolbarController];
    [v48 setOriginalToolbarAlpha:v46];

    if ((v8 & 0x100000000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_40;
  }
  v35 = [(QLTransitionController *)self previewController];
  id v36 = [v35 toolbarController];
  id v37 = [v36 originalToolbar];
  [v37 _removeAllAnimations:1];

  if ([(QLTransitionController *)self showing]) {
    double v38 = a3;
  }
  else {
    double v38 = 1.0 - a3;
  }
  v39 = [(QLTransitionController *)self previewController];
  v40 = [v39 toolbarController];
  [v40 setOriginalToolbarAlpha:v38];

  if ((v8 & 0x1000000000000) != 0) {
    goto LABEL_36;
  }
LABEL_30:
  if ((v8 & 0x100000000000000) == 0) {
    goto LABEL_48;
  }
LABEL_40:
  if ([(QLTransitionController *)self showing]) {
    double v49 = a3;
  }
  else {
    double v49 = 1.0 - a3;
  }
  v50 = [(QLTransitionController *)self previewController];
  uint64_t v51 = [v50 internalNavigationController];
  v52 = [(id)v51 navigationBar];
  [v52 setAlpha:v49];

  v53 = [(QLTransitionController *)self previewController];
  LOBYTE(v51) = [v53 fullScreen];

  if ((v51 & 1) == 0)
  {
    if ([(QLTransitionController *)self showing]) {
      double v54 = a3;
    }
    else {
      double v54 = 1.0 - a3;
    }
    v55 = [(QLTransitionController *)self previewController];
    [v55 setNavigationBarGradientAlpha:v54];
  }
LABEL_48:
  if (v10)
  {
    v56 = [(QLTransitionController *)self presenterViewController];
    id v57 = [v56 navigationController];
    id v58 = [v57 navigationBar];
    [v58 setAlpha:a3];
  }
}

- (void)_updateBackgroundTransitionWithProgress:(double)a3
{
  BOOL v5 = [(QLTransitionController *)self showing];
  double v6 = 1.0 - a3;
  if (v5) {
    double v6 = a3;
  }
  transitionBackgroundView = self->_transitionBackgroundView;

  [(UIView *)transitionBackgroundView setAlpha:v6];
}

- (void)_completeOverlayTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(QLTransitionController *)self _requiredVisualStateTransitions];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(QLTransitionController *)self previewController];
    uint64_t v8 = [v7 toolbarController];
    [v8 setAccessoryViewAlpha:1.0];

    if ((v6 & 0x100) == 0)
    {
LABEL_3:
      if ((v6 & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v9 = [(QLTransitionController *)self showing] ^ v3;
  char v10 = [(QLTransitionController *)self previewController];
  double v11 = [v10 toolbarController];
  [v11 setAccessoryViewHidden:v9];

  uint64_t v12 = [(QLTransitionController *)self previewController];
  uint64_t v13 = [v12 toolbarController];
  [v13 updateLayout];

  if ((v6 & 0x10000) == 0)
  {
LABEL_4:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v14 = [(QLTransitionController *)self showing] ^ v3;
  char v15 = [(QLTransitionController *)self previewController];
  BOOL v16 = [v15 toolbarController];
  [v16 setHidden:v14];

  double v17 = [(QLTransitionController *)self previewController];
  int v18 = [v17 toolbarController];
  [v18 updateLayout];

  if ((v6 & 0x1000000) == 0)
  {
LABEL_5:
    if ((v6 & 0x10000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_11:
  BOOL v19 = [(QLTransitionController *)self showing];
  double v20 = 0.0;
  if (v3) {
    double v21 = 1.0;
  }
  else {
    double v21 = 0.0;
  }
  if (!v3) {
    double v20 = 1.0;
  }
  if (v19) {
    double v22 = v21;
  }
  else {
    double v22 = v20;
  }
  int v23 = [(QLTransitionController *)self previewController];
  uint64_t v24 = [v23 toolbarController];
  [v24 setToolbarAlpha:v22];

  if ((v6 & 0x10000000000) == 0)
  {
LABEL_6:
    if ((v6 & 0x100000000000000) == 0) {
      return;
    }
    goto LABEL_29;
  }
LABEL_20:
  BOOL v25 = [(QLTransitionController *)self previewController];
  double v26 = [v25 toolbarController];
  uint64_t v27 = [v26 originalToolbar];
  [v27 _removeAllAnimations:1];

  BOOL v28 = [(QLTransitionController *)self showing];
  double v29 = 0.0;
  if (v3) {
    double v30 = 1.0;
  }
  else {
    double v30 = 0.0;
  }
  if (!v3) {
    double v29 = 1.0;
  }
  if (v28) {
    double v31 = v30;
  }
  else {
    double v31 = v29;
  }
  uint64_t v32 = [(QLTransitionController *)self previewController];
  double v33 = [v32 toolbarController];
  [v33 setOriginalToolbarAlpha:v31];

  if ((v6 & 0x100000000000000) != 0)
  {
LABEL_29:
    BOOL v34 = [(QLTransitionController *)self showing];
    double v35 = 0.0;
    if (v3) {
      double v36 = 1.0;
    }
    else {
      double v36 = 0.0;
    }
    if (!v3) {
      double v35 = 1.0;
    }
    if (v34) {
      double v37 = v36;
    }
    else {
      double v37 = v35;
    }
    id v40 = [(QLTransitionController *)self previewController];
    double v38 = [v40 internalNavigationController];
    v39 = [v38 navigationBar];
    [v39 setAlpha:v37];
  }
}

- (void)_completeBackgroundTransition:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(QLTransitionController *)self showing];
  double v6 = 0.0;
  if (v3) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  if (!v3) {
    double v6 = 1.0;
  }
  if (v5) {
    double v6 = v7;
  }
  transitionBackgroundView = self->_transitionBackgroundView;

  [(UIView *)transitionBackgroundView setAlpha:v6];
}

- (void)_view:(id)a3 applyFrameFromTransitionContextAsFinalFrame:(BOOL)a4 isToView:(BOOL)a5
{
  BOOL v5 = a5;
  id v21 = a3;
  uint64_t v8 = (id *)MEMORY[0x263F83C10];
  if (!v5) {
    uint64_t v8 = (id *)MEMORY[0x263F83C00];
  }
  id v9 = *v8;
  char v10 = [(QLTransitionController *)self transitionContext];
  double v11 = [(QLTransitionController *)self transitionContext];
  uint64_t v12 = [v11 viewControllerForKey:v9];
  if (a4) {
    [v10 finalFrameForViewController:v12];
  }
  else {
    [v10 initialFrameForViewController:v12];
  }
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;

  v23.origin.x = v17;
  v23.origin.y = v18;
  v23.size.width = v19;
  v23.size.height = v20;
  if (!CGRectEqualToRect(v23, *MEMORY[0x263F001A8])) {
    objc_msgSend(v21, "setFrame:", v17, v18, v19, v20);
  }
}

- (BOOL)forceDismissalIfNeeded
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(QLTransitionController *)self showing]) {
    goto LABEL_9;
  }
  if ([(QLTransitionController *)self hasPerformedTransition])
  {
    BOOL v3 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      uint64_t v8 = (NSObject **)MEMORY[0x263F62940];
      QLSInitLogging();
      BOOL v3 = *v8;
    }
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v4)
    {
      int v10 = 138412290;
      double v11 = self;
      _os_log_impl(&dword_217F61000, v3, OS_LOG_TYPE_INFO, "QLTransitionController (%@) did not perform forced dismissal because dismissal has already been performed successfully. #AppearanceTransition", (uint8_t *)&v10, 0xCu);
LABEL_9:
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    BOOL v5 = [(QLTransitionController *)self setupDate];
    [v5 timeIntervalSinceNow];
    double v7 = v6;

    if (v7 >= -5.0) {
      goto LABEL_9;
    }
    [(QLTransitionController *)self _performForcedDismissal];
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)_performForcedDismissal
{
}

uint64_t __49__QLTransitionController__performForcedDismissal__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performStartBlockIfNeeded];
}

- (QLTransitionController)initWithCoder:(id)a3
{
  return 0;
}

- (BOOL)showing
{
  return self->_showing;
}

- (void)setShowing:(BOOL)a3
{
  self->_showing = a3;
}

- (QLTransitionContext)quickLookTransitionContext
{
  return (QLTransitionContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQuickLookTransitionContext:(id)a3
{
}

- (QLCustomTransitioning)animatedController
{
  return (QLCustomTransitioning *)objc_getProperty(self, a2, 48, 1);
}

- (UIViewControllerContextTransitioning)transitionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);

  return (UIViewControllerContextTransitioning *)WeakRetained;
}

- (void)setTransitionContext:(id)a3
{
}

- (id)transitionDriver
{
  return objc_getProperty(self, a2, 64, 1);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)transitionState
{
  return self->_transitionState;
}

- (void)setTransitionState:(unint64_t)a3
{
  self->_transitionState = a3;
}

- (NSDate)setupDate
{
  return self->_setupDate;
}

- (void)setSetupDate:(id)a3
{
}

- (BOOL)hasPerformedTransition
{
  return self->_hasPerformedTransition;
}

- (void)setHasPerformedTransition:(BOOL)a3
{
  self->_hasPerformedTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupDate, 0);
  objc_storeStrong(&self->_transitionDriver, 0);
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_storeStrong((id *)&self->_animatedController, 0);
  objc_storeStrong((id *)&self->_quickLookTransitionContext, 0);
  objc_storeStrong(&self->_startTransitionBlock, 0);
  objc_storeStrong((id *)&self->_disabledNavigationController, 0);

  objc_storeStrong((id *)&self->_transitionBackgroundView, 0);
}

@end