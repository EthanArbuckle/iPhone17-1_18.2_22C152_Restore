@interface MailboxTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityMailboxUsesUnreadCount;
- (BOOL)accessibilityPerformEscape;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityScannerActivateBehavior;
- (unint64_t)accessibilityTraits;
- (void)_setUnreadCount:(unint64_t)a3;
- (void)setDetailsDisclosureButton:(id)a3;
@end

@implementation MailboxTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MailboxTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailboxTableCell", @"_setUnreadCount:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_accessibilityClearChildren", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailboxTableCell", @"isExpandable", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailboxTableCell", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailboxPickerOutlineController", @"scene", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailMainScene", @"splitViewController", "@", 0);
  [v3 validateClass:@"UIDimmingView"];
  [v3 validateClass:@"MailSplitViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"MailboxTableCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailboxPickerOutlineController", @"favoritesManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailboxPickerOutlineController", @"collectionHelper", "@", 0);
  [v3 validateClass:@"MailboxPickerOutlineController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FavoriteItem", @"representingMailbox", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailboxPickerCollectionHelper", @"favoriteItemAtIndexPath:", "@", "@", 0);
}

- (void)setDetailsDisclosureButton:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MailboxTableCellAccessibility;
  id v4 = a3;
  [(MailboxTableCellAccessibility *)&v9 setDetailsDisclosureButton:v4];
  v5 = NSString;
  v6 = accessibilityLocalizedString(@"more.info.for.mail.cell");
  v7 = [(MailboxTableCellAccessibility *)self accessibilityLabel];
  v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  [v4 setAccessibilityLabel:v8];
}

- (void)_setUnreadCount:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MailboxTableCellAccessibility;
  [(MailboxTableCellAccessibility *)&v5 _setUnreadCount:a3];
  id v4 = (id)[(MailboxTableCellAccessibility *)self safeValueForKey:@"_accessibilityClearChildren"];
}

- (BOOL)_accessibilityMailboxUsesUnreadCount
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2;
  v11[4] = __Block_byref_object_dispose__2;
  id v12 = 0;
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  objc_super v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  AXPerformSafeBlock();
  uint64_t v2 = [(id)v6[5] type];
  char v3 = 0;
  if ((unint64_t)(v2 - 5) >= 2 && (unint64_t)(v2 - 105) >= 2)
  {
    NSClassFromString(&cfstr_FavoriteitemSh.isa);
    char v3 = objc_opt_isKindOfClass() ^ 1;
  }
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(v11, 8);
  return v3 & 1;
}

void __69__MailboxTableCellAccessibility__accessibilityMailboxUsesUnreadCount__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  if (v2)
  {
    char v3 = [*(id *)(a1 + 32) _accessibilityFindAncestor:&__block_literal_global_8 startWithSelf:1];
    id v4 = [v3 _accessibilityViewController];

    uint64_t v5 = [v2 indexPathForCell:*(void *)(a1 + 32)];
    v6 = [v4 safeValueForKey:@"collectionHelper"];
    uint64_t v7 = [v6 favoriteItemAtIndexPath:v5];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    objc_super v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    objc_opt_class();
    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) safeValueForKey:@"representingMailbox"];
    uint64_t v11 = __UIAccessibilityCastAsClass();

    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

uint64_t __69__MailboxTableCellAccessibility__accessibilityMailboxUsesUnreadCount__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Mailboxpickero_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  char v3 = [(MailboxTableCellAccessibility *)self safeValueForKey:@"_textLabel"];
  id v4 = [v3 accessibilityLabel];
  uint64_t v5 = [(MailboxTableCellAccessibility *)self safeValueForKey:@"_detailTextLabel"];
  uint64_t v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)accessibilityValue
{
  char v3 = [(MailboxTableCellAccessibility *)self safeValueForKey:@"_unreadCountLabel"];
  id v4 = [v3 accessibilityLabel];
  uint64_t v5 = [v4 integerValue];

  BOOL v6 = [(MailboxTableCellAccessibility *)self _accessibilityMailboxUsesUnreadCount];
  if (v5 < 1)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v7 = NSString;
    if (v6) {
      uint64_t v8 = @"unread.count";
    }
    else {
      uint64_t v8 = @"num.messages";
    }
    objc_super v9 = accessibilityLocalizedString(v8);
    id v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, v5);
  }
  if ([(MailboxTableCellAccessibility *)self safeBoolForKey:@"isExpandable"])
  {
    if ([(MailboxTableCellAccessibility *)self safeBoolForKey:@"isExpanded"]) {
      uint64_t v11 = @"mailbox.cell.expanded";
    }
    else {
      uint64_t v11 = @"mailbox.cell.collapsed";
    }
    uint64_t v12 = accessibilityLocalizedString(v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  v13 = __UIAXStringForVariables();

  return v13;
}

- (unint64_t)accessibilityTraits
{
  v12.receiver = self;
  v12.super_class = (Class)MailboxTableCellAccessibility;
  unint64_t v3 = [(MailboxTableCellAccessibility *)&v12 accessibilityTraits];
  objc_opt_class();
  id v4 = __UIAccessibilityCastAsClass();
  uint64_t v5 = [v4 tintAdjustmentMode];
  uint64_t v6 = *MEMORY[0x263F1CF20];
  if (v5 != 2) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v6 | v3;
  if ([v4 isSelected] && objc_msgSend(v4, "isEditing")) {
    v7 |= *MEMORY[0x263F1CF38];
  }
  int v8 = [(MailboxTableCellAccessibility *)self safeBoolForKey:@"isExpandable"];
  uint64_t v9 = *MEMORY[0x263F1CEF8];
  if (!v8) {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v9 | v7;

  return v10;
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  if ([(MailboxTableCellAccessibility *)self isEditing]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)MailboxTableCellAccessibility;
  return [(MailboxTableCellAccessibility *)&v4 _accessibilityScannerActivateBehavior];
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v2 = [(MailboxTableCellAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_373 startWithSelf:1];
  unint64_t v3 = [v2 _accessibilityViewController];

  objc_opt_class();
  objc_super v4 = [v3 safeValueForKeyPath:@"scene.splitViewController"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v6 = [v5 view];
  unint64_t v7 = [v6 subviews];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__MailboxTableCellAccessibility_accessibilityPerformEscape__block_invoke_2;
  v9[3] = &unk_265133558;
  v9[4] = &v10;
  [v7 enumerateObjectsUsingBlock:v9];

  LOBYTE(v6) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v6;
}

uint64_t __59__MailboxTableCellAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Mailboxpickero_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __59__MailboxTableCellAccessibility_accessibilityPerformEscape__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  NSClassFromString(&cfstr_Uidimmingview.isa);
  if (objc_opt_isKindOfClass())
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    [v6 accessibilityActivate];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

@end