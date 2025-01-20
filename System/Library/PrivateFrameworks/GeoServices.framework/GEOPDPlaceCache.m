@interface GEOPDPlaceCache
- (BOOL)_deleteAndResetDB:(id)a3;
- (BOOL)_meetsManifestVersionPolicyForPlace:(id)a3;
- (BOOL)_validateDBLocaleAndResetIfNecessary;
- (GEOPDPlaceCache)initWithCacheFilePath:(id)a3 schedulingDelegate:(id)a4 manifestInfoProvider:(id)a5;
- (NSArray)serviceVersions;
- (id)_cacheKeyForHandle:(id)a3;
- (id)_cacheKeysForPlace:(id)a3 request:(id)a4;
- (id)internalSerialQueue;
- (id)lookupIdentifierByPhoneNumber:(id)a3;
- (int64_t)currentTime;
- (unint64_t)_calculateFreeableSpace;
- (unint64_t)_shrinkBySize:(unint64_t)a3;
- (unint64_t)calculateFreeableSpaceSync;
- (unint64_t)shrinkBySizeSync:(unint64_t)a3;
- (void)_evictPlaceWithHash:(id)a3;
- (void)_iterateAllKeysFilteringCacheKeyWithPredicate:(id)a3 entryBlock:(id)a4 finishedBlock:(id)a5;
- (void)_iterateAllPlacesFilteringCacheKeyWithPredicate:(id)a3 entryBlock:(id)a4 finishedBlock:(id)a5;
- (void)_localeChanged:(id)a3;
- (void)_lookupPlaceByRequestKey:(id)a3 allowExpiredPlace:(BOOL)a4 resultBlock:(id)a5;
- (void)_storePlace:(id)a3 withHash:(id)a4 forRequestKeys:(id)a5;
- (void)calculateFreeableSpaceWithHandler:(id)a3;
- (void)cancelCleanupBlockSchedule;
- (void)close;
- (void)dealloc;
- (void)deletePhoneNumberMapping;
- (void)enqueueAccessTimeUpdateForCacheKey:(id)a3 accessTime:(int64_t)a4;
- (void)evictAllEntries;
- (void)iterateAllBasemapIdKeysWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateAllHandleKeysWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateAllKeysWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateAllMUIDKeysWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateAllPhoneKeysWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateAllPlacesWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateBasemapIdPlacesWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateHandlePlacesWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateMUIDPlacesWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iteratePhonePlacesWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)lookupPlaceByHandle:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5;
- (void)lookupPlaceByIdentifier:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5;
- (void)lookupPlaceByPhoneNumber:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5;
- (void)lookupPlaceByRequest:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5;
- (void)periodicCleanupAndAccessTimeUpdate;
- (void)runCleanupBlock:(id)a3 inSecondsFromNow:(int64_t)a4;
- (void)scheduleCleanup;
- (void)shrinkBySize:(unint64_t)a3 finished:(id)a4;
- (void)storePlace:(id)a3 forRequest:(id)a4;
- (void)storePlace:(id)a3 forRequest:(id)a4 completionQueue:(id)a5 completion:(id)a6;
- (void)trackPlace:(id)a3;
- (void)trackPlace:(id)a3 completionQueue:(id)a4 completion:(id)a5;
@end

@implementation GEOPDPlaceCache

- (void)storePlace:(id)a3 forRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, v9, 2u);
  }

  [(GEOPDPlaceCache *)self storePlace:v7 forRequest:v6 completionQueue:0 completion:0];
}

- (void)lookupPlaceByRequest:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 cacheKey];
  v11 = GEOFindOrCreateLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
    {
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "using cacheKey '%{private}@' for request", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x3032000000;
    v34 = sub_10001370C;
    v35 = sub_10001371C;
    id v36 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    db = self->_db;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000156C8;
    v16[3] = &unk_1000718D8;
    v16[4] = self;
    BOOL v21 = a4;
    id v17 = v10;
    p_long long buf = &buf;
    v19 = &v26;
    v20 = &v22;
    [(GEOSQLiteDB *)db executeSync:v16];
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*(void *)(*((void *)&buf + 1) + 40)) {
        CFStringRef v15 = @" ";
      }
      else {
        CFStringRef v15 = @" nil ";
      }
      *(_DWORD *)v30 = 138412290;
      CFStringRef v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "returning%@place for request", v30, 0xCu);
    }

    (*((void (**)(id, void, void, uint64_t))v9 + 2))(v9, *(void *)(*((void *)&buf + 1) + 40), *((unsigned __int8 *)v27 + 24), v23[3]);
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (v12)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "request has no cacheKey", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
  }
}

- (void)storePlace:(id)a3 forRequest:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = a5;
  id v13 = a6;
  v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  if ([v11 shouldConsiderCaching] && objc_msgSend(v10, "isCacheable"))
  {
    id v15 = [(GEOPDPlaceCache *)self _cacheKeysForPlace:v10 request:v11];
    v16 = [v11 cacheKey];
    if (v16) {
      [v15 addObject:v16];
    }
    if (([v10 nilPlace] & 1) == 0)
    {
      id v17 = [objc_alloc((Class)_GEOPlaceDataItem) initWithPlaceData:v10];
      v18 = +[GEOMapItemHandle handleDataForMapItem:v17];

      if (v18)
      {
        v19 = [(GEOPDPlaceCache *)self _cacheKeyForHandle:v18];
        [v15 addObject:v19];
      }
    }
    v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      BOOL v21 = [v15 componentsJoinedByString:@", "];
      *(_DWORD *)long long buf = 138477827;
      v35 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "cache keys : %{private}@", buf, 0xCu);
    }
    if ([v15 count])
    {
      uint64_t v22 = [v10 pdPlaceCacheKeyForRequest:v11];
      db = self->_db;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000150D8;
      v28[3] = &unk_100071860;
      v28[4] = self;
      id v29 = v10;
      id v30 = v22;
      id v15 = v15;
      id v31 = v15;
      id v33 = v13;
      v32 = v12;
      id v24 = v22;
      [(GEOSQLiteDB *)db executeAsync:v28];

LABEL_21:
      goto LABEL_22;
    }

    if (!v13) {
      goto LABEL_22;
    }
