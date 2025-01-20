@interface BuddyLanguageController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)hasBeenShown;
- (BOOL)ignoreForceLanguagePushes;
- (BOOL)shouldAllowStartOver;
- (BOOL)shouldStopInactivityTimer;
- (BOOL)showLocalizedNames;
- (BuddyLanguageComposite)languageComposite;
- (BuddyLanguageController)init;
- (BuddyLanguageLocaleSelectionReceiver)selectionReceiver;
- (NSArray)languageCodes;
- (NSDictionary)languageStrings;
- (OBAnimationController)animationController;
- (UITableView)languageTableView;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)internalMenuActions;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didBecomeActive:(id)a3;
- (void)_didResignActive:(id)a3;
- (void)_selectLanguage:(id)a3;
- (void)_updateLanguageList;
- (void)dealloc;
- (void)setAnimationController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasBeenShown:(BOOL)a3;
- (void)setIgnoreForceLanguagePushes:(BOOL)a3;
- (void)setLanguageComposite:(id)a3;
- (void)setLanguageTableView:(id)a3;
- (void)setSelectionReceiver:(id)a3;
- (void)setShowLocalizedNames:(BOOL)a3;
- (void)startOver;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyLanguageController

- (BuddyLanguageController)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyLanguageController;
  id location = [(BuddyLanguageController *)&v6 initWithTitle:&stru_1002B4E18 detailText:&stru_1002B4E18 icon:0 adoptTableViewScrollView:1];
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v2 addObserver:location selector:"_didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    v3 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v3 addObserver:location selector:"_didResignActive:" name:UIApplicationWillResignActiveNotification object:0];
  }
  v4 = (BuddyLanguageController *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (UITableView)languageTableView
{
  if (!self->_languageTableView)
  {
    v2 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    languageTableView = self->_languageTableView;
    self->_languageTableView = v2;

    [(UITableView *)self->_languageTableView registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];
    double v4 = sub_1000A60D4();
    -[UITableView setDirectionalLayoutMargins:](self->_languageTableView, "setDirectionalLayoutMargins:", v4, v5, v6, v7, *(void *)&v4, *(void *)&v5, *(void *)&v6, *(void *)&v7, *(void *)&v4, *(void *)&v5, *(void *)&v6, *(void *)&v7, a2);
    [(UITableView *)self->_languageTableView setDelegate:self];
    [(UITableView *)self->_languageTableView setDataSource:self];
    [(UITableView *)self->_languageTableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITableView *)self->_languageTableView _setDrawsSeparatorAtTopOfSections:1];
    [(UITableView *)self->_languageTableView setEstimatedRowHeight:60.0];
  }
  v8 = self->_languageTableView;

  return v8;
}

- (void)dealloc
{
  double v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)BuddyLanguageController;
  [(BuddyLanguageController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyLanguageController;
  [(BuddyLanguageController *)&v6 viewDidLoad];
  v2 = v8;
  objc_super v3 = [(BuddyLanguageController *)v8 languageTableView];
  [(BuddyLanguageController *)v2 setTableView:v3];

  id v4 = [(BuddyLanguageController *)v8 buddy_animationController:@"Language"];
  [(BuddyLanguageController *)v8 setAnimationController:v4];

  id v5 = [(BuddyLanguageController *)v8 view];
  [v5 layoutIfNeeded];
}

- (void)setShowLocalizedNames:(BOOL)a3
{
  self->_showLocalizedNames = a3;
  id v3 = [(BuddyLanguageController *)self tableView];
  [v3 reloadData];
}

- (BOOL)showLocalizedNames
{
  return self->_showLocalizedNames;
}

- (void)viewDidLayoutSubviews
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)BuddyLanguageController;
  [(BuddyLanguageController *)&v2 viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BuddyLanguageController;
  [(BuddyLanguageController *)&v11 viewWillAppear:a3];
  if ([(BuddyLanguageController *)v14 isMovingToParentViewController])
  {
    SEL v3 = [(BuddyLanguageController *)v14 languageComposite];
    id v4 = [(BuddyLanguageComposite *)v3 languageCodes];
    languageCodes = v14->_languageCodes;
    v14->_languageCodes = v4;

    objc_super v6 = [(BuddyLanguageController *)v14 languageComposite];
    SEL v7 = [(BuddyLanguageComposite *)v6 languageStrings];
    languageStrings = v14->_languageStrings;
    v14->_languageStrings = v7;

    id v9 = [(BuddyLanguageController *)v14 tableView];
    [v9 reloadData];
  }
  id v10 = [(BuddyLanguageController *)v14 view];
  [v10 layoutIfNeeded];
}

