@interface QRCodeOverlayViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation QRCodeOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicCoreUI.QRCodeOverlayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MusicCoreUI.QRCodeOverlayViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"MusicCoreUI.QRCodeOverlayViewController" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"MusicCoreUI.QRCodeOverlayViewController" hasSwiftField:@"subtitleLabel" withSwiftType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.QRCodeOverlayViewController", @"dismissAnimated", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  char v9 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 view];

  v5 = [(QRCodeOverlayViewControllerAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  [v5 setAccessibilityActivateBlock:&__block_literal_global_0];
  v6 = [(QRCodeOverlayViewControllerAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  [v6 setAccessibilityActivateBlock:&__block_literal_global_288];
  v7 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v5, v6);
  [v4 setAccessibilityElements:v7];
  v8.receiver = self;
  v8.super_class = (Class)QRCodeOverlayViewControllerAccessibility;
  [(QRCodeOverlayViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
}

uint64_t __86__QRCodeOverlayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

uint64_t __86__QRCodeOverlayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QRCodeOverlayViewControllerAccessibility;
  [(QRCodeOverlayViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(QRCodeOverlayViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

uint64_t __70__QRCodeOverlayViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAnimated];
}

@end