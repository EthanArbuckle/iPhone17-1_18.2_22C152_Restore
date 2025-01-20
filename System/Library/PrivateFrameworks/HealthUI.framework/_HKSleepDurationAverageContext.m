@interface _HKSleepDurationAverageContext
- (BOOL)unselectedContextShouldUseContextBaseType;
- (BOOL)useInBedAverage;
- (HKDisplayType)baseDisplayType;
- (HKDisplayType)overlayDisplayType;
- (HKDisplayTypeContextItem)lastUpdatedItem;
- (HKInteractiveChartOverlayViewController)overlayChartController;
- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate;
- (HKUIMetricColors)metricColors;
- (HKUIMetricColors)selectedMetricColors;
- (_HKSleepDurationAverageContext)initWithBaseDisplayType:(id)a3 overlayDisplayType:(id)a4 overlayChartController:(id)a5 useInBedAverage:(BOOL)a6 contextChangeDelegate:(id)a7 overlayAverageSeries:(id)a8 averageChartFormatter:(id)a9;
- (_HKSleepDurationAverageFormatter)averageChartFormatter;
- (_HKSleepDurationAverageSeries)overlayAverageSeries;
- (double)_averageValueFromChartPoints:(id)a3 useInBedAverage:(BOOL)a4;
- (id)_attributedDurationStringFromDuration:(double)a3 isSelected:(BOOL)a4;
- (id)_attributedTitleOverrideWithDuration:(double)a3;
- (id)_averagePhraseFromAverageValue:(double)a3 shortForm:(BOOL)a4 timeScope:(int64_t)a5;
- (id)_contextItemWithDuration:(double)a3 timeScope:(int64_t)a4;
- (id)_findSleepDurationSeriesForTimeScope:(int64_t)a3;
- (id)sampleTypeForDateRangeUpdates;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)_updateRangeDataWithChartPoints:(id)a3 useInBedAverage:(BOOL)a4 isHighlighted:(BOOL)a5 timeScope:(int64_t)a6;
- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5;
- (void)setLastUpdatedItem:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation _HKSleepDurationAverageContext

- (_HKSleepDurationAverageContext)initWithBaseDisplayType:(id)a3 overlayDisplayType:(id)a4 overlayChartController:(id)a5 useInBedAverage:(BOOL)a6 contextChangeDelegate:(id)a7 overlayAverageSeries:(id)a8 averageChartFormatter:(id)a9
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v32.receiver = self;
  v32.super_class = (Class)_HKSleepDurationAverageContext;
  v19 = [(_HKSleepDurationAverageContext *)&v32 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_baseDisplayType, a3);
    objc_storeStrong((id *)&v20->_overlayDisplayType, a4);
    objc_storeStrong((id *)&v20->_overlayChartController, a5);
    v20->_useInBedAverage = a6;
    objc_storeWeak((id *)&v20->_contextChangeDelegate, v16);
    objc_storeStrong((id *)&v20->_overlayAverageSeries, a8);
    objc_storeStrong((id *)&v20->_averageChartFormatter, a9);
    uint64_t v21 = [(_HKSleepDurationAverageContext *)v20 _contextItemWithDuration:5 timeScope:-1.0];
    lastUpdatedItem = v20->_lastUpdatedItem;
    v20->_lastUpdatedItem = (HKDisplayTypeContextItem *)v21;

    v23 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
    uint64_t v24 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v23];
    metricColors = v20->_metricColors;
    v20->_metricColors = (HKUIMetricColors *)v24;

    uint64_t v26 = +[HKUIMetricColors sleepColors];
    selectedMetricColors = v20->_selectedMetricColors;
    v20->_selectedMetricColors = (HKUIMetricColors *)v26;
  }
  return v20;
}

