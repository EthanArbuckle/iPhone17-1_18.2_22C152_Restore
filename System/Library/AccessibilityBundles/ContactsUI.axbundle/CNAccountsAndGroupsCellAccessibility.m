@interface CNAccountsAndGroupsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsEditing;
- (BOOL)_axIsPlaceholderCell;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySafeDelegate;
- (id)_accessibilitySafeItem;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)beginEditingName;
@end

@implementation CNAccountsAndGroupsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNAccountsAndGroupsCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAccountsAndGroupsCell", @"item", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAccountsAndGroupsCell", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAccountsAndGroupsCell", @"titleTextView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAccountsAndGroupsCell", @"beginEditingName", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAccountsAndGroupsItem", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAccountsAndGroupsItem", @"contactCountString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAccountsAndGroupsItem", @"identifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAccountsAndGroupsViewController", @"isCollectionViewEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAccountsAndGroupsViewController", @"actionsProvider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAccountsAndGroupsActionsProvider", @"actionsForItem:cell:", "@", "@", "@", 0);
}

- (id)accessibilityValue
{
  if ([(CNAccountsAndGroupsCellAccessibility *)self _axIsPlaceholderCell]
    || [(CNAccountsAndGroupsCellAccessibility *)self _axIsEditing])
  {
    id v3 = [(CNAccountsAndGroupsCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
    uint64_t v4 = [v3 accessibilityValue];
  }
  else
  {
    id v3 = [(CNAccountsAndGroupsCellAccessibility *)self _accessibilitySafeItem];
    uint64_t v4 = [v3 safeValueForKey:@"contactCountString"];
  }
  v5 = (void *)v4;

  return v5;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)[(CNAccountsAndGroupsCellAccessibility *)self safeValueForKey:@"titleTextView"];
}

- (id)_accessibilitySafeDelegate
{
  return (id)[(CNAccountsAndGroupsCellAccessibility *)self safeValueForKey:@"delegate"];
}

- (id)_accessibilitySafeItem
{
  return (id)[(CNAccountsAndGroupsCellAccessibility *)self safeValueForKey:@"item"];
}

- (BOOL)isAccessibilityElement
{
  if ([(CNAccountsAndGroupsCellAccessibility *)self _axIsEditing])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v4 = [(CNAccountsAndGroupsCellAccessibility *)self _accessibilitySafeDelegate];
    int v3 = [v4 safeBoolForKey:@"isCollectionViewEditing"] ^ 1;
  }
  return v3;
}

- (BOOL)_axIsEditing
{
  objc_opt_class();
  int v3 = [(CNAccountsAndGroupsCellAccessibility *)self safeValueForKey:@"titleTextView"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  char v5 = [v4 isEditing];
  return v5;
}

- (BOOL)_axIsPlaceholderCell
{
  v2 = [(CNAccountsAndGroupsCellAccessibility *)self _accessibilitySafeItem];
  int v3 = [v2 safeValueForKey:@"identifier"];
  char v4 = [v3 isEqualToString:@"groupPlaceholderIdentifier"];

  return v4;
}

- (id)accessibilityLabel
{
  if ([(CNAccountsAndGroupsCellAccessibility *)self _axIsPlaceholderCell])
  {
    int v3 = @"list.name";
LABEL_5:
    char v4 = accessibilityLocalizedString(v3);
    goto LABEL_7;
  }
  if ([(CNAccountsAndGroupsCellAccessibility *)self _axIsEditing])
  {
    int v3 = @"contact.name.for.editing";
    goto LABEL_5;
  }
  char v5 = [(CNAccountsAndGroupsCellAccessibility *)self _accessibilitySafeItem];
  char v4 = [v5 safeValueForKey:@"name"];

LABEL_7:

  return v4;
}

- (unint64_t)accessibilityTraits
{
  if (![(CNAccountsAndGroupsCellAccessibility *)self _axIsPlaceholderCell]
    && ![(CNAccountsAndGroupsCellAccessibility *)self _axIsEditing])
  {
    return *MEMORY[0x263F1CEE8];
  }
  int v3 = [(CNAccountsAndGroupsCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  [v3 accessibilityTraits];

  _AXTraitsRemoveTrait();

  return _AXTraitsRemoveTrait();
}

- (void)beginEditingName
{
  v7.receiver = self;
  v7.super_class = (Class)CNAccountsAndGroupsCellAccessibility;
  [(CNAccountsAndGroupsCellAccessibility *)&v7 beginEditingName];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  char v4 = accessibilityLocalizedString(@"editing.contact.format");
  char v5 = [(CNAccountsAndGroupsCellAccessibility *)self accessibilityValue];
  v6 = AXCFormattedString();
  UIAccessibilityPostNotification(v3, v6);
}

- (id)accessibilityCustomActions
{
  if ([(CNAccountsAndGroupsCellAccessibility *)self _axIsEditing])
  {
    UIAccessibilityNotifications v3 = 0;
  }
  else
  {
    char v4 = [(CNAccountsAndGroupsCellAccessibility *)self _accessibilitySafeDelegate];
    char v5 = [v4 safeValueForKey:@"actionsProvider"];

    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__0;
    v13 = __Block_byref_object_dispose__0;
    id v14 = 0;
    id v8 = v5;
    AXPerformSafeBlock();
    id v6 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
    UIAccessibilityNotifications v3 = objc_msgSend(v6, "ax_mappedArrayUsingBlock:", &__block_literal_global_1);
  }

  return v3;
}

void __66__CNAccountsAndGroupsCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) _accessibilitySafeItem];
  uint64_t v3 = [v2 actionsForItem:v6 cell:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __66__CNAccountsAndGroupsCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x263F1C390]);
  uint64_t v4 = [v2 title];
  char v5 = [v2 image];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__CNAccountsAndGroupsCellAccessibility_accessibilityCustomActions__block_invoke_3;
  v9[3] = &unk_265117FB8;
  id v10 = v2;
  id v6 = v2;
  objc_super v7 = (void *)[v3 initWithName:v4 image:v5 actionHandler:v9];

  return v7;
}

uint64_t __66__CNAccountsAndGroupsCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __66__CNAccountsAndGroupsCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWithSender:0 target:0];
}

@end