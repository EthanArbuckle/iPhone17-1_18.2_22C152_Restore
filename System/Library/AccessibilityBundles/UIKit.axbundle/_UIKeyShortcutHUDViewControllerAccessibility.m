@interface _UIKeyShortcutHUDViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)setHidden:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation _UIKeyShortcutHUDViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIKeyShortcutHUDViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIKeyShortcutHUDViewController";
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"toolbarVC", v4, 0);
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"setHidden:completionHandler:", "B", "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIKeyShortcutHUDToolbarViewController", @"searchButton", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIKeyShortcutHUDServer", @"_dismissHUD", v5, 0);
  objc_storeStrong(v7, v6);
}

- (BOOL)accessibilityPerformEscape
{
  v8[2] = self;
  v8[1] = (id)a2;
  char v7 = 0;
  id v3 = (id)[(_UIKeyShortcutHUDViewControllerAccessibility *)self safeValueForKey:@"delegate"];
  id v6 = (id)__UIAccessibilitySafeClass();

  id v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  id v4 = v5;
  AXPerformSafeBlock();
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v8, 0);
  return 1;
}

- (void)setHidden:(BOOL)a3 completionHandler:(id)a4
{
  v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v4 = v17;
  BOOL v5 = v15;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  v10 = __76___UIKeyShortcutHUDViewControllerAccessibility_setHidden_completionHandler___block_invoke;
  v11 = &unk_2650AE2A0;
  id v12 = location;
  BOOL v13 = v15;
  v6.receiver = v4;
  v6.super_class = (Class)_UIKeyShortcutHUDViewControllerAccessibility;
  -[_UIKeyShortcutHUDViewControllerAccessibility setHidden:completionHandler:](&v6, sel_setHidden_completionHandler_, v5);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
}

@end