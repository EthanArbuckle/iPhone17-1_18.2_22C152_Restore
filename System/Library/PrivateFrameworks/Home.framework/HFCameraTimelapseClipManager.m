@interface HFCameraTimelapseClipManager
+ (id)sharedManager;
- (HFCameraTimelapseClipManager)init;
- (HMCameraClip)oldestFetchedClip;
- (HMCameraClipManager)clipManager;
- (NSArray)timelapseClips;
- (NSDate)oldestValidDateForTimeline;
- (OS_dispatch_queue)updateQueue;
- (id)timelapseClipPositionForDate:(id)a3 inHighQualityClip:(id)a4;
- (id)timelapseClipPositionForDate:(id)a3 inHighQualityClip:(id)a4 scrubbingType:(unint64_t)a5;
- (id)timelapseURLForTimelapseClip:(id)a3;
- (void)clipManager:(id)a3 didUpdateClips:(id)a4;
- (void)fetchClipsFromStartDate:(id)a3 toEndDate:(id)a4 limit:(unint64_t)a5;
- (void)fetchTimelapseClips;
- (void)setClipManager:(id)a3;
- (void)setOldestFetchedClip:(id)a3;
- (void)setOldestValidDateForTimeline:(id)a3;
- (void)setTimelapseClips:(id)a3;
- (void)setUpdateQueue:(id)a3;
@end

@implementation HFCameraTimelapseClipManager

+ (id)sharedManager
{
  if (qword_26AB2F118 != -1) {
    dispatch_once(&qword_26AB2F118, &__block_literal_global_101);
  }
  v2 = (void *)_MergedGlobals_255;
  return v2;
}

uint64_t __45__HFCameraTimelapseClipManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(HFCameraTimelapseClipManager);
  uint64_t v1 = _MergedGlobals_255;
  _MergedGlobals_255 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFCameraTimelapseClipManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)HFCameraTimelapseClipManager;
  v2 = [(HFCameraTimelapseClipManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF8C0] array];
    timelapseClips = v2->_timelapseClips;
    v2->_timelapseClips = (NSArray *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.home.HFCameraTimelapseClipManager.updateQueue", 0);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)setTimelapseClips:(id)a3
{
  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  timelapseClips = self->_timelapseClips;
  self->_timelapseClips = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)timelapseClips
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_timelapseClips;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)timelapseClipPositionForDate:(id)a3 inHighQualityClip:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(HFCameraTimelapseClipManager *)self timelapseClips];
  v9 = +[HFCameraPlaybackEngine findClipPositionForDate:v7 inEvents:v8 options:0];

  v10 = HFLogForCategory(0x1DuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412546;
    v13 = v9;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_debug_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEBUG, "Found clipPosition:%@ for highQualityClip:%@", (uint8_t *)&v12, 0x16u);
  }

  return v9;
}

- (id)timelapseURLForTimelapseClip:(id)a3
{
  return +[HFCameraUtilities videoDestinationURLForCameraClip:a3];
}

- (id)timelapseClipPositionForDate:(id)a3 inHighQualityClip:(id)a4 scrubbingType:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  v9 = [(HFCameraTimelapseClipManager *)self timelapseClips];
  v10 = +[HFCameraPlaybackEngine findClipPositionForDate:v8 inEvents:v9 options:0];

  v11 = HFLogForCategory(0x1DuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412546;
    __int16 v14 = v10;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_debug_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEBUG, "Found clipPosition:%@ for highQualityClip:%@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (void)setClipManager:(id)a3
{
  p_clipManager = &self->_clipManager;
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_clipManager);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_clipManager);
    [v6 removeObserver:self];
  }
  id v7 = [MEMORY[0x263EFF8C0] array];
  [(HFCameraTimelapseClipManager *)self setTimelapseClips:v7];

  id v8 = objc_storeWeak((id *)p_clipManager, obj);
  id v9 = v8;
  if (obj)
  {
    id v10 = objc_loadWeakRetained((id *)p_clipManager);
    v11 = [(HFCameraTimelapseClipManager *)self updateQueue];
    [v10 addObserver:self queue:v11];

    [(HFCameraTimelapseClipManager *)self fetchTimelapseClips];
  }
}

- (void)fetchTimelapseClips
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = HFLogForCategory(0x1DuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(HFCameraTimelapseClipManager *)self timelapseClips];
    int v8 = 134217984;
    uint64_t v9 = [v4 count];
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Begin timelapse clip fetching with cached count:%ld", (uint8_t *)&v8, 0xCu);
  }
  dispatch_queue_t v5 = [MEMORY[0x263EFF910] date];
  id v6 = [MEMORY[0x263EFF910] dateWithTimeInterval:v5 sinceDate:-864000.0];
  [(HFCameraTimelapseClipManager *)self setOldestValidDateForTimeline:v6];

  id v7 = [(HFCameraTimelapseClipManager *)self oldestValidDateForTimeline];
  [(HFCameraTimelapseClipManager *)self fetchClipsFromStartDate:v7 toEndDate:v5 limit:100000];
}

