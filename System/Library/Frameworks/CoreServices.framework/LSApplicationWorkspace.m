@interface LSApplicationWorkspace
+ (id)_defaultAppQueue;
+ (id)_remoteObserver;
+ (id)activeManagedConfigurationRestrictionUUIDs;
+ (id)callbackQueue;
+ (id)defaultWorkspace;
+ (id)progressQueue;
- (BOOL)_LSPrivateDatabaseNeedsRebuild;
- (BOOL)_LSPrivateRebuildApplicationDatabasesForSystemApps:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5;
- (BOOL)_LSPrivateRebuildApplicationDatabasesForSystemApps:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5 uid:(unsigned int *)a6;
- (BOOL)_getBundleIdentifierForBundleAtURL:(id)a3 invokeUpdateBlockAndReregister:(id)a4 error:(id *)a5;
- (BOOL)allowsAlternateIcons;
- (BOOL)applicationIsInstalled:(id)a3;
- (BOOL)canChangeDefaultAppForCategory:(unint64_t)a3;
- (BOOL)downgradeApplicationToPlaceholder:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)establishConnection;
- (BOOL)forceDatabaseSaveForTestingWithError:(id *)a3;
- (BOOL)garbageCollectDatabaseWithError:(id *)a3;
- (BOOL)getClaimedActivityTypes:(id *)a3 domains:(id *)a4;
- (BOOL)getDefaultApplicationCategories:(unint64_t *)a3 withCurrentDefaultApplication:(id)a4 error:(id *)a5;
- (BOOL)initiateProgressForApp:(id)a3 withType:(unint64_t)a4;
- (BOOL)installApplication:(id)a3 withOptions:(id)a4;
- (BOOL)installApplication:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)installApplication:(id)a3 withOptions:(id)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)installContainerizedApplicationArtifactAtURL:(id)a3 withOptions:(id)a4 error:(id *)a5 progressBlock:(id)a6;
- (BOOL)installContainerizedApplicationArtifactAtURL:(id)a3 withOptions:(id)a4 returningRecordPromise:(id *)a5 error:(id *)a6 progressBlock:(id)a7;
- (BOOL)installPhaseFinishedForProgress:(id)a3;
- (BOOL)invalidateIconCache:(id)a3;
- (BOOL)isApplicationAvailableToOpenURL:(id)a3 error:(id *)a4;
- (BOOL)isApplicationAvailableToOpenURLCommon:(id)a3 includePrivateURLSchemes:(BOOL)a4 error:(id *)a5;
- (BOOL)isVersion:(id)a3 greaterThanOrEqualToVersion:(id)a4;
- (BOOL)ls_injectUTTypeWithDeclaration:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (BOOL)mayProcessWithAuditTokenMapDatabase:(id *)a3;
- (BOOL)openApplicationWithBundleID:(id)a3;
- (BOOL)openSensitiveURL:(id)a3 withOptions:(id)a4;
- (BOOL)openSensitiveURL:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)openURL:(id)a3;
- (BOOL)openURL:(id)a3 withOptions:(id)a4;
- (BOOL)openURL:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)registerApplication:(id)a3;
- (BOOL)registerApplicationDictionary:(id)a3;
- (BOOL)registerApplicationDictionary:(id)a3 withObserverNotification:(int)a4;
- (BOOL)registerApplicationForRebuildWithInfoDictionaries:(id)a3 personaUniqueStrings:(id)a4 requestContext:(id)a5 registrationError:(id *)a6;
- (BOOL)registerApplicationForRebuildWithInfoDictionaries:(id)a3 requestContext:(id)a4 registrationError:(id *)a5;
- (BOOL)registerApplicationForRebuildWithInstallationRecord:(id)a3 extensionInstallationRecords:(id)a4 personaUniqueStrings:(id)a5 requestContext:(id)a6 registrationError:(id *)a7;
- (BOOL)registerPlugin:(id)a3;
- (BOOL)restoreSystemApplication:(id)a3;
- (BOOL)revertContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5 progressBlock:(id)a6;
- (BOOL)revertContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 returningRecordPromise:(id *)a5 error:(id *)a6 progressBlock:(id)a7;
- (BOOL)sendNotificationOfType:(unsigned int)a3 forApplicationWithBundleIdentifier:(id)a4 requestContext:(id)a5 error:(id *)a6;
- (BOOL)setPersonaUniqueStrings:(id)a3 forApplicationWithBundleIdentifier:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 error:(id *)a8;
- (BOOL)setPersonaUniqueStrings:(id)a3 forApplicationsWithBundleIdentifiers:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 error:(id *)a8;
- (BOOL)setPreferredAppMarketplaces:(id)a3 error:(id *)a4;
- (BOOL)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4;
- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (BOOL)uninstallContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5 progressBlock:(id)a6;
- (BOOL)unregisterApplication:(id)a3;
- (BOOL)unregisterApplicationsAtMountPoint:(id)a3 operationUUID:(id)a4 saveObserver:(id)a5 requestContext:(id)a6;
- (BOOL)unregisterContainerizedApplicationWithBundleIdentifier:(id)a3 operationUUID:(id)a4 unregistrationOperation:(unsigned int)a5 precondition:(id)a6 requestContext:(id)a7 saveObserver:(id)a8 unregistrationError:(id *)a9;
- (BOOL)unregisterContainerizedApplicationWithBundleIdentifier:(id)a3 operationUUID:(id)a4 unregistrationOperation:(unsigned int)a5 requestContext:(id)a6 saveObserver:(id)a7 unregistrationError:(id *)a8;
- (BOOL)unregisterPlugin:(id)a3;
- (BOOL)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failure:(unint64_t)a5 underlyingError:(id)a6 source:(unint64_t)a7 outError:(id *)a8;
- (BOOL)updatePlaceholderMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 installType:(unint64_t)a6 failure:(unint64_t)a7 saveObserver:(id)a8 error:(id *)a9;
- (BOOL)updatePlaceholderWithBundleIdentifier:(id)a3 withInstallType:(unint64_t)a4 error:(id *)a5;
- (BOOL)updateRecordForApp:(id)a3 withSINF:(id)a4 iTunesMetadata:(id)a5 placeholderMetadata:(id)a6 sendNotification:(int)a7 operationUUID:(id)a8 outSaveToken:(id *)a9 error:(id *)a10;
- (BOOL)updateSINFMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 parsedSINFInfo:(id)a6 saveObserver:(id)a7 error:(id *)a8;
- (BOOL)updateSINFWithData:(id)a3 forApplication:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)updateSINFWithData:(id)a3 forApplicationAtURL:(id)a4 error:(id *)a5;
- (BOOL)updateiTunesMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 metadataPlist:(id)a6 saveObserver:(id)a7 error:(id *)a8;
- (BOOL)updateiTunesMetadataWithData:(id)a3 forApplication:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)updateiTunesMetadataWithData:(id)a3 forApplicationAtURL:(id)a4 error:(id *)a5;
- (BOOL)urlContainsDeviceIdentifierForAdvertising:(id)a3;
- (LSInstallProgressList)observedInstallProgresses;
- (NSMutableDictionary)createdInstallProgresses;
- (id)URLOverrideForNewsURL:(id)a3;
- (id)URLOverrideForURL:(id)a3;
- (id)_LSPrivateRemovedSystemAppIdentifiers;
- (id)allApplications;
- (id)allInstalledApplications;
- (id)applicationForOpeningResource:(id)a3;
- (id)applicationForUserActivityDomainName:(id)a3;
- (id)applicationForUserActivityType:(id)a3;
- (id)applicationProxiesWithPlistFlags:(unsigned int)a3 bundleFlags:(unint64_t)a4;
- (id)applicationsAvailableForHandlingURLScheme:(id)a3;
- (id)applicationsAvailableForOpeningDocument:(id)a3;
- (id)applicationsAvailableForOpeningURL:(id)a3;
- (id)applicationsAvailableForOpeningURL:(id)a3 legacySPI:(BOOL)a4;
- (id)applicationsForUserActivityType:(id)a3;
- (id)applicationsForUserActivityType:(id)a3 limit:(unint64_t)a4;
- (id)applicationsOfType:(unint64_t)a3;
- (id)applicationsWithAudioComponents;
- (id)applicationsWithUIBackgroundModes;
- (id)applicationsWithVPNPlugins;
- (id)bundleIdentifiersForMachOUUIDs:(id)a3 error:(id *)a4;
- (id)createDeviceIdentifierWithVendorName:(id)a3 bundleIdentifier:(id)a4;
- (id)defaultApplicationForCategory:(unint64_t)a3 error:(id *)a4;
- (id)deviceIdentifierForAdvertising;
- (id)deviceIdentifierForVendor;
- (id)deviceIdentifierForVendorSeedData;
- (id)directionsApplications;
- (id)getPreferredAppMarketplacesWithError:(id *)a3;
- (id)installProgressForApplication:(id)a3 withPhase:(unint64_t)a4;
- (id)installProgressForBundleID:(id)a3 makeSynchronous:(unsigned __int8)a4;
- (id)installedPlugins;
- (id)legacyApplicationProxiesListWithType:(unint64_t)a3;
- (id)machOUUIDsForBundleIdentifiers:(id)a3 error:(id *)a4;
- (id)observerProxy;
- (id)openURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 isContentManaged:(BOOL)a6 sourceAuditToken:(id *)a7 userInfo:(id)a8 options:(id)a9 delegate:(id)a10;
- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 sourceIsManaged:(BOOL)a6 userInfo:(id)a7 delegate:(id)a8;
- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 sourceIsManaged:(BOOL)a6 userInfo:(id)a7 options:(id)a8 delegate:(id)a9;
- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 userInfo:(id)a6;
- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 userInfo:(id)a6 delegate:(id)a7;
- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 userInfo:(id)a5;
- (id)optionsFromOpenConfiguration:(id)a3;
- (id)placeholderApplications;
- (id)pluginsMatchingQuery:(id)a3 applyFilter:(id)a4;
- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5;
- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5 applyFilter:(id)a6;
- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5 withFilter:(id)a6;
- (id)privateURLSchemes;
- (id)publicURLSchemes;
- (id)registerContainerizedApplicationWithInfoDictionaries:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 saveObserver:(id)a6 registrationError:(id *)a7;
- (id)registerContainerizedApplicationWithInfoDictionaries:(id)a3 personaUniqueStrings:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 registrationError:(id *)a8;
- (id)registerContainerizedApplicationWithInstallationRecord:(id)a3 extensionInstallationRecords:(id)a4 personaUniqueStrings:(id)a5 operationUUID:(id)a6 requestContext:(id)a7 saveObserver:(id)a8 registrationError:(id *)a9;
- (id)remoteObserver;
- (id)removedSystemApplications;
- (id)scanForApplicationStateChangesFromRank:(id)a3 toRank:(id)a4;
- (id)scanForApplicationStateChangesWithAllowlist:(id)a3;
- (id)scanForForDeletableSystemApps;
- (id)syncObserverProxy;
- (id)systemMode;
- (id)unrestrictedApplications;
- (void)_LSClearSchemaCaches;
- (void)_LSFailedToOpenURL:(id)a3 withBundle:(id)a4;
- (void)_LSPrivateNoteMigratorRunning;
- (void)_LSPrivateSetRemovedSystemAppIdentifiers:(id)a3;
- (void)_LSPrivateUpdateAppRemovalRestrictions;
- (void)_openUserActivity:(id)a3 orUserActivityUUID:(id)a4 activityTypeForUUID:(id)a5 withApplicationProxy:(id)a6 options:(id)a7 completionHandler:(id)a8;
- (void)addObserver:(id)a3;
- (void)clearAdvertisingIdentifier;
- (void)clearCreatedProgressForBundleID:(id)a3;
- (void)commonClientOpenURL:(id)a3 options:(id)a4 configuration:(id)a5 synchronous:(BOOL)a6 completionHandler:(id)a7;
- (void)deviceIdentifierForVendorSeedData;
- (void)enumerateApplicationsOfType:(unint64_t)a3 block:(id)a4;
- (void)enumerateApplicationsOfType:(unint64_t)a3 legacySPI:(BOOL)a4 block:(id)a5;
- (void)enumerateBundlesOfType:(unint64_t)a3 block:(id)a4;
- (void)enumerateBundlesOfType:(unint64_t)a3 legacySPI:(BOOL)a4 block:(id)a5;
- (void)enumerateBundlesOfType:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumeratePluginsMatchingQuery:(id)a3 withBlock:(id)a4;
- (void)getHiddenApplicationsWithCompletion:(id)a3;
- (void)getKnowledgeUUID:(id *)a3 andSequenceNumber:(id *)a4;
- (void)getLockedApplicationsWithCompletion:(id)a3;
- (void)ls_resetTestingDatabase;
- (void)ls_testWithCleanDatabaseWithError:(id *)a3;
- (void)noteRestrictionsUpdateForOpensWithCompletion:(id)a3;
- (void)openApplicationWithBundleIdentifier:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
- (void)openApplicationWithBundleIdentifier:(id)a3 usingConfiguration:(id)a4 completionHandler:(id)a5;
- (void)openURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
- (void)openUserActivity:(id)a3 usingApplicationRecord:(id)a4 configuration:(id)a5 completionHandler:(id)a6;
- (void)openUserActivity:(id)a3 withApplicationProxy:(id)a4 completionHandler:(id)a5;
- (void)openUserActivity:(id)a3 withApplicationProxy:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)openUserActivityWithUUID:(id)a3 activityType:(id)a4 usingApplicationRecord:(id)a5 configuration:(id)a6 completionHandler:(id)a7;
- (void)placeholderInstalledForIdentifier:(id)a3 filterDowngrades:(BOOL)a4;
- (void)rebuildDatabaseContentForFrameworkAtURL:(id)a3 completionHandler:(id)a4;
- (void)relaxApplicationTypeRequirements:(BOOL)a3 forApplicationRecord:(id)a4 completionHandler:(id)a5;
- (void)removeAllDefaultApplicationPreferencesWithCompletionHandler:(id)a3;
- (void)removeDeviceIdentifierForVendorName:(id)a3 bundleIdentifier:(id)a4;
- (void)removeObserver:(id)a3;
- (void)sendApplicationStateChangedNotificationsFor:(id)a3 stateProvider:(id)a4 completion:(id)a5;
- (void)sendExtensionNotificationsForExtensionBundleIdentifier:(id)a3 changingRestrictionStateTo:(BOOL)a4;
- (void)sendExtensionNotificationsForSystemModeChangeFrom:(id)a3 to:(id)a4;
- (void)setDefaultApplicationForCategory:(unint64_t)a3 toApplicationRecord:(id)a4 completionHandler:(id)a5;
- (void)setDefaultMailClientToApplicationRecord:(id)a3 completionHandler:(id)a4;
- (void)setDefaultURLHandlerForScheme:(id)a3 to:(id)a4 completion:(id)a5;
- (void)setDefaultWebBrowserToApplicationRecord:(id)a3 completionHandler:(id)a4;
- (void)setHiddenApplications:(id)a3 completion:(id)a4;
- (void)setLockedApplications:(id)a3 completion:(id)a4;
- (void)systemMode;
@end

@implementation LSApplicationWorkspace

+ (id)defaultWorkspace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__LSApplicationWorkspace_defaultWorkspace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultWorkspace_once != -1) {
    dispatch_once(&defaultWorkspace_once, block);
  }
  v2 = (void *)defaultWorkspace_gDefaultWorkspace;

  return v2;
}

- (void)getKnowledgeUUID:(id *)a3 andSequenceNumber:(id *)a4
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  if (_LSCurrentProcessMayMapDatabase())
  {
    v13 = 0;
    if (!_LSContextInit(&v13))
    {
      uint64_t v6 = _LSDatabaseGetCacheGUID();
      v7 = (void *)v21[5];
      v21[5] = v6;

      uint64_t SequenceNumber = _LSDatabaseGetSequenceNumber();
      if (SequenceNumber)
      {
        uint64_t v9 = [NSNumber numberWithUnsignedLongLong:SequenceNumber];
        v10 = (void *)v15[5];
        v15[5] = v9;
      }
      _LSContextDestroy(&v13);
    }

    if (a3) {
      goto LABEL_7;
    }
  }
  else
  {
    __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    v11 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__LSApplicationWorkspace_getKnowledgeUUID_andSequenceNumber___block_invoke;
    v12[3] = &unk_1E522C5A0;
    v12[4] = &v20;
    v12[5] = &v14;
    [v11 getKnowledgeUUIDAndSequenceNumberWithCompletionHandler:v12];

    if (a3) {
LABEL_7:
    }
      *a3 = (id) v21[5];
  }
  if (a4) {
    *a4 = (id) v15[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

- (BOOL)applicationIsInstalled:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if (v3)
  {
    v4 = +[_LSApplicationIsInstalledQuery queryWithBundleIdentifier:v3];
    if (v4)
    {
      v5 = +[_LSQueryContext defaultContext];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __49__LSApplicationWorkspace_applicationIsInstalled___block_invoke;
      v8[3] = &unk_1E522BB88;
      v8[4] = &v9;
      [v5 enumerateResolvedResultsOfQuery:v4 withBlock:v8];
    }
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __49__LSApplicationWorkspace_applicationIsInstalled___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    id v6 = a2;
    v7 = [v6 propertyListWithClass:objc_opt_class()];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 BOOLValue];
    *a4 = 1;
  }
}

- (id)deviceIdentifierForVendor
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke;
  v5[3] = &unk_1E522C9C0;
  v5[4] = &v6;
  id v2 = _LSRetryForConnectionInterrupted(v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

id __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke(uint64_t a1)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__4;
  char v12 = __Block_byref_object_dispose__4;
  id v13 = 0;
  v7[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v7[1] = (void (*)(void, void))3221225472;
  v7[2] = (void (*)(void, void))__51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_2;
  v7[3] = (void (*)(void, void))&unk_1E522C550;
  v7[4] = (void (*)(void, void))&v8;
  id v2 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, v7);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_368;
  v6[3] = &unk_1E522C998;
  v6[4] = *(void *)(a1 + 32);
  [v2 getIdentifierOfType:0 completionHandler:v6];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    id v3 = 0;
  }
  else {
    id v3 = (void *)v9[5];
  }
  id v4 = v3;

  _Block_object_dispose(&v8, 8);

  return v4;
}

- (BOOL)isVersion:(id)a3 greaterThanOrEqualToVersion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 3515, @"Invalid parameter not satisfying: %@", @"version != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 3516, @"Invalid parameter not satisfying: %@", @"minVersion != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  long long v18 = 0u;
  long long v19 = 0u;
  _LSVersionNumberMakeWithString(&v18, v7);
  long long v16 = 0u;
  long long v17 = 0u;
  _LSVersionNumberMakeWithString(&v16, v9);
  v15[0] = v18;
  v15[1] = v19;
  v14[0] = v16;
  v14[1] = v17;
  BOOL v10 = _LSVersionNumberCompare(v15, v14) != -1;

  return v10;
}

- (id)systemMode
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  id v22 = 0;
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    +[LSApplicationRestrictionsManager sharedInstance]();
    id v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = -[LSApplicationRestrictionsManager systemMode](v2);
    id v4 = (void *)v18[5];
    v18[5] = v3;
  }
  else
  {
    uint64_t v11 = 0;
    char v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__4;
    v15 = __Block_byref_object_dispose__4;
    id v16 = 0;
    v10[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
    v10[1] = (void (*)(void, void))3221225472;
    v10[2] = (void (*)(void, void))__36__LSApplicationWorkspace_systemMode__block_invoke;
    v10[3] = (void (*)(void, void))&unk_1E522C550;
    v10[4] = (void (*)(void, void))&v11;
    v5 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v10);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__LSApplicationWorkspace_systemMode__block_invoke_2;
    v9[3] = &unk_1E522C578;
    v9[4] = &v11;
    v9[5] = &v17;
    [v5 getSystemModeWithCompletionHandler:v9];
    if (v12[5])
    {
      uint64_t v6 = _LSDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[LSApplicationWorkspace systemMode]();
      }
    }
    _Block_object_dispose(&v11, 8);
  }
  id v7 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke(uint64_t a1)
{
  if (!_sObserverConnection)
  {
    if (_LSProcessCanAccessProgressPort_onceToken != -1) {
      dispatch_once(&_LSProcessCanAccessProgressPort_onceToken, &__block_literal_global_1077);
    }
    if (_LSProcessCanAccessProgressPort_canAccessProgressPort)
    {
      id v2 = objc_alloc(MEMORY[0x1E4F29268]);
      uint64_t v3 = [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:5];
      id v4 = (void *)[v2 initWithMachServiceName:v3 options:4096];

      v5 = installProgressInterface();
      [v4 setRemoteObjectInterface:v5];

      uint64_t v6 = workspaceObserverInterface();
      [v4 setExportedInterface:v6];

      id v7 = (void *)_sObserverConnection;
      _sObserverConnection = (uint64_t)v4;

      id v8 = _LSProgressLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "Establishing xpc connection to lsd", buf, 2u);
      }

      if (_sObserverConnection)
      {
        [(id)_sObserverConnection setInvalidationHandler:&__block_literal_global_192];
        [(id)_sObserverConnection setInterruptionHandler:&__block_literal_global_197];
        uint64_t v9 = +[LSApplicationWorkspace _remoteObserver];
        [(id)_sObserverConnection setExportedObject:v9];

        [(id)_sObserverConnection resume];
        uint64_t v10 = [(id)_sObserverConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_206];
        uint64_t v11 = (void *)_sObserverProxy;
        _sObserverProxy = v10;

        [(id)_sObserverProxy _lsPing:@"LSWorkspaceObserverPing" reply:&__block_literal_global_213];
      }
      else
      {
        char v12 = _LSProgressLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "Failed to establish xpc connection to lsd", v14, 2u);
        }

        uint64_t v13 = (void *)_sObserverProxy;
        _sObserverProxy = 0;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      }
    }
  }
}

