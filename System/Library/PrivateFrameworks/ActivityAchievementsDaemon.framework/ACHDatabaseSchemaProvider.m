@interface ACHDatabaseSchemaProvider
- (NSString)schemaName;
- (id)databaseEntitiesForProtectionClass:(int64_t)a3;
- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3;
- (void)_addAddAvailableCountryCodesColumnMigrationToMigrator:(id)a3;
- (void)_addAddSuffixesColumnMigrationToMigrator:(id)a3;
- (void)_addDailyTargetExpressionAndUnitColumnsMigrationToMigrator:(id)a3;
- (void)_addDropSyncAnchorSaveOffTableIfNecessaryToMigrator:(id)a3;
- (void)_addEarnedInstancesExternalIdentifierMigrationToMigrator:(id)a3;
- (void)_addGraceExpressionColumnsMigrationToMigrator:(id)a3;
- (void)_addGracePredicateColumnsMigrationToMigrator:(id)a3;
- (void)_addMisnamedTemplateRemovalToMigrator:(id)a3;
- (void)_addNullTemplatesRemovalToMigrator:(id)a3;
- (void)_addPrereqisiteTemplateNameFieldToTemplates:(id)a3;
- (void)_addResetSyncAnchorsMigrationStepToMigrator:(id)a3;
- (void)_addSyncAnchorSaveOffMigrationStepToMigrator:(id)a3;
- (void)_addSyncIdentityColumnToEarnedInstanceEntityToMigrator:(id)a3;
- (void)_addSyncIdentityColumnToTemplateEntityToMigrator:(id)a3;
- (void)_addTemplateRowIdBumpToMigrator:(id)a3;
- (void)_addValidateEarnedInstanceRowStepToMigrator:(id)a3;
- (void)_addVersion5MigratorToMigrator:(id)a3;
- (void)_removeErroneousFitnessPlusTemplates:(id)a3;
- (void)_removeErroneousWorkoutTemplates:(id)a3;
- (void)_removeMoveGoalMultiplierEarnedInstances:(id)a3;
- (void)_removePerfectMonthEarnedInstances:(id)a3;
- (void)_updateGoalFor31DaysSeptemberMonthlyChallenge:(id)a3;
- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4;
@end

@implementation ACHDatabaseSchemaProvider

- (NSString)schemaName
{
  return (NSString *)(id)*MEMORY[0x263F23448];
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  int64_t v3 = 23;
  if (a3 != 2) {
    int64_t v3 = 0;
  }
  if (a3 == 1) {
    return 3;
  }
  else {
    return v3;
  }
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  v5[2] = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    v5[0] = objc_opt_class();
    v5[1] = objc_opt_class();
    int64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  }
  else
  {
    int64_t v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 2)
  {
    id v8 = v6;
    [(ACHDatabaseSchemaProvider *)self _addAddAvailableCountryCodesColumnMigrationToMigrator:v6];
    [(ACHDatabaseSchemaProvider *)self _addVersion5MigratorToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _addValidateEarnedInstanceRowStepToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _addDropSyncAnchorSaveOffTableIfNecessaryToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _addAddSuffixesColumnMigrationToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _addGracePredicateColumnsMigrationToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _addGraceExpressionColumnsMigrationToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _addDailyTargetExpressionAndUnitColumnsMigrationToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _addMisnamedTemplateRemovalToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _addEarnedInstancesExternalIdentifierMigrationToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _addNullTemplatesRemovalToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _updateGoalFor31DaysSeptemberMonthlyChallenge:v8];
    [(ACHDatabaseSchemaProvider *)self _addTemplateRowIdBumpToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _removeErroneousFitnessPlusTemplates:v8];
    [(ACHDatabaseSchemaProvider *)self _removeErroneousWorkoutTemplates:v8];
    [(ACHDatabaseSchemaProvider *)self _addSyncIdentityColumnToEarnedInstanceEntityToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _addSyncIdentityColumnToTemplateEntityToMigrator:v8];
    [(ACHDatabaseSchemaProvider *)self _addPrereqisiteTemplateNameFieldToTemplates:v8];
    [(ACHDatabaseSchemaProvider *)self _removeMoveGoalMultiplierEarnedInstances:v8];
    id v6 = (id)[(ACHDatabaseSchemaProvider *)self _removePerfectMonthEarnedInstances:v8];
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    id v8 = v6;
    [(ACHDatabaseSchemaProvider *)self _addResetSyncAnchorsMigrationStepToMigrator:v6];
    id v6 = (id)[(ACHDatabaseSchemaProvider *)self _addSyncAnchorSaveOffMigrationStepToMigrator:v8];
  }
  id v7 = v8;
LABEL_6:
  MEMORY[0x270F9A758](v6, v7);
}

- (void)_addResetSyncAnchorsMigrationStepToMigrator:(id)a3
{
}

uint64_t __73__ACHDatabaseSchemaProvider__addResetSyncAnchorsMigrationStepToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = [a3 unprotectedDatabase];
  id v8 = ACHLogDatabase();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    v15[0] = a4;
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements reset sync anchors migration from %ld", (uint8_t *)&v14, 0xCu);
  }

  v16[0] = @"DELETE FROM sync_anchors WHERE schema = 'ACHAchievementsPlugin'";
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  int v10 = [v7 executeSQLStatements:v9 error:a5];

  v11 = ACHLogDatabase();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *a5;
    int v14 = 67109378;
    LODWORD(v15[0]) = v10;
    WORD2(v15[0]) = 2112;
    *(void *)((char *)v15 + 6) = v12;
    _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Activity Achievements reset sync anchors migration success: %{BOOL}d, error: %@", (uint8_t *)&v14, 0x12u);
  }

  return v10 ^ 1u;
}

