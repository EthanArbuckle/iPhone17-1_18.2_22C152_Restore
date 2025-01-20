@interface APUIAppPredictionViewController
+ (id)_bundleIdentifierSetFromApplicationProxies:(id)a3;
+ (id)_bundleIdentifierSetFromApplicationRecords:(id)a3;
- (APUIAppPredictionViewController)initWithIdentifier:(id)a3 layoutSize:(unint64_t)a4;
- (APUIAppPredictionViewController)initWithIdentifier:(id)a3 layoutSize:(unint64_t)a4 mode:(unint64_t)a5;
- (APUIAppPredictionViewControllerDelegate)delegate;
- (BOOL)_canDismissSelectedSuggestion;
- (BOOL)_canShowWhileLocked;
- (BOOL)appIconGridView:(id)a3 launchAppFromIcon:(id)a4;
- (BOOL)appIconGridView:(id)a3 shouldDisplayBadgeWithBundleIdentifier:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isLargeIconsEnabled;
- (BOOL)isOccluded;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)isShowingAlert;
- (BOOL)isShowingContextMenu;
- (BOOL)isUserInteracting;
- (BOOL)matchesWidgetUniqueID:(id)a3 stackID:(id)a4;
- (BOOL)supportsLargeIcons;
- (NSArray)applicationShortcutItems;
- (NSSet)presentedIconLocations;
- (UIEdgeInsets)parentLayoutInsets;
- (_UILegibilitySettings)legibilitySettings;
- (id)_fallbackBundleIds;
- (id)additionalIconListLayoutObserversForAppIconGridView:(id)a3;
- (id)appIconGridView:(id)a3 iconForApplicationWithBundleIdentifier:(id)a4;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (unint64_t)layoutSize;
- (unint64_t)mode;
- (void)_loadAppsInGridView:(id)a3;
- (void)_updateEffectiveLargeIconLayoutAnimated:(BOOL)a3;
- (void)_updateGridViewForBundleIds:(id)a3;
- (void)_updateLayoutInGridView:(id)a3;
- (void)_updateUserInteractingState;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationInstallsDidUpdateIcon:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)didSelectApplicationShortcutItem:(id)a3;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLargeIconsEnabled:(BOOL)a3;
- (void)setLargeIconsEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setLayoutSize:(unint64_t)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setOccluded:(BOOL)a3;
- (void)setParentLayoutInsets:(UIEdgeInsets)a3;
- (void)setShowingAlert:(BOOL)a3;
- (void)setShowingContextMenu:(BOOL)a3;
- (void)setUserInteracting:(BOOL)a3;
- (void)suggestionClientDidRefreshProactiveWidgetLayouts:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willShowContextMenuAtLocation:(CGPoint)a3;
@end

@implementation APUIAppPredictionViewController

- (APUIAppPredictionViewController)initWithIdentifier:(id)a3 layoutSize:(unint64_t)a4
{
  return [(APUIAppPredictionViewController *)self initWithIdentifier:a3 layoutSize:a4 mode:0];
}

- (APUIAppPredictionViewController)initWithIdentifier:(id)a3 layoutSize:(unint64_t)a4 mode:(unint64_t)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)APUIAppPredictionViewController;
  v9 = [(APUIWidgetViewController *)&v26 initWithIdentifier:v8];
  if (v9)
  {
    v10 = objc_opt_new();
    [(APUIWidgetViewController *)v9 setWidgetIdentifiable:v10];

    v11 = [(APUIWidgetViewController *)v9 widgetIdentifiable];
    [v11 setWidgetUniqueId:v8];

    v12 = [(APUIWidgetViewController *)v9 widgetIdentifiable];
    [v12 setSize:a4];

    uint64_t v13 = *MEMORY[0x263F24FA8];
    v14 = [(APUIWidgetViewController *)v9 widgetIdentifiable];
    [v14 setExtensionBundleId:v13];

    v15 = ATXSpecialWidgetKindAppPredictions();
    v16 = [(APUIWidgetViewController *)v9 widgetIdentifiable];
    [v16 setWidgetKind:v15];

    v9->_mode = a5;
    uint64_t v17 = objc_opt_new();
    usedFallbacks = v9->_usedFallbacks;
    v9->_usedFallbacks = (NSMutableSet *)v17;

    v19 = [MEMORY[0x263F25050] sharedInstance];
    [(APUIWidgetViewController *)v9 setSuggestionClient:v19];

    v20 = [(APUIWidgetViewController *)v9 suggestionClient];
    [v20 registerObserver:v9];

    v21 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__APUIAppPredictionViewController_initWithIdentifier_layoutSize_mode___block_invoke;
    block[3] = &unk_2647647C0;
    v25 = v9;
    dispatch_async(v21, block);

    v22 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2048;
      unint64_t v30 = a5;
      _os_log_impl(&dword_225AE0000, v22, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: APUIAppPredictionViewController initWithIdentifier %@; mode=%ld",
        buf,
        0x16u);
    }
  }
  return v9;
}

void __70__APUIAppPredictionViewController_initWithIdentifier_layoutSize_mode___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F01878] enumeratorWithOptions:64];
  v3 = +[APUIAppPredictionViewController _bundleIdentifierSetFromApplicationRecords:v2];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__APUIAppPredictionViewController_initWithIdentifier_layoutSize_mode___block_invoke_2;
  v5[3] = &unk_264764798;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __70__APUIAppPredictionViewController_initWithIdentifier_layoutSize_mode___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1040);
  *(void *)(v3 + 1040) = v2;

  id v5 = [MEMORY[0x263F01880] defaultWorkspace];
  [v5 addObserver:*(void *)(a1 + 32)];
}

