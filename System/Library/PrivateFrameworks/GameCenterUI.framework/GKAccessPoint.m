@interface GKAccessPoint
+ (GKAccessPoint)shared;
- (BOOL)isActive;
- (BOOL)isFocused;
- (BOOL)isPresentingGameCenter;
- (BOOL)isShowingTriggeredPresentation;
- (BOOL)isVisible;
- (BOOL)showHighlights;
- (BOOL)willBecomeActive;
- (CGRect)frameInScreenCoordinates;
- (GKAccessPointLocation)location;
- (GKGameCenterViewController)gameCenterViewController;
- (NSObject)privateImplementation;
- (UIGestureRecognizer)tapGestureRecognizer;
- (UIWindow)parentWindow;
- (UIWindow)window;
- (double)delay;
- (double)timeLastShown;
- (id)viewController;
- (int64_t)hideCount;
- (void)configureIfNeeded;
- (void)decrementHideCount;
- (void)didTapAccessPoint;
- (void)didUpdateLocation:(int64_t)a3;
- (void)didUpdateParentWindow:(id)a3;
- (void)dismissGameCenter;
- (void)gameCenterViewControllerDidFinish:(id)a3;
- (void)hideAccessPoint;
- (void)incrementHideCount;
- (void)loadModels;
- (void)recordAccessPointClick;
- (void)removeWindow;
- (void)resetUI;
- (void)setActive:(BOOL)active;
- (void)setDelay:(double)a3;
- (void)setFocused:(BOOL)focused;
- (void)setFrameInScreenCoordinates:(CGRect)a3;
- (void)setGameCenterViewController:(id)a3;
- (void)setHideCount:(int64_t)a3;
- (void)setIsPresentingGameCenter:(BOOL)a3;
- (void)setIsShowingTriggeredPresentation:(BOOL)a3;
- (void)setLocation:(GKAccessPointLocation)location;
- (void)setParentWindow:(UIWindow *)parentWindow;
- (void)setPrivateImplementation:(id)a3;
- (void)setShowHighlights:(BOOL)showHighlights;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTimeLastShown:(double)a3;
- (void)setViewController:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setWillBecomeActive:(BOOL)a3;
- (void)setWindow:(id)a3;
- (void)showAccessPoint;
- (void)showDashboardWithAchievementID:(id)a3 handler:(id)a4;
- (void)showDashboardWithLeaderboardID:(id)a3 playerScope:(int64_t)a4 timeScope:(int64_t)a5 handler:(id)a6;
- (void)showDashboardWithLeaderboardSetID:(id)a3 handler:(id)a4;
- (void)showDashboardWithPlayer:(id)a3 handler:(id)a4;
- (void)showDashboardWithState:(int64_t)a3 handler:(id)a4;
- (void)showWindow;
- (void)triggerAccessPointWithHandler:(void *)handler;
- (void)triggerAccessPointWithState:(GKGameCenterViewControllerState)state handler:(void *)handler;
- (void)updateUI;
@end

@implementation GKAccessPoint

+ (GKAccessPoint)shared
{
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, &__block_literal_global_11);
  }
  v2 = (void *)shared_sShared_0;

  return (GKAccessPoint *)v2;
}

uint64_t __23__GKAccessPoint_shared__block_invoke()
{
  v0 = objc_alloc_init(GKAccessPoint);
  v1 = (void *)shared_sShared_0;
  shared_sShared_0 = (uint64_t)v0;

  [(id)shared_sShared_0 setDelay:1.0];
  v2 = [MEMORY[0x1E4F637E8] shared];
  uint64_t v3 = [v2 accessPointShowHighlights];
  [(id)shared_sShared_0 setShowHighlights:v3];

  v4 = [MEMORY[0x1E4F637E8] shared];
  uint64_t v5 = [v4 accessPointLocation];
  [(id)shared_sShared_0 setLocation:v5];

  v6 = (void *)shared_sShared_0;

  return [v6 setWillBecomeActive:0];
}

- (void)setIsPresentingGameCenter:(BOOL)a3
{
  self->_isPresentingGameCenter = a3;
}

- (void)showAccessPoint
{
  uint64_t v3 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  v4 = [v3 accountService];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__GKAccessPoint_showAccessPoint__block_invoke;
  v5[3] = &unk_1E5F63198;
  v5[4] = self;
  [v4 isAppUnlistedAndDisallowed:v5];
}

