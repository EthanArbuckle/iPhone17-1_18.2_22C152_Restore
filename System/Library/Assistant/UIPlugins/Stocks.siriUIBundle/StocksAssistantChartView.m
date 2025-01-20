@interface StocksAssistantChartView
+ (CGGradient)LineBackgroundGradient;
- (Stock)stock;
- (StockChartData)chartData;
- (StocksAssistantChartView)initWithFrame:(CGRect)a3;
- (void)_prepareXAxisLabelsAndPositions;
- (void)_prepareXAxisLabelsForLabelInfoArray:(id)a3;
- (void)_prepareYAxisLabelsAndPositions;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setChartData:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setStock:(id)a3;
- (void)stockGraphViewReadyForDisplay:(id)a3;
@end

@implementation StocksAssistantChartView

+ (CGGradient)LineBackgroundGradient
{
  result = (CGGradient *)qword_12380;
  if (!qword_12380)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    id v4 = +[UIColor colorWithWhite:0.08 alpha:0.2];
    id v5 = [v4 CGColor];
    id v6 = +[UIColor colorWithWhite:0.08 alpha:0.5];
    v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, [v6 CGColor], 0);

    qword_12380 = (uint64_t)CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v7, 0);
    CGColorSpaceRelease(DeviceRGB);
    return (CGGradient *)qword_12380;
  }
  return result;
}

