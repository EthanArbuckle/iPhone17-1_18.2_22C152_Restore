@interface SiriAcousticIdHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SiriAcousticIdHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriAcousticIdHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SiriAcousticIdHeaderView" hasInstanceVariable:@"_openButton" withType:"SKUIItemOfferButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriAcousticIdHeaderView", @"songTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriAcousticIdHeaderView", @"artistString", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SiriAcousticIdHeaderViewAccessibility *)self safeValueForKey:@"songTitle"];
  v6 = [(SiriAcousticIdHeaderViewAccessibility *)self safeValueForKey:@"artistString"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)accessibilityHint
{
  id v3 = [(SiriAcousticIdHeaderViewAccessibility *)self safeValueForKey:@"_openButton"];
  v4 = [v3 superview];

  if (v4)
  {
    v5 = accessibilityLocalizedString(@"buy.button.hint");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SiriAcousticIdHeaderViewAccessibility;
    v5 = [(SiriAcousticIdHeaderViewAccessibility *)&v7 accessibilityHint];
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(SiriAcousticIdHeaderViewAccessibility *)self safeValueForKey:@"_openButton"];
  id v3 = [v2 superview];

  v4 = (unint64_t *)MEMORY[0x263F1CF18];
  if (v3) {
    v4 = (unint64_t *)MEMORY[0x263F1CEE8];
  }
  return *v4;
}

@end