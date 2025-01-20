@interface CADServer
- (BOOL)isActive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CADServer)init;
- (CADServer)initWithModules:(id)a3;
- (NSArray)modules;
- (OS_dispatch_queue)alarmQueue;
- (OS_dispatch_queue)workQueue;
- (unint64_t)_contactsAuthorization;
- (unint64_t)_lastKnownContactsAuthorization;
- (void)_cleanupChangeTablesInDatabase:(CalDatabase *)a3;
- (void)_clientConnectionDied:(id)a3;
- (void)_deactivateAndExit;
- (void)_dumpState;
- (void)_exit;
- (void)_finishInitializationWithDataAvailable;
- (void)_handleDatabaseChanged;
- (void)_handleXPCConnection:(id)a3;
- (void)_migrateIfNeeded;
- (void)_protectedDataDidBecomeAvailable;
- (void)_registerActivityWithIdentifier:(const char *)a3 block:(id)a4;
- (void)_registerContactsAccess;
- (void)_registerForAlarmEvents;
- (void)_registerForAnalyticsCollection;
- (void)_registerForAttachmentCleanup;
- (void)_registerForChangeTableCleanup;
- (void)_registerForConferenceURLRenewal;
- (void)_registerForDatabaseCleanup;
- (void)_registerForNotifications;
- (void)_registerForOccurrenceCacheUpdate;
- (void)_registerMaintenanceActivities;
- (void)_setUpSignalHandlers;
- (void)_setupBirthdayListener;
- (void)_startBirthdayListener;
- (void)_tearDownSignalHandlers;
- (void)_trimExtendAndUpdateOccurrenceCache:(BOOL)a3;
- (void)activate;
- (void)cleanupDatabase:(CalDatabase *)a3;
- (void)deactivate;
- (void)dealloc;
- (void)initiateAuthenticationForAppProtectionForClientConnection:(id)a3 completion:(id)a4;
- (void)initiateReminderAuthenticationForAppProtectionForClientConnection:(id)a3 completion:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setModules:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation CADServer

- (void)_clientConnectionDied:(id)a3
{
  connectionLock = self->_connectionLock;
  id v5 = a3;
  [(NSLock *)connectionLock lock];
  [(NSMutableSet *)self->_clientConnections removeObject:v5];

  v6 = self->_connectionLock;
  [(NSLock *)v6 unlock];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F577F0] isRunningAsSetupUser];
  if (v8)
  {
    v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_ERROR, "Rejecting XPC connection because we are running as the setup user", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    [(NSLock *)self->_connectionLock lock];
    v10 = [CADAuditTokenTCCPermissionChecker alloc];
    id v18 = v6;
    if (v7) {
      [v7 auditToken];
    }
    else {
      memset(v30, 0, 32);
    }
    v17 = [(CADAuditTokenTCCPermissionChecker *)v10 initWithAuditToken:v30];
    v11 = [[ClientConnection alloc] initWithXPCConnection:v7 tccPermissionChecker:v17];
    objc_initWeak(buf, self);
    objc_initWeak(&location, v11);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __48__CADServer_listener_shouldAcceptNewConnection___block_invoke;
    v25[3] = &unk_1E624ED78;
    objc_copyWeak(&v26, buf);
    objc_copyWeak(&v27, &location);
    [v7 setInterruptionHandler:v25];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __48__CADServer_listener_shouldAcceptNewConnection___block_invoke_24;
    v22[3] = &unk_1E624ED78;
    objc_copyWeak(&v23, buf);
    objc_copyWeak(&v24, &location);
    [v7 setInvalidationHandler:v22];
    [(NSMutableSet *)self->_clientConnections addObject:v11];
    [(NSLock *)self->_connectionLock unlock];
    v12 = [(ClientConnection *)v11 cadOperationProxy];
    v13 = GetSharedXPCInterfaceForCADInterface();
    [v7 setExportedObject:v12];
    [v7 setExportedInterface:v13];
    v14 = GetSharedXPCInterfaceForCADClientInterface();
    [v7 setRemoteObjectInterface:v14];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __48__CADServer_listener_shouldAcceptNewConnection___block_invoke_25;
    v19[3] = &unk_1E624E9B0;
    v19[4] = self;
    v15 = v11;
    v20 = v15;
    id v21 = v7;
    [(CADServer *)self initiateAuthenticationForAppProtectionForClientConnection:v15 completion:v19];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    objc_destroyWeak(buf);

    id v6 = v18;
  }

  return v8 ^ 1;
}

- (void)initiateAuthenticationForAppProtectionForClientConnection:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [v5 permissionValidator];
  if (([v7 hasCalendarTCCBypassEntitlement] & 1) == 0)
  {

    goto LABEL_6;
  }
  int v8 = [v5 permissionValidator];
  int v9 = [v8 testingAccessLevelGranted];

  if (v9)
  {
LABEL_6:
    v6[2](v6);
    goto LABEL_9;
  }
  v10 = +[CADDefaultAppProtectionGuard shared];
  uint64_t v11 = *MEMORY[0x1E4F57868];
  v12 = [v5 identity];
  v13 = v12;
  if (v12) {
    [v12 auditToken];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__CADServer_initiateAuthenticationForAppProtectionForClientConnection_completion___block_invoke;
  v14[3] = &unk_1E624D980;
  v15 = v6;
  [v10 initiateAuthenticationForApplicationWithBundleIdentifier:v11 onBehalfOfProcessWithAuditToken:v16 accessGrantedByEntitlement:0 completion:v14];

LABEL_9:
}

