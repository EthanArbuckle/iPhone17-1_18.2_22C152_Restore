@interface HDSyncAnchorEntity
+ (BOOL)enumerateSyncAnchorsForStoreID:(int64_t)a3 database:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)getMinimumSyncAnchorsOfType:(int64_t)a3 anchorMap:(id)a4 updatedSince:(id)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)getRequestedVersion:(id *)a3 entityIdentifier:(id)a4 store:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)getSyncAnchorsOfType:(int64_t)a3 anchorMap:(id)a4 store:(id)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)prepareSyncAnchorsForEntityIdentifiers:(id)a3 store:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)resetAllSyncAnchorsOfType:(int64_t)a3 syncProvenances:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)resetNextAnchorsIfNeededForStore:(id)a3 profile:(id)a4 minimumElapsedTime:(double)a5 error:(id *)a6;
+ (BOOL)resetSyncAnchorsOfType:(int64_t)a3 store:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)resetSyncStore:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)setAcknowledgedAnchorsWithMap:(id)a3 store:(id)a4 resetNext:(BOOL)a5 resetInvalid:(BOOL)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)updateLocalVersion:(int)a3 entityIdentifier:(id)a4 store:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)updateReceivedVersion:(int)a3 entityIdentifier:(id)a4 store:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)updateRequestedVersion:(int)a3 entityIdentifier:(id)a4 store:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)updateSyncAnchor:(int64_t)a3 type:(int64_t)a4 entityIdentifier:(id)a5 store:(id)a6 updatePolicy:(int64_t)a7 profile:(id)a8 error:(id *)a9;
+ (BOOL)updateSyncAnchor:(int64_t)a3 type:(int64_t)a4 updateDate:(id)a5 entityIdentifier:(id)a6 store:(id)a7 updatePolicy:(int64_t)a8 profile:(id)a9 error:(id *)a10;
+ (BOOL)updateSyncAnchorsWithMap:(id)a3 type:(int64_t)a4 store:(id)a5 updatePolicy:(int64_t)a6 resetInvalid:(BOOL)a7 profile:(id)a8 error:(id *)a9;
+ (BOOL)updateSyncAnchorsWithMap:(id)a3 type:(int64_t)a4 updateDate:(id)a5 store:(id)a6 updatePolicy:(int64_t)a7 resetInvalid:(BOOL)a8 profile:(id)a9 error:(id *)a10;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_predicateForSyncEntityIdentifier:(void *)a3 syncStore:;
+ (id)_predicateForSyncStore:(uint64_t)a1;
+ (id)databaseTable;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
+ (int64_t)syncAnchorOfType:(int64_t)a3 entityIdentifier:(id)a4 store:(id)a5 profile:(id)a6 error:(id *)a7;
+ (uint64_t)_getAnchorsForProperty:(void *)a3 anchorMap:(void *)a4 store:(void *)a5 profile:(uint64_t)a6 error:;
+ (uint64_t)_setAnchorsWithMap:(void *)a3 updateDate:(void *)a4 store:(uint64_t)a5 updateOptions:(uint64_t)a6 updatePolicy:(char)a7 resetInvalid:(void *)a8 profile:(uint64_t)a9 error:;
+ (uint64_t)_setSyncAnchor:(uint64_t)a3 updateDate:(uint64_t)a4 options:(uint64_t)a5 updatePolicy:(void *)a6 entityIdentifier:(void *)a7 store:(void *)a8 profile:(uint64_t)a9 error:;
+ (uint64_t)_setSyncAnchor:(uint64_t)a3 updateDate:(uint64_t)a4 options:(uint64_t)a5 updatePolicy:(void *)a6 entityIdentifier:(void *)a7 store:(void *)a8 transaction:(uint64_t)a9 error:;
@end

@implementation HDSyncAnchorEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)_predicateForSyncStore:(uint64_t)a1
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F65D00];
    v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "syncProvenance"));
    v5 = [v3 predicateWithProperty:@"store" equalToValue:v4];

    v6 = (void *)MEMORY[0x1E4F65D00];
    v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "syncEpoch"));
    v8 = [v6 predicateWithProperty:@"epoch" equalToValue:v7];

    v9 = (void *)MEMORY[0x1E4F65D08];
    v13[0] = v5;
    v13[1] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v11 = [v9 predicateMatchingAllPredicates:v10];
  }
  else
  {
    v11 = [MEMORY[0x1E4F65D30] falsePredicate];
  }

  return v11;
}

+ (id)databaseTable
{
  return @"sync_anchors";
}

+ (BOOL)prepareSyncAnchorsForEntityIdentifiers:(id)a3 store:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v12 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__HDSyncAnchorEntity_prepareSyncAnchorsForEntityIdentifiers_store_profile_error___block_invoke;
  v18[3] = &unk_1E62F2E18;
  id v19 = v11;
  id v20 = v12;
  id v21 = v10;
  id v22 = a1;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v13 error:a6 block:v18];

  return (char)a6;
}

uint64_t __81__HDSyncAnchorEntity_prepareSyncAnchorsForEntityIdentifiers_store_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = objc_alloc_init(HDSyncAnchorMap);
  if (+[HDSyncAnchorEntity _getAnchorsForProperty:anchorMap:store:profile:error:](*(void *)(a1 + 56), @"received", v6, *(void **)(a1 + 32), *(void **)(a1 + 40), a3))
  {
    id v31 = v5;
    v7 = [v5 databaseForEntityClass:*(void *)(a1 + 56)];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:*(void *)(a1 + 48)];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __81__HDSyncAnchorEntity_prepareSyncAnchorsForEntityIdentifiers_store_profile_error___block_invoke_2;
    v40[3] = &unk_1E63062D8;
    id v30 = v8;
    id v41 = v30;
    id v10 = v9;
    id v42 = v10;
    [(HDSyncAnchorMap *)v6 enumerateAnchorsAndEntityIdentifiersWithBlock:v40];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = +[HDSyncAnchorEntity _predicateForSyncEntityIdentifier:syncStore:](*(void *)(a1 + 56), *(void **)(*((void *)&v36 + 1) + 8 * i), *(void **)(a1 + 32));
          int v17 = [*(id *)(a1 + 56) deleteEntitiesInDatabase:v7 predicate:v16 error:a3];

          if (!v17)
          {
            v26 = v11;
            uint64_t v25 = 0;
            id v18 = v26;
            v27 = v30;
            id v5 = v31;
            goto LABEL_25;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    id v29 = v11;

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      while (2)
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * j);
          v24 = [(HDSyncAnchorMap *)v6 anchorIfPresentForSyncEntityIdentifier:v23];
          if (!v24
            && ![*(id *)(a1 + 56) updateSyncAnchor:0 type:0 entityIdentifier:v23 store:*(void *)(a1 + 32) updatePolicy:1 profile:*(void *)(a1 + 40) error:a3])
          {
            uint64_t v25 = 0;
            goto LABEL_24;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v43 count:16];
        uint64_t v25 = 1;
        if (v20) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v25 = 1;
    }
LABEL_24:
    v27 = v30;
    id v5 = v31;
    v26 = v29;
LABEL_25:
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

