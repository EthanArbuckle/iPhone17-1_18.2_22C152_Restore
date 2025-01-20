@interface ATXAppLaunchHistogram
@end

@implementation ATXAppLaunchHistogram

uint64_t __42___ATXAppLaunchHistogram_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2[1];
  v5 = a2;
  [v3 encodeObject:v4 forKey:@"histogramData"];
  [*(id *)(a1 + 32) encodeInt32:*((unsigned __int16 *)v5 + 8) forKey:@"bucketCount"];
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *((unsigned __int8 *)v5 + 18);

  return [v6 encodeBool:v7 forKey:@"filter"];
}

void __72___ATXAppLaunchHistogram_initWithHistogram_bucketCount_filter_timeBase___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[ATXHistogramBundleIdTable sharedInstance];
  v5 = +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:v3 candidateActionTypes:0 blacklist:0];
  id v8 = [v4 allKeysFilteredBy:v5];

  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained removeHistoryForBundleIds:v3];

  id v7 = objc_loadWeakRetained(a1);
  [v7 removeHistoryForBundleIds:v8];
}

void __72___ATXAppLaunchHistogram_initWithHistogram_bucketCount_filter_timeBase___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F4AF08] dictionaryWithLegacyPathForClass:objc_opt_class()];
  id v7 = v2;
  if (!v2)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"_ATXAppLaunchHistogram.m", 106, @"Invalid parameter not satisfying: %@", @"parameters" object file lineNumber description];

    v2 = 0;
  }
  id v3 = [v2 objectForKeyedSubscript:@"MinLaunchThreshold"];
  [v3 doubleValue];
  kLaunchThreshold = v4;

  if (*(double *)&kLaunchThreshold == 0.0)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(double *)&kLaunchThreshold);
    [v6 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"_ATXAppLaunchHistogram.m", 108, @"Invalid parameter not satisfying: %@", @"kLaunchThreshold != 0" object file lineNumber description];
  }
}

uint64_t __79___ATXAppLaunchHistogram__addLaunchWithBundleId_date_timeZone_arbitraryWeight___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [*(id *)(a2 + 8) add:*(unsigned __int16 *)(a1 + 36) a:*(unsigned __int16 *)(a1 + 38) b:a3];
}

uint64_t __67___ATXAppLaunchHistogram_addLaunchWithBundleId_elapsedTime_weight___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [*(id *)(a2 + 8) add:*(unsigned __int16 *)(a1 + 36) a:*(unsigned __int16 *)(a1 + 38) b:a3];
}

void __41___ATXAppLaunchHistogram_resetHistogram___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __51___ATXAppLaunchHistogram_removeHistoryForBundleId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int16 v6 = 0;
  uint64_t v4 = +[ATXHistogramBundleIdTable sharedInstance];
  int v5 = [v4 lookup:*(void *)(a1 + 32) into:&v6];

  if (v5) {
    [v3[1] deleteWhereA:v6 b:0xFFFFLL];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void __52___ATXAppLaunchHistogram_removeHistoryForBundleIds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        unsigned __int16 v11 = 0;
        v10 = +[ATXHistogramBundleIdTable sharedInstance];
        LODWORD(v9) = [v10 lookup:v9 into:&v11];

        if (v9)
        {
          [v3[1] deleteWhereA:v11 b:0xFFFFLL];
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

uint64_t __60___ATXAppLaunchHistogram_launchPopularityWithBundleId_date___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned __int16 *)(a1 + 48);
  uint64_t v6 = *(unsigned __int16 *)(a1 + 50);
  uint64_t v7 = *(void **)(a2 + 8);
  if (*(unsigned char *)(a2 + 18))
  {
    uint64_t v8 = *(unsigned __int16 *)(a2 + 16);
    id v9 = (id)a2;
    LODWORD(v10) = 1.0;
    [v7 lookupSmoothedWithBucketCount:v8 distanceScale:v5 a:v6 b:v10];
  }
  else
  {
    id v12 = (id)a2;
    [v7 lookupUnsmoothedA:v5 b:v6];
  }
  double v13 = v11;
  uint64_t v14 = *(unsigned __int16 *)(a1 + 48);
  long long v15 = *(void **)(a2 + 8);

  [v15 lookupUnsmoothedA:v14 b:0xFFFFLL];
  uint64_t result = [v4 ratio:v13 over:v16];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v18;
  return result;
}

