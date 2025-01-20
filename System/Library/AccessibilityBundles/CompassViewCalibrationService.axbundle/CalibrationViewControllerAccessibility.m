@interface CalibrationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidLoad;
@end

@implementation CalibrationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CalibrationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CalibrationViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"CalibrationViewController" hasInstanceVariable:@"_instructionLabel" withType:"UILabel"];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CalibrationViewControllerAccessibility;
  [(CalibrationViewControllerAccessibility *)&v2 viewDidLoad];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __53__CalibrationViewControllerAccessibility_viewDidLoad__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CDC8];
  id v3 = [*(id *)(a1 + 32) safeValueForKey:@"_instructionLabel"];
  objc_super v2 = [v3 accessibilityLabel];
  UIAccessibilityPostNotification(v1, v2);
}

@end