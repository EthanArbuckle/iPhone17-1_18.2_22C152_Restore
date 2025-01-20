@interface SPCompanionAppServer
- (BKSProcessAssertion)processAssertion;
- (BKSProcessAssertion)processAssertionForXcode;
- (BOOL)_checkUnlockedSinceBoot;
- (BOOL)_isApplicationViewControllerActivate:(id)a3;
- (BOOL)_unlockedSinceBoot;
- (BOOL)connection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)isExtensionDoingSnapshot:(id)a3;
- (BOOL)isPaired;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)paired;
- (BOOL)shouldKillExtensionOnError:(id)a3;
- (BOOL)showUserNotificationWithTitle:(id)a3 message:(id)a4;
- (NRDevice)pairedDevice;
- (NSDate)dateOfFirstUnlock;
- (NSDictionary)launchSockPuppetAppOptions;
- (NSMutableDictionary)dateOfFirstAttemptToLaunchGizmoAppsByBundleID;
- (NSMutableDictionary)extensionsDoingSnapshot;
- (NSMutableDictionary)lastExtensionKilledDates;
- (NSMutableDictionary)localConnections;
- (NSMutableDictionary)outstandingtransactions;
- (NSMutableDictionary)remoteInterfaceProcessAssertions;
- (NSString)activeApplication;
- (NSString)launchSockPuppetAppCompanionAppIdentifer;
- (NSString)plugInIdentifierForXcodeProcessAssertion;
- (NSXPCListener)localListener;
- (OS_dispatch_queue)extensionsDoingSnapshotQueue;
- (OS_dispatch_queue)lastExtensionKilledDatesQueue;
- (OS_dispatch_queue)launchSockPuppetAppQueue;
- (OS_dispatch_queue)processAssertionForXcodeQueue;
- (OS_dispatch_queue)processAssertionQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)queueRemote;
- (OS_dispatch_queue)remoteInterfaceProcessAssertionsQueue;
- (OS_dispatch_queue)timingTest_queue;
- (OS_dispatch_queue)transactionQueue;
- (OS_dispatch_source)gizmoApplicationsUpdateTimer;
- (OS_dispatch_source)launchSockPuppetCancelLaunchTimer;
- (SPCompanionAppServer)init;
- (SPUsageTrack)usageTrack;
- (double)timingTest_IDSReceiveTime;
- (double)timingTest_IDSSendTime;
- (id)_setupSignal:(int)a3 handler:(id)a4;
- (id)_textSize;
- (id)_textSizeChanged;
- (id)appBundleIDFromPlist:(id)a3;
- (id)applicationIdentifierFromXPCConnection:(id)a3;
- (id)batteryStateObserver;
- (id)decodeInData:(id)a3;
- (id)decodeOutData:(id)a3;
- (id)decodeProtoData:(id)a3;
- (id)launchSockPuppetAppCompletion;
- (id)logDictionary:(id)a3;
- (id)logStringArray:(id)a3;
- (id)transactionDictForID:(id)a3 removeFromOutstanding:(BOOL)a4;
- (unint64_t)timingTest_IDSSendSize;
- (unsigned)nextTransactionID;
- (void)_applicationActivated:(id)a3;
- (void)_applicationDeactivated:(id)a3;
- (void)_cancelLaunchSockPuppetAppTimeout;
- (void)_saveReceiveTime;
- (void)_saveSendTimeAndSize:(unint64_t)a3;
- (void)_sendTextSizeToApplication:(id)a3 onlyIfChanged:(BOOL)a4;
- (void)_setupSignalHandlers;
- (void)_sockPuppetAppListUpdatedToLaunchSockPuppetAppForCompanionAppWithIdentifier:(id)a3 options:(id)a4 acxRetryGeneration:(unint64_t)a5 completion:(id)a6;
- (void)activeComplicationsWithCompletion:(id)a3;
- (void)cancelGizmoApplicationsUpdateTimer;
- (void)clearLastResetDateForPluginIdentifier:(id)a3;
- (void)extensionDidBeginSnapshot:(id)a3;
- (void)extensionDidEndSnapshot:(id)a3;
- (void)extensionWithIdentifier:(id)a3 gotUnknownInterfaceController:(id)a4;
- (void)fetchInstalledApplicationsWithCompletion:(id)a3;
- (void)fetchNotificationForNotificationID:(id)a3 completion:(id)a4;
- (void)getCompanionExtensionPIDForCompanionAppWithIdentifier:(id)a3 completion:(id)a4;
- (void)getSockPuppetAppRunningStatusForCompanionAppWithIdentifier:(id)a3 completion:(id)a4;
- (void)handleIncomingData:(id)a3;
- (void)handleIncomingPlist:(id)a3;
- (void)handleIncomingProtoPlist:(id)a3;
- (void)hideUserNotification;
- (void)incomingData:(id)a3;
- (void)incomingProtobuf:(id)a3;
- (void)killExtensionForAppIdentifier:(id)a3;
- (void)launchSockPuppetAppForCompanionAppWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
- (void)logDataSent:(unint64_t)a3 application:(id)a4;
- (void)nanoRegistryChanged:(id)a3;
- (void)releaseProcessAssertion:(id)a3;
- (void)releaseProcessAssertionForXcode;
- (void)releaseRemoteInterfaceAssertionsForPluginIdentifer:(id)a3;
- (void)requestTimingData:(id)a3 timingMetaData:(id)a4;
- (void)sendAndTrackTransactionDict:(id)a3 withCompletion:(id)a4;
- (void)sendCacheRequest:(id)a3 identifier:(id)a4;
- (void)sendData:(id)a3 identifier:(id)a4 clientIdentifiers:(id)a5;
- (void)sendData:(id)a3 identifier:(id)a4 clientIdentifiers:(id)a5 reply:(id)a6;
- (void)sendData:(id)a3 toApplication:(id)a4;
- (void)sendData:(id)a3 toCompanionApplication:(id)a4 fromIdentifier:(id)a5;
- (void)sendFirstUnlockStatusToGizmo;
- (void)sendPlist:(id)a3 securityType:(int64_t)a4;
- (void)sendPlist:(id)a3 timeOut:(double)a4 securityType:(int64_t)a5;
- (void)sendProtoData:(id)a3 toCompanionApplication:(id)a4 fromIdentifier:(id)a5;
- (void)sendProtobuf:(id)a3 sender:(id)a4 timeOut:(double)a5 securityType:(int64_t)a6;
- (void)sendToRemoteInterface:(id)a3 call:(id)a4;
- (void)setActiveApplication:(id)a3;
- (void)setApplicationIDForXcodeProcessAssertion:(id)a3;
- (void)setBatteryStateObserver:(id)a3;
- (void)setDateOfFirstAttemptToLaunchGizmoAppsByBundleID:(id)a3;
- (void)setDateOfFirstUnlock:(id)a3;
- (void)setExtensionsDoingSnapshot:(id)a3;
- (void)setExtensionsDoingSnapshotQueue:(id)a3;
- (void)setGizmoApplicationsUpdateTimer:(id)a3;
- (void)setLastExtensionKilledDateForPluginIdentifier:(id)a3;
- (void)setLastExtensionKilledDates:(id)a3;
- (void)setLastExtensionKilledDatesQueue:(id)a3;
- (void)setLaunchSockPuppetAppCompanionAppIdentifer:(id)a3;
- (void)setLaunchSockPuppetAppCompletion:(id)a3;
- (void)setLaunchSockPuppetAppOptions:(id)a3;
- (void)setLaunchSockPuppetAppQueue:(id)a3;
- (void)setLaunchSockPuppetCancelLaunchTimer:(id)a3;
- (void)setLocalConnections:(id)a3;
- (void)setLocalListener:(id)a3;
- (void)setNextTransactionID:(unsigned int)a3;
- (void)setOutstandingtransactions:(id)a3;
- (void)setPaired:(BOOL)a3;
- (void)setPairedDevice:(id)a3;
- (void)setPlugInIdentifierForXcodeProcessAssertion:(id)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setProcessAssertionForXcode:(id)a3;
- (void)setProcessAssertionForXcodeQueue:(id)a3;
- (void)setProcessAssertionQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueueRemote:(id)a3;
- (void)setRemoteInterfaceProcessAssertions:(id)a3;
- (void)setRemoteInterfaceProcessAssertionsQueue:(id)a3;
- (void)setTimingTest_IDSReceiveTime:(double)a3;
- (void)setTimingTest_IDSSendSize:(unint64_t)a3;
- (void)setTimingTest_IDSSendTime:(double)a3;
- (void)setTimingTest_queue:(id)a3;
- (void)setTransactionQueue:(id)a3;
- (void)setUsageTrack:(id)a3;
- (void)setup;
- (void)showUserNotification:(int64_t)a3 applicationName:(id)a4;
- (void)takeProcessAssertionForXcode:(id)a3;
- (void)terminateSockPuppetAppForCompanionAppWithIdentifier:(id)a3 completion:(id)a4;
- (void)wakeExtensionForWatchApp:(id)a3;
- (void)xcodeWillInstallSockPuppetAppWithCompanionAppIdentifier:(id)a3 completion:(id)a4;
@end

@implementation SPCompanionAppServer

