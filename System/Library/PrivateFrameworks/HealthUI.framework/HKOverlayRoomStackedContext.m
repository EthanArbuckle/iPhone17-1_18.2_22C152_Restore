@interface HKOverlayRoomStackedContext
+ (id)_generateNamedDataSourceForTemplateDisplayType:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 currentTimeScope:(int64_t)a6 currentCalendar:(id)a7;
+ (id)generateCustomSeriesWithTemplateDisplayType:(id)a3 sampleType:(id)a4 applicationItems:(id)a5 currentTimeScope:(int64_t)a6;
+ (id)generateDisplayTypeForTemplateDisplayType:(id)a3 sampleType:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 currentTimeScope:(int64_t)a7 currentCalendar:(id)a8;
- (BOOL)_obsoleteDateRange:(id)a3 overlayController:(id)a4;
- (BOOL)canSelectOverlayContextItem:(id)a3 isDeselecting:(BOOL)a4 timeScope:(int64_t)a5 chartController:(id)a6;
- (BOOL)isInfoButtonHidden;
- (HKDisplayType)overlayDisplayType;
- (HKDisplayType)stackedTemplateDisplayType;
- (HKDisplayType)templateDisplayType;
- (HKDisplayTypeContextItem)lastUpdatedItem;
- (HKInteractiveChartDisplayType)displayType;
- (HKInteractiveChartDisplayType)stackedBaseDisplayType;
- (HKOverlayRoomApplicationItems)applicationItems;
- (HKOverlayRoomStackedContext)initWithDisplayType:(id)a3 overlayDisplayType:(id)a4 stackedDisplayType:(id)a5 overlayChartController:(id)a6 currentCalendarOverride:(id)a7 applicationItems:(id)a8 isInfoButtonHidden:(BOOL)a9;
- (HKOverlayRoomStackedContext)initWithDisplayType:(id)a3 overlayDisplayType:(id)a4 stackedSampleType:(id)a5 overlayChartController:(id)a6 currentCalendarOverride:(id)a7 applicationItems:(id)a8 isInfoButtonHidden:(BOOL)a9;
- (HKOverlayRoomStackedContext)initWithDisplayType:(id)a3 templateDisplayType:(id)a4 sampleType:(id)a5 overlayDisplayType:(id)a6 stackedDisplayType:(id)a7 stackedTemplateDisplayType:(id)a8 stackedSampleType:(id)a9 overlayChartController:(id)a10 currentTimeScope:(int64_t)a11 currentCalendar:(id)a12 applicationItems:(id)a13 isInfoButtonHidden:(BOOL)a14;
- (HKOverlayRoomStackedContext)initWithSampleType:(id)a3 overlayDisplayType:(id)a4 stackedDisplayType:(id)a5 overlayChartController:(id)a6 currentCalendarOverride:(id)a7 applicationItems:(id)a8 isInfoButtonHidden:(BOOL)a9;
- (HKOverlayRoomStackedContext)initWithSampleType:(id)a3 overlayDisplayType:(id)a4 stackedSampleType:(id)a5 overlayChartController:(id)a6 currentCalendarOverride:(id)a7 applicationItems:(id)a8 isInfoButtonHidden:(BOOL)a9;
- (HKSampleType)sampleType;
- (HKSampleType)stackedSampleType;
- (NSCalendar)currentCalendar;
- (id)_buildContextItemWithAttributedValue:(id)a3 valueContext:(id)a4 forTimeScope:(int64_t)a5;
- (id)_canonicalUnitOverrideForDisplayType:(id)a3;
- (id)_contextItemTitleForDisplayType:(id)a3 timeScope:(int64_t)a4;
- (id)_generateDisplayTypeForTemplateDisplayType:(id)a3 sampleType:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 currentTimeScope:(int64_t)a7 currentCalendar:(id)a8;
- (id)_setupContextItemForDisplayType:(id)a3 timeScope:(int64_t)a4 valueContext:(id)a5;
- (id)buildContextItemWithValue:(id)a3 unit:(id)a4 valueContext:(id)a5 forTimeScope:(int64_t)a6;
- (id)contextItemForLastUpdate;
- (id)stackedBaseDisplayTypeForOverlay:(int64_t)a3;
- (id)stackedContextButtonBackground;
- (id)stackedOverlayDisplayTypeForTimeScope:(int64_t)a3;
- (int64_t)currentTimeScope;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)_setAccessibiltyIdentifier:(id)a3 displayType:(id)a4;
- (void)chartPointsForChartPointType:(unint64_t)a3 dateIntervals:(id)a4 overlayChartController:(id)a5 dateIntervalMustMatchView:(BOOL)a6 timeScope:(int64_t)a7 resolution:(int64_t)a8 completion:(id)a9;
- (void)setCurrentCalendar:(id)a3;
- (void)setCurrentTimeScope:(int64_t)a3;
- (void)setIsInfoButtonHidden:(BOOL)a3;
- (void)setLastUpdatedItem:(id)a3;
- (void)setLastUpdatedItemFromPillValue:(id)a3 timeScope:(int64_t)a4 completion:(id)a5;
- (void)setStackedTemplateDisplayType:(id)a3;
- (void)setTemplateDisplayType:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation HKOverlayRoomStackedContext

