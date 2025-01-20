@interface SPApplicationManager
+ (id)sharedInstance;
- (BOOL)applicationContainsWK1Application:(id)a3;
- (BOOL)applicationContainsWK2Application:(id)a3;
- (BOOL)domainVerified;
- (BOOL)pluginHasFinishedBeginUsing:(id)a3;
- (BOOL)wasExtensionKilledDueToAppDeath:(id)a3;
- (BOOL)willXcodeInstallSockPuppetAppWithCompanionAppID:(id)a3;
- (NPSDomainAccessor)watchKitAppsDomain;
- (NSMutableDictionary)continuouslyDiscoveredPlugins;
- (NSMutableDictionary)pkPluginBeginUsingTimers;
- (NSMutableSet)companionAppIDsInstalledViaXcode;
- (NSMutableSet)extensionsKilledDueToAppDeath;
- (NSString)currentXcodeControlledPlugin;
- (OS_dispatch_queue)extensionsKilledDueToAppDeathAccessQueue;
- (OS_dispatch_queue)pkPluginBeginUsingTimerQueue;
- (OS_dispatch_queue)pkPluginCompletionQueue;
- (OS_dispatch_queue)pkPluginManagementQueue;
- (SPApplicationManager)init;
- (id)companionAppIDsInstalledViaXcodeLock;
- (id)domainUpdateLock;
- (id)gizmoApplicationInfoWithIdentifier:(id)a3;
- (id)gizmoPersistentDomain;
- (id)identifierForPluginProxy:(id)a3;
- (id)pluginIdentifierForProtocolIdentifier:(id)a3;
- (id)pluginsFoundBlock;
- (id)savedGizmoBuildVersion;
- (id)wkContinuousDiscoveryToken;
- (int64_t)installationMode;
- (void)beginUsingPlugin:(id)a3 withCompletion:(id)a4;
- (void)callEndUsingCompletionsForPluginWithIdentifier:(id)a3;
- (void)clearXcodeWillInstallSockPuppetAppWithCompanionAppIDState:(id)a3;
- (void)discoverAllPlugIns:(id)a3;
- (void)discoverPlugInForIdentifier:(id)a3 found:(id)a4;
- (void)fetchInstalledApplicationsWithCompletion:(id)a3;
- (void)getOrBeginActivePlugInForApplication:(id)a3 setupBlock:(id)a4 completion:(id)a5;
- (void)handleInstallationsReportedByLaunchServices:(id)a3;
- (void)markPluginWithIdentifierNeedsBeginUsing:(id)a3;
- (void)notifyActiveForPluginWithIdentifier:(id)a3;
- (void)notifyInactiveForPluginWithIdentifier:(id)a3 completion:(id)a4;
- (void)registerForContinuousPluginDiscovery;
- (void)saveGizmoBuildVersion:(id)a3;
- (void)setCompanionAppIDsInstalledViaXcode:(id)a3;
- (void)setCompanionAppIDsInstalledViaXcodeLock:(id)a3;
- (void)setContinuouslyDiscoveredPlugins:(id)a3;
- (void)setCurrentXcodeControlledPlugin:(id)a3;
- (void)setDomainUpdateLock:(id)a3;
- (void)setDomainVerified:(BOOL)a3;
- (void)setExtension:(id)a3 wasKilledDueToAppDeath:(BOOL)a4;
- (void)setExtensionsKilledDueToAppDeath:(id)a3;
- (void)setExtensionsKilledDueToAppDeathAccessQueue:(id)a3;
- (void)setInstallationMode:(int64_t)a3;
- (void)setPkPluginBeginUsingTimerQueue:(id)a3;
- (void)setPkPluginBeginUsingTimers:(id)a3;
- (void)setPkPluginCompletionQueue:(id)a3;
- (void)setPkPluginManagementQueue:(id)a3;
- (void)setPluginsFoundBlock:(id)a3;
- (void)setWatchKitAppsDomain:(id)a3;
- (void)setWkContinuousDiscoveryToken:(id)a3;
- (void)stopUsingPluginIfNecessary:(id)a3;
- (void)updateCoreDuetSession:(id)a3;
- (void)waitForPreviousPluginToFinishEnding:(id)a3 toComplete:(id)a4;
- (void)xcodeWillInstallSockPuppetAppWithCompanionAppID:(id)a3;
@end

