@interface _CDSnapshot
+ (Class)classForEntity:(id)a3;
+ (_CDSnapshot)alloc;
+ (_CDSnapshot)allocWithZone:(_NSZone *)a3;
+ (unsigned)newBatchAllocation:(id *)a3 count:(unsigned int)a4 withOwnedObjectIDs:(id *)a5;
+ (void)_entityDeallocated;
+ (void)_invalidateStaticCaches;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (id)copy;
- (id)description;
- (id)mutableCopy;
- (id)valueForKey:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)initWithObjectID:(void *)a1;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation _CDSnapshot

+ (unsigned)newBatchAllocation:(id *)a3 count:(unsigned int)a4 withOwnedObjectIDs:(id *)a5
{
  v6 = a3;
  unsigned int result = _PFAllocateObjects((objc_class *)a1, a3, a4, 0);
  if (result)
  {
    uint64_t v8 = result;
    do
    {
      uint64_t v10 = (uint64_t)*v6++;
      uint64_t v9 = v10;
      uint64_t v11 = (uint64_t)*a5++;
      *(void *)(v9 + 16) = v11;
      --v8;
    }
    while (v8);
  }
  return result;
}

- (id)mutableCopy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = -[_CDSnapshot initWithObjectID:](v3, self->_cd_objectID);
  v4[3] = self->_cd_version;
  Class Class = object_getClass(self);
  IndexedIvars = (unsigned int *)object_getIndexedIvars(Class);
  memcpy(v4 + 7, &self->_cd_nullFlags_, IndexedIvars[17]);
  uint64_t v7 = IndexedIvars[16];
  if (v7)
  {
    uint64_t v8 = (unsigned __int8 *)*((void *)IndexedIvars + 7);
    uint64_t v9 = IndexedIvars + 19;
    do
    {
      int v10 = *v8++;
      if (v10 == 64)
      {
        uint64_t v11 = *v9;
        v12 = *(Class *)((char *)&self->super.isa + v11);
        id v13 = v12;
        *(void *)((char *)v4 + v11) = v12;
      }
      ++v9;
      --v7;
    }
    while (v7);
  }
  return v4;
}

+ (_CDSnapshot)alloc
{
  return (_CDSnapshot *)_PFAllocateObject((Class)a1, 0);
}

- (void)initWithObjectID:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)_CDSnapshot;
  id v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[2] = a2;
  }
  return v3;
}

- (void)dealloc
{
  Class Class = object_getClass(self);
  IndexedIvars = (unsigned int *)object_getIndexedIvars(Class);
  uint64_t v5 = IndexedIvars[16];
  if (v5)
  {
    v6 = (unsigned __int8 *)*((void *)IndexedIvars + 7);
    uint64_t v7 = IndexedIvars + 19;
    do
    {
      int v8 = *v6++;
      if (v8 == 64) {

      }
      ++v7;
      --v5;
    }
    while (v5);
  }

  _PFDeallocateObject(self);
}