- (id)_contextItemWithDuration:(double)a3 timeScope:(int64_t)a4
{
  v7 = objc_alloc_init(HKDisplayTypeContextItem);
  BOOL v8 = [(_HKSleepDurationAverageContext *)self useInBedAverage];
  v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v10 = v9;
  if (a4 == 6)
  {
    if (v8) {
      v11 = @"TIME_IN_BED";
    }
    else {
      v11 = @"TIME_ASLEEP";
    }
    v12 = @"HealthUI-Localizable";
  }
  else
  {
    if (v8) {
      v11 = @"SLEEP_AVERAGE_IN_BED";
    }
    else {
      v11 = @"SLEEP_AVERAGE_ASLEEP";
    }
    v12 = @"HealthUI-Localizable-Eucalyptus";
  }
  v13 = [v9 localizedStringForKey:v11 value:&stru_1F3B9CF20 table:v12];
  [(HKDisplayTypeContextItem *)v7 setTitle:v13];

  v14 = NSString;
  if ([(_HKSleepDurationAverageContext *)self useInBedAverage]) {
    v15 = @"TIME_IN_BED";
  }
  else {
    v15 = @"TIME_ASLEEP";
  }
  id v16 = objc_msgSend(v14, "hk_chartOverlayAccessibilityIdentifier:", v15);
  [(HKDisplayTypeContextItem *)v7 setAccessibilityIdentifier:v16];

  [(HKDisplayTypeContextItem *)v7 setInfoHidden:1];
  [(HKDisplayTypeContextItem *)v7 setUnit:&stru_1F3B9CF20];
  id v17 = [(_HKSleepDurationAverageContext *)self _attributedTitleOverrideWithDuration:a3];
  [(HKDisplayTypeContextItem *)v7 setAttributedLabelTextOverride:v17];

  id v18 = [(_HKSleepDurationAverageContext *)self metricColors];
  [(HKDisplayTypeContextItem *)v7 setMetricColors:v18];

  v19 = [(_HKSleepDurationAverageContext *)self selectedMetricColors];
  [(HKDisplayTypeContextItem *)v7 setSelectedMetricColors:v19];

  return v7;
}

- (id)_attributedTitleOverrideWithDuration:(double)a3
{
  v5 = -[_HKSleepDurationAverageContext _attributedDurationStringFromDuration:isSelected:](self, "_attributedDurationStringFromDuration:isSelected:", 0);
  v6 = [(_HKSleepDurationAverageContext *)self _attributedDurationStringFromDuration:1 isSelected:a3];
  v7 = +[HKDisplayTypeContextItemAttributedLabelOverride attributedLabelOverrideWithText:v5 selectedText:v6];

  return v7;
}

- (id)_attributedDurationStringFromDuration:(double)a3 isSelected:(BOOL)a4
{
  if (a4)
  {
    v6 = [(_HKSleepDurationAverageContext *)self selectedMetricColors];
    v7 = [v6 contextViewPrimaryTextColor];

    BOOL v8 = [(_HKSleepDurationAverageContext *)self selectedMetricColors];
    [v8 contextViewPrimaryTextColor];
  }
  else
  {
    v9 = [(_HKSleepDurationAverageContext *)self metricColors];
    v7 = [v9 contextViewPrimaryTextColor];

    BOOL v8 = [(_HKSleepDurationAverageContext *)self metricColors];
    [v8 contextViewSecondaryTextColor];
  v10 = };

  v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionItemValueAndUnitFont");
  v12 = +[HKAttributedDurationFormatter formattedValueWithDuration:0 unitsStyle:v11 font:v7 valueColor:v10 unitColor:a3];

  return v12;
}

- (double)_averageValueFromChartPoints:(id)a3 useInBedAverage:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!v5 || ![v5 count]) {
    goto LABEL_20;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8)
  {

LABEL_20:
    double v17 = -1.0;
    goto LABEL_21;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v20;
  double v11 = 0.0;
  double v12 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v7);
      }
      v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if (v4) {
        [v14 inBedValue];
      }
      else {
        objc_msgSend(v14, "asleepValue", (void)v19);
      }
      BOOL v16 = v15 <= 2.22044605e-16;
      if (v15 <= 2.22044605e-16) {
        double v15 = -0.0;
      }
      double v11 = v11 + v15;
      if (!v16) {
        double v12 = v12 + 1.0;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v9);

  if (v12 == 0.0) {
    goto LABEL_20;
  }
  double v17 = v11 / v12;
LABEL_21:

  return v17;
}

