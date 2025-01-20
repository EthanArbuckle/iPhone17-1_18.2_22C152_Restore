@interface PublisherHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PublisherHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PublisherHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PublisherHeaderView", @"publisherLogoImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PublisherHeaderView", @"attribution", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)PublisherHeaderViewAccessibility;
  [(PublisherHeaderViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PublisherHeaderViewAccessibility *)self safeValueForKey:@"publisherLogoImageView"];
  [v3 setIsAccessibilityElement:1];
  v4 = [(PublisherHeaderViewAccessibility *)self safeValueForKey:@"attribution"];
  v6 = AXPublisherDescriptionForAttribution(v4, v5);

  [v3 setAccessibilityLabel:v6];
}

@end