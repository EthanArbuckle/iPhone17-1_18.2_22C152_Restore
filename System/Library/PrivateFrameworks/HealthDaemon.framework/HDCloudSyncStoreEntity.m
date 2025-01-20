@interface HDCloudSyncStoreEntity
+ (BOOL)enumerateShardsForOwnerIdentifier:(id)a3 containerIdentifier:(id)a4 syncIdentity:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8 handler:(id)a9;
+ (BOOL)persistState:(id)a3 storeUUID:(id)a4 shouldReplace:(BOOL)a5 healthDatabase:(id)a6 error:(id *)a7;
+ (BOOL)rebaseRequiredByDate:(id)a3 intervals:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)resetLastSyncDateExcludingStores:(id)a3 profile:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_persistedStateProperties;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)persistedMostRecentLastSyncDateForProfile:(id)a3 error:(id *)a4;
+ (id)persistedStateForStoreUUID:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)persistedStateForStoreUUID:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)persistedStoreUUIDsForProfile:(id)a3 error:(id *)a4;
+ (id)storeIdentifiersForOwnerIdentifier:(id)a3 containerIdentifier:(id)a4 syncIdentity:(id)a5 profile:(id)a6 error:(id *)a7;
+ (int64_t)protectionClass;
- (BOOL)fetchShardPropertiesInTransaction:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)updateShardStartDate:(id)a3 endDate:(id)a4 type:(int64_t)a5 transaction:(id)a6 error:(id *)a7;
- (BOOL)updateSyncIdentity:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)storeUUIDInTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDCloudSyncStoreEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)databaseTable
{
  return @"cloud_sync_stores";
}

+ (BOOL)rebaseRequiredByDate:(id)a3 intervals:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [a5 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke;
  v16[3] = &unk_1E62F4200;
  id v18 = v11;
  id v19 = a1;
  id v17 = v10;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v16];

  return (char)a6;
}

uint64_t __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v14[4] = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_3;
  v9[3] = &unk_1E630C890;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = *(void *)(a1 + 48);
  id v6 = v5;
  uint64_t v7 = [v6 executeCachedStatementForKey:&HDCloudSyncStorePendingFullSync_block_invoke_lookupKey error:a3 SQLGenerator:v14 bindingHandler:0 enumerationHandler:v9];

  return v7;
}

id __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_2(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = *MEMORY[0x1E4F65C70];
  v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v4 = [v1 stringWithFormat:@"SELECT %@, %@, %@, %@, %@ FROM %@", v2, @"rebase_deadline", @"shard_type", @"shard_start_date", @"shard_end_date", v3];

  return v4;
}

uint64_t __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = HDSQLiteColumnAsInt64();
  if ((MEMORY[0x1C1879FC0](a2, 1) & 1) != 0
    || (uint64_t v7 = 1,
        double v8 = MEMORY[0x1C1879F40](a2, 1),
        [*(id *)(a1 + 32) timeIntervalSinceReferenceDate],
        v8 > v9))
  {
    if (MEMORY[0x1C1879FC0](a2, 2))
    {
LABEL_4:
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_4;
      v18[3] = &__block_descriptor_40_e15___NSString_8__0l;
      id v10 = *(void **)(a1 + 48);
      v18[4] = *(void *)(a1 + 56);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_5;
      v15[3] = &unk_1E62F33F8;
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = v6;
      uint64_t v7 = [v10 executeCachedStatementForKey:&HDCloudSyncStorePendingFullSync_block_invoke_2_updateKey error:a3 SQLGenerator:v18 bindingHandler:v15 enumerationHandler:0];

      return v7;
    }
    int v12 = HDSQLiteColumnAsInt64();
    uint64_t v7 = 1;
    if (v12 && v12 != 2)
    {
      if (v12 == 1 && *(void *)(a1 + 40))
      {
        double v13 = (MEMORY[0x1C1879FC0](a2, 3) & 1) != 0 ? -1.79769313e308 : MEMORY[0x1C1879F40](a2, 3);
        double v14 = (MEMORY[0x1C1879FC0](a2, 4) & 1) != 0 ? 1.79769313e308 : MEMORY[0x1C1879F40](a2, 4);
        if (![*(id *)(a1 + 40) hasOverlapWithStartTime:v13 endTime:v14]) {
          return 1;
        }
      }
      goto LABEL_4;
    }
  }
  return v7;
}

id __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_4(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ?", v2, @"rebase_deadline", *MEMORY[0x1E4F65C70], 0];

  return v3;
}

uint64_t __71__HDCloudSyncStoreEntity_rebaseRequiredByDate_intervals_profile_error___block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (id)storeIdentifiersForOwnerIdentifier:(id)a3 containerIdentifier:(id)a4 syncIdentity:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__191;
  v35 = __Block_byref_object_dispose__191;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v16 = [v15 database];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke;
  v24[3] = &unk_1E630B230;
  id v30 = a1;
  id v17 = v15;
  id v25 = v17;
  id v18 = v14;
  id v26 = v18;
  id v19 = v12;
  id v27 = v19;
  id v20 = v13;
  id v28 = v20;
  v29 = &v31;
  LODWORD(a7) = [a1 performReadTransactionWithHealthDatabase:v16 error:a7 block:v24];

  if (a7) {
    v21 = (void *)v32[5];
  }
  else {
    v21 = 0;
  }
  id v22 = v21;

  _Block_object_dispose(&v31, 8);

  return v22;
}

