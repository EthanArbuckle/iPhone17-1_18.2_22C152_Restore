@interface CPLBucketFileStorageItem
- (BOOL)isMarkedForDelete;
- (BOOL)isOriginal;
- (CPLBucketFileStorageItem)initWithIdentity:(id)a3 url:(id)a4;
- (void)_cacheAttributes;
@end

@implementation CPLBucketFileStorageItem

- (CPLBucketFileStorageItem)initWithIdentity:(id)a3 url:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPLBucketFileStorageItem;
  v7 = [(CPLBucketFileStorageItem *)&v11 initWithIdentity:a3 original:0 markedForDelete:0 lastAccessDate:0];
  if (v7)
  {
    v8 = (NSURL *)[v6 copy];
    url = v7->_url;
    v7->_url = v8;
  }
  return v7;
}

- (void)_cacheAttributes
{
  v3 = [(NSURL *)self->_url fileSystemRepresentation];
  int v4 = open(v3, 0);
  if (v4 < 0)
  {
    if (!_CPLSilentLogging)
    {
      v7 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = __error();
        v9 = strerror(*v8);
        int v10 = *__error();
        int v12 = 136315650;
        v13 = v3;
        __int16 v14 = 2080;
        v15 = v9;
        __int16 v16 = 1024;
        int v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Can't read attributes at %s: %s (%i)", (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
  else
  {
    int v5 = v4;
    BOOL v6 = fgetxattr(v4, "com.apple.cpl.original", 0, 0xFFFFFFFFFFFFFFFFLL, 0, 0) > 0 || *__error() != 93;
    self->_cachedOriginal = v6;
    if (fgetxattr(v5, "com.apple.cpl.delete", 0, 0xFFFFFFFFFFFFFFFFLL, 0, 0) <= 0)
    {
      __error();
      BOOL v11 = 0;
    }
    else
    {
      BOOL v11 = 1;
    }
    self->_cachedMarkedForDelete = v11;
    close(v5);
  }
  self->_attributesAreCached = 1;
}

- (BOOL)isOriginal
{
  if (!self->_attributesAreCached) {
    [(CPLBucketFileStorageItem *)self _cacheAttributes];
  }
  return self->_cachedOriginal;
}

- (BOOL)isMarkedForDelete
{
  if (!self->_attributesAreCached) {
    [(CPLBucketFileStorageItem *)self _cacheAttributes];
  }
  return self->_cachedMarkedForDelete;
}

- (void).cxx_destruct
{
}

@end