- (HKOverlayRoomStackedContext)initWithSampleType:(id)a3 overlayDisplayType:(id)a4 stackedSampleType:(id)a5 overlayChartController:(id)a6 currentCalendarOverride:(id)a7 applicationItems:(id)a8 isInfoButtonHidden:(BOOL)a9
{
  id v15 = a3;
  id v38 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v39 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v21 = v20;
  v22 = [v19 timeScopeController];
  uint64_t v23 = [v22 selectedTimeScope];

  v24 = [v19 displayTypeController];
  v25 = [v24 displayTypeForObjectType:v15];

  v35 = [(HKOverlayRoomStackedContext *)self _generateDisplayTypeForTemplateDisplayType:v25 sampleType:v15 overlayChartController:v17 applicationItems:v19 currentTimeScope:v23 currentCalendar:v21];
  [v19 displayTypeController];
  id v26 = v15;
  v27 = v36 = v15;
  [v27 displayTypeForObjectType:v16];
  v28 = v21;
  v29 = self;
  v31 = v30 = v16;

  v32 = [(HKOverlayRoomStackedContext *)v29 _generateDisplayTypeForTemplateDisplayType:v31 sampleType:v30 overlayChartController:v17 applicationItems:v19 currentTimeScope:v23 currentCalendar:v28];
  LOBYTE(v34) = a9;
  v37 = [(HKOverlayRoomStackedContext *)v29 initWithDisplayType:v35 templateDisplayType:v25 sampleType:v26 overlayDisplayType:v38 stackedDisplayType:v32 stackedTemplateDisplayType:v31 stackedSampleType:v30 overlayChartController:v17 currentTimeScope:v23 currentCalendar:v39 applicationItems:v19 isInfoButtonHidden:v34];

  return v37;
}

- (HKOverlayRoomStackedContext)initWithSampleType:(id)a3 overlayDisplayType:(id)a4 stackedDisplayType:(id)a5 overlayChartController:(id)a6 currentCalendarOverride:(id)a7 applicationItems:(id)a8 isInfoButtonHidden:(BOOL)a9
{
  id v15 = a3;
  id v40 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v38 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v21 = v20;
  v37 = v20;
  v22 = [v19 timeScopeController];
  uint64_t v23 = [v22 selectedTimeScope];

  v24 = [v19 displayTypeController];
  v25 = [v24 displayTypeForObjectType:v15];

  v35 = [(HKOverlayRoomStackedContext *)self _generateDisplayTypeForTemplateDisplayType:v25 sampleType:v15 overlayChartController:v17 applicationItems:v19 currentTimeScope:v23 currentCalendar:v21];
  [v19 displayTypeController];
  v27 = id v26 = self;
  v28 = [v16 sampleType];
  v29 = [v27 displayTypeForObjectType:v28];
  uint64_t v30 = [v16 sampleType];
  id v31 = v15;
  v36 = v15;
  v32 = (void *)v30;
  LOBYTE(v34) = a9;
  v39 = -[HKOverlayRoomStackedContext initWithDisplayType:templateDisplayType:sampleType:overlayDisplayType:stackedDisplayType:stackedTemplateDisplayType:stackedSampleType:overlayChartController:currentTimeScope:currentCalendar:applicationItems:isInfoButtonHidden:](v26, "initWithDisplayType:templateDisplayType:sampleType:overlayDisplayType:stackedDisplayType:stackedTemplateDisplayType:stackedSampleType:overlayChartController:currentTimeScope:currentCalendar:applicationItems:isInfoButtonHidden:", v35, v25, v31, v40, v30, v17, v23, v38, v19, v34);

  return v39;
}

