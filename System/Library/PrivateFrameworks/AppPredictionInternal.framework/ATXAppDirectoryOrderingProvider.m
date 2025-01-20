@interface ATXAppDirectoryOrderingProvider
+ (BOOL)isStoreDemoMode;
+ (id)_reorderedRecentApps:(id)a3;
+ (id)sharedInstance;
- (ATXAppDirectoryOrderingProvider)initWithAppInfoManager:(id)a3 cache:(id)a4 blacklist:(id)a5 recentsCache:(id)a6 hiddenAppsCache:(id)a7 appClipDataProvider:(id)a8 appIconState:(id)a9 appClipChangeListener:(id)a10 histogramManager:(id)a11 appProtectionInfoProvider:(id)a12;
- (BOOL)_readCategoriesFromDisk;
- (BOOL)_shiftAppIndices:(id)a3 category:(id)a4;
- (BOOL)_shouldConsiderAppForRecents:(id)a3;
- (BOOL)_shouldInvalidateCachedCategoriesForDemoMode;
- (BOOL)_writeCategoriesToDisk;
- (BOOL)_writeHiddenAppsToDisk:(id)a3;
- (BOOL)_writeRecentsToDisk;
- (BOOL)_writeToDisk:(id)a3 cache:(id)a4 logIdentifier:(id)a5;
- (BOOL)isMarketingDemoMode;
- (BOOL)shouldUpdateMissingInstalledApps;
- (NSArray)categories;
- (id)_appBundleIDLaunchCountComparator;
- (id)_appBundleIDRecencyComparatorForLastLaunchDates:(id)a3;
- (id)_appBundleIDTotalLaunchComparator;
- (id)_categoryChangesDictionaryForChangedApps:(id)a3;
- (id)_categoryComparator;
- (id)_categoryIdFromBundleId:(id)a3;
- (id)_combinedLaunchCountForBundleId:(id)a3;
- (id)_computeCategoriesWithRetries:(unint64_t)a3;
- (id)_genreIdFromBundleId:(id)a3;
- (id)_getEnterpriseCategoriesForApps:(id)a3;
- (id)_getInstallDateForUnhiddenApp:(id)a3;
- (id)_getMDMOrgName;
- (id)_getManagedAppIDs;
- (id)_groupEnterpriseAppsByIssuerWithBundleIDs:(id)a3 isMDM:(BOOL)a4;
- (id)_issuingOrganizationForEnterpriseAppBundleID:(id)a3 isMDM:(BOOL)a4;
- (id)_mdmEnterpriseCategoriesForApps:(id)a3;
- (id)_reorderedHiddenApps:(id)a3;
- (id)_screenTimeIdFromBundleId:(id)a3;
- (id)_sortCategories:(id)a3;
- (id)_totalCombinedLaunchCountsForCategory:(id)a3;
- (id)_totalLaunchCountsForCategory:(id)a3;
- (id)_totalLibraryLaunchCountsForCategory:(id)a3;
- (id)description;
- (id)positionScreenTimeOtherAtTheEndOfCategories:(id)a3;
- (void)_createHomeScreenServiceIfNecessary;
- (void)_ensureCategoryConsistency;
- (void)_handleManagedAppsChangedNotification;
- (void)_handleManagedAppsOrgInfoChangedNotification;
- (void)_initCategories;
- (void)_postHiddenAppsUpdateNotificationWithReason:(id)a3;
- (void)_postPredictedAppsAndRecentsUpdateNotificationWithReason:(id)a3;
- (void)_postProcessCategories:(id)a3 withReply:(id)a4;
- (void)_postUpdateNotificationWithReason:(id)a3;
- (void)_readCategoriesFromDisk;
- (void)_registerForManagedAppsChangedNotification;
- (void)_registerForManagedAppsOrgInfoChangedNotification;
- (void)_reorderAndHideDupesForAppsInCategory:(id)a3;
- (void)_splitEnterpriseCategoryWithAppsInCategory:(id)a3 appsByCategoryName:(id)a4 isMDMAppCategory:(BOOL)a5;
- (void)_updateAppClipSinceDate:(id)a3 installDates:(id)a4;
- (void)_updateAppLaunchCounts;
- (void)_updateCategories;
- (void)_updateCategoriesForDownweightedAppSet:(id)a3;
- (void)_updateCategoriesForHiddenApps:(id)a3;
- (void)_updateCategoriesForInstalledApps:(id)a3;
- (void)_updateCategoriesForRemovedApps:(id)a3 uninstalled:(BOOL)a4 hidden:(BOOL)a5;
- (void)_updateCategoriesForUnhiddenApps:(id)a3;
- (void)_updateCategoriesForUninstalledApps:(id)a3;
- (void)_updateCategoriesWithRetries:(unint64_t)a3;
- (void)_updateHiddenAppsPodWithNotification:(id)a3;
- (void)_updateMDMAndEnterpriseCategories;
- (void)_updateMDMCategoryName;
- (void)_updateMDMStatus;
- (void)_updateMissingInstalledApps;
- (void)_updateRecents;
- (void)_updateRecentsForAppClipUsageEvent:(id)a3;
- (void)_updateRecentsForInstalledApps:(id)a3;
- (void)_updateRecentsForUnhiddenApps:(id)a3;
- (void)_updateScreenTimeMappingsForAppBundleIds:(id)a3 withRetries:(unint64_t)a4;
- (void)appLaunchDatesWithReply:(id)a3;
- (void)appLaunchInformationWithReply:(id)a3;
- (void)categoriesWithReply:(id)a3;
- (void)categoryLaunchInformationWithReply:(id)a3;
- (void)dealloc;
- (void)postPredictedAppsAndRecentsUpdateNotificationWithReason:(id)a3;
- (void)requestNotificationWhenCategoriesAreReady;
- (void)setCategories:(id)a3;
- (void)setUp;
- (void)topAppsWithMaxNumberOfResults:(unint64_t)a3 reply:(id)a4;
- (void)updateCacheWithActivity:(id)a3 completionHandler:(id)a4;
- (void)updateRecents;
- (void)waitForPendingTasks;
@end

@implementation ATXAppDirectoryOrderingProvider

void __56__ATXAppDirectoryOrderingProvider__reorderedRecentApps___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  uint64_t v7 = [v6 compare:*(void *)(a1 + 40)];

  if (v7 != 1)
  {
    *a4 = 1;
    v9 = v11;
    goto LABEL_8;
  }
  v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
  if ([v8 compare:*(void *)(a1 + 48)] != -1)
  {

    v9 = v11;
LABEL_6:
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    goto LABEL_8;
  }
  unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

  v9 = v11;
  if (v10 < 8) {
    goto LABEL_6;
  }
  *a4 = 1;
LABEL_8:
}

+ (id)_reorderedRecentApps:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1D25F6CC0]();
  v5 = [v3 allKeys];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__ATXAppDirectoryOrderingProvider__reorderedRecentApps___block_invoke;
  v26[3] = &unk_1E68ACBF8;
  id v6 = v3;
  id v27 = v6;
  uint64_t v7 = [v5 sortedArrayUsingComparator:v26];
  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:2.0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__ATXAppDirectoryOrderingProvider__reorderedRecentApps___block_invoke_2;
  v17[3] = &unk_1E68ACC20;
  id v10 = v6;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  id v12 = v8;
  id v20 = v12;
  v21 = &v22;
  [v7 enumerateObjectsUsingBlock:v17];
  uint64_t v13 = v23[3];
  if (v13 == [v7 count])
  {
    id v14 = v7;
  }
  else
  {
    objc_msgSend(v7, "subarrayWithRange:", 0, v23[3]);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __56__ATXAppDirectoryOrderingProvider__reorderedRecentApps___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  uint64_t v9 = [v8 compare:v7];
  if (!v9) {
    uint64_t v9 = [v5 compare:v6];
  }

  return v9;
}

- (void)_updateRecents
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "ATXAppDirectoryOrderingProvider: App Clip is disabled", v1, 2u);
}

- (BOOL)_shouldConsiderAppForRecents:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F4AF00] isOffloadedForBundle:v4])
  {
    __atxlog_handle_app_library();
    self = (ATXAppDirectoryOrderingProvider *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1D0FA3000, &self->super, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Ignoring offloaded app for recents: %@", (uint8_t *)&v6, 0xCu);
    }

    LOBYTE(self) = 0;
  }
  else
  {
    LODWORD(self) = [(ATXAppProtectionInfoProvider *)self->_appProtectionInfoProvider bundleIdIsHiddenByUserPreference:v4] ^ 1;
  }

  return (char)self;
}

- (BOOL)shouldUpdateMissingInstalledApps
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (!CFPreferencesGetAppBooleanValue(@"crystalMigration", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat))return 0; {
  id v3 = [(_ATXAppInfoManager *)self->_infoManager appInfoForBundleId:@"com.apple.GenerativePlaygroundApp"];
  }

  if (!v3) {
    return 1;
  }
  id v4 = [(_ATXAppInfoManager *)self->_infoManager appInfoForBundleId:@"com.apple.printcenter"];

  if (!v4) {
    return 1;
  }
  id v5 = [(_ATXAppInfoManager *)self->_infoManager appInfoForBundleId:@"com.apple.Passwords"];

  if (!v5) {
    return 1;
  }
  int v6 = [MEMORY[0x1E4F93B08] isiPad]
     ? @"com.apple.calculator"
     : @"com.apple.TVRemoteUIService";
  id v7 = [(_ATXAppInfoManager *)self->_infoManager appInfoForBundleId:v6];

  return !v7;
}

- (BOOL)_writeRecentsToDisk
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(id)objc_opt_class() _reorderedRecentApps:self->_recentApps];
  id v4 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Writing recents pod with:\n%@", (uint8_t *)&v7, 0xCu);
  }

  BOOL v5 = [(ATXAppDirectoryOrderingProvider *)self _writeToDisk:v3 cache:self->_recentsCache logIdentifier:@"recent apps"];
  return v5;
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_3_cold_1();
    }

    [WeakRetained _postPredictedAppsAndRecentsUpdateNotificationWithReason:@"Suggestions Settings Changed"];
  }
}

- (void)_postPredictedAppsAndRecentsUpdateNotificationWithReason:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = @"Unknown";
  if (a3) {
    id v4 = (__CFString *)a3;
  }
  BOOL v5 = v4;
  int v6 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: posted predicted/recents update notification with reason %@", (uint8_t *)&v7, 0xCu);
  }

  [(ATXAppDirectoryOrderingProvider *)self _createHomeScreenServiceIfNecessary];
  [(SBSHomeScreenService *)self->_sbsHomeScreenService requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:v5 completionHandler:0];
}

- (void)_createHomeScreenServiceIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_sbsHomeScreenService)
  {
    objc_msgSend(MEMORY[0x1E4FA6AC8], "atx_sharedInstance");
    self->_sbsHomeScreenService = (SBSHomeScreenService *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)_writeToDisk:(id)a3 cache:(id)a4 logIdentifier:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v11 = 0;
  if (v8 && v9)
  {
    if ([v9 storeSecureCodedObject:v8 error:0])
    {
      id v12 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v10;
        _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Write %@ to disk succeeded", (uint8_t *)&v14, 0xCu);
      }

      BOOL v11 = 1;
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

uint64_t __48__ATXAppDirectoryOrderingProvider_updateRecents__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateRecents];
  v2 = *(void **)(a1 + 32);
  return [v2 _postPredictedAppsAndRecentsUpdateNotificationWithReason:@"Recents update requested"];
}

- (void)updateRecents
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ATXAppDirectoryOrderingProvider_updateRecents__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_updateAppClipSinceDate:(id)a3 installDates:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  appClipDataProvider = self->_appClipDataProvider;
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  v21 = v6;
  id v10 = [(ATXDuetDataProvider *)appClipDataProvider fetchEventsBetweenStartDate:v6 andEndDate:v9 withPredicates:0 limit:1000 ascending:0];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v17 = [v16 webClipBundleId];
        if (!v17)
        {
          id v20 = __atxlog_handle_app_library();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v27 = v16;
            _os_log_fault_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_FAULT, "ATXAppDirectoryOrderingProvider: webAppBundleId should not be nil for an ATXAppClipUsageDuetEvent. Event: %@", buf, 0xCu);
          }
          goto LABEL_12;
        }
        id v18 = [v7 objectForKeyedSubscript:v17];

        if (!v18)
        {
          id v19 = [v16 launchDate];

          if (v19)
          {
            id v20 = [v16 launchDate];
            [v7 setObject:v20 forKeyedSubscript:v17];
LABEL_12:
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v13);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_23);
  }
  v2 = (void *)sharedInstance_provider;
  return v2;
}

uint64_t __49__ATXAppDirectoryOrderingProvider_sharedInstance__block_invoke()
{
  os_log_t v0 = [ATXAppDirectoryOrderingProvider alloc];
  v17 = +[_ATXAppInfoManager sharedInstance];
  id v1 = objc_alloc(MEMORY[0x1E4F4B638]);
  long long v23 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"ATXAppDirectoryCache"];
  long long v22 = __atxlog_handle_app_library();
  v2 = (void *)[v1 initWithCacheFilePath:v23 loggingHandle:v22 debugName:@"App Library categories cache"];
  id v19 = +[ATXAppPredictionBlacklist sharedInstance];
  id v3 = objc_alloc(MEMORY[0x1E4F4B638]);
  v21 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:*MEMORY[0x1E4F4B4F0]];
  id v20 = __atxlog_handle_app_library();
  uint64_t v16 = (void *)[v3 initWithCacheFilePath:v21 loggingHandle:v20 debugName:@"App Library recents cache"];
  id v4 = objc_alloc(MEMORY[0x1E4F4B638]);
  id v18 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:*MEMORY[0x1E4F4B4A8]];
  BOOL v5 = __atxlog_handle_app_library();
  id v6 = (void *)[v4 initWithCacheFilePath:v18 loggingHandle:v5 debugName:@"App Library hidden apps cache"];
  id v7 = objc_opt_new();
  id v8 = +[_ATXAppIconState sharedInstance];
  id v9 = objc_opt_new();
  id v10 = +[_ATXAppLaunchHistogramManager sharedInstance];
  id v11 = objc_opt_new();
  uint64_t v12 = [(ATXAppDirectoryOrderingProvider *)v0 initWithAppInfoManager:v17 cache:v2 blacklist:v19 recentsCache:v16 hiddenAppsCache:v6 appClipDataProvider:v7 appIconState:v8 appClipChangeListener:v9 histogramManager:v10 appProtectionInfoProvider:v11];
  uint64_t v13 = (void *)sharedInstance_provider;
  sharedInstance_provider = v12;

  uint64_t v14 = (void *)sharedInstance_provider;
  return [v14 setUp];
}

