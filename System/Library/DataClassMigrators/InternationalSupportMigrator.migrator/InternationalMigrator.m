@interface InternationalMigrator
- (BOOL)performMigration;
- (id)dataClassName;
@end

@implementation InternationalMigrator

- (BOOL)performMigration
{
  v3 = DMGetPreviousBuildVersion();
  v4 = (void *)DMCopyCurrentBuildVersion();
  v5 = +[ISRootMigrator migratorFromVersion:v3 toVersion:v4];
  unsigned __int8 v6 = [(InternationalMigrator *)self userDataDisposition];
  if (v6) {
    [v5 setIsErase:1];
  }
  if ((v6 & 4) != 0) {
    [v5 setIsRestoreFromBackup:1];
  }
  unsigned __int8 v7 = [v5 performMigration];

  return v7;
}

- (id)dataClassName
{
  return @"InternationalSupportMigrator";
}

@end