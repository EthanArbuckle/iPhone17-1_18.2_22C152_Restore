@interface HKMultiGradientFillColor
- (HKMultiGradientFillColor)initWithColor:(id)a3 location:(id)a4;
- (NSNumber)location;
- (UIColor)color;
@end

@implementation HKMultiGradientFillColor

- (HKMultiGradientFillColor)initWithColor:(id)a3 location:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMultiGradientFillColor;
  v9 = [(HKMultiGradientFillColor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_color, a3);
    objc_storeStrong((id *)&v10->_location, a4);
  }

  return v10;
}

- (UIColor)color
{
  return self->_color;
}

- (NSNumber)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end