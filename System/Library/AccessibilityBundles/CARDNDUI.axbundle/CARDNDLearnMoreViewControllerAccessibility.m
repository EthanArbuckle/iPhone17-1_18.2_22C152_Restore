@interface CARDNDLearnMoreViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CARDNDLearnMoreViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CARDNDLearnMoreViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_CARLearnMoreViewController"];
  [v3 validateClass:@"CARDNDLearnMoreViewController" isKindOfClass:@"_CARLearnMoreViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_CARLearnMoreViewController", @"textView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CARDNDLearnMoreViewControllerAccessibility;
  [(CARDNDLearnMoreViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(CARDNDLearnMoreViewControllerAccessibility *)self safeValueForKey:@"textView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 _accessibilitySetTextViewShouldBreakUpParagraphs:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CARDNDLearnMoreViewControllerAccessibility;
  [(CARDNDLearnMoreViewControllerAccessibility *)&v3 viewDidLoad];
  [(CARDNDLearnMoreViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end