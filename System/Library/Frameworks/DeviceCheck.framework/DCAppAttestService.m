@interface DCAppAttestService
+ (DCAppAttestService)sharedService;
- (BOOL)_isSupportedReturningError:(id *)a3;
- (BOOL)isSupported;
- (id)_loadAppUUID;
- (id)_rewrapAsDCError:(id)a3;
- (void)_saveAppUUID:(id)a3;
- (void)attestKey:(NSString *)keyId clientDataHash:(NSData *)clientDataHash completionHandler:(void *)completionHandler;
- (void)dispatchCompletionHandler:(id)a3 ontoQueue:(id)a4;
- (void)generateAssertion:(NSString *)keyId clientDataHash:(NSData *)clientDataHash completionHandler:(void *)completionHandler;
- (void)generateKeyWithCompletionHandler:(void *)completionHandler;
- (void)isSupported;
@end

@implementation DCAppAttestService

+ (DCAppAttestService)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedService_sharedService;

  return (DCAppAttestService *)v2;
}

- (BOOL)isSupported
{
  id v6 = 0;
  BOOL v2 = [(DCAppAttestService *)self _isSupportedReturningError:&v6];
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

- (BOOL)_isSupportedReturningError:(id *)a3
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v4 = objc_opt_new();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__DCAppAttestService__isSupportedReturningError___block_invoke;
  v13[3] = &unk_264CE7268;
  v13[4] = &v20;
  v13[5] = &v14;
  v5 = [v4 synchronousRemoteObjectProxy:v13];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__DCAppAttestService__isSupportedReturningError___block_invoke_3;
  v9[3] = &unk_264CE7290;
  v11 = &v20;
  v12 = &v14;
  id v6 = v4;
  id v10 = v6;
  [v5 appAttestationIsSupportedWithCompletion:v9];
  if (a3) {
    *a3 = (id) v15[5];
  }
  char v7 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v7;
}

void __49__DCAppAttestService__isSupportedReturningError___block_invoke_3(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  id v6 = [*(id *)(a1 + 32) connection];

  [v6 invalidate];
}

uint64_t __35__DCAppAttestService_sharedService__block_invoke()
{
  sharedService_sharedService = objc_alloc_init(DCAppAttestService);

  return MEMORY[0x270F9A758]();
}

void __49__DCAppAttestService__isSupportedReturningError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _DCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__DCAppAttestService__isSupportedReturningError___block_invoke_cold_1((uint64_t)v3, v4);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)_loadAppUUID
{
  BOOL v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v2 stringForKey:@"com.apple.DC.AppAttestAppUUID"];

  v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];
  if (v4) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)_saveAppUUID:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"com.apple.DC.AppAttestAppUUID"];
}

- (id)_rewrapAsDCError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    int v6 = [v5 isEqualToString:@"com.apple.appattest.error"];

    if (v6 && (uint64_t v7 = [v4 code], (unint64_t)(v7 + 7) <= 5)) {
      uint64_t v8 = *((void *)&unk_2378D7B30 + v7 + 7);
    }
    else {
      uint64_t v8 = 0;
    }
    v9 = objc_msgSend(MEMORY[0x263F087E8], "dc_errorWithCode:", v8);
    id v10 = _DCLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(DCAppAttestService *)(uint64_t)v9 _rewrapAsDCError:v10];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)generateKeyWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  char v23 = objc_alloc_init(DCDeviceMetadataDaemonConnection);
  id v5 = (void *)v19[5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__DCAppAttestService_generateKeyWithCompletionHandler___block_invoke;
  v16[3] = &unk_264CE72B8;
  id v6 = v4;
  id v17 = v6;
  uint64_t v7 = [v5 remoteObjectProxy:v16];
  uint64_t v8 = [(DCAppAttestService *)self _loadAppUUID];
  v9 = dispatch_get_current_queue();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__DCAppAttestService_generateKeyWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_264CE7308;
  v12[4] = self;
  id v10 = v6;
  id v14 = v10;
  v15 = &v18;
  id v11 = v9;
  id v13 = v11;
  [v7 appAttestationCreateKey:v8 completion:v12];

  _Block_object_dispose(&v18, 8);
}

void __55__DCAppAttestService_generateKeyWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "dc_errorWithCode:", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __55__DCAppAttestService_generateKeyWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__DCAppAttestService_generateKeyWithCompletionHandler___block_invoke_3;
  v17[3] = &unk_264CE72E0;
  v17[4] = v10;
  id v18 = v7;
  id v11 = *(id *)(a1 + 48);
  id v19 = v8;
  id v20 = v9;
  uint64_t v12 = *(void *)(a1 + 56);
  id v21 = v11;
  uint64_t v22 = v12;
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  [v10 dispatchCompletionHandler:v17 ontoQueue:v13];
}

void __55__DCAppAttestService_generateKeyWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _saveAppUUID:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) _rewrapAsDCError:*(void *)(a1 + 56)];
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4);

  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) connection];
  [v5 invalidate];
}

