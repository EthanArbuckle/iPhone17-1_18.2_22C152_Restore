@interface GEOAPDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (GEOAPDaemon)init;
- (void)_setupSigHandler;
- (void)_shutdown;
- (void)dealloc;
@end

@implementation GEOAPDaemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = sub_100003478();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "new connection : %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = sub_100002C94((id *)[GEOAPDaemonManagerBridge alloc], v4);
  [v4 setExportedObject:v6];

  v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GEOAPXPCDaemonExporting];
  [v4 setExportedInterface:v7];

  [v4 resume];
  return 1;
}

- (GEOAPDaemon)init
{
  v12.receiver = self;
  v12.super_class = (Class)GEOAPDaemon;
  v2 = [(GEOAPDaemon *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_shutdownRequested = 0;
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("GEOAPDaemon", v4);
    serialQ = v3->_serialQ;
    v3->_serialQ = (OS_dispatch_queue *)v5;

    v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.geoanalyticsd"];
    listener = v3->_listener;
    v3->_listener = v7;

    [(NSXPCListener *)v3->_listener setDelegate:v3];
    [(NSXPCListener *)v3->_listener _setQueue:v3->_serialQ];
  }
  int v9 = sub_100003478();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "hello", v11, 2u);
  }

  return v3;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)GEOAPDaemon;
  [(GEOAPDaemon *)&v3 dealloc];
}

- (void)_shutdown
{
  self->_shutdownRequested = 1;
  v2 = sub_10000397C();
  sub_10001A140((uint64_t)v2);

  _xpc_transaction_exit_clean();
}

- (void)_setupSigHandler
{
  signal(15, (void (__cdecl *)(int))1);
  objc_initWeak(&location, self);
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)self->_serialQ);
  sigtermSource = self->_sigtermSource;
  self->_sigtermSource = v3;

  dispatch_queue_t v5 = self->_sigtermSource;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D088;
  v6[3] = &unk_100028A18;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigtermSource, 0);
  objc_storeStrong((id *)&self->_serialQ, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end