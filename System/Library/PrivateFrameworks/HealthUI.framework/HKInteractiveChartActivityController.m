@interface HKInteractiveChartActivityController
+ (id)_activitySummariesFromCodableCollection:(id)a3;
+ (id)_activitySummaryFromCodableSummaryEntry:(id)a3;
+ (id)_codableActivitySummaryDataFromSummaries:(id)a3;
+ (id)_codableActivitySummaryFromSummary:(id)a3;
+ (id)firstActivitySeriesForGraphView:(id)a3;
+ (void)encodeChartDataWithHealthStore:(id)a3 dateCache:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 activityMoveMode:(int64_t)a7 monthDateInterval:(id)a8 sixMonthDateInterval:(id)a9 completion:(id)a10;
- (BOOL)chartDataIsAvailable;
- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3;
- (BOOL)isChartSharingContext;
- (HKActivitySummaryAnnotationViewDataSource)activityAnnotationDataSource;
- (HKActivitySummaryDataProvider)activityDataProvider;
- (HKInteractiveChartActivityController)initWithHealthStore:(id)a3 unitPreferenceController:(id)a4 dateCache:(id)a5 chartDataCacheController:(id)a6 selectedTimeScopeController:(id)a7 sampleTypeDateRangeController:(id)a8 wheelchairUseCharacteristicCache:(id)a9 initialXValue:(id)a10 activityMoveMode:(int64_t)a11 activityOptions:(unint64_t)a12 chartSharableModel:(id)a13;
- (HKInteractiveChartCurrentValueViewCallbacks)activityCurrentValueViewCallbacks;
- (HKInteractiveChartDisplayType)exerciseGoalDisplayType;
- (HKInteractiveChartDisplayType)exerciseValueDisplayType;
- (HKInteractiveChartDisplayType)moveGoalDisplayType;
- (HKInteractiveChartDisplayType)moveValueDisplayType;
- (HKInteractiveChartDisplayType)standGoalDisplayType;
- (HKInteractiveChartDisplayType)standValueDisplayType;
- (NSMapTable)yAxisAccessoryViewsByGraphSeries;
- (_ActivityCurrentValueView)activityCurrentValueView;
- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache;
- (id)_activityLollipopBackgroundColor;
- (id)_activitySeriesForActivityValue:(int64_t)a3 wheelchairUseCharacteristicCache:(id)a4 unitPreferenceController:(id)a5 displayTypeController:(id)a6 activityOptions:(unint64_t)a7;
- (id)_activityYAxisForActivityValue:(int64_t)a3 zeroOnly:(BOOL)a4 stackOffset:(int64_t)a5 bottomLabelPadding:(double)a6 displayTypeController:(id)a7 unitPreferenceController:(id)a8;
- (id)_buildSummariesTableFromSharableModel:(id)a3;
- (id)_dayActivitySummaryForDateRange:(id)a3;
- (id)_decodeActivitySummariesFromQueryData:(id)a3;
- (id)_displayTypeForActivityValue:(int64_t)a3 yAxis:(id)a4 dataProvider:(id)a5 displayTypeController:(id)a6 unitPreferenceController:(id)a7 wheelchairUseCharacteristicCache:(id)a8 timescopeToSummariesTable:(id)a9 activityOptions:(unint64_t)a10;
- (id)_displayTypeForUnits:(int64_t)a3 displayTypeController:(id)a4;
- (id)_generateActivityBarSeriesWithColor:(id)a3 legendTitle:(id)a4 metGoalFillStyle:(id)a5 missedGoalFillStyle:(id)a6 pausedFillStyle:(id)a7 activityValue:(int64_t)a8 unitPreferenceController:(id)a9 displayTypeController:(id)a10 drawLegendsInsideSeries:(BOOL)a11;
- (id)_generateActivityGoalLineSeriesWithColor:(id)a3;
- (id)_lineColorForActivityValue:(int64_t)a3;
- (id)_metGoalFillStyleForActivityValue:(int64_t)a3 useGradient:(BOOL)a4;
- (id)_missedGoalFillStyleForActivityValue:(int64_t)a3 useGradient:(BOOL)a4;
- (id)_pausedFillStyleForActivityValue:(int64_t)a3;
- (id)_rangeValueAsNumber:(id)a3;
- (id)_spanForValueDisplayType:(id)a3 timeScope:(int64_t)a4 title:(id)a5;
- (id)_timeScopeRangesFromSharableModel:(id)a3;
- (id)_titleForActivityValue:(int64_t)a3 wheelchairUseCharacteristicCache:(id)a4;
- (id)_unitForActivityValue:(int64_t)a3 displayTypeController:(id)a4 unitPreferenceController:(id)a5;
- (id)_zeroStringForActivityValue:(int64_t)a3 displayTypeController:(id)a4 unitPreferenceController:(id)a5;
- (id)activitySummaryForCurrentRange;
- (id)buildFactorContextForDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8;
- (id)calendarQueryDisplayType;
- (id)calendarQuerySampleType;
- (id)dataSourceForCurrentValueViewString;
- (id)descriptionForChartData:(id)a3 timeScope:(int64_t)a4;
- (id)descriptionSeriesForGraphView:(id)a3;
- (id)descriptionSpansForGraphView:(id)a3 timeScope:(int64_t)a4;
- (id)lollipopAnnotationColor;
- (id)makeAnnotationDataSource;
- (id)makeCurrentValueView;
- (id)seriesSelectionLineColorForGraphView:(id)a3;
- (int64_t)_countOfStackedChartsFromActivityOptions:(unint64_t)a3;
- (int64_t)_findFirstWeekdayFromModel:(id)a3;
- (int64_t)_representativeDataTypeForActivityValue:(int64_t)a3;
- (int64_t)currentTimeScope;
- (int64_t)graphSeriesTimeScope;
- (unint64_t)activityOptions;
- (void)_handleAlternateAnnotationDataViewDataSource:(id)a3;
- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5;
- (void)didUpdateFromDateZoom:(int64_t)a3 toDateZoom:(int64_t)a4 newVisibleRange:(id)a5;
- (void)setActivityAnnotationDataSource:(id)a3;
- (void)setActivityCurrentValueView:(id)a3;
- (void)setActivityCurrentValueViewCallbacks:(id)a3;
- (void)setActivityDataProvider:(id)a3;
- (void)setCurrentTimeScope:(int64_t)a3;
- (void)setCurrentValueViewCallbacks:(id)a3;
- (void)setYAxisAccessoryViewsByGraphSeries:(id)a3;
- (void)tappedOnCurrentValueView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCurrentValueView:(id)a3 graphView:(id)a4 timeScope:(int64_t)a5 showInfoButton:(BOOL)a6;
- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6;
@end

@implementation HKInteractiveChartActivityController

