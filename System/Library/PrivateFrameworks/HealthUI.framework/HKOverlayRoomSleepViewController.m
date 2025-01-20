@interface HKOverlayRoomSleepViewController
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
+ (int64_t)indexForOverlaySleepRoomSegment:(int64_t)a3;
- (BOOL)_initialTrendSelectedForMode:(int64_t)a3 trendModel:(id)a4;
- (BOOL)baseDisplayIsSchedule;
- (BOOL)comparisonContextSelected;
- (BOOL)durationContextSelected;
- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4;
- (BOOL)scheduleContextSelected;
- (BOOL)shouldHighlightBaseDisplayContext;
- (BOOL)stageDurationContextSelected;
- (BOOL)stagePercentageContextSelected;
- (BOOL)stagePercentageContextWillBeSelected;
- (BOOL)supportsHealthFactors;
- (BOOL)supportsShowAllFilters;
- (HKChartSummaryTrendModel)trendModel;
- (HKDisplayType)sleepDisplayType;
- (HKInteractiveChartDataFormatter)sleepChartFormatter;
- (HKOverlayContextLocation)comparisonContextLocation;
- (HKOverlayContextLocation)trendContextLocation;
- (HKOverlayRoomSleepViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 sleepDataSourceProvider:(id)a5 sleepChartFormatter:(id)a6 mode:(int64_t)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9;
- (HKSleepDataSourceProvider)sleepDataSourceProvider;
- (NSDictionary)sleepChartCaches;
- (id)_buildConsistencyDisplayTypeWithApplicationItems:(id)a3;
- (id)_buildDurationAverageDisplayTypeWithApplicationItems:(id)a3 customSleepSeriesMapping:(id)a4 customSleepChartFormatter:(id)a5;
- (id)_buildDurationAverageFormatter;
- (id)_buildDurationAverageSeries;
- (id)_buildDurationDisplayTypeForStackedWithApplicationItems:(id)a3;
- (id)_buildDurationDisplayTypeWithApplicationItems:(id)a3;
- (id)_buildDurationGoalDisplayTypeWithApplicationItems:(id)a3;
- (id)_buildScheduleDisplayTypeWithApplicationItems:(id)a3;
- (id)_buildSleepDisplayTypeWithApplicationItems:(id)a3 sleepSeriesType:(int64_t)a4 customSleepSeriesMapping:(id)a5 customSleepChartFormatter:(id)a6 isStackedChart:(BOOL)a7;
- (id)_buildSleepTrendContext:(id)a3 overlayChartController:(id)a4;
- (id)_buildStagesDisplayTypeWithApplicationItems:(id)a3;
- (id)_buildStagesDurationDisplayTypeWithApplicationItems:(id)a3;
- (id)_consistencyContextForApplicationItems:(id)a3 overlayMode:(int64_t)a4 isPrimaryContext:(BOOL)a5;
- (id)_durationAmountContextForApplicationItems:(id)a3 durationDisplayType:(id)a4;
- (id)_durationAverageContextForApplicationItems:(id)a3 durationDisplayType:(id)a4 useInBedAverage:(BOOL)a5;
- (id)_durationGoalContextForApplicationItems:(id)a3 durationDisplayType:(id)a4 overlayMode:(int64_t)a5 isPrimaryContext:(BOOL)a6;
- (id)_fullContextsForApplicationItems:(id)a3 overlayChartController:(id)a4;
- (id)_itemForSleepStageInfographicWithStage:(int64_t)a3;
- (id)_itemForTitle:(id)a3 titleAccessoryColor:(id)a4 description:(id)a5;
- (id)_primaryContextForApplicationItems:(id)a3 overlayChartController:(id)a4;
- (id)_sleepColorForSelectedRangeData:(id)a3;
- (id)_sleepStagePercentageContextForStage:(int64_t)a3 applicationItems:(id)a4 baseDisplayType:(id)a5;
- (id)_stageDurationContextForApplicationItems:(id)a3 baseDisplayType:(id)a4 sleepCategoryValue:(int64_t)a5;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)dateRangeFromSelectionContext:(id)a3 timeScope:(int64_t)a4;
- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4;
- (id)initialSelectedContextForMode:(int64_t)a3 containerIndex:(int64_t)a4;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (id)restorationStateDictionary;
- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4;
- (id)titleForSelectedRangeData:(id)a3 displayType:(id)a4;
- (int64_t)initialSelectedContainerIndexForMode:(int64_t)a3;
- (int64_t)initialSleepSeriesType;
- (void)_installUpdateObserversForGoalsAndSchedulesWithApplicationItems:(id)a3;
- (void)_setDefaultChartFormatterFonts;
- (void)_updateHighlightedSleepStage:(int64_t)a3 onDisplayType:(id)a4;
- (void)dealloc;
- (void)didChangeFromContextItem:(id)a3 toContextItem:(id)a4;
- (void)restoreUserActivityState:(id)a3;
- (void)saveRestorationState;
- (void)setBaseDisplayIsDuration;
- (void)setBaseDisplayIsSchedule;
- (void)setBaseDisplayIsSchedule:(BOOL)a3;
- (void)setComparisonContextLocation:(id)a3;
- (void)setComparisonContextSelected:(BOOL)a3;
- (void)setDurationContextSelected:(BOOL)a3;
- (void)setScheduleContextSelected:(BOOL)a3;
- (void)setShouldHighlightBaseDisplayContext;
- (void)setShouldHighlightBaseDisplayContext:(BOOL)a3;
- (void)setSleepChartCaches:(id)a3;
- (void)setSleepChartFormatter:(id)a3;
- (void)setSleepDataSourceProvider:(id)a3;
- (void)setSleepDisplayType:(id)a3;
- (void)setStageDurationContextSelected:(BOOL)a3;
- (void)setStagePercentageContextSelected:(BOOL)a3;
- (void)setStagePercentageContextWillBeSelected:(BOOL)a3;
- (void)setTrendContextLocation:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKOverlayRoomSleepViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v16 = a4;
  id v17 = a9;
  id v18 = a10;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  v22 = [v16 sleepDataSourceProvider];

  if (!v22)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:a1 file:@"HKOverlayRoomSleepViewController.m" lineNumber:227 description:@"The sleep experience requires an externally provided data source provider."];
  }
  v23 = [v16 sleepChartFormatter];

  if (v23)
  {
    if (!v17) {
      goto LABEL_8;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:a1 file:@"HKOverlayRoomSleepViewController.m" lineNumber:228 description:@"The sleep experience requires an externally provided sleep chart formatter."];

    if (!v17) {
      goto LABEL_8;
    }
  }
  if ([v17 selectTrendInitially])
  {
    uint64_t v24 = 1;
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v24 = 0;
LABEL_9:
  v27 = [HKOverlayRoomSleepViewController alloc];
  v28 = [v16 sleepDataSourceProvider];
  v29 = [v16 sleepChartFormatter];
  v30 = [(HKOverlayRoomSleepViewController *)v27 initWithDisplayDate:v20 applicationItems:v21 sleepDataSourceProvider:v28 sleepChartFormatter:v29 mode:v24 trendModel:v17 factorDisplayTypes:v18];

  [(HKOverlayRoomViewController *)v30 setRestorationUserActivity:v19];
  [(HKOverlayRoomViewController *)v30 setAdditionalChartOptions:a11];

  return v30;
}

- (HKOverlayRoomSleepViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 sleepDataSourceProvider:(id)a5 sleepChartFormatter:(id)a6 mode:(int64_t)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id obj = a8;
  id v43 = a6;
  id v18 = a8;
  id v19 = a9;
  uint64_t v20 = +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:v18];
  id v21 = (void *)v20;
  if (v20) {
    v22 = (void *)v20;
  }
  else {
    v22 = v15;
  }
  id v23 = v22;

  v44.receiver = self;
  v44.super_class = (Class)HKOverlayRoomSleepViewController;
  uint64_t v24 = [(HKOverlayRoomViewController *)&v44 initWithDisplayDate:v23 applicationItems:v16 factorDisplayTypes:v19 mode:a7];

  if (v24)
  {
    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x1E4F29FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v46 = v27;
      id v28 = v27;
      _os_log_impl(&dword_1E0B26000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] init", buf, 0xCu);
    }
    uint64_t v29 = -[HKOverlayRoomSleepViewController _initialTrendSelectedForMode:trendModel:](v24, "_initialTrendSelectedForMode:trendModel:", a7, v18, obj, v43);
    objc_storeWeak((id *)&v24->_sleepDataSourceProvider, v17);
    objc_storeStrong((id *)&v24->_sleepChartFormatter, a6);
    [(HKOverlayRoomSleepViewController *)v24 _setDefaultChartFormatterFonts];
    v24->baseDisplayIsSchedule = v29 ^ 1;
    v24->shouldHighlightBaseDisplayContext = 0;
    v30 = [v16 displayTypeController];
    uint64_t v31 = [v30 displayTypeWithIdentifier:&unk_1F3C22630];
    sleepDisplayType = v24->_sleepDisplayType;
    v24->_sleepDisplayType = (HKDisplayType *)v31;

    v33 = v24->_sleepDisplayType;
    v34 = [v16 chartDataCacheController];
    v35 = [v16 healthStore];
    uint64_t v36 = +[HKSleepUtilities buildSleepChartCachesWithDisplayType:v33 dataSourceProvider:v17 cacheController:v34 healthStore:v35];
    sleepChartCaches = v24->_sleepChartCaches;
    v24->_sleepChartCaches = (NSDictionary *)v36;

    [(HKOverlayRoomSleepViewController *)v24 _installUpdateObserversForGoalsAndSchedulesWithApplicationItems:v16];
    objc_storeStrong((id *)&v24->_trendModel, obja);
    [(HKOverlayRoomViewController *)v24 setShouldSelectInitialOverlay:v29];
    trendContextLocation = v24->_trendContextLocation;
    v24->_trendContextLocation = 0;

    comparisonContextLocation = v24->_comparisonContextLocation;
    v24->_comparisonContextLocation = 0;
  }
  return v24;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] dealloc", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)HKOverlayRoomSleepViewController;
  [(HKOverlayRoomViewController *)&v6 dealloc];
}

+ (int64_t)indexForOverlaySleepRoomSegment:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 != 1;
  }
}

- (BOOL)_initialTrendSelectedForMode:(int64_t)a3 trendModel:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = v5;
  if (a3 == 3) {
    int v7 = 0;
  }
  else {
    int v7 = [v5 selectTrendInitially];
  }
  _HKInitializeLogging();
  id v8 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    int v12 = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 1024;
    int v15 = v7;
    id v10 = v13;
    _os_log_impl(&dword_1E0B26000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning initial trend selected: %d", (uint8_t *)&v12, 0x12u);
  }
  return v7;
}

- (void)_installUpdateObserversForGoalsAndSchedulesWithApplicationItems:(id)a3
{
  id v4 = a3;
  id v5 = [v4 displayTypeController];
  id v12 = [v5 displayTypeWithIdentifier:&unk_1F3C22648];

  objc_super v6 = [v4 displayTypeController];
  int v7 = [v6 displayTypeWithIdentifier:&unk_1F3C22660];

  id v8 = [(HKOverlayRoomSleepViewController *)self sleepChartCaches];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"HKSleepChartCacheIdentifierSleepConsistency"];

  id v10 = [v4 chartDataCacheController];
  [v10 addCustomChartCache:v9 forDisplayType:v12];

  v11 = [v4 chartDataCacheController];

  [v11 addCustomChartCache:v9 forDisplayType:v7];
}

- (void)_setDefaultChartFormatterFonts
{
  v3 = [(HKOverlayRoomSleepViewController *)self sleepChartFormatter];
  id v4 = [v3 majorFont];

  if (!v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueValueFont");
    objc_super v6 = [(HKOverlayRoomSleepViewController *)self sleepChartFormatter];
    [v6 setMajorFont:v5];
  }
  int v7 = [(HKOverlayRoomSleepViewController *)self sleepChartFormatter];
  id v8 = [v7 minorFont];

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueUnitFont");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [(HKOverlayRoomSleepViewController *)self sleepChartFormatter];
    [v9 setMinorFont:v10];
  }
}

- (void)viewDidLoad
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] viewDidLoad", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)HKOverlayRoomSleepViewController;
  [(HKOverlayRoomViewController *)&v6 viewDidLoad];
}

- (BOOL)supportsHealthFactors
{
  return 1;
}

- (void)setDurationContextSelected:(BOOL)a3
{
  self->durationContextSelected = a3;
  if (a3) {
    [(HKOverlayRoomSleepViewController *)self setBaseDisplayIsDuration];
  }
}

- (void)setScheduleContextSelected:(BOOL)a3
{
  self->scheduleContextSelected = a3;
  if (a3) {
    [(HKOverlayRoomSleepViewController *)self setBaseDisplayIsSchedule];
  }
}

- (void)setComparisonContextSelected:(BOOL)a3
{
  self->comparisonContextSelected = a3;
  if (a3) {
    [(HKOverlayRoomSleepViewController *)self setBaseDisplayIsDuration];
  }
}

- (void)setBaseDisplayIsDuration
{
  if (self->baseDisplayIsSchedule)
  {
    self->baseDisplayIsSchedule = 0;
    [(HKOverlayRoomViewController *)self refreshOverlayContextItems];
  }
}

- (void)setBaseDisplayIsSchedule
{
  if (!self->baseDisplayIsSchedule)
  {
    self->baseDisplayIsSchedule = 1;
    [(HKOverlayRoomViewController *)self refreshOverlayContextItems];
  }
}

- (void)setShouldHighlightBaseDisplayContext
{
  if (!self->shouldHighlightBaseDisplayContext)
  {
    self->shouldHighlightBaseDisplayContext = 1;
    [(HKOverlayRoomViewController *)self refreshOverlayContextItems];
  }
}