- (BOOL)matchesWidgetUniqueID:(id)a3 stackID:(id)a4
{
  id v5 = a4;
  id v6 = [(APUIWidgetViewController *)self identifier];
  char v7 = [v6 isEqualToString:v5];

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x263F01880] defaultWorkspace];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)APUIAppPredictionViewController;
  [(APUIWidgetViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)APUIAppPredictionViewController;
  [(APUIAppPredictionViewController *)&v7 viewDidLoad];
  uint64_t v3 = __atxlog_handle_ui();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[APUIAppPredictionViewController viewDidLoad]";
    _os_log_impl(&dword_225AE0000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s", buf, 0xCu);
  }

  id v4 = [[APUIAppIconGridView alloc] initWithDelegate:self];
  gridView = self->_gridView;
  self->_gridView = v4;

  [(APUIAppIconGridView *)self->_gridView setMode:self->_mode];
  [(APUIAppIconGridView *)self->_gridView setLegibilitySettings:self->_legibilitySettings];
  [(APUIAppIconGridView *)self->_gridView setOccluded:[(APUIAppPredictionViewController *)self isOccluded]];
  [(APUIAppPredictionViewController *)self _updateEffectiveLargeIconLayoutAnimated:0];
  [(APUIAppPredictionViewController *)self _loadAppsInGridView:self->_gridView];
  id v6 = [(APUIAppPredictionViewController *)self view];
  [v6 addSubview:self->_gridView];
}

- (void)viewDidLayoutSubviews
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)APUIAppPredictionViewController;
  [(APUIAppPredictionViewController *)&v18 viewDidLayoutSubviews];
  uint64_t v3 = [(APUIAppPredictionViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) != 1 && !self->_mode)
  {
    double left = self->_parentLayoutInsets.left;
    double v5 = v5 - left;
    double v9 = v9 + left + self->_parentLayoutInsets.right;
  }
  -[APUIAppIconGridView setFrame:](self->_gridView, "setFrame:", v5, v7, v9, v11);
  v15 = __atxlog_handle_ui();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    [(APUIAppIconGridView *)self->_gridView frame];
    v16 = NSStringFromCGRect(v26);
    uint64_t v17 = NSStringFromUIEdgeInsets(self->_parentLayoutInsets);
    *(_DWORD *)buf = 136446722;
    v20 = "-[APUIAppPredictionViewController viewDidLayoutSubviews]";
    __int16 v21 = 2114;
    v22 = v16;
    __int16 v23 = 2114;
    v24 = v17;
    _os_log_impl(&dword_225AE0000, v15, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s _gridView.frame=%{public}@, parentLayoutInsets=%{public}@", buf, 0x20u);
  }
}

- (void)setOccluded:(BOOL)a3
{
  if (self->_occluded != a3)
  {
    self->_occluded = a3;
    -[APUIAppIconGridView setOccluded:](self->_gridView, "setOccluded:");
  }
}

- (void)setLegibilitySettings:(id)a3
{
  double v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(APUIAppIconGridView *)self->_gridView setLegibilitySettings:self->_legibilitySettings];
    double v5 = v6;
  }
}

- (void)setParentLayoutInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_parentLayoutInsets.left
    || a3.top != self->_parentLayoutInsets.top
    || a3.right != self->_parentLayoutInsets.right
    || a3.bottom != self->_parentLayoutInsets.bottom)
  {
    self->_parentLayoutInsets = a3;
    id v6 = [(APUIAppPredictionViewController *)self viewIfLoaded];
    [v6 setNeedsLayout];
  }
}

- (unint64_t)layoutSize
{
  uint64_t v2 = [(APUIWidgetViewController *)self widgetIdentifiable];
  unint64_t v3 = [v2 size];

  return v3;
}

- (void)setLayoutSize:(unint64_t)a3
{
  double v5 = [(APUIWidgetViewController *)self widgetIdentifiable];
  uint64_t v6 = [v5 size];

  if (v6 != a3)
  {
    double v7 = [(APUIWidgetViewController *)self widgetIdentifiable];
    [v7 setSize:a3];

    gridView = self->_gridView;
    [(APUIAppPredictionViewController *)self _loadAppsInGridView:gridView];
  }
}

- (void)setMode:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_mode != a3)
  {
    double v5 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(APUIWidgetViewController *)self identifier];
      int v8 = 134218242;
      unint64_t v9 = a3;
      __int16 v10 = 2112;
      double v11 = v6;
      _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "APUIAppPredictionViewController setting mode: %ld for widget with identifier: %@", (uint8_t *)&v8, 0x16u);
    }
    self->_mode = a3;
    [(APUIAppPredictionViewController *)self _updateEffectiveLargeIconLayoutAnimated:0];
    [(APUIAppIconGridView *)self->_gridView setMode:self->_mode];
    double v7 = [(APUIAppPredictionViewController *)self viewIfLoaded];
    [v7 setNeedsLayout];
  }
}

- (BOOL)supportsLargeIcons
{
  return self->_mode == 0;
}

- (void)setLargeIconsEnabled:(BOOL)a3
{
}

