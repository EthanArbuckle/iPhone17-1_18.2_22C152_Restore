@interface CCUIContentModuleDetailClickPresentationInteractionManager
- (BOOL)clickPresentationInteractionShouldBegin:(id)a3;
- (BOOL)clickPresentationInteractionShouldPresent:(id)a3;
- (CCUIContentModuleDetailClickPresentationInteractionManager)initWithPresentingViewController:(id)a3 delegate:(id)a4;
- (CCUIContentModuleDetailClickPresentationInteractionManagerDelegate)delegate;
- (UIView)viewForInteraction;
- (UIViewController)presentingViewController;
- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4;
- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4;
- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3;
- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4;
- (void)presentViewController;
- (void)setDelegate:(id)a3;
- (void)setViewForInteraction:(id)a3;
@end

@implementation CCUIContentModuleDetailClickPresentationInteractionManager

- (CCUIContentModuleDetailClickPresentationInteractionManager)initWithPresentingViewController:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCUIContentModuleDetailClickPresentationInteractionManager;
  v9 = [(CCUIContentModuleDetailClickPresentationInteractionManager *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentingViewController, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB2040]) initWithDelegate:v10];
    clickPresentationInteraction = v10->_clickPresentationInteraction;
    v10->_clickPresentationInteraction = (_UIClickPresentationInteraction *)v11;

    [(CCUIContentModuleDetailClickPresentationInteractionManager *)v10 setDelegate:v8];
  }

  return v10;
}

- (void)presentViewController
{
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFD | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFB | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 8;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xF7 | v7;
  }
}

- (void)setViewForInteraction:(id)a3
{
  char v5 = (UIView *)a3;
  viewForInteraction = self->_viewForInteraction;
  if (viewForInteraction != v5)
  {
    char v7 = v5;
    [(UIView *)viewForInteraction removeInteraction:self->_clickPresentationInteraction];
    objc_storeStrong((id *)&self->_viewForInteraction, a3);
    viewForInteraction = (UIView *)[(UIView *)self->_viewForInteraction addInteraction:self->_clickPresentationInteraction];
    char v5 = v7;
  }
  MEMORY[0x1F41817F8](viewForInteraction, v5);
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  if ((*(unsigned char *)&self->_delegateFlags & 2) == 0) {
    return 1;
  }
  v4 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v4) = [WeakRetained contentModuleDetailClickPresentationInteractionControllerInteractionShouldBegin:v4];

  return (char)v4;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4 = a3;
  BOOL v5 = (*(unsigned char *)&self->_delegateFlags & 4) == 0
    || !self->_authenticated
    && (block[0] = MEMORY[0x1E4F143A8],
        block[1] = 3221225472,
        block[2] = __104__CCUIContentModuleDetailClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke,
        block[3] = &unk_1E6AD41E8,
        block[4] = self,
        dispatch_async(MEMORY[0x1E4F14428], block),
        (*(unsigned char *)&self->_delegateFlags & 4) == 0)
    || self->_authenticated;

  return v5;
}

void __104__CCUIContentModuleDetailClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  char v6 = __104__CCUIContentModuleDetailClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke_2;
  char v7 = &unk_1E6AD4480;
  uint64_t v8 = v3;
  objc_msgSend(WeakRetained, "contentModuleDetailClickPresentationInteractionController:requestsAuthenticationForPresentationWithCompletionHandler:");
}

void __104__CCUIContentModuleDetailClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = a2;
  uint64_t v3 = *(id **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = [v3 viewForInteraction];
    uint64_t v5 = [v4 window];

    if (v5)
    {
      char v6 = *(void **)(*(void *)(a1 + 32) + 8);
      [v6 present];
    }
    else
    {
      v9 = (void *)CCUILogUserInterface;
      if (os_log_type_enabled((os_log_t)CCUILogUserInterface, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        uint64_t v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = [*(id *)(a1 + 32) viewForInteraction];
        int v14 = 138543618;
        v15 = v12;
        __int16 v16 = 2114;
        v17 = v13;
        _os_log_impl(&dword_1D834A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Control Center is about to present click preview but view is not in window, view = %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    [v3[1] cancelInteraction];
    char v7 = *(void **)(a1 + 32);
    uint64_t v8 = v7[1];
    [v7 clickPresentationInteractionEnded:v8 wasCancelled:1];
  }
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(unsigned char *)&self->_delegateFlags & 1) != 0
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        [WeakRetained presentedViewControllerForContentModuleDetailClickPresentationInteractionController:self], v9 = objc_claimAutoreleasedReturnValue(), WeakRetained, v9))
  {
    if (objc_opt_respondsToSelector()) {
      [(UIView *)self->_viewForInteraction cancelTouchTracking];
    }
    v10 = [CCUIContentModuleDetailTransitioningDelegate alloc];
    uint64_t v11 = [v7 parentViewController];
    v12 = [(CCUIContentModuleDetailTransitioningDelegate *)v10 initWithAnchoringViewController:v11];
    detailTransitioningDelegate = self->_detailTransitioningDelegate;
    self->_detailTransitioningDelegate = v12;

    int v14 = [(CCUIContentModuleDetailTransitioningDelegate *)self->_detailTransitioningDelegate presentationControllerForPresentedViewController:v9 presentingViewController:v7 sourceViewController:v7];
    presentationController = self->_presentationController;
    self->_presentationController = v14;

    __int16 v16 = [(CCUIContentModuleDetailTransitioningDelegate *)self->_detailTransitioningDelegate animationControllerForPresentedController:v9 presentingController:v7 sourceController:v7];
    uint64_t v17 = objc_opt_class();
    id v18 = v16;
    if (v17)
    {
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
    id v21 = v19;

    v22 = [[CCUIContentModuleDetailClickPresentationTransition alloc] initWithPresentedViewController:v9 animationController:v21];
    v23 = [(CCUIContentModuleDetailTransitioningDelegate *)self->_detailTransitioningDelegate animationControllerForDismissedController:v9];
    uint64_t v24 = objc_opt_class();
    id v25 = v23;
    v38 = v22;
    if (v24)
    {
      if (objc_opt_isKindOfClass()) {
        v26 = v25;
      }
      else {
        v26 = 0;
      }
    }
    else
    {
      v26 = 0;
    }
    id v27 = v26;

    v28 = [[CCUIContentModuleDetailClickPresentationTransition alloc] initWithPresentedViewController:v9 animationController:v27];
    v20 = (void *)[objc_alloc(MEMORY[0x1E4FB2038]) initWithPresentedViewController:v9 presentationController:self->_presentationController];
    v29 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v30 = [v29 userInterfaceIdiom];
    v31 = [(UIViewController *)self->_presentingViewController bs_presentationContextDefiningViewController];
    v32 = [v31 view];
    v33 = v32;
    if (v30)
    {
      uint64_t v34 = [v32 superview];

      v33 = (void *)v34;
    }

    [v20 setCustomContainerView:v33];
    if (objc_opt_respondsToSelector())
    {
      v35 = [v9 viewForTouchContinuation];
    }
    else
    {
      v35 = self->_viewForInteraction;
    }
    v36 = v35;
    [v20 setCustomViewForTouchContinuation:v35];
    [v20 setAppearanceTransition:v38];
    [v20 setDisappearanceTransition:v28];
  }
  else
  {
    [v6 cancelInteraction];
    v9 = 0;
    v20 = 0;
  }

  return v20;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  BOOL v4 = a4;
  detailTransitioningDelegate = self->_detailTransitioningDelegate;
  self->_detailTransitioningDelegate = 0;

  presentationController = self->_presentationController;
  self->_presentationController = 0;

  self->_authenticated = 0;
  if ((*(unsigned char *)&self->_delegateFlags & 8) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained contentModuleDetailClickPresentationInteractionControllerInteractionEnded:self wasCancelled:v4];
  }
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(UIView *)self->_viewForInteraction _isInAWindow])
  {
    uint64_t v5 = self->_viewForInteraction;
    id v6 = [(UIView *)v5 window];
    id v7 = (void *)CCUILogUserInterface;
    if (os_log_type_enabled((os_log_t)CCUILogUserInterface, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      int v13 = 138543874;
      int v14 = v10;
      __int16 v15 = 2114;
      __int16 v16 = v5;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_1D834A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Control Center is about to call -[UITargetedPreview initWithView:], view = %{public}@, window = %{public}@", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self->_viewForInteraction];
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3
{
  return 2;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (CCUIContentModuleDetailClickPresentationInteractionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CCUIContentModuleDetailClickPresentationInteractionManagerDelegate *)WeakRetained;
}

- (UIView)viewForInteraction
{
  return self->_viewForInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewForInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_detailTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_clickPresentationInteraction, 0);
}

@end