- (void)addObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = shouldConnectToLSD(v4);
  uint64_t v6 = _LSDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2048;
    id v16 = v4;
    id v7 = v14;
    _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_INFO, "LSApplicationWorkspace: adding observer %@ @ %p", buf, 0x16u);
  }
  performWithLSAWDistributedNotificationNameBasedOnObserverConformance(v4, (void (*)(__CFString *))subscribeToLSAWDistributedNotification);
  if (DeviceManagementLibrary_frameworkLibrary_0
    || (DeviceManagementLibrary_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/DeviceManagement.framework/DeviceManagement", 2)) != 0)
  {
    objc_opt_class();
    char v8 = (objc_opt_isKindOfClass() & 1) != 0
       ? [(id)objc_opt_class() actuallyOverridesDMFObserverMethod]
       : objc_opt_respondsToSelector();
    if (v8)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__LSApplicationWorkspace_addObserver___block_invoke;
      block[3] = &unk_1E522C268;
      block[4] = self;
      if (addObserver__onceToken != -1) {
        dispatch_once(&addObserver__onceToken, block);
      }
    }
  }
  uint64_t v9 = [(LSApplicationWorkspace *)self remoteObserver];
  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    [v9 setObservinglsd:1];
    [v9 addLocalObserver:v4];
    if (v5)
    {
      uint64_t v11 = [(LSApplicationWorkspace *)v10 observerProxy];
      [v11 addObserver];
    }
    objc_sync_exit(v10);
  }
}

- (id)remoteObserver
{
  if (![(LSApplicationWorkspace *)self establishConnection])
  {
    uint64_t v3 = _LSDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "failed to establish connection to xpc service", v10, 2u);
    }
  }
  id v4 = self;
  objc_sync_enter(v4);
  int v5 = +[LSApplicationWorkspace _remoteObserver];
  if (([v5 isObservinglsd] & 1) == 0)
  {
    uint64_t v6 = +[LSApplicationWorkspace _remoteObserver];
    uint64_t v7 = [v6 currentObserverCount];

    if (!v7) {
      goto LABEL_9;
    }
    [(id)_sObserverProxy addObserver];
    int v5 = +[LSApplicationWorkspace _remoteObserver];
    [v5 setObservinglsd:1];
  }

LABEL_9:
  objc_sync_exit(v4);

  char v8 = +[LSApplicationWorkspace _remoteObserver];

  return v8;
}

+ (id)_remoteObserver
{
  if (_remoteObserver_onceToken != -1) {
    dispatch_once(&_remoteObserver_onceToken, &__block_literal_global_182);
  }
  id v2 = (void *)_sRemoteObserver;

  return v2;
}

- (BOOL)establishConnection
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  id v2 = +[LSApplicationWorkspace progressQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__LSApplicationWorkspace_establishConnection__block_invoke;
  block[3] = &unk_1E522C608;
  block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

+ (id)progressQueue
{
  if (progressQueue_once != -1) {
    dispatch_once(&progressQueue_once, &__block_literal_global_8);
  }
  id v2 = (void *)progressQueue_result;

  return v2;
}

- (id)observerProxy
{
  if (![(LSApplicationWorkspace *)self establishConnection])
  {
    id v2 = _LSDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "failed to establish connection to xpc service", v5, 2u);
    }
  }
  uint64_t v3 = (void *)_sObserverProxy;

  return v3;
}

void __42__LSApplicationWorkspace_defaultWorkspace__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)defaultWorkspace_gDefaultWorkspace;
  defaultWorkspace_gDefaultWorkspace = (uint64_t)v1;
}

- (id)pluginsMatchingQuery:(id)a3 applyFilter:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  char v8 = [v6 arrayWithCapacity:0];
  if (v5) {
    id v9 = v5;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CC08];
  }
  uint64_t v10 = +[LSPlugInQuery pluginQueryWithQueryDictionary:v9 applyFilter:v7];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __59__LSApplicationWorkspace_pluginsMatchingQuery_applyFilter___block_invoke;
  uint64_t v20 = &unk_1E522C858;
  id v11 = v8;
  id v21 = v11;
  id v12 = v5;
  id v22 = v12;
  enumeratePluginsMatchingQuery(v10, &v17);
  if (!objc_msgSend(v11, "count", v17, v18, v19, v20))
  {
    uint64_t v13 = _LSDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v12;
      _os_log_impl(&dword_182959000, v13, OS_LOG_TYPE_DEFAULT, "No plugins found to match query %@", buf, 0xCu);
    }
  }
  id v14 = v22;
  id v15 = v11;

  return v15;
}

void __36__LSApplicationWorkspace_systemMode__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    char v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    char v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

void __41__LSApplicationWorkspace__remoteObserver__block_invoke()
{
  v0 = objc_alloc_init(LSApplicationWorkspaceRemoteObserver);
  id v1 = (void *)_sRemoteObserver;
  _sRemoteObserver = (uint64_t)v0;
}

void __39__LSApplicationWorkspace_progressQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.launchservices.clientprogress", v2);
  id v1 = (void *)progressQueue_result;
  progressQueue_result = (uint64_t)v0;
}

void __77__LSApplicationWorkspace_Marketplaces__getPreferredAppMarketplacesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)getPreferredAppMarketplacesWithError:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__4;
  uint64_t v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  id v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v9[1] = (void (*)(void, void))3221225472;
  v9[2] = (void (*)(void, void))__77__LSApplicationWorkspace_Marketplaces__getPreferredAppMarketplacesWithError___block_invoke;
  v9[3] = (void (*)(void, void))&unk_1E522C550;
  v9[4] = (void (*)(void, void))&v10;
  id v4 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__LSApplicationWorkspace_Marketplaces__getPreferredAppMarketplacesWithError___block_invoke_2;
  v8[3] = &unk_1E522CCA8;
  v8[4] = &v16;
  void v8[5] = &v10;
  [v4 getPreferredAppMarketplacesWithCompletion:v8];

  id v5 = (void *)v17[5];
  if (a3 && !v5)
  {
    *a3 = (id) v11[5];
    id v5 = (void *)v17[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v6;
}

- (void)_openUserActivity:(id)a3 orUserActivityUUID:(id)a4 activityTypeForUUID:(id)a5 withApplicationProxy:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  v52[1] = *MEMORY[0x1E4F143B8];
  unint64_t v14 = (unint64_t)a3;
  unint64_t v15 = (unint64_t)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v19) {
    id v19 = (id)[&__block_literal_global_277 copy];
  }
  if (_openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__once != -1)
  {
    dispatch_once(&_openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__once, &__block_literal_global_279);
    if (v14) {
      goto LABEL_5;
    }
LABEL_16:
    int v21 = 0;
    goto LABEL_17;
  }
  if (!v14) {
    goto LABEL_16;
  }
LABEL_5:
  if (v17)
  {
    uint64_t v20 = [v17 appState];
    int v21 = [v20 isInstalled] ^ 1;
  }
  else
  {
    uint64_t v20 = [(id)v14 _determineMatchingApplicationBundleIdentifierWithOptions:0];
    if (v20)
    {
      id v17 = +[LSApplicationProxy applicationProxyForIdentifier:v20 placeholder:0];
    }
    else
    {
      id v41 = v16;
      CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      v23 = [(id)v14 _teamIdentifier];
      id v24 = [(id)v14 activityType];
      uint64_t v25 = (__CFString *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType(v22, v23, v24);

      if (v25)
      {
        id v17 = [(LSApplicationWorkspace *)self applicationForUserActivityType:v25];
      }
      else
      {
        id v17 = 0;
      }
      id v16 = v41;
    }
    int v21 = 1;
  }

LABEL_17:
  if (v14 | v15
    && v17
    && [v17 isInstalled]
    && ([v17 isRestricted] & 1) == 0)
  {
    v40 = _openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__openUAQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_3;
    block[3] = &unk_1E522C718;
    id v43 = (id)v14;
    id v44 = (id)v15;
    id v45 = v16;
    id v48 = v19;
    id v46 = v17;
    id v47 = v18;
    dispatch_async(v40, block);
  }
  else if (v21)
  {
    v26 = [v17 bundleIdentifier];

    if (v26)
    {
      v27 = [v17 bundleIdentifier];
      v28 = +[LSApplicationProxy applicationProxyForSystemPlaceholder:v27];

      if (v28)
      {
        v29 = [(id)v14 webpageURL];
        v30 = [v28 bundleIdentifier];
        [(LSApplicationWorkspace *)self _LSFailedToOpenURL:v29 withBundle:v30];
      }
    }
    v31 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"-[LSApplicationWorkspace _openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:]", 1771, 0);
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v31);
  }
  else
  {
    if (v15
      && ([v17 appState],
          v32 = objc_claimAutoreleasedReturnValue(),
          char v33 = [v32 isInstalled],
          v32,
          (v33 & 1) == 0))
    {
      v38 = (void *)*MEMORY[0x1E4F28760];
      uint64_t v51 = *MEMORY[0x1E4F28228];
      v52[0] = @"Application must be non-nil and installed.";
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      v36 = v38;
      uint64_t v37 = 1775;
    }
    else
    {
      v34 = (void *)*MEMORY[0x1E4F28760];
      uint64_t v49 = *MEMORY[0x1E4F28228];
      v50 = @"invalid input parameters";
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      v36 = v34;
      uint64_t v37 = 1779;
    }
    v39 = _LSMakeNSErrorImpl(v36, -50, (uint64_t)"-[LSApplicationWorkspace _openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:]", v37, v35);
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v39);
  }
}

+ (id)callbackQueue
{
  if (callbackQueue_once != -1) {
    dispatch_once(&callbackQueue_once, &__block_literal_global_178);
  }
  id v2 = (void *)callbackQueue_result;

  return v2;
}

void __39__LSApplicationWorkspace_callbackQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.launchservices.clientcallbacks", v2);
  id v1 = (void *)callbackQueue_result;
  callbackQueue_result = (uint64_t)v0;
}

+ (id)activeManagedConfigurationRestrictionUUIDs
{
  return +[LSApplicationRestrictionsManager activeRestrictionIdentifiers]();
}

void __36__LSApplicationWorkspace_systemMode__block_invoke(uint64_t a1, void *a2)
{
}

void __61__LSApplicationWorkspace_getKnowledgeUUID_andSequenceNumber___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_190()
{
  dispatch_queue_t v0 = _LSDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_182959000, v0, OS_LOG_TYPE_DEFAULT, "progress connection invalidationHandler called", v2, 2u);
  }

  id v1 = +[LSApplicationWorkspace progressQueue];
  dispatch_sync(v1, &__block_literal_global_195);
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_193()
{
  dispatch_queue_t v0 = (void *)_sObserverConnection;
  _sObserverConnection = 0;

  id v1 = +[LSApplicationWorkspace _remoteObserver];
  [v1 setObservinglsd:0];
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_2()
{
  dispatch_queue_t v0 = _LSDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_182959000, v0, OS_LOG_TYPE_DEFAULT, "interruptionHandler called, re-establishing connection to lsd", v2, 2u);
  }

  id v1 = +[LSApplicationWorkspace progressQueue];
  dispatch_sync(v1, &__block_literal_global_200);
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_198()
{
  dispatch_queue_t v0 = [(id)_sObserverConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_203];
  [v0 addObserver];

  id v1 = +[LSApplicationWorkspace _remoteObserver];
  [v1 setObservinglsd:1];
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_2_201(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "Error %@ trying to re-establish observing connection to lsd", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[LSApplicationWorkspace _remoteObserver];
  [v4 setObservinglsd:0];
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_204(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "Error %@ trying to establish observing connection to lsd", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[LSApplicationWorkspace _remoteObserver];
  [v4 setObservinglsd:0];
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_210(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _LSProgressLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "Received %@, xpc connection established", (uint8_t *)&v4, 0xCu);
  }
}

- (id)syncObserverProxy
{
  if (![(LSApplicationWorkspace *)self establishConnection])
  {
    id v2 = _LSDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "failed to establish connection to xpc service", buf, 2u);
    }
  }
  *(void *)buf = 0;
  char v8 = buf;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  uint64_t v3 = +[LSApplicationWorkspace progressQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__LSApplicationWorkspace_syncObserverProxy__block_invoke;
  block[3] = &unk_1E522C608;
  void block[4] = buf;
  dispatch_sync(v3, block);

  id v4 = *((id *)v8 + 5);
  _Block_object_dispose(buf, 8);

  return v4;
}

void __43__LSApplicationWorkspace_syncObserverProxy__block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)_sObserverConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_215_0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __43__LSApplicationWorkspace_syncObserverProxy__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "Error %@ trying to establish observing connection to lsd", (uint8_t *)&v4, 0xCu);
  }
}

void __38__LSApplicationWorkspace_addObserver___block_invoke(uint64_t a1)
{
  id v2 = _LSGetDMFNotificationCenter();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__LSApplicationWorkspace_addObserver___block_invoke_2;
  v4[3] = &unk_1E522C630;
  v4[4] = *(void *)(a1 + 32);
  id v3 = (id)[v2 addObserverForName:@"com.apple.launchservices.private._LSDMFPolicyDidChangeNotification" object:0 queue:0 usingBlock:v4];
}

void __38__LSApplicationWorkspace_addObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 remoteObserver];
  int v4 = [v3 object];

  [v5 deviceManagementPolicyDidChange:v4];
}

- (void)removeObserver:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = shouldConnectToLSD(v4);
  uint64_t v6 = _LSDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2048;
    id v18 = v4;
    id v7 = v16;
    _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_INFO, "LSApplicationWorkspace: removing observer %@ @ %p", (uint8_t *)&v15, 0x16u);
  }
  char v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [(LSApplicationWorkspace *)v8 remoteObserver];
  [v9 removeLocalObserver:v4];

  uint64_t v10 = [(LSApplicationWorkspace *)v8 remoteObserver];
  BOOL v11 = [v10 currentObserverCount] == 0;

  if (v5) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    uint64_t v13 = [(LSApplicationWorkspace *)v8 observerProxy];
    [v13 removeObserver];

    unint64_t v14 = +[LSApplicationWorkspace progressQueue];
    dispatch_async(v14, &__block_literal_global_266);
  }
  performWithLSAWDistributedNotificationNameBasedOnObserverConformance(v4, (void (*)(__CFString *))unsubscribeFromLSAWDistributedNotification);
  objc_sync_exit(v8);
}

uint64_t __41__LSApplicationWorkspace_removeObserver___block_invoke()
{
  return [(id)_sObserverConnection invalidate];
}

- (id)applicationProxiesWithPlistFlags:(unsigned int)a3 bundleFlags:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = +[_LSApplicationProxiesWithFlagsQuery queryWithPlistFlags:v5 bundleFlags:a4];
  if (v7)
  {
    char v8 = +[_LSQueryContext defaultContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__LSApplicationWorkspace_applicationProxiesWithPlistFlags_bundleFlags___block_invoke;
    v10[3] = &unk_1E522C658;
    id v11 = v6;
    [v8 enumerateResolvedResultsOfQuery:v7 withBlock:v10];
  }

  return v6;
}

uint64_t __71__LSApplicationWorkspace_applicationProxiesWithPlistFlags_bundleFlags___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (id)directionsApplications
{
  return [(LSApplicationWorkspace *)self applicationProxiesWithPlistFlags:256 bundleFlags:0];
}

- (id)applicationsWithUIBackgroundModes
{
  return [(LSApplicationWorkspace *)self applicationProxiesWithPlistFlags:512 bundleFlags:0];
}

- (id)applicationsWithAudioComponents
{
  return [(LSApplicationWorkspace *)self applicationProxiesWithPlistFlags:1024 bundleFlags:0];
}

- (id)applicationsWithVPNPlugins
{
  return [(LSApplicationWorkspace *)self applicationProxiesWithPlistFlags:4096 bundleFlags:0];
}

- (id)applicationsForUserActivityType:(id)a3 limit:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    a3 = &stru_1ECB1A570;
  }
  id v4 = +[LSApplicationRecord applicationRecordsForUserActivityType:a3 limit:a4 error:0];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "compatibilityObject", (void)v15);
          BOOL v12 = v11;
          if (v11)
          {
            [v11 detach];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    uint64_t v13 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)applicationsForUserActivityType:(id)a3
{
  return [(LSApplicationWorkspace *)self applicationsForUserActivityType:a3 limit:-1];
}

- (id)applicationForUserActivityType:(id)a3
{
  id v3 = [(LSApplicationWorkspace *)self applicationsForUserActivityType:a3 limit:1];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)applicationForUserActivityDomainName:(id)a3
{
  if (!a3) {
    a3 = &stru_1ECB1A570;
  }
  id v3 = +[LSApplicationRecord applicationRecordsForUserActivityDomainName:a3 limit:1 error:0];
  id v4 = [v3 firstObject];

  if (v4)
  {
    uint64_t v5 = [v4 compatibilityObject];
    [v5 detach];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)openApplicationWithBundleID:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v4 = (void *)MEMORY[0x18530F680]();
  _LSFaultIfRunningOnMainThreadOfShellApp();
  uint64_t v5 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__LSApplicationWorkspace_openApplicationWithBundleID___block_invoke;
  v7[3] = &unk_1E522C680;
  v7[4] = &v8;
  [v5 openApplicationWithIdentifier:v3 options:MEMORY[0x1E4F1CC08] useClientProcessHandle:0 completionHandler:v7];

  LOBYTE(v4) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v4;
}

uint64_t __54__LSApplicationWorkspace_openApplicationWithBundleID___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)openURL:(id)a3
{
  return [(LSApplicationWorkspace *)self openURL:a3 withOptions:0];
}

- (BOOL)openURL:(id)a3 withOptions:(id)a4
{
  return [(LSApplicationWorkspace *)self openURL:a3 withOptions:a4 error:0];
}

- (BOOL)openURL:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  id v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  _LSFaultIfRunningOnMainThreadOfShellApp();
  uint64_t v9 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  id v19 = 0;
  int FileHandleForOpeningResource = getFileHandleForOpeningResource(v7, 0, 0, &v19, &obj);
  id v11 = v19;
  objc_storeStrong(v9, obj);
  if (FileHandleForOpeningResource)
  {
    v17[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
    v17[1] = (void (*)(void, void))3221225472;
    v17[2] = (void (*)(void, void))__52__LSApplicationWorkspace_openURL_withOptions_error___block_invoke;
    v17[3] = (void (*)(void, void))&unk_1E522C550;
    v17[4] = (void (*)(void, void))&v20;
    BOOL v12 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v17);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__LSApplicationWorkspace_openURL_withOptions_error___block_invoke_2;
    v16[3] = &unk_1E522C6A8;
    v16[4] = &v26;
    v16[5] = &v20;
    [v12 openURL:v7 fileHandle:v11 options:v8 completionHandler:v16];
  }
  int v13 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((unsigned char *)v27 + 24))
  {
    *a5 = (id) v21[5];
    int v13 = *((unsigned __int8 *)v27 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __52__LSApplicationWorkspace_openURL_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __52__LSApplicationWorkspace_openURL_withOptions_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)openSensitiveURL:(id)a3 withOptions:(id)a4
{
  return [(LSApplicationWorkspace *)self openSensitiveURL:a3 withOptions:a4 error:0];
}

- (BOOL)openSensitiveURL:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  if (a4)
  {
    id v9 = a3;
    id v10 = (id)[a4 mutableCopy];
  }
  else
  {
    id v11 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v12 = a3;
    id v10 = objc_alloc_init(v11);
  }
  int v13 = v10;
  [v10 setObject:MEMORY[0x1E4F1CC38] forKey:@"LSOpenSensitiveURLOption"];
  BOOL v14 = [(LSApplicationWorkspace *)self openURL:a3 withOptions:v13 error:a5];

  return v14;
}

