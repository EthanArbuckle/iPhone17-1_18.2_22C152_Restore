@interface FIUIChartHorizontalLineSeries
- (UIColor)color;
- (double)lineWidth;
- (double)sidePadding;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setSidePadding:(double)a3;
@end

@implementation FIUIChartHorizontalLineSeries

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)FIUIChartHorizontalLineSeries;
  [(FIUIChartSeries *)&v6 layoutSubviews];
  v3 = [(FIUIChartNumericSeries *)self CGPointsFromDataSet];
  dataPoints = self->_dataPoints;
  self->_dataPoints = v3;

  v5 = [(FIUIChartHorizontalLineSeries *)self layer];
  [v5 setNeedsDisplay];
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  UIGraphicsPushContext(a4);
  CGContextBeginPath(a4);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v6 = self->_dataPoints;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v10), "CGPointValue", (void)v20);
        CGFloat v12 = v11;
        CGContextMoveToPoint(a4, self->_sidePadding, v11);
        [(FIUIChartSeries *)self insetBounds];
        CGContextAddLineToPoint(a4, v13 + self->_sidePadding * -2.0, v12);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  CGContextClosePath(a4);
  double lineWidth = self->_lineWidth;
  color = self->_color;
  if (color)
  {
    v16 = color;
  }
  else
  {
    v16 = [MEMORY[0x263F825C8] whiteColor];
  }
  v17 = v16;
  double v18 = 1.0;
  if (lineWidth > 2.22044605e-16) {
    double v18 = lineWidth;
  }
  CGContextSetLineWidth(a4, v18);
  v19 = v17;
  CGContextSetStrokeColorWithColor(a4, [(UIColor *)v19 CGColor]);
  CGContextSetLineCap(a4, kCGLineCapRound);
  CGContextDrawPath(a4, kCGPathStroke);
  UIGraphicsPopContext();
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_double lineWidth = a3;
}

- (double)sidePadding
{
  return self->_sidePadding;
}

- (void)setSidePadding:(double)a3
{
  self->_sidePadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_dataPoints, 0);
}

@end