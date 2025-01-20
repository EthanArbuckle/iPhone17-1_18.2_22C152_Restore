@interface BDSUbiquityManager
- (BDSUbiquityDocumentsObserver)ubiquityDocumentsObserver;
- (BDSUbiquityManager)init;
- (BDSUbiquityManagerObserver)observer;
- (BDSUbiquityStatusMonitor)ubiquityStatusMonitor;
- (BOOL)initialGatherSentAtleastOnce;
- (BOOL)isEnabled;
- (BOOL)ubiquityObservingEnabled;
- (NSMutableDictionary)iq_urlFromAssetID;
- (OS_dispatch_queue)ivarQueue;
- (OS_dispatch_queue)observerCallbackQueue;
- (OS_dispatch_queue)processMetadataQueryQueue;
- (id)_buildUbiquityMetadataDict:(id)a3;
- (id)_fileExtensionForUrl:(id)a3;
- (id)_ubiquityMetadataForURL:(id)a3;
- (id)allAssetIDs;
- (id)ubiquityMetadataForAssetID:(id)a3;
- (void)_setValueInMutableDictionary:(id)a3 forKey:(id)a4 withValueForExtendedAttributeNamed:(id)a5 fromUrl:(id)a6;
- (void)dealloc;
- (void)iq_clearCachesForAssetIDs:(id)a3 notify:(BOOL)a4;
- (void)iq_clearCachesForURLs:(id)a3 notify:(BOOL)a4;
- (void)iq_setupUbiquityObservers;
- (void)iq_teardownUbiquityObservers;
- (void)iq_updateCachesForItems:(id)a3 notify:(BOOL)a4;
- (void)mq_batchOfItemsDidBecomeAvailable:(id)a3 block:(BOOL)a4 notify:(BOOL)a5;
- (void)mq_batchOfItemsDidBecomeUnAvailable:(id)a3 block:(BOOL)a4 notify:(BOOL)a5;
- (void)mq_batchOfItemsDidChange:(id)a3 block:(BOOL)a4 notify:(BOOL)a5;
- (void)mq_itemsDidBecomeAvailable:(id)a3 block:(BOOL)a4 notify:(BOOL)a5;
- (void)mq_itemsDidBecomeUnavailable:(id)a3 block:(BOOL)a4 notify:(BOOL)a5;
- (void)mq_itemsDidChange:(id)a3 block:(BOOL)a4 notify:(BOOL)a5;
- (void)setEnableUbiquityObserving:(BOOL)a3;
- (void)setInitialGatherSentAtleastOnce:(BOOL)a3;
- (void)setIq_urlFromAssetID:(id)a3;
- (void)setIvarQueue:(id)a3;
- (void)setObserver:(id)a3;
- (void)setObserverCallbackQueue:(id)a3;
- (void)setProcessMetadataQueryQueue:(id)a3;
- (void)setUbiquityDocumentsObserver:(id)a3;
- (void)setUbiquityObservingEnabled:(BOOL)a3;
- (void)setUbiquityStatusMonitor:(id)a3;
- (void)ubiquityDocumentsObserver:(id)a3 didLoadWithItems:(id)a4;
- (void)ubiquityDocumentsObserver:(id)a3 itemsDidBecomeAvailable:(id)a4;
- (void)ubiquityDocumentsObserver:(id)a3 itemsDidBecomeUnavailable:(id)a4;
- (void)ubiquityDocumentsObserver:(id)a3 itemsDidChange:(id)a4;
- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4;
@end

@implementation BDSUbiquityManager

- (BDSUbiquityManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)BDSUbiquityManager;
  v2 = [(BDSUbiquityManager *)&v15 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    iq_urlFromAssetID = v2->_iq_urlFromAssetID;
    v2->_iq_urlFromAssetID = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("ubiquityManager-ivarQueue", v5);
    ivarQueue = v2->_ivarQueue;
    v2->_ivarQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("BDSUbiquityManager-observerQueue", v8);
    observerCallbackQueue = v2->_observerCallbackQueue;
    v2->_observerCallbackQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("BDSUbiquityManager-processMetadataQueryQueue", v11);
    processMetadataQueryQueue = v2->_processMetadataQueryQueue;
    v2->_processMetadataQueryQueue = (OS_dispatch_queue *)v12;
  }
  return v2;
}

