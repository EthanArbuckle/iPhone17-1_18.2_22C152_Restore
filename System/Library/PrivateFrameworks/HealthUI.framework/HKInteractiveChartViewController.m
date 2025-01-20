@interface HKInteractiveChartViewController
+ (BOOL)_timeScope:(int64_t)a3 inTimeScopeRanges:(id)a4;
+ (id)_encodeCurrentProfileIdentifierForHealthStore:(id)a3;
+ (id)_timeScopesWithOptions:(unint64_t)a3 timeScopeRanges:(id)a4;
+ (id)baseRestorationUserActivity:(id)a3 activityType:(id)a4 title:(id)a5;
+ (id)mergeRestorationDictionary:(id)a3 otherDictionary:(id)a4;
+ (id)standardChartRestorationActivity:(id)a3 primaryDisplayType:(id)a4;
+ (id)standardChartRestorationDictionary:(id)a3 healthStore:(id)a4;
+ (int64_t)_timeScopeForTimeScope:(int64_t)a3 availableTimeScopes:(id)a4;
+ (void)_validateStackedHeights:(id)a3;
+ (void)saveRestorationUserActivity:(id)a3 viewController:(id)a4;
- (BOOL)_acceptSubclassRange:(id)a3 proposedRange:(id)a4 axisRange:(id)a5;
- (BOOL)_applyHorizontalMarginsToEntireView;
- (BOOL)_chartHasDateAxis;
- (BOOL)_currentValueEnabled;
- (BOOL)_dashboardEmptyLabelsExist;
- (BOOL)_date:(id)a3 closeToDate:(id)a4 epsilonDateComponents:(id)a5 calendar:(id)a6;
- (BOOL)_displayTypeIsHorizontalForTimeScope:(int64_t)a3 displayType:(id)a4;
- (BOOL)_drawsGridlinesPerSeriesGroup;
- (BOOL)_headerLineEnabled;
- (BOOL)_inPointSelectionMode;
- (BOOL)_prefersOpaqueLegends;
- (BOOL)_primaryDisplayTypeHasNoData;
- (BOOL)_selectedDateRangeLabelEnabled;
- (BOOL)_selectedSeriesWantsLastRecordedDate;
- (BOOL)_shouldHandleInitialLollipopTouchDate:(id)a3 mostRecentDataDate:(id)a4 forGraphView:(id)a5;
- (BOOL)_shouldHandleVisibleRangeChangeWithChangeContext:(int64_t)a3;
- (BOOL)_shouldShowDateRangeForSelectedPointDateLabel;
- (BOOL)_showInfoButtonInCurrentValueView;
- (BOOL)_tilingDisabled;
- (BOOL)_timeScopeEnabled;
- (BOOL)_valueRange:(id)a3 fitsInsideValueRange:(id)a4;
- (BOOL)_viewHierarchyIsHidden:(id)a3;
- (BOOL)_visibleRangeIsNowForTimeScope:(int64_t)a3;
- (BOOL)chartDataIsAvailable;
- (BOOL)disableCurrentValueViewForInitialLollipop;
- (BOOL)firstSampleDateRangeUpdate;
- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3;
- (BOOL)hasInitialDateRangeAndTimeScope;
- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4;
- (BOOL)prefersStatusBarHidden;
- (BOOL)removeDisplayTypeStackAtIndex:(int64_t)a3;
- (HKChartDataCacheController)chartDataCacheController;
- (HKCurrentOverlayLocationProviding)currentOverlayLocationProvider;
- (HKCurrentValueViewDataSource)currentValueViewDataSource;
- (HKCurrentValueViewDataSourceDelegate)currentValueViewDataSourceDelegate;
- (HKDateCache)dateCache;
- (HKDisplayType)calendarQueryDisplayType;
- (HKDisplayTypeController)displayTypeController;
- (HKGraphViewController)primaryGraphViewController;
- (HKHealthStore)healthStore;
- (HKInteractiveChartAnnotationViewDataSourceProtocol)annotationDataSource;
- (HKInteractiveChartCurrentValueViewCallbacks)standardCurrentValueViewCallbacks;
- (HKInteractiveChartCurrentValueViewHandler)currentValueViewHandler;
- (HKInteractiveChartViewController)initWithDisplayTypes:(id)a3 healthStore:(id)a4 unitPreferenceController:(id)a5 dateCache:(id)a6 chartDataCacheController:(id)a7 selectedTimeScopeController:(id)a8 sampleTypeDateRangeController:(id)a9 initialXValue:(id)a10 currentCalendarOverride:(id)a11 options:(unint64_t)a12;
- (HKInteractiveChartViewController)initWithStackedDisplayTypes:(id)a3 primaryDisplayTypeStackIndex:(id)a4 stackedDisplayTypeHeights:(id)a5 healthStore:(id)a6 unitPreferenceController:(id)a7 dateCache:(id)a8 chartDataCacheController:(id)a9 selectedTimeScopeController:(id)a10 sampleTypeDateRangeController:(id)a11 initialXValue:(id)a12 currentCalendarOverride:(id)a13 options:(unint64_t)a14 timeScopeRanges:(id)a15;
- (HKLollipopController)lollipopController;
- (HKSampleType)calendarQuerySampleType;
- (HKSampleTypeDateRangeController)sampleTypeDateRangeController;
- (HKSelectedRangeFormatter)selectedRangeFormatter;
- (HKSelectedTimeScopeController)selectedTimeScopeController;
- (HKTrendAccessibilityDelegate)trendAccessibilityDelegate;
- (HKUnitPreferenceController)unitPreferenceController;
- (NSArray)displayTypeStack;
- (NSArray)stackedDisplayTypeHeights;
- (NSCalendar)currentCalendar;
- (NSDictionary)timeScopeRanges;
- (NSString)chartOverlayVersion;
- (NSUserActivity)restorationUserActivity;
- (UIColor)calendarDaySamplePresentColor;
- (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager)analyticsManager;
- (double)_annotationViewCenterY;
- (double)_effectiveHorizontalMargin;
- (double)dateSelectorHeight;
- (double)heightForChartHeight:(double)a3;
- (double)legendBottomLocation;
- (double)minimumHeightForChart;
- (double)minimumHeightForWidth:(double)a3 chartWidthToHeightRatio:(double)a4;
- (id)_allDisplayTypes;
- (id)_assembleValueViewString:(id)a3;
- (id)_chartDataForPoint:(id)a3;
- (id)_colorForDisplayType:(id)a3;
- (id)_configurationForDisplayType:(id)a3;
- (id)_configurationForSeries:(id)a3;
- (id)_createGraphSeriesConfigurationFromDisplayType:(id)a3 timeScope:(int64_t)a4;
- (id)_customGraphSeriesForDisplayType:(id)a3;
- (id)_dateForBlockPoint:(id)a3;
- (id)_dateForMostRecentData;
- (id)_debugDateStringForPoint:(id)a3;
- (id)_defaultAxisRangeIncludeToday:(BOOL)a3;
- (id)_displayNameForDisplayType:(id)a3;
- (id)_displayTypeForSeries:(id)a3;
- (id)_displayUnitForDisplayType:(id)a3;
- (id)_formatterForSeries:(id)a3;
- (id)_graphViewAxisAndVisibleDateRangeForTimeScope:(int64_t)a3 fixedRange:(id)a4;
- (id)_midPointDateFromVisibleRange;
- (id)_numberForXCoordinate:(double)a3 graphView:(id)a4;
- (id)_pointSelectionInfo:(id)a3;
- (id)_primaryDisplayType;
- (id)_rangeValueAsNumber:(id)a3;
- (id)_singleFixedRange;
- (id)_trendCoordinateDescriptionForStartX:(double)a3 endX:(double)a4 timeScope:(int64_t)a5 graphView:(id)a6;
- (id)_valueViewToString:(id)a3;
- (id)accessibilityDataForChart;
- (id)addNoDataEntries:(id)a3 timeScope:(int64_t)a4 targetSeries:(id)a5;
- (id)chartHasDataCompletion;
- (id)currentDisplayTypesForStackOffset:(int64_t)a3;
- (id)currentValueViewAsString;
- (id)dateForXCoordinate:(double)a3 graphView:(id)a4;
- (id)descriptionForChartData:(id)a3 timeScope:(int64_t)a4;
- (id)descriptionForStartX:(double)a3 endX:(double)a4 chartData:(id)a5 timeScope:(int64_t)a6 resolution:(int64_t)a7 graphView:(id)a8;
- (id)descriptionSeriesForGraphView:(id)a3;
- (id)descriptionSpansForGraphView:(id)a3 timeScope:(int64_t)a4;
- (id)fixedRangeForTimeScope:(int64_t)a3;
- (id)graphSeriesForDisplayType:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5;
- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5;
- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4;
- (id)initialXValue;
- (id)lollipopAnnotationColor;
- (id)lollipopExtensionColor;
- (id)lollipopFieldColor;
- (id)makeAnchorDateFromPreviousAnchorDate:(id)a3 previousEffectiveVisibleRange:(id)a4 previousTimeScope:(int64_t)a5 currentTimeScope:(int64_t)a6;
- (id)makeAnnotationDataSource;
- (id)makeCurrentValueView;
- (id)makePrimaryGraphViewControllerWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6;
- (id)makeStandardCurrentValueViewDataSource;
- (id)primaryGraphSeriesForTimeScope:(int64_t)a3;
- (id)replaceRangeClause:(id)a3;
- (id)restorationStateDictionary;
- (id)startupReportingBlock;
- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4;
- (id)supportedTimeScopes;
- (id)visibleRangeForTimeScope:(int64_t)a3 proposedRange:(id)a4;
- (int64_t)_countOfHorizontalSectionsForConfigurationManager:(id)a3 timeScope:(int64_t)a4;
- (int64_t)_dateZoom;
- (int64_t)_defaultTimeScopeWithAvailableTimeScopes:(id)a3;
- (int64_t)_numHorizontalDisplayTypesForTimeScope:(int64_t)a3 displayTypes:(id)a4;
- (int64_t)_userInfoSelectionCount:(id)a3;
- (int64_t)addNewDisplayTypeStackWithDisplayTypes:(id)a3;
- (int64_t)annotationDataSourceFirstWeekday;
- (int64_t)defaultAlignmentForTimeScope:(int64_t)a3;
- (int64_t)delayedAutoscaleActualCount;
- (int64_t)delayedAutoscaleRequestCount;
- (int64_t)primaryDisplayTypeStackIndex;
- (int64_t)stackCountForGraphView:(id)a3;
- (int64_t)stackOffsetCount;
- (unint64_t)options;
- (void)_addDisplayTypeToConfiguration:(id)a3 allDisplayTypes:(id)a4 configurationManager:(id)a5;
- (void)_addSeriesForDisplayType:(id)a3 updatingTimeScopeProperties:(id)a4 configurationManager:(id)a5;
- (void)_automaticAutoScale;
- (void)_configureCustomDisplayType:(id)a3 graphSeries:(id)a4 configurationManager:(id)a5 timeScope:(int64_t)a6;
- (void)_configureInitialLollipopSelection;
- (void)_configureSelectedRangeFormatterWithChartRangeProvider;
- (void)_createAndPrepareFeedbackGenerator;
- (void)_createDashboardEmptyLabelsIfNecessary;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_handleInitialLollipopSelection;
- (void)_handleVisibleRangeChange;
- (void)_hideTimeDateControls;
- (void)_layoutDashboardEmptyLabelsIfNecessary;
- (void)_layoutDividerViews;
- (void)_layoutHeader;
- (void)_moveSelectedDateInDirection:(int64_t)a3;
- (void)_notifyObserversDidUpdateVisibleValueRange:(id)a3 changeContext:(int64_t)a4;
- (void)_omitLayoutHeader;
- (void)_radioButtonsDidUpdate:(id)a3;
- (void)_replacePrimaryGraphViewControllerWithScalarController;
- (void)_replacePrimaryGraphViewControllerWithTimeScope:(int64_t)a3 anchorDate:(id)a4 animated:(BOOL)a5;
- (void)_scheduleDelayedAutoscale;
- (void)_scrollToAnchorDate:(id)a3 graphView:(id)a4 alignment:(int64_t)a5;
- (void)_scrollToMostRecentDataWithAlignment:(int64_t)a3;
- (void)_setDateSelectorToVisibleRange;
- (void)_setGraphViewAxisAndVisibleDateRangeForTimeScope:(int64_t)a3 anchorDate:(id)a4 preserveScrollPosition:(BOOL)a5;
- (void)_setSelectedGraphSeries:(id)a3 animated:(BOOL)a4;
- (void)_setVisibleDisplayTypes:(id)a3;
- (void)_setVisibleRangeUsingDateFromDateSelector:(id)a3;
- (void)_showHideNoGraphSeriesLabels;
- (void)_showTimeDateControls;
- (void)_unitPreferencesDidUpdate:(id)a3;
- (void)_updateAfterConfigurationChangeIncludeDateAxis:(BOOL)a3;
- (void)_updateAxisScalingRulesForUnitPreferenceChangesOfTypes:(id)a3;
- (void)_updateGraphViewAxisDateRange;
- (void)_updateSelectedSeriesLabel:(id)a3;
- (void)addChartViewObserver:(id)a3;
- (void)addOverlayDisplayType:(id)a3 stackOffset:(int64_t)a4;
- (void)currentTimeViewDidTapOnDateSelector:(id)a3;
- (void)currentTimeViewDidTapOnNextTimeButton:(id)a3;
- (void)currentTimeViewDidTapOnPreviousTimeButton:(id)a3;
- (void)dealloc;
- (void)didTapOnDateFromCurrentValueView:(id)a3;
- (void)didTapOnInfoButtonFromCurrentValueView:(id)a3;
- (void)graphView:(id)a3 didFinishUserScrollingToValueRange:(id)a4;
- (void)graphView:(id)a3 didUpdateFromDateZoom:(int64_t)a4 toDateZoom:(int64_t)a5 newVisibleRange:(id)a6;
- (void)graphView:(id)a3 didUpdateLegendViewsWithTopLegendFrame:(CGRect)a4;
- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4;
- (void)graphView:(id)a3 didUpdateSeries:(id)a4 newDataArrived:(BOOL)a5 changeContext:(int64_t)a6;
- (void)graphView:(id)a3 didUpdateVisibleValueRange:(id)a4 changeContext:(int64_t)a5;
- (void)graphView:(id)a3 startupTime:(int64_t)a4;
- (void)graphViewDidEndSelection:(id)a3;
- (void)graphViewDidTapYAxis:(id)a3;
- (void)graphViewExternalSelectionEnd:(id)a3;
- (void)graphViewRenderedView:(id)a3;
- (void)installGraphViewSnapshot;
- (void)interactiveChartHasData:(id)a3;
- (void)loadView;
- (void)monthViewController:(id)a3 didSelectDate:(id)a4;
- (void)removeChartViewObserver:(id)a3;
- (void)removeGraphViewSnapshotAnimated:(BOOL)a3;
- (void)removeOverlayDisplayType:(id)a3 stackOffset:(int64_t)a4;
- (void)removeOverlayDisplayType:(id)a3 stackOffset:(int64_t)a4 automaticAutoscale:(BOOL)a5;
- (void)removeStackedDisplayType:(id)a3;
- (void)replaceCurrentDisplayTypesWithTypes:(id)a3 stackOffset:(int64_t)a4 resetDateRange:(BOOL)a5 automaticAutoScale:(BOOL)a6;
- (void)sampleTypeDateRangeController:(id)a3 didUpdateDateRanges:(id)a4;
- (void)saveRestorationState;
- (void)scrollToDate:(id)a3 withVisibleAlignment:(int64_t)a4;
- (void)scrollToMostRecentData;
- (void)scrollToRange:(id)a3 withVisibleAlignment:(int64_t)a4;
- (void)selectTimeScope:(int64_t)a3;
- (void)setAnnotationDataSource:(id)a3;
- (void)setAnnotationDataSourceFirstWeekday:(int64_t)a3;
- (void)setChartHasDataCompletion:(id)a3;
- (void)setCurrentOverlayLocationProvider:(id)a3;
- (void)setCurrentValueViewDataSource:(id)a3;
- (void)setCurrentValueViewDataSourceDelegate:(id)a3;
- (void)setCurrentValueViewHandler:(id)a3;
- (void)setDelayedAutoscaleActualCount:(int64_t)a3;
- (void)setDelayedAutoscaleRequestCount:(int64_t)a3;
- (void)setDetailView:(id)a3;
- (void)setDisableCurrentValueViewForInitialLollipop:(BOOL)a3;
- (void)setDisplayTypeStack:(id)a3;
- (void)setFirstSampleDateRangeUpdate:(BOOL)a3;
- (void)setHasInitialDateRangeAndTimeScope:(BOOL)a3;
- (void)setInitialXValue:(id)a3;
- (void)setLegendBottomLocation:(double)a3;
- (void)setLollipopController:(id)a3;
- (void)setRestorationUserActivity:(id)a3;
- (void)setSelectedRangeFormatter:(id)a3;
- (void)setStackedDisplayTypeHeights:(id)a3;
- (void)setStandardCurrentValueViewCallbacks:(id)a3;
- (void)setStartupReportingBlock:(id)a3;
- (void)setTimeScopeRanges:(id)a3;
- (void)setTrendAccessibilityDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAnnotationDataSource:(id)a3 pointContexts:(id)a4;
- (void)updateCurrentValueView:(id)a3 graphView:(id)a4 timeScope:(int64_t)a5 showInfoButton:(BOOL)a6;
- (void)updateCurrentValueViewWithVisibleRange;
- (void)updatePrimaryGraphViewController;
- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HKInteractiveChartViewController

- (HKInteractiveChartViewController)initWithStackedDisplayTypes:(id)a3 primaryDisplayTypeStackIndex:(id)a4 stackedDisplayTypeHeights:(id)a5 healthStore:(id)a6 unitPreferenceController:(id)a7 dateCache:(id)a8 chartDataCacheController:(id)a9 selectedTimeScopeController:(id)a10 sampleTypeDateRangeController:(id)a11 initialXValue:(id)a12 currentCalendarOverride:(id)a13 options:(unint64_t)a14 timeScopeRanges:(id)a15
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v61 = a4;
  id v51 = a5;
  id v60 = a5;
  id v20 = a6;
  id v59 = a7;
  id v50 = a8;
  id v58 = a8;
  id v57 = a9;
  id v56 = a10;
  id v55 = a11;
  id v54 = a12;
  id v21 = a13;
  id v22 = a15;
  v62.receiver = self;
  v62.super_class = (Class)HKInteractiveChartViewController;
  v23 = [(HKInteractiveChartViewController *)&v62 init];
  v24 = v23;
  if (v23)
  {
    v23->_displayState = 0;
    uint64_t v25 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v24->_creationDate;
    v24->_creationDate = (NSDate *)v25;

    v24->_options = a14;
    objc_storeStrong((id *)&v24->_healthStore, a6);
    objc_storeStrong((id *)&v24->_unitPreferenceController, a7);
    objc_storeStrong((id *)&v24->_dateCache, v50);
    objc_storeStrong((id *)&v24->_chartDataCacheController, a9);
    objc_storeStrong((id *)&v24->_selectedTimeScopeController, a10);
    objc_storeWeak((id *)&v24->_currentValueViewHandler, v24);
    uint64_t v27 = +[HKDisplayTypeController sharedInstanceForHealthStore:v20];
    displayTypeController = v24->_displayTypeController;
    v24->_displayTypeController = (HKDisplayTypeController *)v27;

    objc_storeStrong((id *)&v24->_sampleTypeDateRangeController, a11);
    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v24->_observers;
    v24->_observers = v29;

    v31 = objc_alloc_init(HKGraphSeriesConfigurationManager);
    v63[0] = v31;
    uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
    allGraphSeriesConfigurationManagers = v24->_allGraphSeriesConfigurationManagers;
    v24->_allGraphSeriesConfigurationManagers = (NSArray *)v32;

    uint64_t v34 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
    majorSelectedPointFont = v24->_majorSelectedPointFont;
    v24->_majorSelectedPointFont = (UIFont *)v34;

    uint64_t v36 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09D0]];
    minorSelectedPointFont = v24->_minorSelectedPointFont;
    v24->_minorSelectedPointFont = (UIFont *)v36;

    timeScopeRanges = v24->_timeScopeRanges;
    v24->_timeScopeRanges = 0;

    id chartHasDataCompletion = v24->_chartHasDataCompletion;
    v24->_id chartHasDataCompletion = 0;

    v24->_lastDateValueRangeUpdate = 0.0;
    objc_storeStrong(&v24->_initialXValue, a12);
    v24->_firstSampleDateRangeUpdate = 1;
    v24->_delayedAutoscaleRequestCount = 0;
    v24->_delayedAutoscaleActualCount = 0;
    v40 = v21;
    if (!v21)
    {
      v40 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    }
    objc_storeStrong((id *)&v24->_currentCalendar, v40);
    if (!v21) {

    }
    if (v61) {
      int64_t v41 = (int)[v61 intValue];
    }
    else {
      int64_t v41 = 0;
    }
    v24->_primaryDisplayTypeStackIndex = v41;
    +[HKInteractiveChartViewController _validateStackedHeights:](HKInteractiveChartViewController, "_validateStackedHeights:", v60, a6);
    objc_storeStrong((id *)&v24->_stackedDisplayTypeHeights, v51);
    [(HKInteractiveChartViewController *)v24 setDisplayTypeStack:v52];
    if ([(HKInteractiveChartViewController *)v24 _chartHasDateAxis])
    {
      v42 = [(HKInteractiveChartViewController *)v24 sampleTypeDateRangeController];
      [v42 addObserver:v24];
    }
    v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v43 addObserver:v24 selector:sel__unitPreferencesDidUpdate_ name:@"HKUnitPreferenceControllerUnitPreferencesDidChangeNotification" object:0];

    [(HKInteractiveChartViewController *)v24 _setVisibleDisplayTypes:v52];
    [(HKInteractiveChartViewController *)v24 _createAndPrepareFeedbackGenerator];
    v44 = [HKSelectedRangeFormatter alloc];
    v45 = [(HKInteractiveChartViewController *)v24 unitPreferenceController];
    v46 = [(HKSelectedRangeFormatter *)v44 initWithUnitPreferenceController:v45];
    [(HKInteractiveChartViewController *)v24 setSelectedRangeFormatter:v46];

    v24->_disableCurrentValueViewForInitialLollipop = 0;
    v24->_hasInitialDateRangeAndTimeScope = 1;
    objc_storeStrong((id *)&v24->_timeScopeRanges, a15);
    v24->_annotationDataSourceFirstWeekday = -1;
    v47 = [[_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager alloc] initWithHealthStore:v20];
    analyticsManager = v24->_analyticsManager;
    v24->_analyticsManager = v47;
  }
  return v24;
}

