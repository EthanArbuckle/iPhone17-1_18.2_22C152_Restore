@interface ASSetupManager
- (void)_migrateToTwoWaySyncSetupDefault;
@end

@implementation ASSetupManager

- (void)_migrateToTwoWaySyncSetupDefault
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v3 = *MEMORY[0x263F23CC8];
  v4 = (void *)[v2 initWithSuiteName:*MEMORY[0x263F23CC8]];
  uint64_t v5 = *MEMORY[0x263F23C40];
  v6 = [v4 objectForKey:*MEMORY[0x263F23C40]];
  if (v6)
  {
    ASLoggingInitialize();
    v7 = (os_log_t *)MEMORY[0x263F23AC0];
    v8 = *MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Removing legacy user defaults setup key", (uint8_t *)v16, 2u);
    }
    [v4 removeObjectForKey:v5];
    v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "BOOLValue"));
    uint64_t v10 = *MEMORY[0x263F23C38];
    [v4 setObject:v9 forKey:*MEMORY[0x263F23C38]];

    ASLoggingInitialize();
    os_log_t v11 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      int v13 = [v6 BOOLValue];
      v16[0] = 67109120;
      v16[1] = v13;
      _os_log_impl(&dword_2474C9000, v12, OS_LOG_TYPE_DEFAULT, "Syncing new user defaults setup key:  %{BOOL}d", (uint8_t *)v16, 8u);
    }
    v14 = objc_opt_new();
    v15 = [MEMORY[0x263EFFA08] setWithObject:v10];
    [v14 synchronizeUserDefaultsDomain:v3 keys:v15];
  }
}

@end