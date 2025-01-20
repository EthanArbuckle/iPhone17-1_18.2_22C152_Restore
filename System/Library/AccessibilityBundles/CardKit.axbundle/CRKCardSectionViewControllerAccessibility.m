@interface CRKCardSectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setupCardSectionButtons;
- (void)viewDidLayoutSubviews;
@end

@implementation CRKCardSectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CRKCardSectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CRKCardSectionViewController", @"_setupCardSectionButtons", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CRKCardSectionViewController", @"viewDidLayoutSubviews", "v", 0);
  [v3 validateClass:@"CRKCardSectionViewController" hasInstanceVariable:@"_overlayButton" withType:"CRKOverlayButton"];
  [v3 validateClass:@"CRKCardSectionViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)CRKCardSectionViewControllerAccessibility;
  [(CRKCardSectionViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CRKCardSectionViewControllerAccessibility *)self safeValueForKey:@"_overlayButton"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(CRKCardSectionViewControllerAccessibility *)self safeValueForKey:@"_overlayButton"];
  LODWORD(v3) = [v4 _accessibilityViewIsVisible];

  v5 = [(CRKCardSectionViewControllerAccessibility *)self safeValueForKey:@"viewIfLoaded"];
  v6 = v5;
  if (v3) {
    uint64_t v7 = *MEMORY[0x263F1CEE8];
  }
  else {
    uint64_t v7 = 0;
  }
  [v5 setAccessibilityTraits:v7];
}

- (void)_setupCardSectionButtons
{
  v3.receiver = self;
  v3.super_class = (Class)CRKCardSectionViewControllerAccessibility;
  [(CRKCardSectionViewControllerAccessibility *)&v3 _setupCardSectionButtons];
  [(CRKCardSectionViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CRKCardSectionViewControllerAccessibility;
  [(CRKCardSectionViewControllerAccessibility *)&v3 viewDidLayoutSubviews];
  [(CRKCardSectionViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end