+ (uint64_t)_getAnchorsForProperty:(void *)a3 anchorMap:(void *)a4 store:(void *)a5 profile:(uint64_t)a6 error:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = self;
  if (!v12)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:sel__getAnchorsForProperty_anchorMap_store_profile_error_, v14, @"HDSyncAnchorEntity.m", 388, @"Invalid parameter not satisfying: %@", @"store != nil" object file lineNumber description];
  }
  id v15 = [v13 database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__HDSyncAnchorEntity__getAnchorsForProperty_anchorMap_store_profile_error___block_invoke;
  v22[3] = &unk_1E630BD20;
  id v26 = v11;
  v27 = v14;
  id v23 = v12;
  id v24 = v10;
  id v25 = v13;
  id v16 = v11;
  id v17 = v13;
  id v18 = v12;
  uint64_t v19 = [v14 performReadTransactionWithHealthDatabase:v15 error:a6 block:v22];

  return v19;
}

void __81__HDSyncAnchorEntity_prepareSyncAnchorsForEntityIdentifiers_store_profile_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  char v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  if (!a3 && (v5 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

+ (id)_predicateForSyncEntityIdentifier:(void *)a3 syncStore:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  id v7 = v5;
  self;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F65D00];
    id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "entityIdentifier"));
    id v10 = [v8 predicateWithProperty:@"type" equalToValue:v9];

    id v11 = (void *)MEMORY[0x1E4F65D00];
    uint64_t v12 = [v7 schemaIdentifier];
    id v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (__CFString *)v12;
    }
    else {
      uint64_t v14 = @"main";
    }
    id v15 = [v11 predicateWithProperty:@"schema" equalToValue:v14];

    id v16 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v10 otherPredicate:v15];
  }
  else
  {
    id v16 = 0;
  }

  id v17 = +[HDSyncAnchorEntity _predicateForSyncStore:](v6, v4);

  id v18 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v16 otherPredicate:v17];

  return v18;
}

+ (int64_t)syncAnchorOfType:(int64_t)a3 entityIdentifier:(id)a4 store:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  _HDSyncAnchorPropertyForType(a3);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = self;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:sel__syncAnchorForProperty_entityIdentifier_store_profile_error_, v18, @"HDSyncAnchorEntity.m", 1087, @"Invalid parameter not satisfying: %@", @"entityIdentifier != nil" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:sel__syncAnchorForProperty_entityIdentifier_store_profile_error_, v18, @"HDSyncAnchorEntity.m", 1088, @"Invalid parameter not satisfying: %@", @"store != nil" object file lineNumber description];

LABEL_3:
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__186;
  long long v38 = __Block_byref_object_dispose__186;
  id v39 = 0;
  uint64_t v19 = [v17 database];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __82__HDSyncAnchorEntity__syncAnchorForProperty_entityIdentifier_store_profile_error___block_invoke;
  v28[3] = &unk_1E630BEC8;
  long long v33 = v18;
  id v20 = v15;
  id v29 = v20;
  id v21 = v16;
  id v30 = v21;
  long long v32 = &v34;
  id v22 = v14;
  id v31 = v22;
  int v23 = [v18 performReadTransactionWithHealthDatabase:v19 error:a7 block:v28];

  if (v23) {
    int64_t v24 = [(id)v35[5] longLongValue];
  }
  else {
    int64_t v24 = -1;
  }

  _Block_object_dispose(&v34, 8);
  return v24;
}

+ (BOOL)updateSyncAnchor:(int64_t)a3 type:(int64_t)a4 entityIdentifier:(id)a5 store:(id)a6 updatePolicy:(int64_t)a7 profile:(id)a8 error:(id *)a9
{
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  _HDSyncAnchorUpdateOptionsForType(a4);
  LOBYTE(a7) = +[HDSyncAnchorEntity _setSyncAnchor:updateDate:options:updatePolicy:entityIdentifier:store:profile:error:](Current, (uint64_t)a1, a3, v19, a7, v17, v16, v15, (uint64_t)a9);

  return a7;
}

+ (uint64_t)_setSyncAnchor:(uint64_t)a3 updateDate:(uint64_t)a4 options:(uint64_t)a5 updatePolicy:(void *)a6 entityIdentifier:(void *)a7 store:(void *)a8 profile:(uint64_t)a9 error:
{
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = self;
  id v20 = [v18 database];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __106__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_profile_error___block_invoke;
  v25[3] = &unk_1E630BD48;
  v28 = v19;
  uint64_t v29 = a3;
  double v30 = a1;
  uint64_t v31 = a4;
  uint64_t v32 = a5;
  id v26 = v16;
  id v27 = v17;
  id v21 = v17;
  id v22 = v16;
  uint64_t v23 = [v19 performWriteTransactionWithHealthDatabase:v20 error:a9 block:v25];

  return v23;
}

+ (BOOL)updateSyncAnchorsWithMap:(id)a3 type:(int64_t)a4 store:(id)a5 updatePolicy:(int64_t)a6 resetInvalid:(BOOL)a7 profile:(id)a8 error:(id *)a9
{
  id v15 = a8;
  id v16 = a5;
  id v17 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  _HDSyncAnchorUpdateOptionsForType(a4);
  char v20 = +[HDSyncAnchorEntity _setAnchorsWithMap:updateDate:store:updateOptions:updatePolicy:resetInvalid:profile:error:](Current, (uint64_t)a1, v17, v16, v19, a6, a7, v15, (uint64_t)a9);

  return v20;
}

+ (uint64_t)_setAnchorsWithMap:(void *)a3 updateDate:(void *)a4 store:(uint64_t)a5 updateOptions:(uint64_t)a6 updatePolicy:(char)a7 resetInvalid:(void *)a8 profile:(uint64_t)a9 error:
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  uint64_t v19 = self;
  char v20 = [v18 database];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __112__HDSyncAnchorEntity__setAnchorsWithMap_updateDate_store_updateOptions_updatePolicy_resetInvalid_profile_error___block_invoke;
  v25[3] = &unk_1E630BE50;
  id v26 = v17;
  id v27 = v16;
  char v32 = a7;
  v28 = v19;
  double v29 = a1;
  uint64_t v30 = a5;
  uint64_t v31 = a6;
  id v21 = v16;
  id v22 = v17;
  uint64_t v23 = [v19 performWriteTransactionWithHealthDatabase:v20 error:a9 block:v25];

  return v23;
}

+ (BOOL)updateSyncAnchor:(int64_t)a3 type:(int64_t)a4 updateDate:(id)a5 entityIdentifier:(id)a6 store:(id)a7 updatePolicy:(int64_t)a8 profile:(id)a9 error:(id *)a10
{
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  [a5 timeIntervalSinceReferenceDate];
  double v21 = v20;
  _HDSyncAnchorUpdateOptionsForType(a4);
  LOBYTE(a8) = +[HDSyncAnchorEntity _setSyncAnchor:updateDate:options:updatePolicy:entityIdentifier:store:profile:error:](v21, (uint64_t)a1, a3, v22, a8, v19, v18, v17, (uint64_t)a10);

  return a8;
}

+ (BOOL)updateSyncAnchorsWithMap:(id)a3 type:(int64_t)a4 updateDate:(id)a5 store:(id)a6 updatePolicy:(int64_t)a7 resetInvalid:(BOOL)a8 profile:(id)a9 error:(id *)a10
{
  id v17 = a9;
  id v18 = a6;
  id v19 = a3;
  [a5 timeIntervalSinceReferenceDate];
  double v21 = v20;
  _HDSyncAnchorUpdateOptionsForType(a4);
  char v23 = +[HDSyncAnchorEntity _setAnchorsWithMap:updateDate:store:updateOptions:updatePolicy:resetInvalid:profile:error:](v21, (uint64_t)a1, v19, v18, v22, a7, a8, v17, (uint64_t)a10);

  return v23;
}

