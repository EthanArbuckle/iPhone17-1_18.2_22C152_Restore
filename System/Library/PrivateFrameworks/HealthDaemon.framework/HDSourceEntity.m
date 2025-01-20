@interface HDSourceEntity
+ (BOOL)enumerateBundleIdentifiersForSourcesForUUIDData:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)enumerateBundleIdentifiersForSourcesWithPredicate:(id)a3 database:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_firstSourceWithPredicate:(void *)a3 database:(uint64_t)a4 error:;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)firstSourceWithPredicate:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)firstSourceWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)foreignKeys;
+ (id)indices;
+ (id)insertSourceWithUUID:(id)a3 logicalSourceID:(int64_t)a4 name:(id)a5 options:(unint64_t)a6 isCurrentDevice:(BOOL)a7 productType:(id)a8 deleted:(BOOL)a9 modificationDate:(id)a10 provenance:(int64_t)a11 syncIdentity:(int64_t)a12 transaction:(id)a13 error:(id *)a14;
+ (id)joinClausesForProperty:(id)a3;
+ (id)propertyForSyncAnchor;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)sourceForLocalDeviceWithDatabase:(id)a3 error:(id *)a4;
+ (id)sourceForLogicalSourceID:(id)a3 localDeviceBundleIdentifier:(BOOL)a4 localOnly:(BOOL)a5 transaction:(id)a6 error:(id *)a7;
+ (id)sourcesWithPredicate:(id)a3 includeDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6;
+ (id)sourcesWithPredicate:(id)a3 includeDeleted:(BOOL)a4 profile:(id)a5 error:(id *)a6;
+ (id)sourcesWithPredicate:(id)a3 orderingTerms:(id)a4 includeDeleted:(BOOL)a5 database:(id)a6 error:(id *)a7;
+ (int64_t)protectionClass;
- (BOOL)adoptAsLocalSourceWithLogicalSourceID:(id)a3 UUID:(id)a4 name:(id)a5 productType:(id)a6 profile:(id)a7 error:(id *)a8;
- (BOOL)deleteSourceWithTombstoneLogicalSourceID:(int64_t)a3 syncIdentity:(int64_t)a4 database:(id)a5 transaction:(id)a6 error:(id *)a7;
- (BOOL)setName:(id)a3 profile:(id)a4 error:(id *)a5;
- (BOOL)setOptions:(unint64_t)a3 profile:(id)a4 didUpdate:(BOOL *)a5 error:(id *)a6;
- (id)codableSourceWithEncoder:(id)a3 transaction:(id)a4 profile:(id)a5 error:(id *)a6;
- (id)codableSourceWithProfile:(id)a3 error:(id *)a4;
- (id)sourceBundleIdentifierInDatabase:(id)a3 error:(id *)a4;
- (id)sourceUUIDWithHealthDatabase:(id)a3 error:(id *)a4;
- (id)sourceUUIDWithProfile:(id)a3 error:(id *)a4;
- (id)sourceWithProfile:(id)a3 error:(id *)a4;
- (id)unitTest_logicalSourceEntityWithHealthDatabase:(id)a3 error:(id *)a4;
- (uint64_t)_updateValues:(void *)a3 forProperties:(void *)a4 profile:(uint64_t)a5 didUpdate:(uint64_t)a6 error:;
@end

@implementation HDSourceEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)propertyForSyncAnchor
{
  return @"sync_anchor";
}

+ (id)propertyForSyncProvenance
{
  return @"provenance";
}

+ (id)sourceForLocalDeviceWithDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = HDSourceEntityPredicateForLocalDeviceSource();
  v8 = +[HDSourceEntity _firstSourceWithPredicate:database:error:]((uint64_t)a1, v7, v6, (uint64_t)a4);

  return v8;
}

+ (id)_firstSourceWithPredicate:(void *)a3 database:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  v8 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HDSourceEntity__firstSourceWithPredicate_database_error___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v8;
  if (qword_1EBA18B30 != -1) {
    dispatch_once(&qword_1EBA18B30, block);
  }
  v9 = [v8 firstInDatabase:v6 predicate:v7 orderingTerms:_MergedGlobals_200 error:a4];

  return v9;
}

