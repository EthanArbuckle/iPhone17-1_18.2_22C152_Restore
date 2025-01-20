@interface GEOAPShowEvalHandler
- (intptr_t)visit;
- (void)dailyUsageActionType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6;
- (void)endEvalData;
- (void)evalData:(id)a3 ofType:(unint64_t)a4 createTime:(id)a5;
- (void)initWithShowVisitorBlock:(void *)a1;
- (void)initWithStreamLogMsgBlock:(void *)a3 dailyUsageBlock:(void *)a4 monthlyUsageBlock:;
- (void)logMsg:(id)a3;
- (void)monthlyUsageActionType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6;
- (void)stream;
@end

@implementation GEOAPShowEvalHandler

- (void)initWithShowVisitorBlock:(void *)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)GEOAPShowEvalHandler;
    a1 = objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      uint64_t v4 = +[GEOAPServiceRemote _daemonConnectionWithExportedClient:]((uint64_t)GEOAPServiceRemote, a1);
      v5 = (void *)a1[1];
      a1[1] = v4;

      uint64_t v6 = [v3 copy];
      v7 = (void *)a1[2];
      a1[2] = v6;

      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      v9 = (void *)a1[3];
      a1[3] = v8;

      v10 = GEOGetGEOAPShowEvalHandlerAnalyticsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = a1[1];
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v11;
        _os_log_impl(&dword_24FE56000, v10, OS_LOG_TYPE_DEBUG, "hello: %@", buf, 0xCu);
      }
    }
  }

  return a1;
}

- (intptr_t)visit
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (result)
  {
    intptr_t v1 = result;
    v2 = GEOGetGEOAPShowEvalHandlerAnalyticsLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315138;
      v5 = "-[GEOAPShowEvalHandler visit]";
      _os_log_impl(&dword_24FE56000, v2, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v4, 0xCu);
    }

    id v3 = [*(id *)(v1 + 8) remoteObjectProxy];
    [v3 showEvalData];

    return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v1 + 24), 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

- (void)evalData:(id)a3 ofType:(unint64_t)a4 createTime:(id)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a3;
  v9 = GEOGetGEOAPShowEvalHandlerAnalyticsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[GEOAPShowEvalHandler evalData:ofType:createTime:]";
    _os_log_impl(&dword_24FE56000, v9, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v10, 0xCu);
  }

  (*((void (**)(void))self->_visitorBlock + 2))();
}

- (void)endEvalData
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_wait);
  [(NSXPCConnection *)self->_xpcConn invalidate];
  xpcConn = self->_xpcConn;
  self->_xpcConn = 0;
}

- (void)initWithStreamLogMsgBlock:(void *)a3 dailyUsageBlock:(void *)a4 monthlyUsageBlock:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)GEOAPShowEvalHandler;
    a1 = objc_msgSendSuper2(&v21, sel_init);
    if (a1)
    {
      uint64_t v10 = +[GEOAPServiceRemote _daemonConnectionWithExportedClient:]((uint64_t)GEOAPServiceRemote, a1);
      uint64_t v11 = (void *)a1[1];
      a1[1] = v10;

      uint64_t v12 = GEOGetGEOAPShowEvalHandlerAnalyticsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = a1[1];
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v13;
        _os_log_impl(&dword_24FE56000, v12, OS_LOG_TYPE_DEBUG, "hello: %@", buf, 0xCu);
      }

      uint64_t v14 = MEMORY[0x25337B980](v7);
      uint64_t v15 = (void *)a1[4];
      a1[4] = v14;

      uint64_t v16 = MEMORY[0x25337B980](v8);
      v17 = (void *)a1[5];
      a1[5] = v16;

      uint64_t v18 = MEMORY[0x25337B980](v9);
      v19 = (void *)a1[6];
      a1[6] = v18;
    }
  }

  return a1;
}

- (void)stream
{
  if (a1)
  {
    id v1 = [*(id *)(a1 + 8) remoteObjectProxy];
    [v1 streamEvalData];
  }
}

- (void)logMsg:(id)a3
{
}

- (void)dailyUsageActionType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6
{
}

- (void)monthlyUsageActionType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_streamMonthlyUsageBlock, 0);
  objc_storeStrong(&self->_streamDailyUsageBlock, 0);
  objc_storeStrong(&self->_streamLogMsgBlock, 0);
  objc_storeStrong((id *)&self->_wait, 0);
  objc_storeStrong(&self->_visitorBlock, 0);
  objc_storeStrong((id *)&self->_xpcConn, 0);
}

@end