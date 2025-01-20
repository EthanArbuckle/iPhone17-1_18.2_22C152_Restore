@interface HUItemTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation HUItemTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUItemTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUItemTableViewController", @"tableView:cellForRowAtIndexPath:", "@", "@", "@", 0);
  [v3 validateClass:@"HUItemTableViewController" hasInstanceVariable:@"_itemManager" withType:"HFItemManager"];
  [v3 validateClass:@"HUStatusAndNotificationsItemManager" isKindOfClass:@"HFItemManager"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUStatusAndNotificationsItemManager", @"conditionModule", "@", 0);
  [v3 validateClass:@"HUStatusAndNotificationsItemManager" hasInstanceVariable:@"_conditionModule" withType:"HUTriggerConditionEditorItemModule"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUTriggerConditionEditorItemModule", @"isShowConditionOptionsItem:", "B", "@", 0);
  [v3 validateClass:@"HUEditableTextCell"];
  [v3 validateClass:@"HUTitleValueCell" isKindOfClass:@"HUIconCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUIconCell", @"isDisabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUTitleValueCell", @"titleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUTitleValueCell", @"valueText", "@", 0);
  [v3 validateClass:@"HUEditableTextCell" hasInstanceVariable:@"_textField" withType:"UITextField"];
  [v3 validateClass:@"HUDynamicAlignmentTitleValueCell"];
  [v3 validateClass:@"HUServiceDetailsRoomItem"];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HUItemTableViewControllerAccessibility;
  v8 = [(HUItemTableViewControllerAccessibility *)&v27 tableView:v6 cellForRowAtIndexPath:v7];
  MEMORY[0x2456509F0](@"HUEditableTextCell");
  if (objc_opt_isKindOfClass())
  {
    [v8 setIsAccessibilityElement:0];
    objc_initWeak(&location, v8);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke;
    v25[3] = &unk_2651282E0;
    objc_copyWeak(&v26, &location);
    [v8 _setAccessibilityElementsBlock:v25];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    goto LABEL_12;
  }
  LOBYTE(location) = 0;
  objc_opt_class();
  v9 = [(HUItemTableViewControllerAccessibility *)self safeValueForKey:@"itemManager"];
  v10 = __UIAccessibilityCastAsClass();

  v11 = [v10 displayedItemAtIndexPath:v7];
  if (objc_opt_respondsToSelector())
  {
    id location = 0;
    p_id location = &location;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    v17[1] = (id)MEMORY[0x263EF8330];
    v17[2] = (id)3221225472;
    v17[3] = __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_3;
    v17[4] = &unk_265128060;
    v20 = &location;
    id v18 = v10;
    id v19 = v11;
    AXPerformSafeBlock();
    int v12 = *((unsigned __int8 *)p_location + 24);

    _Block_object_dispose(&location, 8);
    if (!v12) {
      goto LABEL_11;
    }
  }
  else
  {
    MEMORY[0x2456509F0](@"HUDynamicAlignmentTitleValueCell");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      MEMORY[0x2456509F0](@"HUServiceDetailsRoomItem");
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        MEMORY[0x2456509F0](@"HUTitleValueCell");
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_11;
        }
        v13 = [v8 safeValueForKey:@"valueText"];

        if (!v13) {
          goto LABEL_11;
        }
      }
    }
  }
  uint64_t v14 = [v8 accessibilityTraits];
  [v8 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v14];
  objc_initWeak(&location, v8);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_4;
  v16[3] = &unk_265128018;
  objc_copyWeak(v17, &location);
  [v8 _setAccessibilityHintBlock:v16];
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
LABEL_11:

LABEL_12:

  return v8;
}

id __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  LOBYTE(location) = 0;
  objc_opt_class();
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained safeValueForKey:@"_textField"];
  v5 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, v5);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_2;
  v11 = &unk_2651282B8;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, v2);
  [v5 _setAccessibilityLabelBlock:&v8];
  id v6 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v5, v8, v9, v10, v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

id __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained isEditing];

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = [v5 safeValueForKey:@"titleText"];
  }

  return v4;
}

void __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"conditionModule"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 isShowConditionOptionsItem:*(void *)(a1 + 40)];
}

id __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeBoolForKey:@"isDisabled"])
  {
    id v2 = 0;
  }
  else
  {
    id v2 = accessibilityHomeUILocalizedString(@"options.cell.toggle");
  }

  return v2;
}

@end