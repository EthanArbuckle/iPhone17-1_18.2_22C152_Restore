@interface HDRaceRouteSnapshotEntity
+ (BOOL)pruneUnreachableDataWithTransaction:(id)a3 error:(id *)a4;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)insertSnapshotData:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
- (BOOL)deleteDataWithTransaction:(id)a3 error:(id *)a4;
- (BOOL)updateSnapshotData:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)snapshotDataWithTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDRaceRouteSnapshotEntity

+ (id)insertSnapshotData:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 databaseForEntityClass:a1];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = -1;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__HDRaceRouteSnapshotEntity_insertSnapshotData_transaction_error___block_invoke;
  v19[3] = &unk_1E62F43C8;
  id v11 = v8;
  id v20 = v11;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__HDRaceRouteSnapshotEntity_insertSnapshotData_transaction_error___block_invoke_2;
  v18[3] = &unk_1E62F3640;
  v18[4] = &v21;
  if ([v10 executeSQL:@"SELECT ROWID FROM RacePreviousRoute_route_snapshot WHERE data = ?" error:a5 bindingHandler:v19 enumerationHandler:v18])
  {
    if (v22[3] < 0)
    {
      v25[0] = @"data";
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __66__HDRaceRouteSnapshotEntity_insertSnapshotData_transaction_error___block_invoke_3;
      v16[3] = &unk_1E62F35C8;
      id v17 = v11;
      v13 = [a1 insertOrReplaceEntity:0 database:v10 properties:v14 error:a5 bindingHandler:v16];
    }
    else
    {
      v12 = [HDRaceRouteSnapshotEntity alloc];
      v13 = [(HDSQLiteEntity *)v12 initWithPersistentID:v22[3]];
    }
  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(&v21, 8);

  return v13;
}

uint64_t __66__HDRaceRouteSnapshotEntity_insertSnapshotData_transaction_error___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __66__HDRaceRouteSnapshotEntity_insertSnapshotData_transaction_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

void __66__HDRaceRouteSnapshotEntity_insertSnapshotData_transaction_error___block_invoke_3()
{
}

+ (BOOL)pruneUnreachableDataWithTransaction:(id)a3 error:(id *)a4
{
  v6 = NSString;
  id v7 = a3;
  id v8 = +[HDWorkoutClusterEntity databaseTable];
  id v9 = +[HDRaceRouteClusterEntity databaseTable];
  v10 = [v6 stringWithFormat:@"DELETE FROM RacePreviousRoute_route_snapshot WHERE (NOT EXISTS (SELECT * FROM %@ WHERE %@ = RacePreviousRoute_route_snapshot.ROWID)) AND (NOT EXISTS (SELECT * FROM %@ WHERE %@ = RacePreviousRoute_route_snapshot.ROWID))", v8, @"snapshot_id", v9, @"snapshot_id"];

  id v11 = [v7 databaseForEntityClass:a1];

  LOBYTE(a4) = [v11 executeSQL:v10 error:a4 bindingHandler:0 enumerationHandler:0];
  return (char)a4;
}

- (BOOL)updateSnapshotData:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17[0] = @"data";
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  id v11 = [v9 arrayWithObjects:v17 count:1];
  v12 = [v10 databaseForEntity:self];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__HDRaceRouteSnapshotEntity_updateSnapshotData_transaction_error___block_invoke;
  v15[3] = &unk_1E62F35C8;
  id v16 = v8;
  id v13 = v8;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v11 database:v12 error:a5 bindingHandler:v15];

  return (char)a5;
}

void __66__HDRaceRouteSnapshotEntity_updateSnapshotData_transaction_error___block_invoke()
{
}

- (id)snapshotDataWithTransaction:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__202;
  id v16 = __Block_byref_object_dispose__202;
  id v17 = 0;
  v18[0] = @"data";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v7 = [v5 databaseForEntity:self];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__HDRaceRouteSnapshotEntity_snapshotDataWithTransaction_error___block_invoke;
  v11[3] = &unk_1E62F8848;
  v11[4] = &v12;
  LODWORD(self) = [(HDSQLiteEntity *)self getValuesForProperties:v6 database:v7 handler:v11];

  if (self) {
    id v8 = (void *)v13[5];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __63__HDRaceRouteSnapshotEntity_snapshotDataWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsData();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)deleteDataWithTransaction:(id)a3 error:(id *)a4
{
  v6 = NSString;
  id v7 = a3;
  id v8 = +[HDWorkoutClusterEntity databaseTable];
  id v9 = +[HDRaceRouteClusterEntity databaseTable];
  id v10 = [v6 stringWithFormat:@"DELETE FROM RacePreviousRoute_route_snapshot WHERE ROWID = ? AND((SELECT COUNT(*) FROM %@ WHERE %@ = RacePreviousRoute_route_snapshot.ROWID) + (SELECT COUNT(*) FROM %@ WHERE %@ = RacePreviousRoute_route_snapshot.ROWID) <= 1)", v8, @"snapshot_id", v9, @"snapshot_id"];

  id v11 = [v7 databaseForEntity:self];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__HDRaceRouteSnapshotEntity_deleteDataWithTransaction_error___block_invoke;
  v13[3] = &unk_1E62F43C8;
  v13[4] = self;
  LOBYTE(a4) = [v11 executeSQL:v10 error:a4 bindingHandler:v13 enumerationHandler:0];

  return (char)a4;
}

uint64_t __61__HDRaceRouteSnapshotEntity_deleteDataWithTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

+ (id)databaseTable
{
  return @"RacePreviousRoute_route_snapshot";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_101;
}

+ (int64_t)protectionClass
{
  return 2;
}

@end