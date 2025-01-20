@interface VCPHomeKitAnalysisClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
+ (id)errorForStatus:(int)a3 withDescription:(id)a4;
- (VCPHomeKitAnalysisClientHandler)init;
- (VCPHomeKitAnalysisClientHandler)initWithXPCConnection:(id)a3;
- (void)cancelAllRequests;
- (void)cancelRequest:(int)a3;
- (void)logStatusForRequest:(int)a3 withError:(id)a4;
- (void)requestAnalysis:(unint64_t)a3 ofFragmentData:(id)a4 withRequestID:(int)a5 properties:(id)a6 andReply:(id)a7;
- (void)requestAnalysis:(unint64_t)a3 ofFragmentSurface:(id)a4 withRequestID:(int)a5 properties:(id)a6 andReply:(id)a7;
- (void)requestResidentMaintenance:(int)a3 withOptions:(id)a4 andReply:(id)a5;
@end

@implementation VCPHomeKitAnalysisClientHandler

- (VCPHomeKitAnalysisClientHandler)init
{
  return 0;
}

- (VCPHomeKitAnalysisClientHandler)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)VCPHomeKitAnalysisClientHandler;
  v6 = [(VCPHomeKitAnalysisClientHandler *)&v36 init];
  v7 = v6;
  if (v6)
  {
    p_connection = (id *)&v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_initWeak(&location, v7);
    [*p_connection setExportedObject:v7];
    v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPHomeKitAnalysisServerProtocol];
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2050000000;
    v10 = (void *)qword_100252468;
    uint64_t v45 = qword_100252468;
    if (!qword_100252468)
    {
      v37 = _NSConcreteStackBlock;
      uint64_t v38 = 3221225472;
      v39 = sub_10001D958;
      v40 = &unk_100219E10;
      v41 = &v42;
      sub_10001D958((uint64_t)&v37);
      v10 = (void *)v43[3];
    }
    v11 = v10;
    _Block_object_dispose(&v42, 8);
    id v12 = objc_alloc_init(v11);
    v13 = [v12 expectedClasses];

    [v9 setClasses:v13 forSelector:"requestAnalysis:ofFragmentData:withRequestID:properties:andReply:" argumentIndex:3 ofReply:0];
    [v9 setClasses:v13 forSelector:"requestAnalysis:ofFragmentData:withRequestID:properties:andReply:" argumentIndex:0 ofReply:1];
    [v9 setClasses:v13 forSelector:"requestAnalysis:ofFragmentSurface:withRequestID:properties:andReply:" argumentIndex:3 ofReply:0];
    [v9 setClasses:v13 forSelector:"requestAnalysis:ofFragmentSurface:withRequestID:properties:andReply:" argumentIndex:0 ofReply:1];
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2050000000;
    v14 = (void *)qword_100252478;
    uint64_t v45 = qword_100252478;
    if (!qword_100252478)
    {
      v37 = _NSConcreteStackBlock;
      uint64_t v38 = 3221225472;
      v39 = sub_10001DB20;
      v40 = &unk_100219E10;
      v41 = &v42;
      sub_10001DB20((uint64_t)&v37);
      v14 = (void *)v43[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v42, 8);
    v16 = [v15 allowedClasses];
    [v9 setClasses:v16 forSelector:"requestResidentMaintenance:withOptions:andReply:" argumentIndex:1 ofReply:0];

    [*p_connection setExportedInterface:v9];
    id v17 = *p_connection;
    v18 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPHomeKitAnalysisClientProtocol];
    [v17 setRemoteObjectInterface:v18];

    id v19 = *p_connection;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10001B3DC;
    v33[3] = &unk_1002198D0;
    objc_copyWeak(&v34, &location);
    [v19 setInterruptionHandler:v33];
    id v20 = *p_connection;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001B498;
    v30[3] = &unk_10021A088;
    objc_copyWeak(&v32, &location);
    v21 = v7;
    v31 = v21;
    [v20 setInvalidationHandler:v30];
    uint64_t v22 = [*p_connection remoteObjectProxy];
    clientProxy = v21->_clientProxy;
    v21->_clientProxy = (VCPHomeKitAnalysisClientProtocol *)v22;

    dispatch_queue_t v24 = dispatch_queue_create("com.apple.mediaanalysisd.homekitclientmanagment", 0);
    managementQueue = v21->_managementQueue;
    v21->_managementQueue = (OS_dispatch_queue *)v24;

    uint64_t v26 = +[NSMutableDictionary dictionary];
    taskIDMapping = v21->_taskIDMapping;
    v21->_taskIDMapping = (NSMutableDictionary *)v26;

    v28 = v21;
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);

    objc_destroyWeak(&location);
  }

  return v7;
}

+ (id)clientHandlerWithXPCConnection:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithXPCConnection:v3];

  return v4;
}

+ (id)errorForStatus:(int)a3 withDescription:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case -128:
      v6 = @"[MAHomeKitClientHandler] Analysis was canceled";
      break;
    case 0:
      v7 = 0;
      goto LABEL_13;
    case -50:
      v6 = @"[MAHomeKitClientHandler] Invalid request ID";
      break;
    default:
      v6 = +[NSString stringWithFormat:@"[MAHomeKitClientHandler] Analysis failed - %@", v5];
      break;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@", buf, 0xCu);
    }
  }
  NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
  v13 = v6;
  v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v7 = +[NSError errorWithDomain:@"HomeKitAnalysisService" code:a3 userInfo:v10];

LABEL_13:
  return v7;
}

