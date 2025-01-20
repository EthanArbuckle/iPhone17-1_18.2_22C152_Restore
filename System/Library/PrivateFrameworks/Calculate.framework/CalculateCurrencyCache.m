@interface CalculateCurrencyCache
+ (CalculateCurrencyCache)shared;
- (BOOL)_needsRefresh;
- (BOOL)_queue_refresh;
- (BOOL)_queue_refresh:(double)a3;
- (BOOL)needsRefresh;
- (BOOL)refresh;
- (BOOL)refreshIfNeeded;
- (BOOL)refreshWithTimeOut:(float)a3;
- (BOOL)updateCurrencyCacheWithData:(id)a3;
- (CalculateCurrencyCache)init;
- (NSDate)lastRefreshDate;
- (NSDictionary)currencyData;
- (NSLock)lock;
- (OS_dispatch_queue)serializer;
- (double)lastRefreshTimeInternal;
- (double)refreshInterval;
- (double)timeout;
- (id)_consumerKey;
- (id)_consumerSecret;
- (id)createCredential;
- (unint64_t)uuid;
- (void)_loadPersistedCurrencyCache;
- (void)_queue_persistCurrencyCache;
- (void)setLastRefreshTimeInternal:(double)a3;
- (void)setLock:(id)a3;
- (void)setRefreshInterval:(double)a3;
- (void)setSerializer:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation CalculateCurrencyCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_mutableCurrencyCache, 0);
  objc_storeStrong((id *)&self->_currentString, 0);
  objc_storeStrong((id *)&self->_currentRate, 0);
  objc_storeStrong((id *)&self->_currentCurrency, 0);
  objc_storeStrong((id *)&self->_currencyData, 0);
  objc_storeStrong((id *)&self->_lastRefreshDate, 0);
}

- (void)setLock:(id)a3
{
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLastRefreshTimeInternal:(double)a3
{
  self->_lastRefreshTimeInternal = a3;
}

- (double)lastRefreshTimeInternal
{
  return self->_lastRefreshTimeInternal;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setRefreshInterval:(double)a3
{
  self->_refreshInterval = a3;
}

- (double)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setSerializer:(id)a3
{
}

- (OS_dispatch_queue)serializer
{
  return self->_serializer;
}

- (unint64_t)uuid
{
  return self->_uuid;
}

- (BOOL)updateCurrencyCacheWithData:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKey:@"query"];
  v5 = [v4 objectForKey:@"created"];

  if (![v5 length]) {
    goto LABEL_15;
  }
  v6 = CalculateLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v52 = (uint64_t)v5;
    _os_log_impl(&dword_1BDCDE000, v6, OS_LOG_TYPE_DEFAULT, "Calculate: currency last updated: %@", buf, 0xCu);
  }

  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v7 setCalendar:v8];

  [v7 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
  v9 = [v7 dateFromString:v5];
  lastRefreshDate = self->_lastRefreshDate;
  self->_lastRefreshDate = v9;

  if ([(CalculateCurrencyCache *)self _needsRefresh])
  {
    v11 = self->_lastRefreshDate;
    v12 = CalculateLogForCategory();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        v14 = "Calculate: refresh date was too different from system time; setting to now";
LABEL_10:
        _os_log_impl(&dword_1BDCDE000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
      }
    }
    else if (v13)
    {
      *(_WORD *)buf = 0;
      v14 = "Calculate: refresh date was nil; setting to now";
      goto LABEL_10;
    }

    v15 = (NSDate *)objc_opt_new();
    v16 = self->_lastRefreshDate;
    self->_lastRefreshDate = v15;
  }
  v17 = CalculateLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = self->_lastRefreshDate;
    *(_DWORD *)buf = 138543362;
    uint64_t v52 = (uint64_t)v18;
    _os_log_impl(&dword_1BDCDE000, v17, OS_LOG_TYPE_DEFAULT, "Calculate: currency refresh date: %{public}@", buf, 0xCu);
  }