- (HKInteractiveChartViewController)initWithDisplayTypes:(id)a3 healthStore:(id)a4 unitPreferenceController:(id)a5 dateCache:(id)a6 chartDataCacheController:(id)a7 selectedTimeScopeController:(id)a8 sampleTypeDateRangeController:(id)a9 initialXValue:(id)a10 currentCalendarOverride:(id)a11 options:(unint64_t)a12
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v32[0] = a3;
  v30 = (void *)MEMORY[0x1E4F1C978];
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  uint64_t v27 = [v30 arrayWithObjects:v32 count:1];

  v28 = [(HKInteractiveChartViewController *)self initWithStackedDisplayTypes:v27 primaryDisplayTypeStackIndex:0 stackedDisplayTypeHeights:0 healthStore:v25 unitPreferenceController:v24 dateCache:v23 chartDataCacheController:v22 selectedTimeScopeController:v21 sampleTypeDateRangeController:v20 initialXValue:v19 currentCalendarOverride:v18 options:a12 timeScopeRanges:0];
  return v28;
}

- (void)setStackedDisplayTypeHeights:(id)a3
{
  v4 = (NSArray *)a3;
  +[HKInteractiveChartViewController _validateStackedHeights:v4];
  stackedDisplayTypeHeights = self->_stackedDisplayTypeHeights;
  self->_stackedDisplayTypeHeights = v4;
}

+ (void)_validateStackedHeights:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v14;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![v10 kind])
        {
          [v10 heightValue];
          double v8 = v8 + v11;
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
    if (v6 >= 1 && fabs(v8 + -1.0) >= 0.000001)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        +[HKInteractiveChartViewController _validateStackedHeights:](v12, v8);
      }
    }
  }
}

- (void)interactiveChartHasData:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if (![(HKInteractiveChartViewController *)self chartDataIsAvailable])
  {
    uint64_t v5 = [(HKInteractiveChartViewController *)self chartHasDataCompletion];

    if (!v5)
    {
      [(HKInteractiveChartViewController *)self setChartHasDataCompletion:v4];
      goto LABEL_6;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      -[HKInteractiveChartViewController interactiveChartHasData:]();
    }
  }
  v4[2](v4);
LABEL_6:
}

- (BOOL)chartDataIsAvailable
{
  v2 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  id v3 = [v2 graphView];

  if (v3) {
    char v4 = [v3 allSeriesHaveDataAvailable];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)supportedTimeScopes
{
  unint64_t options = self->_options;
  id v3 = [(HKInteractiveChartViewController *)self timeScopeRanges];
  char v4 = +[HKInteractiveChartViewController _timeScopesWithOptions:options timeScopeRanges:v3];

  return v4;
}

- (id)currentValueViewAsString
{
  [(HKInteractiveChartViewController *)self updateCurrentValueViewWithVisibleRange];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v4 = [(HKInteractiveChartViewController *)self dataSourceForCurrentValueViewString];
  uint64_t v5 = v4;
  if (self->_currentValueView) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    [v3 addObject:@"Unable to determine current value view content"];
  }
  else
  {
    uint64_t v7 = [v4 dateViewWithOrientation:0];
    double v8 = [(HKInteractiveChartViewController *)self _valueViewToString:v7];
    [v3 addObject:v8];

    uint64_t v9 = [v5 numberOfValuesForAnnotationView:self->_currentValueView];
    if (v9 < 1)
    {
      [v3 addObject:@"No Data"];
    }
    else
    {
      uint64_t v10 = v9;
      for (uint64_t i = 0; i != v10; ++i)
      {
        v12 = [v5 valueViewForColumnAtIndex:i orientation:1];
        long long v13 = [(HKInteractiveChartViewController *)self _valueViewToString:v12];
        [v3 addObject:v13];
      }
    }
  }
  long long v14 = [(HKInteractiveChartViewController *)self _assembleValueViewString:v3];

  return v14;
}

- (id)_valueViewToString:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 text];
    BOOL v6 = (void *)v5;
    uint64_t v7 = @"NilLabelText";
    if (v5) {
      uint64_t v7 = (__CFString *)v5;
    }
    double v8 = v7;
  }
  else
  {
    BOOL v6 = [v4 subviews];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__HKInteractiveChartViewController__valueViewToString___block_invoke;
    v11[3] = &unk_1E6D54E48;
    v11[4] = self;
    uint64_t v9 = objc_msgSend(v6, "hk_map:", v11);
    double v8 = [(HKInteractiveChartViewController *)self _assembleValueViewString:v9];
  }
  return v8;
}

uint64_t __55__HKInteractiveChartViewController__valueViewToString___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _valueViewToString:a2];
}

- (id)_assembleValueViewString:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = NSString;
    uint64_t v5 = [v3 componentsJoinedByString:@"|"];
    BOOL v6 = [v4 stringWithFormat:@"(%@)", v5];
  }
  else
  {
    BOOL v6 = @"None";
  }

  return v6;
}

- (id)accessibilityDataForChart
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v4 = [(HKTimeScopeControl *)self->_radioButtons selectedTimeScope];
  uint64_t v5 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  BOOL v6 = [v5 graphView];
  uint64_t v7 = [(HKInteractiveChartViewController *)self trendAccessibilityDelegate];
  double v8 = [v7 trendAccessibilitySeries];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [(HKInteractiveChartViewController *)self descriptionSeriesForGraphView:v6];
  }
  uint64_t v10 = v9;
  uint64_t v11 = objc_msgSend(v9, "resolutionForTimeScope:traitResolution:", v4, objc_msgSend(v6, "resolutionFromTraitCollectionAttributes"));
  v12 = (void *)MEMORY[0x1E4F1CC08];
  if (v5 && v10)
  {
    uint64_t v13 = v11;
    [v6 hardLeftMarginWidth];
    uint64_t v15 = v14;
    v12 = [(HKInteractiveChartViewController *)self descriptionSpansForGraphView:v6 timeScope:v4];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__HKInteractiveChartViewController_accessibilityDataForChart__block_invoke;
    v19[3] = &unk_1E6D54E70;
    v19[4] = self;
    int64_t v23 = v4;
    uint64_t v24 = v13;
    id v20 = v6;
    id v21 = v8;
    uint64_t v25 = v15;
    id v22 = v3;
    [v20 enumerateVisibleCoordinatesForSeries:v10 block:v19];
  }
  if (v8)
  {
    long long v16 = [[HKAccessibilityData alloc] initWithPointData:v3 accessibilitySpans:v12];
  }
  else
  {
    v17 = [(HKInteractiveChartViewController *)self addNoDataEntries:v3 timeScope:v4 targetSeries:v10];
    long long v16 = [[HKAccessibilityData alloc] initWithPointData:v17 accessibilitySpans:v12];
  }
  return v16;
}

void __61__HKInteractiveChartViewController_accessibilityDataForChart__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v24 = a2;
  id v5 = a3;
  BOOL v6 = [v24 userInfo];
  if (v6 && [(id)objc_opt_class() conformsToProtocol:&unk_1F3C3E850])
  {
    id v7 = v6;
    double v8 = [*(id *)(a1 + 32) descriptionForChartData:v7 timeScope:*(void *)(a1 + 64)];
    id v9 = v8;
    if (v8 && [v8 count])
    {
      uint64_t v10 = *(void **)(a1 + 32);
      [v24 startXValue];
      double v12 = v11;
      [v24 endXValue];
      uint64_t v14 = [v10 descriptionForStartX:v7 endX:*(void *)(a1 + 64) chartData:*(void *)(a1 + 72) timeScope:*(void *)(a1 + 40) resolution:v12 graphView:v13];
      if (*(void *)(a1 + 48))
      {
        uint64_t v15 = *(void **)(a1 + 32);
        [v24 startXValue];
        double v17 = v16;
        [v24 endXValue];
        uint64_t v19 = [v15 _trendCoordinateDescriptionForStartX:*(void *)(a1 + 64) endX:*(void *)(a1 + 40) timeScope:v17 graphView:v18];

        uint64_t v14 = (void *)v19;
      }
      id v20 = *(void **)(a1 + 32);
      [v24 startXValue];
      id v21 = objc_msgSend(v20, "dateForXCoordinate:graphView:", *(void *)(a1 + 40));
      [v5 startXValue];
      int64_t v23 = [[HKAccessibilityPointData alloc] initWithHorizontalScreenCoordinate:v14 horizontalTimeCoordinate:v21 horizontalDate:v9 values:v22 + *(double *)(a1 + 80)];
      [*(id *)(a1 + 56) addObject:v23];
    }
  }
}

- (id)_trendCoordinateDescriptionForStartX:(double)a3 endX:(double)a4 timeScope:(int64_t)a5 graphView:(id)a6
{
  id v10 = a6;
  double v11 = [(HKInteractiveChartViewController *)self dateForXCoordinate:v10 graphView:a3];
  double v12 = [(HKInteractiveChartViewController *)self dateForXCoordinate:v10 graphView:a4];

  double v13 = +[HKValueRange valueRangeWithMinValue:v11 maxValue:v12];
  if (a5 == 3)
  {
    uint64_t v14 = [(HKInteractiveChartViewController *)self currentCalendar];
    uint64_t v15 = [v14 firstWeekday];

    double v16 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
    double v17 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithValueRange:", v13);
    double v18 = objc_msgSend(v16, "hk_weeksContainingInterval:firstWeekday:", v17, v15);

    uint64_t v19 = [v18 startDate];
    id v20 = [v18 endDate];
    uint64_t v21 = +[HKValueRange valueRangeWithMinValue:v19 maxValue:v20];

    double v13 = (void *)v21;
  }
  double v22 = [(HKInteractiveChartViewController *)self stringForValueRange:v13 timeScope:a5];
  int64_t v23 = [(HKInteractiveChartViewController *)self replaceRangeClause:v22];

  return v23;
}

- (id)addNoDataEntries:(id)a3 timeScope:(int64_t)a4 targetSeries:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v57 = self;
  uint64_t v10 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  double v11 = (void *)v10;
  if (v9 && v10)
  {
    id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v51 = v11;
    double v12 = [v11 graphView];
    double v13 = [v12 xAxis];
    uint64_t v47 = [v8 count];
    uint64_t v14 = [v12 effectiveVisibleRangeActive];
    uint64_t v15 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:a4];
    double v16 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
    double v17 = [v14 startDate];
    double v18 = [v13 transform];
    [v18 coordinateForValue:v17];
    double v20 = v19;

    id v50 = v13;
    [v13 pointTransform];
    double v23 = HKLinearTransformValue(v21, v22, v20);
    id v52 = v9;
    uint64_t v24 = objc_msgSend(v9, "resolutionForTimeScope:traitResolution:", a4, objc_msgSend(v12, "resolutionFromTraitCollectionAttributes"));
    v49 = v15;
    uint64_t v25 = [v15 seriesPointIntervalComponentsAtResolution:v24];
    v48 = [v16 dateByAddingComponents:v25 toDate:v17 options:0];
    id v26 = HKDateMidpoint(v17, v48);
    id v56 = v14;
    uint64_t v27 = [v14 endDate];
    LODWORD(v15) = objc_msgSend(v26, "hk_isBeforeOrEqualToDate:", v27);

    v53 = v8;
    if (v15)
    {
      uint64_t v55 = v24;
      uint64_t v28 = 0;
      while (1)
      {
        if (v28 < v47)
        {
          v29 = [v53 objectAtIndexedSubscript:v28];
          v30 = [(HKAccessibilityPointData *)v29 horizontalDate];
          if ([(HKInteractiveChartViewController *)v57 _date:v26 closeToDate:v30 epsilonDateComponents:v25 calendar:v16])
          {
            ++v28;

            if (v29) {
              goto LABEL_11;
            }
          }
          else
          {
          }
        }
        v31 = [v12 xAxis];
        uint64_t v32 = [v31 transform];
        [v32 coordinateForValue:v26];
        double v34 = v33;

        [v31 pointTransform];
        double v37 = HKLinearTransformValue(v35, v36, v34) - v23;
        [v12 hardLeftMarginWidth];
        double v39 = v37 + v38;
        [(HKInteractiveChartViewController *)v57 descriptionForStartX:0 endX:a4 chartData:v55 timeScope:v12 resolution:v34 graphView:v34];
        int64_t v41 = v40 = a4;
        v29 = [[HKAccessibilityPointData alloc] initWithHorizontalScreenCoordinate:v41 horizontalTimeCoordinate:v26 horizontalDate:0 values:v39];

        a4 = v40;
        if (v29)
        {
LABEL_11:
          [v54 addObject:v29];
        }
        v42 = [v16 dateByAddingComponents:v25 toDate:v26 options:0];

        v43 = [v56 endDate];
        char v44 = objc_msgSend(v42, "hk_isBeforeOrEqualToDate:", v43);

        id v26 = v42;
        if ((v44 & 1) == 0) {
          goto LABEL_16;
        }
      }
    }
    v42 = v26;
LABEL_16:

    id v9 = v52;
    id v8 = v53;
    double v11 = v51;
    id v45 = v54;
  }
  else
  {
    id v45 = v8;
  }

  return v45;
}

- (BOOL)_date:(id)a3 closeToDate:(id)a4 epsilonDateComponents:(id)a5 calendar:(id)a6
{
  id v9 = a4;
  id v10 = a3;
  double v11 = [a6 dateByAddingComponents:a5 toDate:v10 options:0];
  [v11 timeIntervalSinceDate:v10];
  double v13 = v12 * 0.5;
  [v9 timeIntervalSinceDate:v10];
  double v15 = v14;

  return fabs(v15) < v13;
}

- (id)descriptionSeriesForGraphView:(id)a3
{
  return (id)[a3 primarySeries];
}

- (id)descriptionSpansForGraphView:(id)a3 timeScope:(int64_t)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = -[HKInteractiveChartViewController descriptionSeriesForGraphView:](self, "descriptionSeriesForGraphView:", a3, a4);
  BOOL v6 = [v5 visibleValueRange];
  id v7 = [v6 minValue];
  id v8 = [(HKInteractiveChartViewController *)self _rangeValueAsNumber:v7];

  id v9 = [v6 maxValue];
  id v10 = [(HKInteractiveChartViewController *)self _rangeValueAsNumber:v9];

  NSClassFromString(&cfstr_Hkbarseries.isa);
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  double v12 = [(HKInteractiveChartViewController *)self _displayTypeForSeries:v5];
  double v13 = [(HKInteractiveChartViewController *)self _displayNameForDisplayType:v12];
  double v14 = [(HKInteractiveChartViewController *)self unitPreferenceController];
  double v15 = [v14 localizedDisplayNameForDisplayType:v12];

  double v16 = [[HKAccessibilitySpan alloc] initWithTitle:v13 seriesType:v11 dataComprehensionMinYValue:v8 dataComprehensionMaxYValue:v10 dataComprehensionUnitForChart:v15];
  double v19 = v13;
  v20[0] = v16;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

  return v17;
}

- (id)_rangeValueAsNumber:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = v3;
  }
  else {
    int64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)descriptionForStartX:(double)a3 endX:(double)a4 chartData:(id)a5 timeScope:(int64_t)a6 resolution:(int64_t)a7 graphView:(id)a8
{
  id v11 = a8;
  double v12 = [(HKInteractiveChartViewController *)self dateForXCoordinate:v11 graphView:a3];
  if (v12)
  {
    double v13 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
    double v14 = [v13 components:126 fromDate:v12];

    double v15 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
    double v16 = HKCombinedStringForAnnotationDateWithTimeScope((uint64_t)v14, v15, [(HKTimeScopeControl *)self->_radioButtons selectedTimeScope], a7);
    double v17 = [(HKInteractiveChartViewController *)self replaceRangeClause:v16];
  }
  else
  {
    uint64_t v18 = [(HKInteractiveChartViewController *)self _numberForXCoordinate:v11 graphView:a3];
    double v14 = (void *)v18;
    double v19 = &stru_1F3B9CF20;
    if (v18) {
      double v19 = (__CFString *)v18;
    }
    double v17 = v19;
  }

  return v17;
}

- (id)dateForXCoordinate:(double)a3 graphView:(id)a4
{
  id v5 = [a4 xAxis];
  BOOL v6 = [v5 transform];
  id v7 = [v6 valueForCoordinate:a3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)_numberForXCoordinate:(double)a3 graphView:(id)a4
{
  id v5 = [a4 xAxis];
  BOOL v6 = [v5 transform];
  id v7 = [v6 valueForCoordinate:a3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v8 setNumberStyle:1];
    [v8 setUsesSignificantDigits:1];
    id v9 = [v8 stringFromNumber:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)replaceRangeClause:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"–"];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v3;
  }
  else
  {
    uint64_t v7 = v4;
    uint64_t v8 = v5;
    id v9 = objc_msgSend(v3, "substringWithRange:", 0, v4);
    id v10 = objc_msgSend(v3, "substringWithRange:", v7 + v8, objc_msgSend(v3, "length") - (v7 + v8));
    id v11 = NSString;
    double v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    double v13 = [v12 localizedStringForKey:@"RANGE_CLAUSE_%@_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    objc_msgSend(v11, "stringWithFormat:", v13, v9, v10);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)descriptionForChartData:(id)a3 timeScope:(int64_t)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  if (v7)
  {
    double v39 = v7;
    uint64_t v8 = [v7 graphView];
    double v37 = [(HKInteractiveChartViewController *)self descriptionSeriesForGraphView:v8];
    id v9 = -[HKInteractiveChartViewController _displayTypeForSeries:](self, "_displayTypeForSeries:");
    id v10 = objc_msgSend(v9, "hk_interactiveChartsFormatterForTimeScope:", -[HKTimeScopeControl selectedTimeScope](self->_radioButtons, "selectedTimeScope"));
    id v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartLollipopValueFont");
    [v10 setMajorFont:v11];

    double v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartLollipopKeyFont");
    [v10 setMinorFont:v12];

    [v10 setDisplayType:v9];
    double v13 = [(HKInteractiveChartViewController *)self unitPreferenceController];
    [v10 setUnitController:v13];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v14 = [v9 objectType];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v16 = v10;
        double v17 = [v9 objectType];
        [v16 configureFormatterForDisplayType:v9 quantityType:v17 chartRangeProvider:v8 timeScope:a4 context:0];
      }
    }
    double v38 = (void *)v8;
    id v40 = v6;
    v53[0] = v6;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
    double v36 = v10;
    double v19 = [v10 formattedSelectedRangeLabelDataWithChartData:v18 context:0];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v19;
    uint64_t v45 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v45)
    {
      uint64_t v42 = *(void *)v49;
      v43 = v9;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v49 != v42) {
            objc_enumerationMutation(obj);
          }
          double v21 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v22 = [MEMORY[0x1E4FB1618] labelColor];
          uint64_t v23 = +[HKSelectedRangeLabel standardPrefixColorForSelectedRangeData:v21 defaultColor:v22];
          uint64_t v24 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
          uint64_t v25 = +[HKSelectedRangeLabel attributedStringForSelectedRangeData:v21 font:v24 foregroundColor:v22 prefixColor:v23 prefersImageAffixes:0 embedded:0];

          id v26 = [(HKInteractiveChartViewController *)self _displayNameForDisplayType:v9];
          v46 = (void *)v23;
          uint64_t v47 = (void *)v22;
          if (v25)
          {
            uint64_t v27 = [v25 string];
          }
          else
          {
            uint64_t v27 = &stru_1F3B9CF20;
          }
          uint64_t v28 = [HKAccessibilityValue alloc];
          v29 = [v21 attributedString];
          v30 = [v29 string];
          [(HKInteractiveChartViewController *)self replaceRangeClause:v30];
          uint64_t v32 = v31 = self;
          double v33 = [v21 valueAsNumber];
          double v34 = [(HKAccessibilityValue *)v28 initWithValueTitle:v26 valueType:v27 valueDescription:v32 valueAsNumber:v33];

          self = v31;
          [v44 addObject:v34];

          id v9 = v43;
        }
        uint64_t v45 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v45);
    }

    uint64_t v7 = v39;
    id v6 = v40;
  }

  return v44;
}

- (void)addChartViewObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_64];
  [(NSMutableArray *)self->_observers filterUsingPredicate:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v6);
      }
      objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "observer", (void)v12);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    id v6 = [[_HKInteractiveChartWeakObserverWrapper alloc] initWithObserver:v4];
    [(NSMutableArray *)self->_observers addObject:v6];
  }
}

BOOL __57__HKInteractiveChartViewController_addChartViewObserver___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 observer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)removeChartViewObserver:(id)a3
{
  id v7 = a3;
  if ([(NSMutableArray *)self->_observers count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = [(NSMutableArray *)self->_observers objectAtIndexedSubscript:v4];
      id v6 = [v5 observer];

      if (v6 == v7) {
        break;
      }

      if (++v4 >= (unint64_t)[(NSMutableArray *)self->_observers count]) {
        goto LABEL_7;
      }
    }
    [(NSMutableArray *)self->_observers removeObjectAtIndex:v4];
  }
LABEL_7:
}

- (void)replaceCurrentDisplayTypesWithTypes:(id)a3 stackOffset:(int64_t)a4 resetDateRange:(BOOL)a5 automaticAutoScale:(BOOL)a6
{
  BOOL v26 = a5;
  BOOL v27 = a6;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(NSArray *)self->_allGraphSeriesConfigurationManagers objectAtIndexedSubscript:a4];
  uint64_t v10 = [(HKInteractiveChartViewController *)self primaryGraphSeriesForTimeScope:[(HKInteractiveChartViewController *)self _dateZoom]];
  uint64_t v28 = [v10 visibleValueRange];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = [v9 allDisplayTypes];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        [v9 removeConfigurationsForDisplayType:*(void *)(*((void *)&v36 + 1) + 8 * i)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v13);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v40 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        uint64_t v21 = v40;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
        [(HKInteractiveChartViewController *)self _addDisplayTypeToConfiguration:v21 allDisplayTypes:v22 configurationManager:v9];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v18);
  }

  [(HKInteractiveChartViewController *)self _updateAfterConfigurationChangeIncludeDateAxis:v26];
  if (v27)
  {
    uint64_t v23 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __118__HKInteractiveChartViewController_replaceCurrentDisplayTypesWithTypes_stackOffset_resetDateRange_automaticAutoScale___block_invoke;
    v29[3] = &unk_1E6D51318;
    v29[4] = self;
    id v30 = v23;
    id v31 = v28;
    id v24 = v23;
    [v24 autoscaleYAxesAnimated:1 specificRange:0 onlyIfNeeded:0 completion:v29];
  }
  uint64_t v25 = [(HKInteractiveChartViewController *)self lollipopController];
  [v25 setInvisibleAnimated:1];

  [(HKInteractiveChartViewController *)self _setSelectedGraphSeries:0 animated:1];
}

