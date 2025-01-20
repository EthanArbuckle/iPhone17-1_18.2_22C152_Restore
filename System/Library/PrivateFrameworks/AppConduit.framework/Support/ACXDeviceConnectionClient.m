@interface ACXDeviceConnectionClient
+ (void)configureService;
+ (void)messageAllObserversForApplicationDatabaseResyncedForDeviceWithPairingID:(id)a3;
+ (void)messageAllObserversForApplicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4;
+ (void)messageAllObserversForApplicationsRemovabilityChanged:(id)a3 onDeviceWithPairingID:(id)a4;
+ (void)messageAllObserversForApplicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4;
+ (void)messageAllObserversForApplicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4;
+ (void)messageAllObserversWithInstallProgressForApplication:(id)a3 progress:(double)a4 phase:(unint64_t)a5;
+ (void)messageAllObserversWithInstallStateUpdate:(id)a3;
- (ACXAvailableApplicationManager)applicationManager;
- (ACXCompanionSyncConnectionManager)companionSyncConnectionManager;
- (ACXDeviceConnectionClient)init;
- (ACXDeviceConnectionClient)initWithDeviceManager:(id)a3 companionSyncConnectionManager:(id)a4 applicationManager:(id)a5;
- (ACXDeviceManager)deviceManager;
- (BOOL)_applicationIsInstalledOnDevice:(id)a3 withBundleID:(id)a4 error:(id *)a5;
- (BOOL)_applicationIsInstalledOnDevice:(id)a3 withCompanionBundleID:(id)a4 error:(id *)a5;
- (BOOL)_setApplicationStatusForApp:(id)a3 forDeviceWithPairingID:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (NSString)clientName;
- (NSString)clientSigningIdentifier;
- (NSString)description;
- (NSXPCConnection)xpcConnection;
- (OS_os_transaction)observerTransaction;
- (id)_deviceForPairingID:(id)a3 error:(id *)a4;
- (id)_gizmoStateForDeviceWithPairingID:(id)a3 error:(id *)a4;
- (id)_hasEntitlement:(id)a3 forRequestType:(id)a4;
- (void)acknowledgeTestFlightInstallBegunForApp:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)activeComplicationsForDeviceWithPairingID:(id)a3 completion:(id)a4;
- (void)applicationIsInstalledOnAnyPairedDeviceWithBundleID:(id)a3 completion:(id)a4;
- (void)applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:(id)a3 completion:(id)a4;
- (void)applicationIsInstalledOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5;
- (void)applicationIsInstalledOnDeviceWithPairingID:(id)a3 withCompanionBundleID:(id)a4 completion:(id)a5;
- (void)applicationRemovabilityOnDeviceWithPairingID:(id)a3 completion:(id)a4;
- (void)applicationWillInstallAfterPairingOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5;
- (void)cancelPendingInstallations;
- (void)cancelUpdatePendingForCompanionApp:(id)a3 completion:(id)a4;
- (void)disableObservers;
- (void)enableObservers;
- (void)fetchApplicationDatabaseSyncInformationForDeviceWithPairingID:(id)a3 completion:(id)a4;
- (void)fetchApplicationWithContainingApplicationBundleID:(id)a3 completion:(id)a4;
- (void)fetchDuplicatedClassInfo:(id)a3;
- (void)fetchInfoForApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)fetchInstallableSystemAppBundleIDsForDeviceWithPairingID:(id)a3 completion:(id)a4;
- (void)fetchInstallableSystemAppWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)fetchInstalledApplicationsForDeviceWithPairingID:(id)a3 completion:(id)a4;
- (void)fetchInstalledCompatibleApplicationsForDeviceWithPairingID:(id)a3 completion:(id)a4;
- (void)fetchInstalledComplicationsForDeviceWithPairingID:(id)a3 completion:(id)a4;
- (void)fetchInstalledWatchAppBundleIDsForDeviceWithPairingID:(id)a3 completion:(id)a4;
- (void)fetchInstalledWatchAppWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)fetchLocalizedValuesFromAllDevicesForInfoPlistKeys:(id)a3 forAppWithBundleID:(id)a4 fetchingFirstMatchingLocalizationInList:(id)a5 completion:(id)a6;
- (void)fetchLocallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)fetchLocallyAvailableWatchAppBundleIDsWithCompletion:(id)a3;
- (void)fetchLocallyAvailableWatchAppWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)fetchProvisioningProfilesForDeviceWithPairingID:(id)a3 completion:(id)a4;
- (void)fetchWatchAppBundleIDForCompanionAppBundleID:(id)a3 completion:(id)a4;
- (void)fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:(id)a3 completion:(id)a4;
- (void)getAlwaysInstallForDeviceWithPairingID:(id)a3 completion:(id)a4;
- (void)installAllApplications;
- (void)installApplication:(id)a3 withProvisioningProfileInfo:(id)a4 forTestFlight:(BOOL)a5 onDeviceWithPairingID:(id)a6 completion:(id)a7;
- (void)installApplicationAtURL:(id)a3 onDeviceWithPairingID:(id)a4 installOptions:(id)a5 size:(int64_t)a6 completion:(id)a7;
- (void)installProvisioningProfileWithData:(id)a3 onDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)installRequestFailedForApp:(id)a3 forDeviceWithPairingID:(id)a4 failureReason:(id)a5 wasUserInitiated:(BOOL)a6 completion:(id)a7;
- (void)killDaemonForTesting:(id)a3;
- (void)removeApplication:(id)a3 fromDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)removeProvisioningProfileWithID:(id)a3 fromDeviceWithPairingID:(id)a4 completion:(id)a5;
- (void)retryPendingAppInstallationsOnDeviceWithPairingID:(id)a3;
- (void)setApplicationManager:(id)a3;
- (void)setCompanionSyncConnectionManager:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setObserverTransaction:(id)a3;
- (void)setUpdatePendingForCompanionApp:(id)a3 completion:(id)a4;
- (void)setXpcConnection:(id)a3;
- (void)systemAppIsInstallableOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5;
- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 writingToPreferencesLocation:(unint64_t)a5 forDeviceWithPairingID:(id)a6 options:(unint64_t)a7 completion:(id)a8;
@end

@implementation ACXDeviceConnectionClient

- (ACXDeviceConnectionClient)init
{
  v3 = +[ACXDeviceManager sharedManager];
  v4 = +[ACXCompanionSyncConnectionManager sharedConnectionManager];
  v5 = +[ACXAvailableApplicationManager sharedApplicationManager];
  v6 = [(ACXDeviceConnectionClient *)self initWithDeviceManager:v3 companionSyncConnectionManager:v4 applicationManager:v5];

  return v6;
}

- (ACXDeviceConnectionClient)initWithDeviceManager:(id)a3 companionSyncConnectionManager:(id)a4 applicationManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ACXDeviceConnectionClient;
  v11 = [(ACXDeviceConnectionClient *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(ACXDeviceConnectionClient *)v11 setDeviceManager:v8];
    [(ACXDeviceConnectionClient *)v12 setCompanionSyncConnectionManager:v9];
    [(ACXDeviceConnectionClient *)v12 setApplicationManager:v10];
  }

  return v12;
}

+ (void)configureService
{
  if (qword_1000A5600 != -1) {
    dispatch_once(&qword_1000A5600, &stru_10008E130);
  }
}

+ (void)messageAllObserversWithInstallStateUpdate:(id)a3
{
  id v3 = a3;
  v4 = (void *)qword_1000A55F0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100051F14;
  v6[3] = &unk_10008CD30;
  id v7 = v3;
  id v5 = v3;
  sub_100006BB8(v4, v6);
}

+ (void)messageAllObserversWithInstallProgressForApplication:(id)a3 progress:(double)a4 phase:(unint64_t)a5
{
  id v7 = a3;
  id v8 = (void *)qword_1000A55F0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100052210;
  v10[3] = &unk_10008D070;
  id v11 = v7;
  double v12 = a4;
  unint64_t v13 = a5;
  id v9 = v7;
  sub_100006BB8(v8, v10);
}

+ (void)messageAllObserversForApplicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)qword_1000A55F0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100052534;
  v10[3] = &unk_10008CC28;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  sub_100006BB8(v7, v10);
}

+ (void)messageAllObserversForApplicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)qword_1000A55F0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005284C;
  v10[3] = &unk_10008CC28;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  sub_100006BB8(v7, v10);
}

+ (void)messageAllObserversForApplicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)qword_1000A55F0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100052B64;
  v10[3] = &unk_10008CC28;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  sub_100006BB8(v7, v10);
}

+ (void)messageAllObserversForApplicationDatabaseResyncedForDeviceWithPairingID:(id)a3
{
  id v3 = a3;
  v4 = (void *)qword_1000A55F0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100052E54;
  v6[3] = &unk_10008CD30;
  id v7 = v3;
  id v5 = v3;
  sub_100006BB8(v4, v6);
}

+ (void)messageAllObserversForApplicationsRemovabilityChanged:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)qword_1000A55F0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100053160;
  v10[3] = &unk_10008CC28;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  sub_100006BB8(v7, v10);
}

- (NSString)clientName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained processIdentifier];
    id v5 = sub_100053458();
    id v6 = +[NSString stringWithFormat:@"%@ (pid %d)", v5, v4];
  }
  else
  {
    id v6 = @"Unknown client";
  }

  return (NSString *)v6;
}

- (NSString)clientSigningIdentifier
{
  id v3 = [(ACXDeviceConnectionClient *)self xpcConnection];
  id v4 = v3;
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  id v5 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);

  if (v5)
  {
    CFErrorRef error = 0;
    id v6 = (__CFString *)SecTaskCopySigningIdentifier(v5, &error);
    if (!v6)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
      {
        id v8 = [(ACXDeviceConnectionClient *)self clientName];
        MOLogWrite();
      }
      if (error)
      {
        CFRelease(error);
        CFErrorRef error = 0;
      }
    }
    CFRelease(v5);
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v9 = [(ACXDeviceConnectionClient *)self clientName];
      MOLogWrite();
    }
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (id)_hasEntitlement:(id)a3 forRequestType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXDeviceConnectionClient *)self xpcConnection];
  id v10 = v8;
  if (v8)
  {
    id v11 = [v8 valueForEntitlement:v6];
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v12 = [v11 BOOLValue];

      if (v12)
      {
        unint64_t v13 = 0;
        goto LABEL_8;
      }
    }
    else
    {
    }
    [v10 processIdentifier];
    objc_super v14 = sub_100053458();
    unint64_t v13 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient _hasEntitlement:forRequestType:]", 298, @"ACXErrorDomain", 27, 0, 0, @"Process %@ (pid %d) is missing %@ entitlement so rejecting %@ request.", v15, (uint64_t)v14);
  }
  else
  {
    unint64_t v13 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient _hasEntitlement:forRequestType:]", 293, @"ACXErrorDomain", 1, 0, 0, @"Connection was nil", v9, v17);
  }
