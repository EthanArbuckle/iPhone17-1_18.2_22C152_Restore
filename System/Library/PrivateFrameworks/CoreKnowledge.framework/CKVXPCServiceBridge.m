@interface CKVXPCServiceBridge
- (CKVXPCServiceBridge)init;
- (CKVXPCServiceBridge)initWithServiceProtocol:(id)a3 machServiceName:(id)a4;
- (id)_getOrCreateXPCServiceConnection;
- (id)service;
- (void)_clearXPCServiceConnection;
- (void)dealloc;
@end

@implementation CKVXPCServiceBridge

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_serviceInterface, 0);
  objc_storeStrong((id *)&self->_serviceProtocol, 0);
}

- (void)dealloc
{
  [(CKVXPCServiceBridge *)self _clearXPCServiceConnection];
  v3.receiver = self;
  v3.super_class = (Class)CKVXPCServiceBridge;
  [(CKVXPCServiceBridge *)&v3 dealloc];
}

- (id)service
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CKVXPCServiceBridge_service__block_invoke;
  block[3] = &unk_1E5CF9B68;
  block[4] = self;
  dispatch_sync(queue, block);
  return self->_remoteObjectProxy;
}

void __30__CKVXPCServiceBridge_service__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[7])
  {
    id v6 = [v2 _getOrCreateXPCServiceConnection];
    uint64_t v3 = [v6 remoteObjectProxy];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;
  }
}

- (void)_clearXPCServiceConnection
{
  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__CKVXPCServiceBridge__clearXPCServiceConnection__block_invoke;
    block[3] = &unk_1E5CF9B68;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

void __49__CKVXPCServiceBridge__clearXPCServiceConnection__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = 0;
}

- (id)_getOrCreateXPCServiceConnection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  serviceConnection = self->_serviceConnection;
  if (!serviceConnection)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = (id)CKLogContextVocabulary;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = NSStringFromProtocol(self->_serviceProtocol);
      *(_DWORD *)buf = 136315394;
      v19 = "-[CKVXPCServiceBridge _getOrCreateXPCServiceConnection]";
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1A77B3000, v4, OS_LOG_TYPE_INFO, "%s Connecting to XPC service with interface: %@", buf, 0x16u);
    }
    id v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:self->_machServiceName options:self->_options];
    v7 = self->_serviceConnection;
    self->_serviceConnection = v6;

    [(NSXPCConnection *)self->_serviceConnection setRemoteObjectInterface:self->_serviceInterface];
    objc_initWeak((id *)buf, self->_serviceConnection);
    v8 = self->_serviceConnection;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__CKVXPCServiceBridge__getOrCreateXPCServiceConnection__block_invoke;
    v14[3] = &unk_1E5CF98C8;
    objc_copyWeak(&v15, &location);
    objc_copyWeak(&v16, (id *)buf);
    [(NSXPCConnection *)v8 setInterruptionHandler:v14];
    v9 = self->_serviceConnection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__CKVXPCServiceBridge__getOrCreateXPCServiceConnection__block_invoke_5;
    v11[3] = &unk_1E5CF98C8;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, (id *)buf);
    [(NSXPCConnection *)v9 setInvalidationHandler:v11];
    [(NSXPCConnection *)self->_serviceConnection resume];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
    objc_destroyWeak(&location);
    serviceConnection = self->_serviceConnection;
  }
  return serviceConnection;
}

void __55__CKVXPCServiceBridge__getOrCreateXPCServiceConnection__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315650;
    id v6 = "-[CKVXPCServiceBridge _getOrCreateXPCServiceConnection]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    __int16 v9 = 2112;
    id v10 = WeakRetained;
    _os_log_impl(&dword_1A77B3000, v4, OS_LOG_TYPE_INFO, "%s service connection %@ by %@ was interrupted", (uint8_t *)&v5, 0x20u);
  }
}

void __55__CKVXPCServiceBridge__getOrCreateXPCServiceConnection__block_invoke_5(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315650;
    id v6 = "-[CKVXPCServiceBridge _getOrCreateXPCServiceConnection]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    __int16 v9 = 2112;
    id v10 = WeakRetained;
    _os_log_impl(&dword_1A77B3000, v4, OS_LOG_TYPE_INFO, "%s service connection %@ by %@ was invalidated", (uint8_t *)&v5, 0x20u);
  }
  [WeakRetained _clearXPCServiceConnection];
}

- (CKVXPCServiceBridge)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use - initWithServiceProtocol" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVXPCServiceBridge)initWithServiceProtocol:(id)a3 machServiceName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CKVXPCServiceBridge;
  __int16 v9 = [(CKVXPCServiceBridge *)&v21 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceProtocol, a3);
    if (!v10->_serviceProtocol
      || (uint64_t v11 = [v8 copy],
          machServiceName = v10->_machServiceName,
          v10->_machServiceName = (NSString *)v11,
          machServiceName,
          (id v13 = v10->_machServiceName) == 0)
      || ![(NSString *)v13 length])
    {
      v19 = 0;
      goto LABEL_8;
    }
    uint64_t v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v10->_serviceProtocol];
    serviceInterface = v10->_serviceInterface;
    v10->_serviceInterface = (NSXPCInterface *)v14;

    v10->_options = 0;
    id v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("CKVXPCConnectionQueue", v16);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v17;
  }
  v19 = v10;
LABEL_8:

  return v19;
}

@end