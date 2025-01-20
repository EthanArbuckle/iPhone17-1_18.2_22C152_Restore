@interface HDDataSyncEntity
+ (BOOL)_insertObjectsFromCodableObjectCollection:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsDateBasedSharding;
+ (Class)healthEntityClass;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)_predicateForSyncSession:(id)a3;
+ (id)_pruningPredicateWithDate:(void *)a3 profile:(void *)a4 anchor:;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)objectsFromCodableObjectsInCollection:(id)a3;
+ (id)pruneSyncedObjectsThroughAnchor:(id)a3 limit:(unint64_t)a4 nowDate:(id)a5 profile:(id)a6 error:(id *)a7;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (id)unitTest_pruningPredicateForDate:(id)a3 profile:(id)a4;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
@end

@implementation HDDataSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  if (a3 < 12)
  {
    uint64_t v12 = v5;
    uint64_t v13 = objc_opt_class();
    v6 = (void *)MEMORY[0x1E4F1C978];
    v7 = &v12;
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v14 = v5;
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v6 = (void *)MEMORY[0x1E4F1C978];
    v7 = &v14;
    uint64_t v8 = 3;
  }
  v9 = objc_msgSend(v6, "arrayWithObjects:count:", v7, v8, v12, v13, v14, v15, v16, v17);
  v10 = [v4 setWithArray:v9];

  return v10;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  v4 = [[HDCodableObjectCollection alloc] initWithData:v3];

  return v4;
}

+ (BOOL)_insertObjectsFromCodableObjectCollection:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  return +[HDDataSyncUtilities insertObjectsFromCodableObjectCollection:a3 syncEntityClass:a1 syncStore:a4 profile:a5 error:a6];
}

+ (id)objectsFromCodableObjectsInCollection:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v4 = objc_msgSend((id)objc_msgSend(a1, "healthEntityClass"), "codableObjectsFromObjectCollection:", v14);
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  HKDefaultObjectValidationConfigurationIgnoringAllOptions();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      v11 = v8;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        id v15 = v14;
        id v16 = v5;
        HKWithAutoreleasePool();
        id v8 = v11;

        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v5;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return 0;
}

+ (Class)healthEntityClass
{
  return 0;
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  return 0;
}

+ (BOOL)supportsDateBasedSharding
{
  return 1;
}

+ (id)_predicateForSyncSession:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F65D10];
  uint64_t v5 = [a3 syncPredicate];
  uint64_t v6 = [v5 excludedSyncProvenances];
  uint64_t v7 = [v4 doesNotContainPredicateWithProperty:@"data_provenances.sync_provenance" values:v6];

  id v8 = objc_msgSend((id)objc_msgSend(a1, "healthEntityClass"), "additionalPredicateForEnumeration");
  uint64_t v9 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v7 otherPredicate:v8];

  return v9;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  return 0;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = (void *)[a1 healthEntityClass];
  long long v17 = [a1 _predicateForSyncSession:v15];
  LOBYTE(a7) = objc_msgSend(v16, "generateSyncObjectsForSession:syncEntityClass:predicate:syncAnchorRange:profile:messageHandler:error:", v15, a1, v17, start, end, v14, v13, a7);

  return (char)a7;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = (void *)[a1 healthEntityClass];
  id v13 = [a1 _predicateForSyncSession:v11];
  id v14 = [v10 database];

  int64_t v15 = [v12 nextSyncAnchorWithStartAnchor:a4 predicate:v13 session:v11 healthDatabase:v14 error:a6];
  return v15;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    int64_t v18 = 1;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v22 != v17) {
        objc_enumerationMutation(v14);
      }
      if (!objc_msgSend(a1, "_insertObjectsFromCodableObjectCollection:syncStore:profile:error:", *(void *)(*((void *)&v21 + 1) + 8 * v19), v12, v13, a7, (void)v21))break; {
      if (v16 == ++v19)
      }
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v16) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    int64_t v18 = 0;
  }

  return v18;
}

uint64_t __58__HDDataSyncEntity_objectsFromCodableObjectsInCollection___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 56) _objectWithCodable:*(void *)(a1 + 32) collection:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "_validateWithConfiguration:", *(void *)(a1 + 64), *(void *)(a1 + 72));
    if (v4)
    {
      _HKInitializeLogging();
      uint64_t v5 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v8 = 138412546;
        uint64_t v9 = v6;
        __int16 v10 = 2114;
        id v11 = v4;
        _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Codable object %@ failed validation: %{public}@", (uint8_t *)&v8, 0x16u);
      }
    }
    else
    {
      [*(id *)(a1 + 48) addObject:v3];
    }
  }
  return 1;
}

+ (id)pruneSyncedObjectsThroughAnchor:(id)a3 limit:(unint64_t)a4 nowDate:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = +[HDDataSyncEntity _pruningPredicateWithDate:profile:anchor:]((uint64_t)a1, a5, v12, a3);
  if (v13)
  {
    uint64_t v19 = 0;
    id v14 = [v12 dataManager];
    LOBYTE(v18) = 0;
    int v15 = objc_msgSend(v14, "deleteDataObjectsOfClass:predicate:limit:deletedSampleCount:notifyObservers:generateDeletedObjects:userRequested:recursiveDeleteAuthorizationBlock:error:", objc_msgSend(a1, "healthEntityClass"), v13, a4, &v19, 0, 0, v18, 0, a7);

    uint64_t v16 = 0;
    if (v15)
    {
      uint64_t v16 = [NSNumber numberWithUnsignedInteger:v19];
    }
  }
  else
  {
    uint64_t v16 = &unk_1F17EF108;
  }

  return v16;
}

+ (id)_pruningPredicateWithDate:(void *)a3 profile:(void *)a4 anchor:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = self;
  __int16 v10 = [v9 _basePruningPredicateForDate:v8 profile:v7];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F65D08];
    id v12 = [v9 _predicateForSyncSession:0];
    id v13 = [v11 compoundPredicateWithPredicate:v12 otherPredicate:v10];

    if (v6)
    {
      id v14 = HDDataEntityPredicateForObjectsAfterAnchor((uint64_t)v6);
      int v15 = (void *)MEMORY[0x1E4F65D58];
      uint64_t v16 = [MEMORY[0x1E4F65D08] negatedPredicate:v14];
      uint64_t v17 = [v15 compoundPredicateWithPredicate:v13 otherPredicate:v16];

      id v13 = (void *)v17;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)unitTest_pruningPredicateForDate:(id)a3 profile:(id)a4
{
  return +[HDDataSyncEntity _pruningPredicateWithDate:profile:anchor:]((uint64_t)a1, a3, a4, 0);
}

@end