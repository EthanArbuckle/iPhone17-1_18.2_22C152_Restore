@interface HDHealthMedicationsPluginProtectedDatabaseSchema
- (NSArray)databaseEntities;
- (id)_getLegacySyncIdentityWithTransaction:(id)a3 errorOut:(id *)a4;
- (int64_t)_addCompatibilityVersionColumnsWithTransaction:(id)a3 error:(id *)a4;
- (int64_t)_addDisplayOptionsToMedicationScheduleTable:(id)a3 error:(id *)a4;
- (int64_t)_addScheduleTypeToMedicationScheduleTable:(id)a3 error:(id *)a4;
- (int64_t)_addUniqueConstraintToScheduleMedicationIdentifier:(id)a3 error:(id *)a4;
- (int64_t)_createMedicationDismissedPregnancyLactationInteractionsTableWithTransaction:(id)a3 error:(id *)a4;
- (int64_t)_createRemoteScheduleUnavailableRecordsTableWithTransaction:(id)a3 error:(id *)a4;
- (int64_t)_moveLifestyleFactorsFromUserDefaultsToKeyValueDomain:(id)a3 error:(id *)a4;
- (int64_t)_setInvalidSchedulesAsLocallyIncompatibleWithMaximumIntegerValue:(id)a3 error:(id *)a4;
- (int64_t)_sydney_addSyncIdentityToMedicationScheduleEntityWithTransaction:(id)a3 error:(id *)a4;
- (int64_t)_sydney_createMedicationDismissedInteractionsTableWithTransaction:(id)a3 error:(id *)a4;
- (int64_t)_sydney_dropAndReAddMedicationScheduleTableWithTransaction:(id)a3 error:(id *)a4;
- (int64_t)_sydney_dropMedicationIngredientsTableWithTransaction:(id)a3 error:(id *)a4;
- (int64_t)currentSchemaVersion;
- (void)registerMigrationStepsWithMigrator:(id)a3 schemaName:(id)a4;
@end

@implementation HDHealthMedicationsPluginProtectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  v2 = [MEMORY[0x1E4F66B98] sharedBehavior];
  int v3 = [v2 medicationsFutureMigrationsEnabled];

  if (v3) {
    return 100000;
  }
  else {
    return 18300;
  }
}

- (NSArray)databaseEntities
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  return (NSArray *)v2;
}