@implementation SPApplicationManager

+ (id)sharedInstance
{
  if (qword_100052548 != -1) {
    dispatch_once(&qword_100052548, &stru_100045CD8);
  }
  v2 = (void *)qword_100052550;

  return v2;
}

- (SPApplicationManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)SPApplicationManager;
  v2 = [(SPApplicationManager *)&v22 init];
  v2->_installationMode = 0;
  v2->_domainVerified = 0;
  v3 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.companionappd"];
  watchKitAppsDomain = v2->_watchKitAppsDomain;
  v2->_watchKitAppsDomain = v3;

  uint64_t v5 = +[NSMutableSet set];
  companionAppIDsInstalledViaXcode = v2->_companionAppIDsInstalledViaXcode;
  v2->_companionAppIDsInstalledViaXcode = (NSMutableSet *)v5;

  id v7 = objc_alloc_init((Class)NSObject);
  id companionAppIDsInstalledViaXcodeLock = v2->_companionAppIDsInstalledViaXcodeLock;
  v2->_id companionAppIDsInstalledViaXcodeLock = v7;

  dispatch_queue_t v9 = dispatch_queue_create("com.apple.watchkit.pkpluginmanagement", 0);
  pkPluginManagementQueue = v2->_pkPluginManagementQueue;
  v2->_pkPluginManagementQueue = (OS_dispatch_queue *)v9;

  dispatch_queue_t v11 = dispatch_queue_create("com.apple.watchkit.pkplugincompletion", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  pkPluginCompletionQueue = v2->_pkPluginCompletionQueue;
  v2->_pkPluginCompletionQueue = (OS_dispatch_queue *)v11;

  dispatch_queue_t v13 = dispatch_queue_create("com.apple.watchkit.pkpluginbeginusingcheck", 0);
  pkPluginBeginUsingTimerQueue = v2->_pkPluginBeginUsingTimerQueue;
  v2->_pkPluginBeginUsingTimerQueue = (OS_dispatch_queue *)v13;

  uint64_t v15 = +[NSMutableDictionary dictionary];
  pkPluginBeginUsingTimers = v2->_pkPluginBeginUsingTimers;
  v2->_pkPluginBeginUsingTimers = (NSMutableDictionary *)v15;

  dispatch_queue_t v17 = dispatch_queue_create("com.apple.companionappd.extensionsKilledDueToAppDeathAccessQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  extensionsKilledDueToAppDeathAccessQueue = v2->_extensionsKilledDueToAppDeathAccessQueue;
  v2->_extensionsKilledDueToAppDeathAccessQueue = (OS_dispatch_queue *)v17;

  id v19 = objc_alloc_init((Class)NSObject);
  id domainUpdateLock = v2->_domainUpdateLock;
  v2->_id domainUpdateLock = v19;

  [(SPApplicationManager *)v2 registerForContinuousPluginDiscovery];
  return v2;
}

- (void)registerForContinuousPluginDiscovery
{
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [v3 persistentDomainForName:@"com.apple.companionappd"];
  uint64_t v5 = [v4 objectForKey:@"SPEnableExcessivePluginLoadingLogging"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[SPApplicationManager registerForContinuousPluginDiscovery]";
      __int16 v19 = 1024;
      int v20 = 239;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: PLUGIN_LOADING: \"SPEnableExcessivePluginLoadingLogging\" default is set, so logging is on", buf, 0x12u);
    }
  }
  v8 = +[NSMutableDictionary dictionary];
  [(SPApplicationManager *)self setContinuouslyDiscoveredPlugins:v8];

  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000186F0;
  v13[3] = &unk_100045D50;
  objc_copyWeak(&v14, (id *)buf);
  [(SPApplicationManager *)self setPluginsFoundBlock:v13];
  dispatch_queue_t v9 = +[PKHost defaultHost];
  CFStringRef v15 = @"WKAppBundleIdentifier";
  CFStringRef v16 = @"<>";
  v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  dispatch_queue_t v11 = [(SPApplicationManager *)self pluginsFoundBlock];
  v12 = [v9 continuouslyDiscoverPlugInsForAttributes:v10 flags:0 found:v11];
  [(SPApplicationManager *)self setWkContinuousDiscoveryToken:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)callEndUsingCompletionsForPluginWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SPApplicationManager *)self continuouslyDiscoveredPlugins];
  unsigned int v6 = v4;
  id v7 = [v5 objectForKeyedSubscript:v4];

  [v7 removeObjectForKey:@"previousPlugin"];
  v8 = [v7 objectForKeyedSubscript:@"didEndCompletions"];
  if (v8)
  {
    [v7 removeObjectForKey:@"didEndCompletions"];
    dispatch_queue_t v9 = [v7 objectForKeyedSubscript:@"plugin"];
    if (!v9)
    {
      v10 = wk_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002AF90();
      }
    }
    dispatch_queue_t v17 = v8;
    v18 = v7;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v8;
    id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          CFStringRef v16 = [(SPApplicationManager *)self pkPluginCompletionQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000190D8;
          block[3] = &unk_100045D78;
          id v21 = v6;
          uint64_t v23 = v15;
          id v22 = v9;
          dispatch_async(v16, block);
        }
        id v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    v8 = v17;
    id v7 = v18;
  }
}

