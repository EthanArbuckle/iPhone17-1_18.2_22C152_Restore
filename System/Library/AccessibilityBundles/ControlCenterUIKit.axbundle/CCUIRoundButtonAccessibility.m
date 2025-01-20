@interface CCUIRoundButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityServesAsFirstElement;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (unint64_t)_accesibilityRawTraits;
- (unint64_t)accessibilityTraits;
@end

@implementation CCUIRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIRoundButton";
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
  [(CCUIRoundButtonAccessibility *)self safeCGFloatForKey:@"alpha"];
  return v2 > 0.1;
}

- (unint64_t)_accesibilityRawTraits
{
  objc_opt_class();
  double v2 = __UIAccessibilityCastAsClass();
  v3 = v2;
  unint64_t v4 = *MEMORY[0x263F1CEE8];
  if (v2)
  {
    int v5 = [v2 isEnabled];
    uint64_t v6 = *MEMORY[0x263F1CF20];
    if (v5) {
      uint64_t v6 = 0;
    }
    v4 |= v6;
    if ([v3 isSelected]) {
      v4 |= *MEMORY[0x263F1CF38];
    }
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3 = [(CCUIRoundButtonAccessibility *)self _accessibilityGetBlockForAttribute:4];
  unint64_t v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else {
    uint64_t v5 = [(CCUIRoundButtonAccessibility *)self _accesibilityRawTraits];
  }
  unint64_t v6 = v5;

  return v6;
}

- (id)accessibilityCustomActions
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIRoundButtonAccessibility;
  double v2 = [(CCUIRoundButtonAccessibility *)&v5 accessibilityCustomActions];
  uint64_t v3 = AXGuaranteedMutableArray();

  UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded();

  return v3;
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

@end