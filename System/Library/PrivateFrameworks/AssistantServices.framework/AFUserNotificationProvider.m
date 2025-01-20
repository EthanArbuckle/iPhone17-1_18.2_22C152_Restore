@interface AFUserNotificationProvider
- (AFUserNotificationProvider)init;
- (id)_connection;
- (void)postNotificationRequest:(id)a3 responseHandler:(id)a4;
- (void)receivedNotificationResponse:(id)a3;
- (void)withdrawNotificationRequestWithIdentifier:(id)a3;
@end

@implementation AFUserNotificationProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_responseHandlersByNotificationID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)receivedNotificationResponse:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 notification];
  v6 = [v5 request];
  v7 = [v6 identifier];

  uint64_t v8 = [(NSMutableDictionary *)self->_responseHandlersByNotificationID objectForKey:v7];
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v4);
  }
  else
  {
    v10 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "-[AFUserNotificationProvider receivedNotificationResponse:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s No response handler for %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.assistant.notification_service" options:0];
    v5 = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection _setQueue:self->_queue];
    v6 = self->_connection;
    v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEE6948];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    uint64_t v8 = self->_connection;
    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEA4070];
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    objc_initWeak(&location, self);
    v10 = self->_connection;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__AFUserNotificationProvider__connection__block_invoke;
    v15[3] = &unk_1E592B978;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v10 setInterruptionHandler:v15];
    int v11 = self->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__AFUserNotificationProvider__connection__block_invoke_15;
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

void __41__AFUserNotificationProvider__connection__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    v6 = "-[AFUserNotificationProvider _connection]_block_invoke";
    _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, "%s Connection to assistantd for notification interrupted", (uint8_t *)&v5, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;
}

void __41__AFUserNotificationProvider__connection__block_invoke_15(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    v6 = "-[AFUserNotificationProvider _connection]_block_invoke";
    _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, "%s Connection to assistantd for notification invalidated", (uint8_t *)&v5, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;
}

- (void)withdrawNotificationRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(AFUserNotificationProvider *)self _connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__AFUserNotificationProvider_withdrawNotificationRequestWithIdentifier___block_invoke;
  v7[3] = &unk_1E592C248;
  v7[4] = self;
  v6 = [v5 remoteObjectProxyWithErrorHandler:v7];
  [v6 withdrawNotificationRequestWithIdentifier:v4];
}

void __72__AFUserNotificationProvider_withdrawNotificationRequestWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[AFUserNotificationProvider withdrawNotificationRequestWithIdentifier:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Error connecting to assistantd for notification service: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = 0;
}

- (void)postNotificationRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 identifier];
  if (v8)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke;
    v11[3] = &unk_1E592A8F8;
    id v14 = v7;
    v11[4] = self;
    id v12 = v8;
    id v13 = v6;
    dispatch_async(queue, v11);
  }
  else
  {
    id v10 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[AFUserNotificationProvider postNotificationRequest:responseHandler:]";
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s No identifier specified for %@", buf, 0x16u);
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke(uint64_t a1)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_2;
  v12[3] = &unk_1E5925870;
  id v2 = *(id *)(a1 + 56);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v2;
  id v3 = (void *)MEMORY[0x19F3A50D0](v12);
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = (void *)MEMORY[0x19F3A50D0]();
  [v4 setObject:v5 forKey:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) _connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_4;
  v11[3] = &unk_1E592C248;
  v11[4] = *(void *)(a1 + 32);
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v11];
  uint64_t v8 = *(void **)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_4;
  v9[3] = &unk_1E592C248;
  id v10 = v8;
  [v7 postNotificationRequest:v10 completion:v9];
}

void __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  id v6 = [v5 notification];

  id v7 = [v6 request];
  uint64_t v8 = [v7 identifier];

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 24);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_3;
  v12[3] = &unk_1E592C710;
  v12[4] = v9;
  id v13 = v8;
  id v11 = v8;
  dispatch_async(v10, v12);
}

void __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[AFUserNotificationProvider postNotificationRequest:responseHandler:]_block_invoke_4";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Error connecting to assistantd for notification service: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = 0;
}

{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  id v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = 136315650;
      int v7 = "-[AFUserNotificationProvider postNotificationRequest:responseHandler:]_block_invoke";
      uint64_t v8 = 2112;
      __int16 v9 = v5;
      id v10 = 2112;
      uint64_t v11 = v3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Error posting notification %@: %@", (uint8_t *)&v6, 0x20u);
    }
  }
}

uint64_t __70__AFUserNotificationProvider_postNotificationRequest_responseHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (AFUserNotificationProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)AFUserNotificationProvider;
  id v2 = [(AFUserNotificationProvider *)&v9 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("AFUserNotificationProvider", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    responseHandlersByNotificationID = v2->_responseHandlersByNotificationID;
    v2->_responseHandlersByNotificationID = v6;
  }
  return v2;
}

@end