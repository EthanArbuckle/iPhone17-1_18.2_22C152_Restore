@interface APUIAppIconGridView
+ (id)createDismissSuggestionApplicationShortcutItemWithType:(id)a3 localizedName:(id)a4;
- (APUIAppIconGridView)initWithDelegate:(id)a3;
- (BOOL)appIconDataSource:(id)a3 launchAppFromIcon:(id)a4;
- (BOOL)iconShouldAllowTap:(id)a3;
- (BOOL)iconViewCanBeginDrags:(id)a3;
- (BOOL)iconViewDisplaysAccessories:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isIconViewRecycled:(id)a3;
- (BOOL)isLargeIconsEnabled;
- (BOOL)isOccluded;
- (BOOL)shouldDisplayEmptyState;
- (NSArray)bundleIds;
- (_UILegibilitySettings)legibilitySettings;
- (double)_iconLabelAlphaForMode:(unint64_t)a3;
- (id)_emptyStateLabel;
- (id)bundleIdAtLocation:(CGPoint)a3;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (unint64_t)mode;
- (void)_addGridView;
- (void)_configureAliasingForIconView:(id)a3;
- (void)_significantTimeChange:(id)a3;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)highlightIconForBundleId:(id)a3;
- (void)iconListView:(id)a3 didAddIconView:(id)a4;
- (void)iconTapped:(id)a3;
- (void)layoutSubviews;
- (void)recycleIconView:(id)a3;
- (void)setBundleIds:(id)a3;
- (void)setLargeIconsEnabled:(BOOL)a3;
- (void)setLargeIconsEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setLegibilitySettings:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setOccluded:(BOOL)a3;
- (void)setShouldDisplayEmptyState:(BOOL)a3;
@end

@implementation APUIAppIconGridView

- (APUIAppIconGridView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)APUIAppIconGridView;
  v5 = [(APUIAppIconGridView *)&v12 init];
  if (v5)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v6 = (void *)getSBIconListModelClass_softClass;
    uint64_t v17 = getSBIconListModelClass_softClass;
    if (!getSBIconListModelClass_softClass)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __getSBIconListModelClass_block_invoke;
      v13[3] = &unk_264764990;
      v13[4] = &v14;
      __getSBIconListModelClass_block_invoke((uint64_t)v13);
      v6 = (void *)v15[3];
    }
    v7 = v6;
    _Block_object_dispose(&v14, 8);
    uint64_t v8 = [[v7 alloc] initWithFolder:0 maxIconCount:8];
    model = v5->_model;
    v5->_model = (SBIconListModel *)v8;

    objc_storeWeak((id *)&v5->_delegate, v4);
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v5 selector:sel__significantTimeChange_ name:*MEMORY[0x263F1D0A0] object:0];
    [(APUIAppIconGridView *)v5 _addGridView];
  }
  return v5;
}

- (void)_significantTimeChange:(id)a3
{
  p_gridView = &self->_gridView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
  [WeakRetained removeAllIconViews];

  id v5 = objc_loadWeakRetained((id *)p_gridView);
  [v5 layoutIconsNow];
}

- (id)_emptyStateLabel
{
  emptyStateLabel = self->_emptyStateLabel;
  if (!emptyStateLabel)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    id v5 = self->_emptyStateLabel;
    self->_emptyStateLabel = v4;

    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"No Suggestions Available" value:&stru_26D930E38 table:0];
    [(UILabel *)self->_emptyStateLabel setText:v7];

    uint64_t v8 = [MEMORY[0x263F1C550] labelColor];
    [(UILabel *)self->_emptyStateLabel setTextColor:v8];

    [(UILabel *)self->_emptyStateLabel setNumberOfLines:0];
    [(UILabel *)self->_emptyStateLabel setTextAlignment:1];
    emptyStateLabel = self->_emptyStateLabel;
  }
  v9 = emptyStateLabel;
  return v9;
}

- (void)setShouldDisplayEmptyState:(BOOL)a3
{
  if (self->_shouldDisplayEmptyState != a3)
  {
    self->_shouldDisplayEmptyState = a3;
    if (a3)
    {
      id v4 = [(APUIAppIconGridView *)self _emptyStateLabel];
      [(APUIAppIconGridView *)self addSubview:v4];
    }
    else
    {
      [(UILabel *)self->_emptyStateLabel removeFromSuperview];
    }
    [(APUIAppIconGridView *)self setNeedsLayout];
  }
}

