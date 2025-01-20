@interface CUIKOccurrenceCacheSearchDataSource
- (BOOL)supportsFakeTodaySection;
- (BOOL)supportsInvitations;
- (CUIKOccurrenceCacheSearchDataSource)initWithEventStore:(id)a3 calendars:(id)a4;
- (id)_createCachedDays;
- (void)_runBlock:(id)a3;
- (void)_runBlock:(id)a3 withRandomDelayUpperbound:(unsigned int)a4;
- (void)_updateCachedDays;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateCachedOccurrences;
- (void)searchWithTerm:(id)a3;
- (void)stopSearching;
@end

@implementation CUIKOccurrenceCacheSearchDataSource

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  p_resultsLock = &self->_resultsLock;
  pthread_mutex_lock(&self->_resultsLock);
  int v4 = self->_searchSeed + 1;
  self->_searchSeed = v4;
  pthread_mutex_unlock(p_resultsLock);
  v5 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = v4;
    _os_log_impl(&dword_1BDF08000, v5, OS_LOG_TYPE_DEFAULT, "Search %i: -[OccurrenceCacheSearchDataSource invalidate]", buf, 8u);
  }

  [(CUIKOccurrenceCacheSearchDataSource *)self stopSearching];
  v6.receiver = self;
  v6.super_class = (Class)CUIKOccurrenceCacheSearchDataSource;
  [(CUIKOccurrenceCacheDataSource *)&v6 invalidateCachedOccurrences];
}

- (void)stopSearching
{
  [(EKSpotlightSearch *)self->_narrowSearch cancel];
  [(EKSpotlightSearch *)self->_distantFutureSearch cancel];
  [(EKSpotlightSearch *)self->_distantPastSearch cancel];
  narrowSearch = self->_narrowSearch;
  self->_narrowSearch = 0;

  distantFutureSearch = self->_distantFutureSearch;
  self->_distantFutureSearch = 0;

  distantPastSearch = self->_distantPastSearch;
  self->_distantPastSearch = 0;

  searchTerm = self->_searchTerm;
  self->_searchTerm = 0;
}

- (CUIKOccurrenceCacheSearchDataSource)initWithEventStore:(id)a3 calendars:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CUIKOccurrenceCacheSearchDataSource;
  int v4 = [(CUIKOccurrenceCacheDataSource *)&v9 initWithEventStore:a3 calendars:a4];
  v5 = v4;
  if (v4)
  {
    pthread_mutex_init(&v4->_resultsLock, 0);
    objc_super v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    processingCachedDays = v5->_processingCachedDays;
    v5->_processingCachedDays = v6;
  }
  return v5;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_resultsLock);
  v3.receiver = self;
  v3.super_class = (Class)CUIKOccurrenceCacheSearchDataSource;
  [(CUIKOccurrenceCacheSearchDataSource *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedDays, 0);
  objc_storeStrong((id *)&self->_processingCachedDays, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_distantPastSearch, 0);
  objc_storeStrong((id *)&self->_distantFutureSearch, 0);

  objc_storeStrong((id *)&self->_narrowSearch, 0);
}

- (BOOL)supportsInvitations
{
  return 0;
}

- (BOOL)supportsFakeTodaySection
{
  return 0;
}

- (void)invalidateCachedOccurrences
{
  int v4 = self->_searchTerm;
  [(CUIKOccurrenceCacheSearchDataSource *)self stopSearching];
  objc_super v3 = v4;
  if (v4)
  {
    [(CUIKOccurrenceCacheSearchDataSource *)self searchWithTerm:v4];
    objc_super v3 = v4;
  }
}

- (void)_updateCachedDays
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CUIKOccurrenceCacheSearchDataSource__updateCachedDays__block_invoke;
  block[3] = &unk_1E6369C50;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__CUIKOccurrenceCacheSearchDataSource__updateCachedDays__block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 88));
  id v2 = *(id *)(*(void *)(a1 + 32) + 152);
  objc_super v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 161) || (v6 = [v2 count], uint64_t v4 = *(void *)(a1 + 32), !v6))
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
    *(unsigned char *)(v4 + 161) = 1;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  int v7 = *(unsigned __int8 *)(v4 + 160);
  *(unsigned char *)(v4 + 160) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 88));
  if (v7 || ![v3 count])
  {
    [*(id *)(a1 + 32) setCachedDays:v3];
    int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = *(void *)(a1 + 32);
    v12 = @"scrollToToday";
    v10 = [NSNumber numberWithBool:v5];
    v13[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [v8 postNotificationName:@"CalendarDataSourceSearchResultsAvailable" object:v9 userInfo:v11];
  }
}

