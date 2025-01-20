@interface CPAnalyticsBiomeDestination
- (BOOL)_datasetNameInMemoryCuration:(id)a3;
- (CPAnalyticsBiomeDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4;
- (NSMutableArray)eventMatchers;
- (id)_baseSampleFromEvent:(id)a3 matcher:(id)a4;
- (void)_donateGenerativeMemoryCreationWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_donateMemoryCurationWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_donateMemoryMoviePlayedWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_donateMemorySharedWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_donateMemoryViewedWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_donatePhotoDeleteEventWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_donatePhotoEditEventWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_donatePhotoEngagmentEventWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_donatePhotoFavoritesEventWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_donatePhotoSearchEventWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_donatePhotoShareEventWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_donateSearchSessionyWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_dondateMemoryNotificationWithBaseSample:(id)a3 andEvent:(id)a4;
- (void)_sendBiomeEvent:(id)a3 matcher:(id)a4;
- (void)_updateWithConfig:(id)a3;
- (void)processEvent:(id)a3;
@end

@implementation CPAnalyticsBiomeDestination

- (void).cxx_destruct
{
}

- (NSMutableArray)eventMatchers
{
  return self->_eventMatchers;
}

- (void)_donateSearchSessionyWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 propertyForKey:@"searchQuery"];
  v8 = [v5 propertyForKey:@"presentedAssets"];

  v9 = objc_opt_new();
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __76__CPAnalyticsBiomeDestination__donateSearchSessionyWithBaseSample_andEvent___block_invoke;
  v21[3] = &unk_26423C468;
  id v10 = v9;
  id v22 = v10;
  [v8 enumerateObjectsUsingBlock:v21];
  v11 = BiomeLibrary();
  v12 = [v11 AeroML];
  v13 = [v12 RawEvent];
  v14 = [v13 PhotosSearchSession];

  v15 = [v14 source];
  id v16 = objc_alloc(MEMORY[0x263F29F98]);
  v17 = (void *)[v16 initWithQueryRaw:v7 queryEmbedding:MEMORY[0x263EFFA68] presentedAssets:v10];
  v18 = [v6 date];

  [v18 timeIntervalSinceReferenceDate];
  objc_msgSend(v15, "sendEvent:timestamp:", v17);

  v19 = CPAnalyticsLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_215355000, v19, OS_LOG_TYPE_INFO, "[Biome][Donation][SearchSession] Sent a search session event", v20, 2u);
  }
}

void __76__CPAnalyticsBiomeDestination__donateSearchSessionyWithBaseSample_andEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)MEMORY[0x263F29FA0];
  id v6 = a2;
  id v7 = [v5 alloc];
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = (id)[v7 initWithAssetUUID:v6 rankingIndex:v8 cosDistance:0];

  [*(id *)(a1 + 32) addObject:v9];
}

- (void)_donatePhotoSearchEventWithBaseSample:(id)a3 andEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a4 propertyForKey:@"bundleIdentifier"];
  id v7 = BiomeLibrary();
  v8 = [v7 Photos];
  id v9 = [v8 Search];

  id v10 = [v9 source];
  id v11 = objc_alloc(MEMORY[0x263F2A360]);
  v12 = [v5 identifier];
  v13 = (void *)[v11 initWithIdentifier:v12 subset:v6 type:1];

  v14 = [v5 date];
  [v14 timeIntervalSinceReferenceDate];
  objc_msgSend(v10, "sendEvent:timestamp:", v13);

  v15 = CPAnalyticsLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = [v5 identifier];
    int v17 = 138412290;
    v18 = v16;
    _os_log_impl(&dword_215355000, v15, OS_LOG_TYPE_INFO, "[Biome][Donation][Photos][Search] Sent a photo search event with uuid: %@", (uint8_t *)&v17, 0xCu);
  }
}

