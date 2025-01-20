@interface CBLanguageSelectorViewController
- (BOOL)hasBeenShown;
- (BOOL)ignoreForceLanguagePushes;
- (CBLanguageComposite)languageComposite;
- (CBLanguageSelectorViewController)init;
- (NSArray)languageCodes;
- (NSDictionary)languageStrings;
- (NSDictionary)locales;
- (NSString)currentLocaleCode;
- (OBAnimationController)animationController;
- (UIActivityIndicatorView)activityView;
- (UITableView)languageTableView;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didBecomeActive:(id)a3;
- (void)_didResignActive:(id)a3;
- (void)_hideActivityView;
- (void)_refreshLanguageStrings;
- (void)_selectLanguage:(id)a3;
- (void)_showActivityView;
- (void)dealloc;
- (void)setActivityView:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setCurrentLocaleCode:(id)a3;
- (void)setHasBeenShown:(BOOL)a3;
- (void)setIgnoreForceLanguagePushes:(BOOL)a3;
- (void)setLanguageComposite:(id)a3;
- (void)setLanguageTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CBLanguageSelectorViewController

- (CBLanguageSelectorViewController)init
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"LANGUAGE_SELECTION" value:&stru_10007A9F8 table:0];
  v10.receiver = self;
  v10.super_class = (Class)CBLanguageSelectorViewController;
  v5 = [(CBLanguageSelectorViewController *)&v10 initWithTitle:v4 detailText:&stru_10007A9F8 icon:0 adoptTableViewScrollView:1];

  if (v5)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"_didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v5 selector:"_didResignActive:" name:UIApplicationWillResignActiveNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v5 selector:"_languageSelectorScanComplete:" name:@"CBLanguageCompositeWifiScanComplete" object:0];
  }
  return v5;
}

- (UITableView)languageTableView
{
  languageTableView = self->_languageTableView;
  if (!languageTableView)
  {
    v4 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v5 = self->_languageTableView;
    self->_languageTableView = v4;

    [(UITableView *)self->_languageTableView registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];
    -[UITableView setDirectionalLayoutMargins:](self->_languageTableView, "setDirectionalLayoutMargins:", 1.0, 1.0, 1.0, 1.0);
    [(UITableView *)self->_languageTableView setDelegate:self];
    [(UITableView *)self->_languageTableView setDataSource:self];
    [(UITableView *)self->_languageTableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITableView *)self->_languageTableView _setDrawsSeparatorAtTopOfSections:1];
    [(UITableView *)self->_languageTableView setEstimatedRowHeight:60.0];
    v6 = +[UIColor clearColor];
    [(UITableView *)self->_languageTableView setBackgroundColor:v6];

    languageTableView = self->_languageTableView;
  }

  return languageTableView;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CBLanguageSelectorViewController;
  [(CBLanguageSelectorViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CBLanguageSelectorViewController;
  [(CBLanguageSelectorViewController *)&v7 viewDidLoad];
  [(CBLanguageSelectorViewController *)self setModalPresentationStyle:2];
  v3 = [(CBLanguageSelectorViewController *)self languageTableView];
  [(CBLanguageSelectorViewController *)self setTableView:v3];

  id v4 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(CBLanguageSelectorViewController *)self setActivityView:v4];

  v5 = [(CBLanguageSelectorViewController *)self animationController:@"Language"];
  [(CBLanguageSelectorViewController *)self setAnimationController:v5];

  v6 = [(CBLanguageSelectorViewController *)self view];
  [v6 layoutIfNeeded];
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)CBLanguageSelectorViewController;
  [(CBLanguageSelectorViewController *)&v2 viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CBLanguageSelectorViewController;
  [(CBLanguageSelectorViewController *)&v7 viewWillAppear:a3];
  id v4 = +[UIColor whiteColor];
  v5 = [(CBLanguageSelectorViewController *)self view];
  [v5 setBackgroundColor:v4];

  if ([(CBLanguageSelectorViewController *)self isMovingToParentViewController])[(CBLanguageSelectorViewController *)self _refreshLanguageStrings]; {
  v6 = [(CBLanguageSelectorViewController *)self view];
  }
  [v6 layoutIfNeeded];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CBLanguageSelectorViewController;
  [(CBLanguageSelectorViewController *)&v5 viewDidAppear:a3];
  id v4 = [(CBLanguageSelectorViewController *)self animationController];
  [v4 startAnimation];
}

- (void)_didBecomeActive:(id)a3
{
  [(CBLanguageSelectorViewController *)self setHasBeenShown:1];
  id v4 = [(CBLanguageSelectorViewController *)self navigationController];
  objc_super v5 = [v4 topViewController];

  if (v5 == self)
  {
    id v6 = [(CBLanguageSelectorViewController *)self animationController];
    [v6 startAnimation];
  }
}

- (void)_didResignActive:(id)a3
{
  id v4 = [(CBLanguageSelectorViewController *)self navigationController];
  objc_super v5 = [v4 topViewController];

  if (v5 == self)
  {
    id v6 = [(CBLanguageSelectorViewController *)self animationController:@"Language"];
    [(CBLanguageSelectorViewController *)self setAnimationController:v6];
  }
}

