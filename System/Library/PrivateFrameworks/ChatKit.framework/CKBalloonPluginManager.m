@interface CKBalloonPluginManager
+ (id)defaultFavoritePlugins;
+ (id)morePlugin;
+ (id)recentPlugin;
+ (id)sharedInstance;
+ (id)sharedInstanceIfInitialized;
- (BOOL)_addPluginToRecentsFrontIfNeeded:(id)a3 frontOfRecents:(id)a4 pluginMap:(id)a5 fallbackMap:(id)a6;
- (BOOL)_shouldForceRegenerateIndexPathMap;
- (BOOL)_shouldForceRegenerateStickersIndexPathMap;
- (BOOL)_shouldShowActivity;
- (BOOL)_shouldUninstallContainingBundle:(id)a3;
- (BOOL)hasLoadedExtensions;
- (BOOL)isAppInstallationEnabled;
- (BOOL)isAppInstallationObserver;
- (BOOL)isAppRemovalEnabled;
- (BOOL)isAppStoreAutoEnableToggled;
- (BOOL)isBalloonPluginVisible:(id)a3;
- (BOOL)isCameraAllowed;
- (BOOL)isEnabledAndVisible:(id)a3;
- (BOOL)isInternalPlugin:(id)a3;
- (BOOL)isKeepingEmptySections;
- (BOOL)isPluginEnabled:(id)a3;
- (BOOL)isPluginHiddenFromSendMenuAndStickers:(id)a3;
- (BOOL)isPluginSeen:(id)a3;
- (BOOL)isPluginSeenWithInstalledVersion:(id)a3;
- (BOOL)isPluginSystemApp:(id)a3;
- (BOOL)isPluginVisible:(id)a3;
- (BOOL)isViewController:(id)a3 fromPluginWithIdentifier:(id)a4;
- (CKBalloonPluginManager)init;
- (CKPreviewDispatchCache)snapshotCache;
- (NSArray)allEnabledPlugins;
- (NSArray)allOrderedCombinedStickerApps;
- (NSArray)allPlugins;
- (NSArray)cachedPotentiallyVisiblePlugins;
- (NSArray)combinedStickerApps;
- (NSArray)disabledPlugins;
- (NSArray)favoriteAppStripPlugins;
- (NSArray)orderedCombinedStickerApps;
- (NSArray)potentiallyVisibleNonFavoritePlugins;
- (NSArray)potentiallyVisiblePlugins;
- (NSArray)recentAppStripPlugins;
- (NSArray)visibleDrawerPlugins;
- (NSArray)visibleFavoriteAppStripPlugins;
- (NSArray)visiblePlugins;
- (NSArray)visibleRecentAppStripPlugins;
- (NSArray)visibleSwitcherPlugins;
- (NSCache)iconCache;
- (NSDictionary)combinedStickersAppsIndexPathMap;
- (NSDictionary)pluginIndexPathMap;
- (NSDictionary)pluginLaunchTimeMap;
- (NSDictionary)pluginSeenMap;
- (NSDictionary)pluginVersionMap;
- (NSHashTable)currentExtensionConsumers;
- (NSMutableArray)MRUPluginInteractionList;
- (NSMutableArray)visibleInstallations;
- (NSMutableDictionary)activeBrowsers;
- (NSMutableDictionary)historicalPluginIndexPathMap;
- (NSMutableSet)prefetchIconKeys;
- (NSSet)oldVisibleSwitcherPluginIdentifiers;
- (UIViewController)lastUsedPhotoViewController;
- (__CFString)healthKitAchievementAvailabilityChangedNotification;
- (id)_decodeIndexPathMap:(id)a3 allowMigration:(BOOL)a4;
- (id)_encodeIndexPathMap:(id)a3;
- (id)_pluginIndexPathForFavoritePluginWithIdentifier:(id)a3 pluginMap:(id)a4 fallbackMap:(id)a5;
- (id)_pluginIndexPathForPluginWithIdentifier:(id)a3 pluginMap:(id)a4;
- (id)allPluginsPassingTest:(id)a3;
- (id)allPotentiallyVisiblePlugins;
- (id)balloonPluginIdentifierForAppExtensionBundleIdentifier:(id)a3;
- (id)browserSnapshotForKey:(id)a3;
- (id)bundleIdentifiersForCurrentExtensionConsumers;
- (id)candidateAppStripPlugins;
- (id)createFakeAppsForPPTTesting:(unint64_t)a3;
- (id)descriptionOfVisibleDrawerPlugins;
- (id)digitalTouchViewControllerWithDataSource:(id)a3;
- (id)existingPhotoBrowserViewController;
- (id)existingViewControllerForPluginIdentifier:(id)a3;
- (id)filteredArrayOfInstallationsThatShouldBeVisible:(id)a3;
- (id)handwritingViewControllerWithPluginPayloads:(id)a3;
- (id)launchTimeForPlugin:(id)a3;
- (id)newViewControllerForPluginIdentifier:(id)a3 dataSource:(id)a4;
- (id)orderedPlugins:(BOOL)a3;
- (id)photosBrowserViewControllerWithPluginPayloads:(id)a3;
- (id)pluginForAdamID:(id)a3;
- (id)pluginForExtensionIdentifier:(id)a3;
- (id)pluginForIdentifier:(id)a3;
- (id)viewControllerForPluginIdentifier:(id)a3;
- (id)viewControllerForPluginIdentifier:(id)a3 dataSource:(id)a4;
- (int64_t)numberOfSectionsToKeep;
- (unint64_t)badgeValueForPlugin:(id)a3;
- (unint64_t)launchStatusForPlugin:(id)a3;
- (unint64_t)unseenPluginCount;
- (void)_addAppWithBalloonIdentifier:(id)a3;
- (void)_disableAppWithBalloonIdentifier:(id)a3;
- (void)_invalidatePluginForKey:(id)a3;
- (void)_refreshVisibleDrawerPluginsDueToAppInstallationChange;
- (void)_setSeen:(BOOL)a3 forPlugin:(id)a4;
- (void)_updateHistoricalPluginIndexPathMap;
- (void)addExtensionConsumer:(id)a3;
- (void)appInstallationWatcher:(id)a3 addedAppInstallation:(id)a4;
- (void)appInstallationWatcher:(id)a3 changedAppInstallation:(id)a4;
- (void)cleanSeenMap;
- (void)clearBalloonPluginCache;
- (void)commitInteractionTimeOrderingChanges;
- (void)dealloc;
- (void)deleteAppWithIdentifier:(id)a3 completion:(id)a4;
- (void)forceKillNonCameraRemoteExtensionsImmediately;
- (void)forceKillRemoteExtensionsWithDelay:(BOOL)a3;
- (void)forceKillRemoteExtensionsWithDelay:(BOOL)a3 skipCameraApp:(BOOL)a4;
- (void)forceTearDownRemoteViewsSkippingCameraApp:(BOOL)a3;
- (void)handleManagedConfigSettingsChangeNotification:(id)a3;
- (void)healthStickerStatusChanged;
- (void)invalidateAllActivePlugins;
- (void)invalidateAllActivePluginsSkippingCameraApp:(BOOL)a3;
- (void)invalidateAppManagerPlugin;
- (void)invalidateIconCache;
- (void)invalidatePhotosPlugin;
- (void)invalidatePhotosViewController;
- (void)prepareForSuspend;
- (void)refreshPlugins;
- (void)regenerateCombinedStickersAppsIndexPaths;
- (void)regeneratePluginIndexPaths;
- (void)reloadInstalledApps:(id)a3;
- (void)removeAppWithIdentifier:(id)a3;
- (void)removeVisibleInstallationWithID:(id)a3;
- (void)saveCombinedAppsWithNotification:(BOOL)a3;
- (void)saveWithNotification:(BOOL)a3;
- (void)setActiveBrowsers:(id)a3;
- (void)setAllPlugins:(id)a3;
- (void)setAppStoreAutoEnableToggled:(BOOL)a3;
- (void)setCachedPotentiallyVisiblePlugins:(id)a3;
- (void)setCombinedStickersAppsIndexPathMap:(id)a3;
- (void)setCurrentExtensionConsumers:(id)a3;
- (void)setEnabled:(BOOL)a3 forPlugin:(id)a4;
- (void)setFavoriteAppStripPlugins:(id)a3;
- (void)setHistoricalPluginIndexPathMap:(id)a3;
- (void)setIconCache:(id)a3;
- (void)setIsAppInstallationEnabled:(BOOL)a3;
- (void)setIsAppInstallationObserver:(BOOL)a3;
- (void)setIsAppRemovalEnabled:(BOOL)a3;
- (void)setIsCameraAllowed:(BOOL)a3;
- (void)setKeepingEmptySections:(BOOL)a3;
- (void)setLastUsedPhotoViewController:(id)a3;
- (void)setMRUPluginInteractionList:(id)a3;
- (void)setNumberOfSectionsToKeep:(int64_t)a3;
- (void)setOldVisibleSwitcherPluginIdentifiers:(id)a3;
- (void)setPlugin:(id)a3 hiddenInSendMenuAndStickers:(BOOL)a4;
- (void)setPluginIndexPathMap:(id)a3;
- (void)setPluginLaunchTimeMap:(id)a3;
- (void)setPluginSeenMap:(id)a3;
- (void)setPluginVersionMap:(id)a3;
- (void)setPrefetchIconKeys:(id)a3;
- (void)setSeen:(BOOL)a3 forPlugin:(id)a4;
- (void)setSnapshotCache:(id)a3;
- (void)setVisibleInstallations:(id)a3;
- (void)setVisiblePlugins:(id)a3;
- (void)setVisibleSwitcherPlugins:(id)a3;
- (void)updateAppInstallations;
- (void)updateIndexPath:(id)a3 forCombinedStickerApp:(id)a4;
- (void)updateIndexPath:(id)a3 forPlugin:(id)a4 isDrawerPluginPath:(BOOL)a5;
- (void)updateInteractionTimeForPlugin:(id)a3;
- (void)updateLaunchStatus:(unint64_t)a3 forPlugin:(id)a4 withNotification:(BOOL)a5;
- (void)updateLaunchTimeForPlugin:(id)a3;
- (void)updateSnapshotForBrowserViewController:(id)a3 currentBounds:(CGRect)a4;
@end

@implementation CKBalloonPluginManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CKBalloonPluginManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  v2 = (void *)__sharedDataSource;

  return v2;
}

void __40__CKBalloonPluginManager_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)__sharedDataSource;
  __sharedDataSource = (uint64_t)v0;
}

+ (id)sharedInstanceIfInitialized
{
  return (id)__sharedDataSource;
}

+ (id)recentPlugin
{
  if (recentPlugin_onceToken != -1) {
    dispatch_once(&recentPlugin_onceToken, &__block_literal_global_75);
  }
  v2 = (void *)recentPlugin_sRecentsPlugin;

  return v2;
}

void __38__CKBalloonPluginManager_recentPlugin__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F6BC00]);
  CKFrameworkBundle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v4 localizedStringForKey:@"RECENTS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v2 = [v0 initWithIdentifier:@"com.apple.messages.browser.RecentPlugin" browserDisplayName:v1 browserImageName:&stru_1EDE4CA38 browserClass:objc_opt_class() presentationContext:1];
  v3 = (void *)recentPlugin_sRecentsPlugin;
  recentPlugin_sRecentsPlugin = v2;
}

+ (id)morePlugin
{
  if (morePlugin_onceToken != -1) {
    dispatch_once(&morePlugin_onceToken, &__block_literal_global_83_1);
  }
  uint64_t v2 = (void *)morePlugin_sMorePlugin;

  return v2;
}

void __36__CKBalloonPluginManager_morePlugin__block_invoke()
{
  if (!CKIsRunningInCameraAppsClient())
  {
    id v0 = [CKMoreBrowserPlugin alloc];
    CKFrameworkBundle();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    v1 = [v4 localizedStringForKey:@"MORE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v2 = [(IMBalloonBrowserPlugin *)v0 initWithIdentifier:@"com.apple.messages.browser.MorePlugin" browserDisplayName:v1 browserImageName:@"MoreIcon" browserClass:objc_opt_class() presentationContext:1];
    v3 = (void *)morePlugin_sMorePlugin;
    morePlugin_sMorePlugin = v2;
  }
}

- (CKBalloonPluginManager)init
{
  v37.receiver = self;
  v37.super_class = (Class)CKBalloonPluginManager;
  uint64_t v2 = [(CKBalloonPluginManager *)&v37 init];
  if (v2)
  {
    uint64_t v3 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKBrowserSelectionControllerVersionDictionaryKey");
    pluginVersionMap = v2->_pluginVersionMap;
    v2->_pluginVersionMap = (NSDictionary *)v3;

    if (!v2->_pluginVersionMap)
    {
      if (IMOSLoggingEnabled())
      {
        v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v36 = 0;
          _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Version map was not in user defaults, building from scratch.", v36, 2u);
        }
      }
      v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      v7 = v2->_pluginVersionMap;
      v2->_pluginVersionMap = v6;
    }
    uint64_t v8 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKBrowserSelectionControllerSeenDictionaryKey");
    pluginSeenMap = v2->_pluginSeenMap;
    v2->_pluginSeenMap = (NSDictionary *)v8;

    v10 = v2->_pluginSeenMap;
    if (!v10)
    {
      if (IMOSLoggingEnabled())
      {
        v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v36 = 0;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Seen map was not in user defaults, building from scratch.", v36, 2u);
        }
      }
      v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      v13 = v2->_pluginSeenMap;
      v2->_pluginSeenMap = v12;

      v10 = v2->_pluginSeenMap;
    }
    v14 = [(NSDictionary *)v10 allValues];
    v15 = [v14 firstObject];

    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
        v17 = v2->_pluginSeenMap;
        v2->_pluginSeenMap = v16;
      }
    }
    uint64_t v18 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKBrowserSelectionControllerLaunchTimeDictionaryKey");
    pluginLaunchTimeMap = v2->_pluginLaunchTimeMap;
    v2->_pluginLaunchTimeMap = (NSDictionary *)v18;

    if (!v2->_pluginLaunchTimeMap)
    {
      if (IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v36 = 0;
          _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Seen map was not in user defaults, building from scratch.", v36, 2u);
        }
      }
      v21 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      v22 = v2->_pluginLaunchTimeMap;
      v2->_pluginLaunchTimeMap = v21;
    }
    uint64_t v23 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    currentExtensionConsumers = v2->_currentExtensionConsumers;
    v2->_currentExtensionConsumers = (NSHashTable *)v23;

    [(CKBalloonPluginManager *)v2 setNumberOfSectionsToKeep:0];
    v2->_appStoreAutoEnableToggled = IMGetDomainBoolForKey();
    if (!init___CKMCEffectiveSettingsChangedNotification)
    {
      v25 = (void **)MEMORY[0x192FBA870]("MCEffectiveSettingsChangedNotification", @"ManagedConfiguration");
      if (v25) {
        v26 = *v25;
      }
      else {
        v26 = 0;
      }
      objc_storeStrong((id *)&init___CKMCEffectiveSettingsChangedNotification, v26);
    }
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v2 selector:sel_handleManagedConfigSettingsChangeNotification_ name:init___CKMCEffectiveSettingsChangedNotification object:0];

    [(CKBalloonPluginManager *)v2 handleManagedConfigSettingsChangeNotification:0];
    v28 = (void *)MEMORY[0x1E4F1CAD0];
    v29 = [(CKBalloonPluginManager *)v2 visibleSwitcherPlugins];
    v30 = [v29 arrayByApplyingSelector:sel_identifier];
    uint64_t v31 = [v28 setWithArray:v30];
    oldVisibleSwitcherPluginIdentifiers = v2->_oldVisibleSwitcherPluginIdentifiers;
    v2->_oldVisibleSwitcherPluginIdentifiers = (NSSet *)v31;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_HealthStickerStatusChanged, [(CKBalloonPluginManager *)v2 healthKitAchievementAvailabilityChangedNotification], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v2 selector:sel_reloadInstalledApps_ name:*MEMORY[0x1E4F6B878] object:0];

    CKShouldShowSURF();
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[CKAppInstallationWatcher sharedInstance];
  [v4 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, [(CKBalloonPluginManager *)self healthKitAchievementAvailabilityChangedNotification], 0);
  v6.receiver = self;
  v6.super_class = (Class)CKBalloonPluginManager;
  [(CKBalloonPluginManager *)&v6 dealloc];
}

- (NSDictionary)pluginIndexPathMap
{
  pluginIndexPathMap = self->_pluginIndexPathMap;
  if (!pluginIndexPathMap)
  {
    id v4 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKBrowserSelectionControllerIndexPathDictionaryV3Key");
    if (!v4)
    {
      id v4 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKBrowserSelectionControllerIndexPathDictionaryV2Key");
      if (!v4)
      {
        id v4 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKBrowserSelectionControllerIndexPathDictionaryV1Key");
      }
    }
    v5 = [(CKBalloonPluginManager *)self _decodeIndexPathMap:v4 allowMigration:1];
    objc_super v6 = self->_pluginIndexPathMap;
    self->_pluginIndexPathMap = v5;

    [(CKBalloonPluginManager *)self _updateHistoricalPluginIndexPathMap];
    pluginIndexPathMap = self->_pluginIndexPathMap;
  }

  return pluginIndexPathMap;
}