- (ATXAppDirectoryOrderingProvider)initWithAppInfoManager:(id)a3 cache:(id)a4 blacklist:(id)a5 recentsCache:(id)a6 hiddenAppsCache:(id)a7 appClipDataProvider:(id)a8 appIconState:(id)a9 appClipChangeListener:(id)a10 histogramManager:(id)a11 appProtectionInfoProvider:(id)a12
{
  id v17 = a3;
  id v65 = a4;
  id v18 = a4;
  id v63 = a5;
  id v19 = a5;
  id v66 = a6;
  id v74 = a6;
  id v67 = a7;
  id v20 = a7;
  v21 = v17;
  id v73 = v20;
  id v72 = a8;
  id v71 = a9;
  id v70 = a10;
  id v69 = a11;
  id v68 = a12;
  v96.receiver = self;
  v96.super_class = (Class)ATXAppDirectoryOrderingProvider;
  long long v22 = [(ATXAppDirectoryOrderingProvider *)&v96 init];
  if (v22)
  {
    id v76 = v19;
    id v61 = v18;
    v62 = v21;
    long long v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    id v24 = objc_claimAutoreleasedReturnValue();
    long long v25 = (const char *)[v24 UTF8String];
    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create(v25, v26);
    queue = v22->_queue;
    v22->_queue = (OS_dispatch_queue *)v27;

    objc_storeStrong((id *)&v22->_infoManager, a3);
    uint64_t v29 = objc_opt_new();
    installNotification = v22->_installNotification;
    v22->_installNotification = (_ATXInternalInstallNotification *)v29;

    uint64_t v31 = objc_opt_new();
    uninstallNotification = v22->_uninstallNotification;
    v22->_uninstallNotification = (_ATXInternalUninstallNotification *)v31;

    uint64_t v33 = objc_opt_new();
    offloadNotification = v22->_offloadNotification;
    v22->_offloadNotification = (ATXInternalOffloadAppsNotification *)v33;

    uint64_t v35 = objc_opt_new();
    installingNotification = v22->_installingNotification;
    v22->_installingNotification = (ATXInternalAppsInstallStartNotification *)v35;

    uint64_t v37 = objc_opt_new();
    hiddenAppNotification = v22->_hiddenAppNotification;
    v22->_hiddenAppNotification = (ATXInternalLockedOrHiddenAppNotification *)v37;

    uint64_t v39 = objc_opt_new();
    unhiddenAppNotification = v22->_unhiddenAppNotification;
    v22->_unhiddenAppNotification = (ATXInternalUnLockedOrUnHiddenAppNotification *)v39;

    objc_storeStrong((id *)&v22->_cache, v65);
    objc_storeStrong((id *)&v22->_recentsCache, v66);
    objc_storeStrong((id *)&v22->_hiddenAppsCache, v67);
    objc_storeStrong((id *)&v22->_appClipDataProvider, a8);
    objc_storeStrong((id *)&v22->_appIconState, a9);
    objc_storeStrong((id *)&v22->_appLaunchHistogramManager, a11);
    objc_storeStrong((id *)&v22->_appClipChangeListener, a10);
    uint64_t v41 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastUpdatePostTime = v22->_lastUpdatePostTime;
    v22->_lastUpdatePostTime = (NSDate *)v41;

    id v43 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v44 = [v43 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    atxDefaults = v22->_atxDefaults;
    v22->_atxDefaults = (NSUserDefaults *)v44;

    objc_storeStrong((id *)&v22->_appProtectionInfoProvider, a12);
    [(ATXAppDirectoryOrderingProvider *)v22 _registerForManagedAppsOrgInfoChangedNotification];
    [(ATXAppDirectoryOrderingProvider *)v22 _registerForManagedAppsChangedNotification];
    objc_initWeak(&location, v22);
    v46 = v22->_installNotification;
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke;
    v93[3] = &unk_1E68ACAE0;
    objc_copyWeak(&v94, &location);
    [(_ATXInternalInstallNotification *)v46 registerForNotificationsWithInstallBlock:v93];
    v47 = v22->_unhiddenAppNotification;
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_84;
    v91[3] = &unk_1E68ACB08;
    objc_copyWeak(&v92, &location);
    [(ATXInternalUnLockedOrUnHiddenAppNotification *)v47 registerForNotificationsWithUnLockedOrUnHiddenAppBlock:v91];
    v48 = v22->_installingNotification;
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_90;
    v89[3] = &unk_1E68ACAE0;
    objc_copyWeak(&v90, &location);
    [(ATXInternalAppsInstallStartNotification *)v48 registerForNotificationsWithInstallStartBlock:v89];
    v49 = v22->_uninstallNotification;
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_95;
    v87[3] = &unk_1E68AB9D8;
    objc_copyWeak(&v88, &location);
    [(_ATXInternalUninstallNotification *)v49 registerForNotificationsWithUninstallBlock:v87];
    v50 = v22->_hiddenAppNotification;
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_98;
    v85[3] = &unk_1E68ACB30;
    objc_copyWeak(&v86, &location);
    [(ATXInternalLockedOrHiddenAppNotification *)v50 registerForNotificationsWithLockedOrHiddenAppBlock:v85];
    v51 = v22->_offloadNotification;
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_104;
    v83[3] = &unk_1E68AB9D8;
    objc_copyWeak(&v84, &location);
    [(ATXInternalOffloadAppsNotification *)v51 registerForNotificationWithOffloadBlock:v83];
    appClipChangeListener = v22->_appClipChangeListener;
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_106;
    v81[3] = &unk_1E68ACB58;
    objc_copyWeak(&v82, &location);
    [(ATXAppClipUsageDuetContextUpdateListener *)appClipChangeListener startListeningWithCallback:v81 clientId:@"ATXAppDirectoryOrderingProvider"];
    v53 = v22->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_3;
    handler[3] = &unk_1E68ACB80;
    objc_copyWeak(&v80, &location);
    notify_register_dispatch("com.apple.suggestions.settingsChanged", &v22->_settingsChangedToken, v53, handler);
    if (v76)
    {
      objc_storeStrong((id *)&v22->_blacklist, v63);
      uint64_t v54 = [(ATXAppPredictionBlacklist *)v22->_blacklist disabledBundleIds];
      blacklistedBundleIds = v22->_blacklistedBundleIds;
      v22->_blacklistedBundleIds = (NSSet *)v54;

      blacklist = v22->_blacklist;
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_117;
      v77[3] = &unk_1E68AC2D0;
      objc_copyWeak(&v78, &location);
      [(ATXAppPredictionBlacklist *)blacklist registerPrefsChangeHandler:v77];
      objc_destroyWeak(&v78);
    }
    else
    {
      uint64_t v57 = objc_opt_new();
      v58 = v22->_blacklistedBundleIds;
      v22->_blacklistedBundleIds = (NSSet *)v57;
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v22, (CFNotificationCallback)updateCache, @"com.apple.Proactive.UpdateAppLibraryCache", 0, CFNotificationSuspensionBehaviorDrop);
    objc_destroyWeak(&v80);
    objc_destroyWeak(&v82);
    objc_destroyWeak(&v84);
    objc_destroyWeak(&v86);
    objc_destroyWeak(&v88);
    objc_destroyWeak(&v90);
    objc_destroyWeak(&v92);
    objc_destroyWeak(&v94);
    objc_destroyWeak(&location);
    id v18 = v61;
    v21 = v62;
    id v19 = v76;
  }

  return v22;
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v3 count])
  {
    BOOL v5 = WeakRetained[3];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2;
    v6[3] = &unk_1E68AB870;
    id v7 = WeakRetained;
    id v8 = v3;
    dispatch_async(v5, v6);
  }
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[ATXBackupService isBackupRestore];
  id v3 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Install finish notification received; isRestore=%{BOOL}d",
      (uint8_t *)v6,
      8u);
  }

  if (!v2) {
    [*(id *)(a1 + 32) _updateRecentsForInstalledApps:*(void *)(a1 + 40)];
  }
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = [*(id *)(a1 + 40) allKeys];
  [v4 _updateCategoriesForInstalledApps:v5];
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_84(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v5 = [v3 unHiddenApps];

  id v6 = [v5 allObjects];

  if (WeakRetained && [v6 count])
  {
    uint64_t v7 = WeakRetained[3];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_85;
    v8[3] = &unk_1E68AB870;
    id v9 = WeakRetained;
    id v10 = v6;
    dispatch_async(v7, v8);
  }
}

uint64_t __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_85(uint64_t a1)
{
  BOOL v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Unhidden app notification received", v4, 2u);
  }

  [*(id *)(a1 + 32) _updateRecentsForUnhiddenApps:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateCategoriesForUnhiddenApps:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _updateHiddenAppsPodWithNotification:@"App un-hidden"];
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_90(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v3 count])
  {
    BOOL v5 = WeakRetained[3];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_91;
    v6[3] = &unk_1E68AB870;
    uint64_t v7 = WeakRetained;
    id v8 = v3;
    dispatch_async(v5, v6);
  }
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_91(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[ATXBackupService isBackupRestore];
  id v3 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v2;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Install start notification received; isRestore=%{BOOL}d",
      (uint8_t *)v4,
      8u);
  }

  if (!v2)
  {
    [*(id *)(a1 + 32) _updateRecentsForInstalledApps:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _postUpdateNotificationWithReason:@"App install initiated"];
  }
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_95(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v3 count])
  {
    uint64_t v5 = WeakRetained[3];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_96;
    v6[3] = &unk_1E68AB870;
    uint64_t v7 = WeakRetained;
    id v8 = v3;
    dispatch_async(v5, v6);
  }
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_96(uint64_t a1)
{
  BOOL v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Uninstall notification received", v7, 2u);
  }

  id v3 = *(void **)(*(void *)(a1 + 32) + 144);
  id v4 = [*(id *)(a1 + 40) allObjects];
  [v3 removeObjectsForKeys:v4];

  [*(id *)(a1 + 32) _writeRecentsToDisk];
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) allObjects];
  [v5 _updateCategoriesForUninstalledApps:v6];
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_98(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [v3 hiddenApps];

  id v6 = [v5 allObjects];

  if (WeakRetained && [v6 count])
  {
    uint64_t v7 = WeakRetained[3];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_99;
    v8[3] = &unk_1E68AB870;
    id v9 = v6;
    id v10 = WeakRetained;
    dispatch_async(v7, v8);
  }
}

uint64_t __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_99(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Hidden app notification received", buf, 2u);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 144), "removeObjectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 40) _writeRecentsToDisk];
  [*(id *)(a1 + 40) _updateCategoriesForHiddenApps:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) _updateHiddenAppsPodWithNotification:@"App hidden"];
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_104(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v3 count])
  {
    uint64_t v5 = WeakRetained[3];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_105;
    v6[3] = &unk_1E68AB870;
    uint64_t v7 = WeakRetained;
    id v8 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_105(uint64_t a1)
{
  BOOL v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Offload notification received", v4, 2u);
  }

  return [*(id *)(a1 + 32) _updateCategoriesForDownweightedAppSet:*(void *)(a1 + 40)];
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_106(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[3];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_107;
    v7[3] = &unk_1E68AB870;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_107(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRecentsForAppClipUsageEvent:*(void *)(a1 + 40)];
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_117(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_118;
    block[3] = &unk_1E68AB818;
    uint64_t v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_2_118(uint64_t a1)
{
  BOOL v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Blacklist update notification received", v7, 2u);
  }

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 128) disabledBundleIds];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 136);
  *(void *)(v4 + 136) = v3;

  return [*(id *)(a1 + 32) _updateCategoriesForDownweightedAppSet:*(void *)(*(void *)(a1 + 32) + 136)];
}

- (void)setUp
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ATXAppDirectoryOrderingProvider_setUp__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__ATXAppDirectoryOrderingProvider_setUp__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _initCategories];
  [*(id *)(a1 + 32) _updateRecents];
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _updateHiddenAppsPodWithNotification:@"Hidden apps pod initialized"];
}

- (void)updateCacheWithActivity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if ([v6 didDefer])
  {
    id v8 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Deferring XPC update", buf, 2u);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__ATXAppDirectoryOrderingProvider_updateCacheWithActivity_completionHandler___block_invoke;
    block[3] = &unk_1E68ACBA8;
    id v11 = v6;
    long long v12 = self;
    uint64_t v13 = v7;
    dispatch_async(queue, block);
  }
}

