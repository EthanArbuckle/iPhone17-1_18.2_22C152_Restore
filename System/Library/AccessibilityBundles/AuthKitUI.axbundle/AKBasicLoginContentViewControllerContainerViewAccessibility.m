@interface AKBasicLoginContentViewControllerContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (AKBasicLoginContentViewControllerContainerViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AKBasicLoginContentViewControllerContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKBasicLoginContentViewControllerContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginContentViewControllerContainerViewAccessibility;
  [(AKBasicLoginContentViewControllerContainerViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(AKBasicLoginContentViewControllerContainerViewAccessibility *)self safeValueForKey:@"_bannerView"];
  [v3 setIsAccessibilityElement:1];
  v4 = accessibilityLocalizedString(@"appleid.label");
  [v3 setAccessibilityLabel:v4];

  [v3 setAccessibilityTraits:*MEMORY[0x263F1CF00]];
}

- (AKBasicLoginContentViewControllerContainerViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginContentViewControllerContainerViewAccessibility;
  v3 = -[AKBasicLoginContentViewControllerContainerViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AKBasicLoginContentViewControllerContainerViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end