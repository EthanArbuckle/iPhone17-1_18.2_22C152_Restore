@interface WOWorkoutHealthPlugin
- (NSString)pluginIdentifier;
- (NSString)schemaName;
- (NSString)syncSchemaIdentifier;
- (id)databaseEntitiesForProtectionClass:(int64_t)a3;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)orderedSyncEntities;
- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3;
- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4;
@end

@implementation WOWorkoutHealthPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)kNLWorkoutPluginIdentifier;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  if ([v3 profileType] == (char *)&dword_0 + 1) {
    v4 = [[WOWorkoutHealthProfileExtension alloc] initWithProfile:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (NSString)schemaName
{
  return (NSString *)@"WorkoutHealthPlugin";
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  return +[WOWorkoutHealthSchemaProvider currentSchemaVersionForProtectionClass:a3];
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  return +[WOWorkoutHealthSchemaProvider databaseEntitiesForProtectionClass:a3];
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
}

- (NSString)syncSchemaIdentifier
{
  return (NSString *)@"com.apple.workout.health.sync";
}

- (id)orderedSyncEntities
{
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

@end