- (void)waitForPreviousPluginToFinishEnding:(id)a3 toComplete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(SPApplicationManager *)self pkPluginManagementQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100019478;
  v11[3] = &unk_100045DC0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  objc_copyWeak(&v14, &location);
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)beginUsingPlugin:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(SPApplicationManager *)self pkPluginManagementQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019CF4;
  block[3] = &unk_100045E60;
  id v12 = v6;
  id v9 = v6;
  objc_copyWeak(&v15, &location);
  id v13 = self;
  id v14 = v7;
  id v10 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)getOrBeginActivePlugInForApplication:(id)a3 setupBlock:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[SPApplicationManager sharedInstance];
  id v12 = [v11 pluginIdentifierForProtocolIdentifier:v8];

  if (v12)
  {
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001AE38;
    v14[3] = &unk_100045F00;
    id v15 = v12;
    objc_copyWeak(&v20, &location);
    id v18 = v10;
    CFStringRef v16 = self;
    id v17 = v8;
    id v19 = v9;
    [(SPApplicationManager *)self waitForPreviousPluginToFinishEnding:v15 toComplete:v14];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    id v13 = wk_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002B0B4();
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)setExtension:(id)a3 wasKilledDueToAppDeath:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = wk_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v14 = "-[SPApplicationManager setExtension:wasKilledDueToAppDeath:]";
    __int16 v15 = 1024;
    int v16 = 506;
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 1024;
    BOOL v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: app %{public}@ wasKilledDueToAppDeath=%d", buf, 0x22u);
  }

  extensionsKilledDueToAppDeathAccessQueue = self->_extensionsKilledDueToAppDeathAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B56C;
  block[3] = &unk_100045AB0;
  BOOL v12 = v4;
  void block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_barrier_sync((dispatch_queue_t)extensionsKilledDueToAppDeathAccessQueue, block);
}

- (BOOL)wasExtensionKilledDueToAppDeath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  extensionsKilledDueToAppDeathAccessQueue = self->_extensionsKilledDueToAppDeathAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B6C8;
  block[3] = &unk_100045A68;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)extensionsKilledDueToAppDeathAccessQueue, block);
  LOBYTE(extensionsKilledDueToAppDeathAccessQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)extensionsKilledDueToAppDeathAccessQueue;
}

