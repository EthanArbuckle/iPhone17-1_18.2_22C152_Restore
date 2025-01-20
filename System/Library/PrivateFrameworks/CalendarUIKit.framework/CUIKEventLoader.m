@interface CUIKEventLoader
- (BOOL)allowEventLocationPrediction;
- (BOOL)firstLoadBegan;
- (BOOL)setSelectedCalendars:(id)a3;
- (CUIKEventLoader)initWithEventStore:(id)a3;
- (CUIKEventLoaderDelegate)delegate;
- (id)occurrencesForStartDate:(id)a3 endDate:(id)a4 preSorted:(BOOL)a5 waitForLoad:(BOOL)a6 isComplete:(BOOL *)a7;
- (void)_enqueueLoadForRangeStart:(double)a3 end:(double)a4;
- (void)_eventStoreChanged:(id)a3;
- (void)_getLoadStart:(double *)a3 end:(double *)a4 fromLoadedStart:(double)a5 loadedEnd:(double)a6 currentlyLoadingStart:(double)a7 currentlyLoadingEnd:(double)a8;
- (void)_getStart:(double)a3 end:(double)a4 expandedToComponents:(unint64_t)a5 withResultStart:(double *)a6 resultEnd:(double *)a7;
- (void)_getStart:(double)a3 end:(double)a4 paddedByDays:(int)a5 inTimeZone:(id)a6 resultStart:(double *)a7 resultEnd:(double *)a8;
- (void)_loadIfNeededBetweenStart:(double)a3 end:(double)a4 loadPaddingNow:(BOOL)a5;
- (void)_pruneLoadedOccurrences;
- (void)_reload;
- (void)_waitForBackgroundLoad;
- (void)addOccurrenceAwaitingDeletion:(id)a3;
- (void)addOccurrenceAwaitingRefresh:(id)a3;
- (void)cancelAllLoads;
- (void)handleAsynchronousFetchResults:(id)a3 cancelSeed:(int)a4 start:(double)a5 end:(double)a6 filterAll:(BOOL)a7 emptyLoad:(BOOL)a8;
- (void)loadIfNeeded;
- (void)setAllowEventLocationPrediction:(BOOL)a3;
- (void)setCacheLimit:(unsigned int)a3;
- (void)setComponentForExpandingPadding:(unint64_t)a3;
- (void)setComponentForExpandingRequests:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPadding:(unsigned int)a3;
- (void)setPreferredReloadStartDate:(id)a3 endDate:(id)a4;
@end

@implementation CUIKEventLoader

- (void)setPreferredReloadStartDate:(id)a3 endDate:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9) {
    [v9 timeIntervalSinceReferenceDate];
  }
  else {
    double v7 = INFINITY;
  }
  self->_preferredReloadStart = v7;
  if (v6) {
    [v6 timeIntervalSinceReferenceDate];
  }
  else {
    double v8 = INFINITY;
  }
  self->_preferredReloadEnd = v8;
}

void __91__CUIKEventLoader_handleAsynchronousFetchResults_cancelSeed_start_end_filterAll_emptyLoad___block_invoke_28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 208));
  [WeakRetained calendarEventLoader:*(void *)(a1 + 32) occurrencesDidUpdateBetweenStart:*(unsigned int *)(a1 + 56) end:*(unsigned __int8 *)(a1 + 60) generation:*(double *)(a1 + 40) wasEmptyLoad:*(double *)(a1 + 48)];
}

- (void)setCacheLimit:(unsigned int)a3
{
  p_daysOfPadding = &self->_daysOfPadding;
  if (self->_daysOfPadding > a3)
  {
    id v6 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(CUIKEventLoader *)a3 setCacheLimit:v6];
    }

    unsigned int *p_daysOfPadding = a3;
  }
  double v7 = +[CUIKLogSubsystem eventLoader];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEventLoader setCacheLimit:](a3, v7);
  }

  unsigned int maxDaysToCache = self->_maxDaysToCache;
  if (maxDaysToCache != a3)
  {
    self->_unsigned int maxDaysToCache = a3;
    if (maxDaysToCache > a3) {
      [(CUIKEventLoader *)self _pruneLoadedOccurrences];
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (CUIKEventLoader)initWithEventStore:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CUIKEventLoader;
  id v6 = [(CUIKEventLoader *)&v23 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__eventStoreChanged_ name:*MEMORY[0x1E4F25460] object:v7->_store];

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mobilecal.CalendarEventLoader.occurrencesLock", v9);
    occurrencesLock = v7->_occurrencesLock;
    v7->_occurrencesLock = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mobilecal.CalendarEventLoader.loadQueue", v12);
    loadQueue = v7->_loadQueue;
    v7->_loadQueue = (OS_dispatch_queue *)v13;

    dispatch_group_t v15 = dispatch_group_create();
    loadGroup = v7->_loadGroup;
    v7->_loadGroup = (OS_dispatch_group *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    occurrencesAwaitingRefresh = v7->_occurrencesAwaitingRefresh;
    v7->_occurrencesAwaitingRefresh = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    occurrencesAwaitingDeletion = v7->_occurrencesAwaitingDeletion;
    v7->_occurrencesAwaitingDeletion = v19;

    v7->_selectedCalendarsLock._os_unfair_lock_opaque = 0;
    int64x2_t v21 = vdupq_n_s64(0x7FF0000000000000uLL);
    *(int64x2_t *)&v7->_lastRequestedStart = v21;
    *(int64x2_t *)&v7->_loadedStart = v21;
    *(int64x2_t *)&v7->_currentlyLoadingStart = v21;
    v7->_currentGeneration = 1;
    *(void *)&v7->_daysOfPadding = 0xFFFFFFFF00000000;
    *(int64x2_t *)&v7->_preferredReloadStart = v21;
    v7->_allowEventLocationPrediction = 1;
  }

  return v7;
}

uint64_t __26__CUIKEventLoader__reload__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cancelAllLoads];
  *(unsigned char *)(*(void *)(a1 + 32) + 160) = 1;
  *(void *)(*(void *)(a1 + 32) + 152) = 0x7FF0000000000000;
  *(void *)(*(void *)(a1 + 32) + 144) = 0x7FF0000000000000;
  *(void *)(*(void *)(a1 + 32) + 176) = 0x7FF0000000000000;
  *(void *)(*(void *)(a1 + 32) + 168) = 0x7FF0000000000000;
  return result;
}

