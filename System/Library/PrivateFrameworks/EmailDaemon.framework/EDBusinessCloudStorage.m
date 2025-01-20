@interface EDBusinessCloudStorage
- (BOOL)_hasCategoryChanged:(id)a3 from:(id)a4;
- (BOOL)_setLastSeenDate:(id)a3 forCategoryType:(id)a4 onDictionary:(id)a5 isDisplayDate:(BOOL)a6;
- (BOOL)_updateIcloudSyncwithMessageHeaders:(id)a3 category:(id)a4 timestamp:(id)a5;
- (EDBusinessCloudStorage)initWithBusinessPersistence:(id)a3 categoryPersistence:(id)a4 messagePersistence:(id)a5 hookRegistry:(id)a6;
- (EDBusinessPersistence)businessPersistence;
- (EDCategoryPersistence)categoryPersistence;
- (EDMessagePersistence)messagePersistence;
- (EFLazyCache)syncKeyCache;
- (EFLocked)deletedKeyMap;
- (EFScheduler)observerScheduler;
- (EMMutableDictionaryProtocol)persistentDictionary;
- (id)_categoryStringForCategoryType:(id)a3;
- (id)_dateForKey:(id)a3 categoryType:(id)a4 businessWithExternalID:(id)a5;
- (id)_dictionaryForBusiness:(id)a3;
- (id)_hashSchemeForGrouping:(int64_t)a3;
- (id)_messageQueryForSender:(id)a3 forAccount:(id)a4;
- (id)_mutableDictionaryForBusiness:(id)a3;
- (id)_syncKeyForExternalID:(id)a3;
- (id)categoryForBusinessWithExternalID:(id)a3 lastModifiedDate:(id *)a4;
- (id)lastSeenDateForCategoryType:(id)a3 businessWithExternalID:(id)a4;
- (id)lastSeenDisplayDateForCategoryType:(id)a3 businessWithExternalID:(id)a4;
- (id)mergeChangesForRemotelyChangedKeys:(id)a3 localStore:(id)a4 cloudStore:(id)a5;
- (int64_t)_getCategorizationSyncTypeForSender:(id)a3 businessID:(int64_t)a4 senderAlreadyKnown:(BOOL)a5 senderAddressID:(int64_t)a6 connection:(id)a7 mailboxURL:(id)a8 account:(id)a9 outCategory:(id *)a10 outDate:(id *)a11;
- (void)_removeDictionaryForBusiness:(id)a3;
- (void)_setMutableDictionary:(id)a3 forBusiness:(id)a4;
- (void)_updateCategoryOverrideForBusinessExternalID:(id)a3;
- (void)_updateCategoryOverrideForBusinessID:(int64_t)a3 withBusinessExternalID:(id)a4;
- (void)beginObserving:(id)a3;
- (void)persistedDictionaryDidChangeRemotelyWithChangedItems:(id)a3 deletedItems:(id)a4;
- (void)removeAllEntries;
- (void)removeCategoryForBusinessWithExternalID:(id)a3;
- (void)removeCategoryForBusinessWithExternalID:(id)a3 withLastModifiedDate:(id)a4;
- (void)setBusinessPersistence:(id)a3;
- (void)setCategory:(unint64_t)a3 forBusinessWithExternalID:(id)a4;
- (void)setCategory:(unint64_t)a3 forBusinessWithExternalID:(id)a4 withLastModifiedDate:(id)a5;
- (void)setCategoryPersistence:(id)a3;
- (void)setIfNeededLastSeenDate:(id)a3 andDisplayDate:(id)a4 forCategoryType:(id)a5 businessWithExternalID:(id)a6;
- (void)setMessagePersistence:(id)a3;
- (void)stopObserving:(id)a3;
- (void)updateIcloudOverridesForAddress:(id)a3 cache:(id)a4 connection:(id)a5 account:(id)a6 isIcloudAccount:(BOOL)a7 messageHeaders:(id)a8 mailboxURL:(id)a9 isNewAddress:(BOOL)a10;
@end

@implementation EDBusinessCloudStorage

void ___ef_log_EDBusinessCloudStorage_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDBusinessCloudStorage");
  v1 = (void *)_ef_log_EDBusinessCloudStorage_log;
  _ef_log_EDBusinessCloudStorage_log = (uint64_t)v0;
}

