@interface HDCloudSyncPipelineStagePull
+ (id)operationTagDependencies;
- (HDCloudSyncPipelineStagePull)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (void)_reportLastPulledUpdateDate;
- (void)main;
@end

@implementation HDCloudSyncPipelineStagePull

+ (id)operationTagDependencies
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1764B60;
  v4[1] = 0x1F1764B80;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (HDCloudSyncPipelineStagePull)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HDCloudSyncPipelineStagePull;
  v4 = [(HDCloudSyncPipelineStage *)&v7 initWithConfiguration:a3 cloudState:a4];
  v5 = v4;
  if (v4) {
    [(HDCloudSyncPipelineStage *)v4 setExpectedReceiveSize:2];
  }
  return v5;
}

- (void)main
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 context];
  char v5 = [v4 options];

  if ((v5 & 2) != 0)
  {
    _HKInitializeLogging();
    v28 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = self;
      _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping due to pipeline options.", buf, 0xCu);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
  else
  {
    v6 = [HDCloudSyncCompoundOperation alloc];
    objc_super v7 = [(HDCloudSyncOperation *)self configuration];
    v8 = [(HDCloudSyncOperation *)self cloudState];
    v9 = [(HDCloudSyncCompoundOperation *)v6 initWithConfiguration:v7 cloudState:v8 name:@"Pull" continueOnSubOperationError:1];

    v10 = [(HDCloudSyncOperation *)self configuration];
    v11 = [v10 computedState];
    v12 = [v11 pullTargets];
    v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_224];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v13;
    uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * v17);
          v19 = [HDCloudSyncPullStoreOperation alloc];
          v20 = [(HDCloudSyncOperation *)self configuration];
          v21 = [(HDCloudSyncOperation *)self cloudState];
          v22 = [(HDCloudSyncPullStoreOperation *)v19 initWithConfiguration:v20 cloudState:v21 target:v18];

          [(HDCloudSyncCompoundOperation *)v9 addOperation:v22 transitionHandler:0];
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v15);
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __36__HDCloudSyncPipelineStagePull_main__block_invoke_2;
    v31[3] = &unk_1E62F2928;
    v31[4] = self;
    [(HDCloudSyncOperation *)v9 setOnSuccess:v31];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __36__HDCloudSyncPipelineStagePull_main__block_invoke_3;
    v30[3] = &unk_1E62F2950;
    v30[4] = self;
    [(HDCloudSyncOperation *)v9 setOnError:v30];
    [(HDCloudSyncCompoundOperation *)v9 start];
    v23 = [(HDCloudSyncOperation *)v9 progress];
    uint64_t v24 = [v23 totalUnitCount];

    v25 = [(HDCloudSyncOperation *)self progress];
    objc_msgSend(v25, "setTotalUnitCount:", objc_msgSend(v25, "totalUnitCount") + v24);

    v26 = [(HDCloudSyncOperation *)self progress];
    v27 = [(HDCloudSyncOperation *)v9 progress];
    [v26 addChild:v27 withPendingUnitCount:v24];
  }
}