- (id)sourceWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__45;
  v21 = __Block_byref_object_dispose__45;
  id v22 = 0;
  id v7 = objc_opt_class();
  v8 = [v6 database];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__HDSourceEntity_sourceWithProfile_error___block_invoke;
  v13[3] = &unk_1E62F5CB0;
  id v9 = v6;
  id v14 = v9;
  v15 = self;
  v16 = &v17;
  LODWORD(a4) = [v7 performReadTransactionWithHealthDatabase:v8 error:a4 block:v13];

  if (a4) {
    v10 = (void *)v18[5];
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __42__HDSourceEntity_sourceWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  id v7 = +[HDSourceEntity entityEncoderForProfile:v5 transaction:v6 purpose:1 encodingOptions:0 authorizationFilter:0];
  v8 = [v6 databaseForEntity:*(void *)(a1 + 40)];

  id v9 = *(void **)(a1 + 40);
  v10 = [v7 orderedProperties];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__HDSourceEntity_sourceWithProfile_error___block_invoke_2;
  v14[3] = &unk_1E62F9970;
  id v15 = v7;
  long long v16 = *(_OWORD *)(a1 + 40);
  id v11 = v7;
  uint64_t v12 = [v9 getValuesForProperties:v10 database:v8 error:a3 handler:v14];

  return v12;
}

void __42__HDSourceEntity_sourceWithProfile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) persistentID];
  id v15 = 0;
  uint64_t v7 = [v5 objectForPersistentID:v6 row:a3 error:&v15];
  id v8 = v15;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    _HKInitializeLogging();
    id v11 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = v11;
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      id v19 = v8;
      id v14 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to instantiate source: %{public}@", buf, 0x16u);
    }
  }
}

+ (id)firstSourceWithPredicate:(id)a3 database:(id)a4 error:(id *)a5
{
  return +[HDSourceEntity _firstSourceWithPredicate:database:error:]((uint64_t)a1, a3, a4, (uint64_t)a5);
}

- (id)sourceUUIDWithHealthDatabase:(id)a3 error:(id *)a4
{
  v4 = [(HDHealthEntity *)self valueForProperty:@"uuid" healthDatabase:a3 error:a4];
  uint64_t v5 = _HDUUIDForSQLiteValue();

  return v5;
}