+ (BOOL)getSyncAnchorsOfType:(int64_t)a3 anchorMap:(id)a4 store:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = _HDSyncAnchorPropertyForType(a3);
  LOBYTE(a7) = +[HDSyncAnchorEntity _getAnchorsForProperty:anchorMap:store:profile:error:]((uint64_t)a1, v15, v14, v13, v12, (uint64_t)a7);

  return (char)a7;
}

+ (BOOL)getMinimumSyncAnchorsOfType:(int64_t)a3 anchorMap:(id)a4 updatedSince:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v14 database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__HDSyncAnchorEntity_getMinimumSyncAnchorsOfType_anchorMap_updatedSince_profile_error___block_invoke;
  v20[3] = &unk_1E62F4188;
  int64_t v24 = a3;
  id v25 = a1;
  id v21 = v13;
  id v22 = v14;
  id v23 = v12;
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  LOBYTE(a7) = [a1 performReadTransactionWithHealthDatabase:v15 error:a7 block:v20];

  return (char)a7;
}

uint64_t __87__HDSyncAnchorEntity_getMinimumSyncAnchorsOfType_anchorMap_updatedSince_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)(a1 + 56);
  id v6 = a2;
  id v7 = _HDSyncAnchorPropertyForType(v5);
  v8 = _HDSyncAnchorUpdateDatePropertyForType(*(void *)(a1 + 56));
  id v9 = NSString;
  id v10 = [*(id *)(a1 + 64) disambiguatedDatabaseTable];
  id v11 = [*(id *)(a1 + 64) disambiguatedDatabaseTable];
  id v12 = [v9 stringWithFormat:@"SELECT %@, %@, MIN(%@) FROM %@ sa1 WHERE EXISTS (SELECT * FROM %@ sa2 WHERE (sa1.%@ = sa2.%@) AND (sa1.%@ = sa2.%@) AND (sa2.%@ >= ?)) GROUP BY %@, %@", @"schema", @"type", v7, v10, v11, @"store", @"store", @"epoch", @"epoch", v8, @"schema", @"type"];

  id v13 = [v6 databaseForEntityClass:*(void *)(a1 + 64)];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__HDSyncAnchorEntity_getMinimumSyncAnchorsOfType_anchorMap_updatedSince_profile_error___block_invoke_2;
  v19[3] = &unk_1E62F43C8;
  id v20 = *(id *)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__HDSyncAnchorEntity_getMinimumSyncAnchorsOfType_anchorMap_updatedSince_profile_error___block_invoke_3;
  v16[3] = &unk_1E62F3D60;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  uint64_t v14 = [v13 executeUncachedSQL:v12 error:a3 bindingHandler:v19 enumerationHandler:v16];

  return v14;
}

uint64_t __87__HDSyncAnchorEntity_getMinimumSyncAnchorsOfType_anchorMap_updatedSince_profile_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];

  return sqlite3_bind_double(a2, 1, v3);
}

uint64_t __87__HDSyncAnchorEntity_getMinimumSyncAnchorsOfType_anchorMap_updatedSince_profile_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double v3 = MEMORY[0x1C1879F80](a2, 0);
  if ([v3 isEqualToString:@"main"])
  {

    double v3 = 0;
  }
  id v4 = +[HDSyncEntityIdentifier identifierWithSchema:v3 entity:HDSQLiteColumnAsInt64()];
  unint64_t v5 = [*(id *)(a1 + 32) syncEngine];
  id v6 = [v5 allSyncEntitiesByIdentifier];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  if (v7) {
    [*(id *)(a1 + 40) setAnchor:HDSQLiteColumnAsInt64() forSyncEntity:v7];
  }

  return 1;
}

+ (BOOL)resetSyncAnchorsOfType:(int64_t)a3 store:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [a5 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__HDSyncAnchorEntity_resetSyncAnchorsOfType_store_profile_error___block_invoke;
  v14[3] = &unk_1E62FE270;
  id v16 = a1;
  int64_t v17 = a3;
  id v15 = v10;
  id v12 = v10;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v11 error:a6 block:v14];

  return (char)a6;
}

BOOL __65__HDSyncAnchorEntity_resetSyncAnchorsOfType_store_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  id v6 = _HDSyncAnchorPropertyForType(*(void *)(a1 + 48));
  v14[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v8 = +[HDSyncAnchorEntity _predicateForSyncStore:](*(void *)(a1 + 40), *(void **)(a1 + 32));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__HDSyncAnchorEntity_resetSyncAnchorsOfType_store_profile_error___block_invoke_2;
  v12[3] = &unk_1E62F35C8;
  id v13 = v6;
  id v9 = v6;
  BOOL v10 = +[HDSQLiteEntity updateProperties:v7 predicate:v8 database:v5 error:a3 bindingHandler:v12];

  return v10;
}

void __65__HDSyncAnchorEntity_resetSyncAnchorsOfType_store_profile_error___block_invoke_2()
{
}

+ (BOOL)resetAllSyncAnchorsOfType:(int64_t)a3 syncProvenances:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = [a5 databaseForEntityClass:a1];
  id v12 = _HDSyncAnchorPropertyForType(a3);
  v19[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v14 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"store" values:v10];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__HDSyncAnchorEntity_resetAllSyncAnchorsOfType_syncProvenances_transaction_error___block_invoke;
  v17[3] = &unk_1E62F35C8;
  id v18 = v12;
  id v15 = v12;
  LOBYTE(a6) = +[HDSQLiteEntity updateProperties:v13 predicate:v14 database:v11 error:a6 bindingHandler:v17];

  return (char)a6;
}

void __82__HDSyncAnchorEntity_resetAllSyncAnchorsOfType_syncProvenances_transaction_error___block_invoke()
{
}

+ (BOOL)setAcknowledgedAnchorsWithMap:(id)a3 store:(id)a4 resetNext:(BOOL)a5 resetInvalid:(BOOL)a6 profile:(id)a7 error:(id *)a8
{
  if (a5) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 2;
  }
  if (a5) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  char v19 = +[HDSyncAnchorEntity _setAnchorsWithMap:updateDate:store:updateOptions:updatePolicy:resetInvalid:profile:error:](Current, (uint64_t)a1, v17, v16, v13, v14, a6, v15, (uint64_t)a8);

  return v19;
}

uint64_t __75__HDSyncAnchorEntity__getAnchorsForProperty_anchorMap_store_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = +[HDSyncAnchorEntity _predicateForSyncStore:](*(void *)(a1 + 64), *(void **)(a1 + 32));
  v14[0] = @"schema";
  v14[1] = @"type";
  void v14[2] = *(void *)(a1 + 40);
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  uint64_t v7 = *(void **)(a1 + 64);
  v8 = [*(id *)(a1 + 48) database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__HDSyncAnchorEntity__getAnchorsForProperty_anchorMap_store_profile_error___block_invoke_2;
  v11[3] = &unk_1E62FE248;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  uint64_t v9 = [v7 enumerateProperties:v6 withPredicate:v5 healthDatabase:v8 error:a3 enumerationHandler:v11];

  return v9;
}

uint64_t __75__HDSyncAnchorEntity__getAnchorsForProperty_anchorMap_store_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = MEMORY[0x1C1879F80](a4, 0);
  if ([v5 isEqualToString:@"main"])
  {

    unint64_t v5 = 0;
  }
  id v6 = +[HDSyncEntityIdentifier identifierWithSchema:v5 entity:HDSQLiteColumnAsInt64()];
  uint64_t v7 = [*(id *)(a1 + 32) syncEngine];
  v8 = [v7 allSyncEntitiesByIdentifier];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  if (v9) {
    [*(id *)(a1 + 40) setAnchor:HDSQLiteColumnAsInt64() forSyncEntity:v9];
  }

  return 1;
}

