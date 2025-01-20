@interface _NSCoreManagedObjectID
+ (BOOL)_usesTaggedPointers;
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (Class)classWithStore:(id)a3 andEntity:(id)a4;
+ (char)generatedNameSuffix;
+ (id)_retain_1;
+ (id)_storeInfo1;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)managedObjectIDFromURIRepresentation:(id)a3;
+ (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4;
+ (int64_t)version;
+ (unsigned)allocateBatch:(id *)a3 count:(unsigned int)a4;
+ (void)_setStoreInfo1:(id)a3;
+ (void)_storeDeallocated;
+ (void)initialize;
+ (void)setObjectStoreIdentifier:(id)a3;
- (BOOL)_isPersistentStoreAlive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporaryID;
- (_NSCoreManagedObjectID)retain;
- (id)URIRepresentation;
- (id)_storeIdentifier;
- (id)_storeInfo1;
- (id)entity;
- (id)entityName;
- (id)persistentStore;
- (unint64_t)retainCount;
- (void)release;
@end

@implementation _NSCoreManagedObjectID

- (id)URIRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x18C127630](self, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self)
    {
      v4 = [(_NSCoreManagedObjectID *)self _storeIdentifier];
      if (v4) {
        v5 = v4;
      }
      else {
        v5 = &stru_1ED787880;
      }
      uint64_t v6 = [(__CFString *)v5 length];
      qmemcpy(relativeURLBytes, "x-coredata://", 13);
      if (v6 && (uint64_t v7 = v6, -[__CFString getCharacters:range:](v5, "getCharacters:range:", v25, 0, v6), v7 >= 1))
      {
        for (uint64_t i = 0; i != v7; ++i)
          relativeURLBytes[i + 13] = v25[i];
        uint64_t v9 = i + 13;
      }
      else
      {
        uint64_t v9 = 13;
      }
      uint64_t v12 = v9 + 1;
      relativeURLBytes[v9] = 47;
      id v13 = [(_NSCoreManagedObjectID *)self entityName];
      uint64_t v14 = [v13 length];
      if (v14 && (uint64_t v15 = v14, objc_msgSend(v13, "getCharacters:range:", v25, 0, v14), v15 >= 1))
      {
        v16 = (UInt8 *)v25;
        do
        {
          UInt8 v17 = *v16;
          v16 += 2;
          uint64_t v18 = v12 + 1;
          relativeURLBytes[v12++] = v17;
          --v15;
        }
        while (v15);
      }
      else
      {
        uint64_t v18 = v12;
      }
      *(_WORD *)&relativeURLBytes[v18] = 28719;
      int v19 = snprintf((char *)&relativeURLBytes[v18 + 2], 1022 - v18, "%qu", [(NSManagedObjectID *)self _referenceData64]);
      CFIndex v20 = v18 + 2 + (v19 & ~(v19 >> 31));
      relativeURLBytes[v20] = 0;
    }
    else
    {
      CFIndex v20 = 0;
    }
    CFURLRef v11 = CFURLCreateAbsoluteURLWithBytes(0, relativeURLBytes, v20, 0x8000100u, 0, 1u);
    CFURLRef v21 = v11;
    CFRelease(v11);
  }
  else
  {
    id v10 = [(NSManagedObjectID *)self _retainedURIString];
    CFURLRef v11 = (CFURLRef)[MEMORY[0x1E4F1CB10] URLWithString:v10];
  }
  CFURLRef v22 = v11;
  return v11;
}

+ (void)initialize
{
  if (objc_getClass("_NSCoreManagedObjectID") == a1)
  {
    self;
    object_getIndexedIvars(a1);
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    qword_1EB270610 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    qword_1EB270618 = (uint64_t)CFArrayCreateMutable(v3, 0, 0);
    qword_1EB270620 = (uint64_t)CFArrayCreateMutable(v3, 0, 0);
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (char)generatedNameSuffix
{
  return "abstract";
}

+ (Class)classWithStore:(id)a3 andEntity:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (unsigned char *)objc_msgSend((id)objc_msgSend(a4, "name"), "UTF8String");
  if (!v7 || !*v7)
  {
    v40 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v41 = *MEMORY[0x1E4F1C3C8];
    v42 = @"Entity name must not be nil.";
    goto LABEL_46;
  }
  if (!a3)
  {
    v40 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v41 = *MEMORY[0x1E4F1C3C8];
    v42 = @"Store must not be nil.";
LABEL_46:
    objc_exception_throw((id)[v40 exceptionWithName:v41 reason:v42 userInfo:0]);
  }
  v8 = (const char *)[a1 generatedNameSuffix];
  uint64_t v9 = v8;
  int v10 = *(unsigned __int8 *)v8;
  if (v10 == 54) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2 * (v10 == 105);
  }
  snprintf(__str, 0x100uLL, "_NSObjectID_%s_%x", v8, 0);
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_70);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v12 = (void *)*((void *)&_MergedGlobals_70 + v11 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v44;
LABEL_9:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v44 != v15) {
        objc_enumerationMutation(v12);
      }
      Class v17 = *(Class *)(*((void *)&v43 + 1) + 8 * v16);
      IndexedIvars = object_getIndexedIvars(v17);
      if (IndexedIvars)
      {
        id v19 = (id)IndexedIvars[1];
        if (!v19) {
          break;
        }
        if (v19 == a4 && IndexedIvars[2] == (void)a3) {
          break;
        }
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v14) {
          goto LABEL_9;
        }
        goto LABEL_23;
      }
    }
    if (!v17) {
      goto LABEL_23;
    }