- (void)initiateReminderAuthenticationForAppProtectionForClientConnection:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [v5 permissionValidator];
  int v8 = [v7 allowsIntegrations];

  int v9 = [v5 permissionValidator];
  if ([v9 isFirstPartyCalendarApp])
  {

LABEL_3:
    v6[2](v6);
    goto LABEL_10;
  }
  v10 = [v5 permissionValidator];
  int v11 = [v10 isCalendarWidgetExtension];

  if (!v8 || v11) {
    goto LABEL_3;
  }
  v12 = +[CADDefaultAppProtectionGuard shared];
  uint64_t v13 = *MEMORY[0x1E4F57908];
  v14 = [v5 identity];
  v15 = v14;
  if (v14) {
    [v14 auditToken];
  }
  else {
    memset(v18, 0, sizeof(v18));
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  _OWORD v16[2] = __90__CADServer_initiateReminderAuthenticationForAppProtectionForClientConnection_completion___block_invoke;
  v16[3] = &unk_1E624D980;
  v17 = v6;
  [v12 initiateAuthenticationForApplicationWithBundleIdentifier:v13 onBehalfOfProcessWithAuditToken:v18 accessGrantedByEntitlement:1 completion:v16];

LABEL_10:
}

uint64_t __48__CADServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resume];
}

void __48__CADServer_listener_shouldAcceptNewConnection___block_invoke_25(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__CADServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v3[3] = &unk_1E624E508;
  id v4 = *(id *)(a1 + 48);
  [v1 initiateReminderAuthenticationForAppProtectionForClientConnection:v2 completion:v3];
}

uint64_t __82__CADServer_initiateAuthenticationForAppProtectionForClientConnection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__CADServer_listener_shouldAcceptNewConnection___block_invoke_24(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    id v4 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      id v5 = v4;
      id v6 = [v3 identity];
      int v7 = [v6 pid];
      int v8 = [v3 identity];
      int v9 = [v8 clientName];
      v10[0] = 67109378;
      v10[1] = v7;
      __int16 v11 = 2112;
      v12 = v9;
      _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_INFO, "Client disconnected: %i (%@)", (uint8_t *)v10, 0x12u);
    }
    [v3 releaseProxy];
    if (WeakRetained) {
      [WeakRetained _clientConnectionDied:v3];
    }
  }
}

void __38__CADServer__registerForNotifications__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]);
  v28 = [NSString stringWithCString:string encoding:1];
  id v4 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v35 = string;
    _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_DEBUG, "Beginning XPC transaction for com.apple.notifyd.matching notification named %s", buf, 0xCu);
  }
  uint64_t v25 = os_transaction_create();
  id v27 = string;
  if (!strcmp(string, (const char *)[(id)*MEMORY[0x1E4F578B0] UTF8String]))
  {
    int v7 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_INFO, "SignificantTimeChangeNotification fired", buf, 2u);
    }
    _CalTimeZoneForceUpdate();
    [*(id *)(a1 + 32) _trimExtendAndUpdateOccurrenceCache:0];
    goto LABEL_30;
  }
  if (!strcmp(string, "com.apple.mobilecal.timezonechanged"))
  {
    _CalTimeZoneForceUpdate();
    [*(id *)(a1 + 32) _trimExtendAndUpdateOccurrenceCache:0];
    int v8 = CADLogHandle;
    if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    int v9 = "Reloading widget timeline because the timeZone or timeZoneOverride changed";
LABEL_28:
    _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    goto LABEL_29;
  }
  if (!strcmp(string, "com.apple.mobilecal.preference.notification.overlayCalendarID"))
  {
    int v8 = CADLogHandle;
    if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    int v9 = "Reloading widget timeline because the alternate calendar (overlay calendar) changed";
    goto LABEL_28;
  }
  if (!strcmp(string, (const char *)[(id)*MEMORY[0x1E4F57860] UTF8String]))
  {
    v10 = (void *)EKWeakLinkClass();
    if (objc_opt_respondsToSelector())
    {
      __int16 v11 = [v10 performSelector:sel_sharedListener];
      if (objc_opt_respondsToSelector()) {
        [v11 performSelector:sel_reset];
      }
    }
    goto LABEL_30;
  }
  if (!strcmp(string, "com.apple.mobilecal.preference.notification.weekStart"))
  {
    int v8 = CADLogHandle;
    if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    int v9 = "Reloading widget timeline because of change in weekStart preference";
    goto LABEL_28;
  }
  if (!strcmp(string, "com.apple.mobile.keybagd.first_unlock"))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    id v23 = *(NSObject **)(v22 + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__CADServer__registerForNotifications__block_invoke_66;
    block[3] = &unk_1E624E508;
    block[4] = v22;
    dispatch_async(v23, block);
    goto LABEL_30;
  }
  if (strcmp(string, "com.apple.eventkit.preference.notification.UnselectedCalendarIdentifiersForFocusMode"))
  {
    if (strcmp(string, "com.apple.accessibility.prefers.horizontal.text"))
    {
      if (!strcmp(string, (const char *)*MEMORY[0x1E4F4B7A8]))
      {
        id v5 = CADLogHandle;
        if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
        {
LABEL_55:
          objc_msgSend(MEMORY[0x1E4F57820], "refreshEventWidgets", v25);
          goto LABEL_30;
        }
        *(_WORD *)buf = 0;
        id v6 = "Reloading widget timeline because AppProtection hidden apps changed";
      }
      else
      {
        if (strcmp(string, (const char *)*MEMORY[0x1E4F4B7B8])) {
          goto LABEL_30;
        }
        id v5 = CADLogHandle;
        if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_55;
        }
        *(_WORD *)buf = 0;
        id v6 = "Reloading widget timeline because AppProtection locked apps changed";
      }
      _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_55;
    }
    int v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v9 = "Reloading widget timeline because AXSPrefersHorizontalTextLayout changed";
      goto LABEL_28;
    }
