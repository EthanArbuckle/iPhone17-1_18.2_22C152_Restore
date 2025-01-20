@interface HKBloodPressureDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (id)_chartPointsWithSystolicResults:(id)a3 diastolicResults:(id)a4 blockStart:(id)a5 blockEnd:(id)a6 sourceTimeZone:(id)a7;
- (id)_earliestDateForSystolicResults:(id)a3 diastolicResults:(id)a4;
- (id)_latestDateForSystolicResults:(id)a3 diastolicResults:(id)a4;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (id)userInfoCreationBlock;
- (unint64_t)queryStatisticsOption;
- (void)setUserInfoCreationBlock:(id)a3;
@end

@implementation HKBloodPressureDataSource

- (id)queryDescription
{
  return @"HKBloodPressure";
}

- (unint64_t)queryStatisticsOption
{
  return 12;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v33 = a4;
  v7 = (void *)MEMORY[0x1E4F2B3C0];
  v8 = [v6 startDate];
  v9 = [v6 endDate];
  v10 = [v7 predicateForSamplesWithStartDate:v8 endDate:v9 options:0];

  id v11 = objc_alloc(MEMORY[0x1E4F2B5C8]);
  v12 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A620]];
  unint64_t v13 = [(HKBloodPressureDataSource *)self queryStatisticsOption];
  v14 = [v6 startDate];
  v15 = [v6 statisticsInterval];
  v16 = (void *)[v11 initWithQuantityType:v12 quantitySamplePredicate:v10 options:v13 anchorDate:v14 intervalComponents:v15];

  id v17 = objc_alloc(MEMORY[0x1E4F2B5C8]);
  v18 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A618]];
  unint64_t v19 = [(HKBloodPressureDataSource *)self queryStatisticsOption];
  v20 = [v6 startDate];
  v21 = [v6 statisticsInterval];
  v22 = (void *)[v17 initWithQuantityType:v18 quantitySamplePredicate:v10 options:v19 anchorDate:v20 intervalComponents:v21];

  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__10;
  v53[4] = __Block_byref_object_dispose__10;
  id v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__10;
  v51[4] = __Block_byref_object_dispose__10;
  id v52 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__10;
  v49[4] = __Block_byref_object_dispose__10;
  id v50 = 0;
  v23 = HKCreateSerialDispatchQueue();
  v24 = (void *)MEMORY[0x1E4F2B970];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke;
  v44[3] = &unk_1E6D53C50;
  v46 = v53;
  v47 = v51;
  id v25 = v33;
  id v45 = v25;
  v48 = v49;
  v26 = [v24 counterWithTargetCount:2 queue:v23 completion:v44];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_2;
  v39[3] = &unk_1E6D53CA0;
  id v27 = v23;
  id v40 = v27;
  v42 = v53;
  v43 = v49;
  id v28 = v26;
  id v41 = v28;
  [v16 setInitialResultsHandler:v39];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_4;
  v34[3] = &unk_1E6D53CA0;
  id v29 = v27;
  id v35 = v29;
  v37 = v51;
  v38 = v49;
  id v30 = v28;
  id v36 = v30;
  [v22 setInitialResultsHandler:v34];
  [v16 setDebugIdentifier:@"charting (bp systolic)"];
  [v22 setDebugIdentifier:@"charting (bp diastolic)"];
  v55[0] = v16;
  v55[1] = v22;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(v53, 8);
  return v31;
}

void __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke(void *a1)
{
  v4 = objc_alloc_init(HKCodableChartBloodPressureDataSourceQueryData);
  v2 = [*(id *)(*(void *)(a1[5] + 8) + 40) codableCollection];
  [(HKCodableChartBloodPressureDataSourceQueryData *)v4 setSystolicStatisticsCollection:v2];

  v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) codableCollection];
  [(HKCodableChartBloodPressureDataSourceQueryData *)v4 setDiastolicStatisticsCollection:v3];

  (*(void (**)(void))(a1[4] + 16))();
}

void __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v8 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_3;
  block[3] = &unk_1E6D53C78;
  uint64_t v17 = *(void *)(a1 + 56);
  id v14 = v6;
  id v15 = v7;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v16 = v12;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

uint64_t __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8);
  v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v4 = v5;
  if (!v5) {
    v4 = *(void **)(a1 + 40);
  }
  objc_storeStrong(v3, v4);
  id v6 = *(void **)(a1 + 48);
  return [v6 decrementCounter];
}

void __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v8 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_5;
  block[3] = &unk_1E6D53C78;
  uint64_t v17 = *(void *)(a1 + 56);
  id v14 = v6;
  id v15 = v7;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v16 = v12;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

uint64_t __65__HKBloodPressureDataSource_queriesForRequest_completionHandler___block_invoke_5(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8);
  v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v4 = v5;
  if (!v5) {
    v4 = *(void **)(a1 + 40);
  }
  objc_storeStrong(v3, v4);
  id v6 = *(void **)(a1 + 48);
  return [v6 decrementCounter];
}

