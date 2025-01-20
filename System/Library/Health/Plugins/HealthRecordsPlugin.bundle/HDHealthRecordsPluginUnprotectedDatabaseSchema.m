@interface HDHealthRecordsPluginUnprotectedDatabaseSchema
- (NSArray)databaseEntities;
- (int64_t)currentSchemaVersion;
- (void)registerMigrationStepsWithMigrator:(id)a3 schemaName:(id)a4;
@end

@implementation HDHealthRecordsPluginUnprotectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  return 12000;
}

- (NSArray)databaseEntities
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (void)registerMigrationStepsWithMigrator:(id)a3 schemaName:(id)a4
{
}

@end