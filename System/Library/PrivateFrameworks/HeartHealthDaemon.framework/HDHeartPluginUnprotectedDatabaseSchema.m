@interface HDHeartPluginUnprotectedDatabaseSchema
- (NSArray)databaseEntities;
- (int64_t)currentSchemaVersion;
@end

@implementation HDHeartPluginUnprotectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  return 0;
}

- (NSArray)databaseEntities
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

@end