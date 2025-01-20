@interface NSPersistentStoreCache
+ (void)initialize;
- (NSPersistentStoreCache)init;
- (NSPersistentStoreCache)initWithValueCallbacks:(void *)a3 preserveToManyRelationships:(BOOL)a4;
- (os_unfair_lock_s)ancillaryOrderKeysForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:;
- (os_unfair_lock_s)rowForObjectID:(double)a3 afterTimestamp:;
- (os_unfair_lock_s)toManyForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:;
- (uint64_t)_createExternalDataDictWithValueCallbacks:(uint64_t)result;
- (uint64_t)toManyInformationForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:;
- (void)_registerRow:(void *)key forObjectID:(char)a4 options:;
- (void)_registerToMany:(uint64_t)a1 withOrderKeys:(void *)a2 forSourceObjectID:(void *)a3 forProperty:(void *)key options:(void *)a5 andTimestamp:(double)a6;
- (void)dealloc;
- (void)decrementRefCountForObjectID:(uint64_t)a1;
- (void)forgetAllExternalData;
- (void)forgetRowForObjectID:(uint64_t)a1;
- (void)incrementRefCountForObjectID:(uint64_t)a1;
- (void)registerRow:(void *)a3 forObjectID:(char)a4 options:;
- (void)registerToMany:(uint64_t)a1 withOrderKeys:(void *)a2 forSourceObjectID:(void *)a3 forProperty:(void *)a4 options:(void *)a5 andTimestamp:(double)a6;
@end

@implementation NSPersistentStoreCache

- (void)registerRow:(void *)a3 forObjectID:(char)a4 options:
{
  if (a1)
  {
    v8 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    -[NSPersistentStoreCache _registerRow:forObjectID:options:](a1, a2, a3, a4);
    os_unfair_lock_unlock(v8);
  }
}

- (void)_registerRow:(void *)key forObjectID:(char)a4 options:
{
  if (a1)
  {
    Value = (atomic_uint *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), key);
    if (Value != (atomic_uint *)a2)
    {
      uint64_t v9 = (uint64_t)Value;
      if (Value)
      {
        unsigned int add = atomic_fetch_add(Value + 3, 0);
        if (a2) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(a2 + 12), add, memory_order_relaxed);
        }
        if (a4 & 4) == 0 && (*(unsigned char *)(a1 + 32))
        {
          uint64_t v11 = [(atomic_uint *)Value version];
          if (v11 == [(id)a2 version]) {
            -[NSPersistentCacheRow copyRelationshipCachesFrom:]((void *)a2, v9);
          }
        }
      }
      v12 = *(__CFDictionary **)(a1 + 8);
      CFDictionarySetValue(v12, key, (const void *)a2);
    }
  }
}

- (os_unfair_lock_s)rowForObjectID:(double)a3 afterTimestamp:
{
  if (result)
  {
    v5 = result;
    v6 = result + 9;
    os_unfair_lock_lock_with_options();
    Value = (double *)CFDictionaryGetValue(*(CFDictionaryRef *)&v5[2]._os_unfair_lock_opaque, a2);
    if (Value && (v8 = Value, Value[4] > a3))
    {
      uint64_t v9 = Value;
      [v8 knownKeyValuesPointer];
    }
    else
    {
      v8 = 0;
    }
    os_unfair_lock_unlock(v6);
    return (os_unfair_lock_s *)v8;
  }
  return result;
}

- (void)decrementRefCountForObjectID:(uint64_t)a1
{
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    Value = (atomic_uint *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), a2);
    if (Value && (int)atomic_fetch_add_explicit(Value + 3, 0xFFFFFFFF, memory_order_relaxed) <= 1) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 8), a2);
    }
    os_unfair_lock_unlock(v4);
  }
}

- (os_unfair_lock_s)ancillaryOrderKeysForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:
{
  if (result)
  {
    v7 = result;
    v8 = result + 9;
    os_unfair_lock_lock_with_options();
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)&v7[2]._os_unfair_lock_opaque, a2);
    if (Value && (uint64_t v10 = (uint64_t)Value, -[NSPersistentCacheRow timestampForProperty:]((uint64_t)Value, a3) > a4)) {
      id v11 = (id)-[NSPersistentCacheRow ancillaryOrderKeysForProperty:](v10, a3);
    }
    else {
      id v11 = 0;
    }
    os_unfair_lock_unlock(v8);
    return (os_unfair_lock_s *)v11;
  }
  return result;
}

- (void)incrementRefCountForObjectID:(uint64_t)a1
{
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    Value = (atomic_uint *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), a2);
    if (Value) {
      atomic_fetch_add_explicit(Value + 3, 1u, memory_order_relaxed);
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)registerToMany:(uint64_t)a1 withOrderKeys:(void *)a2 forSourceObjectID:(void *)a3 forProperty:(void *)a4 options:(void *)a5 andTimestamp:(double)a6
{
  if (a1)
  {
    v12 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    -[NSPersistentStoreCache _registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:](a1, a2, a3, a4, a5, a6);
    os_unfair_lock_unlock(v12);
  }
}

