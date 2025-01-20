@interface CSMainPageContentViewController
+ (BOOL)isAvailableForConfiguration;
+ (Class)viewClass;
+ (double)_phoneListWidth;
+ (unint64_t)requiredCapabilities;
- (BOOL)_isPortrait;
- (BOOL)_listBelowDateTime;
- (BOOL)_pagingStyleRequiresUserPresenceDetection;
- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3;
- (BOOL)handleEvent:(id)a3;
- (BOOL)hasVisibleBreakthroughContent;
- (BOOL)isNotificationContentExtensionVisible:(id)a3;
- (BOOL)isPresentingNotificationInLongLook;
- (BOOL)isShowingMediaControls;
- (BOOL)useFakeBlur;
- (CSCombinedListViewController)combinedListViewController;
- (CSLayoutStrategy)layoutStrategy;
- (CSMainPageContentViewController)init;
- (CSMainPageContentViewController)initWithAuthenticationProvider:(id)a3;
- (CSMainPageContentViewControllerMediaControlsObserver)mediaControlsObserver;
- (CSMainPageContentViewControllerNotificationObserver)notificationObserver;
- (CSNotificationDispatcher)dispatcher;
- (CSScrollablePageViewControllerDelegate)delegate;
- (CSTouchEnvironmentStatusProviding)touchEnvironmentStatusProvider;
- (CSUserPresenceMonitor)userPresenceMonitor;
- (CSUserSessionControlling)userSessionController;
- (CSWallpaperColorProvider)wallpaperColorProvider;
- (CSWallpaperProviding)wallpaperProvider;
- (SBSWidgetMetricsProviding)widgetMetricsProvider;
- (double)customListWidth;
- (double)dateTimeInsetX;
- (double)listInsetX;
- (double)minimumDateToListSpacing;
- (id)notificationSectionSettingsForCombinedListViewController:(id)a3;
- (unint64_t)dateTimeLayout;
- (unint64_t)listLayout;
- (unint64_t)listWidthStrategy;
- (void)_addOrRemoveLogoutButtonViewController;
- (void)_addOrRemoveNotificationsListIfNecessaryAnimated:(BOOL)a3;
- (void)_addOrRemoveUserPictureViewController;
- (void)_addOrRemoveViewsAsAppropriate;
- (void)_inlineContentGestureRecognizerDidTap:(id)a3;
- (void)_removeInlineContentGestureRecognizer;
- (void)_setupInlineContentGestureRecognizer;
- (void)_updateSmoothestPermittedPagingStrategy;
- (void)addInlineContentSupportForDelegate:(id)a3;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)combinedListViewController:(id)a3 hasContent:(BOOL)a4;
- (void)combinedListViewController:(id)a3 isShowingMediaControls:(BOOL)a4;
- (void)combinedListViewControllerWillExpandNotificationListCount:(id)a3;
- (void)dealloc;
- (void)inlineContentDidChange;
- (void)notificationsLoadedForSectionIdentifier:(id)a3;
- (void)postNotificationRequest:(id)a3;
- (void)removeInlineContentSupport;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4;
- (void)setCombinedListViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setLayoutStrategy:(id)a3;
- (void)setMediaControlsObserver:(id)a3;
- (void)setNotificationObserver:(id)a3;
- (void)setTouchEnvironmentStatusProvider:(id)a3;
- (void)setUseFakeBlur:(BOOL)a3;
- (void)setUserPresenceMonitor:(id)a3;
- (void)setUserSessionController:(id)a3;
- (void)setWallpaperColorProvider:(id)a3;
- (void)setWallpaperProvider:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateForPresentation:(id)a3;
- (void)updateNotificationRequest:(id)a3;
- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4;
- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4;
- (void)userPresenceDetectedSinceWakeDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)withdrawNotificationRequest:(id)a3;
@end

@implementation CSMainPageContentViewController

- (CSMainPageContentViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSMainPageContentViewController;
  v2 = [(CSMainPageContentViewController *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[CSLockScreenDomain rootSettings];
    testSettings = v2->_testSettings;
    v2->_testSettings = (CSLockScreenSettings *)v3;

    [(PTSettings *)v2->_testSettings addKeyObserver:v2];
    v5 = (PRWidgetMetricsProvider *)objc_alloc_init(MEMORY[0x1E4F92730]);
    widgetMetricsProvider = v2->_widgetMetricsProvider;
    v2->_widgetMetricsProvider = v5;

    v7 = objc_alloc_init(CSCombinedListViewController);
    combinedListViewController = v2->_combinedListViewController;
    v2->_combinedListViewController = v7;

    [(CSCombinedListViewController *)v2->_combinedListViewController setDelegate:v2];
    [(CSCombinedListViewController *)v2->_combinedListViewController setPage:v2];
    [(CSCombinedListViewController *)v2->_combinedListViewController setScrollablePage:v2];
    v9 = v2->_combinedListViewController;
    v10 = [(CSMainPageContentViewController *)v2 layoutStrategy];
    [(CSCombinedListViewController *)v9 setLayoutStrategy:v10];

    [(CSCombinedListViewController *)v2->_combinedListViewController setWidgetMetricsProvider:v2->_widgetMetricsProvider];
  }
  return v2;
}

- (SBSWidgetMetricsProviding)widgetMetricsProvider
{
  return self->_widgetMetricsProvider;
}

- (CSMainPageContentViewController)initWithAuthenticationProvider:(id)a3
{
  id v5 = a3;
  v6 = [(CSMainPageContentViewController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authenticationProvider, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(PTSettings *)self->_testSettings removeKeyObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)CSMainPageContentViewController;
  [(CSCoverSheetViewControllerBase *)&v3 dealloc];
}

- (BOOL)isShowingMediaControls
{
  return [(CSCombinedListViewController *)self->_combinedListViewController isShowingMediaControls];
}

- (BOOL)hasVisibleBreakthroughContent
{
  return [(CSCombinedListViewController *)self->_combinedListViewController hasVisibleBreakthroughContent];
}

- (void)setLayoutStrategy:(id)a3
{
  id v5 = (CSLayoutStrategy *)a3;
  if (self->_layoutStrategy != v5)
  {
    objc_storeStrong((id *)&self->_layoutStrategy, a3);
    [(CSCombinedListViewController *)self->_combinedListViewController setLayoutStrategy:v5];
  }
}

- (void)setWallpaperColorProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_wallpaperColorProvider, obj);
    [(CSLogoutButtonViewController *)self->_logoutButtonViewController setWallpaperColorProvider:obj];
  }
}

- (void)setUserPresenceMonitor:(id)a3
{
  id v5 = (CSUserPresenceMonitor *)a3;
  p_userPresenceMonitor = &self->_userPresenceMonitor;
  userPresenceMonitor = self->_userPresenceMonitor;
  v8 = v5;
  if (userPresenceMonitor != v5)
  {
    [(CSUserPresenceMonitor *)userPresenceMonitor disableDetectionForReason:@"Paging Friction"];
    [(CSUserPresenceMonitor *)*p_userPresenceMonitor removeObserver:self];
    objc_storeStrong((id *)&self->_userPresenceMonitor, a3);
    [(CSUserPresenceMonitor *)*p_userPresenceMonitor addObserver:self];
    [(CSCoverSheetViewControllerBase *)self updateBehaviorForController:self];
    [(CSCombinedListViewController *)self->_combinedListViewController setUserPresenceMonitor:v8];
  }
}

- (void)addInlineContentSupportForDelegate:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_inlineContentViewControllerDelegate, a3);
  if ([v5 shouldInlineContentReceiveBackgroundTouches]) {
    [(CSMainPageContentViewController *)self _setupInlineContentGestureRecognizer];
  }
  else {
    [(CSMainPageContentViewController *)self _removeInlineContentGestureRecognizer];
  }
}

- (void)removeInlineContentSupport
{
  if (self->_inlineContentGestureRecognizer) {
    [(CSMainPageContentViewController *)self _removeInlineContentGestureRecognizer];
  }
  inlineContentViewControllerDelegate = self->_inlineContentViewControllerDelegate;
  self->_inlineContentViewControllerDelegate = 0;
}

