@interface UICoverSheetButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityPath;
@end

@implementation UICoverSheetButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICoverSheetButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UICoverSheetButton" hasInstanceVariable:@"_backgroundEffectView" withType:"UIVisualEffectView"];
  objc_storeStrong(location, 0);
}

- (id)accessibilityPath
{
  id v3 = (id)[(UICoverSheetButtonAccessibility *)self safeValueForKey:@"_backgroundEffectView"];
  id v4 = (id)[v3 accessibilityPath];

  return v4;
}

@end