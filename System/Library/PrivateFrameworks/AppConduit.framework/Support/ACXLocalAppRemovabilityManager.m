@interface ACXLocalAppRemovabilityManager
+ (id)sharedInstance;
- (ACXLocalAppRemovabilityManager)init;
- (IXDataStoreClock)removabilityChangeClock;
- (NSHashTable)observers;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)observerQueue;
- (id)_onQueue_updateRemovabilityInfoAndReturnRemovabilityMap;
- (id)getRemovabilityForAllAppsWithStoreUUID:(id *)a3 sequenceNumber:(unint64_t *)a4;
- (void)_onQueue_handleRemovabilityChangedNotification:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)fetchCurrentRemovabilityStoreUUID:(id *)a3 sequenceNumber:(unint64_t *)a4;
- (void)removeObserver:(id)a3;
- (void)setRemovabilityChangeClock:(id)a3;
- (void)updateRemovabilityInfoAndReturnRemovabilityMap:(id)a3;
@end

@implementation ACXLocalAppRemovabilityManager

- (id)_onQueue_updateRemovabilityInfoAndReturnRemovabilityMap
{
  v3 = [(ACXLocalAppRemovabilityManager *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v13 = 0;
  id v14 = 0;
  v4 = +[IXAppInstallCoordinator removabilityDataWithChangeClock:&v14 error:&v13];
  id v5 = v14;
  id v6 = v14;
  id v7 = v13;
  if (v4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100012508;
    v11[3] = &unk_10008D028;
    id v12 = (id)objc_opt_new();
    id v8 = v12;
    [v4 enumerateKeysAndObjectsUsingBlock:v11];
    objc_storeStrong((id *)&self->_removabilityChangeClock, v5);
    id v9 = [v8 copy];
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 4) {
      MOLogWrite();
    }
    id v9 = 0;
  }

  return v9;
}

- (void)_onQueue_handleRemovabilityChangedNotification:(id)a3
{
  id v4 = a3;
  v23 = self;
  id v5 = [(ACXLocalAppRemovabilityManager *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    v18 = [v4 userInfo];
    MOLogWrite();
  }
  id v6 = objc_msgSend(v4, "userInfo", v18);
  id v7 = [v6 valueForKey:kCFBundleIdentifierKey];
  if (v7)
  {
    id v21 = v4;
    id v8 = [v6 objectForKeyedSubscript:IXNotificationPayloadRemovabilityValueKey];
    v20 = v6;
    id v9 = [v6 objectForKeyedSubscript:IXNotificationPayloadRemovabilityStoreClockKey];
    v10 = [v9 objectForKeyedSubscript:kIXNotificationPayloadDataStoreClockGUIDKey];
    v19 = v9;
    v11 = [v9 objectForKeyedSubscript:kIXNotificationPayloadDataStoreClockSequenceNumberKey];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [(ACXLocalAppRemovabilityManager *)v23 observers];
    id v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v15);
          v17 = [(ACXLocalAppRemovabilityManager *)v23 observerQueue];
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10001289C;
          v24[3] = &unk_10008C9C8;
          v24[4] = v16;
          id v25 = v8;
          id v26 = v7;
          id v27 = v10;
          id v28 = v11;
          sub_100006BB8(v17, v24);

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v13);
    }

    id v6 = v20;
    id v4 = v21;
  }
}

- (void)updateRemovabilityInfoAndReturnRemovabilityMap:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXLocalAppRemovabilityManager *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012964;
  v7[3] = &unk_10008CC28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (ACXLocalAppRemovabilityManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)ACXLocalAppRemovabilityManager;
  v2 = [(ACXLocalAppRemovabilityManager *)&v24 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appconduit.removabilitySyncManagerQueue", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appconduit.ACXLocalRemovabilityObserver", v6);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v7;

    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    id v21 = sub_100012B94;
    v22 = sub_100012BA4;
    id v23 = 0;
    id v9 = [(ACXLocalAppRemovabilityManager *)v2 internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012BAC;
    block[3] = &unk_10008C950;
    v17 = &v18;
    v10 = v2;
    uint64_t v16 = v10;
    dispatch_sync(v9, block);

    if (v19[5])
    {
      objc_initWeak(&location, v10);
      v11 = +[NSDistributedNotificationCenter defaultCenter];
      [v11 addObserver:v10 selector:"updateRemovabilityInfoAndReturnRemovabilityMap:" name:IXAppRemovabilityChangedNotificationName object:0];

      id v12 = v10;
      objc_destroyWeak(&location);
    }
    else
    {
      id v12 = 0;
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)sharedInstance
{
  if (qword_1000A5538 != -1) {
    dispatch_once(&qword_1000A5538, &stru_10008D048);
  }
  v2 = (void *)qword_1000A5530;

  return v2;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ACXLocalAppRemovabilityManager;
  [(ACXLocalAppRemovabilityManager *)&v4 dealloc];
}

- (void)fetchCurrentRemovabilityStoreUUID:(id *)a3 sequenceNumber:(unint64_t *)a4
{
  dispatch_queue_t v7 = [(ACXLocalAppRemovabilityManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012E10;
  block[3] = &unk_10008D070;
  void block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(v7, block);
}

- (id)getRemovabilityForAllAppsWithStoreUUID:(id *)a3 sequenceNumber:(unint64_t *)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_100012B94;
  v15 = sub_100012BA4;
  id v16 = 0;
  dispatch_queue_t v7 = [(ACXLocalAppRemovabilityManager *)self internalQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100012FEC;
  v10[3] = &unk_10008D098;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  v10[7] = a4;
  dispatch_sync(v7, v10);

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXLocalAppRemovabilityManager *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013170;
  v7[3] = &unk_10008CC28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXLocalAppRemovabilityManager *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000132A4;
  v7[3] = &unk_10008CC28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (IXDataStoreClock)removabilityChangeClock
{
  return self->_removabilityChangeClock;
}

- (void)setRemovabilityChangeClock:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_removabilityChangeClock, 0);
}

@end