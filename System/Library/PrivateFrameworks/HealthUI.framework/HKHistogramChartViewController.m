@interface HKHistogramChartViewController
+ (id)defaultVerticalAxis;
- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3;
- (CGSize)_barCornerRadiusForCurrentDevice;
- (HKDisplayType)displayType;
- (HKHealthStore)healthStore;
- (HKHistogramAnnotationViewDataSource)annotationViewDataSource;
- (HKHistogramBarSeries)histogramSeries;
- (HKHistogramChartDataFormatter)dataFormatter;
- (HKHistogramChartDataSource)dataSource;
- (HKHistogramChartViewController)initWithHealthStore:(id)a3 dataSource:(id)a4 dataFormatter:(id)a5 minimumGraphViewHeight:(double)a6;
- (HKLollipopController)lollipopController;
- (HKScalarGraphViewController)graphViewController;
- (UILabel)headerLabel;
- (double)minimumGraphViewHeight;
- (id)_descriptionDateFormatter;
- (id)_displayDescriptionForDataSource:(id)a3;
- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5;
- (id)seriesSelectionLineColorForGraphView:(id)a3;
- (int64_t)stackCountForGraphView:(id)a3;
- (void)_pinView:(id)a3 toParentView:(id)a4;
- (void)didCompleteFetchForDataSource:(id)a3;
- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4;
- (void)graphViewDidEndSelection:(id)a3;
- (void)setAnnotationViewDataSource:(id)a3;
- (void)setDataFormatter:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDisplayType:(id)a3;
- (void)setGraphViewController:(id)a3;
- (void)setHeaderLabel:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setHistogramSeries:(id)a3;
- (void)setLollipopController:(id)a3;
- (void)setMinimumGraphViewHeight:(double)a3;
- (void)updateAnnotationDataSource:(id)a3 pointContexts:(id)a4;
- (void)viewDidLoad;
@end

@implementation HKHistogramChartViewController

- (HKHistogramChartViewController)initWithHealthStore:(id)a3 dataSource:(id)a4 dataFormatter:(id)a5 minimumGraphViewHeight:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HKHistogramChartViewController;
  v14 = [(HKHistogramChartViewController *)&v20 init];
  if (v14)
  {
    v15 = +[HKDisplayTypeController sharedInstanceForHealthStore:v11];
    v16 = [v12 quantityType];
    uint64_t v17 = [v15 displayTypeForObjectType:v16];
    displayType = v14->_displayType;
    v14->_displayType = (HKDisplayType *)v17;

    objc_storeStrong((id *)&v14->_healthStore, a3);
    v14->_minimumGraphViewHeight = a6;
    objc_storeStrong((id *)&v14->_dataSource, a4);
    [(HKHistogramChartDataSource *)v14->_dataSource setFetchObserver:v14];
    objc_storeStrong((id *)&v14->_dataFormatter, a5);
  }

  return v14;
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)HKHistogramChartViewController;
  [(HKHistogramChartViewController *)&v21 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v4 = (void *)[v3 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  [v4 setAxis:1];
  id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
  v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HKHistogramChartViewController *)self setHeaderLabel:v6];

  v7 = [(HKHistogramChartViewController *)self headerLabel];
  [v7 setNumberOfLines:0];

  v8 = [(HKHistogramChartViewController *)self headerLabel];
  [v4 addArrangedSubview:v8];

  v9 = [(HKHistogramChartViewController *)self graphViewController];
  [(HKHistogramChartViewController *)self addChildViewController:v9];

  v10 = [(HKHistogramChartViewController *)self graphViewController];
  [v10 didMoveToParentViewController:self];

  id v11 = [(HKHistogramChartViewController *)self graphViewController];
  id v12 = [v11 view];
  [v4 addArrangedSubview:v12];

  id v13 = [(HKHistogramChartViewController *)self view];
  [v13 addSubview:v4];

  v14 = [(HKHistogramChartViewController *)self view];
  [(HKHistogramChartViewController *)self _pinView:v4 toParentView:v14];

  v15 = [(HKHistogramChartViewController *)self dataFormatter];
  v16 = [[HKHistogramAnnotationViewDataSource alloc] initWithFormatter:v15];
  [(HKHistogramChartViewController *)self setAnnotationViewDataSource:v16];

  uint64_t v17 = [HKLollipopController alloc];
  v18 = [(HKHistogramChartViewController *)self annotationViewDataSource];
  v19 = [(HKHistogramChartViewController *)self view];
  objc_super v20 = [(HKLollipopController *)v17 initWithAnnotationDataSource:v18 parentView:v19 delegate:self];
  [(HKHistogramChartViewController *)self setLollipopController:v20];
}

