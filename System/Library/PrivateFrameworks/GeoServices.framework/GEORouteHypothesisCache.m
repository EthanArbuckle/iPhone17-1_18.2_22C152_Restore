@interface GEORouteHypothesisCache
- (GEORouteHypothesisCache)init;
- (double)nextRefreshTimeStamp;
- (id)descriptionOfAllEntries;
- (id)loadEntryForRowId:(int64_t)a3;
- (id)loadValueForKey:(id)a3;
- (int64_t)numberOfEntriesOnDisk;
- (void)_removeAllEntries;
- (void)dealloc;
- (void)enumerateAllForCacheEntriesWithHandler:(id)a3;
- (void)protectedDataDidBecomeAvailable:(id)a3;
- (void)removeKey:(id)a3 value:(id)a4;
- (void)saveValue:(id)a3 forKey:(id)a4;
- (void)tearDown;
@end

@implementation GEORouteHypothesisCache

- (GEORouteHypothesisCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEORouteHypothesisCache;
  v2 = [(GEORouteHypothesisCache *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(GEONavdCachePersistenceManager);
    persistenceManager = v2->_persistenceManager;
    v2->_persistenceManager = v3;

    v5 = +[GEOKeyBagNotification sharedObject];
    [v5 addDataDidBecomeAvailableAfterFirstUnlockObserver:v2];
  }
  return v2;
}

- (void)protectedDataDidBecomeAvailable:(id)a3
{
  v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "DB became available.  Notifying clients.", v4, 2u);
  }

  notify_post("com.apple.navd.wakeUpForHypothesisUpdate");
  notify_post("com.apple.navd.restarted");
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GEORouteHypothesisCache;
  [(GEORouteHypothesisCache *)&v4 dealloc];
}

- (void)tearDown
{
}

- (id)loadValueForKey:(id)a3
{
  v3 = [(GEONavdCachePersistenceManager *)self->_persistenceManager readValueWithKey:a3];

  return v3;
}

- (id)loadEntryForRowId:(int64_t)a3
{
  return [(GEONavdCachePersistenceManager *)self->_persistenceManager entryWithRowId:a3];
}

- (void)saveValue:(id)a3 forKey:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138478083;
    id v10 = v7;
    __int16 v11 = 2113;
    id v12 = v6;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Saving value in the cache for key: %{private}@, value: %{private}@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v6, "setRowId:", -[GEONavdCachePersistenceManager dumpToDiskWithKey:value:](self->_persistenceManager, "dumpToDiskWithKey:value:", v7, v6));
}

- (void)removeKey:(id)a3 value:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138477827;
    id v11 = v6;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Removing key from the cache: %{private}@", (uint8_t *)&v10, 0xCu);
  }

  int v9 = [v7 monitor];
  [v9 stopMonitoring];

  [(GEONavdCachePersistenceManager *)self->_persistenceManager deleteFromDiskWithKey:v6];
}

- (void)enumerateAllForCacheEntriesWithHandler:(id)a3
{
}

- (int64_t)numberOfEntriesOnDisk
{
  return [(GEONavdCachePersistenceManager *)self->_persistenceManager numberOfEntries];
}

- (double)nextRefreshTimeStamp
{
  [(GEONavdCachePersistenceManager *)self->_persistenceManager nextTimeStampForRefreshTimer];
  return result;
}

- (id)descriptionOfAllEntries
{
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%lld items {\n", -[GEORouteHypothesisCache numberOfEntriesOnDisk](self, "numberOfEntriesOnDisk"));
  persistenceManager = self->_persistenceManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__GEORouteHypothesisCache_descriptionOfAllEntries__block_invoke;
  v7[3] = &unk_1E53E9D80;
  id v5 = v3;
  id v8 = v5;
  [(GEONavdCachePersistenceManager *)persistenceManager enumerateAllEntriesWithHandler:v7];
  [v5 appendString:@"}"];

  return v5;
}

void __50__GEORouteHypothesisCache_descriptionOfAllEntries__block_invoke(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = *(void **)(a1 + 32);
  id v7 = (void *)MEMORY[0x1E4F28C10];
  id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a2];
  int v9 = [v7 localizedStringFromDate:v8 dateStyle:1 timeStyle:2];
  [v6 appendFormat:@"%@ Refresh at %@,\n", v10, v9];
}

- (void)_removeAllEntries
{
}

- (void).cxx_destruct
{
}

@end