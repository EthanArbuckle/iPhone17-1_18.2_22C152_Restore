@interface ENUIRegionalDetailsHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityImageView;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)commonInit;
@end

@implementation ENUIRegionalDetailsHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ENUIRegionalDetailsHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUIRegionalDetailsHeaderCell", @"subtitleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUIRegionalDetailsHeaderCell", @"headerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExposureNotificationUI.OnboardingHeaderView", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExposureNotificationUI.OnboardingHeaderView", @"header", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExposureNotificationUI.ENUIPublicHealthHeader", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUIRegionalDetailsHeaderCell", @"commonInit", "v", 0);
}

- (id)accessibilityElements
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(ENUIRegionalDetailsHeaderCellAccessibility *)self _accessibilityImageView];
  v5 = [(ENUIRegionalDetailsHeaderCellAccessibility *)self safeValueForKey:@"subtitleText"];
  v6 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)ENUIRegionalDetailsHeaderCellAccessibility;
  [(ENUIRegionalDetailsHeaderCellAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ENUIRegionalDetailsHeaderCellAccessibility *)self _accessibilityImageView];
  v4 = [(ENUIRegionalDetailsHeaderCellAccessibility *)self safeValueForKeyPath:@"headerView.header.title"];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityLabel:v4];
  v5 = [(ENUIRegionalDetailsHeaderCellAccessibility *)self safeValueForKey:@"subtitleText"];
  [v5 setIsAccessibilityElement:1];
}

- (void)commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)ENUIRegionalDetailsHeaderCellAccessibility;
  [(ENUIRegionalDetailsHeaderCellAccessibility *)&v3 commonInit];
  [(ENUIRegionalDetailsHeaderCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_accessibilityImageView
{
  return (id)[(ENUIRegionalDetailsHeaderCellAccessibility *)self safeValueForKeyPath:@"headerView.imageView"];
}

@end