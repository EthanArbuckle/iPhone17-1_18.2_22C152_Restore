@interface CSModalPresentationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CSModalPresentationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSModalPresentationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CSModalPresentationViewControllerAccessibility;
  [(CSModalPresentationViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(CSModalPresentationViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v3 _setAccessibilityViewIsModalBlock:&__block_literal_global_393];
}

uint64_t __92__CSModalPresentationViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CSModalPresentationViewControllerAccessibility;
  [(CSModalPresentationViewControllerAccessibility *)&v3 viewDidLoad];
  [(CSModalPresentationViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end