@interface MPModelPodcastEpisode(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredItemPlaybackProperties;
@end

@implementation MPModelPodcastEpisode(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  v12[2] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v1 = *MEMORY[0x263F116A8];
  v12[0] = *MEMORY[0x263F116D8];
  v12[1] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  uint64_t v10 = *MEMORY[0x263F11A90];
  v3 = (void *)MEMORY[0x263F12180];
  uint64_t v9 = *MEMORY[0x263F11708];
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  v5 = [v3 propertySetWithProperties:v4];
  v11 = v5;
  v6 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v7 = (void *)[v0 initWithProperties:v2 relationships:v6];

  return v7;
}

@end