- (void)cancelAllLoads
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1BDF08000, v0, v1, "EventLoader: Canceling all loads", v2, v3, v4, v5, v6);
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[CUIKLogSubsystem eventLoader];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_2_cold_1();
  }

  *(void *)(*(void *)(a1 + 32) + 168) = 0x7FF0000000000000;
  *(void *)(*(void *)(a1 + 32) + 176) = 0x7FF0000000000000;
}

void __51__CUIKEventLoader_setAllowEventLocationPrediction___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setLocationPredictionAllowed:", objc_msgSend(*(id *)(a1 + 32), "allowEventLocationPrediction", (void)v7));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __91__CUIKEventLoader_handleAsynchronousFetchResults_cancelSeed_start_end_filterAll_emptyLoad___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (id *)(a1 + 32);
  id v2 = *(id *)(a1 + 32);
  if (*((double *)v2 + 18) == INFINITY || *((unsigned char *)v2 + 160) || *(unsigned char *)(a1 + 68))
  {
    uint64_t v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = 0;

    uint64_t v5 = (void *)*((void *)*v3 + 4);
    *((void *)*v3 + 4) = 0;

    id v2 = *v3;
    if (*((unsigned char *)*v3 + 160))
    {
      [*((id *)v2 + 5) removeAllObjects];
      [*((id *)*v3 + 6) removeAllObjects];
      *((unsigned char *)*v3 + 160) = 0;
      id v2 = *v3;
    }
  }
  if (*((void *)v2 + 3))
  {
    uint64_t v6 = [*(id *)(a1 + 40) count];
    long long v7 = *(void **)(*(void *)(a1 + 32) + 24);
    if (v6)
    {
      id v8 = [v7 setByAddingObjectsFromArray:*(void *)(a1 + 40)];
    }
    else
    {
      id v8 = v7;
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  }
  long long v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v10 + 136) == *(_DWORD *)(a1 + 64))
  {
    objc_storeStrong((id *)(v10 + 24), v8);
    int v28 = *((_DWORD *)*v3 + 50) + 1;
    *((_DWORD *)*v3 + 50) = v28;
    v11 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v12 = *((id *)*v3 + 3);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v18 = [v17 proposedStartDate];

          if (v18) {
            [v11 addObject:v17];
          }
          objc_msgSend(v17, "setLocationPredictionAllowed:", objc_msgSend(*v3, "allowEventLocationPrediction"));
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v14);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v11);
    uint64_t v19 = *(void *)(a1 + 32);
    double v20 = *(double *)(v19 + 144);
    if (v20 >= *(double *)(a1 + 48)) {
      double v21 = *(double *)(a1 + 48);
    }
    else {
      double v21 = *(double *)(v19 + 144);
    }
    if (v20 == INFINITY) {
      double v22 = *(double *)(a1 + 48);
    }
    else {
      double v22 = v21;
    }
    *(double *)(v19 + 144) = v22;
    uint64_t v23 = *(void *)(a1 + 32);
    double v24 = *(double *)(v23 + 152);
    if (v24 < *(double *)(a1 + 56) || v24 == INFINITY) {
      double v24 = *(double *)(a1 + 56);
    }
    *(double *)(v23 + 152) = v24;
    v26 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      __91__CUIKEventLoader_handleAsynchronousFetchResults_cancelSeed_start_end_filterAll_emptyLoad___block_invoke_cold_1(v3);
    }

    v27 = (double *)*v3;
    if (*((double *)*v3 + 21) == *((double *)*v3 + 18))
    {
      v27[21] = v27[19] + 1.0;
      v27 = (double *)*v3;
    }
    if (v27[22] == v27[19]) {
      v27[22] = v27[18] + -1.0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__CUIKEventLoader_handleAsynchronousFetchResults_cancelSeed_start_end_filterAll_emptyLoad___block_invoke_28;
    block[3] = &unk_1E636AAF8;
    block[4] = *(void *)(a1 + 32);
    long long v30 = *(_OWORD *)(a1 + 48);
    int v31 = v28;
    char v32 = *(unsigned char *)(a1 + 69);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v11 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_24_cold_1();
    }
  }
}

- (BOOL)allowEventLocationPrediction
{
  return self->_allowEventLocationPrediction;
}

- (BOOL)setSelectedCalendars:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_selectedCalendarsLock);
  self->_selectedCalendarsWereSet = 1;
  char v5 = [v4 isEqualToSet:self->_selectedCalendars];
  if (v5)
  {
    os_unfair_lock_unlock(&self->_selectedCalendarsLock);
  }
  else
  {
    uint64_t v6 = (NSSet *)[v4 copy];
    selectedCalendars = self->_selectedCalendars;
    self->_selectedCalendars = v6;

    os_unfair_lock_unlock(&self->_selectedCalendarsLock);
    [(CUIKEventLoader *)self _reload];
  }

  return v5 ^ 1;
}

- (void)_reload
{
  occurrencesLock = self->_occurrencesLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CUIKEventLoader__reload__block_invoke;
  block[3] = &unk_1E6369C50;
  block[4] = self;
  dispatch_sync(occurrencesLock, block);
  [(CUIKEventLoader *)self loadIfNeeded];
}

- (void)setPadding:(unsigned int)a3
{
  if (self->_daysOfPadding != a3)
  {
    char v5 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEventLoader setPadding:](a3, v5);
    }

    self->_daysOfPadding = a3;
    [(CUIKEventLoader *)self loadIfNeeded];
  }
}

- (void)loadIfNeeded
{
  double preferredReloadStart = self->_preferredReloadStart;
  if (preferredReloadStart == INFINITY) {
    double preferredReloadStart = self->_lastRequestedStart;
  }
  double preferredReloadEnd = self->_preferredReloadEnd;
  if (preferredReloadEnd == INFINITY) {
    double preferredReloadEnd = self->_lastRequestedEnd;
  }
  if (preferredReloadStart != INFINITY && preferredReloadEnd != INFINITY)
  {
    double v6 = 0.0;
    double v7 = 0.0;
    -[CUIKEventLoader _getStart:end:expandedToComponents:withResultStart:resultEnd:](self, "_getStart:end:expandedToComponents:withResultStart:resultEnd:", self->_componentForExpandingRequests, &v7, &v6);
    [(CUIKEventLoader *)self _loadIfNeededBetweenStart:0 end:v7 loadPaddingNow:v6];
  }
}