void __118__HKInteractiveChartViewController_replaceCurrentDisplayTypesWithTypes_stackOffset_resetDateRange_automaticAutoScale___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateCurrentValueViewWithVisibleRange];
  objc_msgSend(*(id *)(a1 + 32), "primaryGraphSeriesForTimeScope:", objc_msgSend(*(id *)(a1 + 32), "_dateZoom"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v3 visibleValueRange];

  if (!v2) {
    [*(id *)(a1 + 40) autoscaleYAxesAnimated:0 specificRange:*(void *)(a1 + 48) onlyIfNeeded:0 completion:0];
  }
}

- (void)addOverlayDisplayType:(id)a3 stackOffset:(int64_t)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  allGraphSeriesConfigurationManagers = self->_allGraphSeriesConfigurationManagers;
  id v7 = a3;
  id v8 = [(NSArray *)allGraphSeriesConfigurationManagers objectAtIndexedSubscript:a4];
  v10[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(HKInteractiveChartViewController *)self _addDisplayTypeToConfiguration:v7 allDisplayTypes:v9 configurationManager:v8];

  [(HKInteractiveChartViewController *)self _updateAfterConfigurationChangeIncludeDateAxis:0];
  [(HKInteractiveChartViewController *)self updateCurrentValueViewWithVisibleRange];
  [(HKInteractiveChartViewController *)self _automaticAutoScale];
}

- (void)removeOverlayDisplayType:(id)a3 stackOffset:(int64_t)a4
{
}

- (void)removeOverlayDisplayType:(id)a3 stackOffset:(int64_t)a4 automaticAutoscale:(BOOL)a5
{
  BOOL v5 = a5;
  allGraphSeriesConfigurationManagers = self->_allGraphSeriesConfigurationManagers;
  id v9 = a3;
  id v10 = [(NSArray *)allGraphSeriesConfigurationManagers objectAtIndexedSubscript:a4];
  [v10 removeConfigurationsForDisplayType:v9];

  [(HKInteractiveChartViewController *)self _updateAfterConfigurationChangeIncludeDateAxis:0];
  [(HKInteractiveChartViewController *)self updateCurrentValueViewWithVisibleRange];
  if (v5) {
    [(HKInteractiveChartViewController *)self _automaticAutoScale];
  }
}

- (id)currentDisplayTypesForStackOffset:(int64_t)a3
{
  id v3 = [(NSArray *)self->_allGraphSeriesConfigurationManagers objectAtIndexedSubscript:a3];
  uint64_t v4 = [v3 allDisplayTypes];

  return v4;
}

- (id)graphSeriesForDisplayType:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  allGraphSeriesConfigurationManagers = self->_allGraphSeriesConfigurationManagers;
  id v8 = a3;
  id v9 = [(NSArray *)allGraphSeriesConfigurationManagers objectAtIndexedSubscript:a5];
  id v10 = [v9 configurationForDisplayType:v8 zoom:a4];

  id v11 = [v10 graphSeries];

  return v11;
}

- (id)primaryGraphSeriesForTimeScope:(int64_t)a3
{
  BOOL v5 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
  id v6 = [(HKInteractiveChartViewController *)self graphSeriesForDisplayType:v5 timeScope:a3 stackOffset:[(HKInteractiveChartViewController *)self primaryDisplayTypeStackIndex]];

  return v6;
}

- (void)setDetailView:(id)a3
{
  id v4 = a3;
  id v5 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  [v5 setDetailView:v4];
}

- (int64_t)stackOffsetCount
{
  return [(NSArray *)self->_allGraphSeriesConfigurationManagers count];
}

- (double)minimumHeightForChart
{
  return 420.0;
}

- (double)minimumHeightForWidth:(double)a3 chartWidthToHeightRatio:(double)a4
{
  return a3 / a4 + 122.0;
}

- (double)heightForChartHeight:(double)a3
{
  return a3 + 122.0;
}

- (BOOL)_chartHasDateAxis
{
  return (self->_options & 2) == 0;
}

- (BOOL)_selectedDateRangeLabelEnabled
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)_headerLineEnabled
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (BOOL)_timeScopeEnabled
{
  return (self->_options & 0x20) == 0;
}

- (BOOL)_currentValueEnabled
{
  return (self->_options & 0x40) == 0;
}

- (double)dateSelectorHeight
{
  return 36.0;
}

- (BOOL)_tilingDisabled
{
  return (BYTE1(self->_options) >> 3) & 1;
}

- (BOOL)_prefersOpaqueLegends
{
  return BYTE2(self->_options) & 1;
}

- (BOOL)_drawsGridlinesPerSeriesGroup
{
  return (self->_options & 0x40000) == 0;
}

- (void)dealloc
{
  id v3 = [(HKInteractiveChartViewController *)self sampleTypeDateRangeController];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartViewController;
  [(HKInteractiveChartViewController *)&v5 dealloc];
}

- (void)loadView
{
  objc_super v5 = -[HKMinimumSizeView initWithFrame:]([HKMinimumSizeView alloc], "initWithFrame:", 0.0, 0.0, 320.0, 100.0);
  [(HKInteractiveChartViewController *)self minimumHeightForChart];
  -[HKMinimumSizeView setMinimumHeight:](v5, "setMinimumHeight:");
  id v3 = objc_msgSend(NSString, "hk_chartAccessibilityIdentifier:", @"Top");
  [(HKMinimumSizeView *)v5 setAccessibilityIdentifier:v3];

  [(HKInteractiveChartViewController *)self setView:v5];
  id v4 = [(HKInteractiveChartViewController *)self view];
  [v4 setPreservesSuperviewLayoutMargins:1];
}

- (double)_effectiveHorizontalMargin
{
  if ([(HKInteractiveChartViewController *)self _applyHorizontalMarginsToEntireView])
  {
    id v3 = [(HKInteractiveChartViewController *)self view];
    [v3 frame];
    int64_t v5 = +[HKWidthDesignationProvider widthDesignationFromViewWidth:v4];

    +[HKCollectionViewLayoutEngineDefaults edgeInsetsForWidthDesignation:v5];
    return v6;
  }
  else
  {
    id v8 = [(HKInteractiveChartViewController *)self view];
    [v8 layoutMargins];
    double v10 = v9;

    double result = v10 + -4.0;
    if (v10 <= 16.0) {
      return 12.0;
    }
  }
  return result;
}

- (BOOL)_applyHorizontalMarginsToEntireView
{
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v3 = [v2 isiPad];

  return v3;
}

- (void)viewWillLayoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)HKInteractiveChartViewController;
  [(HKInteractiveChartViewController *)&v45 viewWillLayoutSubviews];
  [(HKInteractiveChartViewController *)self _effectiveHorizontalMargin];
  double v4 = v3;
  int64_t v5 = [(HKInteractiveChartViewController *)self view];
  [v5 bounds];
  double Width = CGRectGetWidth(v46);

  id v7 = [(HKInteractiveChartViewController *)self view];
  [v7 bounds];
  double Height = CGRectGetHeight(v47);

  if ([(HKInteractiveChartViewController *)self _headerLineEnabled]) {
    [(HKInteractiveChartViewController *)self _layoutHeader];
  }
  else {
    [(HKInteractiveChartViewController *)self _omitLayoutHeader];
  }
  BOOL v9 = [(HKInteractiveChartViewController *)self _timeScopeEnabled];
  BOOL v10 = [(HKInteractiveChartViewController *)self _applyHorizontalMarginsToEntireView];
  double v11 = 0.0;
  if (v9) {
    double v12 = 42.0;
  }
  else {
    double v12 = 0.0;
  }
  BOOL v13 = [(HKInteractiveChartViewController *)self _currentValueEnabled];
  if (objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHas4InchScreen"))
  {
    *(double *)&uint64_t v14 = 76.0;
LABEL_14:
    double v16 = *(double *)&v14;
    goto LABEL_15;
  }
  if (!objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHas4Point7InchScreen"))
  {
    *(double *)&uint64_t v14 = 80.0;
    goto LABEL_14;
  }
  int v15 = objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHasDisplayZoomedEnabled");
  double v16 = 80.0;
  if (v15) {
    double v16 = 76.0;
  }
LABEL_15:
  double v43 = v16;
  if (!v13) {
    double v16 = 0.0;
  }
  double v17 = v16 + v12 + self->_bannerBottom;
  double v18 = v17;
  if (!v13)
  {
    [(HKInteractiveChartViewController *)self dateSelectorHeight];
    double v11 = v19;
    double v18 = v12 + self->_bannerBottom;
  }
  double v44 = v18;
  double v20 = Height - (v17 + v11);
  uint64_t v21 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  uint64_t v22 = [v21 graphView];
  [v22 leftMarginViewRect];
  double v24 = v23;

  double v25 = v4 - v24;
  if (v10) {
    double v26 = Width + v24 + v4 * -2.0;
  }
  else {
    double v26 = Width;
  }
  if (!v10) {
    double v25 = 0.0;
  }
  double v42 = v25;
  -[UIView setFrame:](self->_primaryGraphViewWrapper, "setFrame:");
  BOOL v27 = [(HKGraphViewController *)self->_primaryGraphViewController view];
  objc_msgSend(v27, "setFrame:", 0.0, 0.0, v26, v20);

  radioButtons = self->_radioButtons;
  if (v9)
  {
    double v41 = v12;
    [(HKTimeScopeControl *)radioButtons minimumWidth];
    double v30 = fmax(v29, 550.0);
    [(HKTimeScopeControl *)self->_radioButtons frame];
    double v31 = Width + v4 * -2.0;
    if (Width <= v30) {
      double v32 = v4;
    }
    else {
      double v32 = (Width - v30) * 0.5;
    }
    if (Width <= v30) {
      double v33 = Width + v4 * -2.0;
    }
    else {
      double v33 = v30;
    }
    double bannerBottom = self->_bannerBottom;
    [(HKTimeScopeControl *)self->_radioButtons frame];
    v49.origin.x = v35;
    v49.origin.y = v36;
    v49.size.width = v37;
    v49.size.height = v38;
    v48.origin.x = v32;
    v48.origin.y = bannerBottom;
    v48.size.width = v33;
    v48.size.height = 42.0;
    if (!CGRectEqualToRect(v48, v49)) {
      -[HKTimeScopeControl setFrame:](self->_radioButtons, "setFrame:", v32, bannerBottom, v33, 42.0);
    }
    double v12 = v41;
  }
  else
  {
    [(HKTimeScopeControl *)radioButtons setHidden:1];
    double v31 = Width + v4 * -2.0;
  }
  [(HKInteractiveChartViewController *)self dateSelectorHeight];
  -[HKCurrentTimeView setFrame:](self->_currentTimeView, "setFrame:", v4, v44, v31, v39);
  if (v13)
  {
    [(HKCurrentTimeView *)self->_currentTimeView removeFromSuperview];
    [(UIView *)self->_currentValueView setHidden:0];
    if (v10) {
      double v40 = v31 + v24;
    }
    else {
      double v40 = Width;
    }
    -[UIView setFrame:](self->_currentValueView, "setFrame:", v42, v12 + self->_bannerBottom, v40, v43);
  }
  else
  {
    [(UIView *)self->_currentValueView setHidden:1];
  }
  [(HKInteractiveChartViewController *)self _layoutDividerViews];
  [(HKInteractiveChartViewController *)self _layoutDashboardEmptyLabelsIfNecessary];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  double v3 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  double v4 = [v3 graphView];
  [v4 resetAndRedraw];

  [(HKInteractiveChartViewController *)self updateCurrentValueViewWithVisibleRange];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKInteractiveChartViewController;
  id v4 = a3;
  [(HKInteractiveChartViewController *)&v10 traitCollectionDidChange:v4];
  int64_t v5 = [(HKInteractiveChartViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v8 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
    BOOL v9 = [v8 graphView];
    [v9 resetAndRedraw];

    [(HKInteractiveChartViewController *)self updateCurrentValueViewWithVisibleRange];
  }
}

- (double)_annotationViewCenterY
{
  BOOL v3 = [(HKInteractiveChartViewController *)self _timeScopeEnabled];
  double v4 = 42.0;
  if (!v3) {
    double v4 = 0.0;
  }
  return v4 + self->_bannerBottom;
}

- (BOOL)_inPointSelectionMode
{
  return self->_displayState == 1;
}

- (void)_layoutHeader
{
  v57[2] = *MEMORY[0x1E4F143B8];
  [(HKInteractiveChartViewController *)self _effectiveHorizontalMargin];
  double v4 = v3;
  int64_t v5 = [(HKInteractiveChartViewController *)self view];
  [v5 bounds];
  double Width = CGRectGetWidth(v58);

  uint64_t v7 = [(HKInteractiveChartViewController *)self view];
  [v7 bounds];
  double v8 = CGRectGetWidth(v59);

  if ([MEMORY[0x1E4FB1EB0] userInterfaceLayoutDirectionForSemanticContentAttribute:0] == 1)
  {
    if ([(HKInteractiveChartViewController *)self _selectedDateRangeLabelEnabled])
    {
      selectedSeriesUnitLabel = self->_selectedSeriesUnitLabel;
      v57[0] = self->_selectedPointDateLabel;
      v57[1] = selectedSeriesUnitLabel;
      objc_super v10 = (void *)MEMORY[0x1E4F1C978];
      double v11 = (UILabel **)v57;
      uint64_t v12 = 2;
    }
    else
    {
      id v56 = self->_selectedSeriesUnitLabel;
      objc_super v10 = (void *)MEMORY[0x1E4F1C978];
      double v11 = &v56;
      uint64_t v12 = 1;
    }
    BOOL v13 = [v10 arrayWithObjects:v11 count:v12];
    selectedSeriesLabel = self->_selectedSeriesLabel;
    int v15 = (void *)MEMORY[0x1E4F1C978];
    p_selectedSeriesLabel = &selectedSeriesLabel;
    goto LABEL_9;
  }
  id v54 = self->_selectedSeriesLabel;
  BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  if (![(HKInteractiveChartViewController *)self _selectedDateRangeLabelEnabled])
  {
    id v52 = self->_selectedSeriesUnitLabel;
    int v15 = (void *)MEMORY[0x1E4F1C978];
    p_selectedSeriesLabel = &v52;
LABEL_9:
    uint64_t v17 = 1;
    goto LABEL_10;
  }
  uint64_t v14 = self->_selectedSeriesUnitLabel;
  v53[0] = self->_selectedPointDateLabel;
  v53[1] = v14;
  int v15 = (void *)MEMORY[0x1E4F1C978];
  p_selectedSeriesLabel = (UILabel **)v53;
  uint64_t v17 = 2;
LABEL_10:
  double v18 = [v15 arrayWithObjects:p_selectedSeriesLabel count:v17];
  double v19 = Width - v4;
  double v20 = 32.0;
  do
  {
    double v21 = v20;
    if (v20 >= v8) {
      break;
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v22 = v13;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v47;
      double v26 = 0.0;
      double v27 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v47 != v25) {
            objc_enumerationMutation(v22);
          }
          double v29 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          [v29 sizeToFit];
          [v29 frame];
          objc_msgSend(v29, "setFrame:");
          [v29 sizeToFit];
          [v29 frame];
          if (v26 < v33) {
            double v26 = v33;
          }
          double v34 = v4 + CGRectGetWidth(*(CGRect *)&v30);
          if (v27 < v34) {
            double v27 = v34;
          }
          objc_msgSend(v29, "setFrame:", v4, 0.0, v34 - v4, v21);
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v24);
    }
    else
    {
      double v26 = 0.0;
      double v27 = 0.0;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v35 = v18;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v43 != v38) {
            objc_enumerationMutation(v35);
          }
          double v40 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          [v40 sizeToFit];
          [v40 frame];
          double v41 = v19 - CGRectGetWidth(v60);
          if (v27 >= v41) {
            double v41 = v27;
          }
          objc_msgSend(v40, "setFrame:", v41, 0.0, v19 - v41, v21);
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v37);
    }

    double v20 = v21 + 32.0;
  }
  while (v26 >= v21);
  self->_double bannerBottom = v21;
}

- (void)_omitLayoutHeader
{
  self->_double bannerBottom = 0.0;
}

- (void)_layoutDividerViews
{
  [(UIView *)self->_primaryGraphViewWrapper frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(HKInteractiveChartViewController *)self view];
  [v11 bounds];
  double Width = CGRectGetWidth(v17);

  double v13 = HKUIOnePixel();
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  CGRectGetMinY(v18);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  -[UIView setFrame:](self->_graphTopDividerView, "setFrame:", 0.0, CGRectGetMinY(v19), Width, v13);
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  -[UIView setFrame:](self->_graphBottomDividerView, "setFrame:", 0.0, CGRectGetMaxY(v20) + -25.0, Width, v13);
  uint64_t v14 = [(HKInteractiveChartViewController *)self view];
  [v14 bringSubviewToFront:self->_graphTopDividerView];

  id v15 = [(HKInteractiveChartViewController *)self view];
  [v15 bringSubviewToFront:self->_graphBottomDividerView];
}