void __32__GKAccessPoint_showAccessPoint__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = (NSObject **)MEMORY[0x1E4F63860];
    uint64_t v3 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v4 = (id)GKOSLoggers();
      uint64_t v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __32__GKAccessPoint_showAccessPoint__block_invoke_cold_1(v3);
    }
  }
  else
  {
    uint64_t v5 = (id *)(a1 + 32);
    [*(id *)(a1 + 32) configureIfNeeded];
    double Current = CFAbsoluteTimeGetCurrent();
    v7 = +[GKAccessPoint shared];
    [v7 setTimeLastShown:Current];

    if ([MEMORY[0x1E4F63760] usesGameOverlayUI]) {
      [MEMORY[0x1E4F63760] showAccessPointInOverlay];
    }
    else {
      [*v5 decrementHideCount];
    }
    v8 = (NSObject **)MEMORY[0x1E4F63860];
    v9 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v10 = (id)GKOSLoggers();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __32__GKAccessPoint_showAccessPoint__block_invoke_cold_2(v5, v9);
    }
    if ([*v5 hideCount] <= 0)
    {
      v11 = [MEMORY[0x1E4F637E8] shared];
      if ([v11 accessPointIsOnAutomatically]
        && ([MEMORY[0x1E4F636F0] isGameCenter] & 1) == 0
        && !*MEMORY[0x1E4F63830]
        && ([MEMORY[0x1E4F636F0] isPreferences] & 1) == 0)
      {
        char v12 = [MEMORY[0x1E4F636F0] isFirstParty];

        if (v12) {
          return;
        }
        v11 = +[GKAccessPoint shared];
        if (![v11 isActive])
        {
          v13 = +[GKAccessPoint shared];
          char v14 = [v13 willBecomeActive];

          if (v14) {
            return;
          }
          v15 = +[GKAccessPoint shared];
          [v15 setWillBecomeActive:1];

          v11 = +[GKAccessPoint shared];
          [v11 delay];
          dispatch_time_t v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
          dispatch_after(v17, MEMORY[0x1E4F14428], &__block_literal_global_24);
        }
      }
    }
  }
}

void __32__GKAccessPoint_showAccessPoint__block_invoke_22()
{
  v0 = +[GKAccessPoint shared];
  [v0 setActive:1];

  id v1 = +[GKAccessPoint shared];
  [v1 setWillBecomeActive:0];
}

- (void)hideAccessPoint
{
  id v3 = a1;
  [a2 hideCount];
  id v4 = _gkTabStringForTabLevel();
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "hideCount"));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1AF250000, v6, v7, "****** %@ - hideCount++  --> %@", v8, v9, v10, v11, v12);
}

- (void)incrementHideCount
{
  [(GKAccessPoint *)self setHideCount:[(GKAccessPoint *)self hideCount] + 1];
  if ([(GKAccessPoint *)self hideCount] >= 1)
  {
    [(GKAccessPoint *)self setIsPresentingGameCenter:1];
  }
}

- (void)decrementHideCount
{
  [(GKAccessPoint *)self setHideCount:[(GKAccessPoint *)self hideCount] - 1];
  if ([(GKAccessPoint *)self hideCount] <= 0)
  {
    [(GKAccessPoint *)self setHideCount:0];
    [(GKAccessPoint *)self setIsPresentingGameCenter:0];
  }
}

- (void)dismissGameCenter
{
  id v3 = [(GKAccessPoint *)self gameCenterViewController];
  [(GKAccessPoint *)self gameCenterViewControllerDidFinish:v3];
}

- (void)triggerAccessPointWithHandler:(void *)handler
{
  id v4 = handler;
  [(GKAccessPoint *)self recordAccessPointClick];
  [(GKAccessPoint *)self showDashboardWithState:-1 handler:v4];
}

- (void)triggerAccessPointWithState:(GKGameCenterViewControllerState)state handler:(void *)handler
{
  id v6 = handler;
  [(GKAccessPoint *)self recordAccessPointClick];
  [(GKAccessPoint *)self showDashboardWithState:state handler:v6];
}

- (void)setLocation:(GKAccessPointLocation)location
{
  if (self->_location != location)
  {
    self->_location = location;
    -[GKAccessPoint didUpdateLocation:](self, "didUpdateLocation:");
  }
}

- (void)setParentWindow:(UIWindow *)parentWindow
{
  obj = parentWindow;
  WeakRetained = (UIWindow *)objc_loadWeakRetained((id *)&self->_parentWindow);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_parentWindow, obj);
    [(GKAccessPoint *)self didUpdateParentWindow:obj];
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)active
{
  self->_active = active;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)willBecomeActive
{
  return self->_willBecomeActive;
}

- (void)setWillBecomeActive:(BOOL)a3
{
  self->_willBecomeActive = a3;
}

- (BOOL)showHighlights
{
  return self->_showHighlights;
}

- (void)setShowHighlights:(BOOL)showHighlights
{
  self->_showHighlights = showHighlights;
}

- (GKAccessPointLocation)location
{
  return self->_location;
}

- (UIWindow)parentWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentWindow);

  return (UIWindow *)WeakRetained;
}