- (void)setLargeIconsEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_largeIconsEnabled != a3)
  {
    self->_largeIconsEnabled = a3;
    [(APUIAppPredictionViewController *)self _updateEffectiveLargeIconLayoutAnimated:a4];
  }
}

- (void)_updateEffectiveLargeIconLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  gridView = self->_gridView;
  if ([(APUIAppPredictionViewController *)self supportsLargeIcons]) {
    BOOL largeIconsEnabled = self->_largeIconsEnabled;
  }
  else {
    BOOL largeIconsEnabled = 0;
  }
  [(APUIAppIconGridView *)gridView setLargeIconsEnabled:largeIconsEnabled animated:v3];
}

- (void)suggestionClientDidRefreshProactiveWidgetLayouts:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__APUIAppPredictionViewController_suggestionClientDidRefreshProactiveWidgetLayouts___block_invoke;
  block[3] = &unk_2647647C0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __84__APUIAppPredictionViewController_suggestionClientDidRefreshProactiveWidgetLayouts___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isViewLoaded];
  if (result)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[128];
    return [v3 _loadAppsInGridView:v4];
  }
  return result;
}

- (id)_fallbackBundleIds
{
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", @"com.apple.mobilephone", @"com.apple.Preferences", @"com.apple.mobiletimer", @"com.apple.camera", @"com.apple.MobileSMS", @"com.apple.AppStore", @"com.apple.mobileslideshow", @"com.apple.mobilesafari", 0);
  return v2;
}

- (void)_loadAppsInGridView:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_userInteracting)
  {
    double v5 = __atxlog_handle_ui();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL userInteracting = self->_userInteracting;
      *(_DWORD *)buf = 136446466;
      v19 = "-[APUIAppPredictionViewController _loadAppsInGridView:]";
      __int16 v20 = 1024;
      LODWORD(v21) = userInteracting;
      _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s aborted: _userInteracting=%{BOOL}d", buf, 0x12u);
    }
LABEL_15:

    goto LABEL_16;
  }
  double v7 = [(APUIWidgetViewController *)self widgetIdentifiable];
  uint64_t v8 = [v7 size];

  if (v8 != 1)
  {
    double v5 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[APUIAppPredictionViewController _loadAppsInGridView:](self, v5);
    }
    goto LABEL_15;
  }
  unint64_t v9 = __atxlog_handle_ui();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)buf = 136446466;
    v19 = "-[APUIAppPredictionViewController _loadAppsInGridView:]";
    __int16 v20 = 2112;
    id v21 = WeakRetained;
    _os_log_impl(&dword_225AE0000, v9, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s _delegate=%@", buf, 0x16u);
  }
  double v11 = __atxlog_handle_ui();
  double v5 = v11;
  if (!v4)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[APUIAppPredictionViewController _loadAppsInGridView:](v5);
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v19 = "-[APUIAppPredictionViewController _loadAppsInGridView:]";
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s starting asynchronous layout request", buf, 0xCu);
  }

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v13 = [(APUIWidgetViewController *)self suggestionClient];
  v14 = [(APUIWidgetViewController *)self widgetIdentifiable];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__APUIAppPredictionViewController__loadAppsInGridView___block_invoke;
  v15[3] = &unk_264764810;
  CFAbsoluteTime v17 = Current;
  v15[4] = self;
  id v16 = v4;
  [v13 layoutForAppPredictionPanel:v14 completionHandler:v15];

LABEL_16:
}

void __55__APUIAppPredictionViewController__loadAppsInGridView___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__APUIAppPredictionViewController__loadAppsInGridView___block_invoke_2;
  v6[3] = &unk_2647647E8;
  uint64_t v9 = a1[6];
  id v4 = (void *)a1[5];
  v6[4] = a1[4];
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __55__APUIAppPredictionViewController__loadAppsInGridView___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = __atxlog_handle_ui();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v3 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    int v5 = 136446466;
    uint64_t v6 = "-[APUIAppPredictionViewController _loadAppsInGridView:]_block_invoke_2";
    __int16 v7 = 2048;
    CFAbsoluteTime v8 = v3;
    _os_log_impl(&dword_225AE0000, v2, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s finished asynchronous layout request: %f seconds", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(a1 + 32) setLayout:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _updateLayoutInGridView:*(void *)(a1 + 48)];
}

- (void)_updateLayoutInGridView:(id)a3
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v76 = objc_opt_new();
  int v5 = (NSMutableDictionary *)objc_opt_new();
  bundleIdSuggestionMap = self->_bundleIdSuggestionMap;
  self->_bundleIdSuggestionMap = v5;

  __int16 v7 = [(APUIWidgetViewController *)self layout];

  if (v7)
  {
    v74 = v4;
    [v4 setShouldDisplayEmptyState:0];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    CFAbsoluteTime v8 = [(APUIWidgetViewController *)self layout];
    uint64_t v9 = [v8 oneByOneSuggestions];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v89 objects:v97 count:16];
    if (!v10) {
      goto LABEL_23;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v90;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v90 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        v15 = [v14 executableSpecification];
        id v16 = [v15 executableObject];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CFAbsoluteTime v17 = v16;
          if (![v17 length]) {
            goto LABEL_21;
          }
          if (([MEMORY[0x263F24FF8] isAppClipWebClipBundleId:v17] & 1) != 0
            || [MEMORY[0x263F24FF8] isInstalledAndNotRestrictedForBundle:v17])
          {
            if (([(NSMutableSet *)self->_installingBundleIds containsObject:v17] & 1) == 0) {
              [v76 addObject:v17];
            }
            [(NSMutableDictionary *)self->_bundleIdSuggestionMap setObject:v14 forKeyedSubscript:v17];
            objc_super v18 = __atxlog_handle_ui();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v96 = v17;
              v19 = v18;
              __int16 v20 = "SuggestionsWidget: app suggestion for: %@";
              goto LABEL_19;
            }
          }
          else
          {
            objc_super v18 = __atxlog_handle_ui();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v96 = v17;
              v19 = v18;
              __int16 v20 = "SuggestionsWidget: %@ is restricted or not installed";
LABEL_19:
              _os_log_impl(&dword_225AE0000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
            }
          }

          goto LABEL_21;
        }
        CFAbsoluteTime v17 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          [(APUIAppPredictionViewController *)&v87 _updateLayoutInGridView:v17];
        }
