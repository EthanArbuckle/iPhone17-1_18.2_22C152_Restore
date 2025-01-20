@interface HKSleepChartDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (HKSleepChartDataSource)initWithHealthStore:(id)a3 representativeDisplayType:(id)a4 queryOptions:(unint64_t)a5 cacheIdentifier:(id)a6 queryIdentifier:(id)a7 calendar:(id)a8;
- (NSCalendar)calendar;
- (NSString)cacheIdentifier;
- (NSString)queryIdentifier;
- (id)_mappingFunctionForComparisonChartWithContext:(id)a3;
- (id)_mappingFunctionForConsistencyChartWithContext:(id)a3;
- (id)_mappingFunctionForDurationChartWithContext:(id)a3;
- (id)_mappingFunctionForStagesChartWithContext:(id)a3;
- (id)_mappingFunctionForStagesDurationChartWithContext:(id)a3;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)mappingFunctionForContext:(id)a3;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (unint64_t)queryOptions;
@end

@implementation HKSleepChartDataSource

- (HKSleepChartDataSource)initWithHealthStore:(id)a3 representativeDisplayType:(id)a4 queryOptions:(unint64_t)a5 cacheIdentifier:(id)a6 queryIdentifier:(id)a7 calendar:(id)a8
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)HKSleepChartDataSource;
  v18 = [(HKHealthQueryChartCacheDataSource *)&v21 initWithDisplayType:a4 healthStore:a3];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_calendar, a8);
    v19->_queryOptions = a5;
    objc_storeStrong((id *)&v19->_cacheIdentifier, a6);
    objc_storeStrong((id *)&v19->_queryIdentifier, a7);
  }

  return v19;
}

- (id)queryDescription
{
  return @"HKSleepDaySummaryQuery";
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1C9C8] date];
  v9 = [v6 startDate];
  int v10 = objc_msgSend(v9, "hk_isAfterDate:", v8);

  if (v10)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E4F29FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = objc_opt_class();
      id v14 = v13;
      id v15 = [(HKSleepChartDataSource *)self queryIdentifier];
      id v16 = [v6 startDate];
      *(_DWORD *)buf = 138543874;
      v54 = v13;
      __int16 v55 = 2114;
      v56 = v15;
      __int16 v57 = 2114;
      uint64_t v58 = (uint64_t)v16;
      _os_log_impl(&dword_1E0B26000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@.%{public}@] start date in the future %{public}@", buf, 0x20u);
    }
    id v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v18 = [v6 startDate];
    v19 = [(HKSleepChartDataSource *)self calendar];
    uint64_t v20 = objc_msgSend(v18, "hk_morningIndexWithCalendar:", v19);

    objc_super v21 = [v6 endDate];
    v22 = [(HKSleepChartDataSource *)self calendar];
    uint64_t v23 = objc_msgSend(v21, "hk_morningIndexWithCalendar:", v22);

    uint64_t v24 = v23 - v20;
    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x1E4F29FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v47 = v23 - v20;
      uint64_t v26 = v23 - 1;
      v27 = v25;
      uint64_t v28 = v20;
      v29 = objc_opt_class();
      id v46 = v29;
      [(HKSleepChartDataSource *)self queryIdentifier];
      v30 = id v48 = v7;
      v31 = [v6 startDate];
      v32 = [v6 endDate];
      *(_DWORD *)buf = 138544642;
      v54 = v29;
      uint64_t v20 = v28;
      __int16 v55 = 2114;
      v56 = v30;
      __int16 v57 = 2048;
      uint64_t v58 = v28;
      __int16 v59 = 2048;
      uint64_t v60 = v26;
      uint64_t v24 = v47;
      __int16 v61 = 2114;
      v62 = v31;
      __int16 v63 = 2114;
      v64 = v32;
      _os_log_impl(&dword_1E0B26000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@.%{public}@] creating query for day indeces: %ld-%ld dates: %{public}@-%{public}@", buf, 0x3Eu);

      id v7 = v48;
    }
    unint64_t v33 = [(HKSleepChartDataSource *)self queryOptions];
    v34 = [v6 statisticsInterval];
    uint64_t v35 = [v34 month];

    if (v35 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v36 = [v6 statisticsInterval];
      uint64_t v37 = [v36 weekOfYear];

      if (v37 != 0x7FFFFFFFFFFFFFFFLL) {
        v33 |= 8uLL;
      }
    }
    else
    {
      v33 |= 0x10uLL;
    }
    id v38 = objc_alloc(MEMORY[0x1E4F2B538]);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __62__HKSleepChartDataSource_queriesForRequest_completionHandler___block_invoke;
    v49[3] = &unk_1E6D530D0;
    v49[4] = self;
    id v50 = v8;
    id v51 = v7;
    v39 = objc_msgSend(v38, "initWithMorningIndexRange:ascending:limit:options:resultsHandler:", v20, v24, 1, 0, v33, v49);
    id v40 = objc_alloc(MEMORY[0x1E4F2B530]);
    v41 = [(HKSleepChartDataSource *)self queryIdentifier];
    v42 = (void *)[v40 initWithIdentifier:v41 mode:1];
    [v39 setCacheSettings:v42];

    v43 = [(HKSleepChartDataSource *)self queryIdentifier];
    [v39 setDebugIdentifier:v43];

    v44 = [(HKSleepChartDataSource *)self calendar];
    [v39 setCalendarOverrides:v44];

    v52 = v39;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  }
  return v17;
}

