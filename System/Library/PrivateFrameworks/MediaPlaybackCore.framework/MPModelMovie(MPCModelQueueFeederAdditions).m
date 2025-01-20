@interface MPModelMovie(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredItemPlaybackProperties;
@end

@implementation MPModelMovie(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  v14[9] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v1 = *MEMORY[0x263F115B0];
  v14[0] = *MEMORY[0x263F115F0];
  v14[1] = v1;
  uint64_t v2 = *MEMORY[0x263F115C0];
  v14[2] = *MEMORY[0x263F115B8];
  v14[3] = v2;
  uint64_t v3 = *MEMORY[0x263F115E0];
  v14[4] = *MEMORY[0x263F115E8];
  v14[5] = v3;
  uint64_t v4 = *MEMORY[0x263F115D8];
  v14[6] = *MEMORY[0x263F115D0];
  v14[7] = v4;
  v14[8] = *MEMORY[0x263F115C8];
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:9];
  v6 = objc_msgSend(MEMORY[0x263F11EC8], "mqf_requiredItemPlaybackProperties", *MEMORY[0x263F11A40]);
  v13[0] = v6;
  v12[1] = *MEMORY[0x263F11A48];
  v7 = objc_msgSend(MEMORY[0x263F11F90], "mqf_requiredItemPlaybackProperties");
  v13[1] = v7;
  v12[2] = *MEMORY[0x263F11A50];
  v8 = objc_msgSend(MEMORY[0x263F12050], "mqf_requiredItemPlaybackProperties");
  v13[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  v10 = (void *)[v0 initWithProperties:v5 relationships:v9];

  return v10;
}

@end