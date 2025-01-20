@interface MPModelStoreAsset(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredItemPlaybackProperties;
@end

@implementation MPModelStoreAsset(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  v7[6] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F12180];
  uint64_t v1 = *MEMORY[0x263F118E8];
  v7[0] = *MEMORY[0x263F118D8];
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x263F118E0];
  v7[2] = *MEMORY[0x263F118D0];
  v7[3] = v2;
  uint64_t v3 = *MEMORY[0x263F118F8];
  v7[4] = *MEMORY[0x263F118F0];
  v7[5] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:6];
  v5 = [v0 propertySetWithProperties:v4];

  return v5;
}

@end