LABEL_21:
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v89 objects:v97 count:16];
      if (!v11)
      {
LABEL_23:

        id v21 = [(APUIWidgetViewController *)self suggestionClient];
        uint64_t v22 = [(APUIWidgetViewController *)self identifier];
        uint64_t v23 = [v21 pageIndexOfAppPredictionPanelWithIdentifier:v22];

        if (v23 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v24 = __atxlog_handle_ui();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[APUIAppPredictionViewController _updateLayoutInGridView:](self, v24);
          }

          p_usedFallbacks = &self->_usedFallbacks;
          [(NSMutableSet *)self->_usedFallbacks removeAllObjects];
        }
        else
        {
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          p_usedFallbacks = &self->_usedFallbacks;
          __int16 v29 = self->_usedFallbacks;
          uint64_t v30 = [(NSMutableSet *)v29 countByEnumeratingWithState:&v83 objects:v94 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v84;
            do
            {
              for (uint64_t j = 0; j != v31; ++j)
              {
                if (*(void *)v84 != v32) {
                  objc_enumerationMutation(v29);
                }
                v34 = *(void **)(*((void *)&v83 + 1) + 8 * j);
                v35 = [v34 suggestion];

                if (v35)
                {
                  v36 = [(APUIWidgetViewController *)self suggestionClient];
                  v37 = [v34 bundleId];
                  [v36 markFallbackAppSuggestion:v37 asUnusedForPage:v23];
                }
              }
              uint64_t v31 = [(NSMutableSet *)v29 countByEnumeratingWithState:&v83 objects:v94 count:16];
            }
            while (v31);
          }

          [(NSMutableSet *)*p_usedFallbacks removeAllObjects];
          v38 = [(APUIWidgetViewController *)self suggestionClient];
          v39 = [v38 unusedFallbackAppSuggestionsForPage:v23];

          if ((unint64_t)[v76 count] <= 7)
          {
            do
            {
              if (![v39 count]) {
                break;
              }
              v40 = [v39 firstObject];
              v41 = [v40 executableSpecification];
              v42 = [v41 executableObject];

              v43 = __atxlog_handle_ui();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v96 = v42;
                _os_log_debug_impl(&dword_225AE0000, v43, OS_LOG_TYPE_DEBUG, "SuggestionsWidget: using HSSC fallback: %@", buf, 0xCu);
              }

              [v76 addObject:v42];
              [v39 removeObjectAtIndex:0];
              v44 = *p_usedFallbacks;
              v45 = [[APUIAppFallback alloc] initWithProactiveSuggestion:v40];
              [(NSMutableSet *)v44 addObject:v45];

              v46 = [(APUIWidgetViewController *)self suggestionClient];
              [v46 markFallbackAppSuggestion:v42 asUsedForPage:v23];
            }
            while ((unint64_t)[v76 count] < 8);
          }
        }
        v47 = [(APUIAppPredictionViewController *)self _fallbackBundleIds];
        v75 = v47;
        if ((unint64_t)[v76 count] <= 7)
        {
          *(void *)&long long v48 = 138412290;
          long long v73 = v48;
          do
          {
            if (!objc_msgSend(v47, "count", v73)) {
              break;
            }
            v49 = [v47 lastObject];
            v50 = __atxlog_handle_ui();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v73;
              v96 = v49;
              _os_log_debug_impl(&dword_225AE0000, v50, OS_LOG_TYPE_DEBUG, "SuggestionsWidget: using fallback: %@", buf, 0xCu);
            }

            [v47 removeLastObject];
            [v76 addObject:v49];
            v51 = *p_usedFallbacks;
            v52 = [[APUIAppFallback alloc] initWithBundleId:v49];
            [(NSMutableSet *)v51 addObject:v52];

            v47 = v75;
          }
          while ((unint64_t)[v76 count] < 8);
        }
        v53 = [v76 array];
        unint64_t v54 = [v76 count];
        if (v54 >= 8) {
          uint64_t v55 = 8;
        }
        else {
          uint64_t v55 = v54;
        }
        v56 = objc_msgSend(v53, "subarrayWithRange:", 0, v55);
        [v74 setBundleIds:v56];

        v57 = __atxlog_handle_ui();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          v58 = [v74 bundleIds];
          *(_DWORD *)buf = 138412290;
          v96 = v58;
          _os_log_impl(&dword_225AE0000, v57, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: gridView.bundleIds=%@", buf, 0xCu);
        }
        v59 = [(APUIWidgetViewController *)self suggestionIds];
        uint64_t v78 = [v59 mutableCopy];

        v60 = objc_opt_new();
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        v61 = [v74 bundleIds];
        uint64_t v62 = [v61 countByEnumeratingWithState:&v79 objects:v93 count:16];
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v80;
          do
          {
            for (uint64_t k = 0; k != v63; ++k)
            {
              if (*(void *)v80 != v64) {
                objc_enumerationMutation(v61);
              }
              v66 = [(NSMutableDictionary *)self->_bundleIdSuggestionMap objectForKeyedSubscript:*(void *)(*((void *)&v79 + 1) + 8 * k)];
              v67 = v66;
              if (v66)
              {
                v68 = [v66 uuid];
                v69 = [v68 UUIDString];
                [v60 addObject:v69];
              }
            }
            uint64_t v63 = [v61 countByEnumeratingWithState:&v79 objects:v93 count:16];
          }
          while (v63);
        }

        v70 = (void *)[v60 copy];
        [(APUIWidgetViewController *)self setSuggestionIds:v70];

        id v28 = (void *)v78;
        if ([(APUIWidgetViewController *)self effectiveViewVisibility])
        {
          v71 = [(APUIWidgetViewController *)self suggestionIds];
          v72 = [(APUIWidgetViewController *)self suggestionClient];
          [(APUIWidgetViewController *)self logChangeWithNewSuggestionIds:v71 previousSuggestionIds:v78 suggestionClient:v72];
        }
        id v4 = v74;
        v27 = v75;
        goto LABEL_68;
      }
    }
  }
  uint64_t v25 = __atxlog_handle_ui();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[APUIAppPredictionViewController _updateLayoutInGridView:](v25);
  }

  [v4 setShouldDisplayEmptyState:1];
  [v4 setBundleIds:0];
  CGRect v26 = [(APUIWidgetViewController *)self suggestionIds];
  v27 = (void *)[v26 copy];

  [(APUIWidgetViewController *)self setSuggestionIds:0];
  id v28 = [(APUIWidgetViewController *)self suggestionClient];
  [(APUIWidgetViewController *)self logChangeWithNewSuggestionIds:0 previousSuggestionIds:v27 suggestionClient:v28];
