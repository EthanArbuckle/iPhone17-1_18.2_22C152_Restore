@interface DBNotificationViewController
- (BNBannerController)bannerController;
- (BNBannerHostMonitor)bannerHostMonitor;
- (BNBannerSourceListener)bannerSourceListener;
- (BNContentViewController)bannerContentViewController;
- (BOOL)bannerSourceListener:(id)a3 recommendsSuspending:(BOOL)a4 forReason:(id)a5 revokingCurrent:(BOOL)a6 error:(id *)a7;
- (BOOL)bannerSourceListener:(id)a3 requestsPostingPresentable:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7;
- (BOOL)handleHomeEvent;
- (BOOL)invalidated;
- (BOOL)presentableIsOEMNotification:(id)a3;
- (BOOL)shouldFenceAnimationsForPresentable:(id)a3;
- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 locationForTouch:(id)a5 inView:(id)a6;
- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 translationInView:(id)a5;
- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 velocityInView:(id)a5;
- (DBBannerAuthority)bannerAuthority;
- (DBEnvironment)environment;
- (DBNotificationViewController)initWithEnvironment:(id)a3 carManager:(id)a4 displayID:(id)a5 delegate:(id)a6;
- (DBNotificationViewControllerDelegate)delegate;
- (FBScene)visibleNotificationScene;
- (NSMutableSet)suspensionReasons;
- (NSString)screenBorrowingPresentableRequestID;
- (UITapGestureRecognizer)tapDismissGestureRecognizer;
- (_TtC9DashBoard27DBOEMNotificationController)oemNotificationController;
- (double)notificationHeight;
- (id)_layoutDescriptionWithBounds:(CGRect)a3 preferredSize:(CGSize)a4 layoutManager:(id)a5;
- (id)_layoutManager;
- (id)bannerSourceListener:(id)a3 layoutDescriptionWithError:(id *)a4;
- (id)bannerSourceListener:(id)a3 requestsRevokingPresentablesWithIdentification:(id)a4 reason:(id)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8;
- (id)defaultTransitioningDelegateForPresenter:(id)a3;
- (id)panGestureRecognizerForPresenter:(id)a3;
- (id)sceneSpecificationForBannerSourceListener:(id)a3;
- (id)screenBorrowToken;
- (void)_performCancelTapGesture:(id)a3;
- (void)dealloc;
- (void)handleHomeEvent;
- (void)handleTransitionFromFrame:(CGRect)a3 toFrame:(CGRect)a4;
- (void)invalidate;
- (void)loadView;
- (void)oemNotificationControllerRequestsDismissing:(id)a3;
- (void)oemNotificationControllerRequestsPresenting:(id)a3;
- (void)presenter:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5 userInfo:(id)a6;
- (void)presenter:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5 userInfo:(id)a6;
- (void)presenter:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5;
- (void)presenterRelinquishesVisibility:(id)a3;
- (void)presenterRequestsVisibility:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setScreenBorrowToken:(id)a3;
- (void)setScreenBorrowingPresentableRequestID:(id)a3;
- (void)setSuspended:(BOOL)a3 cancellingCurrent:(BOOL)a4 forReason:(id)a5;
- (void)setSuspended:(BOOL)a3 forReason:(id)a4;
- (void)setSuspensionReasons:(id)a3;
@end

@implementation DBNotificationViewController

