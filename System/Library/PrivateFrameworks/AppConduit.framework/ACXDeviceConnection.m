@interface ACXDeviceConnection
+ (id)sharedDeviceConnection;
+ (void)_removeFilesAtURL:(id)a3;
+ (void)disableTestMode;
+ (void)enableTestMode;
+ (void)performUninstallationCleanup;
- (ACXDeviceConnection)init;
- (ACXDeviceConnectionDelegate)delegate;
- (BOOL)_companionAppWithoutCounterparts:(id)a3;
- (BOOL)_onQueue_createXPCConnectionIfNecessary:(id *)a3;
- (BOOL)_onQueue_enableObserversIfNeededForAValidXPCConnection;
- (BOOL)acknowledgeTestFlightInstallBegunForApp:(id)a3 onDeviceWithPairingID:(id)a4 error:(id *)a5;
- (BOOL)cancelUpdatePendingForCompanionApp:(id)a3 error:(id *)a4;
- (BOOL)fetchApplicationDatabaseSyncInformationForDeviceWithPairingID:(id)a3 returningDatabaseUUID:(id *)a4 lastSequenceNumber:(unint64_t *)a5 error:(id *)a6;
- (BOOL)fetchApplicationDatabaseSyncInformationForPairedDevice:(id)a3 returningDatabaseUUID:(id *)a4 lastSequenceNumber:(unint64_t *)a5 error:(id *)a6;
- (BOOL)getAlwaysInstall:(BOOL *)a3 forPairedDevice:(id)a4 error:(id *)a5;
- (BOOL)getApplicationIsInstalled:(BOOL *)a3 onAnyPairedDeviceWithBundleID:(id)a4 error:(id *)a5;
- (BOOL)getApplicationIsInstalled:(BOOL *)a3 onAnyPairedDeviceWithCompanionBundleID:(id)a4 error:(id *)a5;
- (BOOL)getApplicationIsInstalled:(BOOL *)a3 onDeviceWithPairingID:(id)a4 withCompanionBundleID:(id)a5 error:(id *)a6;
- (BOOL)getApplicationIsInstalled:(BOOL *)a3 onPairedDevice:(id)a4 withCompanionBundleID:(id)a5 error:(id *)a6;
- (BOOL)getApplicationIsInstalled:(BOOL *)a3 withBundleID:(id)a4 onDeviceWithPairingID:(id)a5 error:(id *)a6;
- (BOOL)getApplicationIsInstalled:(BOOL *)a3 withBundleID:(id)a4 onPairedDevice:(id)a5 error:(id *)a6;
- (BOOL)getApplicationWithBundleID:(id)a3 willInstallAfterPairing:(BOOL *)a4 onDevice:(id)a5 error:(id *)a6;
- (BOOL)getSystemAppInstallability:(BOOL *)a3 onDeviceWithPairingID:(id)a4 withBundleID:(id)a5 error:(id *)a6;
- (BOOL)getSystemAppInstallability:(BOOL *)a3 onPairedDevice:(id)a4 withBundleID:(id)a5 error:(id *)a6;
- (BOOL)installApplication:(id)a3 onPairedDevice:(id)a4 installationStatus:(int64_t *)a5 error:(id *)a6;
- (BOOL)installApplication:(id)a3 withProvisioningProfiles:(id)a4 onPairedDevice:(id)a5 installationStatus:(int64_t *)a6 error:(id *)a7;
- (BOOL)installApplicationAtURL:(id)a3 onDeviceWithPairingID:(id)a4 installOptions:(id)a5 size:(int64_t)a6 installationStatus:(int64_t *)a7 error:(id *)a8;
- (BOOL)installApplicationAtURL:(id)a3 onPairedDevice:(id)a4 installOptions:(id)a5 size:(int64_t)a6 installationStatus:(int64_t *)a7 error:(id *)a8;
- (BOOL)installProvisioningProfileWithURL:(id)a3 onPairedDevice:(id)a4 error:(id *)a5;
- (BOOL)installRequestFailedForApp:(id)a3 onDeviceWithPairingID:(id)a4 failureReason:(id)a5 wasUserInitiated:(BOOL)a6 error:(id *)a7;
- (BOOL)killDaemonForTestingWithError:(id *)a3;
- (BOOL)monitoringForDeviceChanges;
- (BOOL)observersEnabled;
- (BOOL)removeApplication:(id)a3 fromPairedDevice:(id)a4 removalStatus:(int64_t *)a5 error:(id *)a6;
- (BOOL)removeProvisioningProfileWithID:(id)a3 fromPairedDevice:(id)a4 error:(id *)a5;
- (BOOL)setUpdatePendingForCompanionApp:(id)a3 error:(id *)a4;
- (BOOL)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 writingToPreferencesLocation:(unint64_t)a5 forPairedDevice:(id)a6 options:(unint64_t)a7 error:(id *)a8;
- (NSHashTable)observers;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)observerQueue;
- (OS_dispatch_source)observerReEstablishTimer;
- (id)_locallyAvailableApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)_proxyWithErrorHandler:(id)a3;
- (id)_synchronousProxyWithErrorHandler:(id)a3;
- (id)_validateAndExtractProfiles:(id)a3 error:(id *)a4;
- (id)applicationOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 error:(id *)a5;
- (id)applicationOnPairedDevice:(id)a3 withBundleID:(id)a4 error:(id *)a5;
- (id)applicationRemovabilityForPairedDevice:(id)a3 error:(id *)a4;
- (id)copyLocalizedValuesFromAllDevicesForInfoPlistKeys:(id)a3 forAppWithBundleID:(id)a4 fetchingFirstMatchingLocalizationInList:(id)a5 error:(id *)a6;
- (id)copyRemoteDuplicatedClassInfoWithError:(id *)a3;
- (id)installableSystemAppWithBundleID:(id)a3 onDeviceWithPairingID:(id)a4 error:(id *)a5;
- (id)installableSystemAppWithBundleID:(id)a3 onPairedDevice:(id)a4 error:(id *)a5;
- (id)locallyAvailableApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 error:(id *)a5;
- (id)locallyAvailableApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 error:(id *)a5;
- (id)locallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forDeviceWithPairingID:(id)a4 error:(id *)a5;
- (id)locallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forPairedDevice:(id)a4 error:(id *)a5;
- (id)provisioningProfilesForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 error:(id *)a5;
- (id)provisioningProfilesForPairedDevice:(id)a3 error:(id *)a4;
- (id)watchAppBundleIDForCompanionAppBundleID:(id)a3 error:(id *)a4;
- (id)watchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:(id)a3 error:(id *)a4;
- (void)_deviceDidBecomeActiveNotification:(id)a3;
- (void)_deviceDidPairNotification:(id)a3;
- (void)_fetchLocallyAvailableApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)_invalidateXPCConnection;
- (void)_onQueue_beginMonitoringNanoRegistryDeviceState;
- (void)_onQueue_endMonitoringNanoRegistryDeviceState;
- (void)_onQueue_reEstablishObserverConnectionIfNeeded;
- (void)activeComplicationsForPairedDevice:(id)a3 completion:(id)a4;
- (void)activeComplicationsWithErrorCompletion:(id)a3;
- (void)addObserver:(id)a3;
- (void)applicationDatabaseResyncedForDeviceWithPairingID:(id)a3;
- (void)applicationIsInstalledOnAnyPairedDeviceWithBundleID:(id)a3 completion:(id)a4;
- (void)applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:(id)a3 completion:(id)a4;
- (void)applicationIsInstalledOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5;
- (void)applicationIsInstalledOnDeviceWithPairingID:(id)a3 withCompanionBundleID:(id)a4 completion:(id)a5;
- (void)applicationIsInstalledOnPairedDevice:(id)a3 withBundleID:(id)a4 completion:(id)a5;
- (void)applicationIsInstalledOnPairedDevice:(id)a3 withCompanionBundleID:(id)a4 completion:(id)a5;
- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applictionRemovabilityForPairedDevice:(id)a3 completion:(id)a4;
- (void)cancelPendingInstallations;
- (void)cancelUpdatePendingForCompanionApp:(id)a3 completion:(id)a4;
- (void)enumerateInstallableSystemAppsOnDeviceWithPairingID:(id)a3 withBlock:(id)a4;
- (void)enumerateInstallableSystemAppsOnPairedDevice:(id)a3 withBlock:(id)a4;
- (void)enumerateInstalledApplicationsOnDeviceWithPairingID:(id)a3 withBlock:(id)a4;
- (void)enumerateInstalledApplicationsOnPairedDevice:(id)a3 withBlock:(id)a4;
- (void)enumerateLocallyAvailableApplicationsForDeviceWithPairingID:(id)a3 options:(unint64_t)a4 withBlock:(id)a5;
- (void)enumerateLocallyAvailableApplicationsForPairedDevice:(id)a3 options:(unint64_t)a4 withBlock:(id)a5;
- (void)fetchApplicationOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5;
- (void)fetchApplicationOnPairedDevice:(id)a3 withBundleID:(id)a4 completion:(id)a5;
- (void)fetchApplicationWithContainingApplicationBundleID:(id)a3 completion:(id)a4;
- (void)fetchInfoForApplicationWithBundleID:(id)a3 completion:(id)a4;
- (void)fetchInfoForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5;
- (void)fetchInstallableSystemAppWithBundleID:(id)a3 onDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)fetchInstallableSystemAppWithBundleID:(id)a3 onPairedDevice:(id)a4 completion:(id)a5;
- (void)fetchInstalledApplicationsForPairedDevice:(id)a3 completion:(id)a4;
- (void)fetchInstalledApplicationsWithErrorCompletion:(id)a3;
- (void)fetchInstalledCompatibleApplicationsWithDevice:(id)a3 withErrorCompletion:(id)a4;
- (void)fetchInstalledComplicationsForPairedDevice:(id)a3 completion:(id)a4;
- (void)fetchInstalledComplicationsWithErrorCompletion:(id)a3;
- (void)fetchLocallyAvailableApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)fetchLocallyAvailableApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5;
- (void)fetchLocallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)fetchLocallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5;
- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 completion:(id)a4;
- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5;
- (void)fetchProvisioningProfilesForPairedDevice:(id)a3 completion:(id)a4;
- (void)fetchProvisioningProfilesWithCompletion:(id)a3;
- (void)fetchWatchAppBundleIDForCompanionAppBundleID:(id)a3 completion:(id)a4;
- (void)fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:(id)a3 completion:(id)a4;
- (void)getAlwaysInstallForPairedDevice:(id)a3 completion:(id)a4;
- (void)getAlwaysInstallWithCompletion:(id)a3;
- (void)getApplicationWithBundleID:(id)a3 willInstallAfterPairingOnDevice:(id)a4 completion:(id)a5;
- (void)installAllApplications;
- (void)installApplication:(id)a3 completionWithError:(id)a4;
- (void)installApplication:(id)a3 onPairedDevice:(id)a4 completion:(id)a5;
- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 completionWithError:(id)a5;
- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 onPairedDevice:(id)a5 completion:(id)a6;
- (void)installApplicationAtURL:(id)a3 onDeviceWithPairingID:(id)a4 installOptions:(id)a5 size:(int64_t)a6 completion:(id)a7;
- (void)installApplicationAtURL:(id)a3 onPairedDevice:(id)a4 installOptions:(id)a5 size:(int64_t)a6 completion:(id)a7;
- (void)installProvisioningProfileWithURL:(id)a3 completion:(id)a4;
- (void)installProvisioningProfileWithURL:(id)a3 onPairedDevice:(id)a4 completion:(id)a5;
- (void)observerRegistrationSuccessful;
- (void)removabilityDidChangeForApplications:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)removeApplication:(id)a3 completion:(id)a4;
- (void)removeApplication:(id)a3 fromPairedDevice:(id)a4 completion:(id)a5;
- (void)removeApplication:(id)a3 fromPairedDevice:(id)a4 completionWithError:(id)a5;
- (void)removeObserver:(id)a3;
- (void)removeProvisioningProfileWithID:(id)a3 completion:(id)a4;
- (void)removeProvisioningProfileWithID:(id)a3 fromPairedDevice:(id)a4 completion:(id)a5;
- (void)retryPendingAppInstallationsForPairedDevice:(id)a3;
- (void)setAllExistingAppsShouldBeInstalled:(BOOL)a3 forNewDevice:(id)a4;
- (void)setAlwaysInstall:(id)a3;
- (void)setAlwaysInstall:(id)a3 forDevice:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMonitoringForDeviceChanges:(BOOL)a3;
- (void)setObserverReEstablishTimer:(id)a3;
- (void)setObserversEnabled:(BOOL)a3;
- (void)setUpdatePendingForCompanionApp:(id)a3 completion:(id)a4;
- (void)setXpcConnection:(id)a3;
- (void)systemAppIsInstallableOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5;
- (void)systemAppIsInstallableOnPairedDevice:(id)a3 withBundleID:(id)a4 completion:(id)a5;
- (void)updateInstallProgressForApplication:(id)a3 progress:(double)a4 phase:(unint64_t)a5;
- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 completion:(id)a5;
- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 forPairedDevice:(id)a5 completion:(id)a6;
- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 writingToPreferencesLocation:(unint64_t)a5 forPairedDevice:(id)a6 options:(unint64_t)a7 completion:(id)a8;
- (void)updatedInstallStateForApplicationsWithInfo:(id)a3;
@end

@implementation ACXDeviceConnection

uint64_t __45__ACXDeviceConnection_sharedDeviceConnection__block_invoke()
{
  sharedDeviceConnection_sharedConnection = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

- (void)retryPendingAppInstallationsForPairedDevice:(id)a3
{
  id v4 = a3;
  id v6 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:&__block_literal_global_109];
  v5 = [v4 valueForProperty:*MEMORY[0x1E4F79E10]];

  [v6 retryPendingAppInstallationsOnDeviceWithPairingID:v5];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = [(ACXDeviceConnection *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ACXDeviceConnection_addObserver___block_invoke;
  v7[3] = &unk_1E6CC7230;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

+ (id)sharedDeviceConnection
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ACXDeviceConnection_sharedDeviceConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDeviceConnection_onceToken != -1) {
    dispatch_once(&sharedDeviceConnection_onceToken, block);
  }
  v2 = (void *)sharedDeviceConnection_sharedConnection;

  return v2;
}

- (id)_proxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v5 = [(ACXDeviceConnection *)self internalQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__ACXDeviceConnection__proxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1E6CC72D0;
  v9[4] = self;
  v11 = &v13;
  v12 = &v19;
  id v6 = (void (**)(void))v4;
  id v10 = v6;
  dispatch_sync(v5, v9);

  if (v14[5]) {
    v6[2](v6);
  }
  id v7 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

uint64_t __67__ACXDeviceConnection_retryPendingAppInstallationsForPairedDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return MEMORY[0x1F41817F8](v3, v2);
}

void __35__ACXDeviceConnection_addObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) observers];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    id v5 = *(void **)(a1 + 32);
    id v10 = 0;
    int v6 = objc_msgSend(v5, "_onQueue_createXPCConnectionIfNecessary:", &v10);
    id v7 = v10;
    if (v6)
    {
      id v8 = [*(id *)(a1 + 32) xpcConnection];
      v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_1];
      [v9 enableObservers];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
}

