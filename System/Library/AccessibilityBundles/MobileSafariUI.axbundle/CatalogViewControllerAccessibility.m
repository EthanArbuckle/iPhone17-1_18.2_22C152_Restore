@interface CatalogViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axAnnounceTimer;
- (void)_accessibilityAnnounceNewKeyboardCompletionWithPreviousIndexPath:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetAnnounceTimer:(id)a3;
- (void)_axUpdateAccessibilityElements;
- (void)_setShowingCompletions:(BOOL)a3 popoverDismissalReason:(int64_t)a4 completionHandler:(id)a5;
- (void)completionList:(id)a3 topHitDidBecomeReadyForString:(id)a4;
- (void)showUniversalSearchFirstTimeExperienceIfNotShowing;
- (void)unifiedField:(id)a3 moveCompletionSelectionByRowOffset:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CatalogViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CatalogViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CatalogViewController", @"unifiedField:moveCompletionSelectionByRowOffset:", "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CatalogViewController", @"completionList: topHitDidBecomeReadyForString:", "v", "@", "@", 0);
  [v3 validateClass:@"CatalogViewController" hasInstanceVariable:@"_completionsViewController" withType:"CompletionListTableViewController"];
  [v3 validateClass:@"CompletionListTableViewController" isKindOfClass:@"UITableViewController"];
  [v3 validateClass:@"CatalogViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CompletionListTableViewController" isKindOfClass:@"UITableViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"traitCollection", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CatalogViewController", @"usesPopoverStyleForFavorites", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CatalogViewController", @"navigationBar", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CatalogViewController", @"universalSearchFirstTimeExperienceViewController", "@", 0);
  objc_opt_class();
  [v3 validateClass:@"CatalogViewController" hasInstanceVariable:@"_keyboardFrame" withType:__ax_verbose_encode_with_type_encoding_group_class()];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CatalogViewController", @"isShowingUniversalSearchFirstTimeExperience", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CatalogViewController", @"isShowingCompletions", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CatalogViewController", @"_setShowingCompletions:popoverDismissalReason:completionHandler:", "v", "B", "q", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CatalogViewController", @"showUniversalSearchFirstTimeExperienceIfNotShowing", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AbstractCatalogViewController", @"startPageViewController", "@", 0);
  [v3 validateClass:@"CatalogViewController" isKindOfClass:@"AbstractCatalogViewController"];
  [v3 validateClass:@"SFStartPageViewController" hasInstanceVariable:@"_navigationController" withType:"UINavigationController"];
  [v3 validateClass:@"BrowserController" hasInstanceVariable:@"_scrollView" withType:"UIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CatalogViewController", @"browserController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CatalogViewController", @"setNavigationBar:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CatalogViewControllerAccessibility;
  [(CatalogViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CatalogViewControllerAccessibility *)self _axUpdateAccessibilityElements];
}