- (NSDictionary)combinedStickersAppsIndexPathMap
{
  combinedStickersAppsIndexPathMap = self->_combinedStickersAppsIndexPathMap;
  if (!combinedStickersAppsIndexPathMap)
  {
    id v4 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKCombinedStickerAppsIndexPathDictionaryV1Key");
    v5 = [(CKBalloonPluginManager *)self _decodeIndexPathMap:v4 allowMigration:0];
    objc_super v6 = self->_combinedStickersAppsIndexPathMap;
    self->_combinedStickersAppsIndexPathMap = v5;

    combinedStickersAppsIndexPathMap = self->_combinedStickersAppsIndexPathMap;
  }

  return combinedStickersAppsIndexPathMap;
}

- (void)addExtensionConsumer:(id)a3
{
  id v4 = a3;
  id v5 = [(CKBalloonPluginManager *)self currentExtensionConsumers];
  [v5 addObject:v4];
}

- (void)refreshPlugins
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Resetting plugins, will fetch from plugin manager next request.", v14, 2u);
    }
  }
  allPlugins = self->_allPlugins;
  self->_allPlugins = 0;

  cachedPotentiallyVisiblePlugins = self->_cachedPotentiallyVisiblePlugins;
  self->_cachedPotentiallyVisiblePlugins = 0;

  visiblePlugins = self->_visiblePlugins;
  self->_visiblePlugins = 0;

  appStripCandidatePlugins = self->_appStripCandidatePlugins;
  self->_appStripCandidatePlugins = 0;

  visibleAppStripPlugins = self->_visibleAppStripPlugins;
  self->_visibleAppStripPlugins = 0;

  visibleSwitcherPlugins = self->_visibleSwitcherPlugins;
  self->_visibleSwitcherPlugins = 0;

  favoriteAppStripPlugins = self->_favoriteAppStripPlugins;
  self->_favoriteAppStripPlugins = 0;

  recentAppStripPlugins = self->_recentAppStripPlugins;
  self->_recentAppStripPlugins = 0;

  visibleRecentAppStripPlugins = self->_visibleRecentAppStripPlugins;
  self->_visibleRecentAppStripPlugins = 0;

  combinedStickersAppsIndexPathMap = self->_combinedStickersAppsIndexPathMap;
  self->_combinedStickersAppsIndexPathMap = 0;
}

- (void)reloadInstalledApps:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Received notification to reload all installed apps from imagent.", buf, 2u);
    }
  }
  [(CKBalloonPluginManager *)self refreshPlugins];
  if ([(CKBalloonPluginManager *)self _shouldForceRegenerateIndexPathMap]) {
    [(CKBalloonPluginManager *)self regeneratePluginIndexPaths];
  }
  if ([(CKBalloonPluginManager *)self _shouldForceRegenerateStickersIndexPathMap])
  {
    [(CKBalloonPluginManager *)self regenerateCombinedStickersAppsIndexPaths];
  }
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Broadcasting browser selection data source changed notification.", buf, 2u);
    }
  }
  objc_super v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"CKBrowserSelectionControllerDataSourceChangedNotification" object:0];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"CKCombinedStickerAppsOrderChangedNotification" object:0];

  uint64_t v8 = [(CKBalloonPluginManager *)self visibleSwitcherPlugins];
  v9 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [v14 identifier];
          [(NSSet *)v9 addObject:v15];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v11);
  }

  if ([(NSSet *)self->_oldVisibleSwitcherPluginIdentifiers count])
  {
    v16 = [MEMORY[0x1E4F1CA80] set];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v17 = self->_oldVisibleSwitcherPluginIdentifiers;
    uint64_t v18 = [(NSSet *)v17 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * j);
          if (![(NSSet *)v9 containsObject:v21]) {
            [v16 addObject:v21];
          }
        }
        uint64_t v18 = [(NSSet *)v17 countByEnumeratingWithState:&v39 objects:v51 count:16];
      }
      while (v18);
    }

    v22 = [MEMORY[0x1E4F1CA80] set];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v23 = v9;
    uint64_t v24 = [(NSSet *)v23 countByEnumeratingWithState:&v35 objects:v50 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void *)(*((void *)&v35 + 1) + 8 * k);
          if (![(NSSet *)self->_oldVisibleSwitcherPluginIdentifiers containsObject:v27]) {
            [v22 addObject:v27];
          }
        }
        uint64_t v24 = [(NSSet *)v23 countByEnumeratingWithState:&v35 objects:v50 count:16];
      }
      while (v24);
    }

    if ([v16 count] || objc_msgSend(v22, "count"))
    {
      v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v48[0] = @"CKBrowserSelectionControllerInstalledPluginsKey";
      v48[1] = @"CKBrowserSelectionControllerUninstalledPluginsKey";
      v49[0] = v22;
      v49[1] = v16;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
      [v28 postNotificationName:@"CKBrowserSelectionControllerVisibleSwitcherPluginsChangedNotification" object:0 userInfo:v29];
    }
  }
  oldVisibleSwitcherPluginIdentifiers = self->_oldVisibleSwitcherPluginIdentifiers;
  self->_oldVisibleSwitcherPluginIdentifiers = v9;
  uint64_t v31 = v9;

  id v32 = [(CKBalloonPluginManager *)self combinedStickersAppsIndexPathMap];
  [(CKBalloonPluginManager *)self cleanSeenMap];
  [(CKBalloonPluginManager *)self invalidateIconCache];
  [(CKBalloonPluginManager *)self saveWithNotification:0];
  [(CKBalloonPluginManager *)self saveCombinedAppsWithNotification:0];
  v33 = [MEMORY[0x1E4F28EB8] defaultCenter];

  [v33 postNotificationName:@"CKBrowserSelectionControllerReloadedInstallationsNotification" object:0 userInfo:0];
}

- (__CFString)healthKitAchievementAvailabilityChangedNotification
{
  if (healthKitAchievementAvailabilityChangedNotification_onceToken != -1) {
    dispatch_once(&healthKitAchievementAvailabilityChangedNotification_onceToken, &__block_literal_global_115);
  }
  return (__CFString *)healthKitAchievementAvailabilityChangedNotification_healthActivityNotificationStr;
}

CFStringRef __77__CKBalloonPluginManager_healthKitAchievementAvailabilityChangedNotification__block_invoke()
{
  id v0 = (const char *)MEMORY[0x192FBA870]("kHKAchievementStickerAvailbilityDidChangeNotification", @"HealthKit");
  CFStringRef result = CFStringCreateWithCString(0, v0, 0x8000100u);
  healthKitAchievementAvailabilityChangedNotification_healthActivityNotificationStr = (uint64_t)result;
  return result;
}

- (void)healthStickerStatusChanged
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Broadcasting browser selection data source changed notification due to Health sticker change.", v4, 2u);
    }
  }
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"CKBrowserSelectionControllerDataSourceChangedNotification" object:0];
}

- (BOOL)_shouldUninstallContainingBundle:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [v3 isLaunchProhibited];
  id v5 = [v3 applicationType];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F22390]];

  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = @"NO";
      if (v4) {
        v9 = @"YES";
      }
      else {
        v9 = @"NO";
      }
      int v12 = 138413058;
      id v13 = v3;
      if (v6) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      v15 = v9;
      __int16 v14 = 2112;
      __int16 v16 = 2112;
      if ((v4 & v6) != 0) {
        uint64_t v8 = @"YES";
      }
      v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "_shouldUninstallContainingBundle containingBundle %@ isMessagesOnly %@ isUserApp %@ shouldUnInstall %@", (uint8_t *)&v12, 0x2Au);
    }
  }
  return v4 & v6;
}

- (void)_addAppWithBalloonIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "_addAppWithBalloonIdentifier id %@", (uint8_t *)&v8, 0xCu);
      }
    }
    if ([v3 isEqualToString:@"com.apple.messages.browser.RecentPlugin"])
    {
      int v6 = [(id)objc_opt_class() recentPlugin];
      v7 = [v6 app];
      [v7 setIsEnabled:1];
    }
    else
    {
      int v6 = [MEMORY[0x1E4F6BC18] sharedInstance];
      [v6 setPluginEnabled:1 identifier:v3];
    }
  }
  else
  {
    if (!v4) {
      goto LABEL_14;
    }
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "CKBalloonPluginManager nil idenitifier passed to _addAppWithBalloonIdentifier", (uint8_t *)&v8, 2u);
    }
  }

LABEL_14:
}

- (void)_disableAppWithBalloonIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "_disableAppWithBalloonIdentifier id %@", (uint8_t *)&v8, 0xCu);
      }
    }
    if ([v3 isEqualToString:@"com.apple.messages.browser.RecentPlugin"])
    {
      int v6 = [(id)objc_opt_class() recentPlugin];
      v7 = [v6 app];
      [v7 setIsEnabled:0];
    }
    else
    {
      int v6 = [MEMORY[0x1E4F6BC18] sharedInstance];
      [v6 setPluginEnabled:0 identifier:v3];
    }
  }
  else
  {
    if (!v4) {
      goto LABEL_14;
    }
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "CKBalloonPluginManager nil idenitifier passed to _disableAppWithBalloonIdentifier", (uint8_t *)&v8, 2u);
    }
  }

LABEL_14:
}

- (void)removeAppWithIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v4;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "removeAppWithBalloonIdentifier id %@", buf, 0xCu);
      }
    }
    v7 = [MEMORY[0x1E4F6BC18] sharedInstance];
    int v8 = [v7 balloonPluginForBundleID:v4];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ([v4 isEqualToString:@"com.apple.messages.browser.RecentPlugin"])
      {
        id v9 = [(id)objc_opt_class() recentPlugin];
        uint64_t v23 = [v9 app];
        [v23 setIsEnabled:0];
      }
      else
      {
        id v9 = [MEMORY[0x1E4F6BC18] sharedInstance];
        [v9 setPluginEnabled:0 identifier:v4];
      }
      goto LABEL_38;
    }
    id v9 = [v8 proxy];
    if (!v8
      || (([v8 identifier],
           uint64_t v10 = objc_claimAutoreleasedReturnValue(),
           char v11 = [v10 isEqualToString:v4],
           v9)
        ? (char v12 = v11)
        : (char v12 = 0),
          v10,
          (v12 & 1) == 0))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v27 = v8;
          __int16 v28 = 2112;
          id v29 = v4;
          __int16 v30 = 2112;
          uint64_t v31 = @"YES";
          _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "Did not find plugin %@ for identifier %@ isAppExtension %@", buf, 0x20u);
        }
      }
      goto LABEL_38;
    }
    id v13 = [v9 containingBundle];
    if ([(CKBalloonPluginManager *)self _shouldUninstallContainingBundle:v13])
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = [v13 bundleIdentifier];
          *(_DWORD *)buf = 138412290;
          id v27 = v15;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Uninstalling app %@", buf, 0xCu);
        }
      }
      __int16 v16 = (void *)MEMORY[0x192FBA860](@"IXAppInstallCoordinator", @"InstallCoordination");
      if (!v16) {
        goto LABEL_37;
      }
      v17 = [v13 bundleIdentifier];
      id v25 = 0;
      [v16 uninstallAppWithBundleID:v17 error:&v25];
      id v18 = v25;

      if (v18 && IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = [v13 bundleIdentifier];
          *(_DWORD *)buf = 138412546;
          id v27 = v20;
          __int16 v28 = 2112;
          id v29 = v18;
          _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Error when uninstalling app with bundleID %@ (error: %@)", buf, 0x16u);
        }
      }
      uint64_t v21 = [MEMORY[0x1E4F6BC18] sharedInstance];
      [v21 removePluginWithBundleID:v4];
    }
    else
    {
      id v18 = [MEMORY[0x1E4F6BC18] sharedInstance];
      [v18 setPluginEnabled:0 identifier:v4];
    }

LABEL_37:
LABEL_38:

    goto LABEL_39;
  }
  if (v5)
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "CKBalloonPluginManager nil identifier passed to removeAppWithBalloonIdentifier", buf, 2u);
    }
  }
LABEL_39:
}

- (void)deleteAppWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CKBalloonPluginManager_deleteAppWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E5622358;
  id v7 = v6;
  id v32 = v7;
  int v8 = (void (**)(void *, void))_Block_copy(aBlock);
  id v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v10 = [v9 isStickersAppEnabled];

  if ((v10 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "CKBalloonPluginManager trying to call deleteAppWithIdentifier with invalid configuration", buf, 2u);
      }
    }
    goto LABEL_24;
  }
  int v11 = IMOSLoggingEnabled();
  if (!v5)
  {
    if (v11)
    {
      id v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "CKBalloonPluginManager nil identifier passed to deleteAppWithIdentifier", buf, 2u);
      }
    }
LABEL_24:
    v8[2](v8, 0);
    goto LABEL_37;
  }
  if (v11)
  {
    char v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v5;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "deleteAppWithIdentifier id %@", buf, 0xCu);
    }
  }
  id v13 = [MEMORY[0x1E4F6BC18] sharedInstance];
  __int16 v14 = [v13 balloonPluginForBundleID:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [v14 proxy];
    if (v14
      && (([v14 identifier],
           __int16 v16 = objc_claimAutoreleasedReturnValue(),
           char v17 = [v16 isEqualToString:v5],
           v15)
        ? (char v18 = v17)
        : (char v18 = 0),
          v16,
          (v18 & 1) != 0))
    {
      uint64_t v19 = [v15 containingBundle];
      if (IMOSLoggingEnabled())
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = [v19 bundleIdentifier];
          *(_DWORD *)buf = 138412290;
          id v34 = v21;
          _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Uninstalling app %@", buf, 0xCu);
        }
      }
      v22 = (void *)MEMORY[0x192FBA860](@"IXAppInstallCoordinator", @"InstallCoordination");
      if (v22)
      {
        uint64_t v23 = [v19 bundleIdentifier];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __61__CKBalloonPluginManager_deleteAppWithIdentifier_completion___block_invoke_138;
        v27[3] = &unk_1E5625680;
        id v28 = v19;
        __int16 v30 = v8;
        id v29 = v5;
        [v22 uninstallAppWithBundleID:v23 requestUserConfirmation:1 completion:v27];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v34 = v14;
          __int16 v35 = 2112;
          id v36 = v5;
          __int16 v37 = 2112;
          long long v38 = @"YES";
          _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Did not find plugin %@ for identifier %@ isAppExtension %@", buf, 0x20u);
        }
      }
      v8[2](v8, 0);
    }
  }
LABEL_37:
}

void __61__CKBalloonPluginManager_deleteAppWithIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__CKBalloonPluginManager_deleteAppWithIdentifier_completion___block_invoke_2;
  v3[3] = &unk_1E56225E0;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __61__CKBalloonPluginManager_deleteAppWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __61__CKBalloonPluginManager_deleteAppWithIdentifier_completion___block_invoke_138(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        char v5 = [*(id *)(a1 + 32) bundleIdentifier];
        int v7 = 138412546;
        int v8 = v5;
        __int16 v9 = 2112;
        id v10 = v3;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Error when uninstalling app with bundleID %@ (error: %@)", (uint8_t *)&v7, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = [MEMORY[0x1E4F6BC18] sharedInstance];
    [v6 removePluginWithBundleID:*(void *)(a1 + 40)];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)updateInteractionTimeForPlugin:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    char v5 = [(CKBalloonPluginManager *)self MRUPluginInteractionList];

    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F1CA48] array];
      [(CKBalloonPluginManager *)self setMRUPluginInteractionList:v6];
    }
    int v7 = [(CKBalloonPluginManager *)self MRUPluginInteractionList];
    [v7 removeObject:v4];

    id v8 = [(CKBalloonPluginManager *)self MRUPluginInteractionList];
    [v8 insertObject:v4 atIndex:0];
  }
}

- (void)commitInteractionTimeOrderingChanges
{
  uint64_t v3 = [(CKBalloonPluginManager *)self MRUPluginInteractionList];
  if (v3)
  {
    id v4 = (void *)v3;
    char v5 = [(CKBalloonPluginManager *)self MRUPluginInteractionList];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      int v7 = [(CKBalloonPluginManager *)self recentAppStripPlugins];
      id v8 = (void *)[v7 mutableCopy];

      __int16 v9 = [(CKBalloonPluginManager *)self MRUPluginInteractionList];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __62__CKBalloonPluginManager_commitInteractionTimeOrderingChanges__block_invoke;
      v14[3] = &unk_1E56256A8;
      id v15 = v8;
      id v10 = v8;
      [v9 enumerateObjectsWithOptions:2 usingBlock:v14];

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __62__CKBalloonPluginManager_commitInteractionTimeOrderingChanges__block_invoke_2;
      v13[3] = &unk_1E56256D0;
      v13[4] = self;
      [v10 enumerateObjectsUsingBlock:v13];
      [(CKBalloonPluginManager *)self _updateHistoricalPluginIndexPathMap];
      [(CKBalloonPluginManager *)self refreshPlugins];
      id v11 = [(CKBalloonPluginManager *)self visiblePlugins];
      [(CKBalloonPluginManager *)self saveWithNotification:1];
      char v12 = [MEMORY[0x1E4F1CA48] array];
      [(CKBalloonPluginManager *)self setMRUPluginInteractionList:v12];
    }
  }
}

void __62__CKBalloonPluginManager_commitInteractionTimeOrderingChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "identifier", (void)v12);
        int v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          [*(id *)(a1 + 32) removeObject:v9];
          [*(id *)(a1 + 32) insertObject:v9 atIndex:0];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __62__CKBalloonPluginManager_commitInteractionTimeOrderingChanges__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28D58];
  id v6 = a2;
  id v9 = [v5 indexPathForRow:a3 inSection:1];
  uint64_t v7 = [*(id *)(a1 + 32) pluginIndexPathMap];
  id v8 = [v6 identifier];

  [v7 setValue:v9 forKey:v8];
}