void __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_2()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("LSApplicationWorkspace openUserActivity queue", v2);
  id v1 = (void *)_openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__openUAQueue;
  _openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__openUAQueue = (uint64_t)v0;
}

void __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x18530F680]();
  id v3 = *(void **)(a1 + 32);
  if (!v3)
  {
    id v4 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    id v7 = 0;
    id v6 = 0;
    goto LABEL_5;
  }
  id v4 = [v3 _uniqueIdentifier];
  uint64_t v5 = *(void **)(a1 + 32);
  id v16 = 0;
  id v6 = _LSGetDataForUserActivity(v5, &v16);
  id v7 = v16;
  id v8 = [*(id *)(a1 + 32) activityType];
  if (v6)
  {
LABEL_5:
    id v11 = (void (*)(void, void))MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    int v13 = __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_4;
    BOOL v14 = &unk_1E522C6F0;
    id v15 = *(id *)(a1 + 72);
    id v9 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, &v11);
    id v10 = objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier", v11, v12, v13, v14);
    [v9 openUserActivityWithUniqueIdentifier:v4 activityData:v6 activityType:v8 bundleIdentifier:v10 options:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];

    goto LABEL_6;
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_6:
}

uint64_t __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openUserActivity:(id)a3 withApplicationProxy:(id)a4 options:(id)a5 completionHandler:(id)a6
{
}

- (void)openUserActivity:(id)a3 withApplicationProxy:(id)a4 completionHandler:(id)a5
{
}

- (void)openUserActivity:(id)a3 usingApplicationRecord:(id)a4 configuration:(id)a5 completionHandler:(id)a6
{
  id v17 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v17)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 1795, @"Invalid parameter not satisfying: %@", @"userActivity != nil" object file lineNumber description];
  }
  BOOL v14 = [v11 compatibilityObject];
  id v15 = [(LSApplicationWorkspace *)self optionsFromOpenConfiguration:v12];
  [(LSApplicationWorkspace *)self _openUserActivity:v17 orUserActivityUUID:0 activityTypeForUUID:0 withApplicationProxy:v14 options:v15 completionHandler:v13];
}

- (void)openUserActivityWithUUID:(id)a3 activityType:(id)a4 usingApplicationRecord:(id)a5 configuration:(id)a6 completionHandler:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v22)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 1808, @"Invalid parameter not satisfying: %@", @"activityType != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 1807, @"Invalid parameter not satisfying: %@", @"uuid != nil" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  int v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 1809, @"Invalid parameter not satisfying: %@", @"appRecord != nil" object file lineNumber description];

LABEL_4:
  id v17 = [v14 compatibilityObject];
  long long v18 = [(LSApplicationWorkspace *)self optionsFromOpenConfiguration:v15];
  [(LSApplicationWorkspace *)self _openUserActivity:0 orUserActivityUUID:v22 activityTypeForUUID:v13 withApplicationProxy:v17 options:v18 completionHandler:v16];
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 isContentManaged:(BOOL)a6 sourceAuditToken:(id *)a7 userInfo:(id)a8 options:(id)a9 delegate:(id)a10
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  uint64_t v20 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:&__block_literal_global_309];
  if (v19)
  {
    int v21 = [[_LSOpenResourceOperationDelegateWrapper alloc] initWithOperation:v20 wrappedDelegate:v19];

    if (!a7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v21 = 0;
  if (a7)
  {
LABEL_3:
    a7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a7 length:32];
  }
LABEL_4:
  id v22 = (void *)[v18 mutableCopy];
  v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    id v24 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v25 = v24;

  [v25 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"LSBlockUntilComplete"];
  id v26 = v25;

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_2;
  v36[3] = &unk_1E522C790;
  id v37 = v14;
  id v38 = v17;
  id v39 = v26;
  v40 = v21;
  id v41 = v15;
  id v42 = v16;
  BOOL v44 = a6;
  id v43 = ($115C4C562B26FF47E01F9F4EA65B5887 *)a7;
  v27 = (id)a7;
  id v28 = v16;
  id v29 = v15;
  v30 = v21;
  id v31 = v26;
  id v32 = v17;
  id v33 = v14;
  [v20 addExecutionBlock:v36];

  return v20;
}

void __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_2(uint64_t a1)
{
  _LSFaultIfRunningOnMainThreadOfShellApp();
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  v22[0] = 0;
  id v21 = 0;
  int FileHandleForOpeningResource = getFileHandleForOpeningResource(v2, v3, v4, v22, &v21);
  id v6 = v22[0];
  id v7 = v21;
  if (FileHandleForOpeningResource)
  {
    v19[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
    v19[1] = (void (*)(void, void))3221225472;
    v19[2] = (void (*)(void, void))__152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_3;
    v19[3] = (void (*)(void, void))&unk_1E522C740;
    id v20 = *(id *)(a1 + 56);
    id v8 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v19);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 72);
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 88);
    uint64_t v12 = [*(id *)(a1 + 80) bytes];
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    id v15 = *(void **)(a1 + 56);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_4;
    v17[3] = &unk_1E522C768;
    id v18 = v15;
    [v8 performOpenOperationWithURL:v9 fileHandle:v6 bundleIdentifier:v16 documentIdentifier:v10 isContentManaged:v11 sourceAuditToken:v12 userInfo:v14 options:v13 delegate:v18 completionHandler:v17];
  }
  else
  {
    [*(id *)(a1 + 56) openResourceOperation:0 didFailWithError:v7];
  }
}

uint64_t __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) openResourceOperation:0 didFailWithError:a2];
}

uint64_t __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_4(uint64_t a1, int a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 openResourceOperationDidComplete:0];
  }
  else {
    return [v3 openResourceOperation:0 didFailWithError:a3];
  }
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 sourceIsManaged:(BOOL)a6 userInfo:(id)a7 options:(id)a8 delegate:(id)a9
{
  return [(LSApplicationWorkspace *)self operationToOpenResource:a3 usingApplication:a4 uniqueDocumentIdentifier:a5 isContentManaged:a6 sourceAuditToken:0 userInfo:a7 options:a8 delegate:a9];
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 sourceIsManaged:(BOOL)a6 userInfo:(id)a7 delegate:(id)a8
{
  return [(LSApplicationWorkspace *)self operationToOpenResource:a3 usingApplication:a4 uniqueDocumentIdentifier:a5 isContentManaged:a6 sourceAuditToken:0 userInfo:a7 options:0 delegate:a8];
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 userInfo:(id)a6 delegate:(id)a7
{
  return [(LSApplicationWorkspace *)self operationToOpenResource:a3 usingApplication:a4 uniqueDocumentIdentifier:a5 isContentManaged:0 sourceAuditToken:0 userInfo:a6 options:0 delegate:a7];
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 userInfo:(id)a6
{
  return [(LSApplicationWorkspace *)self operationToOpenResource:a3 usingApplication:a4 uniqueDocumentIdentifier:a5 userInfo:a6 delegate:0];
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 userInfo:(id)a5
{
  return [(LSApplicationWorkspace *)self operationToOpenResource:a3 usingApplication:a4 uniqueDocumentIdentifier:0 userInfo:a5];
}

- (id)optionsFromOpenConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v3)
  {
    uint64_t v5 = [v3 frontBoardOptions];

    if (v5)
    {
      id v6 = [v3 frontBoardOptions];
      [v4 addEntriesFromDictionary:v6];
    }
    id v7 = [v3 referrerURL];
    [v4 setObject:v7 forKeyedSubscript:@"ReferrerURL"];

    if ([v3 isSensitive]) {
      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"LSOpenSensitiveURLOption"];
    }
    if (([v3 allowURLOverrides] & 1) == 0) {
      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"NoOverrides"];
    }
    id v8 = [v3 targetConnectionEndpoint];

    if (v8)
    {
      uint64_t v9 = [v3 targetConnectionEndpoint];
      [v4 setObject:v9 forKeyedSubscript:@"LSTargetBSServiceConnectionEndpointKey"];
    }
    uint64_t v10 = [v3 clickAttribution];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = getUISOpenApplicationOptionClickAttribution[0]();

      if (v12)
      {
        uint64_t v13 = [v3 clickAttribution];
        [v4 setObject:v13 forKeyedSubscript:getUISOpenApplicationOptionClickAttribution[0]()];
      }
    }
    uint64_t v14 = [v3 pasteSharingToken];
    if (v14)
    {
      id v15 = (void *)v14;
      uint64_t v16 = getUISOpenApplicationOptionPasteSharingToken[0]();

      if (v16)
      {
        id v17 = [v3 pasteSharingToken];
        [v4 setObject:v17 forKeyedSubscript:getUISOpenApplicationOptionPasteSharingToken[0]()];
      }
    }
  }
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"LSBlockUntilComplete"];
  id v18 = (void *)[v4 copy];

  return v18;
}

- (id)openURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  id v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__4;
  id v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  uint64_t v10 = [(LSApplicationWorkspace *)self optionsFromOpenConfiguration:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__LSApplicationWorkspace_openURL_configuration_error___block_invoke;
  v13[3] = &unk_1E522C7B8;
  v13[4] = &v20;
  v13[5] = &v14;
  [(LSApplicationWorkspace *)self commonClientOpenURL:v8 options:v10 configuration:v9 synchronous:1 completionHandler:v13];
  if (a5) {
    *a5 = (id) v15[5];
  }
  id v11 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __54__LSApplicationWorkspace_openURL_configuration_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)openURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(LSApplicationWorkspace *)self optionsFromOpenConfiguration:v9];
  [(LSApplicationWorkspace *)self commonClientOpenURL:v10 options:v11 configuration:v9 synchronous:0 completionHandler:v8];
}

- (void)commonClientOpenURL:(id)a3 options:(id)a4 configuration:(id)a5 synchronous:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v13)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 2094, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];
  }
  id v17 = _LSDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v25 = loggableURL(v13);
    *(_DWORD *)buf = 138478339;
    id v39 = v25;
    __int16 v40 = 2113;
    id v41 = v14;
    __int16 v42 = 1024;
    BOOL v43 = v8;
    _os_log_debug_impl(&dword_182959000, v17, OS_LOG_TYPE_DEBUG, "Opening URL %{private}@ with options dictionary %{private}@ synchronous: %u", buf, 0x1Cu);
  }
  id v37 = 0;
  id v36 = 0;
  int FileHandleForOpeningResource = getFileHandleForOpeningResource(v13, 0, v14, &v37, &v36);
  id v19 = v37;
  id v20 = v36;
  if (FileHandleForOpeningResource)
  {
    if (v8)
    {
      _LSFaultIfRunningOnMainThreadOfShellApp();
      v33[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
      v33[1] = (void (*)(void, void))3221225472;
      v33[2] = (void (*)(void, void))__98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke;
      v33[3] = (void (*)(void, void))&unk_1E522C7E0;
      id v21 = &v34;
      id v34 = v13;
      uint64_t v22 = &v35;
      id v35 = v16;
      uint64_t v23 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v33);
    }
    else
    {
      v30[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
      v30[1] = (void (*)(void, void))3221225472;
      v30[2] = (void (*)(void, void))__98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_316;
      v30[3] = (void (*)(void, void))&unk_1E522C7E0;
      id v21 = &v31;
      id v31 = v13;
      uint64_t v22 = &v32;
      id v32 = v16;
      uint64_t v23 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v30);
    }
    id v24 = (void *)v23;

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_317;
    v27[3] = &unk_1E522C808;
    id v28 = v13;
    id v29 = v16;
    [v24 openURL:v28 fileHandle:v19 options:v14 completionHandler:v27];
  }
  else
  {
    (*((void (**)(id, void, id))v16 + 2))(v16, 0, v20);
  }
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _LSDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_316(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _LSDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_316_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_317(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_317_cold_1();
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    if (a2) {
      uint64_t v8 = MEMORY[0x1E4F1CC08];
    }
    else {
      uint64_t v8 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)openApplicationWithBundleIdentifier:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
}

- (void)openApplicationWithBundleIdentifier:(id)a3 usingConfiguration:(id)a4 completionHandler:(id)a5
{
}

- (id)installedPlugins
{
  if (!_LSCurrentProcessMayMapDatabase() && pluginQueryFault_onceToken != -1) {
    dispatch_once(&pluginQueryFault_onceToken, &__block_literal_global_1114);
  }
  id v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  id v3 = +[LSPlugInQuery pluginQuery];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__LSApplicationWorkspace_installedPlugins__block_invoke;
  v6[3] = &unk_1E522C830;
  id v4 = v2;
  id v7 = v4;
  enumeratePluginsMatchingQuery(v3, v6);

  return v4;
}

void __42__LSApplicationWorkspace_installedPlugins__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) addObject:a2];
  }
  else
  {
    id v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get all plugins: <%@>", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5 applyFilter:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  id v13 = v12;
  if (v8)
  {
    [v12 setValue:v8 forKey:@"NSExtensionIdentifier"];
    if (v9)
    {
      [v13 setValue:v9 forKey:@"NSExtensionPointName"];
      id v14 = (id)MEMORY[0x1E4F1CC38];
      id v15 = @"LSShouldORIdentifiers";
      uint64_t v12 = v13;
LABEL_6:
      [v12 setValue:v14 forKey:v15];
    }
  }
  else if (v9)
  {
    id v15 = @"NSExtensionPointName";
    id v14 = v9;
    goto LABEL_6;
  }
  id v16 = +[LSPlugInQuery pluginQueryWithQueryDictionary:v13 applyFilter:v10];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  id v22[2] = __79__LSApplicationWorkspace_pluginsWithIdentifiers_protocols_version_applyFilter___block_invoke;
  v22[3] = &unk_1E522C858;
  id v17 = v11;
  id v23 = v17;
  id v24 = v13;
  id v18 = v13;
  enumeratePluginsMatchingQuery(v16, v22);
  id v19 = v24;
  id v20 = v17;

  return v20;
}

void __79__LSApplicationWorkspace_pluginsWithIdentifiers_protocols_version_applyFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
  else if (v6)
  {
    id v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get plugins matching query %@: <%@>", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)enumeratePluginsMatchingQuery:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  if (a3) {
    id v6 = a3;
  }
  else {
    id v6 = (id)MEMORY[0x1E4F1CC08];
  }
  int v7 = +[LSPlugInQuery pluginQueryWithQueryDictionary:v6 applyFilter:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__LSApplicationWorkspace_enumeratePluginsMatchingQuery_withBlock___block_invoke;
  v9[3] = &unk_1E522C880;
  id v10 = v5;
  id v8 = v5;
  enumeratePluginsMatchingQuery(v7, v9);
}

uint64_t __66__LSApplicationWorkspace_enumeratePluginsMatchingQuery_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__LSApplicationWorkspace_pluginsMatchingQuery_applyFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
  else if (v6)
  {
    id v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get plugins matching query %@: <%@>", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)enumerateBundlesOfType:(unint64_t)a3 legacySPI:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  if (v7)
  {
    if (a3 == 6)
    {
      id v8 = +[LSPlugInQuery pluginQuery];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      _OWORD v14[2] = __65__LSApplicationWorkspace_enumerateBundlesOfType_legacySPI_block___block_invoke;
      v14[3] = &unk_1E522C880;
      uint64_t v9 = &v15;
      id v15 = v7;
      enumeratePluginsMatchingQuery(v8, v14);
    }
    else
    {
      int v10 = +[_LSBundleProxiesOfTypeQuery queryWithType:a3];
      id v8 = v10;
      if (!v10)
      {
LABEL_7:

        goto LABEL_8;
      }
      [v10 setLegacy:v5];
      uint64_t v11 = +[_LSQueryContext defaultContext];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__LSApplicationWorkspace_enumerateBundlesOfType_legacySPI_block___block_invoke_2;
      v12[3] = &unk_1E522C8A8;
      uint64_t v9 = &v13;
      id v13 = v7;
      [v11 enumerateResolvedResultsOfQuery:v8 withBlock:v12];
    }
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __65__LSApplicationWorkspace_enumerateBundlesOfType_legacySPI_block___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __65__LSApplicationWorkspace_enumerateBundlesOfType_legacySPI_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v4;
  }
}

- (void)enumerateBundlesOfType:(unint64_t)a3 block:(id)a4
{
}

- (void)enumerateApplicationsOfType:(unint64_t)a3 legacySPI:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  if (v7)
  {
    id v8 = +[_LSApplicationProxiesOfTypeQuery queryWithType:a3];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 setLegacy:v5];
      int v10 = +[_LSQueryContext defaultContext];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __70__LSApplicationWorkspace_enumerateApplicationsOfType_legacySPI_block___block_invoke;
      v11[3] = &unk_1E522C8A8;
      id v12 = v7;
      [v10 enumerateResolvedResultsOfQuery:v9 withBlock:v11];
    }
  }
}

uint64_t __70__LSApplicationWorkspace_enumerateApplicationsOfType_legacySPI_block___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)enumerateApplicationsOfType:(unint64_t)a3 block:(id)a4
{
}

- (id)removedSystemApplications
{
  return 0;
}

- (id)bundleIdentifiersForMachOUUIDs:(id)a3 error:(id *)a4
{
  return mapBundleIdentifiersToUUIDs(1, a3, a4);
}

- (id)machOUUIDsForBundleIdentifiers:(id)a3 error:(id *)a4
{
  return mapBundleIdentifiersToUUIDs(0, a3, a4);
}

- (BOOL)getClaimedActivityTypes:(id *)a3 domains:(id *)a4
{
  CFTypeRef v10 = 0;
  CFTypeRef cf = 0;
  int v6 = _LSCopyClaimedActivityIdentifiersAndDomains(&cf, &v10);
  if (!v6)
  {
    CFTypeRef v7 = cf;
    if (cf)
    {
      if (a3)
      {
        *a3 = (id)[(id)cf copy];
        CFTypeRef v7 = cf;
      }
      CFRelease(v7);
    }
    CFTypeRef v8 = v10;
    if (v10)
    {
      if (a4)
      {
        *a4 = (id)[(id)v10 copy];
        CFTypeRef v8 = v10;
      }
      CFRelease(v8);
    }
  }
  return v6 == 0;
}

- (id)registerContainerizedApplicationWithInfoDictionaries:(id)a3 personaUniqueStrings:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 registrationError:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v39 = 0;
  __int16 v40 = &v39;
  uint64_t v41 = 0x3032000000;
  __int16 v42 = __Block_byref_object_copy__4;
  BOOL v43 = __Block_byref_object_dispose__4;
  id v44 = 0;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__4;
  id v37 = __Block_byref_object_dispose__4;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4;
  id v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  id v18 = objc_opt_class();
  id v19 = serviceDomainForRequestContext(v16);
  id v20 = _LSDServiceGetXPCConnection(v18, (uint64_t)v19);

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __160__LSApplicationWorkspace_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError___block_invoke;
  v26[3] = &unk_1E522C550;
  v26[4] = &v27;
  id v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __160__LSApplicationWorkspace_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError___block_invoke_2;
  v25[3] = &unk_1E522C8D0;
  v25[4] = &v33;
  v25[5] = &v39;
  v25[6] = &v27;
  [v21 performPostInstallationRegistration:v13 personaUniqueStrings:v14 operationUUID:v15 reply:v25];

  handleSaveObserverBehavior(v17, (void *)v34[5], v15, (void *)v28[5]);
  uint64_t v22 = (void *)v40[5];
  if (a8 && !v22)
  {
    *a8 = (id) v28[5];
    uint64_t v22 = (void *)v40[5];
  }
  id v23 = v22;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);

  return v23;
}

void __160__LSApplicationWorkspace_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError___block_invoke(uint64_t a1, void *a2)
{
}

void __160__LSApplicationWorkspace_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
  id v17 = v8;

  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
  id v14 = v7;

  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

- (id)registerContainerizedApplicationWithInfoDictionaries:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 saveObserver:(id)a6 registrationError:(id *)a7
{
  return [(LSApplicationWorkspace *)self registerContainerizedApplicationWithInfoDictionaries:a3 personaUniqueStrings:0 operationUUID:a4 requestContext:a5 saveObserver:a6 registrationError:a7];
}

- (id)registerContainerizedApplicationWithInstallationRecord:(id)a3 extensionInstallationRecords:(id)a4 personaUniqueStrings:(id)a5 operationUUID:(id)a6 requestContext:(id)a7 saveObserver:(id)a8 registrationError:(id *)a9
{
  id v28 = self;
  uint64_t v29 = a9;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count") + 1);
  id v19 = [v13 legacyRecordDictionary];
  [v18 addObject:v19];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = v14;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "legacyRecordDictionary", v28, v29, (void)v30);
        [v18 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v22);
  }

  id v26 = [(LSApplicationWorkspace *)v28 registerContainerizedApplicationWithInfoDictionaries:v18 operationUUID:v15 requestContext:v16 saveObserver:v17 registrationError:v29];

  return v26;
}