- (void)_axUpdateAccessibilityElements
{
  LOBYTE(location) = 0;
  objc_super v3 = __UIAccessibilitySafeClass();
  v4 = [v3 traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  if (v5 == 1
    && ([(CatalogViewControllerAccessibility *)self safeBoolForKey:@"usesPopoverStyleForFavorites"] & 1) == 0)
  {
    objc_initWeak(&location, self);
    v6 = [(CatalogViewControllerAccessibility *)self safeValueForKey:@"browserController"];
    v7 = [v6 safeUIViewForKey:@"_scrollView"];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __68__CatalogViewControllerAccessibility__axUpdateAccessibilityElements__block_invoke;
    v18[3] = &unk_265136ED0;
    objc_copyWeak(&v19, &location);
    [v7 _setAccessibilityElementsHiddenBlock:v18];

    objc_opt_class();
    v8 = __UIAccessibilityCastAsClass();
    v9 = [v8 view];

    char v17 = 0;
    objc_opt_class();
    v10 = [(CatalogViewControllerAccessibility *)self safeValueForKey:@"_completionsViewController"];
    v11 = __UIAccessibilityCastAsClass();

    v12 = [v11 tableView];

    [(CatalogViewControllerAccessibility *)self safeCGRectForKey:@"_keyboardFrame"];
    objc_msgSend(v12, "_accessibilitySetVisibleContentInset:", 0.0, 0.0, CGRectGetHeight(v21), 0.0);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__CatalogViewControllerAccessibility__axUpdateAccessibilityElements__block_invoke_2;
    v14[3] = &unk_265136EF8;
    objc_copyWeak(&v16, &location);
    id v13 = v12;
    id v15 = v13;
    [v9 _setAccessibilityElementsBlock:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

BOOL __68__CatalogViewControllerAccessibility__axUpdateAccessibilityElements__block_invoke(uint64_t a1)
{
  if (AXDoesRequestingClientDeserveAutomation()) {
    return 0;
  }
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = __UIAccessibilitySafeClass();

  uint64_t v5 = [v4 traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];

  if (v6 != 1) {
    return 0;
  }
  id v7 = objc_loadWeakRetained(v2);
  char v8 = [v7 safeBoolForKey:@"usesPopoverStyleForFavorites"];

  if (v8) {
    return 0;
  }
  id v10 = objc_loadWeakRetained(v2);
  v11 = [v10 safeValueForKey:@"browserController"];
  uint64_t v12 = [v11 safeIntegerForKey:@"favoritesState"];

  return (unint64_t)(v12 - 1) < 2;
}

id __68__CatalogViewControllerAccessibility__axUpdateAccessibilityElements__block_invoke_2(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF980]) init];
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained safeValueForKey:@"_startPageViewController"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  uint64_t v6 = [v5 safeValueForKey:@"_navigationController"];
  id v7 = __UIAccessibilityCastAsClass();

  char v8 = [v5 view];
  objc_opt_class();
  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = [v9 safeValueForKey:@"universalSearchFirstTimeExperienceViewController"];
  v11 = __UIAccessibilityCastAsClass();

  uint64_t v12 = [v11 view];

  id v13 = objc_loadWeakRetained((id *)(a1 + 40));
  LOBYTE(v9) = [v13 safeBoolForKey:@"isShowingUniversalSearchFirstTimeExperience"];

  v14 = v12;
  if ((v9 & 1) == 0)
  {
    id v15 = objc_loadWeakRetained((id *)(a1 + 40));
    int v16 = [v15 safeBoolForKey:@"isShowingCompletions"];

    v14 = v8;
    if (v16)
    {
      char v17 = objc_msgSend(v7, "navigationBar", v8);
      [v2 axSafelyAddObject:v17];

      v14 = *(void **)(a1 + 32);
    }
  }
  [v2 axSafelyAddObject:v14];

  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CatalogViewControllerAccessibility;
  [(CatalogViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(CatalogViewControllerAccessibility *)self _axUpdateAccessibilityElements];
}

- (void)showUniversalSearchFirstTimeExperienceIfNotShowing
{
  v3.receiver = self;
  v3.super_class = (Class)CatalogViewControllerAccessibility;
  [(CatalogViewControllerAccessibility *)&v3 showUniversalSearchFirstTimeExperienceIfNotShowing];
  [(CatalogViewControllerAccessibility *)self _axUpdateAccessibilityElements];
}

- (void)_setShowingCompletions:(BOOL)a3 popoverDismissalReason:(int64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  char v9 = [(CatalogViewControllerAccessibility *)self safeBoolForKey:@"isShowingCompletions"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __102__CatalogViewControllerAccessibility__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke;
  v17[3] = &unk_265136F20;
  BOOL v18 = v9 ^ v6;
  v17[4] = self;
  id v10 = (void *)MEMORY[0x245656660](v17);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __102__CatalogViewControllerAccessibility__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke_2;
  v14[3] = &unk_265136F48;
  id v15 = v8;
  id v16 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CatalogViewControllerAccessibility;
  id v11 = v10;
  id v12 = v8;
  [(CatalogViewControllerAccessibility *)&v13 _setShowingCompletions:v6 popoverDismissalReason:a4 completionHandler:v14];
}

uint64_t __102__CatalogViewControllerAccessibility__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _axUpdateAccessibilityElements];
  }
  return result;
}