void __42__CUIKEventLoader__pruneLoadedOccurrences__block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(v2 + 184);
  if (v3 != INFINITY)
  {
    double v4 = *(double *)(v2 + 192);
    if (v4 != INFINITY && *(double *)(v2 + 144) != INFINITY && *(double *)(v2 + 152) != INFINITY)
    {
      double v43 = 0.0;
      double v44 = 0.0;
      uint64_t v5 = *(unsigned int *)(v2 + 80);
      double v6 = [*(id *)(v2 + 8) timeZone];
      [(id)v2 _getStart:v5 end:v6 paddedByDays:&v44 inTimeZone:&v43 resultStart:v3 resultEnd:v4];

      uint64_t v7 = *(void *)v1;
      if (*(double *)(*(void *)v1 + 144) < v44 || *(double *)(v7 + 152) > v43)
      {
        id v8 = (void *)[*(id *)(v7 + 24) mutableCopy];
        long long v9 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v10 = *(void *)v1;
        if (*(double *)(*(void *)v1 + 144) < v44)
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v11 = v8;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v46 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v40 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                v17 = [v16 startCalendarDate];
                [v17 absoluteTime];
                double v19 = v18;
                double v20 = v44;

                if (v19 <= v20) {
                  [v9 addObject:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v46 count:16];
            }
            while (v13);
          }

          *(double *)(*(void *)v1 + 144) = v44;
          double v21 = +[CUIKLogSubsystem eventLoader];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            __42__CUIKEventLoader__pruneLoadedOccurrences__block_invoke_cold_2(v1);
          }

          uint64_t v10 = *(void *)v1;
        }
        if (*(double *)(v10 + 152) > v43)
        {
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v22 = v8;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v45 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v36 != v25) {
                  objc_enumerationMutation(v22);
                }
                v27 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                int v28 = objc_msgSend(v27, "startCalendarDate", (void)v35);
                [v28 absoluteTime];
                double v30 = v29;
                double v31 = v43;

                if (v30 >= v31) {
                  [v9 addObject:v27];
                }
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v45 count:16];
            }
            while (v24);
          }

          *(double *)(*(void *)v1 + 152) = v43;
          char v32 = +[CUIKLogSubsystem eventLoader];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            __42__CUIKEventLoader__pruneLoadedOccurrences__block_invoke_cold_1(v1);
          }
        }
        objc_msgSend(v8, "minusSet:", v9, (void)v35);
        uint64_t v33 = [v8 copy];
        long long v34 = *(void **)(*(void *)v1 + 24);
        *(void *)(*(void *)v1 + 24) = v33;
      }
    }
  }
}

- (void)_enqueueLoadForRangeStart:(double)a3 end:(double)a4
{
  if (a3 >= a4)
  {
    long long v9 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CUIKEventLoader _enqueueLoadForRangeStart:end:](v9, a3, a4);
    }
  }
  else
  {
    if (_enqueueLoadForRangeStart_end__onceToken != -1) {
      dispatch_once(&_enqueueLoadForRangeStart_end__onceToken, &__block_literal_global_13);
    }
    os_unfair_lock_lock(&self->_selectedCalendarsLock);
    NSUInteger v7 = [(NSSet *)self->_selectedCalendars count];
    BOOL v8 = v7 == 0;
    long long v9 = [(NSSet *)self->_selectedCalendars allObjects];
    if (v7) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = !self->_selectedCalendarsWereSet;
    }
    os_unfair_lock_unlock(&self->_selectedCalendarsLock);
    store = self->_store;
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
    uint64_t v14 = [(EKEventStore *)store predicateForEventsWithStartDate:v12 endDate:v13 calendars:v9 loadDefaultProperties:1];

    uint64_t v15 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEventLoader _enqueueLoadForRangeStart:end:]((uint64_t)v14, v15);
    }

    uint64_t v35 = 0;
    long long v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v31 = 0;
    char v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    occurrencesLock = self->_occurrencesLock;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_23;
    block[3] = &unk_1E636AA80;
    *(double *)&block[7] = a3;
    *(double *)&block[8] = a4;
    block[4] = self;
    void block[5] = &v31;
    block[6] = &v35;
    dispatch_sync(occurrencesLock, block);
    if (!*((unsigned char *)v32 + 24))
    {
      int cancelSeed = self->_cancelSeed;
      loadGroup = self->_loadGroup;
      loadQueue = self->_loadQueue;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_24;
      v23[3] = &unk_1E636AAD0;
      v23[4] = self;
      int v27 = cancelSeed;
      BOOL v28 = v8;
      id v24 = v14;
      double v25 = a3;
      double v26 = a4;
      BOOL v29 = v10;
      dispatch_group_async(loadGroup, loadQueue, v23);
      if (*((unsigned char *)v36 + 24))
      {
        double v20 = self->_loadGroup;
        double v21 = self->_loadQueue;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_2;
        v22[3] = &unk_1E6369C50;
        v22[4] = self;
        dispatch_group_notify(v20, v21, v22);
      }
    }
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
  }
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_23(uint64_t a1)
{
  double v12 = 0.0;
  double v13 = 0.0;
  uint64_t v2 = (uint64_t *)(a1 + 32);
  [*(id *)(a1 + 32) _getLoadStart:&v13 end:&v12 fromLoadedStart:*(double *)(*(void *)(a1 + 32) + 144) loadedEnd:*(double *)(*(void *)(a1 + 32) + 152) currentlyLoadingStart:*(double *)(*(void *)(a1 + 32) + 168) currentlyLoadingEnd:*(double *)(*(void *)(a1 + 32) + 176)];
  uint64_t v3 = *v2;
  if (*(double *)(*v2 + 144) == INFINITY || *(double *)(a1 + 56) < v13 || *(double *)(a1 + 64) > v12)
  {
    double v4 = *(double *)(v3 + 168);
    if (v4 == INFINITY)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v3 = *(void *)(a1 + 32);
      double v4 = *(double *)(v3 + 168);
    }
    if (*(double *)(a1 + 56) < v4 || v4 == INFINITY) {
      double v4 = *(double *)(a1 + 56);
    }
    *(double *)(v3 + 168) = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    double v7 = *(double *)(v6 + 176);
    if (*(double *)(a1 + 64) >= v7) {
      double v8 = *(double *)(a1 + 64);
    }
    else {
      double v8 = *(double *)(v6 + 176);
    }
    if (v7 == INFINITY) {
      double v9 = *(double *)(a1 + 64);
    }
    else {
      double v9 = v8;
    }
    *(double *)(v6 + 176) = v9;
    BOOL v10 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_23_cold_1(v2);
    }
  }
  else
  {
    id v11 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_23_cold_2((double *)(a1 + 56), (double *)(a1 + 64));
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)occurrencesForStartDate:(id)a3 endDate:(id)a4 preSorted:(BOOL)a5 waitForLoad:(BOOL)a6 isComplete:(BOOL *)a7
{
  BOOL v8 = a6;
  BOOL v97 = a5;
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v99 = v12;
  v100 = v11;
  if (!v11)
  {
    double v13 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEventLoader occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:]();
    }
    goto LABEL_7;
  }
  if (!v12)
  {
    double v13 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEventLoader occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:].cold.4();
    }
