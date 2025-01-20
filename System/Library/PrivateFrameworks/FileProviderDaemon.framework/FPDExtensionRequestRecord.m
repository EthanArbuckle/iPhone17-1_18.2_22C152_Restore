@interface FPDExtensionRequestRecord
@end

@implementation FPDExtensionRequestRecord

void __46___FPDExtensionRequestRecord_monitorProgress___block_invoke(uint64_t a1)
{
  fpfs_adopt_log();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 80) finishObserving];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  if (*(void *)(a1 + 40))
  {
    id location = 0;
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v4;

    v7 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:*(void *)(a1 + 40) path:"fractionCompleted"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46___FPDExtensionRequestRecord_monitorProgress___block_invoke_2;
    v11[3] = &unk_1E6A75E80;
    objc_copyWeak(&v12, &location);
    uint64_t v8 = [v7 addObserverBlock:v11];
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 80);
    *(void *)(v9 + 80) = v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  __fp_pop_log();
}

void __46___FPDExtensionRequestRecord_monitorProgress___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
    [v2 timeIntervalSinceDate:v4[9]];
    if (v3 >= 5.0)
    {
      objc_storeStrong(v4 + 9, v2);
      [v4 _setupProgressTimer];
    }

    WeakRetained = v4;
  }
}

void __42___FPDExtensionRequestRecord__setupTimer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = fpfs_adopt_log();
    [WeakRetained cancelTimeout];
    [WeakRetained _handleTimeout];
    __fp_pop_log();
  }
}

void __49___FPDExtensionRequestRecord__setupProgressTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = fpfs_adopt_log();
    [WeakRetained cancelTimeout];
    [WeakRetained _handleTimeout];
    __fp_pop_log();
  }
}

@end