- (void)_layoutDashboardEmptyLabelsIfNecessary
{
  if ([(HKInteractiveChartViewController *)self _dashboardEmptyLabelsExist])
  {
    [(UILabel *)self->_dashboardEmptyHeader sizeToFit];
    double v3 = [(HKInteractiveChartViewController *)self view];
    [v3 bounds];
    double Width = CGRectGetWidth(v17);
    [(HKInteractiveChartViewController *)self _effectiveHorizontalMargin];
    double v6 = Width + v5 * -2.0;

    -[UILabel setFrame:](self->_dashboardEmptyDescription, "setFrame:", 0.0, 0.0, fmin(v6, 380.0), 1.79769313e308);
    [(UILabel *)self->_dashboardEmptyDescription sizeToFit];
    [(UILabel *)self->_dashboardEmptyHeader frame];
    double Height = CGRectGetHeight(v18);
    [(UILabel *)self->_dashboardEmptyDescription frame];
    double v8 = CGRectGetHeight(v19);
    double v9 = Height + v8 + 12.0;
    [(UIView *)self->_graphTopDividerView frame];
    double MinY = CGRectGetMinY(v20);
    [(UIView *)self->_graphBottomDividerView frame];
    double v11 = (MinY + CGRectGetMaxY(v21)) * 0.5;
    uint64_t v12 = [(HKInteractiveChartViewController *)self view];
    [v12 bounds];
    double MidX = CGRectGetMidX(v22);

    -[UILabel setCenter:](self->_dashboardEmptyHeader, "setCenter:", MidX, Height * 0.5 + v11 - v9 * 0.5);
    -[UILabel setCenter:](self->_dashboardEmptyDescription, "setCenter:", MidX, v9 * 0.5 + v11 - v8 * 0.5);
    dashboardEmptyHeader = self->_dashboardEmptyHeader;
    [(UILabel *)dashboardEmptyHeader frame];
    CGRect v24 = CGRectIntegral(v23);
    -[UILabel setFrame:](dashboardEmptyHeader, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    dashboardEmptyDescription = self->_dashboardEmptyDescription;
    [(UILabel *)dashboardEmptyDescription frame];
    CGRect v26 = CGRectIntegral(v25);
    -[UILabel setFrame:](dashboardEmptyDescription, "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  }
}

+ (id)_timeScopesWithOptions:(unint64_t)a3 timeScopeRanges:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  if ((v4 & 0x80) != 0)
  {
    int v7 = [a1 _timeScope:7 inTimeScopeRanges:v6];
    if ((v4 & 0x400) != 0)
    {
LABEL_3:
      int v8 = 0;
      if ((v4 & 0x8000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v7 = 0;
    if ((v4 & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  int v8 = [a1 _timeScope:6 inTimeScopeRanges:v6];
  if ((v4 & 0x8000) != 0)
  {
LABEL_4:
    int v9 = 0;
    if ((v4 & 0x4000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  int v9 = [a1 _timeScope:5 inTimeScopeRanges:v6];
  if ((v4 & 0x4000) != 0)
  {
LABEL_5:
    int v10 = 0;
    if ((v4 & 0x200) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  int v10 = [a1 _timeScope:3 inTimeScopeRanges:v6];
  if ((v4 & 0x200) != 0)
  {
LABEL_6:
    int v11 = 0;
    if ((v4 & 0x100) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    int v12 = 0;
    if ((v4 & 0x200000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  int v11 = [a1 _timeScope:2 inTimeScopeRanges:v6];
  if ((v4 & 0x100) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  int v12 = [a1 _timeScope:1 inTimeScopeRanges:v6];
  if ((v4 & 0x200000) != 0)
  {
LABEL_8:
    int v13 = [a1 _timeScope:0 inTimeScopeRanges:v6];
    goto LABEL_16;
  }
LABEL_15:
  int v13 = 0;
LABEL_16:
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = v14;
  if (v7)
  {
    [v14 addObject:&unk_1F3C21FE8];
    if (!v8)
    {
LABEL_18:
      if (!v9) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if (!v8)
  {
    goto LABEL_18;
  }
  [v15 addObject:&unk_1F3C22000];
  if (v9) {
LABEL_19:
  }
    [v15 addObject:&unk_1F3C22018];
LABEL_20:
  [v15 addObject:&unk_1F3C22030];
  if (v10)
  {
    [v15 addObject:&unk_1F3C22048];
    if (!v11)
    {
LABEL_22:
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_33;
    }
  }
  else if (!v11)
  {
    goto LABEL_22;
  }
  [v15 addObject:&unk_1F3C22060];
  if (!v12)
  {
LABEL_23:
    if (!v13) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_33:
  [v15 addObject:&unk_1F3C22078];
  if (v13) {
LABEL_24:
  }
    [v15 addObject:&unk_1F3C22090];
LABEL_25:
  double v16 = (void *)[v15 copy];

  return v16;
}

+ (BOOL)_timeScope:(int64_t)a3 inTimeScopeRanges:(id)a4
{
  if (!a4) {
    return 1;
  }
  double v5 = NSNumber;
  id v6 = a4;
  int v7 = [v5 numberWithInteger:a3];
  int v8 = [v6 objectForKeyedSubscript:v7];

  BOOL v9 = v8 != 0;
  return v9;
}

+ (int64_t)_timeScopeForTimeScope:(int64_t)a3 availableTimeScopes:(id)a4
{
  id v7 = a4;
  if (![v7 count])
  {
    CGRect v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"HKInteractiveChartViewController.m", 1153, @"Invalid parameter not satisfying: %@", @"[availableTimeScopes count] > 0" object file lineNumber description];
  }
  int v8 = [NSNumber numberWithInteger:a3];
  char v9 = [v7 containsObject:v8];

  if ((v9 & 1) == 0)
  {
    int v10 = [v7 lastObject];
    int64_t v11 = [v10 integerValue];

    if ([v7 count] != 1)
    {
      int v12 = [v7 lastObject];
      int64_t v13 = [v12 integerValue];

      if (v13 <= a3)
      {
        id v14 = [v7 firstObject];
        int64_t v15 = [v14 integerValue];

        if (v15 < a3)
        {
          double v16 = [v7 firstObject];
          a3 = [v16 integerValue];

          goto LABEL_12;
        }
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __79__HKInteractiveChartViewController__timeScopeForTimeScope_availableTimeScopes___block_invoke;
        v21[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
        v21[4] = a3;
        CGRect v17 = objc_msgSend(v7, "hk_firstObjectPassingTest:", v21);
        CGRect v18 = v17;
        if (v17) {
          int64_t v11 = [v17 integerValue];
        }
      }
    }
    a3 = v11;
  }
LABEL_12:

  return a3;
}

BOOL __79__HKInteractiveChartViewController__timeScopeForTimeScope_availableTimeScopes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 integerValue] < *(void *)(a1 + 32);
}

- (int64_t)_defaultTimeScopeWithAvailableTimeScopes:(id)a3
{
  id v4 = a3;
  double v5 = [(HKInteractiveChartViewController *)self _singleFixedRange];
  if (v5)
  {
    uint64_t v6 = +[HKGraphZoomLevelConfiguration timeScopeForDateRange:v5];
  }
  else
  {
    id v7 = [(HKInteractiveChartViewController *)self selectedTimeScopeController];
    uint64_t v6 = [v7 selectedTimeScope];
  }
  int64_t v8 = +[HKInteractiveChartViewController _timeScopeForTimeScope:v6 availableTimeScopes:v4];

  return v8;
}

- (BOOL)_selectedSeriesWantsLastRecordedDate
{
  v2 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
  BOOL v3 = [v2 displayTypeIdentifier] == 95;

  return v3;
}

- (void)viewDidLoad
{
  v64.receiver = self;
  v64.super_class = (Class)HKInteractiveChartViewController;
  [(HKInteractiveChartViewController *)&v64 viewDidLoad];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
  id v4 = [(HKInteractiveChartViewController *)self view];
  [v4 setBackgroundColor:v3];

  double v5 = [[HKCurrentTimeView alloc] initWithWideHorizontalMargin:0];
  currentTimeView = self->_currentTimeView;
  self->_currentTimeView = v5;

  [(HKCurrentTimeView *)self->_currentTimeView setDelegate:self];
  id v7 = [(HKInteractiveChartViewController *)self _singleFixedRange];
  [(HKCurrentTimeView *)self->_currentTimeView setDisableControls:v7 != 0];

  [(HKCurrentTimeView *)self->_currentTimeView setOmitPrevNextButtons:1];
  int64_t v8 = [(HKInteractiveChartViewController *)self view];
  [v8 addSubview:self->_currentTimeView];

  char v9 = [(HKInteractiveChartViewController *)self currentValueViewHandler];
  int v10 = [v9 makeCurrentValueView];
  currentValueView = self->_currentValueView;
  self->_currentValueView = v10;

  int v12 = objc_msgSend(NSString, "hk_chartAccessibilityIdentifier:", @"ValueView");
  [(UIView *)self->_currentValueView setAccessibilityIdentifier:v12];

  int64_t v13 = [(HKInteractiveChartViewController *)self currentValueViewHandler];
  [v13 setCurrentValueViewCallbacks:self];

  id v14 = [(HKInteractiveChartViewController *)self view];
  [v14 addSubview:self->_currentValueView];

  int64_t v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  primaryGraphViewWrapper = self->_primaryGraphViewWrapper;
  self->_primaryGraphViewWrapper = v15;

  [(UIView *)self->_primaryGraphViewWrapper setClipsToBounds:1];
  CGRect v17 = self->_primaryGraphViewWrapper;
  CGRect v18 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
  [(UIView *)v17 setBackgroundColor:v18];

  CGRect v19 = [(HKInteractiveChartViewController *)self view];
  [v19 addSubview:self->_primaryGraphViewWrapper];

  [(HKInteractiveChartViewController *)self _configureInitialLollipopSelection];
  unint64_t options = self->_options;
  CGRect v21 = [(HKInteractiveChartViewController *)self timeScopeRanges];
  CGRect v22 = +[HKInteractiveChartViewController _timeScopesWithOptions:options timeScopeRanges:v21];

  if ([(HKInteractiveChartViewController *)self _chartHasDateAxis])
  {
    int64_t v23 = [(HKInteractiveChartViewController *)self _defaultTimeScopeWithAvailableTimeScopes:v22];
    CGRect v24 = [(HKInteractiveChartViewController *)self initialXValue];
    [(HKInteractiveChartViewController *)self _replacePrimaryGraphViewControllerWithTimeScope:v23 anchorDate:v24 animated:0];
  }
  else
  {
    [(HKInteractiveChartViewController *)self _replacePrimaryGraphViewControllerWithScalarController];
  }
  [(HKInteractiveChartViewController *)self _handleInitialLollipopSelection];
  +[HKTimeScopeControl controlWithFrame:timeScopes:](HKTimeScopeControl, "controlWithFrame:timeScopes:", v22, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  CGRect v25 = (HKTimeScopeControl *)objc_claimAutoreleasedReturnValue();
  radioButtons = self->_radioButtons;
  self->_radioButtons = v25;

  double v27 = objc_msgSend(NSString, "hk_chartAccessibilityIdentifier:", @"TimeScopes");
  [(HKTimeScopeControl *)self->_radioButtons setAccessibilityIdentifier:v27];

  [(HKTimeScopeControl *)self->_radioButtons addTarget:self action:sel__radioButtonsDidUpdate_ forControlEvents:4096];
  uint64_t v28 = [(HKInteractiveChartViewController *)self view];
  [v28 addSubview:self->_radioButtons];

  [(HKTimeScopeControl *)self->_radioButtons setSelectedTimeScope:[(HKInteractiveChartViewController *)self _dateZoom]];
  if (![(HKInteractiveChartViewController *)self _chartHasDateAxis]) {
    [(HKInteractiveChartViewController *)self _hideTimeDateControls];
  }
  double v29 = [MEMORY[0x1E4FB1618] tableSeparatorColor];
  uint64_t v30 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  graphTopDividerView = self->_graphTopDividerView;
  self->_graphTopDividerView = v30;

  [(UIView *)self->_graphTopDividerView setBackgroundColor:v29];
  double v32 = [(HKInteractiveChartViewController *)self view];
  [v32 addSubview:self->_graphTopDividerView];

  double v33 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  graphBottomDividerView = self->_graphBottomDividerView;
  self->_graphBottomDividerView = v33;

  [(UIView *)self->_graphBottomDividerView setBackgroundColor:v29];
  id v35 = [(HKInteractiveChartViewController *)self view];
  [v35 addSubview:self->_graphBottomDividerView];

  uint64_t v36 = [(HKInteractiveChartViewController *)self makeAnnotationDataSource];
  [(HKInteractiveChartViewController *)self setAnnotationDataSource:v36];

  [(HKInteractiveChartViewController *)self setLegendBottomLocation:0.0];
  uint64_t v37 = [HKLollipopController alloc];
  uint64_t v38 = [(HKInteractiveChartViewController *)self annotationDataSource];
  double v39 = [(HKInteractiveChartViewController *)self view];
  double v40 = [(HKLollipopController *)v37 initWithAnnotationDataSource:v38 parentView:v39 delegate:self];
  [(HKInteractiveChartViewController *)self setLollipopController:v40];

  unint64_t v41 = (self->_options >> 12) & 1;
  long long v42 = [(HKInteractiveChartViewController *)self lollipopController];
  [v42 setCenterLollipopVertically:v41];

  long long v43 = objc_alloc_init(HKUIDateLabel);
  selectedPointDateLabel = self->_selectedPointDateLabel;
  self->_selectedPointDateLabel = v43;

  long long v45 = self->_selectedPointDateLabel;
  long long v46 = [MEMORY[0x1E4FB1618] labelColor];
  [(HKUIDateLabel *)v45 setTextColor:v46];

  long long v47 = self->_selectedPointDateLabel;
  long long v48 = [MEMORY[0x1E4FB08E0] systemFontOfSize:20.0];
  [(HKUIDateLabel *)v47 setFont:v48];

  [(HKUIDateLabel *)self->_selectedPointDateLabel setUseUppercase:0];
  [(HKUIDateLabel *)self->_selectedPointDateLabel setAdjustsFontSizeToFitWidth:1];
  [(HKUIDateLabel *)self->_selectedPointDateLabel setTextAlignment:2];
  [(HKUIDateLabel *)self->_selectedPointDateLabel setAlpha:0.0];
  long long v49 = [(HKInteractiveChartViewController *)self view];
  [v49 addSubview:self->_selectedPointDateLabel];

  long long v50 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  selectedSeriesLabel = self->_selectedSeriesLabel;
  self->_selectedSeriesLabel = v50;

  id v52 = self->_selectedSeriesLabel;
  v53 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v52 setTextColor:v53];

  id v54 = self->_selectedSeriesLabel;
  uint64_t v55 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:20.0];
  [(UILabel *)v54 setFont:v55];

  [(UILabel *)self->_selectedSeriesLabel setNumberOfLines:0];
  [(UILabel *)self->_selectedSeriesLabel setTextAlignment:0];
  id v56 = [(HKInteractiveChartViewController *)self view];
  [v56 addSubview:self->_selectedSeriesLabel];

  id v57 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  selectedSeriesUnitLabel = self->_selectedSeriesUnitLabel;
  self->_selectedSeriesUnitLabel = v57;

  CGRect v59 = self->_selectedSeriesUnitLabel;
  CGRect v60 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v59 setTextColor:v60];

  id v61 = self->_selectedSeriesUnitLabel;
  objc_super v62 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:20.0];
  [(UILabel *)v61 setFont:v62];

  [(UILabel *)self->_selectedSeriesUnitLabel setAdjustsFontSizeToFitWidth:1];
  v63 = [(HKInteractiveChartViewController *)self view];
  [v63 addSubview:self->_selectedSeriesUnitLabel];

  [(HKInteractiveChartViewController *)self _updateSelectedSeriesLabel:0];
  self->_double bannerBottom = 32.0;
  [(HKInteractiveChartViewController *)self _showHideNoGraphSeriesLabels];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKInteractiveChartViewController;
  [(HKInteractiveChartViewController *)&v7 viewDidAppear:a3];
  BOOL v4 = [(UIViewController *)self hk_viewIsHidden];
  double v5 = [(HKInteractiveChartViewController *)self restorationUserActivity];

  if (v5)
  {
    if (!v4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__HKInteractiveChartViewController_viewDidAppear___block_invoke;
      block[3] = &unk_1E6D50ED8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __50__HKInteractiveChartViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 restorationUserActivity];
  [v1 restoreUserActivityState:v2];
}

- (id)_singleFixedRange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HKInteractiveChartViewController *)self timeScopeRanges];
  if (v3
    && (BOOL v4 = (void *)v3,
        [(HKInteractiveChartViewController *)self timeScopeRanges],
        double v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6 == 1))
  {
    memset(v12, 0, sizeof(v12));
    objc_super v7 = [(HKInteractiveChartViewController *)self timeScopeRanges];
    if ([v7 countByEnumeratingWithState:v12 objects:v13 count:16])
    {
      uint64_t v8 = **((void **)&v12[0] + 1);
      char v9 = [(HKInteractiveChartViewController *)self timeScopeRanges];
      int v10 = [v9 objectForKeyedSubscript:v8];
    }
    else
    {
      int v10 = 0;
    }
  }
  else
  {
    int v10 = 0;
  }
  return v10;
}

- (id)fixedRangeForTimeScope:(int64_t)a3
{
  double v5 = [(HKInteractiveChartViewController *)self timeScopeRanges];
  if (v5)
  {
    uint64_t v6 = [(HKInteractiveChartViewController *)self timeScopeRanges];
    objc_super v7 = [NSNumber numberWithInteger:a3];
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)visibleRangeForTimeScope:(int64_t)a3 proposedRange:(id)a4
{
  id v4 = a4;
  return v4;
}

- (BOOL)_valueRange:(id)a3 fitsInsideValueRange:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = [v5 minValue];
  uint64_t v8 = [v6 minValue];
  uint64_t v9 = [v7 compare:v8];

  int v10 = [v6 maxValue];

  int64_t v11 = [v5 maxValue];

  uint64_t v12 = [v10 compare:v11];
  return v9 != 1 && v12 != 1;
}

- (void)_setGraphViewAxisAndVisibleDateRangeForTimeScope:(int64_t)a3 anchorDate:(id)a4 preserveScrollPosition:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v9 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
  int v10 = [(HKInteractiveChartViewController *)self fixedRangeForTimeScope:a3];
  if (!v10)
  {
    id v38 = v8;
    uint64_t v14 = [(HKInteractiveChartViewController *)self currentCalendar];
    uint64_t v15 = [v14 firstWeekday];

    double v16 = [(HKInteractiveChartViewController *)self _defaultAxisRangeIncludeToday:1];
    int64_t v17 = [(HKInteractiveChartViewController *)self defaultAlignmentForTimeScope:a3];
    CGRect v18 = [(HKInteractiveChartViewController *)self currentCalendar];
    uint64_t v37 = v16;
    int64_t v13 = +[HKGraphZoomLevelConfiguration chartDataRangeForTimeScope:a3 dataRange:v16 firstWeekday:v15 calendar:v18 cadence:0 alignment:v17];

    if (v5)
    {
      uint64_t v12 = [v9 effectiveVisibleRangeCadence];
      id v11 = [v9 effectiveVisibleRangeActive];
      CGRect v19 = [v12 minValue];
      CGRect v20 = [v13 minValue];
      uint64_t v21 = [v19 compare:v20];

      if (v21 == -1)
      {
        CGRect v22 = [v12 minValue];
        int64_t v23 = [v13 maxValue];
        uint64_t v24 = +[HKValueRange valueRangeWithMinValue:v22 maxValue:v23];

        int64_t v13 = (void *)v24;
      }
      CGRect v25 = [v12 maxValue];
      CGRect v26 = [v13 maxValue];
      uint64_t v27 = [v25 compare:v26];

      if (v27 != 1)
      {
        id v8 = v38;
        goto LABEL_20;
      }
      id v28 = [v13 minValue];
      id v29 = [v12 maxValue];
      uint64_t v30 = +[HKValueRange valueRangeWithMinValue:v28 maxValue:v29];

      int64_t v13 = (void *)v30;
      id v8 = v38;
    }
    else
    {
      if (self->_hasInitialDateRangeAndTimeScope)
      {
        id v31 = v38;
        if ((self->_options & 0x100000) != 0) {
          int64_t v17 = 3;
        }
      }
      else
      {
        id v31 = v38;
      }
      double v32 = [(HKInteractiveChartViewController *)self currentCalendar];
      id v28 = +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:a3 anchorDate:v31 alignment:v17 dataRange:v13 calendar:v32 firstWeekday:v15 cadence:0 level:0];

      id v29 = [(HKInteractiveChartViewController *)self visibleRangeForTimeScope:a3 proposedRange:v28];
      if ([(HKInteractiveChartViewController *)self _acceptSubclassRange:v29 proposedRange:v28 axisRange:v13])
      {
        id v29 = v29;
        id v11 = v29;
        uint64_t v12 = v29;
      }
      else
      {
        id v28 = v28;
        uint64_t v33 = [(HKInteractiveChartViewController *)self currentCalendar];
        int64_t v34 = v17;
        id v35 = (void *)v33;
        id v11 = +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:a3 anchorDate:v38 alignment:v34 dataRange:v13 calendar:v33 firstWeekday:v15 cadence:1 level:0];

        uint64_t v12 = v28;
      }
      id v8 = v38;
      double v16 = v37;
    }

LABEL_20:
    if (!v13) {
      goto LABEL_26;
    }
    goto LABEL_21;
  }
  id v11 = [(HKInteractiveChartViewController *)self _graphViewAxisAndVisibleDateRangeForTimeScope:a3 fixedRange:v10];
  uint64_t v12 = v11;
  int64_t v13 = v11;
  if (!v11) {
    goto LABEL_26;
  }
LABEL_21:
  if (v12 && v11)
  {
    _HKInitializeLogging();
    uint64_t v36 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_DEBUG)) {
      -[HKInteractiveChartViewController _setGraphViewAxisAndVisibleDateRangeForTimeScope:anchorDate:preserveScrollPosition:]((uint64_t)self, (uint64_t)v13, v36);
    }
    [v9 setContentWidthFromTimeScope:v10 == 0];
    [v9 setEffectiveAxisRange:v13 effectiveVisibleRangeCadence:v12 effectiveVisibleRangeActive:v11];
  }
LABEL_26:
}

- (BOOL)_acceptSubclassRange:(id)a3 proposedRange:(id)a4 axisRange:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  int v10 = [v9 startDate];
  id v11 = [v9 endDate];

  uint64_t v12 = [v8 startDate];
  int64_t v13 = [v8 endDate];

  if (objc_msgSend(v10, "hk_isAfterOrEqualToDate:", v12)
    && objc_msgSend(v11, "hk_isBeforeOrEqualToDate:", v13))
  {
    uint64_t v14 = [v7 startDate];
    uint64_t v15 = [v7 endDate];
    BOOL v16 = ![v10 isEqualToDate:v14] || (objc_msgSend(v11, "isEqualToDate:", v15) & 1) == 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)_graphViewAxisAndVisibleDateRangeForTimeScope:(int64_t)a3 fixedRange:(id)a4
{
  id v5 = a4;
  id v6 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:a3];
  [v6 canonicalSize];
  double v8 = v7;
  if (a3 != 4) {
    goto LABEL_7;
  }
  double v9 = v7 - (double)(unint64_t)(3 * *MEMORY[0x1E4F296E8]);
  int v10 = [v5 endDate];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;
  int64_t v13 = [v5 startDate];
  [v13 timeIntervalSinceReferenceDate];
  double v15 = v12 - v14;

  if (v15 < v9 || v15 > v8)
  {
LABEL_7:
    int64_t v17 = [v5 startDate];
    CGRect v18 = [v5 endDate];
    CGRect v19 = HKUIMidDate(v17, v18);
    CGRect v20 = [v19 dateByAddingTimeInterval:-(v8 * 0.5)];
    uint64_t v21 = [v19 dateByAddingTimeInterval:v8 * 0.5];
    id v22 = +[HKValueRange valueRangeWithMinValue:v20 maxValue:v21];
  }
  else
  {
    id v22 = v5;
  }

  return v22;
}

- (BOOL)_visibleRangeIsNowForTimeScope:(int64_t)a3
{
  id v5 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
  id v6 = [v5 effectiveVisibleRangeCadence];
  if (v6)
  {
    double v7 = [(HKInteractiveChartViewController *)self currentCalendar];
    uint64_t v8 = [v7 firstWeekday];

    double v9 = [MEMORY[0x1E4F1C9C8] date];
    int v10 = [v5 effectiveAxisRange];
    double v11 = [(HKInteractiveChartViewController *)self currentCalendar];
    double v12 = +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:a3 anchorDate:v9 alignment:3 dataRange:v10 calendar:v11 firstWeekday:v8 cadence:0 level:0];

    int64_t v13 = [v5 effectiveVisibleRangeCadence];
    char v14 = [v12 isEqual:v13];
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

- (id)makeAnchorDateFromPreviousAnchorDate:(id)a3 previousEffectiveVisibleRange:(id)a4 previousTimeScope:(int64_t)a5 currentTimeScope:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = v11;
  char v14 = [(HKInteractiveChartViewController *)self lollipopController];
  double v15 = [v14 firstLollipopDateSinceDelta:0.25];

  BOOL v16 = [(HKInteractiveChartViewController *)self _dateForMostRecentData];
  int64_t v17 = [(HKInteractiveChartViewController *)self _singleFixedRange];
  CGRect v18 = v17;
  if (v17)
  {
    CGRect v19 = [v17 startDate];
    CGRect v20 = [v18 endDate];
    HKUIMidDate(v19, v20);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    goto LABEL_7;
  }
  if (v15)
  {
    id v21 = v15;

    if ((unint64_t)a6 >= 6)
    {
      if (a6 != 8) {
        goto LABEL_7;
      }
      CGRect v19 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKInteractiveChartViewController.m", 1554, @"Invalid zoom specified (%ld)", 8);
    }
    else
    {
      __138__HKInteractiveChartViewController_makeAnchorDateFromPreviousAnchorDate_previousEffectiveVisibleRange_previousTimeScope_currentTimeScope___block_invoke(v22, v21, a6);
      CGRect v19 = v21;
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_6;
  }
  id v21 = v13;
  if (![(HKInteractiveChartViewController *)self _visibleRangeIsNowForTimeScope:a5])
  {
    id v21 = [v12 endDate];

    if (a5 <= a6 && (a6 & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      CGRect v26 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v27 = [v26 startOfDayForDate:v21];
      int v28 = [v27 isEqualToDate:v21];

      if (v28)
      {
        id v29 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        uint64_t v30 = [v29 dateByAddingUnit:16 value:-1 toDate:v21 options:0];

        id v21 = (id)v30;
      }
    }
    if (a6 == 7)
    {
      id v31 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      CGRect v19 = [v31 startOfDayForDate:v21];

      double v32 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v33 = [v32 dateByAddingUnit:16 value:1 toDate:v19 options:0];

      int64_t v34 = HKUIMidDate(v19, v33);
      if (HKUIObjectIsLargerOrEqual(v16, (uint64_t)v19) && HKUIObjectIsSmaller(v16, (uint64_t)v33))
      {
        id v35 = [v34 laterDate:v16];
      }
      else
      {
        id v35 = v34;
      }
      id v36 = v35;

      id v21 = v36;
      goto LABEL_6;
    }
  }
LABEL_7:
  if ((objc_msgSend(v21, "hk_isAfterDate:", v16) & 1) != 0 || !v21)
  {
    id v23 = v16;

    id v21 = v23;
  }
  id v24 = v21;

  return v24;
}

id __138__HKInteractiveChartViewController_makeAnchorDateFromPreviousAnchorDate_previousEffectiveVisibleRange_previousTimeScope_currentTimeScope___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:a3];
  [v5 approximateSeriesPointIntervalAtResolution:0];
  double v7 = v6;
  [v5 canonicalSize];
  double v9 = [v4 dateByAddingTimeInterval:(v8 - v7) * 0.5];

  return v9;
}

- (void)updatePrimaryGraphViewController
{
  if ([(HKInteractiveChartViewController *)self _chartHasDateAxis])
  {
    int64_t v3 = [(HKTimeScopeControl *)self->_radioButtons selectedTimeScope];
    [(HKInteractiveChartViewController *)self _replacePrimaryGraphViewControllerWithTimeScope:v3 anchorDate:0 animated:0];
  }
  else
  {
    [(HKInteractiveChartViewController *)self _replacePrimaryGraphViewControllerWithScalarController];
  }
}

- (void)_replacePrimaryGraphViewControllerWithTimeScope:(int64_t)a3 anchorDate:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  primaryGraphViewController = self->_primaryGraphViewController;
  id v9 = a4;
  int64_t v10 = [(HKGraphViewController *)primaryGraphViewController dateZoom];
  memset(&v65, 0, sizeof(v65));
  if (v10 >= a3)
  {
    CGAffineTransformMakeScale(&v65, 0.899999999, 1.0);
    CGFloat v11 = 1.1;
  }
  else
  {
    CGAffineTransformMakeScale(&v65, 1.1, 1.0);
    CGFloat v11 = 0.899999999;
  }
  memset(&v64, 0, sizeof(v64));
  CGAffineTransformMakeScale(&v64, v11, 1.0);
  id v12 = self->_primaryGraphViewController;
  id v13 = [(HKGraphViewController *)v12 graphView];
  char v14 = [v13 effectiveVisibleRangeActive];

  double v15 = [(HKInteractiveChartViewController *)self makeAnchorDateFromPreviousAnchorDate:v9 previousEffectiveVisibleRange:v14 previousTimeScope:v10 currentTimeScope:a3];

  BOOL v16 = [(HKGraphViewController *)v12 graphView];
  [v16 removeSeries];

  int64_t v17 = [(HKGraphViewController *)v12 view];
  [v17 frame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  CGRect v26 = [(HKGraphViewController *)v12 graphView];
  [v26 xAxisSpace];
  double v28 = v27;

  id v29 = [(HKInteractiveChartViewController *)self currentCalendar];
  uint64_t v30 = [(HKInteractiveChartViewController *)self makePrimaryGraphViewControllerWithDateZoom:a3 previousDateZoom:v10 previousXAxisSpace:v29 currentCalendar:v28];
  id v31 = self->_primaryGraphViewController;
  self->_primaryGraphViewController = v30;

  [(HKInteractiveChartViewController *)self primaryGraphViewControllerDidInitialize:self->_primaryGraphViewController];
  [(HKGraphViewController *)self->_primaryGraphViewController setGraphViewDelegateProxy:self];
  double v32 = [(HKGraphViewController *)self->_primaryGraphViewController view];
  objc_msgSend(v32, "setFrame:", v19, v21, v23, v25);

  [(HKInteractiveChartViewController *)self addChildViewController:self->_primaryGraphViewController];
  primaryGraphViewWrapper = self->_primaryGraphViewWrapper;
  int64_t v34 = [(HKGraphViewController *)self->_primaryGraphViewController view];
  [(UIView *)primaryGraphViewWrapper addSubview:v34];

  [(HKGraphViewController *)self->_primaryGraphViewController didMoveToParentViewController:self];
  id v35 = [(HKGraphViewController *)self->_primaryGraphViewController view];
  [v35 setAlpha:0.0];

  id v36 = [(HKGraphViewController *)self->_primaryGraphViewController view];
  CGAffineTransform v63 = v64;
  [v36 setTransform:&v63];

  uint64_t v37 = [(HKGraphViewController *)self->_primaryGraphViewController view];
  id v38 = [(HKInteractiveChartViewController *)self view];
  double v39 = [v38 backgroundColor];
  [v37 setBackgroundColor:v39];

  [(HKInteractiveChartViewController *)self _configureSelectedRangeFormatterWithChartRangeProvider];
  double v40 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
  unint64_t v41 = [(HKInteractiveChartViewController *)self view];
  long long v42 = [v41 backgroundColor];
  [v40 setTopMarginColor:v42];

  objc_msgSend(v40, "setTilingDisabled:", -[HKInteractiveChartViewController _tilingDisabled](self, "_tilingDisabled"));
  objc_msgSend(v40, "setPrefersOpaqueLegends:", -[HKInteractiveChartViewController _prefersOpaqueLegends](self, "_prefersOpaqueLegends"));
  objc_msgSend(v40, "setDrawsGridlinesPerSeriesGroup:", -[HKInteractiveChartViewController _drawsGridlinesPerSeriesGroup](self, "_drawsGridlinesPerSeriesGroup"));
  [(HKInteractiveChartViewController *)self _setGraphViewAxisAndVisibleDateRangeForTimeScope:a3 anchorDate:v15 preserveScrollPosition:0];
  long long v43 = [(HKInteractiveChartViewController *)self view];
  [v43 setNeedsLayout];

  long long v44 = [(HKInteractiveChartViewController *)self view];
  [v44 layoutSubviews];

  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v58 = 3221225472;
  CGRect v59 = __104__HKInteractiveChartViewController__replacePrimaryGraphViewControllerWithTimeScope_anchorDate_animated___block_invoke;
  CGRect v60 = &unk_1E6D54ED8;
  long long v45 = v12;
  id v61 = v45;
  objc_super v62 = self;
  long long v46 = (void (**)(void *, uint64_t))_Block_copy(&aBlock);
  uint64_t v50 = MEMORY[0x1E4F143A8];
  uint64_t v51 = 3221225472;
  id v52 = __104__HKInteractiveChartViewController__replacePrimaryGraphViewControllerWithTimeScope_anchorDate_animated___block_invoke_2;
  v53 = &unk_1E6D54F00;
  id v54 = self;
  uint64_t v55 = v45;
  CGAffineTransform v56 = v65;
  long long v47 = v45;
  long long v48 = _Block_copy(&v50);
  long long v49 = v48;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:animations:completion:", v48, v46, 0.25, v50, v51, v52, v53, v54, v55, *(_OWORD *)&v56.a, *(_OWORD *)&v56.c, *(_OWORD *)&v56.tx, aBlock, v58, v59, v60);
  }
  else
  {
    (*((void (**)(void *))v48 + 2))(v48);
    v46[2](v46, 1);
  }
}

void *__104__HKInteractiveChartViewController__replacePrimaryGraphViewControllerWithTimeScope_anchorDate_animated___block_invoke(uint64_t a1, int a2)
{
  double result = *(void **)(a1 + 32);
  if (result)
  {
    [result willMoveToParentViewController:0];
    BOOL v5 = [*(id *)(a1 + 32) view];
    [v5 removeFromSuperview];

    double result = (void *)[*(id *)(a1 + 32) removeFromParentViewController];
  }
  if (a2)
  {
    double v6 = *(void **)(a1 + 40);
    return (void *)[v6 _automaticAutoScale];
  }
  return result;
}

void __104__HKInteractiveChartViewController__replacePrimaryGraphViewControllerWithTimeScope_anchorDate_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1120) view];
  [v2 setAlpha:1.0];

  int64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1120) view];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v8 = *MEMORY[0x1E4F1DAB8];
  long long v9 = v4;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:&v8];

  BOOL v5 = [*(id *)(a1 + 40) view];
  [v5 setAlpha:0.0];

  double v6 = [*(id *)(a1 + 40) view];
  long long v7 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v9 = v7;
  long long v10 = *(_OWORD *)(a1 + 80);
  [v6 setTransform:&v8];
}

- (void)_replacePrimaryGraphViewControllerWithScalarController
{
  int64_t v3 = [[HKScalarGraphViewController alloc] initWithMinimumHeight:10.0];
  primaryGraphViewController = self->_primaryGraphViewController;
  self->_primaryGraphViewController = &v3->super;

  [(HKGraphViewController *)self->_primaryGraphViewController setGraphViewDelegateProxy:self];
  primaryGraphViewWrapper = self->_primaryGraphViewWrapper;
  double v6 = [(HKGraphViewController *)self->_primaryGraphViewController view];
  [(UIView *)primaryGraphViewWrapper addSubview:v6];

  [(HKInteractiveChartViewController *)self addChildViewController:self->_primaryGraphViewController];
  [(HKGraphViewController *)self->_primaryGraphViewController didMoveToParentViewController:self];
  [(HKInteractiveChartViewController *)self _configureSelectedRangeFormatterWithChartRangeProvider];
}

- (void)_configureSelectedRangeFormatterWithChartRangeProvider
{
  id v5 = [(HKInteractiveChartViewController *)self selectedRangeFormatter];
  int64_t v3 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  long long v4 = [v3 graphView];
  [v5 configureWithChartRangeProvider:v4];
}

- (void)_handleVisibleRangeChange
{
  [(HKInteractiveChartViewController *)self _setDateSelectorToVisibleRange];
  [(HKInteractiveChartViewController *)self updateCurrentValueViewWithVisibleRange];
}

- (void)_configureInitialLollipopSelection
{
  id v6 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
  int64_t v3 = [v6 chartingRules];
  unint64_t options = self->_options;
  if ([v3 shouldShowInitialLollipop] && (options & 0x2000) == 0)
  {
    id v5 = [(HKInteractiveChartViewController *)self _dateForMostRecentData];
    [(HKInteractiveChartViewController *)self initialXValue];

    if (v5) {
      [(HKInteractiveChartViewController *)self setDisableCurrentValueViewForInitialLollipop:1];
    }
  }
}

- (void)_handleInitialLollipopSelection
{
  uint64_t v3 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
  uint64_t v4 = v3;
  if (v3)
  {
    long long v10 = (void *)v3;
    uint64_t v3 = [(HKInteractiveChartViewController *)self disableCurrentValueViewForInitialLollipop];
    uint64_t v4 = (uint64_t)v10;
    if (v3)
    {
      id v5 = [(HKInteractiveChartViewController *)self _dateForMostRecentData];
      uint64_t v6 = [(HKInteractiveChartViewController *)self initialXValue];
      long long v7 = (void *)v6;
      if (v6) {
        long long v8 = (void *)v6;
      }
      else {
        long long v8 = v5;
      }
      id v9 = v8;

      if ([(HKInteractiveChartViewController *)self _shouldHandleInitialLollipopTouchDate:v9 mostRecentDataDate:v5 forGraphView:v10])
      {
        [v10 touchSelectionAtModelX:v9];
      }
      else
      {
        [(HKInteractiveChartViewController *)self graphViewExternalSelectionEnd:v10];
      }

      uint64_t v4 = (uint64_t)v10;
    }
  }
  MEMORY[0x1F41817F8](v3, v4);
}

- (BOOL)_shouldHandleInitialLollipopTouchDate:(id)a3 mostRecentDataDate:(id)a4 forGraphView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = v9;
  if (v7)
  {
    uint64_t v11 = [v9 xAxisDateZoom];
    if (v11 == 8)
    {
      char v12 = 1;
    }
    else
    {
      uint64_t v13 = v11;
      char v14 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:v11];
      uint64_t v15 = [v10 resolutionFromTraitCollectionAttributes];
      BOOL v16 = [v10 primarySeries];
      uint64_t v17 = [v16 resolutionForTimeScope:v13 traitResolution:v15];

      [v14 approximateSeriesPointIntervalAtResolution:v17];
      double v18 = objc_msgSend(v8, "dateByAddingTimeInterval:");
      char v12 = objc_msgSend(v7, "hk_isBeforeOrEqualToDate:", v18);
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)installGraphViewSnapshot
{
  primaryGraphViewSnapshot = self->_primaryGraphViewSnapshot;
  if (primaryGraphViewSnapshot)
  {
    [(UIView *)primaryGraphViewSnapshot removeFromSuperview];
    uint64_t v4 = self->_primaryGraphViewSnapshot;
    self->_primaryGraphViewSnapshot = 0;
  }
  id v5 = [(UIView *)self->_primaryGraphViewWrapper snapshotViewAfterScreenUpdates:0];
  uint64_t v6 = self->_primaryGraphViewSnapshot;
  self->_primaryGraphViewSnapshot = v5;

  [(UIView *)self->_primaryGraphViewWrapper frame];
  -[UIView setFrame:](self->_primaryGraphViewSnapshot, "setFrame:");
  id v7 = [(HKInteractiveChartViewController *)self view];
  [v7 insertSubview:self->_primaryGraphViewSnapshot aboveSubview:self->_primaryGraphViewWrapper];
}

- (void)removeGraphViewSnapshotAnimated:(BOOL)a3
{
  primaryGraphViewSnapshot = self->_primaryGraphViewSnapshot;
  if (primaryGraphViewSnapshot)
  {
    if (a3)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __68__HKInteractiveChartViewController_removeGraphViewSnapshotAnimated___block_invoke;
      v7[3] = &unk_1E6D50ED8;
      v7[4] = self;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __68__HKInteractiveChartViewController_removeGraphViewSnapshotAnimated___block_invoke_2;
      v6[3] = &unk_1E6D53418;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v6 completion:0.12];
    }
    else
    {
      [(UIView *)primaryGraphViewSnapshot removeFromSuperview];
      id v5 = self->_primaryGraphViewSnapshot;
      self->_primaryGraphViewSnapshot = 0;
    }
  }
}

