@interface _MPArtworkDataSourceURLCache
- (_MPArtworkDataSourceURLCache)initWithMemoryCapacity:(unint64_t)a3 diskCapacity:(unint64_t)a4 diskPath:(id)a5;
- (void)setRepresentationSize:(CGSize)a3 forRequest:(id)a4;
- (void)storeCachedResponse:(id)a3 forRequest:(id)a4;
@end

@implementation _MPArtworkDataSourceURLCache

- (_MPArtworkDataSourceURLCache)initWithMemoryCapacity:(unint64_t)a3 diskCapacity:(unint64_t)a4 diskPath:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)_MPArtworkDataSourceURLCache;
  v5 = [(NSURLCache *)&v11 initWithMemoryCapacity:a3 diskCapacity:a4 diskPath:a5];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    requestSizeMap = v5->_requestSizeMap;
    v5->_requestSizeMap = (NSMapTable *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaplayer.MPArtworkDataSourceURLCache.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v8;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_requestSizeMap, 0);
}

- (void)setRepresentationSize:(CGSize)a3 forRequest:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65___MPArtworkDataSourceURLCache_setRepresentationSize_forRequest___block_invoke;
  v10[3] = &unk_1E57F8DF8;
  CGFloat v12 = width;
  CGFloat v13 = height;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_barrier_async(accessQueue, v10);
}

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [v6 userInfo];
  id v9 = (void *)[v8 mutableCopy];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  CGFloat v12 = v11;

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__20188;
  v29 = __Block_byref_object_dispose__20189;
  id v30 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___MPArtworkDataSourceURLCache_storeCachedResponse_forRequest___block_invoke;
  block[3] = &unk_1E57F9F48;
  v24 = &v25;
  block[4] = self;
  id v14 = v7;
  id v23 = v14;
  dispatch_sync(accessQueue, block);
  if (![(id)v26[5] length])
  {
    v15 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v14;
      _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_ERROR, "[MPArtwork] Asked to cache response for %{public}@, but no size was set.", buf, 0xCu);
    }

    v16 = (void *)v26[5];
    v26[5] = @"{-1,-1}";
  }
  [v12 setObject:v26[5] forKeyedSubscript:@"representationSize"];
  id v17 = objc_alloc(MEMORY[0x1E4F28B70]);
  v18 = [v6 response];
  v19 = [v6 data];
  v20 = (void *)[v17 initWithResponse:v18 data:v19 userInfo:v12 storagePolicy:0];

  v21.receiver = self;
  v21.super_class = (Class)_MPArtworkDataSourceURLCache;
  [(NSURLCache *)&v21 storeCachedResponse:v20 forRequest:v14];

  _Block_object_dispose(&v25, 8);
}

@end