@interface DBSiriViewController
- (BOOL)isDismissed;
- (BOOL)isPaired;
- (BOOL)presentsFullScreen;
- (BOOL)presentsUnderStatusBar;
- (BSInvalidatable)layoutElementAssertion;
- (CGRect)_hostedPresentationFrame;
- (DBDashboardEntity)entity;
- (DBDashboardLayoutEngine)layoutEngine;
- (DBEnvironment)environment;
- (DBSiriViewController)initWithEnvironment:(id)a3 layoutEngine:(id)a4;
- (DBWorkspaceStateChangeRequest)pendingChangeRequest;
- (NSArray)constraints;
- (NSMutableSet)touchToDismissEnabledReasons;
- (NSString)activeIntentBundleID;
- (NSString)identifier;
- (SiriPresentationIntentUsageDelegate)intentUsageDelegate;
- (SiriPresentationViewController)presentationViewController;
- (UILongPressGestureRecognizer)touchToDismissRecognizer;
- (id)presentationRequestHandler;
- (id)presentationViewWithIdentifier:(id)a3;
- (id)screenBorrowToken;
- (void)_addPresentationView;
- (void)_handleBackgroundURLRequest:(id)a3 application:(id)a4;
- (void)_handleHomeEventType:(unint64_t)a3;
- (void)_handlePunchoutRequest:(id)a3;
- (void)_removePresentationView;
- (void)_requestDismissalWithReason:(int64_t)a3;
- (void)_safeDismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)_telephonyDropTapped:(id)a3;
- (void)_touchedDisplayToDismiss:(id)a3;
- (void)_updateHostedPresentationFrame;
- (void)_updateTouchToDismiss;
- (void)activateSceneWithSettings:(id)a3 completion:(id)a4;
- (void)activeIntentWithBundleId:(id)a3;
- (void)backgroundSceneWithCompletion:(id)a3;
- (void)dealloc;
- (void)foregroundSceneWithSettings:(id)a3 completion:(id)a4;
- (void)handleEvent:(id)a3;
- (void)handleTransitionToFrame:(CGRect)a3;
- (void)setActiveIntentBundleID:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setDismissed:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setIntentUsageDelegate:(id)a3;
- (void)setLayoutElementAssertion:(id)a3;
- (void)setLayoutEngine:(id)a3;
- (void)setPaired:(BOOL)a3;
- (void)setPendingChangeRequest:(id)a3;
- (void)setPresentationRequestHandler:(id)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setScreenBorrowToken:(id)a3;
- (void)setTouchToDismissEnabled:(BOOL)a3 forRequester:(id)a4;
- (void)setTouchToDismissEnabledReasons:(id)a3;
- (void)setTouchToDismissRecognizer:(id)a3;
- (void)siriPresentation:(id)a3 requestsDismissalWithOptions:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 requestsPresentationWithOptions:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 requestsPunchout:(id)a4 withHandler:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DBSiriViewController

