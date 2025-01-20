@interface ATXHeroPoiManager
- (id)cachedPoiCategory;
- (id)currentPoiCategory;
- (id)mostRecentHighestRankedPoiCategory:(id)a3;
- (id)poiCategoryEventsWithStreamPublisher:(id)a3;
- (id)poiCategoryPublisherBookmark;
- (id)poiCategoryStream;
- (id)poiCategoryStreamPublisher;
- (void)donateHeroPoiPredictions:(id)a3;
- (void)donatePoiCategoryToBiome:(id)a3 rank:(unint64_t)a4 date:(id)a5;
- (void)logCompletion:(id)a3;
@end

@implementation ATXHeroPoiManager

- (id)poiCategoryStream
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_poiCategoryStream && ([MEMORY[0x1E4F93B10] isClassCLocked] & 1) == 0)
  {
    v3 = BiomeLibrary();
    v4 = [v3 Location];
    v5 = [v4 PointOfInterest];
    uint64_t v6 = [v5 Category];
    poiCategoryStream = v2->_poiCategoryStream;
    v2->_poiCategoryStream = (BMStream *)v6;
  }
  v8 = v2->_poiCategoryStream;
  objc_sync_exit(v2);

  return v8;
}

- (void)donateHeroPoiPredictions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = __atxlog_handle_hero();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134217984;
    double v23 = COERCE_DOUBLE([v4 count]);
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Received %lu Hero POI predictions.", (uint8_t *)&v22, 0xCu);
  }

  uint64_t v6 = objc_opt_new();
  if ([v4 count])
  {
    v7 = [MEMORY[0x1E4F1C9C8] now];
    v8 = [MEMORY[0x1E4F935D0] sharedInstance];
    v9 = [v8 getCurrentPreciseLocation];

    v10 = __atxlog_handle_hero();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v7 timeIntervalSinceNow];
      int v22 = 134217984;
      double v23 = -v11;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "Took %f seconds to fetch precise location", (uint8_t *)&v22, 0xCu);
    }

    if (v9)
    {
      v12 = +[ATXHeroDataServerHelper inRadiusPredictionsFrom:v4 currentLocation:v9];

      v4 = __atxlog_handle_hero();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v12 count];
        int v22 = 134217984;
        double v23 = *(double *)&v13;
        _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Left with %lu hero poi predictions after removing predictions based on gps location.", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      v14 = __atxlog_handle_hero();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ATXHeroAppManager donateHeroAppPredictions:](v14);
      }

      v12 = objc_opt_new();
    }

    v4 = v12;
  }
  if ([v4 count])
  {
    if ([v4 count])
    {
      unint64_t v15 = 0;
      do
      {
        v16 = [v4 objectAtIndexedSubscript:v15];
        v17 = [v16 poiCategory];

        if ([v17 length])
        {
          [(ATXHeroPoiManager *)self donatePoiCategoryToBiome:v17 rank:v15 date:v6];
        }
        else
        {
          v18 = __atxlog_handle_hero();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            [(ATXHeroPoiManager *)(uint8_t *)&v22 donateHeroPoiPredictions:v18];
          }
        }
        ++v15;
      }
      while (v15 < [v4 count]);
    }
  }
  else
  {
    v19 = __atxlog_handle_hero();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "Hero POI predictions count is zero. Donating ATXDefaultHeroPOICategory to Biome", (uint8_t *)&v22, 2u);
    }

    v20 = +[ATXHeroAndClipConstants sharedInstance];
    v21 = [v20 defaultHeroPOICategory];
    [(ATXHeroPoiManager *)self donatePoiCategoryToBiome:v21 rank:0 date:v6];
  }
}

- (void)donatePoiCategoryToBiome:(id)a3 rank:(unint64_t)a4 date:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v8 = (objc_class *)MEMORY[0x1E4F4FEA8];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 alloc];
  v12 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v13 = (void *)[v11 initWithPoiCategory:v10 rank:v12 timestamp:v9];

  v14 = __atxlog_handle_hero();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v13;
    _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "Sending event to Biome: %@.", (uint8_t *)&v17, 0xCu);
  }

  unint64_t v15 = [(ATXHeroPoiManager *)self poiCategoryStream];
  v16 = [v15 source];
  [v16 sendEvent:v13];
}

- (void)logCompletion:(id)a3
{
  id v3 = a3;
  if ([v3 state])
  {
    v4 = __atxlog_handle_hero();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ATXHeroPoiManager logCompletion:](v3, v4);
    }
  }
}

- (id)mostRecentHighestRankedPoiCategory:(id)a3
{
  id v3 = a3;
  v4 = [v3 lastObject];
  v5 = [v4 eventBody];
  uint64_t v6 = [v5 timestamp];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  id v9 = +[ATXHeroAndClipConstants sharedInstance];
  id v10 = [v9 defaultHeroPOICategory];

  uint64_t v11 = [v3 count];
  if (v11 >= 1)
  {
    uint64_t v12 = v11 + 1;
    while (1)
    {
      uint64_t v13 = [v3 objectAtIndex:v12 - 2];
      v14 = [v13 eventBody];
      unint64_t v15 = [v14 timestamp];
      [v15 timeIntervalSinceReferenceDate];
      double v17 = v16;

      if (v17 < v8) {
        break;
      }
      v18 = [v13 eventBody];
      int v19 = [v18 rank];

      if (!v19)
      {
        v20 = [v13 eventBody];
        uint64_t v21 = [v20 poiCategory];

        id v10 = (void *)v21;
        break;
      }

      if ((unint64_t)--v12 <= 1) {
        goto LABEL_9;
      }
    }
  }
LABEL_9:

  return v10;
}

