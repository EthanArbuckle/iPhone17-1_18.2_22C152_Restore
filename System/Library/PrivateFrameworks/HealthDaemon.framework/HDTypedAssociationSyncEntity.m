@interface HDTypedAssociationSyncEntity
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

@implementation HDTypedAssociationSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:71];
}

+ (id)_syncPredicateForSession:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = HDAssociationEntityPredicateForAssociationEntityForNotType(0);
  v4 = [v2 syncPredicate];
  v5 = [v4 defaultMaximumObjectAge];

  if (v5)
  {
    v6 = NSNumber;
    v7 = [v2 calendar];
    uint64_t v8 = *MEMORY[0x1E4F2AB08];
    v9 = [v2 startDate];
    v10 = objc_msgSend(v7, "hk_dateBySubtractingDays:fromDate:", v8, v9);
    v11 = [v2 startDate];
    [v10 timeIntervalSinceDate:v11];
    v13 = [v6 numberWithDouble:-v12];

    v14 = [v2 startDate];
    [v13 doubleValue];
    v16 = [v14 dateByAddingTimeInterval:-v15];

    v17 = HDAssociationEntityPredicateForChildEndDate(6, (uint64_t)v16);
    id v18 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v3 otherPredicate:v17];
  }
  else
  {
    id v18 = v3;
  }

  return v18;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  id v11 = a3;
  id v12 = a5;
  id v30 = a6;
  v13 = +[HDTypedAssociationSyncEntity _syncPredicateForSession:]((uint64_t)a1, v11);
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v16 = [v11 maxEncodedBytesPerCodableChangeForSyncEntityClass:a1];
  if (v16 >= 0) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = v16 + 127;
  }
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = -1;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__86;
  v53 = __Block_byref_object_dispose__86;
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v18 = [v12 database];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __107__HDTypedAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v36[3] = &unk_1E62FF808;
  id v19 = v13;
  id v37 = v19;
  id v45 = a1;
  int64_t v46 = start;
  int64_t v47 = end;
  id v29 = v11;
  id v38 = v29;
  v43 = &v55;
  id v20 = v12;
  id v39 = v20;
  id v21 = v14;
  id v40 = v21;
  id v22 = v15;
  id v41 = v22;
  id v23 = v27;
  id v42 = v23;
  v44 = v59;
  uint64_t v48 = v17 >> 7;
  BOOL v24 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v18 error:a7 block:v36];

  if (v24)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __107__HDTypedAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3;
    v32[3] = &unk_1E62FF830;
    id v33 = v22;
    id v34 = v21;
    v35 = &v49;
    [v23 enumerateKeysAndObjectsUsingBlock:v32];
    char v25 = [v30 sendCodableChange:v50[5] resultAnchor:v56[3] sequence:0 done:1 error:a7];
  }
  else
  {
    char v25 = 0;
  }

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(v59, 8);

  return v25;
}

BOOL __107__HDTypedAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8) + 24;
  v9 = [*(id *)(a1 + 48) database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __107__HDTypedAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v18[3] = &unk_1E62FF7E0;
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 48);
  id v21 = v4;
  id v22 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 88);
  id v23 = v10;
  uint64_t v24 = v11;
  uint64_t v25 = *(void *)(a1 + 120);
  uint64_t v13 = *(void *)(a1 + 104);
  uint64_t v12 = *(void *)(a1 + 112);
  id v14 = v4;
  BOOL v15 = +[HDAssociationEntity _enumerateTypedAssociationsWithPredicate:syncEntityClass:session:syncAnchorRange:lastSyncAnchor:healthDatabase:transaction:error:block:](HDAssociationEntity, "_enumerateTypedAssociationsWithPredicate:syncEntityClass:session:syncAnchorRange:lastSyncAnchor:healthDatabase:transaction:error:block:", v7, v5, v6, v13, v12, v8, v9, v14, a3, v18);

  return v15;
}

uint64_t __107__HDTypedAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, unsigned int a6, uint64_t a7, void *a8, unsigned char *a9, void *a10)
{
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  id v20 = [v16 UUIDString];
  if (v18)
  {
    id v21 = [v18 UUIDString];
    uint64_t v22 = [v20 stringByAppendingString:v21];

    id v20 = (void *)v22;
  }
  id v23 = [*(id *)(a1 + 32) objectForKeyedSubscript:v20];
  if (v23) {
    goto LABEL_6;
  }
  id v34 = v17;
  uint64_t v24 = [*(id *)(a1 + 40) syncIdentityManager];
  uint64_t v25 = *(void *)(a1 + 48);
  id v36 = 0;
  v26 = [v24 identityForEntityID:a5 transaction:v25 error:&v36];
  id v27 = v36;

  if (v26)
  {
    [*(id *)(a1 + 32) setObject:v26 forKeyedSubscript:v20];

    id v17 = v34;
LABEL_6:
    v28 = [[HDIntermediateSyncAssociation alloc] initWithAssociationUUID:v16 type:a7 creationDate:v19 deleted:a6 destinationSubObjectUUID:v18];
    [*(id *)(a1 + 56) setObject:v28 forKeyedSubscript:v20];

    id v29 = [*(id *)(a1 + 64) objectForKeyedSubscript:v20];
    if (!v29)
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      [*(id *)(a1 + 64) setObject:v29 forKeyedSubscript:v20];
    }
    objc_msgSend(v29, "hk_appendBytesWithUUID:", v17);
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    unint64_t v30 = *(void *)(a1 + 80);
    if (v30)
    {
      unint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v32 = 1;
      if (v31 >= v30) {
        *a9 = 1;
      }
    }
    else
    {
      uint64_t v32 = 1;
    }
    goto LABEL_17;
  }
  id v29 = v27;
  id v17 = v34;
  if (v29)
  {
    if (a10) {
      *a10 = v29;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v32 = 0;
LABEL_17:

  return v32;
}

void __107__HDTypedAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [HDCodableTypedObjectAssociation alloc];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  uint64_t v12 = [(HDCodableTypedObjectAssociation *)v7 initWithIntermediateSyncAssociation:v8];

  [(HDCodableTypedObjectAssociation *)v12 setObjectUUIDs:v5];
  v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];

  id v10 = [v9 identity];
  uint64_t v11 = [v10 codableSyncIdentity];
  [(HDCodableTypedObjectAssociation *)v12 setSyncIdentity:v11];

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v12];
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = +[HDTypedAssociationSyncEntity _syncPredicateForSession:]((uint64_t)a1, v11);
  uint64_t v13 = [MEMORY[0x1E4F65D48] isNotNullPredicateWithProperty:@"child_id_objects.uuid"];
  id v14 = [MEMORY[0x1E4F65D48] isNotNullPredicateWithProperty:@"parent_id_objects.uuid"];
  BOOL v15 = (void *)MEMORY[0x1E4F65D08];
  v22[0] = v13;
  v22[1] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v17 = [v15 predicateMatchingAllPredicates:v16];

  id v18 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v17 otherPredicate:v12];

  id v19 = [v10 database];

  int64_t v20 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:a4 predicate:v18 session:v11 healthDatabase:v19 error:a6];
  return v20;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[HDCodableTypedObjectAssociation alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [v10 associationManager];
  LODWORD(a7) = [v13 insertCodableTypedObjectAssociations:v12 syncStore:v11 profile:v10 error:a7];

  return a7 ^ 1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int)nanoSyncObjectType
{
  return 50;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

@end