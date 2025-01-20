@interface CSPDispatcher
+ (id)sharedDispatcher;
- (BOOL)_adminServiceShouldAcceptNewConnection:(id)a3;
- (BOOL)handleDarwinNotificationEventWithName:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CESRTaskCoalescer)taskCoalescer;
- (CSPDispatcher)init;
- (NSXPCListener)adminServiceListener;
- (id)_adminServiceProvider;
- (id)_defaultTaskCoalescerWithQueue:(id)a3;
- (id)_initWithQueue:(id)a3;
- (id)_initWithQueue:(id)a3 adminServiceProvider:(id)a4 speechProfileSiteManager:(id)a5;
- (id)_listenerWithMachServiceName:(id)a3 delegate:(id)a4;
- (id)_speechProfileSiteManager;
- (void)_notifyChangeToSets:(id)a3;
- (void)registerXPCActivities;
- (void)resourceAvailableForPersona:(id)a3;
- (void)resourceUnavailableForPersona:(id)a3;
- (void)resourceUnavailableSoonForPersona:(id)a3;
- (void)runMaintenanceWithShouldDefer:(id)a3 completion:(id)a4;
- (void)runMigration:(id)a3;
- (void)setupXPCListeners;
@end

@implementation CSPDispatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskCoalescer, 0);
  objc_storeStrong((id *)&self->_speechProfileSiteManager, 0);
  objc_storeStrong((id *)&self->_adminServiceProvider, 0);
  objc_storeStrong((id *)&self->_setChangeListener, 0);
  objc_storeStrong((id *)&self->_adminServiceListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (CESRTaskCoalescer)taskCoalescer
{
  return self->_taskCoalescer;
}

- (NSXPCListener)adminServiceListener
{
  return self->_adminServiceListener;
}

- (void)resourceUnavailableSoonForPersona:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EB8A8;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)resourceUnavailableForPersona:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EB9EC;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)resourceAvailableForPersona:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EBB30;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)runMigration:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000EBCA8;
  v8[3] = &unk_100253280;
  id v9 = (id)os_transaction_create();
  id v10 = v4;
  v8[4] = self;
  id v5 = v9;
  id v6 = v4;
  v7 = objc_retainBlock(v8);
  dispatch_async((dispatch_queue_t)self->_queue, v7);
}

- (void)runMaintenanceWithShouldDefer:(id)a3 completion:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000EBE8C;
  v10[3] = &unk_100253380;
  id v12 = a3;
  id v13 = a4;
  v10[4] = self;
  id v11 = (id)os_transaction_create();
  id v6 = v11;
  id v7 = v13;
  id v8 = v12;
  id v9 = objc_retainBlock(v10);
  dispatch_async((dispatch_queue_t)self->_queue, v9);
}

- (BOOL)handleDarwinNotificationEventWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kAFPreferencesDidChangeDarwinNotification;
  if (([v4 isEqualToString:kAFPreferencesDidChangeDarwinNotification] & 1) == 0
    && ([v4 isEqualToString:AFLanguageCodeDidChangeDarwinNotification] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.siri.uaf.com.apple.siri.understanding"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.MobileAsset.AutoAssetNotification^com.apple.MobileAsset.MAAutoAsset^STARTUP_ACTIVATED"] & 1) == 0&& !objc_msgSend(v4, "isEqualToString:", @"com.apple.sysdiagnose.sysdiagnoseStarted"))
  {
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_23;
  }
  id v6 = +[CESRSpeechProfileEvaluationStatus sharedStatus];
  unsigned int v7 = [v6 isEvaluationEnabled];

  id v8 = CSLogContextFacilityCoreSpeech;
  if (v7)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[CSPDispatcher handleDarwinNotificationEventWithName:]";
      __int16 v34 = 2112;
      id v35 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Evaluation is enabled, ignoring notification: %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[CSPDispatcher handleDarwinNotificationEventWithName:]";
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Handling notification: %@", buf, 0x16u);
  }
  if (([v4 isEqualToString:v5] & 1) != 0
    || [v4 isEqualToString:AFLanguageCodeDidChangeDarwinNotification])
  {
    id v10 = (void *)os_transaction_create();
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EC384;
    block[3] = &unk_100253B08;
    block[4] = self;
    id v12 = v10;
    id v31 = v12;
    dispatch_async(queue, block);
  }
  else
  {
    id v12 = 0;
  }
  if (([v4 isEqualToString:@"com.apple.siri.uaf.com.apple.siri.understanding"] & 1) != 0
    || [v4 isEqualToString:@"com.apple.MobileAsset.AutoAssetNotification^com.apple.MobileAsset.MAAutoAsset^STARTUP_ACTIVATED"])
  {
    id v13 = (void *)os_transaction_create();

    v14 = self->_queue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000EC3C8;
    v28[3] = &unk_100253B08;
    v28[4] = self;
    id v12 = v13;
    id v29 = v12;
    dispatch_async(v14, v28);
  }
  if ([v4 isEqualToString:@"com.apple.sysdiagnose.sysdiagnoseStarted"])
  {
    v15 = (void *)os_transaction_create();

    v16 = self->_queue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000EC40C;
    v26[3] = &unk_100253B08;
    v26[4] = self;
    id v12 = v15;
    id v27 = v12;
    dispatch_async(v16, v26);
    v17 = v27;
  }
  else
  {
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_1000EC450;
    v23 = &unk_100253B08;
    id v24 = v4;
    v25 = self;
    v18 = objc_retainBlock(&v20);
    -[CESRTaskCoalescer submitTaskWithId:taskBlock:completion:](self->_taskCoalescer, "submitTaskWithId:taskBlock:completion:", 0, v18, 0, v20, v21, v22, v23);

    v17 = v24;
  }

  BOOL v9 = 1;
