@interface BDSUbiquityDocumentsObserver
- (BDSICloudIdentityToken)identity;
- (BDSUbiquityDocumentsObserver)init;
- (BDSUbiquityDocumentsObserver)initWithDelegate:(id)a3 ubquityStatusMonitor:(id)a4 directoriesSubpath:(id)a5;
- (BDSUbiquityDocumentsObserverDelegate)delegate;
- (BDSUbiquityStatusMonitor)ubiquityStatusMonitor;
- (NSMetadataQuery)query;
- (NSString)description;
- (NSString)directoriesSubpath;
- (NSURL)containerURL;
- (NSURL)noSyncURL;
- (OS_dispatch_queue)metadataQueryQueue;
- (OS_dispatch_queue)queue;
- (id)_dataURL;
- (id)_documentsURL;
- (id)_identityData;
- (id)_itemsForMetadataItems:(id)a3;
- (id)_noSyncURL;
- (id)_replacementObjectForResultObject:(id)a3;
- (void)documentsURL:(id)a3;
- (void)mq_queryDidFinish:(id)a3;
- (void)mq_queryDidStart:(id)a3;
- (void)mq_queryDidUpdate:(id)a3;
- (void)mq_setupQuery:(id)a3;
- (void)mq_tearDownQuery;
- (void)q_createSubpathDirectories;
- (void)restartQuery;
- (void)setContainerURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectoriesSubpath:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setMetadataQueryQueue:(id)a3;
- (void)setNoSyncURL:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUbiquityStatusMonitor:(id)a3;
- (void)tearDownQuery;
- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4;
@end

@implementation BDSUbiquityDocumentsObserver

- (BDSUbiquityDocumentsObserver)init
{
  return 0;
}

- (BDSUbiquityDocumentsObserver)initWithDelegate:(id)a3 ubquityStatusMonitor:(id)a4 directoriesSubpath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)BDSUbiquityDocumentsObserver;
  v11 = [(BDSUbiquityDocumentsObserver *)&v25 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeWeak((id *)&v12->_ubiquityStatusMonitor, v9);
    objc_storeStrong((id *)&v12->_directoriesSubpath, a5);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.iBooks.BDSUbiquityDocumentsObserver.queue", v13);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.iBooks.BDSUbiquityDocumentsObserver.metadataQueryQueue", v16);
    metadataQueryQueue = v12->_metadataQueryQueue;
    v12->_metadataQueryQueue = (OS_dispatch_queue *)v17;

    [v9 addObserver:v12];
    objc_initWeak(&location, v12);
    v19 = v12->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011770;
    block[3] = &unk_10025F9F8;
    objc_copyWeak(&v23, &location);
    id v22 = v9;
    dispatch_barrier_async(v19, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(BDSUbiquityDocumentsObserver *)self queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100011A48;
  v10[3] = &unk_10025FA20;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  v12 = self;
  id v9 = v6;
  dispatch_barrier_async(v8, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)restartQuery
{
  v3 = sub_10000D100();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BDSUbiquityDocumentsObserver: Starting new metadata query", buf, 2u);
  }

  [(BDSUbiquityDocumentsObserver *)self tearDownQuery];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100011C98;
  v4[3] = &unk_10025F9B0;
  v4[4] = self;
  [(BDSUbiquityDocumentsObserver *)self documentsURL:v4];
}

- (void)tearDownQuery
{
  v3 = [(BDSUbiquityDocumentsObserver *)self metadataQueryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011F8C;
  block[3] = &unk_10025F700;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (BDSICloudIdentityToken)identity
{
  identity = self->_identity;
  if (!identity)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquityStatusMonitor);
    v5 = [WeakRetained ubiquityIdentityToken];
    id v6 = self->_identity;
    self->_identity = v5;

    identity = self->_identity;
  }
  return identity;
}

