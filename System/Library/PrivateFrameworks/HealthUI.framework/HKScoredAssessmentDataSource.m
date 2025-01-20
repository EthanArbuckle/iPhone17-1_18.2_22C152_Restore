@interface HKScoredAssessmentDataSource
- (id)_chartPointsWithSamples:(id)a3 sourceTimeZone:(id)a4;
@end

@implementation HKScoredAssessmentDataSource

- (id)_chartPointsWithSamples:(id)a3 sourceTimeZone:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v33 = *(void *)v36;
    unint64_t v10 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v13 = objc_alloc_init(HKLevelCategoryChartPoint);
        uint64_t v14 = objc_msgSend(v12, "hk_integerValue");
        v15 = [v12 startDate];
        v16 = objc_msgSend(v15, "hk_dateFromSourceTimeZone:", v7);
        [(HKLevelCategoryChartPoint *)v13 setStartDate:v16];

        v17 = [v12 endDate];
        v18 = objc_msgSend(v17, "hk_dateFromSourceTimeZone:", v7);
        [(HKLevelCategoryChartPoint *)v13 setEndDate:v18];

        v19 = [(HKLevelCategoryDataSource *)self valueOrder];

        v20 = *(void **)(v10 + 3792);
        if (v19)
        {
          v21 = [(HKLevelCategoryDataSource *)self valueOrder];
          v22 = [*(id *)(v10 + 3792) numberWithInteger:v14];
          v23 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "indexOfObject:", v22));
          [(HKLevelCategoryChartPoint *)v13 setYValue:v23];
        }
        else
        {
          v21 = [*(id *)(v10 + 3792) numberWithInteger:v14];
          [(HKLevelCategoryChartPoint *)v13 setYValue:v21];
        }

        [(HKLevelCategoryChartPoint *)v13 setPointStyle:0];
        v24 = [(HKLevelCategoryDataSource *)self pointStyleBlock];

        if (v24)
        {
          v25 = [(HKLevelCategoryDataSource *)self pointStyleBlock];
          [(HKLevelCategoryChartPoint *)v13 setPointStyle:((uint64_t (**)(void, void *))v25)[2](v25, v12)];
        }
        v26 = [(HKLevelCategoryDataSource *)self userInfoCreationBlock];
        v27 = [v12 startDate];
        v28 = [v12 endDate];
        v29 = ((void (**)(void, uint64_t, void *, void *, void))v26)[2](v26, v14, v27, v28, 0);
        [(HKLevelCategoryChartPoint *)v13 setUserInfo:v29];

        [v34 addObject:v13];
        unint64_t v10 = 0x1E4F28000;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v9);
  }

  v30 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v30 setChartPoints:v34];

  return v30;
}

@end