- (void)attestKey:(NSString *)keyId clientDataHash:(NSData *)clientDataHash completionHandler:(void *)completionHandler
{
  id v8 = keyId;
  id v9 = clientDataHash;
  id v10 = completionHandler;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = objc_alloc_init(DCDeviceMetadataDaemonConnection);
  id v11 = (void *)v25[5];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __65__DCAppAttestService_attestKey_clientDataHash_completionHandler___block_invoke;
  v22[3] = &unk_264CE72B8;
  id v12 = v10;
  id v23 = v12;
  uint64_t v13 = [v11 remoteObjectProxy:v22];
  id v14 = [(DCAppAttestService *)self _loadAppUUID];
  id v15 = dispatch_get_current_queue();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__DCAppAttestService_attestKey_clientDataHash_completionHandler___block_invoke_2;
  v18[3] = &unk_264CE7358;
  v18[4] = self;
  id v16 = v12;
  id v20 = v16;
  id v21 = &v24;
  id v17 = v15;
  id v19 = v17;
  [v13 appAttestationAttestKey:v14 keyId:v8 clientDataHash:v9 completion:v18];

  _Block_object_dispose(&v24, 8);
}

void __65__DCAppAttestService_attestKey_clientDataHash_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "dc_errorWithCode:", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __65__DCAppAttestService_attestKey_clientDataHash_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__DCAppAttestService_attestKey_clientDataHash_completionHandler___block_invoke_3;
  v13[3] = &unk_264CE7330;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v9;
  id v16 = v6;
  id v17 = v8;
  uint64_t v18 = *(void *)(a1 + 56);
  id v11 = v6;
  id v12 = v5;
  [v7 dispatchCompletionHandler:v13 ontoQueue:v10];
}

void __65__DCAppAttestService_attestKey_clientDataHash_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = [*(id *)(a1 + 40) _rewrapAsDCError:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v2, v4);

  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) connection];
  [v5 invalidate];
}

- (void)generateAssertion:(NSString *)keyId clientDataHash:(NSData *)clientDataHash completionHandler:(void *)completionHandler
{
  id v8 = keyId;
  uint64_t v9 = clientDataHash;
  uint64_t v10 = completionHandler;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = objc_alloc_init(DCDeviceMetadataDaemonConnection);
  id v11 = (void *)v25[5];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __73__DCAppAttestService_generateAssertion_clientDataHash_completionHandler___block_invoke;
  v22[3] = &unk_264CE72B8;
  id v12 = v10;
  id v23 = v12;
  uint64_t v13 = [v11 remoteObjectProxy:v22];
  id v14 = [(DCAppAttestService *)self _loadAppUUID];
  uint64_t v15 = dispatch_get_current_queue();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __73__DCAppAttestService_generateAssertion_clientDataHash_completionHandler___block_invoke_2;
  v18[3] = &unk_264CE7358;
  v18[4] = self;
  id v16 = v12;
  id v20 = v16;
  id v21 = &v24;
  id v17 = v15;
  id v19 = v17;
  [v13 appAttestationAssert:v14 keyId:v8 clientDataHash:v9 completion:v18];

  _Block_object_dispose(&v24, 8);
}

void __73__DCAppAttestService_generateAssertion_clientDataHash_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "dc_errorWithCode:", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __73__DCAppAttestService_generateAssertion_clientDataHash_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__DCAppAttestService_generateAssertion_clientDataHash_completionHandler___block_invoke_3;
  v13[3] = &unk_264CE7330;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v9;
  id v16 = v6;
  id v17 = v8;
  uint64_t v18 = *(void *)(a1 + 56);
  id v11 = v6;
  id v12 = v5;
  [v7 dispatchCompletionHandler:v13 ontoQueue:v10];
}

void __73__DCAppAttestService_generateAssertion_clientDataHash_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = [*(id *)(a1 + 40) _rewrapAsDCError:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v2, v4);

  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) connection];
  [v5 invalidate];
}

- (void)dispatchCompletionHandler:(id)a3 ontoQueue:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(void))a3;
  id v6 = a4;
  id v7 = copy_current_process_name();
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", @"CommCenter", 0);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DeviceCheck"];
  if ([v9 BOOLForKey:@"dispatchTestDaemonToCallingQueue"]) {
    [v8 addObject:@"dctestd"];
  }
  if ([v8 containsObject:v7] && v6)
  {
    label = dispatch_queue_get_label(v6);
    id v11 = _DCLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = label;
      _os_log_impl(&dword_2378D4000, v11, OS_LOG_TYPE_DEFAULT, "Dispatching completion handler onto calling queue. { queueLabel=%s }", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__DCAppAttestService_dispatchCompletionHandler_ontoQueue___block_invoke;
    block[3] = &unk_264CE7380;
    uint64_t v13 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    v5[2](v5);
  }
}

uint64_t __58__DCAppAttestService_dispatchCompletionHandler_ontoQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__DCAppAttestService__isSupportedReturningError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2378D4000, a2, OS_LOG_TYPE_ERROR, "XPCConnection failed with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)isSupported
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2378D4000, a2, OS_LOG_TYPE_ERROR, "isSupported error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_rewrapAsDCError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_2378D4000, log, OS_LOG_TYPE_DEBUG, "Remap to DCError (%@) <- (%@)\n", (uint8_t *)&v3, 0x16u);
}

@end