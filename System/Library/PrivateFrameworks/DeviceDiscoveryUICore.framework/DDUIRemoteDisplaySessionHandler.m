@interface DDUIRemoteDisplaySessionHandler
@end

@implementation DDUIRemoteDisplaySessionHandler

uint64_t __50___DDUIRemoteDisplaySessionHandler_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

void __59___DDUIRemoteDisplaySessionHandler_activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = _DDUICoreLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59___DDUIRemoteDisplaySessionHandler_activateWithCompletion___block_invoke_cold_1(a1, v4);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 8) = v3 != 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74___DDUIRemoteDisplaySessionHandler_enterSessionWithRemoteDeviceID_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (!a2)
  {
    v5 = WeakRetained;
    [WeakRetained[2] enterDiscoverySessionWithDevice:*(void *)(a1 + 32) reason:*(void *)(a1 + 40)];
    id WeakRetained = v5;
  }
}

void __72___DDUIRemoteDisplaySessionHandler_presentProxCardForDevice_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = _DDUICoreLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    v11 = WeakRetained;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1CFC71000, v8, OS_LOG_TYPE_DEFAULT, "{self: %@} Dedicated camera prox card response: %@ with error: %@", (uint8_t *)&v10, 0x20u);
  }

  v9 = (void *)WeakRetained[3];
  WeakRetained[3] = 0;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___DDUIRemoteDisplaySessionHandler_activateWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1CFC71000, a2, OS_LOG_TYPE_ERROR, "%@: could not activate remote display discovery", (uint8_t *)&v3, 0xCu);
}

@end