- (HKOverlayRoomStackedContext)initWithDisplayType:(id)a3 overlayDisplayType:(id)a4 stackedDisplayType:(id)a5 overlayChartController:(id)a6 currentCalendarOverride:(id)a7 applicationItems:(id)a8 isInfoButtonHidden:(BOOL)a9
{
  id v14 = a3;
  id v36 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v33 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = v19;
  id v20 = [v18 timeScopeController];
  uint64_t v21 = [v20 selectedTimeScope];

  v22 = [v14 sampleType];
  uint64_t v23 = [v18 displayTypeController];
  v24 = [v15 sampleType];
  v25 = [v23 displayTypeForObjectType:v24];
  uint64_t v26 = [v15 sampleType];
  id v27 = v14;
  id v31 = v14;
  v28 = (void *)v26;
  LOBYTE(v30) = a9;
  v35 = [(HKOverlayRoomStackedContext *)self initWithDisplayType:v27 templateDisplayType:0 sampleType:v22 overlayDisplayType:v36 stackedDisplayType:v15 stackedTemplateDisplayType:v25 stackedSampleType:v26 overlayChartController:v16 currentTimeScope:v21 currentCalendar:v32 applicationItems:v18 isInfoButtonHidden:v30];

  return v35;
}

- (HKOverlayRoomStackedContext)initWithDisplayType:(id)a3 overlayDisplayType:(id)a4 stackedSampleType:(id)a5 overlayChartController:(id)a6 currentCalendarOverride:(id)a7 applicationItems:(id)a8 isInfoButtonHidden:(BOOL)a9
{
  id v15 = a3;
  id v34 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v33 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v21 = v20;
  v22 = [v19 timeScopeController];
  uint64_t v23 = [v22 selectedTimeScope];

  v24 = [v19 displayTypeController];
  v25 = [v24 displayTypeForObjectType:v16];

  uint64_t v26 = [(HKOverlayRoomStackedContext *)self _generateDisplayTypeForTemplateDisplayType:v25 sampleType:v16 overlayChartController:v17 applicationItems:v19 currentTimeScope:v23 currentCalendar:v21];
  uint64_t v27 = [v15 sampleType];
  v28 = self;
  v29 = (void *)v27;
  LOBYTE(v32) = a9;
  uint64_t v30 = [(HKOverlayRoomStackedContext *)v28 initWithDisplayType:v15 templateDisplayType:0 sampleType:v27 overlayDisplayType:v34 stackedDisplayType:v26 stackedTemplateDisplayType:v25 stackedSampleType:v16 overlayChartController:v17 currentTimeScope:v23 currentCalendar:v21 applicationItems:v19 isInfoButtonHidden:v32];

  return v30;
}

