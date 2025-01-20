@interface HKBorderLineView
+ (void)drawBorderLinesInContext:(CGContext *)a3 bounds:(CGRect)a4 verticalDrawRanges:(id)a5 borderEdges:(int64_t)a6 borderLineWidth:(double)a7 borderLineColor:(id)a8 borderInsets:(UIEdgeInsets)a9;
- (CGSize)intrinsicContentSize;
- (HKBorderLineView)initWithCoder:(id)a3;
- (HKBorderLineView)initWithFrame:(CGRect)a3;
- (NSArray)verticalDrawRanges;
- (UIColor)borderLineColor;
- (UIEdgeInsets)borderInsets;
- (double)borderWidth;
- (double)minimumHeight;
- (double)minimumWidth;
- (id)_adjustedVerticalDrawRanges;
- (int64_t)edges;
- (void)_initFields;
- (void)drawRect:(CGRect)a3;
- (void)setBorderInsets:(UIEdgeInsets)a3;
- (void)setBorderLineColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setEdges:(int64_t)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setMinimumWidth:(double)a3;
- (void)setVerticalDrawRanges:(id)a3;
@end

@implementation HKBorderLineView

- (HKBorderLineView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKBorderLineView;
  v3 = -[HKBorderLineView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HKBorderLineView *)v3 _initFields];
  }
  return v4;
}

- (HKBorderLineView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKBorderLineView;
  v3 = [(HKBorderLineView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(HKBorderLineView *)v3 _initFields];
  }
  return v4;
}

- (void)_initFields
{
  self->_edges = 0;
  self->_borderWidth = HKUIOnePixel();
  objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisMajorGridColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  borderLineColor = self->_borderLineColor;
  self->_borderLineColor = v3;

  long long v5 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  *(_OWORD *)&self->_borderInsets.top = *MEMORY[0x1E4FB2848];
  *(_OWORD *)&self->_borderInsets.bottom = v5;
  self->_minimumWidth = -1.0;
  self->_minimumHeight = -1.0;
  verticalDrawRanges = self->_verticalDrawRanges;
  self->_verticalDrawRanges = 0;
}

- (CGSize)intrinsicContentSize
{
  [(HKBorderLineView *)self minimumWidth];
  if (v3 <= 0.0 || ([(HKBorderLineView *)self minimumHeight], v4 <= 0.0))
  {
    v11.receiver = self;
    v11.super_class = (Class)HKBorderLineView;
    [(HKBorderLineView *)&v11 intrinsicContentSize];
    double v6 = v9;
  }
  else
  {
    [(HKBorderLineView *)self minimumWidth];
    double v6 = v5;
    [(HKBorderLineView *)self minimumHeight];
    double v8 = v7;
  }
  double v10 = v6;
  result.height = v8;
  result.width = v10;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  [(HKBorderLineView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v21 = [(HKBorderLineView *)self _adjustedVerticalDrawRanges];
  int64_t v13 = [(HKBorderLineView *)self edges];
  [(HKBorderLineView *)self borderWidth];
  double v15 = v14;
  v16 = [(HKBorderLineView *)self borderLineColor];
  [(HKBorderLineView *)self borderInsets];
  +[HKBorderLineView drawBorderLinesInContext:bounds:verticalDrawRanges:borderEdges:borderLineWidth:borderLineColor:borderInsets:](HKBorderLineView, "drawBorderLinesInContext:bounds:verticalDrawRanges:borderEdges:borderLineWidth:borderLineColor:borderInsets:", CurrentContext, v21, v13, v16, v6, v8, v10, v12, v15, v17, v18, v19, v20);
}

- (void)setEdges:(int64_t)a3
{
  self->_edges = a3;
  [(HKBorderLineView *)self setNeedsDisplay];
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
  [(HKBorderLineView *)self setNeedsDisplay];
}

- (void)setBorderLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderLineColor, a3);
  [(HKBorderLineView *)self setNeedsDisplay];
}

- (void)setBorderInsets:(UIEdgeInsets)a3
{
  self->_borderInsets = a3;
  [(HKBorderLineView *)self setNeedsDisplay];
}

- (void)setVerticalDrawRanges:(id)a3
{
  objc_storeStrong((id *)&self->_verticalDrawRanges, a3);
  [(HKBorderLineView *)self setNeedsDisplay];
}

