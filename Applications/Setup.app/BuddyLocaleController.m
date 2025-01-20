@interface BuddyLocaleController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)_postLanguageReboot;
- (BOOL)controllerNeedsToRun;
- (BOOL)isResumingFromLanguageReboot;
- (BOOL)showLocalizedNames;
- (BYPreferencesController)buddyPreferences;
- (BuddyLanguageLocaleSelectionReceiver)selectionReceiver;
- (BuddyLocaleComposite)localeComposite;
- (BuddyLocaleController)init;
- (BuddyTableSectionHeaderView)sectionHeader;
- (NSString)language;
- (OBAnimationController)animationController;
- (UITableView)buddyLocaleTableView;
- (double)_topPaddingForSectionHeader;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_micaAssetName;
- (id)_micaAssetNameForRegion:(int64_t)a3;
- (id)countryAtIndexPath:(id)a3;
- (id)displayLanguage;
- (id)headerTitle;
- (id)internalMenuActions;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_loadSavedStatePostLanguageReboot;
- (void)_updateChromelessBar:(id)a3;
- (void)controllerWasPopped;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
- (void)selectCountry:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setBuddyLocaleTableView:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLocaleComposite:(id)a3;
- (void)setResumingFromLanguageReboot:(BOOL)a3;
- (void)setSectionHeader:(id)a3;
- (void)setSelectionReceiver:(id)a3;
- (void)setShowLocalizedNames:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BuddyLocaleController

- (BuddyLocaleController)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyLocaleController;
  id location = [(BuddyLocaleController *)&v4 initWithTitle:&stru_1002B4E18 detailText:&stru_1002B4E18 symbolName:0 adoptTableViewScrollView:1];
  v2 = (BuddyLocaleController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)loadView
{
  SEL v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyLocaleController;
  [(BuddyLocaleController *)&v3 loadView];
  id v2 = [(BuddyLocaleController *)v5 navigationItem];
  [v2 _setManualScrollEdgeAppearanceEnabled:1];
}

