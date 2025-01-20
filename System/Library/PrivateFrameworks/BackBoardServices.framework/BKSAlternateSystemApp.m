@interface BKSAlternateSystemApp
- (BKSAlternateSystemApp)alternateSystemAppWithBundleID:(id)a3 didExitWithContext:(id)a4;
- (BKSAlternateSystemApp)alternateSystemAppWithBundleID:(id)a3 failedToOpenWithResult:(id)a4;
- (BKSAlternateSystemApp)alternateSystemAppWithBundleIDDidOpen:(id)a3;
- (BKSAlternateSystemApp)alternateSystemAppWithBundleIDDidTerminate:(id)a3;
- (BKSAlternateSystemApp)initWithBundleId:(id)a3;
- (BKSAlternateSystemAppDelegate)delegate;
- (BOOL)stateChangeWaiter;
- (NSString)bundleId;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)stateChangeSemaphore;
- (int64_t)state;
- (void)_handleInterruptedConnection;
- (void)_queue_changeState:(int64_t)a3;
- (void)_queue_ensureConnection;
- (void)_queue_invalidate;
- (void)_waitForState:(int64_t)a3;
- (void)activate;
- (void)dealloc;
- (void)didBlockSystemAppForAlternateSystemApp;
- (void)didUnblockSystemAppForAlternateSystemApp;
- (void)setBundleId:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateChangeSemaphore:(id)a3;
- (void)setStateChangeWaiter:(BOOL)a3;
- (void)terminate;
@end

@implementation BKSAlternateSystemApp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateChangeSemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setStateChangeSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)stateChangeSemaphore
{
  return self->_stateChangeSemaphore;
}

- (void)setStateChangeWaiter:(BOOL)a3
{
  self->_stateChangeWaiter = a3;
}

- (BOOL)stateChangeWaiter
{
  return self->_stateChangeWaiter;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setDelegate:(id)a3
{
}

- (BKSAlternateSystemAppDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BKSAlternateSystemAppDelegate *)WeakRetained;
}

- (BKSAlternateSystemApp)alternateSystemAppWithBundleIDDidTerminate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleIDDidTerminate:]";
    _os_log_debug_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEBUG, "%s: message from server", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__BKSAlternateSystemApp_alternateSystemAppWithBundleIDDidTerminate___block_invoke;
  block[3] = &unk_1E5441710;
  block[4] = self;
  dispatch_async(queue, block);
  return result;
}

void __68__BKSAlternateSystemApp_alternateSystemAppWithBundleIDDidTerminate___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];
  [v1 unblockSystemAppForAlternateSystemApp];

  v2 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    v4 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleIDDidTerminate:]_block_invoke";
    _os_log_debug_impl(&dword_18AA0B000, v2, OS_LOG_TYPE_DEBUG, "%s: requested unblock of system app", (uint8_t *)&v3, 0xCu);
  }
}

- (BKSAlternateSystemApp)alternateSystemAppWithBundleIDDidOpen:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleIDDidOpen:]";
    _os_log_debug_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEBUG, "%s: message from server", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__BKSAlternateSystemApp_alternateSystemAppWithBundleIDDidOpen___block_invoke;
  block[3] = &unk_1E5441710;
  block[4] = self;
  dispatch_async(queue, block);
  return result;
}

void __63__BKSAlternateSystemApp_alternateSystemAppWithBundleIDDidOpen___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained alternateSystemAppDidLaunch:*(void *)(a1 + 32)];
    int v3 = BKLogAlternateSystemApp();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      v8 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleIDDidOpen:]_block_invoke";
      v4 = "%s: called out to delegate alternateSystemAppDidLaunch:";
      uint64_t v5 = v3;
      uint32_t v6 = 12;
LABEL_8:
      _os_log_debug_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v7, v6);
    }
  }
  else
  {
    int v3 = BKLogAlternateSystemApp();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315394;
      v8 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleIDDidOpen:]_block_invoke";
      __int16 v9 = 2114;
      id v10 = WeakRetained;
      v4 = "%s: did not call out to alternateSystemAppDidLaunch: for delegate %{public}@";
      uint64_t v5 = v3;
      uint32_t v6 = 22;
      goto LABEL_8;
    }
  }
}

- (BKSAlternateSystemApp)alternateSystemAppWithBundleID:(id)a3 didExitWithContext:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint32_t v6 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:didExitWithContext:]";
    _os_log_debug_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_DEBUG, "%s: message from server", buf, 0xCu);
  }

  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__BKSAlternateSystemApp_alternateSystemAppWithBundleID_didExitWithContext___block_invoke;
  v10[3] = &unk_1E5441BB0;
  v10[4] = self;
  id v11 = v5;
  id v8 = v5;
  dispatch_async(queue, v10);

  return result;
}

void __75__BKSAlternateSystemApp_alternateSystemAppWithBundleID_didExitWithContext___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_queue_changeState:", 2);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  int v3 = [*(id *)(a1 + 40) status];
  if ([v3 isSignal])
  {
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [WeakRetained alternateSystemApp:*(void *)(a1 + 32) didTerminateWithSignal:0xFFFFFFFFLL];
      v4 = BKLogAlternateSystemApp();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        int v9 = 136315138;
        id v10 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:didExitWithContext:]_block_invoke";
        id v5 = "%s called out to delegate alternateSystemApp:didTerminateWithSignal:";
