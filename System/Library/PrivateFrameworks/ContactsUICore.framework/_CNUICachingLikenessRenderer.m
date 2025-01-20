@interface _CNUICachingLikenessRenderer
+ (id)_cacheKeyForContacts:(id)a3 scope:(id)a4;
+ (id)createMainThreadSchedulerProviderWithSchedulerProvider:(id)a3;
+ (id)descriptorForRequiredKeys;
- (BOOL)shouldRequireMainThread;
- (CNAvatarCacheChangeListener)changeHistoryListener;
- (CNSchedulerProvider)mainThreadSchedulerProvider;
- (CNSchedulerProvider)schedulerProvider;
- (NSPointerArray)delegates;
- (_CNUICachingLikenessRenderer)initWithLikenessRenderer:(id)a3 schedulerProvider:(id)a4;
- (_CNUICachingLikenessRenderer)initWithLikenessRenderer:(id)a3 schedulerProvider:(id)a4 capacity:(unint64_t)a5 shouldRequireMainThread:(BOOL)a6;
- (_CNUICachingLikenessRenderer)initWithLikenessRenderer:(id)a3 schedulerProvider:(id)a4 capacity:(unint64_t)a5 shouldRequireMainThread:(BOOL)a6 contactStore:(id)a7;
- (_CNUILikenessImageCache)imageCache;
- (_CNUILikenessRenderer)renderer;
- (id)initialRenderedLikenessesForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 workScheduler:(id)a6;
- (id)loadingPlaceholderForContactCount:(unint64_t)a3 scope:(id)a4;
- (id)renderedBasicMonogramForString:(id)a3 color:(id)a4 scope:(id)a5 prohibitedSources:(int64_t)a6;
- (id)renderedBasicMonogramFromString:(id)a3 scope:(id)a4;
- (id)renderedLikenessForBadge:(id)a3 scope:(id)a4 workScheduler:(id)a5;
- (id)renderedLikenessesForContacts:(id)a3 scope:(id)a4 workScheduler:(id)a5;
- (id)renderedLikenessesForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 workScheduler:(id)a6;
- (id)startCacheEntryWithObservable:(id)a3 contacts:(id)a4 scope:(id)a5;
- (unint64_t)lookupOptions;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)setChangeHistoryListener:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setLookupOptions:(unint64_t)a3;
- (void)setMainThreadSchedulerProvider:(id)a3;
- (void)updateContactsWithIdentifiers:(id)a3;
@end

@implementation _CNUICachingLikenessRenderer

- (id)renderedLikenessesForContacts:(id)a3 scope:(id)a4 workScheduler:(id)a5
{
  return [(_CNUICachingLikenessRenderer *)self renderedLikenessesForContacts:a3 withBadges:MEMORY[0x263EFFA68] scope:a4 workScheduler:a5];
}

- (id)renderedLikenessesForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 workScheduler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [[CNUILikenessFingerprint alloc] initWithContacts:v10 badges:v11 scope:v12 isResolutionIndependent:0];
  v15 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[_CNUICachingLikenessRenderer renderedLikenessesForContacts:withBadges:scope:workScheduler:]((uint64_t)v10, (uint64_t)v12, v15);
  }

  v16 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[_CNUICachingLikenessRenderer renderedLikenessesForContacts:withBadges:scope:workScheduler:]((uint64_t)v14, v16);
  }

  v17 = [(_CNUICachingLikenessRenderer *)self imageCache];
  v18 = [v17 lock];
  v26 = v14;
  v27 = v10;
  v28 = v12;
  v29 = v11;
  v30 = v13;
  id v19 = v13;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  v23 = v14;
  v24 = CNResultWithLock();

  return v24;
}

- (_CNUILikenessImageCache)imageCache
{
  return self->_imageCache;
}