LABEL_8:

  return v13;
}

- (id)_gizmoStateForDeviceWithPairingID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[ACXGizmoStateManager sharedStateManager];
  id v8 = v7;
  if (v6) {
    [v7 stateForPairingID:v6];
  }
  else {
  uint64_t v9 = [v7 stateForActivePairedDevice];
  }

  if (!v9)
  {
    id v10 = [v6 UUIDString];
    objc_super v14 = [(ACXDeviceConnectionClient *)self clientName];
    unsigned __int8 v12 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient _gizmoStateForDeviceWithPairingID:error:]", 314, @"ACXErrorDomain", 28, 0, 0, @"Could not get device state for device with pairing ID %@ (requested by %@)", v11, (uint64_t)v10);

    if (a4) {
      *a4 = v12;
    }
  }

  return v9;
}

- (id)_deviceForPairingID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ACXDeviceConnectionClient *)self deviceManager];
  id v8 = v7;
  if (v6) {
    [v7 deviceForPairingID:v6];
  }
  else {
  uint64_t v9 = [v7 currentActivePairedDevice];
  }

  if (!v9)
  {
    id v10 = [v6 UUIDString];
    objc_super v14 = [(ACXDeviceConnectionClient *)self clientName];
    unsigned __int8 v12 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient _deviceForPairingID:error:]", 332, @"ACXErrorDomain", 28, 0, 0, @"Could not get device with pairing ID %@ (requested by %@)", v11, (uint64_t)v10);

    if (a4) {
      *a4 = v12;
    }
  }

  return v9;
}

- (NSString)description
{
  id v3 = [(ACXDeviceConnectionClient *)self clientName];
  id v4 = +[NSString stringWithFormat:@"<ACXDeviceConnectionClient %p %@>", self, v3];

  return (NSString *)v4;
}

- (void)enableObservers
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053B80;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_1000A55F0, block);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100053C70;
  v3[3] = &unk_10008CD30;
  v3[4] = self;
  sub_100006BB8((void *)qword_1000A55F0, v3);
}

- (void)disableObservers
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053E4C;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_1000A55F0, block);
}

- (void)fetchInstalledApplicationsForDeviceWithPairingID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    v24 = [(ACXDeviceConnectionClient *)self clientName];
    MOLogWrite();
  }
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchInstalledApplicationsForDeviceWithPairingID:completion:]", v24);
  uint64_t v9 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v8];

  if (v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    id v10 = [(ACXDeviceConnectionClient *)self applicationManager];
    uint64_t v11 = [v10 allAvailableApps];

    unsigned __int8 v12 = objc_opt_new();
    id v33 = 0;
    unint64_t v13 = [(ACXDeviceConnectionClient *)self _gizmoStateForDeviceWithPairingID:v6 error:&v33];
    id v14 = v33;
    uint64_t v15 = v14;
    if (v13)
    {
      id v25 = v14;
      v26 = v11;
      v27 = v7;
      id v28 = v6;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v16 = v11;
      id v17 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v30;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            v22 = [v16 objectForKeyedSubscript:v21];
            v23 = [v22 externalApplicationDictionaryRepresentationForDeviceState:v13];
            [v12 setObject:v23 forKeyedSubscript:v21];
          }
          id v18 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v18);
      }

      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
        MOLogWrite();
      }
      id v7 = v27;
      ((void (**)(id, void *, void *))v27)[2](v27, v12, 0);
      id v6 = v28;
      uint64_t v15 = v25;
      uint64_t v11 = v26;
    }
    else
    {
      v7[2](v7, 0, v14);
    }
  }
}

- (void)fetchInstalledComplicationsForDeviceWithPairingID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    v24 = [(ACXDeviceConnectionClient *)self clientName];
    MOLogWrite();
  }
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchInstalledComplicationsForDeviceWithPairingID:completion:]", v24);
  uint64_t v9 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v8];

  if (v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    id v10 = [(ACXDeviceConnectionClient *)self applicationManager];
    uint64_t v11 = [v10 allAvailableApps];

    unsigned __int8 v12 = objc_opt_new();
    id v33 = 0;
    unint64_t v13 = [(ACXDeviceConnectionClient *)self _gizmoStateForDeviceWithPairingID:v6 error:&v33];
    id v14 = v33;
    uint64_t v15 = v14;
    if (v13)
    {
      id v25 = v14;
      v26 = v11;
      v27 = v7;
      id v28 = v6;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v16 = v11;
      id v17 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v30;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            v22 = [v16 objectForKeyedSubscript:v21];
            if ([v22 hasComplication])
            {
              v23 = [v22 externalComplicationDictionaryRepresentationForDeviceState:v13];
              [v12 setObject:v23 forKeyedSubscript:v21];
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v18);
      }

      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
        MOLogWrite();
      }
      id v7 = v27;
      ((void (**)(id, void *, void *))v27)[2](v27, v12, 0);
      id v6 = v28;
      uint64_t v15 = v25;
      uint64_t v11 = v26;
    }
    else
    {
      v7[2](v7, 0, v14);
    }
  }
}

- (void)activeComplicationsForDeviceWithPairingID:(id)a3 completion:(id)a4
{
  id v17 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    id v16 = [(ACXDeviceConnectionClient *)self clientName];
    MOLogWrite();
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient activeComplicationsForDeviceWithPairingID:completion:]", v16);
  id v8 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v7];

  if (v8)
  {
    v6[2](v6, 0, v8);
  }
  else
  {
    uint64_t v9 = +[NRPairedDeviceRegistry sharedInstance];
    id v10 = v9;
    if (v17) {
      objc_msgSend(v9, "deviceForPairingID:");
    }
    else {
    uint64_t v11 = [v9 getActivePairedDevice];
    }

    id v12 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.sockpuppet.activeComplications" pairedDevice:v11];
    id v13 = [v12 synchronize];
    id v14 = [v12 arrayForKey:@"activeComplications"];
    id v15 = [v14 copy];

    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
      MOLogWrite();
    }
    ((void (**)(id, id, void *))v6)[2](v6, v15, 0);
  }
}

- (void)fetchInstalledCompatibleApplicationsForDeviceWithPairingID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    long long v29 = [(ACXDeviceConnectionClient *)self clientName];
    MOLogWrite();
  }
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchInstalledCompatibleApplicationsForDeviceWithPairingID:completion:]", v29);
  uint64_t v9 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v8];

  if (v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    id v10 = [(ACXDeviceConnectionClient *)self applicationManager];
    uint64_t v11 = [v10 allAvailableApps];

    v35 = objc_opt_new();
    id v40 = 0;
    id v12 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v6 error:&v40];
    id v13 = v40;
    if (v12)
    {
      id v14 = +[ACXGizmoStateManager sharedStateManager];
      id v15 = [v14 stateForDevice:v12];

      if (v15)
      {
        id v31 = v13;
        long long v32 = v11;
        id v33 = v7;
        id v34 = v6;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v16 = v11;
        id v17 = [v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v37;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v37 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              v22 = [v16 objectForKeyedSubscript:v21];
              v23 = [v12 osVersion];
              unsigned int v24 = [v22 isCompatibleWithOSVersion:v23];

              if (v24)
              {
                id v25 = [v22 externalApplicationDictionaryRepresentationForDeviceState:v15];
                [v35 setObject:v25 forKeyedSubscript:v21];
              }
            }
            id v18 = [v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
          }
          while (v18);
        }

        if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
          MOLogWrite();
        }
        id v7 = v33;
        ((void (**)(id, void *, void *))v33)[2](v33, v35, 0);
        id v6 = v34;
        uint64_t v11 = v32;
        uint64_t v9 = 0;
        id v13 = v31;
      }
      else
      {
        v26 = [v6 UUIDString];
        long long v30 = [(ACXDeviceConnectionClient *)self clientName];
        uint64_t v28 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient fetchInstalledCompatibleApplicationsForDeviceWithPairingID:completion:]", 490, @"ACXErrorDomain", 28, 0, 0, @"Could not get state for device with pairing ID %@ (requested by %@).", v27, (uint64_t)v26);

        v7[2](v7, 0, (void *)v28);
        id v13 = (id)v28;
      }
    }
    else
    {
      v7[2](v7, 0, v13);
    }
  }
}

- (void)fetchApplicationWithContainingApplicationBundleID:(id)a3 completion:(id)a4
{
  id v19 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    id v17 = [(ACXDeviceConnectionClient *)self clientName];
    id v18 = v19;
    MOLogWrite();
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchApplicationWithContainingApplicationBundleID:completion:]", v17, v18);
  id v8 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v7];

  if (v8)
  {
    v6[2](v6, 0, v8);
  }
  else
  {
    uint64_t v9 = objc_opt_new();
    id v10 = +[ACXGizmoStateManager sharedStateManager];
    uint64_t v11 = [v10 stateForActivePairedDevice];

    id v12 = [(ACXDeviceConnectionClient *)self applicationManager];
    id v13 = [v12 gizmoAppForCompanionAppBundleID:v19];

    if (v13)
    {
      id v14 = [v13 exportedAppStateForDeviceState:v11];
      if (v14)
      {
        id v15 = +[NSNumber numberWithInteger:v14];
        id v16 = [v13 bundleIdentifier];
        [v9 setObject:v15 forKeyedSubscript:v16];
      }
    }
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
      MOLogWrite();
    }
    ((void (**)(id, void *, void *))v6)[2](v6, v9, 0);
  }
}

