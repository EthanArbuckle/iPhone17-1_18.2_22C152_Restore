@interface _PKAnimatableBorderCornerRadiusView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (UIColor)borderColor;
- (double)borderWidth;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
@end

@implementation _PKAnimatableBorderCornerRadiusView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_PKAnimatableBorderCornerRadiusView;
  if ([(_PKAnimatableBorderCornerRadiusView *)&v7 _shouldAnimatePropertyWithKey:v4])
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"cornerRadius"];
  }

  return v5;
}

- (void)setBorderWidth:(double)a3
{
  id v4 = [(_PKAnimatableBorderCornerRadiusView *)self layer];
  [v4 setBorderWidth:a3];
}

- (double)borderWidth
{
  v2 = [(_PKAnimatableBorderCornerRadiusView *)self layer];
  [v2 borderWidth];
  double v4 = v3;

  return v4;
}

- (void)setBorderColor:(id)a3
{
  id v4 = a3;
  id v7 = [(_PKAnimatableBorderCornerRadiusView *)self layer];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  [v7 setBorderColor:v6];
}

- (UIColor)borderColor
{
  v2 = (void *)MEMORY[0x1E4FB1618];
  double v3 = [(_PKAnimatableBorderCornerRadiusView *)self layer];
  id v4 = objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "borderColor"));

  return (UIColor *)v4;
}

@end