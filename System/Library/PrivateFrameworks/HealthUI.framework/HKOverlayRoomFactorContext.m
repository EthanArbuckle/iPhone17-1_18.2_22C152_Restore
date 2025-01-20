@interface HKOverlayRoomFactorContext
+ (double)_distanceBetween:(id)a3 otherDate:(id)a4;
+ (id)_alignDate:(id)a3 timeScope:(int64_t)a4 alignment:(int64_t)a5 calendar:(id)a6;
+ (id)_currentGraphView:(id)a3;
+ (id)_currentVisibleDateRange:(id)a3;
+ (id)_dateIntervalToValueRange:(id)a3;
+ (id)_leadingPredicateForRange:(id)a3;
+ (id)_leadingSortDescriptors;
+ (id)_trailingPredicateForRange:(id)a3;
+ (id)_trailingSortDescriptors;
+ (id)factorDateIntervalsWithChartPoints:(id)a3 dateInterval:(id)a4 timeScope:(int64_t)a5 calendar:(id)a6 intersection:(BOOL)a7;
+ (id)factorStackHeight;
- (BOOL)allowsDeselection;
- (BOOL)canSelectOverlayContextItem:(id)a3 isDeselecting:(BOOL)a4 timeScope:(int64_t)a5 chartController:(id)a6;
- (BOOL)directPrimaryDisplayType;
- (BOOL)healthFactorContext;
- (HKOverlayRoomFactorContext)initWithPrimaryDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 allowsDeselection:(BOOL)a9;
- (HKOverlayRoomFactorContext)initWithPrimaryInteractiveChartDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 allowsDeselection:(BOOL)a9;
- (HKOverlayRoomFactorContext)initWithPrimaryInteractiveChartDisplayType:(id)a3 interactiveChartFactorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8;
- (NSArray)preservedLegendEntries;
- (id)_findFirstGraphSeries:(id)a3;
- (id)stackedContextButtonBackground;
- (id)stackedHeight;
- (int64_t)overlayMode;
- (void)_toggleSeriesLegend:(BOOL)a3 chartController:(id)a4;
- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5;
- (void)setPreservedLegendEntries:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation HKOverlayRoomFactorContext

+ (id)factorStackHeight
{
  v2 = [[HKInteractiveChartStackHeight alloc] initWithKind:1 heightValue:50.0];
  return v2;
}

- (HKOverlayRoomFactorContext)initWithPrimaryDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 allowsDeselection:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  v20 = [v17 healthStore];
  BOOL v21 = +[HKInteractiveChartInfographicFactory infographicSupportedForDisplayType:v15 factorDisplayType:v16 healthStore:v20];

  v22 = [v16 objectType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomFactorContext.m" lineNumber:48 description:@"HKOverlayRoomFactorContext: only category types are supported."];
  }
  v24 = [v15 sampleType];
  v25 = [v16 sampleType];
  v31.receiver = self;
  v31.super_class = (Class)HKOverlayRoomFactorContext;
  v26 = [(HKOverlayRoomStackedContext *)&v31 initWithSampleType:v24 overlayDisplayType:0 stackedSampleType:v25 overlayChartController:v19 currentCalendarOverride:v18 applicationItems:v17 isInfoButtonHidden:!v21];

  if (v26)
  {
    v26->_overlayMode = a8;
    v26->_directPrimaryDisplayType = 0;
    preservedLegendEntries = v26->_preservedLegendEntries;
    v26->_preservedLegendEntries = 0;

    v26->_allowsDeselection = a9;
  }

  return v26;
}