- (void)inlineContentDidChange
{
  BSDispatchQueueAssertMain();
  inlineContentViewControllerDelegate = self->_inlineContentViewControllerDelegate;
  if (inlineContentViewControllerDelegate)
  {
    int v4 = [(CSMainPageInlineContentViewControllerDelegate *)inlineContentViewControllerDelegate shouldInlineContentReceiveBackgroundTouches];
    inlineContentGestureRecognizer = self->_inlineContentGestureRecognizer;
    if (v4)
    {
      if (!inlineContentGestureRecognizer)
      {
        [(CSMainPageContentViewController *)self _setupInlineContentGestureRecognizer];
      }
    }
    else if (inlineContentGestureRecognizer)
    {
      [(CSMainPageContentViewController *)self _removeInlineContentGestureRecognizer];
    }
  }
}

- (void)_setupInlineContentGestureRecognizer
{
  if (!self->_inlineContentGestureRecognizer)
  {
    objc_super v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__inlineContentGestureRecognizerDidTap_];
    inlineContentGestureRecognizer = self->_inlineContentGestureRecognizer;
    self->_inlineContentGestureRecognizer = v3;

    [(UITapGestureRecognizer *)self->_inlineContentGestureRecognizer setNumberOfTapsRequired:1];
    id v5 = [(CSPageViewController *)self view];
    [v5 addGestureRecognizer:self->_inlineContentGestureRecognizer];
  }
}

- (void)_removeInlineContentGestureRecognizer
{
  if (self->_inlineContentGestureRecognizer)
  {
    objc_super v3 = [(CSPageViewController *)self view];
    [v3 removeGestureRecognizer:self->_inlineContentGestureRecognizer];

    inlineContentGestureRecognizer = self->_inlineContentGestureRecognizer;
    self->_inlineContentGestureRecognizer = 0;
  }
}

- (void)_inlineContentGestureRecognizerDidTap:(id)a3
{
  if ([a3 state] == 3)
  {
    [(CSMainPageInlineContentViewControllerDelegate *)self->_inlineContentViewControllerDelegate didReceiveBackgroundTouch];
    [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
  }
}

- (void)viewDidLoad
{
  objc_super v3 = [(CSPageViewController *)self view];
  [MEMORY[0x1E4FA7D30] idealSearchPlatterWidth];
  objc_msgSend(v3, "setContentWidth:");
  [(CSCoverSheetViewControllerBase *)self registerView:v3 forRole:1];
  v4.receiver = self;
  v4.super_class = (Class)CSMainPageContentViewController;
  [(CSPageViewController *)&v4 viewDidLoad];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSMainPageContentViewController;
  [(CSPresentationViewController *)&v3 viewWillLayoutSubviews];
  [(CSCombinedListViewController *)self->_combinedListViewController layoutListView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSMainPageContentViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  [(CSMainPageContentViewController *)self _updateSmoothestPermittedPagingStrategy];
  [(CSMainPageContentViewController *)self _addOrRemoveViewsAsAppropriate];
  [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)aggregateAppearance:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSMainPageContentViewController;
  [(CSPageViewController *)&v19 aggregateAppearance:v4];
  id v5 = [(CSCoverSheetViewControllerBase *)self kitPresentedViewController];
  if (v5)
  {
    if (objc_opt_respondsToSelector())
    {
      v6 = +[CSAppearance appearanceForProvider:v5];
    }
    else
    {
      v7 = NSString;
      v8 = [MEMORY[0x1E4F4F718] descriptionForObject:v5];
      v9 = [v7 stringWithFormat:@"MainPageUIKitModal:%@", v8];

      v6 = +[CSAppearance appearanceWithIdentifier:v9];
      v10 = [v5 presentationController];
      int v11 = [v10 shouldPresentInFullscreen];

      if (v11)
      {
        objc_super v12 = objc_opt_new();
        v13 = [v12 priority:10];
        v14 = [v13 fakeStatusBar:1];
        v15 = [v14 fakeStatusBarLevel:&unk_1F306BD70];
        [v6 addComponent:v15];
      }
    }
    [v4 unionAppearance:v6];
  }
  if (self->_inlineContentViewControllerDelegate) {
    objc_msgSend(v4, "unionAppearance:");
  }
  if (self->_useFakeBlur)
  {
    v16 = objc_opt_new();
    v17 = [v16 priority:10];
    v18 = [v17 style:&unk_1F306BD88];
    [v4 addComponent:v18];
  }
}

- (void)aggregateBehavior:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSMainPageContentViewController;
  [(CSPageViewController *)&v17 aggregateBehavior:v4];
  uint64_t v5 = [v4 scrollingStrategy];
  switch(self->_smoothestPermittedStrategy)
  {
    case 0:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_touchEnvironmentStatusProvider);
      if ([WeakRetained expectsPocketTouches]) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 2;
      }

      break;
    case 1:
      int v8 = [(SBFAuthenticationStatusProvider *)self->_authenticationProvider isAuthenticatedCached];
      goto LABEL_11;
    case 2:
      uint64_t v7 = 1;
      break;
    case 3:
      uint64_t v7 = 2;
      break;
    case 4:
      int v8 = [(CSUserPresenceMonitor *)self->_userPresenceMonitor userPresenceDetectedSinceWake];
LABEL_11:
      if (v8) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 1;
      }
      break;
    default:
      uint64_t v7 = 0;
      break;
  }
  if (v5 <= v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v5;
  }
  [v4 setScrollingStrategy:v9];
  v10 = [(CSCoverSheetViewControllerBase *)self kitPresentedViewController];
  int v11 = v10;
  if (v10)
  {
    objc_super v12 = [v10 transitionCoordinator];
    v13 = v12;
    if (v12 && ([v12 isInteractive] & 1) != 0) {
      goto LABEL_28;
    }
    v14 = +[CSBehavior behavior];
    if (objc_opt_respondsToSelector())
    {
      [v14 unionBehavior:v11];
LABEL_27:
      [v4 unionBehavior:v14];

LABEL_28:
      goto LABEL_29;
    }
    [v14 setIdleTimerMode:1];
    v15 = [v11 presentationController];
    if ([v15 shouldPresentInFullscreen])
    {
      int v16 = [v11 isBeingPresented];

      if (v16)
      {
        [v14 setScrollingStrategy:3];
        [v14 setIdleTimerDuration:10];
        [v14 setIdleWarnMode:2];
        goto LABEL_27;
      }
    }
    else
    {
    }
    [v14 setIdleTimerDuration:9];
    goto LABEL_27;
  }
LABEL_29:
  if (self->_inlineContentViewControllerDelegate) {
    objc_msgSend(v4, "unionBehavior:");
  }
}

- (void)updateForPresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSMainPageContentViewController *)self _mainPageView];
  [v5 updateForPresentation:v4];

  v6.receiver = self;
  v6.super_class = (Class)CSMainPageContentViewController;
  [(CSCoverSheetViewControllerBase *)&v6 updateForPresentation:v4];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSMainPageContentViewController;
  if (![(CSPresentationViewController *)&v17 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    uint64_t v6 = [v4 type];
    char v5 = 0;
    if (v6 > 12)
    {
      switch(v6)
      {
        case 13:
          [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
          break;
        case 21:
          if ([(CSMainPageInlineContentViewControllerDelegate *)self->_inlineContentViewControllerDelegate shouldInlineContentReceiveBackgroundTouches])[(CSMainPageInlineContentViewControllerDelegate *)self->_inlineContentViewControllerDelegate didReceiveBackgroundScroll]; {
          break;
          }
        case 24:
          if (![(CSCombinedListViewController *)self->_combinedListViewController hasContent])
          {
            int v8 = dispatch_get_global_queue(17, 0);
            dispatch_async(v8, &__block_literal_global_0);
          }
          break;
        default:
          goto LABEL_20;
      }
    }
    else
    {
      switch(v6)
      {
        case 1:
          [(CSMainPageContentViewController *)self _addOrRemoveViewsAsAppropriate];
          uint64_t v9 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
          v10 = [v9 legibilitySettings];

          int v11 = [(CSMainPageContentViewController *)self _mainPageView];
          [v11 updateForLegibilitySettings:v10];

          objc_super v12 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
          v13 = [v12 componentForType:6 property:1];
          uint64_t v14 = [v13 isHidden] ^ 1;

          v15 = [(CSMainPageContentViewController *)self _mainPageView];
          [v15 setFakeWallpaperVisible:v14];

          break;
        case 2:
          [(CSMainPageContentViewController *)self _addOrRemoveViewsAsAppropriate];
          break;
        case 9:
          userPictureViewController = self->_userPictureViewController;
          self->_userPictureViewController = 0;

          break;
        default:
          goto LABEL_20;
      }
    }
    char v5 = 0;
    goto LABEL_20;
  }
  char v5 = [v4 isConsumable];
LABEL_20:

  return v5;
}

void __47__CSMainPageContentViewController_handleEvent___block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.lockNotificationListEmptyAtScreenOn", 0, 0, 1u);
}

