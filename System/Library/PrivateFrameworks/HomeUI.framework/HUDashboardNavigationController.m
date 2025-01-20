@interface HUDashboardNavigationController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldDisableAnimationForViewController:(id)a3;
- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4;
- (BOOL)navigationBar:(id)a3 shouldPushItem:(id)a4;
- (BOOL)popToBottomNavigationControllerWithCustomAnimation;
- (BOOL)shouldUseCustomTabBarAppearance;
- (BOOL)supportsEditing;
- (HUDashboardFilterBarController)filterBarController;
- (HUDashboardNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (HUDashboardNavigator)dashboardNavigator;
- (NSString)editActionTitle;
- (NSString)editActionTitleLocalizationKey;
- (UINavigationBar)displayedNavigationBar;
- (UIView)duplicateWallpaperView;
- (id)_editActionDelegate;
- (id)_loadWallpaperForViewController:(uint64_t)a1;
- (id)childViewControllerForStatusBarStyle;
- (id)splitViewController;
- (int64_t)preferredStatusBarStyle;
- (void)_setUpTabBar;
- (void)dashboardFilterBarController:(id)a3 didUpdatePreferredHeight:(double)a4;
- (void)endEditing;
- (void)navigationBar:(id)a3 didChangeBackgroundVisibility:(BOOL)a4;
- (void)navigationBar:(id)a3 didPushItem:(id)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)sendContextMenuMetricsWithTitleLocalizationKey:(id)a3;
- (void)setDisplayedNavigationBar:(id)a3;
- (void)setDuplicateWallpaperView:(id)a3;
- (void)setShouldUseCustomTabBarAppearance:(BOOL)a3;
- (void)startEditing;
- (void)viewDidLoad;
@end

@implementation HUDashboardNavigationController

- (void)dashboardFilterBarController:(id)a3 didUpdatePreferredHeight:(double)a4
{
  id v6 = +[HUDashboardPresentationManager sharedManager];
  [v6 navigationController:self didUpdatePreferredPaletteHeight:a4];
}

- (BOOL)navigationBar:(id)a3 shouldPushItem:(id)a4
{
  id v5 = a4;
  id v6 = +[HUDashboardPresentationManager sharedManager];
  [v6 navigationController:self willPushItem:v5];

  return 1;
}

- (HUDashboardNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HUDashboardNavigationController;
  v4 = [(HUDashboardNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
  if (v4)
  {
    id v5 = +[HUDashboardPresentationManager sharedManager];
    [(HUDashboardNavigationController *)v4 setDelegate:v5];
  }
  return v4;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(HUDashboardNavigationController *)self _shouldDisableAnimationForViewController:v6]&& v4)
  {
    objc_super v7 = -[HUDashboardNavigationController _loadWallpaperForViewController:]((uint64_t)self, v6);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__HUDashboardNavigationController_pushViewController_animated___block_invoke;
    v10[3] = &unk_1E638F4D0;
    v10[4] = self;
    id v11 = v6;
    char v12 = 1;
    id v8 = (id)[v7 addCompletionBlock:v10];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HUDashboardNavigationController;
    [(HUDashboardNavigationController *)&v9 pushViewController:v6 animated:v4];
  }
}

- (BOOL)_shouldDisableAnimationForViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  objc_super v7 = [v6 itemManager];
  id v8 = [v7 context];
  objc_super v9 = [v8 room];
  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    id v11 = [v6 itemManager];
    char v12 = [v11 context];
    v13 = [v12 overrideDashboardTitle];
    BOOL v10 = v13 == 0;
  }
  int v14 = [v6 isOverlay];
  v15 = [v6 itemManager];
  v16 = [v15 context];
  uint64_t v17 = [v16 backgroundStyle];

  int v18 = (v17 != 1) & ~v14;
  if (v10) {
    int v18 = 0;
  }
  if (v6) {
    int v19 = v18;
  }
  else {
    int v19 = 0;
  }
  if _os_feature_enabled_impl() && (_os_feature_enabled_impl())
  {
    LOBYTE(v19) = 0;
  }
  else if (([MEMORY[0x1E4F69758] isAVisionPro] & 1) == 0 {
         && ([MEMORY[0x1E4F69758] isAnIPad] & 1) == 0)
  }
  {
    v19 &= [MEMORY[0x1E4F69758] isAMac];
  }

  return v19;
}