void __62__HKSleepChartDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    int v10 = (void *)*MEMORY[0x1E4F29FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_ERROR)) {
      __62__HKSleepChartDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(a1, v10, (uint64_t)v9);
    }
  }
  v11 = *(void **)(a1 + 40);
  v12 = [*(id *)(a1 + 32) calendar];
  uint64_t v13 = objc_msgSend(v11, "hk_morningIndexWithCalendar:", v12);

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __62__HKSleepChartDataSource_queriesForRequest_completionHandler___block_invoke_281;
  v32[3] = &__block_descriptor_40_e27_B16__0__HKSleepDaySummary_8l;
  v32[4] = v13;
  id v14 = objc_msgSend(v8, "hk_firstObjectPassingTest:", v32);
  id v15 = v14;
  if (v14)
  {
    [v14 sleepDuration];
    if (v16 <= 0.0)
    {
      [v15 inBedDuration];
      double v25 = v24;
      _HKInitializeLogging();
      uint64_t v26 = (void *)*MEMORY[0x1E4F29FA0];
      BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT);
      if (v25 <= 0.0)
      {
        if (v27)
        {
          v18 = v26;
          v30 = objc_opt_class();
          v31 = *(void **)(a1 + 32);
          id v21 = v30;
          v22 = [v31 queryIdentifier];
          *(_DWORD *)buf = 138543874;
          v34 = v30;
          __int16 v35 = 2114;
          v36 = v22;
          __int16 v37 = 2048;
          uint64_t v38 = v13;
          uint64_t v23 = "[%{public}@.%{public}@]] chart has no data today %ld";
          goto LABEL_13;
        }
      }
      else if (v27)
      {
        v18 = v26;
        uint64_t v28 = objc_opt_class();
        v29 = *(void **)(a1 + 32);
        id v21 = v28;
        v22 = [v29 queryIdentifier];
        *(_DWORD *)buf = 138543874;
        v34 = v28;
        __int16 v35 = 2114;
        v36 = v22;
        __int16 v37 = 2048;
        uint64_t v38 = v13;
        uint64_t v23 = "[%{public}@.%{public}@] chart has in bed today %ld";
        goto LABEL_13;
      }
    }
    else
    {
      _HKInitializeLogging();
      id v17 = (void *)*MEMORY[0x1E4F29FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = objc_opt_class();
        uint64_t v20 = *(void **)(a1 + 32);
        id v21 = v19;
        v22 = [v20 queryIdentifier];
        *(_DWORD *)buf = 138543874;
        v34 = v19;
        __int16 v35 = 2114;
        v36 = v22;
        __int16 v37 = 2048;
        uint64_t v38 = v13;
        uint64_t v23 = "[%{public}@.%{public}@]] chart has sleep data today %ld";
LABEL_13:
        _os_log_impl(&dword_1E0B26000, v18, OS_LOG_TYPE_DEFAULT, v23, buf, 0x20u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

BOOL __62__HKSleepChartDataSource_queriesForRequest_completionHandler___block_invoke_281(uint64_t a1, void *a2)
{
  return [a2 morningIndex] == *(void *)(a1 + 32);
}

- (id)mappingFunctionForContext:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    switch([v4 chartType])
    {
      case 0:
      case 2:
        uint64_t v5 = [(HKSleepChartDataSource *)self _mappingFunctionForDurationChartWithContext:v4];
        break;
      case 1:
      case 3:
        uint64_t v5 = [(HKSleepChartDataSource *)self _mappingFunctionForConsistencyChartWithContext:v4];
        break;
      case 4:
        uint64_t v5 = [(HKSleepChartDataSource *)self _mappingFunctionForStagesChartWithContext:v4];
        break;
      case 5:
        uint64_t v5 = [(HKSleepChartDataSource *)self _mappingFunctionForStagesDurationChartWithContext:v4];
        break;
      case 6:
        uint64_t v5 = [(HKSleepChartDataSource *)self _mappingFunctionForComparisonChartWithContext:v4];
        break;
      default:
        goto LABEL_4;
    }
    id v6 = (void *)v5;
  }
  else
  {
LABEL_4:
    id v6 = 0;
  }

  return v6;
}

- (id)_mappingFunctionForDurationChartWithContext:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__HKSleepChartDataSource__mappingFunctionForDurationChartWithContext___block_invoke;
  aBlock[3] = &unk_1E6D530F8;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

HKGraphSeriesDataBlock *__70__HKSleepChartDataSource__mappingFunctionForDurationChartWithContext___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = _DaySummariesForMappingData(a2);
    id v4 = objc_alloc_init(HKGraphSeriesDataBlock);
    uint64_t v5 = +[HKSleepDurationChartPoint chartPointsForSummaries:v3 context:*(void *)(a1 + 32)];
    [(HKGraphSeriesDataBlock *)v4 setChartPoints:v5];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_mappingFunctionForComparisonChartWithContext:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HKSleepChartDataSource__mappingFunctionForComparisonChartWithContext___block_invoke;
  aBlock[3] = &unk_1E6D530F8;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

HKGraphSeriesDataBlock *__72__HKSleepChartDataSource__mappingFunctionForComparisonChartWithContext___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = _DaySummariesForMappingData(a2);
    id v4 = objc_alloc_init(HKGraphSeriesDataBlock);
    uint64_t v5 = [*(id *)(a1 + 32) timeScope];
    id v6 = &off_1E6D4FFB0;
    if (v5 != 6) {
      id v6 = off_1E6D4FFF0;
    }
    id v7 = [(__objc2_class *)*v6 chartPointsForSummaries:v3 context:*(void *)(a1 + 32)];
    [(HKGraphSeriesDataBlock *)v4 setChartPoints:v7];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_mappingFunctionForConsistencyChartWithContext:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__HKSleepChartDataSource__mappingFunctionForConsistencyChartWithContext___block_invoke;
  aBlock[3] = &unk_1E6D530F8;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

HKGraphSeriesDataBlock *__73__HKSleepChartDataSource__mappingFunctionForConsistencyChartWithContext___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = _DaySummariesForMappingData(a2);
    id v4 = objc_alloc_init(HKGraphSeriesDataBlock);
    uint64_t v5 = +[HKSleepPeriodChartPoint chartPointsForSummaries:v3 context:*(void *)(a1 + 32)];
    [(HKGraphSeriesDataBlock *)v4 setChartPoints:v5];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_mappingFunctionForStagesChartWithContext:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HKSleepChartDataSource__mappingFunctionForStagesChartWithContext___block_invoke;
  aBlock[3] = &unk_1E6D530F8;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

HKGraphSeriesDataBlock *__68__HKSleepChartDataSource__mappingFunctionForStagesChartWithContext___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = _DaySummariesForMappingData(a2);
    id v4 = objc_alloc_init(HKGraphSeriesDataBlock);
    uint64_t v5 = [*(id *)(a1 + 32) timeScope];
    id v6 = off_1E6D50028;
    if (v5 != 6) {
      id v6 = off_1E6D50020;
    }
    id v7 = [(__objc2_class *)*v6 chartPointsForSummaries:v3 context:*(void *)(a1 + 32)];
    [(HKGraphSeriesDataBlock *)v4 setChartPoints:v7];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_mappingFunctionForStagesDurationChartWithContext:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HKSleepChartDataSource__mappingFunctionForStagesDurationChartWithContext___block_invoke;
  aBlock[3] = &unk_1E6D530F8;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

HKGraphSeriesDataBlock *__76__HKSleepChartDataSource__mappingFunctionForStagesDurationChartWithContext___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = _DaySummariesForMappingData(a2);
    id v4 = objc_alloc_init(HKGraphSeriesDataBlock);
    uint64_t v5 = +[HKSleepStageDurationChartPoint chartPointsForSummaries:v3 context:*(void *)(a1 + 32)];
    [(HKGraphSeriesDataBlock *)v4 setChartPoints:v5];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 0;
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __92__HKSleepChartDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v30[3] = &unk_1E6D53120;
  id v11 = v8;
  id v31 = v11;
  id v12 = v10;
  v32 = self;
  id v33 = v12;
  uint64_t v13 = [(HKSleepChartDataSource *)self queriesForRequest:v11 completionHandler:v30];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        [v9 executeQuery:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v15);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __92__HKSleepChartDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_297;
  v23[3] = &unk_1E6D513B0;
  id v24 = v13;
  id v25 = v9;
  id v18 = v9;
  id v19 = v13;
  uint64_t v20 = _Block_copy(v23);
  id v21 = _Block_copy(v20);

  return v21;
}

