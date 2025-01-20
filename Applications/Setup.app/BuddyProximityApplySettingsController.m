@interface BuddyProximityApplySettingsController
+ (unint64_t)applicableDispositions;
- (BOOL)addWirelessNetworks;
- (BOOL)isEphemeral;
- (BOOL)shouldAllowStartOver;
- (BuddyNetworkProvider)networkProvider;
- (BuddyProximityApplySettingsController)init;
- (NSDate)startTime;
- (ProximitySetupController)proximitySetupController;
- (id)prepareForDeviceMigrationBlock;
- (void)endProximityIfApplicable;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setPrepareForDeviceMigrationBlock:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setStartTime:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)waitForWirelessConnection:(id)a3;
@end

@implementation BuddyProximityApplySettingsController

- (BuddyProximityApplySettingsController)init
{
  id location = self;
  v11[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PROXIMITY_SETUP_SETTING_UP"];
  v11[0] = [(NSBundle *)v2 localizedStringForKey:v3 value:&stru_1002B4E18 table:@"Localizable"];

  id v4 = location;
  id location = 0;
  v10.receiver = v4;
  v10.super_class = (Class)BuddyProximityApplySettingsController;
  v5 = [(BuddyProximityApplySettingsController *)&v10 initWithSpinnerText:v11[0]];
  id location = v5;
  objc_storeStrong(&location, v5);
  if (v5)
  {
    id v6 = [location navigationItem];
    [v6 setTitle:&stru_1002B4E18];

    id v7 = [location navigationItem];
    [v7 setHidesBackButton:1 animated:0];
  }
  v8 = (BuddyProximityApplySettingsController *)location;
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BuddyProximityApplySettingsController;
  [(BuddyProximityApplySettingsController *)&v10 viewDidAppear:a3];
  id v3 = dispatch_get_global_queue(0, 0);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100075BA8;
  v8 = &unk_1002B0D20;
  v9 = v13;
  dispatch_async(v3, &v4);

  objc_storeStrong((id *)&v9, 0);
}

- (BOOL)addWirelessNetworks
{
  v21[2] = self;
  v21[1] = (id)a2;
  v2 = [(BuddyProximityApplySettingsController *)self proximitySetupController];
  v21[0] = [(ProximitySetupController *)v2 information];

  CFTypeRef v20 = (CFTypeRef)WiFiManagerClientCreate();
  char v19 = 0;
  if (v20)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [v21[0] networks];
      sub_100046588((uint64_t)buf, (uint64_t)[v3 count]);
      _os_log_impl((void *)&_mh_execute_header, oslog, v17, "Adding auto-join information for %llu Wi-Fi networks...", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v4 = i;
      id v5 = [v21[0] networks];
      id v6 = [v5 count];

      if (v4 >= (unint64_t)v6) {
        break;
      }
      id v7 = [v21[0] networks];
      id v15 = [v7 objectAtIndexedSubscript:i];

      id v8 = [v21[0] networkPasswords];
      id location = [v8 objectAtIndexedSubscript:i];

      CFTypeRef cf = (CFTypeRef)WiFiNetworkCreate();
      id v9 = location;
      objc_super v10 = +[NSNull null];
      LODWORD(v9) = [v9 isEqual:v10] & 1;

      if (!v9) {
        WiFiNetworkSetPassword();
      }
      WiFiManagerClientAddNetwork();
      CFRelease(cf);
      char v19 = 1;
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v15, 0);
    }
    CFRelease(v20);
  }
  char v11 = v19;
  objc_storeStrong(v21, 0);
  return v11 & 1;
}

- (void)waitForWirelessConnection:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10005A060(buf, 15);
    _os_log_impl((void *)&_mh_execute_header, oslog, v11, "Proximity added Wi-Fi networks, waiting %d seconds for one to be joined...", buf, 8u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v3 = +[BYNetworkMonitor sharedInstance];
  unint64_t v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100076424;
  id v8 = &unk_1002B0CF8;
  id v9 = v14;
  id v10 = location[0];
  [(BYNetworkMonitor *)v3 withMinimumNetworkType:1 timeout:&v4 runBlock:15.0];

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)endProximityIfApplicable
{
  v2 = [(BuddyProximityApplySettingsController *)self proximitySetupController];
  char v3 = ![(ProximitySetupController *)v2 hasConnection];

  if ((v3 & 1) == 0)
  {
    unint64_t v4 = [(BuddyProximityApplySettingsController *)self proximitySetupController];
    int v5 = [(ProximitySetupController *)v4 information];
    id v6 = [(SASProximityInformation *)v5 appleID];
    BOOL v7 = v6 != 0;

    BOOL v18 = v7;
    id v8 = [(BuddyProximityApplySettingsController *)self proximitySetupController];
    id v9 = [(ProximitySetupController *)v8 information];
    id v10 = [(SASProximityInformation *)v9 hasTransferrableTelephonyPlan];
    unsigned __int8 v11 = [v10 BOOLValue];

    char v17 = v11 & 1;
    SEL v12 = [(BuddyProximityApplySettingsController *)self proximitySetupController];
    v13 = [(ProximitySetupController *)v12 information];
    id v14 = [(SASProximityInformation *)v13 supportsDeviceToDeviceMigration];
    unsigned __int8 v15 = [v14 BOOLValue];

    if (!v18 && (v17 & 1) == 0 && (v15 & 1) == 0)
    {
      v16 = [(BuddyProximityApplySettingsController *)self proximitySetupController];
      [(ProximitySetupController *)v16 setupFinished];
    }
  }
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  SEL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v3 = [(BuddyProximityApplySettingsController *)v12 proximitySetupController];
  unint64_t v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  BOOL v7 = sub_10007687C;
  id v8 = &unk_1002B1668;
  id v9 = v12;
  id v10 = location[0];
  [(ProximitySetupController *)v3 waitForIntent:&v4];

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isEphemeral
{
  return 1;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (id)prepareForDeviceMigrationBlock
{
  return self->_prepareForDeviceMigrationBlock;
}

- (void)setPrepareForDeviceMigrationBlock:(id)a3
{
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStartTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end