- (void)setEnableUbiquityObserving:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_10000D100();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BDSUbiquityManager: setEnableUbiquityObserving: %@", buf, 0xCu);
  }

  v7 = [(BDSUbiquityManager *)self ivarQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001492C;
  v8[3] = &unk_10025FB10;
  v8[4] = self;
  BOOL v9 = v3;
  dispatch_async(v7, v8);
}

- (BOOL)isEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(BDSUbiquityManager *)self ivarQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014C30;
  v5[3] = &unk_10025F960;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)dealloc
{
  [(BDSUbiquityManager *)self iq_teardownUbiquityObservers];
  v3.receiver = self;
  v3.super_class = (Class)BDSUbiquityManager;
  [(BDSUbiquityManager *)&v3 dealloc];
}

- (id)allAssetIDs
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100014DC8;
  CFStringRef v11 = sub_100014DD8;
  id v12 = 0;
  objc_super v3 = [(BDSUbiquityManager *)self ivarQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014DE0;
  v6[3] = &unk_10025F960;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)ubiquityMetadataForAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = sub_100014DC8;
  v16 = sub_100014DD8;
  id v17 = 0;
  v5 = [(BDSUbiquityManager *)self ivarQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014FA4;
  block[3] = &unk_10025FB38;
  CFStringRef v11 = &v12;
  block[4] = self;
  id v6 = v4;
  id v10 = v6;
  dispatch_sync(v5, block);

  if (v13[5])
  {
    uint64_t v7 = -[BDSUbiquityManager _ubiquityMetadataForURL:](self, "_ubiquityMetadataForURL:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_10000D100();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BDSUbiquityManager: ubiquityStatusChangedToAvailableWithNewIdentity: %{public}@ oldIdentity: %{public}@", buf, 0x16u);
  }

  uint64_t v9 = [(BDSUbiquityManager *)self ivarQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015148;
  block[3] = &unk_10025F700;
  block[4] = self;
  dispatch_sync(v9, block);
}

- (void)ubiquityDocumentsObserver:(id)a3 didLoadWithItems:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  processMetadataQueryQueue = self->_processMetadataQueryQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001530C;
  v8[3] = &unk_10025FA20;
  objc_copyWeak(&v11, &location);
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)processMetadataQueryQueue, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)ubiquityDocumentsObserver:(id)a3 itemsDidBecomeAvailable:(id)a4
{
  id v5 = a4;
  processMetadataQueryQueue = self->_processMetadataQueryQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015938;
  v8[3] = &unk_10025F988;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)processMetadataQueryQueue, v8);
}

- (void)ubiquityDocumentsObserver:(id)a3 itemsDidBecomeUnavailable:(id)a4
{
  id v5 = a4;
  processMetadataQueryQueue = self->_processMetadataQueryQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015A8C;
  v8[3] = &unk_10025F988;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)processMetadataQueryQueue, v8);
}

- (void)ubiquityDocumentsObserver:(id)a3 itemsDidChange:(id)a4
{
  id v5 = a4;
  processMetadataQueryQueue = self->_processMetadataQueryQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015C00;
  v8[3] = &unk_10025F988;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)processMetadataQueryQueue, v8);
}

- (void)iq_setupUbiquityObservers
{
  objc_super v3 = objc_alloc_init(BDSUbiquityStatusMonitor);
  ubiquityStatusMonitor = self->_ubiquityStatusMonitor;
  self->_ubiquityStatusMonitor = v3;

  [(BDSUbiquityStatusMonitor *)self->_ubiquityStatusMonitor addObserver:self];
  self->_ubiquityDocumentsObserver = [[BDSUbiquityDocumentsObserver alloc] initWithDelegate:self ubquityStatusMonitor:self->_ubiquityStatusMonitor directoriesSubpath:0];
  _objc_release_x1();
}

- (void)iq_teardownUbiquityObservers
{
  ubiquityStatusMonitor = self->_ubiquityStatusMonitor;
  self->_ubiquityStatusMonitor = 0;

  ubiquityDocumentsObserver = self->_ubiquityDocumentsObserver;
  self->_ubiquityDocumentsObserver = 0;
}

