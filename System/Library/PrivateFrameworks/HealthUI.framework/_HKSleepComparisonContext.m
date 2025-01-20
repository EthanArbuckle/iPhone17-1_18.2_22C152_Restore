@interface _HKSleepComparisonContext
- (BOOL)_sampleTypeShouldUseSleepQuantityDistribution:(id)a3;
- (BOOL)unselectedContextShouldUseContextBaseType;
- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate;
- (_HKSleepComparisonContext)initWithStackedSampleType:(id)a3 currentCalendarOverride:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 contextChangeDelegate:(id)a7 primarySleepDisplayType:(id)a8;
- (id)_defaultStackedInteractiveChartDisplayTypeForSampleType:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 formatterTimeScope:(int64_t)a6;
- (id)_generateSleepDistributionDisplayTypeForStackedSampleType:(id)a3 currentCalendarOverride:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6;
- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5;
- (void)stackedOverlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5;
@end

@implementation _HKSleepComparisonContext

- (_HKSleepComparisonContext)initWithStackedSampleType:(id)a3 currentCalendarOverride:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 contextChangeDelegate:(id)a7 primarySleepDisplayType:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  if ([(_HKSleepComparisonContext *)self _sampleTypeShouldUseSleepQuantityDistribution:v19])
  {
    [(_HKSleepComparisonContext *)self _generateSleepDistributionDisplayTypeForStackedSampleType:v19 currentCalendarOverride:v18 overlayChartController:v17 applicationItems:v16];
  }
  else
  {
    [(_HKSleepComparisonContext *)self _defaultStackedInteractiveChartDisplayTypeForSampleType:v19 overlayChartController:v17 applicationItems:v16 formatterTimeScope:5];
  v20 = };

  v24.receiver = self;
  v24.super_class = (Class)_HKSleepComparisonContext;
  char v23 = 1;
  v21 = [(HKOverlayRoomStackedContext *)&v24 initWithDisplayType:v15 overlayDisplayType:0 stackedDisplayType:v20 overlayChartController:v17 currentCalendarOverride:v18 applicationItems:v16 isInfoButtonHidden:v23];

  if (v21) {
    objc_storeWeak((id *)&v21->_contextChangeDelegate, v14);
  }

  return v21;
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  BOOL v5 = a3;
  id v6 = [(_HKSleepComparisonContext *)self contextChangeDelegate];
  [v6 setComparisonContextSelected:v5];
}

- (void)stackedOverlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  BOOL v5 = a3;
  id v6 = [(_HKSleepComparisonContext *)self contextChangeDelegate];
  [v6 setComparisonContextSelected:v5];
}

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return 0;
}

- (id)_generateSleepDistributionDisplayTypeForStackedSampleType:(id)a3 currentCalendarOverride:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 timeScopeController];
  uint64_t v12 = [v11 selectedTimeScope];

  v13 = [v8 displayTypeController];
  id v14 = [v13 displayTypeForObjectType:v10];

  id v15 = objc_msgSend(v14, "hk_interactiveChartsFormatterForTimeScope:", v12);
  id v16 = +[HKOverlayRoomStackedContext generateCustomSeriesWithTemplateDisplayType:v14 sampleType:v10 applicationItems:v8 currentTimeScope:v12];

  id v17 = [HKQuantityDistributionDataSource alloc];
  id v18 = [v9 unitPreferenceController];
  id v19 = [v9 healthStore];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __151___HKSleepComparisonContext__generateSleepDistributionDisplayTypeForStackedSampleType_currentCalendarOverride_overlayChartController_applicationItems___block_invoke;
  v30[3] = &__block_descriptor_40_e48__24__0___HKQuantityDistributionData_8__HKUnit_16l;
  v30[4] = 0;
  v20 = [(HKQuantityDistributionDataSource *)v17 initWithQuantityType:v10 unitController:v18 healthStore:v19 contextStyle:6 predicate:0 options:0 baseDisplayType:v14 specificStartDate:0 specificEndDate:0 userInfoCreationBlock:v30];

  [(HKHealthQueryChartCacheDataSource *)v20 setQueryAlignment:1];
  v21 = NSString;
  uint64_t v22 = [v10 code];

  char v23 = objc_msgSend(v21, "stringWithFormat:", @"_HKSleepComparisonContext_%ld", v22);
  objc_super v24 = [[HKInteractiveChartOverlayNamedDataSource alloc] initWithDataSource:v20 named:v23 withContextTitleForTimeScope:0];
  v25 = [HKInteractiveChartDisplayType alloc];
  v26 = [v14 sampleType];
  v27 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v25, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v16, v14, v15, [v26 code]);

  v28 = [v9 displayTypeForGraphSeries:v16 namedDataSource:v24 templateDisplayType:v27 timeScope:v12 formatter:v15];

  return v28;
}

- (id)_defaultStackedInteractiveChartDisplayTypeForSampleType:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 formatterTimeScope:(int64_t)a6
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v9 displayTypeController];
  v11 = [v10 displayTypeForObjectType:v8];

  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __144___HKSleepComparisonContext__defaultStackedInteractiveChartDisplayTypeForSampleType_overlayChartController_applicationItems_formatterTimeScope___block_invoke;
  v27 = &unk_1E6D56080;
  id v28 = v11;
  id v29 = v8;
  id v30 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v11;
  id v15 = (void (**)(void *, uint64_t))_Block_copy(&v24);
  v31[0] = &unk_1F3C22690;
  id v16 = v15[2](v15, 6);
  v32[0] = v16;
  v31[1] = &unk_1F3C226A8;
  id v17 = v15[2](v15, 5);
  v32[1] = v17;
  v31[2] = &unk_1F3C226C0;
  id v18 = v15[2](v15, 4);
  v32[2] = v18;
  v31[3] = &unk_1F3C226D8;
  id v19 = v15[2](v15, 3);
  v32[3] = v19;
  v20 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v32, v31, 4, v24, v25, v26, v27);

  v21 = objc_msgSend(v14, "hk_interactiveChartsFormatterForTimeScope:", a6);
  uint64_t v22 = -[HKInteractiveChartDisplayType initWithBaseDisplayType:valueFormatter:dataTypeCode:seriesForTimeScopeMapping:]([HKInteractiveChartDisplayType alloc], "initWithBaseDisplayType:valueFormatter:dataTypeCode:seriesForTimeScopeMapping:", v14, v21, [v13 code], v20);

  return v22;
}

- (BOOL)_sampleTypeShouldUseSleepQuantityDistribution:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  if (v4 == (void *)*MEMORY[0x1E4F2A898])
  {
    BOOL v6 = 1;
  }
  else
  {
    BOOL v5 = [v3 identifier];
    BOOL v6 = v5 == (void *)*MEMORY[0x1E4F2A828];
  }
  return v6;
}

- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextChangeDelegate);
  return (HKOverlaySleepRoomContextChangeDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end