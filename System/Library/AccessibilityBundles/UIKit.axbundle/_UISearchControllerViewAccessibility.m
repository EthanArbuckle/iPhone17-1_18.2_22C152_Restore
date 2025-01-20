@interface _UISearchControllerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _UISearchControllerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UISearchControllerView";
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
  [location[0] validateClass:@"_UISearchControllerView" isKindOfClass:@"UIView"];
  objc_storeStrong(location, 0);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v12 = a3;
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v4 = (id)-[_UISearchControllerViewAccessibility hitTest:withEvent:](v11, "hitTest:withEvent:", location[0], v12.x, v12.y);
  BOOL v7 = v4 != 0;

  if (v7)
  {
    v8.receiver = v11;
    v8.super_class = (Class)_UISearchControllerViewAccessibility;
    id v13 = -[_UISearchControllerViewAccessibility _accessibilityHitTest:withEvent:](&v8, sel__accessibilityHitTest_withEvent_, location[0], v12.x, v12.y);
  }
  else
  {
    id v13 = 0;
  }
  int v9 = 1;
  objc_storeStrong(location, 0);
  v5 = v13;

  return v5;
}

@end