void __77__ATXAppDirectoryOrderingProvider_updateCacheWithActivity_completionHandler___block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)os_transaction_create();
  if ([*(id *)(a1 + 32) didDefer])
  {
    uint64_t v3 = __atxlog_handle_app_library();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v10 = 0;
    uint64_t v4 = (uint8_t *)&v10;
    goto LABEL_13;
  }
  [*(id *)(a1 + 40) _updateAppLaunchCounts];
  if ([*(id *)(a1 + 32) didDefer])
  {
    uint64_t v3 = __atxlog_handle_app_library();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v9 = 0;
    uint64_t v4 = (uint8_t *)&v9;
    goto LABEL_13;
  }
  [*(id *)(a1 + 40) _updateRecents];
  if ([*(id *)(a1 + 32) didDefer])
  {
    uint64_t v3 = __atxlog_handle_app_library();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v8 = 0;
    uint64_t v4 = (uint8_t *)&v8;
    goto LABEL_13;
  }
  [*(id *)(a1 + 40) _updateCategoriesWithRetries:2];
  if ([*(id *)(a1 + 32) didDefer])
  {
    uint64_t v3 = __atxlog_handle_app_library();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v7 = 0;
    uint64_t v4 = (uint8_t *)&v7;
LABEL_13:
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Deferring XPC update", v4, 2u);
LABEL_14:

    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t))(v5 + 16))(v5);
    }
    goto LABEL_16;
  }
  [*(id *)(a1 + 40) _updateHiddenAppsPodWithNotification:@"Hidden apps pod updated"];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
LABEL_16:
}

- (id)description
{
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  __int16 v10 = __Block_byref_object_copy__8;
  id v11 = __Block_byref_object_dispose__8;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __46__ATXAppDirectoryOrderingProvider_description__block_invoke;
  v6[3] = &unk_1E68ACBD0;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  uint64_t v3 = (__CFString *)v8[5];
  if (!v3) {
    uint64_t v3 = &stru_1F2740B58;
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __46__ATXAppDirectoryOrderingProvider_description__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 280) description];
  return MEMORY[0x1F41817F8]();
}

- (void)_postUpdateNotificationWithReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"Unknown";
  if (a3) {
    uint64_t v4 = (__CFString *)a3;
  }
  uint64_t v5 = v4;
  uint64_t v6 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    __int16 v10 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: posted category update notification with reason %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  lastUpdatePostTime = self->_lastUpdatePostTime;
  self->_lastUpdatePostTime = v7;

  [(ATXAppDirectoryOrderingProvider *)self _createHomeScreenServiceIfNecessary];
  [(SBSHomeScreenService *)self->_sbsHomeScreenService requestAppLibraryUpdateWithReason:v5 completionHandler:0];
}

- (void)postPredictedAppsAndRecentsUpdateNotificationWithReason:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__ATXAppDirectoryOrderingProvider_postPredictedAppsAndRecentsUpdateNotificationWithReason___block_invoke;
  v7[3] = &unk_1E68AB870;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __91__ATXAppDirectoryOrderingProvider_postPredictedAppsAndRecentsUpdateNotificationWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postPredictedAppsAndRecentsUpdateNotificationWithReason:*(void *)(a1 + 40)];
}

- (void)_postHiddenAppsUpdateNotificationWithReason:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = @"Unknown";
  if (a3) {
    id v4 = (__CFString *)a3;
  }
  uint64_t v5 = v4;
  id v6 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: posted hidden apps update notification with reason %@", (uint8_t *)&v7, 0xCu);
  }

  [(ATXAppDirectoryOrderingProvider *)self _createHomeScreenServiceIfNecessary];
  [(SBSHomeScreenService *)self->_sbsHomeScreenService requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:v5 completionHandler:0];
}

- (void)dealloc
{
  int settingsChangedToken = self->_settingsChangedToken;
  if (settingsChangedToken) {
    notify_cancel(settingsChangedToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)ATXAppDirectoryOrderingProvider;
  [(ATXAppDirectoryOrderingProvider *)&v4 dealloc];
}

- (void)waitForPendingTasks
{
}

- (BOOL)_readCategoriesFromDisk
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = (void *)MEMORY[0x1D25F6CC0]();
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  id v12 = [(ATXGenericFileBasedCache *)self->_cache readSecureCodedObjectWithMaxValidAge:v11 allowableClasses:0 error:604800.0];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = v12;
      uint64_t v14 = [v13 objectForKeyedSubscript:@"version"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v16 = [v13 objectForKeyedSubscript:@"version"];
        uint64_t v17 = [v16 unsignedIntegerValue];

        BOOL v18 = v17 == 10;
        if (v17 != 10)
        {
          id v24 = __atxlog_handle_app_library();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v26 = [v13 objectForKeyedSubscript:@"version"];
            *(_DWORD *)buf = 138412546;
            NSUInteger v28 = (NSUInteger)v26;
            __int16 v29 = 2048;
            uint64_t v30 = 10;
            _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Cache version %@ doesn't match current version %lu", buf, 0x16u);
          }
LABEL_18:

          goto LABEL_14;
        }
        id v19 = [v13 objectForKeyedSubscript:@"categories"];
        objc_opt_class();
        char v20 = objc_opt_isKindOfClass();

        if (v20)
        {
          v21 = [v13 objectForKeyedSubscript:@"categories"];
          [(ATXAppDirectoryOrderingProvider *)self setCategories:v21];

          if ([(NSArray *)self->_categories count])
          {
            id v24 = __atxlog_handle_app_library();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              NSUInteger v22 = [(NSArray *)self->_categories count];
              *(_DWORD *)buf = 134217984;
              NSUInteger v28 = v22;
              _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Read from disk succeeded, got %lu categories", buf, 0xCu);
            }
            goto LABEL_18;
          }
        }
      }
    }
    else
    {
      uint64_t v13 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXAppDirectoryOrderingProvider _readCategoriesFromDisk]();
      }
    }
    BOOL v18 = 0;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (BOOL)_writeCategoriesToDisk
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"categories";
  categories = self->_categories;
  id v4 = categories;
  if (!categories) {
    id v4 = objc_opt_new();
  }
  v9[1] = @"version";
  v10[0] = v4;
  if (self->_currentCacheDueForRefresh) {
    uint64_t v5 = &unk_1F27F00D8;
  }
  else {
    uint64_t v5 = &unk_1F27F00F0;
  }
  v10[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!categories) {

  }
  BOOL v7 = [(ATXAppDirectoryOrderingProvider *)self _writeToDisk:v6 cache:self->_cache logIdentifier:@"categories"];
  return v7;
}

- (id)_reorderedHiddenApps:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = [(ATXAppDirectoryOrderingProvider *)self _appBundleIDLaunchCountComparator];
  BOOL v7 = [v5 sortedArrayUsingComparator:v6];

  return v7;
}

- (BOOL)_writeHiddenAppsToDisk:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = [(ATXAppDirectoryOrderingProvider *)self _reorderedHiddenApps:v5];

  BOOL v7 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Writing hidden apps pod with:\n%@", (uint8_t *)&v10, 0xCu);
  }

  BOOL v8 = [(ATXAppDirectoryOrderingProvider *)self _writeToDisk:v6 cache:self->_hiddenAppsCache logIdentifier:@"hidden apps"];
  return v8;
}

- (void)_initCategories
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(ATXAppDirectoryOrderingProvider *)self _readCategoriesFromDisk]
    && ![(ATXAppDirectoryOrderingProvider *)self _shouldInvalidateCachedCategoriesForDemoMode])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = self->_categories;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      int v6 = 0;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v3);
          }
          v6 |= objc_msgSend(MEMORY[0x1E4F4AEB0], "isCategoryScreenTime:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "categoryID", (void)v9));
        }
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);

      if (v6)
      {
        [(ATXAppDirectoryOrderingProvider *)self _ensureCategoryConsistency];
        return;
      }
    }
    else
    {
    }
    [(ATXAppDirectoryOrderingProvider *)self _updateCategories];
  }
  else
  {
    [(ATXAppDirectoryOrderingProvider *)self _updateCategories];
  }
}

- (BOOL)_shouldInvalidateCachedCategoriesForDemoMode
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (([(id)objc_opt_class() isStoreDemoMode] & 1) != 0
    || [(ATXAppDirectoryOrderingProvider *)self isMarketingDemoMode])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v3 = self->_categories;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          BOOL v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v8, "categoryID", (void)v12) == 1 || objc_msgSend(v8, "categoryID") == 6)
          {
            BOOL v9 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
        BOOL v9 = 0;
        if (v5) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
LABEL_15:
  }
  else
  {
    BOOL v9 = 0;
  }
  long long v10 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v17 = v9;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: should invalidate cached categories for demo mode: %{BOOL}u", buf, 8u);
  }

  return v9;
}

- (id)positionScreenTimeOtherAtTheEndOfCategories:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)[v3 mutableCopy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend(v4, "copy", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    BOOL v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 categoryID] == 1008)
        {
          id v12 = v11;

          [v4 removeObject:v12];
          BOOL v8 = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);

    if (v8) {
      [v4 addObject:v8];
    }
  }
  else
  {

    BOOL v8 = 0;
  }

  return v4;
}

- (void)setCategories:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_categories != a3)
  {
    -[ATXAppDirectoryOrderingProvider positionScreenTimeOtherAtTheEndOfCategories:](self, "positionScreenTimeOtherAtTheEndOfCategories:");
    uint64_t v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    categories = self->_categories;
    self->_categories = v4;

    uint64_t v6 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Setting categories", buf, 2u);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = self->_categories;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v13 = __atxlog_handle_app_library();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            long long v14 = objc_msgSend(v12, "localizedStringForCategoryID:", objc_msgSend(v12, "categoryID"));
            long long v15 = [v12 appBundleIDs];
            uint64_t v16 = [v15 count];
            long long v17 = [v12 appBundleIDs];
            *(_DWORD *)buf = 138543874;
            long long v23 = v14;
            __int16 v24 = 2048;
            uint64_t v25 = v16;
            __int16 v26 = 2112;
            dispatch_queue_t v27 = v17;
            _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: >>> Category %{public}@, app count: %ld, apps: %@", buf, 0x20u);
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v9);
    }
  }
}

- (void)_updateCategories
{
}

- (void)_updateCategoriesWithRetries:(unint64_t)a3
{
  uint64_t v5 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Recategorizing from scratch", v8, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(ATXAppDirectoryOrderingProvider *)self _updateMDMStatus];
  uint64_t v6 = [(ATXAppDirectoryOrderingProvider *)self _computeCategoriesWithRetries:a3];
  uint64_t v7 = [(ATXAppDirectoryOrderingProvider *)self _sortCategories:v6];
  [(ATXAppDirectoryOrderingProvider *)self setCategories:v7];

  [(ATXAppDirectoryOrderingProvider *)self _writeCategoriesToDisk];
  [(ATXAppDirectoryOrderingProvider *)self _postUpdateNotificationWithReason:@"Full recategorization requested"];
}

- (id)_categoryChangesDictionaryForChangedApps:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v4;
  uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v30;
    *(void *)&long long v6 = 138543362;
    long long v21 = v6;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v9 = -[ATXAppDirectoryOrderingProvider _genreIdFromBundleId:](self, "_genreIdFromBundleId:", v8, v21);
        if ([v9 unsignedIntegerValue] != 1008)
        {
          while ((objc_msgSend(MEMORY[0x1E4F4AEB0], "shouldCategoryNeverMergeWithParent:", objc_msgSend(v9, "unsignedIntegerValue")) & 1) == 0)
          {
            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            uint64_t v10 = self->_categories;
            uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v26;
              while (2)
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v26 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v15 = [*(id *)(*((void *)&v25 + 1) + 8 * j) categoryID];
                  if (v15 == [v9 unsignedIntegerValue])
                  {

                    goto LABEL_21;
                  }
                }
                uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }

            uint64_t v16 = __atxlog_handle_app_library();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v21;
              v34 = v9;
              _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Didn't find category %{public}@ in existing categories, trying parent category", buf, 0xCu);
            }

            long long v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F4AEB0], "parentCategoryForCategory:", objc_msgSend(v9, "unsignedIntegerValue")));

            uint64_t v9 = v17;
            if ([v17 unsignedIntegerValue] == 1008) {
              goto LABEL_22;
            }
          }
        }
LABEL_21:
        long long v17 = v9;
LABEL_22:
        long long v18 = [v5 objectForKeyedSubscript:v17];

        if (v18)
        {
          long long v19 = [v5 objectForKeyedSubscript:v17];
          [v19 addObject:v8];
        }
        else
        {
          long long v19 = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
          [v5 setObject:v19 forKeyedSubscript:v17];
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v24);
  }

  return v5;
}

- (void)_updateRecentsForInstalledApps:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__ATXAppDirectoryOrderingProvider__updateRecentsForInstalledApps___block_invoke;
  v8[3] = &unk_1E68ACC48;
  void v8[4] = self;
  v8[5] = &v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  if (*((unsigned char *)v10 + 24))
  {
    uint64_t v5 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Starting to update recents cache after installation notification", v7, 2u);
    }

    [(ATXAppDirectoryOrderingProvider *)self _writeRecentsToDisk];
  }
  else
  {
    long long v6 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: No recents pod change", v7, 2u);
    }
  }
  _Block_object_dispose(&v9, 8);
}

void __66__ATXAppDirectoryOrderingProvider__updateRecentsForInstalledApps___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  long long v6 = [*(id *)(*(void *)(a1 + 32) + 144) objectForKeyedSubscript:v7];
  if (v6)
  {
  }
  else if ([*(id *)(a1 + 32) _shouldConsiderAppForRecents:v7])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    [*(id *)(*(void *)(a1 + 32) + 144) setObject:v5 forKeyedSubscript:v7];
  }
}

