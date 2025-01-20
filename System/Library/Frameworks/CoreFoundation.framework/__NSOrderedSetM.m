@interface __NSOrderedSetM
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)containsObject:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countForObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (void)_mutate;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setObject:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation __NSOrderedSetM

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    p_storage = &self->storage;
    uint64_t set = (uint64_t)p_storage->set;
    if (p_storage->set)
    {
      long long v9 = 0u;
      long long v10 = 0u;
      CFBasicHashFindBucket(set, (unint64_t)a3, (uint64_t *)&v9);
      if (*((void *)&v10 + 1)) {
        return [(NSArray *)p_storage->array indexOfObjectIdenticalTo:(void)v10];
      }
      else {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  return result;
}

- (void)removeAllObjects
{
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  v21[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  uint64_t v6 = atomic_load((unint64_t *)&self->cow);
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6)) {
      -[__NSOrderedSetM removeObjectAtIndex:]();
    }
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)self, v6, (uint64_t)__NSOrderedSet_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v6);
  }
  p_storage = &self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)p_storage->set);
  if ((a3 & 0x8000000000000000) != 0 || Count <= a3)
  {
    if (Count)
    {
      unint64_t v16 = Count;
      uint64_t v11 = _os_log_pack_size();
      v13 = (char *)v21 - ((MEMORY[0x1F4188790](v11, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v18 = _os_log_pack_fill();
      double v19 = __os_log_helper_1_2_3_8_32_8_0_8_0(v18, (uint64_t)"-[__NSOrderedSetM removeObjectAtIndex:]", a3, --v16);
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v19, "-[__NSOrderedSetM removeObjectAtIndex:]", a3, v16);
    }
    else
    {
      uint64_t v11 = _os_log_pack_size();
      v13 = (char *)v21 - ((MEMORY[0x1F4188790](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v14 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v14 = 136315394;
      *(void *)(v14 + 4) = "-[__NSOrderedSetM removeObjectAtIndex:]";
      *(_WORD *)(v14 + 12) = 2048;
      *(void *)(v14 + 14) = a3;
      CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[__NSOrderedSetM removeObjectAtIndex:]", a3);
    }
    v20 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v13 size:v11];
    objc_exception_throw(v20);
  }
  CFBasicHashRemoveValue((uint64_t)p_storage->set, (unint64_t)[(NSArray *)p_storage->array objectAtIndex:a3]);
  array = p_storage->array;

  [(NSMutableArray *)array removeObjectAtIndex:a3];
}

- (unint64_t)count
{
  return CFBasicHashGetCount((uint64_t)self->storage.set);
}

- (void)_mutate
{
  array = self->storage.array;
  [(NSMutableArray *)array _mutate];
  v4 = (void (*)(NSMutableArray *, uint64_t, uint64_t))__cf_tsanWriteFunction;
  if (__cf_tsanWriteFunction)
  {
    uint64_t v5 = __CFTSANTagMutableOrderedSet;
    v4(array, v2, v5);
  }
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v31[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  p_storage = (uint64_t *)&self->storage;
  unint64_t Count = CFBasicHashGetCount(*p_storage);
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || Count < location + length)
  {
    if (Count)
    {
      unint64_t v26 = Count;
      uint64_t v12 = _os_log_pack_size();
      uint64_t v14 = (char *)v31 - ((MEMORY[0x1F4188790](v12, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v28 = _os_log_pack_fill();
      double v29 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v28, (uint64_t)"_oset_getObjectsRange", location, length, --v26);
      CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v29, "_oset_getObjectsRange", location, length, v26);
    }
    else
    {
      uint64_t v12 = _os_log_pack_size();
      uint64_t v14 = (char *)v31 - ((MEMORY[0x1F4188790](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v15 = _os_log_pack_fill();
      double v16 = __os_log_helper_1_2_3_8_32_8_0_8_0(v15, (uint64_t)"_oset_getObjectsRange", location, length);
      CFStringRef v17 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set", v16, "_oset_getObjectsRange", location, length);
    }
    v30 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v17) userInfo:0 osLogPack:v14 size:v12];
    objc_exception_throw(v30);
  }
  if (!a3 && length)
  {
    uint64_t v18 = _os_log_pack_size();
    v20 = (char *)v31 - ((MEMORY[0x1F4188790](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = "_oset_getObjectsRange";
    *(_WORD *)(v21 + 12) = 2048;
    *(void *)(v21 + 14) = length;
    CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "_oset_getObjectsRange", length);
    goto LABEL_16;
  }
  if (length >> 61)
  {
    uint64_t v18 = _os_log_pack_size();
    v20 = (char *)v31 - ((MEMORY[0x1F4188790](v18, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v24 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v24 = 136315394;
    *(void *)(v24 + 4) = "_oset_getObjectsRange";
    *(_WORD *)(v24 + 12) = 2048;
    *(void *)(v24 + 14) = length;
    CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "_oset_getObjectsRange", length);
LABEL_16:
    v25 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v22) userInfo:0 osLogPack:v20 size:v18];
    objc_exception_throw(v25);
  }
  uint64_t v11 = (void *)p_storage[1];

  objc_msgSend(v11, "getObjects:range:", a3, location, length);
}

- (id)objectAtIndex:(unint64_t)a3
{
  v20[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  p_storage = (uint64_t *)&self->storage;
  unint64_t Count = CFBasicHashGetCount(*p_storage);
  if (Count <= a3)
  {
    if (Count)
    {
      unint64_t v15 = Count;
      uint64_t v10 = _os_log_pack_size();
      uint64_t v12 = (char *)v20 - ((MEMORY[0x1F4188790](v10, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"_oset_objectAtIndex", a3, --v15);
      CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v18, "_oset_objectAtIndex", a3, v15);
    }
    else
    {
      uint64_t v10 = _os_log_pack_size();
      uint64_t v12 = (char *)v20 - ((MEMORY[0x1F4188790](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v13 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v13 = 136315394;
      *(void *)(v13 + 4) = "_oset_objectAtIndex";
      *(_WORD *)(v13 + 12) = 2048;
      *(void *)(v13 + 14) = a3;
      CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "_oset_objectAtIndex", a3);
    }
    uint64_t v19 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v10];
    objc_exception_throw(v19);
  }
  v8 = (void *)p_storage[1];

  return (id)[v8 objectAtIndex:a3];
}

- (void)dealloc
{
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  unint64_t result = 0;
  if (a3)
  {
    uint64_t set = self->storage.set;
    if (set)
    {
      long long v8 = 0u;
      long long v9 = 0u;
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, (uint64_t *)&v8);
      return *((void *)&v9 + 1) != 0;
    }
  }
  return result;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  v33[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSOrderedSetM insertObject:atIndex:]();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSOrderedSet_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  if (!a3)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v16 = (char *)v33 - ((MEMORY[0x1F4188790](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[__NSOrderedSetM insertObject:atIndex:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[__NSOrderedSetM insertObject:atIndex:]");
    uint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:v16 size:v14];
    objc_exception_throw(v19);
  }
  p_storage = (uint64_t *)&self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  unint64_t v12 = Count;
  if ((a4 & 0x8000000000000000) != 0 || Count < a4)
  {
    if (Count)
    {
      uint64_t v20 = _os_log_pack_size();
      uint64_t v28 = (char *)v33 - ((MEMORY[0x1F4188790](v20, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v29 = _os_log_pack_fill();
      uint64_t v30 = v12 - 1;
      double v31 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[__NSOrderedSetM insertObject:atIndex:]", a4, v30);
      CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v31, "-[__NSOrderedSetM insertObject:atIndex:]", a4, v30);
      uint64_t v25 = _CFAutoreleasePoolAddObject(0, (uint64_t)v32);
      unint64_t v26 = v28;
    }
    else
    {
      uint64_t v20 = _os_log_pack_size();
      CFStringRef v22 = (char *)v33 - ((MEMORY[0x1F4188790](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v23 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v23 = 136315394;
      *(void *)(v23 + 4) = "-[__NSOrderedSetM insertObject:atIndex:]";
      *(_WORD *)(v23 + 12) = 2048;
      *(void *)(v23 + 14) = a4;
      CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[__NSOrderedSetM insertObject:atIndex:]", a4);
      uint64_t v25 = _CFAutoreleasePoolAddObject(0, (uint64_t)v24);
      unint64_t v26 = v22;
    }
    objc_exception_throw(+[NSException exceptionWithName:@"NSRangeException" reason:v25 userInfo:0 osLogPack:v26 size:v20]);
  }
  if (CFBasicHashAddValue(*p_storage, (unint64_t)a3, (uint64_t)a3))
  {
    uint64_t v13 = (void *)p_storage[1];
    [v13 insertObject:a3 atIndex:a4];
  }
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  BOOL result = 0;
  if (a3)
  {
    uint64_t set = self->storage.set;
    if (set)
    {
      long long v8 = 0u;
      long long v9 = 0u;
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, (uint64_t *)&v8);
      return *((void *)&v9 + 1) != 0;
    }
  }
  return result;
}

- (id)copy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v5 = _cow_create((uint64_t)self, 1);
    uint64_t v6 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v6, (unint64_t)v5);
    if (v6) {
      free(v5);
    }
  }
  v7 = (objc_class *)self;
  id v8 = __CFAllocateObject(v7, 0);
  long long v9 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v9, (uint64_t)__NSOrderedSet_cowCallbacks, (uint64_t)v8, 0);
  return v8;
}

- (id)mutableCopy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v5 = _cow_create((uint64_t)self, 1);
    uint64_t v6 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v6, (unint64_t)v5);
    if (v6) {
      free(v5);
    }
  }
  v7 = (objc_class *)self;
  id v8 = __CFAllocateObject(v7, 0);
  long long v9 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v9, (uint64_t)__NSOrderedSet_cowCallbacks, (uint64_t)v8, 1);
  return v8;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v15[1] = *(void *)off_1ECE0A5B0;
  if (!__cf_tsanReadFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v9 = _os_log_pack_size();
    uint64_t v11 = (char *)v15 - ((MEMORY[0x1F4188790](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "_oset_enumerateObjectsWithOptionsUsingBlock";
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "_oset_enumerateObjectsWithOptionsUsingBlock");
    uint64_t v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:v11 size:v9];
    objc_exception_throw(v14);
  }
  __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  if (!a4) {
    goto LABEL_7;
  }
LABEL_3:
  array = self->storage.array;

  [(NSArray *)array enumerateObjectsWithOptions:a3 usingBlock:a4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v6 = _cow_create((uint64_t)self, 1);
    uint64_t v7 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v7, (unint64_t)v6);
    if (v7) {
      free(v6);
    }
  }
  id v8 = (objc_class *)self;
  id v9 = __CFAllocateObject(v8, 0);
  uint64_t v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v10, (uint64_t)__NSOrderedSet_cowCallbacks, (uint64_t)v9, 0);
  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v6 = _cow_create((uint64_t)self, 1);
    uint64_t v7 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v7, (unint64_t)v6);
    if (v7) {
      free(v6);
    }
  }
  id v8 = (objc_class *)self;
  id v9 = __CFAllocateObject(v8, 0);
  uint64_t v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v10, (uint64_t)__NSOrderedSet_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  v35[4] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSOrderedSetM replaceObjectAtIndex:withObject:]();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSOrderedSet_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  if (!a4)
  {
    uint64_t v15 = _os_log_pack_size();
    uint64_t v17 = (char *)&v35[-1] - ((MEMORY[0x1F4188790](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]";
    CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]");
    uint64_t v20 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v19) userInfo:0 osLogPack:v17 size:v15];
    objc_exception_throw(v20);
  }
  p_storage = &self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  unint64_t v12 = Count;
  if ((a3 & 0x8000000000000000) != 0 || Count <= a3)
  {
    if (Count)
    {
      uint64_t v21 = _os_log_pack_size();
      uint64_t v29 = (char *)&v35[-1] - ((MEMORY[0x1F4188790](v21, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v30 = _os_log_pack_fill();
      uint64_t v31 = v12 - 1;
      double v32 = __os_log_helper_1_2_3_8_32_8_0_8_0(v30, (uint64_t)"-[__NSOrderedSetM replaceObjectAtIndex:withObject:]", a3, v31);
      CFStringRef v33 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v32, "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]", a3, v31);
      uint64_t v26 = _CFAutoreleasePoolAddObject(0, (uint64_t)v33);
      uint64_t v27 = v29;
    }
    else
    {
      uint64_t v21 = _os_log_pack_size();
      uint64_t v23 = (char *)&v35[-1] - ((MEMORY[0x1F4188790](v21, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v24 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v24 = 136315394;
      *(void *)(v24 + 4) = "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]";
      *(_WORD *)(v24 + 12) = 2048;
      *(void *)(v24 + 14) = a3;
      CFStringRef v25 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]", a3);
      uint64_t v26 = _CFAutoreleasePoolAddObject(0, (uint64_t)v25);
      uint64_t v27 = v23;
    }
    objc_exception_throw(+[NSException exceptionWithName:@"NSRangeException" reason:v26 userInfo:0 osLogPack:v27 size:v21]);
  }
  id v13 = [(NSArray *)p_storage->array objectAtIndex:a3];
  unint64_t v14 = (unint64_t)v13;
  if (v13 != a4 && [v13 isEqual:a4]
    || (CFBasicHashFindBucket((uint64_t)p_storage->set, (unint64_t)a4, v35), !v35[3]))
  {
    CFBasicHashRemoveValue((uint64_t)p_storage->set, v14);
    CFBasicHashAddValue((uint64_t)p_storage->set, (unint64_t)a4, (uint64_t)a4);
    [(NSMutableArray *)p_storage->array replaceObjectAtIndex:a3 withObject:a4];
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  v36[4] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSOrderedSetM setObject:atIndex:]();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSOrderedSet_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  if (!a3)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v18 = (char *)&v36[-1] - ((MEMORY[0x1F4188790](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[__NSOrderedSetM setObject:atIndex:]";
    CFStringRef v20 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[__NSOrderedSetM setObject:atIndex:]");
    uint64_t v21 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v20) userInfo:0 osLogPack:v18 size:v16];
    objc_exception_throw(v21);
  }
  p_storage = &self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  unint64_t v12 = Count;
  if ((a4 & 0x8000000000000000) != 0 || Count < a4)
  {
    if (Count)
    {
      uint64_t v22 = _os_log_pack_size();
      uint64_t v30 = (char *)&v36[-1] - ((MEMORY[0x1F4188790](v22, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v31 = _os_log_pack_fill();
      uint64_t v32 = v12 - 1;
      double v33 = __os_log_helper_1_2_3_8_32_8_0_8_0(v31, (uint64_t)"-[__NSOrderedSetM setObject:atIndex:]", a4, v32);
      CFStringRef v34 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v33, "-[__NSOrderedSetM setObject:atIndex:]", a4, v32);
      uint64_t v27 = _CFAutoreleasePoolAddObject(0, (uint64_t)v34);
      uint64_t v28 = v30;
    }
    else
    {
      uint64_t v22 = _os_log_pack_size();
      uint64_t v24 = (char *)&v36[-1] - ((MEMORY[0x1F4188790](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v25 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v25 = 136315394;
      *(void *)(v25 + 4) = "-[__NSOrderedSetM setObject:atIndex:]";
      *(_WORD *)(v25 + 12) = 2048;
      *(void *)(v25 + 14) = a4;
      CFStringRef v26 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty ordered set", "-[__NSOrderedSetM setObject:atIndex:]", a4);
      uint64_t v27 = _CFAutoreleasePoolAddObject(0, (uint64_t)v26);
      uint64_t v28 = v24;
    }
    objc_exception_throw(+[NSException exceptionWithName:@"NSRangeException" reason:v27 userInfo:0 osLogPack:v28 size:v22]);
  }
  if (Count == a4)
  {
    if (CFBasicHashAddValue((uint64_t)p_storage->set, (unint64_t)a3, (uint64_t)a3))
    {
      array = p_storage->array;
      [(NSMutableArray *)array insertObject:a3 atIndex:a4];
    }
  }
  else
  {
    id v14 = [(NSArray *)p_storage->array objectAtIndex:a4];
    unint64_t v15 = (unint64_t)v14;
    if (v14 != a3 && [v14 isEqual:a3]
      || (CFBasicHashFindBucket((uint64_t)p_storage->set, (unint64_t)a3, v36), !v36[3]))
    {
      CFBasicHashRemoveValue((uint64_t)p_storage->set, v15);
      CFBasicHashAddValue((uint64_t)p_storage->set, (unint64_t)a3, (uint64_t)a3);
      [(NSMutableArray *)p_storage->array replaceObjectAtIndex:a4 withObject:a3];
    }
  }
}

- (void)insertObject:atIndex:.cold.1()
{
}

- (void)removeObjectAtIndex:.cold.1()
{
}

- (void)replaceObjectAtIndex:withObject:.cold.1()
{
}

- (void)setObject:atIndex:.cold.1()
{
}

@end