+ (id)databaseTable
{
  return @"sources";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 12;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSourceEntityColumnDefinitions;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"logical_source_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)indices
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v3 = objc_opt_class();
  id v19 = @"logical_source_id";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  uint64_t v5 = (void *)[v2 initWithEntity:v3 name:@"logical_source_id" columns:v4];
  v20[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v7 = objc_opt_class();
  __int16 v18 = @"provenance";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  uint64_t v9 = (void *)[v6 initWithEntity:v7 name:@"provenance" columns:v8];
  v20[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v11 = objc_opt_class();
  uint64_t v17 = @"local_device";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v13 = [NSString stringWithFormat:@"%@ = 1", @"local_device"];
  id v14 = (void *)[v10 initWithEntity:v11 name:@"local_device" columns:v12 unique:0 predicateString:v13];
  v20[2] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];

  return v15;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"logical_sources.bundle_id"] & 1) != 0
    || [v4 isEqualToString:@"logical_sources.owner_bundle_id"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F65D38];
    id v6 = [a1 disambiguatedDatabaseTable];
    uint64_t v7 = [v5 innerJoinClauseFromTable:v6 toTargetEntity:objc_opt_class() as:0 localReference:@"logical_source_id" targetKey:*MEMORY[0x1E4F65C70]];

    id v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v7, 0);
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___HDSourceEntity;
    id v8 = objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
  }

  return v8;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(HDEntityEncoder *)[_HDSourceEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (id)insertSourceWithUUID:(id)a3 logicalSourceID:(int64_t)a4 name:(id)a5 options:(unint64_t)a6 isCurrentDevice:(BOOL)a7 productType:(id)a8 deleted:(BOOL)a9 modificationDate:(id)a10 provenance:(int64_t)a11 syncIdentity:(int64_t)a12 transaction:(id)a13 error:(id *)a14
{
  id v17 = a3;
  __int16 v18 = (__CFString *)a5;
  id v19 = (__CFString *)a8;
  id v20 = a10;
  id v21 = a13;
  uint64_t v22 = self;
  if (v17)
  {
    if (!a9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:sel__insertSourceWithUUID_logicalSourceID_name_options_isCurrentDevice_productType_deleted_modificationDate_provenance_syncIdentity_transaction_error_, v22, @"HDSourceEntity.m", 194, @"Invalid parameter not satisfying: %@", @"UUID != nil" object file lineNumber description];

  if (a9)
  {
LABEL_3:

    a6 = 0;
    id v19 = &stru_1F1728D60;
    __int16 v18 = &stru_1F1728D60;
  }
LABEL_4:
  v35 = v21;
  v23 = [v21 databaseForEntityClass:v22];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __164__HDSourceEntity__insertSourceWithUUID_logicalSourceID_name_options_isCurrentDevice_productType_deleted_modificationDate_provenance_syncIdentity_transaction_error___block_invoke;
  v47[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v47[4] = v22;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __164__HDSourceEntity__insertSourceWithUUID_logicalSourceID_name_options_isCurrentDevice_productType_deleted_modificationDate_provenance_syncIdentity_transaction_error___block_invoke_2;
  v36[3] = &unk_1E62F98A8;
  id v24 = v17;
  id v37 = v24;
  int64_t v41 = a4;
  v25 = v18;
  v38 = v25;
  unint64_t v42 = a6;
  BOOL v45 = a7;
  v26 = v19;
  v39 = v26;
  BOOL v46 = a9;
  id v27 = v20;
  id v40 = v27;
  int64_t v43 = a11;
  int64_t v44 = a12;
  v28 = 0;
  if ([v23 executeCachedStatementForKey:&_insertSourceWithUUID_logicalSourceID_name_options_isCurrentDevice_productType_deleted_modificationDate_provenance_syncIdentity_transaction_error__insertKey error:a14 SQLGenerator:v47 bindingHandler:v36 enumerationHandler:0])
  {
    notify_post((const char *)*MEMORY[0x1E4F2BF68]);
    v29 = [HDSourceEntity alloc];
    v30 = [v23 lastInsertRowID];
    v28 = -[HDSQLiteEntity initWithPersistentID:](v29, "initWithPersistentID:", [v30 longLongValue]);
  }

  return v28;
}

id __164__HDSourceEntity__insertSourceWithUUID_logicalSourceID_name_options_isCurrentDevice_productType_deleted_modificationDate_provenance_syncIdentity_transaction_error___block_invoke(uint64_t a1)
{
  id v2 = NSString;
  uint64_t v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  id v4 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v5 = [v2 stringWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, COALESCE((SELECT MAX(%@) + 1 FROM %@), 1), ?)", v3, @"uuid", @"logical_source_id", @"name", @"source_options", @"local_device", @"product_type", @"deleted", @"mod_date", @"provenance", @"sync_anchor", @"sync_identity", @"sync_anchor", v4, 0];

  return v5;
}

uint64_t __164__HDSourceEntity__insertSourceWithUUID_logicalSourceID_name_options_isCurrentDevice_productType_deleted_modificationDate_provenance_syncIdentity_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 64));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 72));
  sqlite3_bind_int(a2, 5, *(unsigned __int8 *)(a1 + 96));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int(a2, 7, *(unsigned __int8 *)(a1 + 97));
  if (*(void *)(a1 + 56))
  {
    HDSQLiteBindFoundationValueToStatement();
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    HDSQLiteBindFoundationValueToStatement();
  }
  sqlite3_bind_int64(a2, 9, *(void *)(a1 + 80));
  sqlite3_int64 v5 = *(void *)(a1 + 88);

  return sqlite3_bind_int64(a2, 10, v5);
}

+ (id)sourceForLogicalSourceID:(id)a3 localDeviceBundleIdentifier:(BOOL)a4 localOnly:(BOOL)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__45;
  v29 = __Block_byref_object_dispose__45;
  id v30 = 0;
  id v14 = [v13 databaseForEntityClass:a1];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __99__HDSourceEntity_sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error___block_invoke;
  v24[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v24[4] = a1;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __99__HDSourceEntity_sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error___block_invoke_2;
  v20[3] = &unk_1E62F98D0;
  BOOL v22 = a5;
  BOOL v23 = a4;
  id v15 = v12;
  id v21 = v15;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__HDSourceEntity_sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error___block_invoke_3;
  v19[3] = &unk_1E62F3640;
  v19[4] = &v25;
  if ([v14 executeCachedStatementForKey:&sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error__lookupKey error:a7 SQLGenerator:v24 bindingHandler:v20 enumerationHandler:v19])long long v16 = (void *)v26[5]; {
  else
  }
    long long v16 = 0;
  id v17 = v16;

  _Block_object_dispose(&v25, 8);

  return v17;
}

id __99__HDSourceEntity_sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  id v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = [v1 stringWithFormat:@"SELECT ROWID FROM %@ WHERE ((%@ = ? AND ? = 0) OR (%@ = 1 AND ? = 1)) AND (%@ = ? OR 0 = ?) ORDER BY %@ ASC", v2, @"logical_source_id", @"local_device", @"provenance", @"provenance"];

  return v3;
}

uint64_t __99__HDSourceEntity_sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = *(unsigned __int8 *)(a1 + 40);
  sqlite3_int64 v4 = *(unsigned __int8 *)(a1 + 41);
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  sqlite3_bind_int64(a2, 2, v4);
  sqlite3_bind_int64(a2, 3, v4);
  sqlite3_bind_int64(a2, 4, 0);

  return sqlite3_bind_int64(a2, 5, v3);
}