- (HKOverlayRoomStackedContext)initWithDisplayType:(id)a3 templateDisplayType:(id)a4 sampleType:(id)a5 overlayDisplayType:(id)a6 stackedDisplayType:(id)a7 stackedTemplateDisplayType:(id)a8 stackedSampleType:(id)a9 overlayChartController:(id)a10 currentTimeScope:(int64_t)a11 currentCalendar:(id)a12 applicationItems:(id)a13 isInfoButtonHidden:(BOOL)a14
{
  id v34 = a3;
  id v33 = a4;
  id v32 = a5;
  id v31 = a6;
  id obj = a7;
  id v30 = a7;
  id v29 = a8;
  id v28 = a9;
  id v27 = a12;
  id v21 = a13;
  v22 = [(HKOverlayRoomStackedContext *)self init];
  uint64_t v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_applicationItems, a13);
    objc_storeStrong((id *)&v23->_currentCalendar, a12);
    objc_storeStrong((id *)&v23->_sampleType, a5);
    objc_storeStrong((id *)&v23->_templateDisplayType, a4);
    objc_storeStrong((id *)&v23->_displayType, a3);
    objc_storeStrong((id *)&v23->_overlayDisplayType, a6);
    objc_storeStrong((id *)&v23->_stackedSampleType, a9);
    objc_storeStrong((id *)&v23->_stackedTemplateDisplayType, a8);
    objc_storeStrong((id *)&v23->_stackedBaseDisplayType, obj);
    lastUpdatedItem = v23->_lastUpdatedItem;
    v23->_lastUpdatedItem = 0;

    v23->_currentTimeScope = a11;
    v23->_isInfoButtonHidden = a14;
  }

  return v23;
}

- (id)_generateDisplayTypeForTemplateDisplayType:(id)a3 sampleType:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 currentTimeScope:(int64_t)a7 currentCalendar:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(id)objc_opt_class() generateDisplayTypeForTemplateDisplayType:v17 sampleType:v16 overlayChartController:v15 applicationItems:v14 currentTimeScope:a7 currentCalendar:v13];

  return v18;
}

+ (id)generateDisplayTypeForTemplateDisplayType:(id)a3 sampleType:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 currentTimeScope:(int64_t)a7 currentCalendar:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = objc_msgSend(v18, "hk_interactiveChartsFormatterForTimeScope:", a7);
  id v20 = +[HKOverlayRoomStackedContext generateCustomSeriesWithTemplateDisplayType:v18 sampleType:v17 applicationItems:v15 currentTimeScope:a7];

  id v21 = [a1 _generateNamedDataSourceForTemplateDisplayType:v18 overlayChartController:v16 applicationItems:v15 currentTimeScope:a7 currentCalendar:v14];

  v22 = [HKInteractiveChartDisplayType alloc];
  uint64_t v23 = [v18 sampleType];
  v24 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v22, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v20, v18, v19, [v23 code]);

  v25 = [v16 displayTypeForGraphSeries:v20 namedDataSource:v21 templateDisplayType:v24 timeScope:a7 formatter:v19];

  return v25;
}

+ (id)generateCustomSeriesWithTemplateDisplayType:(id)a3 sampleType:(id)a4 applicationItems:(id)a5 currentTimeScope:(int64_t)a6
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 displayCategory];
  v11 = [v9 unitController];
  v12 = [v9 chartDataCacheController];

  id v13 = +[HKOverlayContextUtilities stackedAxisConfiguration];
  id v14 = objc_msgSend(v8, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:chartSizeClass:", a6, v10, v11, v12, v13, 1);

  id v15 = [v14 yAxis];
  if (v15)
  {
    id v16 = [v8 localization];
    id v17 = [v16 shortenedDisplayName];
    +[HKOverlayContextUtilities setStackedSeriesLegend:v14 title:v17];
  }
  else
  {
    _HKInitializeLogging();
    id v18 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_FAULT)) {
      +[HKOverlayRoomStackedContext generateCustomSeriesWithTemplateDisplayType:sampleType:applicationItems:currentTimeScope:](v18);
    }
  }

  return v14;
}

