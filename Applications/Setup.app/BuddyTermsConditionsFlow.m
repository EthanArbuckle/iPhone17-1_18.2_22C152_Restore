@interface BuddyTermsConditionsFlow
+ (BOOL)controllerNeedsToRun;
+ (BOOL)hiddenFromMultiUser;
+ (id)allowedFlowItems;
+ (id)cloudConfigSkipKey;
+ (void)didAgreeToServerTerms;
+ (void)skippedByCloudConfig;
- (BuddyTermsConditionsFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4;
@end

@implementation BuddyTermsConditionsFlow

- (BuddyTermsConditionsFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  id v14 = 0;
  objc_storeStrong(&v14, a6);
  id v9 = v18;
  id v18 = 0;
  v13.receiver = v9;
  v13.super_class = (Class)BuddyTermsConditionsFlow;
  id v18 = [(BuddyTermsConditionsFlow *)&v13 initWithNavigationController:location[0] flowDelegate:v16 flowStarter:v15 dependencyInjector:v14];
  objc_storeStrong(&v18, v18);
  if (v18)
  {
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v10 = +[NSArray arrayWithObjects:v19 count:2];
    [v18 setClassList:v10];
  }
  v11 = (BuddyTermsConditionsFlow *)v18;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v18, 0);
  return v11;
}

+ (void)didAgreeToServerTerms
{
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    os_log_type_t v3 = v5;
    sub_10004B24C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Did agree to server terms", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  byte_100321F38 = 1;
}

+ (id)allowedFlowItems
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  return +[NSArray arrayWithObjects:v3 count:2];
}

- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4
{
  v10 = self;
  SEL v9 = a2;
  Class v8 = a3;
  Class v7 = a4;
  if ([(id)objc_opt_class() controllerNeedsToRun])
  {
    v6.receiver = v10;
    v6.super_class = (Class)BuddyTermsConditionsFlow;
    id v11 = [(BuddyTermsConditionsFlow *)&v6 controllerFollowingControllerClass:v8 requestedNext:v7];
  }
  else
  {
    id v11 = 0;
  }
  v4 = v11;

  return v4;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (BOOL)controllerNeedsToRun
{
  unsigned __int8 v2 = +[BYLicenseAgreement needsToAcceptNewAgreement];
  BOOL v3 = 0;
  if (v2) {
    return !(byte_100321F38 & 1);
  }
  return v3;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupTOS;
}

+ (void)skippedByCloudConfig
{
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v2 = oslog[0];
    os_log_type_t v3 = v15;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Terms and Conditions pane skipped by cloud config, removing license and warranty sentinels", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  id location = 0;
  v4 = +[NSFileManager defaultManager];
  id obj = 0;
  unsigned __int8 v5 = [(NSFileManager *)v4 removeItemAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowLicense" error:&obj];
  objc_storeStrong(&location, obj);

  if ((v5 ^ 1))
  {
    os_log_t v11 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v9 = 0;
      char v7 = 0;
      if (_BYIsInternalInstall())
      {
        objc_super v6 = (NSString *)location;
      }
      else if (location)
      {
        id v10 = [location domain];
        char v9 = 1;
        objc_super v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v10, [location code]);
        Class v8 = v6;
        char v7 = 1;
      }
      else
      {
        objc_super v6 = 0;
      }
      sub_10004BB7C((uint64_t)v17, (uint64_t)v6);
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to remove license sentinel file: %{public}@", v17, 0xCu);
      if (v7) {

      }
      if (v9) {
    }
      }
    objc_storeStrong((id *)&v11, 0);
  }
  +[BYWarranty acknowledge];
  +[BYLicenseAgreement recordUserAcceptedAgreementVersion:](BYLicenseAgreement, "recordUserAcceptedAgreementVersion:", +[BYLicenseAgreement versionOfOnDiskAgreement]);
  objc_storeStrong(&location, 0);
}

@end