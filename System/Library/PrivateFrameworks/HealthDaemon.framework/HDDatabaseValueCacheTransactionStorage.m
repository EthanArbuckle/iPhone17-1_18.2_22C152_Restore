@interface HDDatabaseValueCacheTransactionStorage
- (HDDatabaseValueCacheTransactionStorage)init;
@end

@implementation HDDatabaseValueCacheTransactionStorage

- (HDDatabaseValueCacheTransactionStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDDatabaseValueCacheTransactionStorage;
  v2 = [(HDDatabaseValueCacheTransactionStorage *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cache = v2->_cache;
    v2->_cache = v3;

    v2->_cacheScope = 0;
    v2->_didRemoveAllObjects = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end