- (void)setStagePercentageContextSelected:(BOOL)a3
{
  BOOL stagePercentageContextSelected = self->stagePercentageContextSelected;
  if (stagePercentageContextSelected != a3
    && stagePercentageContextSelected != self->stagePercentageContextWillBeSelected)
  {
    objc_super v6 = [(HKOverlayRoomViewController *)self chartController];
    [v6 updatePrimaryGraphViewController];

    self->BOOL stagePercentageContextSelected = a3;
  }
}

- (void)didChangeFromContextItem:(id)a3 toContextItem:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  _HKInitializeLogging();
  id v8 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v10 = v13;
    _os_log_impl(&dword_1E0B26000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] didChangeFromContextItem", buf, 0xCu);
  }
  v11.receiver = self;
  v11.super_class = (Class)HKOverlayRoomSleepViewController;
  [(HKOverlayRoomViewController *)&v11 didChangeFromContextItem:v7 toContextItem:v6];
}

- (id)createChartOverlayViewController
{
  if ([(HKOverlayRoomViewController *)self controllerMode] != 3)
  {
    int64_t v3 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:self->_trendModel];
    if (v3 != 8)
    {
      int64_t v4 = v3;
      id v5 = [(HKOverlayRoomViewController *)self applicationItems];
      id v6 = [v5 timeScopeController];
      [v6 setSelectedTimeScope:v4];
    }
  }
  unint64_t v21 = [(HKOverlayRoomViewController *)self additionalChartOptions] | 0x12200;
  uint64_t v20 = [HKInteractiveChartOverlaySleepViewController alloc];
  uint64_t v24 = [(HKOverlayRoomViewController *)self applicationItems];
  v25 = [v24 healthStore];
  id v18 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  id v23 = [(HKOverlayRoomViewController *)self applicationItems];
  id v7 = [v23 unitController];
  v22 = [(HKOverlayRoomViewController *)self applicationItems];
  uint64_t v8 = [v22 dateCache];
  id v19 = [(HKOverlayRoomViewController *)self applicationItems];
  uint64_t v9 = [v19 chartDataCacheController];
  id v10 = [(HKOverlayRoomViewController *)self applicationItems];
  objc_super v11 = [v10 timeScopeController];
  id v12 = [(HKOverlayRoomViewController *)self applicationItems];
  id v13 = [v12 sampleDateRangeController];
  uint64_t v14 = [(HKOverlayRoomViewController *)self displayDate];
  int v15 = (void *)v8;
  uint64_t v16 = [(HKInteractiveChartOverlayViewController *)v20 initWithHealthStore:v25 primaryDisplayType:v18 unitPreferenceController:v7 dateCache:v8 chartDataCacheController:v9 selectedTimeScopeController:v11 sampleTypeDateRangeController:v13 initialXValue:v14 currentCalendarOverride:0 options:v21];

  [(HKInteractiveChartViewController *)v16 setCurrentValueViewDataSourceDelegate:self];
  [(HKInteractiveChartViewController *)v16 setCurrentOverlayLocationProvider:self];
  return v16;
}

- (id)_buildSleepDisplayTypeWithApplicationItems:(id)a3 sleepSeriesType:(int64_t)a4 customSleepSeriesMapping:(id)a5 customSleepChartFormatter:(id)a6 isStackedChart:(BOOL)a7
{
  id v11 = a3;
  id v27 = a5;
  id v12 = a6;
  v25 = v12;
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = [(HKOverlayRoomSleepViewController *)self sleepChartFormatter];
  }
  v26 = v13;
  uint64_t v14 = [v11 healthStore];
  int v15 = [(HKOverlayRoomSleepViewController *)self sleepDisplayType];
  uint64_t v16 = [v11 unitController];
  id v17 = [v11 displayTypeController];
  id v18 = [v11 chartDataCacheController];
  id v19 = [(HKOverlayRoomSleepViewController *)self sleepChartCaches];
  LOBYTE(v23) = a7;
  uint64_t v20 = +[HKSleepUtilities sleepDisplayTypesWithHealthStore:v14 sleepDisplayType:v15 unitController:v16 displayTypeController:v17 chartCacheController:v18 sleepChartFormatter:v26 sleepSeriesType:a4 sleepChartCaches:v19 customSleepSeriesMapping:v27 isStackedChart:v23];

  unint64_t v21 = [v20 firstObject];

  return v21;
}

- (id)_buildConsistencyDisplayTypeWithApplicationItems:(id)a3
{
  return [(HKOverlayRoomSleepViewController *)self _buildSleepDisplayTypeWithApplicationItems:a3 sleepSeriesType:1 customSleepSeriesMapping:0 customSleepChartFormatter:0 isStackedChart:0];
}

- (id)_buildScheduleDisplayTypeWithApplicationItems:(id)a3
{
  return [(HKOverlayRoomSleepViewController *)self _buildSleepDisplayTypeWithApplicationItems:a3 sleepSeriesType:3 customSleepSeriesMapping:0 customSleepChartFormatter:0 isStackedChart:0];
}

- (id)_buildDurationDisplayTypeWithApplicationItems:(id)a3
{
  return [(HKOverlayRoomSleepViewController *)self _buildSleepDisplayTypeWithApplicationItems:a3 sleepSeriesType:0 customSleepSeriesMapping:0 customSleepChartFormatter:0 isStackedChart:0];
}

- (id)_buildDurationGoalDisplayTypeWithApplicationItems:(id)a3
{
  return [(HKOverlayRoomSleepViewController *)self _buildSleepDisplayTypeWithApplicationItems:a3 sleepSeriesType:2 customSleepSeriesMapping:0 customSleepChartFormatter:0 isStackedChart:0];
}

- (id)_buildDurationAverageDisplayTypeWithApplicationItems:(id)a3 customSleepSeriesMapping:(id)a4 customSleepChartFormatter:(id)a5
{
  return [(HKOverlayRoomSleepViewController *)self _buildSleepDisplayTypeWithApplicationItems:a3 sleepSeriesType:0 customSleepSeriesMapping:a4 customSleepChartFormatter:a5 isStackedChart:0];
}

- (id)_buildDurationDisplayTypeForStackedWithApplicationItems:(id)a3
{
  return [(HKOverlayRoomSleepViewController *)self _buildSleepDisplayTypeWithApplicationItems:a3 sleepSeriesType:6 customSleepSeriesMapping:0 customSleepChartFormatter:0 isStackedChart:1];
}

- (id)_buildStagesDisplayTypeWithApplicationItems:(id)a3
{
  return [(HKOverlayRoomSleepViewController *)self _buildSleepDisplayTypeWithApplicationItems:a3 sleepSeriesType:4 customSleepSeriesMapping:0 customSleepChartFormatter:0 isStackedChart:0];
}

- (id)_buildStagesDurationDisplayTypeWithApplicationItems:(id)a3
{
  return [(HKOverlayRoomSleepViewController *)self _buildSleepDisplayTypeWithApplicationItems:a3 sleepSeriesType:5 customSleepSeriesMapping:0 customSleepChartFormatter:0 isStackedChart:0];
}