- (void)_updateHistoricalPluginIndexPathMap
{
  id v3 = [(CKBalloonPluginManager *)self historicalPluginIndexPathMap];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CKBalloonPluginManager *)self setHistoricalPluginIndexPathMap:v4];
  }
  if (self->_pluginIndexPathMap)
  {
    id v5 = [(CKBalloonPluginManager *)self historicalPluginIndexPathMap];
    [v5 addEntriesFromDictionary:self->_pluginIndexPathMap];
  }
}

- (void)setEnabled:(BOOL)a3 forPlugin:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = @"Disabling";
      if (v4) {
        id v8 = @"Enabling";
      }
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "%@ plugin %@.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (v4) {
    [(CKBalloonPluginManager *)self _addAppWithBalloonIdentifier:v6];
  }
  else {
    [(CKBalloonPluginManager *)self _disableAppWithBalloonIdentifier:v6];
  }
}

- (BOOL)isPluginEnabled:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x1E4F6CC08];
    if ([v4 isEqualToString:*MEMORY[0x1E4F6CC08]])
    {
      uint64_t v7 = [(id)objc_opt_class() recentPlugin];
    }
    else
    {
      id v10 = [MEMORY[0x1E4F6BC18] sharedInstance];
      uint64_t v7 = [v10 balloonPluginForBundleID:v5];
    }
    __int16 v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v12 = [v11 isClingEnabled];

    if (v12)
    {
      uint64_t v13 = [v7 identifier];
      int v9 = [v13 isEqualToString:v6] ^ 1;
    }
    else
    {
      if (!v7)
      {
        LOBYTE(v9) = 1;
LABEL_18:
        if ([v5 isEqualToString:*MEMORY[0x1E4F6CB80]]) {
          LOBYTE(v9) = [(CKBalloonPluginManager *)self isAppStoreEnabled];
        }
        if ([v5 isEqualToString:*MEMORY[0x1E4F6CB98]]) {
          LOBYTE(v9) = [(CKBalloonPluginManager *)self isCameraAllowed];
        }
        if (CKIsRunningInMacCatalyst())
        {
          long long v14 = IMBalloonExtensionIDWithSuffix();
          int v15 = [v5 isEqualToString:v14];

          if (v15)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              __int16 v16 = [v7 plugin];
              LOBYTE(v9) = [v16 userElection] == 1;
            }
          }
        }

        goto LABEL_27;
      }
      uint64_t v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      if ([v13 isClingEnabled]) {
        LOBYTE(v9) = 1;
      }
      else {
        LOBYTE(v9) = [v7 isEnabled];
      }
    }

    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v18 = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "CKBalloonPluginManager nil idenitifier passed to isPluginEnabled:", v18, 2u);
    }
  }
  LOBYTE(v9) = 0;
LABEL_27:

  return v9;
}

- (id)_encodeIndexPathMap:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = v3;
    id v4 = v3;
    uint64_t v22 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v22)
    {
      uint64_t v5 = *(void *)v24;
      unint64_t v6 = 0x1E4F29000uLL;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v24 != v5) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          int v9 = [v4 objectForKeyedSubscript:v8];
          id v10 = *(void **)(v6 + 24);
          uint64_t v11 = [v9 section];
          int v12 = &stru_1EDE4CA38;
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "section"));
            int v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v20 = v12;
          }
          if ([v9 item] == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v13 = [v10 stringWithFormat:@"%@,%@", v12, &stru_1EDE4CA38];
          }
          else
          {
            unint64_t v14 = v6;
            id v15 = v4;
            uint64_t v16 = v5;
            uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "item"));
            uint64_t v13 = [v10 stringWithFormat:@"%@,%@", v12, v17];

            uint64_t v5 = v16;
            id v4 = v15;
            unint64_t v6 = v14;
          }
          if (v11 != 0x7FFFFFFFFFFFFFFFLL) {

          }
          [v21 setObject:v13 forKeyedSubscript:v8];
        }
        uint64_t v22 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v22);
    }

    id v3 = v19;
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

+ (id)defaultFavoritePlugins
{
  v19[15] = *MEMORY[0x1E4F143B8];
  char v18 = IMBalloonExtensionIDWithSuffix();
  uint64_t v2 = *MEMORY[0x1E4F6CB80];
  v19[0] = v18;
  v19[1] = v2;
  uint64_t v17 = IMBalloonExtensionIDWithSuffix();
  v19[2] = v17;
  uint64_t v16 = IMBalloonExtensionIDWithSuffix();
  v19[3] = v16;
  id v15 = IMBalloonExtensionIDWithSuffix();
  v19[4] = v15;
  id v3 = IMBalloonExtensionIDWithSuffix();
  v19[5] = v3;
  id v4 = IMBalloonExtensionIDWithSuffix();
  v19[6] = v4;
  uint64_t v5 = IMBalloonExtensionIDWithSuffix();
  v19[7] = v5;
  unint64_t v6 = IMBalloonExtensionIDWithSuffix();
  v19[8] = v6;
  uint64_t v7 = IMBalloonExtensionIDWithSuffix();
  v19[9] = v7;
  uint64_t v8 = IMBalloonExtensionIDWithSuffix();
  v19[10] = v8;
  int v9 = IMBalloonExtensionIDWithSuffix();
  v19[11] = v9;
  id v10 = IMBalloonExtensionIDWithSuffix();
  v19[12] = v10;
  uint64_t v11 = IMBalloonExtensionIDWithSuffix();
  uint64_t v12 = *MEMORY[0x1E4F6CBA0];
  v19[13] = v11;
  v19[14] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:15];

  return v13;
}

- (id)_decodeIndexPathMap:(id)a3 allowMigration:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    BOOL v25 = v4;
    unint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v26 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v13 = [v7 objectForKeyedSubscript:v12];
          uint64_t v14 = [v13 rangeOfString:@","];
          id v15 = [v13 substringToIndex:v14];
          uint64_t v16 = [v13 substringFromIndex:v14 + 1];
          if ([v16 length]) {
            uint64_t v17 = [v16 integerValue];
          }
          else {
            uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
          }
          if ([v15 length]) {
            uint64_t v18 = [v15 integerValue];
          }
          else {
            uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
          }
          id v19 = [MEMORY[0x1E4F28D58] indexPathForItem:v17 inSection:v18];
          [v6 setObject:v19 forKeyedSubscript:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v9);
    }

    if (v25)
    {
      id v20 = (id)MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKBrowserSelectionControllerIndexPathDictionaryV1Key");
      uint64_t v21 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKBrowserSelectionControllerIndexPathDictionaryV2Key");

      uint64_t v22 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKBrowserSelectionControllerIndexPathDictionaryV1Key");
      uint64_t v23 = v22 | v21;

      if (v23)
      {

        IMSetDomainValueForKey();
        IMSetDomainValueForKey();
        unint64_t v6 = 0;
      }
    }
    id v5 = v26;
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldForceRegenerateIndexPathMap
{
  uint64_t v2 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKBrowserSelectionControllerIndexPathDictionaryV3Key");
  if (v2)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v4 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKBrowserSelectionControllerIndexPathDictionaryV2Key");
    if (v4)
    {
      BOOL v3 = 0;
    }
    else
    {
      id v5 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKBrowserSelectionControllerIndexPathDictionaryV1Key");
      BOOL v3 = v5 == 0;
    }
  }

  return v3;
}

- (BOOL)_shouldForceRegenerateStickersIndexPathMap
{
  uint64_t v2 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"kCKCombinedStickerAppsIndexPathDictionaryV1Key");
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)saveWithNotification:(BOOL)a3
{
  BOOL v3 = a3;
  if (!CKIsRunningInCameraAppsClient())
  {
    BOOL v5 = [(CKBalloonPluginManager *)self hasLoadedExtensions];
    int v6 = IMOSLoggingEnabled();
    if (!v5)
    {
      if (!v6) {
        return;
      }
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Not saving to defaults as extensions haven't finished loading, we'd possible be stomping over user info", v17, 2u);
      }
      goto LABEL_16;
    }
    if (v6)
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Saving enabled states and ordering to user defaults.", buf, 2u);
      }
    }
    uint64_t v8 = [(CKBalloonPluginManager *)self pluginIndexPathMap];
    uint64_t v9 = [(CKBalloonPluginManager *)self _encodeIndexPathMap:v8];
    IMSetDomainValueForKey();

    uint64_t v10 = [(CKBalloonPluginManager *)self pluginVersionMap];
    IMSetDomainValueForKey();

    uint64_t v11 = [(CKBalloonPluginManager *)self pluginSeenMap];
    IMSetDomainValueForKey();

    uint64_t v12 = [(CKBalloonPluginManager *)self pluginLaunchTimeMap];
    IMSetDomainValueForKey();

    if (v3)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v15 = 0;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Broadcasting browser selection data source changed notification.", v15, 2u);
        }
      }
      uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 postNotificationName:@"CKBrowserSelectionControllerDataSourceChangedNotification" object:0];
LABEL_16:
    }
  }
}

- (void)saveCombinedAppsWithNotification:(BOOL)a3
{
  BOOL v3 = a3;
  if (!CKIsRunningInCameraAppsClient())
  {
    BOOL v5 = [(CKBalloonPluginManager *)self hasLoadedExtensions];
    int v6 = IMOSLoggingEnabled();
    if (!v5)
    {
      if (!v6) {
        return;
      }
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Not saving to combined sticker default as extensions haven't finished loading, we'd possible be stomping over user info", v14, 2u);
      }
      goto LABEL_16;
    }
    if (v6)
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Saving combined sticker apps ordering to user defaults.", buf, 2u);
      }
    }
    uint64_t v8 = [(CKBalloonPluginManager *)self combinedStickersAppsIndexPathMap];
    uint64_t v9 = [(CKBalloonPluginManager *)self _encodeIndexPathMap:v8];
    IMSetDomainValueForKey();

    if (v3)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Broadcasting combined sticker apps changed notification.", v12, 2u);
        }
      }
      uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 postNotificationName:@"CKCombinedStickerAppsOrderChangedNotification" object:0];
LABEL_16:
    }
  }
}

- (id)balloonPluginIdentifierForAppExtensionBundleIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F6CB88]])
  {
    BOOL v4 = [(id)*MEMORY[0x1E4F6CBE8] stringByAppendingFormat:@":%@:%@", @"0000000000", v3];
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:v3];
    uint64_t v6 = [v5 teamID];
    id v7 = (void *)v6;
    uint64_t v8 = @"0000000000";
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    uint64_t v9 = v8;

    uint64_t v10 = [v5 bundleIdentifier];
    uint64_t v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = (void *)v10;
    }
    else {
      uint64_t v12 = v3;
    }
    id v13 = v12;

    BOOL v4 = [(id)*MEMORY[0x1E4F6CBE8] stringByAppendingFormat:@":%@:%@", v9, v13];
  }

  return v4;
}

- (id)pluginForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__25;
  uint64_t v17 = __Block_byref_object_dispose__25;
  id v18 = 0;
  if ([v4 isEqualToString:@"com.apple.messages.browser.RecentPlugin"])
  {
    uint64_t v5 = [(id)objc_opt_class() recentPlugin];
LABEL_5:
    uint64_t v6 = (void *)v14[5];
    v14[5] = v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"com.apple.messages.browser.MorePlugin"])
  {
    uint64_t v5 = [(id)objc_opt_class() morePlugin];
    goto LABEL_5;
  }
  id v7 = [(CKBalloonPluginManager *)self allPlugins];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__CKBalloonPluginManager_pluginForIdentifier___block_invoke;
  v10[3] = &unk_1E56256F8;
  id v11 = v4;
  uint64_t v12 = &v13;
  [v7 enumerateObjectsUsingBlock:v10];

  uint64_t v6 = v11;
LABEL_7:

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __46__CKBalloonPluginManager_pluginForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 identifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)pluginForExtensionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__25;
  uint64_t v16 = __Block_byref_object_dispose__25;
  id v17 = 0;
  uint64_t v5 = [(CKBalloonPluginManager *)self allPlugins];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__CKBalloonPluginManager_pluginForExtensionIdentifier___block_invoke;
  v9[3] = &unk_1E56256F8;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__CKBalloonPluginManager_pluginForExtensionIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = [v8 extensionIdentifier];
  if ([v7 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)pluginForAdamID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__25;
  uint64_t v16 = __Block_byref_object_dispose__25;
  id v17 = 0;
  uint64_t v5 = [(CKBalloonPluginManager *)self allPlugins];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__CKBalloonPluginManager_pluginForAdamID___block_invoke;
  v9[3] = &unk_1E56256F8;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __42__CKBalloonPluginManager_pluginForAdamID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 adamID];
  int v8 = [v7 isEqualToNumber:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (NSCache)iconCache
{
  iconCache = self->_iconCache;
  if (!iconCache)
  {
    id v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    uint64_t v5 = self->_iconCache;
    self->_iconCache = v4;

    [(NSCache *)self->_iconCache setName:@"CKBalloonPluginManager icon cache"];
    iconCache = self->_iconCache;
  }

  return iconCache;
}

- (void)invalidateIconCache
{
  id v2 = [(CKBalloonPluginManager *)self iconCache];
  [v2 removeAllObjects];
}

- (NSMutableSet)prefetchIconKeys
{
  prefetchIconKeys = self->_prefetchIconKeys;
  if (!prefetchIconKeys)
  {
    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v5 = self->_prefetchIconKeys;
    self->_prefetchIconKeys = v4;

    prefetchIconKeys = self->_prefetchIconKeys;
  }

  return prefetchIconKeys;
}

- (CKPreviewDispatchCache)snapshotCache
{
  snapshotCache = self->_snapshotCache;
  if (!snapshotCache)
  {
    id v4 = objc_alloc_init(CKPreviewDispatchCache);
    uint64_t v5 = self->_snapshotCache;
    self->_snapshotCache = v4;

    [(CKPreviewDispatchCache *)self->_snapshotCache resume];
    snapshotCache = self->_snapshotCache;
  }

  return snapshotCache;
}

- (void)clearBalloonPluginCache
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v39 = [MEMORY[0x1E4F1C9C8] date];
  long long v40 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"LastIconCachePurgeDate");
  if (v40)
  {
    uint64_t v38 = [v39 dateByAddingTimeInterval:-86400.0];
    id v3 = (void *)v38;
    if ([v40 compare:v38] == -1)
    {
      if (IMOSLoggingEnabled())
      {
        id v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Clearing the balloon icon cache", buf, 2u);
        }
      }
      uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v6 = CKTranscriptPluginIconCachesFileURL();
      id v7 = [v6 path];
      int v8 = [v5 enumeratorAtPath:v7];

      id v9 = [v8 nextObject];
      if (v9)
      {
        *(void *)&long long v10 = 138412290;
        long long v37 = v10;
        do
        {
          long long v50 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v47 = 0u;
          id v11 = [(CKBalloonPluginManager *)self visibleRecentAppStripPlugins];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v54 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v48;
            while (2)
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v48 != v13) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v15 = [*(id *)(*((void *)&v47 + 1) + 8 * i) identifier];
                int v16 = [v15 isEqualToString:v9];

                if (v16)
                {
                  id v18 = [MEMORY[0x1E4F28CB8] defaultManager];
                  id v19 = CKTranscriptPluginIconCachesFileURL();
                  id v20 = [v19 path];
                  uint64_t v21 = [v20 stringByAppendingPathComponent:v9];
                  id v46 = 0;
                  [v18 removeItemAtPath:v21 error:&v46];
                  id v17 = v46;

                  goto LABEL_19;
                }
              }
              uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v54 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
          id v17 = 0;
LABEL_19:

          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          uint64_t v22 = [(CKBalloonPluginManager *)self visibleFavoriteAppStripPlugins];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v53 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v43;
            while (2)
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v43 != v24) {
                  objc_enumerationMutation(v22);
                }
                id v26 = [*(id *)(*((void *)&v42 + 1) + 8 * j) identifier];
                int v27 = [v26 isEqualToString:v9];

                if (v27)
                {
                  long long v28 = [MEMORY[0x1E4F28CB8] defaultManager];
                  long long v29 = CKTranscriptPluginIconCachesFileURL();
                  long long v30 = [v29 path];
                  uint64_t v31 = [v30 stringByAppendingPathComponent:v9];
                  id v41 = v17;
                  [v28 removeItemAtPath:v31 error:&v41];
                  id v32 = v41;

                  id v17 = v32;
                  goto LABEL_29;
                }
              }
              uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v53 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }
LABEL_29:

          if (v17 && IMOSLoggingEnabled())
          {
            v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v37;
              id v52 = v17;
              _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "Error clearing the balloon icon cache folder: %@", buf, 0xCu);
            }
          }
          uint64_t v34 = [v8 nextObject];

          id v9 = (void *)v34;
        }
        while (v34);
      }
      id v36 = [MEMORY[0x1E4F1C9C8] date];
      IMSetDomainValueForKey();

      id v3 = (void *)v38;
    }
  }
  else
  {
    __int16 v35 = [MEMORY[0x1E4F1C9C8] date];
    IMSetDomainValueForKey();
  }
}

