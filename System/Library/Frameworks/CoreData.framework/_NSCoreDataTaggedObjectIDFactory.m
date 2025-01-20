@interface _NSCoreDataTaggedObjectIDFactory
- (_NSCoreDataTaggedObjectIDFactory)initWithPK64:(int64_t)a3;
- (_NSCoreDataTaggedObjectIDFactory)retain;
- (id)_fallbackFactory;
- (id)_storeInfo1;
- (id)managedObjectIDFromURIRepresentation:(id)a3;
- (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4;
- (unint64_t)retainCount;
- (unsigned)allocateBatch:(id *)a3 count:(unsigned int)a4;
- (void)_storeDeallocated;
- (void)dealloc;
- (void)release;
- (void)setObjectStoreIdentifier:(id)a3;
@end

@implementation _NSCoreDataTaggedObjectIDFactory

- (_NSCoreDataTaggedObjectIDFactory)initWithPK64:(int64_t)a3
{
  if (a3 > 0x3FFFFFFFFFFLL)
  {
    v6 = objc_msgSend(-[_NSCoreDataTaggedObjectIDFactory _fallbackFactory](self, "_fallbackFactory"), "alloc");
    return (_NSCoreDataTaggedObjectIDFactory *)[v6 initWithPK64:a3];
  }
  else
  {
    result = (_NSCoreDataTaggedObjectIDFactory *)((a3 << 21) | (16 * self->_taggedPoolIndex) | 0x8000000000000005);
    unint64_t v5 = (unint64_t)result ^ *MEMORY[0x1E4FBA8E0];
    if ((~v5 & 0xC000000000000007) != 0) {
      return (_NSCoreDataTaggedObjectIDFactory *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0]
    }
                                                                                                 + (v5 & 7)));
  }
  return result;
}

- (id)_storeInfo1
{
  if (!_PFTaggedPointersPool) {
    return 0;
  }
  v2 = (unint64_t *)(_PFTaggedPointersPool + 32 * self->_taggedPoolIndex);
  v3 = (void *)atomic_load(v2);
  unint64_t v4 = atomic_load(v2 + 1);
  if (!v3 || v4 == 0) {
    return 0;
  }
  else {
    return (id)objc_msgSend(v3, "_storeInfoForEntityDescription:");
  }
}

- (unsigned)allocateBatch:(id *)a3 count:(unsigned int)a4
{
  unint64_t v5 = (16 * self->_taggedPoolIndex) | 0x8000000000000005;
  unint64_t v6 = v5 ^ *MEMORY[0x1E4FBA8E0];
  if ((~v6 & 0xC000000000000007) != 0) {
    unint64_t v5 = v6 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v6 & 7));
  }
  unint64_t __pattern8 = v5;
  memset_pattern8(a3, &__pattern8, 8 * a4);
  return a4;
}

- (_NSCoreDataTaggedObjectIDFactory)retain
{
  return self;
}

- (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4
{
  __endptr = 0;
  unint64_t v6 = strtouq(a3, &__endptr, 0);
  id result = 0;
  if (__endptr) {
    BOOL v8 = __endptr == a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    if (v6 >> 42)
    {
      return (id)objc_msgSend((id)objc_msgSend(-[_NSCoreDataTaggedObjectIDFactory _fallbackFactory](self, "_fallbackFactory"), "alloc"), "initWithPK64:", v6);
    }
    else
    {
      id result = (id)((v6 << 21) | (16 * self->_taggedPoolIndex) | 0x8000000000000005);
      unint64_t v9 = (unint64_t)result ^ *MEMORY[0x1E4FBA8E0];
      if ((~v9 & 0xC000000000000007) != 0) {
        return (id)(v9 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v9 & 7)));
      }
    }
  }
  return result;
}

- (void)release
{
  if ((int)atomic_fetch_add_explicit(&self->_cd_rc, 0xFFFFFFFF, memory_order_relaxed) <= 0)
  {
    self->_cd_rc += 0x20000000;
    [(_NSCoreDataTaggedObjectIDFactory *)self dealloc];
  }
}

