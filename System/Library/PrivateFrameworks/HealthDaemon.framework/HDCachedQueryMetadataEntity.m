@interface HDCachedQueryMetadataEntity
+ (BOOL)updateCachedQueryMetadata:(id)a3 profile:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)cachedQueryMetadataForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)creationDateForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)databaseTable;
+ (id)generationNumberForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)insertCachedQueryMetadata:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)lastUpdatedDateForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDCachedQueryMetadataEntity

+ (id)databaseTable
{
  return @"cached_queries";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 12;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDCachedQueryMetadataEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"query_identifier";
  v4[1] = @"source_id";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)insertCachedQueryMetadata:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (!v9)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"HDCachedQueryMetadataEntity.m", 204, @"Invalid parameter not satisfying: %@", @"queryMetadata != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_13:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"HDCachedQueryMetadataEntity.m", 205, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_13;
  }
LABEL_3:
  v12 = (void *)MEMORY[0x1E4F28DB0];
  v13 = [v9 intervalComponents];
  id v25 = 0;
  v14 = [v12 archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v25];
  id v15 = v25;

  if (v14 || !v15)
  {
    v17 = [v11 database];
    v18 = HDCachedQueryMetadataEntityAllProperties();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__HDCachedQueryMetadataEntity_insertCachedQueryMetadata_profile_error___block_invoke;
    v22[3] = &unk_1E62F3A88;
    id v23 = v9;
    id v24 = v14;
    v16 = [a1 insertOrReplaceEntity:0 healthDatabase:v17 properties:v18 error:a5 bindingHandler:v22];
  }
  else if (a5)
  {
    v16 = 0;
    *a5 = v15;
  }
  else
  {
    _HKLogDroppedError();
    v16 = 0;
  }

  return v16;
}

void __71__HDCachedQueryMetadataEntity_insertCachedQueryMetadata_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) cachingIdentifier];
  MEMORY[0x1C1879EC0](a2, @"query_identifier", v4);

  MEMORY[0x1C1879E80](a2, @"source_id", [*(id *)(a1 + 32) sourceEntityPersistentID]);
  MEMORY[0x1C1879E80](a2, @"generation_number", [*(id *)(a1 + 32) generationNumber]);
  MEMORY[0x1C1879E80](a2, @"max_anchor", [*(id *)(a1 + 32) maxAnchor]);
  v5 = [*(id *)(a1 + 32) queryStartIndex];
  MEMORY[0x1C1879EA0](a2, @"last_query_start_index", v5);

  v6 = [*(id *)(a1 + 32) queryEndIndex];
  MEMORY[0x1C1879EA0](a2, @"last_query_end_index", v6);

  v7 = [*(id *)(a1 + 32) buildVersion];
  MEMORY[0x1C1879EC0](a2, @"build_version", v7);

  id v9 = [MEMORY[0x1E4F1C9C8] now];
  MEMORY[0x1C1879E40](a2, @"last_updated_date", v9);
  MEMORY[0x1C1879E40](a2, @"creation_date", v9);
  v8 = [*(id *)(a1 + 32) anchorDate];
  MEMORY[0x1C1879E40](a2, @"anchor_date", v8);

  MEMORY[0x1C1879E30](a2, @"interval_components", *(void *)(a1 + 40));
}

+ (BOOL)updateCachedQueryMetadata:(id)a3 profile:(id)a4 error:(id *)a5
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (!v9)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"HDCachedQueryMetadataEntity.m", 240, @"Invalid parameter not satisfying: %@", @"queryMetadata != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"HDCachedQueryMetadataEntity.m", 241, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v12 = [v9 cachingIdentifier];
  uint64_t v13 = [v9 sourceEntityPersistentID];
  v14 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"query_identifier" equalToValue:v12];
  id v15 = (void *)MEMORY[0x1E4F65D00];
  v16 = [NSNumber numberWithLongLong:v13];
  v17 = [v15 predicateWithProperty:@"source_id" equalToValue:v16];

  v18 = (void *)MEMORY[0x1E4F65D08];
  v31[0] = v14;
  v31[1] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v20 = [v18 predicateMatchingAllPredicates:v19];

  v30[0] = @"generation_number";
  v30[1] = @"max_anchor";
  v30[2] = @"last_query_start_index";
  v30[3] = @"last_query_end_index";
  v30[4] = @"last_updated_date";
  v30[5] = @"build_version";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:6];
  v22 = [v11 database];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __71__HDCachedQueryMetadataEntity_updateCachedQueryMetadata_profile_error___block_invoke;
  v28[3] = &unk_1E62F35C8;
  id v29 = v9;
  id v23 = v9;
  char v24 = [a1 updateProperties:v21 predicate:v20 healthDatabase:v22 error:a5 bindingHandler:v28];

  return v24;
}

