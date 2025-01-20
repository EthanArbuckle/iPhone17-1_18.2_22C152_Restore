@interface EDGridView
- (EDGridView)initWithWithCellCount:(int64_t)a3;
- (UIColor)strokeColor;
- (void)drawRect:(CGRect)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation EDGridView

- (EDGridView)initWithWithCellCount:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EDGridView;
  v4 = [(EDGridView *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_cellCount = a3;
    uint64_t v6 = [MEMORY[0x263F1C550] whiteColor];
    strokeColor = v5->_strokeColor;
    v5->_strokeColor = (UIColor *)v6;
  }
  return v5;
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);

  [(EDGridView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetStrokeColorWithColor(CurrentContext, [(UIColor *)self->_strokeColor CGColor]);
  [(EDGridView *)self bounds];
  double v7 = v6;
  double cellCount = (double)self->_cellCount;
  double v9 = v5 / cellCount;
  if (v5 / cellCount < v5)
  {
    double v10 = v5;
    double v11 = v5 / cellCount;
    do
    {
      points.x = v11;
      points.y = 0.0;
      double v14 = v11;
      double v15 = v7;
      CGContextStrokeLineSegments(CurrentContext, &points, 2uLL);
      double v11 = v9 + v11;
    }
    while (v11 < v10);
  }
  if (v9 < v7)
  {
    double v12 = v9;
    do
    {
      points.x = 0.0;
      points.y = v12;
      double v14 = v7;
      double v15 = v12;
      CGContextStrokeLineSegments(CurrentContext, &points, 2uLL);
      double v12 = v9 + v12;
    }
    while (v12 < v7);
  }
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void).cxx_destruct
{
}

@end