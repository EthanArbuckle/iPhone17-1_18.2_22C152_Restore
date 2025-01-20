@interface HDDatabaseMigrator
- (BOOL)executeSQL:(id)a3 error:(id *)a4;
- (BOOL)executeSQLStatements:(id)a3 error:(id *)a4;
- (HDDatabaseMigrationTransaction)transaction;
- (HDDatabaseMigrator)init;
- (HDDatabaseMigrator)initWithTransaction:(id)a3;
- (HDDatabaseSchemaManager)schemaManager;
- (_HKBehavior)behavior;
- (id)boulderProtectedMigrationSteps;
- (id)boulderUnprotectedMigrationSteps;
- (id)butlerProtectedMigrationSteps;
- (id)butlerUnprotectedMigrationSteps;
- (id)cinarProtectedMigrationSteps;
- (id)cinarUnprotectedMigrationSteps;
- (id)corryProtectedMigrationSteps;
- (id)corryUnprotectedMigrationSteps;
- (id)eagleProtectedMigrationSteps;
- (id)eagleUnprotectedMigrationSteps;
- (id)emetProtectedMigrationSteps;
- (id)emetUnprotectedMigrationSteps;
- (id)erieProtectedMigrationSteps;
- (id)erieUnprotectedMigrationSteps;
- (id)monarchProtectedMigrationSteps;
- (id)monarchUnprotectedMigrationSteps;
- (id)okemoZursProtectedMigrationSteps;
- (id)okemoZursUnprotectedMigrationSteps;
- (id)tigrisProtectedMigrationSteps;
- (id)tigrisUnprotectedMigrationSteps;
- (id)whitetailProtectedMigrationSteps;
- (id)whitetailUnprotectedMigrationSteps;
- (int64_t)_corry_rewriteHFDStep1WithError:(id *)a3;
- (int64_t)_corry_rewriteHFDStep2WithError:(id *)a3;
- (int64_t)migrateFromVersion:(int64_t)a3 toVersion:(int64_t)a4 error:(id *)a5;
- (int64_t)performHFDMigrationToVersion:(int64_t)a3 handler:(id)a4 error:(id *)a5;
- (uint64_t)_deleteDatabaseStatusForVersion:(uint64_t)a1 errorMessage:(uint64_t)a2 error:(uint64_t)a3;
- (uint64_t)_migrateKeyValueColumnsFromStringToText:(uint64_t)a3 error:;
- (uint64_t)_recreateMedicalRecordTable:(void *)a3 intermediateTables:(void *)a4 creationSQL:(uint64_t)a5 error:;
- (uint64_t)_renameKeyValueSyncStoreColumnInProtectedDabase:(uint64_t)a3 error:;
- (uint64_t)_updateDataCollectorKeyValueContextWithObject:(void *)a3 domain:(uint64_t)a4 error:;
- (uint64_t)_updateKeyValueEntityUniquenessWithProtectedDatabase:(uint64_t)a3 error:;
- (unint64_t)fetchLegacySyncIdentity:(id)a3 error:(id *)a4;
- (void)addLockstepMigrationForSchema:(id)a3 toVersion:(int64_t)a4 requiringVersion:(int64_t)a5 foreignKeyStatus:(int64_t)a6 handler:(id)a7;
- (void)addMigrationForSchema:(id)a3 toVersion:(int64_t)a4 foreignKeyStatus:(int64_t)a5 handler:(id)a6;
- (void)addMigrationSteps:(id)a3;
- (void)addMigrationTo:(int64_t)a3 foreignKeys:(int64_t)a4 handler:(id)a5;
- (void)addMigrationTo:(int64_t)a3 function:(void *)a4;
- (void)addMigrationTo:(int64_t)a3 function:(void *)a4 foreignKeys:(int64_t)a5;
- (void)addPrimaryMigrationSteps;
- (void)azul_addProtectedMigrationSteps;
- (void)azul_addUnprotectedMigrationSteps;
- (void)crystal_addProtectedMigrationSteps;
- (void)crystal_addUnprotectedMigrationSteps;
- (void)dawn_addProtectedMigrationSteps;
- (void)dawn_addUnprotectedMigrationSteps;
- (void)future_addProtectedMigrationSteps;
- (void)future_addUnprotectedMigrationSteps;
- (void)invalidate;
- (void)peace_addProtectedMigrationSteps;
- (void)peace_addUnprotectedMigrationSteps;
- (void)sky_addProtectedMigrationSteps;
- (void)sky_addUnprotectedMigrationSteps;
- (void)sydney_addProtectedMigrationSteps;
- (void)sydney_addUnprotectedMigrationSteps;
- (void)yukon_addProtectedMigrationSteps;
- (void)yukon_addUnprotectedMigrationSteps;
@end

@implementation HDDatabaseMigrator

- (id)whitetailUnprotectedMigrationSteps
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__HDDatabaseMigrator_Whitetail__whitetailUnprotectedMigrationSteps__block_invoke;
  v6[3] = &unk_1E62F5250;
  v6[4] = self;
  v4 = HDCreateMigrationStep(9203, 10001, (uint64_t)v6);
  [v3 addObject:v4];

  return v3;
}

void *__67__HDDatabaseMigrator_Whitetail__whitetailUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"INSERT INTO key_value (category, provenance, domain, key, value, mod_date) SELECT category, provenance, 'BASAL_ENERGY_INGESTION', key, value, mod_date FROM key_value WHERE domain = 'ACTIVE_ENERGY_INGESTION'", a3 error] ^ 1);
  }
  return result;
}

- (id)whitetailProtectedMigrationSteps
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke;
  v68[3] = &unk_1E62F5250;
  v68[4] = self;
  v4 = HDCreateMigrationStep(9210, 10002, (uint64_t)v68);
  [v3 addObject:v4];

  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_2;
  v67[3] = &unk_1E62F5250;
  v67[4] = self;
  v5 = HDCreateMigrationStep(10002, 10003, (uint64_t)v67);
  [v3 addObject:v5];

  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_3;
  v66[3] = &unk_1E62F5250;
  v66[4] = self;
  v6 = HDCreateMigrationStep(10003, 10004, (uint64_t)v66);
  [v3 addObject:v6];

  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_4;
  v65[3] = &unk_1E62F5250;
  v65[4] = self;
  v7 = HDCreateMigrationStep(10004, 10005, (uint64_t)v65);
  [v3 addObject:v7];

  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_5;
  v64[3] = &unk_1E62F5250;
  v64[4] = self;
  v8 = HDCreateMigrationStep(10005, 10006, (uint64_t)v64);
  [v3 addObject:v8];

  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_6;
  v63[3] = &unk_1E62F5250;
  v63[4] = self;
  v9 = HDCreateMigrationStep(10006, 10007, (uint64_t)v63);
  [v3 addObject:v9];

  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_7;
  v62[3] = &unk_1E62F5250;
  v62[4] = self;
  v10 = HDCreateMigrationStep(10007, 10009, (uint64_t)v62);
  [v3 addObject:v10];

  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_8;
  v61[3] = &unk_1E62F5250;
  v61[4] = self;
  v11 = HDCreateMigrationStep(10009, 10010, (uint64_t)v61);
  [v3 addObject:v11];

  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_9;
  v60[3] = &unk_1E62F5250;
  v60[4] = self;
  v12 = HDCreateMigrationStep(10010, 10011, (uint64_t)v60);
  [v3 addObject:v12];

  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_10;
  v59[3] = &unk_1E62F5250;
  v59[4] = self;
  v13 = HDCreateMigrationStep(10011, 10012, (uint64_t)v59);
  [v3 addObject:v13];

  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_11;
  v58[3] = &unk_1E62F5250;
  v58[4] = self;
  v14 = HDCreateMigrationStep(10012, 10013, (uint64_t)v58);
  [v3 addObject:v14];

  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_12;
  v57[3] = &unk_1E62F5250;
  v57[4] = self;
  v15 = HDCreateMigrationStep(10013, 10014, (uint64_t)v57);
  [v3 addObject:v15];

  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_13;
  v56[3] = &unk_1E62F5250;
  v56[4] = self;
  v16 = HDCreateMigrationStep(10014, 10015, (uint64_t)v56);
  [v3 addObject:v16];

  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_14;
  v55[3] = &unk_1E62F5250;
  v55[4] = self;
  v17 = HDCreateMigrationStep(10015, 10016, (uint64_t)v55);
  [v3 addObject:v17];

  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_15;
  v54[3] = &unk_1E62F5250;
  v54[4] = self;
  v18 = HDCreateMigrationStep(10016, 10017, (uint64_t)v54);
  [v3 addObject:v18];

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_16;
  v53[3] = &unk_1E62F5250;
  v53[4] = self;
  v19 = HDCreateMigrationStep(10017, 10018, (uint64_t)v53);
  [v3 addObject:v19];

  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_17;
  v52[3] = &unk_1E62F5250;
  v52[4] = self;
  v20 = HDCreateMigrationStep(10018, 10019, (uint64_t)v52);
  [v3 addObject:v20];

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_18;
  v51[3] = &unk_1E62F5250;
  v51[4] = self;
  v21 = HDCreateMigrationStep(10019, 10021, (uint64_t)v51);
  [v3 addObject:v21];

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_19;
  v50[3] = &unk_1E62F5250;
  v50[4] = self;
  v22 = HDCreateMigrationStep(10021, 10022, (uint64_t)v50);
  [v3 addObject:v22];

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_20;
  v49[3] = &unk_1E62F5250;
  v49[4] = self;
  v23 = HDCreateMigrationStep(10022, 10023, (uint64_t)v49);
  [v3 addObject:v23];

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_21;
  v48[3] = &unk_1E62F5250;
  v48[4] = self;
  v24 = HDCreateMigrationStep(10023, 10025, (uint64_t)v48);
  [v3 addObject:v24];

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_22;
  v47[3] = &unk_1E62F5250;
  v47[4] = self;
  v25 = +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:10025 to:10027 handler:v47];
  [v3 addObject:v25];

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_23;
  v46[3] = &unk_1E62F5250;
  v46[4] = self;
  v26 = HDCreateMigrationStep(10027, 10028, (uint64_t)v46);
  [v3 addObject:v26];

  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_24;
  v45[3] = &unk_1E62F5250;
  v45[4] = self;
  v27 = HDCreateMigrationStep(10028, 10029, (uint64_t)v45);
  [v3 addObject:v27];

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_25;
  v44[3] = &unk_1E62F5250;
  v44[4] = self;
  v28 = HDCreateMigrationStep(10029, 10030, (uint64_t)v44);
  [v3 addObject:v28];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_26;
  v43[3] = &unk_1E62F5250;
  v43[4] = self;
  v29 = HDCreateMigrationStep(10030, 10031, (uint64_t)v43);
  [v3 addObject:v29];

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_27;
  v42[3] = &unk_1E62F5250;
  v42[4] = self;
  v30 = HDCreateMigrationStep(10031, 10032, (uint64_t)v42);
  [v3 addObject:v30];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_28;
  v41[3] = &unk_1E62F5250;
  v41[4] = self;
  v31 = HDCreateMigrationStep(10032, 10033, (uint64_t)v41);
  [v3 addObject:v31];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_29;
  v40[3] = &unk_1E62F5250;
  v40[4] = self;
  v32 = HDCreateMigrationStep(10033, 10034, (uint64_t)v40);
  [v3 addObject:v32];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_30;
  v39[3] = &unk_1E62F5250;
  v39[4] = self;
  v33 = HDCreateMigrationStep(10034, 10035, (uint64_t)v39);
  [v3 addObject:v33];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_31;
  v38[3] = &unk_1E62F5250;
  v38[4] = self;
  v34 = HDCreateMigrationStep(10035, 10036, (uint64_t)v38);
  [v3 addObject:v34];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_32;
  v37[3] = &unk_1E62F5250;
  v37[4] = self;
  v35 = HDCreateMigrationStep(10036, 10037, (uint64_t)v37);
  [v3 addObject:v35];

  return v3;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v7[0] = @"CREATE TABLE fitness_friend_activity_snapshots (active_hours REAL, active_hours_goal REAL, brisk_minutes_goal REAL, friend_uuid BLOB, workout_data BLOB, achievement_data BLOB, energy_burned REAL, walk_run_distance REAL, energy_burned_goal REAL, data_id INTEGER PRIMARY KEY, deep_breathing_session_count INTEGER, brisk_minutes REAL, uploaded_date REAL, steps INTEGER, snapshot_index INTEGER, source_uuid BLOB)";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  LODWORD(a3) = [v3 executeSQLStatements:v5 error:a3];

  return a3 ^ 1;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [&unk_1F17E90D8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(&unk_1F17E90D8);
        }
        objc_msgSend(NSString, "stringWithFormat:", @"ALTER TABLE activity_caches ADD COLUMN %@ INTEGER;",
        v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8));
        [v5 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [&unk_1F17E90D8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  int v10 = [v3 executeSQLStatements:v5 error:a3];

  return v10 ^ 1u;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v7[0] = @"CREATE TABLE ccdas (data_id INTEGER PRIMARY KEY REFERENCES samples (data_id) ON DELETE CASCADE, document_data BLOB, title TEXT NOT NULL, patient_name TEXT NOT NULL, author_name TEXT NOT NULL, custodian_name TEXT NOT NULL);";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  LODWORD(a3) = [v3 executeSQLStatements:v5 error:a3];

  return a3 ^ 1;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQLStatements:&unk_1F17E90F0 error:a3] ^ 1);
  }
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v7[0] = @"ALTER TABLE metadata_values ADD COLUMN value_type INTEGER NOT NULL DEFAULT 0;";
  v7[1] = @"UPDATE metadata_values SET value_type = (CASE WHEN metadata_values.string_value IS NOT NULL THEN 0 WHEN metadata_values.numerical_value IS NOT NULL THEN 1 WHEN metadata_values.date_value IS NOT NULL THEN 2 END);";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  LODWORD(a3) = [v3 executeSQLStatements:v5 error:a3];

  return a3 ^ 1;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = [MEMORY[0x1E4F1CA48] array];
  [v5 addObject:@"DROP TABLE data_series;"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS data_series (data_id INTEGER PRIMARY KEY REFERENCES samples(data_id) ON DELETE CASCADE, frozen INTEGER NOT NULL DEFAULT 0, count INTEGER NOT NULL DEFAULT 0)"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"ALTER TABLE fitness_friend_activity_snapshots ADD COLUMN vulcan_count INTEGER;",
  }
                                    a3) ^ 1);
  return result;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"ALTER TABLE activity_caches ADD COLUMN vulcan_condition INTEGER;",
  }
                                    a3) ^ 1);
  return result;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"ALTER TABLE fitness_friend_activity_snapshots ADD COLUMN vulcan_condition INTEGER;",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = [MEMORY[0x1E4F1CA48] array];
  [v5 addObject:@"DROP TABLE fitness_friend_activity_snapshots;"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS fitness_friend_activity_snapshots (data_id INTEGER PRIMARY KEY, friend_uuid BLOB, snapshot_index INTEGER, source_uuid BLOB, energy_burned REAL, brisk_minutes REAL, active_hours REAL, steps REAL, vulcan_count REAL, energy_burned_goal REAL, brisk_minutes_goal REAL, active_hours_goal REAL, walk_run_distance REAL, vulcan_condition INTEGER, uploaded_date REAL)"];
  [v5 addObject:@"CREATE TABLE fitness_friend_workouts (data_id INTEGER PRIMARY KEY, friend_uuid BLOB, duration REAL, total_energy_burned REAL, total_basal_energy_burned REAL, total_distance REAL, activity_type INTEGER, goal_type INTEGER, goal REAL)"];
  [v5 addObject:@"CREATE TABLE fitness_friend_achievements (data_id INTEGER PRIMARY KEY, friend_uuid BLOB, definition_identifier TEXT, completed_date REAL, value, extra_data BLOB, workout_activity_type INTEGER)"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE activity_caches RENAME TO activity_caches_old"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS activity_caches (data_id INTEGER PRIMARY KEY, cache_index INTEGER, energy_burned REAL, brisk_minutes REAL, active_hours REAL, steps REAL, vulcan_count REAL, vulcan_condition INTEGER, energy_burned_goal REAL, energy_burned_goal_date REAL, brisk_minutes_goal REAL, active_hours_goal REAL, walk_distance REAL, deep_breathing_duration REAL, active_energy_burned_anchor INTEGER, active_hours_anchor INTEGER, brisk_minutes_anchor INTEGER, energy_burned_goal_anchor INTEGER, step_count_anchor INTEGER, vulcan_count_anchor INTEGER, walking_and_running_distance_anchor INTEGER, workout_anchor INTEGER, deep_breathing_session_anchor INTEGER, flights INTEGER, flights_anchor INTEGER)"];
  [v5 addObject:@"INSERT INTO activity_caches (data_id, cache_index, energy_burned, brisk_minutes, active_hours, steps, vulcan_count, vulcan_condition, energy_burned_goal, energy_burned_goal_date, brisk_minutes_goal, active_hours_goal, walk_distance, active_energy_burned_anchor, active_hours_anchor, brisk_minutes_anchor, energy_burned_goal_anchor, step_count_anchor, vulcan_count_anchor, walking_and_running_distance_anchor, workout_anchor, flights, flights_anchor) SELECT data_id, cache_index, energy_burned, brisk_minutes, active_hours, steps, vulcan_count, vulcan_condition, energy_burned_goal, energy_burned_goal_date, brisk_minutes_goal, active_hours_goal, walk_distance, active_energy_burned_anchor, active_hours_anchor, brisk_minutes_anchor, energy_burned_goal_anchor, step_count_anchor, vulcan_count_anchor, walking_and_running_distance_anchor, workout_anchor, flights, flights_anchor from activity_caches_old;"];
  [v5 addObject:@"DROP TABLE activity_caches_old"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"CREATE TABLE object_authorizations (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, object BLOB NOT NULL REFERENCES objects(uuid) ON DELETE CASCADE, source BLOB NOT NULL, status INTEGER NOT NULL, sync_provenance INTEGER NOT NULL, modification_date REAL NOT NULL)", a3 error] ^ 1);
  }
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = [MEMORY[0x1E4F1CA48] array];
  [v5 addObject:@"DROP TABLE fitness_friend_workouts"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS fitness_friend_workouts (data_id INTEGER PRIMARY KEY, friend_uuid BLOB, duration REAL, total_energy_burned REAL, total_basal_energy_burned REAL, total_distance REAL, activity_type INTEGER, goal_type INTEGER, goal REAL, bundle_id TEXT, source_first_party_workout_app INTEGER)"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE workouts ADD COLUMN total_w_steps REAL;"];
  [v5 addObject:@"ALTER TABLE workout_events ADD COLUMN w_step_style INTEGER;"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"ALTER TABLE fitness_friend_activity_snapshots ADD COLUMN timezone_offset INTEGER;",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  id v5 = [v3 transaction];
  uint64_t v6 = [v5 protectedDatabase];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__HDDatabaseMigrator_Whitetail___addMaxObjectPersistentIDToKeyValueStoreWithError___block_invoke;
  v16[3] = &unk_1E62F5278;
  v16[4] = v17;
  char v7 = [v6 executeUncachedSQL:@"SELECT MAX(data_id) FROM objects" error:a3 bindingHandler:0 enumerationHandler:v16];

  if ((v7 & 1) == 0
    || ([v3 transaction],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v3 fetchLegacySyncIdentity:v8 error:a3],
        v8,
        v9 == -1))
  {
    uint64_t v13 = 1;
  }
  else
  {
    int v10 = [v3 transaction];
    v11 = [v10 unprotectedDatabase];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __83__HDDatabaseMigrator_Whitetail___addMaxObjectPersistentIDToKeyValueStoreWithError___block_invoke_2;
    v15[3] = &unk_1E62F52A0;
    v15[4] = v17;
    v15[5] = v9;
    int v12 = [v11 executeUncachedSQL:@"INSERT OR REPLACE INTO key_value (category, domain, key, value, provenance, mod_date, sync_identity) values (0, '', 'HDMaxObjectPersistentID', ?, 0, 0.0, ?)", a3, v15, 0 error bindingHandler enumerationHandler];

    uint64_t v13 = v12 ^ 1u;
  }
  _Block_object_dispose(v17, 8);
  return v13;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"UPDATE OR IGNORE data_provenances SET origin_device='Watch0,0' WHERE origin_build LIKE '12S%' OR origin_build LIKE '13S%' OR origin_build LIKE '13V%' OR origin_build LIKE '14S%'"];
  [v5 addObject:@"UPDATE OR IGNORE data_provenances SET local_device='Watch0,0' WHERE local_build LIKE '12S%' OR local_build LIKE '13S%' OR local_build LIKE '13V%' OR local_build LIKE '14S%'"];
  [v5 addObject:@"UPDATE OR IGNORE data_provenances SET origin_device='iPhone0,0' WHERE (origin_build LIKE '12%' OR origin_build LIKE '13%' OR origin_build LIKE '14%') AND origin_device NOT LIKE 'Watch%'"];
  [v5 addObject:@"UPDATE OR IGNORE data_provenances SET local_device='iPhone0,0' WHERE (origin_build LIKE '12%' OR origin_build LIKE '13%' OR origin_build LIKE '14%') AND local_device NOT LIKE 'Watch%'"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = [MEMORY[0x1E4F1CA48] array];
  [v5 addObject:@"DROP TABLE fitness_friend_workouts"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS fitness_friend_workouts (data_id INTEGER PRIMARY KEY, friend_uuid BLOB, duration REAL, total_energy_burned REAL, total_basal_energy_burned REAL, total_distance REAL, activity_type INTEGER, goal_type INTEGER, goal REAL, bundle_id TEXT, is_watch_workout INTEGER)"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"UPDATE OR IGNORE data_provenances SET origin_device='Watch0,0' WHERE origin_device='iPhone0,0' AND (origin_build LIKE '12S%' OR origin_build LIKE '13S%' OR origin_build LIKE '13V%' OR origin_build LIKE '14S%')"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__15;
  v24 = __Block_byref_object_dispose__15;
  id v25 = 0;
  id v5 = [v3 transaction];
  uint64_t v6 = [v5 protectedDatabase];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__HDDatabaseMigrator_Whitetail___migrateStoredDateOfBirthTimeZoneWithError___block_invoke;
  v19[3] = &unk_1E62F5278;
  v19[4] = &v20;
  int v7 = [v6 executeUncachedSQL:@"SELECT value FROM key_value_secure WHERE key = 'birthdate'" error:a3 bindingHandler:0 enumerationHandler:v19];

  if (v21[5])
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    uint64_t v9 = objc_msgSend(v8, "hk_dateOfBirthDateComponentsWithDate:", v21[5]);

    int v10 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithUTCTimeZone");
    v11 = [v10 dateFromComponents:v9];

    int v12 = [v3 transaction];
    uint64_t v13 = [v12 protectedDatabase];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__HDDatabaseMigrator_Whitetail___migrateStoredDateOfBirthTimeZoneWithError___block_invoke_2;
    v17[3] = &unk_1E62F52C8;
    id v14 = v11;
    id v18 = v14;
    int v7 = [v13 executeUncachedSQL:@"UPDATE key_value_secure SET value = ? WHERE key = 'birthdate'" error:a3 bindingHandler:v17 enumerationHandler:0];
  }
  uint64_t v15 = v7 ^ 1u;
  _Block_object_dispose(&v20, 8);

  return v15;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"DELETE FROM objects WHERE NOT EXISTS (SELECT samples.data_id FROM samples WHERE samples.data_id=objects.data_id);",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE data_provenances RENAME TO data_provenances_old"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS data_provenances (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, sync_provenance INTEGER NOT NULL, origin_product_type TEXT NOT NULL, origin_build TEXT NOT NULL, local_product_type TEXT NOT NULL, local_build TEXT NOT NULL, source_id INTEGER NOT NULL, device_id INTEGER NOT NULL, source_version TEXT NOT NULL, tz_name TEXT NOT NULL, UNIQUE(sync_provenance, origin_product_type, origin_build, local_product_type, local_build, source_id, device_id, source_version, tz_name))"];
  [v5 addObject:@"INSERT INTO data_provenances (rowid, sync_provenance, origin_product_type, origin_build, local_product_type, local_build, source_id, device_id, source_version, tz_name) SELECT rowid, sync_provenance, origin_device, origin_build, local_device, local_build, source_id, device_id, source_version, '' FROM data_provenances_old;"];
  [v5 addObject:@"DROP TABLE IF EXISTS data_provenances_old"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"CREATE UNIQUE INDEX ff_unique_columns ON fitness_friend_activity_snapshots (friend_uuid, snapshot_index, source_uuid);",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v7[0] = @"DELETE FROM key_value_secure WHERE domain = 'com.apple.healthd.workout' AND key = 'companionWorkoutCreditAnchorKey';";
  v7[1] = @"INSERT OR REPLACE INTO key_value_secure (category, domain, key, value, provenance, mod_date) values (100, 'com.apple.healthd.workout', 'companionWorkoutCreditAnchorKey', COALESCE((select max(data_id) from objects), 0), 0, 0.0);";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  LODWORD(a3) = [v3 executeSQLStatements:v5 error:a3];

  return a3 ^ 1;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"ALTER TABLE data_series ADD COLUMN insertion_era INTEGER NOT NULL DEFAULT 0" error:a3] ^ 1);
  }
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_26(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS cda_documents (data_id INTEGER PRIMARY KEY REFERENCES samples (data_id) ON DELETE CASCADE, document_data BLOB, title TEXT NOT NULL, patient_name TEXT NOT NULL, author_name TEXT NOT NULL, custodian_name TEXT NOT NULL);"];
  [v5 addObject:@"INSERT INTO cda_documents SELECT * FROM ccdas;"];
  [v5 addObject:@"DROP TABLE IF EXISTS ccdas;"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_27(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __69__HDDatabaseMigrator_Whitetail___addFieldsToLocationSeriesWithError___block_invoke;
    v4[3] = &unk_1E62F52F0;
    v4[4] = result;
    return (void *)[result performHFDMigrationToVersion:10032 handler:v4 error:a3];
  }
  return result;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"CREATE INDEX IF NOT EXISTS samples_type_dates ON samples (data_type, start_date, end_date);"];
  [v5 addObject:@"CREATE INDEX IF NOT EXISTS samples_end ON samples (data_type, end_date);"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_29(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = [MEMORY[0x1E4F1CA48] array];
  [v5 addObject:@"DROP TABLE fitness_friend_workouts"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS fitness_friend_workouts (data_id INTEGER PRIMARY KEY, friend_uuid BLOB, duration REAL, total_energy_burned REAL, total_basal_energy_burned REAL, total_distance REAL, activity_type INTEGER, goal_type INTEGER, goal REAL, bundle_id TEXT, is_watch_workout INTEGER, is_indoor_workout INTEGER)"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"CREATE INDEX IF NOT EXISTS samples_type_anchor ON samples (data_type, data_id);"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_31()
{
  return 0;
}

uint64_t __65__HDDatabaseMigrator_Whitetail__whitetailProtectedMigrationSteps__block_invoke_32(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v6 = (void *)[v5 initWithSuiteName:*MEMORY[0x1E4F2BC90]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v7 = objc_msgSend(v6, "dictionaryRepresentation", 0);
  uint64_t v8 = [v7 allKeys];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        [v6 removeObjectForKey:*(void *)(*((void *)&v16 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [v6 synchronize];
  int v12 = [v3 transaction];
  uint64_t v13 = [v12 unprotectedDatabase];
  int v14 = [v13 executeSQLStatements:&unk_1F17E9108 error:a3];

  return v14 ^ 1u;
}

uint64_t __83__HDDatabaseMigrator_Whitetail___addMaxObjectPersistentIDToKeyValueStoreWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __83__HDDatabaseMigrator_Whitetail___addMaxObjectPersistentIDToKeyValueStoreWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  v4 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_int64 v5 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v5);
}

uint64_t __76__HDDatabaseMigrator_Whitetail___migrateStoredDateOfBirthTimeZoneWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F30](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  sqlite3_int64 v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

uint64_t __76__HDDatabaseMigrator_Whitetail___migrateStoredDateOfBirthTimeZoneWithError___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __69__HDDatabaseMigrator_Whitetail___addFieldsToLocationSeriesWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a3;
  uint64_t v8 = a2;
  uint64_t v4 = a1 + 32;
  sqlite3_int64 v5 = operator new(0x20uLL);
  void *v5 = &unk_1F171BA18;
  v5[1] = v4;
  v5[2] = &v7;
  v5[3] = &v8;
  v9[3] = v5;
  LODWORD(v3) = health::DataStore::performWriteTransactionWithLambda(v3, (uint64_t)v9);
  std::__function::__value_func<BOOL ()(health::DataStore::WriteTransaction &)>::~__value_func[abi:ne180100](v9);
  return v3 ^ 1;
}

- (void)yukon_addUnprotectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:13000 function:_HDAddFrozenAndExpectedSyncAnchorColumns];
  [(HDDatabaseMigrator *)self addMigrationTo:13001 function:_HDAddSyncAnchorUpdateDateColumns];
  [(HDDatabaseMigrator *)self addMigrationTo:13002 function:_HDAddUniqueConstraintToSessionControllersTable];
  [(HDDatabaseMigrator *)self addMigrationTo:13003 function:_HDAddAlarmEventsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:13004 function:_HDAddSourceOwnerBundleIdentifierAndDropSyncPrimary foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:13005 function:_HDAddSourceOrderModificationDate];
  [(HDDatabaseMigrator *)self addMigrationTo:13006 function:_HDAddLatestActivityDateToWorkoutSessionsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:13007 function:_HDResetReceivedAnchorsForCategoryAndQuantitySamples];

  [(HDDatabaseMigrator *)self addMigrationTo:13008 function:_HDAddEventOptionsToAlarmEventsTable];
}

- (void)yukon_addProtectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:13000 function:_HDAddQuantitySampleStatisticsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:13001 function:_HDAddMenstrualCycleDaySummaryTable];
  [(HDDatabaseMigrator *)self addMigrationTo:13002 function:_HDUpdateActivityCacheTableForYukon];
  [(HDDatabaseMigrator *)self addMigrationTo:13003 function:_HDAddConceptIndexTable];
  [(HDDatabaseMigrator *)self addMigrationTo:13004 function:_HDRemoveDuplicatedHeartRateContextMetadata];
  [(HDDatabaseMigrator *)self addMigrationTo:13005 function:_HDAddLocaleToMedicalRecords];
  [(HDDatabaseMigrator *)self addMigrationTo:13006 function:_HDUpdateFitnessFriendActivitySnapshotsTableForYukon];
  [(HDDatabaseMigrator *)self addMigrationTo:13007 function:_HDUpdateDiagnosticTestReportColumnNames];
  [(HDDatabaseMigrator *)self addMigrationTo:13008 function:_HDUpdateFitnessFriendWorkoutTableForYukon];
  [(HDDatabaseMigrator *)self addMigrationTo:13009 function:_HDUpdateConceptIndexTable];
  [(HDDatabaseMigrator *)self addMigrationTo:13010 function:_HDUpdateVaccinationRecordColumnNames];
  [(HDDatabaseMigrator *)self addMigrationTo:13011 function:_HDMoveClinicalCredentialsToKeychain foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:13012 function:_HDRemoveMenstrualCycleDaySummaryTable];
  [(HDDatabaseMigrator *)self addMigrationTo:13013 function:_HDAddAllergyIntoleranceStatus];
  [(HDDatabaseMigrator *)self addMigrationTo:13014 function:_HDResetClinicalAccountEntityLastSubmittedRow];
  [(HDDatabaseMigrator *)self addMigrationTo:13015 function:_HDAddOntologyVersionToConceptIndex];
  [(HDDatabaseMigrator *)self addMigrationTo:13200 function:_HDAddDerivedFlagsToDataProvenances foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:13400 function:_HDAddCountryToMedicalRecord];
  [(HDDatabaseMigrator *)self addMigrationTo:13401 function:_HDAddMedicalRecordState];

  [(HDDatabaseMigrator *)self addMigrationTo:13402 function:_HDWipeWorkoutAnchors];
}

- (id)monarchUnprotectedMigrationSteps
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke;
  v20[3] = &unk_1E62FB708;
  v20[4] = self;
  uint64_t v4 = +[HDDatabaseMigrationStep migrationStepFrom:8114 to:9000 handler:v20];
  [v3 addObject:v4];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_2;
  v19[3] = &unk_1E62FB708;
  v19[4] = self;
  sqlite3_int64 v5 = +[HDDatabaseMigrationStep migrationStepFrom:9000 to:9001 handler:v19];
  [v3 addObject:v5];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_3;
  v18[3] = &unk_1E62FB708;
  v18[4] = self;
  uint64_t v6 = +[HDDatabaseMigrationStep migrationStepFrom:9001 to:9002 handler:v18];
  [v3 addObject:v6];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_4;
  v17[3] = &unk_1E62FB708;
  void v17[4] = self;
  uint64_t v7 = +[HDDatabaseMigrationStep migrationStepFrom:9002 to:9003 handler:v17];
  [v3 addObject:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_5;
  v16[3] = &unk_1E62FB708;
  v16[4] = self;
  uint64_t v8 = +[HDDatabaseMigrationStep migrationStepFrom:9003 to:9004 handler:v16];
  [v3 addObject:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_6;
  v15[3] = &unk_1E62FB708;
  v15[4] = self;
  uint64_t v9 = +[HDDatabaseMigrationStep migrationStepFrom:9004 to:9005 handler:v15];
  [v3 addObject:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_7;
  v14[3] = &unk_1E62FB708;
  v14[4] = self;
  uint64_t v10 = +[HDDatabaseMigrationStep migrationStepFrom:9005 to:9006 handler:v14];
  [v3 addObject:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_8;
  v13[3] = &unk_1E62FB708;
  v13[4] = self;
  uint64_t v11 = +[HDDatabaseMigrationStep migrationStepFrom:9006 to:9007 handler:v13];
  [v3 addObject:v11];

  return v3;
}

uint64_t __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  sqlite3_int64 v5 = [MEMORY[0x1E4F1CA48] array];
  [v5 addObject:@"DROP TABLE IF EXISTS nano_pairing;"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS nano_pairing (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, registry_uuid BLOB UNIQUE NOT NULL, persistent_uuid BLOB, health_uuid BLOB, sync_provenance INTEGER NOT NULL, activated INTEGER NOT NULL);"];
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v6 = [v3 transaction];
  uint64_t v7 = [v6 unprotectedDatabase];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__HDDatabaseMigrator_Monarch___migrateNanoPairingSchema___block_invoke;
  v17[3] = &unk_1E62F3640;
  void v17[4] = &v18;
  int v8 = [v7 executeUncachedSQL:@"SELECT rowid FROM key_value WHERE domain='NanoPairing' AND key='RegistryPairingUUID' AND value IS NOT NULL" error:a3 bindingHandler:0 enumerationHandler:v17];

  if (v8 && *((unsigned char *)v19 + 24))
  {
    uint64_t v9 = NSString;
    uint64_t v10 = [NSString stringWithFormat:@"SELECT value FROM key_value WHERE domain='NanoPairing' AND key='%@' LIMIT 1", @"RegistryPairingUUID"];
    uint64_t v11 = [NSString stringWithFormat:@"SELECT value FROM key_value WHERE domain='NanoPairing' AND key='%@' LIMIT 1", @"PersistentPairingUUID"];
    int v12 = [NSString stringWithFormat:@"SELECT value FROM key_value WHERE domain='NanoPairing' AND key='%@' LIMIT 1", @"HealthPairingUUID"];
    uint64_t v13 = [NSString stringWithFormat:@"SELECT value FROM key_value WHERE domain='NanoPairing' AND key='%@' LIMIT 1", @"ActivationFinished"];
    objc_msgSend(v9, "stringWithFormat:", @"INSERT INTO nano_pairing(registry_uuid, persistent_uuid, health_uuid, sync_provenance, activated) SELECT (%@), (%@), (%@), 1, (%@);",
      v10,
      v11,
      v12,
    int v14 = v13);
    [v5 addObject:v14];
  }
  [v5 addObject:@"DELETE FROM key_value WHERE domain='NanoPairing';"];
  uint64_t v15 = [v3 executeSQLStatements:v5 error:a3] ^ 1;
  _Block_object_dispose(&v18, 8);

  return v15;
}

uint64_t __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v20[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    v20[0] = @"ALTER TABLE sources RENAME TO sources_old;";
    v20[1] = @"CREATE TABLE IF NOT EXISTS sources (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB UNIQUE NOT NULL, bundle_id TEXT, name TEXT, source_options INTEGER, local_device INTEGER, product_type TEXT, deleted INTEGER NOT NULL, mod_date REAL, provenance INTEGER NOT NULL)";
    v20[2] = @"INSERT INTO sources(rowid, uuid, bundle_id, name, source_options, local_device, product_type, deleted, mod_date, provenance) SELECT rowid, hk_new_source_uuid(bundle_id, product_type), bundle_id, name, source_options, local_device, product_type, 0, NULL, 0 FROM sources_old;";
    v20[3] = @"CREATE INDEX IF NOT EXISTS sources_index_0 ON sources(bundle_id)";
    v20[4] = @"DROP TABLE sources_old;";
    sqlite3_int64 v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];
    uint64_t v16 = 0;
    long long v17 = &v16;
    uint64_t v18 = 0x2020000000;
    int v19 = 0;
    uint64_t v6 = [(id)v3 transaction];
    uint64_t v7 = [v6 unprotectedDatabase];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__HDDatabaseMigrator_Monarch___migrateSourcesTableForSync___block_invoke;
    v15[3] = &unk_1E62FB730;
    v15[4] = &v16;
    [v7 accessDatabaseUsingBlock:v15];

    int v8 = *((_DWORD *)v17 + 6);
    if (v8)
    {
      uint64_t v9 = 1;
    }
    else
    {
      int v10 = [(id)v3 executeSQLStatements:v5 error:a3];
      uint64_t v11 = [(id)v3 transaction];
      int v12 = [v11 unprotectedDatabase];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__HDDatabaseMigrator_Monarch___migrateSourcesTableForSync___block_invoke_2;
      v14[3] = &unk_1E62FB730;
      v14[4] = &v16;
      [v12 accessDatabaseUsingBlock:v14];

      uint64_t v9 = v10 ^ 1u;
      int v8 = *((_DWORD *)v17 + 6);
    }
    if (v8) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = v9;
    }
    _Block_object_dispose(&v16, 8);
  }
  return v3;
}

uint64_t __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSinceReferenceDate];
  uint64_t v8 = v7;

  [v5 addObject:@"CREATE TABLE IF NOT EXISTS source_devices (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, manufacturer TEXT NOT NULL, model TEXT NOT NULL, hardware TEXT NOT NULL, firmware TEXT NOT NULL, software TEXT NOT NULL, localIdentifier TEXT NOT NULL, FDAUDI TEXT NOT NULL, creation_date REAL NOT NULL, sync_provenance INTEGER NOT NULL, uuid BLOB UNIQUE NOT NULL)"];
  id v9 = [NSString alloc];
  int v10 = (void *)MEMORY[0x1E4F65CB0];
  uint64_t v11 = (void *)[v9 initWithFormat:@"INSERT INTO source_devices(name, manufacturer, model, hardware, firmware, software, localIdentifier, FDAUDI, creation_date, sync_provenance, uuid) VALUES ('__NONE__', '', '', '', '', '', '__NONE__', '', %f, 0, %@())", v8, *MEMORY[0x1E4F65CB0]];
  [v5 addObject:v11];
  int v12 = (void *)[[NSString alloc] initWithFormat:@"INSERT INTO source_devices(name, manufacturer, model, hardware, firmware, software, localIdentifier, FDAUDI, creation_date, sync_provenance, uuid) SELECT COALESCE(name, ''), '', '', '', '', '', bundle_id, '', %f, 0, %@() FROM sources WHERE source_options = 0 AND product_type = 'Bluetooth'", v8, *v10];

  [v5 addObject:v12];
  uint64_t v13 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v13;
}