- (BOOL)_onQueue_createXPCConnectionIfNecessary:(id *)a3
{
  id v5 = [(ACXDeviceConnection *)self xpcConnection];

  if (v5) {
    return 1;
  }
  int v6 = SecTaskCreateFromSelf(0);
  if (v6)
  {
    id v7 = v6;
    id v8 = (void *)SecTaskCopyValueForEntitlement(v6, @"com.apple.companionappd.connect.allow", 0);
    if (v8)
    {
      v9 = v8;
      char v10 = ACXBooleanValue(v8, 0);
      CFRelease(v7);
      CFRelease(v9);
      if (v10) {
        goto LABEL_12;
      }
    }
    else
    {
      CFRelease(v7);
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    -[ACXDeviceConnection _onQueue_createXPCConnectionIfNecessary:]();
  }
LABEL_12:
  if ((gTestModeEnabled & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F79EF0] sharedInstance];
    v12 = [v11 getActivePairedDevice];

    if (!v12)
    {
      v28 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection _onQueue_createXPCConnectionIfNecessary:]", 130, @"ACXErrorDomain", 54, 0, 0, @"There is no active paired watch.", v13, v31);
      id v27 = v28;
      if (a3) {
        *a3 = v28;
      }
      v29 = [(ACXDeviceConnection *)self observers];
      uint64_t v30 = [v29 count];

      if (v30) {
        [(ACXDeviceConnection *)self _onQueue_beginMonitoringNanoRegistryDeviceState];
      }
      goto LABEL_24;
    }
    [(ACXDeviceConnection *)self _onQueue_endMonitoringNanoRegistryDeviceState];
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.appconduitd.device-connection" options:4096];
  [(ACXDeviceConnection *)self setXpcConnection:v14];

  uint64_t v15 = [(ACXDeviceConnection *)self xpcConnection];

  if (v15)
  {
    v17 = +[ACXDeviceConnectionProtocolInterface interface];
    id v18 = [(ACXDeviceConnection *)self xpcConnection];
    [v18 setRemoteObjectInterface:v17];

    uint64_t v19 = +[ACXDeviceConnectionDelegateProtocolInterface interface];
    v20 = [(ACXDeviceConnection *)self xpcConnection];
    [v20 setExportedInterface:v19];

    uint64_t v21 = [(ACXDeviceConnection *)self xpcConnection];
    [v21 setExportedObject:self];

    objc_initWeak(&location, self);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __63__ACXDeviceConnection__onQueue_createXPCConnectionIfNecessary___block_invoke;
    v34[3] = &unk_1E6CC7280;
    objc_copyWeak(&v35, &location);
    v22 = [(ACXDeviceConnection *)self xpcConnection];
    [v22 setInterruptionHandler:v34];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __63__ACXDeviceConnection__onQueue_createXPCConnectionIfNecessary___block_invoke_3;
    v32[3] = &unk_1E6CC7280;
    objc_copyWeak(&v33, &location);
    v23 = [(ACXDeviceConnection *)self xpcConnection];
    [v23 setInvalidationHandler:v32];

    id v24 = [(ACXDeviceConnection *)self xpcConnection];
    [v24 resume];

    [(ACXDeviceConnection *)self _onQueue_enableObserversIfNeededForAValidXPCConnection];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
    return 1;
  }
  v26 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection _onQueue_createXPCConnectionIfNecessary:]", 148, @"ACXErrorDomain", 1, 0, 0, @"Failed to create NSXPCConnection for service %@", v16, @"com.apple.appconduitd.device-connection");
  id v27 = v26;
  if (a3)
  {
    id v27 = v26;
    *a3 = v27;
  }
LABEL_24:

  return 0;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)_onQueue_beginMonitoringNanoRegistryDeviceState
{
  uint64_t v3 = [(ACXDeviceConnection *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  if (![(ACXDeviceConnection *)self monitoringForDeviceChanges])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__deviceDidBecomeActiveNotification_ name:*MEMORY[0x1E4F79E88] object:0];
    [v4 addObserver:self selector:sel__deviceDidPairNotification_ name:*MEMORY[0x1E4F79EA0] object:0];
    [(ACXDeviceConnection *)self setMonitoringForDeviceChanges:1];
  }
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (BOOL)monitoringForDeviceChanges
{
  return self->_monitoringForDeviceChanges;
}

void __46__ACXDeviceConnection__proxyWithErrorHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v12 = 0;
  char v3 = objc_msgSend(v2, "_onQueue_createXPCConnectionIfNecessary:", &v12);
  id v4 = v12;
  id v5 = v4;
  if (v3)
  {
    int v6 = [*(id *)(a1 + 32) xpcConnection];
    uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = v4;
    int v6 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }
}

- (void)setMonitoringForDeviceChanges:(BOOL)a3
{
  self->_monitoringForDeviceChanges = a3;
}

- (ACXDeviceConnection)init
{
  v12.receiver = self;
  v12.super_class = (Class)ACXDeviceConnection;
  id v2 = [(ACXDeviceConnection *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.appconduit.DeviceConnection.internal", v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.appconduit.DeviceConnection.observer", v8);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

+ (void)enableTestMode
{
  gTestModeEnabled = 1;
}

+ (void)disableTestMode
{
  gTestModeEnabled = 0;
}

- (void)_onQueue_endMonitoringNanoRegistryDeviceState
{
  uint64_t v3 = [(ACXDeviceConnection *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  if ([(ACXDeviceConnection *)self monitoringForDeviceChanges])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4F79E88] object:0];
    [v4 removeObserver:self name:*MEMORY[0x1E4F79EA0] object:0];
    [(ACXDeviceConnection *)self setMonitoringForDeviceChanges:0];
  }
}

- (void)_deviceDidBecomeActiveNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXDeviceConnection *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ACXDeviceConnection__deviceDidBecomeActiveNotification___block_invoke;
  v7[3] = &unk_1E6CC7230;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__ACXDeviceConnection__deviceDidBecomeActiveNotification___block_invoke(uint64_t a1)
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    id v2 = [*(id *)(a1 + 32) userInfo];
    id v5 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F79E78]];
    MOLogWrite();
  }
  uint64_t v3 = *(void **)(a1 + 40);

  return objc_msgSend(v3, "_onQueue_reEstablishObserverConnectionIfNeeded");
}

- (void)_deviceDidPairNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXDeviceConnection *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ACXDeviceConnection__deviceDidPairNotification___block_invoke;
  v7[3] = &unk_1E6CC7230;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__ACXDeviceConnection__deviceDidPairNotification___block_invoke(uint64_t a1)
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    id v2 = [*(id *)(a1 + 32) userInfo];
    id v5 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F79E78]];
    MOLogWrite();
  }
  uint64_t v3 = *(void **)(a1 + 40);

  return objc_msgSend(v3, "_onQueue_reEstablishObserverConnectionIfNeeded");
}

void __63__ACXDeviceConnection__onQueue_createXPCConnectionIfNecessary___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__ACXDeviceConnection__onQueue_createXPCConnectionIfNecessary___block_invoke_2;
    block[3] = &unk_1E6CC7258;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __63__ACXDeviceConnection__onQueue_createXPCConnectionIfNecessary___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setObserversEnabled:0];
  id v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_onQueue_reEstablishObserverConnectionIfNeeded");
}

void __63__ACXDeviceConnection__onQueue_createXPCConnectionIfNecessary___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _invalidateXPCConnection];
    id WeakRetained = v2;
  }
}

- (BOOL)_onQueue_enableObserversIfNeededForAValidXPCConnection
{
  uint64_t v3 = [(ACXDeviceConnection *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  id v4 = [(ACXDeviceConnection *)self observers];
  uint64_t v5 = [v4 count];

  if (![(ACXDeviceConnection *)self observersEnabled])
  {
    id v6 = [(ACXDeviceConnection *)self xpcConnection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__ACXDeviceConnection__onQueue_enableObserversIfNeededForAValidXPCConnection__block_invoke;
    v10[3] = &unk_1E6CC72A8;
    v10[4] = &v11;
    v10[5] = v5;
    uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];
    [v7 enableObservers];

    if (!v12[5]) {
      [(ACXDeviceConnection *)self setObserversEnabled:1];
    }
  }
  BOOL v8 = v12[5] == 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __77__ACXDeviceConnection__onQueue_enableObserversIfNeededForAValidXPCConnection__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
}

- (void)_onQueue_reEstablishObserverConnectionIfNeeded
{
  uint64_t v3 = [(ACXDeviceConnection *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v6 = 0;
  BOOL v4 = [(ACXDeviceConnection *)self _onQueue_createXPCConnectionIfNecessary:&v6];
  id v5 = v6;
  if (v4)
  {
    [(ACXDeviceConnection *)self _onQueue_enableObserversIfNeededForAValidXPCConnection];
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (void)_invalidateXPCConnection
{
  uint64_t v3 = [(ACXDeviceConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ACXDeviceConnection__invalidateXPCConnection__block_invoke;
  block[3] = &unk_1E6CC7258;
  block[4] = self;
  dispatch_async(v3, block);
}

void __47__ACXDeviceConnection__invalidateXPCConnection__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  [v2 invalidate];

  [*(id *)(a1 + 32) setXpcConnection:0];
  [*(id *)(a1 + 32) setObserversEnabled:0];
  id v10 = [*(id *)(a1 + 32) observers];
  if ([v10 count])
  {
    uint64_t v3 = [*(id *)(a1 + 32) observerReEstablishTimer];

    if (!v3)
    {
      BOOL v4 = [*(id *)(a1 + 32) internalQueue];
      dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
      [*(id *)(a1 + 32) setObserverReEstablishTimer:v5];

      id v6 = [*(id *)(a1 + 32) observerReEstablishTimer];
      dispatch_time_t v7 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

      BOOL v8 = [*(id *)(a1 + 32) observerReEstablishTimer];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __47__ACXDeviceConnection__invalidateXPCConnection__block_invoke_2;
      handler[3] = &unk_1E6CC7258;
      handler[4] = *(void *)(a1 + 32);
      dispatch_source_set_event_handler(v8, handler);

      dispatch_queue_t v9 = [*(id *)(a1 + 32) observerReEstablishTimer];
      dispatch_resume(v9);
    }
  }
  else
  {
  }
}

uint64_t __47__ACXDeviceConnection__invalidateXPCConnection__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_reEstablishObserverConnectionIfNeeded");
  id v2 = [*(id *)(a1 + 32) observerReEstablishTimer];
  dispatch_source_cancel(v2);

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setObserverReEstablishTimer:0];
}

- (id)_synchronousProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  dispatch_source_t v5 = [(ACXDeviceConnection *)self internalQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ACXDeviceConnection__synchronousProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1E6CC72D0;
  v9[4] = self;
  uint64_t v11 = &v13;
  objc_super v12 = &v19;
  id v6 = (void (**)(void))v4;
  id v10 = v6;
  dispatch_sync(v5, v9);

  if (v14[5]) {
    v6[2](v6);
  }
  id v7 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __57__ACXDeviceConnection__synchronousProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v12 = 0;
  char v3 = objc_msgSend(v2, "_onQueue_createXPCConnectionIfNecessary:", &v12);
  id v4 = v12;
  dispatch_source_t v5 = v4;
  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) xpcConnection];
    uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    dispatch_queue_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = v4;
    id v6 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }
}

- (void)updatedInstallStateForApplicationsWithInfo:(id)a3
{
  id v4 = a3;
  dispatch_source_t v5 = [(ACXDeviceConnection *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__ACXDeviceConnection_updatedInstallStateForApplicationsWithInfo___block_invoke;
  v7[3] = &unk_1E6CC7230;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __66__ACXDeviceConnection_updatedInstallStateForApplicationsWithInfo___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [*(id *)(a1 + 32) observers];
  uint64_t v2 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v28;
    dispatch_source_t v5 = MEMORY[0x1E4F14428];
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v6 = 0;
      uint64_t v17 = v3;
      do
      {
        if (*(void *)v28 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v19 = v6;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v8 = *(id *)(a1 + 40);
          uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v24;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v24 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
                v14 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v13, v16);
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __66__ACXDeviceConnection_updatedInstallStateForApplicationsWithInfo___block_invoke_2;
                block[3] = &unk_1E6CC72F8;
                block[4] = v7;
                id v21 = v14;
                uint64_t v22 = v13;
                id v15 = v14;
                dispatch_async(v5, block);
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v10);
          }

          uint64_t v4 = v16;
          uint64_t v3 = v17;
          uint64_t v6 = v19;
        }
        ++v6;
      }
      while (v6 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v3);
  }
}

uint64_t __66__ACXDeviceConnection_updatedInstallStateForApplicationsWithInfo___block_invoke_2(uint64_t a1)
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    uint64_t v2 = (objc_class *)objc_opt_class();
    uint64_t v3 = NSStringFromClass(v2);
    uint64_t v10 = *(void *)(a1 + 48);
    long long v9 = *(_OWORD *)(a1 + 32);
    id v8 = v3;
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(a1 + 48);
  dispatch_source_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "integerValue", v8, v9, v10);

  return [v5 updateInstallStateForApplication:v4 installState:v6];
}

- (void)updateInstallProgressForApplication:(id)a3 progress:(double)a4 phase:(unint64_t)a5
{
  id v8 = a3;
  long long v9 = [(ACXDeviceConnection *)self internalQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__ACXDeviceConnection_updateInstallProgressForApplication_progress_phase___block_invoke;
  v11[3] = &unk_1E6CC7320;
  id v12 = v8;
  unint64_t v13 = a5;
  double v14 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_sync(v9, v11);
}

void __74__ACXDeviceConnection_updateInstallProgressForApplication_progress_phase___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) observers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    uint64_t v6 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __74__ACXDeviceConnection_updateInstallProgressForApplication_progress_phase___block_invoke_2;
          v10[3] = &unk_1E6CC7320;
          long long v9 = *(void **)(a1 + 40);
          uint64_t v12 = *(void *)(a1 + 48);
          v10[4] = v8;
          uint64_t v13 = *(void *)(a1 + 56);
          id v11 = v9;
          dispatch_async(v6, v10);
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