uint64_t __102__CatalogViewControllerAccessibility__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)unifiedField:(id)a3 moveCompletionSelectionByRowOffset:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CatalogViewControllerAccessibility *)self safeValueForKey:@"_completionsViewController"];
  id v8 = [v7 safeValueForKey:@"tableView"];

  char v9 = [v8 indexPathForSelectedRow];
  v10.receiver = self;
  v10.super_class = (Class)CatalogViewControllerAccessibility;
  [(CatalogViewControllerAccessibility *)&v10 unifiedField:v6 moveCompletionSelectionByRowOffset:a4];

  [(CatalogViewControllerAccessibility *)self _accessibilityAnnounceNewKeyboardCompletionWithPreviousIndexPath:v9];
}

- (id)_axAnnounceTimer
{
}

- (void)_axSetAnnounceTimer:(id)a3
{
}

- (void)completionList:(id)a3 topHitDidBecomeReadyForString:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CatalogViewControllerAccessibility;
  [(CatalogViewControllerAccessibility *)&v8 completionList:a3 topHitDidBecomeReadyForString:a4];
  uint64_t v5 = [(CatalogViewControllerAccessibility *)self _axAnnounceTimer];
  [v5 cancel];
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F22868]);
    uint64_t v5 = (void *)[v6 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [(CatalogViewControllerAccessibility *)self _axSetAnnounceTimer:v5];
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__CatalogViewControllerAccessibility_completionList_topHitDidBecomeReadyForString___block_invoke;
  v7[3] = &unk_265136F70;
  v7[4] = self;
  [v5 afterDelay:v7 processBlock:1.0];
}

uint64_t __83__CatalogViewControllerAccessibility_completionList_topHitDidBecomeReadyForString___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _accessibilityAnnounceNewKeyboardCompletionWithPreviousIndexPath:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _axSetAnnounceTimer:0];
}

- (void)_accessibilityAnnounceNewKeyboardCompletionWithPreviousIndexPath:(id)a3
{
  id v23 = a3;
  objc_super v4 = [(CatalogViewControllerAccessibility *)self safeValueForKey:@"_completionsViewController"];
  uint64_t v5 = [v4 safeValueForKey:@"tableView"];

  id v6 = [v5 indexPathForSelectedRow];
  if ([v6 row] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [(CatalogViewControllerAccessibility *)self safeValueForKey:@"_completionsViewController"];
    objc_super v8 = [v7 safeValueForKey:@"tableView"];

    char v9 = [v8 indexPathForSelectedRow];
    objc_super v10 = [v8 cellForRowAtIndexPath:v9];
    uint64_t v11 = [v23 section];
    v22 = v8;
    if (v11 == [v9 section])
    {
      id v12 = 0;
    }
    else
    {
      objc_super v13 = objc_msgSend(v8, "headerViewForSection:", objc_msgSend(v9, "section"));
      id v14 = objc_alloc(MEMORY[0x263F21660]);
      id v15 = [v13 accessibilityLabel];
      id v12 = (void *)[v14 initWithString:v15];

      [v12 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F217D8]];
    }
    if ([v10 isAccessibilityElement])
    {
      id v16 = [v10 accessibilityLabel];
    }
    else if ([v10 accessibilityElementCount] < 1)
    {
      id v16 = 0;
    }
    else
    {
      uint64_t v17 = 0;
      BOOL v18 = 0;
      do
      {
        CGRect v21 = [v10 accessibilityElementAtIndex:v17];
        id v16 = __UIAXStringForVariables();

        ++v17;
        BOOL v18 = v16;
      }
      while (v17 < objc_msgSend(v10, "accessibilityElementCount", v21, @"__AXStringForVariablesSentinel", v22));
    }
    UIAccessibilityNotifications v19 = *MEMORY[0x263F1CDC8];
    v20 = __UIAXStringForVariables();
    UIAccessibilityPostNotification(v19, v20);
  }
}

@end