+ (Class)classForEntity:(id)a3
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (const char *)objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
  if (!v5 || (v6 = v5, !*v5)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Entity name must not be nil." userInfo:0]);
  }
  v65 = (objc_class *)a1;
  Name = class_getName((Class)a1);
  snprintf(__str, 0x200uLL, "%s_%s_", Name, v6);
  v66 = a3;
  unint64_t v8 = *(void *)(*((void *)a3 + 14) + 8);
  uint64_t v72 = *((void *)a3 + 12) + 24;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v10, v11, v12, 0);
  [v15 addObject:v13];
  id obj = v15;
  [v15 addObject:v14];
  if (!v8)
  {
LABEL_22:
    v60 = v9;
    v68 = v6;
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_84);
    uint64_t extraBytes = 4 * v8 + 80;
    if (v8 <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v8;
    }
    size_t size = v21;
    if (v8) {
      int v22 = ((v8 - 1) >> 3) + 1;
    }
    else {
      int v22 = 1;
    }
    unsigned int v63 = v22;
    int v62 = v22 - 1;
    uint64_t v61 = 4 * (v22 - 1);
    unint64_t v69 = v8;
    int v70 = 2;
    v24 = v65;
    v23 = v66;
    while (1)
    {
      Class Class = objc_getClass(__str);
      Class v25 = Class;
      if (!Class) {
        break;
      }
LABEL_30:
      IndexedIvars = (const UInt8 *)object_getIndexedIvars(v25);
      if (!Class) {
        goto LABEL_107;
      }
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      *(_OWORD *)types = 0u;
      long long v86 = 0u;
      CFAllocatorRef v27 = _PFStackAllocatorCreate((unint64_t *)types, 1024);
      CFDataRef v28 = CFDataCreate(v27, IndexedIvars + 24, 32);
      int v29 = objc_msgSend((id)objc_msgSend(v23, "versionHash"), "isEqual:", v28);
      int v30 = v29;
      if (*((void *)&v86 + 1))
      {
        if (v28) {
          CFRelease(v28);
        }
        if (!v30) {
          goto LABEL_109;
        }
      }
      else
      {
        *(void *)&types[8] = *(void *)types;
        if (!v29) {
          goto LABEL_109;
        }
      }
      if (v69 == *((_DWORD *)IndexedIvars + 16)
        && (!*((void *)IndexedIvars + 1)
         || objc_msgSend((id)objc_msgSend(v23, "name"), "isEqual:", *((void *)IndexedIvars + 1)))
        && (!*((void *)IndexedIvars + 2)
         || (objc_msgSend((id)objc_msgSend(v23, "managedObjectClassName"), "isEqual:", *((void *)IndexedIvars + 2)) & 1) != 0))
      {
LABEL_107:
        if (!*((void *)IndexedIvars + 1))
        {
          *(_DWORD *)IndexedIvars = 0;
          *((_DWORD *)IndexedIvars + 1) = v23[20];
          v57 = objc_msgSend((id)objc_msgSend(v23, "name"), "mutableCopy");
          *((void *)IndexedIvars + 1) = [v57 copy];

          v58 = objc_msgSend((id)objc_msgSend(v23, "managedObjectClassName"), "mutableCopy");
          *((void *)IndexedIvars + 2) = [v58 copy];
        }
        goto LABEL_110;
      }
LABEL_109:
      v59 = class_getName(v24);
      __snprintf_chk(__str, 0x200uLL, 0, 0x200uLL, "%s_%s_%x", v59, v68, v70);
      Class v25 = 0;
      ++v70;
LABEL_110:
      if (v25)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_84);
        [v60 drain];
        return v25;
      }
    }
    Class ClassPair = objc_allocateClassPair(v24, __str, extraBytes);
    Class v25 = ClassPair;
    if (!ClassPair) {
      goto LABEL_109;
    }
    v32 = (char *)object_getIndexedIvars(ClassPair);
    *((void *)v32 + 7) = malloc_type_malloc(size, 0x100004077774924uLL);
    *((_DWORD *)v32 + 16) = v69;
    if (v63 >= 2)
    {
      __snprintf_chk(__str, 0x200uLL, 0, 0x200uLL, "_cd_nullFlags2_");
      __snprintf_chk(types, 0xAuLL, 0, 0xAuLL, "[%dC]", v62);
      if (!class_addIvar(v25, __str, v61, 0, types)) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"class_addIvar failed" userInfo:0]);
      }
    }
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    uint64_t v33 = [obj countByEnumeratingWithState:&v81 objects:v118 count:16];
    if (!v33)
    {
LABEL_97:
      objc_registerClassPair(v25);
      v24 = v65;
      v23 = v66;
      CFArrayAppendValue((CFMutableArrayRef)qword_1EB270798, v25);
      if (v69)
      {
        v51 = v32 + 76;
        v52 = (id *)v72;
        unint64_t v53 = v69;
        do
        {
          InstanceVariable = class_getInstanceVariable(v25, (const char *)objc_msgSend((id)objc_msgSend(*v52, "name"), "UTF8String"));
          *v51++ = ivar_getOffset(InstanceVariable);
          ++v52;
          --v53;
        }
        while (v53);
      }
      v55 = class_getInstanceVariable(v25, "_cd_nullFlags_");
      int Offset = ivar_getOffset(v55);
      *((_DWORD *)v32 + 17) = class_getInstanceSize(v25) - Offset;
      objc_msgSend((id)objc_msgSend(v66, "versionHash"), "getBytes:length:", v32 + 24, 32);
      goto LABEL_30;
    }
    uint64_t v74 = *(void *)v82;