uint64_t __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 72);
  id v6 = a2;
  uint64_t v7 = [v6 databaseForEntityClass:v5];
  double v8 = [*(id *)(a1 + 32) syncIdentityManager];
  uint64_t v9 = *(void *)(a1 + 40);
  id v20 = 0;
  id v10 = [v8 concreteIdentityForIdentity:v9 shouldCreate:0 transaction:v6 error:&v20];

  id v11 = v20;
  if (v11)
  {
    if (a3)
    {
      uint64_t v12 = 0;
      *a3 = v11;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v12 = 0;
    }
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke_2;
    v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v19[4] = *(void *)(a1 + 72);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke_3;
    v15[3] = &unk_1E62F2DF0;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    id v18 = v10;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke_4;
    v14[3] = &unk_1E62F3640;
    v14[4] = *(void *)(a1 + 64);
    uint64_t v12 = [v7 executeCachedStatementForKey:&HDCloudSyncStorePendingFullSync_block_invoke_3_lookupKey error:a3 SQLGenerator:v19 bindingHandler:v15 enumerationHandler:v14];
  }
  return v12;
}

id __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke_2(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  sqlite3_int64 v4 = [v1 stringWithFormat:@"SELECT %@ FROM %@ INNER JOIN %@ ON %@ = %@ WHERE %@ = ? AND %@ = ? AND %@ = ? ORDER BY %@ ASC", @"uuid", v2, v3, @"sync_store", *MEMORY[0x1E4F65C70], @"owner_id", @"container_id", @"sync_identity", @"uuid", 0];

  return v4;
}

void __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  id v4 = [*(id *)(a1 + 48) entity];
  sqlite3_bind_int64(a2, 3, [v4 persistentID]);
}

uint64_t __108__HDCloudSyncStoreEntity_storeIdentifiersForOwnerIdentifier_containerIdentifier_syncIdentity_profile_error___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v2 = HDSQLiteColumnWithNameAsUUID();
  [v1 addObject:v2];

  return 1;
}

+ (id)_persistedStateProperties
{
  v2[13] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"sync_store";
  v2[1] = @"server_change_token";
  v2[2] = @"baseline_epoch";
  v2[3] = @"rebase_deadline";
  v2[4] = @"last_sync";
  v2[5] = @"empty_zones";
  v2[6] = @"last_check";
  v2[7] = @"owner_id";
  v2[8] = @"container_id";
  v2[9] = @"sync_identity";
  v2[10] = @"has_gap";
  v2[11] = @"sync_protocol_version";
  v2[12] = @"pending_full_sync";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:13];

  return v0;
}

+ (id)persistedStateForStoreUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__191;
  v23 = __Block_byref_object_dispose__191;
  id v24 = 0;
  id v10 = [v9 database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HDCloudSyncStoreEntity_persistedStateForStoreUUID_profile_error___block_invoke;
  v15[3] = &unk_1E62F66D8;
  id v17 = &v19;
  id v18 = a1;
  id v11 = v8;
  id v16 = v11;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v10 error:a5 block:v15];

  if (a5) {
    uint64_t v12 = (void *)v20[5];
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return v13;
}

BOOL __67__HDCloudSyncStoreEntity_persistedStateForStoreUUID_profile_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)a1[6];
  uint64_t v6 = a1[4];
  uint64_t v7 = [a2 databaseForEntityClass:v5];
  uint64_t v8 = [v5 persistedStateForStoreUUID:v6 database:v7 error:a3];
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return *(void *)(*(void *)(a1[5] + 8) + 40) != 0;
}

+ (id)persistedStoreUUIDsForProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__191;
  id v16 = __Block_byref_object_dispose__191;
  id v17 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = [v6 database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__HDCloudSyncStoreEntity_persistedStoreUUIDsForProfile_error___block_invoke;
  v11[3] = &unk_1E62FC108;
  v11[4] = &v12;
  v11[5] = a1;
  LOBYTE(a4) = [a1 performReadTransactionWithHealthDatabase:v7 error:a4 block:v11];

  if ((a4 & 1) == 0)
  {
    uint64_t v8 = (void *)v13[5];
    v13[5] = 0;
  }
  uint64_t v9 = (void *)[(id)v13[5] copy];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __62__HDCloudSyncStoreEntity_persistedStoreUUIDsForProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__HDCloudSyncStoreEntity_persistedStoreUUIDsForProfile_error___block_invoke_2;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v9[4] = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__HDCloudSyncStoreEntity_persistedStoreUUIDsForProfile_error___block_invoke_3;
  v8[3] = &unk_1E62F3640;
  v8[4] = *(void *)(a1 + 32);
  uint64_t v6 = [v5 executeCachedStatementForKey:&HDCloudSyncStorePendingFullSync_block_invoke_4_lookupKey error:a3 SQLGenerator:v9 bindingHandler:0 enumerationHandler:v8];

  return v6;
}

id __62__HDCloudSyncStoreEntity_persistedStoreUUIDsForProfile_error___block_invoke_2(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v4 = [v1 stringWithFormat:@"SELECT %@ FROM %@ cloud_stores INNER JOIN %@ sync_stores ON cloud_stores.%@ = sync_stores.%@", @"uuid", v2, v3, @"sync_store", *MEMORY[0x1E4F65C70], 0];

  return v4;
}

