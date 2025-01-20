@interface HDSettingsMigrationManager(HDMenstrualCycles)
- (uint64_t)initWithProfile:()HDMenstrualCycles userDefaults:delegate:;
@end

@implementation HDSettingsMigrationManager(HDMenstrualCycles)

- (uint64_t)initWithProfile:()HDMenstrualCycles userDefaults:delegate:
{
  v20[5] = *MEMORY[0x263EF8340];
  v8 = (void *)MEMORY[0x263F43330];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 dawnMoveAlgorithmicProjectionsToFeatureSettingsWithUserDefaults:v10];
  v20[0] = v12;
  v13 = [MEMORY[0x263F43330] dawnMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:v10];
  v20[1] = v13;
  v14 = [MEMORY[0x263F43330] dawnMoveHiddenCycleChartRowsSettingsWithUserDefaults:v10];
  v20[2] = v14;
  v15 = [MEMORY[0x263F43330] dawnMoveHiddenLoggingRowsSettingsWithUserDefaults:v10];
  v20[3] = v15;
  v16 = [MEMORY[0x263F43330] dawnMoveToDeviationDetectionFeatureSettingsWithUserDefaults:v10];
  v20[4] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:5];
  uint64_t v18 = [a1 initWithProfile:v11 identifier:@"HealthMenstrualCycles" currentMigrationVersion:17005 migrationSteps:v17 delegate:v9 migrationVersionDefaults:v10 lastMigratedVersionKey:@"HDMCSettingsMigrationManager_LastCompletedVersion" loggingCategory:*MEMORY[0x263F09930]];

  return v18;
}

@end