- (NSArray)combinedStickerApps
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = objc_opt_new();
  BOOL v25 = objc_opt_new();
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v23 = [MEMORY[0x1E4F6BC18] sharedInstance];
  id v3 = [MEMORY[0x1E4F6BC18] sharedInstance];
  id v4 = [v3 allPlugins];
  [v2 addObjectsFromArray:v4];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v2;
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    uint64_t v8 = *MEMORY[0x1E4F6CB70];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        char v11 = [v10 presentationContexts];
        uint64_t v12 = [v10 identifier];
        if ([v12 hasSuffix:@"com.apple.messages.MSMessageExtensionBalloonPlugin:0000000000:com.apple.Stickers.UserGenerated.MessagesExtension"])
        {
          uint64_t v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
          char v14 = [v13 isClingEnabled] ^ 1;
        }
        else
        {
          char v14 = 0;
        }

        if ((v14 & 1) == 0 && (v11 & 2) != 0)
        {
          uint64_t v15 = [v10 identifier];
          char v16 = [v15 containsString:@"com.apple.FunCamera"];

          id v17 = [v10 identifier];
          char v18 = [v17 containsString:v8];

          if ((v16 & 1) == 0 && (v18 & 1) == 0)
          {
            id v19 = [v10 identifier];
            char v20 = [v19 hasSuffix:@"com.apple.messages.MSMessageExtensionBalloonPlugin:0000000000:com.apple.Stickers.UserGenerated.MessagesExtension"];

            if ((v20 & 1) == 0) {
              [v25 addObject:v10];
            }
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  [v24 addObjectsFromArray:v25];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F6BC00]) initWithIdentifier:@"com.apple.messages.browser.MorePlugin" browserDisplayName:@"MorePlugin" browserImageName:@"ellipsis.circle"];
  [v24 addObject:v21];
  [v23 insertPlugin:v21];

  return (NSArray *)v24;
}

- (BOOL)isInternalPlugin:(id)a3
{
  id v3 = [a3 identifier];
  char v4 = [v3 isEqualToString:@"com.apple.messages.browser.RecentPlugin"];

  return v4;
}

- (BOOL)hasLoadedExtensions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = self->_allPlugins;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    uint64_t v6 = *MEMORY[0x1E4F6D570];
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = objc_msgSend(v8, "extension", (void)v16);
          if (v9)
          {
            long long v10 = (void *)v9;
            char v11 = [v8 extension];
            uint64_t v12 = [v11 extensionPointIdentifier];
            char v13 = [v12 isEqualToString:v6];

            if (v13)
            {
              BOOL v14 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (NSArray)allPlugins
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  allPlugins = self->_allPlugins;
  if (allPlugins) {
    goto LABEL_59;
  }
  long long v50 = self;
  id v43 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v43 startTimingForKey:@"allPlugins"];
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Fetching all plugins from plugin manager.", buf, 2u);
    }
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = [(id)objc_opt_class() recentPlugin];
  if (v44) {
    [v5 addObject:v44];
  }
  uint64_t v6 = [MEMORY[0x1E4F6BC18] sharedInstance];
  uint64_t v7 = [v6 allPlugins];
  [v5 addObjectsFromArray:v7];

  long long v48 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (!v9)
  {

    goto LABEL_47;
  }
  long long v47 = 0;
  uint64_t v10 = *(void *)v52;
  uint64_t v11 = *MEMORY[0x1E4F6CBE8];
  uint64_t v49 = *MEMORY[0x1E4F6CBB0];
  uint64_t v45 = *MEMORY[0x1E4F6CB70];
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v52 != v10) {
        objc_enumerationMutation(v8);
      }
      char v13 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      BOOL v14 = [v13 identifier];
      char v15 = [v14 isEqualToString:v11];

      if ((v15 & 1) == 0)
      {
        if ([v13 showInBrowser])
        {
          long long v16 = [v13 browserDisplayName];
          if (v16)
          {
          }
          else if (![(CKBalloonPluginManager *)v50 isInternalPlugin:v13])
          {
            continue;
          }
        }
        int v17 = [v13 presentationContexts];
        if (IMIsRunningIniMessageAppsViewService()) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = CKIsRunningInCameraAppsClient() != 0;
        }
        long long v19 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v20 = [v19 isStickersAppEnabled];

        if (v20)
        {
          if ((v17 & 2) != 0 || !v18) {
            goto LABEL_34;
          }
          uint64_t v22 = [v13 identifier];
          uint64_t v23 = IMStickersExtensionIdentifier();
          char v24 = [v22 hasSuffix:v23];

          if (v24) {
            goto LABEL_34;
          }
        }
        else if ((v18 | v17))
        {
          BOOL v25 = (v17 & 2) == 0 && v18;
          if (!v25
            || ([v13 identifier],
                id v26 = objc_claimAutoreleasedReturnValue(),
                IMStickersExtensionIdentifier(),
                long long v27 = objc_claimAutoreleasedReturnValue(),
                int v28 = [v26 hasSuffix:v27],
                v27,
                v26,
                v28))
          {
LABEL_34:
            if (!IMIsRunningIniMessageAppsViewService()) {
              goto LABEL_37;
            }
            long long v29 = [v13 identifier];
            if (([v29 hasSuffix:v49] & 1) == 0)
            {
              char v30 = [v29 hasSuffix:v45];

              if (v30) {
                continue;
              }
LABEL_37:
              [v48 addObject:v13];
              long long v29 = [v13 identifier];
              [v46 addObject:v29];
              if ([v29 isEqualToString:@"com.apple.appstore.MessagesProvider"])
              {
                id v31 = v13;

                long long v47 = v31;
              }
              uint64_t v32 = [v13 identifier];
              BOOL v33 = [(CKBalloonPluginManager *)v50 isPluginEnabled:v32];

              if (v33) {
                [(CKBalloonPluginManager *)v50 _setSeen:1 forPlugin:v13];
              }
            }

            continue;
          }
        }
      }
    }
    uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
  }
  while (v9);

  if (v47)
  {
    objc_msgSend(v48, "removeObject:");
    [v48 insertObject:v47 atIndex:0];
    goto LABEL_48;
  }
LABEL_47:
  long long v47 = 0;
LABEL_48:
  uint64_t v34 = [(id)objc_opt_class() morePlugin];
  if (v34) {
    [v48 addObject:v34];
  }
  [(CKBalloonPluginManager *)v50 saveWithNotification:0];
  uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithArray:v48];
  id v36 = v50->_allPlugins;
  v50->_allPlugins = (NSArray *)v35;

  long long v37 = [(CKBalloonPluginManager *)v50 pluginIndexPathMap];
  BOOL v38 = [v37 count] == 0;

  if (v38) {
    [(CKBalloonPluginManager *)v50 regeneratePluginIndexPaths];
  }
  uint64_t v39 = [(CKBalloonPluginManager *)v50 combinedStickersAppsIndexPathMap];
  BOOL v40 = [v39 count] == 0;

  if (v40) {
    [(CKBalloonPluginManager *)v50 regenerateCombinedStickersAppsIndexPaths];
  }
  [v43 stopTimingForKey:@"allPlugins"];
  if (IMOSLoggingEnabled())
  {
    id v41 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v43;
      _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_INFO, "Loaded allPlugins, %@", buf, 0xCu);
    }
  }
  allPlugins = v50->_allPlugins;
LABEL_59:

  return allPlugins;
}

- (NSArray)allEnabledPlugins
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__CKBalloonPluginManager_allEnabledPlugins__block_invoke;
  v4[3] = &unk_1E5625720;
  v4[4] = self;
  id v2 = [(CKBalloonPluginManager *)self allPluginsPassingTest:v4];

  return (NSArray *)v2;
}

uint64_t __43__CKBalloonPluginManager_allEnabledPlugins__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 isPluginEnabled:v3];

  return v4;
}

- (NSArray)visiblePlugins
{
  if (!self->_visiblePlugins)
  {
    if (__CurrentTestName)
    {
      uint64_t v3 = [(CKBalloonPluginManager *)self createFakeAppsForPPTTesting:60];
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __40__CKBalloonPluginManager_visiblePlugins__block_invoke;
      v7[3] = &unk_1E5625720;
      v7[4] = self;
      uint64_t v3 = [(CKBalloonPluginManager *)self allPluginsPassingTest:v7];
    }
    visiblePlugins = self->_visiblePlugins;
    self->_visiblePlugins = v3;
  }
  id v5 = self->_visiblePlugins;

  return v5;
}

uint64_t __40__CKBalloonPluginManager_visiblePlugins__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEnabledAndVisible:a2];
}

- (id)createFakeAppsForPPTTesting:(unint64_t)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  if (a3)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = [NSString stringWithFormat:@"%@%d", @"Test", v5];
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F6BC00]) initWithIdentifier:v6 browserDisplayName:v6 browserImageName:@"Recents"];
      [v4 addObject:v7];

      ++v5;
    }
    while (a3 != v5);
  }

  return v4;
}

- (NSArray)visibleSwitcherPlugins
{
  visibleSwitcherPlugins = self->_visibleSwitcherPlugins;
  if (!visibleSwitcherPlugins)
  {
    uint64_t v4 = [(CKBalloonPluginManager *)self visibleDrawerPlugins];
    uint64_t v5 = self->_visibleSwitcherPlugins;
    self->_visibleSwitcherPlugins = v4;

    uint64_t v6 = [(NSArray *)self->_visibleSwitcherPlugins lastObject];
    uint64_t v7 = [v6 identifier];
    int v8 = [v7 isEqualToString:@"com.apple.messages.browser.MorePlugin"];

    visibleSwitcherPlugins = self->_visibleSwitcherPlugins;
    if (v8)
    {
      -[NSArray subarrayWithRange:](visibleSwitcherPlugins, "subarrayWithRange:", 0, [(NSArray *)self->_visibleSwitcherPlugins count] - 1);
      uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = self->_visibleSwitcherPlugins;
      self->_visibleSwitcherPlugins = v9;

      visibleSwitcherPlugins = self->_visibleSwitcherPlugins;
    }
  }

  return visibleSwitcherPlugins;
}

- (id)allPluginsPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKBalloonPluginManager *)self allPlugins];
  uint64_t v6 = objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v4);

  return v6;
}

- (NSArray)disabledPlugins
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v4 = [v3 isClingEnabled];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__CKBalloonPluginManager_disabledPlugins__block_invoke;
    v7[3] = &unk_1E5625720;
    v7[4] = self;
    uint64_t v5 = [(CKBalloonPluginManager *)self allPluginsPassingTest:v7];
  }

  return (NSArray *)v5;
}

uint64_t __41__CKBalloonPluginManager_disabledPlugins__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 isPluginEnabled:v3] ^ 1;

  return v4;
}

- (unint64_t)launchStatusForPlugin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 proxy];
    uint64_t v6 = [v5 containingBundle];
    uint64_t v7 = [v6 applicationType];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F22390]];

    if (v8
      && ([v4 version],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 isEqualToString:*MEMORY[0x1E4F6B880]],
          v9,
          (v10 & 1) == 0))
    {
      pluginVersionMap = self->_pluginVersionMap;
      char v13 = [v4 identifier];
      BOOL v14 = [(NSDictionary *)pluginVersionMap objectForKeyedSubscript:v13];
      char v15 = [v4 version];
      unsigned int v16 = [v14 isEqualToString:v15];

      unint64_t v11 = v16;
    }
    else
    {
      unint64_t v11 = 1;
    }
  }
  else
  {
    unint64_t v11 = 1;
  }

  return v11;
}

- (void)updateLaunchStatus:(unint64_t)a3 forPlugin:(id)a4 withNotification:(BOOL)a5
{
  if (a3 == 1 && a4)
  {
    BOOL v6 = a5;
    pluginVersionMap = self->_pluginVersionMap;
    id v9 = a4;
    id v14 = (id)[(NSDictionary *)pluginVersionMap mutableCopy];
    char v10 = [v9 version];
    unint64_t v11 = [v9 identifier];

    [v14 setObject:v10 forKeyedSubscript:v11];
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v14];
    char v13 = self->_pluginVersionMap;
    self->_pluginVersionMap = v12;

    [(CKBalloonPluginManager *)self saveWithNotification:v6];
  }
}

- (void)updateLaunchTimeForPlugin:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v10 = [v4 date];
  BOOL v6 = [(CKBalloonPluginManager *)self pluginLaunchTimeMap];
  uint64_t v7 = (void *)[v6 mutableCopy];

  int v8 = [v5 identifier];

  [v7 setObject:v10 forKeyedSubscript:v8];
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];
  [(CKBalloonPluginManager *)self setPluginLaunchTimeMap:v9];

  [(CKBalloonPluginManager *)self saveWithNotification:0];
}

- (id)launchTimeForPlugin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:@"com.apple.messages.browser.RecentPlugin"];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  else
  {
    int v8 = [(CKBalloonPluginManager *)self pluginLaunchTimeMap];
    id v9 = [v4 identifier];
    uint64_t v7 = [v8 objectForKey:v9];
  }

  return v7;
}

- (unint64_t)badgeValueForPlugin:(id)a3
{
  return 0;
}

- (BOOL)isPluginSeen:(id)a3
{
  id v4 = a3;
  id v5 = [(CKBalloonPluginManager *)self pluginSeenMap];
  int v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)isPluginSeenWithInstalledVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(CKBalloonPluginManager *)self pluginSeenMap];
  int v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [(CKBalloonPluginManager *)self pluginForIdentifier:v4];
    int v8 = v7;
    if (v7)
    {
      id v9 = [v7 version];
      BOOL v10 = [v9 compare:v6 options:64] != 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)setSeen:(BOOL)a3 forPlugin:(id)a4
{
  BOOL v4 = a3;
  int v6 = [(CKBalloonPluginManager *)self pluginForIdentifier:a4];
  if (v6)
  {
    uint64_t v7 = v6;
    [(CKBalloonPluginManager *)self _setSeen:v4 forPlugin:v6];
    [(CKBalloonPluginManager *)self saveWithNotification:0];
    int v6 = v7;
  }
}

- (void)_setSeen:(BOOL)a3 forPlugin:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  int v6 = [(CKBalloonPluginManager *)self pluginSeenMap];
  uint64_t v7 = (void *)[v6 mutableCopy];

  if (v4)
  {
    int v8 = [v11 version];
    id v9 = [v11 identifier];
    [v7 setObject:v8 forKeyedSubscript:v9];
  }
  else
  {
    int v8 = [v11 identifier];
    [v7 removeObjectForKey:v8];
  }

  BOOL v10 = (void *)[v7 copy];
  [(CKBalloonPluginManager *)self setPluginSeenMap:v10];
}

- (void)cleanSeenMap
{
  uint64_t v3 = [(CKBalloonPluginManager *)self allPlugins];
  id v10 = [v3 arrayByApplyingSelector:sel_identifier];

  BOOL v4 = [(CKBalloonPluginManager *)self pluginSeenMap];
  id v5 = [v4 allKeys];

  int v6 = [v5 arrayByExcludingObjectsInArray:v10];
  if ([v6 count])
  {
    uint64_t v7 = [(CKBalloonPluginManager *)self pluginSeenMap];
    int v8 = (void *)[v7 mutableCopy];

    [v8 removeObjectsForKeys:v6];
    id v9 = (void *)[v8 copy];
    [(CKBalloonPluginManager *)self setPluginSeenMap:v9];
  }
}

- (unint64_t)unseenPluginCount
{
  uint64_t v3 = [(CKBalloonPluginManager *)self allPlugins];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CKBalloonPluginManager_unseenPluginCount__block_invoke;
  v7[3] = &unk_1E5625720;
  v7[4] = self;
  BOOL v4 = objc_msgSend(v3, "__imArrayByFilteringWithBlock:", v7);

  unint64_t v5 = [v4 count];
  return v5;
}

uint64_t __43__CKBalloonPluginManager_unseenPluginCount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  unint64_t v5 = [v3 identifier];
  if ([v4 isPluginSeenWithInstalledVersion:v5])
  {
    char isKindOfClass = 0;
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    int v8 = [v3 identifier];
    if ([v7 isPluginVisible:v8])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  return isKindOfClass & 1;
}

- (void)setAppStoreAutoEnableToggled:(BOOL)a3
{
  if (self->_appStoreAutoEnableToggled != a3)
  {
    self->_appStoreAutoEnableToggled = a3;
    [(CKBalloonPluginManager *)self isAppStoreAutoEnableToggled];
    IMSetDomainBoolForKey();
  }
}