LABEL_10:
        int v7 = v4;
        uint32_t v8 = 12;
LABEL_17:
        _os_log_debug_impl(&dword_18AA0B000, v7, OS_LOG_TYPE_DEBUG, v5, (uint8_t *)&v9, v8);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    v4 = BKLogAlternateSystemApp();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    int v9 = 136315394;
    id v10 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:didExitWithContext:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = WeakRetained;
    id v5 = "%s did not call out to alternateSystemApp:didTerminateWithSignal: for delegate %{public}@";
LABEL_16:
    int v7 = v4;
    uint32_t v8 = 22;
    goto LABEL_17;
  }
  BOOL v6 = [*(id *)(a1 + 40) type] != 1;
  if (!WeakRetained || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v4 = BKLogAlternateSystemApp();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    int v9 = 136315394;
    id v10 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:didExitWithContext:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = WeakRetained;
    id v5 = "%s did not call out to alternateSystemApp:didExitWithStatus: for delegate %{public}@";
    goto LABEL_16;
  }
  [WeakRetained alternateSystemApp:*(void *)(a1 + 32) didExitWithStatus:v6];
  v4 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    id v10 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:didExitWithContext:]_block_invoke";
    id v5 = "%s called out to delegate alternateSystemApp:didExitWithStatus:";
    goto LABEL_10;
  }
LABEL_14:
}

- (BKSAlternateSystemApp)alternateSystemAppWithBundleID:(id)a3 failedToOpenWithResult:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:failedToOpenWithResult:]";
    _os_log_debug_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_DEBUG, "%s: message from server", buf, 0xCu);
  }

  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__BKSAlternateSystemApp_alternateSystemAppWithBundleID_failedToOpenWithResult___block_invoke;
  v10[3] = &unk_1E5441BB0;
  v10[4] = self;
  id v11 = v5;
  id v8 = v5;
  dispatch_async(queue, v10);

  return result;
}

void __79__BKSAlternateSystemApp_alternateSystemAppWithBundleID_failedToOpenWithResult___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_queue_changeState:", 2);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained alternateSystemApp:*(void *)(a1 + 32) didFailToLaunchWithError:*(void *)(a1 + 40)];
    int v3 = BKLogAlternateSystemApp();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      id v8 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:failedToOpenWithResult:]_block_invoke";
      v4 = "%s called out to delegate alternateSystemApp:didFailToLaunchWithError:";
      id v5 = v3;
      uint32_t v6 = 12;
LABEL_8:
      _os_log_debug_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v7, v6);
    }
  }
  else
  {
    int v3 = BKLogAlternateSystemApp();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315394;
      id v8 = "-[BKSAlternateSystemApp alternateSystemAppWithBundleID:failedToOpenWithResult:]_block_invoke";
      __int16 v9 = 2114;
      id v10 = WeakRetained;
      v4 = "%s did not call out to alternateSystemApp:didFailToLaunchWithError: for delegate %{public}@";
      id v5 = v3;
      uint32_t v6 = 22;
      goto LABEL_8;
    }
  }
}

- (void)didUnblockSystemAppForAlternateSystemApp
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[BKSAlternateSystemApp didUnblockSystemAppForAlternateSystemApp]";
    _os_log_debug_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_DEBUG, "%s: message from server", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__BKSAlternateSystemApp_didUnblockSystemAppForAlternateSystemApp__block_invoke;
  block[3] = &unk_1E5441710;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __65__BKSAlternateSystemApp_didUnblockSystemAppForAlternateSystemApp__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_changeState:", 0);
}

- (void)didBlockSystemAppForAlternateSystemApp
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[BKSAlternateSystemApp didBlockSystemAppForAlternateSystemApp]";
    _os_log_debug_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_DEBUG, "%s: message from server", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__BKSAlternateSystemApp_didBlockSystemAppForAlternateSystemApp__block_invoke;
  block[3] = &unk_1E5441710;
  block[4] = self;
  dispatch_async(queue, block);
}

void __63__BKSAlternateSystemApp_didBlockSystemAppForAlternateSystemApp__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 48) != 2)
  {
    int v3 = [*(id *)(v1 + 32) remoteObjectProxy];
    [v3 openAlternateSystemAppWithBundleID:*(void *)(*(void *)(a1 + 32) + 24)];

    v4 = BKLogAlternateSystemApp();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 24);
      int v6 = 136315394;
      int v7 = "-[BKSAlternateSystemApp didBlockSystemAppForAlternateSystemApp]_block_invoke";
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_debug_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEBUG, "%s: requested open of alternate system app \"%{public}@\"", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_handleInterruptedConnection
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__BKSAlternateSystemApp__handleInterruptedConnection__block_invoke;
  block[3] = &unk_1E5441710;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__BKSAlternateSystemApp__handleInterruptedConnection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 48);
  switch(v2)
  {
    case 3:
      objc_msgSend((id)v1, "_queue_changeState:", 0);
      break;
    case 2:
      id v3 = [*(id *)(v1 + 32) remoteObjectProxy];
      [v3 blockSystemAppForAlternateSystemApp];

      break;
    case 1:
      [(id)v1 activate];
      break;
  }
}