- (void)setShouldUseCustomTabBarAppearance:(BOOL)a3
{
  self->_shouldUseCustomTabBarAppearance = a3;
}

- (id)splitViewController
{
  objc_opt_class();
  id v3 = [(HUDashboardNavigationController *)self parentViewController];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    objc_opt_class();
    objc_super v7 = [(HUDashboardNavigationController *)self parentViewController];
    id v8 = [v7 parentViewController];
    if (objc_opt_isKindOfClass()) {
      objc_super v9 = v8;
    }
    else {
      objc_super v9 = 0;
    }
    id v3 = v9;
  }

  return v3;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUDashboardNavigationController;
  [(HUDashboardNavigationController *)&v3 viewDidLoad];
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    if ([(HUDashboardNavigationController *)self shouldUseCustomTabBarAppearance]) {
      [(HUDashboardNavigationController *)self _setUpTabBar];
    }
  }
}

- (BOOL)shouldUseCustomTabBarAppearance
{
  return self->_shouldUseCustomTabBarAppearance;
}

- (void)_setUpTabBar
{
  v25[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_opt_new();
  id v4 = objc_msgSend(MEMORY[0x1E4F43020], "hu_dashboardBarEffects");
  [v3 setBackgroundEffects:v4];

  uint64_t v24 = *MEMORY[0x1E4F42510];
  uint64_t v5 = v24;
  id v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v25[0] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  id v8 = [v3 stackedLayoutAppearance];
  objc_super v9 = [v8 selected];
  [v9 setTitleTextAttributes:v7];

  BOOL v10 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  id v11 = [v3 stackedLayoutAppearance];
  char v12 = [v11 selected];
  [v12 setIconColor:v10];

  uint64_t v22 = v5;
  v13 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.4];
  v23 = v13;
  int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v15 = [v3 stackedLayoutAppearance];
  v16 = [v15 normal];
  [v16 setTitleTextAttributes:v14];

  uint64_t v17 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.4];
  int v18 = [v3 stackedLayoutAppearance];
  int v19 = [v18 normal];
  [v19 setIconColor:v17];

  v20 = [(HUDashboardNavigationController *)self tabBarItem];
  [v20 setStandardAppearance:v3];

  v21 = [(HUDashboardNavigationController *)self tabBarItem];
  [v21 setScrollEdgeAppearance:v3];
}

- (int64_t)preferredStatusBarStyle
{
  objc_opt_class();
  objc_super v3 = [(HUDashboardNavigationController *)self navigationBar];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  int v6 = [v5 isBackgroundVisible];
  return v6 ^ 1u;
}

- (id)childViewControllerForStatusBarStyle
{
  objc_super v3 = [(HUDashboardNavigationController *)self navigationBar];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(HUDashboardNavigationController *)self topViewController];
  }

  return v4;
}

- (HUDashboardFilterBarController)filterBarController
{
  filterBarController = self->_filterBarController;
  if (!filterBarController)
  {
    id v4 = (HUDashboardFilterBarController *)objc_opt_new();
    id v5 = self->_filterBarController;
    self->_filterBarController = v4;

    [(HUDashboardFilterBarController *)self->_filterBarController setDelegate:self];
    filterBarController = self->_filterBarController;
  }

  return filterBarController;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)navigationBar:(id)a3 didPushItem:(id)a4
{
  id v5 = a4;
  id v6 = +[HUDashboardPresentationManager sharedManager];
  [v6 navigationController:self didPushItem:v5];
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  return ![(HUDashboardNavigationController *)self popToBottomNavigationControllerWithCustomAnimation];
}

- (void)navigationBar:(id)a3 didChangeBackgroundVisibility:(BOOL)a4
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F42E30]) initWithDefaultParameters];
  [v5 setSkipFencing:1];
  [(HUDashboardNavigationController *)self _setNeedsStatusBarAppearanceUpdateWithAnimationParameters:v5];
}

- (HUDashboardNavigator)dashboardNavigator
{
  objc_super v3 = [(HUDashboardNavigationController *)self tabBarController];

  if (v3)
  {
    id v4 = [(HUDashboardNavigationController *)self tabBarController];
  }
  else
  {
    id v5 = [(HUDashboardNavigationController *)self splitViewController];

    if (!v5) {
      goto LABEL_10;
    }
    id v4 = [(HUDashboardNavigationController *)self splitViewController];
  }
  id v6 = v4;
  if ([v4 conformsToProtocol:&unk_1F1A78CD0]) {
    objc_super v7 = v6;
  }
  else {
    objc_super v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    objc_super v9 = [v8 dashboardNavigator];

    goto LABEL_11;
  }
LABEL_10:
  objc_super v9 = 0;
LABEL_11:

  return (HUDashboardNavigator *)v9;
}

