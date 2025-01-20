@interface MISystemAppMigrator
- (BOOL)_getLSEligiblityKey:(id)a3 appliesTo:(BOOL *)a4 forBundleID:(id)a5 withAppInfo:(id)a6 withEvaluator:(id)a7;
- (BOOL)appInstalledSuccessfullyWithBundleID:(id)a3;
- (BOOL)attemptToInstallSystemAppWithBundleID:(id)a3 desiredAppState:(int)a4 stagedAppOrPatchURL:(id)a5 isInstalled:(BOOL)a6;
- (BOOL)demoteAppWithBundleID:(id)a3 demotionReason:(unint64_t)a4;
- (BOOL)demoteAppWithBundleID:(id)a3 desiredAppState:(int)a4 isInstalled:(BOOL)a5;
- (BOOL)existsUnusedDataContainerWithBundleID:(id)a3;
- (BOOL)firstTimeEncounteringDeletableSystemAppWithBundleId:(id)a3;
- (BOOL)installDemotedPlaceholderWithBundleID:(id)a3 installType:(unint64_t)a4;
- (BOOL)installOrUpdateAppWithBundleID:(id)a3 appURL:(id)a4 isInstalled:(BOOL)a5;
- (BOOL)isCurrentlyInstalledAppInTrustCacheForBundleID:(id)a3;
- (BOOL)isRegulatedForChina;
- (BOOL)isiPad;
- (BOOL)performMigration;
- (BOOL)setInstallOptionsForCoordinator:(id)a3 bundleID:(id)a4 error:(id *)a5;
- (BOOL)setPlaceholderPromiseForCoordinator:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 error:(id *)a6;
- (BOOL)setSystemAppState:(int)a3 forBundleID:(id)a4;
- (BOOL)shouldIgnoreAppsNotInTrustCache;
- (BOOL)waitForSystemAppInstallDispatchGroup;
- (MISystemAppMigrator)init;
- (NSArray)preferencesToMigrate;
- (NSDictionary)itemsToInstall;
- (NSDictionary)startingSystemAppState;
- (NSMutableSet)appBundleIDsInstalledSuccessfully;
- (NSMutableSet)appBundleIDsRequestingStoreDownload;
- (NSMutableSet)appBundleIDsToUninstall;
- (NSMutableSet)currentlyInstallingCoordinators;
- (NSMutableSet)pendingAppInstalls;
- (NSSet)forceInstallBundleIDs;
- (NSString)deviceClass;
- (NSString)previousBuildVersion;
- (NSURL)ignoreAppsNotInTrustCacheSentinelFileURL;
- (OS_dispatch_group)systemAppInstallGroup;
- (OS_dispatch_queue)installedAppListQueue;
- (OS_dispatch_queue)pendingAppInstallListQueue;
- (id)_removeNotAllowedAppsFromSystemAppState:(id)a3;
- (id)currentlyInstalledSystemAppBundleIdentifiers;
- (id)dataClassName;
- (id)lookupSystemAppStateWithOptions:(id)a3;
- (void)capturePreferencesToMigrate;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)enterSystemAppInstallDispatchGroupForBundleID:(id)a3;
- (void)finalizePreferencesToMigrate;
- (void)handleAppEligibilityRequirements;
- (void)handleAppFeatureFlagRequirements;
- (void)handleAppsMissingRequiredCapabilities;
- (void)handleAppsNotCompatibleWithDeviceFamily;
- (void)handleDefaultInstall;
- (void)handleForceInstalledApps;
- (void)handleSpecialAppActivity;
- (void)handleSpecialAppNews;
- (void)handleSupersededSystemApps;
- (void)leaveSystemAppInstallDispatchGroupForBundleID:(id)a3;
- (void)markAppAsNotAllowed:(id)a3;
- (void)markAppAsUninstalled:(id)a3;
- (void)markAppSuccessfullyInstalledWithBundleID:(id)a3;
- (void)setAppBundleIDsInstalledSuccessfully:(id)a3;
- (void)setAppBundleIDsRequestingStoreDownload:(id)a3;
- (void)setAppBundleIDsToUninstall:(id)a3;
- (void)setCurrentlyInstallingCoordinators:(id)a3;
- (void)setItemsToInstall:(id)a3;
- (void)setPendingAppInstallListQueue:(id)a3;
- (void)setPendingAppInstalls:(id)a3;
- (void)setPreferencesToMigrate:(id)a3;
- (void)setStartingSystemAppState:(id)a3;
- (void)setSystemAppInstallGroup:(id)a3;
- (void)synchronouslyCancelAllAppStoreRequests;
- (void)usingAppStoreInstallSystemAppAppWithBundleID:(id)a3;
@end

@implementation MISystemAppMigrator

- (MISystemAppMigrator)init
{
  v72.receiver = self;
  v72.super_class = (Class)MISystemAppMigrator;
  v2 = [(MISystemAppMigrator *)&v72 init];
  v3 = v2;
  if (v2)
  {
    itemsToInstall = v2->_itemsToInstall;
    v2->_itemsToInstall = 0;

    dispatch_group_t v5 = dispatch_group_create();
    systemAppInstallGroup = v3->_systemAppInstallGroup;
    v3->_systemAppInstallGroup = (OS_dispatch_group *)v5;

    uint64_t v7 = objc_opt_new();
    pendingAppInstalls = v3->_pendingAppInstalls;
    v3->_pendingAppInstalls = (NSMutableSet *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MISystemAppMigrator.PendingAppInstallListQueue", v9);
    pendingAppInstallListQueue = v3->_pendingAppInstallListQueue;
    v3->_pendingAppInstallListQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MISystemAppMigrator.InstalledAppListQueue", v12);
    installedAppListQueue = v3->_installedAppListQueue;
    v3->_installedAppListQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = MGGetStringAnswer();
    deviceClass = v3->_deviceClass;
    v3->_deviceClass = (NSString *)v15;

    v17 = +[MIFileManager defaultManager];
    v18 = (void **)&DMGetPreviousBuildVersion_ptr;
    v19 = +[MIDaemonConfiguration sharedInstance];
    v20 = [v19 systemAppPlaceholdersDirectory];
    unsigned int v21 = [v17 itemDoesNotExistAtURL:v20];

    if (v21)
    {
      v22 = +[MIDaemonConfiguration sharedInstance];
      v23 = [v22 systemAppPlaceholdersDirectory];
      _DMLogFunc();
LABEL_30:

      return v3;
    }
    v64 = v3;
    v22 = objc_opt_new();
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v24 = +[MIDaemonConfiguration sharedInstance];
    v25 = [v24 systemAppPlaceholderBundleIDToInfoMap];
    v26 = [v25 allKeys];

    id obj = v26;
    id v27 = [v26 countByEnumeratingWithState:&v68 objects:v73 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v66 = *(void *)v69;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          v30 = v22;
          if (*(void *)v69 != v66) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void *)(*((void *)&v68 + 1) + 8 * i);
          v32 = objc_opt_new();
          v33 = v18;
          v34 = [v18[166] sharedInstance];
          v35 = [v34 stagedSystemAppBundleIDToInfoMap];
          v36 = [v35 objectForKeyedSubscript:v31];
          id v37 = [v36 objectForKeyedSubscript:@"com.apple.MobileInstallation.bundleURL"];

          if (!v37)
          {
            v38 = [v33[166] sharedInstance];
            v39 = [v38 stagedSystemAppsDirectory];
            v40 = [v39 URLByAppendingPathComponent:v31];

            v41 = +[MIFileManager defaultManager];
            LODWORD(v39) = [v41 itemExistsAtURL:v40];

            if (v39) {
              id v37 = v40;
            }
            else {
              id v37 = 0;
            }
          }
          [v32 setObject:v37 forKeyedSubscript:@"com.apple.MobileInstallation.stagedAppURL"];
          id v42 = [v32 copy];
          v22 = v30;
          [v30 setObject:v42 forKeyedSubscript:v31];

          v18 = v33;
        }
        id v28 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
      }
      while (v28);
    }

    v43 = (NSDictionary *)[v22 copy];
    v3 = v64;
    v44 = v64->_itemsToInstall;
    v64->_itemsToInstall = v43;

    uint64_t v45 = objc_opt_new();
    appBundleIDsRequestingStoreDownload = v64->_appBundleIDsRequestingStoreDownload;
    v64->_appBundleIDsRequestingStoreDownload = (NSMutableSet *)v45;

    uint64_t v47 = objc_opt_new();
    appBundleIDsToUninstall = v64->_appBundleIDsToUninstall;
    v64->_appBundleIDsToUninstall = (NSMutableSet *)v47;

    uint64_t v49 = objc_opt_new();
    appBundleIDsInstalledSuccessfully = v64->_appBundleIDsInstalledSuccessfully;
    v64->_appBundleIDsInstalledSuccessfully = (NSMutableSet *)v49;

    uint64_t v51 = objc_opt_new();
    currentlyInstallingCoordinators = v64->_currentlyInstallingCoordinators;
    v64->_currentlyInstallingCoordinators = (NSMutableSet *)v51;

    if ([(NSDictionary *)v64->_itemsToInstall count])
    {
      id v63 = [(NSDictionary *)v64->_itemsToInstall count];
      _DMLogFunc();
    }
    else
    {
      _DMLogFunc();
      v53 = v64->_itemsToInstall;
      v64->_itemsToInstall = 0;
    }
    v23 = +[NSURL fileURLWithPath:@"/private/var/preferences/com.apple.demo.SADForceInstall.plist", v63];
    id v67 = 0;
    v54 = +[NSArray arrayWithContentsOfURL:v23 error:&v67];
    id v55 = v67;
    v56 = v55;
    if (v54)
    {
      objc_opt_class();
      if (MIArrayContainsOnlyClass(v54))
      {
        uint64_t v57 = +[NSSet setWithArray:v54];
        forceInstallBundleIDs = v64->_forceInstallBundleIDs;
        v64->_forceInstallBundleIDs = (NSSet *)v57;
LABEL_28:

LABEL_29:
        preferencesToMigrate = v64->_preferencesToMigrate;
        v64->_preferencesToMigrate = (NSArray *)&__NSArray0__struct;

        goto LABEL_30;
      }
    }
    else
    {
      v59 = [v55 domain];
      if ([v59 isEqualToString:NSCocoaErrorDomain])
      {
        v60 = (uint32_t *)[v56 code];

        if (v60 == &stru_B8.reserved3) {
          goto LABEL_29;
        }
      }
      else
      {
      }
    }
    forceInstallBundleIDs = [v23 path];
    _DMLogFunc();
    goto LABEL_28;
  }
  return v3;
}

