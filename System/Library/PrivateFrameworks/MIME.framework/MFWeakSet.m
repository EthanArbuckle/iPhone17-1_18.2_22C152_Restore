@interface MFWeakSet
+ (MFWeakSet)setWithArray:(id)a3;
+ (MFWeakSet)setWithCapacity:(unint64_t)a3;
+ (MFWeakSet)setWithObject:(id)a3;
+ (MFWeakSet)setWithObjects:(const void *)a3 count:(unint64_t)a4;
+ (MFWeakSet)setWithObjects:(id)a3;
+ (MFWeakSet)setWithSet:(id)a3;
+ (id)set;
- (BOOL)containsObject:(id)a3;
- (BOOL)intersectsSet:(id)a3;
- (BOOL)isEqualToSet:(id)a3;
- (BOOL)isSubsetOfSet:(id)a3;
- (MFWeakSet)init;
- (MFWeakSet)initWithArray:(id)a3;
- (MFWeakSet)initWithCapacity:(unint64_t)a3;
- (MFWeakSet)initWithCoder:(id)a3;
- (MFWeakSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (MFWeakSet)initWithObjects:(id)a3;
- (MFWeakSet)initWithSet:(id)a3;
- (MFWeakSet)initWithSet:(id)a3 copyItems:(BOOL)a4;
- (id)_copyAllItems;
- (id)allObjects;
- (id)anyObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)objectsPassingTest:(id)a3;
- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)setByAddingObject:(id)a3;
- (id)setByAddingObjectsFromArray:(id)a3;
- (id)setByAddingObjectsFromSet:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)intersectSet:(id)a3;
- (void)makeObjectsPerformSelector:(SEL)a3;
- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation MFWeakSet

- (void)addObject:(id)a3
{
  [(NSLock *)self->_lock lock];
  CFDictionaryAddValue(self->_objects, a3, +[MFWeakReferenceHolder weakReferenceWithObject:a3]);
  ++self->_gen;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (id)allObjects
{
  id v2 = [(MFWeakSet *)self _copyAllItems];
  return v2;
}

- (id)_copyAllItems
{
  [(NSLock *)self->_lock lock];
  CFIndex Count = CFDictionaryGetCount(self->_objects);
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
  if (Count)
  {
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(self->_objects, v5, v6);
    for (uint64_t i = 0; i != Count; ++i)
    {
      uint64_t v8 = [(id)v6[i] retainedReference];
      if (v8)
      {
        v9 = (void *)v8;
        [v4 addObject:v8];
      }
      else
      {
        CFDictionaryRemoveValue(self->_objects, v5[i]);
      }
    }
    free(v6);
    free(v5);
  }
  [(NSLock *)self->_lock unlock];
  return v4;
}

- (MFWeakSet)init
{
  v4.receiver = self;
  v4.super_class = (Class)MFWeakSet;
  id v2 = [(MFWeakSet *)&v4 init];
  if (v2)
  {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v2->_objects = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
  }
  return v2;
}

- (void)removeObject:(id)a3
{
  [(NSLock *)self->_lock lock];
  CFDictionaryRemoveValue(self->_objects, a3);
  ++self->_gen;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (unint64_t)count
{
  [(NSLock *)self->_lock lock];
  CFIndex Count = CFDictionaryGetCount(self->_objects);
  [(NSLock *)self->_lock unlock];
  return Count;
}

- (id)member:(id)a3
{
  [(NSLock *)self->_lock lock];
  Value = (void *)CFDictionaryGetValue(self->_objects, a3);
  if (Value)
  {
    v6 = (void *)[Value retainedReference];
    if (!v6) {
      CFDictionaryRemoveValue(self->_objects, a3);
    }
  }
  else
  {
    v6 = 0;
  }
  [(NSLock *)self->_lock unlock];
  return v6;
}

- (id)objectEnumerator
{
  id v2 = [(MFWeakSet *)self allObjects];
  return (id)[v2 objectEnumerator];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var0)
  {
    id v9 = [(MFWeakSet *)self allObjects];
    uint64_t v10 = [v9 count];
    if (v10)
    {
      a3->var2 = &self->_gen;
      a3->var3[0] = v10;
      a3->var3[1] = (unint64_t)v9;
    }
  }
  unint64_t v11 = a3->var3[0];
  BOOL v12 = v11 > a3->var0;
  unint64_t v13 = v11 - a3->var0;
  if (!v12) {
    return 0;
  }
  if (v13 < a5) {
    a5 = v13;
  }
  if (a5)
  {
    v15.length = a5;
    v15.location = a3->var0;
    CFArrayGetValues((CFArrayRef)a3->var3[1], v15, (const void **)a4);
    a3->var0 += a5;
    a3->var1 = a4;
  }
  return a5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithSet:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithSet:self];
}

