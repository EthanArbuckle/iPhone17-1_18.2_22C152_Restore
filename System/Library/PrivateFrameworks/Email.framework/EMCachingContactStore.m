@interface EMCachingContactStore
+ (OS_os_log)signpostLog;
+ (id)log;
- (BOOL)contactExistsForEmailAddress:(id)a3;
- (CNContactStore)cnStore;
- (EFFuture)emailAddressCacheFuture;
- (EFLazyCache)displayNameCache;
- (EFScheduler)addressCacheScheduler;
- (EMCachingContactStore)init;
- (EMCachingContactStore)initWithOptions:(unint64_t)a3;
- (EMCachingContactStore)initWithStore:(id)a3 options:(unint64_t)a4;
- (id)_fetchDisplayNameForEmailAddress:(id)a3 abbreviated:(BOOL)a4;
- (id)displayNameForEmailAddress:(id)a3;
- (id)displayNameForEmailAddress:(id)a3 abbreviated:(BOOL)a4;
- (id)initForTestingWithStore:(id)a3 options:(unint64_t)a4 emailAddressCache:(id)a5;
- (unint64_t)options;
- (unint64_t)signpostID;
- (void)_commonInitWithStore:(id)a3 options:(unint64_t)a4 emailAddressCache:(id)a5;
- (void)_invalidateDisplayNameCache;
- (void)_invalidateEmailAddressCache;
- (void)_scheduleEmailAddressCachePopulation;
- (void)setAddressCacheScheduler:(id)a3;
- (void)setDisplayNameCache:(id)a3;
- (void)setEmailAddressCacheFuture:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation EMCachingContactStore

- (EMCachingContactStore)init
{
  return [(EMCachingContactStore *)self initWithOptions:1];
}

- (EMCachingContactStore)initWithOptions:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v6 = [(EMCachingContactStore *)self initWithStore:v5 options:a3];

  return v6;
}

- (EMCachingContactStore)initWithStore:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EMCachingContactStore;
  v7 = [(EMCachingContactStore *)&v10 init];
  v8 = v7;
  if (v7) {
    [(EMCachingContactStore *)v7 _commonInitWithStore:v6 options:a4 emailAddressCache:0];
  }

  return v8;
}

void __61__EMCachingContactStore__scheduleEmailAddressCachePopulation__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F60E18] promise];
  v3 = [*(id *)(a1 + 32) emailAddressCacheFuture];
  v4 = [v3 resultIfAvailable];

  if (v4)
  {
    id v5 = +[EMCachingContactStore log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = v6;
      _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "[Email Address Cache] %lld: Population request already fulfilled", buf, 0xCu);
    }
  }
  else
  {
    v7 = [v2 future];
    [*(id *)(a1 + 32) setEmailAddressCacheFuture:v7];

    v8 = +[EMCachingContactStore signpostLog];
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, (const void *)[NSNumber numberWithInteger:_scheduleEmailAddressCachePopulation_cacheRequestCount]);

    objc_super v10 = +[EMCachingContactStore signpostLog];
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Begin populating email address cache", "", buf, 2u);
    }

    v12 = [*(id *)(a1 + 32) cnStore];
    id v21 = 0;
    v13 = [v12 allContactEmailAddressesWithError:&v21];
    id v5 = v21;

    v14 = +[EMCachingContactStore signpostLog];
    v15 = v14;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v15, OS_SIGNPOST_INTERVAL_END, v9, "Finish populating email address cache", "", buf, 2u);
    }

    if (v5)
    {
      v16 = +[EMCachingContactStore log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        v18 = [v5 ef_publicDescription];
        __61__EMCachingContactStore__scheduleEmailAddressCachePopulation__block_invoke_cold_1(v18, buf, v17, v16);
      }
    }
    else
    {
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v13];
      [v2 finishWithResult:v19];

      v16 = +[EMCachingContactStore log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        uint64_t v23 = v20;
        _os_log_impl(&dword_1BEFDB000, v16, OS_LOG_TYPE_DEFAULT, "[Email Address Cache] %lld: Population request finished", buf, 0xCu);
      }
    }
  }
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__EMCachingContactStore_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1) {
    dispatch_once(&signpostLog_onceToken, block);
  }
  v2 = (void *)signpostLog_log;
  return (OS_os_log *)v2;
}

