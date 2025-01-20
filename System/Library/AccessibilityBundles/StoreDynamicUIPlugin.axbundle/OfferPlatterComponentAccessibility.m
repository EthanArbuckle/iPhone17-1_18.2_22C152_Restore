@interface OfferPlatterComponentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation OfferPlatterComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"StoreDynamicUIPlugin.OfferPlatterComponent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"StoreDynamicUIPlugin.OfferPlatterComponent" hasSwiftField:@"infoLabel" withSwiftType:"DynamicLabel"];
  [v3 validateClass:@"StoreDynamicUIPlugin.OfferPlatterComponent" hasSwiftField:@"titleLabel" withSwiftType:"DynamicLabel"];
  [v3 validateClass:@"StoreDynamicUIPlugin.OfferPlatterComponent" hasSwiftField:@"subtitleLabel" withSwiftType:"DynamicLabel"];
  [v3 validateClass:@"StoreDynamicUIPlugin.OfferPlatterComponent" hasSwiftField:@"buttonView" withSwiftType:"DynamicButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)OfferPlatterComponentAccessibility;
  [(OfferPlatterComponentAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (id)accessibilityLabel
{
  id v3 = [(OfferPlatterComponentAccessibility *)self safeSwiftValueForKey:@"infoLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(OfferPlatterComponentAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = [(OfferPlatterComponentAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  v8 = [v7 accessibilityLabel];

  v9 = [(OfferPlatterComponentAccessibility *)self safeSwiftValueForKey:@"buttonView"];
  v10 = [v9 accessibilityLabel];

  v11 = __UIAXStringForVariables();

  return v11;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  objc_super v2 = [(OfferPlatterComponentAccessibility *)self safeSwiftValueForKey:@"buttonView"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)OfferPlatterComponentAccessibility;
  [(OfferPlatterComponentAccessibility *)&v3 layoutSubviews];
  [(OfferPlatterComponentAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end