@interface ACNotifyAccountCache
+ (id)cacheKeyForSuffix:(id)a3;
+ (id)suffixForAccountsForAccountType:(id)a3 fetchOptions:(unint64_t)a4;
+ (unint64_t)generationForAccounts:(id)a3;
+ (unsigned)_getUID;
+ (void)__enableTestCacheID;
- (ACNotifyAccountCache)initWithKey:(id)a3;
- (ACNotifyAccountCache)initWithKey:(id)a3 reader:(id)a4;
- (ACNotifyReading)reader;
- (NSString)key;
- (id)cachedAccounts;
- (unint64_t)generation;
- (void)_lock_clearCcachedAccounts;
- (void)cacheAccounts:(id)a3;
- (void)clearCachedAccounts;
- (void)setKey:(id)a3;
- (void)setReader:(id)a3;
@end

@implementation ACNotifyAccountCache

- (void)cacheAccounts:(id)a3
{
  id v4 = a3;
  p_notifyAccountCacheLock = &self->_notifyAccountCacheLock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v9 = __38__ACNotifyAccountCache_cacheAccounts___block_invoke;
  v10 = &unk_1E5BCCD58;
  id v6 = v4;
  id v11 = v6;
  v12 = self;
  v7 = v8;
  os_unfair_lock_lock(p_notifyAccountCacheLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_notifyAccountCacheLock);
}

void __38__ACNotifyAccountCache_cacheAccounts___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = +[ACNotifyAccountCache generationForAccounts:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 40) reader];
  uint64_t v4 = [v3 currentValue];

  if (v4 == v2)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(a1 + 32) copyItems:1];
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = *(id *)(*(void *)(a1 + 40) + 16);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_msgSend(v13, "_clearCachedCredentials", (void)v15);
          [v13 _clearCachedChildAccounts];
          [v13 _clearCachedTrackedSets];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v14, "_lock_clearCcachedAccounts");
  }
}

+ (unint64_t)generationForAccounts:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  unint64_t v5 = 0;
  if (v3)
  {
    if ([v3 count])
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = v4;
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
            v5 += objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "notifyGenerationID", (void)v12);
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
    }
    else
    {
      unint64_t v5 = 1;
    }
  }

  return v5;
}

+ (id)suffixForAccountsForAccountType:(id)a3 fetchOptions:(unint64_t)a4
{
  uint64_t v4 = @"all";
  if ((a4 & 1) == 0) {
    uint64_t v4 = @"active";
  }
  return (id)[NSString stringWithFormat:@"account-type.%@.%@", a3, v4];
}