- (void)fetchClipsFromStartDate:(id)a3 toEndDate:(id)a4 limit:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v8 endDate:v9];
  v11 = HFLogForCategory(0x1DuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [(HFCameraTimelapseClipManager *)self oldestFetchedClip];
    *(_DWORD *)buf = 138412802;
    v19 = v10;
    __int16 v20 = 2048;
    unint64_t v21 = a5;
    __int16 v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Fetching timelapse clips with date interval:%@ limit:%ld oldestClip:%@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  int v13 = [(HFCameraTimelapseClipManager *)self clipManager];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__HFCameraTimelapseClipManager_fetchClipsFromStartDate_toEndDate_limit___block_invoke;
  v15[3] = &unk_264094C70;
  objc_copyWeak(v17, (id *)buf);
  id v14 = v8;
  id v16 = v14;
  v17[1] = (id)a5;
  [v13 fetchClipsWithDateInterval:v10 quality:1 limit:a5 shouldOrderAscending:1 completion:v15];

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
}

void __72__HFCameraTimelapseClipManager_fetchClipsFromStartDate_toEndDate_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = HFLogForCategory(0x1DuLL);
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138412290;
      uint64_t v25 = (uint64_t)v6;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "Timelapse clip fetch error:%@", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 134217984;
      uint64_t v25 = [v5 count];
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Returned timelapse clips count %ld", (uint8_t *)&v24, 0xCu);
    }

    if (v5)
    {
      uint64_t v10 = [MEMORY[0x263EFF980] arrayWithArray:v5];
      v11 = [WeakRetained timelapseClips];
      [v10 addObjectsFromArray:v11];

      [WeakRetained setTimelapseClips:v10];
    }
    id v9 = [v5 firstObject];
    [WeakRetained setOldestFetchedClip:v9];
  }

  int v12 = [WeakRetained oldestValidDateForTimeline];
  [v12 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v14 = v13;

  if (v14 >= 0.0)
  {
    v19 = HFLogForCategory(0x1DuLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = [WeakRetained timelapseClips];
      uint64_t v23 = [v22 count];
      int v24 = 134217984;
      uint64_t v25 = v23;
      _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "Finished fetching timelapse clips with count:%ld", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    __int16 v15 = [WeakRetained oldestFetchedClip];

    id v16 = (void *)MEMORY[0x263EFF910];
    if (v15)
    {
      uint64_t v17 = [WeakRetained oldestFetchedClip];
      v18 = [v17 startDate];
      v19 = [v16 dateWithTimeInterval:v18 sinceDate:-86400.0];

      __int16 v20 = [WeakRetained oldestFetchedClip];
      unint64_t v21 = [v20 startDate];
      [WeakRetained fetchClipsFromStartDate:v19 toEndDate:v21 limit:*(void *)(a1 + 48)];
    }
    else
    {
      v19 = [MEMORY[0x263EFF910] dateWithTimeInterval:*(void *)(a1 + 32) sinceDate:-86400.0];
      [WeakRetained fetchClipsFromStartDate:v19 toEndDate:*(void *)(a1 + 32) limit:*(void *)(a1 + 48)];
    }
  }
}

- (void)clipManager:(id)a3 didUpdateClips:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (!+[HFUtilities isInternalTest])
  {
    id v6 = [(HFCameraTimelapseClipManager *)self updateQueue];
    dispatch_assert_queue_V2(v6);
  }
  id v7 = objc_msgSend(v5, "na_map:", &__block_literal_global_12_3);
  if ([v7 count])
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    id v9 = [(HFCameraTimelapseClipManager *)self timelapseClips];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v46 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          __int16 v15 = [v14 uniqueIdentifier];
          [v8 setObject:v14 forKeyedSubscript:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v46 count:16];
      }
      while (v11);
    }
    v30 = self;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v45 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v16);
          }
          unint64_t v21 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          __int16 v22 = [v21 uniqueIdentifier];
          [v8 setObject:v21 forKeyedSubscript:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v45 count:16];
      }
      while (v18);
    }

    uint64_t v23 = [v8 allValues];
    int v24 = [v23 sortedArrayUsingComparator:&__block_literal_global_16_3];

    uint64_t v25 = [v24 lastObject];
    uint64_t v26 = HFLogForCategory(0x1DuLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [v25 uniqueIdentifier];
      v28 = [v25 startDate];
      [v25 duration];
      *(_DWORD *)buf = 138412802;
      v40 = v27;
      __int16 v41 = 2112;
      v42 = v28;
      __int16 v43 = 2048;
      uint64_t v44 = v29;
      _os_log_impl(&dword_20B986000, v26, OS_LOG_TYPE_DEFAULT, "Last timelapse clip after update: %@ startDate:%@ duration:%.2f", buf, 0x20u);
    }
    [(HFCameraTimelapseClipManager *)v30 setTimelapseClips:v24];
  }
}

id __59__HFCameraTimelapseClipManager_clipManager_didUpdateClips___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 quality] == 1) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t __59__HFCameraTimelapseClipManager_clipManager_didUpdateClips___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 dateOfOccurrence];
  id v6 = [v4 dateOfOccurrence];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (HMCameraClipManager)clipManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipManager);
  return (HMCameraClipManager *)WeakRetained;
}

- (HMCameraClip)oldestFetchedClip
{
  return self->_oldestFetchedClip;
}

- (void)setOldestFetchedClip:(id)a3
{
}

- (NSDate)oldestValidDateForTimeline
{
  return self->_oldestValidDateForTimeline;
}

- (void)setOldestValidDateForTimeline:(id)a3
{
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_oldestValidDateForTimeline, 0);
  objc_storeStrong((id *)&self->_oldestFetchedClip, 0);
  objc_destroyWeak((id *)&self->_clipManager);
  objc_storeStrong((id *)&self->_timelapseClips, 0);
}

@end