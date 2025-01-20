@interface CKDKVSStore
+ (id)kvsInterface;
- (BOOL)pullUpdates:(id *)a3;
- (CKDKVSCounters)perfCounters;
- (CKDKVSStore)init;
- (NSUbiquitousKeyValueStore)cloudStore;
- (OS_dispatch_queue)perfQueue;
- (UbiqitousKVSProxy)proxy;
- (id)copyAsDictionary;
- (id)objectForKey:(id)a3;
- (void)addEntriesFromDictionary:(id)a3;
- (void)addOneToOutGoing;
- (void)connectToProxy:(id)a3;
- (void)dealloc;
- (void)forceSynchronizeWithKVS;
- (void)kvsStoreChanged:(id)a3;
- (void)kvsStoreChangedAsync:(id)a3;
- (void)perfCounters:(id)a3;
- (void)pushWrites:(id)a3 requiresForceSync:(BOOL)a4;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setCloudStore:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPerfCounters:(CKDKVSCounters *)a3;
- (void)setPerfQueue:(id)a3;
- (void)setProxy:(id)a3;
- (void)setupSamplers;
@end

@implementation CKDKVSStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfQueue, 0);
  objc_storeStrong((id *)&self->_cloudStore, 0);

  objc_destroyWeak((id *)&self->_proxy);
}

- (void)setPerfQueue:(id)a3
{
}

- (OS_dispatch_queue)perfQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPerfCounters:(CKDKVSCounters *)a3
{
  self->_perfCounters = a3;
}

- (CKDKVSCounters)perfCounters
{
  return self->_perfCounters;
}

- (void)setCloudStore:(id)a3
{
}

- (NSUbiquitousKeyValueStore)cloudStore
{
  return (NSUbiquitousKeyValueStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProxy:(id)a3
{
}

- (UbiqitousKVSProxy)proxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);

  return (UbiqitousKVSProxy *)WeakRetained;
}

- (void)addOneToOutGoing
{
  v3 = [(CKDKVSStore *)self perfQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C690;
  block[3] = &unk_100018E08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)setupSamplers
{
  v3 = +[SOSAnalytics logger];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C768;
  v5[3] = &unk_100018EF8;
  v5[4] = self;
  id v4 = [v3 AddMultiSamplerForName:CKDKVSPerformanceCountersSampler withTimeInterval:v5 block:SFAnalyticsSamplerIntervalOncePerReport];
}

- (void)perfCounters:(id)a3
{
  id v4 = a3;
  v5 = [(CKDKVSStore *)self perfQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C9E0;
  v7[3] = &unk_100018EA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)pullUpdates:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10000C8D8;
  v20 = sub_10000C8E8;
  id v21 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = sub_10000E250("fresh");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "EFRESH";
    __int16 v24 = 2112;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s CALLING OUT TO syncdefaultsd SWCH: %@", buf, 0x16u);
  }

  v7 = [(CKDKVSStore *)self perfQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CE8C;
  block[3] = &unk_100018E08;
  block[4] = self;
  dispatch_async(v7, block);

  id v8 = [(CKDKVSStore *)self cloudStore];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000CEB4;
  v12[3] = &unk_100018E80;
  v12[4] = self;
  v14 = &v16;
  v9 = v5;
  v13 = v9;
  [v8 synchronizeWithCompletionHandler:v12];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (a3 && !*a3) {
    *a3 = (id) v17[5];
  }
  BOOL v10 = v17[5] == 0;

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)kvsStoreChanged:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D1E0;
  v4[3] = &unk_100018E58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate((void *)&_mh_execute_header, "cloudChanged", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

- (void)kvsStoreChangedAsync:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000E250("CloudKeychainProxy");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ KVS Remote changed notification: %@", buf, 0x16u);
  }

  id v6 = [(CKDKVSStore *)self perfQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D5A4;
  block[3] = &unk_100018E08;
  block[4] = self;
  dispatch_async(v6, block);

  v7 = dispatch_get_global_queue(0, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000D5CC;
  v9[3] = &unk_100018E58;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)pushWrites:(id)a3 requiresForceSync:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = sub_10000E250("pushWrites");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Push writes", buf, 2u);
  }

  id v8 = sub_10000E250("pushWrites");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "requested to force synchronize", buf, 2u);
    }

    [(CKDKVSStore *)self forceSynchronizeWithKVS];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "KVS on CloudKit enabled. Evaluating changed keys", buf, 2u);
    }

    if (v6 && [v6 count])
    {
      *(void *)buf = 0;
      id v15 = buf;
      uint64_t v16 = 0x2020000000;
      char v17 = 0;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000D844;
      v13[3] = &unk_100018E30;
      v13[4] = buf;
      [v6 enumerateObjectsUsingBlock:v13];
      if (v15[24])
      {
        [(CKDKVSStore *)self forceSynchronizeWithKVS];
      }
      else
      {
        v11 = sub_10000E250("pushWrites");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "no keys to force push, returning", v12, 2u);
        }
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v10 = sub_10000E250("pushWrites");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "key set is empty, returning", buf, 2u);
      }
    }
  }
}