LABEL_68:
}

- (BOOL)appIconGridView:(id)a3 launchAppFromIcon:(id)a4
{
  int v5 = objc_msgSend(a4, "applicationBundleID", a3);
  uint64_t v6 = [(NSMutableDictionary *)self->_bundleIdSuggestionMap objectForKeyedSubscript:v5];
  if (v6)
  {
    __int16 v7 = [(APUIWidgetViewController *)self suggestionClient];
    CFAbsoluteTime v8 = [(APUIWidgetViewController *)self widgetIdentifiable];
    uint64_t v9 = [(APUIWidgetViewController *)self layout];
    uint64_t v10 = [v9 uuid];
    uint64_t v11 = [v10 UUIDString];
    [v7 logDidTapSuggestion:v6 widget:v8 blendingCacheId:v11];

    uint64_t v12 = [(APUIWidgetViewController *)self suggestionClient];
    uint64_t v13 = [(APUIWidgetViewController *)self widgetIdentifiable];
    [v12 didFinishExecutingTappedSuggestion:v6 fromWidget:v13];
  }
  return 0;
}

- (BOOL)appIconGridView:(id)a3 shouldDisplayBadgeWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = [v8 appPredictionViewController:self shouldDisplayBadgeWithBundleIdentifier:v5];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)appIconGridView:(id)a3 iconForApplicationWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = [v8 appPredictionViewController:self iconForApplicationWithBundleIdentifier:v5];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)additionalIconListLayoutObserversForAppIconGridView:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    id v8 = [v7 additionalIconListLayoutObserversForAppPredictionViewController:self];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA68];
  }
  return v8;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return [(APUIAppIconGridView *)self->_gridView iconViewForIcon:a3 location:a4];
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  return [(APUIAppIconGridView *)self->_gridView firstIconViewForIcon:a3 inLocations:a4];
}

- (id)firstIconViewForIcon:(id)a3
{
  return [(APUIAppIconGridView *)self->_gridView firstIconViewForIcon:a3];
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  return [(APUIAppIconGridView *)self->_gridView firstIconViewForIcon:a3 excludingLocations:a4];
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  return [(APUIAppIconGridView *)self->_gridView isDisplayingIcon:a3 inLocation:a4];
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  return [(APUIAppIconGridView *)self->_gridView isDisplayingIcon:a3 inLocations:a4];
}

- (BOOL)isDisplayingIcon:(id)a3
{
  return [(APUIAppIconGridView *)self->_gridView isDisplayingIcon:a3];
}

- (BOOL)isDisplayingIconView:(id)a3
{
  return [(APUIAppIconGridView *)self->_gridView isDisplayingIconView:a3];
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  return [(APUIAppIconGridView *)self->_gridView isDisplayingIconView:a3 inLocation:a4];
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  return [a3 isEqualToString:@"SBIconLocationAppPredictions"];
}

- (NSSet)presentedIconLocations
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithObject:@"SBIconLocationAppPredictions"];
}

