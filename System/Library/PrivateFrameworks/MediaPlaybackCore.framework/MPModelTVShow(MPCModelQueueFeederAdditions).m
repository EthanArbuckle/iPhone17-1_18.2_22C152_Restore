@interface MPModelTVShow(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredSectionPlaybackProperties;
@end

@implementation MPModelTVShow(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredSectionPlaybackProperties
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F12180];
  uint64_t v1 = *MEMORY[0x263F11978];
  v5[0] = *MEMORY[0x263F11988];
  v5[1] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  v3 = [v0 propertySetWithProperties:v2];

  return v3;
}

@end