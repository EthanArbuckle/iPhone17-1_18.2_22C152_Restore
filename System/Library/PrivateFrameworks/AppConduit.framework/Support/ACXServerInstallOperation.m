@interface ACXServerInstallOperation
+ (id)installOperationForCompanionAppBundleIdentifier:(id)a3 watchAppBundleIdentifier:(id)a4 targetUsesLegacySocketService:(BOOL)a5;
+ (id)installOperationForURL:(id)a3 watchAppBundleIdentifier:(id)a4 companionAppBundleID:(id)a5 isPlaceholder:(BOOL)a6 size:(int64_t)a7 targetUsesLegacySocketService:(BOOL)a8;
- (ACXIDSSocketManager)socketManager;
- (ACXPowerAssertion)powerAssertion;
- (ACXServerInstallOperation)initWithCompanionBundleID:(id)a3 watchAppBundleID:(id)a4 targetUsesLegacySocketService:(BOOL)a5;
- (ACXServerInstallOperation)initWithWatchAppBundleID:(id)a3 companionAppBundleID:(id)a4 isPlaceholder:(BOOL)a5 appURL:(id)a6 size:(int64_t)a7 targetUsesLegacySocketService:(BOOL)a8;
- (ACXStreamingZipSocketSender)streamingZipSender;
- (BOOL)acquiredSocket;
- (BOOL)cancelled;
- (BOOL)gotStreamingZipComplete;
- (BOOL)gotTransferDone;
- (BOOL)installPlaceholder;
- (BOOL)isUserInitiated;
- (NSDictionary)appSettingsDict;
- (NSDictionary)provisioningProfiles;
- (NSString)companionAppBundleID;
- (NSString)watchAppBundleID;
- (NSURL)appURL;
- (NSURL)tempDir;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)operationWatchdog;
- (OS_os_transaction)transaction;
- (double)lastPercentComplete;
- (id)_makeTempDirectoryWithError:(id *)a3;
- (id)_onQueue_sendCancelMessage;
- (id)completion;
- (id)progressBlock;
- (id)requiredDeviceCapabilities;
- (int64_t)appSize;
- (unint64_t)installType;
- (unint64_t)lastPhase;
- (unint64_t)transferStartTime;
- (unsigned)nextMessageType;
- (void)_commonInit:(BOOL)a3;
- (void)_onQueue_armWatchdog;
- (void)_onQueue_callCompletion:(id)a3;
- (void)_onQueue_callProgressBlockWithPhase:(unint64_t)a3 percent:(double)a4;
- (void)_onQueue_disarmWatchdog;
- (void)_onQueue_doTransferAndInstall;
- (void)_onQueue_prepForTransferAndInstall;
- (void)_onQueue_startInstall;
- (void)beginWithCompletionBlock:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)receivedDictionaryOrData:(id)a3;
- (void)setAcquiredSocket:(BOOL)a3;
- (void)setAppSettingsDict:(id)a3;
- (void)setAppSize:(int64_t)a3;
- (void)setAppURL:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setGotStreamingZipComplete:(BOOL)a3;
- (void)setGotTransferDone:(BOOL)a3;
- (void)setInstallPlaceholder:(BOOL)a3;
- (void)setIsUserInitiated:(BOOL)a3;
- (void)setLastPercentComplete:(double)a3;
- (void)setLastPhase:(unint64_t)a3;
- (void)setNextMessageType:(unsigned __int8)a3;
- (void)setOperationWatchdog:(id)a3;
- (void)setPowerAssertion:(id)a3;
- (void)setProgressBlock:(id)a3;
- (void)setProvisioningProfiles:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequiredDeviceCapabilities:(id)a3;
- (void)setStreamingZipSender:(id)a3;
- (void)setTempDir:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setTransferStartTime:(unint64_t)a3;
- (void)socketDidCloseWithError:(id)a3;
@end

@implementation ACXServerInstallOperation

- (void)_commonInit:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1000A55A8 != -1) {
    dispatch_once(&qword_1000A55A8, &stru_10008DBA8);
  }
  if (v3) {
    +[ACXIDSSocketManager sharedV1SocketManager];
  }
  else {
  v5 = +[ACXIDSSocketManager sharedV2SocketManager];
  }
  socketManager = self->_socketManager;
  self->_socketManager = v5;

  _objc_release_x1(v5, socketManager);
}

- (ACXServerInstallOperation)initWithCompanionBundleID:(id)a3 watchAppBundleID:(id)a4 targetUsesLegacySocketService:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACXServerInstallOperation;
  v11 = [(ACXServerInstallOperation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(ACXServerInstallOperation *)v11 _commonInit:v5];
    objc_storeStrong((id *)&v12->_companionAppBundleID, a3);
    objc_storeStrong((id *)&v12->_watchAppBundleID, a4);
    v12->_installType = 0;
    [(ACXServerInstallOperation *)v12 setAcquiredSocket:0];
    [(ACXServerInstallOperation *)v12 setNextMessageType:0];
  }

  return v12;
}

