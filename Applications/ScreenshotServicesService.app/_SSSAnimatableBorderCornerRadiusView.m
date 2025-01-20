@interface _SSSAnimatableBorderCornerRadiusView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (UIColor)borderColor;
- (double)borderWidth;
- (double)cornerRadius;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setCornerRadius:(double)a3;
@end

@implementation _SSSAnimatableBorderCornerRadiusView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_SSSAnimatableBorderCornerRadiusView;
  if ([(_SSSAnimatableBorderCornerRadiusView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:@"cornerRadius"];
  }

  return v5;
}

- (void)setCornerRadius:(double)a3
{
}

- (double)cornerRadius
{
  [(_SSSAnimatableBorderCornerRadiusView *)self _continuousCornerRadius];
  return result;
}

- (void)setBorderWidth:(double)a3
{
  id v4 = [(_SSSAnimatableBorderCornerRadiusView *)self layer];
  [v4 setBorderWidth:a3];
}

- (double)borderWidth
{
  v2 = [(_SSSAnimatableBorderCornerRadiusView *)self layer];
  [v2 borderWidth];
  double v4 = v3;

  return v4;
}

- (void)setBorderColor:(id)a3
{
  id v4 = a3;
  id v7 = [(_SSSAnimatableBorderCornerRadiusView *)self layer];
  id v5 = v4;
  id v6 = [v5 CGColor];

  [v7 setBorderColor:v6];
}

- (UIColor)borderColor
{
  v2 = [(_SSSAnimatableBorderCornerRadiusView *)self layer];
  double v3 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v2 borderColor]);

  return (UIColor *)v3;
}

@end