- (DBNotificationViewController)initWithEnvironment:(id)a3 carManager:(id)a4 displayID:(id)a5 delegate:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v40.receiver = self;
  v40.super_class = (Class)DBNotificationViewController;
  v12 = [(DBNotificationViewController *)&v40 init];
  if (v12)
  {
    v13 = DBLogForCategory(0x11uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_INFO, "Initializing notification view controller...", buf, 2u);
    }

    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeWeak((id *)&v12->_environment, v9);
    v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.Maps", @"com.apple.CarPlayTemplateUIHost", @"com.apple.springboard", 0);
    id v15 = objc_alloc(MEMORY[0x263F29B38]);
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_environment);
    v17 = [WeakRetained environmentConfiguration];
    v18 = [v17 displayConfiguration];
    uint64_t v19 = [v15 initWithServiceDomain:@"com.apple.CarPlay" displayConfiguration:v18 authorizedBundleIDs:v14];
    bannerSourceListener = v12->_bannerSourceListener;
    v12->_bannerSourceListener = (BNBannerSourceListener *)v19;

    [(BNBannerSourceListener *)v12->_bannerSourceListener setDelegate:v12];
    id v21 = objc_alloc(MEMORY[0x263F29B18]);
    v22 = [MEMORY[0x263F2B9C0] defaultShellMachName];
    uint64_t v23 = [v21 initWithMachName:v22];
    bannerHostMonitor = v12->_bannerHostMonitor;
    v12->_bannerHostMonitor = (BNBannerHostMonitor *)v23;

    [(BNBannerHostMonitor *)v12->_bannerHostMonitor activate];
    v25 = (BNContentViewController *)objc_alloc_init(MEMORY[0x263F29B40]);
    bannerContentViewController = v12->_bannerContentViewController;
    v12->_bannerContentViewController = v25;

    [(BNContentViewController *)v12->_bannerContentViewController setDelegate:v12];
    v27 = [(BNContentViewController *)v12->_bannerContentViewController layoutManager];
    v28 = objc_alloc_init(DBBannerAuthority);
    bannerAuthority = v12->_bannerAuthority;
    v12->_bannerAuthority = v28;

    uint64_t v30 = [objc_alloc(MEMORY[0x263F29B10]) initWithAuthority:v12->_bannerAuthority pender:0 presenter:v12->_bannerContentViewController];
    bannerController = v12->_bannerController;
    v12->_bannerController = (BNBannerController *)v30;

    v32 = [_TtC9DashBoard27DBOEMNotificationController alloc];
    v33 = [(DBNotificationViewController *)v12 environment];
    uint64_t v34 = [(DBOEMNotificationController *)v32 initWithDisplayID:v10 delegate:v12 environment:v33];
    oemNotificationController = v12->_oemNotificationController;
    v12->_oemNotificationController = (_TtC9DashBoard27DBOEMNotificationController *)v34;

    uint64_t v36 = objc_opt_new();
    suspensionReasons = v12->_suspensionReasons;
    v12->_suspensionReasons = (NSMutableSet *)v36;
  }
  return v12;
}

- (void)dealloc
{
  [(BNBannerHostMonitor *)self->_bannerHostMonitor deactivate];
  v3.receiver = self;
  v3.super_class = (Class)DBNotificationViewController;
  [(DBNotificationViewController *)&v3 dealloc];
}

- (FBScene)visibleNotificationScene
{
  v2 = [(DBNotificationViewController *)self bannerContentViewController];
  objc_super v3 = [v2 topPresentables];
  v4 = [v3 lastObject];

  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 scene];
  }
  else
  {
    v5 = 0;
  }

  return (FBScene *)v5;
}

- (BOOL)presentableIsOEMNotification:(id)a3
{
  id v4 = a3;
  v5 = [(DBNotificationViewController *)self oemNotificationController];
  char v6 = [v5 isOEMPresentedNotification:v4];

  return v6;
}

