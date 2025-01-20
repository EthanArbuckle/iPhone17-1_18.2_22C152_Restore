@interface DBDashboardHomeViewController
- (BOOL)_isACBackEnabled;
- (BOOL)_onDashboardPage;
- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4;
- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5;
- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6;
- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4;
- (BOOL)iconCanDisplayBadge:(id)a3;
- (BOOL)iconManager:(id)a3 allowsBadgingForIcon:(id)a4;
- (BOOL)iconManagerCanBeginIconDrags:(id)a3;
- (BOOL)isEditingAllowedForIconManager:(id)a3;
- (BOOL)isIconVisible:(id)a3;
- (BOOL)isIconVisibleForIdentifier:(id)a3;
- (CARObserverHashTable)pageObservers;
- (Class)controllerClassForFolder:(id)a3;
- (Class)iconManager:(id)a3 folderControllerClassForFolderClass:(Class)a4 proposedClass:(Class)a5;
- (DBDashboardHomeViewController)initWithEnvironment:(id)a3 layoutEngine:(id)a4;
- (DBDashboardLayoutEngine)layoutEngine;
- (DBEnvironment)environment;
- (DBIconBadgeController)iconBadgeController;
- (DBIconImageCache)iconImageCache;
- (DBIconManager)iconManager;
- (DBIconModel)iconModel;
- (DBNowPlayingObserver)nowPlayingObserver;
- (DBTodayViewController)todayViewController;
- (FBSApplicationDataStoreMonitor)dataStoreMonitor;
- (NSArray)allApplicationIcons;
- (NSIndexPath)lastFocusedIndex;
- (NSMutableSet)acBackDisabledReasons;
- (UIView)hairlineView;
- (id)_iconViewForIndexpath:(id)a3;
- (id)_indexPathForFallbackIcon:(BOOL)a3;
- (id)_linearFocusMovementSequences;
- (id)_preferredFocusedIcon;
- (id)defaultIconStateForIconManager:(id)a3;
- (id)folderController;
- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5;
- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5;
- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6;
- (id)iconForIdentifier:(id)a3;
- (id)preferredFocusEnvironments;
- (id)visibleIconViewForIdentifier:(id)a3;
- (int64_t)interfaceOrientationForIconManager:(id)a3;
- (unint64_t)currentPageIndex;
- (void)_backButtonTapped:(id)a3;
- (void)_handleAppLibraryRefresh;
- (void)_handleBackActionSupportACBack:(BOOL)a3;
- (void)_invalidateBadgeForIdentifier:(id)a3;
- (void)_launchNowPlaying;
- (void)_persistCachedIconImages;
- (void)_setACBackDisabled:(BOOL)a3 forRequester:(id)a4;
- (void)_setupIconModel;
- (void)_wheelChangedWithEvent:(id)a3;
- (void)addPageChangeObserver:(id)a3;
- (void)dataStoreMonitor:(id)a3 didUpdateApplication:(id)a4 forKey:(id)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)folderControllerDidEndScrolling:(id)a3;
- (void)folderControllerWillBeginScrolling:(id)a3;
- (void)getApplicationIconInformationForBundleID:(id)a3 drawBorder:(BOOL)a4 completion:(id)a5;
- (void)getIconStateWithCompletion:(id)a3;
- (void)handleEvent:(id)a3;
- (void)iconBadgeController:(id)a3 didUpdateForIdentifiers:(id)a4;
- (void)iconManager:(id)a3 launchIconForIconView:(id)a4;
- (void)iconManager:(id)a3 willUseRootFolderControllerConfiguration:(id)a4;
- (void)invalidate;
- (void)loadView;
- (void)removePageChangeObserver:(id)a3;
- (void)resetIconState;
- (void)setAcBackDisabledReasons:(id)a3;
- (void)setAccessibilityElementsActive:(BOOL)a3;
- (void)setCurrentPageIndex:(unint64_t)a3;
- (void)setDataStoreMonitor:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setIconBadgeController:(id)a3;
- (void)setIconImageCache:(id)a3;
- (void)setIconManager:(id)a3;
- (void)setIconModel:(id)a3;
- (void)setIconState:(id)a3;
- (void)setLastFocusedIndex:(id)a3;
- (void)setLayoutEngine:(id)a3;
- (void)setNowPlayingObserver:(id)a3;
- (void)setPageObservers:(id)a3;
- (void)setTodayViewActive:(BOOL)a3;
- (void)setTodayViewController:(id)a3;
- (void)setTodayViewForeground:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DBDashboardHomeViewController