LABEL_29:
    objc_msgSend(MEMORY[0x1E4F57820], "refreshEventWidgets", v25);
    [MEMORY[0x1E4F57820] refreshDateWidgets];
    goto LABEL_30;
  }
  CalDatabaseRequestApplicationSnapshotUpdateWithRateLimiter();
  id v24 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v24, OS_LOG_TYPE_DEFAULT, "Reloading widget timeline because focus configuration changed", buf, 2u);
  }
  CalDatabaseRequestWidgetRefreshWithRateLimiter();
LABEL_30:
  v12 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v12, OS_LOG_TYPE_DEFAULT, "Forwarding darwin notifications to modules.", buf, 2u);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "modules", v25);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v18 receivedNotificationNamed:v28];
        v19 = CADServerLogHandle;
        if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v35 = v28;
          __int16 v36 = 2112;
          v37 = v18;
          _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_DEFAULT, "Forwarded darwin notification named: %{public}@ to module: %@.", buf, 0x16u);
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v15);
  }

  v20 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v20, OS_LOG_TYPE_DEFAULT, "Finished forwarding darwin notifications to modules.", buf, 2u);
  }
  id v21 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v35 = v27;
    _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_DEBUG, "Ending XPC transaction for com.apple.notifyd.matching notification named %s", buf, 0xCu);
  }
}

- (NSArray)modules
{
  return self->_modules;
}

- (CADServer)init
{
  return [(CADServer *)self initWithModules:MEMORY[0x1E4F1CBF0]];
}

- (CADServer)initWithModules:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CADServer;
  id v5 = [(CADServer *)&v46 init];
  if (v5)
  {
    id v6 = (void *)os_transaction_create();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__CADServer_initWithModules___block_invoke;
    block[3] = &unk_1E624E508;
    int v7 = v5;
    v45 = v7;
    if (initWithModules__onceToken != -1) {
      dispatch_once(&initWithModules__onceToken, block);
    }
    CADLogInitIfNeeded();
    int v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v7;
      _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_DEBUG, "Server launch sequence commencing.  Server: [%@]", buf, 0xCu);
    }
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v9 = objc_claimAutoreleasedReturnValue();
    v10 = (const char *)[v9 UTF8String];

    __int16 v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    [(CADServer *)v7 setWorkQueue:v12];

    [(CADServer *)v7 _setUpSignalHandlers];
    uint64_t v13 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    connectionLock = v7->_connectionLock;
    v7->_connectionLock = v13;

    uint64_t v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    clientConnections = v7->_clientConnections;
    v7->_clientConnections = v15;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)DefaultCalendarChanged, (CFStringRef)*MEMORY[0x1E4F574F8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)SystemLanguageChanged, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"_CADDaemonStartedNotification", 0, 0, 1u);
    id v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("initDataFirstUnlockQueue", v18);
    initDataFirstUnlockQueue = v7->_initDataFirstUnlockQueue;
    v7->_initDataFirstUnlockQueue = (OS_dispatch_queue *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.calaccessd.xpcqueue", 0);
    xpcQueue = v7->_xpcQueue;
    v7->_xpcQueue = (OS_dispatch_queue *)v21;

    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.calaccessd.xpc", (dispatch_queue_t)v7->_xpcQueue, 1uLL);
    xpcConnection = v7->_xpcConnection;
    v7->_xpcConnection = mach_service;

    uint64_t v25 = v7->_xpcConnection;
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __29__CADServer_initWithModules___block_invoke_6;
    v42 = &unk_1E624ED50;
    id v26 = v7;
    v43 = v26;
    xpc_connection_set_event_handler(v25, &v39);
    id v27 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v27, OS_LOG_TYPE_INFO, "25534103: Registering for notifications!", buf, 2u);
    }
    if (objc_msgSend(MEMORY[0x1E4F577F0], "isRunningAsSetupUser", v39, v40, v41, v42))
    {
      v28 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBC88000, v28, OS_LOG_TYPE_DEFAULT, "Not loading modules because we are running as the setup user", buf, 2u);
      }
    }
    else
    {
      [v26 setModules:v4];
    }
    long long v29 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.calaccessd.notificationqueue", v29);
    id v31 = v26[1];
    v26[1] = v30;

    long long v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v33 = dispatch_queue_create("com.apple.calaccessd.alarm", v32);
    id v34 = v26[14];
    v26[14] = v33;

    [v26 _registerMaintenanceActivities];
    uint64_t v35 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.calaccessd"];
    id v36 = v26[3];
    v26[3] = (id)v35;

    [v26[3] setDelegate:v26];
    v37 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v48 = (CADServer *)v26;
      _os_log_impl(&dword_1BBC88000, v37, OS_LOG_TYPE_DEBUG, "Server launch sequence complete.  Server: [%@]", buf, 0xCu);
    }
    [MEMORY[0x1E4F576F8] addObserver:v26 selector:sel__handleDatabaseChanged name:*MEMORY[0x1E4F574A0]];
  }
  return v5;
}

void __29__CADServer_initWithModules___block_invoke()
{
  v0 = CADCalendarLogSubsystem;
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  id v4 = objc_claimAutoreleasedReturnValue();
  os_log_t v2 = os_log_create(v0, (const char *)[v4 UTF8String]);
  id v3 = (void *)CADServerLogHandle;
  CADServerLogHandle = (uint64_t)v2;
}

void __29__CADServer_initWithModules___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (object_getClass(v3) == (Class)MEMORY[0x1E4F14578]) {
    [*(id *)(a1 + 32) _handleXPCConnection:v3];
  }
}

- (void)dealloc
{
  [(CADServer *)self _tearDownSignalHandlers];
  [self->_NSXPCListener invalidate];
  [self->_NSXPCListener setDelegate:0];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection) {
    xpc_connection_cancel(xpcConnection);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, (CFNotificationName)*MEMORY[0x1E4F574F8], 0);
  id v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, 0, @"com.apple.language.changed", 0);
  v6.receiver = self;
  v6.super_class = (Class)CADServer;
  [(CADServer *)&v6 dealloc];
}

