@interface PKSettingTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PKSettingTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKSettingTableCell";
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

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(PKSettingTableCellAccessibility *)self safeValueForKey:@"_settingSwitch"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityValue
{
  v2 = [(PKSettingTableCellAccessibility *)self safeValueForKey:@"_settingSwitch"];
  double v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(PKSettingTableCellAccessibility *)self safeValueForKey:@"_settingSwitch"];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

@end