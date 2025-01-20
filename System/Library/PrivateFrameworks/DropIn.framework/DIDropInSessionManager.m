@interface DIDropInSessionManager
- (DIDropInSession)activeSession;
- (DIDropInSession)incomingPendingSession;
- (DIDropInSessionManager)initWithConnectionManager:(id)a3;
- (DIDropInSessionManagerDelegate)delegate;
- (DIXPCConnectionManager)connectionManager;
- (void)didAddSession:(id)a3;
- (void)didRemoveSession:(id)a3;
- (void)didUpdateSession:(id)a3;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateUplinkMuteStatus:(BOOL)a4;
- (void)setActiveSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIncomingPendingSession:(id)a3;
- (void)xpcManagerDidPerformDaemonCheckIn:(id)a3;
@end

@implementation DIDropInSessionManager

- (DIDropInSessionManager)initWithConnectionManager:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DIDropInSessionManager;
  v5 = [(DIDropInSessionManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_connectionManager, v4);
    v8 = [v4 dispatcher];
    [v8 setSessionStatusDelegate:v6];

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_connectionManager);
    v10 = [WeakRetained manager];
    [v10 addCheckInObserver:v6];
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  v5 = DILogHandleDIDropInSessionManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v12 = &stru_26FF62CC0;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Delegate set to %@", buf, 0x16u);
  }

  v6 = [(DIDropInSessionManager *)self connectionManager];
  id v7 = [v6 manager];
  v8 = [v7 connection];
  v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__DIDropInSessionManager_setDelegate___block_invoke_2;
  v10[3] = &unk_2652FCBA0;
  v10[4] = self;
  [v9 getCurrentSessionWithCompletionHandler:v10];
}

void __38__DIDropInSessionManager_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = DILogHandleDIDropInSessionManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412546;
    v5 = &stru_26FF62CC0;
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_ERROR, "%@Failed to get proxy with Error %@", (uint8_t *)&v4, 0x16u);
  }
}

void __38__DIDropInSessionManager_setDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v6 = v3;
    BOOL v4 = [v3 state] == 6;
    id v3 = v6;
    if (!v4)
    {
      BOOL v4 = [v6 state] == 7;
      id v3 = v6;
      if (!v4)
      {
        v5 = [*(id *)(a1 + 32) connectionManager];
        [v6 setConnectionManager:v5];

        [*(id *)(a1 + 32) setActiveSession:v6];
        id v3 = v6;
      }
    }
  }
}

- (void)setIncomingPendingSession:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = DILogHandleDIDropInSessionManager();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = &stru_26FF62CC0;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_24D00D000, v6, OS_LOG_TYPE_DEFAULT, "%@Setting incoming pending session to %@", buf, 0x16u);
  }

  objc_storeStrong((id *)&self->_incomingPendingSession, a3);
  id v7 = [(DIDropInSessionManager *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(DIDropInSessionManager *)self connectionManager];
    v10 = [v9 manager];
    v11 = [v10 clientQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__DIDropInSessionManager_setIncomingPendingSession___block_invoke;
    v12[3] = &unk_2652FC928;
    v12[4] = self;
    id v13 = v5;
    +[DIUtilities onQueue:v11 block:v12];
  }
}

void __52__DIDropInSessionManager_setIncomingPendingSession___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 manager:*(void *)(a1 + 32) didReceiveIncomingPendingSession:*(void *)(a1 + 40)];
}

- (void)setActiveSession:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = DILogHandleDIDropInSessionManager();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = &stru_26FF62CC0;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_24D00D000, v6, OS_LOG_TYPE_DEFAULT, "%@Setting active session to %@", buf, 0x16u);
  }

  objc_storeStrong((id *)&self->_activeSession, a3);
  id v7 = [(DIDropInSessionManager *)self incomingPendingSession];
  int v8 = [v7 isEqual:v5];

  if (v8)
  {
    v9 = DILogHandleDIDropInSessionManager();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = &stru_26FF62CC0;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_24D00D000, v9, OS_LOG_TYPE_DEFAULT, "%@Session was equal to incoming pending session and now making active %@", buf, 0x16u);
    }

    incomingPendingSession = self->_incomingPendingSession;
    self->_incomingPendingSession = 0;
  }
  v11 = [(DIDropInSessionManager *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(DIDropInSessionManager *)self connectionManager];
    id v14 = [v13 manager];
    uint64_t v15 = [v14 clientQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __43__DIDropInSessionManager_setActiveSession___block_invoke;
    v16[3] = &unk_2652FC928;
    v16[4] = self;
    id v17 = v5;
    +[DIUtilities onQueue:v15 block:v16];
  }
}

void __43__DIDropInSessionManager_setActiveSession___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 manager:*(void *)(a1 + 32) didUpdateActiveSession:*(void *)(a1 + 40)];
}

