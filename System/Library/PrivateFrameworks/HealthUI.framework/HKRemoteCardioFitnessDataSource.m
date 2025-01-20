@interface HKRemoteCardioFitnessDataSource
- (HKRemoteCardioFitnessDataSource)initWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5;
- (id)_cardioFitnessUserInfoCreationBlockWithAge:(int64_t)a3 biologicalSex:(int64_t)a4;
- (id)_userInfoBlockWithUnitController:(id)a3 displayType:(id)a4;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
@end

@implementation HKRemoteCardioFitnessDataSource

- (HKRemoteCardioFitnessDataSource)initWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKRemoteCardioFitnessDataSource;
  v10 = [(HKQuantityTypeDataSource *)&v14 initWithUnitController:v8 options:2 displayType:v9 healthStore:a5];
  v11 = v10;
  if (v10)
  {
    v12 = [(HKRemoteCardioFitnessDataSource *)v10 _userInfoBlockWithUnitController:v8 displayType:v9];
    [(HKQuantityTypeDataSource *)v11 setUserInfoCreationBlock:v12];
  }
  return v11;
}

- (id)_userInfoBlockWithUnitController:(id)a3 displayType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__HKRemoteCardioFitnessDataSource__userInfoBlockWithUnitController_displayType___block_invoke;
  v11[3] = &unk_1E6D51B68;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = _Block_copy(v11);

  return v9;
}

HKInteractiveChartSinglePointData *__80__HKRemoteCardioFitnessDataSource__userInfoBlockWithUnitController_displayType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) unitForDisplayType:*(void *)(a1 + 40)];
  id v5 = [v3 averageQuantity];
  [v5 doubleValueForUnit:v4];
  double v7 = v6;

  uint64_t v8 = [v3 recordCount];
  id v9 = objc_alloc_init(HKInteractiveChartSinglePointData);
  [(HKInteractiveChartSinglePointData *)v9 setValue:v7];
  [(HKInteractiveChartSinglePointData *)v9 setUnit:v4];
  uint64_t v10 = [v3 minQuantity];
  if (v10)
  {
    v11 = (void *)v10;
    id v12 = [v3 maxQuantity];

    if (v12)
    {
      [(HKInteractiveChartSinglePointData *)v9 setRepresentsRange:1];
      id v13 = [v3 minQuantity];
      [v13 doubleValueForUnit:v4];
      -[HKInteractiveChartSinglePointData setMinValue:](v9, "setMinValue:");

      objc_super v14 = [v3 maxQuantity];
      [v14 doubleValueForUnit:v4];
      -[HKInteractiveChartSinglePointData setMaxValue:](v9, "setMaxValue:");

      uint64_t v8 = [v3 recordCount];
    }
  }
  [(HKInteractiveChartSinglePointData *)v9 setRecordCount:v8];
  v15 = [v3 statisticsInterval];
  [(HKInteractiveChartSinglePointData *)v9 setStatisticsInterval:v15];

  return v9;
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v24[3] = &unk_1E6D52450;
  id v25 = v8;
  id v28 = v10;
  id v11 = v9;
  id v26 = v11;
  v27 = self;
  id v12 = v10;
  id v13 = v8;
  objc_super v14 = [(HKQuantityTypeDataSource *)self queriesForRequest:v13 completionHandler:v24];
  v15 = [v14 firstObject];
  [v11 executeQuery:v15];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_288;
  v21[3] = &unk_1E6D513B0;
  id v22 = v11;
  id v23 = v14;
  id v16 = v14;
  id v17 = v11;
  v18 = _Block_copy(v21);
  v19 = _Block_copy(v18);

  return v19;
}