- (DBDashboardHomeViewController)initWithEnvironment:(id)a3 layoutEngine:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)DBDashboardHomeViewController;
  v8 = [(DBDashboardHomeViewController *)&v31 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1BD0E8];
    pageObservers = v8->_pageObservers;
    v8->_pageObservers = (CARObserverHashTable *)v9;

    v11 = [v6 environmentConfiguration];
    uint64_t v12 = [v11 iconBadgeController];
    iconBadgeController = v8->_iconBadgeController;
    v8->_iconBadgeController = (DBIconBadgeController *)v12;

    [(DBIconBadgeController *)v8->_iconBadgeController addObserver:v8];
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v8->_layoutEngine, a4);
    v14 = [v6 environmentConfiguration];
    uint64_t v15 = [v14 iconImageCache];
    iconImageCache = v8->_iconImageCache;
    v8->_iconImageCache = (DBIconImageCache *)v15;

    v17 = [DBTodayViewController alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v8->_environment);
    uint64_t v19 = [(DBTodayViewController *)v17 initWithEnvironment:WeakRetained layoutEngine:v7];
    todayViewController = v8->_todayViewController;
    v8->_todayViewController = (DBTodayViewController *)v19;

    v21 = +[DBApplicationController sharedInstance];
    [v21 addObserver:v8];

    v22 = [MEMORY[0x263F3F4F0] sharedInstance];
    [v22 addObserver:v8];

    v23 = (FBSApplicationDataStoreMonitor *)objc_alloc_init(MEMORY[0x263F3F6C0]);
    dataStoreMonitor = v8->_dataStoreMonitor;
    v8->_dataStoreMonitor = v23;

    [(FBSApplicationDataStoreMonitor *)v8->_dataStoreMonitor addObserver:v8];
    v25 = [DBNowPlayingObserver alloc];
    v26 = [(DBDashboardHomeViewController *)v8 environment];
    v27 = [v26 environmentConfiguration];
    uint64_t v28 = [(DBNowPlayingObserver *)v25 initWithEnvironmentConfiguration:v27];
    nowPlayingObserver = v8->_nowPlayingObserver;
    v8->_nowPlayingObserver = (DBNowPlayingObserver *)v28;
  }
  return v8;
}

