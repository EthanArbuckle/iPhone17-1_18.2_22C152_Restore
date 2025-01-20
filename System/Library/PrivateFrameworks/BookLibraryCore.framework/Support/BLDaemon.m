@interface BLDaemon
+ (id)daemon;
- (BLCacheDeleteStorageManager)cacheDeleteManager;
- (BLDaemon)init;
- (BLNotificationService)notificationService;
- (BLService)libraryService;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)libraryServiceListener;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)listenersReadyQueue;
- (OS_dispatch_queue)startupQueue;
- (OS_dispatch_source)sigterm_source;
- (void)_setupForNotifications;
- (void)dealloc;
- (void)lrq_setupBeforeListenersWithCompletion:(id)a3;
- (void)lrq_setupCacheDelete;
- (void)lrq_setupListeners;
- (void)setCacheDeleteManager:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setLibraryService:(id)a3;
- (void)setLibraryServiceListener:(id)a3;
- (void)setListenersReadyQueue:(id)a3;
- (void)setNotificationService:(id)a3;
- (void)setSigterm_source:(id)a3;
- (void)setStartupQueue:(id)a3;
- (void)sq_finishedStartingUp;
- (void)start;
@end

@implementation BLDaemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = BLDaemonLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = [v7 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Connection request from pid=%d", buf, 8u);
  }

  objc_opt_class();
  v9 = [v7 valueForEntitlement:@"com.apple.ibooks.BLService.private"];
  v10 = BUDynamicCast();

  objc_opt_class();
  v11 = [v7 valueForEntitlement:@"com.apple.itunesstored.private"];
  v12 = BUDynamicCast();

  unsigned __int8 v13 = [v10 BOOLValue];
  unsigned __int8 v14 = [v12 BOOLValue];
  v15 = [(BLDaemon *)self libraryService];
  BOOL v16 = v15 == 0;

  if (v16)
  {
    v17 = objc_opt_new();
    [(BLDaemon *)self setLibraryService:v17];
  }
  v18 = [(BLDaemon *)self libraryService];

  BOOL v19 = (v18 != 0) & (v13 | v14);
  if (v19)
  {
    v20 = BLDaemonLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v21 = [v7 processIdentifier];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Accepting new connection from pid %d", buf, 8u);
    }

    id v22 = [(BLDaemon *)self libraryServiceListener];
    BOOL v23 = v22 == v6;

    if (v23)
    {
      v24 = +[BLServiceInterface mainInterface];
      [v7 setExportedInterface:v24];

      v25 = [(BLDaemon *)self libraryService];
      [v7 setExportedObject:v25];
    }
    [v7 resume];
  }
  else
  {
    v26 = [v7 valueForEntitlement:@"com.apple.application-identifier"];
    if (v26)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v26 = 0;
      }
    }
    v27 = @"Service not ready (probably before first unlock)";
    if (v18) {
      v27 = @"Process missing entitlements.";
    }
    v28 = v27;
    v29 = BLDaemonLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      unsigned int v30 = [v7 processIdentifier];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v30;
      *(_WORD *)v39 = 2114;
      *(void *)&v39[2] = v26;
      *(_WORD *)&v39[10] = 2114;
      *(void *)&v39[12] = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Refusing connection to pid %d. (appIdentifier: %{public}@) %{public}@", buf, 0x1Cu);
    }

    if (!v18)
    {
      if (MGGetBoolAnswer())
      {
        uint64_t v31 = getpid();
        uint64_t v34 = 0;
        v35 = &v34;
        uint64_t v36 = 0x2020000000;
        v32 = (void (*)(uint64_t, uint64_t, const __CFString *))off_1001C8210;
        v37 = off_1001C8210;
        if (!off_1001C8210)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)v39 = 3221225472;
          *(void *)&v39[8] = sub_100065D90;
          *(void *)&v39[16] = &unk_1001A2FB0;
          v40 = &v34;
          sub_100065D90((uint64_t)buf);
          v32 = (void (*)(uint64_t, uint64_t, const __CFString *))v35[3];
        }
        _Block_object_dispose(&v34, 8);
        if (!v32) {
          sub_10014D23C();
        }
        v32(v31, 3135094273, @"Service not ready (probably before first unlock)");
      }
      xpc_transaction_exit_clean();
    }
  }
  return v19;
}

- (BLService)libraryService
{
  return self->_libraryService;
}

- (NSXPCListener)libraryServiceListener
{
  return self->_libraryServiceListener;
}

+ (id)daemon
{
  if (qword_1001C8208 != -1) {
    dispatch_once(&qword_1001C8208, &stru_1001A2F00);
  }
  v2 = (void *)qword_1001C8200;

  return v2;
}