- (id)anyObject
{
  [(NSLock *)self->_lock lock];
  CFIndex Count = CFDictionaryGetCount(self->_objects);
  if (Count)
  {
    CFIndex v4 = Count;
    size_t v5 = 8 * Count;
    v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v7 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(self->_objects, v6, v7);
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v9 = (void *)[(id)v7[i] retainedReference];
      if (v9) {
        break;
      }
      CFDictionaryRemoveValue(self->_objects, v6[i]);
    }
    free(v7);
    free(v6);
  }
  else
  {
    id v9 = 0;
  }
  [(NSLock *)self->_lock unlock];
  return v9;
}

- (BOOL)containsObject:(id)a3
{
  return [(MFWeakSet *)self member:a3] != 0;
}

- (id)description
{
  return [(MFWeakSet *)self descriptionWithLocale:0];
}

- (id)descriptionWithLocale:(id)a3
{
  CFIndex v4 = NSString;
  size_t v5 = (objc_class *)objc_opt_class();
  return (id)[v4 stringWithFormat:@"<%@> %p", NSStringFromClass(v5), self];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = [(MFWeakSet *)self _copyAllItems];
  if ([a3 allowsKeyedCoding]) {
    [a3 encodeObject:v4 forKey:@"objects"];
  }
  else {
    [a3 encodeObject:v4];
  }
}

- (MFWeakSet)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MFWeakSet;
  id v4 = -[MFWeakSet initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    if ([a3 allowsKeyedCoding]) {
      uint64_t v5 = [a3 decodeObjectForKey:@"objects"];
    }
    else {
      uint64_t v5 = [a3 decodeObject];
    }
    v6 = (void *)v5;
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFIndex v8 = [v6 count];
    v4->_objects = CFDictionaryCreateMutable(v7, v8, 0, MEMORY[0x1E4F1D540]);
    [(MFWeakSet *)v4 addObjectsFromArray:v6];
  }
  return v4;
}

- (BOOL)intersectsSet:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 == self)
  {
LABEL_12:
    LOBYTE(v5) = 1;
    return v5;
  }
  uint64_t v5 = [a3 count];
  if (v5)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [(MFWeakSet *)self countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
LABEL_5:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(self);
        }
        if ([a3 containsObject:*(void *)(*((void *)&v10 + 1) + 8 * v8)]) {
          goto LABEL_12;
        }
        if (v6 == ++v8)
        {
          unint64_t v6 = [(MFWeakSet *)self countByEnumeratingWithState:&v10 objects:v14 count:16];
          LOBYTE(v5) = 0;
          if (v6) {
            goto LABEL_5;
          }
          return v5;
        }
      }
    }
  }
  return v5;
}

