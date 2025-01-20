@interface MapsSuggestionsLocationChangedTrigger
- (MapsSuggestionsLocationChangedTrigger)initWithLocationUpdater:(id)a3;
- (MapsSuggestionsLocationChangedTrigger)initWithLocationUpdater:(id)a3 forcingLocationUpdater:(id)a4;
- (uint64_t)stopForcingUpdate;
- (void)_cancelLocationForceUpdate;
- (void)_forceLocationUpdate;
- (void)_kickForceUpdateWithTime:(void *)a1;
- (void)changeMinDistance:(double)a3;
- (void)didUpdateLocation:(id)a3;
- (void)restartWithUpdateTime:(double)a3;
- (void)startWithMinimumDistance:(double)a3;
- (void)startWithMinimumUpdateTime:(double)a3 minimumDistance:(double)a4;
- (void)stop;
@end

@implementation MapsSuggestionsLocationChangedTrigger

- (MapsSuggestionsLocationChangedTrigger)initWithLocationUpdater:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)MapsSuggestionsLocationChangedTrigger;
    v6 = [(MapsSuggestionsBaseTrigger *)&v11 initWithName:@"MapsSuggestionsLocationChangedTrigger"];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_locationUpdater, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLocationChangedTrigger.m";
      __int16 v14 = 1024;
      int v15 = 68;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsLocationChangedTrigger initWithLocationUpdater:]";
      __int16 v18 = 2082;
      v19 = "nil == (locationUpdater)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location updater", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

- (MapsSuggestionsLocationChangedTrigger)initWithLocationUpdater:(id)a3 forcingLocationUpdater:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v15 = 136446978;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLocationChangedTrigger.m";
    __int16 v17 = 1024;
    int v18 = 80;
    __int16 v19 = 2082;
    uint64_t v20 = "-[MapsSuggestionsLocationChangedTrigger initWithLocationUpdater:forcingLocationUpdater:]";
    __int16 v21 = 2082;
    v22 = "nil == (locationUpdater)";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location updater";
LABEL_13:
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x26u);
    goto LABEL_14;
  }
  if (!v7)
  {
    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v15 = 136446978;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLocationChangedTrigger.m";
    __int16 v17 = 1024;
    int v18 = 81;
    __int16 v19 = 2082;
    uint64_t v20 = "-[MapsSuggestionsLocationChangedTrigger initWithLocationUpdater:forcingLocationUpdater:]";
    __int16 v21 = 2082;
    v22 = "nil == (forcingLocationUpdater)";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location updater or use initWithLocationUpdater:";
    goto LABEL_13;
  }
  if (v6 == v7)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLocationChangedTrigger.m";
      __int16 v17 = 1024;
      int v18 = 82;
      __int16 v19 = 2082;
      uint64_t v20 = "-[MapsSuggestionsLocationChangedTrigger initWithLocationUpdater:forcingLocationUpdater:]";
      __int16 v21 = 2082;
      v22 = "locationUpdater == forcingLocationUpdater";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. The location updates cannot be the same (because we will s"
            "top only one of them)";
      goto LABEL_13;
    }
LABEL_14:

    objc_super v11 = 0;
    goto LABEL_15;
  }
  v9 = [(MapsSuggestionsLocationChangedTrigger *)self initWithLocationUpdater:v6];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_forcingLocationUpdater, a4);
  }
  self = v10;
  objc_super v11 = self;
LABEL_15:

  return v11;
}

- (void)_kickForceUpdateWithTime:(void *)a1
{
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    if (*((void *)v3 + 9))
    {
      if (a2 == 0.0)
      {
        v4 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "Trying to init location Force Update with time 0.0!", (uint8_t *)buf, 2u);
        }
      }
      else
      {
        if (*((double *)v3 + 8) != a2 || (v9 = (void *)*((void *)v3 + 7)) == 0)
        {
          objc_initWeak(buf, v3);
          *((double *)v3 + 8) = a2;
          id v5 = [MapsSuggestionsCanKicker alloc];
          id v6 = [v3 dispatchQueue];
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __66__MapsSuggestionsLocationChangedTrigger__kickForceUpdateWithTime___block_invoke;
          v10[3] = &unk_1E5CB8058;
          objc_copyWeak(&v11, buf);
          uint64_t v7 = [(MapsSuggestionsCanKicker *)v5 initWithName:@"LocationForceUpdateCanKicker" time:v6 queue:v10 block:a2];
          v8 = (void *)*((void *)v3 + 7);
          *((void *)v3 + 7) = v7;

          objc_destroyWeak(&v11);
          objc_destroyWeak(buf);
          v9 = (void *)*((void *)v3 + 7);
        }
        [v9 kickCanBySameTime];
      }
    }
    else
    {
      -[MapsSuggestionsLocationChangedTrigger _cancelLocationForceUpdate](v3);
    }
    objc_sync_exit(v3);
  }
}