- (ACXServerInstallOperation)initWithWatchAppBundleID:(id)a3 companionAppBundleID:(id)a4 isPlaceholder:(BOOL)a5 appURL:(id)a6 size:(int64_t)a7 targetUsesLegacySocketService:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ACXServerInstallOperation;
  v18 = [(ACXServerInstallOperation *)&v22 init];
  v19 = v18;
  if (v18)
  {
    [(ACXServerInstallOperation *)v18 _commonInit:v8];
    objc_storeStrong((id *)&v19->_watchAppBundleID, a3);
    objc_storeStrong((id *)&v19->_companionAppBundleID, a4);
    objc_storeStrong((id *)&v19->_appURL, a6);
    v19->_appSize = a7;
    uint64_t v20 = 1;
    if (!v11) {
      uint64_t v20 = 2;
    }
    v19->_installType = v20;
    [(ACXServerInstallOperation *)v19 setAcquiredSocket:0];
    [(ACXServerInstallOperation *)v19 setNextMessageType:0];
  }

  return v19;
}

- (void)dealloc
{
  BOOL v3 = +[NSFileManager defaultManager];
  v4 = [(ACXServerInstallOperation *)self tempDir];
  [v3 removeItemAtURL:v4 error:0];

  if ([(ACXServerInstallOperation *)self acquiredSocket])
  {
    BOOL v5 = [(ACXServerInstallOperation *)self socketManager];
    [v5 endUsingSocket];

    [(ACXServerInstallOperation *)self setAcquiredSocket:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)ACXServerInstallOperation;
  [(ACXServerInstallOperation *)&v6 dealloc];
}

+ (id)installOperationForCompanionAppBundleIdentifier:(id)a3 watchAppBundleIdentifier:(id)a4 targetUsesLegacySocketService:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)objc_opt_class()) initWithCompanionBundleID:v8 watchAppBundleID:v7 targetUsesLegacySocketService:v5];

  return v9;
}

+ (id)installOperationForURL:(id)a3 watchAppBundleIdentifier:(id)a4 companionAppBundleID:(id)a5 isPlaceholder:(BOOL)a6 size:(int64_t)a7 targetUsesLegacySocketService:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [objc_alloc((Class)objc_opt_class()) initWithWatchAppBundleID:v14 companionAppBundleID:v13 isPlaceholder:v10 appURL:v15 size:a7 targetUsesLegacySocketService:v8];

  return v16;
}

- (void)beginWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if ([(ACXServerInstallOperation *)self isUserInitiated]) {
    intptr_t v5 = 21;
  }
  else {
    intptr_t v5 = 17;
  }
  objc_super v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v7 = dispatch_get_global_queue(v5, 0);
  dispatch_queue_t v8 = dispatch_queue_create_with_target_V2("com.apple.AppConduit.InstallOperationQ", v6, v7);
  [(ACXServerInstallOperation *)self setQueue:v8];

  id v9 = [(ACXServerInstallOperation *)self watchAppBundleID];
  BOOL v10 = +[NSString stringWithFormat:@"com.apple.appconduitd.install_active.%@", v9];

  id v11 = v10;
  [v11 UTF8String];
  v12 = (void *)os_transaction_create();
  [(ACXServerInstallOperation *)self setTransaction:v12];

  id v13 = [(ACXServerInstallOperation *)self watchAppBundleID];
  id v14 = +[NSString stringWithFormat:@"com.apple.appconduitd.install.%@", v13];

  id v15 = [(ACXServerInstallOperation *)self watchAppBundleID];
  id v16 = +[NSString stringWithFormat:@"Installation of a watch app with bundle ID %@ is in progress.", v15];

  id v17 = [[ACXPowerAssertion alloc] initWithName:v14 description:v16 timeoutSeconds:0];
  [(ACXServerInstallOperation *)self setPowerAssertion:v17];

  [(ACXServerInstallOperation *)self setCompletion:v4];
  v18 = [(ACXServerInstallOperation *)self appSettingsDict];

  if (!v18)
  {
    v19 = +[NSDictionary dictionary];
    [(ACXServerInstallOperation *)self setAppSettingsDict:v19];
  }
  uint64_t v20 = [(ACXServerInstallOperation *)self provisioningProfiles];

  if (!v20)
  {
    v21 = +[NSDictionary dictionary];
    [(ACXServerInstallOperation *)self setProvisioningProfiles:v21];
  }
  objc_super v22 = [(ACXServerInstallOperation *)self queue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100039940;
  v23[3] = &unk_10008CD30;
  v23[4] = self;
  sub_100006BB8(v22, v23);
}

