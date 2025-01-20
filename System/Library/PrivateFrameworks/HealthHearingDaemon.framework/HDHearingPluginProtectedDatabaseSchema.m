@interface HDHearingPluginProtectedDatabaseSchema
- (NSArray)databaseEntities;
- (int64_t)currentSchemaVersion;
@end

@implementation HDHearingPluginProtectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  return 0;
}

- (NSArray)databaseEntities
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

@end