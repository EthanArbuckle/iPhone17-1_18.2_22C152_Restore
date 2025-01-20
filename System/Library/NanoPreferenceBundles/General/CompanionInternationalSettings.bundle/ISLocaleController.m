@interface ISLocaleController
- (BOOL)shouldReloadAndScrollToCurrentRegion;
- (ISRegion)currentRegion;
- (NSArray)filteredListContent;
- (NSArray)regionsList;
- (NSArray)sections;
- (NSOperationQueue)searchQueue;
- (UISearchBar)searchBar;
- (UISearchController)searchController;
- (id)_mainContentView;
- (id)filteredRegionsForRegionList:(id)a3 searchString:(id)a4;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelSearchAndDismiss;
- (void)dealloc;
- (void)deselectHighlightedRow;
- (void)emitNavigationEventForLocaleController;
- (void)loadRegions;
- (void)loadSections;
- (void)loadView;
- (void)navBarCloseButtonClicked;
- (void)reloadDataAndScrollToCheckedRegionAnimated:(BOOL)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)setCurrentRegion:(id)a3;
- (void)setFilteredListContent:(id)a3;
- (void)setRegionsList:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchQueue:(id)a3;
- (void)setSections:(id)a3;
- (void)setShouldReloadAndScrollToCurrentRegion:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ISLocaleController

- (void)dealloc
{
  [(UITableView *)self->_tableView setDelegate:0];
  [(UITableView *)self->_tableView setDataSource:0];
  v3 = [(ISLocaleController *)self searchBar];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)ISLocaleController;
  [(ISLocaleController *)&v4 dealloc];
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

- (id)_mainContentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->PSViewController_opaque[OBJC_IVAR___PSViewController__parentController]);
    v5 = [WeakRetained view];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;

    v10 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v7, v9);
    v11 = self->_contentView;
    self->_contentView = v10;

    [(UIView *)self->_contentView setAutoresizingMask:18];
    id v12 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
    v13 = [(ISLocaleController *)self navigationItem];
    [v13 setSearchController:v12];

    v14 = [(ISLocaleController *)self navigationItem];
    v15 = [v14 searchController];
    [v15 setAutomaticallyShowsCancelButton:0];

    v16 = [(ISLocaleController *)self navigationItem];
    [v16 setHidesSearchBarWhenScrolling:0];

    v17 = [(ISLocaleController *)self navigationItem];
    v18 = [v17 searchController];
    [(ISLocaleController *)self setSearchController:v18];

    v19 = [(ISLocaleController *)self searchController];
    v20 = [v19 searchBar];
    [(ISLocaleController *)self setSearchBar:v20];

    v21 = [(ISLocaleController *)self searchController];
    [v21 setHidesNavigationBarDuringPresentation:0];

    v22 = [(ISLocaleController *)self searchController];
    [v22 setObscuresBackgroundDuringPresentation:0];

    v23 = [(ISLocaleController *)self searchBar];
    [v23 setShowsCancelButton:1];

    v24 = [(ISLocaleController *)self searchBar];
    [v24 setDelegate:self];

    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"SEARCH" value:&stru_2D040 table:@"InternationalSettings"];
    v27 = [(ISLocaleController *)self searchBar];
    [v27 setPlaceholder:v26];

    v28 = [(ISLocaleController *)self navigationItem];
    v29 = [v28 navigationBar];
    [v29 setBarStyle:1];

    v30 = [(ISLocaleController *)self navigationItem];
    v31 = [v30 navigationBar];
    [v31 setTranslucent:1];

    v32 = BPSBridgeTintColor();
    v33 = [(ISLocaleController *)self searchBar];
    [v33 setTintColor:v32];

    v34 = [(ISLocaleController *)self searchBar];
    [v34 setKeyboardAppearance:1];

    v35 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, 0.0, 0.0, v7, v9);
    [(UITableView *)v35 setAutoresizingMask:18];
    [(UITableView *)v35 setDataSource:self];
    [(UITableView *)v35 setDelegate:self];
    [(UITableView *)v35 setRowHeight:UITableViewAutomaticDimension];
    [(UITableView *)v35 setEstimatedRowHeight:UITableViewDefaultRowHeight];
    [(UITableView *)v35 setKeyboardDismissMode:1];
    tableView = self->_tableView;
    self->_tableView = v35;
    v37 = v35;

    [(UIView *)self->_contentView addSubview:self->_tableView];
    contentView = self->_contentView;
  }

  return contentView;
}

