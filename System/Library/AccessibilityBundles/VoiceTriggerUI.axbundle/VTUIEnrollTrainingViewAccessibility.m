@interface VTUIEnrollTrainingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (VTUIEnrollTrainingViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setupUI;
@end

@implementation VTUIEnrollTrainingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VTUIEnrollTrainingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VTUIEnrollTrainingView" hasInstanceVariable:@"_instructionPagedLabel" withType:"VTUIPagedLabel"];
  [v3 validateClass:@"VTUIEnrollTrainingView" hasInstanceVariable:@"_radarButton" withType:"SiriUIContentButton"];
  [v3 validateClass:@"VTUIPagedLabel" hasInstanceVariable:@"_instructionLabelLeft" withType:"UILabel"];
  [v3 validateClass:@"VTUIPagedLabel" hasInstanceVariable:@"_instructionLabelRight" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingView", @"_setupUI", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUIEnrollTrainingView", @"orbView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)VTUIEnrollTrainingViewAccessibility;
  [(VTUIEnrollTrainingViewAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  id v3 = [(VTUIEnrollTrainingViewAccessibility *)self safeValueForKey:@"_radarButton"];
  v4 = accessibilityLocalizedString(@"button.radar");
  [v3 setAccessibilityLabel:v4];

  v5 = [(VTUIEnrollTrainingViewAccessibility *)self safeValueForKey:@"_instructionPagedLabel"];
  v6 = [v5 safeValueForKey:@"_instructionLabelLeft"];
  uint64_t v7 = MEMORY[0x263EFFA88];
  [v6 _accessibilitySetRetainedValue:MEMORY[0x263EFFA88] forKey:@"AXIsInstructionLabel"];

  v8 = [(VTUIEnrollTrainingViewAccessibility *)self safeValueForKey:@"_instructionPagedLabel"];
  v9 = [v8 safeValueForKey:@"_instructionLabelRight"];
  [v9 _accessibilitySetRetainedValue:v7 forKey:@"AXIsInstructionLabel"];
}

- (VTUIEnrollTrainingViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VTUIEnrollTrainingViewAccessibility;
  id v3 = -[VTUIEnrollTrainingViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VTUIEnrollTrainingViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

- (void)_setupUI
{
  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingViewAccessibility;
  [(VTUIEnrollTrainingViewAccessibility *)&v3 _setupUI];
  [(VTUIEnrollTrainingViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end