- (void)_addSyncAnchorSaveOffMigrationStepToMigrator:(id)a3
{
}

uint64_t __74__ACHDatabaseSchemaProvider__addSyncAnchorSaveOffMigrationStepToMigrator___block_invoke()
{
  return 0;
}

- (void)_addAddAvailableCountryCodesColumnMigrationToMigrator:(id)a3
{
}

uint64_t __83__ACHDatabaseSchemaProvider__addAddAvailableCountryCodesColumnMigrationToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  v17[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = ACHLogDatabase();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    v16[0] = a4;
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements country codes migration from %ld", (uint8_t *)&v15, 0xCu);
  }

  v9 = [v7 protectedDatabase];

  v17[0] = @"DROP TABLE IF EXISTS ACHAchievementsPlugin_templates";
  v17[1] = @"DROP TABLE IF EXISTS ACHAchievementsPlugin_earned_instances";
  v17[2] = @"CREATE TABLE IF NOT EXISTS ACHAchievementsPlugin_templates         (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,         unique_name TEXT UNIQUE NOT NULL,         version INTEGER,         minimum_engine_version INTEGER,         created_date REAL,         creator_device INTEGER,         source_name TEXT,         predicate TEXT,         value_expression TEXT,         progress_expression TEXT,         goal_expression TEXT,         triggers INTEGER,         earn_limit INTEGER,         visibility_predicate TEXT,         visibility_start_date TEXT,         visibility_end_date TEXT,         availability_predicate TEXT,         availability_start_date TEXT,         availability_end_date TEXT,         available_country_codes TEXT,         alertability_predicate TEXT,         alert_dates TEXT,         duplicateremoval_strategy INTEGER,         duplicateremoval_calendar_unit INTEGER,         earn_date INTEGER,         display_order INTEGER,         displays_earned_instance_count INTEGER,         canonical_unit TEXT,         sync_provenance INTEGER)";
  v17[3] = @"CREATE TABLE IF NOT EXISTS ACHAchievementsPlugin_earned_instances         (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,         template_unique_name TEXT,         created_date REAL,         earned_date TEXT,         value_in_canonical_unit REAL,         value_canonical_unit TEXT,         creator_device INTEGER,         sync_provenance INTEGER)";
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
  int v11 = [v9 executeSQLStatements:v10 error:a5];

  uint64_t v12 = ACHLogDatabase();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *a5;
    int v15 = 67109378;
    LODWORD(v16[0]) = v11;
    WORD2(v16[0]) = 2112;
    *(void *)((char *)v16 + 6) = v13;
    _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Activity Achievements country codes migration success: %{BOOL}d, error: %@", (uint8_t *)&v15, 0x12u);
  }

  return v11 ^ 1u;
}

- (void)_addVersion5MigratorToMigrator:(id)a3
{
}

uint64_t __60__ACHDatabaseSchemaProvider__addVersion5MigratorToMigrator___block_invoke()
{
  return 0;
}

- (void)_addValidateEarnedInstanceRowStepToMigrator:(id)a3
{
}

uint64_t __73__ACHDatabaseSchemaProvider__addValidateEarnedInstanceRowStepToMigrator___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  int v10 = [v9 unprotectedDatabase];
  int v11 = ACHLogDatabase();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a4;
    _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements backup sync anchors migration from %ld (unprotected query)", (uint8_t *)&buf, 0xCu);
  }

  if ([v10 executeUncachedSQL:@"create table if not exists ACHAchievementsPlugin_sync_anchors_backup as select next from sync_anchors WHERE schema = 'ACHAchievementsPlugin' and type = 2" error:a5])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = -1;
    uint64_t v12 = ACHLogDatabase();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v25 = 134217984;
      v26[0] = a4;
      _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements validate earned instance max rowID migration from %ld (unprotected query)", v25, 0xCu);
    }

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __73__ACHDatabaseSchemaProvider__addValidateEarnedInstanceRowStepToMigrator___block_invoke_312;
    v24[3] = &unk_264516868;
    v24[4] = &buf;
    int v13 = [v10 executeUncachedSQL:@"select max(next) from ACHAchievementsPlugin_sync_anchors_backup" error:a5 bindingHandler:0 enumerationHandler:v24];
    int v14 = ACHLogDatabase();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *a5;
      *(_DWORD *)v25 = 67109378;
      LODWORD(v26[0]) = v13;
      WORD2(v26[0]) = 2112;
      *(void *)((char *)v26 + 6) = v15;
      _os_log_impl(&dword_21F5DA000, v14, OS_LOG_TYPE_DEFAULT, "Activity Achievements validate earned instance max rowID migration success (unprotected query): %{BOOL}d, error: %@", v25, 0x12u);
    }

    if (v13)
    {
      if ((*(void *)(*((void *)&buf + 1) + 24) & 0x8000000000000000) != 0)
      {
        v16 = ACHLogDatabase();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_21F5DA000, v16, OS_LOG_TYPE_DEFAULT, "Activity Achievements validate earned instance max rowID migration early success (sync table is empty)", v25, 2u);
        }
        uint64_t v21 = 0;
      }
      else
      {
        v16 = [v9 protectedDatabase];
        v17 = ACHLogDatabase();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v25 = 134217984;
          v26[0] = a4;
          _os_log_impl(&dword_21F5DA000, v17, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements validate earned instance max rowID migration from %ld", v25, 0xCu);
        }

        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __73__ACHDatabaseSchemaProvider__addValidateEarnedInstanceRowStepToMigrator___block_invoke_317;
        v23[3] = &unk_264516890;
        v23[4] = &buf;
        int v18 = [v16 executeUncachedSQL:@"UPDATE ACHAchievementsPlugin_earned_instances SET rowid = ifnull(max(rowid, ?), rowid) WHERE rowid=(SELECT max(rowid) FROM ACHAchievementsPlugin_earned_instances)" error:a5 bindingHandler:v23 enumerationHandler:0];
        v19 = ACHLogDatabase();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *a5;
          *(_DWORD *)v25 = 67109378;
          LODWORD(v26[0]) = v18;
          WORD2(v26[0]) = 2112;
          *(void *)((char *)v26 + 6) = v20;
          _os_log_impl(&dword_21F5DA000, v19, OS_LOG_TYPE_DEFAULT, "Activity Achievements validate earned instance max rowID migration success: %{BOOL}d, error: %@", v25, 0x12u);
        }

        uint64_t v21 = v18 ^ 1u;
      }
    }
    else
    {
      uint64_t v21 = 1;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v21 = 1;
  }

  return v21;
}

