@interface GEOAPServiceRemote
+ (id)_daemonConnectionWithExportedClient:(uint64_t)a1;
+ (id)_daemonConnectionWithExportedProtocol:(id)a3 instance:(id)a4;
+ (id)_daemonConnectionWithMapsDebugPanelExportedClient:(uint64_t)a1;
- (GEOAPServiceRemote)init;
- (id)_sharedDaemonConnection;
- (void)dealloc;
- (void)flushEvalData;
- (void)flushUploadHistoryWithCompletion:(id)a3;
- (void)reportDailySettings:(id)a3 completion:(id)a4;
- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7;
- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5;
- (void)runAggregationTasks;
- (void)setEvalMode:(BOOL)a3;
- (void)showEvalDataWithVisitorBlock:(id)a3;
- (void)showHistoryOfAge:(unsigned int)a3 withVisitorBlock:(id)a4 completion:(id)a5;
- (void)showInflightUploadsWithVisitorBlock:(id)a3 completion:(id)a4;
- (void)showUploadCounts:(id)a3;
- (void)streamWithLogMsgBlock:(id)a3 dailyUsageBlock:(id)a4 monthlyUsageBlock:(id)a5;
@end

@implementation GEOAPServiceRemote

- (GEOAPServiceRemote)init
{
  v11.receiver = self;
  v11.super_class = (Class)GEOAPServiceRemote;
  v2 = [(GEOAPServiceRemote *)&v11 init];
  v3 = v2;
  if (v2)
  {
    daemonSvc = v2->_daemonSvc;
    v2->_daemonSvc = 0;

    conn = v3->_conn;
    v3->_conn = 0;

    uint64_t v6 = geo_isolater_create();
    xpcIso = v3->_xpcIso;
    v3->_xpcIso = (geo_isolater *)v6;

    v8 = GEOGetGEOAPRemoteAnalyticsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_24FE56000, v8, OS_LOG_TYPE_DEBUG, "hello", v10, 2u);
    }
  }
  return v3;
}

uint64_t __60__GEOAPServiceRemote_reportLogMsg_uploadBatchId_completion___block_invoke(uint64_t a1)
{
  v2 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24FE56000, v2, OS_LOG_TYPE_DEBUG, "reportLogMsg completed", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __87__GEOAPServiceRemote_reportDailyUsageCountType_usageString_usageBool_appId_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    v7 = "-[GEOAPServiceRemote reportDailyUsageCountType:usageString:usageBool:appId:completion:]_block_invoke";
    _os_log_impl(&dword_24FE56000, v4, OS_LOG_TYPE_DEBUG, "complete %s", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  v10 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[GEOAPServiceRemote reportLogMsg:uploadBatchId:completion:]";
    _os_log_impl(&dword_24FE56000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  objc_super v11 = [(GEOAPServiceRemote *)self _sharedDaemonConnection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__GEOAPServiceRemote_reportLogMsg_uploadBatchId_completion___block_invoke;
  v13[3] = &unk_265345558;
  id v14 = v8;
  id v12 = v8;
  [v11 reportLogMsg:v9 uploadBatchId:a4 completion:v13];
}

- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[GEOAPServiceRemote reportDailyUsageCountType:usageString:usageBool:appId:completion:]";
    _os_log_impl(&dword_24FE56000, v16, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  uint64_t v17 = [(GEOAPServiceRemote *)self _sharedDaemonConnection];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __87__GEOAPServiceRemote_reportDailyUsageCountType_usageString_usageBool_appId_completion___block_invoke;
  v19[3] = &unk_26534A100;
  id v20 = v12;
  id v18 = v12;
  [v17 reportDailyUsageCountType:v10 usageString:v15 usageBool:v14 appId:v13 completion:v19];
}

- (id)_sharedDaemonConnection
{
  objc_super v11 = self->_xpcIso;
  _geo_isolate_lock();
  daemonSvc = self->_daemonSvc;
  if (daemonSvc)
  {
    v4 = daemonSvc;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2701853E0];
    int v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.geoanalyticsd" options:4096];
    [v6 setRemoteObjectInterface:v5];
    [v6 setInterruptionHandler:&__block_literal_global_99];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__GEOAPServiceRemote__sharedDaemonConnection__block_invoke_100;
    v10[3] = &unk_2653454E0;
    v10[4] = self;
    [v6 setInvalidationHandler:v10];
    [v6 resume];
    objc_storeStrong((id *)&self->_conn, v6);
    v7 = [(NSXPCConnection *)self->_conn remoteObjectProxy];
    id v8 = self->_daemonSvc;
    self->_daemonSvc = v7;

    v4 = self->_daemonSvc;
  }
  _geo_isolate_unlock();

  return v4;
}

+ (id)_daemonConnectionWithExportedProtocol:(id)a3 instance:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F08D80];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 interfaceWithProtocol:&unk_2701853E0];
  id v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:v7];

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.geoanalyticsd" options:4096];
  [v10 setRemoteObjectInterface:v8];
  [v10 setExportedInterface:v9];
  [v10 setExportedObject:v6];

  [v10 setInterruptionHandler:&__block_literal_global_17];
  [v10 setInvalidationHandler:&__block_literal_global_75];
  [v10 resume];

  return v10;
}

void __69__GEOAPServiceRemote__daemonConnectionWithExportedProtocol_instance___block_invoke()
{
  v0 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_24FE56000, v0, OS_LOG_TYPE_INFO, "xpc connection with export interrupted", v1, 2u);
  }
}