- (id)dataClassName
{
  return @"MISystemAppMigrator";
}

- (void)enterSystemAppInstallDispatchGroupForBundleID:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = [(MISystemAppMigrator *)self pendingAppInstallListQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4A00;
  v7[3] = &unk_146A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)leaveSystemAppInstallDispatchGroupForBundleID:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = [(MISystemAppMigrator *)self pendingAppInstallListQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4B20;
  v7[3] = &unk_146A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (BOOL)waitForSystemAppInstallDispatchGroup
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v3 = [(MISystemAppMigrator *)self pendingAppInstallListQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4D10;
  block[3] = &unk_146C8;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v3, block);

  id v4 = [(MISystemAppMigrator *)self systemAppInstallGroup];
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * v12[3]);
  intptr_t v6 = dispatch_group_wait(v4, v5);

  if (v6)
  {
    uint64_t v7 = [(MISystemAppMigrator *)self pendingAppInstallListQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4D74;
    v9[3] = &unk_146F0;
    v9[4] = self;
    v9[5] = &v11;
    dispatch_sync(v7, v9);
  }
  _Block_object_dispose(&v11, 8);
  return v6 == 0;
}

- (BOOL)firstTimeEncounteringDeletableSystemAppWithBundleId:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = +[MIDaemonConfiguration sharedInstance];
  intptr_t v6 = [v5 systemAppPlaceholderBundleIDToInfoMap];
  uint64_t v7 = [v6 objectForKey:v4];
  if (v7)
  {
    id v8 = [(MISystemAppMigrator *)self startingSystemAppState];
    v9 = [v8 objectForKeyedSubscript:v4];
    BOOL v10 = v9 == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)lookupSystemAppStateWithOptions:(id)a3
{
  v3 = (void *)MobileInstallationLookupSystemAppState();

  return v3;
}

- (BOOL)setSystemAppState:(int)a3 forBundleID:(id)a4
{
  return _MobileInstallationUpdateSystemAppState(a4, *(void *)&a3);
}

- (id)_removeNotAllowedAppsFromSystemAppState:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    BOOL v10 = sub_5018;
    uint64_t v11 = &unk_14718;
    v12 = self;
    id v13 = (id)objc_opt_new();
    id v5 = v13;
    [v4 enumerateKeysAndObjectsUsingBlock:&v8];

    id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)markAppAsNotAllowed:(id)a3
{
  id v4 = a3;
  _DMLogFunc();
  if (!-[MISystemAppMigrator setSystemAppState:forBundleID:](self, "setSystemAppState:forBundleID:", 6, v4, v4)) {
    _DMLogFunc();
  }
}

- (void)markAppAsUninstalled:(id)a3
{
  id v4 = a3;
  _DMLogFunc();
  if (!-[MISystemAppMigrator setSystemAppState:forBundleID:](self, "setSystemAppState:forBundleID:", 2, v4, v4)) {
    _DMLogFunc();
  }
}

- (BOOL)isRegulatedForChina
{
  char v2 = MGGetBoolAnswer();
  _DMLogFunc();
  return v2;
}

- (void)handleSpecialAppNews
{
  if ([(MISystemAppMigrator *)self isRegulatedForChina])
  {
    [(MISystemAppMigrator *)self markAppAsNotAllowed:@"com.apple.news"];
  }
}

- (NSString)previousBuildVersion
{
  p_previousBuildVersion = &self->_previousBuildVersion;
  id v4 = self->_previousBuildVersion;
  if (!v4)
  {
    if ([(MISystemAppMigrator *)self userDataDisposition] == 2) {
      DMGetPreviousBuildVersion();
    }
    else {
    id v4 = [(MISystemAppMigrator *)self restoredBackupBuildVersion];
    }
    objc_storeStrong((id *)p_previousBuildVersion, v4);
  }
  id v5 = v4;

  return v5;
}