- (void)activate
{
  id v3 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEFAULT, "Server activation requested.", buf, 2u);
  }
  id v4 = [(CADServer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__CADServer_activate__block_invoke;
  block[3] = &unk_1E624E508;
  void block[4] = self;
  dispatch_sync(v4, block);

  if ([MEMORY[0x1E4F576F0] hasBeenUnlockedSinceBoot])
  {
    initDataFirstUnlockQueue = self->_initDataFirstUnlockQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __21__CADServer_activate__block_invoke_21;
    v7[3] = &unk_1E624E508;
    v7[4] = self;
    dispatch_async(initDataFirstUnlockQueue, v7);
  }
  else
  {
    objc_super v6 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_INFO, "The database is inaccessible.  Will not finish initialization until it becomes accessible.", buf, 2u);
    }
  }
}

void __21__CADServer_activate__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isActive];
  id v3 = CADServerLogHandle;
  BOOL v4 = os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEFAULT, "Server is already active. No activation tasks to perform as a result.", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEFAULT, "Performing server activation tasks.", buf, 2u);
    }
    xpc_connection_resume(*(xpc_connection_t *)(*(void *)(a1 + 32) + 32));
    id v5 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v6 = *(void **)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v6;
      _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEFAULT, "Resumed XPC connection: %@.", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) resume];
    int v7 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(void **)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v8;
      _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_DEFAULT, "Resumed XPC listener: %@.", buf, 0xCu);
    }
    id v9 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_DEFAULT, "Activating modules.", buf, 2u);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v18 = a1;
    v10 = [*(id *)(a1 + 32) modules];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [v15 activate];
          uint64_t v16 = CADServerLogHandle;
          if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v15;
            _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_DEFAULT, "Activated module: %@.", buf, 0xCu);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    v17 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_DEFAULT, "Finished activating modules.", buf, 2u);
    }
    [*(id *)(v18 + 32) _registerForAlarmEvents];
    [*(id *)(v18 + 32) _registerForNotifications];
    [*(id *)(v18 + 32) setActive:1];
  }
}

uint64_t __21__CADServer_activate__block_invoke_21(uint64_t a1)
{
  return [*(id *)(a1 + 32) _protectedDataDidBecomeAvailable];
}

- (void)deactivate
{
  id v3 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEFAULT, "Deactivating server.", buf, 2u);
  }
  BOOL v4 = [(CADServer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__CADServer_deactivate__block_invoke;
  block[3] = &unk_1E624E508;
  void block[4] = self;
  dispatch_sync(v4, block);
}

void __23__CADServer_deactivate__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) isActive];
  id v3 = CADServerLogHandle;
  BOOL v4 = os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEFAULT, "Performing server deactivation tasks.", buf, 2u);
    }
    [*(id *)(a1 + 32) _tearDownSignalHandlers];
    id v5 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEFAULT, "Tore down signal handlers.", buf, 2u);
    }
    objc_super v6 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_DEFAULT, "Deactivating modules.", buf, 2u);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    int v7 = [*(id *)(a1 + 32) modules];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v23;
      *(void *)&long long v9 = 138412290;
      long long v21 = v9;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          objc_msgSend(v13, "deactivate", v21);
          uint64_t v14 = CADServerLogHandle;
          if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            id v27 = v13;
            _os_log_impl(&dword_1BBC88000, v14, OS_LOG_TYPE_DEFAULT, "Deactivated module: %@.", buf, 0xCu);
          }
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v10);
    }

    uint64_t v15 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v15, OS_LOG_TYPE_DEFAULT, "Finished deactivating modules.", buf, 2u);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) suspend];
    uint64_t v16 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412290;
      id v27 = v17;
      _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_DEFAULT, "Suspended XPC listener: %@.", buf, 0xCu);
    }
    uint64_t v18 = *(xpc_connection_t **)(a1 + 32);
    if (v18[4])
    {
      xpc_connection_suspend(v18[4]);
      long long v19 = CADServerLogHandle;
      if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        long long v20 = *(void **)(*(void *)(a1 + 32) + 32);
        *(_DWORD *)buf = 138412290;
        id v27 = v20;
        _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_DEFAULT, "Suspended XPC connection: %@.", buf, 0xCu);
      }
      uint64_t v18 = *(xpc_connection_t **)(a1 + 32);
    }
    [(xpc_connection_t *)v18 setActive:0];
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEFAULT, "Server is already inactive. No deactivation tasks to perform as a result.", buf, 2u);
  }
}

void __48__CADServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    BOOL v4 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      objc_super v6 = [v3 identity];
      int v7 = [v6 pid];
      uint64_t v8 = [v3 identity];
      long long v9 = [v8 clientName];
      v10[0] = 67109378;
      v10[1] = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_ERROR, "Connection from process %i (%@) was interrupted unexpectedly", (uint8_t *)v10, 0x12u);
    }
    [v3 releaseProxy];
    if (WeakRetained) {
      [WeakRetained _clientConnectionDied:v3];
    }
  }
}