- (void)didAddSession:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DILogHandleDIDropInSessionManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    char v12 = &stru_26FF62CC0;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Did Add Session %@", (uint8_t *)&v11, 0x16u);
  }

  id v6 = [(DIDropInSessionManager *)self connectionManager];
  [v4 setConnectionManager:v6];

  id v7 = [(DIDropInSessionManager *)self activeSession];
  if (v7)
  {

LABEL_6:
    [(DIDropInSessionManager *)self setActiveSession:v4];
    goto LABEL_7;
  }
  if ([v4 state] == 4) {
    goto LABEL_6;
  }
  int v8 = [(DIDropInSessionManager *)self incomingPendingSession];
  int v9 = [v8 isEqual:v4];

  if (v9)
  {
    v10 = [(DIDropInSessionManager *)self incomingPendingSession];
    [(DIDropInSessionManager *)self setIncomingPendingSession:v10];
  }
  else
  {
    [(DIDropInSessionManager *)self setIncomingPendingSession:v4];
  }
LABEL_7:
}

- (void)didRemoveSession:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DILogHandleDIDropInSessionManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = &stru_26FF62CC0;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Did Remove Session %@", buf, 0x16u);
  }

  id v6 = [(DIDropInSessionManager *)self activeSession];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    int v8 = DILogHandleDIDropInSessionManager();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [(DIDropInSessionManager *)self activeSession];
      *(_DWORD *)buf = 138412546;
      v28 = &stru_26FF62CC0;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_24D00D000, v8, OS_LOG_TYPE_DEFAULT, "%@Wiping Active Session %@", buf, 0x16u);
    }
    activeSession = self->_activeSession;
    self->_activeSession = 0;

    int v11 = [(DIDropInSessionManager *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      __int16 v13 = [(DIDropInSessionManager *)self connectionManager];
      id v14 = [v13 manager];
      uint64_t v15 = [v14 clientQueue];
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      v23 = __43__DIDropInSessionManager_didRemoveSession___block_invoke;
      v24 = &unk_2652FC928;
      v25 = self;
      id v26 = v4;
      +[DIUtilities onQueue:v15 block:&v21];
    }
  }
  __int16 v16 = [(DIDropInSessionManager *)self incomingPendingSession];
  int v17 = [v16 isEqual:v4];

  if (v17)
  {
    uint64_t v18 = DILogHandleDIDropInSessionManager();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(DIDropInSessionManager *)self incomingPendingSession];
      *(_DWORD *)buf = 138412546;
      v28 = &stru_26FF62CC0;
      __int16 v29 = 2112;
      id v30 = v19;
      _os_log_impl(&dword_24D00D000, v18, OS_LOG_TYPE_DEFAULT, "%@Wiping incoming pending session %@", buf, 0x16u);
    }
    incomingPendingSession = self->_incomingPendingSession;
    self->_incomingPendingSession = 0;
  }
}

void __43__DIDropInSessionManager_didRemoveSession___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 manager:*(void *)(a1 + 32) didUpdateActiveSession:*(void *)(a1 + 40)];
}