- (id)_buildDurationAverageSeries
{
  v2 = objc_alloc_init(_HKSleepDurationAverageSeries);
  int64_t v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepColor");
  int64_t v4 = +[HKStrokeStyle strokeStyleWithColor:v3 lineWidth:2.0];

  [v4 setDashStyle:0];
  [(HKSleepDurationSeries *)v2 setGoalLineStrokeStyle:v4];
  [(HKSleepDurationSeries *)v2 setGoalLineMarkerStyle:0];
  [(HKBarSeries *)v2 setTiledStrokeStyle:0];
  [(HKSleepDurationSeries *)v2 setDefaultFillStyles:0];

  return v2;
}

- (id)_buildDurationAverageFormatter
{
  int64_t v3 = objc_alloc_init(_HKSleepDurationAverageFormatter);
  int64_t v4 = [(HKOverlayRoomSleepViewController *)self sleepChartFormatter];
  id v5 = [v4 majorFont];
  [(HKInteractiveChartDataFormatter *)v3 setMajorFont:v5];

  id v6 = [(HKOverlayRoomSleepViewController *)self sleepChartFormatter];
  id v7 = [v6 minorFont];
  [(HKInteractiveChartDataFormatter *)v3 setMinorFont:v7];

  [(HKInteractiveChartDataFormatter *)v3 setUnitController:0];
  [(HKInteractiveChartDataFormatter *)v3 setDisplayType:0];
  return v3;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  int64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  int64_t v4 = [v3 localizedStringForKey:@"SLEEP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v4;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  id v4 = a3;
  id v5 = [v4 healthStore];
  id v6 = [(HKOverlayRoomSleepViewController *)self sleepDisplayType];
  id v7 = [v4 unitController];
  uint64_t v8 = [v4 displayTypeController];
  uint64_t v9 = [v4 chartDataCacheController];

  id v10 = [(HKOverlayRoomSleepViewController *)self sleepChartFormatter];
  int64_t v11 = [(HKOverlayRoomSleepViewController *)self initialSleepSeriesType];
  id v12 = [(HKOverlayRoomSleepViewController *)self sleepChartCaches];
  LOBYTE(v16) = 0;
  id v13 = +[HKSleepUtilities sleepDisplayTypesWithHealthStore:v5 sleepDisplayType:v6 unitController:v7 displayTypeController:v8 chartCacheController:v9 sleepChartFormatter:v10 sleepSeriesType:v11 sleepChartCaches:v12 customSleepSeries:0 isStackedChart:v16];

  uint64_t v14 = [v13 firstObject];

  return v14;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3 == 3)
  {
    id v13 = [(HKOverlayRoomSleepViewController *)self _fullContextsForApplicationItems:v8 overlayChartController:v9];
  }
  else if (a3 == 1)
  {
    id v10 = [HKOverlayContextSectionContainer alloc];
    int64_t v11 = [(HKOverlayRoomSleepViewController *)self _primaryContextForApplicationItems:v8 overlayChartController:v9];
    id v12 = [(HKOverlayContextSectionContainer *)v10 initWithContainerTitle:0 overlayContextSections:v11];
    v15[0] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (BOOL)supportsShowAllFilters
{
  if (![(HKOverlayRoomViewController *)self controllerMode]) {
    return [(HKOverlayRoomSleepViewController *)self initialSleepSeriesType] == 4;
  }
  v4.receiver = self;
  v4.super_class = (Class)HKOverlayRoomSleepViewController;
  return [(HKOverlayRoomViewController *)&v4 supportsShowAllFilters];
}

- (int64_t)initialSleepSeriesType
{
  v2 = self;
  int64_t v3 = [(HKOverlayRoomViewController *)self controllerMode];
  objc_super v4 = [(HKOverlayRoomSleepViewController *)v2 trendModel];
  LODWORD(v2) = [(HKOverlayRoomSleepViewController *)v2 _initialTrendSelectedForMode:v3 trendModel:v4];

  if (v2) {
    return 0;
  }
  else {
    return 4;
  }
}

- (id)_primaryContextForApplicationItems:(id)a3 overlayChartController:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HKOverlayRoomSleepViewController *)self trendModel];
  if (v8
    && (id v9 = (void *)v8,
        [(HKOverlayRoomSleepViewController *)self trendModel],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 selectTrendInitially],
        v10,
        v9,
        v11))
  {
    id v12 = [(HKOverlayRoomSleepViewController *)self _buildSleepTrendContext:v6 overlayChartController:v7];
    id v13 = [[HKOverlayContextLocation alloc] initWithContainerIndex:0 sectionIndex:0 itemIndex:0];
    [(HKOverlayRoomSleepViewController *)self setTrendContextLocation:v13];
  }
  else
  {
    id v12 = [(HKOverlayRoomSleepViewController *)self _consistencyContextForApplicationItems:v6 overlayMode:1 isPrimaryContext:1];
  }
  v19[0] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  int v15 = [[HKOverlayContextSection alloc] initWithSectionTitle:0 overlayContextItems:v14];
  id v18 = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];

  return v16;
}

- (id)_buildSleepTrendContext:(id)a3 overlayChartController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HKOverlayRoomSleepViewController *)self _buildDurationDisplayTypeWithApplicationItems:v7];
  id v9 = [_HKSleepTrendContext alloc];
  id v10 = [(HKOverlayRoomSleepViewController *)self trendModel];
  int v11 = [(_HKSleepTrendContext *)v9 initWithBaseDisplayType:v8 trendModel:v10 overlayChartController:v6 applicationItems:v7 overlayMode:[(HKOverlayRoomViewController *)self controllerMode] contextChangeDelegate:self];

  return v11;
}

