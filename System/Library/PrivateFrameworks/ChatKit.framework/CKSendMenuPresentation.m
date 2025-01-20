@interface CKSendMenuPresentation
- (BOOL)hasRequestedKeyboardSnapshot;
- (CGRect)lastAnchorViewRectInWindow;
- (CKSceneOverlayPresentationContext)overlayPresentationContext;
- (CKSendMenuPopoverTransitioningDelegate)sendMenuTransitioningDelegate;
- (CKSendMenuPopoverViewController)popoverRootViewController;
- (CKSendMenuPresentation)initWithOverlayPresentationContext:(id)a3 presentingViewController:(id)a4 appCardContentViewController:(id)a5 appCardPresentationStyle:(unint64_t)a6 delegate:(id)a7;
- (CKSendMenuPresentation)initWithOverlayPresentationContext:(id)a3 presentingViewController:(id)a4 sendMenuViewController:(id)a5 delegate:(id)a6;
- (CKSendMenuPresentationDelegate)delegate;
- (CKSendMenuViewController)sendMenuViewController;
- (UIViewController)appCardContentViewController;
- (UIViewController)presentingViewController;
- (id)newPopoverLayoutMetrics;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)presentationState;
- (int64_t)presentationStyle;
- (unint64_t)appCardPresentationStyle;
- (void)__dismissPopoverPresentationAnimated:(BOOL)a3 completion:(id)a4;
- (void)_beginFullscreenPresentationWithCompletion:(id)a3;
- (void)_beginPopoverPresentationWithCompletion:(id)a3;
- (void)_delegateDidDismissSendMenu;
- (void)_dismissFullscreenPresentationAnimated:(BOOL)a3 completion:(id)a4;
- (void)_dismissPopoverPresentationAnimated:(BOOL)a3 completion:(id)a4;
- (void)_layoutFullScreenSendMenuView;
- (void)appCardDidAppearInSendMenuPopoverViewController:(id)a3;
- (void)beginPresentationWithCompletion:(id)a3;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)enforceSendMenuOrderingInWindowSubviews;
- (void)informSendMenuOfAnchorViewPositionChangeIfNecessary;
- (void)layout;
- (void)presentCardWithContentViewController:(id)a3 style:(unint64_t)a4 completion:(id)a5;
- (void)rePresentSendMenu;
- (void)removeSendMenuFromViewHierarchy;
- (void)requestDismissKeyboardSnapshotForSendMenuIfNeeded;
- (void)sendMenuPresentationController:(id)a3 didChangePopoverLayoutMetrics:(id)a4;
- (void)sendMenuPresentationControllerWantsToBeDismissed:(id)a3;
- (void)sendMenuPresentationControllerWillDismiss:(id)a3;
- (void)setAppCardContentViewController:(id)a3;
- (void)setAppCardPresentationStyle:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasRequestedKeyboardSnapshot:(BOOL)a3;
- (void)setLastAnchorViewRectInWindow:(CGRect)a3;
- (void)setOverlayPresentationContext:(id)a3;
- (void)setPopoverRootViewController:(id)a3;
- (void)setPresentationState:(int64_t)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSendMenuTransitioningDelegate:(id)a3;
- (void)setSendMenuViewController:(id)a3;
@end

@implementation CKSendMenuPresentation

- (CKSendMenuPresentation)initWithOverlayPresentationContext:(id)a3 presentingViewController:(id)a4 sendMenuViewController:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKSendMenuPresentation;
  v15 = [(CKSendMenuPresentation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_overlayPresentationContext, a3);
    objc_storeStrong((id *)&v16->_presentingViewController, a4);
    objc_storeStrong((id *)&v16->_sendMenuViewController, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    v16->_presentationState = 0;
  }

  return v16;
}