- (void)registerMigrationStepsWithMigrator:(id)a3 schemaName:(id)a4
{
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke;
  v19[3] = &unk_1E6338120;
  v19[4] = self;
  id v6 = a4;
  id v7 = a3;
  [v7 addMigrationForSchema:v6 toVersion:16001 foreignKeyStatus:0 handler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_2;
  v18[3] = &unk_1E6338120;
  v18[4] = self;
  [v7 addMigrationForSchema:v6 toVersion:16002 foreignKeyStatus:0 handler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_3;
  v17[3] = &unk_1E6338120;
  v17[4] = self;
  [v7 addMigrationForSchema:v6 toVersion:16003 foreignKeyStatus:0 handler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_4;
  v16[3] = &unk_1E6338120;
  v16[4] = self;
  [v7 addMigrationForSchema:v6 toVersion:16004 foreignKeyStatus:1 handler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_5;
  v15[3] = &unk_1E6338120;
  v15[4] = self;
  [v7 addMigrationForSchema:v6 toVersion:16400 foreignKeyStatus:1 handler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_6;
  v14[3] = &unk_1E6338120;
  v14[4] = self;
  [v7 addMigrationForSchema:v6 toVersion:17009 foreignKeyStatus:0 handler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_7;
  v13[3] = &unk_1E6338120;
  v13[4] = self;
  [v7 addMigrationForSchema:v6 toVersion:17011 foreignKeyStatus:1 handler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_8;
  v12[3] = &unk_1E6338120;
  v12[4] = self;
  [v7 addMigrationForSchema:v6 toVersion:18000 foreignKeyStatus:1 handler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_9;
  v11[3] = &unk_1E6338120;
  v11[4] = self;
  [v7 addMigrationForSchema:v6 toVersion:18001 foreignKeyStatus:1 handler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_10;
  v10[3] = &unk_1E6338120;
  v10[4] = self;
  [v7 addMigrationForSchema:v6 toVersion:18002 foreignKeyStatus:0 handler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_11;
  v9[3] = &unk_1E6338120;
  v9[4] = self;
  [v7 addMigrationForSchema:v6 toVersion:18003 foreignKeyStatus:0 handler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_12;
  v8[3] = &unk_1E6338120;
  v8[4] = self;
  [v7 addMigrationForSchema:v6 toVersion:18300 foreignKeyStatus:0 handler:v8];
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sydney_dropMedicationIngredientsTableWithTransaction:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sydney_dropAndReAddMedicationScheduleTableWithTransaction:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sydney_createMedicationDismissedInteractionsTableWithTransaction:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sydney_addSyncIdentityToMedicationScheduleEntityWithTransaction:error:", a3, a5);
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _addCompatibilityVersionColumnsWithTransaction:a3 error:a5];
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _moveLifestyleFactorsFromUserDefaultsToKeyValueDomain:a3 error:a5];
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _addUniqueConstraintToScheduleMedicationIdentifier:a3 error:a5];
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _addScheduleTypeToMedicationScheduleTable:a3 error:a5];
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _addDisplayOptionsToMedicationScheduleTable:a3 error:a5];
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _createMedicationDismissedPregnancyLactationInteractionsTableWithTransaction:a3 error:a5];
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _createRemoteScheduleUnavailableRecordsTableWithTransaction:a3 error:a5];
}

uint64_t __98__HDHealthMedicationsPluginProtectedDatabaseSchema_registerMigrationStepsWithMigrator_schemaName___block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _setInvalidSchedulesAsLocallyIncompatibleWithMaximumIntegerValue:a3 error:a5];
}

- (id)_getLegacySyncIdentityWithTransaction:(id)a3 errorOut:(id *)a4
{
  id v5 = a3;
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;",
    *MEMORY[0x1E4F65C98],
  id v6 = *MEMORY[0x1E4F65C98]);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v7 = [v5 unprotectedDatabase];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__HDHealthMedicationsPluginProtectedDatabaseSchema__getLegacySyncIdentityWithTransaction_errorOut___block_invoke;
  v10[3] = &unk_1E63380A8;
  v10[4] = &v11;
  LODWORD(a4) = [v7 executeSQL:v6 error:a4 bindingHandler:0 enumerationHandler:v10];

  if (a4)
  {
    v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:v12[3]];
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __99__HDHealthMedicationsPluginProtectedDatabaseSchema__getLegacySyncIdentityWithTransaction_errorOut___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

- (int64_t)_sydney_dropMedicationIngredientsTableWithTransaction:(id)a3 error:(id *)a4
{
  id v5 = [a3 protectedDatabase];
  int64_t v6 = [v5 executeSQLStatements:&unk_1F17FC720 error:a4] ^ 1;

  return v6;
}

- (int64_t)_sydney_dropAndReAddMedicationScheduleTableWithTransaction:(id)a3 error:(id *)a4
{
  id v5 = [a3 protectedDatabase];
  int64_t v6 = [v5 executeSQLStatements:&unk_1F17FC738 error:a4] ^ 1;

  return v6;
}

- (int64_t)_sydney_createMedicationDismissedInteractionsTableWithTransaction:(id)a3 error:(id *)a4
{
  id v5 = [a3 protectedDatabase];
  int64_t v6 = [v5 executeSQLStatements:&unk_1F17FC750 error:a4] ^ 1;

  return v6;
}

- (int64_t)_sydney_addSyncIdentityToMedicationScheduleEntityWithTransaction:(id)a3 error:(id *)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 protectedDatabase];
  if ([v7 executeUncachedSQL:@"CREATE TABLE medication_schedules_new (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB UNIQUE NOT NULL, medication_uuid BLOB NOT NULL, medication_identifier TEXT NOT NULL, start_date_time REAL NOT NULL, end_date_time REAL, created_time_zone TEXT NOT NULL, frequency_type INTEGER NOT NULL, cycle_start_date_components BLOB, note TEXT, creation_date REAL NOT NULL, deleted INTEGER NOT NULL, sync_provenance INTEGER NOT NULL, sync_identity INTEGER NOT NULL)", a4 error])
  {
    v8 = [(HDHealthMedicationsPluginProtectedDatabaseSchema *)self _getLegacySyncIdentityWithTransaction:v6 errorOut:a4];
    if (v8)
    {
      v9 = [NSString stringWithFormat:@"INSERT INTO medication_schedules_new (ROWID, uuid, medication_uuid, medication_identifier, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, creation_date, deleted, sync_provenance, sync_identity) SELECT ROWID, uuid, medication_uuid, medication_identifier, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, creation_date, deleted, sync_provenance, ? FROM medication_schedules;"];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __123__HDHealthMedicationsPluginProtectedDatabaseSchema__sydney_addSyncIdentityToMedicationScheduleEntityWithTransaction_error___block_invoke;
      v16 = &unk_1E6337B30;
      id v17 = v8;
      if ([v7 executeSQL:v9 error:a4 bindingHandler:&v13 enumerationHandler:0])
      {
        v18[0] = @"DROP TABLE medication_schedules;";
        v18[1] = @"ALTER TABLE medication_schedules_new RENAME TO medication_schedules;";
        v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 2, v13, v14, v15, v16);
        int64_t v11 = [v7 executeSQLStatements:v10 error:a4] ^ 1;
      }
      else
      {
        int64_t v11 = 1;
      }
    }
    else
    {
      int64_t v11 = 1;
    }
  }
  else
  {
    int64_t v11 = 1;
  }

  return v11;
}

