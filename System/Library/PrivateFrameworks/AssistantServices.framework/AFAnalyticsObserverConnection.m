@interface AFAnalyticsObserverConnection
- (AFAnalyticsObserverConnection)initWithObservation:(id)a3;
- (id)_connection;
- (void)_cleanUpConnection;
- (void)_connectionInterrupted;
- (void)_connectionInvalidated;
- (void)dealloc;
- (void)didObserveEvents:(id)a3 completion:(id)a4;
- (void)flushWithCompletion:(id)a3;
- (void)invalidate;
- (void)waitUntilInvalidated;
@end

@implementation AFAnalyticsObserverConnection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observationHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_connectionInvalidated
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFAnalyticsObserverConnection _connectionInvalidated]";
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AFAnalyticsObserverConnection__connectionInvalidated__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__AFAnalyticsObserverConnection__connectionInvalidated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpConnection];
}

- (void)_connectionInterrupted
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFAnalyticsObserverConnection _connectionInterrupted]";
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AFAnalyticsObserverConnection__connectionInterrupted__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__AFAnalyticsObserverConnection__connectionInterrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpConnection];
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.assistant.analytics-observation" options:0];
    v5 = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection _setQueue:self->_queue];
    v6 = self->_connection;
    id v7 = (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEE6DC8];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    uint64_t v8 = self->_connection;
    v9 = AFAnalyticsObserverGetXPCInterface();
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__AFAnalyticsObserverConnection__connection__block_invoke;
    v15[3] = &unk_1E592B978;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v10 setInterruptionHandler:v15];
    v11 = self->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__AFAnalyticsObserverConnection__connection__block_invoke_2;
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

void __44__AFAnalyticsObserverConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __44__AFAnalyticsObserverConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)_cleanUpConnection
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection setExportedObject:0];
    [(NSXPCConnection *)self->_connection invalidate];
    v4 = self->_connection;
    self->_connection = 0;
  }
  semaphore = self->_semaphore;
  dispatch_semaphore_signal(semaphore);
}

- (void)didObserveEvents:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(void))a4;
  observationHandler = (void (**)(id, id))self->_observationHandler;
  if (observationHandler) {
    observationHandler[2](observationHandler, v8);
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AFAnalyticsObserverConnection_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __43__AFAnalyticsObserverConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpConnection];
}

- (void)dealloc
{
  [(AFAnalyticsObserverConnection *)self _cleanUpConnection];
  v3.receiver = self;
  v3.super_class = (Class)AFAnalyticsObserverConnection;
  [(AFAnalyticsObserverConnection *)&v3 dealloc];
}

- (void)flushWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[AFAnalyticsObserverConnection flushWithCompletion:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s begin", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__AFAnalyticsObserverConnection_flushWithCompletion___block_invoke;
  v8[3] = &unk_1E592C6E8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __53__AFAnalyticsObserverConnection_flushWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  objc_super v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_41734];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__AFAnalyticsObserverConnection_flushWithCompletion___block_invoke_4;
  v4[3] = &unk_1E592C360;
  id v5 = *(id *)(a1 + 40);
  [v3 flushWithCompletion:v4];
}

uint64_t __53__AFAnalyticsObserverConnection_flushWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[AFAnalyticsObserverConnection flushWithCompletion:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s end", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __53__AFAnalyticsObserverConnection_flushWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[AFAnalyticsObserverConnection flushWithCompletion:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s end with error %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)waitUntilInvalidated
{
}

- (AFAnalyticsObserverConnection)initWithObservation:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AFAnalyticsObserverConnection;
  id v5 = [(AFAnalyticsObserverConnection *)&v18 init];
  if (v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    semaphore = v5->_semaphore;
    v5->_semaphore = (OS_dispatch_semaphore *)v6;

    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.assistant.analytics-observation.connection", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = MEMORY[0x19F3A50D0](v4);
    id observationHandler = v5->_observationHandler;
    v5->_id observationHandler = (id)v12;

    id v14 = v5->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__AFAnalyticsObserverConnection_initWithObservation___block_invoke;
    block[3] = &unk_1E592C678;
    v17 = v5;
    dispatch_async(v14, block);
  }
  return v5;
}

void __53__AFAnalyticsObserverConnection_initWithObservation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _connection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__AFAnalyticsObserverConnection_initWithObservation___block_invoke_2;
  v6[3] = &unk_1E592C248;
  id v7 = *(id *)(a1 + 32);
  objc_super v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__AFAnalyticsObserverConnection_initWithObservation___block_invoke_2;
  v4[3] = &unk_1E592C678;
  id v5 = *(id *)(a1 + 32);
  [v3 observeWithCompletion:v4];
}

void __53__AFAnalyticsObserverConnection_initWithObservation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    dispatch_semaphore_t v6 = "-[AFAnalyticsObserverConnection initWithObservation:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
}

intptr_t __53__AFAnalyticsObserverConnection_initWithObservation___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
}

@end