@interface MessageListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)shelfButtonItem;
- (unint64_t)_axGetTriageActionForAnnouncement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetCategoryButtonsTrait;
- (void)_axSetTriageActionForAnnouncement:(unint64_t)a3;
- (void)_updateBackButtonImageWithCount:(unint64_t)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MessageListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MessageListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUIMessageListViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"_updateBackButtonImageWithCount:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"scene", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"_updateToolbarButtons", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"shelfButtonItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailMainScene", @"splitViewController", "@", 0);
  [v3 validateClass:@"MessageListViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"filterButtonItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"filterPickerControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailboxFilterBarButtonItem", @"isFilterEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListContainerViewController", @"isEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"mf_navigationItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListContainerViewController", @"messageListViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUIMessageListViewController", @"bucketsViewController", "@", 0);
  [v3 validateClass:@"MailUI.BucketsViewController" hasSwiftField:@"collectionView" withSwiftType:"Optional<UICollectionView>"];
}

- (unint64_t)_axGetTriageActionForAnnouncement
{
  return MEMORY[0x270F09668](self, &__MessageListViewControllerAccessibility___axGetTriageActionForAnnouncement);
}

- (void)_axSetTriageActionForAnnouncement:(unint64_t)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)MessageListViewControllerAccessibility;
  [(MessageListViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  location[1] = (id)MEMORY[0x263EF8330];
  location[2] = (id)3221225472;
  location[3] = __84__MessageListViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  location[4] = &unk_2651331B8;
  location[5] = self;
  AXPerformSafeBlock();
  id v3 = [(MessageListViewControllerAccessibility *)self safeValueForKey:@"filterButtonItem"];
  objc_initWeak(location, v3);
  objc_initWeak(&from, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __84__MessageListViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v4[3] = &unk_265133678;
  objc_copyWeak(&v5, &from);
  objc_copyWeak(&v6, location);
  [v3 _setAccessibilityLabelBlock:v4];
  [(MessageListViewControllerAccessibility *)self _axSetCategoryButtonsTrait];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

uint64_t __84__MessageListViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateToolbarButtons];
}

id __84__MessageListViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  v1 = a1;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v3 = [WeakRetained safeValueForKey:@"filterPickerControl"];

  v4 = [v3 safeValueForKey:@"filtersLabel"];
  id v5 = [v4 accessibilityLabel];

  v1 += 5;
  id v6 = objc_loadWeakRetained(v1);
  int v7 = [v6 safeBoolForKey:@"_filterEnabled"];

  id v8 = objc_loadWeakRetained(v1);
  if (v7)
  {
    objc_super v9 = accessibilityLocalizedString(@"toggle.filtering.on");
    [v8 setAccessibilityValue:v9];

    v10 = NSString;
    v11 = accessibilityLocalizedString(@"toggle.filtering.choose");
    v12 = objc_msgSend(v10, "stringWithFormat:", v11, v5);
  }
  else
  {
    v13 = accessibilityLocalizedString(@"toggle.filtering.off");
    [v8 setAccessibilityValue:v13];

    v12 = accessibilityLocalizedString(@"toggle.filtering");
  }

  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MessageListViewControllerAccessibility;
  [(MessageListViewControllerAccessibility *)&v6 viewWillAppear:a3];
  v4 = accessibilityLocalizedString(@"mail.message.list.name");
  id v5 = [(MessageListViewControllerAccessibility *)self safeUIViewForKey:@"collectionView"];
  [v5 setAccessibilityLabel:v4];
}

- (void)_updateBackButtonImageWithCount:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MessageListViewControllerAccessibility;
  -[MessageListViewControllerAccessibility _updateBackButtonImageWithCount:](&v14, sel__updateBackButtonImageWithCount_);
  objc_opt_class();
  id v5 = [(MessageListViewControllerAccessibility *)self safeValueForKey:@"mf_navigationItem"];
  objc_super v6 = __UIAccessibilityCastAsClass();

  uint64_t v7 = [v6 title];
  id v8 = (void *)v7;
  if (a3 && v7)
  {
    objc_super v9 = NSString;
    v10 = accessibilityLocalizedString(@"unread.count");
    v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, a3);

    v12 = __AXStringForVariables();
    v13 = objc_msgSend(v6, "backBarButtonItem", v11, @"__AXStringForVariablesSentinel");
    [v13 setAccessibilityLabel:v12];
  }
  else
  {
    v11 = [v6 backBarButtonItem];
    [v11 setAccessibilityLabel:0];
  }
}

- (id)shelfButtonItem
{
  v5.receiver = self;
  v5.super_class = (Class)MessageListViewControllerAccessibility;
  v2 = [(MessageListViewControllerAccessibility *)&v5 shelfButtonItem];
  id v3 = accessibilityLocalizedString(@"app.shelf.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (void)_axSetCategoryButtonsTrait
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  char v19 = 0;
  objc_opt_class();
  id v3 = [(MessageListViewControllerAccessibility *)self safeValueForKey:@"delegate"];
  v4 = [v3 safeValueForKey:@"messageListViewController"];
  objc_super v5 = [v4 safeValueForKey:@"bucketsViewController"];
  objc_super v6 = [v5 safeSwiftValueForKey:@"collectionView"];
  uint64_t v7 = __UIAccessibilityCastAsClass();

  id v8 = [v7 subviews];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __68__MessageListViewControllerAccessibility__axSetCategoryButtonsTrait__block_invoke;
        v14[3] = &unk_2651336A0;
        v14[4] = self;
        [v13 setAccessibilityTraitsBlock:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v10);
  }
}

uint64_t __68__MessageListViewControllerAccessibility__axSetCategoryButtonsTrait__block_invoke()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  char v6 = 0;
  AXPerformSafeBlock();
  int v0 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v3, 8);
  uint64_t v1 = *MEMORY[0x263F1CF20];
  if (!v0) {
    uint64_t v1 = 0;
  }
  return *MEMORY[0x263F1CEE8] | v1;
}

uint64_t __68__MessageListViewControllerAccessibility__axSetCategoryButtonsTrait__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEditing];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end