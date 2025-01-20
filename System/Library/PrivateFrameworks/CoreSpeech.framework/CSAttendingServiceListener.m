@interface CSAttendingServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSAttendingServiceListener)init;
- (CSAttendingStatesProvidingProxy)attendingStatesProvidingProxy;
- (CSAttendingUsecaseManager)attendingUsecaseManager;
- (NSMutableArray)proxies;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteInterface;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)registerAttendingStatesProvidingProxy:(id)a3;
- (void)registerAttendingUsecaseManager:(id)a3;
- (void)resumeConnection;
- (void)setExportedInterface:(id)a3;
- (void)setListener:(id)a3;
- (void)setProxies:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteInterface:(id)a3;
@end

@implementation CSAttendingServiceListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxies, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_attendingStatesProvidingProxy);
  objc_destroyWeak((id *)&self->_attendingUsecaseManager);
}

- (void)setProxies:(id)a3
{
}

- (NSMutableArray)proxies
{
  return self->_proxies;
}

- (void)setRemoteInterface:(id)a3
{
}

- (NSXPCInterface)remoteInterface
{
  return self->_remoteInterface;
}

- (void)setExportedInterface:(id)a3
{
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSAttendingStatesProvidingProxy)attendingStatesProvidingProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attendingStatesProvidingProxy);
  return (CSAttendingStatesProvidingProxy *)WeakRetained;
}

- (CSAttendingUsecaseManager)attendingUsecaseManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attendingUsecaseManager);
  return (CSAttendingUsecaseManager *)WeakRetained;
}

- (void)resumeConnection
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSAttendingServiceListener resumeConnection]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011C8A4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  v7 = (NSXPCListener *)a4;
  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSAttendingServiceListener listener:shouldAcceptNewConnection:]";
    __int16 v31 = 2112;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Got new connection on attending service: %@", buf, 0x16u);
  }
  if (self->_listener != v6)
  {
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[CSAttendingServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v31 = 2114;
      v32 = v6;
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
    v21 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CSAttendingServiceListener listener:shouldAcceptNewConnection:]";
      v10 = "%s Rejecting connection due to entitlement";
      v11 = v21;
      uint32_t v12 = 12;
      goto LABEL_10;
    }
LABEL_11:
    BOOL v20 = 0;
    goto LABEL_12;
  }
  [(NSXPCListener *)v7 setExportedInterface:self->_exportedInterface];
  [(NSXPCListener *)v7 setRemoteObjectInterface:self->_remoteInterface];
  v13 = [CSAttendingUsecaseProxy alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attendingUsecaseManager);
  id v15 = objc_loadWeakRetained((id *)&self->_attendingStatesProvidingProxy);
  v16 = [(CSAttendingUsecaseProxy *)v13 initWithConnection:v7 usecaseManager:WeakRetained attendingStatesProvidingProxy:v15];

  v17 = [(NSXPCListener *)v7 remoteObjectProxy];
  [(CSAttendingUsecaseProxy *)v16 setupListenerDelegate:v17];

  [(NSXPCListener *)v7 setExportedObject:v16];
  objc_initWeak((id *)buf, v16);
  objc_initWeak(&location, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10011CC7C;
  v25[3] = &unk_1002529E0;
  objc_copyWeak(&v26, (id *)buf);
  objc_copyWeak(&v27, &location);
  [(CSAttendingUsecaseProxy *)v16 setupConnectionErrorHandler:v25];
  v18 = [(CSAttendingServiceListener *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011CD40;
  block[3] = &unk_100253B08;
  block[4] = self;
  v19 = v16;
  v24 = v19;
  dispatch_async(v18, block);

  [(NSXPCListener *)v7 resume];
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  BOOL v20 = 1;
LABEL_12:

  return v20;
}

- (void)dealloc
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[CSAttendingServiceListener dealloc]";
    __int16 v7 = 2114;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Attending service dealloced - %{public}@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAttendingServiceListener;
  [(CSAttendingServiceListener *)&v4 dealloc];
}

- (void)registerAttendingStatesProvidingProxy:(id)a3
{
}

- (void)registerAttendingUsecaseManager:(id)a3
{
}

- (CSAttendingServiceListener)init
{
  v15.receiver = self;
  v15.super_class = (Class)CSAttendingServiceListener;
  v2 = [(CSAttendingServiceListener *)&v15 init];
  if (v2)
  {
    uint64_t v3 = +[CSUtils getSerialQueue:@"CSAttendingServiceListener Queue" qualityOfService:33];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSMutableArray array];
    proxies = v2->_proxies;
    v2->_proxies = (NSMutableArray *)v5;

    __int16 v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.corespeech.corespeechd.attending.service"];
    listener = v2->_listener;
    v2->_listener = v7;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    uint64_t v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CSAttendingService];
    exportedInterface = v2->_exportedInterface;
    v2->_exportedInterface = (NSXPCInterface *)v9;

    uint64_t v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CSAttendingServiceDelegate];
    remoteInterface = v2->_remoteInterface;
    v2->_remoteInterface = (NSXPCInterface *)v11;
  }
  v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSAttendingServiceListener init]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Started listening for attending", buf, 0xCu);
  }
  return v2;
}

@end