- (void)_handleDatabaseChanged
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_connectionLock lock];
  id v3 = (void *)[(NSMutableSet *)self->_clientConnections copy];
  [(NSLock *)self->_connectionLock unlock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "handleDatabaseChanged", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_handleXPCConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (_xpc_connection_s *)a3;
  pid_t pid = xpc_connection_get_pid(v3);
  memset(buffer, 0, sizeof(buffer));
  if (proc_name(pid, buffer, 0x100u))
  {
    uint64_t v5 = [NSString stringWithUTF8String:buffer];
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__CADServer__handleXPCConnection___block_invoke;
  v8[3] = &unk_1E624EDA0;
  id v9 = v5;
  long long v10 = v3;
  uint64_t v6 = v3;
  id v7 = v5;
  xpc_connection_set_event_handler(v6, v8);
  xpc_connection_resume(v6);
}

void __34__CADServer__handleXPCConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 != (id)MEMORY[0x1E4F14520] && v3 != (id)MEMORY[0x1E4F14528])
  {
    xpc_object_t xdict = v3;
    Class Class = object_getClass(v3);
    id v4 = xdict;
    if (Class == (Class)MEMORY[0x1E4F14590])
    {
      string = xpc_dictionary_get_string(xdict, "function");
      size_t v8 = strlen(string);
      int v9 = strncmp(string, "postchangenote", v8);
      id v4 = xdict;
      if (!v9)
      {
        int64_t int64 = xpc_dictionary_get_int64(xdict, "changeType");
        xpc_dictionary_get_int64(xdict, "changeReason");
        long long v11 = xpc_dictionary_get_string(xdict, "clientName");
        if (v11)
        {
          uint64_t v12 = [NSString stringWithUTF8String:v11];
        }
        else
        {
          uint64_t v12 = 0;
        }
        uint64_t v13 = xpc_dictionary_get_string(xdict, "databasePath");
        if (v13)
        {
          uint64_t v14 = [NSString stringWithUTF8String:v13];
          if (v14)
          {
            uint64_t v15 = [MEMORY[0x1E4F57460] changeTrackingForDatabaseWithPath:v14];
            if (v15)
            {
              uint64_t v16 = xpc_dictionary_get_value(xdict, "changes");
              uint64_t v17 = xpc_dictionary_get_value(xdict, "deletes");
              uint64_t v18 = (void *)v17;
              if (v16 && v17)
              {
                ArrayOfRecordIDsFromXPCArray = createArrayOfRecordIDsFromXPCArray(v16);
                long long v20 = createArrayOfRecordIDsFromXPCArray(v18);
                [v15 addChangeset:ArrayOfRecordIDsFromXPCArray deletes:v20 clientID:0 changeType:int64];
                CFRelease(ArrayOfRecordIDsFromXPCArray);
                CFRelease(v20);
              }
              else
              {
                [v15 clearAllChangesets];
              }
            }
            goto LABEL_20;
          }
        }
        else
        {
          uint64_t v14 = 0;
        }
        uint64_t v15 = 0;
LABEL_20:
        xpc_dictionary_get_BOOL(xdict, "postnotificationsynchronously");
        _CalDatabasePostDBOrSyncStatusChangeNotification();
        xpc_object_t reply = xpc_dictionary_create_reply(xdict);
        xpc_dictionary_set_BOOL(reply, "notificationwasposted", 1);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);

        id v4 = xdict;
      }
    }
  }
}

- (void)_finishInitializationWithDataAvailable
{
  if (self->_initializationFinished)
  {
    char v2 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1BBC88000, v2, OS_LOG_TYPE_DEFAULT, "Initialization already finished; not doing it again",
        v5,
        2u);
    }
  }
  else
  {
    self->_initializationFinished = 1;
    id v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_DEFAULT, "Finishing initialization with data available", buf, 2u);
    }
    [(CADServer *)self _migrateIfNeeded];
    [(CADServer *)self _setupBirthdayListener];
  }
}

- (void)_protectedDataDidBecomeAvailable
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_INFO, "Protected data is now available.", buf, 2u);
  }
  [(CADServer *)self _finishInitializationWithDataAvailable];
  [(NSLock *)self->_connectionLock lock];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_clientConnections;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v8++) clearCachedAuthorizationStatus];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v6);
  }

  [(NSLock *)self->_connectionLock unlock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v9 = [(CADServer *)self modules];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) protectedDataDidBecomeAvailable];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)_migrateIfNeeded
{
  char v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_UTILITY, 0);

  id v3 = dispatch_queue_create("migrationQ", attr);
  dispatch_async(v3, &__block_literal_global_23);
}

uint64_t __90__CADServer_initiateReminderAuthenticationForAppProtectionForClientConnection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setUpSignalHandlers
{
  signal(15, (void (__cdecl *)(int))1);
  signal(3, (void (__cdecl *)(int))1);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F577B8]) initWithSignal:15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __33__CADServer__setUpSignalHandlers__block_invoke;
  v14[3] = &unk_1E624EDC8;
  objc_copyWeak(&v15, &location);
  [v4 setFireBlock:v14];
  [v3 addObject:v4];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F577B8]) initWithSignal:3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33__CADServer__setUpSignalHandlers__block_invoke_44;
  v12[3] = &unk_1E624EDC8;
  objc_copyWeak(&v13, &location);
  [v5 setFireBlock:v12];
  [v3 addObject:v5];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F577B8]) initWithSignal:29];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __33__CADServer__setUpSignalHandlers__block_invoke_45;
  uint64_t v10 = &unk_1E624EDC8;
  objc_copyWeak(&v11, &location);
  [v6 setFireBlock:&v7];
  objc_msgSend(v3, "addObject:", v6, v7, v8, v9, v10);
  objc_storeStrong((id *)&self->_signalSensors, v3);
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_49];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __33__CADServer__setUpSignalHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1BBC88000, v2, OS_LOG_TYPE_DEBUG, "Received SIGTERM", v3, 2u);
  }
  [WeakRetained _deactivateAndExit];
}

void __33__CADServer__setUpSignalHandlers__block_invoke_44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1BBC88000, v2, OS_LOG_TYPE_DEBUG, "Received SIGQUIT", v3, 2u);
  }
  [WeakRetained _deactivateAndExit];
}

void __33__CADServer__setUpSignalHandlers__block_invoke_45(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1BBC88000, v2, OS_LOG_TYPE_DEBUG, "Received SIGINFO.", v3, 2u);
  }
  [WeakRetained _dumpState];
}