LABEL_15:
  v19 = [v3 objectForKey:@"query"];
  v20 = [v19 objectForKey:@"results"];
  v21 = [v20 objectForKey:@"item"];
  v22 = [v21 objectForKey:@"response"];
  v23 = [v22 objectForKey:@"finance"];
  v24 = [v23 objectForKey:@"currencies"];
  v25 = [v24 objectForKey:@"currency"];

  uint64_t v26 = [v25 count];
  if (v26)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v27 = v25;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v41 = v26;
      v42 = v25;
      v43 = v5;
      id v44 = v3;
      uint64_t v30 = *(void *)v47;
      do
      {
        v31 = v27;
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(v31);
          }
          v33 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v34 = [v33 objectForKey:@"currency_to"];
          v35 = NSNumber;
          v36 = [v33 objectForKey:@"price"];
          [v36 doubleValue];
          v37 = objc_msgSend(v35, "numberWithDouble:");

          if ([v34 length]) {
            BOOL v38 = v37 == 0;
          }
          else {
            BOOL v38 = 1;
          }
          if (!v38) {
            [(NSMutableDictionary *)self->_mutableCurrencyCache setObject:v37 forKey:v34];
          }
        }
        v27 = v31;
        uint64_t v29 = [v31 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v29);
      v5 = v43;
      id v3 = v44;
      uint64_t v26 = v41;
      v25 = v42;
    }
  }
  else
  {
    v27 = CalculateLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = [v25 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v52 = v39;
      _os_log_impl(&dword_1BDCDE000, v27, OS_LOG_TYPE_DEFAULT, "Calculate: Received response data but the currency data is empty(currency count): %lu", buf, 0xCu);
    }
  }

  return v26 != 0;
}

- (void)_loadPersistedCurrencyCache
{
  SecTaskRef v3 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v3)
  {
    SecTaskRef v4 = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__CalculateCurrencyCache__loadPersistedCurrencyCache__block_invoke;
    aBlock[3] = &__block_descriptor_40_e18_B16__0__NSString_8l;
    aBlock[4] = v3;
    uint64_t v5 = (uint64_t)_Block_copy(aBlock);
    int v6 = (*(uint64_t (**)(uint64_t, __CFString *))(v5 + 16))(v5, @"com.apple.security.app-sandbox");
    char v7 = (*(uint64_t (**)(uint64_t, __CFString *))(v5 + 16))(v5, @"user-preference-read");
    char v8 = (*(uint64_t (**)(uint64_t, __CFString *))(v5 + 16))(v5, @"file-read-data");
    CFRelease(v4);
    if (!v6 || (v7 & 1) != 0 || (v8 & 1) != 0)
    {
      CFPreferencesAppSynchronize(@"com.apple.calculateframework");
      v10 = CFPreferencesCopyAppValue(@"currencyCache", @"com.apple.calculateframework");
      v9 = v10;
      if (v10 && (unint64_t)[v10 count] >= 0xB)
      {
        v11 = (void *)CFPreferencesCopyAppValue(@"currencyCacheRefreshDate", @"com.apple.calculateframework");
        if (v11)
        {
          objc_storeStrong((id *)&self->_currencyData, v9);
          objc_storeStrong((id *)&self->_lastRefreshDate, v11);
        }
      }
    }
    else
    {
      v9 = CalculateLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BDCDE000, v9, OS_LOG_TYPE_DEFAULT, "Calculate: currency load failed; insufficient entitlements",
          buf,
          2u);
      }
    }
  }
  else
  {
    uint64_t v5 = CalculateLogForCategory();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BDCDE000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Calculate: unexpected NULL from SecTaskCreateFromSelf", buf, 2u);
    }
  }
}

uint64_t __53__CalculateCurrencyCache__loadPersistedCurrencyCache__block_invoke(uint64_t a1, const __CFString *a2)
{
  v2 = (void *)SecTaskCopyValueForEntitlement(*(SecTaskRef *)(a1 + 32), a2, 0);
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (void)_queue_persistCurrencyCache
{
  SecTaskRef v3 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v3)
  {
    SecTaskRef v4 = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__CalculateCurrencyCache__queue_persistCurrencyCache__block_invoke;
    aBlock[3] = &__block_descriptor_40_e18_B16__0__NSString_8l;
    aBlock[4] = v3;
    uint64_t v5 = (uint64_t)_Block_copy(aBlock);
    int v6 = (*(uint64_t (**)(uint64_t, __CFString *))(v5 + 16))(v5, @"com.apple.security.app-sandbox");
    char v7 = (*(uint64_t (**)(uint64_t, __CFString *))(v5 + 16))(v5, @"user-preference-write");
    char v8 = (*(uint64_t (**)(uint64_t, __CFString *))(v5 + 16))(v5, @"file-write-data");
    CFRelease(v4);
    v9 = CalculateLogForCategory();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (!v6 || (v7 & 1) != 0 || (v8 & 1) != 0)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BDCDE000, v9, OS_LOG_TYPE_DEFAULT, "Calculate: successfully updated currency exchange rates", buf, 2u);
      }

      CFPreferencesSetAppValue(@"currencyCacheRefreshDate", self->_lastRefreshDate, @"com.apple.calculateframework");
      CFPreferencesSetAppValue(@"currencyCache", self->_currencyData, @"com.apple.calculateframework");
      CFPreferencesAppSynchronize(@"com.apple.calculateframework");
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BDCDE000, v9, OS_LOG_TYPE_DEFAULT, "Calculate: currency persist failed; insufficient entitlements",
          buf,
          2u);
      }
    }
  }
  else
  {
    uint64_t v5 = CalculateLogForCategory();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BDCDE000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Calculate: unexpected NULL from SecTaskCreateFromSelf", buf, 2u);
    }
  }
}