+ (BOOL)resetSyncStore:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [a4 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__HDSyncAnchorEntity_resetSyncStore_profile_error___block_invoke;
  v12[3] = &unk_1E62F9068;
  id v13 = v8;
  id v14 = a1;
  id v10 = v8;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v9 error:a5 block:v12];

  return (char)a5;
}

uint64_t __51__HDSyncAnchorEntity_resetSyncStore_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  id v6 = +[HDSyncAnchorEntity _predicateForSyncStore:](*(void *)(a1 + 40), *(void **)(a1 + 32));
  uint64_t v7 = [*(id *)(a1 + 40) queryWithDatabase:v5 predicate:v6];
  [v7 deleteAllEntitiesWithError:a3];

  return 1;
}

+ (BOOL)enumerateSyncAnchorsForStoreID:(int64_t)a3 database:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = NSString;
  id v12 = a4;
  id v13 = [a1 disambiguatedDatabaseTable];
  id v14 = [v11 stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? ORDER BY %@ ASC", @"epoch", @"schema", @"type", @"next", @"acked", @"frozen", @"received", @"validated", @"expected", v13, @"store", @"epoch"];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __76__HDSyncAnchorEntity_enumerateSyncAnchorsForStoreID_database_error_handler___block_invoke;
  v19[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  void v19[4] = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__HDSyncAnchorEntity_enumerateSyncAnchorsForStoreID_database_error_handler___block_invoke_2;
  v17[3] = &unk_1E62F33D0;
  id v18 = v10;
  id v15 = v10;
  LOBYTE(a5) = [v12 executeSQL:v14 error:a5 bindingHandler:v19 enumerationHandler:v17];

  return (char)a5;
}

uint64_t __76__HDSyncAnchorEntity_enumerateSyncAnchorsForStoreID_database_error_handler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __76__HDSyncAnchorEntity_enumerateSyncAnchorsForStoreID_database_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v3 = MEMORY[0x1C1879F80](a2, 1);
  if ([v3 isEqualToString:@"main"])
  {

    double v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = HDSQLiteColumnAsInt64();
  uint64_t v6 = HDSQLiteColumnAsInt64();
  uint64_t v7 = HDSQLiteColumnAsInt64();
  uint64_t v8 = HDSQLiteColumnAsInt64();
  uint64_t v9 = HDSQLiteColumnAsInt64();
  uint64_t v10 = HDSQLiteColumnAsInt64();
  uint64_t v11 = HDSQLiteColumnAsInt64();
  uint64_t v12 = HDSQLiteColumnAsInt64();
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, v3, v6, v7, v8, v9, v10, v11, v12);

  return 1;
}

uint64_t __106__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return +[HDSyncAnchorEntity _setSyncAnchor:updateDate:options:updatePolicy:entityIdentifier:store:transaction:error:](*(double *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void **)(a1 + 32), *(void **)(a1 + 40), a2, a3);
}

+ (uint64_t)_setSyncAnchor:(uint64_t)a3 updateDate:(uint64_t)a4 options:(uint64_t)a5 updatePolicy:(void *)a6 entityIdentifier:(void *)a7 store:(void *)a8 transaction:(uint64_t)a9 error:
{
  v95[19] = *MEMORY[0x1E4F143B8];
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  char v19 = self;
  if (a3 < 0)
  {
    long long v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:sel__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error_, v19, @"HDSyncAnchorEntity.m", 511, @"Invalid parameter not satisfying: %@", @"HDSyncAnchorIsValid(anchor)" object file lineNumber description];
  }
  if ((a4 & 0x3F) != 0)
  {
    if (v16) {
      goto LABEL_5;
    }
LABEL_16:
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:sel__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error_, v19, @"HDSyncAnchorEntity.m", 513, @"Invalid parameter not satisfying: %@", @"entityIdentifier != nil" object file lineNumber description];

    if (v17) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
  id v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:sel__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error_, v19, @"HDSyncAnchorEntity.m", 512, @"Invalid parameter not satisfying: %@", @"(options & HDSyncAnchorUpdateOptionsNext) || (options & HDSyncAnchorUpdateOptionsAcked) || (options & HDSyncAnchorUpdateOptionsReceived) || (options & HDSyncAnchorUpdateOptionsFrozen) || (options & HDSyncAnchorUpdateOptionsExpected) || (options & HDSyncAnchorUpdateOptionsValidated)" object file lineNumber description];

  if (!v16) {
    goto LABEL_16;
  }
LABEL_5:
  if (v17) {
    goto LABEL_6;
  }
LABEL_17:
  id v41 = [MEMORY[0x1E4F28B00] currentHandler];
  [v41 handleFailureInMethod:sel__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error_, v19, @"HDSyncAnchorEntity.m", 514, @"Invalid parameter not satisfying: %@", @"store != nil" object file lineNumber description];