void __33__CADServer__setUpSignalHandlers__block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEBUG, "Starting sensor: [%@]", (uint8_t *)&v5, 0xCu);
  }
  [v2 startSensor];
  id v4 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_DEBUG, "Started sensor: [%@]", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_tearDownSignalHandlers
{
  [(NSArray *)self->_signalSensors enumerateObjectsUsingBlock:&__block_literal_global_51];
  signalSensors = self->_signalSensors;
  self->_signalSensors = 0;
}

void __36__CADServer__tearDownSignalHandlers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEBUG, "Stopping sensor: [%@]", (uint8_t *)&v4, 0xCu);
  }
  [v2 stopSensor];
}

- (void)_trimExtendAndUpdateOccurrenceCache:(BOOL)a3
{
  id v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_INFO, "25534103: Trim and extend caches", buf, 2u);
  }
  CalDatabaseEnumerateDatabases();
}

void __49__CADServer__trimExtendAndUpdateOccurrenceCache___block_invoke()
{
  uint64_t v0 = CalDatabaseCopyEventOccurrenceCache();
  if (v0)
  {
    v1 = (const void *)v0;
    CalEventOccurrenceCacheTrimExtendAndUpdate();
    CFRelease(v1);
  }
}

- (void)_registerForNotifications
{
  id v3 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEFAULT, "Registering for notifications", buf, 2u);
  }
  notificationQueue = self->_notificationQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __38__CADServer__registerForNotifications__block_invoke;
  handler[3] = &unk_1E624ED50;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", notificationQueue, handler);
}

uint64_t __38__CADServer__registerForNotifications__block_invoke_66(uint64_t a1)
{
  return [*(id *)(a1 + 32) _protectedDataDidBecomeAvailable];
}

- (void)_registerForAlarmEvents
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEFAULT, "Registering for alarm events.", buf, 2u);
  }
  int v4 = (const char *)*MEMORY[0x1E4F57850];
  id v5 = [(CADServer *)self alarmQueue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __36__CADServer__registerForAlarmEvents__block_invoke;
  handler[3] = &unk_1E624ED50;
  handler[4] = self;
  xpc_set_event_stream_handler(v4, v5, handler);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(CADServer *)self modules];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) didRegisterForAlarms];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v8);
  }
}

void __36__CADServer__registerForAlarmEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = (void *)os_transaction_create();
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14560]));
  if (_block_invoke_onceToken != -1) {
    dispatch_once(&_block_invoke_onceToken, &__block_literal_global_71);
  }
  long long v17 = (void *)v5;
  uint64_t v7 = [(id)_block_invoke_dateFormatter stringFromDate:v5];
  uint64_t v8 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v24 = v6;
    __int16 v25 = 2114;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_DEFAULT, "Alarm triggered with name: %{public}@. Triggered date: %{public}@.", buf, 0x16u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "modules", v7);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v14 receivedAlarmNamed:v6];
        id v15 = CADServerLogHandle;
        if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          long long v24 = v6;
          __int16 v25 = 2112;
          uint64_t v26 = (uint64_t)v14;
          _os_log_impl(&dword_1BBC88000, v15, OS_LOG_TYPE_DEFAULT, "Forwarded alarm named: %@ to module: %@.", buf, 0x16u);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

uint64_t __36__CADServer__registerForAlarmEvents__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_block_invoke_dateFormatter;
  _block_invoke_dateFormatter = (uint64_t)v0;

  id v2 = (void *)_block_invoke_dateFormatter;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

- (void)_registerMaintenanceActivities
{
  id v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_INFO, "Registering maintenance activities.", v4, 2u);
  }
  [(CADServer *)self _registerForDatabaseCleanup];
  [(CADServer *)self _registerForAnalyticsCollection];
  [(CADServer *)self _registerForAttachmentCleanup];
  [(CADServer *)self _registerForChangeTableCleanup];
  [(CADServer *)self _registerForConferenceURLRenewal];
  [(CADServer *)self _registerForOccurrenceCacheUpdate];
}

- (void)_registerActivityWithIdentifier:(const char *)a3 block:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)*MEMORY[0x1E4F14158];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CADServer__registerActivityWithIdentifier_block___block_invoke;
  v8[3] = &unk_1E624EE30;
  id v9 = v5;
  uint64_t v10 = a3;
  id v7 = v5;
  xpc_activity_register(a3, v6, v8);
}