+ (id)cacheKeyForSuffix:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4 && ([v4 isEqualToString:&stru_1EFA0AB58] & 1) == 0)
  {
    int v7 = __testCachePrefix;
    uint64_t v8 = NSString;
    uint64_t v9 = [a1 _getUID];
    if (v7) {
      uint64_t v10 = @"com.apple.accounts.notify-generation.unit-tests.%u.%@";
    }
    else {
      uint64_t v10 = @"com.apple.accounts.notify-generation.%u.%@";
    }
    id v6 = objc_msgSend(v8, "stringWithFormat:", v10, v9, v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (unsigned)_getUID
{
  if (_getUID_onceToken != -1) {
    dispatch_once(&_getUID_onceToken, &__block_literal_global_7);
  }
  return _getUID__uid;
}

- (id)cachedAccounts
{
  if (ACIsAccountsd())
  {
    id v3 = 0;
  }
  else
  {
    p_notifyAccountCacheLock = &self->_notifyAccountCacheLock;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    uint64_t v8 = __38__ACNotifyAccountCache_cachedAccounts__block_invoke;
    uint64_t v9 = &unk_1E5BCE910;
    uint64_t v10 = self;
    unint64_t v5 = v7;
    os_unfair_lock_lock(p_notifyAccountCacheLock);
    id v3 = v8((uint64_t)v5);
    os_unfair_lock_unlock(p_notifyAccountCacheLock);
  }

  return v3;
}

id __38__ACNotifyAccountCache_cachedAccounts__block_invoke(uint64_t a1)
{
  unint64_t v2 = +[ACNotifyAccountCache generationForAccounts:*(void *)(*(void *)(a1 + 32) + 16)];
  id v3 = [*(id *)(a1 + 32) reader];
  uint64_t v4 = [v3 currentValue];

  if (!v4)
  {
    unint64_t v5 = *(void **)(a1 + 32);
LABEL_9:
    objc_msgSend(v5, "_lock_clearCcachedAccounts");
    int v7 = 0;
    goto LABEL_10;
  }
  unint64_t v5 = *(void **)(a1 + 32);
  id v6 = (void *)v5[2];
  if (v4 == 1)
  {
    int v7 = (void *)MEMORY[0x1E4F1CBF0];
    v5[2] = MEMORY[0x1E4F1CBF0];

    goto LABEL_10;
  }
  if (v6) {
    BOOL v8 = v2 == v4;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    goto LABEL_9;
  }
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(*(void *)(a1 + 32) + 16) copyItems:1];
LABEL_10:

  return v7;
}

- (ACNotifyReading)reader
{
  return (ACNotifyReading *)objc_getProperty(self, a2, 24, 1);
}

- (void)_lock_clearCcachedAccounts
{
  self->_cachedAccounts = 0;
  MEMORY[0x1F41817F8]();
}

- (ACNotifyAccountCache)initWithKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [[ACNotifyReader alloc] initWithKey:v4 updateQueue:0 updateBlock:0];
  id v6 = [(ACNotifyAccountCache *)self initWithKey:v4 reader:v5];

  return v6;
}

- (ACNotifyAccountCache)initWithKey:(id)a3 reader:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ACNotifyAccountCache;
  BOOL v8 = [(ACNotifyAccountCache *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(ACNotifyAccountCache *)v8 setKey:v6];
    [(ACNotifyAccountCache *)v9 setReader:v7];
    v9->_notifyAccountCacheLock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)setReader:(id)a3
{
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_reader, 0);

  objc_storeStrong((id *)&self->_cachedAccounts, 0);
}

void __31__ACNotifyAccountCache__getUID__block_invoke()
{
  _getUID__uid = geteuid();
  if ((ACIsAccountsd() & 1) == 0 && !_getUID__uid)
  {
    id v0 = +[ACAccountStore defaultStore];
    _getUID__uid = [v0 _uidOfAccountsd];
  }
}

+ (void)__enableTestCacheID
{
  __testCachePrefix = 1;
}

- (unint64_t)generation
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  p_notifyAccountCacheLock = &self->_notifyAccountCacheLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v7 = __34__ACNotifyAccountCache_generation__block_invoke;
  BOOL v8 = &unk_1E5BCE8E8;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  id v3 = v6;
  os_unfair_lock_lock(p_notifyAccountCacheLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_notifyAccountCacheLock);

  unint64_t v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

void __34__ACNotifyAccountCache_generation__block_invoke(uint64_t a1)
{
  unint64_t v2 = +[ACNotifyAccountCache generationForAccounts:*(void *)(*(void *)(a1 + 32) + 16)];
  id v3 = [*(id *)(a1 + 32) reader];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 currentValue];

  if (v2 != *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;
  }
}

- (void)clearCachedAccounts
{
  p_notifyAccountCacheLock = &self->_notifyAccountCacheLock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  unint64_t v5 = __43__ACNotifyAccountCache_clearCachedAccounts__block_invoke;
  id v6 = &unk_1E5BCD220;
  id v7 = self;
  id v3 = v4;
  os_unfair_lock_lock(p_notifyAccountCacheLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_notifyAccountCacheLock);
}

uint64_t __43__ACNotifyAccountCache_clearCachedAccounts__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_clearCcachedAccounts");
}

- (NSString)key
{
  return self->_key;
}

@end