uint64_t __62__HDCloudSyncStoreEntity_persistedStoreUUIDsForProfile_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsUUID();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v2];

  return 1;
}

+ (id)persistedMostRecentLastSyncDateForProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__191;
  id v15 = __Block_byref_object_dispose__191;
  id v16 = 0;
  uint64_t v7 = [v6 database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HDCloudSyncStoreEntity_persistedMostRecentLastSyncDateForProfile_error___block_invoke;
  v10[3] = &unk_1E62FC108;
  v10[4] = &v11;
  v10[5] = a1;
  LODWORD(a4) = [a1 performReadTransactionWithHealthDatabase:v7 error:a4 block:v10];

  if (a4) {
    uint64_t v8 = (void *)[(id)v12[5] copy];
  }
  else {
    uint64_t v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __74__HDCloudSyncStoreEntity_persistedMostRecentLastSyncDateForProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 unprotectedDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__HDCloudSyncStoreEntity_persistedMostRecentLastSyncDateForProfile_error___block_invoke_2;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v9[4] = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__HDCloudSyncStoreEntity_persistedMostRecentLastSyncDateForProfile_error___block_invoke_3;
  v8[3] = &unk_1E62F3640;
  v8[4] = *(void *)(a1 + 32);
  uint64_t v6 = [v5 executeCachedStatementForKey:&HDCloudSyncStorePendingFullSync_block_invoke_5_lookupKey error:a3 SQLGenerator:v9 bindingHandler:0 enumerationHandler:v8];

  return v6;
}

id __74__HDCloudSyncStoreEntity_persistedMostRecentLastSyncDateForProfile_error___block_invoke_2(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"SELECT MAX(%@) as %@ FROM %@", @"last_sync", @"last_sync", v2, 0];

  return v3;
}

uint64_t __74__HDCloudSyncStoreEntity_persistedMostRecentLastSyncDateForProfile_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsDate();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

+ (id)persistedStateForStoreUUID:(id)a3 database:(id)a4 error:(id *)a5
{
  v111[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, a1, @"HDCloudSyncStoreEntity.m", 264, @"Invalid parameter not satisfying: %@", @"storeUUID != nil" object file lineNumber description];
  }
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__191;
  v109 = __Block_byref_object_dispose__191;
  id v110 = 0;
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x2020000000;
  uint64_t v104 = 0;
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__191;
  v99 = __Block_byref_object_dispose__191;
  id v100 = 0;
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__191;
  v93 = __Block_byref_object_dispose__191;
  id v94 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__191;
  v87 = __Block_byref_object_dispose__191;
  id v88 = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__191;
  v81 = __Block_byref_object_dispose__191;
  id v82 = 0;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__191;
  v75 = __Block_byref_object_dispose__191;
  id v76 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__191;
  v69 = __Block_byref_object_dispose__191;
  id v70 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = -1;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  int v56 = 6;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v11 = +[HDSyncStoreEntity existingSyncStoreEntityWithUUID:v9 database:v10 error:a5];
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v19 = 0;
    goto LABEL_24;
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "persistentID"));
  v46 = [v13 predicateWithProperty:@"sync_store" equalToValue:v14];

  id v15 = [a1 queryWithDatabase:v10 predicate:v46];
  id v16 = +[HDCloudSyncStoreEntity _persistedStateProperties]();
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __68__HDCloudSyncStoreEntity_persistedStateForStoreUUID_database_error___block_invoke;
  v48[3] = &unk_1E630C8B8;
  v48[4] = &v105;
  v48[5] = &v101;
  v48[6] = &v95;
  v48[7] = &v89;
  v48[8] = &v83;
  v48[9] = &v77;
  v48[10] = &v71;
  v48[11] = &v65;
  v48[12] = &v61;
  v48[13] = &v57;
  v48[14] = &v53;
  v48[15] = &v49;
  LOBYTE(v13) = [v15 enumerateProperties:v16 error:a5 enumerationHandler:v48];

  if (v13)
  {
    if (v106[5])
    {
      id v17 = objc_alloc(MEMORY[0x1E4F28DC0]);
      id v18 = (void *)[v17 initForReadingFromData:v106[5] error:0];
      v45 = [v18 decodeObjectOfClass:objc_opt_class() forKey:@"changeToken"];
      [v18 finishDecoding];
    }
    else
    {
      v45 = 0;
    }
    if (v84[5])
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28DC0]);
      uint64_t v21 = (void *)[v20 initForReadingFromData:v84[5] error:0];
      id v22 = (void *)MEMORY[0x1E4F1CAD0];
      v111[0] = objc_opt_class();
      v111[1] = objc_opt_class();
      v111[2] = objc_opt_class();
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:3];
      id v24 = [v22 setWithArray:v23];
      v44 = [v21 decodeObjectOfClasses:v24 forKey:@"emptyZones"];

      [v21 finishDecoding];
    }
    else
    {
      v44 = 0;
    }
    uint64_t v25 = v62[3];
    id v47 = 0;
    v43 = +[HDSyncIdentityEntity concreteIdentityForPersistentID:v25 database:v10 error:&v47];
    id v26 = v47;
    id v27 = v26;
    if (v26)
    {
      id v28 = (_HDCloudSyncStorePersistableState *)v26;
      v29 = v28;
      if (a5)
      {
        uint64_t v19 = 0;
        *a5 = v28;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v19 = 0;
      }
    }
    else
    {
      v42 = v15;
      v41 = [_HDCloudSyncStorePersistableState alloc];
      uint64_t v40 = v102[3];
      uint64_t v30 = v96[5];
      uint64_t v31 = v90[5];
      uint64_t v32 = v78[5];
      uint64_t v33 = v72[5];
      uint64_t v34 = v66[5];
      v35 = [v43 identity];
      LODWORD(v39) = *((_DWORD *)v54 + 6);
      v29 = [(_HDCloudSyncStorePersistableState *)v41 initWithServerChangeToken:v45 baselineEpoch:v40 rebaseDeadline:v30 lastSyncDate:v31 emptyZones:v44 lastCheckDate:v32 ownerIdentifier:v33 containerIdentifier:v34 syncIdentity:v35 syncProtocolVersion:v39];

      id v15 = v42;
      if (*((unsigned char *)v58 + 24))
      {
        uint64_t v36 = [(_HDCloudSyncStorePersistableState *)v29 stateWithGapEncountered:1];

        id v15 = v42;
        v29 = (_HDCloudSyncStorePersistableState *)v36;
      }
      if (!*((unsigned char *)v50 + 24))
      {
        uint64_t v19 = v29;
        goto LABEL_22;
      }
      uint64_t v19 = [(_HDCloudSyncStorePersistableState *)v29 stateWithPendingFullSync:1];
      id v15 = v42;
    }

