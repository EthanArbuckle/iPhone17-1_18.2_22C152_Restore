@interface VTUIEnrollmentSetupIntroViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (VTUIEnrollmentSetupIntroViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation VTUIEnrollmentSetupIntroViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VTUIEnrollmentSetupIntroView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VTUIEnrollmentBaseView" hasInstanceVariable:@"_orbImage" withType:"UIImageView"];
  [v3 validateClass:@"VTUIEnrollmentSetupIntroView" isKindOfClass:@"VTUIEnrollmentBaseView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollmentSetupIntroView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollmentSetupIntroView", @"continueButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollmentSetupIntroViewAccessibility;
  [(VTUIEnrollmentSetupIntroViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(VTUIEnrollmentSetupIntroViewAccessibility *)self safeValueForKey:@"continueButton"];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CF40] | v4];
  v5 = [(VTUIEnrollmentSetupIntroViewAccessibility *)self safeValueForKey:@"_orbImage"];
  [v5 setAccessibilityRespondsToUserInteraction:0];
  [v5 _setIsAccessibilityElementBlock:&__block_literal_global_1];
}

uint64_t __87__VTUIEnrollmentSetupIntroViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 0;
}

- (VTUIEnrollmentSetupIntroViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VTUIEnrollmentSetupIntroViewAccessibility;
  id v3 = -[VTUIEnrollmentSetupIntroViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VTUIEnrollmentSetupIntroViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

@end