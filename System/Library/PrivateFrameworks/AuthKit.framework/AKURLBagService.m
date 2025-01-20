@interface AKURLBagService
+ (id)sharedBagService;
- (AKBagTrafficClearanceRequest)activeBagFetchRequest;
- (AKURLBagService)init;
- (NSDictionary)cachedBags;
- (NSMutableArray)pendingBagFetchRequests;
- (id)_cachedURLBagForAltDSID:(id)a3;
- (id)urlBagForAltDSID:(id)a3 error:(id *)a4;
- (id)urlBagFromCache:(BOOL)a3 altDSID:(id)a4 error:(id *)a5;
- (void)_fetchBagFromNetworkWithRequest:(id)a3 completion:(id)a4;
- (void)_invokeClearanceRequest:(id)a3 urlBag:(id)a4 error:(id)a5;
- (void)_tq_invokeRequest:(id)a3 completion:(id)a4;
- (void)_tq_processPendingRequests;
- (void)_updateCacheWithBag:(id)a3 forAltDSID:(id)a4;
- (void)_updateURLBagIfNecessaryFromHTTPCache:(BOOL)a3 ignoreMemoryCache:(BOOL)a4 altDSID:(id)a5 urlSwitchData:(id)a6 completion:(id)a7;
- (void)clearCache;
- (void)clearSerializedMemoryCache;
- (void)clearSessionCache;
- (void)fetchURLBagForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchURLBagForAltDSID:(id)a3 fromCache:(BOOL)a4 completion:(id)a5;
- (void)forceURLBagUpdateForAltDSID:(id)a3 urlSwitchData:(id)a4 completion:(id)a5;
- (void)setActiveBagFetchRequest:(id)a3;
- (void)setCachedBags:(id)a3;
- (void)setPendingBagFetchRequests:(id)a3;
@end

@implementation AKURLBagService

+ (id)sharedBagService
{
  if (qword_100272568 != -1) {
    dispatch_once(&qword_100272568, &stru_10022A6E0);
  }
  v2 = (void *)qword_100272560;

  return v2;
}

- (AKURLBagService)init
{
  v10.receiver = self;
  v10.super_class = (Class)AKURLBagService;
  v2 = [(AKURLBagService *)&v10 init];
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    lastUpdated = v2->_lastUpdated;
    v2->_lastUpdated = v3;

    v5 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    cachedBags = v2->_cachedBags;
    v2->_cachedBags = v5;

    uint64_t v7 = +[NSMutableArray array];
    pendingBagFetchRequests = v2->_pendingBagFetchRequests;
    v2->_pendingBagFetchRequests = (NSMutableArray *)v7;
  }
  return v2;
}

- (void)clearCache
{
  [(AKURLBagService *)self clearSerializedMemoryCache];

  [(AKURLBagService *)self clearSessionCache];
}

- (void)clearSessionCache
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing session URL bag caches...", buf, 2u);
  }

  p_bag_cache_lock = &self->_bag_cache_lock;
  os_unfair_lock_lock(p_bag_cache_lock);
  +[AKURLSession removeAllCachedResponses];
  os_unfair_lock_unlock(p_bag_cache_lock);
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleared session bag caches", v6, 2u);
  }
}

- (void)clearSerializedMemoryCache
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing memory URL bag caches...", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009F370;
  v5[3] = &unk_100226FB8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_bag_cache_lock);
  sub_10009F370((uint64_t)v5);
  os_unfair_lock_unlock(&self->_bag_cache_lock);
  v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cleared serialized bag cache", buf, 2u);
  }
}

- (void)fetchURLBagForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10018DABC();
  }

  [(AKURLBagService *)self _updateURLBagIfNecessaryFromHTTPCache:0 ignoreMemoryCache:0 altDSID:v7 urlSwitchData:0 completion:v6];
}

- (void)fetchURLBagForAltDSID:(id)a3 fromCache:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  objc_super v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10018DABC();
  }

  [(AKURLBagService *)self _updateURLBagIfNecessaryFromHTTPCache:v5 ignoreMemoryCache:0 altDSID:v9 urlSwitchData:0 completion:v8];
}

- (id)urlBagForAltDSID:(id)a3 error:(id *)a4
{
  return [(AKURLBagService *)self urlBagFromCache:0 altDSID:a3 error:a4];
}

- (id)urlBagFromCache:(BOOL)a3 altDSID:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_10000F990;
  v30 = sub_10000F818;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_10000F990;
  v24 = sub_10000F818;
  id v25 = [(AKURLBagService *)self _cachedURLBagForAltDSID:v8];
  id v9 = (void *)v21[5];
  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting to fetch URL bag cache using DEPRECATED SYNCHRONOUS SPI! Hangs ahead!", buf, 2u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10009F798;
    v15[3] = &unk_1002274B0;
    v17 = &v20;
    v18 = &v26;
    v12 = dispatch_semaphore_create(0);
    v16 = v12;
    [(AKURLBagService *)self _updateURLBagIfNecessaryFromHTTPCache:v6 ignoreMemoryCache:0 altDSID:v8 urlSwitchData:0 completion:v15];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Finished fetch URL bag cache using DEPRECATED SYNCHRONOUS SPI! Phew... we didn't hang, this time!", buf, 2u);
    }

    if (a5) {
      *a5 = (id) v27[5];
    }
    id v10 = (id)v21[5];
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);

  return v10;
}

- (void)_tq_invokeRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_trafficQueue);
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10018DAF0();
  }

  [(AKURLBagService *)self setActiveBagFetchRequest:v6];
  id v9 = [v6 context];
  id v10 = [v9 altDSID];
  v11 = [(AKURLBagService *)self _cachedURLBagForAltDSID:v10];

  if (v11)
  {
    [(AKURLBagService *)self setActiveBagFetchRequest:0];
    v7[2](v7, v11, 0);
  }
  else
  {
    [(AKURLBagService *)self _fetchBagFromNetworkWithRequest:v6 completion:v7];
  }
}

