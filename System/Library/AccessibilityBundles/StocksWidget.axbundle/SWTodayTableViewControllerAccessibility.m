@interface SWTodayTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation SWTodayTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SWTodayTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SWTodayTableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SWTodayTableViewController", @"tableView: cellForRowAtIndexPath:", "@", "@", "@", 0);
  [v3 validateClass:@"Stock"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"companyName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"marketcap", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"formattedPrice", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"Stock", @"BlankValueString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"changeIsNegative", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"isIndex", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"changeIsZero", "B", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"Stock", @"formattedStringForString: fractionDigits: percentStyle:", "@", "@", "I", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"formattedChangePercent:", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"change", "@", 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)SWTodayTableViewControllerAccessibility;
  v8 = [(SWTodayTableViewControllerAccessibility *)&v45 tableView:v6 cellForRowAtIndexPath:v7];
  MEMORY[0x245664E80](@"SWTodayTableViewCell");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy_;
    v43 = __Block_byref_object_dispose_;
    id v44 = 0;
    id v38 = v7;
    AXPerformSafeBlock();
    id v9 = (id)v40[5];

    _Block_object_dispose(&v39, 8);
    v36 = [v9 safeValueForKey:@"companyName"];
    if ([v9 safeBoolForKey:@"isIndex"])
    {
      v35 = [v9 safeValueForKey:@"formattedPrice"];
    }
    else
    {
      v10 = NSString;
      v11 = accessibilityLocalizedString(@"stock.price");
      v12 = [v9 safeValueForKey:@"formattedPrice"];
      v35 = objc_msgSend(v10, "stringWithFormat:", v11, v12);
    }
    v13 = [v9 safeValueForKey:@"marketcap"];
    v34 = [(id)MEMORY[0x245664E80](@"Stock") safeValueForKey:@"BlankValueString"];
    if (objc_msgSend(v13, "isEqualToString:"))
    {
      v33 = 0;
    }
    else
    {
      [v13 floatValue];
      v14 = AXFormatFloat();

      v15 = (void *)MEMORY[0x263F08A30];
      v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "integerValue"));
      v13 = [v15 localizedStringFromNumber:v16 numberStyle:5];

      v17 = NSString;
      v18 = accessibilityLocalizedString(@"marketcap.value");
      v33 = objc_msgSend(v17, "stringWithFormat:", v18, v13);
    }
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy_;
    v43 = __Block_byref_object_dispose_;
    id v44 = 0;
    id v37 = v9;
    AXPerformSafeBlock();
    id v19 = (id)v40[5];

    _Block_object_dispose(&v39, 8);
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy_;
    v43 = __Block_byref_object_dispose_;
    id v44 = 0;
    id v20 = v37;
    AXPerformSafeBlock();
    id v21 = (id)v40[5];

    _Block_object_dispose(&v39, 8);
    if ([v20 safeBoolForKey:@"changeIsZero"])
    {
      v22 = accessibilityLocalizedString(@"no.change");
      v23 = accessibilityLocalizedString(@"no.change");
    }
    else
    {
      int v24 = [v20 safeBoolForKey:@"changeIsNegative"];
      v25 = NSString;
      if (v24)
      {
        v26 = accessibilityLocalizedString(@"negative.change");
        v22 = objc_msgSend(v25, "stringWithFormat:", v26, v19);

        v27 = NSString;
        v28 = @"down.value";
      }
      else
      {
        v29 = accessibilityLocalizedString(@"positive.change");
        v22 = objc_msgSend(v25, "stringWithFormat:", v29, v19);

        v27 = NSString;
        v28 = @"up.value";
      }
      v30 = accessibilityLocalizedString(v28);
      v23 = objc_msgSend(v27, "stringWithFormat:", v30, v21);
    }
    v31 = __UIAXStringForVariables();
    objc_msgSend(v8, "setAccessibilityLabel:", v31, v35, v23, v22, v33, @"__AXStringForVariablesSentinel");
  }

  return v8;
}

uint64_t __75__SWTodayTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _stockAtIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __75__SWTodayTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) formattedChangePercent:1];

  return MEMORY[0x270F9A758]();
}

void __75__SWTodayTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x245664E80](@"Stock");
  id v6 = [*(id *)(a1 + 32) safeValueForKey:@"change"];
  uint64_t v3 = [v2 formattedStringForString:v6 fractionDigits:2 percentStyle:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end