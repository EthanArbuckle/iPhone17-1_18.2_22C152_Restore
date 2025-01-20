@interface CPSCircularBackgroundView
- (void)layoutSubviews;
@end

@implementation CPSCircularBackgroundView

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CPSCircularBackgroundView;
  [(CPSCircularBackgroundView *)&v8 layoutSubviews];
  [(CPSCircularBackgroundView *)self bounds];
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  double v7 = CGRectGetWidth(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  [(CPSCircularBackgroundView *)self _setContinuousCornerRadius:fmin(v7, CGRectGetHeight(v10)) * 0.5];
}

@end