LABEL_6:
  v44 = v16;
  uint64_t v20 = [v16 schemaIdentifier];
  id v21 = (void *)v20;
  id v22 = @"main";
  if (v20) {
    id v22 = (__CFString *)v20;
  }
  id v23 = v22;

  [v18 databaseForEntityClass:objc_opt_class()];
  uint64_t v42 = a5;
  uint64_t v43 = a4;
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__186;
  v93 = __Block_byref_object_dispose__186;
  id v94 = 0;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  v88[3] = 0;
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x2020000000;
  v87[3] = 0;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x2020000000;
  v86[3] = 0;
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x2020000000;
  v85[3] = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  v84[3] = 0;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  v83[3] = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x2020000000;
  v82[3] = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  v81[3] = 0;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x2020000000;
  v80[3] = 0;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  int64_t v24 = v79[3] = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  v78[3] = 0;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  v77[3] = 0;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke;
  v76[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v76[4] = v19;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_2;
  v72[3] = &unk_1E62F2DF0;
  id v25 = v23;
  v73 = v25;
  id v26 = v44;
  id v74 = v26;
  id v27 = v17;
  id v75 = v27;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_3;
  v71[3] = &unk_1E630BD70;
  v71[4] = &v89;
  v71[5] = v88;
  v71[6] = v87;
  v71[7] = v86;
  v71[8] = v85;
  v71[9] = v84;
  v71[10] = v83;
  v71[11] = v82;
  v71[12] = v81;
  v71[13] = v80;
  v71[14] = v79;
  v71[15] = v78;
  v71[16] = v77;
  if ([v24 executeCachedStatementForKey:&_setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error__lookupKey error:a9 SQLGenerator:v76 bindingHandler:v72 enumerationHandler:v71])
  {
    v28 = v18;
    if (v90[5])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_6;
      aBlock[3] = &__block_descriptor_48_e8_q16__0q8l;
      aBlock[4] = v42;
      aBlock[5] = a3;
      double v29 = _Block_copy(aBlock);
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_7;
      v61[3] = &unk_1E630BE00;
      v62[1] = v43;
      id v30 = v29;
      v62[0] = v30;
      *(double *)&v62[2] = a1;
      uint64_t v31 = _Block_copy(v61);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_8;
      v60[3] = &__block_descriptor_40_e15___NSString_8__0l;
      v60[4] = v19;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_9;
      v45[3] = &unk_1E630BE28;
      id v32 = v31;
      id v46 = v32;
      v47 = v88;
      v48 = v87;
      v49 = v86;
      v50 = v85;
      v51 = v84;
      v52 = v83;
      v53 = v82;
      v54 = v81;
      v55 = v80;
      v56 = v79;
      v57 = v78;
      v58 = v77;
      v59 = &v89;
      uint64_t v33 = [v24 executeCachedStatementForKey:&_setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error__updateKey error:a9 SQLGenerator:v60 bindingHandler:v45 enumerationHandler:0];

      uint64_t v34 = (id *)v62;
    }
    else
    {
      v95[0] = @"next";
      v95[1] = @"next_updated_date";
      v95[2] = @"acked";
      v95[3] = @"acked_updated_date";
      v95[4] = @"frozen";
      v95[5] = @"frozen_updated_date";
      v95[6] = @"received";
      v95[7] = @"received_updated_date";
      v95[8] = @"expected";
      v95[9] = @"expected_updated_date";
      v95[10] = @"validated";
      v95[11] = @"validated_updated_date";
      v95[12] = @"schema";
      v95[13] = @"type";
      v95[14] = @"store";
      v95[15] = @"epoch";
      v95[16] = @"local_version";
      v95[17] = @"received_version";
      v95[18] = @"requested_version";
      id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:19];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_4;
      v64[3] = &unk_1E630BDB8;
      uint64_t v68 = v43;
      uint64_t v69 = a3;
      double v70 = a1;
      v65 = v25;
      id v66 = v26;
      id v67 = v27;
      uint64_t v35 = [v19 insertOrReplaceEntity:0 database:v24 properties:v30 error:a9 bindingHandler:v64];
      uint64_t v36 = (void *)v90[5];
      v90[5] = v35;

      uint64_t v33 = v90[5] != 0;
      uint64_t v34 = (id *)&v65;
      id v32 = v66;
    }
  }
  else
  {
    uint64_t v33 = 0;
    v28 = v18;
  }

  _Block_object_dispose(v77, 8);
  _Block_object_dispose(v78, 8);
  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v80, 8);
  _Block_object_dispose(v81, 8);
  _Block_object_dispose(v82, 8);
  _Block_object_dispose(v83, 8);
  _Block_object_dispose(v84, 8);
  _Block_object_dispose(v85, 8);
  _Block_object_dispose(v86, 8);
  _Block_object_dispose(v87, 8);
  _Block_object_dispose(v88, 8);
  _Block_object_dispose(&v89, 8);

  return v33;
}

id __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  id v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  objc_msgSend(v1, "stringWithFormat:", @"SELECT ROWID, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?", @"next", @"next_updated_date", @"acked", @"acked_updated_date", @"frozen", @"frozen_updated_date", @"received", @"received_updated_date", @"expected", @"expected_updated_date", @"validated", @"validated_updated_date", v2, @"schema", @"type", @"store",
    @"epoch",
  double v3 = 0);

  return v3;
}

uint64_t __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindStringToStatement();
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 40) entityIdentifier]);
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 48) syncProvenance]);
  sqlite3_int64 v4 = [*(id *)(a1 + 48) syncEpoch];

  return sqlite3_bind_int64(a2, 4, v4);
}

