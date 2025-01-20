@interface HDHearingPlugin
+ (BOOL)shouldLoadPluginForDaemon:(id)a3;
- (NSString)pluginIdentifier;
- (NSString)schemaName;
- (NSString)syncSchemaIdentifier;
- (id)_databaseSchemaForProtectionClass:(int64_t)a3;
- (id)databaseEntitiesForProtectionClass:(int64_t)a3;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)orderedSyncEntities;
- (id)taskServerClasses;
- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3;
- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4;
@end

@implementation HDHearingPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F44960];
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  v3 = [a3 behavior];
  char v4 = [v3 isRealityDevice];

  return v4 ^ 1;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  if ([v3 profileType] == 1) {
    char v4 = [[HDHearingProfileExtension alloc] initWithProfile:v3];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)taskServerClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (NSString)syncSchemaIdentifier
{
  return (NSString *)@"com.apple.healthd.hearing.sync-schema";
}

- (id)orderedSyncEntities
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (NSString)schemaName
{
  return (NSString *)@"hearing";
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  id v3 = [(HDHearingPlugin *)self _databaseSchemaForProtectionClass:a3];
  int64_t v4 = [v3 currentSchemaVersion];

  return v4;
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  id v3 = [(HDHearingPlugin *)self _databaseSchemaForProtectionClass:a3];
  int64_t v4 = [v3 databaseEntities];

  return v4;
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v6 = a4;
  id v8 = [(HDHearingPlugin *)self _databaseSchemaForProtectionClass:a3];
  v7 = [(HDHearingPlugin *)self schemaName];
  [v8 registerMigrationStepsForSchemaName:v7 migrator:v6];
}

- (id)_databaseSchemaForProtectionClass:(int64_t)a3
{
  if (a3 == 1)
  {
    int64_t v4 = &off_2647959F8;
  }
  else
  {
    if (a3 != 2) {
      goto LABEL_6;
    }
    int64_t v4 = off_2647959F0;
  }
  self = (HDHearingPlugin *)objc_alloc_init(*v4);
LABEL_6:
  return self;
}

@end