void __51__CADServer__registerActivityWithIdentifier_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    id v5 = NSString;
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = [v5 stringWithUTF8String:v6];
    *(_DWORD *)buf = 138412290;
    v43 = v8;
    _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_INFO, "Beginning XPC transaction for activity with identifier: [%@].", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"com.apple.calendarDaemon.registerActivity.%s", *(void *)(a1 + 40));
  id v9 = objc_claimAutoreleasedReturnValue();
  [v9 UTF8String];
  uint64_t v10 = (void *)os_transaction_create();

  xpc_activity_state_t state = xpc_activity_get_state(v3);
  uint64_t v12 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    long long v13 = NSString;
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = v12;
    long long v16 = [v13 stringWithUTF8String:v14];
    long long v17 = _CADStringFromXPCActivityState(state);
    *(_DWORD *)buf = 138412546;
    v43 = v16;
    __int16 v44 = 2112;
    v45 = v17;
    _os_log_impl(&dword_1BBC88000, v15, OS_LOG_TYPE_INFO, "Activity with identifier: [%@] is in [%@] state.", buf, 0x16u);
  }
  if (state == 2)
  {
    long long v24 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = NSString;
      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v27 = v24;
      v28 = [v25 stringWithUTF8String:v26];
      *(_DWORD *)buf = 138412290;
      v43 = v28;
      _os_log_impl(&dword_1BBC88000, v27, OS_LOG_TYPE_INFO, "Running activity with identifier: [%@].", buf, 0xCu);
    }
    if (![MEMORY[0x1E4F577F0] isRunningAsSetupUser])
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v34 = (void *)CADLogHandle;
      if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      uint64_t v35 = NSString;
      uint64_t v36 = *(void *)(a1 + 40);
      long long v18 = v34;
      long long v22 = [v35 stringWithUTF8String:v36];
      *(_DWORD *)buf = 138412290;
      v43 = v22;
      _os_log_impl(&dword_1BBC88000, v18, OS_LOG_TYPE_INFO, "Finished running activity with identifier: [%@].", buf, 0xCu);
      goto LABEL_18;
    }
    uint64_t v29 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v29, OS_LOG_TYPE_ERROR, "Skipping activity because we are running as the setup user", buf, 2u);
    }
  }
  else
  {
    if (!state)
    {
      long long v18 = xpc_activity_copy_criteria(v3);
      long long v19 = (void *)CADLogHandle;
      if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
LABEL_19:

        goto LABEL_20;
      }
      long long v20 = NSString;
      uint64_t v21 = *(void *)(a1 + 40);
      long long v22 = v19;
      long long v23 = [v20 stringWithUTF8String:v21];
      *(_DWORD *)buf = 138412546;
      v43 = v18;
      __int16 v44 = 2112;
      v45 = v23;
      _os_log_impl(&dword_1BBC88000, v22, OS_LOG_TYPE_INFO, "Criteria: %@. Identifier: %@.", buf, 0x16u);

LABEL_18:
      goto LABEL_19;
    }
    dispatch_queue_t v30 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      id v31 = v30;
      long long v32 = _CADStringFromXPCActivityState(state);
      dispatch_queue_t v33 = [NSString stringWithUTF8String:*(void *)(a1 + 40)];
      *(_DWORD *)buf = 138412546;
      v43 = v32;
      __int16 v44 = 2112;
      v45 = v33;
      _os_log_impl(&dword_1BBC88000, v31, OS_LOG_TYPE_INFO, "Will not process activity state [%@]. Identifier: [%@].", buf, 0x16u);
    }
  }
LABEL_20:
  v37 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    v38 = NSString;
    uint64_t v39 = *(void *)(a1 + 40);
    uint64_t v40 = v37;
    v41 = [v38 stringWithUTF8String:v39];
    *(_DWORD *)buf = 138412290;
    v43 = v41;
    _os_log_impl(&dword_1BBC88000, v40, OS_LOG_TYPE_INFO, "Ending XPC transaction for activity with identifier: [%@].", buf, 0xCu);
  }
}

- (void)_registerForDatabaseCleanup
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__CADServer__registerForDatabaseCleanup__block_invoke;
  v2[3] = &unk_1E624E508;
  v2[4] = self;
  [(CADServer *)self _registerActivityWithIdentifier:"com.apple.calendar.daemon.databasecleanup" block:v2];
}

void __40__CADServer__registerForDatabaseCleanup__block_invoke(uint64_t a1)
{
  uint64_t v2 = CalDatabaseCreateWithOptions();
  if (v2)
  {
    id v3 = (const void *)v2;
    CalDatabaseSetChangeLoggingEnabled();
    [*(id *)(a1 + 32) cleanupDatabase:v3];
    CFRelease(v3);
  }
  else
  {
    int v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_ERROR, "WARNING: Database is nil. Cannot perform identity orphan cleanup as a result.", v5, 2u);
    }
  }
}

- (void)_registerForAnalyticsCollection
{
}

- (void)_registerForAttachmentCleanup
{
}

void __42__CADServer__registerForAttachmentCleanup__block_invoke()
{
  id v0 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v0, OS_LOG_TYPE_DEFAULT, "Cleaning up orphaned attachments", buf, 2u);
  }
  +[LocalAttachmentCleanUpSupport cleanUpOrphanedFiles];
  v1 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1BBC88000, v1, OS_LOG_TYPE_DEFAULT, "Finished cleaning up orphaned attachments", v2, 2u);
  }
}

- (void)_registerForChangeTableCleanup
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__CADServer__registerForChangeTableCleanup__block_invoke;
  v2[3] = &unk_1E624E508;
  v2[4] = self;
  [(CADServer *)self _registerActivityWithIdentifier:"com.apple.calendar.daemon.changetablecleanup" block:v2];
}

void __43__CADServer__registerForChangeTableCleanup__block_invoke(uint64_t a1)
{
  uint64_t v2 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up change tables", buf, 2u);
  }
  uint64_t v3 = CalDatabaseCreateWithOptions();
  if (v3)
  {
    int v4 = (const void *)v3;
    [*(id *)(a1 + 32) _cleanupChangeTablesInDatabase:v3];
    CFRelease(v4);
    uint64_t v5 = CADLogHandle;
    if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v12 = 0;
    uint64_t v6 = "Finished cleaning up change tables";
    id v7 = (uint8_t *)&v12;
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    uint64_t v10 = CADLogHandle;
    if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR)) {
      return;
    }
    __int16 v11 = 0;
    uint64_t v6 = "WARNING: Database is nil. Cannot clean up change tables as a result.";
    id v7 = (uint8_t *)&v11;
    uint64_t v8 = v10;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1BBC88000, v8, v9, v6, v7, 2u);
}

- (void)_registerForConferenceURLRenewal
{
}

uint64_t __45__CADServer__registerForConferenceURLRenewal__block_invoke()
{
  return +[CADConferenceUtils performConferenceLinkRenewalIfNeeded];
}

- (void)_registerForOccurrenceCacheUpdate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__CADServer__registerForOccurrenceCacheUpdate__block_invoke;
  v2[3] = &unk_1E624E508;
  v2[4] = self;
  [(CADServer *)self _registerActivityWithIdentifier:"com.apple.calendar.daemon.occurrencecacheupdate" block:v2];
}

uint64_t __46__CADServer__registerForOccurrenceCacheUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trimExtendAndUpdateOccurrenceCache:1];
}