- (void)cancel
{
  BOOL v3 = [(ACXServerInstallOperation *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000399D0;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onQueue_armWatchdog
{
  [(ACXServerInstallOperation *)self operationWatchdog];
  if (objc_claimAutoreleasedReturnValue()) {
    sub_10005BD40();
  }
  BOOL v3 = [(ACXServerInstallOperation *)self queue];
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  [(ACXServerInstallOperation *)self setOperationWatchdog:v4];

  intptr_t v5 = [(ACXServerInstallOperation *)self operationWatchdog];
  dispatch_time_t v6 = dispatch_time(0, 900000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  id v7 = [(ACXServerInstallOperation *)self operationWatchdog];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100039B18;
  handler[3] = &unk_10008CD30;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);

  dispatch_queue_t v8 = [(ACXServerInstallOperation *)self operationWatchdog];
  dispatch_resume(v8);
}

- (void)_onQueue_disarmWatchdog
{
  BOOL v3 = [(ACXServerInstallOperation *)self operationWatchdog];

  if (v3)
  {
    dispatch_source_t v4 = [(ACXServerInstallOperation *)self operationWatchdog];
    dispatch_source_cancel(v4);

    [(ACXServerInstallOperation *)self setOperationWatchdog:0];
  }
}

- (void)_onQueue_callProgressBlockWithPhase:(unint64_t)a3 percent:(double)a4
{
  if ([(ACXServerInstallOperation *)self lastPhase] > a3) {
    sub_10005BD6C();
  }
  if ([(ACXServerInstallOperation *)self lastPhase] == a3)
  {
    [(ACXServerInstallOperation *)self lastPercentComplete];
    if (v7 > a4) {
      sub_10005BD98();
    }
  }
  [(ACXServerInstallOperation *)self setLastPhase:a3];
  [(ACXServerInstallOperation *)self setLastPercentComplete:a4];
  dispatch_queue_t v8 = [(ACXServerInstallOperation *)self progressBlock];

  if (v8)
  {
    if (a4 > 1.0) {
      a4 = 1.0;
    }
    id v9 = [(ACXServerInstallOperation *)self progressBlock];
    v9[2](v9, a3, a4);
  }
}

- (void)_onQueue_callCompletion:(id)a3
{
  id v4 = a3;
  intptr_t v5 = [(ACXServerInstallOperation *)self completion];

  if (v5)
  {
    dispatch_time_t v6 = [(ACXServerInstallOperation *)self completion];
    ((void (**)(void, id))v6)[2](v6, v4);

    [(ACXServerInstallOperation *)self setCompletion:0];
    [(ACXServerInstallOperation *)self setProgressBlock:0];
    [(ACXServerInstallOperation *)self setStreamingZipSender:0];
    [(ACXServerInstallOperation *)self setGotTransferDone:0];
    [(ACXServerInstallOperation *)self setGotStreamingZipComplete:0];
    [(ACXServerInstallOperation *)self setNextMessageType:0];
    if ([(ACXServerInstallOperation *)self acquiredSocket])
    {
      if (v4)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          id v11 = v4;
          MOLogWrite();
        }
        id v7 = [(ACXServerInstallOperation *)self socketManager];
        [v7 resetSocket];
      }
      else
      {
        dispatch_queue_t v8 = [(ACXServerInstallOperation *)self socketManager];
        id v12 = 0;
        unsigned __int8 v9 = [v8 writeDictionary:&off_100097AD0 error:&v12];
        id v7 = v12;

        if ((v9 & 1) == 0 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3))
        {
          id v11 = v7;
          MOLogWrite();
        }
      }

      BOOL v10 = [(ACXServerInstallOperation *)self socketManager];
      [v10 endUsingSocket];

      [(ACXServerInstallOperation *)self setAcquiredSocket:0];
    }
    -[ACXServerInstallOperation setTransaction:](self, "setTransaction:", 0, v11);
    [(ACXServerInstallOperation *)self setPowerAssertion:0];
    [(ACXServerInstallOperation *)self _onQueue_disarmWatchdog];
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (id)_makeTempDirectoryWithError:(id *)a3
{
  intptr_t v5 = sub_100007968(a3);
  if (v5)
  {
    dispatch_time_t v6 = [(ACXServerInstallOperation *)self watchAppBundleID];
    id v7 = +[NSString stringWithFormat:@"%@_XXXXXX", v6];
    dispatch_queue_t v8 = [v5 URLByAppendingPathComponent:v7 isDirectory:0];

    unsigned __int8 v9 = sub_100007EC0(v8, a3);
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)_onQueue_sendCancelMessage
{
  BOOL v3 = [(ACXServerInstallOperation *)self socketManager];
  id v10 = 0;
  unsigned __int8 v4 = [v3 writeDictionary:&off_100097AF8 error:&v10];
  id v5 = v10;

  if (v4)
  {
    [(ACXServerInstallOperation *)self setNextMessageType:8];
    id v7 = 0;
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      uint64_t v9 = (uint64_t)v5;
      MOLogWrite();
    }
    id v7 = sub_100007710((uint64_t)"-[ACXServerInstallOperation _onQueue_sendCancelMessage]", 278, @"ACXErrorDomain", 6, v5, 0, @"Failed to send cancel message to gizmo.", v6, v9);
  }

  return v7;
}

- (void)_onQueue_prepForTransferAndInstall
{
  v46 = 0;
  [(ACXServerInstallOperation *)self _onQueue_callProgressBlockWithPhase:0 percent:0.0];
  id v45 = 0;
  BOOL v3 = [(ACXServerInstallOperation *)self _makeTempDirectoryWithError:&v45];
  id v4 = v45;
  [(ACXServerInstallOperation *)self setTempDir:v3];

  id v5 = [(ACXServerInstallOperation *)self tempDir];

  if (!v5)
  {
    [(ACXServerInstallOperation *)self _onQueue_callCompletion:v4];
    goto LABEL_23;
  }
  unint64_t v6 = [(ACXServerInstallOperation *)self installType];
  if (v6 - 1 < 2)
  {
    id v7 = 0;
    dispatch_queue_t v8 = 0;
    uint64_t v9 = 0;
    goto LABEL_4;
  }
  if (v6)
  {
    uint64_t v28 = [(ACXServerInstallOperation *)self installType];
    uint64_t v30 = sub_100007710((uint64_t)"-[ACXServerInstallOperation _onQueue_prepForTransferAndInstall]", 346, @"ACXErrorDomain", 39, 0, 0, @"Received unknown ACXInstallType %lu", v29, v28);

    [(ACXServerInstallOperation *)self _onQueue_callCompletion:v30];
    id v4 = (id)v30;
    goto LABEL_23;
  }
  id v13 = [(ACXServerInstallOperation *)self tempDir];
  id v14 = [v13 URLByAppendingPathComponent:@"Transfer"];
  [(ACXServerInstallOperation *)self setAppURL:v14];

  uint64_t v47 = kMIWatchKitSnapshotOptionCreatePlaceholder;
  id v15 = +[NSNumber numberWithBool:[(ACXServerInstallOperation *)self installPlaceholder]];
  v48 = v15;
  id v7 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];

  id v16 = [(ACXServerInstallOperation *)self companionAppBundleID];
  id v17 = [(ACXServerInstallOperation *)self appURL];
  dispatch_queue_t v8 = (void *)MobileInstallationWatchKitInstallerSnapshotWKApp();

  if (!v8)
  {
    v31 = v46;
    v32 = [(ACXServerInstallOperation *)self companionAppBundleID];
    uint64_t v34 = sub_100007710((uint64_t)"-[ACXServerInstallOperation _onQueue_prepForTransferAndInstall]", 314, @"ACXErrorDomain", 7, v31, 0, @"Snapshot failed for companion bundle ID %@", v33, (uint64_t)v32);

    [(ACXServerInstallOperation *)self _onQueue_callCompletion:v34];
    id v4 = (id)v34;
    goto LABEL_23;
  }
  v18 = [v8 objectForKeyedSubscript:kMIWatchKitSnapshotInfoDiskUsageBytes];
  -[ACXServerInstallOperation setAppSize:](self, "setAppSize:", [v18 longLongValue]);

  if (![(ACXServerInstallOperation *)self appSize])
  {
    v35 = v46;
    v36 = [(ACXServerInstallOperation *)self companionAppBundleID];
    sub_100007710((uint64_t)"-[ACXServerInstallOperation _onQueue_prepForTransferAndInstall]", 321, @"ACXErrorDomain", 7, v35, 0, @"Snapshot for companion bundle ID %@ failed to return disk usage", v37, (uint64_t)v36);
    uint64_t v39 = LABEL_22:;

    [(ACXServerInstallOperation *)self _onQueue_callCompletion:v39];
    id v4 = (id)v39;
    goto LABEL_23;
  }
  uint64_t v19 = [v8 objectForKeyedSubscript:kCFBundleIdentifierKey];
  if (!v19)
  {
    v35 = v46;
    v36 = [(ACXServerInstallOperation *)self companionAppBundleID];
    sub_100007710((uint64_t)"-[ACXServerInstallOperation _onQueue_prepForTransferAndInstall]", 328, @"ACXErrorDomain", 7, v35, 0, @"Snapshot for companion bundle ID %@ failed to return watch app bundle ID", v38, (uint64_t)v36);
    goto LABEL_22;
  }
  uint64_t v9 = (void *)v19;
  uint64_t v20 = [(ACXServerInstallOperation *)self watchAppBundleID];
  unsigned __int8 v21 = [v20 isEqualToString:v9];

  if ((v21 & 1) == 0)
  {
    id v10 = v46;
    objc_super v22 = [(ACXServerInstallOperation *)self companionAppBundleID];
    v43 = [(ACXServerInstallOperation *)self watchAppBundleID];
    uint64_t v12 = sub_100007710((uint64_t)"-[ACXServerInstallOperation _onQueue_prepForTransferAndInstall]", 333, @"ACXErrorDomain", 7, v10, 0, @"Snapshot for companion bundle ID %@ returned watch bundle ID %@ instead of %@", v23, (uint64_t)v22);

    goto LABEL_6;
  }
LABEL_4:
  if ([(ACXServerInstallOperation *)self cancelled])
  {
    id v10 = [(ACXServerInstallOperation *)self watchAppBundleID];
    uint64_t v12 = sub_100007710((uint64_t)"-[ACXServerInstallOperation _onQueue_prepForTransferAndInstall]", 353, @"ACXErrorDomain", 6, 0, 0, @"Operation cancelled for %@.", v11, (uint64_t)v10);

LABEL_6:
    [(ACXServerInstallOperation *)self _onQueue_callCompletion:v12];

    id v4 = (id)v12;
    goto LABEL_23;
  }
  [(ACXServerInstallOperation *)self _onQueue_callProgressBlockWithPhase:0 percent:50.0];
  int64_t v24 = [(ACXServerInstallOperation *)self appSize];
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    v25 = [(ACXServerInstallOperation *)self watchAppBundleID];
    uint64_t v41 = (int)sub_100008300([(ACXServerInstallOperation *)self installPlaceholder]);
    uint64_t v42 = (int)sub_100008300([(ACXServerInstallOperation *)self isUserInitiated]);
    v40 = v25;
    MOLogWrite();
  }
  v26 = [(ACXServerInstallOperation *)self socketManager];
  v27 = [(ACXServerInstallOperation *)self queue];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10003A764;
  v44[3] = &unk_10008DBD0;
  v44[4] = self;
  [v26 beginUsingSocketAsDelegate:self onQueue:v27 tryWiFi:v24 > 5242880 completion:v44];

LABEL_23:
}

