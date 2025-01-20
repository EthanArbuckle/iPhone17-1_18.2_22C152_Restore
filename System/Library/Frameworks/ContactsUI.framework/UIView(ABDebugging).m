@interface UIView(ABDebugging)
- (id)tintColorOverride;
- (id)tintColorOverrideDarkened;
- (void)abSetLayoutDebuggingColor:()ABDebugging;
@end

@implementation UIView(ABDebugging)

- (id)tintColorOverrideDarkened
{
  v1 = [a1 tintColorOverride];
  double v7 = 0.0;
  double v8 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  if ([v1 getHue:&v8 saturation:&v7 brightness:&v6 alpha:&v5])
  {
    id v2 = [MEMORY[0x1E4FB1618] colorWithHue:v8 saturation:v7 brightness:v6 * 0.75 alpha:v5];
  }
  else
  {
    id v2 = v1;
  }
  v3 = v2;

  return v3;
}

- (id)tintColorOverride
{
  id v2 = +[CNContactStyle currentStyle];
  v3 = [v2 tintColorOverride];

  if (!v3)
  {
    v3 = [a1 tintColor];
  }

  return v3;
}

- (void)abSetLayoutDebuggingColor:()ABDebugging
{
  id v4 = a3;
  uint64_t v5 = [v4 CGColor];
  double v6 = [a1 layer];
  [v6 setBorderColor:v5];

  double v7 = [a1 layer];
  [v7 setBorderWidth:1.0];

  double v8 = [v4 colorWithAlphaComponent:0.25];

  id v11 = v8;
  uint64_t v9 = [v11 CGColor];
  v10 = [a1 layer];
  [v10 setBackgroundColor:v9];
}

@end