- (void)_cancelLocationForceUpdate
{
  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    [obj[7] cancel];
    id v1 = obj[7];
    obj[7] = 0;

    objc_sync_exit(obj);
  }
}

void __66__MapsSuggestionsLocationChangedTrigger__kickForceUpdateWithTime___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _forceLocationUpdate];
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsLocationChangedTrigger.m";
      __int16 v6 = 1026;
      int v7 = 108;
      __int16 v8 = 2082;
      v9 = "-[MapsSuggestionsLocationChangedTrigger _kickForceUpdateWithTime:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)_forceLocationUpdate
{
  id v2 = (id)[(MapsSuggestionsLocationUpdater *)self->_forcingLocationUpdater startLocationUpdatesForDelegate:self];
}

- (void)changeMinDistance:(double)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = self;
  objc_sync_enter(v4);
  v4->_double minDistance = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    double minDistance = v4->_minDistance;
    int v7 = 134217984;
    double v8 = minDistance;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Minimum distance set to %f", (uint8_t *)&v7, 0xCu);
  }

  objc_sync_exit(v4);
}

- (void)restartWithUpdateTime:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    double v7 = a3;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "restartWithUpdateTime: %f", (uint8_t *)&v6, 0xCu);
  }

  -[MapsSuggestionsLocationChangedTrigger _kickForceUpdateWithTime:](self, a3);
}

- (uint64_t)stopForcingUpdate
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "Stopping forcing LocationUpdater", v3, 2u);
    }

    return [*(id *)(v1 + 72) stopLocationUpdatesForDelegate:v1];
  }
  return result;
}

- (void)startWithMinimumUpdateTime:(double)a3 minimumDistance:(double)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134218240;
    double v12 = a3;
    __int16 v13 = 2048;
    double v14 = a4;
    _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "Starting Trigger with Time:%f Distance:%f", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v8 = self;
  objc_sync_enter(v8);
  GEOConfigGetDouble();
  if (v9 > a3)
  {
    GEOConfigGetDouble();
    a3 = v10;
  }
  objc_sync_exit(v8);

  [(MapsSuggestionsLocationChangedTrigger *)v8 startWithMinimumDistance:a4];
  -[MapsSuggestionsLocationChangedTrigger _kickForceUpdateWithTime:](v8, a3);
}

- (void)startWithMinimumDistance:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    double v13 = a3;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Starting Trigger with Distance:%f", (uint8_t *)&v12, 0xCu);
  }

  int v6 = self;
  objc_sync_enter(v6);
  v6->_double minDistance = a3;
  GEOConfigGetDouble();
  if (v7 > a3)
  {
    GEOConfigGetDouble();
    v6->_double minDistance = v8;
  }
  uint64_t v9 = MapsSuggestionsCurrentBestLocation();
  previousLocation = v6->_previousLocation;
  v6->_previousLocation = (CLLocation *)v9;

  objc_sync_exit(v6);
  id v11 = (id)[(MapsSuggestionsLocationUpdater *)v6->_locationUpdater startLocationUpdatesForDelegate:v6];
}

- (void)stop
{
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Stopping Trigger", v4, 2u);
  }

  -[MapsSuggestionsLocationChangedTrigger stopForcingUpdate]((uint64_t)self);
  -[MapsSuggestionsLocationChangedTrigger _cancelLocationForceUpdate](self);
  [(MapsSuggestionsLocationUpdater *)self->_locationUpdater stopLocationUpdatesForDelegate:self];
}

- (void)didUpdateLocation:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    -[MapsSuggestionsLocationChangedTrigger stopForcingUpdate]((uint64_t)self);
    -[MapsSuggestionsLocationChangedTrigger _kickForceUpdateWithTime:](self, self->_locationForceUpdateTime);
    int v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      [v5 coordinate];
      uint64_t v8 = v7;
      [v5 coordinate];
      int v14 = 134218240;
      uint64_t v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "we received location <%+.6f,%+.6f>", (uint8_t *)&v14, 0x16u);
    }

    double v10 = self;
    objc_sync_enter(v10);
    previousLocation = v10->_previousLocation;
    if (previousLocation
      && ([(CLLocation *)previousLocation distanceFromLocation:v5], v12 < v10->_minDistance))
    {
      objc_sync_exit(v10);
    }
    else
    {
      double v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "Trigger Observers", (uint8_t *)&v14, 2u);
      }

      objc_storeStrong((id *)&v10->_previousLocation, a3);
      objc_sync_exit(v10);

      [(MapsSuggestionsBaseTrigger *)v10 triggerMyObservers];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcingLocationUpdater, 0);
  objc_storeStrong((id *)&self->_locationForceUpdateCanKicker, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
  objc_storeStrong((id *)&self->_previousLocation, 0);
}

@end