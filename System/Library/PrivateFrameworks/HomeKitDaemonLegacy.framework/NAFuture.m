@interface NAFuture
@end

@implementation NAFuture

void __68__NAFuture_FirewallRuleManager__blockAndWaitForCompletionWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __35__NAFuture_HMDUtilities__hmfFuture__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fulfillWithValue:a2];
}

uint64_t __35__NAFuture_HMDUtilities__hmfFuture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rejectWithError:a2];
}

id __64__NAFuture_HMDUtilities__combineAllFuturesIgnoringEmptyResults___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = objc_msgSend(a2, "na_map:", &__block_literal_global_746);
  v4 = [v2 futureWithResult:v3];

  return v4;
}

id __64__NAFuture_HMDUtilities__combineAllFuturesIgnoringEmptyResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v2 && (isKindOfClass & 1) != 0) {
    id v4 = 0;
  }
  else {
    id v4 = v2;
  }

  return v4;
}

id __66__NAFuture_HMDUtilities__combineAllFuturesFlatteningArrayResults___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = objc_msgSend(a2, "na_flatMap:", &__block_literal_global_741);
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

id __66__NAFuture_HMDUtilities__combineAllFuturesFlatteningArrayResults___block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v2 && (isKindOfClass & 1) != 0)
  {
    id v4 = v2;
  }
  else
  {
    v7[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  id v5 = v4;

  return v5;
}

uint64_t __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

void __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hmf_isEmpty"))
  {
    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) firstObject];
    [v4 doubleValue];
    double v6 = v5;

    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 32), "count") - 1);
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    uint64_t v9 = *(void **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke_3;
    block[3] = &unk_1E6A14940;
    uint64_t v16 = *(void *)(a1 + 64);
    id v12 = v7;
    v13 = v9;
    id v15 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 40);
    id v10 = v7;
    dispatch_after(v8, v13, block);
  }
}

void __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 64) futureWithRetryIntervals:*(void *)(a1 + 32) workQueue:*(void *)(a1 + 40) block:*(void *)(a1 + 56)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke_4;
  v4[3] = &unk_1E6A0B6B8;
  id v5 = *(id *)(a1 + 48);
  id v3 = (id)[v2 addCompletionBlock:v4];
}

uint64_t __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

uint64_t __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

void __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(uint64_t *)(a1 + 56) <= 0)
  {
    double v6 = *(void **)(a1 + 32);
    [v6 finishWithError:a2];
  }
  else
  {
    dispatch_time_t v3 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
    id v4 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke_3;
    v7[3] = &unk_1E6A0B6E0;
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v12 = v5;
    uint64_t v13 = *(void *)(a1 + 64);
    dispatch_time_t v8 = v4;
    id v10 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 32);
    dispatch_after(v3, v8, v7);
  }
}

void __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 56) futureWithRetries:*(void *)(a1 + 64) - 1 timeInterval:*(void *)(a1 + 32) workQueue:*(void *)(a1 + 48) block:*(double *)(a1 + 72)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke_4;
  v4[3] = &unk_1E6A0B6B8;
  id v5 = *(id *)(a1 + 40);
  id v3 = (id)[v2 addCompletionBlock:v4];
}

uint64_t __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

@end