- (id)_editActionDelegate
{
  v2 = [(HUDashboardNavigationController *)self topViewController];
  if ([v2 conformsToProtocol:&unk_1F1A78DC0]) {
    objc_super v3 = v2;
  }
  else {
    objc_super v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)editActionTitle
{
  v2 = [(HUDashboardNavigationController *)self _editActionDelegate];
  objc_super v3 = [v2 editActionTitle];

  return (NSString *)v3;
}

- (NSString)editActionTitleLocalizationKey
{
  v2 = [(HUDashboardNavigationController *)self _editActionDelegate];
  objc_super v3 = [v2 editActionTitleLocalizationKey];

  return (NSString *)v3;
}

- (BOOL)supportsEditing
{
  v2 = [(HUDashboardNavigationController *)self _editActionDelegate];
  char v3 = [v2 supportsEditing];

  return v3;
}

- (void)startEditing
{
  char v3 = [(HUDashboardNavigationController *)self _editActionDelegate];
  [v3 startEditing];

  id v4 = [(HUDashboardNavigationController *)self filterBarController];
  [v4 setEditing:1 animated:1];
}

- (void)endEditing
{
  char v3 = [(HUDashboardNavigationController *)self _editActionDelegate];
  [v3 endEditing];

  id v4 = [(HUDashboardNavigationController *)self filterBarController];
  [v4 setEditing:0 animated:1];
}

- (void)sendContextMenuMetricsWithTitleLocalizationKey:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  id v4 = [(HUDashboardNavigationController *)self topViewController];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if ([v6 conformsToProtocol:&unk_1F1A78DC0]) {
    objc_super v7 = v6;
  }
  else {
    objc_super v7 = 0;
  }
  id v8 = v7;

  if (objc_opt_respondsToSelector()) {
    [v8 sendContextMenuMetricsWithTitleLocalizationKey:v9];
  }
}

