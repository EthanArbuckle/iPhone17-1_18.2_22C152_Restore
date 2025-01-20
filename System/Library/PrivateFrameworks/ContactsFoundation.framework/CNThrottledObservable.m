@interface CNThrottledObservable
@end

@implementation CNThrottledObservable

void __36___CNThrottledObservable_subscribe___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delayToken];
  [v1 cancel];
}

void __36___CNThrottledObservable_subscribe___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v5 = a1[4];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __36___CNThrottledObservable_subscribe___block_invoke_3;
  v22[3] = &unk_1E56A1D08;
  v22[4] = WeakRetained;
  id v6 = v3;
  id v23 = v6;
  v24 = &v25;
  CNRunWithLock(v5, v22);
  if (*((unsigned char *)v26 + 24))
  {
    v7 = [WeakRetained observerScheduler];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __36___CNThrottledObservable_subscribe___block_invoke_4;
    v20[3] = &unk_1E569F310;
    v20[4] = WeakRetained;
    id v21 = a1[5];
    [v7 performBlock:v20];
  }
  v8 = [WeakRetained delayToken];
  [v8 cancel];

  v9 = [WeakRetained observerScheduler];
  [WeakRetained interval];
  double v11 = v10;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __36___CNThrottledObservable_subscribe___block_invoke_5;
  v16 = &unk_1E569F988;
  id v17 = WeakRetained;
  id v18 = a1[5];
  id v19 = a1[4];
  v12 = [v9 afterDelay:&v13 performBlock:v11];
  objc_msgSend(WeakRetained, "setDelayToken:", v12, v13, v14, v15, v16, v17);

  _Block_object_dispose(&v25, 8);
}

uint64_t __36___CNThrottledObservable_subscribe___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setMostRecentResult:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 32) isCoalescing] & 1) == 0 && (objc_msgSend(*(id *)(a1 + 32), "options")) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  v2 = *(void **)(a1 + 32);

  return [v2 setIsCoalescing:1];
}

uint64_t __36___CNThrottledObservable_subscribe___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerScheduler_sendResultToObserver:", *(void *)(a1 + 40));
}

void __36___CNThrottledObservable_subscribe___block_invoke_5(uint64_t a1)
{
  if (([*(id *)(a1 + 32) options] & 2) != 0) {
    objc_msgSend(*(id *)(a1 + 32), "observerScheduler_sendResultToObserver:", *(void *)(a1 + 40));
  }
  v2 = *(void **)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36___CNThrottledObservable_subscribe___block_invoke_6;
  v3[3] = &unk_1E569F9D8;
  v3[4] = *(void *)(a1 + 32);
  CNRunWithLock(v2, v3);
}

uint64_t __36___CNThrottledObservable_subscribe___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsCoalescing:0];
}

void __36___CNThrottledObservable_subscribe___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained delayToken];
  [v3 cancel];

  v4 = [WeakRetained observerScheduler];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36___CNThrottledObservable_subscribe___block_invoke_8;
  v5[3] = &unk_1E569F310;
  v5[4] = WeakRetained;
  id v6 = *(id *)(a1 + 32);
  [v4 performBlock:v5];
}

uint64_t __36___CNThrottledObservable_subscribe___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "observerScheduler_sendResultToObserver:", *(void *)(a1 + 40));
  v2 = *(void **)(a1 + 40);

  return [v2 observerDidComplete];
}

void __36___CNThrottledObservable_subscribe___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained delayToken];
  [v5 cancel];

  id v6 = [WeakRetained observerScheduler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36___CNThrottledObservable_subscribe___block_invoke_10;
  v8[3] = &unk_1E569F310;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  [v6 performBlock:v8];
}

uint64_t __36___CNThrottledObservable_subscribe___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:*(void *)(a1 + 40)];
}

uint64_t __65___CNThrottledObservable_observerScheduler_sendResultToObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mostRecentResult];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(a1 + 32);

  return [v5 setMostRecentResult:0];
}

@end