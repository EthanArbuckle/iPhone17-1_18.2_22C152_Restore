@interface CalSearch
- (BOOL)moreResultsAvailable;
- (BOOL)searchAttendees;
- (BOOL)searchLocations;
- (BOOL)searchParticipants;
- (BOOL)shouldMatchLocationsOnlyForEventSearch;
- (CalEventIdsSearchContext)_createEventIdsSearchContext;
- (CalEventOccurrenceSearchContext)_createSearchContext;
- (CalLocationIdsSearchContext)_createLocationIdsSearchContext;
- (CalParticipantIdsSearchContext)_createParticipantIdsSearchContext;
- (CalSearch)initWithDatabase:(CalDatabase *)a3 filter:(CalFilter *)a4 dataSink:(id)a5;
- (int)seed;
- (void)_addMatchedEventIds:(__CFArray *)a3;
- (void)_addMatchedLocationIds:(__CFArray *)a3;
- (void)_addMatchedParticipantIds:(__CFArray *)a3;
- (void)_deleteEventIdsSearchContext:(CalEventIdsSearchContext *)a3;
- (void)_deleteLocationIdsSearchContext:(CalLocationIdsSearchContext *)a3;
- (void)_deleteParticipantIdsSearchContext:(CalParticipantIdsSearchContext *)a3;
- (void)_deleteSearchContext:(CalEventOccurrenceSearchContext *)a3;
- (void)_getApplicationSearchResults:(CalEventOccurrenceSearchContext *)a3;
- (void)_getAttendeesSearchResults:(CalEventIdsSearchContext *)a3;
- (void)_getEventsSearchResults:(CalEventIdsSearchContext *)a3;
- (void)_getLocationSearchResults:(CalLocationIdsSearchContext *)a3;
- (void)_getParticipantsSearchResults:(CalParticipantIdsSearchContext *)a3;
- (void)_startLoadingResults;
- (void)dealloc;
- (void)setSearchAttendees:(BOOL)a3;
- (void)setSearchLocations:(BOOL)a3;
- (void)setSearchParticipants:(BOOL)a3;
- (void)setShouldMatchLocationsOnlyForEventSearch:(BOOL)a3;
- (void)startSearching;
- (void)stopSearching;
@end

@implementation CalSearch

- (CalSearch)initWithDatabase:(CalDatabase *)a3 filter:(CalFilter *)a4 dataSink:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CalSearch;
  v9 = [(CalSearch *)&v15 init];
  if (v9)
  {
    v9->_database = (CalDatabase *)CFRetain(a3);
    v10 = (CalFilter *)CFRetain(a4);
    v9->_filter = v10;
    CFStringRef SearchTerm = (const __CFString *)CalFilterGetSearchTerm(v10);
    v9->_searchString = (__CFString *)SearchTerm;
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (SearchTerm) {
      v9->_searchString = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], SearchTerm);
    }
    v9->_partialResults = CFArrayCreateMutable(v12, 0, 0);
    v13 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
    v9->_partialCachedOccurrences = CFArrayCreateMutable(v12, 0, MEMORY[0x1E4F1D510]);
    v9->_partialCachedDays = CFArrayCreateMutable(v12, 0, v13);
    v9->_partialCachedDaysIndexes = CFArrayCreateMutable(v12, 0, 0);
    v9->_matchedEventsSet = CFSetCreateMutable(v12, 0, 0);
    v9->_matchedParticipantsSet = CFSetCreateMutable(v12, 0, 0);
    v9->_matchedLocationsSet = CFSetCreateMutable(v12, 0, 0);
    objc_storeWeak((id *)&v9->_dataSink, v8);
    v9->_implementsCancellationCallback = objc_opt_respondsToSelector() & 1;
    v9->_seed = ++sSeed;
    pthread_mutex_init(&v9->_dataSourceDeallocLock, 0);
  }

  return v9;
}

