@interface UICollectionViewAccessibility
@end

@implementation UICollectionViewAccessibility

uint64_t __99__UICollectionViewAccessibility__MusicApplication__UIKit_accessibilityShouldSpeakItemReorderEvents__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456584B0](@"MusicApplication.NowPlayingViewController");
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x2456584B0](@"MusicApplication.PlaylistDetailSongsViewController");
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __113__UICollectionViewAccessibility__MusicApplication__UIKit__accessibilitySupplementaryViewSectionHeaderIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEqualToString:*MEMORY[0x263F1D120]]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isEqualToString:@"ShelfSupplementaryViewKindGlobalHeader"] ^ 1;
  }

  return v3;
}

@end