- (SPCompanionAppServer)init
{
  v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v54 = "-[SPCompanionAppServer init]";
    __int16 v55 = 1024;
    int v56 = 402;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ******* SPCompanionAppServer, init started", buf, 0x12u);
  }

  v50.receiver = self;
  v50.super_class = (Class)SPCompanionAppServer;
  v4 = [(SPCompanionAppServer *)&v50 init];
  [(SPCompanionAppServer *)v4 _setupSignalHandlers];
  v5 = objc_alloc_init(SPUsageTrack);
  [(SPCompanionAppServer *)v4 setUsageTrack:v5];

  id v6 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.companionappd"];
  [(SPCompanionAppServer *)v4 setLocalListener:v6];

  v7 = [(SPCompanionAppServer *)v4 localListener];
  [v7 setDelegate:v4];

  v8 = +[NSMutableDictionary dictionary];
  [(SPCompanionAppServer *)v4 setLocalConnections:v8];

  v9 = +[SPTransport sharedInstance];
  [v9 setTransportDelegate:v4];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000A478;
  handler[3] = &unk_100045480;
  v10 = v4;
  v49 = v10;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000454C0);

  dispatch_queue_t v11 = dispatch_queue_create("com.apple.companionappd.queue", 0);
  queue = v10->_queue;
  v10->_queue = (OS_dispatch_queue *)v11;

  dispatch_queue_t v13 = dispatch_queue_create("com.apple.companionappd.queueRemote", 0);
  queueRemote = v10->_queueRemote;
  v10->_queueRemote = (OS_dispatch_queue *)v13;

  dispatch_queue_t v15 = dispatch_queue_create("com.apple.watchkit.timingTestQueue", 0);
  timingTest_queue = v10->_timingTest_queue;
  v10->_timingTest_queue = (OS_dispatch_queue *)v15;

  dispatch_queue_t v17 = dispatch_queue_create("com.apple.companionappd.transactionQueue", 0);
  transactionQueue = v10->_transactionQueue;
  v10->_transactionQueue = (OS_dispatch_queue *)v17;

  dispatch_queue_t v19 = dispatch_queue_create("com.apple.companionappd.processAssertionQueue", 0);
  processAssertionQueue = v10->_processAssertionQueue;
  v10->_processAssertionQueue = (OS_dispatch_queue *)v19;

  dispatch_queue_t v21 = dispatch_queue_create("com.apple.companionappd.processAssertionForXcodeQueue", 0);
  processAssertionForXcodeQueue = v10->_processAssertionForXcodeQueue;
  v10->_processAssertionForXcodeQueue = (OS_dispatch_queue *)v21;

  dispatch_queue_t v23 = dispatch_queue_create("com.apple.companionappd.remoteInterfaceProcessAssertionsQueue", 0);
  remoteInterfaceProcessAssertionsQueue = v10->_remoteInterfaceProcessAssertionsQueue;
  v10->_remoteInterfaceProcessAssertionsQueue = (OS_dispatch_queue *)v23;

  uint64_t v25 = +[NSMutableDictionary dictionary];
  remoteInterfaceProcessAssertions = v10->_remoteInterfaceProcessAssertions;
  v10->_remoteInterfaceProcessAssertions = (NSMutableDictionary *)v25;

  dispatch_queue_t v27 = dispatch_queue_create("com.apple.companionappd.launchGizmoApp", 0);
  launchSockPuppetAppQueue = v10->_launchSockPuppetAppQueue;
  v10->_launchSockPuppetAppQueue = (OS_dispatch_queue *)v27;

  uint64_t v29 = +[NSMutableDictionary dictionary];
  extensionsDoingSnapshot = v10->_extensionsDoingSnapshot;
  v10->_extensionsDoingSnapshot = (NSMutableDictionary *)v29;

  dispatch_queue_t v31 = dispatch_queue_create("com.apple.companionappd.extensionsDoingBackgroundGlanceUpdate", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  extensionsDoingSnapshotQueue = v10->_extensionsDoingSnapshotQueue;
  v10->_extensionsDoingSnapshotQueue = (OS_dispatch_queue *)v31;

  uint64_t v33 = +[NSMutableDictionary dictionary];
  lastExtensionKilledDates = v10->_lastExtensionKilledDates;
  v10->_lastExtensionKilledDates = (NSMutableDictionary *)v33;

  dispatch_queue_t v35 = dispatch_queue_create("com.apple.gizmoappd.lastExtensionKilledDates", 0);
  lastExtensionKilledDatesQueue = v10->_lastExtensionKilledDatesQueue;
  v10->_lastExtensionKilledDatesQueue = (OS_dispatch_queue *)v35;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)sub_100015DD4, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v38 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v38, v10, (CFNotificationCallback)sub_100015DD4, @"com.apple.nano.watchlanguagechanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v39 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v39, v10, (CFNotificationCallback)sub_100015DD4, @"com.apple.nano.watchlocalechanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v40 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v40, v10, (CFNotificationCallback)sub_10000A784, @"com.apple.sockpuppet.activeComplicationsPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v41 = +[NSNotificationCenter defaultCenter];
  [v41 addObserver:v10 selector:"nanoRegistryChanged:" name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];

  v42 = +[NSNotificationCenter defaultCenter];
  [v42 addObserver:v10 selector:"nanoRegistryChanged:" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  v10->_paired = [(SPCompanionAppServer *)v10 isPaired];
  CFStringRef v51 = @"c";
  CFStringRef v52 = @"ds";
  v43 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  [(SPCompanionAppServer *)v10 sendPlist:v43 timeOut:1 securityType:IDSMaxMessageTimeout];

  id v44 = +[SPCompanionNotificationHandler sharedInstance];
  [(SPCompanionAppServer *)v10 sendFirstUnlockStatusToGizmo];
  if (spUtils_isRunningInF5DemoMode())
  {
    v45 = wk_default_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_1000299B0();
    }
  }
  v46 = wk_default_log();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v54 = "-[SPCompanionAppServer init]";
    __int16 v55 = 1024;
    int v56 = 522;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ******* SPCompanionAppServer, init completed", buf, 0x12u);
  }

  return v10;
}

- (void)_setupSignalHandlers
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A8FC;
  v4[3] = &unk_1000447A0;
  v4[4] = self;
  uint64_t v2 = [(SPCompanionAppServer *)self _setupSignal:31 handler:v4];
  v3 = (void *)qword_1000524D8;
  qword_1000524D8 = v2;
}

- (id)_setupSignal:(int)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a3, 0, (dispatch_queue_t)&_dispatch_main_q);
  if (v6)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000AE40;
    handler[3] = &unk_100045510;
    v10 = v5;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    signal(a3, (void (__cdecl *)(int))1);
    v7 = v10;
  }
  else
  {
    v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100029A30();
    }
  }

  return v6;
}

- (void)logDataSent:(unint64_t)a3 application:(id)a4
{
  id v6 = a4;
  [(SPCompanionAppServer *)self _saveSendTimeAndSize:a3];
  id v7 = [(SPCompanionAppServer *)self usageTrack];
  [v7 dataSentToGizmo:a3 application:v6];
}

- (void)setup
{
  id v2 = [(SPCompanionAppServer *)self localListener];
  [v2 resume];
}

- (void)cancelGizmoApplicationsUpdateTimer
{
  gizmoApplicationsUpdateTimer = self->_gizmoApplicationsUpdateTimer;
  if (gizmoApplicationsUpdateTimer)
  {
    dispatch_source_cancel((dispatch_source_t)gizmoApplicationsUpdateTimer);
    v4 = self->_gizmoApplicationsUpdateTimer;
    self->_gizmoApplicationsUpdateTimer = 0;
  }
}

- (BOOL)_unlockedSinceBoot
{
  if (byte_1000524E0) {
    return 1;
  }
  BOOL result = [(SPCompanionAppServer *)self _checkUnlockedSinceBoot];
  byte_1000524E0 = result;
  return result;
}

- (BOOL)_checkUnlockedSinceBoot
{
  if (MKBDeviceUnlockedSinceBoot()) {
    return 1;
  }
  int v3 = MKBGetDeviceLockState();
  return v3 == 3 || v3 == 0;
}

- (void)sendFirstUnlockStatusToGizmo
{
  BOOL v3 = [(SPCompanionAppServer *)self _unlockedSinceBoot];
  v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v10 = "-[SPCompanionAppServer sendFirstUnlockStatusToGizmo]";
    __int16 v11 = 1024;
    int v12 = 628;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: unlocked=%d", buf, 0x18u);
  }

  v8[0] = @"pd";
  id v5 = +[NSNumber numberWithBool:v3, @"c", @"pl"];
  v7[2] = @"bg";
  v8[1] = v5;
  v8[2] = &__kCFBooleanTrue;
  id v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  [(SPCompanionAppServer *)self sendPlist:v6 securityType:1];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  v9 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (!v9) {
    goto LABEL_12;
  }
  v10 = v9;
  CFErrorRef error = 0;
  __int16 v11 = (void *)SecTaskCopyValueForEntitlement(v9, @"com.apple.companionappd.connect.allow", &error);
  if (error)
  {
    int v12 = [v8 _xpcConnection];
    __int16 v13 = sub_10000B508(v12);

    BOOL v14 = wk_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      CFErrorRef v27 = error;
      unsigned int v28 = [v8 processIdentifier];
      *(_DWORD *)buf = 136447234;
      v36 = "-[SPCompanionAppServer listener:shouldAcceptNewConnection:]";
      __int16 v37 = 1024;
      int v38 = 649;
      __int16 v39 = 2114;
      CFErrorRef v40 = v27;
      __int16 v41 = 2114;
      v42 = v13;
      __int16 v43 = 1024;
      unsigned int v44 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s:%d: Got error %{public}@ while checking entitlement for process %{public}@ with pid %d", buf, 0x2Cu);
    }

    CFRelease(error);
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_13:
    CFRelease(v10);
    goto LABEL_14;
  }
  unsigned __int8 v15 = [v11 BOOLValue];
  CFRelease(v10);
  if (v15)
  {

LABEL_12:
    v16 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SPLocalApplicationProtocol];
    [v8 setRemoteObjectInterface:v16];

    dispatch_queue_t v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SPLocalServerProtocol];
    [v8 setExportedInterface:v17];

    [v8 setExportedObject:self];
    [v8 resume];
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v8 processIdentifier]);
    dispatch_queue_t v19 = [(SPCompanionAppServer *)self localConnections];
    [v19 setObject:v8 forKey:v18];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000B608;
    v31[3] = &unk_1000447C8;
    v31[4] = self;
    id v20 = v18;
    id v32 = v20;
    [v8 setInterruptionHandler:v31];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000B65C;
    v29[3] = &unk_1000447C8;
    v29[4] = self;
    id v30 = v20;
    id v21 = v20;
    [v8 setInvalidationHandler:v29];

    BOOL v22 = 1;
    goto LABEL_17;
  }