- (void)_updateRecentsForUnhiddenApps:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v6)
  {

    goto LABEL_18;
  }
  uint64_t v7 = v6;
  char v8 = 0;
  uint64_t v9 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
      uint64_t v12 = [(NSMutableDictionary *)self->_recentApps objectForKeyedSubscript:v11];
      if (v12)
      {
        uint64_t v13 = (void *)v12;
      }
      else
      {
        if (![(ATXAppDirectoryOrderingProvider *)self _shouldConsiderAppForRecents:v11])continue; {
        uint64_t v13 = [(ATXAppDirectoryOrderingProvider *)self _getInstallDateForUnhiddenApp:v11];
        }
        [(NSMutableDictionary *)self->_recentApps setObject:v13 forKeyedSubscript:v11];
        char v8 = 1;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v7);

  if (v8)
  {
    long long v14 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Starting to update recents cache after unhidden app notification", v16, 2u);
    }

    [(ATXAppDirectoryOrderingProvider *)self _writeRecentsToDisk];
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v15 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: No recents pod change", v16, 2u);
  }

LABEL_21:
}

- (void)_updateCategoriesForInstalledApps:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(ATXAppDirectoryOrderingProvider *)self _updateMDMStatus];
  v53 = v4;
  v60 = [(ATXAppDirectoryOrderingProvider *)self _categoryChangesDictionaryForChangedApps:v4];
  v56 = [v60 allKeys];
  v58 = objc_opt_new();
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v61 = self;
  obuint64_t j = self->_categories;
  uint64_t v57 = [(NSArray *)obj countByEnumeratingWithState:&v80 objects:v88 count:16];
  if (v57)
  {
    uint64_t v55 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v81 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "categoryID"));
        if ([v56 containsObject:v7])
        {
        }
        else
        {
          uint64_t v8 = [v6 categoryID];

          if (v8 != 1008)
          {
            [v58 addObject:v6];
            continue;
          }
        }
        uint64_t v59 = i;
        uint64_t v9 = [v6 appBundleIDs];
        uint64_t v10 = (void *)[v9 mutableCopy];

        if ([v6 categoryID] == 1008)
        {
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id v11 = v60;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v76 objects:v87 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v77;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v77 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v76 + 1) + 8 * j);
                if ([v16 unsignedIntegerValue] != 1008)
                {
                  long long v17 = [v11 objectForKeyedSubscript:v16];
                  [v10 removeObjectsInArray:v17];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v76 objects:v87 count:16];
            }
            while (v13);
          }
        }
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "categoryID"));
        long long v19 = [v60 objectForKeyedSubscript:v18];

        id v62 = v19;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v72 objects:v86 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v73;
          do
          {
            for (uint64_t k = 0; k != v21; ++k)
            {
              if (*(void *)v73 != v22) {
                objc_enumerationMutation(v62);
              }
              uint64_t v24 = *(void *)(*((void *)&v72 + 1) + 8 * k);
              if ([v6 categoryID] == 1)
              {
                long long v25 = [(ATXAppDirectoryOrderingProvider *)v61 _issuingOrganizationForEnterpriseAppBundleID:v24 isMDM:0];
                long long v26 = [v6 localizedName];
                char v27 = 0;
                if (!v26) {
                  char v27 = [v25 isEqualToString:@"kATXEnterprise"];
                }

                long long v28 = [v6 localizedName];
                int v29 = [v28 isEqualToString:v25];

                if (((v27 & 1) != 0 || v29) && ([v10 containsObject:v24] & 1) == 0) {
                  [v10 addObject:v24];
                }
              }
              else if (([v10 containsObject:v24] & 1) == 0)
              {
                [v10 addObject:v24];
              }
            }
            uint64_t v21 = [v62 countByEnumeratingWithState:&v72 objects:v86 count:16];
          }
          while (v21);
        }

        if ([v6 categoryID] == 1)
        {
          long long v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "categoryID"));
          long long v31 = [v60 objectForKeyedSubscript:v30];
          [v31 removeObjectsInArray:v10];
        }
        [v6 updateAppBundleIDs:v10];
        [v58 addObject:v6];

        uint64_t i = v59;
      }
      uint64_t v57 = [(NSArray *)obj countByEnumeratingWithState:&v80 objects:v88 count:16];
    }
    while (v57);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v63 = v56;
  uint64_t v32 = [v63 countByEnumeratingWithState:&v68 objects:v85 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v69;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v69 != v34) {
          objc_enumerationMutation(v63);
        }
        v36 = *(void **)(*((void *)&v68 + 1) + 8 * m);
        if ([v36 unsignedIntegerValue] == 1)
        {
          uint64_t v37 = [v60 objectForKeyedSubscript:v36];
          uint64_t v38 = [v37 count];

          if (!v38) {
            continue;
          }
          uint64_t v39 = [v60 objectForKeyedSubscript:v36];
          v40 = [(ATXAppDirectoryOrderingProvider *)v61 _getEnterpriseCategoriesForApps:v39];
          [v58 addObjectsFromArray:v40];
        }
        else
        {
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          uint64_t v39 = v61->_categories;
          uint64_t v41 = [(NSArray *)v39 countByEnumeratingWithState:&v64 objects:v84 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v65;
LABEL_53:
            uint64_t v44 = 0;
            while (1)
            {
              if (*(void *)v65 != v43) {
                objc_enumerationMutation(v39);
              }
              v45 = *(void **)(*((void *)&v64 + 1) + 8 * v44);
              uint64_t v46 = [v36 unsignedIntegerValue];
              if (v46 == [v45 categoryID]) {
                break;
              }
              if (v42 == ++v44)
              {
                uint64_t v42 = [(NSArray *)v39 countByEnumeratingWithState:&v64 objects:v84 count:16];
                if (v42) {
                  goto LABEL_53;
                }
                goto LABEL_59;
              }
            }
          }
          else
          {
LABEL_59:

            if ([v36 unsignedIntegerValue] == 6)
            {
              v47 = [v60 objectForKeyedSubscript:v36];
              v48 = (void *)[v47 copy];
              uint64_t v49 = [(ATXAppDirectoryOrderingProvider *)v61 _mdmEnterpriseCategoriesForApps:v48];
            }
            else
            {
              id v50 = objc_alloc(MEMORY[0x1E4F4AEB0]);
              uint64_t v51 = [v36 unsignedIntegerValue];
              v47 = [v60 objectForKeyedSubscript:v36];
              v48 = (void *)[v47 copy];
              uint64_t v49 = [v50 initWithCategoryID:v51 appBundleIDs:v48];
            }
            uint64_t v39 = (NSArray *)v49;

            if (v39) {
              [v58 addObject:v39];
            }
          }
        }
      }
      uint64_t v33 = [v63 countByEnumeratingWithState:&v68 objects:v85 count:16];
    }
    while (v33);
  }

  v52 = (void *)[v58 copy];
  [(ATXAppDirectoryOrderingProvider *)v61 setCategories:v52];

  [(ATXAppDirectoryOrderingProvider *)v61 _writeCategoriesToDisk];
  [(ATXAppDirectoryOrderingProvider *)v61 _postUpdateNotificationWithReason:@"App installed"];
}

- (void)_updateCategoriesForUnhiddenApps:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(ATXAppDirectoryOrderingProvider *)self _updateMDMStatus];
  [(ATXAppDirectoryOrderingProvider *)self _updateScreenTimeMappingsForAppBundleIds:v4 withRetries:2];
  uint64_t v42 = objc_opt_new();
  uint64_t v41 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        id v11 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v12 = [(ATXAppDirectoryOrderingProvider *)self _genreIdFromBundleId:v10];
        [v41 setObject:v12 forKeyedSubscript:v10];

        uint64_t v13 = [(ATXAppDirectoryOrderingProvider *)self _screenTimeIdFromBundleId:v10];
        [v42 setObject:v13 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v7);
  }

  uint64_t v14 = (void *)[(NSArray *)self->_categories mutableCopy];
  uint64_t v15 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v5;
  uint64_t v39 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v47;
    unint64_t v16 = 0x1E4F4A000uLL;
    uint64_t v43 = v14;
    uint64_t v37 = v15;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v46 + 1) + 8 * j);
        uint64_t v19 = +[ATXAppDirectoryHierarchyNode effectiveCategoryIDForBundleID:v18 withScreenTimeMappings:v42 iTunesMappings:v41];
        if (v19 != 1008 && ([*(id *)(v16 + 3760) shouldCategoryNeverMergeWithParent:v19] & 1) == 0) {
          uint64_t v19 = [*(id *)(v16 + 3760) parentCategoryForCategory:v19];
        }
        if (![v14 count]) {
          goto LABEL_28;
        }
        uint64_t v40 = j;
        char v20 = 0;
        unint64_t v21 = 0;
        uint64_t v44 = v19;
        uint64_t v45 = v18;
        do
        {
          uint64_t v22 = [v14 objectAtIndexedSubscript:v21];
          if ([v22 categoryID] == v19)
          {
            uint64_t v23 = (void *)MEMORY[0x1E4F1CA48];
            uint64_t v24 = [v22 appBundleIDs];
            long long v25 = [v23 arrayWithArray:v24];

            if (([MEMORY[0x1E4F4AF00] isOffloadedForBundle:v18] & 1) != 0
              || [(NSSet *)self->_blacklistedBundleIds containsObject:v18])
            {
              long long v26 = __atxlog_handle_app_library();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                uint64_t v55 = "-[ATXAppDirectoryOrderingProvider _updateCategoriesForUnhiddenApps:]";
                __int16 v56 = 2112;
                uint64_t v57 = v18;
                _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "%s: Attempted to add un-hidden app: %@, but app is blacklisted or offloaded", buf, 0x16u);
              }
            }
            else
            {
              [v25 addObject:v18];
            }
            id v27 = objc_alloc(*(Class *)(v16 + 3760));
            uint64_t v28 = [v22 categoryID];
            [(ATXAppDirectoryOrderingProvider *)self _appBundleIDLaunchCountComparator];
            unint64_t v29 = v16;
            long long v31 = v30 = self;
            uint64_t v32 = [v25 sortedArrayUsingComparator:v31];
            uint64_t v33 = [v22 localizedName];
            uint64_t v34 = (void *)[v27 initWithCategoryID:v28 appBundleIDs:v32 localizedName:v33];

            self = v30;
            unint64_t v16 = v29;
            uint64_t v14 = v43;
            [v43 replaceObjectAtIndex:v21 withObject:v34];

            char v20 = 1;
            uint64_t v19 = v44;
            uint64_t v18 = v45;
          }

          ++v21;
        }
        while (v21 < [v14 count]);
        uint64_t v15 = v37;
        uint64_t j = v40;
        if ((v20 & 1) == 0) {
LABEL_28:
        }
          [v15 addObject:v18];
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v39);
  }

  uint64_t v35 = (void *)[v14 copy];
  [(ATXAppDirectoryOrderingProvider *)self setCategories:v35];

  [(ATXAppDirectoryOrderingProvider *)self _writeCategoriesToDisk];
  [(ATXAppDirectoryOrderingProvider *)self _postUpdateNotificationWithReason:@"App un-hidden"];
  if ([v15 count]) {
    [(ATXAppDirectoryOrderingProvider *)self _updateCategoriesForInstalledApps:v15];
  }
}

- (void)_updateCategoriesForUninstalledApps:(id)a3
{
}

- (void)_updateCategoriesForHiddenApps:(id)a3
{
}

- (void)_updateCategoriesForRemovedApps:(id)a3 uninstalled:(BOOL)a4 hidden:(BOOL)a5
{
  BOOL v24 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = (void *)[(NSArray *)self->_categories mutableCopy];
  if ([v7 count])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [v7 objectAtIndexedSubscript:v8];
      uint64_t v10 = (void *)MEMORY[0x1E4F1CA48];
      id v11 = [v9 appBundleIDs];
      uint64_t v12 = [v10 arrayWithArray:v11];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v13 = v6;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            [v12 removeObject:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v15);
      }

      id v18 = objc_alloc(MEMORY[0x1E4F4AEB0]);
      uint64_t v19 = [v9 categoryID];
      char v20 = [v9 localizedName];
      unint64_t v21 = (void *)[v18 initWithCategoryID:v19 appBundleIDs:v12 localizedName:v20];

      [v7 replaceObjectAtIndex:v8 withObject:v21];
      ++v8;
    }
    while (v8 < [v7 count]);
  }
  uint64_t v22 = (void *)[v7 copy];
  [(ATXAppDirectoryOrderingProvider *)self setCategories:v22];

  [(ATXAppDirectoryOrderingProvider *)self _writeCategoriesToDisk];
  if (v24) {
    uint64_t v23 = @"App hidden";
  }
  else {
    uint64_t v23 = @"App uninstalled";
  }
  [(ATXAppDirectoryOrderingProvider *)self _postUpdateNotificationWithReason:v23];
}

- (void)_updateCategoriesForDownweightedAppSet:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v20 description];
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v4;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Updating for downweighted apps: %@", buf, 0xCu);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = self->_categories;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = objc_opt_new();
        id v13 = [v11 appBundleIDs];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __74__ATXAppDirectoryOrderingProvider__updateCategoriesForDownweightedAppSet___block_invoke;
        v21[3] = &unk_1E68ACC70;
        id v22 = v20;
        id v14 = v12;
        id v23 = v14;
        [v13 enumerateObjectsUsingBlock:v21];

        if ([v14 count])
        {
          uint64_t v15 = [v11 appBundleIDs];
          uint64_t v16 = (void *)[v15 mutableCopy];

          v8 |= [(ATXAppDirectoryOrderingProvider *)self _shiftAppIndices:v14 category:v16];
          [v11 updateAppBundleIDs:v16];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);

    if (v8)
    {
      long long v17 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: There're differences. Refreshing cache for downeighted apps", buf, 2u);
      }

      [(ATXAppDirectoryOrderingProvider *)self _writeCategoriesToDisk];
      [(ATXAppDirectoryOrderingProvider *)self _postUpdateNotificationWithReason:@"Apps offloaded or disallowed changed"];
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v18 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: There's no handled downweighted apps", buf, 2u);
  }

