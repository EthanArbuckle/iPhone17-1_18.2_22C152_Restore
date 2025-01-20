@interface HDCloudSyncPipelineStageCheckForRequiredProfileDeletion
- (void)main;
@end

@implementation HDCloudSyncPipelineStageCheckForRequiredProfileDeletion

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 context];
  __int16 v5 = [v4 options];

  if ((v5 & 0x200) == 0)
  {
    v6 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
    objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "totalUnitCount"));
    v7 = [(HDCloudSyncOperation *)self configuration];
    v8 = [v7 repository];
    v9 = [v8 profile];
    v10 = [v9 legacyRepositoryProfile];

    if ([v10 profileType] != 3 && objc_msgSend(v10, "profileType") != 2)
    {
      [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
      goto LABEL_17;
    }
    v11 = [(HDCloudSyncOperation *)self configuration];
    v12 = [v11 cachedCloudState];
    id v21 = 0;
    v13 = [v12 zonesByIdentifierWithError:&v21];
    id v14 = v21;

    if (v13 || !v14)
    {
      if (![v13 count])
      {
        [v10 triggerDeletion];
        v20 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 714, @"Profile does not have any zones. Deleting profile: %@", v10);
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v20];

        goto LABEL_15;
      }
      v16 = self;
      uint64_t v17 = 1;
      id v18 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v23 = self;
        __int16 v24 = 2114;
        id v25 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve cached zones, %{public}@", buf, 0x16u);
      }
      v16 = self;
      uint64_t v17 = 0;
      id v18 = v14;
    }
    [(HDCloudSyncOperation *)v16 finishWithSuccess:v17 error:v18];
LABEL_15:

LABEL_17:
    return;
  }
  _HKInitializeLogging();
  v19 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = self;
    _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping stale profile deletion due to pipeline options.", buf, 0xCu);
  }
  [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
}

@end