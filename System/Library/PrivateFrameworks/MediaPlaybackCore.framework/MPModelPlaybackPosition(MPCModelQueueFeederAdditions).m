@interface MPModelPlaybackPosition(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredItemPlaybackProperties;
@end

@implementation MPModelPlaybackPosition(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  v6[5] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F12180];
  uint64_t v1 = *MEMORY[0x263F11610];
  v6[0] = *MEMORY[0x263F11600];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x263F11620];
  v6[2] = *MEMORY[0x263F11618];
  v6[3] = v2;
  v6[4] = *MEMORY[0x263F11628];
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v0 propertySetWithProperties:v3];

  return v4;
}

@end