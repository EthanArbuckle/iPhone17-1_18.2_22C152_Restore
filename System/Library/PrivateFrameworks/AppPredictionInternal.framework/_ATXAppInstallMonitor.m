@interface _ATXAppInstallMonitor
+ (id)appDirectoryAppCategoryMappings;
+ (id)appInfoDictWithBackDate:(BOOL)a3 assetData:(id)a4 newPreInstalledAppSet:(id)a5 isFromNotification:(BOOL)a6 newApps:(id)a7;
+ (id)newPreInstalledAppSet;
+ (id)removeIntersectionBetweenSet:(id)a3 set:(id)a4;
- (BOOL)restoreInProgress;
- (NSSet)preInstalledNewSystemApps;
- (_ATXAppInstallMonitor)initWithAppInfoManager:(id)a3;
- (_ATXAppInstallMonitor)initWithAppInfoManager:(id)a3 histogramBundleIdTable:(id)a4 appIconState:(id)a5 webClipDataStore:(id)a6 shouldSynchronousUpdate:(BOOL)a7;
- (_ATXAppInstallMonitor)initWithAppInfoManager:(id)a3 shouldSynchronousUpdate:(BOOL)a4;
- (id)_appInfoDictWithBackDate:(BOOL)a3 isFromNotification:(BOOL)a4 newApps:(id)a5;
- (id)_fetchAllApps;
- (id)_fetchAllAppsFromDatastore;
- (id)_fetchAllAppsWithInstallDateFromDatastore;
- (id)webClipsForRemovedApps:(id)a3;
- (void)_receivedInstallNotificationWithApps:(id)a3 placeholderInstallNotification:(BOOL)a4;
- (void)_receivedUninstallNotificationWithApps:(id)a3 placeholderUninstallNotification:(BOOL)a4;
- (void)dealloc;
- (void)handleInstallationOfApps:(id)a3 isFromNotification:(BOOL)a4 andBackdate:(BOOL)a5;
- (void)handleUninstallationOfApps:(id)a3;
- (void)noSyncUpdateWithWaitTime:(unint64_t)a3 andBackdate:(BOOL)a4;
- (void)notifyInstallationOfAppsWithInstallDictionary:(id)a3;
- (void)notifyUninstallationOfAppsWithBundleIdsToRemoveSet:(id)a3;
- (void)receivedInstallNotification:(id)a3;
- (void)receivedStateChangeNotification:(id)a3;
- (void)receivedUninstallNotification:(id)a3;
- (void)restoreInProgress;
- (void)setPreInstalledNewSystemApps:(id)a3;
- (void)setUpdateCompletionBlock:(id)a3;
- (void)start;
- (void)stop;
- (void)synchronousUpdateAndBackdate:(BOOL)a3;
- (void)synchronousUpdateWithUninstallWaitTime:(unint64_t)a3 andBackdate:(BOOL)a4;
- (void)train;
@end

@implementation _ATXAppInstallMonitor

- (_ATXAppInstallMonitor)initWithAppInfoManager:(id)a3
{
  id v4 = a3;
  v5 = +[ATXHistogramBundleIdTable sharedInstance];
  v6 = +[_ATXAppIconState sharedInstance];
  v7 = objc_opt_new();
  v8 = [(_ATXAppInstallMonitor *)self initWithAppInfoManager:v4 histogramBundleIdTable:v5 appIconState:v6 webClipDataStore:v7 shouldSynchronousUpdate:1];

  return v8;
}

- (_ATXAppInstallMonitor)initWithAppInfoManager:(id)a3 shouldSynchronousUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[ATXHistogramBundleIdTable sharedInstance];
  v8 = +[_ATXAppIconState sharedInstance];
  v9 = objc_opt_new();
  v10 = [(_ATXAppInstallMonitor *)self initWithAppInfoManager:v6 histogramBundleIdTable:v7 appIconState:v8 webClipDataStore:v9 shouldSynchronousUpdate:v4];

  return v10;
}