- (id)_chartPointsWithSystolicResults:(id)a3 diastolicResults:(id)a4 blockStart:(id)a5 blockEnd:(id)a6 sourceTimeZone:(id)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v52 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke;
  aBlock[3] = &unk_1E6D53D18;
  id v17 = v13;
  id v62 = v17;
  id v18 = v14;
  id v63 = v18;
  id v19 = v16;
  id v64 = v19;
  v20 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  v21 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A620]];
  v22 = v20[2](v20, v21, v12);
  v51 = v12;
  [v12 enumerateStatisticsFromDate:v17 toDate:v18 withBlock:v22];

  v23 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A618]];
  v47 = v20;
  v24 = v20[2](v20, v23, v52);
  v49 = v18;
  id v50 = v17;
  [v52 enumerateStatisticsFromDate:v17 toDate:v18 withBlock:v24];

  v56 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  id v25 = [MEMORY[0x1E4F2B618] unitFromString:@"mmHg"];
  v55 = objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v48 = v19;
  id obj = [v19 allValues];
  uint64_t v26 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v54 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v58 != v54) {
          objc_enumerationMutation(obj);
        }
        id v29 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        id v30 = objc_alloc_init(HKBloodPressureChartPoint);
        v31 = [v29 systolic];

        if (v31)
        {
          v32 = [HKHealthChartPoint alloc];
          id v33 = [v29 systolic];
          v34 = [(HKHealthChartPoint *)v32 initWithStatistics:v33 options:[(HKBloodPressureDataSource *)self queryStatisticsOption] unit:v25 displayType:v56 sourceTimeZone:v15];

          id v35 = [(HKHealthChartPoint *)v34 xValueAsGenericType];
          [(HKBloodPressureChartPoint *)v30 setSystolicChartPoint:v34];
        }
        else
        {
          id v35 = 0;
        }
        id v36 = [v29 diastolic];

        if (v36)
        {
          v37 = [HKHealthChartPoint alloc];
          v38 = [v29 diastolic];
          v39 = [(HKHealthChartPoint *)v37 initWithStatistics:v38 options:[(HKBloodPressureDataSource *)self queryStatisticsOption] unit:v25 displayType:v56 sourceTimeZone:v15];

          if (!v35)
          {
            id v35 = [(HKHealthChartPoint *)v39 xValueAsGenericType];
          }
          [(HKBloodPressureChartPoint *)v30 setDiastolicChartPoint:v39];
        }
        id v40 = objc_msgSend(v35, "hk_dateFromSourceTimeZone:", v15);
        [(HKBloodPressureChartPoint *)v30 setDate:v40];

        userInfoCreationBlock = (void (**)(id, void *, void *))self->_userInfoCreationBlock;
        if (userInfoCreationBlock)
        {
          v42 = [v29 systolic];
          v43 = [v29 diastolic];
          v44 = userInfoCreationBlock[2](userInfoCreationBlock, v42, v43);
          [(HKBloodPressureChartPoint *)v30 setUserInfo:v44];
        }
        [v55 addObject:v30];
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v27);
  }

  [v55 sortUsingComparator:&__block_literal_global_43];
  id v45 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v45 setChartPoints:v55];

  return v45;
}

id __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke_2;
  aBlock[3] = &unk_1E6D53CF0;
  id v12 = a1[4];
  id v13 = a1[5];
  id v14 = v6;
  id v15 = a1[6];
  id v16 = v5;
  id v7 = v5;
  id v8 = v6;
  id v9 = _Block_copy(aBlock);

  return v9;
}

