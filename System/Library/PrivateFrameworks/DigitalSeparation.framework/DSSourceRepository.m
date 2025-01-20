@interface DSSourceRepository
+ (BOOL)runtimeFeatureFlagsEnabledFor:(id)a3;
+ (DSSourceRepository)repositoryWithURL:(id)a3;
+ (void)initialize;
- (DSSourceRepository)init;
- (DSSourceRepository)initWithSources:(id)a3;
- (NSArray)sources;
- (NSDictionary)sourcesByName;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setSourcesByName:(id)a3;
@end

@implementation DSSourceRepository

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLog_2 = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSSourceRepository");
    MEMORY[0x270F9A758]();
  }
}

- (DSSourceRepository)init
{
  v11.receiver = self;
  v11.super_class = (Class)DSSourceRepository;
  v2 = [(DSSourceRepository *)&v11 init];
  if (!v2) {
    return 0;
  }
  v3 = v2;
  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = [v4 URLsForDirectory:5 inDomains:8];
  v6 = [v5 firstObject];

  v7 = [NSURL fileURLWithPath:@"DigitalSeparation" isDirectory:1 relativeToURL:v6];
  v8 = [NSURL fileURLWithPath:@"SharingSources" isDirectory:1 relativeToURL:v7];
  v9 = [(id)objc_opt_class() repositoryWithURL:v8];

  return v9;
}

+ (DSSourceRepository)repositoryWithURL:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v41 = (__CFString *)a3;
  v3 = DSLog_2;
  if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v51 = v41;
    _os_log_impl(&dword_236090000, v3, OS_LOG_TYPE_INFO, "Searching %{public}@ for sharing sources", buf, 0xCu);
  }
  v4 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v41);
  v5 = [v4 enumeratorAtURL:v42 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:1 errorHandler:&__block_literal_global_4];

  v43 = [MEMORY[0x263EFF9A0] dictionary];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v47;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = [MEMORY[0x263F086E0] bundleWithURL:*(void *)(*((void *)&v46 + 1) + 8 * v8)];
        if (v9)
        {
          v10 = DSLog_2;
          if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v51 = v9;
            _os_log_impl(&dword_236090000, v10, OS_LOG_TYPE_INFO, "Found potential source %{public}@", buf, 0xCu);
          }
          objc_super v11 = (objc_class *)[(__CFString *)v9 principalClass];
          id v12 = objc_alloc_init(v11);
          if ([v12 conformsToProtocol:&unk_26E9725D0])
          {
            id v13 = v12;
            v14 = [v13 name];
            if (!v14)
            {
              v20 = (void *)DSLog_2;
              if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR))
              {
                v21 = v20;
                NSStringFromClass(v11);
                v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v51 = v9;
                __int16 v52 = 2114;
                v53 = v22;
                _os_log_error_impl(&dword_236090000, v21, OS_LOG_TYPE_ERROR, "Source from %{public}@ with class %{public}@ doesn't have a name", buf, 0x16u);
              }
              goto LABEL_35;
            }
            if (([a1 runtimeFeatureFlagsEnabledFor:v14] & 1) == 0)
            {
              v23 = DSLog_2;
              if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v51 = v9;
                __int16 v52 = 2114;
                v53 = v14;
                _os_log_error_impl(&dword_236090000, v23, OS_LOG_TYPE_ERROR, "Runtime feature flags for %{public}@ with name %{public}@ are not enabled, not adding bundle.", buf, 0x16u);
              }
              goto LABEL_35;
            }
            if (+[DSSourceWrapper shouldEnumerateResourceNamesForSource:v13])
            {
              v15 = +[DSSourceWrapper wrapMultiSource:v13];
              [v43 addEntriesFromDictionary:v15];

              v16 = (void *)DSLog_2;
              if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_DEFAULT))
              {
                v17 = v16;
                v18 = [v13 name];
                *(_DWORD *)buf = 138543618;
                v51 = v18;
                __int16 v52 = 2114;
                v53 = v9;
                _os_log_impl(&dword_236090000, v17, OS_LOG_TYPE_DEFAULT, "Adding sharing sub sources %{public}@ from %{public}@", buf, 0x16u);
              }
              goto LABEL_35;
            }
            v24 = [v43 objectForKeyedSubscript:v14];

            if (v24)
            {
              v25 = [(__CFString *)v9 bundleIdentifier];
              v26 = (void *)DSLog_2;
              if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_DEFAULT))
              {
                v27 = v26;
                v28 = [v13 name];
                *(_DWORD *)buf = 138543618;
                v51 = v25;
                __int16 v52 = 2114;
                v53 = v28;
                _os_log_impl(&dword_236090000, v27, OS_LOG_TYPE_DEFAULT, "Found additional bundle %{public}@ for source %{public}@", buf, 0x16u);
              }
              if (v14 != @"com.apple.DigitalSeparation.FindMy")
              {
                v29 = (void *)DSLog_2;
                if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR))
                {
                  v36 = v29;
                  v37 = [v13 name];
                  *(_DWORD *)buf = 138543618;
                  v51 = v25;
                  __int16 v52 = 2114;
                  v53 = v37;
                  _os_log_error_impl(&dword_236090000, v36, OS_LOG_TYPE_ERROR, "Duplicate implementation %{public}@ is unexpected for %{public}@, not adding bundle.", buf, 0x16u);
                }
