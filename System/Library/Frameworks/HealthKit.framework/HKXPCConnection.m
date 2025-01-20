@interface HKXPCConnection
@end

@implementation HKXPCConnection

void __64___HKXPCConnection_resumeWithExportedInterface_remoteInterface___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection to \"%@\" interrupted", (uint8_t *)&v7, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = [WeakRetained interruptionHandler];

  if (v6) {
    v6[2](v6);
  }
}

void __64___HKXPCConnection_resumeWithExportedInterface_remoteInterface___block_invoke_26(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection to \"%@\" invalidated", (uint8_t *)&v7, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = [WeakRetained invalidationHandler];

  if (v6) {
    v6[2](v6);
  }
}

void __43___HKXPCConnection_setInterruptionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained exportedObject];
  objc_initWeak(&location, (id)v2);

  id v3 = objc_loadWeakRetained(&location);
  LOBYTE(v2) = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained(&location);
    [v4 connectionInterrupted];
  }
  objc_destroyWeak(&location);
}

void __43___HKXPCConnection_setInvalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained exportedObject];
  [v1 connectionInvalidated];
}

@end