- (BOOL)unregisterContainerizedApplicationWithBundleIdentifier:(id)a3 operationUUID:(id)a4 unregistrationOperation:(unsigned int)a5 precondition:(id)a6 requestContext:(id)a7 saveObserver:(id)a8 unregistrationError:(id *)a9
{
  uint64_t v12 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__4;
  id v38 = __Block_byref_object_dispose__4;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__4;
  long long v32 = __Block_byref_object_dispose__4;
  id v33 = 0;
  id v19 = objc_opt_class();
  id v20 = serviceDomainForRequestContext(v17);
  uint64_t v21 = _LSDServiceGetXPCConnection(v19, (uint64_t)v20);

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __180__LSApplicationWorkspace_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError___block_invoke;
  v27[3] = &unk_1E522C550;
  void v27[4] = &v34;
  uint64_t v22 = [v21 synchronousRemoteObjectProxyWithErrorHandler:v27];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __180__LSApplicationWorkspace_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError___block_invoke_2;
  v26[3] = &unk_1E522C8F8;
  v26[4] = &v28;
  void v26[5] = &v34;
  v26[6] = &v40;
  [v22 performPostUninstallationUnregistrationOfBundleID:v14 operationUUID:v15 unregisterType:v12 precondition:v16 reply:v26];

  handleSaveObserverBehavior(v18, (void *)v29[5], v15, (void *)v35[5]);
  int v23 = *((unsigned __int8 *)v41 + 24);
  if (a9 && !*((unsigned char *)v41 + 24))
  {
    *a9 = (id) v35[5];
    int v23 = *((unsigned __int8 *)v41 + 24);
  }
  BOOL v24 = v23 != 0;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v24;
}

void __180__LSApplicationWorkspace_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError___block_invoke(uint64_t a1, void *a2)
{
}

void __180__LSApplicationWorkspace_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v11 == 0;
}

- (BOOL)unregisterContainerizedApplicationWithBundleIdentifier:(id)a3 operationUUID:(id)a4 unregistrationOperation:(unsigned int)a5 requestContext:(id)a6 saveObserver:(id)a7 unregistrationError:(id *)a8
{
  return [(LSApplicationWorkspace *)self unregisterContainerizedApplicationWithBundleIdentifier:a3 operationUUID:a4 unregistrationOperation:*(void *)&a5 precondition:0 requestContext:a6 saveObserver:a7 unregistrationError:a8];
}

- (BOOL)setPersonaUniqueStrings:(id)a3 forApplicationsWithBundleIdentifiers:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__4;
  id v37 = __Block_byref_object_dispose__4;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__4;
  long long v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  id v18 = objc_opt_class();
  id v19 = serviceDomainForRequestContext(v16);
  id v20 = _LSDServiceGetXPCConnection(v18, (uint64_t)v19);

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __135__LSApplicationWorkspace_setPersonaUniqueStrings_forApplicationsWithBundleIdentifiers_operationUUID_requestContext_saveObserver_error___block_invoke;
  v26[3] = &unk_1E522C550;
  v26[4] = &v33;
  uint64_t v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __135__LSApplicationWorkspace_setPersonaUniqueStrings_forApplicationsWithBundleIdentifiers_operationUUID_requestContext_saveObserver_error___block_invoke_2;
  v25[3] = &unk_1E522C8F8;
  v25[4] = &v27;
  v25[5] = &v33;
  v25[6] = &v39;
  [v21 performUpdateOfPersonasOfBundleIDs:v14 toPersonaUniqueStrings:v13 operationUUID:v15 reply:v25];

  handleSaveObserverBehavior(v17, (void *)v28[5], v15, (void *)v34[5]);
  int v22 = *((unsigned __int8 *)v40 + 24);
  if (a8 && !*((unsigned char *)v40 + 24))
  {
    *a8 = (id) v34[5];
    int v22 = *((unsigned __int8 *)v40 + 24);
  }
  BOOL v23 = v22 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v23;
}

void __135__LSApplicationWorkspace_setPersonaUniqueStrings_forApplicationsWithBundleIdentifiers_operationUUID_requestContext_saveObserver_error___block_invoke(uint64_t a1, void *a2)
{
}

void __135__LSApplicationWorkspace_setPersonaUniqueStrings_forApplicationsWithBundleIdentifiers_operationUUID_requestContext_saveObserver_error___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v11 == 0;
}

- (BOOL)setPersonaUniqueStrings:(id)a3 forApplicationWithBundleIdentifier:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 error:(id *)a8
{
  id v14 = (void *)MEMORY[0x1E4F1CAD0];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = [v14 setWithObject:a4];
  LOBYTE(a8) = [(LSApplicationWorkspace *)self setPersonaUniqueStrings:v18 forApplicationsWithBundleIdentifiers:v19 operationUUID:v17 requestContext:v16 saveObserver:v15 error:a8];

  return (char)a8;
}

- (BOOL)sendNotificationOfType:(unsigned int)a3 forApplicationWithBundleIdentifier:(id)a4 requestContext:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  BOOL v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__4;
  uint64_t v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  if (v8 > 4)
  {
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"unknown notification type %d", v8);
    id v13 = (void *)v14;
    if (v14) {
      id v15 = (__CFString *)v14;
    }
    else {
      id v15 = @"invalid input parameters";
    }
    uint64_t v33 = *MEMORY[0x1E4F28228];
    v34[0] = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    uint64_t v17 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[LSApplicationWorkspace sendNotificationOfType:forApplicationWithBundleIdentifier:requestContext:error:]", 2661, v16);
    id v18 = (void *)v24[5];
    v24[5] = v17;
  }
  else
  {
    uint64_t v12 = dword_182AF8D20[(int)v8];
    id v13 = [(LSApplicationWorkspace *)self syncObserverProxy];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    id v22[2] = __105__LSApplicationWorkspace_sendNotificationOfType_forApplicationWithBundleIdentifier_requestContext_error___block_invoke;
    v22[3] = &unk_1E522C920;
    void v22[4] = &v23;
    v22[5] = &v29;
    [v13 sendNotification:v12 forApplicationWithBundleIdentifier:v10 completion:v22];
  }

  int v19 = *((unsigned __int8 *)v30 + 24);
  if (a6 && !*((unsigned char *)v30 + 24))
  {
    *a6 = (id) v24[5];
    int v19 = *((unsigned __int8 *)v30 + 24);
  }
  BOOL v20 = v19 != 0;
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v20;
}

void __105__LSApplicationWorkspace_sendNotificationOfType_forApplicationWithBundleIdentifier_requestContext_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 == 0;
}

- (BOOL)registerApplicationForRebuildWithInfoDictionaries:(id)a3 personaUniqueStrings:(id)a4 requestContext:(id)a5 registrationError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = __Block_byref_object_copy__4;
  uint64_t v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  uint64_t v12 = objc_opt_class();
  id v13 = serviceDomainForRequestContext(v11);
  uint64_t v14 = _LSDServiceGetXPCConnection(v12, (uint64_t)v13);

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __130__LSApplicationWorkspace_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError___block_invoke;
  v20[3] = &unk_1E522C550;
  v20[4] = &v21;
  id v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __130__LSApplicationWorkspace_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError___block_invoke_2;
  v19[3] = &unk_1E522C920;
  v19[4] = &v27;
  v19[5] = &v21;
  [v15 performRebuildRegistration:v9 personaUniqueStrings:v10 reply:v19];

  int v16 = *((unsigned __int8 *)v28 + 24);
  if (a6 && !*((unsigned char *)v28 + 24))
  {
    *a6 = (id) v22[5];
    int v16 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v17 = v16 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v17;
}

void __130__LSApplicationWorkspace_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError___block_invoke(uint64_t a1, void *a2)
{
}

void __130__LSApplicationWorkspace_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError___block_invoke_2(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

- (BOOL)registerApplicationForRebuildWithInfoDictionaries:(id)a3 requestContext:(id)a4 registrationError:(id *)a5
{
  return [(LSApplicationWorkspace *)self registerApplicationForRebuildWithInfoDictionaries:a3 personaUniqueStrings:0 requestContext:a4 registrationError:a5];
}

- (BOOL)registerApplicationForRebuildWithInstallationRecord:(id)a3 extensionInstallationRecords:(id)a4 personaUniqueStrings:(id)a5 requestContext:(id)a6 registrationError:(id *)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count") + 1);
  int v16 = [v11 legacyRecordDictionary];
  [v15 addObject:v16];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v17 = v12;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        int v22 = [*(id *)(*((void *)&v26 + 1) + 8 * v21) legacyRecordDictionary];
        [v15 addObject:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v19);
  }

  BOOL v23 = [(LSApplicationWorkspace *)self registerApplicationForRebuildWithInfoDictionaries:v15 personaUniqueStrings:v13 requestContext:v14 registrationError:a7];
  return v23;
}

- (BOOL)updatePlaceholderMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 installType:(unint64_t)a6 failure:(unint64_t)a7 saveObserver:(id)a8 error:(id *)a9
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = @"LSInstallType";
  id v14 = NSNumber;
  id v15 = a8;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [v14 numberWithUnsignedInteger:a6];
  v29[1] = @"PlaceholderFailureReason";
  v30[0] = v18;
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:a7];
  v30[1] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  BOOL v22 = a6 - 7 < 3 && a7 != 0;
  id v27 = 0;
  id v28 = 0;
  BOOL v23 = [(LSApplicationWorkspace *)self updateRecordForApp:v17 withSINF:0 iTunesMetadata:0 placeholderMetadata:v20 sendNotification:v22 operationUUID:v16 outSaveToken:&v28 error:&v27];

  id v24 = v28;
  id v25 = v27;

  handleSaveObserverBehavior(v15, v24, v16, v25);
  if (a9 && !v23) {
    *a9 = v25;
  }

  return v23;
}

- (BOOL)updateiTunesMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 metadataPlist:(id)a6 saveObserver:(id)a7 error:(id *)a8
{
  id v19 = 0;
  id v20 = 0;
  id v13 = a7;
  id v14 = a4;
  BOOL v15 = [(LSApplicationWorkspace *)self updateRecordForApp:a3 withSINF:0 iTunesMetadata:a6 placeholderMetadata:0 sendNotification:0 operationUUID:v14 outSaveToken:&v20 error:&v19];
  id v16 = v20;
  id v17 = v19;
  handleSaveObserverBehavior(v13, v16, v14, v17);

  if (a8 && !v15) {
    *a8 = v17;
  }

  return v15;
}

- (BOOL)updateSINFMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 parsedSINFInfo:(id)a6 saveObserver:(id)a7 error:(id *)a8
{
  id v19 = 0;
  id v20 = 0;
  id v13 = a7;
  id v14 = a4;
  BOOL v15 = [(LSApplicationWorkspace *)self updateRecordForApp:a3 withSINF:a6 iTunesMetadata:0 placeholderMetadata:0 sendNotification:0 operationUUID:v14 outSaveToken:&v20 error:&v19];
  id v16 = v20;
  id v17 = v19;
  handleSaveObserverBehavior(v13, v16, v14, v17);

  if (a8 && !v15) {
    *a8 = v17;
  }

  return v15;
}

- (BOOL)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__4;
  uint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  id v10 = [(LSApplicationWorkspace *)self syncObserverProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__LSApplicationWorkspace_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_error___block_invoke;
  v13[3] = &unk_1E522C550;
  v13[4] = &v14;
  [v10 setProgressProportionsByPhase:v8 forInstallOfApplicationWithIdentifier:v9 completion:v13];

  id v11 = (void *)v15[5];
  if (a5 && v11) {
    *a5 = v11;
  }
  _Block_object_dispose(&v14, 8);

  return v11 == 0;
}

void __100__LSApplicationWorkspace_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)installApplication:(id)a3 withOptions:(id)a4
{
  return [(LSApplicationWorkspace *)self installApplication:a3 withOptions:a4 error:0 usingBlock:0];
}

- (BOOL)installApplication:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  return [(LSApplicationWorkspace *)self installApplication:a3 withOptions:a4 error:a5 usingBlock:0];
}

- (void)placeholderInstalledForIdentifier:(id)a3 filterDowngrades:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[LSApplicationProxy applicationProxyForIdentifier:a3 placeholder:1];
  id v12 = v6;
  if (!v4
    || (v7 = [v6 installType], id v8 = v12, v7 != 8)
    && (uint64_t v9 = [v12 installType], v8 = v12, v9 != 7)
    && (v10 = [v12 installType], id v8 = v12, v10 != 9))
  {
    id v11 = [(LSApplicationWorkspace *)self installProgressForApplication:v12 withPhase:3];
    [v11 setInstallState:5];
    [(LSApplicationWorkspace *)self installPhaseFinishedForProgress:v11];

    id v8 = v12;
  }
}

- (BOOL)installApplication:(id)a3 withOptions:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!getenv("LS_AVOID_SHIM_FAULTS_TEMPORARILY"))
  {
    id v12 = _LSInstallLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[LSApplicationWorkspace installApplication:withOptions:error:usingBlock:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  char v30 = __Block_byref_object_copy__4;
  uint64_t v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  id v20 = +[_LSInstallerClient syncServerInstallerProxyForShim]();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__LSApplicationWorkspace_installApplication_withOptions_error_usingBlock___block_invoke;
  v26[3] = &unk_1E522C550;
  v26[4] = &v27;
  uint64_t v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74__LSApplicationWorkspace_installApplication_withOptions_error_usingBlock___block_invoke_2;
  v25[3] = &unk_1E522C6A8;
  v25[4] = &v33;
  v25[5] = &v27;
  [v21 performShimmedInstallOfArtifact:v9 options:v10 completion:v25];

  int v22 = *((unsigned __int8 *)v34 + 24);
  if (a5 && !*((unsigned char *)v34 + 24))
  {
    *a5 = (id) v28[5];
    int v22 = *((unsigned __int8 *)v34 + 24);
  }
  BOOL v23 = v22 != 0;
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v23;
}

void __74__LSApplicationWorkspace_installApplication_withOptions_error_usingBlock___block_invoke(uint64_t a1, void *a2)
{
}

void __74__LSApplicationWorkspace_installApplication_withOptions_error_usingBlock___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)installContainerizedApplicationArtifactAtURL:(id)a3 withOptions:(id)a4 error:(id *)a5 progressBlock:(id)a6
{
  return [(LSApplicationWorkspace *)self installContainerizedApplicationArtifactAtURL:a3 withOptions:a4 returningRecordPromise:0 error:a5 progressBlock:a6];
}

- (BOOL)installContainerizedApplicationArtifactAtURL:(id)a3 withOptions:(id)a4 returningRecordPromise:(id *)a5 error:(id *)a6 progressBlock:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  if (!getenv("LS_AVOID_SHIM_FAULTS_TEMPORARILY"))
  {
    uint64_t v13 = _LSInstallLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[LSApplicationWorkspace installContainerizedApplicationArtifactAtURL:withOptions:returningRecordPromise:error:progressBlock:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__4;
  id v32 = __Block_byref_object_dispose__4;
  id v33 = 0;
  uint64_t v21 = +[_LSInstallerClient syncServerInstallerProxyForShim]();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __126__LSApplicationWorkspace_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock___block_invoke;
  v27[3] = &unk_1E522C550;
  void v27[4] = &v28;
  int v22 = [v21 synchronousRemoteObjectProxyWithErrorHandler:v27];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __126__LSApplicationWorkspace_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock___block_invoke_2;
  v26[3] = &unk_1E522C6A8;
  v26[4] = &v34;
  void v26[5] = &v28;
  [v22 performShimmedInstallOfArtifact:v10 options:v11 completion:v26];

  int v23 = *((unsigned __int8 *)v35 + 24);
  if (a6 && !*((unsigned char *)v35 + 24))
  {
    *a6 = (id) v29[5];
    int v23 = *((unsigned __int8 *)v35 + 24);
  }
  BOOL v24 = v23 != 0;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v24;
}

void __126__LSApplicationWorkspace_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock___block_invoke(uint64_t a1, void *a2)
{
}

void __126__LSApplicationWorkspace_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)uninstallContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5 progressBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!getenv("LS_AVOID_SHIM_FAULTS_TEMPORARILY"))
  {
    id v12 = _LSInstallLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[LSApplicationWorkspace uninstallContainerizedApplicationWithIdentifier:options:error:progressBlock:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__4;
  uint64_t v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  uint64_t v20 = +[_LSInstallerClient syncServerInstallerProxyForShim]();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __102__LSApplicationWorkspace_uninstallContainerizedApplicationWithIdentifier_options_error_progressBlock___block_invoke;
  v26[3] = &unk_1E522C550;
  v26[4] = &v27;
  uint64_t v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __102__LSApplicationWorkspace_uninstallContainerizedApplicationWithIdentifier_options_error_progressBlock___block_invoke_2;
  v25[3] = &unk_1E522C6A8;
  v25[4] = &v33;
  v25[5] = &v27;
  [v21 performShimmedUninstallOfApplicationWithIdentifier:v9 options:v10 completion:v25];

  int v22 = *((unsigned __int8 *)v34 + 24);
  if (a5 && !*((unsigned char *)v34 + 24))
  {
    *a5 = (id) v28[5];
    int v22 = *((unsigned __int8 *)v34 + 24);
  }
  BOOL v23 = v22 != 0;
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v23;
}

void __102__LSApplicationWorkspace_uninstallContainerizedApplicationWithIdentifier_options_error_progressBlock___block_invoke(uint64_t a1, void *a2)
{
}

void __102__LSApplicationWorkspace_uninstallContainerizedApplicationWithIdentifier_options_error_progressBlock___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)downgradeApplicationToPlaceholder:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v6 = _LSInstallLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    -[LSApplicationWorkspace downgradeApplicationToPlaceholder:withOptions:error:]();
  }

  uint64_t v7 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[LSApplicationWorkspace downgradeApplicationToPlaceholder:withOptions:error:]", 3050, 0);
  id v8 = v7;
  if (a5) {
    *a5 = v7;
  }

  return 0;
}

- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4
{
  return [(LSApplicationWorkspace *)self uninstallApplication:a3 withOptions:a4 error:0 usingBlock:0];
}

- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  return [(LSApplicationWorkspace *)self uninstallApplication:a3 withOptions:a4 error:0 usingBlock:a5];
}

- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!getenv("LS_AVOID_SHIM_FAULTS_TEMPORARILY"))
  {
    id v12 = _LSInstallLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[LSApplicationWorkspace uninstallApplication:withOptions:error:usingBlock:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__4;
  uint64_t v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  uint64_t v20 = +[_LSInstallerClient syncServerInstallerProxyForShim]();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__LSApplicationWorkspace_uninstallApplication_withOptions_error_usingBlock___block_invoke;
  v26[3] = &unk_1E522C550;
  v26[4] = &v27;
  uint64_t v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__LSApplicationWorkspace_uninstallApplication_withOptions_error_usingBlock___block_invoke_2;
  v25[3] = &unk_1E522C6A8;
  v25[4] = &v33;
  v25[5] = &v27;
  [v21 performShimmedUninstallOfApplicationWithIdentifier:v9 options:v10 completion:v25];

  int v22 = *((unsigned __int8 *)v34 + 24);
  if (a5 && !*((unsigned char *)v34 + 24))
  {
    *a5 = (id) v28[5];
    int v22 = *((unsigned __int8 *)v34 + 24);
  }
  BOOL v23 = v22 != 0;
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v23;
}

void __76__LSApplicationWorkspace_uninstallApplication_withOptions_error_usingBlock___block_invoke(uint64_t a1, void *a2)
{
}

void __76__LSApplicationWorkspace_uninstallApplication_withOptions_error_usingBlock___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)restoreSystemApplication:(id)a3
{
  return 0;
}

- (BOOL)registerApplicationDictionary:(id)a3 withObserverNotification:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"IsPlaceholder"];
  uint64_t v8 = [v7 BOOLValue];

  id v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
  if (!v9)
  {
    id v10 = 0;
    goto LABEL_11;
  }
  id v10 = [v6 objectForKeyedSubscript:@"Path"];
  if (!v10)
  {
LABEL_11:
    int v11 = -50;
    goto LABEL_9;
  }
  int v11 = registerApplicationWithDictionary(v6, 1u);
  if (!v11)
  {
    id v12 = +[LSApplicationProxy applicationProxyForIdentifier:v9 placeholder:v8];
    if (v12)
    {
      uint64_t v13 = [(LSApplicationWorkspace *)self observerProxy];
      v17[0] = v12;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [v13 sendNotification:v4 forApplications:v14 withPlugins:0];
    }
    else
    {
      uint64_t v13 = _LSProgressLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[LSApplicationWorkspace registerApplicationDictionary:withObserverNotification:]();
      }
    }

    int v11 = 0;
  }
