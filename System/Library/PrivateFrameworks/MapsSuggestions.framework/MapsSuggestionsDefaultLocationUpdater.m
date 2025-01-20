@interface MapsSuggestionsDefaultLocationUpdater
- (MapsSuggestionsDefaultLocationUpdater)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)onStartImplementation;
- (void)onStopImplementation;
@end

@implementation MapsSuggestionsDefaultLocationUpdater

- (MapsSuggestionsDefaultLocationUpdater)init
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("MapsSuggestionsDefaultLocationUpdaterWorkerQueue", v3);
  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsDefaultLocationUpdater;
  v5 = [(MapsSuggestionsBaseLocationUpdater *)&v7 initWithName:@"MapsSuggestionsDefaultLocationUpdater" queue:v4];

  return v5;
}

- (void)onStartImplementation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    v13 = "-[MapsSuggestionsDefaultLocationUpdater onStartImplementation]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v12, 0xCu);
  }

  dispatch_queue_t v4 = [(MapsSuggestionsBaseLocationUpdater *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  if (self->_locationManager)
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "Already running", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1E600]);
    uint64_t v7 = *MEMORY[0x1E4F64320];
    v8 = [(MapsSuggestionsBaseLocationUpdater *)self dispatchQueue];
    v9 = (CLLocationManager *)[v6 initWithEffectiveBundleIdentifier:v7 delegate:self onQueue:v8];
    locationManager = self->_locationManager;
    self->_locationManager = v9;

    GEOConfigGetDouble();
    -[CLLocationManager setDistanceFilter:](self->_locationManager, "setDistanceFilter:");
    [(CLLocationManager *)self->_locationManager setDesiredAccuracy:*MEMORY[0x1E4F1E6E8]];
    [(CLLocationManager *)self->_locationManager startUpdatingLocation];
    uint64_t v11 = [(CLLocationManager *)self->_locationManager _limitsPrecision];
    [(MapsSuggestionsBaseLocationUpdater *)self considerMyAllowanceAsLimited:v11];
    if (v11) {
      return;
    }
    v5 = [(CLLocationManager *)self->_locationManager location];
    [(MapsSuggestionsBaseLocationUpdater *)self considerMyNewLocation:v5];
  }
}

- (void)onStopImplementation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    v8 = "-[MapsSuggestionsDefaultLocationUpdater onStopImplementation]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v7, 0xCu);
  }

  dispatch_queue_t v4 = [(MapsSuggestionsBaseLocationUpdater *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  locationManager = self->_locationManager;
  if (locationManager)
  {
    [(CLLocationManager *)locationManager stopUpdatingLocation];
    id v6 = self->_locationManager;
    self->_locationManager = 0;
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "DualLocationUpdater update", (uint8_t *)buf, 2u);
    }
  }
  if ([v7 count])
  {
    objc_initWeak(buf, self);
    uint64_t v9 = [(MapsSuggestionsBaseLocationUpdater *)self dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__MapsSuggestionsDefaultLocationUpdater_locationManager_didUpdateLocations___block_invoke;
    block[3] = &unk_1E5CB8080;
    objc_copyWeak(&v13, buf);
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
}

void __76__MapsSuggestionsDefaultLocationUpdater_locationManager_didUpdateLocations___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "considerMyAllowanceAsLimited:", objc_msgSend(a1[4], "_limitsPrecision"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v3 = a1[5];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      id v11 = WeakRetained;
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(char **)(*((void *)&v12 + 1) + 8 * v7);
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          }
          if (s_verbose)
          {
            uint64_t v9 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v18 = v8;
              _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "Considering new location: %@", buf, 0xCu);
            }
          }
          if (MapsSuggestionsIsValidLocation(v8))
          {
            [v11 considerMyNewLocation:v8];
          }
          else
          {
            v10 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v18 = v8;
              _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "Dropping invalid location: %@", buf, 0xCu);
            }
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
      id WeakRetained = v11;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "MapsSuggestionsDefaultLocationUpdater.m";
      __int16 v19 = 1026;
      int v20 = 93;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsDefaultLocationUpdater locationManager:didUpdateLocations:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  uint64_t v5 = [v4 code];
  if (v5 != 3)
  {
    if (v5)
    {
      uint64_t v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = v4;
        uint64_t v7 = "Location error: %@";
        v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        uint32_t v10 = 12;
        goto LABEL_10;
      }
LABEL_11:

      goto LABEL_12;
    }
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    }
    if (s_verbose)
    {
      uint64_t v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        uint64_t v7 = "Location unknown";
        v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
        uint32_t v10 = 2;
LABEL_10:
        _os_log_impl(&dword_1A70DF000, v8, v9, v7, (uint8_t *)&v11, v10);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v4 = [a3 _limitsPrecision];
  [(MapsSuggestionsBaseLocationUpdater *)self considerMyAllowanceAsLimited:v4];
}

- (void).cxx_destruct
{
}

@end