- (void)handleManagedConfigSettingsChangeNotification:(id)a3
{
  BOOL isAppInstallationEnabled = self->_isAppInstallationEnabled;
  BOOL isAppRemovalEnabled = self->_isAppRemovalEnabled;
  int isCameraAllowed = self->_isCameraAllowed;
  uint64_t v7 = (void *)MEMORY[0x192FBA860](@"MCProfileConnection", @"ManagedConfiguration", a3);
  if (!handleManagedConfigSettingsChangeNotification____CKMCFeatureAppInstallationAllowed)
  {
    int v8 = (void **)MEMORY[0x192FBA870]("MCFeatureAppInstallationAllowed", @"ManagedConfiguration");
    if (v8) {
      id v9 = *v8;
    }
    else {
      id v9 = 0;
    }
    objc_storeStrong((id *)&handleManagedConfigSettingsChangeNotification____CKMCFeatureAppInstallationAllowed, v9);
  }
  if (!handleManagedConfigSettingsChangeNotification____CKMCFeatureAppRemovalAllowed)
  {
    id v10 = (void **)MEMORY[0x192FBA870]("MCFeatureAppRemovalAllowed", @"ManagedConfiguration");
    if (v10) {
      id v11 = *v10;
    }
    else {
      id v11 = 0;
    }
    objc_storeStrong((id *)&handleManagedConfigSettingsChangeNotification____CKMCFeatureAppRemovalAllowed, v11);
  }
  if (!handleManagedConfigSettingsChangeNotification____CKMCFeatureCameraAllowed)
  {
    uint64_t v12 = (void **)MEMORY[0x192FBA870]("MCFeatureCameraAllowed", @"ManagedConfiguration");
    if (v12) {
      char v13 = *v12;
    }
    else {
      char v13 = 0;
    }
    objc_storeStrong((id *)&handleManagedConfigSettingsChangeNotification____CKMCFeatureCameraAllowed, v13);
  }
  id v14 = [v7 sharedConnection];
  BOOL v15 = [v14 effectiveBoolValueForSetting:handleManagedConfigSettingsChangeNotification____CKMCFeatureAppInstallationAllowed] != 2;

  self->_BOOL isAppInstallationEnabled = v15;
  unsigned int v16 = [v7 sharedConnection];
  BOOL v17 = [v16 effectiveBoolValueForSetting:handleManagedConfigSettingsChangeNotification____CKMCFeatureAppRemovalAllowed] != 2;

  self->_BOOL isAppRemovalEnabled = v17;
  BOOL v18 = [v7 sharedConnection];
  int v19 = [v18 effectiveBoolValueForSetting:handleManagedConfigSettingsChangeNotification____CKMCFeatureCameraAllowed] != 2;

  self->_int isCameraAllowed = v19;
  if (isAppInstallationEnabled != self->_isAppInstallationEnabled
    || isAppRemovalEnabled != self->_isAppRemovalEnabled
    || isCameraAllowed != v19)
  {
    id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 postNotificationName:@"CKBrowserSelectionControllerDataSourceChangedNotification" object:0];
  }
}

- (BOOL)isPluginVisible:(id)a3
{
  BOOL v4 = [(CKBalloonPluginManager *)self pluginForIdentifier:a3];
  if (v4) {
    BOOL v5 = [(CKBalloonPluginManager *)self isBalloonPluginVisible:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isBalloonPluginVisible:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 identifier];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F6CBF8]];

  if (v6) {
    goto LABEL_2;
  }
  int v8 = [v4 identifier];
  char v9 = [v8 isEqualToString:@"com.apple.messages.browser.RecentPlugin"];

  if (v9)
  {
LABEL_4:
    BOOL v7 = 1;
    goto LABEL_14;
  }
  if (CKIsSendMenuEnabled())
  {
    if ([v4 showInSendMenu])
    {
LABEL_9:
      id v10 = [v4 identifier];
      int v11 = [v10 hasSuffix:*MEMORY[0x1E4F6CB68]];

      if (v11)
      {
        BOOL v12 = [(CKBalloonPluginManager *)self _shouldShowActivity];
      }
      else
      {
        char v13 = [v4 identifier];
        int v14 = [v13 hasSuffix:*MEMORY[0x1E4F6CC30]];

        if (!v14) {
          goto LABEL_4;
        }
        BOOL v12 = [(CKBalloonPluginManager *)self _shouldShowSURF];
      }
      BOOL v7 = v12;
      goto LABEL_14;
    }
  }
  else if ([v4 showInBrowser])
  {
    goto LABEL_9;
  }
LABEL_2:
  BOOL v7 = 0;
LABEL_14:

  return v7;
}

- (BOOL)_shouldShowActivity
{
  if (!_shouldShowActivity__kHKHealthdBundleIdentifier)
  {
    id v2 = (void **)MEMORY[0x192FBA870]("kHKHealthdBundleIdentifier", @"HealthKit");
    if (v2) {
      id v3 = *v2;
    }
    else {
      id v3 = 0;
    }
    objc_storeStrong((id *)&_shouldShowActivity__kHKHealthdBundleIdentifier, v3);
  }
  CFStringRef v4 = (const __CFString *)_shouldShowActivity__kHKAchievementStickersAvailableKey;
  if (!_shouldShowActivity__kHKAchievementStickersAvailableKey)
  {
    BOOL v5 = (void **)MEMORY[0x192FBA870]("kHKAchievementStickersAvailableKey", @"HealthKit");
    if (v5) {
      char v6 = *v5;
    }
    else {
      char v6 = 0;
    }
    objc_storeStrong((id *)&_shouldShowActivity__kHKAchievementStickersAvailableKey, v6);
    CFStringRef v4 = (const __CFString *)_shouldShowActivity__kHKAchievementStickersAvailableKey;
  }
  BOOL v7 = (void *)CFPreferencesCopyValue(v4, (CFStringRef)_shouldShowActivity__kHKHealthdBundleIdentifier, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  char v8 = [v7 BOOLValue];

  return v8;
}

- (NSMutableDictionary)activeBrowsers
{
  activeBrowsers = self->_activeBrowsers;
  if (!activeBrowsers)
  {
    CFStringRef v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v5 = self->_activeBrowsers;
    self->_activeBrowsers = v4;

    activeBrowsers = self->_activeBrowsers;
  }

  return activeBrowsers;
}

- (void)setAllPlugins:(id)a3
{
}

- (void)setVisiblePlugins:(id)a3
{
}

- (void)setVisibleSwitcherPlugins:(id)a3
{
}

- (void)setIconCache:(id)a3
{
}

- (void)setSnapshotCache:(id)a3
{
}

- (void)setPrefetchIconKeys:(id)a3
{
}

- (BOOL)isAppInstallationEnabled
{
  return self->_isAppInstallationEnabled;
}

- (void)setIsAppInstallationEnabled:(BOOL)a3
{
  self->_BOOL isAppInstallationEnabled = a3;
}

- (BOOL)isAppRemovalEnabled
{
  return self->_isAppRemovalEnabled;
}

- (void)setIsAppRemovalEnabled:(BOOL)a3
{
  self->_BOOL isAppRemovalEnabled = a3;
}

- (BOOL)isCameraAllowed
{
  return self->_isCameraAllowed;
}

- (void)setIsCameraAllowed:(BOOL)a3
{
  self->_int isCameraAllowed = a3;
}

- (BOOL)isAppStoreAutoEnableToggled
{
  return self->_appStoreAutoEnableToggled;
}

- (UIViewController)lastUsedPhotoViewController
{
  return self->_lastUsedPhotoViewController;
}

- (void)setLastUsedPhotoViewController:(id)a3
{
}

- (NSArray)cachedPotentiallyVisiblePlugins
{
  return self->_cachedPotentiallyVisiblePlugins;
}

- (void)setCachedPotentiallyVisiblePlugins:(id)a3
{
}

- (NSArray)favoriteAppStripPlugins
{
  return self->_favoriteAppStripPlugins;
}

- (void)setFavoriteAppStripPlugins:(id)a3
{
}

- (NSHashTable)currentExtensionConsumers
{
  return self->_currentExtensionConsumers;
}

- (void)setCurrentExtensionConsumers:(id)a3
{
}

- (NSDictionary)pluginVersionMap
{
  return self->_pluginVersionMap;
}

- (void)setPluginVersionMap:(id)a3
{
}

- (NSDictionary)pluginSeenMap
{
  return self->_pluginSeenMap;
}

- (void)setPluginSeenMap:(id)a3
{
}

- (void)setPluginIndexPathMap:(id)a3
{
}

- (NSMutableDictionary)historicalPluginIndexPathMap
{
  return self->_historicalPluginIndexPathMap;
}

- (void)setHistoricalPluginIndexPathMap:(id)a3
{
}

- (NSMutableArray)MRUPluginInteractionList
{
  return self->_MRUPluginInteractionList;
}

- (void)setMRUPluginInteractionList:(id)a3
{
}

- (NSDictionary)pluginLaunchTimeMap
{
  return self->_pluginLaunchTimeMap;
}

- (void)setPluginLaunchTimeMap:(id)a3
{
}

- (void)setCombinedStickersAppsIndexPathMap:(id)a3
{
}

- (BOOL)isKeepingEmptySections
{
  return self->_keepingEmptySections;
}

- (void)setKeepingEmptySections:(BOOL)a3
{
  self->_keepingEmptySections = a3;
}

- (int64_t)numberOfSectionsToKeep
{
  return self->_numberOfSectionsToKeep;
}

- (void)setNumberOfSectionsToKeep:(int64_t)a3
{
  self->_numberOfSectionsToKeep = a3;
}

- (NSMutableArray)visibleInstallations
{
  return self->_visibleInstallations;
}

- (void)setVisibleInstallations:(id)a3
{
}

- (BOOL)isAppInstallationObserver
{
  return self->_isAppInstallationObserver;
}

- (void)setIsAppInstallationObserver:(BOOL)a3
{
  self->_isAppInstallationObserver = a3;
}

- (NSSet)oldVisibleSwitcherPluginIdentifiers
{
  return self->_oldVisibleSwitcherPluginIdentifiers;
}

- (void)setOldVisibleSwitcherPluginIdentifiers:(id)a3
{
}

- (void)setActiveBrowsers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeBrowsers, 0);
  objc_storeStrong((id *)&self->_oldVisibleSwitcherPluginIdentifiers, 0);
  objc_storeStrong((id *)&self->_visibleInstallations, 0);
  objc_storeStrong((id *)&self->_combinedStickersAppsIndexPathMap, 0);
  objc_storeStrong((id *)&self->_pluginLaunchTimeMap, 0);
  objc_storeStrong((id *)&self->_MRUPluginInteractionList, 0);
  objc_storeStrong((id *)&self->_historicalPluginIndexPathMap, 0);
  objc_storeStrong((id *)&self->_pluginIndexPathMap, 0);
  objc_storeStrong((id *)&self->_pluginSeenMap, 0);
  objc_storeStrong((id *)&self->_pluginVersionMap, 0);
  objc_storeStrong((id *)&self->_currentExtensionConsumers, 0);
  objc_storeStrong((id *)&self->_favoriteAppStripPlugins, 0);
  objc_storeStrong((id *)&self->_cachedPotentiallyVisiblePlugins, 0);
  objc_storeStrong((id *)&self->_lastUsedPhotoViewController, 0);
  objc_storeStrong((id *)&self->_prefetchIconKeys, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_visiblePlugins, 0);
  objc_storeStrong((id *)&self->_allPlugins, 0);
  objc_storeStrong((id *)&self->_visibleRecentAppStripPlugins, 0);
  objc_storeStrong((id *)&self->_recentAppStripPlugins, 0);
  objc_storeStrong((id *)&self->_visibleSwitcherPlugins, 0);
  objc_storeStrong((id *)&self->_visibleAppStripPlugins, 0);

  objc_storeStrong((id *)&self->_appStripCandidatePlugins, 0);
}

- (void)prepareForSuspend
{
  id v3 = [(CKBalloonPluginManager *)self currentExtensionConsumers];
  [v3 removeAllObjects];

  if (!CKIsRunningInMessagesViewService() && !CKIsRunningInMessagesNotificationExtension())
  {
    [(CKBalloonPluginManager *)self forceTearDownRemoteViewsSkippingCameraApp:1];
    [(CKBalloonPluginManager *)self forceKillRemoteExtensionsWithDelay:1 skipCameraApp:1];
  }
}

- (void)forceKillRemoteExtensionsWithDelay:(BOOL)a3
{
}

- (void)forceKillRemoteExtensionsWithDelay:(BOOL)a3 skipCameraApp:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__CKBalloonPluginManager_ViewControllerFactory__forceKillRemoteExtensionsWithDelay_skipCameraApp___block_invoke;
  v10[3] = &unk_1E5622A18;
  void v10[4] = self;
  BOOL v11 = a4;
  BOOL v5 = (void (**)(void))_Block_copy(v10);
  char v6 = +[CKPluginExtensionStateObserver sharedInstance];
  int v7 = [v6 stickerDragActiveInCurrentProcess];

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      char v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        char v13 = @"YES";
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Not allowing force kill of extension (stickerDragActive: %@).", buf, 0xCu);
      }
    }
  }
  else if (v4)
  {
    dispatch_time_t v9 = dispatch_time(0, 100000000);
    dispatch_after(v9, MEMORY[0x1E4F14428], v5);
  }
  else
  {
    v5[2](v5);
  }
}

void __98__CKBalloonPluginManager_ViewControllerFactory__forceKillRemoteExtensionsWithDelay_skipCameraApp___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "forceKill of plugins in cache", buf, 2u);
    }
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v3 = [*(id *)(a1 + 32) activeBrowsers];
  obuint64_t j = [v3 allValues];

  uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v38;
    *(void *)&long long v5 = 138412290;
    long long v30 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(obj);
        }
        char v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (!*(unsigned char *)(a1 + 40)) {
          goto LABEL_12;
        }
        dispatch_time_t v9 = [*(id *)(*((void *)&v37 + 1) + 8 * i) balloonPlugin];
        id v10 = [v9 identifier];
        BOOL v11 = IMBalloonExtensionIDWithSuffix();
        char v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0)
        {
LABEL_12:
          if (objc_opt_respondsToSelector())
          {
            if (IMOSLoggingEnabled())
            {
              char v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                uint64_t v14 = [v8 balloonPlugin];
                BOOL v15 = [v14 identifier];
                *(_DWORD *)buf = v30;
                long long v42 = v15;
                _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Killing extension process with bundle ID %@", buf, 0xCu);
              }
            }
            objc_msgSend(v8, "killExtensionProcess", v30);
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v4);
  }

  uint64_t v32 = [*(id *)(a1 + 32) bundleIdentifiersForCurrentExtensionConsumers];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unsigned int v16 = [*(id *)(a1 + 32) allPlugins];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v16);
        }
        id v20 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        if (*(unsigned char *)(a1 + 40))
        {
          uint64_t v21 = [*(id *)(*((void *)&v33 + 1) + 8 * j) identifier];
          uint64_t v22 = IMBalloonExtensionIDWithSuffix();
          char v23 = [v21 isEqualToString:v22];

          if (v23) {
            continue;
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v24 = [v20 identifier];
          char v25 = [v32 containsObject:v24];

          if ((v25 & 1) == 0)
          {
            id v26 = v20;
            if ((IMGetDomainBoolForKey() & 1) == 0)
            {
              if (IMOSLoggingEnabled())
              {
                long long v27 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  int v28 = [v26 identifier];
                  *(_DWORD *)buf = 138412546;
                  long long v42 = v28;
                  __int16 v43 = 2112;
                  long long v44 = v32;
                  _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Killing plugin extension with bundle ID %@. consumedBundleIdentifiers %@", buf, 0x16u);
                }
              }
              long long v29 = objc_msgSend(v26, "extension", v30);
              [v29 _kill:9];
            }
          }
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v17);
  }
}

- (void)forceKillNonCameraRemoteExtensionsImmediately
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [(CKBalloonPluginManager *)self activeBrowsers];
  id v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        dispatch_time_t v9 = [v8 balloonPlugin];
        id v10 = [v9 identifier];

        BOOL v11 = IMBalloonExtensionIDWithSuffix();
        if ([v10 isEqualToString:v11])
        {
        }
        else
        {
          char v12 = objc_opt_respondsToSelector();

          if (v12) {
            [v8 killExtensionProcess];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (id)bundleIdentifiersForCurrentExtensionConsumers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(CKBalloonPluginManager *)self currentExtensionConsumers];
  uint64_t v5 = [v4 objectEnumerator];

  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    *(void *)&long long v7 = 138412546;
    long long v15 = v7;
    do
    {
      if (objc_opt_respondsToSelector())
      {
        char v8 = [v6 consumingBundleIdentifiers];
        [v3 addObjectsFromArray:v8];

        if (IMOSLoggingEnabled())
        {
          dispatch_time_t v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            uint64_t v17 = v6;
            __int16 v18 = 2112;
            id v19 = v3;
            _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "following consumed extensions in use by %@ won't be killed: %@", buf, 0x16u);
          }
LABEL_11:
        }
      }
      else if (IMOSLoggingEnabled())
      {
        dispatch_time_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v6;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "currentExtensionConsumer doesn't conform to CKExtensionConsumer protocol %@", buf, 0xCu);
        }
        goto LABEL_11;
      }
      uint64_t v10 = objc_msgSend(v5, "nextObject", v15);

      uint64_t v6 = (void *)v10;
    }
    while (v10);
  }
  BOOL v11 = IMBalloonExtensionIDWithSuffix();
  int v12 = [v3 containsObject:v11];

  if (v12)
  {
    long long v13 = IMBalloonExtensionIDWithSuffix();
    [v3 addObject:v13];
  }

  return v3;
}

