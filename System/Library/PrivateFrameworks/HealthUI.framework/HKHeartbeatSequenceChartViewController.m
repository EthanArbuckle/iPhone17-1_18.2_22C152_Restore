@interface HKHeartbeatSequenceChartViewController
- (HKAxis)commonVerticalAxis;
- (HKHeartbeatSequenceChartViewController)initWithMinimumHeight:(double)a3;
- (HKHeartbeatSequenceChartViewController)initWithMinimumHeight:(double)a3 startDate:(id)a4;
- (NSDate)startDate;
- (NSMutableArray)graphSeries;
- (NSMutableArray)sequenceDataSources;
- (double)initialXAxisOffset;
- (id)_heartbeatSequenceSeriesForSource:(id)a3 axis:(id)a4 color:(id)a5 lineWidth:(double)a6 markerRadius:(double)a7 dashStyle:(int64_t)a8 annotate:(BOOL)a9;
- (id)_verticalNumericalAxis;
- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5;
- (int64_t)stackCountForGraphView:(id)a3;
- (void)_adjustGraphViewOptions;
- (void)_recomputeAxisRanges;
- (void)addSequenceData:(id)a3;
- (void)addSequenceData:(id)a3 color:(id)a4 lineWidth:(double)a5 markerRadius:(double)a6 dashStyle:(int64_t)a7 annotate:(BOOL)a8;
- (void)setCommonVerticalAxis:(id)a3;
- (void)setGraphSeries:(id)a3;
- (void)setInitialXAxisOffset:(double)a3;
- (void)setSequenceDataSources:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HKHeartbeatSequenceChartViewController

- (HKHeartbeatSequenceChartViewController)initWithMinimumHeight:(double)a3
{
  return [(HKHeartbeatSequenceChartViewController *)self initWithMinimumHeight:0 startDate:a3];
}

- (HKHeartbeatSequenceChartViewController)initWithMinimumHeight:(double)a3 startDate:(id)a4
{
  id v7 = a4;
  v8 = [[HKAxisLabelDimensionMinuteSecond alloc] initWithStartDate:v7];
  v17.receiver = self;
  v17.super_class = (Class)HKHeartbeatSequenceChartViewController;
  v9 = [(HKScalarGraphViewController *)&v17 initWithMinimumHeight:v8 labelDimension:0 labelEndings:0 numericAxisConfigurationOverrides:a3];
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sequenceDataSources = v9->_sequenceDataSources;
    v9->_sequenceDataSources = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    graphSeries = v9->_graphSeries;
    v9->_graphSeries = v12;

    uint64_t v14 = [(HKHeartbeatSequenceChartViewController *)v9 _verticalNumericalAxis];
    commonVerticalAxis = v9->_commonVerticalAxis;
    v9->_commonVerticalAxis = (HKAxis *)v14;

    objc_storeStrong((id *)&v9->_startDate, a4);
  }

  return v9;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HKHeartbeatSequenceChartViewController;
  [(HKScalarGraphViewController *)&v3 viewDidLoad];
  [(HKHeartbeatSequenceChartViewController *)self _adjustGraphViewOptions];
  [(HKHeartbeatSequenceChartViewController *)self _recomputeAxisRanges];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HKHeartbeatSequenceChartViewController;
  [(HKHeartbeatSequenceChartViewController *)&v13 viewWillLayoutSubviews];
  objc_super v3 = [(HKHeartbeatSequenceChartViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(HKGraphViewController *)self graphView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)addSequenceData:(id)a3
{
  id v4 = a3;
  HKHealthKeyColor();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(HKHeartbeatSequenceChartViewController *)self addSequenceData:v4 color:v5 lineWidth:0 markerRadius:1 dashStyle:2.0 annotate:3.0];
}

- (void)addSequenceData:(id)a3 color:(id)a4 lineWidth:(double)a5 markerRadius:(double)a6 dashStyle:(int64_t)a7 annotate:(BOOL)a8
{
  id v14 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__HKHeartbeatSequenceChartViewController_addSequenceData_color_lineWidth_markerRadius_dashStyle_annotate___block_invoke;
  v16[3] = &unk_1E6D54250;
  v16[4] = self;
  id v17 = v14;
  double v18 = a5;
  double v19 = a6;
  int64_t v20 = a7;
  BOOL v21 = a8;
  id v15 = v14;
  [a3 enumerateSequences:v16];
}

uint64_t __106__HKHeartbeatSequenceChartViewController_addSequenceData_color_lineWidth_markerRadius_dashStyle_annotate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(HKHeartbeatSequenceDataSource);
  [(HKHeartbeatSequenceDataSource *)v4 setHeartbeatSequencePoints:v3];

  id v5 = [*(id *)(a1 + 32) _heartbeatSequenceSeriesForSource:v4 axis:*(void *)(*(void *)(a1 + 32) + 1040) color:*(void *)(a1 + 40) lineWidth:*(void *)(a1 + 64) markerRadius:*(unsigned __int8 *)(a1 + 72) dashStyle:*(double *)(a1 + 48) annotate:*(double *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 1024) addObject:v4];
  [*(id *)(*(void *)(a1 + 32) + 1032) addObject:v5];

  return 1;
}

