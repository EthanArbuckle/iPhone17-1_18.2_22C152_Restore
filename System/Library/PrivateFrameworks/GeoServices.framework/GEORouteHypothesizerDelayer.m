@interface GEORouteHypothesizerDelayer
+ (void)checkin;
- (GEORouteHypothesizerDelayer)init;
- (void)_setNextHypothesizer:(id)a3;
- (void)_startValidHypothesizers:(id)a3;
- (void)dealloc;
- (void)delayStartOfHypothesizer:(id)a3;
@end

@implementation GEORouteHypothesizerDelayer

+ (void)checkin
{
  if (BackgroundSystemTasksLibraryCore() && checkin_onceToken != -1)
  {
    dispatch_once(&checkin_onceToken, &__block_literal_global_46);
  }
}

void __38__GEORouteHypothesizerDelayer_checkin__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = [getBGSystemTaskSchedulerClass() sharedScheduler];
  uint64_t v3 = 0;
  char v1 = [v0 cancelTaskRequestWithIdentifier:@"com.apple.navd.delayHypothesisTask" error:&v3];

  if ((v1 & 1) == 0)
  {
    v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v5 = @"com.apple.navd.delayHypothesisTask";
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_ERROR, "Unable to cancel task request for %@ ", buf, 0xCu);
    }
  }
}

- (GEORouteHypothesizerDelayer)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)GEORouteHypothesizerDelayer;
  v2 = [(GEORouteHypothesizerDelayer *)&v13 init];
  if (v2)
  {
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1D4C8] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E4F1D4C8];
    *(_OWORD *)&callBacks.release = v3;
    callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))GEORouteHypothesizerDelayerCompare;
    v2->_minHeap = CFBinaryHeapCreate(0, 0, &callBacks, 0);
    uint64_t v4 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v4;

    if (BackgroundSystemTasksLibraryCore())
    {
      uint64_t v6 = [getBGSystemTaskSchedulerClass() sharedScheduler];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __35__GEORouteHypothesizerDelayer_init__block_invoke;
      v10[3] = &unk_1E53DED08;
      v11 = v2;
      char v7 = [v6 registerForTaskWithIdentifier:@"com.apple.navd.delayHypothesisTask" usingQueue:0 launchHandler:v10];

      if ((v7 & 1) == 0)
      {
        v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v15 = @"com.apple.navd.delayHypothesisTask";
          _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Failed to register %@", buf, 0xCu);
        }
      }
    }
  }
  return v2;
}

uint64_t __35__GEORouteHypothesizerDelayer_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _startValidHypothesizers:a2];
}

- (void)_startValidHypothesizers:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

void __56__GEORouteHypothesizerDelayer__startValidHypothesizers___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFIndex Count = CFBinaryHeapGetCount(*(CFBinaryHeapRef *)(*(void *)(a1 + 32) + 8));
  id v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134217984;
    CFIndex v14 = Count;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Delayer fired.  Heap size is %ld", (uint8_t *)&v13, 0xCu);
  }

  if (Count)
  {
    id v4 = CFBinaryHeapGetMinimum(*(CFBinaryHeapRef *)(*(void *)(a1 + 32) + 8));
    v5 = [MEMORY[0x1E4F1C9C8] date];
    [v4 willBeginHypothesizingInterval];
    char v7 = [v5 dateByAddingTimeInterval:-v6];

    if (v4)
    {
      do
      {
        v8 = [v4 plannedDestination];
        v9 = [v8 arrivalDate];
        uint64_t v10 = [v9 compare:v7];

        if (v10 == 1) {
          break;
        }
        [v4 _performDelayedStart];
        CFBinaryHeapRemoveMinimumValue(*(CFBinaryHeapRef *)(*(void *)(a1 + 32) + 8));
        if (!CFBinaryHeapGetCount(*(CFBinaryHeapRef *)(*(void *)(a1 + 32) + 8)))
        {

          id v4 = 0;
          break;
        }
        v11 = objc_retainAutoreleasedReturnValue((id)CFBinaryHeapGetMinimum(*(CFBinaryHeapRef *)(*(void *)(a1 + 32)
                                                                                               + 8)));

        id v4 = v11;
      }
      while (v11);
    }
    [*(id *)(a1 + 40) setTaskCompleted];
    [*(id *)(a1 + 32) _setNextHypothesizer:v4];
    v12 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "Finished after delayer fired.", (uint8_t *)&v13, 2u);
    }
  }
}

