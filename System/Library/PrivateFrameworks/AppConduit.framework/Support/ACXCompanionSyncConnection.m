@interface ACXCompanionSyncConnection
- (ACXAvailableApplicationManager)applicationManager;
- (ACXCompanionSyncConnection)initWithDevice:(id)a3;
- (ACXDevice)device;
- (ACXGizmoState)gizmoState;
- (ACXInstallQueue)installQueue;
- (ACXLocalAppStoreInstallQueue)appStoreLocalQueue;
- (ACXRemoteAppList)remoteAppList;
- (ACXRemoteAppRemovabilityManager)remoteRemovabilityManager;
- (ACXRemoteSystemAppList)availableSystemAppList;
- (BOOL)_onQueue_appNeedsInstall:(id)a3;
- (BOOL)_onQueue_installFailedForWatchAppBundleID:(id)a3 companionBundleID:(id)a4 withError:(id)a5 appName:(id)a6 userInitiated:(BOOL)a7 userPresentableError:(id *)a8;
- (BOOL)_value:(id)a3 isDifferentFrom:(id)a4;
- (BOOL)availableSystemAppFetchRunning;
- (BOOL)needsAvailableSystemAppFetch;
- (BOOL)remoteRemovabilityFetchRunning;
- (BOOL)reunionSyncRunning;
- (BOOL)supportsRemoteAppList;
- (NSDictionary)removabilityForRemoteApps;
- (OS_dispatch_queue)internalQueue;
- (id)_appBundleFromURL:(id)a3;
- (id)_onQueue_applicationForWatchAppWithBundleID:(id)a3;
- (id)_onQueue_availableCompanionAppBundleIDForWatchApp:(id)a3;
- (id)messager;
- (id)remoteAppWithBundleID:(id)a3;
- (void)_installQueuedOrCompletedForWatchBundleID:(id)a3 companionAppBundleID:(id)a4 withName:(id)a5 userInitiated:(BOOL)a6 withError:(id)a7 withCompletion:(id)a8;
- (void)_installWatchAppWithBundleID:(id)a3 withProvisioningProfileInfo:(id)a4 installationPendingBlock:(id)a5 completionWithError:(id)a6;
- (void)_onQueue_beginReunionSync;
- (void)_onQueue_beginReunionSyncWithRetryCount:(unint64_t)a3;
- (void)_onQueue_configureRemoteAppListsAndFetchSystemAppsIfNeeded;
- (void)_onQueue_configureRemoteRemovabilityManagerAndFetchRemoteRemovabilityStatus;
- (void)_onQueue_fetchAvailableSystemApps;
- (void)_onQueue_fetchAvailableSystemAppsWithRetryCount:(unint64_t)a3;
- (void)_onQueue_fetchRemovabilityForRemoteApps;
- (void)_onQueue_fetchRemovabilityForRemoteAppsWithRetryCount:(unint64_t)a3;
- (void)_onQueue_handleAppDeleteMessage:(id)a3;
- (void)_onQueue_handleAppInstallFailureMessage:(id)a3;
- (void)_onQueue_handleAppInstallMessage:(id)a3;
- (void)_onQueue_handleAppInstallMessage:(id)a3 withAppManager:(id)a4;
- (void)_onQueue_handleAppRemovabilityUpdatedMessage:(id)a3;
- (void)_onQueue_handleCompatibleWatchAppsOnCompanionMessage:(id)a3;
- (void)_onQueue_handleIconForWatchAppMessage:(id)a3;
- (void)_onQueue_handleInstallAppMessage:(id)a3;
- (void)_onQueue_handleRemoteRemovabilityFetchResponse:(id)a3;
- (void)_onQueue_handleSADAppInfoResponse:(id)a3;
- (void)_onQueue_processPendingGizmoState;
- (void)_onQueue_processReunionSyncMessage:(id)a3;
- (void)_onQueue_processReunionSyncMessage:(id)a3 withAppManager:(id)a4;
- (void)_onQueue_sendInstallOnGizmoMessageForSystemAppBundleIDs:(id)a3 appsWithStoreMetadata:(id)a4 isUserInitiated:(BOOL)a5 exclusiveInstall:(BOOL)a6 withCompletion:(id)a7;
- (void)_onQueue_sendRemoveMessageForBundleIDs:(id)a3 isUserInitiated:(BOOL)a4 withCompletion:(id)a5;
- (void)_onQueue_triggerLocalAppStoreInstallForWatchApp:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)_processSystemAppChangesForNewApps:(id)a3 updatedApps:(id)a4 removedApps:(id)a5;
- (void)_setLocallyAvailableForRemoteApplicationInstances:(id)a3;
- (void)acknowledgeAppEventsForDBUUID:(id)a3 throughSequenceNumber:(unint64_t)a4;
- (void)acknowledgeTestFlightInstallBegunForWatchApp:(id)a3;
- (void)applicationsAdded:(id)a3;
- (void)applicationsRemovabilityUpdated:(id)a3;
- (void)applicationsRemoved:(id)a3;
- (void)applicationsUpdated:(id)a3;
- (void)cancelPendingInstallations;
- (void)dealloc;
- (void)fetchAppInfoForBundleIDs:(id)a3;
- (void)fetchBundleIDList;
- (void)fetchOutstandingAppEvents;
- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 completion:(id)a4;
- (void)fetchProvisioningProfilesWithCompletion:(id)a3;
- (void)fetchRemovabilityForRemoteApps;
- (void)handleIncomingMessage:(id)a3;
- (void)installAllApplications;
- (void)installProvisioningProfileWithData:(id)a3 completion:(id)a4;
- (void)installSystemApplicationsWithBundleIDs:(id)a3 withCompletion:(id)a4;
- (void)installWatchAppAtURL:(id)a3 installOptions:(id)a4 size:(int64_t)a5 completionWithError:(id)a6;
- (void)installWatchAppWithBundleID:(id)a3 withProvisioningProfileInfo:(id)a4 completionWithError:(id)a5;
- (void)markAllApplicationsAsRemoved;
- (void)noteCompanionAppDatabaseRebuild;
- (void)noteInstallFailure:(id)a3 forWatchAppWithBundleID:(id)a4 wasUserInitiated:(BOOL)a5;
- (void)noteNewCompanionApps:(id)a3 updatedApps:(id)a4 removedApps:(id)a5 forDBUUID:(id)a6 endingSequenceNumber:(unint64_t)a7;
- (void)performReunionSyncWithReason:(id)a3;
- (void)processPendingStateWithReason:(id)a3;
- (void)reachabilityChangedForDevice:(id)a3;
- (void)removeProvisioningProfileWithID:(id)a3 completion:(id)a4;
- (void)removeWatchAppWithBundleID:(id)a3 completion:(id)a4;
- (void)resyncCompleted;
- (void)setAvailableSystemAppFetchRunning:(BOOL)a3;
- (void)setNeedsAvailableSystemAppFetch:(BOOL)a3;
- (void)setRemoteRemovabilityFetchRunning:(BOOL)a3;
- (void)setRemoteRemovabilityManager:(id)a3;
- (void)setReunionSyncRunning:(BOOL)a3;
- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 writingToPreferencesLocation:(unint64_t)a5 options:(unint64_t)a6 completion:(id)a7;
@end

@implementation ACXCompanionSyncConnection

- (ACXCompanionSyncConnection)initWithDevice:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ACXCompanionSyncConnection;
  v6 = [(ACXCompanionSyncConnection *)&v36 init];
  if (!v6)
  {
LABEL_8:
    v30 = v6;
    goto LABEL_13;
  }
  if (v5)
  {
    v7 = +[ACXGizmoStateManager sharedStateManager];
    uint64_t v8 = [v7 stateForDevice:v5];
    gizmoState = v6->_gizmoState;
    v6->_gizmoState = (ACXGizmoState *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.AppConduit.CompanionSyncConnection", v10);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_device, a3);
    v13 = [(ACXCompanionSyncConnection *)v6 device];
    [v13 addObserver:v6];

    uint64_t v14 = +[ACXAvailableApplicationManager sharedApplicationManager];
    applicationManager = v6->_applicationManager;
    v6->_applicationManager = (ACXAvailableApplicationManager *)v14;

    v16 = [ACXInstallQueue alloc];
    v17 = [(ACXCompanionSyncConnection *)v6 device];
    v18 = [(ACXInstallQueue *)v16 initWithDevice:v17];
    installQueue = v6->_installQueue;
    v6->_installQueue = v18;

    v20 = [ACXLocalAppStoreInstallQueue alloc];
    v21 = [(ACXCompanionSyncConnection *)v6 device];
    v22 = [(ACXLocalAppStoreInstallQueue *)v20 initWithDevice:v21];
    appStoreLocalQueue = v6->_appStoreLocalQueue;
    v6->_appStoreLocalQueue = v22;

    [(ACXCompanionSyncConnection *)v6 _onQueue_configureRemoteAppListsAndFetchSystemAppsIfNeeded];
    if ([v5 isReachable])
    {
      v24 = [(ACXCompanionSyncConnection *)v6 remoteAppList];
      [v24 remoteDeviceConnected];
    }
    v25 = [(ACXCompanionSyncConnection *)v6 internalQueue];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001F684;
    v34[3] = &unk_10008CD30;
    v26 = v6;
    v35 = v26;
    sub_100006BB8(v25, v34);

    v27 = [(ACXCompanionSyncConnection *)v26 gizmoState];
    unsigned int v28 = [v27 needsReunionSync];

    if (v28)
    {
      v29 = [(ACXCompanionSyncConnection *)v26 internalQueue];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10001F68C;
      v32[3] = &unk_10008CD30;
      v33 = v26;
      sub_100006BB8(v29, v32);
    }
    goto LABEL_8;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
  v30 = 0;
LABEL_13:

  return v30;
}

- (void)dealloc
{
  v3 = [(ACXCompanionSyncConnection *)self device];
  [v3 removeObserver:self];

  v4 = [(ACXCompanionSyncConnection *)self remoteRemovabilityManager];
  [v4 removeDelegate:self];

  v5.receiver = self;
  v5.super_class = (Class)ACXCompanionSyncConnection;
  [(ACXCompanionSyncConnection *)&v5 dealloc];
}

- (id)messager
{
  v2 = [(ACXCompanionSyncConnection *)self device];
  v3 = [v2 messager];

  return v3;
}

- (void)_onQueue_configureRemoteAppListsAndFetchSystemAppsIfNeeded
{
  v3 = [(ACXCompanionSyncConnection *)self remoteAppList];

  if (v3) {
    goto LABEL_17;
  }
  v4 = [(ACXCompanionSyncConnection *)self device];
  if ([v4 supportsRemoteAppList])
  {
    objc_super v5 = [v4 pairingStoreURL];
    v6 = sub_100007D84(v5);

    v7 = [(ACXCompanionSyncConnection *)self internalQueue];
    uint64_t v8 = +[ACXRemoteAppList remoteAppListForStorageBaseURL:v6 delegate:self queue:v7];
    remoteAppList = self->_remoteAppList;
    self->_remoteAppList = v8;

    if (!self->_remoteAppList && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3))
    {
      v16 = [v6 path];
      MOLogWrite();
    }
    v10 = [(ACXCompanionSyncConnection *)self remoteAppList];
    dispatch_queue_t v11 = [(ACXCompanionSyncConnection *)self internalQueue];
    [v10 addObserver:self queue:v11];

    v12 = +[ACXRemoteSystemAppList availableSystemAppListForStorageBaseURL:v6];
    availableSystemAppList = self->_availableSystemAppList;
    self->_availableSystemAppList = v12;

    if (self->_availableSystemAppList || qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_15;
    }
    uint64_t v14 = [v6 path];
    v16 = v14;
  }
  else
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_16;
    }
    v6 = [v4 idsDeviceIdentifier];
    uint64_t v14 = [v4 pairingID];
    v16 = v6;
    v17 = v14;
  }
  MOLogWrite();

LABEL_15:
LABEL_16:

LABEL_17:
  if ([(ACXCompanionSyncConnection *)self needsAvailableSystemAppFetch])
  {
    v15 = [(ACXCompanionSyncConnection *)self internalQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001F9F0;
    v18[3] = &unk_10008CD30;
    v18[4] = self;
    sub_100006BB8(v15, v18);
  }
}

- (void)_onQueue_configureRemoteRemovabilityManagerAndFetchRemoteRemovabilityStatus
{
  v3 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v11 = [(ACXCompanionSyncConnection *)self device];
  if ([v11 supportsTrackingAppRemovability])
  {
    v4 = [(ACXCompanionSyncConnection *)self remoteRemovabilityManager];

    if (v4)
    {
LABEL_5:
      [(ACXCompanionSyncConnection *)self _onQueue_fetchRemovabilityForRemoteApps];
      goto LABEL_9;
    }
    objc_super v5 = [v11 pairingStoreURL];
    v6 = sub_100007D84(v5);

    v7 = [(ACXCompanionSyncConnection *)self internalQueue];
    uint64_t v8 = +[ACXRemoteAppRemovabilityManager remoteRemovabilityManagerForStorageBaseURL:v6 delegate:self queue:v7];
    remoteRemovabilityManager = self->_remoteRemovabilityManager;
    self->_remoteRemovabilityManager = v8;

    if (self->_remoteRemovabilityManager)
    {

      goto LABEL_5;
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      v10 = [v6 path];
      MOLogWrite();
    }
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    MOLogWrite();
  }
LABEL_9:
}