uint64_t __68__HKInteractiveChartViewController_removeGraphViewSnapshotAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1128) setAlpha:0.0];
}

void __68__HKInteractiveChartViewController_removeGraphViewSnapshotAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1128) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1128);
  *(void *)(v2 + 1128) = 0;
}

- (void)_unitPreferencesDidUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__HKInteractiveChartViewController__unitPreferencesDidUpdate___block_invoke;
  v6[3] = &unk_1E6D513B0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __62__HKInteractiveChartViewController__unitPreferencesDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v2 objectForKeyedSubscript:@"HKUnitPreferenceControllerUnitPreferenceChangedKey"];

  [*(id *)(a1 + 40) unitPreferencesWillUpdate:v4];
  [*(id *)(a1 + 40) _updateAxisScalingRulesForUnitPreferenceChangesOfTypes:v4];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 1120) graphView];
  [v3 invalidateDataSourceCaches];
  [*(id *)(a1 + 40) _automaticAutoScale];
  [*(id *)(a1 + 40) _handleVisibleRangeChange];
}

- (void)_updateAxisScalingRulesForUnitPreferenceChangesOfTypes:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = self->_allGraphSeriesConfigurationManagers;
  uint64_t v31 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v50;
    uint64_t v33 = self;
    id v34 = v4;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v50 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v5;
        uint64_t v6 = *(void **)(*((void *)&v49 + 1) + 8 * v5);
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v7 = [v6 allDisplayTypes];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v46;
          uint64_t v35 = *(void *)v46;
          id v36 = v7;
          do
          {
            uint64_t v11 = 0;
            uint64_t v37 = v9;
            do
            {
              if (*(void *)v46 != v10) {
                objc_enumerationMutation(v7);
              }
              char v12 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
              uint64_t v13 = [v12 objectType];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 containsObject:v13])
              {
                id v14 = v4;
                double v39 = v13;
                uint64_t v15 = [(HKInteractiveChartViewController *)self unitPreferenceController];
                uint64_t v16 = [v15 unitForChartingDisplayType:v12];

                double v40 = (void *)v16;
                if (v16)
                {
                  uint64_t v38 = v11;
                  long long v43 = 0u;
                  long long v44 = 0u;
                  long long v41 = 0u;
                  long long v42 = 0u;
                  unint64_t options = self->_options;
                  double v18 = [(HKInteractiveChartViewController *)self timeScopeRanges];
                  double v19 = +[HKInteractiveChartViewController _timeScopesWithOptions:options timeScopeRanges:v18];

                  uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v53 count:16];
                  if (v20)
                  {
                    uint64_t v21 = v20;
                    uint64_t v22 = *(void *)v42;
                    do
                    {
                      for (uint64_t i = 0; i != v21; ++i)
                      {
                        if (*(void *)v42 != v22) {
                          objc_enumerationMutation(v19);
                        }
                        double v24 = objc_msgSend(v6, "configurationForDisplayType:zoom:", v12, objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "integerValue"));
                        double v25 = [v24 graphSeries];
                        CGRect v26 = [v25 yAxis];
                        [v26 invalidateAxisLabelCache];

                        double v27 = [v24 graphSeries];
                        double v28 = [v27 axisScalingRule];

                        if ([v28 conformsToProtocol:&unk_1F3CD46B0]
                          && (objc_opt_respondsToSelector() & 1) != 0)
                        {
                          [v28 setUnit:v40];
                        }
                      }
                      uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v53 count:16];
                    }
                    while (v21);
                  }

                  self = v33;
                  id v14 = v34;
                  uint64_t v10 = v35;
                  id v7 = v36;
                  uint64_t v9 = v37;
                  uint64_t v11 = v38;
                }

                uint64_t v13 = v39;
                id v4 = v14;
              }

              ++v11;
            }
            while (v11 != v9);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v31);
  }
}

- (id)makePrimaryGraphViewControllerWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6
{
  id v9 = a6;
  uint64_t v10 = [[HKDateGraphViewController alloc] initWithDateZoom:a3 previousDateZoom:a4 previousXAxisSpace:v9 currentCalendar:a5];

  return v10;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (id)_displayNameForDisplayType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_options)
  {
LABEL_6:
    id v7 = &stru_1F3B9CF20;
    goto LABEL_7;
  }
  uint64_t v6 = [v4 localization];
  id v7 = [v6 displayName];

  if (!v7)
  {
    uint64_t v8 = [v5 localization];
    id v7 = [v8 displayNameKey];

    if (!v7)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_FAULT)) {
        -[HKInteractiveChartViewController _displayNameForDisplayType:]();
      }
      goto LABEL_6;
    }
  }
LABEL_7:

  return v7;
}

- (id)_displayUnitForDisplayType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKInteractiveChartViewController *)self unitPreferenceController];
  uint64_t v6 = [v4 unitNameForValue:0 unitPreferenceController:v5];

  return v6;
}

- (id)_allDisplayTypes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_allGraphSeriesConfigurationManagers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "allDisplayTypes", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_updateSelectedSeriesLabel:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(HKInteractiveChartViewController *)self _displayNameForDisplayType:v4];
    uint64_t v6 = [(HKInteractiveChartViewController *)self _colorForDisplayType:v4];
    uint64_t v7 = [(HKInteractiveChartViewController *)self _displayUnitForDisplayType:v4];
  }
  else
  {
    uint64_t v8 = [(HKInteractiveChartViewController *)self _allDisplayTypes];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v17 = [(HKInteractiveChartViewController *)self _displayNameForDisplayType:v16];
          if (v17) {
            [v9 addObject:v17];
          }
          double v18 = [(HKInteractiveChartViewController *)self _displayUnitForDisplayType:v16];
          if (v18) {
            [v10 addObject:v18];
          }
          double v19 = [(HKInteractiveChartViewController *)self _colorForDisplayType:v16];
          if (v19) {
            [v11 addObject:v19];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    if ([v9 count] == 1 && objc_msgSend(v10, "count") == 1)
    {
      uint64_t v5 = [v9 anyObject];
      uint64_t v7 = [v10 anyObject];
      uint64_t v6 = [v11 anyObject];
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v6 = 0;
      uint64_t v5 = 0;
    }

    id v4 = 0;
  }
  selectedSeriesLabel = self->_selectedSeriesLabel;
  if (selectedSeriesLabel)
  {
    if (v5)
    {
      [(UILabel *)selectedSeriesLabel setText:v5];
      uint64_t v21 = [(HKInteractiveChartViewController *)self view];
      [v21 setNeedsLayout];
    }
    if (v6) {
      [(UILabel *)self->_selectedSeriesLabel setTextColor:v6];
    }
  }
  selectedSeriesUnitLabel = self->_selectedSeriesUnitLabel;
  if (selectedSeriesUnitLabel)
  {
    if (v7) {
      [(UILabel *)selectedSeriesUnitLabel setText:v7];
    }
    if (v6) {
      [(UILabel *)self->_selectedSeriesUnitLabel setTextColor:v6];
    }
  }
}

- (void)_addDisplayTypeToConfiguration:(id)a3 allDisplayTypes:(id)a4 configurationManager:(id)a5
{
  id v37 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HKInteractiveChartViewController *)self _customGraphSeriesForDisplayType:v37];
  if (v10)
  {
    for (uint64_t i = 0; i != 8; ++i)
      [(HKInteractiveChartViewController *)self _configureCustomDisplayType:v37 graphSeries:v10 configurationManager:v9 timeScope:i];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v37;
      for (uint64_t j = 0; j != 8; ++j)
      {
        uint64_t v14 = [v12 graphSeriesForTimeScope:j];
        if (!v14)
        {
          uint64_t v15 = 0;
          while (1)
          {
            uint64_t v16 = [v12 graphSeriesForTimeScope:v15];
            if (v16) {
              break;
            }
            if (++v15 == 8)
            {
              uint64_t v14 = 0;
              goto LABEL_13;
            }
          }
          uint64_t v14 = (void *)v16;
        }
LABEL_13:
        [(HKInteractiveChartViewController *)self _configureCustomDisplayType:v12 graphSeries:v14 configurationManager:v9 timeScope:j];
      }
    }
    else
    {
      unint64_t options = self->_options;
      int64_t v18 = [(HKInteractiveChartViewController *)self _numHorizontalDisplayTypesForTimeScope:6 displayTypes:v8];
      int64_t v19 = [(HKInteractiveChartViewController *)self _numHorizontalDisplayTypesForTimeScope:5 displayTypes:v8];
      int64_t v32 = [(HKInteractiveChartViewController *)self _numHorizontalDisplayTypesForTimeScope:4 displayTypes:v8];
      int64_t v33 = [(HKInteractiveChartViewController *)self _numHorizontalDisplayTypesForTimeScope:3 displayTypes:v8];
      id v12 = (id)objc_opt_new();
      uint64_t v20 = objc_opt_new();
      uint64_t v21 = v20;
      int v36 = options;
      if ((options & 0x80) != 0)
      {
        [v20 setTimeScope:7];
        objc_msgSend(v21, "setNumberOfHorizontalDisplayTypes:", -[HKInteractiveChartViewController _numHorizontalDisplayTypesForTimeScope:displayTypes:](self, "_numHorizontalDisplayTypesForTimeScope:displayTypes:", 7, v8));
        [v21 setHorizontalIndex:0];
        [v12 addObject:v21];
      }
      uint64_t v35 = v21;
      if ((options & 0x400) == 0)
      {
        uint64_t v22 = objc_opt_new();
        [v22 setTimeScope:6];
        [v22 setNumberOfHorizontalDisplayTypes:v18];
        [v22 setHorizontalIndex:0];
        [v12 addObject:v22];
      }
      double v23 = objc_opt_new();
      [v23 setTimeScope:5];
      [v23 setNumberOfHorizontalDisplayTypes:v19];
      [v23 setHorizontalIndex:0];
      id v34 = v23;
      [v12 addObject:v23];
      long long v24 = objc_opt_new();
      [v24 setTimeScope:4];
      [v24 setNumberOfHorizontalDisplayTypes:v32];
      [v24 setHorizontalIndex:0];
      [v12 addObject:v24];
      long long v25 = objc_opt_new();
      [v25 setTimeScope:3];
      [v25 setNumberOfHorizontalDisplayTypes:v33];
      [v25 setHorizontalIndex:0];
      [v12 addObject:v25];
      long long v26 = objc_opt_new();
      long long v27 = v26;
      if ((v36 & 0x200) == 0)
      {
        [v26 setTimeScope:2];
        objc_msgSend(v27, "setNumberOfHorizontalDisplayTypes:", -[HKInteractiveChartViewController _numHorizontalDisplayTypesForTimeScope:displayTypes:](self, "_numHorizontalDisplayTypesForTimeScope:displayTypes:", 2, v8));
        [v27 setHorizontalIndex:0];
        [v12 addObject:v27];
      }
      double v28 = objc_opt_new();
      uint64_t v29 = v28;
      if ((v36 & 0x100) != 0)
      {
        [v28 setTimeScope:1];
        objc_msgSend(v29, "setNumberOfHorizontalDisplayTypes:", -[HKInteractiveChartViewController _numHorizontalDisplayTypesForTimeScope:displayTypes:](self, "_numHorizontalDisplayTypesForTimeScope:displayTypes:", 1, v8));
        [v29 setHorizontalIndex:0];
        [v12 addObject:v29];
      }
      uint64_t v30 = objc_opt_new();
      uint64_t v31 = v30;
      if ((v36 & 0x200000) != 0)
      {
        [v30 setTimeScope:0];
        objc_msgSend(v31, "setNumberOfHorizontalDisplayTypes:", -[HKInteractiveChartViewController _numHorizontalDisplayTypesForTimeScope:displayTypes:](self, "_numHorizontalDisplayTypesForTimeScope:displayTypes:", 0, v8));
        [v31 setHorizontalIndex:0];
        [v12 addObject:v31];
      }
      [(HKInteractiveChartViewController *)self _addSeriesForDisplayType:v37 updatingTimeScopeProperties:v12 configurationManager:v9];
    }
  }
}