- (CKSendMenuPresentation)initWithOverlayPresentationContext:(id)a3 presentingViewController:(id)a4 appCardContentViewController:(id)a5 appCardPresentationStyle:(unint64_t)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CKSendMenuPresentation;
  v17 = [(CKSendMenuPresentation *)&v20 init];
  objc_super v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_overlayPresentationContext, a3);
    objc_storeStrong((id *)&v18->_presentingViewController, a4);
    objc_storeStrong((id *)&v18->_appCardContentViewController, a5);
    v18->_appCardPresentationStyle = a6;
    objc_storeWeak((id *)&v18->_delegate, v16);
    v18->_presentationState = 0;
  }

  return v18;
}

- (int64_t)presentationStyle
{
  return [(CKSceneOverlayPresentationContext *)self->_overlayPresentationContext presentationStyle];
}

- (void)beginPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_presentationState)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    self->_presentationState = 1;
    v6 = [(CKSendMenuPresentation *)self presentingViewController];
    v7 = [v6 traitCollection];

    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __58__CKSendMenuPresentation_beginPresentationWithCompletion___block_invoke;
    id v14 = &unk_1E5622330;
    id v15 = self;
    id v16 = v5;
    v8 = _Block_copy(&v11);
    v9 = [(CKSendMenuPresentation *)self overlayPresentationContext];
    uint64_t v10 = [v9 presentationStyle];

    if (v10)
    {
      if (v10 == 1) {
        [(CKSendMenuPresentation *)self _beginPopoverPresentationWithCompletion:v8];
      }
    }
    else
    {
      [(CKSendMenuPresentation *)self _beginFullscreenPresentationWithCompletion:v8];
    }
  }
}

uint64_t __58__CKSendMenuPresentation_beginPresentationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentationState:2];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_beginPopoverPresentationWithCompletion:(id)a3
{
  overlayPresentationContext = self->_overlayPresentationContext;
  id v5 = a3;
  id v28 = [(CKSceneOverlayPresentationContext *)overlayPresentationContext anchorView];
  v6 = objc_alloc_init(CKSendMenuPopoverTransitioningDelegate);
  [(CKSendMenuPresentation *)self setSendMenuTransitioningDelegate:v6];

  v7 = objc_alloc_init(CKSendMenuPopoverViewController);
  [(CKSendMenuPresentation *)self setPopoverRootViewController:v7];

  v8 = [(CKSendMenuPresentation *)self popoverRootViewController];
  [v8 setDelegate:self];

  sendMenuViewController = self->_sendMenuViewController;
  if (sendMenuViewController)
  {
    uint64_t v10 = sendMenuViewController;
    [(CKSendMenuViewController *)v10 updatePreferredContentSize];
    [(CKSendMenuViewController *)v10 preferredContentSize];
    double v12 = v11;
    double v14 = v13;

    id v15 = [(CKSendMenuPresentation *)self sendMenuViewController];
    id v16 = [v15 view];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:1];

    v17 = [(CKSendMenuPresentation *)self sendMenuViewController];
    objc_super v18 = [v17 view];
    [v18 setAutoresizingMask:0];

    v19 = [(CKSendMenuPresentation *)self sendMenuViewController];
    objc_super v20 = [v19 view];
    objc_msgSend(v20, "setFrame:", 0.0, 0.0, v12, v14);

    v21 = [(CKSendMenuPresentation *)self popoverRootViewController];
    v22 = [v21 view];
    objc_msgSend(v22, "setFrame:", 0.0, 0.0, v12, v14);
  }
  else
  {
    [(CKSceneOverlayPresentationContext *)self->_overlayPresentationContext willPresentAppCard];
  }
  v23 = [(CKSendMenuPresentation *)self sendMenuTransitioningDelegate];
  [(CKSendMenuPopoverViewController *)self->_popoverRootViewController setTransitioningDelegate:v23];

  [(CKSendMenuPopoverViewController *)self->_popoverRootViewController setModalPresentationStyle:4];
  v24 = [(CKSendMenuPopoverViewController *)self->_popoverRootViewController presentationController];
  v25 = [CKSendMenuPopoverPresentationControllerAnchorItem alloc];
  [v28 bounds];
  v26 = -[CKSendMenuPopoverPresentationControllerAnchorItem initWithView:rect:](v25, "initWithView:rect:", v28);
  [v24 setAnchorItem:v26];

  [v24 setDelegate:self];
  [v24 setSendMenuViewController:self->_sendMenuViewController];
  [v24 setAppCardContentViewController:self->_appCardContentViewController];
  if (self->_appCardContentViewController) {
    [v24 setAppCardPresentationStyle:self->_appCardPresentationStyle];
  }
  v27 = [(CKSendMenuPresentation *)self presentingViewController];
  [v27 presentViewController:self->_popoverRootViewController animated:1 completion:v5];
}