- (HKInteractiveChartActivityController)initWithHealthStore:(id)a3 unitPreferenceController:(id)a4 dateCache:(id)a5 chartDataCacheController:(id)a6 selectedTimeScopeController:(id)a7 sampleTypeDateRangeController:(id)a8 wheelchairUseCharacteristicCache:(id)a9 initialXValue:(id)a10 activityMoveMode:(int64_t)a11 activityOptions:(unint64_t)a12 chartSharableModel:(id)a13
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v84 = a4;
  id v20 = a5;
  id v80 = a9;
  id v21 = a13;
  id v73 = a10;
  id v72 = a8;
  id v71 = a7;
  id v70 = a6;
  v83 = v19;
  uint64_t v22 = +[HKDisplayTypeController sharedInstanceForHealthStore:v19];
  if (v21)
  {
    v23 = [(HKInteractiveChartActivityController *)self _buildSummariesTableFromSharableModel:v21];
    v79 = [(HKInteractiveChartActivityController *)self _timeScopeRangesFromSharableModel:v21];
    v82 = v23;
    v24 = [v23 objectForKeyedSubscript:&unk_1F3C224B0];
    v25 = [v24 firstObject];

    int64_t v26 = a11;
    if (v25) {
      int64_t v26 = [v25 activityMoveMode];
    }
    int64_t v67 = [(HKInteractiveChartActivityController *)self _findFirstWeekdayFromModel:v21];

    id v27 = v20;
  }
  else
  {
    v79 = 0;
    v82 = 0;
    int64_t v67 = -1;
    id v27 = v20;
    int64_t v26 = a11;
  }
  v28 = [[HKActivitySummaryDataProvider alloc] initWithHealthStore:v83 dateCache:v27 displayTypeController:v22 unitController:v84 activityMoveMode:v26];
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v30 = a12;
  int64_t v31 = [(HKInteractiveChartActivityController *)self _countOfStackedChartsFromActivityOptions:a12];
  id v78 = v21;
  v74 = v27;
  v81 = v29;
  uint64_t v69 = v31;
  if (a12)
  {
    uint64_t v36 = 0;
    id v76 = 0;
    id v35 = v80;
  }
  else
  {
    if (v26 == 2) {
      uint64_t v32 = 5;
    }
    else {
      uint64_t v32 = 4;
    }
    v33 = [(HKInteractiveChartActivityController *)self _activityYAxisForActivityValue:v26 == 2 zeroOnly:v31 > 1 stackOffset:0 bottomLabelPadding:v22 displayTypeController:v84 unitPreferenceController:0.0];
    BOOL v34 = v26 == 2;
    id v35 = v80;
    uint64_t v36 = [(HKInteractiveChartActivityController *)self _displayTypeForActivityValue:v34 yAxis:v33 dataProvider:v28 displayTypeController:v22 unitPreferenceController:v84 wheelchairUseCharacteristicCache:v80 timescopeToSummariesTable:v82 activityOptions:a12];
    [(HKInteractiveChartActivityController *)self _displayTypeForActivityValue:v32 yAxis:v33 dataProvider:v28 displayTypeController:v22 unitPreferenceController:v84 wheelchairUseCharacteristicCache:v80 timescopeToSummariesTable:v82 activityOptions:a12];
    v89 = uint64_t v88 = v36;
    id v76 = (id)v89;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:2];
    [v29 addObject:v37];

    unint64_t v30 = a12;
  }
  v38 = (void *)v22;
  id obj = (id)v36;
  if ((v30 & 2) != 0)
  {
    uint64_t v40 = 0;
    uint64_t v41 = 0;
  }
  else
  {
    v39 = [(HKInteractiveChartActivityController *)self _activityYAxisForActivityValue:2 zeroOnly:v69 > 1 stackOffset:1 bottomLabelPadding:v22 displayTypeController:v84 unitPreferenceController:0.0];
    uint64_t v40 = [(HKInteractiveChartActivityController *)self _displayTypeForActivityValue:2 yAxis:v39 dataProvider:v28 displayTypeController:v22 unitPreferenceController:v84 wheelchairUseCharacteristicCache:v35 timescopeToSummariesTable:v82 activityOptions:v30];
    v38 = (void *)v22;
    uint64_t v41 = [(HKInteractiveChartActivityController *)self _displayTypeForActivityValue:6 yAxis:v39 dataProvider:v28 displayTypeController:v22 unitPreferenceController:v84 wheelchairUseCharacteristicCache:v35 timescopeToSummariesTable:v82 activityOptions:v30];
    v87[0] = v40;
    v87[1] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
    [v81 addObject:v42];

    unint64_t v30 = a12;
  }
  id v75 = (id)v40;
  v68 = (void *)v41;
  if ((v30 & 4) != 0)
  {
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    v48 = v78;
    v47 = v81;
  }
  else
  {
    v43 = [(HKInteractiveChartActivityController *)self _activityYAxisForActivityValue:3 zeroOnly:v69 > 1 stackOffset:2 bottomLabelPadding:v38 displayTypeController:v84 unitPreferenceController:5.0];
    uint64_t v44 = [(HKInteractiveChartActivityController *)self _displayTypeForActivityValue:3 yAxis:v43 dataProvider:v28 displayTypeController:v38 unitPreferenceController:v84 wheelchairUseCharacteristicCache:v35 timescopeToSummariesTable:v82 activityOptions:v30];
    uint64_t v45 = [(HKInteractiveChartActivityController *)self _displayTypeForActivityValue:7 yAxis:v43 dataProvider:v28 displayTypeController:v38 unitPreferenceController:v84 wheelchairUseCharacteristicCache:v35 timescopeToSummariesTable:v82 activityOptions:v30];
    v86[0] = v44;
    v86[1] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
    v47 = v81;
    [v81 addObject:v46];

    v48 = v78;
  }
  v49 = (void *)v45;
  if ((unint64_t)[v47 count] >= 4)
  {
    v64 = [MEMORY[0x1E4F28B00] currentHandler];
    [v64 handleFailureInMethod:a2 object:self file:@"HKInteractiveChartActivityController.m" lineNumber:469 description:@"Unexpected stacked charts count for activity summary"];
  }
  unint64_t v50 = [v47 count];
  uint64_t v51 = 12288;
  if (v50 > 1) {
    uint64_t v51 = 77824;
  }
  if (v48) {
    v51 |= 0x20000uLL;
  }
  v85.receiver = self;
  v85.super_class = (Class)HKInteractiveChartActivityController;
  v52 = v84;
  v53 = [(HKInteractiveChartOverlayViewController *)&v85 initWithStackedDisplayTypes:v47 primaryDisplayTypeStackIndex:0 stackedDisplayTypeHeights:0 healthStore:v83 unitPreferenceController:v84 dateCache:v74 chartDataCacheController:v70 selectedTimeScopeController:v71 sampleTypeDateRangeController:v72 initialXValue:v73 currentCalendarOverride:0 options:v51 timeScopeRanges:v79];

  v54 = (void *)v44;
  v55 = v28;
  if (v53)
  {
    objc_storeStrong((id *)&v53->_moveValueDisplayType, obj);
    objc_storeStrong((id *)&v53->_moveGoalDisplayType, v76);
    objc_storeStrong((id *)&v53->_exerciseValueDisplayType, v75);
    objc_storeStrong((id *)&v53->_exerciseGoalDisplayType, v68);
    objc_storeStrong((id *)&v53->_standValueDisplayType, v54);
    objc_storeStrong((id *)&v53->_standGoalDisplayType, v49);
    objc_storeStrong((id *)&v53->_activityDataProvider, v28);
    v53->_isChartSharingContext = v48 != 0;
    v56 = [HKActivitySummaryAnnotationViewDataSource alloc];
    v57 = [(HKInteractiveChartViewController *)v53 displayTypeController];
    LOBYTE(v65) = v53->_isChartSharingContext;
    v58 = v56;
    v52 = v84;
    uint64_t v59 = [(HKActivitySummaryAnnotationViewDataSource *)v58 initWithDisplayTypeController:v57 unitController:v84 wheelchairUseCharacteristicCache:v80 dateCache:v74 currentValueViewContext:0 activityOptions:a12 firstWeekday:v67 isChartSharingContext:v65];
    activityAnnotationDataSource = v53->_activityAnnotationDataSource;
    v53->_activityAnnotationDataSource = (HKActivitySummaryAnnotationViewDataSource *)v59;

    v48 = v78;
    v55 = v28;
    [(HKActivitySummaryAnnotationViewDataSource *)v53->_activityAnnotationDataSource setActivitySummary:0];
    v53->_currentTimeScope = 2;
    uint64_t v61 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    yAxisAccessoryViewsByGraphSeries = v53->_yAxisAccessoryViewsByGraphSeries;
    v53->_yAxisAccessoryViewsByGraphSeries = (NSMapTable *)v61;

    objc_storeStrong((id *)&v53->_wheelchairUseCharacteristicCache, a9);
    v53->_activityOptions = a12;
    [(HKInteractiveChartViewController *)v53 addChartViewObserver:v53];
  }

  return v53;
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKInteractiveChartActivityController;
  id v4 = a3;
  [(HKInteractiveChartViewController *)&v10 traitCollectionDidChange:v4];
  v5 = [(HKInteractiveChartActivityController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    v8 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
    v9 = [v8 graphView];
    [v9 resetAndRedraw];
  }
}

