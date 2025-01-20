@interface HDHeartPluginProtectedDatabaseSchema
- (NSArray)databaseEntities;
- (int64_t)currentSchemaVersion;
- (void)addMigrationTo:(int64_t)a3 onMigrator:(id)a4 forSchema:(id)a5 function:(void *)a6;
- (void)crystal_addMigrationStepsForSchemaName:(id)a3 migrator:(id)a4;
- (void)registerMigrationStepsForSchemaName:(id)a3 migrator:(id)a4;
@end

@implementation HDHeartPluginProtectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v3 = [v2 futureMigrationsEnabled];

  if (v3) {
    return 100000;
  }
  else {
    return 4;
  }
}

- (NSArray)databaseEntities
{
  v2 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[v2 arrayWithObject:v3];
}

- (void)registerMigrationStepsForSchemaName:(id)a3 migrator:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(HDHeartPluginProtectedDatabaseSchema *)self crystal_addMigrationStepsForSchemaName:v9 migrator:v6];
  v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v8 = [v7 futureMigrationsEnabled];

  if (v8) {
    [(HDHeartPluginProtectedDatabaseSchema *)self future_addMigrationStepsForSchemaName:v9 migrator:v6];
  }
}

- (void)addMigrationTo:(int64_t)a3 onMigrator:(id)a4 forSchema:(id)a5 function:(void *)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__HDHeartPluginProtectedDatabaseSchema_addMigrationTo_onMigrator_forSchema_function___block_invoke;
  v6[3] = &__block_descriptor_40_e70_q40__0__HDDatabaseMigrator_8__HDDatabaseMigrationTransaction_16q24__32l;
  v6[4] = a6;
  [a4 addMigrationForSchema:a5 toVersion:a3 foreignKeyStatus:0 handler:v6];
}

uint64_t __85__HDHeartPluginProtectedDatabaseSchema_addMigrationTo_onMigrator_forSchema_function___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4, a5);
}

- (void)crystal_addMigrationStepsForSchemaName:(id)a3 migrator:(id)a4
{
}

@end