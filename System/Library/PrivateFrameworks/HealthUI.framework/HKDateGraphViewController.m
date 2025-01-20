@interface HKDateGraphViewController
- (BOOL)disableXAxis;
- (CGSize)minimumSize;
- (HKDateGraphViewController)initWithCoder:(id)a3;
- (HKDateGraphViewController)initWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6;
- (HKDateGraphViewController)initWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6 customDateAxis:(id)a7;
- (HKDateGraphViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSCalendar)currentCalendar;
- (id)_createGraphViewWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6 customDateAxis:(id)a7;
- (id)_dateAxisStyle;
- (id)_xAxisLabelFont;
- (int64_t)defaultAlignmentForTimeScope:(int64_t)a3;
- (void)_marginStyleChangeForContext:(int64_t)a3 graphView:(id)a4;
- (void)_setupGraphViewSelectionStyle;
- (void)graphView:(id)a3 didFinishUserScrollingToValueRange:(id)a4;
- (void)graphView:(id)a3 didUpdateVisibleValueRange:(id)a4 changeContext:(int64_t)a5;
- (void)loadView;
- (void)setCurrentCalendar:(id)a3;
- (void)setDetailView:(id)a3;
- (void)setDisableXAxis:(BOOL)a3;
- (void)setMinimumSize:(CGSize)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HKDateGraphViewController

- (HKDateGraphViewController)initWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6
{
  return [(HKDateGraphViewController *)self initWithDateZoom:a3 previousDateZoom:a4 previousXAxisSpace:a6 currentCalendar:0 customDateAxis:a5];
}

- (HKDateGraphViewController)initWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6 customDateAxis:(id)a7
{
  id v13 = a6;
  v14 = [(HKDateGraphViewController *)self _createGraphViewWithDateZoom:a3 previousDateZoom:a4 previousXAxisSpace:v13 currentCalendar:a7 customDateAxis:a5];
  v18.receiver = self;
  v18.super_class = (Class)HKDateGraphViewController;
  v15 = [(HKGraphViewController *)&v18 initWithGraphView:v14 dateZoom:a3];
  v16 = v15;
  if (v15)
  {
    v15->_minimumSize = (CGSize)xmmword_1E0F05990;
    objc_storeStrong((id *)&v15->_currentCalendar, a6);
  }

  return v16;
}

- (HKDateGraphViewController)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"HKDateGraphViewController.m" lineNumber:72 description:@"Use designated initializer"];

  return 0;
}

- (HKDateGraphViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"HKDateGraphViewController.m" lineNumber:77 description:@"Use designated initializer"];

  return 0;
}

- (void)setMinimumSize:(CGSize)a3
{
  self->_minimumSize = a3;
  id v5 = [(HKDateGraphViewController *)self view];
  [(HKDateGraphViewController *)self minimumSize];
  [v5 setMinimumHeight:v4];
  [(HKDateGraphViewController *)self minimumSize];
  objc_msgSend(v5, "setMinimumWidth:");
}

