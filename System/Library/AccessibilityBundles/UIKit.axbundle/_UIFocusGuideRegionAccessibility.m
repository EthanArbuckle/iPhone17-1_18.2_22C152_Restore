@interface _UIFocusGuideRegionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_shouldUseNextFocusedItemForLinearSorting;
@end

@implementation _UIFocusGuideRegionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFocusGuideRegion";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"_UIFocusGuideRegion";
  v3 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_canBeOccludedByRegionsAbove", v3, 0);
  v5 = "@";
  [location[0] validateClass:v4 hasInstanceMethod:@"delegate" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UILayoutGuide", @"owningView", v5, 0);
  [location[0] validateClass:@"UIWindowScene" hasInstanceVariable:@"_keyWindow" withType:"UIWindow"];
  objc_storeStrong(v7, obj);
}

- (BOOL)_shouldUseNextFocusedItemForLinearSorting
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusGuideRegionAccessibility;
  return [(_UIFocusGuideRegionAccessibility *)&v3 _shouldUseNextFocusedItemForLinearSorting];
}

@end