- (void)_donatePhotoShareEventWithBaseSample:(id)a3 andEvent:(id)a4
{
  v27[9] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v26[0] = @"PLActivityTypeUseAsWallpaper";
  v26[1] = @"com.apple.NanoTimeKit.CreateWatchFace";
  v27[0] = &unk_26C5F47E0;
  v27[1] = &unk_26C5F47F8;
  v26[2] = @"com.apple.Photos.actvity.AirPlay";
  v26[3] = @"com.apple.UIKit.activity.AirDrop";
  v27[2] = &unk_26C5F4810;
  v27[3] = &unk_26C5F4828;
  v26[4] = @"com.apple.DocumentManagerUICore.SaveToFiles";
  v26[5] = @"com.apple.UIKit.activity.AssignToContact";
  v27[4] = &unk_26C5F4840;
  v27[5] = &unk_26C5F4858;
  v26[6] = @"PUActivityTypeAddToAlbum";
  v26[7] = @"PLActivityTypeAlbumStream";
  v27[6] = &unk_26C5F4870;
  v27[7] = &unk_26C5F4888;
  v26[8] = @"PUActivityTypeHide";
  v27[8] = &unk_26C5F48A0;
  id v6 = NSDictionary;
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v27 forKeys:v26 count:9];
  id v9 = [v7 propertyForKey:@"activityType"];

  id v10 = [v5 subset];

  if (v10)
  {
    uint64_t v11 = 1;
  }
  else
  {
    v12 = [v8 objectForKey:v9];
    uint64_t v11 = [v12 intValue];
  }
  v13 = BiomeLibrary();
  v14 = [v13 Photos];
  v15 = [v14 Share];

  id v16 = [v15 source];
  id v17 = objc_alloc(MEMORY[0x263F2A368]);
  v18 = [v5 identifier];
  uint64_t v19 = [v5 subset];
  v20 = (void *)[v17 initWithIdentifier:v18 subset:v19 type:v11];

  v21 = [v5 date];
  [v21 timeIntervalSinceReferenceDate];
  objc_msgSend(v16, "sendEvent:timestamp:", v20);

  id v22 = CPAnalyticsLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = [v5 identifier];
    int v24 = 138412290;
    v25 = v23;
    _os_log_impl(&dword_215355000, v22, OS_LOG_TYPE_INFO, "[Biome][Donation][Photos][Share] Sent a photo share event with uuid: %@", (uint8_t *)&v24, 0xCu);
  }
}

- (void)_donatePhotoFavoritesEventWithBaseSample:(id)a3 andEvent:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a4 propertyForKey:@"cpa_media_ageInMinutes"];
  [v6 doubleValue];
  double v8 = v7;

  if (v8 > 0.0 && v8 < 2.0)
  {
    uint64_t v10 = 1;
  }
  else if (v8 > 262800.0)
  {
    uint64_t v10 = 2;
  }
  else
  {
    uint64_t v10 = 3;
  }
  uint64_t v11 = BiomeLibrary();
  v12 = [v11 Photos];
  v13 = [v12 Favorite];

  v14 = [v13 source];
  id v15 = objc_alloc(MEMORY[0x263F2A330]);
  id v16 = [v5 identifier];
  id v17 = [v5 subset];
  v18 = (void *)[v15 initWithIdentifier:v16 subset:v17 type:v10];

  uint64_t v19 = [v5 date];
  [v19 timeIntervalSinceReferenceDate];
  objc_msgSend(v14, "sendEvent:timestamp:", v18);

  v20 = CPAnalyticsLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = [v5 identifier];
    int v22 = 138412290;
    v23 = v21;
    _os_log_impl(&dword_215355000, v20, OS_LOG_TYPE_INFO, "[Biome][Donation][Photos][Favorite] Sent a photo favorite event with uuid: %@", (uint8_t *)&v22, 0xCu);
  }
}

- (void)_donatePhotoEngagmentEventWithBaseSample:(id)a3 andEvent:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a4 propertyForKey:@"signpostDuration"];
  [v6 doubleValue];
  double v8 = v7;

  if (v8 > 0.0 && v8 < 1.0)
  {
    uint64_t v13 = 1;
  }
  else
  {
    if (v8 >= 3.0 || v8 <= 2.0) {
      unsigned int v11 = 0;
    }
    else {
      unsigned int v11 = 3;
    }
    if (v8 > 1.0 && v8 < 2.0) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = v11;
    }
  }
  v14 = BiomeLibrary();
  id v15 = [v14 Photos];
  id v16 = [v15 Engagement];

  id v17 = [v16 source];
  id v18 = objc_alloc(MEMORY[0x263F2A328]);
  uint64_t v19 = [v5 identifier];
  v20 = [v5 subset];
  v21 = (void *)[v18 initWithIdentifier:v19 subset:v20 type:v13];

  int v22 = [v5 date];
  [v22 timeIntervalSinceReferenceDate];
  objc_msgSend(v17, "sendEvent:timestamp:", v21);

  v23 = CPAnalyticsLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = [v5 identifier];
    int v25 = 138412290;
    v26 = v24;
    _os_log_impl(&dword_215355000, v23, OS_LOG_TYPE_INFO, "[Biome][Donation][Photos][Engagement] Sent a photos engagement event with uuid: %@", (uint8_t *)&v25, 0xCu);
  }
}

