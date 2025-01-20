@interface HDHealthMedicationsPluginUnprotectedDatabaseSchema
- (NSArray)databaseEntities;
- (int64_t)currentSchemaVersion;
@end

@implementation HDHealthMedicationsPluginUnprotectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  v2 = [MEMORY[0x1E4F66B98] sharedBehavior];
  [v2 medicationsFutureMigrationsEnabled];

  return 0;
}

- (NSArray)databaseEntities
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

@end