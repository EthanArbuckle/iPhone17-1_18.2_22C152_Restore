@interface HUColorWheelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HUColorWheelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUColorWheelView";
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

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE0];
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(HUColorWheelViewAccessibility *)self superview];
  v3 = [v2 subviews];

  v4 = [v3 axFilterObjectsUsingBlock:&__block_literal_global_4];
  v5 = [v4 firstObject];

  [v5 accessibilityActivationPoint];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

uint64_t __61__HUColorWheelViewAccessibility_accessibilityActivationPoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456509F0](@"HUQuickControlMagnifierView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  return accessibilityHomeUILocalizedString(@"controls.color.picker.label");
}

- (id)accessibilityHint
{
  return accessibilityHomeUILocalizedString(@"controls.color.picker.hint");
}

@end