@interface NavdDoomCache
+ (BOOL)saveToFilePath:(id)a3 storage:(id)a4;
+ (id)defaultPath;
+ (id)loadFromFilePath:(id)a3;
- (NavdDoomCache)init;
- (NavdDoomStorageSnapshotDataSource)snapshotDataSource;
- (void)_writeToDisk;
- (void)didEndUpdate;
- (void)didFireAlert;
- (void)didInvalidateWindow;
- (void)didScheduleWakeup;
- (void)didUpdateDestinations;
- (void)didUpdateExitTime;
- (void)didUpdateRoutes;
- (void)didUpdateWindow;
- (void)setSnapshotDataSource:(id)a3;
- (void)willFireAlert;
- (void)willStartUpdate;
- (void)willUpdateDestinations;
- (void)willUpdateExitTime;
- (void)willUpdateRoutes;
@end

@implementation NavdDoomCache

+ (id)defaultPath
{
  return +[NavdPaths pathInCacheDirWithFilename:@"NavdDoomConductor.storage"];
}

+ (BOOL)saveToFilePath:(id)a3 storage:(id)a4
{
  v5 = (char *)a3;
  id v6 = a4;
  if (!v5)
  {
    v5 = [(id)objc_opt_class() defaultPath];
  }
  v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Saving to cache at %@", buf, 0xCu);
  }

  v8 = MapsSuggestionsCurrentBestLocation();
  [v6 setMostRecentLocation:v8];

  id v9 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v9 encodeObject:v6 forKey:@"NavdDoomCacheStorageKey"];
  v10 = [v9 encodedData];
  v11 = [v9 error];

  if (v11)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = [v9 error];
      *(_DWORD *)buf = 138412546;
      v23 = v5;
      __int16 v24 = 2112;
      v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Saving failed to %@, error: %@", buf, 0x16u);
    }
    v14 = (const char *)[v5 UTF8String];
    v15 = [v9 error];
    v16 = [v15 localizedFailureReason];
    printf("Saving failed to %s, error: %s", v14, (const char *)[v16 UTF8String]);
  }
  else
  {
    id v21 = 0;
    unsigned int v19 = [v10 writeToFile:v5 options:1073741825 error:&v21];
    id v20 = v21;
    v15 = v20;
    if (v19 && !v20)
    {
      BOOL v17 = 1;
      goto LABEL_10;
    }
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[NavdDoomCache saveToFilePath:storage:]";
      __int16 v24 = 2112;
      v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s failed because: %@", buf, 0x16u);
    }
  }

  BOOL v17 = 0;
LABEL_10:

  return v17;
}

+ (id)loadFromFilePath:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v3 = [(id)objc_opt_class() defaultPath];
  }
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Loading from cache at %@", buf, 0xCu);
  }

  id v18 = 0;
  v5 = +[NSData dataWithContentsOfFile:v3 options:0 error:&v18];
  id v6 = v18;
  if (v6)
  {
    v7 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      id v9 = 0;
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412546;
    id v20 = v3;
    __int16 v21 = 2112;
    id v22 = v6;
    v8 = "Could not read from: %@, error: %@";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);
    goto LABEL_9;
  }
  if (!v5)
  {
    v7 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412546;
    id v20 = v3;
    __int16 v21 = 2112;
    id v22 = 0;
    v8 = "Error reading from: %@, error: %@";
    goto LABEL_8;
  }
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  id v12 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:0];
  v13 = [v12 decodeObjectOfClasses:v7 forKey:@"NavdDoomCacheStorageKey"];
  [v12 finishDecoding];
  v14 = [v12 error];

  if (v14)
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = [v12 error];
      *(_DWORD *)buf = 138412546;
      id v20 = v3;
      __int16 v21 = 2112;
      id v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Loading failed from %@, error: %@", buf, 0x16u);
    }
  }
  else
  {
    if (v13)
    {
      id v9 = v13;
      goto LABEL_19;
    }
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Loaded nil from %@", buf, 0xCu);
    }
  }

  id v9 = 0;
LABEL_19:

LABEL_20:

  return v9;
}

- (NavdDoomCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)NavdDoomCache;
  v2 = [(NavdDoomCache *)&v8 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("NavdDoomCacheQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = v2;
  }

  return v2;
}

- (void)_writeToDisk
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008B98;
  block[3] = &unk_100088EE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)willStartUpdate
{
}

- (void)willUpdateExitTime
{
}

- (void)didUpdateExitTime
{
}

- (void)didInvalidateWindow
{
}

- (void)didUpdateWindow
{
}

- (void)willUpdateDestinations
{
}

- (void)didUpdateDestinations
{
}

- (void)willUpdateRoutes
{
}

- (void)didUpdateRoutes
{
}

- (void)willFireAlert
{
}

- (void)didFireAlert
{
}

- (void)didScheduleWakeup
{
}

- (void)didEndUpdate
{
}

- (NavdDoomStorageSnapshotDataSource)snapshotDataSource
{
  return self->_snapshotDataSource;
}

- (void)setSnapshotDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotDataSource, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end