uint64_t __73__ACHDatabaseSchemaProvider__addValidateEarnedInstanceRowStepToMigrator___block_invoke_312(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

void __73__ACHDatabaseSchemaProvider__addValidateEarnedInstanceRowStepToMigrator___block_invoke_317(uint64_t a1)
{
  id v1 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  HDSQLiteBindFoundationValueToStatement();
}

- (void)_addDropSyncAnchorSaveOffTableIfNecessaryToMigrator:(id)a3
{
}

uint64_t __81__ACHDatabaseSchemaProvider__addDropSyncAnchorSaveOffTableIfNecessaryToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = [a3 unprotectedDatabase];
  id v8 = ACHLogDatabase();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    v15[0] = a4;
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements drop sync anchor backup migration from %ld", (uint8_t *)&v14, 0xCu);
  }

  v16[0] = @"drop table if exists ACHAchievementsPlugin_sync_anchors_backup";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  int v10 = [v7 executeSQLStatements:v9 error:a5];

  int v11 = ACHLogDatabase();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *a5;
    int v14 = 67109378;
    LODWORD(v15[0]) = v10;
    WORD2(v15[0]) = 2112;
    *(void *)((char *)v15 + 6) = v12;
    _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Activity Achievements drop sync anchor backup migration success: %{BOOL}d, error: %@", (uint8_t *)&v14, 0x12u);
  }

  return v10 ^ 1u;
}

- (void)_addAddSuffixesColumnMigrationToMigrator:(id)a3
{
}

uint64_t __70__ACHDatabaseSchemaProvider__addAddSuffixesColumnMigrationToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = ACHLogDatabase();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    v16[0] = a4;
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements available suffixes migration from %ld", (uint8_t *)&v15, 0xCu);
  }

  id v9 = [v7 protectedDatabase];

  v17[0] = @"ALTER TABLE ACHAchievementsPlugin_templates ADD available_suffixes TEXT";
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  int v11 = [v9 executeSQLStatements:v10 error:a5];

  uint64_t v12 = ACHLogDatabase();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *a5;
    int v15 = 67109378;
    LODWORD(v16[0]) = v11;
    WORD2(v16[0]) = 2112;
    *(void *)((char *)v16 + 6) = v13;
    _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Activity Achievements available suffixes migration success: %{BOOL}d, error: %@", (uint8_t *)&v15, 0x12u);
  }

  return v11 ^ 1u;
}

- (void)_addGracePredicateColumnsMigrationToMigrator:(id)a3
{
}

uint64_t __74__ACHDatabaseSchemaProvider__addGracePredicateColumnsMigrationToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  void v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = ACHLogDatabase();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements migration to add grace predicate columns", (uint8_t *)v14, 2u);
  }

  id v8 = [v6 protectedDatabase];

  v17[0] = @"ALTER TABLE ACHAchievementsPlugin_templates ADD grace_predicate TEXT";
  v17[1] = @"ALTER TABLE ACHAchievementsPlugin_templates ADD grace_visibility_predicate TEXT";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  int v10 = [v8 executeSQLStatements:v9 error:a5];

  int v11 = ACHLogDatabase();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *a5;
    v14[0] = 67109378;
    v14[1] = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Activity Achievements grace predicate columns migration success: %{BOOL}d, error: %@", (uint8_t *)v14, 0x12u);
  }

  return v10 ^ 1u;
}

- (void)_addGraceExpressionColumnsMigrationToMigrator:(id)a3
{
}

uint64_t __75__ACHDatabaseSchemaProvider__addGraceExpressionColumnsMigrationToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  void v17[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = ACHLogDatabase();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements migration to add grace expression columns", (uint8_t *)v14, 2u);
  }

  id v8 = [v6 protectedDatabase];

  v17[0] = @"ALTER TABLE ACHAchievementsPlugin_templates ADD grace_value_expression TEXT";
  v17[1] = @"ALTER TABLE ACHAchievementsPlugin_templates ADD grace_progress_expression TEXT";
  void v17[2] = @"ALTER TABLE ACHAchievementsPlugin_templates ADD grace_goal_expression TEXT";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  int v10 = [v8 executeSQLStatements:v9 error:a5];

  int v11 = ACHLogDatabase();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *a5;
    v14[0] = 67109378;
    v14[1] = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Activity Achievements grace expression columns migration success: %{BOOL}d, error: %@", (uint8_t *)v14, 0x12u);
  }

  return v10 ^ 1u;
}

- (void)_addDailyTargetExpressionAndUnitColumnsMigrationToMigrator:(id)a3
{
}

uint64_t __88__ACHDatabaseSchemaProvider__addDailyTargetExpressionAndUnitColumnsMigrationToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  void v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = ACHLogDatabase();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Running Activity Achievements migration to add daily target and daily target unit columns", (uint8_t *)v14, 2u);
  }

  id v8 = [v6 protectedDatabase];

  v17[0] = @"ALTER TABLE ACHAchievementsPlugin_templates ADD daily_target REAL";
  v17[1] = @"ALTER TABLE ACHAchievementsPlugin_templates ADD daily_target_canonical_unit TEXT";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  int v10 = [v8 executeSQLStatements:v9 error:a5];

  int v11 = ACHLogDatabase();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *a5;
    v14[0] = 67109378;
    v14[1] = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Activity Achievements daily target and daily target unit columns migration success: %{BOOL}d, error: %@", (uint8_t *)v14, 0x12u);
  }

  return v10 ^ 1u;
}