- (void)_didBecomeActive:(id)a3
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyLanguageController *)v19 setHasBeenShown:1];
  SEL v3 = [(BuddyLanguageController *)v19 animationController];
  [(OBAnimationController *)v3 startAnimation];

  id v4 = [(BuddyLanguageController *)v19 navigationController];
  id v5 = (BuddyLanguageController *)[v4 topViewController];
  objc_super v6 = v19;

  if (v5 == v6)
  {
    SEL v7 = +[NSUserDefaults standardUserDefaults];
    id v8 = [(NSUserDefaults *)v7 objectForKey:@"LockdownSetLanguage"];
    BOOL v9 = v8 != 0;

    BOOL v16 = v9;
    if (v9 && ![(BuddyLanguageController *)v19 ignoreForceLanguagePushes])
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = oslog;
        os_log_type_t v11 = v14;
        sub_10004B24C(v13);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Language override on first unlock; skipping language pane...",
          (uint8_t *)v13,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      BOOL v12 = [(BuddyLanguageController *)v19 delegate];
      [(BFFFlowItemDelegate *)v12 flowItemDone:v19];
    }
    int v17 = 0;
  }
  else
  {
    int v17 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_didResignActive:(id)a3
{
  os_log_type_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyLanguageController *)v11 navigationController];
  id v4 = (BuddyLanguageController *)[v3 topViewController];
  id v5 = v11;

  if (v4 == v5)
  {
    id v6 = [(BuddyLanguageController *)v11 buddy_animationController:@"Language"];
    [(BuddyLanguageController *)v11 setAnimationController:v6];

    SEL v7 = +[NSUserDefaults standardUserDefaults];
    id v8 = [(NSUserDefaults *)v7 objectForKey:@"LockdownSetLanguage"];
    BOOL v9 = v8 != 0;

    if (v9) {
      [(BuddyLanguageController *)v11 setIgnoreForceLanguagePushes:1];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)_selectLanguage:(id)a3
{
  int v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[BYLocationController sharedBuddyLocationController];
  id v4 = [v3 guessedCountries];
  id v15 = [v4 firstObject];

  id v14 = location[0];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100051470((uint64_t)buf, (uint64_t)location[0], (uint64_t)v15);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Did select language %@ with guessed region %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if ([v15 length])
  {
    id v5 = +[IntlUtility languageIdentifierFromIdentifier:location[0] withRegion:v15];
    id v6 = v14;
    id v14 = v5;

    +[NSLocale setLocaleAfterLanguageChange:v14];
  }
  SEL v7 = +[NSBundle mainBundle];
  id v8 = [(NSBundle *)v7 localizedStringForKey:@"SELECT_YOUR_LANGUAGE" value:&stru_1002B4E18 table:@"Localizable"];
  id v9 = [(BuddyLanguageController *)v17 navigationItem];
  [v9 setBackButtonTitle:v8];

  id v10 = [(BuddyLanguageController *)v17 navigationItem];
  [v10 setBackButtonDisplayMode:2];

  os_log_type_t v11 = [(BuddyLanguageController *)v17 selectionReceiver];
  [(BuddyLanguageLocaleSelectionReceiver *)v11 userSelectedLanguage:v14];

  BOOL v12 = [(BuddyLanguageController *)v17 delegate];
  [(BFFFlowItemDelegate *)v12 flowItemDone:v17];

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateLanguageList
{
  id v2 = [(BuddyLanguageController *)self tableView];
  [v2 reloadData];
}

- (void)setLanguageComposite:(id)a3
{
  SEL v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(BuddyLanguageController *)v13 hasBeenShown] && [(NSArray *)v13->_languageCodes count])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v10 = 2;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      id v3 = oslog;
      os_log_type_t v4 = v10;
      sub_10004B24C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v3, v4, "Language pane was presented; not updating language list...",
        buf,
        2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    objc_storeStrong((id *)&v13->_languageComposite, location[0]);
    id v5 = (NSArray *)[location[0] languageCodes];
    languageCodes = v13->_languageCodes;
    v13->_languageCodes = v5;

    SEL v7 = (NSDictionary *)[location[0] languageStrings];
    languageStrings = v13->_languageStrings;
    v13->_languageStrings = v7;

    [(BuddyLanguageController *)v13 _updateLanguageList];
  }
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)startOver
{
}

