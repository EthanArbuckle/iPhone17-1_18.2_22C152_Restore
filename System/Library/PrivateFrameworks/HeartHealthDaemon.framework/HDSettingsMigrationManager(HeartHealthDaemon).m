@interface HDSettingsMigrationManager(HeartHealthDaemon)
- (uint64_t)initWithProfile:()HeartHealthDaemon heartNotificationsUserDefaults:delegate:;
@end

@implementation HDSettingsMigrationManager(HeartHealthDaemon)

- (uint64_t)initWithProfile:()HeartHealthDaemon heartNotificationsUserDefaults:delegate:
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v8 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v8 alloc] initWithSuiteName:@"com.apple.private.health.cardio-fitness"];
  v13 = [MEMORY[0x1E4F65BF8] crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults:v10];

  v18[0] = v13;
  v14 = [MEMORY[0x1E4F65BF8] crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:v12];
  v18[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v16 = [a1 initWithProfile:v11 identifier:@"HeartHealthDaemon" currentMigrationVersion:18002 migrationSteps:v15 delegate:v9 loggingCategory:*MEMORY[0x1E4F29F48]];

  return v16;
}

@end