- (id)_fullContextsForApplicationItems:(id)a3 overlayChartController:(id)a4
{
  v122[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HKOverlayRoomSleepViewController *)self _buildDurationDisplayTypeWithApplicationItems:v6];
  uint64_t v9 = [(HKOverlayRoomSleepViewController *)self _durationAmountContextForApplicationItems:v6 durationDisplayType:v8];
  uint64_t v10 = [(HKOverlayRoomSleepViewController *)self _durationGoalContextForApplicationItems:v6 durationDisplayType:v8 overlayMode:3 isPrimaryContext:0];
  uint64_t v11 = [(HKOverlayRoomSleepViewController *)self _durationAverageContextForApplicationItems:v6 durationDisplayType:v8 useInBedAverage:1];
  v102 = (void *)v8;
  uint64_t v12 = [(HKOverlayRoomSleepViewController *)self _durationAverageContextForApplicationItems:v6 durationDisplayType:v8 useInBedAverage:0];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v100 = (void *)v10;
  v101 = (void *)v9;
  v122[0] = v9;
  v122[1] = v10;
  v98 = (void *)v12;
  v99 = (void *)v11;
  v122[2] = v11;
  v122[3] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:4];
  [v13 addObjectsFromArray:v14];

  int v15 = [(HKOverlayRoomSleepViewController *)self trendModel];

  if (v15)
  {
    uint64_t v16 = [(HKOverlayRoomSleepViewController *)self _buildSleepTrendContext:v6 overlayChartController:v7];
    [v13 addObject:v16];
    id v17 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:]([HKOverlayContextLocation alloc], "initWithContainerIndex:sectionIndex:itemIndex:", 1, 1, [v13 count] - 1);
    [(HKOverlayRoomSleepViewController *)self setTrendContextLocation:v17];
  }
  id v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v19 = [v18 localizedStringForKey:@"SLEEP_AMOUNT_SECTION_HEADER" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];

  v96 = (void *)v19;
  v97 = v13;
  v105 = [[HKOverlayContextSection alloc] initWithSectionTitle:v19 overlayContextItems:v13];
  uint64_t v20 = [(HKOverlayRoomSleepViewController *)self _consistencyContextForApplicationItems:v6 overlayMode:3 isPrimaryContext:1];
  unint64_t v21 = [HKOverlayContextSection alloc];
  v95 = (void *)v20;
  uint64_t v121 = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
  v104 = [(HKOverlayContextSection *)v21 initWithSectionTitle:0 overlayContextItems:v22];

  uint64_t v23 = [(HKOverlayRoomSleepViewController *)self _buildDurationDisplayTypeForStackedWithApplicationItems:v6];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v25 = [_HKSleepComparisonContext alloc];
  v26 = [MEMORY[0x1E4F2B448] dataTypeWithCode:5];
  uint64_t v27 = [(_HKSleepComparisonContext *)v25 initWithStackedSampleType:v26 currentCalendarOverride:0 overlayChartController:v7 applicationItems:v6 contextChangeDelegate:self primarySleepDisplayType:v23];

  id v28 = [_HKSleepComparisonContext alloc];
  uint64_t v29 = [MEMORY[0x1E4F2B448] dataTypeWithCode:61];
  uint64_t v30 = [(_HKSleepComparisonContext *)v28 initWithStackedSampleType:v29 currentCalendarOverride:0 overlayChartController:v7 applicationItems:v6 contextChangeDelegate:self primarySleepDisplayType:v23];

  v93 = (void *)v30;
  v94 = (void *)v27;
  v120[0] = v27;
  v120[1] = v30;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:2];
  [v24 addObjectsFromArray:v31];

  v32 = [_HKSleepComparisonContext alloc];
  v33 = [MEMORY[0x1E4F2B448] dataTypeWithCode:256];
  v108 = (void *)v23;
  v109 = v7;
  id v34 = v6;
  uint64_t v35 = [(_HKSleepComparisonContext *)v32 initWithStackedSampleType:v33 currentCalendarOverride:0 overlayChartController:v7 applicationItems:v6 contextChangeDelegate:self primarySleepDisplayType:v23];

  uint64_t v36 = self;
  v37 = v24;
  v92 = (void *)v35;
  [v24 addObject:v35];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v38 = v36;
  id obj = [(HKOverlayRoomViewController *)v36 factorDisplayTypes];
  uint64_t v39 = [obj countByEnumeratingWithState:&v110 objects:v119 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v111;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v111 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = *(void *)(*((void *)&v110 + 1) + 8 * i);
        objc_super v44 = [_HKSleepComparisonFactorContext alloc];
        v45 = [(HKOverlayRoomSleepViewController *)v38 sleepChartFormatter];
        v46 = [(_HKSleepComparisonFactorContext *)v44 initWithStackedFactorDisplayType:v43 currentCalendarOverride:0 overlayChartController:v109 applicationItems:v34 contextChangeDelegate:v38 primarySleepDisplayType:v108 sleepChartFormatter:v45];

        if ([(HKOverlayRoomViewController *)v38 factorDisplayTypeIsActive:v43]) {
          [v37 insertObject:v46 atIndex:0];
        }
        else {
          [v37 addObject:v46];
        }
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v110 objects:v119 count:16];
    }
    while (v40);
  }

  v91 = v37;
  v89 = [[HKOverlayContextSection alloc] initWithSectionTitle:0 overlayContextItems:v37];
  id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v47 = v38;
  v90 = [(HKOverlayRoomSleepViewController *)v38 _buildConsistencyDisplayTypeWithApplicationItems:v34];
  v48 = [HKOverlayContextSectionContainer alloc];
  v49 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v50 = [v49 localizedStringForKey:@"SLEEP_ANALYSIS_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
  v118[0] = v104;
  v118[1] = v105;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:2];
  v88 = [(HKOverlayContextSectionContainer *)v48 initWithContainerTitle:v50 overlayContextSections:v51 primaryDisplayType:v90];

  [v86 addObject:v88];
  id obja = [(HKOverlayRoomSleepViewController *)v38 _buildStagesDisplayTypeWithApplicationItems:v34];
  v87 = v34;
  uint64_t v52 = [(HKOverlayRoomSleepViewController *)v38 _buildStagesDurationDisplayTypeWithApplicationItems:v34];
  v53 = [HKOverlayContextSection alloc];
  v84 = [(HKOverlayRoomSleepViewController *)v38 _stageDurationContextForApplicationItems:v34 baseDisplayType:obja sleepCategoryValue:2];
  v116[0] = v84;
  v83 = [(HKOverlayRoomSleepViewController *)v38 _stageDurationContextForApplicationItems:v34 baseDisplayType:obja sleepCategoryValue:5];
  v116[1] = v83;
  v82 = [(HKOverlayRoomSleepViewController *)v38 _stageDurationContextForApplicationItems:v34 baseDisplayType:obja sleepCategoryValue:3];
  v116[2] = v82;
  v81 = [(HKOverlayRoomSleepViewController *)v38 _stageDurationContextForApplicationItems:v34 baseDisplayType:obja sleepCategoryValue:4];
  v116[3] = v81;
  v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:4];
  v79 = [(HKOverlayContextSection *)v53 initWithSectionTitle:0 overlayContextItems:v80];
  v117[0] = v79;
  v54 = [HKOverlayContextSection alloc];
  v78 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v55 = [v78 localizedStringForKey:@"SLEEP_STAGES_PERCENTAGE_SECTION_HEADER" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
  v77 = [(HKOverlayRoomViewController *)v38 applicationItems];
  uint64_t v56 = v52;
  v76 = [(HKOverlayRoomSleepViewController *)v38 _sleepStagePercentageContextForStage:2 applicationItems:v77 baseDisplayType:v52];
  v115[0] = v76;
  v75 = [(HKOverlayRoomViewController *)v38 applicationItems];
  v85 = (void *)v52;
  v57 = [(HKOverlayRoomSleepViewController *)v38 _sleepStagePercentageContextForStage:5 applicationItems:v75 baseDisplayType:v52];
  v115[1] = v57;
  v58 = [(HKOverlayRoomViewController *)v47 applicationItems];
  v59 = [(HKOverlayRoomSleepViewController *)v47 _sleepStagePercentageContextForStage:3 applicationItems:v58 baseDisplayType:v52];
  v115[2] = v59;
  v60 = [(HKOverlayRoomViewController *)v47 applicationItems];
  v61 = [(HKOverlayRoomSleepViewController *)v47 _sleepStagePercentageContextForStage:4 applicationItems:v60 baseDisplayType:v56];
  v115[3] = v61;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:4];
  v63 = [(HKOverlayContextSection *)v54 initWithSectionTitle:v55 overlayContextItems:v62];
  v117[1] = v63;
  v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];

  v64 = [HKOverlayContextSectionContainer alloc];
  v65 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v66 = [v65 localizedStringForKey:@"SLEEP_STAGES_OVERLAY_CONTAINER_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
  v67 = [(HKOverlayContextSectionContainer *)v64 initWithContainerTitle:v66 overlayContextSections:v103 primaryDisplayType:obja];

  [v86 insertObject:v67 atIndex:0];
  v68 = [HKOverlayContextSectionContainer alloc];
  v69 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v70 = [v69 localizedStringForKey:@"SLEEP_COMPARISON_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
  v114 = v89;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
  v72 = [(HKOverlayContextSectionContainer *)v68 initWithContainerTitle:v70 overlayContextSections:v71];

  [v86 addObject:v72];
  v73 = [[HKOverlayContextLocation alloc] initWithContainerIndex:2 sectionIndex:0 itemIndex:0];
  [(HKOverlayRoomSleepViewController *)v47 setComparisonContextLocation:v73];

  return v86;
}

- (id)_durationGoalContextForApplicationItems:(id)a3 durationDisplayType:(id)a4 overlayMode:(int64_t)a5 isPrimaryContext:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  uint64_t v11 = [(HKOverlayRoomSleepViewController *)self _buildDurationGoalDisplayTypeWithApplicationItems:a3];
  uint64_t v12 = [_HKSleepDurationGoalContext alloc];
  id v13 = [(HKOverlayRoomViewController *)self chartController];
  uint64_t v14 = [(_HKSleepDurationGoalContext *)v12 initWithBaseDisplayType:v10 overlayDisplayType:v11 overlayChartController:v13 overlayMode:a5 isPrimaryContext:v6 contextChangeDelegate:self];

  return v14;
}