- (void)iconBadgeController:(id)a3 didUpdateForIdentifiers:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__DBDashboardHomeViewController_iconBadgeController_didUpdateForIdentifiers___block_invoke;
  v7[3] = &unk_2649B3D30;
  id v8 = v5;
  uint64_t v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __77__DBDashboardHomeViewController_iconBadgeController_didUpdateForIdentifiers___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __77__DBDashboardHomeViewController_iconBadgeController_didUpdateForIdentifiers___block_invoke_2;
  v3[3] = &unk_2649B5FF0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __77__DBDashboardHomeViewController_iconBadgeController_didUpdateForIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) iconModel];
  id v5 = [v4 leafIconForIdentifier:v3];

  [v5 noteBadgeDidChange];
  id v6 = DBLogForCategory(0xEuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"valid";
    if (!v5) {
      id v7 = @"NOT valid (nil)";
    }
    int v8 = 138543618;
    id v9 = v3;
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Badge settings updated for %{public}@. The icon is %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_setupIconModel
{
  v69[4] = *MEMORY[0x263EF8340];
  id v3 = [(DBDashboardHomeViewController *)self iconManager];
  v4 = [v3 rootViewController];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v6 = [WeakRetained environmentConfiguration];

  if (v4)
  {
    [v4 removeFromParentViewController];
    id v7 = [v4 view];
    [v7 removeFromSuperview];
  }
  int v8 = [(DBDashboardHomeViewController *)self environment];
  id v9 = [v8 environmentConfiguration];
  +[DBIconView setEnvironmentConfiguration:v9];

  __int16 v10 = [DBIconManager alloc];
  id v11 = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v12 = [(DBIconManager *)v10 initWithEnvironment:v11];
  iconManager = self->_iconManager;
  self->_iconManager = v12;

  [(SBHIconManager *)self->_iconManager setDelegate:self];
  [v6 screenScale];
  double v14 = DBIconImageInfoForScale();
  double v16 = v15;
  v17 = [DBIconModelStore alloc];
  v18 = [v6 vehicleID];
  v67 = [(DBIconModelStore *)v17 initWithVehicleId:v18];

  uint64_t v19 = [[DBIconModel alloc] initWithStore:v67 carApplicationDataSource:self];
  v66 = v6;
  iconModel = self->_iconModel;
  self->_iconModel = v19;

  -[DBIconModel setIconImageSize:](self->_iconModel, "setIconImageSize:", v14, v16);
  v21 = self->_iconModel;
  id v22 = objc_loadWeakRetained((id *)&self->_environment);
  [(DBIconModel *)v21 setEnvironment:v22];

  [(SBHIconModel *)self->_iconModel reloadIcons];
  [(SBHIconManager *)self->_iconManager setIconModel:self->_iconModel];
  v23 = [v6 navigationStateProvider];
  [v23 setIconProvider:self];

  [(DBDashboardHomeViewController *)self _persistCachedIconImages];
  v24 = [(DBDashboardHomeViewController *)self iconManager];
  v25 = [v24 rootViewController];

  [(DBDashboardHomeViewController *)self addChildViewController:v25];
  v26 = [(DBDashboardHomeViewController *)self view];
  v27 = [v25 view];
  [v26 addSubview:v27];

  [v25 didMoveToParentViewController:self];
  uint64_t v28 = [v25 view];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  v64 = [(DBDashboardHomeViewController *)self view];
  v62 = [v64 leadingAnchor];
  v63 = [v25 view];
  v61 = [v63 leadingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v69[0] = v60;
  v59 = [(DBDashboardHomeViewController *)self view];
  v57 = [v59 trailingAnchor];
  v58 = [v25 view];
  v56 = [v58 trailingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v69[1] = v55;
  v54 = [(DBDashboardHomeViewController *)self view];
  v29 = [v54 topAnchor];
  v65 = v25;
  v30 = [v25 view];
  objc_super v31 = [v30 topAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  v69[2] = v32;
  v33 = [(DBDashboardHomeViewController *)self view];
  v34 = [v33 bottomAnchor];
  v35 = [v25 view];
  v36 = [v35 bottomAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  v69[3] = v37;
  v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:4];

  [MEMORY[0x263F08938] activateConstraints:v53];
  v38 = [(DBDashboardHomeViewController *)self folderController];
  id v39 = objc_loadWeakRetained((id *)&self->_environment);
  [v38 setEnvironment:v39];

  v40 = [(DBDashboardHomeViewController *)self iconModel];
  v41 = [v40 rootFolder];
  [v38 setFolder:v41];

  v42 = [(DBDashboardHomeViewController *)self layoutEngine];
  [v38 setLayoutEngine:v42];

  [v38 setFolderDelegate:self];
  objc_msgSend(v38, "setLeadingCustomViewPageHidden:", +[DBTodayViewController isEnabledAndSupportedForIconProvider:](DBTodayViewController, "isEnabledAndSupportedForIconProvider:", self) ^ 1);
  v43 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v44 = [v43 integerForKey:@"CARStartPageIndex"];

  v45 = [(DBDashboardHomeViewController *)self folderController];
  [v45 setCurrentPageIndex:v44 animated:0];

  v46 = [(DBDashboardHomeViewController *)self folderController];
  -[DBDashboardHomeViewController setCurrentPageIndex:](self, "setCurrentPageIndex:", [v46 currentPageIndex]);

  v47 = [(DBDashboardHomeViewController *)self pageObservers];
  unint64_t v48 = [(DBDashboardHomeViewController *)self currentPageIndex];
  v49 = [(DBDashboardHomeViewController *)self folderController];
  uint64_t v50 = [v49 firstIconPageIndex];
  v51 = [(DBDashboardHomeViewController *)self folderController];
  objc_msgSend(v47, "homeViewController:didChangeToPageIndex:firstIconPageIndex:minimumPageIndex:", self, v48, v50, objc_msgSend(v51, "minimumPageIndex"));

  v52 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__DBDashboardHomeViewController__setupIconModel__block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(v52, block);
}

void __48__DBDashboardHomeViewController__setupIconModel__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) iconModel];
  id v6 = [v2 analyticsIconRepresentation];

  id v3 = [*(id *)(a1 + 32) environment];
  v4 = [v3 environmentConfiguration];
  id v5 = [v4 analytics];
  [v5 applySessionStartedStorage:v6];
}

- (void)loadView
{
  id v3 = [DBAnimationView alloc];
  v4 = -[DBAnimationView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(DBDashboardHomeViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)DBDashboardHomeViewController;
  [(DBDashboardHomeViewController *)&v8 viewDidLoad];
  id v3 = [(DBDashboardHomeViewController *)self view];
  [v3 setClipsToBounds:1];

  v4 = [(DBDashboardHomeViewController *)self view];
  id v5 = [v4 layer];
  [v5 setHitTestsAsOpaque:1];

  [(DBDashboardHomeViewController *)self _setupIconModel];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__backButtonTapped_];
  [v6 setAllowedPressTypes:&unk_26E17EF90];
  id v7 = [(DBDashboardHomeViewController *)self view];
  [v7 addGestureRecognizer:v6];
}

- (void)handleEvent:(id)a3
{
}

- (NSArray)allApplicationIcons
{
  id v3 = objc_opt_new();
  v4 = +[DBApplicationController sharedInstance];
  id v5 = [v4 allApplications];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = __52__DBDashboardHomeViewController_allApplicationIcons__block_invoke;
  v23 = &unk_2649B6018;
  id v6 = v4;
  id v24 = v6;
  id v7 = v3;
  id v25 = v7;
  [v5 enumerateObjectsUsingBlock:&v20];

  objc_super v8 = objc_alloc_init(DBNowPlayingIcon);
  objc_msgSend(v7, "addObject:", v8, v20, v21, v22, v23);
  id v9 = [(DBDashboardHomeViewController *)self environment];
  __int16 v10 = [v9 environmentConfiguration];
  int v11 = [v10 isOEMIconVisible];

  if (v11)
  {
    uint64_t v12 = [DBOEMIcon alloc];
    v13 = [(DBDashboardHomeViewController *)self environment];
    double v14 = [v13 environmentConfiguration];
    double v15 = [v14 session];
    double v16 = [v15 configuration];
    v17 = [(DBOEMIcon *)v12 initWithSessionConfiguration:v16];

    [v7 addObject:v17];
  }
  v18 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];

  return (NSArray *)v18;
}

void __52__DBDashboardHomeViewController_allApplicationIcons__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 appPolicy];
  if ([v4 isCarPlaySupported])
  {
    id v5 = [*(id *)(a1 + 32) calendarApplication];

    if (v5 == v3)
    {
      id v7 = off_2649B2E90;
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) booksApplication];

      id v7 = off_2649B3110;
      if (v6 == v3) {
        id v7 = off_2649B2E78;
      }
    }
    id v9 = (void *)[objc_alloc(*v7) initWithApplication:v3];
    [*(id *)(a1 + 40) addObject:v9];
  }
  else
  {
    objc_super v8 = DBLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Skipping app %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)getIconStateWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void))a3;
  id v5 = [(DBDashboardHomeViewController *)self iconModel];
  id v6 = [v5 exportIconLayoutState];

  v4[2](v4, v6, 0);
}