- (void)searchWithTerm:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  if (!v35)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"CUIKOccurrenceCacheSearchDataSource.m", 126, @"Invalid parameter not satisfying: %@", @"term != nil" object file lineNumber description];
  }
  [(EKSpotlightSearch *)self->_narrowSearch cancel];
  [(EKSpotlightSearch *)self->_distantFutureSearch cancel];
  [(EKSpotlightSearch *)self->_distantPastSearch cancel];
  pthread_mutex_lock(&self->_resultsLock);
  int v34 = self->_searchSeed + 1;
  self->_searchSeed = v34;
  uint64_t v6 = [MEMORY[0x1E4F1C978] array];
  sortedDays = self->_sortedDays;
  self->_sortedDays = v6;

  self->_sortedDaysUpdated = 1;
  self->_scrolledToToday = 0;
  pthread_mutex_unlock(&self->_resultsLock);
  v32 = ICSRedactString();
  int v8 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v34;
    LOWORD(v73) = 2114;
    *(void *)((char *)&v73 + 2) = v32;
    _os_log_impl(&dword_1BDF08000, v8, OS_LOG_TYPE_DEFAULT, "Search %i: -[OccurrenceCacheSearchDataSource searchWithTerm:\"%{public}@\"]", buf, 0x12u);
  }

  p_searchTerm = &self->_searchTerm;
  objc_storeStrong((id *)&self->_searchTerm, a3);
  if ([v35 length])
  {
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    char v71 = 1;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke;
    aBlock[3] = &unk_1E636AEA0;
    objc_copyWeak(&v67, &location);
    int v68 = v34;
    aBlock[4] = self;
    aBlock[5] = v70;
    v33 = _Block_copy(aBlock);
    int64_t v10 = [(NSString *)*p_searchTerm UTF8String];
    if (v10) {
      int64_t v10 = strlen((const char *)v10);
    }
    BOOL v11 = v10 < 3;
    v12 = CUIKTodayComponents();
    v13 = CUIKCalendar();
    v14 = objc_msgSend(v13, "dateWithEra:year:month:day:hour:minute:second:nanosecond:", objc_msgSend(v12, "era"), objc_msgSend(v12, "year"), objc_msgSend(v12, "month"), objc_msgSend(v12, "day") - 7, 0, 0, 0, 0);
    uint64_t v15 = objc_msgSend(v13, "dateWithEra:year:month:day:hour:minute:second:nanosecond:", objc_msgSend(v12, "era"), objc_msgSend(v12, "year"), objc_msgSend(v12, "month"), objc_msgSend(v12, "day") + 14, 0, 0, 0, 0);
    v29 = [MEMORY[0x1E4F25628] queryStringForSearchTerm:*p_searchTerm matchingTypes:v11 fromStartDate:v14 toEndDate:v15];
    v30 = [MEMORY[0x1E4F25628] queryStringForSearchTerm:*p_searchTerm matchingTypes:v11 fromStartDate:v15 toEndDate:0];
    v28 = (void *)v15;
    v31 = [MEMORY[0x1E4F25628] queryStringForSearchTerm:*p_searchTerm matchingTypes:v11 fromStartDate:0 toEndDate:v14];
    *(void *)buf = 0;
    *(void *)&long long v73 = buf;
    *((void *)&v73 + 1) = 0x3032000000;
    v74 = __Block_byref_object_copy__11;
    v75 = __Block_byref_object_dispose__11;
    id v76 = 0;
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x3032000000;
    v64[3] = __Block_byref_object_copy__11;
    v64[4] = __Block_byref_object_dispose__11;
    id v65 = 0;
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x3032000000;
    v62[3] = __Block_byref_object_copy__11;
    v62[4] = __Block_byref_object_dispose__11;
    id v63 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    char v61 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    char v59 = 0;
    uint64_t v52 = 0;
    v53 = (id *)&v52;
    uint64_t v54 = 0x3042000000;
    v55 = __Block_byref_object_copy__41;
    v56 = __Block_byref_object_dispose__42;
    id v57 = 0;
    uint64_t v46 = 0;
    v47 = (id *)&v46;
    uint64_t v48 = 0x3042000000;
    v49 = __Block_byref_object_copy__41;
    v50 = __Block_byref_object_dispose__42;
    id v51 = 0;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_43;
    v43[3] = &unk_1E636AEC8;
    objc_copyWeak(&v44, &location);
    v43[4] = &v46;
    v43[5] = v60;
    int v45 = v34;
    v43[6] = v64;
    v43[7] = buf;
    v43[8] = v58;
    v43[9] = v62;
    v16 = _Block_copy(v43);
    v17 = [MEMORY[0x1E4F25628] searchWithCSQuery:v31 inStore:self->super._eventStore inCalendars:0 resultHandler:v33 completionHandler:v16];
    distantPastSearch = self->_distantPastSearch;
    self->_distantPastSearch = v17;

    v19 = [MEMORY[0x1E4F25628] searchWithCSQuery:v30 inStore:self->super._eventStore inCalendars:0 resultHandler:v33 completionHandler:v16];
    distantFutureSearch = self->_distantFutureSearch;
    self->_distantFutureSearch = v19;

    objc_storeWeak(v53 + 5, self->_distantPastSearch);
    objc_storeWeak(v47 + 5, self->_distantFutureSearch);
    v21 = (void *)MEMORY[0x1E4F25628];
    eventStore = self->super._eventStore;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_46;
    v40[3] = &unk_1E636AF18;
    objc_copyWeak(&v41, &location);
    int v42 = v34;
    v40[6] = v60;
    v40[7] = v58;
    v40[4] = self;
    v40[5] = buf;
    v40[8] = &v46;
    v40[9] = v64;
    v40[10] = &v52;
    v40[11] = v62;
    v23 = [v21 searchWithCSQuery:v29 inStore:eventStore inCalendars:0 resultHandler:v33 completionHandler:v40];
    narrowSearch = self->_narrowSearch;
    self->_narrowSearch = v23;

    v25 = self->_narrowSearch;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_49;
    v36[3] = &unk_1E636AEF0;
    int v39 = v34;
    v38 = buf;
    v26 = v25;
    v37 = v26;
    [(CUIKOccurrenceCacheSearchDataSource *)self _runBlock:v36];

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v44);
    _Block_object_dispose(&v46, 8);
    objc_destroyWeak(&v51);
    _Block_object_dispose(&v52, 8);
    objc_destroyWeak(&v57);
    _Block_object_dispose(v58, 8);
    _Block_object_dispose(v60, 8);
    _Block_object_dispose(v62, 8);

    _Block_object_dispose(v64, 8);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&v67);
    objc_destroyWeak(&location);
    _Block_object_dispose(v70, 8);
  }
  else
  {
    [(CUIKOccurrenceCacheSearchDataSource *)self _updateCachedDays];
  }
}