- (DBSiriViewController)initWithEnvironment:(id)a3 layoutEngine:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)DBSiriViewController;
  v8 = [(DBSiriViewController *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_layoutEngine, a4);
    objc_storeWeak((id *)&v9->_environment, v6);
    v9->_dismissed = 1;
    v10 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v9 action:sel__telephonyDropTapped_];
    [v10 setAllowedPressTypes:&unk_26E17EED0];
    v11 = [MEMORY[0x263F83118] sharedInstance];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_environment);
    v13 = [WeakRetained displayConfiguration];
    v14 = [v13 identity];
    [v11 addGestureRecognizer:v10 toDisplayWithIdentity:v14];

    uint64_t v15 = [objc_alloc(MEMORY[0x263F82938]) initWithTarget:v9 action:sel__touchedDisplayToDismiss_];
    touchToDismissRecognizer = v9->_touchToDismissRecognizer;
    v9->_touchToDismissRecognizer = (UILongPressGestureRecognizer *)v15;

    [(UILongPressGestureRecognizer *)v9->_touchToDismissRecognizer setCancelsTouchesInView:0];
    [(UILongPressGestureRecognizer *)v9->_touchToDismissRecognizer setMinimumPressDuration:0.0];
    [(UILongPressGestureRecognizer *)v9->_touchToDismissRecognizer setEnabled:0];
    v17 = [MEMORY[0x263F83118] sharedInstance];
    v18 = v9->_touchToDismissRecognizer;
    id v19 = objc_loadWeakRetained((id *)&v9->_environment);
    v20 = [v19 displayConfiguration];
    v21 = [v20 identity];
    [v17 addGestureRecognizer:v18 toDisplayWithIdentity:v21];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(DBSiriViewController *)self layoutElementAssertion];

  if (v3)
  {
    v4 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating layout element for Siri", buf, 2u);
    }

    v5 = [(DBSiriViewController *)self layoutElementAssertion];
    [v5 invalidate];
  }
  v6.receiver = self;
  v6.super_class = (Class)DBSiriViewController;
  [(DBSiriViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)DBSiriViewController;
  [(DBSiriViewController *)&v6 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] clearColor];
  v4 = [(DBSiriViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(DBSiriViewController *)self presentationViewController];

  if (v5) {
    [(DBSiriViewController *)self _addPresentationView];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v25.receiver = self;
  v25.super_class = (Class)DBSiriViewController;
  [(DBSiriViewController *)&v25 viewDidAppear:a3];
  v4 = [(DBSiriViewController *)self presentationViewController];
  v5 = [MEMORY[0x263F29D20] factoryWithDuration:0.5];
  [v4 animatedAppearanceWithFactory:v5 completion:&__block_literal_global_11];

  [(DBSiriViewController *)self setDismissed:0];
  objc_super v6 = [(DBSiriViewController *)self presentationRequestHandler];

  if (v6)
  {
    id v7 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Signalling Siri activation success", v24, 2u);
    }

    v8 = [(DBSiriViewController *)self presentationRequestHandler];
    v8[2](v8, 1, 0);

    [(DBSiriViewController *)self setPresentationRequestHandler:0];
    v9 = [(DBSiriViewController *)self environment];
    v10 = [v9 environmentConfiguration];
    v11 = [v10 analytics];
    [v11 siriDidPresent];

    id v12 = objc_alloc(MEMORY[0x263F3F718]);
    v13 = (void *)[v12 initWithIdentifier:*MEMORY[0x263F3F570]];
    [v13 setUIApplicationElement:1];
    v14 = +[DBApplicationController sharedInstance];
    uint64_t v15 = [v14 siriApplication];

    v16 = [(DBSiriViewController *)self environment];
    [v16 sceneFrameForApplication:v15];
    objc_msgSend(v13, "setReferenceFrame:");

    [v13 setLevel:2];
    v17 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_22D6F0000, v17, OS_LOG_TYPE_DEFAULT, "Activating layout element for Siri", v24, 2u);
    }

    v18 = [(DBSiriViewController *)self layoutElementAssertion];

    if (v18)
    {
      id v19 = [(DBSiriViewController *)self layoutElementAssertion];
      [v19 invalidate];
    }
    v20 = [(DBSiriViewController *)self environment];
    v21 = [v20 environmentConfiguration];
    v22 = [v21 displayLayoutPublisher];
    objc_super v23 = [v22 addElement:v13];
    [(DBSiriViewController *)self setLayoutElementAssertion:v23];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DBSiriViewController;
  [(DBSiriViewController *)&v3 viewWillLayoutSubviews];
  [(DBSiriViewController *)self _updateHostedPresentationFrame];
}

