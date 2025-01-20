@interface AVURLAsset
@end

@implementation AVURLAsset

void __39__AVURLAsset_HKAdditions__hk_assetSize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = [v5 firstObject];
    [v7 naturalSize];
    if (v7)
    {
      double v12 = v9;
      double v13 = v8;
      [v7 preferredTransform];
      double v9 = v12;
      double v8 = v13;
      float64x2_t v10 = v14;
      float64x2_t v11 = v15;
    }
    else
    {
      float64x2_t v10 = 0uLL;
      float64x2_t v11 = 0uLL;
    }
    *(float64x2_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = vmlaq_n_f64(vmulq_n_f64(v11, v9), v10, v8);
  }
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      __39__AVURLAsset_HKAdditions__hk_assetSize__block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __44__AVURLAsset_HKAdditions__hk_thumbnailImage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2)
  {
    uint64_t v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:a2];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    double v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      __44__AVURLAsset_HKAdditions__hk_thumbnailImage__block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __39__AVURLAsset_HKAdditions__hk_assetSize__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "[%{public}@ Failed to asynchronously get asset size for HealthKit with error: %@");
}

void __44__AVURLAsset_HKAdditions__hk_thumbnailImage__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "[%{public}@ Failed to asynchronously generate CG image for HealthKit with error: %@");
}

@end