@interface DASSubmissionManager
@end

@implementation DASSubmissionManager

void __29___DASSubmissionManager_init__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activityGroupQueue];
  objc_sync_enter(v2);
  v3 = [*(id *)(a1 + 32) activityGroupQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29___DASSubmissionManager_init__block_invoke_2;
  v4[3] = &unk_1E6112EB0;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];

  objc_sync_exit(v2);
}

void __29___DASSubmissionManager_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_1B578B000, v7, OS_LOG_TYPE_DEFAULT, "For pool %{public}@, have queued %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t __56___DASSubmissionManager_submitActivities_withScheduler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  unint64_t v8 = [v6 schedulingPriority];
  if (v8 > [v7 schedulingPriority]) {
    goto LABEL_2;
  }
  unint64_t v10 = [v7 schedulingPriority];
  if (v10 < [v6 schedulingPriority])
  {
LABEL_4:
    uint64_t v9 = 1;
    goto LABEL_10;
  }
  if (([v6 requiresInexpensiveNetworking] & 1) != 0
    || ([v7 requiresInexpensiveNetworking] & 1) == 0)
  {
    if (![v7 requiresInexpensiveNetworking]
      || [v7 requiresInexpensiveNetworking])
    {
      id v11 = [v6 startBefore];
      uint64_t v12 = [v7 startBefore];
      uint64_t v9 = [v11 compare:v12];

      goto LABEL_10;
    }
    goto LABEL_4;
  }
LABEL_2:
  uint64_t v9 = -1;
LABEL_10:

  return v9;
}

@end