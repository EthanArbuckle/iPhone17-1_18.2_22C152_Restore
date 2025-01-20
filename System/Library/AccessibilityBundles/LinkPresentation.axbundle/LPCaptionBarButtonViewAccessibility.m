@interface LPCaptionBarButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityConfigure;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)configureMenuButton:(id)a3;
- (void)configurePillButton:(id)a3;
@end

@implementation LPCaptionBarButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LPCaptionBarButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"LPCaptionBarButtonView" hasInstanceVariable:@"_button" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPCaptionBarButtonView", @"configurePillButton:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPCaptionBarButtonView", @"configureMenuButton:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)LPCaptionBarButtonViewAccessibility;
  [(LPCaptionBarButtonViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(LPCaptionBarButtonViewAccessibility *)self _accessibilityConfigure];
}

- (void)configurePillButton:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LPCaptionBarButtonViewAccessibility;
  [(LPCaptionBarButtonViewAccessibility *)&v4 configurePillButton:a3];
  [(LPCaptionBarButtonViewAccessibility *)self _accessibilityConfigure];
}

- (void)configureMenuButton:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LPCaptionBarButtonViewAccessibility;
  [(LPCaptionBarButtonViewAccessibility *)&v4 configureMenuButton:a3];
  [(LPCaptionBarButtonViewAccessibility *)self _accessibilityConfigure];
}

- (void)_accessibilityConfigure
{
  objc_opt_class();
  objc_super v3 = [(LPCaptionBarButtonViewAccessibility *)self safeValueForKey:@"_button"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    v5 = [v4 accessibilityLabel];
    int v6 = [v5 isEqualToString:@"person.2.fill"];

    if (v6)
    {
      v7 = accessibilityLocalizedString(@"caption.bar.collaborate.button");
      [v4 setAccessibilityLabel:v7];
    }
  }
}

@end