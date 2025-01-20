@interface MURouteSnapshotManager
+ (id)cacheDirectory;
+ (id)sharedInstance;
- (MURouteSnapshotManager)init;
- (id)_optionsFromKey:(id)a3 route:(id)a4;
- (id)checkCacheForKey:(id)a3;
- (void)_generateSnapshotForRoute:(id)a3 key:(id)a4 completion:(id)a5;
- (void)getSnapshotForKey:(id)a3 route:(id)a4 completion:(id)a5;
- (void)purgeSnapshotsWithCompletionBlock:(id)a3;
@end

@implementation MURouteSnapshotManager

+ (id)cacheDirectory
{
  if (_MergedGlobals_119 != -1) {
    dispatch_once(&_MergedGlobals_119, &__block_literal_global_15);
  }
  v2 = (void *)qword_1EB4F7138;
  return v2;
}

void __40__MURouteSnapshotManager_cacheDirectory__block_invoke()
{
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  v1 = [v0 URLsForDirectory:13 inDomains:1];
  id v9 = [v1 firstObject];

  v2 = [v9 URLByAppendingPathComponent:@"RouteSnapshots"];
  uint64_t v3 = [v2 absoluteURL];
  v4 = (void *)qword_1EB4F7138;
  qword_1EB4F7138 = v3;

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [(id)qword_1EB4F7138 path];
  char v7 = [v5 fileExistsAtPath:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 createDirectoryAtURL:qword_1EB4F7138 withIntermediateDirectories:0 attributes:0 error:0];
  }
}

+ (id)sharedInstance
{
  if (qword_1EB4F7140 != -1) {
    dispatch_once(&qword_1EB4F7140, &__block_literal_global_12);
  }
  v2 = (void *)qword_1EB4F7148;
  return v2;
}

uint64_t __40__MURouteSnapshotManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = qword_1EB4F7148;
  qword_1EB4F7148 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MURouteSnapshotManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)MURouteSnapshotManager;
  v2 = [(MURouteSnapshotManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSCache *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MapsUI.MURouteSnapshotManager.work", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    pendingSnapshotters = v2->_pendingSnapshotters;
    v2->_pendingSnapshotters = (NSMutableArray *)v8;
  }
  return v2;
}

- (void)getSnapshotForKey:(id)a3 route:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = [(NSCache *)self->_cache objectForKey:v8];
  if (v19[5])
  {
    v10[2](v10, 0);
  }
  else
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke;
    block[3] = &unk_1E574FA88;
    v17 = &v18;
    id v13 = v8;
    v14 = self;
    v16 = v10;
    id v15 = v9;
    dispatch_async(workQueue, block);
  }
  _Block_object_dispose(&v18, 8);
}

void __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke(uint64_t a1)
{
  v2 = +[MURouteSnapshotManager cacheDirectory];
  uint64_t v3 = [*(id *)(a1 + 32) fileName];
  v4 = [v2 URLByAppendingPathComponent:v3];

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  dispatch_queue_t v6 = [v4 path];
  char v7 = [v5 contentsAtPath:v6];

  if (!v7) {
    goto LABEL_4;
  }
  id v8 = (void *)MEMORY[0x1E4FB1818];
  [*(id *)(a1 + 32) scale];
  uint64_t v9 = objc_msgSend(v8, "imageWithData:scale:", v7);
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  objc_super v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v12)
  {
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v12 forKey:*(void *)(a1 + 32)];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke_2;
    block[3] = &unk_1E574FA38;
    id v13 = *(id *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 64);
    id v24 = v13;
    uint64_t v25 = v14;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v15 = v24;
  }
  else
  {
LABEL_4:
    v17 = *(void **)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v18 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke_3;
    v19[3] = &unk_1E574FA60;
    v19[4] = v17;
    id v20 = v18;
    id v21 = v4;
    id v22 = *(id *)(a1 + 56);
    [v17 _generateSnapshotForRoute:v16 key:v20 completion:v19];

    id v15 = v20;
  }
}

