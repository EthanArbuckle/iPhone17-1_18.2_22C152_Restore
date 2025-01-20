@interface MPModelPlaylist(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredSectionPlaybackProperties;
@end

@implementation MPModelPlaylist(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredSectionPlaybackProperties
{
  v9[10] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F12180];
  uint64_t v1 = *MEMORY[0x263F11668];
  v9[0] = *MEMORY[0x263F11670];
  v9[1] = v1;
  uint64_t v2 = *MEMORY[0x263F11640];
  v9[2] = *MEMORY[0x263F11690];
  v9[3] = v2;
  uint64_t v3 = *MEMORY[0x263F11638];
  v9[4] = *MEMORY[0x263F11688];
  v9[5] = v3;
  uint64_t v4 = *MEMORY[0x263F11680];
  v9[6] = *MEMORY[0x263F11678];
  v9[7] = v4;
  uint64_t v5 = *MEMORY[0x263F11648];
  v9[8] = *MEMORY[0x263F11650];
  v9[9] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:10];
  v7 = [v0 propertySetWithProperties:v6];

  return v7;
}

@end