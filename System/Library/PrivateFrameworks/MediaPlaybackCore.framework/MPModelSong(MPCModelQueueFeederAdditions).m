@interface MPModelSong(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredItemPlaybackProperties;
@end

@implementation MPModelSong(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  v53[25] = *MEMORY[0x263EF8340];
  id v42 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v0 = *MEMORY[0x263F117F8];
  v53[0] = *MEMORY[0x263F11880];
  v53[1] = v0;
  uint64_t v1 = *MEMORY[0x263F11830];
  v53[2] = *MEMORY[0x263F11800];
  v53[3] = v1;
  uint64_t v2 = *MEMORY[0x263F11818];
  v53[4] = *MEMORY[0x263F11820];
  v53[5] = v2;
  uint64_t v3 = *MEMORY[0x263F11840];
  v53[6] = *MEMORY[0x263F11838];
  v53[7] = v3;
  uint64_t v4 = *MEMORY[0x263F11808];
  v53[8] = *MEMORY[0x263F117F0];
  v53[9] = v4;
  uint64_t v5 = *MEMORY[0x263F118A8];
  v53[10] = *MEMORY[0x263F11870];
  v53[11] = v5;
  uint64_t v6 = *MEMORY[0x263F11850];
  v53[12] = *MEMORY[0x263F11858];
  v53[13] = v6;
  uint64_t v7 = *MEMORY[0x263F11860];
  v53[14] = *MEMORY[0x263F11848];
  v53[15] = v7;
  uint64_t v8 = *MEMORY[0x263F11898];
  v53[16] = *MEMORY[0x263F11868];
  v53[17] = v8;
  uint64_t v9 = *MEMORY[0x263F118A0];
  v53[18] = *MEMORY[0x263F11828];
  v53[19] = v9;
  uint64_t v10 = *MEMORY[0x263F11810];
  v53[20] = *MEMORY[0x263F11888];
  v53[21] = v10;
  uint64_t v11 = *MEMORY[0x263F11890];
  v53[22] = *MEMORY[0x263F12380];
  v53[23] = v11;
  v53[24] = *MEMORY[0x263F11878];
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:25];
  v51[0] = *MEMORY[0x263F11A98];
  id v12 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v13 = *MEMORY[0x263F114E0];
  v50[0] = *MEMORY[0x263F114C0];
  v50[1] = v13;
  v50[2] = *MEMORY[0x263F114D8];
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:3];
  uint64_t v48 = *MEMORY[0x263F11990];
  v14 = (void *)MEMORY[0x263F12180];
  uint64_t v47 = *MEMORY[0x263F114F0];
  uint64_t v15 = v47;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
  v40 = [v14 propertySetWithProperties:v41];
  v49 = v40;
  v37 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  v36 = (void *)[v12 initWithProperties:v39 relationships:v37];
  v52[0] = v36;
  v51[1] = *MEMORY[0x263F11AA0];
  v16 = (void *)MEMORY[0x263F12180];
  uint64_t v46 = v15;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
  v34 = [v16 propertySetWithProperties:v35];
  v52[1] = v34;
  v51[2] = *MEMORY[0x263F11AA8];
  v17 = (void *)MEMORY[0x263F12180];
  uint64_t v45 = *MEMORY[0x263F114F8];
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
  v32 = [v17 propertySetWithProperties:v33];
  v52[2] = v32;
  v51[3] = *MEMORY[0x263F11AB8];
  v31 = objc_msgSend(MEMORY[0x263F11F08], "mqf_requiredItemPlaybackProperties");
  v52[3] = v31;
  v51[4] = *MEMORY[0x263F11AC0];
  v18 = objc_msgSend(MEMORY[0x263F11EC8], "mqf_requiredItemPlaybackProperties");
  v52[4] = v18;
  v51[5] = *MEMORY[0x263F11AD0];
  v19 = objc_msgSend(MEMORY[0x263F11F90], "mqf_requiredItemPlaybackProperties");
  v52[5] = v19;
  v51[6] = *MEMORY[0x263F11AD8];
  v20 = objc_msgSend(MEMORY[0x263F12050], "mqf_requiredItemPlaybackProperties");
  v52[6] = v20;
  v51[7] = *MEMORY[0x263F11AB0];
  v21 = (void *)MEMORY[0x263F12180];
  uint64_t v44 = *MEMORY[0x263F11560];
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
  v23 = [v21 propertySetWithProperties:v22];
  v52[7] = v23;
  v51[8] = *MEMORY[0x263F11AC8];
  v24 = (void *)MEMORY[0x263F12180];
  uint64_t v25 = *MEMORY[0x263F11588];
  v43[0] = *MEMORY[0x263F11598];
  v43[1] = v25;
  v43[2] = *MEMORY[0x263F11590];
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
  v27 = [v24 propertySetWithProperties:v26];
  v52[8] = v27;
  v28 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:9];
  v29 = (void *)[v42 initWithProperties:v38 relationships:v28];

  return v29;
}

@end