- (id)buildFactorContextForDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [_ActivityFactorContext alloc];
  id v20 = [(HKInteractiveChartActivityController *)self activityCurrentValueView];
  id v21 = [(_ActivityFactorContext *)v19 initWithPrimaryDisplayType:v18 factorDisplayType:v17 overlayChartController:v16 currentCalendarOverride:v15 applicationItems:v14 overlayMode:a8 activityCurrentValueView:v20];

  return v21;
}

- (id)_buildSummariesTableFromSharableModel:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v4 hasSixMonthData])
  {
    uint64_t v6 = [v4 sixMonthData];
    uint64_t v7 = [(HKInteractiveChartActivityController *)self _decodeActivitySummariesFromQueryData:v6];
    [v5 setObject:v7 forKeyedSubscript:&unk_1F3C224C8];
  }
  if ([v4 hasMonthData])
  {
    v8 = [v4 monthData];
    v9 = [(HKInteractiveChartActivityController *)self _decodeActivitySummariesFromQueryData:v8];
    [v5 setObject:v9 forKeyedSubscript:&unk_1F3C224B0];
  }
  return v5;
}

- (id)_decodeActivitySummariesFromQueryData:(id)a3
{
  id v3 = a3;
  id v4 = [HKCodableActivitySummaryCollection alloc];
  id v5 = [v3 queryDataObject];

  uint64_t v6 = [(HKCodableActivitySummaryCollection *)v4 initWithData:v5];
  uint64_t v7 = +[HKInteractiveChartActivityController _activitySummariesFromCodableCollection:v6];

  return v7;
}

- (id)_timeScopeRangesFromSharableModel:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C18];
  id v4 = a3;
  id v5 = [v4 monthDateInterval];
  uint64_t v6 = objc_msgSend(v3, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v5, 0);

  uint64_t v7 = (void *)MEMORY[0x1E4F28C18];
  v8 = [v4 sixMonthDateInterval];

  v9 = objc_msgSend(v7, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v8, 0);

  objc_super v10 = [v6 startDate];
  v11 = [v6 endDate];
  v12 = +[HKValueRange valueRangeWithMinValue:v10 maxValue:v11];

  v13 = [v9 startDate];
  id v14 = [v9 endDate];
  id v15 = +[HKValueRange valueRangeWithMinValue:v13 maxValue:v14];

  v18[0] = &unk_1F3C224B0;
  v18[1] = &unk_1F3C224C8;
  v19[0] = v12;
  v19[1] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v16;
}

- (int64_t)_findFirstWeekdayFromModel:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  if (![v3 hasMonthData]
    || ([v4 monthData],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 hasFirstWeekday],
        v5,
        !v6))
  {
    if ([v4 hasSixMonthData])
    {
      v8 = [v4 sixMonthData];
      int v9 = [v8 hasFirstWeekday];

      if (v9)
      {
        uint64_t v7 = [v4 sixMonthData];
        goto LABEL_8;
      }
    }
LABEL_9:
    int64_t v11 = -1;
    goto LABEL_10;
  }
  uint64_t v7 = [v4 monthData];
LABEL_8:
  objc_super v10 = v7;
  int64_t v11 = [v7 firstWeekday];

LABEL_10:
  return v11;
}

+ (void)encodeChartDataWithHealthStore:(id)a3 dateCache:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 activityMoveMode:(int64_t)a7 monthDateInterval:(id)a8 sixMonthDateInterval:(id)a9 completion:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = [[HKActivitySummaryDataProvider alloc] initWithHealthStore:v22 dateCache:v21 displayTypeController:v20 unitController:v19 activityMoveMode:a7];

  +[_ActivityRemoteDataGathererManager gatherDataWithActivitySummaryDataProvider:v23 monthDateInterval:v18 sixMonthDateInterval:v17 completion:v16];
}

- (int64_t)_countOfStackedChartsFromActivityOptions:(unint64_t)a3
{
  unint64_t v3 = 2 - (a3 & 1);
  if ((a3 & 2) == 0) {
    unint64_t v3 = a3 & 1 ^ 3;
  }
  return v3 + ((uint64_t)(a3 << 61) >> 63);
}

- (id)_lineColorForActivityValue:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
  {
    id v5 = 0;
  }
  else
  {
    if (((1 << a3) & 0x33) != 0)
    {
      id v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityMoveGoalLineColor", v3);
    }
    else
    {
      if (((1 << a3) & 0x44) != 0) {
        objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityExerciseGoalLineColor", v3);
      }
      else {
      id v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityStandGoalLineColor", v3);
      }
    }
  }
  return v5;
}

- (id)_metGoalFillStyleForActivityValue:(int64_t)a3 useGradient:(BOOL)a4
{
  BOOL v4 = a4;
  if ((unint64_t)a3 > 7)
  {
    id v5 = 0;
    int v6 = 0;
    int v9 = 0;
    if (a4)
    {
LABEL_9:
      objc_super v10 = [[HKGradientFillStyle alloc] initWithFirstColor:v5 secondColor:v6];
      goto LABEL_12;
    }
  }
  else
  {
    if (((1 << a3) & 0x33) != 0)
    {
      id v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityMoveGoalMetGradientTopColor");
      int v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityMoveGoalMetGradientBottomColor");
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityMoveGoalMetNonGradientColor");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (((1 << a3) & 0x44) != 0)
      {
        v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityExerciseGoalMetGradientTopColor");
        objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityExerciseGoalMetGradientBottomColor");
      }
      else
      {
        v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityStandGoalMetGradientTopColor");
        objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityStandGoalMetGradientBottomColor");
      int v6 = };
      id v7 = v8;
      id v5 = v7;
    }
    int v9 = v7;
    if (v4) {
      goto LABEL_9;
    }
  }
  objc_super v10 = objc_alloc_init(HKSolidFillStyle);
  [(HKGradientFillStyle *)v10 setColor:v9];
LABEL_12:

  return v10;
}