- (void)_onQueue_doTransferAndInstall
{
  if ([(ACXServerInstallOperation *)self cancelled])
  {
    id v20 = [(ACXServerInstallOperation *)self watchAppBundleID];
    id v4 = sub_100007710((uint64_t)"-[ACXServerInstallOperation _onQueue_doTransferAndInstall]", 387, @"ACXErrorDomain", 6, 0, 0, @"Operation cancelled for %@.", v3, (uint64_t)v20);
    [(ACXServerInstallOperation *)self _onQueue_callCompletion:v4];
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      v18 = [(ACXServerInstallOperation *)self watchAppBundleID];
      MOLogWrite();
    }
    v23[0] = &off_1000977B0;
    v22[0] = @"T";
    v22[1] = @"SZ";
    id v5 = +[NSNumber numberWithLongLong:[(ACXServerInstallOperation *)self appSize]];
    v23[1] = v5;
    v22[2] = @"WI";
    unint64_t v6 = [(ACXServerInstallOperation *)self watchAppBundleID];
    v23[2] = v6;
    v22[3] = @"P";
    id v7 = +[NSNumber numberWithBool:[(ACXServerInstallOperation *)self installPlaceholder]];
    v23[3] = v7;
    v22[4] = @"UI";
    dispatch_queue_t v8 = +[NSNumber numberWithBool:[(ACXServerInstallOperation *)self isUserInitiated]];
    v23[4] = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];
    id v10 = [v9 mutableCopy];

    uint64_t v11 = [(ACXServerInstallOperation *)self requiredDeviceCapabilities];

    if (v11)
    {
      uint64_t v12 = [(ACXServerInstallOperation *)self requiredDeviceCapabilities];
      [v10 setObject:v12 forKeyedSubscript:@"RC"];
    }
    id v13 = [(ACXServerInstallOperation *)self socketManager];
    id v21 = 0;
    unsigned __int8 v14 = [v13 writeDictionary:v10 error:&v21];
    id v15 = v21;

    if (v14)
    {
      [(ACXServerInstallOperation *)self setNextMessageType:2];
      [(ACXServerInstallOperation *)self _onQueue_armWatchdog];
    }
    else
    {
      id v17 = sub_100007710((uint64_t)"-[ACXServerInstallOperation _onQueue_doTransferAndInstall]", 405, @"ACXErrorDomain", 10, v15, 0, @"Failed to send hello message", v16, v19);
      [(ACXServerInstallOperation *)self _onQueue_callCompletion:v17];
    }
  }
}