- (void)_queue_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSXPCConnection *)self->_connection invalidate];
  [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection setExportedObject:0];
  [(BKSAlternateSystemApp *)self setConnection:0];
}

- (void)_waitForState:(int64_t)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  while (1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    queue = self->_queue;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __39__BKSAlternateSystemApp__waitForState___block_invoke;
    block[3] = &unk_1E5441120;
    void block[5] = &v8;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(queue, block);
    if (*((unsigned char *)v9 + 24)) {
      break;
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_stateChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    _Block_object_dispose(&v8, 8);
  }
  _Block_object_dispose(&v8, 8);
}

void *__39__BKSAlternateSystemApp__waitForState___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = result[6] == *(void *)(result[4] + 48);
  return result;
}

- (void)_queue_changeState:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3) {
      int v6 = @"Unknown";
    }
    else {
      int v6 = off_1E5441140[a3];
    }
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_DEFAULT, "Setting state to %{public}@", (uint8_t *)&v7, 0xCu);
  }

  self->_state = a3;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_stateChangeSemaphore);
}

- (void)_queue_ensureConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_connection)
  {
    if (self->_state)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = v12;
      unint64_t state = self->_state;
      if (state > 3) {
        v15 = @"Unknown";
      }
      else {
        v15 = off_1E5441140[state];
      }
      [v12 handleFailureInMethod:a2, self, @"BKSAlternateSystemApp.m", 119, @"BKSAlternateSystemApp %@ has no connection but is in state %@ instead of Idle", self, v15 object file lineNumber description];
    }
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.backboard.altsysapp" options:4096];
    connection = self->_connection;
    self->_connection = v4;

    int v6 = self->_connection;
    int v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED7793D0];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    uint64_t v8 = self->_connection;
    uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED773908];
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    objc_initWeak(&location, self);
    uint64_t v10 = self->_connection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke;
    v18[3] = &unk_1E54410F8;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v10 setInterruptionHandler:v18];
    char v11 = self->_connection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke_3;
    v16[3] = &unk_1E54410F8;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v11 setInvalidationHandler:v16];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained[5];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke_2;
  block[3] = &unk_1E5441710;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_async(v2, block);
}

void __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained[5];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke_4;
  block[3] = &unk_1E5441710;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_async(v2, block);
}

uint64_t __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInvalidatedConnection];
}

uint64_t __48__BKSAlternateSystemApp__queue_ensureConnection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInterruptedConnection];
}

- (void)terminate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__BKSAlternateSystemApp_terminate__block_invoke;
  block[3] = &unk_1E5441710;
  void block[4] = self;
  dispatch_async(queue, block);
  [(BKSAlternateSystemApp *)self _waitForState:0];
  v4 = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__BKSAlternateSystemApp_terminate__block_invoke_7;
  v5[3] = &unk_1E5441710;
  v5[4] = self;
  dispatch_sync(v4, v5);
}

void __34__BKSAlternateSystemApp_terminate__block_invoke(uint64_t a1)
{
  uint64_t v2 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18AA0B000, v2, OS_LOG_TYPE_DEFAULT, "Terminating", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_changeState:", 3);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];
  [v3 terminateAlternateSystemAppWithBundleID:*(void *)(*(void *)(a1 + 32) + 24)];
}

uint64_t __34__BKSAlternateSystemApp_terminate__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_invalidate");
}

- (void)activate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__BKSAlternateSystemApp_activate__block_invoke;
  block[3] = &unk_1E5441710;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __33__BKSAlternateSystemApp_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18AA0B000, v2, OS_LOG_TYPE_DEFAULT, "Activating", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  objc_msgSend(*(id *)(a1 + 32), "_queue_changeState:", 1);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];
  [v3 blockSystemAppForAlternateSystemApp];
}

- (void)dealloc
{
  if (self->_connection)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"BKSAlternateSystemApp.m", 81, @"BKSAlternateSystemApp %@: you must call -terminate before -dealloc", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)BKSAlternateSystemApp;
  [(BKSAlternateSystemApp *)&v5 dealloc];
}

- (BKSAlternateSystemApp)initWithBundleId:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKSAlternateSystemApp;
  objc_super v5 = [(BKSAlternateSystemApp *)&v13 init];
  int v6 = v5;
  if (v5)
  {
    v5->_unint64_t state = 0;
    [(BKSAlternateSystemApp *)v5 setBundleId:v4];
    v6->_stateChangeWaiter = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    stateChangeSemaphore = v6->_stateChangeSemaphore;
    v6->_stateChangeSemaphore = (OS_dispatch_semaphore *)v7;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)Serial;

    connection = v6->_connection;
    v6->_connection = 0;
  }
  return v6;
}

@end