- (CSNotificationDispatcher)dispatcher
{
  return [(CSCombinedListViewController *)self->_combinedListViewController dispatcher];
}

- (void)setDispatcher:(id)a3
{
}

- (void)postNotificationRequest:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    uint64_t v9 = [v4 notificationIdentifier];
    v10 = objc_msgSend(v9, "un_logDigest");
    int v11 = (objc_class *)objc_opt_class();
    objc_super v12 = NSStringFromClass(v11);
    int v14 = 138543874;
    v15 = v8;
    __int16 v16 = 2114;
    objc_super v17 = v10;
    __int16 v18 = 2114;
    objc_super v19 = v12;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ posting notification %{public}@ to %{public}@", (uint8_t *)&v14, 0x20u);
  }
  [(CSCombinedListViewController *)self->_combinedListViewController postNotificationRequest:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationObserver);
  [WeakRetained didPostNotificationRequest:v4];
}

- (void)updateNotificationRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    uint64_t v9 = [v4 notificationIdentifier];
    v10 = objc_msgSend(v9, "un_logDigest");
    int v11 = 138543618;
    objc_super v12 = v8;
    __int16 v13 = 2114;
    int v14 = v10;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ updating notification %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(CSCombinedListViewController *)self->_combinedListViewController updateNotificationRequest:v4];
}

- (void)withdrawNotificationRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    uint64_t v9 = [v4 notificationIdentifier];
    v10 = objc_msgSend(v9, "un_logDigest");
    int v11 = 138543618;
    objc_super v12 = v8;
    __int16 v13 = 2114;
    int v14 = v10;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ withdrawing notification %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(CSCombinedListViewController *)self->_combinedListViewController withdrawNotificationRequest:v4];
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  id v4 = a3;
  BOOL v7 = [(CSPageViewController *)self participantState] == 2
    && self->_combinedListViewController
    && ([(CSPresentationViewController *)self contentViewControllers],
        char v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 containsObject:self->_combinedListViewController],
        v5,
        v6)
    && [(CSCombinedListViewController *)self->_combinedListViewController isNotificationContentExtensionVisible:v4];

  return v7;
}

- (BOOL)isPresentingNotificationInLongLook
{
  if ([(CSPageViewController *)self participantState] != 2) {
    return 0;
  }
  if (!self->_combinedListViewController) {
    return 0;
  }
  objc_super v3 = [(CSPresentationViewController *)self contentViewControllers];
  int v4 = [v3 containsObject:self->_combinedListViewController];

  if (!v4) {
    return 0;
  }
  combinedListViewController = self->_combinedListViewController;

  return [(CSCombinedListViewController *)combinedListViewController isPresentingNotificationInLongLook];
}

- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSPageViewController *)self participantState] != 2) {
    return 0;
  }
  if (!self->_combinedListViewController) {
    return 0;
  }
  char v5 = [(CSPresentationViewController *)self contentViewControllers];
  int v6 = [v5 containsObject:self->_combinedListViewController];

  if (!v6) {
    return 0;
  }
  combinedListViewController = self->_combinedListViewController;

  return [(CSCombinedListViewController *)combinedListViewController dismissNotificationInLongLookAnimated:v3];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  [(CSMainPageContentViewController *)self _addOrRemoveViewsAsAppropriate];
  id v7 = [(CSLockScreenSettings *)self->_testSettings dashBoardScrollModifierSettings];

  if (v7 == v6 && [v8 isEqualToString:@"strategy"])
  {
    [(CSMainPageContentViewController *)self _updateSmoothestPermittedPagingStrategy];
    [(CSCoverSheetViewControllerBase *)self updateBehaviorForController:self];
  }
}

- (void)combinedListViewController:(id)a3 hasContent:(BOOL)a4
{
}

- (id)notificationSectionSettingsForCombinedListViewController:(id)a3
{
  int v4 = [(CSMainPageContentViewController *)self dispatcher];
  char v5 = [v4 notificationSectionSettingsForDestination:self];

  return v5;
}

- (void)combinedListViewControllerWillExpandNotificationListCount:(id)a3
{
  if ([(CSMainPageInlineContentViewControllerDelegate *)self->_inlineContentViewControllerDelegate shouldInlineContentReceiveBackgroundTouches])
  {
    inlineContentViewControllerDelegate = self->_inlineContentViewControllerDelegate;
    [(CSMainPageInlineContentViewControllerDelegate *)inlineContentViewControllerDelegate didReceiveBackgroundTouch];
  }
}

- (void)combinedListViewController:(id)a3 isShowingMediaControls:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaControlsObserver);
  [WeakRetained setShowingMediaControls:v4];
}

- (void)userPresenceDetectedSinceWakeDidChange:(id)a3
{
  if ([(CSMainPageContentViewController *)self _pagingStyleRequiresUserPresenceDetection])
  {
    [(CSCoverSheetViewControllerBase *)self updateBehaviorForController:self];
  }
}

- (BOOL)_pagingStyleRequiresUserPresenceDetection
{
  v2 = [(CSLockScreenSettings *)self->_testSettings dashBoardScrollModifierSettings];
  BOOL v3 = [v2 strategy] == 4;

  return v3;
}

- (void)_updateSmoothestPermittedPagingStrategy
{
  BOOL v3 = [(CSLockScreenSettings *)self->_testSettings dashBoardScrollModifierSettings];
  int64_t v4 = [v3 strategy];

  BOOL v5 = [(CSUserPresenceMonitor *)self->_userPresenceMonitor isUserPresenceDetectionSupported];
  unsigned int v6 = [(SBFAuthenticationStatusProvider *)self->_authenticationProvider hasPasscodeSet];
  if (v4 == 1) {
    goto LABEL_6;
  }
  if (v4 == 4)
  {
    userPresenceMonitor = self->_userPresenceMonitor;
    if (v5)
    {
      [(CSUserPresenceMonitor *)userPresenceMonitor enableDetectionForReason:@"Paging Friction"];
      int64_t v4 = 4;
      goto LABEL_7;
    }
    [(CSUserPresenceMonitor *)userPresenceMonitor disableDetectionForReason:@"Paging Friction"];
LABEL_6:
    int64_t v4 = v6;
  }
LABEL_7:
  self->_smoothestPermittedStrategy = v4;
}

+ (unint64_t)requiredCapabilities
{
  return 0;
}

+ (BOOL)isAvailableForConfiguration
{
  return 1;
}

- (unint64_t)dateTimeLayout
{
  if ([(CSMainPageContentViewController *)self _listBelowDateTime]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (double)dateTimeInsetX
{
  int64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  double result = 16.0;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    BOOL v7 = [(CSMainPageContentViewController *)self _isPortrait];
    double result = 24.0;
    if (!v7)
    {
      int v8 = __sb__runningInSpringBoard();
      char v9 = v8;
      if (v8)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
          goto LABEL_21;
        }
        if (SBFEffectiveHomeButtonType() != 2)
        {
          if (v9) {
            goto LABEL_21;
          }
LABEL_13:

          goto LABEL_21;
        }
      }
      else
      {
        int64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
        if ([v4 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2) {
          goto LABEL_13;
        }
      }
      int v10 = __sb__runningInSpringBoard();
      char v11 = v10;
      if (v10)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      double v13 = v12;
      double v14 = *(double *)(MEMORY[0x1E4FA6E50] + 120);
      if ((v11 & 1) == 0) {

      }
      if ((v9 & 1) == 0) {
      if (v13 >= v14)
      }
        return 88.0;
LABEL_21:
      int v16 = __sb__runningInSpringBoard();
      char v17 = v16;
      if (v16)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
          goto LABEL_39;
        }
        if (SBFEffectiveHomeButtonType() != 2)
        {
          if (v17) {
            goto LABEL_39;
          }
LABEL_31:

          goto LABEL_39;
        }
      }
      else
      {
        int64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
        if ([v4 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2) {
          goto LABEL_31;
        }
      }
      int v18 = __sb__runningInSpringBoard();
      char v19 = v18;
      if (v18)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      double v21 = v20;
      double v22 = *(double *)(MEMORY[0x1E4FA6E50] + 88);
      if ((v19 & 1) == 0) {

      }
      if ((v17 & 1) == 0) {
      if (v21 >= v22)
      }
        return 78.0;
LABEL_39:
      int v23 = __sb__runningInSpringBoard();
      char v24 = v23;
      if (v23)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
          return 40.0;
        }
      }
      else
      {
        int64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
        if ([v4 userInterfaceIdiom])
        {

          return 40.0;
        }
      }
      int v25 = __sb__runningInSpringBoard();
      char v26 = v25;
      if (v25)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      BOOL v28 = v27 >= *(double *)(MEMORY[0x1E4FA6E50] + 56);
      if (v26)
      {
        if (v24) {
          goto LABEL_50;
        }
      }
      else
      {

        if (v24)
        {
LABEL_50:
          if (v28) {
            return 44.0;
          }
          return 40.0;
        }
      }

      if (v28) {
        return 44.0;
      }
      return 40.0;
    }
  }
  return result;
}

