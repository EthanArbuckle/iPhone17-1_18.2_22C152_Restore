@interface SBHomeGrabberViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation SBHomeGrabberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHomeGrabberView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBHomeGrabberView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SBHomeGrabberView" hasInstanceVariable:@"_touchState" withType:"q"];
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CF18];
  uint64_t v3 = [(SBHomeGrabberViewAccessibility *)self safeIntegerForKey:@"_touchState"];
  uint64_t v4 = *MEMORY[0x263F1CF20];
  if (v3 != 1) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

@end