LABEL_22:
    goto LABEL_23;
  }
  uint64_t v19 = 0;
LABEL_23:

LABEL_24:
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v77, 8);

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v89, 8);

  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);

  return v19;
}

uint64_t __68__HDCloudSyncStoreEntity_persistedStateForStoreUUID_database_error___block_invoke(void *a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsData();
  uint64_t v3 = *(void *)(a1[4] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(a1[5] + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  uint64_t v5 = HDSQLiteColumnWithNameAsDate();
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = HDSQLiteColumnWithNameAsDate();
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = HDSQLiteColumnWithNameAsData();
  uint64_t v12 = *(void *)(a1[8] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = HDSQLiteColumnWithNameAsDate();
  uint64_t v15 = *(void *)(a1[9] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = HDSQLiteColumnWithNameAsString();
  uint64_t v18 = *(void *)(a1[10] + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  uint64_t v20 = HDSQLiteColumnWithNameAsString();
  uint64_t v21 = *(void *)(a1[11] + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  *(void *)(*(void *)(a1[12] + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  *(unsigned char *)(*(void *)(a1[13] + 8) + 24) = HDSQLiteColumnWithNameAsBoolean();
  *(_DWORD *)(*(void *)(a1[14] + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  *(unsigned char *)(*(void *)(a1[15] + 8) + 24) = HDSQLiteColumnWithNameAsBoolean();
  return 1;
}

+ (BOOL)persistState:(id)a3 storeUUID:(id)a4 shouldReplace:(BOOL)a5 healthDatabase:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (!v14)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"HDCloudSyncStoreEntity.m", 356, @"Invalid parameter not satisfying: %@", @"uuid != nil" object file lineNumber description];
  }
  id v16 = [v13 serverChangeToken];

  if (v16)
  {
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    uint64_t v18 = [v13 serverChangeToken];
    [v17 encodeObject:v18 forKey:@"changeToken"];

    id v16 = [v17 encodedData];
  }
  uint64_t v19 = [v13 emptyZoneDateByZoneID];

  if (v19)
  {
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    uint64_t v21 = [v13 emptyZoneDateByZoneID];
    [v20 encodeObject:v21 forKey:@"emptyZones"];

    uint64_t v19 = [v20 encodedData];
  }
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke;
  v30[3] = &unk_1E630C930;
  id v37 = a1;
  id v22 = v14;
  id v31 = v22;
  id v23 = v13;
  id v32 = v23;
  id v24 = v15;
  id v33 = v24;
  uint64_t v36 = v39;
  id v25 = v16;
  id v34 = v25;
  id v26 = v19;
  id v35 = v26;
  BOOL v38 = a5;
  char v27 = [a1 performWriteTransactionWithHealthDatabase:v24 error:a7 block:v30];

  _Block_object_dispose(v39, 8);
  return v27;
}

uint64_t __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:*(void *)(a1 + 80)];
  uint64_t v7 = +[HDSyncStoreEntity existingSyncStoreEntityWithUUID:*(void *)(a1 + 32) database:v6 error:a3];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v70 = 0;
    uint64_t v71 = &v70;
    uint64_t v72 = 0x3032000000;
    uint64_t v73 = __Block_byref_object_copy__191;
    v74 = __Block_byref_object_dispose__191;
    id v75 = 0;
    uint64_t v64 = 0;
    uint64_t v65 = &v64;
    uint64_t v66 = 0x3032000000;
    uint64_t v67 = __Block_byref_object_copy__191;
    v68 = __Block_byref_object_dispose__191;
    id v69 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = &v60;
    uint64_t v62 = 0x2020000000;
    uint64_t v63 = -1;
    uint64_t v56 = 0;
    uint64_t v57 = &v56;
    uint64_t v58 = 0x2020000000;
    char v59 = 0;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_2;
    v55[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v55[4] = *(void *)(a1 + 80);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_3;
    v53[3] = &unk_1E62F43C8;
    id v9 = v7;
    id v54 = v9;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_4;
    v52[3] = &unk_1E630C8E0;
    v52[4] = &v70;
    v52[5] = &v64;
    v52[6] = &v60;
    v52[7] = &v56;
    if (([v6 executeCachedStatementForKey:&HDCloudSyncStorePendingFullSync_block_invoke_6_lookupKey error:a3 SQLGenerator:v55 bindingHandler:v53 enumerationHandler:v52] & 1) == 0)
    {
      uint64_t v17 = 0;
LABEL_49:

      _Block_object_dispose(&v56, 8);
      _Block_object_dispose(&v60, 8);
      _Block_object_dispose(&v64, 8);

      _Block_object_dispose(&v70, 8);
      goto LABEL_50;
    }
    id v10 = [*(id *)(a1 + 40) syncIdentity];

    if (v10)
    {
      uint64_t v11 = [*(id *)(a1 + 48) profile];
      uint64_t v12 = [v11 syncIdentityManager];
      id v13 = [*(id *)(a1 + 40) syncIdentity];
      id v51 = 0;
      v43 = [v12 concreteIdentityForIdentity:v13 shouldCreate:1 transaction:v5 error:&v51];
      id v14 = v51;

      if (v14)
      {
        id v15 = v14;
        id v16 = v15;
        if (a3) {
          *a3 = v15;
        }
        else {
          _HKLogDroppedError();
        }

        goto LABEL_20;
      }
      uint64_t v21 = v61[3];
      if (v21 == -1)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      }
      else
      {
        id v22 = [v43 entity];
        uint64_t v23 = [v22 persistentID];

        if (v21 != v23)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Sync identity must not be changed after creation.");
          id v16 = 0;
LABEL_20:
          uint64_t v17 = 0;
          id v24 = v43;
LABEL_47:

          goto LABEL_48;
        }
      }
    }
    else
    {
      v43 = 0;
    }
    if (v71[5])
    {
      uint64_t v18 = (void *)v65[5];
      uint64_t v19 = [*(id *)(a1 + 40) ownerIdentifier];
      if (v18 != v19)
      {
        v42 = [*(id *)(a1 + 40) ownerIdentifier];
        if (!v42)
        {
LABEL_31:
          uint64_t v18 = v19;
          goto LABEL_32;
        }
        uint64_t v20 = (void *)v65[5];
        v41 = [*(id *)(a1 + 40) ownerIdentifier];
        if (![v20 isEqualToString:v41])
        {
LABEL_30:

          goto LABEL_31;
        }
      }
      id v25 = (void *)v71[5];
      id v26 = [*(id *)(a1 + 40) containerIdentifier];
      if (v25 == v26)
      {

        if (v18 != v19)
        {

          uint64_t v18 = v19;
        }
      }
      else
      {
        char v40 = [*(id *)(a1 + 40) containerIdentifier];
        if (!v40)
        {

          if (v18 == v19)
          {
LABEL_32:

LABEL_33:
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Owner and container identifiers must not be changed after creation.");
            uint64_t v17 = 0;
            id v24 = v43;
LABEL_48:

            goto LABEL_49;
          }
          goto LABEL_30;
        }
        BOOL v38 = (void *)v71[5];
        char v27 = [*(id *)(a1 + 40) containerIdentifier];
        char v39 = [v38 isEqualToString:v27];

        if (v18 == v19)
        {
        }
        else
        {
        }
        if ((v39 & 1) == 0) {
          goto LABEL_33;
        }
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_5;
    aBlock[3] = &unk_1E630C908;
    id v28 = v9;
    id v46 = v28;
    id v47 = *(id *)(a1 + 56);
    id v48 = *(id *)(a1 + 40);
    id v49 = *(id *)(a1 + 64);
    id v24 = v43;
    id v50 = v24;
    v29 = _Block_copy(aBlock);
    if (*((unsigned char *)v57 + 24))
    {
      if (!*(unsigned char *)(a1 + 88) && !*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        uint64_t v17 = 1;
        goto LABEL_46;
      }
      uint64_t v30 = -[HDSQLiteEntity initWithPersistentID:]([HDCloudSyncStoreEntity alloc], "initWithPersistentID:", [v28 persistentID]);
      id v31 = +[HDCloudSyncStoreEntity _persistedStateProperties]();
      uint64_t v17 = [(HDSQLiteEntity *)v30 updateProperties:v31 database:v6 error:a3 bindingHandler:v29];
LABEL_45:

LABEL_46:
      id v16 = v46;
      goto LABEL_47;
    }
    id v32 = v24;
    id v33 = *(void **)(a1 + 80);
    int v34 = *(unsigned __int8 *)(a1 + 88);
    id v35 = +[HDCloudSyncStoreEntity _persistedStateProperties]();
    id v44 = 0;
    id v31 = [v33 insertOrReplaceEntity:v34 != 0 database:v6 properties:v35 error:&v44 bindingHandler:v29];
    uint64_t v30 = (HDCloudSyncStoreEntity *)v44;

    if (!v31)
    {
      if (([(HDCloudSyncStoreEntity *)v30 hd_isConstraintViolation] & 1) == 0)
      {
        id v37 = v30;
        uint64_t v30 = v37;
        if (v37)
        {
          if (a3) {
            *a3 = v37;
          }
          else {
            _HKLogDroppedError();
          }
        }

        id v31 = 0;
        uint64_t v17 = 0;
        goto LABEL_44;
      }
      id v31 = 0;
    }
    uint64_t v17 = 1;
LABEL_44:
    id v24 = v32;
    goto LABEL_45;
  }
  uint64_t v17 = 0;
LABEL_50:

  return v17;
}

id __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_2(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = [v1 stringWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE %@ = ?", @"container_id", @"owner_id", @"sync_identity", v2, @"sync_store", 0];

  return v3;
}

uint64_t __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_4(void *a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x1C1879F80](a2, 0);
  uint64_t v5 = *(void *)(a1[4] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = MEMORY[0x1C1879F80](a2, 1);
  uint64_t v8 = *(void *)(a1[5] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if ((MEMORY[0x1C1879FC0](a2, 2) & 1) == 0 && HDSQLiteColumnAsInt64()) {
    *(void *)(*(void *)(a1[6] + 8) + 24) = HDSQLiteColumnAsInt64();
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  return 0;
}

void __84__HDCloudSyncStoreEntity_persistState_storeUUID_shouldReplace_healthDatabase_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"sync_store", [*(id *)(a1 + 32) persistentID]);
  MEMORY[0x1C1879E30](a2, @"server_change_token", *(void *)(a1 + 40));
  MEMORY[0x1C1879E80](a2, @"baseline_epoch", [*(id *)(a1 + 48) baselineEpoch]);
  uint64_t v4 = [*(id *)(a1 + 48) rebaseDeadline];
  MEMORY[0x1C1879E40](a2, @"rebase_deadline", v4);

  uint64_t v5 = [*(id *)(a1 + 48) lastSyncDate];
  MEMORY[0x1C1879E40](a2, @"last_sync", v5);

  MEMORY[0x1C1879E30](a2, @"empty_zones", *(void *)(a1 + 56));
  uint64_t v6 = [*(id *)(a1 + 48) lastCheckDate];
  MEMORY[0x1C1879E40](a2, @"last_check", v6);

  uint64_t v7 = [*(id *)(a1 + 48) ownerIdentifier];
  MEMORY[0x1C1879EC0](a2, @"owner_id", v7);

  uint64_t v8 = [*(id *)(a1 + 48) containerIdentifier];
  MEMORY[0x1C1879EC0](a2, @"container_id", v8);

  id v9 = [*(id *)(a1 + 64) entity];
  MEMORY[0x1C1879E80](a2, @"sync_identity", [v9 persistentID]);

  MEMORY[0x1C1879E20](a2, @"has_gap", [*(id *)(a1 + 48) hasEncounteredGapInCurrentEpoch]);
  MEMORY[0x1C1879E80](a2, @"sync_protocol_version", (int)[*(id *)(a1 + 48) syncProtocolVersion]);
  [*(id *)(a1 + 48) pendingFullSync];

  JUMPOUT(0x1C1879E20);
}

+ (BOOL)resetLastSyncDateExcludingStores:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__HDCloudSyncStoreEntity_resetLastSyncDateExcludingStores_profile_error___block_invoke;
  v12[3] = &unk_1E62F9068;
  id v13 = v8;
  id v14 = a1;
  id v10 = v8;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v9 error:a5 block:v12];

  return (char)a5;
}

uint64_t __73__HDCloudSyncStoreEntity_resetLastSyncDateExcludingStores_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_228);
  uint64_t v7 = [v6 componentsJoinedByString:@", "];

  id v8 = NSString;
  id v9 = [*(id *)(a1 + 40) disambiguatedDatabaseTable];
  uint64_t v10 = *MEMORY[0x1E4F65C70];
  uint64_t v11 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v12 = [v8 stringWithFormat:@"UPDATE %@ SET %@ = NULL WHERE %@ NOT IN (SELECT %@ FROM %@ WHERE %@ IN (%@))", v9, @"last_sync", @"sync_store", v10, v11, @"uuid", v7];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__HDCloudSyncStoreEntity_resetLastSyncDateExcludingStores_profile_error___block_invoke_3;
  v15[3] = &unk_1E62F43C8;
  id v16 = *(id *)(a1 + 32);
  uint64_t v13 = [v5 executeUncachedSQL:v12 error:a3 bindingHandler:v15 enumerationHandler:0];

  return v13;
}

__CFString *__73__HDCloudSyncStoreEntity_resetLastSyncDateExcludingStores_profile_error___block_invoke_2()
{
  return @"?";
}

void __73__HDCloudSyncStoreEntity_resetLastSyncDateExcludingStores_profile_error___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    int v5 = 1;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "storeIdentifier", (void)v8);
        HDSQLiteBindFoundationValueToStatement();

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      v5 += v6;
    }
    while (v3);
  }
}

