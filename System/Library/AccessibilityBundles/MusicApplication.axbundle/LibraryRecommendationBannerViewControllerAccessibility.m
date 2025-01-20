@interface LibraryRecommendationBannerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityUpdateBannerDisplay;
@end

@implementation LibraryRecommendationBannerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.LibraryRecommendationBannerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LibraryRecommendationBannerViewController", @"accessibilityBannerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LibraryRecommendationBannerViewController", @"accessibilityHeadlineText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LibraryRecommendationBannerViewController", @"accessibilityTitleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LibraryRecommendationBannerViewController", @"accessibilitySubtitleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LibraryRecommendationBannerViewController", @"accessibilityIsExplicit", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.LibraryRecommendationBannerViewController", @"accessibilityUpdateBannerDisplay", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2 = self;
  v18.receiver = self;
  v18.super_class = (Class)LibraryRecommendationBannerViewControllerAccessibility;
  [(LibraryRecommendationBannerViewControllerAccessibility *)&v18 _accessibilityLoadAccessibilityInformation];
  id v3 = [(LibraryRecommendationBannerViewControllerAccessibility *)v2 safeValueForKey:@"accessibilityBannerView"];
  [v3 _setAccessibilityIdentifierBlock:&__block_literal_global_6];
  v4 = [(LibraryRecommendationBannerViewControllerAccessibility *)v2 safeStringForKey:@"accessibilityHeadlineText"];
  v5 = [(LibraryRecommendationBannerViewControllerAccessibility *)v2 safeStringForKey:@"accessibilityTitleText"];
  v6 = [(LibraryRecommendationBannerViewControllerAccessibility *)v2 safeStringForKey:@"accessibilitySubtitleText"];
  LOBYTE(v2) = [(LibraryRecommendationBannerViewControllerAccessibility *)v2 safeBoolForKey:@"accessibilityIsExplicit"];
  v7 = accessibilityMusicLocalizedString(@"apple.music");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __100__LibraryRecommendationBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v12[3] = &unk_26513CD30;
  id v13 = v7;
  id v14 = v4;
  id v15 = v5;
  id v16 = v6;
  char v17 = (char)v2;
  id v8 = v6;
  id v9 = v5;
  id v10 = v4;
  id v11 = v7;
  [v3 _setAccessibilityLabelBlock:v12];
  [v3 _setIsAccessibilityElementBlock:&__block_literal_global_308];
  [v3 _setAccessibilityTraitsBlock:&__block_literal_global_311];
}

__CFString *__100__LibraryRecommendationBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return @"AXRecommendationBannerView";
}

id __100__LibraryRecommendationBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    id v3 = accessibilityMusicLocalizedString(@"explicit");
    v1 = __UIAXStringForVariables();
  }
  else
  {
    v1 = __UIAXStringForVariables();
  }

  return v1;
}

uint64_t __100__LibraryRecommendationBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return 1;
}

uint64_t __100__LibraryRecommendationBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4()
{
  return *MEMORY[0x263F1CEE8];
}

- (void)accessibilityUpdateBannerDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)LibraryRecommendationBannerViewControllerAccessibility;
  [(LibraryRecommendationBannerViewControllerAccessibility *)&v3 accessibilityUpdateBannerDisplay];
  [(LibraryRecommendationBannerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end