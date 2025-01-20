@interface BDSNBController
- (BCCloudDataSource)dataSource;
- (BDSNBController)initWithCloudDataSource:(id)a3;
- (BOOL)fetching;
- (OS_dispatch_queue)fetchQueue;
- (id)observer;
- (void)_archiveCloudSyncVersions:(id)a3 completion:(id)a4;
- (void)_fetchCloudSyncVersions:(id)a3 completion:(id)a4;
- (void)_fetchLatestCompletion:(id)a3;
- (void)_fq_fetchSince:(id)a3 completion:(id)a4;
- (void)_updateAssetDetail:(id)a3 fromMediaItem:(id)a4;
- (void)_updateBookmarkTimeFromAssetDetail:(id)a3;
- (void)dealloc;
- (void)fetchLatestCompletion:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFetchQueue:(id)a3;
- (void)setFetching:(BOOL)a3;
- (void)setObserver:(id)a3;
@end

@implementation BDSNBController

- (BDSNBController)initWithCloudDataSource:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BDSNBController;
  v6 = [(BDSNBController *)&v21 init];
  if (v6)
  {
    v7 = sub_10000CEB0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1001E9BD0();
    }

    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("dataStoreFetch", v8);
    fetchQueue = v6->_fetchQueue;
    v6->_fetchQueue = (OS_dispatch_queue *)v9;

    objc_initWeak(&location, v6);
    v11 = +[NSDistributedNotificationCenter defaultCenter];
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_1000704C8;
    v18 = &unk_100261CC8;
    objc_copyWeak(&v19, &location);
    uint64_t v12 = [v11 addObserverForName:@"BCCloudAssetDetailManagerChanged" object:0 queue:0 usingBlock:&v15];
    id observer = v6->_observer;
    v6->_id observer = (id)v12;

    -[BDSNBController fetchLatestCompletion:](v6, "fetchLatestCompletion:", &stru_100261CE8, v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self->_observer];

  v4.receiver = self;
  v4.super_class = (Class)BDSNBController;
  [(BDSNBController *)&v4 dealloc];
}

- (void)_fetchCloudSyncVersions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BDSNBController *)self dataSource];
  dispatch_queue_t v9 = [v8 managedObjectContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000706F0;
  v13[3] = &unk_100261D10;
  id v14 = v9;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v9;
  [v12 performBlock:v13];
}

- (void)_archiveCloudSyncVersions:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007098C;
  v7[3] = &unk_100261D38;
  id v8 = a3;
  id v6 = v8;
  [(BDSNBController *)self _fetchCloudSyncVersions:v7 completion:a4];
}

- (void)fetchLatestCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100070A80;
  v6[3] = &unk_10025FE98;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(BDSNBController *)self _fetchLatestCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_fetchLatestCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(BDSNBController *)self fetchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100070BE0;
  block[3] = &unk_10025FE98;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_updateAssetDetail:(id)a3 fromMediaItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[BCCloudAssetManager sharedManager];
  id v8 = [v7 assetDetailManager];

  [v6 bookmarkTime];
  objc_msgSend(v5, "setBookmarkTime:");
  id v9 = [v6 lastPlayedDate];
  [v5 setDatePlaybackTimeUpdated:v9];

  [v6 playbackDuration];
  double v11 = v10;

  float v12 = 0.0;
  if (v11 != 0.0)
  {
    [v5 bookmarkTime];
    float v12 = v13 / v11;
  }
  if (v12 < 0.0 || v12 > 1.0)
  {
    id v14 = sub_10000CEB0();
    double v15 = v12;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      [v5 bookmarkTime];
      *(_DWORD *)buf = 134218496;
      double v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v21;
      __int16 v28 = 2048;
      double v29 = v11;
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Calculated reading progress out of range %f.  bookmarkTime=%f audiobookDuration=%f", buf, 0x20u);
    }

    BUClamp();
    float v12 = v16;
  }
  [v5 readingProgressHighWaterMark];
  if (*(float *)&v17 >= v12) {
    float v18 = *(float *)&v17;
  }
  else {
    float v18 = v12;
  }
  *(float *)&double v17 = v12;
  [v5 setReadingProgress:v17];
  *(float *)&double v19 = v18;
  [v5 setReadingProgressHighWaterMark:v19];
  [v5 assetID];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10007114C;
  v22[3] = &unk_100261DA8;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v23;
  [v8 setAssetDetail:v5 completion:v22];
}

