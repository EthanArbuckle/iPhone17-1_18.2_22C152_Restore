@interface BuddyCloudConfigManager
+ (id)sharedManager;
- (BOOL)cloudConfigWantsToSkipControllerClass:(Class)a3;
- (BOOL)hasCloudConfiguration;
- (BOOL)hasPreviouslyRetrievedMDMv1EnrollmentProfile;
- (BOOL)isMultiUser;
- (BuddyCloudConfigManager)init;
- (DMCReturnToServiceController)mdmReturnToServiceController;
- (NSDictionary)cloudConfigurationDetails;
- (id)profileConnection;
- (void)_setProfileConnection:(id)a3;
- (void)_updateSkipKeysWithCachedDetails:(id)a3;
- (void)cloudConfigMayHaveChanged;
- (void)setCloudConfigurationDetails:(id)a3;
- (void)setHasPreviouslyRetrievedMDMv1EnrollmentProfile:(BOOL)a3;
- (void)setMdmReturnToServiceController:(id)a3;
@end

@implementation BuddyCloudConfigManager

- (void)_setProfileConnection:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_profileConnection, location[0]);
  objc_storeStrong(location, 0);
}

- (id)profileConnection
{
  if (!self->_profileConnection)
  {
    v2 = (MCProfileConnection *)+[MCProfileConnection sharedConnection];
    profileConnection = self->_profileConnection;
    self->_profileConnection = v2;
  }
  v4 = self->_profileConnection;

  return v4;
}

+ (id)sharedManager
{
  v5 = (dispatch_once_t *)&unk_100321E70;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B40E8);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_100321E68;

  return v2;
}

- (BuddyCloudConfigManager)init
{
  SEL v18 = a2;
  id location = 0;
  v17.receiver = self;
  v17.super_class = (Class)BuddyCloudConfigManager;
  id location = [(BuddyCloudConfigManager *)&v17 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    dispatch_queue_t v2 = dispatch_queue_create("Cloud Config Manager SkipKey Queue", 0);
    v3 = (void *)*((void *)location + 4);
    *((void *)location + 4) = v2;

    int out_token = 0;
    uint32_t v15 = 0;
    v4 = (const char *)[MCProfileListChangedNotification cStringUsingEncoding:4];
    v5 = *((void *)location + 4);
    handler = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    v12 = sub_100189ED4;
    v13 = &unk_1002B4110;
    id v14 = location;
    uint32_t v15 = notify_register_dispatch(v4, &out_token, v5, &handler);
    if (v15)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_100189F8C((uint64_t)buf, MCProfileListChangedNotification, v15);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Could not register for %{public}@ notification. Error: %{public}d", buf, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&v14, 0);
  }
  v6 = (BuddyCloudConfigManager *)location;
  objc_storeStrong(&location, 0);
  return v6;
}

- (void)setCloudConfigurationDetails:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v16->_cloudConfigurationDetails != location[0]
    && ([location[0] isEqualToDictionary:v16->_cloudConfigurationDetails] & 1) == 0)
  {
    objc_storeStrong((id *)&v16->_cloudConfigurationDetails, location[0]);
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100046588((uint64_t)buf, (uint64_t)v16->_cloudConfigurationDetails);
      _os_log_impl((void *)&_mh_execute_header, oslog, v13, "Cloud Config changed: %p", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    os_log_t v12 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      sub_10004B238((uint64_t)v17, (uint64_t)v16->_cloudConfigurationDetails);
      _os_log_debug_impl((void *)&_mh_execute_header, v12, v11, "%@", v17, 0xCu);
    }
    objc_storeStrong((id *)&v12, 0);
    skipKeysQueue = v16->skipKeysQueue;
    block = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    v7 = sub_10018A1F8;
    v8 = &unk_1002B12F0;
    v9 = v16;
    id v10 = location[0];
    dispatch_sync(skipKeysQueue, &block);
    objc_storeStrong(&v10, 0);
    objc_storeStrong((id *)&v9, 0);
  }
  objc_storeStrong(location, 0);
}