- (id)cachedPoiCategory
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F936E0]];
  v4 = [v3 objectForKey:@"currentPoiCategory"];
  if (!v4)
  {
    v5 = +[ATXHeroAndClipConstants sharedInstance];
    v4 = [v5 defaultHeroPOICategory];
  }
  return v4;
}

- (id)currentPoiCategory
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(ATXHeroPoiManager *)self poiCategoryStreamPublisher];
  v4 = [(ATXHeroPoiManager *)self poiCategoryEventsWithStreamPublisher:v3];
  v5 = [(ATXHeroPoiManager *)self cachedPoiCategory];
  if ([v4 count])
  {
    uint64_t v6 = [(ATXHeroPoiManager *)self mostRecentHighestRankedPoiCategory:v4];

    id v7 = objc_alloc(MEMORY[0x1E4F1CB18]);
    double v8 = (void *)[v7 initWithSuiteName:*MEMORY[0x1E4F936E0]];
    [v8 setObject:v6 forKey:@"currentPoiCategory"];
    id v9 = v6;
  }
  else
  {
    id v10 = __atxlog_handle_hero();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218242;
      uint64_t v13 = 14400;
      __int16 v14 = 2112;
      unint64_t v15 = v5;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "No new POI category received from poiCategory stream since the last saved bookmark within the past %lu seconds, returning cached POI category: %@", (uint8_t *)&v12, 0x16u);
    }

    id v9 = v5;
  }

  return v9;
}

- (id)poiCategoryStreamPublisher
{
  CFAbsoluteTime v3 = CFAbsoluteTimeGetCurrent() + -14400.0;
  v4 = [(ATXHeroPoiManager *)self poiCategoryStream];
  v5 = [NSNumber numberWithDouble:v3];
  uint64_t v6 = objc_msgSend(v4, "atx_publisherFromStartTime:", v5);

  return v6;
}

- (id)poiCategoryPublisherBookmark
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB10]);
  CFAbsoluteTime v3 = [MEMORY[0x1E4F4B650] bookmarksPathFile:@"poiCategoryPublisherBookmarkURL"];
  v4 = (void *)[v2 initFileURLWithPath:v3];

  v5 = (void *)MEMORY[0x1E4F4B618];
  uint64_t v6 = [NSNumber numberWithUnsignedInt:1];
  id v7 = [v5 bookmarkFromURLPath:v4 maxFileSize:1000000 versionNumber:v6];

  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F4B618]);
    id v9 = [NSNumber numberWithUnsignedInt:1];
    id v7 = (void *)[v8 initWithURLPath:v4 versionNumber:v9 bookmark:0 metadata:0];
  }
  return v7;
}

- (id)poiCategoryEventsWithStreamPublisher:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__87;
  int v22 = __Block_byref_object_dispose__87;
  id v23 = [(ATXHeroPoiManager *)self poiCategoryPublisherBookmark];
  v5 = objc_opt_new();
  uint64_t v6 = [(id)v19[5] bookmark];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__ATXHeroPoiManager_poiCategoryEventsWithStreamPublisher___block_invoke;
  v17[3] = &unk_1E68B4370;
  v17[4] = self;
  v17[5] = &v18;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__ATXHeroPoiManager_poiCategoryEventsWithStreamPublisher___block_invoke_2;
  v15[3] = &unk_1E68ABB70;
  id v7 = v5;
  id v16 = v7;
  id v8 = (id)[v4 sinkWithBookmark:v6 completion:v17 receiveInput:v15];

  id v9 = (void *)v19[5];
  id v14 = 0;
  [v9 saveBookmarkWithError:&v14];
  id v10 = v14;
  if (v10)
  {
    uint64_t v11 = __atxlog_handle_hero();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXHeroPoiManager poiCategoryEventsWithStreamPublisher:]((uint64_t)v10, v11);
    }
  }
  id v12 = v7;

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __58__ATXHeroPoiManager_poiCategoryEventsWithStreamPublisher___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 logCompletion:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setBookmark:v6];
}

uint64_t __58__ATXHeroPoiManager_poiCategoryEventsWithStreamPublisher___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void).cxx_destruct
{
}

- (void)donateHeroPoiPredictions:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "NIL POI category received in Hero POI Manager", buf, 2u);
}

- (void)logCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  CFAbsoluteTime v3 = [a1 error];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Error in receiving events from POI category stream: %@", (uint8_t *)&v4, 0xCu);
}

- (void)poiCategoryEventsWithStreamPublisher:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Unable to save POI category bookmark due to : %@", (uint8_t *)&v2, 0xCu);
}

@end