uint64_t __53__CalculateCurrencyCache__queue_persistCurrencyCache__block_invoke(uint64_t a1, const __CFString *a2)
{
  v2 = (void *)SecTaskCopyValueForEntitlement(*(SecTaskRef *)(a1 + 32), a2, 0);
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)_queue_refresh
{
  [(CalculateCurrencyCache *)self timeout];
  return -[CalculateCurrencyCache _queue_refresh:](self, "_queue_refresh:");
}

- (BOOL)_queue_refresh:(double)a3
{
  [(NSLock *)self->_lock lock];
  double lastRefreshTimeInternal = self->_lastRefreshTimeInternal;
  [(NSLock *)self->_lock unlock];
  if (CFAbsoluteTimeGetCurrent() - lastRefreshTimeInternal < 5.0) {
    return 1;
  }
  char v7 = (void *)MEMORY[0x1E4F28E88];
  char v8 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://apple-finance.query.yahoo.com/v1/yql/applewf/currencies?lang=en&region=US&format=json"];
  v9 = [v7 requestWithURL:v8];

  [v9 setHTTPMethod:@"GET"];
  [v9 setValue:@"JSON" forHTTPHeaderField:@"Content-Type"];
  [v9 setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
  BOOL v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[CalculateCurrencyCache uuid](self, "uuid"));
  [v9 setValue:v10 forHTTPHeaderField:@"X-Client-ID"];

  [v9 setTimeoutInterval:a3];
  v11 = [(CalculateCurrencyCache *)self createCredential];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F83918]) initWithCredential:v11];
  BOOL v13 = dispatch_group_create();
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  dispatch_group_enter(v13);
  v14 = [MEMORY[0x1E4F290E0] sharedSession];
  v15 = [v12 signedURLRequestWithRequest:v9];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __41__CalculateCurrencyCache__queue_refresh___block_invoke;
  v19[3] = &unk_1E6365560;
  v19[4] = self;
  v21 = &v22;
  v16 = v13;
  v20 = v16;
  v17 = [v14 dataTaskWithRequest:v15 completionHandler:v19];

  [v17 resume];
  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v6 = *((unsigned char *)v23 + 24) != 0;

  _Block_object_dispose(&v22, 8);
  return v6;
}

void __41__CalculateCurrencyCache__queue_refresh___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  char v7 = a4;
  char v8 = v7;
  if (!v6 || v7)
  {
    v14 = CalculateLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v8;
      _os_log_error_impl(&dword_1BDCDE000, v14, OS_LOG_TYPE_ERROR, "Calculate: currency refresh failed, error: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 96) lock];
    v9 = CalculateLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BDCDE000, v9, OS_LOG_TYPE_DEFAULT, "Calculate: currency refresh succeed", buf, 2u);
    }

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 72);
    *(void *)(v11 + 72) = v10;

    id v22 = 0;
    BOOL v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:4 error:&v22];
    v14 = v22;
    if (v14 || ![*(id *)(a1 + 32) updateCurrencyCacheWithData:v13])
    {
      v21 = CalculateLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = v14;
        _os_log_error_impl(&dword_1BDCDE000, v21, OS_LOG_TYPE_ERROR, "Calculate: JSON parsing error:%{public}@ or currency data update error", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 72) copy];
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      uint64_t v18 = *(void *)(a1 + 32);
      v19 = *(void **)(v18 + 72);
      *(void *)(v18 + 72) = 0;

      v20 = CalculateLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BDCDE000, v20, OS_LOG_TYPE_DEFAULT, "Calculate: save new currency data to disk", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_queue_persistCurrencyCache");
      *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 88) = CFAbsoluteTimeGetCurrent();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    [*(id *)(*(void *)(a1 + 32) + 96) unlock];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)createCredential
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F83910]);
  SecTaskRef v4 = [(CalculateCurrencyCache *)self _consumerKey];
  [v3 setConsumerKey:v4];

  uint64_t v5 = [(CalculateCurrencyCache *)self _consumerSecret];
  [v3 setConsumerSecret:v5];

  return v3;
}