- (_ATXAppInstallMonitor)initWithAppInfoManager:(id)a3 histogramBundleIdTable:(id)a4 appIconState:(id)a5 webClipDataStore:(id)a6 shouldSynchronousUpdate:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v31.receiver = self;
  v31.super_class = (Class)_ATXAppInstallMonitor;
  v17 = [(_ATXAppInstallMonitor *)&v31 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_appInfoManager, a3);
    objc_storeStrong((id *)&v18->_histogramBundleIdTable, a4);
    objc_storeStrong((id *)&v18->_appIconState, a5);
    objc_storeStrong((id *)&v18->_webClipDataStore, a6);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.duetexpertd._ATXAppInstallMonitor.installQueue", v19);
    installQueue = v18->_installQueue;
    v18->_installQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = [MEMORY[0x1E4F4AF08] dictionaryWithLegacyPathForClass:objc_opt_class()];
    assetData = v18->_assetData;
    v18->_assetData = (NSDictionary *)v22;

    id v24 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v25 = (void *)[v24 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    if ([v25 BOOLForKey:@"crystalMigration"])
    {
      uint64_t v26 = [(id)objc_opt_class() newPreInstalledAppSet];
      preInstalledNewSystemApps = v18->_preInstalledNewSystemApps;
      v18->_preInstalledNewSystemApps = (NSSet *)v26;
    }
    v28 = [v13 allAppsWithInstallDate];
    if (![v28 count] && v7) {
      [(_ATXAppInstallMonitor *)v18 synchronousUpdateAndBackdate:1];
    }
    v29 = __atxlog_handle_default();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppInstallMonitor initWithAppInfoManager:histogramBundleIdTable:appIconState:webClipDataStore:shouldSynchronousUpdate:]();
    }
  }
  return v18;
}

- (void)start
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_receivedInstallNotification_ name:@"com.apple.LaunchServices.applicationRegistered" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_receivedUninstallNotification_ name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
}

- (void)stop
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationRegistered" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
}

- (void)dealloc
{
  [(_ATXAppInstallMonitor *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppInstallMonitor;
  [(_ATXAppInstallMonitor *)&v3 dealloc];
}

- (void)train
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v3 = __atxlog_handle_default();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  v5 = __atxlog_handle_default();
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v9 = 136446210;
    v10 = "_ATXInstallMonitor";
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", (uint8_t *)&v9, 0xCu);
  }

  [(_ATXAppInstallMonitor *)self synchronousUpdateAndBackdate:0];
  BOOL v7 = __atxlog_handle_default();
  v8 = v7;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v9 = 136446210;
    v10 = "_ATXInstallMonitor";
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v8, OS_SIGNPOST_INTERVAL_END, v4, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", (uint8_t *)&v9, 0xCu);
  }
}

- (BOOL)restoreInProgress
{
  v2 = [MEMORY[0x1E4F4A2E0] sessionsWithSessionTypeIdentifier:*MEMORY[0x1E4F4A288]];
  uint64_t v3 = [v2 count];
  os_signpost_id_t v4 = __atxlog_handle_default();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      -[_ATXAppInstallMonitor restoreInProgress]();
    }
  }
  else if (v5)
  {
    -[_ATXAppInstallMonitor restoreInProgress]();
  }

  return v3 != 0;
}

- (void)synchronousUpdateWithUninstallWaitTime:(unint64_t)a3 andBackdate:(BOOL)a4
{
  installQueue = self->_installQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76___ATXAppInstallMonitor_synchronousUpdateWithUninstallWaitTime_andBackdate___block_invoke;
  block[3] = &unk_1E68AD708;
  block[4] = self;
  block[5] = a3;
  BOOL v6 = a4;
  dispatch_sync(installQueue, block);
}

- (void)synchronousUpdateAndBackdate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NSDictionary *)self->_assetData objectForKeyedSubscript:@"Wait time after notification before data deletion"];
  -[_ATXAppInstallMonitor synchronousUpdateWithUninstallWaitTime:andBackdate:](self, "synchronousUpdateWithUninstallWaitTime:andBackdate:", [v5 unsignedIntegerValue], v3);
}