LABEL_16:
    global_queue = v12;
    if (!v12) {
      global_queue = geo_get_global_queue();
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000151D8;
    block[3] = &unk_1000714E0;
    id v27 = v13;
    dispatch_async(global_queue, block);
    if (!v12) {

    }
    v16 = v27;
    goto LABEL_21;
  }
  id v15 = 0;
  if (v13) {
    goto LABEL_16;
  }
LABEL_22:
}

- (GEOPDPlaceCache)initWithCacheFilePath:(id)a3 schedulingDelegate:(id)a4 manifestInfoProvider:(id)a5
{
  id v8 = a3;
  id v9 = (GEOPDPlaceCache *)a4;
  id v10 = (GEOPDPlaceCache *)a5;
  v27.receiver = self;
  v27.super_class = (Class)GEOPDPlaceCache;
  id v11 = [(GEOPDPlaceCache *)&v27 init];
  if (v11)
  {
    id v12 = objc_alloc((Class)GEOSQLiteDB);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000133D0;
    v25[3] = &unk_100071770;
    id v13 = v11;
    uint64_t v26 = v13;
    v14 = (GEOSQLiteDB *)[v12 initWithQueueName:"com.apple.geo.pdplacecache" logFacility:"GEOPDPlaceCache" dbFilePath:v8 sqliteFlags:3145728 pragmas:0 setupBlock:v25];
    db = v13->_db;
    v13->_db = v14;

    if (v9) {
      v16 = v9;
    }
    else {
      v16 = v13;
    }
    objc_storeWeak((id *)&v13->_schedulingDelegate, v16);
    if (v10) {
      id v17 = v10;
    }
    else {
      id v17 = v13;
    }
    objc_storeWeak((id *)&v13->_manifestInfoProvider, v17);
    uint64_t v18 = +[NSMutableDictionary dictionary];
    accessTimesDict = v13->_accessTimesDict;
    v13->_accessTimesDict = (NSMutableDictionary *)v18;

    cleanupTimer = v13->_cleanupTimer;
    v13->_cleanupTimer = 0;

    if (GEOConfigGetBOOL())
    {
      uint64_t v21 = +[NSMutableOrderedSet orderedSetWithCapacity:100];
      recentlySeenPlaceHashes = v13->_recentlySeenPlaceHashes;
      v13->_recentlySeenPlaceHashes = (NSMutableOrderedSet *)v21;
    }
    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v13 selector:"_localeChanged:" name:NSCurrentLocaleDidChangeNotification object:0];
  }
  return v11;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GEOPDPlaceCache;
  [(GEOPDPlaceCache *)&v4 dealloc];
}

- (void)_localeChanged:(id)a3
{
  id v4 = a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_10001370C;
  v7[4] = sub_10001371C;
  _GEOCreateTransaction();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013724;
  v6[3] = &unk_100071798;
  v6[4] = self;
  v6[5] = v7;
  [(GEOSQLiteDB *)db executeAsync:v6];
  _Block_object_dispose(v7, 8);
}

