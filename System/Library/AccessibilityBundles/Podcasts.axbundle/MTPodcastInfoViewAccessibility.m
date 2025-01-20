@interface MTPodcastInfoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MTPodcastInfoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTPodcastInfoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTPodcastInfoView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTPodcastInfoView", @"authorLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTPodcastInfoView", @"descriptionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMExpandingLabel", @"text", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MTPodcastInfoViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [(MTPodcastInfoViewAccessibility *)self safeValueForKey:@"authorLabel"];
  v5 = [(MTPodcastInfoViewAccessibility *)self safeValueForKey:@"descriptionView"];
  v8 = [v5 safeValueForKey:@"text"];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end