uint64_t __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_3(void *a1, uint64_t a2)
{
  sqlite3_int64 v4 = [(HDSQLiteEntity *)[HDSyncAnchorEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  uint64_t v5 = *(void *)(a1[4] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(void *)(*(void *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(void *)(a1[6] + 8) + 24) = MEMORY[0x1C1879F40](a2, 2);
  *(void *)(*(void *)(a1[7] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(void *)(a1[8] + 8) + 24) = MEMORY[0x1C1879F40](a2, 4);
  *(void *)(*(void *)(a1[9] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(void *)(a1[10] + 8) + 24) = MEMORY[0x1C1879F40](a2, 6);
  *(void *)(*(void *)(a1[11] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(void *)(a1[12] + 8) + 24) = MEMORY[0x1C1879F40](a2, 8);
  *(void *)(*(void *)(a1[13] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(void *)(a1[14] + 8) + 24) = MEMORY[0x1C1879F40](a2, 10);
  *(void *)(*(void *)(a1[15] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(double *)(*(void *)(a1[16] + 8) + 24) = MEMORY[0x1C1879F40](a2, 12);
  return 0;
}

void __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_5;
  v6[3] = &__block_descriptor_64_e8_v16__0q8l;
  uint64_t v4 = *(void *)(a1 + 64);
  v6[4] = *(void *)(a1 + 56);
  v6[5] = a2;
  v6[6] = v4;
  v6[7] = *(void *)(a1 + 72);
  uint64_t v5 = (void (**)(void *, void))_Block_copy(v6);
  v5[2](v5, 0);
  v5[2](v5, 1);
  v5[2](v5, 2);
  v5[2](v5, 3);
  v5[2](v5, 4);
  v5[2](v5, 5);
  MEMORY[0x1C1879EC0](a2, @"schema", *(void *)(a1 + 32));
  MEMORY[0x1C1879E80](a2, @"type", [*(id *)(a1 + 40) entityIdentifier]);
  MEMORY[0x1C1879E80](a2, @"store", [*(id *)(a1 + 48) syncProvenance]);
  MEMORY[0x1C1879E80](a2, @"epoch", [*(id *)(a1 + 48) syncEpoch]);
  MEMORY[0x1C1879E80](a2, @"local_version", 0);
  MEMORY[0x1C1879E80](a2, @"received_version", 0);
  MEMORY[0x1C1879E90](a2, @"requested_version");
}

void __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_5(void *a1, unint64_t a2)
{
  _HDSyncAnchorPropertyForType(a2);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = _HDSyncAnchorUpdateDatePropertyForType(a2);
  uint64_t v5 = a1[4];
  _HDSyncAnchorUpdateOptionsForType(a2);
  uint64_t v7 = v6;
  uint64_t v8 = a1[5];
  if ((v7 & v5) != 0)
  {
    MEMORY[0x1C1879E80](v8, v11, a1[6]);
    uint64_t v9 = a1[5];
    v10.n128_u64[0] = a1[7];
  }
  else
  {
    MEMORY[0x1C1879E80](v8, v11, 0);
    uint64_t v9 = a1[5];
    v10.n128_u64[0] = 0;
  }
  MEMORY[0x1C1879E50](v9, v4, v10);
}

uint64_t __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (v2 == 2) {
      return *(void *)(a1 + 40);
    }
    if (v2 == 1)
    {
      if (*(void *)(a1 + 40) <= a2) {
        return a2;
      }
      else {
        return *(void *)(a1 + 40);
      }
    }
    return a2;
  }
  if (*(void *)(a1 + 40) >= a2) {
    return a2;
  }
  else {
    return *(void *)(a1 + 40);
  }
}

uint64_t __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_7(double *a1, sqlite3_stmt *a2, int a3, unint64_t a4, sqlite3_int64 a5, double a6)
{
  uint64_t v11 = *((void *)a1 + 5);
  _HDSyncAnchorUpdateOptionsForType(a4);
  if ((v12 & v11) != 0)
  {
    sqlite3_int64 v13 = (*(uint64_t (**)(void))(*((void *)a1 + 4) + 16))();
    sqlite3_bind_int64(a2, a3, v13);
    int v14 = a3 + 1;
    double v15 = a1[6];
    id v16 = a2;
  }
  else
  {
    sqlite3_bind_int64(a2, a3, a5);
    int v14 = a3 + 1;
    id v16 = a2;
    double v15 = a6;
  }

  return sqlite3_bind_double(v16, v14, v15);
}

id __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_8(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  double v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ?, %@ = ? WHERE ROWID = ?", v2, @"next", @"next_updated_date", @"acked", @"acked_updated_date", @"frozen", @"frozen_updated_date", @"received", @"received_updated_date", @"expected", @"expected_updated_date", @"validated", @"validated_updated_date", 0];

  return v3;
}

uint64_t __110__HDSyncAnchorEntity__setSyncAnchor_updateDate_options_updatePolicy_entityIdentifier_store_transaction_error___block_invoke_9(void *a1, sqlite3_stmt *a2)
{
  (*(void (**)(double))(a1[4] + 16))(*(double *)(*(void *)(a1[6] + 8) + 24));
  (*(void (**)(double))(a1[4] + 16))(*(double *)(*(void *)(a1[8] + 8) + 24));
  (*(void (**)(double))(a1[4] + 16))(*(double *)(*(void *)(a1[10] + 8) + 24));
  (*(void (**)(double))(a1[4] + 16))(*(double *)(*(void *)(a1[12] + 8) + 24));
  (*(void (**)(double))(a1[4] + 16))(*(double *)(*(void *)(a1[14] + 8) + 24));
  (*(void (**)(double))(a1[4] + 16))(*(double *)(*(void *)(a1[16] + 8) + 24));
  sqlite3_int64 v4 = [*(id *)(*(void *)(a1[17] + 8) + 40) persistentID];

  return sqlite3_bind_int64(a2, 13, v4);
}

uint64_t __112__HDSyncAnchorEntity__setAnchorsWithMap_updateDate_store_updateOptions_updatePolicy_resetInvalid_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "orderedSyncEntities", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v20;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
      uint64_t v12 = [v11 syncEntityIdentifier];
      uint64_t v13 = [*(id *)(a1 + 40) anchorForSyncEntityClass:v11];
      uint64_t v14 = v13;
      if (*(unsigned char *)(a1 + 80))
      {
        uint64_t v14 = v13 & ~(v13 >> 63);
      }
      else if (v13 < 0)
      {

        goto LABEL_10;
      }
      int v15 = +[HDSyncAnchorEntity _setSyncAnchor:updateDate:options:updatePolicy:entityIdentifier:store:transaction:error:](*(double *)(a1 + 56), *(void *)(a1 + 48), v14, *(void *)(a1 + 64), *(void *)(a1 + 72), v12, *(void **)(a1 + 32), v5, a3);

      if (!v15)
      {
        uint64_t v17 = 0;
        goto LABEL_16;
      }
LABEL_10:
      ++v10;
    }
    while (v8 != v10);
    uint64_t v16 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    uint64_t v8 = v16;
  }
  while (v16);
LABEL_14:
  uint64_t v17 = 1;
LABEL_16:

  return v17;
}

+ (BOOL)resetNextAnchorsIfNeededForStore:(id)a3 profile:(id)a4 minimumElapsedTime:(double)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [a4 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __88__HDSyncAnchorEntity_resetNextAnchorsIfNeededForStore_profile_minimumElapsedTime_error___block_invoke;
  v14[3] = &unk_1E62FE270;
  id v15 = v10;
  id v16 = a1;
  double v17 = a5;
  id v12 = v10;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v11 error:a6 block:v14];

  return (char)a6;
}

uint64_t __88__HDSyncAnchorEntity_resetNextAnchorsIfNeededForStore_profile_minimumElapsedTime_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = self;
  if (!v8)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:sel__resetNextAnchorsForStore_updateDate_minimumElapsedTime_transaction_error_, v10, @"HDSyncAnchorEntity.m", 751, @"Invalid parameter not satisfying: %@", @"store != nil" object file lineNumber description];
  }
  uint64_t v11 = [v9 databaseForEntityClass:objc_opt_class()];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__HDSyncAnchorEntity__resetNextAnchorsForStore_updateDate_minimumElapsedTime_transaction_error___block_invoke;
  v20[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v20[4] = v10;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__HDSyncAnchorEntity__resetNextAnchorsForStore_updateDate_minimumElapsedTime_transaction_error___block_invoke_2;
  v16[3] = &unk_1E62F3618;
  CFAbsoluteTime v18 = Current;
  uint64_t v19 = v7;
  id v17 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 executeCachedStatementForKey:&_resetNextAnchorsForStore_updateDate_minimumElapsedTime_transaction_error__updateKey error:a3 SQLGenerator:v20 bindingHandler:v16 enumerationHandler:0];

  return v13;
}

id __96__HDSyncAnchorEntity__resetNextAnchorsForStore_updateDate_minimumElapsedTime_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  double v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = %@ WHERE %@ < %@ AND %@ < ? AND %@ < ? AND %@ = ? AND %@ = ?", v2, @"next", @"acked", @"acked", @"next", @"acked_updated_date", @"next_updated_date", @"store", @"epoch", 0];

  return v3;
}

uint64_t __96__HDSyncAnchorEntity__resetNextAnchorsForStore_updateDate_minimumElapsedTime_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, (uint64_t)(*(double *)(a1 + 40) - *(double *)(a1 + 48)));
  sqlite3_bind_int64(a2, 2, (uint64_t)(*(double *)(a1 + 40) - *(double *)(a1 + 48)));
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 32) syncProvenance]);
  sqlite3_int64 v4 = [*(id *)(a1 + 32) syncEpoch];

  return sqlite3_bind_int64(a2, 4, v4);
}

id __87__HDSyncAnchorEntity__initializeLocalVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  double v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?", v2, @"local_version", @"schema", @"type", @"store", @"epoch"];

  return v3;
}

uint64_t __87__HDSyncAnchorEntity__initializeLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int(a2, 1, *(_DWORD *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 40) entityIdentifier]);
  sqlite3_bind_int64(a2, 4, [*(id *)(a1 + 48) syncProvenance]);
  sqlite3_int64 v4 = [*(id *)(a1 + 48) syncEpoch];

  return sqlite3_bind_int64(a2, 5, v4);
}

id __108__HDSyncAnchorEntity__resetAnchorsToValidateAndUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  double v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ?, %@ = %@, %@ = ?, %@ = %@, %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?", v2, @"local_version", @"received", @"validated", @"received_updated_date", @"expected", @"validated", @"expected_updated_date", @"schema", @"type", @"store", @"epoch", 0];

  return v3;
}

uint64_t __108__HDSyncAnchorEntity__resetAnchorsToValidateAndUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(int *)(a1 + 64));
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 56));
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 5, [*(id *)(a1 + 40) entityIdentifier]);
  sqlite3_bind_int64(a2, 6, [*(id *)(a1 + 48) syncProvenance]);
  sqlite3_int64 v4 = [*(id *)(a1 + 48) syncEpoch];

  return sqlite3_bind_int64(a2, 7, v4);
}

id __92__HDSyncAnchorEntity__primitiveUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  double v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?", v2, @"local_version", @"schema", @"type", @"store", @"epoch", 0];

  return v3;
}

uint64_t __92__HDSyncAnchorEntity__primitiveUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(int *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 40) entityIdentifier]);
  sqlite3_bind_int64(a2, 4, [*(id *)(a1 + 48) syncProvenance]);
  sqlite3_int64 v4 = [*(id *)(a1 + 48) syncEpoch];

  return sqlite3_bind_int64(a2, 5, v4);
}