- (CNContactStore)cnStore
{
  return self->_cnStore;
}

- (void)_scheduleEmailAddressCachePopulation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _scheduleEmailAddressCachePopulation_cacheRequestCount++;
  v4 = +[EMCachingContactStore log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "[Email Address Cache] %lld: Scheduling cache population", buf, 0xCu);
  }

  id v5 = [(EMCachingContactStore *)self addressCacheScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__EMCachingContactStore__scheduleEmailAddressCachePopulation__block_invoke;
  v6[3] = &unk_1E63E2AB8;
  v6[4] = self;
  v6[5] = v3;
  [v5 performBlock:v6];
}

- (EFScheduler)addressCacheScheduler
{
  return self->_addressCacheScheduler;
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__EMCachingContactStore_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1) {
    dispatch_once(&log_onceToken_5, block);
  }
  v2 = (void *)log_log_5;
  return v2;
}

void __36__EMCachingContactStore_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;
}

void __28__EMCachingContactStore_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (id)initForTestingWithStore:(id)a3 options:(unint64_t)a4 emailAddressCache:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)EMCachingContactStore;
  objc_super v10 = [(EMCachingContactStore *)&v13 init];
  v11 = v10;
  if (v10) {
    [(EMCachingContactStore *)v10 _commonInitWithStore:v8 options:a4 emailAddressCache:v9];
  }

  return v11;
}

- (void)_commonInitWithStore:(id)a3 options:(unint64_t)a4 emailAddressCache:(id)a5
{
  id v19 = a3;
  id v9 = a5;
  objc_storeStrong((id *)&self->_cnStore, a3);
  self->_options = a4;
  if (a4)
  {
    objc_super v10 = (EFLazyCache *)[objc_alloc(MEMORY[0x1E4F60D88]) initWithCountLimit:100];
    displayNameCache = self->_displayNameCache;
    self->_displayNameCache = v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:self selector:sel__invalidateDisplayNameCache name:*MEMORY[0x1E4F1AF80] object:0];
  }
  if ((a4 & 2) != 0)
  {
    if (v9)
    {
      objc_super v13 = [MEMORY[0x1E4F60D70] futureWithResult:v9];
      [(EMCachingContactStore *)self setEmailAddressCacheFuture:v13];
    }
    else
    {
      [(EMCachingContactStore *)self _scheduleEmailAddressCachePopulation];
    }
    v14 = (void *)MEMORY[0x1E4F60F28];
    v15 = [NSString stringWithFormat:@"com.apple.email.%@.%p", objc_opt_class(), self];
    v16 = [v14 serialDispatchQueueSchedulerWithName:v15 qualityOfService:9];
    addressCacheScheduler = self->_addressCacheScheduler;
    self->_addressCacheScheduler = v16;

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:self selector:sel__invalidateEmailAddressCache name:*MEMORY[0x1E4F1AF80] object:0];
  }
}

- (id)displayNameForEmailAddress:(id)a3
{
  id v3 = [(EMCachingContactStore *)self displayNameForEmailAddress:a3 abbreviated:0];
  return v3;
}

- (id)displayNameForEmailAddress:(id)a3 abbreviated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if (v4) {
      v7 = @"short:";
    }
    else {
      v7 = @"full:";
    }
    id v8 = [(__CFString *)v7 stringByAppendingString:v6];
    id v9 = [(EMCachingContactStore *)self displayNameCache];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__EMCachingContactStore_displayNameForEmailAddress_abbreviated___block_invoke;
    v12[3] = &unk_1E63E2A90;
    v12[4] = self;
    id v13 = v6;
    BOOL v14 = v4;
    objc_super v10 = [v9 objectForKey:v8 generator:v12];
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