- (void)handleInstallationsReportedByLaunchServices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"isPlaceholder"];
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    id v25 = v4;
    [v4 objectForKeyedSubscript:@"bundleIDs"];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v36;
      uint64_t v11 = &CFBundleCopyLocalizationsForPreferences_ptr;
      uint64_t v26 = *(void *)v36;
      id v27 = v7;
      do
      {
        BOOL v12 = 0;
        id v28 = v9;
        do
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v12);
          __int16 v15 = [v11[176] applicationProxyForIdentifier:v13];
          if (![(SPApplicationManager *)self applicationContainsWK2Application:v15]&& [(SPApplicationManager *)self applicationContainsWK1Application:v15])
          {
            v29 = v15;
            v30 = v14;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            int v16 = [v15 plugInKitPlugins];
            id v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v32;
              do
              {
                for (i = 0; i != v18; i = (char *)i + 1)
                {
                  if (*(void *)v32 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  id v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                  id v22 = [v21 protocol];
                  unsigned int v23 = [v22 isEqualToString:@"com.apple.watchkit"];

                  if (v23)
                  {
                    long long v24 = [(SPApplicationManager *)self identifierForPluginProxy:v21];
                    if (v24) {
                      [(SPApplicationManager *)self stopUsingPluginIfNecessary:v24];
                    }
                  }
                }
                id v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }
              while (v18);
            }

            uint64_t v10 = v26;
            id v7 = v27;
            id v9 = v28;
            __int16 v15 = v29;
            uint64_t v11 = &CFBundleCopyLocalizationsForPreferences_ptr;
            char v14 = v30;
          }

          BOOL v12 = (char *)v12 + 1;
        }
        while (v12 != v9);
        id v9 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v9);
    }

    id v4 = v25;
  }
}

- (id)gizmoPersistentDomain
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_1000180BC;
  char v14 = sub_1000180CC;
  id v15 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = +[ACXDeviceConnection sharedDeviceConnection];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001BAEC;
  v7[3] = &unk_100045F28;
  id v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 fetchInstalledApplicationsForPairedDevice:0 completion:v7];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (id)gizmoApplicationInfoWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v6 = [(SPApplicationManager *)self gizmoPersistentDomain];
  DeepCopy = [v6 objectForKeyedSubscript:v4];

  if (DeepCopy)
  {
    id v8 = [v6 objectForKeyedSubscript:v4];
    DeepCopy = (void *)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, v8, 0);
  }

  return DeepCopy;
}

- (id)pluginIdentifierForProtocolIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SPApplicationManager *)self gizmoPersistentDomain];
  unsigned __int8 v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"SPPluginBundleIdKey"];
    id v9 = [v7 objectForKeyedSubscript:@"s"];
    unsigned int v10 = [v9 intValue];

    if (v10 - 4 > 0xFFFFFFFD)
    {
      id v12 = [v8 copy];
    }
    else
    {
      uint64_t v11 = wk_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136446978;
        id v15 = "-[SPApplicationManager pluginIdentifierForProtocolIdentifier:]";
        __int16 v16 = 1024;
        int v17 = 588;
        __int16 v18 = 2114;
        id v19 = v4;
        __int16 v20 = 2114;
        id v21 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Asked for plugin for %{public}@. Answer is %{public}@, but status is not installed, so returning nil.", (uint8_t *)&v14, 0x26u);
      }

      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)identifierForPluginProxy:(id)a3
{
  v3 = [a3 pluginKitDictionary];
  id v4 = [v3 objectForKeyedSubscript:@"NSExtensionAttributes"];
  id v5 = [v4 objectForKeyedSubscript:@"WKAppBundleIdentifier"];

  return v5;
}

