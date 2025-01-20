@interface HDSettingsMigrationStep(HeartHealthDaemon)
+ (id)crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults:()HeartHealthDaemon;
+ (id)crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:()HeartHealthDaemon;
@end

@implementation HDSettingsMigrationStep(HeartHealthDaemon)

+ (id)crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults:()HeartHealthDaemon
{
  id v4 = a3;
  id v5 = [a1 alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __125__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults___block_invoke;
  v9[3] = &unk_1E69B4AC8;
  id v10 = v4;
  id v6 = v4;
  v7 = (void *)[v5 initWithIdentifier:@"CrystalMigrateCardioFitnessEnablemedToNotificationDetailsEntered" migrationVersion:18001 block:v9];

  return v7;
}

+ (id)crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:()HeartHealthDaemon
{
  id v4 = a3;
  id v5 = [a1 alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __134__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke;
  v9[3] = &unk_1E69B4AC8;
  id v10 = v4;
  id v6 = v4;
  v7 = (void *)[v5 initWithIdentifier:@"CrystalMigrateCardioFitnessEnablemedToNotificationDetailsEntered" migrationVersion:18002 block:v9];

  return v7;
}

@end