- (void)_storeDeallocated
{
  v2 = (unint64_t *)(_PFTaggedPointersPool + 32 * self->_taggedPoolIndex);
  unint64_t v3 = atomic_load(v2);
  atomic_compare_exchange_strong((atomic_ullong *volatile)v2, &v3, 0);
}

- (void)dealloc
{
  unint64_t v3 = (unint64_t *)(_PFTaggedPointersPool + 32 * self->_taggedPoolIndex);
  atomic_store(0, v3 + 1);
  unint64_t v4 = atomic_load(v3);
  atomic_compare_exchange_strong((atomic_ullong *volatile)v3, &v4, 0);

  self->_fallbackFactories = 0;

  _PFDeallocateObject(self);
}

- (unint64_t)retainCount
{
  return self->_cd_rc + 1;
}

- (id)_fallbackFactory
{
  id result = self->_fallbackFactories;
  if (!result)
  {
    unint64_t v4 = objc_opt_class();
    uint64_t v5 = _PFTaggedPointersPool;
    unint64_t v6 = atomic_load((unint64_t *)(_PFTaggedPointersPool + 32 * self->_taggedPoolIndex));
    unint64_t v7 = atomic_load((unint64_t *)(v5 + 32 * self->_taggedPoolIndex + 8));
    id result = (id)[v4 classWithStore:v6 andEntity:v7];
    self->_fallbackFactories = result;
  }
  return result;
}

- (id)managedObjectIDFromURIRepresentation:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x18C127630](self, a2);
  unint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "path"), "pathComponents"), "objectAtIndex:", 2);
  unint64_t v16 = 0;
  uint64_t v7 = _PFTaggedPointersPool;
  unint64_t v8 = atomic_load((unint64_t *)(_PFTaggedPointersPool + 32 * self->_taggedPoolIndex));
  unint64_t v9 = atomic_load((unint64_t *)(v7 + 32 * self->_taggedPoolIndex + 8));
  char v10 = [v6 characterAtIndex:0];
  v11 = (void *)[v6 substringFromIndex:1];
  if (v10 != 116
    || (v12 = [[NSTemporaryObjectID alloc] initWithEntity:v9 andUUIDString:v11], [(NSTemporaryObjectID *)v12 _setPersistentStore:v8], !v12))
  {
    if (+[_PFRoutines convertCString:toUnsignedInt64:withBase:]((uint64_t)_PFRoutines, (const char *)[v11 UTF8String], &v16, 0))
    {
      if (!(v16 >> 42))
      {
        unint64_t v13 = (v16 << 21) | (16 * self->_taggedPoolIndex) | 0x8000000000000005;
        unint64_t v14 = v13 ^ *MEMORY[0x1E4FBA8E0];
        if ((~v14 & 0xC000000000000007) != 0) {
          unint64_t v13 = v14 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v14 & 7));
        }
        return (id)v13;
      }
      v12 = (NSTemporaryObjectID *)objc_msgSend((id)objc_msgSend(-[_NSCoreDataTaggedObjectIDFactory _fallbackFactory](self, "_fallbackFactory"), "alloc"), "initWithPK64:", v16);
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (void)setObjectStoreIdentifier:(id)a3
{
  unint64_t v4 = (unint64_t *)(_PFTaggedPointersPool + 32 * self->_taggedPoolIndex + 16);
  uint64_t v5 = (void *)atomic_load(v4);
  unint64_t v9 = v5;
  if ((objc_msgSend(v5, "isEqual:") & 1) == 0)
  {
    unint64_t v6 = (void *)[a3 copy];
    uint64_t v7 = v9;
    unint64_t v8 = v9;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v4, (unint64_t *)&v8, (unint64_t)v6);
    if (v8 != v7)
    {

      uint64_t v7 = v9;
    }
    MEMORY[0x1F41817F8](v6, v7);
  }
}

@end