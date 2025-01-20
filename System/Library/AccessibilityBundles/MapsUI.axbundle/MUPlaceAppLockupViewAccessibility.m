@interface MUPlaceAppLockupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MUPlaceAppLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPlaceAppLockupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPlaceAppLockupView", @"viewModel", "@", 0);
  [v3 validateProtocol:@"MUAppLockupViewModel" hasRequiredInstanceMethod:@"titleText"];
  [v3 validateClass:@"MUPlaceAppLockupView" hasInstanceVariable:@"_punchoutButton" withType:"UIButton"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MUPlaceAppLockupViewAccessibility *)self safeValueForKey:@"viewModel"];
  id v3 = [v2 safeStringForKey:@"titleText"];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(MUPlaceAppLockupViewAccessibility *)self safeUIViewForKey:@"_punchoutButton"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end