- (void)documentsURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(BDSUbiquityDocumentsObserver *)self queue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000120A8;
    v6[3] = &unk_10025FA48;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)mq_setupQuery:(id)a3
{
  id v4 = a3;
  v5 = [(BDSUbiquityDocumentsObserver *)self metadataQueryQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_10000D100();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1001E426C();
  }

  [(BDSUbiquityDocumentsObserver *)self setQuery:v4];
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"mq_queryDidStart:" name:NSMetadataQueryDidStartGatheringNotification object:v4];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"mq_queryDidFinish:" name:NSMetadataQueryDidFinishGatheringNotification object:v4];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"mq_queryDidUpdate:" name:NSMetadataQueryDidUpdateNotification object:v4];

  [v4 enableUpdates];
  id v10 = sub_10000D100();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BDSUbiquityDocumentsObserver: Starting metadata query: %@", (uint8_t *)&v11, 0xCu);
  }

  [v4 startQuery];
}

- (void)mq_tearDownQuery
{
  v3 = [(BDSUbiquityDocumentsObserver *)self metadataQueryQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BDSUbiquityDocumentsObserver *)self query];
  if (v4)
  {
    v5 = sub_10000D100();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1001E42A0();
    }

    [v4 stopQuery];
    [(BDSUbiquityDocumentsObserver *)self setQuery:0];
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:NSMetadataQueryDidStartGatheringNotification object:v4];

    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:NSMetadataQueryDidFinishGatheringNotification object:v4];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self name:NSMetadataQueryDidUpdateNotification object:v4];
  }
}

- (void)mq_queryDidStart:(id)a3
{
  v3 = sub_10000D100();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BDSUbiquityDocumentsObserver: Metadata query did start", v4, 2u);
  }
}

- (void)mq_queryDidFinish:(id)a3
{
  id v4 = sub_10000D100();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BDSUbiquityDocumentsObserver: Metadata query did finish", buf, 2u);
  }

  v5 = [(BDSUbiquityDocumentsObserver *)self query];
  [v5 disableUpdates];

  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [(BDSUbiquityDocumentsObserver *)self query];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_10001262C;
  v16 = &unk_10025FA70;
  id v8 = v6;
  id v17 = v8;
  v18 = self;
  [v7 enumerateResultsUsingBlock:&v13];

  id v9 = sub_10000D100();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count", v13, v14, v15, v16));
    *(_DWORD *)buf = 138412290;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Found %@ downloaded items", buf, 0xCu);
  }
  int v11 = [(BDSUbiquityDocumentsObserver *)self delegate];
  [v11 ubiquityDocumentsObserver:self didLoadWithItems:v8];

  id v12 = [(BDSUbiquityDocumentsObserver *)self query];
  [v12 enableUpdates];
}

- (void)mq_queryDidUpdate:(id)a3
{
  id v11 = [a3 userInfo];
  id v4 = [v11 objectForKeyedSubscript:NSMetadataQueryUpdateAddedItemsKey];
  v5 = [(BDSUbiquityDocumentsObserver *)self _itemsForMetadataItems:v4];

  id v6 = [v11 objectForKeyedSubscript:NSMetadataQueryUpdateChangedItemsKey];
  id v7 = [(BDSUbiquityDocumentsObserver *)self _itemsForMetadataItems:v6];

  id v8 = [v11 objectForKeyedSubscript:NSMetadataQueryUpdateRemovedItemsKey];
  id v9 = [(BDSUbiquityDocumentsObserver *)self _itemsForMetadataItems:v8];

  id v10 = [(BDSUbiquityDocumentsObserver *)self delegate];
  if ([v5 count]) {
    [v10 ubiquityDocumentsObserver:self itemsDidBecomeAvailable:v5];
  }
  if ([v9 count]) {
    [v10 ubiquityDocumentsObserver:self itemsDidBecomeUnavailable:v9];
  }
  if ([v7 count]) {
    [v10 ubiquityDocumentsObserver:self itemsDidChange:v7];
  }
}

