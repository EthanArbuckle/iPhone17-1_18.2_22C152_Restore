@interface APLocalEnforcementManager
- (BOOL)adServicesEnabled:(id)a3;
- (BOOL)deviceRegionStorefrontEnabled;
- (BOOL)isU13MAIDEDU;
- (BOOL)loggingEnabled;
- (BOOL)shouldShowTCCWithAds;
- (id)accountStorefront;
- (id)appTrackingServiceProxy:(id)a3;
- (id)appTrackingXPCConnection:(id)a3 withInvalidation:(id)a4;
- (id)disabledReasons;
@end

@implementation APLocalEnforcementManager

- (id)disabledReasons
{
  v2 = objc_alloc_init(ADTrackingTransparency);
  v3 = [(ADTrackingTransparency *)v2 adSwitchDisabledReasons];
  v4 = [MEMORY[0x263EFF980] array];
  v5 = [NSNumber numberWithInteger:1];
  int v6 = [v3 containsObject:v5];

  if (v6)
  {
    v7 = [NSNumber numberWithInteger:1];
    [v4 addObject:v7];
  }
  v8 = [NSNumber numberWithInteger:3];
  int v9 = [v3 containsObject:v8];

  if (v9)
  {
    v10 = [NSNumber numberWithInteger:3];
    [v4 addObject:v10];
  }
  v11 = [NSNumber numberWithInteger:4];
  int v12 = [v3 containsObject:v11];

  if (v12)
  {
    v13 = [NSNumber numberWithInteger:4];
    [v4 addObject:v13];
  }
  v14 = (void *)[v4 copy];

  return v14;
}

- (BOOL)adServicesEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v5 = [(APLocalEnforcementManager *)self appTrackingXPCConnection:&__block_literal_global_0 withInvalidation:&__block_literal_global_9];
  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to create connection for adServicesEnabled()", buf, 2u);
  }
  int v6 = [(APLocalEnforcementManager *)self appTrackingServiceProxy:v5];
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get adServicesEnabled", buf, 2u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Starting synchronous remote call to localAdServicesEnabled()", buf, 2u);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__APLocalEnforcementManager_adServicesEnabled___block_invoke_10;
  v10[3] = &unk_2644FB9A8;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  int v12 = &v14;
  [v6 localAdServicesEnabled:v10];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Returned from synchronous remote call to iTunesAccountStorefront()", buf, 2u);
  }
  [v5 invalidate];
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __47__APLocalEnforcementManager_adServicesEnabled___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __47__APLocalEnforcementManager_adServicesEnabled___block_invoke_7()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Connection invalidated before completing", v0, 2u);
  }
}

void __47__APLocalEnforcementManager_adServicesEnabled___block_invoke_10(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    char v8 = @"not enabled";
    if (a2) {
      char v8 = @"enabled";
    }
    int v13 = 138412546;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    id v9 = v7;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] The localAdServicesEnabled flag is %{public}@.", (uint8_t *)&v13, 0x16u);
  }
  if (a2)
  {
    v10 = (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4, v5, v6);
    id v11 = [v10 lowercaseString];
    char v12 = [v11 hasPrefix:@"us"];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;
  }
}

- (BOOL)loggingEnabled
{
  return ![(APLocalEnforcementManager *)self isU13MAIDEDU];
}

- (BOOL)deviceRegionStorefrontEnabled
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v3 = [(APLocalEnforcementManager *)self appTrackingXPCConnection:&__block_literal_global_19 withInvalidation:&__block_literal_global_22_0];
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to create connection for deviceRegionEnabledPerStorefront", buf, 2u);
  }
  uint64_t v4 = [(APLocalEnforcementManager *)self appTrackingServiceProxy:v3];
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get deviceRegionStorefrontEnabled", buf, 2u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Starting synchronous remote call to deviceRegionEnabledPerStorefront()", buf, 2u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__APLocalEnforcementManager_deviceRegionStorefrontEnabled__block_invoke_23;
  v7[3] = &unk_2644FB9D0;
  v7[4] = self;
  v7[5] = &v9;
  [v4 deviceRegionEnabledPerStorefront:v7];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Returned from synchronous remote call to deviceRegionEnabledPerStorefront()", buf, 2u);
  }
  [v3 invalidate];
  char v5 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __58__APLocalEnforcementManager_deviceRegionStorefrontEnabled__block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __58__APLocalEnforcementManager_deviceRegionStorefrontEnabled__block_invoke_20()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Connection invalidated before completing", v0, 2u);
  }
}