- (id)storeUUIDInTransaction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(HDSQLiteEntity *)[HDSyncStoreEntity alloc] initWithPersistentID:[(HDSQLiteEntity *)self persistentID]];
  uint64_t v7 = [v5 databaseForEntityClass:objc_opt_class()];

  long long v8 = [(HDSQLiteEntity *)v6 UUIDForProperty:@"uuid" database:v7];

  return v8;
}

+ (BOOL)enumerateShardsForOwnerIdentifier:(id)a3 containerIdentifier:(id)a4 syncIdentity:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8 handler:(id)a9
{
  if (a5)
  {
    id v14 = a3;
    id v15 = a4;
    id v16 = a7;
    id v17 = a9;
    id v18 = a6;
    id v19 = a5;
    uint64_t v20 = self;
    uint64_t v21 = [v18 syncIdentityManager];

    v64[0] = 0;
    id v22 = [v21 concreteIdentityForIdentity:v19 shouldCreate:0 transaction:v16 error:v64];

    id v23 = v64[0];
    if (v23)
    {
      if (a8)
      {
        char v24 = 0;
        *a8 = v23;
      }
      else
      {
        _HKLogDroppedError();
        char v24 = 0;
      }
    }
    else
    {
      char v39 = NSString;
      uint64_t v40 = *MEMORY[0x1E4F65C70];
      [v20 disambiguatedDatabaseTable];
      v41 = id v46 = v14;
      v42 = [v39 stringWithFormat:@"SELECT %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ IS NOT NULL", v40, @"shard_start_date", @"shard_end_date", @"shard_type", v41, @"owner_id", @"container_id", @"sync_identity", @"shard_type"];

      v43 = [v16 databaseForEntityClass:v20];
      uint64_t v59 = MEMORY[0x1E4F143A8];
      uint64_t v60 = 3221225472;
      uint64_t v61 = __128__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler___block_invoke;
      uint64_t v62 = &unk_1E62F59C8;
      id v63 = v42;
      uint64_t v52 = MEMORY[0x1E4F143A8];
      uint64_t v53 = 3221225472;
      id v54 = __128__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler___block_invoke_2;
      uint64_t v55 = &unk_1E62F2DF0;
      id v56 = v46;
      id v57 = v15;
      id v58 = v22;
      uint64_t v47 = MEMORY[0x1E4F143A8];
      uint64_t v48 = 3221225472;
      id v49 = __128__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler___block_invoke_3;
      id v50 = &unk_1E62F33D0;
      id v51 = v17;
      id v44 = v42;
      char v24 = [v43 executeCachedStatementForKey:&_enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler__lookupKey error:a8 SQLGenerator:&v59 bindingHandler:&v52 enumerationHandler:&v47];

      id v14 = v46;
    }
  }
  else
  {
    id v25 = a3;
    id v26 = a4;
    id v27 = a9;
    id v28 = a7;
    v29 = self;
    uint64_t v30 = NSString;
    uint64_t v31 = *MEMORY[0x1E4F65C70];
    id v32 = [v29 disambiguatedDatabaseTable];
    id v33 = [v30 stringWithFormat:@"SELECT %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ IS NOT NULL", v31, @"shard_start_date", @"shard_end_date", @"shard_type", v32, @"owner_id", @"container_id", @"shard_type"];

    int v34 = [v28 databaseForEntityClass:v29];

    uint64_t v59 = MEMORY[0x1E4F143A8];
    uint64_t v60 = 3221225472;
    uint64_t v61 = __115__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler___block_invoke;
    uint64_t v62 = &unk_1E62F59C8;
    id v63 = v33;
    id v51 = v27;
    uint64_t v52 = MEMORY[0x1E4F143A8];
    uint64_t v53 = 3221225472;
    id v54 = __115__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler___block_invoke_2;
    uint64_t v55 = &unk_1E62F2900;
    id v56 = v25;
    id v57 = v26;
    uint64_t v47 = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    id v49 = __115__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler___block_invoke_3;
    id v50 = &unk_1E62F33D0;
    id v35 = v27;
    id v36 = v26;
    id v37 = v25;
    id v38 = v33;
    char v24 = [v34 executeCachedStatementForKey:&_enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler__lookupKey error:a8 SQLGenerator:&v59 bindingHandler:&v52 enumerationHandler:&v47];
  }
  return v24;
}

