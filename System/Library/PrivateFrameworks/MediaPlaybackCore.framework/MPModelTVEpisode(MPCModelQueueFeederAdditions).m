@interface MPModelTVEpisode(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredItemPlaybackProperties;
@end

@implementation MPModelTVEpisode(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  v37[12] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v1 = *MEMORY[0x263F11900];
  v37[0] = *MEMORY[0x263F11958];
  v37[1] = v1;
  uint64_t v2 = *MEMORY[0x263F11910];
  v37[2] = *MEMORY[0x263F11908];
  v37[3] = v2;
  uint64_t v3 = *MEMORY[0x263F11938];
  v37[4] = *MEMORY[0x263F11940];
  v37[5] = v3;
  uint64_t v4 = *MEMORY[0x263F11948];
  v37[6] = *MEMORY[0x263F11950];
  v37[7] = v4;
  uint64_t v5 = *MEMORY[0x263F11930];
  v37[8] = *MEMORY[0x263F11928];
  v37[9] = v5;
  uint64_t v6 = *MEMORY[0x263F11918];
  v37[10] = *MEMORY[0x263F11920];
  v37[11] = v6;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:12];
  v35[0] = *MEMORY[0x263F11AF0];
  id v7 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v33 = *MEMORY[0x263F11B08];
  v8 = (void *)MEMORY[0x263F12180];
  uint64_t v32 = *MEMORY[0x263F11988];
  uint64_t v9 = v32;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  v26 = [v8 propertySetWithProperties:v27];
  v34 = v26;
  v24 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v23 = (void *)[v7 initWithProperties:MEMORY[0x263EFFA68] relationships:v24];
  v36[0] = v23;
  v35[1] = *MEMORY[0x263F11AF8];
  id v10 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v31 = v9;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
  uint64_t v29 = *MEMORY[0x263F11B10];
  v11 = (void *)MEMORY[0x263F12180];
  uint64_t v28 = *MEMORY[0x263F11980];
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  v13 = [v11 propertySetWithProperties:v12];
  v30 = v13;
  v14 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v15 = (void *)[v10 initWithProperties:v22 relationships:v14];
  v36[1] = v15;
  v35[2] = *MEMORY[0x263F11AE0];
  v16 = objc_msgSend(MEMORY[0x263F11EC8], "mqf_requiredItemPlaybackProperties");
  v36[2] = v16;
  v35[3] = *MEMORY[0x263F11AE8];
  v17 = objc_msgSend(MEMORY[0x263F11F90], "mqf_requiredItemPlaybackProperties");
  v36[3] = v17;
  v35[4] = *MEMORY[0x263F11B00];
  v18 = objc_msgSend(MEMORY[0x263F12050], "mqf_requiredItemPlaybackProperties");
  v36[4] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:5];
  v20 = (void *)[v0 initWithProperties:v25 relationships:v19];

  return v20;
}

@end