@interface CKExpandedAppViewController
- (BOOL)_currentPluginIsAppManager;
- (BOOL)_currentPluginIsAppStore;
- (BOOL)_currentPluginIsJellyfish;
- (BOOL)addsVerticalPaddingForStatusBar;
- (BOOL)canBecomeFirstResponder;
- (BOOL)fadesOutDuringStickerDrag;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)inDragAndDrop;
- (BOOL)inExpandedPresentation;
- (BOOL)inFullScreenModalPresentation;
- (BOOL)inTransition;
- (BOOL)isBusiness;
- (BOOL)isDismissing;
- (BOOL)isLoaded;
- (BOOL)isPrimaryViewController;
- (BOOL)isiMessage;
- (BOOL)mayBeKeptInViewHierarchy;
- (BOOL)shouldDisableInsetsForGrabber;
- (BOOL)shouldDisableSnapshotView;
- (BOOL)shouldShowChatChrome;
- (BOOL)shouldSuppressEntryView;
- (BOOL)supportsQuickView;
- (BOOL)usesDimmingView;
- (BOOL)wantsDarkUI;
- (BOOL)wantsOpaqueUI;
- (CGRect)finalContentViewFrame;
- (CGRect)initialBrowserFrame;
- (CGRect)leftRightSafeAreaInsetRect:(CGRect)a3;
- (CGRect)targetBrowserFrame;
- (CKBrowserViewControllerProtocol)contentViewController;
- (CKBrowserViewControllerSendDelegate)sendDelegate;
- (CKConversation)conversation;
- (CKDismissView)dismissView;
- (CKExpandedAppViewController)initWithBalloonPlugin:(id)a3;
- (CKExpandedAppViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4;
- (CKExpandedAppViewController)initWithConversation:(id)a3 plugin:(id)a4;
- (CKExpandedAppViewControllerDelegate)delegate;
- (CKFullScreenAppNavbarManager)navbarManager;
- (IMBalloonPlugin)balloonPlugin;
- (IMBalloonPluginDataSource)balloonPluginDataSource;
- (NSString)conversationID;
- (UIEdgeInsets)additionalSafeAreaInsets;
- (UIView)contentView;
- (UIViewController)presentationViewController;
- (double)collapseTargetOriginY;
- (double)topAreaHeight;
- (id)inputAccessoryView;
- (id)traitCollection;
- (int64_t)browserPresentationStyle;
- (int64_t)lastKnownDeviceOrientation;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)transitionDirection;
- (void)_configureTitleView;
- (void)_dismiss:(id)a3;
- (void)_dragBegan:(id)a3;
- (void)_dragEnded:(id)a3;
- (void)_updateDimmingViewAlpha;
- (void)addNewGrabberView;
- (void)animateBrowserViewFromSourceRect:(CGRect)a3 interactive:(BOOL)a4 grabberView:(id)a5 completion:(id)a6;
- (void)animateBrowserViewToTargetRect:(CGRect)a3 grabberView:(id)a4 completion:(id)a5;
- (void)appGrabberViewCloseButtonTapped:(id)a3;
- (void)collapse;
- (void)collapse:(id)a3;
- (void)collapseGestureTouchMoved:(id)a3;
- (void)dealloc;
- (void)dismiss;
- (void)hideDimmingView;
- (void)loadView;
- (void)reverseAndCleanupCollapseAnimator;
- (void)setAddsVerticalPaddingForStatusBar:(BOOL)a3;
- (void)setBalloonPluginDataSource:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setConversation:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissView:(id)a3;
- (void)setFadesOutDuringStickerDrag:(BOOL)a3;
- (void)setGrabberView:(id)a3;
- (void)setInDragAndDrop:(BOOL)a3;
- (void)setInTransition:(BOOL)a3;
- (void)setInitialBrowserFrame:(CGRect)a3;
- (void)setIsBusiness:(BOOL)a3;
- (void)setIsPrimaryViewController:(BOOL)a3;
- (void)setIsiMessage:(BOOL)a3;
- (void)setLastKnownDeviceOrientation:(int64_t)a3;
- (void)setNavbarManager:(id)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setSendDelegate:(id)a3;
- (void)setShouldDisableSnapshotView:(BOOL)a3;
- (void)setTargetBrowserFrame:(CGRect)a3;
- (void)setTransitionDirection:(unint64_t)a3;
- (void)setUsesDimmingView:(BOOL)a3;
- (void)setupPausedCollapseAnimatorIfNeeded;
- (void)updateGrabberTitleAndIconForPlugin:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation CKExpandedAppViewController