+ (id)_generateNamedDataSourceForTemplateDisplayType:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 currentTimeScope:(int64_t)a6 currentCalendar:(id)a7
{
  id v10 = a7;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v11 healthStore];
  id v14 = [v11 unitController];

  id v15 = objc_msgSend(v12, "hk_healthQueryChartCacheDataSourceForTimeScope:healthStore:unitController:", a6, v13, v14);

  [v15 setCalendarOverride:v10];
  id v16 = NSString;
  id v17 = [v12 sampleType];

  id v18 = objc_msgSend(v16, "stringWithFormat:", @"HKOverlayRoomStackedContext_%ld", objc_msgSend(v17, "code"));

  id v19 = [[HKInteractiveChartOverlayNamedDataSource alloc] initWithDataSource:v15 named:v18 withContextTitleForTimeScope:0];
  return v19;
}

- (BOOL)canSelectOverlayContextItem:(id)a3 isDeselecting:(BOOL)a4 timeScope:(int64_t)a5 chartController:(id)a6
{
  return !a4;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (id)stackedBaseDisplayTypeForOverlay:(int64_t)a3
{
  return self->_stackedBaseDisplayType;
}

- (id)stackedOverlayDisplayTypeForTimeScope:(int64_t)a3
{
  return 0;
}

- (id)contextItemForLastUpdate
{
  v3 = [(HKOverlayRoomStackedContext *)self lastUpdatedItem];

  if (!v3)
  {
    v4 = [(HKOverlayRoomStackedContext *)self applicationItems];
    v5 = [v4 timeScopeController];
    uint64_t v6 = [v5 selectedTimeScope];

    v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v8 = [v7 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    id v9 = [(HKOverlayRoomStackedContext *)self buildContextItemWithValue:v8 unit:0 valueContext:0 forTimeScope:v6];
    [(HKOverlayRoomStackedContext *)self setLastUpdatedItem:v9];
  }
  return [(HKOverlayRoomStackedContext *)self lastUpdatedItem];
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  objc_initWeak(&location, self);
  v23[0] = v12;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __114__HKOverlayRoomStackedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
  v18[3] = &unk_1E6D53268;
  objc_copyWeak(v21, &location);
  id v16 = v13;
  id v19 = v16;
  v21[1] = (id)a5;
  id v17 = v14;
  id v20 = v17;
  [(HKOverlayRoomStackedContext *)self chartPointsForChartPointType:1 dateIntervals:v15 overlayChartController:v16 dateIntervalMustMatchView:1 timeScope:a5 resolution:a6 completion:v18];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __114__HKOverlayRoomStackedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v13 = WeakRetained;
  if (a4)
  {
    id v14 = [WeakRetained stackedBaseDisplayType];
    id v15 = +[HKOverlayPillValueProvidingFactory overlayPillValueProviderForDisplayType:selectedRangeFormatter:interfaceLayout:](HKOverlayPillValueProvidingFactory, "overlayPillValueProviderForDisplayType:selectedRangeFormatter:interfaceLayout:", v14, 0, +[HKOverlayPillValueProvidingFactory interfaceLayoutForController:*(void *)(a1 + 32)]);

    id v16 = [v13 stackedBaseDisplayType];
    uint64_t v17 = *(void *)(a1 + 56);
    id v18 = [v13 applicationItems];
    id v19 = [v18 unitController];
    id v20 = [v15 valueFromChartPoints:v9 unit:v10 displayType:v16 timeScope:v17 unitPreferenceController:v19];

    uint64_t v21 = *(void *)(a1 + 56);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __114__HKOverlayRoomStackedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
    v22[3] = &unk_1E6D52FB8;
    id v23 = *(id *)(a1 + 40);
    [v13 setLastUpdatedItemFromPillValue:v20 timeScope:v21 completion:v22];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __114__HKOverlayRoomStackedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)chartPointsForChartPointType:(unint64_t)a3 dateIntervals:(id)a4 overlayChartController:(id)a5 dateIntervalMustMatchView:(BOOL)a6 timeScope:(int64_t)a7 resolution:(int64_t)a8 completion:(id)a9
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a9;
  objc_initWeak(location, self);
  id v28 = (void *)a3;
  if (a3 == 1)
  {
    uint64_t v16 = [(HKOverlayRoomStackedContext *)self stackedBaseDisplayType];
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v16 = [(HKOverlayRoomStackedContext *)self displayType];
LABEL_5:
    uint64_t v17 = (void *)v16;
    goto LABEL_7;
  }
  uint64_t v17 = 0;
LABEL_7:
  id v18 = objc_msgSend(v17, "graphSeriesForTimeScope:", a7, a7);
  id v19 = [(HKOverlayRoomStackedContext *)self _canonicalUnitOverrideForDisplayType:v17];
  if (!v19)
  {
    id v20 = [(HKOverlayRoomStackedContext *)self applicationItems];
    uint64_t v21 = [v20 unitController];
    id v19 = [v21 unitForChartingDisplayType:v17];
  }
  if ([v13 count])
  {
    v22 = [v13 firstObject];
    id v30 = v18;
    id v23 = objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v13, "count") - 1);
    v24 = [v22 startDate];
    v25 = [v22 endDate];
    objc_copyWeak(v35, location);
    BOOL v36 = a6;
    id v31 = v22;
    id v32 = v14;
    id v34 = v15;
    v35[1] = v28;
    id v33 = v23;
    v35[2] = v26;
    v35[3] = (id)a8;
    objc_msgSend(v32, "cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:completion:", v30);

    objc_destroyWeak(v35);
    id v18 = v30;
  }
  else
  {
    (*((void (**)(id, void, void *, uint64_t, void))v15 + 2))(v15, MEMORY[0x1E4F1CBF0], v19, 1, 0);
  }

  objc_destroyWeak(location);
}

