@interface HeadphoneBatteryContainerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (CGRect)accessibilityFrame;
@end

@implementation HeadphoneBatteryContainerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HeadphoneProxService.HeadphoneBatteryContainer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  v7.receiver = self;
  v7.super_class = (Class)HeadphoneBatteryContainerAccessibility;
  [(HeadphoneBatteryContainerAccessibility *)&v7 accessibilityFrame];
  BOOL result = 1;
  if (fabs(v3) >= 0.001 && fabs(v4) >= 0.001 && v3 > 0.0 && v4 > 0.0)
  {
    v6.receiver = self;
    v6.super_class = (Class)HeadphoneBatteryContainerAccessibility;
    return [(HeadphoneBatteryContainerAccessibility *)&v6 _accessibilityOverridesInvalidFrames];
  }
  return result;
}

- (CGRect)accessibilityFrame
{
  v21.receiver = self;
  v21.super_class = (Class)HeadphoneBatteryContainerAccessibility;
  [(HeadphoneBatteryContainerAccessibility *)&v21 accessibilityFrame];
  double v5 = v4;
  double v7 = v6;
  double v8 = v2;
  double v9 = v3;
  if (fabs(v2) < 0.001 || fabs(v3) < 0.001 || v2 <= 0.0 || v3 <= 0.0)
  {
    objc_opt_class();
    v10 = __UIAccessibilityCastAsClass();
    v11 = [v10 superview];
    v12 = v11;
    if (v11)
    {
      [v11 accessibilityFrame];
      double v5 = v13;
      double v7 = v14;
      double v8 = v15;
      double v9 = v16;
    }
  }
  double v17 = v5;
  double v18 = v7;
  double v19 = v8;
  double v20 = v9;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end