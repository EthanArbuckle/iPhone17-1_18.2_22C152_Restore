@interface _PFArray
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (void)initialize;
- (Class)classForCoder;
- (_PFArray)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (_PFArray)initWithObjects:(id *)a3 count:(unsigned int)a4 andFlags:(unsigned int)a5;
- (_PFArray)initWithObjects:(id *)a3 count:(unsigned int)a4 andFlags:(unsigned int)a5 andContext:(id)a6;
- (id)_objectsPointer;
- (id)arrayFromObjectIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)managedObjectIDAtIndex:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newArrayFromObjectIDs;
- (id)objectAtIndex:(unint64_t)a3;
- (id)subarrayWithRange:(_NSRange)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfManagedObjectForObjectID:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4;
- (void)dealloc;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation _PFArray

- (_PFArray)initWithObjects:(id *)a3 count:(unsigned int)a4 andFlags:(unsigned int)a5 andContext:(id)a6
{
  char v7 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_PFArray;
  v10 = [(_PFArray *)&v17 init];
  v11 = (_PFArray *)v10;
  if (v10)
  {
    *((_DWORD *)v10 + 3) = a4;
    v12 = v10 + 32;
    char v13 = v10[32] & 0xF0 | v7 & 0xB | 0x10;
    if ((v7 & 0x10) == 0) {
      char v13 = v10[32] & 0xE0 | v7 & 0xB;
    }
    if ((v7 & 0x20) != 0)
    {
      unsigned char *v12 = v13 | 0x20;
      if (a6
        && _PF_shouldAsyncProcessReferenceQueue
        && ([a6 concurrencyType] == 1 || objc_msgSend(a6, "concurrencyType") == 2))
      {
        v11->_weakContext = [[_PFWeakReference alloc] initWithObject:a6];
      }
    }
    else
    {
      unsigned char *v12 = v13 & 0xDB;
    }
    *((_DWORD *)&v11->_flags + 1) &= 0xF8000000;
    if (a4)
    {
      if ((*v12 & 0x10) != 0)
      {
        v11->_array = (id *)PF_ALLOCATE_OBJECT_ARRAY(a4);
        *v12 |= 8u;
        memmove(v11->_array, a3, 8 * a4);
      }
      else
      {
        v11->_array = a3;
      }
      if (*v12)
      {
        uint64_t v14 = 0;
        do
          id v15 = v11->_array[v14++];
        while (a4 != v14);
      }
    }
  }
  return v11;
}

- (void)dealloc
{
  char flags = (char)self->_flags;
  if (self->_count)
  {
    if ((*(unsigned char *)&self->_flags & 6) != 0)
    {
      unint64_t v4 = 0;
      do

      while (v4 < self->_count);
      char flags = (char)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      array = self->_array;
LABEL_10:
      PF_FREE_OBJECT_ARRAY(array);
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    array = self->_array;
    if (array) {
      goto LABEL_10;
    }
  }
  if (self->_count)
  {
    if ((*(unsigned char *)&self->_flags & 0x20) != 0)
    {
      weakContext = self->_weakContext;
      if (weakContext)
      {
        id WeakRetained = objc_loadWeakRetained(&weakContext->_object);
        if (WeakRetained)
        {
          v8 = WeakRetained;
          -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)WeakRetained);
        }
      }
    }
  }

  self->_weakContext = 0;
  v9.receiver = self;
  v9.super_class = (Class)_PFArray;
  [(_PFArray *)&v9 dealloc];
}

- (unint64_t)count
{
  return self->_count;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (self->_count > a3) {
    return self->_array[a3];
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"%@: index (%lu) beyond bounds (%lu)", _NSMethodExceptionProem(), a3, self->_count format];
  return 0;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > self->_count) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"%@: index (%lu) beyond bounds (%lu)", _NSMethodExceptionProem(), a4.location + a4.length - 1, self->_count format];
  }
  if (length)
  {
    v8 = &self->_array[location];
    memmove(a3, v8, 8 * length);
  }
}

