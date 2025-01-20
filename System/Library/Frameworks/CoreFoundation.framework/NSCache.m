@interface NSCache
- (BOOL)evictsObjectsWhenApplicationEntersBackground;
- (BOOL)evictsObjectsWithDiscardedContent;
- (NSCache)init;
- (NSString)name;
- (NSUInteger)countLimit;
- (NSUInteger)totalCostLimit;
- (id)allObjects;
- (id)delegate;
- (id)objectForKey:(id)key;
- (unint64_t)minimumObjectCount;
- (void)__apply:(id)a3;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)key;
- (void)setCountLimit:(NSUInteger)countLimit;
- (void)setDelegate:(id)delegate;
- (void)setEvictsObjectsWhenApplicationEntersBackground:(BOOL)a3;
- (void)setEvictsObjectsWithDiscardedContent:(BOOL)evictsObjectsWithDiscardedContent;
- (void)setMinimumObjectCount:(unint64_t)a3;
- (void)setName:(NSString *)name;
- (void)setObject:(id)obj forKey:(id)key;
- (void)setObject:(id)obj forKey:(id)key cost:(NSUInteger)g;
- (void)setTotalCostLimit:(NSUInteger)totalCostLimit;
@end

@implementation NSCache

void __24__NSCache_objectForKey___block_invoke(uint64_t a1, id a2, unsigned char *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  if ([*(id *)(a1 + 32) evictsObjectsWithDiscardedContent])
  {
    int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 24);
    if (v5 == 255
      || v5 == 2
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isContentDiscarded])
      {

        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
        *a3 = 1;
      }
    }
  }
}

- (BOOL)evictsObjectsWithDiscardedContent
{
  return self->_evictsDiscarded;
}

- (id)objectForKey:(id)key
{
  uint64_t v12 = *(void *)off_1ECE0A5B0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  uint64_t v11 = 0;
  if (key)
  {
    cache_get();
    v3 = (void *)v7[5];
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;
  _Block_object_dispose(&v6, 8);
  return v4;
}

- (void)setTotalCostLimit:(NSUInteger)totalCostLimit
{
  __NSCheckReentrancy((objc_class *)self, a2);
  cache = self->_cache;

  MEMORY[0x1F40CA638](cache, totalCostLimit);
}

- (void)removeAllObjects
{
  __NSCheckReentrancy((objc_class *)self, a2);
  cache = self->_cache;

  cache_remove_all(cache);
}

- (void)setMinimumObjectCount:(unint64_t)a3
{
  __NSCheckReentrancy((objc_class *)self, a2);
  cache = self->_cache;

  MEMORY[0x1F40CA648](cache, a3);
}

- (void)removeObjectForKey:(id)key
{
  __NSCheckReentrancy((objc_class *)self, a2);
  if (key)
  {
    cache = self->_cache;
    cache_remove(cache, key);
  }
}

- (void)setCountLimit:(NSUInteger)countLimit
{
  __NSCheckReentrancy((objc_class *)self, a2);
  cache = self->_cache;

  MEMORY[0x1F40CA640](cache, countLimit);
}

- (void)setObject:(id)obj forKey:(id)key
{
  __NSCheckReentrancy((objc_class *)self, a2);

  [(NSCache *)self setObject:obj forKey:key cost:0];
}

- (void)setObject:(id)obj forKey:(id)key cost:(NSUInteger)g
{
  __NSCheckReentrancy((objc_class *)self, a2);
  if (!key) {
    return;
  }
  if (!obj)
  {
    uint64_t v13 = __CFExceptionProem((objc_class *)self, a2);
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: attempt to insert nil value (key: %@)", v13, key);
    v15 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0];
    objc_exception_throw(v15);
  }
  int discardableContentState = self->_discardableContentState;
  if (self->_evictsDiscarded)
  {
    if (discardableContentState == 255)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (objc_opt_respondsToSelector() & 1) == 0
        || (objc_opt_respondsToSelector() & 1) == 0
        || (objc_opt_respondsToSelector() & 1) == 0)
      {
        goto LABEL_24;
      }
    }
    else
    {
      if (discardableContentState != 1)
      {
        if (self->_discardableContentState) {
          goto LABEL_27;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          if (objc_opt_respondsToSelector()) {
            unsigned __int8 v11 = -1;
          }
          else {
            unsigned __int8 v11 = 1;
          }
        }
        else
        {
          unsigned __int8 v11 = 1;
        }
        goto LABEL_26;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (objc_opt_respondsToSelector() & 1) != 0
        && (objc_opt_respondsToSelector() & 1) != 0
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
LABEL_24:
        unsigned __int8 v11 = 2;
LABEL_26:
        self->_int discardableContentState = v11;
      }
    }
  }
  else if (discardableContentState == 255)
  {
    goto LABEL_24;
  }
LABEL_27:
  if (!cache_set_and_retain(self->_cache, key, obj, g))
  {
    cache = self->_cache;
    cache_release_value(cache, obj);
  }
}