- (void)fetchInfoForApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    id v25 = [(ACXDeviceConnectionClient *)self clientName];
    id v26 = v8;
    MOLogWrite();
  }
  uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchInfoForApplicationWithBundleID:forDeviceWithPairingID:completion:]", v25, v26);
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (v12)
  {
    v10[2](v10, 0, v12);
  }
  else
  {
    id v30 = 0;
    id v13 = [(ACXDeviceConnectionClient *)self _gizmoStateForDeviceWithPairingID:v9 error:&v30];
    id v14 = v30;
    if (v13)
    {
      id v15 = [(ACXDeviceConnectionClient *)self applicationManager];
      id v16 = [v15 allAvailableApps];

      long long v29 = v16;
      id v17 = [v16 objectForKeyedSubscript:v8];
      id v18 = v17;
      if (v17)
      {
        id v19 = [v17 externalApplicationDictionaryRepresentationForDeviceState:v13];
      }
      else
      {
        id v19 = 0;
      }
      if ([v19 count])
      {
        if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
          MOLogWrite();
        }
        ((void (**)(id, void *, void *))v10)[2](v10, v19, 0);
      }
      else
      {
        [v9 UUIDString];
        v20 = id v28 = v14;
        uint64_t v27 = [(ACXDeviceConnectionClient *)self clientName];
        unsigned int v24 = sub_100007574((uint64_t)"-[ACXDeviceConnectionClient fetchInfoForApplicationWithBundleID:forDeviceWithPairingID:completion:]", 567, @"ACXErrorDomain", 19, @"No watch app found with bundle ID %@ on device with pairing ID %@ (requested by %@)", v21, v22, v23, (uint64_t)v8);

        id v14 = v28;
        v10[2](v10, 0, v24);
      }
    }
    else
    {
      v10[2](v10, 0, v14);
    }
  }
}

- (void)fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:(id)a3 completion:(id)a4
{
  id v16 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    id v13 = [(ACXDeviceConnectionClient *)self clientName];
    id v14 = v16;
    MOLogWrite();
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:completion:]", v13, v14);
  id v8 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v7];

  if (v8)
  {
    v6[2](v6, 0, v8);
  }
  else
  {
    id v9 = [(ACXDeviceConnectionClient *)self applicationManager];
    id v10 = [v9 gizmoAppWithBundleID:v16];

    if (v10)
    {
      uint64_t v11 = [v10 watchAppURL];
      ((void (**)(id, void *, void *))v6)[2](v6, v11, 0);
    }
    else
    {
      id v15 = [(ACXDeviceConnectionClient *)self clientName];
      uint64_t v11 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:completion:]", 588, @"ACXErrorDomain", 19, 0, 0, @"No watch app found with bundle ID %@ (requested by %@)", v12, (uint64_t)v16);

      v6[2](v6, 0, v11);
    }
  }
}

- (void)fetchWatchAppBundleIDForCompanionAppBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    id v28 = [(ACXDeviceConnectionClient *)self clientName];
    id v29 = v6;
    MOLogWrite();
  }
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchWatchAppBundleIDForCompanionAppBundleID:completion:]", v28, v29);
  id v9 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v8];

  if (v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    id v10 = [(ACXDeviceConnectionClient *)self applicationManager];
    uint64_t v11 = [v10 gizmoAppBundleIDForCompanionAppBundleID:v6];

    if (v11)
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
        MOLogWrite();
      }
      ((void (**)(id, void *, void *))v7)[2](v7, v11, 0);
    }
    else
    {
      id v31 = v7;
      uint64_t v12 = [(ACXDeviceConnectionClient *)self deviceManager];
      id v13 = [v12 allDevices];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = v13;
      id v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v33;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v33 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            v20 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
            uint64_t v21 = [v20 connectionForDevice:v19];

            if ([v21 supportsRemoteAppList])
            {
              uint64_t v22 = [v21 remoteAppList];
              uint64_t v23 = [v22 appBundleIDForCounterpartBundleID:v6 error:0];

              if (v23)
              {
                id v7 = v31;
                ((void (**)(id, void *, void *))v31)[2](v31, v23, 0);

                goto LABEL_22;
              }
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      id v30 = [(ACXDeviceConnectionClient *)self clientName];
      uint64_t v27 = sub_100007574((uint64_t)"-[ACXDeviceConnectionClient fetchWatchAppBundleIDForCompanionAppBundleID:completion:]", 624, @"ACXErrorDomain", 19, @"No watch app found for companion app bundle ID %@ (requested by %@)", v24, v25, v26, (uint64_t)v6);

      id v7 = v31;
      v31[2](v31, 0, v27);

LABEL_22:
      uint64_t v11 = 0;
    }
  }
}

- (void)installAllApplications
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v7 = [(ACXDeviceConnectionClient *)self clientName];
    MOLogWrite();
  }
  id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient installAllApplications]", v7);
  id v8 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v3];

  id v4 = v8;
  if (!v8)
  {
    id v5 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
    id v6 = [v5 connectionForActivePairedDevice];
    [v6 installAllApplications];

    id v4 = 0;
  }
}

- (void)cancelPendingInstallations
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v7 = [(ACXDeviceConnectionClient *)self clientName];
    MOLogWrite();
  }
  id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient cancelPendingInstallations]", v7);
  id v8 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v3];

  id v4 = v8;
  if (!v8)
  {
    id v5 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
    id v6 = [v5 connectionForActivePairedDevice];
    [v6 cancelPendingInstallations];

    id v4 = 0;
  }
}

- (void)retryPendingAppInstallationsOnDeviceWithPairingID:(id)a3
{
  id v15 = a3;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v14 = [(ACXDeviceConnectionClient *)self clientName];
    MOLogWrite();
  }
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient retryPendingAppInstallationsOnDeviceWithPairingID:]", v14);
  id v5 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v4];

  if (!v5)
  {
    id v6 = [(ACXDeviceConnectionClient *)self deviceManager];
    id v7 = [v6 currentActivePairedDevice];

    id v8 = [v7 pairingID];
    unsigned __int8 v9 = [v8 isEqual:v15];

    if (v9)
    {
      id v10 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
      uint64_t v11 = [v10 connectionForActivePairedDevice];
      uint64_t v12 = [(ACXDeviceConnectionClient *)self clientName];
      id v13 = +[NSString stringWithFormat:@"retryPendingAppInstallations for %@", v12];
      [v11 performReunionSyncWithReason:v13];
    }
    else
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
        goto LABEL_11;
      }
      id v10 = [v7 pairingID];
      MOLogWrite();
    }

LABEL_11:
  }
}

- (void)installApplication:(id)a3 withProvisioningProfileInfo:(id)a4 forTestFlight:(BOOL)a5 onDeviceWithPairingID:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, void, void *))a7;
  id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient installApplication:withProvisioningProfileInfo:forTestFlight:onDeviceWithPairingID:completion:]");
  id v17 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v16];

  if (v17) {
    goto LABEL_2;
  }
  if (!v9
    || ([(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.profiles.allow" forRequestType:@"install application for TestFlight"], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      uint64_t v19 = [(ACXDeviceConnectionClient *)self clientName];
      v20 = (void *)v19;
      uint64_t v21 = "not for test flight";
      if (v9) {
        uint64_t v21 = "for test flight";
      }
      id v53 = v12;
      v58 = v21;
      uint64_t v52 = v19;
      MOLogWrite();
    }
    qos_class_t v22 = qos_class_self();
    uint64_t v23 = dispatch_get_global_queue(v22, 0);
    sub_100006BB8(v23, &stru_10008E150);

    id v62 = 0;
    uint64_t v24 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v14 error:&v62];
    id v17 = v62;
    if (!v24)
    {
      id v30 = sub_100051464(8, v17, v12, (void *)1);
      v15[2](v15, 0, v30);
      uint64_t v25 = v14;
LABEL_28:

      id v14 = v25;
      goto LABEL_29;
    }
    uint64_t v25 = [v24 pairingID];

    uint64_t v26 = [v24 nrDevice];
    BOOL v27 = sub_100051AF8(v26);

    if (v27)
    {
      v54 = [v25 UUIDString];
      id v29 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient installApplication:withProvisioningProfileInfo:forTestFlight:onDeviceWithPairingID:completion:]", 718, @"ACXErrorDomain", 57, 0, 0, @"The app %@ cannot be installed on the device with pairing ID %@ because app installation is prohibited by a device management restriction.", v28, (uint64_t)v12);

      id v30 = sub_100051464(10, v29, v12, (void *)1);
      v15[2](v15, 0, v30);
LABEL_23:
      id v17 = v29;
      goto LABEL_28;
    }
    id v31 = [(ACXDeviceConnectionClient *)self applicationManager];
    id v30 = [v31 gizmoAppWithBundleID:v12];

    if (!v30)
    {
      long long v36 = [v25 UUIDString];
      v59 = [(ACXDeviceConnectionClient *)self clientName];
      id v29 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient installApplication:withProvisioningProfileInfo:forTestFlight:onDeviceWithPairingID:completion:]", 726, @"ACXErrorDomain", 19, 0, 0, @"No WatchKit app is installed with the identifier %@ on device with pairing ID %@ (requested by %@)", v37, (uint64_t)v12);

      v15[2](v15, 0, v29);
      goto LABEL_23;
    }
    if ([v30 isEligibleForWatchAppInstall])
    {
      if ([v24 isReachable])
      {
        if (![v30 isBetaApp]
          || ![v30 isEmbeddedPlaceholder]
          || ([(ACXDeviceConnectionClient *)self clientSigningIdentifier],
              long long v32 = objc_claimAutoreleasedReturnValue(),
              unsigned int v60 = [v32 isEqualToString:@"com.apple.TestFlight"],
              v32,
              !v60))
        {
          if (!objc_msgSend(v30, "isBetaApp", v52, v53, v58)
            || ([(ACXDeviceConnectionClient *)self clientSigningIdentifier],
                v43 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v61 = [v43 isEqualToString:@"com.apple.TestFlight"],
                v43,
                (v61 & 1) != 0)
            || v9)
          {
            v45 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
            v46 = [v45 connectionForDevice:v24];

            if (v46)
            {
              [v46 installWatchAppWithBundleID:v12 withProvisioningProfileInfo:v13 completionWithError:v15];
            }
            else
            {
              v47 = [v25 UUIDString];
              v49 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient installApplication:withProvisioningProfileInfo:forTestFlight:onDeviceWithPairingID:completion:]", 764, @"ACXErrorDomain", 28, 0, 0, @"No sync connection found for device with pairing ID %@", v48, (uint64_t)v47);

              v50 = [v30 applicationName];
              v51 = sub_100051464(8, v49, v50, (void *)1);

              v15[2](v15, 0, v51);
              id v17 = v49;
            }
          }
          else
          {
            v44 = +[ACXTestFlightInstallQueue sharedInstaller];
            [v44 installWatchApp:v30 targetDevice:v24];

            v15[2](v15, 1, 0);
          }
          goto LABEL_28;
        }
        long long v33 = [v25 UUIDString];
        v55 = [v30 bundleIdentifier];
        long long v35 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient installApplication:withProvisioningProfileInfo:forTestFlight:onDeviceWithPairingID:completion:]", 749, @"ACXErrorDomain", 53, 0, 0, @"Ignoring installation request from TestFlight for beta app %@ on the device with  pairing ID %@ because it only contains a placeholder watch app and App Store cannot install TestFlight apps.", v34, (uint64_t)v33);

        v15[2](v15, 0, v35);
        goto LABEL_27;
      }
      v57 = [v25 UUIDString];
      long long v35 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient installApplication:withProvisioningProfileInfo:forTestFlight:onDeviceWithPairingID:completion:]", 739, @"ACXErrorDomain", 55, 0, 0, @"Ignoring request to install app %@ because the device with pairing ID %@ isn't reachable", v41, (uint64_t)v12);

      long long v39 = [v30 applicationName];
      uint64_t v40 = 8;
    }
    else
    {
      v56 = [v25 UUIDString];
      long long v35 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient installApplication:withProvisioningProfileInfo:forTestFlight:onDeviceWithPairingID:completion:]", 732, @"ACXErrorDomain", 59, 0, 0, @"The app %@ cannot be installed on the device with pairing ID %@ because it isn't eligible for Watch installs.", v38, (uint64_t)v12);

      long long v39 = [v30 applicationName];
      uint64_t v40 = 12;
    }
    v42 = sub_100051464(v40, v35, v39, (void *)1);

    v15[2](v15, 0, v42);