LABEL_20:
}

uint64_t __74__ATXAppDirectoryOrderingProvider__updateCategoriesForDownweightedAppSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    return [v6 addIndex:a3];
  }
  return result;
}

- (void)_updateHiddenAppsPodWithNotification:(id)a3
{
  queue = self->_queue;
  id v7 = a3;
  dispatch_assert_queue_V2(queue);
  id v5 = [(ATXAppProtectionInfoProvider *)self->_appProtectionInfoProvider hiddenBundleIDs];
  uint64_t v6 = (void *)[v5 mutableCopy];
  [(ATXAppDirectoryOrderingProvider *)self _writeHiddenAppsToDisk:v6];

  [(ATXAppDirectoryOrderingProvider *)self _postHiddenAppsUpdateNotificationWithReason:v7];
}

- (id)_getInstallDateForUnhiddenApp:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F4AF00] registrationDateForBundle:v3];
  id v5 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: LS install date: %{public}@ for unhidden app: %@", (uint8_t *)&v8, 0x16u);
  }

  if (!v4)
  {
    uint64_t v6 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXAppDirectoryOrderingProvider _getInstallDateForUnhiddenApp:]();
    }

    id v4 = objc_opt_new();
  }

  return v4;
}

- (void)_updateRecentsForAppClipUsageEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 webClipBundleId];
  if (v5)
  {
    uint64_t v6 = [v4 launchDate];
    if (v6)
    {
      [(NSMutableDictionary *)self->_recentApps setObject:v6 forKeyedSubscript:v5];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1C9C8] now];
      [(NSMutableDictionary *)self->_recentApps setObject:v8 forKeyedSubscript:v5];
    }
    [(ATXAppDirectoryOrderingProvider *)self _writeRecentsToDisk];
  }
  else
  {
    id v7 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXAppDirectoryOrderingProvider _updateRecentsForAppClipUsageEvent:]();
    }
  }
}

- (void)_ensureCategoryConsistency
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(_ATXAppIconState *)self->_appIconState allAppsKnownToSpringBoard];
  id v4 = (void *)[v3 mutableCopy];

  if (v4)
  {
    id v5 = [(ATXAppProtectionInfoProvider *)self->_appProtectionInfoProvider hiddenBundleIDs];
    [v4 removeObjectsInArray:v5];

    long long v24 = v4;
    uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = self;
    id v7 = self->_categories;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v13 = objc_msgSend(v12, "appBundleIDs", v23);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v37 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v26 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * j);
                if ([v6 containsObject:v18]) {
                  [v6 removeObject:v18];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v37 count:16];
            }
            while (v15);
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v9);
    }

    id v4 = v24;
    if ([v6 count])
    {
      uint64_t v19 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [v6 count];
        unint64_t v21 = [v6 allObjects];
        *(_DWORD *)buf = 134218242;
        uint64_t v34 = v20;
        __int16 v35 = 2112;
        v36 = v21;
        _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Recategorizing %lu missed apps: %@", buf, 0x16u);
      }
      id v22 = [v6 allObjects];
      [(ATXAppDirectoryOrderingProvider *)v23 _updateCategoriesForInstalledApps:v22];
    }
  }
}

- (id)_categoryIdFromBundleId:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = [(ATXAppDirectoryOrderingProvider *)self _screenTimeIdFromBundleId:v5];

  return v6;
}

- (id)_genreIdFromBundleId:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  hardcodedAppCategoryMappings = self->_hardcodedAppCategoryMappings;
  if (!hardcodedAppCategoryMappings)
  {
    uint64_t v6 = +[ATXAppDirectoryOverrideList iTunesOverridesFromMobileAsset];
    id v7 = self->_hardcodedAppCategoryMappings;
    self->_hardcodedAppCategoryMappings = v6;

    hardcodedAppCategoryMappings = self->_hardcodedAppCategoryMappings;
  }
  uint64_t v8 = [(NSDictionary *)hardcodedAppCategoryMappings objectForKeyedSubscript:v4];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = v9;
    goto LABEL_29;
  }
  id v11 = [MEMORY[0x1E4F4AF00] recordForBundleId:v4];
  if (([v11 isArcadeApp] & 1) == 0)
  {
    uint64_t v12 = NSNumber;
    id v13 = [v11 iTunesMetadata];
    uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "genreIdentifier"));

    uint64_t v15 = [(_ATXAppInfoManager *)self->_infoManager appInfoForBundleId:v4];
    if (![v15 isEnterpriseApp])
    {
LABEL_16:
      if ([v14 integerValue])
      {
        id v18 = v14;
      }
      else
      {
        id v9 = [v15 genreId];

        if (![v9 integerValue])
        {
          uint64_t v19 = __atxlog_handle_app_library();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = 138412290;
            id v22 = v4;
            _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: no app info or genre ID for: %@", (uint8_t *)&v21, 0xCu);
          }

          uint64_t v10 = &unk_1F27F0150;
          goto LABEL_27;
        }
        id v18 = v9;
      }
      id v9 = v18;
      uint64_t v10 = v18;
LABEL_27:

      goto LABEL_28;
    }
    if ([(NSSet *)self->_managedAppIDs containsObject:v4])
    {
      uint64_t v16 = [(ATXAppDirectoryOrderingProvider *)self _issuingOrganizationForEnterpriseAppBundleID:v4 isMDM:1];
      if ([v16 isEqualToString:@"Apple Inc."])
      {
        long long v17 = __atxlog_handle_app_library();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          goto LABEL_14;
        }
        goto LABEL_15;
      }

      uint64_t v10 = &unk_1F27F0120;
    }
    else
    {
      uint64_t v16 = [(ATXAppDirectoryOrderingProvider *)self _issuingOrganizationForEnterpriseAppBundleID:v4 isMDM:0];
      if ([v16 isEqualToString:@"Apple Inc."])
      {
        long long v17 = __atxlog_handle_app_library();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
LABEL_14:
        }
          -[ATXAppDirectoryOrderingProvider _genreIdFromBundleId:]();
LABEL_15:

        goto LABEL_16;
      }

      uint64_t v10 = &unk_1F27F0138;
    }
    id v9 = v14;
    goto LABEL_27;
  }
  id v9 = 0;
  uint64_t v10 = &unk_1F27F0108;
LABEL_28:

LABEL_29:
  return v10;
}

- (id)_screenTimeIdFromBundleId:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Proactive is trying to categorize %@", buf, 0xCu);
  }

  hardcodedAppCategoryScreenTimeMappings = self->_hardcodedAppCategoryScreenTimeMappings;
  if (!hardcodedAppCategoryScreenTimeMappings)
  {
    id v7 = +[ATXAppDirectoryOverrideList ScreenTimeOverridesFromMobileAsset];
    uint64_t v8 = self->_hardcodedAppCategoryScreenTimeMappings;
    self->_hardcodedAppCategoryScreenTimeMappings = v7;

    hardcodedAppCategoryScreenTimeMappings = self->_hardcodedAppCategoryScreenTimeMappings;
  }
  id v9 = [(NSDictionary *)hardcodedAppCategoryScreenTimeMappings objectForKeyedSubscript:v4];
  if (v9)
  {
    uint64_t v10 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Providing a hardcoded value for %@", buf, 0xCu);
    }

    id v11 = v9;
    goto LABEL_41;
  }
  if ([MEMORY[0x1E4F4AF00] isArcadeAppForBundle:v4])
  {
    id v11 = &unk_1F27F0108;
    goto LABEL_41;
  }
  if (([(id)objc_opt_class() isStoreDemoMode] & 1) != 0
    || [(ATXAppDirectoryOrderingProvider *)self isMarketingDemoMode])
  {
    uint64_t v12 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Ignore Enterprise categories due to product demo mode", buf, 2u);
    }
    goto LABEL_15;
  }
  uint64_t v12 = [(_ATXAppInfoManager *)self->_infoManager appInfoForBundleId:v4];
  if (([v12 isEnterpriseApp] & 1) != 0
    || [MEMORY[0x1E4F4AF00] isEnterpriseAppForBundle:v4])
  {
    long long v25 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = [v12 isEnterpriseApp];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v26;
      _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Got %@ as enterprise. isEnterpriseFromDB: %{BOOL}u", buf, 0x12u);
    }

    if ([(NSSet *)self->_managedAppIDs containsObject:v4])
    {
      long long v27 = [(ATXAppDirectoryOrderingProvider *)self _issuingOrganizationForEnterpriseAppBundleID:v4 isMDM:1];
      char v28 = [v27 isEqualToString:@"Apple Inc."];

      if ((v28 & 1) == 0)
      {
        id v11 = &unk_1F27F0120;
LABEL_45:

        goto LABEL_41;
      }
    }
    else
    {
      long long v29 = [(ATXAppDirectoryOrderingProvider *)self _issuingOrganizationForEnterpriseAppBundleID:v4 isMDM:0];
      int v30 = [v29 isEqualToString:@"Apple Inc."];

      if (!v30)
      {
        id v11 = &unk_1F27F0138;
        goto LABEL_45;
      }
    }
    long long v31 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      -[ATXAppDirectoryOrderingProvider _genreIdFromBundleId:]();
    }
  }
LABEL_15:

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy__8;
  long long v46 = __Block_byref_object_dispose__8;
  id v47 = 0;
  id v13 = [(NSDictionary *)self->_appScreenTimeCategoryMappings objectForKeyedSubscript:v4];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    *(void *)&long long v41 = 0;
    *((void *)&v41 + 1) = &v41;
    uint64_t v42 = 0x2020000000;
    char v43 = 1;
    uint64_t v19 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v39 = 138412290;
      id v40 = v4;
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Requesting CTCategory for app: %@", v39, 0xCu);
    }

    uint64_t v20 = (void *)MEMORY[0x1E4F580B0];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __61__ATXAppDirectoryOrderingProvider__screenTimeIdFromBundleId___block_invoke;
    v34[3] = &unk_1E68ACC98;
    uint64_t v37 = &v41;
    id v21 = v4;
    id v35 = v21;
    uint64_t v38 = buf;
    id v22 = v18;
    v36 = v22;
    [v20 categoryForBundleID:v21 withCompletionHandler:v34];
    long long v17 = v22;
    dispatch_time_t v23 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v17, v23);

    if (!*(void *)(*(void *)&buf[8] + 40))
    {
      if (*(unsigned char *)(*((void *)&v41 + 1) + 24))
      {
        long long v24 = __atxlog_handle_app_library();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
          -[ATXAppDirectoryOrderingProvider _screenTimeIdFromBundleId:]();
        }
      }
      else
      {
        long long v24 = __atxlog_handle_app_library();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v39 = 138412290;
          id v40 = v21;
          _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: CTCategories provided nil when requesting categorization for bundle %@", v39, 0xCu);
        }
      }

      long long v32 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = &unk_1F27F0168;
    }
    _Block_object_dispose(&v41, 8);
  }
  else
  {
    uint64_t v15 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v41) = 138412290;
      *(void *)((char *)&v41 + 4) = v4;
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Using a cached CTCategory response rather than re-requesting for %@", (uint8_t *)&v41, 0xCu);
    }

    uint64_t v16 = [(NSDictionary *)self->_appScreenTimeCategoryMappings objectForKeyedSubscript:v4];
    long long v17 = *(NSObject **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v16;
  }

  id v11 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

LABEL_41:
  return v11;
}

void __61__ATXAppDirectoryOrderingProvider__screenTimeIdFromBundleId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  if (v6)
  {
    id v7 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__ATXAppDirectoryOrderingProvider__screenTimeIdFromBundleId___block_invoke_cold_1();
    }
  }
  if (v5)
  {
    uint64_t v8 = [v5 identifier];
    id v9 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v15 = 138412546;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Got CTCategory: %@ for app: %@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F4AEB0], "screenTimeCategoryIDForCategoryIdentifier:", v8));
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v8 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = *(NSObject **)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v14;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Got CTCategory: nil for app: %@", (uint8_t *)&v15, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_updateAppLaunchCounts
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(_ATXAppIconState *)self->_appIconState allAppsKnownToSpringBoard];
  if (v3)
  {
    long long v27 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:0];
    char v28 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = NSNumber;
          uint64_t v39 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
          [v27 totalLaunchesForBundleIds:v10];
          uint64_t v11 = objc_msgSend(v9, "numberWithDouble:");
          [v28 addObject:v11];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v6);
    }

    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v4];
    appLaunchCounts = self->_appLaunchCounts;
    self->_appLaunchCounts = v12;

    int v26 = self;
    BOOL v14 = [(_ATXAppLaunchHistogramManager *)self->_appLaunchHistogramManager histogramForLaunchType:93];
    int v15 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = v4;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = NSNumber;
          uint64_t v37 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
          [v14 totalLaunchesForBundleIds:v22];
          dispatch_time_t v23 = objc_msgSend(v21, "numberWithDouble:");
          [v15 addObject:v23];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v18);
    }

    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v16];
    libraryAppLaunchCounts = v26->_libraryAppLaunchCounts;
    v26->_libraryAppLaunchCounts = (NSDictionary *)v24;
  }
}

- (id)_combinedLaunchCountForBundleId:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = NSNumber;
  uint64_t v7 = [(NSDictionary *)self->_appLaunchCounts objectForKeyedSubscript:v5];
  [v7 doubleValue];
  double v9 = v8;
  uint64_t v10 = [(NSDictionary *)self->_libraryAppLaunchCounts objectForKeyedSubscript:v5];

  [v10 doubleValue];
  uint64_t v12 = [v6 numberWithDouble:v9 + v11 * 10.0];

  return v12;
}

