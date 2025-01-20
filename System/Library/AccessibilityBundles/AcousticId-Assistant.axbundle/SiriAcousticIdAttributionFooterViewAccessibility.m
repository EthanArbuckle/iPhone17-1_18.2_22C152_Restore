@interface SiriAcousticIdAttributionFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SiriAcousticIdAttributionFooterViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SiriAcousticIdAttributionFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriAcousticIdAttributionFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriAcousticIdAttributionFooterView", @"attributionButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriAcousticIdAttributionFooterView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)SiriAcousticIdAttributionFooterViewAccessibility;
  [(SiriAcousticIdAttributionFooterViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SiriAcousticIdAttributionFooterViewAccessibility *)self safeValueForKey:@"attributionButton"];
  v4 = accessibilityLocalizedString(@"attribution.button.title");
  [v3 setAccessibilityLabel:v4];

  v5 = accessibilityLocalizedString(@"attribution.button.hint");
  [v3 setAccessibilityHint:v5];
}

- (SiriAcousticIdAttributionFooterViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriAcousticIdAttributionFooterViewAccessibility;
  id v3 = -[SiriAcousticIdAttributionFooterViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SiriAcousticIdAttributionFooterViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end