LABEL_27:
    id v17 = v35;
    goto LABEL_28;
  }
  id v17 = (id)v18;
LABEL_2:
  v15[2](v15, 0, v17);
LABEL_29:
}

- (void)installApplicationAtURL:(id)a3 onDeviceWithPairingID:(id)a4 installOptions:(id)a5 size:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void, void *))a7;
  id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient installApplicationAtURL:onDeviceWithPairingID:installOptions:size:completion:]");
  id v17 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v16];

  if (!v17)
  {
    qos_class_t v18 = qos_class_self();
    uint64_t v19 = dispatch_get_global_queue(v18, 0);
    sub_100006BB8(v19, &stru_10008E170);

    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      v20 = [(ACXDeviceConnectionClient *)self clientName];
      [v12 path];
      v44 = v43 = v20;
      MOLogWrite();
    }
    id v49 = 0;
    uint64_t v21 = -[ACXDeviceConnectionClient _deviceForPairingID:error:](self, "_deviceForPairingID:error:", v13, &v49, v43, v44);
    id v22 = v49;
    if (v21)
    {
      id v48 = v14;
      uint64_t v23 = [v21 pairingID];

      uint64_t v24 = [v21 nrDevice];
      BOOL v25 = sub_100051AF8(v24);

      if (v25)
      {
        uint64_t v26 = [v12 path];
        v45 = [v23 UUIDString];
        uint64_t v28 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient installApplicationAtURL:onDeviceWithPairingID:installOptions:size:completion:]", 805, @"ACXErrorDomain", 57, 0, 0, @"The application at path %@ cannot be installed on the device with pairing ID %@ because app installation is prohibited by a device management restriction.", v27, (uint64_t)v26);

        id v29 = [v12 lastPathComponent];
        id v30 = sub_100051464(10, v28, v29, (void *)1);

        v15[2](v15, 0, v30);
        id v22 = v28;
LABEL_16:
        id v13 = v23;
        id v14 = v48;
        goto LABEL_17;
      }
      if ([v21 isReachable])
      {
        long long v32 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
        id v30 = [v32 connectionForDevice:v21];

        if (v30)
        {
          [v30 installWatchAppAtURL:v12 installOptions:v48 size:a6 completionWithError:v15];
          id v13 = v23;
          id v14 = v48;
          goto LABEL_17;
        }
        long long v39 = [v23 UUIDString];
        v46 = [(ACXDeviceConnectionClient *)self clientName];
        uint64_t v38 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient installApplicationAtURL:onDeviceWithPairingID:installOptions:size:completion:]", 820, @"ACXErrorDomain", 28, 0, 0, @"No sync connection found for device with pairing ID %@ (requested by %@)", v40, (uint64_t)v39);

        uint64_t v41 = [v12 lastPathComponent];
        v42 = sub_100051464(8, v38, v41, (void *)1);

        v15[2](v15, 0, v42);
      }
      else
      {
        long long v33 = [v12 path];
        uint64_t v34 = [v23 UUIDString];
        v47 = [(ACXDeviceConnectionClient *)self clientName];
        long long v36 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient installApplicationAtURL:onDeviceWithPairingID:installOptions:size:completion:]", 812, @"ACXErrorDomain", 55, 0, 0, @"Ignoring request to install app at %@ as the device with pairing ID %@ isn't reachable (requested by %@)", v35, (uint64_t)v33);

        uint64_t v37 = [v12 lastPathComponent];
        uint64_t v38 = v36;
        id v30 = sub_100051464(8, v36, v37, (void *)1);

        v15[2](v15, 0, v30);
      }
      id v22 = v38;
      goto LABEL_16;
    }
    id v31 = [v12 lastPathComponent];
    id v30 = sub_100051464(8, v22, v31, (void *)1);

    v15[2](v15, 0, v30);
LABEL_17:

    goto LABEL_18;
  }
  v15[2](v15, 0, v17);
LABEL_18:
}

- (void)removeApplication:(id)a3 fromDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v26 = [(ACXDeviceConnectionClient *)self clientName];
    id v27 = v8;
    MOLogWrite();
  }
  uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient removeApplication:fromDeviceWithPairingID:completion:]", v26, v27);
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (v12)
  {
    v10[2](v10, 0, v12);
  }
  else
  {
    id v32 = 0;
    id v13 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v9 error:&v32];
    id v14 = v32;
    if (v13)
    {
      id v15 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
      id v16 = [v15 connectionForDevice:v13];

      if (v16)
      {
        id v17 = [v16 remoteAppWithBundleID:v8];
        if (v17)
        {
          if ([v13 isReachable])
          {
            [v16 removeWatchAppWithBundleID:v17 completion:v10];
          }
          else
          {
            id v31 = [v13 pairingID];
            id v30 = [v31 UUIDString];
            id v29 = [(ACXDeviceConnectionClient *)self clientName];
            uint64_t v23 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient removeApplication:fromDeviceWithPairingID:completion:]", 866, @"ACXErrorDomain", 55, 0, 0, @"Ignoring request to remove app %@ because the device with pairing ID %@ isn't reachable (requested by %@)", v22, (uint64_t)v8);

            uint64_t v24 = [v17 applicationName];
            BOOL v25 = sub_100051464(8, v23, v24, (void *)2);

            v10[2](v10, 0, v25);
            id v14 = v23;
          }
        }
        else
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
            MOLogWrite();
          }
          v10[2](v10, 5, 0);
        }
      }
      else
      {
        qos_class_t v18 = [v13 pairingID];
        uint64_t v19 = [v18 UUIDString];
        uint64_t v28 = [(ACXDeviceConnectionClient *)self clientName];
        uint64_t v21 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient removeApplication:fromDeviceWithPairingID:completion:]", 852, @"ACXErrorDomain", 1, 0, 0, @"Failed to get connection for device with pairing ID %@ (requested by %@)", v20, (uint64_t)v19);

        id v16 = sub_100051464(8, v21, v8, (void *)2);
        v10[2](v10, 0, v16);
        id v14 = v21;
      }
    }
    else
    {
      id v16 = sub_100051464(8, v14, v8, (void *)2);
      v10[2](v10, 0, v16);
    }
  }
}

- (void)getAlwaysInstallForDeviceWithPairingID:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void))a4;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v10 = [(ACXDeviceConnectionClient *)self clientName];
    MOLogWrite();
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient getAlwaysInstallForDeviceWithPairingID:completion:]", v10);
  id v8 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v7];

  if (v8)
  {
    v6[2](v6, 0);
  }
  else
  {
    id v9 = [(ACXDeviceConnectionClient *)self _gizmoStateForDeviceWithPairingID:v11 error:0];
    ((void (**)(id, id))v6)[2](v6, [v9 alwaysInstallApps]);
  }
}

- (void)installProvisioningProfileWithData:(id)a3 onDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient installProvisioningProfileWithData:onDeviceWithPairingID:completion:]");
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (v12) {
    goto LABEL_4;
  }
  uint64_t v13 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.profiles.allow" forRequestType:@"install provisioning profile"];
  if (v13)
  {
    id v12 = (id)v13;
LABEL_4:
    v10[2](v10, 0, v12);
    goto LABEL_5;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v21 = [(ACXDeviceConnectionClient *)self clientName];
    MOLogWrite();
  }
  id v23 = 0;
  id v14 = -[ACXDeviceConnectionClient _deviceForPairingID:error:](self, "_deviceForPairingID:error:", v9, &v23, v21);
  id v12 = v23;
  if (v14)
  {
    if ([v14 isReachable])
    {
      id v15 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
      id v16 = [v15 connectionForDevice:v14];
      [v16 installProvisioningProfileWithData:v8 completion:v10];
    }
    else
    {
      id v17 = [v14 pairingID];
      qos_class_t v18 = [v17 UUIDString];
      uint64_t v22 = [(ACXDeviceConnectionClient *)self clientName];
      uint64_t v20 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient installProvisioningProfileWithData:onDeviceWithPairingID:completion:]", 918, @"ACXErrorDomain", 55, 0, 0, @"Ignoring request to install provisioning profile as the device with pairing ID %@ isn't reachable (requested by %@)", v19, (uint64_t)v18);

      v10[2](v10, 0, (id)v20);
      id v12 = (id)v20;
    }
  }
  else
  {
    v10[2](v10, 0, v12);
  }

LABEL_5:
}

