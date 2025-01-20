@interface DCXPCListener
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DCXPCListener)init;
- (NSXPCListener)listener;
- (OS_dispatch_queue)sigtermQueue;
- (OS_dispatch_source)sigtermSource;
- (void)registerForSigtermObserver;
- (void)setListener:(id)a3;
- (void)setSigtermQueue:(id)a3;
- (void)setSigtermSource:(id)a3;
- (void)start;
@end

@implementation DCXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_100003944();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Incoming connections.. %@", buf, 0xCu);
  }

  v8 = sub_100003944();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client has entitlement", buf, 2u);
  }

  v9 = [[DCClientHandler alloc] initWithConnection:v6];
  v10 = +[DCDeviceMetadataInterface XPCInterface];
  [v6 setExportedInterface:v10];

  [v6 setExportedObject:v9];
  objc_initWeak((id *)buf, v6);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003590;
  v12[3] = &unk_100008370;
  objc_copyWeak(&v13, (id *)buf);
  [v6 setInvalidationHandler:v12];
  [v6 resume];
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (OS_dispatch_queue)sigtermQueue
{
  sigtermQueue = self->_sigtermQueue;
  if (!sigtermQueue)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.devicecheckd.sigterm.queue", v4);
    id v6 = self->_sigtermQueue;
    self->_sigtermQueue = v5;

    sigtermQueue = self->_sigtermQueue;
  }

  return sigtermQueue;
}

- (DCXPCListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)DCXPCListener;
  v2 = [(DCXPCListener *)&v6 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.devicecheckd"];
    [(DCXPCListener *)v2 setListener:v3];

    v4 = [(DCXPCListener *)v2 listener];
    [v4 setDelegate:v2];
  }
  return v2;
}

- (void)start
{
  id v3 = sub_100003944();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DC starting...", v5, 2u);
  }

  [(DCXPCListener *)self registerForSigtermObserver];
  v4 = [(DCXPCListener *)self listener];
  [v4 resume];
}

+ (id)sharedInstance
{
  if (qword_10000D040 != -1) {
    dispatch_once(&qword_10000D040, &stru_100008348);
  }
  v2 = (void *)qword_10000D038;

  return v2;
}

- (void)registerForSigtermObserver
{
  id v3 = sub_100003944();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up SIGTERM observer.", v8, 2u);
  }

  v4 = [(DCXPCListener *)self sigtermQueue];
  dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v4);
  [(DCXPCListener *)self setSigtermSource:v5];

  objc_super v6 = [(DCXPCListener *)self sigtermSource];
  dispatch_source_set_event_handler(v6, &stru_100008390);

  v7 = [(DCXPCListener *)self sigtermSource];
  dispatch_activate(v7);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_source)sigtermSource
{
  return self->_sigtermSource;
}

- (void)setSigtermSource:(id)a3
{
}

- (void)setSigtermQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigtermQueue, 0);
  objc_storeStrong((id *)&self->_sigtermSource, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end