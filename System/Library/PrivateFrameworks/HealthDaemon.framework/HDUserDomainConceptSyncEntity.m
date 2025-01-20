@interface HDUserDomainConceptSyncEntity
+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange;
+ ($2825F4736939C4A6D3AD43837233062D)syncVersionRangeForSession:(id)a3;
+ (BOOL)enumerateCodableObjectsForPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8 handler:(id)a9;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)receiveSyncObjects:(id)a3 version:(id)a4 syncProvenance:(int64_t)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)supportsSpeculativeNanoSyncChanges;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)_predicateForSyncableUserDomainConceptEntitiesForProfile:(void *)a3 syncSession:;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)pruneSyncedObjectsThroughAnchor:(id)a3 limit:(unint64_t)a4 nowDate:(id)a5 profile:(id)a6 error:(id *)a7;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDUserDomainConceptSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:59];
}

+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)0x400000000;
}

+ ($2825F4736939C4A6D3AD43837233062D)syncVersionRangeForSession:(id)a3
{
  return ($2825F4736939C4A6D3AD43837233062D)0x400000000;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  v4 = [[HDCodableUserDomainConcept alloc] initWithData:v3];

  return v4;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  v12 = +[HDUserDomainConceptSyncEntity _predicateForSyncableUserDomainConceptEntitiesForProfile:syncSession:]((uint64_t)a1, v10, v11);
  v13 = [v10 database];

  int64_t v14 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:a4 predicate:v12 session:v11 healthDatabase:v13 error:a6];
  return v14;
}

+ (id)_predicateForSyncableUserDomainConceptEntitiesForProfile:(void *)a3 syncSession:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = [v5 daemon];

  v7 = [v6 userDomainConceptEntityRegistry];
  v8 = [v7 registeredDictionaryOfEntities];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__HDUserDomainConceptSyncEntity__predicateForSyncableUserDomainConceptEntitiesForProfile_syncSession___block_invoke;
  v14[3] = &unk_1E630E048;
  id v15 = v4;
  id v16 = v9;
  id v10 = v9;
  id v11 = v4;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];
  v12 = HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifiers(v10);

  return v12;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  id v13 = a3;
  id v14 = a5;
  id v23 = a6;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = -1;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  uint64_t v16 = [v13 maxEncodedBytesPerCodableChangeForSyncEntityClass:a1];
  v17 = [v14 database];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __108__HDUserDomainConceptSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v24[3] = &unk_1E630DFF8;
  id v18 = v14;
  id v25 = v18;
  id v30 = a1;
  id v19 = v13;
  int64_t v31 = start;
  int64_t v32 = end;
  id v26 = v19;
  v28 = &v35;
  id v20 = v15;
  id v27 = v20;
  v29 = v34;
  uint64_t v33 = v16;
  LOBYTE(v16) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v17 error:a7 block:v24];

  if (v16) {
    char v21 = [v23 sendCodableChange:v20 version:0x400000000 resultAnchor:v36[3] sequence:0 done:1 error:a7];
  }
  else {
    char v21 = 0;
  }

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v35, 8);

  return v21;
}

BOOL __108__HDUserDomainConceptSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = +[HDUserDomainConceptEntity entityEncoderForProfile:*(void *)(a1 + 32) transaction:a2 purpose:0 encodingOptions:0 authorizationFilter:0];
  id v5 = [v4 orderedProperties];
  v6 = +[HDUserDomainConceptSyncEntity _predicateForSyncableUserDomainConceptEntitiesForProfile:syncSession:](*(void *)(a1 + 72), *(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __108__HDUserDomainConceptSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v18[3] = &unk_1E630DFD0;
  id v19 = v4;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  id v20 = v10;
  uint64_t v21 = v11;
  uint64_t v22 = *(void *)(a1 + 96);
  uint64_t v13 = *(void *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 88);
  id v14 = v4;
  BOOL v15 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDUserDomainConceptEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v5, v6, v8, v13, v12, 0, v7, v9, a3, v18);

  return v15;
}

BOOL __108__HDUserDomainConceptSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, uint64_t a8)
{
  id v10 = objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(a2, "persistentID"), a4, a8);
  if (v10)
  {
    [*(id *)(a1 + 40) addObject:v10];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v10 encodedByteCount];
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 56)) {
      *a7 = 1;
    }
  }

  return v10 != 0;
}

+ (BOOL)enumerateCodableObjectsForPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8 handler:(id)a9
{
  id v15 = a9;
  id v16 = a7;
  id v17 = a5;
  id v18 = a3;
  id v19 = +[HDUserDomainConceptEntity entityEncoderForProfile:a6 transaction:v16 purpose:0 encodingOptions:0 authorizationFilter:0];
  id v20 = [v16 protectedDatabase];

  uint64_t v21 = +[HDSQLiteEntity queryWithDatabase:v20 predicate:v18 limit:a4 orderingTerms:v17 groupBy:0];

  uint64_t v22 = [v19 orderedProperties];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __123__HDUserDomainConceptSyncEntity_enumerateCodableObjectsForPredicate_limit_orderingTerms_profile_transaction_error_handler___block_invoke;
  v26[3] = &unk_1E62F8518;
  id v27 = v19;
  id v28 = v15;
  id v23 = v15;
  id v24 = v19;
  LOBYTE(a8) = [v21 enumeratePersistentIDsAndProperties:v22 error:a8 enumerationHandler:v26];

  return (char)a8;
}

uint64_t __123__HDUserDomainConceptSyncEntity_enumerateCodableObjectsForPredicate_limit_orderingTerms_profile_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", a2);
  if (v3) {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (a4.var0 < 5)
  {
    int64_t v19 = objc_msgSend(a1, "receiveSyncObjects:version:syncProvenance:profile:error:", v12, a4, objc_msgSend(v13, "syncProvenance"), v14, a7) ^ 1;
  }
  else
  {
    _HKInitializeLogging();
    id v15 = HKLogHealthOntology();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v12 count];
      id v17 = HDSyncVersionRangeToString(*(void *)&a4);
      id v18 = HDSyncVersionRangeToString(0x400000000uLL);
      int v21 = 138413314;
      id v22 = a1;
      __int16 v23 = 2048;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v17;
      __int16 v29 = 2112;
      id v30 = v18;
      _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%@: Ignoring %lu sync objects from sync store %@ with version %@ because our current version is %@", (uint8_t *)&v21, 0x34u);
    }
    int64_t v19 = 0;
  }

  return v19;
}

+ (BOOL)receiveSyncObjects:(id)a3 version:(id)a4 syncProvenance:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = v11;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__203;
  v42 = __Block_byref_object_dispose__203;
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = [v12 database];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke;
  v34[3] = &unk_1E62F5CB0;
  id v15 = v13;
  id v35 = v15;
  id v16 = v12;
  id v36 = v16;
  uint64_t v37 = &v38;
  +[HDHealthEntity performWriteTransactionWithHealthDatabase:v14 error:a7 block:v34];

  if ([(id)v39[5] count])
  {
    id v17 = [v16 userDomainConceptManager];
    [v17 openObserverTransaction];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke_290;
    aBlock[3] = &unk_1E630E020;
    uint64_t v31 = &v38;
    id v18 = v16;
    id v30 = v18;
    int64_t v32 = a5;
    $2825F4736939C4A6D3AD43837233062D v33 = a4;
    int64_t v19 = _Block_copy(aBlock);
    id v20 = [v18 database];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke_2;
    v27[3] = &unk_1E62FA3D0;
    id v28 = v19;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke_3;
    v25[3] = &unk_1E62F8610;
    id v21 = v28;
    id v26 = v21;
    BOOL v22 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v20 error:a7 block:v27 inaccessibilityHandler:v25];

    __int16 v23 = [v18 userDomainConceptManager];
    [v23 closeObserverTransaction];
  }
  else
  {
    BOOL v22 = 1;
  }

  _Block_object_dispose(&v38, 8);
  return v22;
}

uint64_t __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v21 = a2;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v27;
    do
    {
      uint64_t v6 = 0;
      uint64_t v22 = v4;
      do
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v26 + 1) + 8 * v6);
        uint64_t v8 = [*(id *)(a1 + 40) syncIdentityManager];
        id v9 = [v8 legacySyncIdentity];

        if ([v7 hasSyncIdentity])
        {
          uint64_t v10 = v5;
          id v11 = [v7 syncIdentity];
          id v25 = 0;
          id v12 = +[HDSyncIdentity syncIdentityWithCodable:v11 error:&v25];
          id v13 = v25;

          if (!v12)
          {
            _HKInitializeLogging();
            id v18 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v31 = v13;
              _os_log_fault_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_FAULT, "HDUserDomainConcept SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
            }
            id v12 = 0;
            goto LABEL_20;
          }
          id v14 = [*(id *)(a1 + 40) syncIdentityManager];
          id v24 = v13;
          uint64_t v15 = [v14 concreteIdentityForIdentity:v12 shouldCreate:1 transaction:v21 error:&v24];
          id v16 = v24;

          if (!v15)
          {
            _HKInitializeLogging();
            int64_t v19 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v31 = v16;
              _os_log_fault_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_FAULT, "HDUserDomainConcept ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
            }
            id v9 = 0;
            id v13 = v16;