- (CKExpandedAppViewController)initWithConversation:(id)a3 plugin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CKExpandedAppViewController *)self init];
  v9 = v8;
  if (v8)
  {
    v8->_addsVerticalPaddingForStatusBar = 1;
    v8->_usesDimmingView = 1;
    [(CKExpandedAppViewController *)v8 setConversation:v6];
    v10 = [CKFullScreenAppNavbarManager alloc];
    v11 = [(CKExpandedAppViewController *)v9 conversation];
    v12 = [(CKFullScreenAppNavbarManager *)v10 initWithConversation:v11 plugin:v7];
    [(CKExpandedAppViewController *)v9 setNavbarManager:v12];

    v13 = [(CKExpandedAppViewController *)v9 navbarManager];
    [v13 setDelegate:v9];

    v14 = [(CKExpandedAppViewController *)v9 navbarManager];
    v15 = [v14 dismissButton];
    [v15 addTarget:v9 action:sel_collapse_ forEvents:64];

    v16 = [(CKExpandedAppViewController *)v9 navbarManager];
    v17 = [v16 appIconButton];
    [v17 addTarget:v9 action:sel__openParentApp_ forEvents:64];

    [(CKExpandedAppViewController *)v9 _configureTitleView];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v9 selector:sel__dragBegan_ name:@"CKBrowserDragManagerDidStartDraggingNotification" object:0];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v9 selector:sel__dragEnded_ name:@"CKBrowserDragManagerDidEndDraggingNotification" object:0];
  }
  return v9;
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)CKExpandedAppViewController;
  [(CKExpandedAppViewController *)&v12 loadView];
  v3 = [(CKExpandedAppViewController *)self view];
  [v3 setBackgroundColor:0];

  v4 = objc_alloc_init(CKDismissView);
  [(CKExpandedAppViewController *)self setDismissView:v4];

  v5 = [(CKExpandedAppViewController *)self dismissView];
  id v6 = +[CKUIBehavior sharedBehaviors];
  id v7 = [v6 theme];
  v8 = [v7 fullscreenAppDismissViewColor];
  [v5 setBackgroundColor:v8];

  v9 = [(CKExpandedAppViewController *)self view];
  v10 = [(CKExpandedAppViewController *)self dismissView];
  [v9 addSubview:v10];

  v11 = [MEMORY[0x1E4F42948] currentDevice];
  -[CKExpandedAppViewController setLastKnownDeviceOrientation:](self, "setLastKnownDeviceOrientation:", [v11 orientation]);
}

- (void)viewDidLayoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)CKExpandedAppViewController;
  [(CKExpandedAppViewController *)&v35 viewDidLayoutSubviews];
  v3 = [(CKExpandedAppViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (![(CKExpandedAppViewController *)self inTransition]
    && ![(CKExpandedAppViewController *)self inDragAndDrop])
  {
    BOOL v12 = [(CKExpandedAppViewController *)self _currentPluginIsAppManager];
    v13 = [(CKExpandedAppViewController *)self contentView];
    v14 = v13;
    if (v12)
    {
      objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

      v15 = [(CKExpandedAppViewController *)self dismissView];
      v16 = v15;
      uint64_t v17 = 1;
    }
    else
    {
      [(CKExpandedAppViewController *)self finalContentViewFrame];
      objc_msgSend(v14, "setFrame:");

      v36.origin.x = v5;
      v36.origin.y = v7;
      v36.size.width = v9;
      v36.size.height = v11;
      double Width = CGRectGetWidth(v36);
      [(CKExpandedAppViewController *)self topAreaHeight];
      -[CKExpandedAppViewController leftRightSafeAreaInsetRect:](self, "leftRightSafeAreaInsetRect:", 0.0, 0.0, Width, v19);
      -[CKAppGrabberView setFrame:](self->_grabberView, "setFrame:");
      v15 = [(CKExpandedAppViewController *)self dismissView];
      v16 = v15;
      uint64_t v17 = 0;
    }
    [v15 setHidden:v17];

    v20 = [(CKExpandedAppViewController *)self contentView];
    v21 = [v20 superview];

    if (!v21)
    {
      v22 = [(CKExpandedAppViewController *)self view];
      v23 = [(CKExpandedAppViewController *)self contentView];
      [v22 addSubview:v23];
    }
    v24 = [(CKExpandedAppViewController *)self dismissView];
    objc_msgSend(v24, "setFrame:", v5, v7, v9, v11);

    [(CKExpandedAppViewController *)self _updateDimmingViewAlpha];
    v25 = [(CKExpandedAppViewController *)self view];
    [v25 bringSubviewToFront:self->_grabberView];

    v26 = [(CKExpandedAppViewController *)self view];
    v27 = [(CKExpandedAppViewController *)self dismissView];
    [v26 sendSubviewToBack:v27];
  }
  v28 = [(CKExpandedAppViewController *)self navbarManager];
  v29 = [v28 dismissButton];

  [v29 bounds];
  double v30 = CGRectGetWidth(v37);
  v31 = [v29 imageView];
  [v31 bounds];
  double v32 = v30 - CGRectGetWidth(v38);

  uint64_t v33 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  double v34 = v32 * 0.5 + 5.0;
  if (v33) {
    double v34 = 0.0;
  }
  objc_msgSend(v29, "setImageEdgeInsets:", 0.0, v34);
}

- (id)traitCollection
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CKExpandedAppViewController;
  v2 = [(CKExpandedAppViewController *)&v8 traitCollection];
  if (CKIsRunningInCameraAppsClient())
  {
    v3 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
    double v4 = (void *)MEMORY[0x1E4F42F80];
    v9[0] = v2;
    v9[1] = v3;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v6 = [v4 traitCollectionWithTraitsFromCollections:v5];

    v2 = (void *)v6;
  }

  return v2;
}

- (void)addNewGrabberView
{
  grabberView = self->_grabberView;
  if (grabberView) {
    [(CKAppGrabberView *)grabberView removeFromSuperview];
  }
  double v4 = objc_alloc_init(CKAppGrabberView);
  double v5 = self->_grabberView;
  self->_grabberView = v4;

  [(CKAppGrabberView *)self->_grabberView setDelegate:self];
  [(CKAppGrabberView *)self->_grabberView setAutoresizingMask:34];
  [(CKAppGrabberView *)self->_grabberView setShowsAppTitle:1];
  uint64_t v6 = [(CKExpandedAppViewController *)self view];
  [v6 addSubview:self->_grabberView];

  if ([(CKExpandedAppViewController *)self fadesOutDuringStickerDrag])
  {
    double v7 = self->_grabberView;
    [(CKAppGrabberView *)v7 setShowsGrabberPill:0];
  }
}

