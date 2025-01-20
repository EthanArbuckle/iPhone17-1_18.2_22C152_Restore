@interface IOSFloatingControlsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateButtons;
- (void)viewDidLoad;
@end

@implementation IOSFloatingControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"IOSFloatingControlsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FloatingControlsViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"IOSFloatingControlsViewController" hasInstanceVariable:@"_mode2DButton" withType:"UIButton"];
}

- (void)_axAnnotateButtons
{
  id v3 = [(IOSFloatingControlsViewControllerAccessibility *)self safeValueForKey:@"_mode2DButton"];
  v2 = AXMapsLocString(@"2D_BUTTON");
  [v3 setAccessibilityLabel:v2];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)IOSFloatingControlsViewControllerAccessibility;
  [(IOSFloatingControlsViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(IOSFloatingControlsViewControllerAccessibility *)self _axAnnotateButtons];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)IOSFloatingControlsViewControllerAccessibility;
  [(IOSFloatingControlsViewControllerAccessibility *)&v3 viewDidLoad];
  [(IOSFloatingControlsViewControllerAccessibility *)self _axAnnotateButtons];
}

@end