- (void)_addMisnamedTemplateRemovalToMigrator:(id)a3
{
}

uint64_t __67__ACHDatabaseSchemaProvider__addMisnamedTemplateRemovalToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  v18[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = ACHLogDatabase();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Removing misnamed templates", buf, 2u);
  }

  id v8 = [v6 protectedDatabase];

  id v9 = [NSString stringWithFormat:@"DELETE FROM ACHAchievementsPlugin_templates where unique_name = '%@%@%@'", @"Best", @"Mile", @"Duration"];
  int v10 = [NSString stringWithFormat:@"DELETE FROM ACHAchievementsPlugin_earned_instances where template_unique_name = '%@%@%@'", @"Best", @"Mile", @"Duration"];
  int v11 = [NSString stringWithFormat:@"DELETE FROM ACHAchievementsPlugin_templates where unique_name = '%@%@%@'", @"Best", @"Kilometer", @"Duration"];
  uint64_t v12 = [NSString stringWithFormat:@"DELETE FROM ACHAchievementsPlugin_earned_instances where template_unique_name = '%@%@%@'", @"Best", @"Kilometer", @"Duration"];
  v18[0] = v9;
  v18[1] = v10;
  v18[2] = v11;
  v18[3] = v12;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];
  int v14 = [v8 executeSQLStatements:v13 error:a5];

  __int16 v15 = ACHLogDatabase();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21F5DA000, v15, OS_LOG_TYPE_DEFAULT, "Removed misnamed templates", buf, 2u);
  }

  return v14 ^ 1u;
}

- (void)_addEarnedInstancesExternalIdentifierMigrationToMigrator:(id)a3
{
}

uint64_t __86__ACHDatabaseSchemaProvider__addEarnedInstancesExternalIdentifierMigrationToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  v14[3] = *MEMORY[0x263EF8340];
  id v6 = [a3 protectedDatabase];
  id v7 = ACHLogDatabase();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Adding external identifier Column to earned_instances table and removing affected templates and earned instances", buf, 2u);
  }

  id v8 = [NSString stringWithFormat:@"DELETE FROM ACHAchievementsPlugin_templates where unique_name in (%@)", @"'FiftyKilometersCyclingWorkout', 'FiftyMilesCyclingWorkout', 'OneHundredKilometersCyclingWorkout', 'OneHundredMilesCyclingWorkout', 'HalfMarathonWorkout', 'WheelchairHalfMarathonWorkout', 'MarathonWorkout', 'WheelchairMarathonWorkout', 'DuathlonWorkout', 'SprintTriathlonWorkout', 'FiftyKilometerTriathlonWorkout', 'HalfDistanceTriathlonWorkout', 'FullDistanceTriathlonWorkout', 'FiveKilometerWorkout', 'FiveKilometerWheelchairWorkout', 'TenKilometerWorkout', 'TenKilometerWheelchairWorkout'"];
  id v9 = [NSString stringWithFormat:@"DELETE FROM ACHAchievementsPlugin_earned_instances where template_unique_name in (%@)", @"'FiftyKilometersCyclingWorkout', 'FiftyMilesCyclingWorkout', 'OneHundredKilometersCyclingWorkout', 'OneHundredMilesCyclingWorkout', 'HalfMarathonWorkout', 'WheelchairHalfMarathonWorkout', 'MarathonWorkout', 'WheelchairMarathonWorkout', 'DuathlonWorkout', 'SprintTriathlonWorkout', 'FiftyKilometerTriathlonWorkout', 'HalfDistanceTriathlonWorkout', 'FullDistanceTriathlonWorkout', 'FiveKilometerWorkout', 'FiveKilometerWheelchairWorkout', 'TenKilometerWorkout', 'TenKilometerWheelchairWorkout'"];
  v14[0] = v8;
  v14[1] = v9;
  _DWORD v14[2] = @"ALTER TABLE ACHAchievementsPlugin_earned_instances ADD external_identifier TEXT";
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  int v11 = [v6 executeSQLStatements:v10 error:a5];

  return v11 ^ 1u;
}

- (void)_addNullTemplatesRemovalToMigrator:(id)a3
{
}

uint64_t __64__ACHDatabaseSchemaProvider__addNullTemplatesRemovalToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void v14[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = ACHLogDatabase();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Removing First/BestWorkout-(null) templates", v13, 2u);
  }

  id v8 = [v6 protectedDatabase];

  v14[0] = @"DELETE FROM ACHAchievementsPlugin_templates where unique_name = 'FirstWorkout-(null)'";
  v14[1] = @"DELETE FROM ACHAchievementsPlugin_templates where unique_name = 'BestWorkout-(null)'";
  _DWORD v14[2] = @"DELETE FROM ACHAchievementsPlugin_earned_instances where template_unique_name = 'FirstWorkout-(null)'";
  v14[3] = @"DELETE FROM ACHAchievementsPlugin_earned_instances where template_unique_name = 'BestWorkout-(null)'";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
  int v10 = [v8 executeSQLStatements:v9 error:a5];

  int v11 = ACHLogDatabase();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Removed First/BestWorkout-(null) templates", v13, 2u);
  }

  return v10 ^ 1u;
}

- (void)_updateGoalFor31DaysSeptemberMonthlyChallenge:(id)a3
{
}