- (void)dealloc
{
  self->_stopLoadingResults = 1;
  p_dataSourceDeallocLock = &self->_dataSourceDeallocLock;
  pthread_mutex_lock(&self->_dataSourceDeallocLock);
  pthread_mutex_unlock(p_dataSourceDeallocLock);
  pthread_mutex_destroy(p_dataSourceDeallocLock);
  partialResults = self->_partialResults;
  if (partialResults) {
    CFRelease(partialResults);
  }
  partialCachedOccurrences = self->_partialCachedOccurrences;
  if (partialCachedOccurrences) {
    CFRelease(partialCachedOccurrences);
  }
  partialCachedDays = self->_partialCachedDays;
  if (partialCachedDays) {
    CFRelease(partialCachedDays);
  }
  partialCachedDaysIndexes = self->_partialCachedDaysIndexes;
  if (partialCachedDaysIndexes) {
    CFRelease(partialCachedDaysIndexes);
  }
  matchedEventsSet = self->_matchedEventsSet;
  if (matchedEventsSet) {
    CFRelease(matchedEventsSet);
  }
  matchedParticipantsSet = self->_matchedParticipantsSet;
  if (matchedParticipantsSet) {
    CFRelease(matchedParticipantsSet);
  }
  matchedLocationsSet = self->_matchedLocationsSet;
  if (matchedLocationsSet) {
    CFRelease(matchedLocationsSet);
  }
  filter = self->_filter;
  if (filter) {
    CFRelease(filter);
  }
  searchString = self->_searchString;
  if (searchString) {
    CFRelease(searchString);
  }
  database = self->_database;
  if (database) {
    CFRelease(database);
  }
  objc_storeWeak((id *)&self->_dataSink, 0);
  v14.receiver = self;
  v14.super_class = (Class)CalSearch;
  [(CalSearch *)&v14 dealloc];
}

- (void)startSearching
{
  sched_param v8 = 0;
  int v7 = 0;
  v3 = pthread_self();
  if (!pthread_getschedparam(v3, &v7, &v8))
  {
    int sched_priority = v8.sched_priority;
    v8.int sched_priority = sched_get_priority_min(v7);
    v5 = pthread_self();
    if (!pthread_setschedparam(v5, v7, &v8))
    {
      v8.int sched_priority = sched_priority;
      v6 = pthread_self();
      pthread_setschedparam(v6, v7, &v8);
    }
  }
  [(CalSearch *)self _startLoadingResults];
}

- (void)stopSearching
{
  self->_stopLoadingResults = 1;
}

- (BOOL)moreResultsAvailable
{
  return self->_moreResultsAvailable;
}

- (int)seed
{
  return self->_seed;
}

- (void)_startLoadingResults
{
  p_dataSourceDeallocLock = &self->_dataSourceDeallocLock;
  pthread_mutex_lock(&self->_dataSourceDeallocLock);
  self->_stopLoadingResults = 0;
  self->_moreResultsAvailable = 1;
  if ([(CalSearch *)self searchParticipants])
  {
    v4 = [(CalSearch *)self _createParticipantIdsSearchContext];
    [(CalSearch *)self _getParticipantsSearchResults:v4];
    [(CalSearch *)self _deleteParticipantIdsSearchContext:v4];
  }
  if ([(CalSearch *)self searchLocations])
  {
    v5 = [(CalSearch *)self _createLocationIdsSearchContext];
    if (!self->_stopLoadingResults)
    {
      self->_moreResultsAvailable = 1;
      [(CalSearch *)self _getLocationSearchResults:v5];
    }
    [(CalSearch *)self _deleteLocationIdsSearchContext:v5];
  }
  v6 = [(CalSearch *)self _createEventIdsSearchContext];
  if ([(CalSearch *)self searchAttendees])
  {
    if (self->_stopLoadingResults) {
      goto LABEL_12;
    }
    self->_moreResultsAvailable = 1;
    [(CalSearch *)self _getAttendeesSearchResults:v6];
  }
  if (!self->_stopLoadingResults)
  {
    self->_moreResultsAvailable = 1;
    [(CalSearch *)self _getEventsSearchResults:v6];
  }
LABEL_12:
  [(CalSearch *)self _deleteEventIdsSearchContext:v6];
  if (!self->_stopLoadingResults && CFSetGetCount(self->_matchedEventsSet))
  {
    self->_moreResultsAvailable = 1;
    int v7 = [(CalSearch *)self _createSearchContext];
    [(CalSearch *)self _getApplicationSearchResults:v7];
    [(CalSearch *)self _deleteSearchContext:v7];
  }
  pthread_mutex_unlock(p_dataSourceDeallocLock);
  if (!self->_stopLoadingResults)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSink);
    [WeakRetained calSearchComplete:self];
  }
}

