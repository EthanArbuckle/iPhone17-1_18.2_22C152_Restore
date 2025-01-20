@interface HDHearingPluginUnprotectedDatabaseSchema
- (NSArray)databaseEntities;
- (int64_t)currentSchemaVersion;
- (void)registerMigrationStepsForSchemaName:(id)a3 migrator:(id)a4;
@end

@implementation HDHearingPluginUnprotectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  return 9;
}

- (NSArray)databaseEntities
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (void)registerMigrationStepsForSchemaName:(id)a3 migrator:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 addMigrationForSchema:v6 toVersion:3 foreignKeyStatus:0 handler:&__block_literal_global_1];
  [v5 addMigrationForSchema:v6 toVersion:4 foreignKeyStatus:0 handler:&__block_literal_global_289];
  [v5 addMigrationForSchema:v6 toVersion:5 foreignKeyStatus:0 handler:&__block_literal_global_294];
  [v5 addMigrationForSchema:v6 toVersion:6 foreignKeyStatus:0 handler:&__block_literal_global_299];
  [v5 addMigrationForSchema:v6 toVersion:7 foreignKeyStatus:0 handler:&__block_literal_global_301];
  [v5 addMigrationForSchema:v6 toVersion:8 foreignKeyStatus:0 handler:&__block_literal_global_306];
  [v5 addMigrationForSchema:v6 toVersion:9 foreignKeyStatus:0 handler:&__block_literal_global_308];
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = [a3 unprotectedDatabase];
  LODWORD(a5) = [v6 executeSQLStatements:&unk_26D9E9C88 error:a5];

  return a5 ^ 1;
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = [a3 unprotectedDatabase];
  LODWORD(a5) = objc_msgSend(v6, "executeUncachedSQL:error:", @"DROP TABLE IF EXISTS hearing_headphone_audio_exposure_data;",
                  a5);

  return a5 ^ 1;
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = [a3 unprotectedDatabase];
  LODWORD(a5) = objc_msgSend(v6, "executeUncachedSQL:error:", @"DELETE FROM hearing_headphone_audio_exposure_statistics;",
                  a5);

  return a5 ^ 1;
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = [a3 unprotectedDatabase];
  LODWORD(a5) = objc_msgSend(v6, "executeUncachedSQL:error:", @"DELETE FROM hearing_headphone_audio_exposure_statistics;",
                  a5);

  return a5 ^ 1;
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = [a3 unprotectedDatabase];
  LODWORD(a5) = objc_msgSend(v6, "executeUncachedSQL:error:", @"DELETE FROM key_value WHERE domain='Hearing' and key='_LargestSevenDayDoseToday';",
                  a5);

  return a5 ^ 1;
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = [a3 unprotectedDatabase];
  LODWORD(a5) = objc_msgSend(v6, "executeUncachedSQL:error:", @"DELETE FROM hearing_headphone_audio_exposure_statistics;",
                  a5);

  return a5 ^ 1;
}

uint64_t __89__HDHearingPluginUnprotectedDatabaseSchema_registerMigrationStepsForSchemaName_migrator___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = [a3 unprotectedDatabase];
  LODWORD(a5) = [v6 executeSQLStatements:&unk_26D9E9CA0 error:a5];

  return a5 ^ 1;
}

@end