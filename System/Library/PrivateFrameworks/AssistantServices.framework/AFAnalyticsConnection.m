@interface AFAnalyticsConnection
- (AFAnalyticsConnection)init;
- (BOOL)needsCleanUpConnection;
- (id)_connection;
- (void)_cleanUpConnection;
- (void)_cleanUpConnectionIfNeeded;
- (void)_connectionInterrupted;
- (void)_connectionInvalidated;
- (void)_didFinishSendingEvents:(id)a3;
- (void)_handleFailureCallbackForEvents:(id)a3 error:(id)a4 numberOfRetries:(unint64_t)a5 completion:(id)a6;
- (void)_handleSuccessCallbackForEvents:(id)a3 completion:(id)a4;
- (void)_idleTimerFired;
- (void)_sendEvents:(id)a3 numberOfRetries:(unint64_t)a4 completion:(id)a5;
- (void)_stageUEIEventData:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5;
- (void)_startIdleTimer;
- (void)_stopIdleTimer;
- (void)_willStartSendingEvents:(id)a3;
- (void)beginEventsGrouping;
- (void)boostQueuedEvents:(id)a3;
- (void)dealloc;
- (void)endEventsGrouping;
- (void)flushStagedEventsWithReply:(id)a3;
- (void)logInstrumentationOfType:(id)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5;
- (void)setNeedsCleanUpConnection:(BOOL)a3;
- (void)stageEvents:(id)a3 completion:(id)a4;
- (void)stageUEIEventData:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5;
@end

@implementation AFAnalyticsConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setNeedsCleanUpConnection:(BOOL)a3
{
  self->_needsCleanUpConnection = a3;
}

- (BOOL)needsCleanUpConnection
{
  return self->_needsCleanUpConnection;
}

- (void)_idleTimerFired
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[AFAnalyticsConnection _idleTimerFired]";
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(AFAnalyticsConnection *)self _stopIdleTimer];
  [(AFAnalyticsConnection *)self _cleanUpConnection];
}

- (void)_stopIdleTimer
{
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    dispatch_source_cancel(idleTimer);
    int v4 = self->_idleTimer;
    self->_idleTimer = 0;
  }
}

- (void)_startIdleTimer
{
  if (!self->_idleTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    idleTimer = self->_idleTimer;
    self->_idleTimer = v3;

    v5 = self->_idleTimer;
    dispatch_time_t v6 = dispatch_time(0, 4000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    v7 = self->_idleTimer;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__AFAnalyticsConnection__startIdleTimer__block_invoke;
    v8[3] = &unk_1E592B978;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_idleTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __40__AFAnalyticsConnection__startIdleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _idleTimerFired];
}

- (void)_cleanUpConnection
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection setExportedObject:0];
    [(NSXPCConnection *)self->_connection invalidate];
    int v4 = self->_connection;
    self->_connection = 0;
  }
  [(AFAnalyticsConnection *)self setNeedsCleanUpConnection:0];
}

- (void)_cleanUpConnectionIfNeeded
{
  if ([(AFAnalyticsConnection *)self needsCleanUpConnection])
  {
    [(AFAnalyticsConnection *)self _cleanUpConnection];
  }
}

- (void)_connectionInvalidated
{
  [(AFAnalyticsConnection *)self setNeedsCleanUpConnection:1];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AFAnalyticsConnection__connectionInvalidated__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __47__AFAnalyticsConnection__connectionInvalidated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpConnectionIfNeeded];
}

- (void)_connectionInterrupted
{
  [(AFAnalyticsConnection *)self setNeedsCleanUpConnection:1];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AFAnalyticsConnection__connectionInterrupted__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __47__AFAnalyticsConnection__connectionInterrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpConnectionIfNeeded];
}

- (id)_connection
{
  [(AFAnalyticsConnection *)self _cleanUpConnectionIfNeeded];
  connection = self->_connection;
  if (!connection)
  {
    int v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.assistant.analytics" options:0];
    v5 = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection _setQueue:self->_queue];
    dispatch_time_t v6 = self->_connection;
    v7 = AFAnalyticsServiceGetXPCInterface();
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    v8 = self->_connection;
    id v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEA5358];
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    objc_initWeak(&location, self);
    v10 = self->_connection;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __36__AFAnalyticsConnection__connection__block_invoke;
    v15[3] = &unk_1E592B978;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v10 setInterruptionHandler:v15];
    v11 = self->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __36__AFAnalyticsConnection__connection__block_invoke_2;
    v13[3] = &unk_1E592B978;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v11 setInvalidationHandler:v13];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __36__AFAnalyticsConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __36__AFAnalyticsConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)_didFinishSendingEvents:(id)a3
{
  unint64_t v4 = self->_numberOfEventsBeingSent - [a3 count];
  self->_numberOfEventsBeingSent = v4;
  if (!v4)
  {
    [(AFAnalyticsConnection *)self _startIdleTimer];
  }
}

