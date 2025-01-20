@interface UITableViewCellLayoutManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_layoutFocusGuidesForCell:(id)a3;
@end

@implementation UITableViewCellLayoutManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCellLayoutManager";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCellLayoutManager", @"_layoutFocusGuidesForCell:", "v", "@", 0);
  objc_storeStrong(v4, obj);
}

- (void)_layoutFocusGuidesForCell:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (([location[0] _accessibilityIsFKARunningForFocusItem] & 1) == 0)
  {
    v3.receiver = v5;
    v3.super_class = (Class)UITableViewCellLayoutManagerAccessibility;
    [(UITableViewCellLayoutManagerAccessibility *)&v3 _layoutFocusGuidesForCell:location[0]];
  }
  objc_storeStrong(location, 0);
}

@end