- (void)_donatePhotoEditEventWithBaseSample:(id)a3 andEvent:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = BiomeLibrary();
  id v6 = [v5 Photos];
  double v7 = [v6 Edit];

  double v8 = [v7 source];
  id v9 = objc_alloc(MEMORY[0x263F2A320]);
  uint64_t v10 = [v4 identifier];
  unsigned int v11 = [v4 subset];
  v12 = (void *)[v9 initWithIdentifier:v10 subset:v11 type:0];

  uint64_t v13 = [v4 date];
  [v13 timeIntervalSinceReferenceDate];
  objc_msgSend(v8, "sendEvent:timestamp:", v12);

  v14 = CPAnalyticsLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [v4 identifier];
    int v16 = 138412290;
    id v17 = v15;
    _os_log_impl(&dword_215355000, v14, OS_LOG_TYPE_INFO, "[Biome][Donation][Photos][Edit] Sent a photo edit event with uuid: %@", (uint8_t *)&v16, 0xCu);
  }
}

- (void)_donatePhotoDeleteEventWithBaseSample:(id)a3 andEvent:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a4 propertyForKey:@"cpa_media_ageInMinutes"];
  [v6 doubleValue];
  double v8 = v7;

  if (v8 > 0.0 && v8 < 2.0)
  {
    uint64_t v10 = 1;
  }
  else if (v8 > 262800.0)
  {
    uint64_t v10 = 2;
  }
  else
  {
    uint64_t v10 = 3;
  }
  unsigned int v11 = BiomeLibrary();
  v12 = [v11 Photos];
  uint64_t v13 = [v12 Delete];

  v14 = [v13 source];
  id v15 = objc_alloc(MEMORY[0x263F2A318]);
  int v16 = [v5 identifier];
  id v17 = [v5 subset];
  uint64_t v18 = (void *)[v15 initWithIdentifier:v16 subset:v17 type:v10];

  uint64_t v19 = [v5 date];
  [v19 timeIntervalSinceReferenceDate];
  objc_msgSend(v14, "sendEvent:timestamp:", v18);

  v20 = CPAnalyticsLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = [v5 identifier];
    int v22 = 138412290;
    v23 = v21;
    _os_log_impl(&dword_215355000, v20, OS_LOG_TYPE_INFO, "[Biome][Donation][Photos][Delete] Sent a photo delete event with uuid: %@", (uint8_t *)&v22, 0xCu);
  }
}

- (void)_donateGenerativeMemoryCreationWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v6 propertyForKey:@"cpa_media_uuid"];
  double v8 = [v6 propertyForKey:@"queryHasPerson"];
  id v9 = [v6 propertyForKey:@"queryHasActivity"];
  v32 = [v6 propertyForKey:@"queryHasTime"];
  v31 = [v6 propertyForKey:@"queryHasLocation"];
  v30 = [v6 propertyForKey:@"queryHasTrip"];
  v29 = [v6 propertyForKey:@"queryHasArtist"];
  v28 = [v6 propertyForKey:@"queryHasSong"];
  uint64_t v10 = [v6 propertyForKey:@"queryHasGenre"];
  unsigned int v11 = [v6 propertyForKey:@"queryHasMood"];
  v12 = [v6 propertyForKey:@"memoryIsGenerated"];
  uint64_t v13 = [v6 propertyForKey:@"sampledGlobalTraitsForFedStats"];
  v14 = [v6 propertyForKey:@"memoryAssetCount"];

  uint64_t v15 = [v14 integerValue];
  if ((unint64_t)(v15 - 1) >= 0x28) {
    int v16 = 4 * (v15 > 41);
  }
  else {
    int v16 = dword_21536923C[v15 - 1];
  }
  LODWORD(v25) = v16;
  id v17 = (void *)[objc_alloc(MEMORY[0x263F2A348]) initWithIdentifier:v7 queryContainsPersonEntity:v8 queryContainsActivityEntity:v9 queryContainsTimeEntity:v32 queryContainsLocationEntity:v31 queryContainsTripEntity:v30 queryContainsMusicArtist:v29 queryContainsMusicSong:v28 queryContainsMusicGenre:v10 queryContainsMusicMood:v11 globalTraits:v13 memoryGenerated:v12 memoryAssetCount:v25];
  if (v17)
  {
    v26 = v8;
    uint64_t v27 = v7;
    BiomeLibrary();
    uint64_t v19 = v18 = v5;
    v20 = [v19 Photos];
    v21 = [v20 MemoryCreation];

    int v22 = [v21 source];
    v23 = [v18 date];
    [v23 timeIntervalSinceReferenceDate];
    objc_msgSend(v22, "sendEvent:timestamp:", v17);

    uint64_t v24 = CPAnalyticsLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215355000, v24, OS_LOG_TYPE_INFO, "[Biome][Donation][MemoryCreation] Sent a memory creation event", buf, 2u);
    }

    id v5 = v18;
    double v8 = v26;
    double v7 = v27;
  }
}

