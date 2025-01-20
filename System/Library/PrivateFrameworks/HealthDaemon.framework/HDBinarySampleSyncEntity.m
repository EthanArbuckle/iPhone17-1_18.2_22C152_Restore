@interface HDBinarySampleSyncEntity
+ (BOOL)_insertObjectsFromCodableObjectCollection:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6;
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDBinarySampleSyncEntity

+ (int)nanoSyncObjectType
{
  return 22;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  if (a3 >= 6) {
    return 3;
  }
  else {
    return 0;
  }
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:26];
}

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 sample];
  [v6 dataType];
  char v7 = _HKValidDataTypeCode();

  if (v7)
  {
    v8 = [MEMORY[0x1E4F2B420] createWithCodable:v5];
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = [v5 sample];
      int v13 = 138543618;
      id v14 = a1;
      __int16 v15 = 2048;
      uint64_t v16 = [v11 dataType];
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignorning unknown data type code %lld", (uint8_t *)&v13, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_insertObjectsFromCodableObjectCollection:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = objc_msgSend((id)objc_msgSend(a1, "healthEntityClass"), "codableObjectsFromObjectCollection:", v10);
  id v66 = 0;
  v58 = v10;
  id v14 = +[HDDataSyncUtilities provenanceFromCollection:v10 syncStore:v11 profile:v12 error:&v66];
  id v60 = v66;
  BOOL v15 = v14 == 0;
  if (v14)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = v13;
    uint64_t v16 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v51 = a6;
      BOOL v52 = v14 == 0;
      v53 = v13;
      uint64_t v18 = *(void *)v63;
      id v55 = v12;
      id v56 = v11;
      uint64_t v54 = *(void *)v63;
LABEL_4:
      uint64_t v19 = 0;
      uint64_t v57 = v17;
      while (1)
      {
        if (*(void *)v63 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v62 + 1) + 8 * v19);
        v21 = objc_msgSend(v20, "sample", v51);
        uint64_t v22 = [v21 dataType];

        if (v22 != 144) {
          break;
        }
        id v61 = 0;
        BOOL v23 = +[HDECGSampleEntity _insertECGWithCodableBinarySample:v20 syncStore:v11 profile:v12 provenance:v14 error:&v61];
        id v24 = v61;
        v25 = v24;
        if (!v23)
        {
          if (objc_msgSend(v24, "hk_isHealthKitErrorWithCode:", 123))
          {
            id v49 = v25;
            v48 = v49;
            int v13 = v53;
            BOOL v15 = v52;
            if (v49)
            {
              if (v51) {
                id *v51 = v49;
              }
              else {
                _HKLogDroppedError();
              }
            }

            goto LABEL_40;
          }
          _HKInitializeLogging();
          v26 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v71 = v11;
            __int16 v72 = 2114;
            id v73 = v25;
            _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "failed to insert ECG sample from binary sample synced from store %{public}@: %{public}@", buf, 0x16u);
          }
LABEL_25:
          v44 = [v12 daemon];
          v45 = [v44 autoBugCaptureReporter];
          [v45 reportApplyDataFailure:objc_opt_class() duringSyncFromStore:v11 error:v60];
        }
LABEL_26:

        if (v17 == ++v19)
        {
          uint64_t v17 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
          BOOL v46 = 1;
          if (v17) {
            goto LABEL_4;
          }
          goto LABEL_34;
        }
      }
      id v27 = v20;
      id v28 = v12;
      v29 = v14;
      id v30 = v14;
      id v31 = v58;
      v32 = self;
      uint64_t v33 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      uint64_t v35 = v34;
      v36 = [v32 _objectWithCodable:v27 collection:v31];

      if (v36)
      {
        v37 = objc_msgSend(v36, "_validateWithConfiguration:", v33, v35);
        if (v37)
        {
          _HKInitializeLogging();
          v38 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v71 = v27;
            __int16 v72 = 2114;
            id v73 = v37;
            _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "Codable object %@ failed validation: %{public}@", buf, 0x16u);
          }
        }
        v39 = [v28 dataManager];
        v69 = v36;
        v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
        uint64_t v67 = 0;
        char v41 = [v39 insertDataObjects:v40 withProvenance:v30 creationDate:1 skipInsertionFilter:0 updateSourceOrder:0 resolveAssociations:&v67 error:2.22507386e-308];

        v25 = 0;
        id v12 = v55;
        id v11 = v56;
        id v14 = v29;
        uint64_t v18 = v54;
        uint64_t v17 = v57;
        if (v41) {
          goto LABEL_26;
        }
      }
      else
      {
        _HKInitializeLogging();
        v42 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v71 = v27;
          _os_log_error_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_ERROR, "failed to create client object with codable %@", buf, 0xCu);
        }

        id v12 = v55;
        id v11 = v56;
        id v14 = v29;
        uint64_t v18 = v54;
        uint64_t v17 = v57;
      }
      if (objc_msgSend(0, "hk_isHealthKitErrorWithCode:", 123))
      {
        BOOL v46 = 0;
LABEL_34:
        int v13 = v53;
        goto LABEL_41;
      }
      _HKInitializeLogging();
      v43 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v71 = v11;
        __int16 v72 = 2114;
        id v73 = v60;
        _os_log_error_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_ERROR, "failed to insert objects synced from store %{public}@: %{public}@", buf, 0x16u);
      }
      v25 = 0;
      goto LABEL_25;
    }
    BOOL v46 = 1;
  }
  else
  {
    _HKInitializeLogging();
    v47 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v71 = v11;
      __int16 v72 = 2114;
      id v73 = v60;
      _os_log_impl(&dword_1BCB7D000, v47, OS_LOG_TYPE_DEFAULT, "Failed to create provenance for codable object collection from store %{public}@: %{public}@", buf, 0x16u);
    }
    id obj = [v12 daemon];
    v48 = [obj autoBugCaptureReporter];
    [v48 reportApplyDataFailure:objc_opt_class() duringSyncFromStore:v11 error:v60];
LABEL_40:

    BOOL v46 = v15;
  }
LABEL_41:

  return v46;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  id v5 = a3;
  v6 = [a4 daemon];
  char v7 = [v6 behavior];
  int v8 = [v7 supportsSampleExpiration];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v10 = [MEMORY[0x1E4F2B2C0] _allBinarySampleTypes];
    id v11 = objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v10, v5, *MEMORY[0x1E4F2AB00]);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end