- (id)_identityData
{
  v2 = [(BDSUbiquityDocumentsObserver *)self identity];
  if (v2)
  {
    v3 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_documentsURL
{
  v3 = [(BDSUbiquityDocumentsObserver *)self containerURL];
  id v4 = [v3 URLByAppendingPathComponent:@"Documents"];

  v5 = [(BDSUbiquityDocumentsObserver *)self directoriesSubpath];

  if (v5)
  {
    id v6 = [(BDSUbiquityDocumentsObserver *)self directoriesSubpath];
    uint64_t v7 = [v4 URLByAppendingPathComponent:v6];

    id v4 = (void *)v7;
  }
  return v4;
}

- (id)_dataURL
{
  v3 = [(BDSUbiquityDocumentsObserver *)self containerURL];
  id v4 = [v3 URLByAppendingPathComponent:@"Data"];

  v5 = [(BDSUbiquityDocumentsObserver *)self directoriesSubpath];

  if (v5)
  {
    id v6 = [(BDSUbiquityDocumentsObserver *)self directoriesSubpath];
    uint64_t v7 = [v4 URLByAppendingPathComponent:v6];

    id v4 = (void *)v7;
  }
  return v4;
}

- (id)_noSyncURL
{
  noSyncURL = self->_noSyncURL;
  if (!noSyncURL)
  {
    id v4 = [(BDSUbiquityDocumentsObserver *)self containerURL];
    v5 = v4;
    if (v4)
    {
      id v6 = [v4 URLByAppendingPathComponent:@"metadata.nosync"];
      uint64_t v7 = +[NSFileManager defaultManager];
      id v8 = [v6 path];
      unsigned __int8 v9 = [v7 fileExistsAtPath:v8];

      if (v9)
      {
        id v10 = sub_10000D100();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1001E42D4();
        }

        id v11 = v6;
        id v12 = self->_noSyncURL;
        self->_noSyncURL = v11;
      }
      else
      {
        id v22 = 0;
        unsigned int v13 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:0 attributes:0 error:&v22];
        id v12 = (NSURL *)v22;
        uint64_t v14 = sub_10000D100();
        v15 = (NSURL *)v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            sub_1001E4308();
          }

          v16 = v6;
          v15 = self->_noSyncURL;
          self->_noSyncURL = v16;
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          sub_1001E433C();
        }
      }
    }

    noSyncURL = self->_noSyncURL;
  }
  id v17 = noSyncURL;
  v18 = [(BDSUbiquityDocumentsObserver *)self directoriesSubpath];

  if (v18)
  {
    v19 = [(BDSUbiquityDocumentsObserver *)self directoriesSubpath];
    uint64_t v20 = [(NSURL *)v17 URLByAppendingPathComponent:v19];

    id v17 = (NSURL *)v20;
  }
  return v17;
}

- (void)q_createSubpathDirectories
{
  v3 = [(BDSUbiquityDocumentsObserver *)self _documentsURL];
  id v4 = [(BDSUbiquityDocumentsObserver *)self _dataURL];
  v5 = [(BDSUbiquityDocumentsObserver *)self _noSyncURL];
  +[NSFileManager defaultManager];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100012CF0;
  v8[3] = &unk_10025FA98;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v6;
  id v10 = v11;
  uint64_t v7 = objc_retainBlock(v8);
  ((void (*)(void *, void *))v7[2])(v7, v3);
  ((void (*)(void *, void *))v7[2])(v7, v4);
  ((void (*)(void *, void *))v7[2])(v7, v5);

  _Block_object_dispose(v11, 8);
}

- (id)_itemsForMetadataItems:(id)a3
{
  id v4 = a3;
  +[NSMutableArray array];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100012EA4;
  id v11 = &unk_10025FA70;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v13 = self;
  id v5 = v12;
  [v4 enumerateObjectsUsingBlock:&v8];

  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return v6;
}

