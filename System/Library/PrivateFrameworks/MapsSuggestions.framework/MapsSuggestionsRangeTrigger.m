@interface MapsSuggestionsRangeTrigger
- (BOOL)withinRange:(id)a3;
- (MapsSuggestionsRangeTrigger)initWithLocation:(id)a3 radius:(double)a4 onEnter:(BOOL)a5 minUpdateTime:(double)a6 locationUpdater:(id)a7 forcingLocationUpdater:(id)a8;
- (void)didAddFirstObserver;
- (void)didUpdateLocation:(id)a3;
- (void)stop;
@end

@implementation MapsSuggestionsRangeTrigger

- (MapsSuggestionsRangeTrigger)initWithLocation:(id)a3 radius:(double)a4 onEnter:(BOOL)a5 minUpdateTime:(double)a6 locationUpdater:(id)a7 forcingLocationUpdater:(id)a8
{
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)MapsSuggestionsRangeTrigger;
  v18 = [(MapsSuggestionsBaseTrigger *)&v22 initWithName:@"MapsSuggestionsRangeTrigger"];
  if (v18)
  {
    v19 = [[MapsSuggestionsQueue alloc] initSerialQueueWithName:@"MapsSuggestionsRangeTriggerQueue"];
    queue = v18->_queue;
    v18->_queue = v19;

    objc_storeStrong((id *)&v18->_destinationLocation, a3);
    v18->_radius = a4;
    v18->_onEnter = a5;
    v18->_forceUpdateTime = a6;
    objc_storeStrong((id *)&v18->_locationUpdater, a7);
    objc_storeStrong((id *)&v18->_forcingLocationUpdater, a8);
  }

  return v18;
}

- (void)stop
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__MapsSuggestionsRangeTrigger_stop__block_invoke;
  v4[3] = &unk_1E5CB8058;
  objc_copyWeak(&v5, &location);
  [(MapsSuggestionsQueue *)queue syncBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __35__MapsSuggestionsRangeTrigger_stop__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[10] cancel];
    [v2[8] stopLocationUpdatesForDelegate:v2];
    [v2[9] stopLocationUpdatesForDelegate:v2];
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsRangeTrigger.m";
      __int16 v6 = 1026;
      int v7 = 55;
      __int16 v8 = 2082;
      v9 = "-[MapsSuggestionsRangeTrigger stop]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)didUpdateLocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    [v4 horizontalAccuracy];
    id v4 = v8;
    if (v5 <= 100.0)
    {
      [(MapsSuggestionsCanKicker *)self->_locationForceUpdate kickCanByTime:self->_forceUpdateTime];
      [(MapsSuggestionsLocationUpdater *)self->_forcingLocationUpdater stopLocationUpdatesForDelegate:self];
      BOOL onEnter = self->_onEnter;
      BOOL v7 = onEnter == [(MapsSuggestionsRangeTrigger *)self withinRange:v8];
      id v4 = v8;
      if (v7)
      {
        [(MapsSuggestionsLocationUpdater *)self->_locationUpdater stopLocationUpdatesForDelegate:self];
        [(MapsSuggestionsBaseTrigger *)self triggerMyObservers];
        id v4 = v8;
      }
    }
  }
}

- (BOOL)withinRange:(id)a3
{
  double radius = self->_radius;
  [a3 distanceFromLocation:self->_destinationLocation];
  return radius > v4;
}

- (void)didAddFirstObserver
{
  objc_initWeak(&location, self);
  v3 = [MapsSuggestionsCanKicker alloc];
  double v4 = [(MapsSuggestionsQueue *)self->_queue innerQueue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __50__MapsSuggestionsRangeTrigger_didAddFirstObserver__block_invoke;
  v11 = &unk_1E5CB8058;
  objc_copyWeak(&v12, &location);
  double v5 = [(MapsSuggestionsCanKicker *)v3 initWithName:@"MapsSuggestionsRangeTriggerCanKicker" queue:v4 block:&v8];
  locationForceUpdate = self->_locationForceUpdate;
  self->_locationForceUpdate = v5;

  id v7 = (id)-[MapsSuggestionsLocationUpdater startLocationUpdatesForDelegate:](self->_locationUpdater, "startLocationUpdatesForDelegate:", self, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __50__MapsSuggestionsRangeTrigger_didAddFirstObserver__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (id)[WeakRetained[9] startLocationUpdatesForDelegate:WeakRetained];
    id v4 = (id)[v2[8] startLocationUpdatesForDelegate:v2];
  }
  else
  {
    GEOFindOrCreateLog();
    double v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsRangeTrigger.m";
      __int16 v8 = 1026;
      int v9 = 87;
      __int16 v10 = 2082;
      v11 = "-[MapsSuggestionsRangeTrigger didAddFirstObserver]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationForceUpdate, 0);
  objc_storeStrong((id *)&self->_forcingLocationUpdater, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);
}

@end