- (HKOverlayRoomFactorContext)initWithPrimaryInteractiveChartDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 allowsDeselection:(BOOL)a9
{
  id v15 = a4;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a3;
  uint64_t v20 = [v19 baseDisplayType];
  BOOL v21 = [v16 healthStore];
  BOOL v22 = +[HKInteractiveChartInfographicFactory infographicSupportedForDisplayType:v20 factorDisplayType:v15 healthStore:v21];

  v23 = [v15 objectType];
  objc_opt_class();
  LOBYTE(v20) = objc_opt_isKindOfClass();

  if ((v20 & 1) == 0)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomFactorContext.m" lineNumber:77 description:@"HKOverlayRoomFactorContext: only category types are supported."];
  }
  v24 = [v15 sampleType];
  v30.receiver = self;
  v30.super_class = (Class)HKOverlayRoomFactorContext;
  v25 = [(HKOverlayRoomStackedContext *)&v30 initWithDisplayType:v19 overlayDisplayType:0 stackedSampleType:v24 overlayChartController:v18 currentCalendarOverride:v17 applicationItems:v16 isInfoButtonHidden:!v22];

  if (v25)
  {
    v25->_overlayMode = a8;
    v25->_directPrimaryDisplayType = 1;
    preservedLegendEntries = v25->_preservedLegendEntries;
    v25->_preservedLegendEntries = 0;

    v25->_allowsDeselection = a9;
  }

  return v25;
}

- (HKOverlayRoomFactorContext)initWithPrimaryInteractiveChartDisplayType:(id)a3 interactiveChartFactorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  uint64_t v20 = [v16 objectType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomFactorContext.m" lineNumber:100 description:@"HKOverlayRoomFactorContext: only category types are supported."];
  }
  v27.receiver = self;
  v27.super_class = (Class)HKOverlayRoomFactorContext;
  BOOL v22 = [(HKOverlayRoomStackedContext *)&v27 initWithDisplayType:v15 overlayDisplayType:0 stackedDisplayType:v16 overlayChartController:v17 currentCalendarOverride:v18 applicationItems:v19 isInfoButtonHidden:1];
  v23 = v22;
  if (v22)
  {
    v22->_overlayMode = a8;
    v22->_directPrimaryDisplayType = 1;
    preservedLegendEntries = v22->_preservedLegendEntries;
    v22->_preservedLegendEntries = 0;

    v23->_allowsDeselection = 1;
  }

  return v23;
}

- (id)stackedContextButtonBackground
{
  v2 = [(HKOverlayRoomFactorContext *)self overlayMode];
  if ((unint64_t)v2 >= 3)
  {
    if (v2 == (void *)3)
    {
      v2 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  return v2;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  objc_initWeak(&location, self);
  v25[0] = v12;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
  v19[3] = &unk_1E6D54528;
  objc_copyWeak(v23, &location);
  id v16 = v13;
  id v20 = v16;
  id v17 = v12;
  id v21 = v17;
  v23[1] = (id)a5;
  id v18 = v14;
  id v22 = v18;
  v23[2] = (id)a6;
  [(HKOverlayRoomStackedContext *)self chartPointsForChartPointType:1 dateIntervals:v15 overlayChartController:v16 dateIntervalMustMatchView:1 timeScope:a5 resolution:a6 completion:v19];

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

void __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v13 = WeakRetained;
  if (a4)
  {
    id v14 = [WeakRetained displayType];
    id v15 = [*(id *)(a1 + 32) selectedRangeFormatter];
    v29 = +[HKOverlayPillValueProvidingFactory overlayPillValueProviderForDisplayType:selectedRangeFormatter:interfaceLayout:](HKOverlayPillValueProvidingFactory, "overlayPillValueProviderForDisplayType:selectedRangeFormatter:interfaceLayout:", v14, v15, +[HKOverlayPillValueProvidingFactory interfaceLayoutForController:*(void *)(a1 + 32)]);

    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 40);
    id v18 = [*(id *)(a1 + 32) currentCalendar];
    id v19 = +[HKOverlayRoomFactorContext factorDateIntervalsWithChartPoints:v9 dateInterval:v17 timeScope:v16 calendar:v18 intersection:1];

    if ([v19 count])
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 64);
      uint64_t v22 = *(void *)(a1 + 72);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_3;
      v30[3] = &unk_1E6D54500;
      id v31 = v29;
      v32 = v13;
      uint64_t v34 = *(void *)(a1 + 64);
      id v33 = *(id *)(a1 + 48);
      [v13 chartPointsForChartPointType:0 dateIntervals:v19 overlayChartController:v20 dateIntervalMustMatchView:0 timeScope:v21 resolution:v22 completion:v30];

      v23 = v31;
    }
    else
    {
      v24 = [v13 displayType];
      uint64_t v25 = *(void *)(a1 + 64);
      v26 = [v13 applicationItems];
      objc_super v27 = [v26 unitController];
      v23 = [v29 valueFromChartPoints:MEMORY[0x1E4F1CBF0] unit:v10 displayType:v24 timeScope:v25 unitPreferenceController:v27];

      uint64_t v28 = *(void *)(a1 + 64);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
      v35[3] = &unk_1E6D52FB8;
      id v36 = *(id *)(a1 + 48);
      [v13 setLastUpdatedItemFromPillValue:v23 timeScope:v28 completion:v35];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) displayType];
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = [*(id *)(a1 + 40) applicationItems];
    id v13 = [v12 unitController];
    id v14 = [v9 valueFromChartPoints:v7 unit:v8 displayType:v10 timeScope:v11 unitPreferenceController:v13];

    uint64_t v15 = *(void *)(a1 + 56);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_4;
    v17[3] = &unk_1E6D52FB8;
    uint64_t v16 = *(void **)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    [v16 setLastUpdatedItemFromPillValue:v14 timeScope:v15 completion:v17];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canSelectOverlayContextItem:(id)a3 isDeselecting:(BOOL)a4 timeScope:(int64_t)a5 chartController:(id)a6
{
  return [(HKOverlayRoomFactorContext *)self allowsDeselection] || !a4;
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  if ([(HKOverlayRoomFactorContext *)self directPrimaryDisplayType]) {
    [(HKOverlayRoomFactorContext *)self _toggleSeriesLegend:v5 chartController:v7];
  }
}