LABEL_9:
  BOOL v15 = v11 == 0;

  return v15;
}

- (BOOL)registerApplicationDictionary:(id)a3
{
  return [(LSApplicationWorkspace *)self registerApplicationDictionary:a3 withObserverNotification:7];
}

- (BOOL)registerApplication:(id)a3
{
  OSStatus v3 = LSRegisterURL((CFURLRef)a3, 0);
  if (!v3)
  {
    uint64_t v4 = _LSInstallLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Not sending applicationsDidInstall notification, please file a bug with Purple LaunchServices if you need this", v6, 2u);
    }
  }
  return v3 == 0;
}

- (BOOL)unregisterApplicationsAtMountPoint:(id)a3 operationUUID:(id)a4 saveObserver:(id)a5 requestContext:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v19 = a5;
  id v9 = a6;
  uint64_t v30 = 0;
  v31[0] = &v30;
  v31[1] = 0x3032000000;
  v31[2] = __Block_byref_object_copy__4;
  v31[3] = __Block_byref_object_dispose__4;
  id v32 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  do
  {
    int v11 = objc_opt_class();
    id v12 = serviceDomainForRequestContext(v9);
    uint64_t v13 = _LSDServiceGetXPCConnection(v11, (uint64_t)v12);

    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __103__LSApplicationWorkspace_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext___block_invoke;
    v23[3] = &unk_1E522C550;
    v23[4] = &v30;
    uint64_t v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v23];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    id v22[2] = __103__LSApplicationWorkspace_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext___block_invoke_2;
    v22[3] = &unk_1E522C948;
    void v22[4] = &v24;
    v22[5] = &v30;
    [v14 unregisterApplicationsAtMountPoint:v20 operationUUID:v21 reply:v22];
  }
  while (_LSNSErrorIsXPCConnectionInterrupted(*(void **)(v31[0] + 40)));
  handleSaveObserverBehavior(v19, (void *)v25[5], v21, *(void **)(v31[0] + 40));
  if (*(void *)(v31[0] + 40))
  {
    BOOL v15 = _LSDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v20 absoluteString];
      -[LSApplicationWorkspace unregisterApplicationsAtMountPoint:operationUUID:saveObserver:requestContext:](v16, (uint64_t)v31, (uint64_t)v33, v15);
    }

    BOOL v17 = *(void *)(v31[0] + 40) == 0;
  }
  else
  {
    BOOL v17 = 1;
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v17;
}

void __103__LSApplicationWorkspace_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext___block_invoke(uint64_t a1, void *a2)
{
}

void __103__LSApplicationWorkspace_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)unregisterApplication:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__4;
  BOOL v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  do
  {
    uint64_t v4 = (void *)v12[5];
    v12[5] = 0;

    v10[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
    v10[1] = (void (*)(void, void))3221225472;
    v10[2] = (void (*)(void, void))__48__LSApplicationWorkspace_unregisterApplication___block_invoke;
    v10[3] = (void (*)(void, void))&unk_1E522C550;
    void v10[4] = (void (*)(void, void))&v11;
    id v5 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v10);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__LSApplicationWorkspace_unregisterApplication___block_invoke_2;
    v9[3] = &unk_1E522C550;
    void v9[4] = &v11;
    [v5 unregisterApplicationAtURL:v3 reply:v9];
  }
  while (_LSNSErrorIsXPCConnectionInterrupted((void *)v12[5]));
  if (v12[5])
  {
    id v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace unregisterApplication:]();
    }

    BOOL v7 = v12[5] == 0;
  }
  else
  {
    BOOL v7 = 1;
  }
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __48__LSApplicationWorkspace_unregisterApplication___block_invoke(uint64_t a1, void *a2)
{
}

void __48__LSApplicationWorkspace_unregisterApplication___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (BOOL)updateRecordForApp:(id)a3 withSINF:(id)a4 iTunesMetadata:(id)a5 placeholderMetadata:(id)a6 sendNotification:(int)a7 operationUUID:(id)a8 outSaveToken:(id *)a9 error:(id *)a10
{
  uint64_t v11 = *(void *)&a7;
  id v24 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  char v36 = __Block_byref_object_copy__4;
  char v37 = __Block_byref_object_dispose__4;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__4;
  uint64_t v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  v26[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v26[1] = (void (*)(void, void))3221225472;
  v26[2] = (void (*)(void, void))__139__LSApplicationWorkspace_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error___block_invoke;
  v26[3] = (void (*)(void, void))&unk_1E522C550;
  v26[4] = (void (*)(void, void))&v33;
  id v19 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v26);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __139__LSApplicationWorkspace_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error___block_invoke_2;
  v25[3] = &unk_1E522C970;
  v25[4] = &v27;
  v25[5] = &v39;
  void v25[6] = &v33;
  LOBYTE(v23) = a9 != 0;
  [v19 updateRecordForApp:v24 withSINF:v15 iTunesMetadata:v16 placeholderMetadata:v17 sendNotification:v11 operationUUID:v18 returnSaveToken:v23 completionHandler:v25];
  _LSContextInvalidate();
  int v20 = *((unsigned __int8 *)v40 + 24);
  if (a9 && *((unsigned char *)v40 + 24))
  {
    *a9 = (id) v28[5];
    int v20 = *((unsigned __int8 *)v40 + 24);
  }
  if (a10 && !v20)
  {
    *a10 = (id) v34[5];
    int v20 = *((unsigned __int8 *)v40 + 24);
  }
  BOOL v21 = v20 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v21;
}

void __139__LSApplicationWorkspace_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error___block_invoke(uint64_t a1, void *a2)
{
}

void __139__LSApplicationWorkspace_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error___block_invoke_2(void *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1[4] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

- (BOOL)updateSINFWithData:(id)a3 forApplication:(id)a4 options:(id)a5 error:(id *)a6
{
  id v7 = _LSDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[LSApplicationWorkspace updateSINFWithData:forApplication:options:error:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  id v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[LSApplicationWorkspace updateSINFWithData:forApplication:options:error:]", 3267, 0);
  id v16 = v15;
  if (a6) {
    *a6 = v15;
  }

  return 0;
}

- (BOOL)_getBundleIdentifierForBundleAtURL:(id)a3 invokeUpdateBlockAndReregister:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v7 = (const __CFURL *)a3;
  uint64_t v8 = (uint64_t (**)(id, const __CFURL *, NSObject *, id *))a4;
  id v21 = 0;
  uint64_t v9 = [[LSApplicationRecord alloc] initWithURL:v7 allowPlaceholder:1 error:&v21];
  id v10 = v21;
  if (!v9)
  {
    uint64_t v11 = _LSDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:]();
    }
    goto LABEL_14;
  }
  uint64_t v11 = [(LSBundleRecord *)v9 bundleIdentifier];
  if (v11)
  {
    id v20 = v10;
    int v12 = v8[2](v8, v7, v11, &v20);
    id v13 = v20;

    if (v12)
    {
      BOOL v14 = 1;
      OSStatus v15 = LSRegisterURL(v7, 1u);
      id v19 = v13;
      BOOL v16 = _LSGetNSErrorFromOSStatusImpl(v15, &v19, (uint64_t)"-[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:]", 3287);
      id v10 = v19;

      if (v16) {
        goto LABEL_15;
      }
      id v17 = _LSDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:]();
      }
      goto LABEL_13;
    }
    id v17 = _LSDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:]();
    }
  }
  else
  {
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v23[0] = @"provided bundle URL was not a bundle with a bundle identifier";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", 112, (uint64_t)"-[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:]", 3298, v17);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v10 = v13;
LABEL_13:

LABEL_14:
  BOOL v14 = 0;
LABEL_15:

  if (a5) {
    *a5 = v10;
  }

  return v14;
}

- (BOOL)updateSINFWithData:(id)a3 forApplicationAtURL:(id)a4 error:(id *)a5
{
  if (a5)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[LSApplicationWorkspace updateSINFWithData:forApplicationAtURL:error:]", 3335, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)updateiTunesMetadataWithData:(id)a3 forApplication:(id)a4 options:(id)a5 error:(id *)a6
{
  CFURLRef v7 = _LSDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[LSApplicationWorkspace updateiTunesMetadataWithData:forApplication:options:error:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  OSStatus v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[LSApplicationWorkspace updateiTunesMetadataWithData:forApplication:options:error:]", 3347, 0);
  BOOL v16 = v15;
  if (a6) {
    *a6 = v15;
  }

  return 0;
}

- (BOOL)updateiTunesMetadataWithData:(id)a3 forApplicationAtURL:(id)a4 error:(id *)a5
{
  id v6 = _LSDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    -[LSApplicationWorkspace updateiTunesMetadataWithData:forApplicationAtURL:error:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  if (a5)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[LSApplicationWorkspace updateiTunesMetadataWithData:forApplicationAtURL:error:]", 3359, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failure:(unint64_t)a5 underlyingError:(id)a6 source:(unint64_t)a7 outError:(id *)a8
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v14 = NSNumber;
  id v15 = a6;
  BOOL v16 = [v14 numberWithUnsignedInteger:a5];
  id v17 = [NSNumber numberWithUnsignedInteger:a4];
  [NSNumber numberWithUnsignedInteger:a7];
  v39 = id v38 = v15;
  char v37 = v17;
  _LSLogStepStart(11, 0, v13, @"Updating PlaceholderMetadata for %@ with failure %@ <LSInstallType %@, underlyingError (%@), source %@>", v18, v19, v20, v21, (uint64_t)v13);

  ((void (*)(void *, uint64_t, uint64_t, void *, uint64_t))softLinkMobileInstallationUpdatePlaceholderMetadata[0])(v13, a4, a5, v15, a7);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    uint64_t v23 = _LSDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace updatePlaceholderMetadataForApp:installType:failure:underlyingError:source:outError:]();
    }
    BOOL v24 = 0;
  }
  else
  {
    BOOL v26 = a4 - 7 < 3 && a5 != 0;
    v42[0] = @"LSInstallType";
    uint64_t v27 = [NSNumber numberWithUnsignedInteger:a4];
    v42[1] = @"PlaceholderFailureReason";
    v43[0] = v27;
    uint64_t v28 = [NSNumber numberWithUnsignedInteger:a5];
    v43[1] = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
    uint64_t v30 = [MEMORY[0x1E4F29128] UUID];
    id v41 = 0;
    BOOL v24 = -[LSApplicationWorkspace updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:](self, "updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:", v13, 0, 0, v29, v26, v30, 0, &v41, v37, v38, v39);
    id v22 = v41;

    if (!v26)
    {
      uint64_t v35 = a8;
      goto LABEL_14;
    }
    uint64_t v23 = [(LSApplicationWorkspace *)self observerProxy];
    [v23 installationEndedForApplication:v13 withState:4];
  }
  uint64_t v35 = a8;

LABEL_14:
  _LSLogStepFinished(11, v24, v13, @"Updated PlaceholderMetadata for app with error %@", v31, v32, v33, v34, (uint64_t)v22);
  if (v35 && !v24) {
    id *v35 = v22;
  }

  return v24;
}

- (BOOL)initiateProgressForApp:(id)a3 withType:(unint64_t)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  uint64_t v19 = [v6 numberWithUnsignedInteger:a4];
  _LSLogStepStart(11, 0, v7, @"Updating PlaceholderMetadata for %@ with LSInstallType %@", v8, v9, v10, v11, (uint64_t)v7);

  [(LSApplicationWorkspace *)self placeholderInstalledForIdentifier:v7 filterDowngrades:0];
  id v20 = 0;
  uint64_t updated = _updatePlaceholderInstallType(self, v7, a4, &v20);
  id v13 = v20;
  _LSLogStepFinished(11, updated, v7, @"Updated PlaceholderMetadata for app with error %@", v14, v15, v16, v17, (uint64_t)v13);

  return updated;
}

- (BOOL)updatePlaceholderWithBundleIdentifier:(id)a3 withInstallType:(unint64_t)a4 error:(id *)a5
{
  return _updatePlaceholderInstallType(self, a3, a4, a5);
}

- (BOOL)revertContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5 progressBlock:(id)a6
{
  return [(LSApplicationWorkspace *)self revertContainerizedApplicationWithIdentifier:a3 options:a4 returningRecordPromise:0 error:a5 progressBlock:a6];
}

- (BOOL)revertContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 returningRecordPromise:(id *)a5 error:(id *)a6 progressBlock:(id)a7
{
  if (a6)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[LSApplicationWorkspace revertContainerizedApplicationWithIdentifier:options:returningRecordPromise:error:progressBlock:]", 3459, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)registerPlugin:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  _LSUnregisterPluginsAtURL(v3, 0);
  int v4 = _LSRegisterPluginWithInfo(v3, 0);

  return v4 == 0;
}

- (BOOL)unregisterPlugin:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  BOOL v4 = _LSUnregisterPluginsAtURL(v3, &v8);
  id v5 = v8;
  if (!v4)
  {
    id v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace unregisterPlugin:]();
    }
  }
  return v4;
}

- (BOOL)allowsAlternateIcons
{
  SharedInstance = (void *)__LSDefaultsGetSharedInstance();

  return [SharedInstance allowsAlternateIcons];
}

- (BOOL)garbageCollectDatabaseWithError:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__4;
  uint64_t v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v9[1] = (void (*)(void, void))3221225472;
  v9[2] = (void (*)(void, void))__58__LSApplicationWorkspace_garbageCollectDatabaseWithError___block_invoke;
  v9[3] = (void (*)(void, void))&unk_1E522C550;
  void v9[4] = (void (*)(void, void))&v10;
  BOOL v4 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__LSApplicationWorkspace_garbageCollectDatabaseWithError___block_invoke_2;
  v8[3] = &unk_1E522C6A8;
  v8[4] = &v16;
  void v8[5] = &v10;
  [v4 garbageCollectDatabaseWithCompletionHandler:v8];
  int v5 = *((unsigned __int8 *)v17 + 24);
  if (a3 && !*((unsigned char *)v17 + 24))
  {
    *a3 = (id) v11[5];
    int v5 = *((unsigned __int8 *)v17 + 24);
  }
  BOOL v6 = v5 != 0;

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __58__LSApplicationWorkspace_garbageCollectDatabaseWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __58__LSApplicationWorkspace_garbageCollectDatabaseWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)invalidateIconCache:(id)a3
{
  id v3 = a3;
  if (IconServicesLibrary_frameworkLibrary_0
    || (IconServicesLibrary_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
  {
    ((void (*)(void *))softLink_ISInvalidateCacheEntriesForBundleIdentifier[0])(v3);
    BOOL v4 = 1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)clearAdvertisingIdentifier
{
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 clearAllIdentifiersOfType:1];
}

- (id)deviceIdentifierForAdvertising
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke;
  v5[3] = &unk_1E522C9C0;
  v5[4] = &v6;
  id v2 = _LSRetryForConnectionInterrupted(v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

id __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke(uint64_t a1)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__4;
  uint64_t v12 = __Block_byref_object_dispose__4;
  id v13 = 0;
  v7[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v7[1] = (void (*)(void, void))3221225472;
  v7[2] = (void (*)(void, void))__56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_2;
  v7[3] = (void (*)(void, void))&unk_1E522C550;
  v7[4] = (void (*)(void, void))&v8;
  id v2 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, v7);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_365;
  v6[3] = &unk_1E522C998;
  void v6[4] = *(void *)(a1 + 32);
  [v2 getIdentifierOfType:1 completionHandler:v6];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    id v3 = 0;
  }
  else {
    id v3 = (void *)v9[5];
  }
  id v4 = v3;

  _Block_object_dispose(&v8, 8);

  return v4;
}

void __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _LSDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_365(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = _LSDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_365_cold_1();
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _LSDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_368(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = _LSDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_368_cold_1();
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)urlContainsDeviceIdentifierForAdvertising:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke;
  v8[3] = &unk_1E522CA38;
  id v4 = v3;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v5 = _LSRetryForConnectionInterrupted(v8);
  char v6 = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

id __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  char v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v7[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v7[1] = (void (*)(void, void))3221225472;
  v7[2] = (void (*)(void, void))__68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_2;
  v7[3] = (void (*)(void, void))&unk_1E522C9E8;
  id v8 = *(id *)(a1 + 32);
  id v9 = &v10;
  id v2 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, v7);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_369;
  v6[3] = &unk_1E522CA10;
  uint64_t v3 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  [v2 urlContainsDeviceIdentifierForAdvertising:v3 completionHandler:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

void __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _LSDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_369(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)createDeviceIdentifierWithVendorName:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = __Block_byref_object_copy__4;
  id v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  id v7 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__LSApplicationWorkspace_createDeviceIdentifierWithVendorName_bundleIdentifier___block_invoke;
  v10[3] = &unk_1E522C998;
  void v10[4] = &v11;
  [v7 getIdentifierOfType:0 vendorName:v5 bundleIdentifier:v6 completionHandler:v10];
  id v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v8;
}

void __80__LSApplicationWorkspace_createDeviceIdentifierWithVendorName_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (void)removeDeviceIdentifierForVendorName:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 clearIdentifiersForUninstallationWithVendorName:v6 bundleIdentifier:v5];
}

- (id)deviceIdentifierForVendorSeedData
{
  _OWORD v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__4;
  uint64_t v12 = __Block_byref_object_dispose__4;
  id v13 = 0;
  id v2 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__LSApplicationWorkspace_deviceIdentifierForVendorSeedData__block_invoke;
  v7[3] = &unk_1E522C998;
  v7[4] = &v8;
  [v2 getIdentifierOfType:2 completionHandler:v7];
  id v3 = (void *)v9[5];
  if (v3)
  {
    v14[0] = 0;
    v14[1] = 0;
    [v3 getUUIDBytes:v14];
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v14 length:16];
  }
  else
  {
    id v5 = _LSDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace deviceIdentifierForVendorSeedData]();
    }

    id v4 = 0;
  }

  _Block_object_dispose(&v8, 8);

  return v4;
}

void __59__LSApplicationWorkspace_deviceIdentifierForVendorSeedData__block_invoke(uint64_t a1, void *a2)
{
}

- (id)installProgressForBundleID:(id)a3 makeSynchronous:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = _LSProgressLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspace installProgressForBundleID:makeSynchronous:]();
  }

  id v7 = +[LSApplicationWorkspace progressQueue];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  char v14 = __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke;
  id v15 = &unk_1E522BBD8;
  id v16 = self;
  id v8 = v5;
  id v17 = v8;
  dispatch_sync(v7, &v12);

  id v9 = -[LSInstallProgressList progressForBundleID:](self->_observedInstallProgresses, "progressForBundleID:", v8, v12, v13, v14, v15, v16);
  uint64_t v10 = _LSProgressLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspace installProgressForBundleID:makeSynchronous:](v9, v10);
  }

  return v9;
}

void __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = (uint64_t *)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v3)
  {
    id v4 = objc_alloc_init(LSInstallProgressList);
    id v5 = *(void **)(*v2 + 16);
    *(void *)(*v2 + 16) = v4;

    id v3 = *(void **)(*v2 + 16);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  id v6 = (id *)(a1 + 40);
  id v8 = [v3 progressForBundleID:v7];
  if (v8)
  {

    goto LABEL_6;
  }
  id v9 = [*(id *)(*v2 + 16) subscriberForBundleID:*v6 andPublishingKey:*v6];

  if (v9)
  {
LABEL_6:
    uint64_t v10 = _LSProgressLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_cold_2();
    }
    goto LABEL_8;
  }
  uint64_t v11 = _LSProgressLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_cold_1();
  }

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_372;
  uint64_t v21 = &unk_1E522CA60;
  uint64_t v12 = *v6;
  uint64_t v13 = *v2;
  id v22 = v12;
  uint64_t v23 = v13;
  char v14 = (void *)MEMORY[0x18530F950](&v18);
  id v15 = objc_msgSend(MEMORY[0x1E4F28F90], "_addSubscriberForCategory:usingPublishingHandler:", *v6, v14, v18, v19, v20, v21);
  if (v15) {
    [*(id *)(*v2 + 16) addSubscriber:v15 forPublishingKey:*v6 andBundleID:*v6];
  }
  id v16 = _LSProgressLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = *v6;
    *(_DWORD *)buf = 138412290;
    id v25 = v17;
    _os_log_impl(&dword_182959000, v16, OS_LOG_TYPE_DEFAULT, "Subscribing to progress for app %@, ", buf, 0xCu);
  }

  uint64_t v10 = v22;
LABEL_8:
}

