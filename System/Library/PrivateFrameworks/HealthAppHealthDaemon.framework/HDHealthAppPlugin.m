@interface HDHealthAppPlugin
+ (NSString)pluginIdentifier;
- (NSString)pluginIdentifier;
- (NSString)schemaName;
- (id)databaseEntitiesForProtectionClass:(int64_t)a3;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)stateSyncEntityClasses;
- (id)taskServerClasses;
- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3;
- (void)handleDatabaseObliteration;
@end

@implementation HDHealthAppPlugin

+ (NSString)pluginIdentifier
{
  return (NSString *)@"com.apple.health.HealthAppPlugin";
}

- (NSString)pluginIdentifier
{
  return (NSString *)@"com.apple.health.HealthAppPlugin";
}

- (id)extensionForHealthDaemon:(id)a3
{
  id v3 = a3;
  v4 = [[HDHealthAppDaemonExtension alloc] initWithDaemon:v3];

  return v4;
}

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  if ([v3 profileType] == 1) {
    v4 = [[HDHealthAppProfileExtension alloc] initWithProfile:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void)handleDatabaseObliteration
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(HDHAHealthPluginHostFeedGenerator);
  [(HDHAHealthPluginHostFeedGenerator *)v2 invalidateStoreCache];
  id v3 = objc_alloc(MEMORY[0x263F1DFB0]);
  v4 = (void *)[v3 initWithBundleIdentifier:*MEMORY[0x263F0AD08]];
  [v4 removeAllPendingNotificationRequests];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09948];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09948], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v7 = v9;
    _os_log_impl(&dword_250D3F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removed all pending UserNotification requests", (uint8_t *)&v8, 0xCu);
  }
}

- (id)stateSyncEntityClasses
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v3 = (void *)[v2 mutableCopy];

  [v3 addObject:objc_opt_class()];
  return v3;
}

- (id)taskServerClasses
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v3 = (void *)[v2 mutableCopy];

  [v3 addObject:objc_opt_class()];
  return v3;
}

- (NSString)schemaName
{
  return (NSString *)@"HealthAppDatabaseSchema";
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2) {
    return 0;
  }
  else {
    return 17200;
  }
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  if (a3 == 1)
  {
    v5[0] = objc_opt_class();
    id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

@end