uint64_t __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE authorization RENAME TO authorization_old;"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS authorization (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, source_id INTEGER NOT NULL, object_type INTEGER NOT NULL, status INTEGER NOT NULL, request INTEGER NOT NULL, date_modified REAL NOT NULL, provenance INTEGER NOT NULL, UNIQUE(source_id, object_type));"];
  [v5 addObject:@"INSERT INTO authorization(source_id, object_type, status, request, date_modified, provenance) SELECT source_id, code, status, request, 0.0, 0 FROM authorization_old;"];
  [v5 addObject:@"DROP TABLE authorization_old;"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_opt_new();
  [v5 addObject:@"DROP TABLE IF EXISTS authorization_old;"];
  [v5 addObject:@"ALTER TABLE authorization RENAME TO authorization_old;"];
  [v5 addObject:@"CREATE TABLE authorization (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, source_id INTEGER NOT NULL REFERENCES sources(ROWID) ON DELETE CASCADE, object_type INTEGER NOT NULL, status INTEGER NOT NULL, request INTEGER NOT NULL, date_modified REAL NOT NULL, provenance INTEGER NOT NULL, UNIQUE(source_id, object_type));"];
  [v5 addObject:@"INSERT INTO authorization SELECT ROWID, source_id, object_type, status, request, date_modified, provenance FROM authorization_old WHERE EXISTS (SELECT ROWID FROM sources WHERE sources.ROWID = authorization_old.source_id);"];
  [v5 addObject:@"DROP TABLE authorization_old;"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"ALTER TABLE authorization ADD object_anchor INTEGER NOT NULL DEFAULT 0" error:a3] ^ 1);
  }
  return result;
}

void *__63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"DELETE FROM authorization WHERE object_type = 70;",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __63__HDDatabaseMigrator_Monarch__monarchUnprotectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE datatype_source_order RENAME TO datatype_source_order_old;"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS datatype_source_order (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, data_type INTEGER NOT NULL, source INTEGER NOT NULL REFERENCES sources (ROWID) ON DELETE CASCADE, user_preferred INTEGER NOT NULL, provenance INTEGER NOT NULL);"];
  [v5 addObject:@"INSERT INTO datatype_source_order SELECT ROWID, data_type, source, user_preferred_order, 0 FROM datatype_source_order_old WHERE EXISTS (SELECT ROWID FROM sources WHERE sources.ROWID = datatype_source_order_old.source);"];
  [v5 addObject:@"DROP TABLE datatype_source_order_old;"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

- (id)monarchProtectedMigrationSteps
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke;
  v36[3] = &unk_1E62FB708;
  v36[4] = self;
  uint64_t v4 = +[HDDatabaseMigrationStep migrationStepFrom:8120 to:9000 handler:v36];
  [v3 addObject:v4];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_2;
  v35[3] = &unk_1E62FB708;
  v35[4] = self;
  id v5 = +[HDDatabaseMigrationStep migrationStepFrom:9000 to:9001 handler:v35];
  [v3 addObject:v5];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_3;
  v34[3] = &unk_1E62FB708;
  v34[4] = self;
  uint64_t v6 = +[HDDatabaseMigrationStep migrationStepFrom:9001 to:9002 handler:v34];
  [v3 addObject:v6];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_4;
  v33[3] = &unk_1E62FB708;
  v33[4] = self;
  uint64_t v7 = +[HDDatabaseMigrationStep migrationStepFrom:9002 to:9004 handler:v33];
  [v3 addObject:v7];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_5;
  v32[3] = &unk_1E62FB708;
  v32[4] = self;
  uint64_t v8 = +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:9004 to:9005 handler:v32];
  [v3 addObject:v8];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_6;
  v31[3] = &unk_1E62FB708;
  v31[4] = self;
  id v9 = +[HDDatabaseMigrationStep migrationStepFrom:9005 to:9006 handler:v31];
  [v3 addObject:v9];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_7;
  v30[3] = &unk_1E62FB708;
  v30[4] = self;
  int v10 = +[HDDatabaseMigrationStep migrationStepFrom:9006 to:9007 handler:v30];
  [v3 addObject:v10];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_8;
  v29[3] = &unk_1E62FB708;
  v29[4] = self;
  uint64_t v11 = +[HDDatabaseMigrationStep migrationStepFrom:9007 to:9009 handler:v29];
  [v3 addObject:v11];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_9;
  v28[3] = &unk_1E62FB708;
  v28[4] = self;
  int v12 = +[HDDatabaseMigrationStep migrationStepFrom:9009 to:9010 handler:v28];
  [v3 addObject:v12];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_10;
  v27[3] = &unk_1E62FB708;
  v27[4] = self;
  uint64_t v13 = +[HDDatabaseMigrationStep migrationStepFrom:9010 to:9011 handler:v27];
  [v3 addObject:v13];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_11;
  v26[3] = &unk_1E62FB708;
  v26[4] = self;
  int v14 = +[HDDatabaseMigrationStep migrationStepFrom:9011 to:9012 handler:v26];
  [v3 addObject:v14];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_12;
  v25[3] = &unk_1E62FB708;
  v25[4] = self;
  uint64_t v15 = +[HDDatabaseMigrationStep migrationStepFrom:9012 to:9013 handler:v25];
  [v3 addObject:v15];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_13;
  v24[3] = &unk_1E62FB708;
  v24[4] = self;
  uint64_t v16 = +[HDDatabaseMigrationStep migrationStepFrom:9013 to:9014 handler:v24];
  [v3 addObject:v16];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_14;
  v23[3] = &unk_1E62FB708;
  v23[4] = self;
  long long v17 = +[HDDatabaseMigrationStep migrationStepFrom:9014 to:9015 handler:v23];
  [v3 addObject:v17];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_15;
  v22[3] = &unk_1E62FB708;
  v22[4] = self;
  uint64_t v18 = +[HDDatabaseMigrationStep migrationStepFrom:9015 to:9016 handler:v22];
  [v3 addObject:v18];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_16;
  v21[3] = &unk_1E62FB708;
  v21[4] = self;
  int v19 = +[HDDatabaseMigrationStep migrationStepFrom:9016 to:9017 handler:v21];
  [v3 addObject:v19];

  return v3;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"CREATE TABLE IF NOT EXISTS unit_strings (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, unit_string TEXT UNIQUE);";
  v8[1] = @"ALTER TABLE quantity_samples add column original_quantity REAL;";
  v8[2] = @"ALTER TABLE quantity_samples add column original_unit INTEGER REFERENCES unit_strings(ROWID);";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS data_provenances (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, sync_provenance INTEGER NOT NULL, origin_device TEXT NOT NULL, origin_build TEXT NOT NULL, local_device TEXT NOT NULL, local_build TEXT NOT NULL, UNIQUE(sync_provenance, origin_device, origin_build, local_device, local_build));"];
  v11[0] = @"INSERT INTO data_provenances (ROWID, sync_provenance, origin_device, origin_build, local_device, local_build) values (1, 0, 'UnknownDevice', '[8.0, 8.2)', 'UnknownDevice', 'UnknownBuild'");
  v11[1] = @"INSERT INTO data_provenances (ROWID, sync_provenance, origin_device, origin_build, local_device, local_build) values (2, 0, 'UnknownDevice', '[8.2, 9.0)', 'UnknownDevice', 'UnknownBuild'");
  v11[2] = @"INSERT INTO data_provenances (ROWID, sync_provenance, origin_device, origin_build, local_device, local_build) values (3, 1, 'UnknownDevice', '[8.2, 9.0)', 'UnknownDevice', 'UnknownBuild'");
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  [v5 addObjectsFromArray:v6];

  v10[0] = @"ALTER TABLE objects RENAME TO objects_old;";
  v10[1] = @"CREATE TABLE objects (data_id INTEGER PRIMARY KEY AUTOINCREMENT, creation_date REAL, source INTEGER, provenance INTEGER REFERENCES data_provenances(ROWID), type INTEGER, uuid BLOB);";
  v10[2] = @"INSERT INTO objects (data_id, creation_date, source, type, uuid, provenance) SELECT data_id, creation_date, source, type, uuid, (CASE WHEN data_id <= COALESCE(value, 0) THEN 1 ELSE (CASE objects_old.provenance WHEN 0 THEN 2 WHEN 1 THEN 3 END) END) FROM objects_old LEFT JOIN (SELECT value from key_value_secure WHERE category=100 AND key_value_secure.provenance=0 AND domain='OBJECT_ANCHOR' AND key='OBJECT_ANCHOR_8_2');";
  v10[3] = @"CREATE UNIQUE INDEX objects_uuid ON objects(uuid);";
  v10[4] = @"DROP TABLE objects_old;";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];
  [v5 addObjectsFromArray:v7];

  [v5 addObject:@"DELETE FROM key_value_secure WHERE category=100 AND domain='OBJECT_ANCHOR';"];
  uint64_t v8 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v8;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"INSERT INTO category_samples (data_id, value) SELECT data_id, CASE WHEN quantity < 0.5 THEN 0 ELSE 1 END FROM quantity_samples LEFT JOIN samples USING (data_id) WHERE data_type = 69";
  v8[1] = @"DELETE FROM quantity_samples WHERE data_id IN (SELECT data_id FROM samples WHERE data_type = 69)";
  v8[2] = @"UPDATE samples SET data_type = 70 WHERE data_type = 69";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"CREATE TABLE menstruation_samples (data_id INTEGER PRIMARY KEY, start_cycle INTEGER, menstrual_flow INTEGER);";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v40[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = [*(id *)(a1 + 32) transaction];
  uint64_t v6 = [v5 unprotectedDatabase];
  v40[0] = @"CREATE TEMPORARY TABLE source_device_map (source INTEGER PRIMARY KEY, device INTEGER, provenance INTEGER)";
  v40[1] = @"INSERT INTO source_device_map(source, device, provenance)                                        SELECT sources.ROWID, source_devices.ROWID, sources.provenance                                        FROM sources JOIN logical_sources ON sources.logical_source_id = logical_sources.ROWID                                        JOIN source_devices ON logical_sources.bundle_id = source_devices.localIdentifier;";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  int v8 = [v6 executeSQLStatements:v7 error:a3];

  if (v8 && [v3 executeSQLStatements:&unk_1F17E94E0 error:a3])
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = -1;
    id v9 = [v3 transaction];
    int v10 = [v9 unprotectedDatabase];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke;
    v35[3] = &unk_1E62F3640;
    v35[4] = &v36;
    char v11 = [v10 executeUncachedSQL:@"SELECT ROWID FROM source_devices WHERE source_devices.name = '__NONE__' AND source_devices.localIdentifier = '__NONE__'" error:a3 bindingHandler:0 enumerationHandler:v35];

    if (v11)
    {
      if (v37[3] == -1)
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F29128]);
        uint64_t v20 = [v3 transaction];
        uint64_t v21 = [v3 fetchLegacySyncIdentity:v20 error:a3];

        if (v21 == -1)
        {

          goto LABEL_15;
        }
        uint64_t v22 = [v3 transaction];
        v23 = [v22 unprotectedDatabase];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_2;
        v32[3] = &unk_1E62F33F8;
        id v24 = v19;
        id v33 = v24;
        uint64_t v34 = v21;
        int v25 = [v23 executeUncachedSQL:@"INSERT INTO source_devices(name, manufacturer, model, hardware, firmware, software, localIdentifier, FDAUDI, creation_date, sync_provenance, uuid, sync_identity) VALUES ('__NONE__', '', '', '', '', '', '__NONE__', '', ?, 0, ?, ?)", a3, v32, 0 error bindingHandler enumerationHandler];

        if (!v25)
        {

          goto LABEL_15;
        }
        v26 = [v3 transaction];
        v27 = [v26 unprotectedDatabase];
        v28 = [v27 lastInsertRowID];
        uint64_t v29 = [v28 longLongValue];
        v37[3] = v29;
      }
      int v12 = [v3 transaction];
      uint64_t v13 = [v12 protectedDatabase];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_3;
      v31[3] = &unk_1E62FB780;
      v31[4] = v3;
      void v31[5] = &v36;
      char v14 = [v13 executeUncachedSQL:@"SELECT ROWID, source_id FROM data_provenances", a3, 0, v31 error bindingHandler enumerationHandler];

      if (v14)
      {
        uint64_t v15 = [v3 transaction];
        uint64_t v16 = [v15 unprotectedDatabase];
        char v17 = [v16 executeUncachedSQL:@"DROP TABLE IF EXISTS source_device_map" error:a3];

        if (v17)
        {
          uint64_t v18 = [v3 executeSQLStatements:&unk_1F17E94F8 error:a3] ^ 1;
LABEL_16:
          _Block_object_dispose(&v36, 8);
          return v18;
        }
      }
    }
LABEL_15:
    uint64_t v18 = 1;
    goto LABEL_16;
  }
  return 1;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"UPDATE devices SET device_enabled = 1 WHERE device_enabled = 'TRUE' OR device_enabled = 'true'";
  v8[1] = @"ALTER TABLE devices RENAME TO devices_old";
  void v8[2] = @"CREATE TABLE IF NOT EXISTS devices (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, device_uuid BLOB, device_name TEXT, device_service INTEGER, device_last_connect REAL, device_enabled BOOLEAN default 1, UNIQUE(device_uuid, device_service))";
  v8[3] = @"INSERT INTO devices(rowid, device_uuid, device_name, device_service, device_last_connect, device_enabled) SELECT rowid, device_uuid, device_name, device_service, device_last_connect, device_enabled FROM devices_old";
  void v8[4] = @"DROP TABLE devices_old";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v8[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"DELETE FROM samples WHERE data_id IN (SELECT data_id FROM menstruation_samples)";
  v8[1] = @"DELETE FROM metadata_values WHERE object_id IN (SELECT data_id FROM menstruation_samples)";
  void v8[2] = @"DELETE FROM objects WHERE data_id IN (SELECT data_id FROM menstruation_samples)";
  v8[3] = @"DROP TABLE menstruation_samples";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_opt_new();
  uint64_t v6 = [v3 transaction];
  uint64_t v7 = [v6 protectedDatabase];
  char v8 = [v7 table:@"data_provenances" hasColumnWithName:@"ROWID" error:a3];

  if ((v8 & 1) == 0)
  {
    [v5 addObject:@"ALTER TABLE data_provenances RENAME TO provenance_old;"];
    [v5 addObject:@"CREATE TABLE data_provenances (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, sync_provenance INTEGER NOT NULL, origin_device TEXT NOT NULL, origin_build TEXT NOT NULL, local_device TEXT NOT NULL, local_build TEXT NOT NULL, source_id INTEGER NOT NULL, device_id INTEGER NOT NULL, source_version TEXT NOT NULL, UNIQUE(sync_provenance, origin_device, origin_build, local_device, local_build, source_id, device_id, source_version));"];
    [v5 addObject:@"INSERT INTO data_provenances SELECT data_id, sync_provenance, origin_device, origin_build, local_device, local_build, source_id, device_id, source_version from provenance_old;"];
    [v5 addObject:@"DROP TABLE provenance_old;"];
  }
  id v9 = [v3 transaction];
  int v10 = [v9 protectedDatabase];
  id v15 = 0;
  char v11 = [v10 foreignKeyExistsFromTable:@"objects" column:@"provenance" toTable:@"data_provenances" column:@"ROWID" error:&v15];
  id v12 = v15;

  if ((v11 & 1) == 0)
  {
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError();
      }
      uint64_t v13 = 1;
      goto LABEL_12;
    }
    [v5 addObject:@"ALTER TABLE objects RENAME TO objects_old;"];
    [v5 addObject:@"CREATE TABLE objects (data_id INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB, provenance INTEGER NOT NULL REFERENCES data_provenances (ROWID) ON DELETE CASCADE, type INTEGER, creation_date REAL);"];
    [v5 addObject:@"INSERT INTO objects SELECT data_id, uuid, provenance, type, creation_date from objects_old WHERE EXISTS (SELECT ROWID FROM data_provenances WHERE ROWID=provenance);"];
    [v5 addObject:@"CREATE UNIQUE INDEX objects_uuid ON objects(uuid);"];
    [v5 addObject:@"DROP TABLE objects_old;"];
  }
  uint64_t v13 = [v3 executeSQLStatements:v5 error:a3] ^ 1;
LABEL_12:

  return v13;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v8[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"DELETE FROM category_samples WHERE data_id IN (SELECT data_id FROM samples WHERE data_type = 93 OR data_type = 95)";
  v8[1] = @"DELETE FROM metadata_values WHERE object_id IN (SELECT data_id FROM samples WHERE data_type = 93 OR data_type = 95)";
  void v8[2] = @"DELETE FROM objects WHERE data_id IN (SELECT data_id FROM samples WHERE data_type = 93 OR data_type = 95)";
  v8[3] = @"DELETE FROM samples WHERE data_type = 93 OR data_type = 95";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"UPDATE key_value_secure SET value='ft' WHERE key='2' AND value='in';",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_opt_new();
  uint64_t v6 = [v3 transaction];
  uint64_t v7 = [v6 protectedDatabase];
  char v8 = [v7 typeOfColumn:@"energy_burned_goal_date" inTable:@"activity_caches" error:a3];

  if (v8)
  {
    if ([v8 isEqualToString:@"INTEGER"])
    {
      [v5 addObject:@"ALTER TABLE activity_caches RENAME TO activity_caches_old"];
      [v5 addObject:@"CREATE TABLE activity_caches (data_id INTEGER PRIMARY KEY, energy_burned REAL, energy_burned_goal REAL, step_count_anchor INTEGER, energy_burned_goal_date REAL, steps REAL, active_hours_goal REAL, active_energy_burned_anchor INTEGER, brisk_minutes_anchor INTEGER, brisk_minutes_goal REAL, walk_distance REAL, energy_burned_goal_anchor INTEGER, walking_and_running_distance_anchor INTEGER, workout_anchor INTEGER, brisk_minutes REAL, active_hours_anchor INTEGER, cache_index INTEGER, active_hours REAL)"];
      [v5 addObject:@"INSERT INTO activity_caches SELECT data_id, energy_burned, energy_burned_goal, step_count_anchor, energy_burned_goal_date, steps, active_hours_goal, active_energy_burned_anchor, brisk_minutes_anchor, brisk_minutes_goal, walk_distance, energy_burned_goal_anchor, walking_and_running_distance_anchor, workout_anchor, brisk_minutes, active_hours_anchor, cache_index, active_hours from activity_caches_old;"];
      [v5 addObject:@"DROP TABLE activity_caches_old"];
    }
    uint64_t v9 = [v3 executeSQLStatements:v5 error:a3] ^ 1;
  }
  else
  {
    NSLog(&cfstr_NoEnergyBurned.isa);
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  id v5 = [v3 transaction];
  uint64_t v6 = [v5 protectedDatabase];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__HDDatabaseMigrator_Monarch___setAuthorizationAnchorWithError___block_invoke;
  v14[3] = &unk_1E62F3640;
  v14[4] = v15;
  char v7 = [v6 executeUncachedSQL:@"SELECT MAX(data_id) FROM objects" error:a3 bindingHandler:0 enumerationHandler:v14];

  if (v7)
  {
    char v8 = [v3 transaction];
    uint64_t v9 = [v8 unprotectedDatabase];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__HDDatabaseMigrator_Monarch___setAuthorizationAnchorWithError___block_invoke_2;
    v13[3] = &unk_1E62F3D88;
    v13[4] = v15;
    int v10 = [v9 executeUncachedSQL:@"UPDATE authorization SET deleted_object_anchor = ?" error:a3 bindingHandler:v13 enumerationHandler:0];

    uint64_t v11 = v10 ^ 1u;
  }
  else
  {
    uint64_t v11 = 1;
  }
  _Block_object_dispose(v15, 8);
  return v11;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = [*(id *)(a1 + 32) transaction];
  uint64_t v6 = [v5 protectedDatabase];

  char v7 = [v3 transaction];
  char v8 = [v7 unprotectedDatabase];

  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke;
  v57[3] = &unk_1E62F3640;
  v57[4] = &v58;
  if ((objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", @"SELECT ROWID FROM sources WHERE local_device = 1;",
          a3,
          0,
          v57) & 1) == 0)
    goto LABEL_27;
  if (v59[3]) {
    goto LABEL_4;
  }
  uint64_t v34 = 0;
  uint64_t v35 = (uint64_t)&v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 1;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_2;
  v56[3] = &unk_1E62F3640;
  v56[4] = &v34;
  if ((objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", @"SELECT MAX(sync_anchor) FROM sources;",
          a3,
          0,
          v56) & 1) == 0)
  {
    _Block_object_dispose(&v34, 8);
    goto LABEL_27;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F29128]);
  uint64_t v11 = NSString;
  id v12 = [v10 UUIDString];
  uint64_t v13 = [v11 stringWithFormat:@"com.apple.health.%@", v12];

  v26 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
  int v25 = [MEMORY[0x1E4F2B860] currentDeviceDisplayName];
  uint64_t v27 = 0;
  uint64_t v28 = (uint64_t)&v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__61;
  v31 = __Block_byref_object_dispose__61;
  v32 = 0;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_602;
  v54[3] = &unk_1E62F43C8;
  id v14 = v13;
  id v55 = v14;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_2_603;
  v53[3] = &unk_1E62F3640;
  v53[4] = &v27;
  if (([v8 executeUncachedSQL:@"SELECT ROWID FROM logical_sources WHERE bundle_id = ?" error:a3 bindingHandler:v54 enumerationHandler:v53] & 1) == 0)
  {
    int v22 = 1;
    goto LABEL_26;
  }
  if (!*(void *)(v28 + 40))
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_3;
    v51[3] = &unk_1E62F43C8;
    id v52 = v14;
    if (![v8 executeUncachedSQL:@"INSERT INTO logical_sources (bundle_id) VALUES (?)" error:a3 bindingHandler:v51 enumerationHandler:0])
    {
      int v22 = 1;

      goto LABEL_26;
    }
    uint64_t v15 = [v8 lastInsertRowID];
    uint64_t v16 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v15;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;",
    *MEMORY[0x1E4F65C98],
  id v24 = *MEMORY[0x1E4F65C98]);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  char v17 = [v3 transaction];
  uint64_t v18 = [v17 unprotectedDatabase];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_4;
  v46[3] = &unk_1E62F3640;
  v46[4] = &v47;
  char v19 = [v18 executeSQL:v24 error:a3 bindingHandler:0 enumerationHandler:v46];

  if (v19)
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_5;
    v39[3] = &unk_1E62FB7A8;
    id v40 = v10;
    v43 = &v27;
    id v41 = v25;
    id v42 = v26;
    v44 = &v34;
    v45 = &v47;
    if ([v8 executeUncachedSQL:@"INSERT INTO sources(uuid, logical_source_id, name, source_options, local_device, product_type, deleted, mod_date, provenance, sync_anchor, sync_identity) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", a3, v39, 0 error bindingHandler enumerationHandler])
    {
      uint64_t v20 = [v8 lastInsertRowID];
      uint64_t v21 = [v20 longLongValue];
      v59[3] = v21;

      int v22 = 0;
    }
    else
    {
      int v22 = 1;
    }
  }
  else
  {
    int v22 = 1;
  }
  _Block_object_dispose(&v47, 8);