- (double)minimumDateToListSpacing
{
  int64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  double v6 = 0.0;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 || [(CSMainPageContentViewController *)self _isPortrait]) {
    return v6;
  }
  int v7 = __sb__runningInSpringBoard();
  char v8 = v7;
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_20;
    }
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if (v8) {
        goto LABEL_20;
      }
LABEL_13:

      goto LABEL_20;
    }
  }
  else
  {
    int64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v4 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2) {
      goto LABEL_13;
    }
  }
  int v9 = __sb__runningInSpringBoard();
  char v10 = v9;
  if (v9)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v12 = v11;
  double v13 = *(double *)(MEMORY[0x1E4FA6E50] + 72);
  if ((v10 & 1) == 0) {

  }
  if ((v8 & 1) == 0) {
  double v6 = 24.0;
  }
  if (v12 >= v13) {
    return v6;
  }
LABEL_20:
  int v14 = __sb__runningInSpringBoard();
  char v15 = v14;
  if (!v14)
  {
    int64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v4 userInterfaceIdiom])
    {

      goto LABEL_35;
    }
LABEL_26:
    int v16 = __sb__runningInSpringBoard();
    char v17 = v16;
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    double v19 = v18;
    double v20 = *(double *)(MEMORY[0x1E4FA6E50] + 56);
    if ((v17 & 1) == 0) {

    }
    if ((v15 & 1) == 0) {
    if (v19 >= v20)
    }
    {
      uint64_t v21 = 0x4044000000000000;
      return *(double *)&v21;
    }
    goto LABEL_35;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_26;
  }
LABEL_35:
  int v22 = __sb__runningInSpringBoard();
  char v23 = v22;
  if (v22)
  {
    if (SBFEffectiveDeviceClass())
    {
      double v6 = 24.0;
      if (SBFEffectiveDeviceClass() != 1) {
        return v6;
      }
    }
  }
  else
  {
    int64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v4 userInterfaceIdiom])
    {

      return 24.0;
    }
  }
  int v24 = __sb__runningInSpringBoard();
  char v25 = v24;
  if (v24)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v27 = v26 >= *(double *)(MEMORY[0x1E4FA6E50] + 40);
  if ((v25 & 1) == 0) {

  }
  if ((v23 & 1) == 0) {
  double v6 = 24.0;
  }
  if (v27)
  {
    uint64_t v21 = 0x4040000000000000;
    return *(double *)&v21;
  }
  return v6;
}

- (unint64_t)listLayout
{
  if ([(CSMainPageContentViewController *)self _listBelowDateTime]) {
    return 1;
  }
  else {
    return 3;
  }
}

- (unint64_t)listWidthStrategy
{
  BOOL v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1 && ![(CSMainPageContentViewController *)self _isPortrait]) {
    return 2;
  }
  uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  return (v6 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (double)customListWidth
{
  BOOL v3 = [(CSPageViewController *)self view];
  [v3 bounds];
  double Height = CGRectGetHeight(v11);

  uint64_t v5 = [(CSPageViewController *)self view];
  [v5 bounds];
  double Width = CGRectGetWidth(v12);

  if (Height >= Width) {
    double Height = Width;
  }
  int v7 = [(CSMainPageContentViewController *)self combinedListViewController];
  [v7 horizontalInsetMargin];
  double v9 = Height + v8 * -2.0;

  return v9;
}

- (double)listInsetX
{
  uint64_t v5 = [(CSMainPageContentViewController *)self combinedListViewController];
  [v5 horizontalInsetMargin];
  double v7 = v6;

  if ([(CSMainPageContentViewController *)self _listBelowDateTime]) {
    return v7;
  }
  int v8 = __sb__runningInSpringBoard();
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v9 = 0;
      int v10 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v126 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v126 userInterfaceIdiom] != 1)
    {
      int v9 = 0;
      int v10 = 1;
      goto LABEL_11;
    }
  }
  int v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v127 = [MEMORY[0x1E4F42D90] mainScreen];
      [v127 _referenceBounds];
    }
    int v9 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v32 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v31 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v150 = v11 ^ 1;
      int v151 = v10;
      uint64_t v140 = 0;
      uint64_t v139 = 0;
      long long v141 = 0uLL;
      memset(v138, 0, sizeof(v138));
      memset(v137, 0, sizeof(v137));
      long long v142 = 0uLL;
      uint64_t v135 = 0;
      uint64_t v136 = 0;
      int v149 = 0;
      uint64_t v132 = 0;
      uint64_t v133 = 0;
      int v134 = 0;
      int v143 = 0;
      int v144 = 0;
      uint64_t v131 = 0;
      int v145 = 0;
      uint64_t v129 = 0;
      int v146 = 0;
      uint64_t v130 = 0;
      int v147 = 0;
      uint64_t v128 = 0;
      int v22 = 0;
      int v23 = 0;
      int v148 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      double v7 = 0.0;
      goto LABEL_68;
    }
  }
  else
  {
    int v9 = 0;
  }
LABEL_11:
  int v12 = __sb__runningInSpringBoard();
  int v150 = v9;
  int v151 = v10;
  if (v12)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v13 = 0;
      int v14 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v125 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v125 userInterfaceIdiom] != 1)
    {
      int v13 = 0;
      int v14 = 1;
      goto LABEL_20;
    }
  }
  int v14 = v12 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v117 = [MEMORY[0x1E4F42D90] mainScreen];
      [v117 _referenceBounds];
    }
    int v13 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v34 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v147 = v11 ^ 1;
      int v148 = v14;
      uint64_t v140 = 0;
      uint64_t v139 = 0;
      long long v141 = 0uLL;
      memset(v138, 0, sizeof(v138));
      memset(v137, 0, sizeof(v137));
      long long v142 = 0uLL;
      uint64_t v135 = 0;
      uint64_t v136 = 0;
      int v149 = 0;
      uint64_t v132 = 0;
      uint64_t v133 = 0;
      int v134 = 0;
      int v143 = 0;
      int v144 = 0;
      uint64_t v131 = 0;
      int v145 = 0;
      uint64_t v129 = 0;
      int v146 = 0;
      uint64_t v130 = 0;
      uint64_t v128 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      double v7 = 0.0;
      goto LABEL_68;
    }
  }
  else
  {
    int v13 = 0;
  }
LABEL_20:
  int v15 = __sb__runningInSpringBoard();
  int v147 = v13;
  int v148 = v14;
  if (v15)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v16 = 0;
      int v17 = 0;
      goto LABEL_29;
    }
  }
  else
  {
    v124 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v124 userInterfaceIdiom] != 1)
    {
      int v16 = 0;
      int v17 = 1;
      goto LABEL_29;
    }
  }
  int v17 = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v116 = [MEMORY[0x1E4F42D90] mainScreen];
      [v116 _referenceBounds];
    }
    int v16 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v35 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v145 = v11 ^ 1;
      int v146 = v17;
      uint64_t v140 = 0;
      uint64_t v139 = 0;
      long long v141 = 0uLL;
      memset(v138, 0, sizeof(v138));
      memset(v137, 0, sizeof(v137));
      long long v142 = 0uLL;
      uint64_t v135 = 0;
      uint64_t v136 = 0;
      int v149 = 0;
      uint64_t v132 = 0;
      uint64_t v133 = 0;
      int v134 = 0;
      int v143 = 0;
      int v144 = 0;
      uint64_t v131 = 0;
      uint64_t v130 = 0;
      uint64_t v129 = 0;
      uint64_t v128 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      double v7 = 0.0;
      goto LABEL_68;
    }
  }
  else
  {
    int v16 = 0;
  }