- (void)mq_itemsDidBecomeAvailable:(id)a3 block:(BOOL)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processMetadataQueryQueue);
  id v8 = [v15 count];
  if (v8)
  {
    unint64_t v9 = (unint64_t)v8;
    unint64_t v10 = 0;
    unint64_t v11 = (unint64_t)v8;
    do
    {
      unint64_t v12 = v11 - 64;
      if (v11 >= 0x40) {
        uint64_t v13 = 64;
      }
      else {
        uint64_t v13 = v11;
      }
      id v14 = objc_msgSend(v15, "subarrayWithRange:", v10, v13);
      [(BDSUbiquityManager *)self mq_batchOfItemsDidBecomeAvailable:v14 block:v6 notify:v5];

      v10 += 64;
      unint64_t v11 = v12;
    }
    while (v10 < v9);
  }
}

- (void)mq_batchOfItemsDidBecomeAvailable:(id)a3 block:(BOOL)a4 notify:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unint64_t v9 = v8;
  ivarQueue = self->_ivarQueue;
  if (v6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015F6C;
    block[3] = &unk_10025FB88;
    block[4] = self;
    unint64_t v11 = &v16;
    id v16 = v8;
    BOOL v17 = a5;
    dispatch_sync((dispatch_queue_t)ivarQueue, block);
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100015F7C;
    v12[3] = &unk_10025FB88;
    v12[4] = self;
    unint64_t v11 = &v13;
    id v13 = v8;
    BOOL v14 = a5;
    dispatch_async((dispatch_queue_t)ivarQueue, v12);
  }
}

- (void)mq_itemsDidBecomeUnavailable:(id)a3 block:(BOOL)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processMetadataQueryQueue);
  id v8 = [v15 count];
  if (v8)
  {
    unint64_t v9 = (unint64_t)v8;
    unint64_t v10 = 0;
    unint64_t v11 = (unint64_t)v8;
    do
    {
      unint64_t v12 = v11 - 64;
      if (v11 >= 0x40) {
        uint64_t v13 = 64;
      }
      else {
        uint64_t v13 = v11;
      }
      BOOL v14 = objc_msgSend(v15, "subarrayWithRange:", v10, v13);
      [(BDSUbiquityManager *)self mq_batchOfItemsDidBecomeUnAvailable:v14 block:v6 notify:v5];

      v10 += 64;
      unint64_t v11 = v12;
    }
    while (v10 < v9);
  }
}

- (void)mq_batchOfItemsDidBecomeUnAvailable:(id)a3 block:(BOOL)a4 notify:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unint64_t v9 = v8;
  ivarQueue = self->_ivarQueue;
  if (v6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016180;
    block[3] = &unk_10025FB88;
    block[4] = self;
    unint64_t v11 = &v16;
    id v16 = v8;
    BOOL v17 = a5;
    dispatch_sync((dispatch_queue_t)ivarQueue, block);
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100016190;
    v12[3] = &unk_10025FB88;
    v12[4] = self;
    unint64_t v11 = &v13;
    id v13 = v8;
    BOOL v14 = a5;
    dispatch_async((dispatch_queue_t)ivarQueue, v12);
  }
}

- (void)mq_itemsDidChange:(id)a3 block:(BOOL)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  unint64_t v9 = sub_10000D100();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134217984;
    id v18 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BDSUbiquityManager: mq_itemsDidChange: count: %lu", (uint8_t *)&v17, 0xCu);
  }

  id v10 = [v8 count];
  if (v10)
  {
    unint64_t v11 = (unint64_t)v10;
    unint64_t v12 = 0;
    unint64_t v13 = (unint64_t)v10;
    do
    {
      unint64_t v14 = v13 - 64;
      if (v13 >= 0x40) {
        uint64_t v15 = 64;
      }
      else {
        uint64_t v15 = v13;
      }
      id v16 = objc_msgSend(v8, "subarrayWithRange:", v12, v15);
      [(BDSUbiquityManager *)self mq_batchOfItemsDidChange:v16 block:v6 notify:v5];

      v12 += 64;
      unint64_t v13 = v14;
    }
    while (v12 < v11);
  }
}

