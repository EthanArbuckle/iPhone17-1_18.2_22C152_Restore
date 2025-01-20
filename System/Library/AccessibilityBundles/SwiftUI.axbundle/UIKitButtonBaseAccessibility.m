@interface UIKitButtonBaseAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
@end

@implementation UIKitButtonBaseAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.UIKitButtonBase";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)canBecomeFocused
{
  if ([(UIKitButtonBaseAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    return [(UIKitButtonBaseAccessibility *)self isAccessibilityElement];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UIKitButtonBaseAccessibility;
    return [(UIKitButtonBaseAccessibility *)&v4 canBecomeFocused];
  }
}

@end