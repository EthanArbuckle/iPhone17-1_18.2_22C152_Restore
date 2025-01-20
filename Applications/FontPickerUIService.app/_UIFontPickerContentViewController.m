@interface _UIFontPickerContentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasMultipleFacesInClientFontContext:(id)a3;
- (BOOL)_hasSettingsLinkSection;
- (BOOL)_isSettingsLinkSection:(int64_t)a3;
- (_UIFontPickerContentViewController)init;
- (_UIFontPickerContentViewControllerDelegate)delegate;
- (id)_clientFontContext;
- (id)_fontsForSearchTerm:(id)a3;
- (id)_identifierForSection:(int64_t)a3;
- (id)_indexPathForFont:(id)a3 fontInfo:(id *)a4;
- (id)_indexPathForFontInfo:(id)a3;
- (id)_infoForIndexPath:(id)a3;
- (id)_loadRecents;
- (id)_loadSystemExtras;
- (id)_selectedFontsForCurrentConfiguration;
- (id)_settingsLinkSymbolImage;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_numberOfExtraTopSections;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)_addToRecents:(id)a3;
- (void)_loadFonts;
- (void)_persistToRecents:(id)a3;
- (void)_pickerDidCancel;
- (void)_pickerDidSelectFont:(id)a3;
- (void)_pickerIsShowingKeyboard:(BOOL)a3;
- (void)_setConfiguration:(id)a3;
- (void)_setHideNavigationBar:(BOOL)a3;
- (void)_setRecentsHidden:(BOOL)a3;
- (void)_setSelectedFonts:(id)a3 scrollToVisible:(BOOL)a4;
- (void)_setSelectedFonts:(id)a3 scrollToVisible:(BOOL)a4 updatingRecentsSection:(BOOL)a5;
- (void)_setShowsGrabber:(BOOL)a3;
- (void)_setupTitleViewWhenNavigationBarHidden:(BOOL)a3 searchBarHidden:(BOOL)a4;
- (void)_updateSettingsLinkSymbolImageIfNeeded;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation _UIFontPickerContentViewController

- (_UIFontPickerContentViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFontPickerContentViewController;
  return [(_UIFontPickerContentViewController *)&v3 initWithStyle:2];
}

- (void)dealloc
{
  if (self->_fontChangeObservationToken)
  {
    objc_super v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_fontChangeObservationToken];
  }
  id v4 = sub_100077CB0();
  v5 = [(UIFontPickerViewControllerConfiguration *)self->_configuration _clientFontContextEndpoint];
  [v4 invalidateSharedInstanceForEndpoint:v5];

  v6.receiver = self;
  v6.super_class = (Class)_UIFontPickerContentViewController;
  [(_UIFontPickerContentViewController *)&v6 dealloc];
}

- (id)_settingsLinkSymbolImage
{
  [(_UIFontPickerContentViewController *)self _updateSettingsLinkSymbolImageIfNeeded];
  cachedSettingsLinkSymbolImage = self->_cachedSettingsLinkSymbolImage;

  return cachedSettingsLinkSymbolImage;
}

