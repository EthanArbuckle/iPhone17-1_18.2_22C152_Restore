@interface VCPMADRemoteActivityTask
+ (id)taskWithActivityType:(unint64_t)a3 andCompletionHandler:(id)a4;
- (BOOL)run:(id *)a3;
- (VCPMADRemoteActivityTask)initWithActivityType:(unint64_t)a3 andCompletionHandler:(id)a4;
- (id)connection;
- (void)updateProgress:(double)a3;
@end

@implementation VCPMADRemoteActivityTask

- (VCPMADRemoteActivityTask)initWithActivityType:(unint64_t)a3 andCompletionHandler:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VCPMADRemoteActivityTask;
  v7 = [(VCPMADRemoteActivityTask *)&v12 initWithCompletionHandler:v6];
  v8 = v7;
  if (v7)
  {
    v7->_activityType = a3;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 67109120;
        int v14 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "[MAD BG Service] Initializing activity %d ... ", buf, 8u);
      }
    }
  }

  return v8;
}

+ (id)taskWithActivityType:(unint64_t)a3 andCompletionHandler:(id)a4
{
  id v6 = a4;
  if (a3 <= 0x10 && ((1 << a3) & 0x1140E) != 0 || a3 == 256) {
    id v7 = [objc_alloc((Class)a1) initWithActivityType:a3 andCompletionHandler:v6];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.mediaanalysisd.service.activity" options:0];
    v5 = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    id v6 = self->_connection;
    id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPMADRemoteActivityClientProtocol];
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    v8 = self->_connection;
    v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPMADRemoteActivityServerProtocol];
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&stru_10021E088];
    objc_initWeak(&location, self);
    os_log_type_t v10 = self->_connection;
    objc_super v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    int v14 = sub_1000FCA04;
    v15 = &unk_1002198D0;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v12];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (void)updateProgress:(double)a3
{
  v4 = +[VCPWatchdog sharedWatchdog];
  [v4 pet];

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      int v7 = 134217984;
      double v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[MAD BG Service] %3.1f%% complete", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)run:(id *)a3
{
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 1;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = sub_1000FD3F0;
  v59 = sub_1000FD400;
  id v60 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 1;
  os_log_type_t type = VCPLogToOSLogType[7];
  while (1)
  {
    v4 = +[VCPWatchdog sharedWatchdog];
    [v4 pet];

    if ([(VCPMADRemoteActivityTask *)self isCanceled])
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v19 = VCPLogInstance();
        os_log_type_t v20 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v19, v20))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "[MAD BG Service] Processing canceled", buf, 2u);
        }
      }
      NSErrorUserInfoKey v71 = NSLocalizedDescriptionKey;
      v21 = +[NSString stringWithFormat:@"Processing canceled"];
      v72 = v21;
      v22 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      uint64_t v23 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v22];
      v24 = (void *)v56[5];
      v56[5] = v23;

      *((unsigned char *)v62 + 24) = 0;
LABEL_15:
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v25 = VCPLogInstance();
        os_log_type_t v26 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v25, v26))
        {
          unsigned int v27 = [(id)v56[5] code];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v27;
          _os_log_impl((void *)&_mh_execute_header, v25, v26, "[MAD BG Service] finished (%d)", buf, 8u);
        }
      }
      if (a3)
      {
        v28 = (void *)v56[5];
        if (v28)
        {
          id v29 = [v28 copy];
          id v30 = *a3;
          *a3 = v29;
        }
      }
      BOOL v31 = *((unsigned char *)v62 + 24) != 0;
      goto LABEL_30;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, type))
      {
        unint64_t activityType = self->_activityType;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = activityType;
        _os_log_impl((void *)&_mh_execute_header, v5, type, "[MAD BG Service] Waking background analysis service (%d) ...", buf, 8u);
      }
    }
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    double v8 = [(VCPMADRemoteActivityTask *)self connection];
    v9 = [v8 remoteObjectProxyWithErrorHandler:&stru_10021E0A8];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000FD488;
    v49[3] = &unk_10021E0D0;
    os_log_type_t v10 = v7;
    v50 = v10;
    [v9 wakeWithReply:v49];

    dispatch_time_t v11 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v10, v11)) {
      break;
    }
    objc_super v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    uint64_t v13 = [(VCPMADRemoteActivityTask *)self connection];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000FD558;
    v47[3] = &unk_10021B358;
    int v14 = v12;
    v48 = v14;
    v15 = [v13 remoteObjectProxyWithErrorHandler:v47];
    unint64_t v16 = self->_activityType;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000FD674;
    v42[3] = &unk_10021E0F8;
    v44 = &v55;
    v42[4] = self;
    v45 = &v61;
    v46 = &v51;
    v17 = v14;
    v43 = v17;
    [v15 startActivityWithType:v16 andReply:v42];

    *(void *)buf = 0;
    v66 = buf;
    uint64_t v67 = 0x2020000000;
    int v68 = 0;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000FD930;
    v41[3] = &unk_100219F08;
    v41[4] = self;
    v41[5] = buf;
    v18 = +[VCPTimer timerWithInterval:100 unit:2 oneShot:0 andBlock:v41];
    dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    [v18 destroy];

    _Block_object_dispose(buf, 8);
    if (!*((unsigned char *)v52 + 24)) {
      goto LABEL_15;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v32 = VCPLogInstance();
    os_log_type_t v33 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v32, v33))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "[MAD BG Service] Waking background analysis service timeout; deferring ...",
        buf,
        2u);
    }
  }
  if (a3)
  {
    NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
    v34 = +[NSString stringWithFormat:@"Waking background analysis service timeout; deferring ..."];
    v70 = v34;
    v35 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    v36 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v35];
    id v37 = *a3;
    *a3 = v36;
  }
  BOOL v31 = 0;
LABEL_30:
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  return v31;
}

- (void).cxx_destruct
{
}

@end