- (id)_totalLaunchCountsForCategory:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v4, "appBundleIDs", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = [(NSDictionary *)self->_appLaunchCounts objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v11 doubleValue];
        double v9 = v9 + v12;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  id v13 = [NSNumber numberWithDouble:v9];

  return v13;
}

- (id)_totalLibraryLaunchCountsForCategory:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v4, "appBundleIDs", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = [(NSDictionary *)self->_libraryAppLaunchCounts objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v11 doubleValue];
        double v9 = v9 + v12;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  id v13 = [NSNumber numberWithDouble:v9];

  return v13;
}

- (id)_totalCombinedLaunchCountsForCategory:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v4, "appBundleIDs", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = [(ATXAppDirectoryOrderingProvider *)self _combinedLaunchCountForBundleId:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v11 doubleValue];
        double v9 = v9 + v12;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  id v13 = [NSNumber numberWithDouble:v9];

  return v13;
}

- (void)_updateMissingInstalledApps
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Starting to update missing installed apps", (uint8_t *)&v22, 2u);
  }

  id v4 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Starting to update missing installed apps", (uint8_t *)&v22, 2u);
  }

  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v6 = [(_ATXAppInfoManager *)self->_infoManager allAppsWithInstallDate];
  uint64_t v7 = (void *)[v6 mutableCopy];
  uint64_t v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  uint64_t v10 = v9;

  uint64_t v11 = [(_ATXAppIconState *)self->_appIconState allAppsKnownToSpringBoard];
  double v12 = (void *)v11;
  id v13 = (void *)MEMORY[0x1E4F1CBF0];
  if (v11) {
    id v13 = (void *)v11;
  }
  id v14 = v13;

  long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v14];
  id v16 = +[_ATXAppInstallMonitor removeIntersectionBetweenSet:v15 set:v10];
  long long v17 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    dispatch_time_t v23 = v15;
    _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Found missing installed apps:\n%@", (uint8_t *)&v22, 0xCu);
  }

  long long v18 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    dispatch_time_t v23 = v15;
    _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Found missing installed apps:\n%@", (uint8_t *)&v22, 0xCu);
  }

  if ([v15 count])
  {
    LOBYTE(v22) = 0;
    if (CFPreferencesGetAppBooleanValue(@"crystalMigration", (CFStringRef)*MEMORY[0x1E4F4B688], (Boolean *)&v22)) {
      id v19 = +[_ATXAppInstallMonitor newPreInstalledAppSet];
    }
    else {
      id v19 = 0;
    }
    uint64_t v20 = [v15 allObjects];
    id v21 = +[_ATXAppInstallMonitor appInfoDictWithBackDate:0 assetData:0 newPreInstalledAppSet:v19 isFromNotification:0 newApps:v20];

    [(_ATXAppInfoManager *)self->_infoManager addInstallForBundleInfoMap:v21];
  }
}

- (id)_categoryComparator
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__ATXAppDirectoryOrderingProvider__categoryComparator__block_invoke;
  aBlock[3] = &unk_1E68ACCC0;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  return v3;
}

uint64_t __54__ATXAppDirectoryOrderingProvider__categoryComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) _totalCombinedLaunchCountsForCategory:v6];
  uint64_t v8 = [*(id *)(a1 + 32) _totalCombinedLaunchCountsForCategory:v5];
  uint64_t v9 = [v7 compare:v8];

  if (!v9)
  {
    unint64_t v10 = [v5 categoryID];
    if (v10 <= [v6 categoryID])
    {
      unint64_t v11 = [v5 categoryID];
      if (v11 >= [v6 categoryID]) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = -1;
      }
    }
    else
    {
      uint64_t v9 = 1;
    }
  }

  return v9;
}

- (id)_appBundleIDTotalLaunchComparator
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__ATXAppDirectoryOrderingProvider__appBundleIDTotalLaunchComparator__block_invoke;
  aBlock[3] = &unk_1E68ACBF8;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  return v3;
}

uint64_t __68__ATXAppDirectoryOrderingProvider__appBundleIDTotalLaunchComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) _combinedLaunchCountForBundleId:v5];
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  else {
    uint64_t v9 = &unk_1F27F0150;
  }
  id v10 = v9;

  uint64_t v11 = [*(id *)(a1 + 32) _combinedLaunchCountForBundleId:v6];
  double v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = &unk_1F27F0150;
  }
  id v14 = v13;

  uint64_t v15 = [v14 compare:v10];
  if (!v15) {
    uint64_t v15 = [v5 compare:v6 options:1];
  }

  return v15;
}

- (id)_appBundleIDRecencyComparatorForLastLaunchDates:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__ATXAppDirectoryOrderingProvider__appBundleIDRecencyComparatorForLastLaunchDates___block_invoke;
  aBlock[3] = &unk_1E68ACBF8;
  id v9 = v4;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);

  return v6;
}

uint64_t __83__ATXAppDirectoryOrderingProvider__appBundleIDRecencyComparatorForLastLaunchDates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  uint64_t v9 = [v7 compare:v8];

  if (!v9) {
    uint64_t v9 = [v5 compare:v6 options:1];
  }

  return v9;
}

- (id)_appBundleIDLaunchCountComparator
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_appLaunchCounts) {
    [(ATXAppDirectoryOrderingProvider *)self _updateAppLaunchCounts];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__ATXAppDirectoryOrderingProvider__appBundleIDLaunchCountComparator__block_invoke;
  aBlock[3] = &unk_1E68ACBF8;
  void aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  return v3;
}

uint64_t __68__ATXAppDirectoryOrderingProvider__appBundleIDLaunchCountComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v5];
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  else {
    uint64_t v9 = &unk_1F27F0150;
  }
  id v10 = v9;

  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v6];
  double v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = &unk_1F27F0150;
  }
  id v14 = v13;

  uint64_t v15 = [v14 compare:v10];
  if (!v15) {
    uint64_t v15 = [v5 compare:v6 options:1];
  }

  return v15;
}

- (void)_updateScreenTimeMappingsForAppBundleIds:(id)a3 withRetries:(unint64_t)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  context = (void *)MEMORY[0x1D25F6CC0]();
  val = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  __int16 v56 = __Block_byref_object_copy__8;
  uint64_t v57 = __Block_byref_object_dispose__8;
  id v58 = 0;
  uint64_t v49 = 0;
  long long v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 1;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v60 = v38;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Request CTCategories for apps %@", buf, 0xCu);
  }

  uint64_t v8 = (void *)MEMORY[0x1E4F580B0];
  uint64_t v9 = *MEMORY[0x1E4F58090];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke;
  v45[3] = &unk_1E68ACCE8;
  id v47 = &v53;
  uint64_t v48 = &v49;
  id v10 = v6;
  long long v46 = v10;
  [v8 categoryForBundleIdentifiers:v38 platform:v9 withCompletionHandler:v45];
  uint64_t v11 = v10;
  dispatch_time_t v12 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v11, v12);
  long long v35 = v11;

  if (*((unsigned char *)v50 + 24))
  {
    id v13 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[ATXAppDirectoryOrderingProvider _updateScreenTimeMappingsForAppBundleIds:withRetries:]();
    }

    if (*((unsigned char *)v50 + 24)) {
      goto LABEL_9;
    }
  }
  id v14 = v54;
  if (!v54[5])
  {
LABEL_9:
    objc_initWeak((id *)buf, val);
    uint64_t v15 = (void *)MEMORY[0x1E4F4B678];
    id v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "now", v35, context);
    long long v17 = [v16 dateByAddingTimeInterval:1200.0];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke_215;
    v43[3] = &unk_1E68ACD38;
    objc_copyWeak(v44, (id *)buf);
    v44[1] = (id)a4;
    uint64_t v18 = [v15 fireAtDate:v17 block:v43];
    currentTimer = val->_currentTimer;
    val->_currentTimer = (ATXTimer *)v18;

    objc_destroyWeak(v44);
    objc_destroyWeak((id *)buf);
    id v14 = v54;
  }
  else
  {
    val->_currentCacheDueForRefresh = 0;
  }
  if (v14[5])
  {
    uint64_t v20 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = (void *)v54[5];
      *(_DWORD *)buf = 138412290;
      id v60 = v21;
      _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Got %@", buf, 0xCu);
    }

    int v22 = [(id)v54[5] allKeys];
    dispatch_time_t v23 = objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v63 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          long long v29 = objc_msgSend((id)v54[5], "objectForKeyedSubscript:", v28, v35);
          long long v30 = [v29 identifier];

          long long v31 = __atxlog_handle_app_library();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v60 = v30;
            __int16 v61 = 2112;
            uint64_t v62 = v28;
            _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Got CTCategory: %@ for app: %@", buf, 0x16u);
          }

          long long v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F4AEB0], "screenTimeCategoryIDForCategoryIdentifier:", v30));
          [v23 addObject:v32];
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v63 count:16];
      }
      while (v25);
    }

    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v23 forKeys:v24];
    appScreenTimeCategoryMappings = val->_appScreenTimeCategoryMappings;
    val->_appScreenTimeCategoryMappings = (NSDictionary *)v33;
  }
  else
  {
    uint64_t v24 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Got nil CTCategory response", buf, 2u);
    }
  }

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
}

void __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  if (v7)
  {
    uint64_t v8 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __61__ATXAppDirectoryOrderingProvider__screenTimeIdFromBundleId___block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke_215(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = __atxlog_handle_app_library();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Retrying category retrieval...", buf, 2u);
      }

      *((unsigned char *)WeakRetained + 272) = 1;
      id v6 = *((void *)WeakRetained + 3);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke_216;
      v8[3] = &unk_1E68ACD10;
      uint64_t v7 = *(void *)(a1 + 40);
      void v8[4] = WeakRetained;
      v8[5] = v7;
      dispatch_async(v6, v8);
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke_215_cold_1();
      }
    }
  }
}

uint64_t __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke_216(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCategoriesWithRetries:*(void *)(a1 + 40) - 1];
}

- (void)_updateMDMStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(ATXAppDirectoryOrderingProvider *)self _getManagedAppIDs];
  managedAppIDs = self->_managedAppIDs;
  self->_managedAppIDs = v3;

  self->_managingOrganizationName = [(ATXAppDirectoryOrderingProvider *)self _getMDMOrgName];
  MEMORY[0x1F41817F8]();
}

- (id)_getManagedAppIDs
{
  BOOL v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
  id v4 = [v3 managedAppIDs];
  id v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)_getMDMOrgName
{
  BOOL v2 = [MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v3 = [v2 managingOrganizationInformation];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F74270]];

  return v4;
}

- (void)_updateMDMAndEnterpriseCategories
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_4();
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "%@: Got new MDM and enterprise apps:\n%@", v7, 0x16u);
}

- (void)_splitEnterpriseCategoryWithAppsInCategory:(id)a3 appsByCategoryName:(id)a4 isMDMAppCategory:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_new();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __114__ATXAppDirectoryOrderingProvider__splitEnterpriseCategoryWithAppsInCategory_appsByCategoryName_isMDMAppCategory___block_invoke;
  v29[3] = &unk_1E68ACD60;
  BOOL v31 = v5;
  v29[4] = self;
  id v11 = v10;
  id v30 = v11;
  [v8 enumerateObjectsUsingBlock:v29];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  dispatch_time_t v23 = v11;
  uint64_t v24 = v8;
  dispatch_time_t v12 = [v8 objectsAtIndexes:v11];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    BOOL v16 = !v5;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v19 = [(ATXAppDirectoryOrderingProvider *)self _issuingOrganizationForEnterpriseAppBundleID:v18 isMDM:v16];
        uint64_t v20 = [v9 objectForKeyedSubscript:v19];

        if (!v20)
        {
          id v21 = objc_opt_new();
          [v9 setObject:v21 forKeyedSubscript:v19];
        }
        int v22 = [v9 objectForKeyedSubscript:v19];
        [v22 addObject:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v14);
  }

  [v24 removeObjectsAtIndexes:v23];
}

void __114__ATXAppDirectoryOrderingProvider__splitEnterpriseCategoryWithAppsInCategory_appsByCategoryName_isMDMAppCategory___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  int v6 = *(unsigned __int8 *)(a1 + 48);
  id v8 = v5;
  int v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 216), "containsObject:");
  if (v6)
  {
    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v7) {
LABEL_3:
  }
    [*(id *)(a1 + 40) addIndex:a3];
LABEL_4:
}

- (void)_updateMDMCategoryName
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(ATXAppDirectoryOrderingProvider *)self _getMDMOrgName];
  managingOrganizationName = self->_managingOrganizationName;
  self->_managingOrganizationName = v3;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = self->_categories;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v10, "categoryID", (void)v23) == 6)
        {
          uint64_t v13 = [v10 localizedName];
          int v14 = [v13 isEqualToString:self->_managingOrganizationName];

          uint64_t v15 = __atxlog_handle_app_library();
          BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if (v14)
          {
            if (v16)
            {
              long long v17 = (objc_class *)objc_opt_class();
              uint64_t v18 = NSStringFromClass(v17);
              *(_DWORD *)buf = 138412290;
              long long v28 = v18;
              _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "%@: MDM enterprise category name doesn't need any change", buf, 0xCu);
            }
          }
          else
          {
            if (v16)
            {
              id v19 = (objc_class *)objc_opt_class();
              uint64_t v20 = NSStringFromClass(v19);
              id v21 = [v10 localizedName];
              int v22 = self->_managingOrganizationName;
              *(_DWORD *)buf = 138412802;
              long long v28 = v20;
              __int16 v29 = 2112;
              id v30 = v21;
              __int16 v31 = 2112;
              long long v32 = v22;
              _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "%@: MDM enterprise category updates its name from %@ to %@", buf, 0x20u);
            }
            [v10 updateCategoryLocalizedNameWithName:self->_managingOrganizationName];
            [(ATXAppDirectoryOrderingProvider *)self _writeCategoriesToDisk];
            [(ATXAppDirectoryOrderingProvider *)self _postUpdateNotificationWithReason:@"MDM category name changed"];
          }
          goto LABEL_18;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  __atxlog_handle_app_library();
  id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (objc_class *)objc_opt_class();
    dispatch_time_t v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138412290;
    long long v28 = v12;
    _os_log_impl(&dword_1D0FA3000, &v5->super, OS_LOG_TYPE_DEFAULT, "%@: Found NO MDM enterprise category changes", buf, 0xCu);
  }
