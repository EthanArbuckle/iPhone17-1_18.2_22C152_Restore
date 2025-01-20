@interface CSConnectionListener
+ (id)createSmartSiriVolumeListener;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSConnectionListener)initWithMachService:(id)a3 withServiceInterface:(id)a4 withServiceObject:(id)a5 withDelegateInterface:(id)a6;
- (CSConnectionListener)initWithMachService:(id)a3 withServiceInterface:(id)a4 withServiceObject:(id)a5 withDelegateInterface:(id)a6 queue:(id)a7;
- (CSConnectionListener)initWithXpcListener:(id)a3 withMachService:(id)a4 withServiceInterface:(id)a5 withServiceObject:(id)a6 withDelegateInterface:(id)a7 queue:(id)a8;
- (NSMutableArray)clientConnections;
- (NSString)machServiceName;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)notifyClientsWithBlock:(id)a3;
- (void)resumeConnection;
- (void)setClientConnections:(id)a3;
- (void)setMachServiceName:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSConnectionListener

+ (id)createSmartSiriVolumeListener
{
  if (+[CSUtils supportSmartVolume])
  {
    if (qword_1002A3820 != -1) {
      dispatch_once(&qword_1002A3820, &stru_100250178);
    }
    id v2 = (id)qword_1002A3818;
  }
  else
  {
    v3 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "+[CSConnectionListener(SmartSiriVolume) createSmartSiriVolumeListener]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume not supported on this platform - Bailing out", (uint8_t *)&v5, 0xCu);
    }
    id v2 = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong(&self->_proxyObject, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)setMachServiceName:(id)a3
{
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setClientConnections:(id)a3
{
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)resumeConnection
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    machServiceName = self->_machServiceName;
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSConnectionListener resumeConnection]";
    __int16 v9 = 2114;
    v10 = machServiceName;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s [Service:%{public}@]", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001494A4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifyClientsWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100149580;
  block[3] = &unk_100252A08;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    machServiceName = self->_machServiceName;
    *(_DWORD *)buf = 136315394;
    v28 = "-[CSConnectionListener listener:shouldAcceptNewConnection:]";
    __int16 v29 = 2114;
    v30 = machServiceName;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Got connection on service %{public}@", buf, 0x16u);
  }
  if (self->_listener != v6)
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v11 = self->_machServiceName;
      *(_DWORD *)buf = 136315650;
      v28 = "-[CSConnectionListener listener:shouldAcceptNewConnection:]";
      __int16 v29 = 2114;
      v30 = v11;
      __int16 v31 = 2114;
      v32 = v6;
      v12 = "%s [Service:%{public}@] Invalid listener - %{public}@";
      v13 = v10;
      uint32_t v14 = 32;
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ((+[CSUtils xpcConnection:v7 hasEntitlement:@"corespeech.corespeechd.xpc"] & 1) == 0)
  {
    [v7 invalidate];
    v17 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v18 = self->_machServiceName;
      *(_DWORD *)buf = 136315394;
      v28 = "-[CSConnectionListener listener:shouldAcceptNewConnection:]";
      __int16 v29 = 2114;
      v30 = v18;
      v12 = "%s Rejecting connection to %{public}@ due to entitlement";
      v13 = v17;
      uint32_t v14 = 22;
      goto LABEL_10;
    }
LABEL_11:
    BOOL v16 = 0;
    goto LABEL_12;
  }
  [v7 setExportedInterface:self->_exportedInterface];
  [v7 setExportedObject:self->_proxyObject];
  [v7 setRemoteObjectInterface:self->_remoteInterface];
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v7);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100149C4C;
  v23[3] = &unk_1002529E0;
  objc_copyWeak(&v24, (id *)buf);
  objc_copyWeak(&v25, &location);
  [v7 setInterruptionHandler:v23];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100149DF8;
  v20[3] = &unk_1002529E0;
  objc_copyWeak(&v21, (id *)buf);
  objc_copyWeak(&v22, &location);
  [v7 setInvalidationHandler:v20];
  v15 = [(CSConnectionListener *)self clientConnections];
  [v15 addObject:v7];

  [v7 resume];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
  BOOL v16 = 1;
LABEL_12:

  return v16;
}

