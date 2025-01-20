@interface HDHeartDaemonPlugin
+ (BOOL)shouldLoadPluginForDaemon:(id)a3;
- (HDHeartDaemonPlugin)init;
- (HDHeartDaemonPlugin)initWithHeartNotificationsUserDefaults:(id)a3;
- (NSString)pluginIdentifier;
- (NSString)schemaName;
- (id)_databaseSchemaForProtectionClass:(int64_t)a3;
- (id)databaseEntitiesForProtectionClass:(int64_t)a3;
- (id)demoDataGeneratorClasses;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)stateSyncEntityClasses;
- (id)taskServerClasses;
- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3;
- (void)handleDatabaseObliteration;
- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4;
@end

@implementation HDHeartDaemonPlugin

- (HDHeartDaemonPlugin)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F2BE88]];
  v5 = [(HDHeartDaemonPlugin *)self initWithHeartNotificationsUserDefaults:v4];

  return v5;
}

- (HDHeartDaemonPlugin)initWithHeartNotificationsUserDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHeartDaemonPlugin;
  v6 = [(HDHeartDaemonPlugin *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_heartNotificationsUserDefaults, a3);
  }

  return v7;
}

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F67D70];
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  id v3 = [a3 behavior];
  char v4 = [v3 isRealityDevice];

  return v4 ^ 1;
}

- (id)extensionForProfile:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = [[HDHeartProfileExtension alloc] initWithProfile:v4 heartNotificationsUserDefaults:self->_heartNotificationsUserDefaults];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)extensionForHealthDaemon:(id)a3
{
  id v4 = a3;
  id v5 = [[HDHeartDaemonExtension alloc] initWithHealthDaemon:v4 heartNotificationsUserDefaults:self->_heartNotificationsUserDefaults];

  return v5;
}

- (void)handleDatabaseObliteration
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CB18];
  uint64_t v3 = *MEMORY[0x1E4F2BE88];
  v5[0] = *MEMORY[0x1E4F2BE90];
  v5[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  objc_msgSend(v2, "hk_deleteDomainsNamed:", v4);
}

- (id)taskServerClasses
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];

  return v2;
}

- (NSString)schemaName
{
  return (NSString *)@"heart";
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  uint64_t v3 = [(HDHeartDaemonPlugin *)self _databaseSchemaForProtectionClass:a3];
  int64_t v4 = [v3 currentSchemaVersion];

  return v4;
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  uint64_t v3 = [(HDHeartDaemonPlugin *)self _databaseSchemaForProtectionClass:a3];
  int64_t v4 = [v3 databaseEntities];

  return v4;
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v6 = a4;
  id v8 = [(HDHeartDaemonPlugin *)self _databaseSchemaForProtectionClass:a3];
  v7 = [(HDHeartDaemonPlugin *)self schemaName];
  [v8 registerMigrationStepsForSchemaName:v7 migrator:v6];
}

- (id)demoDataGeneratorClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)_databaseSchemaForProtectionClass:(int64_t)a3
{
  if (a3 == 1)
  {
    int64_t v4 = off_1E69B3908;
  }
  else
  {
    if (a3 != 2) {
      goto LABEL_6;
    }
    int64_t v4 = off_1E69B3900;
  }
  self = (HDHeartDaemonPlugin *)objc_alloc_init(*v4);
LABEL_6:
  return self;
}

- (id)stateSyncEntityClasses
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void).cxx_destruct
{
}

@end