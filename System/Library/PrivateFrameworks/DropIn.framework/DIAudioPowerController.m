@interface DIAudioPowerController
- (DIAudioPowerController)initWithConnectionManager:(id)a3;
- (DIAudioPowerControllerDelegate)delegate;
- (DIXPCConnectionManager)connectionManager;
- (void)dealloc;
- (void)didUpdateAudioPower:(float)a3;
- (void)setDelegate:(id)a3;
- (void)xpcManagerDidPerformDaemonCheckIn:(id)a3;
@end

@implementation DIAudioPowerController

- (DIAudioPowerController)initWithConnectionManager:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DIAudioPowerController;
  v5 = [(DIAudioPowerController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_connectionManager, v4);
    v8 = [v4 dispatcher];
    [v8 setAudioPowerDelegate:v6];

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_connectionManager);
    v10 = [WeakRetained manager];
    [v10 addCheckInObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = DILogHandleAudioPowerController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = &stru_26FF62CC0;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_DEFAULT, "%@Tearing down Audio Power Controller", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)DIAudioPowerController;
  [(DIAudioPowerController *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
  {
    id v12 = [(DIAudioPowerController *)self connectionManager];
    v5 = [v12 manager];
    v6 = [v5 connection];
    uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_3];
    v8 = [(DIAudioPowerController *)self connectionManager];
    v9 = [v8 manager];
    v10 = [v9 clientContext];
    [v7 registerAudioPowerWithContext:v10 completionHandler:&__block_literal_global_6];
  }
  else
  {
    v11 = DILogHandleAudioPowerController();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = &stru_26FF62CC0;
      _os_log_impl(&dword_24D00D000, v11, OS_LOG_TYPE_DEFAULT, "%@Audio power controller delegate set to nil", buf, 0xCu);
    }
  }
}

void __38__DIAudioPowerController_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = DILogHandleAudioPowerController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_super v4 = [v2 localizedDescription];
    int v5 = 138412546;
    v6 = &stru_26FF62CC0;
    __int16 v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_ERROR, "%@Audio power controller set delegate proxy error: %@", (uint8_t *)&v5, 0x16u);
  }
}

void __38__DIAudioPowerController_setDelegate___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    v3 = DILogHandleAudioPowerController();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_super v4 = [v2 localizedDescription];
      int v5 = 138412546;
      v6 = &stru_26FF62CC0;
      __int16 v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_ERROR, "%@Audio power controller set delegate register audio power with context error: %@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)didUpdateAudioPower:(float)a3
{
  int v5 = [(DIAudioPowerController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    __int16 v7 = [(DIAudioPowerController *)self connectionManager];
    v8 = [v7 manager];
    uint64_t v9 = [v8 clientQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __46__DIAudioPowerController_didUpdateAudioPower___block_invoke;
    v17[3] = &unk_2652FCB78;
    v17[4] = self;
    float v18 = a3;
    +[DIUtilities onQueue:v9 block:v17];
  }
  v10 = [(DIAudioPowerController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(DIAudioPowerController *)self connectionManager];
    v13 = [v12 manager];
    v14 = [v13 clientQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__DIAudioPowerController_didUpdateAudioPower___block_invoke_2;
    v15[3] = &unk_2652FCB78;
    v15[4] = self;
    float v16 = a3;
    +[DIUtilities onQueue:v14 block:v15];
  }
}

void __46__DIAudioPowerController_didUpdateAudioPower___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 controller:*(void *)(a1 + 32) didUpdateAudioPowerForDropInDevice:v2];
}

void __46__DIAudioPowerController_didUpdateAudioPower___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 controller:*(void *)(a1 + 32) didUpdateDownlinkAudioPower:v2];
}

- (void)xpcManagerDidPerformDaemonCheckIn:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(DIAudioPowerController *)self setDelegate:WeakRetained];
}

- (DIAudioPowerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DIAudioPowerControllerDelegate *)WeakRetained;
}

- (DIXPCConnectionManager)connectionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionManager);
  return (DIXPCConnectionManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_destroyWeak((id *)&self->_delegate);
}

@end