- (void)_addMatchedEventIds:(__CFArray *)a3
{
  CFIndex Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    CFIndex v6 = Count;
    for (CFIndex i = 0; i != v6; ++i)
    {
      signed int ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      CFSetAddValue(self->_matchedEventsSet, (const void *)ValueAtIndex);
    }
  }
}

- (void)_addMatchedParticipantIds:(__CFArray *)a3
{
  CFIndex Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    CFIndex v6 = Count;
    for (CFIndex i = 0; i != v6; ++i)
    {
      signed int ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      CFSetAddValue(self->_matchedParticipantsSet, (const void *)ValueAtIndex);
    }
  }
}

- (void)_getParticipantsSearchResults:(CalParticipantIdsSearchContext *)a3
{
  if (self->_stopLoadingResults)
  {
    ParticipantsSearchStatement = 0;
  }
  else
  {
    ParticipantsSearchStatement = (sqlite3_stmt **)CalDatabaseCreateParticipantsSearchStatement((uint64_t)a3, self->_searchString);
    if (!ParticipantsSearchStatement)
    {
      self->_stopLoadingResults = 1;
      self->_moreResultsAvailable = 0;
      return;
    }
  }
  while (self->_moreResultsAvailable && !self->_stopLoadingResults)
  {
    CalDatabaseCopyParticipantIdsThatMatchSearch(ParticipantsSearchStatement, (uint64_t)a3);
    if (CFArrayGetCount(a3->var0)) {
      [(CalSearch *)self _addMatchedParticipantIds:a3->var0];
    }
  }
  if (ParticipantsSearchStatement)
  {
    CalDatabaseDeleteParticipantsSearchStatement((uint64_t **)ParticipantsSearchStatement, (uint64_t)a3);
  }
}

- (CalParticipantIdsSearchContext)_createParticipantIdsSearchContext
{
  result = (CalParticipantIdsSearchContext *)malloc_type_malloc(0x28uLL, 0x10300408B9D0061uLL);
  result->var0 = self->_partialResults;
  result->var2 = &self->_moreResultsAvailable;
  result->var3 = &self->_stopLoadingResults;
  result->var4 = self->_database;
  result->var1 = 10;
  return result;
}

- (void)_deleteParticipantIdsSearchContext:(CalParticipantIdsSearchContext *)a3
{
  CFArrayRemoveAllValues(a3->var0);
  free(a3);
}

- (CalLocationIdsSearchContext)_createLocationIdsSearchContext
{
  result = (CalLocationIdsSearchContext *)malloc_type_malloc(0x28uLL, 0x10300408B9D0061uLL);
  result->var0 = self->_partialResults;
  result->var2 = &self->_moreResultsAvailable;
  result->var3 = &self->_stopLoadingResults;
  result->var4 = self->_database;
  result->var1 = 10;
  return result;
}

- (void)_deleteLocationIdsSearchContext:(CalLocationIdsSearchContext *)a3
{
  CFArrayRemoveAllValues(a3->var0);
  free(a3);
}

- (void)_addMatchedLocationIds:(__CFArray *)a3
{
  CFIndex Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    CFIndex v6 = Count;
    for (CFIndex i = 0; i != v6; ++i)
    {
      signed int ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      CFSetAddValue(self->_matchedLocationsSet, (const void *)ValueAtIndex);
    }
  }
}

- (void)_getLocationSearchResults:(CalLocationIdsSearchContext *)a3
{
  if (self->_stopLoadingResults)
  {
    LocationSearchStatement = 0;
  }
  else
  {
    LocationSearchStatement = (sqlite3_stmt **)CalDatabaseCreateLocationSearchStatement((uint64_t)a3, self->_searchString);
    if (!LocationSearchStatement)
    {
      self->_stopLoadingResults = 1;
      self->_moreResultsAvailable = 0;
      return;
    }
  }
  while (self->_moreResultsAvailable && !self->_stopLoadingResults)
  {
    CalDatabaseCopyLocationIdsThatMatchSearch(LocationSearchStatement, (uint64_t)a3);
    if (CFArrayGetCount(a3->var0)) {
      [(CalSearch *)self _addMatchedLocationIds:a3->var0];
    }
  }
  if (LocationSearchStatement)
  {
    CalDatabaseDeleteLocationSearchStatement((uint64_t **)LocationSearchStatement, (uint64_t)a3);
  }
}

