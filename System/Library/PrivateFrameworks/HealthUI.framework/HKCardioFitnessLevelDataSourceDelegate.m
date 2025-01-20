@interface HKCardioFitnessLevelDataSourceDelegate
@end

@implementation HKCardioFitnessLevelDataSourceDelegate

void __70___HKCardioFitnessLevelDataSourceDelegate_dataForDateRange_timeScope___block_invoke(uint64_t a1, void *a2)
{
  id v25 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [v25 startDate];
  v5 = [v25 endDate];
  v6 = +[HKCardioFitnessUtilities effectiveChartPointDateWithStatisticsInterval:v3 startDate:v4 endDate:v5];

  v7 = [*(id *)(a1 + 40) dateOfBirthComponents];
  uint64_t v8 = objc_msgSend(v7, "hk_ageWithCurrentDate:", v6);

  v9 = +[HKCardioFitnessUtilities cardioFitnessDataForLevel:biologicalSex:age:](HKCardioFitnessUtilities, "cardioFitnessDataForLevel:biologicalSex:age:", *(void *)(*(void *)(a1 + 40) + 8), [*(id *)(a1 + 40) biologicalSex], v8);
  if (v9)
  {
    v10 = objc_alloc_init(HKInteractiveChartCardioFitnessData);
    v11 = [*(id *)(a1 + 40) unit];
    [(HKInteractiveChartSinglePointData *)v10 setUnit:v11];

    [(HKInteractiveChartSinglePointData *)v10 setRepresentsRange:1];
    [v9 vo2MaxLowerBound];
    -[HKInteractiveChartSinglePointData setMinValue:](v10, "setMinValue:");
    [v9 vo2MaxUpperBound];
    -[HKInteractiveChartSinglePointData setMaxValue:](v10, "setMaxValue:");
    [(HKInteractiveChartSinglePointData *)v10 setRecordCount:1];
    [(HKInteractiveChartSinglePointData *)v10 setStatisticsInterval:*(void *)(a1 + 32)];
    -[HKInteractiveChartCardioFitnessData setBiologicalSex:](v10, "setBiologicalSex:", [v9 biologicalSex]);
    [(HKInteractiveChartCardioFitnessData *)v10 setAge:v8];
    -[HKInteractiveChartCardioFitnessData setClassification:](v10, "setClassification:", [v9 cardioFitnessLevel]);
    [(HKInteractiveChartCardioFitnessData *)v10 setSampleCount:[(HKInteractiveChartSinglePointData *)v10 recordCount]];
    v12 = objc_alloc_init(HKQuantityTypeDataSourceValue);
    v13 = (void *)MEMORY[0x1E4F2B370];
    v14 = [(HKInteractiveChartSinglePointData *)v10 unit];
    [(HKInteractiveChartSinglePointData *)v10 maxValue];
    v15 = objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14);
    [(HKQuantityTypeDataSourceValue *)v12 setMaxQuantity:v15];

    v16 = (void *)MEMORY[0x1E4F2B370];
    v17 = [(HKInteractiveChartSinglePointData *)v10 unit];
    [(HKInteractiveChartSinglePointData *)v10 minValue];
    v18 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v17);
    [(HKQuantityTypeDataSourceValue *)v12 setMinQuantity:v18];

    v19 = [v25 startDate];
    [(HKQuantityTypeDataSourceValue *)v12 setStartDate:v19];

    v20 = [v25 endDate];
    [(HKQuantityTypeDataSourceValue *)v12 setEndDate:v20];

    v21 = [HKHealthChartPoint alloc];
    v22 = [(HKInteractiveChartSinglePointData *)v10 unit];
    v23 = [*(id *)(a1 + 40) baseDisplayType];
    v24 = [(HKHealthChartPoint *)v21 initWithDataSourceValue:v12 options:12 unit:v22 displayType:v23];

    [(HKHealthChartPoint *)v24 setUserInfo:v10];
    [*(id *)(a1 + 48) addObject:v24];
  }
}

@end