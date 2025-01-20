@interface _UIFocusItemRegionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation _UIFocusItemRegionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFocusItemRegion";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFocusItemRegion", @"_canBeOccludedByRegionsAbove", "B", 0);
  objc_storeStrong(v4, obj);
}

@end