LABEL_14:
  dispatch_queue_t v23 = [v8 _xpcConnection];
  v24 = sub_10000B508(v23);

  uint64_t v25 = wk_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_100029AC0((uint64_t)v24, v8, v25);
  }

  BOOL v22 = 0;
LABEL_17:

  return v22;
}

- (void)sendPlist:(id)a3 timeOut:(double)a4 securityType:(int64_t)a5
{
  id v8 = a3;
  v9 = +[SPProtoSerializer spPlistWithDictionary:v8];
  if (v9)
  {
    kdebug_trace();
    v10 = [v8 objectForKeyedSubscript:@"i"];
    __int16 v11 = +[SPIDSProtobuf protobufWithSPPlist:v9 identifier:v10];
    [(SPCompanionAppServer *)self sendProtobuf:v11 sender:v10 timeOut:a5 securityType:a4];
  }
  else
  {
    int v12 = wk_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100029B9C();
    }
  }
}

- (void)sendProtobuf:(id)a3 sender:(id)a4 timeOut:(double)a5 securityType:(int64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  int v12 = +[SPTransport sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000B8B0;
  v14[3] = &unk_100045538;
  id v15 = v10;
  v16 = self;
  id v13 = v10;
  [v12 sendProtobuf:v11 sender:v13 timeOut:a6 securityType:v14 withCompletion:a5];
}

- (void)setLastExtensionKilledDateForPluginIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[NSDate date];
    lastExtensionKilledDatesQueue = self->_lastExtensionKilledDatesQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BC24;
    block[3] = &unk_100045560;
    block[4] = self;
    id v9 = v4;
    id v10 = v5;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)lastExtensionKilledDatesQueue, block);
  }
}

- (void)clearLastResetDateForPluginIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    lastExtensionKilledDatesQueue = self->_lastExtensionKilledDatesQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000BD28;
    void v7[3] = &unk_1000447C8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)lastExtensionKilledDatesQueue, v7);
  }
}

- (BOOL)shouldKillExtensionOnError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    lastExtensionKilledDatesQueue = self->_lastExtensionKilledDatesQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BE64;
    block[3] = &unk_100045588;
    block[4] = self;
    id v10 = v4;
    id v11 = &v12;
    dispatch_sync((dispatch_queue_t)lastExtensionKilledDatesQueue, block);
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)sendPlist:(id)a3 securityType:(int64_t)a4
{
}

- (void)sendToRemoteInterface:(id)a3 call:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SPCompanionAppServer *)self queueRemote];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BFD4;
  block[3] = &unk_100045628;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)sendData:(id)a3 toCompanionApplication:(id)a4 fromIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 length];
  id v12 = wk_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(SPCompanionAppServer *)self decodeOutData:v8];
    *(_DWORD *)buf = 136447491;
    id v20 = "-[SPCompanionAppServer sendData:toCompanionApplication:fromIdentifier:]";
    __int16 v21 = 1024;
    int v22 = 834;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 2048;
    id v28 = v11;
    __int16 v29 = 2113;
    id v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:->ComF application=%{public}@ remoteIdentifier=%{public}@ len=%lu data=%{private}@", buf, 0x3Au);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000C92C;
  v16[3] = &unk_100045650;
  id v17 = v8;
  id v18 = v10;
  id v14 = v10;
  id v15 = v8;
  [(SPCompanionAppServer *)self sendToRemoteInterface:v9 call:v16];
}

- (void)sendProtoData:(id)a3 toCompanionApplication:(id)a4 fromIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 length];
  id v12 = wk_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(SPCompanionAppServer *)self decodeProtoData:v8];
    *(_DWORD *)buf = 136447490;
    id v20 = "-[SPCompanionAppServer sendProtoData:toCompanionApplication:fromIdentifier:]";
    __int16 v21 = 1024;
    int v22 = 846;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 2048;
    id v28 = v11;
    __int16 v29 = 2114;
    id v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:->ComF application=%{public}@ remoteIdentifier=%{public}@ len=%lu data=%{public}@", buf, 0x3Au);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000CBD8;
  v16[3] = &unk_100045650;
  id v17 = v8;
  id v18 = v10;
  id v14 = v10;
  id v15 = v8;
  [(SPCompanionAppServer *)self sendToRemoteInterface:v9 call:v16];
}

- (void)sendData:(id)a3 toApplication:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = [(__CFString *)v6 length];
  id v9 = wk_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    __int16 v29 = "-[SPCompanionAppServer sendData:toApplication:]";
    CFStringRef v10 = @"...";
    __int16 v30 = 1024;
    int v31 = 858;
    if ((unint64_t)v8 < 0x10) {
      CFStringRef v10 = v6;
    }
    __int16 v32 = 2114;
    id v33 = v7;
    __int16 v34 = 2048;
    id v35 = v8;
    __int16 v36 = 2114;
    CFStringRef v37 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:->ComF application=%{public}@ len=%lu data=%{public}@", buf, 0x30u);
  }

  id v11 = [(SPCompanionAppServer *)self localConnections];
  id v12 = [v11 allKeys];
  id v13 = [v12 copy];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v18);
        id v20 = [(SPCompanionAppServer *)self localConnections];
        __int16 v21 = [v20 objectForKeyedSubscript:v19];

        if (v21)
        {
          int v22 = [v21 remoteObjectProxy];
          [v22 receiveData:v6];
        }
        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }
}

- (void)killExtensionForAppIdentifier:(id)a3
{
  id v10 = a3;
  BOOL v3 = +[SPApplicationManager sharedInstance];
  id v4 = [v3 pluginIdentifierForProtocolIdentifier:v10];

  if (v4)
  {
    id v5 = +[PKHost defaultHost];
    id v6 = [v5 activePlugInForIdentifier:v4];

    if (v6)
    {
      id v7 = [v6 pluginConnection];
      pid_t v8 = [v7 processIdentifier];

      if (v8)
      {
        id v9 = +[SPApplicationManager sharedInstance];
        [v9 setExtension:v10 wasKilledDueToAppDeath:1];

        kill(v8, 9);
      }
    }
  }
}

- (void)fetchInstalledApplicationsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[SPApplicationManager sharedInstance];
  [v4 fetchInstalledApplicationsWithCompletion:v3];
}

- (void)launchSockPuppetAppForCompanionAppWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = wk_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    int v22 = "-[SPCompanionAppServer launchSockPuppetAppForCompanionAppWithIdentifier:options:completion:]";
    __int16 v23 = 1024;
    int v24 = 895;
    __int16 v25 = 2114;
    id v26 = v8;
    __int16 v27 = 2114;
    id v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=\"%{public}@\", options is %{public}@", buf, 0x26u);
  }

  if (qword_1000524F0 != -1) {
    dispatch_once(&qword_1000524F0, &stru_100045670);
  }
  dispatch_time_t v12 = dispatch_time(0, 500000000);
  id v13 = [(SPCompanionAppServer *)self launchSockPuppetAppQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000D3E0;
  v17[3] = &unk_100045698;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_after(v12, v13, v17);
}

- (void)_sockPuppetAppListUpdatedToLaunchSockPuppetAppForCompanionAppWithIdentifier:(id)a3 options:(id)a4 acxRetryGeneration:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = wk_default_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v14)
    {
      *(_DWORD *)buf = 136446722;
      int v24 = "-[SPCompanionAppServer _sockPuppetAppListUpdatedToLaunchSockPuppetAppForCompanionAppWithIdentifier:options:a"
            "cxRetryGeneration:completion:]";
      __int16 v25 = 1024;
      int v26 = 953;
      __int16 v27 = 2114;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=%{public}@", buf, 0x1Cu);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000D974;
    v18[3] = &unk_100045788;
    v18[4] = self;
    unint64_t v22 = a5;
    id v21 = v12;
    id v15 = v10;
    id v19 = v15;
    id v20 = v11;
    id v16 = objc_retainBlock(v18);
    uint64_t v17 = +[ACXDeviceConnection sharedDeviceConnection];
    [v17 fetchApplicationWithContainingApplicationBundleID:v15 completion:v16];
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 136446466;
      int v24 = "-[SPCompanionAppServer _sockPuppetAppListUpdatedToLaunchSockPuppetAppForCompanionAppWithIdentifier:options:a"
            "cxRetryGeneration:completion:]";
      __int16 v25 = 1024;
      int v26 = 950;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier is nil, so got this call after canceling. Nothing to do.", buf, 0x12u);
    }
  }
}

- (void)_cancelLaunchSockPuppetAppTimeout
{
  id v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    launchSockPuppetAppCompanionAppIdentifer = self->_launchSockPuppetAppCompanionAppIdentifer;
    int v11 = 136446722;
    id v12 = "-[SPCompanionAppServer _cancelLaunchSockPuppetAppTimeout]";
    __int16 v13 = 1024;
    int v14 = 1072;
    __int16 v15 = 2114;
    id v16 = launchSockPuppetAppCompanionAppIdentifer;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=\"%{public}@\"", (uint8_t *)&v11, 0x1Cu);
  }

  id v5 = self->_launchSockPuppetAppCompanionAppIdentifer;
  self->_launchSockPuppetAppCompanionAppIdentifer = 0;

  launchSockPuppetAppOptions = self->_launchSockPuppetAppOptions;
  self->_launchSockPuppetAppOptions = 0;

  id launchSockPuppetAppCompletion = self->_launchSockPuppetAppCompletion;
  self->_id launchSockPuppetAppCompletion = 0;

  if (self->_launchSockPuppetCancelLaunchTimer)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.sockpuppet.applications.updated", 0);
    launchSockPuppetCancelLaunchTimer = self->_launchSockPuppetCancelLaunchTimer;
    self->_launchSockPuppetCancelLaunchTimer = 0;
    id v10 = launchSockPuppetCancelLaunchTimer;

    dispatch_source_cancel(v10);
  }
}

