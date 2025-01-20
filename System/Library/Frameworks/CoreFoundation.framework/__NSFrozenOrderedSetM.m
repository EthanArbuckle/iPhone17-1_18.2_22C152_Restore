@interface __NSFrozenOrderedSetM
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)containsObject:(id)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countForObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSFrozenOrderedSetM

- (unint64_t)count
{
  return CFBasicHashGetCount((uint64_t)self->storage.set);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v29[1] = *(void *)off_1ECE0A5B0;
  p_storage = &self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || Count < location + length)
  {
    if (Count)
    {
      unint64_t v24 = Count;
      uint64_t v10 = _os_log_pack_size();
      v12 = (char *)v29 - ((MEMORY[0x1F4188790](v10, v25) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v26 = _os_log_pack_fill();
      double v27 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v26, (uint64_t)"_oset_getObjectsRange", location, length, --v24);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v27, "_oset_getObjectsRange", location, length, v24);
    }
    else
    {
      uint64_t v10 = _os_log_pack_size();
      v12 = (char *)v29 - ((MEMORY[0x1F4188790](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"_oset_getObjectsRange", location, length);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v14, "_oset_getObjectsRange", location, length);
    }
    v28 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v12 size:v10];
    objc_exception_throw(v28);
  }
  if (!a3 && length)
  {
    uint64_t v16 = _os_log_pack_size();
    v18 = (char *)v29 - ((MEMORY[0x1F4188790](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "_oset_getObjectsRange";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = length;
    CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "_oset_getObjectsRange", length);
    goto LABEL_14;
  }
  if (length >> 61)
  {
    uint64_t v16 = _os_log_pack_size();
    v18 = (char *)v29 - ((MEMORY[0x1F4188790](v16, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315394;
    *(void *)(v22 + 4) = "_oset_getObjectsRange";
    *(_WORD *)(v22 + 12) = 2048;
    *(void *)(v22 + 14) = length;
    CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "_oset_getObjectsRange", length);
LABEL_14:
    v23 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:v18 size:v16];
    objc_exception_throw(v23);
  }
  array = p_storage->array;

  -[NSArray getObjects:range:](array, "getObjects:range:", a3, location, length);
}

- (id)objectAtIndex:(unint64_t)a3
{
  v18[1] = *(void *)off_1ECE0A5B0;
  p_storage = &self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  if (Count <= a3)
  {
    if (Count)
    {
      unint64_t v13 = Count;
      uint64_t v8 = _os_log_pack_size();
      uint64_t v10 = (char *)v18 - ((MEMORY[0x1F4188790](v8, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v15 = _os_log_pack_fill();
      double v16 = __os_log_helper_1_2_3_8_32_8_0_8_0(v15, (uint64_t)"_oset_objectAtIndex", a3, --v13);
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v16, "_oset_objectAtIndex", a3, v13);
    }
    else
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v10 = (char *)v18 - ((MEMORY[0x1F4188790](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v11 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v11 = 136315394;
      *(void *)(v11 + 4) = "_oset_objectAtIndex";
      *(_WORD *)(v11 + 12) = 2048;
      *(void *)(v11 + 14) = a3;
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "_oset_objectAtIndex", a3);
    }
    uint64_t v17 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v12) userInfo:0 osLogPack:v10 size:v8];
    objc_exception_throw(v17);
  }
  array = p_storage->array;

  return [(NSArray *)array objectAtIndex:a3];
}

- (void)dealloc
{
}

- (unint64_t)countForObject:(id)a3
{
  unint64_t result = 0;
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  if (a3)
  {
    set = self->storage.set;
    if (set)
    {
      long long v6 = 0u;
      long long v7 = 0u;
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, (uint64_t *)&v6);
      return *((void *)&v7 + 1) != 0;
    }
  }
  return result;
}

- (BOOL)containsObject:(id)a3
{
  BOOL result = 0;
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  if (a3)
  {
    set = self->storage.set;
    if (set)
    {
      long long v6 = 0u;
      long long v7 = 0u;
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, (uint64_t *)&v6);
      return *((void *)&v7 + 1) != 0;
    }
  }
  return result;
}

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    p_storage = &self->storage;
    set = self->storage.set;
    if (set)
    {
      long long v7 = 0u;
      long long v8 = 0u;
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, (uint64_t *)&v7);
      if (*((void *)&v8 + 1)) {
        return [(NSArray *)p_storage->array indexOfObjectIdenticalTo:(void)v8];
      }
      else {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  return result;
}

- (id)mutableCopy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v5 = _cow_create((uint64_t)self, 0);
    uint64_t v6 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v6, (unint64_t)v5);
    if (v6) {
      free(v5);
    }
  }
  long long v7 = (objc_class *)self;
  id v8 = __CFAllocateObject(v7, 0);
  uint64_t v9 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 0, v9, (uint64_t)__NSOrderedSet_cowCallbacks, (uint64_t)v8, 1);
  return v8;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v11[1] = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v5 = _os_log_pack_size();
    long long v7 = (char *)v11 - ((MEMORY[0x1F4188790](v5, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "_oset_enumerateObjectsWithOptionsUsingBlock";
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "_oset_enumerateObjectsWithOptionsUsingBlock");
    uint64_t v10 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v9) userInfo:0 osLogPack:v7 size:v5];
    objc_exception_throw(v10);
  }
  array = self->storage.array;

  -[NSArray enumerateObjectsWithOptions:usingBlock:](array, "enumerateObjectsWithOptions:usingBlock:", a3);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v6 = _cow_create((uint64_t)self, 0);
    uint64_t v7 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v7, (unint64_t)v6);
    if (v7) {
      free(v6);
    }
  }
  uint64_t v8 = (objc_class *)self;
  id v9 = __CFAllocateObject(v8, 0);
  uint64_t v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 0, v10, (uint64_t)__NSOrderedSet_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

@end