- (void)_adjustGraphViewOptions
{
  id v2 = [(HKGraphViewController *)self graphView];
  [v2 setDisableSelection:1];
  [v2 setOutlineOptions:4];
}

- (void)_recomputeAxisRanges
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = [(HKGraphViewController *)self graphView];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v4 = self->_sequenceDataSources;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    double v8 = -1.79769313e308;
    double v9 = 1.79769313e308;
    double v10 = 1.79769313e308;
    double v11 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "unionWithExtent:", v9, v10, v8, v11, (void)v33);
        double v9 = v13;
        double v10 = v14;
        double v8 = v15;
        double v11 = v16;
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = -1.79769313e308;
    double v9 = 1.79769313e308;
    double v10 = 1.79769313e308;
    double v11 = -1.79769313e308;
  }

  if (v9 >= 1.79769313e308 || v10 >= 1.79769313e308 || v8 <= -1.79769313e308 || v11 <= -1.79769313e308)
  {
    double v19 = +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1F3C22A20, &unk_1F3C22A20, (void)v33);
    [v3 setEffectiveAxisRange:v19 effectiveVisibleRangeCadence:v19 effectiveVisibleRangeActive:v19];
  }
  else
  {
    id v17 = [NSNumber numberWithDouble:v9 + -1.0];
    double v18 = [NSNumber numberWithDouble:v8];
    double v19 = +[HKValueRange valueRangeWithMinValue:v17 maxValue:v18];

    [(HKHeartbeatSequenceChartViewController *)self initialXAxisOffset];
    if (v20 >= v8 + -30.0) {
      double v20 = v8 + -30.0;
    }
    double v21 = v20 + 30.0;
    v22 = [NSNumber numberWithDouble:(void)v33];
    v23 = [NSNumber numberWithDouble:v21];
    v24 = +[HKValueRange valueRangeWithMinValue:v22 maxValue:v23];

    [v3 setEffectiveAxisRange:v19 effectiveVisibleRangeCadence:v24 effectiveVisibleRangeActive:v24];
    double v25 = v10 + v11;
    double v26 = v10 + v11 * 0.5;
    double v27 = v26 + 20.0;
    if (v11 >= 40.0) {
      double v28 = v10;
    }
    else {
      double v28 = v26 + -20.0;
    }
    if (v11 >= 40.0) {
      double v29 = v10 + v11;
    }
    else {
      double v29 = v27;
    }
    v30 = objc_msgSend(NSNumber, "numberWithDouble:", v28, v25);
    v31 = [NSNumber numberWithDouble:v29];
    v32 = +[HKValueRange valueRangeWithMinValue:v30 maxValue:v31];

    [v3 autoscaleYAxesAnimated:0 specificRange:v32 onlyIfNeeded:0 completion:0];
  }
}

