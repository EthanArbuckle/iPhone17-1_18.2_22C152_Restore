@interface HDDataSyncUtilities
+ (BOOL)insertDeletedObjectsFromCodableObjectCollection:(id)a3 syncEntityClass:(Class)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)insertObjectsFromCodableObjectCollection:(id)a3 syncEntityClass:(Class)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (Class)correlationSampleSyncEntityClass;
+ (Class)deletedSampleEntityClass;
+ (Class)deletedSampleSyncEntityClass;
+ (Class)medicationDoseEventSyncEntityClass;
+ (Class)quantitySampleSyncEntityClass;
+ (id)generateCodableObjectCollectionsForEntityClass:(Class)a3 predicate:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)provenanceFromCollection:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6;
@end

@implementation HDDataSyncUtilities

+ (Class)medicationDoseEventSyncEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)quantitySampleSyncEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)correlationSampleSyncEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)deletedSampleSyncEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)deletedSampleEntityClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)insertObjectsFromCodableObjectCollection:(id)a3 syncEntityClass:(Class)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x1C187C0E0]();
  v15 = [(id)objc_opt_class() objectsFromCodableObjectsInCollection:v11];
  if (![v15 count])
  {

LABEL_10:
    BOOL v24 = 1;
    goto LABEL_11;
  }
  id v34 = 0;
  v16 = +[HDDataSyncUtilities provenanceFromCollection:v11 syncStore:v12 profile:v13 error:&v34];
  id v17 = v34;
  if (!v16)
  {
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v36 = v12;
      __int16 v37 = 2114;
      id v38 = v17;
      _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "Failed to create provenance for codable object collection from store %{public}@: %{public}@", buf, 0x16u);
    }
    v22 = [v13 daemon];
    v23 = [v22 autoBugCaptureReporter];
    [v23 reportApplyDataFailure:a4 duringSyncFromStore:v12 error:v17];

    goto LABEL_9;
  }
  v31 = a7;
  context = v14;
  v18 = [v13 dataManager];
  id v33 = v17;
  char v19 = [v18 insertDataObjects:v15 withProvenance:v16 creationDate:1 skipInsertionFilter:0 updateSourceOrder:0 resolveAssociations:&v33 error:2.22507386e-308];
  id v20 = v33;

  if (v19)
  {
    id v17 = v20;
    v14 = context;
LABEL_9:

    goto LABEL_10;
  }
  _HKInitializeLogging();
  v26 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v36 = v12;
    __int16 v37 = 2114;
    id v38 = v20;
    _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "failed to insert objects synced from store %{public}@: %{public}@", buf, 0x16u);
  }
  v27 = [v13 daemon];
  v28 = [v27 autoBugCaptureReporter];
  [v28 reportApplyDataFailure:a4 duringSyncFromStore:v12 error:v20];

  id v29 = v20;
  v30 = v29;
  if (v29)
  {
    if (v31) {
      id *v31 = v29;
    }
    else {
      _HKLogDroppedError();
    }
  }

  BOOL v24 = 0;
LABEL_11:

  return v24;
}

+ (id)provenanceFromCollection:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v80 = a4;
  id v79 = a5;
  v77 = v8;
  v9 = [v8 provenance];
  if (v9)
  {
    v76 = [v8 source];
    if (v80) {
      uint64_t v10 = [v80 syncProvenance];
    }
    else {
      uint64_t v10 = 0;
    }
    v69 = [v9 decodedSourceUUID];
    v73 = [v9 decodedDeviceUUID];
    id v13 = (void *)MEMORY[0x1E4F29128];
    v14 = [v9 contributorUUID];
    v70 = objc_msgSend(v13, "hk_UUIDWithData:", v14);

    if (v70) {
      +[HDContributorReference contributorReferenceForOtherUserWithUUID:](HDContributorReference, "contributorReferenceForOtherUserWithUUID:");
    }
    else {
    v15 = +[HDContributorReference contributorReferenceForNoContributor];
    }
    if (!v76)
    {
      _HKInitializeLogging();
      char v19 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v80;
        _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "missing source for object collection received from %{public}@", buf, 0xCu);
      }
      v78 = 0;
      id v20 = 0;
