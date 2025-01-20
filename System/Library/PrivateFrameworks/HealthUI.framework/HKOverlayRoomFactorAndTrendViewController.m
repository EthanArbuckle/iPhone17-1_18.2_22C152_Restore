@interface HKOverlayRoomFactorAndTrendViewController
- (BOOL)supportsShowAllFilters;
- (HKChartSummaryTrendModel)trendModel;
- (HKDisplayType)baseChartDisplayType;
- (HKOverlayRoomFactorAndTrendViewController)initWithBaseChartDisplayType:(id)a3 trendModel:(id)a4 factorDisplayTypes:(id)a5 displayDate:(id)a6 applicationItems:(id)a7 mode:(int64_t)a8 timeScopeRanges:(id)a9 initialTimeScope:(int64_t)a10 wrappedOverlay:(id)a11 overrideFirstWeekday:(int64_t)a12 overrideCalendar:(id)a13 additionalChartOptions:(unint64_t)a14;
- (HKOverlayRoomFactorAndTrendViewController)initWithBaseChartDisplayType:(id)a3 trendModel:(id)a4 factorDisplayTypes:(id)a5 displayDate:(id)a6 applicationItems:(id)a7 mode:(int64_t)a8 timeScopeRanges:(id)a9 initialTimeScope:(int64_t)a10 wrappedOverlay:(id)a11 overrideFirstWeekday:(int64_t)a12 overrideCalendar:(id)a13 additionalChartOptions:(unint64_t)a14 activityMoveMode:(int64_t)a15 activityOptions:(unint64_t)a16;
- (HKOverlayRoomViewController)wrappedOverlayViewController;
- (NSCalendar)overrideCalendar;
- (NSDictionary)timeScopeRanges;
- (id)_buildFullModeSectionContainerWithOverlayController:(id)a3 applicationItems:(id)a4;
- (id)_primarySectionForApplicationItems:(id)a3 overlayChartController:(id)a4;
- (id)_primaryTrendContextForApplicationItems:(id)a3 overlayChartController:(id)a4;
- (id)buildFactorContextForDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 allowsDeselection:(BOOL)a9;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)preferredInitialOverlayIndex;
- (int64_t)activityMoveMode;
- (int64_t)overrideFirstWeekday;
- (int64_t)startingTimeScope;
- (unint64_t)activityOptions;
- (void)setTimeScopeRanges:(id)a3;
- (void)setWrappedOverlayViewController:(id)a3;
@end

@implementation HKOverlayRoomFactorAndTrendViewController

- (HKOverlayRoomFactorAndTrendViewController)initWithBaseChartDisplayType:(id)a3 trendModel:(id)a4 factorDisplayTypes:(id)a5 displayDate:(id)a6 applicationItems:(id)a7 mode:(int64_t)a8 timeScopeRanges:(id)a9 initialTimeScope:(int64_t)a10 wrappedOverlay:(id)a11 overrideFirstWeekday:(int64_t)a12 overrideCalendar:(id)a13 additionalChartOptions:(unint64_t)a14
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a9;
  id v24 = a11;
  id v25 = a13;
  if ([v18 displayTypeIdentifier] == 100)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"HKOverlayRoomFactorAndTrendViewController.m", 48, @"Invalid parameter not satisfying: %@", @"baseChartDisplayType.displayTypeIdentifier != HKDisplayTypeIdentifierActivitySummary" object file lineNumber description];
  }
  v26 = [(HKOverlayRoomFactorAndTrendViewController *)self initWithBaseChartDisplayType:v18 trendModel:v19 factorDisplayTypes:v20 displayDate:v21 applicationItems:v22 mode:a8 timeScopeRanges:v23 initialTimeScope:a10 wrappedOverlay:v24 overrideFirstWeekday:a12 overrideCalendar:v25 additionalChartOptions:a14 activityMoveMode:1 activityOptions:0];

  return v26;
}