uint64_t __99__HDSourceEntity_sourceForLogicalSourceID_localDeviceBundleIdentifier_localOnly_transaction_error___block_invoke_3(uint64_t a1)
{
  id v2 = [(HDSQLiteEntity *)[HDSourceEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  sqlite3_int64 v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

+ (id)firstSourceWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = __Block_byref_object_copy__45;
  BOOL v23 = __Block_byref_object_dispose__45;
  id v24 = 0;
  objc_super v10 = [v8 database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__HDSourceEntity__firstSourceWithPredicate_profile_error___block_invoke;
  v15[3] = &unk_1E62F66D8;
  id v17 = &v19;
  __int16 v18 = v9;
  id v11 = v7;
  id v16 = v11;
  LODWORD(a5) = [v9 performReadTransactionWithHealthDatabase:v10 error:a5 block:v15];

  if (a5) {
    id v12 = (void *)v20[5];
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return v13;
}

+ (id)sourcesWithPredicate:(id)a3 includeDeleted:(BOOL)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = self;
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__45;
  v26 = __Block_byref_object_dispose__45;
  id v27 = 0;
  id v12 = [v10 database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__HDSourceEntity__sourcesWithPredicate_includeDeleted_profile_error___block_invoke;
  v17[3] = &unk_1E62F9948;
  uint64_t v19 = &v22;
  id v20 = v11;
  id v13 = v9;
  id v18 = v13;
  BOOL v21 = a4;
  LODWORD(a6) = [v11 performReadTransactionWithHealthDatabase:v12 error:a6 block:v17];

  if (a6) {
    id v14 = (void *)v23[5];
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  _Block_object_dispose(&v22, 8);

  return v15;
}

+ (id)sourcesWithPredicate:(id)a3 includeDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6
{
  return (id)[a1 sourcesWithPredicate:a3 orderingTerms:0 includeDeleted:a4 database:a5 error:a6];
}

+ (id)sourcesWithPredicate:(id)a3 orderingTerms:(id)a4 includeDeleted:(BOOL)a5 database:(id)a6 error:(id *)a7
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (!a5)
  {
    uint64_t v15 = _HDSourceEntityPredicateForNotDeletedWithPredicate(v12);

    id v12 = (id)v15;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v17 = [a1 queryWithDatabase:v14 predicate:v12 limit:0 orderingTerms:v13 groupBy:0];
  v27[0] = @"logical_sources.bundle_id";
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __83__HDSourceEntity_sourcesWithPredicate_orderingTerms_includeDeleted_database_error___block_invoke;
  v24[3] = &unk_1E62F66B0;
  id v25 = v16;
  id v26 = a1;
  id v19 = v16;
  int v20 = [v17 enumeratePersistentIDsAndProperties:v18 error:a7 enumerationHandler:v24];

  if (v20) {
    BOOL v21 = v19;
  }
  else {
    BOOL v21 = 0;
  }
  id v22 = v21;

  return v22;
}

uint64_t __83__HDSourceEntity_sourcesWithPredicate_orderingTerms_includeDeleted_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithPersistentID:a2];
  [*(id *)(a1 + 32) addObject:v3];

  return 1;
}

+ (BOOL)enumerateBundleIdentifiersForSourcesWithPredicate:(id)a3 database:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a4;
  id v12 = _HDSourceEntityPredicateForNotDeletedWithPredicate(a3);
  id v13 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v13 setEntityClass:a1];
  [v13 setPredicate:v12];
  [v13 setReturnsDistinctEntities:1];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v11 descriptor:v13];

  v20[0] = @"logical_sources.bundle_id";
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__HDSourceEntity_enumerateBundleIdentifiersForSourcesWithPredicate_database_error_enumerationHandler___block_invoke;
  v18[3] = &unk_1E62F4138;
  id v19 = v10;
  id v16 = v10;
  LOBYTE(a5) = [v14 enumerateProperties:v15 error:a5 enumerationHandler:v18];

  return (char)a5;
}

uint64_t __102__HDSourceEntity_enumerateBundleIdentifiersForSourcesWithPredicate_database_error_enumerationHandler___block_invoke(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  uint64_t v1 = HKWithAutoreleasePool();

  return v1;
}