- (void)loadView
{
  double v4 = -[HKBorderLineView initWithFrame:]([HKBorderLineView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  [(HKDateGraphViewController *)self minimumSize];
  [(HKBorderLineView *)v4 setMinimumHeight:v3];
  [(HKDateGraphViewController *)self minimumSize];
  -[HKBorderLineView setMinimumWidth:](v4, "setMinimumWidth:");
  [(HKBorderLineView *)v4 setPreservesSuperviewLayoutMargins:1];
  [(HKDateGraphViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HKDateGraphViewController;
  [(HKDateGraphViewController *)&v8 viewDidLoad];
  [(HKDateGraphViewController *)self _setupGraphViewSelectionStyle];
  double v3 = [(HKDateGraphViewController *)self view];
  [v3 setClipsToBounds:1];

  double v4 = [(HKDateGraphViewController *)self view];
  id v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  v6 = [(HKDateGraphViewController *)self view];
  v7 = [(HKGraphViewController *)self graphView];
  [v6 addSubview:v7];
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)HKDateGraphViewController;
  [(HKDateGraphViewController *)&v17 viewWillLayoutSubviews];
  double v3 = [(HKDateGraphViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(HKGraphViewController *)self graphView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11 + -12.0);

  id v13 = [(HKDateGraphViewController *)self view];
  [v13 layoutMargins];
  double v15 = v14;

  if (v15 > 16.0)
  {
    v16 = [(HKGraphViewController *)self graphView];
    [v16 setHardLeftMarginWidth:v15];
  }
}

- (id)_createGraphViewWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6 customDateAxis:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  double v14 = [HKGraphView alloc];
  double v15 = -[HKGraphView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HKGraphView *)v15 setXAxisSpace:a5];
  v16 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisMajorGridColor");
  [(HKGraphView *)v15 setOutlineColor:v16];

  [(HKGraphView *)v15 setOutlineOptions:5];
  [(HKGraphView *)v15 setFeatheringOptions:15];
  if (v13)
  {
    objc_super v17 = (HKDateAxis *)v13;
  }
  else
  {
    objc_super v18 = [HKDateAxis alloc];
    v19 = [(HKDateGraphViewController *)self _dateAxisStyle];
    objc_super v17 = [(HKDateAxis *)v18 initWithCurrentCalendar:v12 axisStyle:v19];
  }
  [(HKGraphView *)v15 setMinimumDateZoom:a3];
  [(HKGraphView *)v15 setMaximumDateZoom:a3];
  [(HKGraphView *)v15 setPreviousDateZoom:a4];
  [(HKGraphView *)v15 setXAxis:v17];
  [(HKGraphView *)v15 setCurrentCalendar:v12];
  [(HKGraphView *)v15 setVirtualLeftMarginWidth:0.0];
  [(HKGraphView *)v15 setVirtualLeftMarginStyle:0];
  [(HKGraphView *)v15 setHardLeftMarginWidth:16.0];
  [(HKGraphView *)v15 setVirtualRightMarginWidth:0.0];
  [(HKGraphView *)v15 setVirtualRightMarginStyle:2];

  return v15;
}

- (void)_setupGraphViewSelectionStyle
{
  double v6 = objc_alloc_init(HKGraphViewSelectionStyle);
  double v3 = +[HKStrokeStyle strokeStyleWithColor:0 lineWidth:2.0];
  [(HKGraphViewSelectionStyle *)v6 setSelectedPointLineStrokeStyle:v3];

  double v4 = +[HKStrokeStyle strokeStyleWithColor:0 lineWidth:HKUIOnePixel()];
  [(HKGraphViewSelectionStyle *)v6 setTouchPointLineStrokeStyle:v4];

  [(HKGraphViewSelectionStyle *)v6 setUnselectedSeriesAlpha:1.0];
  double v5 = [(HKGraphViewController *)self graphView];
  [v5 setSelectionStyle:v6];
}

- (id)_xAxisLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
}

- (id)_dateAxisStyle
{
  double v3 = objc_opt_new();
  double v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisLabelColor");
  double v5 = +[HKStrokeStyle strokeStyleWithColor:v4 lineWidth:1.0];
  [v3 setAxisLineStyle:v5];

  double v6 = [(HKDateGraphViewController *)self _xAxisLabelFont];
  double v7 = +[HKAxisLabelStyle labelStyleWithColor:v4 font:v6 horizontalAlignment:0 verticalAlignment:3];
  [v3 setLabelStyle:v7];

  [v3 setTickPositions:0];
  [v3 setAxisLabelPosition:1];
  [v3 setShowGridLines:1];
  [v3 setLocation:2];
  [v3 setFillInnerPadding:3.0];
  double v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  double v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisMajorGridColor");
  double v10 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisMinorGridColor");
  double v11 = +[HKStrokeStyle strokeStyleWithColor:v9 lineWidth:0.5];
  [v11 setDashStyle:1];
  [v3 setGridLineStyle:v11];
  id v12 = +[HKStrokeStyle strokeStyleWithColor:v10 lineWidth:0.5];
  [v12 setDashStyle:1];
  [v3 setMinorGridLineStyle:v12];
  id v13 = +[HKStrokeStyle strokeStyleWithColor:v8 lineWidth:0.5];
  [v13 setDashStyle:0];
  [v3 setReferenceGridLineStyle:v13];

  return v3;
}

- (void)_marginStyleChangeForContext:(int64_t)a3 graphView:(id)a4
{
  BOOL v4 = a3 != 1;
  id v6 = a4;
  uint64_t v5 = 2 * v4;
  [v6 setVirtualLeftMarginStyle:v5];
  [v6 setVirtualRightMarginStyle:v5];
}

- (void)graphView:(id)a3 didUpdateVisibleValueRange:(id)a4 changeContext:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  [(HKDateGraphViewController *)self _marginStyleChangeForContext:a5 graphView:v9];
  id v10 = [(HKGraphViewController *)self graphViewDelegateProxy];
  [v10 graphView:v9 didUpdateVisibleValueRange:v8 changeContext:a5];
}

- (void)graphView:(id)a3 didFinishUserScrollingToValueRange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKGraphViewController *)self graphViewDelegateProxy];
  [v8 graphView:v7 didFinishUserScrollingToValueRange:v6];
}

- (int64_t)defaultAlignmentForTimeScope:(int64_t)a3
{
  BOOL v4 = [(HKGraphViewController *)self graphViewDelegateProxy];
  int64_t v5 = [v4 defaultAlignmentForTimeScope:a3];

  return v5;
}

- (void)setDisableXAxis:(BOOL)a3
{
  BOOL v3 = a3;
  self->_disableXAxis = a3;
  id v4 = [(HKGraphViewController *)self graphView];
  [v4 setDisableXAxis:v3];
}

- (void)setDetailView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKDateGraphViewController;
  [(HKGraphViewController *)&v5 setDetailView:a3];
  id v4 = [(HKGraphViewController *)self graphView];
  [v4 setVirtualLeftMarginWidth:0.0];
}

- (CGSize)minimumSize
{
  double width = self->_minimumSize.width;
  double height = self->_minimumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)disableXAxis
{
  return self->_disableXAxis;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
}

- (void).cxx_destruct
{
}

@end