void __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v6 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)buf = 67109376;
      int v67 = v7;
      __int16 v68 = 2048;
      uint64_t v69 = [v4 count];
      _os_log_impl(&dword_1BDF08000, v6, OS_LOG_TYPE_DEFAULT, "Search %i: Spotlight handler called with matches: %lu", buf, 0x12u);
    }

    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 88));
    if (*(_DWORD *)(*(void *)(a1 + 32) + 164) == *(_DWORD *)(a1 + 56))
    {
      id v41 = (pthread_mutex_t *)(WeakRetained + 88);
      uint64_t v42 = a1;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        objc_msgSend(*((id *)WeakRetained + 10), "removeAllObjects", v41);
      }
      id v51 = *((id *)WeakRetained + 10);
      int v8 = CUIKCalendar();
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v43 = v4;
      id v9 = v4;
      uint64_t v48 = [v9 countByEnumeratingWithState:&v60 objects:v65 count:16];
      if (v48)
      {
        uint64_t v47 = *(void *)v61;
        id v44 = v9;
        int v45 = WeakRetained;
        v49 = v8;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v61 != v47) {
              objc_enumerationMutation(v9);
            }
            uint64_t v52 = v10;
            BOOL v11 = *(void **)(*((void *)&v60 + 1) + 8 * v10);
            int v12 = objc_msgSend(*((id *)WeakRetained + 1), "showDeclinedEvents", v41);
            v13 = [v11 selfAttendee];
            uint64_t v14 = [v13 participantStatus];

            if (v14 != 3 || v12 != 0)
            {
              v16 = (void *)*((void *)WeakRetained + 2);
              v17 = [v11 calendar];
              LODWORD(v16) = [v16 containsObject:v17];

              if (v16)
              {
                v18 = [v11 endDateUnadjustedForLegacyClients];
                v19 = CUIKTimeZoneForChoice((void *)1);
                v20 = [v18 dateForDayInTimeZone:v19];

                uint64_t v46 = v18;
                int v53 = [v18 isEqualToDate:v20];
                v21 = [v11 startDate];
                if ([v21 isBeforeOrSameDayAsDate:v20 inCalendar:v8])
                {
                  v22 = v51;
                  v50 = v20;
                  while (([v21 isSameDayAsDate:v20 inCalendar:v8] & v53 & 1) == 0)
                  {
                    v23 = CUIKTimeZoneForChoice((void *)1);
                    v24 = [v21 dateForDayInTimeZone:v23];

                    v25 = [v22 objectForKeyedSubscript:v24];
                    if (v25)
                    {
                      long long v58 = 0u;
                      long long v59 = 0u;
                      long long v56 = 0u;
                      long long v57 = 0u;
                      id v26 = v25;
                      uint64_t v27 = [v26 countByEnumeratingWithState:&v56 objects:v64 count:16];
                      if (v27)
                      {
                        uint64_t v28 = v27;
                        uint64_t v29 = *(void *)v57;
                        while (2)
                        {
                          for (uint64_t i = 0; i != v28; ++i)
                          {
                            if (*(void *)v57 != v29) {
                              objc_enumerationMutation(v26);
                            }
                            v31 = [*(id *)(*((void *)&v56 + 1) + 8 * i) objectForKeyedSubscript:CUIKOccurrenceInfoEventKey];
                            char v32 = [v31 isEqual:v11];

                            if (v32)
                            {

                              int v8 = v49;
                              v33 = [v49 dateByAddingUnit:16 value:1 toDate:v21 options:0];
                              v20 = v50;
                              v22 = v51;
                              goto LABEL_33;
                            }
                          }
                          uint64_t v28 = [v26 countByEnumeratingWithState:&v56 objects:v64 count:16];
                          if (v28) {
                            continue;
                          }
                          break;
                        }
                      }

                      v20 = v50;
                      v22 = v51;
                      int v8 = v49;
                    }
                    else
                    {
                      id v26 = (id)objc_opt_new();
                      [v22 setObject:v26 forKeyedSubscript:v24];
                    }
                    int v34 = objc_opt_new();
                    [v34 setObject:v11 forKeyedSubscript:CUIKOccurrenceInfoEventKey];
                    id v35 = [v11 startDate];
                    [v34 setObject:v35 forKeyedSubscript:CUIKOccurrenceInfoDateKey];

                    [v26 addObject:v34];
                    v33 = [v8 dateByAddingUnit:16 value:1 toDate:v21 options:0];

                    v21 = v34;
LABEL_33:

                    v21 = v33;
                    if (([v33 isBeforeOrSameDayAsDate:v20 inCalendar:v8] & 1) == 0) {
                      goto LABEL_36;
                    }
                  }
                }
                v33 = v21;
LABEL_36:

                id v9 = v44;
                WeakRetained = v45;
              }
            }
            uint64_t v10 = v52 + 1;
          }
          while (v52 + 1 != v48);
          uint64_t v48 = [v9 countByEnumeratingWithState:&v60 objects:v65 count:16];
        }
        while (v48);
      }

      uint64_t v36 = *(void *)(*(void *)(v42 + 40) + 8);
      if (*(unsigned char *)(v36 + 24)) {
        *(unsigned char *)(v36 + 24) = 0;
      }
      v37 = objc_opt_new();
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_34;
      v54[3] = &unk_1E636AE78;
      id v55 = v37;
      id v38 = v37;
      [v51 enumerateKeysAndObjectsUsingBlock:v54];
      uint64_t v39 = [v38 sortedArrayUsingComparator:&__block_literal_global_38];
      v40 = (void *)*((void *)WeakRetained + 19);
      *((void *)WeakRetained + 19) = v39;

      *(unsigned char *)(*(void *)(v42 + 32) + 160) = 1;
      pthread_mutex_unlock(v41);

      id v4 = v43;
    }
    else
    {
      pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 88));
    }
  }
}