- (EDBusinessCloudStorage)initWithBusinessPersistence:(id)a3 categoryPersistence:(id)a4 messagePersistence:(id)a5 hookRegistry:(id)a6
{
  id v28 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)EDBusinessCloudStorage;
  v14 = [(EDBusinessCloudStorage *)&v29 init];
  if (v14)
  {
    v15 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E4F60D88]);
    syncKeyCache = v14->_syncKeyCache;
    v14->_syncKeyCache = v15;

    id v17 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v19 = [v17 initWithObject:v18];
    deletedKeyMap = v14->_deletedKeyMap;
    v14->_deletedKeyMap = (EFLocked *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F604F8]) initWithIdentifier:@"com.apple.mail.businesses" encrypted:1 delegate:v14];
    persistentDictionary = v14->_persistentDictionary;
    v14->_persistentDictionary = (EMMutableDictionaryProtocol *)v21;

    uint64_t v23 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"EDBusinessCloudStorage.observerScheduler"];
    observerScheduler = v14->_observerScheduler;
    v14->_observerScheduler = (EFScheduler *)v23;

    uint64_t v25 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v25;

    objc_storeStrong((id *)&v14->_businessPersistence, a3);
    objc_storeStrong((id *)&v14->_categoryPersistence, a4);
    objc_storeStrong((id *)&v14->_messagePersistence, a5);
    [v13 registerBusinessChangeHookResponder:v14];
  }

  return v14;
}

- (void)beginObserving:(id)a3
{
  id v4 = a3;
  v5 = [(EDBusinessCloudStorage *)self observerScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__EDBusinessCloudStorage_beginObserving___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

uint64_t __41__EDBusinessCloudStorage_beginObserving___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)stopObserving:(id)a3
{
  id v4 = a3;
  v5 = [(EDBusinessCloudStorage *)self observerScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__EDBusinessCloudStorage_stopObserving___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

uint64_t __40__EDBusinessCloudStorage_stopObserving___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (id)categoryForBusinessWithExternalID:(id)a3 lastModifiedDate:(id *)a4
{
  id v6 = a3;
  v7 = [(EDBusinessCloudStorage *)self _dictionaryForBusiness:v6];
  id v8 = [v7 objectForKeyedSubscript:@"category"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 objectForKeyedSubscript:@"type"];
    v10 = [v8 objectForKeyedSubscript:@"lastModified"];
    id v11 = v10;
    if (v10)
    {
      id v12 = (void *)MEMORY[0x1E4F1C9C8];
      [v10 doubleValue];
      id v13 = objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
      if (!a4)
      {
LABEL_5:

        goto LABEL_12;
      }
    }
    else
    {
      id v13 = 0;
      if (!a4) {
        goto LABEL_5;
      }
    }
    *a4 = v13;
    goto LABEL_5;
  }
  if (v8)
  {
    v14 = _ef_log_EDBusinessCloudStorage();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[EDBusinessCloudStorage categoryForBusinessWithExternalID:lastModifiedDate:]((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  v9 = 0;
  if (a4) {
    *a4 = 0;
  }
LABEL_12:

  return v9;
}

- (void)setCategory:(unint64_t)a3 forBusinessWithExternalID:(id)a4
{
  id v7 = a4;
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  [(EDBusinessCloudStorage *)self setCategory:a3 forBusinessWithExternalID:v7 withLastModifiedDate:v6];
}

- (void)setCategory:(unint64_t)a3 forBusinessWithExternalID:(id)a4 withLastModifiedDate:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(EDBusinessCloudStorage *)self _mutableDictionaryForBusiness:v8];
  id v11 = [v10 objectForKeyedSubscript:@"category"];
  id v12 = [v11 objectForKeyedSubscript:@"lastModified"];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v12 doubleValue];
    v14 = objc_msgSend(v13, "initWithTimeIntervalSince1970:");
    if (objc_msgSend(v9, "ef_isEarlierThanOrEqualDate:", v14))
    {
      uint64_t v15 = _ef_log_EDBusinessCloudStorage();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        unint64_t v24 = a3;
        __int16 v25 = 2114;
        id v26 = v9;
        __int16 v27 = 2114;
        id v28 = v14;
        __int16 v29 = 2114;
        id v30 = v8;
        _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Skipping setting category to %lu (\"%{public}@\" older than \"%{public}@\") for business: %{public}@", buf, 0x2Au);
      }

      goto LABEL_10;
    }
  }
  uint64_t v16 = _ef_log_EDBusinessCloudStorage();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v24 = a3;
    __int16 v25 = 2114;
    id v26 = v8;
    _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Setting category to %lu for business: %{public}@", buf, 0x16u);
  }

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3, @"type");
  v21[1] = @"lastModified";
  v22[0] = v17;
  uint64_t v18 = NSNumber;
  [v9 timeIntervalSince1970];
  uint64_t v19 = objc_msgSend(v18, "numberWithDouble:");
  v22[1] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v10 setObject:v20 forKeyedSubscript:@"category"];

  [(EDBusinessCloudStorage *)self _setMutableDictionary:v10 forBusiness:v8];