uint64_t __74__ACXDeviceConnection_updateInstallProgressForApplication_progress_phase___block_invoke_2(double *a1)
{
  if (*((void *)a1 + 6) >= 3uLL) {
    uint64_t v2 = -1;
  }
  else {
    uint64_t v2 = *((void *)a1 + 6);
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    MOLogWrite();
  }
  uint64_t v5 = (void *)*((void *)a1 + 4);
  uint64_t v6 = *((void *)a1 + 5);
  double v7 = a1[7];

  return [v5 updateInstallProgressForApplication:v6 progress:v2 installPhase:v7];
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ACXDeviceConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ACXDeviceConnection_applicationsInstalled_onDeviceWithPairingID___block_invoke;
  block[3] = &unk_1E6CC72F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __67__ACXDeviceConnection_applicationsInstalled_onDeviceWithPairingID___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [a1[4] observers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [a1[4] observerQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __67__ACXDeviceConnection_applicationsInstalled_onDeviceWithPairingID___block_invoke_2;
          block[3] = &unk_1E6CC72F8;
          block[4] = v7;
          id v10 = a1[5];
          id v11 = a1[6];
          dispatch_async(v8, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

uint64_t __67__ACXDeviceConnection_applicationsInstalled_onDeviceWithPairingID___block_invoke_2(uint64_t a1)
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    uint64_t v2 = (objc_class *)objc_opt_class();
    uint64_t v3 = NSStringFromClass(v2);
    [*(id *)(a1 + 40) count];
    MOLogWrite();
  }
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v4 applicationsInstalled:v5 onDeviceWithPairingID:v6];
}

- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ACXDeviceConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ACXDeviceConnection_applicationsUpdated_onDeviceWithPairingID___block_invoke;
  block[3] = &unk_1E6CC72F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __65__ACXDeviceConnection_applicationsUpdated_onDeviceWithPairingID___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [a1[4] observers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [a1[4] observerQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __65__ACXDeviceConnection_applicationsUpdated_onDeviceWithPairingID___block_invoke_2;
          block[3] = &unk_1E6CC72F8;
          block[4] = v7;
          id v10 = a1[5];
          id v11 = a1[6];
          dispatch_async(v8, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

uint64_t __65__ACXDeviceConnection_applicationsUpdated_onDeviceWithPairingID___block_invoke_2(uint64_t a1)
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    uint64_t v2 = (objc_class *)objc_opt_class();
    uint64_t v3 = NSStringFromClass(v2);
    [*(id *)(a1 + 40) count];
    MOLogWrite();
  }
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v4 applicationsUpdated:v5 onDeviceWithPairingID:v6];
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ACXDeviceConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ACXDeviceConnection_applicationsUninstalled_onDeviceWithPairingID___block_invoke;
  block[3] = &unk_1E6CC72F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __69__ACXDeviceConnection_applicationsUninstalled_onDeviceWithPairingID___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [a1[4] observers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [a1[4] observerQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __69__ACXDeviceConnection_applicationsUninstalled_onDeviceWithPairingID___block_invoke_2;
          block[3] = &unk_1E6CC72F8;
          block[4] = v7;
          id v10 = a1[5];
          id v11 = a1[6];
          dispatch_async(v8, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

uint64_t __69__ACXDeviceConnection_applicationsUninstalled_onDeviceWithPairingID___block_invoke_2(uint64_t a1)
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    uint64_t v2 = (objc_class *)objc_opt_class();
    uint64_t v3 = NSStringFromClass(v2);
    [*(id *)(a1 + 40) count];
    MOLogWrite();
  }
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v4 applicationsUninstalled:v5 onDeviceWithPairingID:v6];
}

- (void)applicationDatabaseResyncedForDeviceWithPairingID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACXDeviceConnection *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__ACXDeviceConnection_applicationDatabaseResyncedForDeviceWithPairingID___block_invoke;
  v7[3] = &unk_1E6CC7230;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __73__ACXDeviceConnection_applicationDatabaseResyncedForDeviceWithPairingID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) observers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [*(id *)(a1 + 32) observerQueue];
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __73__ACXDeviceConnection_applicationDatabaseResyncedForDeviceWithPairingID___block_invoke_2;
          v9[3] = &unk_1E6CC7230;
          v9[4] = v7;
          id v10 = *(id *)(a1 + 40);
          dispatch_async(v8, v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

uint64_t __73__ACXDeviceConnection_applicationDatabaseResyncedForDeviceWithPairingID___block_invoke_2(uint64_t a1)
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    uint64_t v2 = (objc_class *)objc_opt_class();
    uint64_t v3 = NSStringFromClass(v2);
    MOLogWrite();
  }
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 applicationDatabaseResyncedForDeviceWithPairingID:v5];
}

- (void)removabilityDidChangeForApplications:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXDeviceConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__ACXDeviceConnection_removabilityDidChangeForApplications_onDeviceWithPairingID___block_invoke;
  block[3] = &unk_1E6CC72F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __82__ACXDeviceConnection_removabilityDidChangeForApplications_onDeviceWithPairingID___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [a1[4] observers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [a1[4] observerQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __82__ACXDeviceConnection_removabilityDidChangeForApplications_onDeviceWithPairingID___block_invoke_2;
          block[3] = &unk_1E6CC72F8;
          block[4] = v7;
          id v10 = a1[5];
          id v11 = a1[6];
          dispatch_async(v8, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

uint64_t __82__ACXDeviceConnection_removabilityDidChangeForApplications_onDeviceWithPairingID___block_invoke_2(uint64_t a1)
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    uint64_t v2 = (objc_class *)objc_opt_class();
    uint64_t v3 = NSStringFromClass(v2);
    [*(id *)(a1 + 40) count];
    MOLogWrite();
  }
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v4 removabilityDidChangeForApplications:v5 onDeviceWithPairingID:v6];
}

- (void)observerRegistrationSuccessful
{
  uint64_t v3 = [(ACXDeviceConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ACXDeviceConnection_observerRegistrationSuccessful__block_invoke;
  block[3] = &unk_1E6CC7258;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __53__ACXDeviceConnection_observerRegistrationSuccessful__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) observers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [*(id *)(a1 + 32) observerQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __53__ACXDeviceConnection_observerRegistrationSuccessful__block_invoke_2;
          block[3] = &unk_1E6CC7258;
          block[4] = v7;
          dispatch_async(v8, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

uint64_t __53__ACXDeviceConnection_observerRegistrationSuccessful__block_invoke_2(uint64_t a1)
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    uint64_t v2 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v2);
    MOLogWrite();
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 observerRegistered];
}

+ (void)performUninstallationCleanup
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v3 = ACXCopyLogDirectory();
  [a1 _removeFilesAtURL:v3];

  uint64_t v4 = ACXCopyDataDirectory();
  [a1 _removeFilesAtURL:v4];

  ACXCopyStagingDirectoryPath();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _removeFilesAtURL:v5];
}

+ (void)_removeFilesAtURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = 0;
  char v5 = [v4 removeItemAtURL:v3 error:&v8];
  id v6 = v8;

  if (v5)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
LABEL_7:
      uint64_t v7 = [v3 path];
      MOLogWrite();
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    goto LABEL_7;
  }
}

uint64_t __35__ACXDeviceConnection_addObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return MEMORY[0x1F41817F8](v3, v2);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXDeviceConnection *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ACXDeviceConnection_removeObserver___block_invoke;
  v7[3] = &unk_1E6CC7230;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __38__ACXDeviceConnection_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) observers];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v5 = [*(id *)(a1 + 32) observerReEstablishTimer];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) observerReEstablishTimer];
      dispatch_source_cancel(v6);

      [*(id *)(a1 + 32) setObserverReEstablishTimer:0];
    }
    id v8 = [*(id *)(a1 + 32) xpcConnection];
    uint64_t v7 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_95];
    [v7 disableObservers];
  }
}

uint64_t __38__ACXDeviceConnection_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return MEMORY[0x1F41817F8](v3, v2);
}

- (void)fetchInstalledApplicationsWithErrorCompletion:(id)a3
{
}

- (void)fetchInstalledApplicationsForPairedDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__ACXDeviceConnection_fetchInstalledApplicationsForPairedDevice_completion___block_invoke;
  v11[3] = &unk_1E6CC7388;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v11];
  long long v10 = [v8 valueForProperty:*MEMORY[0x1E4F79E10]];

  [v9 fetchInstalledApplicationsForDeviceWithPairingID:v10 completion:v7];
}

uint64_t __76__ACXDeviceConnection_fetchInstalledApplicationsForPairedDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchInstalledComplicationsWithErrorCompletion:(id)a3
{
}

- (void)fetchInstalledComplicationsForPairedDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__ACXDeviceConnection_fetchInstalledComplicationsForPairedDevice_completion___block_invoke;
  v11[3] = &unk_1E6CC7388;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v11];
  long long v10 = [v8 valueForProperty:*MEMORY[0x1E4F79E10]];

  [v9 fetchInstalledComplicationsForDeviceWithPairingID:v10 completion:v7];
}

uint64_t __77__ACXDeviceConnection_fetchInstalledComplicationsForPairedDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activeComplicationsWithErrorCompletion:(id)a3
{
}

- (void)activeComplicationsForPairedDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__ACXDeviceConnection_activeComplicationsForPairedDevice_completion___block_invoke;
  v11[3] = &unk_1E6CC7388;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v11];
  long long v10 = [v8 valueForProperty:*MEMORY[0x1E4F79E10]];

  [v9 activeComplicationsForDeviceWithPairingID:v10 completion:v7];
}

uint64_t __69__ACXDeviceConnection_activeComplicationsForPairedDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchInstalledCompatibleApplicationsWithDevice:(id)a3 withErrorCompletion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__ACXDeviceConnection_fetchInstalledCompatibleApplicationsWithDevice_withErrorCompletion___block_invoke;
  v11[3] = &unk_1E6CC7388;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v11];
  long long v10 = [v8 valueForProperty:*MEMORY[0x1E4F79E10]];

  [v9 fetchInstalledCompatibleApplicationsForDeviceWithPairingID:v10 completion:v7];
}

uint64_t __90__ACXDeviceConnection_fetchInstalledCompatibleApplicationsWithDevice_withErrorCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchApplicationWithContainingApplicationBundleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__ACXDeviceConnection_fetchApplicationWithContainingApplicationBundleID_completion___block_invoke;
  v10[3] = &unk_1E6CC7388;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v10];
  [v9 fetchApplicationWithContainingApplicationBundleID:v8 completion:v7];
}

uint64_t __84__ACXDeviceConnection_fetchApplicationWithContainingApplicationBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchInfoForApplicationWithBundleID:(id)a3 completion:(id)a4
{
}

- (void)fetchInfoForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__ACXDeviceConnection_fetchInfoForApplicationWithBundleID_forPairedDevice_completion___block_invoke;
  v14[3] = &unk_1E6CC7388;
  id v15 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v14];
  long long v13 = [v10 valueForProperty:*MEMORY[0x1E4F79E10]];

  [v12 fetchInfoForApplicationWithBundleID:v11 forDeviceWithPairingID:v13 completion:v9];
}

uint64_t __86__ACXDeviceConnection_fetchInfoForApplicationWithBundleID_forPairedDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__ACXDeviceConnection_fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier_completion___block_invoke;
  v10[3] = &unk_1E6CC7388;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v10];
  [v9 fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:v8 completion:v7];
}

uint64_t __97__ACXDeviceConnection_fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)watchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  long long v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__ACXDeviceConnection_watchAppBundleURLWithinCompanionAppWithWatchAppIdentifier_error___block_invoke;
  v12[3] = &unk_1E6CC73B0;
  v12[4] = &v13;
  id v7 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__ACXDeviceConnection_watchAppBundleURLWithinCompanionAppWithWatchAppIdentifier_error___block_invoke_2;
  v11[3] = &unk_1E6CC73D8;
  void v11[4] = &v13;
  void v11[5] = &v19;
  [v7 fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:v6 completion:v11];

  id v8 = (void *)v20[5];
  if (a4 && !v8)
  {
    *a4 = (id) v14[5];
    id v8 = (void *)v20[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __87__ACXDeviceConnection_watchAppBundleURLWithinCompanionAppWithWatchAppIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __87__ACXDeviceConnection_watchAppBundleURLWithinCompanionAppWithWatchAppIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *id v7 = v9;
}

- (void)fetchWatchAppBundleIDForCompanionAppBundleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__ACXDeviceConnection_fetchWatchAppBundleIDForCompanionAppBundleID_completion___block_invoke;
  v10[3] = &unk_1E6CC7388;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v10];
  [v9 fetchWatchAppBundleIDForCompanionAppBundleID:v8 completion:v7];
}

uint64_t __79__ACXDeviceConnection_fetchWatchAppBundleIDForCompanionAppBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)watchAppBundleIDForCompanionAppBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  long long v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__ACXDeviceConnection_watchAppBundleIDForCompanionAppBundleID_error___block_invoke;
  v12[3] = &unk_1E6CC73B0;
  v12[4] = &v13;
  id v7 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__ACXDeviceConnection_watchAppBundleIDForCompanionAppBundleID_error___block_invoke_2;
  v11[3] = &unk_1E6CC7400;
  void v11[4] = &v13;
  void v11[5] = &v19;
  [v7 fetchWatchAppBundleIDForCompanionAppBundleID:v6 completion:v11];

  id v8 = (void *)v20[5];
  if (a4 && !v8)
  {
    *a4 = (id) v14[5];
    id v8 = (void *)v20[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __69__ACXDeviceConnection_watchAppBundleIDForCompanionAppBundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __69__ACXDeviceConnection_watchAppBundleIDForCompanionAppBundleID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *id v7 = v9;
}

- (void)installAllApplications
{
  id v2 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:&__block_literal_global_105];
  [v2 installAllApplications];
}

uint64_t __45__ACXDeviceConnection_installAllApplications__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return MEMORY[0x1F41817F8](v3, v2);
}

- (void)cancelPendingInstallations
{
  id v2 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:&__block_literal_global_107];
  [v2 cancelPendingInstallations];
}

uint64_t __49__ACXDeviceConnection_cancelPendingInstallations__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return MEMORY[0x1F41817F8](v3, v2);
}

- (void)installApplication:(id)a3 completionWithError:(id)a4
{
}

- (void)installApplication:(id)a3 onPairedDevice:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__ACXDeviceConnection_installApplication_onPairedDevice_completion___block_invoke;
  v14[3] = &unk_1E6CC7388;
  id v15 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v14];
  uint64_t v13 = [v10 valueForProperty:*MEMORY[0x1E4F79E10]];

  [v12 installApplication:v11 withProvisioningProfileInfo:0 forTestFlight:0 onDeviceWithPairingID:v13 completion:v9];
}

void __68__ACXDeviceConnection_installApplication_onPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)installApplication:(id)a3 onPairedDevice:(id)a4 installationStatus:(int64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy_;
  id v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __82__ACXDeviceConnection_installApplication_onPairedDevice_installationStatus_error___block_invoke;
  v19[3] = &unk_1E6CC73B0;
  v19[4] = &v20;
  id v12 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v19];
  uint64_t v13 = [v11 valueForProperty:*MEMORY[0x1E4F79E10]];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__ACXDeviceConnection_installApplication_onPairedDevice_installationStatus_error___block_invoke_2;
  v18[3] = &unk_1E6CC7428;
  v18[4] = &v20;
  v18[5] = &v26;
  [v12 installApplication:v10 withProvisioningProfileInfo:0 forTestFlight:0 onDeviceWithPairingID:v13 completion:v18];

  long long v14 = v21;
  id v15 = (void *)v21[5];
  if (v15)
  {
    if (a6)
    {
      *a6 = v15;
      long long v14 = v21;
    }
  }
  else if (a5)
  {
    *a5 = v27[3];
  }
  BOOL v16 = v14[5] == 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __82__ACXDeviceConnection_installApplication_onPairedDevice_installationStatus_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __82__ACXDeviceConnection_installApplication_onPairedDevice_installationStatus_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 completionWithError:(id)a5
{
}

