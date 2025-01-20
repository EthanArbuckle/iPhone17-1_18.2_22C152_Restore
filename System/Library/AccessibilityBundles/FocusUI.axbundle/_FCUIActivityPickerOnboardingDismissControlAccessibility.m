@interface _FCUIActivityPickerOnboardingDismissControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _FCUIActivityPickerOnboardingDismissControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_FCUIActivityPickerOnboardingDismissControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"close.button");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)accessibilityActivate
{
  v4.receiver = self;
  v4.super_class = (Class)_FCUIActivityPickerOnboardingDismissControlAccessibility;
  BOOL v2 = [(_FCUIActivityPickerOnboardingDismissControlAccessibility *)&v4 accessibilityActivate];
  if (v2) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  return v2;
}

@end