- (BOOL)isiPad
{
  char v2 = [(MISystemAppMigrator *)self deviceClass];
  unsigned __int8 v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (void)handleSpecialAppActivity
{
  unsigned int v3 = [(MISystemAppMigrator *)self isiPad];
  if ([(MISystemAppMigrator *)self firstTimeEncounteringDeletableSystemAppWithBundleId:@"com.apple.Fitness"])
  {
    if (v3)
    {
      [(MISystemAppMigrator *)self markAppAsUninstalled:@"com.apple.Fitness"];
      return;
    }
LABEL_20:
    _DMLogFunc();
    return;
  }
  id v4 = [(MISystemAppMigrator *)self startingSystemAppState];
  id v5 = [v4 valueForKey:@"com.apple.Fitness"];
  unsigned int v6 = [v5 unsignedIntegerValue];

  if (v6 == 1) {
    return;
  }
  if (v3)
  {
    if (v6 != 6)
    {
      if (v6 == 2)
      {
LABEL_26:
        _DMLogFunc();
        return;
      }
      if (v6) {
        goto LABEL_20;
      }
    }
    if ([(MISystemAppMigrator *)self setSystemAppState:2 forBundleID:@"com.apple.Fitness"])
    {
      return;
    }
    goto LABEL_26;
  }
  if (v6 > 6 || ((1 << v6) & 0x45) == 0) {
    goto LABEL_20;
  }
  uint64_t v7 = [(MISystemAppMigrator *)self previousBuildVersion];
  id v8 = (id)v7;
  if (!v7
    || [@"20" compare:v7 options:64] == (char *)&dword_0 + 1
    && ![(MISystemAppMigrator *)self setSystemAppState:1 forBundleID:@"com.apple.Fitness"])
  {
    _DMLogFunc();
  }
}

- (void)handleAppsMissingRequiredCapabilities
{
  unsigned int v3 = [(MISystemAppMigrator *)self lookupSystemAppStateWithOptions:0];
  id v4 = +[MIDaemonConfiguration sharedInstance];
  id v5 = [v4 systemAppPlaceholderBundleIDToInfoMap];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5694;
  v7[3] = &unk_14740;
  id v8 = v3;
  uint64_t v9 = self;
  id v6 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)handleAppsNotCompatibleWithDeviceFamily
{
  unsigned int v3 = +[MIDaemonConfiguration sharedInstance];
  id v4 = [v3 systemAppPlaceholderBundleIDToInfoMap];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_58DC;
  v5[3] = &unk_14768;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

- (void)handleAppFeatureFlagRequirements
{
  unsigned int v3 = [(MISystemAppMigrator *)self lookupSystemAppStateWithOptions:0];
  id v4 = +[MIDaemonConfiguration sharedInstance];
  id v5 = [v4 systemAppPlaceholderBundleIDToInfoMap];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5AC4;
  v7[3] = &unk_14740;
  id v8 = v3;
  uint64_t v9 = self;
  id v6 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (BOOL)_getLSEligiblityKey:(id)a3 appliesTo:(BOOL *)a4 forBundleID:(id)a5 withAppInfo:(id)a6 withEvaluator:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = [a6 objectForKeyedSubscript:v11];
  objc_opt_class();
  id v15 = v14;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  if (v16)
  {
    id v25 = 0;
    id v17 = [objc_alloc((Class)LSEligibilityPredicate) initWithDictionary:v16 error:&v25];
    id v18 = v25;
    v19 = v18;
    if (v17)
    {
      id v24 = v18;
      v20 = [v13 evaluatePredicate:v17 error:&v24];
      id v21 = v24;

      if (v20)
      {
        if (a4) {
          *a4 = [v20 BOOLValue];
        }
        BOOL v22 = 1;
      }
      else
      {
        _DMLogFunc();
        BOOL v22 = 0;
      }
      v19 = v21;
    }
    else
    {
      _DMLogFunc();
      BOOL v22 = 0;
      v20 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
    v20 = 0;
    id v17 = 0;
    v19 = 0;
  }

  return v22;
}

- (void)handleAppEligibilityRequirements
{
  id v3 = objc_alloc((Class)LSEligibilityPredicateEvaluator);
  id v4 = objc_opt_new();
  id v5 = [v3 initWithResolver:v4];

  id v6 = [(MISystemAppMigrator *)self lookupSystemAppStateWithOptions:0];
  uint64_t v7 = +[MIDaemonConfiguration sharedInstance];
  id v8 = [v7 systemAppPlaceholderBundleIDToInfoMap];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_61AC;
  v11[3] = &unk_147B8;
  id v12 = v6;
  id v13 = self;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];
}

- (void)handleDefaultInstall
{
  id v3 = [(MISystemAppMigrator *)self lookupSystemAppStateWithOptions:0];
  id v4 = +[MIDaemonConfiguration sharedInstance];
  id v5 = [v4 systemAppPlaceholderBundleIDToInfoMap];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6414;
  v7[3] = &unk_14740;
  id v8 = v3;
  id v9 = self;
  id v6 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)handleForceInstalledApps
{
  id v3 = [(MISystemAppMigrator *)self forceInstallBundleIDs];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    _DMLogFunc();
    id v5 = +[MIDaemonConfiguration sharedInstance];
    id v6 = [v5 systemAppPlaceholderBundleIDToInfoMap];
    uint64_t v7 = [v6 allKeys];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v7, "containsObject:", v13, v14))
          {
            _DMLogFunc();
            if (-[MISystemAppMigrator setSystemAppState:forBundleID:](self, "setSystemAppState:forBundleID:", 1, v13, v13))
            {
              continue;
            }
          }
          uint64_t v14 = v13;
          _DMLogFunc();
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)handleSupersededSystemApps
{
  v45[0] = @"com.apple.videos";
  v45[1] = @"com.apple.mobileme.fmf1";
  v46[0] = @"com.apple.tv";
  id v3 = +[NSNull null];
  v46[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];

  id v5 = +[NSSet setWithArray:&__NSArray0__struct];
  dispatch_group_t v6 = dispatch_group_create();
  uint64_t v7 = objc_opt_new();
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_6B68;
  v40[3] = &unk_14808;
  v40[4] = self;
  id v8 = v6;
  v41 = v8;
  id v9 = v5;
  id v42 = v9;
  id v10 = v7;
  id v43 = v10;
  [v4 enumerateKeysAndObjectsUsingBlock:v40];
  if ([v10 count])
  {
    id v30 = v9;
    uint64_t v31 = v8;
    v32 = v4;
    _DMLogFunc();
    v29 = self;
    uint64_t v11 = [(MISystemAppMigrator *)self itemsToInstall];
    id v12 = [v11 mutableCopy];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v28 = v10;
    id obj = v10;
    id v13 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v34 = *(void *)v37;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v37 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          long long v17 = objc_msgSend(v12, "objectForKeyedSubscript:", v16, v24, v25, v27);
          long long v18 = [v17 objectForKeyedSubscript:@"com.apple.MobileInstallation.stagedAppURL"];
          v26 = [v18 path];
          _DMLogFunc();

          objc_msgSend(v12, "removeObjectForKey:", v16, v16, v26);
          if (v18)
          {
            v19 = +[MIFileManager defaultManager];
            id v35 = 0;
            unsigned __int8 v20 = [v19 removeItemAtURL:v18 error:&v35];
            id v21 = v35;

            if ((v20 & 1) == 0)
            {
              id v25 = [v18 path];
              id v27 = v21;
              uint64_t v24 = v16;
              _DMLogFunc();
            }
          }
        }
        id v14 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v14);
    }

    if ([v12 count])
    {
      id v22 = [v12 copy];
      [(MISystemAppMigrator *)v29 setItemsToInstall:v22];
    }
    else
    {
      [(MISystemAppMigrator *)v29 setItemsToInstall:0];
    }
    id v8 = v31;
    id v4 = v32;
    id v9 = v30;
    id v10 = v28;
  }
  _DMLogFunc();
  dispatch_time_t v23 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 30000000000);
  dispatch_group_wait(v8, v23);
  _DMLogFunc();
}

- (void)capturePreferencesToMigrate
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(MISystemAppMigrator *)self preferencesToMigrate];
  id v2 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v30;
    do
    {
      id v5 = 0;
      id v22 = v3;
      do
      {
        if (*(void *)v30 != v4) {
          objc_enumerationMutation(obj);
        }
        dispatch_group_t v6 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v5);
        uint64_t v7 = objc_msgSend(v6, "sourceBundleID", v19, v20, v21);
        id v8 = [v6 destinationBundleID];
        id v9 = objc_alloc((Class)LSApplicationRecord);
        id v28 = 0;
        id v10 = [v9 initWithBundleIdentifier:v7 allowPlaceholder:1 error:&v28];
        id v11 = v28;
        if (v10)
        {
          id v12 = [v10 dataContainerURL];
          id v13 = [v12 path];

          if (v13)
          {
            uint64_t v14 = v4;
            long long v15 = objc_opt_new();
            uint64_t v16 = [v6 keyMappings];
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v24[2] = sub_72DC;
            v24[3] = &unk_14830;
            id v25 = v7;
            id v26 = v13;
            id v17 = v15;
            id v27 = v17;
            [v16 enumerateKeysAndObjectsUsingBlock:v24];

            if ([v17 count])
            {
              id v18 = [v17 copy];
              [v6 setCapturedPreferences:v18];
            }
            uint64_t v4 = v14;
            id v3 = v22;
          }
          else
          {
            v19 = v7;
            _DMLogFunc();
          }
        }
        else
        {
          unsigned __int8 v20 = v8;
          id v21 = v11;
          v19 = v7;
          _DMLogFunc();
        }

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v3);
  }
}