- (id)_missedGoalFillStyleForActivityValue:(int64_t)a3 useGradient:(BOOL)a4
{
  BOOL v4 = a4;
  if ((unint64_t)a3 > 7)
  {
    id v5 = 0;
    int v6 = 0;
    int v9 = 0;
    if (a4)
    {
LABEL_9:
      objc_super v10 = [[HKGradientFillStyle alloc] initWithFirstColor:v5 secondColor:v6];
      goto LABEL_12;
    }
  }
  else
  {
    if (((1 << a3) & 0x33) != 0)
    {
      id v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityMoveGoalMissedGradientTopColor");
      int v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityMoveGoalMissedGradientBottomColor");
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityMoveGoalMissedNonGradientColor");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (((1 << a3) & 0x44) != 0)
      {
        v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityExerciseGoalMissedGradientTopColor");
        objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityExerciseGoalMissedGradientBottomColor");
      }
      else
      {
        v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityStandGoalMissedGradientTopColor");
        objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityStandGoalMissedGradientBottomColor");
      int v6 = };
      id v7 = v8;
      id v5 = v7;
    }
    int v9 = v7;
    if (v4) {
      goto LABEL_9;
    }
  }
  objc_super v10 = objc_alloc_init(HKSolidFillStyle);
  [(HKGradientFillStyle *)v10 setColor:v9];
LABEL_12:

  return v10;
}

- (id)_pausedFillStyleForActivityValue:(int64_t)a3
{
  uint64_t v3 = objc_alloc_init(HKSolidFillStyle);
  BOOL v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityPausedColor");
  [(HKSolidFillStyle *)v3 setColor:v4];

  return v3;
}

- (id)_titleForActivityValue:(int64_t)a3 wheelchairUseCharacteristicCache:(id)a4
{
  id v5 = a4;
  int v6 = v5;
  if ((unint64_t)a3 <= 7)
  {
    if (((1 << a3) & 0x33) != 0)
    {
      id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v8 = v7;
      int v9 = @"MOVE_CHART_TITLE";
    }
    else
    {
      if (((1 << a3) & 0x44) == 0)
      {
        v8 = objc_msgSend(MEMORY[0x1E4F2B0B8], "localizationStringSuffixForWheelchairUser:", objc_msgSend(v5, "isWheelchairUser"));
        int64_t v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v12 = [@"STAND_CHART_TITLE" stringByAppendingString:v8];
        objc_super v10 = [v11 localizedStringForKey:v12 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

        goto LABEL_8;
      }
      id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v8 = v7;
      int v9 = @"EXERCISE_CHART_TITLE";
    }
    objc_super v10 = [v7 localizedStringForKey:v9 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
LABEL_8:

    goto LABEL_9;
  }
  objc_super v10 = @"None";
LABEL_9:

  return v10;
}

- (int64_t)_representativeDataTypeForActivityValue:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return 3;
  }
  else {
    return qword_1E0F05EA8[a3];
  }
}

- (id)_unitForActivityValue:(int64_t)a3 displayTypeController:(id)a4 unitPreferenceController:(id)a5
{
  id v7 = a5;
  v8 = _DisplayTypeForActivityValue(a3, a4);
  int v9 = [v7 localizedDisplayNameForDisplayType:v8];

  return v9;
}

- (id)_displayTypeForActivityValue:(int64_t)a3 yAxis:(id)a4 dataProvider:(id)a5 displayTypeController:(id)a6 unitPreferenceController:(id)a7 wheelchairUseCharacteristicCache:(id)a8 timescopeToSummariesTable:(id)a9 activityOptions:(unint64_t)a10
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v39 = v19;
  uint64_t v40 = v16;
  if (v19)
  {
    id v20 = v19;
    id v21 = (void *)MEMORY[0x1E4F1C9A8];
    id v22 = a8;
    id v23 = a4;
    v24 = [v21 currentCalendar];
    v25 = v17;
    int64_t v26 = [[_ActivitySourceDelegateSharing alloc] initWithTimescopeToSummariesTable:v20 activityValue:a3 displayTypeController:v17 unitPreferenceController:v18 calendar:v24];
  }
  else
  {
    id v27 = a8;
    id v28 = a4;
    v25 = v17;
    int64_t v26 = [[_ActivitySourceDelegateProvider alloc] initWithDataProvider:v16 activityValue:a3 displayTypeController:v17 unitPreferenceController:v18];
  }
  v38 = v26;
  id v29 = [[HKDateRangeDataSource alloc] initWithSourceDelegate:v26];
  unint64_t v30 = v18;
  int64_t v31 = [(HKInteractiveChartActivityController *)self _activitySeriesForActivityValue:a3 wheelchairUseCharacteristicCache:a8 unitPreferenceController:v18 displayTypeController:v25 activityOptions:a10];
  [v31 setYAxis:a4];

  [v31 setDataSource:v29];
  uint64_t v32 = objc_alloc_init(HKInteractiveChartGenericStatFormatter);
  [(HKInteractiveChartGenericStatFormatter *)v32 setOverrideStatFormatterItemOptions:&unk_1F3C1FBA0];
  v33 = [(HKInteractiveChartActivityController *)self _unitForActivityValue:a3 displayTypeController:v25 unitPreferenceController:v30];
  int64_t v34 = [(HKInteractiveChartActivityController *)self _representativeDataTypeForActivityValue:a3];
  id v35 = [(HKInteractiveChartActivityController *)self _titleForActivityValue:a3 wheelchairUseCharacteristicCache:a8];

  uint64_t v36 = [[HKInteractiveChartDisplayType alloc] initWithGraphSeries:v31 displayName:v35 unitName:v33 valueFormatter:v32 dataTypeCode:v34];
  return v36;
}

- (id)_activitySeriesForActivityValue:(int64_t)a3 wheelchairUseCharacteristicCache:(id)a4 unitPreferenceController:(id)a5 displayTypeController:(id)a6 activityOptions:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(HKInteractiveChartActivityController *)self _lineColorForActivityValue:a3];
  uint64_t v16 = [(HKInteractiveChartActivityController *)self _countOfStackedChartsFromActivityOptions:a7];
  if (v16 < 2)
  {
    id v17 = &stru_1F3B9CF20;
  }
  else
  {
    id v17 = [(HKInteractiveChartActivityController *)self _titleForActivityValue:a3 wheelchairUseCharacteristicCache:v12];
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFCLL) == 4)
  {
    id v18 = [(HKInteractiveChartActivityController *)self _generateActivityGoalLineSeriesWithColor:v15];
  }
  else
  {
    id v28 = v14;
    id v19 = v13;
    id v20 = v12;
    BOOL v21 = v16 < 2;
    BOOL v22 = v16 > 1;
    id v23 = [(HKInteractiveChartActivityController *)self _metGoalFillStyleForActivityValue:a3 useGradient:v22];
    v24 = [(HKInteractiveChartActivityController *)self _missedGoalFillStyleForActivityValue:a3 useGradient:v22];
    v25 = [(HKInteractiveChartActivityController *)self _pausedFillStyleForActivityValue:a3];
    LOBYTE(v27) = v21;
    id v12 = v20;
    id v13 = v19;
    id v14 = v28;
    id v18 = [(HKInteractiveChartActivityController *)self _generateActivityBarSeriesWithColor:v15 legendTitle:v17 metGoalFillStyle:v23 missedGoalFillStyle:v24 pausedFillStyle:v25 activityValue:a3 unitPreferenceController:v13 displayTypeController:v28 drawLegendsInsideSeries:v27];
  }
  return v18;
}

