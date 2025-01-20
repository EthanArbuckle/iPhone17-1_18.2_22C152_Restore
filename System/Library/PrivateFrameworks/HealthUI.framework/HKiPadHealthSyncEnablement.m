@interface HKiPadHealthSyncEnablement
+ (BOOL)isSyncPromptedForHealthKit:(id)a3;
+ (id)_syncEnablementKeyValueDomain:(id)a3;
@end

@implementation HKiPadHealthSyncEnablement

+ (id)_syncEnablementKeyValueDomain:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F2B138];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithCategory:3 domainName:*MEMORY[0x1E4F2BE08] healthStore:v4];

  return v6;
}

+ (BOOL)isSyncPromptedForHealthKit:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  if (objc_msgSend(v6, "aa_isManagedAppleID"))
  {
    id v19 = 0;
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v19, 701, @"Managed Apple IDs are not permitted to participate in HealthKit cloud sync.");
    id v7 = v19;
    BOOL v8 = 0;
  }
  else
  {
    id v7 = [a1 _syncEnablementKeyValueDomain:v4];
    id v18 = (id)*MEMORY[0x1E4F2BE00];
    v9 = objc_msgSend(v7, "dateForKey:error:");
    id v10 = 0;
    v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v12 = objc_msgSend(v11, "hk_hasCompletedThirdPartyAuthSyncWithBooleanValue");

    v13 = (os_log_t *)MEMORY[0x1E4F29FA8];
    if (v10)
    {
      _HKInitializeLogging();
      v14 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR)) {
        +[HKiPadHealthSyncEnablement isSyncPromptedForHealthKit:v14];
      }
    }
    _HKInitializeLogging();
    v15 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
    {
      v16 = @"was not";
      if (v12) {
        v16 = @"was";
      }
      *(_DWORD *)buf = 138543618;
      id v21 = a1;
      __int16 v22 = 2114;
      v23 = v16;
      _os_log_impl(&dword_1E0B26000, v15, OS_LOG_TYPE_INFO, "%{public}@: HealthKit sync %{public}@ enabled on iPad", buf, 0x16u);
    }
    if (v9) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v12;
    }
  }
  return v8;
}

+ (void)isSyncPromptedForHealthKit:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "%{public}@: Unable to get the status update for the sync %{public}@", (uint8_t *)&v3, 0x16u);
}

@end