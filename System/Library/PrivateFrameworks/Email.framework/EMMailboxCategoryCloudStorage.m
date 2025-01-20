@interface EMMailboxCategoryCloudStorage
- (BOOL)setIfNeededLastSeenDate:(id)a3 lastSeenDisplayDate:(id)a4 forCategoryType:(id)a5 inMailboxWithExternalURL:(id)a6;
- (EFFuture)ubiquitousDictionaryFuture;
- (EFLazyCache)syncKeyByMailboxURLCache;
- (EFScheduler)observerScheduler;
- (EMMailboxCategoryCloudStorage)init;
- (EMUbiquitouslyPersistedDictionary)ubiquitousDictionary;
- (NSHashTable)observers;
- (id)_dateForCategoryType:(void *)a3 inMailboxWithExternalURL:(void *)a4 dateKey:;
- (id)_dateFromValueDictionary:(void *)a3 forKey:;
- (id)_keyForMailboxURL:(void *)a3 categoryType:;
- (id)_loggingStringForMailboxURL:(void *)a3 categoryType:;
- (id)lastSeenDateForCategoryType:(id)a3 inMailboxWithExternalURL:(id)a4;
- (id)lastSeenDisplayDateForCategoryType:(id)a3 inMailboxWithExternalURL:(id)a4;
- (void)_notifyObserversAboutChangedLastSeenDate:(void *)a3 lastSeenDisplayDate:(void *)a4 forCategoryType:(void *)a5 inMailboxWithExternalURL:;
- (void)addCloudStorageObserver:(id)a3;
- (void)clearAll;
- (void)removeCloudStorageObserver:(id)a3;
- (void)setObserverScheduler:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation EMMailboxCategoryCloudStorage

- (id)lastSeenDisplayDateForCategoryType:(id)a3 inMailboxWithExternalURL:(id)a4
{
  v4 = -[EMMailboxCategoryCloudStorage _dateForCategoryType:inMailboxWithExternalURL:dateKey:](self, a3, a4, @"lsd");
  return v4;
}

- (id)lastSeenDateForCategoryType:(id)a3 inMailboxWithExternalURL:(id)a4
{
  v4 = -[EMMailboxCategoryCloudStorage _dateForCategoryType:inMailboxWithExternalURL:dateKey:](self, a3, a4, @"ls");
  return v4;
}

- (id)_dateForCategoryType:(void *)a3 inMailboxWithExternalURL:(void *)a4 dateKey:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v10 = -[EMMailboxCategoryCloudStorage _keyForMailboxURL:categoryType:](a1, v8, v7);
    v11 = [a1 ubiquitousDictionary];
    v12 = [v11 objectForKeyedSubscript:v10];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      a1 = -[EMMailboxCategoryCloudStorage _dateFromValueDictionary:forKey:]((uint64_t)a1, v12, v9);
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (EMUbiquitouslyPersistedDictionary)ubiquitousDictionary
{
  v2 = [(EMMailboxCategoryCloudStorage *)self ubiquitousDictionaryFuture];
  v3 = [v2 result];

  return (EMUbiquitouslyPersistedDictionary *)v3;
}

- (id)_keyForMailboxURL:(void *)a3 categoryType:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if (v6)
    {
      id v8 = [NSString alloc];
      id v9 = [v5 absoluteString];
      v10 = EMStringFromCategoryType([v7 unsignedIntegerValue]);
      v11 = (void *)[v8 initWithFormat:@"%@ (%@)", v9, v10];
    }
    else
    {
      v11 = [v5 absoluteString];
    }
    v12 = [a1 syncKeyByMailboxURLCache];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__EMMailboxCategoryCloudStorage__keyForMailboxURL_categoryType___block_invoke;
    v16[3] = &unk_1E63E4288;
    id v17 = v11;
    id v18 = v7;
    id v13 = v11;
    v14 = [v12 objectForKey:v13 generator:v16];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (EFLazyCache)syncKeyByMailboxURLCache
{
  return self->_syncKeyByMailboxURLCache;
}