uint64_t __64__EMCachingContactStore_displayNameForEmailAddress_abbreviated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDisplayNameForEmailAddress:*(void *)(a1 + 40) abbreviated:*(unsigned __int8 *)(a1 + 48)];
}

- (id)_fetchDisplayNameForEmailAddress:(id)a3 abbreviated:(BOOL)a4
{
  BOOL v4 = a4;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4) {
    uint64_t v7 = 1000;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = [(EMCachingContactStore *)self cnStore];
  id v9 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:v7];
  v19[0] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v11 = objc_msgSend(v8, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v6, v10, 1);

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F1B910] stringFromContact:v11 style:v7];
  }
  else
  {
    id v12 = 0;
  }
  if (![v12 length])
  {
    uint64_t v13 = objc_msgSend(v6, "ea_addressComment");

    id v12 = (id)v13;
  }
  if (v12 == v6)
  {
    uint64_t v14 = objc_msgSend(v6, "ea_uncommentedAddress");

    id v12 = (id)v14;
  }
  if ([v12 isEqualToString:@"Hide My Email"])
  {
    v15 = objc_msgSend(v6, "ea_uncommentedAddress");
    int v16 = [v15 hasSuffix:@"icloud.com"];

    if (v16)
    {
      uint64_t v17 = _EFLocalizedString();

      id v12 = (id)v17;
    }
  }

  return v12;
}

- (BOOL)contactExistsForEmailAddress:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(EMCachingContactStore *)self options];
  id v6 = [(EMCachingContactStore *)self emailAddressCacheFuture];
  uint64_t v7 = [v6 result];

  if (v7)
  {
    id v8 = v4;
    id v9 = [v8 emailAddressValue];
    objc_super v10 = [v9 simpleAddress];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v8 stringValue];
    }
    uint64_t v17 = v12;

    char v16 = [v7 containsObject:v17];
  }
  else
  {
    if ((v5 & 2) != 0) {
      [(EMCachingContactStore *)self _scheduleEmailAddressCachePopulation];
    }
    uint64_t v13 = [(EMCachingContactStore *)self cnStore];
    v19[0] = *MEMORY[0x1E4F1AE08];
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v15 = objc_msgSend(v13, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v4, v14, 0);
    char v16 = v15 != 0;
  }
  return v16;
}

- (void)_invalidateDisplayNameCache
{
  id v2 = [(EMCachingContactStore *)self displayNameCache];
  [v2 removeAllObjects];
}

- (void)_invalidateEmailAddressCache
{
  id v3 = [(EMCachingContactStore *)self addressCacheScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__EMCachingContactStore__invalidateEmailAddressCache__block_invoke;
  v4[3] = &unk_1E63E26B0;
  v4[4] = self;
  [v3 performBlock:v4];
}

uint64_t __53__EMCachingContactStore__invalidateEmailAddressCache__block_invoke(uint64_t a1)
{
  id v2 = +[EMCachingContactStore log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_DEFAULT, "[Email Address Cache] Invalidating cache", v4, 2u);
  }

  return [*(id *)(a1 + 32) setEmailAddressCacheFuture:0];
}

- (EFLazyCache)displayNameCache
{
  return self->_displayNameCache;
}

- (void)setDisplayNameCache:(id)a3
{
}

- (EFFuture)emailAddressCacheFuture
{
  return (EFFuture *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEmailAddressCacheFuture:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setAddressCacheScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressCacheScheduler, 0);
  objc_storeStrong((id *)&self->_emailAddressCacheFuture, 0);
  objc_storeStrong((id *)&self->_displayNameCache, 0);
  objc_storeStrong((id *)&self->_cnStore, 0);
}

void __61__EMCachingContactStore__scheduleEmailAddressCachePopulation__block_invoke_cold_1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "[Email Address Cache] %lld: Population request failed: %{public}@", buf, 0x16u);
}

@end