- (void)removeProvisioningProfileWithID:(id)a3 fromDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient removeProvisioningProfileWithID:fromDeviceWithPairingID:completion:]");
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (v12) {
    goto LABEL_4;
  }
  uint64_t v13 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.profiles.allow" forRequestType:@"remove provisioning profile"];
  if (v13)
  {
    id v12 = (id)v13;
LABEL_4:
    v10[2](v10, 0, v12);
    goto LABEL_5;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v21 = [(ACXDeviceConnectionClient *)self clientName];
    id v22 = v8;
    MOLogWrite();
  }
  id v24 = 0;
  id v14 = -[ACXDeviceConnectionClient _deviceForPairingID:error:](self, "_deviceForPairingID:error:", v9, &v24, v21, v22);
  id v12 = v24;
  if (v14)
  {
    if ([v14 isReachable])
    {
      id v15 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
      id v16 = [v15 connectionForDevice:v14];
      [v16 removeProvisioningProfileWithID:v8 completion:v10];
    }
    else
    {
      id v17 = [v14 pairingID];
      qos_class_t v18 = [v17 UUIDString];
      id v23 = [(ACXDeviceConnectionClient *)self clientName];
      uint64_t v20 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient removeProvisioningProfileWithID:fromDeviceWithPairingID:completion:]", 952, @"ACXErrorDomain", 55, 0, 0, @"Ignoring request to remove provisioning profile as the device with pairing ID %@ isn't reachable (requested by %@)", v19, (uint64_t)v18);

      v10[2](v10, 0, (id)v20);
      id v12 = (id)v20;
    }
  }
  else
  {
    v10[2](v10, 0, v12);
  }

LABEL_5:
}

- (void)fetchProvisioningProfilesForDeviceWithPairingID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchProvisioningProfilesForDeviceWithPairingID:completion:]");
  id v9 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v8];

  if (v9) {
    goto LABEL_4;
  }
  uint64_t v10 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.profiles.allow" forRequestType:@"fetch provisioning profiles"];
  if (v10)
  {
    id v9 = (id)v10;
LABEL_4:
    v7[2](v7, 0, v9);
    goto LABEL_5;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    qos_class_t v18 = [(ACXDeviceConnectionClient *)self clientName];
    MOLogWrite();
  }
  id v20 = 0;
  id v11 = -[ACXDeviceConnectionClient _deviceForPairingID:error:](self, "_deviceForPairingID:error:", v6, &v20, v18);
  id v9 = v20;
  if (v11)
  {
    if ([v11 isReachable])
    {
      id v12 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
      uint64_t v13 = [v12 connectionForDevice:v11];
      [v13 fetchProvisioningProfilesWithCompletion:v7];
    }
    else
    {
      id v14 = [v11 pairingID];
      id v15 = [v14 UUIDString];
      uint64_t v19 = [(ACXDeviceConnectionClient *)self clientName];
      uint64_t v17 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient fetchProvisioningProfilesForDeviceWithPairingID:completion:]", 986, @"ACXErrorDomain", 55, 0, 0, @"Ignoring request to fetch provisioning profiles as the device with pairing ID %@ isn't reachable (requested by %@)", v16, (uint64_t)v15);

      v7[2](v7, 0, (id)v17);
      id v9 = (id)v17;
    }
  }
  else
  {
    v7[2](v7, 0, v9);
  }

LABEL_5:
}

- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v21 = [(ACXDeviceConnectionClient *)self clientName];
    id v22 = v8;
    MOLogWrite();
  }
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchProvisioningProfilesForApplicationWithBundleID:forDeviceWithPairingID:completion:]", v21, v22);
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (v12)
  {
    v10[2](v10, 0, v12);
  }
  else
  {
    id v24 = 0;
    uint64_t v13 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v9 error:&v24];
    id v14 = v24;
    if (v13)
    {
      if ([v13 isReachable])
      {
        id v15 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
        uint64_t v16 = [v15 connectionForDevice:v13];
        [v16 fetchProvisioningProfilesForApplicationWithBundleID:v8 completion:v10];
      }
      else
      {
        uint64_t v17 = [v13 pairingID];
        qos_class_t v18 = [v17 UUIDString];
        id v23 = [(ACXDeviceConnectionClient *)self clientName];
        uint64_t v20 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient fetchProvisioningProfilesForApplicationWithBundleID:forDeviceWithPairingID:completion:]", 1014, @"ACXErrorDomain", 55, 0, 0, @"Ignoring request to fetch provisioning profiles for app %@ as the device with pairing ID %@ isn't reachable (requested by %@)", v19, (uint64_t)v8);

        v10[2](v10, 0, (void *)v20);
        id v14 = (id)v20;
      }
    }
    else
    {
      v10[2](v10, 0, v14);
    }
  }
}

- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 writingToPreferencesLocation:(unint64_t)a5 forDeviceWithPairingID:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  uint64_t v17 = (void (**)(id, id))a8;
  qos_class_t v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient updatePreferencesForApplicationWithIdentifier:preferences:writingToPreferencesLocation:forDeviceWithPairingID:options:completion:]");
  id v19 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v18];

  if (v19) {
    goto LABEL_4;
  }
  uint64_t v20 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.preferences.allow" forRequestType:@"update preferences"];
  if (v20)
  {
    id v19 = (id)v20;
LABEL_4:
    v17[2](v17, v19);
    goto LABEL_5;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v28 = [(ACXDeviceConnectionClient *)self clientName];
    id v29 = v14;
    MOLogWrite();
  }
  id v31 = 0;
  uint64_t v21 = -[ACXDeviceConnectionClient _deviceForPairingID:error:](self, "_deviceForPairingID:error:", v16, &v31, v28, v29);
  id v19 = v31;
  if (v21)
  {
    if ([v21 isReachable])
    {
      id v22 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
      id v23 = [v22 connectionForDevice:v21];
      [v23 updatePreferencesForApplicationWithIdentifier:v14 preferences:v15 writingToPreferencesLocation:a5 options:a7 completion:v17];
    }
    else
    {
      id v24 = [v21 pairingID];
      BOOL v25 = [v24 UUIDString];
      id v30 = [(ACXDeviceConnectionClient *)self clientName];
      uint64_t v27 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient updatePreferencesForApplicationWithIdentifier:preferences:writingToPreferencesLocation:forDeviceWithPairingID:options:completion:]", 1048, @"ACXErrorDomain", 55, 0, 0, @"Ignoring request to update preferences for app %@ as the device with pairing ID %@ isn't reachable (requested by %@)", v26, (uint64_t)v14);

      v17[2](v17, (id)v27);
      id v19 = (id)v27;
    }
  }
  else
  {
    v17[2](v17, v19);
  }

LABEL_5:
}

- (void)setUpdatePendingForCompanionApp:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v11 = [(ACXDeviceConnectionClient *)self clientName];
    id v12 = v13;
    MOLogWrite();
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient setUpdatePendingForCompanionApp:completion:]", v11, v12);
  id v8 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v7];

  if (v8)
  {
    v6[2](v6, v8);
  }
  else
  {
    id v9 = +[ACXGizmoStateManager sharedStateManager];
    uint64_t v10 = [v9 stateForActivePairedDevice];
    [v10 setUpdatePendingForCompanionApp:v13];

    v6[2](v6, 0);
  }
}

- (void)cancelUpdatePendingForCompanionApp:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v11 = [(ACXDeviceConnectionClient *)self clientName];
    id v12 = v13;
    MOLogWrite();
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient cancelUpdatePendingForCompanionApp:completion:]", v11, v12);
  id v8 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v7];

  if (v8)
  {
    v6[2](v6, v8);
  }
  else
  {
    id v9 = +[ACXGizmoStateManager sharedStateManager];
    uint64_t v10 = [v9 stateForActivePairedDevice];
    [v10 cancelUpdatePendingForCompanionApp:v13];

    v6[2](v6, 0);
  }
}

- (void)applicationWillInstallAfterPairingOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, id))a5;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    BOOL v25 = [(ACXDeviceConnectionClient *)self clientName];
    id v26 = v9;
    MOLogWrite();
  }
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient applicationWillInstallAfterPairingOnDeviceWithPairingID:withBundleID:completion:]", v25, v26);
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (!v12)
  {
    id v13 = +[NSFileManager defaultManager];
    id v14 = sub_100009880();
    id v15 = [v14 path];
    unsigned __int8 v16 = [v13 fileExistsAtPath:v15];

    if (v16)
    {
      id v17 = 0;
    }
    else
    {
      id v28 = 0;
      qos_class_t v18 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v8 error:&v28];
      id v17 = v28;
      if (!v18)
      {
        v10[2](v10, 0, v17);
LABEL_15:

        goto LABEL_16;
      }
    }
    id v19 = +[NSSet setWithObjects:@"com.apple.NanoPassbook", @"com.apple.NanoHeartRhythm", @"com.apple.HeartRate", @"com.apple.NanoHealthBalance", 0];
    if ([v19 containsObject:v9])
    {
      v10[2](v10, 1, 0);
    }
    else
    {
      uint64_t v20 = [v8 UUIDString];
      uint64_t v27 = [(ACXDeviceConnectionClient *)self clientName];
      uint64_t v24 = sub_100007574((uint64_t)"-[ACXDeviceConnectionClient applicationWillInstallAfterPairingOnDeviceWithPairingID:withBundleID:completion:]", 1115, @"ACXErrorDomain", 1, @"Querying whether %@ will be installed after pairing is not supported for pairing ID %@ (requested by %@)", v21, v22, v23, (uint64_t)v9);

      v10[2](v10, 0, (id)v24);
      id v17 = (id)v24;
    }

    goto LABEL_15;
  }
  v10[2](v10, 0, v12);
LABEL_16:
}

- (void)fetchLocallyAvailableWatchAppBundleIDsWithCompletion:(id)a3
{
  id v9 = (void (**)(void))a3;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v8 = [(ACXDeviceConnectionClient *)self clientName];
    MOLogWrite();
  }
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchLocallyAvailableWatchAppBundleIDsWithCompletion:]", v8);
  id v5 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v4];

  if (v5)
  {
    v9[2]();
  }
  else
  {
    id v6 = [(ACXDeviceConnectionClient *)self applicationManager];
    id v7 = [v6 bundleIDsOfAvailableAppsExcludingSystemApps];
    ((void (*)(void (**)(void), void *, void))v9[2])(v9, v7, 0);
  }
}