- (BOOL)updateShardStartDate:(id)a3 endDate:(id)a4 type:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = [a6 databaseForEntity:self];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__HDCloudSyncStoreEntity_updateShardStartDate_endDate_type_transaction_error___block_invoke;
  v23[3] = &unk_1E62F59C8;
  v23[4] = self;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__HDCloudSyncStoreEntity_updateShardStartDate_endDate_type_transaction_error___block_invoke_2;
  v18[3] = &unk_1E62F4098;
  id v19 = v12;
  id v20 = v13;
  uint64_t v21 = self;
  int64_t v22 = a5;
  id v15 = v13;
  id v16 = v12;
  LOBYTE(a7) = [v14 executeCachedStatementForKey:&updateShardStartDate_endDate_type_transaction_error__updateKey error:a7 SQLGenerator:v23 bindingHandler:v18 enumerationHandler:0];

  return (char)a7;
}

id __78__HDCloudSyncStoreEntity_updateShardStartDate_endDate_type_transaction_error___block_invoke()
{
  v0 = NSString;
  id v1 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v2 = [v0 stringWithFormat:@"UPDATE %@ SET %@ = ?, %@ = ?, %@ = ? WHERE %@ = ?", v1, @"shard_start_date", @"shard_end_date", @"shard_type", *MEMORY[0x1E4F65C70]];

  return v2;
}