- (void)_getAttendeesSearchResults:(CalEventIdsSearchContext *)a3
{
  if (self->_stopLoadingResults)
  {
    AttendeesSearchStatement = 0;
  }
  else
  {
    AttendeesSearchStatement = (sqlite3_stmt **)CalDatabaseCreateAttendeesSearchStatement((uint64_t *)a3);
    if (!AttendeesSearchStatement)
    {
      self->_stopLoadingResults = 1;
      self->_moreResultsAvailable = 0;
      return;
    }
  }
  while (self->_moreResultsAvailable && !self->_stopLoadingResults)
  {
    CalDatabaseCopyEventIdsForSearch(AttendeesSearchStatement, (uint64_t)a3);
    if (CFArrayGetCount(a3->var0)) {
      [(CalSearch *)self _addMatchedEventIds:a3->var0];
    }
  }
  if (AttendeesSearchStatement)
  {
    CalDatabaseDeleteAttendeesSearchStatement((uint64_t **)AttendeesSearchStatement, (uint64_t)a3);
  }
}

- (void)_getEventsSearchResults:(CalEventIdsSearchContext *)a3
{
  if (self->_stopLoadingResults)
  {
    EventsSearchStatement = 0;
  }
  else
  {
    EventsSearchStatement = (sqlite3_stmt **)CalDatabaseCreateEventsSearchStatement((uint64_t *)a3, self->_filter, self->_shouldMatchLocationsOnlyForEventSearch);
    if (!EventsSearchStatement)
    {
      self->_stopLoadingResults = 1;
      self->_moreResultsAvailable = 0;
      return;
    }
  }
  while (self->_moreResultsAvailable && !self->_stopLoadingResults)
  {
    CalDatabaseCopyEventIdsForSearch(EventsSearchStatement, (uint64_t)a3);
    if (CFArrayGetCount(a3->var0)) {
      [(CalSearch *)self _addMatchedEventIds:a3->var0];
    }
  }
  if (EventsSearchStatement)
  {
    CalDatabaseDeleteEventsSearchStatement((uint64_t **)EventsSearchStatement, (uint64_t)a3);
  }
}

- (CalEventIdsSearchContext)_createEventIdsSearchContext
{
  result = (CalEventIdsSearchContext *)malloc_type_malloc(0x30uLL, 0x700401BCA1C85uLL);
  result->var0 = self->_partialResults;
  result->var1 = self->_matchedParticipantsSet;
  result->var2 = self->_matchedLocationsSet;
  result->var3 = &self->_moreResultsAvailable;
  result->var4 = &self->_stopLoadingResults;
  result->var5 = self->_database;
  return result;
}

- (void)_deleteEventIdsSearchContext:(CalEventIdsSearchContext *)a3
{
  CFArrayRemoveAllValues(a3->var0);
  free(a3);
}

