@interface _HKSleepScheduleContext
- (BOOL)isPrimaryContext;
- (BOOL)unselectedContextShouldUseContextBaseType;
- (HKDisplayType)baseDisplayType;
- (HKDisplayType)overlayDisplayType;
- (HKDisplayTypeContextItem)lastUpdatedItem;
- (HKInteractiveChartOverlayViewController)overlayChartController;
- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate;
- (HKSampleType)monitoringSampleType;
- (_HKSleepScheduleContext)initWithBaseDisplayType:(id)a3 overlayDisplayType:(id)a4 overlayChartController:(id)a5 overlayMode:(int64_t)a6 isPrimaryContext:(BOOL)a7 contextChangeDelegate:(id)a8;
- (id)_scheduleContextItemWithPhrase:(id)a3;
- (id)_schedulePhraseFromChartPoints:(id)a3;
- (id)_schedulePhraseFromUpperGoal:(id)a3 lowerGoal:(id)a4;
- (id)_stringFromGoalOffset:(id)a3;
- (id)baseDisplayTypeForOverlay:(int64_t)a3;
- (int64_t)overlayMode;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5;
- (void)setLastUpdatedItem:(id)a3;
- (void)setMonitoringSampleType:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation _HKSleepScheduleContext

- (_HKSleepScheduleContext)initWithBaseDisplayType:(id)a3 overlayDisplayType:(id)a4 overlayChartController:(id)a5 overlayMode:(int64_t)a6 isPrimaryContext:(BOOL)a7 contextChangeDelegate:(id)a8
{
  id v25 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_HKSleepScheduleContext;
  v18 = [(_HKSleepScheduleContext *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_baseDisplayType, a3);
    objc_storeStrong((id *)&v19->_overlayDisplayType, a4);
    objc_storeStrong((id *)&v19->_overlayChartController, a5);
    v19->_overlayMode = a6;
    v19->_isPrimaryContext = a7;
    uint64_t v20 = [MEMORY[0x1E4F2B2C0] sleepScheduleType];
    monitoringSampleType = v19->_monitoringSampleType;
    v19->_monitoringSampleType = (HKSampleType *)v20;

    objc_storeWeak((id *)&v19->_contextChangeDelegate, v17);
    uint64_t v22 = [(_HKSleepScheduleContext *)v19 _scheduleContextItemWithPhrase:&stru_1F3B9CF20];
    lastUpdatedItem = v19->_lastUpdatedItem;
    v19->_lastUpdatedItem = (HKDisplayTypeContextItem *)v22;
  }
  return v19;
}

- (id)baseDisplayTypeForOverlay:(int64_t)a3
{
  if ([(_HKSleepScheduleContext *)self isPrimaryContext])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(_HKSleepScheduleContext *)self baseDisplayType];
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
  v12 = [(_HKSleepScheduleContext *)self baseDisplayType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v14 = [(_HKSleepScheduleContext *)self baseDisplayType];
    id v15 = [(_HKSleepScheduleContext *)self overlayChartController];
    id v16 = [v14 graphSeriesForTimeScope:a5];
    id v17 = [v10 startDate];
    v18 = [v10 endDate];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __110___HKSleepScheduleContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
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
  id v6 = [(_HKSleepScheduleContext *)self contextChangeDelegate];
  [v6 setScheduleContextSelected:v5];
}

- (id)_schedulePhraseFromChartPoints:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4 || ![v4 count])
  {
    v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v23 = [v19 localizedStringForKey:@"SLEEP_NO_SCHEDULE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
    goto LABEL_25;
  }
  id v25 = v5;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          uint64_t v13 = [v12 upperGoal];
          if (v13)
          {
            v14 = (void *)v13;
            id v15 = [v12 lowerGoal];

            if (v15)
            {
              id v16 = [v12 upperGoal];
              id v17 = [v12 lowerGoal];
              v18 = [(_HKSleepScheduleContext *)self _schedulePhraseFromUpperGoal:v16 lowerGoal:v17];

              if (v18) {
                [v26 addObject:v18];
              }
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  v19 = v26;
  if ([v26 count])
  {
    if ((unint64_t)[v26 count] < 2)
    {
      v23 = [v26 anyObject];
      goto LABEL_24;
    }
    id v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v21 = v20;
    uint64_t v22 = @"SLEEP_MULTIPLE_SCHEDULES";
  }
  else
  {
    id v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v21 = v20;
    uint64_t v22 = @"SLEEP_NO_SCHEDULE";
  }
  v23 = objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1F3B9CF20, @"HealthUI-Localizable-Eucalyptus", v5);

LABEL_24:
  BOOL v5 = v25;
LABEL_25:

  return v23;
}

- (id)_scheduleContextItemWithPhrase:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(HKDisplayTypeContextItem);
  id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v7 = [v6 localizedStringForKey:@"SLEEP_SCHEDULE_CONTEXT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
  [(HKDisplayTypeContextItem *)v5 setTitle:v7];

  uint64_t v8 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", @"SLEEP_SCHEDULE_CONTEXT");
  [(HKDisplayTypeContextItem *)v5 setAccessibilityIdentifier:v8];

  [(HKDisplayTypeContextItem *)v5 setInfoHidden:1];
  [(HKDisplayTypeContextItem *)v5 setUnit:&stru_1F3B9CF20];
  [(HKDisplayTypeContextItem *)v5 setValue:v4];

  if ([(_HKSleepScheduleContext *)self overlayMode] == 3)
  {
    uint64_t v9 = [(_HKSleepScheduleContext *)self contextChangeDelegate];
    if ([v9 shouldHighlightBaseDisplayContext])
    {
      id v10 = [(_HKSleepScheduleContext *)self contextChangeDelegate];
      int v11 = [v10 baseDisplayIsSchedule];

      if (v11)
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
  uint64_t v13 = (void *)v12;
  v14 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v12];
  [(HKDisplayTypeContextItem *)v5 setMetricColors:v14];

  id v15 = +[HKUIMetricColors sleepColors];
  [(HKDisplayTypeContextItem *)v5 setSelectedMetricColors:v15];

  return v5;
}

- (id)_schedulePhraseFromUpperGoal:(id)a3 lowerGoal:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(_HKSleepScheduleContext *)self _stringFromGoalOffset:a4];
  uint64_t v8 = [(_HKSleepScheduleContext *)self _stringFromGoalOffset:v6];

  uint64_t v9 = NSString;
  id v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  int v11 = [v10 localizedStringForKey:@"SLEEP_SCHEDULE_PHRASE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
  uint64_t v12 = objc_msgSend(v9, "stringWithFormat:", v11, v7, v8);

  return v12;
}

- (id)_stringFromGoalOffset:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  BOOL v5 = [v3 currentCalendar];
  HKCalendarDateTransformPreceding6PM();
  id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  uint64_t v8 = ((void (**)(void, void *, void *))v6)[2](v6, v5, v7);

  [v4 doubleValue];
  double v10 = v9;

  int v11 = [v8 dateByAddingTimeInterval:v10];
  uint64_t v12 = HKLocalizedStringForDateAndTemplate(v11, 27);

  return v12;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
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

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
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
  objc_storeStrong((id *)&self->_overlayChartController, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
}

@end