- (HKScalarGraphViewController)graphViewController
{
  graphViewController = self->_graphViewController;
  if (!graphViewController)
  {
    v4 = objc_alloc_init(HKHistogramAxisDimension);
    id v5 = [(HKHistogramChartViewController *)self dataSource];
    [(HKHistogramAxisDimension *)v4 setDataSource:v5];

    v6 = [HKScalarGraphViewController alloc];
    [(HKHistogramChartViewController *)self minimumGraphViewHeight];
    v7 = -[HKScalarGraphViewController initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:](v6, "initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:", v4, 3, 0);
    v8 = self->_graphViewController;
    self->_graphViewController = v7;

    v9 = [(HKGraphViewController *)self->_graphViewController graphView];
    [v9 setDelegate:self];

    v10 = [(HKGraphViewController *)self->_graphViewController graphView];
    [v10 setMultiSeriesSelection:1];

    id v11 = [(HKGraphViewController *)self->_graphViewController graphView];
    [v11 setDisableSelection:0];

    double v12 = *MEMORY[0x1E4FB2848];
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v15 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    v16 = [(HKGraphViewController *)self->_graphViewController graphView];
    objc_msgSend(v16, "setAxisInset:", v12, v13, v14, v15);

    uint64_t v17 = [(HKGraphViewController *)self->_graphViewController graphView];
    v18 = [v17 xAxis];
    v19 = [v18 preferredStyle];
    objc_super v20 = [v19 labelStyle];
    [v20 setVerticalAlignment:2];

    graphViewController = self->_graphViewController;
  }
  return graphViewController;
}

- (CGSize)_barCornerRadiusForCurrentDevice
{
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v2 isiPad]) {
    double v3 = 3.0;
  }
  else {
    double v3 = 1.5;
  }

  double v4 = v3;
  double v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (HKHistogramBarSeries)histogramSeries
{
  histogramSeries = self->_histogramSeries;
  if (!histogramSeries)
  {
    double v4 = [HKHistogramBarSeries alloc];
    double v5 = [(HKHistogramChartViewController *)self displayType];
    v6 = [v5 displayCategory];
    v7 = [v6 fillStyle];
    v8 = [(HKHistogramChartViewController *)self dataSource];
    uint64_t v9 = [v8 numberOfBins];
    [(HKHistogramChartViewController *)self _barCornerRadiusForCurrentDevice];
    v10 = -[HKHistogramBarSeries initWithFillStyle:numberOfColumns:cornerRadii:](v4, "initWithFillStyle:numberOfColumns:cornerRadii:", v7, v9);
    id v11 = self->_histogramSeries;
    self->_histogramSeries = v10;

    double v12 = self->_histogramSeries;
    double v13 = [(id)objc_opt_class() defaultVerticalAxis];
    [(HKGraphSeries *)v12 setYAxis:v13];

    double v14 = [(HKHistogramChartViewController *)self dataSource];
    double v15 = [v14 yAxisRange];

    if (v15)
    {
      v16 = +[HKNumericFixedAxisScalingRule ruleWithDefaultAxisBounds:v15 axisBoundsOverrides:0];
      [(HKGraphSeries *)self->_histogramSeries setAxisScalingRule:v16];
    }
    uint64_t v17 = [(HKHistogramChartViewController *)self dataSource];
    [(HKGraphSeries *)self->_histogramSeries setDataSource:v17];

    histogramSeries = self->_histogramSeries;
  }
  return histogramSeries;
}

