@interface GEOAPStorage
- (GEOAPStorage)init;
- (id)_copyAndEmptyBatchQueue;
- (void)_clearUploadTimer;
- (void)_fastTrackElement:(id)a3 withBatchID:(unint64_t)a4 completionQueue:(id)a5 completionBlock:(id)a6;
- (void)_flushBatchQueueToDB;
- (void)_flushRemainderToDB;
- (void)_initiateCollationAndUpload;
- (void)_setUploadTimer;
- (void)_spoolElementsToDBFromQueue:(id)a3;
- (void)_storeQueueElem:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5;
@end

@implementation GEOAPStorage

- (void)_fastTrackElement:(id)a3 withBatchID:(unint64_t)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  v11 = a5;
  id v12 = a6;
  storageQueue = self->_storageQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003234;
  v15[3] = &unk_100028C10;
  unint64_t v17 = a4;
  id v14 = v10;
  id v16 = v14;
  dispatch_async(storageQueue, v15);
  if (v12)
  {
    if (!v11)
    {
      v11 = dispatch_get_global_queue(21, 0);
    }
    dispatch_async(v11, v12);
  }
}

- (void)_storeQueueElem:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  v11 = +[GEOAPPersistence sharedInstance];
  unsigned int v12 = [v11 evalModeEnabled];

  if (v12)
  {
    id v20 = v8;
    v13 = +[NSArray arrayWithObjects:&v20 count:1];
    [(GEOAPStorage *)self _spoolElementsToDBFromQueue:v13];
  }
  else
  {
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_100005050;
    unint64_t v17 = &unk_100029238;
    v18 = self;
    id v19 = v8;
    geo_isolate_sync();
  }
  [(GEOAPStorage *)self _setUploadTimer];
  if (v10)
  {
    if (!v9)
    {
      v9 = dispatch_get_global_queue(21, 0);
    }
    dispatch_async(v9, v10);
  }
}

- (void)_setUploadTimer
{
  dispatch_time_t v3 = dispatch_time(0, 1000000000 * self->_batchQueueFlushTime);
  uploadTimer = self->_uploadTimer;
  dispatch_source_set_timer(uploadTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (GEOAPStorage)init
{
  v20.receiver = self;
  v20.super_class = (Class)GEOAPStorage;
  id v2 = [(GEOAPStorage *)&v20 init];
  if (v2)
  {
    dispatch_time_t v3 = +[GEOPlatform sharedPlatform];
    *((unsigned char *)v2 + 57) = [v3 isInternalInstall];

    *((unsigned char *)v2 + 56) = 0;
    *((void *)v2 + 2) = GEOConfigGetUInteger();
    *((void *)v2 + 3) = GEOConfigGetUInteger();
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)v2 + 2)];
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    uint64_t v6 = geo_isolater_create();
    v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    uint64_t v8 = geo_dispatch_queue_create_with_qos();
    v9 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v8;

    if (*((unsigned char *)v2 + 57))
    {
      uint64_t v10 = geo_isolater_create();
      v11 = (void *)*((void *)v2 + 9);
      *((void *)v2 + 9) = v10;

      id v12 = objc_alloc_init((Class)NSMutableSet);
      v13 = (void *)*((void *)v2 + 8);
      *((void *)v2 + 8) = v12;
    }
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 6));
    uint64_t v15 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v14;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 5), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    id v16 = *((void *)v2 + 5);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100017968;
    handler[3] = &unk_1000288E8;
    id v19 = v2;
    dispatch_source_set_event_handler(v16, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 5));
  }
  return (GEOAPStorage *)v2;
}

- (void)_flushRemainderToDB
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageQueue);
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100017E4C;
  v11 = sub_100017E5C;
  id v12 = 0;
  uint64_t v6 = self;
  geo_isolate_sync();
  if (v8[5])
  {
    dispatch_time_t v3 = sub_100004B10();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = objc_msgSend((id)v8[5], "count", _NSConcreteStackBlock, 3221225472, sub_100017E64, &unk_100029580, v6, &v7);
      *(_DWORD *)buf = 134217984;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "will persist %lu analytics", buf, 0xCu);
    }

    v5 = +[GEOAPPersistence sharedInstance];
    [v5 storeLogMsgElems:v8[5]];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)_flushBatchQueueToDB
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = sub_100017E4C;
  uint64_t v8 = sub_100017E5C;
  id v9 = 0;
  geo_isolate_sync();
  -[GEOAPStorage _spoolElementsToDBFromQueue:](self, "_spoolElementsToDBFromQueue:", v5[5], _NSConcreteStackBlock, 3221225472, sub_100017FA0, &unk_100029580, self, &v4);
  _Block_object_dispose(&v4, 8);
}

- (void)_clearUploadTimer
{
}

- (id)_copyAndEmptyBatchQueue
{
  geo_assert_isolated();
  id v3 = [(NSMutableArray *)self->_batchQueue copy];
  [(NSMutableArray *)self->_batchQueue removeAllObjects];
  return v3;
}

- (void)_spoolElementsToDBFromQueue:(id)a3
{
  id v4 = a3;
  storageQueue = self->_storageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019B20;
  block[3] = &unk_1000288E8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(storageQueue, block);
}

- (void)_initiateCollationAndUpload
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageQueue);
  id v2 = +[GEOAPPersistence sharedInstance];
  id v3 = [v2 selectBatchIdsForBatchUpload];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v8) unsignedLongLongValue];
        if (GEOMightHaveCorrespondingReqRespMetadata())
        {
          uint64_t v10 = +[GEOAnalyticsDataService sharedService];
          id v11 = [v10 requestResponseMetadataFileDescriptorForBatchID:v9];

          if ((v11 & 0x80000000) == 0)
          {
            id v12 = [objc_alloc((Class)GEORequestResponseMetadataFile) initForReadWithFileDescriptor:v11];
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472;
            v14[2] = sub_100019DE0;
            v14[3] = &unk_1000295C8;
            v14[4] = v9;
            objc_msgSend(v12, "unsafe_readReqRespMetadataWithVisitorBlock:", v14);
          }
        }
        v13 = sub_100005544();
        sub_10000524C((uint64_t)v13, (uint64_t)v9);

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evalObserversLock, 0);
  objc_storeStrong((id *)&self->_evalObservers, 0);
  objc_storeStrong((id *)&self->_storageQueue, 0);
  objc_storeStrong((id *)&self->_uploadTimer, 0);
  objc_storeStrong((id *)&self->_batchQueueLock, 0);
  objc_storeStrong((id *)&self->_batchQueue, 0);
}

@end