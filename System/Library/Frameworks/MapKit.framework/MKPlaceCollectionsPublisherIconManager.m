@interface MKPlaceCollectionsPublisherIconManager
+ (id)sharedInstance;
- (MKPlaceCollectionsPublisherIconManager)init;
- (NSCache)publisherIconCache;
- (id)_iconForPublisherNamed:(id)a3 usingId:(unsigned int)a4 usingContentScale:(double)a5 usingSizeGroup:(unint64_t)a6 isNightMode:(BOOL)a7;
- (id)iconForPublisherNamed:(id)a3 usingId:(unsigned int)a4 usingContentScale:(double)a5 usingSizeGroup:(unint64_t)a6 isNightMode:(BOOL)a7;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)iconForPublisherNamed:(id)a3 usingId:(unsigned int)a4 contentScale:(double)a5 onCompletion:(id)a6;
- (void)setPublisherIconCache:(id)a3;
@end

@implementation MKPlaceCollectionsPublisherIconManager

void __98__MKPlaceCollectionsPublisherIconManager_iconForPublisherNamed_usingId_contentScale_onCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained _iconForPublisherNamed:*(void *)(a1 + 32) usingId:*(unsigned int *)(a1 + 64) usingContentScale:1 usingSizeGroup:0 isNightMode:*(double *)(a1 + 56)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_iconForPublisherNamed:(id)a3 usingId:(unsigned int)a4 usingContentScale:(double)a5 usingSizeGroup:(unint64_t)a6 isNightMode:(BOOL)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"Logo: %d. Size:%lu", v9, a6);
  v13 = [(NSCache *)self->_publisherIconCache objectForKey:v12];
  v14 = MKGetCuratedCollectionsLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v15)
    {
      v16 = [v13 publisherImage];
      v17 = [v16 description];
      *(_DWORD *)buf = 138412290;
      v27 = v17;
      _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_DEBUG, "[✔]Publisher Icon Cache Hit. Returning image:%@", buf, 0xCu);
    }
    v18 = [v13 publisherImage];
  }
  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_DEBUG, "[X]Publisher Icon Cache Miss. Fetching image from icon pack.", buf, 2u);
    }

    v19 = +[MKIconManager imageForIconID:v9 contentScale:a6 sizeGroup:0 nightMode:a5];
    [v19 setAccessibilityLabel:v11];
    id v20 = [[MKPublisherIcon alloc] initUsingName:v11 andImage:v19];
    v21 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = [v20 publisherImage];
      v23 = [v22 description];
      *(_DWORD *)buf = 138412290;
      v27 = v23;
      _os_log_impl(&dword_18BAEC000, v21, OS_LOG_TYPE_DEBUG, "[✔]Publisher Icon Cache Updated. Returning image:%@", buf, 0xCu);
    }
    v24 = [(MKPlaceCollectionsPublisherIconManager *)self publisherIconCache];
    [v24 setObject:v20 forKey:v12];

    v18 = [v20 publisherImage];
  }

  return v18;
}

- (NSCache)publisherIconCache
{
  return self->_publisherIconCache;
}

- (void)iconForPublisherNamed:(id)a3 usingId:(unsigned int)a4 contentScale:(double)a5 onCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  objc_initWeak(&location, self);
  publisherLogoImageQueue = self->_publisherLogoImageQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__MKPlaceCollectionsPublisherIconManager_iconForPublisherNamed_usingId_contentScale_onCompletion___block_invoke;
  v15[3] = &unk_1E54BED98;
  objc_copyWeak(v18, &location);
  unsigned int v19 = a4;
  v18[1] = *(id *)&a5;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(publisherLogoImageQueue, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

+ (id)sharedInstance
{
  if (qword_1EB316158 != -1) {
    dispatch_once(&qword_1EB316158, &__block_literal_global_94);
  }
  v2 = (void *)_MergedGlobals_168;

  return v2;
}

void __56__MKPlaceCollectionsPublisherIconManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MKPlaceCollectionsPublisherIconManager);
  v1 = (void *)_MergedGlobals_168;
  _MergedGlobals_168 = (uint64_t)v0;
}

- (MKPlaceCollectionsPublisherIconManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)MKPlaceCollectionsPublisherIconManager;
  v2 = [(MKPlaceCollectionsPublisherIconManager *)&v9 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MapKit.MKPlaceCollectionsPublisherIconManager", v3);
    publisherLogoImageQueue = v2->_publisherLogoImageQueue;
    v2->_publisherLogoImageQueue = (OS_dispatch_queue *)v4;

    v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    publisherIconCache = v2->_publisherIconCache;
    v2->_publisherIconCache = v6;

    [(NSCache *)v2->_publisherIconCache setDelegate:v2];
    [(NSCache *)v2->_publisherIconCache setEvictsObjectsWhenApplicationEntersBackground:0];
    [(NSCache *)v2->_publisherIconCache setCountLimit:50];
  }
  return v2;
}

- (id)iconForPublisherNamed:(id)a3 usingId:(unsigned int)a4 usingContentScale:(double)a5 usingSizeGroup:(unint64_t)a6 isNightMode:(BOOL)a7
{
  id v12 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__23;
  uint64_t v28 = __Block_byref_object_dispose__23;
  id v29 = 0;
  objc_initWeak(&location, self);
  publisherLogoImageQueue = self->_publisherLogoImageQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__MKPlaceCollectionsPublisherIconManager_iconForPublisherNamed_usingId_usingContentScale_usingSizeGroup_isNightMode___block_invoke;
  block[3] = &unk_1E54BEDC0;
  unsigned int v19 = &v24;
  objc_copyWeak(v20, &location);
  id v18 = v12;
  unsigned int v21 = a4;
  v20[1] = *(id *)&a5;
  v20[2] = (id)a6;
  BOOL v22 = a7;
  id v14 = v12;
  dispatch_sync(publisherLogoImageQueue, block);
  id v15 = (id)v25[5];

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __117__MKPlaceCollectionsPublisherIconManager_iconForPublisherNamed_usingId_usingContentScale_usingSizeGroup_isNightMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained _iconForPublisherNamed:*(void *)(a1 + 32) usingId:*(unsigned int *)(a1 + 72) usingContentScale:*(void *)(a1 + 64) usingSizeGroup:*(unsigned __int8 *)(a1 + 76) isNightMode:*(double *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = MKGetCuratedCollectionsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_DEBUG, "[!]Publisher Cache is evicting: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)setPublisherIconCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherIconCache, 0);

  objc_storeStrong((id *)&self->_publisherLogoImageQueue, 0);
}

@end