void __155__HKOverlayRoomStackedContext_chartPointsForChartPointType_dateIntervals_overlayChartController_dateIntervalMustMatchView_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v10 = WeakRetained;
  if (!a3)
  {
    v22 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_7:
    v22();
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 104))
  {
    if ([WeakRetained _obsoleteDateRange:*(void *)(a1 + 32) overlayController:*(void *)(a1 + 40)])
    {
      id v11 = [*(id *)(a1 + 48) lastUpdatedItem];
      id v12 = [v11 value];
      id v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v14 = [v13 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      char v15 = [v12 isEqualToString:v14];

      if ((v15 & 1) == 0)
      {
        v22 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
        goto LABEL_7;
      }
    }
  }
  uint64_t v17 = *(void **)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = *(unsigned __int8 *)(a1 + 104);
  uint64_t v20 = *(void *)(a1 + 80);
  uint64_t v21 = *(void *)(a1 + 88);
  uint64_t v23 = *(void *)(a1 + 96);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __155__HKOverlayRoomStackedContext_chartPointsForChartPointType_dateIntervals_overlayChartController_dateIntervalMustMatchView_timeScope_resolution_completion___block_invoke_2;
  v24[3] = &unk_1E6D53290;
  id v25 = v7;
  id v26 = *(id *)(a1 + 64);
  [v17 chartPointsForChartPointType:v20 dateIntervals:v16 overlayChartController:v18 dateIntervalMustMatchView:v19 timeScope:v21 resolution:v23 completion:v24];

LABEL_8:
}

void __155__HKOverlayRoomStackedContext_chartPointsForChartPointType_dateIntervals_overlayChartController_dateIntervalMustMatchView_timeScope_resolution_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v8 = a3;
  if (a4)
  {
    id v7 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setLastUpdatedItemFromPillValue:(id)a3 timeScope:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__HKOverlayRoomStackedContext_setLastUpdatedItemFromPillValue_timeScope_completion___block_invoke;
  v12[3] = &unk_1E6D532E0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  int64_t v16 = a4;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __84__HKOverlayRoomStackedContext_setLastUpdatedItemFromPillValue_timeScope_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) valueString];

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = [*(id *)(a1 + 32) valueString];
    v5 = [*(id *)(a1 + 32) unitString];
    uint64_t v6 = [v3 buildContextItemWithValue:v4 unit:v5 valueContext:0 forTimeScope:*(void *)(a1 + 56)];
    [*(id *)(a1 + 40) setLastUpdatedItem:v6];

