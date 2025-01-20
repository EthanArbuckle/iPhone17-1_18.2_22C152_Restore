@interface ENGroupContextCoreDataCache
- (ENGroupContextCoreDataCache)initWithType:(unint64_t)a3 containerURL:(id)a4 queue:(id)a5;
- (NSPersistentContainer)container;
- (OS_dispatch_queue)queue;
- (id)initInMemoryCacheWithQueue:(id)a3;
- (id)initOnDiskCacheWithContainerURL:(id)a3 Queue:(id)a4;
- (int64_t)middlewareCacheCostForContext:(id)a3;
- (void)_groupFromCypher:(id)a3 groupID:(id)a4 applicationData:(id)a5 context:(id)a6 completion:(id)a7;
- (void)deleteAllKnownGroupsForGroupContext:(id)a3 completion:(id)a4;
- (void)deleteCachedValueForForGroupContext:(id)a3 withGroupID:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 cacheGroup:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 cachedGroupWithID:(id)a4 completion:(id)a5;
- (void)groupContext:(id)a3 fetchAllKnownGroups:(id)a4;
- (void)groupContext:(id)a3 latestCachedGroupWithStableID:(id)a4 completion:(id)a5;
- (void)loadWithCompletion:(id)a3;
- (void)setContainer:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ENGroupContextCoreDataCache

- (id)initOnDiskCacheWithContainerURL:(id)a3 Queue:(id)a4
{
  return [(ENGroupContextCoreDataCache *)self initWithType:0 containerURL:a3 queue:a4];
}

- (id)initInMemoryCacheWithQueue:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = a3;
  v6 = NSHomeDirectory();
  v7 = [v4 fileURLWithPath:v6];
  v8 = [(ENGroupContextCoreDataCache *)self initWithType:1 containerURL:v7 queue:v5];

  return v8;
}

- (ENGroupContextCoreDataCache)initWithType:(unint64_t)a3 containerURL:(id)a4 queue:(id)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)ENGroupContextCoreDataCache;
  v10 = [(ENGroupContextCoreDataCache *)&v28 init];
  if (v10)
  {
    v26.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
    v27 = _os_activity_create(&dword_1DD450000, "Create ENGroupContextCoreDataCache", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v26.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
    os_activity_scope_enter(v27, &v26);
    objc_storeStrong((id *)&v10->_queue, a5);
    v11 = (void *)MEMORY[0x1E4F1C120];
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v32[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    v14 = [v11 mergedModelFromBundles:v13];

    uint64_t v15 = [MEMORY[0x1E4F1C150] persistentContainerWithName:@"ENGroupContext" managedObjectModel:v14];
    container = v10->_container;
    v10->_container = (NSPersistentContainer *)v15;

    v17 = [(NSPersistentContainer *)v10->_container name];
    v18 = [v8 URLByAppendingPathComponent:v17];
    v19 = [v18 URLByAppendingPathExtension:@"sqlite"];

    v20 = [MEMORY[0x1E4F1C190] persistentStoreDescriptionWithURL:v19];
    v21 = +[ENLog groupContext];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v19;
      _os_log_impl(&dword_1DD450000, v21, OS_LOG_TYPE_DEFAULT, "!setState url=%@", buf, 0xCu);
    }

    if (a3 == 1)
    {
      v22 = +[ENLog groupContext];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = @"inMemory";
        _os_log_impl(&dword_1DD450000, v22, OS_LOG_TYPE_DEFAULT, "!setState db-type=%@", buf, 0xCu);
      }
      v23 = (void *)MEMORY[0x1E4F1BDE0];
    }
    else
    {
      if (a3)
      {
LABEL_13:
        v29 = v20;
        v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        [(NSPersistentContainer *)v10->_container setPersistentStoreDescriptions:v24];

        os_activity_scope_leave(&v26);
        cut_arc_os_release();

        goto LABEL_14;
      }
      v22 = +[ENLog groupContext];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = @"SQLite";
        _os_log_impl(&dword_1DD450000, v22, OS_LOG_TYPE_DEFAULT, "!setState db-type=%@", buf, 0xCu);
      }
      v23 = (void *)MEMORY[0x1E4F1BF70];
    }

    [v20 setType:*v23];
    goto LABEL_13;
  }