- (CGRect)_hostedPresentationFrame
{
  objc_super v3 = +[DBApplicationController sharedInstance];
  v4 = [v3 siriApplication];

  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  id v7 = [(DBSiriViewController *)self environment];
  [v7 sceneFrameForApplication:v4];
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v6;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setPaired:(BOOL)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (self->_paired != a3)
  {
    self->_paired = a3;
    if (a3)
    {
      [(DBSiriViewController *)self _hostedPresentationFrame];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v12 = DBLogForCategory(3uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v31.origin.x = v5;
        v31.origin.y = v7;
        v31.size.width = v9;
        v31.size.height = v11;
        double v13 = NSStringFromCGRect(v31);
        int v28 = 138412290;
        v29 = v13;
        _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "Initializing SiriPresentationViewController with presentationFrame: %@", (uint8_t *)&v28, 0xCu);
      }
      id v14 = objc_alloc(MEMORY[0x263F753F8]);
      double v15 = [(DBSiriViewController *)self environment];
      v16 = [v15 displayConfiguration];
      v17 = objc_msgSend(v14, "initWithIdentifier:hostedPresentationFrame:displayConfiguration:", 2, v16, v5, v7, v9, v11);
      [(DBSiriViewController *)self setPresentationViewController:v17];

      v18 = [(DBSiriViewController *)self presentationViewController];
      [v18 setSiriPresentationControllerDelegate:self];

      id v19 = [(DBSiriViewController *)self presentationViewController];
      [v19 setIntentUsageDelegate:self];

      v20 = +[DBApplicationController sharedInstance];
      v21 = [v20 siriApplication];

      v22 = [(DBSiriViewController *)self presentationViewController];
      objc_super v23 = [(DBSiriViewController *)self environment];
      [v23 safeAreaInsetsForApplication:v21];
      objc_msgSend(v22, "setAdditionalSafeAreaInsets:");

      v24 = [(DBSiriViewController *)self presentationViewController];
      [(DBSiriViewController *)self addChildViewController:v24];

      if ([(DBSiriViewController *)self isViewLoaded]) {
        [(DBSiriViewController *)self _addPresentationView];
      }
    }
    else
    {
      objc_super v25 = [(DBSiriViewController *)self presentationViewController];
      [v25 willMoveToParentViewController:0];

      v26 = DBLogForCategory(3uLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_22D6F0000, v26, OS_LOG_TYPE_DEFAULT, "DBSiriViewController is now unpaired. Invalidating...", (uint8_t *)&v28, 2u);
      }

      v27 = [(DBSiriViewController *)self presentationViewController];
      [v27 removeFromParentViewController];

      [(DBSiriViewController *)self _requestDismissalWithReason:22];
      [(DBSiriViewController *)self setPresentationRequestHandler:0];
    }
  }
}

- (void)setTouchToDismissEnabled:(BOOL)a3 forRequester:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v4)
  {
    if (!self->_touchToDismissEnabledReasons)
    {
      double v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      touchToDismissEnabledReasons = self->_touchToDismissEnabledReasons;
      self->_touchToDismissEnabledReasons = v7;
    }
    double v9 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Adding touch to dismiss requester: %@.", (uint8_t *)&v11, 0xCu);
    }

    [(NSMutableSet *)self->_touchToDismissEnabledReasons addObject:v6];
  }
  else
  {
    double v10 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Removing touch to dismiss requester: %@.", (uint8_t *)&v11, 0xCu);
    }

    [(NSMutableSet *)self->_touchToDismissEnabledReasons removeObject:v6];
  }
  [(DBSiriViewController *)self _updateTouchToDismiss];
}

- (void)handleTransitionToFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x263F83148]);
  double v9 = [(DBSiriViewController *)self view];
  [v8 _setContainerView:v9];

  double v10 = [(DBSiriViewController *)self presentationViewController];
  [v8 _setToViewController:v10];

  int v11 = [(DBSiriViewController *)self presentationViewController];
  id v12 = [v11 view];
  [v12 frame];
  objc_msgSend(v8, "_setToStartFrame:");

  objc_msgSend(v8, "_setToEndFrame:", x, y, width, height);
  [v8 _setIsAnimated:0];
  uint64_t v13 = [v8 _transitionCoordinator];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__DBSiriViewController_handleTransitionToFrame___block_invoke;
  v16[3] = &unk_2649B5588;
  v16[4] = self;
  [v13 animateAlongsideTransition:v16 completion:0];

  id v14 = [(DBSiriViewController *)self presentationViewController];
  double v15 = [v8 _transitionCoordinator];
  objc_msgSend(v14, "viewWillTransitionToSize:withTransitionCoordinator:", v15, width, height);

  objc_msgSend(v8, "__runAlongsideAnimations");
}