- (void)viewDidLoad
{
  v41 = self;
  SEL v40 = a2;
  v39.receiver = self;
  v39.super_class = (Class)BuddyLocaleController;
  [(BuddyLocaleController *)&v39 viewDidLoad];
  id v2 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(BuddyLocaleController *)v41 setBuddyLocaleTableView:v2];

  objc_super v3 = [(BuddyLocaleController *)v41 buddyLocaleTableView];
  [(UITableView *)v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];

  *(void *)&long long v37 = sub_1000A8748();
  *((void *)&v37 + 1) = v4;
  *(void *)&long long v38 = v5;
  *((void *)&v38 + 1) = v6;
  v7 = [(BuddyLocaleController *)v41 buddyLocaleTableView];
  long long v36 = v38;
  long long v35 = v37;
  -[UITableView setDirectionalLayoutMargins:](v7, "setDirectionalLayoutMargins:", v37, v38);

  v8 = v41;
  v9 = [(BuddyLocaleController *)v41 buddyLocaleTableView];
  [(UITableView *)v9 setDelegate:v8];

  v10 = v41;
  v11 = [(BuddyLocaleController *)v41 buddyLocaleTableView];
  [(UITableView *)v11 setDataSource:v10];

  v12 = [(BuddyLocaleController *)v41 buddyLocaleTableView];
  [(UITableView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(BuddyLocaleController *)v41 buddyLocaleTableView];
  [(UITableView *)v13 _setDrawsSeparatorAtTopOfSections:1];

  id v14 = [(BuddyLocaleController *)v41 view];
  v15 = [(BuddyLocaleController *)v41 buddyLocaleTableView];
  [v14 addSubview:v15];

  [(BuddyLocaleController *)v41 _loadSavedStatePostLanguageReboot];
  v16 = [(BuddyLocaleController *)v41 language];
  NSWritingDirection v17 = +[NSParagraphStyle defaultWritingDirectionForLanguage:v16];

  if (v17 == NSWritingDirectionRightToLeft)
  {
    id v18 = [(BuddyLocaleController *)v41 view];
    [v18 buddy_setSemanticContentAttributeRecursively:4];
  }
  else
  {
    id v18 = [(BuddyLocaleController *)v41 view];
    [v18 buddy_setSemanticContentAttributeRecursively:3];
  }

  v19 = v41;
  v20 = [(BuddyLocaleController *)v41 buddyLocaleTableView];
  [(BuddyLocaleController *)v19 setTableView:v20];

  if ([(BuddyLocaleController *)v41 isResumingFromLanguageReboot])
  {
    id v21 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 2" darkStateName:@"Dark 2" transitionDuration:1.0 transitionSpeed:0.5];
    id v42 = v21;
    id location = +[NSArray arrayWithObjects:&v42 count:1];

    v22 = v41;
    id v23 = [(BuddyLocaleController *)v41 _micaAssetName];
    id v24 = [(BuddyLocaleController *)v22 buddy_animationController:v23 animatedStates:location startAtFirstState:1];
    [(BuddyLocaleController *)v41 setAnimationController:v24];

    objc_storeStrong(&location, 0);
  }
  else
  {
    v25 = v41;
    id v26 = [(BuddyLocaleController *)v41 _micaAssetName];
    id v27 = [(BuddyLocaleController *)v25 buddy_animationController:v26];
    [(BuddyLocaleController *)v41 setAnimationController:v27];
  }
  v28 = v41;
  v29 = [(BuddyLocaleController *)v41 buddyLocaleTableView];
  [(UITableView *)v29 setDelegate:v28];

  id v30 = [(BuddyLocaleController *)v41 headerView];
  id v31 = [(BuddyLocaleController *)v41 headerTitle];
  [v30 setTitle:v31];

  id v32 = [(BuddyLocaleController *)v41 headerView];
  v33 = [(BuddyLocaleController *)v41 language];
  [v32 setLanguage:v33];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15 = self;
  SEL v14 = a2;
  BOOL v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BuddyLocaleController;
  [(BuddyLocaleController *)&v12 viewWillAppear:a3];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_1000A8954;
  v10 = &unk_1002B0D20;
  v11 = v15;
  NSWritingDirection v17 = (dispatch_once_t *)&unk_100321B98;
  id location = 0;
  objc_storeStrong(&location, &v7);
  if (*v17 != -1) {
    dispatch_once(v17, location);
  }
  objc_storeStrong(&location, 0);
  id v3 = [(BuddyLocaleController *)v15 navigationItem];
  [v3 _setManualScrollEdgeAppearanceProgress:0.0];

  uint64_t v4 = v15;
  uint64_t v5 = [(BuddyLocaleController *)v15 buddyLocaleTableView];
  [(BuddyLocaleController *)v4 _updateChromelessBar:v5];

  if (![(BuddyLocaleController *)v15 isResumingFromLanguageReboot])
  {
    uint64_t v6 = [(BuddyLocaleController *)v15 animationController];
    [(OBAnimationController *)v6 startAnimation];
  }
  objc_storeStrong((id *)&v11, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGSize v26 = a3;
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v23.receiver = v25;
  v23.super_class = (Class)BuddyLocaleController;
  -[BuddyLocaleController viewWillTransitionToSize:withTransitionCoordinator:](&v23, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v26.width, v26.height);
  uint64_t v4 = [(BuddyLocaleController *)v25 buddyLocaleTableView];
  id v5 = [(BuddyLocaleController *)v25 view];
  [v5 center];
  v21[3] = v6;
  v21[4] = v7;
  uint64_t v8 = [(BuddyLocaleController *)v25 buddyLocaleTableView];
  [(UITableView *)v8 contentOffset];
  v21[1] = v9;
  v21[2] = v10;
  sub_1000A8CC8();
  v21[5] = v11;
  v21[6] = v12;
  id v22 = -[UITableView indexPathForRowAtPoint:](v4, "indexPathForRowAtPoint:", *(double *)&v11, *(double *)&v12);

  id v13 = location[0];
  id v14 = [(BuddyLocaleController *)v25 view];
  v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  id v18 = sub_1000A8D44;
  v19 = &unk_1002B2190;
  v20 = v25;
  v21[0] = v22;
  [v13 animateAlongsideTransitionInView:v14 animation:&stru_1002B2168 completion:&v15];

  objc_storeStrong(v21, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (id)headerTitle
{
  id v2 = [(BuddyLocaleController *)self language];
  NSUInteger v3 = [(NSString *)v2 length];

  uint64_t v4 = +[NSBundle mainBundle];
  if (v3)
  {
    id v5 = [(BuddyLocaleController *)self language];
    uint64_t v8 = (NSString *)(id)SFLocalizedStringFromTableInBundleForLanguage();
  }
  else
  {
    uint64_t v8 = [(NSBundle *)v4 localizedStringForKey:@"SELECT_COUNTRY_OR_REGION" value:&stru_1002B4E18 table:@"Localizable"];
  }

  return v8;
}

- (void)setShowLocalizedNames:(BOOL)a3
{
  self->_showLocalizedNames = a3;
  NSUInteger v3 = [(BuddyLocaleController *)self buddyLocaleTableView];
  [(UITableView *)v3 reloadData];
}

- (BOOL)_postLanguageReboot
{
  id v2 = [(BuddyLocaleController *)self localeComposite];
  [(BuddyLocaleComposite *)v2 scrollOffset];
  BOOL v4 = v3 >= 0.0;

  return v4;
}

- (void)_loadSavedStatePostLanguageReboot
{
  if ([(BuddyLocaleController *)self _postLanguageReboot])
  {
    id v2 = [(BuddyLocaleController *)self buddyLocaleTableView];
    [(UITableView *)v2 reloadData];

    double v3 = [(BuddyLocaleController *)self buddyLocaleTableView];
    BOOL v4 = [(BuddyLocaleController *)self localeComposite];
    [(BuddyLocaleComposite *)v4 scrollOffset];
    sub_1000A8CC8();
    -[UITableView setContentOffset:animated:](v3, "setContentOffset:animated:", 0, v5, v6, *(void *)&v5, *(void *)&v6);
  }
}

- (void)_updateChromelessBar:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] contentOffset];
  if (v3 <= 0.0)
  {
    id v6 = [(BuddyLocaleController *)v9 navigationItem];
    [v6 _setManualScrollEdgeAppearanceProgress:0.0];
  }
  else
  {
    [location[0] contentOffset:v3];
    double v7 = fmin(v4 * 10.0, 100.0) / 100.0;
    id v6 = [(BuddyLocaleController *)v9 navigationItem];
    [v6 _setManualScrollEdgeAppearanceProgress:v7];
  }

  objc_storeStrong(location, 0);
}