- (id)_averagePhraseFromAverageValue:(double)a3 shortForm:(BOOL)a4 timeScope:(int64_t)a5
{
  if (a3 == -1.0)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.HealthUI", a5);
    uint64_t v6 = [v5 localizedStringForKey:@"SLEEP_DURATION_NO_DATA_CONTEXT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
  }
  else
  {
    if (a4) {
      __int16 v7 = 8;
    }
    else {
      __int16 v7 = 12;
    }
    id v5 = objc_msgSend(NSNumber, "numberWithDouble:");
    uint64_t v6 = HKTimePeriodString(v5, v7);
  }
  uint64_t v8 = (void *)v6;

  return v8;
}

- (id)sampleTypeForDateRangeUpdates
{
  return 0;
}

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return 0;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a7;
  double v12 = [(_HKSleepDurationAverageContext *)self overlayDisplayType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v14 = [(_HKSleepDurationAverageContext *)self overlayDisplayType];
    double v15 = [(_HKSleepDurationAverageContext *)self overlayChartController];
    BOOL v16 = [v14 graphSeriesForTimeScope:a5];
    double v17 = [v10 startDate];
    id v18 = [v10 endDate];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __117___HKSleepDurationAverageContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    v19[3] = &unk_1E6D52700;
    v19[4] = self;
    int64_t v21 = a5;
    id v20 = v11;
    [v15 cachedDataForCustomGraphSeries:v16 timeScope:a5 resolution:0 startDate:v17 endDate:v18 completion:v19];
  }
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (void)_updateRangeDataWithChartPoints:(id)a3 useInBedAverage:(BOOL)a4 isHighlighted:(BOOL)a5 timeScope:(int64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v18 = a3;
  -[_HKSleepDurationAverageContext _averageValueFromChartPoints:useInBedAverage:](self, "_averageValueFromChartPoints:useInBedAverage:");
  double v11 = v10;
  if (v10 >= 0.0)
  {
    double v12 = [NSNumber numberWithDouble:v10];
  }
  else
  {
    double v12 = 0;
  }
  v13 = objc_msgSend(v18, "hk_mapToSet:", &__block_literal_global_815);
  BOOL v14 = (unint64_t)[v13 count] > 1;
  double v15 = [(_HKSleepDurationAverageContext *)self averageChartFormatter];
  [v15 setCurrentVisibleAverageNumber:v12 isTimeInBed:v8 isHighlighted:v7 useAverageCopy:v14];

  if (v7)
  {
    BOOL v16 = [(_HKSleepDurationAverageContext *)self overlayAverageSeries];
    [v16 setAverageValue:v11];

    double v17 = [(_HKSleepDurationAverageContext *)self _contextItemWithDuration:a6 timeScope:v11];
    [(_HKSleepDurationAverageContext *)self setLastUpdatedItem:v17];
  }
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  BOOL v8 = [(_HKSleepDurationAverageContext *)self contextChangeDelegate];
  [v8 setDurationContextSelected:v5];

  uint64_t v9 = [v7 selectedTimeScopeController];

  uint64_t v10 = [v9 selectedTimeScope];
  double v11 = [(_HKSleepDurationAverageContext *)self _findSleepDurationSeriesForTimeScope:v10];
  if (v11)
  {
    id v12 = v11;
    if ([(_HKSleepDurationAverageContext *)self useInBedAverage]) {
      [v12 setHideAsleepData:v5];
    }
    else {
      [v12 setHideInBedData:v5];
    }
    double v11 = v12;
  }
}

- (id)_findSleepDurationSeriesForTimeScope:(int64_t)a3
{
  BOOL v5 = [(_HKSleepDurationAverageContext *)self baseDisplayType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(_HKSleepDurationAverageContext *)self baseDisplayType];
    BOOL v8 = [v7 graphSeriesForTimeScope:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  return v9;
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

- (BOOL)useInBedAverage
{
  return self->_useInBedAverage;
}

- (_HKSleepDurationAverageFormatter)averageChartFormatter
{
  return self->_averageChartFormatter;
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

- (_HKSleepDurationAverageSeries)overlayAverageSeries
{
  return self->_overlayAverageSeries;
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
  objc_storeStrong((id *)&self->_overlayAverageSeries, 0);
  objc_destroyWeak((id *)&self->_contextChangeDelegate);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_averageChartFormatter, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end