uint64_t __123__HDHealthMedicationsPluginProtectedDatabaseSchema__sydney_addSyncIdentityToMedicationScheduleEntityWithTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) unsignedLongValue];
  return sqlite3_bind_int64(a2, 1, v3);
}

- (int64_t)_addCompatibilityVersionColumnsWithTransaction:(id)a3 error:(id *)a4
{
  id v5 = [a3 protectedDatabase];
  int64_t v6 = [v5 executeSQLStatements:&unk_1F17FC768 error:a4] ^ 1;

  return v6;
}

- (int64_t)_moveLifestyleFactorsFromUserDefaultsToKeyValueDomain:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  v23 = -[HDHealthMedicationsPluginProtectedDatabaseSchema _getLegacySyncIdentityWithTransaction:errorOut:](self, "_getLegacySyncIdentityWithTransaction:errorOut:");
  if (v23)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CB18]);
    id v7 = (void *)[v6 initWithSuiteName:*MEMORY[0x1E4F66A78]];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v8 = [&unk_1F17FC780 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(&unk_1F17FC780);
          }
          uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v7, "hk_keyExists:", v12, v23))
          {
            char v13 = [v7 BOOLForKey:v12];
            uint64_t v14 = [NSString stringWithFormat:@"INSERT OR REPLACE INTO key_value_secure (category, domain, key, value, provenance, sync_identity, mod_date) values (?, ?, ?, ?, ?, ?, ?)"];
            v15 = [v24 protectedDatabase];
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __112__HDHealthMedicationsPluginProtectedDatabaseSchema__moveLifestyleFactorsFromUserDefaultsToKeyValueDomain_error___block_invoke;
            v29[3] = &unk_1E6338148;
            v29[4] = v12;
            char v31 = v13;
            id v30 = v23;
            int v16 = [v15 executeSQL:v14 error:a4 bindingHandler:v29 enumerationHandler:0];

            if (!v16)
            {
              int64_t v21 = 1;
              goto LABEL_21;
            }
          }
        }
        uint64_t v9 = [&unk_1F17FC780 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v17 = objc_msgSend(&unk_1F17FC780, "countByEnumeratingWithState:objects:count:", &v25, v36, 16, v23);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(&unk_1F17FC780);
          }
          [v7 removeObjectForKey:*(void *)(*((void *)&v25 + 1) + 8 * j)];
        }
        uint64_t v18 = [&unk_1F17FC780 countByEnumeratingWithState:&v25 objects:v36 count:16];
      }
      while (v18);
    }
    int64_t v21 = 0;
