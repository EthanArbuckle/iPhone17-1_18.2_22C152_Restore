@interface BuddyAppleIDiCloudDrivePage
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BuddyAppleIDiCloudDrivePage)init;
- (MCProfileConnection)managedConfiguration;
- (void)_continueTapped:(id)a3;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyAppleIDiCloudDrivePage

- (BuddyAppleIDiCloudDrivePage)init
{
  SEL v10 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"ICLOUD_DRIVE_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"ICLOUD_DRIVE_DETAIL" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v9.receiver = self;
  v9.super_class = (Class)BuddyAppleIDiCloudDrivePage;
  id location = [(BuddyAppleIDiCloudDrivePage *)&v9 initWithTitle:v4 detailText:v6 symbolName:@"icloud.fill"];
  objc_storeStrong(&location, location);

  v7 = (BuddyAppleIDiCloudDrivePage *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyAppleIDiCloudDrivePage;
  [(BuddyAppleIDiCloudDrivePage *)&v5 viewDidLoad];
  v2 = v7;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v2 addBoldButton:v4 action:"_continueTapped:"];
}

- (void)_continueTapped:(id)a3
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[ACAccountStore defaultStore];
  id v20 = [v3 aa_primaryAppleAccount];

  id v19 = [v20 aa_personID];
  id v18 = [objc_alloc((Class)AACloudKitStartMigrationRequest) initWithAccount:v20];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    os_log_type_t v5 = v16;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting request to begin CloudKit migration...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v6 = v18;
  objc_super v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  v12 = sub_1000C7AA4;
  v13 = &unk_1002B2790;
  id v14 = v19;
  [v6 performRequestWithHandler:&v9];
  [v20 aa_setUsesCloudDocs:1];
  id v7 = +[ACAccountStore defaultStore];
  [v7 saveAccount:v20 withCompletionHandler:0];

  v8 = [(BuddyWelcomeController *)v22 delegate];
  [(BFFFlowItemDelegate *)v8 flowItemDone:v22];

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  id v7 = self;
  location[1] = (id)a2;
  id v2 = +[ACAccountStore defaultStore];
  location[0] = [v2 aa_primaryAppleAccount];

  if (location[0])
  {
    id v3 = [(BuddyAppleIDiCloudDrivePage *)v7 managedConfiguration];
    unsigned int v4 = [(MCProfileConnection *)v3 BOOLRestrictionForFeature:MCFeatureCloudDocumentSyncAllowed];

    BOOL v8 = v4 != 2;
  }
  else
  {
    BOOL v8 = 0;
  }
  objc_storeStrong(location, 0);
  return v8;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[ACAccountStore defaultStore];
  id v17 = [v3 aa_primaryAppleAccount];

  id v16 = [objc_alloc((Class)AACloudKitMigrationStateRequest) initWithAccount:v17];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = oslog;
    os_log_type_t v5 = v14;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Fetching CloudKit migration state...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v6 = v16;
  id v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  int v10 = sub_1000C7F08;
  int v11 = &unk_1002B1E10;
  id v12 = location[0];
  [v6 performRequestWithHandler:&v7];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end