void __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
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
        uint64_t v12 = *MEMORY[0x1E4F2A918];
        id v13 = [v7 localizedDescription];
        *(_DWORD *)buf = 138412802;
        v30 = v11;
        __int16 v31 = 2112;
        uint64_t v32 = v12;
        __int16 v33 = 2112;
        v34 = v13;
        _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", buf, 0x20u);
      }
    }
    objc_super v14 = objc_msgSend(v5, "hk_map:", &__block_literal_global_15);
    v15 = objc_alloc_init(HKCodableChartQuantityDataSourceQueryData);
    id v16 = objc_alloc_init(HKCodableStatisticsCollection);
    [(HKCodableChartQuantityDataSourceQueryData *)v15 setStatisticsCollection:v16];

    id v17 = (void *)[v14 mutableCopy];
    v18 = [(HKCodableChartQuantityDataSourceQueryData *)v15 statisticsCollection];
    [v18 setStatistics:v17];

    id v19 = objc_alloc(MEMORY[0x1E4F2B040]);
    v20 = (void *)[v19 initWithFeatureIdentifier:*MEMORY[0x1E4F29D18] healthStore:*(void *)(a1 + 40)];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
    v23[3] = &unk_1E6D52428;
    id v24 = *(id *)(a1 + 40);
    id v25 = v15;
    uint64_t v26 = *(void *)(a1 + 48);
    id v27 = *(id *)(a1 + 32);
    id v28 = *(id *)(a1 + 56);
    v21 = v15;
    [v20 isCurrentOnboardingVersionCompletedWithCompletion:v23];
  }
  else
  {
    _HKInitializeLogging();
    id v22 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v22, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_278(uint64_t a1, void *a2)
{
  return [a2 codableStatistics];
}

void __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = [v5 BOOLValue];
  }
  else
  {
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2_cold_1((uint64_t)v6, v8);
    }
    int v7 = 0;
  }
  id v9 = objc_alloc_init(HKCodableChartCardioFitnessQueryData);
  id v10 = (void *)MEMORY[0x1E4F2ACA0];
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v12 = [v10 cardioFitnessPropertiesForDate:v11 healthStore:*(void *)(a1 + 32)];

  if (v7 && v12)
  {
    [(HKCodableChartCardioFitnessQueryData *)v9 setCardioFitnessLevelEnabled:1];
    -[HKCodableChartCardioFitnessQueryData setBiologicalSex:](v9, "setBiologicalSex:", [v12 biologicalSex]);
    uint64_t v13 = [v12 age];
  }
  else
  {
    [(HKCodableChartCardioFitnessQueryData *)v9 setCardioFitnessLevelEnabled:0];
    [(HKCodableChartCardioFitnessQueryData *)v9 setBiologicalSex:0];
    uint64_t v13 = 0;
  }
  [(HKCodableChartCardioFitnessQueryData *)v9 setAge:v13];
  [(HKCodableChartCardioFitnessQueryData *)v9 setQuantityData:*(void *)(a1 + 40)];
  objc_super v14 = *(void **)(a1 + 48);
  v15 = [*(id *)(a1 + 56) startDate];
  id v16 = [*(id *)(a1 + 56) endDate];
  id v17 = [*(id *)(a1 + 56) statisticsInterval];
  v18 = [(HKCodableChartCardioFitnessQueryData *)v9 data];
  id v19 = [v14 codableQueryDataWithType:12 startDate:v15 endDate:v16 statisticsInterval:v17 queryDataObject:v18];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_288(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) firstObject];
  [v1 stopQuery:v2];
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5 = a3;
  if ([v5 hasTimeZoneName])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAF0]);
    int v7 = [v5 timeZoneName];
    id v8 = (void *)[v6 initWithName:v7];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [HKCodableChartCardioFitnessQueryData alloc];
  id v10 = [v5 queryDataObject];
  id v11 = [(HKCodableChartCardioFitnessQueryData *)v9 initWithData:v10];

  if ([(HKCodableChartCardioFitnessQueryData *)v11 cardioFitnessLevelEnabled])
  {
    uint64_t v12 = [(HKRemoteCardioFitnessDataSource *)self _cardioFitnessUserInfoCreationBlockWithAge:[(HKCodableChartCardioFitnessQueryData *)v11 age] biologicalSex:[(HKCodableChartCardioFitnessQueryData *)v11 biologicalSex]];
    [(HKQuantityTypeDataSource *)self setUserInfoCreationBlock:v12];
  }
  uint64_t v13 = objc_alloc_init(HKGraphSeriesDataBlock);
  objc_super v14 = [(HKCodableChartCardioFitnessQueryData *)v11 quantityData];
  v15 = [v14 statisticsCollection];
  id v16 = [v15 statistics];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__HKRemoteCardioFitnessDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke;
  v20[3] = &unk_1E6D52478;
  id v21 = v8;
  id v17 = v8;
  v18 = objc_msgSend(v16, "hk_map:", v20);
  [(HKGraphSeriesDataBlock *)v13 setChartPoints:v18];

  return v13;
}

