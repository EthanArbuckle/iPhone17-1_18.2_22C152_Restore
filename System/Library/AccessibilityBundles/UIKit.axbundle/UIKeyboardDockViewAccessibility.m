@interface UIKeyboardDockViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilitySupplementaryHeaderViews;
- (unint64_t)accessibilityTraits;
@end

@implementation UIKeyboardDockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardDockView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIKeyboardDockView";
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"rightDockItem", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardDockItem", @"view", v4, 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F813E8];
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)[MEMORY[0x263EFF980] array];
  id v3 = v7[0];
  id v5 = (id)[(UIKeyboardDockViewAccessibility *)v8 safeValueForKey:@"leftDockItem"];
  id v4 = (id)[v5 safeUIViewForKey:@"view"];
  objc_msgSend(v3, "axSafelyAddObject:");

  objc_msgSend(v7[0], "ax_removeObjectsFromArrayUsingBlock:", &__block_literal_global_22);
  id v6 = v7[0];
  objc_storeStrong(v7, 0);

  return v6;
}

uint64_t __73__UIKeyboardDockViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  int v3 = [location[0] isAccessibilityElement] ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)[MEMORY[0x263EFF980] array];
  id v3 = v7[0];
  id v5 = (id)[(UIKeyboardDockViewAccessibility *)v8 safeValueForKey:@"rightDockItem"];
  id v4 = (id)[v5 safeUIViewForKey:@"view"];
  objc_msgSend(v3, "axSafelyAddObject:");

  objc_msgSend(v7[0], "ax_removeObjectsFromArrayUsingBlock:", &__block_literal_global_287);
  id v6 = v7[0];
  objc_storeStrong(v7, 0);

  return v6;
}

uint64_t __73__UIKeyboardDockViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  int v3 = [location[0] isAccessibilityElement] ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

@end