void __58__APLocalEnforcementManager_deviceRegionStorefrontEnabled__block_invoke_23(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    char v5 = @"not enabled";
    if (a2) {
      char v5 = @"enabled";
    }
    int v7 = 138412546;
    char v8 = v4;
    __int16 v9 = 2114;
    v10 = v5;
    id v6 = v4;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] The deviceRegionStorefrontEnabled flag is %{public}@.", (uint8_t *)&v7, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)isU13MAIDEDU
{
  v2 = objc_alloc_init(ADTrackingTransparency);
  v3 = [(ADTrackingTransparency *)v2 adSwitchDisabledReasons];
  char v4 = 1;
  char v5 = [NSNumber numberWithInteger:1];
  char v6 = [v3 containsObject:v5];

  if ((v6 & 1) == 0)
  {
    int v7 = [NSNumber numberWithInteger:4];
    char v8 = [v3 containsObject:v7];

    if (v8)
    {
      char v4 = 1;
    }
    else
    {
      __int16 v9 = [NSNumber numberWithInteger:3];
      char v4 = [v3 containsObject:v9];
    }
  }

  return v4;
}

- (id)accountStorefront
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  char v12 = __Block_byref_object_copy_;
  int v13 = __Block_byref_object_dispose_;
  uint64_t v14 = @"NONE";
  v3 = [(APLocalEnforcementManager *)self appTrackingXPCConnection:&__block_literal_global_28 withInvalidation:&__block_literal_global_31];
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to create connection for accountStorefront()", buf, 2u);
  }
  char v4 = [(APLocalEnforcementManager *)self appTrackingServiceProxy:v3];
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get accountStorefront", buf, 2u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Starting synchronous remote call to iTunesAccountStorefront()", buf, 2u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__APLocalEnforcementManager_accountStorefront__block_invoke_32;
  v7[3] = &unk_2644FB9F8;
  v7[4] = self;
  v7[5] = &v9;
  [v4 iTunesAccountStorefront:v7];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Returned from synchronous remote call to iTunesAccountStorefront()", buf, 2u);
  }
  [v3 invalidate];
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v5;
}

void __46__APLocalEnforcementManager_accountStorefront__block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __46__APLocalEnforcementManager_accountStorefront__block_invoke_29()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Connection invalidated before completing", v0, 2u);
  }
}

void __46__APLocalEnforcementManager_accountStorefront__block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v4 = v8;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] The account storefront is %{public}@.", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)appTrackingXPCConnection:(id)a3 withInvalidation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ap.adprivacyd.opt-out" options:4096];
  if (v7)
  {
    id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D088FD8];
    [v7 setRemoteObjectInterface:v8];

    [v7 setInvalidationHandler:v6];
    [v7 setInterruptionHandler:v5];
    [v7 resume];
    id v9 = v7;
  }

  return v7;
}

- (id)appTrackingServiceProxy:(id)a3
{
  return (id)[a3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_53_0];
}

void __53__APLocalEnforcementManager_appTrackingServiceProxy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a2;
    uint64_t v4 = [v3 code];
    id v5 = [v3 localizedDescription];

    int v6 = 134218242;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Received error code %ld from remote call: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)shouldShowTCCWithAds
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = [(APLocalEnforcementManager *)self appTrackingXPCConnection:&__block_literal_global_55 withInvalidation:&__block_literal_global_58];
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to create connection for shouldShowTCCWithAds()", buf, 2u);
  }
  uint64_t v4 = [(APLocalEnforcementManager *)self appTrackingServiceProxy:v3];
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get shouldShowTCCWithAds", buf, 2u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Starting synchronous remote call to iTunesAccountStorefront()", buf, 2u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__APLocalEnforcementManager_shouldShowTCCWithAds__block_invoke_59;
  v7[3] = &unk_2644FB9F8;
  v7[4] = self;
  v7[5] = &v9;
  [v4 iTunesAccountStorefront:v7];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Returned from synchronous remote call to iTunesAccountStorefront()", buf, 2u);
  }
  [v3 invalidate];
  char v5 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __49__APLocalEnforcementManager_shouldShowTCCWithAds__block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __49__APLocalEnforcementManager_shouldShowTCCWithAds__block_invoke_56()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Connection invalidated before completing", v0, 2u);
  }
}

void __49__APLocalEnforcementManager_shouldShowTCCWithAds__block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)char v5 = 138412546;
    *(void *)&v5[4] = objc_opt_class();
    *(_WORD *)&v5[12] = 2114;
    *(void *)&v5[14] = v3;
    id v4 = *(id *)&v5[4];
    _os_log_impl(&dword_21EEF9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] The account storefront is %{public}@.", v5, 0x16u);
  }
  if (objc_msgSend(v3, "containsString:", @"143441", *(_OWORD *)v5, *(void *)&v5[16], v6)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

@end