HKQuantityTypeDataSourceValue *__83__HKRemoteCardioFitnessDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKQuantityTypeDataSourceValue quantityTypeDataSourceValueWithCodableStatistics:a2 sourceTimeZone:*(void *)(a1 + 32)];
}

- (id)_cardioFitnessUserInfoCreationBlockWithAge:(int64_t)a3 biologicalSex:(int64_t)a4
{
  id v6 = [MEMORY[0x1E4F2B618] unitFromString:@"ml/kg*min"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__HKRemoteCardioFitnessDataSource__cardioFitnessUserInfoCreationBlockWithAge_biologicalSex___block_invoke;
  aBlock[3] = &unk_1E6D524A0;
  id v11 = v6;
  int64_t v12 = a4;
  int64_t v13 = a3;
  id v7 = v6;
  id v8 = _Block_copy(aBlock);

  return v8;
}

HKInteractiveChartCardioFitnessData *__92__HKRemoteCardioFitnessDataSource__cardioFitnessUserInfoCreationBlockWithAge_biologicalSex___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(HKInteractiveChartCardioFitnessData);
  id v5 = [v3 averageQuantity];
  [v5 doubleValueForUnit:a1[4]];
  double v7 = v6;

  [(HKInteractiveChartSinglePointData *)v4 setValue:v7];
  [(HKInteractiveChartSinglePointData *)v4 setUnit:a1[4]];
  uint64_t v8 = [v3 minQuantity];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [v3 maxQuantity];

    if (v10)
    {
      [(HKInteractiveChartSinglePointData *)v4 setRepresentsRange:1];
      id v11 = [v3 minQuantity];
      [v11 doubleValueForUnit:a1[4]];
      -[HKInteractiveChartSinglePointData setMinValue:](v4, "setMinValue:");

      int64_t v12 = [v3 maxQuantity];
      [v12 doubleValueForUnit:a1[4]];
      -[HKInteractiveChartSinglePointData setMaxValue:](v4, "setMaxValue:");
    }
  }
  -[HKInteractiveChartSinglePointData setRecordCount:](v4, "setRecordCount:", [v3 recordCount]);
  int64_t v13 = [v3 statisticsInterval];
  [(HKInteractiveChartSinglePointData *)v4 setStatisticsInterval:v13];

  int64_t v14 = +[HKCardioFitnessUtilities cardioFitnessLevelForVO2Max:a1[5] biologicalSex:a1[6] age:v7];
  [(HKInteractiveChartCardioFitnessData *)v4 setBiologicalSex:a1[5]];
  [(HKInteractiveChartCardioFitnessData *)v4 setAge:a1[6]];
  [(HKInteractiveChartCardioFitnessData *)v4 setClassification:v14];
  -[HKInteractiveChartCardioFitnessData setSampleCount:](v4, "setSampleCount:", [v3 recordCount]);

  return v4;
}

void __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  double v6 = HKStringForChartDataSourceQueryRequestAudience([v4 audience]);
  uint64_t v7 = *MEMORY[0x1E4F2A918];
  uint64_t v8 = [a3 localizedDescription];
  int v9 = 138412802;
  id v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  int64_t v14 = v8;
  _os_log_error_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v9, 0x20u);
}

void __101__HKRemoteCardioFitnessDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Error determining onboarding status for Cardio Fitness: %@", (uint8_t *)&v2, 0xCu);
}

@end