@interface CNUIPRLikenessResolver
+ (id)_cacheKeyForContact:(id)a3;
+ (id)badgeCacheKeyForLikenessBadge:(id)a3;
+ (id)descriptorForRequiredKeys;
+ (unint64_t)maxContacts;
- (CNCache)likenessProviderCache;
- (CNCache)workTrackingCache;
- (CNContactStore)contactStore;
- (CNSchedulerProvider)mainThreadSchedulerProvider;
- (CNSchedulerProvider)schedulerProvider;
- (CNUIPRLikenessProvider)loadingPlaceholderLikeness;
- (CNUIPRLikenessResolver)initWithContactStore:(id)a3 scheduler:(id)a4;
- (CNUIPRLikenessResolver)initWithContactStore:(id)a3 scheduler:(id)a4 meMonitor:(id)a5;
- (CNUIPRLikenessResolver)initWithLikenessResolver:(id)a3;
- (CNUIPRLikenessResolver)initWithLikenessResolver:(id)a3 capacity:(unint64_t)a4;
- (CNUIPRLikenessResolver)initWithLikenessResolver:(id)a3 capacity:(unint64_t)a4 schedulerProvider:(id)a5;
- (CNUIPRLikenessResolver)likenessResolver;
- (CNUIPlaceholderProviderFactory)placeholderProviderFactory;
- (CNUnfairLock)lock;
- (id)badgeObservableWithLikenessBadge:(id)a3 workScheduler:(id)a4;
- (id)badgeWithLikenessBadge:(id)a3;
- (id)basicMonogramFromString:(id)a3 color:(id)a4;
- (id)basicMonogramObservableFromString:(id)a3 color:(id)a4;
- (id)likenessForContact:(id)a3 error:(id *)a4;
- (id)likenessForContact:(id)a3 options:(id)a4 error:(id *)a5;
- (id)likenessLookup;
- (id)likenessesForContact:(id)a3 options:(id)a4 workScheduler:(id)a5;
- (id)likenessesForContact:(id)a3 workScheduler:(id)a4;
- (id)likenessesForContacts:(id)a3 options:(id)a4 error:(id)a5;
- (id)resolveLikenessesForContacts:(id)a3 workScheduler:(id)a4 withContentHandler:(id)a5;
- (int64_t)prohibitedSources;
- (unint64_t)lookupOptions;
- (void)databaseChanged:(id)a3;
- (void)dealloc;
- (void)setLikenessProviderCache:(id)a3;
- (void)setLikenessResolver:(id)a3;
- (void)setLock:(id)a3;
- (void)setLookupOptions:(unint64_t)a3;
- (void)setMainThreadSchedulerProvider:(id)a3;
- (void)setPlaceholderProviderFactory:(id)a3;
- (void)setProhibitedSources:(int64_t)a3;
- (void)setWorkTrackingCache:(id)a3;
@end

@implementation CNUIPRLikenessResolver

