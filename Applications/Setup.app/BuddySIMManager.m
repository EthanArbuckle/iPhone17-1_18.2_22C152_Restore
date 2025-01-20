@interface BuddySIMManager
+ (id)sharedManager;
- (BYTelephonyStateNotifier)telephonyStateNotifier;
- (BuddySIMManager)init;
- (void)allowSIMUnlock;
- (void)disallowSIMUnlock;
- (void)setTelephonyStateNotifier:(id)a3;
@end

@implementation BuddySIMManager

+ (id)sharedManager
{
  v5 = (dispatch_once_t *)&unk_100321EC0;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B48F0);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_100321EC8;

  return v2;
}

- (BuddySIMManager)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddySIMManager;
  v2 = [(BuddySIMManager *)&v6 init];
  id location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
  {
    id v3 = [objc_alloc((Class)BYTelephonyStateNotifier) initForNotifying];
    [location setTelephonyStateNotifier:v3];
  }
  v4 = (BuddySIMManager *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (void)allowSIMUnlock
{
  v8 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    os_log_type_t v3 = v6;
    sub_10004B24C(v5);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Allowing SIM unlock...", (uint8_t *)v5, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = [(BuddySIMManager *)v8 telephonyStateNotifier];
  [(BYTelephonyStateNotifier *)v4 notifySIMUnlockStateChangedTo:1];
}

- (void)disallowSIMUnlock
{
  v8 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    os_log_type_t v3 = v6;
    sub_10004B24C(v5);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Disallowing SIM unlock...", (uint8_t *)v5, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = [(BuddySIMManager *)v8 telephonyStateNotifier];
  [(BYTelephonyStateNotifier *)v4 notifySIMUnlockStateChangedTo:2];
}

- (BYTelephonyStateNotifier)telephonyStateNotifier
{
  return self->_telephonyStateNotifier;
}

- (void)setTelephonyStateNotifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end