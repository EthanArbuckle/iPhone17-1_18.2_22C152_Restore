@interface _TVSwipeUpMessageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAllowsActivationWithoutBeingNativeFocused;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _TVSwipeUpMessageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVSwipeUpMessageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVSwipeUpMessageView", @"messageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVSwipeUpMessageView", @"isEnabled", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  char v3 = [v2 _accessibilityViewIsVisible];

  return v3;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"fullscreen.button");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)_accessibilityAllowsActivationWithoutBeingNativeFocused
{
  return 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

@end