- (void)finalizePreferencesToMigrate
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v2 = [(MISystemAppMigrator *)self preferencesToMigrate];
  id v3 = [v2 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v31;
    dispatch_time_t v23 = v2;
    uint64_t v24 = *(void *)v31;
    do
    {
      dispatch_group_t v6 = 0;
      id v25 = v4;
      do
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v6);
        id v8 = objc_msgSend(v7, "capturedPreferences", v20, v21, v22);
        if (v8)
        {
          id v9 = [v7 sourceBundleID];
          id v10 = [v7 destinationBundleID];
          id v11 = objc_alloc((Class)LSApplicationRecord);
          id v29 = 0;
          id v12 = [v11 initWithBundleIdentifier:v10 allowPlaceholder:1 error:&v29];
          id v13 = v29;
          if (v12)
          {
            uint64_t v14 = [v12 dataContainerURL];
            long long v15 = [v14 path];

            if (v15)
            {
              v26[0] = _NSConcreteStackBlock;
              v26[1] = 3221225472;
              v26[2] = sub_7688;
              v26[3] = &unk_14858;
              id v16 = v10;
              id v27 = v16;
              id v17 = v15;
              id v28 = v17;
              [v8 enumerateKeysAndObjectsUsingBlock:v26];
              _CFPreferencesAppSynchronizeWithContainer();
              id v21 = v16;
              id v22 = v17;
              unsigned __int8 v20 = v9;
              _DMLogFunc();
              uint64_t v18 = [v7 completion];
              v19 = (void *)v18;
              if (v18) {
                (*(void (**)(uint64_t))(v18 + 16))(v18);
              }

              id v2 = v23;
            }
            else
            {
              unsigned __int8 v20 = v10;
              _DMLogFunc();
            }
            uint64_t v5 = v24;

            id v4 = v25;
          }
          else
          {
            id v21 = v9;
            id v22 = v13;
            unsigned __int8 v20 = v10;
            _DMLogFunc();
          }
        }
        dispatch_group_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v4);
  }
}

- (void)markAppSuccessfullyInstalledWithBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MISystemAppMigrator *)self installedAppListQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_77DC;
  v7[3] = &unk_146A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (BOOL)appInstalledSuccessfullyWithBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(MISystemAppMigrator *)self installedAppListQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7930;
  block[3] = &unk_14880;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = [v5 identity];
  id v12 = (id)v7;
  CFStringRef v8 = &stru_15740;
  if (isKindOfClass) {
    CFStringRef v8 = @"(placeholder) ";
  }
  uint64_t v10 = v7;
  CFStringRef v11 = v8;
  _DMLogFunc();
  id v9 = objc_msgSend(v12, "bundleID", v10, v11);
  [(MISystemAppMigrator *)self markAppSuccessfullyInstalledWithBundleID:v9];
  [(MISystemAppMigrator *)self leaveSystemAppInstallDispatchGroupForBundleID:v9];
  [v5 setObserver:0];
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v13 = [v8 identity];
  uint64_t v10 = [v13 bundleID];
  CFStringRef v11 = &stru_15740;
  if (isKindOfClass) {
    CFStringRef v11 = @"(placeholder) ";
  }
  CFStringRef v12 = v11;
  _DMLogFunc();

  -[MISystemAppMigrator leaveSystemAppInstallDispatchGroupForBundleID:](self, "leaveSystemAppInstallDispatchGroupForBundleID:", v10, v13, v12, v7);
  [v8 setObserver:0];
}

- (BOOL)demoteAppWithBundleID:(id)a3 demotionReason:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)IXApplicationIdentity) initWithBundleIdentifier:v5];
  _DMLogFunc();
  id v10 = 0;
  unsigned __int8 v7 = +[IXAppInstallCoordinator demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:error:](IXAppInstallCoordinator, "demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:error:", v6, a4, 0, 1, &v10, v5, a4);
  id v8 = v10;
  if ((v7 & 1) == 0) {
    _DMLogFunc();
  }

  return v7;
}

- (BOOL)setPlaceholderPromiseForCoordinator:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v26 = 0;
  CFStringRef v11 = +[IXPlaceholder placeholderForRemovableSystemAppWithBundleID:v10 client:10 installType:a5 error:&v26];
  id v12 = v26;
  id v13 = v12;
  if (!v11)
  {
    _DMLogFunc();
    if (a6)
    {
LABEL_12:
      id v13 = v13;
      BOOL v17 = 0;
      *a6 = v13;
      goto LABEL_13;
    }
LABEL_6:
    BOOL v17 = 0;
    goto LABEL_13;
  }
  id v25 = v12;
  unsigned __int8 v14 = [v9 setPlaceholderPromise:v11 error:&v25];
  id v15 = v25;

  if ((v14 & 1) == 0)
  {
    id v21 = v10;
    id v22 = v15;
    _DMLogFunc();
    id v13 = v15;
    goto LABEL_9;
  }
  id v24 = v15;
  unsigned __int8 v16 = [v11 setConfigurationCompleteWithError:&v24];
  id v13 = v24;

  if ((v16 & 1) == 0)
  {
    id v21 = v10;
    id v22 = v13;
    _DMLogFunc();
LABEL_9:
    id v23 = 0;
    unsigned __int8 v18 = objc_msgSend(v11, "cancelForReason:client:error:", v13, 10, &v23, v21, v22);
    id v19 = v23;
    if ((v18 & 1) == 0) {
      _DMLogFunc();
    }

    if (a6) {
      goto LABEL_12;
    }
    goto LABEL_6;
  }
  BOOL v17 = 1;
LABEL_13:

  return v17;
}

- (BOOL)setInstallOptionsForCoordinator:(id)a3 bundleID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)MIInstallOptions);
  [v9 setInstallTargetType:1];
  [v9 setLsInstallType:6];
  [v9 setSystemAppInstall:1];
  [v9 setPerformAPFSClone:0];
  id v13 = 0;
  unsigned __int8 v10 = [v7 setInstallOptions:v9 error:&v13];
  id v11 = v13;
  if ((v10 & 1) == 0)
  {
    _DMLogFunc();
    if (a5) {
      *a5 = v11;
    }
  }

  return v10;
}

- (BOOL)installDemotedPlaceholderWithBundleID:(id)a3 installType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)IXApplicationIdentity) initWithBundleIdentifier:v6];
  _DMLogFunc();
  id v34 = 0;
  id v8 = +[IXRestoringDemotedAppInstallCoordinator processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:](IXRestoringDemotedAppInstallCoordinator, "processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:", v7, 10, 1, 0, &v34, v6, a4);
  id v9 = v34;
  if (!v8)
  {
    _DMLogFunc();
LABEL_18:
    BOOL v19 = 0;
    goto LABEL_19;
  }
  [(MISystemAppMigrator *)self enterSystemAppInstallDispatchGroupForBundleID:v6];
  [v8 setObserver:self];
  id v33 = v9;
  unsigned __int8 v10 = [v8 setImportance:3 error:&v33];
  id v11 = v33;

  if ((v10 & 1) == 0)
  {
    id v27 = v6;
    id v28 = v11;
    _DMLogFunc();
    id v9 = v11;
LABEL_15:
    id v29 = 0;
    unsigned __int8 v23 = objc_msgSend(v8, "cancelForReason:client:error:", v9, 10, &v29, v27, v28);
    id v24 = v29;
    if ((v23 & 1) == 0) {
      _DMLogFunc();
    }

    goto LABEL_18;
  }
  id v12 = [objc_alloc((Class)IXPromisedOutOfBandTransfer) initWithName:@"User data" client:10 diskSpaceNeeded:0];
  if (!v12)
  {
    _CreateError((uint64_t)"-[MISystemAppMigrator installDemotedPlaceholderWithBundleID:installType:]", 1108, MIInstallerErrorDomain, 128, 0, 0, @"Failed to create IXPromisedOutOfBandTransfer for %@", v13, (uint64_t)v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    id v27 = v9;
    _DMLogFunc();
    goto LABEL_15;
  }
  unsigned __int8 v14 = v12;
  id v32 = v11;
  unsigned __int8 v15 = [v8 setUserDataPromise:v12 error:&v32];
  id v9 = v32;

  if ((v15 & 1) == 0)
  {
    id v26 = v6;
    id v28 = v9;
    _DMLogFunc();
LABEL_12:
    id v30 = 0;
    unsigned __int8 v20 = objc_msgSend(v14, "cancelForReason:client:error:", v9, 10, &v30, v26, v28);
    id v21 = v30;
    id v22 = v21;
    if ((v20 & 1) == 0)
    {
      id v27 = v6;
      id v28 = v21;
      _DMLogFunc();
    }

    goto LABEL_15;
  }
  id v31 = v9;
  unsigned int v16 = [(MISystemAppMigrator *)self setPlaceholderPromiseForCoordinator:v8 bundleID:v6 installType:a4 error:&v31];
  id v17 = v31;

  if (!v16)
  {
    id v9 = v17;
    goto LABEL_12;
  }
  unsigned __int8 v18 = [(MISystemAppMigrator *)self currentlyInstallingCoordinators];
  [v18 addObject:v8];

  BOOL v19 = 1;
  [v14 setComplete:1];

  id v9 = v17;
LABEL_19:

  return v19;
}