- (void)loadSections
{
  v3 = +[UILocalizedIndexedCollation currentCollation];
  objc_super v4 = [v3 sectionTitles];
  v5 = (char *)[v4 count];

  double v6 = +[NSMutableArray array];
  if (v5)
  {
    double v7 = v5;
    do
    {
      double v8 = +[NSMutableArray array];
      [v6 addObject:v8];

      --v7;
    }
    while (v7);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v19 = self;
  double v9 = [(ISLocaleController *)self regionsList];
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v15 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v3, "sectionForObject:collationStringSelector:", v14, "regionName"));
        [v15 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  if (v5)
  {
    for (j = 0; j != v5; ++j)
    {
      v17 = [v6 objectAtIndex:j];
      v18 = [v3 sortedArrayFromArray:v17 collationStringSelector:"regionName"];
      [v6 replaceObjectAtIndex:j withObject:v18];
    }
  }
  [(ISLocaleController *)v19 setSections:v6];
}

- (void)loadRegions
{
  v3 = [(ISLocaleController *)self regionsList];

  if (!v3)
  {
    v19 = self;
    objc_super v4 = +[COSInternationalController currentLocale];
    uint64_t v5 = [v4 regionCode];

    CFStringRef v6 = @"US";
    if (v5) {
      CFStringRef v6 = (const __CFString *)v5;
    }
    long long v20 = (__CFString *)v6;
    double v7 = +[NSLocale supportedRegions];
    double v8 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v13);
          v15 = +[NSLocale _deviceLanguage];
          v16 = +[NSLocale localeWithLocaleIdentifier:v15];
          v17 = [v16 localizedStringForRegion:v14 context:3 short:0];

          if (([v17 isEqualToString:v14] & 1) == 0)
          {
            v18 = +[ISRegion regionWithName:v17 code:v14];
            [v8 addObject:v18];
            if ([(__CFString *)v20 isEqualToString:v14]) {
              [(ISLocaleController *)v19 setCurrentRegion:v18];
            }
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    [(ISLocaleController *)v19 setRegionsList:v8];
  }
}

- (void)loadView
{
  v3 = [(ISLocaleController *)self _mainContentView];
  contentView = self->_contentView;
  self->_contentView = v3;

  uint64_t v5 = self->_contentView;

  [(ISLocaleController *)self setView:v5];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ISLocaleController;
  [(ISLocaleController *)&v3 viewDidLayoutSubviews];
  if ([(ISLocaleController *)self shouldReloadAndScrollToCurrentRegion])
  {
    [(ISLocaleController *)self reloadDataAndScrollToCheckedRegionAnimated:0];
    [(ISLocaleController *)self setShouldReloadAndScrollToCurrentRegion:0];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ISLocaleController;
  [(ISLocaleController *)&v5 viewDidLoad];
  objc_super v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"SELECT_REGION" value:&stru_2D040 table:@"InternationalSettings"];
  [(ISLocaleController *)self setTitle:v4];

  [(ISLocaleController *)self emitNavigationEventForLocaleController];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ISLocaleController;
  [(ISLocaleController *)&v4 viewWillAppear:a3];
  [(ISLocaleController *)self loadRegions];
  [(ISLocaleController *)self loadSections];
  [(ISLocaleController *)self setShouldReloadAndScrollToCurrentRegion:1];
}

