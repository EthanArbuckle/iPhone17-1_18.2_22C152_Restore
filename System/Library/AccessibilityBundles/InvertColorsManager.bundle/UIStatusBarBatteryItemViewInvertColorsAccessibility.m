@interface UIStatusBarBatteryItemViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation UIStatusBarBatteryItemViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarBatteryItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  v3 = +[UIDevice currentDevice];
  id v4 = [v3 isBatteryMonitoringEnabled];
  BOOL v5 = 1;
  [v3 setBatteryMonitoringEnabled:1];
  unint64_t v6 = (unint64_t)[v3 batteryState];
  [v3 setBatteryMonitoringEnabled:v4];
  objc_opt_class();
  v7 = [(UIStatusBarBatteryItemViewInvertColorsAccessibility *)self safeValueForKey:@"foregroundStyle"];
  v8 = [v7 safeValueForKey:@"tintColor"];
  v9 = __UIAccessibilityCastAsClass();

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v10 = +[UIColor blackColor];
    char v11 = AXColorsProbablyEqual();

    if (v11)
    {
      BOOL v5 = 0;
    }
    else
    {
      v12 = +[UIColor whiteColor];
      char v13 = AXColorsProbablyEqual();

      if (v13)
      {
        BOOL v5 = 1;
      }
      else
      {
        v15.receiver = self;
        v15.super_class = (Class)UIStatusBarBatteryItemViewInvertColorsAccessibility;
        BOOL v5 = [(UIStatusBarBatteryItemViewInvertColorsAccessibility *)&v15 accessibilityIgnoresInvertColors];
      }
    }
  }

  return v5;
}

@end