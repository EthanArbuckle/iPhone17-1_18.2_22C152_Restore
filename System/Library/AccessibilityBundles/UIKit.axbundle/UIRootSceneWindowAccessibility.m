@interface UIRootSceneWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isEligibleForFocusInteraction;
@end

@implementation UIRootSceneWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIRootSceneWindow";
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"UIRootSceneWindow");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_isEligibleForFocusInteraction", "B", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)_isEligibleForFocusInteraction
{
  v6 = self;
  SEL v5 = a2;
  char v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIRootSceneWindowAccessibility;
  char v4 = [(UIRootSceneWindowAccessibility *)&v3 _isEligibleForFocusInteraction];
  if ([(UIRootSceneWindowAccessibility *)v6 _accessibilityIsFKARunningForFocusItem])char v4 = 0; {
  return v4 & 1;
  }
}

@end