- (void)setIconState:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 hiddenIcons];
  id v6 = objc_msgSend(v5, "bs_map:", &__block_literal_global_25);

  id v7 = [(DBDashboardHomeViewController *)self iconModel];
  v13[0] = *MEMORY[0x263F31310];
  objc_super v8 = [v4 iconOrder];

  id v9 = (void *)MEMORY[0x263EFFA68];
  if (v8) {
    int v10 = v8;
  }
  else {
    int v10 = (void *)MEMORY[0x263EFFA68];
  }
  v13[1] = *MEMORY[0x263F31308];
  v14[0] = v10;
  if (v6) {
    id v9 = v6;
  }
  v14[1] = v9;
  id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v7 importState:v11];

  uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"CARRefreshAppDockNotification" object:0];
}

uint64_t __46__DBDashboardHomeViewController_setIconState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (void)resetIconState
{
  id v2 = [(DBDashboardHomeViewController *)self iconModel];
  [v2 resetCurrentIconState];
}

- (void)getApplicationIconInformationForBundleID:(id)a3 drawBorder:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a5;
  int v10 = DBLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v8;
    _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_INFO, "DHVC: Application icon info requested for %@", buf, 0xCu);
  }

  if (![v8 isEqualToString:@"com.apple.mobilecal"]) {
    goto LABEL_22;
  }
  id v11 = +[DBApplicationController sharedInstance];
  uint64_t v12 = [v11 calendarApplication];

  v13 = [(DBLeafIcon *)[DBCalendarLeafIcon alloc] initWithApplication:v12 drawBorder:v6];
  double v14 = [MEMORY[0x263F82B60] mainScreen];
  [v14 scale];
  double v15 = [(SBIcon *)v13 iconImageWithInfo:DBIconImageInfoForScale()];

  if (!v15)
  {
LABEL_22:
    double v16 = [(DBDashboardHomeViewController *)self iconImageCache];
    v17 = [(DBDashboardHomeViewController *)self environment];
    v18 = [v17 environmentConfiguration];
    uint64_t v19 = [v18 vehicleID];
    double v15 = [v16 iconImageForBundleIdentifier:v8 inVehicle:v19];

    if (!v15)
    {
      if (([v8 isEqualToString:*MEMORY[0x263F31298]] & 1) != 0
        || ([v8 isEqualToString:*MEMORY[0x263F312A8]] & 1) != 0)
      {
        double v15 = 0;
      }
      else
      {
        uint64_t v20 = [MEMORY[0x263F82B60] mainScreen];
        [v20 scale];
        double v21 = DBIconImageInfoForScale();
        DBIconImageForBundleIdentifierWithInfoAndBorder(v8, v6, v21, v22, v23, v24);
        double v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  if ([v8 isEqualToString:*MEMORY[0x263F312B0]]
    || ([v8 isEqualToString:*MEMORY[0x263F31298]] & 1) != 0
    || [v8 isEqualToString:*MEMORY[0x263F312A8]])
  {
    id v25 = [NSString stringWithFormat:@"LAUNCHER_NAME-%@", v8];
    v26 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    id v27 = [v26 localizedStringForKey:v25 value:&stru_26E13A820 table:@"CarPlayApp"];
  }
  else
  {
    id v25 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v8 allowPlaceholder:0 error:0];
    objc_super v31 = objc_msgSend(v25, "db_localizedCarName");
    v26 = v31;
    if (v31)
    {
      id v27 = v31;
      v26 = v27;
    }
    else
    {
      id v27 = [v25 localizedName];
    }
  }
  uint64_t v28 = v27;

  v29 = (void *)[objc_alloc(MEMORY[0x263F312C0]) initWithBundleIdentifier:v8];
  if (v15)
  {
    v30 = UIImagePNGRepresentation(v15);
    [v29 setIconImageData:v30];

    [(UIImage *)v15 scale];
    objc_msgSend(v29, "setIconImageScale:");
  }
  [v29 setLocalizedDisplayName:v28];
  v9[2](v9, v29, 0);
}

- (void)iconManager:(id)a3 willUseRootFolderControllerConfiguration:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F83038];
  id v6 = a4;
  id v7 = [v5 alloc];
  id v8 = [MEMORY[0x263F825C8] whiteColor];
  id v9 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.3];
  id v11 = (id)[v7 initWithStyle:0 primaryColor:v8 secondaryColor:v9 shadowColor:0];

  [v6 setLegibilitySettings:v11];
  int v10 = [(DBDashboardHomeViewController *)self todayViewController];
  [v6 setLeadingCustomViewController:v10];
}

- (void)iconManager:(id)a3 launchIconForIconView:(id)a4
{
  id v18 = a4;
  id v5 = [v18 icon];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(DBDashboardHomeViewController *)self environment];
    id v7 = [v6 environmentConfiguration];
    id v8 = [v7 session];
    [v8 requestCarUI];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(DBDashboardHomeViewController *)self _launchNowPlaying];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        id v9 = [v18 icon];
        if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }

        id v11 = +[DBApplicationController sharedInstance];
        uint64_t v12 = [v10 applicationBundleID];
        v13 = [v11 applicationWithBundleIdentifier:v12];

        double v14 = objc_alloc_init(DBActivationSettings);
        [(DBActivationSettings *)v14 setLaunchSource:3];
        double v15 = +[DBApplicationLaunchInfo launchInfoForApplication:v13 withActivationSettings:v14];
        double v16 = [(DBDashboardHomeViewController *)self environment];
        v17 = +[DBEvent eventWithType:4 context:v15];
        [v16 handleEvent:v17];
      }
    }
  }
}