- (double)notificationHeight
{
  v2 = [(DBNotificationViewController *)self bannerContentViewController];
  objc_super v3 = [v2 topPresentables];
  id v4 = [v3 firstObject];
  v5 = [v4 viewController];

  if (v5)
  {
    [v5 preferredContentSize];
    double v7 = fmax(v6, 61.0);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (BOOL)handleHomeEvent
{
  objc_super v3 = [(DBNotificationViewController *)self bannerContentViewController];
  id v4 = [v3 topPresentables];
  uint64_t v5 = [v4 count];

  if (!v5) {
    return 0;
  }
  double v6 = [(DBNotificationViewController *)self bannerContentViewController];
  double v7 = [v6 topPresentables];
  v8 = [v7 lastObject];

  if ([(DBNotificationViewController *)self presentableIsOEMNotification:v8]
    && ([v8 isTouchOutsideDismissalEnabled] & 1) == 0)
  {
    id v9 = DBLogForCategory(0x11uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(DBNotificationViewController *)v9 handleHomeEvent];
    }
    BOOL v21 = 0;
  }
  else
  {
    id v9 = [MEMORY[0x263F29B50] uniqueIdentificationForPresentable:v8];
    id v10 = [(DBNotificationViewController *)self bannerController];
    uint64_t v11 = *MEMORY[0x263F313F0];
    id v30 = 0;
    v12 = [v10 revokePresentablesWithIdentification:v9 reason:v11 options:0 animated:1 userInfo:0 error:&v30];
    id v13 = v30;

    if (!v12)
    {
      v14 = DBLogForCategory(0x11uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(DBNotificationViewController *)(uint64_t)v13 handleHomeEvent];
      }
    }
    BOOL v21 = 1;
  }

  return v21;
}

- (void)handleTransitionFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  id v13 = objc_alloc_init(MEMORY[0x263F83148]);
  v14 = [(DBNotificationViewController *)self view];
  [v13 _setContainerView:v14];

  uint64_t v15 = [(DBNotificationViewController *)self bannerContentViewController];
  [v13 _setToViewController:v15];

  objc_msgSend(v13, "_setToStartFrame:", v11, v10, v9, v8);
  objc_msgSend(v13, "_setToEndFrame:", x, y, width, height);
  [v13 _setIsAnimated:0];
  uint64_t v16 = [v13 _transitionCoordinator];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __66__DBNotificationViewController_handleTransitionFromFrame_toFrame___block_invoke;
  v19[3] = &unk_2649B5588;
  v19[4] = self;
  [v16 animateAlongsideTransition:v19 completion:0];

  uint64_t v17 = [(DBNotificationViewController *)self bannerContentViewController];
  uint64_t v18 = [v13 _transitionCoordinator];
  objc_msgSend(v17, "viewWillTransitionToSize:withTransitionCoordinator:", v18, width, height);

  objc_msgSend(v13, "__runAlongsideAnimations");
}