- (void)_fetchBagFromNetworkWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching URL bag from Network... %@", buf, 0xCu);
  }

  id v9 = [AKURLBagRequestProvider alloc];
  id v10 = [v6 context];
  v11 = [v10 altDSID];
  v12 = [v6 urlSwitchData];
  v13 = [(AKURLBagRequestProvider *)v9 initWithAltDSID:v11 urlSwitchData:v12];

  id v14 = [(AKURLBagRequestProvider *)v13 newBagURLRequest];
  if ([v6 fromURLCache]) {
    +[AKURLSession sharedCacheReliantAnisetteFreeSession];
  }
  else {
  v15 = +[AKURLSession sharedCacheEnabledAnisetteFreeSession];
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10009FB34;
  v19[3] = &unk_10022A708;
  v21 = self;
  id v22 = v7;
  id v20 = v6;
  id v16 = v6;
  id v17 = v7;
  id v18 = [v15 beginDataTaskWithRequest:v14 completionHandler:v19];
}

- (void)_updateURLBagIfNecessaryFromHTTPCache:(BOOL)a3 ignoreMemoryCache:(BOOL)a4 altDSID:(id)a5 urlSwitchData:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = _AKSignpostLogSystem();
  os_signpost_id_t v16 = _AKSignpostCreate();
  uint64_t v18 = v17;

  v19 = _AKSignpostLogSystem();
  id v20 = v19;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, v16, "FetchURLBag", " enableTelemetry=YES ", buf, 2u);
  }

  v21 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v40 = v16;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchURLBag  enableTelemetry=YES ", buf, 0xCu);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000A0194;
  v35[3] = &unk_100229220;
  os_signpost_id_t v37 = v16;
  uint64_t v38 = v18;
  id v36 = v14;
  id v22 = v14;
  v23 = objc_retainBlock(v35);
  trafficQueue = self->_trafficQueue;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000A0310;
  v28[3] = &unk_1002279C8;
  BOOL v33 = a3;
  BOOL v34 = a4;
  id v29 = v12;
  id v30 = v13;
  id v31 = self;
  id v32 = v23;
  id v25 = v23;
  id v26 = v13;
  id v27 = v12;
  dispatch_async(trafficQueue, v28);
}

- (void)_invokeClearanceRequest:(id)a3 urlBag:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  clearanceQueue = self->_clearanceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A06C0;
  block[3] = &unk_100226BD8;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(clearanceQueue, block);
}

- (void)_tq_processPendingRequests
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_trafficQueue);
  [(AKURLBagService *)self setActiveBagFetchRequest:0];
  v3 = [(AKURLBagService *)self pendingBagFetchRequests];
  id v4 = [v3 count];

  BOOL v5 = _AKLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      sub_10018DD1C(self, v5);
    }

    id v7 = [(AKURLBagService *)self pendingBagFetchRequests];
    id v8 = [v7 firstObject];

    id v9 = [(AKURLBagService *)self pendingBagFetchRequests];
    [v9 removeObjectAtIndex:0];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A08D8;
    v10[3] = &unk_10022A730;
    v10[4] = self;
    id v11 = v8;
    BOOL v5 = v8;
    [(AKURLBagService *)self _tq_invokeRequest:v5 completion:v10];
  }
  else if (v6)
  {
    sub_10018DCE8();
  }
}

- (void)forceURLBagUpdateForAltDSID:(id)a3 urlSwitchData:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Force URL bag fetch requested!!! Hold on to your hats!", buf, 2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A0A90;
  v13[3] = &unk_100228318;
  id v14 = v8;
  id v12 = v8;
  [(AKURLBagService *)self _updateURLBagIfNecessaryFromHTTPCache:0 ignoreMemoryCache:1 altDSID:v10 urlSwitchData:v9 completion:v13];
}

- (id)_cachedURLBagForAltDSID:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A0B80;
  v8[3] = &unk_10022A758;
  p_bag_cache_lock = &self->_bag_cache_lock;
  id v9 = a3;
  id v10 = self;
  id v5 = v9;
  os_unfair_lock_lock(p_bag_cache_lock);
  BOOL v6 = sub_1000A0B80((uint64_t)v8);
  os_unfair_lock_unlock(p_bag_cache_lock);

  return v6;
}

- (void)_updateCacheWithBag:(id)a3 forAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v8 = v7;
  if (![(__CFString *)v7 length])
  {

    id v8 = @"AKSharedBag";
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A0DD8;
    v10[3] = &unk_100226BD8;
    v10[4] = self;
    id v11 = v8;
    id v12 = v6;
    os_unfair_lock_lock(&self->_bag_cache_lock);
    sub_1000A0DD8(v10);
    os_unfair_lock_unlock(&self->_bag_cache_lock);
  }
  else
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10018DEF0();
    }
  }
}

- (NSMutableArray)pendingBagFetchRequests
{
  return self->_pendingBagFetchRequests;
}

- (void)setPendingBagFetchRequests:(id)a3
{
}

- (AKBagTrafficClearanceRequest)activeBagFetchRequest
{
  return self->_activeBagFetchRequest;
}

- (void)setActiveBagFetchRequest:(id)a3
{
}

- (NSDictionary)cachedBags
{
  return self->_cachedBags;
}

- (void)setCachedBags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedBags, 0);
  objc_storeStrong((id *)&self->_activeBagFetchRequest, 0);
  objc_storeStrong((id *)&self->_pendingBagFetchRequests, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_clearanceQueue, 0);

  objc_storeStrong((id *)&self->_trafficQueue, 0);
}

@end