void __71__HDCachedQueryMetadataEntity_updateCachedQueryMetadata_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"generation_number", [*(id *)(a1 + 32) generationNumber]);
  MEMORY[0x1C1879E80](a2, @"max_anchor", [*(id *)(a1 + 32) maxAnchor]);
  v4 = [*(id *)(a1 + 32) queryStartIndex];
  MEMORY[0x1C1879EA0](a2, @"last_query_start_index", v4);

  v5 = [*(id *)(a1 + 32) queryEndIndex];
  MEMORY[0x1C1879EA0](a2, @"last_query_end_index", v5);

  v6 = [MEMORY[0x1E4F1C9C8] now];
  MEMORY[0x1C1879E40](a2, @"last_updated_date", v6);

  id v7 = [*(id *)(a1 + 32) buildVersion];
  MEMORY[0x1C1879EC0](a2, @"build_version", v7);
}

+ (id)cachedQueryMetadataForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = HDCachedQueryMetadataEntityPredicateForQueryIdentifierAndSource((uint64_t)v10, v11);
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__210;
  char v24 = __Block_byref_object_dispose__210;
  id v25 = 0;
  v14 = HDCachedQueryMetadataEntityAllProperties();
  id v15 = [v12 database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __96__HDCachedQueryMetadataEntity_cachedQueryMetadataForQueryIdentifier_sourceEntity_profile_error___block_invoke;
  v19[3] = &unk_1E630EF58;
  v19[4] = &v20;
  v19[5] = a1;
  LODWORD(a6) = [a1 enumerateProperties:v14 withPredicate:v13 healthDatabase:v15 error:a6 enumerationHandler:v19];

  if (a6) {
    v16 = (void *)v21[5];
  }
  else {
    v16 = 0;
  }
  id v17 = v16;
  _Block_object_dispose(&v20, 8);

  return v17;
}

uint64_t __96__HDCachedQueryMetadataEntity_cachedQueryMetadataForQueryIdentifier_sourceEntity_profile_error___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  self;
  v1 = HDSQLiteColumnWithNameAsString();
  uint64_t v17 = HDSQLiteColumnWithNameAsInt64();
  v2 = HDSQLiteColumnWithNameAsNumber();
  v3 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v15 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  v5 = HDSQLiteColumnWithNameAsString();
  v6 = HDSQLiteColumnWithNameAsDate();
  id v7 = HDSQLiteColumnWithNameAsData();
  id v18 = 0;
  v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v18];
  id v9 = v18;
  if (v9)
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v1;
      __int16 v21 = 2048;
      uint64_t v22 = v17;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Failed to unarchive intervalComponents for cached query entry: <%@, %lld>", buf, 0x16u);
    }
  }
  id v11 = [[HDCachedQueryMetadata alloc] initWithCachingIdentifier:v1 sourceEntityPersistentID:v17 maxAnchor:v15 queryStartIndex:v2 queryEndIndex:v3 generationNumber:v4 buildVersion:v5 anchorDate:v6 intervalComponents:v8];

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  return 0;
}

+ (id)generationNumberForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = HDCachedQueryMetadataEntityPredicateForQueryIdentifierAndSource((uint64_t)a3, a4);
  uint64_t v12 = [v10 database];

  uint64_t v13 = [a1 propertyValueForAnyWithProperty:@"generation_number" predicate:v11 healthDatabase:v12 error:a6];

  return v13;
}