LABEL_26:
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v34, 8);
  if (!v22)
  {
LABEL_4:
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    uint64_t v36 = (uint64_t)__78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_6;
    uint64_t v37 = (uint64_t)&unk_1E62F3640;
    uint64_t v38 = &v47;
    if ([v8 executeUncachedSQL:@"SELECT ROWID FROM source_devices WHERE name='__NONE__' AND manufacturer='' AND model='' AND hardware='' AND firmware='' AND software='' AND localIdentifier='__NONE__' AND FDAUDI=''" error:a3 bindingHandler:0 enumerationHandler:&v34]&& v48[3])
    {
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      uint64_t v29 = (uint64_t)__78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_7;
      v30 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62FB7F8;
      v31 = v6;
      v32 = &v58;
      id v33 = &v47;
      if ([v31 executeUncachedSQL:@"SELECT ROWID, sync_provenance, origin_device, origin_build, local_device, local_build, source_id, device_id, source_version FROM data_provenances WHERE source_id=0 OR device_id=0", a3, 0, &v27 error bindingHandler enumerationHandler])uint64_t v9 = objc_msgSend(v3, "executeSQL:error:", @"DELETE FROM data_provenances WHERE source_id=0 OR device_id=0", a3) ^ 1; {
      else
      }
        uint64_t v9 = 1;
    }
    else
    {
      uint64_t v9 = 1;
    }
    _Block_object_dispose(&v47, 8);
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v9 = 1;
LABEL_28:
  _Block_object_dispose(&v58, 8);

  return v9;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) transaction];
    uint64_t v6 = [v5 protectedDatabase];
    char v7 = [v6 columnIsNullable:@"provenance" inTable:@"objects" error:a3];

    if (v7)
    {
      char v8 = [MEMORY[0x1E4F1CA48] array];
      [v8 addObject:@"ALTER TABLE objects RENAME TO objects_old;"];
      [v8 addObject:@"CREATE TABLE objects (data_id INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB, provenance INTEGER NOT NULL REFERENCES data_provenances (ROWID) ON DELETE CASCADE, type INTEGER, creation_date REAL);"];
      [v8 addObject:@"INSERT INTO objects SELECT data_id, uuid, provenance, type, creation_date from objects_old WHERE EXISTS (SELECT ROWID FROM data_provenances WHERE ROWID=provenance);"];
      [v8 addObject:@"DROP TABLE objects_old;"];
      [v8 addObject:@"CREATE UNIQUE INDEX objects_uuid ON objects(uuid);"];
      unsigned int v9 = [v3 executeSQLStatements:v8 error:a3] ^ 1;
    }
    else
    {
      return *a3 != 0;
    }
  }
  else
  {
    return 0;
  }
  return v9;
}

uint64_t __61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = [*(id *)(a1 + 32) transaction];
  uint64_t v6 = [v5 protectedDatabase];

  char v7 = [v3 transaction];
  char v8 = [v7 unprotectedDatabase];

  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke;
  v36[3] = &unk_1E62F3640;
  v36[4] = &v37;
  if ((objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", @"SELECT MAX(ROWID) FROM sources WHERE provenance=1 and deleted=0 and product_type LIKE 'Watch1,%';",
          a3,
          0,
          v36) & 1) != 0)
  {
    if (v38[3])
    {
      uint64_t v32 = 0;
      id v33 = &v32;
      uint64_t v34 = 0x2020000000;
      char v35 = 1;
      unsigned int v9 = [MEMORY[0x1E4F1CA48] array];
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v11 = [v3 transaction];
      id v12 = [v11 unprotectedDatabase];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_2;
      v30[3] = &unk_1E62F3D38;
      id v13 = v10;
      id v31 = v13;
      char v14 = [v12 executeUncachedSQL:@"SELECT rowid FROM sources" error:a3 bindingHandler:0 enumerationHandler:v30];

      if (v14)
      {
        if ([v13 count])
        {
          uint64_t v15 = NSString;
          uint64_t v16 = [v13 componentsJoinedByString:@","];
          char v17 = [v15 stringWithFormat:@"AND source_id NOT IN (%@)", v16];
        }
        else
        {
          char v17 = &stru_1F1728D60;
        }
        objc_msgSend(NSString, "stringWithFormat:", @"SELECT ROWID, origin_device, origin_build, local_device, local_build, device_id, source_version FROM data_provenances WHERE sync_provenance=1 %@;",
        char v19 = v17);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_3;
        v25[3] = &unk_1E62FB820;
        uint64_t v28 = &v32;
        id v26 = v6;
        uint64_t v29 = &v37;
        id v20 = v9;
        id v27 = v20;
        if ([v26 executeUncachedSQL:v19 error:a3 bindingHandler:0 enumerationHandler:v25]&& *((unsigned char *)v33 + 24))
        {
          id v24 = NSString;
          uint64_t v21 = [v20 componentsJoinedByString:@","];
          int v22 = [v24 stringWithFormat:@"DELETE FROM data_provenances WHERE ROWID IN (%@);", v21];

          uint64_t v18 = [v3 executeSQL:v22 error:a3] ^ 1;
        }
        else
        {
          uint64_t v18 = 1;
        }
      }
      else
      {
        uint64_t v18 = 1;
      }

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 1;
  }
  _Block_object_dispose(&v37, 8);

  return v18;
}

void *__61__HDDatabaseMigrator_Monarch__monarchProtectedMigrationSteps__block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"ALTER TABLE workouts ADD COLUMN total_basal_energy_burned REAL" error:a3] ^ 1);
  }
  return result;
}

uint64_t __57__HDDatabaseMigrator_Monarch___migrateNanoPairingSchema___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

uint64_t __59__HDDatabaseMigrator_Monarch___migrateSourcesTableForSync___block_invoke(uint64_t a1, sqlite3 *db)
{
  uint64_t result = sqlite3_create_function_v2(db, "hk_new_source_uuid", 2, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteNewSourceUUIDWithBundleIdentifierAndProductType, 0, 0, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __59__HDDatabaseMigrator_Monarch___migrateSourcesTableForSync___block_invoke_2(uint64_t a1, sqlite3 *db)
{
  uint64_t result = sqlite3_create_function_v2(db, "hk_new_source_uuid", 2, 0, 0, 0, 0, 0, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 1, Current);
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v5 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 3, v5);
}

uint64_t __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnAsInt64();
  uint64_t v6 = HDSQLiteColumnAsInt64();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  uint64_t v18 = 0;
  char v7 = *(void **)(a1 + 32);
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  char v8 = [v7 transaction];
  unsigned int v9 = [v8 unprotectedDatabase];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_4;
  v16[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v16[4] = v6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_5;
  v15[3] = &unk_1E62F3640;
  void v15[4] = v17;
  LOBYTE(v6) = [v9 executeSQL:@"SELECT device FROM source_device_map WHERE source = ?" error:a3 bindingHandler:v16 enumerationHandler:v15];

  if (v6)
  {
    id v10 = [*(id *)(a1 + 32) transaction];
    uint64_t v11 = [v10 protectedDatabase];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_6;
    v14[3] = &unk_1E62FB758;
    v14[4] = v17;
    void v14[5] = v5;
    uint64_t v12 = [v11 executeSQL:@"UPDATE data_provenances SET device_id = ? WHERE ROWID = ?" error:a3 bindingHandler:v14 enumerationHandler:0];
  }
  else
  {
    uint64_t v12 = 0;
  }
  _Block_object_dispose(v17, 8);
  return v12;
}

void __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_4(uint64_t a1)
{
  id v1 = [NSNumber numberWithLongLong:*(void *)(a1 + 32)];
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_5(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

void __68__HDDatabaseMigrator_Monarch___migrateSourcesToProvenanceWithError___block_invoke_6(uint64_t a1)
{
  v2 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  HDSQLiteBindFoundationValueToStatement();

  id v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __64__HDDatabaseMigrator_Monarch___setAuthorizationAnchorWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

void __64__HDDatabaseMigrator_Monarch___setAuthorizationAnchorWithError___block_invoke_2(uint64_t a1)
{
  id v1 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_602()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_2_603(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_3()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_5(void *a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, [*(id *)(*(void *)(a1[7] + 8) + 40) longLongValue]);
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int(a2, 4, 2);
  sqlite3_bind_int(a2, 5, 1);
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int(a2, 7, 0);
  sqlite3_bind_double(a2, 8, 0.0);
  sqlite3_bind_int(a2, 9, 0);
  uint64_t v4 = *(void *)(a1[8] + 8);
  sqlite3_int64 v5 = *(void *)(v4 + 24) + 1;
  *(void *)(v4 + 24) = v5;
  sqlite3_bind_int64(a2, 10, v5);
  sqlite3_int64 v6 = *(void *)(*(void *)(a1[9] + 8) + 24);

  return sqlite3_bind_int64(a2, 11, v6);
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_6(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  sqlite3_int64 v6 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_8;
  v18[3] = &unk_1E62FB7D0;
  uint64_t v20 = a2;
  long long v19 = *(_OWORD *)(a1 + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_9;
  void v17[3] = &unk_1E62F3640;
  void v17[4] = &v21;
  if (([v6 executeUncachedSQL:@"SELECT ROWID FROM data_provenances WHERE sync_provenance=? AND origin_device=? AND origin_build=? AND local_device=? AND local_build=? AND source_id=? AND device_id=? AND source_version=?" error:a3 bindingHandler:v18 enumerationHandler:v17] & 1) == 0)goto LABEL_6; {
  if (!v22[3])
  }
  {
    char v7 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_10;
    v14[3] = &unk_1E62FB7D0;
    uint64_t v16 = a2;
    long long v15 = *(_OWORD *)(a1 + 40);
    if ([v7 executeUncachedSQL:@"INSERT INTO data_provenances (sync_provenance, origin_device, origin_build, local_device, local_build, source_id, device_id, source_version) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", a3, v14, 0 error bindingHandler enumerationHandler])
    {
      char v8 = [*(id *)(a1 + 32) lastInsertRowID];
      uint64_t v9 = [v8 longLongValue];
      v22[3] = v9;

      goto LABEL_5;
    }
LABEL_6:
    uint64_t v11 = 0;
    goto LABEL_7;
  }
LABEL_5:
  id v10 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_11;
  v13[3] = &unk_1E62FB758;
  v13[4] = &v21;
  void v13[5] = a2;
  uint64_t v11 = [v10 executeUncachedSQL:@"UPDATE objects SET provenance=? WHERE provenance=?" error:a3 bindingHandler:v13 enumerationHandler:0];
LABEL_7:
  _Block_object_dispose(&v21, 8);
  return v11;
}

void __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_8(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = HDSQLiteColumnAsInt64();
  sqlite3_bind_int64(a2, 1, v4);
  sqlite3_int64 v5 = MEMORY[0x1C1879F80](a1[6], 2);
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_int64 v6 = MEMORY[0x1C1879F80](a1[6], 3);
  HDSQLiteBindFoundationValueToStatement();

  char v7 = MEMORY[0x1C1879F80](a1[6], 4);
  HDSQLiteBindFoundationValueToStatement();

  char v8 = MEMORY[0x1C1879F80](a1[6], 5);
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_int64 v9 = HDSQLiteColumnAsInt64();
  if (!v9) {
    sqlite3_int64 v9 = *(void *)(*(void *)(a1[4] + 8) + 24);
  }
  sqlite3_bind_int64(a2, 6, v9);
  sqlite3_int64 v10 = HDSQLiteColumnAsInt64();
  if (!v10) {
    sqlite3_int64 v10 = *(void *)(*(void *)(a1[5] + 8) + 24);
  }
  sqlite3_bind_int64(a2, 7, v10);
  MEMORY[0x1C1879F80](a1[6], 8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_9(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

void __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_10(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = HDSQLiteColumnAsInt64();
  sqlite3_bind_int64(a2, 1, v4);
  sqlite3_int64 v5 = MEMORY[0x1C1879F80](a1[6], 2);
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_int64 v6 = MEMORY[0x1C1879F80](a1[6], 3);
  HDSQLiteBindFoundationValueToStatement();

  char v7 = MEMORY[0x1C1879F80](a1[6], 4);
  HDSQLiteBindFoundationValueToStatement();

  char v8 = MEMORY[0x1C1879F80](a1[6], 5);
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_int64 v9 = HDSQLiteColumnAsInt64();
  if (!v9) {
    sqlite3_int64 v9 = *(void *)(*(void *)(a1[4] + 8) + 24);
  }
  sqlite3_bind_int64(a2, 6, v9);
  sqlite3_int64 v10 = HDSQLiteColumnAsInt64();
  if (!v10) {
    sqlite3_int64 v10 = *(void *)(*(void *)(a1[5] + 8) + 24);
  }
  sqlite3_bind_int64(a2, 7, v10);
  MEMORY[0x1C1879F80](a1[6], 8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __78__HDDatabaseMigrator_Monarch___fixProvenancesWithZeroSourceOrDeviceWithError___block_invoke_11(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  sqlite3_int64 v3 = HDSQLiteColumnAsInt64();

  return sqlite3_bind_int64(a2, 2, v3);
}

uint64_t __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsInt64();
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  sqlite3_int64 v4 = [NSNumber numberWithLongLong:v2];
  [v3 addObject:v4];

  return 1;
}

BOOL __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = HDSQLiteColumnAsInt64();
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  char v7 = *(void **)(a1 + 32);
  void v18[4] = &v20;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_4;
  v19[3] = &unk_1E62FB758;
  v19[4] = *(void *)(a1 + 56);
  void v19[5] = a2;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_5;
  v18[3] = &unk_1E62F3640;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", @"SELECT ROWID FROM data_provenances WHERE sync_provenance=1 AND origin_device=? AND origin_build=? AND local_device=? AND local_build=? AND source_id=? AND device_id=? AND source_version=?;",
                                                                 a3,
                                                                 v19,
                                                                 v18);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    goto LABEL_6;
  }
  if (!v21[3])
  {
    char v8 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_6;
    void v17[3] = &unk_1E62FB758;
    void v17[4] = *(void *)(a1 + 56);
    void v17[5] = a2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", @"INSERT INTO data_provenances(sync_provenance, origin_device, origin_build, local_device, local_build, source_id, device_id, source_version) VALUES (?,?,?,?,?,?,?,?);",
                                                                   a3,
                                                                   v17,
                                                                   0);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      sqlite3_int64 v9 = [*(id *)(a1 + 32) lastInsertRowID];
      uint64_t v10 = [v9 longLongValue];
      v21[3] = v10;

      goto LABEL_5;
    }
LABEL_6:
    BOOL v14 = 0;
    goto LABEL_7;
  }
LABEL_5:
  id v11 = *(void **)(a1 + 40);
  uint64_t v12 = [NSNumber numberWithLongLong:v6];
  [v11 addObject:v12];

  id v13 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_7;
  v16[3] = &unk_1E62FB758;
  v16[4] = &v20;
  void v16[5] = v6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v13, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", @"UPDATE objects SET provenance=? WHERE provenance=?;",
                                                                 a3,
                                                                 v16,
                                                                 0);
  BOOL v14 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
LABEL_7:
  _Block_object_dispose(&v20, 8);
  return v14;
}

void __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = MEMORY[0x1C1879F80](*(void *)(a1 + 40), 1);
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_int64 v5 = MEMORY[0x1C1879F80](*(void *)(a1 + 40), 2);
  HDSQLiteBindFoundationValueToStatement();

  uint64_t v6 = MEMORY[0x1C1879F80](*(void *)(a1 + 40), 3);
  HDSQLiteBindFoundationValueToStatement();

  char v7 = MEMORY[0x1C1879F80](*(void *)(a1 + 40), 4);
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 5, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  sqlite3_int64 v8 = HDSQLiteColumnAsInt64();
  sqlite3_bind_int64(a2, 6, v8);
  MEMORY[0x1C1879F80](*(void *)(a1 + 40), 6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_5(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

void __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_6(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 1);
  sqlite3_int64 v4 = MEMORY[0x1C1879F80](*(void *)(a1 + 40), 1);
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_int64 v5 = MEMORY[0x1C1879F80](*(void *)(a1 + 40), 2);
  HDSQLiteBindFoundationValueToStatement();

  uint64_t v6 = MEMORY[0x1C1879F80](*(void *)(a1 + 40), 3);
  HDSQLiteBindFoundationValueToStatement();

  char v7 = MEMORY[0x1C1879F80](*(void *)(a1 + 40), 4);
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 6, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  sqlite3_int64 v8 = HDSQLiteColumnAsInt64();
  sqlite3_bind_int64(a2, 7, v8);
  MEMORY[0x1C1879F80](*(void *)(a1 + 40), 6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __74__HDDatabaseMigrator_Monarch___fixDanglingSourcesAndProvenancesWithError___block_invoke_7(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

- (id)boulderUnprotectedMigrationSteps
{
  return (id)[MEMORY[0x1E4F1CA48] array];
}

- (id)boulderProtectedMigrationSteps
{
  sqlite3_int64 v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__HDDatabaseMigrator_Boulder__boulderProtectedMigrationSteps__block_invoke;
  v6[3] = &unk_1E62FB708;
  v6[4] = self;
  sqlite3_int64 v4 = +[HDDatabaseMigrationStep migrationStepFrom:9017 to:9100 handler:v6];
  [v3 addObject:v4];

  return v3;
}

uint64_t __61__HDDatabaseMigrator_Boulder__boulderProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [v3 transaction];
  char v7 = [v6 unprotectedDatabase];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __66__HDDatabaseMigrator_Boulder___fixSyncProvenanceForPostOkemoZurs___block_invoke;
  v34[3] = &unk_1E62F3D38;
  id v8 = v5;
  id v35 = v8;
  int v9 = [v7 executeUncachedSQL:@"SELECT ROWID FROM sources WHERE product_type LIKE 'Watch%'" error:a3 bindingHandler:0 enumerationHandler:v34];

  if (v9)
  {
    if ([v8 count])
    {
      uint64_t v10 = [v8 componentsJoinedByString:@","];
      [NSString stringWithFormat:@"SELECT ROWID FROM data_provenances WHERE sync_provenance = 0 AND origin_build = '[8.0, 8.2' AND source_id IN (%@) LIMIT 1;"],
      id v11 = v10);
      uint64_t v30 = 0;
      id v31 = &v30;
      uint64_t v32 = 0x2020000000;
      uint64_t v33 = -1;
      uint64_t v12 = [v3 transaction];
      id v13 = [v12 protectedDatabase];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __66__HDDatabaseMigrator_Boulder___fixSyncProvenanceForPostOkemoZurs___block_invoke_2;
      v29[3] = &unk_1E62F3640;
      v29[4] = &v30;
      char v14 = [v13 executeUncachedSQL:v11 error:a3 bindingHandler:0 enumerationHandler:v29];

      if (v14)
      {
        if (v31[3] != -1)
        {
          long long v15 = [MEMORY[0x1E4F1CA48] array];
          [v15 addObject:@"UPDATE data_provenances SET origin_build = '[8.2, 9.0' WHERE origin_build = '[8.0, 8.2]'"));
          uint64_t v16 = [NSString stringWithFormat:@"UPDATE data_provenances SET sync_provenance = 1 WHERE origin_build = '[8.2, 9.0' AND source_id IN (%@)"], v10);
          [v15 addObject:v16];

          id v28 = 0;
          int v17 = [v3 executeSQLStatements:v15 error:&v28];
          id v18 = v28;
          long long v19 = v18;
          if ((v17 & 1) == 0)
          {
            uint64_t v20 = [v18 userInfo];
            uint64_t v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

            uint64_t v22 = [v21 domain];
            if ([v22 isEqualToString:@"com.apple.SQLite"])
            {
              uint64_t v23 = [v21 code];

              if (v23 == 19)
              {
                _HKInitializeLogging();
                uint64_t v24 = *MEMORY[0x1E4F29F18];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_FAULT, "Attempt to fix sync provenance failed due to a SQL constraint. Skipping migration step.", buf, 2u);
                }

                uint64_t v25 = 0;
                goto LABEL_19;
              }
            }
            else
            {
            }
          }
          uint64_t v25 = v17 ^ 1u;
LABEL_19:

          goto LABEL_20;
        }
        uint64_t v25 = 0;
      }
      else
      {
        uint64_t v25 = 1;
      }
LABEL_20:
      _Block_object_dispose(&v30, 8);

      goto LABEL_21;
    }
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = 1;
  }
LABEL_21:

  return v25;
}

uint64_t __66__HDDatabaseMigrator_Boulder___fixSyncProvenanceForPostOkemoZurs___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsInt64();
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  sqlite3_int64 v4 = [NSNumber numberWithLongLong:v2];
  [v3 addObject:v4];

  return 1;
}

uint64_t __66__HDDatabaseMigrator_Boulder___fixSyncProvenanceForPostOkemoZurs___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

- (id)erieUnprotectedMigrationSteps
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)erieProtectedMigrationSteps
{
  sqlite3_int64 v3 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __55__HDDatabaseMigrator_Erie__erieProtectedMigrationSteps__block_invoke;
  v8[3] = &unk_1E62F5250;
  void v8[4] = self;
  sqlite3_int64 v4 = HDCreateMigrationStep(10202, 10204, (uint64_t)v8);
  [v3 addObject:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __55__HDDatabaseMigrator_Erie__erieProtectedMigrationSteps__block_invoke_2;
  void v7[3] = &unk_1E62F5250;
  v7[4] = self;
  id v5 = HDCreateMigrationStep(10204, 10205, (uint64_t)v7);
  [v3 addObject:v5];

  return v3;
}

uint64_t __55__HDDatabaseMigrator_Erie__erieProtectedMigrationSteps__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_corry_rewriteHFDStep1WithError:");
}

uint64_t __55__HDDatabaseMigrator_Erie__erieProtectedMigrationSteps__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_corry_rewriteHFDStep2WithError:");
}

- (void)peace_addUnprotectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:12000 function:_HDAddWorkoutBuilderTables];
  [(HDDatabaseMigrator *)self addMigrationTo:12001 function:_HDAddWorkoutSessionControllerTables];
  [(HDDatabaseMigrator *)self addMigrationTo:12002 function:_HDAddClientBundleIdentifierToWorkoutSession];
  [(HDDatabaseMigrator *)self addMigrationTo:12010 function:_HDAddAuthorizationMode];
  [(HDDatabaseMigrator *)self addMigrationTo:12011 function:_HDAddClientApplicationIdentifierToWorkoutSession];
  [(HDDatabaseMigrator *)self addMigrationTo:12012 function:_HDRemoveExistingWorkoutBuildersAndSessions];
  [(HDDatabaseMigrator *)self addMigrationTo:12013 function:_HDSplitAuthorizationAnchors];
  [(HDDatabaseMigrator *)self addMigrationTo:12014 function:_HDAddSyncProtocolVersionToCloudSyncStore];
  [(HDDatabaseMigrator *)self addMigrationTo:12015 function:_HDMakeStatisticsColumnNullable];
  [(HDDatabaseMigrator *)self addMigrationTo:12016 function:_HDAddRequestedTargetStateToWorkoutSession];

  [(HDDatabaseMigrator *)self addMigrationTo:12017 function:_HDAddHasFailedToWorkoutSession];
}

- (void)peace_addProtectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:12000 function:_HDAddWorkoutEventForeignKey];
  [(HDDatabaseMigrator *)self addMigrationTo:12001 function:_CreateQuantitySampleSeriesEntityTable];
  [(HDDatabaseMigrator *)self addMigrationTo:12002 function:_AddCondenserVersionToWorkoutEntityTable];
  [(HDDatabaseMigrator *)self addMigrationTo:12003 function:_AddTemplateUniqueNameToFitnessFriendAchievements];
  [(HDDatabaseMigrator *)self addMigrationTo:12010 function:_AddiOSVersionToFHIRResources];
  [(HDDatabaseMigrator *)self addMigrationTo:12011 function:_AddCondenserDateToWorkoutEntityTable];
  [(HDDatabaseMigrator *)self addMigrationTo:12012 function:_AddHFDKeyToSeriesSampleEntityTable];
  [(HDDatabaseMigrator *)self addMigrationTo:12013 function:_CreateClinicalRecordEntityTable];
  [(HDDatabaseMigrator *)self addMigrationTo:12014 function:_MakeQuantitySampleSeriesEntityHFDKeyUnique];
  [(HDDatabaseMigrator *)self addMigrationTo:12015 function:_CreateQuantitySampleSeriesUnfrozenIndex];
  [(HDDatabaseMigrator *)self addMigrationTo:12016 function:_RemoveLegacyAchievements];
  [(HDDatabaseMigrator *)self addMigrationTo:12017 function:_HDMigrateClinicalSources];
  [(HDDatabaseMigrator *)self addMigrationTo:12018 function:_MakeSeriesSampleEntityHFDKeyUnique];

  [(HDDatabaseMigrator *)self addMigrationTo:12019 function:_HDAddHealthRecordsAccountCount];
}

- (void)azul_addUnprotectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:14000 function:_HDUpdateClientSideDataCollectionLastCollectedDatum];
  [(HDDatabaseMigrator *)self addMigrationTo:14001 function:_HDAddShouldCollectEventsColumnToWorkoutBuildersTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14002 function:_HDAddOnboardingCompletionTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14003 function:_HDResetAnchorsForCloudSyncStoresWithGaps];

  [(HDDatabaseMigrator *)self addMigrationTo:14004 function:_HDResetReceivedNanoSyncAnchorsForCategoryAndQuantitySamples];
}

- (void)azul_addProtectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:14000 function:_HDAddSleepScheduleTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14001 function:_HDAddECGSampleTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14002 function:_HDAddContributorsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14003 function:_HDAddDeviceRecordSamplesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14004 function:_HDAddProtectedOnboardingCompletionTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14005 function:_HDAddFHIRVersionToClinicalRecordSamplesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14006 function:_HDAddContributorsColumnToProvenance foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:14007 function:_HDCreatePartialIndexForDeletedObjects];
  [(HDDatabaseMigrator *)self addMigrationTo:14008 function:_HDAddAppleIDAndCallerIDToContributorsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14009 function:_HDAddECGSymptomsColumnToECGSamplesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14010 function:_HDMigrateECGClassificationAverageHRAndPayload];
  [(HDDatabaseMigrator *)self addMigrationTo:14011 function:_HDRemovePlaceholderAndAddSyncProvenanceToContributorsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14013 function:_HDAddFirstSeenDateToOriginalFHIRResourcesTable foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:14014 function:_HDAddCoverageRecordSamplesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14015 function:_HDAddSCWIColumnToFriendWorkoutTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14016 function:_HDAddRequestedScopeToClinicalCredentialsTable foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:14021 function:_HDFixInvalidContributorInDataProvenancesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14025 function:_HDAddOverrideDayIndexRemoveWindDownFromSleepScheduleTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14026 function:_HDUpdateMedicalRecordsCoverageDiagnosticreportProcedureTables];
  [(HDDatabaseMigrator *)self addMigrationTo:14028 function:_HDRepairECGSymptomsStatus];
  [(HDDatabaseMigrator *)self addMigrationTo:14029 function:_HDMigrateAndDeleteProtectedOnboardingCompletionTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14030 function:_HDRecreateCHRConditionsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14031 function:_HDUpdateSleepAndAppetiteChangesCategoryValues];
  [(HDDatabaseMigrator *)self addMigrationTo:14032 function:_HDRepairECGSymptomsStatusForNilSymptomsMetadata];
  [(HDDatabaseMigrator *)self addMigrationTo:14035 function:_HDUpdateNullTypeValesInObjectsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:14200 function:_HDRenameSCWIAndAddSeymourMediaTypeColumnToFriendWorkoutTable];

  [(HDDatabaseMigrator *)self addMigrationTo:14201 function:_HDUpdateCoverageAddIdentifierColumnsTable];
}

- (id)emetUnprotectedMigrationSteps
{
  sqlite3_int64 v3 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __57__HDDatabaseMigrator_Emet__emetUnprotectedMigrationSteps__block_invoke;
  v8[3] = &unk_1E62FB708;
  void v8[4] = self;
  sqlite3_int64 v4 = +[HDDatabaseMigrationStep migrationStepFrom:11203 to:11300 handler:v8];
  [v3 addObject:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __57__HDDatabaseMigrator_Emet__emetUnprotectedMigrationSteps__block_invoke_2;
  void v7[3] = &unk_1E62FB708;
  v7[4] = self;
  id v5 = +[HDDatabaseMigrationStep migrationStepFrom:11300 to:11301 handler:v7];
  [v3 addObject:v5];

  return v3;
}

uint64_t __57__HDDatabaseMigrator_Emet__emetUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE sync_anchors RENAME TO sync_anchors_old"];
  [v5 addObject:@"CREATE TABLE sync_anchors (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, next INTEGER NOT NULL, acked INTEGER NOT NULL, received INTEGER NOT NULL, schema TEXT NOT NULL, type INTEGER NOT NULL, store INTEGER NOT NULL, epoch INTEGER NOT NULL, UNIQUE(store, epoch, type, schema));"];
  [v5 addObject:@"INSERT INTO sync_anchors (next, acked, received, schema, type, store, epoch) SELECT next, acked, received, 'main', type, store, epoch FROM sync_anchors_old;"];
  [v5 addObject:@"DROP TABLE sync_anchors_old"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__57__HDDatabaseMigrator_Emet__emetUnprotectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"DROP TABLE IF EXISTS subscription_data_anchors" error:a3] ^ 1);
  }
  return result;
}