- (void)stopUsingPluginIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [(SPApplicationManager *)self gizmoApplicationInfoWithIdentifier:v4];
  unsigned __int8 v6 = [v5 objectForKeyedSubscript:@"SPPluginBundleIdKey"];
  if (v6)
  {
    objc_initWeak(&location, self);
    id v7 = [(SPApplicationManager *)self pkPluginManagementQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BF48;
    block[3] = &unk_100045D28;
    id v9 = v6;
    objc_copyWeak(&v10, &location);
    dispatch_async(v7, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (BOOL)applicationContainsWK2Application:(id)a3
{
  char v10 = 0;
  v3 = [a3 bundleURL];
  id v4 = [v3 path];
  id v5 = [v4 stringByAppendingPathComponent:@"Watch"];

  unsigned __int8 v6 = +[NSFileManager defaultManager];
  unsigned __int8 v7 = [v6 fileExistsAtPath:v5 isDirectory:&v10];
  if (v10) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)applicationContainsWK1Application:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a3, "plugInKitPlugins", 0);
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) protocol];
        unsigned __int8 v9 = [v8 isEqualToString:@"com.apple.watchkit"];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)fetchInstalledApplicationsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[ACXDeviceConnection sharedDeviceConnection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001C54C;
  v6[3] = &unk_100045F78;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchInstalledApplicationsForPairedDevice:0 completion:v6];
}

- (void)xcodeWillInstallSockPuppetAppWithCompanionAppID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = [(SPApplicationManager *)self companionAppIDsInstalledViaXcodeLock];
    objc_sync_enter(v5);
    uint64_t v6 = [(SPApplicationManager *)self companionAppIDsInstalledViaXcode];
    [v6 addObject:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (BOOL)willXcodeInstallSockPuppetAppWithCompanionAppID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SPApplicationManager *)self companionAppIDsInstalledViaXcodeLock];
    objc_sync_enter(v5);
    uint64_t v6 = [(SPApplicationManager *)self companionAppIDsInstalledViaXcode];
    unsigned __int8 v7 = [v6 containsObject:v4];

    objc_sync_exit(v5);
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)clearXcodeWillInstallSockPuppetAppWithCompanionAppIDState:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = [(SPApplicationManager *)self companionAppIDsInstalledViaXcodeLock];
    objc_sync_enter(v5);
    uint64_t v6 = [(SPApplicationManager *)self companionAppIDsInstalledViaXcode];
    [v6 removeObject:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (void)updateCoreDuetSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"i"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"cda"];

  id v7 = [(SPApplicationManager *)self gizmoPersistentDomain];
  BOOL v8 = [v7 objectForKeyedSubscript:v5];

  if (v8)
  {
    unsigned __int8 v9 = [v8 objectForKeyedSubscript:@"SPContainerAppBundleId"];
    BOOL v10 = [v8 objectForKeyedSubscript:@"SPPluginBundleIdKey"];
    uint64_t v11 = +[NSMutableArray arrayWithCapacity:3];
    [v11 addObject:v5];
    if (v9) {
      [v11 addObject:v9];
    }
    if (v10) {
      [v11 addObject:v10];
    }
    if ([v6 isEqualToString:@"a"])
    {
      long long v12 = wk_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136446722;
        __int16 v18 = "-[SPApplicationManager updateCoreDuetSession:]";
        __int16 v19 = 1024;
        int v20 = 719;
        __int16 v21 = 2114;
        id v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: calling -[_CDClientContext addObjects: toArrayAtKeyPath:[_CDContextQueries keyPathForServicesAppearingForeground]] with %{public}@", (uint8_t *)&v17, 0x1Cu);
      }

      long long v13 = [sub_10001CAD4() userContext];
      long long v14 = [sub_10001CBB8() keyPathForServicesAppearingForeground];
      [v13 addObjects:v11 toArrayAtKeyPath:v14];
    }
    else
    {
      unsigned int v15 = [v6 isEqualToString:@"d"];
      __int16 v16 = wk_default_log();
      long long v13 = v16;
      if (!v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10002B3B0();
        }
        goto LABEL_19;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136446722;
        __int16 v18 = "-[SPApplicationManager updateCoreDuetSession:]";
        __int16 v19 = 1024;
        int v20 = 723;
        __int16 v21 = 2114;
        id v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: calling -[_CDClientContext removeObjects: fromArrayAtKeyPath:[_CDContextQueries keyPathForServicesAppearingForeground]] with %{public}@", (uint8_t *)&v17, 0x1Cu);
      }

      long long v13 = [sub_10001CAD4() userContext];
      long long v14 = [sub_10001CBB8() keyPathForServicesAppearingForeground];
      [v13 removeObjects:v11 fromArrayAtKeyPath:v14];
    }

