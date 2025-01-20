@interface UIViewAccessibility__MessageUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvisibility;
- (BOOL)_axIsCheckingWhetherOverridesInvisibility;
- (void)_axSetIsCheckingWhetherOverridesInvisibility:(BOOL)a3;
@end

@implementation UIViewAccessibility__MessageUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsCheckingWhetherOverridesInvisibility
{
  return MEMORY[0x270F09620](self, &__UIViewAccessibility__MessageUI__UIKit___axIsCheckingWhetherOverridesInvisibility);
}

- (void)_axSetIsCheckingWhetherOverridesInvisibility:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityOverridesInvisibility
{
  if (![(UIViewAccessibility__MessageUI__UIKit *)self _axIsCheckingWhetherOverridesInvisibility])
  {
    [(UIViewAccessibility__MessageUI__UIKit *)self _axSetIsCheckingWhetherOverridesInvisibility:1];
    int v5 = _AXSAutomationEnabled();
    if (v5
      && ([(UIViewAccessibility__MessageUI__UIKit *)self accessibilityIdentifier],
          v2 = objc_claimAutoreleasedReturnValue(),
          ([v2 isEqualToString:@"RecipientAtomContainerView"] & 1) != 0))
    {
      BOOL v4 = 1;
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)UIViewAccessibility__MessageUI__UIKit;
      BOOL v4 = [(UIViewAccessibility__MessageUI__UIKit *)&v7 _accessibilityOverridesInvisibility];
      if (!v5)
      {
LABEL_8:
        [(UIViewAccessibility__MessageUI__UIKit *)self _axSetIsCheckingWhetherOverridesInvisibility:0];
        return v4;
      }
    }

    goto LABEL_8;
  }
  v8.receiver = self;
  v8.super_class = (Class)UIViewAccessibility__MessageUI__UIKit;
  return [(UIViewAccessibility__MessageUI__UIKit *)&v8 _accessibilityOverridesInvisibility];
}

@end