- (void)noSyncUpdateWithWaitTime:(unint64_t)a3 andBackdate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  v8 = [(_ATXAppInstallMonitor *)self _fetchAllAppsWithInstallDateFromDatastore];
  int v9 = [(_ATXAppInstallMonitor *)self _fetchAllApps];
  v10 = (void *)[v9 mutableCopy];
  id v11 = +[_ATXAppInstallMonitor removeIntersectionBetweenSet:v10 set:v8];
  v12 = [v10 allObjects];
  [(_ATXAppInstallMonitor *)self handleInstallationOfApps:v12 isFromNotification:0 andBackdate:v4];

  if ([(_ATXAppInstallMonitor *)self restoreInProgress])
  {
    id v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppInstallMonitor noSyncUpdateWithWaitTime:andBackdate:]();
    }

    updateCompletionBlock = (void (**)(void))self->_updateCompletionBlock;
    if (updateCompletionBlock) {
      updateCompletionBlock[2]();
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62___ATXAppInstallMonitor_noSyncUpdateWithWaitTime_andBackdate___block_invoke;
    aBlock[3] = &unk_1E68AD730;
    aBlock[4] = self;
    id v15 = _Block_copy(aBlock);
    if (a3 && [v8 count])
    {
      id v16 = __atxlog_handle_default();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "Requesting async app removal", buf, 2u);
      }

      v17 = (void *)MEMORY[0x1E4F93B18];
      installQueue = self->_installQueue;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __62___ATXAppInstallMonitor_noSyncUpdateWithWaitTime_andBackdate___block_invoke_40;
      v23[3] = &unk_1E68ABB98;
      id v25 = v15;
      id v24 = v8;
      [v17 runAsyncOnQueue:installQueue afterDelaySeconds:v23 block:(double)a3];
    }
    else if ([v8 count])
    {
      (*((void (**)(void *, void *, void *))v15 + 2))(v15, v8, v9);
    }
    uint64_t v22 = (void (**)(id, uint64_t, uint64_t, uint64_t))self->_updateCompletionBlock;
    if (v22) {
      v22[2](v22, v19, v20, v21);
    }
  }
}

- (void)receivedStateChangeNotification:(id)a3
{
  BOOL v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "app install monitor got LS state change notification", v4, 2u);
  }

  ATXUpdatePredictionsImmediatelyWithReason(17);
}

- (void)receivedInstallNotification:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"bundleIDs"];
  BOOL v6 = (void *)[v5 copy];

  BOOL v7 = [v4 objectForKeyedSubscript:@"isPlaceholder"];
  uint64_t v8 = [v7 BOOLValue];

  int v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_ATXAppInstallMonitor receivedInstallNotification:]((uint64_t)v6, v9);
  }

  if (v6) {
    [(_ATXAppInstallMonitor *)self _receivedInstallNotificationWithApps:v6 placeholderInstallNotification:v8];
  }
}

- (void)_receivedInstallNotificationWithApps:(id)a3 placeholderInstallNotification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  +[ATXInternalAppRegistrationNotification postNotificationWithInstallDictionary:v6];
  BOOL v7 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
  uint64_t v8 = [(_ATXAppInstallMonitor *)self _fetchAllAppsWithInstallDateFromDatastore];
  [v7 minusSet:v8];
  uint64_t v9 = [v7 count];
  if (v4)
  {
    if (v9)
    {
      v28 = v8;
      v10 = __atxlog_handle_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v39 = v7;
        __int16 v40 = 1024;
        int v41 = 1;
        _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "Applications Installed: %@; isPlaceholder: %{BOOL}u",
          buf,
          0x12u);
      }

      id v11 = objc_opt_new();
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v12 = v6;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v30 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            if ([MEMORY[0x1E4F4AF00] isInstallingForBundle:v17]) {
              [v11 addObject:v17];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v14);
      }

      if ([v11 count])
      {
        v18 = [v7 allObjects];
        uint64_t v19 = [(_ATXAppInstallMonitor *)self _appInfoDictWithBackDate:0 isFromNotification:1 newApps:v18];

        +[ATXInternalAppsInstallStartNotification postNotificationWithInstallStartDictionary:v19];
      }
      uint64_t v8 = v28;
    }
    else
    {
      id v11 = objc_opt_new();
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v21 = v6;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v34 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v33 + 1) + 8 * j);
            if ([MEMORY[0x1E4F4AF00] isOffloadedForBundle:v26]) {
              [v11 addObject:v26];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v23);
      }

      if ([v11 count])
      {
        +[ATXInternalOffloadAppsNotification postNotificationWithOffloadSet:v11];
        v27 = __atxlog_handle_default();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_DEFAULT, "app install monitor got app offload notification", buf, 2u);
        }
      }
    }