- (void)_donateMemoryViewedWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v6 propertyForKey:@"didPlayToEnd"];
  double v8 = [v6 propertyForKey:@"maxPlayTime"];

  int v9 = [v8 intValue];
  if (v9 >= 0x15)
  {
    if (v9 <= 21) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = 3;
    }
  }
  else
  {
    uint64_t v10 = dword_2153691E8[v9];
  }
  unsigned int v11 = [v5 identifier];
  v12 = (void *)[objc_alloc(MEMORY[0x263F2A340]) initWithIdentifier:v11 viewedDurationBucket:v10 watchedToEnd:v7];
  if (v12)
  {
    uint64_t v13 = BiomeLibrary();
    v14 = [v13 Photos];
    uint64_t v15 = [v14 Memories];
    int v16 = [v15 Viewed];

    id v17 = [v16 source];
    uint64_t v18 = [v5 date];
    [v18 timeIntervalSinceReferenceDate];
    objc_msgSend(v17, "sendEvent:timestamp:", v12);

    uint64_t v19 = CPAnalyticsLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_215355000, v19, OS_LOG_TYPE_INFO, "[Biome][Donation][MemoryViewed] Sent a memory viewed event", v20, 2u);
    }
  }
}

- (void)_donateMemorySharedWithBaseSample:(id)a3 andEvent:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a4 propertyForKey:@"isThirdPartyShareDestination"];
  double v7 = BiomeLibrary();
  double v8 = [v7 Photos];
  int v9 = [v8 Memories];
  uint64_t v10 = [v9 Shared];

  unsigned int v11 = [v10 source];
  id v12 = objc_alloc(MEMORY[0x263F2A338]);
  uint64_t v13 = [v5 identifier];
  v14 = [v5 subset];
  uint64_t v15 = (void *)[v12 initWithIdentifier:v13 subset:v14 isThirdPartyShareDestination:v6];

  int v16 = [v5 date];
  [v16 timeIntervalSinceReferenceDate];
  double v18 = v17;

  [v11 sendEvent:v15 timestamp:v18];
  uint64_t v19 = CPAnalyticsLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = [v5 identifier];
    int v21 = 138412290;
    int v22 = v20;
    _os_log_impl(&dword_215355000, v19, OS_LOG_TYPE_INFO, "[Biome][Donation][MemoryShare] Sent a memory share event with uuid: %@", (uint8_t *)&v21, 0xCu);
  }
}

- (void)_dondateMemoryNotificationWithBaseSample:(id)a3 andEvent:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = [v6 name];
  char v8 = [v7 isEqualToString:@"com.apple.photos.CPAnalytics.memoryNotificationSeen"];

  if (v8)
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v10 = [v6 name];
    int v11 = [v10 isEqualToString:@"com.apple.photos.CPAnalytics.memoryNotificationResponded"];

    if (v11) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  id v12 = BiomeLibrary();
  uint64_t v13 = [v12 Photos];
  v14 = [v13 Memories];
  uint64_t v15 = [v14 Notification];

  int v16 = [v15 source];
  id v17 = objc_alloc(MEMORY[0x263F2A358]);
  double v18 = [v5 identifier];
  uint64_t v19 = [v5 subset];
  v20 = (void *)[v17 initWithIdentifier:v18 subset:v19 type:v9];

  int v21 = [v5 date];
  [v21 timeIntervalSinceReferenceDate];
  double v23 = v22;

  [v16 sendEvent:v20 timestamp:v23];
  uint64_t v24 = CPAnalyticsLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = [v5 identifier];
    int v26 = 138412290;
    uint64_t v27 = v25;
    _os_log_impl(&dword_215355000, v24, OS_LOG_TYPE_INFO, "[Biome][Donation][Notifications] Sent a memory notifications event with uuid: %@", (uint8_t *)&v26, 0xCu);
  }
}

