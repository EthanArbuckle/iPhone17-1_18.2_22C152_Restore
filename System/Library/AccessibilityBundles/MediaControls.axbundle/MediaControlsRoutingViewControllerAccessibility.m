@interface MediaControlsRoutingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation MediaControlsRoutingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsRoutingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPAVRoutingViewController", @"_tableView", "@", 0);
  [v3 validateClass:@"MediaControlsRoutingViewController" isKindOfClass:@"MPAVRoutingViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPAVRoutingViewController", @"viewDidLoad", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsRoutingViewControllerAccessibility;
  [(MediaControlsRoutingViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(MediaControlsRoutingViewControllerAccessibility *)self safeValueForKey:@"_tableView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityContainerType:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsRoutingViewControllerAccessibility;
  [(MediaControlsRoutingViewControllerAccessibility *)&v3 viewDidLoad];
  [(MediaControlsRoutingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end