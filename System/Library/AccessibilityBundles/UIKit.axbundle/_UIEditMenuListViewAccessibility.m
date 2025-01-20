@interface _UIEditMenuListViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_reloadMenuAnimated:(BOOL)a3;
@end

@implementation _UIEditMenuListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIEditMenuListView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIEditMenuListView", @"_reloadMenuAnimated:", "v", "B", 0);
  objc_storeStrong(v4, obj);
}

- (void)_reloadMenuAnimated:(BOOL)a3
{
  v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIEditMenuListViewAccessibility;
  [(_UIEditMenuListViewAccessibility *)&v9 _reloadMenuAnimated:a3];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  v6 = __56___UIEditMenuListViewAccessibility__reloadMenuAnimated___block_invoke;
  v7 = &unk_2650ADF18;
  v8 = v12;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v8, 0);
}

@end