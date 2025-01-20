@interface GEOTransitRouteUpdater
- (BOOL)isActive;
- (GEOTransitRouteUpdater)initWithDelegate:(id)a3 andInitialTTL:(double)a4;
- (GEOTransitRouteUpdaterDelegate)delegate;
- (NSSet)requests;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setRequests:(id)a3;
@end

@implementation GEOTransitRouteUpdater

- (GEOTransitRouteUpdater)initWithDelegate:(id)a3 andInitialTTL:(double)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: delegate != ((void *)0)", buf, 2u);
    }
    v8 = 0;
    goto LABEL_6;
  }
  v11.receiver = self;
  v11.super_class = (Class)GEOTransitRouteUpdater;
  v7 = [(GEOTransitRouteUpdater *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v13 = a4;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "setting initialTTL to %f", buf, 0xCu);
    }

    self = +[GEOTransitRouteUpdateRequester sharedInstance];
    [(GEOTransitRouteUpdater *)self setInitialDelay:a4];
LABEL_6:
  }
  return v8;
}

- (void)dealloc
{
  v3 = +[GEOTransitRouteUpdateRequester sharedInstance];
  [v3 unregisterRouteUpdater:self];

  v4.receiver = self;
  v4.super_class = (Class)GEOTransitRouteUpdater;
  [(GEOTransitRouteUpdater *)&v4 dealloc];
}

- (void)setRequests:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (NSSet *)a3;
  v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138478083;
    objc_super v11 = self;
    __int16 v12 = 2113;
    double v13 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "setting requests for Updater %{private}@ to %{private}@", (uint8_t *)&v10, 0x16u);
  }

  id v6 = +[GEOTransitRouteUpdateRequester sharedInstance];
  v7 = v6;
  if (self->_active)
  {
    [v6 unregisterRouteUpdater:self];
    requests = self->_requests;
    self->_requests = v4;

    [v7 registerRouteUpdater:self];
  }
  else
  {
    v9 = self->_requests;
    self->_requests = v4;
  }
}

- (void)setActive:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = "inactive";
      if (v3) {
        id v6 = "active";
      }
      int v9 = 138478083;
      int v10 = self;
      __int16 v11 = 2080;
      __int16 v12 = v6;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "setting Updater %{private}@ to %s", (uint8_t *)&v9, 0x16u);
    }

    v7 = +[GEOTransitRouteUpdateRequester sharedInstance];
    v8 = v7;
    self->_active = v3;
    if (v3) {
      [v7 registerRouteUpdater:self];
    }
    else {
      [v7 unregisterRouteUpdater:self];
    }
  }
}

- (GEOTransitRouteUpdaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOTransitRouteUpdaterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)requests
{
  return self->_requests;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end