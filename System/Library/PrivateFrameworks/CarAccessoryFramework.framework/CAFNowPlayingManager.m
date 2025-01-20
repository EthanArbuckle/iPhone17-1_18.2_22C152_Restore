@interface CAFNowPlayingManager
- (BSServiceConnection)connection;
- (CAFNowPlayingManager)initWithObserver:(id)a3;
- (CAFNowPlayingSnapshot)lastSnapshot;
- (OS_dispatch_queue)workQueue;
- (id)snapshotObserver;
- (void)_connectionActivated;
- (void)_connectionInterrupted;
- (void)_fetchSnapshot;
- (void)_setupConnection;
- (void)invalidate;
- (void)refreshNowPlayingSnapshot;
- (void)setConnection:(id)a3;
- (void)setSnapshotObserver:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation CAFNowPlayingManager

- (CAFNowPlayingManager)initWithObserver:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAFNowPlayingManager;
  v5 = [(CAFNowPlayingManager *)&v14 init];
  if (v5)
  {
    v6 = CAFNowPlayingLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_249710000, v6, OS_LOG_TYPE_DEFAULT, "Initializing now playing manager", v13, 2u);
    }

    v7 = [MEMORY[0x263F29C50] serial];
    uint64_t v8 = BSDispatchQueueCreate();
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = MEMORY[0x24C5AA7C0](v4);
    id snapshotObserver = v5->_snapshotObserver;
    v5->_id snapshotObserver = (id)v10;

    [(CAFNowPlayingManager *)v5 _setupConnection];
  }

  return v5;
}

- (void)_setupConnection
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "Failed to create now playing connection!", v1, 2u);
}

void __40__CAFNowPlayingManager__setupConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F2B9F0] userInitiated];
  [v3 setServiceQuality:v4];

  v5 = +[CAFNowPlayingServiceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v6 = [*(id *)(a1 + 32) workQueue];
  [v3 setTargetQueue:v6];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__CAFNowPlayingManager__setupConnection__block_invoke_2;
  v12[3] = &unk_265264508;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  [v3 setActivationHandler:v12];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __40__CAFNowPlayingManager__setupConnection__block_invoke_3;
  uint64_t v10 = &unk_265264508;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  [v3 setInterruptionHandler:&v7];
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_12, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
}

void __40__CAFNowPlayingManager__setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _connectionActivated];
    id WeakRetained = v2;
  }
}

void __40__CAFNowPlayingManager__setupConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _connectionInterrupted];
    id WeakRetained = v2;
  }
}

void __40__CAFNowPlayingManager__setupConnection__block_invoke_4()
{
  v0 = CAFNowPlayingLogging();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_249710000, v0, OS_LOG_TYPE_DEFAULT, "Now playing connection invalidated", v1, 2u);
  }
}

- (void)_connectionActivated
{
  id v3 = CAFNowPlayingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_249710000, v3, OS_LOG_TYPE_DEFAULT, "Now playing connection activated", v4, 2u);
  }

  [(CAFNowPlayingManager *)self _fetchSnapshot];
}

- (void)_connectionInterrupted
{
  id v3 = CAFNowPlayingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_249710000, v3, OS_LOG_TYPE_DEFAULT, "Now playing connection interrupted", v4, 2u);
  }

  [(CAFNowPlayingManager *)self _setupConnection];
}

- (void)_fetchSnapshot
{
  id v3 = CAFNowPlayingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_249710000, v3, OS_LOG_TYPE_DEFAULT, "Fetching latest now playing snapshot", buf, 2u);
  }

  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__CAFNowPlayingManager__fetchSnapshot__block_invoke;
  v5[3] = &unk_265264578;
  v5[4] = self;
  [v4 fetchNowPlayingSnapshotWithReply:v5];
}

void __38__CAFNowPlayingManager__fetchSnapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CAFGeneralLogging();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_249710000, v7, OS_LOG_TYPE_DEFAULT, "Last snapshot update error: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_249710000, v7, OS_LOG_TYPE_DEFAULT, "Received updated now playing snapshot %@", buf, 0xCu);
    }

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__CAFNowPlayingManager__fetchSnapshot__block_invoke_7;
    v9[3] = &unk_265263280;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

void __38__CAFNowPlayingManager__fetchSnapshot__block_invoke_7(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) snapshotObserver];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) snapshotObserver];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

- (void)refreshNowPlayingSnapshot
{
  id v3 = CAFNowPlayingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_249710000, v3, OS_LOG_TYPE_DEFAULT, "Refreshing snapshot", v4, 2u);
  }

  [(CAFNowPlayingManager *)self _fetchSnapshot];
}

- (void)invalidate
{
  id v3 = CAFNowPlayingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_249710000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating now playing", v5, 2u);
  }

  [(BSServiceConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (CAFNowPlayingSnapshot)lastSnapshot
{
  return self->_lastSnapshot;
}

- (id)snapshotObserver
{
  return self->_snapshotObserver;
}

- (void)setSnapshotObserver:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_snapshotObserver, 0);
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
}

@end