void __82___ATXAppLaunchHistogram_relativeLaunchPopularityWithBundleId_date_distanceScale___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(unsigned __int16 *)(a1 + 52);
  uint64_t v7 = *(unsigned __int16 *)(a1 + 54);
  uint64_t v8 = (void *)v3[1];
  uint64_t v14 = v3;
  if (*((unsigned char *)v3 + 18))
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 48);
    [v8 lookupSmoothedWithBucketCount:*((unsigned __int16 *)v3 + 8) distanceScale:v6 a:v7 b:v4];
  }
  else
  {
    [v8 lookupUnsmoothedA:v6 b:v7];
  }
  float v10 = *(float *)&v9;
  float v11 = (void *)v14[1];
  if (*((unsigned char *)v14 + 18))
  {
    LODWORD(v9) = *(_DWORD *)(a1 + 48);
    [v11 lookupSmoothedWithBucketCount:*((unsigned __int16 *)v14 + 8) distanceScale:0xFFFFLL a:*(unsigned __int16 *)(a1 + 54) b:v9];
  }
  else
  {
    [v11 lookupUnsmoothedA:0xFFFFLL b:*(unsigned __int16 *)(a1 + 54)];
  }
  [v5 ratio:v10 over:v12];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v13;
}

void __89___ATXAppLaunchHistogram_relativeLaunchPopularityWithBundleId_elapsedTime_distanceScale___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(unsigned __int16 *)(a1 + 52);
  uint64_t v7 = *(unsigned __int16 *)(a1 + 54);
  uint64_t v8 = (void *)v3[1];
  uint64_t v14 = v3;
  if (*((unsigned char *)v3 + 18))
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 48);
    [v8 lookupSmoothedWithBucketCount:*((unsigned __int16 *)v3 + 8) distanceScale:v6 a:v7 b:v4];
  }
  else
  {
    [v8 lookupUnsmoothedA:v6 b:v7];
  }
  float v10 = *(float *)&v9;
  float v11 = (void *)v14[1];
  if (*((unsigned char *)v14 + 18))
  {
    LODWORD(v9) = *(_DWORD *)(a1 + 48);
    [v11 lookupSmoothedWithBucketCount:*((unsigned __int16 *)v14 + 8) distanceScale:0xFFFFLL a:*(unsigned __int16 *)(a1 + 54) b:v9];
  }
  else
  {
    [v11 lookupUnsmoothedA:0xFFFFLL b:*(unsigned __int16 *)(a1 + 54)];
  }
  [v5 ratio:v10 over:v12];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v13;
}

double __70___ATXAppLaunchHistogram_totalTimeOfDayLaunchesForDate_distanceScale___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(unsigned __int16 *)(a1 + 44);
  uint64_t v5 = *(void **)(a2 + 8);
  if (*(unsigned char *)(a2 + 18))
  {
    LODWORD(a3) = *(_DWORD *)(a1 + 40);
    [v5 lookupSmoothedWithBucketCount:*(unsigned __int16 *)(a2 + 16) distanceScale:0xFFFFLL a:v4 b:a3];
  }
  else
  {
    [v5 lookupUnsmoothedA:0xFFFFLL b:v4];
  }
  double result = v6;
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __77___ATXAppLaunchHistogram_totalTimeOfDayLaunchesForElapsedTime_distanceScale___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(unsigned __int16 *)(a1 + 44);
  uint64_t v5 = *(void **)(a2 + 8);
  if (*(unsigned char *)(a2 + 18))
  {
    LODWORD(a3) = *(_DWORD *)(a1 + 40);
    [v5 lookupSmoothedWithBucketCount:*(unsigned __int16 *)(a2 + 16) distanceScale:0xFFFFLL a:v4 b:a3];
  }
  else
  {
    [v5 lookupUnsmoothedA:0xFFFFLL b:v4];
  }
  double result = v6;
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __61___ATXAppLaunchHistogram_overallLaunchPopularityForBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned __int16 *)(a1 + 48);
  float v6 = (void *)a2[1];
  uint64_t v7 = a2;
  [v6 lookupUnsmoothedA:v5 b:0xFFFFLL];
  double v9 = v8;
  float v10 = (void *)a2[1];

  [v10 lookupUnsmoothedA:0xFFFFLL b:0xFFFFLL];
  uint64_t result = [v4 ratio:v9 over:v11];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v13;
  return result;
}