- (void)selectCountry:(id)a3
{
  int v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v14 = [(BuddyLocaleController *)v17 language];
    if (!v14)
    {
      double v3 = +[NSLocale preferredLanguages];
      id v14 = [(NSArray *)v3 firstObject];
    }
    id v13 = [location[0] code];
    if ([v14 length] && objc_msgSend(v13, "length"))
    {
      id v4 = +[IntlUtility languageIdentifierFromIdentifier:v14 withRegion:v13];
      id v5 = v14;
      id v14 = v4;
    }
    id v6 = +[NSUserDefaults standardUserDefaults];
    [(NSUserDefaults *)v6 setBool:1 forKey:@"UserChoseLanguage"];

    double v7 = [(BuddyLocaleController *)v17 selectionReceiver];
    uint64_t v8 = [(BuddyLocaleController *)v17 buddyLocaleTableView];
    [(UITableView *)v8 contentOffset];
    char v11 = -[BuddyLanguageLocaleSelectionReceiver userSelectedLanguageWithLocale:countryCode:localePaneScrollOffset:](v7, "userSelectedLanguageWithLocale:countryCode:localePaneScrollOffset:", v14, v13, v10, v9, *(void *)&v10) ^ 1;

    if (v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v17->_delegate);
      [WeakRetained flowItemDone:v17];
    }
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    int v15 = 0;
  }
  else
  {
    int v15 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)countryAtIndexPath:(id)a3
{
  int v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  id v13 = [location[0] section];
  if (v13)
  {
    if (v13 == (id)1)
    {
      double v7 = [(BuddyLocaleController *)v16 localeComposite];
      uint64_t v8 = [(BuddyLocaleComposite *)v7 dataSource];
      id v9 = -[BYLocaleDataSource otherLocaleAtIndex:](v8, "otherLocaleAtIndex:", [location[0] row]);
      id v10 = v14;
      id v14 = v9;
    }
  }
  else
  {
    double v3 = [(BuddyLocaleController *)v16 localeComposite];
    id v4 = [(BuddyLocaleComposite *)v3 dataSource];
    id v5 = -[BYLocaleDataSource recommendedLocaleAtIndex:](v4, "recommendedLocaleAtIndex:", [location[0] row]);
    id v6 = v14;
    id v14 = v5;
  }
  id v11 = v14;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (void)setLocaleComposite:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v5->_localeComposite, location[0]);
  id v3 = [location[0] language];
  [(BuddyLocaleController *)v5 setLanguage:v3];

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

