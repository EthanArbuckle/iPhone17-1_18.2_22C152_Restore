@interface HKBloodGlucosePercentInRangeDataSource
- (HKBloodGlucosePercentInRangeDataSource)initWithHealthStore:(id)a3 unitController:(id)a4;
- (HKUnitPreferenceController)unitController;
- (id)_dataBlockFromHistogramCollection:(id)a3 requiredSampleCountForHistogram:(int64_t)a4;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (int64_t)_requiredSampleCountForHistogramForStatisticsInterval:(id)a3;
- (void)setUnitController:(id)a3;
@end

@implementation HKBloodGlucosePercentInRangeDataSource

- (HKBloodGlucosePercentInRangeDataSource)initWithHealthStore:(id)a3 unitController:(id)a4
{
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F2B3B8];
  uint64_t v9 = *MEMORY[0x1E4F2A610];
  id v10 = a3;
  v11 = [v8 quantityTypeForIdentifier:v9];
  v12 = +[HKDisplayTypeController sharedInstanceForHealthStore:v10];
  v13 = [v12 displayTypeForObjectType:v11];
  v16.receiver = self;
  v16.super_class = (Class)HKBloodGlucosePercentInRangeDataSource;
  v14 = [(HKHealthQueryChartCacheDataSource *)&v16 initWithDisplayType:v13 healthStore:v10];

  if (v14) {
    objc_storeStrong((id *)&v14->_unitController, a4);
  }

  return v14;
}

- (id)queryDescription
{
  return @"HKBloodGlucosePercentInRange";
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 statisticsInterval];
  uint64_t v9 = (void *)[v8 copy];

  id v10 = [v9 calendar];

  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v9 setCalendar:v11];
  }
  v12 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A610]];
  v13 = (void *)MEMORY[0x1E4F2B3C0];
  v14 = [v6 startDate];
  v15 = [v6 endDate];
  objc_super v16 = [v13 predicateForSamplesWithStartDate:v14 endDate:v15 options:0];

  unitController = self->_unitController;
  v18 = [(HKHealthQueryChartCacheDataSource *)self displayType];
  v19 = [(HKUnitPreferenceController *)unitController unitForDisplayType:v18];

  v20 = [MEMORY[0x1E4F2B380] ATTDGlycemicRangesWithUnit:v19];
  id v21 = objc_alloc(MEMORY[0x1E4F2B6D0]);
  v22 = [v6 startDate];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __78__HKBloodGlucosePercentInRangeDataSource_queriesForRequest_completionHandler___block_invoke;
  v28[3] = &unk_1E6D55F08;
  v28[4] = self;
  id v29 = v6;
  id v30 = v7;
  id v23 = v7;
  id v24 = v6;
  v25 = (void *)[v21 initWithQuantityType:v12 quantitySamplePredicate:v16 anchorDate:v22 intervalComponents:v9 quantityRanges:v20 resultsHandler:v28];

  [v25 setDebugIdentifier:@"charting (glucose)"];
  v31[0] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];

  return v26;
}

void __78__HKBloodGlucosePercentInRangeDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (v8)
  {
    v4 = *(void **)(a1 + 32);
    v5 = [*(id *)(a1 + 40) statisticsInterval];
    uint64_t v6 = [v4 _requiredSampleCountForHistogramForStatisticsInterval:v5];

    id v7 = [*(id *)(a1 + 32) _dataBlockFromHistogramCollection:v8 requiredSampleCountForHistogram:v6];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)_dataBlockFromHistogramCollection:(id)a3 requiredSampleCountForHistogram:(int64_t)a4
{
  v5 = [a3 valueHistograms];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__HKBloodGlucosePercentInRangeDataSource__dataBlockFromHistogramCollection_requiredSampleCountForHistogram___block_invoke;
  v10[3] = &__block_descriptor_40_e26_B16__0__HKValueHistogram_8l;
  v10[4] = a4;
  uint64_t v6 = objc_msgSend(v5, "hk_filter:", v10);

  id v7 = objc_msgSend(v6, "hk_map:", &__block_literal_global_75);
  id v8 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v8 setChartPoints:v7];

  return v8;
}

BOOL __108__HKBloodGlucosePercentInRangeDataSource__dataBlockFromHistogramCollection_requiredSampleCountForHistogram___block_invoke(uint64_t a1, void *a2)
{
  return [a2 totalSampleCount] >= *(void *)(a1 + 32);
}

_HKBloodGlucosePercentInRangeChartPoint *__108__HKBloodGlucosePercentInRangeDataSource__dataBlockFromHistogramCollection_requiredSampleCountForHistogram___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_alloc_init(HKInteractiveChartBloodGlucosePercentInRangeData);
  v4 = [v2 segments];
  v5 = [v4 objectAtIndexedSubscript:0];
  -[HKInteractiveChartBloodGlucosePercentInRangeData setCountInLevel2Hypoglycemia:](v3, "setCountInLevel2Hypoglycemia:", [v5 count]);

  uint64_t v6 = [v2 segments];
  id v7 = [v6 objectAtIndexedSubscript:1];
  -[HKInteractiveChartBloodGlucosePercentInRangeData setCountInLevel1Hypoglycemia:](v3, "setCountInLevel1Hypoglycemia:", [v7 count]);

  id v8 = [v2 segments];
  uint64_t v9 = [v8 objectAtIndexedSubscript:2];
  -[HKInteractiveChartBloodGlucosePercentInRangeData setCountInEuglycemia:](v3, "setCountInEuglycemia:", [v9 count]);

  id v10 = [v2 segments];
  v11 = [v10 objectAtIndexedSubscript:3];
  -[HKInteractiveChartBloodGlucosePercentInRangeData setCountInHyperglycemia:](v3, "setCountInHyperglycemia:", [v11 count]);

  v12 = [_HKBloodGlucosePercentInRangeChartPoint alloc];
  v13 = [v2 dateInterval];
  v14 = [v13 startDate];
  v15 = [v2 dateInterval];

  objc_super v16 = [v15 endDate];
  v17 = [(_HKBloodGlucosePercentInRangeChartPoint *)v12 initWithStartDate:v14 endDate:v16 userInfo:v3];

  return v17;
}

- (int64_t)_requiredSampleCountForHistogramForStatisticsInterval:(id)a3
{
  objc_msgSend(a3, "hk_approximateDuration");
  if (v3 <= (double)(unint64_t)*MEMORY[0x1E4F296F0]) {
    return 9;
  }
  else {
    return 202;
  }
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end