id __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_372(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _LSProgressLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 _LSDescription];
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Got progress %@ for app %@, ", buf, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 40) + 16) setProgress:v3 forBundleID:*(void *)(a1 + 32)];
  uint64_t v7 = [*(id *)(a1 + 40) remoteObserver];
  uint64_t v17 = *(void *)(a1 + 32);
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [v7 applicationInstallsDidChange:v8];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _OWORD v14[2] = __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_373;
  void v14[3] = &unk_1E522BBD8;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v15 = v9;
  uint64_t v16 = v10;
  uint64_t v11 = (void *)[v14 copy];
  uint64_t v12 = (void *)MEMORY[0x18530F950]();

  return v12;
}

void __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_373(int8x16_t *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = _LSProgressLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[2].i64[0];
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "Unpublishing progress block called for app %@", buf, 0xCu);
  }

  id v4 = +[LSApplicationWorkspace progressQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_374;
  block[3] = &unk_1E522BBD8;
  int8x16_t v6 = a1[2];
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(v4, block);
}

void *__69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_374(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 16);
  if (result)
  {
    [result removeProgressForBundleID:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    return (void *)[v4 removeSubscriberForPublishingKey:v3 andBundleID:v3];
  }
  return result;
}

- (id)installProgressForApplication:(id)a3 withPhase:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    int8x16_t v8 = [v6 bundleIdentifier];
    id v9 = [MEMORY[0x1E4F28F90] publishingKeyForApp:v8 withPhase:a4];
    uint64_t v10 = self;
    objc_sync_enter(v10);
    createdInstallProgresses = v10->_createdInstallProgresses;
    if (!createdInstallProgresses)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
      uint64_t v13 = v10->_createdInstallProgresses;
      v10->_createdInstallProgresses = (NSMutableDictionary *)v12;

      createdInstallProgresses = v10->_createdInstallProgresses;
    }
    char v14 = [(NSMutableDictionary *)createdInstallProgresses objectForKeyedSubscript:v9];
    if (!v14)
    {
      if ([v7 isPlaceholder])
      {
        char v14 = [MEMORY[0x1E4F28F90] childProgressForBundleID:v8 andPhase:a4];
        id v15 = [(LSApplicationWorkspace *)v10 syncObserverProxy];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        id v22[2] = __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke;
        v22[3] = &unk_1E522C740;
        uint64_t v23 = v7;
        [v15 createInstallProgressForApplication:v23 withPhase:a4 andPublishingString:v9 reply:v22];

        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke_377;
        v20[3] = &unk_1E522BBD8;
        v20[4] = v10;
        id v21 = v8;
        [v14 setCancellationHandler:v20];
        [(NSMutableDictionary *)v10->_createdInstallProgresses setObject:v14 forKeyedSubscript:v9];
        [v14 _publish];
        uint64_t v16 = _LSProgressLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v14 _LSDescription];
          *(_DWORD *)buf = 138412290;
          id v25 = v17;
          _os_log_impl(&dword_182959000, v16, OS_LOG_TYPE_DEFAULT, "Published install progress %@", buf, 0xCu);
        }
        uint64_t v18 = v23;
      }
      else
      {
        uint64_t v18 = _LSProgressLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v7;
          _os_log_impl(&dword_182959000, v18, OS_LOG_TYPE_DEFAULT, "App %@ is not a placeholder so cannot have progress", buf, 0xCu);
        }
        char v14 = 0;
      }
    }
    objc_sync_exit(v10);
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

void __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _LSProgressLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke_cold_1();
    }
  }
}

void __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke_377(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observerProxy];
  [v2 installationEndedForApplication:*(void *)(a1 + 40) withState:3];
}

- (BOOL)installPhaseFinishedForProgress:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"bundleID"];

  uint64_t v7 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "rangeOfString:options:", @".", 4));
  uint64_t v8 = [v4 installState];
  if (v8 == 4)
  {
    id v9 = _LSDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v4 _LSDescription];
      int v15 = 138412546;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_182959000, v9, OS_LOG_TYPE_DEFAULT, "installPhaseFinishedForProgress: %@ - %@ called", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v11 = [(LSApplicationWorkspace *)self syncObserverProxy];
    [v11 installationFailedForApplication:v7 reply:&__block_literal_global_385];
  }
  uint64_t v12 = _LSDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspace installPhaseFinishedForProgress:]();
  }

  [v4 _unpublish];
  uint64_t v13 = self;
  objc_sync_enter(v13);
  if (v6) {
    [(NSMutableDictionary *)v13->_createdInstallProgresses removeObjectForKey:v6];
  }
  objc_sync_exit(v13);

  return v8 != 4;
}

- (void)clearCreatedProgressForBundleID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(NSMutableDictionary *)v5->_createdInstallProgresses allKeys];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v15;
    *(void *)&long long v8 = 138412290;
    long long v13 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasPrefix:", v4, v13, (void)v14))
        {
          [(NSMutableDictionary *)v5->_createdInstallProgresses removeObjectForKey:v11];
          uint64_t v12 = _LSProgressLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v11;
            _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "Clearing progress for key %@ from cache", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (BOOL)_LSPrivateRebuildApplicationDatabasesForSystemApps:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5
{
  return [(LSApplicationWorkspace *)self _LSPrivateRebuildApplicationDatabasesForSystemApps:a3 internal:a4 user:a5 uid:0];
}

- (BOOL)_LSPrivateRebuildApplicationDatabasesForSystemApps:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5 uid:(unsigned int *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = _LSDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182959000, v10, OS_LOG_TYPE_DEFAULT, "Rebuilding LS database.", buf, 2u);
  }

  *(void *)buf = 0;
  id v25 = buf;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v11 = (void *)MEMORY[0x18530F680]();
  uint64_t v12 = +[_LSDServiceDomain defaultServiceDomain]();
  long long v13 = (void *)v12;
  if (a6)
  {
    if (*a6)
    {
      uint64_t v14 = -[_LSDServiceDomain initWithUID:]([_LSDServiceDomain alloc], *a6);
    }
    else
    {
      uint64_t v14 = +[_LSDServiceDomain systemSessionDomain]();
    }
    long long v15 = (void *)v14;
  }
  else
  {
    long long v15 = (void *)v12;
  }
  long long v16 = objc_opt_class();
  long long v17 = _LSDServiceGetXPCConnection(v16, (uint64_t)v15);
  uint64_t v18 = [v17 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_388];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke_389;
  v23[3] = &unk_1E522C680;
  v23[4] = buf;
  [v18 rebuildApplicationDatabasesForSystem:v9 internal:v8 user:v7 completionHandler:v23];

  uint64_t v19 = _LSDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v25[24]) {
      __int16 v20 = "SUCCESS";
    }
    else {
      __int16 v20 = "FAILED";
    }
    *(_DWORD *)uint64_t v28 = 136315138;
    uint64_t v29 = v20;
    _os_log_impl(&dword_182959000, v19, OS_LOG_TYPE_DEFAULT, "%s Finished rebuilding LS database.", v28, 0xCu);
  }

  uint8_t v21 = v25[24];
  _Block_object_dispose(buf, 8);
  return v21;
}

void __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke_cold_1();
  }
}

uint64_t __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke_389(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)rebuildDatabaseContentForFrameworkAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v12[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v12[1] = (void (*)(void, void))3221225472;
  v12[2] = (void (*)(void, void))__84__LSApplicationWorkspace_rebuildDatabaseContentForFrameworkAtURL_completionHandler___block_invoke;
  v12[3] = (void (*)(void, void))&unk_1E522C6F0;
  id v6 = v5;
  id v13 = v6;
  id v7 = a3;
  BOOL v8 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v12);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__LSApplicationWorkspace_rebuildDatabaseContentForFrameworkAtURL_completionHandler___block_invoke_2;
  v10[3] = &unk_1E522C6F0;
  id v11 = v6;
  id v9 = v6;
  [v8 refreshContentInFrameworkAtURL:v7 reply:v10];
}

uint64_t __84__LSApplicationWorkspace_rebuildDatabaseContentForFrameworkAtURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

uint64_t __84__LSApplicationWorkspace_rebuildDatabaseContentForFrameworkAtURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

- (void)noteRestrictionsUpdateForOpensWithCompletion:(id)a3
{
  id v3 = a3;
  v6[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v6[1] = (void (*)(void, void))3221225472;
  v6[2] = (void (*)(void, void))__71__LSApplicationWorkspace_noteRestrictionsUpdateForOpensWithCompletion___block_invoke;
  v6[3] = (void (*)(void, void))&unk_1E522C6F0;
  id v7 = v3;
  id v4 = v3;
  id v5 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v6);
  [v5 updateRestrictionKnowledgeWithCompletionHandler:v4];
}

uint64_t __71__LSApplicationWorkspace_noteRestrictionsUpdateForOpensWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_LSPrivateUpdateAppRemovalRestrictions
{
  +[LSApplicationRestrictionsManager sharedInstance]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRestrictionsManager cleanRemovedSystemApplicationsList]((uint64_t)v2);
}

- (void)_LSPrivateSetRemovedSystemAppIdentifiers:(id)a3
{
  id v3 = a3;
  +[LSApplicationRestrictionsManager sharedInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRestrictionsManager setRemovedSystemApplicationIdentifiers:](v4, v3);
}

- (id)_LSPrivateRemovedSystemAppIdentifiers
{
  id v2 = +[LSApplicationRestrictionsManager sharedInstance]();
  id v3 = -[LSApplicationRestrictionsManager removedSystemApplicationIdentifiers](v2);

  return v3;
}

- (BOOL)_LSPrivateDatabaseNeedsRebuild
{
  unsigned int v2 = _LSGetStatus();
  if ((v2 & 0x200) != 0)
  {
    id v3 = _LSDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "Incomplete database seed detected, _LSPrivateDatabaseNeedsRebuild = YES", v6, 2u);
    }
  }
  return (v2 >> 9) & 1;
}

- (void)_LSPrivateNoteMigratorRunning
{
  unsigned int v2 = objc_opt_class();
  id v3 = +[_LSDServiceDomain defaultServiceDomain]();
  _LSDServiceGetXPCConnection(v2, (uint64_t)v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_393];
  [v4 noteMigratorRunningWithReply:&__block_literal_global_396];
}

void __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_cold_1();
  }
}

void __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_394(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _LSDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_394_cold_1();
    }
  }
}

- (void)_LSFailedToOpenURL:(id)a3 withBundle:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = _LSDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    id v13 = v5;
    __int16 v14 = 2113;
    id v15 = v6;
    _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_INFO, "_LSFailedToOpenURL:%{private}@ withBundle:%{private}@", buf, 0x16u);
  }

  BOOL v8 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__LSApplicationWorkspace__LSFailedToOpenURL_withBundle___block_invoke;
  v10[3] = &unk_1E522C768;
  id v11 = v6;
  id v9 = v6;
  [v8 failedToOpenApplication:v9 withURL:v5 completionHandler:v10];
}

void __56__LSApplicationWorkspace__LSFailedToOpenURL_withBundle___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _LSDefaultLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138477827;
      uint64_t v10 = v8;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_INFO, "Finished presenting restoration prompt for %{private}@.", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __56__LSApplicationWorkspace__LSFailedToOpenURL_withBundle___block_invoke_cold_1();
  }
}

- (void)_LSClearSchemaCaches
{
  if (_LSCurrentProcessMayMapDatabase())
  {
    id v2 = 0;
    if (!_LSContextInit(&v2))
    {
      _LSSchemaClearAllCaches((uint64_t)v2 + 16);
      _LSContextDestroy(&v2);
    }
  }
}

- (void)sendExtensionNotificationsForSystemModeChangeFrom:(id)a3 to:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = _LSExtensionsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_INFO, "Begin updating extensions for mode change %@ -> %@", buf, 0x16u);
  }

  uint64_t v8 = objc_opt_new();
  int v9 = objc_opt_new();
  _LSServer_DatabaseExecutionContext();
  uint64_t v10 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  _OWORD v15[2] = __79__LSApplicationWorkspace_sendExtensionNotificationsForSystemModeChangeFrom_to___block_invoke;
  v15[3] = &unk_1E522CAA8;
  id v16 = v6;
  id v17 = v8;
  id v18 = v5;
  id v19 = v9;
  id v11 = v9;
  id v12 = v5;
  id v13 = v8;
  id v14 = v6;
  -[LSDBExecutionContext syncRead:](v10, v15);
}

void __79__LSApplicationWorkspace_sendExtensionNotificationsForSystemModeChangeFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = +[LSExtensionPointRecord enumerator];
  uint64_t v2 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v46 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v7 = [v6 SDKDictionary];
        uint64_t v8 = objc_opt_class();
        int v9 = [v7 objectForKey:@"LSExtensionRestrictedSystemModes" ofClass:v8 valuesOfClass:objc_opt_class()];

        if ([v9 containsObject:*(void *)(a1 + 32)]) {
          [*(id *)(a1 + 40) addObject:v6];
        }
        if ([v9 containsObject:*(void *)(a1 + 48)]) {
          [*(id *)(a1 + 56) addObject:v6];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v3);
  }

  uint64_t v10 = (void *)[*(id *)(a1 + 40) mutableCopy];
  [v10 minusSet:*(void *)(a1 + 56)];
  id v11 = (void *)[*(id *)(a1 + 56) mutableCopy];
  [v11 minusSet:*(void *)(a1 + 40)];
  id v12 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = +[LSApplicationExtensionRecord enumeratorWithExtensionPointRecord:*(void *)(*((void *)&v41 + 1) + 8 * j) options:0];
        id v19 = [v18 allObjects];
        [v12 addObjectsFromArray:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v15);
  }
  id obja = v13;

  __int16 v20 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v21 = v10;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = +[LSApplicationExtensionRecord enumeratorWithExtensionPointRecord:*(void *)(*((void *)&v37 + 1) + 8 * k) options:0];
        char v27 = [v26 allObjects];
        [v20 addObjectsFromArray:v27];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v53 count:16];
    }
    while (v23);
  }

  if ([v12 count])
  {
    uint64_t v28 = _LSExtensionsLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v12;
      _os_log_impl(&dword_182959000, v28, OS_LOG_TYPE_DEFAULT, "Sending system mode unrestricted app extension installedNotifications for %@", buf, 0xCu);
    }

    uint64_t v29 = +[_LSInstallProgressService sharedInstance];
    [v29 detachAndSendNotification:@"com.apple.LaunchServices.pluginsregistered" forApplicationExtensionRecords:v12];
  }
  if ([v20 count])
  {
    uint64_t v30 = _LSExtensionsLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v20;
      _os_log_impl(&dword_182959000, v30, OS_LOG_TYPE_DEFAULT, "Sending system mode restricted app extension uninstalledNotifications for %@", buf, 0xCu);
    }

    uint64_t v31 = +[_LSInstallProgressService sharedInstance];
    [v31 detachAndSendNotification:@"com.apple.LaunchServices.pluginsunregistered" forApplicationExtensionRecords:v20];
  }
  uint64_t v32 = _LSExtensionsLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    uint64_t v33 = *(void **)(a1 + 48);
    uint64_t v34 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v50 = v33;
    __int16 v51 = 2112;
    uint64_t v52 = v34;
    _os_log_impl(&dword_182959000, v32, OS_LOG_TYPE_INFO, "Done updating extensions for mode change %@ -> %@", buf, 0x16u);
  }
}

- (void)sendExtensionNotificationsForExtensionBundleIdentifier:(id)a3 changingRestrictionStateTo:(BOOL)a4
{
  id v5 = a3;
  _LSServer_DatabaseExecutionContext();
  id v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __108__LSApplicationWorkspace_sendExtensionNotificationsForExtensionBundleIdentifier_changingRestrictionStateTo___block_invoke;
  v8[3] = &unk_1E522CAD0;
  id v9 = v5;
  BOOL v10 = a4;
  id v7 = v5;
  -[LSDBExecutionContext syncRead:](v6, v8);
}

void __108__LSApplicationWorkspace_sendExtensionNotificationsForExtensionBundleIdentifier_changingRestrictionStateTo___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [LSApplicationExtensionRecord alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v13 = 0;
  uint64_t v4 = [(LSApplicationExtensionRecord *)v2 initWithBundleIdentifier:v3 error:&v13];
  id v5 = v13;
  if (v4)
  {
    if (*(unsigned char *)(a1 + 40)) {
      id v6 = @"com.apple.LaunchServices.pluginsunregistered";
    }
    else {
      id v6 = @"com.apple.LaunchServices.pluginsregistered";
    }
    id v7 = v6;
    uint64_t v8 = _LSInstallLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      v17[0] = v4;
      _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "Sending %@ for %@", buf, 0x16u);
    }

    id v9 = +[_LSInstallProgressService sharedInstance];
    v18[0] = v4;
    BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v9 detachAndSendNotification:v7 forApplicationExtensionRecords:v10];
  }
  else
  {
    id v7 = _LSInstallLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(NSObject **)(a1 + 32);
      int v12 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v11;
      __int16 v16 = 1024;
      LODWORD(v17[0]) = v12;
      WORD2(v17[0]) = 2112;
      *(void *)((char *)v17 + 6) = v5;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "no record for %@, could not change restriction state to %d: %@", buf, 0x1Cu);
    }
  }
}

- (void)sendApplicationStateChangedNotificationsFor:(id)a3 stateProvider:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    BOOL v10 = _LSServer_DatabaseExecutionContext();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __95__LSApplicationWorkspace_sendApplicationStateChangedNotificationsFor_stateProvider_completion___block_invoke;
    v25[3] = &unk_1E522C308;
    id v11 = v7;
    id v26 = v11;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v10, v25);

    _LSServer_DatabaseExecutionContext();
    int v12 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __95__LSApplicationWorkspace_sendApplicationStateChangedNotificationsFor_stateProvider_completion___block_invoke_2;
    v21[3] = &unk_1E522C4D8;
    id v22 = v11;
    id v23 = v8;
    uint64_t v24 = v9;
    -[LSDBExecutionContext syncRead:](v12, v21);
  }
  else
  {
    id v13 = _LSDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[LSApplicationWorkspace sendApplicationStateChangedNotificationsFor:stateProvider:completion:](v13, v14, v15, v16, v17, v18, v19, v20);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

void __95__LSApplicationWorkspace_sendApplicationStateChangedNotificationsFor_stateProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v6 = v2;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v1);
        }
        _LSServer_UpdateDatabaseWithInfo(*(void **)(*((void *)&v9 + 1) + 8 * v8++), 0, 0, 0, 1, v3, v4, v5);
      }
      while (v6 != v8);
      uint64_t v6 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  _LSArmSaveTimer(1);
}