- (void)setShowingContextMenu:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_showingContextMenu != a3)
  {
    BOOL v3 = a3;
    id v5 = __atxlog_handle_ui();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      id v7 = "-[APUIAppPredictionViewController setShowingContextMenu:]";
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s showingContextMenu=%{BOOL}u", (uint8_t *)&v6, 0x12u);
    }

    self->_showingContextMenu = v3;
    [(APUIAppPredictionViewController *)self _updateUserInteractingState];
    if (v3)
    {
      if ([(APUIAppPredictionViewController *)self _canDismissSelectedSuggestion]) {
        [(APUIAppIconGridView *)self->_gridView highlightIconForBundleId:self->_selectedBundleId];
      }
    }
    else
    {
      [(APUIAppIconGridView *)self->_gridView highlightIconForBundleId:0];
      [(APUIAppPredictionViewController *)self _loadAppsInGridView:self->_gridView];
    }
  }
}

- (void)setShowingAlert:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[APUIAppPredictionViewController setShowingAlert:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s showingAlert=%{BOOL}u", (uint8_t *)&v6, 0x12u);
  }

  if (self->_showingAlert != v3)
  {
    self->_showingAlert = v3;
    [(APUIAppPredictionViewController *)self _updateUserInteractingState];
  }
}

- (void)_updateUserInteractingState
{
  BOOL v2 = self->_showingAlert || self->_showingContextMenu;
  if (self->_userInteracting != v2) {
    -[APUIAppPredictionViewController setUserInteracting:](self, "setUserInteracting:");
  }
}

- (void)setUserInteracting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    __int16 v8 = "-[APUIAppPredictionViewController setUserInteracting:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s userInteracting=%{BOOL}u", (uint8_t *)&v7, 0x12u);
  }

  if (self->_userInteracting != v3)
  {
    self->_BOOL userInteracting = v3;
    int v6 = [(APUIWidgetViewController *)self suggestionClient];
    [v6 setIsUserInteractingWithProactiveWidget:v3];
  }
}

- (void)willShowContextMenuAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v6 = __atxlog_handle_ui();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v21.double x = x;
    v21.double y = y;
    int v7 = NSStringFromCGPoint(v21);
    int v16 = 136446466;
    CFAbsoluteTime v17 = "-[APUIAppPredictionViewController willShowContextMenuAtLocation:]";
    __int16 v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_225AE0000, v6, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s location=%@", (uint8_t *)&v16, 0x16u);
  }
  gridView = self->_gridView;
  __int16 v9 = [(APUIAppPredictionViewController *)self view];
  -[APUIAppIconGridView convertPoint:fromView:](gridView, "convertPoint:fromView:", v9, x, y);
  double v11 = v10;
  double v13 = v12;

  -[APUIAppIconGridView bundleIdAtLocation:](self->_gridView, "bundleIdAtLocation:", v11, v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  selectedBundleId = self->_selectedBundleId;
  self->_selectedBundleId = v14;
}

- (NSArray)applicationShortcutItems
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(APUIAppPredictionViewController *)self _canDismissSelectedSuggestion])
  {
    BOOL v3 = [MEMORY[0x263F24FF8] localizedNameForBundle:self->_selectedBundleId];
    selectedAppLocalizedName = self->_selectedAppLocalizedName;
    self->_selectedAppLocalizedName = v3;

    id v5 = __atxlog_handle_ui();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = self->_selectedAppLocalizedName;
      *(_DWORD *)buf = 136446466;
      double v12 = "-[APUIAppPredictionViewController applicationShortcutItems]";
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s _selectedAppLocalizedName=%@", buf, 0x16u);
    }

    int v7 = +[APUIAppIconGridView createDismissSuggestionApplicationShortcutItemWithType:@"com.apple.AppPredictionUIWidget.application-shortcut-item.never-show-suggestion" localizedName:self->_selectedAppLocalizedName];
    double v10 = v7;
    __int16 v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  }
  else
  {
    int v7 = __atxlog_handle_ui();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      double v12 = "-[APUIAppPredictionViewController applicationShortcutItems]";
      _os_log_impl(&dword_225AE0000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s No additional shortcut items", buf, 0xCu);
    }
    __int16 v8 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v8;
}

- (BOOL)_canDismissSelectedSuggestion
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_selectedBundleId)
  {
    usedFallbacks = self->_usedFallbacks;
    id v4 = [[APUIAppFallback alloc] initWithBundleId:self->_selectedBundleId];
    LODWORD(usedFallbacks) = [(NSMutableSet *)usedFallbacks containsObject:v4];

    if (usedFallbacks)
    {
      id v5 = __atxlog_handle_ui();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136446210;
        int v16 = "-[APUIAppPredictionViewController _canDismissSelectedSuggestion]";
        int v6 = "SuggestionsWidget: %{public}s Cannot dismiss a fallback";
LABEL_7:
        _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v15, 0xCu);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    id v5 = [(NSMutableDictionary *)self->_bundleIdSuggestionMap objectForKeyedSubscript:self->_selectedBundleId];
    int v7 = [v5 executableSpecification];
    uint64_t v8 = [v7 executableType];

    if (v8 == 5)
    {
      __int16 v9 = __atxlog_handle_ui();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        goto LABEL_16;
      }
      selectedBundleId = self->_selectedBundleId;
      int v15 = 136446466;
      int v16 = "-[APUIAppPredictionViewController _canDismissSelectedSuggestion]";
      __int16 v17 = 2112;
      __int16 v18 = selectedBundleId;
      double v11 = "SuggestionsWidget: %{public}s _selectedBundleId %@ is app clip. Cannot dismiss suggestion";
    }
    else
    {
      if (![MEMORY[0x263F24FF8] isAppClipWebClipBundleId:self->_selectedBundleId])
      {
        BOOL v13 = 1;
        goto LABEL_17;
      }
      __int16 v9 = __atxlog_handle_ui();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      double v12 = self->_selectedBundleId;
      int v15 = 136446466;
      int v16 = "-[APUIAppPredictionViewController _canDismissSelectedSuggestion]";
      __int16 v17 = 2112;
      __int16 v18 = v12;
      double v11 = "SuggestionsWidget: %{public}s _selectedBundleId %@ is AppClip. Cannot dismiss suggestion";
    }
    _os_log_impl(&dword_225AE0000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0x16u);
    goto LABEL_15;
  }
  id v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136446210;
    int v16 = "-[APUIAppPredictionViewController _canDismissSelectedSuggestion]";
    int v6 = "SuggestionsWidget: %{public}s _selectedBundleId is nil. Cannot dismiss suggestion";
    goto LABEL_7;
  }