- (void)terminateSockPuppetAppForCompanionAppWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = wk_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v21 = "-[SPCompanionAppServer terminateSockPuppetAppForCompanionAppWithIdentifier:completion:]";
    __int16 v22 = 1024;
    int v23 = 1087;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=\"%{public}@\"", buf, 0x1Cu);
  }

  id v9 = [(SPCompanionAppServer *)self processAssertionForXcodeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EA2C;
  block[3] = &unk_1000447A0;
  void block[4] = self;
  dispatch_async(v9, block);

  id v10 = [(SPCompanionAppServer *)self launchSockPuppetAppQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000EA34;
  v18[3] = &unk_1000447A0;
  v18[4] = self;
  dispatch_sync(v10, v18);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000EA3C;
  v15[3] = &unk_1000457B0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  __int16 v13 = objc_retainBlock(v15);
  int v14 = +[ACXDeviceConnection sharedDeviceConnection];
  [v14 fetchApplicationWithContainingApplicationBundleID:v12 completion:v13];
}

- (void)getSockPuppetAppRunningStatusForCompanionAppWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = wk_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v17 = "-[SPCompanionAppServer getSockPuppetAppRunningStatusForCompanionAppWithIdentifier:completion:]";
    __int16 v18 = 1024;
    int v19 = 1134;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=\"%{public}@\"", buf, 0x1Cu);
  }

  id v9 = +[SPApplicationManager sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F0EC;
  v12[3] = &unk_1000457D8;
  id v13 = v6;
  int v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 fetchInstalledApplicationsWithCompletion:v12];
}

- (void)getCompanionExtensionPIDForCompanionAppWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = wk_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v15 = "-[SPCompanionAppServer getCompanionExtensionPIDForCompanionAppWithIdentifier:completion:]";
    __int16 v16 = 1024;
    int v17 = 1157;
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=\"%{public}@\"", buf, 0x1Cu);
  }

  id v8 = +[SPApplicationManager sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F47C;
  v11[3] = &unk_100045800;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 fetchInstalledApplicationsWithCompletion:v11];
}

- (void)xcodeWillInstallSockPuppetAppWithCompanionAppIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, void *))a4;
  if ([v8 length])
  {
    id v6 = +[SPApplicationManager sharedInstance];
    [v6 xcodeWillInstallSockPuppetAppWithCompanionAppID:v8];

    id v7 = 0;
  }
  else
  {
    id v7 = +[SPError errorWithCode:6];
  }
  v5[2](v5, v7);
}

- (void)showUserNotification:(int64_t)a3 applicationName:(id)a4
{
  v10[0] = @"ns";
  v9[0] = @"c";
  v9[1] = @"nt";
  id v6 = a4;
  id v7 = +[NSNumber numberWithInteger:a3];
  v9[2] = @"n";
  v10[1] = v7;
  v10[2] = v6;
  id v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  [(SPCompanionAppServer *)self sendPlist:v8 securityType:1];
}

- (void)hideUserNotification
{
  CFStringRef v4 = @"c";
  CFStringRef v5 = @"nh";
  id v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  [(SPCompanionAppServer *)self sendPlist:v3 securityType:1];
}

- (void)wakeExtensionForWatchApp:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446978;
    id v7 = "-[SPCompanionAppServer wakeExtensionForWatchApp:]";
    __int16 v8 = 1024;
    int v9 = 1202;
    __int16 v10 = 2114;
    id v11 = v4;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: called for %{public}@. This should be done sparingly. If you're seeing this very often, please write a radar against the app that owns %{public}@", (uint8_t *)&v6, 0x26u);
  }

  [(SPCompanionAppServer *)self sendToRemoteInterface:v4 call:&stru_100045840];
}

- (void)extensionWithIdentifier:(id)a3 gotUnknownInterfaceController:(id)a4
{
  v9[0] = @"c";
  v9[1] = @"i";
  v10[0] = @"uIC";
  v10[1] = a3;
  v9[2] = @"IC";
  v10[2] = a4;
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  [(SPCompanionAppServer *)self sendPlist:v8 securityType:0];
}

- (void)sendData:(id)a3 identifier:(id)a4 clientIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 length];
  __int16 v12 = wk_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(SPCompanionAppServer *)self logStringArray:v10];
    int v14 = [(SPCompanionAppServer *)self decodeInData:v8];
    int v17 = 136447491;
    __int16 v18 = "-[SPCompanionAppServer sendData:identifier:clientIdentifiers:]";
    __int16 v19 = 1024;
    int v20 = 1224;
    __int16 v21 = 2114;
    id v22 = v9;
    __int16 v23 = 2114;
    __int16 v24 = v13;
    __int16 v25 = 2048;
    id v26 = v11;
    __int16 v27 = 2113;
    id v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ComD:<-ComF extension=%{public}@, clients: %{public}@, data len=%lu, data=%{private}@", (uint8_t *)&v17, 0x3Au);
  }
  id v15 = +[NSMutableDictionary dictionaryWithCapacity:0];
  __int16 v16 = v15;
  if (v9) {
    [v15 setObject:v9 forKey:@"i"];
  }
  if (v8) {
    [v16 setObject:v8 forKey:@"d"];
  }
  if (v10) {
    [v16 setObject:v10 forKey:@"ci"];
  }
  [(SPCompanionAppServer *)self sendPlist:v16 securityType:0];
}

- (void)sendData:(id)a3 identifier:(id)a4 clientIdentifiers:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6)
  {
    int v14 = wk_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002A3C8(a2, v14);
    }
  }
  [(SPCompanionAppServer *)self sendData:v11 identifier:v12 clientIdentifiers:v13];
}

- (void)sendCacheRequest:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = +[SPIDSProtobuf cacheRequestWithProtoData:a3 identifier:v6];
  [(SPCompanionAppServer *)self sendProtobuf:v7 sender:v6 timeOut:0 securityType:60.0];
}

- (void)requestTimingData:(id)a3 timingMetaData:(id)a4
{
  id v6 = a3;
  id v7 = [a4 mutableCopy];
  timingTest_queue = self->_timingTest_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FF88;
  block[3] = &unk_1000447C8;
  id v9 = v7;
  id v14 = v9;
  id v15 = self;
  dispatch_sync((dispatch_queue_t)timingTest_queue, block);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100010078;
  v11[3] = &unk_100045868;
  id v12 = v9;
  id v10 = v9;
  [(SPCompanionAppServer *)self sendToRemoteInterface:v6 call:v11];
}

- (void)fetchNotificationForNotificationID:(id)a3 completion:(id)a4
{
  id v4 = a4;
  CFStringRef v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10002A470();
  }

  id v6 = +[SPError errorWithCode:28];
  (*((void (**)(id, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, v6);
}

- (void)incomingProtobuf:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [SPProtoSockPuppetIDSObject alloc];
  id v6 = [v4 data];

  id v10 = [(SPProtoSockPuppetIDSObject *)v5 initWithData:v6];
  unsigned int v7 = [(SPProtoSockPuppetIDSObject *)v10 type];
  if (v7 == 3)
  {
    [(SPCompanionAppServer *)self handleIncomingProtoPlist:v10];
  }
  else if (v7 == 2)
  {
    id v8 = [(SPProtoSockPuppetIDSObject *)v10 objectData];
    id v9 = [(SPProtoSockPuppetIDSObject *)v10 receiver];
    [(SPCompanionAppServer *)self sendProtoData:v8 toCompanionApplication:v9 fromIdentifier:0];
  }
}

- (void)handleIncomingProtoPlist:(id)a3
{
  id v4 = a3;
  [(SPCompanionAppServer *)self _saveReceiveTime];
  CFStringRef v5 = [SPProtoSockPuppetPlist alloc];
  id v6 = [v4 objectData];
  unsigned int v7 = [(SPProtoSockPuppetPlist *)v5 initWithData:v6];

  if (v7)
  {
    id v8 = +[SPProtoSerializer dictionaryWithSPPlist:v7];
    if (v8)
    {
      id v9 = [(SPCompanionAppServer *)self appBundleIDFromPlist:v8];
      id v10 = [(SPCompanionAppServer *)self usageTrack];
      id v11 = [v4 objectData];
      objc_msgSend(v10, "dataReceiedFromGizmo:application:", objc_msgSend(v11, "length"), v9);

      v16[0] = @"action";
      v16[1] = @"application";
      v17[0] = @"incomingData";
      v17[1] = v9;
      v16[2] = @"length";
      id v12 = [v4 objectData];
      id v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 length]);
      v17[2] = v13;
      id v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

      id v15 = +[SPPowerLog sharedInstance];
      [v15 logEvent:v14 withName:@"SP-transport"];

      [(SPCompanionAppServer *)self handleIncomingPlist:v8];
    }
    else
    {
      id v9 = wk_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002A570();
      }
    }
  }
  else
  {
    id v8 = wk_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002A4F0();
    }
  }
}

- (void)_saveSendTimeAndSize:(unint64_t)a3
{
  +[NSDate timeIntervalSinceReferenceDate];
  timingTest_queue = self->_timingTest_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000104D0;
  block[3] = &unk_100045890;
  void block[4] = self;
  void block[5] = v6;
  block[6] = a3;
  dispatch_async((dispatch_queue_t)timingTest_queue, block);
}

