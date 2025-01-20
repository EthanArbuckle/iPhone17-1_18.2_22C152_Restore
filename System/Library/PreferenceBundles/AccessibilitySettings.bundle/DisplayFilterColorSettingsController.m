@interface DisplayFilterColorSettingsController
- (BOOL)ax_handlesOwnScrollingInSetup;
- (BOOL)displayingFilterSelection;
- (DisplayFilterSettingsPreviewPageViewController)previewPageController;
- (NSArray)currentFilterSelectionSpecifiers;
- (NSArray)currentOptionSpecifiers;
- (NSMutableArray)filterSelectionSpecifiers;
- (NSMutableDictionary)filterTypeToOptionSpecifiers;
- (PSSpecifier)specifierBeforeFilterOptions;
- (PSSpecifier)specifierBeforeSelectionTable;
- (UIPageControl)pageControl;
- (double)_headerHeight;
- (id)_optionSpecifiersForType:(unint64_t)a3;
- (id)accessibilityPreferenceForSpecifier:(id)a3;
- (id)blueCorrectionIntensity:(id)a3;
- (id)grayscaleCorrectionIntensity:(id)a3;
- (id)greenCorrectionIntensity:(id)a3;
- (id)redCorrectionIntensity:(id)a3;
- (id)singleColorFilterHue:(id)a3;
- (id)singleColorFilterIntensity:(id)a3;
- (id)specifiers;
- (id)specifiersFromFile;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)displayingOptionsForType;
- (unint64_t)filterCategory;
- (unint64_t)filterForCellIdentifier:(id)a3;
- (void)_addFilterSpecifier:(id)a3;
- (void)_addOptionSpecifier:(id)a3 forType:(unint64_t)a4;
- (void)_setupPreviewRegion;
- (void)_updateFilterOptionSpecifiers;
- (void)_updateFilterSelectionSpecifiers;
- (void)_updateOptionVisibility;
- (void)accessibilitySetPreference:(id)a3 specifier:(id)a4;
- (void)accessibilitySettingsDidChange;
- (void)changePage:(id)a3;
- (void)didSelectDisplayFilterPage:(int64_t)a3;
- (void)reloadSpecifiers;
- (void)setBlueCorrectionIntensity:(id)a3 specifier:(id)a4;
- (void)setCurrentFilterSelectionSpecifiers:(id)a3;
- (void)setCurrentOptionSpecifiers:(id)a3;
- (void)setDisplayingFilterSelection:(BOOL)a3;
- (void)setDisplayingOptionsForType:(unint64_t)a3;
- (void)setFilterSelectionSpecifiers:(id)a3;
- (void)setFilterTypeToOptionSpecifiers:(id)a3;
- (void)setGlobalFilterEnabled:(BOOL)a3;
- (void)setGrayscaleCorrectionIntensity:(id)a3 specifier:(id)a4;
- (void)setGreenCorrectionIntensity:(id)a3 specifier:(id)a4;
- (void)setPageControl:(id)a3;
- (void)setPreviewPageController:(id)a3;
- (void)setRedCorrectionIntensity:(id)a3 specifier:(id)a4;
- (void)setSingleColorFilterHue:(id)a3 specifier:(id)a4;
- (void)setSingleColorFilterIntensity:(id)a3 specifier:(id)a4;
- (void)setSpecifierBeforeFilterOptions:(id)a3;
- (void)setSpecifierBeforeSelectionTable:(id)a3;
- (void)updateSystemFilter;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DisplayFilterColorSettingsController

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)DisplayFilterColorSettingsController;
  v4 = [(DisplayFilterColorSettingsController *)&v15 tableView:a3 cellForRowAtIndexPath:a4];
  v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    v6 = [v4 specifier];
    v7 = [v6 properties];
    v8 = [v7 objectForKey:PSTitleKey];

    id v9 = v8;
    v10 = [v9 stringByAppendingString:@".subtitle"];
    v11 = settingsLocString(v9, @"DisplayFilterColorSettings");

    v12 = settingsLocString(v10, @"DisplayFilterColorSettings");
    [v4 setTitle:v11];
    if ([v12 length]) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    [v4 setSubtitle:v13];
  }

  return v4;
}

