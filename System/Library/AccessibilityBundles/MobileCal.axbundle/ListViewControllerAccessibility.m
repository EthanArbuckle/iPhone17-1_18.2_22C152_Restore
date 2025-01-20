@interface ListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsDateInCurrentYear:(id)a3;
- (id)_axCalendarModel;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation ListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CUIKCalendarModel", @"dateForCachedOccurrencesInSection: usingFilter:", "@", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ListViewController", @"showFilteredData", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ListViewController", @"tableView", "@", 0);
  [v3 validateClass:@"ListViewController" isKindOfClass:@"MainViewController"];
  [v3 validateClass:@"MainViewController" hasInstanceVariable:@"_model" withType:"CUIKCalendarModel"];
}

- (id)_axCalendarModel
{
  return (id)[(ListViewControllerAccessibility *)self safeValueForKey:@"model"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)ListViewControllerAccessibility;
  [(ListViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ListViewControllerAccessibility *)self safeValueForKey:@"tableView"];
  id v4 = (id)[v3 safeValueForKey:@"reloadData"];
}

- (BOOL)_accessibilityIsDateInCurrentYear:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_super v5 = [(ListViewControllerAccessibility *)self safeValueForKey:@"_model"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = (void *)MEMORY[0x263F30080];
  v8 = [MEMORY[0x263EFF910] date];
  v9 = [v6 eventStore];
  v10 = [v9 timeZone];
  v11 = [v7 calendarDateWithDate:v8 timeZone:v10];

  v12 = [v11 calendarDateForYear];
  v13 = [v12 calendarDateForEndOfYear];
  v14 = [v12 date];
  if ([v4 compare:v14] == -1)
  {
    BOOL v16 = 0;
  }
  else
  {
    v15 = [v13 date];
    BOOL v16 = [v4 compare:v15] != 1;
  }
  return v16;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)ListViewControllerAccessibility;
  objc_super v5 = -[ListViewControllerAccessibility tableView:viewForHeaderInSection:](&v11, sel_tableView_viewForHeaderInSection_, a3);
  v6 = [(ListViewControllerAccessibility *)self _axCalendarModel];
  id v10 = v5;
  id v7 = v6;
  AXPerformSafeBlock();
  id v8 = v10;

  return v8;
}

void __68__ListViewControllerAccessibility_tableView_viewForHeaderInSection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dateForCachedOccurrencesInSection:usingFilter:", *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "safeBoolForKey:", @"showFilteredData"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "_accessibilityIsDateInCurrentYear:")) {
    _AXGetYearlessStringForDay();
  }
  else {
  v2 = _AXGetStringForDay();
  }
  [*(id *)(a1 + 48) setAccessibilityLabel:v2];
  [*(id *)(a1 + 48) setIsAccessibilityElement:1];
}

@end