@interface ENGroupContextInMemoryCache
- (ENGroupContextInMemoryCache)initWithQueue:(id)a3;
- (NSMutableDictionary)groupIDtoGroup;
- (NSMutableDictionary)latestStableGroupIDToGroup;
- (OS_dispatch_queue)queue;
- (int64_t)middlewareCacheCostForContext:(id)a3;
- (void)deleteAllKnownGroupsForGroupContext:(id)a3 completion:(id)a4;
- (void)deleteCachedValueForForGroupContext:(id)a3 withGroupID:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 cacheGroup:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 cachedGroupWithID:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 fetchAllKnownGroups:(id)a4;
- (void)groupContext:(id)a3 latestCachedGroupWithStableID:(id)a4 completion:(id)a5;
- (void)setGroupIDtoGroup:(id)a3;
- (void)setLatestStableGroupIDToGroup:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ENGroupContextInMemoryCache

- (ENGroupContextInMemoryCache)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ENGroupContextInMemoryCache;
  v6 = [(ENGroupContextInMemoryCache *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    groupIDtoGroup = v7->_groupIDtoGroup;
    v7->_groupIDtoGroup = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    latestStableGroupIDToGroup = v7->_latestStableGroupIDToGroup;
    v7->_latestStableGroupIDToGroup = v10;
  }
  return v7;
}

- (int64_t)middlewareCacheCostForContext:(id)a3
{
  return 100;
}

- (void)groupContext:(id)a3 cacheGroup:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = (void (**)(void))a5;
  v9 = +[ENLog groupContext];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v34 = v7;
    _os_log_impl(&dword_1DD450000, v9, OS_LOG_TYPE_INFO, "CacheGroup - BEGIN {group: %{private}@}", buf, 0xCu);
  }

  v10 = [(ENGroupContextInMemoryCache *)self latestStableGroupIDToGroup];
  v11 = [v7 groupID];
  v12 = [v11 stableGroupID];
  objc_super v13 = [v10 objectForKeyedSubscript:v12];

  v14 = +[ENLog groupContext];
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (!v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD450000, v14, OS_LOG_TYPE_INFO, "CacheGroup - group not found - caching", buf, 2u);
    }

    id v19 = [(ENGroupContextInMemoryCache *)self latestStableGroupIDToGroup];
    v21 = [v7 groupID];
    v22 = [v21 stableGroupID];
    [v19 setObject:v7 forKeyedSubscript:v22];
    goto LABEL_25;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD450000, v14, OS_LOG_TYPE_INFO, "CacheGroup - have existing stableGroupID - Testing order", buf, 2u);
  }

  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  v16 = [v13 groupID];
  v17 = [v7 groupID];
  id v31 = 0;
  int v18 = [v16 compare:v17 withResult:&v32 error:&v31];
  id v19 = v31;

  if (v18)
  {
    if (v32 == 1)
    {
      v21 = +[ENLog groupContext];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD450000, v21, OS_LOG_TYPE_DEFAULT, "CacheGroup - group is older - Ignoring", buf, 2u);
      }
      goto LABEL_26;
    }
    if (v32)
    {
      if (v32 != -1) {
        goto LABEL_27;
      }
      v20 = +[ENLog groupContext];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD450000, v20, OS_LOG_TYPE_INFO, "CacheGroup - group is newer - Caching", buf, 2u);
      }

      v21 = [(ENGroupContextInMemoryCache *)self latestStableGroupIDToGroup];
      v22 = [v7 groupID];
      v23 = [v22 stableGroupID];
      v24 = v21;
      id v25 = v7;
    }
    else
    {
      v27 = +[ENLog groupContext];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD450000, v27, OS_LOG_TYPE_DEFAULT, "CacheGroup - group is same - Clearing", buf, 2u);
      }

      v21 = [(ENGroupContextInMemoryCache *)self latestStableGroupIDToGroup];
      v22 = [v7 groupID];
      v23 = [v22 stableGroupID];
      v24 = v21;
      id v25 = 0;
    }
    [v24 setObject:v25 forKeyedSubscript:v23];