LABEL_21:
  }
  else
  {
    int64_t v21 = 1;
  }

  return v21;
}

uint64_t __112__HDHealthMedicationsPluginProtectedDatabaseSchema__moveLifestyleFactorsFromUserDefaultsToKeyValueDomain_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 105);
  HDSQLiteBindStringToStatement();
  HDSQLiteBindStringToStatement();
  sqlite3_bind_int(a2, 4, *(unsigned __int8 *)(a1 + 48));
  sqlite3_bind_int(a2, 5, 0);
  sqlite3_bind_int64(a2, 6, [*(id *)(a1 + 40) unsignedLongValue]);
  double Current = CFAbsoluteTimeGetCurrent();
  return sqlite3_bind_double(a2, 7, Current);
}

- (int64_t)_addUniqueConstraintToScheduleMedicationIdentifier:(id)a3 error:(id *)a4
{
  v14[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _HDCalculateMedicationScheduleSyncAnchorOffset(v5, (uint64_t)a4);
  if (v6 < 0)
  {
    int64_t v12 = 1;
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = [NSString stringWithFormat:@"INSERT INTO medication_schedules_new (ROWID, uuid, medication_uuid, medication_identifier, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, creation_date, deleted, sync_provenance, sync_identity, minimum_compatibility_version, origin_compatibility_version, sync_anchor)     SELECT ROWID, uuid, medication_uuid, medication_identifier, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, max(creation_date), deleted, sync_provenance, sync_identity, minimum_compatibility_version, origin_compatibility_version, (ROWID + %lld)     FROM medication_schedules     WHERE deleted = 0     GROUP BY medication_identifier", v6];
    uint64_t v9 = [NSString stringWithFormat:@"INSERT INTO medication_schedules_new (ROWID, uuid, medication_uuid, medication_identifier, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, creation_date, deleted, sync_provenance, sync_identity, minimum_compatibility_version, origin_compatibility_version, sync_anchor)     SELECT ROWID, uuid, medication_uuid, null, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, creation_date, deleted, sync_provenance, sync_identity, minimum_compatibility_version, origin_compatibility_version, (ROWID + %lld)     FROM medication_schedules     WHERE deleted = 1", v7];
    uint64_t v10 = [v5 protectedDatabase];
    v14[0] = @"CREATE TABLE medication_schedules_new     (     ROWID                         INTEGER PRIMARY KEY AUTOINCREMENT,      uuid                          BLOB UNIQUE    NOT NULL,      medication_uuid               BLOB           NOT NULL,      medication_identifier         TEXT UNIQUE,      start_date_time               REAL           NOT NULL,      end_date_time                 REAL,      created_time_zone             TEXT           NOT NULL,      frequency_type                INTEGER        NOT NULL,      cycle_start_date_components   BLOB,      note                          TEXT,      creation_date                 REAL           NOT NULL,      deleted                       INTEGER        NOT NULL,      sync_provenance               INTEGER        NOT NULL,      sync_identity                 INTEGER        NOT NULL,      minimum_compatibility_version INTEGER        NOT NULL,      origin_compatibility_version  INTEGER        NOT NULL,      sync_anchor                   INTEGER UNIQUE NOT NULL     )";
    v14[1] = v8;
    v14[2] = v9;
    v14[3] = @"DELETE                      FROM medication_schedule_interval_data                      WHERE NOT EXISTS(SELECT *                      FROM medication_schedules_new                      WHERE medication_schedule_interval_data.schedule_id = medication_schedules_new.ROWID)";
    v14[4] = @"DROP TABLE medication_schedules";
    void v14[5] = @"ALTER TABLE medication_schedules_new RENAME TO medication_schedules";
    int64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:6];
    int64_t v12 = [v10 executeSQLStatements:v11 error:a4] ^ 1;
  }
  return v12;
}

