@interface BPSSetupPageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateTitleLabel;
- (void)viewDidLoad;
@end

@implementation BPSSetupPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BPSSetupPageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BPSSetupPageViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BPSSetupPageViewController", @"updateTitleLabel", "v", 0);
  [v3 validateClass:@"BPSSetupPageViewController" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)BPSSetupPageViewControllerAccessibility;
  [(BPSSetupPageViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BPSSetupPageViewControllerAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];

  v4 = [(BPSSetupPageViewControllerAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v4 _setAccessibilityServesAsFirstElement:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BPSSetupPageViewControllerAccessibility;
  [(BPSSetupPageViewControllerAccessibility *)&v3 viewDidLoad];
  [(BPSSetupPageViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)updateTitleLabel
{
  v3.receiver = self;
  v3.super_class = (Class)BPSSetupPageViewControllerAccessibility;
  [(BPSSetupPageViewControllerAccessibility *)&v3 updateTitleLabel];
  [(BPSSetupPageViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end