void __66__DBNotificationViewController_handleTransitionFromFrame_toFrame___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)loadView
{
  v42[4] = *MEMORY[0x263EF8340];
  objc_super v3 = [DBNotificationView alloc];
  id v4 = -[DBNotificationView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(DBNotificationViewController *)self setView:v4];
  uint64_t v5 = [(DBNotificationViewController *)self bannerContentViewController];
  [(DBNotificationViewController *)self addChildViewController:v5];

  double v6 = [(DBNotificationViewController *)self bannerContentViewController];
  double v7 = [v6 view];
  [(DBNotificationView *)v4 addSubview:v7];

  double v8 = [(DBNotificationViewController *)self bannerContentViewController];
  [v8 didMoveToParentViewController:self];

  double v9 = [(DBNotificationViewController *)self bannerContentViewController];
  double v10 = [v9 view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v31 = (void *)MEMORY[0x263F08938];
  objc_super v40 = [(DBNotificationViewController *)self bannerContentViewController];
  v39 = [v40 view];
  v38 = [v39 leadingAnchor];
  double v11 = v4;
  v37 = [(DBNotificationView *)v4 leadingAnchor];
  uint64_t v36 = [v38 constraintEqualToAnchor:v37];
  v42[0] = v36;
  v35 = [(DBNotificationViewController *)self bannerContentViewController];
  uint64_t v34 = [v35 view];
  v33 = [v34 trailingAnchor];
  v32 = [(DBNotificationView *)v4 trailingAnchor];
  id v30 = [v33 constraintEqualToAnchor:v32];
  v42[1] = v30;
  v29 = [(DBNotificationViewController *)self bannerContentViewController];
  uint64_t v28 = [v29 view];
  v12 = [v28 topAnchor];
  v41 = v4;
  id v13 = [(DBNotificationView *)v4 topAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v42[2] = v14;
  uint64_t v15 = [(DBNotificationViewController *)self bannerContentViewController];
  uint64_t v16 = [v15 view];
  uint64_t v17 = [v16 bottomAnchor];
  uint64_t v18 = [(DBNotificationView *)v11 bottomAnchor];
  uint64_t v19 = [v17 constraintEqualToAnchor:v18];
  v42[3] = v19;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  [v31 activateConstraints:v20];

  BOOL v21 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__performCancelTapGesture_];
  tapDismissGestureRecognizer = self->_tapDismissGestureRecognizer;
  self->_tapDismissGestureRecognizer = v21;

  [(UITapGestureRecognizer *)self->_tapDismissGestureRecognizer setCancelsTouchesInView:0];
  [(UITapGestureRecognizer *)self->_tapDismissGestureRecognizer setAllowedTouchTypes:&unk_26E17F038];
  [(UITapGestureRecognizer *)self->_tapDismissGestureRecognizer setEnabled:0];
  uint64_t v23 = [MEMORY[0x263F83118] sharedInstance];
  uint64_t v24 = self->_tapDismissGestureRecognizer;
  uint64_t v25 = [(DBNotificationViewController *)self environment];
  uint64_t v26 = [v25 environmentConfiguration];
  uint64_t v27 = [v26 displayIdentity];
  [v23 addGestureRecognizer:v24 toDisplayWithIdentity:v27];
}

- (id)bannerSourceListener:(id)a3 layoutDescriptionWithError:(id *)a4
{
  uint64_t v5 = [(DBNotificationViewController *)self _layoutManager];
  uint64_t v14 = 4;
  long long v15 = xmmword_22D86F1C0;
  __asm { FMOV            V0.2D, #8.0 }
  long long v16 = _Q0;
  long long v17 = xmmword_22D86F1D0;
  uint64_t v18 = 0;
  [v5 setLayoutInfoV2:&v14];
  double v11 = [(DBNotificationViewController *)self view];
  [v11 bounds];
  v12 = -[DBNotificationViewController _layoutDescriptionWithBounds:preferredSize:layoutManager:](self, "_layoutDescriptionWithBounds:preferredSize:layoutManager:", v5);

  return v12;
}

- (BOOL)bannerSourceListener:(id)a3 requestsPostingPresentable:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7
{
  id v11 = a6;
  id v12 = a4;
  id v13 = [(DBNotificationViewController *)self bannerController];
  LOBYTE(a7) = [v13 postPresentable:v12 withOptions:a5 userInfo:v11 error:a7];

  return (char)a7;
}

- (id)bannerSourceListener:(id)a3 requestsRevokingPresentablesWithIdentification:(id)a4 reason:(id)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8
{
  BOOL v9 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  long long v16 = [(DBNotificationViewController *)self bannerController];
  long long v17 = [v16 revokePresentablesWithIdentification:v15 reason:v14 options:0 animated:v9 userInfo:v13 error:a8];

  return v17;
}

- (BOOL)bannerSourceListener:(id)a3 recommendsSuspending:(BOOL)a4 forReason:(id)a5 revokingCurrent:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v11 = a5;
  id v12 = [(DBNotificationViewController *)self bannerController];
  LOBYTE(a7) = [v12 setSuspended:v9 forReason:v11 revokingCurrent:v8 error:a7];

  return (char)a7;
}

- (id)sceneSpecificationForBannerSourceListener:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F29B28], "specification", a3);
}

- (id)defaultTransitioningDelegateForPresenter:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x263F31358]);
  return v3;
}

- (id)panGestureRecognizerForPresenter:(id)a3
{
  return 0;
}

- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 locationForTouch:(id)a5 inView:(id)a6
{
  double v6 = *MEMORY[0x263F00148];
  double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 velocityInView:(id)a5
{
  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 translationInView:(id)a5
{
  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (void)presenterRequestsVisibility:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = DBLogForCategory(0x11uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Banner presenter %@ requests visibility. Enabling tap-dismiss gesture", (uint8_t *)&v7, 0xCu);
  }

  double v6 = [(DBNotificationViewController *)self tapDismissGestureRecognizer];
  [v6 setEnabled:1];
}

- (void)presenterRelinquishesVisibility:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = DBLogForCategory(0x11uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Banner presenter %@ relinquishes visibility. Disabling tap-dismiss gesture", (uint8_t *)&v7, 0xCu);
  }

  double v6 = [(DBNotificationViewController *)self tapDismissGestureRecognizer];
  [v6 setEnabled:0];
}

- (void)presenter:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  double v6 = [(DBNotificationViewController *)self _layoutManager];
  uint64_t v14 = 4;
  long long v15 = xmmword_22D86F1C0;
  __asm { FMOV            V0.2D, #8.0 }
  long long v16 = _Q0;
  long long v17 = xmmword_22D86F1D0;
  uint64_t v18 = 0;
  [v6 setLayoutInfoV2:&v14];
  id v12 = [(DBNotificationViewController *)self bannerSourceListener];
  BSRectWithSize();
  id v13 = -[DBNotificationViewController _layoutDescriptionWithBounds:preferredSize:layoutManager:](self, "_layoutDescriptionWithBounds:preferredSize:layoutManager:", v6);
  [v12 layoutDescriptionDidChange:v13];
}

- (BOOL)shouldFenceAnimationsForPresentable:(id)a3
{
  return 0;
}

- (void)presenter:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5 userInfo:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a4;
  uint64_t v10 = *MEMORY[0x263F31408];
  id v11 = a5;
  id v12 = [a6 objectForKey:v10];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v12 BOOLValue])
  {
    id v13 = DBLogForCategory(0x11uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v9 requestIdentifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v14;
      _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Borrowing screen for notification: %{public}@", buf, 0xCu);
    }
    long long v15 = [(DBNotificationViewController *)self environment];
    long long v16 = [v15 environmentConfiguration];
    long long v17 = [v16 session];
    uint64_t v18 = [v17 borrowScreenForClient:@"CarPlayApp" reason:@"Notifications"];
    [(DBNotificationViewController *)self setScreenBorrowToken:v18];

    uint64_t v19 = [v9 requestIdentifier];
    [(DBNotificationViewController *)self setScreenBorrowingPresentableRequestID:v19];
  }
  uint64_t v20 = DBLogForCategory(0x11uLL);
  if (os_signpost_enabled(v20))
  {
    BOOL v21 = [v9 requestIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v21;
    _os_signpost_emit_with_name_impl(&dword_22D6F0000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DBNotificationPresentAnimation", "Start present animation for notification: %{public}@", buf, 0xCu);
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __100__DBNotificationViewController_presenter_willPresentPresentable_withTransitionCoordinator_userInfo___block_invoke;
  v24[3] = &unk_2649B5588;
  id v25 = v9;
  id v22 = v9;
  [v11 animateAlongsideTransition:0 completion:v24];

  uint64_t v23 = [(DBNotificationViewController *)self delegate];
  [v23 willPresentPresentable:v22 forNotificationViewController:self];
}

void __100__DBNotificationViewController_presenter_willPresentPresentable_withTransitionCoordinator_userInfo___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = DBLogForCategory(0x11uLL);
  if (os_signpost_enabled(v2))
  {
    id v3 = [*(id *)(a1 + 32) requestIdentifier];
    int v4 = 138543362;
    double v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_22D6F0000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DBNotificationPresentAnimation", "End present animation for notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)presenter:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5 userInfo:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = DBLogForCategory(0x11uLL);
  if (os_signpost_enabled(v10))
  {
    id v11 = [v8 requestIdentifier];
    *(_DWORD *)buf = 138543362;
    id v22 = v11;
    _os_signpost_emit_with_name_impl(&dword_22D6F0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DBNotificationDismissAnimation", "Start dismiss animation for notification: %{public}@", buf, 0xCu);
  }
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  long long v17 = __100__DBNotificationViewController_presenter_willDismissPresentable_withTransitionCoordinator_userInfo___block_invoke;
  uint64_t v18 = &unk_2649B6E70;
  uint64_t v19 = self;
  id v20 = v8;
  id v12 = v8;
  [v9 animateAlongsideTransition:0 completion:&v15];

  id v13 = [(DBNotificationViewController *)self delegate];
  [v13 didDismissPresentable:v12 forNotificationViewController:self];

  uint64_t v14 = [(DBNotificationViewController *)self oemNotificationController];
  [v14 didDismissNotification:v12];
}

void __100__DBNotificationViewController_presenter_willDismissPresentable_withTransitionCoordinator_userInfo___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) screenBorrowingPresentableRequestID];
  id v3 = [*(id *)(a1 + 40) requestIdentifier];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    double v5 = DBLogForCategory(0x11uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 40) requestIdentifier];
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Unborrowing screen for notification: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [*(id *)(a1 + 32) setScreenBorrowToken:0];
    [*(id *)(a1 + 32) setScreenBorrowingPresentableRequestID:0];
  }
  int v7 = DBLogForCategory(0x11uLL);
  if (os_signpost_enabled(v7))
  {
    id v8 = [*(id *)(a1 + 40) requestIdentifier];
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_signpost_emit_with_name_impl(&dword_22D6F0000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DBNotificationDismissAnimation", "End dismiss animation for notification: %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)invalidate
{
  [(DBNotificationViewController *)self setInvalidated:1];
  id v3 = [(DBNotificationViewController *)self bannerContentViewController];
  int v4 = [v3 allPresentables];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__DBNotificationViewController_invalidate__block_invoke;
  v6[3] = &unk_2649B6E98;
  v6[4] = self;
  [v4 enumerateObjectsUsingBlock:v6];

  double v5 = [(DBNotificationViewController *)self bannerSourceListener];
  [v5 invalidate];

  [(BNBannerHostMonitor *)self->_bannerHostMonitor deactivate];
}

void __42__DBNotificationViewController_invalidate__block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [MEMORY[0x263F29B50] uniqueIdentificationForPresentable:a2];
  id v3 = [*(id *)(a1 + 32) bannerContentViewController];
  id v4 = (id)[v3 dismissPresentablesWithIdentification:v5 reason:*MEMORY[0x263F313F8] userInfo:0];
}

