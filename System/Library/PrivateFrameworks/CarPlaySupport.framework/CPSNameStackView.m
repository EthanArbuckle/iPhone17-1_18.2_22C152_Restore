@interface CPSNameStackView
- (CGSize)intrinsicContentSize;
- (double)fittingWidth;
- (void)setFittingWidth:(double)a3;
@end

@implementation CPSNameStackView

- (CGSize)intrinsicContentSize
{
  v10 = self;
  SEL v9 = a2;
  double v11 = 0.0;
  double v12 = 0.0;
  v8.receiver = self;
  v8.super_class = (Class)CPSNameStackView;
  [(CPSNameStackView *)&v8 intrinsicContentSize];
  double v11 = v2;
  double v12 = v3;
  [(CPSNameStackView *)v10 fittingWidth];
  if (v4 > 0.0)
  {
    [(CPSNameStackView *)v10 fittingWidth];
    double v11 = v5;
  }
  double v6 = v11;
  double v7 = v12;
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)fittingWidth
{
  return self->_fittingWidth;
}

- (void)setFittingWidth:(double)a3
{
  self->_fittingWidth = a3;
}

@end