LABEL_29:
  int v18 = __sb__runningInSpringBoard();
  int v145 = v16;
  int v146 = v17;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v3 = 0;
      int v19 = 0;
      goto LABEL_38;
    }
  }
  else
  {
    v123 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v123 userInterfaceIdiom] != 1)
    {
      uint64_t v3 = 0;
      int v19 = 1;
      goto LABEL_38;
    }
  }
  int v19 = v18 ^ 1;
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v120 = [MEMORY[0x1E4F42D90] mainScreen];
    [v120 _referenceBounds];
  }
  uint64_t v3 = v11 ^ 1;
  BSSizeRoundForScale();
  if (v20 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v143 = v11 ^ 1;
    int v144 = v19;
    uint64_t v140 = 0;
    uint64_t v139 = 0;
    long long v141 = 0uLL;
    memset(v138, 0, sizeof(v138));
    memset(v137, 0, sizeof(v137));
    long long v142 = 0uLL;
    uint64_t v135 = 0;
    uint64_t v136 = 0;
    int v149 = 0;
    uint64_t v132 = 0;
    uint64_t v133 = 0;
    int v134 = 0;
    uint64_t v129 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v128 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 0.0;
    goto LABEL_68;
  }
LABEL_38:
  int v21 = __sb__runningInSpringBoard();
  int v143 = v3;
  int v144 = v19;
  if (v21)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v149 = 0;
      uint64_t v2 = 0;
      goto LABEL_48;
    }
  }
  else
  {
    v122 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v122 userInterfaceIdiom] != 1)
    {
      int v149 = 0;
      uint64_t v2 = 1;
      goto LABEL_48;
    }
  }
  uint64_t v2 = v21 ^ 1u;
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v118 = [MEMORY[0x1E4F42D90] mainScreen];
    [v118 _referenceBounds];
  }
  int v149 = v11 ^ 1;
  BSSizeRoundForScale();
  if (v29 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    DWORD2(v142) = 0;
    HIDWORD(v142) = v2;
    uint64_t v140 = 0;
    uint64_t v139 = 0;
    long long v141 = 0uLL;
    memset(v138, 0, sizeof(v138));
    memset(v137, 0, sizeof(v137));
    *(void *)&long long v142 = 0;
    uint64_t v135 = 0;
    uint64_t v136 = 0;
    uint64_t v132 = 0;
    uint64_t v133 = 0;
    int v134 = 0;
    uint64_t v129 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v128 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 0.0;
    goto LABEL_68;
  }
LABEL_48:
  int v30 = __sb__runningInSpringBoard();
  HIDWORD(v142) = v2;
  if (v30)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v142 + 4) = 0;
      goto LABEL_179;
    }
  }
  else
  {
    v121 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v121 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v142 + 4) = 0x100000000;
      goto LABEL_179;
    }
  }
  DWORD2(v142) = v30 ^ 1;
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v115 = [MEMORY[0x1E4F42D90] mainScreen];
    [v115 _referenceBounds];
  }
  DWORD1(v142) = v11 ^ 1;
  BSSizeRoundForScale();
  if (v37 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    uint64_t v140 = 0;
    uint64_t v139 = 0;
    long long v141 = 0uLL;
    memset(v138, 0, sizeof(v138));
    memset(v137, 0, sizeof(v137));
    LODWORD(v142) = 0;
    uint64_t v135 = 0;
    uint64_t v136 = 0;
    uint64_t v132 = 0;
    uint64_t v133 = 0;
    int v134 = 0;
    uint64_t v129 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v128 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 0.0;
    goto LABEL_68;
  }
LABEL_179:
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_181;
    }
LABEL_187:
    uint64_t v140 = 0;
    uint64_t v139 = 0;
    long long v141 = 0uLL;
    memset(v138, 0, sizeof(v138));
    memset(v137, 0, sizeof(v137));
    uint64_t v135 = 0;
    uint64_t v136 = 0;
    uint64_t v132 = 0;
    uint64_t v133 = 0;
    int v134 = 0;
    uint64_t v129 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v128 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 0.0;
    LODWORD(v142) = v11 ^ 1;
    goto LABEL_68;
  }
  v119 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v119 userInterfaceIdiom] == 1) {
    goto LABEL_187;
  }
LABEL_181:
  LODWORD(v142) = v11 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_185:
    *(void *)((char *)&v141 + 4) = 0;
    goto LABEL_195;
  }
  int v38 = __sb__runningInSpringBoard();
  if (v38)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_185;
    }
  }
  else
  {
    v113 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v113 userInterfaceIdiom])
    {
      *(void *)((char *)&v141 + 4) = 1;
      goto LABEL_195;
    }
  }
  DWORD1(v141) = v38 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v106 = [MEMORY[0x1E4F42D90] mainScreen];
      [v106 _referenceBounds];
    }
    DWORD2(v141) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v41 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      uint64_t v140 = 0;
      uint64_t v139 = 0;
      LODWORD(v141) = 0;
      HIDWORD(v141) = 0;
      memset(v138, 0, sizeof(v138));
      memset(v137, 0, sizeof(v137));
      uint64_t v135 = 0;
      uint64_t v136 = 0;
      uint64_t v132 = 0;
      uint64_t v133 = 0;
      int v134 = 0;
      uint64_t v129 = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v128 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      double v7 = 136.0;
      goto LABEL_68;
    }
  }
  else
  {
    DWORD2(v141) = 0;
  }
LABEL_195:
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v141) = 0;
      HIDWORD(v141) = 0;
      goto LABEL_205;
    }
  }
  else
  {
    v114 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v114 userInterfaceIdiom])
    {
      LODWORD(v141) = 0;
      HIDWORD(v141) = 1;
      goto LABEL_205;
    }
  }
  HIDWORD(v141) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v109 = [MEMORY[0x1E4F42D90] mainScreen];
      [v109 _referenceBounds];
    }
    LODWORD(v141) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v39 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_209;
    }
  }
  else
  {
    LODWORD(v141) = 0;
  }
LABEL_205:
  if (_SBF_Private_IsD94Like())
  {
    uint64_t v140 = 0;
    uint64_t v139 = 0;
    memset(v138, 0, sizeof(v138));
    memset(v137, 0, sizeof(v137));
    uint64_t v135 = 0;
    uint64_t v136 = 0;
    uint64_t v132 = 0;
    uint64_t v133 = 0;
    int v134 = 0;
    uint64_t v129 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v128 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 129.0;
    goto LABEL_68;
  }
LABEL_209:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_213:
    uint64_t v140 = 0;
    goto LABEL_223;
  }
  int v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_213;
    }
  }
  else
  {
    v110 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v110 userInterfaceIdiom])
    {
      uint64_t v140 = 0x100000000;
      goto LABEL_223;
    }
  }
  HIDWORD(v140) = v40 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v101 = [MEMORY[0x1E4F42D90] mainScreen];
      [v101 _referenceBounds];
    }
    LODWORD(v140) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v46 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      uint64_t v139 = 0;
      memset(v138, 0, sizeof(v138));
      memset(v137, 0, sizeof(v137));
      uint64_t v135 = 0;
      uint64_t v136 = 0;
      uint64_t v132 = 0;
      uint64_t v133 = 0;
      int v134 = 0;
      uint64_t v129 = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v128 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      double v7 = 124.0;
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v140) = 0;
  }
LABEL_223:
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v139) = 0;
      *(_DWORD *)&v138[16] = 0;
      goto LABEL_233;
    }
  }
  else
  {
    v112 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v112 userInterfaceIdiom])
    {
      *(_DWORD *)&v138[16] = 0;
      HIDWORD(v139) = 1;
      goto LABEL_233;
    }
  }
  HIDWORD(v139) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v105 = [MEMORY[0x1E4F42D90] mainScreen];
      [v105 _referenceBounds];
    }
    *(_DWORD *)&v138[16] = v11 ^ 1;
    BSSizeRoundForScale();
    if (v42 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_237;
    }
  }
  else
  {
    *(_DWORD *)&v138[16] = 0;
  }
