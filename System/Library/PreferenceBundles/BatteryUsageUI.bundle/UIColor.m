@interface UIColor
- (id)dynamicGrayScaleColor;
- (id)grayScaleColor;
- (id)grayScaleColorWithMin:(double)a3 andMax:(double)a4;
@end

@implementation UIColor

- (id)grayScaleColor
{
  double v7 = 0.0;
  double v8 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  v2 = self;
  if ([(UIColor *)v2 getRed:&v8 green:&v7 blue:&v6 alpha:&v5])
  {
    uint64_t v3 = +[UIColor colorWithWhite:v7 * 0.587 + v8 * 0.299 + v6 * 0.114 alpha:v5];

    v2 = (UIColor *)v3;
  }

  return v2;
}

- (id)dynamicGrayScaleColor
{
  uint64_t v3 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:0];
  v4 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  v10[0] = v3;
  double v5 = [(UIColor *)self grayScaleColorWithMin:0.72 andMax:0.92];
  v10[1] = v4;
  v11[0] = v5;
  double v6 = [(UIColor *)self grayScaleColorWithMin:0.16 andMax:0.35];
  v11[1] = v6;
  double v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  double v8 = +[UIColor _dynamicColorWithColorsByTraitCollection:v7];

  return v8;
}

- (id)grayScaleColorWithMin:(double)a3 andMax:(double)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  double v11 = 0.0;
  uint64_t v12 = 0;
  double v6 = self;
  if ([(UIColor *)v6 getRed:&v14 green:&v13 blue:&v12 alpha:&v11])
  {
    [(UIColor *)v6 _luminance];
    long double v8 = cos(v7 * 3.14159265);
    uint64_t v9 = +[UIColor colorWithWhite:(double)(a3 + (a4 - a3) * (0.5 - v8 * 0.5)) alpha:v11];

    double v6 = (UIColor *)v9;
  }

  return v6;
}

@end