uint64_t __102__HDSourceEntity_enumerateBundleIdentifiersForSourcesWithPredicate_database_error_enumerationHandler___block_invoke_2(uint64_t a1)
{
  id v2 = MEMORY[0x1C1879F80](*(void *)(a1 + 40), 0);
  if ([v2 length]) {
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

+ (BOOL)enumerateBundleIdentifiersForSourcesForUUIDData:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__45;
  v32 = __Block_byref_object_dispose__45;
  id v33 = 0;
  id v13 = [v11 databaseForEntityClass:a1];
  v27[0] = 0;
  v27[1] = v27;
  void v27[2] = 0x2020000000;
  v27[3] = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke;
  v20[3] = &unk_1E62F9920;
  BOOL v23 = &v34;
  id v14 = v13;
  id v26 = a1;
  id v21 = v14;
  uint64_t v24 = &v28;
  id v15 = v12;
  id v22 = v15;
  id v25 = v27;
  objc_msgSend(v10, "hk_enumerateUUIDBytesUsingBlock:", v20);
  int v16 = *((unsigned __int8 *)v35 + 24);
  if (!*((unsigned char *)v35 + 24))
  {
    id v17 = (id)v29[5];
    id v18 = v17;
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v16 != 0;
}

void __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__45;
  id v21 = __Block_byref_object_dispose__45;
  id v22 = 0;
  id v6 = (void *)a1[4];
  void v14[4] = a2;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke_2;
  v15[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v15[4] = a1[9];
  id v16 = 0;
  void v13[4] = &v17;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke_3;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke_4;
  v13[3] = &unk_1E62F3640;
  char v7 = [v6 executeCachedStatementForKey:&_SourceEntityLogicalSourceOwnerBundleIdentifier_block_invoke_lookupKey error:&v16 SQLGenerator:v15 bindingHandler:v14 enumerationHandler:v13];
  id v8 = v16;
  id v9 = v16;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v7;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    if (v18[5])
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      _HKInitializeLogging();
      id v10 = (id)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v24 = v11;
        __int16 v25 = 1042;
        int v26 = 16;
        __int16 v27 = 2098;
        uint64_t v28 = a2;
        id v12 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: failed to find source for UUID %{public, uuid}.16P", buf, 0x1Cu);
      }
    }
    ++*(void *)(*(void *)(a1[8] + 8) + 24);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v8);
    *a3 = 1;
  }
  _Block_object_dispose(&v17, 8);
}

id __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1)
{
  id v2 = NSString;
  uint64_t v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  sqlite3_int64 v4 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  sqlite3_int64 v5 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  id v6 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v7 = *MEMORY[0x1E4F65C70];
  id v8 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  id v9 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  id v10 = [v2 stringWithFormat:@"SELECT %@ FROM %@ JOIN %@ ON %@.%@ = %@.%@ WHERE %@.%@ = ? AND %@.%@ = 0", @"logical_sources.bundle_id", v3, v4, v5, @"logical_source_id", v6, v7, v8, @"uuid", v9, @"deleted", 0];

  return v10;
}

uint64_t __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_blob(a2, 1, *(const void **)(a1 + 32), 16, 0);
}