- (void)_donateMemoryMoviePlayedWithBaseSample:(id)a3 andEvent:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = BiomeLibrary();
  id v6 = [v5 Photos];
  double v7 = [v6 Memories];
  char v8 = [v7 MoviePlayed];

  uint64_t v9 = [v8 source];
  id v10 = objc_alloc(MEMORY[0x263F2A350]);
  int v11 = [v4 identifier];
  id v12 = [v4 subset];
  uint64_t v13 = (void *)[v10 initWithIdentifier:v11 subset:v12];

  v14 = [v4 date];
  [v14 timeIntervalSinceReferenceDate];
  double v16 = v15;

  [v9 sendEvent:v13 timestamp:v16];
  id v17 = CPAnalyticsLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    double v18 = [v4 identifier];
    int v19 = 138412290;
    v20 = v18;
    _os_log_impl(&dword_215355000, v17, OS_LOG_TYPE_INFO, "[Biome][Donation][MoviePlayed] Sent a movie played event with uuid: %@", (uint8_t *)&v19, 0xCu);
  }
}

- (void)_donateMemoryCurationWithBaseSample:(id)a3 andEvent:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = [v6 name];
  char v8 = [v7 isEqualToString:@"com.apple.photos.CPAnalytics.assetCollectionDeleted"];

  if (v8)
  {
    uint64_t v9 = 4;
  }
  else
  {
    id v10 = [v6 name];
    char v11 = [v10 isEqualToString:@"com.apple.photos.CPAnalytics.assetCollectionBlocked"];

    if (v11)
    {
      uint64_t v9 = 3;
    }
    else
    {
      id v12 = [v6 name];
      char v13 = [v12 isEqualToString:@"com.apple.photos.CPAnalytics.assetCollectionUnfavorited"];

      if (v13)
      {
        uint64_t v9 = 2;
      }
      else
      {
        v14 = [v6 name];
        uint64_t v9 = [v14 isEqualToString:@"com.apple.photos.CPAnalytics.assetCollectionFavorited"];
      }
    }
  }
  double v15 = BiomeLibrary();
  double v16 = [v15 Photos];
  id v17 = [v16 Memories];
  double v18 = [v17 Curation];

  int v19 = [v18 source];
  id v20 = objc_alloc(MEMORY[0x263F2A310]);
  uint64_t v21 = [v5 identifier];
  double v22 = [v5 subset];
  double v23 = (void *)[v20 initWithIdentifier:v21 subset:v22 type:v9];

  uint64_t v24 = [v5 date];
  [v24 timeIntervalSinceReferenceDate];
  double v26 = v25;

  [v19 sendEvent:v23 timestamp:v26];
  uint64_t v27 = CPAnalyticsLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = [v5 identifier];
    int v29 = 138412290;
    v30 = v28;
    _os_log_impl(&dword_215355000, v27, OS_LOG_TYPE_INFO, "[Biome][Donation][MemoryCuration] Sent a memory curation event with uuid: %@", (uint8_t *)&v29, 0xCu);
  }
}

- (BOOL)_datasetNameInMemoryCuration:(id)a3
{
  return [&unk_26C5F48B8 containsObject:a3];
}