uint64_t __48__DBSiriViewController_handleTransitionToFrame___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  objc_super v3 = DBLogForCategory(3uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Updating hosted presentation frame for screen resize", v5, 2u);
  }

  return [*(id *)(a1 + 32) _updateHostedPresentationFrame];
}

- (BOOL)presentsUnderStatusBar
{
  return 1;
}

- (BOOL)presentsFullScreen
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.siri";
}

- (DBDashboardEntity)entity
{
  return (DBDashboardEntity *)+[DBDashboardSiriEntity entity];
}

- (void)foregroundSceneWithSettings:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)backgroundSceneWithCompletion:(id)a3
{
  id v5 = a3;
  if (![(DBSiriViewController *)self isDismissed]) {
    [(DBSiriViewController *)self _requestDismissalWithReason:1];
  }
  BOOL v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    BOOL v4 = v5;
  }
}

- (void)activateSceneWithSettings:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (id)presentationViewWithIdentifier:(id)a3
{
  return 0;
}

- (void)handleEvent:(id)a3
{
  id v10 = a3;
  if ([v10 type] == 1)
  {
    uint64_t v4 = [v10 context];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = [v10 context];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v8 = [v10 context];
        uint64_t v9 = [v8 unsignedIntegerValue];

        [(DBSiriViewController *)self _handleHomeEventType:v9];
      }
    }
  }
}

- (void)_handleHomeEventType:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3 - 1 <= 1)
  {
    id v5 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      unint64_t v7 = a3;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Requesting dismissal of Siri due to DBHomeEventType %li", (uint8_t *)&v6, 0xCu);
    }

    [(DBSiriViewController *)self setDismissed:1];
    [(DBSiriViewController *)self _requestDismissalWithReason:20];
  }
}

- (void)siriPresentation:(id)a3 requestsPresentationWithOptions:(id)a4 withHandler:(id)a5
{
  id v6 = a5;
  unint64_t v7 = DBLogForCategory(3uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Siri presentation requested!", buf, 2u);
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __85__DBSiriViewController_siriPresentation_requestsPresentationWithOptions_withHandler___block_invoke;
  v9[3] = &unk_2649B55B0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __85__DBSiriViewController_siriPresentation_requestsPresentationWithOptions_withHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) environment];
  objc_super v3 = [v2 environmentConfiguration];
  uint64_t v4 = [v3 session];

  id v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Borrowing screen for Siri", v9, 2u);
  }

  id v6 = [v4 borrowScreenForClient:@"CarPlayApp" reason:@"Siri"];
  [*(id *)(a1 + 32) setScreenBorrowToken:v6];

  [*(id *)(a1 + 32) setPresentationRequestHandler:*(void *)(a1 + 40)];
  unint64_t v7 = [*(id *)(a1 + 32) environment];
  id v8 = +[DBEvent eventWithType:5 context:0];
  [v7 handleEvent:v8];
}

- (void)siriPresentation:(id)a3 requestsDismissalWithOptions:(id)a4 withHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = DBLogForCategory(3uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Siri dismissal requested!", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__DBSiriViewController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke;
  block[3] = &unk_2649B5170;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __82__DBSiriViewController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) animated];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __82__DBSiriViewController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_2;
  v5[3] = &unk_2649B55D8;
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _safeDismissAnimated:v3 completion:v5];
}

uint64_t __82__DBSiriViewController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = [*(id *)(a1 + 32) pendingChangeRequest];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) environment];
    id v4 = [v3 workspace];
    id v5 = [*(id *)(a1 + 32) pendingChangeRequest];
    [v4 requestStateChange:v5];

    [*(id *)(a1 + 32) setPendingChangeRequest:0];
  }
  else
  {
    id v6 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
    [(DBMutableWorkspaceStateChangeRequest *)v6 deactivateSiri];
    id v7 = [*(id *)(a1 + 32) environment];
    id v8 = [v7 workspace];
    [v8 requestStateChange:v6];
  }
  [*(id *)(a1 + 32) setTouchToDismissEnabled:0 forRequester:@"FloatingSiri"];
  uint64_t v9 = DBLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Unborrowing screen for Siri", v12, 2u);
  }

  [*(id *)(a1 + 32) setScreenBorrowToken:0];
  uint64_t result = [*(id *)(a1 + 32) isPaired];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) _removePresentationView];
    id v11 = [*(id *)(a1 + 32) presentationViewController];
    [v11 invalidate];

    return [*(id *)(a1 + 32) setPresentationViewController:0];
  }
  return result;
}

