@interface CKFullScreenCardAppViewController
- (BOOL)_currentPluginIsJellyfish;
- (BOOL)_shouldShowDimmingView;
- (BOOL)canBecomeFirstResponder;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)inExpandedPresentation;
- (BOOL)inFullScreenModalPresentation;
- (BOOL)inTransition;
- (BOOL)isBusiness;
- (BOOL)isDismissing;
- (BOOL)isLoaded;
- (BOOL)isPrimaryViewController;
- (BOOL)isiMessage;
- (BOOL)mayBeKeptInViewHierarchy;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldDisableInsetsForGrabber;
- (BOOL)shouldDisableSnapshotView;
- (BOOL)shouldShowChatChrome;
- (BOOL)shouldSuppressEntryView;
- (BOOL)supportsQuickView;
- (BOOL)wantsDarkUI;
- (BOOL)wantsOpaqueUI;
- (CGRect)finalContentViewFrame;
- (CKBrowserViewControllerProtocol)contentViewController;
- (CKBrowserViewControllerSendDelegate)sendDelegate;
- (CKConversation)conversation;
- (CKDismissView)dismissView;
- (CKExpandedAppViewControllerDelegate)delegate;
- (CKFullScreenCardAppViewController)initWithBalloonPlugin:(id)a3;
- (CKFullScreenCardAppViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4;
- (CKFullScreenCardAppViewController)initWithConversation:(id)a3 plugin:(id)a4;
- (IMBalloonPlugin)balloonPlugin;
- (IMBalloonPluginDataSource)balloonPluginDataSource;
- (NSString)conversationID;
- (UIView)contentView;
- (UIViewController)presentationViewController;
- (UIViewControllerTransitioningDelegate)parentTransitioningDelegate;
- (id)inputAccessoryView;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)browserPresentationStyle;
- (int64_t)lastKnownDeviceOrientation;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_handleRemoteConnectionInterrupted:(id)a3;
- (void)_updateDimmingViewAlpha;
- (void)dealloc;
- (void)loadView;
- (void)setBalloonPluginDataSource:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setConversation:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissView:(id)a3;
- (void)setInTransition:(BOOL)a3;
- (void)setIsBusiness:(BOOL)a3;
- (void)setIsPrimaryViewController:(BOOL)a3;
- (void)setIsiMessage:(BOOL)a3;
- (void)setLastKnownDeviceOrientation:(int64_t)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setSendDelegate:(id)a3;
- (void)setShouldDisableSnapshotView:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation CKFullScreenCardAppViewController

- (CKFullScreenCardAppViewController)initWithConversation:(id)a3 plugin:(id)a4
{
  id v5 = a3;
  v6 = [(CKFullScreenCardAppViewController *)self init];
  v7 = v6;
  if (v6)
  {
    [(CKFullScreenCardAppViewController *)v6 setConversation:v5];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__handleRemoteConnectionInterrupted_ name:*MEMORY[0x1E4F6D348] object:0];
  }
  return v7;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)CKFullScreenCardAppViewController;
  [(CKFullScreenCardAppViewController *)&v5 loadView];
  v3 = [(CKFullScreenCardAppViewController *)self view];
  [v3 setBackgroundColor:0];

  v4 = [MEMORY[0x1E4F42948] currentDevice];
  -[CKFullScreenCardAppViewController setLastKnownDeviceOrientation:](self, "setLastKnownDeviceOrientation:", [v4 orientation]);
}