LABEL_22:
    atomic_fetch_add_explicit((atomic_uint *volatile)object_getIndexedIvars(v17), 1u, memory_order_relaxed);
  }
  else
  {
LABEL_23:
    int v21 = 1;
    while (1)
    {
      Class Class = objc_getClass(__str);
      if (!Class) {
        break;
      }
      Class v17 = Class;
      int v23 = v21;
LABEL_29:
      if (!*((void *)object_getIndexedIvars(v17) + 1)) {
        goto LABEL_22;
      }
      int v21 = v23 + 1;
      snprintf(__str, 0x100uLL, "_NSObjectID_%s_%x", v9, v23);
    }
    while (1)
    {
      Class ClassPair = objc_allocateClassPair((Class)a1, __str, 0x40uLL);
      if (ClassPair) {
        break;
      }
      int v23 = v21 + 1;
      snprintf(__str, 0x100uLL, "_NSObjectID_%s_%x", v9, v21);
      Class v25 = objc_getClass(__str);
      ++v21;
      if (v25)
      {
        Class v17 = v25;
        goto LABEL_29;
      }
    }
    Class v17 = ClassPair;
    uint64_t v26 = object_getClass(ClassPair);
    ClassMethod = class_getClassMethod(v17, sel__retain_1);
    Implementation = method_getImplementation(ClassMethod);
    TypeEncoding = method_getTypeEncoding(ClassMethod);
    class_addMethod(v26, sel_retain, Implementation, TypeEncoding);
    v30 = class_getClassMethod(v17, sel__release_1);
    v31 = method_getImplementation(v30);
    v32 = method_getTypeEncoding(v30);
    class_addMethod(v26, sel_release, v31, v32);
    objc_registerClassPair(v17);
    CFArrayAppendValue(*((CFMutableArrayRef *)&_MergedGlobals_70 + v11 + 3), v17);
  }
  v33 = object_getIndexedIvars(v17);
  if (!v33[1])
  {
    v34 = v33;
    *(_DWORD *)v33 = 0;
    v33[2] = a3;
    v33[5] = 0;
    v35 = objc_msgSend((id)objc_msgSend(a3, "identifier"), "copy");
    if (v35)
    {
      v36 = v35;
      v34[5] = CFRetain(v35);
    }
    v34[1] = a4;
    v34[6] = 0;
    v34[3] = 0;
    *((_DWORD *)v34 + 8) = objc_msgSend((id)objc_msgSend(a4, "name"), "hash") & 0x3F;
    if ([a1 isSubclassOfClass:objc_opt_class()])
    {
      int v37 = 3;
    }
    else if ([a1 isSubclassOfClass:objc_opt_class()])
    {
      int v37 = 2;
    }
    else
    {
      int v37 = 4;
    }
    *((_DWORD *)v34 + 1) = v37;
    if (a4) {
      int v38 = *((_DWORD *)a4 + 40);
    }
    else {
      int v38 = 0;
    }
    *((_DWORD *)v34 + 14) = v38;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_70);
  return v17;
}

+ (BOOL)_usesTaggedPointers
{
  return 0;
}