- (void)siriPresentation:(id)a3 requestsPunchout:(id)a4 withHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = DBLogForCategory(3uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Siri punchout requested! %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__DBSiriViewController_siriPresentation_requestsPunchout_withHandler___block_invoke;
  block[3] = &unk_2649B5170;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __70__DBSiriViewController_siriPresentation_requestsPunchout_withHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handlePunchoutRequest:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)activeIntentWithBundleId:(id)a3
{
  id v4 = a3;
  [(DBSiriViewController *)self setActiveIntentBundleID:v4];
  id v5 = [(DBSiriViewController *)self intentUsageDelegate];
  [v5 activeIntentWithBundleId:v4];
}

- (void)_addPresentationView
{
  uint64_t v3 = [(DBSiriViewController *)self view];
  id v4 = [(DBSiriViewController *)self presentationViewController];
  id v5 = [v4 view];
  [v3 addSubview:v5];

  id v6 = [(DBSiriViewController *)self presentationViewController];
  [v6 didMoveToParentViewController:self];

  id v7 = [(DBSiriViewController *)self presentationViewController];
  id v8 = [v7 view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(DBSiriViewController *)self _updateHostedPresentationFrame];
}

- (void)_removePresentationView
{
  uint64_t v3 = (void *)MEMORY[0x263F08938];
  id v4 = [(DBSiriViewController *)self constraints];
  [v3 deactivateConstraints:v4];

  [(DBSiriViewController *)self setConstraints:0];
  id v6 = [(DBSiriViewController *)self presentationViewController];
  id v5 = [v6 view];
  [v5 removeFromSuperview];
}