- (void)_onQueue_startInstall
{
  [(ACXServerInstallOperation *)self _onQueue_callProgressBlockWithPhase:2 percent:0.0];
  if (![(ACXServerInstallOperation *)self gotTransferDone]
    || ![(ACXServerInstallOperation *)self gotStreamingZipComplete])
  {
    sub_10005BDC4();
  }
  [(ACXServerInstallOperation *)self setNextMessageType:5];
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v11 = [(ACXServerInstallOperation *)self watchAppBundleID];
    MOLogWrite();
  }
  v15[0] = &off_1000977C8;
  v14[0] = @"T";
  v14[1] = @"SE";
  uint64_t v3 = [(ACXServerInstallOperation *)self appSettingsDict];
  v15[1] = v3;
  v14[2] = @"PD";
  id v4 = [(ACXServerInstallOperation *)self provisioningProfiles];
  v15[2] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  unint64_t v6 = [(ACXServerInstallOperation *)self socketManager];
  id v13 = 0;
  unsigned __int8 v7 = [v6 writeDictionary:v5 error:&v13];
  id v8 = v13;

  if (v7)
  {
    [(ACXServerInstallOperation *)self _onQueue_armWatchdog];
  }
  else
  {
    uint64_t v10 = sub_100007710((uint64_t)"-[ACXServerInstallOperation _onQueue_startInstall]", 431, @"ACXErrorDomain", 10, v8, 0, @"Failed to send do install message", v9, v12);

    [(ACXServerInstallOperation *)self _onQueue_callCompletion:v10];
    id v8 = (id)v10;
  }
}

