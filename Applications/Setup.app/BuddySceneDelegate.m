@interface BuddySceneDelegate
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
@end

@implementation BuddySceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v41 = 0;
  objc_storeStrong(&v41, a4);
  id v40 = 0;
  objc_storeStrong(&v40, a5);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = location[0];
    id v8 = v41;
    id v9 = v40;
    id v10 = [v40 URLContexts];
    sub_1000F377C((uint64_t)buf, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10);
    _os_log_impl((void *)&_mh_execute_header, oslog, v38, "scene: %@ willConnectToSession: %@ options: %@ URL contexts %@", buf, 0x2Au);
  }
  objc_storeStrong((id *)&oslog, 0);
  uint64_t v33 = 0;
  v34 = &v33;
  int v35 = 0x20000000;
  int v36 = 32;
  char v37 = 0;
  v27 = _NSConcreteStackBlock;
  int v28 = -1073741824;
  int v29 = 0;
  v30 = sub_1000F37AC;
  v31 = &unk_1002B2D90;
  v32 = &v33;
  +[BuddyApplicationAndSceneSharedStorage ensureSetupControllerWithFactoryBlock:&v27];
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  id v11 = [v40 URLContexts];
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v23;
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v11);
        }
        id v26 = *(id *)(*((void *)&v22 + 1) + 8 * i);
        id v15 = [v26 URL];
        id v16 = [v15 absoluteString];
        unsigned __int8 v17 = [v16 isEqualToString:BYSetupAssistantLaunchMigrationSourceUIURL];

        if (v17)
        {
          v18 = +[BuddyApplicationAndSceneSharedStorage setupController];
          [(SetupController *)v18 setLaunchedForMigration:1];
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v22 objects:v44 count:16];
    }
    while (v12);
  }

  char v21 = 0;
  char v21 = (*((unsigned char *)v34 + 24) ^ 1) & 1;
  if (v21)
  {
    os_log_t v20 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      sub_100095D98((uint64_t)v43, (uint64_t)"-[BuddySceneDelegate scene:willConnectToSession:options:]");
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s was called multiple times!", v43, 0xCu);
    }
    objc_storeStrong((id *)&v20, 0);
  }
  else
  {
    v19 = +[BuddyApplicationAndSceneSharedStorage setupController];
    [(SetupController *)v19 runWithScene:location[0]];
  }
  _Block_object_dispose(&v33, 8);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  v5 = +[BuddyApplicationAndSceneSharedStorage setupController];
  unsigned __int8 v6 = [(SetupController *)v5 launchedForMigration];

  char v21 = v6 & 1;
  memset(__b, 0, sizeof(__b));
  id v7 = v22;
  id v8 = [v7 countByEnumeratingWithState:__b objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v8; ++i)
      {
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(v7);
        }
        id v20 = *(id *)(__b[1] + 8 * i);
        id v11 = [v20 URL];
        id v12 = [v11 absoluteString];
        char v13 = 0;
        if ([v12 isEqualToString:BYSetupAssistantLaunchMigrationSourceUIURL]) {
          char v13 = v21 ^ 1;
        }

        if (v13)
        {
          os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
          char v17 = 17;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
          {
            v14 = oslog;
            os_log_type_t v15 = v17;
            sub_10004B24C(v16);
            _os_log_fault_impl((void *)&_mh_execute_header, v14, v15, "Attempted to launch Setup for source migration after it's already running", (uint8_t *)v16, 2u);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
      }
      id v8 = [v7 countByEnumeratingWithState:__b objects:v24 count:16];
    }
    while (v8);
  }

  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)sceneWillResignActive:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyApplicationAndSceneSharedStorage setupController];
  [(SetupController *)v3 willResignActive];

  objc_storeStrong(location, 0);
}

- (void)sceneDidBecomeActive:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyApplicationAndSceneSharedStorage setupController];
  [(SetupController *)v3 didBecomeActive];

  objc_storeStrong(location, 0);
}

- (void)sceneDidEnterBackground:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyApplicationAndSceneSharedStorage setupController];
  [(SetupController *)v3 didEnterBackground];

  objc_storeStrong(location, 0);
}

@end