- (void)_updateAfterConfigurationChangeIncludeDateAxis:(BOOL)a3
{
  if (a3 && [(HKInteractiveChartViewController *)self _chartHasDateAxis]) {
    [(HKInteractiveChartViewController *)self _updateGraphViewAxisDateRange];
  }
  id v4 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
  [v4 setNeedsReloadSeries];

  [(HKInteractiveChartViewController *)self _showHideNoGraphSeriesLabels];
  [(HKInteractiveChartViewController *)self _updateSelectedSeriesLabel:0];
}

- (void)_setVisibleDisplayTypes:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
        id v11 = objc_alloc_init(HKGraphSeriesConfigurationManager);
        [(HKGraphSeriesConfigurationManager *)v11 reset];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v21;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              [(HKInteractiveChartViewController *)self _addDisplayTypeToConfiguration:*(void *)(*((void *)&v20 + 1) + 8 * v16++) allDisplayTypes:v12 configurationManager:v11];
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v14);
        }

        [v5 addObject:v11];
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  uint64_t v17 = (NSArray *)[v5 copy];
  allGraphSeriesConfigurationManagers = self->_allGraphSeriesConfigurationManagers;
  self->_allGraphSeriesConfigurationManagers = v17;

  [(HKInteractiveChartViewController *)self _updateAfterConfigurationChangeIncludeDateAxis:1];
}

- (int64_t)addNewDisplayTypeStackWithDisplayTypes:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_allGraphSeriesConfigurationManagers];
    uint64_t v7 = objc_alloc_init(HKGraphSeriesConfigurationManager);
    [(HKGraphSeriesConfigurationManager *)v7 reset];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          -[HKInteractiveChartViewController _addDisplayTypeToConfiguration:allDisplayTypes:configurationManager:](self, "_addDisplayTypeToConfiguration:allDisplayTypes:configurationManager:", *(void *)(*((void *)&v17 + 1) + 8 * v12++), v8, v7, (void)v17);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [v6 addObject:v7];
    uint64_t v13 = (NSArray *)[v6 copy];
    allGraphSeriesConfigurationManagers = self->_allGraphSeriesConfigurationManagers;
    self->_allGraphSeriesConfigurationManagers = v13;

    [(HKInteractiveChartViewController *)self _updateAfterConfigurationChangeIncludeDateAxis:0];
    [(HKInteractiveChartViewController *)self updateCurrentValueViewWithVisibleRange];
    [(HKInteractiveChartViewController *)self _scheduleDelayedAutoscale];
    [(HKInteractiveChartViewController *)self _updateGraphViewAxisDateRange];
    int64_t v15 = [v6 count] - 1;
  }
  else
  {
    int64_t v15 = -1;
  }

  return v15;
}

- (void)removeStackedDisplayType:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_allGraphSeriesConfigurationManagers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      unint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "configurationContainsDisplayType:", v4, (void)v12))
        {
          unint64_t v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
LABEL_12:

  if (v11 < [(NSArray *)self->_allGraphSeriesConfigurationManagers count]) {
    [(HKInteractiveChartViewController *)self removeDisplayTypeStackAtIndex:v11];
  }
}

- (BOOL)removeDisplayTypeStackAtIndex:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_allGraphSeriesConfigurationManagers];
  unint64_t v6 = [v5 count];
  unint64_t v7 = v6;
  if (a3 <= 1) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = a3;
  }
  if (v6 > v8)
  {
    [v5 removeObjectAtIndex:a3];
    uint64_t v9 = (NSArray *)[v5 copy];
    allGraphSeriesConfigurationManagers = self->_allGraphSeriesConfigurationManagers;
    self->_allGraphSeriesConfigurationManagers = v9;

    [(HKInteractiveChartViewController *)self _updateAfterConfigurationChangeIncludeDateAxis:0];
    [(HKInteractiveChartViewController *)self updateCurrentValueViewWithVisibleRange];
    [(HKInteractiveChartViewController *)self _scheduleDelayedAutoscale];
  }

  return v7 > v8;
}

- (id)_customGraphSeriesForDisplayType:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 performSelector:sel_graphSeries];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_configureCustomDisplayType:(id)a3 graphSeries:(id)a4 configurationManager:(id)a5 timeScope:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  long long v13 = objc_alloc_init(HKGraphSeriesConfiguration);
  [(HKGraphSeriesConfiguration *)v13 setGraphSeries:v11];

  [(HKGraphSeriesConfiguration *)v13 setDisplayType:v12];
  switch(a6)
  {
    case 0:
      if ((self->_options & 0x200000) != 0) {
        goto LABEL_15;
      }
      break;
    case 1:
      if ((self->_options & 0x100) != 0) {
        goto LABEL_15;
      }
      break;
    case 2:
      if ((self->_options & 0x200) == 0) {
        goto LABEL_15;
      }
      break;
    case 3:
      if ((self->_options & 0x4000) == 0) {
        goto LABEL_15;
      }
      break;
    case 4:
      goto LABEL_15;
    case 5:
      if ((self->_options & 0x8000) != 0) {
        break;
      }
      goto LABEL_15;
    case 6:
      if ((self->_options & 0x400) != 0) {
        break;
      }
      goto LABEL_15;
    case 7:
      if ((self->_options & 0x80) != 0) {
LABEL_15:
      }
        [v10 addConfiguration:v13 zoom:a6];
      break;
    case 8:
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_FAULT)) {
        -[HKInteractiveChartViewController _configureCustomDisplayType:graphSeries:configurationManager:timeScope:]();
      }
      break;
    default:
      break;
  }
}

- (int64_t)_numHorizontalDisplayTypesForTimeScope:(int64_t)a3 displayTypes:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([(HKInteractiveChartViewController *)self _displayTypeIsHorizontalForTimeScope:a3 displayType:v12])
        {
          v9 += objc_msgSend(v12, "hk_stackedChartSectionsCountForTimeScope:", a3);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_displayTypeIsHorizontalForTimeScope:(int64_t)a3 displayType:(id)a4
{
  id v5 = [a4 chartingRules];
  uint64_t v6 = [v5 chartStyleForTimeScope:a3];

  return (unint64_t)(v6 - 5) < 4;
}

- (void)_addSeriesForDisplayType:(id)a3 updatingTimeScopeProperties:(id)a4 configurationManager:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __110__HKInteractiveChartViewController__addSeriesForDisplayType_updatingTimeScopeProperties_configurationManager___block_invoke;
  v12[3] = &unk_1E6D54F28;
  _OWORD v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [a4 enumerateObjectsUsingBlock:v12];
}

uint64_t __110__HKInteractiveChartViewController__addSeriesForDisplayType_updatingTimeScopeProperties_configurationManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 timeScope];
  uint64_t v4 = [*(id *)(a1 + 32) _createGraphSeriesConfigurationFromDisplayType:*(void *)(a1 + 40) timeScope:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v4 = [*(id *)(a1 + 48) addConfiguration:v4 zoom:v3];
    uint64_t v5 = v7;
  }
  return MEMORY[0x1F41817F8](v4, v5);
}

- (int64_t)_countOfHorizontalSectionsForConfigurationManager:(id)a3 timeScope:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 allDisplayTypesForZoom:a4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([(HKInteractiveChartViewController *)self _displayTypeIsHorizontalForTimeScope:a4 displayType:v12])
        {
          v9 += objc_msgSend(v12, "hk_stackedChartSectionsCountForTimeScope:", a4);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)_createGraphSeriesConfigurationFromDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", [v6 categoryIdentifier]);
  uint64_t v8 = [(HKInteractiveChartViewController *)self unitPreferenceController];
  int64_t v9 = [(HKInteractiveChartViewController *)self chartDataCacheController];
  uint64_t v10 = objc_msgSend(v6, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:", a4, v7, v8, v9);

  if (v10)
  {
    id v11 = objc_opt_new();
    [v11 setDisplayType:v6];
    id v12 = [v7 color];
    [v11 setTintColor:v12];

    [v11 setGraphSeries:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_primaryDisplayType
{
  unint64_t v4 = [(HKInteractiveChartViewController *)self primaryDisplayTypeStackIndex];
  if (v4 >= [(NSArray *)self->_allGraphSeriesConfigurationManagers count])
  {
    int64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKInteractiveChartViewController.m", 2300, @"Primary display type index out of bounds: %ld", -[HKInteractiveChartViewController primaryDisplayTypeStackIndex](self, "primaryDisplayTypeStackIndex"));
  }
  uint64_t v5 = [(NSArray *)self->_allGraphSeriesConfigurationManagers objectAtIndexedSubscript:[(HKInteractiveChartViewController *)self primaryDisplayTypeStackIndex]];
  id v6 = [v5 allDisplayTypes];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

- (id)_colorForDisplayType:(id)a3
{
  uint64_t v3 = +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", [a3 categoryIdentifier]);
  unint64_t v4 = [v3 color];

  return v4;
}

- (id)makeStandardCurrentValueViewDataSource
{
  uint64_t v3 = [HKCurrentValueViewDataSource alloc];
  unint64_t v4 = [(HKInteractiveChartViewController *)self dateCache];
  uint64_t v5 = [(HKInteractiveChartViewController *)self healthStore];
  id v6 = [(HKInteractiveChartViewController *)self selectedRangeFormatter];
  uint64_t v7 = [(HKCurrentValueViewDataSource *)v3 initWithDateCache:v4 healthStore:v5 selectedRangeFormatter:v6];

  uint64_t v8 = [(HKInteractiveChartViewController *)self currentValueViewDataSourceDelegate];

  if (v8)
  {
    int64_t v9 = [(HKInteractiveChartViewController *)self currentValueViewDataSourceDelegate];
    [(HKCurrentValueViewDataSource *)v7 setDelegate:v9];
  }
  else
  {
    [(HKCurrentValueViewDataSource *)v7 setDelegate:self];
  }
  return v7;
}

- (void)setCurrentValueViewDataSourceDelegate:(id)a3
{
  id v6 = a3;
  objc_storeWeak((id *)&self->_currentValueViewDataSourceDelegate, v6);
  unint64_t v4 = [(HKInteractiveChartViewController *)self currentValueViewDataSource];

  if (v4)
  {
    uint64_t v5 = [(HKInteractiveChartViewController *)self currentValueViewDataSource];
    [v5 setDelegate:v6];
  }
}

- (BOOL)_dashboardEmptyLabelsExist
{
  return self->_dashboardEmptyHeader != 0;
}

- (void)_createDashboardEmptyLabelsIfNecessary
{
  if (![(HKInteractiveChartViewController *)self _dashboardEmptyLabelsExist])
  {
    uint64_t v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    dashboardEmptyHeader = self->_dashboardEmptyHeader;
    self->_dashboardEmptyHeader = v3;

    uint64_t v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    dashboardEmptyDescription = self->_dashboardEmptyDescription;
    self->_dashboardEmptyDescription = v5;

    [(UILabel *)self->_dashboardEmptyDescription setNumberOfLines:0];
    [(UILabel *)self->_dashboardEmptyDescription setTextAlignment:1];
    id v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    uint64_t v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(UILabel *)self->_dashboardEmptyHeader setTextColor:v21];
    [(UILabel *)self->_dashboardEmptyDescription setTextColor:v21];
    [(UILabel *)self->_dashboardEmptyHeader setBackgroundColor:v7];
    [(UILabel *)self->_dashboardEmptyDescription setBackgroundColor:v7];
    uint64_t v8 = self->_dashboardEmptyHeader;
    int64_t v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:27.0];
    [(UILabel *)v8 setFont:v9];

    uint64_t v10 = self->_dashboardEmptyDescription;
    id v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    [(UILabel *)v10 setFont:v11];

    id v12 = [(HKInteractiveChartViewController *)self view];
    [v12 addSubview:self->_dashboardEmptyHeader];

    id v13 = [(HKInteractiveChartViewController *)self view];
    [v13 addSubview:self->_dashboardEmptyDescription];

    long long v14 = self->_dashboardEmptyHeader;
    long long v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    long long v16 = [v15 localizedStringForKey:@"NO_SERIES_HEADER" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(UILabel *)v14 setText:v16];

    long long v17 = self->_dashboardEmptyDescription;
    long long v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v19 = [v18 localizedStringForKey:@"NO_SERIES_DESCRIPTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(UILabel *)v17 setText:v19];

    long long v20 = [(HKInteractiveChartViewController *)self view];
    [v20 setNeedsLayout];
  }
}

- (void)_showHideNoGraphSeriesLabels
{
  uint64_t v3 = [(HKInteractiveChartViewController *)self _allDisplayTypes];
  uint64_t v4 = [v3 count];

  if (!v4) {
    [(HKInteractiveChartViewController *)self _createDashboardEmptyLabelsIfNecessary];
  }
  BOOL v5 = v4 == 0;
  BOOL v6 = v4 != 0;
  uint64_t v7 = v5;
  uint64_t v8 = [(HKGraphViewController *)self->_primaryGraphViewController view];
  [v8 setHidden:v7];

  [(UIView *)self->_graphBottomDividerView setHidden:v6];
  [(UIView *)self->_graphTopDividerView setHidden:v6];
  [(UILabel *)self->_dashboardEmptyHeader setHidden:v6];
  [(UILabel *)self->_dashboardEmptyDescription setHidden:v6];
  radioButtons = self->_radioButtons;
  [(HKTimeScopeControl *)radioButtons setUserInteractionEnabled:v6];
}

- (void)_radioButtonsDidUpdate:(id)a3
{
  uint64_t v4 = [a3 selectedTimeScope];
  BOOL v5 = [(HKInteractiveChartViewController *)self selectedTimeScopeController];
  [v5 setSelectedTimeScope:v4];

  if ([(HKGraphViewController *)self->_primaryGraphViewController dateZoom] != v4)
  {
    [(HKInteractiveChartViewController *)self setHasInitialDateRangeAndTimeScope:0];
    [(HKInteractiveChartViewController *)self _replacePrimaryGraphViewControllerWithTimeScope:v4 anchorDate:0 animated:1];
    BOOL v6 = [_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent alloc];
    uint64_t v7 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
    id v8 = [(HKInteractiveChartInteractionAnalyticsEvent *)v6 initFor:v7 timeScopeSelected:v4];

    [(HKInteractiveChartInteractionAnalyticsManager *)self->_analyticsManager submitWithEvent:v8];
  }
}

- (void)_hideTimeDateControls
{
}

- (void)_showTimeDateControls
{
}

- (void)updateAnnotationDataSource:(id)a3 pointContexts:(id)a4
{
  objc_msgSend(a4, "firstObject", a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [v10 selectedSeries];
  BOOL v6 = [(HKInteractiveChartViewController *)self _displayTypeForSeries:v5];
  int64_t v7 = [(HKInteractiveChartViewController *)self _dateZoom];
  id v8 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  int64_t v9 = [v8 graphView];

  -[HKInteractiveChartViewController updateSelectionAnnotationDataSourceForContext:displayType:timeScope:resolution:](self, "updateSelectionAnnotationDataSourceForContext:displayType:timeScope:resolution:", v10, v6, v7, objc_msgSend(v5, "resolutionForTimeScope:traitResolution:", v7, objc_msgSend(v9, "resolutionFromTraitCollectionAttributes")));
}

- (id)lollipopFieldColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
}

- (id)lollipopAnnotationColor
{
  uint64_t v2 = [(HKInteractiveChartViewController *)self _allDisplayTypes];
  if ([v2 count]) {
    objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopBackgroundColor");
  }
  else {
  uint64_t v3 = HKHealthKeyColor();
  }

  return v3;
}

- (id)lollipopExtensionColor
{
  uint64_t v2 = [(HKInteractiveChartViewController *)self _allDisplayTypes];
  if ([v2 count]) {
    objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopStickColor");
  }
  else {
  uint64_t v3 = HKHealthKeyColor();
  }

  return v3;
}

- (id)makeAnnotationDataSource
{
  uint64_t v3 = [(HKInteractiveChartViewController *)self currentValueViewDataSourceDelegate];
  uint64_t v4 = (void *)v3;
  if (v3) {
    BOOL v5 = (HKInteractiveChartViewController *)v3;
  }
  else {
    BOOL v5 = self;
  }
  BOOL v6 = v5;

  int64_t v7 = [HKInteractiveChartAnnotationViewDataSource alloc];
  id v8 = [(HKInteractiveChartViewController *)self selectedRangeFormatter];
  int64_t v9 = [(HKInteractiveChartAnnotationViewDataSource *)v7 initWithSelectedRangeFormatter:v8 firstWeekday:[(HKInteractiveChartViewController *)self annotationDataSourceFirstWeekday] currentValueViewDataSourceDelegate:v6];

  return v9;
}

- (void)_setSelectedGraphSeries:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [(HKInteractiveChartViewController *)self _configurationForSeries:a3];
  int64_t v7 = v6;
  BOOL v8 = v6 != 0;
  if (v6)
  {
    self->_displayState = 1;
    int64_t v9 = [v6 displayType];
    [(HKInteractiveChartViewController *)self _updateSelectedSeriesLabel:v9];
  }
  else
  {
    self->_displayState = 0;
  }
  id v10 = [(HKInteractiveChartViewController *)self view];
  [v10 setNeedsLayout];

  id v11 = [(HKInteractiveChartViewController *)self view];
  [v11 layoutIfNeeded];

  if ([(HKInteractiveChartViewController *)self _selectedDateRangeLabelEnabled]
    && [(HKInteractiveChartViewController *)self _chartHasDateAxis])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__HKInteractiveChartViewController__setSelectedGraphSeries_animated___block_invoke;
    v14[3] = &unk_1E6D53A88;
    BOOL v15 = v8;
    v14[4] = self;
    id v12 = _Block_copy(v14);
    id v13 = v12;
    if (v4) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v12 animations:0.25];
    }
    else {
      (*((void (**)(void *))v12 + 2))(v12);
    }
  }
}

uint64_t __69__HKInteractiveChartViewController__setSelectedGraphSeries_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1096);
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  [v2 setAlpha:v3];
  BOOL v5 = *(void **)(*(void *)(a1 + 32) + 1000);
  return [v5 setAlpha:v4];
}

- (id)_configurationForSeries:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(HKInteractiveChartViewController *)self _dateZoom];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v6 = self->_allGraphSeriesConfigurationManagers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "configurationForGraphSeries:zoom:", v4, v5, (void)v14);
        if (v11)
        {
          id v12 = (void *)v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (id)_configurationForDisplayType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(HKInteractiveChartViewController *)self _dateZoom];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v6 = self->_allGraphSeriesConfigurationManagers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "configurationForDisplayType:zoom:", v4, v5, (void)v14);
        if (v11)
        {
          id v12 = (void *)v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void)_createAndPrepareFeedbackGenerator
{
  double v3 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:1];
  impactFeedbackGenerator = self->_impactFeedbackGenerator;
  self->_impactFeedbackGenerator = v3;

  int64_t v5 = self->_impactFeedbackGenerator;
  [(UIImpactFeedbackGenerator *)v5 prepare];
}

- (int64_t)_dateZoom
{
  return [(HKGraphViewController *)self->_primaryGraphViewController dateZoom];
}

- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3
{
  return 1;
}

- (BOOL)_shouldShowDateRangeForSelectedPointDateLabel
{
  return (unint64_t)([(HKInteractiveChartViewController *)self _dateZoom] - 7) < 2;
}

- (id)_pointSelectionInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [a3 userInfo];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1F3C3E850, v10))
        {

          id v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v8 = v3;
LABEL_11:

  return v8;
}

- (id)_displayTypeForSeries:(id)a3
{
  id v3 = [(HKInteractiveChartViewController *)self _configurationForSeries:a3];
  uint64_t v4 = [v3 displayType];

  return v4;
}

- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6
{
  id v15 = a3;
  id v9 = a4;
  long long v10 = [(HKInteractiveChartViewController *)self annotationDataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v12 = [(HKInteractiveChartViewController *)self annotationDataSource];
    int64_t v13 = [(HKInteractiveChartViewController *)self _dateZoom];
    long long v14 = [(HKInteractiveChartViewController *)self healthStore];
    [v12 updateWithSelectionContext:v15 displayType:v9 timeScope:v13 resolution:a6 healthStore:v14 viewController:self];
  }
}

- (int64_t)_userInfoSelectionCount:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) userInfo];
        v6 += [v9 count];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4
{
  id v23 = a4;
  if (+[HKLollipopController pointSelectionContextsHaveUserInfo:](HKLollipopController, "pointSelectionContextsHaveUserInfo:"))
  {
    uint64_t v5 = [(HKInteractiveChartViewController *)self lollipopController];
    int v6 = [v5 isVisible];

    if (v6)
    {
      uint64_t v7 = [(HKInteractiveChartViewController *)self lollipopController];
      [v7 updateWithPointContexts:v23];
    }
    else
    {
      BOOL v8 = [(HKInteractiveChartViewController *)self _currentValueEnabled];
      id v9 = &OBJC_IVAR___HKInteractiveChartViewController__currentTimeView;
      if (v8) {
        id v9 = &OBJC_IVAR___HKInteractiveChartViewController__currentValueView;
      }
      [*(id *)((char *)&self->super.super.super.super.isa + *v9) frame];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      double v18 = HKUIRoundToScreenScale(0.5);
      v25.origin.double x = v11;
      v25.origin.double y = v13;
      v25.size.double width = v15;
      v25.size.double height = v17;
      CGRect v26 = CGRectInset(v25, 0.0, v18);
      CGRect v27 = CGRectOffset(v26, 0.0, v18);
      double x = v27.origin.x;
      double y = v27.origin.y;
      double width = v27.size.width;
      double height = v27.size.height;
      uint64_t v7 = [(HKInteractiveChartViewController *)self lollipopController];
      objc_msgSend(v7, "setVisibleWithRect:pointContexts:animated:", v23, 1, x, y, width, height);
    }
  }
}

