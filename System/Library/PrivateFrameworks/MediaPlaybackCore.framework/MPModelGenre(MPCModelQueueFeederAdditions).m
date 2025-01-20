@interface MPModelGenre(MPCModelQueueFeederAdditions)
+ (uint64_t)mqf_requiredSectionPlaybackProperties;
@end

@implementation MPModelGenre(MPCModelQueueFeederAdditions)

+ (uint64_t)mqf_requiredSectionPlaybackProperties
{
  return [MEMORY[0x263F12180] emptyPropertySet];
}

@end