LABEL_7:
  }
  [v11 timeIntervalSinceReferenceDate];
  double v15 = v14;
  [v99 timeIntervalSinceReferenceDate];
  double v17 = v16;
  double v18 = +[CUIKLogSubsystem eventLoader];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEventLoader occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:](v18, v15, v17);
  }

  double v19 = v17 - v15;
  if (v17 - v15 > (double)(86400 * self->_maxDaysToCache))
  {
    double v20 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[CUIKEventLoader occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:](&self->_maxDaysToCache, (int)(v19 / 86400.0), v20);
    }

    [(CUIKEventLoader *)self setCacheLimit:(int)(v19 / 86400.0)];
  }
  self->_lastRequestedStart = v15;
  self->_lastRequestedEnd = v17;
  double v147 = 0.0;
  double v146 = 0.0;
  [(CUIKEventLoader *)self _getStart:self->_componentForExpandingRequests end:&v147 expandedToComponents:&v146 withResultStart:v15 resultEnd:v17];
  double v21 = +[CUIKLogSubsystem eventLoader];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v69 = __GetDateFormatter();
    v70 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v15];
    v102 = [v69 stringFromDate:v70];
    v71 = __GetDateFormatter();
    v72 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v17];
    uint64_t v73 = [v71 stringFromDate:v72];
    v74 = (void *)v73;
    v75 = @"NO";
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v102;
    *(_WORD *)&buf[12] = 2112;
    if (v8) {
      v75 = @"YES";
    }
    *(void *)&buf[14] = v73;
    *(_WORD *)&buf[22] = 2112;
    v160 = (uint64_t (*)(uint64_t, uint64_t))v75;
    _os_log_debug_impl(&dword_1BDF08000, v21, OS_LOG_TYPE_DEBUG, "EventLoader: Kicking off load with start: %@, end: %@, waitForLoad: %@", buf, 0x20u);
  }
  [(CUIKEventLoader *)self _loadIfNeededBetweenStart:0 end:v147 loadPaddingNow:v146];
  if (v8) {
    [(CUIKEventLoader *)self _waitForBackgroundLoad];
  }
  v101 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v160 = __Block_byref_object_copy__8;
  v161 = __Block_byref_object_dispose__8;
  id v162 = 0;
  uint64_t v140 = 0;
  v141 = &v140;
  uint64_t v142 = 0x3032000000;
  v143 = __Block_byref_object_copy__8;
  v144 = __Block_byref_object_dispose__8;
  id v145 = 0;
  uint64_t v134 = 0;
  v135 = &v134;
  uint64_t v136 = 0x3032000000;
  v137 = __Block_byref_object_copy__8;
  v138 = __Block_byref_object_dispose__8;
  id v139 = 0;
  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x3032000000;
  v131 = __Block_byref_object_copy__8;
  v132 = __Block_byref_object_dispose__8;
  id v133 = 0;
  uint64_t v124 = 0;
  v125 = &v124;
  uint64_t v126 = 0x2020000000;
  int v127 = 0;
  uint64_t v120 = 0;
  v121 = (double *)&v120;
  uint64_t v122 = 0x2020000000;
  uint64_t v123 = 0;
  uint64_t v116 = 0;
  v117 = (double *)&v116;
  uint64_t v118 = 0x2020000000;
  uint64_t v119 = 0;
  occurrencesLock = self->_occurrencesLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__CUIKEventLoader_occurrencesForStartDate_endDate_preSorted_waitForLoad_isComplete___block_invoke;
  block[3] = &unk_1E636AA08;
  block[4] = self;
  void block[5] = buf;
  block[6] = &v140;
  block[7] = &v134;
  block[8] = &v128;
  void block[9] = &v124;
  block[10] = &v120;
  block[11] = &v116;
  dispatch_sync(occurrencesLock, block);
  if (a7)
  {
    double v24 = v121[3];
    if (v24 == INFINITY)
    {
      BOOL v25 = 1;
    }
    else
    {
      double v26 = v117[3];
      BOOL v25 = v26 == INFINITY;
      if (v15 < v24) {
        BOOL v25 = 1;
      }
      if (v15 > v26) {
        BOOL v25 = 1;
      }
      if (v17 > v26) {
        BOOL v25 = 1;
      }
    }
    *a7 = !v25;
  }
  int v27 = +[CUIKLogSubsystem eventLoader];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v76 = [*(id *)(*(void *)&buf[8] + 40) count];
    v77 = __GetDateFormatter();
    v78 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v15];
    id v79 = [v77 stringFromDate:v78];
    v80 = __GetDateFormatter();
    v81 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v17];
    v82 = [v80 stringFromDate:v81];
    *(_DWORD *)v148 = 134218498;
    uint64_t v149 = v76;
    __int16 v150 = 2112;
    id v151 = v79;
    __int16 v152 = 2112;
    uint64_t v153 = (uint64_t)v82;
    _os_log_debug_impl(&dword_1BDF08000, v27, OS_LOG_TYPE_DEBUG, "EventLoader: Loaded %ld occurrences for start: %@, end: %@", v148, 0x20u);
  }
  BOOL v28 = (void *)[*(id *)(*(void *)&buf[8] + 40) mutableCopy];
  BOOL v29 = (void *)[(id)v141[5] mutableCopy];
  if ([(id)v135[5] count] || objc_msgSend((id)v129[5], "count"))
  {
    if ([(id)v135[5] count])
    {
      [v28 unionSet:v135[5]];
      [v29 unionSet:v135[5]];
    }
    if ([(id)v129[5] count])
    {
      [v28 minusSet:v129[5]];
      [v29 minusSet:v129[5]];
    }
  }
  double v30 = +[CUIKLogSubsystem eventLoader];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v94 = [v28 count];
    v83 = __GetDateFormatter();
    v95 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v15];
    id v84 = [v83 stringFromDate:v95];
    v85 = __GetDateFormatter();
    v86 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v17];
    v87 = [v85 stringFromDate:v86];
    *(_DWORD *)v148 = 134218498;
    uint64_t v149 = v94;
    __int16 v150 = 2112;
    id v151 = v84;
    __int16 v152 = 2112;
    uint64_t v153 = (uint64_t)v87;
    _os_log_debug_impl(&dword_1BDF08000, v30, OS_LOG_TYPE_DEBUG, "EventLoader: %ld occurrences after refresh/delete filtering for start: %@, end: %@", v148, 0x20u);
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  uint64_t v31 = (void *)[v28 copy];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v111 objects:v158 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v112;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v112 != v33) {
          objc_enumerationMutation(v31);
        }
        uint64_t v35 = *(void **)(*((void *)&v111 + 1) + 8 * i);
        long long v36 = objc_msgSend(v35, "startCalendarDate", v94);
        [v36 absoluteTime];
        double v38 = v37;

        if (v38 >= v15)
        {
          long long v42 = v29;
          if (v38 < v17) {
            goto LABEL_47;
          }
LABEL_46:
          long long v42 = v28;
          goto LABEL_47;
        }
        long long v39 = [v35 endCalendarDate];
        [v39 absoluteTime];
        double v41 = v40;

        long long v42 = v29;
        if (v41 <= v15) {
          goto LABEL_46;
        }