- (id)_adjustedVerticalDrawRanges
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v3 = [(HKBorderLineView *)self verticalDrawRanges];

  if (v3)
  {
    double v3 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [(HKBorderLineView *)self verticalDrawRanges];
    uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v25 != v6) {
            objc_enumerationMutation(obj);
          }
          double v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          double v9 = [v8 minValue];
          [v9 doubleValue];
          double v11 = v10;
          [(HKBorderLineView *)self frame];
          double v13 = v11 - v12;

          double v14 = [v8 maxValue];
          [v14 doubleValue];
          double v16 = v15;
          [(HKBorderLineView *)self frame];
          double v18 = v16 - v17;

          uint64_t v19 = [NSNumber numberWithDouble:v13];
          uint64_t v20 = [NSNumber numberWithDouble:v18];
          id v21 = +[HKValueRange valueRangeWithMinValue:v19 maxValue:v20];

          [v3 addObject:v21];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v5);
    }
  }
  return v3;
}

+ (void)drawBorderLinesInContext:(CGContext *)a3 bounds:(CGRect)a4 verticalDrawRanges:(id)a5 borderEdges:(int64_t)a6 borderLineWidth:(double)a7 borderLineColor:(id)a8 borderInsets:(UIEdgeInsets)a9
{
  char v11 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v16 = a5;
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[a8 CGColor]);
  CGContextSetLineWidth(a3, a7);
  if (v11)
  {
    CGContextMoveToPoint(a3, x + a9.left, y + a9.top);
    CGContextAddLineToPoint(a3, x + width - a9.right, y + a9.top);
  }
  if ((v11 & 2) == 0)
  {
    if ((v11 & 4) == 0) {
      goto LABEL_5;
    }
LABEL_19:
    CGContextMoveToPoint(a3, x + a9.left, y + height - a9.bottom);
    CGContextAddLineToPoint(a3, x + width - a9.right, y + height - a9.bottom);
    if ((v11 & 8) == 0) {
      goto LABEL_31;
    }
    goto LABEL_20;
  }
  if (v16 && [v16 count])
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          v23 = [v22 minValue];
          [v23 floatValue];
          CGContextMoveToPoint(a3, x + a9.left, a9.top + v24);

          long long v25 = [v22 maxValue];
          [v25 floatValue];
          CGContextAddLineToPoint(a3, x + a9.left, v26 - a9.bottom);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v19);
    }

    if ((v11 & 4) != 0) {
      goto LABEL_19;
    }
  }
  else
  {
    CGContextMoveToPoint(a3, x + a9.left, y + a9.top);
    CGContextAddLineToPoint(a3, x + a9.left, y + height - a9.bottom);
    if ((v11 & 4) != 0) {
      goto LABEL_19;
    }
  }
LABEL_5:
  if ((v11 & 8) == 0) {
    goto LABEL_31;
  }
LABEL_20:
  if (v16 && [v16 count])
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v27 = v16;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v41;
      double v31 = x + width;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v41 != v30) {
            objc_enumerationMutation(v27);
          }
          v33 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          v34 = [v33 minValue];
          [v34 floatValue];
          CGContextMoveToPoint(a3, v31, v35);

          v36 = [v33 maxValue];
          [v36 floatValue];
          CGContextAddLineToPoint(a3, v31 - a9.right, v37);
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v29);
    }
  }
  else
  {
    CGFloat v38 = x + width - a9.right;
    CGContextMoveToPoint(a3, v38, y + a9.top);
    CGContextAddLineToPoint(a3, v38, y + height - a9.bottom);
  }
LABEL_31:
  CGContextStrokePath(a3);
}

- (int64_t)edges
{
  return self->_edges;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (UIColor)borderLineColor
{
  return self->_borderLineColor;
}

- (UIEdgeInsets)borderInsets
{
  double top = self->_borderInsets.top;
  double left = self->_borderInsets.left;
  double bottom = self->_borderInsets.bottom;
  double right = self->_borderInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (double)minimumWidth
{
  return self->_minimumWidth;
}

- (void)setMinimumWidth:(double)a3
{
  self->_minimumWidth = a3;
}

- (NSArray)verticalDrawRanges
{
  return self->_verticalDrawRanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalDrawRanges, 0);
  objc_storeStrong((id *)&self->_borderLineColor, 0);
}

@end