- (double)topAreaHeight
{
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 browserSwitcherExpandedGrabberHeaderHeight];
  double v5 = v4;

  if ([(CKExpandedAppViewController *)self addsVerticalPaddingForStatusBar])
  {
    uint64_t v6 = [(CKExpandedAppViewController *)self view];
    _UISheetMinimumTopInset();
    double v5 = v5 + v7;
  }
  return v5;
}

- (void)setContentViewController:(id)a3
{
  v14 = (CKBrowserViewControllerProtocol *)a3;
  double v5 = [(CKExpandedAppViewController *)self view];
  [v5 setAlpha:1.0];

  uint64_t v6 = v14;
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  if (contentViewController != v14)
  {
    [(CKBrowserViewControllerProtocol *)contentViewController willMoveToParentViewController:0];
    double v9 = [(CKBrowserViewControllerProtocol *)*p_contentViewController view];
    [v9 removeFromSuperview];

    [(CKBrowserViewControllerProtocol *)*p_contentViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (v14)
    {
      if (objc_opt_respondsToSelector()) {
        [(CKBrowserViewControllerProtocol *)v14 browserScrolledOnScreen];
      }
      [(CKExpandedAppViewController *)self addChildViewController:*p_contentViewController];
      double v10 = [(CKBrowserViewControllerProtocol *)*p_contentViewController view];
      [(CKExpandedAppViewController *)self setContentView:v10];

      [(CKBrowserViewControllerProtocol *)*p_contentViewController didMoveToParentViewController:self];
      if (CKIsRunningInMessages())
      {
        BOOL v11 = [(CKExpandedAppViewController *)self _currentPluginIsJellyfish];
        BOOL v12 = [MEMORY[0x1E4F42738] sharedApplication];
        [v12 setIdleTimerDisabled:v11];
      }
    }
    v13 = [(CKExpandedAppViewController *)self balloonPlugin];
    [(CKExpandedAppViewController *)self updateGrabberTitleAndIconForPlugin:v13];

    [(CKExpandedAppViewController *)self setNeedsStatusBarAppearanceUpdate];
    [(CKExpandedAppViewController *)self reloadInputViews];
    uint64_t v6 = v14;
  }
}

- (void)updateGrabberTitleAndIconForPlugin:(id)a3
{
  id v9 = a3;
  if ([v9 showInBrowser])
  {
    double v4 = [v9 browserDisplayName];
    double v5 = [(CKExpandedAppViewController *)self traitCollection];
    uint64_t v6 = objc_msgSend(v9, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

    grabberView = self->_grabberView;
    objc_super v8 = [v9 identifier];
    [(CKAppGrabberView *)grabberView updateAppTitle:v4 icon:v6 appIdentifier:v8];
  }
  else
  {
    [(CKAppGrabberView *)self->_grabberView updateAppTitle:0 icon:0 appIdentifier:0];
  }
}

- (void)setContentView:(id)a3
{
  double v5 = (UIView *)a3;
  contentView = self->_contentView;
  double v10 = v5;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    double v7 = [(CKExpandedAppViewController *)self view];
    [v7 addSubview:v10];

    objc_super v8 = [(CKExpandedAppViewController *)self view];
    [v8 setNeedsLayout];

    id v9 = [(CKExpandedAppViewController *)self view];
    [v9 layoutIfNeeded];
  }
}

- (CGRect)finalContentViewFrame
{
  v3 = [(CKExpandedAppViewController *)self view];
  [v3 bounds];
  -[CKExpandedAppViewController leftRightSafeAreaInsetRect:](self, "leftRightSafeAreaInsetRect:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(CKExpandedAppViewController *)self topAreaHeight];
  double v13 = v7 + v12;
  double v14 = v11 - (v12 + 0.0);
  double v15 = v5 + 0.0;
  double v16 = v9;
  result.size.height = v14;
  result.size.width = v16;
  result.origin.y = v13;
  result.origin.x = v15;
  return result;
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)leftRightSafeAreaInsetRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(CKExpandedAppViewController *)self view];
  [v7 safeAreaInsets];
  double v9 = v8;
  double v11 = v10;

  double v12 = x + v9;
  double v13 = y + 0.0;
  double v14 = width - (v9 + v11);
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)animateBrowserViewFromSourceRect:(CGRect)a3 interactive:(BOOL)a4 grabberView:(id)a5 completion:(id)a6
{
  double y = a3.origin.y;
  id v9 = a5;
  id v10 = a6;
  double v11 = [(CKExpandedAppViewController *)self view];
  double v12 = [(CKExpandedAppViewController *)self contentView];
  double v13 = [v12 superview];

  if (!v13)
  {
    double v14 = [(CKExpandedAppViewController *)self view];
    [v14 addSubview:v12];
  }
  double v15 = [(CKExpandedAppViewController *)self view];
  [v15 bounds];
  double v17 = v16;
  CGFloat v60 = v18;
  CGFloat v61 = v16;
  double v19 = v18;
  double v21 = v20;
  CGFloat v58 = v22;
  CGFloat v59 = v20;
  double v23 = v22;

  -[CKExpandedAppViewController leftRightSafeAreaInsetRect:](self, "leftRightSafeAreaInsetRect:", v17, v19, v21, v23);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  [(CKExpandedAppViewController *)self finalContentViewFrame];
  double v31 = v30;
  double v62 = v32;
  double v63 = v30;
  double v34 = v33;
  double v35 = v32;
  double v37 = v36;
  -[CKExpandedAppViewController setInitialBrowserFrame:](self, "setInitialBrowserFrame:", v25, y, v27, v29);
  double v38 = v31;
  double v39 = v34;
  -[CKExpandedAppViewController setTargetBrowserFrame:](self, "setTargetBrowserFrame:", v38, v34, v35, v37);
  [(CKExpandedAppViewController *)self setInTransition:1];
  [(CKExpandedAppViewController *)self setTransitionDirection:1];
  objc_msgSend(v12, "setFrame:", v25, y, v27, v29);
  v85.origin.double y = v60;
  v85.origin.double x = v61;
  v85.size.CGFloat height = v58;
  v85.size.double width = v59;
  double Width = CGRectGetWidth(v85);
  [(CKExpandedAppViewController *)self topAreaHeight];
  -[CKExpandedAppViewController leftRightSafeAreaInsetRect:](self, "leftRightSafeAreaInsetRect:", 0.0, 0.0, Width, v41);
  objc_msgSend(v9, "setFrame:");
  [v11 addSubview:v9];
  [v9 setDelegate:self];
  objc_storeStrong((id *)&self->_grabberView, a5);
  v42 = [[CKImmediatePanGestureRecognizer alloc] initWithTarget:self action:sel_collapseGestureTouchMoved_];
  collapseGestureTracker = self->_collapseGestureTracker;
  self->_collapseGestureTracker = v42;

  [(CKImmediatePanGestureRecognizer *)self->_collapseGestureTracker setDelegate:self];
  [(CKImmediatePanGestureRecognizer *)self->_collapseGestureTracker setDelaysTouchesEnded:0];
  [(CKImmediatePanGestureRecognizer *)self->_collapseGestureTracker setCancelsTouchesInView:0];
  [(CKImmediatePanGestureRecognizer *)self->_collapseGestureTracker setDelaysTouchesBegan:0];
  [v11 addGestureRecognizer:self->_collapseGestureTracker];
  v44 = [(CKExpandedAppViewController *)self dismissView];
  [v44 setAlpha:0.0];

  [(CKAppGrabberView *)self->_grabberView frame];
  double v46 = v45;
  uint64_t v48 = v47;
  double v50 = v49;
  double v52 = v51;
  [(CKExpandedAppViewController *)self topAreaHeight];
  -[CKAppGrabberView setFrame:](self->_grabberView, "setFrame:", v46, y - v53, v50, v52);
  v54 = (void *)MEMORY[0x1E4F42FF0];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __99__CKExpandedAppViewController_animateBrowserViewFromSourceRect_interactive_grabberView_completion___block_invoke;
  v73[3] = &unk_1E5628168;
  double v77 = v63;
  double v78 = v39;
  double v79 = v62;
  double v80 = v37;
  id v74 = v12;
  id v75 = v9;
  double v81 = v46;
  uint64_t v82 = v48;
  double v83 = v50;
  double v84 = v52;
  v76 = self;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __99__CKExpandedAppViewController_animateBrowserViewFromSourceRect_interactive_grabberView_completion___block_invoke_2;
  v65[3] = &unk_1E5628190;
  double v69 = v63;
  double v70 = v39;
  double v71 = v62;
  double v72 = v37;
  id v66 = v74;
  v67 = self;
  id v68 = v10;
  id v55 = v10;
  id v56 = v74;
  id v57 = v9;
  [v54 animateWithDuration:0 delay:v73 usingSpringWithDamping:v65 initialSpringVelocity:0.4 options:0.0 animations:1.0 completion:0.0];
}