- (id)_consistencyContextForApplicationItems:(id)a3 overlayMode:(int64_t)a4 isPrimaryContext:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(HKOverlayRoomSleepViewController *)self _buildConsistencyDisplayTypeWithApplicationItems:v8];
  id v10 = [(HKOverlayRoomSleepViewController *)self _buildScheduleDisplayTypeWithApplicationItems:v8];

  uint64_t v11 = [_HKSleepScheduleContext alloc];
  uint64_t v12 = [(HKOverlayRoomViewController *)self chartController];
  id v13 = [(_HKSleepScheduleContext *)v11 initWithBaseDisplayType:v9 overlayDisplayType:v10 overlayChartController:v12 overlayMode:a4 isPrimaryContext:v5 contextChangeDelegate:self];

  return v13;
}

- (id)_durationAverageContextForApplicationItems:(id)a3 durationDisplayType:(id)a4 useInBedAverage:(BOOL)a5
{
  BOOL v5 = a5;
  v24[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v22 = a4;
  uint64_t v9 = [(HKOverlayRoomSleepViewController *)self sleepDisplayType];
  id v10 = [v8 unitController];
  uint64_t v11 = +[HKSleepUtilities buildSleepGraphSeriesForSleepSeriesType:0 sleepDisplayType:v9 unitController:v10 numericAxisConfigurationOverrides:0 timeScope:6];

  if (v5)
  {
    [v11 setHighlightedSleepValue:&unk_1F3C22678];
    uint64_t v12 = [(HKOverlayRoomSleepViewController *)self _buildDurationAverageSeries];
    [v12 setAverageValueType:&unk_1F3C22678];
  }
  else
  {
    id v13 = [NSNumber numberWithInteger:_HKCategoryValueSleepAnalysisDefaultAsleepValue()];
    [v11 setHighlightedSleepValue:v13];

    uint64_t v12 = [(HKOverlayRoomSleepViewController *)self _buildDurationAverageSeries];
    uint64_t v14 = [NSNumber numberWithInteger:_HKCategoryValueSleepAnalysisDefaultAsleepValue()];
    [v12 setAverageValueType:v14];
  }
  v23[0] = &unk_1F3C22690;
  v23[1] = &unk_1F3C226A8;
  v24[0] = v11;
  v24[1] = v12;
  v23[2] = &unk_1F3C226C0;
  v23[3] = &unk_1F3C226D8;
  v24[2] = v12;
  v24[3] = v12;
  int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];
  uint64_t v16 = [(HKOverlayRoomSleepViewController *)self _buildDurationAverageFormatter];
  id v17 = [(HKOverlayRoomSleepViewController *)self _buildDurationAverageDisplayTypeWithApplicationItems:v8 customSleepSeriesMapping:v15 customSleepChartFormatter:v16];
  id v18 = [_HKSleepDurationAverageContext alloc];
  uint64_t v19 = [(HKOverlayRoomViewController *)self chartController];
  uint64_t v20 = [(_HKSleepDurationAverageContext *)v18 initWithBaseDisplayType:v22 overlayDisplayType:v17 overlayChartController:v19 useInBedAverage:v5 contextChangeDelegate:self overlayAverageSeries:v12 averageChartFormatter:v16];

  return v20;
}

- (id)_durationAmountContextForApplicationItems:(id)a3 durationDisplayType:(id)a4
{
  id v5 = a4;
  BOOL v6 = [_HKSleepDurationAmountContext alloc];
  id v7 = [(HKOverlayRoomViewController *)self chartController];
  id v8 = [(_HKSleepDurationAmountContext *)v6 initWithBaseDisplayType:v5 overlayChartController:v7 contextChangeDelegate:self];

  return v8;
}

- (id)_sleepStagePercentageContextForStage:(int64_t)a3 applicationItems:(id)a4 baseDisplayType:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(HKOverlayRoomSleepViewController *)self _buildStagesDurationDisplayTypeWithApplicationItems:a4];
  [(HKOverlayRoomSleepViewController *)self _updateHighlightedSleepStage:a3 onDisplayType:v9];
  id v10 = [HKSleepStagePercentageContext alloc];
  uint64_t v11 = [(HKOverlayRoomViewController *)self chartController];
  uint64_t v12 = [(HKSleepStagePercentageContext *)v10 initWithSleepStage:a3 baseDisplayType:v8 overlayDisplayType:v9 overlayChartController:v11 contextChangeDelegate:self];

  return v12;
}