- (void)rePresentSendMenu
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Ignoring request to re-present send menu that has already been fully dismissed. The view is (probably) no longer in the view hierarchy.", v2, v3, v4, v5, v6);
}

- (void)_beginFullscreenPresentationWithCompletion:(id)a3
{
  p_delegate = &self->_delegate;
  objc_super v20 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained requestShowKeyboardSnapshotForSendMenu];

  self->_hasRequestedKeyboardSnapshot = 1;
  uint8_t v6 = [(UIViewController *)self->_presentingViewController view];
  v7 = [v6 window];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id v16 = [(CKSendMenuViewController *)self->_sendMenuViewController view];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  v17 = [(UIViewController *)self->_presentingViewController view];
  objc_super v18 = [v17 window];
  v19 = [(CKSendMenuViewController *)self->_sendMenuViewController view];
  [v18 addSubview:v19];

  v20[2]();
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_overlayPresentationContext)
  {
    if ((unint64_t)(self->_presentationState - 1) >= 2)
    {
      if (IMOSLoggingEnabled())
      {
        double v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int64_t presentationState = self->_presentationState;
          *(_DWORD *)location = 134217984;
          *(void *)&location[4] = presentationState;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Ignoring request to dismiss the send menu because the presentation state currently is: %li.", location, 0xCu);
        }
      }
    }
    else
    {
      self->_int64_t presentationState = 3;
      *(void *)location = 0;
      objc_initWeak((id *)location, self);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      double v14 = __53__CKSendMenuPresentation_dismissAnimated_completion___block_invoke;
      double v15 = &unk_1E5628220;
      objc_copyWeak(&v17, (id *)location);
      id v16 = v6;
      v7 = _Block_copy(&v12);
      double v8 = [(CKSendMenuPresentation *)self overlayPresentationContext];
      uint64_t v9 = [v8 presentationStyle];

      if (v9)
      {
        if (v9 == 1) {
          [(CKSendMenuPresentation *)self _dismissPopoverPresentationAnimated:v4 completion:v7];
        }
      }
      else
      {
        [(CKSendMenuPresentation *)self _dismissFullscreenPresentationAnimated:v4 completion:v7];
      }

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)location);
    }
  }
}

uint64_t __53__CKSendMenuPresentation_dismissAnimated_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setPresentationState:4];
    [WeakRetained _delegateDidDismissSendMenu];
    [WeakRetained setOverlayPresentationContext:0];
    [WeakRetained setSendMenuViewController:0];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)__dismissPopoverPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  popoverRootViewController = self->_popoverRootViewController;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__CKSendMenuPresentation___dismissPopoverPresentationAnimated_completion___block_invoke;
  v9[3] = &unk_1E5623828;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(CKSendMenuPopoverViewController *)popoverRootViewController dismissViewControllerAnimated:v4 completion:v9];
}

uint64_t __74__CKSendMenuPresentation___dismissPopoverPresentationAnimated_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) setSendMenuViewController:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setPopoverRootViewController:0];
}

