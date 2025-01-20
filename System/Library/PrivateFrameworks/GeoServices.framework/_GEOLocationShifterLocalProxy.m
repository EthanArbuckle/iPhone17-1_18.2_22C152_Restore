@interface _GEOLocationShifterLocalProxy
- (BOOL)isLocationShiftEnabled;
- (BOOL)isLocationShiftRequiredForCoordinate:(id)a3;
- (BOOL)isLocationShiftRequiredForRegion:(id)a3;
- (GEOTileDB)persistentCache;
- (NSCache)memoryCache;
- (OS_dispatch_queue)queue;
- (_GEOLocationShifterLocalProxy)init;
- (unsigned)locationShiftFunctionVersion;
- (void)_callCompletionHandler:(id)a3 withRequestedCoordinate:(id)a4 reduceRadius:(double)a5 forResponse:(id)a6 error:(id)a7;
- (void)_doNetworkRequestForLatLng:(id)a3 reduceRadius:(double)a4 traits:(id)a5 auditToken:(id)a6 shouldCache:(BOOL)a7 completionHandler:(id)a8;
- (void)_shiftLatLng:(id)a3 auditToken:(id)a4 usePersistentCache:(BOOL)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)fetchCachedShiftFunctionResponseForLocation:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)flushDiskCache;
- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)pruneDiskCache;
- (void)shiftLatLng:(id)a3 auditToken:(id)a4 completionHandler:(id)a5;
@end

@implementation _GEOLocationShifterLocalProxy

- (BOOL)isLocationShiftEnabled
{
  v2 = GEOURLString();
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (_GEOLocationShifterLocalProxy)init
{
  v15.receiver = self;
  v15.super_class = (Class)_GEOLocationShifterLocalProxy;
  v2 = [(_GEOLocationShifterLocalProxy *)&v15 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_workloop_qos();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = geo_dispatch_queue_create();
    shiftQueueToAvoidCoreLocDeadLocks = v2->_shiftQueueToAvoidCoreLocDeadLocks;
    v2->_shiftQueueToAvoidCoreLocDeadLocks = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(_GEOLocationShiftRequester);
    requester = v2->_requester;
    v2->_requester = v7;

    objc_initWeak(&location, v2);
    v9 = v2->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000264B8;
    v12[3] = &unk_1000720F8;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch("com.apple.Preferences.ResetPrivacyWarningsNotification", &v2->_resetPrivacyToken, v9, v12);
    v10 = v2;
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  notify_cancel(self->_resetPrivacyToken);
  v4.receiver = self;
  v4.super_class = (Class)_GEOLocationShifterLocalProxy;
  [(_GEOLocationShifterLocalProxy *)&v4 dealloc];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSCache)memoryCache
{
  return 0;
}

- (GEOTileDB)persistentCache
{
  return (GEOTileDB *)__GEOGetSharedTileDB(self, a2);
}

- (unsigned)locationShiftFunctionVersion
{
  v2 = +[GEOResourceManifestManager modernManager];
  uint64_t v3 = [v2 activeTileGroup];
  unsigned int v4 = [v3 locationShiftVersion];

  return v4;
}

- (BOOL)isLocationShiftRequiredForCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if ([(_GEOLocationShifterLocalProxy *)self isLocationShiftEnabled])
  {
    uint64_t v5 = +[GEOResourceManifestManager modernManager];
    v6 = [v5 activeTileGroup];
    v7 = [v6 locationShiftEnabledRegions];

    if ([v7 count])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v8);
            }
            if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "containsCoordinate:", var0, var1, (void)v13))
            {
              LOBYTE(v9) = 1;
              goto LABEL_13;
            }
          }
          id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return (char)v9;
}

- (BOOL)isLocationShiftRequiredForRegion:(id)a3
{
  id v4 = a3;
  if ([(_GEOLocationShifterLocalProxy *)self isLocationShiftEnabled])
  {
    GEOMapRectForMapRegion();
    uint64_t v5 = +[GEOResourceManifestManager modernManager];
    v6 = [v5 activeTileGroup];
    v7 = [v6 locationShiftEnabledRegions];

    if ([v7 count])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = v7;
      id v9 = (char *)[v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v8);
            }
            GEOMapRectForMapRegion();
            if (GEOMapRectIntersectsRect())
            {
              LOBYTE(v9) = 1;
              goto LABEL_13;
            }
          }
          id v9 = (char *)[v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

- (void)shiftLatLng:(id)a3 auditToken:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = [v9 bundleId];
    shiftQueueToAvoidCoreLocDeadLocks = self->_shiftQueueToAvoidCoreLocDeadLocks;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026A18;
    block[3] = &unk_100072148;
    id v15 = v11;
    id v16 = v9;
    v17 = self;
    id v18 = v8;
    id v19 = v10;
    id v13 = v11;
    dispatch_async(shiftQueueToAvoidCoreLocDeadLocks, block);
  }
}

