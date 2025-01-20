@interface NSURLCache
+ (NSURLCache)sharedURLCache;
+ (void)setSharedURLCache:(NSURLCache *)sharedURLCache;
- (BOOL)_isVaryHeaderSupportEnabled;
- (NSCachedURLResponse)cachedResponseForRequest:(NSURLRequest *)request;
- (NSUInteger)currentDiskUsage;
- (NSUInteger)currentMemoryUsage;
- (NSUInteger)diskCapacity;
- (NSUInteger)memoryCapacity;
- (NSURLCache)init;
- (NSURLCache)initWithMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity directoryURL:(NSURL *)directoryURL;
- (NSURLCache)initWithMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity diskPath:(NSString *)path;
- (_CFCachedURLResponse)_nscfBridgeURLCacheCopyResponseForRequest:(_CFURLRequest *)a3;
- (double)_maxCacheableEntrySizeRatio;
- (id)_cacheDirectory;
- (id)_initVaryHeaderEnabledWithPath:(id)a3;
- (id)_initWithExistingCFURLCache:(void *)a3;
- (id)_initWithIdentifier:(id)a3 memoryCapacity:(int64_t)a4 diskCapacity:(int64_t)a5 private:(BOOL)a6;
- (id)_initWithMemoryCapacity:(unint64_t)a3 diskCapacity:(unint64_t)a4 relativePath:(id)a5;
- (id)_varyStateForURL:(id)a3;
- (void)_CFURLCache;
- (void)_nscfBridgeURLCacheStoreCachedResponse:(_CFCachedURLResponse *)a3 forRequest:(_CFURLRequest *)a4;
- (void)_updateVaryState:(id)a3 forURL:(id)a4;
- (void)dealloc;
- (void)flushWithCompletion:(id)a3;
- (void)getCachedResponseForDataTask:(NSURLSessionDataTask *)dataTask completionHandler:(void *)completionHandler;
- (void)removeAllCachedResponses;
- (void)removeCachedResponseForDataTask:(NSURLSessionDataTask *)dataTask;
- (void)removeCachedResponseForRequest:(NSURLRequest *)request;
- (void)removeCachedResponsesSinceDate:(NSDate *)date;
- (void)setDiskCapacity:(NSUInteger)diskCapacity;
- (void)setMemoryCapacity:(NSUInteger)memoryCapacity;
- (void)set_maxCacheableEntrySizeRatio:(double)a3;
- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forDataTask:(NSURLSessionDataTask *)dataTask;
- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request;
@end

@implementation NSURLCache

- (double)_maxCacheableEntrySizeRatio
{
  internal = self->_internal;
  double v3 = 0.0;
  if (internal)
  {
    cacheRef = internal->_cacheRef;
    if (IsCFURLCache((BOOL)cacheRef)) {
      return *(double *)(cacheRef[2] + 200);
    }
  }
  return v3;
}

- (NSCachedURLResponse)cachedResponseForRequest:(NSURLRequest *)request
{
  if (!request)
  {
    NSLog(&cfstr_CalledCachedre.isa, a2);
    return 0;
  }
  internal = self->_internal;
  if (!internal) {
    return 0;
  }
  v4 = (__CFCachedURLResponse **)CFURLCacheCopyResponseForRequest(internal->_cacheRef, (_CFURLRequest *)request);
  if (!v4) {
    return 0;
  }
  v5 = v4;
  NSCachedURLResponse = (NSCachedURLResponse *)__CFCachedURLResponse::GetNSCachedURLResponse(v4[2]);
  if (NSCachedURLResponse)
  {
    v7 = NSCachedURLResponse;
    v8 = NSCachedURLResponse;
    [(NSCachedURLResponse *)v7 _reestablishInternalCFCachedURLResponse:v5];
  }
  else
  {
    v7 = (NSCachedURLResponse *)[[NSCachedURLResponse alloc] _initWithCFCachedURLResponse:v5];
  }
  CFRelease(v5);
  return v7;
}

- (void)_CFURLCache
{
  internal = self->_internal;
  if (internal) {
    return internal->_cacheRef;
  }
  else {
    return 0;
  }
}

+ (NSURLCache)sharedURLCache
{
  os_unfair_lock_lock((os_unfair_lock_t)&_gSharedCacheLock);
  if (!sharedInstance)
  {
    if (gSharedInstance)
    {
      v2 = [NSURLCache alloc];
      if (v2) {
        v2 = [(NSURLCache *)v2 _initWithExistingCFURLCache:gSharedInstance];
      }
    }
    else
    {
      v2 = objc_alloc_init(NSURLCache);
    }
    sharedInstance = (uint64_t)v2;
    double v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = (objc_class *)self;
    v6 = class_getName(v5);
    v7 = (const void *)sharedInstance;
    if (Name == v6) {
      v7 = *(const void **)(*(void *)(sharedInstance + 8) + 24);
    }
    CFURLCacheSetSharedURLCache(v7);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_gSharedCacheLock);
  id v8 = (id)sharedInstance;

  return (NSURLCache *)v8;
}

