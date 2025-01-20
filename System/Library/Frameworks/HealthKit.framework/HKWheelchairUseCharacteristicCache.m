@interface HKWheelchairUseCharacteristicCache
@end

@implementation HKWheelchairUseCharacteristicCache

void __59___HKWheelchairUseCharacteristicCache_initWithHealthStore___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 16;
    v3 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 16);
    [(os_unfair_lock_s *)v3 _lock_fetchWheelchairUse];
    os_unfair_lock_unlock(v2);
    WeakRetained = v3;
  }
}

void __63___HKWheelchairUseCharacteristicCache__lock_fetchWheelchairUse__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v12 = 0;
  v3 = [v2 wheelchairUseWithError:&v12];
  id v4 = v12;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63___HKWheelchairUseCharacteristicCache__lock_fetchWheelchairUse__block_invoke_2;
  v8[3] = &unk_1E58BB9C8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __63___HKWheelchairUseCharacteristicCache__lock_fetchWheelchairUse__block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3) {
    return objc_msgSend(v2, "_handleFetchSuccess:");
  }
  else {
    return [v2 _handleFetchError:a1[6]];
  }
}

void __57___HKWheelchairUseCharacteristicCache__handleFetchError___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  if ((HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    v2 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "Retrying wheelchair characteristic fetch. Retry attempt: %zd", (uint8_t *)&v4, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_lock_fetchWheelchairUse");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
}

@end