LABEL_41:
    uint64_t v34 = 0;
    uint64_t v75 = v33;
    while (1)
    {
      if (*(void *)v82 != v74) {
        objc_enumerationMutation(obj);
      }
      v35 = *(void **)(*((void *)&v81 + 1) + 8 * v34);
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v77 objects:v117 count:16];
      uint64_t v76 = v34;
      if (v36) {
        break;
      }
LABEL_95:
      uint64_t v34 = v76 + 1;
      if (v76 + 1 == v75)
      {
        uint64_t v33 = [obj countByEnumeratingWithState:&v81 objects:v118 count:16];
        if (!v33) {
          goto LABEL_97;
        }
        goto LABEL_41;
      }
    }
    uint64_t v37 = *(void *)v78;
LABEL_46:
    uint64_t v38 = 0;
    while (1)
    {
      if (*(void *)v78 != v37) {
        objc_enumerationMutation(v35);
      }
      v39 = *(void **)(*((void *)&v77 + 1) + 8 * v38);
      v40 = (const char *)objc_msgSend((id)objc_msgSend(v39, "name"), "UTF8String");
      uint64_t v41 = [v39 _entitysReferenceID];
      if ([v39 _propertyType] != 2 && objc_msgSend(v39, "_propertyType") != 6)
      {
        uint64_t v46 = [v39 _propertyType];
        uint64_t v44 = 8 * (v46 == 7);
        if (v46 == 7) {
          v45 = "@";
        }
        else {
          v45 = 0;
        }
        char v43 = 3;
        goto LABEL_81;
      }
      uint64_t v42 = [v39 attributeType];
      char v43 = 3;
      if (v42 <= 499)
      {
        if (v42 == 300) {
          uint64_t v44 = 8;
        }
        else {
          uint64_t v44 = 0;
        }
        v45 = "q";
        if (v42 != 300) {
          v45 = 0;
        }
        if (v42 == 200)
        {
          uint64_t v44 = 4;
          char v43 = 2;
        }
        else
        {
          char v43 = 3;
        }
        if (v42 == 200) {
          v45 = "i";
        }
        if (v42 == 100)
        {
          uint64_t v44 = 2;
          char v43 = 1;
          v45 = "s";
        }
        goto LABEL_81;
      }
      if (v42 > 799)
      {
        if (v42 == 800)
        {
          char v43 = 0;
          uint64_t v44 = 1;
          v45 = "c";
          goto LABEL_81;
        }
        if (v42 != 900)
        {
          uint64_t v44 = 0;
          v45 = 0;
          goto LABEL_81;
        }
      }
      else if (v42 != 500)
      {
        uint64_t v44 = 4;
        if (v42 == 600)
        {
          char v43 = 2;
        }
        else
        {
          uint64_t v44 = 0;
          char v43 = 3;
        }
        v45 = "f";
        if (v42 != 600) {
          v45 = 0;
        }
        goto LABEL_81;
      }
      uint64_t v44 = 8;
      v45 = "d";
LABEL_81:
      if (v45) {
        size_t v47 = v44;
      }
      else {
        size_t v47 = 8;
      }
      if (v45) {
        uint8_t v48 = v43;
      }
      else {
        uint8_t v48 = 3;
      }
      if (v45) {
        v49 = v45;
      }
      else {
        v49 = "@";
      }
      *(unsigned char *)(*((void *)v32 + 7) + v41) = *v49;
      if (!class_addIvar(v25, v40, v47, v48, v49)) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"class_addIvar failed" userInfo:0]);
      }
      if (v36 == ++v38)
      {
        uint64_t v50 = [v35 countByEnumeratingWithState:&v77 objects:v117 count:16];
        uint64_t v36 = v50;
        if (!v50) {
          goto LABEL_95;
        }
        goto LABEL_46;
      }
    }
  }
  Class v16 = 0;
  while (1)
  {
    v17 = *(void **)(v72 + 8 * (void)v16);
    Class result = (Class)[v17 _entitysReferenceID];
    if (v16 != result) {
      break;
    }
    if ([v17 _propertyType] == 2 || objc_msgSend(v17, "_propertyType") == 6)
    {
      uint64_t v19 = [v17 attributeType];
      if (v19 <= 499)
      {
        v20 = (void *)v11;
        if (v19 == 100) {
          goto LABEL_21;
        }
        v20 = (void *)v12;
        if (v19 == 200) {
          goto LABEL_21;
        }
        v20 = (void *)v13;
        if (v19 == 300) {
          goto LABEL_21;
        }
      }
      else if (v19 > 799)
      {
        v20 = (void *)v10;
        if (v19 == 800) {
          goto LABEL_21;
        }
        v20 = (void *)v13;
        if (v19 == 900) {
          goto LABEL_21;
        }
      }
      else
      {
        v20 = (void *)v13;
        if (v19 == 500) {
          goto LABEL_21;
        }
        v20 = (void *)v12;
        if (v19 == 600) {
          goto LABEL_21;
        }
      }
    }
    else
    {
      [v17 _propertyType];
    }
    v20 = (void *)v14;
LABEL_21:
    [v20 addObject:v17];
    Class v16 = (Class)((char *)v16 + 1);
    if ((Class)v8 == v16) {
      goto LABEL_22;
    }
  }
  __break(1u);
  return result;
}

