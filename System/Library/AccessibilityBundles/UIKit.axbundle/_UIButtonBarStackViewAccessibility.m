@interface _UIButtonBarStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOnlyComparesByXAxis;
@end

@implementation _UIButtonBarStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIButtonBarStackView";
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
  [location[0] validateClass:@"_UIButtonBarStackView" isKindOfClass:@"UIStackView"];
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

@end