- (double)_headerHeight
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    double v7 = v4;
  }
  else {
    double v7 = v6;
  }
  double v8 = 264.0;
  if (v7 < 1350.0) {
    double v8 = 200.0;
  }
  BOOL v9 = v7 < 590.0;
  double result = 175.0;
  if (!v9) {
    return v8;
  }
  return result;
}

- (id)specifiersFromFile
{
  return [(DisplayFilterColorSettingsController *)self loadSpecifiersFromPlistName:@"DisplayFilterColorSettings" target:self];
}

- (id)specifiers
{
  double v3 = *(void **)&self->super.AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_34;
  }
  uint64_t v26 = OBJC_IVAR___PSListController__specifiers;
  [(DisplayFilterColorSettingsController *)self setFilterTypeToOptionSpecifiers:0];
  [(DisplayFilterColorSettingsController *)self setFilterSelectionSpecifiers:0];
  [(DisplayFilterColorSettingsController *)self setCurrentFilterSelectionSpecifiers:0];
  [(DisplayFilterColorSettingsController *)self setCurrentOptionSpecifiers:0];
  [(DisplayFilterColorSettingsController *)self setDisplayingFilterSelection:0];
  [(DisplayFilterColorSettingsController *)self setDisplayingOptionsForType:0];
  [(DisplayFilterColorSettingsController *)self setSpecifierBeforeSelectionTable:0];
  double v4 = [(DisplayFilterColorSettingsController *)self specifiersFromFile];
  v27 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v6) {
    goto LABEL_29;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v29;
  uint64_t v9 = PSKeyNameKey;
  do
  {
    v10 = 0;
    do
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v10);
      v12 = [v11 properties];
      v13 = [v12 objectForKey:v9];

      if (![v13 length]) {
        goto LABEL_13;
      }
      if (![v13 rangeOfString:@"OPTION_BLUE_ADJUST"])
      {
        v14 = self;
        objc_super v15 = v11;
        uint64_t v16 = 8;
LABEL_24:
        [(DisplayFilterColorSettingsController *)v14 _addOptionSpecifier:v15 forType:v16];
        goto LABEL_25;
      }
      if (![v13 rangeOfString:@"OPTION_RED_ADJUST"])
      {
        v14 = self;
        objc_super v15 = v11;
        uint64_t v16 = 2;
        goto LABEL_24;
      }
      if (![v13 rangeOfString:@"OPTION_GREEN_ADJUST"])
      {
        v14 = self;
        objc_super v15 = v11;
        uint64_t v16 = 4;
        goto LABEL_24;
      }
      if (![v13 rangeOfString:@"OPTION_SINGLE_COLOR"])
      {
        v14 = self;
        objc_super v15 = v11;
        uint64_t v16 = 16;
        goto LABEL_24;
      }
      if (![v13 rangeOfString:@"OPTION_GRAYSCALE"])
      {
        v14 = self;
        objc_super v15 = v11;
        uint64_t v16 = 1;
        goto LABEL_24;
      }
LABEL_13:
      [(DisplayFilterColorSettingsController *)self setSpecifierBeforeFilterOptions:v11];
      if (([v13 isEqual:@"GRAYSCALE"] & 1) != 0
        || ([v13 isEqual:@"RED_ADJUST"] & 1) != 0
        || ([v13 isEqual:@"GREEN_ADJUST"] & 1) != 0
        || [v13 isEqual:@"BLUE_ADJUST"]
        || [v13 isEqual:@"SINGLE_COLOR_ADJUST"])
      {
        [(DisplayFilterColorSettingsController *)self _addFilterSpecifier:v11];
      }
      else
      {
        [(DisplayFilterColorSettingsController *)self setSpecifierBeforeSelectionTable:v11];
        [v27 addObject:v11];
      }
LABEL_25:

      v10 = (char *)v10 + 1;
    }
    while (v7 != v10);
    id v17 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    id v7 = v17;
  }
  while (v17);
