@interface InfoCardViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateTitle;
- (void)viewDidLoad;
@end

@implementation InfoCardViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"InfoCardViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"InfoCardViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"InfoCardViewController", @"titleHeaderView", "@", 0);
  [v3 validateClass:@"Maps.InfoCardHeaderView" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
}

- (void)_axAnnotateTitle
{
  v2 = [(InfoCardViewControllerAccessibility *)self safeValueForKey:@"titleHeaderView"];
  id v4 = [v2 safeSwiftValueForKey:@"titleLabel"];

  uint64_t v3 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v3];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)InfoCardViewControllerAccessibility;
  [(InfoCardViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(InfoCardViewControllerAccessibility *)self _axAnnotateTitle];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)InfoCardViewControllerAccessibility;
  [(InfoCardViewControllerAccessibility *)&v3 viewDidLoad];
  [(InfoCardViewControllerAccessibility *)self _axAnnotateTitle];
}

@end