- (id)_stageDurationContextForApplicationItems:(id)a3 baseDisplayType:(id)a4 sleepCategoryValue:(int64_t)a5
{
  id v8 = a4;
  uint64_t v9 = [(HKOverlayRoomSleepViewController *)self _buildStagesDisplayTypeWithApplicationItems:a3];
  [(HKOverlayRoomSleepViewController *)self _updateHighlightedSleepStage:a5 onDisplayType:v9];
  id v10 = [HKSleepStageDurationContext alloc];
  uint64_t v11 = [(HKOverlayRoomViewController *)self chartController];
  uint64_t v12 = [(HKSleepStageDurationContext *)v10 initWithBaseDisplayType:v8 overlayDisplayType:v9 overlayChartController:v11 contextChangeDelegate:self sleepValue:a5];

  return v12;
}

- (void)_updateHighlightedSleepStage:(int64_t)a3 onDisplayType:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
    id v7 = [v5 seriesForTimeScopeMapping];
    id v8 = [v7 allValues];
    uint64_t v9 = [v6 setWithArray:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__HKOverlayRoomSleepViewController__updateHighlightedSleepStage_onDisplayType___block_invoke;
    v10[3] = &__block_descriptor_40_e27_v24__0__HKGraphSeries_8_B16l;
    v10[4] = a3;
    [v9 enumerateObjectsUsingBlock:v10];
  }
}

void __79__HKOverlayRoomSleepViewController__updateHighlightedSleepStage_onDisplayType___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 conformsToProtocol:&unk_1F3C982D0])
  {
    int64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
    [v4 setHighlightedSleepStage:v3];
  }
}

- (int64_t)initialSelectedContainerIndexForMode:(int64_t)a3
{
  if (a3 == 3)
  {
    id v5 = [(HKOverlayRoomSleepViewController *)self trendModel];
    char v6 = [v5 selectTrendInitially];

    if (v6) {
      return 1;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)HKOverlayRoomSleepViewController;
  return [(HKOverlayRoomViewController *)&v8 initialSelectedContainerIndexForMode:a3];
}

- (id)initialSelectedContextForMode:(int64_t)a3 containerIndex:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  char v6 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    *(_DWORD *)uint64_t v19 = 138543618;
    *(void *)&v19[4] = objc_opt_class();
    *(_WORD *)&v19[12] = 2048;
    *(void *)&v19[14] = a4;
    id v8 = *(id *)&v19[4];
    _os_log_impl(&dword_1E0B26000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Determining initial selected context for container index: %ld", v19, 0x16u);
  }
  uint64_t v9 = [(HKOverlayRoomViewController *)self chartController];
  [v9 updatePrimaryGraphViewController];

  uint64_t v10 = [(HKOverlayRoomSleepViewController *)self comparisonContextLocation];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = [(HKOverlayRoomSleepViewController *)self comparisonContextLocation];
    uint64_t v13 = [v12 containerIndex];

    if (v13 == a4)
    {
      uint64_t v14 = [(HKOverlayRoomSleepViewController *)self comparisonContextLocation];
      goto LABEL_11;
    }
  }
  int v15 = [(HKOverlayRoomSleepViewController *)self trendModel];
  if ([v15 selectTrendInitially])
  {
    uint64_t v16 = [(HKOverlayRoomSleepViewController *)self trendContextLocation];
    uint64_t v17 = [v16 containerIndex];

    if (v17 == a4)
    {
      uint64_t v14 = [(HKOverlayRoomSleepViewController *)self trendContextLocation];
      goto LABEL_11;
    }
  }
  else
  {
  }
  uint64_t v14 = 0;
LABEL_11:
  return v14;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [HKOverlayRoomSleepViewController alloc];
  uint64_t v11 = [(HKOverlayRoomSleepViewController *)self sleepDataSourceProvider];
  uint64_t v12 = [(HKOverlayRoomSleepViewController *)self sleepChartFormatter];
  uint64_t v13 = [(HKOverlayRoomSleepViewController *)self trendModel];
  uint64_t v14 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
  int v15 = [(HKOverlayRoomSleepViewController *)v10 initWithDisplayDate:v9 applicationItems:v8 sleepDataSourceProvider:v11 sleepChartFormatter:v12 mode:a3 trendModel:v13 factorDisplayTypes:v14];

  [(HKOverlayRoomViewController *)v15 setAdditionalChartOptions:[(HKOverlayRoomViewController *)self filteredInteractiveChartOptionsForMode:a3]];
  return v15;
}

- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4
{
  return [(HKOverlayRoomViewController *)self segmentedControlSelectedIndex] == 0;
}

- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4
{
  v19[5] = *MEMORY[0x1E4F143B8];
  id v5 = [HKInfographicViewController alloc];
  char v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v7 = [v6 localizedStringForKey:@"SLEEP_STAGES_DESCRIPTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
  id v8 = [(HKOverlayRoomSleepViewController *)self _itemForTitle:0 titleAccessoryColor:0 description:v7];
  id v9 = -[HKOverlayRoomSleepViewController _itemForSleepStageInfographicWithStage:](self, "_itemForSleepStageInfographicWithStage:", 2, v8);
  v19[1] = v9;
  uint64_t v10 = [(HKOverlayRoomSleepViewController *)self _itemForSleepStageInfographicWithStage:5];
  void v19[2] = v10;
  uint64_t v11 = [(HKOverlayRoomSleepViewController *)self _itemForSleepStageInfographicWithStage:3];
  v19[3] = v11;
  uint64_t v12 = [(HKOverlayRoomSleepViewController *)self _itemForSleepStageInfographicWithStage:4];
  v19[4] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];
  uint64_t v14 = [(HKInfographicViewController *)v5 initWithItems:v13];

  int v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v16 = [v15 localizedStringForKey:@"SLEEP_STAGES" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
  [(HKInfographicViewController *)v14 setTitle:v16];

  uint64_t v17 = [[HKModalNavigationController alloc] initWithRootViewController:v14];
  return v17;
}

- (id)_itemForTitle:(id)a3 titleAccessoryColor:(id)a4 description:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (objc_class *)MEMORY[0x1E4F28E48];
  id v10 = a5;
  id v11 = objc_alloc_init(v9);
  unint64_t v12 = 0x1E4F28000;
  if (v7)
  {
    uint64_t v13 = HKInteractiveChartInfographicTitleAttributes();
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
    if (v8)
    {
      int v15 = [MEMORY[0x1E4FB1830] configurationWithFont:v14 scale:1];
      [MEMORY[0x1E4FB1818] systemImageNamed:@"circle.fill" withConfiguration:v15];
      uint64_t v16 = v25 = v14;
      uint64_t v17 = [v16 imageWithRenderingMode:2];
      id v18 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v17];
      uint64_t v19 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v18];
      [v11 appendAttributedString:v19];

      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
      [v11 appendAttributedString:v20];

      objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v8, 0, objc_msgSend(v11, "length"));
      uint64_t v14 = v25;

      unint64_t v12 = 0x1E4F28000uLL;
    }
    unint64_t v21 = (void *)[objc_alloc(*(Class *)(v12 + 2840)) initWithString:v7 attributes:v13];
    [v11 appendAttributedString:v21];
  }
  id v22 = (void *)[objc_alloc(*(Class *)(v12 + 2840)) initWithString:v10];

  uint64_t v23 = [[HKInfographicContentItem alloc] initWithTitle:v11 description:v22];
  return v23;
}