void __99__CKExpandedAppViewController_animateBrowserViewFromSourceRect_interactive_grabberView_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  [*(id *)(a1 + 40) setRoundsTopCorners:1];
  [*(id *)(a1 + 40) setShowsAppTitle:1];
  if ([*(id *)(a1 + 48) _shouldShowDimmingView])
  {
    id v2 = [*(id *)(a1 + 48) dismissView];
    [v2 setAlpha:1.0];
  }
}

uint64_t __99__CKExpandedAppViewController_animateBrowserViewFromSourceRect_interactive_grabberView_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(a1 + 40) setInTransition:0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)animateBrowserViewToTargetRect:(CGRect)a3 grabberView:(id)a4 completion:(id)a5
{
  double y = a3.origin.y;
  double v8 = (CKAppGrabberView *)a4;
  id v9 = a5;
  [(CKExpandedAppViewController *)self setInTransition:1];
  [(CKExpandedAppViewController *)self setTransitionDirection:2];
  id v10 = [(CKExpandedAppViewController *)self contentViewController];
  double v11 = [v10 view];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = [(CKExpandedAppViewController *)self contentView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[CKExpandedAppViewController setInitialBrowserFrame:](self, "setInitialBrowserFrame:", v13, v15, v17, v19);
  -[CKExpandedAppViewController setTargetBrowserFrame:](self, "setTargetBrowserFrame:", v13, y, v17, v19);
  [(CKAppGrabberView *)self->_grabberView frame];
  -[CKAppGrabberView setFrame:](v8, "setFrame:");
  [(CKAppGrabberView *)self->_grabberView removeFromSuperview];
  grabberView = self->_grabberView;
  self->_grabberView = v8;
  double v22 = v8;

  double v23 = [(CKExpandedAppViewController *)self view];
  [v23 addSubview:v22];

  [(CKAppGrabberView *)self->_grabberView removeGestureRecognizer:self->_collapseGestureTracker];
  [(CKExpandedAppViewController *)self setupPausedCollapseAnimatorIfNeeded];
  collapsePropertyAnimator = self->_collapsePropertyAnimator;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__CKExpandedAppViewController_animateBrowserViewToTargetRect_grabberView_completion___block_invoke;
  v27[3] = &unk_1E5622D10;
  id v28 = v9;
  id v25 = v9;
  [(UIViewPropertyAnimator *)collapsePropertyAnimator addCompletion:v27];
  id v26 = objc_alloc_init(MEMORY[0x1E4F42E18]);
  [(UIViewPropertyAnimator *)self->_collapsePropertyAnimator continueAnimationWithTimingParameters:v26 durationFactor:1.0];
}

uint64_t __85__CKExpandedAppViewController_animateBrowserViewToTargetRect_grabberView_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)hideDimmingView
{
  id v2 = [(CKExpandedAppViewController *)self dismissView];
  [v2 setAlpha:0.0];
}