- (HKOverlayRoomFactorAndTrendViewController)initWithBaseChartDisplayType:(id)a3 trendModel:(id)a4 factorDisplayTypes:(id)a5 displayDate:(id)a6 applicationItems:(id)a7 mode:(int64_t)a8 timeScopeRanges:(id)a9 initialTimeScope:(int64_t)a10 wrappedOverlay:(id)a11 overrideFirstWeekday:(int64_t)a12 overrideCalendar:(id)a13 additionalChartOptions:(unint64_t)a14 activityMoveMode:(int64_t)a15 activityOptions:(unint64_t)a16
{
  id v40 = a3;
  id obj = a4;
  id v22 = a4;
  id v23 = a6;
  id v38 = a9;
  id v37 = a11;
  id v24 = a13;
  id v25 = a7;
  id v26 = a5;
  uint64_t v27 = +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:v22];
  v28 = (void *)v27;
  v39 = v23;
  if (v27) {
    v29 = (void *)v27;
  }
  else {
    v29 = v23;
  }
  id v30 = v29;

  v41.receiver = self;
  v41.super_class = (Class)HKOverlayRoomFactorAndTrendViewController;
  v31 = [(HKOverlayRoomViewController *)&v41 initWithDisplayDate:v30 applicationItems:v25 factorDisplayTypes:v26 mode:a8];

  if (v31)
  {
    objc_storeStrong((id *)&v31->_baseChartDisplayType, a3);
    objc_storeStrong((id *)&v31->_trendModel, obj);
    int64_t v32 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:v22];
    if (v32 != 8) {
      a10 = v32;
    }
    v31->_startingTimeScope = a10;
    objc_storeStrong((id *)&v31->_timeScopeRanges, a9);
    objc_storeStrong((id *)&v31->_wrappedOverlayViewController, a11);
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v31, "setShouldSelectInitialOverlay:", [v22 selectTrendInitially]);
    v31->_overrideFirstWeekday = a12;
    objc_storeStrong((id *)&v31->_overrideCalendar, a13);
    [(HKOverlayRoomViewController *)v31 setAdditionalChartOptions:a14 | 0x10000];
    v31->_activityMoveMode = a15;
    v31->_activityOptions = a16;
  }

  return v31;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  v3 = [(HKOverlayRoomFactorAndTrendViewController *)self baseChartDisplayType];
  v4 = [v3 localization];
  v5 = [v4 displayName];

  return v5;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3 == 3)
  {
    v13 = [(HKOverlayRoomFactorAndTrendViewController *)self _buildFullModeSectionContainerWithOverlayController:v9 applicationItems:v8];
  }
  else if (a3 == 1)
  {
    v10 = [HKOverlayContextSectionContainer alloc];
    v11 = [(HKOverlayRoomFactorAndTrendViewController *)self _primarySectionForApplicationItems:v8 overlayChartController:v9];
    v12 = [(HKOverlayContextSectionContainer *)v10 initWithContainerTitle:0 overlayContextSections:v11];
    v15[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (id)preferredInitialOverlayIndex
{
  return &unk_1F3C20968;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  wrappedOverlayViewController = self->_wrappedOverlayViewController;
  if (wrappedOverlayViewController)
  {
    id v8 = a5;
    id v9 = [(HKOverlayRoomViewController *)wrappedOverlayViewController createViewControllerForMode:a3 displayDate:a4 applicationItems:v8];
  }
  else
  {
    id v21 = a5;
    id v20 = [HKOverlayRoomFactorAndTrendViewController alloc];
    id v8 = [(HKOverlayRoomFactorAndTrendViewController *)self baseChartDisplayType];
    id v19 = [(HKOverlayRoomFactorAndTrendViewController *)self trendModel];
    id v18 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
    v17 = [(HKOverlayRoomViewController *)self displayDate];
    v11 = [(HKOverlayRoomFactorAndTrendViewController *)self timeScopeRanges];
    int64_t v12 = [(HKOverlayRoomFactorAndTrendViewController *)self startingTimeScope];
    v13 = [(HKOverlayRoomFactorAndTrendViewController *)self wrappedOverlayViewController];
    int64_t v14 = [(HKOverlayRoomFactorAndTrendViewController *)self overrideFirstWeekday];
    v15 = [(HKOverlayRoomFactorAndTrendViewController *)self overrideCalendar];
    id v9 = [(HKOverlayRoomFactorAndTrendViewController *)v20 initWithBaseChartDisplayType:v8 trendModel:v19 factorDisplayTypes:v18 displayDate:v17 applicationItems:v21 mode:a3 timeScopeRanges:v11 initialTimeScope:v12 wrappedOverlay:v13 overrideFirstWeekday:v14 overrideCalendar:v15 additionalChartOptions:[(HKOverlayRoomViewController *)self additionalChartOptions] activityMoveMode:[(HKOverlayRoomFactorAndTrendViewController *)self activityMoveMode] activityOptions:[(HKOverlayRoomFactorAndTrendViewController *)self activityOptions]];
  }
  return v9;
}

- (BOOL)supportsShowAllFilters
{
  v3 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
  if (v3)
  {
    v4 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  if ([(HKOverlayRoomViewController *)self controllerMode] == 3) {
    return 0;
  }
  if (self->_wrappedOverlayViewController) {
    return 1;
  }
  return v5;
}

- (id)createChartOverlayViewController
{
  v3 = [(HKOverlayRoomFactorAndTrendViewController *)self timeScopeRanges];

  if (v3)
  {
    v54 = [(HKOverlayRoomFactorAndTrendViewController *)self timeScopeRanges];
    if ([(HKOverlayRoomFactorAndTrendViewController *)self startingTimeScope] == 8)
    {
      id v19 = [(HKOverlayRoomViewController *)self applicationItems];
      id v20 = [v19 timeScopeController];
      id v21 = v20;
      uint64_t v22 = 4;
    }
    else
    {
      int64_t v18 = [(HKOverlayRoomFactorAndTrendViewController *)self startingTimeScope];
      id v19 = [(HKOverlayRoomViewController *)self applicationItems];
      id v20 = [v19 timeScopeController];
      id v21 = v20;
      uint64_t v22 = v18;
    }
    [v20 setSelectedTimeScope:v22];

    id v23 = [(HKOverlayRoomViewController *)self primaryDisplayType];
    uint64_t v24 = objc_msgSend(v23, "hk_interactiveChartOptions");

    if ([(HKOverlayRoomViewController *)self shouldSelectInitialOverlay]) {
      uint64_t v25 = 663552;
    }
    else {
      uint64_t v25 = 655360;
    }
    unint64_t v43 = v25 | v24 | [(HKOverlayRoomViewController *)self additionalChartOptions];
    objc_super v41 = [HKInteractiveChartOverlayViewController alloc];
    v49 = [(HKOverlayRoomViewController *)self applicationItems];
    v53 = [v49 healthStore];
    v51 = [(HKOverlayRoomViewController *)self primaryDisplayType];
    v47 = [(HKOverlayRoomViewController *)self applicationItems];
    v39 = [v47 unitController];
    v45 = [(HKOverlayRoomViewController *)self applicationItems];
    id v26 = [v45 dateCache];
    id v40 = [(HKOverlayRoomViewController *)self applicationItems];
    uint64_t v27 = [v40 chartDataCacheController];
    v28 = [(HKOverlayRoomViewController *)self applicationItems];
    v29 = [v28 timeScopeController];
    id v30 = [(HKOverlayRoomViewController *)self applicationItems];
    v31 = [v30 sampleDateRangeController];
    int64_t v32 = [(HKOverlayRoomViewController *)self displayDate];
    v33 = [(HKOverlayRoomFactorAndTrendViewController *)self overrideCalendar];
    v17 = [(HKInteractiveChartOverlayViewController *)v41 initWithTimeScopeRanges:v54 healthStore:v53 primaryDisplayType:v51 unitPreferenceController:v39 dateCache:v26 chartDataCacheController:v27 selectedTimeScopeController:v29 sampleTypeDateRangeController:v31 initialXValue:v32 currentCalendarOverride:v33 options:v43];

    v34 = [(HKOverlayRoomFactorAndTrendViewController *)self overrideCalendar];

    if (!v34) {
      [(HKInteractiveChartViewController *)v17 setAnnotationDataSourceFirstWeekday:[(HKOverlayRoomFactorAndTrendViewController *)self overrideFirstWeekday]];
    }
  }
  else
  {
    v4 = [(HKOverlayRoomFactorAndTrendViewController *)self baseChartDisplayType];
    int v5 = [v4 isActivitySummary];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F2B980]);
      v7 = [(HKOverlayRoomViewController *)self applicationItems];
      id v8 = [v7 healthStore];
      id v9 = (void *)[v6 initWithHealthStore:v8];

      v10 = [HKInteractiveChartActivityController alloc];
      v55 = [(HKOverlayRoomViewController *)self applicationItems];
      v11 = [v55 healthStore];
      v52 = [(HKOverlayRoomViewController *)self applicationItems];
      v46 = [v52 unitController];
      v50 = [(HKOverlayRoomViewController *)self applicationItems];
      v42 = [v50 dateCache];
      v48 = [(HKOverlayRoomViewController *)self applicationItems];
      int64_t v12 = [v48 chartDataCacheController];
      v44 = [(HKOverlayRoomViewController *)self applicationItems];
      v13 = [v44 timeScopeController];
      int64_t v14 = [(HKOverlayRoomViewController *)self applicationItems];
      v15 = [v14 sampleDateRangeController];
      v16 = [(HKOverlayRoomViewController *)self displayDate];
      v17 = [(HKInteractiveChartActivityController *)v10 initWithHealthStore:v11 unitPreferenceController:v46 dateCache:v42 chartDataCacheController:v12 selectedTimeScopeController:v13 sampleTypeDateRangeController:v15 wheelchairUseCharacteristicCache:v9 initialXValue:v16 activityMoveMode:[(HKOverlayRoomFactorAndTrendViewController *)self activityMoveMode] activityOptions:[(HKOverlayRoomFactorAndTrendViewController *)self activityOptions] chartSharableModel:0];
    }
    else
    {
      if ([(HKOverlayRoomViewController *)self shouldSelectInitialOverlay]
        && [(HKOverlayRoomFactorAndTrendViewController *)self startingTimeScope] != 8)
      {
        int64_t v35 = [(HKOverlayRoomFactorAndTrendViewController *)self startingTimeScope];
        v36 = [(HKOverlayRoomViewController *)self applicationItems];
        id v37 = [v36 timeScopeController];
        [v37 setSelectedTimeScope:v35];
      }
      v56.receiver = self;
      v56.super_class = (Class)HKOverlayRoomFactorAndTrendViewController;
      v17 = [(HKOverlayRoomViewController *)&v56 createChartOverlayViewController];
    }
  }
  return v17;
}

