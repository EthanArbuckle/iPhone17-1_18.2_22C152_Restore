@interface NSTemporaryObjectID
+ (BOOL)_usesTaggedPointers;
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (Class)classForStore:(id)a3;
+ (id)_retain_1;
+ (id)initWithEntity:(id)a3;
+ (id)initWithEntity:(id)a3 andUUIDString:(id)a4;
+ (int64_t)version;
+ (unsigned)allocateBatch:(id *)a3 forEntity:(id)a4 count:(unsigned int)a5;
+ (void)_storeDeallocated;
+ (void)initialize;
+ (void)setObjectStoreIdentifier:(id)a3;
- (BOOL)_isPersistentStoreAlive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporaryID;
- (NSTemporaryObjectID)initWithEntity:(id)a3;
- (NSTemporaryObjectID)initWithEntity:(id)a3 andUUIDString:(id)a4;
- (NSTemporaryObjectID)retain;
- (id)URIRepresentation;
- (id)_referenceData;
- (id)_retainedURIString;
- (id)_storeIdentifier;
- (id)entity;
- (id)persistentStore;
- (int)_temporaryIDCounter;
- (unint64_t)hash;
- (unint64_t)retainCount;
- (void)_setPersistentStore:(id)a3;
- (void)dealloc;
- (void)release;
@end

@implementation NSTemporaryObjectID

- (id)entity
{
  return self->_entity;
}

- (BOOL)isTemporaryID
{
  return 1;
}

- (BOOL)_isPersistentStoreAlive
{
  Class Class = object_getClass(self);
  IndexedIvars = object_getIndexedIvars(Class);
  if (IndexedIvars)
  {
    v4 = (void *)IndexedIvars[1];
    LOBYTE(IndexedIvars) = [v4 _isPersistentStoreAlive];
  }
  return (char)IndexedIvars;
}

- (NSTemporaryObjectID)retain
{
  return self;
}

- (unint64_t)hash
{
  return __rbit32(self->_counter);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return self->_counter == *((_DWORD *)a3 + 3);
    }
  }
  return 0;
}

- (void)release
{
  if ((int)atomic_fetch_add_explicit(&self->_cd_rc, 0xFFFFFFFF, memory_order_relaxed) <= 0)
  {
    self->_cd_rc += 0x20000000;
    [(NSTemporaryObjectID *)self dealloc];
  }
}

- (void)dealloc
{
  self->_entity = 0;
  if (object_getClass(self) != (Class)_NSTemporaryObjectID_Default_Class)
  {
    Class Class = object_getClass(self);
    _PFfastFactoryRelease2(Class);
  }

  _PFDeallocateObject(self);
}

+ (void)initialize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (objc_getClass("NSTemporaryObjectID") == a1)
  {
    self;
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    qword_1EB2704A0 = (uint64_t)[(char *)[_NS128bitWrapper alloc] initWithBytes:out];
    _CoreDataProcessInstanceTempIDCounter = 1;
    object_getIndexedIvars(a1);
    qword_1EB2704A8 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    _NSTemporaryObjectID_Default_Class Class = (uint64_t)objc_allocateClassPair((Class)a1, "NSTemporaryObjectID_default", 0x18uLL);
    objc_registerClassPair((Class)_NSTemporaryObjectID_Default_Class);
  }
}

- (id)persistentStore
{
  Class Class = object_getClass(self);
  id result = object_getIndexedIvars(Class);
  if (result) {
    return (id)*((void *)result + 1);
  }
  return result;
}

- (void)_setPersistentStore:(id)a3
{
  Class Class = object_getClass(self);
  IndexedIvars = (id *)object_getIndexedIvars(Class);
  if (a3 && IndexedIvars[1] != a3)
  {
    v7 = _PFFastStoreTemporaryIDClass((uint64_t)a3);
    atomic_fetch_add_explicit((atomic_uint *volatile)object_getIndexedIvars(v7), 1u, memory_order_relaxed);
    object_setClass(self, v7);
  }
}

+ (Class)classForStore:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Store must not be nil." userInfo:0]);
  }
  Name = class_getName((Class)a1);
  snprintf(__str, 0x100uLL, "%s_%x", Name, 0);
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_7);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v6 = (void *)qword_1EB2704A8;
  uint64_t v7 = [(id)qword_1EB2704A8 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v36 != v9) {
        objc_enumerationMutation(v6);
      }
      Class v11 = *(Class *)(*((void *)&v35 + 1) + 8 * v10);
      IndexedIvars = (atomic_uint *)object_getIndexedIvars(v11);
      if (IndexedIvars)
      {
        if (!*((void *)IndexedIvars + 1))
        {
          int v13 = -1;
          atomic_compare_exchange_strong(IndexedIvars, (unsigned int *)&v13, 0);
          if (v13 == -1) {
            break;
          }
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v8) {
          goto LABEL_4;
        }
        goto LABEL_15;
      }
    }
    if (!v11) {
      goto LABEL_15;
    }
