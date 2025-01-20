@interface HDKeyValueSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)category;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
@end

@implementation HDKeyValueSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int64_t)category
{
  return -1;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return 0;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  id v12 = a3;
  id v13 = a5;
  id v27 = a6;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v15 = [a1 category];
  v16 = +[HDKeyValueEntity _predicateForCategory:]((uint64_t)HDKeyValueEntity, [a1 category]);
  v17 = +[HDKeyValueEntity _entityClassForKeyValueCategory:v15];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = -1;
  v18 = [v13 database];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __99__HDKeyValueSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v28[3] = &unk_1E630A758;
  v34 = v17;
  id v19 = v13;
  id v29 = v19;
  id v20 = v16;
  id v30 = v20;
  id v21 = v12;
  int64_t v35 = start;
  int64_t v36 = end;
  id v31 = v21;
  v33 = &v38;
  id v22 = v14;
  id v32 = v22;
  uint64_t v37 = v15;
  LODWORD(start) = [(objc_class *)v17 performReadTransactionWithHealthDatabase:v18 error:a7 block:v28];

  if (start)
  {
    v23 = [v22 allValues];
    char v24 = [v27 sendCodableChange:v23 resultAnchor:v39[3] sequence:0 done:1 error:a7];
  }
  else
  {
    char v24 = 0;
  }

  _Block_object_dispose(&v38, 8);
  return v24;
}

uint64_t __99__HDKeyValueSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = [*(id *)(a1 + 72) entityEncoderForProfile:*(void *)(a1 + 32) transaction:v4 purpose:0 encodingOptions:0 authorizationFilter:0];
  v6 = [v5 orderedProperties];
  v29[0] = @"domain";
  v29[1] = @"sync_identity";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  id v21 = [v6 arrayByAddingObjectsFromArray:v7];

  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v10 = *(void **)(a1 + 72);
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8) + 24;
  id v12 = [*(id *)(a1 + 32) database];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99__HDKeyValueSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v23[3] = &unk_1E630A730;
  id v24 = v5;
  id v13 = *(id *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 96);
  id v25 = v13;
  uint64_t v28 = v14;
  id v26 = *(id *)(a1 + 32);
  id v27 = v4;
  uint64_t v16 = *(void *)(a1 + 80);
  uint64_t v15 = *(void *)(a1 + 88);
  id v17 = v4;
  id v18 = v5;
  uint64_t v19 = objc_msgSend(v10, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v21, v9, v8, v16, v15, 0, v11, v12, a3, v23);

  return v19;
}

BOOL __99__HDKeyValueSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v10 = objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(a2, "persistentID"), a4, a8);
  uint64_t v11 = HDSQLiteColumnWithNameAsString();
  if ([v11 isEqualToString:&stru_1F1728D60])
  {
  }
  else if (v11)
  {
    id v12 = v11;
    id v13 = v12;
    goto LABEL_6;
  }
  id v12 = [MEMORY[0x1E4F1CA98] null];
  id v13 = 0;
LABEL_6:
  uint64_t v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];
  if (!v14)
  {
    uint64_t v14 = [[HDCodableCategoryDomainDictionary alloc] initWithCategory:*(void *)(a1 + 64) domain:v13];
    [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v12];
  }
  uint64_t v15 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v16 = [*(id *)(a1 + 48) syncIdentityManager];
  id v17 = [v16 identityForEntityID:v15 transaction:*(void *)(a1 + 56) error:a8];

  if (v17)
  {
    [(HDCodableCategoryDomainDictionary *)v14 addKeyValuePairs:v10];
    id v18 = [v17 identity];
    uint64_t v19 = [v18 codableSyncIdentity];
    [(HDCodableCategoryDomainDictionary *)v14 setSyncIdentity:v19];
  }
  return v17 != 0;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [a1 category];
  id v13 = +[HDKeyValueEntity _entityClassForKeyValueCategory:v12];
  uint64_t v14 = +[HDKeyValueEntity _predicateForCategory:]((uint64_t)HDKeyValueEntity, v12);
  uint64_t v15 = [v10 database];

  int64_t v16 = [(objc_class *)v13 nextSyncAnchorWithStartAnchor:a4 predicate:v14 session:v11 healthDatabase:v15 error:a6];
  return v16;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[HDCodableCategoryDomainDictionary alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v50 = [a1 category];
  v45 = +[HDKeyValueEntity _entityClassForKeyValueCategory:](HDKeyValueEntity, "_entityClassForKeyValueCategory:");
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v15 = v10;
  uint64_t v53 = [v15 countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (!v53)
  {

    goto LABEL_36;
  }
  uint64_t v52 = *(void *)v59;
  char v51 = 1;
  id v48 = v15;
  id v49 = a1;
  id v47 = v14;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v59 != v52) {
        objc_enumerationMutation(v15);
      }
      id v17 = *(void **)(*((void *)&v58 + 1) + 8 * v16);
      if (([v17 hasCategory] & 1) == 0)
      {
        _HKInitializeLogging();
        id v18 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "ignoring synced dictionary with missing category", buf, 2u);
        }
        uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
        id v20 = @"Missing Category";
        goto LABEL_16;
      }
      if ([v17 category] != v50)
      {
        _HKInitializeLogging();
        id v21 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = v21;
          uint64_t v38 = [v17 category];
          *(_DWORD *)buf = 134217984;
          uint64_t v64 = v38;
          _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "ignoring synced dictionary with incorrect category %ld", buf, 0xCu);
        }
        id v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v44 = [v17 category];
        uint64_t v19 = v22;
        id v20 = @"Incorrect Category %ld";
LABEL_16:
        v23 = objc_msgSend(v19, "hk_error:format:", 100, v20, v44);
        id v24 = [v12 daemon];
        id v25 = [v24 autoBugCaptureReporter];
        [v25 reportApplyDataFailure:objc_opt_class() duringSyncFromStore:v11 error:v23];

        goto LABEL_17;
      }
      if (v51) {
        char v51 = -[objc_class _insertCodableCategoryDomainDictionary:provenance:profile:error:](v45, "_insertCodableCategoryDomainDictionary:provenance:profile:error:", v17, [v11 syncProvenance], v12, a7);
      }
      else {
        char v51 = 0;
      }
      id v26 = [v17 domain];

      if (v26)
      {
        id v27 = [v17 domain];
        [v14 addObject:v27];
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v23 = [v17 keyValuePairs];
      uint64_t v28 = [v23 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        id v30 = v12;
        id v31 = v11;
        uint64_t v32 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v55 != v32) {
              objc_enumerationMutation(v23);
            }
            v34 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            int64_t v35 = [v34 key];

            if (v35)
            {
              int64_t v36 = [v34 key];
              [v13 addObject:v36];
            }
          }
          uint64_t v29 = [v23 countByEnumeratingWithState:&v54 objects:v62 count:16];
        }
        while (v29);
        id v11 = v31;
        id v12 = v30;
        id v15 = v48;
        a1 = v49;
        id v14 = v47;
      }
LABEL_17:

      ++v16;
    }
    while (v16 != v53);
    uint64_t v39 = [v15 countByEnumeratingWithState:&v58 objects:v65 count:16];
    uint64_t v53 = v39;
  }
  while (v39);

  if (v51)
  {
LABEL_36:
    uint64_t v41 = [v14 allObjects];
    [a1 didReceiveValuesForDomainNames:v41 profile:v12];

    v42 = [v13 allObjects];
    [a1 didReceiveValuesForKeys:v42 profile:v12];

    int64_t v40 = 0;
    goto LABEL_37;
  }
  int64_t v40 = 1;
LABEL_37:

  return v40;
}

@end