- (void)_configureTitleView
{
  v23[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(CKExpandedAppViewController *)self navbarManager];
  double v4 = [v3 canvasView];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v6 = v5;
  double v7 = objc_opt_new();
  [v7 setHideTrailingBarButtons:1];
  [v7 setHideStandardTitle:1];
  [v7 setHideLeadingBarButtons:1];
  [v7 setHideBackButton:1];
  [v7 setHeight:v6];
  [v7 addSubview:v4];
  double v8 = [(CKExpandedAppViewController *)self navigationItem];
  [v8 setTitleView:v7];

  double v17 = (void *)MEMORY[0x1E4F28DC8];
  double v22 = [v4 leadingAnchor];
  double v21 = [v7 leadingAnchor];
  double v20 = [v22 constraintEqualToAnchor:v21];
  v23[0] = v20;
  double v19 = [v4 trailingAnchor];
  double v18 = [v7 trailingAnchor];
  id v9 = [v19 constraintEqualToAnchor:v18];
  v23[1] = v9;
  id v10 = [v4 topAnchor];
  double v11 = [v7 topAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  v23[2] = v12;
  double v13 = [v4 bottomAnchor];
  double v14 = [v7 bottomAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  v23[3] = v15;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  [v17 activateConstraints:v16];
}

- (void)appGrabberViewCloseButtonTapped:(id)a3
{
  id v3 = [(CKExpandedAppViewController *)self sendDelegate];
  [v3 dismissAndReloadInputViews:1];
}

- (double)collapseTargetOriginY
{
  id v3 = [(CKExpandedAppViewController *)self view];
  [v3 bounds];
  double MaxY = CGRectGetMaxY(v19);

  double v5 = [(CKExpandedAppViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 expandedAppViewControllerCollapsedContentHeight:self];
    double v7 = v6;
    double v8 = [(CKExpandedAppViewController *)self delegate];
    if (objc_opt_respondsToSelector() & 1) != 0 && ([v8 shouldAlwaysShowAppTitle])
    {
      id v9 = +[CKUIBehavior sharedBehaviors];
      [v9 browserSwitcherExpandedGrabberHeaderHeight];
    }
    else
    {
      id v9 = +[CKUIBehavior sharedBehaviors];
      [v9 browserSwitcherCollapsedGrabberHeaderHeight];
    }
    double v11 = v10;

    double v12 = +[CKUIBehavior sharedBehaviors];
    [v12 browserSwitcherExpandedGrabberHeaderHeight];
    double v14 = v13 - v11;

    double MaxY = MaxY - (v7 + v14);
    double v15 = +[CKUIBehavior sharedBehaviors];
    int v16 = [v15 isAppStripInKeyboard];

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E4F42B08], "__ck_appStripVerticalPadding");
      double MaxY = MaxY + v17;
    }
  }
  return MaxY;
}

- (void)setupPausedCollapseAnimatorIfNeeded
{
  if (!self->_collapsePropertyAnimator)
  {
    [(CKExpandedAppViewController *)self collapseTargetOriginY];
    uint64_t v4 = v3;
    double v5 = self->_grabberView;
    double v6 = [(CKExpandedAppViewController *)self contentView];
    double v7 = [(CKExpandedAppViewController *)self dismissView];
    BOOL v8 = [(CKAppGrabberView *)v5 roundsTopCorners];
    id v9 = objc_alloc(MEMORY[0x1E4F43008]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66__CKExpandedAppViewController_setupPausedCollapseAnimatorIfNeeded__block_invoke;
    v22[3] = &unk_1E5625118;
    double v10 = v5;
    uint64_t v27 = v4;
    double v23 = v10;
    double v24 = self;
    id v11 = v6;
    id v25 = v11;
    id v12 = v7;
    id v26 = v12;
    double v13 = (UIViewPropertyAnimator *)[v9 initWithDuration:v22 dampingRatio:0.25 animations:1.0];
    collapsePropertyAnimator = self->_collapsePropertyAnimator;
    self->_collapsePropertyAnimator = v13;

    id location = 0;
    objc_initWeak(&location, self);
    double v15 = self->_collapsePropertyAnimator;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__CKExpandedAppViewController_setupPausedCollapseAnimatorIfNeeded__block_invoke_2;
    v17[3] = &unk_1E56281B8;
    objc_copyWeak(&v19, &location);
    int v16 = v10;
    double v18 = v16;
    BOOL v20 = v8;
    [(UIViewPropertyAnimator *)v15 addCompletion:v17];
    [(UIViewPropertyAnimator *)self->_collapsePropertyAnimator pauseAnimation];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __66__CKExpandedAppViewController_setupPausedCollapseAnimatorIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  [*(id *)(a1 + 32) visualOriginYInView:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v3, *(double *)(a1 + 64) - v8, v5, v7);
  [*(id *)(a1 + 32) setRoundsTopCorners:0];
  id v17 = [*(id *)(a1 + 40) delegate];
  char v9 = objc_opt_respondsToSelector();
  uint64_t v10 = 0;
  if (v9) {
    uint64_t v10 = objc_msgSend(v17, "shouldAlwaysShowAppTitle", 0);
  }
  [*(id *)(a1 + 32) setShowsAppTitle:v10];
  [*(id *)(a1 + 48) frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [*(id *)(a1 + 32) frame];
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", v12, CGRectGetMaxY(v19), v14, v16);
  [*(id *)(a1 + 56) setAlpha:0.0];
}

void __66__CKExpandedAppViewController_setupPausedCollapseAnimatorIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v6 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = (void *)WeakRetained[124];
    WeakRetained[124] = 0;

    WeakRetained = v6;
  }
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) setRoundsTopCorners:*(unsigned __int8 *)(a1 + 48)];
    WeakRetained = v6;
  }
}

