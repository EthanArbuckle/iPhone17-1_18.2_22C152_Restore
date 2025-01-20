@interface PLBatteryUIGraphLastChargeCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PLBatteryUIGraphLastChargeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLBatteryUIGraphLastChargeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PLBatteryUIGraphLastChargeCell" hasInstanceVariable:@"_lastChargeTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"PLBatteryUIGraphLastChargeCell" hasInstanceVariable:@"_percentLabel" withType:"UILabel"];
  [v3 validateClass:@"PLBatteryUIGraphLastChargeCell" hasInstanceVariable:@"_timeStrLabel" withType:"UILabel"];
  [v3 validateClass:@"PLBatteryUIGraphLastChargeCell" isKindOfClass:@"PSTableCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLBatteryUIGraphLastChargeCell", @"refreshCellContentsWithSpecifier:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v16.receiver = self;
  v16.super_class = (Class)PLBatteryUIGraphLastChargeCellAccessibility;
  [(PLBatteryUIGraphLastChargeCellAccessibility *)&v16 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 specifier];

  v5 = [v4 propertyForKey:@"PLBatteryUILastChargeKey"];
  v6 = [v5 objectForKeyedSubscript:@"PLBatteryUITimestampKey"];
  v7 = __UIAccessibilitySafeClass();

  if (v7)
  {
    unint64_t v8 = [v7 unsignedLongValue];
    v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v8];
    v10 = [MEMORY[0x263EFF8F0] currentCalendar];
    v11 = [MEMORY[0x263EFF910] date];
    int v12 = [v10 isDate:v9 inSameDayAsDate:v11];

    if (v8 >> 4 <= 0x2A2 && v12 != 0)
    {
      v14 = [(PLBatteryUIGraphLastChargeCellAccessibility *)self safeValueForKey:@"_timeStrLabel"];
      v15 = AXTimeAgoStringForTimeSince();
      [v14 setAccessibilityLabel:v15];
    }
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(PLBatteryUIGraphLastChargeCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_lastChargeTitleLabel"];
}

- (id)accessibilityValue
{
  return (id)[(PLBatteryUIGraphLastChargeCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_percentLabel, _timeStrLabel"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF48];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLBatteryUIGraphLastChargeCellAccessibility;
  [(PLBatteryUIGraphLastChargeCellAccessibility *)&v4 refreshCellContentsWithSpecifier:a3];
  [(PLBatteryUIGraphLastChargeCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end