- (id)_loadWallpaperForViewController:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_opt_class();
    id v4 = v3;
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    objc_super v7 = [v6 itemManager];
    id v8 = [v7 context];

    id v9 = [MEMORY[0x1E4F69780] sharedInstance];
    BOOL v10 = [v8 room];
    id v11 = v10;
    if (!v10)
    {
      id v11 = [v8 home];
    }
    char v12 = [v9 wallpaperForHomeKitObject:v11];
    v13 = [v12 flatMap:&__block_literal_global_216];

    if (!v10) {
  }
    }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __63__HUDashboardNavigationController_pushViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (a2)
  {
    id v5 = v2;
    id v75 = a2;
    if (v3)
    {
      objc_opt_class();
      id v6 = [v3 splitViewController];
      if (objc_opt_isKindOfClass()) {
        objc_super v7 = v6;
      }
      else {
        objc_super v7 = 0;
      }
      id v8 = v7;

      objc_opt_class();
      id v9 = [v8 viewControllerForColumn:0];
      if (objc_opt_isKindOfClass()) {
        BOOL v10 = v9;
      }
      else {
        BOOL v10 = 0;
      }
      id v11 = v10;

      objc_opt_class();
      id v12 = v5;
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      id v74 = v13;

      int v14 = [v8 view];
      v15 = [v14 subviews];
      v73 = objc_msgSend(v15, "na_firstObjectPassingTest:", &__block_literal_global_120_1);

      id v16 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      uint64_t v91 = 0;
      v92 = (double *)&v91;
      uint64_t v93 = 0x4010000000;
      v94 = &unk_1BEACB3BA;
      long long v95 = 0u;
      long long v96 = 0u;
      uint64_t v17 = [v3 view];
      [v17 frame];
      *(void *)&long long v95 = v18;
      *((void *)&v95 + 1) = v19;
      *(void *)&long long v96 = v20;
      *((void *)&v96 + 1) = v21;

      uint64_t v22 = v92;
      *((_OWORD *)v92 + 2) = *MEMORY[0x1E4F1DAD8];
      objc_msgSend(v16, "setFrame:", v22[4], v22[5], v22[6], v22[7]);
      id v72 = v5;
      v23 = [v8 view];
      uint64_t v24 = [v3 view];
      [v24 frame];
      uint64_t v25 = objc_msgSend(v23, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);

      [v16 addSubview:v25];
      v71 = (void *)v25;
      v26 = [HUWallpaperView alloc];
      v27 = [v8 view];
      [v27 frame];
      v28 = -[HUWallpaperView initWithFrame:](v26, "initWithFrame:");

      v29 = [v8 view];
      v30 = [v8 view];
      [v30 frame];
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      v39 = [v3 view];
      objc_msgSend(v29, "convertRect:toView:", v39, v32, v34, v36, v38);
      -[HUWallpaperView setFrame:](v28, "setFrame:");

      v40 = [v74 view];
      [v40 insertSubview:v28 atIndex:0];

      [(HUWallpaperView *)v28 populateWallpaper:v75 withAnimation:0 onlyIfNeeded:0];
      if (([MEMORY[0x1E4F69758] isAMac] & 1) != 0
        || (objc_msgSend(MEMORY[0x1E4F69758], "isAVisionPro", v25) & 1) != 0)
      {
        v41 = objc_msgSend(v12, "view", v71);
        uint64_t v42 = [v41 snapshotViewAfterScreenUpdates:1];
      }
      else
      {
        v90.receiver = v3;
        v90.super_class = (Class)HUDashboardNavigationController;
        objc_msgSendSuper2(&v90, sel_pushViewController_animated_, v12, 0);
        v41 = [v3 view];
        uint64_t v42 = [v41 snapshotViewAfterScreenUpdates:1];
      }
      v44 = (void *)v42;

      [v44 frame];
      v45 = v92;
      *((void *)v92 + 4) = v46;
      *((void *)v45 + 5) = v47;
      *((void *)v45 + 6) = v48;
      *((void *)v45 + 7) = v49;
      v50 = [v3 view];
      [v50 frame];
      v92[4] = CGRectGetWidth(v97);

      objc_msgSend(v44, "setFrame:", v92[4], v92[5], v92[6], v92[7]);
      [v16 addSubview:v44];
      v51 = [v3 view];
      [v51 addSubview:v16];

      if (([MEMORY[0x1E4F69758] isAMac] & 1) != 0
        || [MEMORY[0x1E4F69758] isAVisionPro])
      {
        v89.receiver = v3;
        v89.super_class = (Class)HUDashboardNavigationController;
        objc_msgSendSuper2(&v89, sel_pushViewController_animated_, v12, 0);
      }
      v52 = [HUWallpaperView alloc];
      v53 = [v8 view];
      [v53 frame];
      v54 = -[HUWallpaperView initWithFrame:](v52, "initWithFrame:");

      [(HUWallpaperView *)v54 frame];
      v55 = v92;
      *((void *)v92 + 4) = v56;
      *((void *)v55 + 5) = v57;
      *((void *)v55 + 6) = v58;
      *((void *)v55 + 7) = v59;
      v60 = [v11 view];
      [v60 frame];
      v92[4] = -v61;

      -[HUWallpaperView setFrame:](v54, "setFrame:", v92[4], v92[5], v92[6], v92[7]);
      v62 = [v11 view];
      [v62 insertSubview:v54 atIndex:0];

      [(HUWallpaperView *)v54 populateWallpaper:v75 withAnimation:0 onlyIfNeeded:0];
      [(HUWallpaperView *)v54 setAlpha:0.0];
      v63 = (void *)MEMORY[0x1E4F42FF0];
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_2;
      v83[3] = &unk_1E638F588;
      v88 = &v91;
      id v64 = v44;
      id v84 = v64;
      id v65 = v71;
      id v85 = v65;
      id v66 = v11;
      id v86 = v66;
      v87 = v54;
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_5;
      v77[3] = &unk_1E638F5B0;
      id v67 = v73;
      id v78 = v67;
      id v79 = v75;
      id v68 = v16;
      id v80 = v68;
      v69 = v28;
      v81 = v69;
      v70 = v87;
      v82 = v70;
      [v63 animateKeyframesWithDuration:0 delay:v83 options:v77 animations:0.6 completion:0.0];

      _Block_object_dispose(&v91, 8);
      id v5 = v72;
    }
  }
  else
  {
    uint64_t v43 = *(unsigned __int8 *)(a1 + 48);
    v76.receiver = *(id *)(a1 + 32);
    v76.super_class = (Class)HUDashboardNavigationController;
    objc_msgSendSuper2(&v76, sel_pushViewController_animated_, v2, v43);
  }
}

