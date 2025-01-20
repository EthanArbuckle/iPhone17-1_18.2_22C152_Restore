@interface HDDataExternalSyncIdentifierEntity
+ (BOOL)enumerateValuesWithProfile:(id)a3 error:(id *)a4 handler:(id)a5;
+ (BOOL)insertSyncIdentifierWithProfile:(id)a3 database:(id)a4 objectID:(int64_t)a5 localSourceID:(int64_t)a6 externalSyncObjectCode:(int64_t)a7 syncIdentifier:(id)a8 syncVersion:(id)a9 deleted:(BOOL)a10 errorOut:(id *)a11;
+ (BOOL)populateSyncInfoForLocalSourceID:(int64_t)a3 externalSyncObjectCode:(int64_t)a4 syncIdentifier:(id)a5 deleted:(BOOL)a6 database:(id)a7 objectIDOut:(id *)a8 errorOut:(id *)a9;
+ (BOOL)populateSyncInfoForObjectID:(int64_t)a3 database:(id)a4 localSourceIDOut:(int64_t *)a5 externalSyncObjectCodeOut:(int64_t *)a6 syncIdentifierOut:(id *)a7 syncVersionOut:(id *)a8 deletedOut:(BOOL *)a9 errorOut:(id *)a10;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)indices;
+ (int64_t)protectionClass;
@end

@implementation HDDataExternalSyncIdentifierEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return @"external_sync_ids";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_70;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"object_id";
  v2 = +[HDDataEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)indices
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v3 = objc_opt_class();
  v8[0] = @"source_id";
  v8[1] = @"object_code";
  v8[2] = @"sid";
  v8[3] = @"deleted";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
  v5 = (void *)[v2 initWithEntity:v3 name:@"source_object_code_sid_deleted" columns:v4];
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v6;
}

+ (BOOL)populateSyncInfoForLocalSourceID:(int64_t)a3 externalSyncObjectCode:(int64_t)a4 syncIdentifier:(id)a5 deleted:(BOOL)a6 database:(id)a7 objectIDOut:(id *)a8 errorOut:(id *)a9
{
  id v15 = a5;
  id v16 = a7;
  if (!v16)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"HDDataExternalSyncIdentifierEntity.m", 105, @"Invalid parameter not satisfying: %@", @"database != nil" object file lineNumber description];
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__142;
  v30 = __Block_byref_object_dispose__142;
  id v31 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __147__HDDataExternalSyncIdentifierEntity_populateSyncInfoForLocalSourceID_externalSyncObjectCode_syncIdentifier_deleted_database_objectIDOut_errorOut___block_invoke;
  v22[3] = &unk_1E62F3618;
  int64_t v24 = a3;
  int64_t v25 = a4;
  id v17 = v15;
  id v23 = v17;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __147__HDDataExternalSyncIdentifierEntity_populateSyncInfoForLocalSourceID_externalSyncObjectCode_syncIdentifier_deleted_database_objectIDOut_errorOut___block_invoke_2;
  v21[3] = &unk_1E62F3640;
  v21[4] = &v26;
  char v18 = [v16 executeSQL:@"SELECT object_id FROM external_sync_ids WHERE source_id = ? AND object_code = ? AND sid = ? AND NOT deleted" error:a9 bindingHandler:v22 enumerationHandler:v21];
  *a8 = (id) v27[5];

  _Block_object_dispose(&v26, 8);
  return v18;
}

uint64_t __147__HDDataExternalSyncIdentifierEntity_populateSyncInfoForLocalSourceID_externalSyncObjectCode_syncIdentifier_deleted_database_objectIDOut_errorOut___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 48));

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __147__HDDataExternalSyncIdentifierEntity_populateSyncInfoForLocalSourceID_externalSyncObjectCode_syncIdentifier_deleted_database_objectIDOut_errorOut___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

+ (BOOL)populateSyncInfoForObjectID:(int64_t)a3 database:(id)a4 localSourceIDOut:(int64_t *)a5 externalSyncObjectCodeOut:(int64_t *)a6 syncIdentifierOut:(id *)a7 syncVersionOut:(id *)a8 deletedOut:(BOOL *)a9 errorOut:(id *)a10
{
  id v17 = a4;
  if (!v17)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"HDDataExternalSyncIdentifierEntity.m", 143, @"Invalid parameter not satisfying: %@", @"database != nil" object file lineNumber description];
  }
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__142;
  v37 = __Block_byref_object_dispose__142;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__142;
  id v31 = __Block_byref_object_dispose__142;
  id v32 = 0;
  uint64_t v23 = 0;
  int64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __171__HDDataExternalSyncIdentifierEntity_populateSyncInfoForObjectID_database_localSourceIDOut_externalSyncObjectCodeOut_syncIdentifierOut_syncVersionOut_deletedOut_errorOut___block_invoke;
  v22[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  void v22[4] = a3;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __171__HDDataExternalSyncIdentifierEntity_populateSyncInfoForObjectID_database_localSourceIDOut_externalSyncObjectCodeOut_syncIdentifierOut_syncVersionOut_deletedOut_errorOut___block_invoke_2;
  v21[3] = &unk_1E6305F50;
  v21[4] = &v43;
  void v21[5] = &v39;
  v21[6] = &v33;
  v21[7] = &v27;
  v21[8] = &v23;
  char v18 = [v17 executeSQL:@"SELECT source_id, object_code, sid, version, deleted FROM external_sync_ids WHERE object_id = ?", a10, v22, v21 error bindingHandler enumerationHandler];
  if (a5) {
    *a5 = v44[3];
  }
  if (a6) {
    *a6 = v40[3];
  }
  if (a9) {
    *a9 = *((unsigned char *)v24 + 24);
  }
  *a7 = (id) v34[5];
  *a8 = (id) v28[5];
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  return v18;
}