- (BOOL)demoteAppWithBundleID:(id)a3 desiredAppState:(int)a4 isInstalled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (!v5)
  {
    uint64_t v12 = 7;
    if (a4 == 5) {
      uint64_t v12 = 9;
    }
    if (a4 == 4) {
      uint64_t v13 = 8;
    }
    else {
      uint64_t v13 = v12;
    }
    if (![(MISystemAppMigrator *)self installDemotedPlaceholderWithBundleID:v8 installType:v13])goto LABEL_8; {
LABEL_15:
    }
    BOOL v11 = 1;
    goto LABEL_16;
  }
  uint64_t v9 = 3;
  if (a4 != 5) {
    uint64_t v9 = 1;
  }
  if (a4 == 4) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = v9;
  }
  if ([(MISystemAppMigrator *)self demoteAppWithBundleID:v8 demotionReason:v10])
  {
    goto LABEL_15;
  }
LABEL_8:
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (BOOL)installOrUpdateAppWithBundleID:(id)a3 appURL:(id)a4 isInstalled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [objc_alloc((Class)IXApplicationIdentity) initWithBundleIdentifier:v8];
  if (v5) {
    CFStringRef v11 = @"Updating";
  }
  else {
    CFStringRef v11 = @"Initiating";
  }
  v40 = [v9 path];
  _DMLogFunc();

  if (v5)
  {
    uint64_t v49 = 0;
    uint64_t v12 = (id *)&v49;
    uint64_t v13 = +[IXUpdatingAppInstallCoordinator processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:](IXUpdatingAppInstallCoordinator, "processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:", v10, 10, 1, 0, &v49, v11, v10, v40);
    uint64_t v14 = 5;
  }
  else
  {
    uint64_t v48 = 0;
    uint64_t v12 = (id *)&v48;
    uint64_t v13 = +[IXInitiatingAppInstallCoordinator processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:](IXInitiatingAppInstallCoordinator, "processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:", v10, 10, 1, 0, &v48, v11, v10, v40);
    uint64_t v14 = 6;
  }
  id v16 = *v12;
  if (!v13)
  {
    _CreateError((uint64_t)"-[MISystemAppMigrator installOrUpdateAppWithBundleID:appURL:isInstalled:]", 1202, MIInstallerErrorDomain, 128, 0, 0, @"Failed to create AppInstallCoordinator for %@: %@", v15, (uint64_t)v8);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    _DMLogFunc();
LABEL_29:
    BOOL v31 = 0;
    goto LABEL_30;
  }
  [(MISystemAppMigrator *)self enterSystemAppInstallDispatchGroupForBundleID:v8];
  [v13 setObserver:self];
  id v47 = v16;
  unsigned __int8 v17 = [v13 setImportance:3 error:&v47];
  id v18 = v47;

  if ((v17 & 1) == 0)
  {
    id v38 = v8;
    id v39 = v18;
LABEL_17:
    _DMLogFunc();
LABEL_26:
    id v41 = 0;
    unsigned __int8 v35 = objc_msgSend(v13, "cancelForReason:client:error:", v18, 10, &v41, v38, v39);
    id v36 = v41;
    if ((v35 & 1) == 0) {
      _DMLogFunc();
    }

    goto LABEL_29;
  }
  id v46 = v18;
  unsigned __int8 v19 = [v13 setInitialODRAssetPromises:&__NSArray0__struct error:&v46];
  id v20 = v46;

  if ((v19 & 1) == 0)
  {
    id v38 = v8;
    id v39 = v20;
    _DMLogFunc();
    id v18 = v20;
    goto LABEL_26;
  }
  id v45 = v20;
  unsigned int v21 = [(MISystemAppMigrator *)self setPlaceholderPromiseForCoordinator:v13 bundleID:v8 installType:v14 error:&v45];
  id v22 = v45;

  if (!v21)
  {
    id v18 = v22;
    goto LABEL_26;
  }
  id v23 = objc_alloc((Class)IXPromisedTransferToPath);
  id v24 = [v9 lastPathComponent];
  id v25 = [v23 initWithName:v24 client:10 transferPath:v9 diskSpaceNeeded:0];

  if (!v25)
  {
    _CreateError((uint64_t)"-[MISystemAppMigrator installOrUpdateAppWithBundleID:appURL:isInstalled:]", 1228, MIInstallerErrorDomain, 128, 0, 0, @"Failed to create IXPromisedTransferToPath for %@", v26, (uint64_t)v8);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    id v38 = v18;
    goto LABEL_17;
  }
  id v44 = v22;
  unsigned __int8 v27 = [v13 setAppAssetPromise:v25 error:&v44];
  id v18 = v44;

  if ((v27 & 1) == 0)
  {
    id v38 = v8;
    id v39 = v18;
    _DMLogFunc();
LABEL_23:
    id v42 = 0;
    unsigned __int8 v32 = objc_msgSend(v25, "cancelForReason:client:error:", v18, 10, &v42, v38, v39);
    id v33 = v42;
    id v34 = v33;
    if ((v32 & 1) == 0)
    {
      id v38 = v8;
      id v39 = v33;
      _DMLogFunc();
    }

    goto LABEL_26;
  }
  id v43 = v18;
  unsigned int v28 = [(MISystemAppMigrator *)self setInstallOptionsForCoordinator:v13 bundleID:v8 error:&v43];
  id v29 = v43;

  if (!v28)
  {
    id v18 = v29;
    goto LABEL_23;
  }
  id v30 = [(MISystemAppMigrator *)self currentlyInstallingCoordinators];
  [v30 addObject:v13];

  BOOL v31 = 1;
  [v25 setComplete:1];

  id v18 = v29;
LABEL_30:

  return v31;
}

- (void)usingAppStoreInstallSystemAppAppWithBundleID:(id)a3
{
  id v3 = a3;
  id v5 = [objc_alloc((Class)ASDSystemAppRequest) initWithBundleID:v3];
  _DMLogFunc();

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8860;
  v6[3] = &unk_148A8;
  id v7 = v5;
  id v4 = v5;
  objc_msgSend(v4, "startWithErrorHandler:", v6, v3, v5);
}

- (void)synchronouslyCancelAllAppStoreRequests
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  _DMLogFunc();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_89C4;
  v5[3] = &unk_148A8;
  id v3 = v2;
  id v6 = v3;
  +[ASDRequest cancelAllRequestsWithErrorHandler:v5];
  dispatch_time_t v4 = dispatch_time(0, 45000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_B3E8();
    }
  }
  else
  {
    _DMLogFunc();
  }
}

- (NSURL)ignoreAppsNotInTrustCacheSentinelFileURL
{
  dispatch_semaphore_t v2 = +[MIDaemonConfiguration sharedInstance];
  id v3 = [v2 installdPath];
  dispatch_time_t v4 = [v3 URLByAppendingPathComponent:@"SystemAppMigratorIgnoreAppsNotInTrustCache" isDirectory:0];

  return (NSURL *)v4;
}

- (BOOL)shouldIgnoreAppsNotInTrustCache
{
  id v3 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v4 = [v3 codeSigningEnforcementIsDisabled];

  if (!v4) {
    return 0;
  }
  id v5 = +[MIFileManager defaultManager];
  id v6 = [(MISystemAppMigrator *)self ignoreAppsNotInTrustCacheSentinelFileURL];
  unsigned __int8 v7 = [v5 itemExistsAtURL:v6];

  return v7;
}

