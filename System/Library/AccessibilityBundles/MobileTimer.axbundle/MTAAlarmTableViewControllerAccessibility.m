@interface MTAAlarmTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetDetailLabelsForVisibleCells;
- (void)_axSetHeaderLabelForSleepSection:(id)a3;
- (void)viewDidLoad;
@end

@implementation MTAAlarmTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAAlarmTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MTAAlarmTableViewController" isKindOfClass:@"UITableViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmTableViewController", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmTableViewController", @"_isAlarmsSection:", "B", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmTableViewController", @"_isWakeAlarmSection:", "B", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmTableViewController", @"tableView:viewForHeaderInSection:", "@", "@", "q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MTAAlarmTableViewControllerAccessibility;
  [(MTAAlarmTableViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MTAAlarmTableViewControllerAccessibility *)self _axSetDetailLabelsForVisibleCells];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MTAAlarmTableViewControllerAccessibility;
  [(MTAAlarmTableViewControllerAccessibility *)&v3 viewDidLoad];
  [(MTAAlarmTableViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_axSetDetailLabelsForVisibleCells
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  LOBYTE(v21) = 0;
  objc_opt_class();
  v20 = __UIAccessibilityCastAsClass();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  objc_super v3 = [v20 tableView];
  id obj = [v3 indexPathsForVisibleRows];

  uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v4)
  {
    uint64_t v19 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v21 = 0;
        v22 = &v21;
        uint64_t v23 = 0x2020000000;
        LOBYTE(v24) = 0;
        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        v29 = __77__MTAAlarmTableViewControllerAccessibility__axSetDetailLabelsForVisibleCells__block_invoke;
        v30 = &unk_26513A070;
        v32 = v6;
        v33 = &v21;
        v31 = self;
        AXPerformSafeBlock();
        int v7 = *((unsigned __int8 *)v22 + 24);
        _Block_object_dispose(&v21, 8);
        if (v7)
        {
          v8 = [(MTAAlarmTableViewControllerAccessibility *)self safeValueForKey:@"dataSource"];
          uint64_t v21 = 0;
          v22 = &v21;
          uint64_t v23 = 0x3032000000;
          v24 = __Block_byref_object_copy_;
          v25 = __Block_byref_object_dispose_;
          id v26 = 0;
          id v9 = v8;
          AXPerformSafeBlock();
          id v10 = (id)v22[5];

          _Block_object_dispose(&v21, 8);
          v11 = [v20 tableView];
          v12 = [v11 cellForRowAtIndexPath:v6];

          LOBYTE(v21) = 0;
          objc_opt_class();
          v13 = __UIAccessibilityCastAsSafeCategory();
          if ((_BYTE)v21) {
            abort();
          }
          v14 = v13;
          [v13 _axSetDetailLabelForAlarm:v10];
        }
        uint64_t v21 = 0;
        v22 = &v21;
        uint64_t v23 = 0x2020000000;
        LOBYTE(v24) = 0;
        AXPerformSafeBlock();
        int v15 = *((unsigned __int8 *)v22 + 24);
        _Block_object_dispose(&v21, 8);
        if (v15)
        {
          v16 = [v20 tableView];
          v17 = objc_msgSend(v16, "headerViewForSection:", objc_msgSend(v6, "section"));

          [(MTAAlarmTableViewControllerAccessibility *)self _axSetHeaderLabelForSleepSection:v17];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v4);
  }
}

uint64_t __77__MTAAlarmTableViewControllerAccessibility__axSetDetailLabelsForVisibleCells__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_isAlarmsSection:", objc_msgSend(*(id *)(a1 + 40), "section"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __77__MTAAlarmTableViewControllerAccessibility__axSetDetailLabelsForVisibleCells__block_invoke_294(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "alarmAtRow:", objc_msgSend(*(id *)(a1 + 40), "row"));

  return MEMORY[0x270F9A758]();
}

uint64_t __77__MTAAlarmTableViewControllerAccessibility__axSetDetailLabelsForVisibleCells__block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_isWakeAlarmSection:", objc_msgSend(*(id *)(a1 + 40), "section"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_axSetHeaderLabelForSleepSection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 _accessibilityDescendantOfType:objc_opt_class()];
  objc_opt_class();
  v5 = [v3 contentConfiguration];
  v6 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  int v7 = [v6 attributedText];
  v8 = [v7 string];
  [v4 setAccessibilityLabel:v8];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTAAlarmTableViewControllerAccessibility;
  int v7 = [(MTAAlarmTableViewControllerAccessibility *)&v15 tableView:v6 viewForHeaderInSection:a4];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  AXPerformSafeBlock();
  LODWORD(a4) = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  if (a4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      LOBYTE(v11) = 0;
      objc_opt_class();
      uint64_t v8 = __UIAccessibilityCastAsClass();
      if ((_BYTE)v11) {
        abort();
      }
      id v9 = (void *)v8;
      [(MTAAlarmTableViewControllerAccessibility *)self _axSetHeaderLabelForSleepSection:v8];
    }
  }

  return v7;
}

uint64_t __77__MTAAlarmTableViewControllerAccessibility_tableView_viewForHeaderInSection___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isWakeAlarmSection:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end