- (BOOL)_validateDBLocaleAndResetIfNecessary
{
  v3 = sub_100013A98();
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_10001370C;
  v19 = sub_10001371C;
  id v20 = 0;
  db = self->_db;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100013AEC;
  v14[3] = &unk_1000717C0;
  v14[4] = &v15;
  v5 = db;
  id v6 = v14;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_10001370C;
  v21[4] = sub_10001371C;
  id v22 = 0;
  *(void *)long long buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_100018F60;
  id v24 = &unk_100071AE0;
  id v7 = v5;
  uint64_t v25 = v7;
  id v8 = v6;
  id v26 = v8;
  objc_super v27 = v21;
  [(GEOSQLiteDB *)v7 statementForKey:@"GetValue" statementBlock:buf];

  _Block_object_dispose(v21, 8);
  if ([(id)v16[5] isEqual:v3])
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = v16[5];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Locale did not change. %@ == %@", buf, 0x16u);
    }

    BOOL v11 = 1;
  }
  else
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Locale changed. Dropping all cached data", buf, 2u);
    }

    BOOL v11 = [(GEOPDPlaceCache *)self _deleteAndResetDB:v3];
  }
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (BOOL)_deleteAndResetDB:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    sub_100013A98();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(NSMutableOrderedSet *)self->_recentlySeenPlaceHashes removeAllObjects];
  db = self->_db;
  id v6 = [(GEOSQLiteDB *)db log];
  sub_10001350C(db, 1);

  if (!-[GEOSQLiteDB createTable:withDrop:](self->_db, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS pdplaces (pdplacehash TEXT PRIMARY KEY NOT NULL, expiretime INT NOT NULL, pdplace BLOB NOT NULL);",
                        "DROP TABLE pdplaces"))
    goto LABEL_8;
  if (!-[GEOSQLiteDB createTable:withDrop:](self->_db, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS pdplacelookup (requestkey TEXT PRIMARY KEY NOT NULL, pdplacehash TEXT NOT NULL, lastaccesstime INT NOT NULL);",
                        "DROP TABLE pdplacelookup"))
    goto LABEL_8;
  id v7 = self->_db;
  id v8 = v4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_10001370C;
  v18[4] = sub_10001371C;
  id v19 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100019038;
  v14[3] = &unk_100071B08;
  id v9 = v7;
  uint64_t v15 = v9;
  id v10 = v8;
  id v16 = v10;
  uint64_t v17 = v18;
  unsigned int v11 = [(GEOSQLiteDB *)v9 executeStatement:@"SetLocale" statementBlock:v14];

  _Block_object_dispose(v18, 8);
  if (v11)
  {
    [(GEOSQLiteDB *)self->_db setUser_version:2];
    BOOL v12 = 1;
  }
  else
  {
LABEL_8:
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_meetsManifestVersionPolicyForPlace:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestInfoProvider);
  id v6 = [WeakRetained serviceVersions];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    id v19 = self;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned __int8 v12 = [v4 meetsManifestVersioningForServiceVersion:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        id v13 = GEOFindOrCreateLog();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if ((v12 & 1) == 0)
        {
          if (v14)
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "place does not meet service version requirement", buf, 2u);
          }

          recentlySeenPlaceHashes = v19->_recentlySeenPlaceHashes;
          uint64_t v17 = [v4 cacheKey];
          [(NSMutableOrderedSet *)recentlySeenPlaceHashes removeObject:v17];

          BOOL v15 = 0;
          goto LABEL_15;
        }
        if (v14)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "place meets service version requirement", buf, 2u);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_15:

  return v15;
}

- (void)_storePlace:(id)a3 withHash:(id)a4 forRequestKeys:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  unsigned __int8 v12 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v12);

  if ([(GEOPDPlaceCache *)self _meetsManifestVersionPolicyForPlace:v8])
  {
    id v13 = [v8 cacheKey];
    if ([(NSMutableOrderedSet *)self->_recentlySeenPlaceHashes containsObject:v13])
    {
      BOOL v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138477827;
        v42 = v13;
        BOOL v15 = "place exists in recentlySeenPlaces set (%{private}@); will not store";
        id v16 = v14;
        uint32_t v17 = 12;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, v15, buf, v17);
      }
    }
    else
    {
      [(NSMutableOrderedSet *)self->_recentlySeenPlaceHashes addObject:v13];
      if ((unint64_t)[(NSMutableOrderedSet *)self->_recentlySeenPlaceHashes count] >= 0x65) {
        [(NSMutableOrderedSet *)self->_recentlySeenPlaceHashes removeObjectAtIndex:0];
      }
      unsigned int v18 = [v8 minTTL];
      if (GEOConfigGetInteger() <= v18)
      {
        uint64_t v20 = v18;
        id v21 = [v8 copyWithoutETAComponents];
        long long v22 = [v21 data];

        [v8 firstSeenTimestamp];
        double v24 = v23;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_schedulingDelegate);
        double v26 = (double)(uint64_t)[WeakRetained currentTime];

        if (v24 == 0.0) {
          double v27 = v26;
        }
        else {
          double v27 = v24;
        }
        db = self->_db;
        id v31 = _NSConcreteStackBlock;
        uint64_t v32 = 3221225472;
        id v33 = sub_10001431C;
        v34 = &unk_100071810;
        v35 = self;
        uint64_t v39 = (uint64_t)v27 + v20;
        id v36 = v9;
        id v37 = v22;
        id v38 = v10;
        double v40 = v26;
        BOOL v14 = v22;
        LOBYTE(db) = [(GEOSQLiteDB *)db executeInTransaction:&v31];
        id v29 = GEOFindOrCreateLog();
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
        if (db)
        {
          if (v30)
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "place was stored successfully", buf, 2u);
          }

          [(GEOPDPlaceCache *)self scheduleCleanup];
        }
        else
        {
          if (v30)
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "place failed to be stored", buf, 2u);
          }
        }
        goto LABEL_26;
      }
      BOOL v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int Integer = GEOConfigGetInteger();
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v42) = Integer;
        BOOL v15 = "place has a minTTL < %d, not writing it down";
        id v16 = v14;
        uint32_t v17 = 8;
        goto LABEL_14;
      }
    }
LABEL_26:

    goto LABEL_27;
  }
  id v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "place does not meet manifest version policy", buf, 2u);
  }
LABEL_27:
}

- (id)_cacheKeysForPlace:(id)a3 request:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableArray array];
  if ([v5 nilPlace]) {
    goto LABEL_14;
  }
  if ([v5 shouldCacheByIDForRequest:v6])
  {
    if ([v5 hasMuid])
    {
      id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%llu", @"muid-", [v5 muid]);
      [v7 addObject:v8];
LABEL_10:

      goto LABEL_11;
    }
    id v9 = [v5 mapsId];
    id v10 = [v9 shardedId];
    unsigned int v11 = [v10 hasMuid];

    if (v11)
    {
      id v8 = [v5 mapsId];
      unsigned __int8 v12 = [v8 shardedId];
      id v13 = [v12 muid];
      CFStringRef v14 = @"muid-";
LABEL_9:
      unsigned int v18 = +[NSString stringWithFormat:@"%@%llu", v14, v13];
      [v7 addObject:v18];

      goto LABEL_10;
    }
    BOOL v15 = [v5 mapsId];
    id v16 = [v15 shardedId];
    unsigned int v17 = [v16 hasBasemapId];

    if (v17)
    {
      id v8 = [v5 mapsId];
      unsigned __int8 v12 = [v8 shardedId];
      id v13 = [v12 basemapId];
      CFStringRef v14 = @"bmid-";
      goto LABEL_9;
    }
  }
