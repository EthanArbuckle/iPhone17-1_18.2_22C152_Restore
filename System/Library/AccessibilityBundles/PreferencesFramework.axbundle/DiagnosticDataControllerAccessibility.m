@interface DiagnosticDataControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidLoad;
@end

@implementation DiagnosticDataControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DiagnosticDataController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DiagnosticDataController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"DiagnosticDataController" isKindOfClass:@"UINavigationController"];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)DiagnosticDataControllerAccessibility;
  [(DiagnosticDataControllerAccessibility *)&v4 viewDidLoad];
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 navigationItem];
  [v3 _accessibilityLoadAccessibilityInformation];
}

@end