LABEL_10:
}

- (void)removeCategoryForBusinessWithExternalID:(id)a3
{
  id v5 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [(EDBusinessCloudStorage *)self removeCategoryForBusinessWithExternalID:v5 withLastModifiedDate:v4];
}

- (void)removeCategoryForBusinessWithExternalID:(id)a3 withLastModifiedDate:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDBusinessCloudStorage *)self _mutableDictionaryForBusiness:v6];
  id v9 = [v8 objectForKeyedSubscript:@"category"];
  v10 = [v9 objectForKeyedSubscript:@"lastModified"];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v10 doubleValue];
    id v12 = objc_msgSend(v11, "initWithTimeIntervalSince1970:");
    if (objc_msgSend(v7, "ef_isEarlierThanOrEqualDate:", v12))
    {
      id v13 = _ef_log_EDBusinessCloudStorage();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v21 = v7;
        __int16 v22 = 2114;
        uint64_t v23 = v12;
        __int16 v24 = 2114;
        id v25 = v6;
        _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Skipping removing category (\"%{public}@\" older than \"%{public}@\") for business: %{public}@", buf, 0x20u);
      }

      goto LABEL_10;
    }
  }
  v14 = _ef_log_EDBusinessCloudStorage();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v6;
    _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Removing category for business: %{public}@", buf, 0xCu);
  }

  uint64_t v15 = NSNumber;
  objc_msgSend(v7, "timeIntervalSince1970", @"lastModified");
  uint64_t v16 = objc_msgSend(v15, "numberWithDouble:");
  uint64_t v19 = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v8 setObject:v17 forKeyedSubscript:@"category"];

  [(EDBusinessCloudStorage *)self _setMutableDictionary:v8 forBusiness:v6];
LABEL_10:
}

- (id)lastSeenDateForCategoryType:(id)a3 businessWithExternalID:(id)a4
{
  id v4 = [(EDBusinessCloudStorage *)self _dateForKey:@"lastSeenDates" categoryType:a3 businessWithExternalID:a4];

  return v4;
}

- (id)lastSeenDisplayDateForCategoryType:(id)a3 businessWithExternalID:(id)a4
{
  id v4 = [(EDBusinessCloudStorage *)self _dateForKey:@"lastSeenDisplayDates" categoryType:a3 businessWithExternalID:a4];

  return v4;
}

- (id)_dateForKey:(id)a3 categoryType:(id)a4 businessWithExternalID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(EDBusinessCloudStorage *)self _dictionaryForBusiness:v10];
  id v12 = [v11 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [(EDBusinessCloudStorage *)self _categoryStringForCategoryType:v9];
    v14 = [v12 objectForKeyedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F1C9C8];
      [v14 doubleValue];
      uint64_t v16 = objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
    }
    else
    {
      if (v14)
      {
        uint64_t v17 = _ef_log_EDBusinessCloudStorage();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[EDBusinessCloudStorage _dateForKey:categoryType:businessWithExternalID:]();
        }
      }
      uint64_t v16 = 0;
    }

LABEL_14:
    goto LABEL_15;
  }
  if (v12)
  {
    id v13 = _ef_log_EDBusinessCloudStorage();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[EDBusinessCloudStorage _dateForKey:categoryType:businessWithExternalID:]();
    }
    uint64_t v16 = 0;
    goto LABEL_14;
  }
  uint64_t v16 = 0;
LABEL_15:

  return v16;
}