LABEL_16:
  BOOL v13 = 0;
LABEL_17:

  return v13;
}

- (void)didSelectApplicationShortcutItem:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v27 = "-[APUIAppPredictionViewController didSelectApplicationShortcutItem:]";
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s applicationShortcutItem=%@", buf, 0x16u);
  }

  int v6 = [(NSMutableDictionary *)self->_bundleIdSuggestionMap objectForKeyedSubscript:self->_selectedBundleId];
  if (v6)
  {
    int v7 = __atxlog_handle_ui();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v27 = "-[APUIAppPredictionViewController didSelectApplicationShortcutItem:]";
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_225AE0000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s suggestion=%@", buf, 0x16u);
    }

    uint64_t v8 = [v4 type];
    if ([v8 isEqualToString:@"com.apple.AppPredictionUIWidget.application-shortcut-item.never-show-suggestion"])
    {
      __int16 v9 = NSString;
      double v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v11 = [v10 localizedStringForKey:@"Don’t Suggest “%@”" value:&stru_26D930E38 table:0];
      double v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, self->_selectedAppLocalizedName);

      BOOL v13 = NSString;
      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v15 = [v14 localizedStringForKey:@"“%@” will not be suggested on Home Screen. You can change this later in Siri Settings." value:&stru_26D930E38 table:0];
      int v16 = objc_msgSend(v13, "localizedStringWithFormat:", v15, self->_selectedAppLocalizedName);

      __int16 v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      __int16 v18 = [v17 localizedStringForKey:@"Cancel" value:&stru_26D930E38 table:0];

      uint64_t v19 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:v16 preferredStyle:0];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __68__APUIAppPredictionViewController_didSelectApplicationShortcutItem___block_invoke;
      v25[3] = &unk_264764838;
      v25[4] = self;
      uint64_t v20 = [MEMORY[0x263F1C3F0] actionWithTitle:v18 style:1 handler:v25];
      [v19 addAction:v20];

      CGPoint v21 = (void *)MEMORY[0x263F1C3F0];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __68__APUIAppPredictionViewController_didSelectApplicationShortcutItem___block_invoke_2;
      v23[3] = &unk_264764860;
      v23[4] = self;
      id v24 = v6;
      uint64_t v22 = [v21 actionWithTitle:v12 style:2 handler:v23];
      [v19 addAction:v22];

      [(APUIAppPredictionViewController *)self setShowingAlert:1];
      [(APUIAppPredictionViewController *)self presentViewController:v19 animated:1 completion:0];
    }
    else
    {
      double v12 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[APUIAppPredictionViewController didSelectApplicationShortcutItem:]((uint64_t)v8, v12);
      }
    }
  }
  else
  {
    uint64_t v8 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[APUIAppPredictionViewController didSelectApplicationShortcutItem:](v8);
    }
  }
}

uint64_t __68__APUIAppPredictionViewController_didSelectApplicationShortcutItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowingAlert:0];
}

void __68__APUIAppPredictionViewController_didSelectApplicationShortcutItem___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowingAlert:0];
  id v7 = [*(id *)(a1 + 32) suggestionClient];
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) widgetIdentifiable];
  id v4 = [*(id *)(a1 + 32) layout];
  id v5 = [v4 uuid];
  int v6 = [v5 UUIDString];
  [v7 logContextMenuNeverShowAgainForSuggestion:v2 widget:v3 blendingCacheId:v6];
}