- (void)setEvictsObjectsWithDiscardedContent:(BOOL)evictsObjectsWithDiscardedContent
{
  if (evictsObjectsWithDiscardedContent)
  {
    self->_int discardableContentState = 2;
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = 0;
  }
  self->_evictsDiscarded = v3;
}

- (void)dealloc
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, @"UIApplicationDidEnterBackgroundNotification", 0);
  self->_moribund = 1;
  cache = self->_cache;
  if (cache)
  {
    cache_remove_all(cache);
    while (cache_destroy(self->_cache) == 35)
      sleep(1u);
  }
  self->_cache = 0;
  v5.receiver = self;
  v5.super_class = (Class)NSCache;
  [(NSCache *)&v5 dealloc];
}

- (NSCache)init
{
  v2 = self;
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  id v4 = 0;
  *(&attrs.version + 1) = 0;
  attrs.version = 2;
  attrs.key_hash_cb = (cache_key_hash_cb_t)__NSCacheKeyHash;
  attrs.key_is_equal_cb = (cache_key_is_equal_cb_t)__NSCacheKeyEqual;
  attrs.key_retain_cb = (cache_key_retain_cb_t)__NSCacheKeyRetain;
  attrs.key_release_cb = (cache_release_cb_t)__NSCacheKeyRelease;
  attrs.value_release_cb = (cache_release_cb_t)__NSCacheValueRelease;
  attrs.value_make_nonpurgeable_cb = 0;
  attrs.value_make_purgeable_cb = 0;
  attrs.user_data = self;
  attrs.value_retain_cb = (cache_value_retain_cb_t)__NSCacheValueRetain;
  if (cache_create("", &attrs, &v4))
  {

    return 0;
  }
  else
  {
    v2->_cache = v4;
    v2->_evictsDiscarded = 1;
    [(NSCache *)v2 setEvictsObjectsWhenApplicationEntersBackground:1];
  }
  return v2;
}

- (void)setEvictsObjectsWhenApplicationEntersBackground:(BOOL)a3
{
  if (self->_evictOnSuspension != a3)
  {
    BOOL v3 = a3;
    self->_evictOnSuspension = a3;
    LocalCenter = CFNotificationCenterGetLocalCenter();
    if (v3)
    {
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)__NSCacheApplicationDidEnterBackgroundCallBack, @"UIApplicationDidEnterBackgroundNotification", 0, CFNotificationSuspensionBehaviorDrop);
    }
    else
    {
      CFNotificationCenterRemoveObserver(LocalCenter, self, @"UIApplicationDidEnterBackgroundNotification", 0);
    }
  }
}

- (void)setName:(NSString *)name
{
  maxBufLen[1] = *(void *)off_1ECE0A5B0;
  if (name) {
    CFStringRef v3 = (const __CFString *)name;
  }
  else {
    CFStringRef v3 = &stru_1ECE10768;
  }
  maxBufLen[0] = 0;
  v6.length = CFStringGetLength(v3);
  v6.location = 0;
  CFStringGetBytes(v3, v6, 0x8000100u, 0, 0, 0, 0, maxBufLen);
  id v4 = (UInt8 *)malloc_type_malloc(maxBufLen[0] + 1, 0x5379B3FBuLL);
  v7.length = CFStringGetLength(v3);
  v7.location = 0;
  CFStringGetBytes(v3, v7, 0x8000100u, 0, 0, v4, maxBufLen[0], 0);
  v4[maxBufLen[0]] = 0;
  cache_set_name();
  free(v4);
}

- (void)setDelegate:(id)delegate
{
  self->_cacheDelegate = (NSCacheDelegate *)delegate;
  int v4 = [delegate conformsToProtocol:&unk_1ECF62870];
  if (v4) {
    LOBYTE(v4) = objc_opt_respondsToSelector();
  }
  self->_doDelegateWillEvictValue = v4 & 1;
}

- (NSString)name
{
  name = (const char *)cache_get_name();
  CFStringRef v3 = CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, name, 0x8000100u);

  return (NSString *)_CFAutoreleasePoolAddObject(0, (uint64_t)v3);
}

uint64_t __21__NSCache_allObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (id)allObjects
{
  CFStringRef v3 = +[NSArray array];
  cache_invoke();
  return (id)[(NSArray *)v3 copy];
}

- (id)delegate
{
  return self->_cacheDelegate;
}

- (NSUInteger)totalCostLimit
{
  return MEMORY[0x1F40CA5C8](self->_cache, a2);
}

- (NSUInteger)countLimit
{
  return MEMORY[0x1F40CA5D0](self->_cache, a2);
}

- (unint64_t)minimumObjectCount
{
  return MEMORY[0x1F40CA5E8](self->_cache, a2);
}

- (BOOL)evictsObjectsWhenApplicationEntersBackground
{
  return self->_evictOnSuspension;
}

- (void)__apply:(id)a3
{
}

@end