+ (void)_entityDeallocated
{
  IndexedIvars = (id *)object_getIndexedIvars(a1);
  if (IndexedIvars)
  {
    id v3 = IndexedIvars;
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_84);

    v3[1] = 0;
    v3[2] = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_84);
  }
}

+ (void)initialize
{
  if (objc_getClass("_CDSnapshot") == a1)
  {
    self;
    object_getIndexedIvars(a1);
    qword_1EB270798 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  }
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____CDSnapshot;
  objc_msgSendSuper2(&v3, sel_initialize);
}

+ (void)_invalidateStaticCaches
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_84);
  if (qword_1EB270798)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    for (CFIndex i = 0; i < CFArrayGetCount((CFArrayRef)qword_1EB270798); ++i)
      [(__CFArray *)Mutable addObject:CFArrayGetValueAtIndex((CFArrayRef)qword_1EB270798, i)];
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_1EB270798);
  }
  else
  {
    CFMutableArrayRef Mutable = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_84);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(__CFArray *)Mutable countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v4; ++j)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(Mutable);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * j) _entityDeallocated];
      }
      uint64_t v4 = [(__CFArray *)Mutable countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_84);
  if (Mutable)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [(__CFArray *)Mutable countByEnumeratingWithState:&v12 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t k = 0; k != v7; ++k)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(Mutable);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * k);
          IndexedIvars = (void **)object_getIndexedIvars(v10);
          if (IndexedIvars) {
            free(IndexedIvars[7]);
          }
          objc_disposeClassPair((Class)v10);
        }
        uint64_t v7 = [(__CFArray *)Mutable countByEnumeratingWithState:&v12 objects:v20 count:16];
      }
      while (v7);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_84);
}

+ (_CDSnapshot)allocWithZone:(_NSZone *)a3
{
  return (_CDSnapshot *)_PFAllocateObject((Class)a1, 0);
}

- (id)copy
{
  if (*(unsigned char *)&self->_cd_flags)
  {
    return self;
  }
  else
  {
    id result = [(_CDSnapshot *)self mutableCopy];
    *(unsigned char *)&self->_cd_flags |= 1u;
  }
  return result;
}

