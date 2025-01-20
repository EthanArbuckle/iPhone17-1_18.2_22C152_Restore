@interface ATHostWakeupService
+ (id)sharedInstance;
- (ATHostWakeupService)init;
- (void)_wakeupHost:(id)a3;
- (void)environmentMonitorDidChangePower:(id)a3;
- (void)getWakeableHostsWithCompletion:(id)a3;
- (void)sendWakeupToAllHostsWithCompletion:(id)a3;
- (void)sendWakeupToHostWithIdentifier:(id)a3 completion:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation ATHostWakeupService

- (void)environmentMonitorDidChangePower:(id)a3
{
  id v5 = a3;
  int v4 = [v5 isCharging];
  if ([v5 isRemoteServerLikelyReachable])
  {
    [v5 networkType];
    if ((v4 & ICEnvironmentNetworkTypeIsWiFi()) == 1) {
      [(ATHostWakeupService *)self sendWakeupToAllHostsWithCompletion:&__block_literal_global_21];
    }
  }
}

- (void)_wakeupHost:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 netService];
    v6 = [v5 name];
    int v19 = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "sending wakeup to host '%@'", (uint8_t *)&v19, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.atc.idlewake", 0, 0, 1u);
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  dispatch_after(v8, MEMORY[0x1E4F14428], &__block_literal_global_18);
  v9 = [v3 netService];
  v10 = [v9 addresses];

  if ([v10 count])
  {
    v11 = [v10 objectAtIndex:0];
    uint64_t v12 = [v11 length];
    v13 = (sockaddr *)malloc_type_malloc(v12, 0xC8867B88uLL);
    if (v13)
    {
      v14 = v13;
      v11 = v11;
      memcpy(v14, (const void *)[v11 bytes], v12);
      *(_WORD *)v14->sa_data = 443;
      int v15 = socket(2, 1, 6);
      int v16 = connect(v15, v14, v12);
      v17 = _ATLogCategoryFramework();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v18)
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D9A2D000, v17, OS_LOG_TYPE_DEFAULT, "failed to connect to host wakeup listener - hope its ok", (uint8_t *)&v19, 2u);
        }
      }
      else
      {
        if (v18)
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D9A2D000, v17, OS_LOG_TYPE_DEFAULT, "Connected to host, closing.", (uint8_t *)&v19, 2u);
        }

        shutdown(v15, 2);
        close(v15);
      }
      free(v14);
    }
  }
  else
  {
    v11 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_DEFAULT, "no host address found for service - ignoring", (uint8_t *)&v19, 2u);
    }
  }
}

void __35__ATHostWakeupService__wakeupHost___block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.atc.idlewake", 0, 0, 1u);
}

- (void)getWakeableHostsWithCompletion:(id)a3
{
  id v3 = a3;
  int v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "getting wakeable hosts", buf, 2u);
  }

  id v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = objc_alloc_init(ATHostBrowser);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ATHostWakeupService_getWakeableHostsWithCompletion___block_invoke;
  v9[3] = &unk_1E6B889E0;
  id v10 = v5;
  id v11 = v3;
  id v7 = v3;
  id v8 = v5;
  [(ATHostBrowser *)v6 browseForHostsWithTimeout:10 completion:v9];
}

void __54__ATHostWakeupService_getWakeableHostsWithCompletion___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [v5 libraryIdentifier];
  id v7 = +[ATUserDefaults readOnlyDefaults];
  id v8 = [v7 objectForKey:@"Hosts"];

  v9 = [v8 objectForKey:v6];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 objectForKey:@"Wakeable"];
    int v12 = [v11 BOOLValue];

    if (v12)
    {
      v13 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v5 netService];
        int v15 = [v14 name];
        int v17 = 138412290;
        BOOL v18 = v15;
        _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_DEFAULT, "found wakeable host '%@'", (uint8_t *)&v17, 0xCu);
      }
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
  if (a3)
  {
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, void))(v16 + 16))(v16, 0);
    }
  }
}

- (void)sendWakeupToAllHostsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "sending wakeup to all hosts", buf, 2u);
  }

  v6 = objc_alloc_init(ATHostBrowser);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__ATHostWakeupService_sendWakeupToAllHostsWithCompletion___block_invoke;
  v8[3] = &unk_1E6B889E0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(ATHostBrowser *)v6 browseForHostsWithTimeout:10 completion:v8];
}

void __58__ATHostWakeupService_sendWakeupToAllHostsWithCompletion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v13 = a2;
  id v5 = [v13 libraryIdentifier];
  v6 = +[ATUserDefaults readOnlyDefaults];
  id v7 = [v6 objectForKey:@"Hosts"];

  id v8 = [v7 objectForKey:v5];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 objectForKey:@"Wakeable"];
    int v11 = [v10 BOOLValue];

    if (v11) {
      [*(id *)(a1 + 32) _wakeupHost:v13];
    }
  }
  if (a3)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
    }
  }
}

- (void)sendWakeupToHostWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "sending wakeup to host identifier '%@'", (uint8_t *)&buf, 0xCu);
  }

  id v9 = objc_alloc_init(ATHostBrowser);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__ATHostWakeupService_sendWakeupToHostWithIdentifier_completion___block_invoke;
  v12[3] = &unk_1E6B889B8;
  id v10 = v6;
  p_long long buf = &buf;
  id v13 = v10;
  v14 = self;
  id v11 = v7;
  id v15 = v11;
  [(ATHostBrowser *)v9 browseForHostsWithTimeout:10 completion:v12];

  _Block_object_dispose(&buf, 8);
}

void __65__ATHostWakeupService_sendWakeupToHostWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v9 = a2;
  id v5 = [v9 libraryIdentifier];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    [*(id *)(a1 + 40) _wakeupHost:v9];
  }
  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        (*(void (**)(void, void))(v7 + 16))(*(void *)(a1 + 48), 0);
      }
      else
      {
        id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:28 userInfo:0];
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
      }
    }
  }
}

- (void)stop
{
  id v3 = [MEMORY[0x1E4FB8618] sharedMonitor];
  [v3 unregisterObserver:self];
}

- (void)start
{
  id v3 = [MEMORY[0x1E4FB8618] sharedMonitor];
  [v3 registerObserver:self];
}

- (ATHostWakeupService)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATHostWakeupService;
  return [(ATHostWakeupService *)&v3 init];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4376 != -1) {
    dispatch_once(&sharedInstance_onceToken_4376, &__block_literal_global_4377);
  }
  v2 = (void *)sharedInstance___sharedInstance_4378;

  return v2;
}

uint64_t __37__ATHostWakeupService_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance_4378 = objc_alloc_init(ATHostWakeupService);

  return MEMORY[0x1F41817F8]();
}

@end