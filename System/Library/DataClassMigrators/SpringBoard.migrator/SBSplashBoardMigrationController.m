@interface SBSplashBoardMigrationController
- (SBSplashBoardMigrationController)init;
- (id)allSplashBoardApplications;
- (id)launchRequestsForApplication:(id)a3 withCompatibilityInfo:(id)a4 defaultLaunchRequests:(id)a5;
- (id)systemAppsNeedingMigrationLaunchImages;
- (void)performCleanupAfterDifferentDeviceMigration;
- (void)performSystemAppMigrationRecreating:(id)a3;
@end

@implementation SBSplashBoardMigrationController

- (SBSplashBoardMigrationController)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBSplashBoardMigrationController;
  v2 = [(SBSplashBoardMigrationController *)&v12 init];
  if (v2)
  {
    v3 = (XBApplicationProviding *)objc_alloc_init((Class)XBDefaultApplicationProvider);
    applicationProvider = v2->_applicationProvider;
    v2->_applicationProvider = v3;

    id v5 = objc_alloc((Class)FBSDisplayConfiguration);
    v6 = +[CADisplay mainDisplay];
    id v7 = [v5 initWithCADisplay:v6];

    v8 = +[SBMainDisplayConfigurationTransformer transformedMainDisplayConfigurationForConfiguration:v7];
    v9 = (XBApplicationController *)[objc_alloc((Class)XBApplicationController) initWithMainDisplayConfiguration:v8 applicationProvider:v2->_applicationProvider launchRequestProvider:v2 configureCacheDelete:0];
    splashBoardController = v2->_splashBoardController;
    v2->_splashBoardController = v9;

    if ((MGGetBoolAnswer() & 1) == 0) {
      [(XBApplicationController *)v2->_splashBoardController deleteAllSnapshotsIfScreenSizeChanged];
    }
  }
  return v2;
}

- (id)systemAppsNeedingMigrationLaunchImages
{
  v3 = [(XBApplicationProviding *)self->_applicationProvider splashBoardSystemApplications];
  v4 = [(XBApplicationController *)self->_splashBoardController findRecentlyUsedOfApplications:v3];
  if ([v4 count])
  {
    id v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      id v9 = [v4 count];
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "migrating some launch images (%lu)", (uint8_t *)&v8, 0xCu);
    }
    id v6 = v4;
  }
  else
  {
    id v6 = v3;

    id v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      id v9 = [v6 count];
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "generating all launch images (%lu)", (uint8_t *)&v8, 0xCu);
    }
  }

  return v6;
}

- (void)performSystemAppMigrationRecreating:(id)a3
{
  applicationProvider = self->_applicationProvider;
  id v5 = a3;
  id v6 = [(XBApplicationProviding *)applicationProvider splashBoardSystemApplications];
  [(XBApplicationController *)self->_splashBoardController removeCachedLaunchImagesForApplications:v6 forgettingApps:0];
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  splashBoardController = self->_splashBoardController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10260;
  v12[3] = &unk_197B0;
  dispatch_semaphore_t v13 = v7;
  id v9 = v7;
  [(XBApplicationController *)splashBoardController captureOrUpdateLaunchImagesForApplications:v5 firstImageIsReady:0 completion:v12];

  dispatch_time_t v10 = dispatch_time(0, 300000000000);
  dispatch_semaphore_wait(v9, v10);
  id v11 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
  [v11 setObject:&__kCFBooleanTrue forKey:@"XBCaptureLaunchImagesPostMigration"];
}

- (void)performCleanupAfterDifferentDeviceMigration
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [(XBApplicationProviding *)self->_applicationProvider allInstalledApplications];
  id v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v14;
    uint64_t v5 = SBLaunchImageIngestionInfoKey;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        dispatch_semaphore_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v8 = [v7 bundleIdentifier];
        id v9 = +[XBApplicationDataStore sharedInstance];
        [v9 _clearCompatibilityInfoForBundleIdentifier:v8];
        id v10 = [objc_alloc((Class)XBApplicationSnapshotManifest) initWithApplicationInfo:v7];
        [v10 deleteAllSnapshots];
        id v11 = +[FBSApplicationDataStore storeForApplication:v8];
        [v11 removeObjectForKey:v5];
      }
      id v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

- (id)allSplashBoardApplications
{
  return [(XBApplicationProviding *)self->_applicationProvider allSplashBoardApplications];
}

- (id)launchRequestsForApplication:(id)a3 withCompatibilityInfo:(id)a4 defaultLaunchRequests:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  int v8 = +[NSMutableArray array];
  if ([v6 supportsDeviceFamily:2]) {
    int v9 = SBLayoutSupportsSideLayoutRole();
  }
  else {
    int v9 = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "addObject:", v15, (void)v19);
        if (v9)
        {
          double v16 = SBLayoutDefaultSideLayoutElementWidth((uint64_t)[v15 interfaceOrientation]);
          id v17 = [v15 copy];
          [v15 naturalSize];
          [v17 setNaturalSize:v16];
          [v8 addObject:v17];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splashBoardController, 0);

  objc_storeStrong((id *)&self->_applicationProvider, 0);
}

@end