+ (id)creationDateForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__210;
  v27 = __Block_byref_object_dispose__210;
  id v28 = 0;
  uint64_t v13 = [v12 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__HDCachedQueryMetadataEntity_creationDateForQueryIdentifier_sourceEntity_profile_error___block_invoke;
  v18[3] = &unk_1E6306A58;
  id v22 = a1;
  id v14 = v10;
  id v19 = v14;
  id v15 = v11;
  id v20 = v15;
  __int16 v21 = &v23;
  [a1 performReadTransactionWithHealthDatabase:v13 error:a6 block:v18];

  id v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

uint64_t __89__HDCachedQueryMetadataEntity_creationDateForQueryIdentifier_sourceEntity_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  v6 = HDCachedQueryMetadataEntityPredicateForQueryIdentifierAndSource(*(void *)(a1 + 32), *(void **)(a1 + 40));
  id v7 = [*(id *)(a1 + 56) anyInDatabase:v5 predicate:v6 error:a3];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 dateForProperty:@"creation_date" database:v5];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  return 1;
}

+ (id)lastUpdatedDateForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__210;
  v27 = __Block_byref_object_dispose__210;
  id v28 = 0;
  uint64_t v13 = [v12 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__HDCachedQueryMetadataEntity_lastUpdatedDateForQueryIdentifier_sourceEntity_profile_error___block_invoke;
  v18[3] = &unk_1E6306A58;
  id v22 = a1;
  id v14 = v10;
  id v19 = v14;
  id v15 = v11;
  id v20 = v15;
  __int16 v21 = &v23;
  [a1 performReadTransactionWithHealthDatabase:v13 error:a6 block:v18];

  id v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

uint64_t __92__HDCachedQueryMetadataEntity_lastUpdatedDateForQueryIdentifier_sourceEntity_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  v6 = HDCachedQueryMetadataEntityPredicateForQueryIdentifierAndSource(*(void *)(a1 + 32), *(void **)(a1 + 40));
  id v7 = [*(id *)(a1 + 56) anyInDatabase:v5 predicate:v6 error:a3];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 dateForProperty:@"last_updated_date" database:v5];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  return 1;
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v12 = objc_msgSend(v11, "hk_dateBySubtractingDays:fromDate:", *MEMORY[0x1E4F299B8], v10);

  uint64_t v13 = (void *)MEMORY[0x1E4F65D00];
  id v14 = _HDSQLiteValueForDate();
  id v15 = [v13 predicateWithProperty:@"last_updated_date" value:v14 comparisonType:4];

  id v16 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v17 = [v9 daemon];
  id v18 = [v17 behavior];
  id v19 = [v18 currentOSBuild];
  id v20 = [v16 predicateWithProperty:@"build_version" notEqualToValue:v19];

  __int16 v21 = (void *)MEMORY[0x1E4F65D08];
  v38[0] = v15;
  v38[1] = v20;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  uint64_t v23 = [v21 predicateMatchingAnyPredicates:v22];

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  char v24 = [v9 database];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __68__HDCachedQueryMetadataEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v29[3] = &unk_1E62FE6C8;
  id v32 = a1;
  id v25 = v23;
  unint64_t v33 = a5;
  id v30 = v25;
  v31 = &v34;
  LODWORD(v22) = [a1 performWriteTransactionWithHealthDatabase:v24 error:a6 block:v29];

  if (v22)
  {
    v26 = [NSNumber numberWithInt:*((unsigned int *)v35 + 6)];
  }
  else
  {
    v26 = 0;
  }

  _Block_object_dispose(&v34, 8);

  return v26;
}

uint64_t __68__HDCachedQueryMetadataEntity_pruneWithProfile_nowDate_limit_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  v5 = [a2 databaseForEntityClass:a1[6]];
  id v6 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v6 setEntityClass:objc_opt_class()];
  [v6 setPredicate:a1[4]];
  [v6 setLimitCount:a1[7]];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v5 descriptor:v6];
  uint64_t v8 = [v7 deleteAllEntitiesWithError:a3];
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = [v5 getChangesCount];

  return v8;
}

@end