LABEL_233:
  if (_SBF_Private_IsD64Like())
  {
    LODWORD(v139) = 0;
    *(void *)v138 = 0;
    *(void *)&v138[8] = 0;
    memset(v137, 0, sizeof(v137));
    uint64_t v135 = 0;
    uint64_t v136 = 0;
    uint64_t v132 = 0;
    uint64_t v133 = 0;
    int v134 = 0;
    uint64_t v129 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v128 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 118.0;
    goto LABEL_68;
  }
LABEL_237:
  int v43 = __sb__runningInSpringBoard();
  if (v43)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v139) = 0;
      *(_DWORD *)&v138[12] = 0;
      goto LABEL_247;
    }
  }
  else
  {
    v111 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v111 userInterfaceIdiom])
    {
      *(_DWORD *)&v138[12] = 0;
      LODWORD(v139) = 1;
      goto LABEL_247;
    }
  }
  LODWORD(v139) = v43 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v44 = __sb__runningInSpringBoard();
    if (v44)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v102 = [MEMORY[0x1E4F42D90] mainScreen];
      [v102 _referenceBounds];
    }
    uint64_t v11 = v44 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v138[12] = v11;
    if (v45 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)v138 = 0;
      memset(v137, 0, sizeof(v137));
      *(_DWORD *)&v138[8] = 0;
      uint64_t v135 = 0;
      uint64_t v136 = 0;
      uint64_t v132 = 0;
      uint64_t v133 = 0;
      int v134 = 0;
      uint64_t v129 = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v128 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      double v7 = 124.0;
      goto LABEL_68;
    }
  }
  else
  {
    *(_DWORD *)&v138[12] = 0;
  }
LABEL_247:
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v138 = 0;
      *(_DWORD *)v137 = 0;
      goto LABEL_257;
    }
  }
  else
  {
    v108 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v108 userInterfaceIdiom])
    {
      *(_DWORD *)v137 = 0;
      *(_DWORD *)v138 = 1;
      goto LABEL_257;
    }
  }
  *(_DWORD *)v138 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v100 = [MEMORY[0x1E4F42D90] mainScreen];
      [v100 _referenceBounds];
    }
    *(_DWORD *)v137 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v47 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_267;
    }
  }
  else
  {
    *(_DWORD *)v137 = 0;
  }
LABEL_257:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v138[4] = 0;
    *(void *)&v137[4] = 0;
    uint64_t v135 = 0;
    uint64_t v136 = 0;
    uint64_t v132 = 0;
    uint64_t v133 = 0;
    int v134 = 0;
    uint64_t v129 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v128 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 118.0;
    goto LABEL_68;
  }
LABEL_267:
  int v48 = __sb__runningInSpringBoard();
  if (v48)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v138[4] = 0;
      goto LABEL_277;
    }
  }
  else
  {
    v107 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v107 userInterfaceIdiom])
    {
      *(_DWORD *)&v138[4] = 0;
      *(_DWORD *)&v138[8] = 1;
      goto LABEL_277;
    }
  }
  *(_DWORD *)&v138[8] = v48 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v97 = [MEMORY[0x1E4F42D90] mainScreen];
      [v97 _referenceBounds];
    }
    uint64_t v11 = v49 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v138[4] = v11;
    if (v50 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(void *)&v137[4] = 0;
      uint64_t v135 = 0;
      uint64_t v136 = 0;
      uint64_t v132 = 0;
      uint64_t v133 = 0;
      int v134 = 0;
      uint64_t v129 = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v128 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      double v7 = 118.0;
      goto LABEL_68;
    }
  }
  else
  {
    *(_DWORD *)&v138[4] = 0;
  }
LABEL_277:
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v137[4] = 0;
      goto LABEL_287;
    }
  }
  else
  {
    v104 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v104 userInterfaceIdiom])
    {
      *(_DWORD *)&v137[4] = 0;
      *(_DWORD *)&v137[8] = 1;
      goto LABEL_287;
    }
  }
  *(_DWORD *)&v137[8] = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v96 = [MEMORY[0x1E4F42D90] mainScreen];
      [v96 _referenceBounds];
    }
    *(_DWORD *)&v137[4] = v11 ^ 1;
    BSSizeRoundForScale();
    if (v51 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_296;
    }
  }
  else
  {
    *(_DWORD *)&v137[4] = 0;
  }
LABEL_287:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v135 = 0;
    uint64_t v136 = 0;
    uint64_t v132 = 0;
    uint64_t v133 = 0;
    int v134 = 0;
    uint64_t v129 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v128 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 118.0;
    goto LABEL_68;
  }
LABEL_296:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_300:
    uint64_t v135 = 0;
    goto LABEL_307;
  }
  int v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_300;
    }
  }
  else
  {
    v99 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v99 userInterfaceIdiom])
    {
      uint64_t v135 = 0x100000000;
      goto LABEL_307;
    }
  }
  HIDWORD(v135) = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v53 = __sb__runningInSpringBoard();
    if (v53)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v88 = [MEMORY[0x1E4F42D90] mainScreen];
      [v88 _referenceBounds];
    }
    uint64_t v11 = v53 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v135) = v11;
    if (v58 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v136 = 0;
      uint64_t v132 = 0;
      uint64_t v133 = 0;
      int v134 = 0;
      uint64_t v129 = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v128 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      double v7 = 144.0;
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v135) = 0;
  }
LABEL_307:
  int v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v136) = 0;
      uint64_t v11 = 0;
      goto LABEL_317;
    }
  }
  else
  {
    v103 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v103 userInterfaceIdiom])
    {
      uint64_t v11 = 0;
      HIDWORD(v136) = 1;
      goto LABEL_317;
    }
  }
  HIDWORD(v136) = v54 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v55 = __sb__runningInSpringBoard();
    if (v55)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v93 = [MEMORY[0x1E4F42D90] mainScreen];
      [v93 _referenceBounds];
    }
    uint64_t v11 = v55 ^ 1u;
    BSSizeRoundForScale();
    if (v56 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_321;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_317:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v136) = v11;
    uint64_t v132 = 0;
    uint64_t v133 = 0;
    int v134 = 0;
    uint64_t v129 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v128 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 93.0;
    goto LABEL_68;
  }
LABEL_321:
  LODWORD(v136) = v11;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_325:
    uint64_t v133 = 0;
    goto LABEL_335;
  }
  int v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_325;
    }
  }
  else
  {
    v94 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v94 userInterfaceIdiom])
    {
      uint64_t v133 = 0x100000000;
      goto LABEL_335;
    }
  }
  HIDWORD(v133) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v2 _referenceBounds];
    }
    v90 = (void *)v2;
    LODWORD(v133) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v64 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v134 = 0;
      uint64_t v132 = 0;
      uint64_t v129 = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v128 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      double v7 = 135.0;
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v133) = 0;
  }
LABEL_335:
  uint64_t v11 = __sb__runningInSpringBoard();
  uint64_t v2 = (uint64_t)&off_1D8504000;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v134 = 0;
      HIDWORD(v132) = 0;
      goto LABEL_345;
    }
  }
  else
  {
    v98 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v98 userInterfaceIdiom])
    {
      HIDWORD(v132) = 0;
      int v134 = 1;
      goto LABEL_345;
    }
  }
  int v134 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v87 = [MEMORY[0x1E4F42D90] mainScreen];
      [v87 _referenceBounds];
    }
    HIDWORD(v132) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v59 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_349;
    }
  }
  else
  {
    HIDWORD(v132) = 0;
  }
LABEL_345:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v132) = 0;
    uint64_t v129 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v128 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 87.0;
    goto LABEL_68;
  }
LABEL_349:
  int v60 = __sb__runningInSpringBoard();
  if (v60)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v132) = 0;
      HIDWORD(v129) = 0;
      goto LABEL_359;
    }
  }
  else
  {
    v95 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v95 userInterfaceIdiom])
    {
      HIDWORD(v129) = 0;
      LODWORD(v132) = 1;
      goto LABEL_359;
    }
  }
  LODWORD(v132) = v60 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v61 = __sb__runningInSpringBoard();
    if (v61)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v3 _referenceBounds];
    }
    v91 = (void *)v3;
    uint64_t v11 = v61 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v129) = v11;
    if (v62 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      LODWORD(v129) = 0;
      uint64_t v128 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      *(double *)&uint64_t v63 = 124.0;
LABEL_374:
      double v7 = *(double *)&v63;
      goto LABEL_68;
    }
  }
  else
  {
    HIDWORD(v129) = 0;
  }