uint64_t __36__HDCloudSyncPipelineStagePull_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  char v5 = [a2 storeRecord];
  v6 = [v4 storeRecord];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __36__HDCloudSyncPipelineStagePull_main__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  -[HDCloudSyncPipelineStagePull _reportLastPulledUpdateDate](*(void **)(a1 + 32));
  v2 = *(void **)(v1 + 32);
  if (v2)
  {
    v3 = [*(id *)(v1 + 32) configuration];
    v57 = [v3 syncDate];

    id v4 = [v2 configuration];
    char v5 = [v4 repository];

    v6 = [v5 profile];
    uint64_t v7 = [v6 legacyRepositoryProfile];

    v8 = HDCloudSyncKeyValueDomainWithProfile(v7);
    v9 = [v5 primaryCKContainer];
    v10 = [v9 containerIdentifier];
    uint64_t v11 = HDCloudSyncLastSuccessfulPullKeyForContainerIdentifier((uint64_t)v10);

    v12 = (void *)v11;
    id v59 = 0;
    uint64_t v13 = [v8 dateForKey:v11 error:&v59];
    id v14 = v59;
    uint64_t v15 = v14;
    v56 = (void *)v13;
    if (v13 || !v14)
    {
      if (!v13 && [v7 profileType] == 1)
      {
        v51 = v12;
        v53 = v2;
        _HKInitializeLogging();
        uint64_t v17 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEBUG, "Generating AWD event for first successful pull", buf, 2u);
        }
        id v18 = v7;
        id v19 = v57;
        v20 = HDCloudSyncRestorePhaseSyncCompleteEndDate(v18);
        uint64_t v21 = HDCloudSyncRestorePhaseSyncCompleteStartDate(v18);
        v22 = (void *)v21;
        if (!v20 && v21)
        {
          [v19 timeIntervalSinceDate:v21];
          double v24 = v23;
          [v18 daemon];
          v25 = v49 = v5;
          [v25 analyticsSubmissionCoordinator];
          v26 = v47 = v8;
          objc_msgSend(v26, "cloudSync_reportRestoreForProfile:startDate:endDate:duration:finishedJournalMerge:", v18, v22, v19, 0, v24);

          v8 = v47;
          char v5 = v49;
          HDSetCloudSyncRestorPhaseSyncCompleteEndDate(v19, v18);
        }

        v12 = v51;
        v2 = v53;
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v16 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v61 = v15;
        _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Unable to determine whether or not this is the first successful pull: %{public}@.", buf, 0xCu);
      }
    }
    v27 = [[HDCloudSyncUpdateLastPullDateOperation alloc] initWithPullCompleteDate:v57 lastSuccessfulPullKey:v12];
    id v58 = v15;
    BOOL v28 = [(HDJournalableOperation *)v27 performOrJournalWithProfile:v7 error:&v58];
    id v55 = v58;

    if (v28)
    {
      if ([(HDJournalableOperation *)v27 didJournal])
      {
        _HKInitializeLogging();
        v29 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v61 = v2;
          __int16 v62 = 2114;
          v63 = v7;
          _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync Journals are present, last pull date will be updated after cloud sync journals are ingested %{public}@", buf, 0x16u);
        }
      }
    }
    if ([v7 profileType] == 3)
    {
      v52 = v12;
      v54 = v2;
      v48 = v8;
      v50 = v5;
      id v30 = v56;
      v45 = v7;
      id v31 = v7;
      id v32 = v57;
      long long v33 = HDCloudSyncLastPulledUpdateDate(v31);
      if (v33)
      {
        long long v34 = NSNumber;
        long long v35 = v32;
        [v32 timeIntervalSinceDate:v33];
        v36 = objc_msgSend(v34, "numberWithDouble:");
      }
      else
      {
        long long v35 = v32;
        v36 = 0;
      }
      uint64_t v46 = v1;
      if (v56)
      {
        v37 = NSNumber;
        v38 = v35;
        [v35 timeIntervalSinceDate:v30];
        uint64_t v39 = objc_msgSend(v37, "numberWithDouble:");
      }
      else
      {
        uint64_t v39 = 0;
        v38 = v35;
      }
      v40 = [v31 daemon];
      v41 = [v40 analyticsSubmissionCoordinator];
      v42 = [v54 configuration];
      objc_msgSend(v41, "tinker_syncFinishedWithLatency:timeSinceLastSuccessfullPull:configuration:", v36, v39, v42);

      uint64_t v1 = v46;
      v8 = v48;
      char v5 = v50;
      v12 = v52;
      uint64_t v7 = v45;
    }
    HDUpdateOldestSampleStartDateForProfile(v7);

    v43 = *(void **)(v1 + 32);
  }
  else
  {
    v43 = 0;
  }

  return [v43 finishWithSuccess:1 error:0];
}

- (void)_reportLastPulledUpdateDate
{
  if (a1)
  {
    uint64_t v1 = [a1 configuration];
    v2 = [v1 repository];
    v3 = [v2 profile];
    id v6 = [v3 legacyRepositoryProfile];

    id v4 = HDCloudSyncLastPulledUpdateDate(v6);
    char v5 = [v6 cloudSyncManager];
    [v5 didCompleteSuccessfulPullOfUpdateWithDate:v4];
  }
}

void __36__HDCloudSyncPipelineStagePull_main__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  -[HDCloudSyncPipelineStagePull _reportLastPulledUpdateDate](*(void **)(a1 + 32));
  id v4 = [*(id *)(a1 + 32) profile];
  uint64_t v5 = [v4 profileType];

  if (v5 == 3)
  {
    id v6 = [*(id *)(a1 + 32) profile];
    uint64_t v7 = [v6 daemon];
    v8 = [v7 analyticsSubmissionCoordinator];
    v9 = [*(id *)(a1 + 32) configuration];
    objc_msgSend(v8, "tinker_syncFailedWithError:configuration:", v10, v9);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v10];
}

@end