- (BOOL)popToBottomNavigationControllerWithCustomAnimation
{
  id v3 = [(HUDashboardNavigationController *)self topViewController];
  BOOL v4 = [(HUDashboardNavigationController *)self _shouldDisableAnimationForViewController:v3];

  if (v4)
  {
    id v5 = [(HUDashboardNavigationController *)self bottomViewController];
    id v6 = -[HUDashboardNavigationController _loadWallpaperForViewController:]((uint64_t)self, v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __85__HUDashboardNavigationController_popToBottomNavigationControllerWithCustomAnimation__block_invoke;
    v9[3] = &unk_1E638F4F8;
    v9[4] = self;
    id v7 = (id)[v6 addCompletionBlock:v9];
  }
  return v4;
}

void __85__HUDashboardNavigationController_popToBottomNavigationControllerWithCustomAnimation__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v108 = a2;
    if (v2)
    {
      objc_opt_class();
      id v3 = [v2 splitViewController];
      if (objc_opt_isKindOfClass()) {
        BOOL v4 = v3;
      }
      else {
        BOOL v4 = 0;
      }
      id v5 = v4;

      objc_opt_class();
      id v6 = [v5 viewControllerForColumn:0];
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
      id v106 = v7;

      objc_opt_class();
      id v8 = [v2 bottomViewController];
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
      id v105 = v9;

      BOOL v10 = [v5 view];
      id v11 = [v10 subviews];
      id v12 = objc_msgSend(v11, "na_firstObjectPassingTest:", &__block_literal_global_128_1);

      v104 = v12;
      [v12 setDisableWallpaperUpdate:1];
      id v13 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      uint64_t v125 = 0;
      v126 = (double *)&v125;
      uint64_t v127 = 0x4010000000;
      v128 = &unk_1BEACB3BA;
      long long v129 = 0u;
      long long v130 = 0u;
      int v14 = [v2 view];
      [v14 frame];
      *(void *)&long long v129 = v15;
      *((void *)&v129 + 1) = v16;
      *(void *)&long long v130 = v17;
      *((void *)&v130 + 1) = v18;

      uint64_t v19 = v126;
      *((_OWORD *)v126 + 2) = *MEMORY[0x1E4F1DAD8];
      objc_msgSend(v13, "setFrame:", v19[4], v19[5], v19[6], v19[7]);
      uint64_t v20 = [v5 view];
      uint64_t v21 = [v2 view];
      [v21 frame];
      uint64_t v22 = objc_msgSend(v20, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);

      [v13 addSubview:v22];
      uint64_t v102 = v22;
      v23 = [HUWallpaperView alloc];
      uint64_t v24 = [v5 view];
      [v24 frame];
      v107 = -[HUWallpaperView initWithFrame:](v23, "initWithFrame:");

      uint64_t v25 = [v5 view];
      v26 = [v5 view];
      [v26 frame];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v35 = [v2 view];
      objc_msgSend(v25, "convertRect:toView:", v35, v28, v30, v32, v34);
      -[HUWallpaperView setFrame:](v107, "setFrame:");

      double v36 = [v105 view];
      [v36 insertSubview:v107 atIndex:0];

      [(HUWallpaperView *)v107 populateWallpaper:v108 withAnimation:0 onlyIfNeeded:0];
      if ([MEMORY[0x1E4F69758] isAMac])
      {
        double v37 = objc_msgSend(v105, "view", v102);
        uint64_t v38 = [v37 snapshotViewAfterScreenUpdates:1];
      }
      else
      {
        v124.receiver = v2;
        v124.super_class = (Class)HUDashboardNavigationController;
        id v40 = objc_msgSendSuper2(&v124, sel_popViewControllerAnimated_, 0, v102);
        double v37 = [v2 view];
        uint64_t v38 = [v37 snapshotViewAfterScreenUpdates:1];
      }
      v41 = (void *)v38;

      [v41 frame];
      uint64_t v42 = v126;
      *((void *)v126 + 4) = v43;
      *((void *)v42 + 5) = v44;
      *((void *)v42 + 6) = v45;
      *((void *)v42 + 7) = v46;
      uint64_t v47 = [v2 view];
      [v47 frame];
      v126[4] = -CGRectGetWidth(v131);

      objc_msgSend(v41, "setFrame:", v126[4], v126[5], v126[6], v126[7]);
      [v13 addSubview:v41];
      uint64_t v48 = [v2 view];
      [v48 addSubview:v13];

      if ([MEMORY[0x1E4F69758] isAMac])
      {
        v123.receiver = v2;
        v123.super_class = (Class)HUDashboardNavigationController;
        id v49 = objc_msgSendSuper2(&v123, sel_popViewControllerAnimated_, 0);
        v50 = [v2 filterBarController];
        v51 = [v50 collectionView];
        uint64_t v52 = [v51 effectiveUserInterfaceLayoutDirection];

        v53 = [HUWallpaperView alloc];
        v54 = [v5 view];
        [v54 frame];
        v55 = -[HUWallpaperView initWithFrame:](v53, "initWithFrame:");

        uint64_t v56 = [v5 view];
        uint64_t v57 = [v5 view];
        [v57 frame];
        double v59 = v58;
        double v61 = v60;
        double v63 = v62;
        double v65 = v64;
        id v66 = [v2 filterBarController];
        id v67 = [v66 collectionView];
        objc_msgSend(v56, "convertRect:toView:", v67, v59, v61, v63, v65);
        -[HUWallpaperView setFrame:](v55, "setFrame:");

        if (v52 == 1)
        {
          [(HUWallpaperView *)v55 frame];
          id v68 = v126;
          *((void *)v126 + 5) = v69;
          *((void *)v68 + 6) = v70;
          *((void *)v68 + 7) = v71;
          v68[4] = 0.0;
          [(HUWallpaperView *)v55 setFrame:0.0];
        }
        id v72 = [v2 filterBarController];
        v73 = [v72 collectionView];
        [v73 insertSubview:v55 atIndex:0];

        [(HUWallpaperView *)v55 populateWallpaper:v108 withAnimation:0 onlyIfNeeded:0];
        id v74 = [v2 filterBarController];
        id v75 = [v74 collectionView];
        objc_super v76 = [v75 snapshotViewAfterScreenUpdates:1];

        [v76 frame];
        v77 = v126;
        *((void *)v126 + 4) = v78;
        *((void *)v77 + 5) = v79;
        *((void *)v77 + 6) = v80;
        *((void *)v77 + 7) = v81;
        v82 = [v2 navigationBar];
        [v82 frame];
        v126[5] = CGRectGetMinY(v132);

        objc_msgSend(v76, "setFrame:", v126[4], v126[5], v126[6], v126[7]);
        [v41 addSubview:v76];
      }
      else
      {
        v55 = 0;
      }
      v83 = [HUWallpaperView alloc];
      id v84 = [v5 view];
      [v84 frame];
      id v85 = -[HUWallpaperView initWithFrame:](v83, "initWithFrame:");

      [(HUWallpaperView *)v85 frame];
      id v86 = v126;
      *((void *)v126 + 4) = v87;
      *((void *)v86 + 5) = v88;
      *((void *)v86 + 6) = v89;
      *((void *)v86 + 7) = v90;
      uint64_t v91 = [v106 view];
      [v91 frame];
      v126[4] = -v92;

      -[HUWallpaperView setFrame:](v85, "setFrame:", v126[4], v126[5], v126[6], v126[7]);
      uint64_t v93 = [v106 view];
      [v93 insertSubview:v85 atIndex:0];

      [(HUWallpaperView *)v85 populateWallpaper:v108 withAnimation:0 onlyIfNeeded:0];
      [(HUWallpaperView *)v85 setAlpha:0.0];
      v94 = (void *)MEMORY[0x1E4F42FF0];
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 3221225472;
      v117[2] = __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_2;
      v117[3] = &unk_1E638F588;
      v122 = &v125;
      id v95 = v41;
      id v118 = v95;
      id v96 = v103;
      id v119 = v96;
      v120 = v2;
      v121 = v85;
      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_5;
      v110[3] = &unk_1E6386590;
      id v97 = v104;
      id v111 = v97;
      id v112 = v108;
      id v98 = v13;
      id v113 = v98;
      v99 = v107;
      v114 = v99;
      v100 = v121;
      v115 = v100;
      v101 = v55;
      v116 = v101;
      [v94 animateKeyframesWithDuration:0 delay:v117 options:v110 animations:0.6 completion:0.0];

      _Block_object_dispose(&v125, 8);
    }
  }
  else
  {
    v109.receiver = *(id *)(a1 + 32);
    v109.super_class = (Class)HUDashboardNavigationController;
    id v39 = objc_msgSendSuper2(&v109, sel_popViewControllerAnimated_, 0);
  }
}

