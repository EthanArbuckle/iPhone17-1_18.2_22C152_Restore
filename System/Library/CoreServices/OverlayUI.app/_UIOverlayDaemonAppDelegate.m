@interface _UIOverlayDaemonAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation _UIOverlayDaemonAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v4 = UIOLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    v7 = "-[_UIOverlayDaemonAppDelegate application:didFinishLaunchingWithOptions:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v6, 0xCu);
  }

  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5 = a5;
  int v6 = [v5 _specification];
  id v7 = [v6 overlayAppSceneConfigurationName];

  if (!v7)
  {
    id v7 = UIOOverlayScenePersistenceIdentifier;
    v8 = [v5 _fbsScene];
    v9 = [v8 identifier];

    if ([v9 containsString:@"Subterranean"])
    {
      id v10 = UIOSubterraneanScenePersistenceIdentifier;

      id v7 = v10;
    }
  }
  id v11 = [objc_alloc((Class)UISceneConfiguration) initWithName:v7 sessionRole:UIWindowSceneSessionRoleApplication];

  return v11;
}

@end