LABEL_359:
  uint64_t v11 = __sb__runningInSpringBoard();
  uint64_t v3 = (uint64_t)&off_1D8504000;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v131 = 0;
      goto LABEL_369;
    }
  }
  else
  {
    v92 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v92 userInterfaceIdiom])
    {
      uint64_t v131 = 0x100000000;
      goto LABEL_369;
    }
  }
  HIDWORD(v131) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v85 = [MEMORY[0x1E4F42D90] mainScreen];
      [v85 _referenceBounds];
    }
    LODWORD(v131) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_380;
    }
  }
  else
  {
    LODWORD(v131) = 0;
  }
LABEL_369:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v130 = 0;
    LODWORD(v129) = 0;
    uint64_t v128 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 118.0;
    goto LABEL_68;
  }
LABEL_380:
  int v66 = __sb__runningInSpringBoard();
  if (v66)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v130) = 0;
      LODWORD(v129) = 0;
      goto LABEL_390;
    }
  }
  else
  {
    v89 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v89 userInterfaceIdiom])
    {
      LODWORD(v129) = 0;
      HIDWORD(v130) = 1;
      goto LABEL_390;
    }
  }
  HIDWORD(v130) = v66 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v84 = [MEMORY[0x1E4F42D90] mainScreen];
      [v84 _referenceBounds];
    }
    LODWORD(v129) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      uint64_t v128 = 0;
      LODWORD(v130) = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      double v7 = 135.0;
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v129) = 0;
  }
LABEL_390:
  int v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v128) = 0;
      uint64_t v11 = 0;
      goto LABEL_400;
    }
  }
  else
  {
    v86 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v86 userInterfaceIdiom])
    {
      uint64_t v11 = 0;
      HIDWORD(v128) = 1;
      goto LABEL_400;
    }
  }
  HIDWORD(v128) = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v68 = __sb__runningInSpringBoard();
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v83 = [MEMORY[0x1E4F42D90] mainScreen];
      [v83 _referenceBounds];
    }
    uint64_t v11 = v68 ^ 1u;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_408;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_400:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v130) = v11;
LABEL_402:
    LODWORD(v128) = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 87.0;
    goto LABEL_68;
  }
LABEL_408:
  LODWORD(v130) = v11;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v128) = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    double v7 = 118.0;
    goto LABEL_68;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16()) {
    goto LABEL_402;
  }
  double v7 = 118.0;
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v128) = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    goto LABEL_68;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    LODWORD(v128) = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
LABEL_417:
    double v7 = 87.0;
    goto LABEL_68;
  }
  uint64_t v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v128) = 0;
      int v22 = 0;
      goto LABEL_428;
    }
  }
  else
  {
    v82 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v82 userInterfaceIdiom])
    {
      int v22 = 0;
      LODWORD(v128) = 1;
      goto LABEL_428;
    }
  }
  LODWORD(v128) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v79 = [MEMORY[0x1E4F42D90] mainScreen];
      [v79 _referenceBounds];
    }
    int v22 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v74 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      goto LABEL_68;
    }
  }
  else
  {
    int v22 = 0;
  }
LABEL_428:
  int v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v23 = 0;
      int v24 = 0;
      goto LABEL_438;
    }
  }
  else
  {
    v81 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v81 userInterfaceIdiom])
    {
      int v24 = 0;
      int v23 = 1;
      goto LABEL_438;
    }
  }
  int v23 = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v78 = [MEMORY[0x1E4F42D90] mainScreen];
      [v78 _referenceBounds];
    }
    int v24 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v75 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      goto LABEL_417;
    }
  }
  else
  {
    int v24 = 0;
  }
LABEL_438:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v25 = 0;
      int v26 = 0;
      goto LABEL_448;
    }
  }
  else
  {
    v80 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v80 userInterfaceIdiom])
    {
      int v26 = 0;
      int v25 = 1;
      goto LABEL_448;
    }
  }
  int v25 = v2 ^ 1;
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v11 _referenceBounds];
  }
  int v26 = v2 ^ 1;
  BSSizeRoundForScale();
  if (v72 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v27 = 0;
    int v28 = 0;
    *(double *)&uint64_t v73 = 44.0;
    goto LABEL_455;
  }
LABEL_448:
  uint64_t v3 = __sb__runningInSpringBoard();
  if (v3)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v27 = 0;
      int v28 = 0;
      *(double *)&uint64_t v73 = 40.0;
LABEL_455:
      double v7 = *(double *)&v73;
      goto LABEL_68;
    }
    goto LABEL_462;
  }
  uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([(id)v2 userInterfaceIdiom])
  {
    int v28 = 0;
    int v27 = 1;
    *(double *)&uint64_t v63 = 40.0;
    goto LABEL_374;
  }
LABEL_462:
  int v27 = v3 ^ 1;
  int v76 = __sb__runningInSpringBoard();
  if (v76)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v3 _referenceBounds];
  }
  int v28 = v76 ^ 1;
  BSSizeRoundForScale();
  if (v77 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    double v7 = 40.0;
  }
  else {
    double v7 = 69.0;
  }
LABEL_68:
  if (v28) {

  }
  if (v27) {
  if (v26)
  }

  if (v25) {
  if (v24)
  }

  if (v23) {
  if (v22)
  }

  if (v128) {
  if (v130)
  }

  if (HIDWORD(v128)) {
  if (v129)
  }

  if (HIDWORD(v130)) {
  if (v131)
  }

  if (HIDWORD(v131)) {
  if (HIDWORD(v129))
  }

  if (v132) {
  if (HIDWORD(v132))
  }

  if (v134) {
  if (v133)
  }

  if (HIDWORD(v133)) {
  if (v136)
  }

  if (HIDWORD(v136)) {
  if (v135)
  }

  if (HIDWORD(v135)) {
  if (*(_DWORD *)&v137[4])
  }

  if (*(_DWORD *)&v137[8]) {
  if (*(_DWORD *)&v138[4])
  }

  if (*(_DWORD *)&v138[8]) {
  if (*(_DWORD *)v137)
  }

  if (*(_DWORD *)v138) {
  if (*(_DWORD *)&v138[12])
  }

  if (v139) {
  if (*(_DWORD *)&v138[16])
  }

  if (HIDWORD(v139)) {
  if (v140)
  }

  if (HIDWORD(v140)) {
  if (v141)
  }

  if (HIDWORD(v141)) {
  if (DWORD2(v141))
  }

  if (DWORD1(v141)) {
  if (v142)
  }

  if (DWORD1(v142)) {
  if (DWORD2(v142))
  }

  if (v149) {
  if (HIDWORD(v142))
  }
  {

    if (!v143) {
      goto LABEL_158;
    }
  }
  else if (!v143)
  {
LABEL_158:
    if (v144) {
      goto LABEL_159;
    }
    goto LABEL_169;
  }

  if (v144)
  {
LABEL_159:

    if (!v145) {
      goto LABEL_160;
    }
    goto LABEL_170;
  }
LABEL_169:
  if (!v145)
  {
LABEL_160:
    if (v146) {
      goto LABEL_161;
    }
    goto LABEL_171;
  }
LABEL_170:

  if (v146)
  {
LABEL_161:

    if (!v147) {
      goto LABEL_162;
    }
    goto LABEL_172;
  }
LABEL_171:
  if (!v147)
  {
LABEL_162:
    if (v148) {
      goto LABEL_163;
    }
    goto LABEL_173;
  }
LABEL_172:

  if (v148)
  {
LABEL_163:

    if (!v150) {
      goto LABEL_164;
    }
LABEL_174:

    if (!v151) {
      return v7;
    }
    goto LABEL_165;
  }
LABEL_173:
  if (v150) {
    goto LABEL_174;
  }
LABEL_164:
  if (v151) {
LABEL_165:
  }

  return v7;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = [(CSMainPageContentViewController *)self delegate];
  [v5 scrollablePageViewController:self scrollViewWillBeginDragging:v4];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = [(CSMainPageContentViewController *)self delegate];
  [v5 scrollablePageViewController:self scrollViewDidScroll:v4];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(CSMainPageContentViewController *)self delegate];
  objc_msgSend(v8, "scrollablePageViewController:scrollViewWillEndDragging:withVelocity:", self, v7, x, y);
}