- (StocksAssistantChartView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)StocksAssistantChartView;
  v3 = -[StocksAssistantChartView initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (StockGraphView *)objc_msgSend(objc_alloc((Class)StockGraphView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    graph = v3->_graph;
    v3->_graph = v4;

    [(StockGraphView *)v3->_graph setChartViewDelegate:v3];
    uint64_t v6 = +[StockChartDisplayMode defaultDisplayMode];
    displayMode = v3->_displayMode;
    v3->_displayMode = (StockChartDisplayMode *)v6;

    v8 = +[UIColor systemMidGrayColor];
    [(StockChartDisplayMode *)v3->_displayMode setLineColor:v8];

    v9 = +[UIColor blackColor];
    [(StockChartDisplayMode *)v3->_displayMode setAxisLabelsColor:v9];

    v10 = +[UIColor systemGrayColor];
    [(StockChartDisplayMode *)v3->_displayMode setXAxisKeylineColor:v10];

    v11 = +[UIColor colorWithWhite:0.5 alpha:1.0];
    [(StockChartDisplayMode *)v3->_displayMode setBackgroundLinesColor:v11];

    [(StockChartDisplayMode *)v3->_displayMode setLineWidth:1.0];
    [(StockChartDisplayMode *)v3->_displayMode setShowsVolume:0];
    -[StockChartDisplayMode setBackgroundGradient:](v3->_displayMode, "setBackgroundGradient:", [(id)objc_opt_class() LineBackgroundGradient]);
    [(StockGraphView *)v3->_graph setDisplayMode:v3->_displayMode];
    [(StocksAssistantChartView *)v3 addSubview:v3->_graph];
    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    xAxisLabels = v3->_xAxisLabels;
    v3->_xAxisLabels = v12;

    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    yAxisLabels = v3->_yAxisLabels;
    v3->_yAxisLabels = v14;

    v16 = (ChartLabelInfoManager *)objc_alloc_init((Class)ChartLabelInfoManager);
    labelInfoManager = v3->_labelInfoManager;
    v3->_labelInfoManager = v16;

    v18 = +[UIColor clearColor];
    [(StocksAssistantChartView *)v3 setBackgroundColor:v18];
  }
  return v3;
}

- (void)dealloc
{
  +[GraphRenderer clearSharedRenderer];
  v3.receiver = self;
  v3.super_class = (Class)StocksAssistantChartView;
  [(StocksAssistantChartView *)&v3 dealloc];
}

- (void)stockGraphViewReadyForDisplay:(id)a3
{
  xAxisLabels = self->_xAxisLabels;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_51BC;
  v7[3] = &unk_C3E0;
  v7[4] = self;
  [(NSMutableArray *)xAxisLabels enumerateObjectsUsingBlock:v7];
  yAxisLabels = self->_yAxisLabels;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_51C8;
  v6[3] = &unk_C3E0;
  v6[4] = self;
  [(NSMutableArray *)yAxisLabels enumerateObjectsUsingBlock:v6];
  [(StockGraphView *)self->_graph setNeedsDisplay];
  [(StocksAssistantChartView *)self setNeedsDisplay];
  [(StocksAssistantChartView *)self setNeedsLayout];
}

- (void)setChartData:(id)a3
{
  p_chartData = &self->_chartData;
  v9 = (StockChartData *)a3;
  if (*p_chartData != v9)
  {
    objc_storeStrong((id *)&self->_chartData, a3);
    if (*p_chartData)
    {
      [(StockGraphView *)self->_graph loadStockChartData:v9];
      [(StockGraphView *)self->_graph bounds];
      if (v6 != CGSizeZero.width || v7 != CGSizeZero.height)
      {
        -[StockGraphView recomputePathsAndRenderIfNeededForSize:](self->_graph, "recomputePathsAndRenderIfNeededForSize:", v6, v7);
        [(StocksAssistantChartView *)self _prepareXAxisLabelsAndPositions];
        [(StocksAssistantChartView *)self _prepareYAxisLabelsAndPositions];
      }
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(StocksAssistantChartView *)self frame];
  v23.origin.double x = v8;
  v23.origin.double y = v9;
  v23.size.double width = v10;
  v23.size.double height = v11;
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  if (!CGRectEqualToRect(v22, v23))
  {
    v12 = +[UIDevice currentDevice];
    v13 = (char *)[v12 userInterfaceIdiom];

    if (v13 == (unsigned char *)&dword_0 + 1)
    {
      RoundToPixel();
      double v15 = v14;
      double v16 = 49.0;
    }
    else
    {
      double v15 = 80.0;
      double v16 = 40.0;
    }
    -[StockGraphView setFrame:](self->_graph, "setFrame:", 0.0, 0.0, width - v16, v15);
    chartData = self->_chartData;
    if (chartData)
    {
      [(StockChartData *)chartData clearAllImageSets];
      graph = self->_graph;
      [(StockGraphView *)graph bounds];
      -[StockGraphView recomputePathsAndRenderIfNeededForSize:](graph, "recomputePathsAndRenderIfNeededForSize:", v19, v20);
      [(StocksAssistantChartView *)self _prepareXAxisLabelsAndPositions];
      [(StocksAssistantChartView *)self _prepareYAxisLabelsAndPositions];
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)StocksAssistantChartView;
  -[StocksAssistantChartView setFrame:](&v21, "setFrame:", x, y, width, height);
}

- (void)layoutSubviews
{
  if (self->_chartData && [(StockGraphView *)self->_graph isRendered])
  {
    id v43 = [(StockChartData *)self->_chartData xAxisLabelInfoArrayForMode:self->_displayMode];
    objc_super v3 = [(StockChartData *)self->_chartData yAxisLabelInfoArrayForMode:self->_displayMode];
    id v4 = +[UIDevice currentDevice];
    [v4 userInterfaceIdiom];

    id v5 = (char *)[v43 count];
    if (v5)
    {
      double v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        CGFloat v8 = [(NSMutableArray *)self->_xAxisLabels objectAtIndex:i];
        CGFloat v9 = [v43 objectAtIndex:i];
        [(StockGraphView *)self->_graph frame];
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        [v8 frame];
        double v19 = v18;
        double v21 = v20;
        [v9 position];
        double v23 = v22;
        [(StockGraphView *)self->_graph frame];
        double v25 = round(v19 * -0.5 + v23 * v24);
        v45.origin.double x = v11;
        v45.origin.double y = v13;
        v45.size.double width = v15;
        v45.size.double height = v17;
        CGRectGetMaxY(v45);
        v26 = [v8 font];
        [v26 ascender];
        RoundToPixel();
        double v28 = v27;

        objc_msgSend(v8, "setFrame:", v25, v28, v19, v21);
      }
    }
    v29 = (char *)[v3 count];
    if (v29)
    {
      v30 = v29;
      for (j = 0; j != v30; ++j)
      {
        v32 = [(NSMutableArray *)self->_yAxisLabels objectAtIndex:j];
        v33 = [v3 objectAtIndex:j];
        [v32 frame];
        double v35 = v34;
        double v37 = fmin(v36, 35.5);
        [(StocksAssistantChartView *)self bounds];
        CGFloat v38 = CGRectGetMaxX(v46) - v37;
        [v33 position];
        double v40 = 1.0 - v39;
        [(StockGraphView *)self->_graph frame];
        float v42 = v40 * (v41 - v35 + -5.0) + 2.0;
        objc_msgSend(v32, "setFrame:", v38, floorf(v42), v37, v35);
      }
    }
  }
}

- (void)_prepareXAxisLabelsForLabelInfoArray:(id)a3
{
  id v16 = a3;
  [(NSMutableArray *)self->_xAxisLabels enumerateObjectsUsingBlock:&stru_C420];
  [(NSMutableArray *)self->_xAxisLabels removeAllObjects];
  id v4 = (char *)[v16 count];
  if (v4)
  {
    id v5 = v4;
    double v6 = 0;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    do
    {
      double v10 = [v16 objectAtIndex:v6];
      id v11 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      double v12 = [v10 string];
      [v11 setText:v12];

      [v11 setTextAlignment:2];
      CGFloat v13 = +[UIColor blackColor];
      [v11 setTextColor:v13];

      double v14 = +[UIFont systemFontOfSize:12.0];
      [v11 setFont:v14];

      CGFloat v15 = +[UIColor clearColor];
      [v11 setBackgroundColor:v15];

      [v11 sizeToFit];
      [(NSMutableArray *)self->_xAxisLabels addObject:v11];

      ++v6;
    }
    while (v5 != v6);
  }
}

- (void)_prepareXAxisLabelsAndPositions
{
  objc_super v3 = +[NSCalendar currentCalendar];
  id v4 = [v3 copy];

  id v5 = [(StockChartData *)self->_chartData marketTimeZone];
  [v4 setTimeZone:v5];

  double v6 = [(StockChartData *)self->_chartData marketOpenDate];
  double v7 = [(StockChartData *)self->_chartData marketCloseDate];
  CGFloat v8 = [v4 components:96 fromDate:v6 toDate:v7 options:0];

  CGFloat v9 = [(StockChartData *)self->_chartData marketOpenDate];
  j = [v4 components:96 fromDate:v9];

  id v11 = [(StockChartData *)self->_chartData marketCloseDate];
  double v12 = [v4 components:96 fromDate:v11];

  id v13 = [j minute];
  if (v13) {
    float v14 = 1.0 - (float)((float)(uint64_t)v13 / 60.0);
  }
  else {
    float v14 = 0.0;
  }
  float v15 = (float)(uint64_t)[v12 minute] / 60.0;
  float v16 = ceilf(v14);
  uint64_t v17 = (uint64_t)(float)(v16 + (float)(uint64_t)[v8 hour]) - ((float)(v15 + v14) >= 1.0);
  if (v17 <= 1) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = v17;
  }
  *(float *)&double v18 = v15 + v14;
  double v20 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v19, v18);
  if ((unint64_t)(v17 - 25) > 0xFFFFFFFFFFFFFFE7)
  {
    v48 = j;
    id v49 = v4;
    uint64_t v22 = (uint64_t)[v12 hour];
    uint64_t v23 = -v22;
    uint64_t v47 = v17;
    uint64_t v24 = v17;
    do
    {
      double v25 = v20;
      uint64_t v26 = (v22 & ~(v22 >> 63)) + v23;
      BOOL v27 = v26 != 0;
      unint64_t v28 = ((unint64_t)(v26 - v27) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64;
      unint64_t v29 = (v26 - v27) / 0x18uLL;
      if ((v22 & ~(v22 >> 63)) + v23) {
        unint64_t v30 = v29 + 1;
      }
      else {
        unint64_t v30 = v28 >> 4;
      }
      if ([(ChartLabelInfoManager *)self->_labelInfoManager use24hrTime])
      {
        uint64_t v31 = v22 + 24 * v30;
      }
      else if (v22 + 24 * (v27 + (v28 >> 4)) - 12 * ((v22 + 24 * (v27 + (v28 >> 4))) / 0xC))
      {
        uint64_t v31 = v22 + 24 * (v27 + (v28 >> 4)) - 12 * ((v22 + 24 * (v27 + (v28 >> 4))) / 0xC);
      }
      else
      {
        uint64_t v31 = 12;
      }
      v32 = [(ChartLabelInfoManager *)self->_labelInfoManager labelInfoWithUnsignedInteger:v31];
      id v33 = [v32 copy];
      double v20 = v25;
      [v25 addObject:v33];

      --v22;
      ++v23;
      --v24;
    }
    while (v24);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v34 = v25;
    id v35 = [v34 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v35)
    {
      id v36 = v35;
      float v37 = 1.0 / (float)(v15 + (float)(v14 + (float)((float)v47 - v16)));
      float v38 = 1.0 - (float)(v37 * v15);
      uint64_t v39 = *(void *)v51;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v51 != v39) {
            objc_enumerationMutation(v34);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * i) setPosition:v38];
          float v38 = v38 - v37;
        }
        id v36 = [v34 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v36);
    }

    if (v47 < 13)
    {
      LODWORD(v44) = 0;
      j = v48;
    }
    else
    {
      id v41 = objc_alloc_init((Class)NSMutableIndexSet);
      float v42 = [v34 objectAtIndex:0];
      id v43 = [v42 string];
      unint64_t v44 = (unint64_t)[v43 integerValue] & 1;

      unint64_t v45 = v44 ^ 1;
      for (j = v48; (unint64_t)[v34 count] > v45; v45 += 2)
        [v41 addIndex:v45];
      [v34 removeObjectsAtIndexes:v41];
    }
    if (v15 > 0.0 || v44)
    {
      CGRect v46 = [(ChartLabelInfoManager *)self->_labelInfoManager labelInfoForYAxis];
      [v34 insertObject:v46 atIndex:0];
    }
    [(StocksAssistantChartView *)self _prepareXAxisLabelsForLabelInfoArray:v34];
    [(StockChartData *)self->_chartData setXAxisLabelInfoArray:v34 forDisplayMode:self->_displayMode];
    id v4 = v49;
  }
  else
  {
    double v21 = [(ChartLabelInfoManager *)self->_labelInfoManager labelInfoForYAxis];
    [v20 addObject:v21];

    [(StocksAssistantChartView *)self _prepareXAxisLabelsForLabelInfoArray:v20];
    [(StockChartData *)self->_chartData setXAxisLabelInfoArray:v20 forDisplayMode:self->_displayMode];
  }
}

