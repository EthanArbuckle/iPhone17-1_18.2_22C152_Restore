@interface PLBatteryUIBatteryBreakDownHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)buttonAction:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PLBatteryUIBatteryBreakDownHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLBatteryUIBatteryBreakDownHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PLBatteryUIBatteryBreakDownHeaderCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLBatteryUIBatteryBreakDownHeaderCell", @"breakdownTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLBatteryUIBatteryBreakDownHeaderCell", @"breakdownToggleButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLBatteryUIBatteryBreakDownHeaderCell", @"refreshCellContentsWithSpecifier:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLBatteryUIBatteryBreakDownHeaderCell", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLBatteryUIBatteryBreakDownHeaderCell", @"buttonAction:", "v", "@", 0);
  [v3 validateClass:@"BatteryUIController"];
  [v3 validateClass:@"BatteryUIController" hasInstanceVariable:@"_iconDisplayType" withType:"i"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PLBatteryUIBatteryBreakDownHeaderCellAccessibility;
  [(PLBatteryUIBatteryBreakDownHeaderCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PLBatteryUIBatteryBreakDownHeaderCellAccessibility *)self safeValueForKey:@"breakdownTitleLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];

  v4 = [(PLBatteryUIBatteryBreakDownHeaderCellAccessibility *)self safeValueForKey:@"breakdownToggleButton"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
}

- (id)accessibilityElements
{
  char v9 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 contentView];
    v6 = [v5 subviews];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLBatteryUIBatteryBreakDownHeaderCellAccessibility;
    v6 = [(PLBatteryUIBatteryBreakDownHeaderCellAccessibility *)&v8 accessibilityElements];
  }

  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLBatteryUIBatteryBreakDownHeaderCellAccessibility;
  [(PLBatteryUIBatteryBreakDownHeaderCellAccessibility *)&v4 refreshCellContentsWithSpecifier:a3];
  [(PLBatteryUIBatteryBreakDownHeaderCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)buttonAction:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLBatteryUIBatteryBreakDownHeaderCellAccessibility;
  [(PLBatteryUIBatteryBreakDownHeaderCellAccessibility *)&v8 buttonAction:a3];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_super v4 = [(PLBatteryUIBatteryBreakDownHeaderCellAccessibility *)self safeValueForKey:@"delegate"];
    MEMORY[0x245644B60](@"BatteryUIController");
    if (objc_opt_isKindOfClass())
    {
      int v5 = [v4 safeIntForKey:@"_iconDisplayType"];
      if (!v5)
      {
        v6 = @"battery.show.percentage.confirmation";
        goto LABEL_7;
      }
      if (v5 == 1)
      {
        v6 = @"battery.show.screenon.confirmation";
LABEL_7:
        v7 = accessibilityLocalizedString(v6);
        UIAccessibilitySpeakAndDoNotBeInterrupted();
      }
    }
  }
}

@end