- (void)reverseAndCleanupCollapseAnimator
{
  [(UIViewPropertyAnimator *)self->_collapsePropertyAnimator setReversed:1];
  collapsePropertyAnimator = self->_collapsePropertyAnimator;

  [(UIViewPropertyAnimator *)collapsePropertyAnimator startAnimation];
}

- (void)setGrabberView:(id)a3
{
}

- (void)collapseGestureTouchMoved:(id)a3
{
  id v23 = a3;
  if ([v23 state] == 1)
  {
    [(CKImmediatePanGestureRecognizer *)self->_collapseGestureTracker locationInView:self->_grabberView];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    [(CKAppGrabberView *)self->_grabberView bounds];
    v25.double x = v5;
    v25.double y = v7;
    if (CGRectContainsPoint(v26, v25))
    {
      self->_shouldDoCollapseInteraction = 1;
      self->_collapseGestureStartingLocation.double x = v5;
      self->_collapseGestureStartingLocation.double y = v7;
    }
  }
  if (self->_shouldDoCollapseInteraction)
  {
    uint64_t v8 = [v23 state];
    switch(v8)
    {
      case 3:
        self->_shouldDoCollapseInteraction = 0;
        collapseGestureTracker = self->_collapseGestureTracker;
        CGRect v19 = [(CKExpandedAppViewController *)self view];
        [(CKImmediatePanGestureRecognizer *)collapseGestureTracker translationInView:v19];
        double v21 = v20;

        if (self->_collapseInteractionDidMove && v21 <= 50.0) {
          [(CKExpandedAppViewController *)self reverseAndCleanupCollapseAnimator];
        }
        else {
          [(CKExpandedAppViewController *)self collapse];
        }
        self->_collapseInteractionDidMove = 0;
        break;
      case 2:
        char v9 = self->_collapseGestureTracker;
        uint64_t v10 = [(CKExpandedAppViewController *)self view];
        [(CKImmediatePanGestureRecognizer *)v9 translationInView:v10];
        double v12 = v11;
        double v14 = v13;

        [(CKExpandedAppViewController *)self collapseTargetOriginY];
        [(UIViewPropertyAnimator *)self->_collapsePropertyAnimator setFractionComplete:v14 / (v15 - self->_collapseGestureStartingLocation.y)];
        if (v14 > 2.0 || v12 > 2.0) {
          self->_collapseInteractionDidMove = 1;
        }
        [(UIViewPropertyAnimator *)self->_collapsePropertyAnimator fractionComplete];
        if (v17 >= 1.0) {
          [(CKImmediatePanGestureRecognizer *)self->_collapseGestureTracker finishCurrentInteraction];
        }
        break;
      case 1:
        self->_collapseInteractionDidMove = 0;
        [(CKExpandedAppViewController *)self setupPausedCollapseAnimatorIfNeeded];
        break;
      default:
        self->_collapseInteractionDidMove = 0;
        if (self->_shouldDoCollapseInteraction)
        {
          self->_shouldDoCollapseInteraction = 0;
          [(CKExpandedAppViewController *)self reverseAndCleanupCollapseAnimator];
        }
        break;
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6 = (CKImmediatePanGestureRecognizer *)a3;
  id v7 = a4;
  BOOL v10 = 1;
  if (self->_collapseGestureTracker == v6)
  {
    uint64_t v8 = [(CKAppGrabberView *)self->_grabberView closeButton];
    [v7 locationInView:v8];
    char v9 = objc_msgSend(v8, "pointInside:withEvent:", 0);

    if (v9) {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)collapse:(id)a3
{
  double v4 = [(CKExpandedAppViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKExpandedAppViewController *)self delegate];
    [v6 expandedAppViewControllerWantsToCollapse:self];
  }
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  double v4 = [MEMORY[0x1E4F42738] sharedApplication];
  [v4 setIdleTimerDisabled:0];

  dismissView = self->_dismissView;
  if (dismissView) {
    [(CKDismissView *)dismissView setDelegate:0];
  }
  [(CKFullScreenAppNavbarManager *)self->_navbarManager setDelegate:0];
  [(UIViewPropertyAnimator *)self->_collapsePropertyAnimator stopAnimation:1];
  v6.receiver = self;
  v6.super_class = (Class)CKExpandedAppViewController;
  [(CKExpandedAppViewController *)&v6 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKExpandedAppViewController;
  [(CKExpandedAppViewController *)&v4 viewWillAppear:a3];
  [(CKExpandedAppViewController *)self becomeFirstResponder];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKExpandedAppViewController;
  [(CKExpandedAppViewController *)&v8 viewDidAppear:a3];
  objc_super v4 = [(CKExpandedAppViewController *)self contentViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    objc_super v6 = [(CKExpandedAppViewController *)self contentViewController];
    id v7 = [(CKExpandedAppViewController *)self contentView];
    [v6 setDragTargetView:v7];
  }
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
    objc_super v4 = +[CKUIBehavior sharedBehaviors];
    unint64_t v5 = [v4 supportedInterfaceOrientations];

    return v5;
  }
}

- (int64_t)preferredStatusBarStyle
{
  id v3 = [(CKExpandedAppViewController *)self contentViewController];

  if (v3)
  {
    objc_super v4 = [(CKExpandedAppViewController *)self contentViewController];
    int64_t v5 = [v4 preferredStatusBarStyle];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKExpandedAppViewController;
    return [(CKExpandedAppViewController *)&v7 preferredStatusBarStyle];
  }
}

- (void)_dragBegan:(id)a3
{
  [(CKExpandedAppViewController *)self setInDragAndDrop:1];
  if ([(CKExpandedAppViewController *)self fadesOutDuringStickerDrag])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__CKExpandedAppViewController__dragBegan___block_invoke;
    aBlock[3] = &unk_1E5620C40;
    aBlock[4] = self;
    objc_super v4 = _Block_copy(aBlock);
  }
  else
  {
    int64_t v5 = [(CKExpandedAppViewController *)self contentView];
    objc_super v6 = [(CKExpandedAppViewController *)self view];
    [v6 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    v38.origin.double x = v8;
    v38.origin.double y = v10;
    v38.size.double width = v12;
    v38.size.CGFloat height = v14;
    double MaxY = CGRectGetMaxY(v38);
    [(CKExpandedAppViewController *)self topAreaHeight];
    double v17 = MaxY + v16;
    [(CKAppGrabberView *)self->_grabberView frame];
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    [(CKExpandedAppViewController *)self topAreaHeight];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __42__CKExpandedAppViewController__dragBegan___block_invoke_2;
    v26[3] = &unk_1E56281E0;
    CGFloat v29 = v8;
    double v30 = v17;
    CGFloat v31 = v12;
    CGFloat v32 = v14;
    id v27 = v5;
    id v28 = self;
    uint64_t v33 = v19;
    double v34 = v17 - v24;
    uint64_t v35 = v21;
    uint64_t v36 = v23;
    id v25 = v5;
    objc_super v4 = _Block_copy(v26);
  }
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v4 options:0 animations:0.3 completion:0.3];
}

void __42__CKExpandedAppViewController__dragBegan___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

uint64_t __42__CKExpandedAppViewController__dragBegan___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v2 = [*(id *)(a1 + 40) dismissView];
  [v2 setAlpha:0.0];

  double v3 = *(double *)(a1 + 80);
  double v4 = *(double *)(a1 + 88);
  int64_t v5 = *(void **)(*(void *)(a1 + 40) + 976);
  double v6 = *(double *)(a1 + 96);
  double v7 = *(double *)(a1 + 104);

  return objc_msgSend(v5, "setFrame:", v3, v4, v6, v7);
}

- (void)_dragEnded:(id)a3
{
  double v4 = [a3 userInfo];
  int64_t v5 = [v4 objectForKeyedSubscript:@"CKBrowserDragManagerDidEndDragSuccessKey"];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    id v20 = [(CKExpandedAppViewController *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v20 expandedAppViewControllerShouldDismissOnDragSuccess:self])
    {
      double v7 = [(CKExpandedAppViewController *)self sendDelegate];
      [v7 dismissAndReloadInputViews:1];

      return;
    }
  }
  if ([(CKExpandedAppViewController *)self fadesOutDuringStickerDrag])
  {
    CGFloat v8 = 0;
  }
  else
  {
    double v9 = [(CKExpandedAppViewController *)self contentView];
    [(CKExpandedAppViewController *)self finalContentViewFrame];
    double x = v34.origin.x;
    CGFloat y = v34.origin.y;
    double width = v34.size.width;
    double height = v34.size.height;
    double MaxY = CGRectGetMaxY(v34);
    [(CKExpandedAppViewController *)self topAreaHeight];
    objc_msgSend(v9, "setFrame:", x, MaxY + v15, width, height);
    [(CKAppGrabberView *)self->_grabberView frame];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__CKExpandedAppViewController__dragEnded___block_invoke;
    aBlock[3] = &unk_1E56281E0;
    double v25 = x;
    CGFloat v26 = y;
    double v27 = width;
    double v28 = height;
    id v23 = v9;
    double v24 = self;
    uint64_t v29 = v16;
    uint64_t v30 = 0;
    uint64_t v31 = v17;
    uint64_t v32 = v18;
    id v19 = v9;
    CGFloat v8 = _Block_copy(aBlock);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__CKExpandedAppViewController__dragEnded___block_invoke_2;
  v21[3] = &unk_1E5620BF0;
  v21[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v8 options:v21 animations:0.3 completion:0.3];
}

uint64_t __42__CKExpandedAppViewController__dragEnded___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if ([*(id *)(a1 + 40) _shouldShowDimmingView])
  {
    double v2 = [*(id *)(a1 + 40) dismissView];
    [v2 setAlpha:1.0];
  }
  double v3 = *(double *)(a1 + 80);
  double v4 = *(double *)(a1 + 88);
  int64_t v5 = *(void **)(*(void *)(a1 + 40) + 976);
  double v6 = *(double *)(a1 + 96);
  double v7 = *(double *)(a1 + 104);

  return objc_msgSend(v5, "setFrame:", v3, v4, v6, v7);
}