- (void)_dismissPopoverPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3)
  {
    [(CKSendMenuPresentation *)self __dismissPopoverPresentationAnimated:1 completion:v6];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F42FF8];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__CKSendMenuPresentation__dismissPopoverPresentationAnimated_completion___block_invoke;
    v9[3] = &unk_1E5628248;
    v9[4] = self;
    char v11 = 0;
    id v10 = v6;
    [v8 _performWithoutDeferringTransitions:v9];
  }
}

uint64_t __73__CKSendMenuPresentation__dismissPopoverPresentationAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__dismissPopoverPresentationAnimated:completion:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)_dismissFullscreenPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  if (v4)
  {
    id v6 = [(CKSendMenuPresentation *)self sendMenuViewController];
    [v6 performFullScreenDismissAnimationWithCompletion:v8];

    v7 = v6;
  }
  else
  {
    [(CKSendMenuPresentation *)self removeSendMenuFromViewHierarchy];
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
    v7 = v8;
  }
}

- (void)removeSendMenuFromViewHierarchy
{
  [(CKSendMenuPresentation *)self requestDismissKeyboardSnapshotForSendMenuIfNeeded];
  uint64_t v3 = [(CKSendMenuPresentation *)self sendMenuViewController];
  BOOL v4 = [v3 view];
  [v4 removeFromSuperview];

  sendMenuViewController = self->_sendMenuViewController;

  [(CKSendMenuViewController *)sendMenuViewController setSendMenuViewControllerDelegate:0];
}

- (void)requestDismissKeyboardSnapshotForSendMenuIfNeeded
{
  if (self->_hasRequestedKeyboardSnapshot)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained requestDismissKeyboardSnapshotForSendMenu];

    self->_hasRequestedKeyboardSnapshot = 0;
  }
}

- (void)layout
{
  uint64_t v3 = [(CKSendMenuPresentation *)self overlayPresentationContext];
  uint64_t v4 = [v3 presentationStyle];

  if (!v4) {
    [(CKSendMenuPresentation *)self _layoutFullScreenSendMenuView];
  }

  [(CKSendMenuPresentation *)self informSendMenuOfAnchorViewPositionChangeIfNecessary];
}

- (void)informSendMenuOfAnchorViewPositionChangeIfNecessary
{
  id v20 = [(CKSceneOverlayPresentationContext *)self->_overlayPresentationContext anchorView];
  [v20 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  char v11 = [v20 window];
  objc_msgSend(v20, "convertRect:toView:", v11, v4, v6, v8, v10);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v22.origin.x = v13;
  v22.origin.y = v15;
  v22.size.width = v17;
  v22.size.height = v19;
  if (!CGRectEqualToRect(self->_lastAnchorViewRectInWindow, v22))
  {
    self->_lastAnchorViewRectInWindow.origin.x = v13;
    self->_lastAnchorViewRectInWindow.origin.y = v15;
    self->_lastAnchorViewRectInWindow.size.width = v17;
    self->_lastAnchorViewRectInWindow.size.height = v19;
    [(CKSendMenuPopoverViewController *)self->_popoverRootViewController anchorViewDidMove];
    [(CKSendMenuViewController *)self->_sendMenuViewController anchorViewDidMove];
  }
}

- (void)_layoutFullScreenSendMenuView
{
  id v14 = [(CKSendMenuPresentation *)self presentingViewController];
  double v3 = [v14 view];
  double v4 = [v3 window];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  CGFloat v13 = [(CKSendMenuViewController *)self->_sendMenuViewController view];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
}

- (void)_delegateDidDismissSendMenu
{
  [(CKSceneOverlayPresentationContext *)self->_overlayPresentationContext didDismissSendMenuPresentation];
  id v4 = [(CKSendMenuPresentation *)self delegate];
  double v3 = [(CKSendMenuPresentation *)self overlayPresentationContext];
  [v4 didDismissSendMenu:self usingPresentationContext:v3];
}

- (void)presentCardWithContentViewController:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  overlayPresentationContext = self->_overlayPresentationContext;
  id v9 = a5;
  id v10 = a3;
  [(CKSceneOverlayPresentationContext *)overlayPresentationContext willPresentAppCard];
  id v11 = [(CKSendMenuPopoverViewController *)self->_popoverRootViewController presentationController];
  [v11 presentCardWithContentViewController:v10 style:a4 completion:v9];
}

