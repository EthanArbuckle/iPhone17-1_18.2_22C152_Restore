@interface HDObjectAuthorizationSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
@end

@implementation HDObjectAuthorizationSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:23];
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  v39[6] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v39[0] = @"object";
  v39[1] = @"source";
  v39[2] = @"status";
  v39[3] = @"session";
  v39[4] = @"sync_identity";
  v39[5] = @"modification_date";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:6];
  v16 = [v12 database];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = -1;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __110__HDObjectAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v26[3] = &unk_1E6305DE8;
  id v17 = v15;
  id v27 = v17;
  id v18 = v11;
  int64_t v33 = start;
  int64_t v34 = end;
  id v28 = v18;
  v32 = &v35;
  id v19 = v16;
  id v29 = v19;
  id v20 = v14;
  id v30 = v20;
  id v21 = v12;
  id v31 = v21;
  if (+[HDHealthEntity performReadTransactionWithHealthDatabase:v19 error:a7 block:v26])
  {
    v22 = [v20 allValues];
    char v23 = [v13 sendCodableChange:v22 resultAnchor:v36[3] sequence:0 done:1 error:a7];
  }
  else
  {
    char v23 = 0;
  }

  _Block_object_dispose(&v35, 8);
  return v23;
}

BOOL __110__HDObjectAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8) + 24;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__HDObjectAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v15[3] = &unk_1E62F6FD0;
  uint64_t v9 = *(void *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v18 = v5;
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 88);
  id v12 = v5;
  BOOL v13 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDObjectAuthorizationEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v7, v11, v10, 0, v8, v9, a3, v15);

  return v13;
}

BOOL __110__HDObjectAuthorizationSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
  if (v11
    || (uint64_t v11 = objc_alloc_init(HDCodableObjectAuthorization),
        objc_msgSend(v10, "hk_dataForUUIDBytes"),
        id v12 = objc_claimAutoreleasedReturnValue(),
        [(HDCodableObjectAuthorization *)v11 setObjectUUID:v12],
        v12,
        [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v10],
        v11))
  {
    BOOL v13 = objc_alloc_init(HDCodableObjectSourceAuthorization);
    v14 = HDSQLiteColumnWithNameAsUUID();
    v15 = objc_msgSend(v14, "hk_dataForUUIDBytes");
    [(HDCodableObjectSourceAuthorization *)v13 setSourceUUID:v15];

    [(HDCodableObjectSourceAuthorization *)v13 setAuthorizationStatus:HDSQLiteColumnWithNameAsInt64()];
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableObjectSourceAuthorization setModificationDate:](v13, "setModificationDate:");
    id v16 = HDSQLiteColumnWithNameAsUUID();
    id v17 = objc_msgSend(v16, "hk_dataForUUIDBytes");
    [(HDCodableObjectSourceAuthorization *)v13 setSessionUUID:v17];

    uint64_t v18 = HDSQLiteColumnWithNameAsInt64();
    id v19 = [*(id *)(a1 + 40) syncIdentityManager];
    id v20 = [v19 identityForEntityID:v18 transaction:*(void *)(a1 + 48) error:a8];

    BOOL v21 = v20 != 0;
    if (v20)
    {
      v22 = [v20 identity];
      char v23 = [v22 codableSyncIdentity];
      [(HDCodableObjectSourceAuthorization *)v13 setSyncIdentity:v23];

      [(HDCodableObjectAuthorization *)v11 addAuthorizations:v13];
    }
  }
  else
  {
    BOOL v21 = 1;
  }

  return v21;
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
  v4 = [[HDCodableObjectAuthorization alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v73 = a6;
  v70 = v10;
  v71 = self;
  uint64_t v60 = [v10 syncProvenance];
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = v9;
  uint64_t v64 = [obj countByEnumeratingWithState:&v84 objects:v99 count:16];
  if (v64)
  {
    uint64_t v63 = *(void *)v85;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v85 != v63)
        {
          uint64_t v12 = v11;
          objc_enumerationMutation(obj);
          uint64_t v11 = v12;
        }
        uint64_t v65 = v11;
        BOOL v13 = *(void **)(*((void *)&v84 + 1) + 8 * v11);
        v66 = [v13 objectUUID];
        if (v66)
        {
          v67 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:");
          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v69 = [v13 authorizations];
          uint64_t v14 = [v69 countByEnumeratingWithState:&v80 objects:v98 count:16];
          if (!v14) {
            goto LABEL_39;
          }
          uint64_t v72 = *(void *)v81;
          while (1)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v81 != v72) {
                objc_enumerationMutation(v69);
              }
              id v16 = *(void **)(*((void *)&v80 + 1) + 8 * i);
              id v17 = [v16 sourceUUID];
              if (v17)
              {
                if ([v16 hasAuthorizationStatus])
                {
                  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v17);
                  id v19 = objc_alloc_init(MEMORY[0x1E4F2B2B8]);
                  [v19 setObjectUUID:v67];
                  [v19 setSourceUUID:v18];
                  objc_msgSend(v19, "setStatus:", objc_msgSend(v16, "authorizationStatus"));
                  [v16 modificationDate];
                  objc_msgSend(v19, "setModificationDate:");
                  id v20 = (void *)MEMORY[0x1E4F29128];
                  BOOL v21 = [v16 sessionUUID];
                  v22 = objc_msgSend(v20, "hk_UUIDWithData:", v21);
                  [v19 setSessionUUID:v22];

                  *(void *)&long long buf = 0;
                  *((void *)&buf + 1) = &buf;
                  uint64_t v89 = 0x3032000000;
                  v90 = __Block_byref_object_copy__140;
                  v91 = __Block_byref_object_dispose__140;
                  char v23 = [v73 syncIdentityManager];
                  id v92 = [v23 legacySyncIdentity];

                  if (![v16 hasSyncIdentity]) {
                    goto LABEL_18;
                  }
                  v24 = [v16 syncIdentity];
                  id v79 = 0;
                  v25 = +[HDSyncIdentity syncIdentityWithCodable:v24 error:&v79];
                  id v26 = v79;

                  if (v25)
                  {
                    id v27 = [v73 database];
                    v74[0] = MEMORY[0x1E4F143A8];
                    v74[1] = 3221225472;
                    v74[2] = __90__HDObjectAuthorizationEntity__insertCodableObjectAuthorizations_syncStore_profile_error___block_invoke;
                    v74[3] = &unk_1E62F3DD8;
                    p_long long buf = &buf;
                    id v78 = v26;
                    id v75 = v73;
                    id v28 = v25;
                    id v76 = v28;
                    BOOL v29 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v27 error:&v78 block:v74];
                    id v30 = v78;

                    if (v29)
                    {

LABEL_18:
                      id v31 = NSNumber;
                      v32 = [*(id *)(*((void *)&buf + 1) + 40) entity];
                      objc_msgSend(v31, "numberWithLongLong:", objc_msgSend(v32, "persistentID"));
                      id v26 = (id)objc_claimAutoreleasedReturnValue();

                      int64_t v33 = [v68 objectForKeyedSubscript:v26];
                      id v28 = v33;
                      if (v33)
                      {
                        [v33 addObject:v19];
                      }
                      else
                      {
                        id v38 = objc_alloc(MEMORY[0x1E4F1CA48]);
                        id v97 = v19;
                        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
                        id v28 = (id)[v38 initWithArray:v39];
                      }
                      [v68 setObject:v28 forKeyedSubscript:v26];
                    }
                    else
                    {
                      id v26 = v30;
                    }
                  }
                  else
                  {
                    _HKInitializeLogging();
                    v40 = *MEMORY[0x1E4F29FA8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
                    {
                      LODWORD(v93) = 138543362;
                      *(void *)((char *)&v93 + 4) = v26;
                      _os_log_fault_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_FAULT, "HDObjectAuthorizationSyncEntity SyncIdentity from received codable is nil %{public}@", (uint8_t *)&v93, 0xCu);
                    }
                    id v28 = 0;
                  }

                  _Block_object_dispose(&buf, 8);
                  goto LABEL_33;
                }
                _HKInitializeLogging();
                v36 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                {
                  v44 = v36;
                  v45 = objc_opt_class();
                  LODWORD(buf) = 138543362;
                  *(void *)((char *)&buf + 4) = v45;
                  id v46 = v45;
                  _os_log_error_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_ERROR, "%{public}@ is missing authorization status and will be ignored.", (uint8_t *)&buf, 0xCu);
                }
                uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Missing authorization status");
                id v19 = [v73 daemon];
                uint64_t v37 = [v19 autoBugCaptureReporter];
                [v37 reportApplyDataFailure:objc_opt_class() duringSyncFromStore:v70 error:v18];
              }
              else
              {
                _HKInitializeLogging();
                int64_t v34 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                {
                  v41 = v34;
                  v42 = objc_opt_class();
                  LODWORD(buf) = 138543362;
                  *(void *)((char *)&buf + 4) = v42;
                  id v43 = v42;
                  _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "%{public}@ is missing a source ID and will be ignored.", (uint8_t *)&buf, 0xCu);
                }
                uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Missing source ID");
                id v19 = [v73 daemon];
                uint64_t v35 = [v19 autoBugCaptureReporter];
                [v35 reportApplyDataFailure:objc_opt_class() duringSyncFromStore:v70 error:v18];
              }