id __64__EMMailboxCategoryCloudStorage__keyForMailboxURL_categoryType___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F60F40]) initWithString:*(void *)(a1 + 32)];
  v3 = [v2 hexStringValue];
  uint64_t v4 = [v3 rangeOfString:@"0x" options:8];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v3 substringFromIndex:v4 + v5];
  }

  if ([v6 length])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F29088]);
    id v8 = v7;
    if (*(void *)(a1 + 40)) {
      id v9 = @"mailbox-category-h";
    }
    else {
      id v9 = @"mailbox-h";
    }
    [v7 setScheme:v9];
    [v8 setHost:v6];
    v10 = [v8 string];
  }
  else
  {
    v11 = _ef_log_EMMailboxCategoryCloudStorage();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __64__EMMailboxCategoryCloudStorage__keyForMailboxURL_categoryType___block_invoke_cold_1(v11);
    }

    v10 = 0;
  }

  return v10;
}

void __57__EMMailboxCategoryCloudStorage_addCloudStorageObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (EMMailboxCategoryCloudStorage)init
{
  v17.receiver = self;
  v17.super_class = (Class)EMMailboxCategoryCloudStorage;
  id v2 = [(EMMailboxCategoryCloudStorage *)&v17 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F60D70];
    uint64_t v4 = [MEMORY[0x1E4F60F28] globalAsyncSchedulerWithQualityOfService:25];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __37__EMMailboxCategoryCloudStorage_init__block_invoke;
    v15[3] = &unk_1E63E4238;
    uint64_t v5 = v2;
    v16 = v5;
    uint64_t v6 = [v3 onScheduler:v4 futureWithBlock:v15];
    ubiquitousDictionaryFuture = v5->_ubiquitousDictionaryFuture;
    v5->_ubiquitousDictionaryFuture = (EFFuture *)v6;

    id v8 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E4F60D88]);
    syncKeyByMailboxURLCache = v5->_syncKeyByMailboxURLCache;
    v5->_syncKeyByMailboxURLCache = v8;

    uint64_t v10 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"EMMailboxCategoryCloudStorage"];
    observerScheduler = v5->_observerScheduler;
    v5->_observerScheduler = (EFScheduler *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v12;
  }
  return v2;
}

- (void)addCloudStorageObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EMMailboxCategoryCloudStorage *)self observerScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__EMMailboxCategoryCloudStorage_addCloudStorageObserver___block_invoke;
  v7[3] = &unk_1E63E2760;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (EFScheduler)observerScheduler
{
  return self->_observerScheduler;
}

void ___ef_log_EMMailboxCategoryCloudStorage_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EMMailboxCategoryCloudStorage");
  v1 = (void *)_ef_log_EMMailboxCategoryCloudStorage_log;
  _ef_log_EMMailboxCategoryCloudStorage_log = (uint64_t)v0;
}

EMUbiquitouslyPersistedDictionary *__37__EMMailboxCategoryCloudStorage_init__block_invoke(uint64_t a1)
{
  v1 = [[EMUbiquitouslyPersistedDictionary alloc] initWithIdentifier:@"com.apple.mail.mailboxCategories" encrypted:1 delegate:*(void *)(a1 + 32)];
  return v1;
}