LABEL_30:

LABEL_35:
                goto LABEL_36;
              }
              if (([(__CFString *)v25 containsString:@"FindMyPeopleDigitalSeparation"] & 1) == 0)
              {
                v35 = DSLog_2;
                if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v51 = v9;
                  _os_log_impl(&dword_236090000, v35, OS_LOG_TYPE_DEFAULT, "Ignoring deprecated FindMy bundle %{public}@", buf, 0xCu);
                }
                goto LABEL_30;
              }
            }
            [v43 setObject:v13 forKeyedSubscript:v14];
            v32 = (void *)DSLog_2;
            if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_DEFAULT))
            {
              v33 = v32;
              v34 = [v13 name];
              *(_DWORD *)buf = 138543618;
              v51 = v34;
              __int16 v52 = 2114;
              v53 = v9;
              _os_log_impl(&dword_236090000, v33, OS_LOG_TYPE_DEFAULT, "Adding sharing source for %{public}@ from %{public}@", buf, 0x16u);
            }
            goto LABEL_35;
          }
          v19 = (void *)DSLog_2;
          if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR))
          {
            v30 = v19;
            NSStringFromClass(v11);
            v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v51 = v9;
            __int16 v52 = 2114;
            v53 = v31;
            _os_log_error_impl(&dword_236090000, v30, OS_LOG_TYPE_ERROR, "Found bundle %{public}@ whose principal class %{public}@ does not conform to DSSource", buf, 0x16u);
          }
        }
LABEL_36:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v38 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
      uint64_t v6 = v38;
    }
    while (v38);
  }

  v39 = [[DSSourceRepository alloc] initWithSources:v43];
  return v39;
}

uint64_t __40__DSSourceRepository_repositoryWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = DSLog_2;
  if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR)) {
    __40__DSSourceRepository_repositoryWithURL___block_invoke_cold_1((uint64_t)v4, (uint64_t)v5, v6);
  }

  return 0;
}

+ (BOOL)runtimeFeatureFlagsEnabledFor:(id)a3
{
  if (![a3 isEqualToString:@"com.apple.DigitalSeparation.Zelkova"]) {
    return 1;
  }
  return _os_feature_enabled_impl();
}

- (DSSourceRepository)initWithSources:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DSSourceRepository;
  id v5 = [(DSSourceRepository *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(DSSourceRepository *)v5 setSourcesByName:v4];
  }

  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  id v5 = [(DSSourceRepository *)self sourcesByName];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSArray)sources
{
  v2 = [(DSSourceRepository *)self sourcesByName];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSDictionary)sourcesByName
{
  return self->_sourcesByName;
}

- (void)setSourcesByName:(id)a3
{
}

- (void).cxx_destruct
{
}

void __40__DSSourceRepository_repositoryWithURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_236090000, log, OS_LOG_TYPE_ERROR, "Failed to enumerate %{public}@ because %{public}@", (uint8_t *)&v3, 0x16u);
}

@end