LABEL_19:
    goto LABEL_20;
  }
  unsigned __int8 v9 = wk_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10002B324();
  }
LABEL_20:
}

- (void)discoverAllPlugIns:(id)a3
{
  id v4 = a3;
  id v5 = +[PKHost defaultHost];
  CFStringRef v10 = @"WKAppBundleIdentifier";
  CFStringRef v11 = @"<>";
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001CDC8;
  v8[3] = &unk_100045FA0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 discoverPlugInsForAttributes:v6 flags:0 found:v8];
}

- (void)discoverPlugInForIdentifier:(id)a3 found:(id)a4
{
  id v6 = a4;
  CFStringRef v13 = @"WKAppBundleIdentifier";
  id v14 = a3;
  id v7 = a3;
  BOOL v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v9 = +[PKHost defaultHost];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001CFA4;
  v11[3] = &unk_100045FA0;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 discoverPlugInsForAttributes:v8 flags:0 found:v11];
}

- (void)markPluginWithIdentifierNeedsBeginUsing:(id)a3
{
  id v4 = a3;
  id v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v12 = "-[SPApplicationManager markPluginWithIdentifierNeedsBeginUsing:]";
    __int16 v13 = 1024;
    int v14 = 768;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: pluginIdentifier is %{public}@", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  id v6 = [(SPApplicationManager *)self pkPluginManagementQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001D300;
  v8[3] = &unk_1000459F0;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (BOOL)pluginHasFinishedBeginUsing:(id)a3
{
  id v4 = a3;
  id v5 = [(SPApplicationManager *)self continuouslyDiscoveredPlugins];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 objectForKeyedSubscript:@"finishedBeginUsing"];
  LOBYTE(v4) = [v7 BOOLValue];

  return (char)v4;
}

- (void)notifyActiveForPluginWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v12 = "-[SPApplicationManager notifyActiveForPluginWithIdentifier:]";
    __int16 v13 = 1024;
    int v14 = 785;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: notifyActiveForPluginWithIdentifier:%{public}@", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  id v6 = [(SPApplicationManager *)self pkPluginManagementQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001D5B8;
  v8[3] = &unk_1000459F0;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)notifyInactiveForPluginWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = wk_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v17 = "-[SPApplicationManager notifyInactiveForPluginWithIdentifier:completion:]";
    __int16 v18 = 1024;
    int v19 = 796;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: notifyInactiveForPluginWithIdentifier:%{public}@", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(SPApplicationManager *)self pkPluginManagementQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D818;
  block[3] = &unk_100045FF0;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (id)savedGizmoBuildVersion
{
  id v3 = [(SPApplicationManager *)self domainUpdateLock];
  objc_sync_enter(v3);
  id v4 = [(NPSDomainAccessor *)self->_watchKitAppsDomain synchronize];
  id v5 = [(NPSDomainAccessor *)self->_watchKitAppsDomain objectForKey:@"SPGizmoBuildVersion"];
  objc_sync_exit(v3);

  return v5;
}

- (void)saveGizmoBuildVersion:(id)a3
{
  id v6 = a3;
  id v4 = [(SPApplicationManager *)self domainUpdateLock];
  objc_sync_enter(v4);
  [(NPSDomainAccessor *)self->_watchKitAppsDomain setObject:v6 forKey:@"SPGizmoBuildVersion"];
  id v5 = [(NPSDomainAccessor *)self->_watchKitAppsDomain synchronize];
  objc_sync_exit(v4);
}

- (int64_t)installationMode
{
  return self->_installationMode;
}

- (void)setInstallationMode:(int64_t)a3
{
  self->_installationMode = a3;
}

- (NSString)currentXcodeControlledPlugin
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentXcodeControlledPlugin:(id)a3
{
}