uint64_t __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  dispatch_queue_t v6 = a3;
  char v7 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v6)
  {
    [v7 setObject:v6 forKey:*(void *)(a1 + 40)];
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = [*(id *)(a1 + 48) path];
    uint64_t v10 = UIImagePNGRepresentation(v6);
    [v8 createFileAtPath:v9 contents:v10 attributes:0];

    objc_super v11 = MUGetMURouteSnapshotManagerLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v12;
      id v13 = "got snapshot for key: %@";
      uint64_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
      uint32_t v16 = 12;
LABEL_6:
      _os_log_impl(&dword_1931EA000, v14, v15, v13, buf, v16);
    }
  }
  else
  {
    [v7 removeObjectForKey:*(void *)(a1 + 40)];
    v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v17 removeItemAtURL:*(void *)(a1 + 48) error:0];

    objc_super v11 = MUGetMURouteSnapshotManagerLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v18;
      __int16 v28 = 2114;
      id v29 = v5;
      id v13 = "Failed to generate image for key: %@, with error %{public}@";
      uint64_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 22;
      goto LABEL_6;
    }
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke_18;
  block[3] = &unk_1E574ECA8;
  id v19 = *(id *)(a1 + 56);
  id v24 = v6;
  id v25 = v19;
  id v23 = v5;
  id v20 = v6;
  id v21 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__MURouteSnapshotManager_getSnapshotForKey_route_completion___block_invoke_18(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_optionsFromKey:(id)a3 route:(id)a4
{
  v37[2] = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  id v5 = a4;
  id v6 = a3;
  _MKCartographicConfigurationForMapType();
  memset(v31, 0, sizeof(v31));
  uint64_t v32 = 0;
  char v7 = (void *)[objc_alloc(MEMORY[0x1E4F310D0]) initWithCartographicConfiguration:v31];
  [v7 setShowsHiking:1];
  [v7 setShowsTopographicFeatures:1];
  id v8 = objc_opt_new();
  [v8 setPreferredConfiguration:v7];
  [v6 width];
  double v10 = v9;
  [v6 height];
  objc_msgSend(v8, "setSize:", v10, v11);
  [v8 _setComposedRouteForRouteLine:v5];
  uint64_t v12 = [v5 boundingMapRegion];

  GEOMapRectForMapRegion();
  [v8 size];
  [v6 padding];
  uint64_t v29 = v13;
  uint64_t v30 = v14;
  uint64_t v27 = v15;
  uint64_t v28 = v16;
  _MKMapRectThatFits();
  objc_msgSend(v8, "setMapRect:", v27, v28, v29, v30);

  v17 = [MEMORY[0x1E4F30FE0] filterExcludingAllCategories];
  [v8 setPointOfInterestFilter:v17];

  [v8 _setShowsPointLabels:0];
  [v8 _setShowsAppleLogo:0];
  if ([v6 darkMode]) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 1;
  }
  id v19 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:v18];
  v37[0] = v19;
  id v20 = (void *)MEMORY[0x1E4FB1E20];
  [v6 scale];
  double v22 = v21;

  id v23 = [v20 traitCollectionWithDisplayScale:v22];
  v37[1] = v23;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];

  id v25 = [MEMORY[0x1E4FB1E20] traitCollectionWithTraitsFromCollections:v24];
  [v8 setTraitCollection:v25];

  return v8;
}

- (void)_generateSnapshotForRoute:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke;
  v14[3] = &unk_1E574FB00;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _optionsFromKey:*(void *)(a1 + 40) route:*(void *)(a1 + 48)];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F30F48]) initWithOptions:v2];
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:v3];
  v4 = MUGetMURouteSnapshotManagerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1931EA000, v4, OS_LOG_TYPE_INFO, "starting snapshot request for key: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke_26;
  v8[3] = &unk_1E574FAD8;
  v8[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 56);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v7 startWithCompletionHandler:v8];
}

void __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke_2;
  block[3] = &unk_1E574FAB0;
  id v8 = *(id *)(a1 + 48);
  id v14 = v6;
  id v15 = v5;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v18 = v8;
  uint64_t v16 = v9;
  id v17 = v10;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v7, block);
}

void __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [*(id *)(a1 + 40) image];
  id v5 = [v4 imageWithRenderingMode:1];
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v5);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke_3;
  v7[3] = &unk_1E574EE08;
  id v6 = *(void **)(a1 + 56);
  v7[4] = *(void *)(a1 + 48);
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __67__MURouteSnapshotManager__generateSnapshotForRoute_key_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (id)checkCacheForKey:(id)a3
{
  return [(NSCache *)self->_cache objectForKey:a3];
}

- (void)purgeSnapshotsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = MUGetMURouteSnapshotManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_INFO, "purging snapshots!", buf, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(NSMutableArray *)self->_pendingSnapshotters removeAllObjects];
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MURouteSnapshotManager_purgeSnapshotsWithCompletionBlock___block_invoke;
  v8[3] = &unk_1E574FB28;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_barrier_async(workQueue, v8);
}

void __60__MURouteSnapshotManager_purgeSnapshotsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MUGetMURouteSnapshotManagerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1931EA000, v2, OS_LOG_TYPE_INFO, "removing in-memory snapshots", buf, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  uint64_t v3 = MUGetMURouteSnapshotManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1931EA000, v3, OS_LOG_TYPE_INFO, "removing on-disk snapshots", buf, 2u);
  }

  id v4 = +[MURouteSnapshotManager cacheDirectory];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  [v5 removeItemAtURL:v4 error:&v14];
  id v6 = v14;

  id v7 = MUGetMURouteSnapshotManagerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_INFO, "re-creating on-disk snapshots directory, deleteError: %{public}@", buf, 0xCu);
  }

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  [v8 createDirectoryAtURL:v4 withIntermediateDirectories:0 attributes:0 error:&v13];
  id v9 = v13;

  id v10 = MUGetMURouteSnapshotManagerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v9;
    _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_INFO, "completed snapshot purge, createError: %{public}@", buf, 0xCu);
  }

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"MURouteSnapshotManagerDidPurgeNotification" object:*(void *)(a1 + 32)];

  id v12 = *(void **)(a1 + 40);
  if (v12) {
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSnapshotters, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end