LABEL_23:

  return v9;
}

- (BOOL)_adminServiceShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 valueForEntitlement:@"com.apple.corespeech.corespeechd.speechprofileadmin"];

  if (v5)
  {
    *(void *)v19 = 0;
    *(void *)&v19[8] = v19;
    *(void *)&v19[16] = 0x3032000000;
    v20 = sub_1000EC7C8;
    uint64_t v21 = sub_1000EC7D8;
    id v22 = 0;
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000EC7E0;
    v14[3] = &unk_100253A90;
    v14[4] = self;
    v14[5] = v19;
    dispatch_sync(queue, v14);
    unsigned int v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CESRSpeechProfileAdminService];
    [v4 setExportedInterface:v7];

    id v8 = [*(id *)(*(void *)&v19[8] + 40) adminService];
    [v4 setExportedObject:v8];

    [v4 resume];
    BOOL v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unsigned int v10 = [v4 processIdentifier];
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSPDispatcher _adminServiceShouldAcceptNewConnection:]";
      __int16 v17 = 1024;
      unsigned int v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s New connection established to process with pid=(%d)", buf, 0x12u);
    }

    _Block_object_dispose(v19, 8);
  }
  else
  {
    id v11 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      id v12 = v11;
      *(_DWORD *)v19 = 136315394;
      *(void *)&v19[4] = "-[CSPDispatcher _adminServiceShouldAcceptNewConnection:]";
      *(_WORD *)&v19[12] = 1024;
      *(_DWORD *)&v19[14] = [v4 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Connecting process with pid=(%d) is not entitled for the speech profile admin service - rejecting connection.", v19, 0x12u);
    }
  }

  return v5 != 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_adminServiceListener == v6)
  {
    BOOL v9 = [(CSPDispatcher *)self _adminServiceShouldAcceptNewConnection:v7];
  }
  else
  {
    id v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      id v12 = "-[CSPDispatcher listener:shouldAcceptNewConnection:]";
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Unrecognized listener passed to delegate: %@", (uint8_t *)&v11, 0x16u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_listenerWithMachServiceName:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v6];

  [v7 setDelegate:v5];
  [v7 resume];
  return v7;
}

- (void)_notifyChangeToSets:(id)a3
{
  id v4 = a3;
  id v5 = +[CESRSpeechProfileEvaluationStatus sharedStatus];
  unsigned int v6 = [v5 isEvaluationEnabled];

  if (v6)
  {
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSPDispatcher _notifyChangeToSets:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Ignoring Cascade change notification because evaluation is enabled.", buf, 0xCu);
    }
  }
  else
  {
    id v8 = (void *)os_transaction_create();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000ECB38;
    v11[3] = &unk_100253540;
    v11[4] = self;
    id v12 = v4;
    id v13 = v8;
    id v9 = v8;
    unsigned int v10 = objc_retainBlock(v11);
    dispatch_async((dispatch_queue_t)self->_queue, v10);
  }
}