- (void)setLargeIconsEnabled:(BOOL)a3
{
}

- (void)setLargeIconsEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_largeIconsEnabled != a3)
  {
    BOOL v4 = a4;
    self->_largeIconsEnabled = a3;
    v6 = [[APUIAppIconGridLayoutProvider alloc] initWithLargeIconsEnabled:[(APUIAppIconGridView *)self isLargeIconsEnabled]];
    layoutProvider = self->_layoutProvider;
    self->_layoutProvider = v6;

    [(APUIAppIconGridLayoutProvider *)self->_layoutProvider setMode:self->_mode];
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
      [WeakRetained setLayoutProvider:self->_layoutProvider animated:1];
    }
    else
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __53__APUIAppIconGridView_setLargeIconsEnabled_animated___block_invoke;
      v9[3] = &unk_2647647C0;
      v9[4] = self;
      [MEMORY[0x263F1CB60] performWithoutAnimation:v9];
    }
  }
}

void __53__APUIAppIconGridView_setLargeIconsEnabled_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 416));
  [WeakRetained setLayoutProvider:*(void *)(*(void *)(a1 + 32) + 456) animated:0];

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 416));
  [v3 layoutIconsNow];
}

- (void)_addGridView
{
  p_gridView = &self->_gridView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);

  if (!WeakRetained)
  {
    id v5 = [[APUIAppIconGridLayoutProvider alloc] initWithLargeIconsEnabled:[(APUIAppIconGridView *)self isLargeIconsEnabled]];
    layoutProvider = self->_layoutProvider;
    self->_layoutProvider = v5;

    [(APUIAppIconGridLayoutProvider *)self->_layoutProvider setMode:self->_mode];
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    v7 = (void *)getSBIconListViewClass_softClass;
    uint64_t v22 = getSBIconListViewClass_softClass;
    if (!getSBIconListViewClass_softClass)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __getSBIconListViewClass_block_invoke;
      v18[3] = &unk_264764990;
      v18[4] = &v19;
      __getSBIconListViewClass_block_invoke((uint64_t)v18);
      v7 = (void *)v20[3];
    }
    uint64_t v8 = v7;
    _Block_object_dispose(&v19, 8);
    v9 = (void *)[[v8 alloc] initWithModel:self->_model layoutProvider:self->_layoutProvider iconLocation:@"SBIconLocationAppPredictions" orientation:1 iconViewProvider:self];
    [v9 setIconViewConfigurationOptions:16];
    [v9 setContentVisibility:self->_occluded];
    [v9 setLegibilitySettings:self->_legibilitySettings];
    [(APUIAppIconGridView *)self _iconLabelAlphaForMode:self->_mode];
    objc_msgSend(v9, "setIconsLabelAlpha:");
    [v9 addLayoutObserver:self];
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = [v10 additionalIconListLayoutObserversForAppIconGridView:self];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __35__APUIAppIconGridView__addGridView__block_invoke;
    uint64_t v16 = &unk_2647648F8;
    id v17 = v9;
    id v12 = v9;
    [v11 enumerateObjectsUsingBlock:&v13];
    -[APUIAppIconGridView addSubview:](self, "addSubview:", v12, v13, v14, v15, v16);
    objc_storeWeak((id *)p_gridView, v12);
  }
}

uint64_t __35__APUIAppIconGridView__addGridView__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addLayoutObserver:a2];
}

- (id)bundleIdAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = -[APUIAppIconGridView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  v6 = [v5 apuiFindInnermostSuperviewOfClass:getSBIconViewClass()];
  v7 = [v6 icon];
  uint64_t v8 = [v7 applicationBundleID];

  v9 = __atxlog_handle_ui();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v20.CGFloat x = x;
    v20.CGFloat y = y;
    id v10 = NSStringFromCGPoint(v20);
    int v12 = 136446722;
    uint64_t v13 = "-[APUIAppIconGridView bundleIdAtLocation:]";
    __int16 v14 = 2112;
    v15 = v10;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_225AE0000, v9, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@ bundleID=%@", (uint8_t *)&v12, 0x20u);
  }
  return v8;
}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  return 0;
}

