@interface DIDropInCenter
+ (id)new;
- (DIAudioPowerController)audioPowerController;
- (DIAudioSystemController)audioSystemController;
- (DIDeviceManager)deviceManager;
- (DIDropInCenter)init;
- (DIDropInCenter)initWithHomeIdentifier:(id)a3;
- (DIDropInCenter)initWithNullableHomeIdentifier:(id)a3 queue:(id)a4;
- (DIDropInCenterDelegate)delegate;
- (DIDropInSessionManager)sessionManager;
- (DIXPCConnectionManager)connectionManager;
- (NSUUID)homeIdentifier;
- (void)dealloc;
- (void)managerDidInterruptConnection:(id)a3;
- (void)setAudioPowerController:(id)a3;
- (void)setAudioSystemController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setSessionManager:(id)a3;
- (void)startSessionWithRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation DIDropInCenter

- (DIDropInCenter)initWithHomeIdentifier:(id)a3
{
  return [(DIDropInCenter *)self initWithHomeIdentifier:a3 queue:0];
}

- (DIDropInCenter)initWithNullableHomeIdentifier:(id)a3 queue:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DIDropInCenter;
  v9 = [(DIDropInCenter *)&v17 init];
  if (v9)
  {
    v10 = DILogHandleDropInCenter();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = &stru_26FF62CC0;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_24D00D000, v10, OS_LOG_TYPE_DEFAULT, "%@Creating Drop In Center with Home Identifier %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v9->_homeIdentifier, a3);
    v11 = [[DIClientContext alloc] initWithHomeIdentifier:v9->_homeIdentifier];
    v12 = [[DIXPCDispatcher alloc] initWithClientContext:v11];
    v13 = [[DIXPCManager alloc] initWithClientContext:v11 dispatcher:v12 clientQueue:v8];
    [(DIXPCManager *)v13 setDelegate:v9];
    v14 = [[DIXPCConnectionManager alloc] initWithXPCManager:v13 dispatcher:v12];
    connectionManager = v9->_connectionManager;
    v9->_connectionManager = v14;
  }
  return v9;
}

- (DIDropInCenter)init
{
  return [(DIDropInCenter *)self initWithNullableHomeIdentifier:0 queue:0];
}

+ (id)new
{
  return (id)MEMORY[0x270F9A540](DIDropInCenter, a2);
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = DILogHandleDropInCenter();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = &stru_26FF62CC0;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_DEFAULT, "%@Tearing down Drop In Center", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)DIDropInCenter;
  [(DIDropInCenter *)&v4 dealloc];
}

- (DIDeviceManager)deviceManager
{
  deviceManager = self->_deviceManager;
  if (!deviceManager)
  {
    objc_super v4 = [DIDeviceManager alloc];
    v5 = [(DIDropInCenter *)self connectionManager];
    v6 = [(DIDeviceManager *)v4 initWithConnectionManager:v5];
    uint64_t v7 = self->_deviceManager;
    self->_deviceManager = v6;

    deviceManager = self->_deviceManager;
  }
  return deviceManager;
}

- (DIDropInSessionManager)sessionManager
{
  sessionManager = self->_sessionManager;
  if (!sessionManager)
  {
    objc_super v4 = [DIDropInSessionManager alloc];
    v5 = [(DIDropInCenter *)self connectionManager];
    v6 = [(DIDropInSessionManager *)v4 initWithConnectionManager:v5];
    uint64_t v7 = self->_sessionManager;
    self->_sessionManager = v6;

    sessionManager = self->_sessionManager;
  }
  return sessionManager;
}

- (DIAudioPowerController)audioPowerController
{
  audioPowerController = self->_audioPowerController;
  if (!audioPowerController)
  {
    objc_super v4 = [DIAudioPowerController alloc];
    v5 = [(DIDropInCenter *)self connectionManager];
    v6 = [(DIAudioPowerController *)v4 initWithConnectionManager:v5];
    uint64_t v7 = self->_audioPowerController;
    self->_audioPowerController = v6;

    audioPowerController = self->_audioPowerController;
  }
  return audioPowerController;
}

