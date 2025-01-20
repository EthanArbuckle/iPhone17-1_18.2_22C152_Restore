@interface MPModelAlbum(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredSectionPlaybackProperties;
@end

@implementation MPModelAlbum(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredSectionPlaybackProperties
{
  v13[5] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v1 = *MEMORY[0x263F114A0];
  v13[0] = *MEMORY[0x263F114C0];
  v13[1] = v1;
  uint64_t v2 = *MEMORY[0x263F114C8];
  v13[2] = *MEMORY[0x263F114E0];
  v13[3] = v2;
  v13[4] = *MEMORY[0x263F114D0];
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:5];
  uint64_t v11 = *MEMORY[0x263F11990];
  v4 = (void *)MEMORY[0x263F12180];
  uint64_t v10 = *MEMORY[0x263F114F0];
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  v6 = [v4 propertySetWithProperties:v5];
  v12 = v6;
  v7 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v8 = (void *)[v0 initWithProperties:v3 relationships:v7];

  return v8;
}

@end