- (BOOL)shouldAllowStartOver
{
  return 1;
}

- (BOOL)shouldStopInactivityTimer
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(BuddyLanguageController *)v9 languageCodes];
  NSUInteger v6 = [(NSArray *)v5 count];

  objc_storeStrong(location, 0);
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = [location[0] dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v25];
  [v24 setAccessoryType:1];
  [v24 setMinimumHeight:60.0];
  id v23 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v23 pointSize];
  id v5 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  id v6 = [v24 titleLabel];
  [v6 setFont:v5];

  SEL v7 = [(BuddyLanguageController *)v27 languageCodes];
  id v22 = -[NSArray objectAtIndex:](v7, "objectAtIndex:", [v25 row]);

  id v8 = [(BuddyLanguageController *)v27 languageStrings];
  id obj = [(NSDictionary *)v8 objectForKey:v22];

  id v20 = sub_100147FCC(obj, v22);
  if ([(BuddyLanguageController *)v27 showLocalizedNames])
  {
    id v9 = +[NSLocale currentLocale];
    id v19 = [(NSLocale *)v9 localizedStringForLanguage:v22 context:4];

    id v18 = +[NSString localizedStringWithFormat:@" (%@ - %@)", v22, v19];
    id v17 = [v20 mutableCopy];
    id v10 = [objc_alloc((Class)NSAttributedString) initWithString:v18];
    [v17 appendAttributedString:v10];

    id v11 = [v17 copy];
    id v12 = v20;
    id v20 = v11;

    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  id v13 = v20;
  id v14 = [v24 titleLabel];
  [v14 setAttributedText:v13];

  id v15 = v24;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  [location[0] deselectRowAtIndexPath:v8 animated:1];
  id v5 = [(BuddyLanguageController *)v10 languageCodes];
  id v7 = -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", [v8 row]);

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)v7);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Tapped language %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyLanguageController *)v10 _selectLanguage:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)internalMenuActions
{
  id v17 = self;
  v16[1] = (id)a2;
  if ([(BuddyLanguageController *)self showLocalizedNames])
  {
    id v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    id v14 = sub_1000A75D8;
    id v15 = &unk_1002B1040;
    v16[0] = v17;
    id v2 = +[UIAlertAction actionWithTitle:@"Hide Translated Languages/Countries" style:0 handler:&v11];
    id v20 = v2;
    id v18 = +[NSArray arrayWithObjects:&v20 count:1];

    objc_storeStrong(v16, 0);
  }
  else
  {
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    id v8 = sub_1000A762C;
    id v9 = &unk_1002B1040;
    id v10 = v17;
    id v3 = +[UIAlertAction actionWithTitle:@"Show Translated Languages/Countries" style:0 handler:&v6];
    id v19 = v3;
    id v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1, v6, v7, v8, v9);

    objc_storeStrong((id *)&v10, 0);
  }
  os_log_type_t v4 = v18;

  return v4;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BuddyLanguageComposite)languageComposite
{
  return self->_languageComposite;
}

- (BuddyLanguageLocaleSelectionReceiver)selectionReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionReceiver);

  return (BuddyLanguageLocaleSelectionReceiver *)WeakRetained;
}

- (void)setSelectionReceiver:(id)a3
{
}

- (void)setLanguageTableView:(id)a3
{
}

- (NSDictionary)languageStrings
{
  return self->_languageStrings;
}

- (NSArray)languageCodes
{
  return self->_languageCodes;
}

- (BOOL)hasBeenShown
{
  return self->_hasBeenShown;
}

- (void)setHasBeenShown:(BOOL)a3
{
  self->_hasBeenShown = a3;
}

- (BOOL)ignoreForceLanguagePushes
{
  return self->_ignoreForceLanguagePushes;
}

- (void)setIgnoreForceLanguagePushes:(BOOL)a3
{
  self->_ignoreForceLanguagePushes = a3;
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end