- (void)forceTearDownRemoteViewsSkippingCameraApp:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "forceTearDownRemoteViews of plugins in cache", buf, 2u);
    }
  }
  uint64_t v6 = [(CKBalloonPluginManager *)self bundleIdentifiersForCurrentExtensionConsumers];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v7 = [(CKBalloonPluginManager *)self activeBrowsers];
  obuint64_t j = [v7 allValues];

  uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v32;
    *(void *)&long long v9 = 138412290;
    long long v29 = v9;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
        if (!v3) {
          goto LABEL_12;
        }
        long long v13 = [*(id *)(*((void *)&v31 + 1) + 8 * v11) balloonPlugin];
        long long v14 = [v13 identifier];
        long long v15 = IMBalloonExtensionIDWithSuffix();
        char v16 = [v14 isEqualToString:v15];

        if ((v16 & 1) == 0)
        {
LABEL_12:
          uint64_t v17 = objc_msgSend(v12, "balloonPlugin", v29);
          __int16 v18 = [v17 identifier];
          int v19 = [v6 containsObject:v18];

          if (v19)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v20 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                uint64_t v21 = [v12 balloonPlugin];
                uint64_t v22 = [v21 identifier];
                *(_DWORD *)buf = v29;
                long long v36 = v22;
                _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "forceTearDownRemoteViews skipped for %@ because it is currently in use", buf, 0xCu);
              }
            }
          }
          else if (objc_opt_respondsToSelector())
          {
            if (IMOSLoggingEnabled())
            {
              char v23 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                char v24 = [v12 balloonPlugin];
                char v25 = [v24 identifier];
                *(_DWORD *)buf = v29;
                long long v36 = v25;
                _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "forceTearDownRemoteViews calling deferredForceTearDownRemoteView for %@", buf, 0xCu);
              }
            }
            [v12 deferredForceTearDownRemoteView];
          }
          else if (objc_opt_respondsToSelector())
          {
            if (IMOSLoggingEnabled())
            {
              id v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                long long v27 = [v12 balloonPlugin];
                int v28 = [v27 identifier];
                *(_DWORD *)buf = v29;
                long long v36 = v28;
                _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "forceTearDownRemoteViews calling forceTearDownRemoteView for %@", buf, 0xCu);
              }
            }
            [v12 forceTearDownRemoteView];
          }
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v8);
  }
}

- (void)invalidateAllActivePlugins
{
}

- (void)invalidateAllActivePluginsSkippingCameraApp:(BOOL)a3
{
  BOOL v3 = a3;
  uint8_t v36[16] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[CKPluginExtensionStateObserver sharedInstance];
  int v6 = [v5 passKitUIPresented];

  long long v7 = +[CKPluginExtensionStateObserver sharedInstance];
  int v8 = [v7 stickerDragActiveInCurrentProcess];

  int v9 = IMOSLoggingEnabled();
  if (((v6 | v8) & 1) == 0)
  {
    if (v9)
    {
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Removing all active browser plugins from cache", (uint8_t *)&v32, 2u);
      }
    }
    [(CKBalloonPluginManager *)self forceTearDownRemoteViewsSkippingCameraApp:v3];
    long long v14 = [(CKBalloonPluginManager *)self activeBrowsers];
    long long v15 = (void *)[v14 copy];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v27 = v15;
    uint64_t v16 = [v27 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (!v16)
    {
LABEL_28:

      return;
    }
    uint64_t v17 = *(void *)v29;
LABEL_17:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v29 != v17) {
        objc_enumerationMutation(v27);
      }
      int v19 = *(void **)(*((void *)&v28 + 1) + 8 * v18);
      if (v3)
      {
        uint64_t v20 = IMBalloonExtensionIDWithSuffix();
        char v21 = [v19 isEqualToString:v20];

        if (v21) {
          goto LABEL_26;
        }
      }
      else
      {
        uint64_t v22 = IMBalloonExtensionIDWithSuffix();
        int v23 = [v19 isEqualToString:v22];

        if (v23)
        {
          char v24 = [(CKBalloonPluginManager *)self activeBrowsers];
          char v25 = [v24 objectForKey:v19];
          [(CKBalloonPluginManager *)self setLastUsedPhotoViewController:v25];
        }
      }
      id v26 = [(CKBalloonPluginManager *)self activeBrowsers];
      [v26 removeObjectForKey:v19];

LABEL_26:
      if (v16 == ++v18)
      {
        uint64_t v16 = [v27 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (!v16) {
          goto LABEL_28;
        }
        goto LABEL_17;
      }
    }
  }
  if (v9)
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = @"NO";
      if (v6) {
        int v12 = @"YES";
      }
      else {
        int v12 = @"NO";
      }
      if (v8) {
        uint64_t v11 = @"YES";
      }
      int v32 = 138412546;
      long long v33 = v12;
      __int16 v34 = 2112;
      long long v35 = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Not allowing invalidation (passKitPresented: %@, stickerDragActive: %@), maintaining browser plugin cache", (uint8_t *)&v32, 0x16u);
    }
  }
}

- (void)_invalidatePluginForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Invalidating plugin for key %@", (uint8_t *)&v9, 0xCu);
    }
  }
  int v6 = [(CKBalloonPluginManager *)self activeBrowsers];
  long long v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      [v7 forceTearDownRemoteView];
    }
    int v8 = [(CKBalloonPluginManager *)self activeBrowsers];
    [v8 removeObjectForKey:v4];
  }
}

- (id)browserSnapshotForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKBalloonPluginManager *)self snapshotCache];
  int v6 = [v4 stringValue];
  long long v7 = [v5 cachedPreviewForKey:v6];

  if (!v7)
  {
    int v8 = [v4 stringValue];
    int v9 = CKBrowserSnapshotPreviewURL(v8, @"png");

    if (v9)
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v9 options:1 error:0];
      if (v10)
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F42A80];
        int v12 = [MEMORY[0x1E4F42D90] mainScreen];
        [v12 scale];
        long long v13 = objc_msgSend(v11, "imageWithData:scale:", v10);

        long long v7 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v13];
        long long v14 = [(CKBalloonPluginManager *)self snapshotCache];
        long long v15 = [v4 stringValue];
        [v14 setCachedPreview:v7 key:v15];

        uint64_t v16 = [(CKBalloonPluginManager *)self snapshotCache];
        uint64_t v17 = [v4 keyWithOppositeInterfaceStyle];
        uint64_t v18 = [v17 stringValue];
        [v16 setCachedPreview:0 key:v18];
      }
      else
      {
        long long v7 = 0;
      }
    }
    else
    {
      long long v7 = 0;
    }
  }

  return v7;
}

- (void)updateSnapshotForBrowserViewController:(id)a3 currentBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [v10 startTimingForKey:@"updateSnapshotForViewController:"];
    uint64_t v11 = [v9 view];
    int v12 = [v9 balloonPlugin];
    long long v13 = [v12 identifier];

    long long v14 = [v11 traitCollection];
    long long v15 = +[CKSnapshotCacheKey keyWithIdentifier:interfaceStyle:bounds:](CKSnapshotCacheKey, "keyWithIdentifier:interfaceStyle:bounds:", v13, [v14 userInterfaceStyle], x, y, width, height);

    uint64_t v16 = [v11 snapshotViewAfterScreenUpdates:0];
    uint64_t v17 = [(CKBalloonPluginManager *)self snapshotCache];
    uint64_t v18 = [v15 keyWithOppositeInterfaceStyle];
    int v19 = [v18 stringValue];
    [v17 setCachedPreview:0 key:v19];

    uint64_t v20 = [(CKBalloonPluginManager *)self snapshotCache];
    char v21 = [v15 stringValue];
    [v20 setCachedPreview:v16 key:v21];

    uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 postNotificationName:@"CKBalloonPluginManagerSnapshotsDidChange" object:0];

    [v10 stopTimingForKey:@"updateSnapshotForViewController:"];
    if (IMOSLoggingEnabled())
    {
      int v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        id v25 = v10;
        _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Finished updateSnapshotForViewController:, %@", (uint8_t *)&v24, 0xCu);
      }
    }
  }
}

- (id)newViewControllerForPluginIdentifier:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CKBalloonPluginManager *)self pluginForIdentifier:v6];
  id v9 = (void *)[v8 browserClass];
  int v10 = [v9 instancesRespondToSelector:sel_initWithBalloonPlugin_dataSource_];
  id v11 = objc_alloc((Class)v9);
  if (v10) {
    uint64_t v12 = [v11 initWithBalloonPlugin:v8 dataSource:v7];
  }
  else {
    uint64_t v12 = [v11 initWithBalloonPlugin:v8];
  }
  long long v13 = (void *)v12;
  if (v12)
  {
    long long v14 = [(CKBalloonPluginManager *)self activeBrowsers];
    [v14 setObject:v13 forKey:v6];
  }
  return v13;
}

- (id)viewControllerForPluginIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKBalloonPluginManager *)self existingViewControllerForPluginIdentifier:v4];
  if (!v5)
  {
    uint64_t v5 = [(CKBalloonPluginManager *)self viewControllerForPluginIdentifier:v4 dataSource:0];
  }

  return v5;
}

- (id)existingViewControllerForPluginIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKBalloonPluginManager *)self activeBrowsers];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = IMBalloonExtensionIDWithSuffix();
    int v8 = [v4 isEqualToString:v7];

    if (v8)
    {
      id v6 = [(CKBalloonPluginManager *)self lastUsedPhotoViewController];
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (id)viewControllerForPluginIdentifier:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKBalloonPluginManager *)self existingViewControllerForPluginIdentifier:v6];
  if (objc_opt_respondsToSelector())
  {
    int v9 = [v8 canReplaceDataSource];
    if (!v8) {
      goto LABEL_13;
    }
  }
  else
  {
    int v9 = 0;
    if (!v8)
    {
LABEL_13:
      id v8 = [(CKBalloonPluginManager *)self newViewControllerForPluginIdentifier:v6 dataSource:v7];
      goto LABEL_14;
    }
  }
  id v10 = [v8 balloonPluginDataSource];
  if (v10 == v7) {
    char v11 = 1;
  }
  else {
    char v11 = v9;
  }

  if ((v11 & 1) == 0)
  {
    [(CKBalloonPluginManager *)self _invalidatePluginForKey:v6];

    goto LABEL_13;
  }
  if (v9)
  {
    id v12 = [v8 balloonPluginDataSource];

    if (v12 != v7) {
      [v8 setBalloonPluginDataSource:v7];
    }
  }
LABEL_14:

  return v8;
}

- (void)invalidatePhotosViewController
{
}

- (void)invalidatePhotosPlugin
{
}

- (void)invalidateAppManagerPlugin
{
}

- (id)photosBrowserViewControllerWithPluginPayloads:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKBalloonPluginManager *)self existingPhotoBrowserViewController];
  uint64_t v6 = *MEMORY[0x1E4F6CBF8];
  if (v5)
  {
    id v7 = (void *)v5;
    [(CKBalloonPluginManager *)self _invalidatePluginForKey:*MEMORY[0x1E4F6CBF8]];
  }
  id v8 = [MEMORY[0x1E4F6BC18] sharedInstance];
  int v9 = [v8 balloonPluginForBundleID:v6];

  id v10 = (objc_class *)[v9 browserClass];
  if ([(objc_class *)v10 instancesRespondToSelector:sel_initWithBalloonPlugin_pluginPayloads_])
  {
    uint64_t v11 = [[v10 alloc] initWithBalloonPlugin:v9 pluginPayloads:v4];
  }
  else
  {
    int v12 = [(objc_class *)v10 instancesRespondToSelector:sel_initWithBalloonPlugin_dataSource_];
    id v13 = [v10 alloc];
    if (v12) {
      uint64_t v11 = [v13 initWithBalloonPlugin:v9 dataSource:0];
    }
    else {
      uint64_t v11 = [v13 initWithBalloonPlugin:v9];
    }
  }
  long long v14 = (void *)v11;
  if (v11)
  {
    long long v15 = [(CKBalloonPluginManager *)self activeBrowsers];
    [v15 setObject:v14 forKey:v6];
  }

  return v14;
}

- (id)existingPhotoBrowserViewController
{
  return [(CKBalloonPluginManager *)self existingViewControllerForPluginIdentifier:*MEMORY[0x1E4F6CBF8]];
}

- (id)digitalTouchViewControllerWithDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F6CBA0];
  uint64_t v6 = [(CKBalloonPluginManager *)self existingViewControllerForPluginIdentifier:*MEMORY[0x1E4F6CBA0]];
  if (v6)
  {
    id v7 = v6;
    id v8 = [v6 balloonPluginDataSource];

    if (v8 == v4) {
      goto LABEL_7;
    }
    [(CKBalloonPluginManager *)self _invalidatePluginForKey:v5];
  }
  int v9 = [MEMORY[0x1E4F6BC18] sharedInstance];
  id v10 = [v9 balloonPluginForBundleID:v5];

  id v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "browserClass")), "initWithBalloonPlugin:dataSource:", v10, v4);
  if (v7)
  {
    uint64_t v11 = [(CKBalloonPluginManager *)self activeBrowsers];
    [v11 setObject:v7 forKey:v5];
  }
LABEL_7:

  return v7;
}

- (id)handwritingViewControllerWithPluginPayloads:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F6CBD8];
  uint64_t v6 = [(CKBalloonPluginManager *)self existingViewControllerForPluginIdentifier:*MEMORY[0x1E4F6CBD8]];
  id v7 = v6;
  if (v4 && v6)
  {

    [(CKBalloonPluginManager *)self _invalidatePluginForKey:v5];
LABEL_5:
    id v8 = [MEMORY[0x1E4F6BC18] sharedInstance];
    int v9 = [v8 balloonPluginForBundleID:v5];

    id v10 = (objc_class *)[v9 browserClass];
    if ([(objc_class *)v10 instancesRespondToSelector:sel_initWithBalloonPlugin_pluginPayloads_])
    {
      uint64_t v11 = [[v10 alloc] initWithBalloonPlugin:v9 pluginPayloads:v4];
    }
    else
    {
      int v12 = [(objc_class *)v10 instancesRespondToSelector:sel_initWithBalloonPlugin_dataSource_];
      id v13 = [v10 alloc];
      if (v12) {
        uint64_t v11 = [v13 initWithBalloonPlugin:v9 dataSource:0];
      }
      else {
        uint64_t v11 = [v13 initWithBalloonPlugin:v9];
      }
    }
    id v7 = (void *)v11;

    goto LABEL_11;
  }
  if (!v6) {
    goto LABEL_5;
  }
LABEL_11:

  return v7;
}

- (BOOL)isViewController:(id)a3 fromPluginWithIdentifier:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F6BC18];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedInstance];
  int v9 = [v8 balloonPluginForBundleID:v6];

  id v10 = objc_opt_class();
  LOBYTE(v7) = objc_msgSend(v10, "isEqual:", objc_msgSend(v9, "browserClass"));

  return (char)v7;
}

- (void)appInstallationWatcher:(id)a3 changedAppInstallation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  int v24 = __Block_byref_object_copy__35;
  id v25 = __Block_byref_object_dispose__35;
  id v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v8 = [(CKBalloonPluginManager *)self visibleInstallations];

  if (!v8)
  {
    int v9 = [MEMORY[0x1E4F1CA48] array];
    [(CKBalloonPluginManager *)self setVisibleInstallations:v9];
  }
  id v10 = [(CKBalloonPluginManager *)self visibleInstallations];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__CKBalloonPluginManager_CKBrowserSelectionController__appInstallationWatcher_changedAppInstallation___block_invoke;
  v13[3] = &unk_1E5627D68;
  id v11 = v7;
  id v14 = v11;
  long long v15 = &v21;
  uint64_t v16 = &v17;
  [v10 enumerateObjectsUsingBlock:v13];

  if (v22[5])
  {
    if ([v11 installed])
    {
      int v12 = [(CKBalloonPluginManager *)self visibleInstallations];
      [v12 removeObjectAtIndex:v18[3]];
    }
    else
    {
      int v12 = [(CKBalloonPluginManager *)self visibleInstallations];
      [v12 replaceObjectAtIndex:v18[3] withObject:v11];
    }
    goto LABEL_9;
  }
  if (([v11 installed] & 1) == 0)
  {
    int v12 = [(CKBalloonPluginManager *)self visibleInstallations];
    [v12 addObject:v11];
LABEL_9:

    [(CKBalloonPluginManager *)self _refreshVisibleDrawerPluginsDueToAppInstallationChange];
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
}

void __102__CKBalloonPluginManager_CKBrowserSelectionController__appInstallationWatcher_changedAppInstallation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = [v11 bundleIdentifier];
  int v9 = [*(id *)(a1 + 32) bundleIdentifier];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)appInstallationWatcher:(id)a3 addedAppInstallation:(id)a4
{
  id v5 = a4;
  id v6 = [(CKBalloonPluginManager *)self visibleInstallations];

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    [(CKBalloonPluginManager *)self setVisibleInstallations:v7];
  }
  id v8 = [(CKBalloonPluginManager *)self visibleInstallations];
  [v8 addObject:v5];

  [(CKBalloonPluginManager *)self _refreshVisibleDrawerPluginsDueToAppInstallationChange];
}

- (void)updateAppInstallations
{
  BOOL v3 = +[CKAppInstallationWatcher sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__CKBalloonPluginManager_CKBrowserSelectionController__updateAppInstallations__block_invoke;
  v4[3] = &unk_1E56234D8;
  v4[4] = self;
  [v3 fetchAllAppInstallations:v4];
}

void __78__CKBalloonPluginManager_CKBrowserSelectionController__updateAppInstallations__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  BOOL v3 = [*(id *)(a1 + 32) visibleInstallations];
  uint64_t v4 = [v3 count];

  id v5 = [*(id *)(a1 + 32) filteredArrayOfInstallationsThatShouldBeVisible:v8];
  id v6 = (void *)[v5 mutableCopy];
  [*(id *)(a1 + 32) setVisibleInstallations:v6];

  if (([*(id *)(a1 + 32) isAppInstallationObserver] & 1) == 0)
  {
    id v7 = +[CKAppInstallationWatcher sharedInstance];
    [v7 addObserver:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) setIsAppInstallationObserver:1];
  }
  if (v4 || [v8 count]) {
    [*(id *)(a1 + 32) _refreshVisibleDrawerPluginsDueToAppInstallationChange];
  }
}

- (void)_refreshVisibleDrawerPluginsDueToAppInstallationChange
{
  [(CKBalloonPluginManager *)self refreshPlugins];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"CKBrowserSelectionControllerInstallationsChangedNotification" object:0];
}

