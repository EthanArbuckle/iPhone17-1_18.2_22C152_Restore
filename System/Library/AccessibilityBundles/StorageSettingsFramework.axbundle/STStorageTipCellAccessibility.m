@interface STStorageTipCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation STStorageTipCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STStorageTipCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STStorageTipCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageTipCell" hasInstanceVariable:@"_progressLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageTipCell" hasInstanceVariable:@"_enableButton" withType:"UIButton"];
  [v3 validateClass:@"STStorageTipCell" hasInstanceVariable:@"_spinner" withType:"UIActivityIndicatorView"];
  [v3 validateClass:@"STStorageTipCell" hasInstanceVariable:@"_checkIconView" withType:"UIImageView"];
  [v3 validateClass:@"STStorageTipCell" hasInstanceVariable:@"_percent" withType:"f"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)STStorageTipCellAccessibility;
  [(STStorageTipCellAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  int v3 = _AXSAutomationEnabled();
  objc_opt_class();
  v4 = [(STStorageTipCellAccessibility *)self safeValueForKey:@"_checkIconView"];
  v5 = __UIAccessibilityCastAsClass();

  [v5 setIsAccessibilityElement:v3 != 0];
}

- (id)accessibilityLabel
{
  return (id)[(STStorageTipCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _progressLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  int v3 = [(STStorageTipCellAccessibility *)self safeValueForKey:@"_enableButton"];
  int v4 = [v3 _accessibilityViewIsVisible];

  if (v4)
  {
    v5 = @"tip.cell.not.enabled";
LABEL_5:
    v8 = accessibilityPreferencesFrameworkBundleLocalizedString(v5);
    goto LABEL_7;
  }
  objc_super v6 = [(STStorageTipCellAccessibility *)self safeValueForKey:@"_checkIconView"];
  int v7 = [v6 _accessibilityViewIsVisible];

  if (v7)
  {
    v5 = @"tip.cell.enabled";
    goto LABEL_5;
  }
  v10.receiver = self;
  v10.super_class = (Class)STStorageTipCellAccessibility;
  v8 = [(STStorageTipCellAccessibility *)&v10 accessibilityValue];
LABEL_7:

  return v8;
}

- (id)accessibilityHint
{
  int v3 = [(STStorageTipCellAccessibility *)self safeValueForKey:@"_enableButton"];
  int v4 = [v3 _accessibilityViewIsVisible];

  if (v4)
  {
    v5 = @"tip.cell.not.enabled.hint";
LABEL_5:
    v8 = accessibilityPreferencesFrameworkBundleLocalizedString(v5);
    goto LABEL_7;
  }
  objc_super v6 = [(STStorageTipCellAccessibility *)self safeValueForKey:@"_checkIconView"];
  int v7 = [v6 _accessibilityViewIsVisible];

  if (v7)
  {
    v5 = @"tip.cell.enabled.hint";
    goto LABEL_5;
  }
  v10.receiver = self;
  v10.super_class = (Class)STStorageTipCellAccessibility;
  v8 = [(STStorageTipCellAccessibility *)&v10 accessibilityValue];
LABEL_7:

  return v8;
}

- (unint64_t)accessibilityTraits
{
  v9.receiver = self;
  v9.super_class = (Class)STStorageTipCellAccessibility;
  unint64_t v3 = [(STStorageTipCellAccessibility *)&v9 accessibilityTraits];
  int v4 = [(STStorageTipCellAccessibility *)self safeValueForKey:@"_enableButton"];
  int v5 = [v4 _accessibilityViewIsVisible];
  uint64_t v6 = *MEMORY[0x263F1CEE8];
  if (!v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v6 | v3;

  return v7;
}

- (id)automationElements
{
  unint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  int v4 = [(STStorageTipCellAccessibility *)self safeValueForKey:@"_titleLabel"];
  int v5 = [(STStorageTipCellAccessibility *)self safeValueForKey:@"_progressLabel"];
  uint64_t v6 = [(STStorageTipCellAccessibility *)self safeValueForKey:@"_enableButton"];
  unint64_t v7 = [(STStorageTipCellAccessibility *)self safeValueForKey:@"_spinner"];
  v8 = [(STStorageTipCellAccessibility *)self safeValueForKey:@"_checkIconView"];
  objc_super v9 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 5, v4, v5, v6, v7, v8);

  objc_super v10 = [v9 axFilterObjectsUsingBlock:&__block_literal_global_0];

  return v10;
}

uint64_t __51__STStorageTipCellAccessibility_automationElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  unint64_t v3 = __UIAccessibilityCastAsClass();
  uint64_t v4 = [v3 isHidden] ^ 1;

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  id v2 = [(STStorageTipCellAccessibility *)self safeValueForKey:@"_enableButton"];
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