LABEL_11:
  id v19 = [v5 entityComponent];
  if ([v19 hasTelephone])
  {
    uint64_t v20 = [v19 telephone];
    id v21 = +[NSString stringWithFormat:@"%@%@", @"phNo-", v20];
    [v7 addObject:v21];
  }
LABEL_14:

  return v7;
}

- (id)_cacheKeyForHandle:(id)a3
{
  id v3 = a3;
  [v3 bytes];
  [v3 length];

  _GEOMurmurHash3_128_realign();
  id v4 = +[NSString stringWithFormat:@"%@%llx%llx", @"hndl-", 0, 0];

  return v4;
}

- (void)trackPlace:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, v6, 2u);
  }

  [(GEOPDPlaceCache *)self trackPlace:v4 completionQueue:0 completion:0];
}

- (void)trackPlace:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  if ([v8 isCacheable])
  {
    unsigned __int8 v12 = [(GEOPDPlaceCache *)self _cacheKeysForPlace:v8 request:0];
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v14 = [v12 componentsJoinedByString:@", "];
      *(_DWORD *)long long buf = 138412290;
      double v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "cache keys : %@", buf, 0xCu);
    }
    if ([v12 count])
    {
      db = self->_db;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100014FB0;
      v20[3] = &unk_100071838;
      v20[4] = self;
      id v21 = v8;
      id v22 = v12;
      id v24 = v10;
      double v23 = v9;
      id v16 = v12;
      [(GEOSQLiteDB *)db executeAsync:v20];

LABEL_15:
      goto LABEL_16;
    }
  }
  if (v10)
  {
    global_queue = v9;
    if (!v9) {
      global_queue = geo_get_global_queue();
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000150C8;
    v18[3] = &unk_1000714E0;
    id v19 = v10;
    dispatch_async(global_queue, v18);
    if (!v9) {

    }
    id v16 = v19;
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_lookupPlaceByRequestKey:(id)a3 allowExpiredPlace:(BOOL)a4 resultBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v10);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_schedulingDelegate);
  id v12 = [WeakRetained currentTime];

  double Integer = 0.0;
  if (v6) {
    double Integer = (double)GEOConfigGetInteger();
  }
  if ((-[GEOSQLiteDB prepareStatement:forKey:](self->_db, "prepareStatement:forKey:", "SELECT b.pdplace, b.expiretime, b.pdplacehash FROM pdplacelookup a, pdplaces b WHERE a.requestkey = @requestkey AND       a.pdplacehash = b.pdplacehash AND       b.expiretime > @expiretime;",
                        @"lookupByReqKey") & 1) == 0)
  {
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    goto LABEL_26;
  }
  CFStringRef v14 = (sqlite3_stmt *)[(GEOSQLiteDB *)self->_db statementForKey:@"lookupByReqKey"];
  db = self->_db;
  id v40 = 0;
  unsigned __int8 v16 = [(GEOSQLiteDB *)db bindTextParameter:"@requestkey" toValue:v8 inStatement:v14 error:&v40];
  id v17 = v40;
  if ((v16 & 1) == 0)
  {
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);

    goto LABEL_26;
  }
  double v18 = (double)(uint64_t)v12;
  id v19 = self->_db;
  id v39 = v17;
  unsigned __int8 v20 = [(GEOSQLiteDB *)v19 bindInt64Parameter:"@expiretime" toValue:(uint64_t)((double)(uint64_t)v12 - Integer) inStatement:v14 error:&v39];
  id v21 = v39;

  if ((v20 & 1) == 0)
  {
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    goto LABEL_25;
  }
  if (sqlite3_step(v14) != 100)
  {
    sqlite3_reset(v14);
    id v23 = 0;
    BOOL v26 = 0;
    id v29 = 0;
LABEL_21:
    v34 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "no valid place in the cache", buf, 2u);
    }

    (*((void (**)(id, void, BOOL, id))v9 + 2))(v9, 0, v26, v23);
    goto LABEL_24;
  }
  id v35 = v21;
  id v22 = [(GEOSQLiteDB *)self->_db blobForColumn:0 inStatment:v14];
  id v23 = [v22 length];
  id v24 = [objc_alloc((Class)GEOPDPlace) initWithData:v22];
  double v25 = (double)(uint64_t)[(GEOSQLiteDB *)self->_db int64ForColumn:1 inStatment:v14];
  BOOL v26 = v18 > v25;
  if (v18 > v25)
  {
    recentlySeenPlaceHashes = self->_recentlySeenPlaceHashes;
    uint64_t v28 = [v24 cacheKey];
    [(NSMutableOrderedSet *)recentlySeenPlaceHashes removeObject:v28];
  }
  id v29 = [(GEOSQLiteDB *)self->_db stringForColumn:2 inStatment:v14];

  sqlite3_reset(v14);
  if (!v24)
  {
LABEL_20:
    id v21 = v35;
    goto LABEL_21;
  }
  BOOL v30 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "found a place in the cache", buf, 2u);
  }

  if (![(GEOPDPlaceCache *)self _meetsManifestVersionPolicyForPlace:v24])
  {

    uint64_t v32 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "place does not meet service version requirement", buf, 2u);
    }

    id v33 = self->_db;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000156BC;
    v36[3] = &unk_100071888;
    v36[4] = self;
    id v29 = v29;
    id v37 = v29;
    [(GEOSQLiteDB *)v33 executeAsync:v36];

    goto LABEL_20;
  }
  id v31 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "place meets service version requirement", buf, 2u);
  }

  [(GEOPDPlaceCache *)self enqueueAccessTimeUpdateForCacheKey:v8 accessTime:(uint64_t)v18];
  (*((void (**)(id, id, BOOL, id))v9 + 2))(v9, v24, v18 > v25, v23);

  id v21 = v35;
