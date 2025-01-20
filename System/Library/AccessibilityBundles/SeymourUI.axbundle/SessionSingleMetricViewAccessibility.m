@interface SessionSingleMetricViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SessionSingleMetricViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.SessionSingleMetricView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = [(SessionSingleMetricViewAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
  v3 = [v2 stringByReplacingOccurrencesOfString:@"," withString:&stru_26F7B5DB0];
  v4 = [v3 localizedLowercaseString];

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SessionSingleMetricViewAccessibility;
  return *MEMORY[0x263F1CF68] | [(SessionSingleMetricViewAccessibility *)&v3 accessibilityTraits];
}

@end