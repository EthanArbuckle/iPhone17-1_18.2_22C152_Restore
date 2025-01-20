@interface FIUIChartDashedBackgroundView
- (BOOL)shouldCenterLines;
- (FIUIChartDashedBackgroundView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (int64_t)direction;
- (int64_t)lineType;
- (unint64_t)numLines;
- (void)_updateLinePositions;
- (void)drawLine:(id)a3 rect:(CGRect)a4 context:(CGContext *)a5;
- (void)drawRect:(CGRect)a3;
- (void)setColor:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setLineType:(int64_t)a3;
- (void)setNumLines:(unint64_t)a3;
- (void)setShouldCenterLines:(BOOL)a3;
@end

@implementation FIUIChartDashedBackgroundView

- (FIUIChartDashedBackgroundView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FIUIChartDashedBackgroundView;
  result = -[FIUIChartBackgroundView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_direction = 0;
  }
  return result;
}

- (void)setShouldCenterLines:(BOOL)a3
{
  self->_shouldCenterLines = a3;
  [(FIUIChartDashedBackgroundView *)self _updateLinePositions];
}

- (void)setNumLines:(unint64_t)a3
{
  self->_numLines = a3;
  [(FIUIChartDashedBackgroundView *)self _updateLinePositions];
}

- (void)_updateLinePositions
{
  v3 = [MEMORY[0x263EFF980] array];
  unint64_t numLines = self->_numLines;
  if (numLines)
  {
    for (unint64_t i = 0; i < numLines; ++i)
    {
      if (numLines == 1)
      {
        double v8 = 0.5;
      }
      else
      {
        if (self->_shouldCenterLines)
        {
          double v6 = (double)(i + 1);
          double v7 = (double)(numLines + 1);
        }
        else
        {
          double v6 = (double)i;
          double v7 = (double)(numLines - 1);
        }
        double v8 = v6 / v7;
      }
      v9 = [NSNumber numberWithDouble:v8];
      [(NSArray *)v3 addObject:v9];

      unint64_t numLines = self->_numLines;
    }
  }
  linePositions = self->_linePositions;
  self->_linePositions = v3;

  [(FIUIChartDashedBackgroundView *)self setNeedsDisplay];
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
  [(FIUIChartDashedBackgroundView *)self setNeedsDisplay];
}

- (void)drawLine:(id)a3 rect:(CGRect)a4 context:(CGContext *)a5
{
  CGFloat width = a4.size.width;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  [v7 doubleValue];
  UIRoundToViewScale();
  double v9 = v8;
  [v7 doubleValue];
  double v11 = v10;

  if (v11 == 0.0) {
    double v9 = v9 + -0.5;
  }
  v12 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.25];
  [v12 set];

  long long v14 = xmmword_21E4D8910;
  UIRoundToViewScale();
  CGContextSetLineWidth(a5, v13);
  CGContextSetLineDash(a5, 0.0, (const CGFloat *)&v14, 1uLL);
  CGContextMoveToPoint(a5, 0.0, v9);
  CGContextAddLineToPoint(a5, width, v9);
  CGContextStrokePath(a5);
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (self->_lineType == 1)
  {
    double y = a3.origin.y;
    double x = a3.origin.x;
    CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    double v9 = self->_linePositions;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v9);
          }
          -[FIUIChartDashedBackgroundView drawLine:rect:context:](self, "drawLine:rect:context:", *(void *)(*((void *)&v40 + 1) + 8 * i), CurrentContext, x, y, width, height);
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v11);
    }

    UIGraphicsEndImageContext();
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v14 = self->_linePositions;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          int64_t direction = self->_direction;
          objc_msgSend(v19, "doubleValue", (void)v36);
          if (direction)
          {
            UIRoundToViewScale();
            double v22 = v21;
            [v19 doubleValue];
            if (v23 == 0.0) {
              double v22 = v22 + -0.5;
            }
            [(UIColor *)self->_color setFill];
            UIRoundToViewScale();
            double v25 = v24;
            [(FIUIChartBackgroundView *)self lineInsets];
            double v27 = height - v26;
            double v28 = 0.0;
          }
          else
          {
            UIRoundToViewScale();
            double v30 = v29;
            [v19 doubleValue];
            if (v31 == 0.0) {
              double v28 = v30 + -0.5;
            }
            else {
              double v28 = v30;
            }
            [(UIColor *)self->_color setFill];
            UIRoundToViewScale();
            double v27 = v32;
            double v22 = 0.0;
            double v25 = width;
          }
          double v33 = v22;
          double v34 = v28;
          double v35 = v25;
          UIRectFill(*(CGRect *)(&v27 - 3));
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v16);
    }
  }
}

- (unint64_t)numLines
{
  return self->_numLines;
}

- (BOOL)shouldCenterLines
{
  return self->_shouldCenterLines;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (int64_t)direction
{
  return self->_direction;
}

- (int64_t)lineType
{
  return self->_lineType;
}

- (void)setLineType:(int64_t)a3
{
  self->_lineType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_linePositions, 0);
}

@end