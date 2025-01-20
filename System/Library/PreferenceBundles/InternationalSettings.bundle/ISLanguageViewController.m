@interface ISLanguageViewController
- (BOOL)searchIsActive;
- (NSArray)filteredLanguageSections;
- (NSArray)languageSections;
- (NSArray)unfilteredLanguageSections;
- (NSOperationQueue)searchQueue;
- (NSString)checkedLanguageCode;
- (UISearchBar)searchBar;
- (UISearchController)searchController;
- (id)_mainContentView;
- (id)systemLanguages;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelSearchAndDismiss;
- (void)dealloc;
- (void)deselectHighlightedRow;
- (void)emitNavigationEventForLanguageViewController;
- (void)generateLanguageCells;
- (void)loadData;
- (void)loadView;
- (void)navBarCloseButtonClicked;
- (void)reloadDataAndScrollToCheckedLanguageWithAnimation:(BOOL)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)setCheckedLanguageCode:(id)a3;
- (void)setFilteredLanguageSections:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchIsActive:(BOOL)a3;
- (void)setSearchQueue:(id)a3;
- (void)setUnfilteredLanguageSections:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateNavigationItem;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ISLanguageViewController

- (void)dealloc
{
  [(UITableView *)self->_tableView setDelegate:0];
  [(UITableView *)self->_tableView setDataSource:0];
  v3 = [(ISLanguageViewController *)self searchBar];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)ISLanguageViewController;
  [(ISLanguageViewController *)&v4 dealloc];
}

- (NSOperationQueue)searchQueue
{
  searchQueue = self->_searchQueue;
  if (!searchQueue)
  {
    objc_super v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v5 = self->_searchQueue;
    self->_searchQueue = v4;

    [(NSOperationQueue *)self->_searchQueue setMaxConcurrentOperationCount:1];
    searchQueue = self->_searchQueue;
  }

  return searchQueue;
}

- (id)systemLanguages
{
  return +[NSLocale systemLanguages];
}

- (void)updateNavigationItem
{
  id v5 = [(ISLanguageViewController *)self navigationItem];
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SELECT_LANGUAGE" value:&stru_31478 table:@"InternationalSettings"];
  objc_super v4 = +[NSString stringWithFormat:v3];
  [v5 setTitle:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ISLanguageViewController;
  [(ISLanguageViewController *)&v10 viewWillAppear:a3];
  [(ISLanguageViewController *)self updateNavigationItem];
  objc_super v4 = +[PSListController appearance];
  unsigned int v5 = [v4 usesDarkTheme];

  if (v5)
  {
    NSAttributedStringKey v11 = NSForegroundColorAttributeName;
    v6 = +[UIColor whiteColor];
    v12 = v6;
    v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

    v8 = [(ISLanguageViewController *)self navigationController];
    v9 = [v8 navigationBar];
    [v9 setTitleTextAttributes:v7];
  }
}

- (void)generateLanguageCells
{
  uint64_t v3 = [(UITableView *)self->_tableView numberOfSections];
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v6 = [(UITableView *)self->_tableView numberOfRowsInSection:i];
      if (v6 >= 1)
      {
        uint64_t v7 = v6;
        for (uint64_t j = 0; j != v7; ++j)
        {
          Current = CFRunLoopGetCurrent();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_D254;
          block[3] = &unk_30F80;
          block[5] = j;
          block[6] = i;
          block[4] = self;
          CFRunLoopPerformBlock(Current, kCFRunLoopDefaultMode, block);
        }
      }
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(ISLanguageViewController *)self generateLanguageCells];
  v5.receiver = self;
  v5.super_class = (Class)ISLanguageViewController;
  [(ISLanguageViewController *)&v5 viewDidAppear:v3];
  [(ISLanguageViewController *)self emitNavigationEventForLanguageViewController];
}