LABEL_24:

LABEL_25:
LABEL_26:
}

- (void)lookupPlaceByPhoneNumber:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NSString stringWithFormat:@"%@%@", @"phNo-", v8];
  unsigned int v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "using cacheKey '%{private}@' for request", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  v34 = sub_10001370C;
  id v35 = sub_10001371C;
  id v36 = 0;
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  db = self->_db;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100015AD0;
  v16[3] = &unk_1000718D8;
  v16[4] = self;
  id v13 = v10;
  BOOL v21 = a4;
  id v17 = v13;
  p_long long buf = &buf;
  id v19 = &v26;
  unsigned __int8 v20 = &v22;
  [(GEOSQLiteDB *)db executeSync:v16];
  CFStringRef v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    if (*(void *)(*((void *)&buf + 1) + 40)) {
      CFStringRef v15 = @" ";
    }
    else {
      CFStringRef v15 = @" nil ";
    }
    *(_DWORD *)BOOL v30 = 138412290;
    CFStringRef v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "returning%@place for phone number", v30, 0xCu);
  }

  (*((void (**)(id, void, void, uint64_t))v9 + 2))(v9, *(void *)(*((void *)&buf + 1) + 40), *((unsigned __int8 *)v27 + 24), v23[3]);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)lookupPlaceByIdentifier:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, (uint8_t *)&buf, 2u);
  }

  unsigned int v11 = [v8 mapsIdentifier];
  id v12 = [v11 shardedId];
  unsigned int v13 = [v12 hasMuid];

  if (v13)
  {
    CFStringRef v14 = [v8 mapsIdentifier];
    CFStringRef v15 = [v14 shardedId];
    uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%llu", @"muid-", [v15 muid]);
LABEL_7:
    unsigned __int8 v20 = (void *)v16;

    BOOL v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "using cacheKey '%{private}@' for request", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v44 = 0x3032000000;
    v45 = sub_10001370C;
    v46 = sub_10001371C;
    id v47 = 0;
    uint64_t v37 = 0;
    id v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    uint64_t v36 = 0;
    db = self->_db;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100016070;
    v27[3] = &unk_1000718D8;
    v27[4] = self;
    id v23 = v20;
    BOOL v32 = a4;
    id v28 = v23;
    p_long long buf = &buf;
    BOOL v30 = &v37;
    CFStringRef v31 = &v33;
    [(GEOSQLiteDB *)db executeSync:v27];
    uint64_t v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      if (*(void *)(*((void *)&buf + 1) + 40)) {
        CFStringRef v25 = @" ";
      }
      else {
        CFStringRef v25 = @" nil ";
      }
      *(_DWORD *)v41 = 138412290;
      CFStringRef v42 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "returning%@place for identifier", v41, 0xCu);
    }

    (*((void (**)(id, void, void, uint64_t))v9 + 2))(v9, *(void *)(*((void *)&buf + 1) + 40), *((unsigned __int8 *)v38 + 24), v34[3]);
    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_18;
  }
  id v17 = [v8 mapsIdentifier];
  double v18 = [v17 shardedId];
  unsigned int v19 = [v18 hasBasemapId];

  if (v19)
  {
    CFStringRef v14 = [v8 mapsIdentifier];
    CFStringRef v15 = [v14 shardedId];
    uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%llu", @"bmid-", [v15 basemapId]);
    goto LABEL_7;
  }
  uint64_t v26 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "unable to create cacheKey for request", (uint8_t *)&buf, 2u);
  }

  (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
LABEL_18:
}

- (void)lookupPlaceByHandle:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(GEOPDPlaceCache *)self _cacheKeyForHandle:v8];
  unsigned int v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "using cacheKey '%{private}@' for request", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  v34 = sub_10001370C;
  uint64_t v35 = sub_10001371C;
  id v36 = 0;
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  db = self->_db;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100016464;
  v16[3] = &unk_1000718D8;
  v16[4] = self;
  id v13 = v10;
  BOOL v21 = a4;
  id v17 = v13;
  p_long long buf = &buf;
  unsigned int v19 = &v26;
  unsigned __int8 v20 = &v22;
  [(GEOSQLiteDB *)db executeSync:v16];
  CFStringRef v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    if (*(void *)(*((void *)&buf + 1) + 40)) {
      CFStringRef v15 = @" ";
    }
    else {
      CFStringRef v15 = @" nil ";
    }
    *(_DWORD *)BOOL v30 = 138412290;
    CFStringRef v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "returning%@place for handle", v30, 0xCu);
  }

  (*((void (**)(id, void, void, uint64_t))v9 + 2))(v9, *(void *)(*((void *)&buf + 1) + 40), *((unsigned __int8 *)v27 + 24), v23[3]);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&buf, 8);
}