- (void)setupXPCListeners
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("CSPDispatcher Set Change Queue", v3);

  id v5 = objc_alloc((Class)CCSetChangeXPCListener);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000ECC98;
  v10[3] = &unk_1002516B0;
  v10[4] = self;
  unsigned int v6 = (CCSetChangeXPCListener *)[v5 initWithIdentifier:@"com.apple.corespeechd" batchHandlerBlock:v10 queue:v4 useCase:CESRSpeechProfileUseCaseIdentifier];
  setChangeListener = self->_setChangeListener;
  self->_setChangeListener = v6;

  if (CSIsInternalBuild())
  {
    id v8 = [(CSPDispatcher *)self _listenerWithMachServiceName:@"com.apple.corespeech.corespeechd.speechprofileadmin.service" delegate:self];
    adminServiceListener = self->_adminServiceListener;
    self->_adminServiceListener = v8;
  }
}

- (void)registerXPCActivities
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_POST_INSTALL, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  v3 = (const char *)XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY;
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  sub_100023FE8("com.apple.siri.xpc_activity.post-install-speech-profile-migration", v2, &stru_10024E7F8);

  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(xdict, v3, 0);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  sub_100023FE8("com.apple.siri.xpc_activity.daily-speech-profile-maintenance", xdict, &stru_10024E818);
}

- (id)_adminServiceProvider
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  adminServiceProvider = self->_adminServiceProvider;
  if (!adminServiceProvider)
  {
    id v4 = objc_alloc((Class)CESRSpeechProfileAdminServiceFactory);
    queue = self->_queue;
    unsigned int v6 = [(CSPDispatcher *)self _speechProfileSiteManager];
    id v7 = (CESRSpeechProfileAdminServiceProvider *)[v4 initWithQueue:queue speechProfileSiteManager:v6];
    id v8 = self->_adminServiceProvider;
    self->_adminServiceProvider = v7;

    adminServiceProvider = self->_adminServiceProvider;
  }
  return adminServiceProvider;
}

- (id)_speechProfileSiteManager
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  speechProfileSiteManager = self->_speechProfileSiteManager;
  if (!speechProfileSiteManager)
  {
    id v4 = +[CESRSpeechProfileSiteManager defaultManager];
    id v5 = self->_speechProfileSiteManager;
    self->_speechProfileSiteManager = v4;

    speechProfileSiteManager = self->_speechProfileSiteManager;
  }
  return speechProfileSiteManager;
}

- (id)_defaultTaskCoalescerWithQueue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)CESRTaskCoalescer);
  id v5 = (objc_class *)objc_opt_class();
  unsigned int v6 = NSStringFromClass(v5);
  id v7 = [v4 initWithManagerName:v6 coalescenceInterval:v3 coalescenceDelay:10.0 executionQueue:2.0];

  return v7;
}

- (id)_initWithQueue:(id)a3 adminServiceProvider:(id)a4 speechProfileSiteManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CSPDispatcher;
  id v12 = [(CSPDispatcher *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    uint64_t v14 = [(CSPDispatcher *)v13 _defaultTaskCoalescerWithQueue:v9];
    taskCoalescer = v13->_taskCoalescer;
    v13->_taskCoalescer = (CESRTaskCoalescer *)v14;

    objc_storeStrong((id *)&v13->_adminServiceProvider, a4);
    objc_storeStrong((id *)&v13->_speechProfileSiteManager, a5);
    v16 = +[CESRSpeechProfileResourceMonitor sharedMonitor];
    [v16 addObserver:v13];
  }
  return v13;
}

- (id)_initWithQueue:(id)a3
{
  return [(CSPDispatcher *)self _initWithQueue:a3 adminServiceProvider:0 speechProfileSiteManager:0];
}

- (CSPDispatcher)init
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"init unsupported" userInfo:&__NSDictionary0__struct];
  objc_exception_throw(v2);
}

+ (id)sharedDispatcher
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED2B8;
  block[3] = &unk_100253478;
  block[4] = a1;
  if (qword_1002A39B8 != -1) {
    dispatch_once(&qword_1002A39B8, block);
  }
  id v2 = (void *)qword_1002A39C0;
  return v2;
}

@end