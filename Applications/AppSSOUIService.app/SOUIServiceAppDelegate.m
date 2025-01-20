@interface SOUIServiceAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation SOUIServiceAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = sub_10000444C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[SOUIServiceAppDelegate application:didFinishLaunchingWithOptions:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
  v4 = sub_10000444C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[SOUIServiceAppDelegate applicationWillResignActive:]";
    __int16 v7 = 2112;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  v4 = sub_10000444C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[SOUIServiceAppDelegate applicationDidEnterBackground:]";
    __int16 v7 = 2112;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  v4 = sub_10000444C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[SOUIServiceAppDelegate applicationWillEnterForeground:]";
    __int16 v7 = 2112;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  v4 = sub_10000444C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[SOUIServiceAppDelegate applicationDidBecomeActive:]";
    __int16 v7 = 2112;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)applicationWillTerminate:(id)a3
{
  v4 = sub_10000444C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    __int16 v7 = "-[SOUIServiceAppDelegate applicationWillTerminate:]";
    __int16 v8 = 2112;
    __int16 v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  int v5 = +[SOExtensionManager sharedInstance];
  [v5 unloadExtensions];
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end