- (void)fetchInstalledWatchAppBundleIDsForDeviceWithPairingID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v20 = [(ACXDeviceConnectionClient *)self clientName];
    MOLogWrite();
  }
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchInstalledWatchAppBundleIDsForDeviceWithPairingID:completion:]", v20);
  id v9 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v8];

  if (v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    id v22 = 0;
    uint64_t v10 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v6 error:&v22];
    id v11 = v22;
    if (v10)
    {
      id v12 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
      id v13 = [v12 connectionForDevice:v10];

      if ([v13 supportsRemoteAppList])
      {
        id v14 = [v13 remoteAppList];
        id v21 = v11;
        id v15 = [v14 bundleIDsTrackedWithError:&v21];
        id v16 = v21;

        if (v15)
        {
          id v17 = v15;
          id v18 = 0;
        }
        else
        {
          id v17 = 0;
          id v18 = v16;
        }
        ((void (**)(id, void *, void *))v7)[2](v7, v17, v18);
      }
      else
      {
        id v15 = [v13 gizmoState];
        id v19 = [v15 bundleIDsOfAllInstalledApps];
        ((void (**)(id, void *, void *))v7)[2](v7, v19, 0);

        id v16 = v11;
      }

      id v11 = v16;
    }
    else
    {
      v7[2](v7, 0, v11);
    }
  }
}

- (BOOL)_setApplicationStatusForApp:(id)a3 forDeviceWithPairingID:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  char v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v36 = 0;
  id v12 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v11 error:&v36];
  id v13 = v36;
  if (!v12)
  {
    id v14 = 0;
    if (!a6)
    {
LABEL_17:
      BOOL v16 = 0;
      goto LABEL_20;
    }
LABEL_5:
    id v13 = v13;
    BOOL v16 = 0;
    *a6 = v13;
    goto LABEL_20;
  }
  id v14 = objc_alloc_init((Class)ACXApplicationStatus);
  if (objc_msgSend(v10, "isCompatibleWithCPUType:subtype:", objc_msgSend(v12, "cpuType"), objc_msgSend(v12, "cpuSubtype")))
  {
    uint64_t v15 = 1;
  }
  else
  {
    if (v7)
    {
      uint64_t v24 = [v10 bundleIdentifier];
      BOOL v25 = [v11 UUIDString];
      id v26 = [(ACXDeviceConnectionClient *)self clientName];
      sub_100007574((uint64_t)"-[ACXDeviceConnectionClient _setApplicationStatusForApp:forDeviceWithPairingID:options:error:]", 1188, @"ACXErrorDomain", 38, @"%@ does not support this device with pairing ID %@ (requested by %@)", v27, v28, v29, (uint64_t)v24);
      goto LABEL_16;
    }
    uint64_t v15 = 2;
  }
  [v14 setArchitectureCompatibility:v15];
  id v17 = [v12 osVersion];
  unsigned __int8 v18 = [v10 isCompatibleWithOSVersion:v17];

  if ((v18 & 1) == 0)
  {
    if ((v7 & 1) == 0)
    {
      uint64_t v19 = 1;
      goto LABEL_12;
    }
    uint64_t v24 = [v10 bundleIdentifier];
    BOOL v25 = [v11 UUIDString];
    id v26 = [(ACXDeviceConnectionClient *)self clientName];
    sub_100007574((uint64_t)"-[ACXDeviceConnectionClient _setApplicationStatusForApp:forDeviceWithPairingID:options:error:]", 1197, @"ACXErrorDomain", 37, @"%@ does not support this device with pairing ID %@ (requested by %@)", v30, v31, v32, (uint64_t)v24);
    uint64_t v33 = LABEL_16:;

    id v13 = (id)v33;
    if (!a6) {
      goto LABEL_17;
    }
    goto LABEL_5;
  }
  uint64_t v19 = 0;
LABEL_12:
  [v14 setWatchKitCompatibility:v19];
  uint64_t v20 = +[ACXGizmoStateManager sharedStateManager];
  id v21 = [v20 stateForDevice:v12];

  id v22 = [v10 bundleIdentifier];
  uint64_t v23 = [v21 appStateForApp:v22];

  if (v23) {
    objc_msgSend(v14, "setInstallStatusWithGizmoStatus:", objc_msgSend(v23, "installStatus"));
  }
  else {
    [v14 setInstallStatus:4];
  }
  uint64_t v34 = [v23 uniqueInstallID];
  [v14 setUniqueInstallID:v34];

  [v10 setDeviceStatus:v14];
  BOOL v16 = 1;
LABEL_20:

  return v16;
}

- (void)fetchLocallyAvailableWatchAppWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, id))a6;
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    BOOL v25 = [(ACXDeviceConnectionClient *)self clientName];
    id v26 = v10;
    MOLogWrite();
  }
  id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchLocallyAvailableWatchAppWithBundleID:forDeviceWithPairingID:options:completion:]", v25, v26);
  id v14 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v13];

  if (!v14)
  {
    uint64_t v15 = [(ACXDeviceConnectionClient *)self applicationManager];
    BOOL v16 = [v15 gizmoAppWithBundleID:v10];

    if (v16)
    {
      if (![v16 isSystemApp])
      {
        if (v11)
        {
          id v27 = 0;
          unsigned __int8 v22 = [(ACXDeviceConnectionClient *)self _setApplicationStatusForApp:v16 forDeviceWithPairingID:v11 options:a5 error:&v27];
          id v23 = v27;
          uint64_t v24 = v23;
          if ((v22 & 1) == 0)
          {
            v12[2](v12, 0, v23);

            goto LABEL_16;
          }
        }
        ((void (**)(id, void *, id))v12)[2](v12, v16, 0);
LABEL_16:

        goto LABEL_17;
      }
      id v17 = [v11 UUIDString];
      unsigned __int8 v18 = [(ACXDeviceConnectionClient *)self clientName];
      sub_100007710((uint64_t)"-[ACXDeviceConnectionClient fetchLocallyAvailableWatchAppWithBundleID:forDeviceWithPairingID:options:completion:]", 1242, @"ACXErrorDomain", 19, 0, 0, @"No gizmo app found with bundle ID %@ (deletable system apps are not returned from this SPI) on device with pairing ID %@ (requested by %@)", v19, (uint64_t)v10);
    }
    else
    {
      id v17 = [v11 UUIDString];
      unsigned __int8 v18 = [(ACXDeviceConnectionClient *)self clientName];
      sub_100007710((uint64_t)"-[ACXDeviceConnectionClient fetchLocallyAvailableWatchAppWithBundleID:forDeviceWithPairingID:options:completion:]", 1236, @"ACXErrorDomain", 19, 0, 0, @"No gizmo app found with bundle ID %@ on device with pairing ID %@ (requested by %@)", v20, (uint64_t)v10);
    id v21 = };

    v12[2](v12, 0, v21);
    goto LABEL_16;
  }
  v12[2](v12, 0, v14);
LABEL_17:
}

- (void)fetchInstalledWatchAppWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    uint64_t v28 = [(ACXDeviceConnectionClient *)self clientName];
    id v29 = v8;
    MOLogWrite();
  }
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchInstalledWatchAppWithBundleID:forDeviceWithPairingID:completion:]", v28, v29);
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (!v12)
  {
    id v34 = 0;
    id v13 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v9 error:&v34];
    id v14 = v34;
    if (!v13)
    {
      v10[2](v10, 0, v14);
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v15 = +[ACXCompanionSyncConnectionManager sharedConnectionManager];
    BOOL v16 = [v15 connectionForDevice:v13];

    if ([v16 supportsRemoteAppList])
    {
      [v16 remoteAppList];
      uint64_t v31 = v16;
      id v17 = v33 = v14;
      unsigned __int8 v18 = [v17 applicationForBundleID:v8 error:&v33];
      id v19 = v33;

      BOOL v16 = v31;
      id v14 = v19;
      if (!v18) {
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v20 = [v16 gizmoState];
      id v21 = [v20 installStatusForApp:v8];

      if (v21 != (id)2
        || ([(ACXDeviceConnectionClient *)self applicationManager],
            unsigned __int8 v22 = objc_claimAutoreleasedReturnValue(),
            [v22 gizmoAppWithBundleID:v8],
            unsigned __int8 v18 = objc_claimAutoreleasedReturnValue(),
            v22,
            !v18))
      {
        id v26 = [v9 UUIDString];
        uint64_t v30 = [(ACXDeviceConnectionClient *)self clientName];
        sub_100007710((uint64_t)"-[ACXDeviceConnectionClient fetchInstalledWatchAppWithBundleID:forDeviceWithPairingID:completion:]", 1287, @"ACXErrorDomain", 19, 0, 0, @"Failed to get locally available application for watch app bundleID: %@ on device with pairing ID %@ (requested by %@)", v27, (uint64_t)v8);
        id v19 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
        v10[2](v10, 0, v19);
        id v14 = v19;
LABEL_19:

        goto LABEL_20;
      }
    }
    if ([v18 applicationMode] != (id)3)
    {
      id v23 = [(ACXDeviceConnectionClient *)self applicationManager];
      [v18 bundleIdentifier];
      v24 = uint64_t v32 = v16;
      unsigned int v25 = [v23 gizmoAppIsLocallyAvailableWithBundleID:v24];

      BOOL v16 = v32;
      if (v25) {
        [v18 setIsLocallyAvailable:1];
      }
    }
    ((void (**)(id, void *, id))v10)[2](v10, v18, 0);

    goto LABEL_19;
  }
  v10[2](v10, 0, v12);
LABEL_21:
}

- (void)fetchLocallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    id v23 = [(ACXDeviceConnectionClient *)self clientName];
    id v24 = v8;
    MOLogWrite();
  }
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchLocallyAvailableApplicationWithContainingApplicationBundleID:forDeviceWithPairingID:completion:]", v23, v24);
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (!v12)
  {
    id v13 = [(ACXDeviceConnectionClient *)self applicationManager];
    id v14 = [v13 gizmoAppForCompanionAppBundleID:v8];

    if (v14)
    {
      if (![v14 isSystemApp])
      {
        if (v9)
        {
          id v25 = 0;
          unsigned __int8 v20 = [(ACXDeviceConnectionClient *)self _setApplicationStatusForApp:v14 forDeviceWithPairingID:v9 options:0 error:&v25];
          id v21 = v25;
          unsigned __int8 v22 = v21;
          if ((v20 & 1) == 0)
          {
            v10[2](v10, 0, v21);

            goto LABEL_16;
          }
        }
        ((void (**)(id, void *, id))v10)[2](v10, v14, 0);
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v15 = [v9 UUIDString];
      BOOL v16 = [(ACXDeviceConnectionClient *)self clientName];
      sub_100007710((uint64_t)"-[ACXDeviceConnectionClient fetchLocallyAvailableApplicationWithContainingApplicationBundleID:forDeviceWithPairingID:completion:]", 1321, @"ACXErrorDomain", 19, 0, 0, @"No gizmo app found with companion bundle ID %@ (deletable system apps are not returned from this SPI) for device with pairing ID %@ (requested by %@)", v17, (uint64_t)v8);
    }
    else
    {
      uint64_t v15 = [v9 UUIDString];
      BOOL v16 = [(ACXDeviceConnectionClient *)self clientName];
      sub_100007710((uint64_t)"-[ACXDeviceConnectionClient fetchLocallyAvailableApplicationWithContainingApplicationBundleID:forDeviceWithPairingID:completion:]", 1315, @"ACXErrorDomain", 19, 0, 0, @"No companion app found with bundle ID %@ for device with pairing ID %@ (requested by %@)", v18, (uint64_t)v8);
    id v19 = };

    v10[2](v10, 0, v19);
    goto LABEL_16;
  }
  v10[2](v10, 0, v12);
LABEL_17:
}

