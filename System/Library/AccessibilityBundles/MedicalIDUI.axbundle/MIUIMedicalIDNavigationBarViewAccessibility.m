@interface MIUIMedicalIDNavigationBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MIUIMedicalIDNavigationBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MIUIMedicalIDNavigationBarView";
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
  return accessibilityLocalizedString(@"medical.id");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MIUIMedicalIDNavigationBarViewAccessibility;
  [(MIUIMedicalIDNavigationBarViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 _accessibilitySetOverridesInvalidFrames:1];
}

@end