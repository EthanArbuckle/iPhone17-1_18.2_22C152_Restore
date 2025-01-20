@interface _MapsIPCInterface
- (BOOL)_isMapsActive;
- (BOOL)_isMapsRunning;
- (BOOL)canReceiveMessages;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)connection;
- (_MapsIPCInterface)initWithListenerEndpointIdentifier:(id)a3;
- (void)dealloc;
- (void)initializeBrokerConnectionIfNeeded;
- (void)performWithMapsRunning:(id)a3;
@end

@implementation _MapsIPCInterface

- (_MapsIPCInterface)initWithListenerEndpointIdentifier:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_MapsIPCInterface;
  v5 = [(_MapsIPCInterface *)&v19 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    endpointIdentifier = v5->_endpointIdentifier;
    v5->_endpointIdentifier = v6;

    id v8 = +[NSString stringWithFormat:@"com.apple.Maps.IPCInterface.%@", objc_opt_class()];
    v9 = (const char *)[v8 UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    messagingQueue = v5->_messagingQueue;
    v5->_messagingQueue = (OS_dispatch_queue *)v11;

    id v13 = [v8 stringByAppendingString:@".connection"];
    v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    connectionQueue = v5->_connectionQueue;
    v5->_connectionQueue = (OS_dispatch_queue *)v16;

    [(_MapsIPCInterface *)v5 initializeBrokerConnectionIfNeeded];
  }

  return v5;
}

- (void)initializeBrokerConnectionIfNeeded
{
  sub_10001F0F8(OS_LOG_TYPE_INFO, @"MapsIPCInterface initializeBrokerConnectionIfNeeded", v2, v3, v4, v5, v6, v7, v23);
  if (!self->_brokerConnection)
  {
    v9 = +[NSXPCConnection _maps_mapsConnectionBrokerEndpointRecorderConnection];
    brokerConnection = self->_brokerConnection;
    self->_brokerConnection = v9;

    [(NSXPCConnection *)self->_brokerConnection setExportedObject:self];
    dispatch_queue_t v11 = +[NSXPCInterface _maps_mapsConnectionBrokerEndpointSourceInterface];
    [(NSXPCConnection *)self->_brokerConnection setExportedInterface:v11];

    v12 = +[NSXPCInterface _maps_mapsConnectionBrokerEndpointRecorderInterface];
    [(NSXPCConnection *)self->_brokerConnection setRemoteObjectInterface:v12];

    objc_initWeak(&location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100015614;
    v27[3] = &unk_100081658;
    objc_copyWeak(&v28, &location);
    [(NSXPCConnection *)self->_brokerConnection setInvalidationHandler:v27];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10001567C;
    v25[3] = &unk_100081658;
    objc_copyWeak(&v26, &location);
    [(NSXPCConnection *)self->_brokerConnection setInterruptionHandler:v25];
    [(NSXPCConnection *)self->_brokerConnection resume];
    [(NSXPCListener *)self->_xpcListener invalidate];
    id v13 = +[NSXPCListener anonymousListener];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v13;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener resume];
    sub_10001F0F8(OS_LOG_TYPE_INFO, @"MapsIPCInterface Initializing broker connection.", v15, v16, v17, v18, v19, v20, v24);
    v21 = [(NSXPCConnection *)self->_brokerConnection remoteObjectProxy];
    v22 = [(NSXPCListener *)self->_xpcListener endpoint];
    [v21 listenerEndpointDidChange:v22 forIdentifier:self->_endpointIdentifier];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  [(NSXPCListener *)self->_xpcListener invalidate];
  sub_10001F0F8(OS_LOG_TYPE_INFO, @"MapsIPCInterface Tear down broker connection.", v3, v4, v5, v6, v7, v8, (uint64_t)v10.receiver);
  v9 = [(NSXPCConnection *)self->_brokerConnection remoteObjectProxy];
  [v9 listenerEndpointDidChange:0 forIdentifier:self->_endpointIdentifier];

  [(NSXPCConnection *)self->_brokerConnection invalidate];
  [(NSXPCConnection *)self->_connection invalidate];
  v10.receiver = self;
  v10.super_class = (Class)_MapsIPCInterface;
  [(_MapsIPCInterface *)&v10 dealloc];
}

- (BOOL)_isMapsRunning
{
  id v2 = objc_alloc_init((Class)BKSApplicationStateMonitor);
  unsigned int v3 = [v2 applicationStateForApplication:@"com.apple.Maps"];

  return (v3 & 1) == 0 && v3 != 0;
}

- (BOOL)_isMapsActive
{
  id v2 = objc_alloc_init((Class)BKSApplicationStateMonitor);
  unsigned int v3 = [v2 applicationStateForApplication:@"com.apple.Maps"];

  return (v3 & 3) == 0 && v3 != 0;
}

- (BOOL)canReceiveMessages
{
  return [(_MapsIPCInterface *)self _isMapsActive];
}

- (void)performWithMapsRunning:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  if (qword_10009B770 != -1) {
    dispatch_once(&qword_10009B770, &stru_100081678);
  }
  uint64_t v5 = +[FBSOpenApplicationOptions optionsWithDictionary:qword_10009B768];
  sub_10001F0F8(OS_LOG_TYPE_INFO, @"MapsIPCInterface performWithMapsRunning calling openApplication", v6, v7, v8, v9, v10, v11, v13);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100015A20;
  v14[3] = &unk_1000816A0;
  id v15 = v3;
  id v12 = v3;
  [v4 openApplication:@"com.apple.Maps" withOptions:v5 completion:v14];
}

