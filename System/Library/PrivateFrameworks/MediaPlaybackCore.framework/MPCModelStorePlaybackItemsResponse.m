@interface MPCModelStorePlaybackItemsResponse
- (BOOL)isFinalResponse;
- (BOOL)isInvalidForPersonalization;
- (ICURLAggregatedPerformanceMetrics)performanceMetrics;
- (MPCModelStorePlaybackItemsResponse)initWithRequest:(id)a3 personalizationResponse:(id)a4 results:(id)a5 performanceMetrics:(id)a6;
- (MPStoreLibraryPersonalizationResponse)_personalizationResponse;
- (NSDate)invalidationDate;
- (NSDictionary)localStoreAdamIDToEquivalencySourceStoreAdamIDMap;
- (id)equivalencySourceStoreAdamIDForLocalStoreAdamID:(int64_t)a3;
- (int64_t)_sonicSPIROpStorage;
- (void)_allowsExplicitContentDidChangeNotification:(id)a3;
- (void)_invalidate;
- (void)_mediaLibraryDidChangeNotification:(id)a3;
- (void)_personalizationResponseDidInvalidateNotification:(id)a3;
- (void)clearResults;
- (void)dealloc;
- (void)setFinalResponse:(BOOL)a3;
- (void)setInvalidationDate:(id)a3;
- (void)setLocalStoreAdamIDToEquivalencySourceStoreAdamIDMap:(id)a3;
- (void)setPerformanceMetrics:(id)a3;
- (void)set_sonicSPIROpStorage:(int64_t)a3;
@end

@implementation MPCModelStorePlaybackItemsResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_invalidationDate, 0);
  objc_storeStrong((id *)&self->_localStoreAdamIDToEquivalencySourceStoreAdamIDMap, 0);
  objc_storeStrong((id *)&self->_personalizationResponse, 0);

  objc_storeStrong((id *)&self->_invalidationTimer, 0);
}

- (void)set_sonicSPIROpStorage:(int64_t)a3
{
  self->__sonicSPIROpStorage = a3;
}

- (int64_t)_sonicSPIROpStorage
{
  return self->__sonicSPIROpStorage;
}

- (void)setPerformanceMetrics:(id)a3
{
}

- (ICURLAggregatedPerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (NSDate)invalidationDate
{
  return self->_invalidationDate;
}

- (void)setLocalStoreAdamIDToEquivalencySourceStoreAdamIDMap:(id)a3
{
}

- (NSDictionary)localStoreAdamIDToEquivalencySourceStoreAdamIDMap
{
  return self->_localStoreAdamIDToEquivalencySourceStoreAdamIDMap;
}

- (BOOL)isInvalidForPersonalization
{
  return self->_invalidForPersonalization;
}

- (void)setFinalResponse:(BOOL)a3
{
  self->_finalResponse = a3;
}

- (BOOL)isFinalResponse
{
  return self->_finalResponse;
}

- (MPStoreLibraryPersonalizationResponse)_personalizationResponse
{
  return self->_personalizationResponse;
}

- (void)clearResults
{
}

- (void)setInvalidationDate:(id)a3
{
  v4 = (NSDate *)a3;
  if (self->_invalidationDate != v4)
  {
    invalidationTimer = self->_invalidationTimer;
    if (invalidationTimer)
    {
      dispatch_source_cancel(invalidationTimer);
      v6 = self->_invalidationTimer;
      self->_invalidationTimer = 0;
    }
    v7 = (NSDate *)[(NSDate *)v4 copy];
    invalidationDate = self->_invalidationDate;
    self->_invalidationDate = v7;

    if (self->_invalidationDate)
    {
      v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
      v10 = self->_invalidationTimer;
      self->_invalidationTimer = v9;

      [(NSDate *)self->_invalidationDate timeIntervalSinceNow];
      double v12 = v11 * 1000000000.0;
      v13 = self->_invalidationTimer;
      dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
      dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)((double)(uint64_t)v12 * 0.01));
      objc_initWeak(&location, self);
      v15 = self->_invalidationTimer;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __58__MPCModelStorePlaybackItemsResponse_setInvalidationDate___block_invoke;
      v16[3] = &unk_2643C5FF0;
      objc_copyWeak(&v17, &location);
      dispatch_source_set_event_handler(v15, v16);
      dispatch_resume((dispatch_object_t)self->_invalidationTimer);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __58__MPCModelStorePlaybackItemsResponse_setInvalidationDate___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[57] = 0;
    v2 = WeakRetained;
    [WeakRetained _invalidate];
    WeakRetained = v2;
  }
}

