@interface HKHandwashingInteractiveChartViewController
+ (id)_generateHandwashingGoalDataSource;
+ (id)_generateHandwashingGoalDisplayTypeWithDisplayType:(id)a3 unitPreferencesController:(id)a4 selectedTimeScopeController:(id)a5;
+ (id)_generateHandwashingGoalLineSeriesWithDisplayType:(id)a3 unitPreferenceController:(id)a4 color:(id)a5;
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (HKDisplayType)goalDisplayType;
- (HKDisplayType)handwashingDisplayType;
- (HKHandwashingInteractiveChartViewController)initWithApplicationItems:(id)a3 displayDate:(id)a4 restorationUserActivity:(id)a5 additionalChartOptions:(unint64_t)a6;
- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5;
- (void)viewDidLoad;
@end

@implementation HKHandwashingInteractiveChartViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a9;
  id v16 = a10;
  id v17 = a8;
  v18 = [[HKHandwashingInteractiveChartViewController alloc] initWithApplicationItems:v13 displayDate:v14 restorationUserActivity:v17 additionalChartOptions:a11];

  v19 = [(HKHandwashingInteractiveChartViewController *)v18 handwashingDisplayType];
  if (v16 && [v16 count]) {
    v20 = [[HKHandwashingFactorAndTrendViewController alloc] initWithHandwashingDisplayType:v19 applicationItems:v13 trendModel:v15 factorDisplayTypes:v16 displayDate:v14 mode:1 options:[(HKInteractiveChartViewController *)v18 options]];
  }
  else {
    v20 = v18;
  }
  v21 = v20;

  return v21;
}

- (HKHandwashingInteractiveChartViewController)initWithApplicationItems:(id)a3 displayDate:(id)a4 restorationUserActivity:(id)a5 additionalChartOptions:(unint64_t)a6
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v28 = a5;
  id v26 = a4;
  id v9 = a3;
  v10 = [v9 displayTypeController];
  v11 = [v9 unitController];
  uint64_t v12 = [v9 timeScopeController];
  v29 = v10;
  id v13 = [v10 displayTypeWithIdentifier:&unk_1F3C22498];
  v25 = [(id)objc_opt_class() _generateHandwashingGoalDisplayTypeWithDisplayType:v13 unitPreferencesController:v11 selectedTimeScopeController:v12];
  unint64_t v14 = objc_msgSend(v13, "hk_interactiveChartOptions") | a6;
  v32[0] = v13;
  v32[1] = v25;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v31 = v27;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  id v16 = [v9 healthStore];
  id v17 = [v9 dateCache];
  v18 = [v9 chartDataCacheController];
  v19 = [v9 sampleDateRangeController];

  v30.receiver = self;
  v30.super_class = (Class)HKHandwashingInteractiveChartViewController;
  unint64_t v23 = v14;
  v20 = (void *)v12;
  v21 = [(HKInteractiveChartOverlayViewController *)&v30 initWithStackedDisplayTypes:v15 primaryDisplayTypeStackIndex:0 stackedDisplayTypeHeights:0 healthStore:v16 unitPreferenceController:v11 dateCache:v17 chartDataCacheController:v18 selectedTimeScopeController:v12 sampleTypeDateRangeController:v19 initialXValue:v26 currentCalendarOverride:0 options:v23 timeScopeRanges:0];

  if (v21)
  {
    [(HKInteractiveChartViewController *)v21 addChartViewObserver:v21];
    objc_storeStrong((id *)&v21->_handwashingDisplayType, v13);
    objc_storeStrong((id *)&v21->_goalDisplayType, v25);
    [(HKInteractiveChartViewController *)v21 setRestorationUserActivity:v28];
  }

  return v21;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HKHandwashingInteractiveChartViewController;
  [(HKInteractiveChartViewController *)&v2 viewDidLoad];
}

- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  v8 = [(HKHandwashingInteractiveChartViewController *)self handwashingDisplayType];
  id v13 = [(HKInteractiveChartViewController *)self graphSeriesForDisplayType:v8 timeScope:a4 stackOffset:a5];

  [v13 setAllowsSelection:1];
  id v9 = [(HKHandwashingInteractiveChartViewController *)self goalDisplayType];
  v10 = [(HKInteractiveChartViewController *)self graphSeriesForDisplayType:v9 timeScope:a4 stackOffset:a5];

  [v10 setAllowsSelection:0];
  v11 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  uint64_t v12 = [v11 graphView];
  [v12 setMoveSelectedSeriesToFront:0];
}

+ (id)_generateHandwashingGoalDataSource
{
  objc_super v2 = [HKHandwashingDateRangeDataSourceDelegate alloc];
  +[HKHandwashingEventDataSource durationForCompleteSample];
  v3 = -[HKHandwashingDateRangeDataSourceDelegate initWithGoal:](v2, "initWithGoal:");
  v4 = [[HKDateRangeDataSource alloc] initWithSourceDelegate:v3];

  return v4;
}

