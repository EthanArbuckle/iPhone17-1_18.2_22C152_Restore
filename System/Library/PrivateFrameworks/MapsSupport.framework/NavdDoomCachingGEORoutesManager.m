@interface NavdDoomCachingGEORoutesManager
+ (id)defaultFileURL;
+ (id)defaultPath;
- (BOOL)hasExpiredItems;
- (BOOL)isCachedItemValidWithType:(id)a3 andCacheDate:(id)a4;
- (BOOL)requestRouteFrom:(id)a3 to:(id)a4 completionHandler:(id)a5;
- (BOOL)requestWaypointForMapsSuggestionsEntry:(id)a3 completionHandler:(id)a4;
- (BOOL)saveCacheToFile;
- (NSMutableDictionary)cache;
- (NSString)cachePath;
- (NavdDoomCachingGEORoutesManager)init;
- (NavdDoomCachingGEORoutesManager)initWithRoutesManager:(id)a3 cachePath:(id)a4;
- (NavdDoomGEORoutesManager)manager;
- (double)routeCacheExpirationInterval;
- (double)waypointExpirationInterval;
- (id)cachedRoutesCacheForOrigin:(id)a3 destination:(id)a4;
- (id)cachedWaypointForEntry:(id)a3;
- (id)keyForEntry:(id)a3;
- (id)keyForOrigin:(id)a3 destination:(id)a4;
- (id)loggingStringForObject:(id)a3;
- (id)minimumDateForCachedObjectOfType:(id)a3;
- (void)loadCacheFromFile;
- (void)pruneExpiredItems;
- (void)setCache:(id)a3;
- (void)setCachePath:(id)a3;
- (void)setCachedRouteCache:(id)a3 forOrigin:(id)a4 destination:(id)a5;
- (void)setCachedWaypoint:(id)a3 forEntry:(id)a4;
- (void)setExpirationInterval:(double)a3;
- (void)setManager:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setRouteCacheExpirationInterval:(double)a3;
- (void)setWaypointExpirationInterval:(double)a3;
- (void)touchAllCachedItems;
@end

@implementation NavdDoomCachingGEORoutesManager

+ (id)defaultPath
{
  return +[NavdPaths pathInCacheDirWithFilename:@"GEORoutesCache.plist"];
}

+ (id)defaultFileURL
{
  v2 = [a1 defaultPath];
  v3 = +[NSURL fileURLWithPath:v2];

  return v3;
}

- (NavdDoomCachingGEORoutesManager)initWithRoutesManager:(id)a3 cachePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NavdDoomCachingGEORoutesManager;
  v8 = [(NavdDoomCachingGEORoutesManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(NavdDoomCachingGEORoutesManager *)v8 setManager:v6];
    GEOConfigGetDouble();
    -[NavdDoomCachingGEORoutesManager setWaypointExpirationInterval:](v9, "setWaypointExpirationInterval:");
    GEOConfigGetDouble();
    [(NavdDoomCachingGEORoutesManager *)v9 setRouteCacheExpirationInterval:"setRouteCacheExpirationInterval:"];
    [(NavdDoomCachingGEORoutesManager *)v9 setCachePath:v7];
    [(NavdDoomCachingGEORoutesManager *)v9 loadCacheFromFile];
  }

  return v9;
}

- (NavdDoomCachingGEORoutesManager)init
{
  v3 = objc_alloc_init(NavdDoomGEORoutesManager);
  v4 = [(id)objc_opt_class() defaultPath];
  v5 = [(NavdDoomCachingGEORoutesManager *)self initWithRoutesManager:v3 cachePath:v4];

  return v5;
}

- (void)loadCacheFromFile
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(NavdDoomCachingGEORoutesManager *)self cachePath];
    int v10 = 138412290;
    objc_super v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Loading routes cache from %@", (uint8_t *)&v10, 0xCu);
  }
  id v5 = objc_alloc((Class)NSMutableDictionary);
  id v6 = [(NavdDoomCachingGEORoutesManager *)self cachePath];
  id v7 = [v5 initWithContentsOfFile:v6];
  [(NavdDoomCachingGEORoutesManager *)self setCache:v7];

  v8 = [(NavdDoomCachingGEORoutesManager *)self cache];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [(NavdDoomCachingGEORoutesManager *)self setCache:v9];
  }
}