uint64_t __78__HDCloudSyncStoreEntity_updateShardStartDate_endDate_type_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 timeIntervalSinceReferenceDate];
    sqlite3_bind_double(a2, 1, v5);
  }
  else
  {
    sqlite3_bind_null(a2, 1);
  }
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    [v6 timeIntervalSinceReferenceDate];
    sqlite3_bind_double(a2, 2, v7);
  }
  else
  {
    sqlite3_bind_null(a2, 2);
  }
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 56));
  sqlite3_int64 v8 = [*(id *)(a1 + 48) persistentID];

  return sqlite3_bind_int64(a2, 4, v8);
}

- (BOOL)fetchShardPropertiesInTransaction:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8 = a5;
  long long v9 = [a3 databaseForEntity:self];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__HDCloudSyncStoreEntity_fetchShardPropertiesInTransaction_error_handler___block_invoke;
  v15[3] = &unk_1E62F59C8;
  void v15[4] = self;
  id v13 = v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__HDCloudSyncStoreEntity_fetchShardPropertiesInTransaction_error_handler___block_invoke_2;
  v14[3] = &unk_1E62F43C8;
  v14[4] = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__HDCloudSyncStoreEntity_fetchShardPropertiesInTransaction_error_handler___block_invoke_3;
  v12[3] = &unk_1E62F33D0;
  id v10 = v8;
  LOBYTE(a4) = [v9 executeCachedStatementForKey:&fetchShardPropertiesInTransaction_error_handler__lookupKey error:a4 SQLGenerator:v15 bindingHandler:v14 enumerationHandler:v12];

  return (char)a4;
}