- (void)reachabilityChangedForDevice:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ACXCompanionSyncConnection *)self device];
  unsigned int v6 = [v5 isReachable];

  if (v6)
  {
    v7 = [v4 idsDeviceIdentifier];
    uint64_t v8 = +[NSString stringWithFormat:@"device %@ became reachable", v7];

    [(ACXCompanionSyncConnection *)self performReunionSyncWithReason:v8];
    v9 = [(ACXCompanionSyncConnection *)self internalQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001FCF8;
    v11[3] = &unk_10008CD30;
    v11[4] = self;
    sub_100006BB8(v9, v11);
  }
  else
  {
    uint64_t v8 = [(ACXCompanionSyncConnection *)self internalQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001FD4C;
    v10[3] = &unk_10008CD30;
    v10[4] = self;
    sub_100006BB8(v8, v10);
  }
}

- (void)installAllApplications
{
  v3 = [(ACXCompanionSyncConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FE18;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)needsAvailableSystemAppFetch
{
  v3 = [(ACXCompanionSyncConnection *)self device];
  unsigned int v4 = [v3 supportsRemoteAppList];

  if (!v4) {
    return 0;
  }
  objc_super v5 = [(ACXCompanionSyncConnection *)self availableSystemAppList];
  unsigned int v6 = [(ACXCompanionSyncConnection *)self device];
  v7 = [v6 osBuildVersion];
  unsigned __int8 v8 = [v5 needsSyncForCurrentOSBuildVersion:v7];

  return v8;
}

- (void)markAllApplicationsAsRemoved
{
  v3 = [(ACXCompanionSyncConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020224;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)cancelPendingInstallations
{
  v3 = [(ACXCompanionSyncConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002047C;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)_onQueue_installFailedForWatchAppBundleID:(id)a3 companionBundleID:(id)a4 withError:(id)a5 appName:(id)a6 userInitiated:(BOOL)a7 userPresentableError:(id *)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a4;
  v18 = [(ACXCompanionSyncConnection *)self gizmoState];
  [v18 setInstallStatus:7 forApp:v14 companionBundleID:v17];

  v19 = sub_100051298(v15, v16, (void *)1);
  v20 = v19;
  if (v9)
  {
    v21 = [v19 domain];
    if (![v21 isEqualToString:@"ACXUserPresentableErrorDomain"]
      || [v20 code] != (id)9)
    {
      goto LABEL_27;
    }
    id v22 = v15;
    v23 = [v22 domain];
    if ([v23 isEqualToString:@"ACXErrorDomain"]
      && [v22 code] == (id)52)
    {
LABEL_26:

LABEL_27:
      goto LABEL_28;
    }
    v70 = [v22 domain];
    if ([v70 isEqualToString:IXErrorDomain] && objc_msgSend(v22, "code") == (id)24)
    {
      id v24 = v70;
LABEL_25:

      goto LABEL_26;
    }
    v25 = v23;
    v26 = [v22 domain];
    if ([v26 isEqualToString:AMSErrorDomain])
    {
      v68 = v25;
      id v27 = [v22 code];

      if (v27 == (id)100) {
        goto LABEL_28;
      }
    }
    else
    {
    }
    v21 = [(ACXCompanionSyncConnection *)self device];
    id v28 = v16;
    id v69 = v14;
    id v29 = v22;
    id v22 = v28;
    id v24 = v29;
    id v30 = v20;
    if (sub_100007CA8())
    {
      v31 = +[NSDate date];
      v64 = sub_10002EC4C(v31);

      v63 = (void *)MGCopyAnswer();
      v62 = (void *)MGCopyAnswer();
      v67 = (void *)MGCopyAnswer();
      v61 = [v21 productType];
      v60 = [v21 osVersion];
      v66 = [v21 osBuildVersion];
      v59 = [v21 watchSize];
      v58 = [v21 idsDeviceIdentifier];
      v57 = [v21 pairingID];
      v32 = [v24 userInfo];
      v56 = [v32 objectForKeyedSubscript:@"ConnectionIdentifier"];

      v33 = [v24 userInfo];
      v55 = [v33 objectForKeyedSubscript:@"ConnectionCreationDate"];

      v34 = [v24 userInfo];
      v50 = [v34 objectForKeyedSubscript:@"WifiAsserted"];

      v71 = v24;
      v35 = [v24 userInfo];
      v54 = [v35 objectForKeyedSubscript:@"IDSMessageID"];

      v49 = +[NSString stringWithFormat:@"Installation of %@ failed", v22];
      v53 = +[NSString stringWithFormat:@"%@ failed to install on your Apple Watch.\n\nPlease file a bug!", v22];
      objc_super v36 = [v30 userInfo];
      uint64_t v37 = [v36 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey];

      v38 = [v30 userInfo];
      v52 = [v38 objectForKeyedSubscript:NSLocalizedDescriptionKey];

      id v65 = v22;
      v48 = (void *)v37;
      if (v37) {
        +[NSString stringWithFormat:@"INTERNAL-ONLY MESSAGE: (%@) %@", v22, v37];
      }
      else {
      v51 = +[NSString stringWithFormat:@"INTERNAL-ONLY MESSAGE: %@", v49, v45];
      }
      v39 = v53;
      if (v52) {
        v39 = v52;
      }
      id v47 = v39;
      v40 = [v71 domain];
      v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%@/%@] [%@:%ld]: Failed to install %@ on Apple Watch", v67, v66, v40, [v71 code], v69);

      v41 = objc_opt_new();
      [v41 appendFormat:@"Steps to reproduce:\n\n\n\nAuto-Gathered Info:\n"];
      [v41 appendFormat:@"Time: %@\n", v64];
      [v41 appendFormat:@"IDS Device ID: %@\n", v58];
      [v41 appendFormat:@"Pairing ID: %@\n", v57];
      if (v54) {
        [v41 appendFormat:@"Failing IDS Message ID: %@\n", v54];
      }
      if (v56)
      {
        [v41 appendFormat:@"Failing Stream Name: %@\n", v56];
        v42 = sub_10002EC4C(v55);
        [v41 appendFormat:@"Connection Start Date: %@\n", v42];
        objc_msgSend(v41, "appendFormat:", @"WiFi Asserted: %c\n", (int)sub_100008300((int)objc_msgSend(v50, "BOOLValue")));
      }
      [v41 appendFormat:@"Error: %@\n", v71];
      [v41 appendFormat:@"Companion: %@ %@ (%@)\n", v63, v62, v67];
      [v41 appendFormat:@"Watch: %@ (%@) %@ (%@)\n", v61, v59, v60, v66];
      [v41 appendFormat:@"App Name: %@\n", v65];
      [v41 appendFormat:@"Bundle ID: %@\n", v69];
      id v43 = [v41 copy];
      sub_100006AB8(v51, v47, v46, v43);

      id v24 = v71;
      id v22 = v65;
    }
    v23 = v69;
    goto LABEL_25;
  }
LABEL_28:
  if (a8) {
    *a8 = v20;
  }

  return a8 != 0;
}

- (void)installSystemApplicationsWithBundleIDs:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(ACXCompanionSyncConnection *)self internalQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100020D4C;
  v11[3] = &unk_10008CA90;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_100006BB8(v8, v11);
}

- (void)installWatchAppWithBundleID:(id)a3 withProvisioningProfileInfo:(id)a4 completionWithError:(id)a5
{
}

- (void)_installWatchAppWithBundleID:(id)a3 withProvisioningProfileInfo:(id)a4 installationPendingBlock:(id)a5 completionWithError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ACXCompanionSyncConnection *)self internalQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100020F2C;
  v19[3] = &unk_10008D5F8;
  v19[4] = self;
  id v20 = v10;
  id v22 = v13;
  id v23 = v12;
  id v21 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v10;
  sub_100006BB8(v14, v19);
}

- (id)_appBundleFromURL:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 URLByAppendingPathComponent:@"Payload" isDirectory:1];
  objc_super v5 = +[NSFileManager defaultManager];
  id v6 = [v4 path];
  unsigned int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    unsigned __int8 v8 = +[NSFileManager defaultManager];
    id v9 = [v8 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:1 errorHandler:&stru_10008D638];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v16 = objc_msgSend(v15, "pathExtension", (void)v20);
          unsigned int v17 = [v16 isEqualToString:@"app"];

          if (v17)
          {
            id v18 = v15;
            goto LABEL_13;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    id v18 = 0;
LABEL_13:
  }
  else
  {
    id v18 = v3;
  }

  return v18;
}

- (void)installWatchAppAtURL:(id)a3 installOptions:(id)a4 size:(int64_t)a5 completionWithError:(id)a6
{
  id v9 = a3;
  id v79 = a4;
  id v10 = a6;
  uint64_t v11 = _kCFBundleDisplayNameKey;
  id v12 = +[NSSet setWithObjects:kCFBundleExecutableKey, kCFBundleIdentifierKey, _kCFBundleDisplayNameKey, kCFBundleNameKey, @"UIRequiredDeviceCapabilities", @"WKCompanionAppBundleIdentifier", 0];
  v75 = self;
  uint64_t v13 = [(ACXCompanionSyncConnection *)self _appBundleFromURL:v9];
  id v14 = v13;
  if (v13)
  {
    v77 = v12;
    v78 = (void (**)(void, void, void))v10;
    id v15 = sub_100007FEC(v13, v12);
    id v16 = v15;
    if (!v15)
    {
      v25 = [v14 path];
      sub_100007710((uint64_t)"-[ACXCompanionSyncConnection installWatchAppAtURL:installOptions:size:completionWithError:]", 690, @"ACXErrorDomain", 40, 0, 0, @"Failed to load Info.plist from app at URL %@", v26, (uint64_t)v25);
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      long long v22 = v10;
      if (v10) {
        (*((void (**)(id, uint64_t, id))v10 + 2))(v10, 8, v21);
      }
      long long v23 = v79;
      id v24 = v77;
      goto LABEL_59;
    }
    v73 = v9;
    unsigned int v17 = [v15 objectForKeyedSubscript:kCFBundleExecutableKey];
    objc_opt_class();
    id v18 = v17;
    if (objc_opt_isKindOfClass()) {
      id v76 = v18;
    }
    else {
      id v76 = 0;
    }

    if (!v76)
    {
      id v30 = [v14 path];
      sub_100007710((uint64_t)"-[ACXCompanionSyncConnection installWatchAppAtURL:installOptions:size:completionWithError:]", 699, @"ACXErrorDomain", 47, 0, 0, @"Failed to get bundle executable name from Info.plist at %@", v31, (uint64_t)v30);
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      long long v22 = v10;
      if (v10) {
        (*((void (**)(id, uint64_t, id))v10 + 2))(v10, 8, v21);
      }
      long long v23 = v79;
      id v24 = v77;
      goto LABEL_58;
    }
    id v27 = [v16 objectForKeyedSubscript:v11];
    objc_opt_class();
    id v28 = v27;
    if (objc_opt_isKindOfClass()) {
      CFStringRef v29 = (const __CFString *)v28;
    }
    else {
      CFStringRef v29 = 0;
    }
    long long v23 = v79;

    if (!v29)
    {
      v32 = [v16 objectForKeyedSubscript:kCFBundleNameKey];
      objc_opt_class();
      id v33 = v32;
      if (objc_opt_isKindOfClass()) {
        CFStringRef v34 = (const __CFString *)v33;
      }
      else {
        CFStringRef v34 = 0;
      }

      if (v34) {
        CFStringRef v29 = v34;
      }
      else {
        CFStringRef v29 = @"Unknown Name";
      }
    }
    v72 = (__CFString *)v29;
    v35 = [v16 objectForKeyedSubscript:kCFBundleIdentifierKey];
    objc_opt_class();
    id v36 = v35;
    if (objc_opt_isKindOfClass()) {
      id v37 = v36;
    }
    else {
      id v37 = 0;
    }

    if (!v37)
    {
      uint64_t v45 = [v14 path];
      sub_100007710((uint64_t)"-[ACXCompanionSyncConnection installWatchAppAtURL:installOptions:size:completionWithError:]", 716, @"ACXErrorDomain", 47, 0, 0, @"Failed to get watch bundle ID from Info.plist at %@", v46, (uint64_t)v45);
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      long long v22 = v78;
      if (v78) {
        ((void (**)(void, uint64_t, id))v78)[2](v78, 8, v21);
      }
      id v24 = v77;
      goto LABEL_57;
    }
    id v38 = [v79 installTargetType];
    if (v38 != (id)2)
    {
      v39 = [(ACXCompanionSyncConnection *)v75 appStoreLocalQueue];
      [v39 acknowledgeInstallationStartedForWatchApp:v37];
    }
    v40 = [v16 objectForKeyedSubscript:@"WKCompanionAppBundleIdentifier"];
    if (!v40)
    {
      id v47 = [v14 path];
      sub_100007710((uint64_t)"-[ACXCompanionSyncConnection installWatchAppAtURL:installOptions:size:completionWithError:]", 730, @"ACXErrorDomain", 47, 0, 0, @"Failed to get companion app bundle ID from Info.plist at %@", v48, (uint64_t)v47);
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      long long v22 = v78;
      if (v78) {
        ((void (**)(void, uint64_t, id))v78)[2](v78, 8, v21);
      }
      id v24 = v77;
      goto LABEL_56;
    }
    uint64_t v70 = [v16 objectForKeyedSubscript:@"UIRequiredDeviceCapabilities"];
    v41 = [v79 sinfData];

    v71 = v40;
    if (v41)
    {
      v42 = [v79 sinfData];
      getuid();
      getgid();
      v86[1] = 0;
      char v43 = MIUpdateSinfWithData();
      id v21 = 0;

      if ((v43 & 1) == 0)
      {
        id v65 = [v9 path];
        v55 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection installWatchAppAtURL:installOptions:size:completionWithError:]", 741, @"ACXErrorDomain", 41, 0, 0, @"Failed to create sinf for app %@ at URL %@: %@", v54, (uint64_t)v37);

        long long v22 = v78;
        if (v78) {
          ((void (**)(void, uint64_t, void *))v78)[2](v78, 8, v55);
        }

        id v24 = v77;
        goto LABEL_54;
      }
      v44 = v21;
    }
    else
    {
      v44 = 0;
    }
    v49 = [v79 iTunesMetadata];

    if (!v49)
    {
      v67 = v16;
      id v21 = v44;
      goto LABEL_50;
    }
    v50 = [v79 iTunesMetadata];
    v51 = [v50 dictionaryRepresentation];
    v52 = [v9 URLByAppendingPathComponent:@"iTunesMetadata.plist"];
    v86[0] = v44;
    unsigned __int8 v53 = objc_msgSend(v51, "ACX_writeToURL:format:options:error:", v52, 200, 268435457, v86);
    id v21 = v86[0];

    if (v53)
    {
      v67 = v16;
      long long v23 = v79;
LABEL_50:
      BOOL v69 = v38 == (id)2;
      v56 = [(ACXCompanionSyncConnection *)v75 gizmoState];
      [v56 setInstallStatus:1 forApp:v37 companionBundleID:v71];

      unsigned __int8 v57 = [v23 isUserInitiated];
      v58 = [(ACXCompanionSyncConnection *)v75 installQueue];
      v68 = [(ACXCompanionSyncConnection *)v75 gizmoState];
      v59 = [v68 preferencesForApplicationWithIdentifier:v37];
      unsigned __int8 v60 = [v79 isUserInitiated];
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v80[2] = sub_10002245C;
      v80[3] = &unk_10008D660;
      v80[4] = v75;
      id v81 = v37;
      id v82 = v71;
      v83 = v72;
      unsigned __int8 v85 = v57;
      v84 = v78;
      LOBYTE(v64) = v60;
      id v9 = v73;
      long long v22 = v78;
      [v58 installWatchAppAtURL:v73 watchBundleID:v81 companionAppBundleID:v82 withPriority:2 appSettings:v59 isPlaceholder:v69 isUserInitiated:v64 size:a5 requiredCapabilities:v70 completion:v80];

      v40 = v71;
      long long v23 = v79;

      v61 = (void *)v70;
      id v24 = v77;
      id v16 = v67;
LABEL_55:

LABEL_56:
LABEL_57:

LABEL_58:
LABEL_59:

      goto LABEL_60;
    }
    id v9 = v73;
    v66 = [v73 path];
    v63 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection installWatchAppAtURL:installOptions:size:completionWithError:]", 751, @"ACXErrorDomain", 42, 0, 0, @"Failed to create iTunesMetadata.plist for app %@ at URL %@: %@", v62, (uint64_t)v37);

    long long v22 = v78;
    if (v78) {
      ((void (**)(void, uint64_t, void *))v78)[2](v78, 8, v63);
    }

    long long v23 = v79;
    id v24 = v77;
    v40 = v71;
