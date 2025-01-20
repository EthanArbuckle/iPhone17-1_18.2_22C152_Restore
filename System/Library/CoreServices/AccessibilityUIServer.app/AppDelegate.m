@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)destroyScene:(id)a3;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (int64_t)defaultSceneAttemptCount;
- (int64_t)preferredSceneAttemptCount;
- (void)requestSceneForSceneClientIdentifier:(id)a3 scenePreferredLevel:(double)a4 spatialConfiguration:(id)a5;
- (void)setDefaultSceneAttemptCount:(int64_t)a3;
- (void)setPreferredSceneAttemptCount:(int64_t)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = +[AXUIServiceManager sharedServiceManager];
  [v5 _applicationDidFinishLaunching];

  v6 = +[AXUIServiceManager sharedServiceManager];
  [v6 setDelegate:self];

  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v6 = a4;
  v7 = [a5 userActivities];
  v8 = [v7 anyObject];

  v9 = [v8 activityType];
  if ([v9 length])
  {
    v10 = [v8 activityType];
  }
  else
  {
    v10 = @"Default Configuration";
  }

  v11 = AXLogUI();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Creating configurationName: %@", (uint8_t *)&v16, 0xCu);
  }

  id v12 = objc_alloc((Class)UISceneConfiguration);
  v13 = [v6 role];

  id v14 = [v12 initWithName:v10 sessionRole:v13];
  [v14 setDelegateClass:objc_opt_class()];

  return v14;
}

- (void)requestSceneForSceneClientIdentifier:(id)a3 scenePreferredLevel:(double)a4 spatialConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = AXLogUI();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = +[NSNumber numberWithDouble:a4];
    *(_DWORD *)buf = 138412546;
    id v36 = v8;
    __int16 v37 = 2112;
    v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "requestSceneForSceneClientIdentifier: %@, scenePreferredLevel: %@", buf, 0x16u);
  }
  if ([v8 isEqualToString:@"kAXUIServerActiveWindowSceneClientIdentifier"])
  {
    id v12 = objc_opt_new();
    v13 = [v12 uiSceneSessionRole];
    id v14 = +[UISceneSessionActivationRequest requestWithRole:v13];

    id v15 = [objc_alloc((Class)NSUserActivity) initWithActivityType:v8];
    CFStringRef v33 = @"AXUIServerPreferredLevelKey";
    v34 = &off_100008578;
    int v16 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v15 setUserInfo:v16];

    [v14 setUserActivity:v15];
    v17 = +[UIApplication sharedApplication];
    [v17 activateSceneSessionForRequest:v14 errorHandler:&stru_100008300];
  }
  else if (([v8 isEqualToString:@"kAXVOTMainSceneClientIdentifier"] & 1) != 0 {
         || ([v8 isEqualToString:@"kAXVOTScreenCurtainSceneClientIdentifier"] & 1) != 0
  }
         || ([v8 isEqualToString:@"kAXZoomSceneClientIdentifier"] & 1) != 0
         || [v8 isEqualToString:@"kAXTrackpadSceneClientIdentifier"])
  {
    id v18 = [objc_alloc((Class)NSUserActivity) initWithActivityType:v8];
    CFStringRef v31 = @"AXUIServerPreferredLevelKey";
    v19 = +[NSNumber numberWithDouble:a4];
    v32 = v19;
    v20 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    [v18 setUserInfo:v20];

    v21 = +[UIApplication sharedApplication];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000036E0;
    v27[3] = &unk_100008350;
    v27[4] = self;
    id v28 = v8;
    double v30 = a4;
    id v29 = v9;
    [v21 requestSceneSessionActivation:0 userActivity:v18 options:0 errorHandler:v27];
  }
  else
  {
    v22 = +[UIApplication sharedApplication];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100003890;
    v23[3] = &unk_100008350;
    v23[4] = self;
    id v24 = v8;
    double v26 = a4;
    id v25 = v9;
    [v22 requestSceneSessionActivation:0 userActivity:0 options:0 errorHandler:v23];
  }
}

- (BOOL)destroyScene:(id)a3
{
  id v3 = a3;
  v4 = +[UIApplication sharedApplication];
  unsigned __int8 v5 = [v4 supportsMultipleScenes];

  id v6 = AXLogUI();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "requestSceneSessionDestruction for scene: %@", (uint8_t *)&v11, 0xCu);
    }

    if (!v3)
    {
      id v8 = AXLogUI();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_100004804(v8);
      }
    }
    id v6 = +[UIApplication sharedApplication];
    id v9 = [v3 session];
    [v6 requestSceneSessionDestruction:v9 options:0 errorHandler:&stru_100008370];
  }
  else if (v7)
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Multiple scenes is not supported, Can't destroy scene: %@", (uint8_t *)&v11, 0xCu);
  }

  return v5;
}

- (int64_t)defaultSceneAttemptCount
{
  return self->_defaultSceneAttemptCount;
}

- (void)setDefaultSceneAttemptCount:(int64_t)a3
{
  self->_defaultSceneAttemptCount = a3;
}

- (int64_t)preferredSceneAttemptCount
{
  return self->_preferredSceneAttemptCount;
}

- (void)setPreferredSceneAttemptCount:(int64_t)a3
{
  self->_preferredSceneAttemptCount = a3;
}

@end