uint64_t __42__CKExpandedAppViewController__dragEnded___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInDragAndDrop:0];
}

- (id)inputAccessoryView
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  double v2 = [(CKExpandedAppViewController *)self contentViewController];
  char v3 = [v2 shouldShowChatChrome];

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CKExpandedAppViewController;
  id v7 = a4;
  -[CKExpandedAppViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__CKExpandedAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E56257D8;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

uint64_t __82__CKExpandedAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 orientation];

  uint64_t result = [*(id *)(a1 + 32) lastKnownDeviceOrientation];
  if (result != v3)
  {
    int64_t v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) delegate];
      objc_msgSend(v7, "expandedAppViewControllerDidTransitionFromOrientation:toOrientation:", objc_msgSend(*(id *)(a1 + 32), "lastKnownDeviceOrientation"), v3);
    }
    [*(id *)(a1 + 32) setLastKnownDeviceOrientation:v3];
    CGFloat v8 = *(void **)(a1 + 32);
    return [v8 becomeFirstResponder];
  }
  return result;
}

- (void)_updateDimmingViewAlpha
{
  if ([(CKExpandedAppViewController *)self _shouldShowDimmingView]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = [(CKExpandedAppViewController *)self dismissView];
  [v4 setAlpha:v3];
}

- (void)_dismiss:(id)a3
{
  id v3 = [(CKExpandedAppViewController *)self sendDelegate];
  [v3 requestPresentationStyleExpanded:0];
}

- (void)collapse
{
  id v2 = [(CKExpandedAppViewController *)self sendDelegate];
  [v2 requestPresentationStyleExpanded:0];
}

- (BOOL)_currentPluginIsAppStore
{
  id v2 = [(CKExpandedAppViewController *)self balloonPlugin];
  id v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F6CB80]];

  return v4;
}