void __92__HKSleepChartDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {
      _HKInitializeLogging();
      id v8 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_INFO))
      {
        id v9 = *(void **)(a1 + 32);
        id v10 = v8;
        id v11 = HKStringForChartDataSourceQueryRequestAudience([v9 audience]);
        uint64_t v12 = *MEMORY[0x1E4F29870];
        uint64_t v13 = [v7 localizedDescription];
        int v22 = 138412802;
        uint64_t v23 = v11;
        __int16 v24 = 2112;
        uint64_t v25 = v12;
        __int16 v26 = 2112;
        long long v27 = v13;
        _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v22, 0x20u);
      }
    }
    uint64_t v14 = +[HKCodableSleepSummaryCollection sleepSummaryCollectionFromDaySummaries:v5];
    uint64_t v15 = *(void **)(a1 + 40);
    uint64_t v16 = [*(id *)(a1 + 32) startDate];
    id v17 = [*(id *)(a1 + 32) endDate];
    id v18 = [*(id *)(a1 + 32) statisticsInterval];
    id v19 = [v14 data];
    uint64_t v20 = [v15 codableQueryDataWithType:9 startDate:v16 endDate:v17 statisticsInterval:v18 queryDataObject:v19];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    id v21 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __92__HKSleepChartDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v21, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __92__HKSleepChartDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_297(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "stopQuery:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v4 = a3;
  if ([v4 hasTimeZoneName])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CAF0]);
    uint64_t v6 = [v4 timeZoneName];
    long long v7 = (void *)[v5 initWithName:v6];
  }
  else
  {
    long long v7 = 0;
  }
  long long v8 = [HKCodableSleepSummaryCollection alloc];
  long long v9 = [v4 queryDataObject];
  long long v10 = [(HKCodableSleepSummaryCollection *)v8 initWithData:v9];

  id v11 = objc_alloc_init(HKGraphSeriesDataBlock);
  uint64_t v12 = [(HKCodableSleepSummaryCollection *)v10 daySummariesWithSourceTimeZone:v7];
  [(HKGraphSeriesDataBlock *)v11 setChartPoints:v12];

  return v11;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSString)queryIdentifier
{
  return self->_queryIdentifier;
}

- (unint64_t)queryOptions
{
  return self->_queryOptions;
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

void __62__HKSleepChartDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = objc_opt_class();
  long long v7 = *(void **)(a1 + 32);
  id v8 = v6;
  long long v9 = [v7 queryIdentifier];
  int v10 = 138543874;
  id v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v9;
  __int16 v14 = 2114;
  uint64_t v15 = a3;
  _os_log_error_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_ERROR, "[%{public}@.%{public}@]: error fetching summaries %{public}@", (uint8_t *)&v10, 0x20u);
}

void __92__HKSleepChartDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = HKStringForChartDataSourceQueryRequestAudience([v4 audience]);
  uint64_t v7 = *MEMORY[0x1E4F29870];
  id v8 = [a3 localizedDescription];
  int v9 = 138412802;
  int v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  __int16 v14 = v8;
  _os_log_error_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: no day summaries were returned from query with error: %@", (uint8_t *)&v9, 0x20u);
}

@end