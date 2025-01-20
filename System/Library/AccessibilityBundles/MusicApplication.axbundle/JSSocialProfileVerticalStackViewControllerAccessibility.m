@interface JSSocialProfileVerticalStackViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation JSSocialProfileVerticalStackViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.JSSocialProfileVerticalStackViewController";
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
  v6.receiver = self;
  v6.super_class = (Class)JSSocialProfileVerticalStackViewControllerAccessibility;
  [(JSSocialProfileVerticalStackViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  v3 = [(JSSocialProfileVerticalStackViewControllerAccessibility *)self navigationItem];
  v4 = [v3 rightBarButtonItem];
  v5 = accessibilityMusicLocalizedString(@"more.button");
  [v4 setAccessibilityLabel:v5];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)JSSocialProfileVerticalStackViewControllerAccessibility;
  [(JSSocialProfileVerticalStackViewControllerAccessibility *)&v3 viewDidLoad];
  [(JSSocialProfileVerticalStackViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end