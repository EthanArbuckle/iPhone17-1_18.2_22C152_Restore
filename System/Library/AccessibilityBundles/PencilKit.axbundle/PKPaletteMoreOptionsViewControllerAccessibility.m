@interface PKPaletteMoreOptionsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPaletteMoreOptionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteMoreOptionsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaletteMoreOptionsViewControllerAccessibility;
  [(PKPaletteMoreOptionsViewControllerAccessibility *)&v5 viewDidLoad];
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
  v4 = [v2 view];
  UIAccessibilityPostNotification(v3, v4);
}

@end