LABEL_25:
LABEL_26:

    goto LABEL_27;
  }
  v26 = +[ENLog groupContext];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138478339;
    id v34 = v13;
    __int16 v35 = 2113;
    id v36 = v7;
    __int16 v37 = 2113;
    id v38 = v19;
    _os_log_fault_impl(&dword_1DD450000, v26, OS_LOG_TYPE_FAULT, "CacheGroup - could not compare groups - Fail {existingLatestGroup: %{private}@, group: %{private}@, error: %{private}@}", buf, 0x20u);
  }

  v8[2](v8);
LABEL_27:

  v28 = [(ENGroupContextInMemoryCache *)self groupIDtoGroup];
  v29 = [v7 groupID];
  [v28 setObject:v7 forKeyedSubscript:v29];

  v30 = +[ENLog groupContext];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD450000, v30, OS_LOG_TYPE_INFO, "CacheGroup  - END", buf, 2u);
  }

  v8[2](v8);
}

- (void)deleteAllKnownGroupsForGroupContext:(id)a3 completion:(id)a4
{
  v8 = (void (**)(void))a4;
  id v5 = [(ENGroupContextInMemoryCache *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(ENGroupContextInMemoryCache *)self latestStableGroupIDToGroup];
  [v6 removeAllObjects];

  id v7 = [(ENGroupContextInMemoryCache *)self groupIDtoGroup];
  [v7 removeAllObjects];

  v8[2]();
}

- (void)deleteCachedValueForForGroupContext:(id)a3 withGroupID:(id)a4 completion:(id)a5
{
  v12 = (void (**)(void))a5;
  id v7 = a4;
  v8 = [(ENGroupContextInMemoryCache *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [(ENGroupContextInMemoryCache *)self latestStableGroupIDToGroup];
  v10 = [v7 stableGroupID];
  [v9 setObject:0 forKeyedSubscript:v10];

  v11 = [(ENGroupContextInMemoryCache *)self groupIDtoGroup];
  [v11 setObject:0 forKeyedSubscript:v7];

  v12[2]();
}

- (void)groupContext:(id)a3 cachedGroupWithID:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, void *))a5;
  id v8 = a4;
  v9 = [(ENGroupContextInMemoryCache *)self queue];
  dispatch_assert_queue_V2(v9);

  id v11 = [(ENGroupContextInMemoryCache *)self groupIDtoGroup];
  v10 = [v11 objectForKeyedSubscript:v8];

  v7[2](v7, v10);
}

- (void)groupContext:(id)a3 latestCachedGroupWithStableID:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, void *))a5;
  id v8 = a4;
  v9 = [(ENGroupContextInMemoryCache *)self queue];
  dispatch_assert_queue_V2(v9);

  id v11 = [(ENGroupContextInMemoryCache *)self latestStableGroupIDToGroup];
  v10 = [v11 objectForKeyedSubscript:v8];

  v7[2](v7, v10);
}

- (void)groupContext:(id)a3 fetchAllKnownGroups:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  v6 = [(ENGroupContextInMemoryCache *)self queue];
  dispatch_assert_queue_V2(v6);

  id v8 = [(ENGroupContextInMemoryCache *)self groupIDtoGroup];
  id v7 = [v8 allValues];
  v5[2](v5, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)groupIDtoGroup
{
  return self->_groupIDtoGroup;
}

- (void)setGroupIDtoGroup:(id)a3
{
}

- (NSMutableDictionary)latestStableGroupIDToGroup
{
  return self->_latestStableGroupIDToGroup;
}

- (void)setLatestStableGroupIDToGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestStableGroupIDToGroup, 0);
  objc_storeStrong((id *)&self->_groupIDtoGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end