- (void)_updateSettingsLinkSymbolImageIfNeeded
{
  objc_super v3 = [(_UIFontPickerContentViewController *)self traitCollection];
  id v4 = v3;
  p_cachedSettingsLinkSymbolImage = &self->_cachedSettingsLinkSymbolImage;
  if (self->_cachedSettingsLinkSymbolImage)
  {
    objc_super v6 = [v3 preferredContentSizeCategory];
    if ([v6 isEqualToString:self->_cachedSettingsLinkSymbolImageContentSize])
    {
      [v4 displayScale];
      double v8 = v7;
      double cachedSettingsLinkSymbolImageDisplayScale = self->_cachedSettingsLinkSymbolImageDisplayScale;

      if (v8 == cachedSettingsLinkSymbolImageDisplayScale) {
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  id v10 = [objc_alloc((Class)ISSymbol) initWithSymbolName:@"textformat" bundleURL:0];
  v11 = objc_opt_new();
  [v11 setSymbolColors:&off_1000A16E0];
  [v11 setEnclosureColors:&off_1000A16F8];
  [v11 setRenderingMode:0];
  v12 = [v10 imageForGraphicSymbolDescriptor:v11];
  id v13 = objc_alloc((Class)UIImage);
  id v14 = [v12 CGImage];
  [v11 scale];
  id v15 = [v13 initWithCGImage:v14 scale:0 orientation:0];
  if ([(UIFontPickerViewControllerConfiguration *)self->_configuration displayUsingSystemFont])
  {
    v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v16 lineHeight];
    double v18 = floor(v17 * 0.1);
    [v16 pointSize];
    double v20 = v19 + v19;
    [v16 lineHeight];
    double v22 = 10.0;
    if (v18 > 5.0) {
      double v22 = v18 + v18;
    }
    double v23 = v21 + v22;
    v24 = objc_opt_new();
    [v11 scale];
    [v24 setScale:];
    id v25 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v24 format:v20];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000780CC;
    v31[3] = &unk_1000A0DB8;
    id v32 = v15;
    double v33 = v20;
    double v34 = v23;
    uint64_t v26 = [v25 imageWithActions:v31];
    v27 = *p_cachedSettingsLinkSymbolImage;
    *p_cachedSettingsLinkSymbolImage = (UIImage *)v26;
  }
  else
  {
    objc_storeStrong((id *)&self->_cachedSettingsLinkSymbolImage, v15);
  }
  v28 = [v4 preferredContentSizeCategory];
  cachedSettingsLinkSymbolImageContentSize = self->_cachedSettingsLinkSymbolImageContentSize;
  self->_cachedSettingsLinkSymbolImageContentSize = v28;

  [v4 displayScale];
  self->_double cachedSettingsLinkSymbolImageDisplayScale = v30;

LABEL_12:
}

- (id)_loadRecents
{
  return (id)__UIFontPickerLoadRecentsMatchingConfiguration(self->_configuration, a2);
}

- (id)_loadSystemExtras
{
  if ([(UIFontPickerViewControllerConfiguration *)self->_configuration _includeDefaultFont])
  {
    id v3 = [objc_alloc((Class)_UIFontPickerFontInfo) initWithSystemDefaultFont];
    if ([v3 matchesConfiguration:self->_configuration])
    {
      id v4 = +[NSMutableArray arrayWithCapacity:1];
      [v4 addObject:v3];
      self->_showingSystemSection = 1;
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (int64_t)_numberOfExtraTopSections
{
  return self->_showingSystemSection;
}

- (BOOL)_hasSettingsLinkSection
{
  return !self->_showingSingleFamily;
}

- (BOOL)_isSettingsLinkSection:(int64_t)a3
{
  if (![(_UIFontPickerContentViewController *)self _hasSettingsLinkSection]) {
    return 0;
  }
  v5 = [(_UIFontPickerContentViewController *)self tableView];
  BOOL v6 = (char *)[(_UIFontPickerContentViewController *)self numberOfSectionsInTableView:v5]- 1 == (unsigned char *)a3;

  return v6;
}

- (id)_clientFontContext
{
  id v3 = sub_100077CB0();
  id v4 = [(UIFontPickerViewControllerConfiguration *)self->_configuration _clientFontContextEndpoint];
  v5 = [v3 sharedInstanceForEndpoint:v4];

  return v5;
}

- (void)_loadFonts
{
  id v3 = [(_UIFontPickerContentViewController *)self _clientFontContext];
  id v4 = [(UIFontPickerViewControllerConfiguration *)self->_configuration _filterFamilyName];

  if (v4)
  {
    v5 = [(UIFontPickerViewControllerConfiguration *)self->_configuration _filterFamilyName];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100078518;
    v19[3] = &unk_1000A0DE0;
    v19[4] = self;
    [v3 runWithFontNamesForFamilyName:v5 usingBlock:v19];

    BOOL v6 = [(_UIFontPickerContentViewController *)self tableView];
    [v6 reloadData];
  }
  else
  {
    double v7 = +[UILocalizedIndexedCollation currentCollation];
    collation = self->_collation;
    self->_collation = v7;

    v9 = [(UILocalizedIndexedCollation *)self->_collation sectionTitles];
    id v10 = [v9 count];

    v11 = +[NSMutableDictionary dictionaryWithCapacity:v10];
    fontsBySection = self->_fontsBySection;
    self->_fontsBySection = v11;

    id v13 = +[NSMutableArray arrayWithCapacity:v10];
    sections = self->_sections;
    self->_sections = v13;

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100078770;
    v16[3] = &unk_1000A0E30;
    id v17 = v3;
    double v18 = self;
    [v17 runBlockInClientFontContext:v16];
    id v15 = [(_UIFontPickerContentViewController *)self tableView];
    [v15 reloadData];
  }
}

- (void)loadView
{
  v69.receiver = self;
  v69.super_class = (Class)_UIFontPickerContentViewController;
  [(_UIFontPickerContentViewController *)&v69 loadView];
  id v3 = [(_UIFontPickerContentViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"UIFontPickerCell"];

  id v4 = [(_UIFontPickerContentViewController *)self tableView];
  [v4 setSeparatorInsetReference:1];

  v5 = (_UIRecentFontsPicker *)objc_alloc_init(NSClassFromString(@"_UIFontPickerRecentsView"));
  recentsView = self->_recentsView;
  self->_recentsView = v5;

  if (self->_recentsView)
  {
    objc_initWeak(&location, self);
    double v7 = self->_recentsView;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100079458;
    v66[3] = &unk_1000A0E58;
    objc_copyWeak(&v67, &location);
    [(_UIRecentFontsPicker *)v7 _setSelectionHandler:v66];
    double v8 = self->_recentsView;
    v9 = [(NSMutableDictionary *)self->_fontsBySection objectForKeyedSubscript:&off_1000A1628];
    [(_UIRecentFontsPicker *)v8 _setRecents:v9];

    id v10 = (UIView *)objc_opt_new();
    recentsHeaderView = self->_recentsHeaderView;
    self->_recentsHeaderView = v10;

    v12 = (UITableViewHeaderFooterView *)objc_opt_new();
    recentsTableViewHeaderFooter = self->_recentsTableViewHeaderFooter;
    self->_recentsTableViewHeaderFooter = v12;

    id v14 = self->_recentsTableViewHeaderFooter;
    id v15 = [(_UIFontPickerContentViewController *)self tableView];
    [(UITableViewHeaderFooterView *)v14 setTableView:v15];

    v16 = [(_UIFontPickerContentViewController *)self tableView];
    id v17 = [v16 _constants];
    [(UITableViewHeaderFooterView *)self->_recentsTableViewHeaderFooter _setConstants:v17];

    v63 = [(UITableViewHeaderFooterView *)self->_recentsTableViewHeaderFooter defaultContentConfiguration];
    [v63 directionalLayoutMargins];
    double v19 = v18;
    [v63 directionalLayoutMargins];
    [v63 setDirectionalLayoutMargins:v19, 0.0];
    double v20 = +[NSBundle bundleForClass:objc_opt_class()];
    double v21 = [v20 localizedStringForKey:@"FONT_PICKER_RECENTS" value:@"Recents" table:@"Localizable"];
    [v63 setText:v21];

    [(UITableViewHeaderFooterView *)self->_recentsTableViewHeaderFooter setContentConfiguration:v63];
    [(UITableViewHeaderFooterView *)self->_recentsTableViewHeaderFooter setTranslatesAutoresizingMaskIntoConstraints:0];
    double v22 = [(_UIRecentFontsPicker *)self->_recentsView view];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(UIView *)self->_recentsHeaderView addSubview:self->_recentsTableViewHeaderFooter];
    double v23 = self->_recentsHeaderView;
    v24 = [(_UIRecentFontsPicker *)self->_recentsView view];
    [(UIView *)v23 addSubview:v24];

    v61 = [(UIView *)self->_recentsHeaderView leadingAnchor];
    v62 = [(UITableViewHeaderFooterView *)self->_recentsTableViewHeaderFooter leadingAnchor];
    v60 = [v61 constraintEqualToAnchor:v62];
    v70[0] = v60;
    v58 = [(UIView *)self->_recentsHeaderView trailingAnchor];
    v59 = [(UITableViewHeaderFooterView *)self->_recentsTableViewHeaderFooter trailingAnchor];
    v57 = [v58 constraintEqualToAnchor:v59];
    v70[1] = v57;
    v55 = [(UIView *)self->_recentsHeaderView topAnchor];
    v56 = [(UITableViewHeaderFooterView *)self->_recentsTableViewHeaderFooter topAnchor];
    v54 = [v55 constraintEqualToAnchor:v56];
    v70[2] = v54;
    v51 = [(UIView *)self->_recentsHeaderView leftAnchor];
    v53 = [(_UIRecentFontsPicker *)self->_recentsView view];
    v52 = [v53 leftAnchor];
    v50 = [v51 constraintEqualToAnchor:v52];
    v70[3] = v50;
    v48 = [(UIView *)self->_recentsHeaderView rightAnchor];
    v49 = [(_UIRecentFontsPicker *)self->_recentsView view];
    v47 = [v49 rightAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v70[4] = v46;
    id v25 = [(UIView *)self->_recentsHeaderView bottomAnchor];
    uint64_t v26 = [(_UIRecentFontsPicker *)self->_recentsView view];
    v27 = [v26 bottomAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    v70[5] = v28;
    v29 = [(UITableViewHeaderFooterView *)self->_recentsTableViewHeaderFooter bottomAnchor];
    double v30 = [(_UIRecentFontsPicker *)self->_recentsView view];
    v31 = [v30 topAnchor];
    id v32 = [v29 constraintEqualToAnchor:v31];
    v70[6] = v32;
    double v33 = +[NSArray arrayWithObjects:v70 count:7];
    +[NSLayoutConstraint activateConstraints:v33];

    [(_UIFontPickerContentViewController *)self addChildViewController:self->_recentsView];
    [(_UIRecentFontsPicker *)self->_recentsView didMoveToParentViewController:self];

    objc_destroyWeak(&v67);
    objc_destroyWeak(&location);
  }
  double v34 = [[_UIFontPickerSearchContentViewController alloc] initWithStyle:2];
  resultController = self->_resultController;
  self->_resultController = v34;

  [(_UIFontPickerSearchContentViewController *)self->_resultController _setConfiguration:self->_configuration];
  [(_UIFontPickerSearchContentViewController *)self->_resultController setDelegate:self];
  v36 = [[_UIFontPickerSecureSearchController alloc] initWithSearchResultsController:self->_resultController];
  searchController = self->_searchController;
  self->_searchController = v36;

  [(_UIFontPickerSecureSearchController *)self->_searchController setSearchResultsUpdater:self];
  [(_UIFontPickerSecureSearchController *)self->_searchController setDelegate:self];
  [(_UIFontPickerContentViewController *)self setDefinesPresentationContext:1];
  v38 = [(_UIFontPickerContentViewController *)self navigationItem];
  [v38 setHidesSearchBarWhenScrolling:0];

  v39 = [(_UIFontPickerContentViewController *)self navigationItem];
  [v39 setPreferredSearchBarPlacement:2];

  [(_UIFontPickerContentViewController *)self _setHideNavigationBar:self->_hideNavBar];
  [(_UIFontPickerContentViewController *)self _setShowsGrabber:self->_showsGrabber];
  if (!self->_fontChangeObservationToken)
  {
    objc_initWeak(&location, self);
    v40 = +[NSNotificationCenter defaultCenter];
    v41 = +[NSOperationQueue mainQueue];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10007952C;
    v64[3] = &unk_1000A0E80;
    objc_copyWeak(&v65, &location);
    v42 = [v40 addObserverForName:FSFontPickerSupportFontChangeNotification object:0 queue:v41 usingBlock:v64];
    fontChangeObservationToken = self->_fontChangeObservationToken;
    self->_fontChangeObservationToken = v42;

    objc_destroyWeak(&v65);
    objc_destroyWeak(&location);
  }
  selectedIndexPaths = self->_selectedIndexPaths;
  self->_selectedIndexPaths = 0;

  selectedFonts = self->_selectedFonts;
  self->_selectedFonts = 0;
}

- (void)viewDidLayoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)_UIFontPickerContentViewController;
  [(_UIFontPickerContentViewController *)&v40 viewDidLayoutSubviews];
  id v3 = [(_UIFontPickerContentViewController *)self tableView];
  id v4 = [v3 tableHeaderView];
  recentsHeaderView = self->_recentsHeaderView;

  if (v4 == recentsHeaderView)
  {
    double v6 = 0.0;
    if (![(UIView *)self->_recentsHeaderView isHidden])
    {
      double v7 = [(_UIRecentFontsPicker *)self->_recentsView view];
      [v7 intrinsicContentSize];
      double v9 = v8;
      recentsTableViewHeaderFooter = self->_recentsTableViewHeaderFooter;
      v11 = [(_UIFontPickerContentViewController *)self view];
      [v11 bounds];
      -[UITableViewHeaderFooterView sizeThatFits:](recentsTableViewHeaderFooter, "sizeThatFits:", v12, 0.0);
      double v6 = v9 + v13;
    }
    [(UIView *)self->_recentsHeaderView frame];
    if (v14 != v6)
    {
      -[UIView setFrame:](self->_recentsHeaderView, "setFrame:");
      id v15 = self->_recentsHeaderView;
      v16 = [(_UIFontPickerContentViewController *)self tableView];
      [v16 setTableHeaderView:v15];
    }
    id v17 = [(_UIFontPickerContentViewController *)self tableView];
    double v18 = [v17 headerViewForSection:0];

    double v19 = [(_UIFontPickerContentViewController *)self tableView];
    [v19 _sectionContentInset];
    double v21 = v20;
    double v23 = v22;

    v24 = [(_UIFontPickerContentViewController *)self tableView];
    [v24 safeAreaInsets];
    double v26 = v25;
    double v28 = v27;

    v29 = [(_UIFontPickerContentViewController *)self tableView];
    double v30 = [v29 traitCollection];
    id v31 = [v30 layoutDirection];

    if (v31 == (id)1)
    {
      double v32 = v23 - v28;
      double v33 = v32;
      if (v18)
      {
        [v18 layoutMargins];
        double v33 = v34 - v28;
      }
      recentsView = self->_recentsView;
      double v36 = v21 - v26;
      double v37 = v32;
    }
    else
    {
      double v38 = v21 - v26;
      double v33 = v38;
      if (v18)
      {
        [v18 layoutMargins];
        double v33 = v39 - v26;
      }
      recentsView = self->_recentsView;
      double v36 = v23 - v28;
      double v37 = v38;
    }
    [(_UIRecentFontsPicker *)recentsView _setLayoutMarginLeading:v37 trailing:v36 header:v33];
  }
}

- (void)_setHideNavigationBar:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hideNavBar = a3;
  if (a3)
  {
    id v5 = [(_UIFontPickerContentViewController *)self navigationItem];
    [v5 setRightBarButtonItem:0];
  }
  else
  {
    id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:self action:"_pickerDidCancel"];
    double v6 = [(_UIFontPickerContentViewController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];
  }
  id v7 = [(UIFontPickerViewControllerConfiguration *)self->_configuration _hideSearchBar];

  [(_UIFontPickerContentViewController *)self _setupTitleViewWhenNavigationBarHidden:v3 searchBarHidden:v7];
}

- (void)_setShowsGrabber:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsGrabber = a3;
  id v4 = [(_UIFontPickerSecureSearchController *)self->_searchController searchBar];
  id v6 = v4;
  double v5 = 0.0;
  if (v3) {
    double v5 = 15.0;
  }
  [v4 setContentInset:v5, 0.0, 0.0, 0.0];
}

- (void)_setConfiguration:(id)a3
{
  id v20 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  double v5 = [(UIFontPickerViewControllerConfiguration *)self->_configuration _filterFamilyName];
  self->_showingSingleFamily = v5 != 0;

  [(_UIFontPickerContentViewController *)self _loadFonts];
  id v6 = [v20 _tintColor];

  if (v6)
  {
    id v7 = [v20 _tintColor];
    double v8 = [(_UIFontPickerContentViewController *)self tableView];
    [v8 setTintColor:v7];

    double v9 = [v20 _tintColor];
    id v10 = [(_UIFontPickerSecureSearchController *)self->_searchController searchBar];
    [v10 setTintColor:v9];

    v11 = [v20 _tintColor];
    double v12 = [(_UIFontPickerSearchContentViewController *)self->_resultController tableView];
    [v12 setTintColor:v11];
  }
  if (self->_configuration && !self->_showingSingleFamily && (recentsHeaderView = self->_recentsHeaderView) != 0)
  {
    double v13 = [(_UIFontPickerContentViewController *)self tableView];
    double v14 = v13;
    id v15 = recentsHeaderView;
  }
  else
  {
    double v13 = [(_UIFontPickerContentViewController *)self tableView];
    double v14 = v13;
    id v15 = 0;
  }
  [v13 setTableHeaderView:v15];

  -[_UIFontPickerContentViewController _setupTitleViewWhenNavigationBarHidden:searchBarHidden:](self, "_setupTitleViewWhenNavigationBarHidden:searchBarHidden:", self->_hideNavBar, [v20 _hideSearchBar]);
  recentsView = self->_recentsView;
  id v17 = [(_UIFontPickerContentViewController *)self _selectedFontsForCurrentConfiguration];
  [(_UIRecentFontsPicker *)recentsView _setSelectedFontsInfo:v17];

  -[_UIRecentFontsPicker _setAdjustForIndexBar:](self->_recentsView, "_setAdjustForIndexBar:", [v20 _showsSectionIndexBar]);
  [(_UIFontPickerSearchContentViewController *)self->_resultController _setConfiguration:v20];
  double v18 = [(_UIFontPickerContentViewController *)self tableView];
  [v18 reloadData];
}

- (void)_setupTitleViewWhenNavigationBarHidden:(BOOL)a3 searchBarHidden:(BOOL)a4
{
  if (!a3 || a4 || [(UIFontPickerViewControllerConfiguration *)self->_configuration includeFaces])
  {
    if (a4) {
      searchController = 0;
    }
    else {
      searchController = self->_searchController;
    }
    id v7 = [(_UIFontPickerContentViewController *)self navigationItem];
    [v7 setSearchController:searchController];

    [(_UIFontPickerSecureSearchController *)self->_searchController setHidesNavigationBarDuringPresentation:1];
    double v8 = [(_UIFontPickerContentViewController *)self navigationItem];
    [v8 setTitleView:0];

    LODWORD(v7) = self->_showingSingleFamily;
    double v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v16 = v9;
    if (v7)
    {
      CFStringRef v10 = @"FONT_PICKER_STYLES_TITLE";
      CFStringRef v11 = @"Choose Style";
    }
    else
    {
      CFStringRef v10 = @"FONT_PICKER_TITLE";
      CFStringRef v11 = @"Choose Font";
    }
    double v12 = [v9 localizedStringForKey:v10 value:v11 table:@"Localizable"];
    double v13 = [(_UIFontPickerContentViewController *)self navigationItem];
    [v13 setTitle:v12];
  }
  else
  {
    double v14 = [(_UIFontPickerContentViewController *)self navigationItem];
    [v14 setSearchController:0];

    [(_UIFontPickerSecureSearchController *)self->_searchController setHidesNavigationBarDuringPresentation:0];
    id v15 = [(_UIFontPickerContentViewController *)self navigationItem];
    [v15 setTitle:0];

    id v16 = [(_UIFontPickerSecureSearchController *)self->_searchController searchBar];
    double v12 = [(_UIFontPickerContentViewController *)self navigationItem];
    [v12 setTitleView:v16];
  }
}

- (void)_setSelectedFonts:(id)a3 scrollToVisible:(BOOL)a4
{
}

- (void)_setSelectedFonts:(id)a3 scrollToVisible:(BOOL)a4 updatingRecentsSection:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  if (v8 && [v8 count])
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100079F74;
    v25[3] = &unk_1000A0EA8;
    v25[4] = self;
    id v26 = v9;
    [v8 enumerateObjectsUsingBlock:v25];
  }
  if (v6)
  {
    CFStringRef v10 = [(_UIFontPickerContentViewController *)self tableView];
    CFStringRef v11 = [v10 tableHeaderView];
    BOOL v12 = v11 != self->_recentsHeaderView;
  }
  else
  {
    BOOL v12 = 0;
  }
  double v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  double v14 = [(_UIFontPickerContentViewController *)self _clientFontContext];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100079FDC;
  v18[3] = &unk_1000A0F20;
  id v19 = v8;
  id v20 = v13;
  BOOL v23 = v12;
  double v21 = self;
  id v22 = v9;
  BOOL v24 = a5;
  id v15 = v9;
  id v16 = v13;
  id v17 = v8;
  [v14 runBlockInClientFontContext:v18];
}