- (BOOL)saveCacheToFile
{
  if (self->_readOnly) {
    return 1;
  }
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Saving routes cache", buf, 2u);
  }

  [(NavdDoomCachingGEORoutesManager *)self pruneExpiredItems];
  id v5 = [(NavdDoomCachingGEORoutesManager *)self cache];
  id v6 = [(NavdDoomCachingGEORoutesManager *)self cachePath];
  unsigned __int8 v2 = [v5 writeToFile:v6 atomically:0];

  id v7 = [(id)objc_opt_class() defaultFileURL];
  id v11 = 0;
  LODWORD(v6) = [v7 setResourceValue:NSURLFileProtectionCompleteUntilFirstUserAuthentication forKey:NSURLFileProtectionKey error:&v11];
  id v8 = v11;

  if (!v6 || v8)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed applying file protection: %{private}@", buf, 0xCu);
    }
  }
  return v2;
}

- (id)minimumDateForCachedObjectOfType:(id)a3
{
  if ([a3 isEqual:@"routeCache"]) {
    [(NavdDoomCachingGEORoutesManager *)self routeCacheExpirationInterval];
  }
  else {
    [(NavdDoomCachingGEORoutesManager *)self waypointExpirationInterval];
  }
  id v5 = +[NSDate dateWithTimeIntervalSinceNow:-v4];

  return v5;
}

- (BOOL)isCachedItemValidWithType:(id)a3 andCacheDate:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v6 = a4;
  id v7 = [(NavdDoomCachingGEORoutesManager *)self minimumDateForCachedObjectOfType:a3];
  id v8 = [v6 compare:v7];

  BOOL v9 = v8 == (id)1;
  return v9;
}

- (id)keyForOrigin:(id)a3 destination:(id)a4
{
  double v4 = objc_msgSend(a4, "latLng", a3);
  id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 hash]);
  id v6 = [v5 stringValue];

  return v6;
}

- (void)setCachedRouteCache:(id)a3 forOrigin:(id)a4 destination:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v9];
    id v13 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v10];
    *(_DWORD *)buf = 138412546;
    v26 = v12;
    __int16 v27 = 2112;
    v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Setting route cache for origin: %@, destination: %@", buf, 0x16u);
  }
  v14 = [(NavdDoomCachingGEORoutesManager *)self keyForOrigin:v9 destination:v10];
  v15 = [(NavdDoomCachingGEORoutesManager *)self cache];
  v16 = [v15 objectForKeyedSubscript:@"routeCaches"];

  if (!v16)
  {
    id v17 = objc_alloc_init((Class)NSMutableDictionary);
    v18 = [(NavdDoomCachingGEORoutesManager *)self cache];
    [v18 setObject:v17 forKeyedSubscript:@"routeCaches"];
  }
  v23[0] = @"date";
  v19 = MapsSuggestionsNow();
  v23[1] = @"routeCache";
  v24[0] = v19;
  v24[1] = v8;
  v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v21 = [(NavdDoomCachingGEORoutesManager *)self cache];
  v22 = [v21 objectForKeyedSubscript:@"routeCaches"];
  [v22 setObject:v20 forKeyedSubscript:v14];

  [(NavdDoomCachingGEORoutesManager *)self saveCacheToFile];
}

- (id)cachedRoutesCacheForOrigin:(id)a3 destination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NavdDoomCachingGEORoutesManager *)self keyForOrigin:v6 destination:v7];
  id v9 = [(NavdDoomCachingGEORoutesManager *)self cache];
  id v10 = [v9 objectForKeyedSubscript:@"routeCaches"];
  id v11 = [v10 objectForKeyedSubscript:v8];
  v12 = [v11 objectForKeyedSubscript:@"date"];

  unsigned int v13 = [(NavdDoomCachingGEORoutesManager *)self isCachedItemValidWithType:@"routeCaches" andCacheDate:v12];
  v14 = GEOFindOrCreateLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v15)
    {
      v16 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v6];
      id v17 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v7];
      v28 = [(NavdDoomCachingGEORoutesManager *)self cache];
      __int16 v27 = [v28 objectForKeyedSubscript:@"routeCaches"];
      v26 = [v27 objectForKeyedSubscript:v8];
      v18 = [v26 objectForKeyedSubscript:@"routeCache"];
      v19 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v18];
      *(_DWORD *)buf = 138412802;
      v30 = v16;
      __int16 v31 = 2112;
      v32 = v17;
      __int16 v33 = 2112;
      v34 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Cached route cache for origin: %@, destination: %@, result: %@", buf, 0x20u);
    }
    v14 = [(NavdDoomCachingGEORoutesManager *)self cache];
    v20 = [v14 objectForKeyedSubscript:@"routeCaches"];
    v21 = [v20 objectForKeyedSubscript:v8];
    v22 = [v21 objectForKeyedSubscript:@"routeCache"];
  }
  else
  {
    if (v15)
    {
      v23 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v6];
      v24 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v7];
      *(_DWORD *)buf = 138412546;
      v30 = v23;
      __int16 v31 = 2112;
      v32 = v24;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Cache miss for origin: %@, destination: %@", buf, 0x16u);
    }
    v22 = 0;
  }

  return v22;
}