- (id)_primarySectionForApplicationItems:(id)a3 overlayChartController:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [(HKOverlayRoomFactorAndTrendViewController *)self trendModel];

  if (v9)
  {
    v10 = [(HKOverlayRoomFactorAndTrendViewController *)self _primaryTrendContextForApplicationItems:v6 overlayChartController:v7];
    v11 = [(HKOverlayRoomViewController *)self chartController];
    [v11 setTrendAccessibilityDelegate:v10];

    [v8 addObject:v10];
  }
  int64_t v12 = [[HKOverlayContextSection alloc] initWithSectionTitle:0 overlayContextItems:v8];
  v15[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  return v13;
}

- (id)_primaryTrendContextForApplicationItems:(id)a3 overlayChartController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [HKOverlayRoomTrendContext alloc];
  id v9 = [(HKOverlayRoomFactorAndTrendViewController *)self baseChartDisplayType];
  v10 = [(HKOverlayRoomFactorAndTrendViewController *)self trendModel];
  v11 = [(HKOverlayRoomTrendContext *)v8 initWithBaseDisplayType:v9 trendModel:v10 overlayChartController:v6 applicationItems:v7 overlayMode:[(HKOverlayRoomViewController *)self controllerMode]];

  return v11;
}

- (id)_buildFullModeSectionContainerWithOverlayController:(id)a3 applicationItems:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [(HKOverlayRoomFactorAndTrendViewController *)self _primarySectionForApplicationItems:v7 overlayChartController:v8];

  [v9 addObjectsFromArray:v10];
  v11 = [(HKOverlayRoomViewController *)self buildFactorContextSectionForChartController];
  if (v11) {
    [v9 addObject:v11];
  }
  int64_t v12 = [[HKOverlayContextSectionContainer alloc] initWithContainerTitle:0 overlayContextSections:v9];
  v15[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  return v13;
}

