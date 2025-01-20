@interface HDSettingsMigrationStep(HealthMobilityDaemon)
+ (id)crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults:()HealthMobilityDaemon;
+ (id)crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:()HealthMobilityDaemon;
@end

@implementation HDSettingsMigrationStep(HealthMobilityDaemon)

+ (id)crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults:()HealthMobilityDaemon
{
  id v4 = a3;
  id v5 = [a1 alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __124__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults___block_invoke;
  v9[3] = &unk_2645D7B18;
  id v10 = v4;
  id v6 = v4;
  v7 = (void *)[v5 initWithIdentifier:@"CrystalMigrateWalkingSteadinessEnablementToFeatureSettings" migrationVersion:18001 block:v9];

  return v7;
}

+ (id)crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:()HealthMobilityDaemon
{
  id v4 = a3;
  id v5 = [a1 alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __145__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke;
  v9[3] = &unk_2645D7B18;
  id v10 = v4;
  id v6 = v4;
  v7 = (void *)[v5 initWithIdentifier:@"CrystalMigrateWalkingSteadinessOnboardingTileDismissalDateToKeyValueStorage" migrationVersion:18002 block:v9];

  return v7;
}

@end