- (BOOL)isEqualToSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    unint64_t v5 = [(MFWeakSet *)self count];
    if (v5 == [a3 count])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      unint64_t v6 = [(MFWeakSet *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        unint64_t v7 = v6;
        uint64_t v8 = *(void *)v12;
LABEL_5:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(self);
          }
          LODWORD(v6) = [a3 containsObject:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
          if (!v6) {
            break;
          }
          if (v7 == ++v9)
          {
            unint64_t v7 = [(MFWeakSet *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
            LOBYTE(v6) = 1;
            if (v7) {
              goto LABEL_5;
            }
            return v6;
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (BOOL)isSubsetOfSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 == self
    || (long long v13 = 0u,
        long long v14 = 0u,
        long long v11 = 0u,
        long long v12 = 0u,
        (unint64_t v5 = [(MFWeakSet *)self countByEnumeratingWithState:&v11 objects:v15 count:16]) == 0))
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    unint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(self);
      }
      int v9 = [a3 containsObject:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
      if (!v9) {
        break;
      }
      if (v6 == ++v8)
      {
        unint64_t v6 = [(MFWeakSet *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
        LOBYTE(v9) = 1;
        if (v6) {
          goto LABEL_4;
        }
        return v9;
      }
    }
  }
  return v9;
}

- (void)makeObjectsPerformSelector:(SEL)a3
{
}

- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v7 = [(MFWeakSet *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(self);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), a3, a4);
      }
      while (v8 != v10);
      unint64_t v8 = [(MFWeakSet *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)setByAddingObject:(id)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = a3;
  return -[MFWeakSet setByAddingObjectsFromArray:](self, "setByAddingObjectsFromArray:", [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1]);
}

- (id)setByAddingObjectsFromSet:(id)a3
{
  uint64_t v4 = [a3 allObjects];
  return [(MFWeakSet *)self setByAddingObjectsFromArray:v4];
}

- (id)setByAddingObjectsFromArray:(id)a3
{
  id v4 = [(MFWeakSet *)self _copyAllItems];
  unint64_t v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithArray:", objc_msgSend(v4, "arrayByAddingObjectsFromArray:", a3));

  return v5;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [(MFWeakSet *)self _copyAllItems];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 0;
      (*((void (**)(id, uint64_t, char *))a4 + 2))(a4, v10, &v11);
      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)objectsPassingTest:(id)a3
{
  return [(MFWeakSet *)self objectsWithOptions:0 passingTest:a3];
}

- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v7 = [(MFWeakSet *)self _copyAllItems];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
      char v14 = 0;
      if ((*((unsigned int (**)(id, uint64_t, char *))a4 + 2))(a4, v12, &v14)) {
        [v6 addObject:v12];
      }
      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v6;
}

+ (id)set
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (MFWeakSet)setWithObject:(id)a3
{
  id v4 = a3;
  return (MFWeakSet *)[a1 setWithObjects:&v4 count:1];
}

+ (MFWeakSet)setWithObjects:(const void *)a3 count:(unint64_t)a4
{
  id v4 = (void *)[objc_alloc((Class)a1) initWithObjects:a3 count:a4];
  return (MFWeakSet *)v4;
}

+ (MFWeakSet)setWithObjects:(id)a3
{
  if (!a3) {
    return (MFWeakSet *)[a1 set];
  }
  LODWORD(v5) = 0;
  char v14 = &v16;
  do
  {
    id v6 = v14++;
    uint64_t v5 = (v5 + 1);
  }
  while (*v6);
  if (!v5) {
    return (MFWeakSet *)[a1 set];
  }
  id v7 = (uint64_t *)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
  uint64_t v8 = v7;
  *id v7 = (uint64_t)a3;
  long long v15 = &v16;
  if (v5 != 1)
  {
    uint64_t v9 = v7 + 1;
    uint64_t v10 = v5 - 1;
    do
    {
      uint64_t v11 = v15++;
      *v9++ = *v11;
      --v10;
    }
    while (v10);
  }
  uint64_t v12 = (MFWeakSet *)(id)[objc_allocWithZone((Class)a1) initWithObjects:v7 count:v5];
  free(v8);
  return v12;
}

+ (MFWeakSet)setWithSet:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithSet:a3];
  return (MFWeakSet *)v3;
}

