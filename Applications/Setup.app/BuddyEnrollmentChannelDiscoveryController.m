@interface BuddyEnrollmentChannelDiscoveryController
+ (BOOL)controllerNeedsToRun;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BuddyEnrollmentCoordinator)enrollmentCoordinator;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnrollmentCoordinator:(id)a3;
@end

@implementation BuddyEnrollmentChannelDiscoveryController

+ (BOOL)controllerNeedsToRun
{
  id v2 = +[BuddyCloudConfigManager sharedManager];
  unsigned __int8 v3 = [v2 hasCloudConfiguration];
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  BOOL v4 = 0;
  if (v3)
  {
    id v11 = +[BuddyCloudConfigManager sharedManager];
    char v10 = 1;
    id v9 = [v11 cloudConfigurationDetails];
    char v8 = 1;
    id v7 = [v9 objectForKeyedSubscript:kCCEnrollmentServerKey];
    char v6 = 1;
    BOOL v4 = v7 != 0;
  }
  BOOL v12 = v4;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  return v12;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyEnrollmentChannelDiscoveryController *)v31 enrollmentCoordinator];
  unint64_t v4 = [(BuddyEnrollmentCoordinator *)v3 mdmEnrollmentChannel];

  if (v4)
  {
    id v29 = (id)_BYLoggingFacility();
    os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v29;
      os_log_type_t v6 = v28;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "We have fetched enrollment channel before. Skipping...", buf, 2u);
    }
    objc_storeStrong(&v29, 0);
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    int v26 = 1;
  }
  else
  {
    id v7 = +[BuddyCloudConfigManager sharedManager];
    id v25 = [v7 cloudConfigurationDetails];

    id v8 = [v25 objectForKeyedSubscript:kCCEnrollmentServerKey];
    id v9 = [v8 objectForKeyedSubscript:kCCEnrollmentURLKey];
    id v24 = +[NSURL URLWithString:v9];

    if (v24)
    {
      BOOL v12 = [(BuddyEnrollmentChannelDiscoveryController *)v31 enrollmentCoordinator];
      id v13 = [v25 objectForKeyedSubscript:kCCEnrollmentServerKey];
      id v14 = [v13 objectForKeyedSubscript:kCCEnrollmentAnchorCertificatesKey];
      v15 = _NSConcreteStackBlock;
      int v16 = -1073741824;
      int v17 = 0;
      v18 = sub_100137D48;
      v19 = &unk_1002B0D70;
      id v20 = location[0];
      [(BuddyEnrollmentCoordinator *)v12 discoverAndStoreEnrollmentChannelWithEnrollmentURL:v24 certificateDatas:v14 completionHandler:&v15];

      objc_storeStrong(&v20, 0);
      int v26 = 0;
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      char v22 = 16;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        char v10 = oslog;
        os_log_type_t v11 = v22;
        sub_10004B24C(v21);
        _os_log_error_impl((void *)&_mh_execute_header, v10, v11, "No enrollment URL!", v21, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
      int v26 = 1;
    }
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
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

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  return self->enrollmentCoordinator;
}

- (void)setEnrollmentCoordinator:(id)a3
{
}

- (BFFFlowItemDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (BFFFlowItemDelegate *)a3;
}

- (void).cxx_destruct
{
}

@end