LABEL_54:
    v61 = (void *)v70;
    goto LABEL_55;
  }
  v19 = [v9 path];
  sub_100007710((uint64_t)"-[ACXCompanionSyncConnection installWatchAppAtURL:installOptions:size:completionWithError:]", 681, @"ACXErrorDomain", 46, 0, 0, @"Failed to locate app bundle from root URL %@", v20, (uint64_t)v19);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  long long v22 = v10;
  if (v10) {
    (*((void (**)(id, uint64_t, id))v10 + 2))(v10, 8, v21);
  }
  long long v23 = v79;
  id v24 = v12;
LABEL_60:
}

- (void)_installQueuedOrCompletedForWatchBundleID:(id)a3 companionAppBundleID:(id)a4 withName:(id)a5 userInitiated:(BOOL)a6 withError:(id)a7 withCompletion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v19 = v18;
  if (v17)
  {
    uint64_t v20 = [(ACXCompanionSyncConnection *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000225E8;
    block[3] = &unk_10008D688;
    block[4] = self;
    id v22 = v14;
    id v23 = v17;
    id v24 = v15;
    id v26 = v19;
    id v25 = v16;
    BOOL v27 = a6;
    dispatch_sync(v20, block);
  }
  else if (v18)
  {
    (*((void (**)(id, uint64_t, void))v18 + 2))(v18, 1, 0);
  }
}

- (id)remoteAppWithBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100022950;
  id v17 = sub_100022960;
  objc_super v5 = [(ACXCompanionSyncConnection *)self applicationManager];
  id v18 = [v5 gizmoAppWithBundleID:v4];

  id v6 = (void *)v14[5];
  if (!v6)
  {
    unsigned int v7 = [(ACXCompanionSyncConnection *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022968;
    block[3] = &unk_10008CA18;
    id v12 = &v13;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(v7, block);

    id v6 = (void *)v14[5];
  }
  id v8 = v6;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)removeWatchAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXCompanionSyncConnection *)self internalQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100022AB0;
  v11[3] = &unk_10008CA90;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_100006BB8(v8, v11);
}

- (void)_onQueue_fetchRemovabilityForRemoteApps
{
  id v3 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(ACXCompanionSyncConnection *)self device];
  if ([v5 isReachable])
  {
    if ([(ACXCompanionSyncConnection *)self remoteRemovabilityFetchRunning])
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
LABEL_8:
        id v4 = [v5 idsDeviceIdentifier];
        MOLogWrite();
      }
    }
    else
    {
      [(ACXCompanionSyncConnection *)self setRemoteRemovabilityFetchRunning:1];
      [(ACXCompanionSyncConnection *)self _onQueue_fetchRemovabilityForRemoteAppsWithRetryCount:0];
    }
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    goto LABEL_8;
  }
}

- (void)_onQueue_fetchRemovabilityForRemoteAppsWithRetryCount:(unint64_t)a3
{
  id v5 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ACXCompanionSyncConnection *)self messager];
  id v7 = [(ACXCompanionSyncConnection *)self device];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002302C;
  v8[3] = &unk_10008D6D8;
  v8[4] = self;
  v8[5] = a3;
  [v6 sendMessage:&off_100097A80 toDevice:v7 withPriority:200 timeout:@"remote removability fetch" logDescription:v8 handleReply:120.0];
}

- (void)_onQueue_handleRemoteRemovabilityFetchResponse:(id)a3
{
  id v22 = a3;
  id v4 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [v22 message];
  id v6 = [v5 objectForKeyedSubscript:@"RA"];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = [v22 message];
  id v10 = [v9 objectForKeyedSubscript:@"RU"];
  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  uint64_t v13 = [v22 message];
  id v14 = [v13 objectForKeyedSubscript:@"RS"];
  objc_opt_class();
  id v15 = v14;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v20 = v12;
    id v21 = v16;
    id v19 = v8;
    MOLogWrite();
  }
  if (v8)
  {
    id v17 = [(ACXCompanionSyncConnection *)self remoteRemovabilityManager];
    id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:v12];
    objc_msgSend(v17, "setRemoteRemovabilityData:withDBUUID:sequenceNumber:", v8, v18, objc_msgSend(v16, "unsignedIntegerValue"));

LABEL_18:
    goto LABEL_19;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v17 = objc_msgSend(v22, "message", v19, v20, v21);
    id v19 = v17;
    MOLogWrite();
    goto LABEL_18;
  }
LABEL_19:
  -[ACXCompanionSyncConnection setRemoteRemovabilityFetchRunning:](self, "setRemoteRemovabilityFetchRunning:", 0, v19);
}

- (void)_onQueue_fetchAvailableSystemApps
{
  id v3 = [(ACXCompanionSyncConnection *)self device];
  unsigned __int8 v4 = [v3 isReachable];

  if (v4)
  {
    [(ACXCompanionSyncConnection *)self _onQueue_fetchAvailableSystemAppsWithRetryCount:0];
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v6 = [(ACXCompanionSyncConnection *)self device];
    id v5 = [v6 idsDeviceIdentifier];
    MOLogWrite();
  }
}

- (void)_onQueue_fetchAvailableSystemAppsWithRetryCount:(unint64_t)a3
{
  if ([(ACXCompanionSyncConnection *)self availableSystemAppFetchRunning])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  else
  {
    [(ACXCompanionSyncConnection *)self setAvailableSystemAppFetchRunning:1];
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      unint64_t v11 = a3;
      MOLogWrite();
    }
    id v5 = [(ACXCompanionSyncConnection *)self applicationManager];
    id v6 = [v5 bundleIDsOfLocallyAvailableSystemApps];

    v13[0] = @"T";
    v13[1] = @"BL";
    v14[0] = &off_100097630;
    id v7 = [v6 allObjects];
    v14[1] = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

    id v9 = [(ACXCompanionSyncConnection *)self messager];
    id v10 = [(ACXCompanionSyncConnection *)self device];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000238D8;
    v12[3] = &unk_10008D6D8;
    v12[4] = self;
    v12[5] = a3;
    [v9 sendMessage:v8 toDevice:v10 withPriority:200 timeout:@"system app fetch" logDescription:v12 handleReply:120.0];
  }
}

- (void)_onQueue_handleSADAppInfoResponse:(id)a3
{
  id v4 = a3;
  id v5 = [v4 message];
  id v6 = [v5 objectForKeyedSubscript:@"IL"];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = [v4 message];
  id v10 = [v9 objectForKeyedSubscript:@"BL"];
  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (!v8 || (objc_opt_class(), (sub_1000070BC(v8) & 1) == 0))
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_33;
    }
LABEL_32:
    id v28 = [v4 message];
    MOLogWrite();

    goto LABEL_33;
  }
  if (!v12 || (objc_opt_class(), (sub_1000070BC(v12) & 1) == 0))
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  v32 = self;
  uint64_t v13 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v31 = v8;
  id v14 = v8;
  id v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v20 = [objc_alloc((Class)ACXRemoteApplication) initWithSerializedDictionary:v19];
        if (v20)
        {
          [v13 addObject:v20];
        }
        else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          id v28 = v19;
          MOLogWrite();
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v16);
  }

  self = v32;
  id v21 = [(ACXCompanionSyncConnection *)v32 device];
  id v22 = [v21 osBuildVersion];

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v23 = objc_msgSend(v13, "count", v28);
    id v24 = [(ACXCompanionSyncConnection *)v32 device];
    CFStringRef v29 = [v24 pairingID];
    id v30 = v22;
    id v28 = v23;
    MOLogWrite();
  }
  id v25 = [(ACXCompanionSyncConnection *)v32 availableSystemAppList];
  [v25 setAvailableSystemApps:v13 bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability:v12 forRemoteOSBuildVersion:v22];

  id v8 = v31;
LABEL_33:
  -[ACXCompanionSyncConnection setAvailableSystemAppFetchRunning:](self, "setAvailableSystemAppFetchRunning:", 0, v28);
  id v26 = [(ACXCompanionSyncConnection *)self gizmoState];
  unsigned int v27 = [v26 needsReunionSync];

  if (v27)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    [(ACXCompanionSyncConnection *)self _onQueue_beginReunionSync];
  }
}

- (BOOL)_value:(id)a3 isDifferentFrom:(id)a4
{
  return sub_100009800(a3, a4);
}

- (void)_onQueue_processReunionSyncMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self applicationManager];
  [(ACXCompanionSyncConnection *)self _onQueue_processReunionSyncMessage:v4 withAppManager:v5];
}

- (void)_onQueue_processReunionSyncMessage:(id)a3 withAppManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(ACXCompanionSyncConnection *)self device];
  id v10 = [v9 osVersion];

  id v11 = [(ACXCompanionSyncConnection *)self device];
  unsigned int v198 = [v11 supportsStandaloneApps];

  id v12 = [(ACXCompanionSyncConnection *)self device];
  unsigned int v13 = [v12 supportsRemoteAppList];

  id v14 = [(ACXCompanionSyncConnection *)self device];
  unsigned __int8 v15 = [v14 deletableSystemAppStateIsMirrored];

  id v16 = [(ACXCompanionSyncConnection *)self gizmoState];
  unsigned __int8 v17 = [v16 alwaysInstallApps];

  id v18 = [(ACXCompanionSyncConnection *)self device];
  id v185 = [v18 cpuType];

  id v19 = [(ACXCompanionSyncConnection *)self device];
  id v183 = [v19 cpuSubtype];

  id v20 = [v6 message];
  if ([(ACXCompanionSyncConnection *)self needsAvailableSystemAppFetch])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    id v21 = [(ACXCompanionSyncConnection *)self gizmoState];
    [v21 setNeedsReunionSync:1];

    [(ACXCompanionSyncConnection *)self setReunionSyncRunning:0];
    [(ACXCompanionSyncConnection *)self _onQueue_configureRemoteAppListsAndFetchSystemAppsIfNeeded];
    goto LABEL_275;
  }
  unsigned __int8 v181 = v15;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  id v22 = [v20 objectForKeyedSubscript:@"T"];
  if ([v22 unsignedCharValue] != 2)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      unint64_t v155 = [v22 unsignedCharValue];
      MOLogWrite();
    }
    -[ACXCompanionSyncConnection setReunionSyncRunning:](self, "setReunionSyncRunning:", 0, v155);
    goto LABEL_274;
  }
  unsigned __int8 v172 = v17;
  v196 = self;
  id v23 = [v20 objectForKeyedSubscript:@"IA"];
  objc_opt_class();
  id v24 = v23;
  if (objc_opt_isKindOfClass()) {
    id v25 = v24;
  }
  else {
    id v25 = 0;
  }

  if (!v25)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_27;
    }
LABEL_26:
    MOLogWrite();
LABEL_27:
    [(ACXCompanionSyncConnection *)v196 setReunionSyncRunning:0];
    goto LABEL_273;
  }
  objc_opt_class();
  if ((sub_1000070BC(v25) & 1) == 0)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  v169 = v25;
  id v26 = [v20 objectForKeyedSubscript:@"IP"];
  objc_opt_class();
  id v27 = v26;
  if (objc_opt_isKindOfClass()) {
    id v28 = v27;
  }
  else {
    id v28 = 0;
  }

  v170 = v28;
  if (v28 && [v28 count])
  {
    objc_opt_class();
    if ((sub_1000070BC(v28) & 1) == 0)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
        MOLogWrite();
      }
      [(ACXCompanionSyncConnection *)v196 setReunionSyncRunning:0];
      goto LABEL_272;
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      unint64_t v155 = (unint64_t)v28;
      MOLogWrite();
    }
  }
  CFStringRef v29 = objc_msgSend(v20, "objectForKeyedSubscript:", @"DBU", v155);
  objc_opt_class();
  id v30 = v29;
  v162 = v22;
  if (objc_opt_isKindOfClass()) {
    id v161 = v30;
  }
  else {
    id v161 = 0;
  }

  id v31 = [v20 objectForKeyedSubscript:@"DBS"];
  objc_opt_class();
  id v32 = v31;
  if (objc_opt_isKindOfClass()) {
    id v167 = v32;
  }
  else {
    id v167 = 0;
  }

  long long v33 = [(ACXCompanionSyncConnection *)v196 device];
  unsigned int v34 = [v33 supportsTrackingAppRemovability];

  if (v34)
  {
    long long v35 = [v20 objectForKeyedSubscript:@"RU"];
    objc_opt_class();
    id v36 = v35;
    if (objc_opt_isKindOfClass()) {
      id v168 = v36;
    }
    else {
      id v168 = 0;
    }

    id v37 = [v20 objectForKeyedSubscript:@"RS"];
    objc_opt_class();
    id v38 = v37;
    if (objc_opt_isKindOfClass()) {
      id v166 = v38;
    }
    else {
      id v166 = 0;
    }
  }
  else
  {
    id v166 = 0;
    id v168 = 0;
  }
  v39 = [v20 objectForKeyedSubscript:@"BL"];
  objc_opt_class();
  id v40 = v39;
  if (objc_opt_isKindOfClass()) {
    id v41 = v40;
  }
  else {
    id v41 = 0;
  }

  if (v41)
  {
    objc_opt_class();
    if (sub_1000070BC(v41))
    {
      v42 = [(ACXCompanionSyncConnection *)v196 availableSystemAppList];
      [v42 setInstallableSystemAppBundleIDsExcludingCompanionState:v41];
    }
    else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  v200 = [v7 allAvailableApps];
  v194 = [v7 allAvailablePlaceholders];
  if (v13)
  {
    char v43 = [(ACXCompanionSyncConnection *)v196 availableSystemAppList];
    uint64_t v44 = [v43 installableSystemAppToCompanionAppIdentifierMap];

    v202 = (void *)v44;
    if (v44) {
      goto LABEL_66;
    }
    id v45 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10005BACC();
    }

    uint64_t v46 = [v7 locallyAvailableSystemAppBundleIDToCompanionBundleIDMapping];
  }
  else
  {
    uint64_t v46 = [v7 locallyAvailableSystemAppBundleIDToCompanionBundleIDMappingForPreWatchOSSix];
  }
  v202 = (void *)v46;
