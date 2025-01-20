@interface CXXPCChannelProvider
- (BOOL)requiresProxyingAVAudioSessionState;
- (BSServiceConnection)connection;
- (CXChannelServiceDefinition)definition;
- (CXXPCChannelProvider)initWithConfiguration:(id)a3;
- (OS_dispatch_queue)queue;
- (id)hostProtocolDelegate;
- (void)dealloc;
- (void)invalidate;
- (void)setConnection:(id)a3;
@end

@implementation CXXPCChannelProvider

- (CXXPCChannelProvider)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CXXPCChannelProvider;
  v5 = [(CXChannelProvider *)&v38 initWithConfiguration:v4];
  if (v5)
  {
    id v31 = [NSString stringWithFormat:@"com.apple.callkit.queue.%@.%p", objc_opt_class(), v5];
    v6 = (const char *)[v31 UTF8String];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);

    objc_storeStrong((id *)&v5->_queue, v8);
    v9 = objc_alloc_init(CXChannelServiceDefinition);
    objc_storeStrong((id *)&v5->_definition, v9);
    v10 = (void *)MEMORY[0x1E4F50BB8];
    v11 = [(CXChannelServiceDefinition *)v5->_definition domain];
    v12 = [v11 machName];
    v13 = [(CXChannelServiceDefinition *)v9 name];
    v14 = [v10 endpointForMachName:v12 service:v13 instance:0];

    v15 = (void *)MEMORY[0x1E4F50B98];
    v16 = [(CXChannelServiceDefinition *)v9 name];
    v17 = [v15 interfaceWithIdentifier:v16];

    v18 = (void *)MEMORY[0x1E4F4F7B8];
    v19 = [(CXChannelServiceDefinition *)v9 clientXPCInterface];
    v20 = [v18 protocolForProtocol:v19];
    [v17 setClient:v20];

    v21 = (void *)MEMORY[0x1E4F4F7B8];
    v22 = [(CXChannelServiceDefinition *)v9 serverXPCInterface];
    v23 = [v21 protocolForProtocol:v22];
    [v17 setServer:v23];

    objc_initWeak(&location, v5);
    uint64_t v24 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v14];
    connection = v5->_connection;
    v5->_connection = (BSServiceConnection *)v24;

    v26 = v5->_connection;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __46__CXXPCChannelProvider_initWithConfiguration___block_invoke;
    v32[3] = &unk_1E5CAE5A8;
    id v27 = v17;
    id v33 = v27;
    v28 = v5;
    v34 = v28;
    v29 = v8;
    v35 = v29;
    objc_copyWeak(&v36, &location);
    [(BSServiceConnection *)v26 configureConnection:v32];
    [(BSServiceConnection *)v5->_connection activate];
    [(CXChannelProvider *)v28 registerCurrentConfiguration];
    objc_destroyWeak(&v36);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __46__CXXPCChannelProvider_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setInterface:*(void *)(a1 + 32)];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  id v4 = [MEMORY[0x1E4F50BE0] utility];
  [v3 setServiceQuality:v4];

  [v3 setTargetQueue:*(void *)(a1 + 48)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__CXXPCChannelProvider_initWithConfiguration___block_invoke_2;
  v9[3] = &unk_1E5CAE558;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 40);
  [v3 setActivationHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__CXXPCChannelProvider_initWithConfiguration___block_invoke_8;
  v7[3] = &unk_1E5CAE580;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  [v3 setInterruptionHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__CXXPCChannelProvider_initWithConfiguration___block_invoke_9;
  v5[3] = &unk_1E5CAE580;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  [v3 setInvalidationHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v11);
}

void __46__CXXPCChannelProvider_initWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = CXDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Activated connection %@", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [WeakRetained abstractProvider];
    [v6 sendDidBeginForProvider:*(void *)(a1 + 32)];
  }
}

void __46__CXXPCChannelProvider_initWithConfiguration___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = CXDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 2112;
      id v10 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Interrupted connection %@ for XPC provider %@", (uint8_t *)&v7, 0x16u);
    }

    id v6 = [WeakRetained abstractProvider];
    [v6 handleConnectionInterruptionForProvider:WeakRetained];
  }
}

void __46__CXXPCChannelProvider_initWithConfiguration___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = CXDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 2112;
      id v10 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Invalidated connection %@ for XPC provider %@", (uint8_t *)&v7, 0x16u);
    }

    [WeakRetained setConnection:0];
    id v6 = [WeakRetained abstractProvider];
    [v6 handleConnectionInterruptionForProvider:WeakRetained];
  }
}

- (void)dealloc
{
  [(BSServiceConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CXXPCChannelProvider;
  [(CXXPCChannelProvider *)&v3 dealloc];
}

- (void)invalidate
{
  id v2 = [(CXXPCChannelProvider *)self connection];
  [v2 invalidate];
}

- (id)hostProtocolDelegate
{
  id v2 = [(CXXPCChannelProvider *)self connection];
  objc_super v3 = [v2 remoteTarget];

  return v3;
}

- (BOOL)requiresProxyingAVAudioSessionState
{
  return 1;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (CXChannelServiceDefinition)definition
{
  return self->_definition;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_definition, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end