- (void)emitNavigationEventForLanguageViewController
{
  v19 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/INTERNATIONAL/ADD_PREFERRED_LANGUAGE"];
  id v3 = objc_alloc((Class)_NSLocalizedStringResource);
  uint64_t v4 = +[NSLocale currentLocale];
  objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 bundleURL];
  id v7 = [v3 initWithKey:@"GENERAL" table:@"InternationalSettings" locale:v4 bundleURL:v6];

  id v8 = objc_alloc((Class)_NSLocalizedStringResource);
  v9 = +[NSLocale currentLocale];
  objc_super v10 = +[NSBundle bundleForClass:objc_opt_class()];
  NSAttributedStringKey v11 = [v10 bundleURL];
  id v12 = [v8 initWithKey:@"INTERNATIONAL" table:@"InternationalSettings" locale:v9 bundleURL:v11];

  id v13 = objc_alloc((Class)_NSLocalizedStringResource);
  v14 = +[NSLocale currentLocale];
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 bundleURL];
  id v17 = [v13 initWithKey:@"SELECT_LANGUAGE" table:@"InternationalSettings" locale:v14 bundleURL:v16];

  v20[0] = v7;
  v20[1] = v12;
  v18 = +[NSArray arrayWithObjects:v20 count:2];
  [(ISLanguageViewController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.language" title:v17 localizedNavigationComponents:v18 deepLink:v19];
}

- (id)_mainContentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSViewController_opaque[OBJC_IVAR___PSViewController__parentController]);
  uint64_t v4 = [WeakRetained view];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  v9 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v6, v8);
  contentView = self->_contentView;
  self->_contentView = v9;

  [(UIView *)self->_contentView setAutoresizingMask:18];
  NSAttributedStringKey v11 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, 0.0, 0.0, v6, v8);
  [(UITableView *)v11 setAutoresizingMask:18];
  [(UITableView *)v11 setDataSource:self];
  [(UITableView *)v11 setDelegate:self];
  [(UITableView *)v11 setRowHeight:UITableViewAutomaticDimension];
  [(UITableView *)v11 setEstimatedRowHeight:UITableViewDefaultRowHeight];
  [(UITableView *)v11 setKeyboardDismissMode:1];
  id v12 = +[PSListController appearance];
  if ([v12 usesDarkTheme]) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 0;
  }
  [(UITableView *)v11 setIndicatorStyle:v13];

  tableView = self->_tableView;
  self->_tableView = v11;
  v15 = v11;

  [(UIView *)self->_contentView addSubview:self->_tableView];
  id v16 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
  id v17 = [(ISLanguageViewController *)self navigationItem];
  [v17 setSearchController:v16];

  v18 = [(ISLanguageViewController *)self navigationItem];
  v19 = [v18 searchController];
  [v19 setAutomaticallyShowsCancelButton:0];

  v20 = [(ISLanguageViewController *)self navigationItem];
  [v20 setHidesSearchBarWhenScrolling:0];

  v21 = [(ISLanguageViewController *)self navigationItem];
  v22 = [v21 searchController];
  [(ISLanguageViewController *)self setSearchController:v22];

  v23 = [(ISLanguageViewController *)self searchController];
  v24 = [v23 searchBar];
  [(ISLanguageViewController *)self setSearchBar:v24];

  v25 = [(ISLanguageViewController *)self searchController];
  [v25 setHidesNavigationBarDuringPresentation:0];

  v26 = [(ISLanguageViewController *)self searchController];
  [v26 setObscuresBackgroundDuringPresentation:0];

  v27 = [(ISLanguageViewController *)self searchBar];
  [v27 setShowsCancelButton:1];

  v28 = [(ISLanguageViewController *)self searchBar];
  [v28 setDelegate:self];

  v29 = +[NSBundle bundleForClass:objc_opt_class()];
  v30 = [v29 localizedStringForKey:@"SEARCH" value:&stru_31478 table:@"InternationalSettings"];
  v31 = [(ISLanguageViewController *)self searchBar];
  [v31 setPlaceholder:v30];

  v32 = +[NSArray array];
  [(ISLanguageViewController *)self setFilteredLanguageSections:v32];

  [(ISLanguageViewController *)self loadData];
  v33 = self->_contentView;

  return v33;
}

- (void)loadView
{
  id v3 = [(ISLanguageViewController *)self _mainContentView];
  contentView = self->_contentView;
  self->_contentView = v3;

  double v5 = +[PSListController appearance];
  unsigned int v6 = [v5 usesDarkTheme];

  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v7 = [(UITableView *)self->_tableView subviews];
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if ([v12 isMemberOfClass:objc_opt_class()]) {
          break;
        }
        if (v9 == (id)++v11)
        {
          id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }
      id v13 = v12;

      if (!v13) {
        goto LABEL_14;
      }
      [v13 removeFromSuperview];
      double v7 = v13;
    }
