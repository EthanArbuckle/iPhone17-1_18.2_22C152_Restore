@interface DOCSidebarViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation DOCSidebarViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SaveToFiles.DOCSidebarViewController";
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
  v4.super_class = (Class)DOCSidebarViewControllerAccessibility;
  [(DOCSidebarViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(DOCSidebarViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v3 setAccessibilityIdentifier:@"Browse View"];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)DOCSidebarViewControllerAccessibility;
  [(DOCSidebarViewControllerAccessibility *)&v3 viewDidLoad];
  [(DOCSidebarViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end