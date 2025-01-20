@interface _NSCoreDataTaggedObjectID
+ (BOOL)_usesTaggedPointers;
+ (Class)classWithStore:(id)a3 andEntity:(id)a4;
+ (void)initialize;
- (BOOL)_isPersistentStoreAlive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporaryID;
- (_NSCoreDataTaggedObjectID)initWithObject:(id)a3;
- (id)_retainedURIString;
- (id)_storeIdentifier;
- (id)_storeInfo1;
- (id)entity;
- (id)entityName;
- (id)persistentStore;
- (int64_t)_referenceData64;
- (unint64_t)retainCount;
@end

@implementation _NSCoreDataTaggedObjectID

- (BOOL)isTemporaryID
{
  int v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    int v2 = 7;
  }
  return ((unint64_t)(v2 ^ self) >> 3) & 1;
}

- (id)entity
{
  int v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    int v2 = 7;
  }
  return (id)atomic_load((unint64_t *)(_PFTaggedPointersPool
                                            + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF)
                                            + 8));
}

- (BOOL)_isPersistentStoreAlive
{
  int v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    int v2 = 7;
  }
  v3 = (void *)atomic_load((unint64_t *)(_PFTaggedPointersPool
                                              + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF)));
  return [v3 _isPersistentStoreAlive];
}

- (int64_t)_referenceData64
{
  uint64_t v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v2 = 0;
  }
  unint64_t v3 = v2 ^ (unint64_t)self;
  uint64_t v4 = 0x3FFFFFFFFFFLL;
  if ((~(_BYTE)v3 & 7) == 0) {
    uint64_t v4 = 0x3FFFFFFFFLL;
  }
  return v4 & (v3 >> 21);
}

- (id)persistentStore
{
  int v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    int v2 = 7;
  }
  return (id)atomic_load((unint64_t *)(_PFTaggedPointersPool
                                            + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF)));
}

- (id)_storeInfo1
{
  if (!_PFTaggedPointersPool) {
    return 0;
  }
  int v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    int v2 = 7;
  }
  unint64_t v3 = (unint64_t *)(_PFTaggedPointersPool + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF));
  uint64_t v4 = (void *)atomic_load(v3);
  unint64_t v5 = atomic_load(v3 + 1);
  if (!v4 || v5 == 0) {
    return 0;
  }
  else {
    return (id)objc_msgSend(v4, "_storeInfoForEntityDescription:");
  }
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)entityName
{
  int v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    int v2 = 7;
  }
  return (id)atomic_load((unint64_t *)(_PFTaggedPointersPool
                                            + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF)
                                            + 24));
}

- (id)_storeIdentifier
{
  int v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    int v2 = 7;
  }
  return (id)atomic_load((unint64_t *)(_PFTaggedPointersPool
                                            + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF)
                                            + 16));
}

+ (Class)classWithStore:(id)a3 andEntity:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!_PFTaggedPointersPool)
  {
    uint64_t v23 = [NSString stringWithUTF8String:"Fatal attempt to reserve a tagged pointer slot without a pool for '%@': %@"];
    uint64_t v24 = [a4 name];
    _NSCoreDataLog(17, v23, v25, v26, v27, v28, v29, v30, v24);
    v31 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v32 = 138412546;
      *(void *)&v32[4] = [a4 name];
      *(_WORD *)&v32[12] = 2112;
      *(void *)&v32[14] = a3;
      _os_log_fault_impl(&dword_18AB82000, v31, OS_LOG_TYPE_FAULT, "CoreData: Fatal attempt to reserve a tagged pointer slot without a pool for '%@': %@", v32, 0x16u);
    }
    __break(1u);
  }
  int v6 = 0;
  uint64_t v7 = 24;
  while (1)
  {
    unint64_t v8 = atomic_load((unint64_t *)(_PFTaggedPointersPool + v7 - 8));
    if (!v8)
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)(_PFTaggedPointersPool + v7 - 24), &v8, (unint64_t)a3);
      if (!v8) {
        break;
      }
    }
    v7 += 32;
    ++v6;
    if (v7 == 4194328) {
      goto LABEL_6;
    }
  }
  v10 = (void *)[a3 identifier];
  uint64_t v11 = [a4 name];
  os_unfair_lock_lock_with_options();
  v12 = (void *)[(id)qword_1EB270608 member:v10];
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = (id)[v10 copy];
    [(id)qword_1EB270608 addObject:v13];
  }
  v14 = (void *)[(id)qword_1EB270608 member:v11];
  if (v14)
  {
    id v15 = v14;
  }
  else
  {
    id v15 = (id)[[NSString alloc] initWithString:v11];
    [(id)qword_1EB270608 addObject:v15];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1EB2705FC);
  uint64_t v16 = _PFTaggedPointersPool + v7;
  atomic_store((unint64_t)a4, (unint64_t *)(_PFTaggedPointersPool + v7 - 16));
  v17 = (void *)atomic_load((unint64_t *)(v16 - 8));
  v18 = (void *)atomic_load((unint64_t *)(_PFTaggedPointersPool + v7));
  uint64_t v19 = _PFTaggedPointersPool;
  v20 = v17;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(_PFTaggedPointersPool + v7 - 8), (unint64_t *)&v20, (unint64_t)v13, memory_order_relaxed, memory_order_relaxed);
  if (v20 != v17)
  {

    uint64_t v19 = _PFTaggedPointersPool;
  }
  v21 = v18;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(v19 + v7), (unint64_t *)&v21, (unint64_t)v15, memory_order_relaxed, memory_order_relaxed);
  if (v21 != v18) {

  }
  __dmb(0xBu);
  if (v7 == -8)
  {
LABEL_6:
    Class result = (Class)[(id)objc_opt_class() classWithStore:a3 andEntity:a4];
    goto LABEL_7;
  }
  v22 = (objc_class *)objc_opt_class();
  Class result = (Class)_PFAllocateObject(v22, 0);
  if (result)
  {
    *(void *)v32 = result;
    *(void *)&v32[8] = _NSCoreDataTaggedObjectIDFactory;
    Class result = (Class)objc_msgSendSuper2((objc_super *)v32, sel_init);
    if (result) {
      *((_DWORD *)result + 3) = v6;
    }
  }
