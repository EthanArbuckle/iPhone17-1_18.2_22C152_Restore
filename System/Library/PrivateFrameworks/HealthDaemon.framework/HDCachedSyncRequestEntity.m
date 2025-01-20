@interface HDCachedSyncRequestEntity
+ (BOOL)clearInProgressSyncRequests:(id)a3 error:(id *)a4;
+ (BOOL)fetchCoalescedSyncRequest:(id *)a3 transaction:(id)a4 error:(id *)a5;
+ (BOOL)insertSyncRequest:(id)a3 reason:(id)a4 date:(id)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)markInProgressRequestsAsPending:(id)a3 error:(id *)a4;
+ (BOOL)markPendingRequestsAsInProgress:(id)a3 error:(id *)a4;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_extractRequest:;
+ (id)databaseTable;
+ (id)fetchAllInProgressSyncRequests:(id)a3 error:(id *)a4;
+ (id)fetchAllSyncRequests:(id)a3 error:(id *)a4;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateOverAllSyncRequests:(uint64_t)a3 error:(void *)a4 enumerationHandler:;
@end

@implementation HDCachedSyncRequestEntity

+ (id)databaseTable
{
  return @"cached_sync_requests";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 16;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDCachedSyncRequestEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (BOOL)insertSyncRequest:(id)a3 reason:(id)a4 date:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = [a6 database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__HDCachedSyncRequestEntity_insertSyncRequest_reason_date_profile_error___block_invoke;
  v20[3] = &unk_1E62F2E18;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  id v24 = a1;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  LOBYTE(a7) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v15 error:a7 block:v20];

  return (char)a7;
}

uint64_t __73__HDCachedSyncRequestEntity_insertSyncRequest_reason_date_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__HDCachedSyncRequestEntity_insertSyncRequest_reason_date_profile_error___block_invoke_2;
  v12[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v12[4] = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__HDCachedSyncRequestEntity_insertSyncRequest_reason_date_profile_error___block_invoke_3;
  v8[3] = &unk_1E62F2DF0;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  uint64_t v6 = [v5 executeCachedStatementForKey:&HDCachedSyncRequestEntityCreationDate_block_invoke_lookupKey error:a3 SQLGenerator:v12 bindingHandler:v8 enumerationHandler:0];

  return v6;
}

id __73__HDCachedSyncRequestEntity_insertSyncRequest_reason_date_profile_error___block_invoke_2(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  objc_msgSend(v1, "stringWithFormat:", @"INSERT INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", v2, @"context_sync_pull", @"context_sync_push", @"state_sync", @"changes_sync_pull", @"changes_sync_push", @"changes_sync_fast", @"medical_id", @"summary_sharing_pull", @"summary_sharing_push", @"allow_cellular", @"qos", @"request_state", @"identifier", @"reason", @"creation_date",
  v3 = 0);

  return v3;
}

