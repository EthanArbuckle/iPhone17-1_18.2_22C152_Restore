@interface HDCloudSyncUpdateSharingStatusOperation
+ (BOOL)shouldLogAtOperationStart;
- (void)_finishOperationWithParticipantSharingStatus:(void *)a1;
- (void)main;
@end

@implementation HDCloudSyncUpdateSharingStatusOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 syncAvailability];

  if (([v5 shouldSyncSummarySharingPull] & 1) != 0
    || ([v5 shouldSyncSummarySharingPush] & 1) != 0)
  {
    v6 = [(HDCloudSyncOperation *)self configuration];
    v7 = [v6 cachedCloudState];
    id v49 = 0;
    v8 = [v7 zonesByIdentifierWithError:&v49];
    id v9 = v49;

    if (v8 || !v9)
    {
      v11 = [v8 allValues];
      v12 = v11;
      if (v11)
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id obj = v11;
        uint64_t v38 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (v38)
        {
          uint64_t v37 = *(void *)v46;
          *(void *)&long long v13 = 138543874;
          long long v33 = v13;
          id v35 = v9;
          v36 = v8;
          v34 = v12;
          do
          {
            uint64_t v14 = 0;
            uint64_t v15 = v37;
            uint64_t v16 = v38;
            do
            {
              if (*(void *)v46 != v15) {
                objc_enumerationMutation(obj);
              }
              v17 = *(void **)(*((void *)&v45 + 1) + 8 * v14);
              id v44 = 0;
              v18 = objc_msgSend(v17, "zoneShareWithError:", &v44, v33);
              id v19 = v44;
              v20 = v19;
              if (v18) {
                BOOL v21 = 1;
              }
              else {
                BOOL v21 = v19 == 0;
              }
              if (v21)
              {
                if (v18)
                {
                  long long v42 = 0u;
                  long long v43 = 0u;
                  long long v40 = 0u;
                  long long v41 = 0u;
                  v22 = [v18 participants];
                  uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v50 count:16];
                  if (v23)
                  {
                    uint64_t v24 = v23;
                    uint64_t v25 = *(void *)v41;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v24; ++i)
                      {
                        if (*(void *)v41 != v25) {
                          objc_enumerationMutation(v22);
                        }
                        v27 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                        if ([v27 acceptanceStatus] == 2 || objc_msgSend(v27, "acceptanceStatus") == 1)
                        {
                          -[HDCloudSyncUpdateSharingStatusOperation _finishOperationWithParticipantSharingStatus:](self, 1);

                          id v9 = v35;
                          v8 = v36;
                          v12 = v34;
                          goto LABEL_40;
                        }
                      }
                      uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v50 count:16];
                      uint64_t v15 = v37;
                      if (v24) {
                        continue;
                      }
                      break;
                    }
                  }

                  uint64_t v16 = v38;
                }
              }
              else
              {
                _HKInitializeLogging();
                v28 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                {
                  v30 = v28;
                  v31 = [v17 zoneIdentifier];
                  *(_DWORD *)buf = v33;
                  v52 = self;
                  __int16 v53 = 2114;
                  id v54 = v31;
                  __int16 v55 = 2114;
                  v56 = v20;
                  _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached CKShare for zone %{public}@, %{public}@", buf, 0x20u);
                }
              }

              ++v14;
            }
            while (v14 != v16);
            id v9 = v35;
            v8 = v36;
            v12 = v34;
            uint64_t v38 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
          }
          while (v38);
        }
      }
      -[HDCloudSyncUpdateSharingStatusOperation _finishOperationWithParticipantSharingStatus:](self, 2);
LABEL_40:
    }
    else
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v52 = self;
        __int16 v53 = 2114;
        id v54 = v9;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve cached zones, %{public}@", buf, 0x16u);
      }
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v9];
    }
  }
  else
  {
    _HKInitializeLogging();
    v32 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v52 = self;
      _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping operation because platform/profile does not support summary sharing", buf, 0xCu);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
}

- (void)_finishOperationWithParticipantSharingStatus:(void *)a1
{
  if (a1)
  {
    v4 = [a1 profile];
    v5 = HDTinkerProtectedKeyValueDomainWithProfile(v4);

    v6 = [NSNumber numberWithInteger:a2];
    id v9 = 0;
    uint64_t v7 = [v5 setNumber:v6 forKey:@"HDCloudSyncSharingStatusKey" error:&v9];
    id v8 = v9;

    [a1 finishWithSuccess:v7 error:v8];
  }
}

@end