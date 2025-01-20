@interface HDSettingsMigrationManager(HealthMobilityDaemon)
- (uint64_t)initForWalkingSteadinessWithProfile:()HealthMobilityDaemon delegate:;
@end

@implementation HDSettingsMigrationManager(HealthMobilityDaemon)

- (uint64_t)initForWalkingSteadinessWithProfile:()HealthMobilityDaemon delegate:
{
  v16[2] = *MEMORY[0x263EF8340];
  v6 = (objc_class *)MEMORY[0x263EFFA40];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithSuiteName:@"com.apple.Mobility.notifications"];
  v10 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.private.health.walking-steadiness"];
  v11 = [MEMORY[0x263F43330] crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults:v9];
  v16[0] = v11;
  v12 = [MEMORY[0x263F43330] crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:v10];
  v16[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  uint64_t v14 = [a1 initWithProfile:v8 identifier:@"HealthMobilityDaemon" currentMigrationVersion:18002 migrationSteps:v13 delegate:v7 loggingCategory:*MEMORY[0x263F09940]];

  return v14;
}

@end