LABEL_33:
            }
            uint64_t v14 = [v69 countByEnumeratingWithState:&v80 objects:v98 count:16];
            if (!v14) {
              goto LABEL_39;
            }
          }
        }
        _HKInitializeLogging();
        v47 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          v49 = v47;
          v50 = objc_opt_class();
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v50;
          id v51 = v50;
          _os_log_error_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_ERROR, "%{public}@ is missing an object ID and will be ignored.", (uint8_t *)&buf, 0xCu);
        }
        v67 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Missing Object ID");
        id v69 = [v73 daemon];
        v48 = [v69 autoBugCaptureReporter];
        [v48 reportApplyDataFailure:objc_opt_class() duringSyncFromStore:v70 error:v67];

LABEL_39:
        uint64_t v11 = v65 + 1;
      }
      while (v65 + 1 != v64);
      uint64_t v64 = [obj countByEnumeratingWithState:&v84 objects:v99 count:16];
    }
    while (v64);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v52 = v68;
  uint64_t v53 = [v52 countByEnumeratingWithState:&v93 objects:&buf count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v94;
    int64_t v55 = 1;
LABEL_43:
    uint64_t v56 = 0;
    while (1)
    {
      if (*(void *)v94 != v54) {
        objc_enumerationMutation(v52);
      }
      v57 = *(void **)(*((void *)&v93 + 1) + 8 * v56);
      v58 = [v52 objectForKeyedSubscript:v57];
      LOBYTE(v57) = objc_msgSend(v71, "setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:", v58, v60, (int)objc_msgSend(v57, "intValue"), v73, a7);

      if ((v57 & 1) == 0) {
        break;
      }
      if (v53 == ++v56)
      {
        uint64_t v53 = [v52 countByEnumeratingWithState:&v93 objects:&buf count:16];
        if (v53) {
          goto LABEL_43;
        }
        goto LABEL_49;
      }
    }
  }
  else
  {
LABEL_49:
    int64_t v55 = 0;
  }

  return v55;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = [v3 setWithArray:v4];

  return v5;
}

@end