- (void)_willStartSendingEvents:(id)a3
{
  unint64_t v4 = self->_numberOfEventsBeingSent + [a3 count];
  self->_numberOfEventsBeingSent = v4;
  if (v4)
  {
    [(AFAnalyticsConnection *)self _stopIdleTimer];
  }
}

- (void)_handleSuccessCallbackForEvents:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)_handleFailureCallbackForEvents:(id)a3 error:(id)a4 numberOfRetries:(unint64_t)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    v18 = v13;
    *(_DWORD *)buf = 136315906;
    v24 = "-[AFAnalyticsConnection _handleFailureCallbackForEvents:error:numberOfRetries:completion:]";
    __int16 v25 = 2048;
    uint64_t v26 = [v10 count];
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2048;
    unint64_t v30 = a5;
    _os_log_error_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_ERROR, "%s Failed to send %tu events due to %@. (numberOfRetries = %tu)", buf, 0x2Au);
  }
  if (a5 > 2)
  {
    id v16 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[AFAnalyticsConnection _handleFailureCallbackForEvents:error:numberOfRetries:completion:]";
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v10;
      _os_log_error_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_ERROR, "%s Dropping %@ because the maximum number of retries was reached.", buf, 0x16u);
      if (!v12) {
        goto LABEL_8;
      }
    }
    else if (!v12)
    {
      goto LABEL_8;
    }
    v17 = +[AFError errorWithCode:2202 description:0 underlyingError:v11];
    v12[2](v12, v17);

    goto LABEL_8;
  }
  dispatch_time_t v14 = dispatch_time(0, 1000000000);
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__AFAnalyticsConnection__handleFailureCallbackForEvents_error_numberOfRetries_completion___block_invoke;
  v19[3] = &unk_1E5926858;
  v19[4] = self;
  id v20 = v10;
  unint64_t v22 = a5;
  v21 = v12;
  dispatch_after(v14, queue, v19);

LABEL_8:
}

uint64_t __90__AFAnalyticsConnection__handleFailureCallbackForEvents_error_numberOfRetries_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendEvents:*(void *)(a1 + 40) numberOfRetries:*(void *)(a1 + 56) + 1 completion:*(void *)(a1 + 48)];
}

- (void)_sendEvents:(id)a3 numberOfRetries:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(AFAnalyticsConnection *)self _connection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke;
  v19[3] = &unk_1E5925C40;
  v19[4] = self;
  id v11 = v8;
  id v20 = v11;
  unint64_t v22 = a4;
  id v12 = v9;
  id v21 = v12;
  v13 = [v10 remoteObjectProxyWithErrorHandler:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke_3;
  v16[3] = &unk_1E592C598;
  v16[4] = self;
  id v17 = v11;
  id v18 = v12;
  id v14 = v12;
  id v15 = v11;
  [v13 stageEvents:v15 completion:v16];
}

void __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke_2;
  block[3] = &unk_1E5925C18;
  block[4] = v4;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  dispatch_time_t v6 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke_4;
  block[3] = &unk_1E592C598;
  block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

uint64_t __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSuccessCallbackForEvents:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFailureCallbackForEvents:*(void *)(a1 + 40) error:*(void *)(a1 + 48) numberOfRetries:*(void *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)boostQueuedEvents:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[AFAnalyticsConnection boostQueuedEvents:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v6 = +[AFAnalytics sharedAnalytics];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__AFAnalyticsConnection_boostQueuedEvents___block_invoke;
  v8[3] = &unk_1E592C6E8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 boostQueuedEvents:v8];
}

void __43__AFAnalyticsConnection_boostQueuedEvents___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 136315394;
    id v9 = "-[AFAnalyticsConnection boostQueuedEvents:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s Boosting XPC queue %@", buf, 0x16u);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__AFAnalyticsConnection_boostQueuedEvents___block_invoke_7;
  v6[3] = &unk_1E592C6E8;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v6);
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8), v5);
}

uint64_t __43__AFAnalyticsConnection_boostQueuedEvents___block_invoke_7(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v5 = 136315394;
    id v6 = "-[AFAnalyticsConnection boostQueuedEvents:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s Completed boosting XPC queue %@", (uint8_t *)&v5, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)flushStagedEventsWithReply:(id)a3
{
  id v4 = a3;
  int v5 = +[AFAnalytics sharedAnalytics];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 barrier:v7];
}

void __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFAnalyticsEventCreateCurrent(2, 0);
  v16[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke_2;
  block[3] = &unk_1E592C710;
  block[4] = v4;
  id v6 = v3;
  id v15 = v6;
  dispatch_async(v5, block);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 40);
  uint64_t v9 = *(NSObject **)(v7 + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke_3;
  v11[3] = &unk_1E592C598;
  v11[4] = v7;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v10 = v6;
  dispatch_group_notify(v8, v9, v11);
}

uint64_t __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _willStartSendingEvents:*(void *)(a1 + 40)];
}