- (void)_prepareYAxisLabelsAndPositions
{
  float v3 = *((double *)[(StockChartData *)self->_chartData minValue] + 1);
  float v4 = *((double *)[(StockChartData *)self->_chartData maxValue] + 1);
  float v5 = v4 - v3;
  double v6 = (float)(v4 - v3) * 0.5;
  BOOL v7 = v6 >= 2.0 && v4 >= 100.0;
  CGFloat v9 = +[NSMutableArray arrayWithCapacity:3];
  unsigned int v10 = 0;
  id v11 = 0;
  double v12 = 0;
  if (v6 >= 0.0199999996) {
    unsigned int v13 = 2;
  }
  else {
    unsigned int v13 = 3;
  }
  do
  {
    float v14 = v3 + (float)(v5 * (float)((float)v10 * 0.5));
    if (v7)
    {
      LODWORD(v8) = llroundf(v14);
      float v15 = +[NSNumber numberWithInt:v8];
      signed int v16 = 0;
    }
    else
    {
      unsigned int v17 = [(Stock *)self->_stock pricePrecision];
      if (v13 <= v17) {
        signed int v16 = v17;
      }
      else {
        signed int v16 = v13;
      }
      *(float *)&double v18 = v3 + (float)(v5 * (float)((float)v10 * 0.5));
      float v15 = +[NSNumber numberWithFloat:v18];
    }

    id v35 = objc_alloc_init((Class)ChartLabelInfo);
    [v35 setPosition:(float)((float)(v14 - v3) / v5)];
    uint64_t v19 = +[StockDataFormatter sharedDataFormatter];
    double v20 = [v19 formattedNumber:v15 withPrecision:v16 useGroupSeparator:0];
    [v35 setString:v20];

    [v9 addObject:v35];
    double v12 = v35;
    ++v10;
    id v11 = v15;
  }
  while (v10 != 3);
  [(NSMutableArray *)self->_yAxisLabels enumerateObjectsUsingBlock:&stru_C440];
  [(NSMutableArray *)self->_yAxisLabels removeAllObjects];
  double v21 = (char *)[v9 count];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = 0;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    do
    {
      BOOL v27 = [v9 objectAtIndex:v23];
      id v28 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      unint64_t v29 = [v27 string];
      [v28 setText:v29];

      [v28 setTextAlignment:1];
      unint64_t v30 = +[UIColor blackColor];
      [v28 setTextColor:v30];

      uint64_t v31 = +[UIFont systemFontOfSize:12.0];
      [v28 setFont:v31];

      v32 = +[UIColor clearColor];
      [v28 setBackgroundColor:v32];

      [v28 setAdjustsFontSizeToFitWidth:1];
      [v28 setBaselineAdjustment:1];
      id v33 = [v28 font];
      [v33 pointSize];
      [v28 setMinimumScaleFactor:8.0 / v34];

      [v28 sizeToFit];
      [(NSMutableArray *)self->_yAxisLabels addObject:v28];

      ++v23;
    }
    while (v22 != v23);
  }
  [(StockChartData *)self->_chartData setYAxisLabelInfoArray:v9 forDisplayMode:self->_displayMode];
}

