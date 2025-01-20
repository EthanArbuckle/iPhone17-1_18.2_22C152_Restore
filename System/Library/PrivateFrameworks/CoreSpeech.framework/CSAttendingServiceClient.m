@interface CSAttendingServiceClient
- (BOOL)_isAttendingAllowedForUseCase:(int64_t)a3;
- (CSAttendingServiceClient)init;
- (CSAttendingServiceDelegate)delegate;
- (NSXPCConnection)attendingConnection;
- (OS_dispatch_queue)xpcConnectionQueue;
- (id)remoteObjectProxy;
- (void)_createClientConnection;
- (void)_setupRemoteServiceProxyObject;
- (void)attendingStoppedWithReason:(int64_t)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setAttendingConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)setXpcConnectionQueue:(id)a3;
- (void)speechPauseDetected;
- (void)speechStartDetectedWithEventInfo:(id)a3;
- (void)startAttendingWithOptions:(id)a3 completion:(id)a4;
- (void)stopAttendingWithReason:(int64_t)a3;
@end

@implementation CSAttendingServiceClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_attendingConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setAttendingConnection:(id)a3
{
}

- (NSXPCConnection)attendingConnection
{
  return self->_attendingConnection;
}

- (void)setXpcConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return self->_xpcConnectionQueue;
}

- (void)setDelegate:(id)a3
{
}

- (CSAttendingServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAttendingServiceDelegate *)WeakRetained;
}

- (BOOL)_isAttendingAllowedForUseCase:(int64_t)a3
{
  if (a3 != 6 && a3 != 1) {
    return 1;
  }
  v7 = +[CSAttSiriMagusSupportedPolicy sharedInstance];
  unsigned __int8 v8 = [v7 getIsAssetMagusSupported];

  return v8;
}

- (void)_createClientConnection
{
  uint64_t v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.corespeech.corespeechd.attending.service" options:0];
  attendingConnection = self->_attendingConnection;
  self->_attendingConnection = v3;

  uint64_t v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CSAttendingService];
  [(NSXPCConnection *)self->_attendingConnection setRemoteObjectInterface:v5];

  uint64_t v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CSAttendingServiceDelegate];
  uint64_t v22 = objc_opt_class();
  v7 = +[NSArray arrayWithObjects:&v22 count:1];
  unsigned __int8 v8 = +[NSSet setWithArray:v7];
  [v6 setClasses:v8 forSelector:"speechStartDetectedWithEventInfo:" argumentIndex:0 ofReply:0];

  [(NSXPCConnection *)self->_attendingConnection setExportedInterface:v6];
  [(NSXPCConnection *)self->_attendingConnection setExportedObject:self];
  [(NSXPCConnection *)self->_attendingConnection _setQueue:self->_xpcConnectionQueue];
  objc_initWeak(&location, self);
  v9 = self->_attendingConnection;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10012703C;
  v15[3] = &unk_1002533D0;
  objc_copyWeak(&v16, &location);
  [(NSXPCConnection *)v9 setInterruptionHandler:v15];
  v10 = self->_attendingConnection;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001271CC;
  v13[3] = &unk_1002533D0;
  objc_copyWeak(&v14, &location);
  [(NSXPCConnection *)v10 setInvalidationHandler:v13];
  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_attendingConnection;
    *(_DWORD *)buf = 136315394;
    v19 = "-[CSAttendingServiceClient _createClientConnection]";
    __int16 v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Setup connection: %@", buf, 0x16u);
  }
  [(NSXPCConnection *)self->_attendingConnection resume];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_setupRemoteServiceProxyObject
{
  if (!self->_remoteObjectProxy || !self->_attendingConnection)
  {
    uint64_t v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSAttendingServiceClient _setupRemoteServiceProxyObject]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Creating RemoteServiceProxy", buf, 0xCu);
    }
    attendingConnection = self->_attendingConnection;
    if (attendingConnection
      || ([(CSAttendingServiceClient *)self _createClientConnection],
          (attendingConnection = self->_attendingConnection) != 0))
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100127598;
      v8[3] = &unk_100252EB8;
      v8[4] = self;
      uint64_t v5 = [(NSXPCConnection *)attendingConnection synchronousRemoteObjectProxyWithErrorHandler:v8];
      id remoteObjectProxy = self->_remoteObjectProxy;
      self->_id remoteObjectProxy = v5;
    }
    else
    {
      v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v10 = "-[CSAttendingServiceClient _setupRemoteServiceProxyObject]";
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s ERR: _attendingConnection is nil", buf, 0xCu);
      }
      id remoteObjectProxy = self->_remoteObjectProxy;
      self->_id remoteObjectProxy = 0;
    }
  }
}

