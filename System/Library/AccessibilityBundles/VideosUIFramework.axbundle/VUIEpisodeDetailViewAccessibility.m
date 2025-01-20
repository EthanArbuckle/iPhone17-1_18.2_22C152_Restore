@interface VUIEpisodeDetailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didMoveToWindow;
@end

@implementation VUIEpisodeDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIEpisodeDetailView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIEpisodeDetailView", @"seasonNumberLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIEpisodeDetailView", @"episodeNumberLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIEpisodeDetailView", @"episodeTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIEpisodeDetailView", @"mediaBadgeTagsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIEpisodeDetailView", @"contentDescriptionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIEpisodeDetailView", @"releaseDateLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIEpisodeDetailView", @"mediaItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIEpisodeDetailView", @"imageFrameView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUILibraryEpisodeFrameView", @"playButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUILibraryEpisodeFrameView", @"progressView", "@", 0);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)VUIEpisodeDetailViewAccessibility;
  [(VUIEpisodeDetailViewAccessibility *)&v3 didMoveToWindow];
  [(VUIEpisodeDetailViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v19.receiver = self;
  v19.super_class = (Class)VUIEpisodeDetailViewAccessibility;
  [(VUIEpisodeDetailViewAccessibility *)&v19 _accessibilityLoadAccessibilityInformation];
  v18 = [(VUIEpisodeDetailViewAccessibility *)self safeValueForKey:@"imageFrameView"];
  objc_super v3 = [v18 safeValueForKey:@"playButton"];
  v4 = accessibilityLocalizedString(@"play");
  [v3 setAccessibilityLabel:v4];

  uint64_t v5 = [v18 safeValueForKey:@"progressView"];
  v6 = (void *)MEMORY[0x263EFF8C0];
  v7 = [(VUIEpisodeDetailViewAccessibility *)self safeValueForKey:@"seasonNumberLabel"];
  v8 = [(VUIEpisodeDetailViewAccessibility *)self safeValueForKey:@"episodeNumberLabel"];
  v9 = objc_msgSend(v6, "axArrayByIgnoringNilElementsWithCount:", 2, v7, v8);

  v10 = (void *)[objc_alloc(MEMORY[0x263F81178]) initWithAccessibilityContainer:self representedElements:v9];
  v11 = [(VUIEpisodeDetailViewAccessibility *)self safeValueForKey:@"episodeTitleLabel"];
  uint64_t v12 = [v11 accessibilityTraits];
  [v11 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v12];
  v13 = [(VUIEpisodeDetailViewAccessibility *)self safeValueForKey:@"releaseDateLabel"];
  v14 = [(VUIEpisodeDetailViewAccessibility *)self safeValueForKey:@"mediaBadgeTagsView"];
  v15 = [(VUIEpisodeDetailViewAccessibility *)self safeValueForKey:@"contentDescriptionView"];
  v16 = (void *)v5;
  v17 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 7, v3, v5, v10, v11, v13, v14, v15);
  [(VUIEpisodeDetailViewAccessibility *)self setAccessibilityElements:v17];
}

@end