+ (unsigned)allocateBatch:(id *)a3 count:(unsigned int)a4
{
  unsigned int v5 = _PFAllocateObjects((objc_class *)a1, a3, a4, 0);
  atomic_fetch_add_explicit((atomic_uint *volatile)object_getIndexedIvars(a1), v5, memory_order_relaxed);
  return v5;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
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

+ (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4
{
  __endptr = 0;
  unint64_t v7 = strtouq(a3, &__endptr, 0);
  if (__endptr) {
    BOOL v8 = __endptr == a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = (void *)[[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
    id v10 = (id)[objc_alloc((Class)a1) initWithObject:v9];
  }
  else
  {
    unint64_t v11 = v7;
    if ([a1 isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithPK64:v11];
    }
    else
    {
      uint64_t v13 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:v11];
      uint64_t v14 = [objc_alloc((Class)a1) initWithObject:v13];

      uint64_t v12 = (void *)v14;
    }
    return v12;
  }
  return v10;
}

+ (id)managedObjectIDFromURIRepresentation:(id)a3
{
  unsigned int v5 = (void *)MEMORY[0x18C127630](a1, a2);
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "path"), "pathComponents"), "objectAtIndex:", 2);
  IndexedIvars = object_getIndexedIvars(a1);
  uint64_t v8 = IndexedIvars[2];
  char v9 = [v6 characterAtIndex:0];
  id v10 = (void *)[v6 substringFromIndex:1];
  if (v9 != 116
    || (unint64_t v11 = [[NSTemporaryObjectID alloc] initWithEntity:IndexedIvars[1] andUUIDString:v10], [(NSTemporaryObjectID *)v11 _setPersistentStore:v8], !v11))
  {
    unint64_t v16 = 0;
    if (+[_PFRoutines convertCString:toUnsignedInt64:withBase:]((uint64_t)_PFRoutines, (const char *)[v10 UTF8String], &v16, 0))
    {
      if ([a1 isSubclassOfClass:objc_opt_class()])
      {
        id v12 = objc_alloc((Class)a1);
        unint64_t v11 = (NSTemporaryObjectID *)[v12 initWithPK64:v16];
        if (v11) {
          goto LABEL_9;
        }
      }
      else
      {
        id v13 = objc_alloc(NSNumber);
        uint64_t v14 = (void *)[v13 initWithUnsignedLongLong:v16];
        unint64_t v11 = (NSTemporaryObjectID *)[objc_alloc((Class)a1) initWithObject:v14];

        if (v11) {
          goto LABEL_9;
        }
      }
    }
    unint64_t v11 = (NSTemporaryObjectID *)[objc_alloc((Class)a1) initWithObject:v10];
  }
LABEL_9:

  return v11;
}

+ (void)setObjectStoreIdentifier:(id)a3
{
  IndexedIvars = object_getIndexedIvars(a1);
  id v5 = (id)IndexedIvars[5];
  if (v5 != a3)
  {
    if (v5) {
      CFRelease(v5);
    }
    uint64_t v6 = (void *)CFRetain((CFTypeRef)[a3 copy]);
    IndexedIvars[5] = v6;
  }
}

+ (void)_setStoreInfo1:(id)a3
{
  *((void *)object_getIndexedIvars(a1) + 6) = a3;
}

+ (id)_storeInfo1
{
  id result = object_getIndexedIvars(a1);
  if (result) {
    return (id)*((void *)result + 6);
  }
  return result;
}

+ (void)_storeDeallocated
{
  IndexedIvars = object_getIndexedIvars(a1);
  if (IndexedIvars)
  {
    IndexedIvars[6] = 0;
    IndexedIvars[2] = 0;
    __dmb(0xBu);
  }
}

- (_NSCoreManagedObjectID)retain
{
  return (_NSCoreManagedObjectID *)_PFfastOidRetain((int)self, self);
}

- (void)release
{
}

- (id)entity
{
  Class Class = object_getClass(self);
  id result = object_getIndexedIvars(Class);
  if (result) {
    return (id)*((void *)result + 1);
  }
  return result;
}

- (id)entityName
{
  id v2 = [(_NSCoreManagedObjectID *)self entity];

  return (id)[v2 name];
}

- (id)persistentStore
{
  Class Class = object_getClass(self);
  id result = object_getIndexedIvars(Class);
  if (result) {
    return (id)*((void *)result + 2);
  }
  return result;
}

- (BOOL)isTemporaryID
{
  return 0;
}

- (id)_storeIdentifier
{
  Class Class = object_getClass(self);
  id result = object_getIndexedIvars(Class);
  if (result)
  {
    v4 = (id *)result;
    id result = (id)*((void *)result + 5);
    if (!result)
    {
      objc_msgSend((id)objc_opt_class(), "setObjectStoreIdentifier:", objc_msgSend(v4[2], "identifier"));
      return v4[5];
    }
  }
  return result;
}

- (id)_storeInfo1
{
  Class Class = object_getClass(self);
  id result = object_getIndexedIvars(Class);
  if (result) {
    return (id)*((void *)result + 6);
  }
  return result;
}

- (BOOL)_isPersistentStoreAlive
{
  Class Class = object_getClass(self);
  IndexedIvars = object_getIndexedIvars(Class);
  if (IndexedIvars)
  {
    v4 = (void *)IndexedIvars[2];
    LOBYTE(IndexedIvars) = [v4 _isPersistentStoreAlive];
  }
  return (char)IndexedIvars;
}

- (unint64_t)retainCount
{
  return SLODWORD(self[1].super.super.isa) + 1;
}

- (BOOL)isEqual:(id)a3
{
  return a3 && _PFObjectIDFastEquals64((unint64_t)self, (unint64_t)a3) != 0;
}

@end