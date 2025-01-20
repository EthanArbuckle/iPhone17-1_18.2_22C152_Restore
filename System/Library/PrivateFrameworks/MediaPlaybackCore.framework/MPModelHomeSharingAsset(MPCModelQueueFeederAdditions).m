@interface MPModelHomeSharingAsset(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredItemPlaybackProperties;
@end

@implementation MPModelHomeSharingAsset(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  v5[3] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F12180];
  uint64_t v1 = *MEMORY[0x263F11570];
  v5[0] = *MEMORY[0x263F11578];
  v5[1] = v1;
  v5[2] = *MEMORY[0x263F11568];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  v3 = [v0 propertySetWithProperties:v2];

  return v3;
}

@end