- (id)startCacheEntryWithObservable:(id)a3 contacts:(id)a4 scope:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [_CNUICachingLikenessRendererReplaySubject alloc];
  id v12 = [(_CNUICachingLikenessRenderer *)self mainThreadSchedulerProvider];
  id v13 = [(CNReplaySubject *)v11 initWithCapacity:1 schedulerProvider:v12];

  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__6;
  id v22 = __Block_byref_object_dispose__6;
  id v23 = [v8 subscribe:v13];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77___CNUICachingLikenessRenderer_startCacheEntryWithObservable_contacts_scope___block_invoke;
  v17[3] = &unk_264017B98;
  v17[4] = &v18;
  v14 = [(_CNUICachingLikenessRendererReplaySubject *)v13 doOnTerminate:v17];
  v15 = +[CNUIRenderedLikenessCacheEntry entryWithObservable:v14 token:v19[5] contacts:v9 scope:v10];

  _Block_object_dispose(&v18, 8);
  return v15;
}

- (CNSchedulerProvider)mainThreadSchedulerProvider
{
  return self->_mainThreadSchedulerProvider;
}

- (id)initialRenderedLikenessesForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 workScheduler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(_CNUICachingLikenessRenderer *)self renderer];
  v15 = [v14 renderedLikenessesForContacts:v13 withBadges:v12 scope:v11 workScheduler:v10];

  return v15;
}

- (id)loadingPlaceholderForContactCount:(unint64_t)a3 scope:(id)a4
{
  id v6 = a4;
  v7 = [(_CNUICachingLikenessRenderer *)self renderer];
  id v8 = [v7 loadingPlaceholderForContactCount:a3 scope:v6];

  return v8;
}

- (_CNUILikenessRenderer)renderer
{
  return self->_renderer;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNUICachingLikenessRenderer *)self delegates];
  [v5 addPointer:v4];
}

- (NSPointerArray)delegates
{
  return self->_delegates;
}

+ (id)descriptorForRequiredKeys
{
  return +[_CNUILikenessRenderer descriptorForRequiredKeys];
}

- (_CNUICachingLikenessRenderer)initWithLikenessRenderer:(id)a3 schedulerProvider:(id)a4 capacity:(unint64_t)a5 shouldRequireMainThread:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = (objc_class *)MEMORY[0x263EFEA58];
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(v10);
  v14 = [(_CNUICachingLikenessRenderer *)self initWithLikenessRenderer:v12 schedulerProvider:v11 capacity:a5 shouldRequireMainThread:v6 contactStore:v13];

  return v14;
}

- (_CNUICachingLikenessRenderer)initWithLikenessRenderer:(id)a3 schedulerProvider:(id)a4 capacity:(unint64_t)a5 shouldRequireMainThread:(BOOL)a6 contactStore:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)_CNUICachingLikenessRenderer;
  v16 = [(_CNUICachingLikenessRenderer *)&v28 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_schedulerProvider, a4);
    uint64_t v18 = [(id)objc_opt_class() createMainThreadSchedulerProviderWithSchedulerProvider:v14];
    mainThreadSchedulerProvider = v17->_mainThreadSchedulerProvider;
    v17->_mainThreadSchedulerProvider = (CNSchedulerProvider *)v18;

    objc_storeStrong((id *)&v17->_renderer, a3);
    uint64_t v20 = [[_CNUILikenessImageCache alloc] initWithCapacity:a5 hasContactStore:v15 != 0];
    imageCache = v17->_imageCache;
    v17->_imageCache = v20;

    uint64_t v22 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    delegates = v17->_delegates;
    v17->_delegates = (NSPointerArray *)v22;

    v17->_shouldRequireMainThread = a6;
    if (v15)
    {
      v24 = [[CNAvatarCacheChangeListener alloc] initWithContactStore:v15 delegate:v17];
      changeHistoryListener = v17->_changeHistoryListener;
      v17->_changeHistoryListener = v24;

      [(CNAvatarCacheChangeListener *)v17->_changeHistoryListener start];
    }
    v26 = v17;
  }

  return v17;
}