- (void)_getApplicationSearchResults:(CalEventOccurrenceSearchContext *)a3
{
  if (self->_moreResultsAvailable)
  {
    p_dataSink = &self->_dataSink;
    do
    {
      if (self->_stopLoadingResults) {
        break;
      }
      CFIndex v6 = (CalEventOccurrenceCache *)CalDatabaseCopyEventOccurrenceCache((os_unfair_lock_s *)self->_database);
      a3->var11 = v6;
      OccurrencesThatMatchEventIdsStatement = (uint64_t *)CalDatabaseCreateOccurrencesThatMatchEventIdsStatement(self->_filter, (uint64_t)a3);
      CalDatabaseRegisterProgressHandlerForOccurrencesSearch((uint64_t)a3, OccurrencesThatMatchEventIdsStatement);
      _CalDatabaseCopyEventOccurrencesThatMatchEventIds((uint64_t)a3, (sqlite3_stmt **)OccurrencesThatMatchEventIdsStatement);
      if (CFArrayGetCount(self->_partialCachedOccurrences))
      {
        id WeakRetained = objc_loadWeakRetained((id *)p_dataSink);
        [WeakRetained calSearch:self foundOccurrences:self->_partialCachedOccurrences cachedDays:self->_partialCachedDays cachedDaysIndexes:self->_partialCachedDaysIndexes];

        partialCachedOccurrences = self->_partialCachedOccurrences;
        if (partialCachedOccurrences) {
          CFArrayRemoveAllValues(partialCachedOccurrences);
        }
        partialCachedDays = self->_partialCachedDays;
        if (partialCachedDays) {
          CFArrayRemoveAllValues(partialCachedDays);
        }
        partialCachedDaysIndexes = self->_partialCachedDaysIndexes;
        if (partialCachedDaysIndexes) {
          CFArrayRemoveAllValues(partialCachedDaysIndexes);
        }
      }
      if (!self->_dateToStartShowingResultsSentToDataSink && (a3->var18 || !self->_moreResultsAvailable))
      {
        self->_dateToStartShowingResultsSentToDataSink = 1;
        id v12 = objc_loadWeakRetained((id *)p_dataSink);
        [v12 calSearch:self showResultsStartingOnDate:a3->var19];
      }
      CalDatabaseUnregisterProgressHandlerForOccurrencesSearch(OccurrencesThatMatchEventIdsStatement);
      CalDatabaseDeleteOccurrencesThatMatchEventIdsStatement((uint64_t)a3, (uint64_t **)OccurrencesThatMatchEventIdsStatement);
      CFRelease(v6);
    }
    while (self->_moreResultsAvailable);
  }
}

- (CalEventOccurrenceSearchContext)_createSearchContext
{
  v3 = (CalEventOccurrenceSearchContext *)malloc_type_malloc(0x98uLL, 0x10F0040B991B105uLL);
  v3->var0 = self->_matchedEventsSet;
  v3->var1 = self->_partialCachedOccurrences;
  v3->var2 = self->_partialCachedDays;
  v3->var3 = self->_partialCachedDaysIndexes;
  v3->var4 = &self->_moreResultsAvailable;
  v3->var5 = &self->_stopLoadingResults;
  v3->var10 = 0;
  v3->var11 = 0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v5 = (const void *)CalCopySystemTimeZone();
  CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
  CalGregorianDateGetGregorianDateForDay();
  CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone();
  CalAbsoluteTimeAddGregorianUnits();
  v3->var7 = v6;
  CalAbsoluteTimeAddGregorianUnits();
  v3->var9 = v7;
  if (v5) {
    CFRelease(v5);
  }
  v3->var6 = v3->var7;
  v3->var13 = self;
  v3->var14 = 200;
  if (self->_implementsCancellationCallback) {
    sched_param v8 = _applicationOccurrencesCancellationCallback;
  }
  else {
    sched_param v8 = 0;
  }
  v3->var12 = v8;
  v3->var15 = 1;
  v3->var17 = Current;
  v3->var18 = 0;
  v3->var19 = *(double *)MEMORY[0x1E4F57888];
  return v3;
}

- (void)_deleteSearchContext:(CalEventOccurrenceSearchContext *)a3
{
}

- (BOOL)searchParticipants
{
  return self->_searchParticipants;
}

- (void)setSearchParticipants:(BOOL)a3
{
  self->_searchParticipants = a3;
}

- (BOOL)searchLocations
{
  return self->_searchLocations;
}

- (void)setSearchLocations:(BOOL)a3
{
  self->_searchLocations = a3;
}

- (BOOL)searchAttendees
{
  return self->_searchAttendees;
}

- (void)setSearchAttendees:(BOOL)a3
{
  self->_searchAttendees = a3;
}

- (BOOL)shouldMatchLocationsOnlyForEventSearch
{
  return self->_shouldMatchLocationsOnlyForEventSearch;
}

- (void)setShouldMatchLocationsOnlyForEventSearch:(BOOL)a3
{
  self->_shouldMatchLocationsOnlyForEventSearch = a3;
}

- (void).cxx_destruct
{
}

@end