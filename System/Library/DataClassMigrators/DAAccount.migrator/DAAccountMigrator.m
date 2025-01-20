@interface DAAccountMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation DAAccountMigrator

- (id)dataClassName
{
  return @"da_accounts";
}

- (BOOL)performMigration
{
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23D037000, v3, v4, "DataAccess DAAccountMigrator reporting for duty.  Heh.  Duty.", v7, 2u);
  }

  BOOL v5 = [(DataClassMigrator *)self didUpgrade]
    || [(DataClassMigrator *)self didRestoreFromBackup]
    || [(DataClassMigrator *)self didMigrateBackupFromDifferentDevice];
  [MEMORY[0x263F38D68] upgradeAccounts:v5];
  return 1;
}

- (float)estimatedDuration
{
  return 0.1;
}

- (float)migrationProgress
{
  return 1.0;
}

@end