- (_PFArray)initWithObjects:(id *)a3 count:(unsigned int)a4 andFlags:(unsigned int)a5
{
  return [(_PFArray *)self initWithObjects:a3 count:*(void *)&a4 andFlags:*(void *)&a5 andContext:0];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&self->_count;
  }
  unint64_t v6 = 0;
  a3->var1 = a4;
  if (a5)
  {
    unint64_t count = self->_count;
    if (var0 < count)
    {
      unint64_t v6 = 0;
      do
        a4[v6] = (id)*((void *)&self->_array[var0] + v6);
      while (++v6 + var0 < count && v6 < a5);
      var0 += v6;
    }
  }
  a3->unint64_t var0 = var0;
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1C978]);
  array = self->_array;
  uint64_t count = self->_count;

  return (id)[v4 initWithObjects:array count:count];
}

- (id)_objectsPointer
{
  return self->_array;
}

- (id)arrayFromObjectIDs
{
  id v2 = [(_PFArray *)self newArrayFromObjectIDs];

  return v2;
}

- (id)newArrayFromObjectIDs
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    return (id)[(_PFArray *)self copy];
  }
  uint64_t count = self->_count;
  if (count) {
    uint64_t v5 = self->_count;
  }
  else {
    uint64_t v5 = 1;
  }
  if (count >= 0x201) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  char v7 = (char *)v10 - ((8 * v6 + 15) & 0xFFFFFFFF0);
  if (count >= 0x201)
  {
    char v7 = (char *)NSAllocateScannedUncollectable();
LABEL_15:
    for (uint64_t i = 0; i != count; ++i)
      *(void *)&v7[8 * i] = [self->_array[i] objectID];
    goto LABEL_17;
  }
  bzero((char *)v10 - ((8 * v6 + 15) & 0xFFFFFFFF0), 8 * v5);
  if (count) {
    goto LABEL_15;
  }
LABEL_17:
  objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v7 count:count];
  if (count >= 0x201) {
    NSZoneFree(0, v7);
  }
  return v9;
}

- (id)managedObjectIDAtIndex:(unint64_t)a3
{
  v3 = (id *)self->_array[a3];
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    return v3[5];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (void)initialize
{
}

- (unint64_t)indexOfManagedObjectForObjectID:(id)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) == 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = [a3 methodForSelector:sel_isEqual_];
  uint64_t count = self->_count;
  if (!count) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  char v7 = (uint64_t (*)(id, char *))v5;
  unint64_t v8 = 0;
  while (*((id *)self->_array[v8] + 5) != a3 && (v7(a3, sel_isEqual_) & 1) == 0)
  {
    if (count == ++v8) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v8;
}

- (id)subarrayWithRange:(_NSRange)a3
{
  if (a3.location + a3.length <= self->_count)
  {
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      uint64_t v4 = 59;
    }
    else {
      uint64_t v4 = 27;
    }
    uint64_t v5 = [[_PFArray alloc] initWithObjects:&self->_array[a3.location] count:a3.length andFlags:v4];
    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_PFArray;
    return -[_PFArray subarrayWithRange:](&v6, sel_subarrayWithRange_, a3.location, a3.length);
  }
}

- (void)getObjects:(id *)a3
{
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (_PFArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  return [(_PFArray *)self initWithObjects:a3 count:a4 andFlags:27];
}

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t count = self->_count;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    return -[_PFArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, count);
  }
  else {
    return -[_PFArray indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, 0, count);
  }
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v8 = a4.location + a4.length;
  uint64_t v9 = [a3 methodForSelector:sel_isEqual_];
  if (location >= v8) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v10 = (uint64_t (*)(id, char *))v9;
  while (self->_array[location] != a3 && (v10(a3, sel_isEqual_) & 1) == 0)
  {
    ++location;
    if (!--length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return location;
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  return -[_PFArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, self->_count);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  if (!a3 || a4.location >= a4.location + a4.length) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  while (self->_array[a4.location] != a3)
  {
    ++a4.location;
    if (!--a4.length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return a4.location;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  array = self->_array;
  uint64_t count = self->_count;

  return (id)[v4 initWithObjects:array count:count];
}

@end