@interface AXInvertColors_PodcastsStoreUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
@end

@implementation AXInvertColors_PodcastsStoreUI

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"PodcastsUIArtworkViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NowPlayingContentViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end