- (id)_consumerKey
{
  return @"dj0yJmk9cU51ZlhUZ2ZneDBJJmQ9WVdrOU1rOVVlWE5vTkhNbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1hNw--";
}

- (id)_consumerSecret
{
  v2 = [MEMORY[0x1E4F28E78] string];
  for (uint64_t i = 0; i != 40; ++i)
    objc_msgSend(v2, "appendFormat:", @"%c", consumerSecret[i]);
  return v2;
}

- (NSDictionary)currencyData
{
  [(NSLock *)self->_lock lock];
  id v3 = self->_currencyData;
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (BOOL)needsRefresh
{
  [(NSLock *)self->_lock lock];
  BOOL v3 = [(CalculateCurrencyCache *)self _needsRefresh];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (BOOL)_needsRefresh
{
  [(NSDate *)self->_lastRefreshDate timeIntervalSinceReferenceDate];
  double v4 = vabdd_f64(CFAbsoluteTimeGetCurrent(), v3);
  [(CalculateCurrencyCache *)self refreshInterval];
  return v4 > v5;
}

- (NSDate)lastRefreshDate
{
  [(NSLock *)self->_lock lock];
  double v3 = (void *)[(NSDate *)self->_lastRefreshDate copy];
  [(NSLock *)self->_lock unlock];
  return (NSDate *)v3;
}

- (BOOL)refreshWithTimeOut:(float)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(CalculateCurrencyCache *)self serializer];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__CalculateCurrencyCache_refreshWithTimeOut___block_invoke;
  v9[3] = &unk_1E6365538;
  dispatch_semaphore_t v10 = v5;
  uint64_t v11 = &v13;
  float v12 = a3;
  v9[4] = self;
  char v7 = v5;
  dispatch_async(v6, v9);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v6) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v6;
}

intptr_t __45__CalculateCurrencyCache_refreshWithTimeOut___block_invoke(uint64_t a1)
{
  v2 = CalculateLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1BDCDE000, v2, OS_LOG_TYPE_DEFAULT, "Calculate: start refreshing currency rates", v4, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_queue_refresh:", *(float *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)refreshIfNeeded
{
  [(CalculateCurrencyCache *)self _reloadPersistedCurrencyCacheForTesting];
  if (![(CalculateCurrencyCache *)self needsRefresh]) {
    return 1;
  }
  return [(CalculateCurrencyCache *)self refresh];
}

- (BOOL)refresh
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  double v4 = [(CalculateCurrencyCache *)self serializer];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CalculateCurrencyCache_refresh__block_invoke;
  block[3] = &unk_1E6365510;
  dispatch_semaphore_t v8 = v3;
  v9 = &v10;
  block[4] = self;
  dispatch_semaphore_t v5 = v3;
  dispatch_async(v4, block);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

intptr_t __33__CalculateCurrencyCache_refresh__block_invoke(uint64_t a1)
{
  v2 = CalculateLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1BDCDE000, v2, OS_LOG_TYPE_DEFAULT, "Calculate: start refreshing currency rates", v4, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_queue_refresh");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (CalculateCurrencyCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)CalculateCurrencyCache;
  v2 = [(CalculateCurrencyCache *)&v10 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = [MEMORY[0x1E4F1C9C8] date];
    *((void *)v2 + 1) = [v3 hash];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.framework.calculate.currency-cache", 0);
    dispatch_semaphore_t v5 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v4;

    id v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = 0;

    *(_OWORD *)(v2 + 24) = xmmword_1BDDB56F0;
    uint64_t v7 = objc_opt_new();
    dispatch_semaphore_t v8 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v7;

    [v2 _loadPersistedCurrencyCache];
  }
  return (CalculateCurrencyCache *)v2;
}

+ (CalculateCurrencyCache)shared
{
  if (shared_onceToken[0] != -1) {
    dispatch_once(shared_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)shared_shared;
  return (CalculateCurrencyCache *)v2;
}

uint64_t __32__CalculateCurrencyCache_shared__block_invoke()
{
  shared_shared = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

@end