- (BOOL)_currentPluginIsAppManager
{
  id v2 = [(CKExpandedAppViewController *)self balloonPlugin];
  id v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:@"com.apple.messages.browser.MorePlugin"];

  return v4;
}

- (BOOL)_currentPluginIsJellyfish
{
  id v2 = [(CKExpandedAppViewController *)self balloonPlugin];
  id v3 = [v2 identifier];
  char v4 = IMBalloonExtensionIDWithSuffix();
  char v5 = [v3 isEqualToString:v4];

  return v5;
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

- (BOOL)addsVerticalPaddingForStatusBar
{
  return self->_addsVerticalPaddingForStatusBar;
}

- (void)setAddsVerticalPaddingForStatusBar:(BOOL)a3
{
  self->_addsVerticalPaddingForStatusBar = a3;
}

- (BOOL)fadesOutDuringStickerDrag
{
  return self->_fadesOutDuringStickerDrag;
}

- (void)setFadesOutDuringStickerDrag:(BOOL)a3
{
  self->_fadesOutDuringStickerDrag = a3;
}

- (BOOL)usesDimmingView
{
  return self->_usesDimmingView;
}

- (void)setUsesDimmingView:(BOOL)a3
{
  self->_usesDimmingView = a3;
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

- (CKFullScreenAppNavbarManager)navbarManager
{
  return self->_navbarManager;
}

- (void)setNavbarManager:(id)a3
{
}

- (unint64_t)transitionDirection
{
  return self->_transitionDirection;
}

- (void)setTransitionDirection:(unint64_t)a3
{
  self->_transitionDirection = a3;
}

- (CGRect)initialBrowserFrame
{
  double x = self->_initialBrowserFrame.origin.x;
  double y = self->_initialBrowserFrame.origin.y;
  double width = self->_initialBrowserFrame.size.width;
  double height = self->_initialBrowserFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialBrowserFrame:(CGRect)a3
{
  self->_initialBrowserFrame = a3;
}

- (CGRect)targetBrowserFrame
{
  double x = self->_targetBrowserFrame.origin.x;
  double y = self->_targetBrowserFrame.origin.y;
  double width = self->_targetBrowserFrame.size.width;
  double height = self->_targetBrowserFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetBrowserFrame:(CGRect)a3
{
  self->_targetBrowserFrame = a3;
}

- (BOOL)inDragAndDrop
{
  return self->_inDragAndDrop;
}

- (void)setInDragAndDrop:(BOOL)a3
{
  self->_inDragAndDrop = a3;
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
  objc_storeStrong((id *)&self->_navbarManager, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_dismissView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_collapsePropertyAnimator, 0);
  objc_storeStrong((id *)&self->_collapseGestureTracker, 0);

  objc_storeStrong((id *)&self->_grabberView, 0);
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

- (CKExpandedAppViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[CKExpandedAppViewController(CKBrowserViewControllerProtocol) initWithBalloonPlugin:dataSource:]", "CKExpandedAppViewController.m", 876, "false");
}

- (CKExpandedAppViewController)initWithBalloonPlugin:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CKExpandedAppViewController(CKBrowserViewControllerProtocol) initWithBalloonPlugin:]", "CKExpandedAppViewController.m", 880, "false");
}

- (void)dismiss
{
  if ([(CKExpandedAppViewController *)self _currentPluginIsAppManager])
  {
    id v3 = [(CKExpandedAppViewController *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [(CKExpandedAppViewController *)self delegate];
      [v5 expandedAppViewControllerWantsToCollapse:self];
    }
  }

  [(CKExpandedAppViewController *)self _dismiss:0];
}

- (BOOL)isLoaded
{
  return 0;
}

- (BOOL)inExpandedPresentation
{
  return 1;
}

- (BOOL)inFullScreenModalPresentation
{
  return 0;
}

@end