+ (id)defaultVerticalAxis
{
  v2 = objc_alloc_init(HKSolidFillStyle);
  double v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(HKSolidFillStyle *)v2 setColor:v3];

  double v4 = objc_alloc_init(HKAxisStyle);
  double v5 = [MEMORY[0x1E4FB1618] grayColor];
  v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  v7 = +[HKAxisLabelStyle labelStyleWithColor:v5 font:v6 horizontalAlignment:2 verticalAlignment:2];
  [(HKAxisStyle *)v4 setLabelStyle:v7];

  [(HKAxisStyle *)v4 setTickPositions:1];
  v8 = [MEMORY[0x1E4FB1618] grayColor];
  uint64_t v9 = +[HKStrokeStyle strokeStyleWithColor:v8 lineWidth:2.0];
  [(HKAxisStyle *)v4 setAxisLineStyle:v9];

  [(HKAxisStyle *)v4 setFillStyle:v2];
  [(HKAxisStyle *)v4 setFillInnerPadding:4.0];
  [(HKAxisStyle *)v4 setFillOuterPadding:4.0];
  [(HKAxisStyle *)v4 setLocation:1];
  [(HKAxisStyle *)v4 setShowGridLines:1];
  v10 = [MEMORY[0x1E4FB1618] grayColor];
  id v11 = [v10 colorWithAlphaComponent:0.5];
  double v12 = +[HKStrokeStyle strokeStyleWithColor:v11 lineWidth:HKUIOnePixel()];
  [(HKAxisStyle *)v4 setGridLineStyle:v12];

  double v13 = [MEMORY[0x1E4FB1618] grayColor];
  double v14 = +[HKStrokeStyle strokeStyleWithColor:v13 lineWidth:HKUIOnePixel() * 0.5];
  [(HKAxisStyle *)v4 setBorderStyleForFill:v14];

  double v15 = objc_alloc_init(HKNumericAxisConfiguration);
  [(HKAxisConfiguration *)v15 setPreferredStyle:v4];
  v16 = [[HKNumericAxis alloc] initWithConfiguration:v15];

  return v16;
}

- (void)_pinView:(id)a3 toParentView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [v6 leadingAnchor];
  v8 = [v5 leadingAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [v6 trailingAnchor];
  id v11 = [v5 trailingAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  double v13 = [v6 topAnchor];
  double v14 = [v5 topAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  id v18 = [v6 bottomAnchor];

  v16 = [v5 bottomAnchor];

  uint64_t v17 = [v18 constraintEqualToAnchor:v16];
  [v17 setActive:1];
}

- (id)_descriptionDateFormatter
{
  v2 = (void *)_descriptionDateFormatter_formatter;
  if (!_descriptionDateFormatter_formatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    double v4 = (void *)_descriptionDateFormatter_formatter;
    _descriptionDateFormatter_formatter = (uint64_t)v3;

    [(id)_descriptionDateFormatter_formatter setDateFormat:@"MM/dd/yyyy"];
    v2 = (void *)_descriptionDateFormatter_formatter;
  }
  return v2;
}

- (id)_displayDescriptionForDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHistogramChartViewController *)self _descriptionDateFormatter];
  id v6 = [v4 samplesStartDate];
  v7 = [v5 stringFromDate:v6];

  v8 = [(HKHistogramChartViewController *)self _descriptionDateFormatter];
  uint64_t v9 = [v4 samplesEndDate];

  v10 = [v8 stringFromDate:v9];

  id v11 = [NSString stringWithFormat:@"%@ - %@", v7, v10];

  return v11;
}

