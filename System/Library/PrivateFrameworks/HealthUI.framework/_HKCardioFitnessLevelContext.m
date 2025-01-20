@interface _HKCardioFitnessLevelContext
- (HKDateRangeDataSourceDelegate)dataSourceDelegate;
- (HKDisplayType)baseDisplayType;
- (HKGraphSeries)cardioFitnessLevelSeries;
- (HKHealthStore)healthStore;
- (HKInteractiveChartDisplayType)overlayDisplayType;
- (HKUnit)unit;
- (_HKCardioFitnessLevelContext)initWithMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 baseDisplayType:(id)a6 cardioFitnessLevel:(int64_t)a7;
- (id)_makeGraphSeriesWithDataSource:(id)a3 baseDisplayType:(id)a4;
- (int64_t)cardioFitnessLevel;
- (void)_updateContextItemWithChartPointCountForDateInterval:(id)a3 timeScope:(int64_t)a4 completion:(id)a5;
- (void)_updateContextItemWithSampleCountForDateInterval:(id)a3 timeScope:(int64_t)a4 completion:(id)a5;
- (void)setBaseDisplayType:(id)a3;
- (void)setCardioFitnessLevel:(int64_t)a3;
- (void)setCardioFitnessLevelSeries:(id)a3;
- (void)setDataSourceDelegate:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setOverlayDisplayType:(id)a3;
- (void)setUnit:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation _HKCardioFitnessLevelContext

- (_HKCardioFitnessLevelContext)initWithMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 baseDisplayType:(id)a6 cardioFitnessLevel:(int64_t)a7
{
  id v12 = a4;
  id v13 = a6;
  v36.receiver = self;
  v36.super_class = (Class)_HKCardioFitnessLevelContext;
  v14 = [(_HKCardioFitnessOverlayContext *)&v36 initWithMode:a3 applicationItems:v12 overlayChartController:a5];
  v15 = v14;
  if (v14)
  {
    v14->_int64_t cardioFitnessLevel = a7;
    objc_storeStrong((id *)&v14->_baseDisplayType, a6);
    uint64_t v16 = [v12 healthStore];
    healthStore = v15->_healthStore;
    v15->_healthStore = (HKHealthStore *)v16;

    v18 = [_HKCardioFitnessLevelDataSourceDelegate alloc];
    int64_t cardioFitnessLevel = v15->_cardioFitnessLevel;
    v20 = [v12 healthStore];
    uint64_t v21 = [(_HKCardioFitnessLevelDataSourceDelegate *)v18 initWithCardioFitnessLevel:cardioFitnessLevel healthStore:v20 baseDisplayType:v13];
    dataSourceDelegate = v15->_dataSourceDelegate;
    v15->_dataSourceDelegate = (HKDateRangeDataSourceDelegate *)v21;

    v23 = [[HKDateRangeDataSource alloc] initWithSourceDelegate:v15->_dataSourceDelegate];
    uint64_t v24 = [(_HKCardioFitnessLevelContext *)v15 _makeGraphSeriesWithDataSource:v23 baseDisplayType:v13];
    cardioFitnessLevelSeries = v15->_cardioFitnessLevelSeries;
    v15->_cardioFitnessLevelSeries = (HKGraphSeries *)v24;

    v26 = [HKInteractiveChartDisplayType alloc];
    v27 = v15->_cardioFitnessLevelSeries;
    baseDisplayType = v15->_baseDisplayType;
    v29 = objc_alloc_init(HKInteractiveChartCardioFitnessFormatter);
    uint64_t v30 = [(HKInteractiveChartDisplayType *)v26 initWithGraphSeries:v27 baseDisplayType:baseDisplayType valueFormatter:v29 dataTypeCode:124];
    overlayDisplayType = v15->_overlayDisplayType;
    v15->_overlayDisplayType = (HKInteractiveChartDisplayType *)v30;

    uint64_t v32 = [MEMORY[0x1E4F2B618] unitFromString:@"mL/(kg*min)"];
    unit = v15->_unit;
    v15->_unit = (HKUnit *)v32;

    v34 = [(_HKCardioFitnessOverlayContext *)v15 _cardioFitnessContextItemWithLevel:v15->_cardioFitnessLevel sampleCount:0];
    [(_HKCardioFitnessOverlayContext *)v15 setLastUpdatedItem:v34];
  }
  return v15;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  if (a5 > 5) {
    -[_HKCardioFitnessLevelContext _updateContextItemWithSampleCountForDateInterval:timeScope:completion:](self, "_updateContextItemWithSampleCountForDateInterval:timeScope:completion:", a3, a5, a7, a6);
  }
  else {
    -[_HKCardioFitnessLevelContext _updateContextItemWithChartPointCountForDateInterval:timeScope:completion:](self, "_updateContextItemWithChartPointCountForDateInterval:timeScope:completion:", a3, a5, a7, a6);
  }
}