- (id)keyForEntry:(id)a3
{
  return [a3 uniqueIdentifier];
}

- (void)setCachedWaypoint:(id)a3 forEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v6];
    id v10 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v7];
    *(_DWORD *)buf = 138412546;
    v24 = v9;
    __int16 v25 = 2112;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Setting waypoint cache to: %@ for entry: %@", buf, 0x16u);
  }
  id v11 = [(NavdDoomCachingGEORoutesManager *)self keyForEntry:v7];
  v12 = [(NavdDoomCachingGEORoutesManager *)self cache];
  unsigned int v13 = [v12 objectForKeyedSubscript:@"waypoints"];

  if (!v13)
  {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    BOOL v15 = [(NavdDoomCachingGEORoutesManager *)self cache];
    [v15 setObject:v14 forKeyedSubscript:@"waypoints"];
  }
  v16 = MapsSuggestionsNow();
  id v17 = objc_msgSend(v6, "data", @"date", @"waypoint", v16);
  v22[1] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:2];
  v19 = [(NavdDoomCachingGEORoutesManager *)self cache];
  v20 = [v19 objectForKeyedSubscript:@"waypoints"];
  [v20 setObject:v18 forKeyedSubscript:v11];

  [(NavdDoomCachingGEORoutesManager *)self saveCacheToFile];
}

- (id)cachedWaypointForEntry:(id)a3
{
  id v4 = a3;
  id v5 = [(NavdDoomCachingGEORoutesManager *)self keyForEntry:v4];
  id v6 = [(NavdDoomCachingGEORoutesManager *)self cache];
  id v7 = [v6 objectForKeyedSubscript:@"waypoints"];
  id v8 = [v7 objectForKeyedSubscript:v5];
  id v9 = [v8 objectForKeyedSubscript:@"date"];

  if ([(NavdDoomCachingGEORoutesManager *)self isCachedItemValidWithType:@"waypoints" andCacheDate:v9])
  {
    id v10 = [(NavdDoomCachingGEORoutesManager *)self cache];
    id v11 = [v10 objectForKeyedSubscript:@"waypoints"];
    v12 = [v11 objectForKeyedSubscript:v5];
    unsigned int v13 = [v12 objectForKeyedSubscript:@"waypoint"];

    id v14 = [objc_alloc((Class)GEOComposedWaypoint) initWithData:v13];
    BOOL v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v14];
      id v17 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v4];
      int v20 = 138412546;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Cached waypoint: %@ for entry: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    unsigned int v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v18 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v4];
      int v20 = 138412290;
      uint64_t v21 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Cache miss for entry: %@", (uint8_t *)&v20, 0xCu);
    }
    id v14 = 0;
  }

  return v14;
}

