@interface WFTableViewFooterLinkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityInternalTextLinks;
- (id)_axFooterViewTextView;
- (id)accessibilityLabel;
@end

@implementation WFTableViewFooterLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFTableViewFooterLinkView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(WFTableViewFooterLinkViewAccessibility *)self _axFooterViewTextView];
  v3 = [v2 accessibilityValue];

  return v3;
}

- (id)_accessibilityInternalTextLinks
{
  v2 = [(WFTableViewFooterLinkViewAccessibility *)self _axFooterViewTextView];
  v3 = [v2 _accessibilityInternalTextLinks];

  return v3;
}

- (id)_axFooterViewTextView
{
  uint64_t v3 = objc_opt_class();

  return (id)[(WFTableViewFooterLinkViewAccessibility *)self _accessibilityDescendantOfType:v3];
}

@end