- (void)_handlePunchoutRequest:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
  id v6 = [v4 bundleIdentifier];
  id v7 = [v4 url];
  uint64_t v8 = [v4 punchoutStyle];
  if (!objc_msgSend(v7, "db_isNowPlayingURL"))
  {
    uint64_t v40 = v8;
    if (!v6 && v7)
    {
      id v11 = [MEMORY[0x263F01880] defaultWorkspace];
      id v12 = [v11 applicationsAvailableForOpeningURL:v7];
      id v13 = [v12 firstObject];

      id v6 = [v13 bundleIdentifier];
    }
    if (v6)
    {
      id v14 = +[DBApplicationController sharedInstance];
      double v15 = [v14 applicationWithBundleIdentifier:v6];

      if (v15)
      {
        char v16 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v17 = DBLogForCategory(3uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[DBSiriViewController _handlePunchoutRequest:]((uint64_t)v7, v17);
      }
    }
    v18 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[DBSiriViewController _handlePunchoutRequest:]((uint64_t)v4, v18);
    }

    double v15 = 0;
    char v16 = 1;
LABEL_15:
    id v19 = +[DBApplicationController sharedInstance];
    int v20 = [v19 preflightRequiredForApplication:v15];

    if (v20)
    {
      v21 = DBLogForCategory(3uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[DBSiriViewController _handlePunchoutRequest:](v21);
      }

      v22 = objc_alloc_init(DBActivationSettings);
      [(DBActivationSettings *)v22 setLaunchSource:4];
      objc_super v23 = +[DBApplicationLaunchInfo launchInfoForApplication:v15 withActivationSettings:v22];
      v24 = +[DBEvent eventWithType:4 context:v23];
      objc_super v25 = [(DBSiriViewController *)self environment];
      [v25 handleEvent:v24];

      [(DBMutableWorkspaceStateChangeRequest *)v5 deactivateSiri];
      uint64_t v26 = 1;
      if (v15) {
        goto LABEL_19;
      }
      goto LABEL_38;
    }
    if ([v15 requiresBackgroundURLDelivery])
    {
      v29 = DBLogForCategory(3uLL);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v29, OS_LOG_TYPE_DEFAULT, "Punchout request requires background URL delivery.", buf, 2u);
      }

      [(DBSiriViewController *)self _handleBackgroundURLRequest:v7 application:v15];
      if (!v15) {
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v30 = objc_alloc_init(DBActivationSettings);
      CGRect v31 = v30;
      if (v7) {
        [(DBActivationSettings *)v30 setUrl:v7];
      }
      [(DBActivationSettings *)v31 setLaunchSource:4];
      if ((v16 & 1) == 0) {
        [(DBMutableWorkspaceStateChangeRequest *)v5 activateApplication:v15 withSettings:v31];
      }
      v32 = DBLogForCategory(3uLL);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v32, OS_LOG_TYPE_DEFAULT, "Taking screen for Siri app activation", buf, 2u);
      }

      v33 = [(DBSiriViewController *)self environment];
      v34 = [v33 environmentConfiguration];
      v35 = [v34 session];
      [v35 takeScreenForClient:@"com.apple.CarPlayApp" reason:@"Siri activated app"];

      if (!v15) {
        goto LABEL_37;
      }
    }
    if (v40 == 2)
    {
      [(DBMutableWorkspaceStateChangeRequest *)v5 activateSiriFloating];
      v36 = DBLogForCategory(3uLL);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = [v15 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        v42 = v37;
        _os_log_impl(&dword_22D6F0000, v36, OS_LOG_TYPE_DEFAULT, "Handling in-place punchout for %{public}@", buf, 0xCu);
      }
      v38 = [(DBSiriViewController *)self environment];
      v39 = [v38 workspace];
      [v39 requestStateChange:v5];

      goto LABEL_41;
    }
LABEL_37:
    [(DBMutableWorkspaceStateChangeRequest *)v5 deactivateSiri];
    uint64_t v26 = 9;
    if (v15)
    {
LABEL_19:
      v27 = DBLogForCategory(3uLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = [v15 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        v42 = v28;
        _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, "Handling punchout for %{public}@", buf, 0xCu);
      }
LABEL_40:

      [(DBSiriViewController *)self setPendingChangeRequest:v5];
      [(DBSiriViewController *)self setDismissed:1];
      [(DBSiriViewController *)self _requestDismissalWithReason:v26];
LABEL_41:

      goto LABEL_42;
    }
LABEL_38:
    v27 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, "Requesting Siri dismissal", buf, 2u);
    }
    goto LABEL_40;
  }
  uint64_t v9 = [(DBSiriViewController *)self environment];
  id v10 = +[DBEvent eventWithType:11 context:&unk_26E17EB70];
  [v9 handleEvent:v10];

LABEL_42:
}

- (void)_requestDismissalWithReason:(int64_t)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F6C770]) initWithDeactivationOptions:0 animated:1 dismissalReason:a3];
  id v4 = [(DBSiriViewController *)self presentationViewController];
  [v4 dismissWithOptions:v5];
}

- (void)_handleBackgroundURLRequest:(id)a3 application:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_alloc_init(DBActivationSettings);
  [(DBActivationSettings *)v11 setUrl:v7];

  [(DBActivationSettings *)v11 setLaunchSource:4];
  uint64_t v8 = +[DBApplicationLaunchInfo launchInfoForApplication:v6 withActivationSettings:v11];

  uint64_t v9 = [(DBSiriViewController *)self environment];
  id v10 = +[DBEvent eventWithType:4 context:v8];
  [v9 handleEvent:v10];
}