LABEL_13:
  }
LABEL_14:
  [(ISLanguageViewController *)self setView:self->_contentView];
}

- (void)loadData
{
  id v3 = +[IPLanguageListManager manager];
  uint64_t v4 = +[NSMutableArray arrayWithCapacity:3];
  v24[0] = @"kLanguageSectionKeyTitle";
  double v5 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v6 = +[ISInternationalViewController modelSpecificLocalizedStringKeyForKey:@"DEVICE_LANGUAGES"];
  double v7 = [v5 localizedStringForKey:v6 value:&stru_31478 table:@"InternationalSettings"];
  v24[1] = @"kLanguageSectionKeyLanguages";
  v25[0] = v7;
  id v8 = [v3 deviceLanguagesForChangingDeviceLanguage:0];
  v25[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  [v4 addObject:v9];
  uint64_t v10 = [v3 languageVariants];
  if ([v10 count])
  {
    v22[0] = @"kLanguageSectionKeyTitle";
    uint64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"LANGUAGE_VARIANTS" value:&stru_31478 table:@"InternationalSettings"];
    v22[1] = @"kLanguageSectionKeyLanguages";
    v23[0] = v12;
    v23[1] = v10;
    id v13 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

    [v4 addObject:v13];
  }
  long long v14 = [v3 otherLanguages];
  id v15 = [v14 mutableCopy];

  [v15 removeObjectsInArray:v10];
  v20[0] = @"kLanguageSectionKeyTitle";
  long long v16 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v17 = [v16 localizedStringForKey:@"OTHER_LANGUAGES" value:&stru_31478 table:@"InternationalSettings"];
  v20[1] = @"kLanguageSectionKeyLanguages";
  v21[0] = v17;
  v21[1] = v15;
  v18 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

  [v4 addObject:v18];
  [(ISLanguageViewController *)self setUnfilteredLanguageSections:v4];
  v19 = [v3 systemDisplayLanguage];
  [(ISLanguageViewController *)self setCheckedLanguageCode:v19];
}

- (NSArray)languageSections
{
  if (self->_searchIsActive) {
    [(ISLanguageViewController *)self filteredLanguageSections];
  }
  else {
  v2 = [(ISLanguageViewController *)self unfilteredLanguageSections];
  }

  return (NSArray *)v2;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_searchIsActive) {
    [(ISLanguageViewController *)self filteredLanguageSections];
  }
  else {
  id v3 = [(ISLanguageViewController *)self languageSections];
  }
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v5 = [(ISLanguageViewController *)self languageSections];
  unsigned int v6 = [v5 objectAtIndexedSubscript:a4];
  double v7 = [v6 objectForKeyedSubscript:@"kLanguageSectionKeyLanguages"];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  double v5 = [(ISLanguageViewController *)self languageSections];
  unsigned int v6 = [v5 objectAtIndexedSubscript:a4];
  double v7 = [v6 objectForKeyedSubscript:@"kLanguageSectionKeyTitle"];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell"];
  if (!v7) {
    double v7 = [[ISLanguageTableViewCell alloc] initWithStyle:3 reuseIdentifier:@"Cell"];
  }
  id v8 = [v6 row];
  id v9 = [v6 section];

  uint64_t v10 = [(ISLanguageViewController *)self languageSections];
  uint64_t v11 = [v10 objectAtIndexedSubscript:v9];
  id v12 = [v11 objectForKeyedSubscript:@"kLanguageSectionKeyLanguages"];
  id v13 = [v12 objectAtIndexedSubscript:v8];

  id v14 = objc_alloc((Class)NSAttributedString);
  id v15 = [v13 name];
  CFStringRef v26 = kCTLanguageAttributeName;
  long long v16 = [v13 identifier];
  v27 = v16;
  long long v17 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  id v18 = [v14 initWithString:v15 attributes:v17];

  v19 = [(ISLanguageTableViewCell *)v7 textLabel];
  [v19 setAttributedText:v18];

  v20 = [v13 localizedStringForName];
  v21 = [(ISLanguageTableViewCell *)v7 detailTextLabel];
  [v21 setText:v20];

  v22 = [(ISLanguageViewController *)self checkedLanguageCode];
  v23 = [v13 identifier];
  LODWORD(v21) = [v22 isEqualToString:v23];

  if (v21) {
    uint64_t v24 = 3;
  }
  else {
    uint64_t v24 = 0;
  }
  [(ISLanguageTableViewCell *)v7 setAccessoryType:v24];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 row];
  id v7 = [v5 section];

  id v8 = [(ISLanguageViewController *)self languageSections];
  id v9 = [v8 objectAtIndexedSubscript:v7];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"kLanguageSectionKeyLanguages"];
  id v15 = [v10 objectAtIndexedSubscript:v6];

  uint64_t v11 = [v15 identifier];
  id v12 = (id *)&self->PSViewController_opaque[OBJC_IVAR___PSViewController__parentController];
  id WeakRetained = objc_loadWeakRetained(v12);
  [WeakRetained setLanguage:v11 specifier:0];

  id v14 = objc_loadWeakRetained(v12);
  [v14 commit];
}