- (id)emetProtectedMigrationSteps
{
  sqlite3_int64 v3 = [MEMORY[0x1E4F1CA48] array];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke;
  v20[3] = &unk_1E62FB708;
  v20[4] = self;
  sqlite3_int64 v4 = +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:11200 to:11300 handler:v20];
  [v3 addObject:v4];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_2;
  v19[3] = &unk_1E62FB708;
  v19[4] = self;
  id v5 = +[HDDatabaseMigrationStep migrationStepFrom:11300 to:11301 handler:v19];
  [v3 addObject:v5];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_3;
  v18[3] = &unk_1E62FB708;
  void v18[4] = self;
  uint64_t v6 = +[HDDatabaseMigrationStep migrationStepFrom:11301 to:11302 handler:v18];
  [v3 addObject:v6];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_4;
  void v17[3] = &unk_1E62FB708;
  void v17[4] = self;
  char v7 = +[HDDatabaseMigrationStep migrationStepFrom:11302 to:11303 handler:v17];
  [v3 addObject:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_5;
  v16[3] = &unk_1E62FB708;
  v16[4] = self;
  id v8 = +[HDDatabaseMigrationStep migrationStepFrom:11303 to:11304 handler:v16];
  [v3 addObject:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_6;
  v15[3] = &unk_1E62FB708;
  void v15[4] = self;
  int v9 = +[HDDatabaseMigrationStep migrationStepFrom:11304 to:11305 handler:v15];
  [v3 addObject:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_7;
  v14[3] = &unk_1E62FB708;
  void v14[4] = self;
  uint64_t v10 = +[HDDatabaseMigrationStep migrationStepFrom:11305 to:11306 handler:v14];
  [v3 addObject:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_8;
  v13[3] = &unk_1E62FB708;
  v13[4] = self;
  id v11 = +[HDDatabaseMigrationStep migrationStepFrom:11306 to:11307 handler:v13];
  [v3 addObject:v11];

  return v3;
}

uint64_t __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = [*(id *)(a1 + 32) transaction];
  uint64_t v6 = [v5 protectedDatabase];
  char v7 = [v6 fileURL];
  id v8 = [v7 URLByDeletingLastPathComponent];
  int v9 = [v8 URLByAppendingPathComponent:@"termbase.sqlite"];

  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v10, "hd_removeSQLiteDatabaseAtURL:preserveCopy:", v9, 0);

  id v11 = [v3 transaction];
  uint64_t v12 = [v11 protectedDatabase];

  if ([v12 deleteDataEntitySubclassTablesIfExist:&unk_1F17E9B40 intermediateTables:&unk_1F17E9B58 error:a3]&& objc_msgSend(v12, "deleteDataEntitySubclassTablesIfExist:intermediateTables:error:", &unk_1F17E9B70, &unk_1F17E9B88, a3))
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v14 = [v3 transaction];
    long long v15 = [v14 protectedDatabase];
    uint64_t v16 = [v15 dumpSchemaWithError:a3];

    if (v16)
    {
      uint64_t v29 = v12;
      uint64_t v30 = v3;
      uint64_t v31 = a3;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v17 = [&unk_1F17E9BA0 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v33;
        uint64_t v20 = (os_log_t *)MEMORY[0x1E4F29F18];
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(&unk_1F17E9BA0);
            }
            uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            if ([MEMORY[0x1E4F65D18] databaseSchemas:v16 containTable:v22])
            {
              uint64_t v23 = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", v22];
              [v13 addObject:v23];
            }
            else
            {
              _HKInitializeLogging();
              uint64_t v24 = *v20;
              if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v37 = v22;
                _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_INFO, "Skipping deletion from nonexistent table \"%@\"", buf, 0xCu);
              }
            }
          }
          uint64_t v18 = [&unk_1F17E9BA0 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v18);
      }
      char v25 = [v30 executeSQLStatements:v13 error:v31];

      if (v25)
      {
        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v26 addObject:@"CREATE TABLE medical_records (data_id INTEGER PRIMARY KEY, note TEXT, entered_in_error INTEGER NON NULL, modified_date REAL, fhir_identifier BLOB, refinement_version BLOB, sort_date REAL NON NULL, sort_date_key_path TEXT NON NULL)"];
        [v26 addObject:@"CREATE TABLE account_owner_samples (data_id INTEGER PRIMARY KEY, name TEXT NOT NULL, birth_date BLOB)"];
        [v26 addObject:@"CREATE TABLE allergy_record_samples (data_id INTEGER PRIMARY KEY, allergy_codings BLOB NOT NULL, onset_date BLOB, asserter TEXT, reactions BLOB, criticality_coding BLOB, last_occurence_date BLOB, recorded_date BLOB)"];
        [v26 addObject:@"CREATE TABLE condition_record_samples (data_id INTEGER PRIMARY KEY, condition_codings BLOB NOT NULL, category_codings BLOB NOT NULL, asserter TEXT, abatement BLOB, onset BLOB, recorded_date BLOB, clinical_status_coding BLOB, verification_status_coding BLOB, severity_codings BLOB, body_sites_codings BLOB)"];
        [v26 addObject:@"CREATE TABLE diagnostic_test_report_samples (data_id INTEGER PRIMARY KEY, diagnostic_test_codings BLOB, panel_name TEXT NOT NULL, results BLOB, effective_start_date BLOB, status BLOB NOT NULL, effective_end_date BLOB, issue_date BLOB NOT NULL)"];
        [v26 addObject:@"CREATE TABLE diagnostic_test_result_samples (data_id INTEGER PRIMARY KEY, diagnostic_test_codings BLOB NOT NULL, value BLOB, reference_ranges BLOB, effective_start_date BLOB, category TEXT NOT NULL, issue_date BLOB, effective_end_date BLOB)"];
        [v26 addObject:@"CREATE TABLE medication_dispense_record_samples (data_id INTEGER PRIMARY KEY, medication_codings BLOB NOT NULL, quantity BLOB, preparation_date BLOB, hand_over_date BLOB, dosage_instructions BLOB, status_coding BLOB)"];
        [v26 addObject:@"CREATE TABLE medication_order_samples (data_id INTEGER PRIMARY KEY, medication_codings BLOB NOT NULL, prescriber TEXT, number_of_fills INTEGER NOT NULL, signetur TEXT, written_date BLOB, ended_date BLOB)"];
        [v26 addObject:@"CREATE TABLE medication_record_samples (data_id INTEGER PRIMARY KEY, medication_codings BLOB NOT NULL, assertion_type TEXT, asserter TEXT, assertion_date BLOB, dosage TEXT, not_taken INTEGER NOT NULL, effective_start_date BLOB, effective_end_date BLOB)"];
        [v26 addObject:@"CREATE TABLE procedure_record_samples (data_id INTEGER PRIMARY KEY, procedure_codings BLOB NOT NULL, orderer TEXT, order_date BLOB, performer TEXT, organization TEXT, execution_start_date BLOB, outcome TEXT, complications BLOB NOT NULL, reasons BLOB NOT NULL, not_performed INTEGER NOT NULL, execution_end_date BLOB)"];
        [v26 addObject:@"CREATE TABLE vaccination_record_samples (data_id INTEGER PRIMARY KEY, vaccination_codings BLOB NOT NULL, expiration_date BLOB, dose_number TEXT, dose_quantity TEXT, performer TEXT, body_site_coding BLOB, reaction TEXT, not_given INTEGER NOT NULL, administration_date BLOB NOT NULL, status_coding BLOB, patient_reported INTEGER NOT NULL, route_codings BLOB, reasons_codings BLOB, reasons_not_given_codings BLOB)"];
        [v26 addObject:@"CREATE TABLE unknown_record_samples (data_id INTEGER PRIMARY KEY, display_name TEXT)"];
        [v26 addObject:@"CREATE TABLE clinical_gateways (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, external_id TEXT NOT NULL, last_reported_status INTEGER NOT NULL, revision INTEGER NOT NULL, raw_content BLOB NOT NULL, sync_anchor INTEGER NOT NULL UNIQUE, sync_provenance INTEGER NOT NULL, UNIQUE(external_id))"];
        [v26 addObject:@"CREATE TABLE clinical_accounts (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, identifier BLOB NOT NULL UNIQUE, user_enabled_flag INTEGER NOT NULL, relogin_needed_flag INTEGER NOT NULL, creation_date REAL NOT NULL, last_fetch_date REAL, last_full_fetch_date REAL, last_submitted_rowid INTEGER, last_extracted_rowid INTEGER, last_extracted_rules_version INTEGER, credential_id INTEGER REFERENCES clinical_credentials (ROWID) ON DELETE SET NULL, gateway_id INTEGER NOT NULL UNIQUE REFERENCES clinical_gateways (ROWID) ON DELETE NO ACTION, sync_identifier BLOB NOT NULL UNIQUE, modification_date REAL NOT NULL, sync_anchor INTEGER NOT NULL UNIQUE, sync_provenance INTEGER NOT NULL)"];
        [v26 addObject:@"CREATE TABLE clinical_deleted_accounts (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, sync_identifier BLOB NOT NULL, deletion_date REAL NOT NULL, sync_provenance INTEGER NOT NULL, UNIQUE(sync_identifier))"];
        [v26 addObject:@"CREATE TABLE fhir_resources (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, type TEXT NOT NULL, account_id INTEGER NOT NULL REFERENCES clinical_accounts (ROWID) ON DELETE CASCADE, id TEXT NOT NULL, sync_provenance INTEGER NOT NULL, raw_content BLOB NOT NULL, fhir_version TEXT NOT NULL, received_date REAL NOT NULL, received_date_timezone TEXT NOT NULL, UNIQUE(type, account_id, id))"];
        [v26 addObject:@"CREATE TABLE clinical_credentials (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, access_token BLOB NOT NULL, token_type TEXT NOT NULL, refresh_token BLOB, expiration_date REAL, scope TEXT, patient_id TEXT, creation_date REAL NOT NULL)"];
        [v26 addObject:@"CREATE TABLE clinical_authorization_sessions (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, query TEXT NOT NULL, state BLOB NOT NULL UNIQUE, code TEXT, creation_date REAL NOT NULL, gateway_id INTEGER REFERENCES clinical_gateways (ROWID) ON DELETE CASCADE, account_id INTEGER REFERENCES clinical_accounts (ROWID) ON DELETE CASCADE, CHECK ((account_id IS NULL AND gateway_id IS NOT NULL) OR (account_id IS NOT NULL AND gateway_id IS NULL)))"];
        int v27 = [v30 executeSQLStatements:v26 error:v31];

        return v27 ^ 1u;
      }
      return 1;
    }
  }
  return 1;
}

uint64_t __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  uint64_t v6 = [v3 transaction];
  char v7 = [v6 protectedDatabase];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__HDDatabaseMigrator_Emet___emet_migrateWorkoutEventMetadataToProtobufWithError___block_invoke;
  v11[3] = &unk_1E62F3D60;
  id v12 = v5;
  id v13 = v3;
  id v8 = v5;
  LODWORD(a3) = [v7 executeSQL:@"SELECT rowid, metadata FROM workout_events WHERE metadata IS NOT NULL", a3, 0, v11 error bindingHandler enumerationHandler];

  uint64_t v9 = a3 ^ 1;
  return v9;
}

uint64_t __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  if (!-[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](*(void **)(a1 + 32), @"medical_records", &unk_1F17E9AC8, @"CREATE TABLE medical_records (data_id INTEGER PRIMARY KEY, note TEXT, entered_in_error INTEGER NON NULL, modified_date REAL, fhir_identifier TEXT NON NULL, extraction_version INTEGER NON NULL, sort_date REAL NON NULL, sort_date_key_path TEXT NON NULL)", a3))return 1; {
  long long v16 = 0u;
  }
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(&unk_1F17EF6E8, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [&unk_1F17EF6E8 objectForKeyedSubscript:v10];
        LODWORD(v10) = -[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](v3, v10, &unk_1F17E9AE0, v11, a3);

        if (!v10)
        {
          uint64_t v12 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_14:

  return v12;
}

void *__55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(-[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](result, @"procedure_record_samples", &unk_1F17E9AF8, @"CREATE TABLE procedure_record_samples (data_id INTEGER PRIMARY KEY, procedure_codings BLOB NOT NULL, performers BLOB, execution_start_date BLOB, execution_end_date BLOB, not_performed INTEGER NOT NULL, status_coding BLOB NOT NULL, category_codings BLOB, reason_codings BLOB, reasons_not_performed_codings BLOB, outcome_codings BLOB, complications_codings BLOB, follow_ups_codings BLOB, body_sites_codings BLOB)", a3) ^ 1);
  }
  return result;
}

void *__55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(-[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](result, @"diagnostic_test_result_samples", &unk_1F17E9B10, @"CREATE TABLE IF NOT EXISTS diagnostic_test_result_samples (data_id INTEGER PRIMARY KEY, diagnostic_test_codings BLOB NOT NULL, value BLOB, reference_ranges BLOB, effective_start_date BLOB, category TEXT NOT NULL, issue_date BLOB, effective_end_date BLOB, status_coding BLOB NOT NULL, interpretation_codings BLOB, comments TEXT, body_site_codings BLOB, method_codings BLOB, performers BLOB)", a3) ^ 1);
  }
  return result;
}

uint64_t __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE fhir_resources ADD COLUMN source_url TEXT"];
  [v5 addObject:@"ALTER TABLE fhir_resources ADD COLUMN extraction_hints INTEGER"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS fhir_resources_last_seen (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, resource_id INTEGER NOT NULL REFERENCES fhir_resources(ROWID) ON DELETE CASCADE, last_seen_date REAL NOT NULL)"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  if (-[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](*(void **)(a1 + 32), @"medication_record_samples", &unk_1F17E9B28, @"CREATE TABLE medication_record_samples (data_id INTEGER PRIMARY KEY, medication_codings BLOB NOT NULL, assertion_type INTEGER NOT NULL, asserter TEXT, assertion_date BLOB, status_coding BLOB NOT NULL, dosages BLOB, reason_for_use_codings BLOB, not_taken INTEGER NOT NULL, reasons_not_taken_codings BLOB, effective_start_date BLOB, effective_end_date BLOB, earliest_dosage_date BLOB)", a3)&& -[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](v3, @"medication_dispense_record_samples", &unk_1F17E9B28, @"CREATE TABLE medication_dispense_record_samples (data_id INTEGER PRIMARY KEY, medication_codings BLOB NOT NULL, quantity_dispensed BLOB, preparation_date BLOB, hand_over_date BLOB, dosages BLOB, earliest_dosage_date BLOB, status_coding BLOB, days_supply_quantity BLOB)", a3))
  {
    return -[HDDatabaseMigrator _recreateMedicalRecordTable:intermediateTables:creationSQL:error:](v3, @"medication_order_samples", &unk_1F17E9B28, @"CREATE TABLE medication_order_samples (data_id INTEGER PRIMARY KEY, medication_codings BLOB NOT NULL, prescriber TEXT, number_of_fills INTEGER NOT NULL, dosages BLOB, earliest_dosage_date BLOB, written_date BLOB, ended_date BLOB, status_coding BLOB NOT NULL, reason_codings BLOB, reason_ended_codings BLOB)", a3) ^ 1;
  }
  return 1;
}

void *__55__HDDatabaseMigrator_Emet__emetProtectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"ALTER TABLE clinical_accounts ADD patient_hash TEXT" error:a3] ^ 1);
  }
  return result;
}

uint64_t __81__HDDatabaseMigrator_Emet___emet_migrateWorkoutEventMetadataToProtobufWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = HDSQLiteColumnAsInt64();
  uint64_t v7 = MEMORY[0x1C1879F20](a2, 1);
  id v25 = 0;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v7 error:&v25];
  id v9 = v25;
  uint64_t v10 = *MEMORY[0x1E4F284E8];
  if ([v8 containsValueForKey:*MEMORY[0x1E4F284E8]])
  {
    id v11 = [v8 decodeObjectOfClasses:*(void *)(a1 + 32) forKey:v10];
    uint64_t v12 = [v8 error];

    id v9 = (id)v12;
  }
  else
  {
    id v11 = 0;
  }
  [v8 finishDecoding];
  if (!v9)
  {
    if ([v11 count])
    {
      long long v16 = objc_msgSend(v11, "hk_codableMetadata");
      if (!v16)
      {
        _HKInitializeLogging();
        long long v17 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v27 = v6;
          _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "Failed to create codable workout event metadata for %lld", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to create codable workout event metadata");
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          if (a3) {
            *a3 = v18;
          }
          else {
            _HKLogDroppedError();
          }
        }

        goto LABEL_21;
      }
    }
    else
    {
      long long v16 = 0;
    }
    uint64_t v19 = [*(id *)(a1 + 40) transaction];
    uint64_t v20 = [v19 protectedDatabase];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__HDDatabaseMigrator_Emet___emet_migrateWorkoutEventMetadataToProtobufWithError___block_invoke_306;
    v22[3] = &unk_1E62F33F8;
    id v14 = v16;
    id v23 = v14;
    uint64_t v24 = v6;
    uint64_t v15 = [v20 executeSQL:@"UPDATE workout_events SET metadata = ? WHERE rowid = ?" error:a3 bindingHandler:v22 enumerationHandler:0];

    goto LABEL_22;
  }
  _HKInitializeLogging();
  id v13 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v27 = v6;
    __int16 v28 = 2114;
    id v29 = v9;
    _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "Failed to unarchive workout event metadata for %lld: %{public}@", buf, 0x16u);
  }
  if (!a3)
  {
    _HKLogDroppedError();
LABEL_21:
    id v14 = 0;
    uint64_t v15 = 0;
    goto LABEL_22;
  }
  id v14 = 0;
  uint64_t v15 = 0;
  *a3 = v9;
LABEL_22:

  return v15;
}

uint64_t __81__HDDatabaseMigrator_Emet___emet_migrateWorkoutEventMetadataToProtobufWithError___block_invoke_306(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = [v4 data];
    HDSQLiteBindFoundationValueToStatement();
  }
  else
  {
    sqlite3_bind_null(a2, 1);
  }
  sqlite3_int64 v6 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v6);
}

- (uint64_t)_recreateMedicalRecordTable:(void *)a3 intermediateTables:(void *)a4 creationSQL:(uint64_t)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [NSString stringWithFormat:@"SELECT uuid, provenance, data_type FROM %@ INNER JOIN objects USING (data_id) INNER JOIN samples USING (data_id)", v9];
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  id v14 = [a1 transaction];
  uint64_t v15 = [v14 protectedDatabase];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __93__HDDatabaseMigrator_Emet___recreateMedicalRecordTable_intermediateTables_creationSQL_error___block_invoke;
  v23[3] = &unk_1E62F3D60;
  v23[4] = a1;
  id v24 = v13;
  id v16 = v13;
  int v17 = [v15 executeSQL:v12 error:a5 bindingHandler:0 enumerationHandler:v23];

  if (v17
    && ([a1 transaction],
        id v18 = objc_claimAutoreleasedReturnValue(),
        [v18 protectedDatabase],
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        int v20 = [v19 deleteDataEntitySubclassTable:v9 intermediateTables:v10 error:a5],
        v19,
        v18,
        v20))
  {
    uint64_t v21 = [a1 executeSQL:v11 error:a5];
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

uint64_t __93__HDDatabaseMigrator_Emet___recreateMedicalRecordTable_intermediateTables_creationSQL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v6 = MEMORY[0x1C1879F90](a2, 0);
  uint64_t v7 = MEMORY[0x1C1879F70](a2, 1);
  uint64_t v8 = MEMORY[0x1C1879F70](a2, 2);
  id v10 = *(void **)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v11 = v8;
  if (v10)
  {
    id v12 = v6;
    uint64_t v36 = v7;
    id v13 = v7;
    id v14 = v9;
    uint64_t v15 = [v10 transaction];
    id v16 = [v15 protectedDatabase];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __120__HDDatabaseMigrator_Emet___insertDeletedObjectTombstoneWithUUID_provenanceIdentifier_deletionDate_insertedRowID_error___block_invoke;
    v44[3] = &unk_1E62F43C8;
    id v17 = v12;
    id v45 = v17;
    int v18 = [v16 executeSQL:@"DELETE FROM objects where uuid = ?" error:a3 bindingHandler:v44 enumerationHandler:0];

    if (v18)
    {
      uint64_t v19 = [v10 transaction];
      int v20 = [v19 protectedDatabase];
      uint64_t v37 = MEMORY[0x1E4F143A8];
      uint64_t v38 = 3221225472;
      uint64_t v39 = __120__HDDatabaseMigrator_Emet___insertDeletedObjectTombstoneWithUUID_provenanceIdentifier_deletionDate_insertedRowID_error___block_invoke_2;
      uint64_t v40 = &unk_1E62F2DF0;
      id v41 = v17;
      id v42 = v13;
      id v43 = v14;
      int v21 = objc_msgSend(v20, "executeSQL:error:bindingHandler:enumerationHandler:", @"INSERT INTO objects (uuid, provenance, type, creation_date) VALUES (?, ?, ?, ?);",
              a3,
              &v37,
              0);

      id v22 = 0;
      if (v21)
      {
        id v23 = [v10 transaction];
        [v23 protectedDatabase];
        id v35 = v14;
        id v24 = v13;
        id v25 = v11;
        uint64_t v26 = a3;
        v28 = uint64_t v27 = v6;
        id v22 = [v28 lastInsertRowID];

        sqlite3_int64 v6 = v27;
        a3 = v26;
        id v11 = v25;
        id v13 = v24;
        id v14 = v35;
      }
    }
    else
    {
      id v22 = 0;
      int v21 = 0;
    }

    id v29 = v22;
    if (v21)
    {
      uint64_t v30 = [v10 transaction];
      [v30 protectedDatabase];
      v32 = uint64_t v31 = v6;
      uint64_t v37 = MEMORY[0x1E4F143A8];
      uint64_t v38 = 3221225472;
      uint64_t v39 = __119__HDDatabaseMigrator_Emet___insertDeletedSampleTombstoneWithUUID_provenanceIdentifier_dataTypeCode_deletionDate_error___block_invoke;
      uint64_t v40 = &unk_1E62F2900;
      id v41 = v29;
      id v42 = v11;
      uint64_t v33 = objc_msgSend(v32, "executeSQL:error:bindingHandler:enumerationHandler:", @"INSERT INTO samples (data_id, data_type, start_date, end_date) VALUES (?, ?, ?, ?);",
              a3,
              &v37,
              0);

      sqlite3_int64 v6 = v31;
    }
    else
    {
      uint64_t v33 = 0;
    }
    uint64_t v7 = v36;
  }
  else
  {
    uint64_t v33 = 0;
  }

  return v33;
}

uint64_t __119__HDDatabaseMigrator_Emet___insertDeletedSampleTombstoneWithUUID_provenanceIdentifier_dataTypeCode_deletionDate_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_null(a2, 3);

  return sqlite3_bind_null(a2, 4);
}

uint64_t __120__HDDatabaseMigrator_Emet___insertDeletedObjectTombstoneWithUUID_provenanceIdentifier_deletionDate_insertedRowID_error___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __120__HDDatabaseMigrator_Emet___insertDeletedObjectTombstoneWithUUID_provenanceIdentifier_deletionDate_insertedRowID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, 2);

  return HDSQLiteBindFoundationValueToStatement();
}

- (void)sky_addUnprotectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:15000 function:_HDAddCloudSyncStoreShardColumns];
  [(HDDatabaseMigrator *)self addMigrationTo:15001 function:_HDAddCKRecordCacheTables];
  [(HDDatabaseMigrator *)self addMigrationTo:15002 function:_HDAddOnboardingCompletionsCountryCodeProvenanceColumn];
  [(HDDatabaseMigrator *)self addMigrationTo:15003 function:_HDAddAppSDKVersionFlagColumn];
  [(HDDatabaseMigrator *)self addMigrationTo:15004 function:_HDAddNeedsFetchColumnToCachedCKRecordZoneEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:15005 function:_HDResetUnprotectedCKRecordCache];
  [(HDDatabaseMigrator *)self addMigrationTo:15006 function:_HDAddZoneStateColumnToCachedCKRecordZoneEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:15007 function:_HDAddUserRecordIDToCKDatabaseCache foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:15500 function:_HDAddEpochManagementForCloudCache];
  [(HDDatabaseMigrator *)self addMigrationTo:15501 function:_HDAddWorkoutBuilderActivitiesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15502 function:_HDFixWorkoutBuilderActivitiesForeignKey];
  [(HDDatabaseMigrator *)self addMigrationTo:15503 function:_HDMakeWorkoutBuilderActivityEndDateNullable];

  [(HDDatabaseMigrator *)self addMigrationTo:15504 function:_HDResetUnprotectedInconsistentCloudCache];
}

- (void)sky_addProtectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:15000 function:_HDRemoveOtherCardioFitnessMedications];
  [(HDDatabaseMigrator *)self addMigrationTo:15001 function:_HDAddAdHocConceptTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15002 function:_HDAddSecureCKRecordCacheTables];
  [(HDDatabaseMigrator *)self addMigrationTo:15003 function:_HDUpdateMedicalRecordsDiagnosticResultTableAddReferenceRangeStatus];
  [(HDDatabaseMigrator *)self addMigrationTo:15004 function:_HDRecreateCHRMedicationTables];
  [(HDDatabaseMigrator *)self addMigrationTo:15005 function:_HDAddSampleAggregateCacheEntitiesTables];
  [(HDDatabaseMigrator *)self addMigrationTo:15006 function:_HDUpdateAllergyRecordSamplesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15007 function:_HDAddUserDomainConceptEntities];
  [(HDDatabaseMigrator *)self addMigrationTo:15008 function:_HDAddSharingAuthorizationAndRelationshipTables];
  [(HDDatabaseMigrator *)self addMigrationTo:15009 function:_HDAddAnchorDateToCachedQueriesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15010 function:_HDAddSummarySharingTables];
  [(HDDatabaseMigrator *)self addMigrationTo:15011 function:_HDAddQuantitySeriesDataTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15012 function:_HDAddLocationSeriesDataTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15013 function:_HDAddSignedClinicalDataIssuerEntitiesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15014 function:_HDUpdateClinicalAccountsTableForIssuerBackingAndOsloStatus foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:15015 function:_HDAddOriginalSignedClinicalDataRecordEntitiesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15016 function:_HDAddSignedClinicalDataRecordEntitiesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15018 function:_HDUpdateMedicalRecordEntitiesTableForSCD];
  [(HDDatabaseMigrator *)self addMigrationTo:15019 function:_HDAddSessionColumnToObjectAuthorizationsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15020 function:_HDAddDateAcceptedToSummarySharingEntryTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15021 function:_HDPurgeDeletedUserDomainConcepts];
  [(HDDatabaseMigrator *)self addMigrationTo:15022 function:_HDAddClinicalAccountColumnsForFetchFailureTracking];
  [(HDDatabaseMigrator *)self addMigrationTo:15023 function:_HDRemoveDeletedAndSyncedColumnFromSharedSummaryTransactionsTable foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:15024 function:_HDAddCategoryColumnToUserDomainConceptPropertyTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15025 function:_HDAddDisplayNameAndRenameAuthorizationsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15026 function:_HDRenameSignedClinicalDataToVerifiableClinicalRecordsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15027 function:_HDAddUniquenessChecksumToOriginalSignedClinicalDataTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15028 function:_HDUpdateRecordSamplesAddReferenceColumn];
  [(HDDatabaseMigrator *)self addMigrationTo:15029 function:_HDAddInvitationUUIDToSummarySharingEntryTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15030 function:_HDAddRelevantDateAndDataValueToSignedClinicalDataTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15031 function:_HDRemoveInvitationNotNullConstraintFromSummarySharingEntryTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15032 function:_HDAddOwnerParticipantToSummarySharingEntryTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15033 function:_HDAddNotificationStatusToSummarySharingEntryTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15034 function:_HDResetProtectedCKRecordCache];
  [(HDDatabaseMigrator *)self addMigrationTo:15035 function:_HDAddDeletedAndLastModifiedDateColumnsToOriginalSignedClinicalDataTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15036 function:_HDMigrateCycleTrackingOnboarding];
  [(HDDatabaseMigrator *)self addMigrationTo:15037 function:_HDResetProtectedCKRecordCache];
  [(HDDatabaseMigrator *)self addMigrationTo:15038 function:_HDDeleteMedicalRecordsDiagnosticResultTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15039 function:_HDAddForeignKeyReferenceFromConceptIndexToObjects];
  [(HDDatabaseMigrator *)self addMigrationTo:15040 function:_HDClearResumableQueryCache];
  [(HDDatabaseMigrator *)self addMigrationTo:15041 function:_HDAddToBeDeletedColumnToSharingAuthorizationsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15042 function:_HDMakeOriginalRecordsRawContentNullable];
  [(HDDatabaseMigrator *)self addMigrationTo:15043 function:_HDAddUserWheelchairModeColumnToSummarySharingEntryTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15200 function:_HDAddDeletedColumnToClinicalCredentials];
  [(HDDatabaseMigrator *)self addMigrationTo:15500 function:_HDAddWorkoutActivitiesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15502 function:_HDRenameWorkoutActivityForeignKey];
  [(HDDatabaseMigrator *)self addMigrationTo:15504 function:_HDFixWorkoutActivityForeignKey];
  [(HDDatabaseMigrator *)self addMigrationTo:15506 function:_HDSourceTypeToSignedClinicalDataTables];
  [(HDDatabaseMigrator *)self addMigrationTo:15507 function:_HDAddAttachmentAndReferencesEntities];
  [(HDDatabaseMigrator *)self addMigrationTo:15509 function:_HDAddVisionPrescriptionEntityTable];
  [(HDDatabaseMigrator *)self addMigrationTo:15510 function:_HDAddLotNumberToVaccinationRecordSamplesTable];

  [(HDDatabaseMigrator *)self addMigrationTo:15511 function:_HDResetProtectedInconsistentCloudCache];
}

- (id)butlerUnprotectedMigrationSteps
{
  return (id)[MEMORY[0x1E4F1CA48] array];
}

