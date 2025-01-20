@interface GKGameCenterViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
+ (BOOL)accessInstanceVariablesDirectly;
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers;
- (BOOL)isArcade;
- (BOOL)isPresenting;
- (BOOL)isPresentingOverlay;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutomaticallyForwardRotationMethods;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldShowPlayForChallenge;
- (BOOL)shouldShowPlayForTurnBasedMatch;
- (BOOL)shouldShowQuitForTurnBasedMatch;
- (GKDashboardHostViewController)remoteViewController;
- (GKGame)actualGame;
- (GKGameCenterViewController)init;
- (GKGameCenterViewController)initWithAchievementID:(NSString *)achievementID;
- (GKGameCenterViewController)initWithGame:(id)a3 hostPID:(int)a4 restrictionMode:(int64_t)a5 deeplink:(id)a6 launchContext:(id)a7;
- (GKGameCenterViewController)initWithLeaderboard:(GKLeaderboard *)leaderboard playerScope:(GKLeaderboardPlayerScope)playerScope;
- (GKGameCenterViewController)initWithLeaderboardID:(NSString *)leaderboardID playerScope:(GKLeaderboardPlayerScope)playerScope timeScope:(GKLeaderboardTimeScope)timeScope;
- (GKGameCenterViewController)initWithLeaderboardSetID:(id)a3;
- (GKGameCenterViewController)initWithPlayer:(id)a3;
- (GKGameCenterViewController)initWithState:(GKGameCenterViewControllerState)state;
- (GKGameCenterViewControllerState)viewState;
- (GKLeaderboard)leaderboard;
- (GKLeaderboardTimeScope)leaderboardTimeScope;
- (NSObject)overlay;
- (NSString)achievementIdentifier;
- (NSString)activityIdentifier;
- (NSString)gameBundleID;
- (NSString)launchContext;
- (NSString)leaderboardIdentifier;
- (NSString)leaderboardSetIdentifier;
- (NSString)leaderboardTitle;
- (NSString)playerAlias;
- (NSString)playerIdentifier;
- (UIAlertController)alertController;
- (double)transitionDuration:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)constructInitialState;
- (id)gameCenterDelegate;
- (int)actualHostPID;
- (int64_t)leaderboardPlayerScope;
- (int64_t)restrictionMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)_commonInit;
- (void)_setupChildViewController;
- (void)_setupRemoteViewController;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)checkArcadeStateWithCompletion:(id)a3;
- (void)dealloc;
- (void)extensionDidFinishWithError:(id)a3;
- (void)loadView;
- (void)notifyDelegateOnWillFinish;
- (void)presentOverlayWithInitialState:(id)a3;
- (void)setAchievementIdentifier:(id)a3;
- (void)setActivityIdentifier:(id)a3;
- (void)setActualGame:(id)a3;
- (void)setActualHostPID:(int)a3;
- (void)setAlertController:(id)a3;
- (void)setGameBundleID:(id)a3;
- (void)setGameCenterDelegate:(id)gameCenterDelegate;
- (void)setIsArcade:(BOOL)a3;
- (void)setIsPresentingOverlay:(BOOL)a3;
- (void)setLaunchContext:(id)a3;
- (void)setLeaderboard:(id)a3;
- (void)setLeaderboardIdentifier:(NSString *)leaderboardIdentifier;
- (void)setLeaderboardIdentifierFromExtension:(id)a3;
- (void)setLeaderboardPlayerScope:(int64_t)a3;
- (void)setLeaderboardPlayerScopeFromExtension:(int64_t)a3;
- (void)setLeaderboardSetIdentifier:(id)a3;
- (void)setLeaderboardTimeScope:(GKLeaderboardTimeScope)leaderboardTimeScope;
- (void)setLeaderboardTimeScopeFromExtension:(int64_t)a3;
- (void)setLeaderboardTitle:(id)a3;
- (void)setOverlay:(id)a3;
- (void)setPlayerAlias:(id)a3;
- (void)setPlayerIdentifier:(id)a3;
- (void)setPresenting:(BOOL)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setRestrictionMode:(int64_t)a3;
- (void)setViewState:(GKGameCenterViewControllerState)viewState;
- (void)setViewStateFromExtension:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKGameCenterViewController

- (GKGameCenterViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKGameCenterViewController;
  v2 = [(GKGameCenterViewController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_viewState = -1;
    v2->_leaderboardTimeScope = 2;
    v2->_leaderboardPlayerScope = 1;
    [(GKGameCenterViewController *)v2 _commonInit];
  }
  return v3;
}

- (GKGameCenterViewController)initWithState:(GKGameCenterViewControllerState)state
{
  v7.receiver = self;
  v7.super_class = (Class)GKGameCenterViewController;
  v4 = [(GKGameCenterViewController *)&v7 init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_viewState = state;
    v4->_leaderboardTimeScope = 2;
    v4->_leaderboardPlayerScope = 1;
    [(GKGameCenterViewController *)v4 _commonInit];
  }
  return v5;
}

- (GKGameCenterViewController)initWithLeaderboardID:(NSString *)leaderboardID playerScope:(GKLeaderboardPlayerScope)playerScope timeScope:(GKLeaderboardTimeScope)timeScope
{
  v9 = leaderboardID;
  v13.receiver = self;
  v13.super_class = (Class)GKGameCenterViewController;
  v10 = [(GKGameCenterViewController *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_viewState = 0;
    objc_storeStrong((id *)&v10->_leaderboardIdentifier, leaderboardID);
    v11->_leaderboardTimeScope = timeScope;
    v11->_leaderboardPlayerScope = playerScope;
    [(GKGameCenterViewController *)v11 _commonInit];
  }

  return v11;
}

- (GKGameCenterViewController)initWithLeaderboard:(GKLeaderboard *)leaderboard playerScope:(GKLeaderboardPlayerScope)playerScope
{
  objc_super v7 = leaderboard;
  v11.receiver = self;
  v11.super_class = (Class)GKGameCenterViewController;
  v8 = [(GKGameCenterViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_viewState = 0;
    v8->_leaderboardTimeScope = 2;
    v8->_leaderboardPlayerScope = playerScope;
    objc_storeStrong((id *)&v8->_leaderboard, leaderboard);
    [(GKGameCenterViewController *)v9 _commonInit];
  }

  return v9;
}

- (GKGameCenterViewController)initWithLeaderboardSetID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKGameCenterViewController;
  v6 = [(GKGameCenterViewController *)&v9 init];
  objc_super v7 = v6;
  if (v6)
  {
    v6->_viewState = 0;
    objc_storeStrong((id *)&v6->_leaderboardSetIdentifier, a3);
    [(GKGameCenterViewController *)v7 _commonInit];
  }

  return v7;
}

- (GKGameCenterViewController)initWithAchievementID:(NSString *)achievementID
{
  id v5 = achievementID;
  v9.receiver = self;
  v9.super_class = (Class)GKGameCenterViewController;
  v6 = [(GKGameCenterViewController *)&v9 init];
  objc_super v7 = v6;
  if (v6)
  {
    v6->_viewState = 1;
    objc_storeStrong((id *)&v6->_achievementIdentifier, achievementID);
    [(GKGameCenterViewController *)v7 _commonInit];
  }

  return v7;
}

- (GKGameCenterViewController)initWithPlayer:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKGameCenterViewController;
  id v5 = [(GKGameCenterViewController *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_viewState = 3;
    objc_super v7 = [v4 internal];
    uint64_t v8 = [v7 playerID];
    playerIdentifier = v6->_playerIdentifier;
    v6->_playerIdentifier = (NSString *)v8;

    [(GKGameCenterViewController *)v6 _commonInit];
  }

  return v6;
}

- (void)dealloc
{
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v4, OS_LOG_TYPE_INFO, "GKGameCenterViewController dealloc", buf, 2u);
  }
  [(GKExtensionRemoteViewController *)self->_remoteViewController cancelExtension];
  v5.receiver = self;
  v5.super_class = (Class)GKGameCenterViewController;
  [(GKGameCenterViewController *)&v5 dealloc];
}

- (void)_commonInit
{
  self->_restrictionMode = 3;
  [(GKGameCenterViewController *)self _setupChildViewController];
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return self;
}

- (id)animationControllerForDismissedController:(id)a3
{
  return self;
}

- (void)animationEnded:(BOOL)a3
{
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v6 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  objc_super v7 = [v4 containerView];
  if ([(GKGameCenterViewController *)self isPresenting])
  {
    uint64_t v8 = [v5 view];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    v17 = [v6 view];
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    v18 = [v6 view];
    [v18 setAutoresizingMask:18];

    v19 = [v6 view];
    [v7 addSubview:v19];

    v20 = [v6 view];
    [v20 layoutIfNeeded];

    v21 = [v5 view];
    [v21 layoutIfNeeded];

    [v4 completeTransition:1];
  }
  else
  {
    v22 = [(GKGameCenterViewController *)self remoteViewController];

    if (v22)
    {
      v23 = [(GKGameCenterViewController *)self remoteViewController];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __48__GKGameCenterViewController_animateTransition___block_invoke;
      v26[3] = &unk_1E5F643B0;
      id v27 = v4;
      id v28 = v5;
      id v29 = v6;
      [v23 tearDownExtensionWithReply:v26];
    }
    else
    {
      [v4 completeTransition:1];
      v24 = [v5 view];
      [v24 removeFromSuperview];

      v25 = [v6 view];
      [v25 layoutIfNeeded];
    }
  }
}

