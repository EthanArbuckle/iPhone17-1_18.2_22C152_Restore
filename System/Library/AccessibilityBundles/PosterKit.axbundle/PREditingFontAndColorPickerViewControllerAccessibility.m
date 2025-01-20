@interface PREditingFontAndColorPickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PREditingFontAndColorPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditingFontAndColorPickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PREditingFontAndColorPickerViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"PREditingFontAndColorPickerViewController" hasProperty:@"numberSystemBarItem" withType:"@"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PREditingFontAndColorPickerViewControllerAccessibility;
  [(PREditingFontAndColorPickerViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PREditingFontAndColorPickerViewControllerAccessibility *)self safeValueForKey:@"numberSystemBarItem"];
  v4 = accessibilityLocalizedString(@"clock.globe.image.label");
  [v3 setAccessibilityLabel:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PREditingFontAndColorPickerViewControllerAccessibility;
  [(PREditingFontAndColorPickerViewControllerAccessibility *)&v3 viewDidAppear:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __72__PREditingFontAndColorPickerViewControllerAccessibility_viewDidAppear___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"numberSystemBarItem"];
  UIAccessibilityPostNotification(v1, v2);
}

@end