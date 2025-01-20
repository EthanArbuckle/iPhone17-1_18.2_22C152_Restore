@interface _UIKeyShortcutHUDWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsIsolatedWindow;
- (BOOL)accessibilityViewIsModal;
- (void)makeKeyAndVisible;
@end

@implementation _UIKeyShortcutHUDWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIKeyShortcutHUDWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)makeKeyAndVisible
{
  v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)_UIKeyShortcutHUDWindowAccessibility;
  [(_UIKeyShortcutHUDWindowAccessibility *)&v8 makeKeyAndVisible];
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  v5 = __57___UIKeyShortcutHUDWindowAccessibility_makeKeyAndVisible__block_invoke;
  v6 = &unk_2650ADF18;
  v7 = v10;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v7, 0);
}

@end