LABEL_29:
      if (v73)
      {
        id v29 = [v79 database];
        id v88 = v20;
        v74 = +[HDDeviceEntity deviceEntityWithUUID:v73 healthDatabase:v29 error:&v88];
        id v72 = v88;

        if (v74)
        {
LABEL_35:
          v75 = [v9 originProductType];
          if (!v75)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v75 = [v80 remoteProductType];
            }
            else
            {
              v75 = @"UnknownDevice";
            }
          }
          if (v78 && v74)
          {
            if ([v9 hasOriginMajorVersion])
            {
              int v35 = [v9 originMajorVersion];
              uint64_t v66 = (int)[v9 originMinorVersion];
              uint64_t v67 = v35;
              uint64_t v65 = (int)[v9 originPatchVersion];
            }
            else
            {
              v40 = [v9 originBuild];
              HDVersionFromBuildStringForProductType(v40, v75, buf);
              uint64_t v66 = *(void *)&buf[8];
              uint64_t v67 = *(void *)buf;
              uint64_t v65 = *(void *)&buf[16];
            }
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v93 = __Block_byref_object_copy__7;
            v94 = __Block_byref_object_dispose__7;
            v41 = [v79 syncIdentityManager];
            id v95 = [v41 legacySyncIdentity];

            uint64_t v64 = v10;
            v68 = v15;
            if ([v77 hasSyncIdentity])
            {
              v42 = [v77 syncIdentity];
              id v86 = 0;
              v43 = +[HDSyncIdentity syncIdentityWithCodable:v42 error:&v86];
              id v44 = v86;

              if (v43)
              {
                v45 = [v79 database];
                v81[0] = MEMORY[0x1E4F143A8];
                v81[1] = 3221225472;
                v81[2] = __72__HDDataSyncUtilities_provenanceFromCollection_syncStore_profile_error___block_invoke;
                v81[3] = &unk_1E62F3DD8;
                v84 = buf;
                id v85 = v44;
                id v82 = v79;
                id v83 = v43;
                BOOL v46 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v45 error:&v85 block:v81];
                id v47 = v85;

                if (!v46)
                {
                  _HKInitializeLogging();
                  v48 = *MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
                  {
                    LODWORD(v90) = 138543362;
                    *(void *)((char *)&v90 + 4) = v47;
                    _os_log_fault_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_FAULT, "HDDataSyncEntity ConcreteSyncIdentity from received codable is nil %{public}@", (uint8_t *)&v90, 0xCu);
                  }
                }

                id v44 = v47;
              }
              else
              {
                _HKInitializeLogging();
                v49 = *MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
                {
                  LODWORD(v90) = 138543362;
                  *(void *)((char *)&v90 + 4) = v44;
                  _os_log_fault_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_FAULT, "HDDataSyncEntity SyncIdentity from received codable is nil %{public}@", (uint8_t *)&v90, 0xCu);
                }
              }
            }
            v50 = [*(id *)(*(void *)&buf[8] + 40) entity];
            uint64_t v51 = [v50 persistentID];
            v52 = [v9 originBuild];
            uint64_t v53 = [v9 sourceVersion];
            v54 = (void *)v53;
            if (v53) {
              v55 = (__CFString *)v53;
            }
            else {
              v55 = &stru_1F1728D60;
            }
            uint64_t v56 = [v9 timeZoneName];
            v57 = (void *)v56;
            if (v56) {
              v58 = (__CFString *)v56;
            }
            else {
              v58 = &stru_1F1728D60;
            }
            v59 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v78, "persistentID"));
            v60 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v74, "persistentID"));
            *(void *)&long long v90 = v67;
            *((void *)&v90 + 1) = v66;
            uint64_t v91 = v65;
            id v12 = +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:v64 syncIdentity:v51 productType:v75 systemBuild:v52 operatingSystemVersion:&v90 sourceVersion:v55 timeZoneName:v58 sourceID:v59 deviceID:v60 contributorReference:v68];

            v15 = v68;
            _Block_object_dispose(buf, 8);
          }
          else
          {
            _HKInitializeLogging();
            id v36 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
            {
              __int16 v37 = v36;
              id v38 = [v69 UUIDString];
              uint64_t v39 = [v73 UUIDString];
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v80;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v38;
              *(_WORD *)&buf[22] = 2114;
              v93 = v39;
              _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_INFO, "missing source/device provenance for object collection received from %{public}@, %{public}@/%{public}@.", buf, 0x20u);
            }
            id v12 = 0;
          }
          id v61 = v72;
          v62 = v61;
          if (v61)
          {
            if (a6) {
              *a6 = v61;
            }
            else {
              _HKLogDroppedError();
            }
          }

          goto LABEL_68;
        }
        _HKInitializeLogging();
        v30 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
        {
          v31 = v30;
          v32 = [v73 UUIDString];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v32;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v72;
          _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_INFO, "failed to find expected device \"%{public}@\": %{public}@", buf, 0x16u);
        }
      }
      else
      {
        id v72 = v20;
      }
      id v33 = [v79 deviceManager];
      id v87 = v72;
      v74 = [v33 deviceEntityForNoDeviceWithError:&v87];
      id v34 = v87;

      id v72 = v34;
      goto LABEL_35;
    }
    v16 = [v76 bundleIdentifier];
    if (v80)
    {
      id v17 = [v80 syncStoreDefaultSourceBundleIdentifier];
      uint64_t v18 = [v16 isEqualToString:v17];
    }
    else
    {
      uint64_t v18 = 1;
    }
    LOBYTE(v90) = 0;
    v21 = [v79 sourceManager];
    id v89 = 0;
    v78 = [v21 sourceForCodableSource:v76 provenance:v10 createIfNecessary:v18 isDeleted:&v90 error:&v89];
    id v20 = v89;

    if (v78)
    {
      if (!(_BYTE)v90)
      {
LABEL_28:

        goto LABEL_29;
      }
      v22 = (void *)MEMORY[0x1E4F28C58];
      v23 = [v76 decodedUUID];
      objc_msgSend(v22, "hk_error:format:", 100, @"Source %@ is deleted", v23);
      BOOL v24 = v20;
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        if (v18) {
          v26 = " or create";
        }
        else {
          v26 = "";
        }
        v27 = v25;
        v28 = [v76 decodedUUID];
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2114;
        v93 = (uint64_t (*)(uint64_t, uint64_t))v20;
        _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "failed to look-up%s source %{public}@: %{public}@", buf, 0x20u);
      }
      v78 = [v79 daemon];
      v23 = [v78 autoBugCaptureReporter];
      BOOL v24 = [v76 bundleIdentifier];
      [v23 reportMissingSource:v24 duringSyncFromStore:v80];
    }

    v78 = 0;
    goto LABEL_28;
  }
  _HKInitializeLogging();
  id v11 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v80;
    _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "No provenance information on codable object collection received from %{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 3, @"No provenance information on codable object collection received from %@", v80);
  id v12 = 0;