void __48__GKGameCenterViewController_animateTransition___block_invoke(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__GKGameCenterViewController_animateTransition___block_invoke_2;
  block[3] = &unk_1E5F63E80;
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __48__GKGameCenterViewController_animateTransition___block_invoke_2(id *a1)
{
  [a1[4] completeTransition:1];
  v2 = [a1[5] view];
  [v2 removeFromSuperview];

  id v3 = [a1[6] view];
  [v3 layoutIfNeeded];
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)GKGameCenterViewController;
  [(GKGameCenterViewController *)&v7 loadView];
  id v3 = [MEMORY[0x1E4F637E8] shared];
  int v4 = [v3 isGameCenterDisabled];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v6 setAlpha:0.0];
    [(GKGameCenterViewController *)self setView:v6];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F63760] local];
  [v5 hideAccessPoint];

  v6 = [(GKGameCenterViewController *)self remoteViewController];

  if (!v6)
  {
    [(GKGameCenterViewController *)self _setupChildViewController];
    goto LABEL_7;
  }
  objc_super v7 = [(GKGameCenterViewController *)self alertController];
  if (!v7)
  {
    uint64_t v8 = [(GKGameCenterViewController *)self viewControllers];
    uint64_t v9 = [v8 count];

    if (v9) {
      goto LABEL_6;
    }
    objc_super v7 = [(GKGameCenterViewController *)self remoteViewController];
    [(UINavigationController *)self _updateViewControllerStackWithViewController:v7];
  }

LABEL_6:
  double v10 = [(GKGameCenterViewController *)self remoteViewController];
  [v10 setDelegate:self];

LABEL_7:
  v13.receiver = self;
  v13.super_class = (Class)GKGameCenterViewController;
  [(GKGameCenterViewController *)&v13 viewWillAppear:v3];
  double v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 == 1) {
    [(GKGameCenterViewController *)self _setClipsToBounds:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKGameCenterViewController;
  [(GKGameCenterViewController *)&v7 viewDidAppear:a3];
  int v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 postNotificationName:@"GameControllerNavigation_GKInGameViewAppeared" object:0 userInfo:0 deliverImmediately:1];

  id v5 = [(GKGameCenterViewController *)self alertController];

  if (v5)
  {
    v6 = [(GKGameCenterViewController *)self alertController];
    [(GKGameCenterViewController *)self presentViewController:v6 animated:1 completion:&__block_literal_global_15];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GKGameCenterViewController;
  [(GKGameCenterViewController *)&v9 viewDidDisappear:a3];
  [(UINavigationController *)self _updateViewControllerStackWithViewController:0];
  [(GKGameCenterViewController *)self setRemoteViewController:0];
  int v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 postNotificationName:@"GameControllerNavigation_GKInGameViewDisappeared" object:0 userInfo:0 deliverImmediately:1];

  id v5 = [MEMORY[0x1E4F63760] local];
  [v5 showAccessPoint];

  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  objc_super v7 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "GKGameCenterViewController viewDidDisappear: cancelExtension", v8, 2u);
  }
  [(GKExtensionRemoteViewController *)self->_remoteViewController cancelExtension];
}

- (void)_setupChildViewController
{
  int64_t v3 = [(GKGameCenterViewController *)self restrictionMode];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__GKGameCenterViewController__setupChildViewController__block_invoke;
  v13[3] = &unk_1E5F62EB0;
  v13[4] = self;
  int v4 = [(GKGameCenterViewController *)self _gkInGameUIUnavailableAlertWithRestrictionMode:v3 dismissHandler:v13];
  [(GKGameCenterViewController *)self setAlertController:v4];

  id v5 = [(GKGameCenterViewController *)self alertController];

  if (!v5)
  {
    id v6 = [(GKGameCenterViewController *)self view];
    [v6 setAlpha:1.0];

    [(GKGameCenterViewController *)self setNavigationBarHidden:1];
    [(GKGameCenterViewController *)self setWantsFullScreenLayout:1];
    [(GKGameCenterViewController *)self setTransitioningDelegate:self];
    [(GKGameCenterViewController *)self setModalPresentationStyle:4];
    [(GKGameCenterViewController *)self setModalPresentationCapturesStatusBarAppearance:1];
    if ([MEMORY[0x1E4F63760] usesGameOverlayUI])
    {
      uint64_t v7 = [(GKGameCenterViewController *)self presentingViewController];
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        BOOL v9 = [(GKGameCenterViewController *)self isPresentingOverlay];

        if (!v9)
        {
          [(GKGameCenterViewController *)self _beginDelayingPresentation:&__block_literal_global_39 cancellationHandler:5.0];
          objc_initWeak(&location, self);
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __55__GKGameCenterViewController__setupChildViewController__block_invoke_40;
          v10[3] = &unk_1E5F63DB8;
          objc_copyWeak(&v11, &location);
          v10[4] = self;
          [(GKGameCenterViewController *)self checkArcadeStateWithCompletion:v10];
          objc_destroyWeak(&v11);
          objc_destroyWeak(&location);
        }
      }
    }
    else if (!self->_remoteViewController)
    {
      [(GKGameCenterViewController *)self _setupRemoteViewController];
    }
  }
}