id __78__CNUIPRLikenessResolver_initWithLikenessResolver_capacity_schedulerProvider___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)likenessesForContact:(id)a3 options:(id)a4 workScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CNUIPRLikenessResolver *)self likenessResolver];

  if (v11)
  {
    v12 = [(id)objc_opt_class() _cacheKeyForContact:v8];
    v13 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:].cold.4();
    }

    v14 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:]();
    }

    v15 = [(CNUIPRLikenessResolver *)self likenessProviderCache];
    v16 = [v15 objectForKey:v12];

    if (v16)
    {
      v17 = [MEMORY[0x263F33608] observableWithResult:v16];
    }
    else
    {
      v35 = v9;
      v18 = +[CNUICoreLogProvider likenesses_os_log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:]();
      }

      uint64_t v19 = [(CNUIPRLikenessResolver *)self mainThreadSchedulerProvider];
      v34 = [MEMORY[0x263F08C38] UUID];
      v33 = (void *)v19;
      v20 = [(CNReplaySubject *)[CNUIPRLikenessResolverReplaySubject alloc] initWithCapacity:1 schedulerProvider:v19];
      v32 = [(CNUIPRLikenessResolver *)self loadingPlaceholderLikeness];
      -[CNReplaySubject observerDidReceiveResult:](v20, "observerDidReceiveResult:");
      v21 = +[CNUICoreLogProvider likenesses_os_log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:]();
      }

      v22 = [(CNUIPRLikenessResolver *)self likenessProviderCache];
      v23 = [(CNUIPRLikenessResolver *)self workTrackingCache];
      v24 = [(CNUIPRLikenessResolver *)self lock];
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x2020000000;
      char v50 = 0;
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke;
      v39[3] = &unk_264017F10;
      v39[4] = self;
      id v40 = v8;
      id v41 = v35;
      v25 = v20;
      v42 = v25;
      id v31 = v22;
      id v43 = v31;
      id v44 = v12;
      id v26 = v24;
      id v45 = v26;
      id v27 = v23;
      id v46 = v27;
      id v28 = v34;
      id v47 = v28;
      v48 = v49;
      v29 = [v10 performCancelableBlock:v39];
      id v36 = v27;
      id v37 = v28;
      id v38 = v29;
      CNRunWithLock();
      v17 = v25;

      _Block_object_dispose(v49, 8);
      id v9 = v35;
    }
  }
  else
  {
    v17 = [MEMORY[0x263F33608] emptyObservable];
  }

  return v17;
}

- (CNCache)likenessProviderCache
{
  return self->_likenessProviderCache;
}

void __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) likenessResolver];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v11 = 0;
  v5 = [v2 likenessForContact:v3 options:v4 error:&v11];
  id v6 = v11;

  if (v5)
  {
    v7 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke_cold_2();
    }

    [*(id *)(a1 + 56) observerDidReceiveResult:v5];
    [*(id *)(a1 + 64) setObject:v5 forKeyedSubscript:*(void *)(a1 + 72)];
  }
  else if (v6)
  {
    id v8 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke_cold_1();
    }
  }
  id v9 = *(id *)(a1 + 88);
  id v10 = *(id *)(a1 + 96);
  CNRunWithLock();
}

- (CNCache)workTrackingCache
{
  return self->_workTrackingCache;
}

- (CNSchedulerProvider)mainThreadSchedulerProvider
{
  return self->_mainThreadSchedulerProvider;
}

- (CNUnfairLock)lock
{
  return self->_lock;
}

- (CNUIPRLikenessProvider)loadingPlaceholderLikeness
{
  v2 = [(CNUIPRLikenessResolver *)self likenessResolver];
  uint64_t v3 = [v2 loadingPlaceholderLikeness];

  return (CNUIPRLikenessProvider *)v3;
}

- (CNUIPRLikenessResolver)likenessResolver
{
  return self->_likenessResolver;
}

+ (id)_cacheKeyForContact:(id)a3
{
  return +[CNUILikenessFingerprint fingerprintForContact:a3];
}

+ (unint64_t)maxContacts
{
  if (+[CNUISnowglobeUtilities enableGroupPhoto]) {
    return 7;
  }
  else {
    return 2;
  }
}

uint64_t __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24)) {
    return [*(id *)(result + 32) setObject:*(void *)(result + 48) forKeyedSubscript:*(void *)(result + 40)];
  }
  return result;
}

uint64_t __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke_39(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

+ (id)descriptorForRequiredKeys
{
  return +[CNUIPRLikenessLookup descriptorForRequiredKeys];
}

- (CNUIPRLikenessResolver)initWithLikenessResolver:(id)a3
{
  return [(CNUIPRLikenessResolver *)self initWithLikenessResolver:a3 capacity:5];
}

- (CNUIPlaceholderProviderFactory)placeholderProviderFactory
{
  return self->_placeholderProviderFactory;
}

- (CNUIPRLikenessResolver)initWithLikenessResolver:(id)a3 capacity:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x263F33668];
  id v7 = a3;
  id v8 = [v6 defaultProvider];
  id v9 = [(CNUIPRLikenessResolver *)self initWithLikenessResolver:v7 capacity:a4 schedulerProvider:v8];

  return v9;
}

