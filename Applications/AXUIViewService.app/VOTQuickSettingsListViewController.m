@interface VOTQuickSettingsListViewController
- (AXQuickSettingsData)data;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isFiltering;
- (BOOL)_isSearchBarEmpty;
- (NSArray)allSpecifiers;
- (NSArray)filteredSpecifiers;
- (NSTimer)speakFilteredItemSummaryTimer;
- (UISearchController)searchController;
- (VOTQuickSettingsListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_specifierForItem:(id)a3;
- (id)settingsItemUpdateObserverToken;
- (id)specifierValue:(id)a3;
- (id)specifiers;
- (int64_t)mode;
- (int64_t)tableViewStyle;
- (void)_filterContentForSearchText:(id)a3;
- (void)dealloc;
- (void)setAllSpecifiers:(id)a3;
- (void)setData:(id)a3;
- (void)setFilteredSpecifiers:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setSearchController:(id)a3;
- (void)setSettingsItemUpdateObserverToken:(id)a3;
- (void)setSpeakFilteredItemSummaryTimer:(id)a3;
- (void)setSpecifierValue:(id)a3 specifier:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation VOTQuickSettingsListViewController

- (VOTQuickSettingsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)VOTQuickSettingsListViewController;
  v4 = [(VOTQuickSettingsListViewController *)&v16 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_mode = 0;
    id v6 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
    [(VOTQuickSettingsListViewController *)v5 setSearchController:v6];

    v7 = [(VOTQuickSettingsListViewController *)v5 searchController];
    [v7 setSearchResultsUpdater:v5];

    v8 = [(VOTQuickSettingsListViewController *)v5 searchController];
    [v8 setObscuresBackgroundDuringPresentation:0];

    v9 = [(VOTQuickSettingsListViewController *)v5 searchController];
    [v9 setHidesNavigationBarDuringPresentation:0];

    v10 = sub_10000CFD0(@"VoiceOverQuickSettings.filter.placeholder");
    v11 = [(VOTQuickSettingsListViewController *)v5 searchController];
    v12 = [v11 searchBar];
    [v12 setPlaceholder:v10];

    v13 = [(VOTQuickSettingsListViewController *)v5 searchController];
    v14 = [(VOTQuickSettingsListViewController *)v5 navigationItem];
    [v14 setSearchController:v13];

    [(VOTQuickSettingsListViewController *)v5 setDefinesPresentationContext:1];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = [(VOTQuickSettingsListViewController *)self settingsItemUpdateObserverToken];
  [v3 removeObserver:v4];

  v5.receiver = self;
  v5.super_class = (Class)VOTQuickSettingsListViewController;
  [(VOTQuickSettingsListViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)VOTQuickSettingsListViewController;
  [(VOTQuickSettingsListViewController *)&v17 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = +[VOSSettingsHelper sharedInstance];
  objc_super v5 = +[NSOperationQueue mainQueue];
  uint64_t v6 = VOSDidUpdateValueForSettingsItemNotification;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000053F4;
  v14[3] = &unk_100024838;
  objc_copyWeak(&v15, &location);
  v7 = [v3 addObserverForName:v6 object:v4 queue:v5 usingBlock:v14];
  [(VOTQuickSettingsListViewController *)self setSettingsItemUpdateObserverToken:v7];

  v8 = +[AXSettings sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005434;
  v12[3] = &unk_100024860;
  objc_copyWeak(&v13, &location);
  [v8 registerUpdateBlock:v12 forRetrieveSelector:"voiceOverSelectedLanguage" withListener:self];

  objc_destroyWeak(&v13);
  v9 = +[AXSettings sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005474;
  v10[3] = &unk_100024860;
  objc_copyWeak(&v11, &location);
  [v9 registerUpdateBlock:v10 forRetrieveSelector:"voiceOverMediaDuckingMode" withListener:self];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    v4 = [(VOTQuickSettingsListViewController *)self filteredSpecifiers];

    if (v4) {
      [(VOTQuickSettingsListViewController *)self filteredSpecifiers];
    }
    else {
    uint64_t v5 = [(VOTQuickSettingsListViewController *)self allSpecifiers];
    }
    uint64_t v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;
  }
  v7 = *(void **)&self->PSListController_opaque[v3];

  return v7;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v5 = [a3 searchBar];
  v4 = [v5 text];
  [(VOTQuickSettingsListViewController *)self _filterContentForSearchText:v4];
}

- (NSArray)allSpecifiers
{
  allSpecifiers = self->_allSpecifiers;
  if (!allSpecifiers)
  {
    v26 = +[NSMutableArray array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v4 = +[VOSSettingsHelper sharedInstance];
    id v5 = [v4 userSettingsItems];

    id v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (!v6) {
      goto LABEL_18;
    }
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v11 = [v10 objectForKeyedSubscript:@"Included"];
        unsigned int v12 = [v11 BOOLValue];

        if (v12)
        {
          id v13 = [v10 objectForKeyedSubscript:@"Item"];
          v14 = +[VOSSettingsItem ScreenRecognition];
          if (v13 != v14)
          {

            goto LABEL_11;
          }
          id v15 = [(VOTQuickSettingsListViewController *)self data];
          objc_super v16 = [v15 frontmostAppIdentifier];
          int v17 = VOSProcessAllowsScreenRecognition();

          if (v17)
          {
LABEL_11:
            v18 = +[VOSSettingsItem Activities];
            if (v13 != v18)
            {

              goto LABEL_14;
            }
            v19 = +[AXSettings sharedInstance];
            v20 = [v19 voiceOverActivities];
            id v21 = [v20 count];

            if (v21)
            {
LABEL_14:
              v22 = [(VOTQuickSettingsListViewController *)self data];
              [v13 setSettingsData:v22];

              v23 = [(VOTQuickSettingsListViewController *)self _specifierForItem:v13];
              [(NSArray *)v26 addObject:v23];
            }
          }

          continue;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (!v7)
      {
LABEL_18:

        v24 = self->_allSpecifiers;
        self->_allSpecifiers = v26;

        allSpecifiers = self->_allSpecifiers;
        break;
      }
    }
  }

  return allSpecifiers;
}

- (BOOL)_isSearchBarEmpty
{
  v2 = [(VOTQuickSettingsListViewController *)self searchController];
  uint64_t v3 = [v2 searchBar];
  v4 = [v3 text];
  BOOL v5 = [v4 length] == 0;

  return v5;
}

- (BOOL)_isFiltering
{
  uint64_t v3 = [(VOTQuickSettingsListViewController *)self searchController];
  if ([v3 isActive]) {
    unsigned int v4 = ![(VOTQuickSettingsListViewController *)self _isSearchBarEmpty];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_filterContentForSearchText:(id)a3
{
  id v16 = a3;
  unsigned int v4 = [(VOTQuickSettingsListViewController *)self speakFilteredItemSummaryTimer];
  [v4 invalidate];

  if ([(VOTQuickSettingsListViewController *)self _isFiltering])
  {
    v14 = +[NSMutableArray array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [(VOTQuickSettingsListViewController *)self allSpecifiers];
    id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v21;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v9 = [v8 propertyForKey:@"VOSSettingsItem"];
          v10 = +[VOSSettingsHelper sharedInstance];
          id v11 = [v10 nameForItem:v9];
          unsigned int v12 = [v11 containsString:v16];

          if (v12) {
            [v14 addObject:v8];
          }
        }
        id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v5);
    }

    [(VOTQuickSettingsListViewController *)self setFilteredSpecifiers:v14];
  }
  else
  {
    [(VOTQuickSettingsListViewController *)self setFilteredSpecifiers:0];
  }
  [(VOTQuickSettingsListViewController *)self reloadSpecifiers];
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100005BBC;
  v17[3] = &unk_100024888;
  objc_copyWeak(&v18, &location);
  id v13 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v17 block:1.5];
  [(VOTQuickSettingsListViewController *)self setSpeakFilteredItemSummaryTimer:v13];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (id)_specifierForItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 itemType];
  if (v5 == (id)2 || v5 == (id)1)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = 0;
      uint64_t v8 = 6;
      goto LABEL_10;
    }
    v9 = VOTLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "unknown VOSSettingItem type", buf, 2u);
    }

    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = 2;
LABEL_10:
  v10 = +[VOSSettingsHelper sharedInstance];
  id v11 = [v10 nameForItem:v4];
  unsigned int v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"setSpecifierValue:specifier:" get:"specifierValue:" detail:v7 cell:v8 edit:0];

  [v12 setProperty:v4 forKey:@"VOSSettingsItem"];
  [v12 setProperty:v6 forKey:PSCellClassKey];

  return v12;
}

