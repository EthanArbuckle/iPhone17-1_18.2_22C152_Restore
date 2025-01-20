@interface UIActivityContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_configureHeaderViewIfNeeded;
- (void)viewDidLoad;
@end

@implementation UIActivityContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIActivityContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIActivityContentViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"navigationItem", "@", 0);
  [v3 validateClass:@"UIActivityContentViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIActivityContentViewController", @"headerLinkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIActivityContentViewController", @"_configureHeaderViewIfNeeded", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)UIActivityContentViewControllerAccessibility;
  [(UIActivityContentViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(UIActivityContentViewControllerAccessibility *)self safeValueForKey:@"navigationItem"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 rightBarButtonItem];
  v6 = accessibilityLocalizedString(@"sharing.close");
  [v5 setAccessibilityLabel:v6];

  v7 = [(UIActivityContentViewControllerAccessibility *)self safeValueForKey:@"headerLinkView"];
  [v7 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)UIActivityContentViewControllerAccessibility;
  [(UIActivityContentViewControllerAccessibility *)&v3 viewDidLoad];
  [(UIActivityContentViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_configureHeaderViewIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)UIActivityContentViewControllerAccessibility;
  [(UIActivityContentViewControllerAccessibility *)&v3 _configureHeaderViewIfNeeded];
  [(UIActivityContentViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end