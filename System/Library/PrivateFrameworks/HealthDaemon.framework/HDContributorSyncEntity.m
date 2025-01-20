@interface HDContributorSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)_orderedProperties;
+ (id)_syncCodableContributorFromRow:(HDSQLiteRow *)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)excludedSyncStoresForSession:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDContributorSyncEntity

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:56];
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = [a5 database];
  int64_t v11 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:a4 predicate:0 session:v9 healthDatabase:v10 error:a6];

  return v11;
}

+ (id)_syncCodableContributorFromRow:(HDSQLiteRow *)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  int64_t v11 = objc_alloc_init(HDCodableContributor);
  v12 = MEMORY[0x1C1879F90](a3, 0);
  v13 = objc_msgSend(v12, "hk_dataForUUIDBytes");
  [(HDCodableContributor *)v11 setUuid:v13];

  v14 = MEMORY[0x1C1879F80](a3, 1);
  [(HDCodableContributor *)v11 setAppleID:v14];

  v15 = MEMORY[0x1C1879F80](a3, 2);
  [(HDCodableContributor *)v11 setCallerID:v15];

  [(HDCodableContributor *)v11 setDeleted:MEMORY[0x1C1879F00](a3, 3)];
  MEMORY[0x1C1879F40](a3, 4);
  -[HDCodableContributor setModificationDate:](v11, "setModificationDate:");
  uint64_t v16 = HDSQLiteColumnAsInt64();
  v17 = [v10 syncIdentityManager];

  v18 = [v17 identityForEntityID:v16 transaction:v9 error:a6];

  if (v18)
  {
    v19 = [v18 identity];
    v20 = [v19 codableSyncIdentity];
    [(HDCodableContributor *)v11 setSyncIdentity:v20];

    v21 = v11;
  }
  else
  {
    v21 = 0;
  }

  return v21;
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
  v24[2] = __102__HDContributorSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v24[3] = &unk_1E630B060;
  id v18 = v13;
  int64_t v29 = start;
  int64_t v30 = end;
  id v25 = v18;
  v28 = &v32;
  id v19 = v14;
  id v26 = v19;
  id v20 = v15;
  id v27 = v20;
  uint64_t v31 = v16 / 300;
  LODWORD(v14) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v17 error:a7 block:v24];

  if (v14) {
    char v21 = [v23 sendCodableChange:v20 resultAnchor:v33[3] sequence:0 done:1 error:a7];
  }
  else {
    char v21 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v21;
}

BOOL __102__HDContributorSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[HDContributorSyncEntity _orderedProperties];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__HDContributorSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v17[3] = &unk_1E630B038;
  id v18 = *(id *)(a1 + 40);
  id v19 = v5;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 80);
  id v20 = v10;
  uint64_t v21 = v11;
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  id v14 = v5;
  BOOL v15 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDContributorEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v8, v13, v12, 0, v7, v9, a3, v17);

  return v15;
}

BOOL __102__HDContributorSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, uint64_t a8)
{
  id v10 = +[HDContributorSyncEntity _syncCodableContributorFromRow:a4 profile:*(void *)(a1 + 32) transaction:*(void *)(a1 + 40) error:a8];
  if (v10)
  {
    [*(id *)(a1 + 48) addObject:v10];
    if (*(uint64_t *)(a1 + 56) >= 1 && (unint64_t)[*(id *)(a1 + 48) count] >= *(void *)(a1 + 56)) {
      *a7 = 1;
    }
  }

  return v10 != 0;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)excludedSyncStoresForSession:(id)a3
{
  id v3 = a3;
  v4 = [v3 syncStore];
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

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  v4 = [[HDCodableContributor alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  return +[HDSyncSampleOriginUtilities ingestContributorSyncObjects:a3 syncStore:a5 profile:a6 error:a7];
}

+ (id)_orderedProperties
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"uuid";
  v4[1] = @"apple_id";
  v4[2] = @"caller_id";
  v4[3] = @"deleted";
  v4[4] = @"mod_date";
  v4[5] = @"sync_identity";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];

  return v2;
}

@end