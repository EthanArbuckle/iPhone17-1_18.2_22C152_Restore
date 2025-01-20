@interface FIUIWorkoutActivityDefaultPaceMigrator
+ (void)migrateDefaultOutdoorRunningWalkingPaceFromCurrentToAverage;
+ (void)migrateDefaultOutdoorRunningWalkingPaceFromCurrentToAverageWithSyncManager:(id)a3 domainAccessor:(id)a4;
@end

@implementation FIUIWorkoutActivityDefaultPaceMigrator

+ (void)migrateDefaultOutdoorRunningWalkingPaceFromCurrentToAverage
{
  id v3 = objc_alloc_init(MEMORY[0x263F57528]);
  v2 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nanolifestyle.sessiontrackerapp"];
  [(id)objc_opt_class() migrateDefaultOutdoorRunningWalkingPaceFromCurrentToAverageWithSyncManager:v3 domainAccessor:v2];
}

+ (void)migrateDefaultOutdoorRunningWalkingPaceFromCurrentToAverageWithSyncManager:(id)a3 domainAccessor:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x263F09970];
  v8 = *MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_21E433000, v8, OS_LOG_TYPE_DEFAULT, "[NanoHealthDataMigrator] Migrating activity pace setting if needed", v22, 2u);
  }
  v9 = [v6 objectForKey:@"ActivitySettingsFormatVersion"];
  uint64_t v10 = [v9 integerValue];
  _HKInitializeLogging();
  v11 = *v7;
  BOOL v12 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT);
  if (v10 < 1)
  {
    if (v12)
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21E433000, v11, OS_LOG_TYPE_DEFAULT, "[NanoHealthDataMigrator] Will migrate activity pace setting...", v22, 2u);
    }
    id v13 = (id)[v6 synchronize];
    v14 = [v6 objectForKey:@"SettingsByActivityType"];
    if (!v14)
    {
      v14 = [NSDictionary dictionary];
    }
    v15 = _FIUIMigratedPaceSettings(v14);

    [v6 setObject:v15 forKey:@"SettingsByActivityType"];
    [v6 setObject:&unk_26CF756A0 forKey:@"ActivitySettingsFormatVersion"];
    id v16 = (id)[v6 synchronize];
    v17 = [v6 domain];
    v18 = (void *)MEMORY[0x263EFFA08];
    v23[0] = @"ActivitySettingsFormatVersion";
    v23[1] = @"SettingsByActivityType";
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    v20 = [v18 setWithArray:v19];
    [v5 synchronizeNanoDomain:v17 keys:v20];

    _HKInitializeLogging();
    v21 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21E433000, v21, OS_LOG_TYPE_DEFAULT, "[NanoHealthDataMigrator] Activity pace migration done.", v22, 2u);
    }
  }
  else if (v12)
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_21E433000, v11, OS_LOG_TYPE_DEFAULT, "[NanoHealthDataMigrator] Migrating activity pace not needed, version is > 0", v22, 2u);
  }
}

@end