LABEL_14:

  return v10;
}

- (void)loadWithCompletion:(id)a3
{
  id v4 = a3;
  v10 = _os_activity_create(&dword_1DD450000, "Loading Database", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v10, &state);
  id v5 = [(ENGroupContextCoreDataCache *)self container];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DD4515FC;
  v7[3] = &unk_1E6CC4DF8;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 loadPersistentStoresWithCompletionHandler:v7];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_groupFromCypher:(id)a3 groupID:(id)a4 applicationData:(id)a5 context:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(ENGroupContextCoreDataCache *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DD4518D8;
  block[3] = &unk_1E6CC4E48;
  id v24 = v15;
  id v25 = v12;
  id v26 = v14;
  id v27 = v13;
  id v28 = v16;
  id v18 = v16;
  id v19 = v13;
  id v20 = v14;
  id v21 = v12;
  id v22 = v15;
  dispatch_async(v17, block);
}

- (int64_t)middlewareCacheCostForContext:(id)a3
{
  return 300;
}

- (void)groupContext:(id)a3 cacheGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v19 = _os_activity_create(&dword_1DD450000, "Saving group -- Start", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v19, &state);
  v11 = [(ENGroupContextCoreDataCache *)self container];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DD451BEC;
  v14[3] = &unk_1E6CC4E98;
  id v12 = v9;
  id v15 = v12;
  id v16 = self;
  id v13 = v10;
  id v17 = v13;
  [v11 performBackgroundTask:v14];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)groupContext:(id)a3 cachedGroupWithID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v21 = _os_activity_create(&dword_1DD450000, "Fetching by groupID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v21, &state);
  v11 = [(ENGroupContextCoreDataCache *)self container];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DD451F24;
  v15[3] = &unk_1E6CC4EE8;
  id v12 = v9;
  id v16 = v12;
  id v17 = self;
  id v13 = v8;
  id v18 = v13;
  id v14 = v10;
  id v19 = v14;
  [v11 performBackgroundTask:v15];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)groupContext:(id)a3 latestCachedGroupWithStableID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v21 = _os_activity_create(&dword_1DD450000, "Fetching by Stable Group ID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v21, &state);
  v11 = [(ENGroupContextCoreDataCache *)self container];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DD452508;
  v15[3] = &unk_1E6CC4EE8;
  id v12 = v9;
  id v16 = v12;
  id v17 = self;
  id v13 = v8;
  id v18 = v13;
  id v14 = v10;
  id v19 = v14;
  [v11 performBackgroundTask:v15];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)deleteAllKnownGroupsForGroupContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v13 = _os_activity_create(&dword_1DD450000, "Delete all known groups", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v13, &state);
  id v8 = [(ENGroupContextCoreDataCache *)self container];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DD452BA0;
  v10[3] = &unk_1E6CC4F10;
  v10[4] = self;
  id v9 = v7;
  id v11 = v9;
  [v8 performBackgroundTask:v10];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)deleteCachedValueForForGroupContext:(id)a3 withGroupID:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v20 = _os_activity_create(&dword_1DD450000, "Delete cached group", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v20, &state);
  id v11 = +[ENLog groupContext];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v9;
    _os_log_impl(&dword_1DD450000, v11, OS_LOG_TYPE_DEFAULT, "!setState groupID=%@", buf, 0xCu);
  }

  id v12 = [(ENGroupContextCoreDataCache *)self container];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DD453068;
  v15[3] = &unk_1E6CC4E98;
  id v13 = v9;
  id v16 = v13;
  id v17 = self;
  id v14 = v10;
  id v18 = v14;
  [v12 performBackgroundTask:v15];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)groupContext:(id)a3 fetchAllKnownGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v15 = _os_activity_create(&dword_1DD450000, "Fetch all known groups", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v15, &state);
  id v8 = [(ENGroupContextCoreDataCache *)self container];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DD4534C4;
  v11[3] = &unk_1E6CC4F60;
  v11[4] = self;
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v12 = v10;
  [v8 performBackgroundTask:v11];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end