- (BOOL)controllerNeedsToRun
{
  objc_super v12 = self;
  v11[1] = (id)a2;
  id v2 = [(BuddyLocaleController *)self language];

  if (v2)
  {
    char v13 = 1;
  }
  else if ([(BuddyLocaleController *)v12 isResumingFromLanguageReboot])
  {
    char v13 = 1;
  }
  else
  {
    id v3 = [(BuddyLocaleController *)v12 buddyPreferences];
    v11[0] = [(BYPreferencesController *)v3 objectForKey:@"LockdownSetLanguage"];

    id v4 = [(BuddyLocaleController *)v12 buddyPreferences];
    id location = [(BYPreferencesController *)v4 objectForKey:@"Locale"];

    id v5 = [(BuddyLocaleController *)v12 buddyPreferences];
    id v9 = [(BYPreferencesController *)v5 objectForKey:@"Language"];

    BOOL v6 = 0;
    if (!location)
    {
      BOOL v7 = 0;
      if (v11[0]) {
        BOOL v7 = v9 == 0;
      }
      BOOL v6 = !v7;
    }
    char v13 = v6;
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&location, 0);
    objc_storeStrong(v11, 0);
  }
  return v13 & 1;
}

- (void)controllerWasPopped
{
  id v2 = [(BuddyLocaleController *)self buddyPreferences];
  [(BYPreferencesController *)v2 removeObjectForKey:@"Locale"];
}