void __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke_3(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke_4;
  v4[3] = &unk_1E5929538;
  v4[4] = v3;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v3 _sendEvents:v5 numberOfRetries:0 completion:v4];
}

void __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) _didFinishSendingEvents:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)_stageUEIEventData:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = "-[AFAnalyticsConnection _stageUEIEventData:timestamp:completion:]";
    _os_log_debug_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  [(AFAnalyticsConnection *)self _stopIdleTimer];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65__AFAnalyticsConnection__stageUEIEventData_timestamp_completion___block_invoke;
  v23[3] = &unk_1E592C6E8;
  v23[4] = self;
  id v24 = v9;
  id v11 = v9;
  id v12 = (void *)MEMORY[0x19F3A50D0](v23);
  id v13 = [(AFAnalyticsConnection *)self _connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__AFAnalyticsConnection__stageUEIEventData_timestamp_completion___block_invoke_2;
  v20[3] = &unk_1E5929680;
  id v21 = v8;
  id v14 = v12;
  id v22 = v14;
  id v15 = v8;
  id v16 = [v13 remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__AFAnalyticsConnection__stageUEIEventData_timestamp_completion___block_invoke_5;
  v18[3] = &unk_1E592C360;
  id v19 = v14;
  id v17 = v14;
  [v16 stageUEIEventData:v15 timestamp:a4 completion:v18];
}

uint64_t __65__AFAnalyticsConnection__stageUEIEventData_timestamp_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startIdleTimer];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __65__AFAnalyticsConnection__stageUEIEventData_timestamp_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "-[AFAnalyticsConnection _stageUEIEventData:timestamp:completion:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Failed to stage UEI event: %@ error: %@", (uint8_t *)&v6, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__AFAnalyticsConnection__stageUEIEventData_timestamp_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stageUEIEventData:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__AFAnalyticsConnection_stageUEIEventData_timestamp_completion___block_invoke;
  v13[3] = &unk_1E5926858;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

uint64_t __64__AFAnalyticsConnection_stageUEIEventData_timestamp_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stageUEIEventData:*(void *)(a1 + 40) timestamp:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)logInstrumentationOfType:(id)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__AFAnalyticsConnection_logInstrumentationOfType_machAbsoluteTime_turnIdentifier___block_invoke;
  v13[3] = &unk_1E5929398;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __82__AFAnalyticsConnection_logInstrumentationOfType_machAbsoluteTime_turnIdentifier___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _connection];
  uint64_t v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_6876];
  [v2 logInstrumentationOfType:*(void *)(a1 + 40) machAbsoluteTime:*(void *)(a1 + 56) turnIdentifier:*(void *)(a1 + 48)];
}

void __82__AFAnalyticsConnection_logInstrumentationOfType_machAbsoluteTime_turnIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFAnalyticsConnection logInstrumentationOfType:machAbsoluteTime:turnIdentifier:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Error with remoteObjectProxy: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)endEventsGrouping
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[AFAnalyticsConnection endEventsGrouping]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  dispatch_group_leave((dispatch_group_t)self->_group);
}

- (void)beginEventsGrouping
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[AFAnalyticsConnection beginEventsGrouping]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  dispatch_group_enter((dispatch_group_t)self->_group);
}

- (void)stageEvents:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AFAnalyticsConnection_stageEvents_completion___block_invoke;
    block[3] = &unk_1E592C710;
    block[4] = self;
    id v9 = v6;
    id v16 = v9;
    dispatch_async(queue, block);
    group = self->_group;
    id v11 = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__AFAnalyticsConnection_stageEvents_completion___block_invoke_2;
    v12[3] = &unk_1E592C598;
    v12[4] = self;
    id v13 = v9;
    id v14 = v7;
    dispatch_group_notify(group, v11, v12);
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

uint64_t __48__AFAnalyticsConnection_stageEvents_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _willStartSendingEvents:*(void *)(a1 + 40)];
}

void __48__AFAnalyticsConnection_stageEvents_completion___block_invoke_2(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__AFAnalyticsConnection_stageEvents_completion___block_invoke_3;
  v4[3] = &unk_1E5929538;
  v4[4] = v3;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v3 _sendEvents:v5 numberOfRetries:0 completion:v4];
}

uint64_t __48__AFAnalyticsConnection_stageEvents_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _didFinishSendingEvents:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[AFAnalyticsConnection dealloc]";
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  [(AFAnalyticsConnection *)self _stopIdleTimer];
  [(AFAnalyticsConnection *)self _cleanUpConnection];
  v4.receiver = self;
  v4.super_class = (Class)AFAnalyticsConnection;
  [(AFAnalyticsConnection *)&v4 dealloc];
}

- (AFAnalyticsConnection)init
{
  v10.receiver = self;
  v10.super_class = (Class)AFAnalyticsConnection;
  id v2 = [(AFAnalyticsConnection *)&v10 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_super v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.analytics.connection", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_group_t v7 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v7;
  }
  return v2;
}

@end