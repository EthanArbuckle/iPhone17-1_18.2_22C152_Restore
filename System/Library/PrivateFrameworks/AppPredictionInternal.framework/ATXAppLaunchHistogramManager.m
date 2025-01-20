@interface ATXAppLaunchHistogramManager
@end

@implementation ATXAppLaunchHistogramManager

void __70___ATXAppLaunchHistogramManager_enumerateInMemoryHistogramsWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 integerValue], v5);
}

void __81___ATXAppLaunchHistogramManager_enumerateInMemoryCategoricalHistogramsWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 integerValue], v5);
}

uint64_t __67___ATXAppLaunchHistogramManager_categoricalHistogramForLaunchType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _categoricalHistogramForLaunchType:*(void *)(a1 + 40) maxCategoryCount:*(unsigned __int16 *)(a1 + 56) pruningMethod:*(void *)(a1 + 48)];
}

@end