- (void)_registerToMany:(uint64_t)a1 withOrderKeys:(void *)a2 forSourceObjectID:(void *)a3 forProperty:(void *)key options:(void *)a5 andTimestamp:(double)a6
{
  if (a1)
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), key);
    -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](Value, a2, a5, a6);
    if (a3)
    {
      -[NSPersistentCacheRow setAncillaryOrderKeys:forProperty:options:andTimestamp:](Value, a3, a5);
    }
  }
}

- (uint64_t)toManyInformationForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:
{
  if (!a1) {
    return 0;
  }
  v8 = (os_unfair_lock_s *)(a1 + 36);
  os_unfair_lock_lock_with_options();
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), a2);
  if (!Value) {
    goto LABEL_8;
  }
  uint64_t v10 = Value;
  if (-[NSPersistentCacheRow timestampForProperty:]((uint64_t)Value, a3) <= a4) {
    goto LABEL_8;
  }
  if (!v10[3])
  {
    -[NSPersistentCacheRow ancillaryOrderKeysForProperty:]((uint64_t)v10, a3);
    goto LABEL_8;
  }
  uint64_t v11 = *(void *)(v10[3] + 24 * (void)-[NSPersistentCacheRow toManyOffsetForProperty:](v10, a3) + 8);
  uint64_t v12 = -[NSPersistentCacheRow ancillaryOrderKeysForProperty:]((uint64_t)v10, a3);
  if (!v11)
  {
LABEL_8:
    uint64_t v13 = 0;
    goto LABEL_9;
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v11, v12, 0);
LABEL_9:
  os_unfair_lock_unlock(v8);
  return v13;
}

- (NSPersistentStoreCache)initWithValueCallbacks:(void *)a3 preserveToManyRelationships:(BOOL)a4
{
  BOOL v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NSPersistentStoreCache;
  v6 = [(NSPersistentStoreCache *)&v12 init];
  uint64_t v7 = (uint64_t)v6;
  if (v6)
  {
    v6->_persistentStoreCacheFlags = (persistentStoreCacheFlags)(*(_DWORD *)&v6->_persistentStoreCacheFlags & 0xFFFFFFFE | v4);
    v8 = malloc_type_malloc(0x28uLL, 0x1080040EC4B14DAuLL);
    *(void *)(v7 + 24) = v8;
    uint64_t v9 = *((void *)a3 + 4);
    long long v10 = *((_OWORD *)a3 + 1);
    _OWORD *v8 = *(_OWORD *)a3;
    v8[1] = v10;
    *((void *)v8 + 4) = v9;
    -[NSPersistentStoreCache _createExternalDataDictWithValueCallbacks:](v7, *(CFDictionaryValueCallBacks **)(v7 + 24));
    *(_DWORD *)(v7 + 36) = 0;
  }
  return (NSPersistentStoreCache *)v7;
}

- (uint64_t)_createExternalDataDictWithValueCallbacks:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    v4.version = 0;
    v4.retain = (CFDictionaryRetainCallBack)_PFfastOidRetain;
    v3 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D530] + 24);
    v4.release = (CFDictionaryReleaseCallBack)_PFfastOidRelease;
    v4.copyDescription = v3;
    v4.equal = (CFDictionaryEqualCallBack)_PFObjectIDFastEquals64;
    v4.hash = (CFDictionaryHashCallBack)_PFObjectIDFastHash64;
    *(void *)(result + 8) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v4, valueCallBacks);
    result = _CFDictionarySetCapacity();
    *(void *)(v2 + 16) = 32;
  }
  return result;
}

- (NSPersistentStoreCache)init
{
  return [(NSPersistentStoreCache *)self initWithValueCallbacks:MEMORY[0x1E4F1D540] preserveToManyRelationships:0];
}

- (void)dealloc
{
  id externalData = self->_externalData;
  if (externalData)
  {
    CFRelease(externalData);
    self->_id externalData = 0;
  }
  externalDataValueCallbacks = self->_externalDataValueCallbacks;
  if (externalDataValueCallbacks) {
    free(externalDataValueCallbacks);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSPersistentStoreCache;
  [(NSPersistentStoreCache *)&v5 dealloc];
}

+ (void)initialize
{
}

- (void)forgetRowForObjectID:(uint64_t)a1
{
  if (a1)
  {
    CFDictionaryKeyCallBacks v4 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 8), a2);
    os_unfair_lock_unlock(v4);
  }
}

- (os_unfair_lock_s)toManyForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:
{
  if (result)
  {
    uint64_t v7 = result;
    v8 = result + 9;
    os_unfair_lock_lock_with_options();
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)&v7[2]._os_unfair_lock_opaque, a2);
    if (Value && (long long v10 = Value, -[NSPersistentCacheRow timestampForProperty:]((uint64_t)Value, a3) > a4))
    {
      uint64_t v11 = (void *)v10[3];
      if (v11) {
        uint64_t v11 = *(void **)(v10[3] + 24 * (void)-[NSPersistentCacheRow toManyOffsetForProperty:](v10, a3) + 8);
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    os_unfair_lock_unlock(v8);
    return (os_unfair_lock_s *)v12;
  }
  return result;
}

- (void)forgetAllExternalData
{
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();

    -[NSPersistentStoreCache _createExternalDataDictWithValueCallbacks:](a1, *(CFDictionaryValueCallBacks **)(a1 + 24));
    os_unfair_lock_unlock(v2);
  }
}

@end