- (CGRect)frameInScreenCoordinates
{
  double x = self->_frameInScreenCoordinates.origin.x;
  double y = self->_frameInScreenCoordinates.origin.y;
  double width = self->_frameInScreenCoordinates.size.width;
  double height = self->_frameInScreenCoordinates.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameInScreenCoordinates:(CGRect)a3
{
  self->_frameInScreenCoordinates = a3;
}

- (id)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (void)setFocused:(BOOL)focused
{
  self->_focused = focused;
}

- (BOOL)isPresentingGameCenter
{
  return self->_isPresentingGameCenter;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (int64_t)hideCount
{
  return self->_hideCount;
}

- (void)setHideCount:(int64_t)a3
{
  self->_hideCount = a3;
}

- (BOOL)isShowingTriggeredPresentation
{
  return self->_isShowingTriggeredPresentation;
}

- (void)setIsShowingTriggeredPresentation:(BOOL)a3
{
  self->_isShowingTriggeredPresentation = a3;
}

- (GKGameCenterViewController)gameCenterViewController
{
  return self->_gameCenterViewController;
}

- (void)setGameCenterViewController:(id)a3
{
}

- (NSObject)privateImplementation
{
  return self->_privateImplementation;
}

- (void)setPrivateImplementation:(id)a3
{
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_deladouble y = a3;
}

- (double)timeLastShown
{
  return self->_timeLastShown;
}

- (void)setTimeLastShown:(double)a3
{
  self->_timeLastShown = a3;
}

- (UIGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_privateImplementation, 0);
  objc_storeStrong((id *)&self->_gameCenterViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong(&self->_viewController, 0);

  objc_destroyWeak((id *)&self->_parentWindow);
}

- (void)configureIfNeeded
{
  v2 = self;
  GKAccessPoint.configureIfNeeded()();
}

- (void)showWindow
{
  v2 = self;
  GKAccessPoint.showWindow()();
}

- (void)removeWindow
{
  v2 = self;
  GKAccessPoint.removeWindow()();
}

- (void)updateUI
{
  v2 = self;
  GKAccessPoint.updateUI()();
}

- (void)resetUI
{
  v2 = self;
  GKAccessPoint.resetUI()();
}

- (void)loadModels
{
  v2 = self;
  GKAccessPoint.loadModels()();
}

- (void)didUpdateLocation:(int64_t)a3
{
  id v4 = self;
  GKAccessPoint.didUpdateLocation(_:)((GKAccessPointLocation)a3);
}

- (void)didUpdateParentWindow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  GKAccessPoint.didUpdateParentWindow(_:)((UIWindow_optional *)v5);
}

- (void)didTapAccessPoint
{
  v2 = self;
  GKAccessPoint.didTapAccessPoint()();
}

- (void)showDashboardWithState:(int64_t)a3 handler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    uint64_t v5 = sub_1AF3FA888;
  }
  id v6 = self;
  GKAccessPoint.showDashboard(state:handler:)();
  sub_1AF368930((uint64_t)v5);
}

- (void)showDashboardWithAchievementID:(id)a3 handler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_1AF7AE0E0();
  uint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v5;
    uint64_t v5 = sub_1AF3FA888;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = self;
  GKAccessPoint.showDashboard(achievementID:handler:)(v6, v8, (uint64_t)v5, v9);
  sub_1AF368930((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)showDashboardWithLeaderboardSetID:(id)a3 handler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_1AF7AE0E0();
  uint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v5;
    uint64_t v5 = sub_1AF3FA888;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = self;
  GKAccessPoint.showDashboard(leaderboardSetID:handler:)(v6, v8, (uint64_t)v5, v9);
  sub_1AF368930((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)showDashboardWithLeaderboardID:(id)a3 playerScope:(int64_t)a4 timeScope:(int64_t)a5 handler:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  uint64_t v10 = sub_1AF7AE0E0();
  uint64_t v12 = v11;
  if (v9)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v9;
    uint64_t v9 = sub_1AF3FA888;
  }
  else
  {
    uint64_t v13 = 0;
  }
  char v14 = self;
  GKAccessPoint.showDashboard(leaderboardID:playerScope:timeScope:handler:)(v10, v12, a4, a5, (uint64_t)v9, v13);
  sub_1AF368930((uint64_t)v9);

  swift_bridgeObjectRelease();
}

- (void)showDashboardWithPlayer:(id)a3 handler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1AF388384;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  uint64_t v9 = self;
  GKAccessPoint.showDashboard(player:handler:)((uint64_t)v8, (uint64_t)v6, v7);
  sub_1AF368930((uint64_t)v6);
}

- (void)gameCenterViewControllerDidFinish:(id)a3
{
  id v4 = (GKGameCenterViewController *)a3;
  uint64_t v5 = self;
  GKAccessPoint.gameCenterViewControllerDidFinish(_:)(v4);
}

- (void)recordAccessPointClick
{
  v2 = self;
  GKAccessPoint.recordAccessPointClick()();
}

void __32__GKAccessPoint_showAccessPoint__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1AF250000, log, OS_LOG_TYPE_DEBUG, "Not showing the access point as Game Center is disabled.", v1, 2u);
}

void __32__GKAccessPoint_showAccessPoint__block_invoke_cold_2(id *a1, void *a2)
{
  id v3 = *a1;
  id v4 = a2;
  [v3 hideCount];
  uint64_t v5 = _gkTabStringForTabLevel();
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*a1, "hideCount"));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1AF250000, v7, v8, "****** %@ - hideCount--  --> %@", v9, v10, v11, v12, v13);
}

@end