uint64_t __75__ACHDatabaseSchemaProvider__updateGoalFor31DaysSeptemberMonthlyChallenge___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  void v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = ACHLogDatabase();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Updating goal for 31 days September MonthlyChallenge", (uint8_t *)v14, 2u);
  }

  id v8 = [v6 protectedDatabase];

  v17[0] = @"UPDATE ACHAchievementsPlugin_templates SET goal_expression = '27', predicate = 'numberOfDaysClosingAllThreeRingsInCurrentMonth >= 27' where unique_name = 'MonthlyChallengeTypeAllThreeRings_2022_09' and goal_expression = '31'";
  v17[1] = @"UPDATE ACHAchievementsPlugin_templates SET goal_expression = '27', predicate = 'numberOfDaysClosingMoveRingInCurrentMonth >= 27' where unique_name = 'MonthlyChallengeTypeMoveRing_2022_09' and goal_expression = '31'";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  int v10 = [v8 executeSQLStatements:v9 error:a5];

  int v11 = ACHLogDatabase();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *a5;
    v14[0] = 67109378;
    v14[1] = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Updated goal for 31 days September MonthlyChallenge with success: %{BOOL}d, error: %@", (uint8_t *)v14, 0x12u);
  }

  return v10 ^ 1u;
}

- (void)_addTemplateRowIdBumpToMigrator:(id)a3
{
}

uint64_t __61__ACHDatabaseSchemaProvider__addTemplateRowIdBumpToMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void v17[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263F0A980] sharedBehavior];
  int v8 = [v7 isAppleWatch];

  id v9 = ACHLogDatabase();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Skipping template row id update migration on watch", v16, 2u);
    }
    uint64_t v11 = 0;
  }
  else
  {
    if (v10)
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Updating template row ids", v16, 2u);
    }

    id v9 = [v6 protectedDatabase];
    v17[0] = @"CREATE TABLE IF NOT EXISTS ACHAchievementsPlugin_templates_backup AS SELECT rowid, unique_name, version, minimum_engine_version, created_date, creator_device, source_name, predicate, grace_predicate, value_expression, grace_value_expression, progress_expression, grace_progress_expression, goal_expression, grace_goal_expression, triggers, earn_limit, visibility_predicate, grace_visibility_predicate, visibility_start_date, visibility_end_date, availability_predicate, availability_start_date, availability_end_date, available_country_codes, alertability_predicate, alert_dates, duplicateremoval_strategy, duplicateremoval_calendar_unit, earn_date, display_order, displays_earned_instance_count, canonical_unit, sync_provenance, available_suffixes, daily_target, daily_target_canonical_unit FROM ACHAchievementsPlugin_templates";
    v17[1] = @"DELETE FROM ACHAchievementsPlugin_templates";
    void v17[2] = @"INSERT INTO ACHAchievementsPlugin_templates (unique_name, version, minimum_engine_version, created_date, creator_device, source_name, predicate, grace_predicate, value_expression, grace_value_expression, progress_expression, grace_progress_expression, goal_expression, grace_goal_expression, triggers, earn_limit, visibility_predicate, grace_visibility_predicate, visibility_start_date, visibility_end_date, availability_predicate, availability_start_date, availability_end_date, available_country_codes, alertability_predicate, alert_dates, duplicateremoval_strategy, duplicateremoval_calendar_unit, earn_date, display_order, displays_earned_instance_count, canonical_unit, sync_provenance, available_suffixes, daily_target, daily_target_canonical_unit) SELECT unique_name, version, minimum_engine_version, created_date, creator_device, source_name, predicate, grace_predicate, value_expression, grace_value_expression, progress_expression, grace_progress_expression, goal_expression, grace_goal_expression, triggers, earn_limit, visibility_predicate, grace_visibility_predicate, visibility_start_date, visibility_end_date, availability_predicate, availability_start_date, availability_end_date, available_country_codes, alertability_predicate, alert_dates, duplicateremoval_strategy, duplicateremoval_calendar_unit, earn_date, display_order, displays_earned_instance_count, canonical_unit, sync_provenance, available_suffixes, daily_target, daily_target_canonical_unit FROM ACHAchievementsPlugin_templates_backup";
    void v17[3] = @"DROP TABLE IF EXISTS ACHAchievementsPlugin_templates_backup";
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
    int v13 = [v9 executeSQLStatements:v12 error:a5];

    int v14 = ACHLogDatabase();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_21F5DA000, v14, OS_LOG_TYPE_DEFAULT, "Updated template row ids", v16, 2u);
    }

    uint64_t v11 = v13 ^ 1u;
  }

  return v11;
}

- (void)_removeErroneousFitnessPlusTemplates:(id)a3
{
}

