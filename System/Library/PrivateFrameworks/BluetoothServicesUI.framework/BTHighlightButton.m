@interface BTHighlightButton
- (void)setHighlighted:(BOOL)a3;
@end

@implementation BTHighlightButton

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BTHighlightButton;
  -[BTHighlightButton setHighlighted:](&v6, sel_setHighlighted_);
  double v5 = 1.0;
  if (v3) {
    double v5 = 0.5;
  }
  [(BTHighlightButton *)self setAlpha:v5];
}

@end