- (BOOL)iconShouldAllowTap:(id)a3
{
  return 1;
}

- (void)iconTapped:(id)a3
{
  id v4 = a3;
  id v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "AppIconGridView: iconTapped", buf, 2u);
  }

  v6 = [v4 icon];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v8 = [WeakRetained appIconGridView:self launchAppFromIcon:v6];

  if (v8)
  {
    v9 = __atxlog_handle_ui();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_225AE0000, v9, OS_LOG_TYPE_DEFAULT, "AppIconGridView: iconTapped but delegate handled launch", v10, 2u);
    }
  }
  else
  {
    v9 = [v6 applicationBundleID];
    +[APUIAppIconDataSource openApplication:v9 completion:0];
  }
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  reusableIconViewMap = self->_reusableIconViewMap;
  if (!reusableIconViewMap)
  {
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x2050000000;
    id v5 = (void *)getSBHReusableViewMapClass_softClass;
    uint64_t v14 = getSBHReusableViewMapClass_softClass;
    if (!getSBHReusableViewMapClass_softClass)
    {
      SpringBoardHomeLibraryCore();
      v12[3] = (uint64_t)objc_getClass("SBHReusableViewMap");
      getSBHReusableViewMapClass_softClass = v12[3];
      id v5 = (void *)v12[3];
    }
    v6 = v5;
    _Block_object_dispose(&v11, 8);
    v7 = (SBHReusableViewMap *)objc_alloc_init(v6);
    int v8 = self->_reusableIconViewMap;
    self->_reusableIconViewMap = v7;

    reusableIconViewMap = self->_reusableIconViewMap;
  }
  v9 = [(SBHReusableViewMap *)reusableIconViewMap dequeueReusableViewOfClass:getSBIconViewClass()];
  return v9;
}

- (void)recycleIconView:(id)a3
{
}

- (BOOL)isIconViewRecycled:(id)a3
{
  return [(SBHReusableViewMap *)self->_reusableIconViewMap isViewRecycled:a3];
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  int v8 = __atxlog_handle_ui();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    id v10 = "-[APUIAppIconGridView configureIconView:forIcon:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_225AE0000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s icon=%@", (uint8_t *)&v9, 0x16u);
  }

  [v7 setDelegate:self];
  [v7 setIcon:v6];
  [v7 setLabelAccessoryHidden:self->_mode == 1];
  [(APUIAppIconGridView *)self _configureAliasingForIconView:v7];
}

- (void)_configureAliasingForIconView:(id)a3
{
  id v4 = a3;
  unint64_t mode = self->_mode;
  if (mode == 1)
  {
    id v13 = v4;
    int v8 = [v4 layer];
    [v8 setAllowsEdgeAntialiasing:1];

    int v9 = [v13 layer];
    [v9 setShouldRasterize:1];

    id v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 scale];
    double v11 = v10;
    id v12 = [v13 layer];
    [v12 setRasterizationScale:v11];
  }
  else
  {
    if (mode) {
      goto LABEL_6;
    }
    id v13 = v4;
    id v6 = [v4 layer];
    [v6 setAllowsEdgeAntialiasing:0];

    id v7 = [v13 layer];
    [v7 setShouldRasterize:0];
  }

  id v4 = v13;
LABEL_6:
}

