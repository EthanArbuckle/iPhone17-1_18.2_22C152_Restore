@interface PUSlideshowViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateAirplayButton;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PUSlideshowViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUSlideshowViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUSlideshowViewController", @"_updateAirplayButton", "v", 0);
  [v3 validateClass:@"PUSlideshowViewController" isKindOfClass:@"UIViewController"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowViewControllerAccessibility;
  [(PUSlideshowViewControllerAccessibility *)&v3 viewDidAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)_updateAirplayButton
{
  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowViewControllerAccessibility;
  [(PUSlideshowViewControllerAccessibility *)&v6 _updateAirplayButton];
  objc_super v3 = [(PUSlideshowViewControllerAccessibility *)self safeValueForKey:@"navigationItem"];
  v4 = accessibilityUIKitLocalizedString();
  v5 = [v3 rightBarButtonItem];
  [v5 setAccessibilityLabel:v4];
}

@end