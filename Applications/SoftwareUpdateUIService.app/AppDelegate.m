@interface AppDelegate
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)applicationDidFinishLaunching:(id)a3;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)SUSUILog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    log = v7;
    os_log_type_t type = v6;
    sub_100005A54(v5);
    _os_log_impl((void *)&_mh_execute_header, log, type, "App did finish launching.", v5, 2u);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  id v11 = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    sub_100009DA8((uint64_t)v15, (uint64_t)"-[AppDelegate application:configurationForConnectingSceneSession:options:]");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "%s", v15, 0xCu);
  }
  objc_storeStrong(&v11, 0);
  id v6 = objc_alloc((Class)UISceneConfiguration);
  id v7 = [v13 role];
  id v8 = [v6 initWithName:@"Default Configuration"];

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);

  return v8;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100009DA8((uint64_t)v8, (uint64_t)"-[AppDelegate application:didDiscardSceneSessions:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s", v8, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

@end