- (id)lookupIdentifierByPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  *(void *)long long buf = 0;
  uint64_t v26 = buf;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  db = self->_db;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100016854;
  v17[3] = &unk_100071900;
  v17[4] = self;
  id v7 = v4;
  id v18 = v7;
  unsigned int v19 = buf;
  unsigned __int8 v20 = &v21;
  [(GEOSQLiteDB *)db executeSync:v17];
  if (*((void *)v26 + 3))
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "returning muid for phone number", v16, 2u);
    }

    id v9 = objc_alloc((Class)GEOMapItemIdentifier);
    id v10 = objc_msgSend(v9, "initWithMUID:resultProviderID:coordinate:", *((void *)v26 + 3), 0, -180.0, -180.0);
LABEL_11:
    id v13 = v10;
    goto LABEL_12;
  }
  if (v22[3])
  {
    unsigned int v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "returning bmid for phone number", v16, 2u);
    }

    id v12 = objc_alloc((Class)GEOMapItemIdentifier);
    id v10 = objc_msgSend(v12, "initWithBasemapId:resultProviderID:coordinate:", v22[3], 0, -180.0, -180.0);
    goto LABEL_11;
  }
  CFStringRef v15 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "returning nil id for phone number", v16, 2u);
  }

  id v13 = 0;
LABEL_12:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(buf, 8);

  return v13;
}

- (void)calculateFreeableSpaceWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  if (v4)
  {
    db = self->_db;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100016B34;
    v7[3] = &unk_100071950;
    v7[4] = self;
    id v8 = v4;
    [(GEOSQLiteDB *)db executeAsync:v7];
  }
}

- (unint64_t)calculateFreeableSpaceSync
{
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  *(void *)long long buf = 0;
  id v9 = buf;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  db = self->_db;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016CFC;
  v7[3] = &unk_1000714B8;
  v7[4] = self;
  void v7[5] = buf;
  [(GEOSQLiteDB *)db executeSync:v7];
  unint64_t v5 = *((void *)v9 + 3);
  _Block_object_dispose(buf, 8);
  return v5;
}

- (unint64_t)_calculateFreeableSpace
{
  unint64_t v6 = 0;
  int v2 = sqlite3_exec((sqlite3 *)[(GEOSQLiteDB *)self->_db sqliteDB], "SELECT  SUM(LENGTH(pdplace)) FROM pdplaces;",
         (int (__cdecl *)(void *, int, char **, char **))sub_100016E38,
         &v6,
         0);
  if (v2)
  {
    int v3 = v2;
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136380931;
      id v8 = "SELECT  SUM(LENGTH(pdplace)) FROM pdplaces;";
      __int16 v9 = 1024;
      int v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "unable to execute SQL \"%{private}s\" : error %d", buf, 0x12u);
    }
  }
  return v6;
}

- (void)shrinkBySize:(unint64_t)a3 finished:(id)a4
{
  id v6 = a4;
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  *(void *)long long buf = 0;
  CFStringRef v15 = buf;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  db = self->_db;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100016FC4;
  v10[3] = &unk_1000719A0;
  id v12 = buf;
  unint64_t v13 = a3;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  [(GEOSQLiteDB *)db executeAsync:v10];

  _Block_object_dispose(buf, 8);
}

- (unint64_t)shrinkBySizeSync:(unint64_t)a3
{
  unint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  *(void *)long long buf = 0;
  id v11 = buf;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  db = self->_db;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000171B4;
  v9[3] = &unk_1000719C8;
  v9[4] = self;
  v9[5] = buf;
  v9[6] = a3;
  [(GEOSQLiteDB *)db executeSync:v9];
  unint64_t v7 = *((void *)v11 + 3);
  _Block_object_dispose(buf, 8);
  return v7;
}

- (unint64_t)_shrinkBySize:(unint64_t)a3
{
  if (!-[GEOSQLiteDB prepareStatement:forKey:](self->_db, "prepareStatement:forKey:", "SELECT LENGTH(pdplace) FROM pdplaces ORDER BY expiretime ASC;",
                        @"ascExpire"))
    return 0;
  unint64_t v5 = (sqlite3_stmt *)[(GEOSQLiteDB *)self->_db statementForKey:@"ascExpire"];
  unint64_t v6 = 0;
  int v7 = 0;
  do
  {
    if (sqlite3_step(v5) != 100) {
      break;
    }
    ++v7;
    v6 += (int)[(GEOSQLiteDB *)self->_db intForColumn:0 inStatment:v5];
  }
  while (v6 < a3);
  sqlite3_reset(v5);
  db = self->_db;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100017300;
  v10[3] = &unk_1000719F0;
  v10[4] = self;
  int v11 = v7;
  if ([(GEOSQLiteDB *)db executeInTransaction:v10]) {
    return v6;
  }
  else {
    return 0;
  }
}

- (void)deletePhoneNumberMapping
{
  int v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  db = self->_db;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100017494;
  v5[3] = &unk_100071490;
  v5[4] = self;
  [(GEOSQLiteDB *)db executeSync:v5];
}

- (void)evictAllEntries
{
  int v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  db = self->_db;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100017658;
  v5[3] = &unk_100071490;
  v5[4] = self;
  [(GEOSQLiteDB *)db executeSync:v5];
}

