@interface LTLanguageStatus
@end

@implementation LTLanguageStatus

void __79___LTLanguageStatus_initWithObservationType_useDedicatedMachPort_observations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __79___LTLanguageStatus_initWithObservationType_useDedicatedMachPort_observations___block_invoke_2;
    v7[3] = &unk_2651DBD80;
    v8 = WeakRetained;
    id v6 = v3;
    id v9 = v6;
    os_unfair_lock_lock(v5 + 2);
    __79___LTLanguageStatus_initWithObservationType_useDedicatedMachPort_observations___block_invoke_2((uint64_t)v7);
    os_unfair_lock_unlock(v5 + 2);
    (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6);
  }
}

uint64_t __79___LTLanguageStatus_initWithObservationType_useDedicatedMachPort_observations___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x270F9A758]();
}

void __27___LTLanguageStatus_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = &__block_literal_global_3;
}

@end