@interface _UIFocusScrollManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)animateOffsetOfEnvironmentScrollableContainer:(id)a3 toShowFocusItem:(id)a4;
@end

@implementation _UIFocusScrollManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFocusScrollManager";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFocusScrollManager", @"animateOffsetOfEnvironmentScrollableContainer:toShowFocusItem:", "v", "@", "@", 0);
  objc_storeStrong(v4, obj);
}

- (void)animateOffsetOfEnvironmentScrollableContainer:(id)a3 toShowFocusItem:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  char v10 = 0;
  objc_opt_class();
  id v9 = (id)__UIAccessibilityCastAsClass();
  id v8 = v9;
  objc_storeStrong(&v9, 0);
  char v4 = [v8 _accessibilityIsFKARunningForFocusItem];

  if (v4)
  {
    int v7 = 1;
  }
  else
  {
    v6.receiver = v13;
    v6.super_class = (Class)_UIFocusScrollManagerAccessibility;
    [(_UIFocusScrollManagerAccessibility *)&v6 animateOffsetOfEnvironmentScrollableContainer:location[0] toShowFocusItem:v11];
    int v7 = 0;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

@end