+ (id)_generateHandwashingGoalLineSeriesWithDisplayType:(id)a3 unitPreferenceController:(id)a4 color:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(HKLineSeries);
  v11 = [HKGradientFillStyle alloc];
  uint64_t v12 = [v7 colorWithAlphaComponent:0.3];
  id v13 = [v7 colorWithAlphaComponent:0.0];
  v32 = [(HKGradientFillStyle *)v11 initWithFirstColor:v12 secondColor:v13];

  unint64_t v14 = [HKGradientFillStyle alloc];
  id v15 = [v7 colorWithAlphaComponent:0.3];
  id v16 = [v7 colorWithAlphaComponent:0.0];
  objc_super v30 = [(HKGradientFillStyle *)v14 initWithFirstColor:v15 secondColor:v16];

  id v17 = +[HKStrokeStyle strokeStyleWithColor:v7 lineWidth:1.0];
  [v17 setDashStyle:1];
  v18 = objc_alloc_init(HKAxisLabelStyle);
  [(HKAxisLabelStyle *)v18 setTextColor:v7];
  v19 = [[HKHandwashingGoalFormatter alloc] initWithDisplayType:v9 unitPreferenceController:v8];

  [(HKAxisLabelStyle *)v18 setNumberFormatter:v19];
  v20 = objc_alloc_init(HKLineSeriesPresentationStyle);
  v31 = v17;
  [(HKLineSeriesPresentationStyle *)v20 setStrokeStyle:v17];
  [(HKLineSeriesPresentationStyle *)v20 setWaveForm:0];
  [(HKLineSeriesPresentationStyle *)v20 setAxisAnnotationStyle:v18];
  v21 = objc_alloc_init(HKLineSeriesPresentationStyle);
  [(HKLineSeriesPresentationStyle *)v21 setStrokeStyle:v17];
  [(HKLineSeriesPresentationStyle *)v21 setFillStyle:v32];
  [(HKLineSeriesPresentationStyle *)v21 setWaveForm:0];
  v22 = objc_alloc_init(HKLineSeriesPresentationStyle);
  unint64_t v23 = +[HKStrokeStyle strokeStyleWithColor:v7 lineWidth:1.0];
  [v23 setDashStyle:2];
  [(HKLineSeriesPresentationStyle *)v22 setStrokeStyle:v23];
  v24 = [[HKLineSeriesPointMarkerStyle alloc] initWithColor:v7 radius:0 style:3.0];
  [(HKLineSeriesPresentationStyle *)v22 setPointMarkerStyle:v24];
  [(HKLineSeriesPresentationStyle *)v22 setFillStyle:v30];
  [(HKLineSeriesPresentationStyle *)v22 setWaveForm:0];
  v35[0] = v20;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  [(HKLineSeries *)v10 setUnhighlightedPresentationStyles:v25];

  v34 = v21;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  [(HKLineSeries *)v10 setHighlightedPresentationStyles:v26];

  v33 = v22;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  [(HKLineSeries *)v10 setSelectedPresentationStyles:v27];

  id v28 = [[HKLineSeriesPointMarkerStyle alloc] initWithColor:v7 radius:0 style:5.0];
  [(HKLineSeries *)v10 setSelectedPointMarkerStyle:v28];
  [(HKLineSeries *)v10 setInactivePresentationStyle:v20];
  [(HKLineSeries *)v10 setExtendLastValue:1];
  [(HKLineSeries *)v10 setFlatLastValue:1];
  [(HKGraphSeries *)v10 setAllowsSelection:0];

  return v10;
}

+ (id)_generateHandwashingGoalDisplayTypeWithDisplayType:(id)a3 unitPreferencesController:(id)a4 selectedTimeScopeController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 unitForDisplayType:v7];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F2B618] secondUnit];
  }
  uint64_t v12 = v11;

  id v13 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_otherKeyColor");
  unint64_t v14 = [a1 _generateHandwashingGoalLineSeriesWithDisplayType:v7 unitPreferenceController:v8 color:v13];

  id v15 = [a1 _generateHandwashingGoalDataSource];
  [v14 setDataSource:v15];

  id v16 = [v7 chartingRules];
  id v17 = [v16 axisScalingRule];

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v17 setUnit:v12];
  }
  [v14 setAxisScalingRule:v17];
  v18 = [HKInteractiveChartDisplayType alloc];
  v19 = [v7 localization];
  v20 = [v19 displayName];
  v21 = [v12 unitString];
  v22 = [(HKInteractiveChartDisplayType *)v18 initWithGraphSeries:v14 displayName:v20 unitName:v21 valueFormatter:0 dataTypeCode:237];

  return v22;
}

- (HKDisplayType)handwashingDisplayType
{
  return self->_handwashingDisplayType;
}

- (HKDisplayType)goalDisplayType
{
  return self->_goalDisplayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goalDisplayType, 0);
  objc_storeStrong((id *)&self->_handwashingDisplayType, 0);
}

@end