void __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke_2(id *a1)
{
  [a1[4] timeIntervalSinceReferenceDate];
  uint64_t v3 = v2;
  [a1[5] timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;
  id v6 = [a1[6] statistics];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke_3;
  v7[3] = &unk_1E6D53CC8;
  uint64_t v10 = v3;
  uint64_t v11 = v5;
  id v8 = a1[7];
  id v9 = a1[8];
  [v6 enumerateObjectsUsingBlock:v7];
}

void __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke_3(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = [v15 startDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;
  double v6 = *(double *)(a1 + 48);

  id v7 = [v15 endDate];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;
  double v10 = *(double *)(a1 + 56);

  uint64_t v11 = v15;
  if (v5 >= v6 && v9 <= v10)
  {
    id v13 = [v15 startDate];
    id v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
    if (!v14)
    {
      id v14 = objc_alloc_init(_HKBloodPressureWrapper);
      [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v13];
    }
    if ([*(id *)(a1 + 40) code] == 16) {
      [(_HKBloodPressureWrapper *)v14 setSystolic:v15];
    }
    else {
      [(_HKBloodPressureWrapper *)v14 setDiastolic:v15];
    }

    uint64_t v11 = v15;
  }
}

uint64_t __113__HKBloodPressureDataSource__chartPointsWithSystolicResults_diastolicResults_blockStart_blockEnd_sourceTimeZone___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 date];
  double v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 1;
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v25[3] = &unk_1E6D53D60;
  uint64_t v27 = self;
  id v28 = v10;
  id v26 = v8;
  id v11 = v10;
  id v12 = v8;
  id v13 = [(HKBloodPressureDataSource *)self queriesForRequest:v12 completionHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_324;
  v23[3] = &unk_1E6D525F0;
  id v14 = v9;
  id v24 = v14;
  [v13 enumerateObjectsUsingBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6D513B0;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = _Block_copy(v20);
  id v18 = _Block_copy(v17);

  return v18;
}

void __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
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
        uint64_t v12 = *MEMORY[0x1E4F29938];
        id v13 = [v7 localizedDescription];
        int v21 = 138412802;
        id v22 = v11;
        __int16 v23 = 2112;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        id v26 = v13;
        _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v21, 0x20u);
      }
    }
    id v14 = *(void **)(a1 + 40);
    id v15 = [*(id *)(a1 + 32) startDate];
    id v16 = [*(id *)(a1 + 32) endDate];
    id v17 = [*(id *)(a1 + 32) statisticsInterval];
    id v18 = [v5 data];
    id v19 = [v14 codableQueryDataWithType:3 startDate:v15 endDate:v16 statisticsInterval:v17 queryDataObject:v18];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v20, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_324(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) executeQuery:a2];
}

void __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E6D525F0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

uint64_t __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stopQuery:a2];
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5 = a3;
  if ([v5 hasTimeZoneName])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAF0]);
    uint64_t v7 = [v5 timeZoneName];
    id v8 = (void *)[v6 initWithName:v7];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [HKCodableChartBloodPressureDataSourceQueryData alloc];
  id v10 = [v5 queryDataObject];
  id v11 = [(HKCodableChartBloodPressureDataSourceQueryData *)v9 initWithData:v10];

  uint64_t v12 = (void *)MEMORY[0x1E4F2B5B8];
  id v13 = [(HKCodableChartBloodPressureDataSourceQueryData *)v11 systolicStatisticsCollection];
  id v14 = [v12 statisticsCollectionWithCodableCollection:v13];

  id v15 = (void *)MEMORY[0x1E4F2B5B8];
  id v16 = [(HKCodableChartBloodPressureDataSourceQueryData *)v11 diastolicStatisticsCollection];
  id v17 = [v15 statisticsCollectionWithCodableCollection:v16];

  id v18 = [(HKBloodPressureDataSource *)self _earliestDateForSystolicResults:v14 diastolicResults:v17];
  id v19 = [(HKBloodPressureDataSource *)self _latestDateForSystolicResults:v14 diastolicResults:v17];
  v20 = [(HKBloodPressureDataSource *)self _chartPointsWithSystolicResults:v14 diastolicResults:v17 blockStart:v18 blockEnd:v19 sourceTimeZone:v8];

  return v20;
}

- (id)_earliestDateForSystolicResults:(id)a3 diastolicResults:(id)a4
{
  id v5 = a4;
  id v6 = [a3 statistics];
  uint64_t v7 = [v6 firstObject];
  id v8 = [v7 startDate];

  id v9 = [v5 statistics];

  id v10 = [v9 firstObject];
  id v11 = [v10 startDate];

  if (v8)
  {
    uint64_t v12 = v8;
    if (v11)
    {
      if (objc_msgSend(v8, "hk_isBeforeDate:", v11)) {
        uint64_t v12 = v8;
      }
      else {
        uint64_t v12 = v11;
      }
    }
    id v13 = v12;

    id v11 = v13;
  }

  return v11;
}

- (id)_latestDateForSystolicResults:(id)a3 diastolicResults:(id)a4
{
  id v5 = a4;
  id v6 = [a3 statistics];
  uint64_t v7 = [v6 lastObject];
  id v8 = [v7 endDate];

  id v9 = [v5 statistics];

  id v10 = [v9 lastObject];
  id v11 = [v10 endDate];

  if (v8)
  {
    uint64_t v12 = v8;
    if (v11)
    {
      if (objc_msgSend(v8, "hk_isBeforeDate:", v11)) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v8;
      }
    }
    id v13 = v12;

    id v11 = v13;
  }

  return v11;
}

- (id)userInfoCreationBlock
{
  return self->_userInfoCreationBlock;
}

- (void)setUserInfoCreationBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

void __95__HKBloodPressureDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = HKStringForChartDataSourceQueryRequestAudience([v4 audience]);
  uint64_t v7 = *MEMORY[0x1E4F29938];
  id v8 = [a3 localizedDescription];
  int v9 = 138412802;
  id v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  id v14 = v8;
  _os_log_error_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v9, 0x20u);
}

@end