LABEL_47:
        [v42 removeObject:v35];
      }
      uint64_t v32 = [v31 countByEnumeratingWithState:&v111 objects:v158 count:16];
    }
    while (v32);
  }

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  double v43 = (void *)[v29 copy];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v107 objects:v157 count:16];
  if (!v44) {
    goto LABEL_64;
  }
  uint64_t v45 = *(void *)v108;
  do
  {
    uint64_t v46 = 0;
    do
    {
      if (*(void *)v108 != v45) {
        objc_enumerationMutation(v43);
      }
      uint64_t v47 = *(void **)(*((void *)&v107 + 1) + 8 * v46);
      v48 = objc_msgSend(v47, "startCalendarDate", v94);
      [v48 absoluteTime];
      double v50 = v49;

      if ([v47 status] == 3)
      {
LABEL_55:
        [v29 removeObject:v47];
        goto LABEL_56;
      }
      if (v50 >= v15)
      {
        if (v50 >= v17) {
          goto LABEL_55;
        }
      }
      else
      {
        v51 = [v47 endDateUnadjustedForLegacyClients];
        v52 = [v47 startDate];
        [v51 timeIntervalSinceDate:v52];
        double v54 = v53;

        if (v50 + v54 <= v15) {
          goto LABEL_55;
        }
      }
LABEL_56:
      ++v46;
    }
    while (v44 != v46);
    uint64_t v55 = [v43 countByEnumeratingWithState:&v107 objects:v157 count:16];
    uint64_t v44 = v55;
  }
  while (v55);
LABEL_64:

  [v28 unionSet:v29];
  v56 = [v28 allObjects];
  v57 = v56;
  if (v97)
  {
    uint64_t v58 = [v56 sortedArrayUsingFunction:CUIKCompareEKEvents context:0];

    v57 = (void *)v58;
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v59 = v57;
  uint64_t v60 = [v59 countByEnumeratingWithState:&v103 objects:v156 count:16];
  if (v60)
  {
    uint64_t v61 = *(void *)v104;
    do
    {
      for (uint64_t j = 0; j != v60; ++j)
      {
        if (*(void *)v104 != v61) {
          objc_enumerationMutation(v59);
        }
        v63 = *(void **)(*((void *)&v103 + 1) + 8 * j);
        if (objc_msgSend(v63, "isAllDay", v94)) {
          v64 = v101;
        }
        else {
          v64 = v22;
        }
        [v64 addObject:v63];
      }
      uint64_t v60 = [v59 countByEnumeratingWithState:&v103 objects:v156 count:16];
    }
    while (v60);
  }

  v65 = +[CUIKLogSubsystem eventLoader];
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
  {
    v88 = __GetDateFormatter();
    v98 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v15];
    id v89 = [v88 stringFromDate:v98];
    v96 = __GetDateFormatter();
    v90 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v17];
    id v91 = [v96 stringFromDate:v90];
    uint64_t v92 = [v101 count];
    uint64_t v93 = [v22 count];
    *(_DWORD *)v148 = 138413058;
    uint64_t v149 = (uint64_t)v89;
    __int16 v150 = 2112;
    id v151 = v91;
    __int16 v152 = 2048;
    uint64_t v153 = v92;
    __int16 v154 = 2048;
    uint64_t v155 = v93;
    _os_log_debug_impl(&dword_1BDF08000, v65, OS_LOG_TYPE_DEBUG, "EventLoader: Final occurrence counts after all filtering for start: %@, end: %@, allDayCount: %ld, timedCount: %ld", v148, 0x2Au);
  }
  v66 = [CUIKOccurrencesCollection alloc];
  v67 = [(CUIKOccurrencesCollection *)v66 initWithOccurrences:v59 timedOccurrences:v22 allDayOccurrences:v101 generation:*((unsigned int *)v125 + 6)];

  _Block_object_dispose(&v116, 8);
  _Block_object_dispose(&v120, 8);
  _Block_object_dispose(&v124, 8);
  _Block_object_dispose(&v128, 8);

  _Block_object_dispose(&v134, 8);
  _Block_object_dispose(&v140, 8);

  _Block_object_dispose(buf, 8);

  return v67;
}