- (Class)iconManager:(id)a3 folderControllerClassForFolderClass:(Class)a4 proposedClass:(Class)a5
{
  return (Class)objc_opt_class();
}

- (BOOL)iconManager:(id)a3 allowsBadgingForIcon:(id)a4
{
  id v5 = a4;
  id v6 = +[DBApplicationController sharedInstance];
  id v7 = [v5 leafIdentifier];
  id v8 = [v6 applicationWithBundleIdentifier:v7];

  id v9 = [v8 appPolicy];
  if ([v9 badgesAppIcon])
  {
    id v10 = [(DBDashboardHomeViewController *)self iconBadgeController];
    id v11 = [v5 leafIdentifier];
    char v12 = [v10 notificationsEnabledForIdentifier:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (int64_t)interfaceOrientationForIconManager:(id)a3
{
  return 1;
}

- (BOOL)isEditingAllowedForIconManager:(id)a3
{
  return 0;
}

- (BOOL)iconManagerCanBeginIconDrags:(id)a3
{
  return 0;
}

- (id)defaultIconStateForIconManager:(id)a3
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 URLForResource:@"DefaultIconState_CarDisplay" withExtension:@"plist"];
  id v5 = [NSDictionary dictionaryWithContentsOfURL:v4];

  return v5;
}

- (id)visibleIconViewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DBDashboardHomeViewController *)self iconModel];
  id v6 = [v5 leafIconForIdentifier:v4];

  id v7 = [(DBDashboardHomeViewController *)self folderController];
  if ([v7 isDisplayingIcon:v6])
  {
    id v8 = [v7 iconViewForIcon:v6 location:*MEMORY[0x263F79320]];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)addPageChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBDashboardHomeViewController *)self pageObservers];
  [v5 addObserver:v4];

  unint64_t v6 = [(DBDashboardHomeViewController *)self currentPageIndex];
  id v9 = [(DBDashboardHomeViewController *)self folderController];
  uint64_t v7 = [v9 firstIconPageIndex];
  id v8 = [(DBDashboardHomeViewController *)self folderController];
  objc_msgSend(v4, "homeViewController:didChangeToPageIndex:firstIconPageIndex:minimumPageIndex:", self, v6, v7, objc_msgSend(v8, "minimumPageIndex"));
}

- (void)removePageChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBDashboardHomeViewController *)self pageObservers];
  [v5 removeObserver:v4];
}

- (void)setTodayViewForeground:(BOOL)a3
{
  if (a3 && [(DBDashboardHomeViewController *)self _onDashboardPage])
  {
    id v4 = [(DBDashboardHomeViewController *)self todayViewController];
    id v6 = v4;
    uint64_t v5 = 1;
  }
  else
  {
    id v4 = [(DBDashboardHomeViewController *)self todayViewController];
    id v6 = v4;
    uint64_t v5 = 0;
  }
  [v4 setForeground:v5];
}

- (void)setTodayViewActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DBDashboardHomeViewController *)self todayViewController];
  [v4 setActive:v3];
}

- (void)setAccessibilityElementsActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DBDashboardHomeViewController *)self view];
  [v4 setAccessibilityElementsHidden:!v3];
}

- (BOOL)isIconVisibleForIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [(DBDashboardHomeViewController *)self iconModel];
  id v6 = [v5 leafIconForIdentifier:v4];

  id v7 = v6;
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8) {
    BOOL v9 = [(DBDashboardHomeViewController *)self isIconVisible:v8];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)iconForIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [(DBDashboardHomeViewController *)self iconModel];
  id v6 = [v5 leafIconForIdentifier:v4];

  id v7 = v6;
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)iconCanDisplayBadge:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBDashboardHomeViewController *)self iconManager];
  LOBYTE(self) = [(DBDashboardHomeViewController *)self iconManager:v5 allowsBadgingForIcon:v4];

  return (char)self;
}

- (BOOL)isIconVisible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBDashboardHomeViewController *)self iconModel];
  char v6 = [v5 isIconVisible:v4];

  return v6;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  if (self->_currentPageIndex != a3)
  {
    self->_currentPageIndex = a3;
    id v4 = [(DBDashboardHomeViewController *)self pageObservers];
    unint64_t v5 = [(DBDashboardHomeViewController *)self currentPageIndex];
    char v6 = [(DBDashboardHomeViewController *)self folderController];
    uint64_t v7 = [v6 firstIconPageIndex];
    id v8 = [(DBDashboardHomeViewController *)self folderController];
    objc_msgSend(v4, "homeViewController:didChangeToPageIndex:firstIconPageIndex:minimumPageIndex:", self, v5, v7, objc_msgSend(v8, "minimumPageIndex"));

    BOOL v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v9 setInteger:self->_currentPageIndex forKey:@"CARStartPageIndex"];

    id v10 = [(DBDashboardHomeViewController *)self todayViewController];
    objc_msgSend(v10, "setForeground:", -[DBDashboardHomeViewController _onDashboardPage](self, "_onDashboardPage"));
  }
}