- (void)forceSynchronizeWithKVS
{
  id v3 = sub_10000E250("pushWrites");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "requesting force synchronization with KVS on CloudKit", buf, 2u);
  }

  BOOL v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DA54;
  block[3] = &unk_100018E08;
  block[4] = self;
  dispatch_async(v4, block);

  id v5 = [(CKDKVSStore *)self perfQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000DB74;
  v6[3] = &unk_100018E08;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)removeAllObjects
{
  id v3 = [(CKDKVSStore *)self cloudStore];
  BOOL v4 = [v3 dictionaryRepresentation];
  id v5 = [v4 allKeys];
  id v6 = [v5 copy];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DC60;
  v7[3] = &unk_100018DE0;
  v7[4] = self;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CKDKVSStore *)self cloudStore];
  [v5 removeObjectForKey:v4];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CKDKVSStore *)self cloudStore];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)addEntriesFromDictionary:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000DE00;
  v3[3] = &unk_100018DB8;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

- (id)copyAsDictionary
{
  v2 = [(CKDKVSStore *)self cloudStore];
  id v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKDKVSStore *)self cloudStore];
  [v8 setObject:v7 forKey:v6];
}

- (void)connectToProxy:(id)a3
{
  objc_storeWeak((id *)&self->_proxy, a3);
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"kvsStoreChangedAsync:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:0];
}

- (void)dealloc
{
  perfCounters = self->_perfCounters;
  if (perfCounters) {
    free(perfCounters);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDKVSStore;
  [(CKDKVSStore *)&v4 dealloc];
}

- (CKDKVSStore)init
{
  v11.receiver = self;
  v11.super_class = (Class)CKDKVSStore;
  v2 = [(CKDKVSStore *)&v11 init];
  if (!v2) {
    goto LABEL_4;
  }
  uint64_t v3 = +[NSUbiquitousKeyValueStore defaultStore];
  cloudStore = v2->_cloudStore;
  v2->_cloudStore = (NSUbiquitousKeyValueStore *)v3;

  objc_storeWeak((id *)&v2->_proxy, 0);
  id v5 = [(CKDKVSStore *)v2 cloudStore];

  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("CKDKVSStorePerfQueue", 0);
    [(CKDKVSStore *)v2 setPerfQueue:v6];

    [(CKDKVSStore *)v2 setPerfCounters:malloc_type_calloc(1uLL, 0x38uLL, 0x100004021716A34uLL)];
    [(CKDKVSStore *)v2 setupSamplers];
LABEL_4:
    id v7 = v2;
    goto LABEL_8;
  }
  id v8 = sub_10000E250("SecError");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NO NSUbiquitousKeyValueStore defaultStore!!!", v10, 2u);
  }

  id v7 = 0;
LABEL_8:

  return v7;
}

+ (id)kvsInterface
{
  v2 = objc_alloc_init(CKDKVSStore);

  return v2;
}

@end