- (NSXPCConnection)connection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_messagingQueue);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100015C8C;
  id v28 = sub_100015C9C;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100015C8C;
  v22 = sub_100015C9C;
  id v23 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015CA4;
  block[3] = &unk_1000816C8;
  block[4] = self;
  block[5] = &v24;
  block[6] = &v18;
  dispatch_sync(connectionQueue, block);
  uint64_t v10 = v19[5];
  if (v10)
  {
    dispatch_time_t v11 = dispatch_walltime(0, 20000000000);
    dispatch_group_wait(v10, v11);
    id v12 = self->_connectionQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100015E40;
    v16[3] = &unk_1000816F0;
    v16[4] = self;
    v16[5] = &v24;
    dispatch_sync(v12, v16);
  }
  else
  {
    sub_10001F0F8(OS_LOG_TYPE_INFO, @"MapsIPCInterface Didn't get a dispatchGroup to wait on", v4, v5, v6, v7, v8, v9, v15);
  }
  id v13 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return (NSXPCConnection *)v13;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6 = (NSXPCListener *)a3;
  id v7 = a4;
  sub_10001F0F8(OS_LOG_TYPE_INFO, @"MapsIPCInterface %s %@ %@", v8, v9, v10, v11, v12, v13, (uint64_t)"-[_MapsIPCInterface listener:shouldAcceptNewConnection:]");
  xpcListener = self->_xpcListener;
  if (xpcListener == v6)
  {
    [(_MapsIPCInterface *)self _configureIncomingConnection:v7];
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000160F0;
    v23[3] = &unk_100081658;
    objc_copyWeak(&v24, &location);
    [v7 setInvalidationHandler:v23];
    [v7 setInterruptionHandler:&stru_100081710];
    connectionQueue = self->_connectionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000161EC;
    block[3] = &unk_100081738;
    id v16 = v7;
    id v21 = v16;
    v22 = self;
    dispatch_sync(connectionQueue, block);
    [v16 resume];
    uint64_t v17 = self->_connectionQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100016244;
    v19[3] = &unk_100080F10;
    v19[4] = self;
    dispatch_async(v17, v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return xpcListener == v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionGroup, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_brokerConnection, 0);

  objc_storeStrong((id *)&self->_messagingQueue, 0);
}

@end