LABEL_68:

  return v12;
}

BOOL __72__HDDataSyncUtilities_provenanceFromCollection_syncStore_profile_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  v5 = (void *)a1[4];
  id v6 = a2;
  v7 = [v5 syncIdentityManager];
  uint64_t v8 = [v7 concreteIdentityForIdentity:a1[5] shouldCreate:1 transaction:v6 error:a3];

  uint64_t v9 = *(void *)(a1[6] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

+ (BOOL)insertDeletedObjectsFromCodableObjectCollection:(id)a3 syncEntityClass:(Class)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = [v11 deletedSamples];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    id v35 = 0;
    v16 = +[HDDataSyncUtilities provenanceFromCollection:v11 syncStore:v12 profile:v13 error:&v35];
    id v17 = v35;
    if (v16)
    {
      Class v33 = a4;
      uint64_t v18 = [v11 deletedSamples];
      char v19 = [v13 daemon];
      id v20 = [v19 behavior];
      char v21 = [v20 shouldReceiveECGSamples];

      if (v21)
      {
        v22 = v18;
      }
      else
      {
        v27 = [v11 deletedSamples];
        v22 = objc_msgSend(v27, "hk_filter:", &__block_literal_global_7);

        if (![v22 count])
        {
          BOOL v23 = 1;
LABEL_26:

          goto LABEL_27;
        }
      }
      id v34 = v17;
      BOOL v28 = +[HDDeletedSampleEntity insertCodableDeletedSamples:v22 provenance:v16 profile:v13 error:&v34];
      id v26 = v34;

      if (v28)
      {
        BOOL v23 = 1;
LABEL_25:
        id v17 = v26;
        goto LABEL_26;
      }
      if (objc_msgSend(v26, "hk_isHealthKitErrorWithCode:", 123))
      {
        id v29 = v26;
        id v25 = v29;
        if (v29)
        {
          if (a7)
          {
            id v25 = v29;
            BOOL v23 = 0;
            *a7 = v25;
          }
          else
          {
            _HKLogDroppedError();
            BOOL v23 = 0;
          }
          id v26 = v25;
        }
        else
        {
          id v26 = 0;
          BOOL v23 = 0;
        }
      }
      else
      {
        _HKInitializeLogging();
        v30 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v37 = v12;
          __int16 v38 = 2114;
          id v39 = v26;
          _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "Failed to insert deleted samples during sync for store %{public}@: %{public}@", buf, 0x16u);
        }
        id v25 = [v13 daemon];
        v31 = [v25 autoBugCaptureReporter];
        [v31 reportApplyDataFailure:v33 duringSyncFromStore:v12 error:v26];

        BOOL v23 = 1;
      }
LABEL_24:

      goto LABEL_25;
    }
    _HKInitializeLogging();
    BOOL v24 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v37 = v12;
      __int16 v38 = 2114;
      id v39 = v17;
      _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "Failed to look up provenance for deleted samples from store %{public}@: %{public}@", buf, 0x16u);
      if (v17) {
        goto LABEL_9;
      }
    }
    else if (v17)
    {
LABEL_9:
      v22 = [v13 daemon];
      id v25 = [v22 autoBugCaptureReporter];
      [v25 reportApplyDataFailure:a4 duringSyncFromStore:v12 error:v17];
      BOOL v23 = 1;
      id v26 = v17;
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 11, @"Failed to look up provenance for deleted samples from store");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  BOOL v23 = 1;
LABEL_27:

  return v23;
}