- (void)setSuspended:(BOOL)a3 forReason:(id)a4
{
}

- (void)setSuspended:(BOOL)a3 cancellingCurrent:(BOOL)a4 forReason:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a5;
  int v9 = [(DBNotificationViewController *)self bannerContentViewController];
  uint64_t v10 = [v9 topPresentables];
  uint64_t v11 = [v10 lastObject];

  if (v11
    && [(DBNotificationViewController *)self presentableIsOEMNotification:v11]
    && ([v11 isTouchOutsideDismissalEnabled] & 1) == 0)
  {
    long long v17 = DBLogForCategory(0x11uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[DBNotificationViewController setSuspended:cancellingCurrent:forReason:](v17, v25, v26, v27, v28, v29, v30, v31);
    }
  }
  else
  {
    id v12 = [(DBNotificationViewController *)self suspensionReasons];
    id v13 = v12;
    if (v6) {
      [v12 addObject:v8];
    }
    else {
      [v12 removeObject:v8];
    }

    uint64_t v14 = DBLogForCategory(0x11uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(DBNotificationViewController *)self suspensionReasons];
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v15;
      _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "[Notifications] Updating suspension reasons: %@", buf, 0xCu);
    }
    bannerController = self->_bannerController;
    id v32 = 0;
    [(BNBannerController *)bannerController setSuspended:v6 forReason:v8 revokingCurrent:v5 error:&v32];
    long long v17 = v32;
    if (v17)
    {
      uint64_t v18 = DBLogForCategory(0x11uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[DBNotificationViewController setSuspended:cancellingCurrent:forReason:]((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }
}

- (void)oemNotificationControllerRequestsPresenting:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DBNotificationViewController *)self _layoutManager];
  [(DBOEMNotificationController *)self->_oemNotificationController sideInsetsForActiveNotification];
  uint64_t v7 = v6;
  [(DBOEMNotificationController *)self->_oemNotificationController sideInsetsForActiveNotification];
  v25[0] = 4;
  v25[1] = 0;
  v25[2] = v7;
  v25[3] = 0x4020000000000000;
  v25[4] = v8;
  int64x2_t v26 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  uint64_t v27 = 0;
  [v5 setLayoutInfoV2:v25];
  int v9 = [(DBNotificationViewController *)self view];
  [v9 bounds];
  uint64_t v10 = -[DBNotificationViewController _layoutDescriptionWithBounds:preferredSize:layoutManager:](self, "_layoutDescriptionWithBounds:preferredSize:layoutManager:", v5);

  uint64_t v11 = [v4 viewController];
  id v12 = [v4 viewController];
  [v10 presentationSize];
  double v14 = v13;
  double v16 = v15;
  [v10 containerSize];
  objc_msgSend(v12, "preferredContentSizeWithPresentationSize:containerSize:", v14, v16, v17, v18);
  objc_msgSend(v11, "setPreferredContentSize:");

  uint64_t v19 = [(DBNotificationViewController *)self bannerController];
  id v24 = 0;
  int v20 = [v19 postPresentable:v4 withOptions:1 userInfo:MEMORY[0x263EFFA78] error:&v24];
  id v21 = v24;

  if (!v20 || v21)
  {
    uint64_t v22 = DBLogForCategory(0x11uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[DBNotificationViewController oemNotificationControllerRequestsPresenting:](v4);
    }

    uint64_t v23 = [(DBNotificationViewController *)self oemNotificationController];
    [v23 didDismissNotification:v4];
  }
}