- (void)_saveReceiveTime
{
  +[NSDate timeIntervalSinceReferenceDate];
  timingTest_queue = self->_timingTest_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000105BC;
  v5[3] = &unk_1000458B8;
  v5[4] = self;
  v5[5] = v4;
  dispatch_async((dispatch_queue_t)timingTest_queue, v5);
}

- (void)incomingData:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  [(SPCompanionAppServer *)self _saveReceiveTime];
  [(SPCompanionAppServer *)self handleIncomingData:v4];
}

- (void)handleIncomingData:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  CFStringRef v5 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v14];
  id v6 = v14;
  unsigned int v7 = wk_default_log();
  id v8 = v7;
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002A66C(self, (uint64_t)v5, v8);
    }

    id v8 = [(SPCompanionAppServer *)self appBundleIDFromPlist:v5];
    id v10 = [(SPCompanionAppServer *)self usageTrack];
    objc_msgSend(v10, "dataReceiedFromGizmo:application:", objc_msgSend(v4, "length"), v8);

    v15[0] = @"action";
    v15[1] = @"application";
    v16[0] = @"incomingData";
    v16[1] = v8;
    v15[2] = @"length";
    id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 length]);
    v16[2] = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

    id v13 = +[SPPowerLog sharedInstance];
    [v13 logEvent:v12 withName:@"SP-transport"];

    [(SPCompanionAppServer *)self handleIncomingPlist:v5];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_10002A5F0();
  }
}

- (id)appBundleIDFromPlist:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"i"];
  if (!v3) {
    id v3 = @"com.apple.companionappd";
  }

  return v3;
}

- (void)handleIncomingPlist:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"i"];
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = @"companionappd";
  }
  unsigned int v7 = [v4 objectForKeyedSubscript:@"c"];
  id v8 = [v4 objectForKeyedSubscript:@"ci"];
  if (![v7 length])
  {
    id v12 = [v4 objectForKeyedSubscript:@"p"];

    if (v12)
    {
      id v13 = [v4 objectForKeyedSubscript:@"p"];
      [(SPCompanionAppServer *)self sendProtoData:v13 toCompanionApplication:v6 fromIdentifier:v8];
    }
    else
    {
      id v13 = [v4 objectForKeyedSubscript:@"d"];
      [(SPCompanionAppServer *)self sendData:v13 toCompanionApplication:v6 fromIdentifier:v8];
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100011E44;
    v32[3] = &unk_100045560;
    v32[4] = self;
    id v33 = (__CFString *)v4;
    __int16 v34 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v32);

    id v11 = v33;
    goto LABEL_17;
  }
  if ([v7 isEqualToString:@"at"])
  {
    BOOL v9 = [(SPCompanionAppServer *)self processAssertionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000115A8;
    block[3] = &unk_1000447C8;
    void block[4] = self;
    id v10 = v6;
    v58 = v10;
    dispatch_async(v9, block);

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000115B4;
    v55[3] = &unk_100045868;
    id v56 = v8;
    [(SPCompanionAppServer *)self sendToRemoteInterface:v10 call:v55];

    id v11 = v58;
LABEL_17:

    goto LABEL_18;
  }
  if ([v7 isEqualToString:@"ak"])
  {
    id v14 = wk_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v60 = "-[SPCompanionAppServer handleIncomingPlist:]";
      __int16 v61 = 1024;
      int v62 = 1412;
      __int16 v63 = 2114;
      CFStringRef v64 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: App %{public}@ was killed on the gizmo. Killing extension.", buf, 0x1Cu);
    }

    [(SPCompanionAppServer *)self killExtensionForAppIdentifier:v6];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:@"r"])
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100011690;
    v53[3] = &unk_100045868;
    v54 = v8;
    [(SPCompanionAppServer *)self sendToRemoteInterface:v6 call:v53];
    id v11 = v54;
    goto LABEL_17;
  }
  if ([v7 isEqualToString:@"l"])
  {
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10001176C;
    v51[3] = &unk_100045868;
    CFStringRef v52 = v8;
    [(SPCompanionAppServer *)self sendToRemoteInterface:v6 call:v51];
    id v11 = v52;
    goto LABEL_17;
  }
  if ([v7 isEqualToString:@"a"])
  {
    [(SPCompanionAppServer *)self _applicationActivated:v6];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100011848;
    v49[3] = &unk_100045868;
    objc_super v50 = v8;
    [(SPCompanionAppServer *)self sendToRemoteInterface:v6 call:v49];
    [(SPCompanionAppServer *)self _sendTextSizeToApplication:v6 onlyIfChanged:0];
    id v11 = v50;
    goto LABEL_17;
  }
  if ([v7 isEqualToString:@"d"])
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100011924;
    v45[3] = &unk_1000458E0;
    v46 = v8;
    v47 = self;
    v48 = v6;
    [(SPCompanionAppServer *)self sendToRemoteInterface:v48 call:v45];

    id v11 = v46;
    goto LABEL_17;
  }
  if ([v7 isEqualToString:@"FS"])
  {
    id v15 = wk_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v60 = "-[SPCompanionAppServer handleIncomingPlist:]";
      __int16 v61 = 1024;
      int v62 = 1438;
      __int16 v63 = 2114;
      CFStringRef v64 = v6;
      __int16 v16 = "%{public}s:%d: Application %{public}@ did enter foreground suspended";
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x1Cu);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if ([v7 isEqualToString:@"fS"])
  {
    id v15 = wk_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v60 = "-[SPCompanionAppServer handleIncomingPlist:]";
      __int16 v61 = 1024;
      int v62 = 1440;
      __int16 v63 = 2114;
      CFStringRef v64 = v6;
      __int16 v16 = "%{public}s:%d: Application %{public}@ did fully suspend";
      goto LABEL_31;
    }
LABEL_32:

    goto LABEL_18;
  }
  if ([v7 isEqualToString:@"ac"])
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100011A08;
    v43[3] = &unk_100045868;
    unsigned int v44 = v8;
    [(SPCompanionAppServer *)self sendToRemoteInterface:v6 call:v43];
    id v11 = v44;
    goto LABEL_17;
  }
  if ([v7 isEqualToString:@"dc"])
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100011AE4;
    v41[3] = &unk_100045868;
    v42 = v8;
    [(SPCompanionAppServer *)self sendToRemoteInterface:v6 call:v41];
    id v11 = v42;
    goto LABEL_17;
  }
  if ([v7 isEqualToString:@"lg"])
  {
    int v17 = [v4 objectForKeyedSubscript:@"tid"];
    id v15 = [(SPCompanionAppServer *)self transactionDictForID:v17 removeFromOutstanding:1];

    uint64_t v18 = [v15 objectForKeyedSubscript:@"completion"];
    if (!v18)
    {
LABEL_44:

      goto LABEL_32;
    }
    __int16 v19 = [v4 objectForKeyedSubscript:@"d"];
    if ([v19 code])
    {
      int v20 = [v19 domain];
      unsigned int v21 = [v20 isEqualToString:@"com.apple.watchkit.errors"];

      if (v21)
      {
        uint64_t v22 = +[SPError errorWithCode:](SPError, "errorWithCode:", [v19 code]);

        __int16 v19 = (void *)v22;
      }
    }
    (*(void (**)(uint64_t, BOOL, void *))(v18 + 16))(v18, [v19 code] == 0, v19);
LABEL_43:

    goto LABEL_44;
  }
  if ([v7 isEqualToString:@"kg"])
  {
    __int16 v23 = [v4 objectForKeyedSubscript:@"tid"];
    id v15 = [(SPCompanionAppServer *)self transactionDictForID:v23 removeFromOutstanding:1];

    uint64_t v18 = [v15 objectForKeyedSubscript:@"completion"];
    if (!v18) {
      goto LABEL_44;
    }
    __int16 v24 = [v4 objectForKeyedSubscript:@"d"];
    unsigned int v25 = [v24 BOOLValue];

    if (v25)
    {
      (*(void (**)(uint64_t, void))(v18 + 16))(v18, 0);
      goto LABEL_44;
    }
    __int16 v19 = +[SPError errorWithCode:9];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
    goto LABEL_43;
  }
  if ([v7 isEqualToString:@"gs"])
  {
    id v26 = [v4 objectForKeyedSubscript:@"tid"];
    id v15 = [(SPCompanionAppServer *)self transactionDictForID:v26 removeFromOutstanding:1];

    uint64_t v18 = [v15 objectForKeyedSubscript:@"completion"];
    if (v18)
    {
      __int16 v27 = [v4 objectForKeyedSubscript:@"d"];
      id v28 = [v27 BOOLValue];

      (*(void (**)(uint64_t, void, id))(v18 + 16))(v18, 0, v28);
    }
    goto LABEL_44;
  }
  if ([v7 isEqualToString:@"cds"])
  {
    id v15 = +[SPApplicationManager sharedInstance];
    [v15 updateCoreDuetSession:v4];
    goto LABEL_32;
  }
  if ([v7 isEqualToString:@"pr"])
  {
    [(SPCompanionAppServer *)self sendFirstUnlockStatusToGizmo];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:@"slk"])
  {
    id v15 = [v4 objectForKeyedSubscript:@"slm"];
    uint64_t v18 = wk_default_log();
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
      sub_10002A724();
    }
    goto LABEL_44;
  }
  if ([v7 isEqualToString:@"P"])
  {
    [(SPCompanionAppServer *)self sendToRemoteInterface:v6 call:&stru_100045900];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:@"sac"])
  {
    id v15 = wk_default_log();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"activeComplications"];
    *(_DWORD *)buf = 136446978;
    v60 = "-[SPCompanionAppServer handleIncomingPlist:]";
    __int16 v61 = 1024;
    int v62 = 1492;
    __int16 v63 = 2114;
    CFStringRef v64 = @"NativeComplications";
    __int16 v65 = 2114;
    uint64_t v66 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: %{public}@ received sockpuppet message that active complications changed with bundleIDs%{public}@", buf, 0x26u);
    goto LABEL_44;
  }
  if ([v7 isEqualToString:@"Ht"])
  {
    __int16 v29 = +[SPApplicationManager sharedInstance];
    __int16 v30 = [v29 pluginIdentifierForProtocolIdentifier:v6];

    [(SPCompanionAppServer *)self extensionDidBeginSnapshot:v30];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100011C8C;
    v35[3] = &unk_100045928;
    id v36 = v4;
    CFStringRef v37 = v6;
    id v38 = v8;
    __int16 v39 = self;
    id v40 = v30;
    id v31 = v30;
    [(SPCompanionAppServer *)self sendToRemoteInterface:v37 call:v35];
  }