void __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v11 = [a3 sortedArrayUsingComparator:&__block_literal_global_23];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  int v7 = CUIKOccurrenceCacheDayKey;
  int v8 = CUIKOccurrenceCacheOccurrencesKey;
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  uint64_t v10 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v5, v7, v11, v8, v9, CUIKOccurrenceCacheOccurrenceCountKey, 0);

  [*(id *)(a1 + 32) addObject:v10];
}

uint64_t __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = CUIKOccurrenceInfoDateKey;
  id v5 = a3;
  uint64_t v6 = [a2 objectForKeyedSubscript:v4];
  int v7 = [v5 objectForKeyedSubscript:CUIKOccurrenceInfoDateKey];

  uint64_t v8 = [v6 compare:v7];
  return v8;
}

uint64_t __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = CUIKOccurrenceCacheDayKey;
  id v5 = a3;
  uint64_t v6 = [a2 objectForKeyedSubscript:v4];
  int v7 = [v5 objectForKeyedSubscript:CUIKOccurrenceCacheDayKey];

  uint64_t v8 = [v6 compare:v7];
  return v8;
}

void __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateCachedDays];
    id v6 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));

    if (v6 == v3)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      int v7 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = *(_DWORD *)(a1 + 88);
        id v9 = [MEMORY[0x1E4F1C9C8] date];
        [v9 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        uint64_t v17 = v16;
        int v12 = [MEMORY[0x1E4F1C9C8] date];
        [v12 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        int v19 = 67109632;
        int v20 = v15;
        __int16 v21 = 2048;
        uint64_t v22 = v17;
        __int16 v23 = 2048;
        uint64_t v24 = v18;
        uint64_t v14 = "Search %i: Distant future search end: %f, %f";
        goto LABEL_7;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      int v7 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = *(_DWORD *)(a1 + 88);
        id v9 = [MEMORY[0x1E4F1C9C8] date];
        [v9 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
        uint64_t v11 = v10;
        int v12 = [MEMORY[0x1E4F1C9C8] date];
        [v12 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        int v19 = 67109632;
        int v20 = v8;
        __int16 v21 = 2048;
        uint64_t v22 = v11;
        __int16 v23 = 2048;
        uint64_t v24 = v13;
        uint64_t v14 = "Search %i: Distant past search end: %f, %f";
LABEL_7:
        _os_log_impl(&dword_1BDF08000, v7, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, 0x1Cu);
      }
    }
  }
}

