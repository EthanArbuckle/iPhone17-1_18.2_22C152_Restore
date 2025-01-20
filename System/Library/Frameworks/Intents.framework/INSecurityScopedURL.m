@interface INSecurityScopedURL
- (BOOL)startAccessingSecurityScopedResource;
- (INSecurityScopedURL)initWithURL:(id)a3;
- (NSURL)url;
- (void)stopAccessingSecurityScopedResource;
@end

@implementation INSecurityScopedURL

- (void).cxx_destruct
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)stopAccessingSecurityScopedResource
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = self->_accessCount - 1;
  self->_accessCount = v4;
  if (!v4)
  {
    v5 = [(INSecurityScopedURL *)self url];
    [v5 stopAccessingSecurityScopedResource];
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)startAccessingSecurityScopedResource
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t accessCount = self->_accessCount;
  if (!accessCount)
  {
    v5 = [(INSecurityScopedURL *)self url];
    int v6 = [v5 startAccessingSecurityScopedResource];

    if (!v6)
    {
      BOOL v7 = 0;
      goto LABEL_6;
    }
    int64_t accessCount = self->_accessCount;
  }
  self->_int64_t accessCount = accessCount + 1;
  BOOL v7 = 1;
LABEL_6:
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (INSecurityScopedURL)initWithURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INSecurityScopedURL;
  int v6 = [(INSecurityScopedURL *)&v10 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = v7;
  }

  return v7;
}

@end