@interface HUBannerTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation HUBannerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUBannerTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUBannerCollectionViewCell", @"bannerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUBannerView", @"footerViewLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUBannerView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUBannerView", @"descriptionLabel", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(HUBannerTableViewCellAccessibility *)self safeValueForKeyPath:@"bannerView.titleLabel"];
  v4 = [(HUBannerTableViewCellAccessibility *)self safeValueForKeyPath:@"bannerView.descriptionLabel"];
  v5 = [v3 accessibilityLabel];
  v8 = [v4 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v7.receiver = self;
  v7.super_class = (Class)HUBannerTableViewCellAccessibility;
  v4 = [(HUBannerTableViewCellAccessibility *)&v7 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(HUBannerTableViewCellAccessibility *)self safeValueForKeyPath:@"bannerView.footerViewLabel"];
  [v3 axSafelyAddObject:v5];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end