- (id)displayLanguage
{
  return [(BuddyLocaleController *)self language];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyLocaleController *)v4 _updateChromelessBar:location[0]];
  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4)
  {
    if (a4 == 1)
    {
      BOOL v7 = [(BuddyLocaleController *)v11 localeComposite];
      uint64_t v8 = [(BuddyLocaleComposite *)v7 dataSource];
      id v12 = [(BYLocaleDataSource *)v8 numberOfOtherLocales];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v5 = [(BuddyLocaleController *)v11 localeComposite];
    BOOL v6 = [(BuddyLocaleComposite *)v5 dataSource];
    id v12 = [(BYLocaleDataSource *)v6 numberOfRecommendedLocales];
  }
  objc_storeStrong(location, 0);
  return (int64_t)v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  id v28 = [location[0] dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v29];
  [v28 setAccessoryType:1];
  [v28 setMinimumHeight:60.0];
  id v27 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v27 pointSize];
  id v5 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  id v6 = [v28 titleLabel];
  [v6 setFont:v5];

  id v26 = [(BuddyLocaleController *)v31 countryAtIndexPath:v29];
  id v25 = [v26 name];
  BOOL v7 = [(BuddyLocaleController *)v31 language];
  id v24 = sub_100147FCC(v25, v7);

  if ([(BuddyLocaleController *)v31 showLocalizedNames])
  {
    uint64_t v8 = +[NSLocale currentLocale];
    id v9 = [v26 code];
    id v23 = [(NSLocale *)v8 localizedStringForRegion:v9 context:4 short:1];

    id v10 = [v26 code];
    id v22 = +[NSString stringWithFormat:@" (%@ - %@)", v10, v23];

    id v21 = [v24 mutableCopy];
    id v11 = [objc_alloc((Class)NSAttributedString) initWithString:v22];
    [v21 appendAttributedString:v11];

    id v12 = [v21 copy];
    id v13 = v24;
    id v24 = v12;

    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  id v14 = v24;
  id v15 = [v28 titleLabel];
  [v15 setAttributedText:v14];

  int v16 = [(BuddyLocaleController *)v31 language];
  if ((id)+[NSParagraphStyle defaultWritingDirectionForLanguage:v16] == (id)1)uint64_t v17 = 2; {
  else
  }
    uint64_t v17 = 0;
  id v18 = [v28 titleLabel];
  [v18 setTextAlignment:v17];

  id v19 = v28;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v19;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4 == 1)
  {
    id v5 = [(BuddyLocaleController *)v12 language];
    NSUInteger v6 = [(NSString *)v5 length];

    BOOL v7 = +[NSBundle mainBundle];
    if (v6)
    {
      uint64_t v8 = [(BuddyLocaleController *)v12 language];
      id v13 = (NSString *)(id)SFLocalizedStringFromTableInBundleForLanguage();
    }
    else
    {
      id v13 = [(NSBundle *)v7 localizedStringForKey:@"MORE_COUNTRIES_AND_REGIONS" value:&stru_1002B4E18 table:@"Localizable"];
    }
  }
  else
  {
    id v13 = 0;
  }
  objc_storeStrong(location, 0);
  id v9 = v13;

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  [location[0] deselectRowAtIndexPath:v7 animated:1];
  id v5 = v9;
  id v6 = [(BuddyLocaleController *)v9 countryAtIndexPath:v7];
  [(BuddyLocaleController *)v5 selectCountry:v6];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
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

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  long long v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v35 = a4;
  if (a4)
  {
    id v5 = [(BuddyLocaleController *)v37 sectionHeader];
    BOOL v6 = v5 == 0;

    if (v6)
    {
      [(BuddyLocaleController *)v37 _topPaddingForSectionHeader];
      v33[5] = v7;
      uint64_t v8 = [BuddyTableSectionHeaderView alloc];
      sub_1000AA418();
      v33[1] = v9;
      v33[2] = v10;
      v33[3] = v11;
      v33[4] = v12;
      id v13 = -[BuddyTableSectionHeaderView initWithPadding:](v8, "initWithPadding:", *(double *)&v9, *(double *)&v10, *(double *)&v11, *(double *)&v12);
      [(BuddyLocaleController *)v37 setSectionHeader:v13];
    }
    v33[0] = UIFontTextStyleTitle2;
    id v14 = +[BYDevice currentDevice];
    id v15 = [v14 size];

    if (v15 == (id)2) {
      objc_storeStrong(v33, UIFontTextStyleTitle3);
    }
    int v16 = [(BuddyLocaleController *)v37 sectionHeader];
    uint64_t v17 = [(BuddyTableSectionHeaderView *)v16 sectionLabel];
    [(UILabel *)v17 setLineBreakMode:0];

    id v32 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:v33[0] addingSymbolicTraits:2 options:0];
    id v31 = +[UIFont fontWithDescriptor:v32 size:0.0];
    id v30 = [(BuddyLocaleController *)v37 tableView:location[0] titleForHeaderInSection:v35];
    id v18 = [(BuddyLocaleController *)v37 language];
    id v19 = sub_100147FCC(v30, v18);
    id v29 = [v19 mutableCopy];

    id v20 = [v29 length];
    uint64_t v40 = 0;
    id v39 = v20;
    uint64_t v41 = 0;
    id v42 = v20;
    [v29 addAttribute:NSFontAttributeName value:v31 range:0, v20, 0, v20];
    id v21 = [(BuddyLocaleController *)v37 sectionHeader];
    id v22 = [(BuddyTableSectionHeaderView *)v21 sectionLabel];
    [(UILabel *)v22 setAttributedText:v29];

    id v23 = [(BuddyLocaleController *)v37 language];
    NSWritingDirection v24 = +[NSParagraphStyle defaultWritingDirectionForLanguage:v23];

    if (v24 == NSWritingDirectionRightToLeft)
    {
      id v25 = [(BuddyLocaleController *)v37 sectionHeader];
      id v26 = [(BuddyTableSectionHeaderView *)v25 sectionLabel];
      [(UILabel *)v26 setTextAlignment:2];
    }
    else
    {
      id v25 = [(BuddyLocaleController *)v37 sectionHeader];
      id v26 = [(BuddyTableSectionHeaderView *)v25 sectionLabel];
      [(UILabel *)v26 setTextAlignment:0];
    }

    long long v38 = [(BuddyLocaleController *)v37 sectionHeader];
    int v34 = 1;
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(v33, 0);
  }
  else
  {
    long long v38 = 0;
    int v34 = 1;
  }
  objc_storeStrong(location, 0);
  id v27 = v38;

  return v27;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11[1] = (id)a4;
  if (a4 == 1)
  {
    v11[0] = [(BuddyLocaleController *)v13 tableView:location[0] viewForHeaderInSection:1];
    [location[0] bounds];
    [location[0] layoutMargins];
    [location[0] layoutMargins];
    double v5 = sub_1000AA5D4();
    [v11[0] setFrame:v5, v6, v7, v8];
    [v11[0] layoutIfNeeded];
    [v11[0] intrinsicContentSize];
    double v14 = v9;
    objc_storeStrong(v11, 0);
  }
  else
  {
    double v14 = 0.0;
  }
  objc_storeStrong(location, 0);
  return v14;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  [v8 setSeparatorStyle:1];
  [v8 _setShouldHaveFullLengthTopSeparator:0];
  [v8 _setShouldHaveFullLengthBottomSeparator:0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (id)internalMenuActions
{
  uint64_t v17 = self;
  v16[1] = (id)a2;
  if ([(BuddyLocaleController *)self showLocalizedNames])
  {
    id v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    double v14 = sub_1000AA900;
    id v15 = &unk_1002B1040;
    v16[0] = v17;
    id v2 = +[UIAlertAction actionWithTitle:@"Hide Translated Languages/Countries" style:0 handler:&v11];
    id v20 = v2;
    id v18 = +[NSArray arrayWithObjects:&v20 count:1];

    objc_storeStrong(v16, 0);
  }
  else
  {
    double v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    id v8 = sub_1000AA954;
    double v9 = &unk_1002B1040;
    id v10 = v17;
    id v3 = +[UIAlertAction actionWithTitle:@"Show Translated Languages/Countries" style:0 handler:&v6];
    id v19 = v3;
    id v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1, v6, v7, v8, v9);

    objc_storeStrong((id *)&v10, 0);
  }
  id v4 = v18;

  return v4;
}

