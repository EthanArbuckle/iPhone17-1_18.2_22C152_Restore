@interface UIViewAccessibility
@end

@implementation UIViewAccessibility

uint64_t __86__UIViewAccessibility__MusicApplication__UIKit__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456584B0](@"MusicApplication.LibraryRecommendationBannerViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end