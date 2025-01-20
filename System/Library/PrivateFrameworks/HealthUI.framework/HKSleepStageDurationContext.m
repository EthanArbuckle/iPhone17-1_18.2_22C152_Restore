@interface HKSleepStageDurationContext
- (BOOL)unselectedContextShouldUseContextBaseType;
- (HKDisplayType)baseDisplayType;
- (HKDisplayType)overlayDisplayType;
- (HKDisplayTypeContextItem)lastUpdatedItem;
- (HKInteractiveChartOverlayViewController)overlayChartController;
- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate;
- (HKSleepStageDurationContext)initWithBaseDisplayType:(id)a3 overlayDisplayType:(id)a4 overlayChartController:(id)a5 contextChangeDelegate:(id)a6 sleepValue:(int64_t)a7;
- (HKUIMetricColors)metricColors;
- (HKUIMetricColors)selectedMetricColors;
- (double)_computeAverageValueFromChartPoints:(id)a3;
- (id)_attributedDurationStringFromDuration:(double)a3 isSelected:(BOOL)a4;
- (id)_attributedTitleOverrideWithDuration:(double)a3;
- (id)_contextItemWithDuration:(double)a3 timeScope:(int64_t)a4;
- (id)sampleTypeForDateRangeUpdates;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (int64_t)sleepValue;
- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5;
- (void)setLastUpdatedItem:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation HKSleepStageDurationContext

- (HKSleepStageDurationContext)initWithBaseDisplayType:(id)a3 overlayDisplayType:(id)a4 overlayChartController:(id)a5 contextChangeDelegate:(id)a6 sleepValue:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HKSleepStageDurationContext;
  v17 = [(HKSleepStageDurationContext *)&v27 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_overlayChartController, a5);
    objc_storeStrong((id *)&v18->_baseDisplayType, a3);
    objc_storeStrong((id *)&v18->_overlayDisplayType, a4);
    objc_storeWeak((id *)&v18->_contextChangeDelegate, v16);
    v18->_sleepValue = a7;
    uint64_t v19 = [(HKSleepStageDurationContext *)v18 _contextItemWithDuration:5 timeScope:-1.0];
    lastUpdatedItem = v18->_lastUpdatedItem;
    v18->_lastUpdatedItem = (HKDisplayTypeContextItem *)v19;

    v21 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
    uint64_t v22 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v21];
    metricColors = v18->_metricColors;
    v18->_metricColors = (HKUIMetricColors *)v22;

    uint64_t v24 = +[HKUIMetricColors sleepColorsForSleepAnalysis:a7];
    selectedMetricColors = v18->_selectedMetricColors;
    v18->_selectedMetricColors = (HKUIMetricColors *)v24;
  }
  return v18;
}

- (id)_contextItemWithDuration:(double)a3 timeScope:(int64_t)a4
{
  v7 = objc_alloc_init(HKDisplayTypeContextItem);
  v8 = +[HKSleepUtilities sleepStageContextTitleForSleepValue:[(HKSleepStageDurationContext *)self sleepValue] timeScope:a4];
  [(HKDisplayTypeContextItem *)v7 setTitle:v8];

  v9 = NSString;
  v10 = [(HKDisplayTypeContextItem *)v7 title];
  v11 = objc_msgSend(v9, "hk_chartOverlayAccessibilityIdentifier:", v10);
  [(HKDisplayTypeContextItem *)v7 setAccessibilityIdentifier:v11];

  v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepColorForSleepAnalysis:", -[HKSleepStageDurationContext sleepValue](self, "sleepValue"));
  id v13 = +[HKDisplayTypeContextItemTitleAccessory titleAccessoryWithImagedNamed:@"circle.fill" imageColor:v12];
  [(HKDisplayTypeContextItem *)v7 setTitleAccessory:v13];

  id v14 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepPrimaryTextColorForSleepAnalysis:", -[HKSleepStageDurationContext sleepValue](self, "sleepValue"));
  id v15 = +[HKDisplayTypeContextItemTitleAccessory titleAccessoryWithImagedNamed:@"circle" imageColor:v14];
  [(HKDisplayTypeContextItem *)v7 setSelectedTitleAccessory:v15];

  [(HKDisplayTypeContextItem *)v7 setInfoHidden:1];
  [(HKDisplayTypeContextItem *)v7 setUnit:&stru_1F3B9CF20];
  id v16 = [(HKSleepStageDurationContext *)self _attributedTitleOverrideWithDuration:a3];
  [(HKDisplayTypeContextItem *)v7 setAttributedLabelTextOverride:v16];

  v17 = [(HKSleepStageDurationContext *)self metricColors];
  [(HKDisplayTypeContextItem *)v7 setMetricColors:v17];

  v18 = [(HKSleepStageDurationContext *)self selectedMetricColors];
  [(HKDisplayTypeContextItem *)v7 setSelectedMetricColors:v18];

  return v7;
}