- (id)_zeroStringForActivityValue:(int64_t)a3 displayTypeController:(id)a4 unitPreferenceController:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ((unint64_t)(a3 - 1) < 2)
  {
    uint64_t v9 = [MEMORY[0x1E4F2B618] minuteUnit];
LABEL_6:
    objc_super v10 = (void *)v9;
    int64_t v11 = [v8 localizedDisplayNameForUnit:v9 value:&unk_1F3C224F8];
    goto LABEL_8;
  }
  if (a3)
  {
    if (a3 != 3) {
      goto LABEL_10;
    }
    uint64_t v9 = [MEMORY[0x1E4F2B618] hourUnit];
    goto LABEL_6;
  }
  objc_super v10 = _DisplayTypeForActivityValue(0, v7);
  id v12 = [v8 unitForDisplayType:v10];
  int64_t v11 = [v8 localizedDisplayNameForUnit:v12 value:&unk_1F3C224F8];

LABEL_8:
  if (v11)
  {
    id v13 = [NSString stringWithFormat:@"0 %@", v11];

    goto LABEL_11;
  }
LABEL_10:
  id v13 = &stru_1F3B9CF20;
LABEL_11:

  return v13;
}

- (id)_activityYAxisForActivityValue:(int64_t)a3 zeroOnly:(BOOL)a4 stackOffset:(int64_t)a5 bottomLabelPadding:(double)a6 displayTypeController:(id)a7 unitPreferenceController:(id)a8
{
  BOOL v10 = a4;
  id v12 = a7;
  id v13 = a8;
  id v14 = objc_alloc_init(HKSolidFillStyle);
  id v15 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(HKSolidFillStyle *)v14 setColor:v15];

  uint64_t v16 = objc_alloc_init(HKAxisStyle);
  id v17 = HKDefaultChartYAxisColor();
  id v18 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
  id v19 = +[HKAxisLabelStyle labelStyleWithColor:v17 font:v18 horizontalAlignment:2 verticalAlignment:2];
  [(HKAxisStyle *)v16 setLabelStyle:v19];

  [(HKAxisStyle *)v16 setTickPositions:1];
  id v20 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  BOOL v21 = +[HKStrokeStyle strokeStyleWithColor:v20 lineWidth:2.0];
  [(HKAxisStyle *)v16 setAxisLineStyle:v21];

  [(HKAxisStyle *)v16 setFillStyle:v14];
  BOOL v22 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  id v23 = +[HKStrokeStyle strokeStyleWithColor:v22 lineWidth:HKUIOnePixel()];

  [(HKAxisStyle *)v16 setBorderStyleForFill:v23];
  [(HKAxisStyle *)v16 setFillInnerPadding:4.0];
  [(HKAxisStyle *)v16 setFillOuterPadding:4.0];
  [(HKAxisStyle *)v16 setLocation:1];
  [(HKAxisStyle *)v16 setShowGridLines:1];
  v24 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  v25 = [v24 colorWithAlphaComponent:0.5];
  int64_t v26 = +[HKStrokeStyle strokeStyleWithColor:v25 lineWidth:0.5];
  [(HKAxisStyle *)v16 setGridLineStyle:v26];

  uint64_t v27 = objc_alloc_init(HKNumericAxisConfiguration);
  [(HKAxisConfiguration *)v27 setPreferredStyle:v16];
  if (v10)
  {
    id v28 = [(HKInteractiveChartActivityController *)self _zeroStringForActivityValue:a3 displayTypeController:v12 unitPreferenceController:v13];
    [(HKNumericAxisConfiguration *)v27 setTopVerticalLabelPadding:0.0];
    [(HKNumericAxisConfiguration *)v27 setBottomVerticalLabelPadding:a6];
    [(HKAxisConfiguration *)v27 setMinLabels:2];
    [(HKAxisConfiguration *)v27 setMaxLabels:20];
    id v29 = [[HKNumericAxisZeroOnly alloc] initWithZeroLabel:v28 axisConfiguration:v27];
  }
  else
  {
    [(HKNumericAxisConfiguration *)v27 setTopVerticalLabelPadding:10.0];
    [(HKNumericAxisConfiguration *)v27 setBottomVerticalLabelPadding:a6];
    [(HKAxisConfiguration *)v27 setMinLabels:2];
    [(HKAxisConfiguration *)v27 setMaxLabels:3];
    id v28 = [(HKInteractiveChartActivityController *)self _displayTypeForUnits:a3 displayTypeController:v12];
    if (v28)
    {
      unint64_t v30 = [[HKAxisLabelDimensionDisplayType alloc] initWithDisplayType:v28 unitPreferencesController:v13];
      [(HKNumericAxisConfiguration *)v27 setLabelDimension:v30];
    }
    id v29 = [[HKNumericAxis alloc] initWithConfiguration:v27];
  }
  int64_t v31 = v29;

  return v31;
}

- (id)_displayTypeForUnits:(int64_t)a3 displayTypeController:(id)a4
{
  id v5 = a4;
  int v6 = v5;
  switch(a3)
  {
    case 0:
      id v7 = &unk_1F3C22510;
      goto LABEL_7;
    case 3:
      id v7 = &unk_1F3C22540;
      goto LABEL_7;
    case 2:
      id v7 = &unk_1F3C22528;
LABEL_7:
      id v8 = [v5 displayTypeWithIdentifier:v7];
      goto LABEL_9;
  }
  id v8 = 0;
LABEL_9:

  return v8;
}

- (id)_generateActivityBarSeriesWithColor:(id)a3 legendTitle:(id)a4 metGoalFillStyle:(id)a5 missedGoalFillStyle:(id)a6 pausedFillStyle:(id)a7 activityValue:(int64_t)a8 unitPreferenceController:(id)a9 displayTypeController:(id)a10 drawLegendsInsideSeries:(BOOL)a11
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v17 = a4;
  id v18 = a10;
  id v19 = a9;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = [[_ActivityBarSeries alloc] initWithUnitPreferenceController:v19 activityBarDelegate:self displayTypeController:v18];

  if ((unint64_t)a8 > 7) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = qword_1E0F05EA8[a8];
  }
  [(_ActivityBarSeries *)v23 setActivityDisplayTypeIdentifier:v24];
  v25 = objc_alloc_init(HKStrokeStyle);
  int64_t v26 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0];
  [(HKStrokeStyle *)v25 setStrokeColor:v26];

  [(HKStrokeStyle *)v25 setLineWidth:3.0];
  [(HKStrokeStyle *)v25 setBlendMode:22];
  [(HKBarSeries *)v23 setUnselectedStrokeStyle:v25];
  [(HKBarSeries *)v23 setUnselectedFillStyle:v22];

  [(_ActivityBarSeries *)v23 setMissedGoalUnselectedFillStyle:v21];
  [(_ActivityBarSeries *)v23 setPausedUnselectedFillStyle:v20];

  [(HKBarSeries *)v23 setSelectedFillStyle:0];
  [(HKBarSeries *)v23 setSelectedStrokeStyle:0];
  -[HKBarSeries setCornerRadii:](v23, "setCornerRadii:", 1.5, 1.5);
  if (v17)
  {
    uint64_t v27 = +[HKLegendEntry legendEntryWithTitle:v17 labelColor:v33];
    v35[0] = v27;
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    [(HKGraphSeries *)v23 setTitleLegendEntries:v28];

    id v29 = [MEMORY[0x1E4FB1618] labelColor];
    unint64_t v30 = +[HKLegendEntry legendEntryWithTitle:&stru_1F3B9CF20 labelColor:v29];

    int64_t v34 = v30;
    int64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [(HKGraphSeries *)v23 setDetailLegendEntries:v31];

    [(HKGraphSeries *)v23 setDrawLegendInsideSeries:a11];
  }

  return v23;
}

