@interface DKHistogramQuery
@end

@implementation DKHistogramQuery

void __58___DKHistogramQuery__fetchRemoteResultsWithStorage_error___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v3 = (void *)MEMORY[0x1E4F1C0A8];
  v4 = +[_DKHistogram entityName];
  v5 = [v3 entityForName:v4 inManagedObjectContext:*(void *)(a1 + 32)];
  [v2 setEntity:v5];

  [v2 setPredicate:*(void *)(a1 + 40)];
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:0];
  v30[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v2 setSortDescriptors:v7];

  objc_msgSend(v2, "setFetchLimit:", objc_msgSend(*(id *)(a1 + 48), "remoteHistogramLimit"));
  v8 = +[_CDMutablePerfMetric perfMetricForFetchRequest:type:]((uint64_t)_CDMutablePerfMetric, v2, @"Histogram Queries");
  v21[0] = 0;
  v21[1] = 0;
  v9 = *(void **)(a1 + 32);
  id v20 = 0;
  v10 = [v9 executeFetchRequest:v2 error:&v20];
  id v11 = v20;
  if (!_DKEventQueryPerformanceTesting && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [v2 fetchLimit];
    [*(id *)(a1 + 56) timeIntervalSinceNow];
    double v14 = v13;
    uint64_t v15 = [v10 count];
    v16 = [v2 predicate];
    *(_DWORD *)buf = 134218754;
    uint64_t v23 = v12;
    __int16 v24 = 2048;
    double v25 = -v14;
    __int16 v26 = 2048;
    uint64_t v27 = v15;
    __int16 v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_DKHistogramQuery _fetchRemoteResultsWithStorage finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %@ ", buf, 0x2Au);
  }
  if (v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v11);
    CDPerfMetricEndTimingAndIncrementErrorCount(v8, (uint64_t)v21);
  }
  else
  {
    CDPerfMetricEndTimingAndSetResultCount(v8, (uint64_t)v21, [v10 count]);
    if ([v10 count])
    {
      uint64_t v17 = -[_DKHistogramQuery _histogramFromManagedObjects:](*(_DKHistogram **)(a1 + 48), v10);
      uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
      v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
  }
}

uint64_t __55___DKHistogramQuery_executeUsingCoreDataStorage_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __58___DKHistogramQuery__fetchRemoteResultsWithStorage_error___block_invoke_cold_1(void *a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = objc_begin_catch(a1);
  *a3 = v4;
  id v5 = v4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v6 = 138412290;
    id v7 = v5;
    _os_log_fault_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Execute fetch request caught:%@", (uint8_t *)&v6, 0xCu);
  }
}

@end