- (id)_heartbeatSequenceSeriesForSource:(id)a3 axis:(id)a4 color:(id)a5 lineWidth:(double)a6 markerRadius:(double)a7 dashStyle:(int64_t)a8 annotate:(BOOL)a9
{
  BOOL v9 = a9;
  v48[1] = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v43 = a4;
  id v45 = a3;
  double v16 = objc_alloc_init(HKLineSeries);
  id v17 = [HKGradientFillStyle alloc];
  double v18 = [v15 colorWithAlphaComponent:0.3];
  double v19 = [v15 colorWithAlphaComponent:0.0];
  v44 = [(HKGradientFillStyle *)v17 initWithFirstColor:v18 secondColor:v19];

  double v20 = [HKGradientFillStyle alloc];
  double v21 = HKHealthKeyColor();
  v22 = [v21 colorWithAlphaComponent:0.3];
  v23 = HKHealthKeyColor();
  v24 = [v23 colorWithAlphaComponent:0.0];
  v42 = [(HKGradientFillStyle *)v20 initWithFirstColor:v22 secondColor:v24];

  double v25 = HKUIOnePixel() + a6;
  double v26 = [[HKLineSeriesPointMarkerStyle alloc] initWithColor:v15 radius:1 style:a7];
  double v27 = +[HKStrokeStyle strokeStyleWithColor:v15 lineWidth:v25];
  [v27 setDashStyle:a8];
  double v28 = objc_alloc_init(HKLineSeriesPresentationStyle);
  [(HKLineSeriesPresentationStyle *)v28 setStrokeStyle:v27];
  v41 = v26;
  if (v9)
  {
    [(HKLineSeriesPresentationStyle *)v28 setPointMarkerStyle:v26];
    [(HKLineSeriesPresentationStyle *)v28 setWaveForm:0];
    [(HKLineSeriesPresentationStyle *)v28 setEndCapStyle:v26];
    double v29 = objc_alloc_init(HKAxisLabelStyle);
    v30 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
    [(HKAxisLabelStyle *)v29 setFont:v30];

    [(HKAxisLabelStyle *)v29 setTextColor:v15];
    [(HKLineSeriesPresentationStyle *)v28 setAnnotationStyle:v29];
  }
  else
  {
    [(HKLineSeriesPresentationStyle *)v28 setWaveForm:0];
    [(HKLineSeriesPresentationStyle *)v28 setEndCapStyle:v26];
  }
  v31 = objc_alloc_init(HKLineSeriesPresentationStyle);
  [(HKLineSeriesPresentationStyle *)v31 setStrokeStyle:v27];
  [(HKLineSeriesPresentationStyle *)v31 setFillStyle:v44];
  [(HKLineSeriesPresentationStyle *)v31 setWaveForm:0];
  v32 = objc_alloc_init(HKLineSeriesPresentationStyle);
  long long v33 = HKHealthKeyColor();
  long long v34 = +[HKStrokeStyle strokeStyleWithColor:v33 lineWidth:v25];
  [(HKLineSeriesPresentationStyle *)v32 setStrokeStyle:v34];

  [(HKLineSeriesPresentationStyle *)v32 setFillStyle:v42];
  [(HKLineSeriesPresentationStyle *)v32 setWaveForm:0];
  v48[0] = v28;
  long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  [(HKLineSeries *)v16 setUnhighlightedPresentationStyles:v35];

  v47 = v31;
  long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  [(HKLineSeries *)v16 setHighlightedPresentationStyles:v36];

  v46 = v32;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  [(HKLineSeries *)v16 setSelectedPresentationStyles:v37];

  [(HKGraphSeries *)v16 setYAxis:v43];
  uint64_t v38 = +[HKValueRange valueRangeWithMinValue:&unk_1F3C22A30 maxValue:&unk_1F3C22A40];
  v39 = +[HKNumericFixedAxisScalingRule ruleWithDefaultAxisBounds:v38 axisBoundsOverrides:0];
  [(HKGraphSeries *)v16 setAxisScalingRule:v39];

  [(HKGraphSeries *)v16 setDataSource:v45];
  return v16;
}

- (id)_verticalNumericalAxis
{
  id v2 = objc_alloc_init(HKSolidFillStyle);
  id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(HKSolidFillStyle *)v2 setColor:v3];

  id v4 = objc_alloc_init(HKAxisStyle);
  uint64_t v5 = HKDefaultChartYAxisColor();
  uint64_t v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  uint64_t v7 = HKNumberFormatterFromTemplate(0);
  double v8 = +[HKAxisLabelStyle labelStyleWithColor:v5 font:v6 horizontalAlignment:2 verticalAlignment:2 numberFormatter:v7];
  [(HKAxisStyle *)v4 setLabelStyle:v8];

  [(HKAxisStyle *)v4 setTickPositions:1];
  BOOL v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  double v10 = +[HKStrokeStyle strokeStyleWithColor:v9 lineWidth:2.0];
  [(HKAxisStyle *)v4 setAxisLineStyle:v10];

  [(HKAxisStyle *)v4 setFillStyle:v2];
  [(HKAxisStyle *)v4 setFillInnerPadding:10.0];
  [(HKAxisStyle *)v4 setFillOuterPadding:15.0];
  [(HKAxisStyle *)v4 setLocation:1];
  [(HKAxisStyle *)v4 setShowGridLines:1];
  double v11 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  v12 = [v11 colorWithAlphaComponent:0.5];
  double v13 = +[HKStrokeStyle strokeStyleWithColor:v12 lineWidth:HKUIOnePixel()];
  [(HKAxisStyle *)v4 setGridLineStyle:v13];

  double v14 = objc_alloc_init(HKNumericAxisConfiguration);
  [(HKAxisConfiguration *)v14 setPreferredStyle:v4];
  id v15 = [[HKNumericAxis alloc] initWithConfiguration:v14];

  return v15;
}

- (int64_t)stackCountForGraphView:(id)a3
{
  return 1;
}

- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5
{
  return self->_graphSeries;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSMutableArray)sequenceDataSources
{
  return self->_sequenceDataSources;
}

- (void)setSequenceDataSources:(id)a3
{
}

- (NSMutableArray)graphSeries
{
  return self->_graphSeries;
}

- (void)setGraphSeries:(id)a3
{
}

- (HKAxis)commonVerticalAxis
{
  return self->_commonVerticalAxis;
}

- (void)setCommonVerticalAxis:(id)a3
{
}

- (double)initialXAxisOffset
{
  return self->_initialXAxisOffset;
}

- (void)setInitialXAxisOffset:(double)a3
{
  self->_initialXAxisOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonVerticalAxis, 0);
  objc_storeStrong((id *)&self->_graphSeries, 0);
  objc_storeStrong((id *)&self->_sequenceDataSources, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end