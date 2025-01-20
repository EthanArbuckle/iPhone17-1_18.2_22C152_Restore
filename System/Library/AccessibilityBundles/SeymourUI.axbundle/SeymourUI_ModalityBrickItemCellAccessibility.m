@interface SeymourUI_ModalityBrickItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SeymourUI_ModalityBrickItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.ModalityBrickItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SeymourUI.ModalityBrickItemCell" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"SeymourUI.ModalityBrickItemCell" hasSwiftField:@"iconView" withSwiftType:"ActivityTypeIconView"];
  [v3 validateClass:@"SeymourUI.ActivityTypeIconView" isKindOfClass:@"UIView"];
}

- (id)accessibilityLabel
{
  v2 = [(SeymourUI_ModalityBrickItemCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SeymourUI_ModalityBrickItemCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SeymourUI_ModalityBrickItemCellAccessibility *)&v3 accessibilityTraits];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)SeymourUI_ModalityBrickItemCellAccessibility;
  [(SeymourUI_ModalityBrickItemCellAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(SeymourUI_ModalityBrickItemCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v4 = [(SeymourUI_ModalityBrickItemCellAccessibility *)self safeSwiftValueForKey:@"iconView"];
  v5 = [(SeymourUI_ModalityBrickItemCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v6 = [v5 accessibilityLabel];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__SeymourUI_ModalityBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v11[3] = &unk_26514ED80;
  id v7 = v6;
  id v12 = v7;
  [v3 _setAccessibilityIdentifierBlock:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __90__SeymourUI_ModalityBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v9[3] = &unk_26514ED80;
  id v10 = v7;
  id v8 = v7;
  [v4 _setAccessibilityIdentifierBlock:v9];
}

@end