- (id)butlerProtectedMigrationSteps
{
  sqlite3_int64 v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HDDatabaseMigrator_Butler__butlerProtectedMigrationSteps__block_invoke;
  v6[3] = &unk_1E62F5250;
  v6[4] = self;
  sqlite3_int64 v4 = HDCreateMigrationStep(10037, 10100, (uint64_t)v6);
  [v3 addObject:v4];

  return v3;
}

uint64_t __59__HDDatabaseMigrator_Butler__butlerProtectedMigrationSteps__block_invoke()
{
  return 0;
}

- (void)dawn_addUnprotectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:17000 function:_HDAddDeviceContextTable];
  [(HDDatabaseMigrator *)self addMigrationTo:17001 function:_HDAddUnprotectedDeviceKeyValueStorageTable];
  [(HDDatabaseMigrator *)self addMigrationTo:17002 function:_HDAddIsMirroringToWorkoutSessionTable];
  [(HDDatabaseMigrator *)self addMigrationTo:17004 function:_HDMigrateCycleTrackingOvulationConfirmationNotificationStateKeyValueDomainCategory];
  [(HDDatabaseMigrator *)self addMigrationTo:17005 function:_HDMigrateCycleTrackingUnconfirmedDeviationNotificationStateKeyValueDomainCategory];
  [(HDDatabaseMigrator *)self addMigrationTo:17006 function:_HDMigrateCycleTrackingUpdatedFertileWindowNotificationFireDateKeyValueDomainCategory];
  [(HDDatabaseMigrator *)self addMigrationTo:17007 function:_HDAddChildSyncIdentityTable];
  [(HDDatabaseMigrator *)self addMigrationTo:17008 function:_HDResetAnchorsForAssociationsForNanoSync];
  [(HDDatabaseMigrator *)self addMigrationTo:17009 function:_HDAddNotificationInstructionsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:17010 function:_HDAddTableForCloudSyncRequests];
  [(HDDatabaseMigrator *)self addMigrationTo:17011 function:_HDAddFirstActivityConfigToWorkoutSessionsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:17012 function:_HDResetLocalDeviceSource];

  [(HDDatabaseMigrator *)self addMigrationTo:17200 function:_HDAddAdditionalColumnsToCloudSyncRequests];
}

- (void)dawn_addProtectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:17000 function:_HDAddLinkCollectionDataColumnToUDCTable];
  [(HDDatabaseMigrator *)self addMigrationTo:17001 function:_HDAddProtectedDeviceKeyValueStorageTable];
  [(HDDatabaseMigrator *)self addMigrationTo:17002 function:_HDAddWorkoutZonesSamplesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:17003 function:_HDAddWorkoutZonesAssociationsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:17004 function:_HDMigrateCycleTrackingKeyValueDomainCategory];
  [(HDDatabaseMigrator *)self addMigrationTo:17005 function:_HDAddHashedMedicationIdentifierToMedicationDoseEventTable];
  [(HDDatabaseMigrator *)self addMigrationTo:17006 function:_HDAddStateOfMindSamplesTables];
  [(HDDatabaseMigrator *)self addMigrationTo:17007 function:_HDAddScoredAssessmentSamplesTables];
  [(HDDatabaseMigrator *)self addMigrationTo:17008 function:_HDRemoveOnDeleteCascadeFromAssociationsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:17009 function:_HDMigrateClinicalAccountSyncAnchors foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:17010 function:_HDMigrateClinicalGatewaySyncAnchors];
  [(HDDatabaseMigrator *)self addMigrationTo:17011 function:_HDMigrateOriginalResources foreignKeys:1];

  [(HDDatabaseMigrator *)self addMigrationTo:17012 function:_HDMigrateOriginalSignedClinicalDataRecords foreignKeys:1];
}

- (void)crystal_addUnprotectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:18000 function:_HDResetAllReceivedSyncAnchorsOnVisionDevices];
  [(HDDatabaseMigrator *)self addMigrationTo:18001 function:_HDAddClientOptionsToAlarmEventsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:18003 function:_HDAddLastAssociationAnchorToSubscriptions];
  [(HDDatabaseMigrator *)self addMigrationTo:18004 function:_HDResetReceivedNanoSyncAnchorsOnWatchForActivityCache];
  [(HDDatabaseMigrator *)self addMigrationTo:18005 function:_HDResetReceivedNanoSyncAnchorsOnWatch];
  [(HDDatabaseMigrator *)self addMigrationTo:18006 function:_HDUpdateSDKVersionTokenFieldOnSubscriptionsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:18200 function:_HDAddPendingFullSyncColumnToCloudSyncStoresTable];

  [(HDDatabaseMigrator *)self addMigrationTo:18201 function:_HDResetAnchorsForAssociationsForNanoSync_0];
}

- (void)crystal_addProtectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:18000 function:_HDAddRPEFieldsToAssociationsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:18001 function:_HDAddPauseRingsScheduleTable];
  [(HDDatabaseMigrator *)self addMigrationTo:18002 function:_HDAddPauseColumnToActivityCache];
  [(HDDatabaseMigrator *)self addMigrationTo:18003 function:_HDAddActivityGoalSchedulesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:18005 function:_HDUpdateTypeAndCreationDateFieldOnAssociationsTableForWorkoutEffortChildren];

  [(HDDatabaseMigrator *)self addMigrationTo:18006 function:_HDUpdateTypeAndCreationDateFieldOnAssociationsTableForNonWorkoutEffortChildren];
}

- (id)cinarUnprotectedMigrationSteps
{
  sqlite3_int64 v3 = [MEMORY[0x1E4F1CA48] array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke;
  v12[3] = &unk_1E62F5250;
  v12[4] = self;
  sqlite3_int64 v4 = +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:11013 to:11200 handler:v12];
  [v3 addObject:v4];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke_2;
  v11[3] = &unk_1E62F5250;
  void v11[4] = self;
  id v5 = +[HDDatabaseMigrationStep migrationStepFrom:11200 to:11201 handler:v11];
  [v3 addObject:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke_3;
  v10[3] = &unk_1E62F5250;
  v10[4] = self;
  sqlite3_int64 v6 = +[HDDatabaseMigrationStep migrationStepFrom:11201 to:11202 handler:v10];
  [v3 addObject:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke_4;
  v9[3] = &unk_1E62F5250;
  v9[4] = self;
  uint64_t v7 = +[HDDatabaseMigrationStep migrationStepFrom:11202 to:11203 handler:v9];
  [v3 addObject:v7];

  return v3;
}

uint64_t __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v18 addObject:@"ALTER TABLE sources RENAME TO sources_old;"];
  [v18 addObject:@"CREATE TABLE IF NOT EXISTS sources (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB UNIQUE NOT NULL, bundle_id TEXT NOT NULL, name TEXT NOT NULL, source_options INTEGER NOT NULL, local_device INTEGER NOT NULL, product_type TEXT NOT NULL, deleted INTEGER NOT NULL, mod_date REAL NOT NULL, provenance INTEGER NOT NULL, sync_anchor INTEGER NOT NULL UNIQUE, sync_primary INTEGER NOT NULL);"];
  [v18 addObject:@"INSERT INTO sources SELECT ROWID, uuid, bundle_id, name, source_options, local_device, product_type, deleted, mod_date, provenance, sync_anchor, 0 FROM sources_old;"];
  [v18 addObject:@"DROP TABLE sources_old;"];
  [v18 addObject:@"UPDATE sources SET sync_primary = 1 WHERE deleted = 1;"];
  if ([v3 executeSQLStatements:v18 error:a3])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sqlite3_int64 v6 = objc_msgSend(v3, "transaction", v5);
    uint64_t v7 = [v6 unprotectedDatabase];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __75__HDDatabaseMigrator_Cinar___cinar_addSyncPrimaryColumnToSourcesWithError___block_invoke;
    v25[3] = &unk_1E6304398;
    id v17 = v5;
    id v26 = v17;
    char v8 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", @"SELECT ROWID, bundle_id, (provenance <> 0) as is_remote FROM sources WHERE deleted = 0 ORDER BY bundle_id, is_remote, ROWID;",
           a3,
           0,
           v25);

    if (v8)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = [v17 allValues];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v22;
        uint64_t v19 = 1;
LABEL_6:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
          id v14 = [v3 transaction];
          uint64_t v15 = [v14 unprotectedDatabase];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __75__HDDatabaseMigrator_Cinar___cinar_addSyncPrimaryColumnToSourcesWithError___block_invoke_2;
          v20[3] = &unk_1E62F52C8;
          v20[4] = v13;
          LOBYTE(v13) = objc_msgSend(v15, "executeSQL:error:bindingHandler:enumerationHandler:", @"UPDATE sources SET sync_primary = 1 WHERE ROWID = ?;",
                          a3,
                          v20,
                          0);

          if ((v13 & 1) == 0) {
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
            if (v10) {
              goto LABEL_6;
            }
            uint64_t v19 = 0;
            break;
          }
        }
      }
      else
      {
        uint64_t v19 = 0;
      }
    }
    else
    {
      uint64_t v19 = 1;
    }
  }
  else
  {
    uint64_t v19 = 1;
  }

  return v19;
}

void *__59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"UPDATE sources SET bundle_id = '', name = '', product_type = '', source_options = 0 WHERE deleted = 1;",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"DROP INDEX IF EXISTS sources_bundle_id_uuid"];
  [v5 addObject:@"CREATE INDEX sources_bundle_id_uuid ON sources (bundle_id, uuid)"];
  [v5 addObject:@"DROP INDEX IF EXISTS datatype_source_order_data_type"];
  [v5 addObject:@"CREATE INDEX datatype_source_order_data_type ON datatype_source_order (data_type, ROWID)"];
  [v5 addObject:@"ALTER TABLE source_devices RENAME TO source_devices_old;"];
  [v5 addObject:@"CREATE TABLE source_devices (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, manufacturer TEXT NOT NULL, model TEXT NOT NULL, hardware TEXT NOT NULL, firmware TEXT NOT NULL, software TEXT NOT NULL, localIdentifier TEXT NOT NULL, FDAUDI TEXT NOT NULL, creation_date REAL NOT NULL, sync_provenance INTEGER NOT NULL, uuid BLOB UNIQUE NOT NULL, UNIQUE(name, manufacturer, model, hardware, firmware, software, localIdentifier, FDAUDI, sync_provenance, uuid));"];
  [v5 addObject:@"INSERT OR REPLACE INTO source_devices (ROWID, name, manufacturer, model, hardware, firmware, software, localIdentifier, FDAUDI, creation_date, sync_provenance, uuid) SELECT * FROM source_devices_old;"];
  [v5 addObject:@"DROP TABLE source_devices_old;"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __59__HDDatabaseMigrator_Cinar__cinarUnprotectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [v3 transaction];
  uint64_t v6 = [v5 unprotectedDatabase];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __82__HDDatabaseMigrator_Cinar___cinar_convertLocalDevicePlaceholderSourcesWithError___block_invoke;
  v27[3] = &unk_1E6304398;
  id v19 = v17;
  id v28 = v19;
  char v7 = [v6 executeSQL:@"SELECT rowid FROM sources WHERE bundle_id LIKE 'com.apple.private.health.localdevice'" error:a3 bindingHandler:0 enumerationHandler:v27];

  if (v7)
  {
    long long v21 = [NSString stringWithFormat:@"UPDATE sources SET bundle_id = 'com.apple.health.' || %@(uuid), sync_anchor = COALESCE((SELECT MAX(sync_anchor) + 1 FROM sources), 1) WHERE rowid = ?", *MEMORY[0x1E4F65C90]];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v19;
    uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      uint64_t v18 = 1;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __82__HDDatabaseMigrator_Cinar___cinar_convertLocalDevicePlaceholderSourcesWithError___block_invoke_2;
        aBlock[3] = &unk_1E62F52C8;
        aBlock[4] = v11;
        uint64_t v12 = _Block_copy(aBlock);
        uint64_t v13 = [v3 transaction];
        id v14 = [v13 unprotectedDatabase];
        char v15 = [v14 executeSQL:v21 error:a3 bindingHandler:v12 enumerationHandler:0];

        if ((v15 & 1) == 0) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 1;
  }

  return v18;
}

uint64_t __75__HDDatabaseMigrator_Cinar___cinar_addSyncPrimaryColumnToSourcesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = HDSQLiteColumnAsInt64();
  id v5 = MEMORY[0x1C1879F80](a2, 1);
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  if (!v6)
  {
    char v7 = [NSNumber numberWithLongLong:v4];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
  }
  return 1;
}

uint64_t __75__HDDatabaseMigrator_Cinar___cinar_addSyncPrimaryColumnToSourcesWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) longLongValue];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __82__HDDatabaseMigrator_Cinar___cinar_convertLocalDevicePlaceholderSourcesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  sqlite3_int64 v3 = MEMORY[0x1C1879F70](a2, 0);
  [v2 addObject:v3];

  return 1;
}

uint64_t __82__HDDatabaseMigrator_Cinar___cinar_convertLocalDevicePlaceholderSourcesWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) longLongValue];

  return sqlite3_bind_int64(a2, 1, v3);
}

- (id)cinarProtectedMigrationSteps
{
  sqlite3_int64 v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HDDatabaseMigrator_Cinar__cinarProtectedMigrationSteps__block_invoke;
  v6[3] = &unk_1E62F5250;
  v6[4] = self;
  uint64_t v4 = +[HDDatabaseMigrationStep migrationStepFrom:11051 to:11200 handler:v6];
  [v3 addObject:v4];

  return v3;
}

uint64_t __57__HDDatabaseMigrator_Cinar__cinarProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE object_authorizations RENAME TO object_authorizations_old;"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS object_authorizations (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, object BLOB NOT NULL REFERENCES objects (uuid) ON DELETE CASCADE, source BLOB NOT NULL, status INTEGER NOT NULL, sync_provenance INTEGER NOT NULL, modification_date REAL NOT NULL, UNIQUE(object, source, sync_provenance));"];
  [v5 addObject:@"INSERT OR REPLACE INTO object_authorizations (ROWID, object, source, status, sync_provenance, modification_date) SELECT * FROM object_authorizations_old ORDER BY ROWID;"];
  [v5 addObject:@"DROP TABLE object_authorizations_old"];
  [v5 addObject:@"CREATE INDEX IF NOT EXISTS activity_caches_cache_index ON activity_caches (cache_index);"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

- (void)sydney_addUnprotectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:16000 function:_HDAddVersionFieldsToSyncAnchorEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16001 function:_HDResetWorkoutSyncAnchors];
  [(HDDatabaseMigrator *)self addMigrationTo:16002 function:_HDChangeForeignKeyOnBuilderStatisticsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16003 function:_HDAddSyncIdentityTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16004 function:_HDAddLogicalSourceEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16005 function:_HDAddWorkoutAssociatedObjectTimestampColumn];
  [(HDDatabaseMigrator *)self addMigrationTo:16006 function:_HDAddLogicalSourceOrderEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16007 function:_HDAddMultiActivityFieldsToWorkoutSessionsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16008 function:_HDValidatedAnchorsToSyncAnchorEntityTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16009 function:_HDAddRequestedDatesToWorkoutSessionsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16010 function:_HDAddUnprotectedWorkoutOwnerIndices];
  [(HDDatabaseMigrator *)self addMigrationTo:16011 function:_HDRefactorSourcesToAddLogicalSourceID foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16012 function:_HDSwapDataTypeSourceOrderToLogicalSourceOrder];
  [(HDDatabaseMigrator *)self addMigrationTo:16013 function:_HDAddSourceIndices];
  [(HDDatabaseMigrator *)self addMigrationTo:16014 function:_HDAddLegacySyncIdentityToSyncIdentityTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16015 function:_HDSyncIdentityUpdateForDeviceEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16016 function:_HDSyncIdentityUpdateForSourceEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16017 function:_IncrementSourceOrderSyncAnchors];
  [(HDDatabaseMigrator *)self addMigrationTo:16200 function:_HDSyncIdentityUpdateForLogicalSourceOrderEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16201 function:_HDSyncIdentityUpdateForAuthorizationEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16202 function:_HDSyncIdentityUpdateForOnboardingCompletionEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16203 function:_HDSyncIdentityUpdateForUnProtectedKeyValueEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16204 function:_HDResetAllReceivedSyncAnchors];
  [(HDDatabaseMigrator *)self addMigrationTo:16400 function:_HDAddSyncIdentityToCloudSyncStoreEntity];

  [(HDDatabaseMigrator *)self addMigrationTo:16500 function:_HDResetAnchorsForAssociationsForNanoSync_1];
}

- (void)sydney_addProtectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:16000 function:_HDAddAttachmentAndReferencesEntities_0];
  [(HDDatabaseMigrator *)self addMigrationTo:16001 function:_HDAddVisionPrescriptionEntityTable_0];
  [(HDDatabaseMigrator *)self addMigrationTo:16002 function:_HDAddWorkoutStatisticsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16003 function:_HDCopyWorkoutTotalsToPrimaryActivity];
  [(HDDatabaseMigrator *)self addMigrationTo:16004 function:_HDAddUDCLocalizedStringTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16005 function:_HDModifyConceptIndexTableOntologyVersionColumn];
  [(HDDatabaseMigrator *)self addMigrationTo:16006 function:_HDAddSyncProvenanceToCredentialsTable foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16007 function:_HDAddClinicalAccountEventsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16008 function:_HDAddMedicationDoseEventSamplesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16009 function:_HDFixWorkoutStatisticsForeignKey];
  [(HDDatabaseMigrator *)self addMigrationTo:16010 function:_HDAddMedicationUUIDToMedicationDoseEventSamplesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16011 function:_HDAddAttachmentMetadata];
  [(HDDatabaseMigrator *)self addMigrationTo:16012 function:_HDAddAttachmentEncryptionKeyColumn];
  [(HDDatabaseMigrator *)self addMigrationTo:16013 function:_HDAddDisplaySubtitleColumn];
  [(HDDatabaseMigrator *)self addMigrationTo:16014 function:_HDAddNotNullConstraintsToAttachmentsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16015 function:_HDAddProtectedWorkoutOwnerIndices];
  [(HDDatabaseMigrator *)self addMigrationTo:16016 function:_HDFixLapLengthColumnInActivitiesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16017 function:_HDDeleteHearingReductionSamples];
  [(HDDatabaseMigrator *)self addMigrationTo:16018 function:_HDMigrateBloodPressureIdentifierAuthorizationsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16019 function:_HDAddUserDomainConceptEducationContentTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16020 function:_HDAddVersionColumnToActivityCacheTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16021 function:_HDUpdateClinicalRecordEntities];
  [(HDDatabaseMigrator *)self addMigrationTo:16022 function:_HDRecreateSeriesDataTables];
  [(HDDatabaseMigrator *)self addMigrationTo:16024 function:_HDUpdateGlassesTypeToGlassesDecription];
  [(HDDatabaseMigrator *)self addMigrationTo:16026 function:_HDUpdateMedicalRecordsDiagnosticReportTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16028 function:_HDUpdateMissingDurationInWorkoutActivitiesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16029 function:_HDUpdateMedicalRecordEntitiesTableWithOrigin];
  [(HDDatabaseMigrator *)self addMigrationTo:16030 function:_HDSanitizeHFDRebuildState];
  [(HDDatabaseMigrator *)self addMigrationTo:16031 function:_HDMigrateHFDToSQLite];
  [(HDDatabaseMigrator *)self addMigrationTo:16032 function:_HDAddSourceURLIndexToOriginalFHIRResourcesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16033 function:_HDDeleteRunningStrideLengthSamples];
  [(HDDatabaseMigrator *)self addMigrationTo:16034 function:_HDAddUserDomainConceptNamedQuantityTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16035 function:_HDDeleteDeprecated261Samples];
  [(HDDatabaseMigrator *)self addMigrationTo:16036 function:_HDDeleteDeprecated261WorkoutStatistics];
  [(HDDatabaseMigrator *)self addMigrationTo:16037 function:_HDDeleteArchivalHFD];
  [(HDDatabaseMigrator *)self addMigrationTo:16038 function:_HDMoveAdHocConceptIntoCorrectIDNamespace];
  [(HDDatabaseMigrator *)self addMigrationTo:16039 function:_HDForceMedicalRecordReextractionToRelinkUDCs];
  [(HDDatabaseMigrator *)self addMigrationTo:16040 function:_HDFixStatisticsAndRemoveUnusedColumnsFromWorkoutsTable foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16041 function:_HDMoveGlassesDescriptionToMetadata];
  [(HDDatabaseMigrator *)self addMigrationTo:16042 function:_HDDropDeprecatedUDCPropertyTypesFromPropertyTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16044 function:_HDAddSchemaVersionToAttachmentReferences];
  [(HDDatabaseMigrator *)self addMigrationTo:16045 function:_HDMigrateUDCPreferredNameProperties];
  [(HDDatabaseMigrator *)self addMigrationTo:16200 function:_HDAddCHRAccountsDeletionReason];
  [(HDDatabaseMigrator *)self addMigrationTo:16201 function:_HDSyncIdentityUpdateForSignedClinicalDataIssuersEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16202 function:_HDSyncIdentityUpdateForOriginalSignedClinicalDataRecordEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16203 function:_HDSyncIdentityUpdateForUserDomainConceptEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16204 function:_HDSyncIdentityUpdateForOriginalFHIRResourceEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16205 function:_HDSyncIdentityUpdateForFHIRCredentialEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16206 function:_HDSyncIdentityUpdateForClinicalGatewayEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16207 function:_HDSyncIdentityUpdateForClinicalDeletedAccountEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16208 function:_HDSyncIdentityUpdateForClinicalAccountEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16209 function:_HDSyncIdentityUpdateForSharingRelationshipEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16210 function:_HDSyncIdentityUpdateForAssociationsAndPendingAssociationsEntities foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16211 function:_HDSyncIdentityUpdateForDataProvenanceEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16212 function:_HDSyncIdentityUpdateForContributorEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16213 function:_HDSyncIdentityUpdateForProtectedKeyValueEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16214 function:_HDSyncIdentityUpdateForObjectAuthorizationEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16400 function:_HDAddVerifiableDataToVisionPrescriptionEntity];
  [(HDDatabaseMigrator *)self addMigrationTo:16401 function:_HDAddMedicalDownloadableAttachmentsTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16402 function:_HDAddClinicalNoteRecordSamplesTable];
  [(HDDatabaseMigrator *)self addMigrationTo:16403 function:_HDAddUniquenessChecksumToOriginalFHIRResourceEntity foreignKeys:1];
  [(HDDatabaseMigrator *)self addMigrationTo:16404 function:_HDAdvanceUDCSyncAnchors];

  [(HDDatabaseMigrator *)self addMigrationTo:16405 function:_HDAddPKCEVerifierToAuthSession];
}

- (void)future_addUnprotectedMigrationSteps
{
}

- (void)future_addProtectedMigrationSteps
{
  [(HDDatabaseMigrator *)self addMigrationTo:100001 function:_HDAddCarePlanAndGoalRecordSamplesTables];
  [(HDDatabaseMigrator *)self addMigrationTo:100002 function:_HDMovedCoverageOutOfFuture];
  [(HDDatabaseMigrator *)self addMigrationTo:100003 function:_HDAddDeviceRecordSamplesTable_0];
  [(HDDatabaseMigrator *)self addMigrationTo:100013 function:_HDAddMedicalHealthTable];
  [(HDDatabaseMigrator *)self addMigrationTo:100014 function:_HDAddMedicalHealthConcreteRecordTables];
  [(HDDatabaseMigrator *)self addMigrationTo:100015 function:_HDAddMedicalHealthLabResultTable];

  [(HDDatabaseMigrator *)self addMigrationTo:100017 function:_HDAddEncounterRecordTable];
}

- (HDDatabaseMigrator)init
{
  sqlite3_int64 v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = NSStringFromSelector(a2);
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (HDDatabaseMigrator)initWithTransaction:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDDatabaseMigrator.mm", 60, @"Invalid parameter not satisfying: %@", @"transaction != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HDDatabaseMigrator;
  char v7 = [(HDDatabaseMigrator *)&v13 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_transaction, a3);
    uint64_t v9 = [[HDDatabaseSchemaManager alloc] initWithTransaction:v8->_transaction];
    schemaManager = v8->_schemaManager;
    v8->_schemaManager = v9;
  }
  return v8;
}

- (_HKBehavior)behavior
{
  return [(HDDatabaseMigrationTransaction *)self->_transaction behavior];
}

- (void)addPrimaryMigrationSteps
{
  if ([(HDDatabaseMigrationTransaction *)self->_transaction isProtectedMigration])
  {
    id v32 = (id)objc_opt_new();
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    id v35 = __53__HDDatabaseMigrator__primaryProtectedMigrationSteps__block_invoke;
    uint64_t v36 = &unk_1E62F5250;
    uint64_t v37 = self;
    sqlite3_int64 v3 = +[HDDatabaseMigrationStep migrationStepFrom:8041 to:8046 handler:&v33];
    [v32 addObject:v3];

    uint64_t v4 = +[HDDatabaseMigrationStep migrationStepFrom:8046 to:8047 handler:&__block_literal_global_216];
    [v32 addObject:v4];

    id v5 = [(HDDatabaseMigrator *)self okemoZursProtectedMigrationSteps];
    [v32 addObjectsFromArray:v5];

    id v6 = [(HDDatabaseMigrator *)self monarchProtectedMigrationSteps];
    [v32 addObjectsFromArray:v6];

    char v7 = [(HDDatabaseMigrator *)self boulderProtectedMigrationSteps];
    [v32 addObjectsFromArray:v7];

    uint64_t v8 = [(HDDatabaseMigrator *)self eagleProtectedMigrationSteps];
    [v32 addObjectsFromArray:v8];

    uint64_t v9 = [(HDDatabaseMigrator *)self whitetailProtectedMigrationSteps];
    [v32 addObjectsFromArray:v9];

    uint64_t v10 = [(HDDatabaseMigrator *)self butlerProtectedMigrationSteps];
    [v32 addObjectsFromArray:v10];

    uint64_t v11 = [(HDDatabaseMigrator *)self corryProtectedMigrationSteps];
    [v32 addObjectsFromArray:v11];

    uint64_t v12 = [(HDDatabaseMigrator *)self erieProtectedMigrationSteps];
    [v32 addObjectsFromArray:v12];

    objc_super v13 = [(HDDatabaseMigrator *)self tigrisProtectedMigrationSteps];
    [v32 addObjectsFromArray:v13];

    id v14 = [(HDDatabaseMigrator *)self cinarProtectedMigrationSteps];
    [v32 addObjectsFromArray:v14];

    char v15 = [(HDDatabaseMigrator *)self emetProtectedMigrationSteps];
    [v32 addObjectsFromArray:v15];

    [(HDDatabaseMigrator *)self addMigrationSteps:v32];
    [(HDDatabaseMigrator *)self peace_addProtectedMigrationSteps];
    [(HDDatabaseMigrator *)self yukon_addProtectedMigrationSteps];
    [(HDDatabaseMigrator *)self azul_addProtectedMigrationSteps];
    [(HDDatabaseMigrator *)self sky_addProtectedMigrationSteps];
    [(HDDatabaseMigrator *)self sydney_addProtectedMigrationSteps];
    [(HDDatabaseMigrator *)self dawn_addProtectedMigrationSteps];
    [(HDDatabaseMigrator *)self crystal_addProtectedMigrationSteps];
    id v16 = [(HDDatabaseMigrator *)self behavior];
    int v17 = [v16 futureMigrationsEnabled];

    if (v17) {
      [(HDDatabaseMigrator *)self future_addProtectedMigrationSteps];
    }
  }
  else
  {
    id v32 = (id)objc_opt_new();
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    id v35 = __55__HDDatabaseMigrator__primaryUnprotectedMigrationSteps__block_invoke;
    uint64_t v36 = &unk_1E62F5250;
    uint64_t v37 = self;
    uint64_t v18 = +[HDDatabaseMigrationStep migrationStepFrom:8041 to:8044 handler:&v33];
    [v32 addObject:v18];

    id v19 = [(HDDatabaseMigrator *)self okemoZursUnprotectedMigrationSteps];
    [v32 addObjectsFromArray:v19];

    int v20 = [(HDDatabaseMigrator *)self monarchUnprotectedMigrationSteps];
    [v32 addObjectsFromArray:v20];

    long long v21 = [(HDDatabaseMigrator *)self boulderUnprotectedMigrationSteps];
    [v32 addObjectsFromArray:v21];

    long long v22 = [(HDDatabaseMigrator *)self eagleUnprotectedMigrationSteps];
    [v32 addObjectsFromArray:v22];

    long long v23 = [(HDDatabaseMigrator *)self whitetailUnprotectedMigrationSteps];
    [v32 addObjectsFromArray:v23];

    long long v24 = [(HDDatabaseMigrator *)self butlerUnprotectedMigrationSteps];
    [v32 addObjectsFromArray:v24];

    long long v25 = [(HDDatabaseMigrator *)self corryUnprotectedMigrationSteps];
    [v32 addObjectsFromArray:v25];

    long long v26 = [(HDDatabaseMigrator *)self erieUnprotectedMigrationSteps];
    [v32 addObjectsFromArray:v26];

    uint64_t v27 = [(HDDatabaseMigrator *)self tigrisUnprotectedMigrationSteps];
    [v32 addObjectsFromArray:v27];

    id v28 = [(HDDatabaseMigrator *)self cinarUnprotectedMigrationSteps];
    [v32 addObjectsFromArray:v28];

    id v29 = [(HDDatabaseMigrator *)self emetUnprotectedMigrationSteps];
    [v32 addObjectsFromArray:v29];

    [(HDDatabaseMigrator *)self addMigrationSteps:v32];
    [(HDDatabaseMigrator *)self peace_addUnprotectedMigrationSteps];
    [(HDDatabaseMigrator *)self yukon_addUnprotectedMigrationSteps];
    [(HDDatabaseMigrator *)self azul_addUnprotectedMigrationSteps];
    [(HDDatabaseMigrator *)self sky_addUnprotectedMigrationSteps];
    [(HDDatabaseMigrator *)self sydney_addUnprotectedMigrationSteps];
    [(HDDatabaseMigrator *)self dawn_addUnprotectedMigrationSteps];
    [(HDDatabaseMigrator *)self crystal_addUnprotectedMigrationSteps];
    uint64_t v30 = [(HDDatabaseMigrator *)self behavior];
    int v31 = [v30 futureMigrationsEnabled];

    if (v31) {
      [(HDDatabaseMigrator *)self future_addUnprotectedMigrationSteps];
    }
  }
}