- (NSURLCache)init
{
  return [(NSURLCache *)self initWithMemoryCapacity:512000 diskCapacity:10000000 diskPath:0];
}

- (NSUInteger)diskCapacity
{
  internal = self->_internal;
  if (internal) {
    return (NSUInteger)CFURLCacheDiskCapacity((void *)internal->_cacheRef);
  }
  else {
    return 0;
  }
}

- (NSUInteger)memoryCapacity
{
  internal = self->_internal;
  if (internal) {
    return (NSUInteger)CFURLCacheMemoryCapacity((void *)internal->_cacheRef);
  }
  else {
    return 0;
  }
}

- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request
{
  if (cachedResponse)
  {
    if (request)
    {
      internal = self->_internal;
      if (internal)
      {
        cacheRef = (__CFURLCache **)internal->_cacheRef;
        id v8 = [(NSCachedURLResponse *)cachedResponse _CFCachedURLResponse];
        CFURLCacheAddCachedResponseForRequest(cacheRef, v8, (_CFURLRequest *)request, cachedResponse);
      }
      else
      {
        NSLog(&cfstr_CalledStorecac_1.isa, a2);
      }
    }
    else
    {
      NSLog(&cfstr_CalledStorecac_0.isa, a2);
    }
  }
  else
  {
    NSLog(&cfstr_CalledStorecac.isa, a2);
  }
}

- (NSURLCache)initWithMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity diskPath:(NSString *)path
{
  v10.receiver = self;
  v10.super_class = (Class)NSURLCache;
  id v8 = [(NSURLCache *)&v10 init];
  if (v8)
  {
    v8->_internal = objc_alloc_init(NSURLCacheInternal);
    v8->_internal->_cacheRef = (void *)__CFURLCacheCreateInternal((const __CFAllocator *)*MEMORY[0x1E4F1CF80], memoryCapacity, diskCapacity, (const __CFString *)path, 0, 0, 0);
    CFMakeCollectable(v8->_internal->_cacheRef);
    [(NSURLCache *)v8 setMemoryCapacity:memoryCapacity];
    [(NSURLCache *)v8 setDiskCapacity:diskCapacity];
  }
  return v8;
}

- (void)setMemoryCapacity:(NSUInteger)memoryCapacity
{
  internal = self->_internal;
  if (internal) {
    CFURLCacheSetMemoryCapacity((void *)internal->_cacheRef, memoryCapacity);
  }
}

- (void)setDiskCapacity:(NSUInteger)diskCapacity
{
  internal = self->_internal;
  if (internal) {
    CFURLCacheSetDiskCapacity((void *)internal->_cacheRef, diskCapacity);
  }
}

+ (void)setSharedURLCache:(NSURLCache *)sharedURLCache
{
  os_unfair_lock_lock((os_unfair_lock_t)&_gSharedCacheLock);
  if ((NSURLCache *)sharedInstance != sharedURLCache)
  {
    id v4 = (id)sharedInstance;
    if (sharedURLCache)
    {
      v5 = sharedURLCache;
      sharedInstance = (uint64_t)sharedURLCache;
      v6 = (objc_class *)objc_opt_class();
      Name = class_getName(v6);
      id v8 = (objc_class *)self;
      if (Name == class_getName(v8)) {
        sharedURLCache = (NSURLCache *)sharedURLCache->_internal->_cacheRef;
      }
    }
    else
    {
      sharedInstance = 0;
    }
    CFURLCacheSetSharedURLCache(sharedURLCache);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_gSharedCacheLock);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLCache;
  [(NSURLCache *)&v3 dealloc];
}

- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forDataTask:(NSURLSessionDataTask *)dataTask
{
  v6 = [(NSURLSessionTask *)dataTask currentRequest];

  [(NSURLCache *)self storeCachedResponse:cachedResponse forRequest:v6];
}

- (void)removeAllCachedResponses
{
  internal = self->_internal;
  if (internal) {
    CFURLCacheRemoveAllCachedResponses((void *)internal->_cacheRef);
  }
}