- (void)_loadIfNeededBetweenStart:(double)a3 end:(double)a4 loadPaddingNow:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = 0;
  double v41 = (double *)&v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v36 = 0;
  double v37 = (double *)&v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = (double *)&v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v28 = 0;
  BOOL v29 = (double *)&v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  occurrencesLock = self->_occurrencesLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CUIKEventLoader__loadIfNeededBetweenStart_end_loadPaddingNow___block_invoke;
  block[3] = &unk_1E636AA30;
  block[4] = self;
  void block[5] = &v40;
  block[6] = &v36;
  block[7] = &v32;
  block[8] = &v28;
  dispatch_sync(occurrencesLock, block);
  double v25 = 0.0;
  double v26 = 0.0;
  [(CUIKEventLoader *)self _getLoadStart:&v26 end:&v25 fromLoadedStart:v41[3] loadedEnd:v37[3] currentlyLoadingStart:v33[3] currentlyLoadingEnd:v29[3]];
  if (v41[3] != INFINITY || v33[3] != INFINITY)
  {
    double v23 = 0.0;
    double v24 = 0.0;
    double v11 = v25;
    double v10 = v26;
    uint64_t maxDaysToCache = self->_maxDaysToCache;
    double v13 = [(EKEventStore *)self->_store timeZone];
    [(CUIKEventLoader *)self _getStart:maxDaysToCache end:v13 paddedByDays:&v24 inTimeZone:&v23 resultStart:v10 resultEnd:v11];

    double v14 = v24;
    if (v24 > a3 || (double v14 = v23, v23 < a4))
    {
      [(CUIKEventLoader *)self _reload];
      goto LABEL_35;
    }
  }
  double v23 = 0.0;
  double v24 = 0.0;
  uint64_t daysOfPadding = self->_daysOfPadding;
  double v16 = [(EKEventStore *)self->_store timeZone];
  [(CUIKEventLoader *)self _getStart:daysOfPadding end:v16 paddedByDays:&v24 inTimeZone:&v23 resultStart:a3 resultEnd:a4];

  [(CUIKEventLoader *)self _getStart:self->_componentForExpandingPadding end:&v24 expandedToComponents:&v23 withResultStart:v24 resultEnd:v23];
  if (v41[3] != INFINITY || v33[3] != INFINITY)
  {
    double v17 = v25;
    if (v25 < a4)
    {
      [(CUIKEventLoader *)self _enqueueLoadForRangeStart:v25 + 1.0 end:a4];
      double v17 = v25;
    }
    if (v17 <= a4) {
      double v17 = a4;
    }
    if (v23 > v17)
    {
      if (self->_daysOfPadding)
      {
        if (!v5)
        {
          BOOL v18 = 1;
LABEL_24:
          double v20 = v26;
          if (v26 > a3)
          {
            [(CUIKEventLoader *)self _enqueueLoadForRangeStart:a3 end:v26 + -1.0];
            double v20 = v26;
          }
          if (v20 > a3) {
            double v20 = a3;
          }
          if (v24 < v20 && (self->_daysOfPadding || self->_componentForExpandingPadding))
          {
            if (!v5) {
              goto LABEL_34;
            }
            [(CUIKEventLoader *)self _enqueueLoadForRangeStart:v24 end:v20 + -1.0];
          }
          if (!v18) {
            goto LABEL_35;
          }
LABEL_34:
          dispatch_time_t v21 = dispatch_time(0, 300000000);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __64__CUIKEventLoader__loadIfNeededBetweenStart_end_loadPaddingNow___block_invoke_2;
          v22[3] = &unk_1E636AA58;
          v22[4] = self;
          *(double *)&void v22[5] = a3;
          *(double *)&v22[6] = a4;
          dispatch_after(v21, MEMORY[0x1E4F14428], v22);
          goto LABEL_35;
        }
      }
      else
      {
        unint64_t componentForExpandingPadding = self->_componentForExpandingPadding;
        BOOL v18 = componentForExpandingPadding != 0;
        if (!componentForExpandingPadding || !v5) {
          goto LABEL_24;
        }
      }
      [(CUIKEventLoader *)self _enqueueLoadForRangeStart:v17 + 1.0 end:v23];
    }
    BOOL v18 = 0;
    goto LABEL_24;
  }
  [(CUIKEventLoader *)self _enqueueLoadForRangeStart:a3 end:a4];
  if (self->_daysOfPadding || self->_componentForExpandingPadding)
  {
    if (v5)
    {
      [(CUIKEventLoader *)self _enqueueLoadForRangeStart:a4 + 1.0 end:v23];
      [(CUIKEventLoader *)self _enqueueLoadForRangeStart:v24 end:a3 + -1.0];
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_35:
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
}

- (void)_getStart:(double)a3 end:(double)a4 paddedByDays:(int)a5 inTimeZone:(id)a6 resultStart:(double *)a7 resultEnd:(double *)a8
{
  id v10 = a6;
  CalAbsoluteTimeAddGregorianUnits();
  uint64_t v12 = v11;
  CalAbsoluteTimeAddGregorianUnits();
  uint64_t v14 = v13;

  if (a7) {
    *(void *)a7 = v12;
  }
  if (a8) {
    *(void *)a8 = v14;
  }
}

- (void)_getStart:(double)a3 end:(double)a4 expandedToComponents:(unint64_t)a5 withResultStart:(double *)a6 resultEnd:(double *)a7
{
  if (a5)
  {
    __int16 v11 = a5;
    uint64_t v13 = (void *)MEMORY[0x1E4F57838];
    uint64_t v14 = [(EKEventStore *)self->_store timeZone];
    double v15 = [v13 calendarDateWithAbsoluteTime:v14 timeZone:a3];

    double v16 = (void *)MEMORY[0x1E4F57838];
    double v17 = [(EKEventStore *)self->_store timeZone];
    BOOL v18 = [v16 calendarDateWithAbsoluteTime:v17 timeZone:a4];

    if ((v11 & 0x10) == 0)
    {
      if ((v11 & 0x1000) == 0)
      {
        if ((v11 & 8) == 0)
        {
          id v19 = v15;
          id v20 = v18;
LABEL_9:
          dispatch_time_t v21 = v20;
LABEL_10:
          [v19 absoluteTime];
          a3 = v22;
          [v21 absoluteTime];
          a4 = v23;

          goto LABEL_11;
        }
        if ([v18 differenceInDays:v15] < 7)
        {
          double v24 = [v15 calendarDateForMonth];
          id v19 = [v24 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];

          double v25 = [v18 calendarDateForEndOfMonth];
          dispatch_time_t v21 = [v25 calendarDateForEndOfWeekWithWeekStart:CUIKOneIndexedWeekStart()];

          goto LABEL_10;
        }
      }
      id v19 = [v15 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];
      id v20 = [v18 calendarDateForEndOfWeekWithWeekStart:CUIKOneIndexedWeekStart()];
      goto LABEL_9;
    }
    id v19 = [v15 calendarDateForDay];
    id v20 = [v18 calendarDateForEndOfDay];
    goto LABEL_9;
  }
LABEL_11:
  if (a6) {
    *a6 = a3;
  }
  if (a7) {
    *a7 = a4;
  }
}

- (void)_getLoadStart:(double *)a3 end:(double *)a4 fromLoadedStart:(double)a5 loadedEnd:(double)a6 currentlyLoadingStart:(double)a7 currentlyLoadingEnd:(double)a8
{
  if (a5 == INFINITY)
  {
LABEL_4:
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (a7 == INFINITY)
  {
    a8 = a6;
    a7 = a5;
    goto LABEL_4;
  }
  if (a7 >= a5) {
    a7 = a5;
  }
  if (a8 < a6) {
    a8 = a6;
  }
  if (a3) {
LABEL_5:
  }
    *a3 = a7;
LABEL_6:
  if (a4) {
    *a4 = a8;
  }
}

- (void)_waitForBackgroundLoad
{
  loadGroup = self->_loadGroup;
  dispatch_time_t v3 = dispatch_time(0, 700000000);

  dispatch_group_wait(loadGroup, v3);
}

double __64__CUIKEventLoader__loadIfNeededBetweenStart_end_loadPaddingNow___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 144);
  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 152);
  *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(a1[4] + 168);
  double result = *(double *)(a1[4] + 176);
  *(double *)(*(void *)(a1[8] + 8) + 24) = result;
  return result;
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_24(uint64_t a1)
{
  uint64_t v2 = *(_DWORD **)(a1 + 32);
  if (v2[34] == *(_DWORD *)(a1 + 64))
  {
    [v2 _waitIfSimulatingSlowerLoads];
    dispatch_time_t v3 = *(dispatch_group_t **)(a1 + 32);
    if (*(unsigned char *)(a1 + 68))
    {
      uint64_t v4 = *(unsigned int *)(a1 + 64);
      double v5 = *(double *)(a1 + 48);
      double v6 = *(double *)(a1 + 56);
      uint64_t v7 = *(unsigned __int8 *)(a1 + 69);
      uint64_t v8 = MEMORY[0x1E4F1CBF0];
      [(dispatch_group_t *)v3 handleAsynchronousFetchResults:v8 cancelSeed:v4 start:1 end:v7 filterAll:v5 emptyLoad:v6];
    }
    else
    {
      dispatch_group_enter(v3[15]);
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v12 = *(void **)(v11 + 8);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_25;
      v14[3] = &unk_1E636AAA8;
      v14[4] = v11;
      int v16 = *(_DWORD *)(a1 + 64);
      long long v15 = *(_OWORD *)(a1 + 48);
      char v17 = *(unsigned char *)(a1 + 69);
      id v13 = (id)[v12 fetchEventsMatchingPredicate:v10 resultHandler:v14];
    }
  }
  else
  {
    double v9 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_24_cold_1();
    }
  }
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke()
{
  _firstLoadBegan = 1;
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_25(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) handleAsynchronousFetchResults:a2 cancelSeed:*(unsigned int *)(a1 + 56) start:0 end:*(unsigned __int8 *)(a1 + 60) filterAll:*(double *)(a1 + 40) emptyLoad:*(double *)(a1 + 48)];
  dispatch_time_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 120);

  dispatch_group_leave(v3);
}

