@interface GEOResourceManifestUpdateAssertionRegistry
+ (id)sharedRegistry;
- (BOOL)hasActiveAssertions;
- (GEOResourceManifestUpdateAssertionRegistry)init;
- (id)activeAssertionsDescription;
- (id)addAssertionForProcess:(id)a3 reason:(id)a4 creationTimestamp:(double)a5;
- (id)addInternalAssertionForReason:(id)a3;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (void)dealloc;
- (void)removeAssertion:(id)a3;
@end

@implementation GEOResourceManifestUpdateAssertionRegistry

- (BOOL)hasActiveAssertions
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync_data();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

+ (id)sharedRegistry
{
  if (qword_1EB29FBF8 != -1) {
    dispatch_once(&qword_1EB29FBF8, &__block_literal_global_92);
  }
  char v2 = (void *)_MergedGlobals_241;

  return v2;
}

void __65__GEOResourceManifestUpdateAssertionRegistry_hasActiveAssertions__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v1);
        }
        char v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 isExpired])
        {
          v8 = GEOGetResourceManifestLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v15 = v7;
            _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Update assertion is expired due to timeout: %{public}@", buf, 0xCu);
          }

          if (!v4)
          {
            uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
          }
          [v4 addObject:v7];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  if ([v4 count]) {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectsInArray:v4];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) count] != 0;
}

void __60__GEOResourceManifestUpdateAssertionRegistry_sharedRegistry__block_invoke()
{
  v0 = objc_alloc_init(GEOResourceManifestUpdateAssertionRegistry);
  id v1 = (void *)_MergedGlobals_241;
  _MergedGlobals_241 = (uint64_t)v0;
}

- (GEOResourceManifestUpdateAssertionRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)GEOResourceManifestUpdateAssertionRegistry;
  uint64_t v2 = [(GEOResourceManifestUpdateAssertionRegistry *)&v8 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    uint64_t v5 = dispatch_get_global_queue(17, 0);
    GEORegisterPListStateCaptureLegacy();

    uint64_t v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)GEOResourceManifestUpdateAssertionRegistry;
  [(GEOResourceManifestUpdateAssertionRegistry *)&v3 dealloc];
}

- (id)addAssertionForProcess:(id)a3 reason:(id)a4 creationTimestamp:(double)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = GEOGetResourceManifestLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "Taking new update assertion for '%{public}@': %{public}@", buf, 0x16u);
  }

  long long v12 = [[_GEOResourceManifestUpdateAssertionRecord alloc] initWithProcess:v7 reason:v8 creationTimestamp:a5];
  geo_isolate_sync_data();
  long long v10 = v12;

  return v10;
}

uint64_t __94__GEOResourceManifestUpdateAssertionRegistry_addAssertionForProcess_reason_creationTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

- (id)addInternalAssertionForReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = GEOGetResourceManifestLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Taking new internal update assertion for : %{public}@", buf, 0xCu);
  }

  id v7 = [[_GEOInternalResourceManifestUpdateAssertionRecord alloc] initWithReason:v3];
  geo_isolate_sync_data();
  uint64_t v5 = v7;

  return v5;
}

uint64_t __76__GEOResourceManifestUpdateAssertionRegistry_addInternalAssertionForReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

- (void)removeAssertion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [v4 process];
      id v7 = [v4 reason];
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      long long v12 = v7;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Clearing update assertion for '%{public}@': %{public}@", buf, 0x16u);
    }
    id v8 = v4;
    geo_isolate_sync_data();
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [assertion isKindOfClass:_GEOResourceManifestUpdateAssertionRecord.class]", buf, 2u);
  }
}

uint64_t __62__GEOResourceManifestUpdateAssertionRegistry_removeAssertion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (id)activeAssertionsDescription
{
  uint64_t v5 = self->_isolation;
  _geo_isolate_lock_data();
  id v3 = [(NSMutableArray *)self->_assertions description];
  _geo_isolate_unlock();

  return v3;
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  geo_isolate_sync_data();
  id v3 = v5;

  return v3;
}

void __73__GEOResourceManifestUpdateAssertionRegistry_captureStatePlistWithHints___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v7 = *(void **)(a1 + 40);
        id v8 = NSString;
        id v9 = [v6 process];
        uint64_t v10 = [v6 reason];
        double Current = CFAbsoluteTimeGetCurrent();
        [v6 creationTimestamp];
        uint64_t v13 = [v8 stringWithFormat:@"%@: %@ (%f seconds old)", v9, v10, Current - v12];
        [v7 addObject:v13];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);

  objc_storeStrong((id *)&self->_isolation, 0);
}

@end