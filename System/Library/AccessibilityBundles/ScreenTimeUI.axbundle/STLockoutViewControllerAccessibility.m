@interface STLockoutViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation STLockoutViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STLockoutViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)STLockoutViewControllerAccessibility;
  [(STLockoutViewControllerAccessibility *)&v3 viewDidLoad];
  [(STLockoutViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)STLockoutViewControllerAccessibility;
  [(STLockoutViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CEF8];
  v4 = [(STLockoutViewControllerAccessibility *)self safeUIViewForKey:@"titleLabel"];
  [v4 setAccessibilityTraits:v3];
}

@end