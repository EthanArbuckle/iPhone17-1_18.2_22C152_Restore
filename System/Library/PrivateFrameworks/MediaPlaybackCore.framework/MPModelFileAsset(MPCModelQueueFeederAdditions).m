@interface MPModelFileAsset(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredItemPlaybackProperties;
@end

@implementation MPModelFileAsset(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  v8[9] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F12180];
  uint64_t v1 = *MEMORY[0x263F11538];
  v8[0] = *MEMORY[0x263F11510];
  v8[1] = v1;
  uint64_t v2 = *MEMORY[0x263F11548];
  v8[2] = *MEMORY[0x263F11540];
  v8[3] = v2;
  uint64_t v3 = *MEMORY[0x263F11528];
  v8[4] = *MEMORY[0x263F11530];
  v8[5] = v3;
  uint64_t v4 = *MEMORY[0x263F11518];
  v8[6] = *MEMORY[0x263F11520];
  v8[7] = v4;
  v8[8] = *MEMORY[0x263F11550];
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:9];
  v6 = [v0 propertySetWithProperties:v5];

  return v6;
}

@end