- (void)graphViewDidEndSelection:(id)a3
{
  id v3 = [(HKInteractiveChartViewController *)self lollipopController];
  [v3 setInvisibleAnimated:1];
}

- (void)graphView:(id)a3 didUpdateFromDateZoom:(int64_t)a4 toDateZoom:(int64_t)a5 newVisibleRange:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  int64_t v10 = [(HKGraphViewController *)self->_primaryGraphViewController dateZoom];
  if (v10 == a5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    CGFloat v11 = self->_observers;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v15), "observer", (void)v19);
          if (v16 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v16 didUpdateFromDateZoom:a4 toDateZoom:a5 newVisibleRange:v9];
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }
  }
  else
  {
    int64_t v17 = v10;
    [(HKInteractiveChartViewController *)self selectTimeScope:a5];
    dispatch_time_t v18 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__HKInteractiveChartViewController_graphView_didUpdateFromDateZoom_toDateZoom_newVisibleRange___block_invoke;
    block[3] = &unk_1E6D54F50;
    block[4] = self;
    void block[5] = v17;
    dispatch_after(v18, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __95__HKInteractiveChartViewController_graphView_didUpdateFromDateZoom_toDateZoom_newVisibleRange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) selectTimeScope:*(void *)(a1 + 40)];
}

- (int64_t)stackCountForGraphView:(id)a3
{
  return [(NSArray *)self->_allGraphSeriesConfigurationManagers count];
}

- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v8 = [(NSArray *)self->_allGraphSeriesConfigurationManagers objectAtIndexedSubscript:a5];
  id v17 = [v8 allGraphSeriesForZoom:a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = self->_observers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) observer];
        if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v15 = [v8 allDisplayTypesForZoom:a4];
          [v14 configureDisplayTypes:v15 timeScope:a4 stackOffset:a5];
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v17;
}

- (void)_notifyObserversDidUpdateVisibleValueRange:(id)a3 changeContext:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_observers;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "observer", (void)v13);
        if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v12 didUpdateVisibleValueRange:v6 changeContext:a4];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)_shouldHandleVisibleRangeChangeWithChangeContext:(int64_t)a3
{
  if (a3 != 1) {
    return 1;
  }
  CFTimeInterval v4 = CACurrentMediaTime();
  if (v4 - self->_lastDateValueRangeUpdate < 1.0) {
    return 0;
  }
  self->_lastDateValueRangeUpdate = v4;
  return 1;
}

- (void)graphView:(id)a3 didUpdateVisibleValueRange:(id)a4 changeContext:(int64_t)a5
{
  id v9 = a3;
  id v8 = a4;
  if (a5)
  {
    [(HKInteractiveChartViewController *)self _notifyObserversDidUpdateVisibleValueRange:v8 changeContext:a5];
    if ([(HKInteractiveChartViewController *)self _shouldHandleVisibleRangeChangeWithChangeContext:a5])
    {
      [(HKInteractiveChartViewController *)self _handleVisibleRangeChange];
    }
  }
}

- (void)_scheduleDelayedAutoscale
{
  [(HKInteractiveChartViewController *)self setDelayedAutoscaleRequestCount:[(HKInteractiveChartViewController *)self delayedAutoscaleRequestCount] + 1];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__HKInteractiveChartViewController__scheduleDelayedAutoscale__block_invoke;
  v4[3] = &unk_1E6D51E50;
  v4[4] = self;
  id v3 = (id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v4 block:0.2];
}

uint64_t __61__HKInteractiveChartViewController__scheduleDelayedAutoscale__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelayedAutoscaleActualCount:", objc_msgSend(*(id *)(a1 + 32), "delayedAutoscaleActualCount") + 1);
  uint64_t v2 = [*(id *)(a1 + 32) delayedAutoscaleActualCount];
  uint64_t result = [*(id *)(a1 + 32) delayedAutoscaleRequestCount];
  if (v2 >= result)
  {
    [*(id *)(a1 + 32) _automaticAutoScale];
    [*(id *)(a1 + 32) setDelayedAutoscaleRequestCount:0];
    CFTimeInterval v4 = *(void **)(a1 + 32);
    return [v4 setDelayedAutoscaleActualCount:0];
  }
  return result;
}

- (void)graphView:(id)a3 didFinishUserScrollingToValueRange:(id)a4
{
  id v5 = a4;
  [(HKInteractiveChartViewController *)self setHasInitialDateRangeAndTimeScope:0];
  [(HKInteractiveChartViewController *)self _notifyObserversDidUpdateVisibleValueRange:v5 changeContext:2];

  [(HKInteractiveChartViewController *)self _handleVisibleRangeChange];
  [(HKInteractiveChartViewController *)self _scheduleDelayedAutoscale];
}

- (void)graphView:(id)a3 didUpdateSeries:(id)a4 newDataArrived:(BOOL)a5 changeContext:(int64_t)a6
{
  BOOL v7 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v20 = a4;
  long long v21 = v10;
  if (v7
    && -[HKInteractiveChartViewController _shouldHandleVisibleRangeChangeWithChangeContext:](self, "_shouldHandleVisibleRangeChangeWithChangeContext:", a6, v20, v10))
  {
    _HKInitializeLogging();
    uint64_t v11 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_DEBUG)) {
      -[HKInteractiveChartViewController graphView:didUpdateSeries:newDataArrived:changeContext:]((uint64_t)self, v11);
    }
    [(HKInteractiveChartViewController *)self _automaticAutoScale];
    uint64_t v12 = [v10 effectiveVisibleRangeActive];
    int v13 = 1;
  }
  else
  {
    int v13 = 0;
    uint64_t v12 = 0;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v14 = self->_observers;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "observer", v20);
        if (v19 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v19 didUpdateSeriesWithNewValueRange:v12];
        }
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  if (v13) {
    [(HKInteractiveChartViewController *)self _handleVisibleRangeChange];
  }
}

- (void)graphView:(id)a3 didUpdateLegendViewsWithTopLegendFrame:(CGRect)a4
{
  double MinY = CGRectGetMinY(a4);
  [(HKInteractiveChartViewController *)self setLegendBottomLocation:MinY];
}

- (void)graphViewDidTapYAxis:(id)a3
{
  if ((self->_options & 0x80000) == 0) {
    [(HKInteractiveChartViewController *)self scrollToMostRecentData];
  }
}

- (void)scrollToMostRecentData
{
  int64_t v3 = [(HKInteractiveChartViewController *)self defaultAlignmentForTimeScope:[(HKTimeScopeControl *)self->_radioButtons selectedTimeScope]];
  [(HKInteractiveChartViewController *)self _scrollToMostRecentDataWithAlignment:v3];
}

- (void)scrollToDate:(id)a3 withVisibleAlignment:(int64_t)a4
{
  id v6 = a3;
  id v8 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  BOOL v7 = [v8 graphView];
  [(HKInteractiveChartViewController *)self _scrollToAnchorDate:v6 graphView:v7 alignment:a4];
}

- (void)scrollToRange:(id)a3 withVisibleAlignment:(int64_t)a4
{
  id v25 = a3;
  id v6 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  BOOL v7 = [v6 graphView];

  id v8 = [v7 effectiveAxisRange];
  id v9 = [v25 minValue];
  char v10 = [v8 containsValue:v9 exclusiveStart:0 exclusiveEnd:0];

  uint64_t v11 = [v25 maxValue];
  char v12 = [v8 containsValue:v11 exclusiveStart:0 exclusiveEnd:0];

  if (v10)
  {
    if (v12) {
      goto LABEL_9;
    }
    int v13 = [v8 minValue];
  }
  else
  {
    int v13 = [v25 minValue];
    if (v12)
    {
      long long v14 = v8;
      goto LABEL_7;
    }
  }
  long long v14 = v25;
LABEL_7:
  uint64_t v15 = [v14 maxValue];
  uint64_t v16 = +[HKValueRange valueRangeWithMinValue:v13 maxValue:v15];

  if (v16)
  {
    uint64_t v17 = [v7 effectiveVisibleRangeCadence];
    uint64_t v18 = [v7 effectiveVisibleRangeActive];
    [v7 setEffectiveAxisRange:v16 effectiveVisibleRangeCadence:v17 effectiveVisibleRangeActive:v18];
  }
LABEL_9:
  switch(a4)
  {
    case 0:
      long long v21 = [v25 startDate];
      long long v22 = self;
      long long v23 = v21;
      uint64_t v24 = 0;
      goto LABEL_13;
    case 1:
    case 3:
    case 4:
      long long v19 = [v25 startDate];
      id v20 = [v25 endDate];
      long long v21 = HKUIMidDate(v19, v20);

      long long v22 = self;
      long long v23 = v21;
      uint64_t v24 = 1;
      goto LABEL_13;
    case 2:
      long long v21 = [v25 endDate];
      long long v22 = self;
      long long v23 = v21;
      uint64_t v24 = 2;
LABEL_13:
      [(HKInteractiveChartViewController *)v22 scrollToDate:v23 withVisibleAlignment:v24];

      break;
    default:
      break;
  }
}

- (void)_scrollToMostRecentDataWithAlignment:(int64_t)a3
{
  id v7 = [(HKInteractiveChartViewController *)self _dateForMostRecentData];
  id v5 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  id v6 = [v5 graphView];
  [(HKInteractiveChartViewController *)self _scrollToAnchorDate:v7 graphView:v6 alignment:a3];
}

- (int64_t)defaultAlignmentForTimeScope:(int64_t)a3
{
  if ((unint64_t)a3 < 6) {
    return 2;
  }
  if (a3 == 8)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKInteractiveChartViewController.m", 2853, @"Invalid timescope (%ld)", 8);
  }
  return 3;
}

- (BOOL)_viewHierarchyIsHidden:(id)a3
{
  id v4 = a3;
  if ([v4 isHidden])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v4 superview];
    if (v6) {
      BOOL v5 = [(HKInteractiveChartViewController *)self _viewHierarchyIsHidden:v6];
    }
    else {
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (void)graphView:(id)a3 startupTime:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = [(HKInteractiveChartViewController *)self view];
  BOOL v7 = [(HKInteractiveChartViewController *)self _viewHierarchyIsHidden:v6];

  if (!v7)
  {
    id v8 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
    id v9 = [v8 localization];
    char v10 = [v9 displayName];

    if (!v10 || ![(__CFString *)v10 length])
    {

      char v10 = @"**UNKNOWN**";
    }
    uint64_t v11 = HKNumberFormatterFromTemplate(1);
    char v12 = [NSNumber numberWithInteger:a4];
    int v13 = [v11 stringFromNumber:v12];

    _HKInitializeLogging();
    long long v14 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_INFO))
    {
      int v17 = 138412546;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_1E0B26000, v14, OS_LOG_TYPE_INFO, "Interactive chart startup time for %@: %@ us", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v15 = [(HKInteractiveChartViewController *)self startupReportingBlock];

    if (v15)
    {
      uint64_t v16 = [(HKInteractiveChartViewController *)self startupReportingBlock];
      ((void (**)(void, __CFString *, int64_t))v16)[2](v16, v10, a4);
    }
  }
}

- (void)graphViewExternalSelectionEnd:(id)a3
{
  if ([(HKInteractiveChartViewController *)self disableCurrentValueViewForInitialLollipop])
  {
    [(HKInteractiveChartViewController *)self setDisableCurrentValueViewForInitialLollipop:0];
    [(HKInteractiveChartViewController *)self updateCurrentValueViewWithVisibleRange];
  }
}

- (void)graphViewRenderedView:(id)a3
{
  id v4 = [(HKInteractiveChartViewController *)self chartHasDataCompletion];

  if (v4 && [(HKInteractiveChartViewController *)self chartDataIsAvailable])
  {
    BOOL v5 = [(HKInteractiveChartViewController *)self chartHasDataCompletion];
    v5[2]();

    [(HKInteractiveChartViewController *)self setChartHasDataCompletion:0];
  }
}

- (HKDisplayType)calendarQueryDisplayType
{
  uint64_t v2 = [(HKInteractiveChartViewController *)self displayTypeStack];
  int64_t v3 = [v2 firstObject];
  id v4 = [v3 firstObject];

  return (HKDisplayType *)v4;
}

- (HKSampleType)calendarQuerySampleType
{
  uint64_t v2 = [(HKInteractiveChartViewController *)self calendarQueryDisplayType];
  int64_t v3 = [v2 sampleType];

  return (HKSampleType *)v3;
}

- (UIColor)calendarDaySamplePresentColor
{
  int64_t v3 = [(HKInteractiveChartViewController *)self displayTypeController];
  id v4 = [(HKInteractiveChartViewController *)self calendarQuerySampleType];
  BOOL v5 = [v3 displayTypeForObjectType:v4];

  id v6 = +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", [v5 categoryIdentifier]);
  BOOL v7 = [v6 color];

  return (UIColor *)v7;
}

- (void)currentTimeViewDidTapOnDateSelector:(id)a3
{
  if ((self->_options & 0x20000) == 0)
  {
    id v4 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
    BOOL v5 = [v4 graphView];
    id v14 = [v5 effectiveVisibleRangeCadence];

    id v6 = [HKInteractiveChartsMonthViewController alloc];
    BOOL v7 = [(HKInteractiveChartViewController *)self healthStore];
    id v8 = [(HKInteractiveChartViewController *)self dateCache];
    id v9 = [v14 minValue];
    char v10 = [(HKInteractiveChartsMonthViewController *)v6 initWithHealthStore:v7 dateCache:v8 date:v9];

    uint64_t v11 = [(HKInteractiveChartViewController *)self calendarQuerySampleType];
    [(HKInteractiveChartsMonthViewController *)v10 setSampleType:v11];

    char v12 = [(HKInteractiveChartViewController *)self calendarDaySamplePresentColor];
    [(HKInteractiveChartsMonthViewController *)v10 setSampleColor:v12];

    [(HKMonthViewController *)v10 setDelegate:self];
    int v13 = [[HKNavigationController alloc] initWithRootViewController:v10];
    [(HKInteractiveChartViewController *)self presentViewController:v13 animated:1 completion:0];
  }
}

- (void)_scrollToAnchorDate:(id)a3 graphView:(id)a4 alignment:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  char v10 = [(HKInteractiveChartViewController *)self currentCalendar];
  uint64_t v11 = [v10 firstWeekday];

  uint64_t v12 = [v8 xAxisDateZoom];
  id v16 = [v8 effectiveAxisRange];
  int v13 = [(HKInteractiveChartViewController *)self currentCalendar];
  id v14 = +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:v12 anchorDate:v9 alignment:a5 dataRange:v16 calendar:v13 firstWeekday:v11 cadence:1 level:0];

  uint64_t v15 = -[HKInteractiveChartViewController visibleRangeForTimeScope:proposedRange:](self, "visibleRangeForTimeScope:proposedRange:", [v8 xAxisDateZoom], v14);
  [v8 setEffectiveVisibleRangeActive:v15 animated:1];

  [(HKInteractiveChartViewController *)self _handleVisibleRangeChange];
}

- (void)_moveSelectedDateInDirection:(int64_t)a3
{
  BOOL v5 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
  id v16 = [v5 effectiveVisibleRangeCadence];

  id v6 = [v16 startDate];
  BOOL v7 = [v16 endDate];
  uint64_t v8 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
  id v9 = (void *)v8;
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v8 != 0)
  {
    [v6 timeIntervalSinceReferenceDate];
    double v13 = v12;
    [v7 timeIntervalSinceReferenceDate];
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v13 + (v14 - v13) * (double)a3 + (v14 - v13) * 0.5];
    [(HKInteractiveChartViewController *)self _scrollToAnchorDate:v15 graphView:v9 alignment:3];
  }
}

- (void)currentTimeViewDidTapOnPreviousTimeButton:(id)a3
{
}

- (void)currentTimeViewDidTapOnNextTimeButton:(id)a3
{
}

- (void)monthViewController:(id)a3 didSelectDate:(id)a4
{
  [(HKInteractiveChartViewController *)self _setVisibleRangeUsingDateFromDateSelector:a4];
  [(HKInteractiveChartViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (id)makeCurrentValueView
{
  int64_t v3 = [[HKInteractiveChartAnnotationView alloc] initWithContext:0];
  [(HKInteractiveChartAnnotationView *)v3 setDelegate:self];
  id v4 = [(HKInteractiveChartViewController *)self view];
  [v4 addSubview:v3];

  BOOL v5 = [(HKInteractiveChartViewController *)self makeStandardCurrentValueViewDataSource];
  [(HKInteractiveChartViewController *)self setCurrentValueViewDataSource:v5];

  [(HKInteractiveChartAnnotationView *)v3 setDataSource:self->_currentValueViewDataSource];
  [(HKInteractiveChartAnnotationView *)v3 setShowsInfoButton:[(HKInteractiveChartViewController *)self _showInfoButtonInCurrentValueView]];
  return v3;
}

- (void)updateCurrentValueView:(id)a3 graphView:(id)a4 timeScope:(int64_t)a5 showInfoButton:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v15 = self->_currentValueView;
  currentValueViewDataSource = self->_currentValueViewDataSource;
  id v11 = a4;
  double v12 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
  [(HKCurrentValueViewDataSource *)currentValueViewDataSource updateDataSourceWithGraphView:v11 displayType:v12 timeScope:a5];

  double v13 = [(HKCurrentValueViewDataSource *)self->_currentValueViewDataSource selectedRangeData];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    [(UIView *)v15 setShowsInfoButton:v6];
    [(UIView *)v15 reloadData];
  }
  else if ([(HKInteractiveChartViewController *)self _primaryDisplayTypeHasNoData])
  {
    [(UIView *)v15 showNoDataStatus];
  }
  else
  {
    [(UIView *)v15 scheduleDeferredDataReload];
  }
}

- (void)didTapOnDateFromCurrentValueView:(id)a3
{
}

- (void)didTapOnInfoButtonFromCurrentValueView:(id)a3
{
  id v4 = [(HKCurrentValueViewDataSource *)self->_currentValueViewDataSource delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = [(HKCurrentValueViewDataSource *)self->_currentValueViewDataSource delegate];
    BOOL v7 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
    id v9 = [v6 infographicViewControllerForDisplayType:v7 healthStore:self->_healthStore];
  }
  else
  {
    BOOL v6 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
    id v9 = [(HKInteractiveChartViewController *)self infographicViewControllerForDisplayType:v6 healthStore:self->_healthStore];
  }

  uint64_t v8 = v9;
  if (v9)
  {
    [(UIViewController *)self hk_presentModalCardViewController:v9 fullScreen:0 animated:1 completion:0];
    uint64_t v8 = v9;
  }
}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithValueRange:", a3);
  BOOL v7 = [(HKInteractiveChartViewController *)self dateCache];
  uint64_t v8 = HKLastUpdatedIntervalText(v6, a4, v7, 1);

  return v8;
}

- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4
{
  id v4 = self;
  char v5 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
  LOBYTE(v4) = +[HKInteractiveChartInfographicFactory infographicSupportedForDisplayType:v5 factorDisplayType:0 healthStore:v4->_healthStore];

  return (char)v4;
}

- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4
{
  char v5 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
  BOOL v6 = +[HKInteractiveChartInfographicFactory infographicViewControllerForDisplayType:v5 factorDisplayType:0 healthStore:self->_healthStore];

  return v6;
}

- (id)_midPointDateFromVisibleRange
{
  uint64_t v2 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
  int64_t v3 = [v2 effectiveVisibleRangeCadence];

  id v4 = [v3 startDate];
  if (v4)
  {
    char v5 = [v3 endDate];

    if (v5)
    {
      BOOL v6 = [v3 startDate];
      BOOL v7 = [v3 endDate];
      id v4 = HKUIMidDate(v6, v7);
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (void)_setDateSelectorToVisibleRange
{
  int64_t v3 = [(HKCurrentTimeView *)self->_currentTimeView superview];

  if (v3)
  {
    uint64_t v4 = [(HKInteractiveChartViewController *)self _singleFixedRange];
    id v19 = (id)v4;
    if (v4) {
      +[HKGraphZoomLevelConfiguration timeScopeForDateRange:v4];
    }
    else {
      [(HKTimeScopeControl *)self->_radioButtons selectedTimeScope];
    }
    char v5 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
    uint64_t v18 = [v5 effectiveVisibleRangeActive];
    BOOL v6 = -[HKInteractiveChartViewController stringForValueRange:timeScope:](self, "stringForValueRange:timeScope:");
    [(HKCurrentTimeView *)self->_currentTimeView setCurrentTimeString:v6];
    BOOL v7 = [v5 effectiveVisibleRangeCadence];
    uint64_t v8 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
    id v9 = [v8 graphView];
    BOOL v10 = [v9 effectiveAxisRange];

    id v11 = [v7 endDate];
    double v12 = [v10 endDate];
    uint64_t v13 = objc_msgSend(v11, "hk_isBeforeDate:", v12);

    uint64_t v14 = [v7 startDate];
    uint64_t v15 = [v10 startDate];
    uint64_t v16 = objc_msgSend(v14, "hk_isAfterDate:", v15);

    currentTimeView = self->_currentTimeView;
    if ((v13 & 1) != 0 || v16)
    {
      [(HKCurrentTimeView *)currentTimeView setDisableControls:0];
      [(HKCurrentTimeView *)self->_currentTimeView setCurrentTimeButtonEnabled:1];
      [(HKCurrentTimeView *)self->_currentTimeView setNextTimeButtonEnabled:v13];
      [(HKCurrentTimeView *)self->_currentTimeView setPreviousTimeButtonEnabled:v16];
    }
    else
    {
      [(HKCurrentTimeView *)currentTimeView setDisableControls:1];
      [(HKCurrentTimeView *)self->_currentTimeView setCurrentTimeButtonEnabled:0];
    }
  }
}

- (void)_setVisibleRangeUsingDateFromDateSelector:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
  char v5 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
  BOOL v6 = [v5 effectiveVisibleRangeCadence];

  if (v8)
  {
    if (v4 && v6 != 0) {
      [(HKInteractiveChartViewController *)self _scrollToAnchorDate:v8 graphView:v4 alignment:3];
    }
  }
}

- (BOOL)_showInfoButtonInCurrentValueView
{
  int64_t v3 = [(HKCurrentValueViewDataSource *)self->_currentValueViewDataSource delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(HKCurrentValueViewDataSource *)self->_currentValueViewDataSource delegate];
    BOOL v6 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
    char v7 = [v5 infographicSupportedForDisplayType:v6 healthStore:self->_healthStore];
  }
  else
  {
    char v5 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
    char v7 = [(HKInteractiveChartViewController *)self infographicSupportedForDisplayType:v5 healthStore:self->_healthStore];
  }

  return v7;
}

- (id)_debugDateStringForPoint:(id)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  [a3 startXValue];
  char v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  char v5 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v4 dateStyle:2 timeStyle:1];

  return v5;
}

