@interface CALNLaunchServicesURLHandler
+ (id)_openApplicationOptionsForResponse:(id)a3;
+ (id)sharedInstance;
- (void)openURL:(id)a3 response:(id)a4;
@end

@implementation CALNLaunchServicesURLHandler

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CALNLaunchServicesURLHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_11 != -1) {
    dispatch_once(&sharedInstance_onceToken_11, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __46__CALNLaunchServicesURLHandler_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)openURL:(id)a3 response:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)os_transaction_create();
  if (v6)
  {
    v8 = [v6 notificationRecord];
    v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v8 sourceIdentifier];
      v11 = [v8 sourceClientIdentifier];
      v12 = [v6 actionIdentifier];
      *(_DWORD *)buf = 138544130;
      id v23 = v10;
      __int16 v24 = 2114;
      v25 = v11;
      __int16 v26 = 2114;
      v27 = v12;
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Opening url for response, source identifier = %{public}@, source client identifier = %{public}@, action identifier = %{public}@, url = %@", buf, 0x2Au);
    }
  }
  else
  {
    v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Opening url: %@", buf, 0xCu);
    }
  }

  id v13 = objc_alloc_init(MEMORY[0x263F018D8]);
  v14 = [(id)objc_opt_class() _openApplicationOptionsForResponse:v6];
  [v13 setFrontBoardOptions:v14];

  v15 = [v6 targetConnectionEndpoint];
  [v13 setTargetConnectionEndpoint:v15];

  [v13 setSensitive:1];
  if ([v5 isFileURL]) {
    [v5 startAccessingSecurityScopedResource];
  }
  v16 = [MEMORY[0x263F01880] defaultWorkspace];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __49__CALNLaunchServicesURLHandler_openURL_response___block_invoke;
  v19[3] = &unk_2645C1378;
  id v20 = v5;
  id v21 = v7;
  id v17 = v7;
  id v18 = v5;
  [v16 openURL:v18 configuration:v13 completionHandler:v19];
}

void __49__CALNLaunchServicesURLHandler_openURL_response___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v7 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __49__CALNLaunchServicesURLHandler_openURL_response___block_invoke_cold_1((uint64_t)v6, a1, v7);
    }
  }
  if ([*(id *)(a1 + 32) isFileURL]) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
}

+ (id)_openApplicationOptionsForResponse:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = *MEMORY[0x263F3F608];
  v11[0] = *MEMORY[0x263F3F5E8];
  v11[1] = v6;
  v12[0] = MEMORY[0x263EFFA88];
  v12[1] = MEMORY[0x263EFFA88];
  v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v8 = (void *)[v5 initWithDictionary:v7];

  v9 = [v4 originIdentifier];

  if (v9) {
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F3F5C0]];
  }

  return v8;
}

void __49__CALNLaunchServicesURLHandler_openURL_response___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Could not open url, error = %@, url = %@", (uint8_t *)&v4, 0x16u);
}

@end