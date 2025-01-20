@interface _HKSleepDurationAmountContext
- (BOOL)unselectedContextShouldUseContextBaseType;
- (HKDisplayType)baseDisplayType;
- (HKDisplayTypeContextItem)lastUpdatedItem;
- (HKInteractiveChartOverlayViewController)overlayChartController;
- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate;
- (_HKSleepDurationAmountContext)initWithBaseDisplayType:(id)a3 overlayChartController:(id)a4 contextChangeDelegate:(id)a5;
- (id)_amountStringFromCounts:(id)a3 timeScope:(int64_t)a4;
- (id)_contextItemWithAmountString:(id)a3;
- (id)_daysWithSleepDataFromChartPoints:(id)a3;
- (id)overlayDisplayTypeForTimeScope:(int64_t)a3;
- (id)sampleTypeForDateRangeUpdates;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)setLastUpdatedItem:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation _HKSleepDurationAmountContext

- (_HKSleepDurationAmountContext)initWithBaseDisplayType:(id)a3 overlayChartController:(id)a4 contextChangeDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_HKSleepDurationAmountContext;
  v12 = [(_HKSleepDurationAmountContext *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_overlayChartController, a4);
    objc_storeStrong((id *)&v13->_baseDisplayType, a3);
    objc_storeWeak((id *)&v13->_contextChangeDelegate, v11);
    uint64_t v14 = [(_HKSleepDurationAmountContext *)v13 _contextItemWithAmountString:&stru_1F3B9CF20];
    lastUpdatedItem = v13->_lastUpdatedItem;
    v13->_lastUpdatedItem = (HKDisplayTypeContextItem *)v14;
  }
  return v13;
}

- (id)_contextItemWithAmountString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(HKDisplayTypeContextItem);
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v6 = [v5 localizedStringForKey:@"SLEEP_DURATION_AMOUNTS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
  [(HKDisplayTypeContextItem *)v4 setTitle:v6];

  v7 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", @"SLEEP_DURATION_AMOUNTS");
  [(HKDisplayTypeContextItem *)v4 setAccessibilityIdentifier:v7];

  [(HKDisplayTypeContextItem *)v4 setInfoHidden:1];
  [(HKDisplayTypeContextItem *)v4 setUnit:&stru_1F3B9CF20];
  [(HKDisplayTypeContextItem *)v4 setValue:v3];

  v8 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
  id v9 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v8];
  [(HKDisplayTypeContextItem *)v4 setMetricColors:v9];

  id v10 = +[HKUIMetricColors sleepColors];
  [(HKDisplayTypeContextItem *)v4 setSelectedMetricColors:v10];

  return v4;
}

- (id)_daysWithSleepDataFromChartPoints:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 count])
  {
    v5 = objc_alloc_init(_HKSleepDurationAmountCounts);
    [(_HKSleepDurationAmountCounts *)v5 setDaysWithSleepData:0];
    [(_HKSleepDurationAmountCounts *)v5 setTotalDays:0];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
            objc_msgSend(v12, "inBedValue", (void)v16);
            if (v13 > 2.22044605e-16 || ([v12 asleepValue], v14 > 2.22044605e-16)) {
              [(_HKSleepDurationAmountCounts *)v5 setDaysWithSleepData:[(_HKSleepDurationAmountCounts *)v5 daysWithSleepData] + 1];
            }
            [(_HKSleepDurationAmountCounts *)v5 setTotalDays:[(_HKSleepDurationAmountCounts *)v5 totalDays] + 1];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_amountStringFromCounts:(id)a3 timeScope:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = HKIntegerFormatter();
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "daysWithSleepData"));
    uint64_t v8 = [v6 stringFromNumber:v7];

    switch(a4)
    {
      case 0:
      case 1:
      case 2:
      case 7:
      case 8:
        uint64_t v9 = [NSString localizedStringWithFormat:@"UNSUPPORTED_SLEEP_COUNT"];
        goto LABEL_9;
      case 3:
        id v11 = NSString;
        id v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        double v13 = v12;
        double v14 = @"SLEEP_AMOUNTS_WEEKS";
        goto LABEL_8;
      case 4:
      case 5:
        id v11 = NSString;
        id v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        double v13 = v12;
        double v14 = @"SLEEP_AMOUNTS_DAYS";
LABEL_8:
        v15 = [v12 localizedStringForKey:v14 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
        uint64_t v9 = objc_msgSend(v11, "localizedStringWithFormat:", v15, objc_msgSend(v5, "totalDays"));

        goto LABEL_9;
      case 6:
        v20 = NSString;
        uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        long long v17 = [v9 localizedStringForKey:@"SLEEP_AMOUNTS_SINGLE_DAY_COUNT_%d" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
        id v10 = objc_msgSend(v20, "localizedStringWithFormat:", v17, 1);
        goto LABEL_10;
      default:
        uint64_t v9 = 0;
LABEL_9:
        long long v16 = NSString;
        long long v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        long long v18 = [v17 localizedStringForKey:@"SLEEP_AMOUNTS_DAY_COUNT_%@_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
        id v10 = objc_msgSend(v16, "stringWithFormat:", v18, v8, v9);

LABEL_10:
        break;
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v10 = [v6 localizedStringForKey:@"SLEEP_AVERAGE_NO_DAY_COUNTS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
  }

  return v10;
}

- (id)sampleTypeForDateRangeUpdates
{
  return 0;
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  return 0;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a7;
  id v12 = [(_HKSleepDurationAmountContext *)self baseDisplayType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v14 = [(_HKSleepDurationAmountContext *)self baseDisplayType];
    v15 = [(_HKSleepDurationAmountContext *)self overlayChartController];
    long long v16 = [v14 graphSeriesForTimeScope:a5];
    long long v17 = [v10 startDate];
    long long v18 = [v10 endDate];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __116___HKSleepDurationAmountContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
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

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return 0;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contextChangeDelegate);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end