- (void)speechPauseDetected
{
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[CSAttendingServiceClient speechPauseDetected]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechPauseDetected];
}

- (void)speechStartDetectedWithEventInfo:(id)a3
{
  id v4 = a3;
  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    unsigned __int8 v8 = "-[CSAttendingServiceClient speechStartDetectedWithEventInfo:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechStartDetectedWithEventInfo:v4];
}

- (void)attendingStoppedWithReason:(int64_t)a3
{
  int v5 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    if ((unint64_t)(a3 - 1) > 6) {
      int v7 = @"Default";
    }
    else {
      int v7 = *(&off_1002505B0 + a3 - 1);
    }
    unsigned __int8 v8 = v7;
    int v10 = 136315394;
    v11 = "-[CSAttendingServiceClient attendingStoppedWithReason:]";
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s [reason = %@]", (uint8_t *)&v10, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained attendingStoppedWithReason:a3];
}

- (void)stopAttendingWithReason:(int64_t)a3
{
  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id remoteObjectProxy = self->_remoteObjectProxy;
    int v9 = 136315394;
    int v10 = "-[CSAttendingServiceClient stopAttendingWithReason:]";
    __int16 v11 = 2112;
    id v12 = remoteObjectProxy;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  id v7 = self->_remoteObjectProxy;
  if (v7)
  {
    [v7 stopAttendingWithReason:a3];
  }
  else
  {
    unsigned __int8 v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      int v10 = "-[CSAttendingServiceClient stopAttendingWithReason:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Cannot stop attending since _remoteObjectProxy is nil", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)startAttendingWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  unsigned __int8 v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CSAttendingServiceClient startAttendingWithOptions:completion:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  if (!-[CSAttendingServiceClient _isAttendingAllowedForUseCase:](self, "_isAttendingAllowedForUseCase:", [v6 attendingType]))
  {
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Attending is not allowed for usecase: %lu", [v6 attendingType]);
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSAttendingServiceClient startAttendingWithOptions:completion:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    if (v7)
    {
      uint64_t v14 = CSErrorDomain;
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      v19 = v12;
      v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v16 = +[NSError errorWithDomain:v14 code:2108 userInfo:v15];

      v7[2](v7, 0, v16);
    }
    goto LABEL_15;
  }
  [(CSAttendingServiceClient *)self _setupRemoteServiceProxyObject];
  if (!self->_remoteObjectProxy)
  {
    v17 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSAttendingServiceClient startAttendingWithOptions:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Cannot start attending since unable to setup remoteObjectProxy", buf, 0xCu);
      if (!v7) {
        goto LABEL_16;
      }
    }
    else if (!v7)
    {
      goto LABEL_16;
    }
    id v12 = +[NSError errorWithDomain:CSErrorDomain code:2101 userInfo:0];
    v7[2](v7, 0, v12);
LABEL_15:

    goto LABEL_16;
  }
  int v9 = [v6 deviceId];

  if (v9)
  {
    int v10 = +[CSOpportuneSpeakListenerDeviceManager sharedManager];
    __int16 v11 = [v6 deviceId];
    [v10 setDeviceId:v11];
  }
  [self->_remoteObjectProxy startAttendingWithOptions:v6 completion:v7];
LABEL_16:
}

- (void)dealloc
{
  [(CSAttendingServiceClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSAttendingServiceClient;
  [(CSAttendingServiceClient *)&v3 dealloc];
}

- (void)invalidate
{
  objc_super v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[CSAttendingServiceClient invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(NSXPCConnection *)self->_attendingConnection invalidate];
  attendingConnection = self->_attendingConnection;
  self->_attendingConnection = 0;

  id remoteObjectProxy = self->_remoteObjectProxy;
  self->_id remoteObjectProxy = 0;
}

- (CSAttendingServiceClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSAttendingServiceClient;
  v2 = [(CSAttendingServiceClient *)&v7 init];
  if (v2)
  {
    CSLogInitIfNeeded();
    uint64_t v3 = +[CSUtils getSerialQueue:@"com.apple.corespeech.attending.xpc.connection" qualityOfService:33];
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v3;
  }
  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v9 = "-[CSAttendingServiceClient init]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  return v2;
}

@end