uint64_t __103__HDSourceEntity_enumerateBundleIdentifiersForSourcesForUUIDData_transaction_error_enumerationHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F80](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  sqlite3_int64 v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

BOOL __69__HDSourceEntity__sourcesWithPredicate_includeDeleted_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  sqlite3_int64 v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  id v8 = [a2 databaseForEntityClass:v5];
  uint64_t v9 = [v5 sourcesWithPredicate:v6 orderingTerms:0 includeDeleted:v7 database:v8 error:a3];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

BOOL __58__HDSourceEntity__firstSourceWithPredicate_profile_error___block_invoke(void *a1, void *a2, void *a3)
{
  sqlite3_int64 v5 = [a2 databaseForEntityClass:a1[6]];
  uint64_t v6 = a1[6];
  uint64_t v7 = (void *)a1[4];
  id v15 = 0;
  uint64_t v8 = +[HDSourceEntity _firstSourceWithPredicate:database:error:](v6, v7, v5, (uint64_t)&v15);
  id v9 = v15;
  uint64_t v10 = *(void *)(a1[5] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    BOOL v12 = 1;
  }
  else
  {
    id v13 = v9;
    BOOL v12 = v13 == 0;
    if (v13)
    {
      if (a3) {
        *a3 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v12;
}

void __59__HDSourceEntity__firstSourceWithPredicate_database_error___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:*MEMORY[0x1E4F65C70] entityClass:*(void *)(a1 + 32) ascending:1];
  v4[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v3 = (void *)_MergedGlobals_200;
  _MergedGlobals_200 = v2;
}

- (id)codableSourceWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__45;
  uint64_t v19 = __Block_byref_object_dispose__45;
  id v20 = 0;
  uint64_t v7 = [v6 database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__HDSourceEntity_codableSourceWithProfile_error___block_invoke;
  v11[3] = &unk_1E62F9998;
  id v8 = v6;
  id v13 = self;
  id v14 = &v15;
  id v12 = v8;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:v7 error:a4 block:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __49__HDSourceEntity_codableSourceWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = +[HDSourceEntity entityEncoderForProfile:v5 transaction:v6 purpose:0 encodingOptions:0 authorizationFilter:0];
  uint64_t v8 = [*(id *)(a1 + 40) codableSourceWithEncoder:v7 transaction:v6 profile:*(void *)(a1 + 32) error:a3];

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return 1;
}

- (id)codableSourceWithEncoder:(id)a3 transaction:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([v11 purpose])
  {
    __int16 v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"HDSourceEntity.m", 550, @"Invalid parameter not satisfying: %@", @"[entityEncoder purpose] == HDEntityEncodingPurposeCodableObjectCreation" object file lineNumber description];
  }
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__45;
  int64_t v41 = __Block_byref_object_dispose__45;
  id v42 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  id v14 = [v11 orderedProperties];
  uint64_t v15 = [v11 profile];
  id v16 = [v15 database];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__HDSourceEntity_codableSourceWithEncoder_transaction_profile_error___block_invoke;
  v28[3] = &unk_1E62F99C0;
  v31 = &v33;
  v32 = &v37;
  id v17 = v11;
  id v29 = v17;
  uint64_t v30 = self;
  BOOL v18 = [(HDHealthEntity *)self getValuesForProperties:v14 healthDatabase:v16 error:a6 handler:v28];

  uint64_t v19 = [v13 syncIdentityManager];
  id v20 = [v19 identityForEntityID:v34[3] transaction:v12 error:a6];

  if (v20)
  {
    id v21 = (void *)v38[5];
    id v22 = [v20 identity];
    BOOL v23 = [v22 codableSyncIdentity];
    [v21 setSyncIdentity:v23];

    if (v18) {
      uint64_t v24 = (void *)v38[5];
    }
    else {
      uint64_t v24 = 0;
    }
    id v25 = v24;
  }
  else
  {
    id v25 = 0;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v25;
}

void __69__HDSourceEntity_codableSourceWithEncoder_transaction_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(*(id *)(a1 + 40), "persistentID"), a3, 0);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)sourceUUIDWithProfile:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 database];
  uint64_t v7 = [(HDHealthEntity *)self valueForProperty:@"uuid" healthDatabase:v6 error:a4];
  uint64_t v8 = _HDUUIDForSQLiteValue();

  return v8;
}

- (BOOL)setName:(id)a3 profile:(id)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v15[0] = a3;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 arrayWithObjects:v15 count:1];
  id v14 = @"name";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];

  LOBYTE(a5) = -[HDSourceEntity _updateValues:forProperties:profile:didUpdate:error:]((uint64_t)self, v11, v12, v9, 0, (uint64_t)a5);
  return (char)a5;
}

- (uint64_t)_updateValues:(void *)a3 forProperties:(void *)a4 profile:(uint64_t)a5 didUpdate:(uint64_t)a6 error:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  if (a1)
  {
    uint64_t v14 = [v11 count];
    if (v14 != [v12 count])
    {
      uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:sel__updateValues_forProperties_profile_didUpdate_error_, a1, @"HDSourceEntity.m", 633, @"Invalid parameter not satisfying: %@", @"values.count == properties.count" object file lineNumber description];
    }
    if ([v12 count])
    {
      uint64_t v39 = a5;
      uint64_t v40 = a6;
      uint64_t v15 = [v13 syncIdentityManager];
      id v16 = [v15 currentSyncIdentity];
      id v17 = [v16 entity];
      uint64_t v38 = [v17 persistentID];

      BOOL v18 = (void *)MEMORY[0x1E4F28E78];
      uint64_t v19 = [(id)objc_opt_class() disambiguatedDatabaseTable];
      id v20 = [(id)objc_opt_class() disambiguatedDatabaseTable];
      id v21 = [v18 stringWithFormat:@"UPDATE %@ SET %@ = COALESCE((SELECT MAX(%@) + 1 FROM %@), 1), %@ = ?, %@ = ?", v19, @"sync_anchor", @"sync_anchor", v20, @"mod_date", @"sync_identity", 0];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v22 = v12;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v51;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v51 != v25) {
              objc_enumerationMutation(v22);
            }
            [v21 appendFormat:@", %@ = ?", *(void *)(*((void *)&v50 + 1) + 8 * v26++)];
          }
          while (v24 != v26);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v24);
      }

      objc_msgSend(v21, "appendFormat:", @" WHERE %@ = ? AND (0"), *MEMORY[0x1E4F65C70];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v27 = v22;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v47;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v47 != v30) {
              objc_enumerationMutation(v27);
            }
            [v21 appendFormat:@" OR %@ != ?", *(void *)(*((void *)&v46 + 1) + 8 * v31++)];
          }
          while (v29 != v31);
          uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v29);
      }

      [v21 appendString:@""]);
      v32 = objc_opt_class();
      uint64_t v33 = [v13 database];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __70__HDSourceEntity__updateValues_forProperties_profile_didUpdate_error___block_invoke;
      v41[3] = &unk_1E62F4188;
      v41[4] = a1;
      id v42 = v21;
      uint64_t v44 = v38;
      id v43 = v11;
      uint64_t v45 = v39;
      id v34 = v21;
      uint64_t v35 = [v32 performWriteTransactionWithHealthDatabase:v33 error:v40 block:v41];
    }
    else
    {
      uint64_t v35 = 1;
    }
  }
  else
  {
    uint64_t v35 = 0;
  }

  return v35;
}