- (id)_validateAndExtractProfiles:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v17 = (id)objc_opt_new();
    id v10 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((ACXArrayContainsOnlyClass(v5) & 1) == 0)
  {
    _CreateAndLogError((uint64_t)"-[ACXDeviceConnection _validateAndExtractProfiles:error:]", 693, @"ACXErrorDomain", 20, 0, 0, @"Profiles array did not contain only NSURL objects", v6, v22);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = 0;
LABEL_14:
    id v7 = 0;
    if (!a4) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  id v7 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v23 = v5;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v27;
    while (2)
    {
      uint64_t v12 = 0;
      uint64_t v13 = v10;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
        id v15 = [v14 lastPathComponent];
        id v25 = v13;
        BOOL v16 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v14 options:3 error:&v25];
        id v10 = v25;

        if (!v16)
        {
          id v18 = [v14 path];
          uint64_t v20 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection _validateAndExtractProfiles:error:]", 702, @"ACXErrorDomain", 21, v10, 0, @"Failed to read profile at %@ : %@", v19, (uint64_t)v18);

          id v17 = 0;
          id v10 = (id)v20;
          goto LABEL_19;
        }
        [v7 setObject:v16 forKeyedSubscript:v15];

        ++v12;
        uint64_t v13 = v10;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v10 = 0;
  }

  id v17 = v7;
  id v7 = v17;
LABEL_19:
  id v5 = v23;
  if (a4)
  {
LABEL_20:
    if (!v17) {
      *a4 = v10;
    }
  }
LABEL_22:

  return v17;
}

- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 onPairedDevice:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v23 = 0;
  uint64_t v13 = [(ACXDeviceConnection *)self _validateAndExtractProfiles:a4 error:&v23];
  id v14 = v23;
  if (v13)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __93__ACXDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completion___block_invoke;
    uint64_t v21 = &unk_1E6CC7388;
    id v15 = v12;
    id v22 = v15;
    BOOL v16 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:&v18];
    id v17 = objc_msgSend(v11, "valueForProperty:", *MEMORY[0x1E4F79E10], v18, v19, v20, v21);
    [v16 installApplication:v10 withProvisioningProfileInfo:v13 forTestFlight:1 onDeviceWithPairingID:v17 completion:v15];
  }
  else
  {
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v14);
  }
}

void __93__ACXDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)installApplication:(id)a3 withProvisioningProfiles:(id)a4 onPairedDevice:(id)a5 installationStatus:(int64_t *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy_;
  long long v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  id obj = 0;
  id v15 = [(ACXDeviceConnection *)self _validateAndExtractProfiles:v13 error:&obj];
  objc_storeStrong(&v30, obj);
  if (v15)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __107__ACXDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_installationStatus_error___block_invoke;
    v23[3] = &unk_1E6CC73B0;
    v23[4] = &v25;
    BOOL v16 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v23];
    id v17 = [v14 valueForProperty:*MEMORY[0x1E4F79E10]];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __107__ACXDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_installationStatus_error___block_invoke_2;
    v22[3] = &unk_1E6CC7428;
    v22[4] = &v25;
    v22[5] = &v31;
    [v16 installApplication:v12 withProvisioningProfileInfo:v15 forTestFlight:1 onDeviceWithPairingID:v17 completion:v22];
  }
  uint64_t v18 = v26;
  uint64_t v19 = (void *)v26[5];
  if (v19)
  {
    if (a7)
    {
      *a7 = v19;
      uint64_t v18 = v26;
    }
  }
  else if (a6)
  {
    *a6 = v32[3];
  }
  BOOL v20 = v18[5] == 0;
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v20;
}

void __107__ACXDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_installationStatus_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __107__ACXDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_installationStatus_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  uint64_t v8 = (id *)(v7 + 40);
  if (v9)
  {
    id v11 = v6;
    objc_storeStrong(v8, a3);
    id v6 = v11;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }

  return MEMORY[0x1F41817F8](v8, v6);
}

- (void)installApplicationAtURL:(id)a3 onPairedDevice:(id)a4 installOptions:(id)a5 size:(int64_t)a6 completion:(id)a7
{
  uint64_t v12 = *MEMORY[0x1E4F79E10];
  id v13 = a7;
  id v14 = a5;
  id v15 = a3;
  id v16 = [a4 valueForProperty:v12];
  [(ACXDeviceConnection *)self installApplicationAtURL:v15 onDeviceWithPairingID:v16 installOptions:v14 size:a6 completion:v13];
}

- (void)installApplicationAtURL:(id)a3 onDeviceWithPairingID:(id)a4 installOptions:(id)a5 size:(int64_t)a6 completion:(id)a7
{
  id v12 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __100__ACXDeviceConnection_installApplicationAtURL_onDeviceWithPairingID_installOptions_size_completion___block_invoke;
  v18[3] = &unk_1E6CC7388;
  id v19 = v12;
  id v13 = v12;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v18];
  [v17 installApplicationAtURL:v16 onDeviceWithPairingID:v15 installOptions:v14 size:a6 completion:v13];
}

void __100__ACXDeviceConnection_installApplicationAtURL_onDeviceWithPairingID_installOptions_size_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)installApplicationAtURL:(id)a3 onPairedDevice:(id)a4 installOptions:(id)a5 size:(int64_t)a6 installationStatus:(int64_t *)a7 error:(id *)a8
{
  uint64_t v14 = *MEMORY[0x1E4F79E10];
  id v15 = a5;
  id v16 = a3;
  id v17 = [a4 valueForProperty:v14];
  LOBYTE(a8) = [(ACXDeviceConnection *)self installApplicationAtURL:v16 onDeviceWithPairingID:v17 installOptions:v15 size:a6 installationStatus:a7 error:a8];

  return (char)a8;
}

- (BOOL)installApplicationAtURL:(id)a3 onDeviceWithPairingID:(id)a4 installOptions:(id)a5 size:(int64_t)a6 installationStatus:(int64_t *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy_;
  long long v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __114__ACXDeviceConnection_installApplicationAtURL_onDeviceWithPairingID_installOptions_size_installationStatus_error___block_invoke;
  v23[3] = &unk_1E6CC73B0;
  v23[4] = &v24;
  id v17 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v23];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __114__ACXDeviceConnection_installApplicationAtURL_onDeviceWithPairingID_installOptions_size_installationStatus_error___block_invoke_2;
  v22[3] = &unk_1E6CC7428;
  v22[4] = &v24;
  v22[5] = &v30;
  [v17 installApplicationAtURL:v14 onDeviceWithPairingID:v15 installOptions:v16 size:a6 completion:v22];

  uint64_t v18 = v25;
  id v19 = (void *)v25[5];
  if (v19)
  {
    if (a8)
    {
      *a8 = v19;
      uint64_t v18 = v25;
    }
  }
  else if (a7)
  {
    *a7 = v31[3];
  }
  BOOL v20 = v18[5] == 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v20;
}

void __114__ACXDeviceConnection_installApplicationAtURL_onDeviceWithPairingID_installOptions_size_installationStatus_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __114__ACXDeviceConnection_installApplicationAtURL_onDeviceWithPairingID_installOptions_size_installationStatus_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)removeApplication:(id)a3 completion:(id)a4
{
}

- (void)removeApplication:(id)a3 fromPairedDevice:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__ACXDeviceConnection_removeApplication_fromPairedDevice_completion___block_invoke;
  v10[3] = &unk_1E6CC7450;
  id v11 = v8;
  id v9 = v8;
  [(ACXDeviceConnection *)self removeApplication:a3 fromPairedDevice:a4 completionWithError:v10];
}

uint64_t __69__ACXDeviceConnection_removeApplication_fromPairedDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeApplication:(id)a3 fromPairedDevice:(id)a4 completionWithError:(id)a5
{
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__ACXDeviceConnection_removeApplication_fromPairedDevice_completionWithError___block_invoke;
  v14[3] = &unk_1E6CC7388;
  id v15 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v14];
  id v13 = [v10 valueForProperty:*MEMORY[0x1E4F79E10]];

  [v12 removeApplication:v11 fromDeviceWithPairingID:v13 completion:v9];
}

void __78__ACXDeviceConnection_removeApplication_fromPairedDevice_completionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)removeApplication:(id)a3 fromPairedDevice:(id)a4 removalStatus:(int64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__ACXDeviceConnection_removeApplication_fromPairedDevice_removalStatus_error___block_invoke;
  v19[3] = &unk_1E6CC73B0;
  v19[4] = &v20;
  id v12 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v19];
  id v13 = [v11 valueForProperty:*MEMORY[0x1E4F79E10]];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__ACXDeviceConnection_removeApplication_fromPairedDevice_removalStatus_error___block_invoke_2;
  v18[3] = &unk_1E6CC7428;
  void v18[4] = &v20;
  v18[5] = &v26;
  [v12 removeApplication:v10 fromDeviceWithPairingID:v13 completion:v18];

  id v14 = v21;
  id v15 = (void *)v21[5];
  if (v15)
  {
    if (a6)
    {
      *a6 = v15;
      id v14 = v21;
    }
  }
  else if (a5)
  {
    *a5 = v27[3];
  }
  BOOL v16 = v14[5] == 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __78__ACXDeviceConnection_removeApplication_fromPairedDevice_removalStatus_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __78__ACXDeviceConnection_removeApplication_fromPairedDevice_removalStatus_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)setAlwaysInstall:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [MEMORY[0x1E4F79EF0] sharedInstance];
  id v5 = [v4 getActivePairedDevice];

  if (v5)
  {
    [(ACXDeviceConnection *)self setAlwaysInstall:v6 forDevice:v5];
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (void)setAlwaysInstall:(id)a3 forDevice:(id)a4
{
  id v16 = a3;
  id v5 = (objc_class *)MEMORY[0x1E4F79CD8];
  id v6 = a4;
  id v7 = (void *)[[v5 alloc] initWithDomain:@"com.apple.appconduitd.gizmostate" pairedDevice:v6];
  id v8 = [v6 valueForProperty:*MEMORY[0x1E4F79E10]];

  if (v7)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      id v9 = [v8 UUIDString];
      int v10 = [v16 BOOLValue];
      id v11 = @"NO";
      if (v10) {
        id v11 = @"YES";
      }
      id v13 = v9;
      id v14 = v11;
      MOLogWrite();
    }
    objc_msgSend(v7, "setObject:forKey:", v16, @"AlwaysInstall", v13, v14);
    id v12 = (id)[v7 synchronize];
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v15 = [v8 UUIDString];
    MOLogWrite();
  }
}

- (void)getAlwaysInstallWithCompletion:(id)a3
{
}

- (void)setAllExistingAppsShouldBeInstalled:(BOOL)a3 forNewDevice:(id)a4
{
  BOOL v4 = a3;
  id v5 = (objc_class *)MEMORY[0x1E4F79CD8];
  id v6 = a4;
  id v12 = (id)[[v5 alloc] initWithDomain:@"com.apple.appconduitd.gizmostate" pairedDevice:v6];
  id v7 = [v6 valueForProperty:*MEMORY[0x1E4F79E10]];

  if (v12)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      id v9 = [v7 UUIDString];
      uint64_t v10 = (int)ACXYOrN(v4);
      MOLogWrite();
    }
    objc_msgSend(v12, "setBool:forKey:", v4, @"InitiallyInstallAllExistingApps", v9, v10);
    id v8 = (id)[v12 synchronize];
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    ACXYOrN(v4);
    id v11 = [v7 UUIDString];
    MOLogWrite();
  }
}

- (void)getAlwaysInstallForPairedDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__ACXDeviceConnection_getAlwaysInstallForPairedDevice_completion___block_invoke;
  v11[3] = &unk_1E6CC7388;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v11];
  uint64_t v10 = [v8 valueForProperty:*MEMORY[0x1E4F79E10]];

  [v9 getAlwaysInstallForDeviceWithPairingID:v10 completion:v7];
}

void __66__ACXDeviceConnection_getAlwaysInstallForPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)getAlwaysInstall:(BOOL *)a3 forPairedDevice:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__ACXDeviceConnection_getAlwaysInstall_forPairedDevice_error___block_invoke;
  v16[3] = &unk_1E6CC73B0;
  v16[4] = &v17;
  id v9 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v16];
  uint64_t v10 = [v8 valueForProperty:*MEMORY[0x1E4F79E10]];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__ACXDeviceConnection_getAlwaysInstall_forPairedDevice_error___block_invoke_2;
  v15[3] = &unk_1E6CC7478;
  v15[4] = &v23;
  [v9 getAlwaysInstallForDeviceWithPairingID:v10 completion:v15];

  id v11 = v18;
  id v12 = (void *)v18[5];
  if (v12)
  {
    if (a5)
    {
      *a5 = v12;
      id v11 = v18;
    }
  }
  else if (a3)
  {
    *a3 = *((unsigned char *)v24 + 24);
  }
  BOOL v13 = v11[5] == 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __62__ACXDeviceConnection_getAlwaysInstall_forPairedDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __62__ACXDeviceConnection_getAlwaysInstall_forPairedDevice_error___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)installProvisioningProfileWithURL:(id)a3 completion:(id)a4
{
}

- (void)installProvisioningProfileWithURL:(id)a3 onPairedDevice:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v10 = a5;
  if (a3)
  {
    id v22 = 0;
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:3 error:&v22];
    id v12 = v22;
    if (v11)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __83__ACXDeviceConnection_installProvisioningProfileWithURL_onPairedDevice_completion___block_invoke;
      uint64_t v20 = &unk_1E6CC7388;
      id v13 = v10;
      id v21 = v13;
      id v14 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:&v17];
      id v15 = objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E4F79E10], v17, v18, v19, v20);
      [v14 installProvisioningProfileWithData:v11 onDeviceWithPairingID:v15 completion:v13];
    }
    else
    {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v12);
    }
  }
  else
  {
    id v16 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection installProvisioningProfileWithURL:onPairedDevice:completion:]", 942, @"ACXErrorDomain", 20, 0, 0, @"profileURL parameter was nil", v9, v17);
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
  }
}

