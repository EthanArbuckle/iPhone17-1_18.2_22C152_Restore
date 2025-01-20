@interface INBundleAccessGrant
- (INBundleAccessGrant)initWithSecurityScopedURLs:(id)a3;
- (NSDictionary)securityScopedURLs;
- (NSSet)bundleIdentifiers;
- (void)acquire;
- (void)dealloc;
- (void)relinquish;
@end

@implementation INBundleAccessGrant

- (void).cxx_destruct
{
}

- (NSDictionary)securityScopedURLs
{
  return self->_securityScopedURLs;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)INBundleAccessGrant;
  [(INBundleAccessGrant *)&v4 dealloc];
}

- (void)relinquish
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = self->_acquireCount - 1;
  self->_acquireCount = v4;
  if (!v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = [(INBundleAccessGrant *)self securityScopedURLs];
    v6 = [v5 allValues];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) stopAccessingSecurityScopedResource];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)acquire
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t acquireCount = self->_acquireCount;
  if (!acquireCount)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = [(INBundleAccessGrant *)self securityScopedURLs];
    v6 = [v5 allValues];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) startAccessingSecurityScopedResource];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    int64_t acquireCount = self->_acquireCount;
  }
  self->_int64_t acquireCount = acquireCount + 1;
  os_unfair_lock_unlock(p_lock);
}

- (NSSet)bundleIdentifiers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(INBundleAccessGrant *)self securityScopedURLs];
  int64_t v4 = [v3 allKeys];
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (INBundleAccessGrant)initWithSecurityScopedURLs:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INBundleAccessGrant;
  v5 = [(INBundleAccessGrant *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    securityScopedURLs = v5->_securityScopedURLs;
    v5->_securityScopedURLs = (NSDictionary *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = v5;
  }

  return v5;
}

@end