@interface NowPlayingEpisodeUpsellBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
@end

@implementation NowPlayingEpisodeUpsellBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NowPlayingUI.NowPlayingEpisodeUpsellBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NowPlayingUI.NowPlayingEpisodeUpsellBannerView" isKindOfClass:@"PodcastsUI.EpisodeUpsellBannerView"];
  [v3 validateClass:@"PodcastsUI.EpisodeUpsellBannerView" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PodcastsUI.EpisodeUpsellBannerView", @"accessibilitySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PodcastsUI.EpisodeUpsellBannerView", @"closeButtonTapped", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(NowPlayingEpisodeUpsellBannerViewAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v6 = [(NowPlayingEpisodeUpsellBannerViewAccessibility *)self safeValueForKey:@"accessibilitySubtitleLabel"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)accessibilityCustomActions
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F1C390]);
  v4 = accessibilityLocalizedString(@"dismiss.button");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__NowPlayingEpisodeUpsellBannerViewAccessibility_accessibilityCustomActions__block_invoke;
  v8[3] = &unk_2651441C0;
  v8[4] = self;
  v5 = (void *)[v3 initWithName:v4 actionHandler:v8];
  v9[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  return v6;
}

uint64_t __76__NowPlayingEpisodeUpsellBannerViewAccessibility_accessibilityCustomActions__block_invoke()
{
  return 1;
}

uint64_t __76__NowPlayingEpisodeUpsellBannerViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeButtonTapped];
}

@end