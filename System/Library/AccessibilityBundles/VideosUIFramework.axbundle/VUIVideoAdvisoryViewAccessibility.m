@interface VUIVideoAdvisoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation VUIVideoAdvisoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIVideoAdvisoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIVideoAdvisoryView", @"legendViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIVideoAdvisoryView", @"_configureSubviewsWithDictionary:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIVideoAdvisoryView", @"showAnimated:platterView:completion:", "v", "B", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIVideoAdvisoryView", @"hideAnimated:platterView:completion:", "v", "B", "@", "@?", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"advisories.title");
}

- (id)accessibilityValue
{
  v2 = [(VUIVideoAdvisoryViewAccessibility *)self safeArrayForKey:@"legendViews"];
  id v3 = AXLabelForElements();

  return v3;
}

@end