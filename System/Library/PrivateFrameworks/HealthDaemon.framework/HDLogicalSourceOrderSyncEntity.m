@interface HDLogicalSourceOrderSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)_sourceOrderSyncPredicateForSession:(uint64_t)a1;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int)nanoSyncObjectType;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDLogicalSourceOrderSyncEntity

+ (int)nanoSyncObjectType
{
  return 14;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:14];
}

+ (id)_sourceOrderSyncPredicateForSession:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [v2 syncStore];
  int v4 = [v3 protocolVersion];

  if (v4 > 5)
  {
    v7 = 0;
  }
  else
  {
    v5 = [v2 excludedSyncStores];
    v6 = objc_msgSend(v5, "hk_map:", &__block_literal_global_400_0);

    v7 = [MEMORY[0x1E4F65D10] doesNotContainPredicateWithProperty:@"sources.provenance" values:v6];
  }

  return v7;
}

uint64_t __70__HDLogicalSourceOrderSyncEntity__sourceOrderSyncPredicateForSession___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 syncProvenance];

  return [v2 numberWithLongLong:v3];
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  v70[5] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v16 = [v12 maxEncodedBytesPerCodableChangeForSyncEntityClass:a1];
  uint64_t v17 = v16;
  v69[0] = 0;
  v69[1] = v69;
  if (v16 >= 0) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v16 + 63;
  }
  v69[2] = 0x2020000000;
  v69[3] = -1;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  v36 = [v13 database];
  v35 = v14;
  int64_t v19 = end;
  v70[0] = @"data_type";
  v70[1] = @"user_preferred";
  v70[2] = @"sources.uuid";
  v70[3] = @"modification_date";
  v70[4] = @"sync_identity";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:5];
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = -1;
  v21 = [v13 database];
  uint64_t v22 = v18 >> 6;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __109__HDLogicalSourceOrderSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v42[3] = &unk_1E630CCB8;
  id v34 = v20;
  id v43 = v34;
  id v53 = a1;
  int64_t v54 = start;
  int64_t v55 = v19;
  id v33 = v12;
  id v44 = v33;
  v49 = &v57;
  id v23 = v36;
  id v45 = v23;
  v50 = v69;
  uint64_t v56 = v22;
  v51 = &v65;
  v52 = &v61;
  id v24 = v37;
  id v46 = v24;
  id v25 = v13;
  id v47 = v25;
  id v26 = v15;
  id v48 = v26;
  BOOL v27 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v21 error:a7 block:v42];

  if (v27)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __109__HDLogicalSourceOrderSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3;
    v39[3] = &unk_1E630CCE0;
    id v40 = v26;
    id v29 = v28;
    id v41 = v29;
    objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v39, v33, v34);
    if (v17 <= 63)
    {
      v30 = v58;
    }
    else
    {
      v30 = v58;
      if (v66[3] >= v22) {
        v58[3] = v62[3];
      }
    }
    char v31 = [v35 sendCodableChange:v29 resultAnchor:v30[3] sequence:0 done:1 error:a7];
  }
  else
  {
    char v31 = 0;
  }

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(v69, 8);

  return v31;
}

BOOL __109__HDLogicalSourceOrderSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = +[HDLogicalSourceOrderSyncEntity _sourceOrderSyncPredicateForSession:](*(void *)(a1 + 112), *(void **)(a1 + 40));
  uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __109__HDLogicalSourceOrderSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v17[3] = &unk_1E630CC90;
  uint64_t v10 = *(void *)(a1 + 136);
  long long v22 = *(_OWORD *)(a1 + 88);
  uint64_t v23 = *(void *)(a1 + 104);
  uint64_t v24 = v10;
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 64);
  id v20 = v4;
  id v21 = *(id *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 120);
  uint64_t v11 = *(void *)(a1 + 128);
  id v13 = v4;
  BOOL v14 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDLogicalSourceOrderEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v5, v6, v8, v12, v11, 0, v7, v9, a3, v17);

  return v14;
}

uint64_t __109__HDLogicalSourceOrderSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, void *a8)
{
  uint64_t v13 = HDSQLiteColumnAsInt64();
  BOOL v14 = [NSNumber numberWithLongLong:v13];
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  if (v13 != *(void *)(v15 + 24))
  {
    uint64_t v16 = *(void *)(a1 + 88);
    if (v16 >= 1 && *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) >= v16)
    {
      uint64_t v27 = 1;
      *a7 = 1;
      goto LABEL_13;
    }
  }
  *(void *)(v15 + 24) = v13;
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = a5;
  uint64_t v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
  if (!v17)
  {
    uint64_t v17 = objc_alloc_init(HDCodableObjectTypeSourceOrder);
    [(HDCodableObjectTypeSourceOrder *)v17 setObjectType:v13];
    [(HDCodableObjectTypeSourceOrder *)v17 setUserOrdered:MEMORY[0x1C1879F00](a4, 1)];
    uint64_t v18 = HDSQLiteColumnWithNameAsInt64();
    id v19 = [*(id *)(a1 + 40) syncIdentityManager];
    uint64_t v20 = *(void *)(a1 + 48);
    id v29 = 0;
    id v21 = [v19 identityForEntityID:v18 transaction:v20 error:&v29];
    id v22 = v29;

    if (!v21)
    {
      id v25 = v22;
      if (v25)
      {
        if (a8) {
          *a8 = v25;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v27 = 0;
      goto LABEL_12;
    }
    uint64_t v23 = [v21 identity];
    uint64_t v24 = [v23 codableSyncIdentity];
    [(HDCodableObjectTypeSourceOrder *)v17 setSyncIdentity:v24];

    [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:v14];
  }
  id v25 = [*(id *)(a1 + 56) objectForKeyedSubscript:v14];
  if (!v25)
  {
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    [*(id *)(a1 + 56) setObject:v25 forKeyedSubscript:v14];
  }
  uint64_t v26 = MEMORY[0x1C1879F10](a4, 2);
  if (v26) {
    objc_msgSend(v25, "appendBytes:length:", v26, (int)MEMORY[0x1C1879FA0](a4, 2));
  }
  MEMORY[0x1C1879F40](a4, 3);
  -[HDCodableObjectTypeSourceOrder addModificationDates:](v17, "addModificationDates:");
  uint64_t v27 = 1;
LABEL_12:

LABEL_13:
  return v27;
}

void __109__HDLogicalSourceOrderSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v7 = a3;
  v6 = [v5 objectForKeyedSubscript:a2];
  [v7 setSourceUUIDs:v6];

  [*(id *)(a1 + 40) addObject:v7];
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = +[HDLogicalSourceOrderSyncEntity _sourceOrderSyncPredicateForSession:]((uint64_t)a1, v11);
  uint64_t v13 = [v10 database];

  int64_t v14 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:a4 predicate:v12 session:v11 healthDatabase:v13 error:a6];
  return v14;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[HDCodableObjectTypeSourceOrder alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v9 = a3;
  id v10 = [a6 sourceOrderManager];
  LODWORD(a7) = [v10 createSourceOrdersWithCodables:v9 error:a7];

  return a7 ^ 1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

@end