- (void)receivedDictionaryOrData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (!v6)
  {
    uint64_t v10 = @"Got non-dictionary message from receiver.";
    uint64_t v11 = 451;
LABEL_16:
    uint64_t v16 = sub_100007710((uint64_t)"-[ACXServerInstallOperation receivedDictionaryOrData:]", v11, @"ACXErrorDomain", 15, 0, 0, v10, v7, v77);
    id v15 = 0;
    goto LABEL_74;
  }
  [(ACXServerInstallOperation *)self _onQueue_disarmWatchdog];
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    uint64_t v77 = [(ACXServerInstallOperation *)self watchAppBundleID];
    unint64_t v81 = (unint64_t)v5;
    MOLogWrite();
  }
  id v8 = objc_msgSend(v5, "objectForKeyedSubscript:", @"T", v77, v81);
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v6 = v9;
  }
  else {
    id v6 = 0;
  }

  if (!v6)
  {
    uint64_t v10 = @"Message did not have message type key set.";
    uint64_t v11 = 461;
    goto LABEL_16;
  }
  unsigned int v12 = [v6 unsignedCharValue];
  id v13 = [v5 objectForKeyedSubscript:@"ER"];
  objc_opt_class();
  id v14 = v13;
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  switch(v12)
  {
    case 2u:
      id v17 = [v15 integerValue];
      if (v17)
      {
        uint64_t v18 = (uint64_t)v17;
        if (v17 == (id)29)
        {
          uint64_t v19 = [v5 objectForKeyedSubscript:@"RCF"];
          objc_opt_class();
          id v20 = sub_100022400(v19);

          sub_100007710((uint64_t)"-[ACXServerInstallOperation receivedDictionaryOrData:]", 477, @"ACXErrorDomain", 29, 0, 0, @"Got capabilities mismatch error in hello response from remote side; mismatched capabilities: %@",
            v21,
          uint64_t v16 = (uint64_t)v20);

          break;
        }
        id v78 = [v15 integerValue];
        sub_100007710((uint64_t)"-[ACXServerInstallOperation receivedDictionaryOrData:]", 479, @"ACXErrorDomain", v18, 0, 0, @"Got error %ld in hello response from remote side", v60, (uint64_t)v78);
        goto LABEL_73;
      }
      if ([(ACXServerInstallOperation *)self nextMessageType] != 2)
      {
        uint64_t v77 = 2;
        unint64_t v81 = [(ACXServerInstallOperation *)self nextMessageType];
        int64_t v24 = @"Got unexpected message type %hhu when I was expecting %hhu";
        uint64_t v25 = 485;
        goto LABEL_71;
      }
      if ([(ACXServerInstallOperation *)self cancelled]) {
        goto LABEL_58;
      }
      [(ACXServerInstallOperation *)self _onQueue_callProgressBlockWithPhase:0 percent:100.0];
      [(ACXServerInstallOperation *)self setNextMessageType:3];
      objc_initWeak(location, self);
      v65 = [(ACXServerInstallOperation *)self appURL];
      v66 = [(ACXServerInstallOperation *)self queue];
      v94[0] = _NSConcreteStackBlock;
      v94[1] = 3221225472;
      v94[2] = sub_10003BC6C;
      v94[3] = &unk_10008DBF8;
      objc_copyWeak(&v95, location);
      v94[4] = self;
      v67 = +[ACXStreamingZipSocketSender senderForURL:v65 queue:v66 writingUsingBlock:v94];
      [(ACXServerInstallOperation *)self setStreamingZipSender:v67];

      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_10003BDA4;
      v92[3] = &unk_10008DC20;
      objc_copyWeak(&v93, location);
      v68 = [(ACXServerInstallOperation *)self streamingZipSender];
      [v68 setProgressBlock:v92];

      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        v79 = [(ACXServerInstallOperation *)self watchAppBundleID];
        MOLogWrite();
      }
      [(ACXServerInstallOperation *)self setTransferStartTime:mach_absolute_time()];
      v69 = [(ACXServerInstallOperation *)self streamingZipSender];
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_10003BDFC;
      v90[3] = &unk_10008DC48;
      objc_copyWeak(&v91, location);
      [v69 beginSendingWithCompletionBlock:v90];

      objc_destroyWeak(&v91);
      objc_destroyWeak(&v93);
      objc_destroyWeak(&v95);
      objc_destroyWeak(location);
      goto LABEL_76;
    case 3u:
      uint64_t v27 = mach_absolute_time();
      unint64_t v28 = [(ACXServerInstallOperation *)self transferStartTime];
      if ([v15 integerValue])
      {
        uint64_t v29 = [(ACXServerInstallOperation *)self streamingZipSender];
        [v29 cancelSending];

        id v22 = [v15 integerValue];
        uint64_t v77 = (uint64_t)[v15 integerValue];
        int64_t v24 = @"Got error %ld in transfer done from remote side";
        uint64_t v25 = 567;
        goto LABEL_28;
      }
      if ([(ACXServerInstallOperation *)self nextMessageType] != 3)
      {
        uint64_t v77 = 3;
        unint64_t v81 = [(ACXServerInstallOperation *)self nextMessageType];
        int64_t v24 = @"Got unexpected message type %hhu when I was expecting %hhu";
        uint64_t v25 = 572;
        goto LABEL_71;
      }
      LODWORD(v44) = HIDWORD(qword_1000A55B0);
      double v45 = (double)((v27 - v28) * qword_1000A55B0) / (double)v44 / 1000000000.0;
      v46 = [(ACXServerInstallOperation *)self streamingZipSender];
      id v47 = [v46 bytesOutput];

      v48 = [(ACXServerInstallOperation *)self streamingZipSender];
      id v87 = [v48 totalBytes];

      v49 = [(ACXServerInstallOperation *)self streamingZipSender];
      id v50 = [v49 totalBytes];
      v51 = [(ACXServerInstallOperation *)self streamingZipSender];
      id v52 = [v51 bytesOutput];

      uint64_t v53 = qword_1000A5608;
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
        goto LABEL_51;
      }
      double v54 = (double)(uint64_t)v47 * 0.0009765625 / v45;
      double v55 = (double)(uint64_t)v50 / (double)(uint64_t)v52;
      v56 = [(ACXServerInstallOperation *)self watchAppBundleID];
      v57 = [(ACXServerInstallOperation *)self streamingZipSender];
      double v83 = v54;
      double v84 = v55;
      double v82 = v45;
      uint64_t v77 = (uint64_t)v56;
      unint64_t v81 = (unint64_t)[v57 bytesOutput];
      MOLogWrite();

      uint64_t v53 = qword_1000A5608;
      if (qword_1000A5608)
      {
LABEL_51:
        if (*(int *)(v53 + 44) >= 7)
        {
          v58 = [(ACXServerInstallOperation *)self watchAppBundleID];
          v59 = [(ACXServerInstallOperation *)self streamingZipSender];
          double v82 = (double)(uint64_t)v87 * 0.0009765625 / v45;
          uint64_t v77 = (uint64_t)v58;
          unint64_t v81 = (unint64_t)[v59 totalBytes];
          MOLogWrite();
        }
      }
      if ([(ACXServerInstallOperation *)self cancelled])
      {
LABEL_58:
        uint64_t v16 = [(ACXServerInstallOperation *)self _onQueue_sendCancelMessage];
        if (v16) {
          break;
        }
      }
      else
      {
        [(ACXServerInstallOperation *)self setGotTransferDone:1];
        if ([(ACXServerInstallOperation *)self gotStreamingZipComplete])
        {
          [(ACXServerInstallOperation *)self _onQueue_startInstall];
        }
        else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          MOLogWrite();
        }
      }
      goto LABEL_76;
    case 5u:
      if ([v15 integerValue])
      {
        id v22 = [v15 integerValue];
        uint64_t v77 = (uint64_t)[v15 integerValue];
        int64_t v24 = @"Got error %ld in install progress from remote side";
        uint64_t v25 = 613;
        goto LABEL_28;
      }
      if ([(ACXServerInstallOperation *)self nextMessageType] != 5)
      {
        uint64_t v77 = 5;
        unint64_t v81 = [(ACXServerInstallOperation *)self nextMessageType];
        int64_t v24 = @"Got unexpected message type %hhu when I was expecting %hhu";
        uint64_t v25 = 618;
        goto LABEL_71;
      }
      uint64_t v41 = [v5 objectForKeyedSubscript:@"PG"];
      objc_opt_class();
      uint64_t v16 = sub_100022400(v41);

      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
      {
        uint64_t v42 = [(ACXServerInstallOperation *)self watchAppBundleID];
        [v16 doubleValue];
        unint64_t v81 = v43;
        uint64_t v77 = (uint64_t)v42;
        MOLogWrite();
      }
      objc_msgSend(v16, "doubleValue", v77, v81);
      -[ACXServerInstallOperation _onQueue_callProgressBlockWithPhase:percent:](self, "_onQueue_callProgressBlockWithPhase:percent:", 2);
      [(ACXServerInstallOperation *)self _onQueue_armWatchdog];
      goto LABEL_75;
    case 6u:
      if ([(ACXServerInstallOperation *)self nextMessageType] != 5)
      {
        uint64_t v77 = 5;
        unint64_t v81 = [(ACXServerInstallOperation *)self nextMessageType];
        int64_t v24 = @"Got unexpected message type %hhu when I was expecting %hhu";
        uint64_t v25 = 637;
        goto LABEL_71;
      }
      if (![v15 integerValue])
      {
        uint64_t v16 = 0;
        goto LABEL_88;
      }
      v31 = [v5 objectForKeyedSubscript:@"IE"];
      objc_opt_class();
      v32 = sub_100022400(v31);

      if (!v32) {
        goto LABEL_86;
      }
      id v89 = 0;
      uint64_t v33 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v32 error:&v89];
      id v34 = v89;
      if (v33)
      {
        id v35 = [v15 integerValue];
        uint64_t v16 = sub_100007710((uint64_t)"-[ACXServerInstallOperation receivedDictionaryOrData:]", 647, @"ACXErrorDomain", (uint64_t)v35, v33, 0, @"Got error in install done from remote side", v36, v77);

        if (v16) {
          goto LABEL_87;
        }
      }
      else
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          uint64_t v77 = (uint64_t)v34;
          MOLogWrite();
        }
      }