- (unint64_t)hash
{
  unsigned int v2 = (2 * ((unint64_t)self >> 4)) & 0xAAAAAAAA | (((unint64_t)self >> 4) >> 1) & 0x55555555;
  unsigned int v3 = (4 * v2) & 0xCCCCCCCC | (v2 >> 2) & 0x33333333;
  unsigned int v4 = (16 * v3) & 0xF0F0F0F0 | (v3 >> 4) & 0xF0F0F0F;
  return (v4 << 8) & 0xFF0000 | (v4 << 24) | (v4 >> 8) & 0xFF00 | HIBYTE(v4);
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (id)description
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = NSString;
  v37.receiver = self;
  v37.super_class = (Class)_CDSnapshot;
  id v4 = [(_CDSnapshot *)&v37 description];
  if (!self)
  {
    uint64_t v5 = (NSString *)[0 name];
    cd_objectID = 0;
    uint64_t v10 = 0;
    return (id)objc_msgSend(v3, "stringWithFormat:", @"%@ (entity: %@; id: %@ ; data: %@)",
                 v4,
                 v5,
                 cd_objectID,
                 v10);
  }
  uint64_t v5 = [(NSEntityDescription *)[(NSManagedObjectID *)self->_cd_objectID entity] name];
  cd_objectID = self->_cd_objectID;
  uint64_t v7 = [(NSEntityDescription *)[(NSManagedObjectID *)cd_objectID entity] properties];
  uint64_t v8 = [(NSArray *)v7 count];
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v8];
  uint64_t v10 = (void *)v9;
  if (v8)
  {
    int v30 = cd_objectID;
    v31 = v5;
    id v32 = v4;
    uint64_t v33 = v3;
    uint64_t v11 = 0;
    v35 = v7;
    uint64_t v36 = (void *)v9;
    uint64_t v34 = v8;
    while (1)
    {
      id v12 = [(NSArray *)v7 objectAtIndex:v11];
      uint64_t v13 = [v12 name];
      long long v14 = [(_CDSnapshot *)self valueForKey:v13];
      if (v14)
      {
        long long v15 = v14;
        switch([v12 _propertyType])
        {
          case 2:
          case 6:
          case 7:
            uint64_t v16 = [v12 attributeType];
            if (v16 <= 799)
            {
              if (v16 <= 399)
              {
                if (v16 == 100) {
                  goto LABEL_66;
                }
                if (v16 == 200) {
                  goto LABEL_66;
                }
                long long v17 = @"(...not nil..)";
                if (v16 == 300) {
                  goto LABEL_66;
                }
              }
              else if (v16 > 599)
              {
                if (v16 == 600) {
                  goto LABEL_66;
                }
                long long v17 = @"(...not nil..)";
                if (v16 != 700) {
                  goto LABEL_69;
                }
                if (![(__CFString *)v15 isNSString]) {
                  goto LABEL_66;
                }
                if ((unint64_t)[(__CFString *)v15 length] >= 0xC9)
                {
                  uint64_t v19 = [(__CFString *)v15 substringToIndex:200];
                  goto LABEL_68;
                }
                long long v17 = v15;
              }
              else
              {
                if (v16 == 400) {
                  goto LABEL_66;
                }
                long long v17 = @"(...not nil..)";
                if (v16 == 500) {
                  goto LABEL_66;
                }
              }
            }
            else if (v16 > 1199)
            {
              if (v16 > 1999)
              {
                if (v16 == 2100) {
                  goto LABEL_66;
                }
                long long v17 = @"(...not nil..)";
                if (v16 == 2000) {
                  goto LABEL_66;
                }
              }
              else
              {
                if (v16 == 1200) {
                  goto LABEL_66;
                }
                long long v17 = @"(...not nil..)";
                if (v16 == 1800) {
                  goto LABEL_66;
                }
              }
            }
            else
            {
              if (v16 > 999)
              {
                if (v16 == 1000)
                {
                  if ([v12 isFileBackedFuture]) {
                    goto LABEL_66;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    || ![(__CFString *)v15 isNSData]
                    || (unint64_t)[(__CFString *)v15 length] < 0x33)
                  {
                    goto LABEL_66;
                  }
                  CFAllocatorRef v27 = (__CFString *)-[__CFString subdataWithRange:](v15, "subdataWithRange:", 0, 50);
                }
                else
                {
                  long long v17 = @"(...not nil..)";
                  if (v16 != 1100) {
                    goto LABEL_69;
                  }
LABEL_66:
                  CFAllocatorRef v27 = v15;
                }
                uint64_t v19 = [(__CFString *)v27 description];
                goto LABEL_68;
              }
              if (v16 == 800) {
                goto LABEL_66;
              }
              long long v17 = @"(...not nil..)";
              if (v16 == 900) {
                goto LABEL_66;
              }
            }
LABEL_69:
            long long v18 = v10;
            break;
          case 3:
            goto LABEL_20;
          case 4:
            if ([v12 isToMany])
            {
LABEL_20:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                || ![(__CFString *)v15 isFault])
              {
                v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[__CFString count](v15, "count"));
                long long v38 = 0u;
                long long v39 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                uint64_t v21 = [(__CFString *)v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
                if (v21)
                {
                  uint64_t v22 = v21;
                  unint64_t v23 = 0;
                  uint64_t v24 = *(void *)v39;
                  do
                  {
                    uint64_t v25 = 0;
                    if (v23 <= 0xA) {
                      unint64_t v26 = 10 - v23;
                    }
                    else {
                      unint64_t v26 = 0;
                    }
                    do
                    {
                      if (*(void *)v39 != v24) {
                        objc_enumerationMutation(v15);
                      }
                      if (v26 == v25)
                      {
                        [v20 addObject:objc_msgSend(NSString, "stringWithFormat:", @"(...and %ld more...)", -[__CFString count](v15, "count") - 10)];
                        goto LABEL_44;
                      }
                      objc_msgSend(v20, "addObject:", objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * v25++), "objectID"));
                    }
                    while (v22 != v25);
                    uint64_t v22 = [(__CFString *)v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
                    v23 += v25;
                  }
                  while (v22);
                }
LABEL_44:
                uint64_t v10 = v36;
                [v36 setObject:v20 forKey:v13];

                uint64_t v8 = v34;
                uint64_t v7 = v35;
                goto LABEL_71;
              }
              uint64_t v19 = [NSString stringWithFormat:@"<relationship fault: %p '%@'>", v15, objc_msgSend((id)-[__CFString relationship](v15, "relationship"), "name")];
              goto LABEL_68;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v18 = v10;
              long long v17 = v15;
              break;
            }
            if (v15 != (__CFString *)_CD_ScalarNull)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v19 = [NSString stringWithFormat:@"foreign key: %@", v15, v29];
              }
              else {
                uint64_t v19 = [(__CFString *)v15 objectID];
              }
LABEL_68:
              long long v17 = (__CFString *)v19;
              goto LABEL_69;
            }
            long long v18 = v10;
            long long v17 = @"<deferred relationship fault>";
            break;
          default:
            long long v18 = v10;
            long long v17 = @"(...not nil..)";
            break;
        }
      }
      else
      {
        long long v18 = v10;
        long long v17 = @"nil";
      }
      [v18 setObject:v17 forKey:v13];