- (double)_topPaddingForSectionHeader
{
  id v15 = self;
  SEL v14 = a2;
  double v13 = 37.0;
  id location = +[BYDevice currentDevice];
  if ([location type] == (id)1)
  {
    double v16 = v13;
  }
  else
  {
    switch((unint64_t)[location size])
    {
      case 0uLL:
      case 4uLL:
        double v13 = 37.0;
        break;
      case 1uLL:
      case 3uLL:
      case 5uLL:
        double v13 = 26.0;
        break;
      case 2uLL:
        double v13 = 20.0;
        break;
      case 6uLL:
        id v2 = +[UIScreen mainScreen];
        [(UIScreen *)v2 bounds];
        char v10 = 0;
        char v8 = 0;
        BOOL v4 = 0;
        if (v3 == 414.0)
        {
          id v11 = +[UIScreen mainScreen];
          char v10 = 1;
          [(UIScreen *)v11 bounds];
          BOOL v4 = 0;
          if (v5 == 896.0)
          {
            double v9 = +[UIScreen mainScreen];
            char v8 = 1;
            [(UIScreen *)v9 scale];
            BOOL v4 = v6 == 3.0;
          }
        }
        if (v8) {

        }
        if (v10) {
        if (v4)
        }
          double v13 = 37.0;
        else {
          double v13 = 26.0;
        }
        break;
      default:
        break;
    }
    double v16 = v13;
  }
  objc_storeStrong(&location, 0);
  return v16;
}