- (void)_setNextHypothesizer:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = (GEORouteHypothesizer *)a3;
  if (BackgroundSystemTasksLibraryCore())
  {
    nextHypothesizer = self->_nextHypothesizer;
    p_nextHypothesizer = &self->_nextHypothesizer;
    if (nextHypothesizer != v5)
    {
      objc_storeStrong((id *)p_nextHypothesizer, a3);
      if (*p_nextHypothesizer)
      {
        v8 = [(GEORouteHypothesizer *)*p_nextHypothesizer plannedDestination];
        v9 = [v8 arrivalDate];
        [(GEORouteHypothesizer *)*p_nextHypothesizer willBeginHypothesizingInterval];
        uint64_t v10 = objc_msgSend(v9, "dateByAddingTimeInterval:");
        [v10 timeIntervalSinceNow];
        double v12 = v11 + randomJitterForHypothesisWakeup();

        int v13 = +[GEONavdDefaults sharedInstance];
        [v13 maximumRefreshIntervalLeeway];
        double v15 = v14;

        uint64_t v16 = (void *)[objc_alloc((Class)getBGNonRepeatingSystemTaskRequestClass()) initWithIdentifier:@"com.apple.navd.delayHypothesisTask"];
        [v16 setPriority:2];
        [v16 setRequiresExternalPower:0];
        [v16 setShouldWakeDevice:1];
        [v16 setScheduleAfter:v12];
        [v16 setTrySchedulingBefore:v12 + v15];
        v17 = [getBGSystemTaskSchedulerClass() sharedScheduler];
        id v24 = 0;
        char v18 = [v17 submitTaskRequest:v16 error:&v24];
        v19 = (__CFString *)v24;

        v20 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
        v21 = v20;
        if (v18)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v22 = [(GEORouteHypothesizer *)*p_nextHypothesizer plannedDestination];
            *(_DWORD *)buf = 134218499;
            double v26 = v12;
            __int16 v27 = 2048;
            double v28 = v15;
            __int16 v29 = 2113;
            v30 = v22;
            _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_DEBUG, "Scheduling task with delay %f and leeway %f based on destination %{private}@", buf, 0x20u);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v23 = @"Unknown";
          if (v19) {
            v23 = v19;
          }
          *(_DWORD *)buf = 138412290;
          double v26 = *(double *)&v23;
          _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "Failed to submit nonrepeating task with error: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)delayStartOfHypothesizer:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

void __56__GEORouteHypothesizerDelayer_delayStartOfHypothesizer___block_invoke(uint64_t a1)
{
  char v1 = *(const void **)(a1 + 32);
  if (v1)
  {
    CFBinaryHeapAddValue(*(CFBinaryHeapRef *)(*(void *)(a1 + 40) + 8), v1);
    CFBinaryHeapGetMinimum(*(CFBinaryHeapRef *)(*(void *)(a1 + 40) + 8));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) _setNextHypothesizer:v3];
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (BackgroundSystemTasksLibraryCore())
  {
    id v3 = [getBGSystemTaskSchedulerClass() sharedScheduler];
    char v4 = [v3 deregisterTaskWithIdentifier:@"com.apple.navd.delayHypothesisTask"];

    if ((v4 & 1) == 0)
    {
      v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v8 = @"com.apple.navd.delayHypothesisTask";
        _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Failed to deregister %@", buf, 0xCu);
      }
    }
    CFRelease(self->_minHeap);
  }
  v6.receiver = self;
  v6.super_class = (Class)GEORouteHypothesizerDelayer;
  [(GEORouteHypothesizerDelayer *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolater, 0);

  objc_storeStrong((id *)&self->_nextHypothesizer, 0);
}

@end