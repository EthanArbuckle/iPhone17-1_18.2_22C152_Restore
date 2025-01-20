@interface HDRacePreviousRouteSchemaProvider
+ (id)databaseEntitiesForProtectionClass:(int64_t)a3;
+ (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3;
+ (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4;
@end

@implementation HDRacePreviousRouteSchemaProvider

+ (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  return 16 * (a3 != 1);
}

+ (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  v5[4] = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    v5[0] = objc_opt_class();
    v5[1] = objc_opt_class();
    v5[2] = objc_opt_class();
    v5[3] = objc_opt_class();
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

+ (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  if (a3 == 2)
  {
    id v5 = a4;
    self;
    [v5 addMigrationForSchema:@"RacePreviousRoute" toVersion:11 foreignKeyStatus:0 handler:&__block_literal_global_10];

    id v6 = v5;
    self;
    [v6 addMigrationForSchema:@"RacePreviousRoute" toVersion:12 foreignKeyStatus:0 handler:&__block_literal_global_313];

    id v7 = v6;
    self;
    [v7 addMigrationForSchema:@"RacePreviousRoute" toVersion:13 foreignKeyStatus:0 handler:&__block_literal_global_321];

    id v8 = v7;
    self;
    [v8 addMigrationForSchema:@"RacePreviousRoute" toVersion:14 foreignKeyStatus:0 handler:&__block_literal_global_341];

    id v9 = v8;
    self;
    [v9 addMigrationForSchema:@"RacePreviousRoute" toVersion:15 foreignKeyStatus:0 handler:&__block_literal_global_456];

    id v10 = v9;
    self;
    [v10 addMigrationForSchema:@"RacePreviousRoute" toVersion:16 foreignKeyStatus:0 handler:&__block_literal_global_482];
  }
}

uint64_t __83__HDRacePreviousRouteSchemaProvider__addWorkoutAndRacingClusterTablesWithMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = [a3 protectedDatabase];
  LODWORD(a5) = [v6 executeSQLStatements:&unk_1F17E9018 error:a5];

  return a5 ^ 1;
}

uint64_t __74__HDRacePreviousRouteSchemaProvider__addGenerationQueueTableWithMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = [a3 protectedDatabase];
  LODWORD(a5) = [v6 executeSQLStatements:&unk_1F17E9030 error:a5];

  return a5 ^ 1;
}

uint64_t __80__HDRacePreviousRouteSchemaProvider__addConcreteClusterSyncAnchorsWithMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = [a3 protectedDatabase];
  LODWORD(a5) = [v6 executeSQLStatements:&unk_1F17E9048 error:a5];

  return a5 ^ 1;
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [v8 protectedDatabase];
  uint64_t v10 = 1;
  if ([v9 executeSQLStatements:&unk_1F17E9060 error:a5])
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 1;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_2;
    v24[3] = &unk_1E62F4418;
    id v11 = v9;
    id v25 = v11;
    v26 = @"INSERT INTO RacePreviousRoute_route_snapshot (data) VALUES (?)";
    v28 = &v30;
    v29 = v34;
    v27 = @"INSERT INTO RacePreviousRoute_workout_cluster_new (uuid, relevance, last_workout_id, best_workout_id, snapshot_id, route_label, modified_date) VALUES (?, ?, ?, ?, ?, ?, ?)";
    if ([v11 executeUncachedSQL:@"SELECT uuid, relevance, last_workout_id, best_workout_id, route_snapshot, route_label, modified_date FROM RacePreviousRoute_workout_cluster", a5, 0, v24 error bindingHandler enumerationHandler]&& *((unsigned char *)v31 + 24))
    {
      uint64_t v10 = 1;
      if ([v11 executeUncachedSQL:@"INSERT INTO RacePreviousRoute_concrete_cluster_new (uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_route_key, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_route_key, snapshot_id, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor) SELECT cc.uuid, workout_cluster_uuid, cc.relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_route_key, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_route_key, nwc.snapshot_id, cc.route_label, cc.modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor FROM RacePreviousRoute_concrete_cluster cc  INNER JOIN RacePreviousRoute_workout_cluster_new nwc ON cc.workout_cluster_uuid = nwc.uuid", a5, 0, 0 error bindingHandler enumerationHandler])
      {
        uint64_t v20 = 0;
        v21 = &v20;
        uint64_t v22 = 0x2020000000;
        char v23 = 1;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_5;
        v14[3] = &unk_1E62F4418;
        id v12 = v11;
        id v15 = v12;
        v16 = @"INSERT INTO RacePreviousRoute_route_snapshot (data) VALUES (?)";
        v18 = &v20;
        v19 = v34;
        v17 = @"INSERT INTO RacePreviousRoute_concrete_cluster_new (uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_route_key, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_route_key, snapshot_id, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        if ([v12 executeUncachedSQL:@"SELECT uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_route_key, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_route_key, route_snapshot, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor FROM RacePreviousRoute_concrete_cluster WHERE uuid NOT IN (SELECT uuid FROM RacePreviousRoute_concrete_cluster_new)", a5, 0, v14 error bindingHandler enumerationHandler]&& *((unsigned char *)v21 + 24))
        {
          uint64_t v10 = [v12 executeSQLStatements:&unk_1F17E9078 error:a5] ^ 1;
        }
        else
        {
          uint64_t v10 = 1;
        }

        _Block_object_dispose(&v20, 8);
      }
    }
    else
    {
      uint64_t v10 = 1;
    }

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(v34, 8);
  }

  return v10;
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = HDSQLiteColumnWithNameAsData();
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_3;
  v32[3] = &unk_1E62F43C8;
  id v8 = v5;
  id v33 = v8;
  if ([v6 executeSQL:v7 error:a3 bindingHandler:v32 enumerationHandler:0])
  {
    ++*(void *)(*(void *)(a1[8] + 8) + 24);
    id v9 = HDSQLiteColumnWithNameAsUUID();
    HDSQLiteColumnWithNameAsDouble();
    uint64_t v11 = v10;
    uint64_t v12 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v13 = HDSQLiteColumnWithNameAsInt64();
    v14 = HDSQLiteColumnWithNameAsString();
    id v15 = HDSQLiteColumnWithNameAsDate();
    uint64_t v16 = a1[6];
    char v23 = (void *)a1[4];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_4;
    v24[3] = &unk_1E62F43F0;
    id v17 = v9;
    uint64_t v29 = v11;
    uint64_t v30 = v12;
    uint64_t v31 = v13;
    uint64_t v18 = a1[8];
    id v25 = v17;
    uint64_t v28 = v18;
    id v19 = v14;
    id v26 = v19;
    id v20 = v15;
    id v27 = v20;
    uint64_t v21 = [v23 executeSQL:v16 error:a3 bindingHandler:v24 enumerationHandler:0];
    if ((v21 & 1) == 0) {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    }
  }
  else
  {
    uint64_t v21 = 0;
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
  }

  return v21;
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_3()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 64));
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 72));
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 80));
  sqlite3_bind_int64(a2, 5, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_5(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = HDSQLiteColumnWithNameAsData();
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_6;
  v73[3] = &unk_1E62F43C8;
  id v8 = v5;
  id v74 = v8;
  if ([v6 executeSQL:v7 error:a3 bindingHandler:v73 enumerationHandler:0])
  {
    id v49 = v8;
    ++*(void *)(*(void *)(a1[8] + 8) + 24);
    id v9 = HDSQLiteColumnWithNameAsUUID();
    uint64_t v10 = HDSQLiteColumnWithNameAsUUID();
    HDSQLiteColumnWithNameAsDouble();
    uint64_t v12 = v11;
    uint64_t v13 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v14 = HDSQLiteColumnWithNameAsInt64();
    HDSQLiteColumnWithNameAsUUID();
    id v15 = v48 = a3;
    uint64_t v16 = HDSQLiteColumnWithNameAsDate();
    HDSQLiteColumnWithNameAsDouble();
    uint64_t v18 = v17;
    HDSQLiteColumnWithNameAsDouble();
    uint64_t v20 = v19;
    uint64_t v46 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v21 = HDSQLiteColumnWithNameAsUUID();
    v45 = HDSQLiteColumnWithNameAsDate();
    HDSQLiteColumnWithNameAsDouble();
    uint64_t v23 = v22;
    HDSQLiteColumnWithNameAsDouble();
    uint64_t v25 = v24;
    uint64_t v44 = HDSQLiteColumnWithNameAsInt64();
    v43 = HDSQLiteColumnWithNameAsString();
    v42 = HDSQLiteColumnWithNameAsDate();
    uint64_t v41 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v40 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v39 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v26 = HDSQLiteColumnWithNameAsInt64();
    v38 = (void *)a1[4];
    uint64_t v27 = a1[6];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_7;
    v50[3] = &unk_1E62F4440;
    id v47 = v9;
    id v51 = v47;
    id v28 = v10;
    id v52 = v28;
    uint64_t v60 = v12;
    uint64_t v61 = v13;
    uint64_t v62 = v14;
    id v29 = v15;
    id v53 = v29;
    id v30 = v16;
    id v54 = v30;
    uint64_t v63 = v18;
    uint64_t v64 = v20;
    uint64_t v65 = v46;
    id v31 = v21;
    id v55 = v31;
    id v32 = v45;
    uint64_t v66 = v23;
    uint64_t v67 = v25;
    uint64_t v68 = v44;
    uint64_t v33 = a1[8];
    id v56 = v32;
    uint64_t v59 = v33;
    id v34 = v43;
    id v57 = v34;
    id v35 = v42;
    id v58 = v35;
    uint64_t v69 = v41;
    uint64_t v70 = v40;
    uint64_t v71 = v39;
    uint64_t v72 = v26;
    uint64_t v36 = [v38 executeSQL:v27 error:v48 bindingHandler:v50 enumerationHandler:0];
    if ((v36 & 1) == 0) {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    }

    id v8 = v49;
  }
  else
  {
    uint64_t v36 = 0;
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
  }

  return v36;
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_6()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_7(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 104));
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 112));
  sqlite3_bind_int64(a2, 5, *(void *)(a1 + 120));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 8, *(double *)(a1 + 128));
  sqlite3_bind_double(a2, 9, *(double *)(a1 + 136));
  sqlite3_bind_int64(a2, 10, *(void *)(a1 + 144));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 13, *(double *)(a1 + 152));
  sqlite3_bind_double(a2, 14, *(double *)(a1 + 160));
  sqlite3_bind_int64(a2, 15, *(void *)(a1 + 168));
  sqlite3_bind_int64(a2, 16, *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 19, *(void *)(a1 + 176));
  sqlite3_bind_int64(a2, 20, *(void *)(a1 + 184));
  sqlite3_bind_int64(a2, 21, *(void *)(a1 + 192));
  sqlite3_int64 v4 = *(void *)(a1 + 200);

  return sqlite3_bind_int64(a2, 22, v4);
}

