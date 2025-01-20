@interface VUIFavoriteBannerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VUIFavoriteBannerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIFavoriteBannerCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIFavoriteBannerCollectionViewCell" hasProperty:@"bannerView" withType:"@"];
  [v3 validateClass:@"VUIFavoriteBannerView" hasProperty:@"titleLabel" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(VUIFavoriteBannerCollectionViewCellAccessibility *)self safeValueForKey:@"bannerView"];
  objc_opt_class();
  id v3 = [v2 safeValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 accessibilityLabel];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VUIFavoriteBannerCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(VUIFavoriteBannerCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"sports.button.favorites.hint");
}

@end