- (void)setIfNeededLastSeenDate:(id)a3 andDisplayDate:(id)a4 forCategoryType:(id)a5 businessWithExternalID:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _ef_log_EDBusinessCloudStorage();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138544130;
    id v17 = v10;
    __int16 v18 = 2114;
    id v19 = v11;
    __int16 v20 = 2114;
    id v21 = v13;
    __int16 v22 = 2114;
    id v23 = v12;
    _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Updating last seen date to \"%{public}@\" and display date to \"%{public}@\" for business: %{public}@, category: %{public}@", (uint8_t *)&v16, 0x2Au);
  }

  uint64_t v15 = [(EDBusinessCloudStorage *)self _mutableDictionaryForBusiness:v13];
  [(EDBusinessCloudStorage *)self _setLastSeenDate:v10 forCategoryType:v12 onDictionary:v15 isDisplayDate:0];
  [(EDBusinessCloudStorage *)self _setLastSeenDate:v11 forCategoryType:v12 onDictionary:v15 isDisplayDate:1];
  [(EDBusinessCloudStorage *)self _setMutableDictionary:v15 forBusiness:v13];
}

- (BOOL)_setLastSeenDate:(id)a3 forCategoryType:(id)a4 onDictionary:(id)a5 isDisplayDate:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = @"lastSeenDates";
  if (v6) {
    id v12 = @"lastSeenDisplayDates";
  }
  id v13 = v12;
  v14 = [(EDBusinessCloudStorage *)self _categoryStringForCategoryType:a4];
  uint64_t v15 = [v11 objectForKeyedSubscript:v13];
  int v16 = (void *)[v15 mutableCopy];
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v19 = v18;

  __int16 v20 = [v19 objectForKeyedSubscript:v14];
  id v21 = v20;
  if (v20
    && (__int16 v22 = (void *)MEMORY[0x1E4F1C9C8],
        [v20 doubleValue],
        objc_msgSend(v22, "dateWithTimeIntervalSince1970:"),
        id v23 = objc_claimAutoreleasedReturnValue(),
        int v24 = objc_msgSend(v10, "ef_isLaterThanDate:", v23),
        v23,
        !v24))
  {
    BOOL v29 = 0;
  }
  else
  {
    id v25 = _ef_log_EDBusinessCloudStorage();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = &stru_1F3583658;
      if (v6) {
        uint64_t v26 = @" display";
      }
      int v31 = 138412546;
      v32 = v26;
      __int16 v33 = 2114;
      id v34 = v10;
      _os_log_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_INFO, "Setting last seen%@ date to \"%{public}@\"", (uint8_t *)&v31, 0x16u);
    }

    __int16 v27 = NSNumber;
    [v10 timeIntervalSince1970];
    id v28 = objc_msgSend(v27, "numberWithDouble:");
    [v19 setObject:v28 forKeyedSubscript:v14];

    [v11 setObject:v19 forKeyedSubscript:v13];
    BOOL v29 = 1;
  }

  return v29;
}

- (void)removeAllEntries
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _ef_log_EDBusinessCloudStorage();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(EDBusinessCloudStorage *)self persistentDictionary];
    int v6 = 134217984;
    uint64_t v7 = [v4 count];
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all data with oldCount:%lu", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(EDBusinessCloudStorage *)self persistentDictionary];
  [v5 removeAllObjects];
}

- (id)_syncKeyForExternalID:(id)a3
{
  id v4 = a3;
  id v5 = [(EDBusinessCloudStorage *)self syncKeyCache];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__EDBusinessCloudStorage__syncKeyForExternalID___block_invoke;
  v9[3] = &unk_1E6BFFC40;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v7 = [v5 objectForKey:v6 generator:v9];

  return v7;
}

id __48__EDBusinessCloudStorage__syncKeyForExternalID___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 40);
  v2 = objc_msgSend(*(id *)(a1 + 32), "_hashSchemeForGrouping:", objc_msgSend(*(id *)(a1 + 40), "grouping"));
  v3 = [*v1 serializedRepresentation];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60F40]) initWithString:v3];
  id v5 = [v4 hexStringValue];
  uint64_t v6 = [v5 rangeOfString:@"0x" options:8];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [v5 substringFromIndex:v6 + v7];
  }

  if ([v8 length])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v9 setScheme:v2];
    [v9 setHost:v8];
    id v10 = [v9 string];
  }
  else
  {
    id v11 = _ef_log_EDBusinessCloudStorage();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __48__EDBusinessCloudStorage__syncKeyForExternalID___block_invoke_cold_1((uint64_t)v1, v11, v12, v13, v14, v15, v16, v17);
    }

    id v10 = 0;
  }

  return v10;
}