LABEL_34:

    goto LABEL_35;
  }
  if (v9)
  {
    uint64_t v20 = __atxlog_handle_default();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v39 = v7;
      __int16 v40 = 1024;
      int v41 = 0;
      _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "Applications Installed: %@; isPlaceholder: %{BOOL}u",
        buf,
        0x12u);
    }

    id v11 = [v7 allObjects];
    [(_ATXAppInstallMonitor *)self handleInstallationOfApps:v11 isFromNotification:1 andBackdate:0];
    goto LABEL_34;
  }
LABEL_35:
}

- (void)receivedUninstallNotification:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"bundleIDs"];
  id v6 = (void *)[v5 copy];

  BOOL v7 = [v4 objectForKeyedSubscript:@"isPlaceholder"];
  uint64_t v8 = [v7 BOOLValue];

  uint64_t v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_ATXAppInstallMonitor receivedUninstallNotification:]((uint64_t)v6, v9);
  }

  if (v6) {
    [(_ATXAppInstallMonitor *)self _receivedUninstallNotificationWithApps:v6 placeholderUninstallNotification:v8];
  }
}

- (void)_receivedUninstallNotificationWithApps:(id)a3 placeholderUninstallNotification:(BOOL)a4
{
  if (!a4) {
    [(_ATXAppInstallMonitor *)self handleUninstallationOfApps:a3];
  }
}

+ (id)newPreInstalledAppSet
{
  v2 = (void *)MEMORY[0x1D25F6CC0](a1, a2);
  BOOL v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.GenerativePlaygroundApp", @"com.apple.printcenter", @"com.apple.TVRemoteUIService", @"com.apple.Passwords", @"com.apple.calculator", 0);
  return v3;
}

+ (id)appDirectoryAppCategoryMappings
{
  return (id)[MEMORY[0x1E4F4AEB8] hardcodedAppCategoryMappings];
}

- (id)_appInfoDictWithBackDate:(BOOL)a3 isFromNotification:(BOOL)a4 newApps:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = [(id)objc_opt_class() appInfoDictWithBackDate:v6 assetData:self->_assetData newPreInstalledAppSet:self->_preInstalledNewSystemApps isFromNotification:v5 newApps:v8];

  return v9;
}

