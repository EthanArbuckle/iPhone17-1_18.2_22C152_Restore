@interface UIAlertController(HUPreloadingModalPresentation)
- (uint64_t)hu_preloadContent;
@end

@implementation UIAlertController(HUPreloadingModalPresentation)

- (uint64_t)hu_preloadContent
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

@end