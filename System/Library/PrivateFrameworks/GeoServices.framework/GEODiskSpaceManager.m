@interface GEODiskSpaceManager
+ (GEODiskSpaceManager)sharedManager;
- (GEODiskSpaceManager)init;
- (GEODiskSpaceManager)initWithCacheDeleteID:(id)a3;
- (NSString)cacheDeleteID;
- (id)_validVolume:(id)a3;
- (id)diskSpaceProviderForIdentifier:(id)a3;
- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4;
- (unint64_t)purgableDiskSpaceForUrgency:(int)a3;
- (void)_registerCacheDeleteCallbacks;
- (void)addDiskSpaceProvider:(id)a3;
- (void)reportSignificantPurgableDiskSpaceUpdate;
@end

@implementation GEODiskSpaceManager

+ (GEODiskSpaceManager)sharedManager
{
  if (qword_1000848A0 != -1) {
    dispatch_once(&qword_1000848A0, &stru_100072898);
  }
  v2 = (void *)qword_100084898;

  return (GEODiskSpaceManager *)v2;
}

- (GEODiskSpaceManager)init
{
  result = (GEODiskSpaceManager *)+[NSException raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEODiskSpaceManager)initWithCacheDeleteID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEODiskSpaceManager;
  v5 = [(GEODiskSpaceManager *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    cacheDeleteID = v5->_cacheDeleteID;
    v5->_cacheDeleteID = v6;

    [(GEODiskSpaceManager *)v5 _registerCacheDeleteCallbacks];
  }

  return v5;
}

- (id)_validVolume:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOFilePaths urlFor:4];
  v5 = v4;
  if (v4)
  {
    id v13 = 0;
    unsigned int v6 = [v4 getResourceValue:&v13 forKey:NSURLVolumeURLKey error:0];
    id v7 = v13;
    if (v6)
    {
      v8 = [v3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
      objc_super v9 = +[NSURL fileURLWithPath:v8];
      if ([v9 isEqual:v7])
      {
        id v10 = v8;
      }
      else
      {
        v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          v15 = v8;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Asked about a volume (%{private}@) we don't control.", buf, 0xCu);
        }

        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_registerCacheDeleteCallbacks
{
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Registering cache delete callbacks.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100034820;
  v13[3] = &unk_1000728C0;
  objc_copyWeak(&v14, buf);
  id v4 = objc_retainBlock(v13);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000349B0;
  v11[3] = &unk_1000728C0;
  objc_copyWeak(&v12, buf);
  v5 = objc_retainBlock(v11);
  if (CacheDeleteRegisterInfoCallbacks())
  {
    unsigned int v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      id v7 = "Cache delete callback registration failed!";
      v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, v10, 2u);
    }
  }
  else
  {
    unsigned int v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v10 = 0;
      id v7 = "Cache delete callback registration succeeded.";
      v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
      goto LABEL_8;
    }
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

- (void)addDiskSpaceProvider:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  diskSpaceProviders = v4->_diskSpaceProviders;
  if (!diskSpaceProviders)
  {
    unsigned int v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = v4->_diskSpaceProviders;
    v4->_diskSpaceProviders = v6;

    diskSpaceProviders = v4->_diskSpaceProviders;
  }
  [(NSMutableArray *)diskSpaceProviders addObject:v8];
  v4->_cachedPurgableTime[0] = 2.56734753e-289;
  objc_sync_exit(v4);
}

- (id)diskSpaceProviderForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned int v6 = v5->_diskSpaceProviders;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "identifier", (void)v14);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);

  return v7;
}

- (void)reportSignificantPurgableDiskSpaceUpdate
{
  obj = self;
  objc_sync_enter(obj);
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - obj->_lastSignificantUpdate < 60.0)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_lastSignificantUpdate = Current;
    obj->_cachedPurgableTime[0] = 2.56734753e-289;
    objc_sync_exit(obj);

    id v3 = [(GEODiskSpaceManager *)obj _validVolume:0];
    id v4 = +[NSMutableDictionary dictionary];
    uint64_t v5 = 1;
    unsigned int v6 = obj;
    do
    {
      id v7 = -[GEODiskSpaceManager purgableDiskSpaceForUrgency:](v6, "purgableDiskSpaceForUrgency:", v5, obj);
      if (v7)
      {
        uint64_t v8 = +[NSNumber numberWithUnsignedLongLong:v7];
        os_log_type_t v9 = +[NSNumber numberWithInt:v5];
        [v4 setObject:v8 forKey:v9];
      }
      uint64_t v5 = (v5 + 1);
      unsigned int v6 = obj;
    }
    while (v5 != 5);
    cacheDeleteID = obj->_cacheDeleteID;
    v13[0] = @"CACHE_DELETE_ID";
    v13[1] = @"CACHE_DELETE_VOLUME";
    v14[0] = cacheDeleteID;
    v14[1] = v3;
    v13[2] = @"CACHE_DELETE_AMOUNT";
    v14[2] = v4;
    v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    CacheDeleteUpdatePurgeable();
  }
}

- (unint64_t)purgableDiskSpaceForUrgency:(int)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  unsigned int v6 = self;
  objc_sync_enter(v6);
  cachedPurgableTime = v6->_cachedPurgableTime;
  if (Current - v6->_cachedPurgableTime[a3] < 60.0)
  {
    unint64_t v10 = v6->_cachedPurgableSpace[a3];
    objc_sync_exit(v6);
  }
  else
  {
    objc_sync_exit(v6);

    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    diskSpaceProviders = v6->_diskSpaceProviders;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000350FC;
    v12[3] = &unk_1000728E8;
    int v13 = a3;
    v12[4] = v6;
    v12[5] = &v14;
    [(NSMutableArray *)diskSpaceProviders enumerateObjectsWithOptions:1 usingBlock:v12];
    os_log_type_t v9 = v6;
    objc_sync_enter(v9);
    cachedPurgableTime[a3] = Current;
    v9->_cachedPurgableSpace[a3] = v15[3];
    objc_sync_exit(v9);

    unint64_t v10 = v15[3];
    _Block_object_dispose(&v14, 8);
  }
  return v10;
}

- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  unsigned int v6 = self;
  objc_sync_enter(v6);
  if (v6->_freePurgableInProgress)
  {
    objc_sync_exit(v6);

    unint64_t v7 = 0;
  }
  else
  {
    v6->_freePurgableInProgress = 1;
    objc_sync_exit(v6);

    diskSpaceProviders = v6->_diskSpaceProviders;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000352A8;
    v11[3] = &unk_100072910;
    v11[5] = &v13;
    v11[6] = a3;
    int v12 = a4;
    void v11[4] = v6;
    [(NSMutableArray *)diskSpaceProviders enumerateObjectsWithOptions:1 usingBlock:v11];
    os_log_type_t v9 = v6;
    objc_sync_enter(v9);
    v6->_freePurgableInProgress = 0;
    objc_sync_exit(v9);

    unint64_t v7 = v14[3];
  }
  _Block_object_dispose(&v13, 8);
  return v7;
}

- (NSString)cacheDeleteID
{
  return self->_cacheDeleteID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskSpaceProviders, 0);

  objc_storeStrong((id *)&self->_cacheDeleteID, 0);
}

@end