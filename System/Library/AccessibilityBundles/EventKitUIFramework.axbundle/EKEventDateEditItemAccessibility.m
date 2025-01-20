@interface EKEventDateEditItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetupDateCellForKey:(id)a3;
- (void)_axUpdateEndDateCellLabel;
- (void)_datePickerChanged:(id)a3;
- (void)_showInlineControls:(int64_t)a3 forSubitem:(int64_t)a4 includingInlineDatePicker:(BOOL)a5;
- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4;
@end

@implementation EKEventDateEditItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKEventDateEditItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventDateEditItem", @"_modernEndDateCell", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventDateEditItem", @"_endDateIsBeforeStartDate", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventDateEditItem", @"_datePickerChanged:", "v", "@", 0);
  [v3 validateClass:@"EKEventDateEditItem" isKindOfClass:@"EKEventEditItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventDateEditItem", @"_rowForSubitem:", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKCalendarItemEditor", @"tableSectionForEditItem:", "Q", "@", 0);
  [v3 validateClass:@"EKEventDateEditItem" hasInstanceVariable:@"_startDatePickerCell" withType:"UITableViewCell"];
  [v3 validateClass:@"EKEventDateEditItem" hasInstanceVariable:@"_endDatePickerCell" withType:"UITableViewCell"];
  [v3 validateClass:@"EKEventDateEditItem" hasInstanceVariable:@"_startDatePicker" withType:"UIDatePicker"];
  [v3 validateClass:@"EKEventDateEditItem" hasInstanceVariable:@"_endDatePicker" withType:"UIDatePicker"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventDateEditItem", @"_showInlineControls:forSubitem:includingInlineDatePicker:", "v", "q", "q", "B", 0);
  [v3 validateClass:@"EKEventDateEditItem" hasInstanceVariable:@"_selectedSubitem" withType:"q"];
  [v3 validateClass:@"EKEventDateEditItem" hasInstanceVariable:@"_currentPickerMode" withType:"q"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventDateEditItemAccessibility;
  [(EKEventDateEditItemAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  [(EKEventDateEditItemAccessibility *)self _axUpdateEndDateCellLabel];
  id v3 = [(EKEventDateEditItemAccessibility *)self safeValueForKey:@"_modernEndDateCell"];
  [v3 _accessibilitySetAssignedValue:self forKey:@"AXEKEventDateEditItem"];

  [(EKEventDateEditItemAccessibility *)self _accessibilitySetupDateCellForKey:@"_start"];
  [(EKEventDateEditItemAccessibility *)self _accessibilitySetupDateCellForKey:@"_end"];
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKEventDateEditItemAccessibility;
  -[EKEventDateEditItemAccessibility editor:didSelectSubitem:](&v7, sel_editor_didSelectSubitem_, a3);
  uint64_t v6 = MEMORY[0x263EF8330];
  AXPerformBlockAsynchronouslyOnMainThread();
  [(EKEventDateEditItemAccessibility *)self _accessibilitySetupDateCellForKey:@"_start", v6, 3221225472, __60__EKEventDateEditItemAccessibility_editor_didSelectSubitem___block_invoke, &unk_26511E450, self, a4];
  [(EKEventDateEditItemAccessibility *)self _accessibilitySetupDateCellForKey:@"_end"];
}

void __60__EKEventDateEditItemAccessibility_editor_didSelectSubitem___block_invoke(uint64_t a1)
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __60__EKEventDateEditItemAccessibility_editor_didSelectSubitem___block_invoke_2;
  v19 = &unk_26511E400;
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 32);
  v21 = &v23;
  uint64_t v22 = v2;
  AXPerformSafeBlock();
  LOBYTE(v12) = 0;
  id v3 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  objc_super v4 = __UIAccessibilitySafeClass();

  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  id v11 = v4;
  AXPerformSafeBlock();
  uint64_t v5 = v13[3];

  _Block_object_dispose(&v12, 8);
  uint64_t v6 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", v24[3], v5, v10, 3221225472, __60__EKEventDateEditItemAccessibility_editor_didSelectSubitem___block_invoke_3, &unk_26511E428);
  objc_opt_class();
  objc_super v7 = [v11 safeValueForKey:@"tableView"];
  v8 = __UIAccessibilityCastAsClass();

  v9 = [v8 cellForRowAtIndexPath:v6];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v9);

  _Block_object_dispose(&v23, 8);
}

uint64_t __60__EKEventDateEditItemAccessibility_editor_didSelectSubitem___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _rowForSubitem:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __60__EKEventDateEditItemAccessibility_editor_didSelectSubitem___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) tableSectionForEditItem:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_datePickerChanged:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventDateEditItemAccessibility;
  [(EKEventDateEditItemAccessibility *)&v4 _datePickerChanged:a3];
  [(EKEventDateEditItemAccessibility *)self _axUpdateEndDateCellLabel];
}

- (void)_showInlineControls:(int64_t)a3 forSubitem:(int64_t)a4 includingInlineDatePicker:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = [(EKEventDateEditItemAccessibility *)self safeIntegerForKey:@"_selectedSubitem"];
  uint64_t v10 = [(EKEventDateEditItemAccessibility *)self safeIntegerForKey:@"_currentPickerMode"];
  v13.receiver = self;
  v13.super_class = (Class)EKEventDateEditItemAccessibility;
  [(EKEventDateEditItemAccessibility *)&v13 _showInlineControls:a3 forSubitem:a4 includingInlineDatePicker:v5];
  if (v9 != a4 || v10 != a3)
  {
    if (a4 == 1)
    {
      uint64_t v12 = @"_start";
    }
    else
    {
      if (a4 != 2)
      {
LABEL_10:
        UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
        return;
      }
      uint64_t v12 = @"_end";
    }
    [(EKEventDateEditItemAccessibility *)self _accessibilitySetupDateCellForKey:v12];
    goto LABEL_10;
  }
}

- (void)_axUpdateEndDateCellLabel
{
  id v4 = [(EKEventDateEditItemAccessibility *)self safeValueForKey:@"_modernEndDateCell"];
  if ([(EKEventDateEditItemAccessibility *)self safeBoolForKey:@"_endDateIsBeforeStartDate"])
  {
    accessibilityLocalizedString(@"invalid.end.date");
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = &stru_26F6960F0;
  }
  [v4 _accessibilitySetAssignedValue:v3 forKey:@"AXAddendumString"];
}

- (void)_accessibilitySetupDateCellForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 stringByAppendingString:@"DatePickerCell"];
  id v9 = [(EKEventDateEditItemAccessibility *)self safeValueForKey:v5];

  uint64_t v6 = objc_opt_new();
  objc_super v7 = [v4 stringByAppendingString:@"DatePicker"];

  v8 = [(EKEventDateEditItemAccessibility *)self safeValueForKey:v7];
  [v6 axSafelyAddObject:v8];

  [v9 setAccessibilityElements:v6];
}

@end