void __69__GEOAPServiceRemote__daemonConnectionWithExportedProtocol_instance___block_invoke_73()
{
  v0 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_24FE56000, v0, OS_LOG_TYPE_INFO, "xpc connection with export invalidated", v1, 2u);
  }
}

+ (id)_daemonConnectionWithExportedClient:(uint64_t)a1
{
  id v2 = a2;
  id v3 = [self _daemonConnectionWithExportedProtocol:&unk_27016C9A0 instance:v2];

  return v3;
}

+ (id)_daemonConnectionWithMapsDebugPanelExportedClient:(uint64_t)a1
{
  id v2 = a2;
  id v3 = [self _daemonConnectionWithExportedProtocol:&unk_27016CB30 instance:v2];

  return v3;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_conn invalidate];
  v3.receiver = self;
  v3.super_class = (Class)GEOAPServiceRemote;
  [(GEOAPServiceRemote *)&v3 dealloc];
}

void __45__GEOAPServiceRemote__sharedDaemonConnection__block_invoke()
{
  v0 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_24FE56000, v0, OS_LOG_TYPE_INFO, "xpc connection interrupted", v1, 2u);
  }
}

uint64_t __45__GEOAPServiceRemote__sharedDaemonConnection__block_invoke_100()
{
  v0 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24FE56000, v0, OS_LOG_TYPE_INFO, "xpc connection invalidated", buf, 2u);
  }

  return geo_isolate_sync();
}

void __45__GEOAPServiceRemote__sharedDaemonConnection__block_invoke_101(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (void)reportDailySettings:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[GEOAPServiceRemote reportDailySettings:completion:]";
    _os_log_impl(&dword_24FE56000, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v9 = [(GEOAPServiceRemote *)self _sharedDaemonConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__GEOAPServiceRemote_reportDailySettings_completion___block_invoke;
  v11[3] = &unk_26534A100;
  id v12 = v6;
  id v10 = v6;
  [v9 reportDailySettings:v7 completion:v11];
}

void __53__GEOAPServiceRemote_reportDailySettings_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[GEOAPServiceRemote reportDailySettings:completion:]_block_invoke";
    _os_log_impl(&dword_24FE56000, v4, OS_LOG_TYPE_DEBUG, "complete %s", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)setEvalMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[GEOAPServiceRemote setEvalMode:]";
    _os_log_impl(&dword_24FE56000, v5, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [(GEOAPServiceRemote *)self _sharedDaemonConnection];
  [v6 setEvalMode:v3];
}

- (void)flushEvalData
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    int v6 = "-[GEOAPServiceRemote flushEvalData]";
    _os_log_impl(&dword_24FE56000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(GEOAPServiceRemote *)self _sharedDaemonConnection];
  [v4 flushEvalData];
}

- (void)showEvalDataWithVisitorBlock:(id)a3
{
  id v3 = a3;
  v4 = -[GEOAPShowEvalHandler initWithShowVisitorBlock:]([GEOAPShowEvalHandler alloc], v3);

  -[GEOAPShowEvalHandler visit]((intptr_t)v4);
}

- (void)streamWithLogMsgBlock:(id)a3 dailyUsageBlock:(id)a4 monthlyUsageBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = -[GEOAPShowEvalHandler initWithStreamLogMsgBlock:dailyUsageBlock:monthlyUsageBlock:]([GEOAPShowEvalHandler alloc], v9, v8, v7);

  -[GEOAPShowEvalHandler stream]((uint64_t)v10);
  dispatch_time_t v11 = dispatch_time(0, 99999999000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__GEOAPServiceRemote_streamWithLogMsgBlock_dailyUsageBlock_monthlyUsageBlock___block_invoke;
  block[3] = &unk_2653454E0;
  id v14 = v10;
  id v12 = v10;
  dispatch_after(v11, MEMORY[0x263EF83A0], block);
}

void __78__GEOAPServiceRemote_streamWithLogMsgBlock_dailyUsageBlock_monthlyUsageBlock___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_24FE56000, v2, OS_LOG_TYPE_DEBUG, "stream handler %p is exhausted", (uint8_t *)&v4, 0xCu);
  }
}

- (void)runAggregationTasks
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = GEOGetGEOAPRemoteAnalyticsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[GEOAPServiceRemote runAggregationTasks]";
    _os_log_impl(&dword_24FE56000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  int v4 = [(GEOAPServiceRemote *)self _sharedDaemonConnection];
  [v4 runAggregationTasks];
}

- (void)showHistoryOfAge:(unsigned int)a3 withVisitorBlock:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = [[GEOAPShowUploadInfoHandler alloc] initWithHistoryVisitorBlock:v8 completion:v7];

  [(GEOAPShowUploadInfoHandler *)v9 showHistoryOfAge:v6];
}

- (void)showInflightUploadsWithVisitorBlock:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[GEOAPShowUploadInfoHandler alloc] initWithInflightVisitorBlock:v6 completion:v5];

  [(GEOAPShowUploadInfoHandler *)v7 showInflight];
}

- (void)flushUploadHistoryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOAPServiceRemote *)self _sharedDaemonConnection];
  [v5 flushUploadHistoryWithCompletion:v4];
}

- (void)showUploadCounts:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOAPServiceRemote *)self _sharedDaemonConnection];
  [v5 showUploadCounts:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcIso, 0);
  objc_storeStrong((id *)&self->_daemonSvc, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end