- (id)_micaAssetName
{
  id v20 = self;
  v19[1] = (id)a2;
  id v2 = [(BuddyLocaleController *)self language];
  double v3 = +[NSLocale localeWithLocaleIdentifier:v2];
  v19[0] = [(NSLocale *)v3 countryCode];

  BOOL v4 = [(BuddyLocaleController *)v20 localeComposite];
  double v5 = [(BuddyLocaleComposite *)v4 dataSource];
  id v6 = [(BYLocaleDataSource *)v5 numberOfRecommendedLocales];

  if (v6)
  {
    uint64_t v7 = [(BuddyLocaleController *)v20 localeComposite];
    char v8 = [(BuddyLocaleComposite *)v7 dataSource];
    id v9 = [(BYLocaleDataSource *)v8 recommendedLocaleAtIndex:0];
    id v10 = [v9 code];
    id v11 = v19[0];
    v19[0] = v10;
  }
  id v12 = +[NSLocale containingRegionOfRegion:v19[0]];
  id v13 = [v12 integerValue];

  location[1] = v13;
  location[0] = [(BuddyLocaleController *)v20 _micaAssetNameForRegion:v13];
  if (!location[0])
  {
    id v14 = +[NSLocale containingContinentOfRegion:](NSLocale, "containingContinentOfRegion:", v19[0], 0);
    id v15 = [v14 integerValue];

    location[0] = -[BuddyLocaleController _micaAssetNameForRegion:](v20, "_micaAssetNameForRegion:", v15, v15);
    if (!location[0])
    {
      location[0] = [(BuddyLocaleController *)v20 _micaAssetNameForRegion:19];
    }
  }
  id v21 = location[0];
  objc_storeStrong(location, 0);
  objc_storeStrong(v19, 0);
  double v16 = v21;

  return v16;
}

- (id)_micaAssetNameForRegion:(int64_t)a3
{
  if (a3 == 2)
  {
LABEL_12:
    BOOL v4 = @"GlobeEUAfrica";
    goto LABEL_14;
  }
  if (a3 == 9)
  {
LABEL_10:
    BOOL v4 = @"GlobeAsiaOceania";
    goto LABEL_14;
  }
  if (a3 != 10 && a3 != 19)
  {
    if (a3 == 34)
    {
      BOOL v4 = @"GlobeSouthAsia";
      goto LABEL_14;
    }
    if (a3 != 142)
    {
      if (a3 != 150)
      {
        BOOL v4 = 0;
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  BOOL v4 = @"GlobeAmericas";
LABEL_14:

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

- (BuddyLocaleComposite)localeComposite
{
  return self->_localeComposite;
}

- (BuddyLanguageLocaleSelectionReceiver)selectionReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionReceiver);

  return (BuddyLanguageLocaleSelectionReceiver *)WeakRetained;
}

- (void)setSelectionReceiver:(id)a3
{
}

- (BOOL)showLocalizedNames
{
  return self->_showLocalizedNames;
}

- (BOOL)isResumingFromLanguageReboot
{
  return self->_resumingFromLanguageReboot;
}

- (void)setResumingFromLanguageReboot:(BOOL)a3
{
  self->_resumingFromLanguageReboot = a3;
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (UITableView)buddyLocaleTableView
{
  return self->_buddyLocaleTableView;
}

- (void)setBuddyLocaleTableView:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (BuddyTableSectionHeaderView)sectionHeader
{
  return self->_sectionHeader;
}

- (void)setSectionHeader:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end