- (void)pruneExpiredItems
{
  id v32 = objc_alloc_init((Class)NSMutableArray);
  v3 = [(NavdDoomCachingGEORoutesManager *)self cache];
  id v4 = [v3 objectForKeyedSubscript:@"waypoints"];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v30 = v4;
  id obj = [v4 allKeys];
  id v5 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v8);
        id v10 = [(NavdDoomCachingGEORoutesManager *)self cache];
        id v11 = [v10 objectForKeyedSubscript:@"waypoints"];
        v12 = [v11 objectForKeyedSubscript:v9];
        unsigned int v13 = [v12 objectForKeyedSubscript:@"date"];

        if (!-[NavdDoomCachingGEORoutesManager isCachedItemValidWithType:andCacheDate:](self, "isCachedItemValidWithType:andCacheDate:", @"waypoints", v13))[v32 addObject:v9]; {
        id v8 = (char *)v8 + 1;
        }
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v6);
  }

  id v14 = [(NavdDoomCachingGEORoutesManager *)self cache];
  BOOL v15 = [v14 objectForKeyedSubscript:@"waypoints"];
  [v15 removeObjectsForKeys:v32];

  id v31 = objc_alloc_init((Class)NSMutableArray);
  v16 = [(NavdDoomCachingGEORoutesManager *)self cache];
  id v17 = [v16 objectForKeyedSubscript:@"routeCaches"];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v29 = v17;
  id obja = [v17 allKeys];
  id v18 = [obja countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(obja);
        }
        uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v21);
        v23 = [(NavdDoomCachingGEORoutesManager *)self cache];
        v24 = [v23 objectForKeyedSubscript:@"routeCaches"];
        __int16 v25 = [v24 objectForKeyedSubscript:v22];
        v26 = [v25 objectForKeyedSubscript:@"date"];

        if (!-[NavdDoomCachingGEORoutesManager isCachedItemValidWithType:andCacheDate:](self, "isCachedItemValidWithType:andCacheDate:", @"routeCaches", v26))[v31 addObject:v22]; {
        uint64_t v21 = (char *)v21 + 1;
        }
      }
      while (v19 != v21);
      id v19 = [obja countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v19);
  }

  __int16 v27 = [(NavdDoomCachingGEORoutesManager *)self cache];
  v28 = [v27 objectForKeyedSubscript:@"routeCaches"];
  [v28 removeObjectsForKeys:v31];
}

- (BOOL)hasExpiredItems
{
  v3 = [(NavdDoomCachingGEORoutesManager *)self cache];
  id v4 = [v3 objectForKeyedSubscript:@"waypoints"];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v28 = v4;
  id obj = [v4 allKeys];
  id v5 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v10 = [(NavdDoomCachingGEORoutesManager *)self cache];
        id v11 = [v10 objectForKeyedSubscript:@"waypoints"];
        v12 = [v11 objectForKeyedSubscript:v9];
        unsigned int v13 = [v12 objectForKeyedSubscript:@"date"];

        LODWORD(v12) = [(NavdDoomCachingGEORoutesManager *)self isCachedItemValidWithType:@"waypoints" andCacheDate:v13];
        if (!v12)
        {
          BOOL v25 = 1;
          v26 = v28;
          goto LABEL_21;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v14 = [(NavdDoomCachingGEORoutesManager *)self cache];
  BOOL v15 = [v14 objectForKeyedSubscript:@"routeCaches"];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v15;
  id v29 = [v15 allKeys];
  id v16 = [v29 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v32;
    while (2)
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v29);
        }
        uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
        uint64_t v21 = [(NavdDoomCachingGEORoutesManager *)self cache];
        uint64_t v22 = [v21 objectForKeyedSubscript:@"routeCaches"];
        v23 = [v22 objectForKeyedSubscript:v20];
        v24 = [v23 objectForKeyedSubscript:@"date"];

        LODWORD(v23) = [(NavdDoomCachingGEORoutesManager *)self isCachedItemValidWithType:@"routeCaches" andCacheDate:v24];
        if (!v23)
        {
          BOOL v25 = 1;
          goto LABEL_20;
        }
      }
      id v17 = [v29 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  BOOL v25 = 0;
LABEL_20:
  v26 = v28;

LABEL_21:
  return v25;
}

- (void)setExpirationInterval:(double)a3
{
  -[NavdDoomCachingGEORoutesManager setWaypointExpirationInterval:](self, "setWaypointExpirationInterval:");

  [(NavdDoomCachingGEORoutesManager *)self setRouteCacheExpirationInterval:a3];
}