- (id)filteredArrayOfInstallationsThatShouldBeVisible:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [(CKBalloonPluginManager *)self visiblePlugins];
  id v7 = objc_msgSend(v6, "__imArrayByApplyingBlock:", &__block_literal_global_106);
  id v8 = [v4 setWithArray:v7];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __104__CKBalloonPluginManager_CKBrowserSelectionController__filteredArrayOfInstallationsThatShouldBeVisible___block_invoke_2;
  v12[3] = &unk_1E5627DB0;
  id v13 = v8;
  id v9 = v8;
  int v10 = objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v12);

  return v10;
}

id __104__CKBalloonPluginManager_CKBrowserSelectionController__filteredArrayOfInstallationsThatShouldBeVisible___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 containingBundleIdentifier];
  }
  else {
  BOOL v3 = [v2 identifier];
  }

  return v3;
}

BOOL __104__CKBalloonPluginManager_CKBrowserSelectionController__filteredArrayOfInstallationsThatShouldBeVisible___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 bundleIdentifier];
  if ([v4 containsObject:v5] & 1) != 0 || (objc_msgSend(v3, "installed")) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = [v3 installState] == 1
  }
      || [v3 installState] == 2
      || [v3 installState] == 5;

  return v6;
}

- (id)candidateAppStripPlugins
{
  appStripCandidatePlugins = self->_appStripCandidatePlugins;
  if (!appStripCandidatePlugins)
  {
    visibleAppStripPlugins = self->_visibleAppStripPlugins;
    self->_visibleAppStripPlugins = 0;

    visibleSwitcherPlugins = self->_visibleSwitcherPlugins;
    self->_visibleSwitcherPlugins = 0;

    [(CKBalloonPluginManager *)self setFavoriteAppStripPlugins:0];
    recentAppStripPlugins = self->_recentAppStripPlugins;
    self->_recentAppStripPlugins = 0;

    visibleRecentAppStripPlugins = self->_visibleRecentAppStripPlugins;
    self->_visibleRecentAppStripPlugins = 0;

    id v8 = [(CKBalloonPluginManager *)self orderedPlugins:0];
    id v9 = self->_appStripCandidatePlugins;
    self->_appStripCandidatePlugins = v8;

    appStripCandidatePlugins = self->_appStripCandidatePlugins;
  }

  return appStripCandidatePlugins;
}

- (NSArray)visibleDrawerPlugins
{
  visibleAppStripPlugins = self->_visibleAppStripPlugins;
  if (!visibleAppStripPlugins)
  {
    uint64_t v4 = [(CKBalloonPluginManager *)self visibleFavoriteAppStripPlugins];
    id v5 = [(CKBalloonPluginManager *)self visibleRecentAppStripPlugins];
    BOOL v6 = [v4 arrayByAddingObjectsFromArray:v5];
    id v7 = self->_visibleAppStripPlugins;
    self->_visibleAppStripPlugins = v6;

    visibleAppStripPlugins = self->_visibleAppStripPlugins;
  }

  return visibleAppStripPlugins;
}

- (NSArray)visibleFavoriteAppStripPlugins
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKBalloonPluginManager *)self favoriteAppStripPlugins];

  if (!v3)
  {
    long long v15 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v4 = [(CKBalloonPluginManager *)self candidateAppStripPlugins];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v10 = [(CKBalloonPluginManager *)self pluginIndexPathMap];
            id v11 = [v9 identifier];
            int v12 = [v10 objectForKey:v11];

            if (v12 && ![v12 section]) {
              [v15 addObject:v9];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    [(CKBalloonPluginManager *)self setFavoriteAppStripPlugins:v15];
  }
  id v13 = [(CKBalloonPluginManager *)self favoriteAppStripPlugins];

  return (NSArray *)v13;
}

- (NSArray)recentAppStripPlugins
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  recentAppStripPlugins = self->_recentAppStripPlugins;
  if (!recentAppStripPlugins)
  {
    long long v15 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v4 = [(CKBalloonPluginManager *)self candidateAppStripPlugins];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v10 = [(CKBalloonPluginManager *)self pluginIndexPathMap];
            id v11 = [v9 identifier];
            int v12 = [v10 objectForKey:v11];

            if (!v12 || [v12 section] == 1) {
              [(NSArray *)v15 addObject:v9];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    id v13 = self->_recentAppStripPlugins;
    self->_recentAppStripPlugins = v15;

    recentAppStripPlugins = self->_recentAppStripPlugins;
  }

  return recentAppStripPlugins;
}

- (NSArray)visibleRecentAppStripPlugins
{
  visibleRecentAppStripPlugins = self->_visibleRecentAppStripPlugins;
  if (!visibleRecentAppStripPlugins)
  {
    uint64_t v4 = [(CKBalloonPluginManager *)self recentAppStripPlugins];
    uint64_t v5 = +[CKUIBehavior sharedBehaviors];
    uint64_t v6 = [v5 suggestedAppStripLimit];

    uint64_t v7 = +[CKUIBehavior sharedBehaviors];
    uint64_t v8 = [v7 suggestedMinimumRecentsCount];

    id v9 = [(CKBalloonPluginManager *)self visibleFavoriteAppStripPlugins];
    uint64_t v10 = [v9 count];

    uint64_t v11 = [v4 count];
    uint64_t v12 = v6 - v10;
    if (v6 - v10 <= v8) {
      uint64_t v12 = v8;
    }
    if (v12 >= v11) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v12;
    }
    objc_msgSend(v4, "subarrayWithRange:", 0, v13);
    id v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v15 = [(NSArray *)v14 lastObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v16 = [v15 identifier];
      int v17 = [v16 isEqualToString:@"com.apple.messages.browser.MorePlugin"] ^ 1;
    }
    else
    {
      int v17 = 1;
    }
    uint64_t v18 = [(id)objc_opt_class() morePlugin];
    long long v19 = (void *)v18;
    if (v17 && v18)
    {
      uint64_t v20 = [(NSArray *)v14 arrayByAddingObject:v18];

      id v14 = (NSArray *)v20;
    }
    uint64_t v21 = self->_visibleRecentAppStripPlugins;
    self->_visibleRecentAppStripPlugins = v14;

    visibleRecentAppStripPlugins = self->_visibleRecentAppStripPlugins;
  }

  return visibleRecentAppStripPlugins;
}

- (NSArray)potentiallyVisiblePlugins
{
  id v3 = [(CKBalloonPluginManager *)self cachedPotentiallyVisiblePlugins];

  if (!v3)
  {
    [(CKBalloonPluginManager *)self setFavoriteAppStripPlugins:0];
    recentAppStripPlugins = self->_recentAppStripPlugins;
    self->_recentAppStripPlugins = 0;

    visibleRecentAppStripPlugins = self->_visibleRecentAppStripPlugins;
    self->_visibleRecentAppStripPlugins = 0;

    uint64_t v6 = [(CKBalloonPluginManager *)self orderedPlugins:1];
    [(CKBalloonPluginManager *)self setCachedPotentiallyVisiblePlugins:v6];
  }

  return [(CKBalloonPluginManager *)self cachedPotentiallyVisiblePlugins];
}

- (NSArray)potentiallyVisibleNonFavoritePlugins
{
  id v3 = [(CKBalloonPluginManager *)self visibleFavoriteAppStripPlugins];
  uint64_t v4 = [(CKBalloonPluginManager *)self potentiallyVisiblePlugins];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__CKBalloonPluginManager_CKBrowserSelectionController__potentiallyVisibleNonFavoritePlugins__block_invoke;
  v8[3] = &unk_1E5625720;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "__imArrayByFilteringWithBlock:", v8);

  return (NSArray *)v6;
}

uint64_t __92__CKBalloonPluginManager_CKBrowserSelectionController__potentiallyVisibleNonFavoritePlugins__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)allPotentiallyVisiblePlugins
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__CKBalloonPluginManager_CKBrowserSelectionController__allPotentiallyVisiblePlugins__block_invoke;
  v4[3] = &unk_1E5625720;
  v4[4] = self;
  id v2 = [(CKBalloonPluginManager *)self allPluginsPassingTest:v4];

  return v2;
}

uint64_t __84__CKBalloonPluginManager_CKBrowserSelectionController__allPotentiallyVisiblePlugins__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 isPluginVisible:v3];

  return v4;
}

- (id)orderedPlugins:(BOOL)a3
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v5 = [(CKBalloonPluginManager *)self cachedPotentiallyVisiblePlugins];

  if (__CurrentTestName) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v18 = [(CKBalloonPluginManager *)self visiblePlugins];
    [(CKBalloonPluginManager *)self setCachedPotentiallyVisiblePlugins:v18];
  }
  else if (!v5)
  {
    uint64_t v7 = [(CKBalloonPluginManager *)self allPotentiallyVisiblePlugins];
    uint64_t v8 = +[CKBalloonPluginManager defaultFavoritePlugins];
    id v9 = +[CKBalloonPluginManager morePlugin];
    uint64_t v10 = [v7 lastObject];
    uint64_t v11 = v10;
    if (!v9)
    {
      if ([v7 count]) {
        goto LABEL_21;
      }
      goto LABEL_54;
    }
    uint64_t v12 = [v10 identifier];
    uint64_t v13 = [v9 identifier];
    if (([v12 isEqualToString:v13] & 1) == 0 && !__CurrentTestName)
    {
      uint64_t v14 = [v7 count];

      if (!v14) {
        goto LABEL_12;
      }
      long long v15 = NSString;
      long long v16 = [v9 identifier];
      uint64_t v12 = [v15 stringWithFormat:@"More plugin was not found last in visible plugins list! Found %@ instead.", v16];

      uint64_t v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v12 userInfo:0];
      [v13 raise];
    }

LABEL_12:
    if ([v7 count])
    {
      uint64_t v17 = objc_msgSend(v7, "subarrayWithRange:", 0, objc_msgSend(v7, "count") - 1);

      uint64_t v7 = (void *)v17;
LABEL_21:
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke;
      v110[3] = &unk_1E5625720;
      id v76 = v23;
      id v111 = v76;
      int v24 = objc_msgSend(v7, "__imArrayByFilteringWithBlock:", v110);

      id v25 = [MEMORY[0x1E4F28D58] indexPathForRow:0x7FFFFFFFFFFFFFFFLL inSection:0x7FFFFFFFFFFFFFFFLL];
      id v26 = [(CKBalloonPluginManager *)self pluginIndexPathMap];
      id v27 = [(CKBalloonPluginManager *)self historicalPluginIndexPathMap];
      v106[0] = MEMORY[0x1E4F143A8];
      v106[1] = 3221225472;
      v106[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_2;
      v106[3] = &unk_1E5627DD8;
      v106[4] = self;
      id v28 = v26;
      id v107 = v28;
      id v29 = v27;
      id v108 = v29;
      id v68 = v25;
      v69 = v24;
      id v109 = v68;
      long long v30 = [v24 sortedArrayUsingComparator:v106];
      long long v31 = (void *)[v30 mutableCopy];

      int v32 = objc_msgSend(v31, "__imArrayByFilteringWithBlock:", &__block_literal_global_90);
      uint64_t v33 = [v32 firstObject];

      if (v33)
      {
        [v31 removeObject:v33];
        [v31 insertObject:v33 atIndex:0];
      }
      v75 = (void *)v33;
      v71 = v11;
      BOOL v72 = a3;
      __int16 v34 = objc_msgSend(v31, "__imArrayByFilteringWithBlock:", &__block_literal_global_92);
      uint64_t v35 = [v34 firstObject];

      if (v35)
      {
        [v31 removeObject:v35];
        [v31 insertObject:v35 atIndex:0];
      }
      v73 = (void *)v35;
      v70 = v9;
      v103[0] = MEMORY[0x1E4F143A8];
      v103[1] = 3221225472;
      v103[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_5;
      v103[3] = &unk_1E5627E20;
      id v36 = v28;
      id v104 = v36;
      id v82 = v8;
      id v105 = v82;
      long long v37 = objc_msgSend(v31, "__imArrayByFilteringWithBlock:", v103);
      v66 = v31;
      uint64_t v38 = [v31 arrayByExcludingObjectsInArray:v37];
      id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v39 = [MEMORY[0x1E4F1CA48] array];
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      obuint64_t j = v38;
      uint64_t v40 = [obj countByEnumeratingWithState:&v99 objects:v113 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v100;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v100 != v42) {
              objc_enumerationMutation(obj);
            }
            uint64_t v44 = *(void *)(*((void *)&v99 + 1) + 8 * i);
            if (!-[CKBalloonPluginManager _addPluginToRecentsFrontIfNeeded:frontOfRecents:pluginMap:fallbackMap:](self, "_addPluginToRecentsFrontIfNeeded:frontOfRecents:pluginMap:fallbackMap:", v44, v39, v36, v29))[v78 addObject:v44]; {
          }
            }
          uint64_t v41 = [obj countByEnumeratingWithState:&v99 objects:v113 count:16];
        }
        while (v41);
      }
      v74 = (void *)v39;
      v67 = v29;

      uint64_t v45 = [MEMORY[0x1E4F1CA48] array];
      id v46 = [MEMORY[0x1E4F1CA48] array];
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v80 = v37;
      uint64_t v47 = [v80 countByEnumeratingWithState:&v95 objects:v112 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v96;
        do
        {
          for (uint64_t j = 0; j != v48; ++j)
          {
            if (*(void *)v96 != v49) {
              objc_enumerationMutation(v80);
            }
            long long v51 = *(void **)(*((void *)&v95 + 1) + 8 * j);
            long long v52 = [v51 identifier];
            long long v53 = [v36 objectForKeyedSubscript:v52];
            long long v54 = v53;
            if (!v53
              || [v53 section] == 0x7FFFFFFFFFFFFFFFLL
              || (uint64_t v55 = [v54 item], v56 = v77, v55 == 0x7FFFFFFFFFFFFFFFLL))
            {
              if ([v82 containsObject:v52]) {
                id v56 = v46;
              }
              else {
                id v56 = v45;
              }
            }
            [v56 addObject:v51];
          }
          uint64_t v48 = [v80 countByEnumeratingWithState:&v95 objects:v112 count:16];
        }
        while (v48);
      }

      if ([v46 count])
      {
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_6;
        v93[3] = &unk_1E5627E48;
        id v94 = v82;
        v57 = [v46 sortedArrayUsingComparator:v93];
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_7;
        v89[3] = &unk_1E5627E70;
        id v90 = v73;
        id v91 = v75;
        id v92 = v77;
        [v57 enumerateObjectsUsingBlock:v89];
      }
      [v77 addObjectsFromArray:v45];
      uint64_t v58 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v74, "count"));
      [v78 insertObjects:v74 atIndexes:v58];

      id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v59 addObjectsFromArray:v77];
      v60 = [(CKBalloonPluginManager *)self visibleInstallations];
      v61 = [(CKBalloonPluginManager *)self filteredArrayOfInstallationsThatShouldBeVisible:v60];
      [v59 addObjectsFromArray:v61];

      [v59 addObjectsFromArray:v78];
      [v59 addObjectsFromArray:v76];
      a3 = v72;
      if (v70) {
        [v59 addObject:v70];
      }
      v62 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v59, "count"));
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_8;
      v84[3] = &unk_1E5627E98;
      id v85 = v77;
      id v86 = v78;
      id v87 = v70;
      id v63 = v62;
      id v88 = v63;
      id v64 = v70;
      id v79 = v78;
      id v65 = v77;
      [v59 enumerateObjectsUsingBlock:v84];
      if ([(CKBalloonPluginManager *)self hasLoadedExtensions])
      {
        [(CKBalloonPluginManager *)self setPluginIndexPathMap:v63];
        [(CKBalloonPluginManager *)self saveWithNotification:0];
      }
      [(CKBalloonPluginManager *)self setCachedPotentiallyVisiblePlugins:v59];

      goto LABEL_15;
    }
LABEL_54:

    uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_17;
  }
LABEL_15:
  long long v19 = [(CKBalloonPluginManager *)self cachedPotentiallyVisiblePlugins];
  uint64_t v20 = v19;
  if (!a3)
  {
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_9;
    v83[3] = &unk_1E5627EC0;
    v83[4] = self;
    uint64_t v21 = objc_msgSend(v19, "__imArrayByFilteringWithBlock:", v83);

    uint64_t v20 = (void *)v21;
  }
LABEL_17:

  return v20;
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 isEnabled];
  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return v4;
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[4];
  id v6 = a3;
  uint64_t v7 = [a2 identifier];
  uint64_t v8 = [v5 _pluginIndexPathForFavoritePluginWithIdentifier:v7 pluginMap:a1[5] fallbackMap:a1[6]];
  id v9 = v8;
  if (!v8) {
    id v9 = (void *)a1[7];
  }
  id v10 = v9;

  uint64_t v11 = (void *)a1[4];
  uint64_t v12 = [v6 identifier];

  uint64_t v13 = [v11 _pluginIndexPathForFavoritePluginWithIdentifier:v12 pluginMap:a1[5] fallbackMap:a1[6]];
  uint64_t v14 = v13;
  if (!v13) {
    uint64_t v14 = (void *)a1[7];
  }
  id v15 = v14;

  uint64_t v16 = [v10 compare:v15];
  return v16;
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToIgnoringCase:*MEMORY[0x1E4F6CB80]];

  return v3;
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = IMBalloonExtensionIDWithSuffix();
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v5 = v4;
  if (!v4)
  {
    if ([*(id *)(a1 + 40) containsObject:v3]) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = IMBalloonExtensionIDWithSuffix();
    uint64_t v6 = [v3 isEqualToString:v7];

    goto LABEL_6;
  }
  if ([v4 section]) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 1;