+ (id)appInfoDictWithBackDate:(BOOL)a3 assetData:(id)a4 newPreInstalledAppSet:(id)a5 isFromNotification:(BOOL)a6 newApps:(id)a7
{
  BOOL v50 = a6;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v44 = a4;
  id v49 = a5;
  id v9 = a7;
  id v48 = (id)objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = &dword_1D0FA3000;
    uint64_t v14 = *(void *)v54;
    unint64_t v15 = 0x1E4F4A000uLL;
    uint64_t v45 = *(void *)v54;
    id v46 = v10;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(NSObject **)(*((void *)&v53 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v19 = __atxlog_handle_app_install();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v17;
          _os_log_impl(v13, v19, OS_LOG_TYPE_DEFAULT, "ATXAppInstallMonitor: Adding install date for recently installed app: %@", buf, 0xCu);
        }

        if ([*(id *)(v15 + 3840) isAppClipForBundleId:v17])
        {
          uint64_t v20 = __atxlog_handle_app_install();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
            goto LABEL_41;
          }
          *(_DWORD *)buf = 138412290;
          v58 = v17;
          id v21 = v13;
          uint64_t v22 = v20;
          uint64_t v23 = "ATXAppInstallMonitor: Not adding app clip to appInfoDict: %@";
LABEL_14:
          _os_log_impl(v21, v22, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
          goto LABEL_41;
        }
        if ([*(id *)(v15 + 3840) isLaunchProhibitedForBundle:v17])
        {
          uint64_t v20 = __atxlog_handle_app_install();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
            goto LABEL_41;
          }
          *(_DWORD *)buf = 138412290;
          v58 = v17;
          id v21 = v13;
          uint64_t v22 = v20;
          uint64_t v23 = "ATXAppInstallMonitor: Launch prohibited for bundle: %@";
          goto LABEL_14;
        }
        uint64_t v24 = [*(id *)(v15 + 3840) registrationDateForBundle:v17];
        id v25 = __atxlog_handle_app_install();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v58 = v24;
          __int16 v59 = 2112;
          v60 = v17;
          _os_log_impl(v13, v25, OS_LOG_TYPE_DEFAULT, "ATXAppInstallMonitor: LS install date: %{public}@ for: %@", buf, 0x16u);
        }

        if (!v24 && v50)
        {
          uint64_t v26 = __atxlog_handle_app_install();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            +[_ATXAppInstallMonitor appInfoDictWithBackDate:assetData:newPreInstalledAppSet:isFromNotification:newApps:](&v51, v52, v26);
          }

          uint64_t v24 = objc_opt_new();
        }
        if (a3 || [*(id *)(v15 + 3840) isRestoreInstallTypeForBundle:v17])
        {
          v27 = [v44 objectForKeyedSubscript:@"Backdate time for backup restore apps"];
          uint64_t v20 = -[NSObject dateByAddingTimeInterval:](v24, "dateByAddingTimeInterval:", (double)-[v27 integerValue]);

          v28 = __atxlog_handle_app_install();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v58 = v17;
            __int16 v59 = 2114;
            v60 = v20;
            _os_log_impl(v13, v28, OS_LOG_TYPE_DEFAULT, "ATXAppInstallMonitor: Backdating install date for: %@ to: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v20 = v24;
        }
        long long v29 = v13;
        long long v30 = [(id)objc_opt_class() appDirectoryAppCategoryMappings];
        uint64_t v31 = [v30 count];
        long long v32 = (void *)MEMORY[0x1E4F1CAD0];
        if (v31)
        {
          long long v33 = [v30 allKeys];
          long long v34 = [v32 setWithArray:v33];
        }
        else
        {
          long long v34 = objc_opt_new();
        }
        int v35 = [v49 containsObject:v17];
        int v36 = [v34 containsObject:v17];
        int v37 = [MEMORY[0x1E4F4AF00] isInternalOrSystemAppForBundleId:v17] ^ 1 | v35;
        if (v50)
        {
          id v10 = v46;
          if (((v37 | v36) & 1) == 0)
          {
            uint64_t v38 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:1.0];

            v39 = __atxlog_handle_app_install();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v17;
              __int16 v40 = v29;
              int v41 = v39;
              v42 = "ATXAppInstallMonitor: LS notification: Backdating install date for system or internal app that is no"
                    "t approved or new in Azul, Crystal - %@";
              goto LABEL_38;
            }
            goto LABEL_39;
          }
        }
        else
        {
          id v10 = v46;
          if ((v37 & 1) == 0)
          {
            uint64_t v38 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:1.0];

            v39 = __atxlog_handle_app_install();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v17;
              __int16 v40 = v29;
              int v41 = v39;
              v42 = "ATXAppInstallMonitor: No LS notification: Backdating install date for system or internal app that is"
                    " not new in Azul, Crystal - %@";
LABEL_38:
              _os_log_impl(v40, v41, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
            }
LABEL_39:

            uint64_t v20 = v38;
          }
        }
        uint64_t v13 = v29;
        [v48 setObject:v20 forKeyedSubscript:v17];

        uint64_t v14 = v45;
        unint64_t v15 = 0x1E4F4A000;
LABEL_41:

        ++v16;
      }
      while (v12 != v16);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v12);
  }

  return v48;
}

- (void)handleInstallationOfApps:(id)a3 isFromNotification:(BOOL)a4 andBackdate:(BOOL)a5
{
  id v8 = [(_ATXAppInstallMonitor *)self _appInfoDictWithBackDate:a5 isFromNotification:a4 newApps:a3];
  BOOL v6 = [v8 allKeys];
  uint64_t v7 = [v6 count];

  if (v7) {
    [(_ATXAppInstallMonitor *)self notifyInstallationOfAppsWithInstallDictionary:v8];
  }
}

- (void)handleUninstallationOfApps:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(_ATXAppInstallMonitor *)self webClipsForRemovedApps:v4];
  BOOL v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Removing data for uninstalled app(s): %@ and app clip(s): %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v7 = [v4 arrayByAddingObjectsFromArray:v5];
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  if ([v4 count]) {
    [(_ATXAppInstallMonitor *)self notifyUninstallationOfAppsWithBundleIdsToRemoveSet:v8];
  }
}