- (void)_persistToRecents:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIFontPickerContentViewController *)self _clientFontContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007A3CC;
  v7[3] = &unk_1000A0F48;
  id v8 = v4;
  id v6 = v4;
  [v5 runBlockInClientFontContext:v7];
}

- (void)_addToRecents:(id)a3
{
  id v6 = a3;
  if (([v6 isSystemFont] & 1) == 0
    && [v6 isFontFamilyAvailable])
  {
    if (self->_showingSingleFamily)
    {
      [(_UIFontPickerContentViewController *)self _persistToRecents:v6];
    }
    else
    {
      id v4 = [(NSMutableDictionary *)self->_fontsBySection objectForKeyedSubscript:&off_1000A1628];
      if (v6 && v4)
      {
        if ([v4 indexOfObject:v6] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          [v4 insertObject:v6 atIndex:0];
          if ((unint64_t)[v4 count] >= 8) {
            [v4 removeLastObject];
          }
          [(_UIRecentFontsPicker *)self->_recentsView _setRecents:v4];
        }
        double v5 = [(NSMutableDictionary *)self->_fontsBySection objectForKeyedSubscript:&off_1000A1628];
        -[_UIFontPickerContentViewController _setRecentsHidden:](self, "_setRecentsHidden:", [v5 count] == 0);

        [(_UIFontPickerContentViewController *)self _persistToRecents:v6];
      }
    }
  }
}