+ (BOOL)updateLocalVersion:(int)a3 entityIdentifier:(id)a4 store:(id)a5 transaction:(id)a6 error:(id *)a7
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v13)
  {
    v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:a2, a1, @"HDSyncAnchorEntity.m", 905, @"Invalid parameter not satisfying: %@", @"store != nil" object file lineNumber description];
  }
  uint64_t v15 = [v12 schemaIdentifier];
  id v16 = (void *)v15;
  id v17 = @"main";
  if (v15) {
    id v17 = (__CFString *)v15;
  }
  CFAbsoluteTime v18 = v17;

  uint64_t v19 = [v14 databaseForEntityClass:objc_opt_class()];
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  int v86 = -1;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  int v82 = -1;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  uint64_t v78 = 0;
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __82__HDSyncAnchorEntity_updateLocalVersion_entityIdentifier_store_transaction_error___block_invoke;
  v74[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v74[4] = a1;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __82__HDSyncAnchorEntity_updateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2;
  v70[3] = &unk_1E62F2DF0;
  long long v20 = v18;
  v71 = v20;
  id v21 = v12;
  id v72 = v21;
  id v22 = v13;
  id v73 = v22;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __82__HDSyncAnchorEntity_updateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_3;
  v69[3] = &unk_1E62FA4E8;
  v69[4] = &v83;
  v69[5] = &v79;
  v69[6] = &v75;
  if ([v19 executeCachedStatementForKey:&updateLocalVersion_entityIdentifier_store_transaction_error__lookupKey error:a7 SQLGenerator:v74 bindingHandler:v70 enumerationHandler:v69])
  {
    int v23 = *((_DWORD *)v84 + 6);
    if (v23 < 0)
    {
      id v39 = v21;
      id v66 = v22;
      id v40 = v14;
      uint64_t v41 = self;
      uint64_t v42 = [v39 schemaIdentifier];
      uint64_t v43 = (void *)v42;
      v44 = @"main";
      if (v42) {
        v44 = (__CFString *)v42;
      }
      v63 = v44;

      v61 = [v40 databaseForEntityClass:objc_opt_class()];
      int v45 = +[HDSyncAnchorEntity _setSyncAnchor:updateDate:options:updatePolicy:entityIdentifier:store:transaction:error:](0.0, v41, 0, 4, 1, v39, v66, v40, (uint64_t)a7);

      if (v45)
      {
        uint64_t v87 = MEMORY[0x1E4F143A8];
        uint64_t v88 = 3221225472;
        uint64_t v89 = __87__HDSyncAnchorEntity__initializeLocalVersion_entityIdentifier_store_transaction_error___block_invoke;
        v90 = &__block_descriptor_40_e15___NSString_8__0l;
        uint64_t v91 = v41;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __87__HDSyncAnchorEntity__initializeLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2;
        *(void *)&long long v93 = &unk_1E630BE78;
        LODWORD(v96) = a3;
        *((void *)&v93 + 1) = v63;
        id v94 = v39;
        id v95 = v66;
        char v38 = [v61 executeCachedStatementForKey:&_initializeLocalVersion_entityIdentifier_store_transaction_error__setInitialKey error:a7 SQLGenerator:&v87 bindingHandler:buf enumerationHandler:0];
      }
      else
      {
        char v38 = 0;
      }
    }
    else if (v23 >= a3)
    {
      char v38 = 1;
    }
    else if (v23 >= *((_DWORD *)v80 + 6))
    {
      _HKInitializeLogging();
      id v46 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        int v47 = *((_DWORD *)v84 + 6);
        int v48 = *((_DWORD *)v80 + 6);
        *(_DWORD *)buf = 138544130;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v47;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = a3;
        LOWORD(v93) = 1024;
        *(_DWORD *)((char *)&v93 + 2) = v48;
        _os_log_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: Local entity sync version change (%d -> %d); no anchor reset needed (highest received version: %d)",
          buf,
          0x1Eu);
      }
      id v49 = v21;
      id v67 = v22;
      id v50 = v14;
      uint64_t v51 = self;
      uint64_t v52 = [v49 schemaIdentifier];
      v53 = (void *)v52;
      v54 = @"main";
      if (v52) {
        v54 = (__CFString *)v52;
      }
      v64 = v54;

      v55 = [v50 databaseForEntityClass:objc_opt_class()];

      uint64_t v87 = MEMORY[0x1E4F143A8];
      uint64_t v88 = 3221225472;
      uint64_t v89 = __92__HDSyncAnchorEntity__primitiveUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke;
      v90 = &__block_descriptor_40_e15___NSString_8__0l;
      uint64_t v91 = v51;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __92__HDSyncAnchorEntity__primitiveUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2;
      *(void *)&long long v93 = &unk_1E630BE78;
      LODWORD(v96) = a3;
      *((void *)&v93 + 1) = v64;
      id v94 = v49;
      id v95 = v67;
      id v56 = v67;
      id v57 = v49;
      v58 = v64;
      char v38 = [v55 executeCachedStatementForKey:&_primitiveUpdateLocalVersion_entityIdentifier_store_transaction_error__updateKey error:a7 SQLGenerator:&v87 bindingHandler:buf enumerationHandler:0];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v24 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        int v25 = *((_DWORD *)v84 + 6);
        uint64_t v26 = v76[3];
        *(_DWORD *)buf = 138544130;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v25;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = a3;
        LOWORD(v93) = 2048;
        *(void *)((char *)&v93 + 2) = v26;
        _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Local entity sync version change (%d -> %d); resetting received and expected anchors to %lld",
          buf,
          0x22u);
      }
      id v27 = v21;
      id v65 = v22;
      id v28 = v14;
      uint64_t v29 = self;
      uint64_t v30 = [v27 schemaIdentifier];
      uint64_t v31 = (void *)v30;
      id v32 = @"main";
      if (v30) {
        id v32 = (__CFString *)v30;
      }
      v62 = v32;

      uint64_t v33 = [v28 databaseForEntityClass:objc_opt_class()];

      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      uint64_t v87 = MEMORY[0x1E4F143A8];
      uint64_t v88 = 3221225472;
      uint64_t v89 = __108__HDSyncAnchorEntity__resetAnchorsToValidateAndUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke;
      v90 = &__block_descriptor_40_e15___NSString_8__0l;
      uint64_t v91 = v29;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __108__HDSyncAnchorEntity__resetAnchorsToValidateAndUpdateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2;
      *(void *)&long long v93 = &unk_1E630BEA0;
      int v97 = a3;
      CFAbsoluteTime v96 = Current;
      *((void *)&v93 + 1) = v62;
      id v94 = v27;
      id v95 = v65;
      id v35 = v65;
      id v36 = v27;
      long long v37 = v62;
      char v38 = [v33 executeCachedStatementForKey:&_resetAnchorsToValidateAndUpdateLocalVersion_entityIdentifier_store_transaction_error__updateKey error:a7 SQLGenerator:&v87 bindingHandler:buf enumerationHandler:0];
    }
  }
  else
  {
    char v38 = 0;
  }

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);

  return v38;
}

id __82__HDSyncAnchorEntity_updateLocalVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  double v3 = [v1 stringWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?", @"local_version", @"received_version", @"validated", v2, @"schema", @"type", @"store", @"epoch"];

  return v3;
}

uint64_t __82__HDSyncAnchorEntity_updateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 40) entityIdentifier]);
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 48) syncProvenance]);
  sqlite3_int64 v4 = [*(id *)(a1 + 48) syncEpoch];

  return sqlite3_bind_int64(a2, 4, v4);
}