- (CNUIPRLikenessResolver)initWithLikenessResolver:(id)a3 capacity:(unint64_t)a4 schedulerProvider:(id)a5
{
  v45[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  v44.receiver = self;
  v44.super_class = (Class)CNUIPRLikenessResolver;
  id v11 = [(CNUIPRLikenessResolver *)&v44 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_likenessResolver, a3);
    uint64_t v13 = [MEMORY[0x263F33568] atomicCache];
    workTrackingCache = v12->_workTrackingCache;
    v12->_workTrackingCache = (CNCache *)v13;

    v15 = (CNUnfairLock *)objc_alloc_init(MEMORY[0x263F33690]);
    lock = v12->_lock;
    v12->_lock = v15;

    id v17 = objc_alloc(MEMORY[0x263F33568]);
    v18 = [MEMORY[0x263F33568] boundingStrategyWithCapacity:a4];
    v45[0] = v18;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
    v20 = [MEMORY[0x263F33568] atomicCacheScheduler];
    uint64_t v21 = [v17 initWithBoundingStrategies:v19 resourceScheduler:v20];
    likenessProviderCache = v12->_likenessProviderCache;
    v12->_likenessProviderCache = (CNCache *)v21;

    uint64_t v23 = [v9 placeholderProviderFactory];
    placeholderProviderFactory = v12->_placeholderProviderFactory;
    v12->_placeholderProviderFactory = (CNUIPlaceholderProviderFactory *)v23;

    v25 = [v10 mainThreadScheduler];
    id v26 = (void *)[v10 newSynchronousSerialSchedulerWithName:@"com.apple.contacts.ContactsUICore._CNUIPRLikenessCachingResolver"];
    id v27 = [v10 immediateScheduler];
    id v28 = objc_alloc(MEMORY[0x263F33668]);
    id v41 = v26;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __78__CNUIPRLikenessResolver_initWithLikenessResolver_capacity_schedulerProvider___block_invoke;
    v42[3] = &unk_264017E50;
    id v43 = v25;
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    v39 = __78__CNUIPRLikenessResolver_initWithLikenessResolver_capacity_schedulerProvider___block_invoke_2;
    id v40 = &unk_264017E50;
    id v29 = v26;
    id v30 = v25;
    uint64_t v31 = [v28 initWithBackgroundScheduler:v30 mainThreadScheduler:v30 immediateScheduler:v27 serialSchedulerProvider:v42 synchronousSerialSchedulerProvider:&v37 readerWriterSchedulerProvider:&__block_literal_global_24];
    mainThreadSchedulerProvider = v12->_mainThreadSchedulerProvider;
    v12->_mainThreadSchedulerProvider = (CNSchedulerProvider *)v31;

    v33 = objc_msgSend(MEMORY[0x263F335C8], "currentEnvironment", v37, v38, v39, v40);
    v34 = [v33 notificationCenter];
    [v34 addObserver:v12 selector:sel_databaseChanged_ name:*MEMORY[0x263EFE118] object:0];

    v35 = v12;
  }

  return v12;
}

- (CNContactStore)contactStore
{
  v2 = [(CNUIPRLikenessResolver *)self likenessLookup];
  uint64_t v3 = [v2 contactStore];

  return (CNContactStore *)v3;
}