- (BOOL)isCurrentlyInstalledAppInTrustCacheForBundleID:(id)a3
{
  id v3 = a3;
  id v14 = 0;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v14];
  id v5 = v14;
  if (!v4) {
    goto LABEL_5;
  }
  id v6 = [v4 URL];
  unsigned __int8 v7 = [v6 path];
  v15[0] = kMISValidationOptionAllowAdHocSigning;
  v15[1] = kMISValidationOptionValidateSignatureOnly;
  v16[0] = &__kCFBooleanTrue;
  v16[1] = &__kCFBooleanTrue;
  v15[2] = kMISValidationOptionAllowLaunchWarning;
  v15[3] = kMISValidationOptionTrustCacheOnly;
  v16[2] = &__kCFBooleanTrue;
  v16[3] = &__kCFBooleanTrue;
  +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  int v8 = MISValidateSignature();

  if (v8 == -402620377)
  {
LABEL_5:
    _DMLogFunc();
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  if (v8)
  {
    id v10 = [v4 URL];
    CFStringRef v11 = [v10 path];
    uint64_t v13 = MIErrorStringForMISError();
    _DMLogFunc();

    goto LABEL_7;
  }
  _DMLogFunc();
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)existsUnusedDataContainerWithBundleID:(id)a3
{
  id v3 = a3;
  id v4 = +[MIGlobalConfiguration sharedInstance];
  id v5 = [v4 primaryPersonaString];
  id v17 = 0;
  id v6 = +[MIMCMContainer containerForIdentifier:v3 contentClass:2 forPersona:v5 create:0 error:&v17];
  id v7 = v17;

  if (v6)
  {
    id v16 = v7;
    int v8 = [v6 infoValueForKey:@"com.apple.MobileContainerManager.SafeHarborInfo" error:&v16];
    id v9 = v16;

    if (v8)
    {
      _DMLogFunc();
    }
    else
    {
      uint64_t v12 = [v9 domain];
      if ([v12 isEqualToString:MIContainerManagerErrorDomain])
      {
        uint64_t v13 = (int *)[v9 code];

        if (v13 == &dword_18)
        {
          BOOL v14 = 1;
LABEL_16:
          id v7 = v9;
          goto LABEL_17;
        }
      }
      else
      {
      }
      _DMLogFunc();
    }
    BOOL v14 = 0;
    goto LABEL_16;
  }
  id v10 = [v7 domain];
  if ([v10 isEqualToString:MIContainerManagerErrorDomain])
  {
    CFStringRef v11 = (char *)[v7 code];

    if (v11 == (unsigned char *)&dword_14 + 1) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  _DMLogFunc();
LABEL_12:
  BOOL v14 = 0;
LABEL_17:

  return v14;
}

- (BOOL)attemptToInstallSystemAppWithBundleID:(id)a3 desiredAppState:(int)a4 stagedAppOrPatchURL:(id)a5 isInstalled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (__CFString *)[objc_alloc((Class)IXApplicationIdentity) initWithBundleIdentifier:v10];
  CFStringRef v13 = @"NOT ";
  if (v6) {
    CFStringRef v13 = &stru_15740;
  }
  CFStringRef v35 = v13;
  _DMLogFunc();
  uint64_t v15 = _CreateError((uint64_t)"-[MISystemAppMigrator attemptToInstallSystemAppWithBundleID:desiredAppState:stagedAppOrPatchURL:isInstalled:]", 1396, MIInstallerErrorDomain, 128, 0, 0, @"Intentional Cancel from SystemAppMigrator", v14, (uint64_t)v10);
  id v40 = 0;
  unsigned __int8 v16 = +[IXAppInstallCoordinator cancelCoordinatorForAppWithIdentity:v12 withReason:v15 client:10 error:&v40];
  id v17 = (__CFString *)v40;

  if (v16)
  {
    id v33 = v12;
    _DMLogFunc();
    goto LABEL_11;
  }
  id v18 = [(__CFString *)v17 domain];
  if ([v18 isEqualToString:IXErrorDomain])
  {
    unsigned __int8 v19 = (char *)[(__CFString *)v17 code];

    if (v19 == (unsigned char *)&dword_4 + 2) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v33 = v12;
  CFStringRef v35 = v17;
  _DMLogFunc();
LABEL_10:

  id v17 = 0;
LABEL_11:
  if ((v8 | 4) == 6)
  {
    id v20 = +[LSApplicationWorkspace defaultWorkspace];
    unsigned int v21 = [v20 applicationIsInstalled:v10];

    if (v21)
    {
      CFStringRef v22 = @"(placeholder) ";
      if (v6) {
        CFStringRef v22 = &stru_15740;
      }
      id v34 = v12;
      CFStringRef v35 = v22;
      _DMLogFunc();
      uint64_t v39 = 0;
      id v23 = objc_opt_new();
      id v24 = v23;
      if (v8 == 6) {
        objc_msgSend(v23, "setSystemAppNotAllowed:", 1, v12, v35, 6);
      }
      objc_msgSend(v24, "setIgnoreRemovability:", 1, v34);
      [v24 setIgnoreRestrictions:1];
      [v24 setIgnoreAppProtection:1];
      id v38 = v17;
      unsigned __int8 v25 = +[IXAppInstallCoordinator uninstallAppWithIdentity:v12 options:v24 disposition:&v39 error:&v38];
      CFStringRef v26 = v38;

      if (v25)
      {
        if (v39 == 3)
        {
          BOOL v27 = 1;
LABEL_33:

          goto LABEL_37;
        }
        id v33 = IXStringForUninstallDisposition();
        CFStringRef v35 = v12;
        _DMLogFunc();
      }
      else
      {
        id v33 = v12;
        CFStringRef v35 = v26;
        _DMLogFunc();
      }
      BOOL v27 = 0;
      goto LABEL_33;
    }
    if (![(MISystemAppMigrator *)self existsUnusedDataContainerWithBundleID:v10])
    {
      id v33 = v12;
      _DMLogFunc();
      goto LABEL_30;
    }
    _DMLogFunc();
    if (-[MISystemAppMigrator demoteAppWithBundleID:desiredAppState:isInstalled:](self, "demoteAppWithBundleID:desiredAppState:isInstalled:", v10, v8, v6, v10, v35, v8))
    {
      unsigned int v28 = [(MISystemAppMigrator *)self appBundleIDsToUninstall];
      [v28 addObject:v10];

      goto LABEL_30;
    }
    id v33 = v12;
    goto LABEL_35;
  }
  if ((v8 - 3) <= 1)
  {
    _DMLogFunc();
    if (-[MISystemAppMigrator demoteAppWithBundleID:desiredAppState:isInstalled:](self, "demoteAppWithBundleID:desiredAppState:isInstalled:", v10, v8, v6, v12, v35, v8))
    {
LABEL_30:
      BOOL v27 = 1;
LABEL_36:
      CFStringRef v26 = v17;
LABEL_37:
      id v17 = (__CFString *)v26;
      if (!v11) {
        goto LABEL_40;
      }
      goto LABEL_38;
    }
    id v33 = v10;
LABEL_35:
    _DMLogFunc();
    BOOL v27 = 0;
    goto LABEL_36;
  }
  if (!v11)
  {
    _DMLogFunc();
    BOOL v27 = 1;
    goto LABEL_40;
  }
  BOOL v27 = [(MISystemAppMigrator *)self installOrUpdateAppWithBundleID:v10 appURL:v11 isInstalled:v6];
LABEL_38:
  id v29 = v17;
  id v30 = +[MIFileManager defaultManager];
  long long v37 = v17;
  unsigned __int8 v31 = [v30 removeItemAtURL:v11 error:&v37];
  id v17 = v37;

  if ((v31 & 1) == 0)
  {
    id v36 = [v11 path];
    _DMLogFunc();
  }
LABEL_40:

  return v27;
}

- (id)currentlyInstalledSystemAppBundleIdentifiers
{
  uint64_t v15 = objc_opt_new();
  dispatch_semaphore_t v2 = +[LSApplicationRecord enumeratorWithOptions:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    uint64_t v6 = LSSystemApplicationType;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = [v8 typeForInstallMachinery];
        if ([v9 isEqualToString:v6])
        {
          id v10 = [v8 URL];
          id v11 = [v10 path];
          unsigned __int8 v12 = [v11 containsString:@"/Applications"];

          if (v12) {
            continue;
          }
          id v9 = [v8 bundleIdentifier];
          [v15 addObject:v9];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
  id v13 = [v15 copy];

  return v13;
}

- (BOOL)performMigration
{
  if (qword_19828 != -1) {
    dispatch_once(&qword_19828, &stru_14938);
  }
  id v3 = qword_19820;
  if (os_signpost_enabled((os_log_t)qword_19820))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SystemAppMigration", "Start system app migration", buf, 2u);
  }
  uint64_t v126 = 0;
  v127 = &v126;
  uint64_t v128 = 0x2020000000;
  char v129 = 1;
  __uint64_t v4 = clock_gettime_nsec_np(_CLOCK_REALTIME);
  uint64_t v5 = [(MISystemAppMigrator *)self itemsToInstall];
  v81 = self;

  if (v5)
  {
    *(void *)buf = 0;
    v121 = buf;
    uint64_t v122 = 0x3032000000;
    v123 = sub_A4B8;
    v124 = sub_A4C8;
    id v125 = 0;
    uint64_t v6 = self;
    if ([(MISystemAppMigrator *)self didUpgrade]) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    if ([(MISystemAppMigrator *)v81 didRestoreFromBackup]) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    unsigned int v9 = [(MISystemAppMigrator *)v81 didRestoreFromCloudBackup];
    unsigned int v10 = [(MISystemAppMigrator *)v81 didMigrateBackupFromDifferentDevice];
    if (v9) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    if (v10) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    CFStringRef v75 = v11;
    CFStringRef v76 = v12;
    _DMLogFunc();
    if ([(MISystemAppMigrator *)v81 shouldIgnoreAppsNotInTrustCache])
    {
      id v13 = [(MISystemAppMigrator *)v81 ignoreAppsNotInTrustCacheSentinelFileURL];
      long long v68 = [v13 path];
      _DMLogFunc();

      uint64_t v6 = v81;
    }
    if ([(MISystemAppMigrator *)v6 didRestoreFromBackup])
    {
      _DMLogFunc();
      CFStringRef v134 = @"RestoreBackupAppState";
      v135 = &__kCFBooleanTrue;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
    }
    else
    {
      uint64_t v14 = 0;
    }
    v80 = (void *)v14;
    uint64_t v16 = -[MISystemAppMigrator lookupSystemAppStateWithOptions:](v6, "lookupSystemAppStateWithOptions:");
    long long v17 = [(MISystemAppMigrator *)v6 _removeNotAllowedAppsFromSystemAppState:v16];
    [(MISystemAppMigrator *)v6 setStartingSystemAppState:v17];
    v79 = (void *)v16;

    v78 = +[MCProfileConnection sharedConnection];
    [v78 removedSystemAppBundleIDs];
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v18 = [obj countByEnumeratingWithState:&v116 objects:v133 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v117;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v117 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v116 + 1) + 8 * i);
          if ([(MISystemAppMigrator *)v81 firstTimeEncounteringDeletableSystemAppWithBundleId:v21])
          {
            [(MISystemAppMigrator *)v81 markAppAsUninstalled:v21];
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v116 objects:v133 count:16];
      }
      while (v18);
    }

    [(MISystemAppMigrator *)v81 capturePreferencesToMigrate];
    [(MISystemAppMigrator *)v81 handleSupersededSystemApps];
    [(MISystemAppMigrator *)v81 handleSpecialAppActivity];
    [(MISystemAppMigrator *)v81 handleSpecialAppNews];
    [(MISystemAppMigrator *)v81 handleAppsMissingRequiredCapabilities];
    [(MISystemAppMigrator *)v81 handleAppsNotCompatibleWithDeviceFamily];
    [(MISystemAppMigrator *)v81 handleDefaultInstall];
    [(MISystemAppMigrator *)v81 handleAppFeatureFlagRequirements];
    [(MISystemAppMigrator *)v81 handleAppEligibilityRequirements];
    [(MISystemAppMigrator *)v81 handleForceInstalledApps];
    [(MISystemAppMigrator *)v81 synchronouslyCancelAllAppStoreRequests];
    uint64_t v22 = [(MISystemAppMigrator *)v81 currentlyInstalledSystemAppBundleIdentifiers];
    id v23 = (void *)*((void *)v121 + 5);
    *((void *)v121 + 5) = v22;

    id v24 = [(MISystemAppMigrator *)v81 lookupSystemAppStateWithOptions:0];
    if (qword_19828 != -1) {
      dispatch_once(&qword_19828, &stru_14938);
    }
    unsigned __int8 v25 = qword_19820;
    if (os_signpost_enabled((os_log_t)qword_19820))
    {
      *(_WORD *)v107 = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v25, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SystemAppInstall", "Start installation", v107, 2u);
    }
    CFStringRef v26 = [(MISystemAppMigrator *)v81 itemsToInstall];
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472;
    v111[2] = sub_A4D0;
    v111[3] = &unk_148D0;
    id v27 = v24;
    id v112 = v27;
    v113 = v81;
    v114 = buf;
    v115 = &v126;
    [v26 enumerateKeysAndObjectsUsingBlock:v111];

    if ([(MISystemAppMigrator *)v81 waitForSystemAppInstallDispatchGroup])
    {
      __uint64_t v69 = (clock_gettime_nsec_np(_CLOCK_REALTIME) - v4) / 0x3B9ACA00;
      _DMLogFunc();
    }
    else
    {
      _DMLogFunc();
      *((unsigned char *)v127 + 24) = 0;
    }
    if (qword_19828 != -1) {
      dispatch_once(&qword_19828, &stru_14938);
    }
    unsigned int v28 = qword_19820;
    if (os_signpost_enabled((os_log_t)qword_19820))
    {
      *(_WORD *)v107 = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SystemAppInstall", "End installation", v107, 2u);
    }
    id v29 = [(MISystemAppMigrator *)v81 currentlyInstallingCoordinators];
    [v29 removeAllObjects];

    uint64_t v30 = [(MISystemAppMigrator *)v81 currentlyInstalledSystemAppBundleIdentifiers];
    unsigned __int8 v31 = (void *)*((void *)v121 + 5);
    *((void *)v121 + 5) = v30;

    _DMLogFunc();
    if (qword_19828 != -1) {
      dispatch_once(&qword_19828, &stru_14938);
    }
    unsigned __int8 v32 = qword_19820;
    if (os_signpost_enabled((os_log_t)qword_19820))
    {
      *(_WORD *)v107 = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v32, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SystemAppValidation", "Start validation", v107, 2u);
    }
    *(void *)v107 = 0;
    v108 = v107;
    uint64_t v109 = 0x2020000000;
    uint64_t v110 = 0;
    id v33 = [(MISystemAppMigrator *)v81 itemsToInstall];
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_A59C;
    v101[3] = &unk_148F8;
    v104 = buf;
    v105 = &v126;
    v106 = v107;
    id v77 = v27;
    id v102 = v77;
    v103 = v81;
    [v33 enumerateKeysAndObjectsUsingBlock:v101];

    if (*((void *)v108 + 3))
    {
      uint64_t v70 = *((void *)v108 + 3);
      _DMLogFunc();
      if ([(MISystemAppMigrator *)v81 waitForSystemAppInstallDispatchGroup])
      {
        _DMLogFunc();
      }
      else
      {
        _DMLogFunc();
        *((unsigned char *)v127 + 24) = 0;
      }
    }
    if (qword_19828 != -1) {
      dispatch_once(&qword_19828, &stru_14938);
    }
    id v34 = qword_19820;
    if (os_signpost_enabled((os_log_t)qword_19820))
    {
      *(_WORD *)v96 = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SystemAppValidation", "End validation", v96, 2u);
    }
    CFStringRef v35 = [(MISystemAppMigrator *)v81 currentlyInstallingCoordinators];
    [v35 removeAllObjects];

    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v36 = [(MISystemAppMigrator *)v81 appBundleIDsToUninstall];
    id v15 = 0;
    id v37 = [v36 countByEnumeratingWithState:&v97 objects:v132 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v98;
      do
      {
        uint64_t v39 = 0;
        id v40 = v15;
        do
        {
          if (*(void *)v98 != v38) {
            objc_enumerationMutation(v36);
          }
          id v41 = [objc_alloc((Class)IXApplicationIdentity) initWithBundleIdentifier:*(void *)(*((void *)&v97 + 1) + 8 * (void)v39)];
          _DMLogFunc();
          id v42 = objc_opt_new();
          objc_msgSend(v42, "setIgnoreRemovability:", 1, v41);
          [v42 setIgnoreRestrictions:1];
          [v42 setIgnoreAppProtection:1];
          id v95 = v40;
          *(void *)v96 = 0;
          unsigned __int8 v43 = +[IXAppInstallCoordinator uninstallAppWithIdentity:v41 options:v42 disposition:v96 error:&v95];
          id v15 = v95;

          if (v43)
          {
            if (*(void *)v96 == 3) {
              goto LABEL_66;
            }
            id v67 = IXStringForUninstallDisposition();
            id v74 = v41;
            _DMLogFunc();
          }
          else
          {
            id v67 = v41;
            id v74 = v15;
            _DMLogFunc();
          }
          *((unsigned char *)v127 + 24) = 0;
LABEL_66:

          uint64_t v39 = (char *)v39 + 1;
          id v40 = v15;
        }
        while (v37 != v39);
        id v37 = [v36 countByEnumeratingWithState:&v97 objects:v132 count:16];
      }
      while (v37);
    }

    [(MISystemAppMigrator *)v81 finalizePreferencesToMigrate];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v44 = [(MISystemAppMigrator *)v81 appBundleIDsRequestingStoreDownload];
    id v45 = [v44 countByEnumeratingWithState:&v91 objects:v131 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v92;
      do
      {
        for (j = 0; j != v45; j = (char *)j + 1)
        {
          if (*(void *)v92 != v46) {
            objc_enumerationMutation(v44);
          }
          -[MISystemAppMigrator usingAppStoreInstallSystemAppAppWithBundleID:](v81, "usingAppStoreInstallSystemAppAppWithBundleID:", *(void *)(*((void *)&v91 + 1) + 8 * (void)j), v67, v74);
        }
        id v45 = [v44 countByEnumeratingWithState:&v91 objects:v131 count:16];
      }
      while (v45);
    }

    _Block_object_dispose(v107, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v48 = +[MIFileManager defaultManager];
  uint64_t v49 = +[MIDaemonConfiguration sharedInstance];
  v50 = [v49 stagedSystemAppsDirectory];
  id v90 = v15;
  id obja = [v48 urlsForItemsInDirectoryAtURL:v50 ignoringSymlinks:1 error:&v90];
  id v51 = v90;

  if (obja)
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v84 = obja;
    id v52 = [v84 countByEnumeratingWithState:&v86 objects:v130 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v87;
      do
      {
        for (k = 0; k != v52; k = (char *)k + 1)
        {
          if (*(void *)v87 != v53) {
            objc_enumerationMutation(v84);
          }
          id v55 = *(void **)(*((void *)&v86 + 1) + 8 * (void)k);
          objc_super v72 = objc_msgSend(v55, "path", v71, v74);
          _DMLogFunc();

          v56 = +[MIFileManager defaultManager];
          id v85 = v51;
          unsigned __int8 v57 = [v56 removeItemAtURL:v55 error:&v85];
          id v58 = v85;

          id v51 = v58;
          if ((v57 & 1) == 0)
          {
            long long v71 = [v55 path];
            id v74 = v58;
            _DMLogFunc();
          }
        }
        id v52 = [v84 countByEnumeratingWithState:&v86 objects:v130 count:16];
      }
      while (v52);
    }
    goto LABEL_92;
  }
  v59 = [v51 domain];
  if (![v59 isEqualToString:NSPOSIXErrorDomain])
  {

    goto LABEL_91;
  }
  BOOL v60 = [v51 code] == (char *)&dword_0 + 2;

  if (!v60)
  {
LABEL_91:
    id v84 = +[MIDaemonConfiguration sharedInstance];
    v61 = [v84 stagedSystemAppsDirectory];
    v73 = [v61 path];
    _DMLogFunc();

LABEL_92:
  }
  if (!*((unsigned char *)v127 + 24)) {
    _DMLogFunc();
  }
  char v62 = MobileInstallationSetSystemAppMigrationComplete();
  id v63 = v51;

  if ((v62 & 1) == 0)
  {
    _DMLogFunc();
    if (*((unsigned char *)v127 + 24))
    {
      _DMLogFunc();
      *((unsigned char *)v127 + 24) = 0;
    }
  }
  if (qword_19828 != -1) {
    dispatch_once(&qword_19828, &stru_14938);
  }
  v64 = qword_19820;
  if (os_signpost_enabled((os_log_t)qword_19820))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v64, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SystemAppMigration", "End system app migration", buf, 2u);
  }
  BOOL v65 = *((unsigned char *)v127 + 24) != 0;

  _Block_object_dispose(&v126, 8);
  return v65;
}