- (void)_pickerDidCancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained _pickerDidCancel];
}

- (BOOL)_hasMultipleFacesInClientFontContext:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  double v5 = [(_UIFontPickerContentViewController *)self _clientFontContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007A648;
  v7[3] = &unk_1000A0F70;
  void v7[4] = &v8;
  [v5 runWithFontNamesForFamilyName:v4 usingBlock:v7];

  LOBYTE(v5) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

- (void)_pickerDidSelectFont:(id)a3
{
  id v4 = a3;
  if ([(UIFontPickerViewControllerConfiguration *)self->_configuration includeFaces])
  {
    double v5 = [(UIFontPickerViewControllerConfiguration *)self->_configuration _filterFamilyName];
    if (v5)
    {
    }
    else
    {
      uint64_t v24 = [v4 objectForKey:UIFontDescriptorFamilyAttribute];
      if (v24)
      {
        double v25 = (void *)v24;
        id v26 = [v4 objectForKey:UIFontDescriptorFamilyAttribute];
        unsigned int v27 = [(_UIFontPickerContentViewController *)self _hasMultipleFacesInClientFontContext:v26];

        if (v27)
        {
          uint64_t v10 = (id *)objc_opt_new();
          id v12 = [(UIFontPickerViewControllerConfiguration *)self->_configuration copy];
          double v28 = [v4 objectForKey:UIFontDescriptorFamilyAttribute];
          [v12 set_filterFamilyName:v28];

          [v10 _setConfiguration:v12];
          [v10 _setHideNavigationBar:self->_hideNavBar];
          [v10 _setShowsGrabber:self->_showsGrabber];
          objc_storeStrong(v10 + 59, self->_selectedFonts);
          v29 = [(_UIFontPickerContentViewController *)self delegate];
          [v10 setDelegate:v29];

          double v30 = [(_UIFontPickerContentViewController *)self navigationController];

          if (v30)
          {
            id v31 = [(_UIFontPickerContentViewController *)self navigationController];
            [v31 pushViewController:v10 animated:1];
          }
          goto LABEL_15;
        }
      }
    }
  }
  id v35 = v4;
  id v6 = +[NSArray arrayWithObjects:&v35 count:1];
  [(_UIFontPickerContentViewController *)self _setSelectedFonts:v6 scrollToVisible:0 updatingRecentsSection:0];

  id v7 = [(_UIFontPickerContentViewController *)self _clientFontContext];
  uint64_t v8 = [v4 postscriptName];
  [v7 fontSelected:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained _pickerDidSelectFont:v4];

  uint64_t v10 = [(_UIFontPickerContentViewController *)self navigationController];
  if (!v10) {
    goto LABEL_16;
  }
  if (self->_hideNavBar) {
    goto LABEL_16;
  }
  uint64_t v11 = [(UIFontPickerViewControllerConfiguration *)self->_configuration _filterFamilyName];
  if (!v11) {
    goto LABEL_16;
  }
  id v12 = (id)v11;
  double v13 = [(_UIFontPickerContentViewController *)self navigationController];
  double v14 = [v13 viewControllers];
  id v15 = [v14 objectAtIndexedSubscript:0];
  if (v15 == self)
  {

LABEL_15:
LABEL_16:

    goto LABEL_17;
  }
  id v16 = v15;
  [(_UIFontPickerContentViewController *)self navigationController];
  id v17 = v33 = v13;
  double v18 = [v17 viewControllers];
  id v19 = [v18 objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v20 = [(_UIFontPickerContentViewController *)self navigationController];
    double v21 = [v20 viewControllers];
    id v22 = [v21 objectAtIndexedSubscript:0];

    id v34 = v4;
    BOOL v23 = +[NSArray arrayWithObjects:&v34 count:1];
    [v22 _setSelectedFonts:v23 scrollToVisible:0 updatingRecentsSection:0];
  }
LABEL_17:
}

- (void)_pickerIsShowingKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 _pickerIsShowingKeyboard:v3];
  }
}