LABEL_29:

  v18 = [(DisplayFilterColorSettingsController *)self currentFilterSelectionSpecifiers];
  id v19 = [v18 count];

  if (v19)
  {
    v20 = [(DisplayFilterColorSettingsController *)self currentFilterSelectionSpecifiers];
    [v27 addObjectsFromArray:v20];
  }
  v21 = [(DisplayFilterColorSettingsController *)self currentOptionSpecifiers];
  id v22 = [v21 count];

  if (v22)
  {
    v23 = [(DisplayFilterColorSettingsController *)self currentOptionSpecifiers];
    [v27 addObjectsFromArray:v23];
  }
  v24 = *(void **)&self->super.AXUISettingsSetupCapableListController_opaque[v26];
  *(void *)&self->super.AXUISettingsSetupCapableListController_opaque[v26] = v27;

  double v3 = *(void **)&self->super.AXUISettingsSetupCapableListController_opaque[v26];
LABEL_34:

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DisplayFilterColorSettingsController;
  [(DisplayFilterColorSettingsController *)&v7 viewWillAppear:a3];
  double v4 = [(DisplayFilterColorSettingsController *)self table];
  id v5 = [(DisplayFilterColorSettingsController *)self table];
  [v5 contentInset];
  objc_msgSend(v4, "setContentOffset:animated:", 0, 0.0, -v6);
}