uint64_t __67__HUDashboardNavigationController__loadWallpaperForViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:a2];
}

uint64_t __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F42FF0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_3;
  v6[3] = &unk_1E638F560;
  uint64_t v10 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  [v2 addKeyframeWithRelativeStartTime:v6 relativeDuration:0.0 animations:1.0];
  id v3 = (void *)MEMORY[0x1E4F42FF0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_4;
  v4[3] = &unk_1E6386018;
  id v5 = *(id *)(a1 + 56);
  [v3 addKeyframeWithRelativeStartTime:v4 relativeDuration:0.85 animations:0.15];
}

uint64_t __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  id v2 = *(void **)(*(void *)(a1 + 56) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56));
  [*(id *)(a1 + 40) frame];
  id v7 = *(void **)(*(void *)(a1 + 56) + 8);
  v7[4] = v8;
  v7[5] = v9;
  v7[6] = v10;
  v7[7] = v11;
  id v12 = [*(id *)(a1 + 48) view];
  [v12 frame];
  *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = -CGRectGetMaxX(v21);

  id v13 = *(double **)(*(void *)(a1 + 56) + 8);
  double v14 = v13[4];
  double v15 = v13[5];
  double v16 = v13[6];
  double v17 = v13[7];
  uint64_t v18 = *(void **)(a1 + 40);

  return objc_msgSend(v18, "setFrame:", v14, v15, v16, v17);
}