- (id)_selectedFontsForCurrentConfiguration
{
  selectedFonts = self->_selectedFonts;
  if (!selectedFonts
    || self->_showingSingleFamily
    || (unsigned __int8 v4 = [(UIFontPickerViewControllerConfiguration *)self->_configuration includeFaces],
        selectedFonts = self->_selectedFonts,
        (v4 & 1) != 0))
  {
    double v5 = selectedFonts;
  }
  else
  {
    id v7 = +[NSMutableArray arrayWithCapacity:[(NSArray *)selectedFonts count]];
    uint64_t v8 = self->_selectedFonts;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10007AC00;
    v9[3] = &unk_1000A0F98;
    double v5 = v7;
    uint64_t v10 = v5;
    [(NSArray *)v8 enumerateObjectsUsingBlock:v9];
  }

  return v5;
}

- (void)_setRecentsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIView *)self->_recentsHeaderView isHidden] != a3)
  {
    [(UIView *)self->_recentsHeaderView setHidden:v3];
    id v5 = [(_UIFontPickerContentViewController *)self view];
    [v5 setNeedsLayout];
  }
}

- (id)_identifierForSection:(int64_t)a3
{
  if (!self->_showingSystemSection)
  {
    uint64_t v3 = 0;
    goto LABEL_5;
  }
  if (a3)
  {
    uint64_t v3 = -1;
LABEL_5:
    unsigned __int8 v4 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:v3 + a3];
    goto LABEL_7;
  }
  unsigned __int8 v4 = &off_1000A1640;