- (void)addMigrationTo:(int64_t)a3 foreignKeys:(int64_t)a4 handler:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [[HDDatabaseMigrationStep alloc] initForSchema:0 toVersion:a3 requiringVersion:-1 foreignKeys:a4 handler:v8];
  v11[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(HDDatabaseMigrator *)self addMigrationSteps:v10];
}

- (void)addMigrationTo:(int64_t)a3 function:(void *)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__HDDatabaseMigrator_addMigrationTo_function___block_invoke;
  v4[3] = &__block_descriptor_40_e70_q40__0__HDDatabaseMigrator_8__HDDatabaseMigrationTransaction_16q24__32l;
  v4[4] = a4;
  [(HDDatabaseMigrator *)self addMigrationTo:a3 foreignKeys:0 handler:v4];
}

uint64_t __46__HDDatabaseMigrator_addMigrationTo_function___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4, a5);
}

- (void)addMigrationTo:(int64_t)a3 function:(void *)a4 foreignKeys:(int64_t)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__HDDatabaseMigrator_addMigrationTo_function_foreignKeys___block_invoke;
  v5[3] = &__block_descriptor_40_e70_q40__0__HDDatabaseMigrator_8__HDDatabaseMigrationTransaction_16q24__32l;
  v5[4] = a4;
  [(HDDatabaseMigrator *)self addMigrationTo:a3 foreignKeys:a5 handler:v5];
}

uint64_t __58__HDDatabaseMigrator_addMigrationTo_function_foreignKeys___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4, a5);
}

- (void)addMigrationForSchema:(id)a3 toVersion:(int64_t)a4 foreignKeyStatus:(int64_t)a5 handler:(id)a6
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = [[HDDatabaseMigrationStep alloc] initForSchema:v10 toVersion:a4 requiringVersion:-1 foreignKeys:a5 handler:v11];
  v14[0] = v12;
  objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [(HDDatabaseMigrator *)self addMigrationSteps:v13];
}

- (void)addLockstepMigrationForSchema:(id)a3 toVersion:(int64_t)a4 requiringVersion:(int64_t)a5 foreignKeyStatus:(int64_t)a6 handler:(id)a7
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  if (a4 == -1)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDDatabaseMigrator.mm", 174, @"Invalid parameter not satisfying: %@", @"finalVersion != HDSQLiteRequiredPrimarySchemaVersionAny" object file lineNumber description];
  }
  id v15 = [[HDDatabaseMigrationStep alloc] initForSchema:v13 toVersion:a4 requiringVersion:a5 foreignKeys:a6 handler:v14];
  v18[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [(HDDatabaseMigrator *)self addMigrationSteps:v16];
}

- (void)addMigrationSteps:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (self->_hasPerformedMigration)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HDDatabaseMigrator.mm", 187, @"Invalid parameter not satisfying: %@", @"!_hasPerformedMigration" object file lineNumber description];

    id v5 = v10;
  }
  migrationSteps = self->_migrationSteps;
  if (migrationSteps)
  {
    [(NSMutableArray *)migrationSteps addObjectsFromArray:v5];
  }
  else
  {
    char v7 = (NSMutableArray *)[v5 mutableCopy];
    id v8 = self->_migrationSteps;
    self->_migrationSteps = v7;
  }
}

uint64_t __55__HDDatabaseMigrator__primaryUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _deleteDatabaseStatusForVersion:errorMessage:error:](*(void *)(a1 + 32), a2, a3);
}

- (uint64_t)_deleteDatabaseStatusForVersion:(uint64_t)a1 errorMessage:(uint64_t)a2 error:(uint64_t)a3
{
  id v6 = @"Unsupported Okemo database";
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"%@ (version %ld)", @"Unsupported Okemo database", a2);
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __53__HDDatabaseMigrator__primaryProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _deleteDatabaseStatusForVersion:errorMessage:error:](*(void *)(a1 + 32), a2, a3);
}

uint64_t __53__HDDatabaseMigrator__primaryProtectedMigrationSteps__block_invoke_2()
{
  return 0;
}

uint64_t __74__HDDatabaseMigrator__runMigrationStep_currentVersion_finalVersion_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = *(void **)(*(void *)(a1 + 40) + 32);
    uint64_t v7 = *(void *)(a1 + 72);
    id v60 = 0;
    uint64_t v8 = [v6 currentVersionForSchema:v5 protectionClass:v7 error:&v60];
    id v9 = (__CFString *)v60;
    if (v8 == -1)
    {
      _HKInitializeLogging();
      id v10 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        id v52 = *(__CFString **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v62 = v52;
        __int16 v63 = 2114;
        v64 = v9;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve current version for schema '%{public}@': %{public}@.", buf, 0x16u);
      }
      uint64_t v11 = 0;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_52;
    }
  }
  else
  {
    id v9 = 0;
    uint64_t v8 = *(void *)(a1 + 64);
  }
  id v12 = [*(id *)(a1 + 48) migrationHandler];
  id v13 = *(void **)(a1 + 40);
  id v14 = [v13 transaction];
  uint64_t v15 = **(void **)(a1 + 80);
  v59 = v9;
  uint64_t v16 = ((uint64_t (**)(void, void *, void *, uint64_t, __CFString **))v12)[2](v12, v13, v14, v15, &v59);
  int v17 = v59;

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v16;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v9 = v17;
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = *(void **)(*(void *)(a1 + 40) + 32);
    uint64_t v20 = *(void *)(a1 + 88);
    uint64_t v21 = *(void *)(a1 + 72);
    uint64_t v58 = v17;
    int v22 = [v19 setVersion:v20 schema:v18 protectionClass:v21 error:&v58];
    id v9 = v58;

    if (v22)
    {
      _HKInitializeLogging();
      long long v23 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
      {
        long long v24 = v23;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          long long v25 = [*(id *)(a1 + 40) transaction];
          int v26 = [v25 isProtectedMigration];
          uint64_t v27 = @"unprotected";
          if (v26) {
            uint64_t v27 = @"protected";
          }
          id v28 = *(__CFString **)(a1 + 32);
          id v29 = *(__CFString **)(a1 + 88);
          *(_DWORD *)buf = 138543874;
          v62 = v27;
          if (v28) {
            uint64_t v30 = v28;
          }
          else {
            uint64_t v30 = &stru_1F1728D60;
          }
          __int16 v63 = 2114;
          v64 = v30;
          __int16 v65 = 2048;
          v66 = v29;
          _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_INFO, "Successfully migrated %{public}@ schema '%{public}@' to %ld", buf, 0x20u);
        }
      }
      if (!*(void *)(a1 + 32)) {
        **(void **)(a1 + 80) = *(void *)(a1 + 88);
      }
    }
    else
    {
      _HKInitializeLogging();
      int v31 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        v53 = *(__CFString **)(a1 + 32);
        if (!v53) {
          v53 = &stru_1F1728D60;
        }
        v54 = *(__CFString **)(a1 + 88);
        *(_DWORD *)buf = 138543874;
        v62 = v53;
        __int16 v63 = 2048;
        v64 = v54;
        __int16 v65 = 2114;
        v66 = v9;
        _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "Data migration succeeded for '%{public}@' to %ld but setting schema version failed: %{public}@", buf, 0x20u);
      }
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  if (*(unsigned char *)(a1 + 96))
  {
    v57 = v9;
    uint64_t v32 = [v4 validateForeignKeysForTable:0 databaseName:0 error:&v57];
    uint64_t v33 = v57;

    id v9 = v33;
    if (v32 == 1)
    {
      _HKInitializeLogging();
      id v35 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v33;
        _os_log_fault_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_FAULT, "Foreign key constraint violation encountered after migration step: %{public}@", buf, 0xCu);
      }
      uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Foreign key constraint violation encountered");

      id v9 = (__CFString *)v36;
    }
    else if (v32 == 2)
    {
      _HKInitializeLogging();
      uint64_t v34 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v33;
        _os_log_fault_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_FAULT, "Error encountered when validating foreign keys: %{public}@", buf, 0xCu);
      }
    }
  }
  uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v37) {
    BOOL v38 = v37 == 3;
  }
  else {
    BOOL v38 = 1;
  }
  uint64_t v11 = v38;
  if (v37) {
    BOOL v39 = v37 == 3;
  }
  else {
    BOOL v39 = 1;
  }
  if (!v39)
  {
    id v55 = v4;
    objc_msgSend(NSString, "stringWithFormat:", @"(main schema version %lu)", *(void *)(a1 + 64));
    uint64_t v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v41 = NSString;
    id v42 = [*(id *)(a1 + 40) transaction];
    int v43 = [v42 isProtectedMigration];
    v44 = *(__CFString **)(a1 + 32);
    uint64_t v45 = [*(id *)(a1 + 48) finalSchemaVersion];
    v46 = &stru_1F1728D60;
    uint64_t v47 = @"unprotected";
    if (v44) {
      v48 = v44;
    }
    else {
      v48 = &stru_1F1728D60;
    }
    if (v43) {
      uint64_t v47 = @"protected";
    }
    if (*(void *)(a1 + 32)) {
      v46 = v40;
    }
    uint64_t v49 = [v41 stringWithFormat:@"migration of %@ (schema: %@) from %ld to %ld %@", v47, v48, v8, v45, v46];

    id v4 = v55;
    if (v9)
    {
      uint64_t v50 = [NSString stringWithFormat:@"Error during %@", v49];
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a3, 100, v50, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"Error missing for an unsuccessful %@", v49);
    }
  }
LABEL_52:

  return v11;
}

- (int64_t)migrateFromVersion:(int64_t)a3 toVersion:(int64_t)a4 error:(id *)a5
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  v77 = self->_migrationSteps;
  int64_t v101 = a3;
  if (!a3)
  {
    v74 = [MEMORY[0x1E4F28B00] currentHandler];
    [v74 handleFailureInMethod:sel__runMigrationSteps_currentVersion_expectedFinalVersion_error_, self, @"HDDatabaseMigrator.mm", 432, @"Invalid parameter not satisfying: %@", @"currentVersion" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
LABEL_125:
    v75 = [MEMORY[0x1E4F28B00] currentHandler];
    [v75 handleFailureInMethod:sel__runMigrationSteps_currentVersion_expectedFinalVersion_error_, self, @"HDDatabaseMigrator.mm", 433, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a5) {
    goto LABEL_125;
  }
LABEL_3:
  int64_t v82 = v101;
  id v100 = 0;
  v78 = v77;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id obj = v78;
  uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v102 objects:v121 count:16];
  v84 = a5;
  if (v8)
  {
    v97 = 0;
    uint64_t v9 = *(void *)v103;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v103 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v102 + 1) + 8 * i);
        id v12 = [v11 schemaName];
        if (v12)
        {
          id v13 = v97;
          if (!v97) {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          v97 = v13;
          id v14 = [v13 objectForKeyedSubscript:v12];
          if (!v14)
          {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v97 setObject:v14 forKeyedSubscript:v12];
          }
          [v14 addObject:v11];
        }
        else
        {
          [v7 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v102 objects:v121 count:16];
    }
    while (v8);
  }
  else
  {
    v97 = 0;
  }

  [v7 sortUsingComparator:&__block_literal_global_422];
  uint64_t v15 = [v97 allKeys];
  uint64_t v16 = [v15 sortedArrayUsingSelector:sel_compare_];

  long long v119 = 0u;
  long long v120 = 0u;
  memset(v118, 0, sizeof(v118));
  id v85 = v16;
  uint64_t v91 = [v85 countByEnumeratingWithState:v118 objects:v110 count:16];
  if (v91)
  {
    uint64_t v90 = **(void **)&v118[16];
    do
    {
      for (uint64_t j = 0; j != v91; ++j)
      {
        if (**(void **)&v118[16] != v90) {
          objc_enumerationMutation(v85);
        }
        int v17 = [v97 objectForKeyedSubscript:*(void *)(*(void *)&v118[8] + 8 * j)];
        [v17 sortUsingComparator:&__block_literal_global_426];
        unint64_t v18 = 0;
        while (v18 < [v17 count])
        {
          id v19 = [v17 objectAtIndexedSubscript:v18];
          uint64_t v20 = [v19 requiredPrimarySchemaVersion];
          uint64_t v21 = v20;
          if (v20 == -1)
          {
            ++v18;
          }
          else
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v107 = ___ZL23_HDSortedMigrationStepsP7NSArrayIP23HDDatabaseMigrationStepE_block_invoke_3;
            v108 = &__block_descriptor_40_e40_B32__0__HDDatabaseMigrationStep_8Q16_B24l;
            uint64_t v109 = v20;
            uint64_t v22 = [v7 indexOfObjectPassingTest:&buf];
            if (v22 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v81 = [MEMORY[0x1E4F28B00] currentHandler];
              v80 = [NSString stringWithUTF8String:"NSArray<HDDatabaseMigrationStep *> * _Nonnull _HDSortedMigrationSteps(NSArray<HDDatabaseMigrationStep *> * _Nonnull __strong)"];
              [v81 handleFailureInFunction:v80, @"HDDatabaseMigrator.mm", 611, @"Unable to find a primary migration step resulting in %ld, which is required for migration step %@", v21, v19 file lineNumber description];
            }
            unint64_t v23 = v18 + 1;
            long long v24 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v22 + 1, v18 + 1);
            long long v25 = objc_msgSend(v17, "subarrayWithRange:", 0, v23);
            [v7 insertObjects:v25 atIndexes:v24];

            objc_msgSend(v17, "removeObjectsInRange:", 0, v23);
            unint64_t v18 = 0;
          }
        }
        [v7 addObjectsFromArray:v17];
      }
      uint64_t v91 = [v85 countByEnumeratingWithState:v118 objects:v110 count:16];
    }
    while (v91);
  }

  id v92 = v7;
  id v98 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v26 = [(HDDatabaseMigrator *)self transaction];
  int v27 = [v26 isProtectedMigration];
  uint64_t v28 = 1;
  if (v27) {
    uint64_t v28 = 2;
  }
  uint64_t v95 = v28;

  long long v111 = 0u;
  long long v112 = 0u;
  memset(v110, 0, sizeof(v110));
  id v29 = v92;
  id v30 = 0;
  uint64_t v31 = [v29 countByEnumeratingWithState:v110 objects:v121 count:16];
  if (v31)
  {
    uint64_t v32 = **(void **)&v110[16];
    while (2)
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (**(void **)&v110[16] != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void **)(*(void *)&v110[8] + 8 * k);
        id v35 = [v34 schemaName];
        if (v35)
        {
          uint64_t v36 = [v30 objectForKeyedSubscript:v35];
          uint64_t v37 = v36;
          if (v36)
          {
            uint64_t v38 = [v36 integerValue];
          }
          else
          {
            uint64_t v38 = [(HDDatabaseSchemaManager *)self->_schemaManager currentVersionForSchema:v35 protectionClass:v95 error:&v100];
            if (v38 == -1)
            {

              id v86 = 0;
              uint64_t v40 = v98;
              goto LABEL_56;
            }
            if (!v30) {
              id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            BOOL v39 = [NSNumber numberWithInteger:v38];
            [v30 setObject:v39 forKeyedSubscript:v35];
          }
        }
        else
        {
          uint64_t v38 = v82;
        }
        if ([v34 finalSchemaVersion] > v38) {
          [v98 addObject:v34];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:v110 objects:v121 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }

  uint64_t v40 = v98;
  id v86 = v98;
LABEL_56:

  id v83 = v100;
  if (!v86)
  {
    _HKInitializeLogging();
    __int16 v63 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v121 = 134218498;
      int64_t v122 = v101;
      __int16 v123 = 2048;
      int64_t v124 = a4;
      __int16 v125 = 2114;
      id v126 = v83;
      _os_log_error_impl(&dword_1BCB7D000, v63, OS_LOG_TYPE_ERROR, "Unable to sort and prune migration steps from %ld to %ld: %{public}@.", v121, 0x20u);
    }
    id v79 = v83;
    if (v79)
    {
      if (v84) {
        id *v84 = v79;
      }
      else {
        _HKLogDroppedError();
      }
    }
    int64_t v57 = 1;
    goto LABEL_115;
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v79 = v86;
  uint64_t v41 = [v79 countByEnumeratingWithState:&v102 objects:v121 count:16];
  if (!v41)
  {
LABEL_99:
    int64_t v57 = 0;
    goto LABEL_115;
  }
  uint64_t v96 = *(void *)v103;
  id v42 = &selRef_startFakingWithHKWorkoutActivityType_;
LABEL_59:
  uint64_t v43 = 0;
  obja = v42[407];
  uint64_t v93 = v41;
  while (1)
  {
    if (*(void *)v103 != v96) {
      objc_enumerationMutation(v79);
    }
    uint64_t v99 = v43;
    id v44 = *(id *)(*((void *)&v102 + 1) + 8 * v43);
    if (!v84)
    {
      id v60 = [MEMORY[0x1E4F28B00] currentHandler];
      [v60 handleFailureInMethod:obja, self, @"HDDatabaseMigrator.mm", 257, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
    }
    unint64_t v45 = v101;
    unint64_t v46 = [v44 finalSchemaVersion];
    uint64_t v47 = [v44 schemaName];
    if (v47)
    {
      if ([v44 requiredPrimarySchemaVersion] != -1
        && v45 != [v44 requiredPrimarySchemaVersion])
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v84, 3, @"Invalid current main schema version %lu for migration step %@", v45, v44);

        goto LABEL_112;
      }
    }
    else
    {
      if ((uint64_t)v46 > a4)
      {
        uint64_t v61 = [MEMORY[0x1E4F28B00] currentHandler];
        [v61 handleFailureInMethod:obja, self, @"HDDatabaseMigrator.mm", 265, @"Invalid parameter not satisfying: %@", @"stepFinalSchemaVersion <= finalVersion" object file lineNumber description];

        if (v45 < v46)
        {
          _HKInitializeLogging();
          v62 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v118 = 134218240;
            *(void *)&v118[4] = v46;
            *(_WORD *)&v118[12] = 2048;
            *(void *)&v118[14] = a4;
            _os_log_error_impl(&dword_1BCB7D000, v62, OS_LOG_TYPE_ERROR, "Skipping migration step to %ld because expected current schema version is %ld.", v118, 0x16u);
          }
        }
LABEL_96:

        goto LABEL_97;
      }
      if (v45 >= v46) {
        goto LABEL_96;
      }
    }
    char v48 = 0;
    *(void *)v118 = 0;
    *(void *)&v118[8] = v118;
    *(void *)&v118[16] = 0x2020000000;
    uint64_t v49 = &v118[24];
    *(void *)&v118[24] = 1;
    while (1)
    {
      *(void *)uint64_t v49 = 1;
      if ([v44 foreignKeyStatus] == 1) {
        break;
      }
LABEL_74:
      uint64_t v50 = [(HDDatabaseMigrator *)self transaction];
      if ([v50 isProtectedMigration])
      {
        v51 = [(HDDatabaseMigrator *)self transaction];
        [v51 protectedDatabase];
      }
      else
      {
        v51 = [(HDDatabaseMigrator *)self transaction];
        [v51 unprotectedDatabase];
      id v52 = };

      v53 = [(HDDatabaseMigrator *)self transaction];
      if ([v53 isProtectedMigration]) {
        uint64_t v54 = 2;
      }
      else {
        uint64_t v54 = 1;
      }

      *(void *)v110 = MEMORY[0x1E4F143A8];
      *(void *)&v110[8] = 3221225472;
      *(void *)&v110[16] = __74__HDDatabaseMigrator__runMigrationStep_currentVersion_finalVersion_error___block_invoke;
      *(void *)&v110[24] = &unk_1E630B560;
      unint64_t v113 = v45;
      *(void *)&long long v111 = v47;
      *((void *)&v111 + 1) = self;
      uint64_t v114 = v54;
      *((void *)&v112 + 1) = v118;
      *(void *)&long long v112 = v44;
      v115 = &v101;
      unint64_t v116 = v46;
      char v117 = v48 & 1;
      if (([v52 performTransactionWithType:1 error:v84 usingBlock:v110] & 1) == 0) {
        *(void *)(*(void *)&v118[8] + 24) = 1;
      }

      uint64_t v49 = (uint8_t *)(*(void *)&v118[8] + 24);
      if (*(void *)(*(void *)&v118[8] + 24) != 3) {
        goto LABEL_85;
      }
    }
    if ([(HDDatabaseMigrator *)self executeSQL:@"PRAGMA foreign_keys = OFF" error:v84])
    {
      char v48 = 1;
      goto LABEL_74;
    }
    _HKInitializeLogging();
    id v55 = *MEMORY[0x1E4F29F18];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
LABEL_85:
      if ((v48 & 1) == 0) {
        goto LABEL_89;
      }
      goto LABEL_86;
    }
    id v58 = *v84;
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v58;
    _os_log_error_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_ERROR, "Failed to disable foreign keys: %{public}@", (uint8_t *)&buf, 0xCu);
    if ((v48 & 1) == 0) {
      goto LABEL_89;
    }
LABEL_86:
    if (![(HDDatabaseMigrator *)self executeSQL:@"PRAGMA foreign_keys = ON" error:v84])
    {
      *(void *)(*(void *)&v118[8] + 24) = 1;
      _HKInitializeLogging();
      v56 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        id v59 = *v84;
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v59;
        _os_log_error_impl(&dword_1BCB7D000, v56, OS_LOG_TYPE_ERROR, "Failed to enable foreign keys: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
LABEL_89:
    int64_t v57 = *(void *)(*(void *)&v118[8] + 24);
    _Block_object_dispose(v118, 8);

    if (v57) {
      break;
    }
LABEL_97:
    uint64_t v43 = v99 + 1;
    if (v99 + 1 == v93)
    {
      uint64_t v41 = [v79 countByEnumeratingWithState:&v102 objects:v121 count:16];
      id v42 = &selRef_startFakingWithHKWorkoutActivityType_;
      if (!v41) {
        goto LABEL_99;
      }
      goto LABEL_59;
    }
  }
  if (v57 == 2)
  {
    _HKInitializeLogging();
    v64 = (id)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
    {
      v70 = [(HDDatabaseMigrator *)self transaction];
      if ([v70 isProtectedMigration]) {
        v71 = @"protected";
      }
      else {
        v71 = @"unprotected";
      }
      v72 = [v44 schemaName];
      uint64_t v73 = [v44 finalSchemaVersion];
      *(_DWORD *)v110 = 138543874;
      *(void *)&v110[4] = v71;
      *(_WORD *)&v110[12] = 2112;
      *(void *)&v110[14] = v72;
      *(_WORD *)&v110[22] = 2048;
      *(void *)&v110[24] = v73;
      _os_log_fault_impl(&dword_1BCB7D000, v64, OS_LOG_TYPE_FAULT, "Fatal error encountered attempting migration for %{public}@ (schema: %@) to %ld; migration will be aborted.",
        v110,
        0x20u);
    }
    int64_t v57 = 2;
  }
  else
  {
    if (v57 != 1) {
      goto LABEL_115;
    }
LABEL_112:
    _HKInitializeLogging();
    v64 = (id)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
    {
      v66 = [(HDDatabaseMigrator *)self transaction];
      if ([v66 isProtectedMigration]) {
        uint64_t v67 = @"protected";
      }
      else {
        uint64_t v67 = @"unprotected";
      }
      v68 = [v44 schemaName];
      uint64_t v69 = [v44 finalSchemaVersion];
      *(_DWORD *)v110 = 138543874;
      *(void *)&v110[4] = v67;
      *(_WORD *)&v110[12] = 2112;
      *(void *)&v110[14] = v68;
      *(_WORD *)&v110[22] = 2048;
      *(void *)&v110[24] = v69;
      _os_log_fault_impl(&dword_1BCB7D000, v64, OS_LOG_TYPE_FAULT, "Database migration interrupted attempting migration for %{public}@ (schema: %@) to %ld; migration will be retried.",
        v110,
        0x20u);
    }
    int64_t v57 = 1;
  }

LABEL_115:
  return v57;
}

- (void)invalidate
{
}

- (int64_t)performHFDMigrationToVersion:(int64_t)a3 handler:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [(HDDatabaseMigrator *)self transaction];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error___block_invoke;
  v13[3] = &unk_1E630B5B0;
  int64_t v15 = a3;
  id v10 = v8;
  id v14 = v10;
  int64_t v11 = [v9 accessHistoricHFDWithError:a5 block:v13];

  return v11;
}

uint64_t __65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error___block_invoke_2;
  v8[3] = &unk_1E630B588;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v9 = v5;
  id v10 = &v12;
  if ([a2 accessStoreWithError:a3 block:v8]) {
    uint64_t v6 = v13[3];
  }
  else {
    uint64_t v6 = 1;
  }

  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t __65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v13[4] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = a3;
  uint64_t v12 = a2;
  uint64_t v10 = 1;
  uint64_t v5 = a1 + 48;
  uint64_t v6 = a1 + 32;
  id v7 = operator new(0x30uLL);
  void *v7 = &unk_1F1727EC0;
  v7[1] = v5;
  void v7[2] = &v10;
  void v7[3] = v6;
  v7[4] = &v12;
  void v7[5] = &v11;
  v13[3] = v7;
  uint64_t v8 = health::DataStore::performWriteTransactionWithLambda(a2, (uint64_t)v13);
  std::__function::__value_func<BOOL ()(health::DataStore::WriteTransaction &)>::~__value_func[abi:ne180100](v13);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  return v8;
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDDatabaseMigrator *)self transaction];
  if ([v7 isProtectedMigration])
  {
    uint64_t v8 = [(HDDatabaseMigrator *)self transaction];
    [v8 protectedDatabase];
  }
  else
  {
    uint64_t v8 = [(HDDatabaseMigrator *)self transaction];
    [v8 unprotectedDatabase];
  id v9 = };

  char v10 = [v9 executeUncachedSQL:v6 error:a4];
  return v10;
}

- (BOOL)executeSQLStatements:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDDatabaseMigrator *)self transaction];
  if ([v7 isProtectedMigration])
  {
    uint64_t v8 = [(HDDatabaseMigrator *)self transaction];
    [v8 protectedDatabase];
  }
  else
  {
    uint64_t v8 = [(HDDatabaseMigrator *)self transaction];
    [v8 unprotectedDatabase];
  id v9 = };

  char v10 = [v9 executeSQLStatements:v6 error:a4];
  return v10;
}

- (unint64_t)fetchLegacySyncIdentity:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = [v7 protectedDatabase];

  if (!v8)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"HDDatabaseMigrator.mm" lineNumber:535 description:@"Protected database must not be nil"];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;",
    *MEMORY[0x1E4F65C98],
  id v9 = *MEMORY[0x1E4F65C98]);
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  char v10 = [v7 unprotectedDatabase];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__HDDatabaseMigrator_fetchLegacySyncIdentity_error___block_invoke;
  v15[3] = &unk_1E62F5278;
  void v15[4] = &v16;
  char v11 = [v10 executeSQL:v9 error:a4 bindingHandler:0 enumerationHandler:v15];

  if (v11) {
    unint64_t v12 = v17[3];
  }
  else {
    unint64_t v12 = -1;
  }
  _Block_object_dispose(&v16, 8);

  return v12;
}

uint64_t __52__HDDatabaseMigrator_fetchLegacySyncIdentity_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

- (HDDatabaseMigrationTransaction)transaction
{
  return self->_transaction;
}

- (HDDatabaseSchemaManager)schemaManager
{
  return self->_schemaManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaManager, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_migrationSteps, 0);
}

- (id)okemoZursUnprotectedMigrationSteps
{
  sqlite3_int64 v3 = [MEMORY[0x1E4F1CA48] array];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke;
  v20[3] = &unk_1E62FB708;
  v20[4] = self;
  id v4 = HDCreateMigrationStep(8044, 8101, (uint64_t)v20);
  [v3 addObject:v4];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_2;
  v19[3] = &unk_1E62FB708;
  v19[4] = self;
  uint64_t v5 = +[HDDatabaseMigrationStep migrationStepFrom:8101 to:8103 handler:v19];
  [v3 addObject:v5];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_3;
  v18[3] = &unk_1E62FB708;
  void v18[4] = self;
  id v6 = +[HDDatabaseMigrationStep migrationStepFrom:8103 to:8106 handler:v18];
  [v3 addObject:v6];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_4;
  void v17[3] = &unk_1E62FB708;
  void v17[4] = self;
  id v7 = +[HDDatabaseMigrationStep migrationStepFrom:8106 to:8109 handler:v17];
  [v3 addObject:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_5;
  v16[3] = &unk_1E62FB708;
  v16[4] = self;
  uint64_t v8 = +[HDDatabaseMigrationStep migrationStepFrom:8109 to:8110 handler:v16];
  [v3 addObject:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_6;
  v15[3] = &unk_1E62FB708;
  void v15[4] = self;
  id v9 = +[HDDatabaseMigrationStep migrationStepFrom:8110 to:8111 handler:v15];
  [v3 addObject:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_7;
  v14[3] = &unk_1E62FB708;
  void v14[4] = self;
  char v10 = +[HDDatabaseMigrationStep migrationStepFrom:8111 to:8113 handler:v14];
  [v3 addObject:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_8;
  v13[3] = &unk_1E62FB708;
  void v13[4] = self;
  char v11 = +[HDDatabaseMigrationStep migrationStepFrom:8113 to:8114 handler:v13];
  [v3 addObject:v11];

  return v3;
}

void *__67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQLStatements:&unk_1F17EAC50 error:a3] ^ 1);
  }
  return result;
}

uint64_t __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _renameKeyValueSyncStoreColumnInProtectedDabase:error:](*(void **)(a1 + 32), 0, a3);
}