uint64_t __55__GKGameCenterViewController__setupChildViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOnWillFinish];
}

uint64_t __55__GKGameCenterViewController__setupChildViewController__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    int v4 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __55__GKGameCenterViewController__setupChildViewController__block_invoke_2_cold_1(v4);
    }
  }
  return a2 ^ 1u;
}

void __55__GKGameCenterViewController__setupChildViewController__block_invoke_40(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIsArcade:a2];
  int v4 = [*(id *)(a1 + 32) constructInitialState];
  [*(id *)(a1 + 32) presentOverlayWithInitialState:v4];
  [*(id *)(a1 + 32) setIsPresentingOverlay:1];
  [WeakRetained _endDelayingPresentation];
}

- (void)_setupRemoteViewController
{
  id v3 = +[GKDashboardHostViewController dashboardExtension];
  if (v3)
  {
    +[GKExtensionRemoteViewController setupCallbackBlocksForExtension:v3 withParentViewController:self];
    [(GKGameCenterViewController *)self _beginDelayingPresentation:&__block_literal_global_44 cancellationHandler:5.0];
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_45;
    v4[3] = &unk_1E5F64400;
    id v5 = v3;
    objc_copyWeak(&v6, &location);
    [(GKGameCenterViewController *)self checkArcadeStateWithCompletion:v4];
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }
}

uint64_t __56__GKGameCenterViewController__setupRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    int v4 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_cold_1(v4);
    }
  }
  return a2 ^ 1u;
}

void __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_45(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_2;
  v4[3] = &unk_1E5F643D8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  char v6 = a2;
  +[GKExtensionRemoteViewController viewControllerForExtension:v3 inputItems:0 completionHandler:v4];
  objc_destroyWeak(&v5);
}

void __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsArcade:*(unsigned __int8 *)(a1 + 40)];
  if (v8)
  {
    id v7 = v8;
    [WeakRetained setRemoteViewController:v7];
    [WeakRetained _updateViewControllerStackWithViewController:v7];
  }
  else
  {
    [WeakRetained extensionDidFinishWithError:v5];
  }
}