- (id)_hashSchemeForGrouping:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"bh-addr";
  }
  else {
    return off_1E6BFFD00[a3];
  }
}

- (void)_removeDictionaryForBusiness:(id)a3
{
  id v5 = [(EDBusinessCloudStorage *)self _syncKeyForExternalID:a3];
  id v4 = [(EDBusinessCloudStorage *)self persistentDictionary];
  [v4 removeObjectForKey:v5];
}

- (id)_dictionaryForBusiness:(id)a3
{
  id v4 = a3;
  id v5 = [(EDBusinessCloudStorage *)self _syncKeyForExternalID:v4];
  uint64_t v6 = [(EDBusinessCloudStorage *)self persistentDictionary];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    if (v7)
    {
      id v9 = _ef_log_EDBusinessCloudStorage();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[EDBusinessCloudStorage _dictionaryForBusiness:]((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    id v8 = 0;
  }

  return v8;
}

- (id)_mutableDictionaryForBusiness:(id)a3
{
  v3 = [(EDBusinessCloudStorage *)self _dictionaryForBusiness:a3];
  id v4 = (void *)[v3 mutableCopy];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v7 = v6;

  return v7;
}

- (void)_setMutableDictionary:(id)a3 forBusiness:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(EDBusinessCloudStorage *)self _syncKeyForExternalID:v6];
  id v8 = [v6 serializedRepresentation];
  [v10 setObject:v8 forKeyedSubscript:@"id"];

  id v9 = [(EDBusinessCloudStorage *)self persistentDictionary];
  [v9 setObject:v10 forKeyedSubscript:v7];
}

- (id)_categoryStringForCategoryType:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 unsignedIntegerValue];
    EMStringFromCategoryType();
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"None";
  }

  return v5;
}

- (void)persistedDictionaryDidChangeRemotelyWithChangedItems:(id)a3 deletedItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __92__EDBusinessCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke;
  v23[3] = &unk_1E6BFFC68;
  id v9 = v8;
  id v24 = v9;
  id v25 = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v23];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v11 = [(EDBusinessCloudStorage *)self deletedKeyMap];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__EDBusinessCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke_2;
  v20[3] = &unk_1E6BFFC90;
  id v12 = v7;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  [v11 performWhileLocked:v20];

  uint64_t v14 = [(EDBusinessCloudStorage *)self observerScheduler];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__EDBusinessCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke_3;
  v17[3] = &unk_1E6BFF7A8;
  v17[4] = self;
  id v15 = v9;
  id v18 = v15;
  id v16 = v13;
  id v19 = v16;
  [v14 performBlock:v17];
}

void __92__EDBusinessCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (isValidKey(v8))
  {
    id v6 = [v5 objectForKeyedSubscript:@"id"];
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F60218] externalIDForSerializedRepresentation:v6];
      if (v7)
      {
        [*(id *)(a1 + 32) addObject:v7];
        [*(id *)(a1 + 40) _updateCategoryOverrideForBusinessExternalID:v7];
      }
    }
  }
}

void __92__EDBusinessCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v7), (void)v10);
        if (v8)
        {
          id v9 = [MEMORY[0x1E4F60218] externalIDForSerializedRepresentation:v8];
          if (v9) {
            [*(id *)(a1 + 40) addObject:v9];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [v3 removeAllObjects];
}

void __92__EDBusinessCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke_3(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1[4] + 8);
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
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "updatedBusinessesWithExternalIDs:removedBusinessesWithExternalIDs:", a1[5], a1[6], (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)mergeChangesForRemotelyChangedKeys:(id)a3 localStore:(id)a4 cloudStore:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    uint64_t v25 = *MEMORY[0x1E4F600B8];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (isValidKey(v14))
        {
          uint64_t v15 = [v8 objectForKeyedSubscript:v14];
          if (v15)
          {
            id v16 = [v9 objectForKey:v14];
            BOOL v17 = v16 == 0;

            if (v17)
            {
              id v18 = [v15 objectForKeyedSubscript:v25];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v19 = [v18 objectForKeyedSubscript:@"id"];
                [v24 setObject:v19 forKeyedSubscript:v14];
              }
            }
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  __int16 v20 = [(EDBusinessCloudStorage *)self deletedKeyMap];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __83__EDBusinessCloudStorage_mergeChangesForRemotelyChangedKeys_localStore_cloudStore___block_invoke;
  v26[3] = &unk_1E6BFFCB8;
  id v21 = v24;
  id v27 = v21;
  [v20 performWhileLocked:v26];

  return 0;
}

uint64_t __83__EDBusinessCloudStorage_mergeChangesForRemotelyChangedKeys_localStore_cloudStore___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDictionary:*(void *)(a1 + 32)];
}