- (void)dealloc
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    machServiceName = self->_machServiceName;
    *(_DWORD *)buf = 136315650;
    id v7 = "-[CSConnectionListener dealloc]";
    __int16 v8 = 2114;
    id v9 = machServiceName;
    __int16 v10 = 2114;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Service %{public}@ dealloced - %{public}@", buf, 0x20u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSConnectionListener;
  [(CSConnectionListener *)&v5 dealloc];
}

- (CSConnectionListener)initWithMachService:(id)a3 withServiceInterface:(id)a4 withServiceObject:(id)a5 withDelegateInterface:(id)a6 queue:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v16];
  v18 = [(CSConnectionListener *)self initWithXpcListener:v17 withMachService:v16 withServiceInterface:v15 withServiceObject:v14 withDelegateInterface:v13 queue:v12];

  return v18;
}

- (CSConnectionListener)initWithMachService:(id)a3 withServiceInterface:(id)a4 withServiceObject:(id)a5 withDelegateInterface:(id)a6
{
  return [(CSConnectionListener *)self initWithMachService:a3 withServiceInterface:a4 withServiceObject:a5 withDelegateInterface:a6 queue:0];
}

- (CSConnectionListener)initWithXpcListener:(id)a3 withMachService:(id)a4 withServiceInterface:(id)a5 withServiceObject:(id)a6 withDelegateInterface:(id)a7 queue:(id)a8
{
  id v15 = a3;
  id v16 = (NSString *)a4;
  id v33 = a5;
  id v17 = a6;
  id v31 = a7;
  id v32 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CSConnectionListener;
  v18 = [(CSConnectionListener *)&v34 init];
  v19 = v18;
  if (!v18)
  {
LABEL_22:
    v23 = v19;
    goto LABEL_23;
  }
  if (!v15)
  {
    id v21 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315138;
    v36 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegate"
          "Interface:queue:]";
    id v22 = "%s ERR: XPC listener Name is nil - Bailing out";
LABEL_17:
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
    goto LABEL_18;
  }
  if (!v16)
  {
    id v21 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315138;
    v36 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegate"
          "Interface:queue:]";
    id v22 = "%s ERR: Mach Service Name is nil - Bailing out";
    goto LABEL_17;
  }
  if (!v17)
  {
    id v21 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315138;
    v36 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegate"
          "Interface:queue:]";
    id v22 = "%s ERR: Proxy Object is nil - Bailing out";
    goto LABEL_17;
  }
  if (v33)
  {
    objc_storeStrong((id *)&v18->_listener, a3);
    [(NSXPCListener *)v19->_listener setDelegate:v19];
    objc_storeStrong((id *)&v19->_machServiceName, a4);
    objc_storeStrong((id *)&v19->_exportedInterface, a5);
    objc_storeStrong(&v19->_proxyObject, a6);
    objc_storeStrong((id *)&v19->_remoteInterface, a7);
    if (v32)
    {
      objc_storeStrong((id *)&v19->_queue, a8);
      v20 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDele"
              "gateInterface:queue:]";
        __int16 v37 = 2112;
        v38 = v16;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Set up queue for %@", buf, 0x16u);
      }
    }
    else
    {
      dispatch_queue_t v24 = dispatch_queue_create("com.apple.CoreSpeech.Connection.Listener", 0);
      queue = v19->_queue;
      v19->_queue = (OS_dispatch_queue *)v24;
    }
    [(NSXPCListener *)v19->_listener _setQueue:v19->_queue];
    v26 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clientConnections = v19->_clientConnections;
    v19->_clientConnections = v26;

    v28 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      machServiceName = v19->_machServiceName;
      *(_DWORD *)buf = 136315394;
      v36 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelega"
            "teInterface:queue:]";
      __int16 v37 = 2114;
      v38 = machServiceName;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s Started listening for %{public}@", buf, 0x16u);
    }
    goto LABEL_22;
  }
  id v21 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[CSConnectionListener initWithXpcListener:withMachService:withServiceInterface:withServiceObject:withDelegate"
          "Interface:queue:]";
    id v22 = "%s ERR: Exported interface is nil - Bailing out";
    goto LABEL_17;
  }
LABEL_18:
  v23 = 0;
LABEL_23:

  return v23;
}

@end