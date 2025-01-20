@interface CSDeviceActivationXPCListener
- (CSDeviceActivationXPCListener)init;
- (CSDeviceActivationXPCListener)initWithMachServiceName:(const char *)a3;
- (NSMutableArray)connections;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)listener;
- (void)CSActivationXPCConnectionReceivedClientError:(id)a3 clientError:(id)a4 client:(id)a5;
- (void)_handleListenerError:(id)a3;
- (void)_handleListenerEvent:(id)a3;
- (void)_handleNewRemoteConnection:(id)a3;
- (void)listen;
- (void)setConnections:(id)a3;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSDeviceActivationXPCListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setConnections:(id)a3
{
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setListener:(id)a3
{
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)CSActivationXPCConnectionReceivedClientError:(id)a3 clientError:(id)a4 client:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__CSDeviceActivationXPCListener_CSActivationXPCConnectionReceivedClientError_clientError_client___block_invoke;
  block[3] = &unk_1E6200E38;
  id v13 = v8;
  id v14 = v7;
  v15 = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, block);
}

void __97__CSDeviceActivationXPCListener_CSActivationXPCConnectionReceivedClientError_clientError_client___block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    int v4 = 136315394;
    v5 = "-[CSDeviceActivationXPCListener CSActivationXPCConnectionReceivedClientError:clientError:client:]_block_invoke";
    __int16 v6 = 2050;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Client connection disconnected, removing %{public}p from client connection pool", (uint8_t *)&v4, 0x16u);
  }
  if (a1[5]) {
    objc_msgSend(*(id *)(a1[6] + 24), "removeObject:");
  }
}

- (void)_handleNewRemoteConnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      uint64_t v8 = "-[CSDeviceActivationXPCListener _handleNewRemoteConnection:]";
      __int16 v9 = 2050;
      id v10 = v4;
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Getting new client connection : %{public}p", (uint8_t *)&v7, 0x16u);
    }
    if (+[CSUtils machXPCConnection:v4 hasEntitlement:@"corespeechd.activation"])
    {
      __int16 v6 = [[CSDeviceActivationXPCConnection alloc] initWithConnection:v4];
      [(CSDeviceActivationXPCConnection *)v6 activateConnection];
      [(CSDeviceActivationXPCConnection *)v6 setDelegate:self];
      if (v6) {
        [(NSMutableArray *)self->_connections addObject:v6];
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[CSDeviceActivationXPCListener _handleNewRemoteConnection:]";
    _os_log_error_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_ERROR, "%s Connection request is nil", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_handleListenerError:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v5 = (const char *)*MEMORY[0x1E4F14530];
    __int16 v6 = v4;
    int v7 = 136315394;
    uint64_t v8 = "-[CSDeviceActivationXPCListener _handleListenerError:]";
    __int16 v9 = 2082;
    string = xpc_dictionary_get_string(a3, v5);
    _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s Error = %{public}s", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_handleListenerEvent:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[CSDeviceActivationXPCListener _handleListenerEvent:]";
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Received new remote control connection request", (uint8_t *)&v7, 0xCu);
  }
  if (v4)
  {
    if (MEMORY[0x1BA9E7EA0](v4) == MEMORY[0x1E4F145A8]) {
      [(CSDeviceActivationXPCListener *)self _handleListenerError:v4];
    }
    else {
      [(CSDeviceActivationXPCListener *)self _handleNewRemoteConnection:v4];
    }
  }
  else
  {
    __int16 v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[CSDeviceActivationXPCListener _handleListenerEvent:]";
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s Connection request is nil", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)listen
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[CSDeviceActivationXPCListener listen]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s CSActivationXPCListener start listening", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  listener = self->_listener;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __39__CSDeviceActivationXPCListener_listen__block_invoke;
  handler[3] = &unk_1E62011B0;
  objc_copyWeak(&v6, (id *)buf);
  xpc_connection_set_event_handler(listener, handler);
  xpc_connection_activate(self->_listener);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __39__CSDeviceActivationXPCListener_listen__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleListenerEvent:v3];
}

- (CSDeviceActivationXPCListener)init
{
  return [(CSDeviceActivationXPCListener *)self initWithMachServiceName:"com.apple.corespeech.corespeechd.activation.xpc"];
}

- (CSDeviceActivationXPCListener)initWithMachServiceName:(const char *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CSDeviceActivationXPCListener;
  id v4 = [(CSDeviceActivationXPCListener *)&v13 init];
  if (v4)
  {
    uint64_t v5 = +[CSUtils getSerialQueue:@"CSActivationXPCListener" qualityOfService:33];
    id v6 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v5;

    xpc_connection_t mach_service = xpc_connection_create_mach_service(a3, *((dispatch_queue_t *)v4 + 1), 1uLL);
    uint64_t v8 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = mach_service;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    id v10 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v9;
  }
  CSLogInitIfNeededWithSubsystemType(0);
  uint64_t v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[CSDeviceActivationXPCListener initWithMachServiceName:]";
    __int16 v16 = 2080;
    v17 = a3;
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s machServiceName: %s", buf, 0x16u);
  }
  return (CSDeviceActivationXPCListener *)v4;
}

@end