id __74__HDCloudSyncStoreEntity_fetchShardPropertiesInTransaction_error_handler___block_invoke()
{
  v0 = NSString;
  id v1 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v2 = [v0 stringWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ IS NOT NULL", @"shard_type", @"shard_start_date", @"shard_end_date", v1, *MEMORY[0x1E4F65C70], @"shard_type"];

  return v2;
}

uint64_t __74__HDCloudSyncStoreEntity_fetchShardPropertiesInTransaction_error_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __74__HDCloudSyncStoreEntity_fetchShardPropertiesInTransaction_error_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  HDSQLiteColumnAsInt64();
  uint64_t v4 = MEMORY[0x1C1879F30](a2, 1);
  double v5 = MEMORY[0x1C1879F30](a2, 2);
  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v6;
}

- (BOOL)updateSyncIdentity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  long long v9 = [a4 databaseForEntity:self];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__HDCloudSyncStoreEntity_updateSyncIdentity_transaction_error___block_invoke;
  v15[3] = &unk_1E62F59C8;
  void v15[4] = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__HDCloudSyncStoreEntity_updateSyncIdentity_transaction_error___block_invoke_2;
  v12[3] = &unk_1E62F2900;
  id v13 = v8;
  id v14 = self;
  id v10 = v8;
  LOBYTE(a5) = [v9 executeCachedStatementForKey:&updateSyncIdentity_transaction_error__lookupKey error:a5 SQLGenerator:v15 bindingHandler:v12 enumerationHandler:0];

  return (char)a5;
}

id __63__HDCloudSyncStoreEntity_updateSyncIdentity_transaction_error___block_invoke()
{
  v0 = NSString;
  id v1 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v2 = [v0 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ?", v1, @"sync_identity", *MEMORY[0x1E4F65C70]];

  return v2;
}

uint64_t __63__HDCloudSyncStoreEntity_updateSyncIdentity_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) entity];
  sqlite3_bind_int64(a2, 1, [v4 persistentID]);

  sqlite3_int64 v5 = [*(id *)(a1 + 40) persistentID];

  return sqlite3_bind_int64(a2, 2, v5);
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 16;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_96;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v5 = @"sync_store";
  uint64_t v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  sqlite3_int64 v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id __128__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __128__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler___block_invoke_2(id *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, (const char *)[a1[4] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_text(a2, 2, (const char *)[a1[5] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v4 = [a1[6] entity];
  sqlite3_bind_int64(a2, 3, [v4 persistentID]);
}

uint64_t __128__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_syncIdentity_profile_transaction_error_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [(HDSQLiteEntity *)[HDCloudSyncStoreEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  sqlite3_int64 v5 = MEMORY[0x1C1879F30](a2, 1);
  uint64_t v6 = MEMORY[0x1C1879F30](a2, 2);
  HDSQLiteColumnAsInt64();
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v7;
}

id __115__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __115__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v4 = (const char *)[*(id *)(a1 + 40) UTF8String];

  return sqlite3_bind_text(a2, 2, v4, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __115__HDCloudSyncStoreEntity__enumerateShardsForOwnerIdentifier_containerIdentifier_profile_transaction_error_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [(HDSQLiteEntity *)[HDCloudSyncStoreEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  sqlite3_int64 v5 = MEMORY[0x1C1879F30](a2, 1);
  uint64_t v6 = MEMORY[0x1C1879F30](a2, 2);
  HDSQLiteColumnAsInt64();
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v7;
}

@end