void __95__LSApplicationWorkspace_sendApplicationStateChangedNotificationsFor_stateProvider_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v5 = *(id *)(v1 + 32);
  uint64_t v58 = [v5 countByEnumeratingWithState:&v70 objects:v83 count:16];
  if (v58)
  {
    uint64_t v57 = *(void *)v71;
    uint64_t v54 = v1;
    v55 = v2;
    uint64_t v52 = v4;
    v53 = v3;
    id v56 = v5;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v71 != v57) {
          objc_enumerationMutation(v5);
        }
        uint64_t v7 = *(__CFString **)(*((void *)&v70 + 1) + 8 * v6);
        uint64_t v8 = [LSApplicationRecord alloc];
        id v69 = 0;
        long long v9 = [(LSApplicationRecord *)v8 initWithBundleIdentifier:v7 allowPlaceholder:1 error:&v69];
        id v10 = v69;
        long long v11 = v10;
        if (v9)
        {
          id v60 = v10;
          uint64_t v61 = v6;
          v59 = [(LSApplicationRecord *)v9 applicationState];
          uint64_t v12 = [v59 isRestrictedWithStateProvider:*(void *)(v1 + 40)];
          v62 = v9;
          uint64_t v13 = MEMORY[0x1E4F1CC28];
          v76[0] = MEMORY[0x1E4F1CC28];
          v75[0] = @"isRemoved";
          v75[1] = @"isRestricted";
          uint64_t v14 = [NSNumber numberWithUnsignedChar:v12];
          v75[2] = @"isBlocked";
          v76[1] = v14;
          v76[2] = v13;
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];
          [v2 setObject:v15 forKey:v7];

          long long v9 = v62;
          v63 = [(LSApplicationRecord *)v62 applicationExtensionRecords];
          if ([v63 count])
          {
            if (_LSIsNewsBundleIdentifier(v7))
            {
              long long v67 = 0u;
              long long v68 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              id v16 = v63;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v65 objects:v74 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v66;
                uint64_t v20 = @" not";
                if (v12) {
                  uint64_t v20 = &stru_1ECB1A570;
                }
                v64 = v20;
                if (v12) {
                  id v21 = v3;
                }
                else {
                  id v21 = v4;
                }
                do
                {
                  for (uint64_t i = 0; i != v18; ++i)
                  {
                    if (*(void *)v66 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    id v23 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                    uint64_t v24 = [v23 effectiveBundleIdentifier];
                    if (!_LSIsNewsWidgetBundleIdentifier(v24)) {
                      goto LABEL_24;
                    }
                    id v25 = +[LSApplicationRestrictionsManager sharedInstance]();
                    int v26 = -[LSApplicationRestrictionsManager isAppExtensionRestricted:]((BOOL)v25, v24);

                    char v27 = _LSInstallLog();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v28 = @" not";
                      if (v26) {
                        uint64_t v28 = &stru_1ECB1A570;
                      }
                      v78 = (const char *)v64;
                      __int16 v79 = 2112;
                      v80 = v28;
                      _os_log_impl(&dword_182959000, v27, OS_LOG_TYPE_DEFAULT, "Note: News is%@ restricted, news widget is%@ restricted", buf, 0x16u);
                    }

                    if (v12 == v26) {
LABEL_24:
                    }
                      [v21 addObject:v23];
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v65 objects:v74 count:16];
                }
                while (v18);
                uint64_t v1 = v54;
                uint64_t v2 = v55;
                uint64_t v4 = v52;
                uint64_t v3 = v53;
                id v5 = v56;
                long long v9 = v62;
              }
              else
              {
                id v5 = v56;
              }
            }
            else
            {
              id v16 = [v63 allObjects];
              if (v12) {
                uint64_t v31 = v3;
              }
              else {
                uint64_t v31 = v4;
              }
              [v31 addObjectsFromArray:v16];
            }
          }
          long long v11 = v60;
          uint64_t v6 = v61;
          uint64_t v30 = v59;
        }
        else
        {
          uint64_t v29 = _LSInstallLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v78 = "-[LSApplicationWorkspace sendApplicationStateChangedNotificationsFor:stateProvider:completion:]_block_invoke_2";
            __int16 v79 = 2112;
            v80 = v7;
            __int16 v81 = 2112;
            v82 = v11;
            uint64_t v30 = v29;
            _os_log_error_impl(&dword_182959000, v29, OS_LOG_TYPE_ERROR, "%s: could not initialize record for bundleID %@: %@", buf, 0x20u);
          }
          else
          {
            uint64_t v30 = v29;
          }
        }

        ++v6;
      }
      while (v6 != v58);
      uint64_t v32 = [v5 countByEnumeratingWithState:&v70 objects:v83 count:16];
      uint64_t v58 = v32;
    }
    while (v32);
  }

  _LSLogStepAsync(7, 1, 0, @"Sending appStateChangedNotification with payload %@", v33, v34, v35, v36, (uint64_t)v2);
  long long v37 = _LSInstallLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v78 = (const char *)v2;
    _os_log_impl(&dword_182959000, v37, OS_LOG_TYPE_DEFAULT, "Sending appStateChangedNotification for %@", buf, 0xCu);
  }

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotificationWithOptions(DistributedCenter, @"com.apple.LaunchServices.applicationStateChanged", 0, (CFDictionaryRef)v2, 1uLL);
  if ([v4 count])
  {
    _LSLogStepAsync(7, 1, 0, @"Sending installedNotifications for %@", v39, v40, v41, v42, (uint64_t)v4);
    long long v43 = _LSInstallLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (const char *)v4;
      _os_log_impl(&dword_182959000, v43, OS_LOG_TYPE_DEFAULT, "Sending installedNotifications for %@", buf, 0xCu);
    }

    long long v44 = +[_LSInstallProgressService sharedInstance];
    [v44 detachAndSendNotification:@"com.apple.LaunchServices.pluginsregistered" forApplicationExtensionRecords:v4];
  }
  if ([v3 count])
  {
    _LSLogStepAsync(7, 1, 0, @"Sending uninstalledNotifications for %@", v45, v46, v47, v48, (uint64_t)v3);
    uint64_t v49 = _LSInstallLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (const char *)v3;
      _os_log_impl(&dword_182959000, v49, OS_LOG_TYPE_DEFAULT, "Sending uninstalledNotifications for %@", buf, 0xCu);
    }

    v50 = +[_LSInstallProgressService sharedInstance];
    [v50 detachAndSendNotification:@"com.apple.LaunchServices.pluginsunregistered" forApplicationExtensionRecords:v3];
  }
  uint64_t v51 = *(void *)(v1 + 48);
  if (v51) {
    (*(void (**)(void))(v51 + 16))();
  }
}

- (id)scanForApplicationStateChangesFromRank:(id)a3 toRank:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    _LSServer_DatabaseExecutionContext();
    long long v9 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__LSApplicationWorkspace_scanForApplicationStateChangesFromRank_toRank___block_invoke;
    v11[3] = &unk_1E522CAA8;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    id v14 = v8;
    -[LSDBExecutionContext syncRead:](v9, v11);
  }

  return v8;
}

void __72__LSApplicationWorkspace_scanForApplicationStateChangesFromRank_toRank___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__LSApplicationWorkspace_scanForApplicationStateChangesFromRank_toRank___block_invoke_2;
  v3[3] = &unk_1E522CAF8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 enumerateApplicationsOfType:0 block:v3];
}

void __72__LSApplicationWorkspace_scanForApplicationStateChangesFromRank_toRank___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 ratingRank];
  int v4 = [v3 intValue];

  LODWORD(v3) = v4 <= (int)[*(id *)(a1 + 32) intValue];
  if (((v3 ^ (v4 > (int)[*(id *)(a1 + 40) intValue])) & 1) == 0)
  {
    id v5 = *(void **)(a1 + 48);
    id v6 = [v7 bundleIdentifier];
    [v5 addObject:v6];
  }
}

- (id)scanForApplicationStateChangesWithAllowlist:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    _LSServer_DatabaseExecutionContext();
    id v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__LSApplicationWorkspace_scanForApplicationStateChangesWithAllowlist___block_invoke;
    v8[3] = &unk_1E522CB48;
    void v8[4] = self;
    id v9 = v4;
    id v10 = v5;
    -[LSDBExecutionContext syncRead:](v6, v8);
  }

  return v5;
}

void __70__LSApplicationWorkspace_scanForApplicationStateChangesWithAllowlist___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__LSApplicationWorkspace_scanForApplicationStateChangesWithAllowlist___block_invoke_2;
  v3[3] = &unk_1E522CB20;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateBundlesOfType:0 block:v3];
}

void __70__LSApplicationWorkspace_scanForApplicationStateChangesWithAllowlist___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 bundleIdentifier];
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    id v4 = [v6 appState];
    char v5 = [v4 isAlwaysAvailable];

    if ((v5 & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
}

- (id)scanForForDeletableSystemApps
{
  uint64_t v3 = objc_opt_new();
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    _LSServer_DatabaseExecutionContext();
    id v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__LSApplicationWorkspace_scanForForDeletableSystemApps__block_invoke;
    v6[3] = &unk_1E522CB98;
    void v6[4] = self;
    id v7 = v3;
    -[LSDBExecutionContext syncRead:](v4, v6);
  }

  return v3;
}

void __55__LSApplicationWorkspace_scanForForDeletableSystemApps__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__LSApplicationWorkspace_scanForForDeletableSystemApps__block_invoke_2;
  v2[3] = &unk_1E522CB70;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateApplicationsOfType:1 block:v2];
}

void __55__LSApplicationWorkspace_scanForForDeletableSystemApps__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isDeletableIgnoringRestrictions])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v5 bundleIdentifier];
    [v3 addObject:v4];
  }
}

- (BOOL)forceDatabaseSaveForTestingWithError:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__4;
  id v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v9[1] = (void (*)(void, void))3221225472;
  v9[2] = (void (*)(void, void))__63__LSApplicationWorkspace_forceDatabaseSaveForTestingWithError___block_invoke;
  v9[3] = (void (*)(void, void))&unk_1E522C550;
  void v9[4] = (void (*)(void, void))&v10;
  id v4 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__LSApplicationWorkspace_forceDatabaseSaveForTestingWithError___block_invoke_2;
  v8[3] = &unk_1E522C920;
  void v8[4] = &v10;
  void v8[5] = &v16;
  [v4 forceSaveForTestingWithCompletion:v8];
  _LSContextInvalidate();
  int v5 = *((unsigned __int8 *)v17 + 24);
  if (a3 && !*((unsigned char *)v17 + 24))
  {
    *a3 = (id) v11[5];
    int v5 = *((unsigned __int8 *)v17 + 24);
  }
  BOOL v6 = v5 != 0;

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __63__LSApplicationWorkspace_forceDatabaseSaveForTestingWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __63__LSApplicationWorkspace_forceDatabaseSaveForTestingWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 == 0;
}

- (void)ls_testWithCleanDatabaseWithError:(id *)a3
{
  if (![(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -5500, (uint64_t)"-[LSApplicationWorkspace ls_testWithCleanDatabaseWithError:]", 4228, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    CFTypeRef v6 = 0;
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  id v8 = 0;
  id v4 = _LSDatabaseCreateCleanForTesting(&v8);
  id v5 = v8;
  if (v4)
  {
    _LSSetLocalDatabase(v4);
    CFTypeRef v6 = CFAutorelease(v4);
  }
  else
  {
    CFTypeRef v6 = 0;
  }

  if (a3)
  {
LABEL_8:
    if (!v6) {
      *a3 = v5;
    }
  }
LABEL_10:

  return (void *)v6;
}

- (BOOL)ls_injectUTTypeWithDeclaration:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    id v13 = 0;
    BOOL v14 = 0;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (v7 && v8)
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:@"UTTypeDescription"];
    uint64_t v10 = (void *)v9;
    if (v9)
    {
      uint64_t v21 = v9;
      uint64_t v22 = v9;
      uint64_t v20 = @"LSDefaultLocalizedValue";
      long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      v23[0] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    }
    else
    {
      uint64_t v12 = 0;
    }
    int v16 = _UTTypeAddWithDeclarationDictionary();
    BOOL v14 = v16 == 0;
    if (v16)
    {
      id v13 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v16, (uint64_t)"-[LSApplicationWorkspace ls_injectUTTypeWithDeclaration:inDatabase:error:]", 4256, 0);
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v15 = (void *)*MEMORY[0x1E4F28760];
    uint64_t v18 = *MEMORY[0x1E4F28228];
    char v19 = @"invalid input parameters";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v13 = _LSMakeNSErrorImpl(v15, -50, (uint64_t)"-[LSApplicationWorkspace ls_injectUTTypeWithDeclaration:inDatabase:error:]", 4260, v12);
    BOOL v14 = 0;
  }

  if (a5)
  {
LABEL_15:
    if (!v14) {
      *a5 = v13;
    }
  }
LABEL_17:

  return v14;
}

- (void)ls_resetTestingDatabase
{
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    uint64_t v2 = 0;
    if (!_LSContextInit(&v2))
    {
      _LSContextUpdate((_LSDatabase **)&v2, 1, 0);
      _LSContextDestroy(&v2);
    }
  }
}

- (void)setHiddenApplications:(id)a3 completion:(id)a4
{
}

- (void)getHiddenApplicationsWithCompletion:(id)a3
{
}

- (void)setLockedApplications:(id)a3 completion:(id)a4
{
}

- (void)getLockedApplicationsWithCompletion:(id)a3
{
}

- (BOOL)mayProcessWithAuditTokenMapDatabase:(id *)a3
{
  return _LSAuditTokenMayMapDatabase((uint64_t)a3) != 0;
}

- (NSMutableDictionary)createdInstallProgresses
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (LSInstallProgressList)observedInstallProgresses
{
  return (LSInstallProgressList *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedInstallProgresses, 0);

  objc_storeStrong((id *)&self->_createdInstallProgresses, 0);
}

- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5 withFilter:(id)a6
{
  id v10 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _OWORD v14[2] = __101__LSApplicationWorkspace_DeprecatedEnumeration__pluginsWithIdentifiers_protocols_version_withFilter___block_invoke;
  void v14[3] = &unk_1E522CBC0;
  id v15 = v10;
  id v11 = v10;
  uint64_t v12 = [(LSApplicationWorkspace *)self pluginsWithIdentifiers:a3 protocols:a4 version:a5 applyFilter:v14];

  return v12;
}

uint64_t __101__LSApplicationWorkspace_DeprecatedEnumeration__pluginsWithIdentifiers_protocols_version_withFilter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5
{
  return [(LSApplicationWorkspace *)self pluginsWithIdentifiers:a3 protocols:a4 version:a5 applyFilter:&__block_literal_global_637];
}

uint64_t __90__LSApplicationWorkspace_DeprecatedEnumeration__pluginsWithIdentifiers_protocols_version___block_invoke()
{
  return 1;
}

- (void)enumerateBundlesOfType:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__LSApplicationWorkspace_DeprecatedEnumeration__enumerateBundlesOfType_usingBlock___block_invoke;
    v8[3] = &unk_1E522CC08;
    id v9 = v6;
    [(LSApplicationWorkspace *)self enumerateBundlesOfType:a3 legacySPI:1 block:v8];
  }
}

uint64_t __83__LSApplicationWorkspace_DeprecatedEnumeration__enumerateBundlesOfType_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)applicationsOfType:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__LSApplicationWorkspace_DeprecatedEnumeration__applicationsOfType___block_invoke;
  v8[3] = &unk_1E522CB70;
  id v6 = v5;
  id v9 = v6;
  [(LSApplicationWorkspace *)self enumerateApplicationsOfType:a3 legacySPI:1 block:v8];

  return v6;
}

uint64_t __68__LSApplicationWorkspace_DeprecatedEnumeration__applicationsOfType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)legacyApplicationProxiesListWithType:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__LSApplicationWorkspace_DeprecatedEnumeration__legacyApplicationProxiesListWithType___block_invoke;
  v8[3] = &unk_1E522CB70;
  id v6 = v5;
  id v9 = v6;
  [(LSApplicationWorkspace *)self enumerateBundlesOfType:a3 legacySPI:1 block:v8];

  return v6;
}

uint64_t __86__LSApplicationWorkspace_DeprecatedEnumeration__legacyApplicationProxiesListWithType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)allInstalledApplications
{
  return [(LSApplicationWorkspace *)self legacyApplicationProxiesListWithType:1];
}

- (id)placeholderApplications
{
  return [(LSApplicationWorkspace *)self legacyApplicationProxiesListWithType:3];
}

- (id)unrestrictedApplications
{
  return [(LSApplicationWorkspace *)self legacyApplicationProxiesListWithType:4];
}

- (id)allApplications
{
  return [(LSApplicationWorkspace *)self legacyApplicationProxiesListWithType:0];
}

- (id)applicationsAvailableForOpeningDocument:(id)a3
{
  return (id)[a3 applicationsAvailableForOpeningWithStyle:0 limit:-1 XPCConnection:0 error:0];
}

+ (id)_defaultAppQueue
{
  if (_defaultAppQueue_once != -1) {
    dispatch_once(&_defaultAppQueue_once, &__block_literal_global_651);
  }
  uint64_t v2 = (void *)_defaultAppQueue_result;

  return v2;
}

void __55__LSApplicationWorkspace_DefaultApps___defaultAppQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("LS default app setter queue", v2);
  uint64_t v1 = (void *)_defaultAppQueue_result;
  _defaultAppQueue_uint64_t result = (uint64_t)v0;
}

- (void)setDefaultURLHandlerForScheme:(id)a3 to:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(id)objc_opt_class() _defaultAppQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  _OWORD v15[2] = __83__LSApplicationWorkspace_DefaultApps__setDefaultURLHandlerForScheme_to_completion___block_invoke;
  v15[3] = &unk_1E522CC30;
  id v16 = v9;
  id v17 = v8;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __83__LSApplicationWorkspace_DefaultApps__setDefaultURLHandlerForScheme_to_completion___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v2 = [a1[4] claimRecords];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v19 + 1) + 8 * v6) URLSchemes];
        id v8 = [a1[5] lowercaseString];
        char v9 = [v7 containsObject:v8];

        if (v9)
        {

          id v14 = [(id)objc_opt_class() _defaultAppQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __83__LSApplicationWorkspace_DefaultApps__setDefaultURLHandlerForScheme_to_completion___block_invoke_2;
          block[3] = &unk_1E522C528;
          id v16 = a1[5];
          id v17 = a1[4];
          id v18 = a1[7];
          dispatch_async(v14, block);

          id v12 = v16;
          goto LABEL_12;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  id v10 = (void (**)(id, void, void *))a1[7];
  if (v10)
  {
    id v11 = (void *)*MEMORY[0x1E4F28760];
    uint64_t v23 = *MEMORY[0x1E4F28228];
    uint64_t v24 = @"scheme";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v13 = _LSMakeNSErrorImpl(v11, -50, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultURLHandlerForScheme:to:completion:]_block_invoke", 4421, v12);
    v10[2](v10, 0, v13);

LABEL_12:
  }
}

void __83__LSApplicationWorkspace_DefaultApps__setDefaultURLHandlerForScheme_to_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    [v4 _bundleVersion];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  int v5 = _LSSetSchemeHandler(v2, (uint64_t)v3, v10);
  id v9 = 0;
  BOOL v6 = _LSGetNSErrorFromOSStatusImpl(v5, &v9, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultURLHandlerForScheme:to:completion:]_block_invoke_2", 4415);
  id v7 = v9;

  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, v6, v7);
  }
}

- (void)setDefaultWebBrowserToApplicationRecord:(id)a3 completionHandler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (!_os_feature_enabled_impl())
  {
    if (v6)
    {
      if (([v6 isWebBrowser] & 1) == 0)
      {
        if (!v7) {
          goto LABEL_11;
        }
        id v13 = (void *)*MEMORY[0x1E4F28760];
        uint64_t v20 = *MEMORY[0x1E4F28228];
        v21[0] = @"input application record was not a web browser";
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
        id v14 = _LSMakeNSErrorImpl(v13, -50, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultWebBrowserToApplicationRecord:completionHandler:]", 4439, v12);
        v7[2](v7, 0, v14);

LABEL_10:
        goto LABEL_11;
      }
      uint64_t v8 = [v6 bundleIdentifier];
      [v6 _bundleVersion];
      id v9 = _LSVersionNumberGetStringRepresentation(&v19);
    }
    else
    {
      uint64_t v8 = 0;
      id v9 = 0;
    }
    id v10 = [(id)objc_opt_class() _defaultAppQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    _OWORD v15[2] = __97__LSApplicationWorkspace_DefaultApps__setDefaultWebBrowserToApplicationRecord_completionHandler___block_invoke;
    v15[3] = &unk_1E522C528;
    id v16 = v8;
    id v17 = v9;
    id v18 = v7;
    id v11 = v9;
    id v12 = v8;
    dispatch_async(v10, v15);

    goto LABEL_10;
  }
  [(LSApplicationWorkspace *)self setDefaultApplicationForCategory:1 toApplicationRecord:v6 completionHandler:v7];
LABEL_11:
}

void __97__LSApplicationWorkspace_DefaultApps__setDefaultWebBrowserToApplicationRecord_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = _LSSetDefaultWebBrowserWithBundleIdentifierAndVersion(*(void *)(a1 + 32), *(__CFString **)(a1 + 40));
  id v6 = 0;
  BOOL v3 = _LSGetNSErrorFromOSStatusImpl(v2, &v6, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultWebBrowserToApplicationRecord:completionHandler:]_block_invoke", 4451);
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v3, v4);
  }
}

- (void)setDefaultMailClientToApplicationRecord:(id)a3 completionHandler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (!_os_feature_enabled_impl())
  {
    if (v6)
    {
      if (([v6 isMailClient] & 1) == 0)
      {
        if (!v7) {
          goto LABEL_11;
        }
        id v11 = (void *)*MEMORY[0x1E4F28760];
        uint64_t v20 = *MEMORY[0x1E4F28228];
        v21[0] = @"input application record was not a mail client";
        id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
        id v12 = _LSMakeNSErrorImpl(v11, -50, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultMailClientToApplicationRecord:completionHandler:]", 4473, v10);
        v7[2](v7, 0, v12);

LABEL_10:
        goto LABEL_11;
      }
      uint64_t v8 = [v6 bundleIdentifier];
      long long v18 = 0u;
      long long v19 = 0u;
      [v6 _bundleVersion];
    }
    else
    {
      uint64_t v8 = 0;
      long long v18 = kLSVersionNumberNull;
      long long v19 = *(_OWORD *)algn_182AF9270;
    }
    id v9 = [(id)objc_opt_class() _defaultAppQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __97__LSApplicationWorkspace_DefaultApps__setDefaultMailClientToApplicationRecord_completionHandler___block_invoke;
    v13[3] = &unk_1E522CC58;
    id v14 = v8;
    long long v16 = v18;
    long long v17 = v19;
    id v15 = v7;
    id v10 = v8;
    dispatch_async(v9, v13);

    goto LABEL_10;
  }
  [(LSApplicationWorkspace *)self setDefaultApplicationForCategory:2 toApplicationRecord:v6 completionHandler:v7];
LABEL_11:
}