LABEL_7:

  return v4;
}

- (id)_infoForIndexPath:(id)a3
{
  fontsBySection = self->_fontsBySection;
  id v5 = a3;
  char v6 = -[_UIFontPickerContentViewController _identifierForSection:](self, "_identifierForSection:", [v5 section]);
  id v7 = [(NSMutableDictionary *)fontsBySection objectForKeyedSubscript:v6];
  id v8 = [v5 row];

  double v9 = [v7 objectAtIndexedSubscript:v8];

  return v9;
}

- (id)_indexPathForFont:(id)a3 fontInfo:(id *)a4
{
  id v6 = a3;
  if (((unint64_t)[(NSMutableArray *)self->_sections count] & 0x8000000000000000) != 0)
  {
LABEL_14:
    double v13 = 0;
  }
  else
  {
    uint64_t v7 = -1;
    while (1)
    {
      if (v7 < 0) {
        +[NSNumber numberWithInteger:v7];
      }
      else {
      id v8 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:v7];
      }
      double v9 = [(NSMutableDictionary *)self->_fontsBySection objectForKeyedSubscript:v8];
      if ([v9 count]) {
        break;
      }
LABEL_13:

      if (++v7 >= (uint64_t)[(NSMutableArray *)self->_sections count]) {
        goto LABEL_14;
      }
    }
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = [v9 objectAtIndexedSubscript:v10];
      id v12 = v11;
      if (!self->_showingSingleFamily) {
        goto LABEL_23;
      }
      if ([v11 matchesFontDescriptor:v6]) {
        break;
      }
      if (!self->_showingSingleFamily)
      {
LABEL_23:
        if ([v12 matchesFamilyForFontDescriptor:v6]) {
          break;
        }
      }

      if (++v10 >= (unint64_t)[v9 count]) {
        goto LABEL_13;
      }
    }
    if (a4) {
      *a4 = v12;
    }
    double v13 = +[NSIndexPath indexPathForRow:v10 inSection:(char *)[(_UIFontPickerContentViewController *)self _numberOfExtraTopSections] + v7];
  }

  return v13;
}

