@interface PKFeatureOnBoardingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation PKFeatureOnBoardingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKFeatureOnBoardingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKFeatureOnBoardingViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"PKFeatureOnBoardingViewController" hasInstanceVariable:@"_featureIdentifier" withType:"Q"];
  [v3 validateClass:@"PKFeatureOnBoardingViewController" isKindOfClass:@"PKExplanationViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKExplanationViewController", @"explanationView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)PKFeatureOnBoardingViewControllerAccessibility;
  [(PKFeatureOnBoardingViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  if ([(PKFeatureOnBoardingViewControllerAccessibility *)self safeIntegerForKey:@"featureIdentifier"] == 2)
  {
    id v3 = [(PKFeatureOnBoardingViewControllerAccessibility *)self safeUIViewForKey:@"explanationView"];
    v4 = [v3 safeValueForKey:@"titleImage"];
    v5 = accessibilityLocalizedString(@"apple.card");
    [v4 setAccessibilityLabel:v5];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKFeatureOnBoardingViewControllerAccessibility;
  [(PKFeatureOnBoardingViewControllerAccessibility *)&v3 viewDidLoad];
  [(PKFeatureOnBoardingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end