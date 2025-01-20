@interface BLCacheDeleteStorageManager
- (BLCacheDeleteStorageManager)init;
- (BLDownloadQueueNonUI)blDownloadQueue;
- (NSMutableDictionary)volumeInfos;
- (NSMutableSet)downloadingPersistentIdentifiers;
- (OS_dispatch_queue)dispatchQueue;
- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4;
- (void)_storageUseChangedNotification:(id)a3;
- (void)dealloc;
- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5;
- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4;
- (void)dq_updateAvailableStorage;
- (void)dq_updateAvailableStorageForVolumeInfo:(id)a3 inVolume:(id)a4;
- (void)setBlDownloadQueue:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDownloadingPersistentIdentifiers:(id)a3;
- (void)setVolumeInfos:(id)a3;
- (void)updateAvailableStorage;
@end

@implementation BLCacheDeleteStorageManager

- (BLCacheDeleteStorageManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)BLCacheDeleteStorageManager;
  v2 = [(BLCacheDeleteStorageManager *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.bookassetd.CacheDeleteStorageManager", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSMutableDictionary dictionary];
    volumeInfos = v2->_volumeInfos;
    v2->_volumeInfos = (NSMutableDictionary *)v6;

    v8 = objc_alloc_init(BLCacheDeleteStorageVolumeInfo);
    [(NSMutableDictionary *)v2->_volumeInfos setObject:v8 forKeyedSubscript:off_1001C7B68];

    v9 = objc_alloc_init(BLCacheDeleteStorageVolumeInfo);
    [(NSMutableDictionary *)v2->_volumeInfos setObject:v9 forKeyedSubscript:off_1001C7B70];

    uint64_t v10 = +[NSMutableSet set];
    downloadingPersistentIdentifiers = v2->_downloadingPersistentIdentifiers;
    v2->_downloadingPersistentIdentifiers = (NSMutableSet *)v10;

    uint64_t v12 = +[BLDownloadQueueNonUI sharedInstance];
    blDownloadQueue = v2->_blDownloadQueue;
    v2->_blDownloadQueue = (BLDownloadQueueNonUI *)v12;

    [(BLDownloadQueueNonUI *)v2->_blDownloadQueue addObserver:v2];
    v14 = BLBookCacheDeleteLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Adding store services download observer.", v17, 2u);
    }

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"_storageUseChangedNotification:" name:BLSharedStorageUseChangedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(BLCacheDeleteStorageManager *)self blDownloadQueue];
  [v3 removeObserver:self];

  dispatch_queue_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)BLCacheDeleteStorageManager;
  [(BLCacheDeleteStorageManager *)&v5 dealloc];
}

- (void)updateAvailableStorage
{
  objc_initWeak(&location, self);
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004BE38;
  v4[3] = &unk_1001A20F8;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)dispatchQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(BLCacheDeleteStorageManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004BF7C;
  block[3] = &unk_1001A25E8;
  objc_copyWeak(&v12, &location);
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(BLCacheDeleteStorageManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C300;
  block[3] = &unk_1001A25E8;
  objc_copyWeak(&v15, &location);
  id v14 = v9;
  id v12 = v9;
  dispatch_async(v11, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(BLCacheDeleteStorageManager *)self volumeInfos];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    id v9 = BLBookCacheDeleteLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 141558274;
      uint64_t v14 = 1752392040;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Missing info for volume %{mask.hash}@", (uint8_t *)&v13, 0x16u);
    }
  }
  switch(a4)
  {
    case 1:
      id v10 = [v8 purgeableLowPriority];
      goto LABEL_11;
    case 2:
      id v10 = [v8 purgeableMediumPriority];
      goto LABEL_11;
    case 3:
      id v10 = [v8 purgeableHighPriority];
      goto LABEL_11;
    case 4:
      id v10 = [v8 purgeableSpecialCasePriority];
LABEL_11:
      int64_t v11 = (int64_t)v10;
      break;
    default:
      int64_t v11 = 0;
      break;
  }

  return v11;
}