void __83__ACXDeviceConnection_installProvisioningProfileWithURL_onPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)installProvisioningProfileWithURL:(id)a3 onPairedDevice:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v10 = a4;
  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy_;
  uint64_t v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if (!v8)
  {
    uint64_t v14 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection installProvisioningProfileWithURL:onPairedDevice:error:]", 965, @"ACXErrorDomain", 20, 0, 0, @"profileURL parameter was nil", v9, v18[0]);
    id v11 = (void *)v26[5];
    v26[5] = v14;
    goto LABEL_5;
  }
  id obj = 0;
  id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8 options:3 error:&obj];
  objc_storeStrong(&v30, obj);
  if (v11)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__ACXDeviceConnection_installProvisioningProfileWithURL_onPairedDevice_error___block_invoke;
    v19[3] = &unk_1E6CC73B0;
    v19[4] = &v25;
    id v12 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v19];
    id v13 = [v10 valueForProperty:*MEMORY[0x1E4F79E10]];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = (uint64_t)__78__ACXDeviceConnection_installProvisioningProfileWithURL_onPairedDevice_error___block_invoke_2;
    v18[3] = (uint64_t)&unk_1E6CC74A0;
    void v18[4] = (uint64_t)&v25;
    v18[5] = (uint64_t)&v21;
    [v12 installProvisioningProfileWithData:v11 onDeviceWithPairingID:v13 completion:v18];

LABEL_5:
  }
  int v15 = *((unsigned __int8 *)v22 + 24);
  if (a5 && !*((unsigned char *)v22 + 24))
  {
    *a5 = (id) v26[5];
    int v15 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v16 = v15 != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v16;
}

void __78__ACXDeviceConnection_installProvisioningProfileWithURL_onPairedDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __78__ACXDeviceConnection_installProvisioningProfileWithURL_onPairedDevice_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)removeProvisioningProfileWithID:(id)a3 completion:(id)a4
{
}

- (void)removeProvisioningProfileWithID:(id)a3 fromPairedDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = (void (**)(void, void, void))v10;
  if (v8)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __83__ACXDeviceConnection_removeProvisioningProfileWithID_fromPairedDevice_completion___block_invoke;
    v18[3] = &unk_1E6CC7388;
    id v13 = v10;
    id v19 = v13;
    uint64_t v14 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v18];
    int v15 = [v9 valueForProperty:*MEMORY[0x1E4F79E10]];
    [v14 removeProvisioningProfileWithID:v8 fromDeviceWithPairingID:v15 completion:v13];
  }
  else
  {
    BOOL v16 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection removeProvisioningProfileWithID:fromPairedDevice:completion:]", 1001, @"ACXErrorDomain", 20, 0, 0, @"profileID parameter was nil", v11, v17);
    ((void (**)(void, void, void *))v12)[2](v12, 0, v16);
  }
}

void __83__ACXDeviceConnection_removeProvisioningProfileWithID_fromPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)removeProvisioningProfileWithID:(id)a3 fromPairedDevice:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v10 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (v8)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__ACXDeviceConnection_removeProvisioningProfileWithID_fromPairedDevice_error___block_invoke;
    v19[3] = &unk_1E6CC73B0;
    v19[4] = &v24;
    uint64_t v11 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v19];
    id v12 = [v10 valueForProperty:*MEMORY[0x1E4F79E10]];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__ACXDeviceConnection_removeProvisioningProfileWithID_fromPairedDevice_error___block_invoke_2;
    v18[3] = &unk_1E6CC74A0;
    void v18[4] = &v24;
    v18[5] = &v20;
    [v11 removeProvisioningProfileWithID:v8 fromDeviceWithPairingID:v12 completion:v18];
  }
  else
  {
    uint64_t v13 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection removeProvisioningProfileWithID:fromPairedDevice:error:]", 1017, @"ACXErrorDomain", 20, 0, 0, @"profileID parameter was nil", v9, v17);
    uint64_t v11 = (void *)v25[5];
    v25[5] = v13;
  }

  int v14 = *((unsigned __int8 *)v21 + 24);
  if (a5 && !*((unsigned char *)v21 + 24))
  {
    *a5 = (id) v25[5];
    int v14 = *((unsigned __int8 *)v21 + 24);
  }
  BOOL v15 = v14 != 0;
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __78__ACXDeviceConnection_removeProvisioningProfileWithID_fromPairedDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __78__ACXDeviceConnection_removeProvisioningProfileWithID_fromPairedDevice_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)fetchProvisioningProfilesWithCompletion:(id)a3
{
}

- (void)fetchProvisioningProfilesForPairedDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__ACXDeviceConnection_fetchProvisioningProfilesForPairedDevice_completion___block_invoke;
  v11[3] = &unk_1E6CC7388;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v11];
  id v10 = [v8 valueForProperty:*MEMORY[0x1E4F79E10]];

  [v9 fetchProvisioningProfilesForDeviceWithPairingID:v10 completion:v7];
}

void __75__ACXDeviceConnection_fetchProvisioningProfilesForPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (id)provisioningProfilesForPairedDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  char v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__ACXDeviceConnection_provisioningProfilesForPairedDevice_error___block_invoke;
  v13[3] = &unk_1E6CC73B0;
  v13[4] = &v20;
  id v7 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v13];
  id v8 = [v6 valueForProperty:*MEMORY[0x1E4F79E10]];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__ACXDeviceConnection_provisioningProfilesForPairedDevice_error___block_invoke_2;
  v12[3] = &unk_1E6CC74C8;
  v12[4] = &v20;
  void v12[5] = &v14;
  [v7 fetchProvisioningProfilesForDeviceWithPairingID:v8 completion:v12];

  uint64_t v9 = (void *)v15[5];
  if (a4 && !v9)
  {
    *a4 = (id) v21[5];
    uint64_t v9 = (void *)v15[5];
  }
  id v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);

  return v10;
}

void __65__ACXDeviceConnection_provisioningProfilesForPairedDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __65__ACXDeviceConnection_provisioningProfilesForPairedDevice_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *id v7 = v9;
}

- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 completion:(id)a4
{
}

- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__ACXDeviceConnection_fetchProvisioningProfilesForApplicationWithBundleID_forPairedDevice_completion___block_invoke;
  v14[3] = &unk_1E6CC7388;
  id v15 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v14];
  uint64_t v13 = [v10 valueForProperty:*MEMORY[0x1E4F79E10]];

  [v12 fetchProvisioningProfilesForApplicationWithBundleID:v11 forDeviceWithPairingID:v13 completion:v9];
}

void __102__ACXDeviceConnection_fetchProvisioningProfilesForApplicationWithBundleID_forPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (id)provisioningProfilesForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__ACXDeviceConnection_provisioningProfilesForApplicationWithBundleID_forPairedDevice_error___block_invoke;
  v16[3] = &unk_1E6CC73B0;
  v16[4] = &v23;
  id v10 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v16];
  id v11 = [v9 valueForProperty:*MEMORY[0x1E4F79E10]];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__ACXDeviceConnection_provisioningProfilesForApplicationWithBundleID_forPairedDevice_error___block_invoke_2;
  v15[3] = &unk_1E6CC74C8;
  v15[4] = &v23;
  void v15[5] = &v17;
  [v10 fetchProvisioningProfilesForApplicationWithBundleID:v8 forDeviceWithPairingID:v11 completion:v15];

  id v12 = (void *)v18[5];
  if (a5 && !v12)
  {
    *a5 = (id) v24[5];
    id v12 = (void *)v18[5];
  }
  id v13 = v12;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v13;
}

void __92__ACXDeviceConnection_provisioningProfilesForApplicationWithBundleID_forPairedDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __92__ACXDeviceConnection_provisioningProfilesForApplicationWithBundleID_forPairedDevice_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *id v7 = v9;
}

- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 completion:(id)a5
{
}

- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 forPairedDevice:(id)a5 completion:(id)a6
{
}

- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 writingToPreferencesLocation:(unint64_t)a5 forPairedDevice:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  id v14 = a8;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __145__ACXDeviceConnection_updatePreferencesForApplicationWithIdentifier_preferences_writingToPreferencesLocation_forPairedDevice_options_completion___block_invoke;
  v21[3] = &unk_1E6CC7388;
  id v22 = v14;
  id v15 = v14;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v21];
  uint64_t v20 = [v16 valueForProperty:*MEMORY[0x1E4F79E10]];

  [v19 updatePreferencesForApplicationWithIdentifier:v18 preferences:v17 writingToPreferencesLocation:a5 forDeviceWithPairingID:v20 options:a7 completion:v15];
}

void __145__ACXDeviceConnection_updatePreferencesForApplicationWithIdentifier_preferences_writingToPreferencesLocation_forPairedDevice_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 writingToPreferencesLocation:(unint64_t)a5 forPairedDevice:(id)a6 options:(unint64_t)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __140__ACXDeviceConnection_updatePreferencesForApplicationWithIdentifier_preferences_writingToPreferencesLocation_forPairedDevice_options_error___block_invoke;
  v22[3] = &unk_1E6CC73B0;
  v22[4] = &v23;
  id v17 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v22];
  id v18 = [v16 valueForProperty:*MEMORY[0x1E4F79E10]];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __140__ACXDeviceConnection_updatePreferencesForApplicationWithIdentifier_preferences_writingToPreferencesLocation_forPairedDevice_options_error___block_invoke_2;
  v21[3] = &unk_1E6CC73B0;
  void v21[4] = &v23;
  [v17 updatePreferencesForApplicationWithIdentifier:v14 preferences:v15 writingToPreferencesLocation:a5 forDeviceWithPairingID:v18 options:a7 completion:v21];

  if (a8) {
    *a8 = (id) v24[5];
  }
  BOOL v19 = v24[5] == 0;
  _Block_object_dispose(&v23, 8);

  return v19;
}

void __140__ACXDeviceConnection_updatePreferencesForApplicationWithIdentifier_preferences_writingToPreferencesLocation_forPairedDevice_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __140__ACXDeviceConnection_updatePreferencesForApplicationWithIdentifier_preferences_writingToPreferencesLocation_forPairedDevice_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)setUpdatePendingForCompanionApp:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__ACXDeviceConnection_setUpdatePendingForCompanionApp_completion___block_invoke;
  v10[3] = &unk_1E6CC7388;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v10];
  [v9 setUpdatePendingForCompanionApp:v8 completion:v7];
}

void __66__ACXDeviceConnection_setUpdatePendingForCompanionApp_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)setUpdatePendingForCompanionApp:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__ACXDeviceConnection_setUpdatePendingForCompanionApp_error___block_invoke;
  v11[3] = &unk_1E6CC73B0;
  void v11[4] = &v12;
  id v7 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__ACXDeviceConnection_setUpdatePendingForCompanionApp_error___block_invoke_2;
  v10[3] = &unk_1E6CC73B0;
  void v10[4] = &v12;
  [v7 setUpdatePendingForCompanionApp:v6 completion:v10];

  if (a4) {
    *a4 = (id) v13[5];
  }
  BOOL v8 = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __61__ACXDeviceConnection_setUpdatePendingForCompanionApp_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __61__ACXDeviceConnection_setUpdatePendingForCompanionApp_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)cancelUpdatePendingForCompanionApp:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__ACXDeviceConnection_cancelUpdatePendingForCompanionApp_completion___block_invoke;
  v10[3] = &unk_1E6CC7388;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v10];
  [v9 cancelUpdatePendingForCompanionApp:v8 completion:v7];
}

void __69__ACXDeviceConnection_cancelUpdatePendingForCompanionApp_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)cancelUpdatePendingForCompanionApp:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__ACXDeviceConnection_cancelUpdatePendingForCompanionApp_error___block_invoke;
  v11[3] = &unk_1E6CC73B0;
  void v11[4] = &v12;
  id v7 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__ACXDeviceConnection_cancelUpdatePendingForCompanionApp_error___block_invoke_2;
  v10[3] = &unk_1E6CC73B0;
  void v10[4] = &v12;
  [v7 cancelUpdatePendingForCompanionApp:v6 completion:v10];

  if (a4) {
    *a4 = (id) v13[5];
  }
  BOOL v8 = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __64__ACXDeviceConnection_cancelUpdatePendingForCompanionApp_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __64__ACXDeviceConnection_cancelUpdatePendingForCompanionApp_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)getApplicationWithBundleID:(id)a3 willInstallAfterPairingOnDevice:(id)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4F79E10];
  id v10 = a3;
  id v11 = [a4 valueForProperty:v9];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__ACXDeviceConnection_getApplicationWithBundleID_willInstallAfterPairingOnDevice_completion___block_invoke;
  v14[3] = &unk_1E6CC7388;
  id v15 = v8;
  id v12 = v8;
  id v13 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v14];
  [v13 applicationWillInstallAfterPairingOnDeviceWithPairingID:v11 withBundleID:v10 completion:v12];
}

void __93__ACXDeviceConnection_getApplicationWithBundleID_willInstallAfterPairingOnDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)getApplicationWithBundleID:(id)a3 willInstallAfterPairing:(BOOL *)a4 onDevice:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v12 = [v11 valueForProperty:*MEMORY[0x1E4F79E10]];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__ACXDeviceConnection_getApplicationWithBundleID_willInstallAfterPairing_onDevice_error___block_invoke;
  v17[3] = &unk_1E6CC73B0;
  v17[4] = &v22;
  id v13 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__ACXDeviceConnection_getApplicationWithBundleID_willInstallAfterPairing_onDevice_error___block_invoke_2;
  v16[3] = &unk_1E6CC74A0;
  v16[4] = &v22;
  void v16[5] = &v18;
  [v13 applicationWillInstallAfterPairingOnDeviceWithPairingID:v12 withBundleID:v10 completion:v16];

  uint64_t v14 = (void *)v23[5];
  if (v14)
  {
    if (a6) {
      *a6 = v14;
    }
  }
  else if (a4)
  {
    *a4 = *((unsigned char *)v19 + 24);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v14 == 0;
}

void __89__ACXDeviceConnection_getApplicationWithBundleID_willInstallAfterPairing_onDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __89__ACXDeviceConnection_getApplicationWithBundleID_willInstallAfterPairing_onDevice_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)enumerateInstalledApplicationsOnPairedDevice:(id)a3 withBlock:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F79E10];
  id v7 = a4;
  id v8 = [a3 valueForProperty:v6];
  [(ACXDeviceConnection *)self enumerateInstalledApplicationsOnDeviceWithPairingID:v8 withBlock:v7];
}

- (void)enumerateInstalledApplicationsOnDeviceWithPairingID:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke;
  v16[3] = &unk_1E6CC7388;
  id v8 = v7;
  id v17 = v8;
  uint64_t v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v16];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_2;
  v12[3] = &unk_1E6CC7568;
  uint64_t v14 = self;
  id v15 = v8;
  id v13 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 fetchInstalledWatchAppBundleIDsForDeviceWithPairingID:v10 completion:v12];
}

void __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