void __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_46(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 96));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 88));
    int v4 = *(_DWORD *)(a1 + 104);
    int v5 = *((_DWORD *)v3 + 41);
    pthread_mutex_unlock((pthread_mutex_t *)(v3 + 88));
    id v6 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(_DWORD *)(a1 + 104);
      int v8 = [MEMORY[0x1E4F1C9C8] date];
      [v8 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      *(_DWORD *)buf = 67109376;
      int v27 = v7;
      __int16 v28 = 2048;
      uint64_t v29 = v9;
      _os_log_impl(&dword_1BDF08000, v6, OS_LOG_TYPE_DEFAULT, "Search %i: Narrow search end: %f", buf, 0x12u);
    }
    if (v4 == v5)
    {
      [v3 _updateCachedDays];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      id v10 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
      uint64_t v11 = *(void **)(a1 + 32);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_47;
      v22[3] = &unk_1E636AEF0;
      int v25 = *(_DWORD *)(a1 + 104);
      uint64_t v12 = *(void *)(a1 + 72);
      id v23 = v10;
      uint64_t v24 = v12;
      id v13 = v10;
      [v11 _runBlock:v22];
      id v14 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
      int v15 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_48;
      v18[3] = &unk_1E636AEF0;
      int v21 = *(_DWORD *)(a1 + 104);
      uint64_t v16 = *(void *)(a1 + 88);
      id v19 = v14;
      uint64_t v20 = v16;
      id v17 = v14;
      [v15 _runBlock:v18];
    }
  }
}

uint64_t __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_47(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1BDF08000, v2, OS_LOG_TYPE_DEFAULT, "Search %i: Distant future search start", (uint8_t *)v8, 8u);
  }

  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return [*(id *)(a1 + 32) start];
}

uint64_t __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_48(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1BDF08000, v2, OS_LOG_TYPE_DEFAULT, "Search %i: Distant past search start", (uint8_t *)v8, 8u);
  }

  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return [*(id *)(a1 + 32) start];
}

uint64_t __54__CUIKOccurrenceCacheSearchDataSource_searchWithTerm___block_invoke_49(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1BDF08000, v2, OS_LOG_TYPE_DEFAULT, "Search %i: Narrow search start", (uint8_t *)v8, 8u);
  }

  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return [*(id *)(a1 + 32) start];
}

- (void)_runBlock:(id)a3
{
}

- (void)_runBlock:(id)a3 withRandomDelayUpperbound:(unsigned int)a4
{
  dispatch_block_t block = a3;
  signed int v5 = arc4random_uniform(a4);
  dispatch_time_t v6 = dispatch_time(0, 1000000000 * v5);
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

- (id)_createCachedDays
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

  return v2;
}

@end