@interface HDSampleAggregateCacheEntity
+ (BOOL)deleteCacheForBucketIndexes:(id)a3 forQueryIdentifier:(id)a4 sourceEntity:(id)a5 generationNumber:(int64_t)a6 persistentAnchorDate:(id)a7 intervalComponents:(id)a8 profile:(id)a9 error:(id *)a10;
+ (BOOL)enumerateCachedDataForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 startIndex:(int64_t)a6 endIndex:(int64_t)a7 error:(id *)a8 enumerationHandler:(id)a9;
+ (BOOL)insertCachedData:(id)a3 forQueryIdentifier:(id)a4 sourceEntity:(id)a5 generationNumber:(int64_t)a6 persistentAnchorDate:(id)a7 intervalComponents:(id)a8 profile:(id)a9 error:(id *)a10;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_owningCachedQueryEntityForQueryIdentifier:(void *)a3 sourceEntity:(void *)a4 database:(uint64_t)a5 error:;
+ (id)_queryMetadataForIdentifier:(uint64_t)a1 sourceEntity:(void *)a2 generationNumber:(void *)a3 persistentAnchorDate:(void *)a4 intervalComponents:(void *)a5 profile:(void *)a6 transaction:(void *)a7 error:(void *)a8;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
+ (id)uniquedColumns;
+ (int64_t)cachesExistForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
@end

@implementation HDSampleAggregateCacheEntity

+ (id)databaseTable
{
  return @"sample_aggregate_caches";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSampleAggregateCacheEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"owning_query_id";
  v4[1] = @"bucket_index";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"owning_query_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)_queryMetadataForIdentifier:(uint64_t)a1 sourceEntity:(void *)a2 generationNumber:(void *)a3 persistentAnchorDate:(void *)a4 intervalComponents:(void *)a5 profile:(void *)a6 transaction:(void *)a7 error:(void *)a8
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  uint64_t v20 = self;
  v21 = [v19 databaseForEntityClass:v20];

  id v42 = 0;
  v22 = +[HDSampleAggregateCacheEntity _owningCachedQueryEntityForQueryIdentifier:sourceEntity:database:error:](v20, v14, v15, v21, (uint64_t)&v42);
  id v23 = v42;
  v24 = v23;
  if (!v22)
  {
    if (v23)
    {
      if (a8)
      {
        v22 = 0;
        *a8 = v23;
      }
      else
      {
        _HKLogDroppedError();
        v22 = 0;
      }
    }
    else
    {
      v36 = a8;
      v26 = [HDCachedQueryMetadata alloc];
      uint64_t v37 = [v15 persistentID];
      v39 = [v18 daemon];
      v27 = [v39 behavior];
      v28 = [v27 currentOSBuild];
      uint64_t v29 = [(HDCachedQueryMetadata *)v26 initWithCachingIdentifier:v14 sourceEntityPersistentID:v37 buildVersion:v28 anchorDate:v16 intervalComponents:v17];

      v30 = (void *)v29;
      id v41 = 0;
      v22 = +[HDCachedQueryMetadataEntity insertCachedQueryMetadata:v29 profile:v18 error:&v41];
      id v31 = v41;
      v32 = v31;
      if (v22)
      {
        id v33 = v22;
      }
      else
      {
        id v34 = v31;
        if (v34)
        {
          v40 = v30;
          if (v36)
          {
            id v38 = v34;
            void *v36 = v34;
            id v34 = v38;
          }
          else
          {
            id v35 = v34;
            _HKLogDroppedError();
            id v34 = v35;
          }
          v30 = v40;
        }
      }
    }
  }

  return v22;
}

+ (id)_owningCachedQueryEntityForQueryIdentifier:(void *)a3 sourceEntity:(void *)a4 database:(uint64_t)a5 error:
{
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  self;
  v11 = HDCachedQueryMetadataEntityPredicateForQueryIdentifierAndSource((uint64_t)v10, v9);

  v12 = +[HDSQLiteEntity anyInDatabase:v8 predicate:v11 error:a5];

  return v12;
}

+ (BOOL)insertCachedData:(id)a3 forQueryIdentifier:(id)a4 sourceEntity:(id)a5 generationNumber:(int64_t)a6 persistentAnchorDate:(id)a7 intervalComponents:(id)a8 profile:(id)a9 error:(id *)a10
{
  v48[4] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"HDSampleAggregateCacheEntity.m", 120, @"Invalid parameter not satisfying: %@", @"queryIdentifier != nil" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  id v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, a1, @"HDSampleAggregateCacheEntity.m", 121, @"Invalid parameter not satisfying: %@", @"sourceEntity != nil" object file lineNumber description];

