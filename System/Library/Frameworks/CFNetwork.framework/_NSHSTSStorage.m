@interface _NSHSTSStorage
+ (id)sharedPersistentStore;
- (BOOL)shouldPromoteHostToHTTPS:(id)a3;
- (BOOL)shouldPromoteHostToHTTPS:(id)a3 isPreload:(BOOL *)a4;
- (NSURL)path;
- (_CFHSTSPolicy)_policyRef;
- (id)initInMemoryStore;
- (id)initPersistentStoreWithURL:(id)a3;
- (id)nonPreloadedHosts;
- (void)dealloc;
- (void)handleSTSHeader:(id)a3 forURL:(id)a4;
- (void)resetHSTSForHost:(id)a3;
- (void)resetHSTSHostsSinceDate:(id)a3;
@end

@implementation _NSHSTSStorage

- (_CFHSTSPolicy)_policyRef
{
  return self->_policy;
}

+ (id)sharedPersistentStore
{
  if (+[_NSHSTSStorage sharedPersistentStore]::sOnce != -1) {
    dispatch_once(&+[_NSHSTSStorage sharedPersistentStore]::sOnce, &__block_literal_global_3619);
  }
  return (id)+[_NSHSTSStorage sharedPersistentStore]::store;
}

- (void)dealloc
{
  CFRelease(self->_policy);
  v3.receiver = self;
  v3.super_class = (Class)_NSHSTSStorage;
  [(_NSHSTSStorage *)&v3 dealloc];
}

- (id)initPersistentStoreWithURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NSHSTSStorage;
  v4 = [(_NSHSTSStorage *)&v6 init];
  if (v4) {
    v4->_policy = (_CFHSTSPolicy *)_CFHSTSPolicyCreateWithStorageLocation((CFURLRef)a3);
  }
  return v4;
}

- (id)initInMemoryStore
{
  v4.receiver = self;
  v4.super_class = (Class)_NSHSTSStorage;
  v2 = [(_NSHSTSStorage *)&v4 init];
  if (v2) {
    v2->_policy = (_CFHSTSPolicy *)_CFHSTSPolicyCreateWithStorageLocation(0);
  }
  return v2;
}

- (void)handleSTSHeader:(id)a3 forURL:(id)a4
{
  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1) {
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_332);
  }
  if (policy) {
    v7 = (HSTSPolicy *)((char *)policy + 16);
  }
  else {
    v7 = 0;
  }

  HSTSPolicy::handleSTSHeader(v7, (const __CFString *)a3, (const __CFURL *)a4);
}

- (void)resetHSTSHostsSinceDate:(id)a3
{
  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1) {
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_332);
  }
  v5 = (char *)policy + 16;
  if (!policy) {
    v5 = 0;
  }
  objc_super v6 = (HSTSCache *)*((void *)v5 + 2);

  HSTSCache::modifyHSTSStore(v6, 0, 0, a3);
}

- (void)resetHSTSForHost:(id)a3
{
  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1) {
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_332);
  }
  v5 = (char *)policy + 16;
  if (!policy) {
    v5 = 0;
  }
  objc_super v6 = (HSTSCache *)*((void *)v5 + 2);

  HSTSCache::modifyHSTSStore(v6, a3, 0, 0);
}

- (id)nonPreloadedHosts
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1) {
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_332);
  }
  if (policy) {
    v5 = (HSTSPolicy *)((char *)policy + 16);
  }
  else {
    v5 = 0;
  }
  CFDictionaryRef v6 = HSTSPolicy::copyExternalRepresentationOfHSTSPolicies(v5);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [(__CFDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (!objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v12), "objectForKeyedSubscript:", @"_kCFNetworkHSTSPreloaded"))objc_msgSend(v3, "addObject:", v12); {
        }
          }
        uint64_t v9 = [(__CFDictionary *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v3;
}

- (BOOL)shouldPromoteHostToHTTPS:(id)a3 isPreload:(BOOL *)a4
{
  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1) {
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_332);
  }
  unsigned __int8 v10 = 0;
  if (policy) {
    CFDictionaryRef v7 = (HSTSPolicy *)((char *)policy + 16);
  }
  else {
    CFDictionaryRef v7 = 0;
  }
  unsigned int v8 = HSTSPolicy::isKnownHSTSHost(v7, (NSString *)a3, &v10);
  if (a4) {
    *a4 = v10 != 0;
  }
  return v8 != 0;
}

- (BOOL)shouldPromoteHostToHTTPS:(id)a3
{
  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1) {
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_332);
  }
  if (policy) {
    v5 = (HSTSPolicy *)((char *)policy + 16);
  }
  else {
    v5 = 0;
  }
  return HSTSPolicy::isKnownHSTSHost(v5, (NSString *)a3, &v7) != 0;
}

- (NSURL)path
{
  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1) {
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_332);
  }
  objc_super v3 = (char *)policy + 16;
  if (!policy) {
    objc_super v3 = 0;
  }
  return *(NSURL **)(*((void *)v3 + 2) + 64);
}

@end