- (void)set_maxCacheableEntrySizeRatio:(double)a3
{
  internal = self->_internal;
  if (internal)
  {
    cacheRef = internal->_cacheRef;
    if (IsCFURLCache((BOOL)cacheRef))
    {
      uint64_t v5 = cacheRef[2];
      *(double *)(v5 + 200) = a3;
      *(int64x2_t *)(v5 + 184) = vcvtq_s64_f64(vmulq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(v5 + 168)), a3));
    }
  }
}

- (NSUInteger)currentDiskUsage
{
  internal = self->_internal;
  if (internal) {
    return (NSUInteger)CFURLCacheCurrentDiskUsage((__CFURLCache **)internal->_cacheRef);
  }
  else {
    return 0;
  }
}

- (NSURLCache)initWithMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity directoryURL:(NSURL *)directoryURL
{
  v13.receiver = self;
  v13.super_class = (Class)NSURLCache;
  id v8 = [(NSURLCache *)&v13 init];
  if (v8)
  {
    v8->_internal = objc_alloc_init(NSURLCacheInternal);
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (directoryURL) {
      CFStringRef v10 = CFURLCopyPath((CFURLRef)directoryURL);
    }
    else {
      CFStringRef v10 = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v15 = ___Z24_CFURLCacheCreateWithURLPK13__CFAllocatorllPK7__CFURL_block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0l;
    CFStringRef v17 = v10;
    uint64_t Internal = __CFURLCacheCreateInternal(v9, memoryCapacity, diskCapacity, v10, 0, 1, 0);
    v15((uint64_t)v14);
    v8->_internal->_cacheRef = (void *)Internal;
    CFMakeCollectable(v8->_internal->_cacheRef);
    [(NSURLCache *)v8 setMemoryCapacity:memoryCapacity];
    [(NSURLCache *)v8 setDiskCapacity:diskCapacity];
  }
  return v8;
}

- (void)removeCachedResponseForRequest:(NSURLRequest *)request
{
  if (request)
  {
    internal = self->_internal;
    if (internal)
    {
      cacheRef = internal->_cacheRef;
      CFURLCacheRemoveCachedResponseForRequest(cacheRef, (_CFURLRequest *)request);
    }
    else
    {
      NSLog(&cfstr_CalledRemoveca_0.isa, a2);
    }
  }
  else
  {
    NSLog(&cfstr_CalledRemoveca.isa, a2);
  }
}

- (id)_initWithMemoryCapacity:(unint64_t)a3 diskCapacity:(unint64_t)a4 relativePath:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)NSURLCache;
  id v8 = [(NSURLCache *)&v10 init];
  if (v8)
  {
    v8->_internal = objc_alloc_init(NSURLCacheInternal);
    v8->_internal->_cacheRef = (void *)__CFURLCacheCreateInternal((const __CFAllocator *)*MEMORY[0x1E4F1CF80], a3, a4, (const __CFString *)a5, 1, 0, 0);
    CFMakeCollectable(v8->_internal->_cacheRef);
    [(NSURLCache *)v8 setMemoryCapacity:a3];
    [(NSURLCache *)v8 setDiskCapacity:a4];
  }
  return v8;
}

- (BOOL)_isVaryHeaderSupportEnabled
{
  internal = self->_internal;
  return internal && (cacheRef = internal->_cacheRef) != 0 && (uint64_t v4 = cacheRef[2]) != 0 && *(unsigned char *)(v4 + 632) != 0;
}

- (void)_updateVaryState:(id)a3 forURL:(id)a4
{
}

- (id)_varyStateForURL:(id)a3
{
  return (id)__CFURLCache::_varyStateForURL(*((__CFURLCache **)self->_internal->_cacheRef + 2), (__CFString *)a3);
}

- (id)_cacheDirectory
{
  return 0;
}

- (NSUInteger)currentMemoryUsage
{
  internal = self->_internal;
  if (internal) {
    return (NSUInteger)CFURLCacheCurrentMemoryUsage((void *)internal->_cacheRef);
  }
  else {
    return 0;
  }
}

- (void)removeCachedResponsesSinceDate:(NSDate *)date
{
  if (date)
  {
    internal = self->_internal;
    if (internal)
    {
      uint64_t v5 = (dispatch_queue_t *)*((void *)internal->_cacheRef + 2);
      id v6 = __CFURLCache::createAndOpenCacheDB((__CFURLCache *)v5);
      if (v6)
      {
        v7 = v6;
        dispatch_queue_t v8 = v5[17];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = ___ZN12__CFURLCache30removeCachedResponsesSinceDateEPK8__CFDate_block_invoke;
        block[3] = &unk_1E52582F0;
        block[4] = v8;
        block[5] = v6;
        block[6] = date;
        dispatch_block_t v9 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
        dispatch_async(v5[17], v9);
        _Block_release(v9);
      }
    }
    else
    {
      NSLog(&cfstr_CalledRemoveca_2.isa, a2);
    }
  }
  else
  {
    NSLog(&cfstr_CalledRemoveca_1.isa, a2);
  }
}