- (void)_persistCachedIconImages
{
  BOOL v3 = [(DBDashboardHomeViewController *)self environment];
  id v4 = [v3 environmentConfiguration];
  id v24 = [v4 vehicleID];

  unint64_t v5 = [(DBDashboardHomeViewController *)self environment];
  char v6 = [v5 environmentConfiguration];
  [v6 screenScale];
  double v7 = DBIconImageInfoForScale();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [(DBDashboardHomeViewController *)self iconModel];
  uint64_t v15 = *MEMORY[0x263F31298];
  double v16 = [v14 leafIconForIdentifier:*MEMORY[0x263F31298]];

  v17 = [(DBDashboardHomeViewController *)self iconImageCache];
  id v18 = objc_msgSend(v16, "iconImageWithInfo:", v7, v9, v11, v13);
  [v17 setIconImage:v18 forBundleIdentifier:v15 inVehicle:v24];

  uint64_t v19 = [(DBDashboardHomeViewController *)self iconModel];
  uint64_t v20 = *MEMORY[0x263F312A8];
  double v21 = [v19 leafIconForIdentifier:*MEMORY[0x263F312A8]];

  double v22 = [(DBDashboardHomeViewController *)self iconImageCache];
  double v23 = objc_msgSend(v21, "iconImageWithInfo:", v7, v9, v11, v13);
  [v22 setIconImage:v23 forBundleIdentifier:v20 inVehicle:v24];
}

- (void)_launchNowPlaying
{
  BOOL v3 = [(DBDashboardHomeViewController *)self nowPlayingObserver];
  id v4 = [v3 nowPlayingLaunchInfo];

  if (v4)
  {
    unint64_t v5 = [(DBDashboardHomeViewController *)self environment];
    char v6 = +[DBEvent eventWithType:4 context:v4];
    [v5 handleEvent:v6];
  }
  else
  {
    unint64_t v5 = DBLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "No available now playing app to launch from Now Playing.", v7, 2u);
    }
  }
}

- (void)_handleAppLibraryRefresh
{
  BOOL v3 = [(DBDashboardHomeViewController *)self iconModel];
  [v3 reloadIcons];

  id v4 = [(DBDashboardHomeViewController *)self iconManager];
  [v4 relayout];

  unint64_t v5 = [(DBDashboardHomeViewController *)self folderController];
  objc_msgSend(v5, "setLeadingCustomViewPageHidden:", +[DBTodayViewController isEnabledAndSupportedForIconProvider:](DBTodayViewController, "isEnabledAndSupportedForIconProvider:", self) ^ 1);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.CarPlay.internal.refreshApps", 0, 0, 1u);
}

- (id)folderController
{
  objc_opt_class();
  BOOL v3 = [(DBDashboardHomeViewController *)self iconManager];
  id v4 = [v3 rootFolderController];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)_indexPathForFallbackIcon:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DBDashboardHomeViewController *)self folderController];
  id v5 = [v4 currentIconListView];
  char v6 = v5;
  if (v5)
  {
    double v7 = [v5 visibleIcons];
    double v8 = [v4 folder];
    if (v3) {
      [v7 lastObject];
    }
    else {
    double v10 = [v7 firstObject];
    }
    double v9 = [v8 indexPathForIcon:v10];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (void)_invalidateBadgeForIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DBDashboardHomeViewController *)self iconModel];
  char v6 = [v5 leafIconForIdentifier:v4];

  objc_opt_class();
  id v7 = [v6 activeDataSource];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  [v8 invalidateBadgeValue];
  [v6 noteBadgeDidChange];
  double v9 = DBLogForCategory(0xEuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = @"valid";
    if (!v6) {
      double v10 = @"NOT valid (nil)";
    }
    int v11 = 138543618;
    id v12 = v4;
    __int16 v13 = 2114;
    double v14 = v10;
    _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Invalidated badge for %{public}@. The icon is %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (BOOL)_onDashboardPage
{
  unint64_t v3 = [(DBDashboardHomeViewController *)self currentPageIndex];
  id v4 = [(DBDashboardHomeViewController *)self folderController];
  if (v3 == [v4 minimumPageIndex])
  {
    id v5 = [(DBDashboardHomeViewController *)self todayViewController];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_preferredFocusedIcon
{
  unint64_t v3 = self->_lastFocusedIndex;
  if (v3
    || ([(DBDashboardHomeViewController *)self _indexPathForFallbackIcon:0],
        (unint64_t v3 = (NSIndexPath *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(DBDashboardHomeViewController *)self _iconViewForIndexpath:v3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)preferredFocusEnvironments
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(DBDashboardHomeViewController *)self _onDashboardPage])
  {
    id v4 = [(DBDashboardHomeViewController *)self todayViewController];
    [v3 addObject:v4];
  }
  id v5 = [(DBDashboardHomeViewController *)self _preferredFocusedIcon];
  if (v5) {
    [v3 addObject:v5];
  }
  if ([v3 count])
  {
    id v6 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DBDashboardHomeViewController;
    id v6 = [(DBDashboardHomeViewController *)&v9 preferredFocusEnvironments];
  }
  id v7 = v6;

  return v7;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v13 = a3;
  id v5 = [v13 nextFocusedView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v13 nextFocusedView];
    id v8 = [v7 icon];
    objc_super v9 = [(DBDashboardHomeViewController *)self folderController];
    double v10 = [v9 folder];
    int v11 = [v10 indexPathForIcon:v8];
    lastFocusedIndex = self->_lastFocusedIndex;
    self->_lastFocusedIndex = v11;
  }
}

- (id)_linearFocusMovementSequences
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(DBDashboardHomeViewController *)self todayViewController];

  if (v4)
  {
    id v5 = [(DBDashboardHomeViewController *)self todayViewController];
    [v5 loadViewIfNeeded];

    id v6 = [(DBDashboardHomeViewController *)self todayViewController];
    id v7 = [v6 linearFocusItems];
    [v3 addObjectsFromArray:v7];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = [(DBDashboardHomeViewController *)self folderController];
  objc_super v9 = [v8 iconListViews];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = [v14 icons];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __62__DBDashboardHomeViewController__linearFocusMovementSequences__block_invoke;
        v19[3] = &unk_2649B6040;
        v19[4] = v14;
        id v20 = v3;
        [v15 enumerateObjectsUsingBlock:v19];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }

  double v16 = (void *)[objc_alloc(MEMORY[0x263F82F78]) initWithItems:v3 loops:0 restrictEnteringSequence:1];
  id v25 = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];

  return v17;
}

