@interface MCMDMDataMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation MCMDMDataMigrator

- (id)dataClassName
{
  return @"mc_mdm";
}

- (BOOL)performMigration
{
  _DMLogFunc();
  if ([(MCMDMDataMigrator *)self didRestoreFromBackup])
  {
    unsigned int v3 = [(MCMDMDataMigrator *)self didMigrateBackupFromDifferentDevice];
    int v4 = 0;
    BOOL v5 = v3 == 0;
    if (v3) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 2;
    }
    CFStringRef v7 = @"Restore from the same device";
    CFStringRef v8 = @"Restore from a different device";
  }
  else
  {
    uint64_t v6 = (uint64_t)[(MCMDMDataMigrator *)self didUpgrade];
    int v4 = v6 ^ 1;
    CFStringRef v7 = @"Device erasure";
    CFStringRef v8 = @"Software update";
    BOOL v5 = v6 == 0;
  }
  if (!v5) {
    CFStringRef v7 = v8;
  }
  CFStringRef v13 = v7;
  _DMLogFunc();
  v9 = +[UMUserManager sharedManager];
  unsigned int v10 = [v9 isSharedIPad];

  if (v4 && v10)
  {
    _DMLogFunc();
  }
  else
  {
    v11 = +[MDMClient sharedClient];
    [v11 migrateMDMWithContext:v6 completion:&stru_4058];
  }
  return 1;
}

- (float)estimatedDuration
{
  return 1.0;
}

- (float)migrationProgress
{
  return -1.0;
}

@end