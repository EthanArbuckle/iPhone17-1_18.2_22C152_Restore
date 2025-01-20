@interface PLBatteryUIDisplayTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PLBatteryUIDisplayTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLBatteryUIDisplayTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLBatteryUIDisplayTableCell", @"refreshCellContentsWithSpecifier:", "v", "@", 0);
  [v3 validateClass:@"PLBatteryUIDisplayTableCell" isKindOfClass:@"PSTableCell"];
  [v3 validateClass:@"PLBatteryUIDisplayTableCell" isKindOfClass:@"UITableViewCell"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17.receiver = self;
  v17.super_class = (Class)PLBatteryUIDisplayTableCellAccessibility;
  [(PLBatteryUIDisplayTableCellAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  [(PLBatteryUIDisplayTableCellAccessibility *)self setAccessibilityLabel:0];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 specifier];

  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  objc_opt_class();
  v6 = [v5 accessoryView];
  v7 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    if (v7)
    {
      v8 = [v4 objectForKeyedSubscript:@"PLIconDisplayTypeKey"];
      int v9 = [v8 intValue];

      if (v9 == 1)
      {
        v10 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
        [v10 doubleValue];
        double v12 = v11;

        v13 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
        [v13 doubleValue];
        double v15 = v14;

        if (v12 >= 60.0 || v15 >= 60.0)
        {
          v16 = MEMORY[0x245644B40](0, v12 + v15);
          [v7 setAccessibilityLabel:v16];
        }
      }
    }
  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLBatteryUIDisplayTableCellAccessibility;
  [(PLBatteryUIDisplayTableCellAccessibility *)&v4 refreshCellContentsWithSpecifier:a3];
  [(PLBatteryUIDisplayTableCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)accessibilityLabel
{
  id v3 = [(PLBatteryUIDisplayTableCellAccessibility *)self textLabel];
  objc_super v4 = [v3 accessibilityLabel];
  v5 = [(PLBatteryUIDisplayTableCellAccessibility *)self detailTextLabel];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)accessibilityValue
{
  v2 = __UIAccessibilitySafeClass();
  id v3 = [v2 accessoryView];
  objc_super v4 = [v3 accessibilityLabel];

  if (([v4 isEqualToString:@" —"] & 1) != 0
    || ([v4 isEqualToString:@" — "] & 1) != 0
    || [v4 isEqualToString:@"—"])
  {
    uint64_t v5 = accessibilityLocalizedString(@"battery.app.usage.unavailable");

    objc_super v4 = (void *)v5;
  }

  return v4;
}

@end