uint64_t __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = a3;
  uint64_t v7 = [v6 protectedDatabase];
  int v8 = [v7 executeSQLStatements:&unk_1F17E9090 error:a5];

  if (v8)
  {
    id v9 = [v6 protectedDatabase];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_2;
    v13[3] = &unk_1E62F3D38;
    id v10 = v9;
    id v14 = v10;
    if ([v10 executeUncachedSQL:@"SELECT uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_route_key, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_route_key, snapshot_id, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor FROM RacePreviousRoute_concrete_cluster", a5, 0, v13 error bindingHandler enumerationHandler])uint64_t v11 = objc_msgSend(v10, "executeSQLStatements:error:", &unk_1F17E90A8, a5) ^ 1; {
    else
    }
      uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

uint64_t __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v45 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v44 = HDSQLiteColumnWithNameAsUUID();
  HDSQLiteColumnWithNameAsDouble();
  uint64_t v5 = v4;
  uint64_t v40 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v39 = HDSQLiteColumnWithNameAsInt64();
  id v6 = HDSQLiteColumnWithNameAsUUID();
  id v47 = HDSQLiteColumnWithNameAsDate();
  HDSQLiteColumnWithNameAsDouble();
  uint64_t v8 = v7;
  HDSQLiteColumnWithNameAsDouble();
  uint64_t v10 = v9;
  uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
  id v49 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v46 = HDSQLiteColumnWithNameAsDate();
  HDSQLiteColumnWithNameAsDouble();
  uint64_t v13 = v12;
  HDSQLiteColumnWithNameAsDouble();
  uint64_t v15 = v14;
  uint64_t v41 = (void *)HDSQLiteColumnWithNameAsInt64();
  uint64_t v16 = HDSQLiteColumnWithNameAsInt64();
  v42 = HDSQLiteColumnWithNameAsString();
  v43 = HDSQLiteColumnWithNameAsDate();
  uint64_t v17 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v18 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v19 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v20 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v21 = *(void **)(a1 + 32);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_3;
  v75[3] = &unk_1E62F33F8;
  id v22 = v6;
  id v76 = v22;
  uint64_t v77 = v11;
  if ([v21 executeSQL:@"INSERT INTO RacePreviousRoute_workout (workout_uuid, route_key, date_to_delete) VALUES (?, ?, ?)", a3, v75, 0 error bindingHandler enumerationHandler])
  {
    uint64_t v37 = v18;
    uint64_t v38 = v17;
    id v23 = [*(id *)(a1 + 32) lastInsertRowID];
    uint64_t v24 = v23;
    uint64_t v25 = v20;
    if (v41 != (void *)v11)
    {
      uint64_t v26 = *(void **)(a1 + 32);
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_4;
      v73[3] = &unk_1E62F33F8;
      uint64_t v27 = v23;
      v74[0] = v49;
      v74[1] = v41;
      if (![v26 executeSQL:@"INSERT INTO RacePreviousRoute_workout (workout_uuid, route_key, date_to_delete) VALUES (?, ?, ?)", a3, v73, 0 error bindingHandler enumerationHandler])
      {
        uint64_t v35 = 0;
        id v29 = v74;
        id v32 = v27;
        id v34 = v43;
        id v31 = v44;
        uint64_t v33 = v42;
        goto LABEL_8;
      }
      uint64_t v24 = [*(id *)(a1 + 32) lastInsertRowID];

      id v23 = v27;
    }
    id v28 = *(void **)(a1 + 32);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_5;
    v50[3] = &unk_1E62F4468;
    id v29 = &v51;
    id v30 = v23;
    id v51 = v45;
    id v31 = v44;
    id v52 = v44;
    uint64_t v61 = v5;
    uint64_t v62 = v40;
    uint64_t v63 = v39;
    id v53 = v22;
    id v54 = v47;
    uint64_t v64 = v8;
    uint64_t v65 = v10;
    id v55 = v30;
    id v56 = v49;
    id v57 = v46;
    uint64_t v66 = v13;
    uint64_t v67 = v15;
    id v32 = v24;
    id v58 = v32;
    uint64_t v68 = v16;
    uint64_t v33 = v42;
    id v59 = v42;
    id v34 = v43;
    id v60 = v43;
    uint64_t v69 = v38;
    uint64_t v70 = v37;
    uint64_t v71 = v19;
    uint64_t v72 = v25;
    uint64_t v35 = [v28 executeSQL:@"INSERT INTO RacePreviousRoute_concrete_cluster_new (uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_workout_rowid, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_workout_rowid, snapshot_id, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", a3, v50, 0 error bindingHandler enumerationHandler];

    uint64_t v27 = v30;
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v35 = 0;
  id v34 = v43;
  id v31 = v44;
  uint64_t v33 = v42;
LABEL_9:

  return v35;
}

uint64_t __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 40));

  return sqlite3_bind_null(a2, 3);
}

