@interface MDMServerAppInstallBlocking
- (BOOL)isAppInstallBlocked;
- (MDMServerAppInstallBlocking)init;
- (MDMServerCore)server;
- (OS_dispatch_queue)appBlockQueue;
- (id)appBlockCompletionBlock;
- (void)blockAppInstallsWithCompletion:(id)a3;
- (void)didUnblockAppInstalls;
- (void)setAppBlockCompletionBlock:(id)a3;
- (void)setAppBlockQueue:(id)a3;
- (void)setServer:(id)a3;
- (void)unblockAppInstallsWithCompletion:(id)a3;
@end

@implementation MDMServerAppInstallBlocking

- (MDMServerAppInstallBlocking)init
{
  v6.receiver = self;
  v6.super_class = (Class)MDMServerAppInstallBlocking;
  v2 = [(MDMServerAppInstallBlocking *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("app install block", 0);
    appBlockQueue = v2->_appBlockQueue;
    v2->_appBlockQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BOOL)isAppInstallBlocked
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(MDMServerAppInstallBlocking *)self appBlockQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__MDMServerAppInstallBlocking_isAppInstallBlocked__block_invoke;
  v5[3] = &unk_264B9D318;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __50__MDMServerAppInstallBlocking_isAppInstallBlocked__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appBlockCompletionBlock];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (void)blockAppInstallsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "block app installs, server block", buf, 2u);
  }
  uint64_t v6 = [(MDMServerAppInstallBlocking *)self appBlockQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__MDMServerAppInstallBlocking_blockAppInstallsWithCompletion___block_invoke;
  v8[3] = &unk_264B9E278;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __62__MDMServerAppInstallBlocking_blockAppInstallsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appBlockCompletionBlock];

  dispatch_queue_t v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_ERROR, "block app installs, server block, failing because of another blocker", buf, 2u);
    }
    if (*(void *)(a1 + 40))
    {
      id v4 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = DMCErrorArray();
      id v7 = objc_msgSend(v4, "DMCErrorWithDomain:code:descriptionArray:errorType:", v5, 12010, v6, *MEMORY[0x263F38A58], 0);

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "block app installs, server block, block established", v8, 2u);
    }
    [*(id *)(a1 + 32) setAppBlockCompletionBlock:*(void *)(a1 + 40)];
  }
}

- (void)unblockAppInstallsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "block app installs, server unblock", buf, 2u);
  }
  uint64_t v6 = [(MDMServerAppInstallBlocking *)self appBlockQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__MDMServerAppInstallBlocking_unblockAppInstallsWithCompletion___block_invoke;
  v8[3] = &unk_264B9E278;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __64__MDMServerAppInstallBlocking_unblockAppInstallsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appBlockCompletionBlock];

  dispatch_queue_t v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "block app installs, server unblock, unblocking", buf, 2u);
    }
    id v4 = [*(id *)(a1 + 32) appBlockCompletionBlock];
    v4[2](v4, 0);

    [*(id *)(a1 + 32) setAppBlockCompletionBlock:0];
    [*(id *)(a1 + 32) didUnblockAppInstalls];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_ERROR, "block app installs, server unblock, no block in place, ignoring", v6, 2u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)didUnblockAppInstalls
{
  id v2 = [(MDMServerAppInstallBlocking *)self server];
  [v2 retryNotNowWithCompletion:&__block_literal_global_6];
}

void __52__MDMServerAppInstallBlocking_didUnblockAppInstalls__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  dispatch_queue_t v3 = *(NSObject **)(DMCLogObjects() + 8);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138543362;
      id v9 = v2;
      uint64_t v5 = "block app installs, server unblock, retryNotNow failed: %{public}@";
      uint64_t v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    uint64_t v5 = "block app installs, server unblock, retryNotNow complete";
    uint64_t v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

- (OS_dispatch_queue)appBlockQueue
{
  return self->_appBlockQueue;
}

- (void)setAppBlockQueue:(id)a3
{
}

- (id)appBlockCompletionBlock
{
  return self->_appBlockCompletionBlock;
}

- (void)setAppBlockCompletionBlock:(id)a3
{
}

- (MDMServerCore)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (MDMServerCore *)WeakRetained;
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong(&self->_appBlockCompletionBlock, 0);
  objc_storeStrong((id *)&self->_appBlockQueue, 0);
}

@end