- (void)enqueueAccessTimeUpdateForCacheKey:(id)a3 accessTime:(int64_t)a4
{
  id v6 = a3;
  int v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, v12, 2u);
  }

  id v8 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    id v9 = +[NSNumber numberWithLongLong:a4];
    [(NSMutableDictionary *)self->_accessTimesDict setObject:v9 forKeyedSubscript:v6];

    Udouble Integer = GEOConfigGetUInteger();
    if ((unint64_t)[(NSMutableDictionary *)self->_accessTimesDict count] >= UInteger)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_schedulingDelegate);
      [WeakRetained cancelCleanupBlockSchedule];

      [(GEOPDPlaceCache *)self periodicCleanupAndAccessTimeUpdate];
    }
    else
    {
      [(GEOPDPlaceCache *)self scheduleCleanup];
    }
  }
}

- (void)scheduleCleanup
{
  int v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  uint64_t Integer = GEOConfigGetInteger();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_schedulingDelegate);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001798C;
  v6[3] = &unk_100071490;
  v6[4] = self;
  [WeakRetained runCleanupBlock:v6 inSecondsFromNow:Integer];
}

- (void)periodicCleanupAndAccessTimeUpdate
{
  int v3 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v3);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_schedulingDelegate);
  unint64_t v5 = (const char *)[WeakRetained currentTime];

  uint64_t v6 = DefaultLoggingSubsystem;
  int v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134217984;
    BOOL v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "running at %lld", buf, 0xCu);
  }

  if (-[GEOSQLiteDB prepareStatement:forKey:](self->_db, "prepareStatement:forKey:", "DELETE FROM pdplaces WHERE expiretime < @expiretime;",
                       @"removeExpired"))
  {
    id v8 = [(GEOSQLiteDB *)self->_db statementForKey:@"removeExpired"];
    if ([(GEOSQLiteDB *)self->_db bindInt64Parameter:"@expiretime" toValue:v5 inStatement:v8 error:0])[(GEOSQLiteDB *)self->_db executeStatement:v8 error:0]; {
  }
    }
  int v9 = sqlite3_exec((sqlite3 *)[(GEOSQLiteDB *)self->_db sqliteDB], "DELETE FROM pdplacelookup WHERE requestkey NOT LIKE \"phNo-%\" AND pdplacehash NOT IN         (SELECT pdplacehash FROM pdplaces);",
         0,
         0,
         0);
  if (v9)
  {
    int v10 = v9;
    int v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136380931;
      BOOL v32 = "DELETE FROM pdplacelookup WHERE requestkey NOT LIKE \"phNo-%\" AND pdplacehash NOT IN         (SELECT pdplac"
            "ehash FROM pdplaces);";
      __int16 v33 = 1024;
      int v34 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "unable to execute SQL \"%{private}s\" : error %d", buf, 0x12u);
    }
  }
  if ((-[GEOSQLiteDB prepareStatement:forKey:](self->_db, "prepareStatement:forKey:", "UPDATE pdplacelookup SET lastaccesstime = @lastaccesstime WHERE requestkey = @requestkey;",
                        @"updateAccessTime") & 1) == 0)
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136380675;
      BOOL v32 = "UPDATE pdplacelookup SET lastaccesstime = @lastaccesstime WHERE requestkey = @requestkey;";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "unable to prepare SQL \"%{private}s\"", buf, 0xCu);
    }
  }
  uint64_t v13 = (sqlite3_stmt *)[(GEOSQLiteDB *)self->_db statementForKey:@"updateAccessTime", v6];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(NSMutableDictionary *)self->_accessTimesDict allKeys];
  id v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        unsigned int v19 = [(NSMutableDictionary *)self->_accessTimesDict objectForKeyedSubscript:v18];
        id v20 = [v19 longLongValue];

        if ([(GEOSQLiteDB *)self->_db bindInt64Parameter:"@lastaccesstime" toValue:v20 inStatement:v13 error:0]&& [(GEOSQLiteDB *)self->_db bindTextParameter:"@requestkey" toValue:v18 inStatement:v13 error:0])
        {
          [(GEOSQLiteDB *)self->_db executeStatement:v13 error:0];
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  [(NSMutableDictionary *)self->_accessTimesDict removeAllObjects];
  uint64_t Integer = GEOConfigGetInteger();
  if (-[GEOSQLiteDB prepareStatement:forKey:](self->_db, "prepareStatement:forKey:", "DELETE FROM pdplacelookup WHERE lastaccesstime <      (SELECT lastaccesstime       FROM pdplacelookup       ORDER BY lastaccesstime ASC LIMIT 1 OFFSET @offset);",
                       @"removeOldPhones"))
  {
    uint64_t v13 = (sqlite3_stmt *)[(GEOSQLiteDB *)self->_db statementForKey:@"removeOldPhones"];
    if ([(GEOSQLiteDB *)self->_db bindInt64Parameter:"@offset" toValue:Integer inStatement:v13 error:0])[(GEOSQLiteDB *)self->_db executeStatement:v13 error:0]; {
  }
    }
  sqlite3_reset(v13);
  int v22 = sqlite3_exec((sqlite3 *)[(GEOSQLiteDB *)self->_db sqliteDB], "DELETE FROM pdplaces WHERE pdplacehash NOT IN (SELECT pdplacehash FROM pdplacelookup);",
          0,
          0,
          0);
  if (v22)
  {
    int v23 = v22;
    uint64_t v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136380931;
      BOOL v32 = "DELETE FROM pdplacelookup WHERE requestkey NOT LIKE \"phNo-%\" AND pdplacehash NOT IN         (SELECT pdplac"
            "ehash FROM pdplaces);";
      __int16 v33 = 1024;
      int v34 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "unable to execute SQL \"%{private}s\" : error %d", buf, 0x12u);
    }
  }
}