- (void)handleAsynchronousFetchResults:(id)a3 cancelSeed:(int)a4 start:(double)a5 end:(double)a6 filterAll:(BOOL)a7 emptyLoad:(BOOL)a8
{
  id v14 = a3;
  long long v15 = v14;
  if (self->_cancelSeed == a4)
  {
    occurrencesLock = self->_occurrencesLock;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__CUIKEventLoader_handleAsynchronousFetchResults_cancelSeed_start_end_filterAll_emptyLoad___block_invoke;
    block[3] = &unk_1E636AAD0;
    block[4] = self;
    BOOL v23 = a7;
    id v19 = v14;
    int v22 = a4;
    double v20 = a5;
    double v21 = a6;
    BOOL v24 = a8;
    dispatch_sync(occurrencesLock, block);
    [(CUIKEventLoader *)self _pruneLoadedOccurrences];
  }
  else
  {
    char v17 = +[CUIKLogSubsystem eventLoader];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_24_cold_1();
    }
  }
}

- (void)_pruneLoadedOccurrences
{
  occurrencesLock = self->_occurrencesLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CUIKEventLoader__pruneLoadedOccurrences__block_invoke;
  block[3] = &unk_1E6369C50;
  block[4] = self;
  dispatch_sync(occurrencesLock, block);
}

double __84__CUIKEventLoader_occurrencesForStartDate_endDate_preSorted_waitForLoad_isComplete___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 32));
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 40));
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), *(id *)(a1[4] + 48));
  *(_DWORD *)(*(void *)(a1[9] + 8) + 24) = *(_DWORD *)(a1[4] + 200);
  *(void *)(*(void *)(a1[10] + 8) + 24) = *(void *)(a1[4] + 144);
  double result = *(double *)(a1[4] + 152);
  *(double *)(*(void *)(a1[11] + 8) + 24) = result;
  return result;
}

- (void)setComponentForExpandingPadding:(unint64_t)a3
{
  if (self->_componentForExpandingPadding != a3) {
    self->_unint64_t componentForExpandingPadding = a3;
  }
}

- (void)setAllowEventLocationPrediction:(BOOL)a3
{
  if (self->_allowEventLocationPrediction != a3)
  {
    self->_allowEventLocationPrediction = a3;
    occurrencesLock = self->_occurrencesLock;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__CUIKEventLoader_setAllowEventLocationPrediction___block_invoke;
    block[3] = &unk_1E6369C50;
    block[4] = self;
    dispatch_sync(occurrencesLock, block);
  }
}

- (void)addOccurrenceAwaitingRefresh:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    occurrencesLock = self->_occurrencesLock;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__CUIKEventLoader_addOccurrenceAwaitingRefresh___block_invoke;
    v7[3] = &unk_1E6369CC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(occurrencesLock, v7);
  }
}

uint64_t __48__CUIKEventLoader_addOccurrenceAwaitingRefresh___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

- (void)addOccurrenceAwaitingDeletion:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    occurrencesLock = self->_occurrencesLock;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__CUIKEventLoader_addOccurrenceAwaitingDeletion___block_invoke;
    v7[3] = &unk_1E6369CC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(occurrencesLock, v7);
  }
}

uint64_t __49__CUIKEventLoader_addOccurrenceAwaitingDeletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
}

- (void)setComponentForExpandingRequests:(unint64_t)a3
{
  if (self->_componentForExpandingRequests != a3)
  {
    self->_componentForExpandingRequests = a3;
    [(CUIKEventLoader *)self loadIfNeeded];
  }
}

- (void)_eventStoreChanged:(id)a3
{
  id v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F25458]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  if (v6 != 2)
  {
    [(CUIKEventLoader *)self _reload];
  }
}

uint64_t __64__CUIKEventLoader__loadIfNeededBetweenStart_end_loadPaddingNow___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadIfNeededBetweenStart:1 end:*(double *)(a1 + 40) loadPaddingNow:*(double *)(a1 + 48)];
}

- (BOOL)firstLoadBegan
{
  return _firstLoadBegan;
}