- (id)buildFactorContextForDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 allowsDeselection:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = [(HKOverlayRoomFactorAndTrendViewController *)self baseChartDisplayType];
  if ([v20 isActivitySummary])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v22 = [v17 buildFactorContextForDisplayType:v15 factorDisplayType:v16 overlayChartController:v17 currentCalendarOverride:v18 applicationItems:v19 overlayMode:a8];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v25.receiver = self;
  v25.super_class = (Class)HKOverlayRoomFactorAndTrendViewController;
  uint64_t v22 = [(HKOverlayRoomViewController *)&v25 buildFactorContextForDisplayType:v15 factorDisplayType:v16 overlayChartController:v17 currentCalendarOverride:v18 applicationItems:v19 overlayMode:a8 allowsDeselection:a9];
LABEL_6:
  id v23 = (void *)v22;

  return v23;
}

- (HKDisplayType)baseChartDisplayType
{
  return self->_baseChartDisplayType;
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (HKOverlayRoomViewController)wrappedOverlayViewController
{
  return self->_wrappedOverlayViewController;
}

- (void)setWrappedOverlayViewController:(id)a3
{
}

- (NSDictionary)timeScopeRanges
{
  return self->_timeScopeRanges;
}

- (void)setTimeScopeRanges:(id)a3
{
}

- (int64_t)startingTimeScope
{
  return self->_startingTimeScope;
}

- (int64_t)overrideFirstWeekday
{
  return self->_overrideFirstWeekday;
}

- (NSCalendar)overrideCalendar
{
  return self->_overrideCalendar;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (unint64_t)activityOptions
{
  return self->_activityOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideCalendar, 0);
  objc_storeStrong((id *)&self->_timeScopeRanges, 0);
  objc_storeStrong((id *)&self->_wrappedOverlayViewController, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_baseChartDisplayType, 0);
}

@end