- (id)likenessLookup
{
  objc_opt_class();
  uint64_t v3 = [(CNUIPRLikenessResolver *)self likenessResolver];
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

id __78__CNUIPRLikenessResolver_initWithLikenessResolver_capacity_schedulerProvider___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __78__CNUIPRLikenessResolver_initWithLikenessResolver_capacity_schedulerProvider___block_invoke_3()
{
  id v0 = objc_alloc_init(MEMORY[0x263F33648]);
  return v0;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F335C8] currentEnvironment];
  uint64_t v4 = [v3 notificationCenter];
  [v4 removeObserver:self name:*MEMORY[0x263EFE118] object:0];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(CNUIPRLikenessResolver *)self workTrackingCache];
  id v6 = [v5 allObjects];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) cancel];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  v11.receiver = self;
  v11.super_class = (Class)CNUIPRLikenessResolver;
  [(CNUIPRLikenessResolver *)&v11 dealloc];
}

- (void)databaseChanged:(id)a3
{
}

- (void)setLookupOptions:(unint64_t)a3
{
}

- (id)resolveLikenessesForContacts:(id)a3 workScheduler:(id)a4 withContentHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  objc_super v11 = +[CNUICoreLogProvider likenesses_os_log];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  long long v13 = +[CNUICoreLogProvider likenesses_os_log];
  long long v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20B704000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Resolve Likeness", "", buf, 2u);
  }

  long long v15 = objc_msgSend(v10, "_cn_take:", +[CNUIPRLikenessResolver maxContacts](CNUIPRLikenessResolver, "maxContacts"));

  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __88__CNUIPRLikenessResolver_resolveLikenessesForContacts_workScheduler_withContentHandler___block_invoke;
  v32[3] = &unk_264017E98;
  v32[4] = self;
  id v33 = v8;
  id v16 = v8;
  uint64_t v17 = objc_msgSend(v15, "_cn_map:", v32);

  v18 = (void *)MEMORY[0x263F33608];
  uint64_t v19 = [(CNUIPRLikenessResolver *)self mainThreadSchedulerProvider];
  v20 = [v18 combineLatest:v17 resultScheduler:v16 schedulerProvider:v19];
  uint64_t v21 = (void *)MEMORY[0x263F33610];
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  id v28 = __88__CNUIPRLikenessResolver_resolveLikenessesForContacts_workScheduler_withContentHandler___block_invoke_2;
  id v29 = &unk_264017EC0;
  id v30 = v9;
  os_signpost_id_t v31 = v12;
  id v22 = v9;
  uint64_t v23 = [v21 observerWithResultBlock:&v26];
  v24 = objc_msgSend(v20, "subscribe:", v23, v26, v27, v28, v29);

  return v24;
}

uint64_t __88__CNUIPRLikenessResolver_resolveLikenessesForContacts_workScheduler_withContentHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) likenessesForContact:a2 workScheduler:*(void *)(a1 + 40)];
}

void __88__CNUIPRLikenessResolver_resolveLikenessesForContacts_workScheduler_withContentHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[CNUICoreLogProvider likenesses_os_log];
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_20B704000, v5, OS_SIGNPOST_INTERVAL_END, v6, "Resolve Likeness", "", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)likenessesForContact:(id)a3 workScheduler:(id)a4
{
  return [(CNUIPRLikenessResolver *)self likenessesForContact:a3 options:0 workScheduler:a4];
}

- (id)basicMonogramObservableFromString:(id)a3 color:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNUIPRLikenessResolver *)self likenessResolver];
  id v9 = [v8 basicMonogramObservableFromString:v7 color:v6];

  return v9;
}

