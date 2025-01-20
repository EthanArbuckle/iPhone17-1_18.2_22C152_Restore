@interface HDAuthorizationSyncEntity
+ (BOOL)companionDidChangeForProfile:(id)a3 error:(id *)a4;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsSyncStore:(id)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)createCodableSourceAuthorizationWithSource:(id)a3 syncSession:(id)a4;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int)nanoSyncObjectType;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDAuthorizationSyncEntity

+ (int)nanoSyncObjectType
{
  return 11;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (BOOL)companionDidChangeForProfile:(id)a3 error:(id *)a4
{
  v5 = [a3 database];
  LOBYTE(a4) = +[HDHealthEntity deleteEntitiesWithPredicate:0 healthDatabase:v5 error:a4];

  return (char)a4;
}

+ (id)createCodableSourceAuthorizationWithSource:(id)a3 syncSession:(id)a4
{
  id v4 = a3;
  v5 = objc_alloc_init(HDCodableSourceAuthorization);
  v6 = [v4 uuid];

  [(HDCodableSourceAuthorization *)v5 setSourceUUID:v6];

  return v5;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:12];
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v26 = a6;
  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  self;
  v37 = @"source_id";
  v38 = (__CFString **)@"object_type";
  uint64_t v39 = @"status";
  uint64_t v40 = @"request";
  v41 = @"mode";
  v42 = @"date_modified";
  v43 = @"modification_epoch";
  v44 = @"sync_identity";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:8];
  v16 = [v13 database];
  v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = -1;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __104__HDAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v27[3] = &unk_1E630F378;
  id v17 = v15;
  id v28 = v17;
  id v34 = a1;
  id v18 = v12;
  int64_t v35 = start;
  int64_t v36 = end;
  id v29 = v18;
  v33 = &v37;
  id v19 = v16;
  id v30 = v19;
  id v20 = v14;
  id v31 = v20;
  id v21 = v13;
  id v32 = v21;
  if (+[HDHealthEntity performReadTransactionWithHealthDatabase:v19 error:a7 block:v27])
  {
    if ([v20 count])
    {
      [a1 didGenerateCodableSourceAuthorizationsForSyncSession:v18];
      v22 = [v20 allValues];
      char v23 = [v26 sendCodableChange:v22 resultAnchor:v38[3] sequence:0 done:1 error:a7];
    }
    else
    {
      char v23 = 1;
    }
  }
  else
  {
    char v23 = 0;
  }

  _Block_object_dispose(&v37, 8);
  return v23;
}

BOOL __104__HDAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8) + 24;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104__HDAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v18[3] = &unk_1E630F350;
  uint64_t v9 = *(void *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 80);
  id v20 = v10;
  uint64_t v23 = v11;
  id v21 = *(id *)(a1 + 40);
  id v22 = v4;
  uint64_t v13 = *(void *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 96);
  id v14 = v4;
  BOOL v15 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:syncEntityClass:session:syncAnchorRange:orderingTerms:limit:lastSyncAnchor:healthDatabase:error:block:](HDAuthorizationEntity, "enumerateEntitiesForSyncWithProperties:predicate:syncEntityClass:session:syncAnchorRange:orderingTerms:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v7, v5, v13, v12, 0, 0, v8, v9, a3, v18);

  return v15;
}

BOOL __104__HDAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
  if (v12) {
    goto LABEL_2;
  }
  v25 = +[HDSQLiteEntity entityWithPersistentID:v11];
  uint64_t v26 = [v25 codableSourceWithProfile:*(void *)(a1 + 40) error:a8];
  if (!v26)
  {
    _HKInitializeLogging();
    id v28 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      id v30 = v28;
      int v32 = 138543874;
      id v33 = (id)objc_opt_class();
      __int16 v34 = 2112;
      int64_t v35 = v11;
      __int16 v36 = 2114;
      uint64_t v37 = 0;
      id v31 = v33;
      _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create codable source for source %@: %{public}@", (uint8_t *)&v32, 0x20u);
    }
    goto LABEL_14;
  }
  v27 = (void *)v26;
  uint64_t v12 = [*(id *)(a1 + 64) createCodableSourceAuthorizationWithSource:v26 syncSession:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v11];

  if (!v12)
  {
LABEL_14:
    BOOL v22 = 1;
    goto LABEL_15;
  }
LABEL_2:
  uint64_t v13 = *(void **)(a1 + 56);
  id v14 = *(void **)(a1 + 40);
  id v15 = v12;
  id v16 = v13;
  id v17 = v14;
  self;
  if (a4)
  {
    id v18 = objc_alloc_init(HDCodableAuthorization);
    uint64_t v19 = HDSQLiteColumnWithNameAsInt64();
    id v20 = [v17 syncIdentityManager];
    id v21 = [v20 identityForEntityID:v19 transaction:v16 error:a8];

    BOOL v22 = v21 != 0;
    if (v21)
    {
      [(HDCodableAuthorization *)v18 setObjectType:HDSQLiteColumnWithNameAsInt64()];
      [(HDCodableAuthorization *)v18 setAuthorizationStatus:HDSQLiteColumnWithNameAsInt64()];
      [(HDCodableAuthorization *)v18 setAuthorizationRequest:HDSQLiteColumnWithNameAsInt64()];
      [(HDCodableAuthorization *)v18 setAuthorizationMode:HDSQLiteColumnWithNameAsInt64()];
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableAuthorization setModificationDate:](v18, "setModificationDate:");
      [(HDCodableAuthorization *)v18 setModificationEpoch:HDSQLiteColumnWithNameAsInt64()];
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableAuthorization setModificationDate:](v18, "setModificationDate:");
      uint64_t v23 = [v21 identity];
      v24 = [v23 codableSyncIdentity];
      [(HDCodableAuthorization *)v18 setSyncIdentity:v24];

      [v15 addAuthorizations:v18];
    }
  }
  else
  {
    BOOL v22 = 0;
  }

LABEL_15:
  return v22;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [a5 database];
  int64_t v12 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:a4 predicate:0 syncEntityClass:a1 session:v10 orderingTerms:0 limit:0 healthDatabase:v11 error:a6];

  return v12;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[HDCodableSourceAuthorization alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  return +[HDAuthorizationEntity _insertCodableSourceAuthorizations:overwriteExisting:syncStore:profile:error:]((uint64_t)HDAuthorizationEntity, a3, 1, a5, a6, (uint64_t)a7) ^ 1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (BOOL)supportsSyncStore:(id)a3
{
  unint64_t v3 = [a3 syncStoreType];
  return (v3 < 6) & (0x22u >> v3);
}

@end