- (BOOL)setOptions:(unint64_t)a3 profile:(id)a4 didUpdate:(BOOL *)a5 error:(id *)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = NSNumber;
  id v11 = a4;
  id v12 = [v10 numberWithUnsignedLongLong:a3];
  v17[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v16 = @"source_options";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  LOBYTE(a6) = -[HDSourceEntity _updateValues:forProperties:profile:didUpdate:error:]((uint64_t)self, v13, v14, v11, (uint64_t)a5, (uint64_t)a6);

  return (char)a6;
}

- (BOOL)adoptAsLocalSourceWithLogicalSourceID:(id)a3 UUID:(id)a4 name:(id)a5 productType:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = objc_opt_class();
  id v20 = [v18 database];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __92__HDSourceEntity_adoptAsLocalSourceWithLogicalSourceID_UUID_name_productType_profile_error___block_invoke;
  v27[3] = &unk_1E62F99E8;
  void v27[4] = self;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  LOBYTE(a8) = [v19 performWriteTransactionWithHealthDatabase:v20 error:a8 block:v27];

  return (char)a8;
}

uint64_t __92__HDSourceEntity_adoptAsLocalSourceWithLogicalSourceID_UUID_name_productType_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v18[6] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSString;
  id v6 = a2;
  uint64_t v7 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v8 = [v5 stringWithFormat:@"UPDATE %@ SET %@=0", v7, @"local_device"];

  id v9 = [v6 databaseForEntity:*(void *)(a1 + 32)];

  LODWORD(v6) = [v9 executeUncachedSQL:v8 error:a3];
  if (v6)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    v18[0] = *(void *)(a1 + 40);
    v18[1] = v11;
    v18[2] = &unk_1F17EB418;
    v18[3] = v12;
    void v18[4] = *(void *)(a1 + 64);
    v18[5] = MEMORY[0x1E4F1CC38];
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:6];
    v17[0] = @"logical_source_id";
    v17[1] = @"uuid";
    void v17[2] = @"provenance";
    v17[3] = @"name";
    void v17[4] = @"product_type";
    v17[5] = @"local_device";
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:6];
    uint64_t v15 = -[HDSourceEntity _updateValues:forProperties:profile:didUpdate:error:](v10, v13, v14, *(void **)(a1 + 72), 0, a3);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __70__HDSourceEntity__updateValues_forProperties_profile_didUpdate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 databaseForEntity:*(void *)(a1 + 32)];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__HDSourceEntity__updateValues_forProperties_profile_didUpdate_error___block_invoke_2;
  v12[3] = &unk_1E62F9A10;
  uint64_t v7 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v8;
  uint64_t v14 = v9;
  uint64_t v10 = [v5 executeSQL:v7 error:a3 bindingHandler:v12 enumerationHandler:0];
  if (v10 && *(void *)(a1 + 64)) {
    **(unsigned char **)(a1 + 64) = (int)[v5 getChangesCount] > 0;
  }

  return v10;
}

uint64_t __70__HDSourceEntity__updateValues_forProperties_profile_didUpdate_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 1, Current);
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 48));
  int v5 = HDSQLiteBindFoundationValuesToStatement();
  sqlite3_bind_int64(a2, v5, [*(id *)(a1 + 40) persistentID]);

  return HDSQLiteBindFoundationValuesToStatement();
}

