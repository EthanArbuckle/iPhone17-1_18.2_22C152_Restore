@interface HUBannerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (int64_t)_accessibilitySortPriority;
- (unint64_t)accessibilityTraits;
@end

@implementation HUBannerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUBannerCollectionViewCell";
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

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v8.receiver = self;
  v8.super_class = (Class)HUBannerCollectionViewCellAccessibility;
  v4 = [(HUBannerCollectionViewCellAccessibility *)&v8 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(HUBannerCollectionViewCellAccessibility *)self safeValueForKeyPath:@"bannerView.footerViewLabel"];
  [v5 setIsAccessibilityElement:1];
  v7.receiver = self;
  v7.super_class = (Class)HUBannerCollectionViewCellAccessibility;
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x263F1CEE8] | -[HUBannerCollectionViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits));
  [v3 axSafelyAddObject:v5];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(HUBannerCollectionViewCellAccessibility *)self safeValueForKeyPath:@"bannerView.titleLabel"];
  v4 = [(HUBannerCollectionViewCellAccessibility *)self safeValueForKeyPath:@"bannerView.descriptionLabel"];
  v5 = [v3 accessibilityLabel];
  objc_super v8 = [v4 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HUBannerCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HUBannerCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

@end