- (void)_personalizationResponseDidInvalidateNotification:(id)a3
{
  self->_invalidForPersonalization = 1;
  [(MPCModelStorePlaybackItemsResponse *)self _invalidate];
}

- (void)_mediaLibraryDidChangeNotification:(id)a3
{
  self->_invalidForPersonalization = 1;
  [(MPCModelStorePlaybackItemsResponse *)self _invalidate];
}

- (void)_allowsExplicitContentDidChangeNotification:(id)a3
{
  self->_invalidForPersonalization = 0;
  [(MPCModelStorePlaybackItemsResponse *)self _invalidate];
}

- (id)equivalencySourceStoreAdamIDForLocalStoreAdamID:(int64_t)a3
{
  if (a3)
  {
    localStoreAdamIDToEquivalencySourceStoreAdamIDMap = self->_localStoreAdamIDToEquivalencySourceStoreAdamIDMap;
    v4 = objc_msgSend(NSNumber, "numberWithLongLong:");
    v5 = [(NSDictionary *)localStoreAdamIDToEquivalencySourceStoreAdamIDMap objectForKey:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_invalidate
{
  invalidationTimer = self->_invalidationTimer;
  if (invalidationTimer)
  {
    dispatch_source_cancel(invalidationTimer);
    v4 = self->_invalidationTimer;
    self->_invalidationTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MPCModelStorePlaybackItemsResponse;
  [(MPModelResponse *)&v5 _invalidate];
}

- (void)dealloc
{
  invalidationTimer = self->_invalidationTimer;
  if (invalidationTimer) {
    dispatch_source_cancel(invalidationTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPCModelStorePlaybackItemsResponse;
  [(MPCModelStorePlaybackItemsResponse *)&v4 dealloc];
}

- (MPCModelStorePlaybackItemsResponse)initWithRequest:(id)a3 personalizationResponse:(id)a4 results:(id)a5 performanceMetrics:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_time_t v14 = [(MPModelResponse *)self initWithRequest:a3];
  v15 = v14;
  if (v14)
  {
    p_personalizationResponse = (id *)&v14->_personalizationResponse;
    objc_storeStrong((id *)&v14->_personalizationResponse, a4);
    uint64_t v17 = [*p_personalizationResponse results];
    v18 = (void *)v17;
    if (v17) {
      id v19 = (id)v17;
    }
    else {
      id v19 = v12;
    }
    [(MPModelResponse *)v15 setResults:v19];

    v20 = [MEMORY[0x263F08A00] defaultCenter];
    v21 = v20;
    if (*p_personalizationResponse)
    {
      objc_msgSend(v20, "addObserver:selector:name:object:", v15, sel__personalizationResponseDidInvalidateNotification_, *MEMORY[0x263F11B18]);
      if (([*p_personalizationResponse isValid] & 1) == 0) {
        [(MPCModelStorePlaybackItemsResponse *)v15 _invalidate];
      }
    }
    objc_storeStrong((id *)&v15->_performanceMetrics, a6);
    uint64_t v22 = *MEMORY[0x263F11C70];
    v23 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
    [v21 addObserver:v15 selector:sel__allowsExplicitContentDidChangeNotification_ name:v22 object:v23];

    [v21 addObserver:v15 selector:sel__activeUserDidChangeNotification_ name:*MEMORY[0x263F88E98] object:0];
  }

  return v15;
}

@end