- (void)_safeDismissAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DBSiriViewController__safeDismissAnimated_completion___block_invoke;
  block[3] = &unk_2649B5600;
  BOOL v10 = a3;
  block[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__DBSiriViewController__safeDismissAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDismissed:1];
  [*(id *)(a1 + 32) setActiveIntentBundleID:0];
  v2 = [*(id *)(a1 + 32) environment];
  uint64_t v3 = [v2 environmentConfiguration];
  id v4 = [v3 analytics];
  [v4 siriDidDismiss];

  id v5 = [*(id *)(a1 + 32) presentationViewController];
  LODWORD(v3) = [v5 siriViewControllerConfigured];

  if (v3)
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v6 = 0.5;
    }
    else {
      double v6 = 0.0;
    }
    id v7 = [*(id *)(a1 + 32) presentationViewController];
    uint64_t v8 = [MEMORY[0x263F29D20] factoryWithDuration:v6];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__DBSiriViewController__safeDismissAnimated_completion___block_invoke_2;
    v14[3] = &unk_2649B3F00;
    id v15 = *(id *)(a1 + 40);
    [v7 animatedDisappearanceWithFactory:v8 completion:v14];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(void))(v9 + 16))();
    }
  }
  BOOL v10 = DBLogForCategory(3uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Invalidating layout element for Siri", v13, 2u);
  }

  id v11 = [*(id *)(a1 + 32) layoutElementAssertion];
  [v11 invalidate];

  return [*(id *)(a1 + 32) setLayoutElementAssertion:0];
}

uint64_t __56__DBSiriViewController__safeDismissAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_touchedDisplayToDismiss:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    id v5 = [(SiriPresentationViewController *)self->_presentationViewController view];
    [v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    objc_initWeak(&location, self);
    presentationViewController = self->_presentationViewController;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__DBSiriViewController__touchedDisplayToDismiss___block_invoke;
    v11[3] = &unk_2649B4548;
    objc_copyWeak(&v12, &location);
    -[SiriPresentationViewController hasContentAtPoint:completion:](presentationViewController, "hasContentAtPoint:completion:", v11, v7, v9);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __49__DBSiriViewController__touchedDisplayToDismiss___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((a2 & 1) == 0)
  {
    id v4 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Requesting dismissal because user touched screen", v5, 2u);
    }

    [WeakRetained _requestDismissalWithReason:7];
  }
}

- (void)_telephonyDropTapped:(id)a3
{
  if (![(DBSiriViewController *)self isDismissed])
  {
    id v4 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Received drop call button event, requesting dismissal.", v5, 2u);
    }

    [(DBSiriViewController *)self _requestDismissalWithReason:20];
  }
}

