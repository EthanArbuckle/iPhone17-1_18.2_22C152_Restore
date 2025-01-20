@interface ATXAppLaunchCategoricalHistogram
@end

@implementation ATXAppLaunchCategoricalHistogram

void __131___ATXAppLaunchCategoricalHistogram_initWithHistogram_categoryToCategoryId_maxCategoryId_maxCategoryCount_lastDates_pruningMethod___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v4 = +[ATXHistogramBundleIdTable sharedInstance];
  v5 = +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:v3 candidateActionTypes:0 blacklist:0];
  id v8 = [v4 allKeysFilteredBy:v5];

  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained removeHistoryForBundleIds:v3];

  id v7 = objc_loadWeakRetained(a1);
  [v7 removeHistoryForBundleIds:v8];
}

void __131___ATXAppLaunchCategoricalHistogram_initWithHistogram_categoryToCategoryId_maxCategoryId_maxCategoryCount_lastDates_pruningMethod___block_invoke_2(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F4AF08] dictionaryWithLegacyPathForClass:objc_opt_class()];
  v2 = [v5 objectForKeyedSubscript:@"MinLaunchThreshold"];
  [v2 doubleValue];
  kLaunchThreshold_0 = v3;

  if (*(double *)&kLaunchThreshold_0 == 0.0)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(double *)&kLaunchThreshold_0);
    [v4 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"_ATXAppLaunchCategoricalHistogram.m", 111, @"Invalid parameter not satisfying: %@", @"kLaunchThreshold != 0" object file lineNumber description];
  }
}

void __63___ATXAppLaunchCategoricalHistogram__garbageCollectCategoryIds__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(a3, "unsignedIntegerValue")) & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __76___ATXAppLaunchCategoricalHistogram_launchCountsForEachCategoryForBundleId___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (*(unsigned __int16 *)(a1 + 40) == a2)
  {
    objc_msgSend(NSNumber, "numberWithFloat:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = *(void **)(a1 + 32);
    v6 = [NSNumber numberWithUnsignedShort:a3];
    id v7 = [v6 stringValue];
    [v5 setObject:v8 forKeyedSubscript:v7];
  }
}

@end