@interface GEOAPShowUploadInfoHandler
- (GEOAPShowUploadInfoHandler)initWithHistoryVisitorBlock:(id)a3 completion:(id)a4;
- (GEOAPShowUploadInfoHandler)initWithInflightVisitorBlock:(id)a3 completion:(id)a4;
- (void)endHistoricalData;
- (void)endInflightData;
- (void)inflightBatchUUID:(id)a3 createTime:(id)a4 analyticSessionType:(int)a5 eventCount:(unsigned int)a6 uploadSize:(unsigned int)a7 urlSessionType:(int)a8 stageNumber:(unsigned int)a9;
- (void)showHistoryOfAge:(unsigned int)a3;
- (void)showInflight;
- (void)uploadHistoryForBatchUUID:(id)a3 endDate:(id)a4 uploadLatency:(unsigned int)a5 analyticSessionType:(int)a6 eventCount:(unsigned int)a7 uploadSize:(unsigned int)a8 urlSessionType:(int)a9 stageNumber:(unsigned int)a10;
@end

@implementation GEOAPShowUploadInfoHandler

- (GEOAPShowUploadInfoHandler)initWithHistoryVisitorBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOAPShowUploadInfoHandler;
  v8 = [(GEOAPShowUploadInfoHandler *)&v16 init];
  if (v8)
  {
    uint64_t v9 = +[GEOAPServiceRemote _daemonConnectionWithMapsDebugPanelExportedClient:]((uint64_t)GEOAPServiceRemote, v8);
    xpcConn = v8->_xpcConn;
    v8->_xpcConn = (NSXPCConnection *)v9;

    uint64_t v11 = [v6 copy];
    id historyVisitorBlock = v8->_historyVisitorBlock;
    v8->_id historyVisitorBlock = (id)v11;

    uint64_t v13 = [v7 copy];
    id completionBlock = v8->_completionBlock;
    v8->_id completionBlock = (id)v13;
  }
  return v8;
}

- (void)showHistoryOfAge:(unsigned int)a3
{
  if (!self->_historyVisitorBlock)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      return;
    }
    __int16 v9 = 0;
    v4 = &_os_log_internal;
    v5 = "Assertion failed: _historyVisitorBlock != ((void *)0)";
    id v6 = (uint8_t *)&v9;
    goto LABEL_11;
  }
  if (!self->_completionBlock)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    v4 = &_os_log_internal;
    v5 = "Assertion failed: _completionBlock != ((void *)0)";
    id v6 = buf;
LABEL_11:
    _os_log_fault_impl(&dword_24FE56000, v4, OS_LOG_TYPE_FAULT, v5, v6, 2u);
    return;
  }
  uint64_t v3 = *(void *)&a3;
  id v7 = [(NSXPCConnection *)self->_xpcConn remoteObjectProxy];
  [v7 showHistoryOfAge:v3];
}

- (void)uploadHistoryForBatchUUID:(id)a3 endDate:(id)a4 uploadLatency:(unsigned int)a5 analyticSessionType:(int)a6 eventCount:(unsigned int)a7 uploadSize:(unsigned int)a8 urlSessionType:(int)a9 stageNumber:(unsigned int)a10
{
}

- (void)endHistoricalData
{
  (*((void (**)(void))self->_completionBlock + 2))();
  [(NSXPCConnection *)self->_xpcConn invalidate];
  xpcConn = self->_xpcConn;
  self->_xpcConn = 0;
}

- (GEOAPShowUploadInfoHandler)initWithInflightVisitorBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOAPShowUploadInfoHandler;
  v8 = [(GEOAPShowUploadInfoHandler *)&v16 init];
  if (v8)
  {
    uint64_t v9 = +[GEOAPServiceRemote _daemonConnectionWithMapsDebugPanelExportedClient:]((uint64_t)GEOAPServiceRemote, v8);
    xpcConn = v8->_xpcConn;
    v8->_xpcConn = (NSXPCConnection *)v9;

    uint64_t v11 = [v6 copy];
    id inflightVisitorBlock = v8->_inflightVisitorBlock;
    v8->_id inflightVisitorBlock = (id)v11;

    uint64_t v13 = [v7 copy];
    id completionBlock = v8->_completionBlock;
    v8->_id completionBlock = (id)v13;
  }
  return v8;
}

- (void)showInflight
{
  if (!self->_inflightVisitorBlock)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      return;
    }
    __int16 v7 = 0;
    v2 = &_os_log_internal;
    uint64_t v3 = "Assertion failed: _inflightVisitorBlock != ((void *)0)";
    v4 = (uint8_t *)&v7;
    goto LABEL_11;
  }
  if (!self->_completionBlock)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    v2 = &_os_log_internal;
    uint64_t v3 = "Assertion failed: _completionBlock != ((void *)0)";
    v4 = buf;
LABEL_11:
    _os_log_fault_impl(&dword_24FE56000, v2, OS_LOG_TYPE_FAULT, v3, v4, 2u);
    return;
  }
  id v5 = [(NSXPCConnection *)self->_xpcConn remoteObjectProxy];
  [v5 showInflight];
}

- (void)inflightBatchUUID:(id)a3 createTime:(id)a4 analyticSessionType:(int)a5 eventCount:(unsigned int)a6 uploadSize:(unsigned int)a7 urlSessionType:(int)a8 stageNumber:(unsigned int)a9
{
}

- (void)endInflightData
{
  (*((void (**)(void))self->_completionBlock + 2))();
  [(NSXPCConnection *)self->_xpcConn invalidate];
  xpcConn = self->_xpcConn;
  self->_xpcConn = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_inflightVisitorBlock, 0);
  objc_storeStrong(&self->_historyVisitorBlock, 0);
  objc_storeStrong((id *)&self->_xpcConn, 0);
}

@end