- (void)viewDidLayoutSubviews
{
  double v3 = [(DisplayFilterColorSettingsController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(DisplayFilterColorSettingsController *)self table];
  [v12 frame];
  double v14 = v13;

  if (v14 == v7)
  {
    [(DisplayFilterColorSettingsController *)self _headerHeight];
    double v16 = v15 + 6.0 + 16.0;
    double v17 = v7 + v16 + 80.0;
    double v18 = v11 - v16 + -80.0;
    id v19 = [(DisplayFilterColorSettingsController *)self table];
    objc_msgSend(v19, "setFrame:", v5, v17, v9, v18);
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)DisplayFilterColorSettingsController;
  [(DisplayFilterColorSettingsController *)&v3 viewDidLoad];
  [(DisplayFilterColorSettingsController *)self _setupPreviewRegion];
  [(DisplayFilterColorSettingsController *)self _updateOptionVisibility];
}

- (void)didSelectDisplayFilterPage:(int64_t)a3
{
  id v4 = [(DisplayFilterColorSettingsController *)self pageControl];
  [v4 setCurrentPage:a3];
}

- (void)changePage:(id)a3
{
  id v5 = [(DisplayFilterColorSettingsController *)self previewPageController];
  id v4 = [(DisplayFilterColorSettingsController *)self pageControl];
  objc_msgSend(v5, "setCurrentPage:", objc_msgSend(v4, "currentPage"));
}

- (void)_setupPreviewRegion
{
  objc_super v3 = [(DisplayFilterColorSettingsController *)self previewPageController];

  if (!v3)
  {
    [(DisplayFilterColorSettingsController *)self _headerHeight];
    double v5 = v4;
    double v6 = v4 + 6.0 + 8.0;
    double v7 = objc_alloc_init(DisplayFilterSettingsPreviewPageViewController);
    [(DisplayFilterSettingsPreviewPageViewController *)v7 setPageHeight:v5];
    [(DisplayFilterSettingsPreviewPageViewController *)v7 setDisplayFilterPageDelegate:self];
    [(DisplayFilterColorSettingsController *)self setPreviewPageController:v7];
    id v8 = objc_msgSend(objc_alloc((Class)UIPageControl), "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
    [(DisplayFilterColorSettingsController *)self setPageControl:v8];
    double v9 = [(DisplayFilterSettingsPreviewPageViewController *)v7 view];
    double v10 = +[UIColor labelColor];
    [v8 setCurrentPageIndicatorTintColor:v10];

    double v11 = +[UIColor secondaryLabelColor];
    [v8 setPageIndicatorTintColor:v11];

    v12 = +[UIColor secondarySystemBackgroundColor];
    [v8 setBackgroundColor:v12];

    v60 = v7;
    objc_msgSend(v8, "setNumberOfPages:", -[DisplayFilterSettingsPreviewPageViewController pageCount](v7, "pageCount"));
    objc_msgSend(v8, "setCurrentPage:", -[DisplayFilterSettingsPreviewPageViewController currentPage](v7, "currentPage"));
    [v8 addTarget:self action:"changePage:" forControlEvents:4096];
    id v13 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 10.0, v5 + 8.0 + 8.0);
    double v14 = +[UIColor secondarySystemBackgroundColor];
    [v13 setBackgroundColor:v14];

    [v13 addSubview:v9];
    [v13 addSubview:v8];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    addConstraint((uint64_t)v9, 3, v13, 3, 8.0);
    addConstraint((uint64_t)v9, 5, v13, 5, 0.0);
    v59 = v9;
    addConstraint((uint64_t)v9, 6, v13, 6, 0.0);
    addConstraint((uint64_t)v8, 4, v13, 4, -8.0);
    addConstraint((uint64_t)v8, 5, v13, 5, 0.0);
    v57 = v8;
    addConstraint((uint64_t)v8, 6, v13, 6, 0.0);
    double v15 = +[NSLayoutConstraint constraintWithItem:v8 attribute:3 relatedBy:0 toItem:v9 attribute:4 multiplier:1.0 constant:8.0];
    [v13 addConstraint:v15];
    v58 = +[NSLayoutConstraint constraintWithItem:v8 attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:6.0];

    [v8 addConstraint:v58];
    double v16 = v6 + 1.0 + 8.0 + 8.0;
    id v17 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 10.0, v16);
    double v18 = +[UIColor tableSeparatorLightColor];
    [v17 setBackgroundColor:v18];

    [v17 addSubview:v13];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    addConstraint((uint64_t)v13, 3, v17, 3, 0.0);
    addConstraint((uint64_t)v13, 4, v17, 4, -1.0);
    addConstraint((uint64_t)v13, 5, v17, 5, 0.0);
    addConstraint((uint64_t)v13, 6, v17, 6, 0.0);
    id v19 = [(DisplayFilterColorSettingsController *)self table];
    v20 = [v19 superview];
    [v20 addSubview:v17];

    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    v55 = [v17 topAnchor];
    v56 = [(DisplayFilterColorSettingsController *)self view];
    v54 = [v56 safeAreaLayoutGuide];
    v53 = [v54 topAnchor];
    v52 = [v55 constraintEqualToAnchor:v53];
    v61[0] = v52;
    v50 = [v17 leadingAnchor];
    v51 = [(DisplayFilterColorSettingsController *)self table];
    v49 = [v51 leadingAnchor];
    v21 = [v50 constraintEqualToAnchor:v49];
    v61[1] = v21;
    id v22 = [v17 trailingAnchor];
    v23 = [(DisplayFilterColorSettingsController *)self table];
    v24 = [v23 trailingAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    v61[2] = v25;
    uint64_t v26 = [v17 heightAnchor];
    v27 = [v26 constraintEqualToConstant:v16];
    v61[3] = v27;
    v48 = +[NSArray arrayWithObjects:v61 count:4];

    +[NSLayoutConstraint activateConstraints:v48];
    long long v28 = [(DisplayFilterColorSettingsController *)self table];
    [v28 contentInset];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;

    v35 = [(DisplayFilterColorSettingsController *)self table];
    objc_msgSend(v35, "setContentInset:", 32.0, v30, v32, v34);

    [v17 frame];
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    v42 = [(DisplayFilterColorSettingsController *)self table];
    [v42 frame];
    double v44 = v43;

    objc_msgSend(v17, "setFrame:", v37, v39, v44, v41);
    v45 = [(DisplayFilterColorSettingsController *)self table];
    v46 = [(DisplayFilterColorSettingsController *)self table];
    [v46 contentInset];
    objc_msgSend(v45, "setContentOffset:animated:", 0, 0.0, -v47);
  }
}

- (unint64_t)filterCategory
{
  return 1;
}

- (unint64_t)filterForCellIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"grayscale"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"redAdjust"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"greenAdjust"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"blueAdjust"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"singleColor"])
  {
    unint64_t v4 = 16;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)accessibilitySetPreference:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  double v7 = [a4 properties];
  id v9 = [v7 objectForKey:PSKeyNameKey];

  id v8 = [v6 BOOLValue];
  if ([v9 isEqualToString:@"ColorFilterEnabled"]) {
    [(DisplayFilterColorSettingsController *)self setGlobalFilterEnabled:v8];
  }
}

