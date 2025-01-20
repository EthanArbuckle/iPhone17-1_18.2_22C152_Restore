@interface DIAudioSystemController
- (BOOL)isDownlinkMuted;
- (BOOL)isUplinkMuted;
- (BOOL)needsInitialDownlinkMuteStatus;
- (BOOL)needsInitialUplinkMuteStatus;
- (DIAudioSystemController)initWithConnectionManager:(id)a3;
- (DIAudioSystemControllerDelegate)delegate;
- (DIXPCConnectionManager)connectionManager;
- (NSRecursiveLock)lock;
- (void)dealloc;
- (void)didUpdateDownlinkMuteStatus:(BOOL)a3;
- (void)didUpdateUplinkMuteStatus:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3;
- (void)setNeedsInitialDownlinkMuteStatus:(BOOL)a3;
- (void)setNeedsInitialUplinkMuteStatus:(BOOL)a3;
- (void)setUplinkMuted:(BOOL)a3;
@end

@implementation DIAudioSystemController

- (DIAudioSystemController)initWithConnectionManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIAudioSystemController;
  v5 = [(DIAudioSystemController *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    lock = v5->_lock;
    v5->_lock = (NSRecursiveLock *)v6;

    *(_WORD *)&v5->_needsInitialUplinkMuteStatus = 257;
    id v8 = objc_storeWeak((id *)&v5->_connectionManager, v4);
    v9 = [v4 dispatcher];
    [v9 setAudioStatusDelegate:v5];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = DILogHandleAudioSystemController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = &stru_26FF62CC0;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_DEFAULT, "%@Tearing down Audio System Controller", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)DIAudioSystemController;
  [(DIAudioSystemController *)&v4 dealloc];
}

- (BOOL)isUplinkMuted
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(DIAudioSystemController *)self lock];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__DIAudioSystemController_isUplinkMuted__block_invoke;
  v5[3] = &unk_2652FC898;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "di_synchronize:", v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __40__DIAudioSystemController_isUplinkMuted__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) needsInitialUplinkMuteStatus])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v2 = [*(id *)(a1 + 32) connectionManager];
    v3 = [v2 manager];
    objc_super v4 = [v3 connection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__DIAudioSystemController_isUplinkMuted__block_invoke_2;
    v12[3] = &unk_2652FC848;
    v12[4] = *(void *)(a1 + 40);
    v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v12];
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    uint64_t v8 = __40__DIAudioSystemController_isUplinkMuted__block_invoke_4;
    char v9 = &unk_2652FCC70;
    objc_copyWeak(&v11, &location);
    uint64_t v10 = *(void *)(a1 + 40);
    [v5 getUplinkMutedWithCompletionHandler:&v6];

    if ((objc_msgSend(*(id *)(a1 + 32), "needsInitialUplinkMuteStatus", v6, v7, v8, v9) & 1) == 0) {
      *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  }
}

void __40__DIAudioSystemController_isUplinkMuted__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  objc_super v4 = DILogHandleAudioSystemController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412546;
    uint64_t v6 = &stru_26FF62CC0;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_24D00D000, v4, OS_LOG_TYPE_ERROR, "%@Failed to get uplink muted %@", (uint8_t *)&v5, 0x16u);
  }
}

void __40__DIAudioSystemController_isUplinkMuted__block_invoke_4(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  [WeakRetained setNeedsInitialUplinkMuteStatus:0];
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = [(DIAudioSystemController *)self connectionManager];
  int v5 = [v4 manager];
  uint64_t v6 = [v5 connection];
  __int16 v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_6];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__DIAudioSystemController_setUplinkMuted___block_invoke_7;
  v8[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  BOOL v9 = v3;
  [v7 setUplinkMuted:v3 completionHandler:v8];
}

void __42__DIAudioSystemController_setUplinkMuted___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = DILogHandleAudioSystemController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412546;
    int v5 = &stru_26FF62CC0;
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_ERROR, "%@Failed to set uplink muted %@", (uint8_t *)&v4, 0x16u);
  }
}

void __42__DIAudioSystemController_setUplinkMuted___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v4 = DILogHandleAudioSystemController();
  int v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = *(unsigned __int8 *)(a1 + 32);
      int v11 = 138412546;
      v12 = &stru_26FF62CC0;
      __int16 v13 = 1024;
      int v14 = v6;
      id v7 = "%@Failed to set uplink muted to %d";
      uint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_24D00D000, v8, v9, v7, (uint8_t *)&v11, 0x12u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(unsigned __int8 *)(a1 + 32);
    int v11 = 138412546;
    v12 = &stru_26FF62CC0;
    __int16 v13 = 1024;
    int v14 = v10;
    id v7 = "%@Uplink muted set to %d";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }
}

- (BOOL)isDownlinkMuted
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(DIAudioSystemController *)self lock];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__DIAudioSystemController_isDownlinkMuted__block_invoke;
  v5[3] = &unk_2652FC898;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "di_synchronize:", v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __42__DIAudioSystemController_isDownlinkMuted__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) needsInitialDownlinkMuteStatus])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v2 = [*(id *)(a1 + 32) connectionManager];
    BOOL v3 = [v2 manager];
    int v4 = [v3 connection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__DIAudioSystemController_isDownlinkMuted__block_invoke_2;
    v12[3] = &unk_2652FC848;
    v12[4] = *(void *)(a1 + 40);
    int v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v12];
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    uint64_t v8 = __42__DIAudioSystemController_isDownlinkMuted__block_invoke_8;
    char v9 = &unk_2652FCC70;
    objc_copyWeak(&v11, &location);
    uint64_t v10 = *(void *)(a1 + 40);
    [v5 getDownlinkMutedWithCompletionHandler:&v6];

    if ((objc_msgSend(*(id *)(a1 + 32), "needsInitialDownlinkMuteStatus", v6, v7, v8, v9) & 1) == 0) {
      *(unsigned char *)(*(void *)(a1 + 32) + 9) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 9);
  }
}