- (id)sourceBundleIdentifierInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__45;
  id v17 = __Block_byref_object_dispose__45;
  id v18 = 0;
  void v11[4] = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__HDSourceEntity_sourceBundleIdentifierInDatabase_error___block_invoke;
  v12[3] = &unk_1E62F59C8;
  void v12[4] = self;
  v10[4] = &v13;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__HDSourceEntity_sourceBundleIdentifierInDatabase_error___block_invoke_2;
  v11[3] = &unk_1E62F43C8;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__HDSourceEntity_sourceBundleIdentifierInDatabase_error___block_invoke_3;
  v10[3] = &unk_1E62F3640;
  if ([v6 executeCachedStatementForKey:&sourceBundleIdentifierInDatabase_error__lookupKey error:a4 SQLGenerator:v12 bindingHandler:v11 enumerationHandler:v10])uint64_t v7 = (void *)v14[5]; {
  else
  }
    uint64_t v7 = 0;
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

id __57__HDSourceEntity_sourceBundleIdentifierInDatabase_error___block_invoke()
{
  v0 = NSString;
  uint64_t v1 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v2 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v3 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v4 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v5 = *MEMORY[0x1E4F65C70];
  id v6 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v7 = [v0 stringWithFormat:@"SELECT %@ FROM %@ JOIN %@ ON %@.%@ = %@.%@ WHERE %@.%@ = ?", @"logical_sources.bundle_id", v1, v2, v3, @"logical_source_id", v4, v5, v6, v5, 0];

  return v7;
}

uint64_t __57__HDSourceEntity_sourceBundleIdentifierInDatabase_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __57__HDSourceEntity_sourceBundleIdentifierInDatabase_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F80](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (BOOL)deleteSourceWithTombstoneLogicalSourceID:(int64_t)a3 syncIdentity:(int64_t)a4 database:(id)a5 transaction:(id)a6 error:(id *)a7
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__HDSourceEntity_deleteSourceWithTombstoneLogicalSourceID_syncIdentity_database_transaction_error___block_invoke;
  v10[3] = &unk_1E62F59C8;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__HDSourceEntity_deleteSourceWithTombstoneLogicalSourceID_syncIdentity_database_transaction_error___block_invoke_2;
  v9[3] = &unk_1E62F3618;
  v9[5] = a3;
  v9[6] = a4;
  v9[4] = self;
  int v7 = [a5 executeCachedStatementForKey:&deleteSourceWithTombstoneLogicalSourceID_syncIdentity_database_transaction_error__updateKey error:a7 SQLGenerator:v10 bindingHandler:v9 enumerationHandler:&__block_literal_global_50];
  if (v7) {
    notify_post((const char *)*MEMORY[0x1E4F2BF68]);
  }
  return v7;
}

id __99__HDSourceEntity_deleteSourceWithTombstoneLogicalSourceID_syncIdentity_database_transaction_error___block_invoke()
{
  v0 = NSString;
  uint64_t v1 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v2 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v3 = [v0 stringWithFormat:@"UPDATE %@ SET %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = '', %@ = 0, %@ = 0, %@ = '', %@ = 1, %@ = (SELECT MAX(%@) + 1 FROM %@) WHERE %@ = ? AND %@ == 0", v1, @"mod_date", @"provenance", @"logical_source_id", @"sync_identity", @"name", @"source_options", @"local_device", @"product_type", @"deleted", @"sync_anchor", @"sync_anchor", v2, *MEMORY[0x1E4F65C70], @"deleted", 0];

  return v3;
}

uint64_t __99__HDSourceEntity_deleteSourceWithTombstoneLogicalSourceID_syncIdentity_database_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 1, Current);
  sqlite3_bind_int64(a2, 2, 0);
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 48));
  sqlite3_int64 v5 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 5, v5);
}

uint64_t __99__HDSourceEntity_deleteSourceWithTombstoneLogicalSourceID_syncIdentity_database_transaction_error___block_invoke_3()
{
  return 0;
}

- (id)unitTest_logicalSourceEntityWithHealthDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__45;
  uint64_t v15 = __Block_byref_object_dispose__45;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__HDSourceEntity_unitTest_logicalSourceEntityWithHealthDatabase_error___block_invoke;
  v10[3] = &unk_1E62F9108;
  v10[4] = self;
  void v10[5] = &v11;
  if (+[HDHealthEntity performReadTransactionWithHealthDatabase:v6 error:a4 block:v10])
  {
    int v7 = (void *)v12[5];
  }
  else
  {
    int v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

BOOL __71__HDSourceEntity_unitTest_logicalSourceEntityWithHealthDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  sqlite3_int64 v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 foreignKeyEntity:objc_opt_class() forProperty:@"logical_source_id" transaction:v6 error:a3];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

@end