LABEL_7:
  __dmb(0xBu);
  return result;
}

+ (void)initialize
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  self;
  Class = objc_getClass("_NSCoreDataTaggedObjectID");
  if (Class != (objc_class *)objc_opt_class())
  {
    uint64_t v6 = [NSString stringWithUTF8String:"Failure to initialize tagged pointers (classes don't match): %@:%p:%@:%p - %p\n%s\n%s"];
    NSStringFromClass(Class);
    class_getImageName((Class)a1);
    class_getImageName(Class);
    _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)a1);
    uint64_t v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138413826;
      id v25 = a1;
      __int16 v26 = 2048;
      id v27 = a1;
      __int16 v28 = 2112;
      uint64_t v29 = NSStringFromClass(Class);
      __int16 v30 = 2048;
      id v31 = Class;
      __int16 v32 = 2048;
      uint64_t v33 = _PFTaggedPointersPool;
      __int16 v34 = 2080;
      ImageName = class_getImageName((Class)a1);
      __int16 v36 = 2080;
      v37 = class_getImageName(Class);
      v14 = "CoreData: Failure to initialize tagged pointers (classes don't match): %@:%p:%@:%p - %p\n%s\n%s";
      id v15 = v13;
LABEL_12:
      _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, v14, buf, 0x48u);
    }
LABEL_13:
    __break(1u);
    return;
  }
  if (*MEMORY[0x1E4FBA8D8] && Class == a1 && !_PFTaggedPointersPool)
  {
    uint64_t v4 = (size_t *)MEMORY[0x1E4F14B00];
    size_t v5 = ((*MEMORY[0x1E4F14AF0] + 0x400000) & ~*MEMORY[0x1E4F14AF0]) + *MEMORY[0x1E4F14B00];
    _PFTaggedPointersPool = (uint64_t)mmap(0, v5, 3, 4098, 771751936, 0);
    mprotect((void *)(v5 + _PFTaggedPointersPool - *v4), *v4, 0);
    unk_1EB270600 = a1;
    _objc_registerTaggedPointerClass();
    qword_1EB270608 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    dword_1EB2705FC = 0;
    if (_PFTaggedPointersPool)
    {
      __dmb(0xBu);
      return;
    }
    uint64_t v16 = [NSString stringWithUTF8String:"Failure to initialize tagged pointers (pool is NULL after initialization attempt): %@:%p:%@:%p - %p\n%s\n%s"];
    NSStringFromClass((Class)a1);
    class_getImageName((Class)a1);
    class_getImageName((Class)a1);
    _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)a1);
    uint64_t v23 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138413826;
      id v25 = a1;
      __int16 v26 = 2048;
      id v27 = a1;
      __int16 v28 = 2112;
      uint64_t v29 = NSStringFromClass((Class)a1);
      __int16 v30 = 2048;
      id v31 = a1;
      __int16 v32 = 2048;
      uint64_t v33 = _PFTaggedPointersPool;
      __int16 v34 = 2080;
      ImageName = class_getImageName((Class)a1);
      __int16 v36 = 2080;
      v37 = class_getImageName((Class)a1);
      v14 = "CoreData: Failure to initialize tagged pointers (pool is NULL after initialization attempt): %@:%p:%@:%p - %p\n%s\n%s";
      id v15 = v23;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
}

- (_NSCoreDataTaggedObjectID)initWithObject:(id)a3
{
}

- (unint64_t)retainCount
{
  return -1;
}

- (id)_retainedURIString
{
  unint64_t v3 = [(_NSCoreDataTaggedObjectID *)self _storeIdentifier];
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = &stru_1ED787880;
  }
  uint64_t v5 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 ^ (unint64_t)self;
  unint64_t v7 = v6 >> 21;
  if ((v6 & 8) != 0) {
    return (id)[[NSString alloc] initWithFormat:@"%@://%@/%@/t%@%d", @"x-coredata", v4, -[_NSCoreDataTaggedObjectID entityName](self, "entityName"), _PFCoreDataProcessInstanceUUID(), v7];
  }
  BOOL v8 = (~(_BYTE)v6 & 7) == 0;
  uint64_t v9 = 0x3FFFFFFFFFFLL;
  if (v8) {
    uint64_t v9 = 0x3FFFFFFFFLL;
  }
  return (id)[[NSString alloc] initWithFormat:@"%@://%@/%@/p%qu", @"x-coredata", v4, -[_NSCoreDataTaggedObjectID entityName](self, "entityName"), v9 & v7, v11];
}

+ (BOOL)_usesTaggedPointers
{
  return 1;
}

@end