- (NSDictionary)cloudConfigurationDetails
{
  if (!self->_cloudConfigurationDetails)
  {
    id v2 = [(BuddyCloudConfigManager *)self profileConnection];
    id v3 = [v2 cloudConfigurationDetails];
    [(BuddyCloudConfigManager *)self setCloudConfigurationDetails:v3];
  }
  cloudConfigurationDetails = self->_cloudConfigurationDetails;

  return cloudConfigurationDetails;
}

- (BOOL)hasCloudConfiguration
{
  id v2 = [(BuddyCloudConfigManager *)self cloudConfigurationDetails];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)cloudConfigMayHaveChanged
{
  v4 = self;
  location[1] = (id)a2;
  id v2 = [(BuddyCloudConfigManager *)self profileConnection];
  location[0] = [v2 cloudConfigurationDetails];

  if (location[0]) {
    [(BuddyCloudConfigManager *)v4 setCloudConfigurationDetails:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)cloudConfigWantsToSkipControllerClass:(Class)a3
{
  v21 = self;
  SEL v20 = a2;
  Class v19 = a3;
  uint64_t v14 = 0;
  uint32_t v15 = &v14;
  int v16 = 0x20000000;
  int v17 = 32;
  char v18 = 0;
  if (objc_opt_respondsToSelector())
  {
    id location = [(objc_class *)v19 cloudConfigSkipKey];
    if (location)
    {
      skipKeysQueue = v21->skipKeysQueue;
      block = _NSConcreteStackBlock;
      int v7 = -1073741824;
      int v8 = 0;
      v9 = sub_10018A524;
      id v10 = &unk_1002B4138;
      os_log_type_t v11 = v21;
      v12[0] = location;
      v12[1] = &v14;
      dispatch_sync(skipKeysQueue, &block);
      objc_storeStrong(v12, 0);
      objc_storeStrong((id *)&v11, 0);
    }
    objc_storeStrong(&location, 0);
  }
  char v4 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v4 & 1;
}

- (BOOL)isMultiUser
{
  unsigned __int8 v2 = +[BYManagedAppleIDBootstrap isMultiUser];
  char v8 = 0;
  char v6 = 0;
  unsigned __int8 v3 = 1;
  if ((v2 & 1) == 0)
  {
    unsigned __int8 v4 = +[BYManagedAppleIDBootstrap isSettingUpMultiUser];
    unsigned __int8 v3 = 1;
    if ((v4 & 1) == 0)
    {
      v9 = [(BuddyCloudConfigManager *)self cloudConfigurationDetails];
      char v8 = 1;
      id v7 = [(NSDictionary *)v9 objectForKeyedSubscript:kMCCCIsMultiUserKey];
      char v6 = 1;
      unsigned __int8 v3 = [v7 BOOLValue];
    }
  }
  BOOL v11 = v3 & 1;
  if (v6) {

  }
  if (v8) {
  return v11;
  }
}

- (void)_updateSkipKeysWithCachedDetails:(id)a3
{
  BOOL v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = +[NSMutableSet set];
  id v3 = +[MCProfileConnection sharedConnection];
  id v4 = [v3 skipSetupKeys];
  [v9 addObjectsFromArray:v4];

  id v5 = [location[0] objectForKeyedSubscript:kMCCCSkipSetupKey];
  [v9 addObjectsFromArray:v5];

  char v6 = (NSSet *)[v9 copy];
  skipSetupKeys = v11->_skipSetupKeys;
  v11->_skipSetupKeys = v6;

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)v11->_skipSetupKeys);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "Skip keys are: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)hasPreviouslyRetrievedMDMv1EnrollmentProfile
{
  return self->_hasPreviouslyRetrievedMDMv1EnrollmentProfile;
}

- (void)setHasPreviouslyRetrievedMDMv1EnrollmentProfile:(BOOL)a3
{
  self->_hasPreviouslyRetrievedMDMv1EnrollmentProfile = a3;
}

- (DMCReturnToServiceController)mdmReturnToServiceController
{
  return self->_mdmReturnToServiceController;
}

- (void)setMdmReturnToServiceController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end