LABEL_66:
  v160 = v41;
  v163 = v20;
  id v164 = v7;
  v187 = v10;
  id v165 = v6;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v156 = v202;
    MOLogWrite();
  }
  id v47 = objc_opt_new();
  v171 = objc_opt_new();
  v188 = objc_opt_new();
  v192 = objc_opt_new();
  v158 = objc_opt_new();
  v159 = objc_opt_new();
  v190 = objc_opt_new();
  long long v247 = 0u;
  long long v248 = 0u;
  long long v249 = 0u;
  long long v250 = 0u;
  id obj = v169;
  id v48 = [obj countByEnumeratingWithState:&v247 objects:v253 count:16];
  if (v48)
  {
    id v49 = v48;
    uint64_t v50 = *(void *)v248;
    do
    {
      v51 = 0;
      do
      {
        if (*(void *)v248 != v50) {
          objc_enumerationMutation(obj);
        }
        v52 = *(void **)(*((void *)&v247 + 1) + 8 * (void)v51);
        unsigned __int8 v53 = objc_msgSend(v52, "objectForKeyedSubscript:", @"B", v156);
        objc_opt_class();
        id v54 = v53;
        if (objc_opt_isKindOfClass()) {
          id v55 = v54;
        }
        else {
          id v55 = 0;
        }

        v56 = [v52 objectForKeyedSubscript:@"C"];
        objc_opt_class();
        id v57 = v56;
        if (objc_opt_isKindOfClass()) {
          id v58 = v57;
        }
        else {
          id v58 = 0;
        }

        if (v55)
        {
          if (v58)
          {
            [v47 addObject:v55];
            if (![v194 containsObject:v58])
            {
              v59 = [v202 objectForKeyedSubscript:v55];

              unsigned __int8 v60 = [v200 objectForKeyedSubscript:v55];
              v61 = v60;
              if (v60)
              {
                if (![v60 isSystemApp] || v59)
                {
                  if (!v59)
                  {
                    if ([v61 isTrusted])
                    {
                      if ([v61 isEligibleForWatchAppInstall])
                      {
                        uint64_t v62 = [v52 objectForKeyedSubscript:@"RI"];
                        if (v62)
                        {
                          id v63 = [v61 applicationMode];
                          if ((v63 == (id)2) != sub_1000071C8(v62, 0))
                          {
                            uint64_t v64 = v62;
                            if (v63 == (id)2)
                            {
                              if (qword_1000A5608)
                              {
                                CFStringRef v65 = @"Reunion: %@ available app is an independent watch app but installed app is not; updating to independent watch app";
                                if (*(int *)(qword_1000A5608 + 44) <= 4) {
                                  goto LABEL_163;
                                }
                              }
LABEL_162:
                              id v156 = v55;
                              MOLogWrite();
                              goto LABEL_163;
                            }
                            if (!qword_1000A5608) {
                              goto LABEL_162;
                            }
                            CFStringRef v65 = @"Reunion: %@ installed app is an independent watch app but available app is not; updating to watch app dependent on phone app";
                            if (*(int *)(qword_1000A5608 + 44) >= 5) {
                              goto LABEL_162;
                            }
LABEL_163:
                            objc_msgSend(v171, "addObject:", v55, v65, v156);
LABEL_164:

LABEL_129:
                            goto LABEL_130;
                          }
                        }
                        v173 = v62;
                        int v174 = [v61 isProfileValidated];
                        v73 = [v52 objectForKeyedSubscript:@"P"];
                        int v74 = sub_1000071C8(v73, 0);

                        if (v174 != v74)
                        {
                          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                          {
                            id v157 = (id)(int)sub_100008300(v174);
                            sub_100008300(v74);
                            id v156 = v55;
                            goto LABEL_136;
                          }
LABEL_137:
                          v75 = v171;
LABEL_138:
                          objc_msgSend(v75, "addObject:", v55, v156);
LABEL_139:
                          uint64_t v64 = v173;
                          goto LABEL_164;
                        }
                        if (v198
                          && [v61 applicationMode] != (id)1
                          && ([v61 isProfileValidated] & 1) == 0)
                        {
                          [v192 addObject:v55];
                          goto LABEL_139;
                        }
                        if (([v61 isCompatibleWithOSVersion:v187] & 1) == 0)
                        {
                          uint64_t v64 = v173;
                          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                          {
                            id v156 = v187;
                            id v157 = v55;
                            MOLogWrite();
                          }
                          id v79 = objc_msgSend(v61, "companionAppBundleID", v156);
                          v80 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:4 companionBundleID:v79];
                          [v190 setObject:v80 forKeyedSubscript:v55];

                          goto LABEL_164;
                        }
                        if (([v61 isCompatibleWithCPUType:v185 subtype:v183] & 1) == 0)
                        {
                          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                          {
                            id v157 = v185;
                            id v156 = v55;
                            MOLogWrite();
                          }
                          id v81 = objc_msgSend(v61, "companionAppBundleID", v156);
                          id v82 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:4 companionBundleID:v81];
                          [v190 setObject:v82 forKeyedSubscript:v55];

                          goto LABEL_139;
                        }
                        id v76 = [v52 objectForKeyedSubscript:@"BE"];

                        if (v76)
                        {
                          unsigned int v175 = [v61 isBetaApp];
                          v77 = [v52 objectForKeyedSubscript:@"BE"];
                          unsigned int v78 = sub_1000071C8(v77, 0);

                          if (v78 && (v175 & 1) == 0)
                          {
                            if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
                              goto LABEL_137;
                            }
                            id v156 = v55;
                            goto LABEL_136;
                          }
                          if (((v78 | v175 ^ 1) & 1) == 0)
                          {
                            if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
                              goto LABEL_137;
                            }
                            id v156 = v55;
LABEL_136:
                            MOLogWrite();
                            goto LABEL_137;
                          }
                        }
                        v176 = [v61 bundleVersion];
                        v83 = [v52 objectForKeyedSubscript:@"W"];
                        objc_opt_class();
                        uint64_t v84 = sub_100022400(v83);

                        unsigned __int8 v85 = (void *)v84;
                        v86 = v176;
                        if (-[ACXCompanionSyncConnection _value:isDifferentFrom:](v196, "_value:isDifferentFrom:"))
                        {
                          uint64_t v64 = v173;
                          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                          {
                            id v157 = v176;
                            id v156 = v55;
                            goto LABEL_171;
                          }
                          goto LABEL_172;
                        }

                        v177 = [v61 bundleShortVersion];
                        v88 = [v52 objectForKeyedSubscript:@"V"];
                        objc_opt_class();
                        uint64_t v89 = sub_100022400(v88);

                        v90 = (void *)v89;
                        v86 = v177;
                        if (-[ACXCompanionSyncConnection _value:isDifferentFrom:](v196, "_value:isDifferentFrom:"))
                        {
                          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                          {
                            id v157 = v177;
                            id v156 = v55;
                            goto LABEL_184;
                          }
                          goto LABEL_185;
                        }

                        v178 = [v61 watchKitVersion];
                        v91 = [v52 objectForKeyedSubscript:@"K"];
                        objc_opt_class();
                        uint64_t v92 = sub_100022400(v91);

                        v90 = (void *)v92;
                        v86 = v178;
                        if ([(ACXCompanionSyncConnection *)v196 _value:v178 isDifferentFrom:v90])
                        {
                          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                          {
                            id v157 = v178;
                            id v156 = v55;
LABEL_184:
                            MOLogWrite();
                          }
LABEL_185:
                          v87 = v90;
                          uint64_t v64 = v173;
                        }
                        else
                        {

                          v86 = [v61 watchKitAppExecutableHash];
                          v93 = [v52 objectForKeyedSubscript:@"EH"];
                          objc_opt_class();
                          v179 = sub_100022400(v93);

                          if (v86 && v179 && ([v86 isEqualToString:v179] & 1) == 0)
                          {
                            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                            {
                              id v156 = v55;
                              MOLogWrite();
                            }
                            uint64_t v64 = v173;
                            v87 = v179;
                          }
                          else
                          {

                            v86 = [v61 companionAppBundleID];
                            v94 = [v52 objectForKeyedSubscript:@"C"];
                            objc_opt_class();
                            v95 = sub_100022400(v94);

                            unsigned __int8 v85 = v95;
                            if (![(ACXCompanionSyncConnection *)v196 _value:v86 isDifferentFrom:v95])
                            {

                              v75 = v192;
                              goto LABEL_138;
                            }
                            uint64_t v64 = v173;
                            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                            {
                              id v157 = v86;
                              id v156 = v55;
LABEL_171:
                              MOLogWrite();
                            }
LABEL_172:
                            v87 = v85;
                          }
                        }

                        goto LABEL_163;
                      }
                      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                      {
                        id v156 = v55;
LABEL_127:
                        MOLogWrite();
                      }
                    }
                    else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                    {
                      id v156 = v55;
                      goto LABEL_127;
                    }
                    v71 = objc_msgSend(v61, "companionAppBundleID", v156);
                    v72 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:4 companionBundleID:v71];
                    [v190 setObject:v72 forKeyedSubscript:v55];

                    goto LABEL_129;
                  }
LABEL_116:
                  objc_msgSend(v192, "addObject:", v55, v156);
                  goto LABEL_129;
                }
              }
              else if (v59)
              {
                goto LABEL_116;
              }
              v66 = [v52 objectForKeyedSubscript:@"RI"];
              unsigned int v67 = sub_1000071C8(v66, 0);

              v68 = [v52 objectForKeyedSubscript:@"LD"];
              unsigned int v69 = sub_1000071C8(v68, 0);

              if ((v198 & v67) == 1)
              {
                if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                {
                  id v156 = v55;
                  MOLogWrite();
                }
              }
              else
              {
                if (!v69)
                {
                  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                  {
                    id v156 = v55;
                    MOLogWrite();
                  }
                  uint64_t v70 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:companionBundleID:](ACXGizmoApplicationInstallStatusItem, "itemWithStatus:companionBundleID:", 4, v58, v156);
                  [v190 setObject:v70 forKeyedSubscript:v55];

                  goto LABEL_129;
                }
                if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                {
                  id v156 = v55;
                  MOLogWrite();
                }
              }
              goto LABEL_116;
            }
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              id v156 = v55;
              id v157 = v58;
              MOLogWrite();
            }
            objc_msgSend(v192, "addObject:", v55, v156, v157);
          }
          else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
          {
            id v156 = v52;
            goto LABEL_93;
          }
        }
        else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          id v156 = v52;
LABEL_93:
          MOLogWrite();
        }
LABEL_130:

        v51 = (char *)v51 + 1;
      }
      while (v49 != v51);
      id v96 = [obj countByEnumeratingWithState:&v247 objects:v253 count:16];
      id v49 = v96;
    }
    while (v96);
  }

  if (!v170) {
    goto LABEL_243;
  }
  long long v245 = 0u;
  long long v246 = 0u;
  long long v243 = 0u;
  long long v244 = 0u;
  id v97 = v170;
  id v98 = [v97 countByEnumeratingWithState:&v243 objects:v252 count:16];
  if (!v98) {
    goto LABEL_242;
  }
  id v99 = v98;
  uint64_t v100 = *(void *)v244;
  do
  {
    for (i = 0; i != v99; i = (char *)i + 1)
    {
      if (*(void *)v244 != v100) {
        objc_enumerationMutation(v97);
      }
      v102 = *(void **)(*((void *)&v243 + 1) + 8 * i);
      objc_msgSend(v47, "addObject:", v102, v156);
      v103 = [v200 objectForKeyedSubscript:v102];
      v104 = [v202 objectForKeyedSubscript:v102];

      if (v104) {
        unsigned int v105 = v198;
      }
      else {
        unsigned int v105 = 0;
      }
      if (v105 == 1)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          id v156 = v102;
          MOLogWrite();
        }
        goto LABEL_240;
      }
      if (!v103)
      {
        if (v104)
        {
LABEL_226:
          [v188 addObject:v102];
          goto LABEL_240;
        }
LABEL_227:
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          id v156 = v102;
          MOLogWrite();
        }
        v108 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:companionBundleID:](ACXGizmoApplicationInstallStatusItem, "itemWithStatus:companionBundleID:", 4, 0, v156);
        [v190 setObject:v108 forKeyedSubscript:v102];

        goto LABEL_240;
      }
      unsigned int v106 = [v103 isSystemApp];
      if (v106) {
        BOOL v107 = v104 == 0;
      }
      else {
        BOOL v107 = 0;
      }
      if (v107) {
        goto LABEL_227;
      }
      if (v106) {
        goto LABEL_226;
      }
      if ([v103 isTrusted])
      {
        if ([v103 isCompatibleWithOSVersion:v187])
        {
          if ([v103 isEligibleForWatchAppInstall]) {
            goto LABEL_226;
          }
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            id v156 = v102;
            goto LABEL_238;
          }
        }
        else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          id v156 = v102;
LABEL_238:
          MOLogWrite();
        }
        v111 = objc_msgSend(v103, "companionAppBundleID", v156);
        v112 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:4 companionBundleID:v111];
        [v190 setObject:v112 forKeyedSubscript:v102];

        goto LABEL_240;
      }
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v156 = v102;
        MOLogWrite();
      }
      v109 = objc_msgSend(v103, "companionAppBundleID", v156);
      v110 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:4 companionBundleID:v109];
      [v190 setObject:v110 forKeyedSubscript:v102];

LABEL_240:
    }
    id v99 = [v97 countByEnumeratingWithState:&v243 objects:v252 count:16];
  }
  while (v99);
LABEL_242:

