@interface _UISystemGestureWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isEligibleForFocusInteraction;
@end

@implementation _UISystemGestureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UISystemGestureWindow";
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
  v3 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"_UISystemGestureWindow");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_isEligibleForFocusInteraction", "B", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)_isEligibleForFocusInteraction
{
  v6 = self;
  SEL v5 = a2;
  char v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UISystemGestureWindowAccessibility;
  char v4 = [(_UISystemGestureWindowAccessibility *)&v3 _isEligibleForFocusInteraction];
  if ([(_UISystemGestureWindowAccessibility *)v6 _accessibilityIsFKARunningForFocusItem])char v4 = 0; {
  return v4 & 1;
  }
}

@end