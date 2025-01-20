@interface CCSetMetrics
+ (BOOL)shouldReportAnalyticsEventWithName:(id)a3;
+ (double)_populationStandardDeviation:(shared_ptr<std:(double)a4 :vector<unsigned short>>)a3 mean:;
+ (id)_computeMetricsForSet:(id)a3 shouldDefer:(id)a4 error:(id *)a5;
+ (void)computeAndReportMetricsForAllSets:(id)a3 shouldDefer:(id)a4;
+ (void)reportAnalyticsEvent:(id)a3 withName:(id)a4;
- (CCSetMetrics)init;
@end

@implementation CCSetMetrics

- (CCSetMetrics)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

+ (void)computeAndReportMetricsForAllSets:(id)a3 shouldDefer:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v27 = a3;
  v5 = (unsigned int (**)(void))a4;
  if (+[CCSetMetrics shouldReportAnalyticsEventWithName:@"com.apple.CascadeSets.SetDistribution"])
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v7;
      _os_log_impl(&dword_249B92000, v6, OS_LOG_TYPE_DEFAULT, "Preparing to enumerate and compute metrics for %@ set(s)", buf, 0xCu);
    }
    v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v9 = v27;
    v28 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v10)
    {
      uint64_t v29 = *(void *)v38;
      *(void *)&long long v11 = 138412546;
      long long v26 = v11;
LABEL_6:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(v9);
        }
        v13 = *(__CFString **)(*((void *)&v37 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x24C5B1100]();
        if (v5 && v5[2](v5))
        {
          v15 = __biome_log_for_category();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            +[CCSetMetrics computeAndReportMetricsForAllSets:shouldDefer:](&v35, v36, v15);
          }
          int v16 = 1;
        }
        else
        {
          id v34 = 0;
          +[CCSetMetrics _computeMetricsForSet:shouldDefer:error:](CCSetMetrics, "_computeMetricsForSet:shouldDefer:error:", v13, v5, &v34, v26);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v15 = v34;
          if (v17)
          {
            v18 = __biome_log_for_category();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v17;
              _os_log_impl(&dword_249B92000, v18, OS_LOG_TYPE_DEFAULT, "Computed set metrics: %@", buf, 0xCu);
            }

            [v28 addObject:v17];
            int v16 = 0;
          }
          else
          {
            v19 = __biome_log_for_category();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v26;
              v43 = v13;
              __int16 v44 = 2112;
              v45 = v15;
              _os_log_error_impl(&dword_249B92000, v19, OS_LOG_TYPE_ERROR, "Failed to compute metrics for set: %@ error: %@", buf, 0x16u);
            }

            int v16 = 1;
          }
        }
        if (v16) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v10) {
            goto LABEL_6;
          }
          goto LABEL_25;
        }
      }
    }
    else
    {
LABEL_25:

      v20 = __biome_log_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v28, "count"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v43 = v21;
        _os_log_impl(&dword_249B92000, v20, OS_LOG_TYPE_DEFAULT, "Reporting metrics for %@ set(s)", buf, 0xCu);
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v9 = v28;
      uint64_t v22 = [v9 countByEnumeratingWithState:&v30 objects:v41 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v31 != v23) {
              objc_enumerationMutation(v9);
            }
            +[CCSetMetrics reportAnalyticsEvent:*(void *)(*((void *)&v30 + 1) + 8 * i), @"com.apple.CascadeSets.SetDistribution", v26 withName];
          }
          uint64_t v22 = [v9 countByEnumeratingWithState:&v30 objects:v41 count:16];
        }
        while (v22);
      }
    }

    v25 = v28;
  }
  else
  {
    v25 = __biome_log_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = @"com.apple.CascadeSets.SetDistribution";
      _os_log_impl(&dword_249B92000, v25, OS_LOG_TYPE_DEFAULT, "Skipping metrics computation as the event: %@ is not used.", buf, 0xCu);
    }
  }
}

+ (id)_computeMetricsForSet:(id)a3 shouldDefer:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__6;
  uint8_t v35 = __Block_byref_object_dispose__6;
  id v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  long long v26 = [[CCSetDistribution alloc] initWithSet:v7];
  v9 = [v7 changePublisherWithUseCase:*MEMORY[0x263F29E30]];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __56__CCSetMetrics__computeMetricsForSet_shouldDefer_error___block_invoke;
  v20[3] = &unk_26527A920;
  v20[4] = &v27;
  v20[5] = &v31;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  int v16 = __56__CCSetMetrics__computeMetricsForSet_shouldDefer_error___block_invoke_2;
  v17 = &unk_26527A948;
  v19 = &v21;
  id v10 = v8;
  id v18 = v10;
  id v11 = (id)[v9 sinkWithCompletion:v20 shouldContinue:&v14];

  if (*((unsigned char *)v28 + 24))
  {
    uint64_t v12 = objc_msgSend((id)v22[5], "compute", v14, v15, v16, v17);
  }
  else
  {
    CCSetError(a5, (id)v32[5]);
    uint64_t v12 = 0;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v12;
}

void __56__CCSetMetrics__computeMetricsForSet_shouldDefer_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 state])
  {
    uint64_t v3 = [v6 error];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

BOOL __56__CCSetMetrics__computeMetricsForSet_shouldDefer_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addSetChange:v3];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = !v4 || ((*(uint64_t (**)(void))(v4 + 16))() & 1) == 0;

  return v5;
}

+ (double)_populationStandardDeviation:(shared_ptr<std:(double)a4 :vector<unsigned short>>)a3 mean:
{
  BOOL v5 = **(unsigned __int16 ***)a3.__ptr_;
  uint64_t v4 = *(unsigned __int16 **)(*(void *)a3.__ptr_ + 8);
  if (v4 == v5) {
    return 0.0;
  }
  uint64_t v6 = v4 - v5;
  double v7 = 0.0;
  do
  {
    unsigned int v8 = *v5++;
    double v7 = v7 + ((double)v8 - a4) * ((double)v8 - a4);
  }
  while (v5 != v4);
  return sqrt(v7 / (double)(unint64_t)v6);
}

+ (BOOL)shouldReportAnalyticsEventWithName:(id)a3
{
  return MEMORY[0x270F18A30](a3, a2);
}

+ (void)reportAnalyticsEvent:(id)a3 withName:(id)a4
{
}

+ (void)computeAndReportMetricsForAllSets:(os_log_t)log shouldDefer:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "Aborting due to deferral signal", buf, 2u);
}

@end