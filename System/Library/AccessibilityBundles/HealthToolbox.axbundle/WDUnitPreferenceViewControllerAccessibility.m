@interface WDUnitPreferenceViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation WDUnitPreferenceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WDUnitPreferenceViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WDUnitPreferenceViewController" hasInstanceVariable:@"_rows" withType:"NSArray"];
  [v3 validateClass:@"WDUnitPreferenceViewController" hasInstanceVariable:@"_unitController" withType:"HKUnitPreferenceController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_WDUnitPreferenceViewControllerRow", @"unit", "@", 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)WDUnitPreferenceViewControllerAccessibility;
  v8 = [(WDUnitPreferenceViewControllerAccessibility *)&v30 tableView:v6 cellForRowAtIndexPath:v7];
  LOBYTE(v23) = 0;
  v9 = [(WDUnitPreferenceViewControllerAccessibility *)self safeValueForKey:@"_rows"];
  v10 = __UIAccessibilitySafeClass();

  unint64_t v11 = [v7 row];
  if (v11 < [v10 count])
  {
    v12 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row"));
    v13 = __UIAccessibilitySafeClass();

    v14 = [v13 safeValueForKey:@"unit"];
    v15 = __UIAccessibilitySafeClass();

    v16 = [(WDUnitPreferenceViewControllerAccessibility *)self safeValueForKey:@"_unitController"];
    char v29 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    id v28 = 0;
    uint64_t v22 = MEMORY[0x263EF8330];
    id v17 = v16;
    id v18 = v15;
    AXPerformSafeBlock();
    id v19 = (id)v24[5];

    _Block_object_dispose(&v23, 8);
    v20 = __UIAccessibilitySafeClass();

    if (v29) {
      abort();
    }
    objc_msgSend(v8, "setAccessibilityLabel:", v20, v22, 3221225472, __79__WDUnitPreferenceViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke, &unk_265125998);
  }

  return v8;
}

uint64_t __79__WDUnitPreferenceViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) accessibilityNameForUnit:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

@end