- (id)_indexPathForFontInfo:(id)a3
{
  unsigned __int8 v4 = [a3 familyInfo];
  if ([(NSMutableArray *)self->_sections count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:v5];
      uint64_t v7 = [(NSMutableDictionary *)self->_fontsBySection objectForKeyedSubscript:v6];
      id v8 = [v7 indexOfObject:v4];
      if (v8 != (id)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }

      if (++v5 >= (unint64_t)[(NSMutableArray *)self->_sections count]) {
        goto LABEL_5;
      }
    }
    double v9 = +[NSIndexPath indexPathForRow:v8 inSection:(char *)[(_UIFontPickerContentViewController *)self _numberOfExtraTopSections] + v5];
  }
  else
  {
LABEL_5:
    double v9 = 0;
  }

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(_UIFontPickerContentViewController *)self _isSettingsLinkSection:a4]) {
    return 1;
  }
  fontsBySection = self->_fontsBySection;
  id v8 = [(_UIFontPickerContentViewController *)self _identifierForSection:a4];
  double v9 = [(NSMutableDictionary *)fontsBySection objectForKeyedSubscript:v8];
  id v10 = [v9 count];

  return (int64_t)v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unsigned __int8 v4 = (char *)[(NSMutableArray *)self->_sections count];
  uint64_t v5 = &v4[[(_UIFontPickerContentViewController *)self _numberOfExtraTopSections]];
  return (int64_t)&v5[[(_UIFontPickerContentViewController *)self _hasSettingsLinkSection]];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (self->_showingSingleFamily)
  {
    uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_fontsBySection, "objectForKeyedSubscript:", &off_1000A1610, a4);
    id v6 = [v5 firstObject];
    uint64_t v7 = [v6 localizedFamilyName];
    id v8 = (void *)v7;
    double v9 = &stru_1000A1228;
    if (v7) {
      double v9 = (__CFString *)v7;
    }
    id v10 = v9;
    goto LABEL_5;
  }
  if (![(_UIFontPickerContentViewController *)self _isSettingsLinkSection:a4])
  {
    uint64_t v5 = [(_UIFontPickerContentViewController *)self _identifierForSection:a4];
    if ([v5 isEqual:&off_1000A1640])
    {
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v11 = [v6 localizedStringForKey:@"FONT_PICKER_SYSTEM_EXTRAS" value:@"System" table:@"Localizable"];
      goto LABEL_6;
    }
    id v6 = [(UILocalizedIndexedCollation *)self->_collation sectionTitles];
    id v8 = [(_UIFontPickerContentViewController *)self _identifierForSection:a4];
    [v6 objectAtIndexedSubscript:[v8 integerValue]];
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    uint64_t v11 = v10;

LABEL_6:
    goto LABEL_7;
  }
  uint64_t v11 = &stru_1000A1228;
LABEL_7:

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 dequeueReusableCellWithIdentifier:@"UIFontPickerCell"];
  if (!v8) {
    id v8 = [[_UIFontPickerTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"UIFontPickerCell"];
  }
  if (-[_UIFontPickerContentViewController _isSettingsLinkSection:](self, "_isSettingsLinkSection:", [v7 section]))
  {
    id v9 = [(_UIFontPickerTableViewCell *)v8 defaultContentConfiguration];
    id v10 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"FONT_PICKER_SETTINGS_LINK_SHORT" value:@"Manage Fonts" table:@"Localizable"];
    [v9 setText:v11];

    if ([(UIFontPickerViewControllerConfiguration *)self->_configuration displayUsingSystemFont])
    {
      double leading = 10.0;
      [v9 setImageToTextPadding:10.0];
      [v9 setAxesPreservingSuperviewLayoutMargins:0];
      double top = 0.0;
      double bottom = 0.0;
      double trailing = 10.0;
    }
    else
    {
      [v9 setAxesPreservingSuperviewLayoutMargins:1];
      double top = NSDirectionalEdgeInsetsZero.top;
      double leading = NSDirectionalEdgeInsetsZero.leading;
      double bottom = NSDirectionalEdgeInsetsZero.bottom;
      double trailing = NSDirectionalEdgeInsetsZero.trailing;
    }
    [v9 setDirectionalLayoutMargins:top, leading, bottom, trailing];
    uint64_t v24 = [(_UIFontPickerContentViewController *)self _settingsLinkSymbolImage];
    [v9 setImage:v24];

    [(_UIFontPickerTableViewCell *)v8 setContentConfiguration:v9];
    [(_UIFontPickerTableViewCell *)v8 setAccessoryType:1];
    double v25 = v8;
  }
  else
  {
    id v16 = [(_UIFontPickerContentViewController *)self _infoForIndexPath:v7];
    id v17 = [(_UIFontPickerContentViewController *)self _clientFontContext];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10007B6DC;
    v37[3] = &unk_1000A0FC0;
    double v18 = v8;
    double v38 = v18;
    id v9 = v16;
    id v39 = v9;
    objc_super v40 = self;
    [v17 runBlockInClientFontContext:v37];

    if ([(UIFontPickerViewControllerConfiguration *)self->_configuration includeFaces]
      && !self->_showingSingleFamily)
    {
      unsigned __int8 v20 = [v9 hasMultipleFaces];
      int v19 = 1;
    }
    else
    {
      int v19 = 0;
      unsigned __int8 v20 = 0;
    }
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    selectedFonts = self->_selectedFonts;
    if (selectedFonts)
    {
      BOOL showingSingleFamily = self->_showingSingleFamily;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10007B72C;
      v29[3] = &unk_1000A0FE8;
      id v31 = &v33;
      BOOL v32 = showingSingleFamily;
      id v30 = v9;
      [(NSArray *)selectedFonts enumerateObjectsUsingBlock:v29];
    }
    if (v20)
    {
      uint64_t v23 = 1;
    }
    else
    {
      if (*((unsigned char *)v34 + 24)) {
        int v26 = v19;
      }
      else {
        int v26 = 1;
      }
      if (v26) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = 3;
      }
    }
    [(_UIFontPickerTableViewCell *)v18 setAccessoryType:v23];
    unsigned int v27 = v18;
    _Block_object_dispose(&v33, 8);
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (-[_UIFontPickerContentViewController _isSettingsLinkSection:](self, "_isSettingsLinkSection:", [v6 section]))
  {
    [v9 deselectRowAtIndexPath:v6 animated:1];

    sub_100077B44();
  }
  else
  {
    id v7 = [(_UIFontPickerContentViewController *)self _infoForIndexPath:v6];

    id v8 = [v7 fontDescriptor];
    [(_UIFontPickerContentViewController *)self _pickerDidSelectFont:v8];
  }
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if ([(UIFontPickerViewControllerConfiguration *)self->_configuration _showsSectionIndexBar]&& !self->_showingSingleFamily)
  {
    unsigned __int8 v4 = [(UILocalizedIndexedCollation *)self->_collation sectionIndexTitles];
  }
  else
  {
    unsigned __int8 v4 = &__NSArray0__struct;
  }

  return v4;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  if (![(UIFontPickerViewControllerConfiguration *)self->_configuration _showsSectionIndexBar]|| self->_showingSingleFamily)
  {
    return 0;
  }
  sections = self->_sections;
  id v9 = +[NSNumber numberWithInteger:[(UILocalizedIndexedCollation *)self->_collation sectionForSectionIndexTitleAtIndex:a5]];
  id v10 = (char *)[(NSMutableArray *)sections indexOfObject:v9];
  id v7 = &v10[[(_UIFontPickerContentViewController *)self _numberOfExtraTopSections]];

  return (int64_t)v7;
}

