@interface HDAssociationSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)_syncPredicateForSession:(uint64_t)a1;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int)nanoSyncObjectType;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDAssociationSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int)nanoSyncObjectType
{
  return 8;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:9];
}

+ (id)_syncPredicateForSession:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = HDAssociationEntityPredicateForAssociationEntityWithType(0);
  v4 = [v2 syncPredicate];
  v5 = [v4 defaultMaximumObjectAge];

  if (v5)
  {
    v6 = [v2 startDate];
    [v5 doubleValue];
    v8 = [v6 dateByAddingTimeInterval:-v7];

    v9 = HDAssociationEntityPredicateForChildEndDate(6, (uint64_t)v8);
    id v10 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v3 otherPredicate:v9];
  }
  else
  {
    id v10 = v3;
  }

  return v10;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v29 = +[HDAssociationSyncEntity _syncPredicateForSession:]((uint64_t)a1, v12);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v16 = [v12 maxEncodedBytesPerCodableChangeForSyncEntityClass:a1];
  if (v16 >= 0) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = v16 + 127;
  }
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v58[3] = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = -1;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__164;
  v52 = __Block_byref_object_dispose__164;
  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18 = [v13 database];
  v19 = a7;
  v20 = v14;
  uint64_t v21 = v17 >> 7;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __102__HDAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v36[3] = &unk_1E6309528;
  id v30 = v29;
  id v37 = v30;
  id v44 = a1;
  id v22 = v12;
  int64_t v45 = start;
  int64_t v46 = end;
  id v38 = v22;
  v42 = &v54;
  id v23 = v13;
  id v39 = v23;
  id v24 = v31;
  id v40 = v24;
  id v25 = v15;
  id v41 = v25;
  v43 = v58;
  uint64_t v47 = v21;
  v26 = v19;
  LOBYTE(v19) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v18 error:v19 block:v36];

  if (v19)
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __102__HDAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3;
    v33[3] = &unk_1E6309550;
    id v34 = v24;
    v35 = &v48;
    [v25 enumerateKeysAndObjectsUsingBlock:v33];
    char v27 = [v20 sendCodableChange:v49[5] resultAnchor:v55[3] sequence:0 done:1 error:v26];
  }
  else
  {
    char v27 = 0;
  }

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(v58, 8);

  return v27;
}

BOOL __102__HDAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8) + 24;
  v9 = [*(id *)(a1 + 48) database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__HDAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v18[3] = &unk_1E6309500;
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 48);
  id v21 = v4;
  id v10 = *(id *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 80);
  id v22 = v10;
  uint64_t v23 = v11;
  uint64_t v24 = *(void *)(a1 + 112);
  uint64_t v13 = *(void *)(a1 + 96);
  uint64_t v12 = *(void *)(a1 + 104);
  id v14 = v4;
  BOOL v15 = +[HDAssociationEntity _enumerateAssociationsWithPredicate:syncEntityClass:session:syncAnchorRange:lastSyncAnchor:healthDatabase:error:block:](HDAssociationEntity, "_enumerateAssociationsWithPredicate:syncEntityClass:session:syncAnchorRange:lastSyncAnchor:healthDatabase:error:block:", v7, v5, v6, v13, v12, v8, v9, a3, v18);

  return v15;
}

uint64_t __102__HDAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
  if (v13) {
    goto LABEL_4;
  }
  id v14 = [*(id *)(a1 + 40) syncIdentityManager];
  uint64_t v15 = *(void *)(a1 + 48);
  id v23 = 0;
  uint64_t v16 = [v14 identityForEntityID:a4 transaction:v15 error:&v23];
  id v17 = v23;

  if (v16)
  {
    [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v11];

LABEL_4:
    id v18 = [*(id *)(a1 + 56) objectForKeyedSubscript:v11];
    if (!v18)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      [*(id *)(a1 + 56) setObject:v18 forKeyedSubscript:v11];
    }
    objc_msgSend(v18, "hk_appendBytesWithUUID:", v12);
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    unint64_t v19 = *(void *)(a1 + 72);
    if (v19)
    {
      unint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      uint64_t v21 = 1;
      if (v20 >= v19) {
        *a5 = 1;
      }
    }
    else
    {
      uint64_t v21 = 1;
    }
    goto LABEL_15;
  }
  id v18 = v17;
  if (v18)
  {
    if (a6) {
      *a6 = v18;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v21 = 0;
LABEL_15:

  return v21;
}

void __102__HDAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v10 = [[HDCodableObjectAssociation alloc] initWithAssociationUUID:v6];
  [(HDCodableObjectAssociation *)v10 setObjectUuids:v5];

  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v8 = [v7 identity];
  v9 = [v8 codableSyncIdentity];
  [(HDCodableObjectAssociation *)v10 setSyncIdentity:v9];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a3;
  id v12 = +[HDAssociationSyncEntity _syncPredicateForSession:]((uint64_t)a1, v11);
  uint64_t v13 = [MEMORY[0x1E4F65D48] isNotNullPredicateWithProperty:@"child_id_objects.uuid"];
  id v14 = [MEMORY[0x1E4F65D48] isNotNullPredicateWithProperty:@"parent_id_objects.uuid"];
  uint64_t v15 = (void *)MEMORY[0x1E4F65D08];
  v22[0] = v13;
  v22[1] = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v17 = [v15 predicateMatchingAllPredicates:v16];

  id v18 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v17 otherPredicate:v12];

  unint64_t v19 = [v10 database];

  int64_t v20 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:a4 predicate:v18 session:v11 healthDatabase:v19 error:a6];
  return v20;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[HDCodableObjectAssociation alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  BOOL v7 = +[HDAssociationEntity _insertCodableObjectAssociations:a3 syncStore:a5 profile:a6 error:a7];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"HDAssociationEntityDidReceiveSyncObjectsNotification" object:0];
  }
  return !v7;
}

@end