- (void)emitNavigationEventForLocaleController
{
  v19 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/INTERNATIONAL/LOCALE"];
  id v3 = objc_alloc((Class)_NSLocalizedStringResource);
  objc_super v4 = +[NSLocale currentLocale];
  objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v6 = [v5 bundleURL];
  id v7 = [v3 initWithKey:@"GENERAL" table:@"InternationalSettings" locale:v4 bundleURL:v6];

  id v8 = objc_alloc((Class)_NSLocalizedStringResource);
  id v9 = +[NSLocale currentLocale];
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 bundleURL];
  id v12 = [v8 initWithKey:@"INTERNATIONAL" table:@"InternationalSettings" locale:v9 bundleURL:v11];

  id v13 = objc_alloc((Class)_NSLocalizedStringResource);
  uint64_t v14 = +[NSLocale currentLocale];
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 bundleURL];
  id v17 = [v13 initWithKey:@"SELECT_REGION" table:@"InternationalSettings" locale:v14 bundleURL:v16];

  v20[0] = v7;
  v20[1] = v12;
  v18 = +[NSArray arrayWithObjects:v20 count:2];
  [(ISLocaleController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.language" title:v17 localizedNavigationComponents:v18 deepLink:v19];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_searchMode) {
    return 1;
  }
  objc_super v4 = [(ISLocaleController *)self sections];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_searchMode)
  {
    objc_super v4 = [(ISLocaleController *)self filteredListContent];
    id v5 = [v4 count];
  }
  else
  {
    objc_super v4 = [(ISLocaleController *)self sections];
    id v7 = [v4 objectAtIndex:a4];
    id v5 = [v7 count];
  }
  return (int64_t)v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (self->_searchMode
    || ([(ISLocaleController *)self sections],
        CFStringRef v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectAtIndex:a4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 count],
        v7,
        v6,
        !v8))
  {
    objc_super v4 = 0;
  }
  else
  {
    id v9 = +[UILocalizedIndexedCollation currentCollation];
    id v10 = [v9 sectionTitles];
    objc_super v4 = [v10 objectAtIndex:a4];
  }

  return v4;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if (self->_searchMode)
  {
    id v3 = 0;
  }
  else
  {
    objc_super v4 = +[UILocalizedIndexedCollation currentCollation];
    id v3 = [v4 sectionIndexTitles];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"kCellIdentifier"];
  if (!v7) {
    id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"kCellIdentifier"];
  }
  if (self->_searchMode)
  {
    id v8 = [(ISLocaleController *)self filteredListContent];
    id v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
  }
  else
  {
    id v8 = [(ISLocaleController *)self sections];
    id v10 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
    id v9 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "row"));
  }
  id v11 = [(ISLocaleController *)self currentRegion];

  if (v9 == v11) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 0;
  }
  [v7 setAccessoryType:v12];
  id v13 = [v9 regionName];
  uint64_t v14 = [v7 textLabel];
  [v14 setText:v13];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (self->_searchMode)
  {
    id v7 = [(ISLocaleController *)self filteredListContent];
    id v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "row"));
  }
  else
  {
    id v7 = [(ISLocaleController *)self sections];
    id v9 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "section"));
    id v8 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));
  }
  id v10 = +[COSInternationalController currentLocale];
  id v11 = [v10 regionCode];
  uint64_t v12 = [v8 regionCode];
  unsigned __int8 v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    [(ISLocaleController *)self deselectHighlightedRow];
  }
  else
  {
    uint64_t v14 = (id *)&self->PSViewController_opaque[OBJC_IVAR___PSViewController__parentController];
    id WeakRetained = objc_loadWeakRetained(v14);
    [WeakRetained setSelectedRegion:v8];

    id v16 = objc_loadWeakRetained(v14);
    [v16 commitRegion];
  }
}

- (void)deselectHighlightedRow
{
  tableView = self->_tableView;
  id v3 = [(UITableView *)tableView indexPathForSelectedRow];
  [(UITableView *)tableView deselectRowAtIndexPath:v3 animated:1];
}

