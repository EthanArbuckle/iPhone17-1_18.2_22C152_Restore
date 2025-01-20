@interface PRAmbientEditingTitledViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation PRAmbientEditingTitledViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRAmbientEditingTitledViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PRAmbientEditingTitledViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRAmbientEditingTitledViewController", @"accessibilityTitleLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PRAmbientEditingTitledViewControllerAccessibility;
  [(PRAmbientEditingTitledViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PRAmbientEditingTitledViewControllerAccessibility *)self accessibilityTitleLabel];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)PRAmbientEditingTitledViewControllerAccessibility;
  [(PRAmbientEditingTitledViewControllerAccessibility *)&v3 loadView];
  [(PRAmbientEditingTitledViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end