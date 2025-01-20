@interface BuddyMultilingualExpressViewController
+ (BOOL)controllerAffectedByTapFreeSetup;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BYAnalyticsManager)analyticsManager;
- (BuddyMultilingualDataModelProviderCollection)providerCollection;
- (BuddyMultilingualExpressViewController)init;
- (BuddyMultilingualFlowManager)multilingualFlowManager;
- (NSArray)dictationBackingStore;
- (NSArray)keyboardBackingStore;
- (id)languageListForBackingStore:(id)a3 showDetailText:(BOOL)a4;
- (void)continuePressed;
- (void)customizeLanguagesButtonPressed;
- (void)setAnalyticsManager:(id)a3;
- (void)setDictationBackingStore:(id)a3;
- (void)setKeyboardBackingStore:(id)a3;
- (void)setMultilingualFlowManager:(id)a3;
- (void)setProviderCollection:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BuddyMultilingualExpressViewController

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BuddyMultilingualExpressViewController)init
{
  id v11 = self;
  v10[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  v10[0] = [(NSBundle *)v2 localizedStringForKey:@"MULTILINGUAL_EXPRESS_LANGUAGE_TITLE" value:&stru_1002B4E18 table:@"Localizable"];

  v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MULTILINGUAL_EXPRESS_LANGUAGE_SUBTEXT"];
  id location = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];

  id v5 = v11;
  id v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyMultilingualExpressViewController;
  id v11 = [(BuddyMultilingualExpressViewController *)&v8 initWithTitle:v10[0] detailText:location symbolName:0];
  v6 = (BuddyMultilingualExpressViewController *)v11;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

- (void)viewDidLoad
{
  v51 = self;
  SEL v50 = a2;
  v49.receiver = self;
  v49.super_class = (Class)BuddyMultilingualExpressViewController;
  [(BuddyMultilingualExpressViewController *)&v49 viewDidLoad];
  v2 = [(BuddyMultilingualExpressViewController *)v51 multilingualFlowManager];
  char v47 = 0;
  char v45 = 0;
  char v43 = 0;
  char v41 = 0;
  char v39 = 0;
  char v37 = 0;
  if ([(BuddyMultilingualFlowManager *)v2 didMakeSelection])
  {
    v48 = [(BuddyMultilingualExpressViewController *)v51 providerCollection];
    char v47 = 1;
    v46 = [(BuddyMultilingualDataModelProviderCollection *)v48 keyboardProvider];
    char v45 = 1;
    id v44 = [(BuddyMultilingualProvider *)v46 createDataSourceForSelectedItems];
    char v43 = 1;
  }
  else
  {
    id v42 = [(BuddyMultilingualExpressViewController *)v51 providerCollection];
    char v41 = 1;
    id v40 = [v42 keyboardProvider];
    char v39 = 1;
    id v38 = [v40 createDataSourceForPreselectedItems];
    char v37 = 1;
  }
  -[BuddyMultilingualExpressViewController setKeyboardBackingStore:](v51, "setKeyboardBackingStore:");
  if (v37) {

  }
  if (v39) {
  if (v41)
  }

  if (v43) {
  if (v45)
  }

  if (v47) {
  v3 = [(BuddyMultilingualExpressViewController *)v51 providerCollection];
  }
  id v4 = [(BuddyMultilingualDataModelProviderCollection *)v3 dictationProvider];
  id v5 = [(BuddyMultilingualProvider *)v4 createDataSourceForPreselectedItems];
  [(BuddyMultilingualExpressViewController *)v51 setDictationBackingStore:v5];

  id v36 = +[UIImage imageNamed:@"Bullet-Icon-Keyboards"];
  id v35 = +[UIImage imageNamed:@"Bullet-Icon-Dictation"];
  v6 = [(BuddyMultilingualExpressViewController *)v51 keyboardBackingStore];
  NSUInteger v7 = [(NSArray *)v6 count];

  if (v7)
  {
    objc_super v8 = v51;
    v9 = +[NSBundle mainBundle];
    v10 = [(NSBundle *)v9 localizedStringForKey:@"MULTILINGUAL_KEYBOARDS_EXPRESS_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    id v11 = v51;
    v12 = [(BuddyMultilingualExpressViewController *)v51 keyboardBackingStore];
    id v13 = [(BuddyMultilingualExpressViewController *)v11 languageListForBackingStore:v12 showDetailText:1];
    [(BuddyMultilingualExpressViewController *)v8 addBulletedListItemWithTitle:v10 description:v13 image:v36];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v33 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v14 = oslog;
      os_log_type_t v15 = v33;
      sub_10004B24C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v14, v15, "BuddyMultilingualExpressViewController keyboardBackingStore count == 0\n", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v16 = [(BuddyMultilingualExpressViewController *)v51 dictationBackingStore];
  NSUInteger v17 = [(NSArray *)v16 count];

  if (v17)
  {
    v18 = v51;
    v19 = +[NSBundle mainBundle];
    v20 = [(NSBundle *)v19 localizedStringForKey:@"MULTILINGUAL_DICTATION_EXPRESS_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    v21 = v51;
    v22 = [(BuddyMultilingualExpressViewController *)v51 dictationBackingStore];
    id v23 = [(BuddyMultilingualExpressViewController *)v21 languageListForBackingStore:v22 showDetailText:0];
    [(BuddyMultilingualExpressViewController *)v18 addBulletedListItemWithTitle:v20 description:v23 image:v35];
  }
  id location = +[OBBoldTrayButton boldButton];
  [location setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = +[NSBundle mainBundle];
  v25 = [(NSBundle *)v24 localizedStringForKey:@"MULTILINGUAL_EXPRESS_LANGUAGE_ACTIONTEXT" value:&stru_1002B4E18 table:@"Localizable"];
  [location setTitle:v25 forState:0];

  [location addTarget:v51 action:"customizeLanguagesButtonPressed" forControlEvents:64];
  id v26 = [(BuddyMultilingualExpressViewController *)v51 buttonTray];
  [v26 addButton:location];

  id v30 = +[OBLinkTrayButton linkButton];
  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = +[NSBundle mainBundle];
  v28 = [(NSBundle *)v27 localizedStringForKey:@"SET_UP_LATER_IN_SETTINGS" value:&stru_1002B4E18 table:@"Localizable"];
  [v30 setTitle:v28 forState:0];

  [v30 addTarget:v51 action:"continuePressed" forControlEvents:64];
  id v29 = [(BuddyMultilingualExpressViewController *)v51 buttonTray];
  [v29 addButton:v30];

  objc_storeStrong(&v30, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  NSUInteger v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMultilingualExpressViewController;
  [(BuddyMultilingualExpressViewController *)&v4 viewDidAppear:a3];
  v3 = [(BuddyMultilingualExpressViewController *)v7 providerCollection];
  [(BuddyMultilingualDataModelProviderCollection *)v3 setExpressFlowDidCustomize:0];
}

- (id)languageListForBackingStore:(id)a3 showDetailText:(BOOL)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v17 = a4;
  id v16 = +[NSMutableString string];
  id v5 = location[0];
  objc_super v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_100182D44;
  v12 = &unk_1002B4060;
  BOOL v15 = v17;
  id v13 = v16;
  id v14 = location[0];
  [v5 enumerateObjectsUsingBlock:&v8];
  id v6 = v16;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)continuePressed
{
  v2 = [(BuddyMultilingualExpressViewController *)self keyboardBackingStore];
  +[BuddyKeyboardLanguageOrderSelector writePreferredKeyboardLanguagesToSystem:v2];

  v3 = [(BuddyMultilingualExpressViewController *)self dictationBackingStore];
  +[BuddyDictationLanguageOrderSelector writePreferredDictationLanguagesToSystem:v3];

  objc_super v4 = [(BuddyMultilingualExpressViewController *)self keyboardBackingStore];
  v10[0] = v4;
  id v5 = [(BuddyMultilingualExpressViewController *)self dictationBackingStore];
  v10[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v10 count:2];
  NSUInteger v7 = [(BuddyMultilingualExpressViewController *)self analyticsManager];
  +[BYMultilingualAnalyticsEvent recordExpressPaneShownUserCustomized:0 withData:v6 analyticsManager:v7];

  objc_super v8 = [(BuddyWelcomeController *)self delegate];
  [(BFFFlowItemDelegate *)v8 flowItemDone:self];
}

- (void)customizeLanguagesButtonPressed
{
  v2 = [(BuddyMultilingualExpressViewController *)self providerCollection];
  [(BuddyMultilingualDataModelProviderCollection *)v2 setExpressFlowDidCustomize:1];

  v3 = [(BuddyMultilingualExpressViewController *)self keyboardBackingStore];
  v9[0] = v3;
  objc_super v4 = [(BuddyMultilingualExpressViewController *)self dictationBackingStore];
  v9[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v9 count:2];
  id v6 = [(BuddyMultilingualExpressViewController *)self analyticsManager];
  +[BYMultilingualAnalyticsEvent recordExpressPaneShownUserCustomized:1 withData:v5 analyticsManager:v6];

  NSUInteger v7 = [(BuddyWelcomeController *)self delegate];
  [(BFFFlowItemDelegate *)v7 flowItemDone:self nextItemClass:0];
}

- (BuddyMultilingualFlowManager)multilingualFlowManager
{
  return self->_multilingualFlowManager;
}

- (void)setMultilingualFlowManager:(id)a3
{
}

- (BuddyMultilingualDataModelProviderCollection)providerCollection
{
  return self->_providerCollection;
}

- (void)setProviderCollection:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (NSArray)keyboardBackingStore
{
  return self->_keyboardBackingStore;
}

- (void)setKeyboardBackingStore:(id)a3
{
}

- (NSArray)dictationBackingStore
{
  return self->_dictationBackingStore;
}

- (void)setDictationBackingStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end