LABEL_243:
  v236[0] = _NSConcreteStackBlock;
  v236[1] = 3221225472;
  v236[2] = sub_100025E2C;
  v236[3] = &unk_10008D700;
  id v113 = v47;
  id v237 = v113;
  id v238 = v187;
  int v241 = (int)v185;
  int v242 = (int)v183;
  id v114 = v158;
  id v239 = v114;
  id v115 = v190;
  id v240 = v115;
  [v200 enumerateKeysAndObjectsUsingBlock:v236];
  v231[0] = _NSConcreteStackBlock;
  v231[1] = 3221225472;
  v231[2] = sub_100025F80;
  v231[3] = &unk_10008D728;
  id v116 = v113;
  id v232 = v116;
  unsigned __int8 v235 = v181;
  id v117 = v159;
  id v233 = v117;
  id v118 = v114;
  id v234 = v118;
  [v202 enumerateKeysAndObjectsUsingBlock:v231];
  v219[0] = _NSConcreteStackBlock;
  v219[1] = 3221225472;
  v219[2] = sub_100025FF4;
  v219[3] = &unk_10008D750;
  id v199 = v194;
  id v220 = v199;
  unsigned __int8 v230 = v181;
  id v119 = v117;
  id v221 = v119;
  id v120 = v115;
  id v222 = v120;
  id v195 = v116;
  id v223 = v195;
  id v121 = v202;
  id v224 = v121;
  id v122 = v200;
  id v225 = v122;
  id v123 = v188;
  id v226 = v123;
  id v124 = v171;
  id v227 = v124;
  id v125 = v192;
  id v228 = v125;
  id v126 = v118;
  id v229 = v126;
  v127 = objc_retainBlock(v219);
  v128 = [(ACXCompanionSyncConnection *)v196 gizmoState];
  v208[0] = _NSConcreteStackBlock;
  v208[1] = 3221225472;
  v208[2] = sub_1000263B8;
  v208[3] = &unk_10008D778;
  unsigned __int8 v217 = v181;
  id v193 = v119;
  id v209 = v193;
  id v201 = v121;
  id v210 = v201;
  id v186 = v120;
  id v211 = v186;
  id v191 = v123;
  id v212 = v191;
  id v203 = v122;
  id v213 = v203;
  id v189 = v124;
  id v214 = v189;
  id v184 = v126;
  id v215 = v184;
  unsigned __int8 v218 = v172;
  v180 = v127;
  id v182 = v125;
  id v216 = v182;
  [v128 iterateInstallStatusAndClearNeedsReunionSyncWithIterator:v127 completion:v208];

  long long v206 = 0u;
  long long v207 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  id v129 = obj;
  id v130 = [v129 countByEnumeratingWithState:&v204 objects:v251 count:16];
  if (v130)
  {
    id v131 = v130;
    uint64_t v132 = *(void *)v205;
    do
    {
      for (j = 0; j != v131; j = (char *)j + 1)
      {
        if (*(void *)v205 != v132) {
          objc_enumerationMutation(v129);
        }
        v134 = *(void **)(*((void *)&v204 + 1) + 8 * (void)j);
        v135 = objc_msgSend(v134, "objectForKeyedSubscript:", @"B", v156);
        objc_opt_class();
        id v136 = v135;
        if (objc_opt_isKindOfClass()) {
          id v137 = v136;
        }
        else {
          id v137 = 0;
        }

        v138 = [v134 objectForKeyedSubscript:@"EH"];
        objc_opt_class();
        id v139 = v138;
        if (objc_opt_isKindOfClass()) {
          id v140 = v139;
        }
        else {
          id v140 = 0;
        }

        v141 = [v203 objectForKeyedSubscript:v137];
        if (([v141 isSystemApp] & 1) == 0 && v140)
        {
          v142 = [(ACXCompanionSyncConnection *)v196 gizmoState];
          [v142 setWatchKitAppExecutableHash:v140 forApp:v137];
        }
      }
      id v131 = [v129 countByEnumeratingWithState:&v204 objects:v251 count:16];
    }
    while (v131);
  }

  v143 = v196;
  v144 = [(ACXCompanionSyncConnection *)v196 remoteAppList];
  id v145 = v144;
  if (!v144)
  {
    id v7 = v164;
    id v6 = v165;
    id v10 = v187;
    id v22 = v162;
    id v20 = v163;
    v146 = v161;
LABEL_264:
    v147 = v167;
    goto LABEL_265;
  }
  id v7 = v164;
  id v6 = v165;
  id v10 = v187;
  id v22 = v162;
  id v20 = v163;
  v146 = v161;
  v147 = v167;
  if (!v161)
  {
LABEL_265:

    goto LABEL_266;
  }

  if (v167)
  {
    id v145 = [objc_alloc((Class)NSUUID) initWithUUIDString:v161];
    id v148 = [v167 unsignedIntegerValue];
    v149 = [(ACXCompanionSyncConnection *)v196 remoteAppList];
    id v150 = v148;
    v143 = v196;
    [v149 reportCurrentDBUUID:v145 lastSequenceNumber:v150];

    id v22 = v162;
    goto LABEL_264;
  }
LABEL_266:
  v151 = [(ACXCompanionSyncConnection *)v143 remoteRemovabilityManager];
  v152 = v151;
  if (v151 && v168)
  {

    v153 = v166;
    if (v166)
    {
      v152 = [(ACXCompanionSyncConnection *)v143 remoteRemovabilityManager];
      id v154 = [objc_alloc((Class)NSUUID) initWithUUIDString:v168];
      objc_msgSend(v152, "reportRemoteRemovabilityDBUUID:sequenceNumber:", v154, objc_msgSend(v166, "unsignedIntegerValue"));

      v143 = v196;
      goto LABEL_270;
    }
  }
  else
  {
LABEL_270:

    v153 = v166;
  }
  [(ACXCompanionSyncConnection *)v143 setReunionSyncRunning:0];
  [(ACXCompanionSyncConnection *)v143 _onQueue_processPendingGizmoState];

LABEL_272:
  id v25 = v169;

LABEL_273:
LABEL_274:

LABEL_275:
}

- (void)_onQueue_beginReunionSync
{
  id v3 = [(ACXCompanionSyncConnection *)self device];
  unsigned int v4 = [v3 syncingIsRestricted];

  if (v4)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      MOLogWrite();
    }
  }
  else
  {
    id v5 = [(ACXCompanionSyncConnection *)self device];
    int v6 = [v5 isReachable];

    if (v6)
    {
      if ([(ACXCompanionSyncConnection *)self needsAvailableSystemAppFetch])
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
          MOLogWrite();
        }
        id v7 = [(ACXCompanionSyncConnection *)self gizmoState];
        [v7 setNeedsReunionSync:1];

        [(ACXCompanionSyncConnection *)self _onQueue_configureRemoteAppListsAndFetchSystemAppsIfNeeded];
      }
      else
      {
        [(ACXCompanionSyncConnection *)self _onQueue_beginReunionSyncWithRetryCount:0];
      }
    }
    else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      id v9 = [(ACXCompanionSyncConnection *)self device];
      id v8 = [v9 idsDeviceIdentifier];
      MOLogWrite();
    }
  }
}

- (void)_onQueue_beginReunionSyncWithRetryCount:(unint64_t)a3
{
  if ([(ACXCompanionSyncConnection *)self reunionSyncRunning])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  else
  {
    [(ACXCompanionSyncConnection *)self setReunionSyncRunning:1];
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      unint64_t v19 = a3;
      MOLogWrite();
    }
    uint64_t v24 = 0;
    id v5 = +[ACXLaunchServicesWatcher sharedWatcher];
    id v23 = 0;
    [v5 fetchDatabaseUUID:&v23 andCurrentLastSequenceNumber:&v24];
    id v6 = v23;

    v26[0] = &off_100097648;
    v25[0] = @"T";
    v25[1] = @"DBU";
    id v7 = [v6 UUIDString];
    v26[1] = v7;
    v25[2] = @"DBS";
    id v8 = +[NSNumber numberWithUnsignedInteger:v24];
    v26[2] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

    id v10 = [(ACXCompanionSyncConnection *)self device];
    LODWORD(v8) = [v10 supportsTrackingAppRemovability];

    if (v8)
    {
      uint64_t v22 = 0;
      id v11 = +[ACXLocalAppRemovabilityManager sharedInstance];
      id v21 = 0;
      [v11 fetchCurrentRemovabilityStoreUUID:&v21 sequenceNumber:&v22];
      id v12 = v21;

      if (v12 && v22)
      {
        id v13 = [v9 mutableCopy];
        id v14 = [v12 UUIDString];
        [v13 setObject:v14 forKeyedSubscript:@"RU"];

        unsigned __int8 v15 = +[NSNumber numberWithUnsignedInteger:v22];
        [v13 setObject:v15 forKeyedSubscript:@"RS"];

        id v16 = [v13 copy];
        id v9 = v16;
      }
      else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
      {
        MOLogWrite();
      }
    }
    unsigned __int8 v17 = [(ACXCompanionSyncConnection *)self messager];
    id v18 = [(ACXCompanionSyncConnection *)self device];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100026FBC;
    v20[3] = &unk_10008D6D8;
    v20[4] = self;
    v20[5] = a3;
    [v17 sendMessage:v9 toDevice:v18 withPriority:200 timeout:@"reunion sync" logDescription:v20 handleReply:120.0];
  }
}

- (void)_onQueue_sendInstallOnGizmoMessageForSystemAppBundleIDs:(id)a3 appsWithStoreMetadata:(id)a4 isUserInitiated:(BOOL)a5 exclusiveInstall:(BOOL)a6 withCompletion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100027518;
  v30[3] = &unk_10008D7A0;
  id v15 = (id)objc_opt_new();
  id v31 = v15;
  [v13 enumerateKeysAndObjectsUsingBlock:v30];
  v32[0] = @"T";
  v32[1] = @"BL";
  v33[0] = &off_100097660;
  v33[1] = v12;
  v33[2] = v15;
  v32[2] = @"SD";
  v32[3] = @"DL";
  id v16 = +[NSNumber numberWithBool:v8];
  v33[3] = v16;
  void v32[4] = @"UI";
  unsigned __int8 v17 = +[NSNumber numberWithBool:v9];
  v33[4] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];

  if (v14)
  {
    id v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    id v27 = sub_10002758C;
    id v28 = &unk_10008D7C8;
    id v29 = v14;
    unint64_t v19 = objc_retainBlock(&v25);
  }
  else
  {
    unint64_t v19 = 0;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    [v13 allKeys];
    uint64_t v24 = v23 = v12;
    MOLogWrite();
  }
  if (v9) {
    uint64_t v20 = 300;
  }
  else {
    uint64_t v20 = 200;
  }
  id v21 = [(ACXCompanionSyncConnection *)self messager];
  uint64_t v22 = [(ACXCompanionSyncConnection *)self device];
  [v21 sendMessage:v18 toDevice:v22 withPriority:v20 timeout:@"installation on gizmo list" logDescription:v19 handleReply:120.0];
}

- (void)_onQueue_sendRemoveMessageForBundleIDs:(id)a3 isUserInitiated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v18[0] = @"T";
  v18[1] = @"BL";
  v19[0] = &off_100097678;
  v19[1] = v8;
  id v10 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  if (v9)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100027918;
    v16[3] = &unk_10008D7C8;
    id v17 = v9;
    id v11 = objc_retainBlock(v16);
  }
  else
  {
    id v11 = 0;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v15 = v8;
    MOLogWrite();
  }
  if (v6) {
    uint64_t v12 = 300;
  }
  else {
    uint64_t v12 = 200;
  }
  id v13 = [(ACXCompanionSyncConnection *)self messager];
  id v14 = [(ACXCompanionSyncConnection *)self device];
  [v13 sendMessage:v10 toDevice:v14 withPriority:v12 timeout:@"deletion list" logDescription:v11 handleReply:120.0];
}

- (void)_onQueue_triggerLocalAppStoreInstallForWatchApp:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [v8 bundleIdentifier];
  uint64_t v12 = [v8 companionAppBundleID];
  id v13 = [v8 applicationName];
  id v14 = [(ACXCompanionSyncConnection *)self installQueue];
  unsigned int v15 = [v14 installIsPendingForWatchApp:v11];

  if (v15)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    if (v9) {
      v9[2](v9, 1, 0);
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      id v17 = v11;
      MOLogWrite();
    }
    id v16 = [(ACXCompanionSyncConnection *)self appStoreLocalQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    void v18[2] = sub_1000280D0;
    v18[3] = &unk_10008D660;
    v18[4] = self;
    id v19 = v11;
    id v20 = v12;
    id v21 = v13;
    BOOL v23 = v6;
    uint64_t v22 = v9;
    [v16 installWatchApp:v8 userInitiated:v6 completion:v18];
  }
}

- (BOOL)_onQueue_appNeedsInstall:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  BOOL v6 = [(ACXCompanionSyncConnection *)self remoteAppList];
  id v13 = 0;
  id v7 = [v6 applicationForBundleID:v5 error:&v13];
  id v8 = v13;

  if (!v7)
  {
    id v10 = [v8 domain];
    if ([v10 isEqualToString:@"ACXErrorDomain"])
    {
      id v11 = [v8 code];

      if (v11 == (id)19) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    goto LABEL_14;
  }
  if (![v7 isTheSameAppAs:v4])
  {
LABEL_14:
    BOOL v9 = 1;
    goto LABEL_15;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  BOOL v9 = 0;
LABEL_15:

  return v9;
}

- (void)_onQueue_processPendingGizmoState
{
  id v3 = [(ACXCompanionSyncConnection *)self device];
  if ([v3 syncingIsRestricted])
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
      goto LABEL_163;
    }
    goto LABEL_9;
  }
  if (([v3 isReachable] & 1) == 0)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      int v74 = [v3 idsDeviceIdentifier];
      MOLogWrite();
    }
    goto LABEL_163;
  }
  if ([(ACXCompanionSyncConnection *)self reunionSyncRunning])
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
      goto LABEL_163;
    }
LABEL_9:
    MOLogWrite();
    goto LABEL_163;
  }
  id v4 = [(ACXCompanionSyncConnection *)self gizmoState];
  unsigned int v5 = [v4 needsReunionSync];

  if (v5)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    [(ACXCompanionSyncConnection *)self _onQueue_beginReunionSync];
    goto LABEL_163;
  }
  if ([(ACXCompanionSyncConnection *)self needsAvailableSystemAppFetch])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    [(ACXCompanionSyncConnection *)self _onQueue_configureRemoteAppListsAndFetchSystemAppsIfNeeded];
    goto LABEL_163;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  qos_class_t v6 = qos_class_self();
  id v7 = dispatch_get_global_queue(v6, 0);
  sub_100006BB8(v7, &stru_10008D7E8);

  id v8 = [v3 nrDevice];
  BOOL v87 = sub_100051AF8(v8);

  BOOL v9 = objc_opt_new();
  id v10 = objc_opt_new();
  unsigned int v80 = [v3 supportsStandaloneApps];
  LODWORD(v8) = [v3 supportsRemoteAppList];
  id v11 = [(ACXCompanionSyncConnection *)self applicationManager];
  v91 = v11;
  int v90 = (int)v8;
  if (!v8)
  {
    uint64_t v14 = [v11 bundleIDsOfLocallyAvailableSystemAppsForPreWatchOSSix];
LABEL_32:
    id v96 = (void *)v14;
    goto LABEL_33;
  }
  uint64_t v12 = [(ACXCompanionSyncConnection *)self availableSystemAppList];
  uint64_t v13 = [v12 bundleIDsOfInstallableSystemApps];

  id v96 = (void *)v13;
  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10005BB14();
    }
    uint64_t v14 = [v91 bundleIDsOfLocallyAvailableSystemApps];
    goto LABEL_32;
  }
LABEL_33:
  v83 = v3;
  unsigned int v15 = [(ACXCompanionSyncConnection *)self gizmoState];
  id v16 = [v15 pendingApps];

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v111 objects:v118 count:16];
  if (!v18) {
    goto LABEL_45;
  }
  id v19 = v18;
  uint64_t v20 = *(void *)v112;
  do
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v112 != v20) {
        objc_enumerationMutation(v17);
      }
      uint64_t v22 = *(void **)(*((void *)&v111 + 1) + 8 * i);
      BOOL v23 = [v17 objectForKeyedSubscript:v22];
      id v24 = [v23 installStatus];
      if (v24 == (id)4)
      {
        id v25 = v9;
        uint64_t v26 = v22;
      }
      else
      {
        if (v24 != (id)1) {
          goto LABEL_43;
        }
        id v25 = v10;
        uint64_t v26 = v23;
      }
      [v25 addObject:v26];
LABEL_43:
    }
    id v19 = [v17 countByEnumeratingWithState:&v111 objects:v118 count:16];
  }
  while (v19);
