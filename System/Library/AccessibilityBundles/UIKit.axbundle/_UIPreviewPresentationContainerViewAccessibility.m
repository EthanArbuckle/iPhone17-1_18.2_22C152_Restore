@interface _UIPreviewPresentationContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
- (id)accessibilityElements;
@end

@implementation _UIPreviewPresentationContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIPreviewPresentationContainerView";
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
  v3 = @"_UIPreviewPresentationContainerView";
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"contentView", v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)accessibilityElements
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)[MEMORY[0x263EFF980] array];
  id v3 = v8[0];
  id v4 = (id)[(_UIPreviewPresentationContainerViewAccessibility *)v9 safeValueForKey:@"platterView"];
  objc_msgSend(v3, "axSafelyAddObject:");

  id v5 = v8[0];
  id v6 = (id)[(_UIPreviewPresentationContainerViewAccessibility *)v9 safeValueForKey:@"contentView"];
  objc_msgSend(v5, "axSafelyAddObject:");

  id v7 = v8[0];
  objc_storeStrong(v8, 0);

  return v7;
}

- (BOOL)accessibilityPerformEscape
{
  UIAccessibilityPostNotification(*MEMORY[0x263F812A8], MEMORY[0x263EFFA80]);
  AXPerformBlockOnMainThreadAfterDelay();
  id v3 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"accessibilityDismissActionSheet" object:0];

  return 1;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end