- (void)touchAllCachedItems
{
  v3 = [(NavdDoomCachingGEORoutesManager *)self cache];
  id v4 = [v3 objectForKeyedSubscript:@"waypoints"];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v26 = v4;
  id obj = [v4 allKeys];
  id v5 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v8);
        id v10 = MapsSuggestionsNow();
        id v11 = [(NavdDoomCachingGEORoutesManager *)self cache];
        v12 = [v11 objectForKeyedSubscript:@"waypoints"];
        unsigned int v13 = [v12 objectForKeyedSubscript:v9];
        [v13 setObject:v10 forKeyedSubscript:@"date"];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v6);
  }

  id v14 = [(NavdDoomCachingGEORoutesManager *)self cache];
  BOOL v15 = [v14 objectForKeyedSubscript:@"routeCaches"];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  BOOL v25 = v15;
  id obja = [v15 allKeys];
  id v16 = [obja countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      id v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(obja);
        }
        uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v19);
        uint64_t v21 = MapsSuggestionsNow();
        uint64_t v22 = [(NavdDoomCachingGEORoutesManager *)self cache];
        v23 = [v22 objectForKeyedSubscript:@"routeCaches"];
        v24 = [v23 objectForKeyedSubscript:v20];
        [v24 setObject:v21 forKeyedSubscript:@"date"];

        id v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [obja countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v17);
  }
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (id)loggingStringForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 latLng];
    [v5 lat];
    uint64_t v7 = v6;
    id v8 = [v4 latLng];
    [v8 lng];
    +[NSString stringWithFormat:@"<GEOComposedWaypoint: %p> { %f, %f }", v4, v7, v9];
    unsigned int v13 = LABEL_5:;

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 latLng];
    [v5 lat];
    uint64_t v11 = v10;
    id v8 = [v4 latLng];
    [v8 lng];
    +[NSString stringWithFormat:@"<GEOLocation: %p> { %f, %f }", v4, v11, v12];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v3;
    id v15 = [v14 numberForKey:@"MapsSuggestionsLatitudeKey"];
    id v16 = [v14 numberForKey:@"MapsSuggestionsLongitudeKey"];
    id v17 = [v14 title];
    uint64_t v18 = [v14 uniqueIdentifier];
    [v15 doubleValue];
    uint64_t v20 = v19;
    [v16 doubleValue];
    unsigned int v13 = +[NSString stringWithFormat:@"<MapsSuggestionsEntry: %p> { %@ (%@) : %f, %f }", v14, v17, v18, v20, v21];

LABEL_10:
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v3;
    unsigned int v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<NSData: %p (%lu bytes)>", v15, [v15 length]);
    goto LABEL_10;
  }
  unsigned int v13 = [v3 description];
LABEL_12:

  return v13;
}

- (BOOL)requestRouteFrom:(id)a3 to:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(NavdDoomCachingGEORoutesManager *)self cachedRoutesCacheForOrigin:v8 destination:v9];
  objc_initWeak(&location, self);
  uint64_t v12 = [(NavdDoomCachingGEORoutesManager *)self manager];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100029CCC;
  v18[3] = &unk_10008AAD8;
  objc_copyWeak(&v22, &location);
  id v13 = v8;
  id v19 = v13;
  id v14 = v9;
  id v20 = v14;
  id v15 = v10;
  id v21 = v15;
  unsigned __int8 v16 = [v12 requestRouteFrom:v13 to:v14 routeCache:v11 completionHandler:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v16;
}

- (BOOL)requestWaypointForMapsSuggestionsEntry:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  id v8 = [(NavdDoomCachingGEORoutesManager *)self cachedWaypointForEntry:v6];
  if (v8)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [(NavdDoomCachingGEORoutesManager *)self loggingStringForObject:v6];
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Returning cached waypoint for entry: %@", buf, 0xCu);
    }
    v7[2](v7, v8, 0);
    unsigned __int8 v11 = 1;
  }
  else
  {
    objc_initWeak((id *)buf, self);
    uint64_t v12 = [(NavdDoomCachingGEORoutesManager *)self manager];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002A080;
    v14[3] = &unk_10008AB00;
    objc_copyWeak(&v17, (id *)buf);
    id v15 = v6;
    unsigned __int8 v16 = v7;
    unsigned __int8 v11 = [v12 requestWaypointForMapsSuggestionsEntry:v15 completionHandler:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

- (NavdDoomGEORoutesManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (void)setCachePath:(id)a3
{
}

- (double)waypointExpirationInterval
{
  return self->_waypointExpirationInterval;
}

- (void)setWaypointExpirationInterval:(double)a3
{
  self->_waypointExpirationInterval = a3;
}

- (double)routeCacheExpirationInterval
{
  return self->_routeCacheExpirationInterval;
}

- (void)setRouteCacheExpirationInterval:(double)a3
{
  self->_routeCacheExpirationInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end