@interface HKPopulationNormsChartGridView
- (CGRect)_determineCanvasRectInRect:(CGRect)a3 yAxisWidth:(double)a4 xAxisHeight:(double)a5;
- (CGRect)determineCanvasRect;
- (HKPopulationNormsAxisView)xAxisView;
- (HKPopulationNormsAxisView)yAxisView;
- (HKPopulationNormsChartGridView)initWithXAxisLabels:(id)a3 YAxisLabels:(id)a4;
- (double)_determineXAxisHeight;
- (double)_determineYAxisWidth;
- (unint64_t)xAxisSegmentCount;
- (unint64_t)yAxisSegmentCount;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)relocalizeAxisLabels;
- (void)setXAxisView:(id)a3;
- (void)setYAxisView:(id)a3;
@end

@implementation HKPopulationNormsChartGridView

- (HKPopulationNormsChartGridView)initWithXAxisLabels:(id)a3 YAxisLabels:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKPopulationNormsChartGridView;
  v8 = -[HKPopulationNormsChartGridView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v8)
  {
    v9 = [[HKPopulationNormsAxisView alloc] initWithOrientation:1 axisLabels:v6];
    xAxisView = v8->_xAxisView;
    v8->_xAxisView = v9;

    v11 = [[HKPopulationNormsAxisView alloc] initWithOrientation:0 axisLabels:v7];
    yAxisView = v8->_yAxisView;
    v8->_yAxisView = v11;

    [(HKPopulationNormsChartGridView *)v8 addSubview:v8->_xAxisView];
    [(HKPopulationNormsChartGridView *)v8 addSubview:v8->_yAxisView];
    v8->_xAxisSegmentCount = [v6 count];
    v8->_yAxisSegmentCount = [v7 count];
  }

  return v8;
}

- (double)_determineXAxisHeight
{
  [(HKPopulationNormsAxisView *)self->_xAxisView minorDimensionSize];
  return result;
}

- (double)_determineYAxisWidth
{
  [(HKPopulationNormsAxisView *)self->_yAxisView minorDimensionSize];
  return result;
}

- (CGRect)determineCanvasRect
{
  [(HKPopulationNormsChartGridView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(HKPopulationNormsChartGridView *)self _determineYAxisWidth];
  double v12 = v11;
  [(HKPopulationNormsChartGridView *)self _determineXAxisHeight];
  -[HKPopulationNormsChartGridView _determineCanvasRectInRect:yAxisWidth:xAxisHeight:](self, "_determineCanvasRectInRect:yAxisWidth:xAxisHeight:", v4, v6, v8, v10, v12, v13);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_determineCanvasRectInRect:(CGRect)a3 yAxisWidth:(double)a4 xAxisHeight:(double)a5
{
  double v5 = a3.origin.x + 0.0;
  double v6 = a3.origin.y + 0.0;
  double v7 = a3.size.width - (a4 + 0.0);
  double v8 = a3.size.height - (a5 + 0.0);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)relocalizeAxisLabels
{
  [(HKPopulationNormsAxisView *)self->_xAxisView setNeedsLayout];
  yAxisView = self->_yAxisView;
  [(HKPopulationNormsAxisView *)yAxisView setNeedsLayout];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)HKPopulationNormsChartGridView;
  [(HKPopulationNormsChartGridView *)&v9 layoutSubviews];
  [(HKPopulationNormsChartGridView *)self _determineYAxisWidth];
  double v4 = v3;
  [(HKPopulationNormsChartGridView *)self _determineXAxisHeight];
  [(HKPopulationNormsChartGridView *)self frame];
  -[HKPopulationNormsChartGridView _determineCanvasRectInRect:yAxisWidth:xAxisHeight:](self, "_determineCanvasRectInRect:yAxisWidth:xAxisHeight:");
  double v6 = v5;
  double v8 = v7;
  -[HKPopulationNormsAxisView setFrame:](self->_xAxisView, "setFrame:", 0.0, v7);
  -[HKPopulationNormsAxisView setFrame:](self->_yAxisView, "setFrame:", v6, 0.0, v4, v8);
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)HKPopulationNormsChartGridView;
  -[HKPopulationNormsChartGridView drawRect:](&v25, sel_drawRect_);
  CurrentContext = UIGraphicsGetCurrentContext();
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v29);
  [(HKPopulationNormsChartGridView *)self _determineYAxisWidth];
  double v14 = v13;
  [(HKPopulationNormsChartGridView *)self _determineXAxisHeight];
  double v16 = v15;
  objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisMajorGridColor");
  id v17 = objc_claimAutoreleasedReturnValue();
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v17 CGColor]);

  CGContextSetLineWidth(CurrentContext, 0.5);
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, MinX + 0.25, MinY);
  CGContextAddLineToPoint(CurrentContext, MinX + 0.25, MaxY);
  CGContextMoveToPoint(CurrentContext, MinX, MinY + 0.25);
  CGContextAddLineToPoint(CurrentContext, MaxX - v14, MinY + 0.25);
  CGContextMoveToPoint(CurrentContext, MaxX - v14, MinY);
  CGContextAddLineToPoint(CurrentContext, MaxX - v14, MaxY);
  CGContextMoveToPoint(CurrentContext, MinX, MaxY - v16);
  CGContextAddLineToPoint(CurrentContext, MaxX - v14, MaxY - v16);
  CGContextStrokePath(CurrentContext);
  if (self->_yAxisSegmentCount >= 2)
  {
    CGContextBeginPath(CurrentContext);
    unint64_t yAxisSegmentCount = self->_yAxisSegmentCount;
    if (yAxisSegmentCount)
    {
      unint64_t v19 = 0;
      double v20 = (MaxY - MinY - v16) / (double)(yAxisSegmentCount - 1);
      do
      {
        CGContextMoveToPoint(CurrentContext, MinX, MinY + v20 * (double)(int)v19);
        CGContextAddLineToPoint(CurrentContext, MaxX - v14, MinY + v20 * (double)(int)v19++);
      }
      while (self->_yAxisSegmentCount > v19);
    }
    CGContextStrokePath(CurrentContext);
  }
  objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisMinorGridColor");
  id v21 = objc_claimAutoreleasedReturnValue();
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v21 CGColor]);

  if (self->_xAxisSegmentCount >= 2)
  {
    CGContextSetLineDash(CurrentContext, 2.0, drawRect__lengths, 2uLL);
    CGContextBeginPath(CurrentContext);
    unint64_t xAxisSegmentCount = self->_xAxisSegmentCount;
    if (xAxisSegmentCount)
    {
      unint64_t v23 = 0;
      double v24 = (MaxX - MinX - v14) / (double)xAxisSegmentCount;
      do
      {
        CGContextMoveToPoint(CurrentContext, MinX + v24 * (double)(int)v23, MaxY);
        CGContextAddLineToPoint(CurrentContext, MinX + v24 * (double)(int)v23++, MinY);
      }
      while (self->_xAxisSegmentCount > v23);
    }
    CGContextStrokePath(CurrentContext);
  }
}

- (HKPopulationNormsAxisView)yAxisView
{
  return self->_yAxisView;
}

- (void)setYAxisView:(id)a3
{
}

- (HKPopulationNormsAxisView)xAxisView
{
  return self->_xAxisView;
}

- (void)setXAxisView:(id)a3
{
}

- (unint64_t)xAxisSegmentCount
{
  return self->_xAxisSegmentCount;
}

- (unint64_t)yAxisSegmentCount
{
  return self->_yAxisSegmentCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xAxisView, 0);
  objc_storeStrong((id *)&self->_yAxisView, 0);
}

@end