- (void)_toggleSeriesLegend:(BOOL)a3 chartController:(id)a4
{
  BOOL v4 = a3;
  v6 = [(HKOverlayRoomFactorContext *)self _findFirstGraphSeries:a4];
  if (v6)
  {
    id v12 = v6;
    if (v4)
    {
      id v7 = [v6 titleLegendEntries];
      [(HKOverlayRoomFactorContext *)self setPreservedLegendEntries:v7];

      id v8 = [(HKOverlayRoomStackedContext *)self displayType];
      id v9 = [v8 baseDisplayType];

      id v10 = [v9 localization];
      uint64_t v11 = [v10 shortenedDisplayName];
      +[HKOverlayContextUtilities setStackedSeriesLegend:v12 title:v11];
    }
    else
    {
      id v9 = [(HKOverlayRoomFactorContext *)self preservedLegendEntries];
      [v12 setTitleLegendEntries:v9];
    }

    v6 = v12;
  }
}

- (id)_findFirstGraphSeries:(id)a3
{
  v3 = [a3 primaryGraphViewController];
  BOOL v4 = [v3 graphView];

  if (v4)
  {
    BOOL v5 = [v4 allSeries];
    v6 = [v5 firstObject];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)factorDateIntervalsWithChartPoints:(id)a3 dateInterval:(id)a4 timeScope:(int64_t)a5 calendar:(id)a6 intersection:(BOOL)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __110__HKOverlayRoomFactorContext_factorDateIntervalsWithChartPoints_dateInterval_timeScope_calendar_intersection___block_invoke;
  v31[3] = &unk_1E6D54550;
  id v16 = v15;
  id v32 = v16;
  BOOL v37 = a7;
  id v17 = v13;
  id v33 = v17;
  id v35 = a1;
  int64_t v36 = a5;
  id v18 = v14;
  id v34 = v18;
  id v19 = objc_msgSend(v12, "hk_map:", v31);
  if ((unint64_t)[v19 count] >= 2)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F2AEE8]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          objc_msgSend(v20, "insertInterval:", *(void *)(*((void *)&v27 + 1) + 8 * i), (void)v27);
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v38 count:16];
      }
      while (v23);
    }

    id v19 = [v20 mergedIntervals];
  }
  return v19;
}