- (BOOL)_applicationIsInstalledOnDevice:(id)a3 withBundleID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
  id v11 = [v10 connectionForDevice:v9];

  if ([v11 supportsRemoteAppList])
  {
    id v12 = [v11 remoteAppList];
    unsigned __int8 v13 = [v12 applicationIsInstalledWithBundleID:v8 error:a5];
  }
  else
  {
    id v14 = [v11 gizmoState];
    id v12 = [v14 appStateForApp:v8];

    unsigned __int8 v13 = [v12 installStatus] == (id)2;
  }

  return v13;
}

- (BOOL)_applicationIsInstalledOnDevice:(id)a3 withCompanionBundleID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
  id v11 = [v10 connectionForDevice:v9];

  if ([v11 supportsRemoteAppList])
  {
    id v12 = [v11 remoteAppList];
    unsigned __int8 v13 = [v12 applicationIsInstalledWithCounterpartBundleID:v8 error:a5];
  }
  else
  {
    id v14 = [(ACXDeviceConnectionClient *)self applicationManager];
    id v12 = [v14 gizmoAppBundleIDForCompanionAppBundleID:v8];

    if (!v12)
    {
      unsigned __int8 v13 = 0;
      goto LABEL_7;
    }
    uint64_t v15 = [v11 gizmoState];
    id v8 = [v15 appStateForApp:v12];

    unsigned __int8 v13 = [v8 installStatus] == (id)2;
  }

LABEL_7:
  return v13;
}

- (void)applicationIsInstalledOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v24 = [(ACXDeviceConnectionClient *)self clientName];
    id v25 = v9;
    MOLogWrite();
  }
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient applicationIsInstalledOnDeviceWithPairingID:withBundleID:completion:]", v24, v25);
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (!v12)
  {
    id v27 = 0;
    unsigned __int8 v13 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v8 error:&v27];
    id v14 = v27;
    uint64_t v15 = v14;
    if (!v13)
    {
      v10[2](v10, 0, v14);
      id v17 = v15;
LABEL_18:

      goto LABEL_19;
    }
    id v26 = v14;
    unsigned int v16 = [(ACXDeviceConnectionClient *)self _applicationIsInstalledOnDevice:v13 withBundleID:v9 error:&v26];
    id v17 = v26;

    if (v16)
    {
      uint64_t v18 = v10[2];
      id v19 = v10;
      uint64_t v20 = 1;
LABEL_14:
      id v23 = 0;
LABEL_17:
      v18(v19, v20, v23);
      goto LABEL_18;
    }
    if (v17)
    {
      id v21 = [v17 domain];
      if ([v21 isEqualToString:@"ACXErrorDomain"])
      {
        id v22 = [v17 code];

        if (v22 == (id)19) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      uint64_t v18 = v10[2];
      id v19 = v10;
      uint64_t v20 = 0;
      id v23 = v17;
      goto LABEL_17;
    }
LABEL_13:
    uint64_t v18 = v10[2];
    id v19 = v10;
    uint64_t v20 = 0;
    goto LABEL_14;
  }
  v10[2](v10, 0, v12);
LABEL_19:
}

- (void)applicationIsInstalledOnDeviceWithPairingID:(id)a3 withCompanionBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v24 = [(ACXDeviceConnectionClient *)self clientName];
    id v25 = v9;
    MOLogWrite();
  }
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient applicationIsInstalledOnDeviceWithPairingID:withCompanionBundleID:completion:]", v24, v25);
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (!v12)
  {
    id v27 = 0;
    unsigned __int8 v13 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v8 error:&v27];
    id v14 = v27;
    uint64_t v15 = v14;
    if (!v13)
    {
      v10[2](v10, 0, v14);
      id v17 = v15;
LABEL_18:

      goto LABEL_19;
    }
    id v26 = v14;
    unsigned int v16 = [(ACXDeviceConnectionClient *)self _applicationIsInstalledOnDevice:v13 withCompanionBundleID:v9 error:&v26];
    id v17 = v26;

    if (v16)
    {
      uint64_t v18 = v10[2];
      id v19 = v10;
      uint64_t v20 = 1;
LABEL_14:
      id v23 = 0;
LABEL_17:
      v18(v19, v20, v23);
      goto LABEL_18;
    }
    if (v17)
    {
      id v21 = [v17 domain];
      if ([v21 isEqualToString:@"ACXErrorDomain"])
      {
        id v22 = [v17 code];

        if (v22 == (id)19) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      uint64_t v18 = v10[2];
      id v19 = v10;
      uint64_t v20 = 0;
      id v23 = v17;
      goto LABEL_17;
    }
LABEL_13:
    uint64_t v18 = v10[2];
    id v19 = v10;
    uint64_t v20 = 0;
    goto LABEL_14;
  }
  v10[2](v10, 0, v12);
LABEL_19:
}

- (void)applicationIsInstalledOnAnyPairedDeviceWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, void, void *))a4;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v17 = [(ACXDeviceConnectionClient *)self clientName];
    id v18 = v6;
    MOLogWrite();
  }
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient applicationIsInstalledOnAnyPairedDeviceWithBundleID:completion:]", v17, v18);
  id v9 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v8];

  if (v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    id v10 = [(ACXDeviceConnectionClient *)self deviceManager];
    id v11 = [v10 allDevices];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        unsigned int v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          if ([(ACXDeviceConnectionClient *)self _applicationIsInstalledOnDevice:*(void *)(*((void *)&v19 + 1) + 8 * (void)v16) withBundleID:v6 error:0])
          {
            v7[2](v7, 1, 0);

            goto LABEL_16;
          }
          unsigned int v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    v7[2](v7, 0, 0);
LABEL_16:
  }
}

- (void)applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, void, void *))a4;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v17 = [(ACXDeviceConnectionClient *)self clientName];
    id v18 = v6;
    MOLogWrite();
  }
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:completion:]", v17, v18);
  id v9 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v8];

  if (v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    id v10 = [(ACXDeviceConnectionClient *)self deviceManager];
    id v11 = [v10 allDevices];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        unsigned int v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          if ([(ACXDeviceConnectionClient *)self _applicationIsInstalledOnDevice:*(void *)(*((void *)&v19 + 1) + 8 * (void)v16) withCompanionBundleID:v6 error:0])
          {
            v7[2](v7, 1, 0);

            goto LABEL_16;
          }
          unsigned int v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    v7[2](v7, 0, 0);
LABEL_16:
  }
}

- (void)fetchApplicationDatabaseSyncInformationForDeviceWithPairingID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    long long v19 = [(ACXDeviceConnectionClient *)self clientName];
    id v20 = v6;
    MOLogWrite();
  }
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchApplicationDatabaseSyncInformationForDeviceWithPairingID:completion:]", v19, v20);
  id v9 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v8];

  if (v9)
  {
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v9);
  }
  else
  {
    id v24 = 0;
    id v10 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v6 error:&v24];
    id v11 = v24;
    if (v10)
    {
      id v12 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
      id v13 = [v12 connectionForDevice:v10];

      if ([v13 supportsRemoteAppList])
      {
        uint64_t v23 = 0;
        id v14 = [v13 remoteAppList];
        id v22 = 0;
        [v14 getCurrentDBUUID:&v22 sequenceNumber:&v23];
        id v15 = v22;

        (*((void (**)(id, id, uint64_t, void))v7 + 2))(v7, v15, v23, 0);
      }
      else
      {
        unsigned int v16 = [v6 UUIDString];
        long long v21 = [(ACXDeviceConnectionClient *)self clientName];
        uint64_t v18 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient fetchApplicationDatabaseSyncInformationForDeviceWithPairingID:completion:]", 1493, @"ACXErrorDomain", 44, 0, 0, @"Remote app queries are not supported for device with pairing ID %@ (requested by %@)", v17, (uint64_t)v16);

        (*((void (**)(id, void, void, uint64_t))v7 + 2))(v7, 0, 0, v18);
        id v11 = (id)v18;
      }
    }
    else
    {
      (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v11);
    }
  }
}

- (void)fetchLocalizedValuesFromAllDevicesForInfoPlistKeys:(id)a3 forAppWithBundleID:(id)a4 fetchingFirstMatchingLocalizationInList:(id)a5 completion:(id)a6
{
  id v40 = a3;
  id v42 = a4;
  id v39 = a5;
  id v10 = (void (**)(id, void, void *))a6;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    [(ACXDeviceConnectionClient *)self clientName];
    id v35 = v40;
    uint64_t v32 = v36 = v39;
    id v33 = v42;
    MOLogWrite();
  }
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchLocalizedValuesFromAllDevicesForInfoPlistKeys:forAppWithBundleID:fetchingFirstMatchingLocalizationInList:completion:]", v32, v33, v35, v36);
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (v12)
  {
    v10[2](v10, 0, v12);
  }
  else
  {
    uint64_t v37 = v10;
    uint64_t v38 = objc_opt_new();
    id v13 = [(ACXDeviceConnectionClient *)self deviceManager];
    id v14 = [v13 allDevices];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v14;
    id v15 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v45;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(obj);
          }
          long long v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          long long v21 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
          id v22 = [v21 connectionForDevice:v19];

          if ([v22 supportsRemoteAppList])
          {
            uint64_t v23 = [v19 pairingID];
            id v24 = [v22 remoteAppList];
            id v43 = 0;
            id v25 = [v24 applicationForBundleID:v42 error:&v43];
            id v26 = v43;

            if (v25)
            {
              id v27 = [v25 localizedInfoPlistStringsForKeys:v40 fetchingFirstMatchingLocalizationInList:v39];
              if ([v27 count]) {
                [v38 setObject:v27 forKeyedSubscript:v23];
              }
            }
            else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              MOLogWrite();
            }
          }
        }
        id v16 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v16);
    }

    id v10 = v37;
    if ([v38 count])
    {
      ((void (**)(id, void *, void *))v37)[2](v37, v38, 0);
    }
    else
    {
      id v34 = [(ACXDeviceConnectionClient *)self clientName];
      uint64_t v31 = sub_100007574((uint64_t)"-[ACXDeviceConnectionClient fetchLocalizedValuesFromAllDevicesForInfoPlistKeys:forAppWithBundleID:fetchingFirstMatchingLocalizationInList:completion:]", 1545, @"ACXErrorDomain", 19, @"No app was found on any device with the bundle ID %@, or the keys requested were not set in any instance of the app. (requested by %@)", v28, v29, v30, (uint64_t)v42);
      v37[2](v37, 0, v31);
    }
    id v12 = 0;
  }
}