uint64_t __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 40));

  return sqlite3_bind_null(a2, 3);
}

uint64_t __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 112));
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 120));
  sqlite3_bind_int64(a2, 5, *(void *)(a1 + 128));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 8, *(double *)(a1 + 136));
  sqlite3_bind_double(a2, 9, *(double *)(a1 + 144));
  sqlite3_bind_int64(a2, 10, [*(id *)(a1 + 64) longLongValue]);
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 13, *(double *)(a1 + 152));
  sqlite3_bind_double(a2, 14, *(double *)(a1 + 160));
  sqlite3_bind_int64(a2, 15, [*(id *)(a1 + 88) longLongValue]);
  sqlite3_bind_int64(a2, 16, *(void *)(a1 + 168));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 19, *(void *)(a1 + 176));
  sqlite3_bind_int64(a2, 20, *(void *)(a1 + 184));
  sqlite3_bind_int64(a2, 21, *(void *)(a1 + 192));
  sqlite3_int64 v4 = *(void *)(a1 + 200);

  return sqlite3_bind_int64(a2, 22, v4);
}

uint64_t __88__HDRacePreviousRouteSchemaProvider__addSyncIdentityToConcreteClusterTableWithMigrator___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v8 protectedDatabase];
  if (!objc_msgSend(v9, "executeUncachedSQL:error:", @"CREATE TABLE RacePreviousRoute_concrete_cluster_new (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB NOT NULL, workout_cluster_uuid BLOB NOT NULL, relevance REAL NOT NULL, workout_activity_type INTEGER NOT NULL, workout_cluster_size INTEGER NOT NULL, last_workout_uuid BLOB NOT NULL, last_workout_date REAL NOT NULL, last_workout_distance REAL NOT NULL, last_workout_duration REAL NOT NULL, last_workout_rowid INTEGER NOT NULL, best_workout_uuid BLOB NOT NULL, best_workout_date REAL NOT NULL, best_workout_distance REAL NOT NULL, best_workout_duration REAL NOT NULL, best_workout_rowid INTEGER NOT NULL, snapshot_id INTEGER NOT NULL REFERENCES RacePreviousRoute_route_snapshot (ROWID) ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED, route_label TEXT NOT NULL, modified_date REAL NOT NULL, sync_provenance INTEGER NOT NULL, frozen INTEGER NOT NULL, sync_anchor INTEGER NOT NULL, relevance_anchor INTEGER NOT NULL, sync_identity INTEGER NOT NULL, UNIQUE(uuid));",
                        a5)
    || (uint64_t v10 = [v7 fetchLegacySyncIdentity:v8 error:a5], v10 == -1))
  {
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v11 = v10;
    uint64_t v12 = [NSString stringWithFormat:@"INSERT INTO RacePreviousRoute_concrete_cluster_new (ROWID, uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_workout_rowid, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_workout_rowid, snapshot_id, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor, sync_identity) SELECT ROWID, uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_workout_rowid, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_workout_rowid, snapshot_id, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor, ? FROM RacePreviousRoute_concrete_cluster;"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__HDRacePreviousRouteSchemaProvider__addSyncIdentityToConcreteClusterTableWithMigrator___block_invoke_2;
    v16[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v16[4] = v11;
    if ([v9 executeSQL:v12 error:a5 bindingHandler:v16 enumerationHandler:0])
    {
      v17[0] = @"DROP TABLE RacePreviousRoute_concrete_cluster;";
      v17[1] = @"ALTER TABLE RacePreviousRoute_concrete_cluster_new RENAME TO RacePreviousRoute_concrete_cluster;";
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      uint64_t v14 = [v9 executeSQLStatements:v13 error:a5] ^ 1;
    }
    else
    {
      uint64_t v14 = 1;
    }
  }
  return v14;
}

uint64_t __88__HDRacePreviousRouteSchemaProvider__addSyncIdentityToConcreteClusterTableWithMigrator___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

@end