- (id)_generateActivityGoalLineSeriesWithColor:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[_ActivityGoalLineSeries alloc] initWithColor:v3];

  return v4;
}

+ (id)firstActivitySeriesForGraphView:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(a3, "allSeries", 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)didUpdateFromDateZoom:(int64_t)a3 toDateZoom:(int64_t)a4 newVisibleRange:(id)a5
{
  self->_currentTimeScope = a4;
}

- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  uint64_t v5 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  id v6 = [v5 graphView];

  [v6 setScrollingOptions:1];
}

- (id)makeAnnotationDataSource
{
  id v3 = [(HKInteractiveChartActivityController *)self activityAnnotationDataSource];
  [(HKInteractiveChartActivityController *)self _handleAlternateAnnotationDataViewDataSource:v3];

  return [(HKInteractiveChartActivityController *)self activityAnnotationDataSource];
}

- (void)_handleAlternateAnnotationDataViewDataSource:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HKInteractiveChartActivityController;
  uint64_t v5 = [(HKInteractiveChartViewController *)&v6 makeAnnotationDataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setStandardAnnotationViewDataSource:v5];
  }
}

- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6
{
  id v19 = a3;
  id v10 = a4;
  long long v11 = [v19 userInfo];
  long long v12 = [v11 firstObject];

  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v13 = [(HKInteractiveChartActivityController *)self activityAnnotationDataSource];
    [v13 useActivityAnnotationViewDataSource];

    uint64_t v14 = [v12 activitySummaryData];
    id v15 = [(HKInteractiveChartActivityController *)self activityAnnotationDataSource];
    [v15 setActivitySummary:v14];

    uint64_t v16 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
    uint64_t v17 = [v16 dateZoom];
    id v18 = [(HKInteractiveChartActivityController *)self activityAnnotationDataSource];
    [v18 setTimeScope:v17];
  }
  else
  {
    uint64_t v14 = [(HKInteractiveChartActivityController *)self activityAnnotationDataSource];
    uint64_t v16 = [(HKInteractiveChartViewController *)self healthStore];
    [v14 useStandardAnnotationViewDataSourceForContext:v19 displayType:v10 timeScope:a5 resolution:a6 healthStore:v16 viewController:self];
  }
}

- (id)lollipopAnnotationColor
{
  id v3 = [(HKInteractiveChartActivityController *)self activityAnnotationDataSource];
  int v4 = [v3 useStandardAnnotationDataSource];

  if (v4) {
    objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopBackgroundColor");
  }
  else {
  uint64_t v5 = [(HKInteractiveChartActivityController *)self _activityLollipopBackgroundColor];
  }
  return v5;
}

- (id)_activityLollipopBackgroundColor
{
  v2 = [(HKInteractiveChartActivityController *)self traitCollection];
  unint64_t v3 = [v2 userInterfaceStyle];

  if (v3 >= 2)
  {
    if (v3 == 2) {
      [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
    }
    else {
    int v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopBackgroundColor");
    }
  }
  else
  {
    int v4 = [MEMORY[0x1E4FB1618] blackColor];
  }
  return v4;
}

- (id)descriptionSeriesForGraphView:(id)a3
{
  unint64_t v3 = [a3 allSeries];
  int v4 = [v3 firstObject];

  return v4;
}

- (id)descriptionSpansForGraphView:(id)a3 timeScope:(int64_t)a4
{
  v24[3] = *MEMORY[0x1E4F143B8];
  objc_super v6 = [(HKInteractiveChartActivityController *)self moveValueDisplayType];
  id v7 = [(HKInteractiveChartActivityController *)self activityAnnotationDataSource];
  id v8 = [v7 activityMoveTitle];
  long long v9 = [(HKInteractiveChartActivityController *)self _spanForValueDisplayType:v6 timeScope:a4 title:v8];

  id v10 = [(HKInteractiveChartActivityController *)self exerciseValueDisplayType];
  long long v11 = [(HKInteractiveChartActivityController *)self activityAnnotationDataSource];
  long long v12 = [v11 activityExerciseTitle];
  id v13 = [(HKInteractiveChartActivityController *)self _spanForValueDisplayType:v10 timeScope:a4 title:v12];

  uint64_t v14 = [(HKInteractiveChartActivityController *)self standValueDisplayType];
  id v15 = [(HKInteractiveChartActivityController *)self activityAnnotationDataSource];
  uint64_t v16 = [v15 activityStandTitle];
  uint64_t v17 = [(HKInteractiveChartActivityController *)self _spanForValueDisplayType:v14 timeScope:a4 title:v16];

  id v18 = [v9 dataSeriesTitle];
  v23[0] = v18;
  v24[0] = v9;
  id v19 = [v13 dataSeriesTitle];
  v23[1] = v19;
  v24[1] = v13;
  id v20 = [v17 dataSeriesTitle];
  v23[2] = v20;
  v24[2] = v17;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  return v21;
}

- (id)_spanForValueDisplayType:(id)a3 timeScope:(int64_t)a4 title:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 graphSeriesForTimeScope:a4];
  long long v11 = [v10 visibleValueRange];

  long long v12 = [v11 minValue];
  id v13 = [(HKInteractiveChartActivityController *)self _rangeValueAsNumber:v12];

  uint64_t v14 = [v11 maxValue];
  id v15 = [(HKInteractiveChartActivityController *)self _rangeValueAsNumber:v14];

  uint64_t v16 = [(HKInteractiveChartViewController *)self unitPreferenceController];
  uint64_t v17 = [v16 localizedDisplayNameForDisplayType:v9];

  id v18 = [[HKAccessibilitySpan alloc] initWithTitle:v8 seriesType:2 dataComprehensionMinYValue:v13 dataComprehensionMaxYValue:v15 dataComprehensionUnitForChart:v17];
  return v18;
}

- (id)_rangeValueAsNumber:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)descriptionForChartData:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [HKActivitySummaryAnnotationViewDataSource alloc];
    id v9 = [(HKInteractiveChartViewController *)self displayTypeController];
    id v10 = [(HKInteractiveChartViewController *)self unitPreferenceController];
    long long v11 = [(HKInteractiveChartActivityController *)self wheelchairUseCharacteristicCache];
    long long v12 = [(HKInteractiveChartViewController *)self dateCache];
    unint64_t v13 = [(HKInteractiveChartActivityController *)self activityOptions];
    int64_t v20 = a4;
    int64_t v14 = [(HKInteractiveChartViewController *)self annotationDataSourceFirstWeekday];
    LOBYTE(v19) = [(HKInteractiveChartActivityController *)self isChartSharingContext];
    id v15 = [(HKActivitySummaryAnnotationViewDataSource *)v8 initWithDisplayTypeController:v9 unitController:v10 wheelchairUseCharacteristicCache:v11 dateCache:v12 currentValueViewContext:0 activityOptions:v13 firstWeekday:v14 isChartSharingContext:v19];

    [(HKInteractiveChartActivityController *)self _handleAlternateAnnotationDataViewDataSource:v15];
    uint64_t v16 = [v7 activitySummaryData];

    [(HKActivitySummaryAnnotationViewDataSource *)v15 setActivitySummary:v16];
    [(HKActivitySummaryAnnotationViewDataSource *)v15 setTimeScope:v20];
    uint64_t v17 = [(HKActivitySummaryAnnotationViewDataSource *)v15 descriptionsForActivitySummary];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (BOOL)chartDataIsAvailable
{
  v2 = [(HKInteractiveChartActivityController *)self activityDataProvider];
  char v3 = [v2 activitySummariesAreLoading] ^ 1;

  return v3;
}

