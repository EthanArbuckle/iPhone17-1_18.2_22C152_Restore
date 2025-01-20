@interface SGAppLaunchHistory
- (id)launchCountsForBundleIds:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5;
- (unint64_t)launchCountForBundleId:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5;
@end

@implementation SGAppLaunchHistory

- (id)launchCountsForBundleIds:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SGAppLaunchHistory.m", 37, @"Invalid parameter not satisfying: %@", @"bundleIds" object file lineNumber description];
  }
  v11 = objc_opt_new();
  if ([v9 count])
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v9];
    v13 = BiomeLibrary();
    v14 = [v13 App];
    v15 = [v14 InFocus];

    id v16 = objc_alloc(MEMORY[0x1E4F503E8]);
    v17 = v10;
    if (!v10)
    {
      v17 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    v18 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v19 = (void *)[v16 initWithStartDate:v17 endDate:v18 maxEvents:0 lastN:0 reversed:0];

    if (!v10) {
    v20 = [v15 publisherWithUseCase:@"SGAppLaunchHistory" options:v19];
    }
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __63__SGAppLaunchHistory_launchCountsForBundleIds_afterDate_limit___block_invoke;
    v35[3] = &unk_1E65BB510;
    id v21 = v12;
    id v36 = v21;
    v22 = [v20 filterWithIsIncluded:v35];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __63__SGAppLaunchHistory_launchCountsForBundleIds_afterDate_limit___block_invoke_2;
    v31[3] = &unk_1E65BB538;
    id v32 = v9;
    id v33 = v10;
    unint64_t v34 = a5;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__SGAppLaunchHistory_launchCountsForBundleIds_afterDate_limit___block_invoke_20;
    v27[3] = &unk_1E65BB560;
    id v29 = v21;
    unint64_t v30 = a5;
    id v28 = v11;
    id v23 = v21;
    id v24 = (id)[v22 sinkWithCompletion:v31 shouldContinue:v27];
  }
  return v11;
}

uint64_t __63__SGAppLaunchHistory_launchCountsForBundleIds_afterDate_limit___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 eventBody];
  v4 = [v3 bundleID];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

void __63__SGAppLaunchHistory_launchCountsForBundleIds_afterDate_limit___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 error];

  if (v4)
  {
    uint64_t v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "_pas_componentsJoinedByString:", @",");
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = [v3 error];
      int v10 = 138413058;
      v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_fault_impl(&dword_1CA650000, v5, OS_LOG_TYPE_FAULT, "Error in launchCountsForBundleIds:%@ afterDate:%@ limit:%td %@", (uint8_t *)&v10, 0x2Au);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }
}

BOOL __63__SGAppLaunchHistory_launchCountsForBundleIds_afterDate_limit___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  v4 = [v3 bundleID];

  [*(id *)(a1 + 32) addObject:v4];
  if ([*(id *)(a1 + 32) countForObject:v4] == *(void *)(a1 + 48)) {
    [*(id *)(a1 + 40) removeObject:v4];
  }
  BOOL v5 = [*(id *)(a1 + 40) count] != 0;

  return v5;
}

- (unint64_t)launchCountForBundleId:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 arrayWithObjects:&v15 count:1];
  __int16 v12 = -[SGAppLaunchHistory launchCountsForBundleIds:afterDate:limit:](self, "launchCountsForBundleIds:afterDate:limit:", v11, v9, a5, v15, v16);

  unint64_t v13 = [v12 countForObject:v10];
  return v13;
}

@end