uint64_t __82__HDSyncAnchorEntity_updateLocalVersion_entityIdentifier_store_transaction_error___block_invoke_3(void *a1)
{
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(void *)(*(void *)(a1[6] + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

+ (BOOL)updateReceivedVersion:(int)a3 entityIdentifier:(id)a4 store:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v14)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"HDSyncAnchorEntity.m", 984, @"Invalid parameter not satisfying: %@", @"store != nil" object file lineNumber description];
  }
  uint64_t v16 = [v13 schemaIdentifier];
  id v17 = (void *)v16;
  CFAbsoluteTime v18 = @"main";
  if (v16) {
    CFAbsoluteTime v18 = (__CFString *)v16;
  }
  uint64_t v19 = v18;

  long long v20 = [v15 databaseForEntityClass:objc_opt_class()];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __85__HDSyncAnchorEntity_updateReceivedVersion_entityIdentifier_store_transaction_error___block_invoke;
  v32[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v32[4] = a1;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__HDSyncAnchorEntity_updateReceivedVersion_entityIdentifier_store_transaction_error___block_invoke_2;
  v27[3] = &unk_1E630BE78;
  int v31 = a3;
  id v28 = v19;
  id v29 = v13;
  id v30 = v14;
  id v21 = v14;
  id v22 = v13;
  int v23 = v19;
  char v24 = [v20 executeCachedStatementForKey:&updateReceivedVersion_entityIdentifier_store_transaction_error__updateKey error:a7 SQLGenerator:v32 bindingHandler:v27 enumerationHandler:0];

  return v24;
}

id __85__HDSyncAnchorEntity_updateReceivedVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  double v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ < ? AND %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?", v2, @"received_version", @"received_version", @"schema", @"type", @"store", @"epoch", 0];

  return v3;
}

uint64_t __85__HDSyncAnchorEntity_updateReceivedVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(int *)(a1 + 56));
  sqlite3_bind_int64(a2, 2, *(int *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 4, [*(id *)(a1 + 40) entityIdentifier]);
  sqlite3_bind_int64(a2, 5, [*(id *)(a1 + 48) syncProvenance]);
  sqlite3_int64 v4 = [*(id *)(a1 + 48) syncEpoch];

  return sqlite3_bind_int64(a2, 6, v4);
}

+ (BOOL)getRequestedVersion:(id *)a3 entityIdentifier:(id)a4 store:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v14)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"HDSyncAnchorEntity.m", 1016, @"Invalid parameter not satisfying: %@", @"store != nil" object file lineNumber description];
  }
  uint64_t v16 = [v13 schemaIdentifier];
  id v17 = (void *)v16;
  CFAbsoluteTime v18 = @"main";
  if (v16) {
    CFAbsoluteTime v18 = (__CFString *)v16;
  }
  uint64_t v19 = v18;

  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__186;
  char v38 = __Block_byref_object_dispose__186;
  id v39 = 0;
  long long v20 = [v15 databaseForEntityClass:objc_opt_class()];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __83__HDSyncAnchorEntity_getRequestedVersion_entityIdentifier_store_transaction_error___block_invoke;
  v33[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v33[4] = a1;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __83__HDSyncAnchorEntity_getRequestedVersion_entityIdentifier_store_transaction_error___block_invoke_2;
  v29[3] = &unk_1E62F2DF0;
  id v21 = v19;
  id v30 = v21;
  id v22 = v13;
  id v31 = v22;
  id v23 = v14;
  id v32 = v23;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __83__HDSyncAnchorEntity_getRequestedVersion_entityIdentifier_store_transaction_error___block_invoke_3;
  v28[3] = &unk_1E62F3640;
  void v28[4] = &v34;
  char v24 = [v20 executeCachedStatementForKey:&getRequestedVersion_entityIdentifier_store_transaction_error__lookupKey error:a7 SQLGenerator:v33 bindingHandler:v29 enumerationHandler:v28];
  char v25 = v24 ^ 1;
  if (!a3) {
    char v25 = 1;
  }
  if ((v25 & 1) == 0) {
    *a3 = (id) v35[5];
  }

  _Block_object_dispose(&v34, 8);
  return v24;
}

id __83__HDSyncAnchorEntity_getRequestedVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  double v3 = [v1 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?", @"requested_version", v2, @"schema", @"type", @"store", @"epoch", 0];

  return v3;
}

uint64_t __83__HDSyncAnchorEntity_getRequestedVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 40) entityIdentifier]);
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 48) syncProvenance]);
  sqlite3_int64 v4 = [*(id *)(a1 + 48) syncEpoch];

  return sqlite3_bind_int64(a2, 4, v4);
}

uint64_t __83__HDSyncAnchorEntity_getRequestedVersion_entityIdentifier_store_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

+ (BOOL)updateRequestedVersion:(int)a3 entityIdentifier:(id)a4 store:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v14)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"HDSyncAnchorEntity.m", 1056, @"Invalid parameter not satisfying: %@", @"store != nil" object file lineNumber description];
  }
  uint64_t v16 = [v13 schemaIdentifier];
  id v17 = (void *)v16;
  CFAbsoluteTime v18 = @"main";
  if (v16) {
    CFAbsoluteTime v18 = (__CFString *)v16;
  }
  uint64_t v19 = v18;

  long long v20 = [v15 databaseForEntityClass:objc_opt_class()];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __86__HDSyncAnchorEntity_updateRequestedVersion_entityIdentifier_store_transaction_error___block_invoke;
  v32[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v32[4] = a1;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __86__HDSyncAnchorEntity_updateRequestedVersion_entityIdentifier_store_transaction_error___block_invoke_2;
  v27[3] = &unk_1E630BE78;
  int v31 = a3;
  id v28 = v19;
  id v29 = v13;
  id v30 = v14;
  id v21 = v14;
  id v22 = v13;
  id v23 = v19;
  char v24 = [v20 executeCachedStatementForKey:&updateRequestedVersion_entityIdentifier_store_transaction_error__updateKey error:a7 SQLGenerator:v32 bindingHandler:v27 enumerationHandler:0];

  return v24;
}

id __86__HDSyncAnchorEntity_updateRequestedVersion_entityIdentifier_store_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?", v2, @"requested_version", @"schema", @"type", @"store", @"epoch", 0];

  return v3;
}

uint64_t __86__HDSyncAnchorEntity_updateRequestedVersion_entityIdentifier_store_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(int *)(a1 + 56));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 40) entityIdentifier]);
  sqlite3_bind_int64(a2, 4, [*(id *)(a1 + 48) syncProvenance]);
  sqlite3_int64 v4 = [*(id *)(a1 + 48) syncEpoch];

  return sqlite3_bind_int64(a2, 5, v4);
}

uint64_t __82__HDSyncAnchorEntity__syncAnchorForProperty_entityIdentifier_store_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 64)];
  uint64_t v6 = +[HDSyncAnchorEntity _predicateForSyncEntityIdentifier:syncStore:](*(void *)(a1 + 64), *(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v7 = [*(id *)(a1 + 64) propertyValueForAnyInDatabase:v5 property:*(void *)(a1 + 48) predicate:v6 error:a3];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = &unk_1F17EEF70;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v9);

  return 1;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 20;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_94;
}

+ (id)uniquedColumns
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"store";
  v4[1] = @"epoch";
  v4[2] = @"type";
  v4[3] = @"schema";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];

  return v2;
}

@end