double __39___ATXAppLaunchHistogram_totalLaunches__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a2 + 8) lookupUnsmoothedA:0xFFFFLL b:0xFFFFLL];
  double result = v3;
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __52___ATXAppLaunchHistogram_totalLaunchesForBundleIds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  float v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3[1], "lookupUnsmoothedA:b:", objc_msgSend(*(id *)(a1 + 40), "_eventIdforBundleId:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10), 0xFFFFLL);
        *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + v9;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void __74___ATXAppLaunchHistogram_totalLaunchesForBundleIds_forDate_distanceScale___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  float v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "_eventIdforBundleId:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        long long v11 = (void *)v3[1];
        if (*((unsigned char *)v3 + 18))
        {
          LODWORD(v10) = *(_DWORD *)(a1 + 56);
          [v11 lookupSmoothedWithBucketCount:*((unsigned __int16 *)v3 + 8) distanceScale:v9 a:*(unsigned __int16 *)(a1 + 60) b:v10];
        }
        else
        {
          [v11 lookupUnsmoothedA:v9 b:*(unsigned __int16 *)(a1 + 60)];
        }
        *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + v12;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

void __70___ATXAppLaunchHistogram_unsmoothedLaunchesForBundleIds_forLocalTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  float v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3[1], "lookupUnsmoothedA:b:", objc_msgSend(*(id *)(a1 + 40), "_eventIdforBundleId:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10), *(unsigned __int16 *)(a1 + 56));
        *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + v9;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

double __48___ATXAppLaunchHistogram_bundleHasBeenLaunched___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a2 + 8) lookupUnsmoothedA:*(unsigned __int16 *)(a1 + 40) b:0xFFFFLL];
  double result = v3;
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __40___ATXAppLaunchHistogram_decayByFactor___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 32);
  *(float *)&double v2 = v2;
  return [*(id *)(a2 + 8) decayByFactor:v2];
}

uint64_t __50___ATXAppLaunchHistogram_decayWithHalfLifeInDays___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 32);
  *(float *)&double v2 = v2;
  return [*(id *)(a2 + 8) decayWithHalfLifeInDays:v2];
}

uint64_t __35___ATXAppLaunchHistogram_resetData__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) clear];
}

uint64_t __37___ATXAppLaunchHistogram_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a2 + 8) description];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

double __45___ATXAppLaunchHistogram_entropyForBundleId___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a2 + 8) entropyWhereA:*(unsigned __int16 *)(a1 + 40) b:0xFFFFLL];
  double result = v3;
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __41___ATXAppLaunchHistogram_entropyForDate___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a2 + 8) entropyWhereA:0xFFFFLL b:*(unsigned __int16 *)(a1 + 40)];
  double result = v3;
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __33___ATXAppLaunchHistogram_entropy__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a2 + 8) entropyWhereA:0xFFFFLL b:0xFFFFLL];
  double result = v3;
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __37___ATXAppLaunchHistogram_bucketCount__block_invoke(uint64_t result, uint64_t a2)
{
  *(_WORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_WORD *)(a2 + 16);
  return result;
}

@end