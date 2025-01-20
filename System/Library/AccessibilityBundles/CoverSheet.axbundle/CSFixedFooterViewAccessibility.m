@interface CSFixedFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation CSFixedFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSFixedFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CSFixedFooterView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSFixedFooterView", @"callToActionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSFixedFooterView", @"alternateCallToActionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSFixedFooterView", @"statusTextView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CSFixedFooterViewAccessibility;
  [(CSFixedFooterViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CSFixedFooterViewAccessibility *)self safeUIViewForKey:@"callToActionLabel"];
  [v3 setAccessibilityRespondsToUserInteraction:0];
  v4 = [(CSFixedFooterViewAccessibility *)self safeUIViewForKey:@"alternateCallToActionLabel"];
  [v4 setAccessibilityRespondsToUserInteraction:0];
  v5 = [(CSFixedFooterViewAccessibility *)self safeUIViewForKey:@"statusTextView"];
  [v5 setAccessibilityRespondsToUserInteraction:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSFixedFooterViewAccessibility;
  [(CSFixedFooterViewAccessibility *)&v3 layoutSubviews];
  [(CSFixedFooterViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end