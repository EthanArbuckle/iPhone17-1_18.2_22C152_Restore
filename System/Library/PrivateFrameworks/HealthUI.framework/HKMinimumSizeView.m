@interface HKMinimumSizeView
- (CGSize)intrinsicContentSize;
- (HKMinimumSizeView)initWithFrame:(CGRect)a3;
- (double)minimumHeight;
- (double)minimumWidth;
- (void)setMinimumHeight:(double)a3;
- (void)setMinimumWidth:(double)a3;
@end

@implementation HKMinimumSizeView

- (HKMinimumSizeView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMinimumSizeView;
  result = -[HKMinimumSizeView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    double v4 = *MEMORY[0x1E4FB30D8];
    result->_minimumWidth = *(double *)MEMORY[0x1E4FB30D8];
    result->_minimumHeight = v4;
  }
  return result;
}

- (void)setMinimumWidth:(double)a3
{
  self->_minimumWidth = a3;
  [(HKMinimumSizeView *)self invalidateIntrinsicContentSize];
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
  [(HKMinimumSizeView *)self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  double minimumWidth = self->_minimumWidth;
  double minimumHeight = self->_minimumHeight;
  result.height = minimumHeight;
  result.width = minimumWidth;
  return result;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (double)minimumWidth
{
  return self->_minimumWidth;
}

@end