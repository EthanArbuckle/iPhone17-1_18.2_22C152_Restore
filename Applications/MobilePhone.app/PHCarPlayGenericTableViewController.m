@interface PHCarPlayGenericTableViewController
- (AVExternalDevice)carPlayExternalDevice;
- (BOOL)_viewControllerWasSelected;
- (BOOL)tableViewReloadIsRequiredOnViewWillAppear;
- (NSString)badgeString;
- (PHCarPlayGenericTableViewController)init;
- (PHCarPlayNoContentBannerView)noContentBannerView;
- (UITableView)mainTableView;
- (_UIFilteredDataSource)mainTableViewDataSource;
- (double)defaultRowHeight;
- (id)preferredFocusEnvironments;
- (id)subtitleForNoContentBanner;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleForNoContentBanner;
- (int64_t)filterType;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)applicationBadgeChangedNotification:(id)a3;
- (void)carPlayInCallViewControllerAppearedNotification:(id)a3;
- (void)dealloc;
- (void)hardwareControlEventNotification:(id)a3;
- (void)limitedUIChanged:(id)a3;
- (void)loadView;
- (void)programmaticallySelectRowAtIndexPath:(id)a3;
- (void)setCarPlayExternalDevice:(id)a3;
- (void)setMainTableView:(id)a3;
- (void)setMainTableViewDataSource:(id)a3;
- (void)setNoContentBannerShown:(BOOL)a3;
- (void)setNoContentBannerView:(id)a3;
- (void)setTableViewReloadIsRequiredOnViewWillAppear:(BOOL)a3;
- (void)updateBadgeString;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHCarPlayGenericTableViewController

- (PHCarPlayGenericTableViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PHCarPlayGenericTableViewController;
  v2 = [(PHCarPlayGenericTableViewController *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)_UIFilteredDataSource);
    v4 = *(void **)(v2 + 25);
    *(void *)(v2 + 25) = v3;

    [*(id *)(v2 + 25) setTableDataSource:v2];
    [*(id *)(v2 + 25) setFilterType:[v2 filterType]];
    v5 = +[AVExternalDevice currentCarPlayExternalDevice];
    [v2 setCarPlayExternalDevice:v5];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"applicationBadgeChangedNotification:" name:PhoneRootViewControllerApplicationBadgeChangedNotification object:0];
    [v6 addObserver:v2 selector:"applicationBadgeChangedNotification:" name:@"PHCarPlayVoicemailManagerChangedNotification" object:0];
    uint64_t v7 = AVExternalDeviceLimitedUIChangedNotification;
    v8 = [v2 carPlayExternalDevice];
    [v6 addObserver:v2 selector:"limitedUIChanged:" name:v7 object:v8];
  }
  return (PHCarPlayGenericTableViewController *)v2;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [*(id *)(&self->_tableViewReloadIsRequiredOnViewWillAppear + 1) setDataSource:0];
  [*(id *)(&self->_tableViewReloadIsRequiredOnViewWillAppear + 1) setDelegate:0];
  [*(id *)((char *)&self->_mainTableView + 1) setTableDataSource:0];
  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayGenericTableViewController;
  [(PHCarPlayGenericTableViewController *)&v4 dealloc];
}

- (void)applicationBadgeChangedNotification:(id)a3
{
  objc_super v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarPlay table view controller told about badge changing (%@)", (uint8_t *)&v5, 0xCu);
  }

  [(PHCarPlayGenericTableViewController *)self updateBadgeString];
}

- (void)loadView
{
  id v3 = [(PHCarPlayGenericTableViewController *)self navigationController];
  [v3 setNavigationBarHidden:1 animated:0];

  id v5 = [objc_alloc((Class)UITableView) initWithFrame:0.0, 0.0, 50.0, 50.0];
  [(PHCarPlayGenericTableViewController *)self defaultRowHeight];
  [v5 setRowHeight:];
  [v5 setDelegate:self];
  objc_super v4 = [(PHCarPlayGenericTableViewController *)self mainTableViewDataSource];
  [v5 setDataSource:v4];

  [(PHCarPlayGenericTableViewController *)self setMainTableView:v5];
  [(PHCarPlayGenericTableViewController *)self setView:v5];
}

- (double)defaultRowHeight
{
  return 44.0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayGenericTableViewController;
  [(PHCarPlayGenericTableViewController *)&v8 viewWillAppear:a3];
  if ([(PHCarPlayGenericTableViewController *)self tableViewReloadIsRequiredOnViewWillAppear])
  {
    objc_super v4 = [(PHCarPlayGenericTableViewController *)self mainTableView];
    [v4 reloadData];

    [(PHCarPlayGenericTableViewController *)self setTableViewReloadIsRequiredOnViewWillAppear:0];
    id v5 = [(PHCarPlayGenericTableViewController *)self mainTableView];
    v6 = [(PHCarPlayGenericTableViewController *)self mainTableView];
    uint64_t v7 = [v6 indexPathForSelectedRow];
    [v5 deselectRowAtIndexPath:v7 animated:0];
  }
}

