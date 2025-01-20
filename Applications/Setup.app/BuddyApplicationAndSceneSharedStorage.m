@interface BuddyApplicationAndSceneSharedStorage
+ (SetupController)setupController;
+ (void)ensureSetupControllerWithFactoryBlock:(id)a3;
@end

@implementation BuddyApplicationAndSceneSharedStorage

+ (SetupController)setupController
{
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a2;
  if (!qword_100321B50)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    char v7 = 17;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_FAULT))
    {
      v2 = oslog[0];
      os_log_type_t v3 = v7;
      sub_10004B24C(v6);
      _os_log_fault_impl((void *)&_mh_execute_header, v2, v3, "setup controller does not exist", (uint8_t *)v6, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  v4 = (void *)qword_100321B50;

  return (SetupController *)v4;
}

+ (void)ensureSetupControllerWithFactoryBlock:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!qword_100321B50)
  {
    id v3 = (id)(*((uint64_t (**)(void))location[0] + 2))();
    v4 = (void *)qword_100321B50;
    qword_100321B50 = (uint64_t)v3;
  }
  objc_storeStrong(location, 0);
}

@end