- (NSDictionary)itemsToInstall
{
  return self->_itemsToInstall;
}

- (void)setItemsToInstall:(id)a3
{
}

- (NSDictionary)startingSystemAppState
{
  return self->_startingSystemAppState;
}

- (void)setStartingSystemAppState:(id)a3
{
}

- (NSArray)preferencesToMigrate
{
  return self->_preferencesToMigrate;
}

- (void)setPreferencesToMigrate:(id)a3
{
}

- (NSMutableSet)appBundleIDsToUninstall
{
  return self->_appBundleIDsToUninstall;
}

- (void)setAppBundleIDsToUninstall:(id)a3
{
}

- (NSMutableSet)appBundleIDsRequestingStoreDownload
{
  return self->_appBundleIDsRequestingStoreDownload;
}

- (void)setAppBundleIDsRequestingStoreDownload:(id)a3
{
}

- (NSMutableSet)appBundleIDsInstalledSuccessfully
{
  return self->_appBundleIDsInstalledSuccessfully;
}

- (void)setAppBundleIDsInstalledSuccessfully:(id)a3
{
}

- (NSMutableSet)currentlyInstallingCoordinators
{
  return self->_currentlyInstallingCoordinators;
}

- (void)setCurrentlyInstallingCoordinators:(id)a3
{
}