- (id)dataSourceForCurrentValueViewString
{
  v2 = [(HKInteractiveChartActivityController *)self activityCurrentValueView];
  char v3 = [v2 currentValueDataSource];

  return v3;
}

- (id)makeCurrentValueView
{
  char v3 = [_ActivityCurrentValueView alloc];
  int v4 = [(HKInteractiveChartViewController *)self displayTypeController];
  id v5 = [(HKInteractiveChartViewController *)self unitPreferenceController];
  id v6 = [(HKInteractiveChartActivityController *)self wheelchairUseCharacteristicCache];
  id v7 = [(HKInteractiveChartActivityController *)self activityDataProvider];
  unint64_t v8 = [(HKInteractiveChartActivityController *)self activityOptions];
  int64_t v9 = [(HKInteractiveChartViewController *)self annotationDataSourceFirstWeekday];
  LOBYTE(v12) = [(HKInteractiveChartActivityController *)self isChartSharingContext];
  id v10 = [(_ActivityCurrentValueView *)v3 initWithDisplayTypeController:v4 unitPreferenceController:v5 wheelchairUseCharacteristicCache:v6 currentValueViewCallbacks:self activitySummaryDataProvider:v7 activityOptions:v8 firstWeekday:v9 isChartSharingContext:v12];
  [(HKInteractiveChartActivityController *)self setActivityCurrentValueView:v10];

  return [(HKInteractiveChartActivityController *)self activityCurrentValueView];
}

- (void)updateCurrentValueView:(id)a3 graphView:(id)a4 timeScope:(int64_t)a5 showInfoButton:(BOOL)a6
{
  id v12 = a4;
  id v9 = a3;
  id v10 = [(HKInteractiveChartActivityController *)self activityCurrentValueView];

  if (v10 == v9)
  {
    long long v11 = [(HKInteractiveChartActivityController *)self activityCurrentValueView];
    [v11 updateWithGraphView:v12 timeScope:a5];
  }
}

- (void)setCurrentValueViewCallbacks:(id)a3
{
  [(HKInteractiveChartActivityController *)self setActivityCurrentValueViewCallbacks:a3];
  id v6 = (id)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tappedOnCurrentValueView_];
  int v4 = [(HKInteractiveChartActivityController *)self activityCurrentValueView];
  [v4 addGestureRecognizer:v6];

  id v5 = [(HKInteractiveChartActivityController *)self activityCurrentValueView];
  [v5 setUserInteractionEnabled:1];
}

- (void)tappedOnCurrentValueView:(id)a3
{
  id v5 = [(HKInteractiveChartActivityController *)self activityCurrentValueViewCallbacks];
  int v4 = [(HKInteractiveChartActivityController *)self activityCurrentValueView];
  [v5 didTapOnDateFromCurrentValueView:v4];
}

- (id)calendarQueryDisplayType
{
  v2 = [(HKInteractiveChartViewController *)self displayTypeController];
  char v3 = [v2 displayTypeWithIdentifier:&unk_1F3C22558];

  return v3;
}

- (id)calendarQuerySampleType
{
  return (id)[MEMORY[0x1E4F2B2C0] activityCacheType];
}

- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3
{
  return 0;
}

- (id)seriesSelectionLineColorForGraphView:(id)a3
{
  char v3 = [(HKInteractiveChartActivityController *)self traitCollection];
  unint64_t v4 = [v3 userInterfaceStyle];

  if (v4 >= 2)
  {
    if (v4 == 2)
    {
      id v5 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] blackColor];
  }
  return v5;
}

- (int64_t)graphSeriesTimeScope
{
  return self->_currentTimeScope;
}

- (id)activitySummaryForCurrentRange
{
  char v3 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  unint64_t v4 = [v3 graphView];
  id v5 = [v4 effectiveVisibleRangeActive];

  id v6 = [(HKInteractiveChartActivityController *)self _dayActivitySummaryForDateRange:v5];

  return v6;
}

- (id)_dayActivitySummaryForDateRange:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HKInteractiveChartActivityController *)self activityDataProvider];
  id v6 = [v5 activitySummariesForDateRange:v4 timeScope:5];

  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  unint64_t v8 = [v4 maxValue];
  id v9 = [v7 dateByAddingUnit:64 value:-1 toDate:v8 options:0];

  id v10 = objc_msgSend(v7, "hk_activitySummaryDateComponentsFromDate:", v9);
  [v10 setCalendar:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v6;
  id v12 = (id)[v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "dateComponentsForCalendar:", v7, (void)v18);
        [v16 setCalendar:0];
        if ([v16 isEqual:v10])
        {
          id v12 = v15;

          goto LABEL_11;
        }
      }
      id v12 = (id)[v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v12;
}

+ (id)_codableActivitySummaryDataFromSummaries:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(HKCodableActivitySummaryCollection);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(a1, "_codableActivitySummaryFromSummary:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [(HKCodableActivitySummaryCollection *)v5 addActivitySummaryEntry:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_codableActivitySummaryFromSummary:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(HKCodableActivitySummaryEntry);
  uint64_t v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v8 = [v5 dateComponentsForCalendar:v7];
  uint64_t v9 = [v8 hour];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = [v5 _gregorianDateComponents];
    id v11 = [v10 calendar];

    if (!v11)
    {
      id v12 = (void *)[v10 copy];

      long long v13 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithUTCTimeZone");
      [v12 setCalendar:v13];

      id v10 = v12;
    }
    long long v14 = objc_msgSend(v10, "hkui_codableDateComponents");
    [(HKCodableActivitySummaryEntry *)v6 setGregorianDateComponents:v14];

    -[HKCodableActivitySummaryEntry setActivityMoveMode:](v6, "setActivityMoveMode:", [v5 activityMoveMode]);
    long long v15 = [v5 activeEnergyBurned];

    if (v15)
    {
      long long v16 = [v5 activeEnergyBurned];
      uint64_t v17 = [v16 codableRepresentation];
      [(HKCodableActivitySummaryEntry *)v6 setActiveEnergyBurned:v17];
    }
    uint64_t v18 = [v5 appleMoveTime];

    if (v18)
    {
      long long v19 = [v5 appleMoveTime];
      long long v20 = [v19 codableRepresentation];
      [(HKCodableActivitySummaryEntry *)v6 setAppleMoveTime:v20];
    }
    long long v21 = [v5 appleExerciseTime];

    if (v21)
    {
      id v22 = [v5 appleExerciseTime];
      uint64_t v23 = [v22 codableRepresentation];
      [(HKCodableActivitySummaryEntry *)v6 setAppleExerciseTime:v23];
    }
    uint64_t v24 = [v5 appleStandHours];

    if (v24)
    {
      v25 = [v5 appleStandHours];
      int64_t v26 = [v25 codableRepresentation];
      [(HKCodableActivitySummaryEntry *)v6 setAppleStandHours:v26];
    }
    uint64_t v27 = [v5 activeEnergyBurnedGoal];

    if (v27)
    {
      id v28 = [v5 activeEnergyBurnedGoal];
      id v29 = [v28 codableRepresentation];
      [(HKCodableActivitySummaryEntry *)v6 setActiveEnergyBurnedGoal:v29];
    }
    unint64_t v30 = [v5 appleMoveTimeGoal];

    if (v30)
    {
      int64_t v31 = [v5 appleMoveTimeGoal];
      uint64_t v32 = [v31 codableRepresentation];
      [(HKCodableActivitySummaryEntry *)v6 setAppleMoveTimeGoal:v32];
    }
    id v33 = [v5 exerciseTimeGoal];

    if (v33)
    {
      int64_t v34 = [v5 exerciseTimeGoal];
      id v35 = [v34 codableRepresentation];
      [(HKCodableActivitySummaryEntry *)v6 setAppleExerciseTimeGoal:v35];
    }
    uint64_t v36 = [v5 standHoursGoal];

    if (v36)
    {
      v37 = [v5 standHoursGoal];
      v38 = [v37 codableRepresentation];
      [(HKCodableActivitySummaryEntry *)v6 setAppleStandHoursGoal:v38];
    }
    -[HKCodableActivitySummaryEntry setPaused:](v6, "setPaused:", [v5 isPaused]);
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"HKInteractiveChartActivityController.m" lineNumber:1298 description:@"There is no support for encoding hourly activity summaries"];
  }

  return v6;
}

