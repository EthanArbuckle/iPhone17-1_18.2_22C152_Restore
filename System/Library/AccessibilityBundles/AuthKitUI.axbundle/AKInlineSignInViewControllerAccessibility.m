@interface AKInlineSignInViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation AKInlineSignInViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKInlineSignInViewController";
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
  v2.receiver = self;
  v2.super_class = (Class)AKInlineSignInViewControllerAccessibility;
  [(AKInlineSignInViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AKInlineSignInViewControllerAccessibility;
  [(AKInlineSignInViewControllerAccessibility *)&v3 viewDidLoad];
  [(AKInlineSignInViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end