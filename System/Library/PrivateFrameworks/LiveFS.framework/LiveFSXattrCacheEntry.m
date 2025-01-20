@interface LiveFSXattrCacheEntry
- (BOOL)isExpiredAsOf:(const timespec *)a3 forLifetime:(unint64_t)a4;
- (LiveFSXattrCacheEntry)initWithData:(id)a3 andTime:(const timespec *)a4;
- (timespec)addedTime;
- (timespec)lastUsedTime;
- (unint64_t)xattrSize;
- (void)dealloc;
- (void)setLastUsedTime:(timespec)a3;
- (void)xattrBytes;
@end

@implementation LiveFSXattrCacheEntry

- (LiveFSXattrCacheEntry)initWithData:(id)a3 andTime:(const timespec *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LiveFSXattrCacheEntry;
  v7 = [(LiveFSXattrCacheEntry *)&v11 init];
  if (v7)
  {
    if (v6)
    {
      size_t v8 = [v6 length];
      v9 = malloc_type_malloc(v8, 0x2CA23B32uLL);
      memcpy(v9, (const void *)[v6 bytes], v8);
    }
    else
    {
      v9 = 0;
      size_t v8 = 0;
    }
    v7->_xattrBytes = v9;
    v7->_xattrSize = v8;
    v7->_addedTime = *a4;
    v7->_lastUsedTime = *a4;
  }

  return v7;
}

- (BOOL)isExpiredAsOf:(const timespec *)a3 forLifetime:(unint64_t)a4
{
  return a4 && a3->tv_sec - self->_addedTime.tv_sec - (unint64_t)(a3->tv_nsec < self->_addedTime.tv_nsec) >= a4;
}

- (void)dealloc
{
  p_xattrBytes = &self->_xattrBytes;
  xattrBytes = self->_xattrBytes;
  if (xattrBytes)
  {
    free(xattrBytes);
    *p_xattrBytes = 0;
    p_xattrBytes[1] = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)LiveFSXattrCacheEntry;
  [(LiveFSXattrCacheEntry *)&v5 dealloc];
}

- (void)xattrBytes
{
  return self->_xattrBytes;
}

- (unint64_t)xattrSize
{
  return self->_xattrSize;
}

- (timespec)addedTime
{
  objc_copyStruct(v4, &self->_addedTime, 16, 1, 0);
  __darwin_time_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.tv_nsec = v3;
  result.tv_sec = v2;
  return result;
}

- (timespec)lastUsedTime
{
  objc_copyStruct(v4, &self->_lastUsedTime, 16, 1, 0);
  __darwin_time_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.tv_nsec = v3;
  result.tv_sec = v2;
  return result;
}

- (void)setLastUsedTime:(timespec)a3
{
  timespec v3 = a3;
  objc_copyStruct(&self->_lastUsedTime, &v3, 16, 1, 0);
}

@end