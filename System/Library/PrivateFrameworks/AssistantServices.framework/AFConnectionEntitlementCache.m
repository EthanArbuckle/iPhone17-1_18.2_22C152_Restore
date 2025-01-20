@interface AFConnectionEntitlementCache
+ (id)sharedCache;
- (AFConnectionEntitlementCache)init;
- (BOOL)hasEntitlement:(id)a3 forPID:(int)a4;
- (void)cacheEntitlement:(id)a3 forPID:(int)a4 bundleID:(id)a5;
@end

@implementation AFConnectionEntitlementCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDToPIDMap, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)cacheEntitlement:(id)a3 forPID:(int)a4 bundleID:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v17 = a5;
  cache = self->_cache;
  v9 = (void *)MEMORY[0x1E4F28ED0];
  id v10 = a3;
  v11 = [v9 numberWithInt:v5];
  [(NSMutableDictionary *)cache setObject:v10 forKey:v11];

  v12 = [(NSMutableDictionary *)self->_bundleIDToPIDMap objectForKey:v17];
  if (v12)
  {
    v13 = [MEMORY[0x1E4F28ED0] numberWithInt:v5];
    char v14 = [v12 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      [(NSMutableDictionary *)self->_cache removeObjectForKey:v12];
      bundleIDToPIDMap = self->_bundleIDToPIDMap;
      v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v5];
      [(NSMutableDictionary *)bundleIDToPIDMap setObject:v16 forKey:v17];
    }
  }
}

- (BOOL)hasEntitlement:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  cache = self->_cache;
  v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a3;
  v8 = [v6 numberWithInt:v4];
  v9 = [(NSMutableDictionary *)cache objectForKey:v8];
  LOBYTE(v6) = [v9 isEqualToString:v7];

  return (char)v6;
}

- (AFConnectionEntitlementCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)AFConnectionEntitlementCache;
  v2 = [(AFConnectionEntitlementCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    bundleIDToPIDMap = v2->_bundleIDToPIDMap;
    v2->_bundleIDToPIDMap = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_403);
  }
  v2 = (void *)sharedCache_sCache;
  return v2;
}

void __43__AFConnectionEntitlementCache_sharedCache__block_invoke()
{
  v0 = objc_alloc_init(AFConnectionEntitlementCache);
  v1 = (void *)sharedCache_sCache;
  sharedCache_sCache = (uint64_t)v0;
}

@end