- (OS_dispatch_group)systemAppInstallGroup
{
  return self->_systemAppInstallGroup;
}

- (void)setSystemAppInstallGroup:(id)a3
{
}

- (OS_dispatch_queue)pendingAppInstallListQueue
{
  return self->_pendingAppInstallListQueue;
}

- (void)setPendingAppInstallListQueue:(id)a3
{
}

- (NSMutableSet)pendingAppInstalls
{
  return self->_pendingAppInstalls;
}

- (void)setPendingAppInstalls:(id)a3
{
}

- (OS_dispatch_queue)installedAppListQueue
{
  return self->_installedAppListQueue;
}

- (NSSet)forceInstallBundleIDs
{
  return self->_forceInstallBundleIDs;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_forceInstallBundleIDs, 0);
  objc_storeStrong((id *)&self->_installedAppListQueue, 0);
  objc_storeStrong((id *)&self->_pendingAppInstalls, 0);
  objc_storeStrong((id *)&self->_pendingAppInstallListQueue, 0);
  objc_storeStrong((id *)&self->_systemAppInstallGroup, 0);
  objc_storeStrong((id *)&self->_currentlyInstallingCoordinators, 0);
  objc_storeStrong((id *)&self->_appBundleIDsInstalledSuccessfully, 0);
  objc_storeStrong((id *)&self->_appBundleIDsRequestingStoreDownload, 0);
  objc_storeStrong((id *)&self->_appBundleIDsToUninstall, 0);
  objc_storeStrong((id *)&self->_preferencesToMigrate, 0);
  objc_storeStrong((id *)&self->_startingSystemAppState, 0);
  objc_storeStrong((id *)&self->_itemsToInstall, 0);

  objc_storeStrong((id *)&self->_previousBuildVersion, 0);
}

@end