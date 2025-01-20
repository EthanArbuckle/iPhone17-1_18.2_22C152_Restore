@interface VTUIEnrollmentBaseViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setupUI;
@end

@implementation VTUIEnrollmentBaseViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VTUIEnrollmentBaseView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollmentBaseView", @"_setupUI", "v", 0);
  [v3 validateClass:@"VTUIEnrollmentBaseView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"VTUIEnrollmentBaseView" hasInstanceVariable:@"_iconImageView" withType:"UIImageView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)VTUIEnrollmentBaseViewAccessibility;
  [(VTUIEnrollmentBaseViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilityLocalizedString(@"siri.icon");
  v4 = [(VTUIEnrollmentBaseViewAccessibility *)self safeValueForKey:@"_iconImageView"];
  [v4 setAccessibilityLabel:v3];

  uint64_t v5 = *MEMORY[0x263F1CEF8];
  v6 = [(VTUIEnrollmentBaseViewAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  [v6 setAccessibilityTraits:v5];
}

- (void)_setupUI
{
  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollmentBaseViewAccessibility;
  [(VTUIEnrollmentBaseViewAccessibility *)&v3 _setupUI];
  [(VTUIEnrollmentBaseViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end