- (void)_updateContextItemWithChartPointCountForDateInterval:(id)a3 timeScope:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(_HKCardioFitnessOverlayContext *)self overlayChartController];
  v11 = [v10 primaryDisplayType];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    id v13 = [(_HKCardioFitnessOverlayContext *)self overlayChartController];
    v14 = [v12 graphSeriesForTimeScope:a4];

    v15 = [v8 startDate];
    uint64_t v16 = [v8 endDate];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __106___HKCardioFitnessLevelContext__updateContextItemWithChartPointCountForDateInterval_timeScope_completion___block_invoke;
    v17[3] = &unk_1E6D52700;
    v17[4] = self;
    int64_t v19 = a4;
    id v18 = v9;
    [v13 cachedDataForCustomGraphSeries:v14 timeScope:a4 resolution:0 startDate:v15 endDate:v16 completion:v17];
  }
}

- (void)_updateContextItemWithSampleCountForDateInterval:(id)a3 timeScope:(int64_t)a4 completion:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v37 = a5;
  v7 = +[HKCardioFitnessUtilities cardioFitnessLevelDateIntervalsWithDateInterval:a3 healthStore:self->_healthStore];
  v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v39 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        int64_t cardioFitnessLevel = self->_cardioFitnessLevel;
        id v13 = [v11 startDate];
        v14 = +[HKCardioFitnessUtilities cardioFitnessDataForLevel:cardioFitnessLevel date:v13 healthStore:self->_healthStore];

        if (!v14)
        {
          v33 = v37;
          (*((void (**)(id, void, void))v37 + 2))(v37, 0, 0);
          objc_super v36 = obj;
          uint64_t v30 = obj;
          v29 = v40;
          goto LABEL_15;
        }
        v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
        if (+[HKCardioFitnessUtilities cardioFitnessLevelChartShouldDisplayLowerBound:self->_cardioFitnessLevel])
        {
          uint64_t v16 = (void *)MEMORY[0x1E4F2B370];
          unit = self->_unit;
          [v14 vo2MaxLowerBound];
          id v18 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", unit);
          int64_t v19 = [MEMORY[0x1E4F2B3C0] predicateForQuantitySamplesWithOperatorType:3 quantity:v18];
          [v15 addObject:v19];
        }
        if (+[HKCardioFitnessUtilities cardioFitnessLevelChartShouldDisplayUpperBound:self->_cardioFitnessLevel])
        {
          v20 = (void *)MEMORY[0x1E4F2B370];
          uint64_t v21 = self->_unit;
          [v14 vo2MaxUpperBound];
          v22 = objc_msgSend(v20, "quantityWithUnit:doubleValue:", v21);
          v23 = [MEMORY[0x1E4F2B3C0] predicateForQuantitySamplesWithOperatorType:0 quantity:v22];
          [v15 addObject:v23];
        }
        uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:1 subpredicates:v15];
        v25 = [MEMORY[0x1E4F2B3C0] predicateForSamplesWithinDateInterval:v11 options:0];
        id v26 = objc_alloc(MEMORY[0x1E4F28BA0]);
        v47[0] = v25;
        v47[1] = v24;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
        v28 = (void *)[v26 initWithType:1 subpredicates:v27];

        [v40 addObject:v28];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v29 = v40;
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:2 subpredicates:v40];
  id v31 = objc_alloc(MEMORY[0x1E4F2B428]);
  uint64_t v32 = [(HKDisplayType *)self->_baseDisplayType sampleType];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __102___HKCardioFitnessLevelContext__updateContextItemWithSampleCountForDateInterval_timeScope_completion___block_invoke;
  v41[3] = &unk_1E6D52C08;
  v41[4] = self;
  v33 = v37;
  id v42 = v37;
  v34 = (void *)[v31 initWithSampleType:v32 predicate:v30 resultsHandler:v41];

  healthStore = self->_healthStore;
  objc_super v36 = obj;
  [(HKHealthStore *)healthStore executeQuery:v34];

LABEL_15:
}

- (id)_makeGraphSeriesWithDataSource:(id)a3 baseDisplayType:(id)a4
{
  int64_t cardioFitnessLevel = self->_cardioFitnessLevel;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = +[HKCardioFitnessUtilities cardioFitnessLevelChartShouldDisplayUpperBound:cardioFitnessLevel];
  if (+[HKCardioFitnessUtilities cardioFitnessLevelChartShouldDisplayLowerBound:self->_cardioFitnessLevel])
  {
    uint64_t v10 = v9 | 2;
  }
  else
  {
    uint64_t v10 = v9;
  }
  v11 = +[HKLevelOverlaySeries levelOverlaySeriesWithDisplayType:v7 dataSource:v8 options:v10];

  return v11;
}

- (int64_t)cardioFitnessLevel
{
  return self->_cardioFitnessLevel;
}

- (void)setCardioFitnessLevel:(int64_t)a3
{
  self->_int64_t cardioFitnessLevel = a3;
}

- (HKGraphSeries)cardioFitnessLevelSeries
{
  return self->_cardioFitnessLevelSeries;
}

- (void)setCardioFitnessLevelSeries:(id)a3
{
}

- (HKDateRangeDataSourceDelegate)dataSourceDelegate
{
  return self->_dataSourceDelegate;
}

- (void)setDataSourceDelegate:(id)a3
{
}

- (HKInteractiveChartDisplayType)overlayDisplayType
{
  return self->_overlayDisplayType;
}

- (void)setOverlayDisplayType:(id)a3
{
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (void)setBaseDisplayType:(id)a3
{
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_dataSourceDelegate, 0);
  objc_storeStrong((id *)&self->_cardioFitnessLevelSeries, 0);
}

@end