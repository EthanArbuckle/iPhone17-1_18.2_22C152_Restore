@interface HULegibilityLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
@end

@implementation HULegibilityLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HULegibilityLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  if ([(HULegibilityLabelAccessibility *)self _accessibilityBoolValueForKey:AXHomeUIUseAccessibilityFrameForHitTest])return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)HULegibilityLabelAccessibility;
  return [(HULegibilityLabelAccessibility *)&v4 _accessibilityUseAccessibilityFrameForHittest];
}

@end