LABEL_45:

  v86 = v9;
  if ([v9 count])
  {
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v27 = v9;
    id v28 = [v27 countByEnumeratingWithState:&v107 objects:v117 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v108;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v108 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v107 + 1) + 8 * (void)j);
          long long v33 = [(ACXCompanionSyncConnection *)self installQueue];
          [v33 cancelInstallForWatchAppBundleID:v32];

          unsigned int v34 = [(ACXCompanionSyncConnection *)self appStoreLocalQueue];
          [v34 cancelInstallForWatchAppBundleID:v32];
        }
        id v29 = [v27 countByEnumeratingWithState:&v107 objects:v117 count:16];
      }
      while (v29);
    }

    [(ACXCompanionSyncConnection *)self _onQueue_sendRemoveMessageForBundleIDs:v27 isUserInitiated:0 withCompletion:0];
    BOOL v9 = v86;
  }
  if (![v10 count]) {
    goto LABEL_162;
  }
  v95 = +[NSMutableSet set];
  id v76 = objc_opt_new();
  v77 = objc_opt_new();
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v10;
  id v35 = [obj countByEnumeratingWithState:&v103 objects:v116 count:16];
  if (!v35)
  {
    uint64_t v92 = 0;
    goto LABEL_158;
  }
  id v36 = v35;
  uint64_t v92 = 0;
  uint64_t v37 = *(void *)v104;
  uint64_t v84 = kACXSourceAppWatchApplicationStore;
  unsigned __int8 v85 = v10;
  id v38 = v91;
  while (2)
  {
    uint64_t v39 = 0;
    id v93 = v36;
    while (2)
    {
      if (*(void *)v104 != v37) {
        objc_enumerationMutation(obj);
      }
      id v40 = *(void **)(*((void *)&v103 + 1) + 8 * v39);
      id v41 = objc_msgSend(v40, "watchAppBundleID", v73);
      if ([v96 containsObject:v41])
      {
        [v95 addObject:v41];
        goto LABEL_154;
      }
      v42 = [v38 gizmoAppWithBundleID:v41];
      char v43 = v42;
      if (!v42)
      {
        if (!v92)
        {
          uint64_t v92 = [v38 allAvailablePlaceholders];
        }
        uint64_t v44 = [v40 companionAppBundleID];
        if (v44)
        {
          if ([v92 containsObject:v44])
          {
            if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
              goto LABEL_149;
            }
            v73 = v44;
            id v75 = v41;
            goto LABEL_90;
          }
        }
        else if ([v92 count])
        {
          if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
            goto LABEL_149;
          }
          v73 = v41;
          id v75 = [v92 count];
LABEL_90:
          MOLogWrite();
LABEL_149:

          id v38 = v91;
          goto LABEL_153;
        }
        if (!v90)
        {
LABEL_145:
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
          {
            v73 = v41;
            MOLogWrite();
          }
          id v115 = v41;
          unsigned int v67 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v115, 1, v73);
          [(ACXCompanionSyncConnection *)self _onQueue_sendRemoveMessageForBundleIDs:v67 isUserInitiated:0 withCompletion:0];

          goto LABEL_149;
        }
        uint64_t v46 = [(ACXCompanionSyncConnection *)self remoteAppList];
        id v102 = 0;
        id v47 = [v46 applicationForBundleID:v41 error:&v102];
        id v48 = v102;

        uint64_t v89 = v48;
        if (v47)
        {
          if ([v47 applicationMode] == (id)2)
          {
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              v73 = v41;
              MOLogWrite();
            }
            id v49 = [(ACXCompanionSyncConnection *)self gizmoState];
            uint64_t v50 = [v47 companionAppBundleID];
            [v49 setInstallStatus:2 forApp:v41 companionBundleID:v50];

            id v10 = v85;
            BOOL v9 = v86;
LABEL_98:

            goto LABEL_149;
          }
          id v65 = [v47 applicationMode];
          uint64_t v66 = qword_1000A5608;
          if (v65 == (id)3)
          {
            id v10 = v85;
            BOOL v9 = v86;
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              v73 = v41;
              MOLogWrite();
            }
            objc_msgSend(v76, "addObject:", v41, v73);
            goto LABEL_144;
          }
          id v10 = v85;
          BOOL v9 = v86;
          if (!qword_1000A5608) {
            goto LABEL_143;
          }
        }
        else
        {
          id v54 = [v48 domain];
          if ([v54 isEqualToString:@"ACXErrorDomain"])
          {
            id v55 = [v48 code];

            BOOL v56 = v55 == (id)43;
            BOOL v9 = v86;
            if (v56)
            {
              id v10 = v85;
              if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
              {
                v73 = v41;
                MOLogWrite();
              }
              goto LABEL_98;
            }
          }
          else
          {

            BOOL v9 = v86;
          }
          uint64_t v66 = qword_1000A5608;
          id v10 = v85;
          if (!qword_1000A5608) {
            goto LABEL_143;
          }
        }
        if (*(int *)(v66 + 44) < 5)
        {
LABEL_144:

          goto LABEL_145;
        }
LABEL_143:
        v73 = v41;
        MOLogWrite();
        goto LABEL_144;
      }
      if ([v42 isSystemApp])
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          v73 = v41;
          id v75 = v96;
          MOLogWrite();
        }
        objc_msgSend(v95, "addObject:", v41, v73, v75);
        goto LABEL_153;
      }
      if (![v43 isBetaApp])
      {
        if (v90 && ![(ACXCompanionSyncConnection *)self _onQueue_appNeedsInstall:v43])
        {
          v51 = [(ACXCompanionSyncConnection *)self gizmoState];
          unsigned __int8 v53 = [v43 companionAppBundleID];
          [v51 setInstallStatus:2 forApp:v41 companionBundleID:v53];

          id v38 = v91;
          goto LABEL_107;
        }
        v88 = [v43 companionAppBundleID];
        id v45 = [v43 sourceAppIdentifier];
        if ([v45 isEqualToString:v84])
        {
          if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
            goto LABEL_105;
          }
          v73 = v41;
          id v75 = v45;
        }
        else
        {
          if ([v43 autoInstallOverride] != (id)2)
          {
            uint64_t v52 = 0;
            goto LABEL_115;
          }
          if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5)
          {
LABEL_105:
            uint64_t v52 = 1;
LABEL_115:
            if (objc_msgSend(v43, "isEmbeddedPlaceholder", v73))
            {
              if (v80)
              {
                if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                {
                  v73 = v41;
                  MOLogWrite();
                }
                id v58 = objc_msgSend(v43, "storeMetadata", v73);
                if (v58)
                {
                  [v77 setObject:v58 forKeyedSubscript:v41];
                }
                else
                {
                  id v82 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _onQueue_processPendingGizmoState]", 2003, @"ACXErrorDomain", 51, 0, 0, @"Failed to load metadata for app %@", v57, (uint64_t)v41);
                  id v79 = [v43 companionAppBundleID];
                  v68 = [v43 applicationName];
                  -[ACXCompanionSyncConnection _onQueue_installFailedForWatchAppBundleID:companionBundleID:withError:appName:userInitiated:userPresentableError:](self, "_onQueue_installFailedForWatchAppBundleID:companionBundleID:withError:appName:userInitiated:userPresentableError:", v41, v79, v82);

                  BOOL v9 = v86;
                }
                id v38 = v91;

                id v10 = v85;
              }
              else if (v87)
              {
                id v38 = v91;
                if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
                {
                  v73 = v41;
                  MOLogWrite();
                }
              }
              else
              {
                [(ACXCompanionSyncConnection *)self _onQueue_triggerLocalAppStoreInstallForWatchApp:v43 userInitiated:v52 completion:0];
                id v38 = v91;
              }
            }
            else
            {
              v59 = [v43 applicationName];
              if (v87)
              {
                id v38 = v91;
                if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
                {
                  v73 = v41;
                  unsigned __int8 v60 = v45;
                  v61 = v10;
                  uint64_t v62 = v59;
                  MOLogWrite();
                  v59 = v62;
                  id v10 = v61;
                  id v45 = v60;
                  BOOL v9 = v86;
                }
              }
              else
              {
                id v81 = v59;
                unsigned int v78 = [(ACXCompanionSyncConnection *)self installQueue];
                id v63 = [(ACXCompanionSyncConnection *)self gizmoState];
                uint64_t v64 = [v63 preferencesForApplicationWithIdentifier:v41];
                v97[0] = _NSConcreteStackBlock;
                v97[1] = 3221225472;
                v97[2] = sub_1000291E4;
                v97[3] = &unk_10008D810;
                v97[4] = self;
                id v98 = v41;
                id v99 = v88;
                id v100 = v81;
                char v101 = v52;
                [v78 installWatchApp:v43 withPriority:2 appSettings:v64 provisioningProfileInfo:0 isUserInitiated:v52 completion:v97];

                BOOL v9 = v86;
                id v10 = v85;

                v59 = v81;
                id v38 = v91;
              }
            }
            goto LABEL_153;
          }
          v73 = v41;
        }
        MOLogWrite();
        goto LABEL_105;
      }
      if (v87)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          v73 = v41;
          MOLogWrite();
        }
        goto LABEL_153;
      }
      v51 = +[ACXTestFlightInstallQueue sharedInstaller];
      [v51 installWatchApp:v43 targetDevice:v83];
LABEL_107:

LABEL_153:
      id v36 = v93;
LABEL_154:

      if (v36 != (id)++v39) {
        continue;
      }
      break;
    }
    id v36 = [obj countByEnumeratingWithState:&v103 objects:v116 count:16];
    if (v36) {
      continue;
    }
    break;
  }
LABEL_158:

  unsigned int v69 = [(ACXCompanionSyncConnection *)self gizmoState];
  [v69 purgeInstallStatusForApps:v76];

  if ([v95 count])
  {
    uint64_t v70 = v77;
    if (!v87) {
      goto LABEL_160;
    }
  }
  else
  {
    uint64_t v70 = v77;
    if ([v77 count]) {
      char v72 = v87;
    }
    else {
      char v72 = 1;
    }
    if ((v72 & 1) == 0)
    {
LABEL_160:
      v71 = objc_msgSend(v95, "allObjects", v73);
      [(ACXCompanionSyncConnection *)self _onQueue_sendInstallOnGizmoMessageForSystemAppBundleIDs:v71 appsWithStoreMetadata:v70 isUserInitiated:0 exclusiveInstall:0 withCompletion:0];
    }
  }

LABEL_162:
  id v3 = v83;
LABEL_163:
}

- (void)_onQueue_handleAppInstallMessage:(id)a3 withAppManager:(id)a4
{
  id v6 = a3;
  id v38 = self;
  id v39 = a4;
  id v7 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v6 message];
  BOOL v9 = [v8 objectForKeyedSubscript:@"IA"];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (v11 && (objc_opt_class(), (sub_1000070BC(v11) & 1) != 0))
  {
    id v36 = v6;
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
    {
      id v32 = v8;
      MOLogWrite();
    }
    id v35 = v8;
    uint64_t v37 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v34 = v11;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v41;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v41 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v18 = objc_msgSend(v17, "objectForKeyedSubscript:", @"B", v32);
          objc_opt_class();
          id v19 = v18;
          if (objc_opt_isKindOfClass()) {
            id v20 = v19;
          }
          else {
            id v20 = 0;
          }

          if (v20)
          {
            id v21 = [v17 objectForKeyedSubscript:@"EH"];
            objc_opt_class();
            id v22 = v21;
            if (objc_opt_isKindOfClass()) {
              id v23 = v22;
            }
            else {
              id v23 = 0;
            }

            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              id v32 = v20;
              id v33 = v23;
              MOLogWrite();
            }
            id v24 = objc_msgSend(v39, "gizmoAppWithBundleID:", v20, v32, v33);
            id v25 = [v24 companionAppBundleID];
            uint64_t v26 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:2 companionBundleID:v25];

            [v26 setWatchAppExecutableHash:v23];
            [v37 setObject:v26 forKeyedSubscript:v20];
            id v27 = [(ACXCompanionSyncConnection *)v38 installQueue];
            [v27 acknowledgeInstallationForWatchApp:v20];
          }
          else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
          {
            id v32 = v17;
            MOLogWrite();
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v14);
    }

    id v28 = [(ACXCompanionSyncConnection *)v38 gizmoState];
    [v28 setInstallStatusForApps:v37 sendNotification:1 withUpdatePredicate:&stru_10008D830];

    id v29 = [(ACXCompanionSyncConnection *)v38 remoteAppList];

    id v8 = v35;
    id v6 = v36;
    if (v29)
    {
      uint64_t v30 = [v35 objectForKeyedSubscript:@"IL"];

      if (v30)
      {
        id v31 = [(ACXCompanionSyncConnection *)v38 remoteAppList];
        sub_10004D500(v36, v31);
      }
      else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
      {
        MOLogWrite();
      }
    }

    id v11 = v34;
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (void)_onQueue_handleAppInstallMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self applicationManager];
  [(ACXCompanionSyncConnection *)self _onQueue_handleAppInstallMessage:v4 withAppManager:v5];
}

- (id)_onQueue_applicationForWatchAppWithBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ACXCompanionSyncConnection *)self applicationManager];
  id v7 = [v6 gizmoAppWithBundleID:v4];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    BOOL v9 = [(ACXCompanionSyncConnection *)self applicationManager];
    id v8 = [v9 availableSystemAppWithBundleID:v4 error:0];
  }

  return v8;
}

- (id)_onQueue_availableCompanionAppBundleIDForWatchApp:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self applicationManager];
  id v6 = [v5 gizmoAppWithBundleID:v4];

  if (v6)
  {
    id v7 = [v6 companionAppBundleID];
  }
  else
  {
    id v8 = [(ACXCompanionSyncConnection *)self applicationManager];
    id v7 = [v8 companionBundleIDForLocallyAvailableSystemApp:v4 error:0];
  }

  return v7;
}