- (int64_t)_addScheduleTypeToMedicationScheduleTable:(id)a3 error:(id *)a4
{
  id v5 = [a3 protectedDatabase];
  int64_t v6 = [v5 executeSQLStatements:&unk_1F17FC798 error:a4] ^ 1;

  return v6;
}

- (int64_t)_addDisplayOptionsToMedicationScheduleTable:(id)a3 error:(id *)a4
{
  id v5 = [a3 protectedDatabase];
  int64_t v6 = [v5 executeSQLStatements:&unk_1F17FC7B0 error:a4] ^ 1;

  return v6;
}

- (int64_t)_createMedicationDismissedPregnancyLactationInteractionsTableWithTransaction:(id)a3 error:(id *)a4
{
  id v5 = [a3 protectedDatabase];
  int64_t v6 = [v5 executeSQLStatements:&unk_1F17FC7C8 error:a4] ^ 1;

  return v6;
}

- (int64_t)_createRemoteScheduleUnavailableRecordsTableWithTransaction:(id)a3 error:(id *)a4
{
  id v5 = [a3 protectedDatabase];
  int64_t v6 = [v5 executeSQLStatements:&unk_1F17FC7E0 error:a4] ^ 1;

  return v6;
}

- (int64_t)_setInvalidSchedulesAsLocallyIncompatibleWithMaximumIntegerValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = _HDCalculateMedicationScheduleSyncAnchorOffset(v5, (uint64_t)a4);
  if (v6 < 0) {
    goto LABEL_4;
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v5 protectedDatabase];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __123__HDHealthMedicationsPluginProtectedDatabaseSchema__setInvalidSchedulesAsLocallyIncompatibleWithMaximumIntegerValue_error___block_invoke;
  v20[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = v7;
  int v9 = [v8 executeSQL:@"UPDATE medication_schedules SET schedule_type = frequency_type, sync_anchor = (sync_anchor + ?) WHERE schedule_type = 0 AND frequency_type != 0", a4, v20, 0 error bindingHandler enumerationHandler];

  if (!v9)
  {
LABEL_4:
    int64_t v15 = 1;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    int64_t v11 = [v10 name];

    int64_t v12 = [v5 protectedDatabase];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __123__HDHealthMedicationsPluginProtectedDatabaseSchema__setInvalidSchedulesAsLocallyIncompatibleWithMaximumIntegerValue_error___block_invoke_2;
    v17[3] = &unk_1E6338170;
    id v18 = v11;
    uint64_t v19 = v7;
    id v13 = v11;
    int v14 = [v12 executeSQL:@"INSERT OR REPLACE INTO medication_schedules (uuid, medication_uuid, medication_identifier, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, creation_date, deleted, sync_provenance, sync_identity, minimum_compatibility_version, origin_compatibility_version, schedule_type, display_options, sync_anchor) SELECT uuid, medication_uuid, medication_identifier, 0.0, NULL, ?, 0, NULL, NULL, creation_date, deleted, sync_provenance, sync_identity, ?, ?, 0, 0, (sync_anchor + ?) FROM medication_schedules WHERE schedule_type = 0 AND frequency_type = 0 AND minimum_compatibility_version <= origin_compatibility_version AND deleted = 0", a4, v17, 0 error bindingHandler enumerationHandler];

    int64_t v15 = v14 ^ 1u;
  }

  return v15;
}

uint64_t __123__HDHealthMedicationsPluginProtectedDatabaseSchema__setInvalidSchedulesAsLocallyIncompatibleWithMaximumIntegerValue_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __123__HDHealthMedicationsPluginProtectedDatabaseSchema__setInvalidSchedulesAsLocallyIncompatibleWithMaximumIntegerValue_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindStringToStatement();
  sqlite3_bind_int64(a2, 2, 0x7FFFFFFFLL);
  sqlite3_bind_int64(a2, 3, 1);
  sqlite3_int64 v4 = *(void *)(a1 + 40);
  return sqlite3_bind_int64(a2, 4, v4);
}

@end