- (id)badgeObservableWithLikenessBadge:(id)a3 workScheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNUIPRLikenessResolver *)self likenessResolver];

  if (v8)
  {
    id v9 = [(id)objc_opt_class() badgeCacheKeyForLikenessBadge:v6];
    id v10 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CNUIPRLikenessResolver badgeObservableWithLikenessBadge:workScheduler:].cold.4();
    }

    objc_super v11 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CNUIPRLikenessResolver badgeObservableWithLikenessBadge:workScheduler:]();
    }

    os_signpost_id_t v12 = [(CNUIPRLikenessResolver *)self likenessProviderCache];
    long long v13 = [v12 objectForKey:v9];

    if (v13)
    {
      long long v14 = [MEMORY[0x263F33608] observableWithResult:v13];
    }
    else
    {
      long long v15 = +[CNUICoreLogProvider likenesses_os_log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[CNUIPRLikenessResolver badgeObservableWithLikenessBadge:workScheduler:]();
      }

      uint64_t v16 = [(CNUIPRLikenessResolver *)self mainThreadSchedulerProvider];
      os_signpost_id_t v31 = [MEMORY[0x263F08C38] UUID];
      id v30 = (void *)v16;
      uint64_t v17 = [(CNReplaySubject *)[CNUIPRLikenessResolverReplaySubject alloc] initWithCapacity:1 schedulerProvider:v16];
      id v29 = [(CNUIPRLikenessResolver *)self loadingPlaceholderLikeness];
      -[CNReplaySubject observerDidReceiveResult:](v17, "observerDidReceiveResult:");
      v18 = +[CNUICoreLogProvider likenesses_os_log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:]();
      }

      uint64_t v19 = [(CNUIPRLikenessResolver *)self likenessProviderCache];
      v20 = [(CNUIPRLikenessResolver *)self workTrackingCache];
      uint64_t v21 = [(CNUIPRLikenessResolver *)self lock];
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x2020000000;
      char v45 = 0;
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __73__CNUIPRLikenessResolver_badgeObservableWithLikenessBadge_workScheduler___block_invoke;
      v35[3] = &unk_264017F60;
      v35[4] = self;
      id v36 = v6;
      id v37 = v9;
      id v22 = v17;
      uint64_t v38 = v22;
      id v28 = v19;
      id v39 = v28;
      id v23 = v21;
      id v40 = v23;
      id v24 = v20;
      id v41 = v24;
      id v25 = v31;
      id v42 = v25;
      id v43 = v44;
      uint64_t v26 = [v7 performCancelableBlock:v35];
      id v32 = v24;
      id v33 = v25;
      id v34 = v26;
      CNRunWithLock();
      long long v14 = v22;

      _Block_object_dispose(v44, 8);
    }
  }
  else
  {
    long long v14 = [MEMORY[0x263F33608] emptyObservable];
  }

  return v14;
}

void __73__CNUIPRLikenessResolver_badgeObservableWithLikenessBadge_workScheduler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) likenessResolver];
  id v3 = [v2 badgeWithLikenessBadge:*(void *)(a1 + 40)];

  uint64_t v4 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __73__CNUIPRLikenessResolver_badgeObservableWithLikenessBadge_workScheduler___block_invoke_cold_1();
  }

  [*(id *)(a1 + 56) observerDidReceiveResult:v3];
  [*(id *)(a1 + 64) setObject:v3 forKeyedSubscript:*(void *)(a1 + 48)];
  id v5 = *(id *)(a1 + 80);
  id v6 = *(id *)(a1 + 88);
  CNRunWithLock();
}

uint64_t __73__CNUIPRLikenessResolver_badgeObservableWithLikenessBadge_workScheduler___block_invoke_43(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

uint64_t __73__CNUIPRLikenessResolver_badgeObservableWithLikenessBadge_workScheduler___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24)) {
    return [*(id *)(result + 32) setObject:*(void *)(result + 48) forKeyedSubscript:*(void *)(result + 40)];
  }
  return result;
}

+ (id)badgeCacheKeyForLikenessBadge:(id)a3
{
  id v3 = NSString;
  uint64_t v4 = [a3 imageData];
  id v5 = objc_msgSend(v4, "_cn_md5Hash");
  id v6 = objc_msgSend(v5, "_cn_hexString");
  id v7 = [v3 stringWithFormat:@"Badge-%@", v6];

  return v7;
}

