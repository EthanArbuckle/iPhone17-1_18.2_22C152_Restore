@interface UIApplicationRotationFollowingWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_wantsFocusEngine;
@end

@implementation UIApplicationRotationFollowingWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIApplicationRotationFollowingWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIWindow";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"UIApplicationRotationFollowingWindow");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"_wantsFocusEngine", "B", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)_wantsFocusEngine
{
  v5 = self;
  SEL v4 = a2;
  if ([(UIApplicationRotationFollowingWindowAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 1; {
  v3.receiver = v5;
  }
  v3.super_class = (Class)UIApplicationRotationFollowingWindowAccessibility;
  return [(UIApplicationRotationFollowingWindowAccessibility *)&v3 _wantsFocusEngine];
}

@end