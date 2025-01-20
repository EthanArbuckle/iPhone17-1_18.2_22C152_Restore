@interface BCSTorchButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInstructionsHint;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation BCSTorchButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BCSTorchButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"torch.button");
}

- (unint64_t)accessibilityTraits
{
  v12.receiver = self;
  v12.super_class = (Class)BCSTorchButtonViewAccessibility;
  unint64_t v3 = [(BCSTorchButtonViewAccessibility *)&v12 accessibilityTraits];
  uint64_t v4 = *MEMORY[0x263F81418];
  objc_opt_class();
  v5 = [(BCSTorchButtonViewAccessibility *)self safeValueForKey:@"_torchButton"];
  v6 = __UIAccessibilityCastAsClass();

  unint64_t v7 = (v4 | v3 | *MEMORY[0x263F1CEE8]) & ~*MEMORY[0x263F1CF38];
  int v8 = [v6 isEnabled];
  uint64_t v9 = *MEMORY[0x263F1CF20];
  if (v8) {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v9 | v7;

  return v10;
}

- (id)accessibilityValue
{
  objc_opt_class();
  unint64_t v3 = [(BCSTorchButtonViewAccessibility *)self safeValueForKey:@"_torchButton"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  if ([v4 isSelected]) {
    v5 = @"1";
  }
  else {
    v5 = @"0";
  }
  v6 = v5;

  return v6;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"torch.hint");
}

- (BOOL)_accessibilityOverridesInstructionsHint
{
  return 1;
}

@end