- (id)badgeWithLikenessBadge:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() badgeCacheKeyForLikenessBadge:v4];
  id v6 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CNUIPRLikenessResolver badgeWithLikenessBadge:]();
  }

  id v7 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CNUIPRLikenessResolver badgeObservableWithLikenessBadge:workScheduler:]();
  }

  id v8 = [(CNUIPRLikenessResolver *)self likenessProviderCache];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__CNUIPRLikenessResolver_badgeWithLikenessBadge___block_invoke;
  v13[3] = &unk_264017F88;
  id v14 = v5;
  long long v15 = self;
  id v16 = v4;
  id v9 = v4;
  id v10 = v5;
  objc_super v11 = [v8 objectForKey:v10 onCacheMiss:v13];

  return v11;
}

id __49__CNUIPRLikenessResolver_badgeWithLikenessBadge___block_invoke(uint64_t a1)
{
  v2 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __49__CNUIPRLikenessResolver_badgeWithLikenessBadge___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 40) likenessResolver];
  id v4 = [v3 badgeWithLikenessBadge:*(void *)(a1 + 48)];

  return v4;
}

- (id)basicMonogramFromString:(id)a3 color:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNUIPRLikenessResolver *)self likenessResolver];
  id v9 = [v8 basicMonogramFromString:v7 color:v6];

  return v9;
}

- (id)likenessForContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CNUIPRLikenessResolver *)self likenessResolver];
  id v8 = [v7 likenessForContact:v6 options:0 error:a4];

  return v8;
}

- (id)likenessForContact:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(id)objc_opt_class() _cacheKeyForContact:v8];
  objc_super v11 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CNUIPRLikenessResolver likenessForContact:options:error:]();
  }

  os_signpost_id_t v12 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CNUIPRLikenessResolver likenessesForContact:options:workScheduler:]();
  }

  long long v13 = [(CNUIPRLikenessResolver *)self likenessProviderCache];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __59__CNUIPRLikenessResolver_likenessForContact_options_error___block_invoke;
  v19[3] = &unk_264017FB0;
  id v20 = v10;
  uint64_t v21 = self;
  id v22 = v8;
  id v23 = v9;
  id v24 = a5;
  id v14 = v9;
  id v15 = v8;
  id v16 = v10;
  uint64_t v17 = [v13 objectForKey:v16 onCacheMiss:v19];

  return v17;
}

id __59__CNUIPRLikenessResolver_likenessForContact_options_error___block_invoke(uint64_t a1)
{
  v2 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __59__CNUIPRLikenessResolver_likenessForContact_options_error___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 40) likenessResolver];
  id v4 = [v3 likenessForContact:*(void *)(a1 + 48) options:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];

  return v4;
}

- (id)likenessesForContacts:(id)a3 options:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_msgSend(v8, "_cn_take:", +[CNUIPRLikenessResolver maxContacts](CNUIPRLikenessResolver, "maxContacts"));

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__CNUIPRLikenessResolver_likenessesForContacts_options_error___block_invoke;
  v13[3] = &unk_264017E98;
  void v13[4] = self;
  id v14 = v7;
  id v10 = v7;
  objc_super v11 = objc_msgSend(v9, "_cn_map:", v13);

  return v11;
}

uint64_t __62__CNUIPRLikenessResolver_likenessesForContacts_options_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) likenessForContact:a2 options:*(void *)(a1 + 40) error:0];
}

- (void)setProhibitedSources:(int64_t)a3
{
  id v4 = [(CNUIPRLikenessResolver *)self likenessLookup];
  [v4 setProhibitedSources:a3];
}

- (int64_t)prohibitedSources
{
  v2 = [(CNUIPRLikenessResolver *)self likenessLookup];
  int64_t v3 = [v2 prohibitedSources];

  return v3;
}

- (void)setPlaceholderProviderFactory:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderProviderFactory, a3);
  id v5 = a3;
  id v6 = [(CNUIPRLikenessResolver *)self likenessLookup];
  [v6 setPlaceholderProviderFactory:v5];
}

