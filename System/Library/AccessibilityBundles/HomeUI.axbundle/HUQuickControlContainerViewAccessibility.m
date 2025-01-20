@interface HUQuickControlContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation HUQuickControlContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlContainerView", @"detailsButton", "@", 0);
  [v3 validateClass:@"HUQuickControlContainerView" isKindOfClass:@"UIView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlContainerViewAccessibility;
  [(HUQuickControlContainerViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilityHomeUILocalizedString(@"settings.button");
  v4 = [(HUQuickControlContainerViewAccessibility *)self safeUIViewForKey:@"detailsButton"];
  [v4 setAccessibilityLabel:v3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlContainerViewAccessibility;
  [(HUQuickControlContainerViewAccessibility *)&v3 layoutSubviews];
  [(HUQuickControlContainerViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end