uint64_t __62__DBDashboardHomeViewController__linearFocusMovementSequences__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) displayedIconViewForIcon:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 40) addObject:v3];
    uint64_t v4 = v6;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (id)_iconViewForIndexpath:(id)a3
{
  id v4 = a3;
  id v5 = [(DBDashboardHomeViewController *)self folderController];
  uint64_t v6 = [v5 folder];
  id v7 = [v6 iconAtIndexPath:v4];

  id v8 = [(DBDashboardHomeViewController *)self folderController];
  objc_super v9 = [v8 iconViewForIcon:v7 location:*MEMORY[0x263F79320]];

  return v9;
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(DBDashboardHomeViewController *)self folderController];
  char v6 = [v5 isScrolling];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)DBDashboardHomeViewController;
    [(DBDashboardHomeViewController *)&v7 _wheelChangedWithEvent:v4];
  }
}

- (void)dataStoreMonitor:(id)a3 didUpdateApplication:(id)a4 forKey:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if ([a5 isEqualToString:@"SBApplicationBadgeKey"])
  {
    id v8 = DBLogForCategory(0xEuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Data store updated badge value for %{public}@", buf, 0xCu);
    }

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __78__DBDashboardHomeViewController_dataStoreMonitor_didUpdateApplication_forKey___block_invoke;
    v9[3] = &unk_2649B3D30;
    v9[4] = self;
    id v10 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

uint64_t __78__DBDashboardHomeViewController_dataStoreMonitor_didUpdateApplication_forKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateBadgeForIdentifier:*(void *)(a1 + 40)];
}

- (void)_backButtonTapped:(id)a3
{
}

- (void)_handleBackActionSupportACBack:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(DBDashboardHomeViewController *)self folderController];
  if (([v5 isScrolling] & 1) == 0)
  {
    unint64_t v6 = [v5 minimumPageIndex];
    if ([(DBDashboardHomeViewController *)self currentPageIndex] <= v6)
    {
      if (v3
        && ([(DBDashboardHomeViewController *)self environment],
            id v7 = objc_claimAutoreleasedReturnValue(),
            [v7 environmentConfiguration],
            id v8 = objc_claimAutoreleasedReturnValue(),
            int v9 = [v8 isACBackSupported],
            v8,
            v7,
            v9))
      {
        if ([(DBDashboardHomeViewController *)self _isACBackEnabled])
        {
          id v10 = [(DBDashboardHomeViewController *)self environment];
          uint64_t v11 = [v10 environmentConfiguration];
          id v12 = [v11 session];
          uint64_t v13 = [NSURL URLWithString:@"oem:back"];
          [v12 requestCarUIForURL:v13];
        }
      }
      else if ([(DBDashboardHomeViewController *)self currentPageIndex] == v6 {
             && v6 != [v5 firstIconPageIndex])
      }
      {
        unint64_t v6 = [v5 firstIconPageIndex];
      }
    }
    if (v6 != [(DBDashboardHomeViewController *)self currentPageIndex])
    {
      [(DBDashboardHomeViewController *)self setCurrentPageIndex:v6];
      if (UIAccessibilityIsReduceMotionEnabled())
      {
        double v14 = [(DBDashboardHomeViewController *)self folderController];
        [v14 setCurrentPageIndex:v6];

        [(DBDashboardHomeViewController *)self setNeedsFocusUpdate];
      }
      else
      {
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __64__DBDashboardHomeViewController__handleBackActionSupportACBack___block_invoke;
        v16[3] = &unk_2649B6068;
        v16[4] = self;
        v16[5] = v6;
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __64__DBDashboardHomeViewController__handleBackActionSupportACBack___block_invoke_2;
        v15[3] = &unk_2649B3FA8;
        v15[4] = self;
        [MEMORY[0x263F82E00] _animateUsingSpringWithDuration:0 delay:v16 options:v15 mass:0.5 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
      }
    }
  }
}

void __64__DBDashboardHomeViewController__handleBackActionSupportACBack___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) folderController];
  [v2 setCurrentPageIndex:*(void *)(a1 + 40)];
}

uint64_t __64__DBDashboardHomeViewController__handleBackActionSupportACBack___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsFocusUpdate];
}

- (BOOL)_isACBackEnabled
{
  id v2 = [(DBDashboardHomeViewController *)self acBackDisabledReasons];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)_setACBackDisabled:(BOOL)a3 forRequester:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(DBDashboardHomeViewController *)self acBackDisabledReasons];
  id v9 = v7;
  if (v4)
  {

    if (!v9)
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(DBDashboardHomeViewController *)self setAcBackDisabledReasons:v8];
    }
    id v9 = [(DBDashboardHomeViewController *)self acBackDisabledReasons];
    [v9 addObject:v6];
  }
  else
  {
    [v7 removeObject:v6];
  }
}