LABEL_71:
      if (++v11 == v8)
      {
        id v4 = v32;
        unsigned int v3 = v33;
        cd_objectID = v30;
        uint64_t v5 = v31;
        return (id)objc_msgSend(v3, "stringWithFormat:", @"%@ (entity: %@; id: %@ ; data: %@)",
                     v4,
                     v5,
                     cd_objectID,
                     v10);
      }
    }
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"%@ (entity: %@; id: %@ ; data: %@)",
               v4,
               v5,
               cd_objectID,
               v10);
}

- (id)valueForKey:(id)a3
{
  uint64_t v5 = [(NSManagedObjectID *)self->_cd_objectID entity];
  v6 = v5;
  if (v5) {
    uint64_t v5 = (NSEntityDescription *)v5->_propertyMapping;
  }
  uint64_t v7 = [(NSEntityDescription *)v5 indexForKey:a3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_4;
  }
  unsigned int v9 = v7;
  if ((*(&self->_cd_nullFlags_ + (v7 >> 3)) >> (v7 & 7))) {
    return 0;
  }
  Class isa = v6->_properties[v7 + 3].super.super.isa;
  if (([(objc_class *)isa _isRelationship] & 1) != 0
    || [(objc_class *)isa attributeType] != 900)
  {
LABEL_4:
    v14.receiver = self;
    v14.super_class = (Class)_CDSnapshot;
    return [(_CDSnapshot *)&v14 valueForKey:a3];
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F1C9C8];
  Class Class = object_getClass(self);
  double v13 = *(double *)((char *)&self->super.isa + *((unsigned int *)object_getIndexedIvars(Class) + v9 + 19));

  return (id)[v11 dateWithTimeIntervalSinceReferenceDate:v13];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (*(unsigned char *)&self->_cd_flags) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"snapshot is marked read only" userInfo:0]);
  }
  uint64_t v7 = [(NSManagedObjectID *)self->_cd_objectID entity];
  uint64_t v8 = v7;
  if (v7) {
    uint64_t v7 = (NSEntityDescription *)v7->_propertyMapping;
  }
  uint64_t v9 = [(NSEntityDescription *)v7 indexForKey:a4];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_10;
  }
  unsigned int v10 = v9;
  if (a3)
  {
    Class isa = v8->_properties[v9 + 3].super.super.isa;
    if (([(objc_class *)isa _isRelationship] & 1) == 0
      && [(objc_class *)isa attributeType] == 900)
    {
      if ([a3 isNSNumber]) {
        [a3 doubleValue];
      }
      else {
        [a3 timeIntervalSinceReferenceDate];
      }
      snapshot_set_double((char *)self, v10, v12);
      return;
    }
LABEL_10:
    v13.receiver = self;
    v13.super_class = (Class)_CDSnapshot;
    [(_CDSnapshot *)&v13 setValue:a3 forKey:a4];
    return;
  }

  snapshot_set_null((char *)self, v9);
}

@end