uint64_t __66__ACHDatabaseSchemaProvider__removeErroneousFitnessPlusTemplates___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v33 = [a3 protectedDatabase];
  id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v38 = [&unk_26D116400 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v38)
  {
    uint64_t v34 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v49 != v34) {
          objc_enumerationMutation(&unk_26D116400);
        }
        uint64_t v7 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        v42 = [NSString stringWithFormat:@"'FirstFitnessPlusWorkoutAward-%@'", v7];
        objc_msgSend(v37, "addObject:");
        v40 = [NSString stringWithFormat:@"'BestFitnessPlusWorkoutAward-%@'", v7];
        objc_msgSend(v36, "addObject:");
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v8 = [&unk_26D1163E8 countByEnumeratingWithState:&v44 objects:v57 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v45 != v10) {
                objc_enumerationMutation(&unk_26D1163E8);
              }
              uint64_t v12 = [NSString stringWithFormat:@"'FitnessPlusModalityLifetimeWorkoutAward-%@-%lu'", v7, objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * j), "unsignedIntegerValue")];
              [v5 addObject:v12];
            }
            uint64_t v9 = [&unk_26D1163E8 countByEnumeratingWithState:&v44 objects:v57 count:16];
          }
          while (v9);
        }
      }
      uint64_t v38 = [&unk_26D116400 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v38);
  }
  uint64_t v13 = [v37 componentsJoinedByString:@","];
  uint64_t v14 = [v36 componentsJoinedByString:@","];
  __int16 v15 = [v5 componentsJoinedByString:@","];
  uint64_t v16 = ACHLogDatabase();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)v54 = v13;
    *(_WORD *)&v54[8] = 2112;
    *(void *)&v54[10] = v14;
    __int16 v55 = 2112;
    v56 = v15;
    _os_log_impl(&dword_21F5DA000, v16, OS_LOG_TYPE_DEFAULT, "Removing erroneous FitnessPlus templates/earned instances where templates not in: %@, %@, %@", buf, 0x20u);
  }

  v39 = (void *)v13;
  uint64_t v17 = [NSString stringWithFormat:@"SELECT unique_name from ACHAchievementsPlugin_templates WHERE unique_name LIKE 'FirstFitnessPlusWorkoutAward-%@' AND source_name='FitnessPlusAwards' AND unique_name NOT IN (%@)", @"%", v13];
  v35 = (void *)v14;
  int v18 = [NSString stringWithFormat:@"SELECT unique_name from ACHAchievementsPlugin_templates WHERE unique_name LIKE 'BestFitnessPlusWorkoutAward-%@' AND source_name='FitnessPlusAwards' AND unique_name NOT IN (%@)", @"%", v14];
  v19 = [NSString stringWithFormat:@"SELECT unique_name from ACHAchievementsPlugin_templates WHERE unique_name LIKE 'FitnessPlusModalityLifetimeWorkoutAward-%@' AND source_name='FitnessPlusAwards' AND unique_name NOT IN (%@)", @"%", v15];
  uint64_t v20 = [NSString stringWithFormat:@"DELETE from ACHAchievementsPlugin_earned_instances WHERE template_unique_name in (%@)", v17];
  v43 = [NSString stringWithFormat:@"DELETE from ACHAchievementsPlugin_earned_instances WHERE template_unique_name in (%@)", v18];
  v41 = [NSString stringWithFormat:@"DELETE from ACHAchievementsPlugin_earned_instances WHERE template_unique_name in (%@)", v19];
  v31 = (void *)v17;
  uint64_t v21 = [NSString stringWithFormat:@"DELETE from ACHAchievementsPlugin_templates WHERE unique_name in (%@)", v17];
  v22 = [NSString stringWithFormat:@"DELETE from ACHAchievementsPlugin_templates WHERE unique_name in (%@)", v18];
  v23 = [NSString stringWithFormat:@"DELETE from ACHAchievementsPlugin_templates WHERE unique_name in (%@)", v19];
  v24 = ACHLogDatabase();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21F5DA000, v24, OS_LOG_TYPE_DEFAULT, "Removing erroneous FitnessPlus templates/earned instances", buf, 2u);
  }

  uint64_t v30 = (void *)v20;
  v52[0] = v20;
  v52[1] = v43;
  v52[2] = v41;
  v52[3] = v21;
  v52[4] = v22;
  v52[5] = v23;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:6];
  int v26 = [v33 executeSQLStatements:v25 error:a5];

  v27 = ACHLogDatabase();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = *a5;
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)v54 = v26;
    *(_WORD *)&v54[4] = 2112;
    *(void *)&v54[6] = v28;
    _os_log_impl(&dword_21F5DA000, v27, OS_LOG_TYPE_DEFAULT, "Removed erroneous FitnessPlus templates/earned instances: %{BOOL}d, error: %@", buf, 0x12u);
  }

  return v26 ^ 1u;
}

- (void)_removeErroneousWorkoutTemplates:(id)a3
{
}

uint64_t __62__ACHDatabaseSchemaProvider__removeErroneousWorkoutTemplates___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = (id)*MEMORY[0x263F23508];
  uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v10 = NSString;
        uint64_t v11 = objc_msgSend(MEMORY[0x263F0A8F8], "_stringFromWorkoutActivityType:", objc_msgSend(v9, "unsignedIntegerValue"));
        uint64_t v12 = [v10 stringWithFormat:@"'FirstWorkout-%@'", v11];

        uint64_t v13 = NSString;
        uint64_t v14 = objc_msgSend(MEMORY[0x263F0A8F8], "_stringFromWorkoutActivityType:", objc_msgSend(v9, "unsignedIntegerValue"));
        __int16 v15 = [v13 stringWithFormat:@"'BestWorkout-%@'", v14];

        [v38 addObject:v12];
        [v37 addObject:v15];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v6);
  }

  uint64_t v16 = [v38 componentsJoinedByString:@","];
  uint64_t v17 = [v37 componentsJoinedByString:@","];
  id obja = (id)v16;
  int v18 = [NSString stringWithFormat:@"SELECT unique_name FROM ACHAchievementsPlugin_templates where unique_name LIKE 'FirstWorkout-%%' AND source_name='BuiltIn' AND unique_name NOT IN (%@)", v16];
  v32 = (void *)v17;
  v19 = [NSString stringWithFormat:@"SELECT unique_name FROM ACHAchievementsPlugin_templates where unique_name LIKE 'BestWorkout-%%' AND source_name='BuiltIn' AND unique_name NOT IN (%@)", v17];
  uint64_t v20 = [NSString stringWithFormat:@"DELETE FROM ACHAchievementsPlugin_earned_instances WHERE template_unique_name in (%@)", v18];
  uint64_t v21 = [NSString stringWithFormat:@"DELETE FROM ACHAchievementsPlugin_earned_instances WHERE template_unique_name in (%@)", v19];
  v22 = [NSString stringWithFormat:@"DELETE from ACHAchievementsPlugin_templates WHERE unique_name in (%@)", v18];
  v23 = [NSString stringWithFormat:@"DELETE from ACHAchievementsPlugin_templates WHERE unique_name in (%@)", v19];
  v24 = ACHLogDatabase();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21F5DA000, v24, OS_LOG_TYPE_DEFAULT, "Removing erroneous Workout templates/earned instances", buf, 2u);
  }

  v25 = [v34 protectedDatabase];
  v47[0] = v20;
  v47[1] = v21;
  int v26 = (void *)v21;
  v47[2] = v22;
  v47[3] = v23;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:4];
  int v28 = [v25 executeSQLStatements:v27 error:a5];

  uint64_t v29 = ACHLogDatabase();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = *a5;
    *(_DWORD *)long long buf = 67109378;
    int v44 = v28;
    __int16 v45 = 2112;
    uint64_t v46 = v30;
    _os_log_impl(&dword_21F5DA000, v29, OS_LOG_TYPE_DEFAULT, "Removed erroneous Workout templates/earned instances: %{BOOL}d, error: %@", buf, 0x12u);
  }

  return v28 ^ 1u;
}