- (void)_updateHostedPresentationFrame
{
  v48[4] = *MEMORY[0x263EF8340];
  [(DBSiriViewController *)self _hostedPresentationFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(DBSiriViewController *)self presentationViewController];
  objc_msgSend(v11, "setHostedPresentationFrame:", v4, v6, v8, v10);

  id v12 = [(DBSiriViewController *)self constraints];

  if (v12)
  {
    id v13 = (void *)MEMORY[0x263F08938];
    id v14 = [(DBSiriViewController *)self constraints];
    [v13 deactivateConstraints:v14];
  }
  id v15 = [(DBSiriViewController *)self presentationViewController];
  char v16 = [v15 view];

  if (v16)
  {
    uint64_t v17 = +[DBApplicationController sharedInstance];
    v47 = [v17 siriApplication];

    v18 = [(DBSiriViewController *)self presentationViewController];
    id v19 = [(DBSiriViewController *)self environment];
    [v19 safeAreaInsetsForApplication:v47];
    objc_msgSend(v18, "setAdditionalSafeAreaInsets:");

    v46 = [(DBSiriViewController *)self presentationViewController];
    v45 = [v46 view];
    uint64_t v43 = [v45 leftAnchor];
    v44 = [(DBSiriViewController *)self view];
    v42 = [v44 leftAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v48[0] = v41;
    uint64_t v40 = [(DBSiriViewController *)self presentationViewController];
    v39 = [v40 view];
    v37 = [v39 rightAnchor];
    v38 = [(DBSiriViewController *)self view];
    v36 = [v38 rightAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v48[1] = v35;
    v34 = [(DBSiriViewController *)self presentationViewController];
    v33 = [v34 view];
    CGRect v31 = [v33 topAnchor];
    v32 = [(DBSiriViewController *)self view];
    int v20 = [v32 topAnchor];
    v21 = [v31 constraintEqualToAnchor:v20];
    v48[2] = v21;
    v22 = [(DBSiriViewController *)self presentationViewController];
    objc_super v23 = [v22 view];
    v24 = [v23 bottomAnchor];
    objc_super v25 = [(DBSiriViewController *)self view];
    uint64_t v26 = [v25 bottomAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    v48[3] = v27;
    int v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];
    [(DBSiriViewController *)self setConstraints:v28];

    v29 = (void *)MEMORY[0x263F08938];
    uint64_t v30 = [(DBSiriViewController *)self constraints];
    [v29 activateConstraints:v30];
  }
}

- (void)_updateTouchToDismiss
{
  uint64_t v3 = [(NSMutableSet *)self->_touchToDismissEnabledReasons count];
  double v4 = DBLogForCategory(3uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      __int16 v9 = 0;
      double v6 = "Enabling touch to dismiss.";
      double v7 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    __int16 v8 = 0;
    double v6 = "Disabling touch to dismiss.";
    double v7 = (uint8_t *)&v8;
    goto LABEL_6;
  }

  [(UILongPressGestureRecognizer *)self->_touchToDismissRecognizer setEnabled:v3 != 0];
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (BOOL)isDismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (SiriPresentationViewController)presentationViewController
{
  return self->_presentationViewController;
}

- (void)setPresentationViewController:(id)a3
{
}

- (SiriPresentationIntentUsageDelegate)intentUsageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_intentUsageDelegate);
  return (SiriPresentationIntentUsageDelegate *)WeakRetained;
}

- (void)setIntentUsageDelegate:(id)a3
{
}

- (NSString)activeIntentBundleID
{
  return self->_activeIntentBundleID;
}

- (void)setActiveIntentBundleID:(id)a3
{
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (DBDashboardLayoutEngine)layoutEngine
{
  return self->_layoutEngine;
}

- (void)setLayoutEngine:(id)a3
{
}

- (id)presentationRequestHandler
{
  return self->_presentationRequestHandler;
}

- (void)setPresentationRequestHandler:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (id)screenBorrowToken
{
  return self->_screenBorrowToken;
}

- (void)setScreenBorrowToken:(id)a3
{
}

- (DBWorkspaceStateChangeRequest)pendingChangeRequest
{
  return self->_pendingChangeRequest;
}

- (void)setPendingChangeRequest:(id)a3
{
}

- (BSInvalidatable)layoutElementAssertion
{
  return self->_layoutElementAssertion;
}

- (void)setLayoutElementAssertion:(id)a3
{
}

- (NSMutableSet)touchToDismissEnabledReasons
{
  return self->_touchToDismissEnabledReasons;
}

- (void)setTouchToDismissEnabledReasons:(id)a3
{
}

- (UILongPressGestureRecognizer)touchToDismissRecognizer
{
  return self->_touchToDismissRecognizer;
}

- (void)setTouchToDismissRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchToDismissRecognizer, 0);
  objc_storeStrong((id *)&self->_touchToDismissEnabledReasons, 0);
  objc_storeStrong((id *)&self->_layoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_pendingChangeRequest, 0);
  objc_storeStrong(&self->_screenBorrowToken, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong(&self->_presentationRequestHandler, 0);
  objc_storeStrong((id *)&self->_layoutEngine, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_activeIntentBundleID, 0);
  objc_destroyWeak((id *)&self->_intentUsageDelegate);
  objc_storeStrong((id *)&self->_presentationViewController, 0);
}

- (void)_handlePunchoutRequest:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D6F0000, log, OS_LOG_TYPE_ERROR, "Punchout application requires preflight, sending open application event to present alert.", v1, 2u);
}

- (void)_handlePunchoutRequest:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "Unable to lookup app info for punchout request: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_handlePunchoutRequest:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "Unable to lookup target bundle ID for punchout request! URL: %@", (uint8_t *)&v2, 0xCu);
}

@end