@interface HPSNumberSetting
+ (Class)valueClass;
- (double)doubleValue;
- (float)floatValue;
- (int64_t)integerValue;
@end

@implementation HPSNumberSetting

- (int64_t)integerValue
{
  v2 = [(HPSNumberSetting *)self numberValue];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (float)floatValue
{
  v2 = [(HPSNumberSetting *)self numberValue];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (double)doubleValue
{
  v2 = [(HPSNumberSetting *)self numberValue];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end