- (void)_addSyncIdentityColumnToEarnedInstanceEntityToMigrator:(id)a3
{
}

uint64_t __84__ACHDatabaseSchemaProvider__addSyncIdentityColumnToEarnedInstanceEntityToMigrator___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = ACHLogDatabase();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Adding sync identity column to earned instance entity", buf, 2u);
  }

  uint64_t v10 = [v8 protectedDatabase];
  if (objc_msgSend(v10, "executeUncachedSQL:error:", @"CREATE TABLE IF NOT EXISTS ACHAchievementsPlugin_earned_instances_new         (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,         template_unique_name TEXT,         created_date REAL,         earned_date TEXT,         value_in_canonical_unit REAL,         value_canonical_unit TEXT,         external_identifier TEXT,         creator_device INTEGER,         sync_provenance INTEGER,         sync_identity INTEGER NOT NULL);",
                       a5))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;",
      *MEMORY[0x263F43490],
    uint64_t v11 = *MEMORY[0x263F43490]);
    *(void *)long long buf = 0;
    uint64_t v21 = buf;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v12 = [v8 unprotectedDatabase];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __84__ACHDatabaseSchemaProvider__addSyncIdentityColumnToEarnedInstanceEntityToMigrator___block_invoke_559;
    v19[3] = &unk_264516868;
    v19[4] = buf;
    char v13 = [v12 executeSQL:v11 error:a5 bindingHandler:0 enumerationHandler:v19];

    if ((v13 & 1) != 0
      && (v18[0] = MEMORY[0x263EF8330],
          v18[1] = 3221225472,
          v18[2] = __84__ACHDatabaseSchemaProvider__addSyncIdentityColumnToEarnedInstanceEntityToMigrator___block_invoke_2,
          v18[3] = &unk_264516890,
          v18[4] = buf,
          (objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", @"INSERT INTO ACHAchievementsPlugin_earned_instances_new(       ROWID,         template_unique_name,         created_date,         earned_date,         value_in_canonical_unit,         value_canonical_unit,         external_identifier,         creator_device,         sync_provenance,         sync_identity)         SELECT ROWID, template_unique_name, created_date, earned_date, value_in_canonical_unit, value_canonical_unit, external_identifier, creator_device, sync_provenance, ? FROM ACHAchievementsPlugin_earned_instances;",
             a5,
             v18,
             0) & 1) != 0))
    {
      v24[0] = @"DROP TABLE ACHAchievementsPlugin_earned_instances;";
      v24[1] = @"ALTER TABLE ACHAchievementsPlugin_earned_instances_new RENAME TO ACHAchievementsPlugin_earned_instances;";
      uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
      int v15 = [v10 executeSQLStatements:v14 error:a5];

      uint64_t v16 = v15 ^ 1u;
    }
    else
    {
      uint64_t v16 = 1;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v16 = 1;
  }

  return v16;
}

