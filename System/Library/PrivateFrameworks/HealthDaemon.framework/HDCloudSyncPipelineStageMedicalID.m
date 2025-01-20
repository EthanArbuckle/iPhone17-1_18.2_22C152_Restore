@interface HDCloudSyncPipelineStageMedicalID
- (void)main;
@end

@implementation HDCloudSyncPipelineStageMedicalID

- (void)main
{
  v90[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 medicalIDDataManager];
  id v81 = 0;
  v6 = [v5 fetchMedicalIDWithError:&v81];
  id v7 = v81;
  localMedicalIDData = self->_localMedicalIDData;
  self->_localMedicalIDData = v6;

  cloudMedicalIDData = self->_cloudMedicalIDData;
  self->_cloudMedicalIDData = 0;

  medicalIDRecord = self->_medicalIDRecord;
  self->_medicalIDRecord = 0;

  if (self->_localMedicalIDData) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v7 == 0;
  }
  if (v11)
  {
    id v70 = v7;
    v12 = [HDCloudSyncCompoundOperation alloc];
    v13 = [(HDCloudSyncOperation *)self configuration];
    v71 = [(HDCloudSyncCompoundOperation *)v12 initWithConfiguration:v13 cloudState:0 name:@"Fetch and Process Medical ID" continueOnSubOperationError:0];

    v14 = [HDCloudSyncParallelOperation alloc];
    v15 = [(HDCloudSyncOperation *)self configuration];
    v16 = [(HDCloudSyncParallelOperation *)v14 initWithConfiguration:v15 cloudState:0];

    v17 = [(HDCloudSyncOperation *)self configuration];
    v18 = [v17 repository];
    v19 = [v18 secondaryCKContainers];

    v20 = [HDCloudSyncMedicalIDFetchOperation alloc];
    v21 = [(HDCloudSyncOperation *)self configuration];
    v22 = [(HDCloudSyncOperation *)self configuration];
    v23 = [v22 repository];
    v24 = [v23 primaryCKContainer];
    uint64_t v25 = [(HDCloudSyncMedicalIDFetchOperation *)v20 initWithConfiguration:v21 cloudState:0 container:v24];

    v69 = (void *)v25;
    [(HDCloudSyncParallelOperation *)v16 addOperation:v25];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obj = v19;
    uint64_t v27 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v78 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void *)(*((void *)&v77 + 1) + 8 * i);
          v32 = [HDCloudSyncMedicalIDFetchOperation alloc];
          v33 = [(HDCloudSyncOperation *)self configuration];
          v34 = [(HDCloudSyncMedicalIDFetchOperation *)v32 initWithConfiguration:v33 cloudState:0 container:v31];

          [v26 addObject:v34];
          v35 = [(HDCloudSyncOperation *)v34 operationIgnoringErrors];
          [(HDCloudSyncParallelOperation *)v16 addOperation:v35];
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
      }
      while (v28);
    }

    [(HDCloudSyncCompoundOperation *)v71 addOperation:v16 transitionHandler:0];
    id v36 = [(HDCloudSyncOperation *)self configuration];
    if (self)
    {
      v72 = v36;
      v37 = [[HDCloudSyncCompoundOperation alloc] initWithConfiguration:v36 cloudState:0 name:@"Process Medical ID" continueOnSubOperationError:0];
      v38 = [(HDCloudSyncOperation *)[HDCloudSyncMedicalIDMergeOperation alloc] initWithConfiguration:v72 cloudState:0];
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __77__HDCloudSyncPipelineStageMedicalID__compoundSyncOperationWithConfiguration___block_invoke;
      v84[3] = &unk_1E6304D90;
      v84[4] = self;
      [(HDCloudSyncCompoundOperation *)v37 setPreparationHandler:v84];
      [(HDCloudSyncCompoundOperation *)v37 addOperation:v38 transitionHandler:0];
      v39 = [(HDCloudSyncOperation *)[HDCloudSyncMedicalIDPersistOperation alloc] initWithConfiguration:v72 cloudState:0];
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __77__HDCloudSyncPipelineStageMedicalID__compoundSyncOperationWithConfiguration___block_invoke_2;
      v82[3] = &unk_1E6304DB8;
      v67 = v38;
      v68 = v39;
      v83 = v67;
      [(HDCloudSyncCompoundOperation *)v37 addOperation:v39 transitionHandler:v82];
      v66 = [(HDCloudSyncOperation *)self configuration];
      v40 = [v66 repository];
      v41 = [v40 primaryCKContainer];
      v42 = [(HDCloudSyncOperation *)self configuration];
      v43 = [v42 repository];
      v44 = [v43 profileIdentifier];
      v45 = HDDatabaseForContainer(v41, v44);
      uint64_t v65 = [v45 databaseScope];

      v46 = v37;
      id v36 = v72;

      if (v65 == 2)
      {
        id v47 = objc_alloc(MEMORY[0x1E4F1A310]);
        v48 = (void *)MEMORY[0x1E4F1A320];
        v49 = [v72 repository];
        v50 = [v49 syncCircleIdentifier];
        v51 = objc_msgSend(v48, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v50);
        v52 = (void *)[v47 initWithZoneID:v51];

        v53 = [HDCloudSyncCreateZonesOperation alloc];
        v90[0] = v52;
        v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:1];
        v55 = [v72 repository];
        v56 = [v55 primaryCKContainer];
        v57 = [(HDCloudSyncCreateZonesOperation *)v53 initWithConfiguration:v72 cloudState:0 zones:v54 container:v56];

        [(HDCloudSyncCompoundOperation *)v46 addOperation:v57 transitionHandler:0];
      }
      v58 = [(HDCloudSyncOperation *)[HDCloudSyncMedicalIDPushOperation alloc] initWithConfiguration:v72 cloudState:0];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __77__HDCloudSyncPipelineStageMedicalID__compoundSyncOperationWithConfiguration___block_invoke_3;
      v87 = &unk_1E62F4820;
      v88 = self;
      v89 = v67;
      v59 = v67;
      [(HDCloudSyncCompoundOperation *)v46 addOperation:v58 transitionHandler:buf];
    }
    else
    {
      v46 = 0;
    }

    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __41__HDCloudSyncPipelineStageMedicalID_main__block_invoke;
    v74[3] = &unk_1E6304D68;
    v74[4] = self;
    id v75 = v69;
    id v76 = v26;
    id v60 = v26;
    id v61 = v69;
    v62 = [(HDCloudSyncOperation *)v46 operationWithRunCondition:v74];
    [(HDCloudSyncCompoundOperation *)v71 addOperation:v62 transitionHandler:0];
    [(HDCloudSyncOperation *)self delegateToOperation:v71];

    id v7 = v70;
  }
  else
  {
    _HKInitializeLogging();
    v63 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_error_impl(&dword_1BCB7D000, v63, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch local Medical ID during cloud sync with error %{public}@", buf, 0x16u);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v7];
  }
}