- (void)cleanupDatabase:(CalDatabase *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    uint64_t v6 = a3;
    _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_INFO, "Performing database cleanup. Database: %@", (uint8_t *)&v5, 0xCu);
  }
  CalDatabaseCleanUpDeclinedEvents();
  CalIdentityGarbageCollectOrphans();
  CalDatabaseCleanupDanglers();
}

- (void)_cleanupChangeTablesInDatabase:(CalDatabase *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = +[CADIdleChangeTrackingCleanupInfo serverIdleChangeTrackingCleanupInfo];
  int v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    os_log_type_t v9 = a3;
    _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_INFO, "Performing idle change-tracking client cleanup. Idle change tracking cleanup info: %@. Database: %@.", (uint8_t *)&v6, 0x16u);
  }
  [v4 languishPeriod];
  [v4 numberOfChanges];
  CFAbsoluteTimeGetCurrent();
  CalDatabasePurgeIdlePersistentChangeTrackingClients();
}

- (unint64_t)_lastKnownContactsAuthorization
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  unint64_t v3 = [v2 integerForKey:@"CADLastKnownContactsAuthorization"];

  return v3;
}

- (unint64_t)_contactsAuthorization
{
  uint64_t v2 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  [(id)*MEMORY[0x1E4F57868] UTF8String];
  unint64_t v3 = (void *)tcc_identity_create();
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 1;
  int v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("contactsAuthQueue", v4);

  int v6 = (void *)tcc_server_create();
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  tcc_server_message_get_authorization_records_by_identity();
  unint64_t v7 = v12[3];
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __35__CADServer__contactsAuthorization__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = tcc_authorization_record_get_authorization_right();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v6 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v12 = 134217984;
      uint64_t v13 = v7;
      __int16 v8 = "Contacts authorization is %llu";
      os_log_type_t v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
LABEL_4:
      _os_log_impl(&dword_1BBC88000, v9, v10, v8, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v11 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      uint64_t v13 = a3;
      __int16 v8 = "Error getting contacts authorization: %@";
      os_log_type_t v9 = v11;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_4;
    }
  }
}

- (void)_registerContactsAccess
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  [v2 requestAccessForEntityType:0 completionHandler:&__block_literal_global_102];
}

- (void)_setupBirthdayListener
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (MGGetBoolAnswer())
  {
    unint64_t v3 = [(CADServer *)self _contactsAuthorization];
    unint64_t v4 = v3;
    if (v3 == 2)
    {
      [(CADServer *)self _startBirthdayListener];
      if ([(CADServer *)self _lastKnownContactsAuthorization] != 2) {
        +[CADBirthdayListener reset];
      }
    }
    else
    {
      if (v3 == 1)
      {
        id v5 = (void *)*MEMORY[0x1E4FA9A10];
        uint64_t v15 = *MEMORY[0x1E4F57868];
        long long v16 = v5;
        uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
        id v7 = v5;
        __int16 v8 = [v6 arrayWithObjects:&v15 count:1];
        v17[0] = v8;
        os_log_type_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

        os_log_type_t v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        uint64_t v11 = (void *)tcc_events_filter_create_with_criteria();
        int v12 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.calaccessd.tccQ", 0);
        tccQueue = self->_tccQueue;
        self->_tccQueue = v12;

        tcc_events_subscribe();
        return;
      }
      [(CADServer *)self _registerContactsAccess];
    }
    id v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v14 setInteger:v4 forKey:@"CADLastKnownContactsAuthorization"];
  }
  else
  {
    [(CADServer *)self _startBirthdayListener];
  }
}

uint64_t __35__CADServer__setupBirthdayListener__block_invoke(uint64_t a1)
{
  uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
  unint64_t v3 = *(void **)(a1 + 32);
  if (authorization_right == 2) {
    [v3 _startBirthdayListener];
  }
  else {
    [v3 _registerContactsAccess];
  }
  unint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setInteger:authorization_right forKey:@"CADLastKnownContactsAuthorization"];

  return MEMORY[0x1F415CCE0]("com.apple.calaccessd");
}

- (void)_startBirthdayListener
{
  dispatch_time_t v2 = dispatch_time(0, 3000000000);
  unint64_t v3 = MEMORY[0x1E4F14428];
  dispatch_after(v2, v3, &__block_literal_global_113);
}

uint64_t __35__CADServer__startBirthdayListener__block_invoke()
{
  return +[CADBirthdayListener start];
}

- (void)_deactivateAndExit
{
  [(CADServer *)self deactivate];
  [(CADServer *)self _exit];
}

- (void)_exit
{
  dispatch_time_t v2 = [(CADServer *)self workQueue];
  dispatch_sync(v2, &__block_literal_global_115);
}

uint64_t __18__CADServer__exit__block_invoke()
{
  id v0 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v2 = 0;
    _os_log_impl(&dword_1BBC88000, v0, OS_LOG_TYPE_DEFAULT, "Exiting", v2, 2u);
  }
  return xpc_transaction_exit_clean();
}

- (void)_dumpState
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEBUG, "Dumping server state to the system log", buf, 2u);
  }
  NSLog(&cfstr_DumpingCalacce.isa);
  if ([(NSMutableSet *)self->_clientConnections count])
  {
    NSLog(&cfstr_LdConnectionS.isa, [(NSMutableSet *)self->_clientConnections count]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    unint64_t v4 = self->_clientConnections;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) dumpState];
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v6);
    }
  }
  else
  {
    NSLog(&cfstr_NoConnections.isa);
  }
}

- (void)setModules:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)alarmQueue
{
  return self->_alarmQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_modules, 0);
  objc_storeStrong((id *)&self->_initDataFirstUnlockQueue, 0);
  objc_storeStrong((id *)&self->_signalSensors, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_tccQueue, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_NSXPCListener, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end