- (BOOL)_listBelowDateTime
{
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 1;
  }

  return [(CSMainPageContentViewController *)self _isPortrait];
}

- (BOOL)_isPortrait
{
  return (unint64_t)([(CSMainPageContentViewController *)self interfaceOrientation] - 1) < 2;
}

- (void)_addOrRemoveUserPictureViewController
{
  if (+[CSUserPictureViewController isUserPictureSupported]|| [(CSLockScreenSettings *)self->_testSettings showUserPicture])
  {
    if (!self->_userPictureViewController)
    {
      uint64_t v3 = objc_alloc_init(CSUserPictureViewController);
      userPictureViewController = self->_userPictureViewController;
      self->_userPictureViewController = v3;

      id v5 = self->_userPictureViewController;
      [(CSPresentationViewController *)self presentContentViewController:v5 animated:0];
    }
  }
  else
  {
    double v6 = self->_userPictureViewController;
    if (v6)
    {
      [(CSPresentationViewController *)self dismissContentViewController:v6 animated:0];
      id v7 = self->_userPictureViewController;
      self->_userPictureViewController = 0;
    }
  }
}

- (void)_addOrRemoveLogoutButtonViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userSessionController);
  uint64_t v4 = [(CSCoverSheetViewControllerBase *)self activeBehavior];
  char v5 = [v4 areRestrictedCapabilities:2048];

  if ((v5 & 1) == 0
    && (([WeakRetained isLogoutSupported] & 1) != 0
     || [(CSLockScreenSettings *)self->_testSettings showLogoutButton]))
  {
    if (!self->_logoutButtonViewController)
    {
      double v6 = objc_alloc_init(CSLogoutButtonViewController);
      logoutButtonViewController = self->_logoutButtonViewController;
      self->_logoutButtonViewController = v6;

      [(CSLogoutButtonViewController *)self->_logoutButtonViewController setUserSessionController:WeakRetained];
      id v8 = self->_logoutButtonViewController;
      id v9 = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
      [(CSLogoutButtonViewController *)v8 setWallpaperColorProvider:v9];

      int v10 = self->_logoutButtonViewController;
      id v11 = objc_loadWeakRetained((id *)&self->_wallpaperProvider);
      [(CSLogoutButtonViewController *)v10 setWallpaperProvider:v11];

      int v12 = self->_logoutButtonViewController;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __73__CSMainPageContentViewController__addOrRemoveLogoutButtonViewController__block_invoke;
      v16[3] = &unk_1E6AD8820;
      v16[4] = self;
      [(CSMainPageContentViewController *)self bs_addChildViewController:v12 animated:0 transitionBlock:v16];
    }
  }
  else
  {
    int v13 = self->_logoutButtonViewController;
    if (v13)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __73__CSMainPageContentViewController__addOrRemoveLogoutButtonViewController__block_invoke_2;
      v15[3] = &unk_1E6AD8820;
      v15[4] = self;
      [(CSMainPageContentViewController *)self bs_removeChildViewController:v13 animated:0 transitionBlock:v15];
      int v14 = self->_logoutButtonViewController;
      self->_logoutButtonViewController = 0;
    }
  }
}

void __73__CSMainPageContentViewController__addOrRemoveLogoutButtonViewController__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  double v6 = a2;
  uint64_t v4 = [v3 _mainPageView];
  char v5 = [*(id *)(*(void *)(a1 + 32) + 1136) button];
  [v4 setLogoutButtonView:v5];

  v6[2]();
}

void __73__CSMainPageContentViewController__addOrRemoveLogoutButtonViewController__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  uint64_t v3 = [v2 _mainPageView];
  [v3 setLogoutButtonView:0];

  v4[2]();
}

- (void)_addOrRemoveNotificationsListIfNecessaryAnimated:(BOOL)a3
{
  uint64_t v4 = [(CSCoverSheetViewControllerBase *)self activeBehavior];
  uint64_t v5 = [v4 notificationBehavior];

  combinedListViewController = self->_combinedListViewController;
  if (v5 == 3)
  {
    [(CSPresentationViewController *)self dismissContentViewController:combinedListViewController animated:0];
  }
  else
  {
    [(CSPresentationViewController *)self presentContentViewController:combinedListViewController animated:1];
  }
}

- (void)_addOrRemoveViewsAsAppropriate
{
  [(CSMainPageContentViewController *)self _addOrRemoveUserPictureViewController];
  [(CSMainPageContentViewController *)self _addOrRemoveLogoutButtonViewController];

  [(CSMainPageContentViewController *)self _addOrRemoveNotificationsListIfNecessaryAnimated:1];
}

+ (double)_phoneListWidth
{
  if (_phoneListWidth_onceToken != -1) {
    dispatch_once(&_phoneListWidth_onceToken, &__block_literal_global_60);
  }
  return *(double *)&_phoneListWidth_phoneListWidth;
}

void __50__CSMainPageContentViewController__phoneListWidth__block_invoke()
{
  id v0 = [MEMORY[0x1E4F42D90] mainScreen];
  [v0 _referenceBounds];
  *(double *)&_phoneListWidth_phoneListdouble Width = CGRectGetWidth(v2) + -16.0;
}

- (void)setUseFakeBlur:(BOOL)a3
{
  if (self->_useFakeBlur != a3)
  {
    self->_useFakeBlur = a3;
    [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
  }
}

- (CSCombinedListViewController)combinedListViewController
{
  return self->_combinedListViewController;
}

- (void)setCombinedListViewController:(id)a3
{
}

- (CSLayoutStrategy)layoutStrategy
{
  return self->_layoutStrategy;
}

- (CSWallpaperColorProvider)wallpaperColorProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);

  return (CSWallpaperColorProvider *)WeakRetained;
}

- (BOOL)useFakeBlur
{
  return self->_useFakeBlur;
}

- (CSScrollablePageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSScrollablePageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSUserPresenceMonitor)userPresenceMonitor
{
  return self->_userPresenceMonitor;
}

- (CSMainPageContentViewControllerMediaControlsObserver)mediaControlsObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaControlsObserver);

  return (CSMainPageContentViewControllerMediaControlsObserver *)WeakRetained;
}

- (void)setMediaControlsObserver:(id)a3
{
}

- (CSTouchEnvironmentStatusProviding)touchEnvironmentStatusProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchEnvironmentStatusProvider);

  return (CSTouchEnvironmentStatusProviding *)WeakRetained;
}

- (void)setTouchEnvironmentStatusProvider:(id)a3
{
}

- (CSUserSessionControlling)userSessionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userSessionController);

  return (CSUserSessionControlling *)WeakRetained;
}

- (void)setUserSessionController:(id)a3
{
}

- (CSWallpaperProviding)wallpaperProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperProvider);

  return (CSWallpaperProviding *)WeakRetained;
}

- (void)setWallpaperProvider:(id)a3
{
}

- (CSMainPageContentViewControllerNotificationObserver)notificationObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationObserver);

  return (CSMainPageContentViewControllerNotificationObserver *)WeakRetained;
}

- (void)setNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationObserver);
  objc_destroyWeak((id *)&self->_wallpaperProvider);
  objc_destroyWeak((id *)&self->_userSessionController);
  objc_destroyWeak((id *)&self->_touchEnvironmentStatusProvider);
  objc_destroyWeak((id *)&self->_mediaControlsObserver);
  objc_storeStrong((id *)&self->_userPresenceMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_wallpaperColorProvider);
  objc_storeStrong((id *)&self->_layoutStrategy, 0);
  objc_storeStrong((id *)&self->_inlineContentViewControllerDelegate, 0);
  objc_storeStrong((id *)&self->_inlineContentGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_widgetMetricsProvider, 0);
  objc_storeStrong((id *)&self->_testSettings, 0);
  objc_storeStrong((id *)&self->_authenticationProvider, 0);
  objc_storeStrong((id *)&self->_logoutButtonViewController, 0);
  objc_storeStrong((id *)&self->_userPresenceMontior, 0);
  objc_storeStrong((id *)&self->_combinedListViewController, 0);

  objc_storeStrong((id *)&self->_userPictureViewController, 0);
}

@end