uint64_t __41__HDCloudSyncPipelineStageMedicalID_main__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  uint64_t v27 = v3;
  if (v1)
  {
    id v5 = v3;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      id obj = v4;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          BOOL v11 = [v5 cloudMedicalIDData];

          if (!v11) {
            goto LABEL_9;
          }
          v12 = [v5 cloudMedicalIDData];
          v13 = [v12 dateSaved];
          v14 = [v10 cloudMedicalIDData];
          v15 = [v14 dateSaved];
          int v16 = objc_msgSend(v13, "hk_isBeforeDate:", v15);

          if (v16)
          {
LABEL_9:
            id v17 = v10;

            id v5 = v17;
          }
        }
        id v4 = obj;
        uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = 0;
  }

  uint64_t v18 = [v5 cloudMedicalIDData];
  uint64_t v19 = *(void *)(a1 + 32);
  v20 = *(void **)(v19 + 136);
  *(void *)(v19 + 136) = v18;

  uint64_t v21 = [*(id *)(a1 + 40) medicalIDRecord];
  uint64_t v22 = *(void *)(a1 + 32);
  v23 = *(void **)(v22 + 144);
  *(void *)(v22 + 144) = v21;

  uint64_t v24 = *(void *)(a1 + 32);
  if (*(_OWORD *)(v24 + 128) == 0) {
    uint64_t v25 = 0;
  }
  else {
    uint64_t v25 = objc_msgSend(*(id *)(v24 + 128), "isEqualToSyncedData:") ^ 1;
  }

  return v25;
}

void __77__HDCloudSyncPipelineStageMedicalID__compoundSyncOperationWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 128);
  id v4 = a2;
  id v5 = [v4 operations];
  uint64_t v6 = [v5 firstObject];
  [v6 setLocalMedicalIDData:v3];

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 136);
  id v9 = [v4 operations];

  uint64_t v8 = [v9 firstObject];
  [v8 setCloudMedicalIDData:v7];
}

void __77__HDCloudSyncPipelineStageMedicalID__compoundSyncOperationWithConfiguration___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = [v3 mergedMedicalIDData];
  [v4 setMedicalIDDataToPersist:v5];
}

void __77__HDCloudSyncPipelineStageMedicalID__compoundSyncOperationWithConfiguration___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 136);
  id v6 = a3;
  [v6 setCloudMedicalIDData:v4];
  id v5 = [*(id *)(a1 + 40) mergedMedicalIDData];
  [v6 setMedicalIDDataToPush:v5];

  [v6 setMedicalIDRecord:*(void *)(*(void *)(a1 + 32) + 144)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDRecord, 0);
  objc_storeStrong((id *)&self->_cloudMedicalIDData, 0);

  objc_storeStrong((id *)&self->_localMedicalIDData, 0);
}

@end