- (id)_dateForBlockPoint:(id)a3
{
  if (a3)
  {
    char v4 = (void *)MEMORY[0x1E4F1C9C8];
    [a3 startXValue];
    char v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (id)_chartDataForPoint:(id)a3
{
  uint64_t v3 = [a3 userInfo];
  if ([v3 conformsToProtocol:&unk_1F3C3E850]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_formatterForSeries:(id)a3
{
  id v4 = [(HKInteractiveChartViewController *)self _configurationForSeries:a3];
  char v5 = [v4 displayType];
  BOOL v6 = objc_msgSend(v5, "hk_interactiveChartsFormatterForTimeScope:", -[HKInteractiveChartViewController _dateZoom](self, "_dateZoom"));
  [v6 setMajorFont:self->_majorSelectedPointFont];
  [v6 setMinorFont:self->_minorSelectedPointFont];
  char v7 = [(HKInteractiveChartViewController *)self unitPreferenceController];
  [v6 setUnitController:v7];

  id v8 = [v4 displayType];
  [v6 setDisplayType:v8];

  return v6;
}

- (BOOL)_primaryDisplayTypeHasNoData
{
  uint64_t v3 = [(HKInteractiveChartViewController *)self sampleTypeDateRangeController];
  id v4 = [v3 dateRangesBySampleType];

  if (v4)
  {
    char v5 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
    BOOL v6 = [v5 sampleType];
    char v7 = [v3 dateRangeForSampleType:v6];
    id v8 = [v7 minValue];
    if (v8)
    {
    }
    else
    {
      id v9 = [v7 maxValue];

      if (!v9)
      {
        BOOL v10 = 1;
        goto LABEL_6;
      }
    }
  }
  BOOL v10 = 0;
LABEL_6:

  return v10;
}

- (void)updateCurrentValueViewWithVisibleRange
{
  if ([(HKInteractiveChartViewController *)self _currentValueEnabled]
    && ![(HKInteractiveChartViewController *)self disableCurrentValueViewForInitialLollipop])
  {
    id v6 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
    int64_t v3 = [(HKInteractiveChartViewController *)self _dateZoom];
    BOOL v4 = [(HKInteractiveChartViewController *)self _showInfoButtonInCurrentValueView];
    char v5 = [(HKInteractiveChartViewController *)self currentValueViewHandler];
    [v5 updateCurrentValueView:self->_currentValueView graphView:v6 timeScope:v3 showInfoButton:v4];
  }
}

- (void)_automaticAutoScale
{
  if ((self->_options & 4) == 0)
  {
    int64_t v3 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
    if (([v3 isScrollViewDecelerating] & 1) == 0)
    {
      BOOL v4 = [(HKGraphViewController *)self->_primaryGraphViewController graphView];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __55__HKInteractiveChartViewController__automaticAutoScale__block_invoke;
      v5[3] = &unk_1E6D50ED8;
      v5[4] = self;
      [v4 autoscaleYAxesAnimated:1 specificRange:0 onlyIfNeeded:0 completion:v5];
    }
  }
}

uint64_t __55__HKInteractiveChartViewController__automaticAutoScale__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCurrentValueViewWithVisibleRange];
}

- (id)_defaultAxisRangeIncludeToday:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [(HKInteractiveChartViewController *)self sampleTypeDateRangeController];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  char v7 = [(HKInteractiveChartViewController *)self _allDisplayTypes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v8)
  {
    BOOL v10 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  BOOL v10 = 0;
  uint64_t v11 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      uint64_t v14 = [v13 defaultDataRange];
      if (v14)
      {
        if (v10) {
          goto LABEL_8;
        }
      }
      else
      {
        uint64_t v15 = [v13 sampleType];
        uint64_t v14 = [v6 dateRangeForSampleType:v15];

        if (v10)
        {
LABEL_8:
          [v10 unionRange:v14];
          goto LABEL_11;
        }
      }
      BOOL v10 = (void *)[v14 copy];
LABEL_11:
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v9);
LABEL_15:

  if (v3)
  {
    uint64_t v16 = +[HKValueRange valueRangeWithMinValue:v5 maxValue:v5];
    int v17 = v16;
    if (v10) {
      [v10 unionRange:v16];
    }
    else {
      BOOL v10 = (void *)[v16 copy];
    }
  }
  uint64_t v18 = [v10 endDate];
  int v19 = objc_msgSend(v18, "hk_isAfterDate:", v5);

  if (v19) {
    [v10 setMaxValue:v5];
  }

  return v10;
}

- (id)_dateForMostRecentData
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [(HKInteractiveChartViewController *)self currentCalendar];
  long long v23 = (void *)v3;
  char v5 = objc_msgSend(v4, "hk_startOfTomorrowForDate:", v3);

  long long v22 = [(HKInteractiveChartViewController *)self sampleTypeDateRangeController];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = [(HKInteractiveChartViewController *)self _allDisplayTypes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = [v12 defaultDataRange];
        if (!v13)
        {
          uint64_t v14 = [v12 sampleType];
          uint64_t v13 = [v22 dateRangeForSampleType:v14];
        }
        uint64_t v15 = [v13 endDate];
        uint64_t v16 = [MEMORY[0x1E4F1C9C8] distantFuture];
        int v17 = [v15 isEqualToDate:v16];

        if (v17)
        {
          id v18 = v23;

          uint64_t v15 = v18;
        }
        if (v15
          && objc_msgSend(v15, "hk_isBeforeOrEqualToDate:", v5)
          && (!v9 || objc_msgSend(v15, "hk_isAfterDate:", v9)))
        {
          id v19 = v15;

          uint64_t v9 = v19;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  id v20 = v9;
  return v20;
}

- (void)_updateGraphViewAxisDateRange
{
  primaryGraphViewController = self->_primaryGraphViewController;
  if (!primaryGraphViewController) {
    return;
  }
  uint64_t v4 = [(HKGraphViewController *)primaryGraphViewController dateZoom];
  if ([(HKInteractiveChartViewController *)self firstSampleDateRangeUpdate])
  {
    char v5 = [(HKInteractiveChartViewController *)self trendAccessibilityDelegate];
    id v6 = [v5 trendAccessibilitySeries];

    if (!v6)
    {
      uint64_t v17 = [(HKInteractiveChartViewController *)self initialXValue];
      if (v17
        && (id v18 = (void *)v17,
            [(HKInteractiveChartViewController *)self initialXValue],
            id v19 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v19,
            v18,
            (isKindOfClass & 1) != 0))
      {
        uint64_t v21 = [(HKInteractiveChartViewController *)self initialXValue];
      }
      else
      {
        uint64_t v21 = [(HKInteractiveChartViewController *)self _dateForMostRecentData];
      }
      id v22 = (id)v21;
      [(HKInteractiveChartViewController *)self _setGraphViewAxisAndVisibleDateRangeForTimeScope:v4 anchorDate:v21 preserveScrollPosition:0];
      goto LABEL_12;
    }
  }
  uint64_t v7 = [(HKInteractiveChartViewController *)self _defaultAxisRangeIncludeToday:[(HKInteractiveChartViewController *)self firstSampleDateRangeUpdate] ^ 1];
  uint64_t v8 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  uint64_t v9 = [v8 graphView];
  uint64_t v10 = [v9 actualVisibleRange];

  if (v7 && v10)
  {
    uint64_t v11 = [v10 startDate];
    double v12 = [v10 endDate];
    uint64_t v13 = [v7 startDate];
    uint64_t v14 = [v7 endDate];
    if (objc_msgSend(v14, "hk_isBeforeDate:", v11))
    {
    }
    else
    {
      char v15 = objc_msgSend(v13, "hk_isAfterDate:", v12);

      if ((v15 & 1) == 0)
      {
        id v22 = 0;
        uint64_t v16 = 1;
        goto LABEL_11;
      }
    }
  }
  id v22 = [(HKInteractiveChartViewController *)self _dateForMostRecentData];
  uint64_t v16 = 0;
LABEL_11:

  [(HKInteractiveChartViewController *)self _setGraphViewAxisAndVisibleDateRangeForTimeScope:v4 anchorDate:v22 preserveScrollPosition:v16];
LABEL_12:
}

- (void)sampleTypeDateRangeController:(id)a3 didUpdateDateRanges:(id)a4
{
  [(HKInteractiveChartViewController *)self _updateGraphViewAxisDateRange];
  [(HKInteractiveChartViewController *)self setFirstSampleDateRangeUpdate:0];
}

- (void)selectTimeScope:(int64_t)a3
{
  [(HKTimeScopeControl *)self->_radioButtons setSelectedTimeScope:a3];
  radioButtons = self->_radioButtons;
  [(HKInteractiveChartViewController *)self _radioButtonsDidUpdate:radioButtons];
}

- (void)setRestorationUserActivity:(id)a3
{
}

- (id)restorationStateDictionary
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
  char v5 = [(HKInteractiveChartViewController *)self healthStore];
  id v6 = [v3 standardChartRestorationDictionary:v4 healthStore:v5];

  return v6;
}

- (void)saveRestorationState
{
  id v6 = [(HKInteractiveChartViewController *)self restorationStateDictionary];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(HKInteractiveChartViewController *)self _primaryDisplayType];
  char v5 = [v3 standardChartRestorationActivity:v6 primaryDisplayType:v4];

  [(id)objc_opt_class() saveRestorationUserActivity:v5 viewController:self];
}

+ (id)standardChartRestorationDictionary:(id)a3 healthStore:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  uint64_t v10 = [a1 _encodeCurrentProfileIdentifierForHealthStore:v8];

  [v9 setObject:v10 forKeyedSubscript:@"profileIdentifier"];
  uint64_t v11 = [v6 objectType];
  uint64_t v12 = [v11 code];

  uint64_t v13 = [v6 categoryIdentifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v6;
    char v15 = [v14 baseDisplayType];

    if (v15)
    {
      uint64_t v16 = [v14 baseDisplayType];
      uint64_t v17 = [v16 objectType];
      uint64_t v12 = [v17 code];

      id v18 = [v14 baseDisplayType];
      uint64_t v13 = [v18 categoryIdentifier];
    }
  }
  id v19 = [NSNumber numberWithInteger:v12];
  [v9 setObject:v19 forKeyedSubscript:@"dataTypeCode"];

  id v20 = [NSNumber numberWithInteger:v13];
  [v9 setObject:v20 forKeyedSubscript:@"displayCategoryID"];

  return v9;
}

+ (id)_encodeCurrentProfileIdentifierForHealthStore:(id)a3
{
  uint64_t v3 = [a3 profileIdentifier];
  id v9 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      +[HKInteractiveChartViewController _encodeCurrentProfileIdentifierForHealthStore:]((uint64_t)v5, v7);
    }
  }

  return v4;
}

+ (id)mergeRestorationDictionary:(id)a3 otherDictionary:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v14 = [v8 objectForKeyedSubscript:v13];
        [v7 setObject:v14 forKeyedSubscript:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        uint64_t v21 = objc_msgSend(v15, "objectForKeyedSubscript:", v20, (void)v23);
        [v7 setObject:v21 forKeyedSubscript:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  return v7;
}

+ (id)standardChartRestorationActivity:(id)a3 primaryDisplayType:(id)a4
{
  id v6 = NSString;
  id v7 = a3;
  id v8 = [a4 localization];
  uint64_t v9 = [v8 displayName];
  uint64_t v10 = [v6 stringWithFormat:@"Chart(%@)", v9];

  uint64_t v11 = [a1 baseRestorationUserActivity:v7 activityType:@"com.apple.health.view.data" title:v10];

  return v11;
}

+ (id)baseRestorationUserActivity:(id)a3 activityType:(id)a4 title:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = (objc_class *)MEMORY[0x1E4F22488];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[[v7 alloc] initWithActivityType:v9];

  [v11 setEligibleForSearch:0];
  [v11 setEligibleForHandoff:1];
  [v11 setEligibleForPrediction:0];
  [v11 setTitle:v8];

  [v11 setUserInfo:v10];
  v15[0] = @"versionKey";
  v15[1] = @"DateSavedAppState";
  v16[0] = &unk_1F3C220A8;
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
  v16[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  [v11 addUserInfoEntriesFromDictionary:v13];
  return v11;
}

+ (void)saveRestorationUserActivity:(id)a3 viewController:(id)a4
{
  id v5 = a3;
  id v6 = [a4 view];
  id v7 = [v6 window];

  if (v7 && ([v7 windowScene], id v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    id v9 = [v7 windowScene];
    [v9 setUserActivity:v5];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      +[HKInteractiveChartViewController saveRestorationUserActivity:viewController:]();
    }
  }
}

- (NSString)chartOverlayVersion
{
  return (NSString *)@"no overlays";
}

- (int64_t)annotationDataSourceFirstWeekday
{
  if (self->_annotationDataSourceFirstWeekday != -1) {
    return self->_annotationDataSourceFirstWeekday;
  }
  uint64_t v3 = [(HKInteractiveChartViewController *)self currentCalendar];
  int64_t v4 = [v3 firstWeekday];

  return v4;
}

- (HKGraphViewController)primaryGraphViewController
{
  return self->_primaryGraphViewController;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (HKSelectedTimeScopeController)selectedTimeScopeController
{
  return self->_selectedTimeScopeController;
}

- (HKSelectedRangeFormatter)selectedRangeFormatter
{
  return self->_selectedRangeFormatter;
}

- (void)setSelectedRangeFormatter:(id)a3
{
}

- (HKChartDataCacheController)chartDataCacheController
{
  return self->_chartDataCacheController;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (HKSampleTypeDateRangeController)sampleTypeDateRangeController
{
  return self->_sampleTypeDateRangeController;
}

- (HKInteractiveChartCurrentValueViewHandler)currentValueViewHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentValueViewHandler);
  return (HKInteractiveChartCurrentValueViewHandler *)WeakRetained;
}

- (void)setCurrentValueViewHandler:(id)a3
{
}

- (HKCurrentValueViewDataSourceDelegate)currentValueViewDataSourceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentValueViewDataSourceDelegate);
  return (HKCurrentValueViewDataSourceDelegate *)WeakRetained;
}

- (HKCurrentOverlayLocationProviding)currentOverlayLocationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentOverlayLocationProvider);
  return (HKCurrentOverlayLocationProviding *)WeakRetained;
}

- (void)setCurrentOverlayLocationProvider:(id)a3
{
}

- (NSUserActivity)restorationUserActivity
{
  return self->_restorationUserActivity;
}

- (void)setAnnotationDataSourceFirstWeekday:(int64_t)a3
{
  self->_annotationDataSourceFirstWeekdadouble y = a3;
}

- (int64_t)primaryDisplayTypeStackIndex
{
  return self->_primaryDisplayTypeStackIndex;
}

- (NSArray)stackedDisplayTypeHeights
{
  return self->_stackedDisplayTypeHeights;
}

- (unint64_t)options
{
  return self->_options;
}

- (HKInteractiveChartAnnotationViewDataSourceProtocol)annotationDataSource
{
  return self->_annotationDataSource;
}

- (void)setAnnotationDataSource:(id)a3
{
}

- (HKTrendAccessibilityDelegate)trendAccessibilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trendAccessibilityDelegate);
  return (HKTrendAccessibilityDelegate *)WeakRetained;
}

- (void)setTrendAccessibilityDelegate:(id)a3
{
}

- (HKLollipopController)lollipopController
{
  return self->_lollipopController;
}

- (void)setLollipopController:(id)a3
{
}

- (double)legendBottomLocation
{
  return self->_legendBottomLocation;
}

- (void)setLegendBottomLocation:(double)a3
{
  self->_legendBottomLocation = a3;
}

- (NSArray)displayTypeStack
{
  return self->_displayTypeStack;
}

- (void)setDisplayTypeStack:(id)a3
{
}

- (HKCurrentValueViewDataSource)currentValueViewDataSource
{
  return self->_currentValueViewDataSource;
}

- (void)setCurrentValueViewDataSource:(id)a3
{
}

- (id)initialXValue
{
  return self->_initialXValue;
}

- (void)setInitialXValue:(id)a3
{
}

- (BOOL)firstSampleDateRangeUpdate
{
  return self->_firstSampleDateRangeUpdate;
}

- (void)setFirstSampleDateRangeUpdate:(BOOL)a3
{
  self->_firstSampleDateRangeUpdate = a3;
}

- (int64_t)delayedAutoscaleRequestCount
{
  return self->_delayedAutoscaleRequestCount;
}

- (void)setDelayedAutoscaleRequestCount:(int64_t)a3
{
  self->_delayedAutoscaleRequestCount = a3;
}

- (int64_t)delayedAutoscaleActualCount
{
  return self->_delayedAutoscaleActualCount;
}

- (void)setDelayedAutoscaleActualCount:(int64_t)a3
{
  self->_delayedAutoscaleActualCount = a3;
}

- (id)startupReportingBlock
{
  return self->_startupReportingBlock;
}

- (void)setStartupReportingBlock:(id)a3
{
}

- (HKInteractiveChartCurrentValueViewCallbacks)standardCurrentValueViewCallbacks
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_standardCurrentValueViewCallbacks);
  return (HKInteractiveChartCurrentValueViewCallbacks *)WeakRetained;
}

- (void)setStandardCurrentValueViewCallbacks:(id)a3
{
}

- (BOOL)disableCurrentValueViewForInitialLollipop
{
  return self->_disableCurrentValueViewForInitialLollipop;
}

- (void)setDisableCurrentValueViewForInitialLollipop:(BOOL)a3
{
  self->_disableCurrentValueViewForInitialLollipop = a3;
}

- (BOOL)hasInitialDateRangeAndTimeScope
{
  return self->_hasInitialDateRangeAndTimeScope;
}

- (void)setHasInitialDateRangeAndTimeScope:(BOOL)a3
{
  self->_hasInitialDateRangeAndTimeScope = a3;
}

- (NSDictionary)timeScopeRanges
{
  return self->_timeScopeRanges;
}

- (void)setTimeScopeRanges:(id)a3
{
}

- (id)chartHasDataCompletion
{
  return self->_chartHasDataCompletion;
}

- (void)setChartHasDataCompletion:(id)a3
{
}

- (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong(&self->_chartHasDataCompletion, 0);
  objc_storeStrong((id *)&self->_timeScopeRanges, 0);
  objc_destroyWeak((id *)&self->_standardCurrentValueViewCallbacks);
  objc_storeStrong(&self->_startupReportingBlock, 0);
  objc_storeStrong(&self->_initialXValue, 0);
  objc_storeStrong((id *)&self->_currentValueViewDataSource, 0);
  objc_storeStrong((id *)&self->_displayTypeStack, 0);
  objc_storeStrong((id *)&self->_lollipopController, 0);
  objc_destroyWeak((id *)&self->_trendAccessibilityDelegate);
  objc_storeStrong((id *)&self->_annotationDataSource, 0);
  objc_storeStrong((id *)&self->_stackedDisplayTypeHeights, 0);
  objc_storeStrong((id *)&self->_restorationUserActivity, 0);
  objc_destroyWeak((id *)&self->_currentOverlayLocationProvider);
  objc_destroyWeak((id *)&self->_currentValueViewDataSourceDelegate);
  objc_destroyWeak((id *)&self->_currentValueViewHandler);
  objc_storeStrong((id *)&self->_sampleTypeDateRangeController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_chartDataCacheController, 0);
  objc_storeStrong((id *)&self->_selectedRangeFormatter, 0);
  objc_storeStrong((id *)&self->_selectedTimeScopeController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_primaryGraphViewSnapshot, 0);
  objc_storeStrong((id *)&self->_primaryGraphViewController, 0);
  objc_storeStrong((id *)&self->_primaryGraphViewWrapper, 0);
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectedPointDateLabel, 0);
  objc_storeStrong((id *)&self->_minorSelectedPointFont, 0);
  objc_storeStrong((id *)&self->_majorSelectedPointFont, 0);
  objc_storeStrong((id *)&self->_allGraphSeriesConfigurationManagers, 0);
  objc_storeStrong((id *)&self->_dashboardEmptyDescription, 0);
  objc_storeStrong((id *)&self->_dashboardEmptyHeader, 0);
  objc_storeStrong((id *)&self->_graphBottomDividerView, 0);
  objc_storeStrong((id *)&self->_graphTopDividerView, 0);
  objc_storeStrong((id *)&self->_currentValueView, 0);
  objc_storeStrong((id *)&self->_currentTimeView, 0);
  objc_storeStrong((id *)&self->_radioButtons, 0);
  objc_storeStrong((id *)&self->_selectedSeriesUnitLabel, 0);
  objc_storeStrong((id *)&self->_selectedSeriesLabel, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)_validateStackedHeights:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "HKInteractiveChartViewController: stacked height proportions do not sum to one: %lg", (uint8_t *)&v2, 0xCu);
}

- (void)interactiveChartHasData:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl(&dword_1E0B26000, v0, OS_LOG_TYPE_ERROR, "Only one outstanding completion block is supported by interactiveChartHasData", v1, 2u);
}

- (void)_setGraphViewAxisAndVisibleDateRangeForTimeScope:(uint64_t)a1 anchorDate:(uint64_t)a2 preserveScrollPosition:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1E0B26000, log, OS_LOG_TYPE_DEBUG, "HKInteractiveChartViewController(%p): ChartDataUpdate: setting new axis range %@", (uint8_t *)&v3, 0x16u);
}

- (void)_displayNameForDisplayType:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  _os_log_fault_impl(&dword_1E0B26000, v0, OS_LOG_TYPE_FAULT, "result when trying to generate display name for display type was nil.", v1, 2u);
}

- (void)_configureCustomDisplayType:graphSeries:configurationManager:timeScope:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  _os_log_fault_impl(&dword_1E0B26000, v0, OS_LOG_TYPE_FAULT, "Invalid timescope passed into graph series configuration", v1, 2u);
}

- (void)graphView:(uint64_t)a1 didUpdateSeries:(NSObject *)a2 newDataArrived:changeContext:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_DEBUG, "HKInteractiveChartViewController(%p): ChartDataUpdate: new data has arrived", (uint8_t *)&v2, 0xCu);
}

+ (void)_encodeCurrentProfileIdentifierForHealthStore:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Unable to encode profile information: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)saveRestorationUserActivity:viewController:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl(&dword_1E0B26000, v0, OS_LOG_TYPE_ERROR, "Unable to save chart restoration because window and scene are nil", v1, 2u);
}

@end