LABEL_5:
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v7 = [*(id *)(a1 + 32) attributedValue];

  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    v4 = [*(id *)(a1 + 32) attributedValue];
    id v9 = [v8 _buildContextItemWithAttributedValue:v4 valueContext:0 forTimeScope:*(void *)(a1 + 56)];
    [*(id *)(a1 + 40) setLastUpdatedItem:v9];

    goto LABEL_5;
  }
  _HKInitializeLogging();
  id v11 = *MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_FAULT)) {
    __84__HKOverlayRoomStackedContext_setLastUpdatedItemFromPillValue_timeScope_completion___block_invoke_cold_1(v11);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)_obsoleteDateRange:(id)a3 overlayController:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 primaryGraphViewController];
  id v7 = [v6 graphView];
  id v8 = [v7 effectiveVisibleRangeActive];

  id v9 = [v8 startDate];
  id v10 = [v8 endDate];
  id v11 = [v5 startDate];
  id v12 = [v5 endDate];

  BOOL v13 = [v9 compare:v11] || objc_msgSend(v10, "compare:", v12);
  return v13;
}

- (id)stackedContextButtonBackground
{
  return (id)[MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
}

- (id)buildContextItemWithValue:(id)a3 unit:(id)a4 valueContext:(id)a5 forTimeScope:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  BOOL v13 = [(HKOverlayRoomStackedContext *)self stackedBaseDisplayType];
  id v14 = [(HKOverlayRoomStackedContext *)self _setupContextItemForDisplayType:v13 timeScope:a6 valueContext:v10];

  [v14 setUnit:v11];
  [v14 setValue:v12];

  [(HKOverlayRoomStackedContext *)self _setAccessibiltyIdentifier:v14 displayType:v13];
  return v14;
}

- (id)_buildContextItemWithAttributedValue:(id)a3 valueContext:(id)a4 forTimeScope:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(HKOverlayRoomStackedContext *)self stackedBaseDisplayType];
  id v11 = [(HKOverlayRoomStackedContext *)self _setupContextItemForDisplayType:v10 timeScope:a5 valueContext:v8];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v9];
  uint64_t v13 = *MEMORY[0x1E4FB0700];
  id v14 = [v11 selectedMetricColors];
  id v15 = [v14 contextViewPrimaryTextColor];
  objc_msgSend(v12, "addAttribute:value:range:", v13, v15, 0, objc_msgSend(v9, "length"));

  int64_t v16 = +[HKDisplayTypeContextItemAttributedLabelOverride attributedLabelOverrideWithText:v9 selectedText:v12];

  [v11 setAttributedLabelTextOverride:v16];
  [(HKOverlayRoomStackedContext *)self _setAccessibiltyIdentifier:v11 displayType:v10];

  return v11;
}

- (id)_setupContextItemForDisplayType:(id)a3 timeScope:(int64_t)a4 valueContext:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(HKDisplayTypeContextItem);
  id v11 = [(HKSampleType *)self->_stackedSampleType identifier];
  [(HKDisplayTypeContextItem *)v10 setAnalyticsIdentifier:v11];

  id v12 = [(HKOverlayRoomStackedContext *)self _contextItemTitleForDisplayType:v9 timeScope:a4];
  [(HKDisplayTypeContextItem *)v10 setTitle:v12];

  [(HKDisplayTypeContextItem *)v10 setInfoHidden:self->_isInfoButtonHidden];
  uint64_t v13 = [v9 contextItemShouldUseTightSpacingBetweenValueAndUnit];

  [(HKDisplayTypeContextItem *)v10 setUseTightSpacingBetweenValueAndUnit:v13];
  id v14 = [(HKOverlayRoomStackedContext *)self stackedContextButtonBackground];
  id v15 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v14];
  [(HKDisplayTypeContextItem *)v10 setMetricColors:v15];

  int64_t v16 = [(HKOverlayRoomStackedContext *)self stackedSampleType];
  uint64_t v17 = [(HKOverlayRoomStackedContext *)self stackedTemplateDisplayType];
  uint64_t v18 = +[HKOverlayContextUtilities stackedChartMetricColorsForSampleType:v16 templateType:v17];
  [(HKDisplayTypeContextItem *)v10 setSelectedMetricColors:v18];

  [(HKDisplayTypeContextItem *)v10 setValueContext:v8];
  return v10;
}