+ (MFWeakSet)setWithArray:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithArray:a3];
  return (MFWeakSet *)v3;
}

+ (MFWeakSet)setWithCapacity:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCapacity:a3];
  return (MFWeakSet *)v3;
}

- (MFWeakSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:a3 count:a4];
  id v6 = [(MFWeakSet *)self initWithArray:v5];

  return v6;
}

- (MFWeakSet)initWithObjects:(id)a3
{
  if (!a3) {
    return [(MFWeakSet *)self init];
  }
  LODWORD(v5) = 0;
  char v14 = &v16;
  do
  {
    id v6 = v14++;
    uint64_t v5 = (v5 + 1);
  }
  while (*v6);
  if (!v5) {
    return [(MFWeakSet *)self init];
  }
  id v7 = (uint64_t *)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
  uint64_t v8 = v7;
  *id v7 = (uint64_t)a3;
  long long v15 = &v16;
  if (v5 != 1)
  {
    uint64_t v9 = v7 + 1;
    uint64_t v10 = v5 - 1;
    do
    {
      uint64_t v11 = v15++;
      *v9++ = *v11;
      --v10;
    }
    while (v10);
  }
  uint64_t v12 = [(MFWeakSet *)self initWithObjects:v7 count:v5];
  free(v8);
  return v12;
}

- (MFWeakSet)initWithSet:(id)a3
{
  return [(MFWeakSet *)self initWithSet:a3 copyItems:0];
}

- (MFWeakSet)initWithSet:(id)a3 copyItems:(BOOL)a4
{
  id v6 = (void *)[a3 allObjects];
  id v7 = v6;
  if (a4) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6 copyItems:1];
  }
  else {
    id v8 = v6;
  }
  uint64_t v9 = [(MFWeakSet *)self initWithArray:v7];

  return v9;
}

- (MFWeakSet)initWithArray:(id)a3
{
  id v4 = -[MFWeakSet initWithCapacity:](self, "initWithCapacity:", [a3 count]);
  uint64_t v5 = v4;
  if (v4) {
    [(MFWeakSet *)v4 addObjectsFromArray:a3];
  }
  return v5;
}

- (MFWeakSet)initWithCapacity:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFWeakSet;
  id v4 = [(MFWeakSet *)&v6 init];
  if (v4)
  {
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v4->_objects = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, 0, MEMORY[0x1E4F1D540]);
  }
  return v4;
}

- (void)dealloc
{
  objects = self->_objects;
  if (objects) {
    CFRelease(objects);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFWeakSet;
  [(MFWeakSet *)&v4 dealloc];
}

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        CFDictionaryAddValue(self->_objects, *(const void **)(*((void *)&v9 + 1) + 8 * v8), +[MFWeakReferenceHolder weakReferenceWithObject:*(void *)(*((void *)&v9 + 1) + 8 * v8)]);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  ++self->_gen;
  [(NSLock *)self->_lock unlock];
}

- (void)intersectSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 != self)
  {
    id v5 = [(MFWeakSet *)self _copyAllItems];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          if (([a3 containsObject:v10] & 1) == 0) {
            [(MFWeakSet *)self removeObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)minusSet:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 == self)
  {
    [a3 removeAllObjects];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(a3);
          }
          [(MFWeakSet *)self removeObject:*(void *)(*((void *)&v9 + 1) + 8 * i)];
        }
        uint64_t v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)removeAllObjects
{
  [(NSLock *)self->_lock lock];
  CFDictionaryRemoveAllValues(self->_objects);
  ++self->_gen;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)unionSet:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 != self)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(a3);
          }
          [(MFWeakSet *)self addObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)setSet:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 != self)
  {
    [(MFWeakSet *)self removeAllObjects];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(a3);
          }
          [(MFWeakSet *)self addObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

@end