LABEL_18:
}

- (void)_applicationActivated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSString *)[objc_alloc((Class)NSString) initWithString:v4];

  activeApplication = self->_activeApplication;
  self->_activeApplication = v5;
}

- (void)_applicationDeactivated:(id)a3
{
  id v4 = a3;
  activeApplication = self->_activeApplication;
  self->_activeApplication = 0;

  id v6 = [(SPCompanionAppServer *)self processAssertionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000120B4;
  block[3] = &unk_1000447C8;
  void block[4] = self;
  id v7 = v4;
  id v14 = v7;
  dispatch_async(v6, block);

  id v8 = +[SPApplicationManager sharedInstance];
  BOOL v9 = [v8 pluginIdentifierForProtocolIdentifier:v7];

  if (![(SPCompanionAppServer *)self isExtensionDoingSnapshot:v9])
  {
    dispatch_time_t v10 = dispatch_time(0, 500000000);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000120C0;
    v11[3] = &unk_1000447C8;
    void v11[4] = self;
    id v12 = v9;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

- (void)releaseProcessAssertion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(BKSProcessAssertion *)self->_processAssertion name];
    *(_DWORD *)buf = 136446978;
    uint64_t v18 = "-[SPCompanionAppServer releaseProcessAssertion:]";
    __int16 v19 = 1024;
    int v20 = 1547;
    __int16 v21 = 2114;
    id v22 = v4;
    __int16 v23 = 2114;
    __int16 v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: releaseProcessAssertion for application %{public}@, current assertion:%{public}@", buf, 0x26u);
  }
  id v7 = [(BKSProcessAssertion *)self->_processAssertion name];
  unsigned int v8 = [v7 isEqualToString:v4];

  if (v8 && !self->_activeApplication)
  {
    BOOL v9 = +[SPApplicationManager sharedInstance];
    dispatch_time_t v10 = [v9 pluginIdentifierForProtocolIdentifier:v4];

    id v11 = self->_processAssertion;
    id v12 = +[SPApplicationManager sharedInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000122BC;
    void v15[3] = &unk_1000447A0;
    __int16 v16 = v11;
    id v13 = v11;
    [v12 notifyInactiveForPluginWithIdentifier:v10 completion:v15];

    processAssertion = self->_processAssertion;
    self->_processAssertion = 0;
  }
}

- (void)setApplicationIDForXcodeProcessAssertion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v16 = "-[SPCompanionAppServer setApplicationIDForXcodeProcessAssertion:]";
    __int16 v17 = 1024;
    int v18 = 1565;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: application %{public}@", buf, 0x1Cu);
  }

  id v6 = +[SPApplicationManager sharedInstance];
  id v7 = [v6 pluginIdentifierForProtocolIdentifier:v4];

  unsigned int v8 = +[SPApplicationManager sharedInstance];
  [v8 setCurrentXcodeControlledPlugin:v7];

  objc_initWeak((id *)buf, self);
  BOOL v9 = +[SPApplicationManager sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000124C4;
  v11[3] = &unk_100045978;
  id v10 = v7;
  id v12 = v10;
  id v13 = self;
  objc_copyWeak(&v14, (id *)buf);
  [v9 waitForPreviousPluginToFinishEnding:v10 toComplete:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)takeProcessAssertionForXcode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(BKSProcessAssertion *)self->_processAssertionForXcode name];
    *(_DWORD *)buf = 136446978;
    __int16 v17 = "-[SPCompanionAppServer takeProcessAssertionForXcode:]";
    __int16 v18 = 1024;
    int v19 = 1589;
    __int16 v20 = 2114;
    id v21 = v4;
    __int16 v22 = 2114;
    __int16 v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: pluginIdentifier %{public}@, current assertion:%{public}@", buf, 0x26u);
  }
  id v7 = [(BKSProcessAssertion *)self->_processAssertionForXcode name];
  unsigned __int8 v8 = [v7 isEqualToString:v4];

  if ((v8 & 1) == 0)
  {
    [(BKSProcessAssertion *)self->_processAssertionForXcode invalidate];
    processAssertionForXcode = self->_processAssertionForXcode;
    self->_processAssertionForXcode = 0;

    if (v4)
    {
      objc_initWeak((id *)buf, self);
      id v10 = +[SPApplicationManager sharedInstance];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001292C;
      v12[3] = &unk_100045978;
      id v13 = v4;
      id v14 = self;
      objc_copyWeak(&v15, (id *)buf);
      [v10 waitForPreviousPluginToFinishEnding:v13 toComplete:v12];

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v11 = wk_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10002A7A0();
      }
    }
  }
}

- (void)releaseProcessAssertionForXcode
{
  id v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(BKSProcessAssertion *)self->_processAssertionForXcode name];
    *(_DWORD *)buf = 136446722;
    BOOL v9 = "-[SPCompanionAppServer releaseProcessAssertionForXcode]";
    __int16 v10 = 1024;
    int v11 = 1654;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: current assertion:%{public}@", buf, 0x1Cu);
  }
  [(SPCompanionAppServer *)self setPlugInIdentifierForXcodeProcessAssertion:0];
  uint64_t v5 = +[SPApplicationManager sharedInstance];
  [v5 setCurrentXcodeControlledPlugin:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013230;
  block[3] = &unk_1000447A0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  [(BKSProcessAssertion *)self->_processAssertionForXcode invalidate];
  processAssertionForXcode = self->_processAssertionForXcode;
  self->_processAssertionForXcode = 0;
}

- (void)releaseRemoteInterfaceAssertionsForPluginIdentifer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SPCompanionAppServer *)self remoteInterfaceProcessAssertionsQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013408;
  void v7[3] = &unk_1000447C8;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (BOOL)showUserNotificationWithTitle:(id)a3 message:(id)a4
{
  v13[0] = kCFUserNotificationAlertHeaderKey;
  v13[1] = kCFUserNotificationAlertMessageKey;
  v14[0] = a3;
  v14[1] = a4;
  v13[2] = kCFUserNotificationAlertTopMostKey;
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSNumber numberWithBool:1];
  v13[3] = kCFUserNotificationAlternateButtonTitleKey;
  v14[2] = v7;
  v14[3] = @"Cancel";
  CFDictionaryRef v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  BOOL v9 = CFUserNotificationCreate(kCFAllocatorDefault, 30.0, 0, 0, v8);
  __int16 v10 = v9;
  if (v9)
  {
    CFOptionFlags v12 = 0;
    CFUserNotificationReceiveResponse(v9, 0.0, &v12);
    CFRelease(v10);
    LOBYTE(v10) = (v12 & 3) == 0;
  }

  return (char)v10;
}

- (void)nanoRegistryChanged:(id)a3
{
  [(SPCompanionAppServer *)self setPaired:[(SPCompanionAppServer *)self isPaired]];
  id v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    id v6 = "-[SPCompanionAppServer nanoRegistryChanged:]";
    __int16 v7 = 1024;
    int v8 = 1720;
    __int16 v9 = 1024;
    unsigned int v10 = [(SPCompanionAppServer *)self paired];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: nanoRegistryChanged, paired: %d", (uint8_t *)&v5, 0x18u);
  }
}

- (BOOL)isPaired
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned __int8 v3 = [v2 isPaired];

  return v3;
}

- (void)sendAndTrackTransactionDict:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(SPCompanionAppServer *)self transactionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013984;
  block[3] = &unk_100045560;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)transactionDictForID:(id)a3 removeFromOutstanding:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = sub_100013DEC;
  int v19 = sub_100013DFC;
  id v20 = 0;
  id v7 = [(SPCompanionAppServer *)self transactionQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100013E04;
  v11[3] = &unk_100045A40;
  id v12 = v6;
  id v13 = &v15;
  void v11[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(v7, v11);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)decodeProtoData:(id)a3
{
  id v3 = a3;
  id v4 = wk_default_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    id v6 = +[SPProtoSerializer objectWithData:v3];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"image cache message, %ld ", (int)[v6 messageType]);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = wk_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10002AA3C();
      }

      id v7 = @"can't decode data";
    }
  }
  else
  {
    id v7 = &stru_100049900;
  }

  return v7;
}

