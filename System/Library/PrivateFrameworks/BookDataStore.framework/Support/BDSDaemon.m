@interface BDSDaemon
+ (id)daemon;
- (BDSDaemon)init;
- (BDSNotificationConnection)notificationConnection;
- (BDSServiceDelegate)serviceDelegate;
- (BOOL)preflightStartup;
- (BUOSStateHandler)syncUserDefaultsStateHandler;
- (NSXPCListener)serviceListener;
- (OS_dispatch_queue)listenersReadyQueue;
- (OS_dispatch_queue)startupQueue;
- (OS_dispatch_source)sigterm_source;
- (void)dealloc;
- (void)lrq_setupBeforeListenersWithCompletion:(id)a3;
- (void)lrq_setupListeners;
- (void)serviceDelegate:(id)a3 didAcceptConnection:(id)a4;
- (void)setListenersReadyQueue:(id)a3;
- (void)setNotificationConnection:(id)a3;
- (void)setServiceDelegate:(id)a3;
- (void)setServiceListener:(id)a3;
- (void)setSigterm_source:(id)a3;
- (void)setStartupQueue:(id)a3;
- (void)setSyncUserDefaultsStateHandler:(id)a3;
- (void)sq_finishedStartingUp;
- (void)start;
@end

@implementation BDSDaemon

- (void)serviceDelegate:(id)a3 didAcceptConnection:(id)a4
{
  id v5 = a4;
  id v6 = [(BDSDaemon *)self notificationConnection];
  [v6 didAcceptConnection:v5];
}

- (BDSNotificationConnection)notificationConnection
{
  return self->_notificationConnection;
}

+ (id)daemon
{
  if (qword_1002973E8 != -1) {
    dispatch_once(&qword_1002973E8, &stru_10025F6D8);
  }
  v2 = (void *)qword_1002973E0;
  return v2;
}

- (BDSDaemon)init
{
  v14.receiver = self;
  v14.super_class = (Class)BDSDaemon;
  v2 = [(BDSDaemon *)&v14 init];
  if (v2)
  {
    v3 = sub_1000063E8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1001E3B9C();
    }

    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.bookdatastored.xpc-listener-ready", v5);
    listenersReadyQueue = v2->_listenersReadyQueue;
    v2->_listenersReadyQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.bookdatastored.startup-queue", v9);
    startupQueue = v2->_startupQueue;
    v2->_startupQueue = (OS_dispatch_queue *)v10;

    if ((_set_user_dir_suffix() & 1) == 0)
    {
      v12 = sub_1000063E8();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1001E3B08(v12);
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_1000063E8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Daemon shutting down.", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)BDSDaemon;
  [(BDSDaemon *)&v4 dealloc];
}

- (void)start
{
  v3 = sub_1000063E8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Startup: Daemon starting up.", buf, 2u);
  }

  objc_super v4 = [(BDSDaemon *)self listenersReadyQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B730;
  block[3] = &unk_10025F700;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (BOOL)preflightStartup
{
  int v2 = MKBDeviceUnlockedSinceBoot();
  id v3 = [objc_alloc((Class)PDCPreflightManager) initWithTargetQueue:0];
  id v4 = objc_alloc((Class)LSApplicationIdentity);
  id v5 = +[BDSAppBundleIdentifier bdsAppBundleIdentifier];
  id v6 = [v4 initWithBundleIdentifier:v5 URL:0 personaUniqueString:0 personaType:4];

  unsigned int v7 = [v3 requiresPreflightForApplication:v6];
  unsigned int v8 = +[PDCPreflightManager isPreflightFeatureEnabled];
  int v9 = BYSetupAssistantNeedsToRun();
  if (v2 == 1)
  {
    if (v9)
    {
      dispatch_queue_t v10 = sub_1000063E8();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001E3C88();
      }
    }
    else
    {
      if ((v8 & v7) == 0)
      {
        BOOL v11 = 1;
        goto LABEL_11;
      }
      dispatch_queue_t v10 = sub_1000063E8();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001E3CBC();
      }
    }
  }
  else
  {
    dispatch_queue_t v10 = sub_1000063E8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E3CF0();
    }
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)lrq_setupBeforeListenersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSDaemon *)self listenersReadyQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [[BDSServiceDelegate alloc] initWithServiceConnectionClient:self];
  [(BDSDaemon *)self setServiceDelegate:v6];

  id v8 = objc_retainBlock(v4);
  unsigned int v7 = v8;
  if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
    unsigned int v7 = v8;
  }
}

- (void)lrq_setupListeners
{
  id v3 = [(BDSDaemon *)self listenersReadyQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1000063E8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Setting up listeners.", buf, 2u);
  }

  id v5 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.iBooks.BookDataStoreService"];
  [(BDSDaemon *)self setServiceListener:v5];

  id v6 = [(BDSDaemon *)self serviceDelegate];
  unsigned int v7 = [(BDSDaemon *)self serviceListener];
  [v7 setDelegate:v6];

  id v8 = [(BDSDaemon *)self serviceListener];
  [v8 resume];

  uint32_t v9 = notify_post("com.apple.iBooks.BookDataStoreService.Started");
  dispatch_queue_t v10 = sub_1000063E8();
  BOOL v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E3D24(v9, v11);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Posted Service Started notification", v14, 2u);
  }

  v12 = objc_alloc_init(BDSNotificationConnection);
  [(BDSDaemon *)self setNotificationConnection:v12];

  v13 = [(BDSDaemon *)self notificationConnection];
  [v13 startListeningForNotifications];
}

- (void)sq_finishedStartingUp
{
  id v3 = [(BDSDaemon *)self startupQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[BDSSyncUserDefaults makeOSStateHandler];
  [(BDSDaemon *)self setSyncUserDefaultsStateHandler:v4];
}

- (BDSServiceDelegate)serviceDelegate
{
  return self->_serviceDelegate;
}

- (void)setServiceDelegate:(id)a3
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

- (NSXPCListener)serviceListener
{
  return self->_serviceListener;
}

- (void)setServiceListener:(id)a3
{
}

- (BUOSStateHandler)syncUserDefaultsStateHandler
{
  return self->_syncUserDefaultsStateHandler;
}

- (void)setSyncUserDefaultsStateHandler:(id)a3
{
}

- (void)setNotificationConnection:(id)a3
{
}

- (OS_dispatch_source)sigterm_source
{
  return self->_sigterm_source;
}

- (void)setSigterm_source:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigterm_source, 0);
  objc_storeStrong((id *)&self->_notificationConnection, 0);
  objc_storeStrong((id *)&self->_syncUserDefaultsStateHandler, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_listenersReadyQueue, 0);
  objc_storeStrong((id *)&self->_serviceDelegate, 0);
}

@end