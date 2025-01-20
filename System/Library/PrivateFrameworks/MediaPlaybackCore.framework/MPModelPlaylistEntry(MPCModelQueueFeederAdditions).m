@interface MPModelPlaylistEntry(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredItemPlaybackProperties;
@end

@implementation MPModelPlaylistEntry(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  v8[3] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263F12180]);
  v7[0] = *MEMORY[0x263F11A70];
  v1 = objc_msgSend(MEMORY[0x263F12028], "mqf_requiredItemPlaybackProperties");
  v8[0] = v1;
  v7[1] = *MEMORY[0x263F11A78];
  v2 = objc_msgSend(MEMORY[0x263F12078], "mqf_requiredItemPlaybackProperties");
  v8[1] = v2;
  v7[2] = *MEMORY[0x263F11A68];
  v3 = objc_msgSend(MEMORY[0x263F11F68], "mqf_requiredItemPlaybackProperties");
  v8[2] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  v5 = (void *)[v0 initWithProperties:MEMORY[0x263EFFA68] relationships:v4];

  return v5;
}

@end