- (id)decodeOutData:(id)a3
{
  id v3 = a3;
  id v4 = wk_default_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (!v5)
  {
    id v13 = &stru_100049900;
    goto LABEL_54;
  }
  id v6 = [[SPProtoSockPuppetPlist alloc] initWithData:v3];
  if (v6)
  {
    id v7 = +[SPProtoSerializer dictionaryWithSPPlist:v6];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 objectForKeyedSubscript:@"V"];
      if (v9)
      {
        id v10 = [v8 objectForKeyedSubscript:@"!"];
        int v11 = v10;
        if (v10)
        {
          if ([v10 isEqualToString:@"C"])
          {
            id v12 = [v8 objectForKeyedSubscript:@"K"];
            +[NSString stringWithFormat:@"create vc: %@, %@", v12, v9];
LABEL_27:
            id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_51:
            goto LABEL_52;
          }
          if ([v11 isEqualToString:@"R"])
          {
            +[NSString stringWithFormat:@"release vc: %@", v9];
LABEL_50:
            id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_51;
          }
          if ([v11 isEqualToString:@"A"])
          {
            +[NSString stringWithFormat:@"activate vc: %@", v9];
            goto LABEL_50;
          }
          if ([v11 isEqualToString:@"D"])
          {
            +[NSString stringWithFormat:@"deactivate vc: %@", v9];
            goto LABEL_50;
          }
          if ([v11 isEqualToString:@"N"])
          {
            +[NSString stringWithFormat:@"nav reply vc: %@", v9];
            goto LABEL_50;
          }
          if ([v11 isEqualToString:@"an"])
          {
            id v12 = [v8 objectForKeyedSubscript:@"ni"];
            +[NSString stringWithFormat:@"notificationid: %@, vc: %@", v12, v9];
            goto LABEL_27;
          }
          if ([v11 isEqualToString:@"aua"])
          {
            +[NSString stringWithFormat:@"continuity vc: %@", v9];
            goto LABEL_50;
          }
        }
        else
        {
          uint64_t v17 = [v8 objectForKeyedSubscript:@"a"];
          if (v17)
          {
            id v12 = (void *)v17;
            +[NSString stringWithFormat:@"action: %@, vc: %@", v17, v9];
            goto LABEL_27;
          }
          uint64_t v19 = [v8 objectForKeyedSubscript:@"k"];
          if (v19)
          {
            id v12 = (void *)v19;
            +[NSString stringWithFormat:@"set value vc: %@", v9, v28];
            goto LABEL_27;
          }
        }

        goto LABEL_44;
      }
      uint64_t v15 = [v8 objectForKeyedSubscript:@"tI"];

      if (v15)
      {
        CFStringRef v16 = @"text input";
      }
      else
      {
        __int16 v18 = [v8 objectForKeyedSubscript:@"mpcd"];

        if (v18)
        {
          CFStringRef v16 = @"media player";
        }
        else
        {
          id v20 = [v8 objectForKeyedSubscript:@"arcd"];

          if (v20)
          {
            CFStringRef v16 = @"audio recorder";
          }
          else
          {
            id v21 = [v8 objectForKeyedSubscript:@"lm"];

            if (v21)
            {
              CFStringRef v16 = @"log message";
            }
            else
            {
              __int16 v22 = [v8 objectForKeyedSubscript:@"T"];

              if (v22)
              {
                __int16 v23 = [v8 objectForKeyedSubscript:@"atu"];
                id v13 = +[NSString stringWithFormat:@"tapped alert action: %@", v23];

                goto LABEL_52;
              }
              __int16 v24 = [v8 objectForKeyedSubscript:@"pkf"];

              if (!v24)
              {
                unsigned int v25 = [v8 objectForKeyedSubscript:@"cc"];

                if (v25
                  || ([v8 objectForKeyedSubscript:@"cd"],
                      id v26 = objc_claimAutoreleasedReturnValue(),
                      v26,
                      v26))
                {
                  int v11 = [v8 objectForKeyedSubscript:@"cc"];
                  +[NSString stringWithFormat:@"complication reply for: %@", v11];
                  goto LABEL_50;
                }
LABEL_44:
                id v13 = @"can't decode data";
                goto LABEL_52;
              }
              CFStringRef v16 = @"add passes finished";
            }
          }
        }
      }
      id v13 = +[NSString stringWithFormat:v16];
LABEL_52:

      goto LABEL_53;
    }
    BOOL v14 = wk_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002AB3C();
    }
  }
  else
  {
    id v8 = wk_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002AABC();
    }
  }
  id v13 = @"can't decode data";
LABEL_53:

LABEL_54:

  return v13;
}

- (id)decodeInData:(id)a3
{
  id v3 = a3;
  id v4 = wk_default_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    id v6 = [[SPProtoSockPuppetPlist alloc] initWithData:v3];
    if (v6)
    {
      id v7 = +[SPProtoSerializer dictionaryWithSPPlist:v6];
      id v8 = v7;
      if (v7)
      {
        id v9 = [v7 allKeys];
        id v10 = +[NSMutableString stringWithString:@"keys:"];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v11 = v9;
        id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              [(__CFString *)v10 appendFormat:@" %@,", *(void *)(*((void *)&v17 + 1) + 8 * i)];
            }
            id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v13);
        }
      }
      else
      {
        id v10 = @"can't decode data";
      }
    }
    else
    {
      id v10 = @"can't decode data";
    }
  }
  else
  {
    id v10 = &stru_100049900;
  }

  return v10;
}

- (id)logDictionary:(id)a3
{
  id v3 = a3;
  id v4 = wk_default_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    id v6 = [v3 allKeys];
    id v7 = +[NSMutableString stringWithString:@"keys:"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v6;
    id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v8) {
      goto LABEL_19;
    }
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (1)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v12 isEqualToString:@"d"])
        {
          id v13 = [v3 objectForKeyedSubscript:v12];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = [v13 length];
            uint64_t v15 = [(SPCompanionAppServer *)self decodeOutData:v13];
            [(__CFString *)v7 appendFormat:@" data, len: %lu, %@", v14, v15];
LABEL_15:

            goto LABEL_17;
          }
        }
        else
        {
          if ([v12 isEqualToString:@"p"])
          {
            id v13 = [v3 objectForKeyedSubscript:v12];
            -[__CFString appendFormat:](v7, "appendFormat:", @"proto data, len: %lu", [v13 length], v18);
            goto LABEL_17;
          }
          unsigned int v16 = [v12 isEqualToString:@"ci"];
          id v13 = [v3 objectForKeyedSubscript:v12];
          if (v16)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = [(SPCompanionAppServer *)self logStringArray:v13];
              [(__CFString *)v7 appendFormat:@" %@: %@,", v12, v15];
              goto LABEL_15;
            }
          }
        }
        [(__CFString *)v7 appendFormat:@" %@: %@,", v12, v13];
LABEL_17:
      }
      id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v9)
      {
LABEL_19:

        goto LABEL_21;
      }
    }
  }
  id v7 = &stru_100049900;
LABEL_21:

  return v7;
}

- (id)logStringArray:(id)a3
{
  id v3 = a3;
  id v4 = wk_default_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    id v6 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    id v6 = &stru_100049900;
  }

  return v6;
}

- (void)extensionDidBeginSnapshot:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    extensionsDoingSnapshotQueue = self->_extensionsDoingSnapshotQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014CDC;
    block[3] = &unk_1000447C8;
    void block[4] = self;
    id v7 = v4;
    id v13 = v7;
    dispatch_barrier_sync((dispatch_queue_t)extensionsDoingSnapshotQueue, block);
    dispatch_time_t v8 = dispatch_time(0, 25000000000);
    id v9 = self->_extensionsDoingSnapshotQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100014E00;
    void v10[3] = &unk_1000447C8;
    v10[4] = self;
    id v11 = v7;
    dispatch_after(v8, (dispatch_queue_t)v9, v10);
  }
}

- (void)extensionDidEndSnapshot:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    extensionsDoingSnapshotQueue = self->_extensionsDoingSnapshotQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100014FD4;
    void v7[3] = &unk_1000447C8;
    void v7[4] = self;
    id v8 = v4;
    dispatch_barrier_sync((dispatch_queue_t)extensionsDoingSnapshotQueue, v7);
  }
}

- (BOOL)isExtensionDoingSnapshot:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    extensionsDoingSnapshotQueue = self->_extensionsDoingSnapshotQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015218;
    block[3] = &unk_100045A68;
    id v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync((dispatch_queue_t)extensionsDoingSnapshotQueue, block);
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_textSizeChanged
{
  id v2 = [(SPCompanionAppServer *)self _textSize];
  id v3 = v2;
  if (qword_1000524F8 && !objc_msgSend(v2, "compare:"))
  {
    id v4 = 0;
  }
  else
  {
    objc_storeStrong((id *)&qword_1000524F8, v3);
    id v4 = (id)qword_1000524F8;
  }

  return v4;
}

- (id)_textSize
{
  if (qword_100052508 != -1) {
    dispatch_once(&qword_100052508, &stru_100045A88);
  }
  id v2 = [(id)qword_100052500 synchronize];
  id v3 = [(id)qword_100052500 objectForKey:@"UIPreferredContentSizeCategoryName"];
  if (!v3) {
    id v3 = UIContentSizeCategorySmall;
  }

  return v3;
}

- (void)_sendTextSizeToApplication:(id)a3 onlyIfChanged:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015478;
  block[3] = &unk_100045AB0;
  BOOL v7 = a4;
  void block[4] = self;
  id v6 = a3;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_isApplicationViewControllerActivate:(id)a3
{
  id v3 = a3;
  id v4 = [[SPProtoSockPuppetPlist alloc] initWithData:v3];

  if (!v4)
  {
    id v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002ACD8();
    }
    goto LABEL_12;
  }
  BOOL v5 = +[SPProtoSerializer dictionaryWithSPPlist:v4];
  id v6 = v5;
  if (!v5)
  {
    BOOL v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002AD58();
    }
LABEL_11:

LABEL_12:
    LOBYTE(v7) = 0;
    goto LABEL_13;
  }
  BOOL v7 = [v5 objectForKeyedSubscript:@"V"];

  if (v7)
  {
    id v8 = [v6 objectForKeyedSubscript:@"!"];
    BOOL v7 = v8;
    if (v8 && ([v8 isEqualToString:@"A"] & 1) != 0)
    {

      LOBYTE(v7) = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
LABEL_13:

  return (char)v7;
}

- (void)activeComplicationsWithCompletion:(id)a3
{
  if (a3)
  {
    id v3 = (void (**)(id, id))a3;
    id v4 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.sockpuppet.activeComplications"];
    id v5 = [v4 synchronize];
    id v6 = [v4 arrayForKey:@"activeComplications"];
    id v7 = [v6 copy];

    id v8 = wk_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136447234;
      id v10 = "-[SPCompanionAppServer activeComplicationsWithCompletion:]";
      __int16 v11 = 1024;
      int v12 = 2097;
      __int16 v13 = 2114;
      CFStringRef v14 = @"NativeComplications";
      __int16 v15 = 2114;
      CFStringRef v16 = @"com.apple.sockpuppet.activeComplications";
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: %{public}@ fetching domain %{public}@ returned bundleIDs %{public}@", (uint8_t *)&v9, 0x30u);
    }

    v3[2](v3, v7);
  }
}

- (id)applicationIdentifierFromXPCConnection:(id)a3
{
  id v3 = a3;
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
    id v6 = v5;
    CFErrorRef error = 0;
    id v7 = (void *)SecTaskCopyValueForEntitlement(v5, @"application-identifier", &error);
    if (error) {
      CFRelease(error);
    }
    CFRelease(v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)connection:(id)a3 hasEntitlement:(id)a4
{
  id v5 = a3;
  id v6 = (__CFString *)a4;
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  id v7 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (v7)
  {
    id v8 = v7;
    CFErrorRef error = 0;
    int v9 = SecTaskCopyValueForEntitlement(v7, v6, &error);
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v10 = [v9 BOOLValue];
    }
    else {
      unsigned __int8 v10 = 0;
    }
    if (error) {
      CFRelease(error);
    }
    CFRelease(v8);
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queueRemote
{
  return self->_queueRemote;
}

- (void)setQueueRemote:(id)a3
{
}

- (OS_dispatch_source)gizmoApplicationsUpdateTimer
{
  return self->_gizmoApplicationsUpdateTimer;
}

- (void)setGizmoApplicationsUpdateTimer:(id)a3
{
}

- (NSXPCListener)localListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalListener:(id)a3
{
}

- (NSMutableDictionary)localConnections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalConnections:(id)a3
{
}

- (BOOL)paired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (NRDevice)pairedDevice
{
  return self->_pairedDevice;
}

- (void)setPairedDevice:(id)a3
{
}

- (OS_dispatch_queue)transactionQueue
{
  return self->_transactionQueue;
}

- (void)setTransactionQueue:(id)a3
{
}

- (NSMutableDictionary)outstandingtransactions
{
  return self->_outstandingtransactions;
}

- (void)setOutstandingtransactions:(id)a3
{
}

- (unsigned)nextTransactionID
{
  return self->_nextTransactionID;
}

- (void)setNextTransactionID:(unsigned int)a3
{
  self->_nextTransactionID = a3;
}

- (SPUsageTrack)usageTrack
{
  return self->_usageTrack;
}

- (void)setUsageTrack:(id)a3
{
}

- (NSMutableDictionary)dateOfFirstAttemptToLaunchGizmoAppsByBundleID
{
  return self->_dateOfFirstAttemptToLaunchGizmoAppsByBundleID;
}

- (void)setDateOfFirstAttemptToLaunchGizmoAppsByBundleID:(id)a3
{
}

- (OS_dispatch_queue)processAssertionQueue
{
  return self->_processAssertionQueue;
}

- (void)setProcessAssertionQueue:(id)a3
{
}

- (BKSProcessAssertion)processAssertion
{
  return (BKSProcessAssertion *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProcessAssertion:(id)a3
{
}

- (NSString)activeApplication
{
  return self->_activeApplication;
}

- (void)setActiveApplication:(id)a3
{
}

- (OS_dispatch_queue)processAssertionForXcodeQueue
{
  return self->_processAssertionForXcodeQueue;
}

- (void)setProcessAssertionForXcodeQueue:(id)a3
{
}

- (BKSProcessAssertion)processAssertionForXcode
{
  return (BKSProcessAssertion *)objc_getProperty(self, a2, 128, 1);
}

- (void)setProcessAssertionForXcode:(id)a3
{
}

- (NSString)plugInIdentifierForXcodeProcessAssertion
{
  return self->_plugInIdentifierForXcodeProcessAssertion;
}

- (void)setPlugInIdentifierForXcodeProcessAssertion:(id)a3
{
}

- (id)batteryStateObserver
{
  return self->_batteryStateObserver;
}

- (void)setBatteryStateObserver:(id)a3
{
}

- (OS_dispatch_queue)remoteInterfaceProcessAssertionsQueue
{
  return self->_remoteInterfaceProcessAssertionsQueue;
}

- (void)setRemoteInterfaceProcessAssertionsQueue:(id)a3
{
}

- (NSMutableDictionary)remoteInterfaceProcessAssertions
{
  return self->_remoteInterfaceProcessAssertions;
}

- (void)setRemoteInterfaceProcessAssertions:(id)a3
{
}

- (OS_dispatch_queue)launchSockPuppetAppQueue
{
  return self->_launchSockPuppetAppQueue;
}

- (void)setLaunchSockPuppetAppQueue:(id)a3
{
}

- (NSString)launchSockPuppetAppCompanionAppIdentifer
{
  return self->_launchSockPuppetAppCompanionAppIdentifer;
}

- (void)setLaunchSockPuppetAppCompanionAppIdentifer:(id)a3
{
}

- (NSDictionary)launchSockPuppetAppOptions
{
  return self->_launchSockPuppetAppOptions;
}

- (void)setLaunchSockPuppetAppOptions:(id)a3
{
}

- (id)launchSockPuppetAppCompletion
{
  return self->_launchSockPuppetAppCompletion;
}

- (void)setLaunchSockPuppetAppCompletion:(id)a3
{
}

- (OS_dispatch_source)launchSockPuppetCancelLaunchTimer
{
  return self->_launchSockPuppetCancelLaunchTimer;
}

- (void)setLaunchSockPuppetCancelLaunchTimer:(id)a3
{
}

- (NSDate)dateOfFirstUnlock
{
  return self->_dateOfFirstUnlock;
}

- (void)setDateOfFirstUnlock:(id)a3
{
}

- (NSMutableDictionary)extensionsDoingSnapshot
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setExtensionsDoingSnapshot:(id)a3
{
}

- (OS_dispatch_queue)extensionsDoingSnapshotQueue
{
  return self->_extensionsDoingSnapshotQueue;
}

- (void)setExtensionsDoingSnapshotQueue:(id)a3
{
}

- (NSMutableDictionary)lastExtensionKilledDates
{
  return self->_lastExtensionKilledDates;
}

- (void)setLastExtensionKilledDates:(id)a3
{
}

- (OS_dispatch_queue)lastExtensionKilledDatesQueue
{
  return self->_lastExtensionKilledDatesQueue;
}

- (void)setLastExtensionKilledDatesQueue:(id)a3
{
}

- (double)timingTest_IDSReceiveTime
{
  return self->_timingTest_IDSReceiveTime;
}

- (void)setTimingTest_IDSReceiveTime:(double)a3
{
  self->_timingTest_IDSReceiveTime = a3;
}

- (double)timingTest_IDSSendTime
{
  return self->_timingTest_IDSSendTime;
}

- (void)setTimingTest_IDSSendTime:(double)a3
{
  self->_timingTest_IDSSendTime = a3;
}

- (unint64_t)timingTest_IDSSendSize
{
  return self->_timingTest_IDSSendSize;
}

- (void)setTimingTest_IDSSendSize:(unint64_t)a3
{
  self->_timingTest_IDSSendSize = a3;
}

- (OS_dispatch_queue)timingTest_queue
{
  return self->_timingTest_queue;
}

- (void)setTimingTest_queue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingTest_queue, 0);
  objc_storeStrong((id *)&self->_lastExtensionKilledDatesQueue, 0);
  objc_storeStrong((id *)&self->_lastExtensionKilledDates, 0);
  objc_storeStrong((id *)&self->_extensionsDoingSnapshotQueue, 0);
  objc_storeStrong((id *)&self->_extensionsDoingSnapshot, 0);
  objc_storeStrong((id *)&self->_dateOfFirstUnlock, 0);
  objc_storeStrong((id *)&self->_launchSockPuppetCancelLaunchTimer, 0);
  objc_storeStrong(&self->_launchSockPuppetAppCompletion, 0);
  objc_storeStrong((id *)&self->_launchSockPuppetAppOptions, 0);
  objc_storeStrong((id *)&self->_launchSockPuppetAppCompanionAppIdentifer, 0);
  objc_storeStrong((id *)&self->_launchSockPuppetAppQueue, 0);
  objc_storeStrong((id *)&self->_remoteInterfaceProcessAssertions, 0);
  objc_storeStrong((id *)&self->_remoteInterfaceProcessAssertionsQueue, 0);
  objc_storeStrong(&self->_batteryStateObserver, 0);
  objc_storeStrong((id *)&self->_plugInIdentifierForXcodeProcessAssertion, 0);
  objc_storeStrong((id *)&self->_processAssertionForXcode, 0);
  objc_storeStrong((id *)&self->_processAssertionForXcodeQueue, 0);
  objc_storeStrong((id *)&self->_activeApplication, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_processAssertionQueue, 0);
  objc_storeStrong((id *)&self->_dateOfFirstAttemptToLaunchGizmoAppsByBundleID, 0);
  objc_storeStrong((id *)&self->_usageTrack, 0);
  objc_storeStrong((id *)&self->_outstandingtransactions, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_localConnections, 0);
  objc_storeStrong((id *)&self->_localListener, 0);
  objc_storeStrong((id *)&self->_gizmoApplicationsUpdateTimer, 0);
  objc_storeStrong((id *)&self->_queueRemote, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end