- (BOOL)iconViewDisplaysAccessories:(id)a3
{
  id v4 = [a3 icon];
  id v5 = [v4 applicationBundleID];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = [WeakRetained appIconGridView:self shouldDisplayBadgeWithBundleIdentifier:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setOccluded:(BOOL)a3
{
  if (self->_occluded != a3)
  {
    self->_occluded = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
    [WeakRetained setContentVisibility:self->_occluded];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    int v8 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    legibilitySettings = self->_legibilitySettings;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
    [WeakRetained setLegibilitySettings:legibilitySettings];

    id v5 = v8;
  }
}

- (BOOL)appIconDataSource:(id)a3 launchAppFromIcon:(id)a4
{
  id v4 = self;
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v4) = [WeakRetained appIconGridView:v4 launchAppFromIcon:v6];

  return (char)v4;
}

- (void)setBundleIds:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = (NSArray *)a3;
  bundleIds = self->_bundleIds;
  if (bundleIds != v4 && ![(NSArray *)bundleIds isEqualToArray:v4])
  {
    if (!self->_dataSource)
    {
      id v6 = objc_alloc_init(APUIAppIconDataSource);
      dataSource = self->_dataSource;
      self->_dataSource = v6;

      [(APUIAppIconDataSource *)self->_dataSource setDelegate:self];
    }
    v27 = v4;
    int v8 = (NSArray *)[(NSArray *)v4 copy];
    int v9 = self->_bundleIds;
    self->_bundleIds = v8;

    [(SBIconListModel *)self->_model removeAllIcons];
    double v10 = __atxlog_handle_ui();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "-[APUIAppIconGridView setBundleIds:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = WeakRetained;
      _os_log_impl(&dword_225AE0000, v10, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s _delegate=%@", buf, 0x16u);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v12 = v27;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v29;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v12);
          }
          __int16 v16 = *(void **)(*((void *)&v28 + 1) + 8 * v15);
          id v17 = objc_loadWeakRetained((id *)&self->_delegate);
          uint64_t v18 = [v17 appIconGridView:self iconForApplicationWithBundleIdentifier:v16];

          if (v18)
          {
            uint64_t v19 = __atxlog_handle_ui();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v16;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v18;
              _os_log_impl(&dword_225AE0000, v19, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: iconForApplicationWithBundleIdentifier:%@ = %@", buf, 0x16u);
            }

            [(SBIconListModel *)self->_model addIcon:v18];
          }
          else
          {
            if ([v16 isEqualToString:@"com.apple.mobiletimer"])
            {
              uint64_t v32 = 0;
              v33 = &v32;
              uint64_t v34 = 0x2050000000;
              CGPoint v20 = (void *)getSBHClockApplicationIconClass_softClass;
              uint64_t v35 = getSBHClockApplicationIconClass_softClass;
              if (!getSBHClockApplicationIconClass_softClass)
              {
                *(void *)buf = MEMORY[0x263EF8330];
                *(void *)&buf[8] = 3221225472;
                *(void *)&uint8_t buf[16] = __getSBHClockApplicationIconClass_block_invoke;
                v38 = &unk_264764990;
                v39 = &v32;
                __getSBHClockApplicationIconClass_block_invoke((uint64_t)buf);
                CGPoint v20 = (void *)v33[3];
              }
              uint64_t v21 = v20;
              _Block_object_dispose(&v32, 8);
              uint64_t v22 = [[v21 alloc] initWithLeafIdentifier:@"com.apple.mobiletimer" applicationBundleID:@"com.apple.mobiletimer"];
              if (v22) {
                goto LABEL_23;
              }
            }
            uint64_t v32 = 0;
            v33 = &v32;
            uint64_t v34 = 0x2050000000;
            v23 = (void *)getSBLeafIconClass_softClass;
            uint64_t v35 = getSBLeafIconClass_softClass;
            if (!getSBLeafIconClass_softClass)
            {
              *(void *)buf = MEMORY[0x263EF8330];
              *(void *)&buf[8] = 3221225472;
              *(void *)&uint8_t buf[16] = __getSBLeafIconClass_block_invoke;
              v38 = &unk_264764990;
              v39 = &v32;
              __getSBLeafIconClass_block_invoke((uint64_t)buf);
              v23 = (void *)v33[3];
            }
            v24 = v23;
            _Block_object_dispose(&v32, 8);
            uint64_t v22 = [[v24 alloc] initWithLeafIdentifier:v16 applicationBundleID:v16];
            if (v22)
            {
LABEL_23:
              [v22 addIconDataSource:self->_dataSource];
              v25 = __atxlog_handle_ui();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v16;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v22;
                _os_log_impl(&dword_225AE0000, v25, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: leafIcon initWithLeafIdentifier:%@ = %@", buf, 0x16u);
              }

              [(SBIconListModel *)self->_model addIcon:v22];
            }
            else
            {
              uint64_t v22 = __atxlog_handle_ui();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v16;
                _os_log_fault_impl(&dword_225AE0000, v22, OS_LOG_TYPE_FAULT, "Could not create leaf icon for: %@", buf, 0xCu);
              }
            }
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v13);
    }

    id v26 = objc_loadWeakRetained((id *)&self->_gridView);
    [v26 setIconsNeedLayout];

    id v4 = v27;
  }
}