- (id)accessibilityPreferenceForSpecifier:(id)a3
{
  unint64_t v4 = [a3 properties];
  double v5 = [v4 objectForKey:PSKeyNameKey];

  if ([v5 isEqualToString:@"ColorFilterEnabled"])
  {
    id v6 = +[NSNumber numberWithBool:[(DisplayFilterBaseSettingsController *)self globalFilterEnabled]];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)accessibilitySettingsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)DisplayFilterColorSettingsController;
  [(DisplayFilterBaseSettingsController *)&v3 accessibilitySettingsDidChange];
  [(DisplayFilterColorSettingsController *)self _updateOptionVisibility];
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)DisplayFilterColorSettingsController;
  [(DisplayFilterColorSettingsController *)&v3 reloadSpecifiers];
  [(DisplayFilterColorSettingsController *)self _updateOptionVisibility];
}

- (void)setGlobalFilterEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DisplayFilterColorSettingsController;
  [(DisplayFilterBaseSettingsController *)&v4 setGlobalFilterEnabled:a3];
  [(DisplayFilterColorSettingsController *)self _updateOptionVisibility];
}

- (void)_addFilterSpecifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [(DisplayFilterColorSettingsController *)self filterSelectionSpecifiers];

    if (!v5)
    {
      id v6 = +[NSMutableArray array];
      [(DisplayFilterColorSettingsController *)self setFilterSelectionSpecifiers:v6];
    }
    id v7 = [(DisplayFilterColorSettingsController *)self filterSelectionSpecifiers];
    [v7 addObject:v4];
  }
}

- (void)_addOptionSpecifier:(id)a3 forType:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v13 = v6;
    id v7 = [(DisplayFilterColorSettingsController *)self filterTypeToOptionSpecifiers];

    if (!v7)
    {
      id v8 = +[NSMutableDictionary dictionary];
      [(DisplayFilterColorSettingsController *)self setFilterTypeToOptionSpecifiers:v8];
    }
    id v9 = [(DisplayFilterColorSettingsController *)self filterTypeToOptionSpecifiers];
    double v10 = +[NSNumber numberWithUnsignedLongLong:a4];
    double v11 = [v9 objectForKey:v10];
    if (!v11)
    {
      v12 = objc_opt_new();
      [v9 setObject:v12 forKey:v10];
      double v11 = [v9 objectForKey:v10];
    }
    [v11 addObject:v13];

    id v6 = v13;
  }
}

- (id)_optionSpecifiersForType:(unint64_t)a3
{
  id v4 = [(DisplayFilterColorSettingsController *)self filterTypeToOptionSpecifiers];
  double v5 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v6 = [v4 objectForKey:v5];

  return v6;
}

- (void)updateSystemFilter
{
  v3.receiver = self;
  v3.super_class = (Class)DisplayFilterColorSettingsController;
  [(DisplayFilterBaseSettingsController *)&v3 updateSystemFilter];
  [(DisplayFilterColorSettingsController *)self _updateOptionVisibility];
}

- (void)_updateOptionVisibility
{
  [(DisplayFilterColorSettingsController *)self _updateFilterSelectionSpecifiers];

  [(DisplayFilterColorSettingsController *)self _updateFilterOptionSpecifiers];
}