void __42__DIAudioSystemController_isDownlinkMuted__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  int v4 = DILogHandleAudioSystemController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412546;
    uint64_t v6 = &stru_26FF62CC0;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_24D00D000, v4, OS_LOG_TYPE_ERROR, "%@Failed to get downlink muted %@", (uint8_t *)&v5, 0x16u);
  }
}

void __42__DIAudioSystemController_isDownlinkMuted__block_invoke_8(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  [WeakRetained setNeedsInitialDownlinkMuteStatus:0];
}

- (void)setDownlinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [(DIAudioSystemController *)self connectionManager];
  int v5 = [v4 manager];
  uint64_t v6 = [v5 connection];
  __int16 v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_10_0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__DIAudioSystemController_setDownlinkMuted___block_invoke_11;
  v8[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  BOOL v9 = v3;
  [v7 setDownlinkMuted:v3 completionHandler:v8];
}

void __44__DIAudioSystemController_setDownlinkMuted___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = DILogHandleAudioSystemController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412546;
    int v5 = &stru_26FF62CC0;
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_ERROR, "%@Failed to set downlink muted %@", (uint8_t *)&v4, 0x16u);
  }
}

void __44__DIAudioSystemController_setDownlinkMuted___block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v4 = DILogHandleAudioSystemController();
  int v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = *(unsigned __int8 *)(a1 + 32);
      int v11 = 138412546;
      v12 = &stru_26FF62CC0;
      __int16 v13 = 1024;
      int v14 = v6;
      id v7 = "%@Failed to set downlink muted to %d";
      uint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_24D00D000, v8, v9, v7, (uint8_t *)&v11, 0x12u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(unsigned __int8 *)(a1 + 32);
    int v11 = 138412546;
    v12 = &stru_26FF62CC0;
    __int16 v13 = 1024;
    int v14 = v10;
    id v7 = "%@Uplink muted set to %d";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }
}

- (void)didUpdateDownlinkMuteStatus:(BOOL)a3
{
  int v5 = [(DIAudioSystemController *)self lock];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__DIAudioSystemController_didUpdateDownlinkMuteStatus___block_invoke;
  v13[3] = &unk_2652FC950;
  v13[4] = self;
  BOOL v14 = a3;
  objc_msgSend(v5, "di_synchronize:", v13);

  int v6 = [(DIAudioSystemController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(DIAudioSystemController *)self connectionManager];
    os_log_type_t v9 = [v8 manager];
    int v10 = [v9 clientQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__DIAudioSystemController_didUpdateDownlinkMuteStatus___block_invoke_2;
    v11[3] = &unk_2652FC950;
    v11[4] = self;
    BOOL v12 = a3;
    +[DIUtilities onQueue:v10 block:v11];
  }
}

uint64_t __55__DIAudioSystemController_didUpdateDownlinkMuteStatus___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) setNeedsInitialDownlinkMuteStatus:0];
}

void __55__DIAudioSystemController_didUpdateDownlinkMuteStatus___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) didUpdateDownlinkMuteStatus:*(unsigned __int8 *)(a1 + 40)];
}

- (void)didUpdateUplinkMuteStatus:(BOOL)a3
{
  int v5 = [(DIAudioSystemController *)self lock];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__DIAudioSystemController_didUpdateUplinkMuteStatus___block_invoke;
  v13[3] = &unk_2652FC950;
  v13[4] = self;
  BOOL v14 = a3;
  objc_msgSend(v5, "di_synchronize:", v13);

  int v6 = [(DIAudioSystemController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(DIAudioSystemController *)self connectionManager];
    os_log_type_t v9 = [v8 manager];
    int v10 = [v9 clientQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__DIAudioSystemController_didUpdateUplinkMuteStatus___block_invoke_2;
    v11[3] = &unk_2652FC950;
    v11[4] = self;
    BOOL v12 = a3;
    +[DIUtilities onQueue:v10 block:v11];
  }
}

uint64_t __53__DIAudioSystemController_didUpdateUplinkMuteStatus___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) setNeedsInitialUplinkMuteStatus:0];
}

void __53__DIAudioSystemController_didUpdateUplinkMuteStatus___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controller:*(void *)(a1 + 32) didUpdateUplinkMuteStatus:*(unsigned __int8 *)(a1 + 40)];
}

- (DIAudioSystemControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DIAudioSystemControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DIXPCConnectionManager)connectionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionManager);
  return (DIXPCConnectionManager *)WeakRetained;
}

- (BOOL)needsInitialUplinkMuteStatus
{
  return self->_needsInitialUplinkMuteStatus;
}

- (void)setNeedsInitialUplinkMuteStatus:(BOOL)a3
{
  self->_needsInitialUplinkMuteStatus = a3;
}

- (BOOL)needsInitialDownlinkMuteStatus
{
  return self->_needsInitialDownlinkMuteStatus;
}

- (void)setNeedsInitialDownlinkMuteStatus:(BOOL)a3
{
  self->_needsInitialDownlinkMuteStatus = a3;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_destroyWeak((id *)&self->_delegate);
}

@end