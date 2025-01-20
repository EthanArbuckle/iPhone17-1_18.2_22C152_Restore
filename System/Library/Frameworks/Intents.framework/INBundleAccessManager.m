@interface INBundleAccessManager
+ (id)sharedManager;
- (INBundleAccessManager)init;
- (NSMutableDictionary)securityScopedURLs;
- (NSMutableSet)accessibleBundleIDs;
- (id)_grantForBundleIdentifiers:(id)a3 error:(id *)a4;
- (id)_stats;
- (id)grantForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)grantForBundleIdentifiers:(id)a3 error:(id *)a4;
@end

@implementation INBundleAccessManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibleBundleIDs, 0);

  objc_storeStrong((id *)&self->_securityScopedURLs, 0);
}

- (NSMutableSet)accessibleBundleIDs
{
  return self->_accessibleBundleIDs;
}

- (NSMutableDictionary)securityScopedURLs
{
  return self->_securityScopedURLs;
}

- (id)_stats
{
  return (id)[NSString stringWithFormat:@"request count: %u\nsecurity scope cache: (count: %u, hit: %u)\naccessible cache: (count: %u, hit: %u)\ncache miss: %u\nimage service load: %u\n", self->_stats._requestCount, -[NSMutableDictionary count](self->_securityScopedURLs, "count"), self->_stats._securityScopeCacheHitCount, -[NSMutableSet count](self->_accessibleBundleIDs, "count"), self->_stats._accessibleCacheHitCount, self->_stats._cacheMissCount, self->_stats._imageServiceLoadCount];
}

- (id)_grantForBundleIdentifiers:(id)a3 error:(id *)a4
{
  v30 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  ++self->_stats._requestCount;
  v6 = objc_opt_new();
  v32 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = v5;
  uint64_t v36 = [v7 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v36)
  {
    uint64_t v8 = *(void *)v42;
    id v33 = v7;
    uint64_t v35 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v7);
        }
        v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v11 = [(INBundleAccessManager *)self securityScopedURLs];
        v12 = [v11 objectForKey:v10];

        if (v12)
        {
          v13 = INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v46 = "-[INBundleAccessManager _grantForBundleIdentifiers:error:]";
            __int16 v47 = 2112;
            v48 = v10;
            _os_log_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_INFO, "%s Using existing security-scoped URL for accessing bundle: %@", buf, 0x16u);
          }
          [v6 setObject:v12 forKey:v10];
          ++self->_stats._securityScopeCacheHitCount;
        }
        else
        {
          v14 = [(INBundleAccessManager *)self accessibleBundleIDs];
          int v15 = [v14 containsObject:v10];

          if (v15)
          {
            ++self->_stats._accessibleCacheHitCount;
          }
          else
          {
            ++self->_stats._cacheMissCount;
            v16 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v10 allowPlaceholder:0 error:0];
            uint64_t v17 = [v16 URL];
            if (!v17) {
              goto LABEL_14;
            }
            v18 = (void *)v17;
            v19 = [MEMORY[0x1E4F28CB8] defaultManager];
            v20 = [v16 URL];
            [v20 path];
            v22 = v21 = v6;
            char v34 = [v19 isReadableFileAtPath:v22];

            v6 = v21;
            id v7 = v33;

            if ((v34 & 1) == 0)
            {
              [v32 addObject:v10];
            }
            else
            {
LABEL_14:
              v23 = [(INBundleAccessManager *)self accessibleBundleIDs];
              [v23 addObject:v10];
            }
          }
          uint64_t v8 = v35;
        }
      }
      uint64_t v36 = [v7 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v36);
  }

  if (![v32 count]) {
    goto LABEL_25;
  }
  v24 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[INBundleAccessManager _grantForBundleIdentifiers:error:]";
    __int16 v47 = 2112;
    v48 = v32;
    _os_log_impl(&dword_18CB2F000, v24, OS_LOG_TYPE_INFO, "%s Requesting access to bundle identifiers from helper. %@", buf, 0x16u);
  }
  ++self->_stats._imageServiceLoadCount;
  v25 = +[INImageServiceConnection sharedConnection];
  id v40 = 0;
  v26 = [v25 securityScopedURLsForBundleIdentifiers:v32 error:&v40];
  id v27 = v40;

  if (v6)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __58__INBundleAccessManager__grantForBundleIdentifiers_error___block_invoke;
    v37[3] = &unk_1E55178E8;
    id v38 = v6;
    v39 = self;
    [v26 enumerateKeysAndObjectsUsingBlock:v37];

LABEL_25:
    v28 = [[INBundleAccessGrant alloc] initWithSecurityScopedURLs:v6];
    goto LABEL_29;
  }
  if (v31) {
    void *v31 = v27;
  }

  v28 = 0;
LABEL_29:

  return v28;
}

void __58__INBundleAccessManager__grantForBundleIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v8 = [[INSecurityScopedURL alloc] initWithURL:v5];

  [*(id *)(a1 + 32) setObject:v8 forKey:v6];
  id v7 = [*(id *)(a1 + 40) securityScopedURLs];
  [v7 setObject:v8 forKey:v6];
}

- (id)grantForBundleIdentifiers:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v8 = [(INBundleAccessManager *)self _grantForBundleIdentifiers:v7 error:a4];

  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)grantForBundleIdentifier:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  v9 = [(INBundleAccessManager *)self _grantForBundleIdentifiers:v8 error:a4];

  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (INBundleAccessManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)INBundleAccessManager;
  v2 = [(INBundleAccessManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    securityScopedURLs = v2->_securityScopedURLs;
    v2->_securityScopedURLs = (NSMutableDictionary *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    id v5 = v2;
  }

  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_17699);
  }
  v2 = (void *)sharedManager_sharedInstance;

  return v2;
}

uint64_t __38__INBundleAccessManager_sharedManager__block_invoke()
{
  sharedManager_sharedInstance = objc_alloc_init(INBundleAccessManager);

  return MEMORY[0x1F41817F8]();
}

@end