- (void)_setAccessibiltyIdentifier:(id)a3 displayType:(id)a4
{
  id v11 = a4;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = NSString;
  if (isKindOfClass)
  {
    id v8 = [v11 localization];
    id v9 = [v8 displayName];
    uint64_t v10 = objc_msgSend(v7, "hk_chartOverlayAccessibilityIdentifier:", v9);
    [v5 setAccessibilityIdentifier:v10];

    id v5 = (id)v10;
  }
  else
  {
    id v8 = [v11 displayTypeIdentifierString];
    id v9 = objc_msgSend(v7, "hk_chartOverlayAccessibilityIdentifier:", v8);
    [v5 setAccessibilityIdentifier:v9];
  }
}

- (id)_contextItemTitleForDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 behavior];
  int v7 = [v6 chartsRelativeData];

  if (a4 == 6 || !v7)
  {
    id v9 = [v5 localization];
    uint64_t v13 = [v9 shortenedDisplayName];
  }
  else
  {
    id v8 = NSString;
    id v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v10 = [v9 localizedStringForKey:@"OVERLAY_AVERAGE_DATA_TYPE_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    id v11 = [v5 localization];
    id v12 = [v11 embeddedDisplayName];
    uint64_t v13 = objc_msgSend(v8, "stringWithFormat:", v10, v12);
  }
  return v13;
}

- (id)_canonicalUnitOverrideForDisplayType:(id)a3
{
  v3 = [a3 objectType];
  v4 = [v3 identifier];
  id v5 = (void *)*MEMORY[0x1E4F29818];

  if (v4 == v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F2B618] secondUnit];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (HKOverlayRoomApplicationItems)applicationItems
{
  return self->_applicationItems;
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (HKInteractiveChartDisplayType)displayType
{
  return self->_displayType;
}

- (HKDisplayType)overlayDisplayType
{
  return self->_overlayDisplayType;
}

- (HKSampleType)stackedSampleType
{
  return self->_stackedSampleType;
}

- (HKInteractiveChartDisplayType)stackedBaseDisplayType
{
  return self->_stackedBaseDisplayType;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
}

- (HKDisplayType)templateDisplayType
{
  return self->_templateDisplayType;
}

- (void)setTemplateDisplayType:(id)a3
{
}

- (HKDisplayType)stackedTemplateDisplayType
{
  return self->_stackedTemplateDisplayType;
}

- (void)setStackedTemplateDisplayType:(id)a3
{
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
}

- (int64_t)currentTimeScope
{
  return self->_currentTimeScope;
}

- (void)setCurrentTimeScope:(int64_t)a3
{
  self->_currentTimeScope = a3;
}

- (BOOL)isInfoButtonHidden
{
  return self->_isInfoButtonHidden;
}

- (void)setIsInfoButtonHidden:(BOOL)a3
{
  self->_isInfoButtonHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_stackedTemplateDisplayType, 0);
  objc_storeStrong((id *)&self->_templateDisplayType, 0);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_stackedBaseDisplayType, 0);
  objc_storeStrong((id *)&self->_stackedSampleType, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
  objc_storeStrong((id *)&self->_applicationItems, 0);
}

+ (void)generateCustomSeriesWithTemplateDisplayType:(os_log_t)log sampleType:applicationItems:currentTimeScope:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1E0B26000, log, OS_LOG_TYPE_FAULT, "Numeric Axis missing from Stacked Context", v1, 2u);
}

void __84__HKOverlayRoomStackedContext_setLastUpdatedItemFromPillValue_timeScope_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1E0B26000, log, OS_LOG_TYPE_FAULT, "Unable to setLastUpdatedItemFromPillValue: no value/unit or attributed value was found.", v1, 2u);
}

@end