uint64_t __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setDisableWallpaperUpdate:0];
  [*(id *)(a1 + 32) populateWallpaper:*(void *)(a1 + 40) withAnimation:0 onlyIfNeeded:0];
  [*(id *)(a1 + 48) removeFromSuperview];
  [*(id *)(a1 + 56) removeFromSuperview];
  id v2 = *(void **)(a1 + 64);

  return [v2 removeFromSuperview];
}

uint64_t __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F42FF0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_3;
  v8[3] = &unk_1E638F560;
  uint64_t v12 = *(void *)(a1 + 64);
  id v9 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v4;
  [v2 addKeyframeWithRelativeStartTime:v8 relativeDuration:0.0 animations:1.0];
  uint64_t v5 = (void *)MEMORY[0x1E4F42FF0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_4;
  v6[3] = &unk_1E6386018;
  id v7 = *(id *)(a1 + 56);
  [v5 addKeyframeWithRelativeStartTime:v6 relativeDuration:0.05 animations:0.1];
}

uint64_t __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  id v2 = *(void **)(*(void *)(a1 + 56) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56));
  [*(id *)(a1 + 40) frame];
  id v7 = *(void **)(*(void *)(a1 + 56) + 8);
  v7[4] = v8;
  v7[5] = v9;
  v7[6] = v10;
  v7[7] = v11;
  uint64_t v12 = [*(id *)(a1 + 48) view];
  [v12 frame];
  *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = CGRectGetWidth(v21);

  id v13 = *(double **)(*(void *)(a1 + 56) + 8);
  double v14 = v13[4];
  double v15 = v13[5];
  double v16 = v13[6];
  double v17 = v13[7];
  uint64_t v18 = *(void **)(a1 + 40);

  return objc_msgSend(v18, "setFrame:", v14, v15, v16, v17);
}

uint64_t __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setDisableWallpaperUpdate:0];
  [*(id *)(a1 + 32) populateWallpaper:*(void *)(a1 + 40) withAnimation:0 onlyIfNeeded:0];
  [*(id *)(a1 + 48) removeFromSuperview];
  [*(id *)(a1 + 56) removeFromSuperview];
  [*(id *)(a1 + 64) removeFromSuperview];
  id v2 = *(void **)(a1 + 72);

  return [v2 removeFromSuperview];
}

- (UINavigationBar)displayedNavigationBar
{
  return self->_displayedNavigationBar;
}

- (void)setDisplayedNavigationBar:(id)a3
{
}

- (UIView)duplicateWallpaperView
{
  return self->_duplicateWallpaperView;
}

- (void)setDuplicateWallpaperView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateWallpaperView, 0);
  objc_storeStrong((id *)&self->_displayedNavigationBar, 0);

  objc_storeStrong((id *)&self->_filterBarController, 0);
}

@end