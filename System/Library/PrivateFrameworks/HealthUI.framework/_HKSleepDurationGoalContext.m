@interface _HKSleepDurationGoalContext
- (BOOL)isPrimaryContext;
- (BOOL)unselectedContextShouldUseContextBaseType;
- (HKDisplayType)baseDisplayType;
- (HKDisplayType)overlayDisplayType;
- (HKDisplayTypeContextItem)lastUpdatedItem;
- (HKInteractiveChartOverlayViewController)overlayChartController;
- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate;
- (HKSampleType)monitoringSampleType;
- (_HKSleepDurationGoalContext)initWithBaseDisplayType:(id)a3 overlayDisplayType:(id)a4 overlayChartController:(id)a5 overlayMode:(int64_t)a6 isPrimaryContext:(BOOL)a7 contextChangeDelegate:(id)a8;
- (id)_durationContextItemWithGoal:(id)a3;
- (id)_goalGivenChartPoints:(id)a3;
- (id)baseDisplayTypeForOverlay:(int64_t)a3;
- (int64_t)overlayMode;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5;
- (void)setLastUpdatedItem:(id)a3;
- (void)setMonitoringSampleType:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation _HKSleepDurationGoalContext

- (_HKSleepDurationGoalContext)initWithBaseDisplayType:(id)a3 overlayDisplayType:(id)a4 overlayChartController:(id)a5 overlayMode:(int64_t)a6 isPrimaryContext:(BOOL)a7 contextChangeDelegate:(id)a8
{
  id v25 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_HKSleepDurationGoalContext;
  v18 = [(_HKSleepDurationGoalContext *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_baseDisplayType, a3);
    objc_storeStrong((id *)&v19->_overlayChartController, a5);
    objc_storeStrong((id *)&v19->_overlayDisplayType, a4);
    v19->_overlayMode = a6;
    v19->_isPrimaryContext = a7;
    uint64_t v20 = [(_HKSleepDurationGoalContext *)v19 _durationContextItemWithGoal:&stru_1F3B9CF20];
    lastUpdatedItem = v19->_lastUpdatedItem;
    v19->_lastUpdatedItem = (HKDisplayTypeContextItem *)v20;

    uint64_t v22 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2BA20]];
    monitoringSampleType = v19->_monitoringSampleType;
    v19->_monitoringSampleType = (HKSampleType *)v22;

    objc_storeWeak((id *)&v19->_contextChangeDelegate, v17);
  }

  return v19;
}

- (id)baseDisplayTypeForOverlay:(int64_t)a3
{
  if ([(_HKSleepDurationGoalContext *)self isPrimaryContext])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(_HKSleepDurationGoalContext *)self baseDisplayType];
  }
  return v4;
}

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return 0;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a7;
  v12 = [(_HKSleepDurationGoalContext *)self overlayDisplayType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v14 = [(_HKSleepDurationGoalContext *)self overlayDisplayType];
    id v15 = [(_HKSleepDurationGoalContext *)self overlayChartController];
    id v16 = [v14 graphSeriesForTimeScope:a5];
    id v17 = [v10 startDate];
    v18 = [v10 endDate];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __114___HKSleepDurationGoalContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    v19[3] = &unk_1E6D51BB8;
    v19[4] = self;
    id v20 = v11;
    [v15 cachedDataForCustomGraphSeries:v16 timeScope:a5 resolution:0 startDate:v17 endDate:v18 completion:v19];
  }
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  BOOL v5 = a3;
  id v6 = [(_HKSleepDurationGoalContext *)self contextChangeDelegate];
  [v6 setDurationContextSelected:v5];
}

- (id)_durationContextItemWithGoal:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(HKDisplayTypeContextItem);
  id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"SLEEP_GOAL_CONTEXT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
  [(HKDisplayTypeContextItem *)v5 setTitle:v7];

  v8 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", @"SLEEP_GOAL_CONTEXT");
  [(HKDisplayTypeContextItem *)v5 setAccessibilityIdentifier:v8];

  [(HKDisplayTypeContextItem *)v5 setInfoHidden:1];
  [(HKDisplayTypeContextItem *)v5 setUnit:&stru_1F3B9CF20];
  [(HKDisplayTypeContextItem *)v5 setValue:v4];

  if ([(_HKSleepDurationGoalContext *)self overlayMode] == 3)
  {
    v9 = [(_HKSleepDurationGoalContext *)self contextChangeDelegate];
    if ([v9 shouldHighlightBaseDisplayContext])
    {
      id v10 = [(_HKSleepDurationGoalContext *)self contextChangeDelegate];
      char v11 = [v10 baseDisplayIsSchedule];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepOverlayTintColor");
        goto LABEL_8;
      }
    }
    else
    {
    }
    uint64_t v12 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
LABEL_8:
  v13 = (void *)v12;
  v14 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v12];
  [(HKDisplayTypeContextItem *)v5 setMetricColors:v14];

  id v15 = +[HKUIMetricColors sleepColors];
  [(HKDisplayTypeContextItem *)v5 setSelectedMetricColors:v15];

  return v5;
}

- (id)_goalGivenChartPoints:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3 || ![v3 count])
  {
    id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v16 = [v5 localizedStringForKey:@"SLEEP_NO_GOAL_CONTEXT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
    goto LABEL_22;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = objc_msgSend(v11, "goalValue", (void)v19);
          if (v12) {
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    if ((unint64_t)[v5 count] < 2)
    {
      v14 = [v5 anyObject];
      uint64_t v17 = HKTimePeriodString(v14, 12);
      goto LABEL_21;
    }
    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v14 = v13;
    id v15 = @"SLEEP_MULTIPLE_GOAL_CONTEXT";
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v14 = v13;
    id v15 = @"SLEEP_NO_GOAL_CONTEXT";
  }
  uint64_t v17 = objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1F3B9CF20, @"HealthUI-Localizable-Eucalyptus", (void)v19);
LABEL_21:
  id v16 = (void *)v17;

LABEL_22:
  return v16;
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

- (int64_t)overlayMode
{
  return self->_overlayMode;
}

- (BOOL)isPrimaryContext
{
  return self->_isPrimaryContext;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
}

- (HKSampleType)monitoringSampleType
{
  return self->_monitoringSampleType;
}

- (void)setMonitoringSampleType:(id)a3
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
  objc_storeStrong((id *)&self->_monitoringSampleType, 0);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end