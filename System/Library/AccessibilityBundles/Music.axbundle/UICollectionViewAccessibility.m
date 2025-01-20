@interface UICollectionViewAccessibility
@end

@implementation UICollectionViewAccessibility

uint64_t __88__UICollectionViewAccessibility__Music__UIKit_accessibilityShouldSpeakItemReorderEvents__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x245658030](@"Music.NowPlayingViewController");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x245658030](@"Music.LibraryMainViewController"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x245658030](@"Music.PlaylistEditingViewController");
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __102__UICollectionViewAccessibility__Music__UIKit__accessibilitySupplementaryViewSectionHeaderIdentifiers__block_invoke(uint64_t a1, void *a2)
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