@interface HDSourceSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)excludedSyncStoresForSession:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int)nanoSyncObjectType;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDSourceSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int)nanoSyncObjectType
{
  return 10;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:11];
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  id v13 = a3;
  id v14 = a5;
  id v23 = a6;
  v15 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v16 = [v13 maxEncodedBytesPerCodableChangeForSyncEntityClass:a1];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = -1;
  v17 = [v14 database];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __97__HDSourceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v24[3] = &unk_1E62F9A80;
  id v18 = v14;
  id v25 = v18;
  id v19 = v13;
  int64_t v29 = start;
  int64_t v30 = end;
  id v26 = v19;
  v28 = &v32;
  id v20 = v15;
  id v27 = v20;
  uint64_t v31 = v16 / 256;
  LODWORD(start) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v17 error:a7 block:v24];

  if (start) {
    char v21 = [v23 sendCodableChange:v20 resultAnchor:v33[3] sequence:0 done:1 error:a7];
  }
  else {
    char v21 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v21;
}

BOOL __97__HDSourceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  v5 = +[HDSourceEntity entityEncoderForProfile:*(void *)(a1 + 32) transaction:v4 purpose:0 encodingOptions:0 authorizationFilter:0];
  v6 = [v5 orderedProperties];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = [*(id *)(a1 + 32) database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__HDSourceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v19[3] = &unk_1E62F9A58;
  id v20 = v5;
  id v21 = *(id *)(a1 + 32);
  id v22 = v4;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 80);
  id v23 = v10;
  uint64_t v24 = v11;
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  id v14 = v4;
  id v15 = v5;
  BOOL v16 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDSourceEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v8, v13, v12, 0, v7, v9, a3, v19);

  return v16;
}

BOOL __97__HDSourceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, uint64_t a8)
{
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(a2, "persistentID"), a4, a8);
  if (v11)
  {
    uint64_t v12 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v13 = [*(id *)(a1 + 40) syncIdentityManager];
    id v14 = [v13 identityForEntityID:v12 transaction:*(void *)(a1 + 48) error:a8];

    BOOL v15 = v14 != 0;
    if (v14)
    {
      BOOL v16 = [v14 identity];
      v17 = [v16 codableSyncIdentity];
      [v11 setSyncIdentity:v17];

      [*(id *)(a1 + 56) addObject:v11];
      if (*(uint64_t *)(a1 + 64) >= 1
        && (unint64_t)[*(id *)(a1 + 56) count] >= *(void *)(a1 + 64))
      {
        *a7 = 1;
      }
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [a5 database];
  int64_t v11 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:a4 predicate:0 session:v9 healthDatabase:v10 error:a6];

  return v11;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[HDCodableSource alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  return +[HDSyncSampleOriginUtilities ingestSourceSyncObjects:a3 syncStore:a5 profile:a6 error:a7];
}

+ (id)excludedSyncStoresForSession:(id)a3
{
  id v3 = a3;
  id v4 = [v3 syncStore];
  uint64_t v5 = [v4 syncStoreType];

  if ((unint64_t)(v5 - 3) >= 3 && v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    uint64_t v6 = [v3 excludedSyncStores];
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

@end