- (id)sampleTypeForDateRangeUpdates
{
  return 0;
}

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return 0;
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  BOOL v5 = a3;
  id v6 = [(HKSleepStageDurationContext *)self contextChangeDelegate];
  [v6 setStageDurationContextSelected:v5];
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a7;
  v12 = [(HKSleepStageDurationContext *)self baseDisplayType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v14 = [(HKSleepStageDurationContext *)self baseDisplayType];
    id v15 = [(HKSleepStageDurationContext *)self overlayChartController];
    id v16 = [v14 graphSeriesForTimeScope:a5];
    v17 = [v10 startDate];
    v18 = [v10 endDate];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __114__HKSleepStageDurationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    v19[3] = &unk_1E6D52700;
    v19[4] = self;
    int64_t v21 = a5;
    id v20 = v11;
    [v15 cachedDataForCustomGraphSeries:v16 timeScope:a5 resolution:0 startDate:v17 endDate:v18 completion:v19];
  }
}

uint64_t __114__HKSleepStageDurationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    [*(id *)(a1 + 32) _computeAverageValueFromChartPoints:a2];
    v4 = objc_msgSend(*(id *)(a1 + 32), "_contextItemWithDuration:timeScope:", *(void *)(a1 + 48));
    [*(id *)(a1 + 32) setLastUpdatedItem:v4];

    BOOL v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v5();
  }
  else
  {
    v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v7();
  }
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (double)_computeAverageValueFromChartPoints:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_76);
    if ([v6 count])
    {
      v7 = [v6 allObjects];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __67__HKSleepStageDurationContext__computeAverageValueFromChartPoints___block_invoke_2;
      v12[3] = &unk_1E6D56038;
      v12[4] = self;
      v8 = objc_msgSend(v7, "hk_averageUsingEvaluationBlock:", v12);
      [v8 doubleValue];
      double v10 = v9;
    }
    else
    {
      double v10 = -1.0;
    }
  }
  else
  {
    double v10 = -1.0;
  }

  return v10;
}

id __67__HKSleepStageDurationContext__computeAverageValueFromChartPoints___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 userInfo];
  v3 = [v2 sleepDaySummary];

  if ([v3 hasSleepStageData]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

double __67__HKSleepStageDurationContext__computeAverageValueFromChartPoints___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "hkui_durationForSleepCategoryValue:", objc_msgSend(v2, "sleepValue"));
  double v5 = v4;

  return v5;
}

- (id)_attributedTitleOverrideWithDuration:(double)a3
{
  double v5 = -[HKSleepStageDurationContext _attributedDurationStringFromDuration:isSelected:](self, "_attributedDurationStringFromDuration:isSelected:", 0);
  id v6 = [(HKSleepStageDurationContext *)self _attributedDurationStringFromDuration:1 isSelected:a3];
  v7 = +[HKDisplayTypeContextItemAttributedLabelOverride attributedLabelOverrideWithText:v5 selectedText:v6];

  return v7;
}

- (id)_attributedDurationStringFromDuration:(double)a3 isSelected:(BOOL)a4
{
  if (a4)
  {
    id v6 = [(HKSleepStageDurationContext *)self selectedMetricColors];
    v7 = [v6 contextViewPrimaryTextColor];

    v8 = [(HKSleepStageDurationContext *)self selectedMetricColors];
    [v8 contextViewPrimaryTextColor];
  }
  else
  {
    double v9 = [(HKSleepStageDurationContext *)self metricColors];
    v7 = [v9 contextViewPrimaryTextColor];

    v8 = [(HKSleepStageDurationContext *)self metricColors];
    [v8 contextViewSecondaryTextColor];
  double v10 = };

  id v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionItemValueAndUnitFont");
  v12 = +[HKAttributedDurationFormatter formattedValueWithDuration:0 unitsStyle:v11 font:v7 valueColor:v10 unitColor:a3];

  return v12;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (HKDisplayType)overlayDisplayType
{
  return self->_overlayDisplayType;
}

- (int64_t)sleepValue
{
  return self->_sleepValue;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
}

- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextChangeDelegate);
  return (HKOverlaySleepRoomContextChangeDelegate *)WeakRetained;
}

- (HKUIMetricColors)metricColors
{
  return self->_metricColors;
}

- (HKUIMetricColors)selectedMetricColors
{
  return self->_selectedMetricColors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedMetricColors, 0);
  objc_storeStrong((id *)&self->_metricColors, 0);
  objc_destroyWeak((id *)&self->_contextChangeDelegate);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end