LABEL_86:
      v70 = objc_msgSend(v5, "objectForKeyedSubscript:", @"ME", v77);
      v88 = v32;
      objc_opt_class();
      v86 = sub_100022400(v70);

      v71 = [v5 objectForKeyedSubscript:@"MEX"];
      objc_opt_class();
      v85 = sub_100022400(v71);

      v72 = [v5 objectForKeyedSubscript:@"MED"];
      objc_opt_class();
      v73 = sub_100022400(v72);

      id v74 = [v15 integerValue];
      id v75 = [v15 integerValue];
      double v82 = COERCE_DOUBLE([v85 unsignedIntValue]);
      double v83 = *(double *)&v73;
      uint64_t v80 = (uint64_t)v75;
      unint64_t v81 = (unint64_t)v86;
      v32 = v88;
      sub_100007710((uint64_t)"-[ACXServerInstallOperation receivedDictionaryOrData:]", 658, @"ACXErrorDomain", (uint64_t)v74, 0, 0, @"Got error %ld in install done from remote side (MI error %@ ; Extended 0x%x ; Desc %@)",
        v76,
      uint64_t v16 = v80);

LABEL_87:
LABEL_88:
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
        break;
      }
      v64 = [(ACXServerInstallOperation *)self watchAppBundleID];
      uint64_t v77 = (uint64_t)v64;
      goto LABEL_91;
    case 8u:
      if ([(ACXServerInstallOperation *)self nextMessageType] != 8)
      {
        uint64_t v77 = 8;
        unint64_t v81 = [(ACXServerInstallOperation *)self nextMessageType];
        int64_t v24 = @"Got unexpected message type %hhu when I was expecting %hhu";
        uint64_t v25 = 670;
LABEL_71:
        uint64_t v30 = 14;
LABEL_72:
        sub_100007710((uint64_t)"-[ACXServerInstallOperation receivedDictionaryOrData:]", v25, @"ACXErrorDomain", v30, 0, 0, v24, v23, v77);
        uint64_t v16 = LABEL_73:;
        break;
      }
      if ([v15 integerValue] == (id)6)
      {
        uint64_t v40 = sub_100007574((uint64_t)"-[ACXServerInstallOperation receivedDictionaryOrData:]", 677, @"ACXErrorDomain", 6, @"Operation canceled.", v37, v38, v39, v77);
LABEL_63:
        uint64_t v16 = (void *)v40;
        goto LABEL_64;
      }
      if ([v15 integerValue])
      {
        id v61 = [v15 integerValue];
        id v62 = [v15 integerValue];
        uint64_t v40 = sub_100007710((uint64_t)"-[ACXServerInstallOperation receivedDictionaryOrData:]", 679, @"ACXErrorDomain", (uint64_t)v61, 0, 0, @"Got error %ld in cancel confirmed from remote side", v63, (uint64_t)v62);
        goto LABEL_63;
      }
      uint64_t v16 = 0;