- (void)oemNotificationControllerRequestsDismissing:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263F29B50] uniqueIdentificationForPresentable:v4];
  uint64_t v6 = [(DBNotificationViewController *)self bannerController];
  id v11 = 0;
  uint64_t v7 = [v6 revokePresentablesWithIdentification:v5 reason:@"oemDismissed" options:0 animated:1 userInfo:MEMORY[0x263EFFA78] error:&v11];
  id v8 = v11;

  if ([v7 count]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    uint64_t v10 = DBLogForCategory(0x11uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DBNotificationViewController oemNotificationControllerRequestsDismissing:](v4);
    }
  }
}

- (id)_layoutManager
{
  return (id)[(BNContentViewController *)self->_bannerContentViewController layoutManager];
}

- (id)_layoutDescriptionWithBounds:(CGRect)a3 preferredSize:(CGSize)a4 layoutManager:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  id v11 = [(DBNotificationViewController *)self view];
  id v12 = [v11 window];
  double v13 = [v12 windowScene];
  double v14 = [v13 screen];
  objc_msgSend(v10, "useableContainerFrameInContainerBounds:onScreen:", v14, x, y, width, height);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  uint64_t v23 = [(DBNotificationViewController *)self traitCollection];
  [v23 displayScale];
  objc_msgSend(v10, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", a4.width, a4.height, v16, v18, v20, v22, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height, v24);
  double v26 = v25;
  double v28 = v27;

  uint64_t v29 = (void *)MEMORY[0x263F29B30];
  return (id)objc_msgSend(v29, "bannerSourceLayoutDescriptionWithPresentationSize:containerSize:", v26, v28, width, height);
}

