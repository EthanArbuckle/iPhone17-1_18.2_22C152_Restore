@interface VideosUI_CanonicalBannerViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (id)accessibilityHeaderElements;
@end

@implementation VideosUI_CanonicalBannerViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.CanonicalBannerViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.CanonicalBannerViewCell" hasProperty:@"accessibilityTitleImageView" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalBannerViewCell" hasProperty:@"accessibilityContentTitleView" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalBannerViewCell" hasProperty:@"accessibilityContentSubtitleView" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalBannerViewCell" hasProperty:@"accessibilityButtonViews" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalBannerViewCell" hasProperty:@"accessibilityEpisodeInfoTextView" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalBannerViewCell" hasProperty:@"accessibilityDescriptionTextView" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalBannerViewCell" hasProperty:@"accessibilityPromoTextView" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalBannerViewCell" hasProperty:@"accessibilityTagsView" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalBannerViewCell" hasProperty:@"accessibilityRolesSummaryView" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalBannerViewCell" hasProperty:@"accessibilityAvailabilityTextView" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalBannerViewCell" hasProperty:@"accessibilityAvailabilityImageView" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalBannerViewCell" hasProperty:@"accessibilityDisclaimerTextView" withType:"@"];
}

- (id)accessibilityElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeValueForKey:@"accessibilityTitleImageView"];
  [v3 axSafelyAddObject:v4];

  v5 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeValueForKey:@"accessibilityContentTitleView"];
  [v3 axSafelyAddObject:v5];

  v6 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeValueForKey:@"accessibilityContentSubtitleView"];
  [v3 axSafelyAddObject:v6];

  v7 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeValueForKey:@"accessibilityButtonViews"];
  [v3 axSafelyAddObject:v7];

  v8 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeValueForKey:@"accessibilityEpisodeInfoTextView"];
  [v3 axSafelyAddObject:v8];

  v9 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeValueForKey:@"accessibilityDescriptionTextView"];
  [v3 axSafelyAddObject:v9];

  v10 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeValueForKey:@"accessibilityPromoTextView"];
  [v3 axSafelyAddObject:v10];

  v11 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeValueForKey:@"accessibilityTagsView"];
  [v3 axSafelyAddObject:v11];

  v12 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeValueForKey:@"accessibilityRolesSummaryView"];
  [v3 axSafelyAddObject:v12];

  v13 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeValueForKey:@"accessibilityAvailabilityTextView"];
  [v3 axSafelyAddObject:v13];

  v14 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeValueForKey:@"accessibilityAvailabilityImageView"];
  [v3 axSafelyAddObject:v14];

  v15 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeValueForKey:@"accessibilityDisclaimerTextView"];
  [v3 axSafelyAddObject:v15];

  return v3;
}

- (id)accessibilityHeaderElements
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeUIViewForKey:@"accessibilityTitleImageView"];
  v5 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeUIViewForKey:@"accessibilityContentTitleView"];
  v6 = [(VideosUI_CanonicalBannerViewCellAccessibility *)self safeUIViewForKey:@"accessibilityContentSubtitleView"];
  v7 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 3, v4, v5, v6);

  return v7;
}

@end