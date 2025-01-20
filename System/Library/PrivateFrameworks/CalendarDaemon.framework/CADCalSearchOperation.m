@interface CADCalSearchOperation
+ (id)operationWithConnection:(id)a3 searchTerm:(id)a4 calendars:(id)a5 replyID:(unsigned int)a6;
- (CADCalSearchOperation)initWithConnection:(id)a3 searchTerm:(id)a4 calendars:(id)a5 replyID:(unsigned int)a6;
- (unsigned)replyID;
- (void)_completeOperation;
- (void)calSearch:(id)a3 foundOccurrences:(__CFArray *)a4 cachedDays:(__CFArray *)a5 cachedDaysIndexes:(__CFArray *)a6;
- (void)calSearchComplete:(id)a3;
- (void)cancel;
- (void)configureSearch:(id)a3;
- (void)dealloc;
- (void)main;
@end

@implementation CADCalSearchOperation

+ (id)operationWithConnection:(id)a3 searchTerm:(id)a4 calendars:(id)a5 replyID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConnection:v11 searchTerm:v10 calendars:v9 replyID:v6];

  return v12;
}

- (CADCalSearchOperation)initWithConnection:(id)a3 searchTerm:(id)a4 calendars:(id)a5 replyID:(unsigned int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([v11 eventAccessLevel])
  {
    v26.receiver = self;
    v26.super_class = (Class)CADCalSearchOperation;
    v14 = [(CADCalSearchOperation *)&v26 init];
    if (v14)
    {
      id v15 = [NSString alloc];
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      v18 = (void *)[v15 initWithFormat:@"%@", v17];

      v19 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v20 = [v19 beginActivityWithOptions:0x80000000000 reason:v18];
      boostToken = v14->_boostToken;
      v14->_boostToken = v20;

      objc_storeStrong((id *)&v14->_connection, a3);
      objc_storeStrong((id *)&v14->_calendars, a5);
      objc_storeStrong((id *)&v14->_searchTerm, a4);
      v14->_lock._os_unfair_lock_opaque = 0;
      v14->_replyID = a6;
      dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
      finishedSemaphore = v14->_finishedSemaphore;
      v14->_finishedSemaphore = (OS_dispatch_semaphore *)v22;
    }
    self = v14;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)configureSearch:(id)a3
{
  id v3 = a3;
  [v3 setSearchAttendees:1];
  [v3 setSearchLocations:1];
  [v3 setSearchParticipants:1];
  [v3 setShouldMatchLocationsOnlyForEventSearch:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  [v3 endActivity:self->_boostToken];

  v4.receiver = self;
  v4.super_class = (Class)CADCalSearchOperation;
  [(CADCalSearchOperation *)&v4 dealloc];
}

- (unsigned)replyID
{
  return self->_replyID;
}

- (void)main
{
  id v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_INFO, "Starting search operation", buf, 2u);
  }
  connection = self->_connection;
  calendars = self->_calendars;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__CADCalSearchOperation_main__block_invoke;
  v6[3] = &unk_1E624F3D8;
  v6[4] = self;
  [(ClientConnection *)connection withDatabaseForObjects:calendars perform:v6];
  if (([(CADCalSearchOperation *)self isCancelled] & 1) == 0) {
    [(CADCalSearchOperation *)self _completeOperation];
  }
}

uint64_t __29__CADCalSearchOperation_main__block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v17 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) isCancelled];
  if ((v7 & 1) == 0)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 264) = a2;
    v8 = (void *)MEMORY[0x1E4F1CA80];
    id v9 = [v17 valueForKey:@"entityID"];
    id v10 = [v8 setWithArray:v9];

    id v11 = [*(id *)(*(void *)(a1 + 32) + 248) restrictedCalendarRowIDsForAction:0 inDatabase:a4];
    [v10 minusSet:v11];

    id v12 = (const void *)CalFilterCreateWithDatabaseShowingCalendarsWithUIDs();
    CalFilterSetSearchTerm();
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 312));
    if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
    {
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F57478]) initWithDatabase:a4 filter:v12 dataSink:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) configureSearch:v13];
      [v13 startSearching];
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v14 + 256);
      *(void *)(v14 + 256) = v13;
    }
    CFRelease(v12);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 312));
    if (([*(id *)(a1 + 32) isCancelled] & 1) == 0) {
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 288), 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  return MEMORY[0x1F41817F8](v7);
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_INFO, "Cancelling [%@]", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  v4.receiver = self;
  v4.super_class = (Class)CADCalSearchOperation;
  [(CADCalSearchOperation *)&v4 cancel];
  [(CalSearch *)self->_currentSearch stopSearching];
  os_unfair_lock_unlock(&self->_lock);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_finishedSemaphore);
  [(CADCalSearchOperation *)self _completeOperation];
}

- (void)calSearch:(id)a3 foundOccurrences:(__CFArray *)a4 cachedDays:(__CFArray *)a5 cachedDaysIndexes:(__CFArray *)a6
{
  id v19 = a3;
  if (a4) {
    CFIndex Count = CFArrayGetCount(a4);
  }
  else {
    CFIndex Count = 0;
  }
  if (!self->_objectIDsForPrivacyAccounting)
  {
    id v9 = (NSMutableArray *)objc_opt_new();
    objectIDsForPrivacyAccounting = self->_objectIDsForPrivacyAccounting;
    self->_objectIDsForPrivacyAccounting = v9;
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFArrayGetValueAtIndex(a4, i);
      CalEventOccurrenceGetEvent();
      if (_CalEventGetJunkStatusWhileLocked() != 1)
      {
        uint64_t ID = CPRecordGetID();
        CalEventOccurrenceGetDate();
        double v15 = v14;
        v16 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:2 entityID:ID databaseID:self->_currentDatabaseID];
        [v11 addObject:v16];
        id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v15];
        [v11 addObject:v17];

        [(NSMutableArray *)self->_objectIDsForPrivacyAccounting addObject:v16];
      }
    }
  }
  v18 = [(ClientConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_27];
  [v18 CADClientReceiveOccurrenceCacheSearchResults:v11 forSearchToken:self->_replyID finished:0];
}

void __81__CADCalSearchOperation_calSearch_foundOccurrences_cachedDays_cachedDaysIndexes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_ERROR, "Error sending occurrence cache search results: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)calSearchComplete:(id)a3
{
  int v4 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_INFO, "Search complete.", v5, 2u);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_finishedSemaphore);
}

- (void)_completeOperation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    uint64_t v7 = self;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_INFO, "Sending an empty array to client of [%@].", (uint8_t *)&v6, 0xCu);
  }
  int v4 = [MEMORY[0x1E4F1C978] array];
  id v5 = [(ClientConnection *)self->_connection remoteObjectProxy];
  [v5 CADClientReceiveOccurrenceCacheSearchResults:v4 forSearchToken:self->_replyID finished:1];

  if (self->_objectIDsForPrivacyAccounting) {
    -[ClientConnection logAccessToObjects:](self->_connection, "logAccessToObjects:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDsForPrivacyAccounting, 0);
  objc_storeStrong((id *)&self->_boostToken, 0);
  objc_storeStrong((id *)&self->_finishedSemaphore, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
  objc_storeStrong((id *)&self->_currentSearch, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end