- (void)enforceSendMenuOrderingInWindowSubviews
{
  double v3 = [(CKSendMenuPresentation *)self overlayPresentationContext];
  uint64_t v4 = [v3 presentationStyle];

  if (!v4)
  {
    id v7 = [(UIViewController *)self->_presentingViewController view];
    double v5 = [v7 window];
    double v6 = [(CKSendMenuViewController *)self->_sendMenuViewController view];
    [v5 bringSubviewToFront:v6];
  }
}

- (id)newPopoverLayoutMetrics
{
  popoverRootViewController = self->_popoverRootViewController;
  if (!popoverRootViewController) {
    return 0;
  }
  double v3 = [(CKSendMenuPopoverViewController *)popoverRootViewController presentationController];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v4 = (void *)[v3 newPopoverLayoutMetrics];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)sendMenuPresentationControllerWantsToBeDismissed:(id)a3
{
  if (self->_presentationState == 2) {
    [(CKSendMenuPresentation *)self dismissAnimated:1 completion:0];
  }
}

- (void)sendMenuPresentationControllerWillDismiss:(id)a3
{
  [(CKSceneOverlayPresentationContext *)self->_overlayPresentationContext willDismissSendMenuPresentation];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sendMenuPresentationWillDismiss:self];
}

- (void)sendMenuPresentationController:(id)a3 didChangePopoverLayoutMetrics:(id)a4
{
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)appCardDidAppearInSendMenuPopoverViewController:(id)a3
{
}

- (CKSendMenuViewController)sendMenuViewController
{
  return self->_sendMenuViewController;
}

- (void)setSendMenuViewController:(id)a3
{
}

- (CKSceneOverlayPresentationContext)overlayPresentationContext
{
  return self->_overlayPresentationContext;
}

- (void)setOverlayPresentationContext:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIViewController)appCardContentViewController
{
  return self->_appCardContentViewController;
}

- (void)setAppCardContentViewController:(id)a3
{
}

- (unint64_t)appCardPresentationStyle
{
  return self->_appCardPresentationStyle;
}

- (void)setAppCardPresentationStyle:(unint64_t)a3
{
  self->_appCardPresentationStyle = a3;
}

- (CKSendMenuPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKSendMenuPresentationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_int64_t presentationState = a3;
}

- (CKSendMenuPopoverTransitioningDelegate)sendMenuTransitioningDelegate
{
  return self->_sendMenuTransitioningDelegate;
}

- (void)setSendMenuTransitioningDelegate:(id)a3
{
}

- (CKSendMenuPopoverViewController)popoverRootViewController
{
  return self->_popoverRootViewController;
}

- (void)setPopoverRootViewController:(id)a3
{
}

- (CGRect)lastAnchorViewRectInWindow
{
  double x = self->_lastAnchorViewRectInWindow.origin.x;
  double y = self->_lastAnchorViewRectInWindow.origin.y;
  double width = self->_lastAnchorViewRectInWindow.size.width;
  double height = self->_lastAnchorViewRectInWindow.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastAnchorViewRectInWindow:(CGRect)a3
{
  self->_lastAnchorViewRectInWindow = a3;
}

- (BOOL)hasRequestedKeyboardSnapshot
{
  return self->_hasRequestedKeyboardSnapshot;
}

- (void)setHasRequestedKeyboardSnapshot:(BOOL)a3
{
  self->_hasRequestedKeyboardSnapshot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverRootViewController, 0);
  objc_storeStrong((id *)&self->_sendMenuTransitioningDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appCardContentViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_overlayPresentationContext, 0);

  objc_storeStrong((id *)&self->_sendMenuViewController, 0);
}

@end