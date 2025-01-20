@interface HDRacePreviousRoutePlugin
- (NSString)pluginIdentifier;
- (NSString)schemaName;
- (NSString)syncSchemaIdentifier;
- (id)databaseEntitiesForProtectionClass:(int64_t)a3;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)orderedSyncEntities;
- (id)taskServerClasses;
- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3;
- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4;
@end

@implementation HDRacePreviousRoutePlugin

- (NSString)pluginIdentifier
{
  return (NSString *)@"com.apple.health.RacePreviousRoute";
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  if ([v3 profileType] == 1) {
    v4 = [[HDRacePreviousRouteProfileExtension alloc] initWithProfile:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (NSString)schemaName
{
  return (NSString *)@"RacePreviousRoute";
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  return +[HDRacePreviousRouteSchemaProvider currentSchemaVersionForProtectionClass:a3];
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  return +[HDRacePreviousRouteSchemaProvider databaseEntitiesForProtectionClass:a3];
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
}

- (NSString)syncSchemaIdentifier
{
  return (NSString *)@"com.apple.health.RacePreviousRoute.sync";
}

- (id)orderedSyncEntities
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)taskServerClasses
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  void v4[2] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

@end