@interface CalDefaultReminderMigrationDefaultsProvider
+ (CalDefaultReminderMigrationDefaultsProvider)sharedInstance;
- (BOOL)havePerformedReminderMigrationCleanup;
- (BOOL)shouldBackupBeforeMigration;
- (void)setHavePerformedReminderMigrationCleanup:(BOOL)a3;
@end

@implementation CalDefaultReminderMigrationDefaultsProvider

+ (CalDefaultReminderMigrationDefaultsProvider)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_instance;
  return (CalDefaultReminderMigrationDefaultsProvider *)v2;
}

uint64_t __61__CalDefaultReminderMigrationDefaultsProvider_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (BOOL)shouldBackupBeforeMigration
{
  v2 = [MEMORY[0x263F30010] shared];
  char v3 = [v2 BOOLForKey:@"ShouldBackupBeforeRemindersMigration"];

  return v3;
}

- (BOOL)havePerformedReminderMigrationCleanup
{
  v2 = [MEMORY[0x263F30010] shared];
  uint64_t v3 = [v2 integerForKey:@"LastReminderMigrationCleanupVersion"];

  return v3 == 1;
}

- (void)setHavePerformedReminderMigrationCleanup:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [MEMORY[0x263F30010] shared];
  id v6 = v4;
  if (v3)
  {
    [v4 setInteger:1 forKey:@"LastReminderMigrationCleanupVersion"];

    v4 = [MEMORY[0x263F30010] shared];
    v5 = @"LastReminderMigrationCleanupSystemVersion";
    id v6 = v4;
  }
  else
  {
    v5 = @"LastReminderMigrationCleanupVersion";
  }
  [v4 removeObjectForKey:v5];
}

@end