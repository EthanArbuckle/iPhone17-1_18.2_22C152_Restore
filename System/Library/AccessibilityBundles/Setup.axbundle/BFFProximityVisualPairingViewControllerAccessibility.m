@interface BFFProximityVisualPairingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation BFFProximityVisualPairingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BFFProximityVisualPairingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BFFProximityVisualPairingViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BFFProximityVisualPairingViewController", @"visualPairingView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)BFFProximityVisualPairingViewControllerAccessibility;
  [(BFFProximityVisualPairingViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BFFProximityVisualPairingViewControllerAccessibility *)self safeUIViewForKey:@"visualPairingView"];
  [v3 setIsAccessibilityElement:1];
  v4 = accessibilityLocalizedString(@"pairing.video.description");
  [v3 setAccessibilityLabel:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BFFProximityVisualPairingViewControllerAccessibility;
  [(BFFProximityVisualPairingViewControllerAccessibility *)&v3 viewDidLoad];
  [(BFFProximityVisualPairingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end