LABEL_18:
}

- (id)_issuingOrganizationForEnterpriseAppBundleID:(id)a3 isMDM:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    managingOrganizationName = (__CFString *)self->_managingOrganizationName;
    if (!managingOrganizationName) {
      managingOrganizationName = @"kATXMDM";
    }
    uint64_t v8 = managingOrganizationName;
  }
  else if ([MEMORY[0x1E4F4AF00] isBetaAppForBundle:v6])
  {
    uint64_t v8 = @"TestFlight";
  }
  else
  {
    id v9 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ATXAppDirectoryOrderingProvider _issuingOrganizationForEnterpriseAppBundleID:isMDM:]();
    }

    uint64_t v8 = @"kATXEnterprise";
    if (([MEMORY[0x1E4F4AF00] isUPPValidatedForBundle:v6] & 1) == 0)
    {
      id v10 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[ATXAppDirectoryOrderingProvider _issuingOrganizationForEnterpriseAppBundleID:isMDM:]();
      }

      id v11 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v6 allowPlaceholder:1 error:0];
      dispatch_time_t v12 = [v11 signerOrganization];

      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = @"kATXEnterprise";
      }
      uint64_t v8 = v13;
    }
  }

  return v8;
}

- (id)_groupEnterpriseAppsByIssuerWithBundleIDs:(id)a3 isMDM:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        int v14 = -[ATXAppDirectoryOrderingProvider _issuingOrganizationForEnterpriseAppBundleID:isMDM:](self, "_issuingOrganizationForEnterpriseAppBundleID:isMDM:", v13, v4, (void)v19);
        uint64_t v15 = [v7 objectForKeyedSubscript:v14];

        if (!v15)
        {
          BOOL v16 = objc_opt_new();
          [v7 setObject:v16 forKeyedSubscript:v14];
        }
        long long v17 = [v7 objectForKeyedSubscript:v14];
        [v17 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_mdmEnterpriseCategoriesForApps:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ATXAppDirectoryOrderingProvider *)self _groupEnterpriseAppsByIssuerWithBundleIDs:a3 isMDM:1];
  if ((unint64_t)[v3 count] >= 2)
  {
    BOOL v4 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[ATXAppDirectoryOrderingProvider _mdmEnterpriseCategoriesForApps:](v3, v4);
    }
  }
  memset(v14, 0, sizeof(v14));
  id v5 = v3;
  if ([v5 countByEnumeratingWithState:v14 objects:v15 count:16])
  {
    uint64_t v6 = **((void **)&v14[0] + 1);
    int v7 = objc_msgSend(**((id **)&v14[0] + 1), "isEqualToString:", @"kATXMDM", *(void *)&v14[0]);
    id v8 = objc_alloc(MEMORY[0x1E4F4AEB0]);
    uint64_t v9 = [v5 objectForKeyedSubscript:v6];
    uint64_t v10 = (void *)[v9 copy];
    if (v7) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v6;
    }
    dispatch_time_t v12 = (void *)[v8 initWithCategoryID:6 appBundleIDs:v10 localizedName:v11];
  }
  else
  {
    dispatch_time_t v12 = 0;
  }

  return v12;
}

- (id)_getEnterpriseCategoriesForApps:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v19 = v4;
  uint64_t v6 = [(ATXAppDirectoryOrderingProvider *)self _groupEnterpriseAppsByIssuerWithBundleIDs:v4 isMDM:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v12 = [v11 isEqualToString:@"kATXEnterprise"];
        id v13 = objc_alloc(MEMORY[0x1E4F4AEB0]);
        int v14 = [v6 objectForKeyedSubscript:v11];
        uint64_t v15 = (void *)[v14 copy];
        if (v12) {
          uint64_t v16 = 0;
        }
        else {
          uint64_t v16 = v11;
        }
        long long v17 = (void *)[v13 initWithCategoryID:1 appBundleIDs:v15 localizedName:v16];

        [v5 addObject:v17];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_shiftAppIndices:(id)a3 category:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7)
  {
    uint64_t v8 = [v6 objectsAtIndexes:v5];
    [v6 removeObjectsAtIndexes:v5];
    [v6 addObjectsFromArray:v8];
  }
  return v7 != 0;
}

- (void)_reorderAndHideDupesForAppsInCategory:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __73__ATXAppDirectoryOrderingProvider__reorderAndHideDupesForAppsInCategory___block_invoke;
  int v14 = &unk_1E68ACD88;
  uint64_t v15 = self;
  id v16 = v5;
  id v17 = v6;
  id v18 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:&v11];
  -[ATXAppDirectoryOrderingProvider _shiftAppIndices:category:](self, "_shiftAppIndices:category:", v10, v4, v11, v12, v13, v14, v15);
  [(ATXAppDirectoryOrderingProvider *)self _shiftAppIndices:v8 category:v4];
  [(ATXAppDirectoryOrderingProvider *)self _shiftAppIndices:v9 category:v4];
}

void __73__ATXAppDirectoryOrderingProvider__reorderAndHideDupesForAppsInCategory___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v10 = v5;
  if (a3)
  {
    int v6 = [*(id *)(*(void *)(a1 + 32) + 208) containsObject:v5];
    id v5 = v10;
    if (v6)
    {
      uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v10];
      [v7 doubleValue];
      double v9 = v8;

      id v5 = v10;
      if (v9 < 5.0)
      {
        [*(id *)(a1 + 40) addIndex:a3];
        id v5 = v10;
      }
    }
  }
  if ([MEMORY[0x1E4F4AF00] isOffloadedForBundle:v5]) {
    [*(id *)(a1 + 48) addIndex:a3];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 136) containsObject:v10]) {
    [*(id *)(a1 + 56) addIndex:a3];
  }
}

- (id)_computeCategoriesWithRetries:(unint64_t)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  appLaunchCounts = self->_appLaunchCounts;
  if (!appLaunchCounts)
  {
    [(ATXAppDirectoryOrderingProvider *)self _updateAppLaunchCounts];
    appLaunchCounts = self->_appLaunchCounts;
  }
  int v6 = [(NSDictionary *)appLaunchCounts allKeys];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [(ATXAppProtectionInfoProvider *)self->_appProtectionInfoProvider hiddenBundleIDs];
  double v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
  }
  [v7 removeObjectsInArray:v10];

  [(ATXAppDirectoryOrderingProvider *)self _updateScreenTimeMappingsForAppBundleIds:v7 withRetries:a3];
  uint64_t v11 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ATXAppDirectoryOrderingProvider _computeCategoriesWithRetries:]((uint64_t)self, v11);
  }

  uint64_t v12 = objc_opt_new();
  long long v74 = objc_opt_new();
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  obuint64_t j = v7;
  uint64_t v13 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v89 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v88 + 1) + 8 * i);
        id v18 = (void *)MEMORY[0x1D25F6CC0]();
        long long v19 = [(ATXAppDirectoryOrderingProvider *)self _genreIdFromBundleId:v17];
        [v74 setObject:v19 forKeyedSubscript:v17];

        long long v20 = [(ATXAppDirectoryOrderingProvider *)self _screenTimeIdFromBundleId:v17];
        [v12 setObject:v20 forKeyedSubscript:v17];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
    }
    while (v14);
  }

  if ([obj count])
  {
    long long v21 = +[ATXAppDirectoryHierarchyNode dynamicCategoriesForAppBundleIDs:obj screenTimeMappings:v12 iTunesMappings:v74];
  }
  else
  {
    long long v21 = objc_opt_new();
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v22 = v21;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v84 objects:v94 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v85 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = [v22 objectForKeyedSubscript:*(void *)(*((void *)&v84 + 1) + 8 * j)];
        long long v28 = [(ATXAppDirectoryOrderingProvider *)self _appBundleIDTotalLaunchComparator];
        [v27 sortUsingComparator:v28];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v84 objects:v94 count:16];
    }
    while (v24);
  }
  long long v72 = v12;

  __int16 v29 = [(_ATXAppIconState *)self->_appIconState nonFolderAppSetOnPages];
  id v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_ATXAppIconState getFirstVisiblePageIndex](self->_appIconState, "getFirstVisiblePageIndex"));
  __int16 v31 = [v29 objectForKeyedSubscript:v30];
  long long v32 = v31;
  if (v31) {
    id v33 = v31;
  }
  else {
    id v33 = (id)objc_opt_new();
  }
  uint64_t v34 = v33;

  long long v35 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    -[ATXAppDirectoryOrderingProvider _computeCategoriesWithRetries:]((id *)&self->_appIconState, v35);
  }

  long long v36 = [(_ATXAppIconState *)self->_appIconState allDockedApps];
  uint64_t v37 = v36;
  id v38 = v72;
  if (v36) {
    id v39 = v36;
  }
  else {
    id v39 = (id)objc_opt_new();
  }
  id v40 = v39;

  long long v68 = v40;
  long long v69 = v34;
  long long v41 = [v34 setByAddingObjectsFromSet:v40];
  homescreenAppsToDedupeAgainst = self->_homescreenAppsToDedupeAgainst;
  self->_homescreenAppsToDedupeAgainst = v41;

  char v43 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    [(ATXAppDirectoryOrderingProvider *)(uint64_t *)&self->_homescreenAppsToDedupeAgainst _computeCategoriesWithRetries:v44];
  }

  uint64_t v45 = objc_opt_new();
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v46 = v22;
  uint64_t v75 = [v46 countByEnumeratingWithState:&v80 objects:v93 count:16];
  if (v75)
  {
    uint64_t v47 = *(void *)v81;
    uint64_t v70 = *(void *)v81;
    id v71 = v46;
    do
    {
      for (uint64_t k = 0; k != v75; ++k)
      {
        if (*(void *)v81 != v47) {
          objc_enumerationMutation(v46);
        }
        uint64_t v49 = *(void **)(*((void *)&v80 + 1) + 8 * k);
        if ([v49 unsignedIntegerValue] == 1)
        {
          long long v50 = [v46 objectForKeyedSubscript:v49];
          uint64_t v51 = [(ATXAppDirectoryOrderingProvider *)self _getEnterpriseCategoriesForApps:v50];

          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id v52 = v51;
          uint64_t v53 = [v52 countByEnumeratingWithState:&v76 objects:v92 count:16];
          if (v53)
          {
            uint64_t v54 = v53;
            uint64_t v55 = *(void *)v77;
            do
            {
              for (uint64_t m = 0; m != v54; ++m)
              {
                if (*(void *)v77 != v55) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v57 = *(void **)(*((void *)&v76 + 1) + 8 * m);
                id v58 = [v57 appBundleIDs];
                uint64_t v59 = (void *)[v58 mutableCopy];

                [(ATXAppDirectoryOrderingProvider *)self _reorderAndHideDupesForAppsInCategory:v59];
                [v57 updateAppBundleIDs:v59];
                [v45 addObject:v57];
              }
              uint64_t v54 = [v52 countByEnumeratingWithState:&v76 objects:v92 count:16];
            }
            while (v54);
            id v60 = v52;
            id v46 = v71;
            id v38 = v72;
            uint64_t v47 = v70;
          }
          else
          {
            id v60 = v52;
          }
        }
        else
        {
          uint64_t v61 = [v49 unsignedIntegerValue];
          uint64_t v62 = [v46 objectForKeyedSubscript:v49];
          if (v61 == 6)
          {
            id v60 = [(ATXAppDirectoryOrderingProvider *)self _mdmEnterpriseCategoriesForApps:v62];

            if (!v60) {
              goto LABEL_55;
            }
            id v63 = [v60 appBundleIDs];
            id v52 = (id)[v63 mutableCopy];

            [(ATXAppDirectoryOrderingProvider *)self _reorderAndHideDupesForAppsInCategory:v52];
            [v60 updateAppBundleIDs:v52];
            [v45 addObject:v60];
          }
          else
          {
            [(ATXAppDirectoryOrderingProvider *)self _reorderAndHideDupesForAppsInCategory:v62];

            id v64 = objc_alloc(MEMORY[0x1E4F4AEB0]);
            uint64_t v65 = [v49 unsignedIntegerValue];
            id v60 = [v46 objectForKeyedSubscript:v49];
            id v52 = (id)[v60 copy];
            long long v66 = (void *)[v64 initWithCategoryID:v65 appBundleIDs:v52];
            [v45 addObject:v66];
          }
        }

LABEL_55:
      }
      uint64_t v75 = [v46 countByEnumeratingWithState:&v80 objects:v93 count:16];
    }
    while (v75);
  }

  return v45;
}

- (id)_sortCategories:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  if (!self->_appLaunchCounts) {
    [(ATXAppDirectoryOrderingProvider *)self _updateAppLaunchCounts];
  }
  int v6 = [(ATXAppDirectoryOrderingProvider *)self _categoryComparator];
  uint64_t v7 = [v5 sortedArrayUsingComparator:v6];

  return v7;
}