id __110__HKOverlayRoomFactorContext_factorDateIntervalsWithChartPoints_dateInterval_timeScope_calendar_intersection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 minXValueAsGenericType];
  BOOL v5 = [v3 maxXValueAsGenericType];

  if (objc_msgSend(v5, "hk_isAfterDate:", *(void *)(a1 + 32)))
  {
    id v6 = *(id *)(a1 + 32);

    BOOL v5 = v6;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    id v7 = [*(id *)(a1 + 40) startDate];
    int v8 = objc_msgSend(v7, "hk_isAfterDate:", v4);

    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 40) startDate];

      BOOL v4 = (void *)v9;
    }
    id v10 = [*(id *)(a1 + 40) endDate];
    int v11 = objc_msgSend(v10, "hk_isBeforeDate:", v5);

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 40) endDate];

      BOOL v5 = (void *)v12;
    }
  }
  id v13 = [v4 dateByAddingTimeInterval:0.01];
  id v14 = [v5 dateByAddingTimeInterval:-0.01];
  uint64_t v15 = [*(id *)(a1 + 56) _alignDate:v13 timeScope:*(void *)(a1 + 64) alignment:0 calendar:*(void *)(a1 + 48)];
  id v16 = [*(id *)(a1 + 56) _alignDate:v14 timeScope:*(void *)(a1 + 64) alignment:2 calendar:*(void *)(a1 + 48)];
  id v17 = 0;
  if (objc_msgSend(v15, "hk_isBeforeDate:", v16)) {
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v15 endDate:v16];
  }

  return v17;
}

+ (id)_alignDate:(id)a3 timeScope:(int64_t)a4 alignment:(int64_t)a5 calendar:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  int v11 = +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:](HKGraphZoomLevelConfiguration, "chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:", a4, v9, a5, 0, v10, [v10 firstWeekday], 0, 0);

  id v12 = v9;
  id v13 = v12;
  if (a5 == 2)
  {
    uint64_t v15 = [v11 endDate];
  }
  else
  {
    id v14 = v12;
    if (a5) {
      goto LABEL_6;
    }
    uint64_t v15 = [v11 startDate];
  }
  id v14 = (void *)v15;

LABEL_6:
  return v14;
}

+ (id)_leadingPredicateForRange:(id)a3
{
  id v3 = [a3 endDate];
  BOOL v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate <= %@", v3];

  return v4;
}

+ (id)_leadingSortDescriptors
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A9A0] ascending:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)_trailingPredicateForRange:(id)a3
{
  id v3 = [a3 startDate];
  BOOL v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"endDate >= %@", v3];

  return v4;
}

+ (id)_trailingSortDescriptors
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A9B8] ascending:1];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (double)_distanceBetween:(id)a3 otherDate:(id)a4
{
  if (!a4) {
    return 1.79769313e308;
  }
  id v5 = a4;
  [a3 timeIntervalSinceReferenceDate];
  double v7 = v6;
  [v5 timeIntervalSinceReferenceDate];
  double v9 = v8;

  return vabdd_f64(v7, v9);
}

+ (id)_dateIntervalToValueRange:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 startDate];
  id v5 = [v3 endDate];

  double v6 = +[HKValueRange valueRangeWithMinValue:v4 maxValue:v5];

  return v6;
}

+ (id)_currentGraphView:(id)a3
{
  id v3 = [a3 primaryGraphViewController];
  BOOL v4 = [v3 graphView];

  return v4;
}

+ (id)_currentVisibleDateRange:(id)a3
{
  id v3 = [a1 _currentGraphView:a3];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 actualVisibleRange];
    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
      double v7 = [v5 startDate];
      double v8 = [v5 endDate];
      double v9 = (void *)[v6 initWithStartDate:v7 endDate:v8];
    }
    else
    {
      double v9 = 0;
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)stackedHeight
{
  v2 = [[HKInteractiveChartStackHeight alloc] initWithKind:1 heightValue:50.0];
  return v2;
}

- (BOOL)healthFactorContext
{
  return 1;
}

- (int64_t)overlayMode
{
  return self->_overlayMode;
}

- (BOOL)directPrimaryDisplayType
{
  return self->_directPrimaryDisplayType;
}

- (NSArray)preservedLegendEntries
{
  return self->_preservedLegendEntries;
}

- (void)setPreservedLegendEntries:(id)a3
{
}

- (BOOL)allowsDeselection
{
  return self->_allowsDeselection;
}

- (void).cxx_destruct
{
}

@end