- (void)fetchInstallableSystemAppBundleIDsForDeviceWithPairingID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    long long v19 = [(ACXDeviceConnectionClient *)self clientName];
    id v20 = v6;
    MOLogWrite();
  }
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchInstallableSystemAppBundleIDsForDeviceWithPairingID:completion:]", v19, v20);
  id v9 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v8];

  if (v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    id v22 = 0;
    id v10 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v6 error:&v22];
    id v11 = v22;
    if (v10)
    {
      id v12 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
      id v13 = [v12 connectionForDevice:v10];

      id v14 = [v13 availableSystemAppList];
      id v15 = v14;
      if (v14)
      {
        id v16 = [v14 bundleIDsOfInstallableSystemApps];
        uint64_t v17 = [v16 allObjects];
        ((void (**)(id, void *, void *))v7)[2](v7, v17, 0);
      }
      else
      {
        id v16 = [(ACXDeviceConnectionClient *)self applicationManager];
        uint64_t v17 = [v16 bundleIDsOfLocallyAvailableSystemAppsForPreWatchOSSix];
        [v17 allObjects];
        uint64_t v18 = v21 = v11;
        ((void (**)(id, void *, void *))v7)[2](v7, v18, 0);

        id v11 = v21;
      }
    }
    else
    {
      v7[2](v7, 0, v11);
    }
  }
}

- (void)fetchInstallableSystemAppWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    [(ACXDeviceConnectionClient *)self clientName];
    id v21 = v8;
    v20 = id v22 = v9;
    MOLogWrite();
  }
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchInstallableSystemAppWithBundleID:forDeviceWithPairingID:completion:]", v20, v21, v22);
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (v12)
  {
    v10[2](v10, 0, v12);
  }
  else
  {
    id v25 = 0;
    id v13 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v9 error:&v25];
    id v14 = v25;
    if (v13)
    {
      id v15 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
      id v16 = [v15 connectionForDevice:v13];

      uint64_t v17 = [v16 availableSystemAppList];

      if (v17)
      {
        id v24 = 0;
        uint64_t v18 = [v17 installableSystemAppWithBundleID:v8 error:&v24];
        id v14 = v24;
      }
      else
      {
        long long v19 = [(ACXDeviceConnectionClient *)self applicationManager];
        id v23 = 0;
        uint64_t v18 = [v19 availableSystemAppWithBundleID:v8 error:&v23];
        id v14 = v23;
      }
      ((void (**)(id, void *, void *))v10)[2](v10, v18, v14);
    }
    else
    {
      v10[2](v10, 0, v14);
    }
  }
}

- (void)systemAppIsInstallableOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    [(ACXDeviceConnectionClient *)self clientName];
    id v22 = v9;
    id v21 = v23 = v8;
    MOLogWrite();
  }
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient systemAppIsInstallableOnDeviceWithPairingID:withBundleID:completion:]", v21, v22, v23);
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (v12)
  {
    v10[2](v10, 0, v12);
  }
  else
  {
    id v26 = 0;
    id v13 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v8 error:&v26];
    id v14 = v26;
    if (v13)
    {
      id v15 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
      id v16 = [v15 connectionForDevice:v13];

      uint64_t v17 = [v16 availableSystemAppList];

      if (v17)
      {
        id v25 = 0;
        id v18 = [v17 systemAppIsInstallableWithBundleID:v9 error:&v25];
        id v14 = v25;
        ((void (**)(id, id, void *))v10)[2](v10, v18, v14);
      }
      else
      {
        long long v19 = [(ACXDeviceConnectionClient *)self applicationManager];
        id v24 = 0;
        id v20 = [v19 systemAppIsAvailableWithBundleID:v9 error:&v24];
        id v14 = v24;

        ((void (**)(id, id, void *))v10)[2](v10, v20, v14);
      }
    }
    else
    {
      v10[2](v10, 0, v14);
    }
  }
}

- (void)installRequestFailedForApp:(id)a3 forDeviceWithPairingID:(id)a4 failureReason:(id)a5 wasUserInitiated:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void *))a7;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    [(ACXDeviceConnectionClient *)self clientName];
    id v27 = v13;
    id v25 = v29 = v14;
    id v26 = v12;
    MOLogWrite();
  }
  id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient installRequestFailedForApp:forDeviceWithPairingID:failureReason:wasUserInitiated:completion:]", v25, v26, v27, v29);
  uint64_t v17 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v16];

  if (v17)
  {
    v15[2](v15, v17);
  }
  else
  {
    id v30 = 0;
    id v18 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v13 error:&v30];
    id v19 = v30;
    if (v18)
    {
      if ([v18 isReachable])
      {
        id v20 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
        id v21 = [v20 connectionForDevice:v18];

        [v21 noteInstallFailure:v14 forWatchAppWithBundleID:v12 wasUserInitiated:v8];
        v15[2](v15, 0);
      }
      else
      {
        id v22 = [v13 UUIDString];
        uint64_t v28 = [(ACXDeviceConnectionClient *)self clientName];
        uint64_t v24 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient installRequestFailedForApp:forDeviceWithPairingID:failureReason:wasUserInitiated:completion:]", 1666, @"ACXErrorDomain", 55, 0, 0, @"Ignoring request to send message to gizmo about install request failure for app %@ as the device with pairing ID %@ isn't reachable (requested by %@)", v23, (uint64_t)v12);

        v15[2](v15, (void *)v24);
        id v19 = (id)v24;
      }
    }
    else
    {
      v15[2](v15, v19);
    }
  }
}

- (void)acknowledgeTestFlightInstallBegunForApp:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    [(ACXDeviceConnectionClient *)self clientName];
    id v21 = v8;
    v20 = id v22 = v9;
    MOLogWrite();
  }
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient acknowledgeTestFlightInstallBegunForApp:forDeviceWithPairingID:completion:]", v20, v21, v22);
  id v12 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v11];

  if (v12)
  {
    v10[2](v10, v12);
  }
  else
  {
    id v24 = 0;
    id v13 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v9 error:&v24];
    id v14 = v24;
    if (v13)
    {
      if ([v13 isReachable])
      {
        id v15 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
        id v16 = [v15 connectionForDevice:v13];

        [v16 acknowledgeTestFlightInstallBegunForWatchApp:v8];
        v10[2](v10, 0);
      }
      else
      {
        uint64_t v17 = [v9 UUIDString];
        uint64_t v23 = [(ACXDeviceConnectionClient *)self clientName];
        uint64_t v19 = sub_100007710((uint64_t)"-[ACXDeviceConnectionClient acknowledgeTestFlightInstallBegunForApp:forDeviceWithPairingID:completion:]", 1696, @"ACXErrorDomain", 55, 0, 0, @"Ignoring request to send message to gizmo about test flight install begun for app %@ as the device with pairing ID %@ isn't reachable (requested by %@)", v18, (uint64_t)v8);

        v10[2](v10, (void *)v19);
        id v14 = (id)v19;
      }
    }
    else
    {
      v10[2](v10, v14);
    }
  }
}

- (void)applicationRemovabilityOnDeviceWithPairingID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v15 = [(ACXDeviceConnectionClient *)self clientName];
    id v16 = v6;
    MOLogWrite();
  }
  id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient applicationRemovabilityOnDeviceWithPairingID:completion:]", v15, v16);
  id v9 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v8];

  if (v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    id v17 = 0;
    id v10 = [(ACXDeviceConnectionClient *)self _deviceForPairingID:v6 error:&v17];
    id v11 = v17;
    if (v10)
    {
      id v12 = [(ACXDeviceConnectionClient *)self companionSyncConnectionManager];
      id v13 = [v12 connectionForDevice:v10];

      id v14 = [v13 removabilityForRemoteApps];
      ((void (**)(id, void *, void *))v7)[2](v7, v14, 0);
    }
    else
    {
      v7[2](v7, 0, v11);
    }
  }
}

- (void)killDaemonForTesting:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient killDaemonForTesting:]");
  id v5 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v4];

  if (!v5)
  {
    id v5 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companion.AppConduitTestRunner" forRequestType:@"kill daemon for testing"];
    if (!v5)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
      {
        id v6 = [(ACXDeviceConnectionClient *)self clientName];
        MOLogWrite();
      }
      exit(0);
    }
  }
  v7[2](v7, v5);
}

- (void)fetchDuplicatedClassInfo:(id)a3
{
  id v6 = (void (**)(id, void, void *))a3;
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ACXDeviceConnectionClient fetchDuplicatedClassInfo:]");
  id v5 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companionappd.connect.allow" forRequestType:v4];

  if (v5)
  {
    v6[2](v6, 0, v5);
  }
  else
  {
    id v5 = [(ACXDeviceConnectionClient *)self _hasEntitlement:@"com.apple.companion.AppConduitTestRunner" forRequestType:@"fetch duplicated class info"];
    if (!v5)
    {
      id v5 = sub_1000099AC(0);
    }
    ((void (*)(void))v6[2])();
  }
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_os_transaction)observerTransaction
{
  return self->_observerTransaction;
}

- (void)setObserverTransaction:(id)a3
{
}

- (ACXDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
}

- (ACXAvailableApplicationManager)applicationManager
{
  return self->_applicationManager;
}

- (void)setApplicationManager:(id)a3
{
}

- (ACXCompanionSyncConnectionManager)companionSyncConnectionManager
{
  return self->_companionSyncConnectionManager;
}

- (void)setCompanionSyncConnectionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionSyncConnectionManager, 0);
  objc_storeStrong((id *)&self->_applicationManager, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_observerTransaction, 0);

  objc_destroyWeak((id *)&self->_xpcConnection);
}

@end