- (void)flushWithCompletion:(id)a3
{
  internal = self->_internal;
  if (internal) {
    _CFURLCacheFlush((uint64_t)internal->_cacheRef, a3);
  }
}

- (id)_initWithExistingCFURLCache:(void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSURLCache;
  uint64_t v4 = [(NSURLCache *)&v8 init];
  if (v4)
  {
    v4->_internal = objc_alloc_init(NSURLCacheInternal);
    if (a3) {
      uint64_t v5 = a3;
    }
    else {
      uint64_t v5 = (void *)gSharedInstance;
    }
    CFTypeRef v6 = CFRetain(v5);
    v4->_internal->_cacheRef = (void *)CFMakeCollectable(v6);
    [(NSURLCache *)v4 setMemoryCapacity:CFURLCacheMemoryCapacity((void *)v4->_internal->_cacheRef)];
    [(NSURLCache *)v4 setDiskCapacity:CFURLCacheDiskCapacity((void *)v4->_internal->_cacheRef)];
  }
  return v4;
}

- (id)_initVaryHeaderEnabledWithPath:(id)a3
{
  if (!a3 || ![a3 length]) {
    __assert_rtn("-[NSURLCache _initVaryHeaderEnabledWithPath:]", "NSURLCache.mm", 522, "path && [path length]");
  }
  v7.receiver = self;
  v7.super_class = (Class)NSURLCache;
  uint64_t v5 = [(NSURLCache *)&v7 init];
  if (v5)
  {
    v5->_internal = objc_alloc_init(NSURLCacheInternal);
    v5->_internal->_cacheRef = (void *)__CFURLCacheCreateInternal((const __CFAllocator *)*MEMORY[0x1E4F1CF80], 512000, 10000000, (const __CFString *)a3, 1, 0, 1);
    CFMakeCollectable(v5->_internal->_cacheRef);
    [(NSURLCache *)v5 setMemoryCapacity:512000];
    [(NSURLCache *)v5 setDiskCapacity:10000000];
  }
  return v5;
}

- (id)_initWithIdentifier:(id)a3 memoryCapacity:(int64_t)a4 diskCapacity:(int64_t)a5 private:(BOOL)a6
{
  if (a6) {
    CFStringRef v8 = @"/tmp/PRIVATE_CACHE_HACK";
  }
  else {
    CFStringRef v8 = 0;
  }
  uint64_t Internal = (const void *)__CFURLCacheCreateInternal((const __CFAllocator *)*MEMORY[0x1E4F1CF80], a4, a5, v8, 0, 0, 0);
  id v10 = [(NSURLCache *)self _initWithExistingCFURLCache:Internal];
  CFRelease(Internal);
  return v10;
}

- (void)_nscfBridgeURLCacheStoreCachedResponse:(_CFCachedURLResponse *)a3 forRequest:(_CFURLRequest *)a4
{
  id v9 = [[NSCachedURLResponse alloc] _initWithCFCachedURLResponse:a3];
  id v6 = [[NSURLRequest alloc] _initWithCFURLRequest:a4];
  objc_super v7 = v6;
  if (v9) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    -[NSURLCache storeCachedResponse:forRequest:](self, "storeCachedResponse:forRequest:");
  }

LABEL_8:
  if (v9)
  {
  }
}

- (_CFCachedURLResponse)_nscfBridgeURLCacheCopyResponseForRequest:(_CFURLRequest *)a3
{
  id v4 = [[NSURLRequest alloc] _initWithCFURLRequest:a3];
  uint64_t v5 = [(NSURLCache *)self cachedResponseForRequest:v4];

  if (!v5) {
    return 0;
  }
  id v6 = [(NSCachedURLResponse *)v5 _CFCachedURLResponse];

  return (_CFCachedURLResponse *)CFRetain(v6);
}

- (void)removeCachedResponseForDataTask:(NSURLSessionDataTask *)dataTask
{
  id v4 = [(NSURLSessionTask *)dataTask currentRequest];

  [(NSURLCache *)self removeCachedResponseForRequest:v4];
}

- (void)getCachedResponseForDataTask:(NSURLSessionDataTask *)dataTask completionHandler:(void *)completionHandler
{
  uint64_t v5 = [(NSURLCache *)self cachedResponseForRequest:[(NSURLSessionTask *)dataTask currentRequest]];
  id v6 = (void (*)(void *, NSCachedURLResponse *))*((void *)completionHandler + 2);

  v6(completionHandler, v5);
}

@end