void __97__LSApplicationWorkspace_DefaultApps__setDefaultMailClientToApplicationRecord_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 64);
  v9[0] = *(_OWORD *)(a1 + 48);
  v9[1] = v3;
  int v4 = _LSSetSchemeHandler(@"mailto", v2, v9);
  id v8 = 0;
  BOOL v5 = _LSGetNSErrorFromOSStatusImpl(v4, &v8, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultMailClientToApplicationRecord:completionHandler:]_block_invoke", 4480);
  id v6 = v8;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, BOOL, id))(v7 + 16))(v7, v5, v6);
  }
}

- (void)relaxApplicationTypeRequirements:(BOOL)a3 forApplicationRecord:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 4497, @"Invalid parameter not satisfying: %@", @"appRecord != nil" object file lineNumber description];
  }
  id v11 = [v9 bundleIdentifier];
  id v12 = &__block_literal_global_668;
  if (v10) {
    id v12 = v10;
  }
  v16[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v16[1] = (void (*)(void, void))3221225472;
  v16[2] = (void (*)(void, void))__111__LSApplicationWorkspace_DefaultApps__relaxApplicationTypeRequirements_forApplicationRecord_completionHandler___block_invoke_2;
  v16[3] = (void (*)(void, void))&unk_1E522C6F0;
  id v17 = v12;
  id v13 = v12;
  id v14 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v16);
  [v14 relaxApplicationTypeRequirements:v6 forBundleIdentifier:v11 completionHandler:v13];
}

uint64_t __111__LSApplicationWorkspace_DefaultApps__relaxApplicationTypeRequirements_forApplicationRecord_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAllDefaultApplicationPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (!v3) {
    id v3 = &__block_literal_global_670;
  }
  id v5 = v3;
  int v4 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, 0);
  [v4 removeAllHandlersWithCompletionHandler:v5];
}

- (void)setDefaultApplicationForCategory:(unint64_t)a3 toApplicationRecord:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(id)objc_opt_class() _defaultAppQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__LSApplicationWorkspace_DefaultApps__setDefaultApplicationForCategory_toApplicationRecord_completionHandler___block_invoke;
  block[3] = &unk_1E522CC80;
  id v14 = v8;
  unint64_t v15 = a3;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __110__LSApplicationWorkspace_DefaultApps__setDefaultApplicationForCategory_toApplicationRecord_completionHandler___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (LaunchServices::BindingEvaluator *)*((void *)LSGetDefaultAppCategoryInfoForCategory(a1[6]) + 1);
  if (!_os_feature_enabled_impl())
  {
    id v5 = (id *)(a1 + 4);
    if (a1[4])
    {
      uint64_t v10 = -4;
      goto LABEL_17;
    }
LABEL_13:
    int v11 = _LSRemoveDefaultRoleHandlerForContentType((uint64_t)v2, 0xFFFFFFFFLL);
    if (v11)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v11, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultApplicationForCategory:toApplicationRecord:completionHandler:]_block_invoke", 4596, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
    goto LABEL_29;
  }
  uint64_t v3 = _LSGetAuditTokenForSelf();
  int v4 = _LSCheckEntitlementForChangingDefaultHandler(v3, 0, (uint64_t)v2);
  id v5 = (id *)(a1 + 4);
  if (!a1[4]) {
    goto LABEL_13;
  }
  if (!v4)
  {
    uint64_t v10 = -54;
LABEL_17:
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v10, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultApplicationForCategory:toApplicationRecord:completionHandler:]_block_invoke", 4564, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7) {
      goto LABEL_29;
    }
    goto LABEL_18;
  }
  *(void *)&long long v18 = 0;
  id v16 = 0;
  int inited = _LSContextInitReturningError((id *)&v18, &v16);
  id v7 = v16;
  if (inited
    && !_LSCanBundleHandleNodeOrSchemeOrUTI((int)&v18, [*v5 unitID], 0, 0, v2, 14))
  {
    id v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __110__LSApplicationWorkspace_DefaultApps__setDefaultApplicationForCategory_toApplicationRecord_completionHandler___block_invoke_cold_1([*v5 unitID], (uint64_t)v2, (uint64_t)v20, v8);
    }

    uint64_t v9 = _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", -105, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultApplicationForCategory:toApplicationRecord:completionHandler:]_block_invoke", 4559, 0);

    id v7 = (id)v9;
  }

  if (!v7)
  {
LABEL_18:
    if (!*v5
      || ([*v5 bundleIdentifier],
          id v12 = objc_claimAutoreleasedReturnValue(),
          BOOL v13 = v12 == 0,
          v12,
          !v13)
      || (_LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", 118, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultApplicationForCategory:toApplicationRecord:completionHandler:]_block_invoke", 4571, 0), (id v7 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v14 = [*v5 bundleIdentifier];
      long long v18 = 0u;
      long long v19 = 0u;
      if (*v5) {
        [*v5 _bundleVersion];
      }
      if (*v5)
      {
        v17[0] = v18;
        v17[1] = v19;
        int v15 = _LSSetContentTypeHandler((uint64_t)v2, 0xFFFFFFFFLL, (uint64_t)v14, v17);
      }
      else
      {
        int v15 = _LSRemoveDefaultRoleHandlerForContentType((uint64_t)v2, 0xFFFFFFFFLL);
      }
      if (v15)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v15, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultApplicationForCategory:toApplicationRecord:completionHandler:]_block_invoke", 4589, 0);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = 0;
      }
    }
  }
LABEL_29:
  _LSContextInvalidate();
  (*(void (**)(void, BOOL, id))(a1[5] + 16))(a1[5], v7 == 0, v7);
}

- (id)defaultApplicationForCategory:(unint64_t)a3 error:(id *)a4
{
  if (_os_feature_enabled_impl())
  {
    BOOL v6 = [[LSClaimBinding alloc] initWithTypeIdentifier:*((void *)LSGetDefaultAppCategoryInfoForCategory(a3) + 1) error:a4];
    id v7 = v6;
    if (v6)
    {
      id v8 = [(LSClaimBinding *)v6 bundleRecord];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v10 = [(LSClaimBinding *)v7 bundleRecord];
LABEL_10:

        goto LABEL_20;
      }
      if (a4)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10811, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) defaultApplicationForCategory:error:]", 4632, 0);
        uint64_t v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  switch(a3)
  {
    case 1uLL:
      int v11 = @"https";
      goto LABEL_14;
    case 2uLL:
      int v11 = @"mailto";
LABEL_14:
      uint64_t v12 = bestRecordForScheme(v11, a4);
      goto LABEL_19;
    case 3uLL:
      BOOL v13 = [LSApplicationRecord alloc];
      id v14 = @"com.apple.MobileSMS";
      goto LABEL_18;
    case 4uLL:
      BOOL v13 = [LSApplicationRecord alloc];
      id v14 = @"com.apple.mobilephone";
      goto LABEL_18;
    case 5uLL:
      BOOL v13 = [LSApplicationRecord alloc];
      id v14 = @"com.apple.Passbook";
LABEL_18:
      uint64_t v12 = [(LSApplicationRecord *)v13 initWithBundleIdentifier:v14 allowPlaceholder:0 error:a4];
LABEL_19:
      uint64_t v10 = (void *)v12;
      break;
    default:
      if (a4)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) defaultApplicationForCategory:error:]", 4661, 0);
        uint64_t v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v10 = 0;
      }
      break;
  }
LABEL_20:

  return v10;
}

- (BOOL)getDefaultApplicationCategories:(unint64_t *)a3 withCurrentDefaultApplication:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [v8 supportedDefaultAppCategories];
  if (v9)
  {
    unint64_t v10 = v9;
    unint64_t v11 = 0;
    do
    {
      unint64_t v12 = LSDefaultAppCategoryForMask(v10);
      id v17 = 0;
      BOOL v13 = [(LSApplicationWorkspace *)self defaultApplicationForCategory:v12 error:&v17];
      id v14 = v17;
      if ([v13 isEqual:v8]) {
        v11 |= LSDefaultAppCategoryMaskForCategory(v12);
      }
      v10 &= ~LSDefaultAppCategoryMaskForCategory(v12);

      BOOL v15 = v14 == 0;
    }
    while (v10 && !v14);
  }
  else
  {
    unint64_t v11 = 0;
    id v14 = 0;
    BOOL v15 = 1;
  }
  if (a3 && v15) {
    *a3 = v11;
  }
  if (a5) {
    *a5 = v14;
  }

  return v15;
}

- (BOOL)canChangeDefaultAppForCategory:(unint64_t)a3
{
  return LSDefaultAppCategoryMayBeChanged(a3);
}

- (BOOL)setPreferredAppMarketplaces:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  v11[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v11[1] = (void (*)(void, void))3221225472;
  v11[2] = (void (*)(void, void))__74__LSApplicationWorkspace_Marketplaces__setPreferredAppMarketplaces_error___block_invoke;
  v11[3] = (void (*)(void, void))&unk_1E522C550;
  void v11[4] = (void (*)(void, void))&v12;
  BOOL v6 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = __74__LSApplicationWorkspace_Marketplaces__setPreferredAppMarketplaces_error___block_invoke_2;
  v10[3] = &unk_1E522C550;
  void v10[4] = &v12;
  [v6 setPreferredAppMarketplaces:v5 completion:v10];

  id v7 = (void *)v13[5];
  if (a4 && v7)
  {
    *a4 = v7;
    id v7 = (void *)v13[5];
  }
  BOOL v8 = v7 == 0;
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __74__LSApplicationWorkspace_Marketplaces__setPreferredAppMarketplaces_error___block_invoke(uint64_t a1, void *a2)
{
}

void __74__LSApplicationWorkspace_Marketplaces__setPreferredAppMarketplaces_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __77__LSApplicationWorkspace_Marketplaces__getPreferredAppMarketplacesWithError___block_invoke(uint64_t a1, void *a2)
{
}

- (id)applicationsAvailableForOpeningURL:(id)a3
{
  return [(LSApplicationWorkspace *)self applicationsAvailableForOpeningURL:a3 legacySPI:0];
}

- (id)applicationsAvailableForOpeningURL:(id)a3 legacySPI:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (void *)MEMORY[0x18530F680]();
  if (v5 && ([v5 isFileURL] & 1) == 0)
  {
    BOOL v8 = +[_LSCanOpenURLManager queryForApplicationsAvailableForOpeningURL:v5];
    uint64_t v9 = v8;
    if (v8)
    {
      char v27 = v6;
      [v8 setLegacy:v4];
      unint64_t v10 = +[_LSQueryContext defaultContext];
      uint64_t v26 = v9;
      unint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
      uint64_t v12 = [v10 resolveQueries:v11 error:0];
      BOOL v13 = [v12 allValues];
      uint64_t v14 = [v13 firstObject];

      if (v14) {
        id v15 = v14;
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v7 = v14;
      uint64_t v16 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v7);
            }
            uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v21 = _LSDefaultLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              long long v22 = [v20 bundleIdentifier];
              [v5 scheme];
              uint64_t v24 = v23 = v5;
              *(_DWORD *)buf = 138478083;
              uint64_t v33 = v22;
              __int16 v34 = 2113;
              uint64_t v35 = v24;
              _os_log_impl(&dword_182959000, v21, OS_LOG_TYPE_DEFAULT, "Found application: %{private}@ to handle url scheme: %{private}@", buf, 0x16u);

              id v5 = v23;
            }
          }
          uint64_t v17 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v17);
      }

      uint64_t v9 = v26;
      BOOL v6 = v27;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isApplicationAvailableToOpenURL:(id)a3 error:(id *)a4
{
  return [(LSApplicationWorkspace *)self isApplicationAvailableToOpenURLCommon:a3 includePrivateURLSchemes:1 error:a4];
}

- (BOOL)isApplicationAvailableToOpenURLCommon:(id)a3 includePrivateURLSchemes:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__4;
  uint64_t v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  BOOL v8 = [v7 scheme];
  if (v8)
  {
    if ([(id)__LSDefaultsGetSharedInstance() isServer])
    {
      uint64_t v9 = +[_LSCanOpenURLManager sharedManager];
      unint64_t v10 = (id *)(v21 + 5);
      id obj = (id)v21[5];
      char v11 = [v9 canOpenURL:v7 publicSchemes:1 privateSchemes:v6 XPCConnection:0 error:&obj];
      objc_storeStrong(v10, obj);
      *((unsigned char *)v27 + 24) = v11;
    }
    else
    {
      v18[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
      v18[1] = (void (*)(void, void))3221225472;
      void v18[2] = (void (*)(void, void))__107__LSApplicationWorkspace_URLQueries__isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error___block_invoke;
      v18[3] = (void (*)(void, void))&unk_1E522C550;
      v18[4] = (void (*)(void, void))&v20;
      uint64_t v9 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v18);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      _OWORD v17[2] = __107__LSApplicationWorkspace_URLQueries__isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error___block_invoke_2;
      v17[3] = &unk_1E522C6A8;
      void v17[4] = &v26;
      v17[5] = &v20;
      [v9 canOpenURL:v7 publicSchemes:1 privateSchemes:v6 completionHandler:v17];
    }
  }
  else
  {
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31[0] = @"Invalid input URL";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v12 = _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", -105, (uint64_t)"-[LSApplicationWorkspace(URLQueries) isApplicationAvailableToOpenURLCommon:includePrivateURLSchemes:error:]", 4862, v9);
    BOOL v13 = (void *)v21[5];
    v21[5] = v12;
  }
  int v14 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((unsigned char *)v27 + 24))
  {
    *a5 = (id) v21[5];
    int v14 = *((unsigned __int8 *)v27 + 24);
  }
  BOOL v15 = v14 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

void __107__LSApplicationWorkspace_URLQueries__isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error___block_invoke(uint64_t a1, void *a2)
{
}

void __107__LSApplicationWorkspace_URLQueries__isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)applicationForOpeningResource:(id)a3
{
  uint64_t v3 = [(LSApplicationWorkspace *)self applicationsAvailableForOpeningURL:a3 legacySPI:1];
  BOOL v4 = [v3 firstObject];

  return v4;
}

- (id)applicationsAvailableForHandlingURLScheme:(id)a3
{
  if (a3)
  {
    BOOL v4 = (objc_class *)MEMORY[0x1E4F1CB10];
    id v5 = a3;
    id v6 = [v4 alloc];
    id v7 = [NSString stringWithFormat:@"%@://", v5];

    BOOL v8 = (void *)[v6 initWithString:v7];
    if ([v8 isFileURL])
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = [(LSApplicationWorkspace *)self applicationsAvailableForOpeningURL:v8 legacySPI:1];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)publicURLSchemes
{
  uint64_t v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(LSApplicationWorkspace(DeprecatedURLQueries) *)a2 publicURLSchemes];
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)privateURLSchemes
{
  uint64_t v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(LSApplicationWorkspace(DeprecatedURLQueries) *)a2 publicURLSchemes];
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)URLOverrideForURL:(id)a3
{
  uint64_t v3 = LaunchServices::URLOverrides::getURLOverrideCommon((LaunchServices::URLOverrides *)a3, (NSURL *)a2);

  return v3;
}

- (id)URLOverrideForNewsURL:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)systemMode
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Failed to get system mode with error: %@", v2, v3, v4, v5, v6);
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138478083;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v1, v2, "Failed to open URL synchronously: %{private}@: %{public}@", (void)v3, DWORD2(v3));
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_316_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138478083;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v1, v2, "Failed to open URL asynchronously %{private}@: %{public}@", (void)v3, DWORD2(v3));
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_317_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138478083;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v1, v2, "Failed to open URL %{private}@: %{public}@", (void)v3, DWORD2(v3));
}

- (void)installApplication:(uint64_t)a3 withOptions:(uint64_t)a4 error:(uint64_t)a5 usingBlock:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)installContainerizedApplicationArtifactAtURL:(uint64_t)a3 withOptions:(uint64_t)a4 returningRecordPromise:(uint64_t)a5 error:(uint64_t)a6 progressBlock:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)uninstallContainerizedApplicationWithIdentifier:(uint64_t)a3 options:(uint64_t)a4 error:(uint64_t)a5 progressBlock:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)downgradeApplicationToPlaceholder:withOptions:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_182959000, v0, v1, "This process is using deprecated SPI. This is a bug in the caller. Use InstallCoordination instead. ", v2, v3, v4, v5, v6);
}

- (void)uninstallApplication:(uint64_t)a3 withOptions:(uint64_t)a4 error:(uint64_t)a5 usingBlock:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerApplicationDictionary:withObserverNotification:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_18_0();
  int v2 = 0;
  _os_log_error_impl(&dword_182959000, v0, OS_LOG_TYPE_ERROR, "Failed to create application proxy for %@, regustration result was %d", v1, 0x12u);
}

- (void)unregisterApplicationsAtMountPoint:(void *)a1 operationUUID:(uint64_t)a2 saveObserver:(uint64_t)a3 requestContext:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v5 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = v5;
  OUTLINED_FUNCTION_5_0(&dword_182959000, a4, a3, "Unable to unregister applications at mount point: %@: %@", (uint8_t *)a3);
}

- (void)unregisterApplication:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Unable to unregister application at %@: %@");
}

- (void)updateSINFWithData:(uint64_t)a3 forApplication:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Could not get record by URL: %@", v2, v3, v4, v5, v6);
}

- (void)_getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "failed to reregister: %@", v2, v3, v4, v5, v6);
}

- (void)_getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "update block failed; not reregistering URL: %@", v2, v3, v4, v5, v6);
}

- (void)updateiTunesMetadataWithData:(uint64_t)a3 forApplication:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateiTunesMetadataWithData:(uint64_t)a3 forApplicationAtURL:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updatePlaceholderMetadataForApp:installType:failure:underlyingError:source:outError:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "MobileInstallatinUpdatePlaceholderMetadata returned error %@, not updating LaunchServices database", v2, v3, v4, v5, v6);
}

- (void)unregisterPlugin:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Error unregistering plugins at URL %@: %@");
}

void __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "could not retrieve device identifier for advertising! %@", v2, v3, v4, v5, v6);
}

void __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_365_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_182959000, v0, v1, "advertising identifier returned from service was nil!", v2, v3, v4, v5, v6);
}

void __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "could not retrieve device identifier for vendor! %@", v2, v3, v4, v5, v6);
}

void __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_368_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_182959000, v0, v1, "vendor identifier returned from service was nil!", v2, v3, v4, v5, v6);
}

void __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138740227;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_182959000, v1, v2, "could not retrieve device identifier for advertising while checking url: %{sensitive}@ %@", (void)v3, DWORD2(v3));
}

- (void)deviceIdentifierForVendorSeedData
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19(&dword_182959000, v0, v1, "Vendor seed UUID is nil", v2, v3, v4, v5, v6);
}

- (void)installProgressForBundleID:(void *)a1 makeSynchronous:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _LSDescription];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_182959000, a2, OS_LOG_TYPE_DEBUG, "Returning progress %@", v4, 0xCu);
}

- (void)installProgressForBundleID:makeSynchronous:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "Getting installProgress for %@", v2, v3, v4, v5, v6);
}

void __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "Attempting subscribe to progress for %@", v2, v3, v4, v5, v6);
}

void __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_1_3(&dword_182959000, v0, v1, "NOT subscribing to progress for %@, existing subscriptions %@");
}

void __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_182959000, v1, v2, "Failed to create install progress for application %@: %@", (void)v3, DWORD2(v3));
}

- (void)installPhaseFinishedForProgress:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3(&dword_182959000, v0, v1, "installPhaseFinishedForProgress: %@ - %@ called, removing progress from cache");
}

void __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "error on connection to modify service: %@", v2, v3, v4, v5, v6);
}

void __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "could not note migrator running in lsd: %@", v2, v3, v4, v5, v6);
}

void __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_394_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "could not note migrator running in lsd: note returned %@", v2, v3, v4, v5, v6);
}

void __56__LSApplicationWorkspace__LSFailedToOpenURL_withBundle___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138478083;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_182959000, v1, v2, "*** ERROR *** Presenting restoration prompt for %{private}@: %@", (void)v3, DWORD2(v3));
}

- (void)sendApplicationStateChangedNotificationsFor:(uint64_t)a3 stateProvider:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __110__LSApplicationWorkspace_DefaultApps__setDefaultApplicationForCategory_toApplicationRecord_completionHandler___block_invoke_cold_1(unsigned int a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 134218242;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_5_0(&dword_182959000, a4, a3, "Record with unit 0x%llx does not claim %@", (uint8_t *)a3);
}

@end