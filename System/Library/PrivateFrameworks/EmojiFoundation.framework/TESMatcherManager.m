@interface TESMatcherManager
+ (id)sharedManager;
- (NSMutableDictionary)matcherCache;
- (TESMatcherManager)init;
- (id)_getOrCreateMatcherForLocale:(id)a3;
- (void)setMatcherCache:(id)a3;
@end

@implementation TESMatcherManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedManager___sharedManager;
  return v2;
}

uint64_t __34__TESMatcherManager_sharedManager__block_invoke()
{
  sharedManager___sharedManager = objc_alloc_init(TESMatcherManager);
  return MEMORY[0x1F41817F8]();
}

- (TESMatcherManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)TESMatcherManager;
  v3 = [(TESMatcherManager *)&v9 init];
  if (v3 == self)
  {
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    matcherCacheLock = self->_matcherCacheLock;
    self->_matcherCacheLock = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    matcherCache = self->_matcherCache;
    self->_matcherCache = v6;
  }
  return v3;
}

- (id)_getOrCreateMatcherForLocale:(id)a3
{
  id v4 = a3;
  v5 = [v4 localeIdentifier];
  [(NSLock *)self->_matcherCacheLock lock];
  v6 = [(NSMutableDictionary *)self->_matcherCache objectForKey:v5];
  [(NSLock *)self->_matcherCacheLock unlock];
  if (!v6)
  {
    v6 = [[TESMatcher alloc] initWithLocale:v4];
    [(NSLock *)self->_matcherCacheLock lock];
    [(NSMutableDictionary *)self->_matcherCache setObject:v6 forKey:v5];
    [(NSLock *)self->_matcherCacheLock unlock];
  }

  return v6;
}

- (NSMutableDictionary)matcherCache
{
  return self->_matcherCache;
}

- (void)setMatcherCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherCache, 0);
  objc_storeStrong((id *)&self->_matcherCacheLock, 0);
}

@end