- (void)programmaticallySelectRowAtIndexPath:(id)a3
{
  id v3 = a3;
  objc_super v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHCarPlayGenericTableViewController: programmaticallySelectRowAtIndexPath:%@", (uint8_t *)&v5, 0xCu);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden by subclass", a4, "-[PHCarPlayGenericTableViewController tableView:cellForRowAtIndexPath:]");
  NSLog(@"** TUAssertion failure: %@", v6);

  if (_TUAssertShouldCrashApplication())
  {
    uint64_t v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PHCarPlayGenericTableViewController.m" lineNumber:107 description:@"%s must be overridden by subclass" -[PHCarPlayGenericTableViewController tableView:cellForRowAtIndexPath:]];
  }
  return 0;
}

- (void)hardwareControlEventNotification:(id)a3
{
  id v4 = a3;
  int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHCarPlayGenericTableViewController received hardware control event notification: %@", (uint8_t *)&v15, 0xCu);
  }

  if ([(PHCarPlayGenericViewController *)self shouldRespondToHardwareControlEvent])
  {
    id v6 = [v4 userInfo];
    uint64_t v7 = [v6 valueForKey:kTUCarPlayHardwareControlButtonKey];

    if (v7 == (void *)kTUCarPlayHardwareControlButtonGreenTelephone
      || v7 == (void *)kTUCarPlayHardwareControlButtonWhiteTelephone)
    {
      v9 = [(PHCarPlayGenericTableViewController *)self mainTableView];
      objc_super v10 = [v9 _indexPathsForHighlightedRows];
      id v11 = [v10 count];

      if (v11)
      {
        v12 = [(PHCarPlayGenericTableViewController *)self mainTableView];
        v13 = [v12 _indexPathsForHighlightedRows];
        v14 = [v13 objectAtIndex:0];
        [(PHCarPlayGenericTableViewController *)self programmaticallySelectRowAtIndexPath:v14];
      }
    }
  }
}

- (void)setNoContentBannerShown:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PHCarPlayGenericTableViewController *)self noContentBannerView];

  if (v3)
  {
    if (!v5)
    {
      id v6 = objc_alloc_init(PHCarPlayNoContentBannerView);
      uint64_t v7 = *(_UIFilteredDataSource **)((char *)&self->_mainTableViewDataSource + 1);
      *(_UIFilteredDataSource **)((char *)&self->_mainTableViewDataSource + 1) = (_UIFilteredDataSource *)v6;

      [*(id *)((char *)&self->_mainTableViewDataSource + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_super v8 = [(PHCarPlayGenericTableViewController *)self titleForNoContentBanner];
      [*(id *)((char *)&self->_mainTableViewDataSource + 1) setTitleString:v8];

      v9 = [(PHCarPlayGenericTableViewController *)self subtitleForNoContentBanner];
      [*(id *)((char *)&self->_mainTableViewDataSource + 1) setSubtitleString:v9];

      objc_super v10 = [(PHCarPlayGenericTableViewController *)self view];
      [v10 addSubview:*(_UIFilteredDataSource **)((char *)&self->_mainTableViewDataSource + 1)];

      id v33 = [(PHCarPlayGenericTableViewController *)self view];
      v32 = [v33 safeAreaLayoutGuide];
      v31 = [v32 topAnchor];
      v30 = [*(id *)((char *)&self->_mainTableViewDataSource + 1) topAnchor];
      v29 = [v31 constraintEqualToAnchor:v30];
      v35[0] = v29;
      v28 = [(PHCarPlayGenericTableViewController *)self view];
      v27 = [v28 safeAreaLayoutGuide];
      v26 = [v27 bottomAnchor];
      v25 = [*(id *)((char *)&self->_mainTableViewDataSource + 1) bottomAnchor];
      v24 = [v26 constraintEqualToAnchor:v25];
      v35[1] = v24;
      v23 = [(PHCarPlayGenericTableViewController *)self view];
      v22 = [v23 safeAreaLayoutGuide];
      id v11 = [v22 leftAnchor];
      v12 = [*(id *)((char *)&self->_mainTableViewDataSource + 1) leftAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      v35[2] = v13;
      v14 = [(PHCarPlayGenericTableViewController *)self view];
      int v15 = [v14 safeAreaLayoutGuide];
      id v16 = [v15 rightAnchor];
      v17 = [*(id *)((char *)&self->_mainTableViewDataSource + 1) rightAnchor];
      v18 = [v16 constraintEqualToAnchor:v17];
      v35[3] = v18;
      v19 = +[NSArray arrayWithObjects:v35 count:4];
      +[NSLayoutConstraint activateConstraints:v19];

      v20 = [(PHCarPlayGenericTableViewController *)self mainTableView];
      [v20 setSeparatorStyle:0];

      v21 = [(PHCarPlayGenericTableViewController *)self mainTableView];
      [v21 setScrollEnabled:0];
    }
  }
  else if (v5)
  {
    [*(id *)((char *)&self->_mainTableViewDataSource + 1) removeFromSuperview];
    [(PHCarPlayGenericTableViewController *)self setNoContentBannerView:0];
    id v34 = [(PHCarPlayGenericTableViewController *)self mainTableView];
    [v34 setScrollEnabled:1];
  }
}

- (id)titleForNoContentBanner
{
  return @"No Content";
}

- (id)subtitleForNoContentBanner
{
  return 0;
}

- (NSString)badgeString
{
  return 0;
}

- (void)updateBadgeString
{
  BOOL v3 = [(PHCarPlayGenericTableViewController *)self badgeString];
  id v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    objc_super v8 = v3;
    __int16 v9 = 2112;
    objc_super v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting tab bar badge to %@ for %@", (uint8_t *)&v7, 0x16u);
  }

  int v5 = [(PHCarPlayGenericTableViewController *)self badgeString];
  id v6 = [(PHCarPlayGenericTableViewController *)self tabBarItem];
  [v6 setBadgeValue:v5];
}

- (void)carPlayInCallViewControllerAppearedNotification:(id)a3
{
  id v6 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  id v4 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  int v5 = [v4 indexPathForSelectedRow];
  [v6 deselectRowAtIndexPath:v5 animated:0];
}

- (int64_t)filterType
{
  v2 = +[AVExternalDevice currentCarPlayExternalDevice];
  int64_t v3 = [v2 limitedUI];

  return v3;
}

- (void)limitedUIChanged:(id)a3
{
}

void __56__PHCarPlayGenericTableViewController_limitedUIChanged___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) mainTableViewDataSource];
  [v2 setFilterType:[*(id *)(a1 + 32) filterType]];

  id v3 = [*(id *)(a1 + 32) mainTableView];
  [v3 reloadData];
}