- (id)_replacementObjectForResultObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 valueForAttribute:NSMetadataItemURLKey];
  [v4 setUrl:v5];

  id v6 = [v3 valueForAttribute:NSMetadataUbiquitousItemDownloadingStatusKey];
  if ([v6 isEqualToString:NSMetadataUbiquitousItemDownloadingStatusCurrent]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = (uint64_t)[v6 isEqualToString:NSMetadataUbiquitousItemDownloadingStatusDownloaded];
  }
  id v8 = [v6 isEqualToString:NSMetadataUbiquitousItemDownloadingStatusNotDownloaded];
  [v4 setIsLocal:v7];
  [v4 setIsNotLocal:v8];
  if ((v7 & 1) != 0 || !v8)
  {
    [v4 setIsDownloading:0];
  }
  else
  {
    uint64_t v9 = [v3 valueForAttribute:NSMetadataUbiquitousItemIsDownloadingKey];
    id v10 = [v9 BOOLValue];

    [v4 setIsDownloading:v10];
    if (v10)
    {
      id v11 = [v3 valueForAttribute:NSMetadataUbiquitousItemPercentDownloadedKey];
      [v4 setDownloadingPercent:v11];
    }
  }
  id v12 = [v3 valueForAttribute:NSMetadataUbiquitousItemUploadingErrorKey];
  unsigned int v13 = [v3 valueForAttribute:NSMetadataUbiquitousItemIsUploadingKey];
  uint64_t v14 = [v3 valueForAttribute:NSMetadataUbiquitousItemIsUploadedKey];
  if (![v13 BOOLValue] || v12)
  {
    if ([v14 BOOLValue]) {
      [v4 setIsUploaded:1];
    }
    else {
      [v4 setUploadingError:v12];
    }
  }
  else
  {
    [v4 setIsUploading:1];
    v15 = [v3 valueForAttribute:NSMetadataUbiquitousItemPercentUploadedKey];
    [v4 setUploadingPercent:v15];
  }
  objc_opt_class();
  v16 = [v3 valueForAttribute:@"kMDItemFSContentChangeDate"];
  id v17 = BUDynamicCast();
  [v4 setContentChangedDate:v17];

  objc_opt_class();
  v18 = [v3 valueForAttribute:@"kMDItemFSCreationDate"];
  v19 = BUDynamicCast();
  [v4 setContentCreationDate:v19];

  objc_opt_class();
  uint64_t v20 = [v3 valueForAttribute:@"kMDItemFSSize"];
  v21 = BUDynamicCast();
  [v4 setContentFileSize:v21];

  id v22 = [v3 valueForAttribute:NSMetadataUbiquitousItemHasUnresolvedConflictsKey];
  [v4 setUnresolvedConflict:v22];

  return v4;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(BDSUbiquityDocumentsObserver *)self identity];
  id v6 = [(BDSUbiquityDocumentsObserver *)self containerURL];
  uint64_t v7 = [(BDSUbiquityDocumentsObserver *)self noSyncURL];
  id v8 = [(BDSUbiquityDocumentsObserver *)self ubiquityStatusMonitor];
  uint64_t v9 = +[NSString stringWithFormat:@"<%@(%p) identity='%@' containerURL='%@' noSyncURL='%@'>\n\tubiquityStatusMonitor = %@", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BDSUbiquityDocumentsObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BDSUbiquityDocumentsObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)directoriesSubpath
{
  return self->_directoriesSubpath;
}

- (void)setDirectoriesSubpath:(id)a3
{
}

- (BDSUbiquityStatusMonitor)ubiquityStatusMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquityStatusMonitor);
  return (BDSUbiquityStatusMonitor *)WeakRetained;
}

- (void)setUbiquityStatusMonitor:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)metadataQueryQueue
{
  return self->_metadataQueryQueue;
}

- (void)setMetadataQueryQueue:(id)a3
{
}

- (NSMetadataQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void)setIdentity:(id)a3
{
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (void)setContainerURL:(id)a3
{
}

- (NSURL)noSyncURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNoSyncURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noSyncURL, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_metadataQueryQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_ubiquityStatusMonitor);
  objc_storeStrong((id *)&self->_directoriesSubpath, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end