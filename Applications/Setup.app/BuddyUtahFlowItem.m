@interface BuddyUtahFlowItem
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BFFSettingsManager)settingsManager;
- (BOOL)controllerNeedsToRun;
- (BYPreferencesController)buddyPreferences;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BYRunState)runState;
- (BuddyFeatureFlags)featureFlags;
- (CLLocationManager)locationManager;
- (OBWelcomeController)utahController;
- (OS_dispatch_queue)locationQueue;
- (STManagementState)screenTime;
- (id)extendedInitializationCompletion;
- (id)viewController;
- (void)_continue;
- (void)_doNothing;
- (void)controllerCompleted;
- (void)controllerWasPopped;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtendedInitializationCompletion:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationQueue:(id)a3;
- (void)setRunState:(id)a3;
- (void)setScreenTime:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)setUtahController:(id)a3;
@end

@implementation BuddyUtahFlowItem

- (id)viewController
{
  v26 = self;
  v25[1] = (id)a2;
  v2 = [(BuddyUtahFlowItem *)self utahController];
  BOOL v3 = v2 == 0;

  if (v3)
  {
    v4 = +[UIColor tintColor];
    v25[0] = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v4];

    id v24 = +[UIImage systemImageNamed:@"nosign.app.fill" withConfiguration:v25[0]];
    id v5 = objc_alloc((Class)OBWelcomeController);
    v6 = +[NSBundle mainBundle];
    v7 = [(NSBundle *)v6 localizedStringForKey:@"ADULT_WEB_CONTENT_FILTER_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    v8 = +[NSBundle mainBundle];
    v9 = [(NSBundle *)v8 localizedStringForKey:@"ADULT_WEB_CONTENT_FILTER_DETAIL" value:&stru_1002B4E18 table:@"Localizable"];
    id v10 = [v5 initWithTitle:v7 detailText:v9 icon:v24];
    [(BuddyUtahFlowItem *)v26 setUtahController:v10];

    id v23 = +[OBBoldTrayButton boldButton];
    v11 = +[NSBundle mainBundle];
    id v22 = [(NSBundle *)v11 localizedStringForKey:@"ADULT_WEB_CONTENT_FILTER_OPTIN" value:&stru_1002B4E18 table:@"Localizable"];

    [v23 setTitle:v22 forState:0];
    [v23 addTarget:v26 action:"_continue" forControlEvents:64];
    v12 = [(BuddyUtahFlowItem *)v26 utahController];
    id v13 = [(OBWelcomeController *)v12 buttonTray];
    [v13 addButton:v23];

    id location = +[OBLinkTrayButton linkButton];
    v14 = +[NSBundle mainBundle];
    v20 = [(NSBundle *)v14 localizedStringForKey:@"ADULT_WEB_CONTENT_FILTER_OPTOUT" value:&stru_1002B4E18 table:@"Localizable"];

    [location setTitle:v20 forState:0];
    [location addTarget:v26 action:"_doNothing" forControlEvents:64];
    v15 = [(BuddyUtahFlowItem *)v26 utahController];
    id v16 = [(OBWelcomeController *)v15 buttonTray];
    [v16 addButton:v23];

    v17 = [(BuddyUtahFlowItem *)v26 utahController];
    id v18 = [(OBWelcomeController *)v17 buttonTray];
    [v18 addButton:location];

    objc_storeStrong((id *)&v20, 0);
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(v25, 0);
  }
  return [(BuddyUtahFlowItem *)v26 utahController];
}

- (void)_continue
{
  v12 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  v2 = [(BuddyUtahFlowItem *)v12 screenTime];
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_10019DE58;
  v9 = &unk_1002B4470;
  objc_copyWeak(v10, location);
  [(STManagementState *)v2 enableWebContentFilterWithCompletionHandler:&v6];

  BOOL v3 = [(BuddyUtahFlowItem *)v12 delegate];
  id v4 = [(BuddyUtahFlowItem *)v12 viewController];
  id v13 = v4;
  id v5 = +[NSArray arrayWithObjects:&v13 count:1];
  [(BFFFlowItemDelegate *)v3 removeViewControllersOnNextPush:v5];

  [(BuddyUtahFlowItem *)v12 controllerCompleted];
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
}

- (void)_doNothing
{
}

- (void)controllerCompleted
{
  v2 = [(BuddyUtahFlowItem *)self buddyPreferences];
  [(BYPreferencesController *)v2 setObject:&__kCFBooleanTrue forKey:@"UtahPresented"];

  BOOL v3 = [(BuddyUtahFlowItem *)self delegate];
  [(BFFFlowItemDelegate *)v3 flowItemDone:self];
}