- (void)setMode:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v13 = "-[APUIAppIconGridView setMode:]";
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s %lu", buf, 0x16u);
  }

  if (self->_mode != a3)
  {
    self->_unint64_t mode = a3;
    [(APUIAppIconGridLayoutProvider *)self->_layoutProvider setMode:a3];
    p_gridView = &self->_gridView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
    [(APUIAppIconGridView *)self _iconLabelAlphaForMode:a3];
    objc_msgSend(WeakRetained, "setIconsLabelAlpha:");

    id v8 = objc_loadWeakRetained((id *)&self->_gridView);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __31__APUIAppIconGridView_setMode___block_invoke;
    v11[3] = &unk_264764920;
    v11[4] = self;
    [v8 enumerateIconViewsUsingBlock:v11];

    id v9 = objc_loadWeakRetained((id *)&self->_gridView);
    [v9 setIconsNeedLayout];

    id v10 = objc_loadWeakRetained((id *)p_gridView);
    [v10 layoutIconsIfNeeded];
  }
}

uint64_t __31__APUIAppIconGridView_setMode___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _configureAliasingForIconView:a2];
}

- (double)_iconLabelAlphaForMode:(unint64_t)a3
{
  double result = 0.0;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (void)layoutSubviews
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)APUIAppIconGridView;
  [(APUIAppIconGridView *)&v22 layoutSubviews];
  [(APUIAppIconGridView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  p_gridView = &self->_gridView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
  objc_msgSend(WeakRetained, "setFrame:", v4, v6, v8, v10);

  [(UILabel *)self->_emptyStateLabel sizeToFit];
  [(APUIAppIconGridView *)self bounds];
  double v14 = v13;
  [(UILabel *)self->_emptyStateLabel bounds];
  double v16 = floor((v14 - v15) * 0.5);
  [(APUIAppIconGridView *)self bounds];
  double v18 = v17;
  [(UILabel *)self->_emptyStateLabel bounds];
  -[UILabel setFrame:](self->_emptyStateLabel, "setFrame:", 0.0, v16, v18);
  uint64_t v19 = __atxlog_handle_ui();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = objc_loadWeakRetained((id *)p_gridView);
    [v20 frame];
    uint64_t v21 = NSStringFromCGRect(v28);
    *(_DWORD *)buf = 136446466;
    v24 = "-[APUIAppIconGridView layoutSubviews]";
    __int16 v25 = 2112;
    id v26 = v21;
    _os_log_impl(&dword_225AE0000, v19, OS_LOG_TYPE_INFO, "SuggestionsWidget: %{public}s _gridView.frame=%@", buf, 0x16u);
  }
}

+ (id)createDismissSuggestionApplicationShortcutItemWithType:(id)a3 localizedName:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = objc_opt_new();
  if ([v5 isEqualToString:@"com.apple.AppPredictionUIWidget.application-shortcut-item.never-show-suggestion"])
  {
    double v8 = (void *)[objc_alloc(MEMORY[0x263F79350]) initWithSystemImageName:@"hand.raised"];
    [v7 setIcon:v8];

    double v9 = NSString;
    double v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v11 = [v10 localizedStringForKey:@"Don’t Suggest “%@”" value:&stru_26D930E38 table:0];
    objc_msgSend(v9, "localizedStringWithFormat:", v11, v6);
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"com.apple.AppPredictionUIWidget.application-shortcut-item.dismiss-suggestion"])
  {
    double v13 = (void *)[objc_alloc(MEMORY[0x263F79350]) initWithSystemImageName:@"hand.thumbsdown"];
    [v7 setIcon:v13];

    double v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v10 = v14;
    double v15 = @"Suggest Shortcut Less";
LABEL_7:
    id v12 = [v14 localizedStringForKey:v15 value:&stru_26D930E38 table:0];
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"com.apple.AppPredictionUIWidget.application-shortcut-item.save-suggestion"])
  {
    double v16 = (void *)[objc_alloc(MEMORY[0x263F79350]) initWithSystemImageName:@"plus.circle"];
    [v7 setIcon:v16];

    double v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v10 = v14;
    double v15 = @"Add Shortcut to Siri";
    goto LABEL_7;
  }
  id v12 = &stru_26D930E38;
