@interface HDCloudSyncValidateZonesOperation
+ (BOOL)shouldLogAtOperationStart;
- (void)main;
@end

@implementation HDCloudSyncValidateZonesOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v3 = [(HDCloudSyncOperation *)self cloudState];
    v4 = [v3 zonesByIdentifier];
    v5 = [v4 allValues];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      v9 = (os_log_t *)MEMORY[0x1E4F29FA8];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (([v11 validatedForSharing] & 1) == 0)
          {
            _HKInitializeLogging();
            v12 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v31 = self;
              __int16 v32 = 2114;
              v33 = v11;
              _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Discarding zone for invalid sharing state: %{public}@", buf, 0x16u);
            }
            v13 = [(HDCloudSyncOperation *)self cloudState];
            v29 = v11;
            v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
            v15 = [v13 cloudStateByRemovingZones:v14];
            [(HDCloudSyncOperation *)self setCloudState:v15];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v7);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v16 = [(HDCloudSyncOperation *)self cloudState];
    v17 = [v16 zonesByIdentifier];
    v18 = [v17 allValues];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          if ([v23 hasOrphanedSequenceRecords])
          {
            v24 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 719, @"Orphaned sequence record found in zone %@", v23);
            [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v24];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v20);
    }
  }

  [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
}

@end