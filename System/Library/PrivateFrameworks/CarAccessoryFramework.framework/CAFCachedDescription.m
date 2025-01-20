@interface CAFCachedDescription
- (BOOL)lazyRefreshDescription;
- (BOOL)needsRefresh;
- (CAFCacheableDescription)cacheable;
- (CAFCachedDescription)initWithCacheable:(id)a3;
- (CAFCachedDescription)initWithCacheable:(id)a3 lazyRefreshDescription:(BOOL)a4;
- (NSString)cachedDescription;
- (id)description;
- (os_unfair_lock_s)cacheLock;
- (void)_lock_refreshDescriptionIfNeeded;
- (void)setCacheLock:(os_unfair_lock_s)a3;
- (void)setCacheable:(id)a3;
- (void)setCachedDescription:(id)a3;
- (void)setLazyRefreshDescription:(BOOL)a3;
- (void)setNeedsRefresh:(BOOL)a3;
- (void)setNeedsRefreshDescription;
@end

@implementation CAFCachedDescription

- (CAFCachedDescription)initWithCacheable:(id)a3
{
  return [(CAFCachedDescription *)self initWithCacheable:a3 lazyRefreshDescription:0];
}

- (CAFCachedDescription)initWithCacheable:(id)a3 lazyRefreshDescription:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAFCachedDescription;
  v7 = [(CAFCachedDescription *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_cacheLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v7->_cacheable, v6);
    if (v4)
    {
      v8->_lazyRefreshDescription = 1;
    }
    else
    {
      v9 = CAFGeneralLogging();
      v8->_lazyRefreshDescription = !os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    }
    [(CAFCachedDescription *)v8 setNeedsRefreshDescription];
  }

  return v8;
}

- (void)setNeedsRefreshDescription
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  [(CAFCachedDescription *)self setNeedsRefresh:1];
  if (![(CAFCachedDescription *)self lazyRefreshDescription]) {
    [(CAFCachedDescription *)self _lock_refreshDescriptionIfNeeded];
  }
  os_unfair_lock_unlock(p_cacheLock);
}

- (id)description
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  [(CAFCachedDescription *)self _lock_refreshDescriptionIfNeeded];
  BOOL v4 = [(CAFCachedDescription *)self cachedDescription];
  os_unfair_lock_unlock(p_cacheLock);
  return v4;
}

- (void)_lock_refreshDescriptionIfNeeded
{
  if ([(CAFCachedDescription *)self needsRefresh])
  {
    v3 = [(CAFCachedDescription *)self cacheable];
    BOOL v4 = [v3 currentDescriptionForCache:self];
    v5 = (void *)[v4 copy];
    [(CAFCachedDescription *)self setCachedDescription:v5];
  }
  [(CAFCachedDescription *)self setNeedsRefresh:0];
}

- (BOOL)lazyRefreshDescription
{
  return self->_lazyRefreshDescription;
}

- (void)setLazyRefreshDescription:(BOOL)a3
{
  self->_lazyRefreshDescription = a3;
}

- (CAFCacheableDescription)cacheable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cacheable);
  return (CAFCacheableDescription *)WeakRetained;
}

- (void)setCacheable:(id)a3
{
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (void)setCacheLock:(os_unfair_lock_s)a3
{
  self->_cacheLock = a3;
}

- (NSString)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_destroyWeak((id *)&self->_cacheable);
}

@end