BOOL __111__HDDataSyncUtilities_insertDeletedObjectsFromCodableObjectCollection_syncEntityClass_syncStore_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasSample])
  {
    v3 = [v2 sample];
    BOOL v4 = [v3 dataType] != 144;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)generateCodableObjectCollectionsForEntityClass:(Class)a3 predicate:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 database];
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  BOOL v28 = __Block_byref_object_dispose__7;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__HDDataSyncUtilities_generateCodableObjectCollectionsForEntityClass_predicate_profile_error___block_invoke;
  v18[3] = &unk_1E62F3E70;
  id v13 = v11;
  id v19 = v13;
  Class v22 = a3;
  id v14 = v10;
  id v23 = a1;
  id v20 = v14;
  char v21 = &v24;
  if ([(objc_class *)a3 performReadTransactionWithHealthDatabase:v12 error:a6 block:v18])uint64_t v15 = (void *)v25[5]; {
  else
  }
    uint64_t v15 = 0;
  id v16 = v15;

  _Block_object_dispose(&v24, 8);

  return v16;
}

uint64_t __94__HDDataSyncUtilities_generateCodableObjectCollectionsForEntityClass_predicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [[HDDataProvenanceCache alloc] initWithProfile:*(void *)(a1 + 32) transaction:v5 purpose:0];
  v7 = [*(id *)(a1 + 56) entityEncoderForProfile:*(void *)(a1 + 32) transaction:v5 purpose:0 encodingOptions:0 authorizationFilter:0];

  uint64_t v8 = *(void **)(a1 + 56);
  uint64_t v9 = [v7 orderedProperties];
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = [*(id *)(a1 + 32) database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__HDDataSyncUtilities_generateCodableObjectCollectionsForEntityClass_predicate_profile_error___block_invoke_2;
  v19[3] = &unk_1E62F3E48;
  id v12 = v6;
  id v20 = v12;
  id v21 = *(id *)(a1 + 32);
  id v13 = v7;
  id v22 = v13;
  long long v23 = *(_OWORD *)(a1 + 56);
  uint64_t v14 = [v8 enumerateEntitiesForSyncWithProperties:v9 predicate:v10 healthDatabase:v11 error:a3 block:v19];

  if (v14)
  {
    uint64_t v15 = [(HDDataProvenanceCache *)v12 allCodableObjectCollectionsByProvenance];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  return v14;
}

uint64_t __94__HDDataSyncUtilities_generateCodableObjectCollectionsForEntityClass_predicate_profile_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = [NSNumber numberWithLongLong:HDSQLiteColumnWithNameAsInt64()];
  id v13 = [*(id *)(a1 + 32) provenanceWithID:v12];
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a8, 100, @"Failed to retrieve provenance for id %@", v12);
LABEL_9:
    uint64_t v18 = 0;
    goto LABEL_10;
  }
  uint64_t v14 = [*(id *)(a1 + 32) codableObjectCollectionForProvenance:v13 profile:*(void *)(a1 + 40)];

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a8, 100, @"Failed to find/create codable object collection for provenance %@", v13);
    goto LABEL_9;
  }
  uint64_t v15 = *(void **)(a1 + 48);
  uint64_t v16 = [v11 persistentID];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __94__HDDataSyncUtilities_generateCodableObjectCollectionsForEntityClass_predicate_profile_error___block_invoke_3;
  v21[3] = &unk_1E62F3E20;
  uint64_t v25 = *(void *)(a1 + 56);
  id v22 = *(id *)(a1 + 32);
  id v23 = v13;
  id v24 = *(id *)(a1 + 40);
  if (([v15 generateCodableRepresentationsForPersistentID:v16 row:a4 maxBytesPerRepresentation:0x80000 error:a8 handler:v21] & 1) == 0)
  {
    _HKInitializeLogging();
    id v17 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v20;
      _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: failed to generate codable representation for sync", buf, 0xCu);
    }
  }

  uint64_t v18 = 1;
LABEL_10:

  return v18;
}

uint64_t __94__HDDataSyncUtilities_generateCodableObjectCollectionsForEntityClass_predicate_profile_error___block_invoke_3(void *a1, void *a2)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v5 = a1[6];
  BOOL v4 = (void *)a1[7];
  id v6 = a2;
  v7 = [v2 codableObjectCollectionForProvenance:v3 profile:v5];
  LODWORD(v3) = [v4 addCodableObject:v6 toCollection:v7];

  if (v3) {
    return 0;
  }
  else {
    return 2;
  }
}

@end