- (void)applicationInstallsDidStart:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = +[APUIAppPredictionViewController _bundleIdentifierSetFromApplicationProxies:a3];
  id v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v10 = "-[APUIAppPredictionViewController applicationInstallsDidStart:]";
    __int16 v11 = 2112;
    double v12 = v4;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s bundleIds=%@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__APUIAppPredictionViewController_applicationInstallsDidStart___block_invoke;
  v7[3] = &unk_264764798;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __63__APUIAppPredictionViewController_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1040) unionSet:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _updateGridViewForBundleIds:v3];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = +[APUIAppPredictionViewController _bundleIdentifierSetFromApplicationProxies:a3];
  id v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v10 = "-[APUIAppPredictionViewController applicationsDidInstall:]";
    __int16 v11 = 2112;
    double v12 = v4;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s bundleIds=%@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__APUIAppPredictionViewController_applicationsDidInstall___block_invoke;
  v7[3] = &unk_264764798;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __58__APUIAppPredictionViewController_applicationsDidInstall___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1040) minusSet:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _updateGridViewForBundleIds:v3];
}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = +[APUIAppPredictionViewController _bundleIdentifierSetFromApplicationProxies:a3];
  id v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v10 = "-[APUIAppPredictionViewController applicationInstallsDidUpdateIcon:]";
    __int16 v11 = 2112;
    double v12 = v4;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s bundleIds=%@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__APUIAppPredictionViewController_applicationInstallsDidUpdateIcon___block_invoke;
  v7[3] = &unk_264764798;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __68__APUIAppPredictionViewController_applicationInstallsDidUpdateIcon___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateGridViewForBundleIds:*(void *)(a1 + 40)];
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = +[APUIAppPredictionViewController _bundleIdentifierSetFromApplicationProxies:a3];
  id v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v10 = "-[APUIAppPredictionViewController applicationsDidUninstall:]";
    __int16 v11 = 2112;
    double v12 = v4;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s bundleIds=%@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__APUIAppPredictionViewController_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_264764798;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __60__APUIAppPredictionViewController_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1040) minusSet:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _updateGridViewForBundleIds:v3];
}

- (void)_updateGridViewForBundleIds:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v4);
      }
      double v10 = [(NSMutableDictionary *)self->_bundleIdSuggestionMap objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];

      v7 |= v10 != 0;
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  }
  while (v6);
  if (v7)
  {
    __int16 v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_225AE0000, v11, OS_LOG_TYPE_DEFAULT, "APUIAppPredictionViewController _updateInstallingBundleIdsWithApplicationProxies: %@ ; reloading apps",
        buf,
        0xCu);
    }

    [(APUIAppPredictionViewController *)self _loadAppsInGridView:self->_gridView];
  }
  else
  {
LABEL_12:
    double v12 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_225AE0000, v12, OS_LOG_TYPE_DEFAULT, "APUIAppPredictionViewController _updateInstallingBundleIdsWithApplicationProxies: %@ ; not reloading apps",
        buf,
        0xCu);
    }
  }
}

+ (id)_bundleIdentifierSetFromApplicationRecords:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "bundleIdentifier", (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  __int16 v11 = (void *)[v4 copy];
  return v11;
}

+ (id)_bundleIdentifierSetFromApplicationProxies:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFFA08];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global);

  uint64_t v7 = (void *)[v5 initWithArray:v6];
  return v7;
}

uint64_t __78__APUIAppPredictionViewController__bundleIdentifierSetFromApplicationProxies___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (BOOL)isShowingContextMenu
{
  return self->_showingContextMenu;
}

- (UIEdgeInsets)parentLayoutInsets
{
  double top = self->_parentLayoutInsets.top;
  double left = self->_parentLayoutInsets.left;
  double bottom = self->_parentLayoutInsets.bottom;
  double right = self->_parentLayoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)isOccluded
{
  return self->_occluded;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)isUserInteracting
{
  return self->_userInteracting;
}

- (BOOL)isLargeIconsEnabled
{
  return self->_largeIconsEnabled;
}

- (APUIAppPredictionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APUIAppPredictionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isShowingAlert
{
  return self->_showingAlert;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_usedFallbacks, 0);
  objc_storeStrong((id *)&self->_selectedAppLocalizedName, 0);
  objc_storeStrong((id *)&self->_selectedBundleId, 0);
  objc_storeStrong((id *)&self->_installingBundleIds, 0);
  objc_storeStrong((id *)&self->_bundleIdSuggestionMap, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
}

- (void)_loadAppsInGridView:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  uint64_t v2 = "-[APUIAppPredictionViewController _loadAppsInGridView:]";
  _os_log_fault_impl(&dword_225AE0000, log, OS_LOG_TYPE_FAULT, "SuggestionsWidget: %{public}s gridView=nil", (uint8_t *)&v1, 0xCu);
}

- (void)_loadAppsInGridView:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 widgetIdentifiable];
  int v4 = 134217984;
  uint64_t v5 = [v3 size];
  _os_log_fault_impl(&dword_225AE0000, a2, OS_LOG_TYPE_FAULT, "Trying to load apps for unsupported app panel size: %ld", (uint8_t *)&v4, 0xCu);
}

- (void)_updateLayoutInGridView:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_225AE0000, log, OS_LOG_TYPE_ERROR, "SuggestionsWidget: no layout, falling back to label", v1, 2u);
}

- (void)_updateLayoutInGridView:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_225AE0000, a2, OS_LOG_TYPE_ERROR, "SuggestionsWidget: could not find page index for app prediction widget with identifier: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)_updateLayoutInGridView:(os_log_t)log .cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_225AE0000, log, OS_LOG_TYPE_FAULT, "App suggestion executable is not a string as expected", buf, 2u);
}

- (void)didSelectApplicationShortcutItem:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_225AE0000, log, OS_LOG_TYPE_ERROR, "No selected suggestion found ", v1, 2u);
}

- (void)didSelectApplicationShortcutItem:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225AE0000, a2, OS_LOG_TYPE_FAULT, "didSelectApplicationShortcutItem: %@ is not valid for App Prediction Panel", (uint8_t *)&v2, 0xCu);
}

@end