LABEL_3:
  if (!v21)
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"HDSampleAggregateCacheEntity.m", 122, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];

    if (v19) {
      goto LABEL_5;
    }
LABEL_9:
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"HDSampleAggregateCacheEntity.m", 123, @"Invalid parameter not satisfying: %@", @"persistentAnchorDate != nil" object file lineNumber description];

    goto LABEL_5;
  }
  if (!v19) {
    goto LABEL_9;
  }
LABEL_5:
  v48[0] = @"owning_query_id";
  v48[1] = @"bucket_index";
  v48[2] = @"data";
  v48[3] = @"generation_number";
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
  id v23 = [v21 database];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __152__HDSampleAggregateCacheEntity_insertCachedData_forQueryIdentifier_sourceEntity_generationNumber_persistentAnchorDate_intervalComponents_profile_error___block_invoke;
  v38[3] = &unk_1E6309C38;
  id v39 = v17;
  id v40 = v18;
  id v46 = a1;
  int64_t v47 = a6;
  id v41 = v19;
  id v42 = v20;
  id v43 = v21;
  id v44 = v16;
  id v45 = v22;
  id v24 = v22;
  id v25 = v16;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  id v29 = v18;
  id v30 = v17;
  char v31 = [a1 performWriteTransactionWithHealthDatabase:v23 error:a10 block:v38];

  return v31;
}

uint64_t __152__HDSampleAggregateCacheEntity_insertCachedData_forQueryIdentifier_sourceEntity_generationNumber_persistentAnchorDate_intervalComponents_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v24 = +[HDSampleAggregateCacheEntity _queryMetadataForIdentifier:sourceEntity:generationNumber:persistentAnchorDate:intervalComponents:profile:transaction:error:](*(void *)(a1 + 88), *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), v5, a3);
  if (v24)
  {
    id v23 = [v5 databaseForEntityClass:*(void *)(a1 + 88)];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = *(id *)(a1 + 72);
    uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v32;
      id v21 = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v11 = [v10 bucketIndexForIntervalComponents:*(void *)(a1 + 56) anchorDate:*(void *)(a1 + 48)];
          id v30 = 0;
          int v12 = [v10 getData:&v30 error:a3];
          id v13 = v30;
          if (!v12) {
            goto LABEL_12;
          }
          uint64_t v14 = *(void *)(a1 + 80);
          id v15 = *(void **)(a1 + 88);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __152__HDSampleAggregateCacheEntity_insertCachedData_forQueryIdentifier_sourceEntity_generationNumber_persistentAnchorDate_intervalComponents_profile_error___block_invoke_2;
          v25[3] = &unk_1E62FBA50;
          id v26 = v24;
          uint64_t v16 = *(void *)(a1 + 96);
          uint64_t v28 = v11;
          uint64_t v29 = v16;
          id v17 = v13;
          id v27 = v17;
          id v18 = [v15 insertOrReplaceEntity:1 database:v23 properties:v14 error:a3 bindingHandler:v25];

          if (!v18)
          {
LABEL_12:

            uint64_t v19 = 0;
            id v5 = v21;
            goto LABEL_15;
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        uint64_t v19 = 1;
        id v5 = v21;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v19 = 1;
    }
LABEL_15:
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

void __152__HDSampleAggregateCacheEntity_insertCachedData_forQueryIdentifier_sourceEntity_generationNumber_persistentAnchorDate_intervalComponents_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"owning_query_id", [*(id *)(a1 + 32) persistentID]);
  MEMORY[0x1C1879E80](a2, @"bucket_index", *(void *)(a1 + 48));
  MEMORY[0x1C1879E80](a2, @"generation_number", *(void *)(a1 + 56));

  JUMPOUT(0x1C1879E30);
}

+ (BOOL)deleteCacheForBucketIndexes:(id)a3 forQueryIdentifier:(id)a4 sourceEntity:(id)a5 generationNumber:(int64_t)a6 persistentAnchorDate:(id)a7 intervalComponents:(id)a8 profile:(id)a9 error:(id *)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (!v18)
  {
    long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"HDSampleAggregateCacheEntity.m", 188, @"Invalid parameter not satisfying: %@", @"queryIdentifier != nil" object file lineNumber description];
  }
  if (!v19)
  {
    long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"HDSampleAggregateCacheEntity.m", 189, @"Invalid parameter not satisfying: %@", @"sourceEntity != nil" object file lineNumber description];

    if (v22) {
      goto LABEL_5;
    }
LABEL_7:
    long long v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, a1, @"HDSampleAggregateCacheEntity.m", 190, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];

    goto LABEL_5;
  }
  if (!v22) {
    goto LABEL_7;
  }