- (void)_updateCategoryOverrideForBusinessExternalID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EDBusinessCloudStorage *)self businessPersistence];
  uint64_t v6 = [v5 businessIDForBusinessExternalID:v4];

  if (v6 == *MEMORY[0x1E4F5FCC8])
  {
    id v7 = _ef_log_EDBusinessCloudStorage();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[EDBusinessCloudStorage _updateCategoryOverrideForBusinessExternalID:]((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    [(EDBusinessCloudStorage *)self _updateCategoryOverrideForBusinessID:v6 withBusinessExternalID:v4];
  }
}

- (void)_updateCategoryOverrideForBusinessID:(int64_t)a3 withBusinessExternalID:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(EDBusinessCloudStorage *)self categoryForBusinessWithExternalID:a4 lastModifiedDate:0];
  id v7 = [(EDBusinessCloudStorage *)self businessPersistence];
  uint64_t v8 = [v7 categoryTypeForBusinessID:a3];

  if ([(EDBusinessCloudStorage *)self _hasCategoryChanged:v6 from:v8])
  {
    uint64_t v9 = [(EDBusinessCloudStorage *)self messagePersistence];
    uint64_t v10 = [v9 persistedMessagesForBusinessID:a3];

    if (v6)
    {
      uint64_t v11 = [v6 unsignedIntegerValue];
      uint64_t v12 = [(EDBusinessCloudStorage *)self businessPersistence];
      uint64_t v13 = [NSNumber numberWithLongLong:a3];
      v20[0] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
      [v12 insertOrUpdateUserOverrideForBusinessIDs:v14 category:v11 timestamp:v15];
    }
    else
    {
      uint64_t v12 = [(EDBusinessCloudStorage *)self businessPersistence];
      uint64_t v13 = [NSNumber numberWithLongLong:a3];
      id v19 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
      [v12 removeUserOverridesForBusinessIDs:v14 timestamp:v15];
      uint64_t v11 = 0;
    }

    id v16 = [(EDBusinessCloudStorage *)self categoryPersistence];
    BOOL v17 = [v16 analyticsLogger];
    id v18 = [(EDBusinessCloudStorage *)self categoryPersistence];
    [v17 logRecategorizationEventForMessages:v10 categoryType:v11 categoryPersistence:v18];
  }
}

- (BOOL)_hasCategoryChanged:(id)a3 from:(id)a4
{
  return EFNumbersAreEqual() ^ 1;
}

- (void)updateIcloudOverridesForAddress:(id)a3 cache:(id)a4 connection:(id)a5 account:(id)a6 isIcloudAccount:(BOOL)a7 messageHeaders:(id)a8 mailboxURL:(id)a9 isNewAddress:(BOOL)a10
{
  BOOL v11 = a7;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v31 = a6;
  id v30 = a8;
  id v19 = a9;
  __int16 v20 = [v17 objectForKeyedSubscript:v16];
  id v21 = v20;
  if (v16 && v20 && v11)
  {
    uint64_t v22 = [v20 longLongValue];
    uint64_t v23 = *MEMORY[0x1E4F5FCC8];
    if (v22 != *MEMORY[0x1E4F5FCC8] && _os_feature_enabled_impl())
    {
      id v24 = [(EDBusinessCloudStorage *)self businessPersistence];
      uint64_t v23 = [v24 findOrCreateBusinessIDForAddress:v16 addressID:v22 connection:v18];
    }
    id v32 = 0;
    id v33 = 0;
    int64_t v25 = [(EDBusinessCloudStorage *)self _getCategorizationSyncTypeForSender:v16 businessID:v23 senderAlreadyKnown:!a10 senderAddressID:v22 connection:v18 mailboxURL:v19 account:v31 outCategory:&v33 outDate:&v32];
    id v26 = v33;
    id v27 = v32;
    if ((unint64_t)(v25 - 1) < 2)
    {
      [(EDBusinessCloudStorage *)self _updateIcloudSyncwithMessageHeaders:v30 category:v26 timestamp:v27];
      long long v28 = EDLibraryLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        long long v29 = @"business";
        *(_DWORD *)buf = 138412802;
        if (v25 == 2) {
          long long v29 = @"sender";
        }
        uint64_t v35 = v29;
        __int16 v36 = 2112;
        id v37 = v26;
        __int16 v38 = 2112;
        id v39 = v27;
        _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_INFO, "Category sync: %@ category,timestamp={%@,%@}", buf, 0x20u);
      }
    }
    else if (v25)
    {
      if (v25 != 3)
      {
LABEL_19:

        goto LABEL_20;
      }
      long long v28 = EDLibraryLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[EDBusinessCloudStorage updateIcloudOverridesForAddress:cache:connection:account:isIcloudAccount:messageHeaders:mailboxURL:isNewAddress:](v28);
      }
    }
    else
    {
      long long v28 = EDLibraryLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[EDBusinessCloudStorage updateIcloudOverridesForAddress:cache:connection:account:isIcloudAccount:messageHeaders:mailboxURL:isNewAddress:](v28);
      }
    }

    goto LABEL_19;
  }