- (CUIKEventLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CUIKEventLoaderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadQueue, 0);
  objc_storeStrong((id *)&self->_loadGroup, 0);
  objc_storeStrong((id *)&self->_selectedCalendars, 0);
  objc_storeStrong((id *)&self->_occurrencesAwaitingDeletion, 0);
  objc_storeStrong((id *)&self->_occurrencesAwaitingRefresh, 0);
  objc_storeStrong((id *)&self->_loadedProposedTimeOccurrences, 0);
  objc_storeStrong((id *)&self->_loadedOccurrences, 0);
  objc_storeStrong((id *)&self->_occurrencesLock, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

- (void)setPadding:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_DEBUG, "EventLoader: Set padding to %i days", (uint8_t *)v2, 8u);
}

- (void)setCacheLimit:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_DEBUG, "EventLoader: Set cache limit to %i days", (uint8_t *)v2, 8u);
}

- (void)setCacheLimit:(os_log_t)log .cold.2(unsigned int a1, unsigned int *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 134218240;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1BDF08000, log, OS_LOG_TYPE_ERROR, "EventLoader: Attempted to set cache limit to %lu days, which is < the amount of padding (%lu)", (uint8_t *)&v4, 0x16u);
}

- (void)occurrencesForStartDate:(os_log_t)log endDate:preSorted:waitForLoad:isComplete:.cold.1(unsigned int *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 2048;
  uint64_t v6 = v3;
  _os_log_debug_impl(&dword_1BDF08000, log, OS_LOG_TYPE_DEBUG, "EventLoader: Requested occurrences in range (%i) larger than cache limit (%lu)", (uint8_t *)v4, 0x12u);
}

- (void)occurrencesForStartDate:(double)a3 endDate:preSorted:waitForLoad:isComplete:.cold.2(NSObject *a1, double a2, double a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = __GetDateFormatter();
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a2];
  uint64_t v8 = [v6 stringFromDate:v7];
  double v9 = __GetDateFormatter();
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  uint64_t v11 = [v9 stringFromDate:v10];
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_1BDF08000, a1, OS_LOG_TYPE_DEBUG, "EventLoader: Requested occurrences for start: %@, end: %@", v12, 0x16u);
}

- (void)occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1BDF08000, v0, v1, "EventLoader: nil 'startDate' given.  Will not return any occurrences.", v2, v3, v4, v5, v6);
}

- (void)occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1BDF08000, v0, v1, "EventLoader: nil 'endDate' given.  Will not return any occurrences.", v2, v3, v4, v5, v6);
}

- (void)_enqueueLoadForRangeStart:(uint64_t)a1 end:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_DEBUG, "EventLoader: Enqueuing load with predicate %@", (uint8_t *)&v2, 0xCu);
}

- (void)_enqueueLoadForRangeStart:(double)a3 end:.cold.2(NSObject *a1, double a2, double a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = __GetDateFormatter();
  [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a2];
  objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "stringFromDate:");
  double v9 = __GetDateFormatter();
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  uint64_t v11 = [v9 stringFromDate:v10];
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_1BDF08000, a1, OS_LOG_TYPE_ERROR, "EventLoader: Attempted to enqueue load request with start >= end (start = %@, end = %@)", v12, 0x16u);
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_23_cold_1(void *a1)
{
  uint64_t v3 = __GetDateFormatter();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_6_0();
  [v4 dateWithTimeIntervalSinceReferenceDate:*(double *)(v5 + 168)];
  objc_claimAutoreleasedReturnValue();
  uint8_t v6 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "stringFromDate:");
  uint64_t v7 = __GetDateFormatter();
  uint64_t v8 = (void *)OUTLINED_FUNCTION_6_0();
  [v8 dateWithTimeIntervalSinceReferenceDate:*(double *)(v9 + 176)];
  objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "stringFromDate:");
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_0(&dword_1BDF08000, v11, v12, "EventLoader: Set _currentlyLoadingStart = %@, end = %@", v13, v14, v15, v16, v17);
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_23_cold_2(double *a1, double *a2)
{
  uint64_t v5 = __GetDateFormatter();
  [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*a1];
  objc_claimAutoreleasedReturnValue();
  uint8_t v6 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "stringFromDate:");
  uint64_t v7 = __GetDateFormatter();
  [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*a2];
  objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "stringFromDate:");
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_0(&dword_1BDF08000, v9, v10, "EventLoader: Skipped enqueuing load: already loading/loaded on range start = %@, end = %@", v11, v12, v13, v14, v15);
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1BDF08000, v0, v1, "EventLoader: Cancel seeds don't match. Aborting load.", v2, v3, v4, v5, v6);
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1BDF08000, v0, v1, "EventLoader: Set _currentlyLoadingStart, end = NOT_LOADING", v2, v3, v4, v5, v6);
}

void __91__CUIKEventLoader_handleAsynchronousFetchResults_cancelSeed_start_end_filterAll_emptyLoad___block_invoke_cold_1(void *a1)
{
  uint64_t v3 = __GetDateFormatter();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_6_0();
  [v4 dateWithTimeIntervalSinceReferenceDate:*(double *)(v5 + 144)];
  objc_claimAutoreleasedReturnValue();
  uint8_t v6 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "stringFromDate:");
  uint64_t v7 = __GetDateFormatter();
  uint64_t v8 = (void *)OUTLINED_FUNCTION_6_0();
  [v8 dateWithTimeIntervalSinceReferenceDate:*(double *)(v9 + 152)];
  objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "stringFromDate:");
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_0(&dword_1BDF08000, v11, v12, "EventLoader: Loaded range is start: %@, end: %@", v13, v14, v15, v16, v17);
}

void __42__CUIKEventLoader__pruneLoadedOccurrences__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = __GetDateFormatter();
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)(*(void *)a1 + 152)];
  uint64_t v4 = [v2 stringFromDate:v3];
  OUTLINED_FUNCTION_7_0(&dword_1BDF08000, v5, v6, "EventLoader: Pruned end to %@", v7, v8, v9, v10, 2u);
}

void __42__CUIKEventLoader__pruneLoadedOccurrences__block_invoke_cold_2(uint64_t a1)
{
  uint64_t v2 = __GetDateFormatter();
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)(*(void *)a1 + 144)];
  uint64_t v4 = [v2 stringFromDate:v3];
  OUTLINED_FUNCTION_7_0(&dword_1BDF08000, v5, v6, "EventLoader: Pruned start to %@", v7, v8, v9, v10, 2u);
}

@end