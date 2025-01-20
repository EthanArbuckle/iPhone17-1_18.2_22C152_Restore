@interface CSAttendingStatesServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSAttendingStatesProvidingProxy)attendingStatesProvidingProxy;
- (CSAttendingStatesServiceListener)init;
- (NSXPCConnection)activeConnection;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (void)_cleanupConnection:(id)a3 shouldInvalidate:(BOOL)a4;
- (void)listen;
- (void)registerAttendingStatesProvidingProxy:(id)a3;
- (void)setActiveConnection:(id)a3;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSAttendingStatesServiceListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_attendingStatesProvidingProxy);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setActiveConnection:(id)a3
{
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (CSAttendingStatesProvidingProxy)attendingStatesProvidingProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attendingStatesProvidingProxy);
  return (CSAttendingStatesProvidingProxy *)WeakRetained;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  v7 = (NSXPCListener *)a4;
  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[CSAttendingStatesServiceListener listener:shouldAcceptNewConnection:]";
    __int16 v32 = 2112;
    v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Got new connection on attending service: %@", buf, 0x16u);
  }
  if (self->_listener != v6)
  {
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[CSAttendingStatesServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v32 = 2114;
      v33 = v6;
      v10 = "%s Invalid listener - %{public}@";
      v11 = v9;
      uint32_t v12 = 22;
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ((+[CSUtils xpcConnection:v7 hasEntitlement:@"corespeech.corespeechd.attending.service"] & 1) == 0)
  {
    [(NSXPCListener *)v7 invalidate];
    v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[CSAttendingStatesServiceListener listener:shouldAcceptNewConnection:]";
      v10 = "%s Rejecting connection due to entitlement";
      v11 = v18;
      uint32_t v12 = 12;
      goto LABEL_10;
    }
LABEL_11:
    BOOL v17 = 0;
    goto LABEL_12;
  }
  v13 = LBAttendingStatesServiceGetXPCInterface();
  [(NSXPCListener *)v7 setExportedInterface:v13];

  v14 = LBAttendingStatesServiceDelegateGetXPCInterface();
  [(NSXPCListener *)v7 setRemoteObjectInterface:v14];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012616C;
  block[3] = &unk_100253B08;
  v16 = v7;
  v28 = v16;
  v29 = self;
  dispatch_sync(queue, block);
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v16);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10012624C;
  v23[3] = &unk_1002529E0;
  objc_copyWeak(&v24, (id *)buf);
  objc_copyWeak(&v25, &location);
  [(NSXPCListener *)v16 setInterruptionHandler:v23];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100126404;
  v20[3] = &unk_1002529E0;
  objc_copyWeak(&v21, (id *)buf);
  objc_copyWeak(&v22, &location);
  [(NSXPCListener *)v16 setInvalidationHandler:v20];
  [(NSXPCListener *)v16 resume];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  BOOL v17 = 1;
LABEL_12:

  return v17;
}

- (void)_cleanupConnection:(id)a3 shouldInvalidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    v13 = "-[CSAttendingStatesServiceListener _cleanupConnection:shouldInvalidate:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Cleaning up connection: %@", (uint8_t *)&v12, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    id v8 = [(CSAttendingStatesServiceListener *)self activeConnection];

    if (v8 == v6)
    {
      [(CSAttendingStatesServiceListener *)self setActiveConnection:0];
      p_attendingStatesProvidingProxy = &self->_attendingStatesProvidingProxy;
      id WeakRetained = objc_loadWeakRetained((id *)p_attendingStatesProvidingProxy);
      [WeakRetained setRemoteObjectProxy:0];

      id v11 = objc_loadWeakRetained((id *)p_attendingStatesProvidingProxy);
      [v11 attendingStatesXPCDisconnected];

      if (!v4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    if (v4)
    {
LABEL_6:
      [v6 setInvalidationHandler:0];
      [v6 setInterruptionHandler:0];
      [v6 invalidate];
    }
  }
LABEL_7:
}

- (void)registerAttendingStatesProvidingProxy:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001267D4;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)listen
{
  id v3 = objc_alloc((Class)NSXPCListener);
  id v4 = (NSXPCListener *)[v3 initWithMachServiceName:LBAttendingStatesServiceName];
  listener = self->_listener;
  self->_listener = v4;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSAttendingStatesServiceListener listen]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s CSAttendingStatesServiceListener start listening", (uint8_t *)&v7, 0xCu);
  }
}

- (CSAttendingStatesServiceListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAttendingStatesServiceListener;
  v2 = [(CSAttendingStatesServiceListener *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[CSUtils getSerialQueue:@"CSAttendingStatesServiceListener Queue" qualityOfService:33];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end