LABEL_20:
}

- (int64_t)_getCategorizationSyncTypeForSender:(id)a3 businessID:(int64_t)a4 senderAlreadyKnown:(BOOL)a5 senderAddressID:(int64_t)a6 connection:(id)a7 mailboxURL:(id)a8 account:(id)a9 outCategory:(id *)a10 outDate:(id *)a11
{
  BOOL v13 = a5;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v16 = a7;
  id v45 = a9;
  v43 = v16;
  id v17 = [(EDBusinessCloudStorage *)self businessPersistence];
  id v18 = [v17 addressIDsForBusinessID:a4 connection:v16];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v50 count:16];
  int64_t v42 = a6;
  id v21 = 0;
  uint64_t v22 = 0;
  if (v20)
  {
    uint64_t v23 = *(void *)v47;
    do
    {
      uint64_t v24 = 0;
      int64_t v25 = v21;
      do
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v19);
        }
        id v26 = *(void **)(*((void *)&v46 + 1) + 8 * v24);
        id v27 = [(EDBusinessCloudStorage *)self businessPersistence];
        id v21 = objc_msgSend(v27, "categoryTypeForAddressID:", objc_msgSend(v26, "longLongValue"));

        if (v21) {
          ++v22;
        }
        ++v24;
        int64_t v25 = v21;
      }
      while (v20 != v24);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v20);
  }

  uint64_t v28 = [v19 count];
  uint64_t v29 = v28;
  if (!v13)
  {
    if (v22 == v28)
    {
      *a11 = 0;
      id v39 = v21;
      id v31 = 0;
LABEL_26:
      int64_t v40 = 1;
      goto LABEL_27;
    }
    id v31 = 0;
LABEL_29:
    int64_t v40 = 0;
    goto LABEL_30;
  }
  id v30 = [(EDBusinessCloudStorage *)self businessPersistence];
  id v31 = [v30 categoryTypeForAddressID:v42];
  BOOL v32 = v22 == v29;

  if (v31) {
    BOOL v33 = v22 == 1;
  }
  else {
    BOOL v33 = 0;
  }
  int v34 = v33;
  int v35 = v33 || v32;
  if (v35 != 1) {
    goto LABEL_29;
  }
  __int16 v36 = [(EDBusinessCloudStorage *)self _messageQueryForSender:v44 forAccount:v45];
  id v37 = [(EDBusinessCloudStorage *)self messagePersistence];
  BOOL v38 = [v37 countOfMessagesMatchingQuery:v36] > 0;

  if (v38) {
    goto LABEL_29;
  }
  *a11 = 0;
  if (!v34)
  {
    id v39 = v21;
    goto LABEL_26;
  }
  id v39 = v31;
  int64_t v40 = 2;
  id v31 = v39;
LABEL_27:
  *a10 = v39;
LABEL_30:

  return v40;
}