- (void)_shiftLatLng:(id)a3 auditToken:(id)a4 usePersistentCache:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[GEOMapService sharedService];
  long long v14 = [v13 defaultTraits];

  GEOConfigGetDouble();
  double v16 = v15;
  if (v7)
  {
    [(_GEOLocationShifterLocalProxy *)self pruneDiskCache];
    v17 = [(_GEOLocationShifterLocalProxy *)self persistentCache];
    [v10 coordinate];
    double v19 = v18;
    double v21 = v20;
    queue = self->_queue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100026F68;
    v23[3] = &unk_100072170;
    v23[4] = self;
    id v27 = v12;
    id v24 = v10;
    double v28 = v16;
    id v25 = v14;
    id v26 = v11;
    char v29 = 1;
    objc_msgSend(v17, "findShiftResponseForCoordinate:reduceRadius:queue:completion:", queue, v23, v19, v21, v16);
  }
  else
  {
    [(_GEOLocationShifterLocalProxy *)self _doNetworkRequestForLatLng:v10 reduceRadius:v14 traits:v11 auditToken:0 shouldCache:v12 completionHandler:v15];
  }
}

- (void)_doNetworkRequestForLatLng:(id)a3 reduceRadius:(double)a4 traits:(id)a5 auditToken:(id)a6 shouldCache:(BOOL)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  id v17 = a5;
  id v18 = objc_alloc_init((Class)GEOPolyLocationShiftRequest);
  [v18 setLocation:v14];
  double v19 = GEOGreenTeaGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO) && [v14 hasGreenTeaWithValue:1]) {
    GEOGreenTeaLog();
  }

  requester = self->_requester;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002711C;
  v23[3] = &unk_100072198;
  BOOL v28 = a7;
  id v24 = v14;
  id v25 = self;
  id v26 = v16;
  double v27 = a4;
  id v21 = v16;
  id v22 = v14;
  [(_GEOLocationShiftRequester *)requester startWithRequest:v18 traits:v17 auditToken:v15 completionHandler:v23];
}

- (void)_callCompletionHandler:(id)a3 withRequestedCoordinate:(id)a4 reduceRadius:(double)a5 forResponse:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (a5 > 0.0)
  {
    uint64_t v15 = [v13 contractFunctionTo:a4 withRadius:a5];

    id v13 = (id)v15;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027360;
  block[3] = &unk_1000721C0;
  id v22 = v14;
  id v23 = v12;
  id v21 = v13;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  dispatch_async(queue, block);
}

- (void)pruneDiskCache
{
  id v2 = [(_GEOLocationShifterLocalProxy *)self persistentCache];
  [v2 pruneShiftEntries];
}

- (void)flushDiskCache
{
  id v2 = [(_GEOLocationShifterLocalProxy *)self persistentCache];
  [v2 removeAllShiftEntriesSync];
}

- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_GEOLocationShifterLocalProxy *)self persistentCache];
  [v11 getAllShiftEntries:v10 queue:v9 handler:v8];
}

- (void)fetchCachedShiftFunctionResponseForLocation:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  GEOConfigGetDouble();
  double v12 = v11;
  [(_GEOLocationShifterLocalProxy *)self pruneDiskCache];
  id v13 = [(_GEOLocationShifterLocalProxy *)self persistentCache];
  [v10 coordinate];
  double v15 = v14;
  double v17 = v16;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000275B8;
  v19[3] = &unk_1000721E8;
  v19[4] = self;
  id v20 = v8;
  id v18 = v8;
  objc_msgSend(v13, "findShiftResponseForCoordinate:reduceRadius:queue:completion:", v9, v19, v15, v17, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shiftQueueToAvoidCoreLocDeadLocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_requester, 0);
}

@end