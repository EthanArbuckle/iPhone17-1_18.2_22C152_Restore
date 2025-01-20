@interface DCDevice
+ (DCDevice)currentDevice;
- (BOOL)_isSupportedReturningError:(id *)a3;
- (BOOL)isSupported;
- (void)generateTokenWithCompletionHandler:(void *)completion;
@end

@implementation DCDevice

+ (DCDevice)currentDevice
{
  if (currentDevice_onceToken != -1) {
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)currentDevice_currentDevice;

  return (DCDevice *)v2;
}

uint64_t __25__DCDevice_currentDevice__block_invoke()
{
  currentDevice_currentDevice = objc_alloc_init(DCDevice);

  return MEMORY[0x270F9A758]();
}

- (void)generateTokenWithCompletionHandler:(void *)completion
{
  v3 = completion;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = objc_alloc_init(DCDeviceMetadataDaemonConnection);
  v4 = (void *)v14[5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__DCDevice_generateTokenWithCompletionHandler___block_invoke;
  v11[3] = &unk_264CE72B8;
  id v5 = v3;
  id v12 = v5;
  v6 = [v4 remoteObjectProxy:v11];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__DCDevice_generateTokenWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_264CE73B8;
  id v7 = v5;
  id v9 = v7;
  v10 = &v13;
  [v6 fetchOpaqueBlobWithCompletion:v8];

  _Block_object_dispose(&v13, 8);
}

void __47__DCDevice_generateTokenWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "dc_errorWithCode:", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __47__DCDevice_generateTokenWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) connection];
  [v2 invalidate];
}

- (BOOL)_isSupportedReturningError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v4 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__DCDevice__isSupportedReturningError___block_invoke;
  v9[3] = &unk_264CE7268;
  v9[4] = &v16;
  v9[5] = &v10;
  id v5 = [v4 synchronousRemoteObjectProxy:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__DCDevice__isSupportedReturningError___block_invoke_5;
  v8[3] = &unk_264CE73E0;
  void v8[4] = &v16;
  v8[5] = &v10;
  [v5 isSupportedDeviceWithCompletion:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  char v6 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __39__DCDevice__isSupportedReturningError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _DCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__DCAppAttestService__isSupportedReturningError___block_invoke_cold_1((uint64_t)v3, v4);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __39__DCDevice__isSupportedReturningError___block_invoke_5(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)isSupported
{
  id v6 = 0;
  BOOL v2 = [(DCDevice *)self _isSupportedReturningError:&v6];
  id v3 = v6;
  if (v3)
  {
    v4 = _DCLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(DCAppAttestService *)(uint64_t)v3 isSupported];
    }
  }
  return v2;
}

@end