- (BOOL)_updateIcloudSyncwithMessageHeaders:(id)a3 category:(id)a4 timestamp:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  unint64_t v9 = [a4 unsignedIntegerValue];
  if (v8 && v9 <= 3)
  {
    getMCCSecretAgentControllerClass();
    id v31 = objc_opt_new();
    uint64_t v10 = objc_opt_new();
    RCOverrideRuleClass = getRCOverrideRuleClass();
    Property = class_getProperty(RCOverrideRuleClass, "xAppleRequestHeader");
    Name = property_getName(Property);
    uint64_t v14 = getRCOverrideRuleClass();
    uint64_t v15 = class_getProperty(v14, "messageIdHeader");
    id v16 = property_getName(v15);
    id v17 = getRCOverrideRuleClass();
    id v18 = class_getProperty(v17, "category");
    id v19 = property_getName(v18);
    id v20 = objc_alloc_init(getRCOverrideRuleClass());
    id v21 = [v7 objectForKey:*MEMORY[0x1E4F606F0]];
    uint64_t v22 = [NSString stringWithUTF8String:v16];
    [v20 setValue:v21 forKey:v22];

    uint64_t v23 = [v7 objectForKey:*MEMORY[0x1E4F60750]];
    uint64_t v24 = [NSString stringWithUTF8String:Name];
    [v20 setValue:v23 forKey:v24];

    int64_t v25 = EMStringFromCategoryType();
    id v26 = [NSString stringWithUTF8String:v19];
    [v20 setValue:v25 forKey:v26];

    id v27 = NSNumber;
    [v8 timeIntervalSince1970];
    uint64_t v28 = objc_msgSend(v27, "numberWithDouble:");
    [v20 setCategoryUpdateTime:v28];

    [v10 addObject:v20];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __81__EDBusinessCloudStorage__updateIcloudSyncwithMessageHeaders_category_timestamp___block_invoke;
    v32[3] = &unk_1E6BFFCE0;
    v32[4] = &v33;
    [v31 syncRecategorizationRules:v10 completion:v32];
  }
  char v29 = *((unsigned char *)v34 + 24);
  _Block_object_dispose(&v33, 8);

  return v29;
}

void __81__EDBusinessCloudStorage__updateIcloudSyncwithMessageHeaders_category_timestamp___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = +[EDMessageRepository log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_msgSend(v5, "ef_publicDescription");
      __81__EDBusinessCloudStorage__updateIcloudSyncwithMessageHeaders_category_timestamp___block_invoke_cold_1(v7, v8, v6);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (id)_messageQueryForSender:(id)a3 forAccount:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F60390] predicateForMessagesWithSender:a3 forAccount:a4];
  id v5 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v9 = (void *)[v5 initWithTargetClass:v6 predicate:v4 sortDescriptors:v8];

  return v9;
}

- (EDBusinessPersistence)businessPersistence
{
  return self->_businessPersistence;
}

- (void)setBusinessPersistence:(id)a3
{
}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (void)setCategoryPersistence:(id)a3
{
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void)setMessagePersistence:(id)a3
{
}

- (EFLazyCache)syncKeyCache
{
  return self->_syncKeyCache;
}

- (EFLocked)deletedKeyMap
{
  return self->_deletedKeyMap;
}

- (EMMutableDictionaryProtocol)persistentDictionary
{
  return self->_persistentDictionary;
}

- (EFScheduler)observerScheduler
{
  return self->_observerScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_persistentDictionary, 0);
  objc_storeStrong((id *)&self->_deletedKeyMap, 0);
  objc_storeStrong((id *)&self->_syncKeyCache, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_businessPersistence, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)categoryForBusinessWithExternalID:(uint64_t)a3 lastModifiedDate:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_dateForKey:categoryType:businessWithExternalID:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_1(&dword_1DB39C000, v0, v1, "Date value (for %{public}@) is not a number for business: %{public}@");
}

- (void)_dateForKey:categoryType:businessWithExternalID:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_1(&dword_1DB39C000, v0, v1, "Value for date key %{public}@ is not a dictionary for business: %{public}@");
}

void __48__EDBusinessCloudStorage__syncKeyForExternalID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_dictionaryForBusiness:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateCategoryOverrideForBusinessExternalID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateIcloudOverridesForAddress:(os_log_t)log cache:connection:account:isIcloudAccount:messageHeaders:mailboxURL:isNewAddress:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "Category sync: no-action", v1, 2u);
}

- (void)updateIcloudOverridesForAddress:(os_log_t)log cache:connection:account:isIcloudAccount:messageHeaders:mailboxURL:isNewAddress:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Category sync: source mailbox is nil", v1, 2u);
}

void __81__EDBusinessCloudStorage__updateIcloudSyncwithMessageHeaders_category_timestamp___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to sync rules, error:%@", buf, 0xCu);
}

@end