- (void)drawRect:(CGRect)a3
{
  if (self->_chartData)
  {
    CGFloat width = a3.size.width;
    if ([(StockGraphView *)self->_graph isRendered])
    {
      float v5 = [(StockChartData *)self->_chartData xAxisLabelInfoArrayForMode:self->_displayMode];
      RoundToPixel();
      CGFloat v7 = v6;
      RoundToPixel();
      double v9 = v8 * 0.5;
      CurrentContext = UIGraphicsGetCurrentContext();
      id v11 = +[UIColor siriui_keylineColor];
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v11 CGColor]);

      CGContextSetLineWidth(CurrentContext, v7);
      CGContextSetLineJoin(CurrentContext, kCGLineJoinMiter);
      CGContextSetLineCap(CurrentContext, kCGLineCapSquare);
      [(StockGraphView *)self->_graph frame];
      double v12 = v9 + CGRectGetMaxY(v27);
      CGContextBeginPath(CurrentContext);
      CGContextMoveToPoint(CurrentContext, 0.0, v12);
      CGContextAddLineToPoint(CurrentContext, width, v12);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v13 = v5;
      id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v23;
        do
        {
          unsigned int v17 = 0;
          do
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)v17), "position", (void)v22);
            double v19 = v18;
            [(StockGraphView *)self->_graph frame];
            CGFloat v21 = v9 + v19 * v20;
            CGContextMoveToPoint(CurrentContext, v21, 0.0);
            CGContextAddLineToPoint(CurrentContext, v21, v12);
            unsigned int v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v15);
      }

      CGContextStrokePath(CurrentContext);
    }
  }
}

- (StockChartData)chartData
{
  return self->_chartData;
}

- (Stock)stock
{
  return self->_stock;
}

- (void)setStock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stock, 0);
  objc_storeStrong((id *)&self->_chartData, 0);
  objc_storeStrong((id *)&self->_displayMode, 0);
  objc_storeStrong((id *)&self->_labelInfoManager, 0);
  objc_storeStrong((id *)&self->_yAxisLabels, 0);
  objc_storeStrong((id *)&self->_xAxisLabels, 0);

  objc_storeStrong((id *)&self->_graph, 0);
}

@end