- (void)_onQueue_handleAppDeleteMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 message];
  id v28 = [v5 objectForKey:@"EO"];

  id v6 = [v5 objectForKeyedSubscript:@"BL"];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8 && (objc_opt_class(), (sub_1000070BC(v8) & 1) != 0))
  {
    id v25 = v5;
    if (!v28)
    {
      BOOL v9 = [(ACXCompanionSyncConnection *)self remoteAppList];

      if (v9)
      {
        id v10 = [(ACXCompanionSyncConnection *)self remoteAppList];
        sub_10004D930(v4, v10);
      }
    }
    id v26 = v4;
    id v11 = objc_opt_new();
    id v27 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v24 = v8;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v18 = [(ACXCompanionSyncConnection *)self _onQueue_availableCompanionAppBundleIDForWatchApp:v17];
          if (v18)
          {
            if (v28)
            {
              if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
              {
                uint64_t v23 = v17;
                MOLogWrite();
              }
              uint64_t v19 = 2;
            }
            else
            {
              if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
              {
                uint64_t v23 = v17;
                MOLogWrite();
              }
              uint64_t v19 = 5;
            }
            id v20 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:companionBundleID:](ACXGizmoApplicationInstallStatusItem, "itemWithStatus:companionBundleID:", v19, v18, v23);
            [v11 setObject:v20 forKeyedSubscript:v17];
          }
          else
          {
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              uint64_t v23 = v17;
              MOLogWrite();
            }
            objc_msgSend(v27, "addObject:", v17, v23);
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }

    id v21 = [(ACXCompanionSyncConnection *)self gizmoState];
    [v21 setInstallStatusForApps:v11];

    id v22 = [(ACXCompanionSyncConnection *)self gizmoState];
    [v22 purgeInstallStatusForApps:v27];

    id v5 = v25;
    id v4 = v26;
    id v8 = v24;
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (void)_onQueue_handleInstallAppMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 message];
  id v6 = [v5 objectForKeyedSubscript:@"BL"];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8 && (objc_opt_class(), (sub_1000070BC(v8) & 1) != 0))
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
      MOLogWrite();
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v15 = v8;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v13);
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100029F68;
          v16[3] = &unk_10008CA40;
          void v16[4] = v14;
          v16[5] = self;
          id v17 = v4;
          [(ACXCompanionSyncConnection *)self _installWatchAppWithBundleID:v14 withProvisioningProfileInfo:0 installationPendingBlock:v16 completionWithError:0];

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v8 = v15;
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (void)_onQueue_handleCompatibleWatchAppsOnCompanionMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self applicationManager];
  id v6 = [v5 allAvailableApps];

  id v7 = objc_opt_new();
  id v8 = [(ACXCompanionSyncConnection *)self device];
  id v9 = [v8 osVersion];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002A3E4;
  v16[3] = &unk_10008CD80;
  id v10 = v9;
  id v17 = v10;
  id v11 = v7;
  id v18 = v11;
  [v6 enumerateKeysAndObjectsUsingBlock:v16];
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
    MOLogWrite();
  }
  id v12 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v12 encodeObject:v11 forKey:NSKeyedArchiveRootObjectKey];
  id v13 = [v12 encodedData];

  v19[0] = @"T";
  v19[1] = @"IO";
  v20[0] = &off_1000976A8;
  v20[1] = v13;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  id v15 = [(ACXCompanionSyncConnection *)self messager];
  [v15 sendResponse:v14 toMessage:v4 withPriority:200 timeout:@"the list of available and compatible applications" logDescription:120.0];
}

- (void)_onQueue_handleIconForWatchAppMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 message];
  id v6 = [v5 objectForKeyedSubscript:@"BI"];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (!v8)
  {
    uint64_t v14 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _onQueue_handleIconForWatchAppMessage:]", 2243, @"ACXErrorDomain", 34, 0, 0, @"No watch application bundleID provided, ignoring request.", v9, v33);
    id v13 = 0;
LABEL_19:
    long long v19 = 0;
LABEL_20:
    Unique = 0;
LABEL_21:
    id v25 = 0;
    goto LABEL_22;
  }
  id v10 = [v4 message];
  id v11 = [v10 objectForKeyedSubscript:@"IV"];
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (!v13)
  {
    long long v30 = @"No icon variant provided, ignoring request.";
    uint64_t v31 = 2249;
LABEL_18:
    uint64_t v14 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _onQueue_handleIconForWatchAppMessage:]", v31, @"ACXErrorDomain", 34, 0, 0, v30, v15, v33);
    goto LABEL_19;
  }
  id v16 = (char *)[v13 unsignedIntegerValue];
  if ((unint64_t)(v16 - 1) >= 0xF)
  {
    uint64_t v33 = (uint64_t)v16;
    long long v30 = @"The requested icon variant is invalid (%lu)";
    uint64_t v31 = 2255;
    goto LABEL_18;
  }
  uint64_t v17 = (v16 + 37);
  id v18 = [(ACXCompanionSyncConnection *)self applicationManager];
  long long v19 = [v18 gizmoAppWithBundleID:v8];

  if (!v19)
  {
    uint64_t v14 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _onQueue_handleIconForWatchAppMessage:]", 2263, @"ACXErrorDomain", 34, 0, 0, @"The watch application %@ does not appear to be installed in the system.", v20, (uint64_t)v8);
    goto LABEL_20;
  }
  long long v21 = [v19 watchAppURL];
  Unique = (const void *)_CFBundleCreateUnique();

  if (!Unique)
  {
    uint64_t v14 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _onQueue_handleIconForWatchAppMessage:]", 2269, @"ACXErrorDomain", 34, 0, 0, @"Failed to find a bundle for the watch application %@", v23, (uint64_t)v8);
    goto LABEL_21;
  }
  id v25 = (const void *)LICreateIconForBundle();
  if (!v25)
  {
    sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _onQueue_handleIconForWatchAppMessage:]", 2275, @"ACXErrorDomain", 34, 0, 0, @"Failed to find an icon with variant %lu for the watch application %@", v24, v17);
    uint64_t v14 = LABEL_31:;
LABEL_22:
    v34[0] = @"T";
    v34[1] = @"E";
    v35[0] = &off_1000976C0;
    v35[1] = v14;
    long long v29 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    if (!v25) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  uint64_t v26 = LICreateUncompressedBitmapDataFromImage();
  if (!v26)
  {
    sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _onQueue_handleIconForWatchAppMessage:]", 2281, @"ACXErrorDomain", 34, 0, 0, @"Failed to create data for icon variant %lu for the watch application %@", v27, v17);
    goto LABEL_31;
  }
  id v28 = (void *)v26;
  v36[0] = @"T";
  v36[1] = @"ID";
  v37[0] = &off_1000976C0;
  v37[1] = v26;
  long long v29 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

  uint64_t v14 = 0;
LABEL_23:
  CFRelease(v25);
LABEL_24:
  if (Unique) {
    CFRelease(Unique);
  }
  long long v32 = [(ACXCompanionSyncConnection *)self messager];
  [v32 sendResponse:v29 toMessage:v4 withPriority:300 timeout:@"icon for a watchkit app" logDescription:120.0];
}

- (void)_onQueue_handleAppRemovabilityUpdatedMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v19 = [v4 message];

  id v6 = [v19 objectForKeyedSubscript:@"BI"];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8)
  {
    uint64_t v9 = [v19 objectForKeyedSubscript:@"R"];
    if (v9)
    {
      id v10 = [v19 objectForKeyedSubscript:@"RU"];
      if (v10)
      {
        id v11 = [v19 objectForKeyedSubscript:@"RS"];
        if (v11)
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            uint64_t v17 = v10;
            id v18 = v11;
            id v15 = v8;
            id v16 = v9;
            MOLogWrite();
          }
          id v12 = [(ACXCompanionSyncConnection *)self remoteRemovabilityManager];
          id v13 = [v9 unsignedIntegerValue];
          id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
          objc_msgSend(v12, "removabilityUpdatedForApp:removability:dbUUID:sequenceNumber:", v8, v13, v14, objc_msgSend(v11, "unsignedIntegerValue"));
        }
        else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          MOLogWrite();
        }
      }
      else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
      {
        MOLogWrite();
      }
    }
    else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (void)_onQueue_handleAppInstallFailureMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v24 = [v4 message];

  id v6 = [v24 objectForKeyedSubscript:@"UI"];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = [v8 BOOLValue];
  id v10 = [v24 objectForKeyedSubscript:@"BI"];
  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (v12)
  {
    id v13 = sub_100027A74(v24);
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      uint64_t v22 = (int)sub_100008300((int)v9);
      uint64_t v23 = v13;
      id v21 = v12;
      MOLogWrite();
    }
    id v14 = [(ACXCompanionSyncConnection *)self availableSystemAppList];
    unsigned int v15 = [v14 systemAppIsInstallableWithBundleID:v12 error:0];

    if (v15)
    {
      id v16 = +[ACXPairedSyncDelegate sharedSyncDelegate];
      [v16 reportSystemAppInstallFailureForBundleID:v12];
    }
    uint64_t v17 = [(ACXCompanionSyncConnection *)self _onQueue_applicationForWatchAppWithBundleID:v12];
    id v18 = v17;
    if (v17)
    {
      id v19 = [v17 companionAppBundleID];
      uint64_t v20 = [v18 applicationName];
      [(ACXCompanionSyncConnection *)self _onQueue_installFailedForWatchAppBundleID:v12 companionBundleID:v19 withError:v13 appName:v20 userInitiated:v9 userPresentableError:0];
    }
    else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (void)handleIncomingMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 message];
  id v6 = [v5 objectForKey:@"T"];
  unsigned int v7 = [v6 unsignedCharValue];

  switch(v7)
  {
    case 2u:
      id v8 = [(ACXCompanionSyncConnection *)self internalQueue];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10002B608;
      v46[3] = &unk_10008CC28;
      v46[4] = self;
      id v47 = v4;
      sub_100006BB8(v8, v46);

      id v9 = v47;
      goto LABEL_19;
    case 4u:
      id v10 = [(ACXCompanionSyncConnection *)self internalQueue];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_10002B5F0;
      v50[3] = &unk_10008CC28;
      v50[4] = self;
      id v51 = v4;
      sub_100006BB8(v10, v50);

      id v9 = v51;
      goto LABEL_19;
    case 5u:
      id v11 = [(ACXCompanionSyncConnection *)self internalQueue];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10002B5FC;
      v48[3] = &unk_10008CC28;
      v48[4] = self;
      id v49 = v4;
      sub_100006BB8(v11, v48);

      id v9 = v49;
      goto LABEL_19;
    case 0xEu:
      id v12 = [(ACXCompanionSyncConnection *)self internalQueue];
      sub_100006BB8(v12, &stru_10008D850);

      break;
    case 0xFu:
      id v13 = [(ACXCompanionSyncConnection *)self internalQueue];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10002B768;
      v44[3] = &unk_10008CC28;
      v44[4] = self;
      id v45 = v4;
      sub_100006BB8(v13, v44);

      id v9 = v45;
      goto LABEL_19;
    case 0x11u:
      id v14 = [(ACXCompanionSyncConnection *)self internalQueue];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10002B774;
      v42[3] = &unk_10008CC28;
      v42[4] = self;
      id v43 = v4;
      sub_100006BB8(v14, v42);

      id v9 = v43;
      goto LABEL_19;
    case 0x13u:
      unsigned int v15 = [(ACXCompanionSyncConnection *)self internalQueue];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10002B780;
      v40[3] = &unk_10008CC28;
      v40[4] = self;
      id v41 = v4;
      sub_100006BB8(v15, v40);

      id v9 = v41;
      goto LABEL_19;
    case 0x17u:
      id v16 = [(ACXCompanionSyncConnection *)self internalQueue];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      void v37[2] = sub_10002B78C;
      v37[3] = &unk_10008CC28;
      id v38 = v4;
      id v39 = self;
      sub_100006BB8(v16, v37);

      id v9 = v38;
      goto LABEL_19;
    case 0x19u:
      uint64_t v17 = [(ACXCompanionSyncConnection *)self internalQueue];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      void v34[2] = sub_10002B7E0;
      v34[3] = &unk_10008CC28;
      id v35 = v4;
      id v36 = self;
      sub_100006BB8(v17, v34);

      id v9 = v35;
      goto LABEL_19;
    case 0x1Bu:
      id v18 = [(ACXCompanionSyncConnection *)self internalQueue];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10002B834;
      v32[3] = &unk_10008CD30;
      id v33 = v4;
      sub_100006BB8(v18, v32);

      id v9 = v33;
      goto LABEL_19;
    case 0x1Cu:
      id v19 = [(ACXCompanionSyncConnection *)self internalQueue];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10002B83C;
      v29[3] = &unk_10008CC28;
      id v30 = v4;
      uint64_t v31 = self;
      sub_100006BB8(v19, v29);

      id v9 = v30;
      goto LABEL_19;
    case 0x1Fu:
      uint64_t v20 = [(ACXCompanionSyncConnection *)self internalQueue];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10002B890;
      v27[3] = &unk_10008CC28;
      v27[4] = self;
      id v28 = v4;
      sub_100006BB8(v20, v27);

      id v9 = v28;
      goto LABEL_19;
    case 0x20u:
      id v21 = [(ACXCompanionSyncConnection *)self internalQueue];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10002B89C;
      void v25[3] = &unk_10008CC28;
      v25[4] = self;
      id v26 = v4;
      sub_100006BB8(v21, v25);

      id v9 = v26;
      goto LABEL_19;
    case 0x21u:
      uint64_t v22 = [(ACXCompanionSyncConnection *)self internalQueue];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10002B8A8;
      v23[3] = &unk_10008CC28;
      v23[4] = self;
      id v24 = v4;
      sub_100006BB8(v22, v23);

      id v9 = v24;
LABEL_19:

      break;
    default:
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
        MOLogWrite();
      }
      break;
  }
}

- (void)processPendingStateWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B968;
  v7[3] = &unk_10008CC28;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  sub_100006BB8(v5, v7);
}

- (void)performReunionSyncWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002BA94;
  v7[3] = &unk_10008CC28;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  sub_100006BB8(v5, v7);
}

- (void)noteInstallFailure:(id)a3 forWatchAppWithBundleID:(id)a4 wasUserInitiated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(ACXCompanionSyncConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BC00;
  block[3] = &unk_10008CA40;
  block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(v9, block);
}

- (void)acknowledgeTestFlightInstallBegunForWatchApp:(id)a3
{
  id v3 = a3;
  id v4 = +[ACXTestFlightInstallQueue sharedInstaller];
  [v4 removePendingInstallForAppWithBundleID:v3];
}

- (void)installProvisioningProfileWithData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXCompanionSyncConnection *)self internalQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002BD90;
  v11[3] = &unk_10008CA90;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_100006BB8(v8, v11);
}

- (void)removeProvisioningProfileWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXCompanionSyncConnection *)self internalQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002C27C;
  v11[3] = &unk_10008CA90;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_100006BB8(v8, v11);
}

- (void)fetchProvisioningProfilesWithCompletion:(id)a3
{
}

- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXCompanionSyncConnection *)self internalQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002C774;
  v11[3] = &unk_10008CA90;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_100006BB8(v8, v11);
}

- (NSDictionary)removabilityForRemoteApps
{
  v2 = [(ACXCompanionSyncConnection *)self remoteRemovabilityManager];
  id v3 = [v2 appRemovabilityMap];

  return (NSDictionary *)v3;
}

- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 writingToPreferencesLocation:(unint64_t)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  unsigned int v15 = [(ACXCompanionSyncConnection *)self device];
  unsigned __int8 v16 = [v15 supportsStandaloneApps];

  if (!a5 || (v16 & 1) != 0)
  {
    id v19 = [(ACXCompanionSyncConnection *)self internalQueue];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002CD64;
    v20[3] = &unk_10008D878;
    id v21 = v12;
    unint64_t v25 = a5;
    unint64_t v26 = a6;
    id v22 = v13;
    uint64_t v23 = self;
    id v24 = v14;
    sub_100006BB8(v19, v20);
  }
  else
  {
    id v18 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection updatePreferencesForApplicationWithIdentifier:preferences:writingToPreferencesLocation:options:completion:]", 2651, @"ACXErrorDomain", 50, 0, 0, @"Watch device does not support writing to preferences location %lu", v17, a5);
    (*((void (**)(id, void *))v14 + 2))(v14, v18);
  }
}

- (BOOL)supportsRemoteAppList
{
  v2 = [(ACXCompanionSyncConnection *)self remoteAppList];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)fetchAppInfoForBundleIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v9 = [(ACXCompanionSyncConnection *)self internalQueue];
  id v6 = [(ACXCompanionSyncConnection *)self messager];
  id v7 = [(ACXCompanionSyncConnection *)self device];
  id v8 = [(ACXCompanionSyncConnection *)self remoteAppList];
  sub_10004DA84(v4, v9, v6, v7, v8);
}

- (void)fetchBundleIDList
{
  BOOL v3 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v7 = [(ACXCompanionSyncConnection *)self internalQueue];
  id v4 = [(ACXCompanionSyncConnection *)self messager];
  id v5 = [(ACXCompanionSyncConnection *)self device];
  id v6 = [(ACXCompanionSyncConnection *)self remoteAppList];
  sub_10004DD10(v7, v4, v5, v6);
}

- (void)fetchOutstandingAppEvents
{
  BOOL v3 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v7 = [(ACXCompanionSyncConnection *)self internalQueue];
  id v4 = [(ACXCompanionSyncConnection *)self messager];
  id v5 = [(ACXCompanionSyncConnection *)self device];
  id v6 = [(ACXCompanionSyncConnection *)self remoteAppList];
  sub_10004DEDC(v7, v4, v5, v6);
}

- (void)acknowledgeAppEventsForDBUUID:(id)a3 throughSequenceNumber:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  id v10 = [(ACXCompanionSyncConnection *)self internalQueue];
  id v8 = [(ACXCompanionSyncConnection *)self messager];
  id v9 = [(ACXCompanionSyncConnection *)self device];
  sub_10004E0A8(v6, a4, v10, v8, v9);
}

- (void)_setLocallyAvailableForRemoteApplicationInstances:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self applicationManager];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "applicationMode", (void)v14) != (id)3)
        {
          id v12 = [v11 bundleIdentifier];
          unsigned int v13 = [v5 gizmoAppIsLocallyAvailableWithBundleID:v12];

          if (v13) {
            [v11 setIsLocallyAvailable:1];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)applicationsAdded:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self device];
  id v6 = [v5 pairingID];

  [(ACXCompanionSyncConnection *)self _setLocallyAvailableForRemoteApplicationInstances:v4];
  +[ACXDeviceConnectionClient messageAllObserversForApplicationsInstalled:v4 onDeviceWithPairingID:v6];
  id v7 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned int v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v12), "bundleIdentifier", (void)v14);
        [v7 addObject:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  sub_10002D75C(@"com.apple.appconduit.remote_applications_installed", v7, v6);
}

- (void)applicationsUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self device];
  id v6 = [v5 pairingID];

  [(ACXCompanionSyncConnection *)self _setLocallyAvailableForRemoteApplicationInstances:v4];
  +[ACXDeviceConnectionClient messageAllObserversForApplicationsUpdated:v4 onDeviceWithPairingID:v6];
  id v7 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned int v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v12), "bundleIdentifier", (void)v14);
        [v7 addObject:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  sub_10002D75C(@"com.apple.appconduit.remote_applications_updated", v7, v6);
}

- (void)applicationsRemoved:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXCompanionSyncConnection *)self device];
  id v6 = [v5 pairingID];

  id v7 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned int v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v12), "bundleIdentifier", (void)v14);
        [v7 addObject:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  +[ACXDeviceConnectionClient messageAllObserversForApplicationsUninstalled:v7 onDeviceWithPairingID:v6];
  sub_10002D75C(@"com.apple.appconduit.remote_applications_uninstalled", v7, v6);
}

- (void)resyncCompleted
{
  BOOL v3 = [(ACXCompanionSyncConnection *)self device];
  id v6 = [v3 pairingID];

  id v4 = [(ACXCompanionSyncConnection *)self device];
  id v5 = [v4 pairingID];
  +[ACXDeviceConnectionClient messageAllObserversForApplicationDatabaseResyncedForDeviceWithPairingID:v5];

  sub_10002D75C(@"com.apple.appconduit.remote_application_db_resynced", 0, v6);
}

- (void)_processSystemAppChangesForNewApps:(id)a3 updatedApps:(id)a4 removedApps:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ACXCompanionSyncConnection *)self device];
  LODWORD(a4) = [v11 isActivePairedDevice];

  if (a4)
  {
    id v41 = v10;
    id v12 = [(ACXCompanionSyncConnection *)self device];
    unsigned int v13 = [v12 deletableSystemAppStateIsMirrored];

    long long v14 = [(ACXCompanionSyncConnection *)self device];
    unsigned int v39 = [v14 supportsRemoteAppList];

    id v38 = self;
    long long v15 = [(ACXCompanionSyncConnection *)self gizmoState];
    unsigned int v16 = [v15 alwaysInstallApps];

    id v42 = v9;
    long long v17 = [v8 arrayByAddingObjectsFromArray:v9];
    id v18 = objc_opt_new();
    long long v40 = objc_opt_new();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v19 = v17;
    id v20 = [v19 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v57;
      int v23 = v13 | v16;
      uint64_t v44 = *(void *)v57;
      id v45 = v19;
      int v43 = v13 | v16;
      do
      {
        id v24 = 0;
        id v46 = v21;
        do
        {
          if (*(void *)v57 != v22) {
            objc_enumerationMutation(v19);
          }
          unint64_t v25 = *(void **)(*((void *)&v56 + 1) + 8 * (void)v24);
          if ([v25 isDeletable]
            && ([v25 isSystemApp] & v23) == 1)
          {
            unint64_t v26 = [v25 counterpartIdentifiers];
            uint64_t v27 = v26;
            if (v26 && [v26 count])
            {
              id v48 = v24;
              id v28 = [v25 bundleIdentifier];
              long long v52 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              id v47 = v27;
              id v29 = v27;
              id v30 = [v29 countByEnumeratingWithState:&v52 objects:v60 count:16];
              if (!v30) {
                goto LABEL_25;
              }
              id v31 = v30;
              uint64_t v32 = *(void *)v53;
              while (1)
              {
                for (i = 0; i != v31; i = (char *)i + 1)
                {
                  if (*(void *)v53 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v34 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                  if (v13)
                  {
                    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) > 4) {
                      goto LABEL_22;
                    }
                  }
                  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                  {
LABEL_22:
                    uint64_t v37 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                    MOLogWrite();
                  }
                  id v35 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:companionBundleID:](ACXGizmoApplicationInstallStatusItem, "itemWithStatus:companionBundleID:", 1, v28, v37);
                  [v18 setObject:v35 forKeyedSubscript:v34];
                }
                id v31 = [v29 countByEnumeratingWithState:&v52 objects:v60 count:16];
                if (!v31)
                {
LABEL_25:

                  id v19 = v45;
                  id v21 = v46;
                  uint64_t v22 = v44;
                  int v23 = v43;
                  uint64_t v27 = v47;
                  id v24 = v48;
                  break;
                }
              }
            }
          }
          id v24 = (char *)v24 + 1;
        }
        while (v24 != v21);
        id v21 = [v19 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v21);
    }

    id v10 = v41;
    if (((v13 ^ 1 | v39) & 1) == 0)
    {
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_10002E124;
      v50[3] = &unk_10008D8A0;
      id v51 = v40;
      [v41 enumerateKeysAndObjectsUsingBlock:v50];
    }
    if ([v18 count] || objc_msgSend(v40, "count"))
    {
      id v36 = [(ACXCompanionSyncConnection *)v38 gizmoState];
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10002E260;
      v49[3] = &unk_10008CD30;
      v49[4] = v38;
      [v36 processNewStatusUpdates:v18 updatedStatusUpdates:0 removedStatusUpdates:v40 completion:v49];
    }
    id v9 = v42;
  }
}

- (void)noteNewCompanionApps:(id)a3 updatedApps:(id)a4 removedApps:(id)a5 forDBUUID:(id)a6 endingSequenceNumber:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  unsigned int v16 = [(ACXCompanionSyncConnection *)self device];
  unsigned int v17 = [v16 supportsRemoteAppList];

  if (v17)
  {
    if ([v12 count] || objc_msgSend(v13, "count"))
    {
      unint64_t v49 = a7;
      uint64_t v50 = v15;
      long long v52 = v13;
      id v18 = objc_opt_new();
      id v19 = objc_opt_new();
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v51 = v12;
      id v20 = v12;
      id v21 = [v20 countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v66;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v66 != v23) {
              objc_enumerationMutation(v20);
            }
            unint64_t v25 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            unint64_t v26 = objc_msgSend(v25, "serializeAsRemoteApplication", v49);
            [v18 addObject:v26];

            uint64_t v27 = [v25 bundleIdentifier];
            [v19 addObject:v27];
          }
          id v22 = [v20 countByEnumeratingWithState:&v65 objects:v74 count:16];
        }
        while (v22);
      }

      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v28 = v52;
      id v29 = [v28 countByEnumeratingWithState:&v61 objects:v73 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v62;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v62 != v31) {
              objc_enumerationMutation(v28);
            }
            id v33 = *(void **)(*((void *)&v61 + 1) + 8 * (void)j);
            uint64_t v34 = objc_msgSend(v33, "serializeAsRemoteApplication", v49);
            [v18 addObject:v34];

            id v35 = [v33 bundleIdentifier];
            [v19 addObject:v35];
          }
          id v30 = [v28 countByEnumeratingWithState:&v61 objects:v73 count:16];
        }
        while (v30);
      }

      v71[0] = @"T";
      v71[1] = @"IL";
      v72[0] = &off_100097738;
      v72[1] = v18;
      v71[2] = @"DBU";
      id v15 = v50;
      id v36 = [v50 UUIDString];
      v72[2] = v36;
      v71[3] = @"DBS";
      a7 = v49;
      uint64_t v37 = +[NSNumber numberWithUnsignedInteger:v49];
      v72[3] = v37;
      id v38 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:4];

      unsigned int v39 = [(ACXCompanionSyncConnection *)self internalQueue];
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_10002E798;
      v57[3] = &unk_10008CA40;
      id v58 = v19;
      long long v59 = self;
      id v60 = v38;
      id v40 = v38;
      id v41 = v19;
      sub_100006BB8(v39, v57);

      id v12 = v51;
      id v13 = v52;
    }
    if (objc_msgSend(v14, "count", v49))
    {
      id v42 = [v14 allKeys];
      v69[0] = @"T";
      v69[1] = @"BL";
      v70[0] = &off_100097750;
      v70[1] = v42;
      v69[2] = @"DBU";
      int v43 = [v15 UUIDString];
      v70[2] = v43;
      v69[3] = @"DBS";
      uint64_t v44 = +[NSNumber numberWithUnsignedInteger:a7];
      v70[3] = v44;
      id v45 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:4];

      id v46 = [(ACXCompanionSyncConnection *)self internalQueue];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10002E85C;
      v53[3] = &unk_10008CA40;
      id v54 = v42;
      long long v55 = self;
      id v56 = v45;
      id v47 = v45;
      id v48 = v42;
      sub_100006BB8(v46, v53);
    }
  }
  [(ACXCompanionSyncConnection *)self _processSystemAppChangesForNewApps:v12 updatedApps:v13 removedApps:v14];
}

- (void)noteCompanionAppDatabaseRebuild
{
  BOOL v3 = [(ACXCompanionSyncConnection *)self device];
  unsigned int v4 = [v3 supportsRemoteAppList];

  if (v4)
  {
    [(ACXCompanionSyncConnection *)self performReunionSyncWithReason:@"companion app database rebuilt"];
  }
}

- (void)fetchRemovabilityForRemoteApps
{
  BOOL v3 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = [(ACXCompanionSyncConnection *)self device];
  unsigned __int8 v5 = [v4 supportsTrackingAppRemovability];

  if (v5)
  {
    [(ACXCompanionSyncConnection *)self _onQueue_fetchRemovabilityForRemoteApps];
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (void)applicationsRemovabilityUpdated:(id)a3
{
  id v7 = a3;
  unsigned int v4 = [(ACXCompanionSyncConnection *)self internalQueue];
  dispatch_assert_queue_V2(v4);

  unsigned __int8 v5 = [(ACXCompanionSyncConnection *)self device];
  id v6 = [v5 pairingID];

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  +[ACXDeviceConnectionClient messageAllObserversForApplicationsRemovabilityChanged:v7 onDeviceWithPairingID:v6];
}

- (ACXDevice)device
{
  return self->_device;
}

- (ACXGizmoState)gizmoState
{
  return self->_gizmoState;
}

- (ACXRemoteAppList)remoteAppList
{
  return self->_remoteAppList;
}

- (ACXRemoteSystemAppList)availableSystemAppList
{
  return self->_availableSystemAppList;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (ACXInstallQueue)installQueue
{
  return self->_installQueue;
}

- (ACXAvailableApplicationManager)applicationManager
{
  return self->_applicationManager;
}

- (ACXLocalAppStoreInstallQueue)appStoreLocalQueue
{
  return self->_appStoreLocalQueue;
}

- (BOOL)reunionSyncRunning
{
  return self->_reunionSyncRunning;
}

- (void)setReunionSyncRunning:(BOOL)a3
{
  self->_reunionSyncRunning = a3;
}

- (void)setNeedsAvailableSystemAppFetch:(BOOL)a3
{
  self->_needsAvailableSystemAppFetch = a3;
}

- (BOOL)availableSystemAppFetchRunning
{
  return self->_availableSystemAppFetchRunning;
}

- (void)setAvailableSystemAppFetchRunning:(BOOL)a3
{
  self->_availableSystemAppFetchRunning = a3;
}

- (BOOL)remoteRemovabilityFetchRunning
{
  return self->_remoteRemovabilityFetchRunning;
}

- (void)setRemoteRemovabilityFetchRunning:(BOOL)a3
{
  self->_remoteRemovabilityFetchRunning = a3;
}

- (ACXRemoteAppRemovabilityManager)remoteRemovabilityManager
{
  return self->_remoteRemovabilityManager;
}

- (void)setRemoteRemovabilityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteRemovabilityManager, 0);
  objc_storeStrong((id *)&self->_appStoreLocalQueue, 0);
  objc_storeStrong((id *)&self->_applicationManager, 0);
  objc_storeStrong((id *)&self->_installQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_availableSystemAppList, 0);
  objc_storeStrong((id *)&self->_remoteAppList, 0);
  objc_storeStrong((id *)&self->_gizmoState, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end