uint64_t __73__HDCachedSyncRequestEntity_insertSyncRequest_reason_date_profile_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  v4 = [*(id *)(a1 + 32) contextSyncRequest];
  if (v4)
  {
    v5 = [*(id *)(a1 + 32) contextSyncRequest];
    sqlite3_bind_int64(a2, 1, [v5 pull]);
  }
  else
  {
    sqlite3_bind_int64(a2, 1, 0);
  }

  uint64_t v6 = [*(id *)(a1 + 32) contextSyncRequest];
  if (v6)
  {
    v7 = [*(id *)(a1 + 32) contextSyncRequest];
    sqlite3_bind_int64(a2, 2, [v7 push]);
  }
  else
  {
    sqlite3_bind_int64(a2, 2, 0);
  }

  v8 = [*(id *)(a1 + 32) stateSyncRequest];
  sqlite3_bind_int64(a2, 3, v8 != 0);

  id v9 = [*(id *)(a1 + 32) changesSyncRequest];
  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) changesSyncRequest];
    sqlite3_bind_int64(a2, 4, [v10 pull]);
  }
  else
  {
    sqlite3_bind_int64(a2, 4, 0);
  }

  id v11 = [*(id *)(a1 + 32) changesSyncRequest];
  if (v11)
  {
    id v12 = [*(id *)(a1 + 32) changesSyncRequest];
    sqlite3_bind_int64(a2, 5, [v12 push]);
  }
  else
  {
    sqlite3_bind_int64(a2, 5, 0);
  }

  id v13 = [*(id *)(a1 + 32) changesSyncRequest];
  if (v13)
  {
    id v14 = [*(id *)(a1 + 32) changesSyncRequest];
    sqlite3_bind_int64(a2, 6, [v14 lite]);
  }
  else
  {
    sqlite3_bind_int64(a2, 6, 0);
  }

  v15 = [*(id *)(a1 + 32) medicalIDSyncRequest];
  sqlite3_bind_int64(a2, 7, v15 != 0);

  id v16 = [*(id *)(a1 + 32) summarySharingSyncRequest];
  if (v16)
  {
    id v17 = [*(id *)(a1 + 32) summarySharingSyncRequest];
    sqlite3_bind_int64(a2, 8, [v17 pull]);
  }
  else
  {
    sqlite3_bind_int64(a2, 8, 0);
  }

  id v18 = [*(id *)(a1 + 32) summarySharingSyncRequest];
  if (v18)
  {
    v19 = [*(id *)(a1 + 32) summarySharingSyncRequest];
    sqlite3_bind_int64(a2, 9, [v19 push]);
  }
  else
  {
    sqlite3_bind_int64(a2, 9, 0);
  }

  sqlite3_bind_int64(a2, 10, [*(id *)(a1 + 32) allowCellular]);
  sqlite3_bind_int64(a2, 11, [*(id *)(a1 + 32) qualityOfService]);
  sqlite3_bind_int64(a2, 12, 0);
  v20 = [*(id *)(a1 + 32) identifier];
  id v21 = [v20 UUIDString];
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)markPendingRequestsAsInProgress:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 databaseForEntityClass:a1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__HDCachedSyncRequestEntity_markPendingRequestsAsInProgress_error___block_invoke;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v8[4] = a1;
  LOBYTE(a4) = [v6 executeCachedStatementForKey:&markPendingRequestsAsInProgress_error__lookupKey error:a4 SQLGenerator:v8 bindingHandler:&__block_literal_global_0 enumerationHandler:0];

  return (char)a4;
}

id __67__HDCachedSyncRequestEntity_markPendingRequestsAsInProgress_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ?", v2, @"request_state", @"request_state"];

  return v3;
}

uint64_t __67__HDCachedSyncRequestEntity_markPendingRequestsAsInProgress_error___block_invoke_2(int a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 1);

  return sqlite3_bind_int64(a2, 2, 0);
}

+ (BOOL)markInProgressRequestsAsPending:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__HDCachedSyncRequestEntity_markInProgressRequestsAsPending_error___block_invoke;
  v8[3] = &__block_descriptor_40_e35_B24__0__HDDatabaseTransaction_8__16l;
  void v8[4] = a1;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:a4 block:v8];

  return (char)a4;
}

uint64_t __67__HDCachedSyncRequestEntity_markInProgressRequestsAsPending_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 databaseForEntityClass:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__HDCachedSyncRequestEntity_markInProgressRequestsAsPending_error___block_invoke_2;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v8[4] = *(void *)(a1 + 32);
  uint64_t v6 = [v5 executeCachedStatementForKey:&HDCachedSyncRequestEntityCreationDate_block_invoke_2_lookupKey error:a3 SQLGenerator:v8 bindingHandler:&__block_literal_global_351 enumerationHandler:0];

  return v6;
}

id __67__HDCachedSyncRequestEntity_markInProgressRequestsAsPending_error___block_invoke_2(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ?", v2, @"request_state", @"request_state"];

  return v3;
}

uint64_t __67__HDCachedSyncRequestEntity_markInProgressRequestsAsPending_error___block_invoke_3(int a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 0);

  return sqlite3_bind_int64(a2, 2, 1);
}