- (id)constructInitialState
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  int v4 = +[GKExtensionRemoteViewController initialItemsForExtension];
  id v5 = [v3 dictionaryWithDictionary:v4];

  char v6 = [NSNumber numberWithInteger:self->_viewState];
  [v5 setObject:v6 forKeyedSubscript:@"DashboardViewState"];

  id v7 = [NSNumber numberWithInteger:self->_leaderboardTimeScope];
  [v5 setObject:v7 forKeyedSubscript:@"DashboardTimeScope"];

  id v8 = [NSNumber numberWithInteger:self->_leaderboardPlayerScope];
  [v5 setObject:v8 forKeyedSubscript:@"DashboardPlayerScope"];

  BOOL v9 = objc_msgSend(NSNumber, "numberWithBool:", -[GKGameCenterViewController shouldShowPlayForChallenge](self, "shouldShowPlayForChallenge"));
  [v5 setObject:v9 forKeyedSubscript:@"DashboardShowPlayForChallenge"];

  double v10 = objc_msgSend(NSNumber, "numberWithBool:", -[GKGameCenterViewController shouldShowPlayForTurnBasedMatch](self, "shouldShowPlayForTurnBasedMatch"));
  [v5 setObject:v10 forKeyedSubscript:@"MatchesShowPlayForMatch"];

  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[GKGameCenterViewController shouldShowQuitForTurnBasedMatch](self, "shouldShowQuitForTurnBasedMatch"));
  [v5 setObject:v11 forKeyedSubscript:@"MatchesShowQuitForMatch"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[GKGameCenterViewController isArcade](self, "isArcade"));
  [v5 setObject:v12 forKeyedSubscript:@"DashboardIsArcadeGame"];

  objc_super v13 = [(GKGameCenterViewController *)self launchContext];
  [v5 setObject:v13 forKeyedSubscript:@"DashboardLaunchContext"];

  leaderboardIdentifier = self->_leaderboardIdentifier;
  if (leaderboardIdentifier) {
    [v5 setObject:leaderboardIdentifier forKeyedSubscript:@"DashboardLeaderboardID"];
  }
  leaderboardSetIdentifier = self->_leaderboardSetIdentifier;
  if (leaderboardSetIdentifier) {
    [v5 setObject:leaderboardSetIdentifier forKeyedSubscript:@"DashboardLeaderboardSetID"];
  }
  gameBundleID = self->_gameBundleID;
  if (gameBundleID) {
    [v5 setObject:gameBundleID forKeyedSubscript:@"DashboardGameBundleID"];
  }
  leaderboard = self->_leaderboard;
  if (leaderboard)
  {
    v18 = [(GKLeaderboard *)leaderboard internal];
    [v5 setObject:v18 forKeyedSubscript:@"DashboardLeaderboardInternal"];
  }
  leaderboardTitle = self->_leaderboardTitle;
  if (leaderboardTitle) {
    [v5 setObject:leaderboardTitle forKeyedSubscript:@"DashboardLeaderboardTitle"];
  }
  achievementIdentifier = self->_achievementIdentifier;
  if (achievementIdentifier) {
    [v5 setObject:achievementIdentifier forKeyedSubscript:@"DashboardAchievementID"];
  }
  activityIdentifier = self->_activityIdentifier;
  if (activityIdentifier) {
    [v5 setObject:activityIdentifier forKeyedSubscript:@"DashboardActivityID"];
  }
  playerIdentifier = self->_playerIdentifier;
  if (playerIdentifier) {
    [v5 setObject:playerIdentifier forKeyedSubscript:@"DashboardPlayerID"];
  }
  playerAlias = self->_playerAlias;
  if (playerAlias) {
    [v5 setObject:playerAlias forKeyedSubscript:@"DashboardPlayerAlias"];
  }
  if (self->_actualGame && self->_actualHostPID >= 1)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v24 = (id)GKOSLoggers();
    }
    v25 = (void *)*MEMORY[0x1E4F63880];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
    {
      actualGame = self->_actualGame;
      id v27 = v25;
      id v28 = [(GKGame *)actualGame bundleIdentifier];
      id v29 = [NSNumber numberWithInt:self->_actualHostPID];
      int v32 = 138412546;
      v33 = v28;
      __int16 v34 = 2112;
      v35 = v29;
      _os_log_impl(&dword_1AF250000, v27, OS_LOG_TYPE_INFO, "GKGameCenterViewController is overriding game.bundleIdentifier=%@ hostPID=%@", (uint8_t *)&v32, 0x16u);
    }
    [v5 setObject:self->_actualGame forKeyedSubscript:@"CurrentGameKey"];
    v30 = [NSNumber numberWithInt:self->_actualHostPID];
    [v5 setObject:v30 forKeyedSubscript:@"HostPIDKey"];
  }

  return v5;
}

- (void)setRemoteViewController:(id)a3
{
  id v5 = (GKDashboardHostViewController *)a3;
  p_remoteViewController = &self->_remoteViewController;
  if (self->_remoteViewController != v5)
  {
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    [(GKDashboardHostViewController *)*p_remoteViewController setDelegate:self];
    id v7 = [(GKGameCenterViewController *)self constructInitialState];
    objc_initWeak(&location, self);
    id v8 = *p_remoteViewController;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__GKGameCenterViewController_setRemoteViewController___block_invoke;
    v9[3] = &unk_1E5F64358;
    objc_copyWeak(&v10, &location);
    [(GKExtensionRemoteViewController *)v8 setInitialState:v7 withReply:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __54__GKGameCenterViewController_setRemoteViewController___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__GKGameCenterViewController_setRemoteViewController___block_invoke_2;
  block[3] = &unk_1E5F634E8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __54__GKGameCenterViewController_setRemoteViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endDelayingPresentation];
}

- (void)checkArcadeStateWithCompletion:(id)a3
{
  id v3 = a3;
  int v4 = (void *)MEMORY[0x1E4F636D8];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKGameCenterViewController_iOS.m", 529, "-[GKGameCenterViewController checkArcadeStateWithCompletion:]");
  char v6 = [v4 dispatchGroupWithName:v5];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__GKGameCenterViewController_checkArcadeStateWithCompletion___block_invoke;
  v13[3] = &unk_1E5F63650;
  id v7 = v6;
  id v14 = v7;
  [v7 perform:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__GKGameCenterViewController_checkArcadeStateWithCompletion___block_invoke_3;
  v10[3] = &unk_1E5F63E30;
  id v11 = v7;
  id v12 = v3;
  id v8 = v3;
  id v9 = v7;
  [v9 notifyOnMainQueueWithBlock:v10];
}

void __61__GKGameCenterViewController_checkArcadeStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  id v5 = [v4 profileService];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__GKGameCenterViewController_checkArcadeStateWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5F64428;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v6 = v3;
  [v5 getOcelotStateForCurrentAppWithHandler:v7];
}

uint64_t __61__GKGameCenterViewController_checkArcadeStateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 32) setResult:v3];

  int v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

