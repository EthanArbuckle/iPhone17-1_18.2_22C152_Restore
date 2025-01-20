@interface AVURLAsset
@end

@implementation AVURLAsset

void __43__AVURLAsset_HeartRhythmUI__hrui_assetSize__block_invoke(uint64_t a1, void *a2, void *a3)
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
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __43__AVURLAsset_HeartRhythmUI__hrui_assetSize__block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __48__AVURLAsset_HeartRhythmUI__hrui_thumbnailImage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2)
  {
    uint64_t v7 = [MEMORY[0x263F1C6B0] imageWithCGImage:a2];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    double v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __48__AVURLAsset_HeartRhythmUI__hrui_thumbnailImage__block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __43__AVURLAsset_HeartRhythmUI__hrui_assetSize__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220CA3000, v0, v1, "[%{public}@ Failed to asynchronously get asset size for Heart Rhythm with error: %@");
}

void __48__AVURLAsset_HeartRhythmUI__hrui_thumbnailImage__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220CA3000, v0, v1, "[%{public}@ Failed to asynchronously generate CG image for Heart Rhythm with error: %@");
}

@end