LABEL_14:
    atomic_fetch_add_explicit((atomic_uint *volatile)object_getIndexedIvars(v11), 1u, memory_order_relaxed);
  }
  else
  {
LABEL_15:
    int v14 = 1;
    while (1)
    {
      Class Class = objc_getClass(__str);
      if (!Class) {
        break;
      }
      Class v11 = Class;
      int v16 = v14;
LABEL_21:
      v20 = (atomic_uint *)object_getIndexedIvars(v11);
      if (!*((void *)v20 + 1))
      {
        int v21 = -1;
        atomic_compare_exchange_strong(v20, (unsigned int *)&v21, 0);
        if (v21 == -1) {
          goto LABEL_14;
        }
      }
      v22 = class_getName((Class)a1);
      int v14 = v16 + 1;
      snprintf(__str, 0x100uLL, "%s_%x", v22, v16);
    }
    while (1)
    {
      Class ClassPair = objc_allocateClassPair((Class)a1, __str, 0x18uLL);
      if (ClassPair) {
        break;
      }
      v18 = class_getName((Class)a1);
      int v16 = v14 + 1;
      snprintf(__str, 0x100uLL, "%s_%x", v18, v14);
      Class v19 = objc_getClass(__str);
      ++v14;
      if (v19)
      {
        Class v11 = v19;
        goto LABEL_21;
      }
    }
    Class v11 = ClassPair;
    v23 = object_getClass(ClassPair);
    ClassMethod = class_getClassMethod(v11, sel__retain_1);
    Implementation = method_getImplementation(ClassMethod);
    TypeEncoding = method_getTypeEncoding(ClassMethod);
    class_addMethod(v23, sel_retain, Implementation, TypeEncoding);
    v27 = class_getClassMethod(v11, sel__release_1);
    v28 = method_getImplementation(v27);
    v29 = method_getTypeEncoding(v27);
    class_addMethod(v23, sel_release, v28, v29);
    objc_registerClassPair(v11);
    CFArrayAppendValue((CFMutableArrayRef)qword_1EB2704A8, v11);
  }
  v30 = object_getIndexedIvars(v11);
  if (!v30[1])
  {
    v31 = v30;
    *(_DWORD *)v30 = 0;
    v30[1] = a3;
    v32 = objc_msgSend((id)objc_msgSend(a3, "identifier"), "copy");
    if (v32)
    {
      v33 = v32;
      v31[2] = CFRetain(v32);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_7);
  return v11;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (void)_storeDeallocated
{
  IndexedIvars = object_getIndexedIvars(a1);
  if (IndexedIvars)
  {
    IndexedIvars[1] = 0;
    __dmb(0xBu);
  }
}

+ (void)setObjectStoreIdentifier:(id)a3
{
  IndexedIvars = object_getIndexedIvars(a1);
  id v5 = (id)IndexedIvars[2];
  if (v5 != a3)
  {
    if (v5) {
      CFRelease(v5);
    }
    v6 = (void *)CFRetain((CFTypeRef)[a3 copy]);
    IndexedIvars[2] = v6;
  }
}

+ (BOOL)_usesTaggedPointers
{
  return 0;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (int64_t)version
{
  return 134481920;
}

+ (id)_retain_1
{
  return a1;
}

- (unint64_t)retainCount
{
  return self->_cd_rc + 1;
}

+ (unsigned)allocateBatch:(id *)a3 forEntity:(id)a4 count:(unsigned int)a5
{
  unsigned int v5 = a5;
  if (_PFAllocateObjects((objc_class *)_NSTemporaryObjectID_Default_Class, a3, a5, 0) != a5) {
    return 0;
  }
  unsigned int add_explicit = atomic_fetch_add_explicit(&_CoreDataProcessInstanceTempIDCounter, v5, memory_order_relaxed);
  if (v5)
  {
    uint64_t v9 = 0;
    unsigned int v10 = add_explicit + 1;
    do
    {
      Class v11 = a3[v9];
      v11[3] = v10 + v9;
      *((void *)v11 + 2) = a4;
      ++v9;
    }
    while (v5 != v9);
  }
  return v5;
}

+ (id)initWithEntity:(id)a3
{
  return _PFFastTemporaryIDCreation(a3);
}

+ (id)initWithEntity:(id)a3 andUUIDString:(id)a4
{
  return +[_NSTemporaryObjectID2 initWithEntity:a3 andUUIDString:a4];
}

- (NSTemporaryObjectID)initWithEntity:(id)a3
{
  return +[NSTemporaryObjectID initWithEntity:a3];
}

- (NSTemporaryObjectID)initWithEntity:(id)a3 andUUIDString:(id)a4
{
  return (NSTemporaryObjectID *)+[_NSTemporaryObjectID2 initWithEntity:a3 andUUIDString:a4];
}

- (int)_temporaryIDCounter
{
  return self->_counter;
}

- (id)_storeIdentifier
{
  Class Class = object_getClass(self);
  id result = object_getIndexedIvars(Class);
  if (result)
  {
    uint64_t v4 = (id *)result;
    id result = (id)*((void *)result + 2);
    if (!result)
    {
      objc_msgSend((id)objc_opt_class(), "setObjectStoreIdentifier:", objc_msgSend(v4[1], "identifier"));
      return v4[2];
    }
  }
  return result;
}

- (id)_retainedURIString
{
  v3 = [(NSTemporaryObjectID *)self _storeIdentifier];
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = &stru_1ED787880;
  }
  int counter = self->_counter;
  id v6 = [NSString alloc];
  uint64_t v7 = objc_msgSend(-[NSTemporaryObjectID entity](self, "entity"), "name");
  id v8 = [(NSTemporaryObjectID *)self _referenceData];
  if (counter) {
    return (id)[v6 initWithFormat:@"%@://%@/%@/t%@%d", @"x-coredata", v4, v7, v8, self->_counter];
  }
  else {
    return (id)[v6 initWithFormat:@"%@://%@/%@/t%@", @"x-coredata", v4, v7, v8, v10];
  }
}

- (id)URIRepresentation
{
  v3 = (void *)MEMORY[0x18C127630](self, a2);
  id v4 = [(NSTemporaryObjectID *)self _retainedURIString];
  unsigned int v5 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:v4];

  id v6 = v5;

  return v5;
}

- (id)_referenceData
{
  return (id)qword_1EB2704A0;
}

@end