- (CNSchedulerProvider)schedulerProvider
{
  v2 = [(CNUIPRLikenessResolver *)self likenessLookup];
  int64_t v3 = [v2 schedulerProvider];

  return (CNSchedulerProvider *)v3;
}

- (CNUIPRLikenessResolver)initWithContactStore:(id)a3 scheduler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CNUIPRLikenessLookup alloc] initWithContactStore:v7 scheduler:v6];

  id v9 = [(CNUIPRLikenessResolver *)self initWithLikenessResolver:v8];
  return v9;
}

- (CNUIPRLikenessResolver)initWithContactStore:(id)a3 scheduler:(id)a4 meMonitor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = [[CNUIPRLikenessLookup alloc] initWithContactStore:v10 scheduler:v9 meMonitor:v8];

  os_signpost_id_t v12 = [(CNUIPRLikenessResolver *)self initWithLikenessResolver:v11];
  return v12;
}

- (unint64_t)lookupOptions
{
  return self->_lookupOptions;
}

- (void)setLikenessResolver:(id)a3
{
}

- (void)setLikenessProviderCache:(id)a3
{
}

- (void)setMainThreadSchedulerProvider:(id)a3
{
}

- (void)setWorkTrackingCache:(id)a3
{
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_workTrackingCache, 0);
  objc_storeStrong((id *)&self->_placeholderProviderFactory, 0);
  objc_storeStrong((id *)&self->_mainThreadSchedulerProvider, 0);
  objc_storeStrong((id *)&self->_likenessProviderCache, 0);
  objc_storeStrong((id *)&self->_likenessResolver, 0);
}

- (void)likenessesForContact:options:workScheduler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessCache] Placeholder in position", v2, v3, v4, v5, v6);
}

- (void)likenessesForContact:options:workScheduler:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "[LikenessCache] Cache miss for %{private}@", v2, v3, v4, v5, v6);
}

- (void)likenessesForContact:options:workScheduler:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "[LikenessCache] Cache key: %{private}@", v2, v3, v4, v5, v6);
}

- (void)likenessesForContact:options:workScheduler:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "[LikenessCache] New Request for %{private}@", v2, v3, v4, v5, v6);
}

void __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_20B704000, v0, OS_LOG_TYPE_ERROR, "[LikenessCache] Error in fetching new image: %@", v1, 0xCu);
}

void __69__CNUIPRLikenessResolver_likenessesForContact_options_workScheduler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "[LikenessCache] Received new image for %{private}@", v2, v3, v4, v5, v6);
}

- (void)badgeObservableWithLikenessBadge:workScheduler:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "[LikenessCache] Cache miss for badge with key %@", v2, v3, v4, v5, v6);
}

- (void)badgeObservableWithLikenessBadge:workScheduler:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "[LikenessCache] Cache key: %@", v2, v3, v4, v5, v6);
}

- (void)badgeObservableWithLikenessBadge:workScheduler:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessCache] New Request for badge", v2, v3, v4, v5, v6);
}

void __73__CNUIPRLikenessResolver_badgeObservableWithLikenessBadge_workScheduler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "[LikenessCache] Received new image for badge with key %@", v2, v3, v4, v5, v6);
}

- (void)badgeWithLikenessBadge:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessCache] New synchronous request for badge", v2, v3, v4, v5, v6);
}

void __49__CNUIPRLikenessResolver_badgeWithLikenessBadge___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "[LikenessCache] synchronous cache miss for badge with key %@", v2, v3, v4, v5, v6);
}

- (void)likenessForContact:options:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "[LikenessCache] New synchronous request for %{private}@", v2, v3, v4, v5, v6);
}

void __59__CNUIPRLikenessResolver_likenessForContact_options_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "[LikenessCache] synchronous cache miss for contact with key %{private}@", v2, v3, v4, v5, v6);
}

@end