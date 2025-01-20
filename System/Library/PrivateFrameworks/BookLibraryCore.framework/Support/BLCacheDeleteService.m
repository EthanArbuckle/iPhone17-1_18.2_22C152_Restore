@interface BLCacheDeleteService
+ (void)registerCacheDeleteInfoCallbacks:(id)a3;
- (BLCacheDelete)cacheDelete;
- (BLCacheDeletePurgeableProvider)purgeableProvider;
- (BLCacheDeleteService)initWithPurgeableProvider:(id)a3;
- (id)_periodic:(id)a3 urgency:(int)a4;
- (id)_purge:(id)a3 urgency:(int)a4;
- (id)_purgeable:(id)a3 urgency:(int)a4;
- (void)_cancelPurge;
- (void)setCacheDelete:(id)a3;
- (void)setPurgeableProvider:(id)a3;
@end

@implementation BLCacheDeleteService

- (BLCacheDeleteService)initWithPurgeableProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLCacheDeleteService;
  v5 = [(BLCacheDeleteService *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(BLCacheDelete);
    cacheDelete = v5->_cacheDelete;
    v5->_cacheDelete = v6;

    objc_storeWeak((id *)&v5->_purgeableProvider, v4);
  }

  return v5;
}

+ (void)registerCacheDeleteInfoCallbacks:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037E1C;
  block[3] = &unk_1001A1180;
  id v6 = a3;
  uint64_t v3 = qword_1001C8160;
  id v4 = v6;
  if (v3 != -1) {
    dispatch_once(&qword_1001C8160, block);
  }
}

- (id)_purgeable:(id)a3 urgency:(int)a4
{
  id v6 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  uint64_t v7 = sub_100038444(a4);
  v8 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    uint64_t v18 = 1752392040;
    __int16 v19 = 2112;
    uint64_t v20 = (uint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requested purgeable amount for volume %{mask.hash}@.", buf, 0x16u);
  }

  objc_super v9 = [(BLCacheDeleteService *)self purgeableProvider];
  id v10 = [v9 purgeableForVolume:v6 urgency:v7];

  v11 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v18 = (uint64_t)v10;
    __int16 v19 = 2160;
    uint64_t v20 = 1752392040;
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Able to purge %ld for volume %{mask.hash}@.", buf, 0x20u);
  }

  v12 = +[NSNumber numberWithInteger:v10, @"CACHE_DELETE_VOLUME", @"CACHE_DELETE_AMOUNT", v6];
  v16[1] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:2];

  return v13;
}

- (id)_purge:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v8 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  uint64_t v9 = sub_100038444(v4);
  id v10 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v26 = (uint64_t)v8;
    __int16 v27 = 2048;
    uint64_t v28 = (int)v4;
    __int16 v29 = 2160;
    uint64_t v30 = 1752392040;
    __int16 v31 = 2112;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requested to purge %@ with urgency %ld for volume %{mask.hash}@.", buf, 0x2Au);
  }

  v11 = [(BLCacheDeleteService *)self cacheDelete];
  uint64_t v12 = (uint64_t)[v11 purgeVolume:v7 urgency:v9 requested:v8];

  v13 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v26 = v12;
    __int16 v27 = 2160;
    uint64_t v28 = 1752392040;
    __int16 v29 = 2112;
    uint64_t v30 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Purged %ld for volume %{mask.hash}@.", buf, 0x20u);
  }

  if (v12 >= 1)
  {
    v24[0] = @"purge";
    v23[0] = BLSharedStorageUseChangedSourceKey;
    v23[1] = off_1001C78A8;
    v14 = +[NSNumber numberWithInt:v4];
    v24[1] = v14;
    v24[2] = v7;
    v23[2] = off_1001C78B0;
    v23[3] = off_1001C78B8;
    v24[3] = v8;
    v23[4] = off_1001C78C0;
    uint64_t v15 = +[NSNumber numberWithInteger:v12];
    v24[4] = v15;
    v16 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:5];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 postNotificationName:BLSharedStorageUseChangedNotification object:v16];
  }
  uint64_t v18 = +[NSNumber numberWithInteger:v12, @"CACHE_DELETE_VOLUME", @"CACHE_DELETE_AMOUNT", v7];
  v22[1] = v18;
  __int16 v19 = +[NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:2];

  return v19;
}

- (id)_periodic:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v8 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  uint64_t v9 = sub_100038444(v4);
  id v10 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v26 = (uint64_t)v8;
    __int16 v27 = 2048;
    uint64_t v28 = (int)v4;
    __int16 v29 = 2160;
    uint64_t v30 = 1752392040;
    __int16 v31 = 2112;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requested to periodic purge %@ with urgency %ld for volume %{mask.hash}@.", buf, 0x2Au);
  }

  v11 = [(BLCacheDeleteService *)self cacheDelete];
  uint64_t v12 = (uint64_t)[v11 periodicPurgeVolume:v7 urgency:v9 requested:v8];

  v13 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Purged %ld.", buf, 0xCu);
  }

  if (v12 >= 1)
  {
    v24[0] = @"periodic";
    v23[0] = BLSharedStorageUseChangedSourceKey;
    v23[1] = off_1001C78A8;
    v14 = +[NSNumber numberWithInt:v4];
    v24[1] = v14;
    v24[2] = v7;
    v23[2] = off_1001C78B0;
    v23[3] = off_1001C78B8;
    v24[3] = v8;
    v23[4] = off_1001C78C0;
    uint64_t v15 = +[NSNumber numberWithInteger:v12];
    v24[4] = v15;
    v16 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:5];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 postNotificationName:BLSharedStorageUseChangedNotification object:0 userInfo:v16];
  }
  uint64_t v18 = +[NSNumber numberWithInteger:v12, @"CACHE_DELETE_VOLUME", @"CACHE_DELETE_AMOUNT", v7];
  v22[1] = v18;
  __int16 v19 = +[NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:2];

  return v19;
}

- (void)_cancelPurge
{
  id v2 = [(BLCacheDeleteService *)self cacheDelete];
  [v2 cancelPurge];
}

- (BLCacheDelete)cacheDelete
{
  return self->_cacheDelete;
}

- (void)setCacheDelete:(id)a3
{
}

- (BLCacheDeletePurgeableProvider)purgeableProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_purgeableProvider);

  return (BLCacheDeletePurgeableProvider *)WeakRetained;
}

- (void)setPurgeableProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_purgeableProvider);

  objc_storeStrong((id *)&self->_cacheDelete, 0);
}

@end