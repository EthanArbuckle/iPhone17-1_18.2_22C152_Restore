@interface HDOnboardingCompletionSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDOnboardingCompletionSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:54];
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = -1;
  v16 = [v13 database];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __111__HDOnboardingCompletionSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v25 = &unk_1E62FF240;
  id v17 = v13;
  id v26 = v17;
  id v18 = v12;
  int64_t v30 = start;
  int64_t v31 = end;
  id v27 = v18;
  v29 = &v32;
  id v19 = v15;
  id v28 = v19;
  LODWORD(start) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v16 error:a7 block:&v22];

  if (start) {
    char v20 = objc_msgSend(v14, "sendCodableChange:resultAnchor:sequence:done:error:", v19, v33[3], 0, 1, a7, v22, v23, v24, v25, v26, v27);
  }
  else {
    char v20 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v20;
}

BOOL __111__HDOnboardingCompletionSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  v5 = +[HDOnboardingCompletionEntity entityEncoderForProfile:*(void *)(a1 + 32) transaction:v4 purpose:0 encodingOptions:0 authorizationFilter:0];
  v6 = [v5 orderedProperties];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = [*(id *)(a1 + 32) database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __111__HDOnboardingCompletionSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v17[3] = &unk_1E62FF218;
  id v18 = v5;
  id v19 = *(id *)(a1 + 32);
  id v20 = v4;
  id v21 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  id v12 = v4;
  id v13 = v5;
  BOOL v14 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDOnboardingCompletionEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v8, v11, v10, 0, v7, v9, a3, v17);

  return v14;
}

BOOL __111__HDOnboardingCompletionSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(a2, "persistentID"), a4, a8);
  if (v10)
  {
    uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
    id v12 = [*(id *)(a1 + 40) syncIdentityManager];
    id v13 = [v12 identityForEntityID:v11 transaction:*(void *)(a1 + 48) error:a8];

    BOOL v14 = v13 != 0;
    if (v13)
    {
      id v15 = [v13 identity];
      v16 = [v15 codableSyncIdentity];
      [v10 setSyncIdentity:v16];

      [*(id *)(a1 + 56) addObject:v10];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  uint64_t v10 = [a5 database];
  int64_t v11 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:a4 predicate:0 session:v9 healthDatabase:v10 error:a6];

  return v11;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[HDCodableOnboardingCompletion alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [a6 onboardingCompletionManager];
  uint64_t v13 = [v11 syncProvenance];

  LODWORD(a7) = [v12 insertCodableOnboardingCompletions:v10 syncProvenance:v13 error:a7];
  return a7 ^ 1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

@end