LABEL_5:
  id v23 = [v22 database];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __163__HDSampleAggregateCacheEntity_deleteCacheForBucketIndexes_forQueryIdentifier_sourceEntity_generationNumber_persistentAnchorDate_intervalComponents_profile_error___block_invoke;
  v35[3] = &unk_1E62F40C0;
  id v36 = v18;
  id v37 = v19;
  id v42 = a1;
  int64_t v43 = a6;
  id v38 = v20;
  id v39 = v21;
  id v40 = v22;
  id v41 = v17;
  id v24 = v17;
  id v25 = v22;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  id v29 = v18;
  char v30 = [a1 performWriteTransactionWithHealthDatabase:v23 error:a10 block:v35];

  return v30;
}

uint64_t __163__HDSampleAggregateCacheEntity_deleteCacheForBucketIndexes_forQueryIdentifier_sourceEntity_generationNumber_persistentAnchorDate_intervalComponents_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = +[HDSampleAggregateCacheEntity _queryMetadataForIdentifier:sourceEntity:generationNumber:persistentAnchorDate:intervalComponents:profile:transaction:error:](*(void *)(a1 + 80), *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), v5, a3);
  if (v6)
  {
    uint64_t v7 = [v5 databaseForEntityClass:*(void *)(a1 + 80)];
    uint64_t v8 = *(void **)(a1 + 80);
    id v9 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"bucket_index" values:*(void *)(a1 + 72)];
    uint64_t v10 = [v8 deleteEntitiesInDatabase:v7 predicate:v9 error:a3];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (int64_t)cachesExistForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 2;
  id v13 = [v12 database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__HDSampleAggregateCacheEntity_cachesExistForQueryIdentifier_sourceEntity_profile_error___block_invoke;
  v19[3] = &unk_1E62FD8C8;
  id v24 = a1;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  id v23 = &v25;
  LOBYTE(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v13 error:a6 block:v19];

  if (a6) {
    int64_t v17 = v26[3];
  }
  else {
    int64_t v17 = 0;
  }

  _Block_object_dispose(&v25, 8);
  return v17;
}

uint64_t __89__HDSampleAggregateCacheEntity_cachesExistForQueryIdentifier_sourceEntity_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 64)];
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v23 = 0;
  id v9 = +[HDSampleAggregateCacheEntity _owningCachedQueryEntityForQueryIdentifier:sourceEntity:database:error:](v6, v7, v8, v5, (uint64_t)&v23);
  id v10 = v23;
  id v11 = v10;
  if (v9) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (v12)
  {
    if (v9)
    {
      id v13 = (void *)MEMORY[0x1E4F65D00];
      id v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "persistentID"));
      id v15 = [v13 predicateWithProperty:@"owning_query_id" equalToValue:v14];

      id v16 = [*(id *)(a1 + 48) database];
      id v22 = 0;
      int64_t v17 = +[HDHealthEntity anyWithPredicate:v15 healthDatabase:v16 error:&v22];
      id v18 = v22;

      if (v17) {
        BOOL v19 = 1;
      }
      else {
        BOOL v19 = v18 == 0;
      }
      uint64_t v20 = v19;
      if (v19)
      {
        if (v17) {
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
      }
      else if (a3)
      {
        *a3 = v18;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    else
    {
      uint64_t v20 = 1;
    }
  }
  else if (a3)
  {
    uint64_t v20 = 0;
    *a3 = v10;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v20 = 0;
  }

  return v20;
}

+ (BOOL)enumerateCachedDataForQueryIdentifier:(id)a3 sourceEntity:(id)a4 profile:(id)a5 startIndex:(int64_t)a6 endIndex:(int64_t)a7 error:(id *)a8 enumerationHandler:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  if (a6 > a7)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"HDSampleAggregateCacheEntity.m", 275, @"Invalid parameter not satisfying: %@", @"startIndex <= endIndex" object file lineNumber description];
  }
  uint64_t v20 = [v18 database];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __136__HDSampleAggregateCacheEntity_enumerateCachedDataForQueryIdentifier_sourceEntity_profile_startIndex_endIndex_error_enumerationHandler___block_invoke;
  v27[3] = &unk_1E6309C60;
  id v28 = v16;
  id v29 = v17;
  int64_t v32 = a6;
  int64_t v33 = a7;
  id v30 = v19;
  id v31 = a1;
  id v21 = v19;
  id v22 = v17;
  id v23 = v16;
  BOOL v24 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v20 error:a8 block:v27];

  return v24;
}