- (id)_fontsForSearchTerm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v20 = 448;
  double v21 = self;
  obj = self->_fontsBySection;
  id v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    id v9 = &off_1000A1628;
    do
    {
      id v10 = 0;
      id v22 = v7;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v10);
        if ((objc_msgSend(v11, "isEqual:", v9, v20, v21) & 1) == 0)
        {
          id v12 = v9;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          double v13 = [*(id *)((char *)&v21->super.super.super.super.isa + v20) objectForKeyedSubscript:v11];
          id v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v25;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v25 != v16) {
                  objc_enumerationMutation(v13);
                }
                double v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                if ([v18 matchesSearchString:v4]) {
                  [v5 addObject:v18];
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v15);
          }

          id v9 = v12;
          id v7 = v22;
        }
        id v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      id v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }

  return v5;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = [a3 searchBar];
  id obj = [v4 text];

  [(_UIFontPickerSearchContentViewController *)self->_resultController setSearchTerm:obj];
  if ([obj length])
  {
    p_previousSearch = &self->_previousSearch;
    if (!self->_previousSearch) {
      goto LABEL_6;
    }
    if (objc_msgSend(obj, "isEqualToString:")) {
      goto LABEL_8;
    }
    if (*p_previousSearch
      && [obj rangeOfString:*p_previousSearch options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [(_UIFontPickerSearchContentViewController *)self->_resultController _filterResultsForSearchTerm:obj];
    }
    else
    {
LABEL_6:
      resultController = self->_resultController;
      id v7 = [(_UIFontPickerContentViewController *)self _fontsForSearchTerm:obj];
      [(_UIFontPickerSearchContentViewController *)resultController _setResultFonts:v7];
    }
    objc_storeStrong((id *)p_previousSearch, obj);
  }
LABEL_8:
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = [(_UIFontPickerContentViewController *)self tableView];
  [v4 setKeyboardDismissMode:1];

  [(_UIFontPickerContentViewController *)self _pickerIsShowingKeyboard:1];
  if (!self->_hideNavBar)
  {
    id v7 = (id)objc_opt_new();
    [v7 configureWithOpaqueBackground];
    uint64_t v5 = [(_UIFontPickerContentViewController *)self navigationItem];
    [v5 setScrollEdgeAppearance:v7];

    id v6 = [(_UIFontPickerContentViewController *)self navigationItem];
    [v6 setCompactScrollEdgeAppearance:v7];
  }
}

- (void)willDismissSearchController:(id)a3
{
  [(_UIFontPickerContentViewController *)self _pickerIsShowingKeyboard:0];
  if (!self->_hideNavBar)
  {
    id v6 = (id)objc_opt_new();
    [v6 configureWithTransparentBackground];
    id v4 = [(_UIFontPickerContentViewController *)self navigationItem];
    [v4 setScrollEdgeAppearance:v6];

    uint64_t v5 = [(_UIFontPickerContentViewController *)self navigationItem];
    [v5 setCompactScrollEdgeAppearance:v6];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIFontPickerContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_UIFontPickerContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedSettingsLinkSymbolImageContentSize, 0);
  objc_storeStrong((id *)&self->_cachedSettingsLinkSymbolImage, 0);
  objc_storeStrong((id *)&self->_fontChangeObservationToken, 0);
  objc_storeStrong((id *)&self->_recentsView, 0);
  objc_storeStrong((id *)&self->_recentsTableViewHeaderFooter, 0);
  objc_storeStrong((id *)&self->_recentsHeaderView, 0);
  objc_storeStrong((id *)&self->_previousSearch, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_resultController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_selectedFonts, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_fontsBySection, 0);

  objc_storeStrong((id *)&self->_collation, 0);
}

@end