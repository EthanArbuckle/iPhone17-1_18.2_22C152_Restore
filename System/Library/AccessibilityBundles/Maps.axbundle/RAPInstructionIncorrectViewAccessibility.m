@interface RAPInstructionIncorrectViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (RAPInstructionIncorrectViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateFlagView;
@end

@implementation RAPInstructionIncorrectViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RAPInstructionIncorrectView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RAPInstructionIncorrectView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"RAPInstructionIncorrectView" hasInstanceVariable:@"_flagView" withType:"UIImageView"];
}

- (void)_axAnnotateFlagView
{
  id v2 = [(RAPInstructionIncorrectViewAccessibility *)self safeValueForKey:@"_flagView"];
  [v2 setAccessibilityIdentifier:@"Flag"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)RAPInstructionIncorrectViewAccessibility;
  [(RAPInstructionIncorrectViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(RAPInstructionIncorrectViewAccessibility *)self _axAnnotateFlagView];
}

- (RAPInstructionIncorrectViewAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RAPInstructionIncorrectViewAccessibility;
  objc_super v3 = -[RAPInstructionIncorrectViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(RAPInstructionIncorrectViewAccessibility *)v3 _axAnnotateFlagView];
  }
  return v4;
}

@end