- (id)specifierValue:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"VOSSettingsItem"];
  id v4 = +[VOSSettingsHelper sharedInstance];
  id v5 = [v4 valueForSettingsItem:v3];

  uint64_t v6 = +[VOSSettingsHelper sharedInstance];
  uint64_t v7 = [v6 formattedValue:v5 withItem:v3];

  return v7;
}

- (void)setSpecifierValue:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v7 = [a4 propertyForKey:@"VOSSettingsItem"];
  uint64_t v6 = +[VOSSettingsHelper sharedInstance];
  [v6 setValue:v5 forSettingsItem:v7];
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (AXQuickSettingsData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void)setAllSpecifiers:(id)a3
{
}

- (NSArray)filteredSpecifiers
{
  return self->_filteredSpecifiers;
}

- (void)setFilteredSpecifiers:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (id)settingsItemUpdateObserverToken
{
  return self->_settingsItemUpdateObserverToken;
}

- (void)setSettingsItemUpdateObserverToken:(id)a3
{
}

- (NSTimer)speakFilteredItemSummaryTimer
{
  return self->_speakFilteredItemSummaryTimer;
}

- (void)setSpeakFilteredItemSummaryTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakFilteredItemSummaryTimer, 0);
  objc_storeStrong(&self->_settingsItemUpdateObserverToken, 0);
  objc_storeStrong((id *)&self->_filteredSpecifiers, 0);
  objc_storeStrong((id *)&self->_allSpecifiers, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_searchController, 0);
}

@end