- (DIAudioSystemController)audioSystemController
{
  audioSystemController = self->_audioSystemController;
  if (!audioSystemController)
  {
    objc_super v4 = [DIAudioSystemController alloc];
    v5 = [(DIDropInCenter *)self connectionManager];
    v6 = [(DIAudioSystemController *)v4 initWithConnectionManager:v5];
    uint64_t v7 = self->_audioSystemController;
    self->_audioSystemController = v6;

    audioSystemController = self->_audioSystemController;
  }
  return audioSystemController;
}

- (void)startSessionWithRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DIDropInCenter *)self connectionManager];
  v9 = [v8 manager];
  v10 = [v9 clientContext];

  v11 = DILogHandleDropInCenter();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = &stru_26FF62CC0;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_24D00D000, v11, OS_LOG_TYPE_DEFAULT, "%@Start session with request %@", buf, 0x16u);
  }

  v12 = [(DIDropInCenter *)self connectionManager];
  v13 = [v12 manager];
  v14 = [v13 connection];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke;
  v20[3] = &unk_2652FC7F8;
  v20[4] = self;
  id v15 = v7;
  id v21 = v15;
  v16 = [v14 remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke_2;
  v18[3] = &unk_2652FC820;
  v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  [v16 startSessionWithContext:v10 request:v6 completionHandler:v18];
}

void __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = DILogHandleDropInCenter();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v14 = &stru_26FF62CC0;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_24D00D000, v4, OS_LOG_TYPE_ERROR, "%@Failed to start Session %@", buf, 0x16u);
  }

  v5 = [*(id *)(a1 + 32) connectionManager];
  id v6 = [v5 manager];
  id v7 = [v6 clientQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke_12;
  v10[3] = &unk_2652FC7D0;
  id v8 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  +[DIUtilities onQueue:v7 block:v10];
}

uint64_t __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) connectionManager];
  [v5 setConnectionManager:v7];

  id v8 = [*(id *)(a1 + 32) sessionManager];
  [v8 setActiveSession:v5];

  id v9 = DILogHandleDropInCenter();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = &stru_26FF62CC0;
      __int16 v26 = 2112;
      id v27 = v6;
      id v11 = "%@Failed to start Session %@";
      id v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_24D00D000, v12, v13, v11, buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = &stru_26FF62CC0;
    __int16 v26 = 2112;
    id v27 = v5;
    id v11 = "%@Started Session: %@";
    id v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

  v14 = [*(id *)(a1 + 32) connectionManager];
  __int16 v15 = [v14 manager];
  id v16 = [v15 clientQueue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke_15;
  v20[3] = &unk_2652FCB50;
  id v17 = *(id *)(a1 + 40);
  id v22 = v6;
  id v23 = v17;
  id v21 = v5;
  id v18 = v6;
  id v19 = v5;
  +[DIUtilities onQueue:v16 block:v20];
}

uint64_t __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke_15(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)managerDidInterruptConnection:(id)a3
{
  objc_super v4 = [(DIDropInCenter *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DIDropInCenter *)self connectionManager];
    id v7 = [v6 manager];
    id v8 = [v7 clientQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__DIDropInCenter_managerDidInterruptConnection___block_invoke;
    v9[3] = &unk_2652FCA58;
    v9[4] = self;
    +[DIUtilities onQueue:v8 block:v9];
  }
}

void __48__DIDropInCenter_managerDidInterruptConnection___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = DILogHandleDropInCenter();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412546;
    id v6 = &stru_26FF62CC0;
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_24D00D000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Server Disconnected for Center = %@", (uint8_t *)&v5, 0x16u);
  }

  objc_super v4 = [*(id *)(a1 + 32) delegate];
  [v4 serverDisconnectedForDropInCenter:*(void *)(a1 + 32)];
}

- (void)setDeviceManager:(id)a3
{
}

- (void)setSessionManager:(id)a3
{
}

- (void)setAudioPowerController:(id)a3
{
}

- (void)setAudioSystemController:(id)a3
{
}

- (DIDropInCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DIDropInCenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (DIXPCConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioSystemController, 0);
  objc_storeStrong((id *)&self->_audioPowerController, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
}

@end