@interface VOTElementLabelCache
+ (id)sharedManager;
- (VOTElementLabelCache)init;
- (id)userLabelForIdentification:(id)a3;
- (void)_iCloudPublishData:(id)a3;
- (void)_iCloudReconcileDataStore:(id)a3;
- (void)_icloudDataChanged:(id)a3;
- (void)_syncLabelCache;
- (void)dealloc;
- (void)storeUserLabel:(id)a3 forIdentification:(id)a4;
@end

@implementation VOTElementLabelCache

+ (id)sharedManager
{
  if (qword_1001EBC78 != -1) {
    dispatch_once(&qword_1001EBC78, &stru_1001B6E98);
  }
  v2 = (void *)qword_1001EBC70;

  return v2;
}

- (VOTElementLabelCache)init
{
  v30.receiver = self;
  v30.super_class = (Class)VOTElementLabelCache;
  v2 = [(VOTElementLabelCache *)&v30 init];
  if (v2)
  {
    v3 = +[VOTConfiguration rootConfiguration];
    v4 = [v3 preferenceForKey:@"LabelCache"];
    id v5 = [v4 mutableCopyWithZone:0];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v10);
          labelCache = v2->_labelCache;
          if (!labelCache)
          {
            id v13 = objc_allocWithZone((Class)NSMutableDictionary);
            v14 = (NSMutableDictionary *)objc_msgSend(v13, "init", (void)v26);
            v15 = v2->_labelCache;
            v2->_labelCache = v14;

            labelCache = v2->_labelCache;
          }
          v16 = objc_msgSend(v6, "objectForKey:", v11, (void)v26);
          v17 = +[VOTElementUniqueIdentification identificationFromKey:v11];
          [(NSMutableDictionary *)labelCache setObject:v16 forKey:v17];

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v8);
    }

    dispatch_queue_t v18 = dispatch_queue_create("vot-label-access-queue", 0);
    labelCacheAccessQueue = v2->_labelCacheAccessQueue;
    v2->_labelCacheAccessQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_t v20 = dispatch_queue_create("vot-label-icloud-interaction-queue", 0);
    iCloudInteractionQueue = v2->_iCloudInteractionQueue;
    v2->_iCloudInteractionQueue = (OS_dispatch_queue *)v20;

    [(VOTElementLabelCache *)v2 _icloudDataChanged:0];
    v22 = +[NSNotificationCenter defaultCenter];
    v23 = +[NSUbiquitousKeyValueStore defaultStore];
    [v22 addObserver:v2 selector:"_icloudDataChanged:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:v23];

    v24 = v2;
  }

  return v2;
}

- (void)dealloc
{
  iCloudInteractionQueue = self->_iCloudInteractionQueue;
  self->_iCloudInteractionQueue = 0;

  labelCacheAccessQueue = self->_labelCacheAccessQueue;
  self->_labelCacheAccessQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)VOTElementLabelCache;
  [(VOTElementLabelCache *)&v5 dealloc];
}

- (void)_icloudDataChanged:(id)a3
{
  iCloudInteractionQueue = self->_iCloudInteractionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100100D00;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(iCloudInteractionQueue, block);
}

- (void)_iCloudReconcileDataStore:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v5)
  {
    id v7 = v5;
    char v19 = 0;
    uint64_t v8 = *(void *)v21;
    *(void *)&long long v6 = 138543618;
    long long v18 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v4, "objectForKeyedSubscript:", v10, v18);
        v12 = +[VOTElementUniqueIdentification identificationFromKey:v10];
        id v13 = [(NSMutableDictionary *)self->_labelCache objectForKey:v12];

        if (!v13)
        {
          if (!self->_labelCache)
          {
            v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            labelCache = self->_labelCache;
            self->_labelCache = v14;
          }
          v16 = VOTLogICloud();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            v25 = v11;
            __int16 v26 = 2114;
            uint64_t v27 = v10;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Made changes from iCloud: %{public}@ =  %{public}@", buf, 0x16u);
          }

          v17 = +[VOTElementUniqueIdentification identificationFromKey:v10];
          [(NSMutableDictionary *)self->_labelCache setObject:v11 forKey:v17];

          char v19 = 1;
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v7);
    if (v19) {
      [(VOTElementLabelCache *)self _syncLabelCache];
    }
  }
}

- (void)_iCloudPublishData:(id)a3
{
  if (a3)
  {
    id v4 = [a3 copy];
    iCloudInteractionQueue = self->_iCloudInteractionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100101188;
    block[3] = &unk_1001B33B8;
    id v8 = v4;
    id v6 = v4;
    dispatch_async(iCloudInteractionQueue, block);
  }
}

- (void)_syncLabelCache
{
  id v3 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_labelCache;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = -[NSMutableDictionary objectForKey:](self->_labelCache, "objectForKey:", v9, v13, v14, (void)v15);
        if (v10)
        {
          uint64_t v11 = [v9 hashKey];
          [v3 setObject:v10 forKey:v11];
        }
        else
        {
          CFStringRef v14 = @"***Label cache had a nil value in it. That is not good.";
          LOBYTE(v13) = 1;
          _AXLogWithFacility();
        }
      }
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  v12 = +[VOTConfiguration rootConfiguration];
  [v12 setPreference:v3 forKey:@"LabelCache"];
}

- (void)storeUserLabel:(id)a3 forIdentification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  labelCacheAccessQueue = self->_labelCacheAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001015E8;
  block[3] = &unk_1001B48E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(labelCacheAccessQueue, block);
}

- (id)userLabelForIdentification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_labelCache)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    long long v15 = sub_100101894;
    long long v16 = sub_1001018A4;
    id v17 = 0;
    labelCacheAccessQueue = self->_labelCacheAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001018AC;
    block[3] = &unk_1001B3470;
    void block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    dispatch_sync(labelCacheAccessQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudInteractionQueue, 0);
  objc_storeStrong((id *)&self->_labelCacheAccessQueue, 0);

  objc_storeStrong((id *)&self->_labelCache, 0);
}

@end