- (void)didCompleteFetchForDataSource:(id)a3
{
  id v4 = [(HKHistogramChartViewController *)self displayType];
  id v5 = [v4 localization];
  id v21 = [v5 displayName];

  id v6 = [(HKHistogramChartViewController *)self dataSource];
  v7 = [(HKHistogramChartViewController *)self _displayDescriptionForDataSource:v6];

  v8 = [NSString stringWithFormat:@"%@ Histogram\n%@", v21, v7];
  uint64_t v9 = [(HKHistogramChartViewController *)self headerLabel];
  [v9 setText:v8];

  v10 = [(HKHistogramChartViewController *)self dataSource];
  uint64_t v11 = [v10 numberOfBins];
  double v12 = [(HKHistogramChartViewController *)self histogramSeries];
  [v12 setNumberOfColumns:v11];

  double v13 = [(HKHistogramChartViewController *)self graphViewController];
  double v14 = [v13 graphView];
  double v15 = [v14 xAxis];
  v16 = [v15 valueForKeyPath:@"axisLabelCache"];
  [v16 performSelector:sel_invalidateCache];

  uint64_t v17 = [(HKHistogramChartViewController *)self dataSource];
  id v18 = [v17 xAxisRange];

  v19 = [(HKHistogramChartViewController *)self graphViewController];
  objc_super v20 = [v19 graphView];
  [v20 setEffectiveAxisRange:v18 effectiveVisibleRangeCadence:v18 effectiveVisibleRangeActive:v18];
}

- (void)updateAnnotationDataSource:(id)a3 pointContexts:(id)a4
{
  id v5 = a4;
  id v6 = [(HKHistogramChartViewController *)self annotationViewDataSource];
  [v6 updateWithPointSelectionContexts:v5];
}

- (int64_t)stackCountForGraphView:(id)a3
{
  return 1;
}

- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(HKHistogramChartViewController *)self histogramSeries];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)seriesSelectionLineColorForGraphView:(id)a3
{
  id v3 = [(HKHistogramChartViewController *)self displayType];
  id v4 = [v3 color];

  return v4;
}

- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3
{
  return 1;
}

- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4
{
  id v17 = a4;
  if (+[HKLollipopController pointSelectionContextsHaveUserInfo:](HKLollipopController, "pointSelectionContextsHaveUserInfo:"))
  {
    id v5 = [(HKHistogramChartViewController *)self lollipopController];
    int v6 = [v5 isVisible];

    if (v6)
    {
      v7 = [(HKHistogramChartViewController *)self lollipopController];
      [v7 updateWithPointContexts:v17];
    }
    else
    {
      v8 = [(HKHistogramChartViewController *)self headerLabel];
      [v8 frame];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;

      v7 = [(HKHistogramChartViewController *)self lollipopController];
      objc_msgSend(v7, "setVisibleWithRect:pointContexts:animated:", v17, 1, v10, v12, v14, v16);
    }
  }
}

- (void)graphViewDidEndSelection:(id)a3
{
  id v3 = [(HKHistogramChartViewController *)self lollipopController];
  [v3 setInvisibleAnimated:1];
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (double)minimumGraphViewHeight
{
  return self->_minimumGraphViewHeight;
}

- (void)setMinimumGraphViewHeight:(double)a3
{
  self->_minimumGraphViewHeight = a3;
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
}

- (void)setGraphViewController:(id)a3
{
}

- (void)setHistogramSeries:(id)a3
{
}

- (HKHistogramChartDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (HKHistogramChartDataFormatter)dataFormatter
{
  return self->_dataFormatter;
}

- (void)setDataFormatter:(id)a3
{
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (HKHistogramAnnotationViewDataSource)annotationViewDataSource
{
  return self->_annotationViewDataSource;
}

- (void)setAnnotationViewDataSource:(id)a3
{
}

- (HKLollipopController)lollipopController
{
  return self->_lollipopController;
}

- (void)setLollipopController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lollipopController, 0);
  objc_storeStrong((id *)&self->_annotationViewDataSource, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_dataFormatter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_histogramSeries, 0);
  objc_storeStrong((id *)&self->_graphViewController, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end