- (BOOL)_viewControllerWasSelected
{
  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayGenericTableViewController;
  unsigned __int8 v3 = [(PHCarPlayGenericTableViewController *)&v7 _viewControllerWasSelected];
  id v4 = [(PHCarPlayGenericTableViewController *)self mainTableView];

  if (v4)
  {
    int v5 = [(PHCarPlayGenericTableViewController *)self mainTableView];
    unsigned __int8 v3 = [v5 _highlightFirstVisibleRowIfAppropriate];
  }
  return v3;
}

- (id)preferredFocusEnvironments
{
  unsigned __int8 v3 = [(PHCarPlayGenericTableViewController *)self mainTableView];

  if (v3)
  {
    id v4 = [(PHCarPlayGenericTableViewController *)self mainTableView];
    objc_super v8 = v4;
    int v5 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PHCarPlayGenericTableViewController;
    int v5 = [(PHCarPlayGenericTableViewController *)&v7 preferredFocusEnvironments];
  }

  return v5;
}

- (UITableView)mainTableView
{
  return (UITableView *)objc_getProperty(self, a2, 17, 1);
}

- (void)setMainTableView:(id)a3
{
}

- (_UIFilteredDataSource)mainTableViewDataSource
{
  return (_UIFilteredDataSource *)objc_getProperty(self, a2, 25, 1);
}

- (void)setMainTableViewDataSource:(id)a3
{
}

- (BOOL)tableViewReloadIsRequiredOnViewWillAppear
{
  return *(&self->super._respondsToEventsWhileInCall + 1);
}

- (void)setTableViewReloadIsRequiredOnViewWillAppear:(BOOL)a3
{
  *(&self->super._respondsToEventsWhileInCall + 1) = a3;
}

- (PHCarPlayNoContentBannerView)noContentBannerView
{
  return (PHCarPlayNoContentBannerView *)objc_getProperty(self, a2, 33, 1);
}

- (void)setNoContentBannerView:(id)a3
{
}

- (AVExternalDevice)carPlayExternalDevice
{
  return (AVExternalDevice *)objc_getProperty(self, a2, 41, 1);
}

- (void)setCarPlayExternalDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_noContentBannerView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_mainTableViewDataSource + 1), 0);
  objc_storeStrong((id *)((char *)&self->_mainTableView + 1), 0);

  objc_storeStrong((id *)(&self->_tableViewReloadIsRequiredOnViewWillAppear + 1), 0);
}

@end