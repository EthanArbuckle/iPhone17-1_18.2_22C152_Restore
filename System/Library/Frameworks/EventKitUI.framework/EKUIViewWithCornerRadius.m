@interface EKUIViewWithCornerRadius
- (double)cornerRadius;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
@end

@implementation EKUIViewWithCornerRadius

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  [(EKUIViewWithCornerRadius *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)EKUIViewWithCornerRadius;
  [(EKUIViewWithCornerRadius *)&v6 layoutSubviews];
  double cornerRadius = self->_cornerRadius;
  if (cornerRadius == 0.0)
  {
    [(EKUIViewWithCornerRadius *)self bounds];
    double cornerRadius = v4 * 0.5;
  }
  v5 = [(EKUIViewWithCornerRadius *)self layer];
  [v5 setCornerRadius:cornerRadius];
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end