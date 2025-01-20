@interface CAMExposureBiasStatusIndicatorTickMarksView
- (CAMExposureBiasStatusIndicatorTickMarksView)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (_NSRange)selectedRange;
- (void)drawRect:(CGRect)a3;
- (void)setSelectedRange:(_NSRange)a3;
@end

@implementation CAMExposureBiasStatusIndicatorTickMarksView

- (CAMExposureBiasStatusIndicatorTickMarksView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMExposureBiasStatusIndicatorTickMarksView;
  v3 = -[CAMExposureBiasStatusIndicatorTickMarksView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CAMExposureBiasStatusIndicatorTickMarksView *)v3 setOpaque:0];
  }
  return v4;
}

- (void)setSelectedRange:(_NSRange)a3
{
  if (self->_selectedRange.location != a3.location || self->_selectedRange.length != a3.length)
  {
    self->_selectedRange = a3;
    [(CAMExposureBiasStatusIndicatorTickMarksView *)self setNeedsDisplay];
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = 37.0;
  double v3 = 6.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  [(CAMExposureBiasStatusIndicatorTickMarksView *)self bounds];
  double v5 = v4;
  CurrentContext = UIGraphicsGetCurrentContext();
  id v14 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.6];
  v7 = CAMYellowColor();
  for (uint64_t i = 0; i != 13; ++i)
  {
    if (-1431655765 * i >= 0x55555556) {
      double v9 = 3.0;
    }
    else {
      double v9 = 6.0;
    }
    unint64_t v10 = [(CAMExposureBiasStatusIndicatorTickMarksView *)self selectedRange];
    BOOL v12 = i - v10 < v11 && i >= v10;
    v13 = v14;
    if (v12) {
      v13 = v7;
    }
    [v13 set];
    v16.size.width = 1.0;
    v16.origin.x = (double)i * 3.0;
    v16.origin.y = v5 - v9;
    v16.size.height = v9;
    CGContextFillRect(CurrentContext, v16);
  }
}

- (_NSRange)selectedRange
{
  p_selectedRange = &self->_selectedRange;
  NSUInteger location = self->_selectedRange.location;
  NSUInteger length = p_selectedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end