- (uint64_t)_renameKeyValueSyncStoreColumnInProtectedDabase:(uint64_t)a3 error:
{
  v19[4] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  char v4 = a2;
  id v6 = @"key_value";
  if (a2) {
    id v6 = @"key_value_secure";
  }
  id v7 = v6;
  uint64_t v8 = [a1 transaction];
  id v9 = v8;
  if (v4) {
    [v8 protectedDatabase];
  }
  else {
  char v10 = [v8 unprotectedDatabase];
  }

  if ([v10 table:v7 hasColumnWithName:@"sync_store" error:a3])
  {
    char v11 = [NSString stringWithFormat:@"new_%@", v7];
    objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE %@ (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, category INTEGER, provenance INTEGER, domain STRING, key STRING, value, mod_date REAL, UNIQUE(category, provenance, domain, key));",
    unint64_t v12 = v11);
    id v13 = [NSString stringWithFormat:@"INSERT INTO %@ SELECT * FROM %@;", v11, v7];
    uint64_t v14 = [NSString stringWithFormat:@"DROP TABLE %@;", v7];
    uint64_t v15 = [NSString stringWithFormat:@"ALTER TABLE %@ RENAME TO %@;", v11, v7];
    v19[0] = v12;
    v19[1] = v13;
    v19[2] = v14;
    v19[3] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    uint64_t v17 = [a1 executeSQLStatements:v16 error:a3] ^ 1;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v6 = [v5 integerForKey:@"LastPedometerRecordID"];

  _HKInitializeLogging();
  id v7 = (os_log_t *)MEMORY[0x1E4F29F18];
  uint64_t v8 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Received last pedometer record ID of %ld", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  BOOL v39 = __Block_byref_object_copy__183;
  uint64_t v40 = __Block_byref_object_dispose__183;
  id v41 = 0;
  if (v6 >= 1 && [MEMORY[0x1E4F22258] isStepCountingAvailable])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F22258]);
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__183;
    uint64_t v34 = __Block_byref_object_dispose__183;
    id v35 = 0;
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v43 = __61__HDDatabaseMigrator_OkemoZurs___lastReceivedPedometerDatum___block_invoke;
    id v44 = &unk_1E62F8348;
    unint64_t v46 = &v36;
    uint64_t v47 = &v30;
    char v11 = v10;
    unint64_t v45 = v11;
    [v9 queryPedometerDataSinceRecord:v6 withHandler:&buf];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    id v12 = (id)v31[5];
    id v13 = v12;
    if (v12) {
      id v14 = v12;
    }

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    id v13 = 0;
  }
  id v15 = (id)v37[5];
  _Block_object_dispose(&v36, 8);

  id v16 = v13;
  uint64_t v17 = v16;
  if (v16)
  {
    if (a3) {
      *a3 = v16;
    }
    goto LABEL_18;
  }
  if (v15)
  {
    if (!-[HDDatabaseMigrator _updateDataCollectorKeyValueContextWithObject:domain:error:](v3, (uint64_t)v15, @"STEP_INGESTION", (uint64_t)a3)|| (-[HDDatabaseMigrator _updateDataCollectorKeyValueContextWithObject:domain:error:](v3, (uint64_t)v15, @"DISTANCE_INGESTION", (uint64_t)a3) & 1) == 0)
    {
LABEL_18:

      return 1;
    }
    int v18 = -[HDDatabaseMigrator _updateDataCollectorKeyValueContextWithObject:domain:error:](v3, (uint64_t)v15, @"FLIGHTS_INGESTION", (uint64_t)a3);

    if (!v18) {
      return 1;
    }
  }
  uint64_t v21 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v22 = [v21 integerForKey:@"LastCaloriesRecordID"];

  _HKInitializeLogging();
  unint64_t v23 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v22;
    _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, "Received last calorie record ID of %ld", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  BOOL v39 = __Block_byref_object_copy__183;
  uint64_t v40 = __Block_byref_object_dispose__183;
  id v41 = 0;
  if (v22 >= 1 && [MEMORY[0x1E4F22238] isNatalimeterAvailable])
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F22238]);
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__183;
    uint64_t v34 = __Block_byref_object_dispose__183;
    id v35 = 0;
    dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v43 = __59__HDDatabaseMigrator_OkemoZurs___lastReceivedNatalieDatum___block_invoke;
    id v44 = &unk_1E62F8348;
    unint64_t v46 = &v36;
    uint64_t v47 = &v30;
    int v26 = v25;
    unint64_t v45 = v26;
    [v24 queryAbsoluteNatalimetryDataSinceRecord:v22 withHandler:&buf];
    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    id v27 = (id)v31[5];
    uint64_t v28 = v27;
    if (v27)
    {
      if (a3) {
        *a3 = v27;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _Block_object_dispose(&v30, 8);
  }
  id v29 = (id)v37[5];
  _Block_object_dispose(&v36, 8);

  if (v29)
  {
    if (-[HDDatabaseMigrator _updateDataCollectorKeyValueContextWithObject:domain:error:](v3, (uint64_t)v29, @"BRISK_MINUTE_INGESTION", (uint64_t)a3))uint64_t v19 = -[HDDatabaseMigrator _updateDataCollectorKeyValueContextWithObject:domain:error:](v3, (uint64_t)v29, @"ACTIVE_ENERGY_INGESTION", (uint64_t)a3) ^ 1; {
    else
    }
      uint64_t v19 = 1;
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

uint64_t __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"DROP TABLE IF EXISTS main.activity_caches;";
  v8[1] = @"DROP TABLE IF EXISTS main.achievements;";
  void v8[2] = @"DELETE FROM key_value WHERE category = 1";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"DROP TABLE IF EXISTS nano_pairing;";
  v8[1] = @"DELETE FROM key_value WHERE category = 0 AND domain = 'NanoPairing';";
  void v8[2] = @"CREATE TABLE nano_pairing (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, persistent_uuid BLOB UNIQUE NOT NULL, health_uuid BLOB NOT NULL, creation_date REAL NOT NULL);";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _migrateKeyValueColumnsFromStringToText:error:](*(void **)(a1 + 32), 0, a3);
}

- (uint64_t)_migrateKeyValueColumnsFromStringToText:(uint64_t)a3 error:
{
  v16[4] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v5 = @"key_value";
  if (a2) {
    uint64_t v5 = @"key_value_secure";
  }
  uint64_t v6 = NSString;
  id v7 = v5;
  uint64_t v8 = [v6 stringWithFormat:@"tmp_%@", v7];
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE %@ (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, category INTEGER, provenance INTEGER, domain TEXT, key TEXT, value, mod_date REAL, UNIQUE(category, provenance, domain, key));",
  id v9 = v8);
  dispatch_semaphore_t v10 = [NSString stringWithFormat:@"INSERT INTO %@ SELECT * FROM %@;", v8, v7];
  char v11 = [NSString stringWithFormat:@"DROP TABLE %@;", v7];
  id v12 = [NSString stringWithFormat:@"ALTER TABLE %@ RENAME TO %@;", v8, v7];

  v16[0] = v9;
  v16[1] = v10;
  v16[2] = v11;
  v16[3] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  uint64_t v14 = [a1 executeSQLStatements:v13 error:a3] ^ 1;

  return v14;
}

void *__67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"DELETE FROM datatype_source_order;",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __67__HDDatabaseMigrator_OkemoZurs__okemoZursUnprotectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"DROP TABLE IF EXISTS sync_stores;";
  v8[1] = @"DROP TABLE IF EXISTS sync_anchors;";
  void v8[2] = @"CREATE TABLE IF NOT EXISTS sync_anchors (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, next INTEGER, acked INTEGER, received INTEGER, type INTEGER, store INTEGER, UNIQUE(type, store));";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

- (id)okemoZursProtectedMigrationSteps
{
  sqlite3_int64 v3 = [MEMORY[0x1E4F1CA48] array];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke;
  void v40[3] = &unk_1E62FB708;
  v40[4] = self;
  char v4 = +[HDDatabaseMigrationStep migrationStepFrom:8047 to:8101 handler:v40];
  [v3 addObject:v4];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_2;
  v39[3] = &unk_1E62FB708;
  void v39[4] = self;
  uint64_t v5 = +[HDDatabaseMigrationStep migrationStepFrom:8101 to:8102 handler:v39];
  [v3 addObject:v5];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_3;
  v38[3] = &unk_1E62FB708;
  v38[4] = self;
  uint64_t v6 = +[HDDatabaseMigrationStep migrationStepFrom:8102 to:8103 handler:v38];
  [v3 addObject:v6];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_4;
  v37[3] = &unk_1E62FB708;
  v37[4] = self;
  id v7 = +[HDDatabaseMigrationStep migrationStepFrom:8103 to:8104 handler:v37];
  [v3 addObject:v7];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_5;
  v36[3] = &unk_1E62FB708;
  v36[4] = self;
  uint64_t v8 = +[HDDatabaseMigrationStep migrationStepFrom:8104 to:8105 handler:v36];
  [v3 addObject:v8];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_6;
  v35[3] = &unk_1E62FB708;
  v35[4] = self;
  id v9 = +[HDDatabaseMigrationStep migrationStepFrom:8105 to:8106 handler:v35];
  [v3 addObject:v9];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_7;
  v34[3] = &unk_1E62FB708;
  void v34[4] = self;
  dispatch_semaphore_t v10 = +[HDDatabaseMigrationStep migrationStepFrom:8106 to:8107 handler:v34];
  [v3 addObject:v10];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_8;
  v33[3] = &unk_1E62FB708;
  v33[4] = self;
  char v11 = +[HDDatabaseMigrationStep migrationStepFrom:8107 to:8109 handler:v33];
  [v3 addObject:v11];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_9;
  v32[3] = &unk_1E62FB708;
  void v32[4] = self;
  id v12 = +[HDDatabaseMigrationStep migrationStepFrom:8109 to:8110 handler:v32];
  [v3 addObject:v12];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_10;
  v31[3] = &unk_1E62FB708;
  v31[4] = self;
  id v13 = +[HDDatabaseMigrationStep migrationStepFrom:8110 to:8111 handler:v31];
  [v3 addObject:v13];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_11;
  v30[3] = &unk_1E62FB708;
  void v30[4] = self;
  uint64_t v14 = +[HDDatabaseMigrationStep migrationStepFrom:8111 to:8112 handler:v30];
  [v3 addObject:v14];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_12;
  v29[3] = &unk_1E62FB708;
  v29[4] = self;
  id v15 = +[HDDatabaseMigrationStep migrationStepFrom:8112 to:8114 handler:v29];
  [v3 addObject:v15];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_13;
  v28[3] = &unk_1E62FB708;
  v28[4] = self;
  id v16 = +[HDDatabaseMigrationStep migrationStepFrom:8114 to:8115 handler:v28];
  [v3 addObject:v16];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_14;
  v27[3] = &unk_1E62FB708;
  void v27[4] = self;
  uint64_t v17 = +[HDDatabaseMigrationStep migrationStepFrom:8115 to:8116 handler:v27];
  [v3 addObject:v17];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_15;
  v26[3] = &unk_1E62FB708;
  v26[4] = self;
  int v18 = +[HDDatabaseMigrationStep migrationStepFrom:8116 to:8117 handler:v26];
  [v3 addObject:v18];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_16;
  v25[3] = &unk_1E62FB708;
  void v25[4] = self;
  uint64_t v19 = +[HDDatabaseMigrationStep migrationStepFrom:8117 to:8118 handler:v25];
  [v3 addObject:v19];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_17;
  v24[3] = &unk_1E62FB708;
  v24[4] = self;
  uint64_t v20 = +[HDDatabaseMigrationStep migrationStepFrom:8118 to:8119 handler:v24];
  [v3 addObject:v20];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_18;
  v23[3] = &unk_1E62FB708;
  v23[4] = self;
  uint64_t v21 = +[HDDatabaseMigrationStep migrationStepFrom:8119 to:8120 handler:v23];
  [v3 addObject:v21];

  return v3;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[7] = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"CREATE TABLE key_value_secure (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, category INTEGER, provenance INTEGER, domain STRING, key STRING, value, mod_date REAL, UNIQUE(category, provenance, domain, key));";
  v8[1] = @"INSERT INTO key_value_secure (domain, key, value, mod_date, category, provenance) SELECT bundle_id, key, value, 0.0, 102, 0 FROM user_defaults;";
  void v8[2] = @"INSERT INTO key_value_secure (domain, key, value, mod_date, category, provenance) SELECT NULL, 'birthdate', birthdate, 0.0, 101, 0 FROM users;";
  v8[3] = @"INSERT INTO key_value_secure (domain, key, value, mod_date, category, provenance) SELECT NULL, 'sex', sex, 0.0, 101, 0 FROM users;";
  void v8[4] = @"INSERT INTO key_value_secure (domain, key, value, mod_date, category, provenance) SELECT NULL, 'blood_type', blood_type, 0.0, 101, 0 FROM users;";
  void v8[5] = @"DROP TABLE user_defaults;";
  void v8[6] = @"DROP TABLE users";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:7];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  uint64_t v5 = 1;
  if (!-[HDDatabaseMigrator _renameKeyValueSyncStoreColumnInProtectedDabase:error:](*(void **)(a1 + 32), 1, a3))
  {
    v8[0] = @"UPDATE objects SET provenance = 0 WHERE provenance != 16;";
    v8[1] = @"UPDATE objects SET provenance = 1 WHERE provenance = 16;";
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
    uint64_t v5 = [v3 executeSQLStatements:v6 error:a3] ^ 1;
  }
  return v5;
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQLStatements:&unk_1F17EAC68 error:a3] ^ 1);
  }
  return result;
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"DROP TABLE IF EXISTS data_session_activities;",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_5(uint64_t a1)
{
  void v18[5] = *MEMORY[0x1E4F143B8];
  id v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE data_id IN (SELECT data_id FROM %@ LEFT JOIN objects USING (data_id) WHERE objects.data_id IS NULL);",
      @"samples",
    uint64_t v2 = @"samples");
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE data_id IN (SELECT data_id FROM %@ LEFT JOIN objects USING (data_id) WHERE objects.data_id IS NULL);",
      @"quantity_samples",
    sqlite3_int64 v3 = @"quantity_samples");
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE data_id IN (SELECT data_id FROM %@ LEFT JOIN objects USING (data_id) WHERE objects.data_id IS NULL);",
      @"category_samples",
    char v4 = @"category_samples");
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE data_id IN (SELECT data_id FROM %@ LEFT JOIN objects USING (data_id) WHERE objects.data_id IS NULL);",
      @"workouts",
    uint64_t v5 = @"workouts");
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE data_id IN (SELECT data_id FROM %@ LEFT JOIN objects USING (data_id) WHERE objects.data_id IS NULL);",
      @"activity_caches",
    uint64_t v6 = @"activity_caches");
    v18[0] = v2;
    v18[1] = v3;
    void v18[2] = v4;
    v18[3] = v5;
    void v18[4] = v6;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [v1 executeSQL:*(void *)(*((void *)&v13 + 1) + 8 * v11++) error:0];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  return 0;
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"UPDATE workouts SET activity_type=3000 WHERE activity_type=0" error:a3] ^ 1);
  }
  return result;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (v3) {
    [v3 executeSQL:@"ALTER TABLE activity_caches ADD COLUMN walk_distance REAL;" error:a3];
  }
  return 0;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"CREATE TABLE IF NOT EXISTS activity_caches (data_id INTEGER PRIMARY KEY, energy_burned_goal REAL, energy_burned REAL, brisk_minutes REAL, active_hours REAL, cache_index INTEGER, active_hours_goal REAL, brisk_minutes_goal REAL, steps REAL, walk_distance REAL);";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"CREATE INDEX IF NOT EXISTS metadata_values_index_0 ON metadata_values(object_id);",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _migrateKeyValueColumnsFromStringToText:error:](*(void **)(a1 + 32), 1, a3);
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"CREATE INDEX IF NOT EXISTS correlations_index_0 ON correlations(object);",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"ALTER TABLE correlations ADD COLUMN provenance INTEGER;";
  v8[1] = @"UPDATE correlations SET provenance = 0;";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [&unk_1F17EAC80 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(&unk_1F17EAC80);
        }
        objc_msgSend(NSString, "stringWithFormat:", @"ALTER TABLE activity_caches ADD COLUMN %@ INTEGER;",
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9));
        [v5 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [&unk_1F17EAC80 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  uint64_t v11 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v11;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = +[HDKeyValueEntity generateNewDatabaseIdentifier];
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;",
    *MEMORY[0x1E4F65C98],
  uint64_t v6 = *MEMORY[0x1E4F65C98]);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  uint64_t v7 = [v3 transaction];
  uint64_t v8 = [v7 unprotectedDatabase];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __73__HDDatabaseMigrator_OkemoZurs___initializeDatabaseIdentifiersWithError___block_invoke;
  v24[3] = &unk_1E62F3640;
  v24[4] = v25;
  char v9 = [v8 executeSQL:v6 error:a3 bindingHandler:0 enumerationHandler:v24];

  if (v9)
  {
    uint64_t v10 = [v3 transaction];
    uint64_t v11 = [v10 unprotectedDatabase];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__HDDatabaseMigrator_OkemoZurs___initializeDatabaseIdentifiersWithError___block_invoke_2;
    v21[3] = &unk_1E630B708;
    id v12 = v5;
    id v22 = v12;
    unint64_t v23 = v25;
    int v13 = objc_msgSend(v11, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", @"INSERT OR REPLACE INTO key_value (domain, key, value, mod_date, category, provenance, sync_identity) VALUES('DATABASE_CREATION', 'IDENTIFIER', ?, 0.0, 0, 0, ?);",
            a3,
            v21,
            0);

    if (v13)
    {
      long long v14 = [v3 transaction];
      long long v15 = [v14 protectedDatabase];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __73__HDDatabaseMigrator_OkemoZurs___initializeDatabaseIdentifiersWithError___block_invoke_3;
      v19[3] = &unk_1E62F43C8;
      id v20 = v12;
      int v16 = objc_msgSend(v15, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", @"INSERT OR REPLACE INTO key_value_secure (domain, key, value, mod_date, category, provenance) VALUES('DATABASE_CREATION', 'IDENTIFIER', ?, 0.0, 100, 0);",
              a3,
              v19,
              0);

      uint64_t v17 = v16 ^ 1u;
    }
    else
    {
      uint64_t v17 = 1;
    }
  }
  else
  {
    uint64_t v17 = 1;
  }
  _Block_object_dispose(v25, 8);

  return v17;
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"UPDATE key_value_secure SET key = 'LastSessionEndDate', value = (SELECT samples.end_date FROM workouts, samples WHERE workouts.data_id = samples.data_id ORDER BY samples.end_date DESC LIMIT 1) WHERE key = 'LastSessionAnchor';",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v35[10] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [(id)v3 transaction];
    uint64_t v7 = [v6 unprotectedDatabase];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __70__HDDatabaseMigrator_OkemoZurs___clearSamplesWithoutSourcesWithError___block_invoke_2;
    v32[3] = &unk_1E62F3D38;
    id v8 = v5;
    id v33 = v8;
    int v9 = [v7 executeUncachedSQL:@"SELECT rowid FROM sources" error:a3 bindingHandler:0 enumerationHandler:v32];

    if (v9)
    {
      uint64_t v28 = a3;
      id v27 = v8;
      if ([v8 count])
      {
        uint64_t v10 = NSString;
        uint64_t v11 = [v8 componentsJoinedByString:@","];
        id v12 = [v10 stringWithFormat:@"WHERE source NOT IN (%@)", v11];
      }
      else
      {
        id v12 = &stru_1F1728D60;
      }
      id v29 = v12;
      uint64_t v31 = [NSString stringWithFormat:@"CREATE TEMPORARY TABLE temp_unattached_objects AS SELECT data_id FROM objects %@", v12];
      objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);",
        @"samples",
      uint64_t v30 = @"data_id");
      objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);",
        @"quantity_samples",
      int v13 = @"data_id");
      objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);",
        @"category_samples",
      dispatch_semaphore_t v25 = @"data_id");
      objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);",
        @"workouts",
      long long v14 = @"data_id");
      objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);",
        @"workout_events",
      id v24 = @"workout_id");
      objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);",
        @"activity_caches",
      long long v15 = @"data_id");
      objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);",
        @"correlations",
      uint64_t v16 = @"object");
      objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);",
        @"correlations",
      uint64_t v17 = @"correlation");
      objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);",
        @"metadata_values",
      uint64_t v18 = @"object_id");
      objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@ IN (SELECT * FROM temp_unattached_objects);",
        @"objects",
      uint64_t v19 = @"data_id");
      v35[0] = v30;
      v35[1] = v13;
      v35[2] = v25;
      v35[3] = v14;
      v35[4] = v24;
      void v35[5] = v15;
      int v26 = (void *)v16;
      v35[6] = v16;
      v35[7] = v17;
      v35[8] = v18;
      v35[9] = v19;
      id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:10];
      v34[0] = v31;
      v34[1] = @"CREATE UNIQUE INDEX IF NOT EXISTS temp_index_0 ON temp_unattached_objects (data_id);";
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
      int v22 = [(id)v3 executeSQLStatements:v21 error:v28];

      if (v22)
      {
        [(id)v3 executeSQLStatements:v20 error:0];
        [(id)v3 executeSQL:@"DROP INDEX IF EXISTS temp_index_0;" error:0];
      }
      [(id)v3 executeSQL:@"DROP TABLE IF EXISTS temp_unattached_objects;" error:0];
      uint64_t v3 = v22 ^ 1u;

      id v8 = v27;
    }
    else
    {
      uint64_t v3 = 1;
    }
  }
  return v3;
}

uint64_t __65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v8[0] = @"ALTER TABLE devices add column device_enabled BOOLEAN default 1;";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__65__HDDatabaseMigrator_OkemoZurs__okemoZursProtectedMigrationSteps__block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"INSERT INTO key_value_secure (category, provenance, domain, key, value, mod_date) SELECT 100, 0, 'OBJECT_ANCHOR', 'OBJECT_ANCHOR_8_2', MAX(data_id), strftime('%s', 'now', '-31 years') FROM objects;",
  }
                                    a3) ^ 1);
  return result;
}

- (uint64_t)_updateDataCollectorKeyValueContextWithObject:(void *)a3 domain:(uint64_t)a4 error:
{
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:a4];
  if (v8)
  {
    int v9 = [a1 transaction];
    uint64_t v10 = [v9 unprotectedDatabase];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __92__HDDatabaseMigrator_OkemoZurs___updateDataCollectorKeyValueContextWithObject_domain_error___block_invoke;
    v13[3] = &unk_1E62F2900;
    id v14 = v7;
    id v15 = v8;
    uint64_t v11 = objc_msgSend(v10, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", @"INSERT INTO key_value (domain, key, value, mod_date, category, provenance) VALUES (?, ?, ?, ?, ?, ?);",
            a4,
            v13,
            0);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __92__HDDatabaseMigrator_OkemoZurs___updateDataCollectorKeyValueContextWithObject_domain_error___block_invoke()
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  v0 = [MEMORY[0x1E4F1C9C8] date];
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

void __61__HDDatabaseMigrator_OkemoZurs___lastReceivedPedometerDatum___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 firstObject];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  _HKInitializeLogging();
  uint64_t v10 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    id v12 = HKLogSafeDescription();
    int v13 = 138412546;
    id v14 = v12;
    __int16 v15 = 2048;
    uint64_t v16 = [v5 count];
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "Received last pedometer datum of %@ (out of %ld results)", (uint8_t *)&v13, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__HDDatabaseMigrator_OkemoZurs___lastReceivedNatalieDatum___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 firstObject];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  _HKInitializeLogging();
  uint64_t v10 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    id v12 = HKLogSafeDescription();
    int v13 = 138543618;
    id v14 = v12;
    __int16 v15 = 2048;
    uint64_t v16 = [v5 count];
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "Received last calorie datum of %{public}@ (out of %ld results)", (uint8_t *)&v13, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __73__HDDatabaseMigrator_OkemoZurs___initializeDatabaseIdentifiersWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __73__HDDatabaseMigrator_OkemoZurs___initializeDatabaseIdentifiersWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __73__HDDatabaseMigrator_OkemoZurs___initializeDatabaseIdentifiersWithError___block_invoke_3()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __70__HDDatabaseMigrator_OkemoZurs___clearSamplesWithoutSourcesWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsInt64();
  uint64_t v3 = *(void **)(a1 + 32);
  sqlite3_int64 v4 = [NSNumber numberWithLongLong:v2];
  [v3 addObject:v4];

  return 1;
}

- (id)eagleUnprotectedMigrationSteps
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke;
  v12[3] = &unk_1E62FB708;
  v12[4] = self;
  sqlite3_int64 v4 = HDCreateMigrationStep(9007, 9200, (uint64_t)v12);
  [v3 addObject:v4];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke_2;
  v11[3] = &unk_1E62FB708;
  void v11[4] = self;
  id v5 = HDCreateMigrationStep(9200, 9201, (uint64_t)v11);
  [v3 addObject:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke_3;
  v10[3] = &unk_1E62FB708;
  v10[4] = self;
  id v6 = HDCreateMigrationStep(9201, 9202, (uint64_t)v10);
  [v3 addObject:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke_4;
  v9[3] = &unk_1E62FB708;
  v9[4] = self;
  uint64_t v7 = HDCreateMigrationStep(9202, 9203, (uint64_t)v9);
  [v3 addObject:v7];

  return v3;
}

uint64_t __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _updateKeyValueEntityUniquenessWithProtectedDatabase:error:](*(void **)(a1 + 32), 0, a3);
}

- (uint64_t)_updateKeyValueEntityUniquenessWithProtectedDatabase:(uint64_t)a3 error:
{
  if (!a1) {
    return 0;
  }
  id v5 = @"key_value";
  if (a2) {
    id v5 = @"key_value_secure";
  }
  id v6 = NSString;
  uint64_t v7 = v5;
  uint64_t v8 = [v6 stringWithFormat:@"%@_old", v7];
  int v9 = [NSString stringWithFormat:@"%@_temp", v7];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = [NSString stringWithFormat:@"ALTER TABLE %@ RENAME TO %@;", v7, v8];
  [v10 addObject:v11];

  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS %@ (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, category INTEGER NOT NULL, domain TEXT NOT NULL, key TEXT NOT NULL, value, provenance INTEGER NOT NULL, mod_date REAL NOT NULL, UNIQUE(category, domain, key));",
  id v12 = v7);
  [v10 addObject:v12];

  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TEMPORARY TABLE %@ (category INTEGER NOT NULL, domain TEXT NOT NULL, key TEXT NOT NULL, value, provenance INTEGER NOT NULL, mod_date REAL NOT NULL, UNIQUE(category, domain, key));",
  int v13 = v9);
  [v10 addObject:v13];

  objc_msgSend(NSString, "stringWithFormat:", @"INSERT OR IGNORE INTO %@ (category, domain, key, value, provenance, mod_date) SELECT category, COALESCE(domain, ''), key, value, provenance, mod_date FROM %@ ORDER BY mod_date DESC;",
    v9,
  id v14 = v8);
  [v10 addObject:v14];

  objc_msgSend(NSString, "stringWithFormat:", @"INSERT OR REPLACE INTO %@ (rowid, category, domain, key, value, provenance, mod_date) SELECT old.rowid, merged.category, merged.domain, merged.key, merged.value, merged.provenance, merged.mod_date FROM %@ as old, %@ as merged WHERE merged.category = old.category AND merged.domain = COALESCE(old.domain, '') AND merged.key = old.key ORDER BY old.rowid ASC;",
    v7,
    v8,
  __int16 v15 = v9);

  [v10 addObject:v15];
  uint64_t v16 = [NSString stringWithFormat:@"DROP TABLE %@;", v9];
  [v10 addObject:v16];

  uint64_t v17 = [NSString stringWithFormat:@"DROP TABLE %@;", v8];
  [v10 addObject:v17];

  uint64_t v18 = [a1 executeSQLStatements:v10 error:a3] ^ 1;
  return v18;
}

uint64_t __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS sync_stores (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB UNIQUE NOT NULL, type INTEGER NOT NULL, creation_date REAL NOT NULL);"];
  [v5 addObject:@"ALTER TABLE nano_pairing RENAME TO nano_pairing_old;"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS nano_pairing (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, registry_uuid BLOB UNIQUE NOT NULL, persistent_uuid BLOB, health_uuid BLOB, sync_provenance INTEGER NOT NULL REFERENCES sync_stores (ROWID) ON DELETE CASCADE, restored INTEGER NOT NULL);"];
  [v5 addObject:@"DELETE FROM nano_pairing_old WHERE rowid < (SELECT MAX(rowid) FROM nano_pairing_old);"];
  [v5 addObject:@"INSERT INTO sync_stores (rowid, uuid, type, creation_date) SELECT 1, registry_uuid, 1, 0.0 FROM nano_pairing_old;"];
  [v5 addObject:@"INSERT INTO nano_pairing SELECT * FROM nano_pairing_old;"];
  [v5 addObject:@"DROP TABLE nano_pairing_old"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"ALTER TABLE nano_pairing ADD COLUMN source_bundle_id TEXT;",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __59__HDDatabaseMigrator_Eagle__eagleUnprotectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE nano_pairing ADD COLUMN ids_id TEXT;"];
  [v5 addObject:@"ALTER TABLE sync_anchors ADD COLUMN expected INTEGER;"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

- (id)eagleProtectedMigrationSteps
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke;
  v19[3] = &unk_1E62FB708;
  void v19[4] = self;
  sqlite3_int64 v4 = HDCreateMigrationStep(9100, 9201, (uint64_t)v19);
  [v3 addObject:v4];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_2;
  v18[3] = &unk_1E62FB708;
  void v18[4] = self;
  id v5 = HDCreateMigrationStep(9201, 9202, (uint64_t)v18);
  [v3 addObject:v5];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_3;
  void v17[3] = &unk_1E62FB708;
  void v17[4] = self;
  uint64_t v6 = HDCreateMigrationStep(9202, 9203, (uint64_t)v17);
  [v3 addObject:v6];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_4;
  v16[3] = &unk_1E62FB708;
  v16[4] = self;
  uint64_t v7 = HDCreateMigrationStep(9203, 9204, (uint64_t)v16);
  [v3 addObject:v7];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_5;
  v15[3] = &unk_1E62FB708;
  void v15[4] = self;
  uint64_t v8 = HDCreateMigrationStep(9204, 9206, (uint64_t)v15);
  [v3 addObject:v8];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_6;
  v14[3] = &unk_1E62FB708;
  void v14[4] = self;
  int v9 = HDCreateMigrationStep(9206, 9208, (uint64_t)v14);
  [v3 addObject:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_7;
  v13[3] = &unk_1E62FB708;
  void v13[4] = self;
  id v10 = HDCreateMigrationStep(9208, 9209, (uint64_t)v13);
  [v3 addObject:v10];

  uint64_t v11 = HDCreateMigrationStep(9209, 9210, (uint64_t)&__block_literal_global_223);
  [v3 addObject:v11];

  return v3;
}

void *__57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQLStatements:&unk_1F17EACE0 error:a3] ^ 1);
  }
  return result;
}

void *__57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"CREATE TABLE IF NOT EXISTS binary_samples (data_id INTEGER PRIMARY KEY, payload BLOB)", a3 error] ^ 1);
  }
  return result;
}

void *__57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"CREATE TABLE IF NOT EXISTS data_series (data_id INTEGER PRIMARY KEY REFERENCES samples(data_id), frozen INTEGER NOT NULL DEFAULT 0, count INTEGER NOT NULL DEFAULT 0)", a3 error] ^ 1);
  }
  return result;
}

uint64_t __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDDatabaseMigrator _updateKeyValueEntityUniquenessWithProtectedDatabase:error:](*(void **)(a1 + 32), 1, a3);
}