- (void)_postProcessCategories:(id)a3 withReply:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (!v8)
  {

    uint64_t v11 = 0;
    uint64_t v10 = 0;
LABEL_28:
    __int16 v29 = v30;
    (*((void (**)(id, id, void))v30 + 2))(v30, v7, 0);
    goto LABEL_29;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v39;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v39 != v12) {
        objc_enumerationMutation(v7);
      }
      uint64_t v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      if (objc_msgSend(v14, "categoryID", v30) == 6014 || objc_msgSend(v14, "categoryID") == 1000)
      {
        id v15 = v14;

        uint64_t v11 = v15;
      }
      if ([v14 categoryID] == 2)
      {
        id v16 = v14;

        uint64_t v10 = v16;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
  }
  while (v9);

  if (!v11 || !v10) {
    goto LABEL_28;
  }
  id v33 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v7;
  uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v32 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        if ([v20 categoryID] == 6014 || objc_msgSend(v20, "categoryID") == 1000)
        {
          id v21 = objc_alloc(MEMORY[0x1E4F4AEB0]);
          id v22 = v7;
          uint64_t v23 = [v20 categoryID];
          uint64_t v24 = [v20 appBundleIDs];
          uint64_t v25 = [v10 appBundleIDs];
          long long v26 = [v24 arrayByAddingObjectsFromArray:v25];
          uint64_t v27 = v23;
          id v7 = v22;
          long long v28 = (void *)[v21 initWithCategoryID:v27 appBundleIDs:v26];
          [v33 addObject:v28];
        }
        else
        {
          [v33 addObject:v20];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v18);
  }

  __int16 v29 = v30;
  (*((void (**)(id, void *, void))v30 + 2))(v30, v33, 0);

LABEL_29:
}

- (void)categoriesWithReply:(id)a3
{
  id v4 = a3;
  id v5 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Scheduling categorization processing on the server's queue", buf, 2u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ATXAppDirectoryOrderingProvider_categoriesWithReply___block_invoke;
  v8[3] = &unk_1E68AB528;
  void v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v8);
  dispatch_async((dispatch_queue_t)self->_queue, v7);
}

void __55__ATXAppDirectoryOrderingProvider_categoriesWithReply___block_invoke(uint64_t a1)
{
  BOOL v2 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Will process categorization from server", buf, 2u);
  }

  [*(id *)(a1 + 32) _postProcessCategories:*(void *)(*(void *)(a1 + 32) + 280) withReply:*(void *)(a1 + 40)];
  uint64_t v3 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Did process categorization from server", v4, 2u);
  }
}

- (void)topAppsWithMaxNumberOfResults:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ATXAppDirectoryOrderingProvider_topAppsWithMaxNumberOfResults_reply___block_invoke;
  block[3] = &unk_1E68ACDB0;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __71__ATXAppDirectoryOrderingProvider_topAppsWithMaxNumberOfResults_reply___block_invoke(void *a1)
{
  BOOL v2 = *(void **)(a1[4] + 32);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4AF40] clientForConsumerType:15];
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    BOOL v2 = *(void **)(a1[4] + 32);
  }
  if (a1[6] >= 0x7FFFFFFFuLL) {
    uint64_t v6 = 0x7FFFFFFFLL;
  }
  else {
    uint64_t v6 = a1[6];
  }
  id v10 = [v2 appPredictionsForConsumerSubType:35 limit:v6];
  dispatch_block_t v7 = [v10 error];

  uint64_t v8 = a1[5];
  if (v7)
  {
    id v9 = [v10 error];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    id v9 = [v10 predictedApps];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
}

- (void)appLaunchDatesWithReply:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ATXAppDirectoryOrderingProvider_appLaunchDatesWithReply___block_invoke;
  v7[3] = &unk_1E68AB528;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __59__ATXAppDirectoryOrderingProvider_appLaunchDatesWithReply___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 40) allApps];
  uint64_t v3 = [v2 allObjects];

  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        unint64_t v11 = (void *)MEMORY[0x1D25F6CC0](v6);
        uint64_t v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "lastLaunchDateForBundleId:", v10, (void)v14);
        if (v12)
        {
          [v4 setObject:v12 forKeyedSubscript:v10];
        }
        else
        {
          uint64_t v13 = [MEMORY[0x1E4F1C9C8] distantPast];
          [v4 setObject:v13 forKeyedSubscript:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)requestNotificationWhenCategoriesAreReady
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__ATXAppDirectoryOrderingProvider_requestNotificationWhenCategoriesAreReady__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __76__ATXAppDirectoryOrderingProvider_requestNotificationWhenCategoriesAreReady__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 248) timeIntervalSinceNow];
  double v3 = v2;
  id v4 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    double v6 = v3;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryOrderingProvider: Last update interval %f", (uint8_t *)&v5, 0xCu);
  }

  if (v3 < -10.0) {
    [*(id *)(a1 + 32) _postUpdateNotificationWithReason:@"Defaults requested earlier - real categorization warmup complete"];
  }
}

- (void)_registerForManagedAppsOrgInfoChangedNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleManagedAppsOrgInfoChangedNotification name:*MEMORY[0x1E4F741C8] object:0];
}

- (void)_registerForManagedAppsChangedNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleManagedAppsChangedNotification name:*MEMORY[0x1E4F741C0] object:0];
}

- (void)_handleManagedAppsOrgInfoChangedNotification
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%@: MCManagingOrgInfo changed, refresh enterprise category name", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__ATXAppDirectoryOrderingProvider__handleManagedAppsOrgInfoChangedNotification__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __79__ATXAppDirectoryOrderingProvider__handleManagedAppsOrgInfoChangedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMDMCategoryName];
}

- (void)_handleManagedAppsChangedNotification
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%@: Managed apps changed, refresh enterprise category name", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__ATXAppDirectoryOrderingProvider__handleManagedAppsChangedNotification__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __72__ATXAppDirectoryOrderingProvider__handleManagedAppsChangedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMDMAndEnterpriseCategories];
}

+ (BOOL)isStoreDemoMode
{
  return CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0) != 0;
}

- (BOOL)isMarketingDemoMode
{
  return [(NSUserDefaults *)self->_atxDefaults BOOLForKey:@"ATXMarketingDemoMode"];
}

- (void)appLaunchInformationWithReply:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ATXAppDirectoryOrderingProvider_appLaunchInformationWithReply___block_invoke;
  v7[3] = &unk_1E68AB528;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __65__ATXAppDirectoryOrderingProvider_appLaunchInformationWithReply___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v2 = *(void **)(a1 + 32);
  if (!v2[1]) {
    [v2 _updateAppLaunchCounts];
  }
  id v3 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v9];
        [v10 floatValue];
        float v12 = v11;

        uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v9];
        [v13 floatValue];
        float v15 = v14;

        long long v16 = [*(id *)(a1 + 32) _combinedLaunchCountForBundleId:v9];
        [v16 floatValue];
        float v18 = v17;

        uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"General Launch Counts: %f, Library Launch Counts: %f, Weighted Total Launch Counts: %f", v12, v15, v18];
        [v3 addObject:v19];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  long long v20 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v21 = *(void *)(a1 + 40);
  id v22 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  uint64_t v23 = [v20 dictionaryWithObjects:v3 forKeys:v22];
  (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v23, 0);
}

- (void)categoryLaunchInformationWithReply:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__ATXAppDirectoryOrderingProvider_categoryLaunchInformationWithReply___block_invoke;
  v7[3] = &unk_1E68AB528;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __70__ATXAppDirectoryOrderingProvider_categoryLaunchInformationWithReply___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v2 = *(void **)(a1 + 32);
  if (!v2[1]) {
    [v2 _updateAppLaunchCounts];
  }
  id v3 = objc_opt_new();
  id v4 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 280);
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "categoryID"));
        [v3 addObject:v10];

        float v11 = [*(id *)(a1 + 32) _totalLaunchCountsForCategory:v9];
        [v11 floatValue];
        float v13 = v12;

        float v14 = [*(id *)(a1 + 32) _totalLibraryLaunchCountsForCategory:v9];
        [v14 floatValue];
        float v16 = v15;

        double v17 = v13;
        double v18 = v16;
        float v19 = v17 + v18 * 10.0;
        long long v20 = (void *)[[NSString alloc] initWithFormat:@"General Launch Counts: %f, Library Launch Counts: %f, Weighted Total Launch Counts: %f", *(void *)&v17, *(void *)&v18, v19];
        [v4 addObject:v20];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  uint64_t v21 = *(void *)(a1 + 40);
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3];
  (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v22, 0);
}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_currentTimer, 0);
  objc_storeStrong((id *)&self->_atxDefaults, 0);
  objc_storeStrong((id *)&self->_lastUpdatePostTime, 0);
  objc_storeStrong((id *)&self->_sbsHomeScreenService, 0);
  objc_storeStrong((id *)&self->_managingOrganizationName, 0);
  objc_storeStrong((id *)&self->_managedAppIDs, 0);
  objc_storeStrong((id *)&self->_homescreenAppsToDedupeAgainst, 0);
  objc_storeStrong((id *)&self->_appScreenTimeCategoryMappings, 0);
  objc_storeStrong((id *)&self->_appIconState, 0);
  objc_storeStrong((id *)&self->_appClipChangeListener, 0);
  objc_storeStrong((id *)&self->_appLaunchHistogramManager, 0);
  objc_storeStrong((id *)&self->_appClipDataProvider, 0);
  objc_storeStrong((id *)&self->_recentsCache, 0);
  objc_storeStrong((id *)&self->_hiddenAppsCache, 0);
  objc_storeStrong((id *)&self->_recentApps, 0);
  objc_storeStrong((id *)&self->_blacklistedBundleIds, 0);
  objc_storeStrong((id *)&self->_blacklist, 0);
  objc_storeStrong((id *)&self->_hardcodedAppCategoryScreenTimeMappings, 0);
  objc_storeStrong((id *)&self->_hardcodedAppCategoryMappings, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_unhiddenAppNotification, 0);
  objc_storeStrong((id *)&self->_hiddenAppNotification, 0);
  objc_storeStrong((id *)&self->_installingNotification, 0);
  objc_storeStrong((id *)&self->_offloadNotification, 0);
  objc_storeStrong((id *)&self->_installNotification, 0);
  objc_storeStrong((id *)&self->_uninstallNotification, 0);
  objc_storeStrong((id *)&self->_appProtectionInfoProvider, 0);
  objc_storeStrong((id *)&self->_infoManager, 0);
  objc_storeStrong((id *)&self->_atxClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_libraryAppLaunchCounts, 0);
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
}

void __201__ATXAppDirectoryOrderingProvider_initWithAppInfoManager_cache_blacklist_recentsCache_hiddenAppsCache_appClipDataProvider_appIconState_appClipChangeListener_histogramManager_appProtectionInfoProvider___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "ATXAppDirectoryOrderingProvider: Suggestions settings have changed - requesting refresh", v1, 2u);
}

- (void)_readCategoriesFromDisk
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "ATXAppDirectoryOrderingProvider: Deserialize categories failed: data is of incorrect format", v1, 2u);
}

- (void)_getInstallDateForUnhiddenApp:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "ATXAppDirectoryOrderingProvider: LS app registration date shouldn't be nil for unhidden app, falling back to now", v2, v3, v4, v5, v6);
}

- (void)_updateRecentsForAppClipUsageEvent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "ATXAppDirectoryOrderingProvider: webAppBundleId should not be nil for an ATXAppClipUsageDuetEvent. Event: %@", v1, 0xCu);
}

- (void)_genreIdFromBundleId:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_2(&dword_1D0FA3000, v0, v1, "ATXAppDirectoryOrderingProvider: Enterprise/MDM app: %@ shouldn't have the signer as: %@", v2, v3, v4, v5, v6);
}

- (void)_screenTimeIdFromBundleId:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "ATXAppDirectoryOrderingProvider: CTCategories timed out when requesting categorization for bundle %@", v1, 0xCu);
}

void __61__ATXAppDirectoryOrderingProvider__screenTimeIdFromBundleId___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "ATXAppDirectoryOrderingProvider: Error when trying to request screen time categories for apps. Error: %@", v1, 0xCu);
}

- (void)_updateScreenTimeMappingsForAppBundleIds:withRetries:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "ATXAppDirectoryOrderingProvider: Timed out when requesting all app categories from CTCategory", v2, v3, v4, v5, v6);
}

void __88__ATXAppDirectoryOrderingProvider__updateScreenTimeMappingsForAppBundleIds_withRetries___block_invoke_215_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "ATXAppDirectoryOrderingProvider: Category retrieval hit maximum number of retries", v2, v3, v4, v5, v6);
}

- (void)_issuingOrganizationForEnterpriseAppBundleID:isMDM:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0FA3000, v0, v1, "app - %@ is not UPP app", v2);
}

- (void)_issuingOrganizationForEnterpriseAppBundleID:isMDM:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0FA3000, v0, v1, "app - %@ is not TestFlight app", v2);
}

- (void)_mdmEnterpriseCategoriesForApps:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Number of MDM categories should only be 1 while current is: %lu", v3, 0xCu);
}

- (void)_computeCategoriesWithRetries:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_3_1(&dword_1D0FA3000, a2, a3, "ATXAppDirectoryOrderingProvider: Set to dedupe against: %@", (uint8_t *)&v4);
}

- (void)_computeCategoriesWithRetries:(id *)a1 .cold.2(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*a1, "getFirstVisiblePageIndex"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0FA3000, a2, v4, "ATXAppDirectoryOrderingProvider: first visible page: %@", v5);
}

- (void)_computeCategoriesWithRetries:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 192), "getFirstVisiblePageIndex"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0FA3000, a2, v4, "ATXAppDirectoryOrderingProvider: first visible page: %@", v5);
}

@end