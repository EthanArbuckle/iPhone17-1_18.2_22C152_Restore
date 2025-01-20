@interface WCComplicationManager
- (OS_dispatch_queue)delegateQueue;
- (WCComplicationManager)init;
- (WCComplicationManagerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)xpcManager:(id)a3 handlePairedSyncComplicationsStartedWithCompletionHandler:(id)a4;
- (void)xpcManager:(id)a3 handlePingForExtensionBundleID:(id)a4;
- (void)xpcManager:(id)a3 isExtensionPrivileged:(id)a4 completionHandler:(id)a5;
@end

@implementation WCComplicationManager

- (WCComplicationManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)WCComplicationManager;
  v2 = [(WCComplicationManager *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.private.watchconnectivity.complication.delegate-queue", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v3;

    v5 = +[WCPrivateXPCManager sharedManager];
    [v5 setDelegate:v2];
  }
  return v2;
}

- (void)xpcManager:(id)a3 handlePingForExtensionBundleID:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = wc_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    v9 = "-[WCComplicationManager xpcManager:handlePingForExtensionBundleID:]";
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_222A02000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", (uint8_t *)&v8, 0x16u);
  }

  objc_super v7 = [(WCComplicationManager *)self delegate];
  [v7 handlePingForExtensionBundleID:v5];
}

- (void)xpcManager:(id)a3 isExtensionPrivileged:(id)a4 completionHandler:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = wc_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446466;
    uint64_t v12 = "-[WCComplicationManager xpcManager:isExtensionPrivileged:completionHandler:]";
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_222A02000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", (uint8_t *)&v11, 0x16u);
  }

  __int16 v10 = [(WCComplicationManager *)self delegate];
  [v10 isExtensionPrivileged:v7 completionHandler:v8];
}

- (void)xpcManager:(id)a3 handlePairedSyncComplicationsStartedWithCompletionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = wc_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = "-[WCComplicationManager xpcManager:handlePairedSyncComplicationsStartedWithCompletionHandler:]";
    _os_log_impl(&dword_222A02000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  id v7 = [(WCComplicationManager *)self delegate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __94__WCComplicationManager_xpcManager_handlePairedSyncComplicationsStartedWithCompletionHandler___block_invoke;
  v9[3] = &unk_26463C5E8;
  id v10 = v5;
  id v8 = v5;
  [v7 handleDeviceHasBecomeActiveWithCompletionHandler:v9];
}

void __94__WCComplicationManager_xpcManager_handlePairedSyncComplicationsStartedWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = wc_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSPrintF();
    *(_DWORD *)buf = 136446466;
    id v7 = "-[WCComplicationManager xpcManager:handlePairedSyncComplicationsStartedWithCompletionHandler:]_block_invoke";
    __int16 v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_222A02000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s %@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (WCComplicationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WCComplicationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end