- (void)viewDidLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)CKFullScreenCardAppViewController;
  [(CKFullScreenCardAppViewController *)&v18 viewDidLayoutSubviews];
  v3 = [(CKFullScreenCardAppViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(CKFullScreenCardAppViewController *)self contentView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(CKFullScreenCardAppViewController *)self dismissView];
  [v13 setHidden:1];

  v14 = [(CKFullScreenCardAppViewController *)self contentView];
  v15 = [v14 superview];

  if (!v15)
  {
    v16 = [(CKFullScreenCardAppViewController *)self view];
    v17 = [(CKFullScreenCardAppViewController *)self contentView];
    [v16 addSubview:v17];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKFullScreenCardAppViewController;
  [(CKFullScreenCardAppViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKFullScreenCardAppViewController;
  [(CKFullScreenCardAppViewController *)&v7 viewDidDisappear:a3];
  [(CKFullScreenCardAppViewController *)self setEditing:0];
  double v4 = [(CKFullScreenCardAppViewController *)self contentViewController];
  char v5 = [v4 isDismissing];

  if ((v5 & 1) == 0)
  {
    double v6 = [(CKFullScreenCardAppViewController *)self contentViewController];
    [v6 dismiss];
  }
}

- (void)setContentViewController:(id)a3
{
  char v5 = (CKBrowserViewControllerProtocol *)a3;
  p_contentViewController = &self->_contentViewController;
  if (self->_contentViewController != v5)
  {
    double v11 = v5;
    -[CKFullScreenCardAppViewController removeChildViewController:](self, "removeChildViewController:");
    objc_super v7 = [(CKBrowserViewControllerProtocol *)*p_contentViewController view];
    [v7 removeFromSuperview];

    [(CKBrowserViewControllerProtocol *)*p_contentViewController didMoveToParentViewController:0];
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (v11)
    {
      if (objc_opt_respondsToSelector()) {
        [(CKBrowserViewControllerProtocol *)v11 browserScrolledOnScreen];
      }
      [(CKFullScreenCardAppViewController *)self addChildViewController:*p_contentViewController];
      double v8 = [(CKBrowserViewControllerProtocol *)*p_contentViewController view];
      [(CKFullScreenCardAppViewController *)self setContentView:v8];

      [(CKBrowserViewControllerProtocol *)*p_contentViewController didMoveToParentViewController:self];
      if (CKIsRunningInMessages())
      {
        BOOL v9 = [(CKFullScreenCardAppViewController *)self _currentPluginIsJellyfish];
        double v10 = [MEMORY[0x1E4F42738] sharedApplication];
        [v10 setIdleTimerDisabled:v9];
      }
    }
    [(CKFullScreenCardAppViewController *)self setNeedsStatusBarAppearanceUpdate];
    [(CKFullScreenCardAppViewController *)self reloadInputViews];
    char v5 = v11;
  }
}

- (void)setContentView:(id)a3
{
  char v5 = (UIView *)a3;
  contentView = self->_contentView;
  BOOL v9 = v5;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    objc_super v7 = [(CKFullScreenCardAppViewController *)self view];
    [v7 addSubview:v9];

    double v8 = [(CKFullScreenCardAppViewController *)self view];
    [v8 setNeedsLayout];
  }
}

- (CGRect)finalContentViewFrame
{
  objc_super v3 = [(CKFullScreenCardAppViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(CKFullScreenCardAppViewController *)self view];
  [v12 safeAreaInsets];
  double v14 = v5 + v13;

  v15 = [(CKFullScreenCardAppViewController *)self view];
  [v15 safeAreaInsets];
  double v17 = v16;
  objc_super v18 = [(CKFullScreenCardAppViewController *)self view];
  [v18 safeAreaInsets];
  double v20 = v9 - (v17 + v19);

  double v21 = v14;
  double v22 = v7;
  double v23 = v20;
  double v24 = v11;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  double v4 = [MEMORY[0x1E4F42738] sharedApplication];
  [v4 setIdleTimerDisabled:0];

  dismissView = self->_dismissView;
  if (dismissView) {
    [(CKDismissView *)dismissView setDelegate:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)CKFullScreenCardAppViewController;
  [(CKFullScreenCardAppViewController *)&v6 dealloc];
}

- (void)willMoveToParentViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setNavigationBarHidden:1 animated:0];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    return [(CKBrowserViewControllerProtocol *)contentViewController supportedInterfaceOrientations];
  }
  else
  {
    double v4 = +[CKUIBehavior sharedBehaviors];
    unint64_t v5 = [v4 supportedInterfaceOrientations];

    return v5;
  }
}

- (int64_t)preferredStatusBarStyle
{
  id v3 = [(CKFullScreenCardAppViewController *)self contentViewController];

  if (v3)
  {
    double v4 = [(CKFullScreenCardAppViewController *)self contentViewController];
    int64_t v5 = [v4 preferredStatusBarStyle];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKFullScreenCardAppViewController;
    return [(CKFullScreenCardAppViewController *)&v7 preferredStatusBarStyle];
  }
}

- (BOOL)prefersStatusBarHidden
{
  id v3 = [(CKFullScreenCardAppViewController *)self contentViewController];

  if (v3)
  {
    double v4 = [(CKFullScreenCardAppViewController *)self contentViewController];
    char v5 = [v4 prefersStatusBarHidden];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKFullScreenCardAppViewController;
    return [(CKFullScreenCardAppViewController *)&v7 prefersStatusBarHidden];
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4 = a4;
  char v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    int64_t v7 = 2 * ([v4 horizontalSizeClass] != 1);
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)inputAccessoryView
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(CKFullScreenCardAppViewController *)self contentViewController];
  char v3 = [v2 shouldShowChatChrome];

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CKFullScreenCardAppViewController;
  id v7 = a4;
  -[CKFullScreenCardAppViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__CKFullScreenCardAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E56257D8;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

uint64_t __88__CKFullScreenCardAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 orientation];

  uint64_t result = [*(id *)(a1 + 32) lastKnownDeviceOrientation];
  if (result != v3)
  {
    char v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) delegate];
      objc_msgSend(v7, "expandedAppViewControllerDidTransitionFromOrientation:toOrientation:", objc_msgSend(*(id *)(a1 + 32), "lastKnownDeviceOrientation"), v3);
    }
    [*(id *)(a1 + 32) setLastKnownDeviceOrientation:v3];
    double v8 = *(void **)(a1 + 32);
    return [v8 becomeFirstResponder];
  }
  return result;
}