- (void)folderControllerWillBeginScrolling:(id)a3
{
}

- (void)folderControllerDidEndScrolling:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentPageIndex];
  if (v5 != [(DBDashboardHomeViewController *)self currentPageIndex])
  {
    [(DBDashboardHomeViewController *)self setCurrentPageIndex:v5];
    uint64_t v6 = [v4 iconListViewIndexForPageIndex:v5];
    id v7 = [MEMORY[0x263F82758] focusSystemForEnvironment:self];
    id v8 = [v7 focusedItem];

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_opt_class();
      id v9 = v8;
      if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
      {
        id v10 = [(DBDashboardHomeViewController *)self todayViewController];
        uint64_t v11 = [v10 view];
        char v12 = [v11 containsView:v9];

        if (v12) {
          goto LABEL_18;
        }
      }
      else
      {

        id v9 = 0;
      }
      [(DBDashboardHomeViewController *)self setNeedsFocusUpdate];
LABEL_18:

      goto LABEL_19;
    }
    id v9 = [v4 iconListViewAtIndex:v6];
    if (!self->_lastFocusedIndex)
    {
      uint64_t v13 = [(DBDashboardHomeViewController *)self _indexPathForFallbackIcon:0];
      lastFocusedIndex = self->_lastFocusedIndex;
      self->_lastFocusedIndex = v13;
    }
    objc_opt_class();
    id v15 = v8;
    if (v15 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      if ([v9 containsView:v15]) {
        goto LABEL_17;
      }
    }
    else
    {

      id v15 = 0;
    }
    double v16 = [MEMORY[0x263F088C8] indexPathWithIconIndex:0 listIndex:v6];
    v17 = self->_lastFocusedIndex;
    self->_lastFocusedIndex = v16;

    [(DBDashboardHomeViewController *)self setNeedsFocusUpdate];
LABEL_17:

    goto LABEL_18;
  }
LABEL_19:
  dispatch_time_t v18 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__DBDashboardHomeViewController_folderControllerDidEndScrolling___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_after(v18, MEMORY[0x263EF83A0], block);
}

uint64_t __65__DBDashboardHomeViewController_folderControllerDidEndScrolling___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setACBackDisabled:0 forRequester:@"Scrolling"];
}

- (Class)controllerClassForFolder:(id)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4
{
  return 1;
}

- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4
{
  return 0;
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5
{
  return 0;
}

- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F82700]) initWithDropOperation:0];
  return v5;
}

- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6
{
  id v6 = a6;
  return v6;
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6
{
  return 0;
}

- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5
{
  return 0;
}

- (void)invalidate
{
  BOOL v3 = [(DBDashboardHomeViewController *)self dataStoreMonitor];
  [v3 removeObserver:self];

  id v4 = [(DBDashboardHomeViewController *)self todayViewController];
  [v4 invalidate];

  uint64_t v5 = +[DBApplicationController sharedInstance];
  [v5 removeObserver:self];

  +[DBIconDropShadowProvider invalidate];
  +[DBIconView setEnvironmentConfiguration:0];
}

- (DBTodayViewController)todayViewController
{
  return self->_todayViewController;
}

- (void)setTodayViewController:(id)a3
{
}

- (UIView)hairlineView
{
  return self->_hairlineView;
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (DBIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setIconImageCache:(id)a3
{
}

- (DBIconManager)iconManager
{
  return self->_iconManager;
}

- (void)setIconManager:(id)a3
{
}

- (DBIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
}

- (FBSApplicationDataStoreMonitor)dataStoreMonitor
{
  return self->_dataStoreMonitor;
}

- (void)setDataStoreMonitor:(id)a3
{
}

- (DBNowPlayingObserver)nowPlayingObserver
{
  return self->_nowPlayingObserver;
}

- (void)setNowPlayingObserver:(id)a3
{
}

- (NSIndexPath)lastFocusedIndex
{
  return self->_lastFocusedIndex;
}

- (void)setLastFocusedIndex:(id)a3
{
}

- (CARObserverHashTable)pageObservers
{
  return self->_pageObservers;
}

- (void)setPageObservers:(id)a3
{
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (NSMutableSet)acBackDisabledReasons
{
  return self->_acBackDisabledReasons;
}

- (void)setAcBackDisabledReasons:(id)a3
{
}

- (DBIconBadgeController)iconBadgeController
{
  return self->_iconBadgeController;
}

- (void)setIconBadgeController:(id)a3
{
}

- (DBDashboardLayoutEngine)layoutEngine
{
  return self->_layoutEngine;
}

- (void)setLayoutEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutEngine, 0);
  objc_storeStrong((id *)&self->_iconBadgeController, 0);
  objc_storeStrong((id *)&self->_acBackDisabledReasons, 0);
  objc_storeStrong((id *)&self->_pageObservers, 0);
  objc_storeStrong((id *)&self->_lastFocusedIndex, 0);
  objc_storeStrong((id *)&self->_nowPlayingObserver, 0);
  objc_storeStrong((id *)&self->_dataStoreMonitor, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_todayViewController, 0);
  objc_storeStrong((id *)&self->_cancelPlaceholderToken, 0);
  objc_storeStrong((id *)&self->_addPlaceholderToken, 0);
  objc_storeStrong((id *)&self->_replaceToken, 0);
  objc_storeStrong((id *)&self->_uninstallToken, 0);
  objc_storeStrong((id *)&self->_installToken, 0);
}

@end