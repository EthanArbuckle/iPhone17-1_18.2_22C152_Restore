@interface MPModelRadioStation(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredSectionPlaybackProperties;
@end

@implementation MPModelRadioStation(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredSectionPlaybackProperties
{
  v8[9] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v1 = *MEMORY[0x263F11770];
  v8[0] = *MEMORY[0x263F11710];
  v8[1] = v1;
  uint64_t v2 = *MEMORY[0x263F11720];
  v8[2] = *MEMORY[0x263F11718];
  v8[3] = v2;
  uint64_t v3 = *MEMORY[0x263F11798];
  v8[4] = *MEMORY[0x263F117A0];
  v8[5] = v3;
  uint64_t v4 = *MEMORY[0x263F11780];
  v8[6] = *MEMORY[0x263F11790];
  v8[7] = v4;
  v8[8] = *MEMORY[0x263F11778];
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:9];
  v6 = (void *)[v0 initWithProperties:v5 relationships:MEMORY[0x263EFFA78]];

  return v6;
}

@end