- (BOOL)_currentPluginIsJellyfish
{
  v2 = [(CKFullScreenCardAppViewController *)self balloonPlugin];
  uint64_t v3 = [v2 identifier];
  id v4 = IMBalloonExtensionIDWithSuffix();
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)_updateDimmingViewAlpha
{
  if ([(CKFullScreenCardAppViewController *)self _shouldShowDimmingView]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = [(CKFullScreenCardAppViewController *)self dismissView];
  [v4 setAlpha:v3];
}

- (BOOL)_shouldShowDimmingView
{
  return 0;
}

- (CKBrowserViewControllerProtocol)contentViewController
{
  return self->_contentViewController;
}

- (CKExpandedAppViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKExpandedAppViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldDisableSnapshotView
{
  return self->_shouldDisableSnapshotView;
}

- (void)setShouldDisableSnapshotView:(BOOL)a3
{
  self->_shouldDisableSnapshotView = a3;
}

- (UIViewControllerTransitioningDelegate)parentTransitioningDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentTransitioningDelegate);

  return (UIViewControllerTransitioningDelegate *)WeakRetained;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CKDismissView)dismissView
{
  return self->_dismissView;
}

- (void)setDismissView:(id)a3
{
}

- (BOOL)inTransition
{
  return self->_inTransition;
}

