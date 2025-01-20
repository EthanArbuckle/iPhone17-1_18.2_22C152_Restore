@interface BookmarksTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUnhideSearchBar;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation BookmarksTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BookmarksTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BookmarksTableViewController" isKindOfClass:@"UITableViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BookmarksTableViewController", @"_bookmarkAtIndexPath:", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebBookmark", @"isFolder", "B", 0);
  [v3 validateClass:@"BookmarksTableViewController" hasInstanceVariable:@"_searchBar" withType:"UISearchBar"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)BookmarksTableViewControllerAccessibility;
  [(BookmarksTableViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(BookmarksTableViewControllerAccessibility *)self _axUnhideSearchBar];
}

- (void)_axUnhideSearchBar
{
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 tableView];

  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    v5 = [(BookmarksTableViewControllerAccessibility *)self safeValueForKey:@"_searchBar"];

    if (v5) {
      objc_msgSend(v4, "setContentInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    }
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BookmarksTableViewControllerAccessibility;
  [(BookmarksTableViewControllerAccessibility *)&v3 viewDidLoad];
  [(BookmarksTableViewControllerAccessibility *)self _axUnhideSearchBar];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)BookmarksTableViewControllerAccessibility;
  v8 = [(BookmarksTableViewControllerAccessibility *)&v23 tableView:v6 cellForRowAtIndexPath:v7];
  if ([v7 section] == 2)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    id v22 = 0;
    id v16 = v7;
    AXPerformSafeBlock();
    id v9 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
    int v10 = [v9 safeBoolForKey:@"isFolder"];

    if (v10)
    {
      v11 = [v8 safeValueForKey:@"textLabel"];
      v12 = [v11 safeValueForKey:@"text"];
      v13 = accessibilityLocalizedString(@"bookmark.folder");
      v14 = __UIAXStringForVariables();
      objc_msgSend(v8, "setAccessibilityLabel:", v14, v13, @"__AXStringForVariablesSentinel");
    }
  }

  return v8;
}

uint64_t __77__BookmarksTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _bookmarkAtIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)BookmarksTableViewControllerAccessibility;
  id v7 = a5;
  id v8 = a3;
  [(BookmarksTableViewControllerAccessibility *)&v11 tableView:v8 moveRowAtIndexPath:a4 toIndexPath:v7];
  id v9 = objc_msgSend(v8, "cellForRowAtIndexPath:", v7, v11.receiver, v11.super_class);

  int v10 = [v9 _accessibilityFindDescendant:&__block_literal_global_1];
  if (v10) {
    UIAccessibilityPostNotification(*MEMORY[0x263F812F8], v10);
  }
}

BOOL __86__BookmarksTableViewControllerAccessibility_tableView_moveRowAtIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Uitableviewcel.isa);
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && ([v2 _accessibilityViewIsVisible] & 1) != 0;

  return v3;
}

@end