- (id)_dateFromValueDictionary:(void *)a3 forKey:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [v5 objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = (void *)MEMORY[0x1E4F1C9C8];
      [v7 doubleValue];
      id v9 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)setIfNeededLastSeenDate:(id)a3 lastSeenDisplayDate:(id)a4 forCategoryType:(id)a5 inMailboxWithExternalURL:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v32 = a4;
  id v10 = a5;
  id v11 = a6;
  v30 = -[EMMailboxCategoryCloudStorage _keyForMailboxURL:categoryType:](self, v11, v10);
  uint64_t v12 = [(EMMailboxCategoryCloudStorage *)self ubiquitousDictionary];
  id v13 = [v12 objectForKeyedSubscript:v30];

  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _ef_log_EMMailboxCategoryCloudStorage();
    objc_super v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      id v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      v20 = -[EMMailboxCategoryCloudStorage _loggingStringForMailboxURL:categoryType:](self, v11, v10);
      -[EMMailboxCategoryCloudStorage setIfNeededLastSeenDate:lastSeenDisplayDate:forCategoryType:inMailboxWithExternalURL:](v19, v20, buf, v17);
    }

    LOBYTE(v21) = 0;
  }
  else
  {
    v14 = (void *)[v13 mutableCopy];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v22 = v16;

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __118__EMMailboxCategoryCloudStorage_setIfNeededLastSeenDate_lastSeenDisplayDate_forCategoryType_inMailboxWithExternalURL___block_invoke;
    v33[3] = &unk_1E63E4260;
    v33[4] = self;
    objc_super v17 = v22;
    v34 = v17;
    id v23 = v11;
    id v35 = v23;
    id v24 = v10;
    id v36 = v24;
    v25 = (uint64_t (**)(void, void, void, void))MEMORY[0x1C18A2160](v33);
    int v26 = ((uint64_t (**)(void, id, __CFString *, __CFString *))v25)[2](v25, v31, @"ls", @"lastSeenDate");
    int v21 = ((uint64_t (**)(void, id, __CFString *, __CFString *))v25)[2](v25, v32, @"lsd", @"lastSeenDisplayDate") | v26;
    if (v21 == 1)
    {
      v27 = [v23 absoluteString];
      [v17 setObject:v27 forKeyedSubscript:@"mailbox"];

      [v17 setObject:v24 forKeyedSubscript:@"category"];
      v28 = [(EMMailboxCategoryCloudStorage *)self ubiquitousDictionary];
      [v28 setObject:v17 forKeyedSubscript:v30];

      -[EMMailboxCategoryCloudStorage _notifyObserversAboutChangedLastSeenDate:lastSeenDisplayDate:forCategoryType:inMailboxWithExternalURL:](self, v31, v32, v24, v23);
    }
  }
  return v21;
}

- (id)_loggingStringForMailboxURL:(void *)a3 categoryType:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [MEMORY[0x1E4F60D58] currentDevice];
    int v8 = [v7 isInternal];

    a1 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v9 = [v5 scheme];
    [a1 appendFormat:@"%@://", v9];

    id v10 = [v5 user];
    id v11 = [v5 host];
    if ([v10 length] && objc_msgSend(v11, "length"))
    {
      uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"%@@%@", v10, v11];
      if (v8)
      {
        id v13 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_partiallyRedactedStringForAddress:", v12);
        v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v12];
        }
        uint64_t v17 = (uint64_t)v15;
      }
      else
      {
        uint64_t v17 = [MEMORY[0x1E4F60E00] fullyRedactedStringForString:v12];
        v14 = v11;
      }

      id v16 = (void *)v17;
    }
    else
    {
      if (v8) {
        [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v11];
      }
      else {
        [MEMORY[0x1E4F60E00] fullyRedactedStringForString:v11];
      }
      v16 = uint64_t v12 = v11;
    }

    [a1 appendFormat:@"[%@]", v16];
    id v18 = [v5 path];
    if ((objc_msgSend(v18, "ef_caseInsensitiveIsEqualToString:", @"/INBOX") & 1) == 0)
    {
      id v19 = [NSString alloc];
      v20 = [MEMORY[0x1E4F60E00] fullyRedactedStringForString:v18];
      uint64_t v21 = [v19 initWithFormat:@"/%@", v20];

      id v18 = (void *)v21;
    }
    [a1 appendString:v18];
    v22 = (void *)MEMORY[0x1E4F60E00];
    id v23 = [v5 absoluteString];
    id v24 = [v22 partiallyRedactedStringForString:v23 maximumUnredactedLength:0];

    [a1 appendString:v24];
    if (v6)
    {
      v25 = EMStringFromCategoryType([v6 unsignedIntegerValue]);
      [a1 appendFormat:@" (%@)", v25];
    }
  }

  return a1;
}