uint64_t __61__GKGameCenterViewController_checkArcadeStateWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) result];
  [v2 BOOLValue];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)extensionDidFinishWithError:(id)a3
{
  [(GKGameCenterViewController *)self notifyDelegateOnWillFinish];
  if (+[GKDashboardHostViewController dismissAutomaticallyAfterExtensionCompletion])
  {
    int v4 = [(GKGameCenterViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
  [(UINavigationController *)self _updateViewControllerStackWithViewController:0];

  [(GKGameCenterViewController *)self setRemoteViewController:0];
}

- (BOOL)shouldShowPlayForChallenge
{
  id v2 = [MEMORY[0x1E4F63760] localPlayer];
  id v3 = [v2 eventEmitter];
  char v4 = [v3 listenerRegisteredForSelector:sel_player_wantsToPlayChallenge_];

  if (v4)
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F636B0] challengeEventHandler];
    id v7 = [v6 delegate];

    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

- (BOOL)shouldShowPlayForTurnBasedMatch
{
  id v2 = [MEMORY[0x1E4F63760] localPlayer];
  id v3 = [v2 eventEmitter];
  char v4 = [v3 listenerRegisteredForSelector:sel_player_receivedTurnEventForMatch_didBecomeActive_];

  return v4;
}

- (BOOL)shouldShowQuitForTurnBasedMatch
{
  id v2 = [MEMORY[0x1E4F63760] localPlayer];
  id v3 = [v2 eventEmitter];
  char v4 = [v3 listenerRegisteredForSelector:sel_player_wantsToQuitMatch_];

  return v4;
}

- (GKGameCenterViewControllerState)viewState
{
  return self->_viewState;
}

- (void)setViewState:(GKGameCenterViewControllerState)viewState
{
  p_viewState = &self->_viewState;
  if (self->_viewState != viewState)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v6 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
      -[GKGameCenterViewController setViewState:]();
    }
    int64_t *p_viewState = viewState;
    remoteViewController = self->_remoteViewController;
    id v8 = [NSNumber numberWithInteger:viewState];
    [(GKDashboardHostViewController *)remoteViewController hostDidChangeViewState:v8];

    if (*p_viewState)
    {
      id v9 = [(GKGameCenterViewController *)self leaderboardIdentifier];

      if (v9)
      {
        leaderboardIdentifier = self->_leaderboardIdentifier;
        self->_leaderboardIdentifier = 0;
      }
    }
  }
}

- (NSString)leaderboardIdentifier
{
  return self->_leaderboardIdentifier;
}

- (void)setLeaderboardIdentifier:(NSString *)leaderboardIdentifier
{
  char v5 = leaderboardIdentifier;
  if (![(NSString *)self->_leaderboardIdentifier isEqualToString:v5])
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v6 = (id)GKOSLoggers();
    }
    id v7 = *MEMORY[0x1E4F63868];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
      [(GKGameCenterViewController *)(uint64_t)v5 setLeaderboardIdentifier:v7];
    }
    objc_storeStrong((id *)&self->_leaderboardIdentifier, leaderboardIdentifier);
    if (self->_leaderboardIdentifier)
    {
      -[GKDashboardHostViewController hostDidChangeLeaderboardIdentifier:](self->_remoteViewController, "hostDidChangeLeaderboardIdentifier:");
      self->_viewState = 0;
    }
  }
}

- (GKLeaderboardTimeScope)leaderboardTimeScope
{
  return self->_leaderboardTimeScope;
}

- (void)setLeaderboardTimeScope:(GKLeaderboardTimeScope)leaderboardTimeScope
{
  p_leaderboardTimeScope = &self->_leaderboardTimeScope;
  if (self->_leaderboardTimeScope != leaderboardTimeScope)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v6 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
      -[GKGameCenterViewController setLeaderboardTimeScope:]();
    }
    int64_t *p_leaderboardTimeScope = leaderboardTimeScope;
    remoteViewController = self->_remoteViewController;
    id v8 = [NSNumber numberWithInteger:leaderboardTimeScope];
    [(GKDashboardHostViewController *)remoteViewController hostDidChangeLeaderboardTimeScope:v8];
  }
}