- (void)notifyInstallationOfAppsWithInstallDictionary:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppInstallMonitor: Received app install notification: %@", (uint8_t *)&v6, 0xCu);
  }

  +[_ATXInternalInstallNotification postNotificationWithInstallDictionary:v4];
  [(_ATXAppInfoManager *)self->_appInfoManager handleAppInstallWithInstallDict:v4];
  ATXUpdatePredictionsImmediatelyWithReason(16);
}

- (void)notifyUninstallationOfAppsWithBundleIdsToRemoveSet:(id)a3
{
  histogramBundleIdTable = self->_histogramBundleIdTable;
  id v5 = a3;
  +[_ATXInternalUninstallNotification postNotificationWithUninstallSet:v5 histogramBundleIdTable:histogramBundleIdTable];
  [(_ATXAppInfoManager *)self->_appInfoManager handleAppUninstallWithUninstalledAppSet:v5];

  int v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "App install monitor got app uninstall notification", v7, 2u);
  }

  ATXUpdatePredictionsImmediatelyWithReason(16);
}

- (id)webClipsForRemovedApps:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = -[ATXWebClipDataStore webClipBundleIdsForAppClip:](self->_webClipDataStore, "webClipBundleIdsForAppClip:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v5 copy];
  return v12;
}

- (id)_fetchAllApps
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = [(_ATXAppIconState *)self->_appIconState allAppsKnownToSpringBoard];
  id v5 = (void *)[v3 initWithArray:v4];

  return v5;
}

- (id)_fetchAllAppsFromDatastore
{
  v2 = [(_ATXAppInfoManager *)self->_appInfoManager allApps];
  id v3 = (void *)[v2 mutableCopy];

  return v3;
}

- (id)_fetchAllAppsWithInstallDateFromDatastore
{
  v2 = [(_ATXAppInfoManager *)self->_appInfoManager allAppsWithInstallDate];
  id v3 = (void *)[v2 mutableCopy];

  return v3;
}

+ (id)removeIntersectionBetweenSet:(id)a3 set:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  unint64_t v9 = [v8 count];
  id v10 = v8;
  __int16 v11 = v7;
  if (v9 < [v7 count])
  {

    id v10 = v7;
    __int16 v11 = v8;
  }
  uint64_t v12 = (void *)[v11 mutableCopy];
  [v12 intersectSet:v10];
  [v7 minusSet:v12];
  [v8 minusSet:v12];

  return v12;
}

- (void)setUpdateCompletionBlock:(id)a3
{
  self->_updateCompletionBlock = _Block_copy(a3);
  MEMORY[0x1F41817F8]();
}

- (NSSet)preInstalledNewSystemApps
{
  return self->_preInstalledNewSystemApps;
}

- (void)setPreInstalledNewSystemApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preInstalledNewSystemApps, 0);
  objc_storeStrong(&self->_updateCompletionBlock, 0);
  objc_storeStrong((id *)&self->_installQueue, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
  objc_storeStrong((id *)&self->_appIconState, 0);
  objc_storeStrong((id *)&self->_histogramBundleIdTable, 0);
  objc_storeStrong((id *)&self->_webClipDataStore, 0);
  objc_storeStrong((id *)&self->_appInfoManager, 0);
}

- (void)initWithAppInfoManager:histogramBundleIdTable:appIconState:webClipDataStore:shouldSynchronousUpdate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "_ATXAppInfoManager initialized", v2, v3, v4, v5, v6);
}

- (void)restoreInProgress
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Restore not in progress", v2, v3, v4, v5, v6);
}

- (void)noSyncUpdateWithWaitTime:andBackdate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Recently restored. Won't purge data this time...", v2, v3, v4, v5, v6);
}

- (void)receivedInstallNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "applications installed: %@", (uint8_t *)&v2, 0xCu);
}

- (void)receivedUninstallNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "applications uninstalled: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)appInfoDictWithBackDate:(os_log_t)log assetData:newPreInstalledAppSet:isFromNotification:newApps:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXAppInstallMonitor: LS app registration date shouldn't be nil, falling back to now", buf, 2u);
}

@end