uint64_t __118__EMMailboxCategoryCloudStorage_setIfNeededLastSeenDate_lastSeenDisplayDate_forCategoryType_inMailboxWithExternalURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    id v10 = -[EMMailboxCategoryCloudStorage _dateFromValueDictionary:forKey:](*(void *)(a1 + 32), *(void **)(a1 + 40), v8);
    id v11 = objc_msgSend(v10, "ec_integerDate");

    if (v11
      && (objc_msgSend(v7, "ec_integerDate"),
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = objc_msgSend(v12, "ef_isLaterThanDate:", v11),
          v12,
          !v13))
    {
      _ef_log_EMMailboxCategoryCloudStorage();
      uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = -[EMMailboxCategoryCloudStorage _loggingStringForMailboxURL:categoryType:](*(id *)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56));
        int v21 = 138544130;
        id v22 = v9;
        __int16 v23 = 2114;
        id v24 = v7;
        __int16 v25 = 2114;
        int v26 = v11;
        __int16 v27 = 2114;
        v28 = v19;
        _os_log_impl(&dword_1BEFDB000, v17, OS_LOG_TYPE_DEFAULT, "Not setting %{public}@ - \"%{public}@\" earlier than \"%{public}@\" for: %{public}@", (uint8_t *)&v21, 0x2Au);
      }
      uint64_t v18 = 0;
    }
    else
    {
      _ef_log_EMMailboxCategoryCloudStorage();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = -[EMMailboxCategoryCloudStorage _loggingStringForMailboxURL:categoryType:](*(id *)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56));
        int v21 = 138543874;
        id v22 = v9;
        __int16 v23 = 2114;
        id v24 = v7;
        __int16 v25 = 2114;
        int v26 = v15;
        _os_log_impl(&dword_1BEFDB000, v14, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ to \"%{public}@\" for: %{public}@", (uint8_t *)&v21, 0x20u);
      }
      id v16 = NSNumber;
      [v7 timeIntervalSince1970];
      uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
      [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:v8];
      uint64_t v18 = 1;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (void)_notifyObserversAboutChangedLastSeenDate:(void *)a3 lastSeenDisplayDate:(void *)a4 forCategoryType:(void *)a5 inMailboxWithExternalURL:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    int v13 = [a1 observerScheduler];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __135__EMMailboxCategoryCloudStorage__notifyObserversAboutChangedLastSeenDate_lastSeenDisplayDate_forCategoryType_inMailboxWithExternalURL___block_invoke;
    v14[3] = &unk_1E63E42B0;
    v14[4] = a1;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    [v13 performBlock:v14];
  }
}

- (void)clearAll
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _ef_log_EMMailboxCategoryCloudStorage();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(EMMailboxCategoryCloudStorage *)self ubiquitousDictionary];
    int v6 = 134217984;
    uint64_t v7 = [v4 count];
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all data with oldCount:%lu", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(EMMailboxCategoryCloudStorage *)self ubiquitousDictionary];
  [v5 removeAllObjects];

  -[EMMailboxCategoryCloudStorage _notifyObserversAboutChangedLastSeenDate:lastSeenDisplayDate:forCategoryType:inMailboxWithExternalURL:](self, 0, 0, 0, 0);
}

- (void)removeCloudStorageObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(EMMailboxCategoryCloudStorage *)self observerScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__EMMailboxCategoryCloudStorage_removeCloudStorageObserver___block_invoke;
  v7[3] = &unk_1E63E2760;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

void __60__EMMailboxCategoryCloudStorage_removeCloudStorageObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void __135__EMMailboxCategoryCloudStorage__notifyObserversAboutChangedLastSeenDate_lastSeenDisplayDate_forCategoryType_inMailboxWithExternalURL___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) categoryCloudStorage:*(void *)(a1 + 32) didChangeLastSeenDate:*(void *)(a1 + 40) lastSeenDisplayDate:*(void *)(a1 + 48) forCategoryType:*(void *)(a1 + 56) inMailboxWithExternalURL:*(void *)(a1 + 64)];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (EFFuture)ubiquitousDictionaryFuture
{
  return self->_ubiquitousDictionaryFuture;
}

- (void)setObservers:(id)a3
{
}

- (void)setObserverScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_syncKeyByMailboxURLCache, 0);
  objc_storeStrong((id *)&self->_ubiquitousDictionaryFuture, 0);
}

- (void)setIfNeededLastSeenDate:(void *)a1 lastSeenDisplayDate:(void *)a2 forCategoryType:(uint8_t *)buf inMailboxWithExternalURL:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_FAULT, "Invalid value type %{public}@ for: %{public}@", buf, 0x16u);
}

void __64__EMMailboxCategoryCloudStorage__keyForMailboxURL_categoryType___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Unable to create key for mailbox URL", v1, 2u);
}

@end