- (void)didUpdateSession:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DILogHandleDIDropInSessionManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    uint64_t v22 = &stru_26FF62CC0;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Did Update Session %@", (uint8_t *)&v21, 0x16u);
  }

  id v6 = [(DIDropInSessionManager *)self incomingPendingSession];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    int v8 = DILogHandleDIDropInSessionManager();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [(DIDropInSessionManager *)self incomingPendingSession];
      int v21 = 138412546;
      uint64_t v22 = &stru_26FF62CC0;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_24D00D000, v8, OS_LOG_TYPE_DEFAULT, "%@Updating Incoming Pending Session %@", (uint8_t *)&v21, 0x16u);
    }
    v10 = [(DIDropInSessionManager *)self incomingPendingSession];
    [v10 updateWithSession:v4];

    if ([v4 state] == 4)
    {
      int v11 = DILogHandleDIDropInSessionManager();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        char v12 = [(DIDropInSessionManager *)self incomingPendingSession];
        int v21 = 138412546;
        uint64_t v22 = &stru_26FF62CC0;
        __int16 v23 = 2112;
        id v24 = v12;
        _os_log_impl(&dword_24D00D000, v11, OS_LOG_TYPE_DEFAULT, "%@Making Incoming Pending Session Active %@", (uint8_t *)&v21, 0x16u);
      }
      __int16 v13 = [(DIDropInSessionManager *)self incomingPendingSession];
      [(DIDropInSessionManager *)self setActiveSession:v13];
    }
  }
  else
  {
    id v14 = [(DIDropInSessionManager *)self activeSession];
    int v15 = [v14 isEqual:v4];

    if (v15)
    {
      __int16 v16 = DILogHandleDIDropInSessionManager();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = [(DIDropInSessionManager *)self activeSession];
        int v21 = 138412546;
        uint64_t v22 = &stru_26FF62CC0;
        __int16 v23 = 2112;
        id v24 = v17;
        _os_log_impl(&dword_24D00D000, v16, OS_LOG_TYPE_DEFAULT, "%@Updating Active Session %@", (uint8_t *)&v21, 0x16u);
      }
      uint64_t v18 = [(DIDropInSessionManager *)self activeSession];
      [v18 updateWithSession:v4];

      if ([v4 state] == 6)
      {
        v19 = DILogHandleDIDropInSessionManager();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v20 = [(DIDropInSessionManager *)self activeSession];
          int v21 = 138412546;
          uint64_t v22 = &stru_26FF62CC0;
          __int16 v23 = 2112;
          id v24 = v20;
          _os_log_impl(&dword_24D00D000, v19, OS_LOG_TYPE_DEFAULT, "%@Removing Active Session %@", (uint8_t *)&v21, 0x16u);
        }
        [(DIDropInSessionManager *)self didRemoveSession:v4];
      }
    }
  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = DILogHandleDIDropInSessionManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v19 = 138412802;
    __int16 v20 = &stru_26FF62CC0;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_24D00D000, v8, OS_LOG_TYPE_ERROR, "%@Did Fail with Error %@, %@", (uint8_t *)&v19, 0x20u);
  }

  int v9 = [(DIDropInSessionManager *)self incomingPendingSession];
  int v10 = [v9 isEqual:v6];

  if (v10)
  {
    int v11 = DILogHandleDIDropInSessionManager();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v12 = [(DIDropInSessionManager *)self incomingPendingSession];
      int v19 = 138412546;
      __int16 v20 = &stru_26FF62CC0;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl(&dword_24D00D000, v11, OS_LOG_TYPE_ERROR, "%@Incoming Pending Session Failed %@", (uint8_t *)&v19, 0x16u);
    }
    __int16 v13 = [(DIDropInSessionManager *)self incomingPendingSession];
    [v13 failWithError:v7];
  }
  id v14 = [(DIDropInSessionManager *)self activeSession];
  int v15 = [v14 isEqual:v6];

  if (v15)
  {
    __int16 v16 = DILogHandleDIDropInSessionManager();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = [(DIDropInSessionManager *)self activeSession];
      int v19 = 138412546;
      __int16 v20 = &stru_26FF62CC0;
      __int16 v21 = 2112;
      id v22 = v17;
      _os_log_impl(&dword_24D00D000, v16, OS_LOG_TYPE_ERROR, "%@Active Session Failed %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v18 = [(DIDropInSessionManager *)self activeSession];
    [v18 failWithError:v7];
  }
}

- (void)session:(id)a3 didUpdateUplinkMuteStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = DILogHandleDIDropInSessionManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    int v15 = &stru_26FF62CC0;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_24D00D000, v7, OS_LOG_TYPE_DEFAULT, "%@Did Update Uplink Muted to %d for Session %@", (uint8_t *)&v14, 0x1Cu);
  }

  int v8 = [(DIDropInSessionManager *)self incomingPendingSession];
  int v9 = [v8 isEqual:v6];

  if (v9)
  {
    int v10 = [(DIDropInSessionManager *)self incomingPendingSession];
LABEL_7:
    __int16 v13 = v10;
    [v10 updateUplinkMuteStatus:v4];

    goto LABEL_8;
  }
  int v11 = [(DIDropInSessionManager *)self activeSession];
  int v12 = [v11 isEqual:v6];

  if (v12)
  {
    int v10 = [(DIDropInSessionManager *)self activeSession];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)xpcManagerDidPerformDaemonCheckIn:(id)a3
{
  BOOL v4 = [(DIDropInSessionManager *)self connectionManager];
  id v5 = [v4 manager];
  id v6 = [v5 connection];
  id v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__DIDropInSessionManager_xpcManagerDidPerformDaemonCheckIn___block_invoke_11;
  v8[3] = &unk_2652FCBA0;
  v8[4] = self;
  [v7 getCurrentSessionWithCompletionHandler:v8];
}

void __60__DIDropInSessionManager_xpcManagerDidPerformDaemonCheckIn___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = DILogHandleDIDropInSessionManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412546;
    id v5 = &stru_26FF62CC0;
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_ERROR, "%@Failed to get proxy with Error %@", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t __60__DIDropInSessionManager_xpcManagerDidPerformDaemonCheckIn___block_invoke_11(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) didUpdateSession:a2];
  }
  return result;
}

- (DIDropInSessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DIDropInSessionManagerDelegate *)WeakRetained;
}

- (DIDropInSession)incomingPendingSession
{
  return self->_incomingPendingSession;
}

- (DIDropInSession)activeSession
{
  return self->_activeSession;
}

- (DIXPCConnectionManager)connectionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionManager);
  return (DIXPCConnectionManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_incomingPendingSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end