@interface DataClassMigrator
+ (id)dataClassMigratorForBundleAtPath:(id)a3;
- (BOOL)didMigrateBackupFromDifferentDevice;
- (BOOL)didRestoreFromBackup;
- (BOOL)didRestoreFromCloudBackup;
- (BOOL)didUpgrade;
- (BOOL)performMigration;
- (BOOL)shouldPreserveSettingsAfterRestore;
- (BOOL)wasPasscodeSetInBackup;
- (NSDictionary)context;
- (NSString)dmBundleIdentifier;
- (NSString)restoredBackupBuildVersion;
- (NSString)restoredBackupDeviceName;
- (NSString)restoredBackupProductType;
- (unsigned)userDataDisposition;
- (void)setContext:(id)a3;
- (void)setDidUpgrade:(BOOL)a3;
- (void)setDmBundleIdentifier:(id)a3;
- (void)setRestoredBackupBuildVersion:(id)a3;
- (void)setRestoredBackupDeviceName:(id)a3;
- (void)setRestoredBackupProductType:(id)a3;
- (void)setUserDataDisposition:(unsigned int)a3;
@end

@implementation DataClassMigrator

- (BOOL)didUpgrade
{
  v2 = [(NSDictionary *)self->_context objectForKey:@"SyntheticDidUpgrade"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)didRestoreFromBackup
{
  v2 = [(NSDictionary *)self->_context objectForKey:@"DidRestoreFromBackup"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)didMigrateBackupFromDifferentDevice
{
  v2 = [(NSDictionary *)self->_context objectForKey:@"DidMigrateBackupFromDifferentDevice"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)didRestoreFromCloudBackup
{
  v2 = [(NSDictionary *)self->_context objectForKey:@"DidRestoreFromCloudBackup"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldPreserveSettingsAfterRestore
{
  v2 = [(NSDictionary *)self->_context objectForKey:@"ShouldPreserveSettingsAfterRestore"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)wasPasscodeSetInBackup
{
  v2 = [(NSDictionary *)self->_context objectForKey:@"WasPasscodeSetInBackup"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)performMigration
{
  return 0;
}

+ (id)dataClassMigratorForBundleAtPath:(id)a3
{
  id v4 = a3;
  _DMLogFunc(v3, 7, @"Will create migrator bundle at %@");
  v5 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithPath:", v4, v4);
  if (!v5)
  {
    _DMLogFunc(v3, 3, @"%@ Failed to create migration plugin bundle at %@");
LABEL_8:
    v12 = 0;
    v9 = 0;
    goto LABEL_9;
  }
  _DMLogFunc(v3, 7, @"Will load migrator bundle");
  id v14 = 0;
  char v6 = [v5 loadAndReturnError:&v14];
  id v7 = v14;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    _DMLogFunc(v3, 3, @"Cannot load migrator bundle at %@ with error %@");

    goto LABEL_8;
  }

  _DMLogFunc(v3, 7, @"Will get migrator bundle identifier");
  v9 = [v5 bundleIdentifier];
  _DMLogFunc(v3, 7, @"Will check migrator principal class");
  v10 = (objc_class *)[v5 principalClass];
  if ([(objc_class *)v10 isSubclassOfClass:objc_opt_class()])
  {
    _DMLogFunc(v3, 7, @"Will instantiate migrator principal class");
    id v11 = objc_alloc_init(v10);
    v12 = v11;
    if (v11) {
      [v11 setDmBundleIdentifier:v9];
    }
    else {
      _DMLogFunc(v3, 3, @"Cannot instantiate migrator at %@");
    }
  }
  else
  {
    _DMLogFunc(v3, 3, @"Wrong principal class (%@) for migration plugin bundle at %@");
    v12 = 0;
  }
LABEL_9:

  return v12;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (unsigned)userDataDisposition
{
  return self->_userDataDisposition;
}

- (void)setUserDataDisposition:(unsigned int)a3
{
  self->_userDataDisposition = a3;
}

- (NSString)restoredBackupBuildVersion
{
  return self->_restoredBackupBuildVersion;
}

- (void)setRestoredBackupBuildVersion:(id)a3
{
}

- (NSString)restoredBackupProductType
{
  return self->_restoredBackupProductType;
}

- (void)setRestoredBackupProductType:(id)a3
{
}

- (NSString)restoredBackupDeviceName
{
  return self->_restoredBackupDeviceName;
}

- (void)setRestoredBackupDeviceName:(id)a3
{
}

- (void)setDidUpgrade:(BOOL)a3
{
  self->_didUpgrade = a3;
}

- (NSString)dmBundleIdentifier
{
  return self->_dmBundleIdentifier;
}

- (void)setDmBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dmBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_restoredBackupDeviceName, 0);
  objc_storeStrong((id *)&self->_restoredBackupProductType, 0);
  objc_storeStrong((id *)&self->_restoredBackupBuildVersion, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end