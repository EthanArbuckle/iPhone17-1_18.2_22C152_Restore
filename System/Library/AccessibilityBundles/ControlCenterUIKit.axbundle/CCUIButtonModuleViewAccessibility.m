@interface CCUIButtonModuleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityPath;
- (unint64_t)_accesibilityRawTraits;
- (unint64_t)accessibilityTraits;
@end

@implementation CCUIButtonModuleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIButtonModuleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUIButtonModuleView" isKindOfClass:@"UIControl"];
  [v3 validateClass:@"CCUIButtonModuleView" hasInstanceVariable:@"_highlightedBackgroundView" withType:"UIView"];
}

- (id)accessibilityPath
{
  id v3 = (void *)MEMORY[0x263F1C478];
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(CCUIButtonModuleViewAccessibility *)self safeUIViewForKey:@"_highlightedBackgroundView"];
  [v13 _continuousCornerRadius];
  objc_msgSend(v3, "_bezierPathWithPillRect:cornerRadius:", v6, v8, v10, v12, v14);
  v15 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v16 = UIAccessibilityConvertPathToScreenCoordinates(v15, (UIView *)self);

  return v16;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(CCUIButtonModuleViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (v3)
  {
    v4 = [(CCUIButtonModuleViewAccessibility *)self isAccessibilityUserDefinedElement];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    objc_opt_class();
    v4 = __UIAccessibilityCastAsClass();
    if ([v4 _accessibilityViewIsVisible])
    {
      double v6 = [v4 superview];
      char v5 = [v6 _accessibilityViewIsVisible];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)_accesibilityRawTraits
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = v2;
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
  uint64_t v3 = [(CCUIButtonModuleViewAccessibility *)self _accessibilityGetBlockForAttribute:4];
  unint64_t v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else {
    uint64_t v5 = [(CCUIButtonModuleViewAccessibility *)self _accesibilityRawTraits];
  }
  unint64_t v6 = v5;

  return v6;
}

- (id)accessibilityCustomActions
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIButtonModuleViewAccessibility;
  v2 = [(CCUIButtonModuleViewAccessibility *)&v5 accessibilityCustomActions];
  uint64_t v3 = AXGuaranteedMutableArray();

  UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded();

  return v3;
}

@end