- (BLDaemon)init
{
  v20.receiver = self;
  v20.super_class = (Class)BLDaemon;
  v2 = [(BLDaemon *)&v20 init];
  if (v2)
  {
    v3 = BLDaemonLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)BOOL v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Initializing.", v19, 2u);
    }

    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.bookassetd.xpc-listener-ready", v5);
    listenersReadyQueue = v2->_listenersReadyQueue;
    v2->_listenersReadyQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.bookassetd.startup-queue", v9);
    startupQueue = v2->_startupQueue;
    v2->_startupQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unsigned __int8 v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.bookassetd.xpc-dispatch", v13);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = objc_opt_new();
    libraryService = v2->_libraryService;
    v2->_libraryService = (BLService *)v16;
  }
  return v2;
}

- (void)dealloc
{
  v3 = BLDaemonLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Daemon shutting down.", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)BLDaemon;
  [(BLDaemon *)&v4 dealloc];
}

- (void)start
{
  v3 = BLDaemonLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting up.", buf, 2u);
  }

  [(BLDaemon *)self _setupForNotifications];
  objc_super v4 = [(BLDaemon *)self listenersReadyQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100065328;
  block[3] = &unk_1001A0FE8;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)lrq_setupBeforeListenersWithCompletion:(id)a3
{
  id v8 = a3;
  objc_super v4 = [(BLDaemon *)self listenersReadyQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [(BLDaemon *)self libraryService];

  if (v5)
  {
    dispatch_queue_t v6 = [(BLDaemon *)self libraryService];
    [v6 performPreListenerStartupWithCompletion:v8];
  }
  else
  {
    id v7 = objc_retainBlock(v8);
    dispatch_queue_t v6 = v7;
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)lrq_setupListeners
{
  v3 = [(BLDaemon *)self listenersReadyQueue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = BLDaemonLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Setting up listeners.", (uint8_t *)v11, 2u);
  }

  id v5 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.ibooks.BLService"];
  [(BLDaemon *)self setLibraryServiceListener:v5];

  dispatch_queue_t v6 = [(BLDaemon *)self libraryServiceListener];
  [v6 setDelegate:self];

  id v7 = [(BLDaemon *)self libraryServiceListener];
  [v7 resume];

  uint32_t v8 = notify_post(BLDownloadQueueServerStarted);
  if (v8)
  {
    uint32_t v9 = v8;
    dispatch_queue_t v10 = BLDaemonLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error posting ServerStarted notification. NOTIFY_STATUS: %d", (uint8_t *)v11, 8u);
    }
  }
}

- (void)lrq_setupCacheDelete
{
  v3 = [(BLDaemon *)self listenersReadyQueue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000659A0;
  v4[3] = &unk_1001A2F48;
  objc_copyWeak(&v5, &location);
  +[BLCacheDeleteService registerCacheDeleteInfoCallbacks:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)sq_finishedStartingUp
{
  v3 = [(BLDaemon *)self startupQueue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = BLDaemonLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting the library service.", buf, 2u);
  }

  id v5 = [(BLDaemon *)self libraryService];
  [v5 startPendingOperations];

  dispatch_queue_t v6 = objc_alloc_init(BLCacheDeleteStorageManager);
  [(BLDaemon *)self setCacheDeleteManager:v6];

  id v7 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Doing initial calculation of storage usage.", v12, 2u);
  }

  uint32_t v8 = [(BLDaemon *)self cacheDeleteManager];
  [v8 updateAvailableStorage];

  uint32_t v9 = +[NSNotificationCenter defaultCenter];
  dispatch_queue_t v10 = +[NSOperationQueue mainQueue];
  id v11 = [v9 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:v10 usingBlock:&stru_1001A2F88];
}

- (void)_setupForNotifications
{
  id v3 = +[BLNotificationManager sharedInstance];
  objc_super v4 = [BLNotificationService alloc];
  id v7 = [(BLDaemon *)self libraryService];
  id v5 = [v7 automaticDownloadProcessor];
  dispatch_queue_t v6 = [(BLNotificationService *)v4 initWithAutomaticDownloadProcessor:v5];
  [(BLDaemon *)self setNotificationService:v6];
}

- (void)setLibraryService:(id)a3
{
}

- (OS_dispatch_queue)listenersReadyQueue
{
  return self->_listenersReadyQueue;
}

- (void)setListenersReadyQueue:(id)a3
{
}

- (OS_dispatch_queue)startupQueue
{
  return self->_startupQueue;
}

- (void)setStartupQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setLibraryServiceListener:(id)a3
{
}

- (OS_dispatch_source)sigterm_source
{
  return self->_sigterm_source;
}

- (void)setSigterm_source:(id)a3
{
}

- (BLNotificationService)notificationService
{
  return self->_notificationService;
}

- (void)setNotificationService:(id)a3
{
}

- (BLCacheDeleteStorageManager)cacheDeleteManager
{
  return self->_cacheDeleteManager;
}

- (void)setCacheDeleteManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDeleteManager, 0);
  objc_storeStrong((id *)&self->_notificationService, 0);
  objc_storeStrong((id *)&self->_sigterm_source, 0);
  objc_storeStrong((id *)&self->_libraryServiceListener, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_listenersReadyQueue, 0);

  objc_storeStrong((id *)&self->_libraryService, 0);
}

@end