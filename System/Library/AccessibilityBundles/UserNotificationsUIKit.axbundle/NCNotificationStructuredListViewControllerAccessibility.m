@interface NCNotificationStructuredListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (id)_accessibilityNotificationSummary:(unint64_t)a3;
- (id)_axRequests;
- (unint64_t)_accessibilityNotificationCount;
@end

@implementation NCNotificationStructuredListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationStructuredListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredListViewController", @"listModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredListViewController", @"dismissModalFullScreenAnimated:", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredSectionList", @"listView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredSectionList", @"allNotificationRequests", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRootList", @"incomingSectionList", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListView", @"visibleViews", "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v5 = MEMORY[0x263EF8330];
  AXPerformSafeBlock();
  int v2 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    id v3 = objc_msgSend(MEMORY[0x263F22968], "server", v5, 3221225472, __85__NCNotificationStructuredListViewControllerAccessibility_accessibilityPerformEscape__block_invoke, &unk_2651617D8, self, &v7);
    [v3 hideNotificationCenter];
  }
  return 1;
}

uint64_t __85__NCNotificationStructuredListViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dismissModalFullScreenAnimated:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_accessibilityNotificationSummary:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  v6 = [(NCNotificationStructuredListViewControllerAccessibility *)self safeValueForKey:@"listModel"];
  uint64_t v7 = [v6 safeValueForKey:@"incomingSectionList"];
  v8 = [v7 safeValueForKey:@"listView"];
  uint64_t v9 = [v8 safeDictionaryForKey:@"visibleViews"];

  char v10 = [v9 allKeys];
  v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_9];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __93__NCNotificationStructuredListViewControllerAccessibility__accessibilityNotificationSummary___block_invoke_2;
  v17[3] = &unk_265161958;
  id v18 = v9;
  id v12 = v5;
  id v19 = v12;
  unint64_t v20 = a3;
  id v13 = v9;
  [v11 enumerateObjectsUsingBlock:v17];
  v14 = v19;
  id v15 = v12;

  return v15;
}

uint64_t __93__NCNotificationStructuredListViewControllerAccessibility__accessibilityNotificationSummary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __93__NCNotificationStructuredListViewControllerAccessibility__accessibilityNotificationSummary___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  v8 = [*(id *)(a1 + 32) objectForKey:v7];
  if ([*(id *)(a1 + 40) length]) {
    [*(id *)(a1 + 40) appendString:@", "];
  }
  uint64_t v9 = [v8 accessibilityLabel];
  if (!v9)
  {
    MEMORY[0x2456680B0](@"NCNotificationListView");
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      char v10 = __UIAccessibilityCastAsSafeCategory();
      v11 = [v10 _accessibilityListCell];
      uint64_t v9 = [v11 accessibilityLabel];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  if ([v9 length]) {
    [*(id *)(a1 + 40) appendString:v9];
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12 && a3 + 1 == v12) {
    *a4 = 1;
  }
}

- (unint64_t)_accessibilityNotificationCount
{
  int v2 = [(NCNotificationStructuredListViewControllerAccessibility *)self _axRequests];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)_axRequests
{
  int v2 = [(NCNotificationStructuredListViewControllerAccessibility *)self safeValueForKey:@"listModel"];
  unint64_t v3 = [v2 safeValueForKey:@"incomingSectionList"];
  v4 = [v3 safeArrayForKey:@"allNotificationRequests"];

  id v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_311);

  return v5;
}

uint64_t __70__NCNotificationStructuredListViewControllerAccessibility__axRequests__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = __UIAccessibilitySafeClass();
  v4 = [v3 sectionIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.donotdisturb"];

  return v5 ^ 1u;
}

@end