- (void)_updateBookmarkTimeFromAssetDetail:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000CEB0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 assetID];
    int v37 = 138412290;
    v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BDSNBController attempting to update bookmark time from assetDetail %@", (uint8_t *)&v37, 0xCu);
  }
  id v7 = [v4 assetID];
  id v8 = +[BDSMediaLibraryUtils representativeDAAPMediaItemsWithAssetId:v7];

  if (!v8)
  {
    v30 = sub_10000CEB0();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1001E9E50(v4, v30);
    }
    goto LABEL_16;
  }
  if (![v8 hasBeenPlayed]) {
    goto LABEL_11;
  }
  uint64_t v9 = [v8 lastPlayedDate];
  if (!v9) {
    goto LABEL_11;
  }
  double v10 = (void *)v9;
  double v11 = [v8 lastPlayedDate];
  float v12 = [v4 datePlaybackTimeUpdated];
  id v13 = [v11 compare:v12];

  if (v13 == (id)-1)
  {
LABEL_11:
    double v25 = sub_10000CEB0();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      [v4 bookmarkTime];
      uint64_t v27 = v26;
      __int16 v28 = [v4 assetID];
      int v37 = 134218242;
      v38 = v27;
      __int16 v39 = 2112;
      v40 = v28;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "BDSNBController Setting bookmark time %f for media item assetDetail %@", (uint8_t *)&v37, 0x16u);
    }
    [v8 setHasBeenPlayed:1];
    double v29 = [v4 datePlaybackTimeUpdated];
    [v8 setLastPlayedDate:v29];

    [v4 bookmarkTime];
    v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v8 setValue:v30 forProperty:MPMediaItemPropertyBookmarkTime withCompletionBlock:0];
LABEL_16:

    goto LABEL_17;
  }
  id v14 = [v8 lastPlayedDate];
  double v15 = [v4 datePlaybackTimeUpdated];
  id v16 = [v14 compare:v15];

  double v17 = sub_10000CEB0();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16 == (id)-1)
  {
    if (v18)
    {
      v31 = [v4 assetID];
      v32 = [v8 lastPlayedDate];
      [v8 bookmarkTime];
      uint64_t v34 = v33;
      v35 = [v4 datePlaybackTimeUpdated];
      [v4 bookmarkTime];
      int v37 = 138413314;
      v38 = v31;
      __int16 v39 = 2112;
      v40 = v32;
      __int16 v41 = 2048;
      uint64_t v42 = v34;
      __int16 v43 = 2112;
      v44 = v35;
      __int16 v45 = 2048;
      uint64_t v46 = v36;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "BDSNBController media item has a newer date. Updating asset:%@. from mediaItem.lastPlayDate: %@ mediaItem.bookmarkTime %f, assetDetail.datePlaybackTimeUpdated:%@ assetDetail.bookmarkTime:%f", (uint8_t *)&v37, 0x34u);
    }
    [(BDSNBController *)self _updateAssetDetail:v4 fromMediaItem:v8];
  }
  else
  {
    if (v18)
    {
      double v19 = [v4 assetID];
      id v20 = [v8 lastPlayedDate];
      [v8 bookmarkTime];
      uint64_t v22 = v21;
      id v23 = [v4 datePlaybackTimeUpdated];
      [v4 bookmarkTime];
      int v37 = 138413314;
      v38 = v19;
      __int16 v39 = 2112;
      v40 = v20;
      __int16 v41 = 2048;
      uint64_t v42 = v22;
      __int16 v43 = 2112;
      v44 = v23;
      __int16 v45 = 2048;
      uint64_t v46 = v24;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "BDSNBController media item has the same date, not updating asset:%@. mediaItem.lastPlayDate: %@ mediaItem.bookmarkTime %f, assetDetail.datePlaybackTimeUpdated:%@ assetDetail.bookmarkTime:%f", (uint8_t *)&v37, 0x34u);
    }
  }
LABEL_17:
}

- (void)_fq_fetchSince:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BDSNBController *)self fetchQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = sub_10000CEB0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BDSNBController fetching changes since cloudSyncVersions: %@", buf, 0xCu);
  }

  double v10 = +[BCCloudAssetManager sharedManager];
  double v11 = [v10 assetDetailManager];

  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100071824;
  v13[3] = &unk_100261DF8;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v7;
  id v14 = v12;
  [v11 getAssetDetailChangesSince:v6 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (BCCloudDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (OS_dispatch_queue)fetchQueue
{
  return self->_fetchQueue;
}

- (void)setFetchQueue:(id)a3
{
}

- (id)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (BOOL)fetching
{
  return self->_fetching;
}

- (void)setFetching:(BOOL)a3
{
  self->_fetching = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end