@interface MPModelTVSeason(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredSectionPlaybackProperties;
@end

@implementation MPModelTVSeason(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredSectionPlaybackProperties
{
  v12[2] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v1 = *MEMORY[0x263F11960];
  v12[0] = *MEMORY[0x263F11970];
  v12[1] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  uint64_t v10 = *MEMORY[0x263F11B08];
  v3 = (void *)MEMORY[0x263F12180];
  uint64_t v9 = *MEMORY[0x263F11988];
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  v5 = [v3 propertySetWithProperties:v4];
  v11 = v5;
  v6 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v7 = (void *)[v0 initWithProperties:v2 relationships:v6];

  return v7;
}

@end