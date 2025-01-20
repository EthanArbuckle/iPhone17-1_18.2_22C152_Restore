@interface COSFeatureHighlightRowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation COSFeatureHighlightRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSFeatureHighlightRowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSFeatureHighlightRowView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSFeatureHighlightRowView", @"body", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(COSFeatureHighlightRowViewAccessibility *)self safeValueForKey:@"title"];
  v4 = [v3 accessibilityLabel];
  v5 = [(COSFeatureHighlightRowViewAccessibility *)self safeValueForKey:@"body"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end