uint64_t __136__HDSampleAggregateCacheEntity_enumerateCachedDataForQueryIdentifier_sourceEntity_profile_startIndex_endIndex_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v38 = 0;
  id v9 = +[HDSampleAggregateCacheEntity _owningCachedQueryEntityForQueryIdentifier:sourceEntity:database:error:](v6, v7, v8, v5, (uint64_t)&v38);
  id v10 = v38;
  id v11 = v10;
  if (v9) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (v12)
  {
    if (v9)
    {
      uint64_t v13 = [v9 persistentID];
      id v35 = a3;
      uint64_t v14 = *(void *)(a1 + 64);
      uint64_t v32 = *(void *)(a1 + 72);
      id v34 = objc_alloc_init(MEMORY[0x1E4F65D68]);
      [v34 setEntityClass:objc_opt_class()];
      id v15 = (void *)MEMORY[0x1E4F65D00];
      id v31 = [NSNumber numberWithLongLong:v13];
      id v16 = [v15 predicateWithProperty:@"owning_query_id" equalToValue:v31];
      v41[0] = v16;
      id v17 = (void *)MEMORY[0x1E4F65D00];
      id v18 = [NSNumber numberWithInteger:v14];
      id v19 = [v17 predicateWithProperty:@"bucket_index" greaterThanOrEqualToValue:v18];
      v41[1] = v19;
      uint64_t v20 = (void *)MEMORY[0x1E4F65D00];
      id v21 = [NSNumber numberWithInteger:v32];
      id v22 = [v20 predicateWithProperty:@"bucket_index" lessThanValue:v21];
      v41[2] = v22;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
      id v23 = v33 = v5;

      BOOL v24 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v23];
      [v34 setPredicate:v24];

      uint64_t v25 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"bucket_index" entityClass:objc_opt_class() ascending:1];
      id v40 = v25;
      id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
      [v34 setOrderingTerms:v26];

      id v5 = v33;
      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v33 descriptor:v34];
      v39[0] = @"data";
      v39[1] = @"bucket_index";
      v39[2] = @"generation_number";
      id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __136__HDSampleAggregateCacheEntity_enumerateCachedDataForQueryIdentifier_sourceEntity_profile_startIndex_endIndex_error_enumerationHandler___block_invoke_2;
      v36[3] = &unk_1E62F4138;
      id v37 = *(id *)(a1 + 48);
      uint64_t v29 = [v27 enumerateProperties:v28 error:v35 enumerationHandler:v36];
    }
    else
    {
      uint64_t v29 = 1;
    }
  }
  else if (a3)
  {
    uint64_t v29 = 0;
    *a3 = v10;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v29 = 0;
  }

  return v29;
}

uint64_t __136__HDSampleAggregateCacheEntity_enumerateCachedDataForQueryIdentifier_sourceEntity_profile_startIndex_endIndex_error_enumerationHandler___block_invoke_2(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  uint64_t v1 = HKWithAutoreleasePool();

  return v1;
}

uint64_t __136__HDSampleAggregateCacheEntity_enumerateCachedDataForQueryIdentifier_sourceEntity_profile_startIndex_endIndex_error_enumerationHandler___block_invoke_3(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsData();
  HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsInt64();
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v3;
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = NSString;
  BOOL v12 = [a1 disambiguatedDatabaseTable];
  uint64_t v13 = [a1 disambiguatedDatabaseTable];
  uint64_t v14 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  objc_msgSend(v11, "stringWithFormat:", @"DELETE FROM %@                                                               WHERE ROWID IN(                                                                SELECT a.ROWID FROM %@ a                                                                 INNER JOIN %@ b ON (a.%@ = b.ROWID)                                                                     WHERE a.%@ < b.%@ OR a.%@ > b.%@ OR  a.%@ > b.%@                                                              );",
    v12,
    v13,
    v14,
    @"owning_query_id",
    @"bucket_index",
    0x1F1764E20,
    @"bucket_index",
    0x1F1764E40,
    @"generation_number",
    0x1F175ADC0,
  id v15 = 0);

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  id v16 = [v9 database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__HDSampleAggregateCacheEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v19[3] = &unk_1E62F3DB0;
  void v19[4] = v15;
  v19[5] = &v20;
  LODWORD(a6) = [a1 performWriteTransactionWithHealthDatabase:v16 error:a6 block:v19];

  if (a6)
  {
    id v17 = [NSNumber numberWithInt:*((unsigned int *)v21 + 6)];
  }
  else
  {
    id v17 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v17;
}

uint64_t __69__HDSampleAggregateCacheEntity_pruneWithProfile_nowDate_limit_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 protectedDatabase];
  uint64_t v6 = [v5 executeSQL:*(void *)(a1 + 32) error:a3 bindingHandler:0 enumerationHandler:0];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 getChangesCount];

  return v6;
}

@end