- (void)_evictPlaceWithHash:(id)a3
{
  id v4 = a3;
  unint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  uint64_t v6 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v6);

  db = self->_db;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100017F6C;
  v9[3] = &unk_100071A40;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(GEOSQLiteDB *)db executeInTransaction:v9];
}

- (void)close
{
  db = self->_db;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000180F8;
  v3[3] = &unk_100071490;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeSync:v3];
}

- (void)_iterateAllPlacesFilteringCacheKeyWithPredicate:(id)a3 entryBlock:(id)a4 finishedBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  db = self->_db;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000181E8;
  v15[3] = &unk_100071A90;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(GEOSQLiteDB *)db executeAsync:v15];
}

- (void)iterateAllPlacesWithBlock:(id)a3 finishedBlock:(id)a4
{
}

- (void)iterateMUIDPlacesWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"muid-"];
  [(GEOPDPlaceCache *)self _iterateAllPlacesFilteringCacheKeyWithPredicate:v8 entryBlock:v7 finishedBlock:v6];
}

- (void)iterateBasemapIdPlacesWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"bmid-"];
  [(GEOPDPlaceCache *)self _iterateAllPlacesFilteringCacheKeyWithPredicate:v8 entryBlock:v7 finishedBlock:v6];
}

- (void)iteratePhonePlacesWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"phNo-"];
  [(GEOPDPlaceCache *)self _iterateAllPlacesFilteringCacheKeyWithPredicate:v8 entryBlock:v7 finishedBlock:v6];
}

- (void)iterateHandlePlacesWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"hndl-"];
  [(GEOPDPlaceCache *)self _iterateAllPlacesFilteringCacheKeyWithPredicate:v8 entryBlock:v7 finishedBlock:v6];
}

- (void)_iterateAllKeysFilteringCacheKeyWithPredicate:(id)a3 entryBlock:(id)a4 finishedBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  db = self->_db;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100018774;
  v15[3] = &unk_100071A90;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(GEOSQLiteDB *)db executeAsync:v15];
}

- (void)iterateAllKeysWithBlock:(id)a3 finishedBlock:(id)a4
{
}

- (void)iterateAllMUIDKeysWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"muid-"];
  [(GEOPDPlaceCache *)self _iterateAllKeysFilteringCacheKeyWithPredicate:v8 entryBlock:v7 finishedBlock:v6];
}

- (void)iterateAllBasemapIdKeysWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"bmid-"];
  [(GEOPDPlaceCache *)self _iterateAllKeysFilteringCacheKeyWithPredicate:v8 entryBlock:v7 finishedBlock:v6];
}

- (void)iterateAllPhoneKeysWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"phNo-"];
  [(GEOPDPlaceCache *)self _iterateAllKeysFilteringCacheKeyWithPredicate:v8 entryBlock:v7 finishedBlock:v6];
}

- (void)iterateAllHandleKeysWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"hndl-"];
  [(GEOPDPlaceCache *)self _iterateAllKeysFilteringCacheKeyWithPredicate:v8 entryBlock:v7 finishedBlock:v6];
}

- (id)internalSerialQueue
{
  return [(GEOSQLiteDB *)self->_db isolationQueue];
}

- (int64_t)currentTime
{
  +[NSDate timeIntervalSinceReferenceDate];
  return (uint64_t)v2;
}

- (void)runCleanupBlock:(id)a3 inSecondsFromNow:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, buf, 2u);
  }

  cleanupTimer = self->_cleanupTimer;
  if (cleanupTimer)
  {
    dispatch_source_cancel(cleanupTimer);
    id v9 = self->_cleanupTimer;
    self->_cleanupTimer = 0;
  }
  id v10 = [(GEOSQLiteDB *)self->_db isolationQueue];
  id v14 = v5;
  id v11 = v5;
  id v12 = (OS_dispatch_source *)geo_dispatch_timer_create_on_queue();
  id v13 = self->_cleanupTimer;
  self->_cleanupTimer = v12;

  dispatch_resume((dispatch_object_t)self->_cleanupTimer);
}

- (void)cancelCleanupBlockSchedule
{
  int v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, (const char *)&unk_1000649A7, v5, 2u);
  }

  dispatch_source_cancel((dispatch_source_t)self->_cleanupTimer);
  cleanupTimer = self->_cleanupTimer;
  self->_cleanupTimer = 0;
}

- (NSArray)serviceVersions
{
  double v2 = +[GEOResourceManifestManager modernManager];
  int v3 = [v2 activeTileGroup];
  id v4 = [v3 versionManifest];
  id v5 = [v4 serviceVersions];
  id v6 = [v5 copy];

  return (NSArray *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlySeenPlaceHashes, 0);
  objc_storeStrong((id *)&self->_accessTimesDict, 0);
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
  objc_destroyWeak((id *)&self->_manifestInfoProvider);
  objc_destroyWeak((id *)&self->_schedulingDelegate);

  objc_storeStrong((id *)&self->_db, 0);
}

@end