@interface HDSharingRelationshipSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsSyncStore:(id)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
@end

@implementation HDSharingRelationshipSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:61];
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = -1;
  v16 = [v13 database];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __110__HDSharingRelationshipSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v25 = &unk_1E63004E0;
  id v17 = v12;
  int64_t v30 = start;
  int64_t v31 = end;
  id v26 = v17;
  v29 = &v32;
  id v18 = v13;
  id v27 = v18;
  id v19 = v15;
  id v28 = v19;
  LODWORD(v13) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v16 error:a7 block:&v22];

  if (v13) {
    char v20 = objc_msgSend(v14, "sendCodableChange:resultAnchor:sequence:done:error:", v19, v33[3], 0, 1, a7, v22, v23, v24, v25, v26, v27);
  }
  else {
    char v20 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v20;
}

BOOL __110__HDSharingRelationshipSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v19[0] = @"sync_identity";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = [*(id *)(a1 + 40) database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__HDSharingRelationshipSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v15[3] = &unk_1E63004B8;
  id v16 = v5;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  id v12 = v5;
  BOOL v13 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDSharingRelationshipEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v8, v11, v10, 0, v7, v9, a3, v15);

  return v13;
}

uint64_t __110__HDSharingRelationshipSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v10 = a2;
  uint64_t v11 = *(void *)(a1 + 32);
  id v41 = 0;
  id v12 = [v10 recipientIdentifierInDatabaseTransaction:v11 error:&v41];
  id v13 = v41;
  id v14 = v13;
  if (!v12)
  {
    id v33 = v13;
    id v16 = v33;
    if (v33)
    {
      if (a8)
      {
        id v16 = v33;
        uint64_t v26 = 0;
        *a8 = v16;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v26 = 0;
      }
      id v14 = v16;
    }
    else
    {
      id v14 = 0;
      uint64_t v26 = 1;
    }
LABEL_29:

    goto LABEL_30;
  }
  if ([v12 type] == 1)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    id v40 = v14;
    id v16 = [v10 dateModifiedInDatabaseTransaction:v15 error:&v40];
    id v17 = v40;

    if (v16)
    {
      uint64_t v18 = *(void *)(a1 + 32);
      id v39 = v17;
      id v19 = +[HDSharingAuthorizationsEntity sharingAuthorizationsForRecipientIdentifier:v12 databaseTransaction:v18 error:&v39];
      id v20 = v39;

      if ([v19 count])
      {
        uint64_t v21 = HDSQLiteColumnWithNameAsInt64();
        uint64_t v22 = [*(id *)(a1 + 40) syncIdentityManager];
        uint64_t v23 = *(void *)(a1 + 32);
        id v38 = v20;
        id v24 = [v22 identityForEntityID:v21 transaction:v23 error:&v38];
        id v14 = v38;

        if (v24)
        {
          v25 = objc_alloc_init(HDCodableSharingRelationship);
          uint64_t v26 = 1;
          [(HDCodableSharingRelationship *)v25 setRecipientType:1];
          id v27 = [v12 clinicalAccountIdentifier];
          [(HDCodableSharingRelationship *)v25 setRecipientIdentifier:v27];

          [v16 timeIntervalSinceReferenceDate];
          -[HDCodableSharingRelationship setDateModified:](v25, "setDateModified:");
          id v28 = HDCodableSharingAuthorizationsFromSharingAuthorizations(v19);
          [(HDCodableSharingRelationship *)v25 setSharingAuthorizations:v28];

          v29 = [(HDCodableSharingRelationship *)v25 sharingAuthorizations];
          HDAuthorizationIdentifiersFromCodableSharingAuthorizations(v29);
          int64_t v30 = v37 = v19;
          [(HDCodableSharingRelationship *)v25 setAuthorizationIdentifiers:v30];

          int64_t v31 = [v24 identity];
          uint64_t v32 = [v31 codableSyncIdentity];
          [(HDCodableSharingRelationship *)v25 setSyncIdentity:v32];

          id v19 = v37;
          [*(id *)(a1 + 48) addObject:v25];
        }
        else
        {
          uint64_t v26 = 0;
        }
      }
      else
      {
        id v35 = v20;
        id v24 = v35;
        if (v35)
        {
          if (a8)
          {
            id v24 = v35;
            uint64_t v26 = 0;
            *a8 = v24;
          }
          else
          {
            _HKLogDroppedError();
            uint64_t v26 = 0;
          }
          id v14 = v24;
        }
        else
        {
          id v14 = 0;
          uint64_t v26 = 1;
        }
      }
    }
    else
    {
      id v34 = v17;
      id v19 = v34;
      if (v34)
      {
        if (a8)
        {
          id v19 = v34;
          uint64_t v26 = 0;
          *a8 = v19;
        }
        else
        {
          _HKLogDroppedError();
          uint64_t v26 = 0;
        }
        id v14 = v19;
      }
      else
      {
        id v14 = 0;
        uint64_t v26 = 1;
      }
    }

    goto LABEL_29;
  }
  uint64_t v26 = 1;
LABEL_30:

  return v26;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  v4 = [[HDCodableSharingRelationship alloc] initWithData:v3];

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
  id v13 = [HDInsertOrUpdateSharingRelationshipOperation alloc];
  uint64_t v14 = [v12 syncProvenance];

  uint64_t v15 = [(HDInsertOrUpdateSharingRelationshipOperation *)v13 initWithCodableSharingRelationships:v10 syncProvenance:v14];
  LODWORD(a7) = [(HDJournalableOperation *)v15 performOrJournalWithProfile:v11 error:a7];

  return a7 ^ 1;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return [a3 syncStoreType] == 2;
}

@end