- (id)_itemForSleepStageInfographicWithStage:(int64_t)a3
{
  id v5 = +[HKSleepUtilities localizedInfographicTitleForCategoryValue:](HKSleepUtilities, "localizedInfographicTitleForCategoryValue:");
  char v6 = +[HKSleepUtilities localizedInfographicDescriptionForCategoryValue:a3];
  id v7 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepColorForSleepAnalysis:", a3);
  id v8 = [(HKOverlayRoomSleepViewController *)self _itemForTitle:v5 titleAccessoryColor:v7 description:v6];

  return v8;
}

- (id)dateRangeFromSelectionContext:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HKOverlayRoomViewController *)self chartController];
  id v8 = [v7 dateRangeFromSelectionContext:v6 timeScope:a4];

  return v8;
}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HKOverlayRoomViewController *)self chartController];
  id v8 = [v7 stringForValueRange:v6 timeScope:a4];

  return v8;
}

- (id)titleForSelectedRangeData:(id)a3 displayType:(id)a4
{
  id v5 = a3;
  id v6 = [(HKOverlayRoomSleepViewController *)self _sleepColorForSelectedRangeData:v5];
  id v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartLollipopKeyFont");
  id v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
  id v9 = +[HKSelectedRangeLabel attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:](HKSelectedRangeLabel, "attributedStringForSelectedRangeData:font:foregroundColor:prefixColor:prefersImageAffixes:embedded:", v5, v7, v8, v6, [v5 prefersImageAffixes], 0);

  return v9;
}

- (id)_sleepColorForSelectedRangeData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 prefixColor];

  if (v5)
  {
    uint64_t v6 = [v4 prefixColor];
LABEL_3:
    id v7 = (void *)v6;
    goto LABEL_4;
  }
  BOOL v9 = [(HKOverlayRoomSleepViewController *)self durationContextSelected]
    || [(HKOverlayRoomSleepViewController *)self scheduleContextSelected]
    || [(HKOverlayRoomSleepViewController *)self stageDurationContextSelected]
    || [(HKOverlayRoomSleepViewController *)self stagePercentageContextSelected];
  if ([v4 dataType] == 9)
  {
    if (v9) {
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveInBedColor");
    }
    else {
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInBedColor");
    }
    uint64_t v6 = LABEL_14:;
    goto LABEL_3;
  }
  if ([v4 dataType] == 10)
  {
    if (v9) {
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveAsleepColor");
    }
    else {
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepColor");
    }
    goto LABEL_14;
  }
  id v10 = [MEMORY[0x1E4FB1618] labelColor];
  id v7 = +[HKSelectedRangeLabel standardPrefixColorForSelectedRangeData:v4 defaultColor:v10];

LABEL_4:
  return v7;
}

- (void)restoreUserActivityState:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = objc_opt_class();
    id v8 = v7;
    BOOL v9 = [v4 userInfo];
    *(_DWORD *)buf = 138543618;
    unint64_t v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1E0B26000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Restoring sleep chart with userInfo: %{public}@", buf, 0x16u);
  }
  v10.receiver = self;
  v10.super_class = (Class)HKOverlayRoomSleepViewController;
  [(HKOverlayRoomViewController *)&v10 restoreUserActivityState:v4];
}

- (id)restorationStateDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"bundleName";
  v9[1] = @"chartContext";
  v10[0] = @"SleepHealthAppPlugin";
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA98]);
  v10[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  v8.receiver = self;
  v8.super_class = (Class)HKOverlayRoomSleepViewController;
  id v5 = [(HKOverlayRoomViewController *)&v8 restorationStateDictionary];
  uint64_t v6 = +[HKInteractiveChartViewController mergeRestorationDictionary:v4 otherDictionary:v5];

  return v6;
}

- (void)saveRestorationState
{
  id v4 = [(HKOverlayRoomSleepViewController *)self restorationStateDictionary];
  id v3 = +[HKInteractiveChartViewController baseRestorationUserActivity:v4 activityType:@"com.apple.health.plugin" title:@"Sleep"];
  +[HKInteractiveChartViewController saveRestorationUserActivity:v3 viewController:self];
}

- (BOOL)durationContextSelected
{
  return self->durationContextSelected;
}

- (BOOL)scheduleContextSelected
{
  return self->scheduleContextSelected;
}

- (BOOL)comparisonContextSelected
{
  return self->comparisonContextSelected;
}

- (BOOL)baseDisplayIsSchedule
{
  return self->baseDisplayIsSchedule;
}

- (void)setBaseDisplayIsSchedule:(BOOL)a3
{
  self->baseDisplayIsSchedule = a3;
}

- (BOOL)shouldHighlightBaseDisplayContext
{
  return self->shouldHighlightBaseDisplayContext;
}

- (void)setShouldHighlightBaseDisplayContext:(BOOL)a3
{
  self->shouldHighlightBaseDisplayContext = a3;
}

- (BOOL)stageDurationContextSelected
{
  return self->stageDurationContextSelected;
}

- (void)setStageDurationContextSelected:(BOOL)a3
{
  self->stageDurationContextSelected = a3;
}

- (BOOL)stagePercentageContextSelected
{
  return self->stagePercentageContextSelected;
}

- (BOOL)stagePercentageContextWillBeSelected
{
  return self->stagePercentageContextWillBeSelected;
}

- (void)setStagePercentageContextWillBeSelected:(BOOL)a3
{
  self->stagePercentageContextWillBeSelected = a3;
}

- (HKSleepDataSourceProvider)sleepDataSourceProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sleepDataSourceProvider);
  return (HKSleepDataSourceProvider *)WeakRetained;
}

- (void)setSleepDataSourceProvider:(id)a3
{
}

- (HKInteractiveChartDataFormatter)sleepChartFormatter
{
  return self->_sleepChartFormatter;
}

- (void)setSleepChartFormatter:(id)a3
{
}

- (HKDisplayType)sleepDisplayType
{
  return self->_sleepDisplayType;
}

- (void)setSleepDisplayType:(id)a3
{
}

- (NSDictionary)sleepChartCaches
{
  return self->_sleepChartCaches;
}

- (void)setSleepChartCaches:(id)a3
{
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (HKOverlayContextLocation)trendContextLocation
{
  return self->_trendContextLocation;
}

- (void)setTrendContextLocation:(id)a3
{
}

- (HKOverlayContextLocation)comparisonContextLocation
{
  return self->_comparisonContextLocation;
}

- (void)setComparisonContextLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisonContextLocation, 0);
  objc_storeStrong((id *)&self->_trendContextLocation, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_sleepChartCaches, 0);
  objc_storeStrong((id *)&self->_sleepDisplayType, 0);
  objc_storeStrong((id *)&self->_sleepChartFormatter, 0);
  objc_destroyWeak((id *)&self->_sleepDataSourceProvider);
}

@end