@interface LiveFSDiskUnlock
+ (void)unlockDomain:(id)a3 withPassword:(id)a4 saveToKeychain:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation LiveFSDiskUnlock

+ (void)unlockDomain:(id)a3 withPassword:(id)a4 saveToKeychain:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v11 = [a3 storageURLs];
  v12 = [v11 objectAtIndexedSubscript:0];

  v13 = [MEMORY[0x263F08850] defaultManager];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke;
  v16[3] = &unk_264DC7900;
  id v17 = v9;
  id v18 = v10;
  BOOL v19 = a5;
  id v14 = v9;
  id v15 = v10;
  [v13 getFileProviderServicesForItemAtURL:v12 completionHandler:v16];
}

void __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_23AB0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "getFPServices: error %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5)
    {
      v7 = [v5 objectForKeyedSubscript:@"com.apple.filesystems.unlock"];
      if (v7)
      {
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_1;
        v12[3] = &unk_264DC78D8;
        id v14 = *(id *)(a1 + 40);
        id v13 = *(id *)(a1 + 32);
        char v15 = *(unsigned char *)(a1 + 48);
        [v7 getFileProviderConnectionWithCompletionHandler:v12];

        v8 = v14;
      }
      else
      {
        id v10 = livefs_std_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v5;
          _os_log_impl(&dword_23AB0B000, v10, OS_LOG_TYPE_DEFAULT, "Unable to find unlock service in %@", buf, 0xCu);
        }

        uint64_t v11 = *(void *)(a1 + 40);
        v8 = getNSErrorFromLiveFSErrno(53);
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v8);
      }
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 40);
      v7 = getNSErrorFromLiveFSErrno(45);
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
    }
  }
}

void __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_23AB0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "getFPConn: error %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EE26FE8];
    [v5 setRemoteObjectInterface:v7];

    [v5 resume];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_46;
    v13[3] = &unk_264DC75C0;
    id v14 = *(id *)(a1 + 40);
    v8 = [v5 remoteObjectProxyWithErrorHandler:v13];
    uint64_t v9 = *(unsigned __int8 *)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_48;
    v11[3] = &unk_264DC75C0;
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    [v8 unlockWithPassword:v10 saveToKeychain:v9 completionHandler:v11];
  }
}

void __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_46(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_46_cold_1((uint64_t)v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__LiveFSDiskUnlock_unlockDomain_withPassword_saveToKeychain_completionHandler___block_invoke_46_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_23AB0B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "connection error %@", (uint8_t *)&v1, 0xCu);
}

@end