- (void)reloadDataAndScrollToCheckedRegionAnimated:(BOOL)a3
{
  if (!self->_searchMode)
  {
    BOOL v3 = a3;
    [(UITableView *)self->_tableView reloadData];
    id v5 = [(ISLocaleController *)self currentRegion];

    if (v5)
    {
      id v6 = [(ISLocaleController *)self sections];
      id v7 = [v6 count];

      if (v7)
      {
        unint64_t v8 = 0;
        do
        {
          id v9 = [(ISLocaleController *)self sections];
          id v10 = [v9 objectAtIndexedSubscript:v8];

          if ([v10 count])
          {
            uint64_t v11 = 0;
            while (1)
            {
              uint64_t v12 = [v10 objectAtIndexedSubscript:v11];
              unsigned __int8 v13 = [v12 regionCode];
              uint64_t v14 = [(ISLocaleController *)self currentRegion];
              v15 = [v14 regionCode];
              unsigned int v16 = [v13 isEqualToString:v15];

              if (v16) {
                break;
              }

              if (++v11 >= (unint64_t)[v10 count]) {
                goto LABEL_12;
              }
            }
            tableView = self->_tableView;
            v18 = +[NSIndexPath indexPathForRow:v11 inSection:v8];
            [(UITableView *)tableView scrollToRowAtIndexPath:v18 atScrollPosition:1 animated:v3];
          }
LABEL_12:

          ++v8;
          v19 = [(ISLocaleController *)self sections];
          id v20 = [v19 count];
        }
        while (v8 < (unint64_t)v20);
      }
    }
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ISLocaleController *)self setFilteredListContent:0];
  unint64_t v8 = [(ISLocaleController *)self searchQueue];
  [v8 cancelAllOperations];

  if ([v7 length])
  {
    self->_searchMode = 1;
    id v9 = objc_alloc_init((Class)NSBlockOperation);
    objc_initWeak(&location, v9);
    uint64_t v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    unsigned __int8 v13 = sub_122F0;
    uint64_t v14 = &unk_2CD50;
    v15 = self;
    id v16 = v7;
    objc_copyWeak(&v17, &location);
    [v9 addExecutionBlock:&v11];
    id v10 = [(ISLocaleController *)self searchQueue];
    [v10 addOperation:v9];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_searchMode = 0;
    [(UITableView *)self->_tableView reloadData];
  }
}

- (id)filteredRegionsForRegionList:(id)a3 searchString:(id)a4
{
  id v5 = a3;
  id v18 = a4;
  id v20 = +[NSMutableArray array];
  id v6 = +[NSPredicate predicateWithFormat:@"SELF beginswith[cld] %@", v18];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v11 = [v10 regionName];
        if ([v6 evaluateWithObject:v11])
        {
          [v20 addObject:v10];
        }
        else
        {
          uint64_t v26 = 0;
          v27 = &v26;
          uint64_t v28 = 0x2020000000;
          char v29 = 0;
          id v12 = [v11 length];
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_12708;
          v21[3] = &unk_2CDE8;
          id v22 = v6;
          id v13 = v20;
          id v23 = v13;
          long long v24 = v10;
          v25 = &v26;
          objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v12, 3, v21);
          if (!*((unsigned char *)v27 + 24))
          {
            uint64_t v14 = [v10 regionCode];
            v15 = [v18 uppercaseString];
            unsigned int v16 = [v14 hasPrefix:v15];

            if (v16) {
              [v13 addObject:v10];
            }
          }

          _Block_object_dispose(&v26, 8);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }

  return v20;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  objc_super v4 = [(ISLocaleController *)self searchBar];
  id v5 = [v4 text];
  id v6 = [v5 length];

  if (!v6)
  {
    self->_searchMode = 0;
    tableView = self->_tableView;
    [(UITableView *)tableView reloadData];
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
}

- (void)navBarCloseButtonClicked
{
}

- (void)cancelSearchAndDismiss
{
  BOOL v3 = [(ISLocaleController *)self searchController];
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

- (void)setSearchQueue:(id)a3
{
}

- (NSArray)filteredListContent
{
  return self->_filteredListContent;
}

- (void)setFilteredListContent:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSArray)regionsList
{
  return self->_regionsList;
}

- (void)setRegionsList:(id)a3
{
}

- (ISRegion)currentRegion
{
  return self->_currentRegion;
}

- (void)setCurrentRegion:(id)a3
{
}

- (BOOL)shouldReloadAndScrollToCurrentRegion
{
  return self->_shouldReloadAndScrollToCurrentRegion;
}

- (void)setShouldReloadAndScrollToCurrentRegion:(BOOL)a3
{
  self->_shouldReloadAndScrollToCurrentRegion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRegion, 0);
  objc_storeStrong((id *)&self->_regionsList, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_filteredListContent, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_searchController);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end