LABEL_64:
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        v64 = [(ACXServerInstallOperation *)self watchAppBundleID];
        uint64_t v77 = (uint64_t)v64;
LABEL_91:
        MOLogWrite();
      }
      break;
    case 9u:
      v26 = [(ACXServerInstallOperation *)self streamingZipSender];
      [v26 cancelSending];

      if ([v15 integerValue])
      {
        id v22 = [v15 integerValue];
        uint64_t v77 = (uint64_t)[v15 integerValue];
        int64_t v24 = @"Got error %ld in reset from remote side";
        uint64_t v25 = 692;
LABEL_28:
        uint64_t v30 = (uint64_t)v22;
      }
      else
      {
        int64_t v24 = @"Got connection reset without a reason";
        uint64_t v25 = 694;
        uint64_t v30 = 1;
      }
      goto LABEL_72;
    default:
      uint64_t v77 = [v15 unsignedCharValue];
      int64_t v24 = @"Got unhandled message type %hhu";
      uint64_t v25 = 701;
      goto LABEL_71;
  }
LABEL_74:
  -[ACXServerInstallOperation _onQueue_callCompletion:](self, "_onQueue_callCompletion:", v16, v77, v81, *(void *)&v82, *(void *)&v83);
LABEL_75:

LABEL_76:
}

- (void)socketDidCloseWithError:(id)a3
{
  id v5 = a3;
  id v4 = [(ACXServerInstallOperation *)self completion];

  if (v4) {
    [(ACXServerInstallOperation *)self _onQueue_callCompletion:v5];
  }
}

- (NSString)companionAppBundleID
{
  return self->_companionAppBundleID;
}

- (NSString)watchAppBundleID
{
  return self->_watchAppBundleID;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (NSDictionary)appSettingsDict
{
  return self->_appSettingsDict;
}

- (void)setAppSettingsDict:(id)a3
{
}

- (BOOL)installPlaceholder
{
  return self->_installPlaceholder;
}

- (void)setInstallPlaceholder:(BOOL)a3
{
  self->_installPlaceholder = a3;
}

- (unint64_t)installType
{
  return self->_installType;
}

- (BOOL)isUserInitiated
{
  return self->_isUserInitiated;
}

- (void)setIsUserInitiated:(BOOL)a3
{
  self->_isUserInitiated = a3;
}

- (NSDictionary)provisioningProfiles
{
  return self->_provisioningProfiles;
}

- (void)setProvisioningProfiles:(id)a3
{
}

- (id)requiredDeviceCapabilities
{
  return self->_requiredDeviceCapabilities;
}

- (void)setRequiredDeviceCapabilities:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (unint64_t)lastPhase
{
  return self->_lastPhase;
}

- (void)setLastPhase:(unint64_t)a3
{
  self->_lastPhase = a3;
}

- (double)lastPercentComplete
{
  return self->_lastPercentComplete;
}

- (void)setLastPercentComplete:(double)a3
{
  self->_lastPercentComplete = a3;
}

- (NSURL)tempDir
{
  return self->_tempDir;
}

- (void)setTempDir:(id)a3
{
}

- (BOOL)acquiredSocket
{
  return self->_acquiredSocket;
}

- (void)setAcquiredSocket:(BOOL)a3
{
  self->_acquiredSocket = a3;
}

- (ACXStreamingZipSocketSender)streamingZipSender
{
  return self->_streamingZipSender;
}

- (void)setStreamingZipSender:(id)a3
{
}

- (unsigned)nextMessageType
{
  return self->_nextMessageType;
}

- (void)setNextMessageType:(unsigned __int8)a3
{
  self->_nextMessageType = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (ACXPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(id)a3
{
}

- (OS_dispatch_source)operationWatchdog
{
  return self->_operationWatchdog;
}

- (void)setOperationWatchdog:(id)a3
{
}

- (unint64_t)transferStartTime
{
  return self->_transferStartTime;
}

- (void)setTransferStartTime:(unint64_t)a3
{
  self->_transferStartTime = a3;
}

- (BOOL)gotTransferDone
{
  return self->_gotTransferDone;
}

- (void)setGotTransferDone:(BOOL)a3
{
  self->_gotTransferDone = a3;
}

- (BOOL)gotStreamingZipComplete
{
  return self->_gotStreamingZipComplete;
}

- (void)setGotStreamingZipComplete:(BOOL)a3
{
  self->_gotStreamingZipComplete = a3;
}

- (NSURL)appURL
{
  return self->_appURL;
}

- (void)setAppURL:(id)a3
{
}

- (int64_t)appSize
{
  return self->_appSize;
}

- (void)setAppSize:(int64_t)a3
{
  self->_appSize = a3;
}

- (ACXIDSSocketManager)socketManager
{
  return self->_socketManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketManager, 0);
  objc_storeStrong((id *)&self->_appURL, 0);
  objc_storeStrong((id *)&self->_operationWatchdog, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_streamingZipSender, 0);
  objc_storeStrong((id *)&self->_tempDir, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_requiredDeviceCapabilities, 0);
  objc_storeStrong((id *)&self->_provisioningProfiles, 0);
  objc_storeStrong((id *)&self->_appSettingsDict, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_watchAppBundleID, 0);

  objc_storeStrong((id *)&self->_companionAppBundleID, 0);
}

@end