LABEL_6:

  return v6;
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 identifier];
  uint64_t v8 = [v5 indexOfObject:v7];

  id v9 = *(void **)(a1 + 32);
  id v10 = [v6 identifier];

  uint64_t v11 = [v9 indexOfObject:v10];
  if (v8 < v11) {
    return -1;
  }
  else {
    return v8 > v11;
  }
}

void __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_7(uint64_t a1, void *a2, unint64_t a3)
{
  id v16 = a2;
  id v5 = [v16 identifier];
  id v6 = IMBalloonExtensionIDWithSuffix();
  int v7 = [v5 isEqualToIgnoringCase:v6];

  uint64_t v8 = [v16 identifier];
  char v9 = [v8 isEqualToIgnoringCase:*MEMORY[0x1E4F6CB80]];

  unint64_t v10 = v7 ^ 1u;
  if ((v7 & 1) == 0 && (v9 & 1) == 0)
  {
    if (*(void *)(a1 + 32)) {
      unint64_t v11 = a3 + 1;
    }
    else {
      unint64_t v11 = a3;
    }
    if (*(void *)(a1 + 40)) {
      unint64_t v10 = v11 + 1;
    }
    else {
      unint64_t v10 = v11;
    }
  }
  unint64_t v12 = [*(id *)(a1 + 48) count];
  if (v10 > v12)
  {
    unint64_t v13 = v12;
    unint64_t v14 = v10;
    unint64_t v15 = v12;
    _IMWarn();
    unint64_t v10 = v13;
  }
  objc_msgSend(*(id *)(a1 + 48), "insertObject:atIndex:", v16, v10, v14, v15);
}

void __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_8(uint64_t a1, void *a2)
{
  id v11 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = (id *)(a1 + 32);
    if ([*(id *)(a1 + 32) containsObject:v11])
    {
      uint64_t v4 = &CKAppStripFavoritesSection;
LABEL_6:
      uint64_t v5 = *v4;
      uint64_t v6 = [*v3 indexOfObject:v11];
      if (v5 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_14;
      }
      uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:v5];
      char v9 = *(void **)(a1 + 56);
      unint64_t v10 = [v11 identifier];
      [v9 setObject:v8 forKeyedSubscript:v10];

      goto LABEL_11;
    }
    uint64_t v3 = (id *)(a1 + 40);
    if ([*(id *)(a1 + 40) containsObject:v11])
    {
      uint64_t v4 = &CKAppStripRecentsSection;
      goto LABEL_6;
    }
    if ([v11 isEnabled] && *(id *)(a1 + 48) == v11)
    {
      uint64_t v8 = [v11 identifier];
      _IMWarn();
LABEL_11:
    }
  }
LABEL_14:
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [*(id *)(a1 + 32) isEnabledAndVisible:v3];
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (BOOL)isPluginSystemApp:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 identifier];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 proxy];
      int v7 = [v4 identifier];
      int v8 = [v7 isEqualToString:v5];

      if (v8 && v6)
      {
        char v9 = [v6 containingBundle];
        unint64_t v10 = [v9 applicationType];
        char v11 = [v10 isEqualToString:*MEMORY[0x1E4F22390]];

        char v12 = v11 ^ 1;
      }
      else
      {
        _IMWarn();
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    _IMWarn();
    char v12 = 0;
  }

  return v12;
}

- (BOOL)isPluginHiddenFromSendMenuAndStickers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
  uint64_t v5 = [v4 valueForKey:@"SendMenuHiddenExtensionBundleIdentifiers"];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
    int v7 = [v6 stringArrayForKey:@"SendMenuHiddenExtensionBundleIdentifiers"];

    int v8 = [v3 extensionBundleIdentifier];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "isEqualToString:", v8, (void)v14))
          {
            LOBYTE(v10) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)setPlugin:(id)a3 hiddenInSendMenuAndStickers:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB18];
  id v6 = a3;
  int v7 = [v5 messagesAppDomain];
  int v8 = [v7 valueForKey:@"SendMenuHiddenExtensionBundleIdentifiers"];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
    uint64_t v10 = [v9 stringArrayForKey:@"SendMenuHiddenExtensionBundleIdentifiers"];
    id v13 = (id)[v10 mutableCopy];
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1CA48] array];
  }
  uint64_t v11 = [v6 extensionBundleIdentifier];

  if (v4)
  {
    [v13 removeObject:v11];
  }
  else
  {
    if ([v13 containsObject:v11]) {
      goto LABEL_9;
    }
    [v13 addObject:v11];
  }
  char v12 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
  [v12 setValue:v13 forKey:@"SendMenuHiddenExtensionBundleIdentifiers"];

LABEL_9:
}

- (NSArray)orderedCombinedStickerApps
{
  id v3 = [(CKBalloonPluginManager *)self allOrderedCombinedStickerApps];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__CKBalloonPluginManager_CKBrowserSelectionController__orderedCombinedStickerApps__block_invoke;
  v6[3] = &unk_1E5625720;
  v6[4] = self;
  BOOL v4 = objc_msgSend(v3, "__imArrayByFilteringWithBlock:", v6);

  return (NSArray *)v4;
}

uint64_t __82__CKBalloonPluginManager_CKBrowserSelectionController__orderedCombinedStickerApps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isLaunchProhibited]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) isPluginHiddenFromSendMenuAndStickers:v3] ^ 1;
  }

  return v4;
}

- (NSArray)allOrderedCombinedStickerApps
{
  id v3 = [(CKBalloonPluginManager *)self combinedStickerApps];
  uint64_t v4 = [v3 lastObject];
  uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForRow:0x7FFFFFFFFFFFFFFFLL inSection:0x7FFFFFFFFFFFFFFFLL];
  id v6 = [(CKBalloonPluginManager *)self combinedStickersAppsIndexPathMap];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__CKBalloonPluginManager_CKBrowserSelectionController__allOrderedCombinedStickerApps__block_invoke;
  v12[3] = &unk_1E5627EE8;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v5;
  id v7 = v5;
  id v8 = v6;
  id v9 = [v3 sortedArrayUsingComparator:v12];
  uint64_t v10 = (void *)[v9 mutableCopy];

  [v10 removeObject:v4];
  [v10 addObject:v4];

  return (NSArray *)v10;
}

uint64_t __85__CKBalloonPluginManager_CKBrowserSelectionController__allOrderedCombinedStickerApps__block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)a1[4];
  id v6 = a3;
  id v7 = [a2 identifier];
  id v8 = [v5 _pluginIndexPathForPluginWithIdentifier:v7 pluginMap:a1[5]];
  id v9 = v8;
  if (!v8) {
    id v9 = (void *)a1[6];
  }
  id v10 = v9;

  uint64_t v11 = (void *)a1[4];
  char v12 = [v6 identifier];

  id v13 = [v11 _pluginIndexPathForPluginWithIdentifier:v12 pluginMap:a1[5]];
  id v14 = v13;
  if (!v13) {
    id v14 = (void *)a1[6];
  }
  id v15 = v14;

  uint64_t v16 = [v10 compare:v15];
  return v16;
}

- (id)_pluginIndexPathForFavoritePluginWithIdentifier:(id)a3 pluginMap:(id)a4 fallbackMap:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [a4 objectForKeyedSubscript:v7];
  id v10 = v9;
  if (!v9 || [v9 section] == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v10, "item") == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:v7];

    if (!v11
      || [v11 section] == 0x7FFFFFFFFFFFFFFFLL
      || [v11 item] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = 0;
    }
    else
    {
      id v10 = v11;
    }
  }
  else
  {
    uint64_t v11 = v10;
  }
  id v12 = v10;

  return v12;
}

- (id)_pluginIndexPathForPluginWithIdentifier:(id)a3 pluginMap:(id)a4
{
  uint64_t v4 = [a4 objectForKeyedSubscript:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 section] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v4 = 0;
    }
    else if ([v5 item] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = v5;
    }
  }
  id v6 = v4;

  return v6;
}

- (BOOL)_addPluginToRecentsFrontIfNeeded:(id)a3 frontOfRecents:(id)a4 pluginMap:(id)a5 fallbackMap:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [v10 identifier];
  id v15 = [(CKBalloonPluginManager *)self _pluginIndexPathForFavoritePluginWithIdentifier:v14 pluginMap:v13 fallbackMap:v12];

  if (!v15) {
    [v11 addObject:v10];
  }

  return v15 == 0;
}

- (void)regeneratePluginIndexPaths
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([(CKBalloonPluginManager *)self hasLoadedExtensions])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __82__CKBalloonPluginManager_CKBrowserSelectionController__regeneratePluginIndexPaths__block_invoke;
    v32[3] = &unk_1E5625720;
    v32[4] = self;
    uint64_t v22 = [(CKBalloonPluginManager *)self allPluginsPassingTest:v32];
    uint64_t v4 = objc_msgSend(v22, "__imArrayByApplyingBlock:", &__block_literal_global_127);
    id v23 = self;
    uint64_t v5 = [(id)objc_opt_class() defaultFavoritePlugins];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          if ([v4 containsObject:v11])
          {
            id v12 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 inSection:0];
            [v3 setObject:v12 forKeyedSubscript:v11];

            ++v8;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v4;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          if (([v5 containsObject:v19] & 1) == 0
            && ([v19 isEqualToString:@"com.apple.messages.browser.MorePlugin"] & 1) == 0)
          {
            uint64_t v20 = [MEMORY[0x1E4F28D58] indexPathForItem:v16 inSection:1];
            [v3 setObject:v20 forKeyedSubscript:v19];

            ++v16;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v15);
    }
    else
    {
      uint64_t v16 = 0;
    }

    uint64_t v21 = [MEMORY[0x1E4F28D58] indexPathForItem:v16 inSection:1];
    [v3 setObject:v21 forKeyedSubscript:@"com.apple.messages.browser.MorePlugin"];

    [(CKBalloonPluginManager *)v23 setPluginIndexPathMap:v3];
  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }
}

uint64_t __82__CKBalloonPluginManager_CKBrowserSelectionController__regeneratePluginIndexPaths__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEnabledAndVisible:a2];
}

uint64_t __82__CKBalloonPluginManager_CKBrowserSelectionController__regeneratePluginIndexPaths__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)regenerateCombinedStickersAppsIndexPaths
{
  if ([(CKBalloonPluginManager *)self hasLoadedExtensions])
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = [(CKBalloonPluginManager *)self combinedStickerApps];
    uint64_t v5 = (void *)[v4 mutableCopy];

    uint64_t v6 = [v5 lastObject];
    uint64_t v7 = [v6 identifier];
    char v8 = [v7 isEqualToString:@"com.apple.messages.browser.MorePlugin"];

    if ((v8 & 1) == 0)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"CKBalloonPluginManager_SelectionController.m" lineNumber:666 description:@"Expected more plugin last"];
    }
    if ([v5 count])
    {
      unint64_t v9 = 0;
      do
      {
        id v10 = [v5 objectAtIndexedSubscript:v9];
        uint64_t v11 = [v10 identifier];

        id v12 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:0];
        [v14 setObject:v12 forKeyedSubscript:v11];

        ++v9;
      }
      while (v9 < [v5 count]);
    }
    [(CKBalloonPluginManager *)self setCombinedStickersAppsIndexPathMap:v14];
  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }
}

- (void)updateIndexPath:(id)a3 forPlugin:(id)a4 isDrawerPluginPath:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v9 = [(CKBalloonPluginManager *)self visibleFavoriteAppStripPlugins];
    id v10 = (void *)[v9 mutableCopy];

    uint64_t v11 = [(CKBalloonPluginManager *)self recentAppStripPlugins];
    id v12 = (void *)[v11 mutableCopy];

    if ([v7 section]) {
      id v13 = v12;
    }
    else {
      id v13 = v10;
    }
    id v14 = v13;
    [v10 removeObject:v8];
    [v12 removeObject:v8];
    objc_msgSend(v14, "insertObject:atIndex:", v8, objc_msgSend(v7, "row"));
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __101__CKBalloonPluginManager_CKBrowserSelectionController__updateIndexPath_forPlugin_isDrawerPluginPath___block_invoke;
    v17[3] = &unk_1E56256D0;
    v17[4] = self;
    [v10 enumerateObjectsUsingBlock:v17];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __101__CKBalloonPluginManager_CKBrowserSelectionController__updateIndexPath_forPlugin_isDrawerPluginPath___block_invoke_2;
    v16[3] = &unk_1E56256D0;
    v16[4] = self;
    [v12 enumerateObjectsUsingBlock:v16];

    [(CKBalloonPluginManager *)self _updateHistoricalPluginIndexPathMap];
    [(CKBalloonPluginManager *)self refreshPlugins];
    id v15 = [(CKBalloonPluginManager *)self visiblePlugins];
    [(CKBalloonPluginManager *)self saveWithNotification:1];
  }
  else
  {
    _IMWarn();
  }
}

void __101__CKBalloonPluginManager_CKBrowserSelectionController__updateIndexPath_forPlugin_isDrawerPluginPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28D58];
  id v6 = a2;
  id v10 = [v5 indexPathForRow:a3 inSection:0];
  id v7 = [*(id *)(a1 + 32) pluginIndexPathMap];
  id v8 = [v6 identifier];
  [v7 setValue:v10 forKey:v8];

  unint64_t v9 = [v6 identifier];

  NSLog(&cfstr_PuttingToTuTu.isa, v9, [v10 section], objc_msgSend(v10, "row"));
}

void __101__CKBalloonPluginManager_CKBrowserSelectionController__updateIndexPath_forPlugin_isDrawerPluginPath___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28D58];
  id v6 = a2;
  id v10 = [v5 indexPathForRow:a3 inSection:1];
  id v7 = [*(id *)(a1 + 32) pluginIndexPathMap];
  id v8 = [v6 identifier];
  [v7 setValue:v10 forKey:v8];

  unint64_t v9 = [v6 identifier];

  NSLog(&cfstr_PuttingToTuTu.isa, v9, [v10 section], objc_msgSend(v10, "row"));
}

- (void)updateIndexPath:(id)a3 forCombinedStickerApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(CKBalloonPluginManager *)self orderedCombinedStickerApps];
    unint64_t v9 = (void *)[v8 mutableCopy];

    [v9 removeObject:v7];
    objc_msgSend(v9, "insertObject:atIndex:", v7, objc_msgSend(v6, "row"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __94__CKBalloonPluginManager_CKBrowserSelectionController__updateIndexPath_forCombinedStickerApp___block_invoke;
    v10[3] = &unk_1E56256D0;
    void v10[4] = self;
    [v9 enumerateObjectsUsingBlock:v10];
    [(CKBalloonPluginManager *)self saveCombinedAppsWithNotification:1];
  }
  else
  {
    _IMWarn();
  }
}

void __94__CKBalloonPluginManager_CKBrowserSelectionController__updateIndexPath_forCombinedStickerApp___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28D58];
  id v6 = a2;
  id v10 = [v5 indexPathForRow:a3 inSection:0];
  id v7 = [*(id *)(a1 + 32) combinedStickersAppsIndexPathMap];
  id v8 = [v6 identifier];
  [v7 setValue:v10 forKey:v8];

  unint64_t v9 = [v6 identifier];

  NSLog(&cfstr_PuttingToTuTu.isa, v9, [v10 section], objc_msgSend(v10, "row"));
}

- (BOOL)isEnabledAndVisible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if ([(CKBalloonPluginManager *)self isPluginEnabled:v5])
  {
    id v6 = [v4 identifier];
    BOOL v7 = [(CKBalloonPluginManager *)self isPluginVisible:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)removeVisibleInstallationWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__35;
    uint64_t v17 = __Block_byref_object_dispose__35;
    id v18 = 0;
    uint64_t v5 = [(CKBalloonPluginManager *)self visibleInstallations];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    unint64_t v9 = __88__CKBalloonPluginManager_CKBrowserSelectionController__removeVisibleInstallationWithID___block_invoke;
    id v10 = &unk_1E5627F10;
    id v11 = v4;
    id v12 = &v13;
    [v5 enumerateObjectsUsingBlock:&v7];

    id v6 = [(CKBalloonPluginManager *)self visibleInstallations];
    [v6 removeObject:v14[5]];

    [(CKBalloonPluginManager *)self _refreshVisibleDrawerPluginsDueToAppInstallationChange];
    _Block_object_dispose(&v13, 8);
  }
}

void __88__CKBalloonPluginManager_CKBrowserSelectionController__removeVisibleInstallationWithID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = [v9 bundleIdentifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)descriptionOfVisibleDrawerPlugins
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(CKBalloonPluginManager *)self visibleDrawerPlugins];
  if ([v4 count])
  {
    unint64_t v5 = 0;
    do
    {
      if (v5) {
        [v3 appendFormat:@"\n"];
      }
      id v6 = [v4 objectAtIndexedSubscript:v5];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __89__CKBalloonPluginManager_CKBrowserSelectionController__descriptionOfVisibleDrawerPlugins__block_invoke;
      v8[3] = &unk_1E5620D50;
      id v9 = v3;
      [v6 enumerateObjectsUsingBlock:v8];

      ++v5;
    }
    while (v5 < [v4 count]);
  }

  return v3;
}

uint64_t __89__CKBalloonPluginManager_CKBrowserSelectionController__descriptionOfVisibleDrawerPlugins__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%tu: %@\n", a3, a2];
}

@end