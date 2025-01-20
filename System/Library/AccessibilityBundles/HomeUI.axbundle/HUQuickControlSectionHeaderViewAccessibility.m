@interface HUQuickControlSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HUQuickControlSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSectionHeaderView", @"titleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSectionHeaderView", @"attributedTitleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSectionHeaderView", @"accessoryButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(HUQuickControlSectionHeaderViewAccessibility *)self safeValueForKey:@"attributedTitleText"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 string];

  if (![v5 length])
  {
    uint64_t v6 = [(HUQuickControlSectionHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleText"];

    v5 = (void *)v6;
  }

  return v5;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(HUQuickControlSectionHeaderViewAccessibility *)self safeUIViewForKey:@"accessoryButton"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

@end