- (int64_t)leaderboardPlayerScope
{
  return self->_leaderboardPlayerScope;
}

- (void)setLeaderboardPlayerScope:(int64_t)a3
{
  p_leaderboardPlayerScope = &self->_leaderboardPlayerScope;
  if (self->_leaderboardPlayerScope != a3)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v6 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
      -[GKGameCenterViewController setLeaderboardPlayerScope:]();
    }
    int64_t *p_leaderboardPlayerScope = a3;
    remoteViewController = self->_remoteViewController;
    id v8 = [NSNumber numberWithInteger:a3];
    [(GKDashboardHostViewController *)remoteViewController hostDidChangeLeaderboardPlayerScope:v8];
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (id)gameCenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gameCenterDelegate);

  return WeakRetained;
}

- (void)setGameCenterDelegate:(id)gameCenterDelegate
{
}

- (NSString)leaderboardSetIdentifier
{
  return self->_leaderboardSetIdentifier;
}

- (void)setLeaderboardSetIdentifier:(id)a3
{
}

- (GKDashboardHostViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (NSString)leaderboardTitle
{
  return self->_leaderboardTitle;
}

- (void)setLeaderboardTitle:(id)a3
{
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSString)playerIdentifier
{
  return self->_playerIdentifier;
}

- (void)setPlayerIdentifier:(id)a3
{
}

- (NSString)playerAlias
{
  return self->_playerAlias;
}

- (void)setPlayerAlias:(id)a3
{
}

- (NSString)gameBundleID
{
  return self->_gameBundleID;
}

- (void)setGameBundleID:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (BOOL)isArcade
{
  return self->_isArcade;
}

- (void)setIsArcade:(BOOL)a3
{
  self->_isArcade = a3;
}

- (int64_t)restrictionMode
{
  return self->_restrictionMode;
}

- (void)setRestrictionMode:(int64_t)a3
{
  self->_restrictionMode = a3;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (GKGame)actualGame
{
  return self->_actualGame;
}

- (void)setActualGame:(id)a3
{
}

- (int)actualHostPID
{
  return self->_actualHostPID;
}

- (void)setActualHostPID:(int)a3
{
  self->_actualHostPID = a3;
}

- (BOOL)isPresentingOverlay
{
  return self->_isPresentingOverlay;
}

- (void)setIsPresentingOverlay:(BOOL)a3
{
  self->_isPresentingOverlay = a3;
}

- (NSString)launchContext
{
  return self->_launchContext;
}

- (void)setLaunchContext:(id)a3
{
}

- (NSString)achievementIdentifier
{
  return self->_achievementIdentifier;
}

- (void)setAchievementIdentifier:(id)a3
{
}

- (NSObject)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_achievementIdentifier, 0);
  objc_storeStrong((id *)&self->_launchContext, 0);
  objc_storeStrong((id *)&self->_actualGame, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_gameBundleID, 0);
  objc_storeStrong((id *)&self->_playerAlias, 0);
  objc_storeStrong((id *)&self->_playerIdentifier, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_leaderboard, 0);
  objc_storeStrong((id *)&self->_leaderboardTitle, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_leaderboardSetIdentifier, 0);
  objc_storeStrong((id *)&self->_leaderboardIdentifier, 0);

  objc_destroyWeak((id *)&self->_gameCenterDelegate);
}