uint64_t __84__ACHDatabaseSchemaProvider__addSyncIdentityColumnToEarnedInstanceEntityToMigrator___block_invoke_559(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __84__ACHDatabaseSchemaProvider__addSyncIdentityColumnToEarnedInstanceEntityToMigrator___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

- (void)_addSyncIdentityColumnToTemplateEntityToMigrator:(id)a3
{
}

uint64_t __78__ACHDatabaseSchemaProvider__addSyncIdentityColumnToTemplateEntityToMigrator___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = ACHLogDatabase();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Adding sync identity column to template entity", buf, 2u);
  }

  uint64_t v10 = [v8 protectedDatabase];
  if (objc_msgSend(v10, "executeUncachedSQL:error:", @"CREATE TABLE IF NOT EXISTS ACHAchievementsPlugin_templates_new         (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,         unique_name TEXT UNIQUE NOT NULL,         version INTEGER,         minimum_engine_version INTEGER,         created_date REAL,         creator_device INTEGER,         source_name TEXT,         predicate TEXT,         value_expression TEXT,         progress_expression TEXT,         goal_expression TEXT,         triggers INTEGER,         earn_limit INTEGER,         visibility_predicate TEXT,         visibility_start_date TEXT,         visibility_end_date TEXT,         availability_predicate TEXT,         availability_start_date TEXT,         availability_end_date TEXT,         available_country_codes TEXT,         alertability_predicate TEXT,         alert_dates TEXT,         duplicateremoval_strategy INTEGER,         duplicateremoval_calendar_unit INTEGER,         earn_date INTEGER,         display_order INTEGER,         displays_earned_instance_count INTEGER,         canonical_unit TEXT,         sync_provenance INTEGER,         available_suffixes INTEGER,         grace_predicate INTEGER,         grace_visibility_predicate INTEGER,         grace_value_expression INTEGER,         grace_progress_expression INTEGER,         grace_goal_expression INTEGER,         daily_target INTEGER,         daily_target_canonical_unit INTEGER,         sync_identity INTEGER NOT NULL);",
                       a5))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;",
      *MEMORY[0x263F43490],
    uint64_t v11 = *MEMORY[0x263F43490]);
    *(void *)long long buf = 0;
    uint64_t v21 = buf;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v12 = [v8 unprotectedDatabase];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __78__ACHDatabaseSchemaProvider__addSyncIdentityColumnToTemplateEntityToMigrator___block_invoke_574;
    v19[3] = &unk_264516868;
    v19[4] = buf;
    char v13 = [v12 executeSQL:v11 error:a5 bindingHandler:0 enumerationHandler:v19];

    if ((v13 & 1) != 0
      && (v18[0] = MEMORY[0x263EF8330],
          v18[1] = 3221225472,
          v18[2] = __78__ACHDatabaseSchemaProvider__addSyncIdentityColumnToTemplateEntityToMigrator___block_invoke_2,
          v18[3] = &unk_264516890,
          v18[4] = buf,
          (objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", @"INSERT INTO ACHAchievementsPlugin_templates_new(       ROWID,         unique_name,         version,         minimum_engine_version,         created_date,         creator_device,         source_name,         predicate,         value_expression,         progress_expression,         goal_expression,         triggers,         earn_limit,         visibility_predicate,         visibility_start_date,         visibility_end_date,         availability_predicate,         availability_start_date,         availability_end_date,         available_country_codes,         alertability_predicate,         alert_dates,         duplicateremoval_strategy,         duplicateremoval_calendar_unit,         earn_date,         display_order,         displays_earned_instance_count,         canonical_unit,         sync_provenance,         available_suffixes,         grace_predicate,         grace_visibility_predicate,         grace_value_expression,         grace_progress_expression,         grace_goal_expression,         daily_target,         daily_target_canonical_unit,         sync_identity)         SELECT ROWID, unique_name, version, minimum_engine_version, created_date, creator_device, source_name, predicate, value_expression, progress_expression, goal_expression, triggers, earn_limit, visibility_predicate, visibility_start_date, visibility_end_date, availability_predicate, availability_start_date, availability_end_date, available_country_codes, alertability_predicate, alert_dates, duplicateremoval_strategy, duplicateremoval_calendar_unit, earn_date, display_order, displays_earned_instance_count, canonical_unit, sync_provenance, available_suffixes, grace_predicate, grace_visibility_predicate, grace_value_expression, grace_progress_expression, grace_goal_expression, daily_target, daily_target_canonical_unit, ? FROM ACHAchievementsPlugin_templates;",
             a5,
             v18,
             0) & 1) != 0))
    {
      v24[0] = @"DROP TABLE ACHAchievementsPlugin_templates;";
      v24[1] = @"ALTER TABLE ACHAchievementsPlugin_templates_new RENAME TO ACHAchievementsPlugin_templates;";
      uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
      int v15 = [v10 executeSQLStatements:v14 error:a5];

      uint64_t v16 = v15 ^ 1u;
    }
    else
    {
      uint64_t v16 = 1;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v16 = 1;
  }

  return v16;
}

uint64_t __78__ACHDatabaseSchemaProvider__addSyncIdentityColumnToTemplateEntityToMigrator___block_invoke_574(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __78__ACHDatabaseSchemaProvider__addSyncIdentityColumnToTemplateEntityToMigrator___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

- (void)_addPrereqisiteTemplateNameFieldToTemplates:(id)a3
{
}

uint64_t __73__ACHDatabaseSchemaProvider__addPrereqisiteTemplateNameFieldToTemplates___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a3 protectedDatabase];
  v15[0] = @"ALTER TABLE ACHAchievementsPlugin_templates ADD prerequisite_template_name TEXT";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  int v8 = [v6 executeSQLStatements:v7 error:a5];

  uint64_t v9 = ACHLogDatabase();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *a5;
    v12[0] = 67109378;
    v12[1] = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Added prerequisite_template_name to ACHTemplates: %{BOOL}d, error: %@", (uint8_t *)v12, 0x12u);
  }

  return v8 ^ 1u;
}

- (void)_removeMoveGoalMultiplierEarnedInstances:(id)a3
{
}

uint64_t __70__ACHDatabaseSchemaProvider__removeMoveGoalMultiplierEarnedInstances___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a3 protectedDatabase];
  v15[0] = @"DELETE FROM ACHAchievementsPlugin_earned_instances WHERE template_unique_name IN ('MoveGoal200Percent', 'MoveGoal300Percent', 'MoveGoal400Percent')";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  int v8 = [v6 executeSQLStatements:v7 error:a5];

  uint64_t v9 = ACHLogDatabase();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *a5;
    v12[0] = 67109378;
    v12[1] = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Removed existing 200%%, 300%%, 400%% earned instances: %{BOOL}d, error: %@", (uint8_t *)v12, 0x12u);
  }

  return v8 ^ 1u;
}

- (void)_removePerfectMonthEarnedInstances:(id)a3
{
}

uint64_t __64__ACHDatabaseSchemaProvider__removePerfectMonthEarnedInstances___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a3 protectedDatabase];
  v15[0] = @"DELETE FROM ACHAchievementsPlugin_earned_instances WHERE template_unique_name LIKE 'PerfectMonth_%'";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  int v8 = [v6 executeSQLStatements:v7 error:a5];

  uint64_t v9 = ACHLogDatabase();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *a5;
    v12[0] = 67109378;
    v12[1] = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Removed existing Perfect Months earned instances: %{BOOL}d, error: %@", (uint8_t *)v12, 0x12u);
  }

  return v8 ^ 1u;
}

@end