- (void)controllerWasPopped
{
  v2 = [(BuddyUtahFlowItem *)self buddyPreferences];
  [(BYPreferencesController *)v2 setObject:&__kCFBooleanFalse forKey:@"UtahPresented"];
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyUtahFlowItem *)self runState];
  unsigned __int8 v3 = [(BYRunState *)v2 hasCompletedInitialRun];

  if (v3) {
    return 0;
  }
  id v4 = [(BuddyUtahFlowItem *)self buddyPreferences];
  unsigned __int8 v5 = [(BYPreferencesController *)v4 BOOLForKey:@"UtahPresented"];

  return (v5 & 1) == 0;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[ACAccountStore defaultStore];
  id v23 = [v3 aa_primaryAppleAccount];

  id v4 = [objc_alloc((Class)NSSet) initWithArray:&off_1002C1530];
  unsigned __int8 v5 = +[NSNumber numberWithUnsignedInteger:[v23 aa_ageCategory]];
  unsigned __int8 v6 = [v4 containsObject:v5];

  char v22 = v6 & 1;
  if (v6)
  {
    id v9 = objc_alloc_init((Class)STManagementState);
    [(BuddyUtahFlowItem *)v25 setScreenTime:v9];

    id v10 = [(BuddyUtahFlowItem *)v25 screenTime];
    v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    v14 = sub_10019E520;
    v15 = &unk_1002B44E8;
    id v17 = location[0];
    id v16 = v25;
    [(STManagementState *)v10 isWebContentRestricted:&v11];

    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong(&v17, 0);
    int v18 = 0;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = oslog;
      os_log_type_t v8 = v20;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Utah age criteria not met", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    int v18 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

+ (id)cloudConfigSkipKey
{
  return kCCSkipKeyWebContentFiltering;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v10 = [location[0] authorizationStatus];
  if (v10 != 3 && v10 != 4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v8 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v3 = oslog;
      os_log_type_t v4 = v8;
      sub_10004B24C(v7);
      _os_log_error_impl((void *)&_mh_execute_header, v3, v4, "Location Services not authorized", (uint8_t *)v7, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v5 = [(BuddyUtahFlowItem *)v12 extendedInitializationCompletion];

    if (v5)
    {
      unsigned __int8 v6 = (void (**)(id, void))[(BuddyUtahFlowItem *)v12 extendedInitializationCompletion];
      v6[2](v6, 0);
    }
  }
  objc_storeStrong(location, 0);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = (id)_BYLoggingFacility();
  os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v25;
    os_log_type_t v6 = v24;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Received location update", buf, 2u);
  }
  objc_storeStrong(&v25, 0);
  [location[0] stopUpdatingLocation];
  id v22 = objc_alloc_init((Class)CLGeocoder);
  id v21 = [v26 lastObject];
  if (v21)
  {
    v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    v14 = sub_10019F184;
    v15 = &unk_1002B42E0;
    id v16 = v28;
    [v22 reverseGeocodeLocation:v21 completionHandler:&v11];
    objc_storeStrong((id *)&v16, 0);
    int v17 = 0;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v19 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = oslog;
      os_log_type_t v8 = v19;
      sub_10004B24C(v18);
      _os_log_error_impl((void *)&_mh_execute_header, v7, v8, "Locations array was empty!", v18, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v9 = [(BuddyUtahFlowItem *)v28 extendedInitializationCompletion];

    if (v9)
    {
      unsigned int v10 = (void (**)(id, void))[(BuddyUtahFlowItem *)v28 extendedInitializationCompletion];
      v10[2](v10, 0);
    }
    int v17 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    char v10 = 0;
    char v8 = 0;
    if (_BYIsInternalInstall())
    {
      id v5 = (NSString *)v13;
    }
    else if (v13)
    {
      id v11 = [v13 domain];
      char v10 = 1;
      id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v11, [v13 code]);
      id v9 = v5;
      char v8 = 1;
    }
    else
    {
      id v5 = 0;
    }
    sub_10004BB7C((uint64_t)buf, (uint64_t)v5);
    _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to obtain location: %{public}@", buf, 0xCu);
    if (v8) {

    }
    if (v10) {
  }
    }
  objc_storeStrong((id *)&oslog, 0);
  id v6 = [(BuddyUtahFlowItem *)v15 extendedInitializationCompletion];

  if (v6)
  {
    uint64_t v7 = (void (**)(id, void))[(BuddyUtahFlowItem *)v15 extendedInitializationCompletion];
    v7[2](v7, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (OBWelcomeController)utahController
{
  return (OBWelcomeController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUtahController:(id)a3
{
}

- (STManagementState)screenTime
{
  return self->_screenTime;
}

- (void)setScreenTime:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (OS_dispatch_queue)locationQueue
{
  return self->_locationQueue;
}

- (void)setLocationQueue:(id)a3
{
}

- (id)extendedInitializationCompletion
{
  return self->_extendedInitializationCompletion;
}

- (void)setExtendedInitializationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end