- (GKGameCenterViewController)initWithGame:(id)a3 hostPID:(int)a4 restrictionMode:(int64_t)a5 deeplink:(id)a6 launchContext:(id)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  if (!*MEMORY[0x1E4F63860]) {
    id v16 = (id)GKOSLoggers();
  }
  v17 = (void *)*MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    id v44 = a7;
    id v18 = v15;
    int64_t v19 = a5;
    id v20 = v13;
    actualGame = self->_actualGame;
    v22 = NSNumber;
    int v45 = a4;
    uint64_t actualHostPID = self->_actualHostPID;
    id v24 = v17;
    v25 = [v22 numberWithInt:actualHostPID];
    *(_DWORD *)buf = 138413314;
    v48 = actualGame;
    id v13 = v20;
    a5 = v19;
    id v15 = v18;
    a7 = v44;
    __int16 v49 = 2112;
    v50 = v25;
    __int16 v51 = 2048;
    int64_t v52 = a5;
    __int16 v53 = 2112;
    id v54 = v14;
    __int16 v55 = 2112;
    id v56 = v15;
    _os_log_impl(&dword_1AF250000, v24, OS_LOG_TYPE_INFO, "GKGameCenterViewController.initWithGame:%@\n hostPID:%@\n restrictionMode:%ld\n deeplink:%@\n launchContext:%@", buf, 0x34u);

    a4 = v45;
  }
  v46.receiver = self;
  v46.super_class = (Class)GKGameCenterViewController;
  v26 = [(GKGameCenterViewController *)&v46 init];
  if (v26)
  {
    id v27 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F63438]];
    if ([v27 isEqualToString:*MEMORY[0x1E4F63440]])
    {
      v26->_viewState = 0;
      uint64_t v28 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F63430]];
      leaderboardIdentifier = v26->_leaderboardIdentifier;
      v26->_leaderboardIdentifier = (NSString *)v28;

      uint64_t v30 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F63448]];
      leaderboardTitle = v26->_leaderboardTitle;
      v26->_leaderboardTitle = (NSString *)v30;

      uint64_t v32 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F63460]];
      playerIdentifier = v26->_playerIdentifier;
      v26->_playerIdentifier = (NSString *)v32;

      uint64_t v34 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F63458]];
      uint64_t v35 = 1520;
    }
    else if ([v27 isEqualToString:*MEMORY[0x1E4F63450]])
    {
      v26->_viewState = 3;
      uint64_t v34 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F63460]];
      uint64_t v35 = 1504;
    }
    else if ([v27 isEqualToString:*MEMORY[0x1E4F63420]])
    {
      v26->_viewState = 1;
      uint64_t v36 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F63418]];
      achievementIdentifier = v26->_achievementIdentifier;
      v26->_achievementIdentifier = (NSString *)v36;

      uint64_t v38 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F63458]];
      gameBundleID = v26->_gameBundleID;
      v26->_gameBundleID = (NSString *)v38;

      uint64_t v40 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F63460]];
      v41 = v26->_playerIdentifier;
      v26->_playerIdentifier = (NSString *)v40;

      uint64_t v34 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F63448]];
      uint64_t v35 = 1512;
    }
    else
    {
      if (![v27 isEqualToString:*MEMORY[0x1E4F63428]])
      {
        v26->_viewState = -1;
        goto LABEL_15;
      }
      v26->_viewState = 4;
      uint64_t v34 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F63430]];
      uint64_t v35 = 1496;
    }
    v42 = *(Class *)((char *)&v26->super.super.super.super.isa + v35);
    *(Class *)((char *)&v26->super.super.super.super.isa + v35) = (Class)v34;

LABEL_15:
    v26->_leaderboardTimeScope = 2;
    v26->_leaderboardPlayerScope = 1;
    objc_storeStrong((id *)&v26->_actualGame, a3);
    v26->_uint64_t actualHostPID = a4;
    v26->_restrictionMode = a5;
    objc_storeStrong((id *)&v26->_launchContext, a7);
    [(GKGameCenterViewController *)v26 _setupChildViewController];
  }
  return v26;
}

- (void)setViewStateFromExtension:(int64_t)a3
{
  self->_viewState = a3;
}

- (void)setLeaderboardIdentifierFromExtension:(id)a3
{
}

- (void)setLeaderboardTimeScopeFromExtension:(int64_t)a3
{
  self->_leaderboardTimeScope = a3;
}

- (void)setLeaderboardPlayerScopeFromExtension:(int64_t)a3
{
  self->_leaderboardPlayerScope = a3;
}

- (void)notifyDelegateOnWillFinish
{
  id v3 = [(GKGameCenterViewController *)self gameCenterDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 gameCenterViewControllerDidFinish:self];
  }
}

- (void)presentOverlayWithInitialState:(id)a3
{
  uint64_t v4 = sub_1AF7ADFE0();
  char v5 = self;
  GKGameCenterViewController.presentOverlay(initialState:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

void __55__GKGameCenterViewController__setupChildViewController__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "We failed to present dashboard in the Game Overlay system.", v1, 2u);
}

void __56__GKGameCenterViewController__setupRemoteViewController__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "We failed to present Game Center dashboard extension.", v1, 2u);
}

- (void)setViewState:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF250000, v0, v1, "API set viewState %ld (was: %ld)", v2, v3);
}

- (void)setLeaderboardIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_2(&dword_1AF250000, (uint64_t)a2, a3, "API set leaderboardIdentifier %@ (was: %@)", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)setLeaderboardTimeScope:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF250000, v0, v1, "API set leaderboardTimeScope %ld (was: %ld)", v2, v3);
}

- (void)setLeaderboardPlayerScope:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF250000, v0, v1, "API set leaderboardPlayerScope %ld (was: %ld)", v2, v3);
}

@end