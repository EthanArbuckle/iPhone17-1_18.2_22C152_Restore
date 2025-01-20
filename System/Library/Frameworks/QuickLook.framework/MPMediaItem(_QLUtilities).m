@interface MPMediaItem(_QLUtilities)
+ (id)playingInfoFromAsset:()_QLUtilities withDefaultTitle:;
+ (id)playingInfoFromAsset:()_QLUtilities withDefaultTitle:playbackDuration:elapsedTime:;
+ (id)ql_propertyTitleFromAsset:()_QLUtilities;
@end

@implementation MPMediaItem(_QLUtilities)

+ (id)playingInfoFromAsset:()_QLUtilities withDefaultTitle:
{
  id v5 = a3;
  id v35 = a4;
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  v7 = (void *)MEMORY[0x263EFA748];
  v8 = [v5 commonMetadata];
  uint64_t v9 = *MEMORY[0x263EF9E78];
  v10 = [v7 metadataItemsFromArray:v8 withKey:*MEMORY[0x263EF9D88] keySpace:*MEMORY[0x263EF9E78]];
  v11 = [v10 firstObject];
  v12 = [v11 stringValue];

  if (v12) {
    [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x263F11238]];
  }
  v13 = (void *)MEMORY[0x263EFA748];
  v14 = [v5 commonMetadata];
  v15 = [v13 metadataItemsFromArray:v14 withKey:*MEMORY[0x263EF9D80] keySpace:v9];
  v16 = [v15 firstObject];
  v17 = [v16 stringValue];

  if (v17) {
    [v6 setObject:v17 forKeyedSubscript:*MEMORY[0x263F11220]];
  }
  v18 = objc_msgSend((id)objc_opt_class(), "ql_propertyTitleFromAsset:", v5);
  if (v18) {
    id v19 = v18;
  }
  else {
    id v19 = v35;
  }
  [v6 setObject:v19 forKeyedSubscript:*MEMORY[0x263F11400]];
  v20 = (void *)MEMORY[0x263EFA748];
  v21 = [v5 commonMetadata];
  v22 = [v20 metadataItemsFromArray:v21 withKey:*MEMORY[0x263EF9D90] keySpace:v9];
  v23 = [v22 firstObject];
  v24 = [v23 dataValue];

  if (v24 && [v24 length])
  {
    v25 = [MEMORY[0x263F827E8] imageWithData:v24];
    id v26 = objc_alloc(MEMORY[0x263F11E10]);
    [v25 size];
    double v28 = v27;
    double v30 = v29;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __67__MPMediaItem__QLUtilities__playingInfoFromAsset_withDefaultTitle___block_invoke;
    v36[3] = &unk_2642F6310;
    id v37 = v25;
    id v31 = v25;
    v32 = objc_msgSend(v26, "initWithBoundsSize:requestHandler:", v36, v28, v30);
    if (v32) {
      [v6 setObject:v32 forKeyedSubscript:*MEMORY[0x263F11248]];
    }
  }
  v33 = (void *)[v6 copy];

  return v33;
}

+ (id)playingInfoFromAsset:()_QLUtilities withDefaultTitle:playbackDuration:elapsedTime:
{
  v4 = objc_msgSend(MEMORY[0x263F11E08], "playingInfoFromAsset:withDefaultTitle:");
  id v5 = (void *)[v4 mutableCopy];

  v6 = [NSNumber numberWithDouble:a1];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F11380]];

  v7 = [NSNumber numberWithDouble:a2];
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F11C18]];

  v8 = (void *)[v5 copy];

  return v8;
}

+ (id)ql_propertyTitleFromAsset:()_QLUtilities
{
  v3 = (void *)MEMORY[0x263EFA748];
  v4 = [a3 commonMetadata];
  id v5 = [v3 metadataItemsFromArray:v4 withKey:*MEMORY[0x263EF9DC8] keySpace:*MEMORY[0x263EF9E78]];
  v6 = [v5 firstObject];
  v7 = [v6 stringValue];

  return v7;
}

@end