- (void)mq_batchOfItemsDidChange:(id)a3 block:(BOOL)a4 notify:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processMetadataQueryQueue);
  ivarQueue = self->_ivarQueue;
  if (v6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016408;
    block[3] = &unk_10025FB88;
    id v10 = &v17;
    block[4] = self;
    id v17 = v8;
    BOOL v18 = a5;
    id v11 = v8;
    dispatch_sync((dispatch_queue_t)ivarQueue, block);
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100016418;
    v13[3] = &unk_10025FB88;
    id v10 = &v14;
    v13[4] = self;
    id v14 = v8;
    BOOL v15 = a5;
    id v12 = v8;
    dispatch_async((dispatch_queue_t)ivarQueue, v13);
  }
}

- (void)iq_updateCachesForItems:(id)a3 notify:(BOOL)a4
{
  BOOL v21 = a4;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  BOOL v6 = sub_10000D100();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v33 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BDSUbiquityManager: updating cache for %lu items", buf, 0xCu);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v12 = [v11 url];
        unint64_t v13 = [(BDSUbiquityManager *)self _ubiquityMetadataForURL:v12];

        id v14 = [v13 objectForKeyedSubscript:@"com.apple.iBooks.assetID"];
        BOOL v15 = [v13 objectForKeyedSubscript:@"com.apple.iBooks.isSupplementalContent"];
        unsigned __int8 v16 = [v15 BOOLValue];

        if ((v16 & 1) == 0)
        {
          if (v14)
          {
            id v17 = [(NSMutableDictionary *)self->_iq_urlFromAssetID objectForKey:v14];

            BOOL v18 = [v11 url];
            [(NSMutableDictionary *)self->_iq_urlFromAssetID setObject:v18 forKeyedSubscript:v14];

            if (v21)
            {
              v19 = [(BDSUbiquityManager *)self observer];

              if (v19)
              {
                observerCallbackQueue = self->_observerCallbackQueue;
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                block[2] = sub_100016700;
                block[3] = &unk_10025FBB0;
                BOOL v26 = v17 == 0;
                block[4] = self;
                id v24 = v14;
                id v25 = v13;
                dispatch_async((dispatch_queue_t)observerCallbackQueue, block);
              }
            }
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }
}

- (void)iq_clearCachesForURLs:(id)a3 notify:(BOOL)a4
{
  BOOL v16 = a4;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  id v17 = v5;
  BOOL v6 = +[NSSet setWithArray:v5];
  id v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [(BDSUbiquityManager *)self iq_urlFromAssetID];
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v12);
        id v14 = [(BDSUbiquityManager *)self iq_urlFromAssetID];
        BOOL v15 = [v14 objectForKeyedSubscript:v13];

        if ([v6 containsObject:v15]) {
          [v7 addObject:v13];
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if ([v7 count]) {
    [(BDSUbiquityManager *)self iq_clearCachesForAssetIDs:v7 notify:v16];
  }
}

- (void)iq_clearCachesForAssetIDs:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [(NSMutableDictionary *)self->_iq_urlFromAssetID objectForKey:v12];

        if (v13)
        {
          [(NSMutableDictionary *)self->_iq_urlFromAssetID setObject:0 forKeyedSubscript:v12];
          if (v4)
          {
            id v14 = [(BDSUbiquityManager *)self observer];

            if (v14)
            {
              observerCallbackQueue = self->_observerCallbackQueue;
              v16[0] = _NSConcreteStackBlock;
              v16[1] = 3221225472;
              v16[2] = sub_100016AD0;
              v16[3] = &unk_10025F988;
              v16[4] = self;
              v16[5] = v12;
              dispatch_async((dispatch_queue_t)observerCallbackQueue, v16);
            }
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (id)_ubiquityMetadataForURL:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100014DC8;
  BOOL v15 = sub_100014DD8;
  id v16 = 0;
  id v5 = objc_opt_new();
  v9[5] = &v11;
  id v10 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100016C70;
  v9[3] = &unk_10025FBD8;
  v9[4] = self;
  [v5 coordinateReadingItemAtURL:v4 options:4 error:&v10 byAccessor:v9];
  id v6 = v10;

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (id)_buildUbiquityMetadataDict:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(BDSUbiquityManager *)self _fileExtensionForUrl:v4];
  [v5 setObject:v4 forKeyedSubscript:@"com.apple.iBooks.url"];
  [v5 setObject:@"SideloadedUbiquity" forKeyedSubscript:@"com.apple.iBooks.cloudAssetType"];
  id v7 = sub_100068B30(v6);
  [v5 setObject:v7 forKeyedSubscript:@"com.apple.iBooks.libraryAssetType"];

  [(BDSUbiquityManager *)self _setValueInMutableDictionary:v5 forKey:@"com.apple.iBooks.assetID" withValueForExtendedAttributeNamed:@"com.apple.iBooks.assetID" fromUrl:v4];
  [(BDSUbiquityManager *)self _setValueInMutableDictionary:v5 forKey:@"com.apple.iBooks.title" withValueForExtendedAttributeNamed:@"com.apple.iBooks.title" fromUrl:v4];
  [(BDSUbiquityManager *)self _setValueInMutableDictionary:v5 forKey:@"com.apple.iBooks.isSupplementalContent" withValueForExtendedAttributeNamed:@"com.apple.iBooks.isSupplementalContent" fromUrl:v4];

  return v5;
}

- (id)_fileExtensionForUrl:(id)a3
{
  id v3 = a3;
  id v4 = [v3 absoluteString];
  id v5 = [v4 componentsSeparatedByString:@"."];
  id v6 = [v5 lastObject];
  if ([(__CFString *)v6 isEqualToString:@"icloud"])
  {
    if ((unint64_t)[v5 count] < 2)
    {
      id v8 = sub_10000D100();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1001E440C((uint64_t)v3, v8);
      }

      id v6 = &stru_10026BED0;
    }
    else
    {
      uint64_t v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", (char *)objc_msgSend(v5, "count") - 2);

      id v6 = (__CFString *)v7;
    }
  }

  return v6;
}