LABEL_20:
            uint64_t v5 = v10;
            uint64_t v4 = v22;
            goto LABEL_21;
          }

          id v9 = (void *)v15;
          uint64_t v5 = v10;
          uint64_t v4 = v22;
        }
        id v13 = [MEMORY[0x1E4F2B630] createWithCodableConcept:v7 profile:*(void *)(a1 + 40)];
        if (!v13) {
          goto LABEL_22;
        }
        id v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v9];

        if (v17)
        {
          id v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v9];
          [v12 addObject:v13];
        }
        else
        {
          id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v13, 0);
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:v9];
        }
LABEL_21:

LABEL_22:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v4);
  }

  return 1;
}

uint64_t __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke_290(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "userDomainConceptManager", (void)v16);
        id v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v9];
        uint64_t v12 = *(void *)(a1 + 48);
        id v13 = [v9 entity];
        LODWORD(v12) = objc_msgSend(v10, "modifyUserDomainConcepts:method:syncProvenance:syncIdentity:syncVersion:error:", v11, 1, v12, objc_msgSend(v13, "persistentID"), *(void *)(a1 + 56), a2);

        if (!v12)
        {
          uint64_t v14 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_11:

  return v14;
}

uint64_t __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__HDUserDomainConceptSyncEntity_receiveSyncObjects_version_syncProvenance_profile_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (BOOL)supportsSpeculativeNanoSyncChanges
{
  return 1;
}

+ (id)pruneSyncedObjectsThroughAnchor:(id)a3 limit:(unint64_t)a4 nowDate:(id)a5 profile:(id)a6 error:(id *)a7
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v37 = a6;
  id v11 = v9;
  id v12 = v10;
  self;
  uint64_t v38 = v12;
  id v13 = [v12 dateByAddingTimeInterval:-31536000.0];

  uint64_t v14 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"modification_date" lessThanValue:v13];
  uint64_t v15 = (void *)v14;
  if (v11)
  {
    long long v16 = (void *)MEMORY[0x1E4F65D08];
    v49[0] = v14;
    long long v17 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"sync_anchor" lessThanOrEqualToValue:v11];
    v49[1] = v17;
    long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    uint64_t v19 = [v16 predicateMatchingAnyPredicates:v18];

    uint64_t v15 = (void *)v19;
  }
  id v20 = (void *)MEMORY[0x1E4F65D08];
  id v43 = v15;
  self;
  id v21 = [NSString alloc];
  uint64_t v22 = (void *)[v21 initWithFormat:@"%@(%@)", *MEMORY[0x1E4F65CB8], @"sync_anchor"];
  id v23 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v23 setEntityClass:objc_opt_class()];
  id v24 = (void *)MEMORY[0x1E4F65D00];
  v50[0] = v22;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  long long v26 = [v24 predicateWithProperty:@"sync_anchor" comparisonType:2 subqueryDescriptor:v23 subqueryProperties:v25];

  v44 = v26;
  long long v27 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC38]];
  uint64_t v45 = (uint64_t)v27;
  long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:3];
  long long v29 = [v20 predicateMatchingAllPredicates:v28];

  id v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__203;
  v47 = __Block_byref_object_dispose__203;
  id v48 = &unk_1F17EF0D8;
  id v30 = [v37 database];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __93__HDUserDomainConceptSyncEntity_pruneSyncedObjectsThroughAnchor_limit_nowDate_profile_error___block_invoke;
  v39[3] = &unk_1E62F6778;
  id v31 = v29;
  v41 = &v43;
  unint64_t v42 = a4;
  id v40 = v31;
  LODWORD(v28) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v30 error:a7 block:v39];

  if (v28) {
    int64_t v32 = v44[5];
  }
  else {
    int64_t v32 = 0;
  }
  id v33 = v32;

  _Block_object_dispose(&v43, 8);

  return v33;
}

uint64_t __93__HDUserDomainConceptSyncEntity_pruneSyncedObjectsThroughAnchor_limit_nowDate_profile_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 protectedDatabase];
  uint64_t v6 = +[HDSQLiteEntity queryWithDatabase:v5 predicate:a1[4] limit:a1[6] orderingTerms:0 groupBy:0];
  uint64_t v7 = [v6 deleteAllEntitiesWithError:a3];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "getChangesCount"));
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return v7;
}

void __102__HDUserDomainConceptSyncEntity__predicateForSyncableUserDomainConceptEntitiesForProfile_syncSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) syncStore];
  LODWORD(a3) = [a3 supportsSyncStore:v5];

  if (a3) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

@end