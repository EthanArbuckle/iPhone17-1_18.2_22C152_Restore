@interface HUDayOfWeekPickerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (HUDayOfWeekPickerCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HUDayOfWeekPickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUDayOfWeekPickerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUDayOfWeekPickerCell", @"buttons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUDayOfWeekPickerCell", @"initWithStyle: reuseIdentifier:", "@", "q", "@", 0);
}

- (HUDayOfWeekPickerCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HUDayOfWeekPickerCellAccessibility;
  v4 = [(HUDayOfWeekPickerCellAccessibility *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(HUDayOfWeekPickerCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)HUDayOfWeekPickerCellAccessibility;
  [(HUDayOfWeekPickerCellAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  v4 = [v3 weekdaySymbols];

  char v10 = 0;
  objc_opt_class();
  v5 = [(HUDayOfWeekPickerCellAccessibility *)self safeValueForKey:@"buttons"];
  objc_super v6 = __UIAccessibilityCastAsClass();

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__HUDayOfWeekPickerCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_2651281F8;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __80__HUDayOfWeekPickerCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  unint64_t v5 = [v4 tag] - 1;
  if (v5 < [*(id *)(a1 + 32) count])
  {
    objc_super v6 = [*(id *)(a1 + 32) objectAtIndex:v5];
    [v4 setAccessibilityLabel:v6];
  }
}

@end