+ (id)_activitySummariesFromCodableCollection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(v4, "activitySummaryEntrys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [a1 _activitySummaryFromCodableSummaryEntry:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_activitySummaryFromCodableSummaryEntry:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F2ABA8]);
  if ([v3 hasGregorianDateComponents])
  {
    id v5 = (void *)MEMORY[0x1E4F1C9D8];
    id v6 = [v3 gregorianDateComponents];
    uint64_t v7 = objc_msgSend(v5, "hkui_dateComponentsWithCodableDateComponents:", v6);
    [v4 _setGregorianDateComponents:v7];
  }
  if ([v3 hasActivityMoveMode]) {
    objc_msgSend(v4, "setActivityMoveMode:", objc_msgSend(v3, "activityMoveMode"));
  }
  if ([v3 hasActiveEnergyBurned])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F2B370];
    uint64_t v9 = [v3 activeEnergyBurned];
    id v10 = [v8 createWithCodableQuantity:v9];
    [v4 setActiveEnergyBurned:v10];
  }
  if ([v3 hasAppleMoveTime])
  {
    id v11 = (void *)MEMORY[0x1E4F2B370];
    id v12 = [v3 appleMoveTime];
    long long v13 = [v11 createWithCodableQuantity:v12];
    [v4 setAppleMoveTime:v13];
  }
  if ([v3 hasAppleExerciseTime])
  {
    long long v14 = (void *)MEMORY[0x1E4F2B370];
    long long v15 = [v3 appleExerciseTime];
    long long v16 = [v14 createWithCodableQuantity:v15];
    [v4 setAppleExerciseTime:v16];
  }
  if ([v3 hasAppleStandHours])
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F2B370];
    uint64_t v18 = [v3 appleStandHours];
    long long v19 = [v17 createWithCodableQuantity:v18];
    [v4 setAppleStandHours:v19];
  }
  if ([v3 hasActiveEnergyBurnedGoal])
  {
    long long v20 = (void *)MEMORY[0x1E4F2B370];
    long long v21 = [v3 activeEnergyBurnedGoal];
    id v22 = [v20 createWithCodableQuantity:v21];
    [v4 setActiveEnergyBurnedGoal:v22];
  }
  uint64_t v23 = [v3 appleMoveTimeGoal];

  if (v23)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F2B370];
    v25 = [v3 appleMoveTimeGoal];
    int64_t v26 = [v24 createWithCodableQuantity:v25];
    [v4 setAppleMoveTimeGoal:v26];
  }
  if ([v3 hasAppleExerciseTimeGoal])
  {
    uint64_t v27 = (void *)MEMORY[0x1E4F2B370];
    id v28 = [v3 appleExerciseTimeGoal];
    id v29 = [v27 createWithCodableQuantity:v28];
    [v4 setExerciseTimeGoal:v29];
  }
  if ([v3 hasAppleStandHoursGoal])
  {
    unint64_t v30 = (void *)MEMORY[0x1E4F2B370];
    int64_t v31 = [v3 appleStandHoursGoal];
    uint64_t v32 = [v30 createWithCodableQuantity:v31];
    [v4 setStandHoursGoal:v32];
  }
  if ([v3 hasPaused]) {
    uint64_t v33 = [v3 paused];
  }
  else {
    uint64_t v33 = 0;
  }
  [v4 setPaused:v33];

  return v4;
}

- (NSMapTable)yAxisAccessoryViewsByGraphSeries
{
  return self->_yAxisAccessoryViewsByGraphSeries;
}

- (void)setYAxisAccessoryViewsByGraphSeries:(id)a3
{
}

- (HKActivitySummaryDataProvider)activityDataProvider
{
  return self->_activityDataProvider;
}

- (void)setActivityDataProvider:(id)a3
{
}

- (HKActivitySummaryAnnotationViewDataSource)activityAnnotationDataSource
{
  return self->_activityAnnotationDataSource;
}

- (void)setActivityAnnotationDataSource:(id)a3
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

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache
{
  return self->_wheelchairUseCharacteristicCache;
}

- (_ActivityCurrentValueView)activityCurrentValueView
{
  return self->_activityCurrentValueView;
}

- (void)setActivityCurrentValueView:(id)a3
{
}

- (HKInteractiveChartCurrentValueViewCallbacks)activityCurrentValueViewCallbacks
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityCurrentValueViewCallbacks);
  return (HKInteractiveChartCurrentValueViewCallbacks *)WeakRetained;
}

- (void)setActivityCurrentValueViewCallbacks:(id)a3
{
}

- (HKInteractiveChartDisplayType)moveValueDisplayType
{
  return self->_moveValueDisplayType;
}

- (HKInteractiveChartDisplayType)moveGoalDisplayType
{
  return self->_moveGoalDisplayType;
}

- (HKInteractiveChartDisplayType)exerciseValueDisplayType
{
  return self->_exerciseValueDisplayType;
}

- (HKInteractiveChartDisplayType)exerciseGoalDisplayType
{
  return self->_exerciseGoalDisplayType;
}

- (HKInteractiveChartDisplayType)standValueDisplayType
{
  return self->_standValueDisplayType;
}

- (HKInteractiveChartDisplayType)standGoalDisplayType
{
  return self->_standGoalDisplayType;
}

- (unint64_t)activityOptions
{
  return self->_activityOptions;
}

- (BOOL)isChartSharingContext
{
  return self->_isChartSharingContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standGoalDisplayType, 0);
  objc_storeStrong((id *)&self->_standValueDisplayType, 0);
  objc_storeStrong((id *)&self->_exerciseGoalDisplayType, 0);
  objc_storeStrong((id *)&self->_exerciseValueDisplayType, 0);
  objc_storeStrong((id *)&self->_moveGoalDisplayType, 0);
  objc_storeStrong((id *)&self->_moveValueDisplayType, 0);
  objc_destroyWeak((id *)&self->_activityCurrentValueViewCallbacks);
  objc_storeStrong((id *)&self->_activityCurrentValueView, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
  objc_storeStrong((id *)&self->_activityAnnotationDataSource, 0);
  objc_storeStrong((id *)&self->_activityDataProvider, 0);
  objc_storeStrong((id *)&self->_yAxisAccessoryViewsByGraphSeries, 0);
}

@end