void __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  else
  {
    if ([v5 count])
    {
      id v7 = (void *)[v5 mutableCopy];
      uint64_t v19 = 0;
      uint64_t v20 = (id *)&v19;
      uint64_t v21 = 0x3042000000;
      uint64_t v22 = __Block_byref_object_copy__155;
      uint64_t v23 = __Block_byref_object_dispose__156;
      id v24 = 0;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_157;
      v14[3] = &unk_1E6CC7540;
      uint64_t v18 = &v19;
      id v17 = *(id *)(a1 + 48);
      id v8 = v7;
      id v15 = v8;
      int8x16_t v13 = *(int8x16_t *)(a1 + 32);
      id v9 = (id)v13.i64[0];
      int8x16_t v16 = vextq_s8(v13, v13, 8uLL);
      id v10 = (void *)[v14 copy];
      objc_storeWeak(v20 + 5, v10);
      qos_class_t v11 = qos_class_self();
      id v12 = dispatch_get_global_queue(v11, 0);
      dispatch_async(v12, v10);

      _Block_object_dispose(&v19, 8);
      objc_destroyWeak(&v24);

      goto LABEL_8;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
LABEL_8:
}

void __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_157(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  if (WeakRetained)
  {
    id v5 = [*(id *)(a1 + 32) lastObject];
    if (v5)
    {
      [*(id *)(a1 + 32) removeLastObject];
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = (uint64_t)__85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_4;
      v17[3] = (uint64_t)&unk_1E6CC7518;
      id v5 = v5;
      id v18 = v5;
      id v20 = *(id *)(a1 + 56);
      id v19 = *(id *)(a1 + 32);
      id v21 = WeakRetained;
      [v6 fetchApplicationOnDeviceWithPairingID:v7 withBundleID:v5 completion:v17];

      id v8 = v18;
    }
    else
    {
      int8x16_t v13 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection enumerateInstalledApplicationsOnDeviceWithPairingID:withBlock:]_block_invoke", 1286, @"ACXErrorDomain", 1, 0, 0, @"Failed to get next bundle ID while enumerating remote apps", v4, v17[0]);
      qos_class_t v14 = qos_class_self();
      id v15 = dispatch_get_global_queue(v14, 0);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_3;
      v22[3] = &unk_1E6CC70C0;
      id v16 = *(id *)(a1 + 56);
      id v23 = v13;
      id v24 = v16;
      id v8 = v13;
      dispatch_async(v15, v22);
    }
  }
  else
  {
    id v9 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection enumerateInstalledApplicationsOnDeviceWithPairingID:withBlock:]_block_invoke", 1277, @"ACXErrorDomain", 1, 0, 0, @"Async enumeration block reference somehow became nil while enumerating remote apps", v2, v17[0]);
    qos_class_t v10 = qos_class_self();
    qos_class_t v11 = dispatch_get_global_queue(v10, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_2_161;
    block[3] = &unk_1E6CC70C0;
    id v12 = *(id *)(a1 + 56);
    id v26 = v9;
    id v27 = v12;
    id v5 = v9;
    dispatch_async(v11, block);

    id v8 = v27;
  }
}

uint64_t __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_2_161(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  qos_class_t v7 = qos_class_self();
  id v8 = dispatch_get_global_queue(v7, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_5;
  v11[3] = &unk_1E6CC74F0;
  id v12 = v6;
  id v13 = a1[4];
  id v16 = a1[6];
  id v14 = v5;
  id v15 = a1[5];
  id v17 = a1[7];
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 domain];
    if (![v3 isEqualToString:@"ACXErrorDomain"])
    {

      goto LABEL_14;
    }
    uint64_t v4 = [*(id *)(a1 + 32) code];

    if (v4 != 19)
    {
LABEL_14:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }
      id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_26:
      v6();
      return;
    }
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      MOLogWrite();
    }
    if (!(*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64)))
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
        MOLogWrite();
      }
      return;
    }
  }
  if (!objc_msgSend(*(id *)(a1 + 56), "count", v7))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_26;
  }
  qos_class_t v5 = qos_class_self();
  id v8 = dispatch_get_global_queue(v5, 0);
  dispatch_async(v8, *(dispatch_block_t *)(a1 + 72));
}

- (void)enumerateLocallyAvailableApplicationsForPairedDevice:(id)a3 options:(unint64_t)a4 withBlock:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F79E10];
  id v9 = a5;
  id v10 = [a3 valueForProperty:v8];
  [(ACXDeviceConnection *)self enumerateLocallyAvailableApplicationsForDeviceWithPairingID:v10 options:a4 withBlock:v9];
}

- (void)enumerateLocallyAvailableApplicationsForDeviceWithPairingID:(id)a3 options:(unint64_t)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke;
  v18[3] = &unk_1E6CC7388;
  id v10 = v9;
  id v19 = v10;
  qos_class_t v11 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v18];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_2;
  v14[3] = &unk_1E6CC7608;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  unint64_t v17 = a4;
  id v12 = v8;
  id v13 = v10;
  [v11 fetchLocallyAvailableWatchAppBundleIDsWithCompletion:v14];
}

void __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

void __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  else
  {
    if ([v5 count])
    {
      uint64_t v7 = (void *)[v5 mutableCopy];
      uint64_t v23 = 0;
      id v24 = (id *)&v23;
      uint64_t v25 = 0x3042000000;
      id v26 = __Block_byref_object_copy__155;
      id v27 = __Block_byref_object_dispose__156;
      id v28 = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_3;
      v16[3] = &unk_1E6CC75E0;
      id v21 = &v23;
      id v20 = *(id *)(a1 + 48);
      id v8 = v7;
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(a1 + 40);
      id v17 = v8;
      uint64_t v18 = v9;
      id v11 = v10;
      uint64_t v12 = *(void *)(a1 + 56);
      id v19 = v11;
      uint64_t v22 = v12;
      id v13 = (void *)[v16 copy];
      objc_storeWeak(v24 + 5, v13);
      qos_class_t v14 = qos_class_self();
      id v15 = dispatch_get_global_queue(v14, 0);
      dispatch_async(v15, v13);

      _Block_object_dispose(&v23, 8);
      objc_destroyWeak(&v28);

      goto LABEL_8;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
LABEL_8:
}

void __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  if (WeakRetained)
  {
    id v5 = [*(id *)(a1 + 32) lastObject];
    if (v5)
    {
      [*(id *)(a1 + 32) removeLastObject];
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 72);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_6;
      v19[3] = &unk_1E6CC75B8;
      uint64_t v24 = v8;
      id v5 = v5;
      id v20 = v5;
      id v22 = *(id *)(a1 + 56);
      id v21 = *(id *)(a1 + 32);
      id v23 = WeakRetained;
      [v6 _fetchLocallyAvailableApplicationWithBundleID:v5 forDeviceWithPairingID:v7 options:v8 completion:v19];

      id v9 = v20;
    }
    else
    {
      qos_class_t v14 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection enumerateLocallyAvailableApplicationsForDeviceWithPairingID:options:withBlock:]_block_invoke_3", 1373, @"ACXErrorDomain", 1, 0, 0, @"Failed to get next bundle ID while enumerating local apps", v4, v18);
      qos_class_t v15 = qos_class_self();
      id v16 = dispatch_get_global_queue(v15, 0);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_5;
      v25[3] = &unk_1E6CC70C0;
      id v17 = *(id *)(a1 + 56);
      id v26 = v14;
      id v27 = v17;
      id v9 = v14;
      dispatch_async(v16, v25);
    }
  }
  else
  {
    id v10 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection enumerateLocallyAvailableApplicationsForDeviceWithPairingID:options:withBlock:]_block_invoke_3", 1364, @"ACXErrorDomain", 1, 0, 0, @"Async enumeration block reference somehow became nil while enumerating local apps", v2, v18);
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = dispatch_get_global_queue(v11, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_4;
    block[3] = &unk_1E6CC70C0;
    id v13 = *(id *)(a1 + 56);
    id v29 = v10;
    id v30 = v13;
    id v5 = v10;
    dispatch_async(v12, block);

    id v9 = v30;
  }
}

uint64_t __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  qos_class_t v7 = qos_class_self();
  uint64_t v8 = dispatch_get_global_queue(v7, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_7;
  block[3] = &unk_1E6CC7590;
  uint64_t v9 = *(void *)(a1 + 64);
  id v13 = v6;
  uint64_t v19 = v9;
  id v14 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 48);
  id v15 = v5;
  id v16 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, block);
}

void __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      id v3 = [v2 domain];
      if ([v3 isEqualToString:@"ACXErrorDomain"]
        && [*(id *)(a1 + 32) code] == 37)
      {

LABEL_22:
        [*(id *)(a1 + 48) isSystemApp];
LABEL_23:
        if (objc_msgSend(*(id *)(a1 + 56), "count", v10))
        {
          qos_class_t v8 = qos_class_self();
          id v11 = dispatch_get_global_queue(v8, 0);
          dispatch_async(v11, *(dispatch_block_t *)(a1 + 72));

          return;
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
          MOLogWrite();
        }
        uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
        goto LABEL_36;
      }
      uint64_t v4 = [*(id *)(a1 + 32) domain];
      if ([v4 isEqualToString:@"ACXErrorDomain"])
      {
        uint64_t v5 = [*(id *)(a1 + 32) code];

        if (v5 == 38) {
          goto LABEL_22;
        }
      }
      else
      {
      }
    }
    id v6 = [*(id *)(a1 + 32) domain];
    if ([v6 isEqualToString:@"ACXErrorDomain"])
    {
      uint64_t v7 = [*(id *)(a1 + 32) code];

      if (v7 == 19) {
        goto LABEL_22;
      }
    }
    else
    {
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_36:
    v9();
    return;
  }
  if ([*(id *)(a1 + 48) isSystemApp]) {
    goto LABEL_23;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    MOLogWrite();
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64))) {
    goto LABEL_23;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
    MOLogWrite();
  }
}

- (void)fetchApplicationOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__ACXDeviceConnection_fetchApplicationOnDeviceWithPairingID_withBundleID_completion___block_invoke;
  v13[3] = &unk_1E6CC7388;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v13];
  [v12 fetchInstalledWatchAppWithBundleID:v10 forDeviceWithPairingID:v11 completion:v9];
}

void __85__ACXDeviceConnection_fetchApplicationOnDeviceWithPairingID_withBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (id)applicationOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__ACXDeviceConnection_applicationOnDeviceWithPairingID_withBundleID_error___block_invoke;
  v15[3] = &unk_1E6CC73B0;
  v15[4] = &v22;
  id v10 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__ACXDeviceConnection_applicationOnDeviceWithPairingID_withBundleID_error___block_invoke_2;
  v14[3] = &unk_1E6CC7630;
  void v14[4] = &v22;
  void v14[5] = &v16;
  [v10 fetchInstalledWatchAppWithBundleID:v9 forDeviceWithPairingID:v8 completion:v14];

  id v11 = (void *)v17[5];
  if (a5 && !v11)
  {
    *a5 = (id) v23[5];
    id v11 = (void *)v17[5];
  }
  id v12 = v11;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v12;
}

void __75__ACXDeviceConnection_applicationOnDeviceWithPairingID_withBundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __75__ACXDeviceConnection_applicationOnDeviceWithPairingID_withBundleID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *uint64_t v7 = v9;
}

- (void)fetchApplicationOnPairedDevice:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F79E10];
  id v9 = a5;
  id v10 = a4;
  id v11 = [a3 valueForProperty:v8];
  [(ACXDeviceConnection *)self fetchApplicationOnDeviceWithPairingID:v11 withBundleID:v10 completion:v9];
}

- (id)applicationOnPairedDevice:(id)a3 withBundleID:(id)a4 error:(id *)a5
{
  uint64_t v8 = *MEMORY[0x1E4F79E10];
  id v9 = a4;
  id v10 = [a3 valueForProperty:v8];
  id v11 = [(ACXDeviceConnection *)self applicationOnDeviceWithPairingID:v10 withBundleID:v9 error:a5];

  return v11;
}

- (void)_fetchLocallyAvailableApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __111__ACXDeviceConnection__fetchLocallyAvailableApplicationWithBundleID_forDeviceWithPairingID_options_completion___block_invoke;
  v15[3] = &unk_1E6CC7388;
  id v16 = v10;
  id v11 = v10;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v15];
  [v14 fetchLocallyAvailableWatchAppWithBundleID:v13 forDeviceWithPairingID:v12 options:a5 completion:v11];
}

void __111__ACXDeviceConnection__fetchLocallyAvailableApplicationWithBundleID_forDeviceWithPairingID_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (void)fetchLocallyAvailableApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5
{
}

- (void)fetchLocallyAvailableApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F79E10];
  id v9 = a5;
  id v10 = a3;
  id v11 = [a4 valueForProperty:v8];
  [(ACXDeviceConnection *)self _fetchLocallyAvailableApplicationWithBundleID:v10 forDeviceWithPairingID:v11 options:0 completion:v9];
}

- (id)_locallyAvailableApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  id v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__ACXDeviceConnection__locallyAvailableApplicationWithBundleID_forDeviceWithPairingID_options_error___block_invoke;
  v17[3] = &unk_1E6CC73B0;
  uint64_t v17[4] = &v24;
  id v12 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__ACXDeviceConnection__locallyAvailableApplicationWithBundleID_forDeviceWithPairingID_options_error___block_invoke_2;
  v16[3] = &unk_1E6CC7658;
  void v16[4] = &v24;
  void v16[5] = &v18;
  [v12 fetchLocallyAvailableWatchAppWithBundleID:v10 forDeviceWithPairingID:v11 options:a5 completion:v16];

  id v13 = (void *)v19[5];
  if (a6 && !v13)
  {
    *a6 = (id) v25[5];
    id v13 = (void *)v19[5];
  }
  id v14 = v13;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v14;
}

void __101__ACXDeviceConnection__locallyAvailableApplicationWithBundleID_forDeviceWithPairingID_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __101__ACXDeviceConnection__locallyAvailableApplicationWithBundleID_forDeviceWithPairingID_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *uint64_t v7 = v9;
}

- (id)locallyAvailableApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 error:(id *)a5
{
  return [(ACXDeviceConnection *)self _locallyAvailableApplicationWithBundleID:a3 forDeviceWithPairingID:a4 options:0 error:a5];
}

- (id)locallyAvailableApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 error:(id *)a5
{
  uint64_t v8 = *MEMORY[0x1E4F79E10];
  id v9 = a3;
  id v10 = [a4 valueForProperty:v8];
  id v11 = [(ACXDeviceConnection *)self _locallyAvailableApplicationWithBundleID:v9 forDeviceWithPairingID:v10 options:0 error:a5];

  return v11;
}

- (id)locallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forPairedDevice:(id)a4 error:(id *)a5
{
  uint64_t v8 = *MEMORY[0x1E4F79E10];
  id v9 = a3;
  id v10 = [a4 valueForProperty:v8];
  id v11 = [(ACXDeviceConnection *)self locallyAvailableApplicationWithContainingApplicationBundleID:v9 forDeviceWithPairingID:v10 error:a5];

  return v11;
}

- (void)fetchLocallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F79E10];
  id v9 = a5;
  id v10 = a3;
  id v11 = [a4 valueForProperty:v8];
  [(ACXDeviceConnection *)self fetchLocallyAvailableApplicationWithContainingApplicationBundleID:v10 forDeviceWithPairingID:v11 completion:v9];
}

