@interface HDHealthRecordsPluginProtectedDatabaseSchema
- (NSArray)databaseEntities;
- (int64_t)currentSchemaVersion;
@end

@implementation HDHealthRecordsPluginProtectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  return 0;
}

- (NSArray)databaseEntities
{
  return (NSArray *)&__NSArray0__struct;
}

@end