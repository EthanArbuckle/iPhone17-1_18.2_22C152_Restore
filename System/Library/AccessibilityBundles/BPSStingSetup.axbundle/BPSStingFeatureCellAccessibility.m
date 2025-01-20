@interface BPSStingFeatureCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation BPSStingFeatureCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BPSStingFeatureCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BPSStingFeatureCell" hasProperty:@"titleLabel" withType:"@"];
  [v3 validateClass:@"BPSStingFeatureCell" hasProperty:@"subtitleLabel" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(BPSStingFeatureCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v6 = [(BPSStingFeatureCellAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end