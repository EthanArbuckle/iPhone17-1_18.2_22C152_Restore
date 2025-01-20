@interface BuddyAppleIDFacetimeRegistrationManager
+ (void)registerWithAllAliases;
@end

@implementation BuddyAppleIDFacetimeRegistrationManager

+ (void)registerWithAllAliases
{
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    os_log_type_t v3 = v9;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Register FaceTime aliases", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  id v4 = [sub_1001BA510() sharedInstance];
  id location = [v4 candidateAliases];

  id v5 = [sub_1001BA510() sharedInstance];
  [v5 setSelectedAliases:location];

  id v6 = [sub_1001BA510() sharedInstance];
  [v6 beginSetupWithCompletionHandler:&stru_1002B4828];

  objc_storeStrong(&location, 0);
}

@end