- (void)_setValueInMutableDictionary:(id)a3 forKey:(id)a4 withValueForExtendedAttributeNamed:(id)a5 fromUrl:(id)a6
{
  id v11 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(a6, "bu_extendedAttributeNamed:iCloudSyncable:", a5, 1);
  if (v10) {
    [v11 setObject:v10 forKey:v9];
  }
}

- (BDSUbiquityManagerObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (BDSUbiquityManagerObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (OS_dispatch_queue)observerCallbackQueue
{
  return self->_observerCallbackQueue;
}

- (void)setObserverCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

- (void)setIvarQueue:(id)a3
{
}

- (OS_dispatch_queue)processMetadataQueryQueue
{
  return self->_processMetadataQueryQueue;
}

- (void)setProcessMetadataQueryQueue:(id)a3
{
}

- (BOOL)ubiquityObservingEnabled
{
  return self->_ubiquityObservingEnabled;
}

- (void)setUbiquityObservingEnabled:(BOOL)a3
{
  self->_ubiquityObservingEnabled = a3;
}

- (BOOL)initialGatherSentAtleastOnce
{
  return self->_initialGatherSentAtleastOnce;
}

- (void)setInitialGatherSentAtleastOnce:(BOOL)a3
{
  self->_initialGatherSentAtleastOnce = a3;
}

- (NSMutableDictionary)iq_urlFromAssetID
{
  return self->_iq_urlFromAssetID;
}

- (void)setIq_urlFromAssetID:(id)a3
{
}

- (BDSUbiquityDocumentsObserver)ubiquityDocumentsObserver
{
  return self->_ubiquityDocumentsObserver;
}

- (void)setUbiquityDocumentsObserver:(id)a3
{
}

- (BDSUbiquityStatusMonitor)ubiquityStatusMonitor
{
  return self->_ubiquityStatusMonitor;
}

- (void)setUbiquityStatusMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquityStatusMonitor, 0);
  objc_storeStrong((id *)&self->_ubiquityDocumentsObserver, 0);
  objc_storeStrong((id *)&self->_iq_urlFromAssetID, 0);
  objc_storeStrong((id *)&self->_processMetadataQueryQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_observerCallbackQueue, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end