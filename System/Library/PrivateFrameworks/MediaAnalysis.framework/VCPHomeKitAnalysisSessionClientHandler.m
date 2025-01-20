@interface VCPHomeKitAnalysisSessionClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
- (VCPHomeKitAnalysisSessionClientHandler)init;
- (VCPHomeKitAnalysisSessionClientHandler)initWithXPCConnection:(id)a3;
- (void)analyzer:(id)a3 didAnalyzeFragment:(id)a4;
- (void)analyzer:(id)a3 didProduceResult:(id)a4;
- (void)cancelAllRequests;
- (void)processMessageWithOptions:(id)a3 andReply:(id)a4;
- (void)processVideoFragmentAssetData:(id)a3 withOptions:(id)a4 andReply:(id)a5;
- (void)startSessionWithProperties:(id)a3 andReply:(id)a4;
@end

@implementation VCPHomeKitAnalysisSessionClientHandler

- (VCPHomeKitAnalysisSessionClientHandler)init
{
  return 0;
}

- (VCPHomeKitAnalysisSessionClientHandler)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)VCPHomeKitAnalysisSessionClientHandler;
  v6 = [(VCPHomeKitAnalysisSessionClientHandler *)&v37 init];
  v7 = v6;
  if (v6)
  {
    p_connection = (id *)&v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    uint64_t v9 = VCPTransactionWithName(@"VCPMediaAnalysisClientHandler-requestAssetAnalysis");
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v9;

    [*p_connection setExportedObject:v7];
    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPHomeKitAnalysisSessionServerProtocol];
    v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPHomeKitAnalysisSessionClientProtocol];
    v13 = [sub_10001F350() allowedClasses];
    [v11 setClasses:v13 forSelector:"processVideoFragmentAssetData:withOptions:andReply:" argumentIndex:1 ofReply:0];
    [v11 setClasses:v13 forSelector:"processVideoFragmentAssetData:withOptions:andReply:" argumentIndex:0 ofReply:1];
    [v11 setClasses:v13 forSelector:"processMessageWithOptions:andReply:" argumentIndex:0 ofReply:0];
    [v11 setClasses:v13 forSelector:"processMessageWithOptions:andReply:" argumentIndex:0 ofReply:1];
    [v11 setClasses:v13 forSelector:"startSessionWithProperties:andReply:" argumentIndex:0 ofReply:0];
    [v12 setClasses:v13 forSelector:"processResults:withReply:" argumentIndex:0 ofReply:0];
    [*p_connection setExportedInterface:v11];
    [*p_connection setRemoteObjectInterface:v12];
    objc_initWeak(&location, v7);
    id v14 = *p_connection;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001F434;
    v34[3] = &unk_1002198D0;
    objc_copyWeak(&v35, &location);
    [v14 setInterruptionHandler:v34];
    id v15 = *p_connection;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10001F540;
    v32[3] = &unk_1002198D0;
    objc_copyWeak(&v33, &location);
    [v15 setInvalidationHandler:v32];
    uint64_t v16 = [*p_connection remoteObjectProxy];
    clientProxy = v7->_clientProxy;
    v7->_clientProxy = (VCPHomeKitAnalysisSessionClientProtocol *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.mediaanalysisd.homekitclientmanagment", 0);
    managementQueue = v7->_managementQueue;
    v7->_managementQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.mediaanalysisd.homekitclienttask", 0);
    taskQueue = v7->_taskQueue;
    v7->_taskQueue = (OS_dispatch_queue *)v20;

    dispatch_group_t v22 = dispatch_group_create();
    runningFragmentGroup = v7->_runningFragmentGroup;
    v7->_runningFragmentGroup = (OS_dispatch_group *)v22;

    dispatch_group_t v24 = dispatch_group_create();
    runningMessageGroup = v7->_runningMessageGroup;
    v7->_runningMessageGroup = (OS_dispatch_group *)v24;

    uint64_t v26 = +[NSMutableDictionary dictionary];
    taskIDMapping = v7->_taskIDMapping;
    v7->_taskIDMapping = (NSMutableDictionary *)v26;

    analyzer = v7->_analyzer;
    v7->_analyzer = 0;

    v7->_nextTaskID = 1;
    v29 = objc_alloc_init(MADScopedWatchdog);
    scopedWatchdog = v7->_scopedWatchdog;
    v7->_scopedWatchdog = v29;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
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

- (void)startSessionWithProperties:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (self->_analyzer)
  {
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    v8 = +[NSString stringWithFormat:@"Session already started"];
    v21 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v9];
    v7[2](v7, v10);

    id v11 = 0;
  }
  else
  {
    id v17 = 0;
    v12 = [sub_10001F350() analyzerWithOptions:v6 error:&v17];
    id v11 = v17;
    analyzer = self->_analyzer;
    self->_analyzer = v12;

    id v14 = self->_analyzer;
    if (v14)
    {
      [(HMIVideoAnalyzer *)v14 setDelegate:self];
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Error: failed to create HMIVideoAnalyzer: %@", buf, 0xCu);
      }
    }
    v7[2](v7, v11);
  }
}

- (void)processMessageWithOptions:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MADScopedWatchdog *)self->_scopedWatchdog pet];
  taskQueue = self->_taskQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FA00;
  block[3] = &unk_10021A300;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(taskQueue, block);
}

- (void)processVideoFragmentAssetData:(id)a3 withOptions:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Received request to analyze movie", buf, 2u);
    }
  }
  unint64_t nextTaskID = self->_nextTaskID;
  self->_unint64_t nextTaskID = nextTaskID + 1;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001FF60;
  v33[3] = &unk_10021A390;
  v33[4] = self;
  unint64_t v35 = nextTaskID;
  id v14 = v10;
  id v34 = v14;
  id v15 = objc_retainBlock(v33);
  *(void *)buf = 0;
  v30 = buf;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020530;
  block[3] = &unk_10021A3B8;
  block[4] = self;
  unint64_t v28 = nextTaskID;
  id v17 = v14;
  id v26 = v17;
  v27 = buf;
  dispatch_sync(managementQueue, block);
  if (!v30[24])
  {
    taskQueue = self->_taskQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000207C0;
    v19[3] = &unk_10021A430;
    v19[4] = self;
    unint64_t v24 = nextTaskID;
    id v22 = v17;
    id v20 = v8;
    id v21 = v9;
    v23 = v15;
    dispatch_async(taskQueue, v19);
  }
  _Block_object_dispose(buf, 8);
}

- (void)analyzer:(id)a3 didProduceResult:(id)a4
{
}

- (void)analyzer:(id)a3 didAnalyzeFragment:(id)a4
{
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Method not implemented", v6, 2u);
    }
  }
}

- (void)cancelAllRequests
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      os_log_type_t v5 = [(VCPHomeKitAnalysisSessionClientHandler *)self description];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Service %@ to cancel requests", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100021174;
  id v22 = sub_100021184;
  id v23 = 0;
  managementQueue = self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002118C;
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
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        os_log_type_t v12 = +[VCPMADTaskScheduler sharedInstance];
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
  objc_storeStrong((id *)&self->_scopedWatchdog, 0);
  objc_storeStrong((id *)&self->_runningMessageGroup, 0);
  objc_storeStrong((id *)&self->_runningFragmentGroup, 0);
  objc_storeStrong((id *)&self->_taskIDMapping, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end