- (void)_performCancelTapGesture:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DBNotificationViewController *)self bannerContentViewController];
  uint64_t v6 = [v5 topPresentables];
  uint64_t v7 = [v6 lastObject];

  if (v7)
  {
    if ([(DBNotificationViewController *)self presentableIsOEMNotification:v7]
      && ([v7 isTouchOutsideDismissalEnabled] & 1) == 0)
    {
      id v8 = DBLogForCategory(0x11uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(DBNotificationViewController *)v8 handleHomeEvent];
      }
      goto LABEL_14;
    }
    id v8 = [v7 viewController];
    BOOL v9 = [(DBNotificationViewController *)self view];
    [v4 locationInView:v9];
    double v11 = v10;
    double v13 = v12;

    double v14 = [v8 view];
    [v4 locationInView:v14];
    double v16 = v15;
    double v18 = v17;

    double v19 = [(DBNotificationViewController *)self view];
    if (objc_msgSend(v19, "pointInside:withEvent:", 0, v11, v13))
    {
      double v20 = [v8 view];
      char v21 = objc_msgSend(v20, "pointInside:withEvent:", 0, v16, v18);

      if (v21)
      {
LABEL_14:

        goto LABEL_15;
      }
      double v19 = [MEMORY[0x263F29B50] uniqueIdentificationForPresentable:v7];
      double v22 = [(DBNotificationViewController *)self bannerController];
      uint64_t v23 = *MEMORY[0x263F31400];
      id v40 = 0;
      uint64_t v24 = [v22 revokePresentablesWithIdentification:v19 reason:v23 options:0 animated:1 userInfo:0 error:&v40];
      id v25 = v40;

      if (!v24)
      {
        double v26 = DBLogForCategory(0x11uLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[DBNotificationViewController _performCancelTapGesture:]((uint64_t)v25, v26, v27, v28, v29, v30, v31, v32);
        }
      }
    }

    goto LABEL_14;
  }
LABEL_15:
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (id)screenBorrowToken
{
  return self->_screenBorrowToken;
}

- (void)setScreenBorrowToken:(id)a3
{
}

- (NSString)screenBorrowingPresentableRequestID
{
  return self->_screenBorrowingPresentableRequestID;
}

- (void)setScreenBorrowingPresentableRequestID:(id)a3
{
}

- (BNBannerHostMonitor)bannerHostMonitor
{
  return self->_bannerHostMonitor;
}

- (BNBannerController)bannerController
{
  return self->_bannerController;
}

- (BNBannerSourceListener)bannerSourceListener
{
  return self->_bannerSourceListener;
}

- (BNContentViewController)bannerContentViewController
{
  return self->_bannerContentViewController;
}

- (DBBannerAuthority)bannerAuthority
{
  return self->_bannerAuthority;
}

- (UITapGestureRecognizer)tapDismissGestureRecognizer
{
  return self->_tapDismissGestureRecognizer;
}

- (_TtC9DashBoard27DBOEMNotificationController)oemNotificationController
{
  return self->_oemNotificationController;
}

- (DBNotificationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBNotificationViewControllerDelegate *)WeakRetained;
}

- (NSMutableSet)suspensionReasons
{
  return self->_suspensionReasons;
}

- (void)setSuspensionReasons:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspensionReasons, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_oemNotificationController, 0);
  objc_storeStrong((id *)&self->_tapDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bannerAuthority, 0);
  objc_storeStrong((id *)&self->_bannerContentViewController, 0);
  objc_storeStrong((id *)&self->_bannerSourceListener, 0);
  objc_storeStrong((id *)&self->_bannerController, 0);
  objc_storeStrong((id *)&self->_bannerHostMonitor, 0);
  objc_storeStrong((id *)&self->_screenBorrowingPresentableRequestID, 0);
  objc_storeStrong(&self->_screenBorrowToken, 0);
  objc_destroyWeak((id *)&self->_environment);
}

- (void)handleHomeEvent
{
}

- (void)setSuspended:(uint64_t)a3 cancellingCurrent:(uint64_t)a4 forReason:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setSuspended:(uint64_t)a3 cancellingCurrent:(uint64_t)a4 forReason:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)oemNotificationControllerRequestsPresenting:(void *)a1 .cold.1(void *a1)
{
  id v1 = [a1 requestIdentifier];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_0(&dword_22D6F0000, v2, v3, "Error posting notification %{public}@: %@", v4, v5, v6, v7, v8);
}

- (void)oemNotificationControllerRequestsDismissing:(void *)a1 .cold.1(void *a1)
{
  id v1 = [a1 requestIdentifier];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_0(&dword_22D6F0000, v2, v3, "Error dismissing notification %{public}@: %@", v4, v5, v6, v7, v8);
}

- (void)_performCancelTapGesture:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end