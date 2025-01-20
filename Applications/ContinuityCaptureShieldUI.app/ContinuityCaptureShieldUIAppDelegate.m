@interface ContinuityCaptureShieldUIAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation ContinuityCaptureShieldUIAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = sub_10000AB00();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    int v10 = 136315650;
    v11 = "-[ContinuityCaptureShieldUIAppDelegate application:didFinishLaunchingWithOptions:]";
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: <%p> add ui state tracker %@", (uint8_t *)&v10, 0x20u);
  }
  v7 = sub_10000AB00();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = +[ContinuityCaptureShieldUIBackgroundPauseManager sharedInstance];
    int v10 = 136315650;
    v11 = "-[ContinuityCaptureShieldUIAppDelegate application:didFinishLaunchingWithOptions:]";
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: <%p> add background pause event manager %@", (uint8_t *)&v10, 0x20u);
  }
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5 = a4;
  id v6 = objc_alloc((Class)UISceneConfiguration);
  v7 = [v5 role];
  id v8 = [v6 initWithName:0 sessionRole:v7];

  v9 = [v5 role];
  unsigned __int8 v10 = [v9 isEqualToString:UIWindowSceneSessionRoleApplication];

  if ((v10 & 1) != 0
    || ([v5 role],
        v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 isEqualToString:_UIWindowSceneSessionTypeCoverSheet],
        v11,
        v12))
  {
    [v8 setDelegateClass:objc_opt_class()];
  }

  return v8;
}

@end