- (NPSDomainAccessor)watchKitAppsDomain
{
  return self->_watchKitAppsDomain;
}

- (void)setWatchKitAppsDomain:(id)a3
{
}

- (BOOL)domainVerified
{
  return self->_domainVerified;
}

- (void)setDomainVerified:(BOOL)a3
{
  self->_domainVerified = a3;
}

- (NSMutableDictionary)continuouslyDiscoveredPlugins
{
  return self->_continuouslyDiscoveredPlugins;
}

- (void)setContinuouslyDiscoveredPlugins:(id)a3
{
}

- (id)pluginsFoundBlock
{
  return self->_pluginsFoundBlock;
}

- (void)setPluginsFoundBlock:(id)a3
{
}

- (OS_dispatch_queue)pkPluginManagementQueue
{
  return self->_pkPluginManagementQueue;
}

- (void)setPkPluginManagementQueue:(id)a3
{
}

- (OS_dispatch_queue)pkPluginCompletionQueue
{
  return self->_pkPluginCompletionQueue;
}

- (void)setPkPluginCompletionQueue:(id)a3
{
}

- (OS_dispatch_queue)pkPluginBeginUsingTimerQueue
{
  return self->_pkPluginBeginUsingTimerQueue;
}

- (void)setPkPluginBeginUsingTimerQueue:(id)a3
{
}

- (NSMutableDictionary)pkPluginBeginUsingTimers
{
  return self->_pkPluginBeginUsingTimers;
}

- (void)setPkPluginBeginUsingTimers:(id)a3
{
}

- (id)wkContinuousDiscoveryToken
{
  return self->_wkContinuousDiscoveryToken;
}

- (void)setWkContinuousDiscoveryToken:(id)a3
{
}

- (id)domainUpdateLock
{
  return self->_domainUpdateLock;
}

- (void)setDomainUpdateLock:(id)a3
{
}

- (NSMutableSet)companionAppIDsInstalledViaXcode
{
  return self->_companionAppIDsInstalledViaXcode;
}

- (void)setCompanionAppIDsInstalledViaXcode:(id)a3
{
}

- (id)companionAppIDsInstalledViaXcodeLock
{
  return self->_companionAppIDsInstalledViaXcodeLock;
}

- (void)setCompanionAppIDsInstalledViaXcodeLock:(id)a3
{
}

- (NSMutableSet)extensionsKilledDueToAppDeath
{
  return self->_extensionsKilledDueToAppDeath;
}

- (void)setExtensionsKilledDueToAppDeath:(id)a3
{
}

- (OS_dispatch_queue)extensionsKilledDueToAppDeathAccessQueue
{
  return self->_extensionsKilledDueToAppDeathAccessQueue;
}

- (void)setExtensionsKilledDueToAppDeathAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionsKilledDueToAppDeathAccessQueue, 0);
  objc_storeStrong((id *)&self->_extensionsKilledDueToAppDeath, 0);
  objc_storeStrong(&self->_companionAppIDsInstalledViaXcodeLock, 0);
  objc_storeStrong((id *)&self->_companionAppIDsInstalledViaXcode, 0);
  objc_storeStrong(&self->_domainUpdateLock, 0);
  objc_storeStrong(&self->_wkContinuousDiscoveryToken, 0);
  objc_storeStrong((id *)&self->_pkPluginBeginUsingTimers, 0);
  objc_storeStrong((id *)&self->_pkPluginBeginUsingTimerQueue, 0);
  objc_storeStrong((id *)&self->_pkPluginCompletionQueue, 0);
  objc_storeStrong((id *)&self->_pkPluginManagementQueue, 0);
  objc_storeStrong(&self->_pluginsFoundBlock, 0);
  objc_storeStrong((id *)&self->_continuouslyDiscoveredPlugins, 0);
  objc_storeStrong((id *)&self->_watchKitAppsDomain, 0);

  objc_storeStrong((id *)&self->_currentXcodeControlledPlugin, 0);
}

@end