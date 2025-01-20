@interface PKPaymentPreferenceCardCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PKPaymentPreferenceCardCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentPreferenceCardCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentPreferenceCardCell" hasInstanceVariable:@"_accessoryViewType" withType:"NSInteger"];
  [v3 validateClass:@"PKPaymentPreferenceCardCell" hasInstanceVariable:@"_actionSwitch" withType:"UISwitch"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(PKPaymentPreferenceCardCellAccessibility *)self safeIntegerForKey:@"_accessoryViewType"] == 1)
  {
    id v3 = [(PKPaymentPreferenceCardCellAccessibility *)self safeValueForKey:@"actionSwitch"];
    [v3 accessibilityActivationPoint];
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentPreferenceCardCellAccessibility;
    [(PKPaymentPreferenceCardCellAccessibility *)&v10 accessibilityActivationPoint];
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityValue
{
  if ([(PKPaymentPreferenceCardCellAccessibility *)self safeIntegerForKey:@"_accessoryViewType"] == 1)
  {
    id v3 = [(PKPaymentPreferenceCardCellAccessibility *)self safeValueForKey:@"actionSwitch"];
    double v4 = [v3 accessibilityValue];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPaymentPreferenceCardCellAccessibility;
    double v4 = [(PKPaymentPreferenceCardCellAccessibility *)&v6 accessibilityValue];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  if ([(PKPaymentPreferenceCardCellAccessibility *)self safeIntegerForKey:@"_accessoryViewType"] == 1)return *MEMORY[0x263F81418]; {
  v4.receiver = self;
  }
  v4.super_class = (Class)PKPaymentPreferenceCardCellAccessibility;
  return [(PKPaymentPreferenceCardCellAccessibility *)&v4 accessibilityTraits];
}

@end