- (void)_refreshLanguageStrings
{
  v3 = [(CBLanguageSelectorViewController *)self languageComposite];
  id v4 = [v3 languageCodes];
  languageCodes = self->_languageCodes;
  self->_languageCodes = v4;

  id v6 = [(CBLanguageSelectorViewController *)self languageComposite];
  objc_super v7 = [v6 languageStrings];
  languageStrings = self->_languageStrings;
  self->_languageStrings = v7;

  v9 = [(CBLanguageSelectorViewController *)self languageComposite];
  objc_super v10 = [v9 locales];
  locales = self->_locales;
  self->_locales = v10;

  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003A6B4;
  v12[3] = &unk_100079608;
  objc_copyWeak(&v13, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_selectLanguage:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003A7FC;
  v5[3] = &unk_1000794E0;
  id v6 = a3;
  id v4 = v6;
  [(CBLanguageSelectorViewController *)self dismissViewControllerAnimated:1 completion:v5];
}

- (void)_showActivityView
{
  v3 = [(CBLanguageSelectorViewController *)self view];
  id v4 = [(CBLanguageSelectorViewController *)self activityView];
  [v3 addSubview:v4];

  objc_super v5 = [(CBLanguageSelectorViewController *)self activityView];
  [v5 startAnimating];

  id v6 = [(CBLanguageSelectorViewController *)self activityView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [(CBLanguageSelectorViewController *)self activityView];
  objc_super v7 = [v17 topAnchor];
  v8 = [(CBLanguageSelectorViewController *)self headerView];
  v9 = [v8 bottomAnchor];
  objc_super v10 = [v7 constraintEqualToAnchor:v9 constant:64.0];
  v18[0] = v10;
  v11 = [(CBLanguageSelectorViewController *)self activityView];
  v12 = [v11 centerXAnchor];
  id v13 = [(CBLanguageSelectorViewController *)self view];
  v14 = [v13 centerXAnchor];
  v15 = [v12 constraintEqualToAnchor:v14 constant:0.0];
  v18[1] = v15;
  v16 = +[NSArray arrayWithObjects:v18 count:2];
  +[NSLayoutConstraint activateConstraints:v16];
}

- (void)_hideActivityView
{
  v3 = [(CBLanguageSelectorViewController *)self activityView];
  [v3 stopAnimating];

  id v4 = [(CBLanguageSelectorViewController *)self activityView];
  [v4 removeFromSuperview];
}

- (void)setLanguageComposite:(id)a3
{
  id v5 = a3;
  if ([(CBLanguageSelectorViewController *)self hasBeenShown]
    && [(NSArray *)self->_languageCodes count])
  {
    id v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Language pane was presented; not updating language list...",
        v10,
        2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_languageComposite, a3);
    objc_super v7 = +[NSLocale currentLocale];
    v8 = [v7 localeIdentifier];
    currentLocaleCode = self->_currentLocaleCode;
    self->_currentLocaleCode = v8;

    [(CBLanguageSelectorViewController *)self _refreshLanguageStrings];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(CBLanguageSelectorViewController *)self languageCodes];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v6];
  [v7 setMinimumHeight:60.0];
  v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v8 pointSize];
  v9 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  objc_super v10 = [v7 titleLabel];
  [v10 setFont:v9];

  v11 = [(CBLanguageSelectorViewController *)self languageCodes];
  id v12 = [v6 row];

  id v13 = [v11 objectAtIndex:v12];

  v14 = [(CBLanguageSelectorViewController *)self languageStrings];
  v15 = [v14 objectForKey:v13];

  v16 = sub_10003AE68(v15, v13);
  v17 = [(CBLanguageSelectorViewController *)self locales];
  v18 = [v17 objectForKey:v13];

  v19 = +[NSLocale currentLocale];
  v20 = [v19 languageCode];
  v21 = [v18 languageCode];
  unsigned int v22 = [v20 isEqualToString:v21];

  if (v22)
  {
    v23 = [v19 scriptCode];

    if (v23)
    {
      uint64_t v24 = [v18 scriptCode];

      if (v24)
      {
        v25 = [v19 scriptCode];
        v26 = [v18 scriptCode];
        unsigned int v27 = [v25 isEqualToString:v26];

        if (v27) {
          uint64_t v24 = 3;
        }
        else {
          uint64_t v24 = 0;
        }
      }
    }
    else
    {
      uint64_t v24 = 3;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  v28 = [v7 titleLabel];
  [v28 setAttributedText:v16];

  [v7 setAccessoryType:v24];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  objc_super v7 = [(CBLanguageSelectorViewController *)self languageCodes];
  id v8 = [v6 row];

  v9 = [v7 objectAtIndexedSubscript:v8];

  objc_super v10 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Tapped language %@", (uint8_t *)&v11, 0xCu);
  }

  [(CBLanguageSelectorViewController *)self _selectLanguage:v9];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (CBLanguageComposite)languageComposite
{
  return self->_languageComposite;
}

- (void)setLanguageTableView:(id)a3
{
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
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

- (NSDictionary)locales
{
  return self->_locales;
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

- (NSString)currentLocaleCode
{
  return self->_currentLocaleCode;
}

- (void)setCurrentLocaleCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocaleCode, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_languageCodes, 0);
  objc_storeStrong((id *)&self->_languageStrings, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_languageTableView, 0);

  objc_storeStrong((id *)&self->_languageComposite, 0);
}

@end