- (void)_storageUseChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received notification that shared storage usage has changed.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004C768;
  v8[3] = &unk_1001A1F70;
  id v9 = v4;
  id v7 = v4;
  objc_copyWeak(&v10, buf);
  dispatch_async((dispatch_queue_t)dispatchQueue, v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(buf);
}

- (void)dq_updateAvailableStorage
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(BLCacheDeleteStorageManager *)self volumeInfos];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        id v9 = [(BLCacheDeleteStorageManager *)self volumeInfos];
        id v10 = [v9 objectForKeyedSubscript:v8];

        [(BLCacheDeleteStorageManager *)self dq_updateAvailableStorageForVolumeInfo:v10 inVolume:v8];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)dq_updateAvailableStorageForVolumeInfo:(id)a3 inVolume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BLCacheDeleteStorageManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    uint64_t v23 = 1752392040;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Checking purgeable amounts for volume %{mask.hash}@.", buf, 0x16u);
  }

  id v10 = objc_alloc_init(BLCacheDelete);
  [v6 setPurgeableValueChanged:0];
  objc_msgSend(v6, "setPurgeableLowPriority:", -[BLCacheDelete purgeableAmountForVolume:urgency:](v10, "purgeableAmountForVolume:urgency:", v7, 1));
  objc_msgSend(v6, "setPurgeableMediumPriority:", -[BLCacheDelete purgeableAmountForVolume:urgency:](v10, "purgeableAmountForVolume:urgency:", v7, 2));
  objc_msgSend(v6, "setPurgeableHighPriority:", -[BLCacheDelete purgeableAmountForVolume:urgency:](v10, "purgeableAmountForVolume:urgency:", v7, 3));
  objc_msgSend(v6, "setPurgeableSpecialCasePriority:", -[BLCacheDelete purgeableAmountForVolume:urgency:](v10, "purgeableAmountForVolume:urgency:", v7, 4));
  if ([v6 purgeableValueChanged])
  {
    v20[0] = &off_1001AF820;
    long long v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 purgeableLowPriority]);
    v21[0] = v11;
    v20[1] = &off_1001AF838;
    long long v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 purgeableMediumPriority]);
    v21[1] = v12;
    v20[2] = &off_1001AF850;
    long long v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 purgeableHighPriority]);
    v21[2] = v13;
    v20[3] = &off_1001AF868;
    long long v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 purgeableSpecialCasePriority]);
    v21[3] = v14;
    __int16 v15 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

    v18[0] = @"CACHE_DELETE_ID";
    v18[1] = @"CACHE_DELETE_VOLUME";
    v19[0] = kiBooksCacheDeleteID;
    v19[1] = v7;
    v18[2] = @"CACHE_DELETE_AMOUNT";
    v19[2] = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    CacheDeleteUpdatePurgeable();
    v17 = BLBookCacheDeleteLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558274;
      uint64_t v23 = 1752392040;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Pushed purgeable amount update for volume %{mask.hash}@.", buf, 0x16u);
    }
  }
  else
  {
    __int16 v15 = BLBookCacheDeleteLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558274;
      uint64_t v23 = 1752392040;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No change in purgeable amounts for volume %{mask.hash}@.", buf, 0x16u);
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BLDownloadQueueNonUI)blDownloadQueue
{
  return self->_blDownloadQueue;
}

- (void)setBlDownloadQueue:(id)a3
{
}

- (NSMutableSet)downloadingPersistentIdentifiers
{
  return self->_downloadingPersistentIdentifiers;
}

- (void)setDownloadingPersistentIdentifiers:(id)a3
{
}

- (NSMutableDictionary)volumeInfos
{
  return self->_volumeInfos;
}

- (void)setVolumeInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeInfos, 0);
  objc_storeStrong((id *)&self->_downloadingPersistentIdentifiers, 0);
  objc_storeStrong((id *)&self->_blDownloadQueue, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end