- (void)_updateFilterSelectionSpecifiers
{
  BOOL v3 = [(DisplayFilterBaseSettingsController *)self globalFilterEnabled];
  if (v3 != [(DisplayFilterColorSettingsController *)self displayingFilterSelection])
  {
    [(DisplayFilterColorSettingsController *)self setDisplayingFilterSelection:v3];
    id v4 = [(DisplayFilterColorSettingsController *)self filterSelectionSpecifiers];
    if (v3)
    {
      double v5 = [(DisplayFilterColorSettingsController *)self specifierBeforeSelectionTable];
      [(DisplayFilterColorSettingsController *)self insertContiguousSpecifiers:v4 afterSpecifier:v5 animated:1];

      id v6 = [(DisplayFilterColorSettingsController *)self filterSelectionSpecifiers];
      [(DisplayFilterColorSettingsController *)self setCurrentFilterSelectionSpecifiers:v6];
    }
    else
    {
      [(DisplayFilterColorSettingsController *)self removeContiguousSpecifiers:v4 animated:1];

      [(DisplayFilterColorSettingsController *)self setCurrentFilterSelectionSpecifiers:0];
    }
  }
}

- (void)_updateFilterOptionSpecifiers
{
  BOOL v3 = [(DisplayFilterBaseSettingsController *)self selectedFilter];
  if ([(DisplayFilterBaseSettingsController *)self globalFilterEnabled])
  {
    if (v3 == (void *)[(DisplayFilterColorSettingsController *)self displayingOptionsForType])return; {
    id v4 = [(DisplayFilterColorSettingsController *)self currentOptionSpecifiers];
    }
    id v5 = [v4 count];

    if (v5)
    {
      id v6 = [(DisplayFilterColorSettingsController *)self currentOptionSpecifiers];
      [(DisplayFilterColorSettingsController *)self removeContiguousSpecifiers:v6 animated:1];

      [(DisplayFilterColorSettingsController *)self setCurrentOptionSpecifiers:0];
    }
    id v7 = [(DisplayFilterColorSettingsController *)self _optionSpecifiersForType:v3];
    [(DisplayFilterColorSettingsController *)self setCurrentOptionSpecifiers:v7];

    id v8 = [(DisplayFilterColorSettingsController *)self currentOptionSpecifiers];
    id v9 = [v8 count];

    if (v9)
    {
      double v10 = [(DisplayFilterColorSettingsController *)self currentOptionSpecifiers];
      double v11 = [(DisplayFilterColorSettingsController *)self specifierBeforeFilterOptions];
      [(DisplayFilterColorSettingsController *)self insertContiguousSpecifiers:v10 afterSpecifier:v11 animated:1];
    }
  }
  else
  {
    v12 = [(DisplayFilterColorSettingsController *)self currentOptionSpecifiers];
    id v13 = [v12 count];

    if (!v13) {
      return;
    }
    double v14 = [(DisplayFilterColorSettingsController *)self currentOptionSpecifiers];
    [(DisplayFilterColorSettingsController *)self removeContiguousSpecifiers:v14 animated:1];

    [(DisplayFilterColorSettingsController *)self setCurrentOptionSpecifiers:0];
    BOOL v3 = 0;
  }

  [(DisplayFilterColorSettingsController *)self setDisplayingOptionsForType:v3];
}

- (id)grayscaleCorrectionIntensity:(id)a3
{
  MADisplayFilterPrefGetGrayscaleCorrectionIntensity();

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (void)setGrayscaleCorrectionIntensity:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  MADisplayFilterPrefSuspendNotifications();
  [v4 doubleValue];

  MADisplayFilterPrefSetGrayscaleCorrectionIntensity();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kAXSDisplayFilterForceUpdateNotification, 0, 0, 1u);

  MADisplayFilterPrefSuspendNotifications();
}

- (id)blueCorrectionIntensity:(id)a3
{
  MADisplayFilterPrefGetBlueColorCorrectionIntensity();

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (void)setBlueCorrectionIntensity:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  MADisplayFilterPrefSuspendNotifications();
  [v4 doubleValue];

  MADisplayFilterPrefSetBlueColorCorrectionIntensity();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kAXSDisplayFilterForceUpdateNotification, 0, 0, 1u);

  MADisplayFilterPrefSuspendNotifications();
}

