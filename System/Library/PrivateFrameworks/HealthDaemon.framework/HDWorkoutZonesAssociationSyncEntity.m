@interface HDWorkoutZonesAssociationSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsSyncStore:(id)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
@end

@implementation HDWorkoutZonesAssociationSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:67];
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  id v12 = a3;
  id v13 = a5;
  id v23 = a6;
  v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = +[HDWorkoutZonesAssociationEntity propertyForSyncIdentity];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = -1;
  v16 = [v13 database];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __114__HDWorkoutZonesAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v24[3] = &unk_1E62FCFA0;
  id v17 = v15;
  id v25 = v17;
  id v18 = v12;
  int64_t v30 = start;
  int64_t v31 = end;
  id v26 = v18;
  v29 = &v32;
  id v19 = v13;
  id v27 = v19;
  id v20 = v14;
  id v28 = v20;
  LODWORD(v13) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v16 error:a7 block:v24];

  if (v13) {
    char v21 = [v23 sendCodableChange:v20 resultAnchor:v33[3] sequence:0 done:1 error:a7];
  }
  else {
    char v21 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v21;
}

BOOL __114__HDWorkoutZonesAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v20[0] = *(void *)(a1 + 32);
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = [*(id *)(a1 + 48) database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __114__HDWorkoutZonesAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v15[3] = &unk_1E62FCF78;
  id v16 = v5;
  id v17 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  id v12 = v5;
  BOOL v13 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDWorkoutZonesAssociationEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v8, v11, v10, 0, v7, v9, a3, v15);

  return v13;
}

BOOL __114__HDWorkoutZonesAssociationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v10 = a2;
  uint64_t v11 = [v10 workoutUUIDWithTransaction:*(void *)(a1 + 32) error:a8];
  if (v11)
  {
    id v12 = [v10 zonesUUIDWithTransaction:*(void *)(a1 + 32) error:a8];
    if (v12)
    {
      uint64_t v13 = HDSQLiteColumnWithNameAsInt64();
      v14 = [*(id *)(a1 + 48) syncIdentityManager];
      v15 = [v14 identityForEntityID:v13 transaction:*(void *)(a1 + 32) error:a8];

      BOOL v16 = v15 != 0;
      if (v15)
      {
        id v17 = objc_alloc_init(HDCodableWorkoutZonesAssociation);
        id v18 = objc_msgSend(v11, "hk_dataForUUIDBytes");
        [(HDCodableWorkoutZonesAssociation *)v17 setWorkoutUUID:v18];

        id v19 = objc_msgSend(v12, "hk_dataForUUIDBytes");
        [(HDCodableWorkoutZonesAssociation *)v17 setZonesSampleUUID:v19];

        id v20 = [v15 identity];
        char v21 = [v20 codableSyncIdentity];
        [(HDCodableWorkoutZonesAssociation *)v17 setSyncIdentity:v21];

        [*(id *)(a1 + 56) addObject:v17];
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  v4 = [[HDCodableWorkoutZonesAssociation alloc] initWithData:v3];

  return v4;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [a5 database];
  int64_t v11 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:a4 predicate:0 session:v9 healthDatabase:v10 error:a6];

  return v11;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  uint64_t v13 = [HDInsertWorkoutZonesAssociationOperation alloc];
  uint64_t v14 = [v12 syncProvenance];

  v15 = [(HDInsertWorkoutZonesAssociationOperation *)v13 initWithCodableWorkoutZoneAssociations:v10 syncProvenance:v14];
  LODWORD(a7) = [(HDJournalableOperation *)v15 performOrJournalWithProfile:v11 error:a7];

  return a7 ^ 1;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return 1;
}

@end