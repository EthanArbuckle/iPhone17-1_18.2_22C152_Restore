@interface MCCleanupMigrator
- (BOOL)_triggerMigrationWithContext:(int)a3;
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation MCCleanupMigrator

- (id)dataClassName
{
  return @"mc_cleanup";
}

- (BOOL)performMigration
{
  _DMLogFunc();
  if ([(MCCleanupMigrator *)self didRestoreFromBackup])
  {
    unsigned int v3 = [(MCCleanupMigrator *)self didMigrateBackupFromDifferentDevice];
    BOOL v4 = v3 == 0;
    if (v3) {
      id v5 = &dword_0 + 3;
    }
    else {
      id v5 = &dword_0 + 2;
    }
    CFStringRef v6 = @"Restore from the same device";
    CFStringRef v7 = @"Restore from a different device";
  }
  else
  {
    id v5 = [(MCCleanupMigrator *)self didUpgrade];
    CFStringRef v6 = @"Device erasure";
    CFStringRef v7 = @"Software update";
    BOOL v4 = v5 == 0;
  }
  if (v4) {
    CFStringRef v8 = v6;
  }
  else {
    CFStringRef v8 = v7;
  }
  _DMLogFunc();
  if (-[MCCleanupMigrator _triggerMigrationWithContext:](self, "_triggerMigrationWithContext:", v5, v8)) {
    goto LABEL_15;
  }
  uint64_t v9 = -2;
  do
  {
    unsigned int v10 = [(MCCleanupMigrator *)self _triggerMigrationWithContext:v5];
    sleep(1u);
    if (!v9) {
      break;
    }
    ++v9;
  }
  while (!v10);
  if (v10)
  {
LABEL_15:
    _DMLogFunc();
    return 1;
  }
  else
  {
    _DMLogFunc();
    return 0;
  }
}

- (BOOL)_triggerMigrationWithContext:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v7 = 0;
  CFStringRef v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  BOOL v4 = +[MCProfileConnection sharedConnection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3AE0;
  v6[3] = &unk_4058;
  v6[4] = &v7;
  [v4 migrateCleanupMigratorWithContext:v3 completion:v6];

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
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