- (id)redCorrectionIntensity:(id)a3
{
  MADisplayFilterPrefGetRedColorCorrectionIntensity();

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (void)setRedCorrectionIntensity:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  MADisplayFilterPrefSuspendNotifications();
  [v4 doubleValue];

  MADisplayFilterPrefSetRedColorCorrectionIntensity();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kAXSDisplayFilterForceUpdateNotification, 0, 0, 1u);

  MADisplayFilterPrefSuspendNotifications();
}

- (id)greenCorrectionIntensity:(id)a3
{
  MADisplayFilterPrefGetGreenColorCorrectionIntensity();

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (void)setGreenCorrectionIntensity:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  MADisplayFilterPrefSuspendNotifications();
  [v4 doubleValue];

  MADisplayFilterPrefSetGreenColorCorrectionIntensity();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kAXSDisplayFilterForceUpdateNotification, 0, 0, 1u);

  MADisplayFilterPrefSuspendNotifications();
}

- (id)singleColorFilterHue:(id)a3
{
  MADisplayFilterPrefGetSingleColorHue();

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (void)setSingleColorFilterHue:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  MADisplayFilterPrefSuspendNotifications();
  [v4 doubleValue];

  MADisplayFilterPrefSetSingleColorHue();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kAXSDisplayFilterForceUpdateNotification, 0, 0, 1u);

  MADisplayFilterPrefSuspendNotifications();
}

- (id)singleColorFilterIntensity:(id)a3
{
  MADisplayFilterPrefGetSingleColorIntensity();

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (void)setSingleColorFilterIntensity:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  MADisplayFilterPrefSuspendNotifications();
  [v4 doubleValue];

  MADisplayFilterPrefSetSingleColorIntensity();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kAXSDisplayFilterForceUpdateNotification, 0, 0, 1u);

  MADisplayFilterPrefSuspendNotifications();
}

- (BOOL)ax_handlesOwnScrollingInSetup
{
  return 1;
}

- (NSArray)currentOptionSpecifiers
{
  return self->_currentOptionSpecifiers;
}

- (void)setCurrentOptionSpecifiers:(id)a3
{
}

- (NSArray)currentFilterSelectionSpecifiers
{
  return self->_currentFilterSelectionSpecifiers;
}

- (void)setCurrentFilterSelectionSpecifiers:(id)a3
{
}

- (PSSpecifier)specifierBeforeFilterOptions
{
  return self->_specifierBeforeFilterOptions;
}

- (void)setSpecifierBeforeFilterOptions:(id)a3
{
}

- (PSSpecifier)specifierBeforeSelectionTable
{
  return self->_specifierBeforeSelectionTable;
}

- (void)setSpecifierBeforeSelectionTable:(id)a3
{
}

- (NSMutableDictionary)filterTypeToOptionSpecifiers
{
  return self->_filterTypeToOptionSpecifiers;
}

- (void)setFilterTypeToOptionSpecifiers:(id)a3
{
}

- (NSMutableArray)filterSelectionSpecifiers
{
  return self->_filterSelectionSpecifiers;
}

- (void)setFilterSelectionSpecifiers:(id)a3
{
}

- (unint64_t)displayingOptionsForType
{
  return self->_displayingOptionsForType;
}

- (void)setDisplayingOptionsForType:(unint64_t)a3
{
  self->_displayingOptionsForType = a3;
}

- (BOOL)displayingFilterSelection
{
  return self->_displayingFilterSelection;
}

- (void)setDisplayingFilterSelection:(BOOL)a3
{
  self->_displayingFilterSelection = a3;
}

- (DisplayFilterSettingsPreviewPageViewController)previewPageController
{
  return self->_previewPageController;
}

- (void)setPreviewPageController:(id)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_previewPageController, 0);
  objc_storeStrong((id *)&self->_filterSelectionSpecifiers, 0);
  objc_storeStrong((id *)&self->_filterTypeToOptionSpecifiers, 0);
  objc_storeStrong((id *)&self->_specifierBeforeSelectionTable, 0);
  objc_storeStrong((id *)&self->_specifierBeforeFilterOptions, 0);
  objc_storeStrong((id *)&self->_currentFilterSelectionSpecifiers, 0);

  objc_storeStrong((id *)&self->_currentOptionSpecifiers, 0);
}

@end