- (void)logStatusForRequest:(int)a3 withError:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    if ([v5 code] == (id)-128)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v7 = VCPLogInstance();
        os_log_type_t v8 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v7, v8))
        {
          int v12 = 67109120;
          int v13 = a3;
          os_log_type_t v9 = "Request %d canceled";
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v7, v8, v9, (uint8_t *)&v12, 8u);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v7 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v7, v10))
      {
        v11 = [v6 description];
        int v12 = 67109378;
        int v13 = a3;
        __int16 v14 = 2112;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v7, v10, "Request %d failed (%@)", (uint8_t *)&v12, 0x12u);
      }
      goto LABEL_13;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      int v12 = 67109120;
      int v13 = a3;
      os_log_type_t v9 = "Request %d completed";
      goto LABEL_9;
    }
LABEL_13:
  }
}

- (void)requestAnalysis:(unint64_t)a3 ofFragmentData:(id)a4 withRequestID:(int)a5 properties:(id)a6 andReply:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    __int16 v14 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a5;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Received request %d to analyze movie", buf, 8u);
    }
  }
  v16 = +[VCPWatchdog sharedWatchdog];
  [v16 pet];

  *(void *)buf = 0;
  v40 = buf;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = sub_10001BD08;
  v43 = sub_10001BD18;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestAssetAnalysis");
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10001BD20;
  v37[3] = &unk_1002199D8;
  v37[4] = self;
  int v38 = a5;
  id v17 = objc_retainBlock(v37);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001BD3C;
  v33[3] = &unk_10021A0D8;
  void v33[4] = self;
  int v36 = a5;
  id v18 = v13;
  id v34 = v18;
  v35 = buf;
  id v19 = objc_retainBlock(v33);
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C014;
  block[3] = &unk_10021A100;
  int v32 = a5;
  block[4] = self;
  id v27 = v11;
  id v28 = v12;
  id v29 = v18;
  id v30 = v17;
  id v31 = v19;
  v21 = v19;
  uint64_t v22 = v17;
  id v23 = v12;
  id v24 = v11;
  id v25 = v18;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestAnalysis:(unint64_t)a3 ofFragmentSurface:(id)a4 withRequestID:(int)a5 properties:(id)a6 andReply:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    __int16 v14 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a5;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Received request %d to analyze movie", buf, 8u);
    }
  }
  v16 = +[VCPWatchdog sharedWatchdog];
  [v16 pet];

  *(void *)buf = 0;
  v40 = buf;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = sub_10001BD08;
  v43 = sub_10001BD18;
  VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestAssetAnalysis");
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10001C5E4;
  v37[3] = &unk_1002199D8;
  v37[4] = self;
  int v38 = a5;
  id v17 = objc_retainBlock(v37);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001C600;
  v33[3] = &unk_10021A0D8;
  void v33[4] = self;
  int v36 = a5;
  id v18 = v13;
  id v34 = v18;
  v35 = buf;
  id v19 = objc_retainBlock(v33);
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C8D8;
  block[3] = &unk_10021A100;
  int v32 = a5;
  block[4] = self;
  id v27 = v11;
  id v28 = v12;
  id v29 = v18;
  id v30 = v17;
  id v31 = v19;
  v21 = v19;
  uint64_t v22 = v17;
  id v23 = v12;
  id v24 = v11;
  id v25 = v18;
  dispatch_sync(managementQueue, block);

  _Block_object_dispose(buf, 8);
}

- (void)requestResidentMaintenance:(int)a3 withOptions:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Received resident maintenance request (%d)", buf, 8u);
    }
  }
  id v12 = +[VCPWatchdog sharedWatchdog];
  [v12 pet];

  *(void *)buf = 0;
  id v27 = buf;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_10001BD08;
  id v30 = sub_10001BD18;
  VCPTransactionWithName(@"com.apple.mediaanalysisd.home.maintenance");
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001CDFC;
  v22[3] = &unk_10021A0D8;
  int v25 = a3;
  v22[4] = self;
  id v23 = v9;
  id v24 = buf;
  id v13 = v9;
  __int16 v14 = objc_retainBlock(v22);
  managementQueue = self->_managementQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001CFE8;
  v18[3] = &unk_10021A148;
  int v21 = a3;
  id v19 = v8;
  id v20 = v14;
  v18[4] = self;
  id v16 = v8;
  id v17 = v14;
  dispatch_sync(managementQueue, v18);

  _Block_object_dispose(buf, 8);
}

- (void)cancelRequest:(int)a3
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Received cancel call for %d", buf, 8u);
    }
  }
  *(void *)buf = 0;
  os_log_type_t v15 = buf;
  uint64_t v16 = 0x2020000000;
  managementQueue = self->_managementQueue;
  uint64_t v17 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D53C;
  block[3] = &unk_10021A170;
  block[4] = self;
  void block[5] = buf;
  int v11 = a3;
  dispatch_sync(managementQueue, block);
  if (*((void *)v15 + 3))
  {
    id v8 = +[VCPMADTaskScheduler sharedInstance];
    [v8 cancelTaskWithID:*((void *)v15 + 3)];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 5) {
      goto LABEL_8;
    }
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)id v12 = 67109120;
      int v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Cancellation requested for unknown ID %d", v12, 8u);
    }
  }

LABEL_8:
  _Block_object_dispose(buf, 8);
}

- (void)cancelAllRequests
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = [(VCPHomeKitAnalysisClientHandler *)self description];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Service %@ to cancel requests", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  int v21 = sub_10001BD08;
  uint64_t v22 = sub_10001BD18;
  id v23 = 0;
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D884;
  block[3] = &unk_100219F30;
  block[4] = self;
  void block[5] = &buf;
  dispatch_sync(managementQueue, block);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v12 = +[VCPMADTaskScheduler sharedInstance];
        objc_msgSend(v12, "cancelTaskWithID:", objc_msgSend(v11, "unsignedIntegerValue"));
      }
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&buf, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIDMapping, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end