- (void)fetchLocallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __123__ACXDeviceConnection_fetchLocallyAvailableApplicationWithContainingApplicationBundleID_forDeviceWithPairingID_completion___block_invoke;
  v13[3] = &unk_1E6CC7388;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v13];
  [v12 fetchLocallyAvailableApplicationWithContainingApplicationBundleID:v11 forDeviceWithPairingID:v10 completion:v9];
}

void __123__ACXDeviceConnection_fetchLocallyAvailableApplicationWithContainingApplicationBundleID_forDeviceWithPairingID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (id)locallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forDeviceWithPairingID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__ACXDeviceConnection_locallyAvailableApplicationWithContainingApplicationBundleID_forDeviceWithPairingID_error___block_invoke;
  v15[3] = &unk_1E6CC73B0;
  void v15[4] = &v22;
  id v10 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __113__ACXDeviceConnection_locallyAvailableApplicationWithContainingApplicationBundleID_forDeviceWithPairingID_error___block_invoke_2;
  v14[3] = &unk_1E6CC7658;
  void v14[4] = &v22;
  void v14[5] = &v16;
  [v10 fetchLocallyAvailableApplicationWithContainingApplicationBundleID:v8 forDeviceWithPairingID:v9 completion:v14];

  id v11 = (void *)v17[5];
  if (a5 && !v11)
  {
    *a5 = (id) v23[5];
    id v11 = (void *)v17[5];
  }
  id v12 = v11;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v12;
}

void __113__ACXDeviceConnection_locallyAvailableApplicationWithContainingApplicationBundleID_forDeviceWithPairingID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __113__ACXDeviceConnection_locallyAvailableApplicationWithContainingApplicationBundleID_forDeviceWithPairingID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *uint64_t v7 = v9;
}

- (void)applicationIsInstalledOnPairedDevice:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F79E10];
  id v9 = a5;
  id v10 = a4;
  id v11 = [a3 valueForProperty:v8];
  [(ACXDeviceConnection *)self applicationIsInstalledOnDeviceWithPairingID:v11 withBundleID:v10 completion:v9];
}

- (BOOL)getApplicationIsInstalled:(BOOL *)a3 withBundleID:(id)a4 onPairedDevice:(id)a5 error:(id *)a6
{
  uint64_t v10 = *MEMORY[0x1E4F79E10];
  id v11 = a4;
  id v12 = [a5 valueForProperty:v10];
  LOBYTE(a6) = [(ACXDeviceConnection *)self getApplicationIsInstalled:a3 withBundleID:v11 onDeviceWithPairingID:v12 error:a6];

  return (char)a6;
}

- (BOOL)getApplicationIsInstalled:(BOOL *)a3 withBundleID:(id)a4 onDeviceWithPairingID:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__ACXDeviceConnection_getApplicationIsInstalled_withBundleID_onDeviceWithPairingID_error___block_invoke;
  v18[3] = &unk_1E6CC73B0;
  void v18[4] = &v23;
  id v12 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__ACXDeviceConnection_getApplicationIsInstalled_withBundleID_onDeviceWithPairingID_error___block_invoke_2;
  v17[3] = &unk_1E6CC74A0;
  uint64_t v17[4] = &v23;
  void v17[5] = &v19;
  [v12 applicationIsInstalledOnDeviceWithPairingID:v11 withBundleID:v10 completion:v17];

  id v13 = v24;
  id v14 = (void *)v24[5];
  if (v14)
  {
    if (a6)
    {
      *a6 = v14;
      id v13 = v24;
    }
  }
  else if (a3)
  {
    *a3 = *((unsigned char *)v20 + 24);
  }
  BOOL v15 = v13[5] == 0;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v15;
}

void __90__ACXDeviceConnection_getApplicationIsInstalled_withBundleID_onDeviceWithPairingID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __90__ACXDeviceConnection_getApplicationIsInstalled_withBundleID_onDeviceWithPairingID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)applicationIsInstalledOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__ACXDeviceConnection_applicationIsInstalledOnDeviceWithPairingID_withBundleID_completion___block_invoke;
  v13[3] = &unk_1E6CC7388;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v13];
  [v12 applicationIsInstalledOnDeviceWithPairingID:v11 withBundleID:v10 completion:v9];
}

void __91__ACXDeviceConnection_applicationIsInstalledOnDeviceWithPairingID_withBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (void)applicationIsInstalledOnPairedDevice:(id)a3 withCompanionBundleID:(id)a4 completion:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F79E10];
  id v9 = a5;
  id v10 = a4;
  id v11 = [a3 valueForProperty:v8];
  [(ACXDeviceConnection *)self applicationIsInstalledOnDeviceWithPairingID:v11 withCompanionBundleID:v10 completion:v9];
}

- (BOOL)getApplicationIsInstalled:(BOOL *)a3 onPairedDevice:(id)a4 withCompanionBundleID:(id)a5 error:(id *)a6
{
  uint64_t v10 = *MEMORY[0x1E4F79E10];
  id v11 = a5;
  id v12 = [a4 valueForProperty:v10];
  LOBYTE(a6) = [(ACXDeviceConnection *)self getApplicationIsInstalled:a3 onDeviceWithPairingID:v12 withCompanionBundleID:v11 error:a6];

  return (char)a6;
}

- (void)applicationIsInstalledOnDeviceWithPairingID:(id)a3 withCompanionBundleID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__ACXDeviceConnection_applicationIsInstalledOnDeviceWithPairingID_withCompanionBundleID_completion___block_invoke;
  v13[3] = &unk_1E6CC7388;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v13];
  [v12 applicationIsInstalledOnDeviceWithPairingID:v11 withCompanionBundleID:v10 completion:v9];
}

void __100__ACXDeviceConnection_applicationIsInstalledOnDeviceWithPairingID_withCompanionBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)getApplicationIsInstalled:(BOOL *)a3 onDeviceWithPairingID:(id)a4 withCompanionBundleID:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __99__ACXDeviceConnection_getApplicationIsInstalled_onDeviceWithPairingID_withCompanionBundleID_error___block_invoke;
  v18[3] = &unk_1E6CC73B0;
  void v18[4] = &v19;
  id v12 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__ACXDeviceConnection_getApplicationIsInstalled_onDeviceWithPairingID_withCompanionBundleID_error___block_invoke_2;
  v17[3] = &unk_1E6CC74A0;
  uint64_t v17[4] = &v19;
  void v17[5] = &v25;
  [v12 applicationIsInstalledOnDeviceWithPairingID:v10 withCompanionBundleID:v11 completion:v17];

  id v13 = v20;
  id v14 = (void *)v20[5];
  if (v14)
  {
    if (a6)
    {
      *a6 = v14;
      id v13 = v20;
    }
  }
  else if (a3)
  {
    *a3 = *((unsigned char *)v26 + 24);
  }
  BOOL v15 = v13[5] == 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __99__ACXDeviceConnection_getApplicationIsInstalled_onDeviceWithPairingID_withCompanionBundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __99__ACXDeviceConnection_getApplicationIsInstalled_onDeviceWithPairingID_withCompanionBundleID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)applicationIsInstalledOnAnyPairedDeviceWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__ACXDeviceConnection_applicationIsInstalledOnAnyPairedDeviceWithBundleID_completion___block_invoke;
  v10[3] = &unk_1E6CC7388;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v10];
  [v9 applicationIsInstalledOnAnyPairedDeviceWithBundleID:v8 completion:v7];
}

void __86__ACXDeviceConnection_applicationIsInstalledOnAnyPairedDeviceWithBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)getApplicationIsInstalled:(BOOL *)a3 onAnyPairedDeviceWithBundleID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithBundleID_error___block_invoke;
  v15[3] = &unk_1E6CC73B0;
  void v15[4] = &v16;
  id v9 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithBundleID_error___block_invoke_2;
  v14[3] = &unk_1E6CC74A0;
  void v14[4] = &v16;
  void v14[5] = &v22;
  [v9 applicationIsInstalledOnAnyPairedDeviceWithBundleID:v8 completion:v14];

  id v10 = v17;
  id v11 = (void *)v17[5];
  if (v11)
  {
    if (a5)
    {
      *a5 = v11;
      id v10 = v17;
    }
  }
  else if (a3)
  {
    *a3 = *((unsigned char *)v23 + 24);
  }
  BOOL v12 = v10[5] == 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __85__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithBundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __85__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithBundleID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)_companionAppWithoutCounterparts:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  uint64_t v9 = 0;
  id v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v9];

  if (v5)
  {
    id v6 = [v5 counterpartIdentifiers];
    BOOL v7 = [v6 count] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ACXDeviceConnection *)self _companionAppWithoutCounterparts:v6])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __95__ACXDeviceConnection_applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID_completion___block_invoke;
    v10[3] = &unk_1E6CC7388;
    id v8 = v7;
    id v11 = v8;
    uint64_t v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v10];
    [v9 applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:v6 completion:v8];
  }
}

void __95__ACXDeviceConnection_applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)getApplicationIsInstalled:(BOOL *)a3 onAnyPairedDeviceWithCompanionBundleID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  if ([(ACXDeviceConnection *)self _companionAppWithoutCounterparts:v8])
  {
    BOOL v9 = 0;
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __94__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithCompanionBundleID_error___block_invoke;
    v15[3] = &unk_1E6CC73B0;
    void v15[4] = &v16;
    id v10 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __94__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithCompanionBundleID_error___block_invoke_2;
    v14[3] = &unk_1E6CC74A0;
    void v14[4] = &v16;
    void v14[5] = &v22;
    [v10 applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:v8 completion:v14];

    id v11 = v17;
    BOOL v12 = (void *)v17[5];
    if (v12)
    {
      if (a5)
      {
        *a5 = v12;
        id v11 = v17;
      }
    }
    else if (a3)
    {
      *a3 = *((unsigned char *)v23 + 24);
    }
    BOOL v9 = v11[5] == 0;
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v9;
}

void __94__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithCompanionBundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __94__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithCompanionBundleID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)fetchApplicationDatabaseSyncInformationForPairedDevice:(id)a3 returningDatabaseUUID:(id *)a4 lastSequenceNumber:(unint64_t *)a5 error:(id *)a6
{
  id v10 = [a3 valueForProperty:*MEMORY[0x1E4F79E10]];
  LOBYTE(a6) = [(ACXDeviceConnection *)self fetchApplicationDatabaseSyncInformationForDeviceWithPairingID:v10 returningDatabaseUUID:a4 lastSequenceNumber:a5 error:a6];

  return (char)a6;
}

- (BOOL)fetchApplicationDatabaseSyncInformationForDeviceWithPairingID:(id)a3 returningDatabaseUUID:(id *)a4 lastSequenceNumber:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy_;
  id v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __132__ACXDeviceConnection_fetchApplicationDatabaseSyncInformationForDeviceWithPairingID_returningDatabaseUUID_lastSequenceNumber_error___block_invoke;
  v15[3] = &unk_1E6CC73B0;
  void v15[4] = &v16;
  id v11 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __132__ACXDeviceConnection_fetchApplicationDatabaseSyncInformationForDeviceWithPairingID_returningDatabaseUUID_lastSequenceNumber_error___block_invoke_2;
  v14[3] = &unk_1E6CC7680;
  void v14[4] = &v16;
  void v14[5] = &v26;
  void v14[6] = &v22;
  [v11 fetchApplicationDatabaseSyncInformationForDeviceWithPairingID:v10 completion:v14];

  BOOL v12 = (void *)v17[5];
  if (v12)
  {
    if (a6) {
      *a6 = v12;
    }
  }
  else
  {
    if (a4) {
      *a4 = (id) v27[5];
    }
    if (a5) {
      *a5 = v23[3];
    }
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v12 == 0;
}

void __132__ACXDeviceConnection_fetchApplicationDatabaseSyncInformationForDeviceWithPairingID_returningDatabaseUUID_lastSequenceNumber_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __132__ACXDeviceConnection_fetchApplicationDatabaseSyncInformationForDeviceWithPairingID_returningDatabaseUUID_lastSequenceNumber_error___block_invoke_2(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a4);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
  }
}

- (id)copyLocalizedValuesFromAllDevicesForInfoPlistKeys:(id)a3 forAppWithBundleID:(id)a4 fetchingFirstMatchingLocalizationInList:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy_;
  id v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __138__ACXDeviceConnection_copyLocalizedValuesFromAllDevicesForInfoPlistKeys_forAppWithBundleID_fetchingFirstMatchingLocalizationInList_error___block_invoke;
  v18[3] = &unk_1E6CC73B0;
  void v18[4] = &v19;
  id v13 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __138__ACXDeviceConnection_copyLocalizedValuesFromAllDevicesForInfoPlistKeys_forAppWithBundleID_fetchingFirstMatchingLocalizationInList_error___block_invoke_2;
  v17[3] = &unk_1E6CC74C8;
  uint64_t v17[4] = &v19;
  void v17[5] = &v25;
  [v13 fetchLocalizedValuesFromAllDevicesForInfoPlistKeys:v10 forAppWithBundleID:v11 fetchingFirstMatchingLocalizationInList:v12 completion:v17];

  id v14 = (void *)v26[5];
  if (a6 && !v14)
  {
    *a6 = (id) v20[5];
    id v14 = (void *)v26[5];
  }
  id v15 = v14;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __138__ACXDeviceConnection_copyLocalizedValuesFromAllDevicesForInfoPlistKeys_forAppWithBundleID_fetchingFirstMatchingLocalizationInList_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __138__ACXDeviceConnection_copyLocalizedValuesFromAllDevicesForInfoPlistKeys_forAppWithBundleID_fetchingFirstMatchingLocalizationInList_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *id v7 = v9;
}

- (void)enumerateInstallableSystemAppsOnPairedDevice:(id)a3 withBlock:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F79E10];
  id v7 = a4;
  id v8 = [a3 valueForProperty:v6];
  [(ACXDeviceConnection *)self enumerateInstallableSystemAppsOnDeviceWithPairingID:v8 withBlock:v7];
}

- (void)enumerateInstallableSystemAppsOnDeviceWithPairingID:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke;
  v16[3] = &unk_1E6CC7388;
  id v8 = v7;
  id v17 = v8;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v16];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_2;
  v12[3] = &unk_1E6CC7568;
  id v14 = self;
  id v15 = v8;
  id v13 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 fetchInstallableSystemAppBundleIDsForDeviceWithPairingID:v10 completion:v12];
}

void __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

