@interface ProductNoRatingsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ProductNoRatingsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.ProductNoRatingsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(ProductNoRatingsViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityStatusLabel"];
}

@end