LABEL_9:
  [v7 setLocalizedTitle:v12];
  [v7 setType:v5];
  double v17 = __atxlog_handle_ui();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v20 = "+[APUIAppIconGridView createDismissSuggestionApplicationShortcutItemWithType:localizedName:]";
    __int16 v21 = 2112;
    objc_super v22 = v12;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_225AE0000, v17, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s localizedItemTitle=%@ itemType=%@", buf, 0x20u);
  }

  return v7;
}

- (void)highlightIconForBundleId:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v11 = "-[APUIAppIconGridView highlightIconForBundleId:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s bundleId=%@", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
  double v7 = WeakRetained;
  if (v4)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__APUIAppIconGridView_highlightIconForBundleId___block_invoke;
    v8[3] = &unk_264764920;
    id v9 = v4;
    [v7 enumerateIconViewsUsingBlock:v8];

    double v7 = v9;
  }
  else
  {
    [WeakRetained enumerateIconViewsUsingBlock:&__block_literal_global_0];
  }
}

void __48__APUIAppIconGridView_highlightIconForBundleId___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  double v3 = [v6 icon];
  id v4 = [v3 applicationBundleID];
  LODWORD(a1) = [v4 isEqualToString:*(void *)(a1 + 32)];

  double v5 = 0.5;
  if (a1) {
    double v5 = 1.0;
  }
  [v6 setAlpha:v5];
}

uint64_t __48__APUIAppIconGridView_highlightIconForBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAlpha:1.0];
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  unint64_t mode = self->_mode;
  id v6 = a4;
  [(APUIAppIconGridView *)self _iconLabelAlphaForMode:mode];
  objc_msgSend(v6, "setIconLabelAlpha:");
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"SBIconLocationAppPredictions"])
  {
    double v7 = [(APUIAppIconGridView *)self firstIconViewForIcon:v6];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  if ([a4 containsObject:@"SBIconLocationAppPredictions"])
  {
    double v7 = [(APUIAppIconGridView *)self firstIconViewForIcon:v6];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)firstIconViewForIcon:(id)a3
{
  p_gridView = &self->_gridView;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_gridView);
  id v6 = [WeakRetained iconViewForIcon:v4];

  return v6;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6 = a3;
  if ([a4 containsObject:@"SBIconLocationAppPredictions"])
  {
    double v7 = 0;
  }
  else
  {
    double v7 = [(APUIAppIconGridView *)self firstIconViewForIcon:v6];
  }

  return v7;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"SBIconLocationAppPredictions"]) {
    BOOL v7 = [(APUIAppIconGridView *)self isDisplayingIcon:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  if ([a4 containsObject:@"SBIconLocationAppPredictions"]) {
    BOOL v7 = [(APUIAppIconGridView *)self isDisplayingIcon:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  p_gridView = &self->_gridView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_gridView);
  BOOL v7 = [WeakRetained iconViewForIcon:v5];

  if (v7) {
    BOOL v8 = [(APUIAppIconGridView *)self isDisplayingIconView:v7];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  p_gridView = &self->_gridView;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_gridView);
  char v6 = [WeakRetained isDisplayingIconView:v4];

  return v6;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"SBIconLocationAppPredictions"]) {
    BOOL v7 = [(APUIAppIconGridView *)self isDisplayingIconView:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  BOOL v7 = (void (**)(id, void *))a4;
  id v6 = [(APUIAppIconGridView *)self firstIconViewForIcon:a3];
  if (v6) {
    v7[2](v7, v6);
  }
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__APUIAppIconGridView_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_264764968;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained enumerateIconViewsUsingBlock:v7];
}

uint64_t __61__APUIAppIconGridView_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (BOOL)shouldDisplayEmptyState
{
  return self->_shouldDisplayEmptyState;
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

- (BOOL)isLargeIconsEnabled
{
  return self->_largeIconsEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_layoutProvider, 0);
  objc_storeStrong((id *)&self->_reusableIconViewMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_emptyStateLabel, 0);
  objc_destroyWeak((id *)&self->_gridView);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end