void __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  else
  {
    if ([v5 count])
    {
      id v7 = (void *)[v5 mutableCopy];
      uint64_t v19 = 0;
      uint64_t v20 = (id *)&v19;
      uint64_t v21 = 0x3042000000;
      uint64_t v22 = __Block_byref_object_copy__155;
      uint64_t v23 = __Block_byref_object_dispose__156;
      id v24 = 0;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_3;
      v14[3] = &unk_1E6CC7540;
      uint64_t v18 = &v19;
      id v17 = *(id *)(a1 + 48);
      id v8 = v7;
      id v15 = v8;
      int8x16_t v13 = *(int8x16_t *)(a1 + 32);
      id v9 = (id)v13.i64[0];
      int8x16_t v16 = vextq_s8(v13, v13, 8uLL);
      id v10 = (void *)[v14 copy];
      objc_storeWeak(v20 + 5, v10);
      qos_class_t v11 = qos_class_self();
      id v12 = dispatch_get_global_queue(v11, 0);
      dispatch_async(v12, v10);

      _Block_object_dispose(&v19, 8);
      objc_destroyWeak(&v24);

      goto LABEL_8;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
LABEL_8:
}

void __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  if (WeakRetained)
  {
    id v5 = [*(id *)(a1 + 32) lastObject];
    if (v5)
    {
      [*(id *)(a1 + 32) removeLastObject];
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = (uint64_t)__85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_6;
      v17[3] = (uint64_t)&unk_1E6CC7518;
      id v5 = v5;
      id v18 = v5;
      id v20 = *(id *)(a1 + 56);
      id v19 = *(id *)(a1 + 32);
      id v21 = WeakRetained;
      [v6 fetchInstallableSystemAppWithBundleID:v5 onDeviceWithPairingID:v7 completion:v17];

      id v8 = v18;
    }
    else
    {
      int8x16_t v13 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection enumerateInstallableSystemAppsOnDeviceWithPairingID:withBlock:]_block_invoke_3", 1863, @"ACXErrorDomain", 1, 0, 0, @"Failed to get next bundle ID while enumerating local apps", v4, v17[0]);
      qos_class_t v14 = qos_class_self();
      id v15 = dispatch_get_global_queue(v14, 0);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_5;
      v22[3] = &unk_1E6CC70C0;
      id v16 = *(id *)(a1 + 56);
      id v23 = v13;
      id v24 = v16;
      id v8 = v13;
      dispatch_async(v15, v22);
    }
  }
  else
  {
    id v9 = _CreateAndLogError((uint64_t)"-[ACXDeviceConnection enumerateInstallableSystemAppsOnDeviceWithPairingID:withBlock:]_block_invoke_3", 1854, @"ACXErrorDomain", 1, 0, 0, @"Async enumeration block reference somehow became nil while enumerating local apps", v2, v17[0]);
    qos_class_t v10 = qos_class_self();
    qos_class_t v11 = dispatch_get_global_queue(v10, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_4;
    block[3] = &unk_1E6CC70C0;
    id v12 = *(id *)(a1 + 56);
    id v26 = v9;
    id v27 = v12;
    id v5 = v9;
    dispatch_async(v11, block);

    id v8 = v27;
  }
}

uint64_t __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_6(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  qos_class_t v7 = qos_class_self();
  id v8 = dispatch_get_global_queue(v7, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_7;
  v11[3] = &unk_1E6CC74F0;
  id v12 = v6;
  id v13 = a1[4];
  id v16 = a1[6];
  id v14 = v5;
  id v15 = a1[5];
  id v17 = a1[7];
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 domain];
    if (![v3 isEqualToString:@"ACXErrorDomain"])
    {

      goto LABEL_14;
    }
    uint64_t v4 = [*(id *)(a1 + 32) code];

    if (v4 != 19)
    {
LABEL_14:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }
      id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_26:
      v6();
      return;
    }
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      MOLogWrite();
    }
    if (!(*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64)))
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
        MOLogWrite();
      }
      return;
    }
  }
  if (!objc_msgSend(*(id *)(a1 + 56), "count", v7))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_26;
  }
  qos_class_t v5 = qos_class_self();
  id v8 = dispatch_get_global_queue(v5, 0);
  dispatch_async(v8, *(dispatch_block_t *)(a1 + 72));
}

- (void)fetchInstallableSystemAppWithBundleID:(id)a3 onPairedDevice:(id)a4 completion:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F79E10];
  id v9 = a5;
  id v10 = a3;
  id v11 = [a4 valueForProperty:v8];
  [(ACXDeviceConnection *)self fetchInstallableSystemAppWithBundleID:v10 onDeviceWithPairingID:v11 completion:v9];
}

- (void)fetchInstallableSystemAppWithBundleID:(id)a3 onDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__ACXDeviceConnection_fetchInstallableSystemAppWithBundleID_onDeviceWithPairingID_completion___block_invoke;
  v13[3] = &unk_1E6CC7388;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v13];
  [v12 fetchInstallableSystemAppWithBundleID:v11 forDeviceWithPairingID:v10 completion:v9];
}

void __94__ACXDeviceConnection_fetchInstallableSystemAppWithBundleID_onDeviceWithPairingID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (id)installableSystemAppWithBundleID:(id)a3 onPairedDevice:(id)a4 error:(id *)a5
{
  uint64_t v8 = *MEMORY[0x1E4F79E10];
  id v9 = a3;
  id v10 = [a4 valueForProperty:v8];
  id v11 = [(ACXDeviceConnection *)self installableSystemAppWithBundleID:v9 onDeviceWithPairingID:v10 error:a5];

  return v11;
}

- (id)installableSystemAppWithBundleID:(id)a3 onDeviceWithPairingID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__ACXDeviceConnection_installableSystemAppWithBundleID_onDeviceWithPairingID_error___block_invoke;
  v15[3] = &unk_1E6CC73B0;
  void v15[4] = &v22;
  id v10 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__ACXDeviceConnection_installableSystemAppWithBundleID_onDeviceWithPairingID_error___block_invoke_2;
  v14[3] = &unk_1E6CC7630;
  void v14[4] = &v22;
  void v14[5] = &v16;
  [v10 fetchInstallableSystemAppWithBundleID:v8 forDeviceWithPairingID:v9 completion:v14];

  id v11 = (void *)v17[5];
  if (a5 && !v11)
  {
    *a5 = (id) v23[5];
    id v11 = (void *)v17[5];
  }
  id v12 = v11;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v12;
}

void __84__ACXDeviceConnection_installableSystemAppWithBundleID_onDeviceWithPairingID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  qos_class_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __84__ACXDeviceConnection_installableSystemAppWithBundleID_onDeviceWithPairingID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *uint64_t v7 = v9;
}

- (void)systemAppIsInstallableOnPairedDevice:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F79E10];
  id v9 = a5;
  id v10 = a4;
  id v11 = [a3 valueForProperty:v8];
  [(ACXDeviceConnection *)self systemAppIsInstallableOnDeviceWithPairingID:v11 withBundleID:v10 completion:v9];
}

- (void)systemAppIsInstallableOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__ACXDeviceConnection_systemAppIsInstallableOnDeviceWithPairingID_withBundleID_completion___block_invoke;
  v13[3] = &unk_1E6CC7388;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v13];
  [v12 systemAppIsInstallableOnDeviceWithPairingID:v11 withBundleID:v10 completion:v9];
}

void __91__ACXDeviceConnection_systemAppIsInstallableOnDeviceWithPairingID_withBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)getSystemAppInstallability:(BOOL *)a3 onPairedDevice:(id)a4 withBundleID:(id)a5 error:(id *)a6
{
  uint64_t v10 = *MEMORY[0x1E4F79E10];
  id v11 = a5;
  id v12 = [a4 valueForProperty:v10];
  LOBYTE(a6) = [(ACXDeviceConnection *)self getSystemAppInstallability:a3 onDeviceWithPairingID:v12 withBundleID:v11 error:a6];

  return (char)a6;
}

- (BOOL)getSystemAppInstallability:(BOOL *)a3 onDeviceWithPairingID:(id)a4 withBundleID:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__ACXDeviceConnection_getSystemAppInstallability_onDeviceWithPairingID_withBundleID_error___block_invoke;
  v18[3] = &unk_1E6CC73B0;
  void v18[4] = &v23;
  id v12 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__ACXDeviceConnection_getSystemAppInstallability_onDeviceWithPairingID_withBundleID_error___block_invoke_2;
  v17[3] = &unk_1E6CC74A0;
  uint64_t v17[4] = &v23;
  void v17[5] = &v19;
  [v12 systemAppIsInstallableOnDeviceWithPairingID:v10 withBundleID:v11 completion:v17];

  id v13 = v24;
  id v14 = (void *)v24[5];
  if (v14)
  {
    if (a6)
    {
      *a6 = v14;
      id v13 = v24;
    }
  }
  else if (a3)
  {
    *a3 = *((unsigned char *)v20 + 24);
  }
  BOOL v15 = v13[5] == 0;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v15;
}

void __91__ACXDeviceConnection_getSystemAppInstallability_onDeviceWithPairingID_withBundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __91__ACXDeviceConnection_getSystemAppInstallability_onDeviceWithPairingID_withBundleID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)installRequestFailedForApp:(id)a3 onDeviceWithPairingID:(id)a4 failureReason:(id)a5 wasUserInitiated:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __109__ACXDeviceConnection_installRequestFailedForApp_onDeviceWithPairingID_failureReason_wasUserInitiated_error___block_invoke;
  v21[3] = &unk_1E6CC73B0;
  void v21[4] = &v22;
  BOOL v15 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __109__ACXDeviceConnection_installRequestFailedForApp_onDeviceWithPairingID_failureReason_wasUserInitiated_error___block_invoke_2;
  v20[3] = &unk_1E6CC73B0;
  v20[4] = &v22;
  [v15 installRequestFailedForApp:v12 forDeviceWithPairingID:v13 failureReason:v14 wasUserInitiated:v8 completion:v20];

  uint64_t v16 = v23;
  if (a7)
  {
    id v17 = (void *)v23[5];
    if (v17)
    {
      *a7 = v17;
      uint64_t v16 = v23;
    }
  }
  BOOL v18 = v16[5] == 0;
  _Block_object_dispose(&v22, 8);

  return v18;
}

void __109__ACXDeviceConnection_installRequestFailedForApp_onDeviceWithPairingID_failureReason_wasUserInitiated_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __109__ACXDeviceConnection_installRequestFailedForApp_onDeviceWithPairingID_failureReason_wasUserInitiated_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)acknowledgeTestFlightInstallBegunForApp:(id)a3 onDeviceWithPairingID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__ACXDeviceConnection_acknowledgeTestFlightInstallBegunForApp_onDeviceWithPairingID_error___block_invoke;
  v16[3] = &unk_1E6CC73B0;
  void v16[4] = &v17;
  id v10 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__ACXDeviceConnection_acknowledgeTestFlightInstallBegunForApp_onDeviceWithPairingID_error___block_invoke_2;
  v15[3] = &unk_1E6CC73B0;
  void v15[4] = &v17;
  [v10 acknowledgeTestFlightInstallBegunForApp:v8 forDeviceWithPairingID:v9 completion:v15];

  id v11 = v18;
  if (a5)
  {
    id v12 = (void *)v18[5];
    if (v12)
    {
      *a5 = v12;
      id v11 = v18;
    }
  }
  BOOL v13 = v11[5] == 0;
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __91__ACXDeviceConnection_acknowledgeTestFlightInstallBegunForApp_onDeviceWithPairingID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __91__ACXDeviceConnection_acknowledgeTestFlightInstallBegunForApp_onDeviceWithPairingID_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)applicationRemovabilityForPairedDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  BOOL v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id v7 = [v6 valueForProperty:*MEMORY[0x1E4F79E10]];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__ACXDeviceConnection_applicationRemovabilityForPairedDevice_error___block_invoke;
  v13[3] = &unk_1E6CC73B0;
  void v13[4] = &v20;
  id v8 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__ACXDeviceConnection_applicationRemovabilityForPairedDevice_error___block_invoke_2;
  v12[3] = &unk_1E6CC74C8;
  void v12[4] = &v20;
  void v12[5] = &v14;
  [v8 applicationRemovabilityOnDeviceWithPairingID:v7 completion:v12];

  id v9 = (void *)v15[5];
  if (a4 && !v9)
  {
    *a4 = (id) v21[5];
    id v9 = (void *)v15[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __68__ACXDeviceConnection_applicationRemovabilityForPairedDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __68__ACXDeviceConnection_applicationRemovabilityForPairedDevice_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *id v7 = v9;
}

- (void)applictionRemovabilityForPairedDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 valueForProperty:*MEMORY[0x1E4F79E10]];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__ACXDeviceConnection_applictionRemovabilityForPairedDevice_completion___block_invoke;
  v10[3] = &unk_1E6CC7388;
  id v11 = v6;
  id v8 = v6;
  id v9 = [(ACXDeviceConnection *)self _proxyWithErrorHandler:v10];
  [v9 applicationRemovabilityOnDeviceWithPairingID:v7 completion:v8];
}

void __72__ACXDeviceConnection_applictionRemovabilityForPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (BOOL)killDaemonForTestingWithError:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy_;
  BOOL v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__ACXDeviceConnection_killDaemonForTestingWithError___block_invoke;
  v8[3] = &unk_1E6CC76A8;
  v8[4] = &v9;
  v8[5] = &v15;
  uint64_t v4 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v8];
  [v4 killDaemonForTesting:&__block_literal_global_207];

  int v5 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((unsigned char *)v16 + 24))
  {
    *a3 = (id) v10[5];
    int v5 = *((unsigned __int8 *)v16 + 24);
  }
  BOOL v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __53__ACXDeviceConnection_killDaemonForTestingWithError___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v4 = [v6 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v5 = [v6 code];

    if (v5 == 4097) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_9:
}

uint64_t __53__ACXDeviceConnection_killDaemonForTestingWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return MEMORY[0x1F41817F8](v3, v2);
}

- (id)copyRemoteDuplicatedClassInfoWithError:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__ACXDeviceConnection_copyRemoteDuplicatedClassInfoWithError___block_invoke;
  v9[3] = &unk_1E6CC76A8;
  v9[4] = &v10;
  void v9[5] = &v16;
  uint64_t v4 = [(ACXDeviceConnection *)self _synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__ACXDeviceConnection_copyRemoteDuplicatedClassInfoWithError___block_invoke_2;
  v8[3] = &unk_1E6CC74C8;
  v8[4] = &v16;
  v8[5] = &v10;
  [v4 fetchDuplicatedClassInfo:v8];

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

void __62__ACXDeviceConnection_copyRemoteDuplicatedClassInfoWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v8 = v3;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __62__ACXDeviceConnection_copyRemoteDuplicatedClassInfoWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (ACXDeviceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACXDeviceConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setXpcConnection:(id)a3
{
}

- (BOOL)observersEnabled
{
  return self->_observersEnabled;
}

- (void)setObserversEnabled:(BOOL)a3
{
  self->_observersEnabled = a3;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (OS_dispatch_source)observerReEstablishTimer
{
  return self->_observerReEstablishTimer;
}

- (void)setObserverReEstablishTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerReEstablishTimer, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_onQueue_createXPCConnectionIfNecessary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 138412290;
  v1 = @"com.apple.companionappd.connect.allow";
  _os_log_fault_impl(&dword_1DD47C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "This process does not have the %@:=TRUE entitlement. AppConduit interfaces will all return errors", (uint8_t *)&v0, 0xCu);
}

@end