+ (id)createMainThreadSchedulerProviderWithSchedulerProvider:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mainThreadScheduler];
  id v5 = objc_alloc(MEMORY[0x263F33668]);
  BOOL v6 = [v3 inlineScheduler];
  v7 = [v3 immediateScheduler];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87___CNUICachingLikenessRenderer_createMainThreadSchedulerProviderWithSchedulerProvider___block_invoke;
  v16[3] = &unk_264017E50;
  id v17 = v4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87___CNUICachingLikenessRenderer_createMainThreadSchedulerProviderWithSchedulerProvider___block_invoke_2;
  v14[3] = &unk_264017E50;
  id v15 = v3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87___CNUICachingLikenessRenderer_createMainThreadSchedulerProviderWithSchedulerProvider___block_invoke_3;
  v12[3] = &unk_2640186F0;
  id v13 = v15;
  id v8 = v15;
  id v9 = v4;
  id v10 = (void *)[v5 initWithBackgroundScheduler:v9 mainThreadScheduler:v9 inlineScheduler:v6 immediateScheduler:v7 serialSchedulerProvider:v16 synchronousSerialSchedulerProvider:v14 readerWriterSchedulerProvider:v12];

  return v10;
}

- (_CNUICachingLikenessRenderer)initWithLikenessRenderer:(id)a3 schedulerProvider:(id)a4
{
  return [(_CNUICachingLikenessRenderer *)self initWithLikenessRenderer:a3 schedulerProvider:a4 capacity:10 shouldRequireMainThread:1];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EFE118] object:0];

  v4.receiver = self;
  v4.super_class = (Class)_CNUICachingLikenessRenderer;
  [(_CNUICachingLikenessRenderer *)&v4 dealloc];
}

- (void)setLookupOptions:(unint64_t)a3
{
}

+ (id)_cacheKeyForContacts:(id)a3 scope:(id)a4
{
  return +[CNUILikenessFingerprint fingerprintForContacts:a3 scope:a4];
}

- (id)renderedLikenessForBadge:(id)a3 scope:(id)a4 workScheduler:(id)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [CNUILikenessFingerprint alloc];
  v26[0] = v8;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  id v13 = [(CNUILikenessFingerprint *)v11 initWithContacts:MEMORY[0x263EFFA68] badges:v12 scope:v9 isResolutionIndependent:0];

  id v14 = [(_CNUICachingLikenessRenderer *)self imageCache];
  id v15 = [v14 lock];
  uint64_t v22 = v13;
  id v23 = v8;
  v24 = v9;
  v25 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = v13;
  uint64_t v20 = CNResultWithLock();

  return v20;
}

- (id)renderedBasicMonogramFromString:(id)a3 scope:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_CNUICachingLikenessRenderer *)self renderer];
  id v9 = [v8 renderedBasicMonogramFromString:v7 scope:v6];

  return v9;
}

- (id)renderedBasicMonogramForString:(id)a3 color:(id)a4 scope:(id)a5 prohibitedSources:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = self;
  CNUnimplementedMethodException();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v13);
}

- (void)updateContactsWithIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(_CNUICachingLikenessRenderer *)self delegates];
    id v6 = (void *)[v5 copy];

    id v7 = [(_CNUICachingLikenessRenderer *)self imageCache];
    [v7 invalidateCacheEntriesContainingIdentifiers:v4];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v13, "avatarCacheDidUpdateForIdentifiers:", v4, (void)v14);
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v8 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B704000, v8, OS_LOG_TYPE_INFO, "No changes to process", buf, 2u);
    }
  }
}

- (unint64_t)lookupOptions
{
  return self->_lookupOptions;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (BOOL)shouldRequireMainThread
{
  return self->_shouldRequireMainThread;
}

- (void)setImageCache:(id)a3
{
}

- (void)setMainThreadSchedulerProvider:(id)a3
{
}

- (CNAvatarCacheChangeListener)changeHistoryListener
{
  return self->_changeHistoryListener;
}

- (void)setChangeHistoryListener:(id)a3
{
}

- (void)setDelegates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_changeHistoryListener, 0);
  objc_storeStrong((id *)&self->_mainThreadSchedulerProvider, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

- (void)renderedLikenessesForContacts:(uint64_t)a1 withBadges:(NSObject *)a2 scope:workScheduler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "[LikenessCachingRenderer] Cache key: %@", (uint8_t *)&v2, 0xCu);
}

- (void)renderedLikenessesForContacts:(os_log_t)log withBadges:scope:workScheduler:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_20B704000, log, OS_LOG_TYPE_DEBUG, "[LikenessCachingRenderer] New Request for %@, %@", (uint8_t *)&v3, 0x16u);
}

@end