void *__57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQLStatements:&unk_1F17EACF8 error:a3] ^ 1);
  }
  return result;
}

void *__57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"INSERT OR REPLACE INTO key_value_secure (category, domain, provenance, mod_date, key, value)                       SELECT category, domain, provenance, mod_date, 'LastSessionAnchor',                         (SELECT workouts.data_id FROM workouts INNER JOIN samples USING(data_id) ORDER BY samples.end_date DESC LIMIT 1)                       FROM key_value_secure WHERE key = 'LastSessionEndDate' ORDER BY value DESC;",
  }
                                    a3) ^ 1);
  return result;
}

void *__57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"UPDATE key_value_secure SET category = 106 WHERE category = 103;",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __57__HDDatabaseMigrator_Eagle__eagleProtectedMigrationSteps__block_invoke_8()
{
  return 0;
}

- (id)tigrisUnprotectedMigrationSteps
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke;
  v30[3] = &unk_1E62F5250;
  void v30[4] = self;
  sqlite3_int64 v4 = +[HDDatabaseMigrationStep migrationStepFrom:10001 to:11000 handler:v30];
  [v3 addObject:v4];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_2;
  v29[3] = &unk_1E62F5250;
  v29[4] = self;
  id v5 = +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:11000 to:11001 handler:v29];
  [v3 addObject:v5];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_3;
  v28[3] = &unk_1E62F5250;
  v28[4] = self;
  uint64_t v6 = +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:11001 to:11002 handler:v28];
  [v3 addObject:v6];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_4;
  v27[3] = &unk_1E62F5250;
  void v27[4] = self;
  uint64_t v7 = +[HDDatabaseMigrationStep migrationStepFrom:11002 to:11003 handler:v27];
  [v3 addObject:v7];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_5;
  v26[3] = &unk_1E62F5250;
  v26[4] = self;
  uint64_t v8 = HDCreateMigrationStep(11003, 11004, (uint64_t)v26);
  [v3 addObject:v8];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_6;
  v25[3] = &unk_1E62F5250;
  void v25[4] = self;
  int v9 = HDCreateMigrationStep(11004, 11005, (uint64_t)v25);
  [v3 addObject:v9];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_7;
  v24[3] = &unk_1E62F5250;
  v24[4] = self;
  id v10 = HDCreateMigrationStep(11005, 11006, (uint64_t)v24);
  [v3 addObject:v10];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_8;
  v23[3] = &unk_1E62F5250;
  v23[4] = self;
  uint64_t v11 = HDCreateMigrationStep(11006, 11007, (uint64_t)v23);
  [v3 addObject:v11];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_9;
  v22[3] = &unk_1E62F5250;
  void v22[4] = self;
  id v12 = HDCreateMigrationStep(11007, 11009, (uint64_t)v22);
  [v3 addObject:v12];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_10;
  v21[3] = &unk_1E62F5250;
  void v21[4] = self;
  int v13 = +[HDDatabaseMigrationStep migrationStepFrom:11009 to:11010 handler:v21];
  [v3 addObject:v13];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_11;
  v20[3] = &unk_1E62F5250;
  v20[4] = self;
  id v14 = HDCreateMigrationStep(11010, 11011, (uint64_t)v20);
  [v3 addObject:v14];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_12;
  v19[3] = &unk_1E62F5250;
  void v19[4] = self;
  __int16 v15 = HDCreateMigrationStep(11011, 11012, (uint64_t)v19);
  [v3 addObject:v15];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_13;
  v18[3] = &unk_1E62F5250;
  void v18[4] = self;
  uint64_t v16 = HDCreateMigrationStep(11012, 11013, (uint64_t)v18);
  [v3 addObject:v16];

  return v3;
}

void *__61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"CREATE TABLE IF NOT EXISTS cloud_sync_stores (sync_store INTEGER PRIMARY KEY REFERENCES sync_stores (ROWID) ON DELETE CASCADE, server_change_token BLOB NOT NULL)", a3 error] ^ 1);
  }
  return result;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE sources RENAME TO sources_old;"];
  [v5 addObject:@"CREATE TABLE sources (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB UNIQUE NOT NULL, bundle_id TEXT NOT NULL, name TEXT NOT NULL, source_options INTEGER NOT NULL, local_device INTEGER NOT NULL, product_type TEXT NOT NULL, deleted INTEGER NOT NULL, mod_date REAL NOT NULL, provenance INTEGER NOT NULL, sync_anchor INTEGER NOT NULL);"];
  [v5 addObject:@"INSERT INTO sources SELECT rowid, uuid, COALESCE(bundle_id, ''), COALESCE(name, ''), COALESCE(source_options, 0), COALESCE(local_device, 0), COALESCE(product_type, ''), deleted, COALESCE(mod_date, 0.0), provenance, rowid FROM sources_old;"];
  [v5 addObject:@"DROP TABLE sources_old;"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v7[0] = @"DROP TABLE IF EXISTS cloud_sync_stores";
  v7[1] = @"CREATE TABLE IF NOT EXISTS cloud_sync_stores (sync_store INTEGER PRIMARY KEY REFERENCES sync_stores (ROWID) ON DELETE CASCADE, server_change_token BLOB, baseline_epoch INTEGER NOT NULL)";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  LODWORD(a3) = [v3 executeSQLStatements:v5 error:a3];

  return a3 ^ 1;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE authorization RENAME TO authorization_old;"];
  [v5 addObject:@"CREATE TABLE authorization (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, source_id INTEGER NOT NULL REFERENCES sources(ROWID) ON DELETE CASCADE, object_type INTEGER NOT NULL, status INTEGER NOT NULL, request INTEGER NOT NULL, date_modified REAL NOT NULL, modification_epoch INTEGER NOT NULL, provenance INTEGER NOT NULL, object_anchor INTEGER NOT NULL DEFAULT 0, UNIQUE(source_id, object_type));"];
  [v5 addObject:@"INSERT INTO authorization (ROWID, source_id, object_type, status, request, date_modified, modification_epoch, provenance, object_anchor) SELECT ROWID, source_id, object_type, status, request, date_modified, 0, provenance, object_anchor FROM authorization_old;"];
  [v5 addObject:@"DROP TABLE authorization_old;"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"ALTER TABLE cloud_sync_stores ADD COLUMN rebase_deadline REAL;",
  }
                                    a3) ^ 1);
  return result;
}

void *__61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"ALTER TABLE cloud_sync_stores ADD COLUMN last_sync REAL;",
  }
                                    a3) ^ 1);
  return result;
}

void *__61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)(objc_msgSend(result, "executeSQL:error:", @"ALTER TABLE cloud_sync_stores ADD COLUMN empty_zones BLOB;",
  }
                                    a3) ^ 1);
  return result;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE cloud_sync_stores ADD COLUMN last_check REAL;"];
  [v5 addObject:@"ALTER TABLE cloud_sync_stores ADD COLUMN owner_id TEXT;"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"DELETE FROM sync_stores WHERE EXISTS (SELECT * FROM cloud_sync_stores WHERE sync_stores.rowid = cloud_sync_stores.sync_store)"];
  [v5 addObject:@"DROP TABLE cloud_sync_stores"];
  [v5 addObject:@"CREATE TABLE cloud_sync_stores (sync_store INTEGER PRIMARY KEY REFERENCES sync_stores (ROWID) ON DELETE CASCADE, server_change_token BLOB, baseline_epoch INTEGER NOT NULL, rebase_deadline REAL, last_sync REAL, empty_zones BLOB, last_check REAL, owner_id TEXT NOT NULL, container_id TEXT NOT NULL);"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

void *__61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"UPDATE sources SET source_options=18 WHERE bundle_id='com.apple.private.health.fitnessmachine'" error:a3] ^ 1);
  }
  return result;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE cloud_sync_stores RENAME TO cloud_sync_stores_old;"];
  [v5 addObject:@"CREATE TABLE cloud_sync_stores (sync_store INTEGER PRIMARY KEY REFERENCES sync_stores (ROWID) ON DELETE CASCADE, server_change_token BLOB, baseline_epoch INTEGER NOT NULL, rebase_deadline REAL, last_sync REAL, empty_zones BLOB, last_check REAL, owner_id TEXT NOT NULL, container_id TEXT NOT NULL, has_gap INTEGER NOT NULL);"];
  [v5 addObject:@"INSERT INTO cloud_sync_stores SELECT sync_store, server_change_token, baseline_epoch, rebase_deadline, last_sync, empty_zones, last_check, owner_id, container_id, 0 FROM cloud_sync_stores_old;"];
  [v5 addObject:@"DROP TABLE cloud_sync_stores_old"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE sync_anchors RENAME TO sync_anchors_old;"];
  [v5 addObject:@"CREATE TABLE sync_anchors (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, next INTEGER NOT NULL, acked INTEGER NOT NULL, received INTEGER NOT NULL, type INTEGER NOT NULL, store INTEGER NOT NULL, epoch INTEGER NOT NULL, UNIQUE(store, epoch, type));"];
  [v5 addObject:@"INSERT INTO sync_anchors SELECT ROWID, COALESCE(next, 0), COALESCE(acked, 0), COALESCE(received, 0), type, store, 0 FROM sync_anchors_old WHERE type IS NOT NULL AND store IS NOT NULL;"];
  [v5 addObject:@"DROP TABLE sync_anchors_old"];
  [v5 addObject:@"UPDATE sync_anchors SET epoch = (SELECT baseline_epoch FROM cloud_sync_stores WHERE sync_store = store) WHERE EXISTS (SELECT * FROM cloud_sync_stores WHERE sync_store = store)"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Tigris__tigrisUnprotectedMigrationSteps__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"DROP INDEX IF EXISTS sources_bundle_id"];
  [v5 addObject:@"CREATE INDEX sources_bundle_id_uuid ON sources (bundle_id, uuid)"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

- (id)tigrisProtectedMigrationSteps
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke;
  v46[3] = &unk_1E62F5250;
  v46[4] = self;
  sqlite3_int64 v4 = +[HDDatabaseMigrationStep migrationStepWithForeignKeysDisabledFrom:10200 to:11000 handler:v46];
  [v3 addObject:v4];

  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_2;
  v45[3] = &unk_1E62F5250;
  v45[4] = self;
  id v5 = +[HDDatabaseMigrationStep migrationStepFrom:11000 to:11001 handler:v45];
  [v3 addObject:v5];

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_3;
  v44[3] = &unk_1E62F5250;
  void v44[4] = self;
  uint64_t v6 = +[HDDatabaseMigrationStep migrationStepFrom:11001 to:11002 handler:v44];
  [v3 addObject:v6];

  uint64_t v7 = +[HDDatabaseMigrationStep migrationStepFrom:11002 to:11003 handler:&__block_literal_global_242];
  [v3 addObject:v7];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_5;
  v43[3] = &unk_1E62F5250;
  v43[4] = self;
  uint64_t v8 = +[HDDatabaseMigrationStep migrationStepFrom:11003 to:11004 handler:v43];
  [v3 addObject:v8];

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_6;
  v42[3] = &unk_1E62F5250;
  v42[4] = self;
  int v9 = +[HDDatabaseMigrationStep migrationStepFrom:11004 to:11005 handler:v42];
  [v3 addObject:v9];

  id v10 = +[HDDatabaseMigrationStep migrationStepFrom:11005 to:11007 handler:&__block_literal_global_374_1];
  [v3 addObject:v10];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_8;
  v41[3] = &unk_1E62F5250;
  v41[4] = self;
  uint64_t v11 = +[HDDatabaseMigrationStep migrationStepFrom:11007 to:11008 handler:v41];
  [v3 addObject:v11];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_9;
  void v40[3] = &unk_1E62F5250;
  v40[4] = self;
  id v12 = +[HDDatabaseMigrationStep migrationStepFrom:11008 to:11009 handler:v40];
  [v3 addObject:v12];

  int v13 = HDCreateMigrationStep(11009, 11010, (uint64_t)&__block_literal_global_376);
  [v3 addObject:v13];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_11;
  v39[3] = &unk_1E62F5250;
  void v39[4] = self;
  id v14 = +[HDDatabaseMigrationStep migrationStepFrom:11010 to:11011 handler:v39];
  [v3 addObject:v14];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_12;
  v38[3] = &unk_1E62F5250;
  v38[4] = self;
  __int16 v15 = +[HDDatabaseMigrationStep migrationStepFrom:11011 to:11012 handler:v38];
  [v3 addObject:v15];

  uint64_t v16 = +[HDDatabaseMigrationStep migrationStepFrom:11012 to:11013 handler:&__block_literal_global_378_0];
  [v3 addObject:v16];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_14;
  v37[3] = &unk_1E62F5250;
  v37[4] = self;
  uint64_t v17 = HDCreateMigrationStep(11013, 11014, (uint64_t)v37);
  [v3 addObject:v17];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_15;
  v36[3] = &unk_1E62F5250;
  v36[4] = self;
  uint64_t v18 = HDCreateMigrationStep(11014, 11015, (uint64_t)v36);
  [v3 addObject:v18];

  uint64_t v19 = HDCreateMigrationStep(11015, 11028, (uint64_t)&__block_literal_global_380);
  [v3 addObject:v19];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_17;
  v35[3] = &unk_1E62F5250;
  v35[4] = self;
  id v20 = +[HDDatabaseMigrationStep migrationStepFrom:11028 to:11029 handler:v35];
  [v3 addObject:v20];

  uint64_t v21 = +[HDDatabaseMigrationStep migrationStepFrom:11029 to:11033 handler:&__block_literal_global_382];
  [v3 addObject:v21];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  void v34[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_19;
  v34[3] = &unk_1E62F5250;
  void v34[4] = self;
  int v22 = +[HDDatabaseMigrationStep migrationStepFrom:11033 to:11035 handler:v34];
  [v3 addObject:v22];

  unint64_t v23 = +[HDDatabaseMigrationStep migrationStepFrom:11035 to:11036 handler:&__block_literal_global_384];
  [v3 addObject:v23];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_21;
  v33[3] = &unk_1E62F5250;
  v33[4] = self;
  id v24 = +[HDDatabaseMigrationStep migrationStepFrom:11036 to:11040 handler:v33];
  [v3 addObject:v24];

  dispatch_semaphore_t v25 = +[HDDatabaseMigrationStep migrationStepFrom:11040 to:11048 handler:&__block_literal_global_386];
  [v3 addObject:v25];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_23;
  v32[3] = &unk_1E62F5250;
  void v32[4] = self;
  int v26 = +[HDDatabaseMigrationStep migrationStepFrom:11048 to:11049 handler:v32];
  [v3 addObject:v26];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_24;
  v31[3] = &unk_1E62F5250;
  v31[4] = self;
  id v27 = +[HDDatabaseMigrationStep migrationStepFrom:11049 to:11050 handler:v31];
  [v3 addObject:v27];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_25;
  v30[3] = &unk_1E62F5250;
  void v30[4] = self;
  uint64_t v28 = +[HDDatabaseMigrationStep migrationStepFrom:11050 to:11051 handler:v30];
  [v3 addObject:v28];

  return v3;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v7[0] = @"ALTER TABLE data_provenances RENAME TO data_provenances_old";
  v7[1] = @"CREATE TABLE IF NOT EXISTS data_provenances (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, sync_provenance INTEGER NOT NULL, origin_product_type TEXT NOT NULL, origin_build TEXT NOT NULL, local_product_type TEXT NOT NULL, local_build TEXT NOT NULL, source_id INTEGER NOT NULL, device_id INTEGER NOT NULL, source_version TEXT NOT NULL, tz_name TEXT NOT NULL, origin_major_version INTEGER NOT NULL, origin_minor_version INTEGER NOT NULL, origin_patch_version INTEGER NOT NULL, UNIQUE(sync_provenance, origin_product_type, origin_build, local_product_type, local_build, source_id, device_id, source_version, tz_name, origin_major_version, origin_minor_version, origin_patch_version))";
  void v7[2] = @"INSERT INTO data_provenances (rowid, sync_provenance, origin_product_type, origin_build, local_product_type, local_build, source_id, device_id, source_version, tz_name, origin_major_version, origin_minor_version, origin_patch_version) SELECT rowid, sync_provenance, origin_product_type, origin_build, local_product_type, local_build, source_id, device_id, source_version, tz_name, -1, 0, 0 FROM data_provenances_old;";
  void v7[3] = @"DROP TABLE IF EXISTS data_provenances_old;";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  LODWORD(a3) = [v3 executeSQLStatements:v5 error:a3];

  return a3 ^ 1;
}

void *__59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"CREATE TABLE IF NOT EXISTS external_sync_ids (object_id INTEGER NOT NULL REFERENCES objects (data_id) ON DELETE CASCADE, source_id INTEGER NOT NULL, sid TEXT NOT NULL, version REAL NOT NULL, current_flag INTEGER)", a3 error] ^ 1);
  }
  return result;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = [*(id *)(a1 + 32) transaction];
  uint64_t v6 = [v5 protectedDatabase];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __61__HDDatabaseMigrator_Tigris___updateOriginVersionsWithError___block_invoke;
  void v8[3] = &unk_1E6304398;
  void v8[4] = v3;
  LODWORD(a3) = [v6 executeSQL:@"SELECT DISTINCT origin_build, origin_product_type FROM data_provenances WHERE origin_major_version=-1 AND origin_minor_version=0 AND origin_patch_version=0", a3, 0, v8 error bindingHandler enumerationHandler];

  return a3 ^ 1;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_4()
{
  return 0;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE activity_caches RENAME TO activity_caches_old"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS activity_caches (data_id INTEGER PRIMARY KEY, cache_index INTEGER, energy_burned REAL, brisk_minutes REAL, active_hours REAL, steps REAL, vulcan_count REAL, vulcan_condition INTEGER, energy_burned_goal REAL, energy_burned_goal_date REAL, brisk_minutes_goal REAL, active_hours_goal REAL, walk_distance REAL, deep_breathing_duration REAL, active_energy_burned_anchor INTEGER, active_hours_anchor INTEGER, brisk_minutes_anchor INTEGER, energy_burned_goal_anchor INTEGER, step_count_anchor INTEGER, vulcan_count_anchor INTEGER, walking_and_running_distance_anchor INTEGER, workout_anchor INTEGER, deep_breathing_session_anchor INTEGER, flights INTEGER, flights_anchor INTEGER, energy_burned_stats BLOB, brisk_minutes_stats BLOB)"];
  [v5 addObject:@"INSERT INTO activity_caches (data_id, cache_index, energy_burned, brisk_minutes, active_hours, steps, vulcan_count, vulcan_condition, energy_burned_goal, energy_burned_goal_date, brisk_minutes_goal, active_hours_goal, walk_distance, active_energy_burned_anchor, active_hours_anchor, brisk_minutes_anchor, energy_burned_goal_anchor, step_count_anchor, vulcan_count_anchor, walking_and_running_distance_anchor, workout_anchor, flights, flights_anchor) SELECT data_id, cache_index, energy_burned, brisk_minutes, active_hours, steps, vulcan_count, vulcan_condition, energy_burned_goal, energy_burned_goal_date, brisk_minutes_goal, active_hours_goal, walk_distance, active_energy_burned_anchor, active_hours_anchor, brisk_minutes_anchor, energy_burned_goal_anchor, step_count_anchor, vulcan_count_anchor, walking_and_running_distance_anchor, workout_anchor, flights, flights_anchor from activity_caches_old;"];
  [v5 addObject:@"DROP TABLE activity_caches_old"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v7[0] = @"DROP TABLE IF EXISTS external_sync_ids";
  v7[1] = @"CREATE TABLE IF NOT EXISTS external_sync_ids (object_id INTEGER PRIMARY KEY REFERENCES objects (data_id) ON DELETE CASCADE, source_id INTEGER NOT NULL, object_code INTEGER NOT NULL, sid TEXT NOT NULL, version REAL NOT NULL, deleted INTEGER NON NULL)";
  void v7[2] = @"CREATE INDEX IF NOT EXISTS external_sync_ids_source_object_code_sid_deleted ON external_sync_ids (source_id, object_code, sid, deleted)";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  LODWORD(a3) = [v3 executeSQLStatements:v5 error:a3];

  return a3 ^ 1;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_7()
{
  return 0;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v7[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v7[0] = @"ALTER TABLE workout_events RENAME TO workout_events_old;";
  v7[1] = @"CREATE TABLE IF NOT EXISTS workout_events (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, workout_id INTEGER, date REAL, type INTEGER, w_step_style INTEGER, duration REAL NOT NULL);";
  void v7[2] = @"INSERT INTO workout_events (workout_id, date, type, w_step_style, duration) SELECT workout_id, date, type, w_step_style, 0 FROM workout_events_old;";
  void v7[3] = @"DROP TABLE IF EXISTS workout_events_old;";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  LODWORD(a3) = [v3 executeSQLStatements:v5 error:a3];

  return a3 ^ 1;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v7[0] = @"ALTER TABLE metadata_values ADD COLUMN data_value BLOB";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  LODWORD(a3) = [v3 executeSQLStatements:v5 error:a3];

  return a3 ^ 1;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_10()
{
  return 0;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS pending_associations (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, parent_uuid BLOB NOT NULL, child_uuid BLOB NOT NULL, provenance INTEGER NOT NULL, UNIQUE(parent_uuid, child_uuid));"];
  [v5 addObject:@"CREATE INDEX IF NOT EXISTS pending_associations_child ON pending_associations (child_uuid);"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  v7[0] = @"ALTER TABLE workouts ADD COLUMN total_flights_climbed REAL;";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  LODWORD(a3) = [v3 executeSQLStatements:v5 error:a3];

  return a3 ^ 1;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_13()
{
  return 0;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_corry_rewriteHFDStep1WithError:");
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_corry_rewriteHFDStep2WithError:");
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_16()
{
  return 0;
}

void *__59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQLStatements:&unk_1F17EAD70 error:a3] ^ 1);
  }
  return result;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_18()
{
  return 0;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE activity_caches RENAME TO activity_caches_old"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS activity_caches (data_id INTEGER PRIMARY KEY, cache_index INTEGER, energy_burned REAL, brisk_minutes REAL, active_hours REAL, steps REAL, vulcan_count REAL, vulcan_condition INTEGER, energy_burned_goal REAL, energy_burned_goal_date REAL, brisk_minutes_goal REAL, active_hours_goal REAL, walk_distance REAL, deep_breathing_duration REAL, flights INTEGER, energy_burned_stats BLOB, brisk_minutes_stats BLOB)"];
  [v5 addObject:@"INSERT INTO activity_caches SELECT data_id, cache_index, energy_burned, brisk_minutes, active_hours, steps, vulcan_count, vulcan_condition, energy_burned_goal, energy_burned_goal_date, brisk_minutes_goal, active_hours_goal, walk_distance, deep_breathing_duration, flights, energy_burned_stats, brisk_minutes_stats FROM activity_caches_old;"];
  [v5 addObject:@"DROP TABLE activity_caches_old"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_20()
{
  return 0;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE workout_events RENAME TO workout_events_old;"];
  [v5 addObject:@"ALTER TABLE workout_events_old ADD COLUMN metadata BLOB;"];
  if ([v3 executeSQLStatements:v5 error:a3])
  {
    uint64_t v6 = [v3 transaction];
    uint64_t v7 = [v6 protectedDatabase];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__HDDatabaseMigrator_Tigris___addArbitraryMetadataSupportForWorkoutEventsWithError___block_invoke;
    v12[3] = &unk_1E6304398;
    v12[4] = v3;
    int v8 = [v7 executeSQL:@"SELECT * FROM workout_events_old WHERE w_step_style IS NOT NULL" error:a3 bindingHandler:0 enumerationHandler:v12];
  }
  else
  {
    int v8 = 0;
  }
  [v5 removeAllObjects];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS workout_events (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, workout_id INTEGER, date REAL NOT NULL, type INTEGER, duration REAL NOT NULL, metadata BLOB);"];
  [v5 addObject:@"INSERT INTO workout_events (workout_id, date, type, duration, metadata) SELECT workout_id, date, type, duration, metadata FROM workout_events_old;"];
  [v5 addObject:@"DROP TABLE IF EXISTS workout_events_old;"];
  if (v8) {
    int v9 = [v3 executeSQLStatements:v5 error:a3];
  }
  else {
    int v9 = 0;
  }
  uint64_t v10 = v9 ^ 1u;

  return v10;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_22()
{
  return 0;
}

void *__59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"DROP TABLE IF EXISTS trusted_fitness_machines" error:a3] ^ 1);
  }
  return result;
}

void *__59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return (void *)([result executeSQL:@"UPDATE metadata_values SET numerical_value=2 WHERE key_ID=(SELECT ROWID FROM metadata_keys WHERE key='HKVO2MaxTestType') AND numerical_value=4" error:a3] ^ 1);
  }
  return result;
}

uint64_t __59__HDDatabaseMigrator_Tigris__tigrisProtectedMigrationSteps__block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:@"ALTER TABLE activity_caches RENAME TO activity_caches_old"];
  [v5 addObject:@"CREATE TABLE IF NOT EXISTS activity_caches (data_id INTEGER PRIMARY KEY, cache_index INTEGER, sequence INTEGER NOT NULL, energy_burned REAL, brisk_minutes REAL, active_hours REAL, steps REAL, vulcan_count REAL, vulcan_condition INTEGER, energy_burned_goal REAL, energy_burned_goal_date REAL, brisk_minutes_goal REAL, active_hours_goal REAL, walk_distance REAL, deep_breathing_duration REAL, flights INTEGER, energy_burned_stats BLOB, brisk_minutes_stats BLOB)"];
  [v5 addObject:@"INSERT INTO activity_caches SELECT data_id, cache_index, 1, energy_burned, brisk_minutes, active_hours, steps, vulcan_count, vulcan_condition, energy_burned_goal, energy_burned_goal_date, brisk_minutes_goal, active_hours_goal, walk_distance, deep_breathing_duration, flights, energy_burned_stats, brisk_minutes_stats FROM activity_caches_old;"];
  [v5 addObject:@"DROP TABLE activity_caches_old"];
  uint64_t v6 = [v3 executeSQLStatements:v5 error:a3] ^ 1;

  return v6;
}

uint64_t __61__HDDatabaseMigrator_Tigris___updateOriginVersionsWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1C1879F80](a2, 0);
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = MEMORY[0x1C1879F80](a2, 1);
  long long v20 = 0uLL;
  uint64_t v21 = 0;
  HDVersionFromBuildStringForProductType(v6, v7, &v20);
  long long v18 = v20;
  uint64_t v19 = v21;
  if (HKNSOperatingSystemVersionIsUnknown())
  {
    if (v6 != @"UnknownBuild"
      && (!@"UnknownBuild" || (-[__CFString isEqualToString:](v6, "isEqualToString:") & 1) == 0))
    {
      _HKInitializeLogging();
      int v8 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        unint64_t v23 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Unexpected failure in migrating origin build to system versions, build string: %@", buf, 0xCu);
      }
    }
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) transaction];
    uint64_t v11 = [v10 protectedDatabase];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__HDDatabaseMigrator_Tigris___updateOriginVersionsWithError___block_invoke_408;
    v13[3] = &unk_1E630DF48;
    long long v16 = v20;
    uint64_t v17 = v21;
    id v14 = v6;
    id v15 = v7;
    uint64_t v9 = [v11 executeSQL:@"UPDATE OR IGNORE data_provenances SET origin_major_version=?, origin_minor_version=?, origin_patch_version=? WHERE origin_build=? AND origin_product_type=?", a3, v13, 0 error bindingHandler enumerationHandler];
  }
  return v9;
}

uint64_t __61__HDDatabaseMigrator_Tigris___updateOriginVersionsWithError___block_invoke_408(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[6]);
  sqlite3_bind_int64(a2, 2, a1[7]);
  sqlite3_bind_int64(a2, 3, a1[8]);
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __84__HDDatabaseMigrator_Tigris___addArbitraryMetadataSupportForWorkoutEventsWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = HDSQLiteColumnAsInt64();
  long long v16 = @"HKSwimmingStrokeStyle";
  uint64_t v6 = [NSNumber numberWithLongLong:HDSQLiteColumnWithNameAsInt64()];
  v17[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  int v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:a3];
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) transaction];
    uint64_t v10 = [v9 protectedDatabase];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__HDDatabaseMigrator_Tigris___addArbitraryMetadataSupportForWorkoutEventsWithError___block_invoke_2;
    v13[3] = &unk_1E62F5768;
    id v14 = v8;
    uint64_t v15 = v5;
    uint64_t v11 = [v10 executeSQL:@"UPDATE workout_events_old SET metadata = ? WHERE rowid = ?" error:a3 bindingHandler:v13 enumerationHandler:0];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __84__HDDatabaseMigrator_Tigris___addArbitraryMetadataSupportForWorkoutEventsWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

- (id)corryUnprotectedMigrationSteps
{
  return (id)[MEMORY[0x1E4F1CA48] array];
}

- (id)corryProtectedMigrationSteps
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__HDDatabaseMigrator_Corry__corryProtectedMigrationSteps__block_invoke;
  v10[3] = &unk_1E62F5250;
  v10[4] = self;
  sqlite3_int64 v4 = HDCreateMigrationStep(10100, 10200, (uint64_t)v10);
  [v3 addObject:v4];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HDDatabaseMigrator_Corry__corryProtectedMigrationSteps__block_invoke_2;
  v9[3] = &unk_1E62F5250;
  v9[4] = self;
  uint64_t v5 = HDCreateMigrationStep(10200, 10201, (uint64_t)v9);
  [v3 addObject:v5];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __57__HDDatabaseMigrator_Corry__corryProtectedMigrationSteps__block_invoke_3;
  void v8[3] = &unk_1E62F5250;
  void v8[4] = self;
  uint64_t v6 = HDCreateMigrationStep(10201, 10202, (uint64_t)v8);
  [v3 addObject:v6];

  return v3;
}

uint64_t __57__HDDatabaseMigrator_Corry__corryProtectedMigrationSteps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {
    [v3 performHFDMigrationToVersion:10200 handler:&__block_literal_global_246 error:a3];
  }
  return 0;
}

uint64_t __57__HDDatabaseMigrator_Corry__corryProtectedMigrationSteps__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_corry_rewriteHFDStep1WithError:");
}

uint64_t __57__HDDatabaseMigrator_Corry__corryProtectedMigrationSteps__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_corry_rewriteHFDStep2WithError:");
}

uint64_t __67__HDDatabaseMigrator_Corry___corry_fixHFDProtectionClassWithError___block_invoke()
{
  return 0;
}

- (int64_t)_corry_rewriteHFDStep1WithError:(id *)a3
{
  return 0;
}

- (int64_t)_corry_rewriteHFDStep2WithError:(id *)a3
{
  return 0;
}

@end