- (void)_sendBiomeEvent:(id)a3 matcher:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = CPAnalyticsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v7 datasetName];
    int v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_215355000, v8, OS_LOG_TYPE_INFO, "Enter with matcher %@", (uint8_t *)&v13, 0xCu);
  }
  id v10 = [v7 datasetName];
  char v11 = [(CPAnalyticsBiomeDestination *)self _baseSampleFromEvent:v6 matcher:v7];
  if ([(CPAnalyticsBiomeDestination *)self _datasetNameInMemoryCuration:v10])
  {
    [(CPAnalyticsBiomeDestination *)self _donateMemoryCurationWithBaseSample:v11 andEvent:v6];
  }
  else if ([v10 hasPrefix:@"/photos/memories/moviePlayed"])
  {
    [(CPAnalyticsBiomeDestination *)self _donateMemoryMoviePlayedWithBaseSample:v11 andEvent:v6];
  }
  else if ([v10 hasPrefix:@"/photos/memories/notification"])
  {
    [(CPAnalyticsBiomeDestination *)self _dondateMemoryNotificationWithBaseSample:v11 andEvent:v6];
  }
  else if ([v10 isEqualToString:@"/photos/memories/share"])
  {
    [(CPAnalyticsBiomeDestination *)self _donateMemorySharedWithBaseSample:v11 andEvent:v6];
  }
  else if ([v10 isEqualToString:@"/photos/memories/viewed"])
  {
    [(CPAnalyticsBiomeDestination *)self _donateMemoryViewedWithBaseSample:v11 andEvent:v6];
  }
  else if ([v10 isEqualToString:@"/photos/generativeMemory/create"])
  {
    [(CPAnalyticsBiomeDestination *)self _donateGenerativeMemoryCreationWithBaseSample:v11 andEvent:v6];
  }
  else if ([v10 hasPrefix:@"/photos/deletes"])
  {
    [(CPAnalyticsBiomeDestination *)self _donatePhotoDeleteEventWithBaseSample:v11 andEvent:v6];
  }
  else if ([v10 hasPrefix:@"/photos/edit"])
  {
    [(CPAnalyticsBiomeDestination *)self _donatePhotoEditEventWithBaseSample:v11 andEvent:v6];
  }
  else if ([v10 hasPrefix:@"/photos/engagement"])
  {
    [(CPAnalyticsBiomeDestination *)self _donatePhotoEngagmentEventWithBaseSample:v11 andEvent:v6];
  }
  else if ([v10 hasPrefix:@"/photos/favorites"])
  {
    [(CPAnalyticsBiomeDestination *)self _donatePhotoFavoritesEventWithBaseSample:v11 andEvent:v6];
  }
  else if ([v10 hasPrefix:@"/photos/share"])
  {
    [(CPAnalyticsBiomeDestination *)self _donatePhotoShareEventWithBaseSample:v11 andEvent:v6];
  }
  else if ([v10 hasPrefix:@"/photos/searchAsset"])
  {
    [(CPAnalyticsBiomeDestination *)self _donatePhotoSearchEventWithBaseSample:v11 andEvent:v6];
  }
  else if ([v10 hasPrefix:@"/photos/searchSession"])
  {
    [(CPAnalyticsBiomeDestination *)self _donateSearchSessionyWithBaseSample:v11 andEvent:v6];
  }
  else
  {
    id v12 = CPAnalyticsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      v14 = v10;
      _os_log_error_impl(&dword_215355000, v12, OS_LOG_TYPE_ERROR, "No donation method implemented for %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (id)_baseSampleFromEvent:(id)a3 matcher:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 identifierPropertyName];
  char v8 = [v5 propertyForKey:v7];

  uint64_t v9 = [v6 subsetPropertyName];
  id v10 = [v6 subsetPropertyValue];

  if (v9)
  {
    uint64_t v11 = [v5 propertyForKey:v9];

    id v10 = (void *)v11;
  }
  id v12 = [CPAnalyticsBiomeBaseSample alloc];
  int v13 = [v5 timestamp];
  v14 = [(CPAnalyticsBiomeBaseSample *)v12 initWithIdentifier:v8 andDate:v13 forSubset:v10];

  return v14;
}

- (void)processEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CPAnalyticsBiomeDestination *)self eventMatchers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
      if ([v10 doesMatch:v4])
      {
        [(CPAnalyticsBiomeDestination *)self _sendBiomeEvent:v4 matcher:v10];
        if (![v10 matchNextEvent]) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_updateWithConfig:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = [a3 objectForKeyedSubscript:@"events"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [[CPAnalyticsCoreDuetEventMatcher alloc] initWithConfig:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
          if (v10) {
            [(NSMutableArray *)self->_eventMatchers addObject:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (CPAnalyticsBiomeDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPAnalyticsBiomeDestination;
  uint64_t v6 = [(CPAnalyticsBiomeDestination *)&v10 init];
  if (v6)
  {
    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    eventMatchers = v6->_eventMatchers;
    v6->_eventMatchers = v7;

    [(CPAnalyticsBiomeDestination *)v6 _updateWithConfig:v5];
  }

  return v6;
}

@end