uint64_t __171__HDDataExternalSyncIdentifierEntity_populateSyncInfoForObjectID_database_localSourceIDOut_externalSyncObjectCodeOut_syncIdentifierOut_syncVersionOut_deletedOut_errorOut___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __171__HDDataExternalSyncIdentifierEntity_populateSyncInfoForObjectID_database_localSourceIDOut_externalSyncObjectCodeOut_syncIdentifierOut_syncVersionOut_deletedOut_errorOut___block_invoke_2(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(void *)(*(void *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  uint64_t v4 = MEMORY[0x1C1879F80](a2, 2);
  uint64_t v5 = *(void *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = MEMORY[0x1C1879F70](a2, 3);
  uint64_t v8 = *(void *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = MEMORY[0x1C1879F00](a2, 4);
  return 0;
}

+ (BOOL)insertSyncIdentifierWithProfile:(id)a3 database:(id)a4 objectID:(int64_t)a5 localSourceID:(int64_t)a6 externalSyncObjectCode:(int64_t)a7 syncIdentifier:(id)a8 syncVersion:(id)a9 deleted:(BOOL)a10 errorOut:(id *)a11
{
  id v27 = a3;
  id v18 = a4;
  id v19 = a8;
  id v20 = a9;
  if (!v19)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"HDDataExternalSyncIdentifierEntity.m", 200, @"Invalid parameter not satisfying: %@", @"syncIdentifier != nil" object file lineNumber description];
  }
  if (!v20)
  {
    char v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"HDDataExternalSyncIdentifierEntity.m", 201, @"Invalid parameter not satisfying: %@", @"syncVersion != nil" object file lineNumber description];
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __169__HDDataExternalSyncIdentifierEntity_insertSyncIdentifierWithProfile_database_objectID_localSourceID_externalSyncObjectCode_syncIdentifier_syncVersion_deleted_errorOut___block_invoke;
  v28[3] = &unk_1E6305F78;
  int64_t v31 = a5;
  int64_t v32 = a6;
  int64_t v33 = a7;
  id v29 = v19;
  id v30 = v20;
  BOOL v34 = a10;
  id v21 = v20;
  id v22 = v19;
  char v23 = [v18 executeSQL:@"INSERT INTO external_sync_ids (object_id, source_id, object_code, sid, version, deleted) VALUES (?, ?, ?, ?, ?, ?)", a11, v28, 0 error bindingHandler enumerationHandler];

  return v23;
}

uint64_t __169__HDDataExternalSyncIdentifierEntity_insertSyncIdentifierWithProfile_database_objectID_localSourceID_externalSyncObjectCode_syncIdentifier_syncVersion_deleted_errorOut___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 48));
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 56));
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 64));
  HDSQLiteBindStringToStatement();
  HDSQLiteBindFoundationValueToStatement();
  int v4 = *(unsigned __int8 *)(a1 + 72);

  return sqlite3_bind_int(a2, 6, v4);
}

+ (BOOL)enumerateValuesWithProfile:(id)a3 error:(id *)a4 handler:(id)a5
{
  v16[6] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v16[0] = @"object_id";
  v16[1] = @"source_id";
  v16[2] = @"object_code";
  v16[3] = @"sid";
  v16[4] = @"version";
  v16[5] = @"deleted";
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a3;
  v10 = [v8 arrayWithObjects:v16 count:6];
  v11 = [v9 database];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__HDDataExternalSyncIdentifierEntity_enumerateValuesWithProfile_error_handler___block_invoke;
  v14[3] = &unk_1E62F35F0;
  id v15 = v7;
  id v12 = v7;
  LOBYTE(a4) = +[HDHealthEntity enumerateProperties:v10 withPredicate:0 healthDatabase:v11 error:a4 enumerationHandler:v14];

  return (char)a4;
}

uint64_t __79__HDDataExternalSyncIdentifierEntity_enumerateValuesWithProfile_error_handler___block_invoke(uint64_t a1)
{
  HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsInt64();
  id v2 = HDSQLiteColumnWithNameAsString();
  uint64_t v3 = HDSQLiteColumnWithNameAsNumber();
  HDSQLiteColumnWithNameAsBoolean();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return 1;
}

@end