- (void)setInTransition:(BOOL)a3
{
  self->_inTransition = a3;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (int64_t)lastKnownDeviceOrientation
{
  return self->_lastKnownDeviceOrientation;
}

- (void)setLastKnownDeviceOrientation:(int64_t)a3
{
  self->_lastKnownDeviceOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_dismissView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_parentTransitioningDelegate);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

- (BOOL)wantsDarkUI
{
  return 0;
}

- (BOOL)wantsOpaqueUI
{
  return 0;
}

- (BOOL)supportsQuickView
{
  return 0;
}

- (BOOL)mayBeKeptInViewHierarchy
{
  return 0;
}

- (BOOL)shouldSuppressEntryView
{
  return 0;
}

- (BOOL)shouldDisableInsetsForGrabber
{
  return 0;
}

- (BOOL)isDismissing
{
  return 0;
}

- (BOOL)isPrimaryViewController
{
  return [(CKBrowserViewControllerProtocol *)self->_contentViewController isPrimaryViewController];
}

- (void)setIsPrimaryViewController:(BOOL)a3
{
}

- (UIViewController)presentationViewController
{
  return (UIViewController *)[(CKBrowserViewControllerProtocol *)self->_contentViewController presentationViewController];
}

- (void)setPresentationViewController:(id)a3
{
}

- (CKBrowserViewControllerSendDelegate)sendDelegate
{
  return (CKBrowserViewControllerSendDelegate *)[(CKBrowserViewControllerProtocol *)self->_contentViewController sendDelegate];
}

- (void)setSendDelegate:(id)a3
{
}

- (IMBalloonPlugin)balloonPlugin
{
  return (IMBalloonPlugin *)[(CKBrowserViewControllerProtocol *)self->_contentViewController balloonPlugin];
}

- (IMBalloonPluginDataSource)balloonPluginDataSource
{
  return (IMBalloonPluginDataSource *)[(CKBrowserViewControllerProtocol *)self->_contentViewController balloonPluginDataSource];
}

- (void)setBalloonPluginDataSource:(id)a3
{
}

- (BOOL)shouldShowChatChrome
{
  return [(CKBrowserViewControllerProtocol *)self->_contentViewController shouldShowChatChrome];
}

- (BOOL)isiMessage
{
  return [(CKBrowserViewControllerProtocol *)self->_contentViewController isiMessage];
}

- (void)setIsiMessage:(BOOL)a3
{
}

- (BOOL)isBusiness
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  contentViewController = self->_contentViewController;

  return [(CKBrowserViewControllerProtocol *)contentViewController isBusiness];
}

- (void)setIsBusiness:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    contentViewController = self->_contentViewController;
    [(CKBrowserViewControllerProtocol *)contentViewController setIsBusiness:v3];
  }
}

- (NSString)conversationID
{
  return (NSString *)[(CKBrowserViewControllerProtocol *)self->_contentViewController conversationID];
}

- (void)setConversationID:(id)a3
{
}

- (int64_t)browserPresentationStyle
{
  return [(CKBrowserViewControllerProtocol *)self->_contentViewController browserPresentationStyle];
}

- (CKFullScreenCardAppViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[CKFullScreenCardAppViewController(CKBrowserViewControllerProtocol) initWithBalloonPlugin:dataSource:]", "CKFullScreenCardAppViewController.m", 367, "false");
}

- (CKFullScreenCardAppViewController)initWithBalloonPlugin:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CKFullScreenCardAppViewController(CKBrowserViewControllerProtocol) initWithBalloonPlugin:]", "CKFullScreenCardAppViewController.m", 371, "false");
}

- (BOOL)isLoaded
{
  return 0;
}

- (BOOL)inExpandedPresentation
{
  return 0;
}

- (BOOL)inFullScreenModalPresentation
{
  return 1;
}

- (void)_handleRemoteConnectionInterrupted:(id)a3
{
  id v12 = [a3 userInfo];
  id v4 = [v12 objectForKey:*MEMORY[0x1E4F6D340]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CKFullScreenCardAppViewController *)self contentViewController];
    id v6 = [v5 balloonPlugin];
    id v7 = [v6 identifier];

    if ([v7 isEqualToIgnoringCase:v4])
    {
      if (_IMWillLog())
      {
        double v11 = v7;
        _IMAlwaysLog();
      }
      double v8 = [(CKFullScreenCardAppViewController *)self sendDelegate];
      objc_super v9 = [(CKFullScreenCardAppViewController *)self balloonPlugin];
      double v10 = [v9 identifier];
      [v8 dismissAndReloadInputViews:1 forPlugin:v10];
    }
  }
}

@end