@interface BuddyCloudConfigurationRetrievalController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BOOL)shouldFetchCloudConfiguration;
- (BuddyCloudConfigurationRetrievalController)init;
- (DMCReturnToServiceController)mdmReturnToServiceController;
- (MCProfileConnection)managedConfiguration;
- (void)_fetchCloudConfig;
- (void)_presentTryAgainAlert;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMdmReturnToServiceController:(id)a3;
- (void)setShouldFetchCloudConfiguration:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BuddyCloudConfigurationRetrievalController

- (BuddyCloudConfigurationRetrievalController)init
{
  SEL v8 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"CLOUD_CONFIG_RETRIEVING" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyCloudConfigurationRetrievalController;
  id location = [(BuddyCloudConfigurationRetrievalController *)&v7 initWithSpinnerText:v4];
  objc_storeStrong(&location, location);

  if (location) {
    *((unsigned char *)location + 8) = 1;
  }
  v5 = (BuddyCloudConfigurationRetrievalController *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewDidLoad
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyCloudConfigurationRetrievalController;
  [(BuddyCloudConfigurationRetrievalController *)&v3 viewDidLoad];
  id v2 = [(BuddyCloudConfigurationRetrievalController *)v5 navigationItem];
  [v2 setHidesBackButton:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  if ([(BuddyCloudConfigurationRetrievalController *)self shouldFetchCloudConfiguration])
  {
    [(BuddyCloudConfigurationRetrievalController *)v6 setShouldFetchCloudConfiguration:0];
    [(BuddyCloudConfigurationRetrievalController *)v6 _fetchCloudConfig];
  }
  v3.receiver = v6;
  v3.super_class = (Class)BuddyCloudConfigurationRetrievalController;
  [(BuddyCloudConfigurationRetrievalController *)&v3 viewDidAppear:v4];
}

- (BOOL)controllerNeedsToRun
{
  BOOL v14 = 0;
  id v2 = [(BuddyCloudConfigurationRetrievalController *)self managedConfiguration];
  unsigned __int8 v3 = [(MCProfileConnection *)v2 activationRecordIndicatesCloudConfigurationIsAvailable];

  if (v3)
  {
    BOOL v4 = [(BuddyCloudConfigurationRetrievalController *)self managedConfiguration];
    [(MCProfileConnection *)v4 flush];

    SEL v5 = [(BuddyCloudConfigurationRetrievalController *)self managedConfiguration];
    id v6 = [(MCProfileConnection *)v5 cloudConfigurationDetails];
    char v12 = 0;
    char v7 = 0;
    if (!v6)
    {
      id v13 = +[BuddyCloudConfigManager sharedManager];
      char v12 = 1;
      char v7 = [v13 hasCloudConfiguration] ^ 1;
    }
    if (v12) {

    }
    if (v7) {
      BOOL v14 = 1;
    }
  }
  SEL v8 = [(BuddyCloudConfigurationRetrievalController *)self mdmReturnToServiceController];
  unsigned __int8 v9 = [(DMCReturnToServiceController *)v8 shouldDoReturnToService];

  if (v9) {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    id v10 = +[BuddyCloudConfigManager sharedManager];
    [v10 cloudConfigMayHaveChanged];
  }
  return v14;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyCloudConfigurationRetrievalController *)v11 managedConfiguration];
  BOOL v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = sub_1000DDC80;
  SEL v8 = &unk_1002B2A38;
  id v9 = location[0];
  [(MCProfileConnection *)v3 restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:&v4];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_fetchCloudConfig
{
  v30 = self;
  v29[1] = (id)a2;
  id v2 = [(BuddyCloudConfigurationRetrievalController *)self mdmReturnToServiceController];
  unsigned __int8 v3 = [(DMCReturnToServiceController *)v2 shouldDoReturnToService];

  if (v3)
  {
    BOOL v4 = [(BuddyCloudConfigurationRetrievalController *)v30 mdmReturnToServiceController];
    v24 = _NSConcreteStackBlock;
    int v25 = -1073741824;
    int v26 = 0;
    v27 = sub_1000DDFB4;
    v28 = &unk_1002B0FF0;
    v29[0] = v30;
    [(DMCReturnToServiceController *)v4 configureMDMWithCompletionHandler:&v24];

    objc_storeStrong(v29, 0);
  }
  else
  {
    int v5 = [(BuddyCloudConfigurationRetrievalController *)v30 managedConfiguration];
    char v22 = 0;
    char v20 = 0;
    BOOL v6 = 1;
    if ([(MCProfileConnection *)v5 activationRecordIndicatesCloudConfigurationIsAvailable])
    {
      v23 = [(BuddyCloudConfigurationRetrievalController *)v30 managedConfiguration];
      char v22 = 1;
      id v21 = [(MCProfileConnection *)v23 cloudConfigurationDetails];
      char v20 = 1;
      BOOL v6 = v21 != 0;
    }
    if (v20) {

    }
    if (v22) {
    if (v6)
    }
    {
      id v7 = [(BuddyCloudConfigurationRetrievalController *)v30 delegate];
      [v7 flowItemDone:v30];
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        SEL v8 = oslog;
        os_log_type_t v9 = v18;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Fetching cloud configuration...", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v10 = [(BuddyCloudConfigurationRetrievalController *)v30 managedConfiguration];
      v11 = _NSConcreteStackBlock;
      int v12 = -1073741824;
      int v13 = 0;
      BOOL v14 = sub_1000DE39C;
      v15 = &unk_1002B2A60;
      v16 = v30;
      [(MCProfileConnection *)v10 retrieveCloudConfigurationDetailsCompletionBlock:&v11];

      objc_storeStrong((id *)&v16, 0);
    }
  }
}

- (void)_presentTryAgainAlert
{
  v29 = self;
  location[1] = (id)a2;
  id v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [(NSBundle *)v2 localizedStringForKey:@"CLOUD_CONFIG_RETRIEVAL_FAILED_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  BOOL v4 = +[NSBundle mainBundle];
  id v5 = (id)SFLocalizableWAPIStringKeyForKey();
  BOOL v6 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"Localizable"];
  location[0] = +[UIAlertController alertControllerWithTitle:v3 message:v6 preferredStyle:1];

  id v7 = location[0];
  SEL v8 = +[NSBundle mainBundle];
  os_log_type_t v9 = [(NSBundle *)v8 localizedStringForKey:@"TRY_AGAIN" value:&stru_1002B4E18 table:@"Localizable"];
  char v22 = _NSConcreteStackBlock;
  int v23 = -1073741824;
  int v24 = 0;
  int v25 = sub_1000DEBF0;
  int v26 = &unk_1002B1040;
  v27 = v29;
  id v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:&v22];
  [v7 addAction:v10];

  id v11 = location[0];
  int v12 = +[NSBundle mainBundle];
  id v13 = (id)SFLocalizableWAPIStringKeyForKey();
  BOOL v14 = [(NSBundle *)v12 localizedStringForKey:v13 value:&stru_1002B4E18 table:@"Localizable"];
  v16 = _NSConcreteStackBlock;
  int v17 = -1073741824;
  int v18 = 0;
  v19 = sub_1000DEC40;
  char v20 = &unk_1002B1040;
  id v21 = v29;
  v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:&v16];
  [v11 addAction:v15];

  [(BuddyCloudConfigurationRetrievalController *)v29 presentViewController:location[0] animated:1 completion:0];
  objc_storeStrong((id *)&v21, 0);
  objc_storeStrong((id *)&v27, 0);
  objc_storeStrong(location, 0);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (DMCReturnToServiceController)mdmReturnToServiceController
{
  return self->_mdmReturnToServiceController;
}

- (void)setMdmReturnToServiceController:(id)a3
{
}

- (BOOL)shouldFetchCloudConfiguration
{
  return self->_shouldFetchCloudConfiguration;
}

- (void)setShouldFetchCloudConfiguration:(BOOL)a3
{
  self->_shouldFetchCloudConfiguration = a3;
}

- (void).cxx_destruct
{
}

@end