+ (BOOL)fetchCoalescedSyncRequest:(id *)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v26 = [MEMORY[0x1E4F2AD68] emptySyncRequest];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__HDCachedSyncRequestEntity_fetchCoalescedSyncRequest_transaction_error___block_invoke;
  v17[3] = &unk_1E62F2E80;
  v19 = &v21;
  id v20 = a1;
  id v10 = v9;
  id v18 = v10;
  char v11 = +[HDCachedSyncRequestEntity _enumerateOverAllSyncRequests:error:enumerationHandler:]((uint64_t)a1, v8, (uint64_t)a5, v17);
  _HKInitializeLogging();
  id v12 = (os_log_t *)MEMORY[0x1E4F29F28];
  id v13 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)v22[5];
    *(_DWORD *)buf = 138543362;
    id v28 = v14;
    _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "Coalesced sync request: \n%{public}@", buf, 0xCu);
  }
  _HKInitializeLogging();
  v15 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v10;
    _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "List of Requests: %{public}@", buf, 0xCu);
  }
  if (a3) {
    *a3 = (id) v22[5];
  }

  _Block_object_dispose(&v21, 8);
  return v11;
}

uint64_t __73__HDCachedSyncRequestEntity_fetchCoalescedSyncRequest_transaction_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v3 = +[HDCachedSyncRequestEntity _extractRequest:]();
  uint64_t v4 = [v2 requestByMergingRequest:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = HDSQLiteColumnWithNameAsString();
  id v8 = HDSQLiteColumnWithNameAsString();
  if (v8 && v7) {
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }

  return 1;
}

+ (id)_extractRequest:
{
  self;
  uint64_t v0 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v1 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v21 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v2 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v3 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v24 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v23 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v22 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v5 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  id v8 = HDSQLiteColumnWithNameAsString();
  id v9 = (void *)[v7 initWithUUIDString:v8];

  if (v0 | v1) {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:v0 != 0 pull:v1 != 0 lite:v21 != 0];
  }
  else {
    id v10 = 0;
  }
  uint64_t v11 = v5;
  if (v2 | v3) {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F2AE40]) initWithPush:v2 != 0 pull:v3 != 0];
  }
  else {
    id v12 = 0;
  }
  uint64_t v13 = v6;
  if (v4 | v22) {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F2B5E8]) initWithPush:v4 != 0 pull:v22 != 0];
  }
  else {
    id v14 = 0;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F2AD68]);
  if (v24) {
    id v16 = objc_alloc_init(MEMORY[0x1E4F2B5A0]);
  }
  else {
    id v16 = 0;
  }
  if (v23)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F2B198]);
    LOBYTE(v20) = v11 != 0;
    id v18 = (void *)[v15 initWithIdentifier:v9 changesSyncRequest:v10 contextSyncRequest:v12 stateSyncRequest:v16 medicalIDSyncRequest:v17 summarySharingSyncRequest:v14 allowCellular:v20 qualityOfService:v13];

    if (!v24) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  LOBYTE(v20) = v11 != 0;
  id v18 = (void *)[v15 initWithIdentifier:v9 changesSyncRequest:v10 contextSyncRequest:v12 stateSyncRequest:v16 medicalIDSyncRequest:0 summarySharingSyncRequest:v14 allowCellular:v20 qualityOfService:v13];
  if (v24) {
LABEL_15:
  }

LABEL_16:

  return v18;
}