- (void)deselectHighlightedRow
{
  tableView = self->_tableView;
  id v3 = [(UITableView *)tableView indexPathForSelectedRow];
  [(UITableView *)tableView deselectRowAtIndexPath:v3 animated:1];
}

- (void)reloadDataAndScrollToCheckedLanguageWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  [(UITableView *)self->_tableView reloadData];
  id v5 = [(ISLanguageViewController *)self checkedLanguageCode];
  if ([v5 length])
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = -1;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_E554;
    v22 = sub_E564;
    id v23 = 0;
    id v6 = [(ISLanguageViewController *)self languageSections];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_E56C;
    v14[3] = &unk_30FA8;
    id v7 = v5;
    id v15 = v7;
    long long v16 = &v24;
    long long v17 = &v18;
    [v6 enumerateObjectsUsingBlock:v14];

    for (unint64_t i = 0; i < (unint64_t)[(id)v19[5] count]; ++i)
    {
      id v9 = [(id)v19[5] objectAtIndexedSubscript:i];
      uint64_t v10 = [v9 identifier];
      unsigned int v11 = [v10 isEqualToString:v7];

      if (v11)
      {
        tableView = self->_tableView;
        id v13 = +[NSIndexPath indexPathForRow:i inSection:v25[3]];
        [(UITableView *)tableView scrollToRowAtIndexPath:v13 atScrollPosition:2 animated:v3];

        break;
      }
    }
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ISLanguageViewController *)self searchQueue];
  [v8 cancelAllOperations];

  if ([v7 length])
  {
    id v9 = objc_alloc_init((Class)NSBlockOperation);
    objc_initWeak(&location, v9);
    unsigned int v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_E7A4;
    id v14 = &unk_30E48;
    id v15 = self;
    id v16 = v7;
    objc_copyWeak(&v17, &location);
    [v9 addExecutionBlock:&v11];
    uint64_t v10 = [(ISLanguageViewController *)self searchQueue];
    [v10 addOperation:v9];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_searchIsActive = 0;
    [(UITableView *)self->_tableView reloadData];
  }
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
}

- (void)searchBarCancelButtonClicked:(id)a3
{
}

- (void)navBarCloseButtonClicked
{
}

- (void)cancelSearchAndDismiss
{
  BOOL v3 = [(ISLanguageViewController *)self searchController];
  [v3 setActive:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->PSViewController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [WeakRetained dismiss];
}

- (UISearchController)searchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);

  return (UISearchController *)WeakRetained;
}

- (void)setSearchController:(id)a3
{
}

- (UISearchBar)searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);

  return (UISearchBar *)WeakRetained;
}

- (void)setSearchBar:(id)a3
{
}

- (NSString)checkedLanguageCode
{
  return self->_checkedLanguageCode;
}

- (void)setCheckedLanguageCode:(id)a3
{
}

- (NSArray)unfilteredLanguageSections
{
  return self->_unfilteredLanguageSections;
}

- (void)setUnfilteredLanguageSections:(id)a3
{
}

- (NSArray)filteredLanguageSections
{
  return self->_filteredLanguageSections;
}

- (void)setFilteredLanguageSections:(id)a3
{
}

- (BOOL)searchIsActive
{
  return self->_searchIsActive;
}

- (void)setSearchIsActive:(BOOL)a3
{
  self->_searchIsActive = a3;
}

- (void)setSearchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_filteredLanguageSections, 0);
  objc_storeStrong((id *)&self->_unfilteredLanguageSections, 0);
  objc_storeStrong((id *)&self->_checkedLanguageCode, 0);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_searchController);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end