@interface NSCFServer
@end

@implementation NSCFServer

uint64_t __20___NSCFServer_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 40) handleIncomingConnection:a2 queue:a3 configuration:*(void *)(a1 + 32)];
}

void __38___NSCFServer_startWithAcceptHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  tcp_connection_accept();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __38___NSCFServer_startWithAcceptHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained stop];

  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v5 = (id)CFNLog::logger;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, "Listener error %d", (uint8_t *)v6, 8u);
  }
}

uint64_t __40___NSCFServer_startSocksServerWithPort___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_NSCFSocksProxy handleIncomingConnection:a2 queue:a3 configuration:0];
}

@end