+ (uint64_t)_enumerateOverAllSyncRequests:(uint64_t)a3 error:(void *)a4 enumerationHandler:
{
  id v6 = a4;
  id v7 = a2;
  uint64_t v8 = self;
  id v9 = [v7 databaseForEntityClass:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__HDCachedSyncRequestEntity__enumerateOverAllSyncRequests_error_enumerationHandler___block_invoke;
  v12[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v12[4] = v8;
  uint64_t v10 = [v9 executeCachedStatementForKey:&_enumerateOverAllSyncRequests_error_enumerationHandler__lookupKey error:a3 SQLGenerator:v12 bindingHandler:0 enumerationHandler:v6];

  return v10;
}

+ (id)fetchAllSyncRequests:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__0;
  id v15 = __Block_byref_object_dispose__0;
  id v16 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__HDCachedSyncRequestEntity_fetchAllSyncRequests_error___block_invoke;
  v10[3] = &unk_1E62F2EA8;
  v10[4] = &v11;
  v10[5] = a1;
  if (+[HDCachedSyncRequestEntity _enumerateOverAllSyncRequests:error:enumerationHandler:]((uint64_t)a1, v6, (uint64_t)a4, v10))id v7 = (void *)v12[5]; {
  else
  }
    id v7 = 0;
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __56__HDCachedSyncRequestEntity_fetchAllSyncRequests_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v2 = +[HDCachedSyncRequestEntity _extractRequest:]();
  [v1 addObject:v2];

  return 1;
}

+ (id)fetchAllInProgressSyncRequests:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [v6 databaseForEntityClass:a1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HDCachedSyncRequestEntity_fetchAllInProgressSyncRequests_error___block_invoke;
  v12[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v12[4] = a1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__HDCachedSyncRequestEntity_fetchAllInProgressSyncRequests_error___block_invoke_3;
  v11[3] = &unk_1E62F2EA8;
  v11[4] = &v13;
  v11[5] = a1;
  if ([v7 executeCachedStatementForKey:&fetchAllInProgressSyncRequests_error__lookupKey error:a4 SQLGenerator:v12 bindingHandler:&__block_literal_global_361 enumerationHandler:v11])id v8 = (void *)v14[5]; {
  else
  }
    id v8 = 0;
  id v9 = v8;

  _Block_object_dispose(&v13, 8);

  return v9;
}

id __66__HDCachedSyncRequestEntity_fetchAllInProgressSyncRequests_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = [v1 stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?", @"context_sync_pull", @"context_sync_push", @"state_sync", @"changes_sync_pull", @"changes_sync_push", @"changes_sync_fast", @"medical_id", @"summary_sharing_pull", @"summary_sharing_push", @"allow_cellular", @"qos", @"identifier", @"reason", @"creation_date", v2, @"request_state"];

  return v3;
}

uint64_t __66__HDCachedSyncRequestEntity_fetchAllInProgressSyncRequests_error___block_invoke_2(int a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int(a2, 1, 1);
}

uint64_t __66__HDCachedSyncRequestEntity_fetchAllInProgressSyncRequests_error___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v2 = +[HDCachedSyncRequestEntity _extractRequest:]();
  [v1 addObject:v2];

  return 1;
}

+ (BOOL)clearInProgressSyncRequests:(id)a3 error:(id *)a4
{
  id v6 = [a3 database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HDCachedSyncRequestEntity_clearInProgressSyncRequests_error___block_invoke;
  v8[3] = &__block_descriptor_40_e35_B24__0__HDDatabaseTransaction_8__16l;
  void v8[4] = a1;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:a4 block:v8];

  return (char)a4;
}

uint64_t __63__HDCachedSyncRequestEntity_clearInProgressSyncRequests_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 databaseForEntityClass:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HDCachedSyncRequestEntity_clearInProgressSyncRequests_error___block_invoke_2;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v8[4] = *(void *)(a1 + 32);
  uint64_t v6 = [v5 executeCachedStatementForKey:&HDCachedSyncRequestEntityCreationDate_block_invoke_3_lookupKey error:a3 SQLGenerator:v8 bindingHandler:&__block_literal_global_366 enumerationHandler:0];

  return v6;
}

id __63__HDCachedSyncRequestEntity_clearInProgressSyncRequests_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = [v1 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ?", v2, @"request_state"];

  return v3;
}

uint64_t __63__HDCachedSyncRequestEntity_clearInProgressSyncRequests_error___block_invoke_3(int a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int(a2, 1, 1);
}

id __84__HDCachedSyncRequestEntity__enumerateOverAllSyncRequests_error_enumerationHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = [v1 stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@", @"context_sync_pull", @"context_sync_push", @"state_sync", @"changes_sync_pull", @"changes_sync_push", @"changes_sync_fast", @"medical_id", @"summary_sharing_pull", @"summary_sharing_push", @"allow_cellular", @"qos", @"identifier", @"reason", @"creation_date", v2];

  return v3;
}

@end