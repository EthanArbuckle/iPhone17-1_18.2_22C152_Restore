@interface PLBatteryUITimeUsageCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PLBatteryUITimeUsageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLBatteryUITimeUsageCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PLBatteryUITimeUsageCell" isKindOfClass:@"PSTableCell"];
  [v3 validateClass:@"PLBatteryUITimeUsageCell" hasInstanceVariable:@"_screenOnText" withType:"UILabel"];
  [v3 validateClass:@"PLBatteryUITimeUsageCell" hasInstanceVariable:@"_screenOffText" withType:"UILabel"];
  [v3 validateClass:@"PLBatteryUITimeUsageCell" hasInstanceVariable:@"_screenOnTimeText" withType:"UILabel"];
  [v3 validateClass:@"PLBatteryUITimeUsageCell" hasInstanceVariable:@"_screenOffTimeText" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLBatteryUITimeUsageCell", @"refreshCellContentsWithSpecifier:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v27.receiver = self;
  v27.super_class = (Class)PLBatteryUITimeUsageCellAccessibility;
  [(PLBatteryUITimeUsageCellAccessibility *)&v27 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v26 = __UIAccessibilityCastAsClass();
  id v3 = [v26 specifier];
  v4 = [v3 propertyForKey:@"PLBatteryUIGraphScreenOnUsageTimeKey"];
  int v5 = [v4 intValue];

  v6 = [v3 propertyForKey:@"PLBatteryUIGraphScreenOffUsageTimeKey"];
  int v7 = [v6 intValue];

  v8 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = [(PLBatteryUITimeUsageCellAccessibility *)self safeValueForKey:@"_screenOnText"];
  v10 = [(PLBatteryUITimeUsageCellAccessibility *)self safeValueForKey:@"_screenOnTimeText"];
  v11 = MEMORY[0x245644B40](0, (double)v5);
  [v10 setAccessibilityLabel:v11];

  id v12 = objc_alloc(MEMORY[0x263F81178]);
  v25 = (void *)v9;
  v13 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v9, v10);
  v14 = (void *)[v12 initWithAccessibilityContainer:self representedElements:v13];

  v15 = [v14 representedElements];
  uint64_t v16 = [v15 count];

  if (v16) {
    [v8 addObject:v14];
  }
  v17 = [(PLBatteryUITimeUsageCellAccessibility *)self safeValueForKey:@"_screenOffText"];
  v18 = [(PLBatteryUITimeUsageCellAccessibility *)self safeValueForKey:@"_screenOffTimeText"];
  v19 = MEMORY[0x245644B40](0, (double)v7);
  [v18 setAccessibilityLabel:v19];

  id v20 = objc_alloc(MEMORY[0x263F81178]);
  v21 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v17, v18);
  v22 = (void *)[v20 initWithAccessibilityContainer:self representedElements:v21];

  v23 = [v22 representedElements];
  uint64_t v24 = [v23 count];

  if (v24) {
    [v8 addObject:v22];
  }
  [(PLBatteryUITimeUsageCellAccessibility *)self setAccessibilityElements:v8];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLBatteryUITimeUsageCellAccessibility;
  [(PLBatteryUITimeUsageCellAccessibility *)&v4 refreshCellContentsWithSpecifier:a3];
  [(PLBatteryUITimeUsageCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end