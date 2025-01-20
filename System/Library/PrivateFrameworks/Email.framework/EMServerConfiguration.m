@interface EMServerConfiguration
+ (BOOL)isCacheRecent;
+ (BOOL)isCacheRecentLastRefreshDate:(id *)a3;
+ (BOOL)refresh;
+ (double)_cacheValidityInterval;
+ (id)_cachedPropertyList;
+ (id)_configurationLocation;
+ (id)_dateFormatter;
+ (id)_userDefaults;
+ (id)_userDefaultsKey;
+ (id)cachedPropertyList;
+ (id)getValueForKey:(id)a3;
+ (id)getValueForKey:(id)a3 refreshIfNeeded:(BOOL)a4;
+ (void)_assertNotMainThread;
+ (void)_savePropertyList:(id)a3 withDate:(id)a4;
+ (void)clearCache;
+ (void)overrideWithPropertyList:(id)a3;
+ (void)refreshAsync;
@end

@implementation EMServerConfiguration

uint64_t __37__EMServerConfiguration_refreshAsync__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCacheRecent];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 refresh];
  }
  return result;
}

+ (BOOL)isCacheRecent
{
  return [a1 isCacheRecentLastRefreshDate:0];
}

+ (BOOL)isCacheRecentLastRefreshDate:(id *)a3
{
  v5 = [a1 getValueForKey:@"EMServerConfiguration-propertyListLastDownloadTime" refreshIfNeeded:0];
  v6 = [a1 _dateFormatter];
  v7 = [v6 dateFromString:v5];

  if (a3) {
    *a3 = v7;
  }
  if (v7)
  {
    [a1 _cacheValidityInterval];
    int v8 = objc_msgSend(v7, "ef_isMoreThanTimeIntervalAgo:") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)getValueForKey:(id)a3 refreshIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 && ([a1 isCacheRecent] & 1) == 0) {
    [a1 refreshAsync];
  }
  v7 = [a1 _cachedPropertyList];
  int v8 = [v7 valueForKey:v6];

  return v8;
}

+ (id)_dateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  return v2;
}

+ (id)_cachedPropertyList
{
  v3 = [a1 _userDefaults];
  BOOL v4 = [a1 _userDefaultsKey];
  v5 = [v3 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)_userDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
}

+ (id)_userDefaultsKey
{
  return @"mailServerConfigrationPropertyList";
}

+ (double)_cacheValidityInterval
{
  return 86400.0;
}

+ (void)refreshAsync
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  BOOL v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

  v5 = dispatch_queue_create("com.apple.mail.serverConfiguration.networkOperations", v4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EMServerConfiguration_refreshAsync__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v5, block);
}

void ___ef_log_EMServerConfiguration_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EMServerConfiguration");
  v1 = (void *)_ef_log_EMServerConfiguration_log;
  _ef_log_EMServerConfiguration_log = (uint64_t)v0;
}

+ (id)_configurationLocation
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"https://configuration.apple.com/configurations/internetservices/mail/configuration.plist"];
}

+ (void)_assertNotMainThread
{
  if (pthread_main_np())
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:a1 file:@"EMServerConfiguration.m" lineNumber:39 description:@"Current thread is main"];
  }
}

+ (BOOL)refresh
{
  [a1 _assertNotMainThread];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = (void *)MEMORY[0x1E4F18DC0];
  v5 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  id v6 = [v4 sessionWithConfiguration:v5];

  v7 = [a1 _configurationLocation];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__EMServerConfiguration_refresh__block_invoke;
  v11[3] = &unk_1E63E6688;
  v13 = &v15;
  id v14 = a1;
  int v8 = v3;
  v12 = v8;
  v9 = [v6 dataTaskWithURL:v7 completionHandler:v11];
  [v9 resume];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v3;
}

void __32__EMServerConfiguration_refresh__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || v9)
  {
    _ef_log_EMServerConfiguration();
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [v10 localizedDescription];
      __32__EMServerConfiguration_refresh__block_invoke_cold_1(v16, buf, v15);
    }
    v11 = v15;
    goto LABEL_9;
  }
  id v17 = 0;
  v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:&v17];
  id v10 = v17;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = *(void **)(a1 + 48);
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v11];
    id v14 = [MEMORY[0x1E4F1C9C8] now];
    [v12 _savePropertyList:v13 withDate:v14];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v15 = _ef_log_EMServerConfiguration();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1BEFDB000, v15, OS_LOG_TYPE_DEFAULT, "downloadPropertyList success: %@", buf, 0xCu);
    }
LABEL_9:
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)_savePropertyList:(id)a3 withDate:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[a3 mutableCopy];
  id v8 = [a1 _dateFormatter];
  id v9 = [v8 stringFromDate:v6];

  [v7 setValue:v9 forKey:@"EMServerConfiguration-propertyListLastDownloadTime"];
  id v10 = [a1 _userDefaults];
  v11 = [a1 _userDefaultsKey];
  [v10 setObject:v7 forKey:v11];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EMServerConfiguration__savePropertyList_withDate___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_savePropertyList_withDate__onceToken != -1) {
    dispatch_once(&_savePropertyList_withDate__onceToken, block);
  }
}

void __52__EMServerConfiguration__savePropertyList_withDate___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v2 = [*(id *)(a1 + 32) _userDefaultsKey];
  [v3 removeObjectForKey:v2];
}

+ (id)getValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 _cachedPropertyList];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

+ (id)cachedPropertyList
{
  id v2 = [a1 _cachedPropertyList];
  id v3 = (void *)[v2 mutableCopy];
  [v3 removeObjectForKey:@"EMServerConfiguration-propertyListLastDownloadTime"];

  return v3;
}

+ (void)clearCache
{
  id v3 = _ef_log_EMServerConfiguration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "Clearing out the cached property list", v6, 2u);
  }

  id v4 = [a1 _userDefaults];
  v5 = [a1 _userDefaultsKey];
  [v4 setObject:0 forKey:v5];
}

+ (void)overrideWithPropertyList:(id)a3
{
  id v4 = a3;
  v5 = _ef_log_EMServerConfiguration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "Overriding with custom property list", v7, 2u);
  }

  id v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [a1 _savePropertyList:v4 withDate:v6];
}

void __32__EMServerConfiguration_refresh__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "downloadPropertyList error: %@", buf, 0xCu);
}

@end