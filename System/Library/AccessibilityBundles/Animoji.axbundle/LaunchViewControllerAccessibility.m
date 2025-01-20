@interface LaunchViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation LaunchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LaunchViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LaunchViewController", @"videoController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LaunchViewController", @"bottomVideoController", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)LaunchViewControllerAccessibility;
  [(LaunchViewControllerAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(LaunchViewControllerAccessibility *)self safeValueForKey:@"videoController"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 view];

  [v5 setIsAccessibilityElement:1];
  v6 = accessibilityJellyfishLocalizedString(@"splash.video");
  [v5 setAccessibilityLabel:v6];

  objc_opt_class();
  v7 = [(LaunchViewControllerAccessibility *)self safeValueForKey:@"bottomVideoController"];
  v8 = __UIAccessibilityCastAsClass();

  v9 = [v8 view];

  [v9 setIsAccessibilityElement:1];
  v10 = accessibilityJellyfishLocalizedString(@"splash.bottom.video");
  [v9 setAccessibilityLabel:v10];

  v11 = [(LaunchViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v11 setAccessibilityViewIsModal:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LaunchViewControllerAccessibility;
  [(LaunchViewControllerAccessibility *)&v3 viewDidLoad];
  [(LaunchViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end