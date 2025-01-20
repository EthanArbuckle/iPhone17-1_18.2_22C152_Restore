@interface NSHashTable
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (NSHashTable)alloc;
+ (NSHashTable)allocWithZone:(_NSZone *)a3;
+ (NSHashTable)hashTableWithOptions:(NSPointerFunctionsOptions)options;
+ (NSHashTable)weakObjectsHashTable;
+ (id)hashTableWithWeakObjects;
- (BOOL)containsObject:(id)anObject;
- (BOOL)intersectsHashTable:(NSHashTable *)other;
- (BOOL)isEqualToHashTable:(NSHashTable *)other;
- (BOOL)isSubsetOfHashTable:(NSHashTable *)other;
- (Class)classForCoder;
- (NSArray)allObjects;
- (NSEnumerator)objectEnumerator;
- (NSHashTable)init;
- (NSHashTable)initWithCoder:(id)a3;
- (NSHashTable)initWithOptions:(NSPointerFunctionsOptions)options capacity:(NSUInteger)initialCapacity;
- (NSHashTable)initWithPointerFunctions:(NSPointerFunctions *)functions capacity:(NSUInteger)initialCapacity;
- (NSPointerFunctions)pointerFunctions;
- (NSSet)setRepresentation;
- (NSUInteger)count;
- (id)anyObject;
- (id)copy;
- (id)description;
- (id)mutableSet;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)object;
- (void)encodeWithCoder:(id)a3;
- (void)getItem:(const void *)a3;
- (void)getKeys:(const void *)a3 count:(unint64_t *)a4;
- (void)insertKnownAbsentItem:(const void *)a3;
- (void)intersectHashTable:(NSHashTable *)other;
- (void)minusHashTable:(NSHashTable *)other;
- (void)removeAllItems;
- (void)removeItem:(const void *)a3;
- (void)unionHashTable:(NSHashTable *)other;
@end

@implementation NSHashTable

- (BOOL)containsObject:(id)anObject
{
  return [(NSHashTable *)self getItem:anObject] != 0;
}

- (id)anyObject
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  id result = [(NSHashTable *)self countByEnumeratingWithState:v4 objects:&v3 count:16];
  if (result) {
    return (id)**((void **)&v4[0] + 1);
  }
  return result;
}

- (NSSet)setRepresentation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSSet *)[MEMORY[0x1E4F1CA80] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v4 = [(NSHashTable *)self countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(self);
        }
        [(NSSet *)v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      unint64_t v5 = [(NSHashTable *)self countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v5);
  }
  return v3;
}

+ (NSHashTable)hashTableWithOptions:(NSPointerFunctionsOptions)options
{
  uint64_t v3 = [[NSConcreteHashTable alloc] initWithOptions:options capacity:0];

  return (NSHashTable *)v3;
}

+ (NSHashTable)weakObjectsHashTable
{
  v2 = [[NSConcreteHashTable alloc] initWithOptions:5 capacity:0];

  return (NSHashTable *)v2;
}

- (void)unionHashTable:(NSHashTable *)other
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (other != self)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unint64_t v5 = [(NSHashTable *)other countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(other);
          }
          [(NSHashTable *)self addObject:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        unint64_t v6 = [(NSHashTable *)other countByEnumeratingWithState:&v10 objects:v9 count:16];
      }
      while (v6);
    }
  }
}

+ (NSHashTable)alloc
{
  v2 = (objc_class *)self;

  return (NSHashTable *)NSAllocateObject(v2, 0, 0);
}

+ (NSHashTable)allocWithZone:(_NSZone *)a3
{
  uint64_t v3 = (objc_class *)self;

  return (NSHashTable *)NSAllocateObject(v3, 0, 0);
}

+ (id)hashTableWithWeakObjects
{
  v2 = [[NSConcreteHashTable alloc] initWithOptions:1 capacity:0];

  return v2;
}

- (void)minusHashTable:(NSHashTable *)other
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (other == self)
  {
    [(NSHashTable *)other removeAllObjects];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unint64_t v5 = [(NSHashTable *)other countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(other);
          }
          [(NSHashTable *)self removeObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        }
        unint64_t v6 = [(NSHashTable *)other countByEnumeratingWithState:&v10 objects:v9 count:16];
      }
      while (v6);
    }
  }
}

- (NSHashTable)initWithCoder:(id)a3
{
  unint64_t v4 = [NSConcreteHashTable alloc];

  return (NSHashTable *)[(NSConcreteHashTable *)v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)self;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (NSHashTable)initWithOptions:(NSPointerFunctionsOptions)options capacity:(NSUInteger)initialCapacity
{
}

- (NSHashTable)init
{
}

- (id)description
{
}

- (NSEnumerator)objectEnumerator
{
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
}

- (NSUInteger)count
{
}

- (NSArray)allObjects
{
}

- (void)getItem:(const void *)a3
{
}

- (void)addObject:(id)object
{
}

- (void)insertKnownAbsentItem:(const void *)a3
{
}

- (void)removeItem:(const void *)a3
{
}

- (id)copy
{
}

- (void)removeAllItems
{
}

- (void)getKeys:(const void *)a3 count:(unint64_t *)a4
{
}

- (NSHashTable)initWithPointerFunctions:(NSPointerFunctions *)functions capacity:(NSUInteger)initialCapacity
{
}

- (NSPointerFunctions)pointerFunctions
{
}

- (BOOL)intersectsHashTable:(NSHashTable *)other
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = [(NSHashTable *)self countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(self);
        }
        if ([(NSHashTable *)other member:*(void *)(*((void *)&v11 + 1) + 8 * v8)])
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      unint64_t v5 = [(NSHashTable *)self countByEnumeratingWithState:&v11 objects:v10 count:16];
      unint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (BOOL)isEqualToHashTable:(NSHashTable *)other
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (other == self) {
    goto LABEL_12;
  }
  NSUInteger v5 = [(NSHashTable *)other count];
  if (v5 != [(NSHashTable *)self count])
  {
    LOBYTE(v10) = 0;
    return (char)v10;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v6 = [(NSHashTable *)self countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v6)
  {
LABEL_12:
    LOBYTE(v10) = 1;
  }
  else
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(self);
      }
      id v10 = [(NSHashTable *)other member:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
      if (!v10) {
        break;
      }
      if (v7 == ++v9)
      {
        unint64_t v7 = [(NSHashTable *)self countByEnumeratingWithState:&v13 objects:v12 count:16];
        LOBYTE(v10) = 1;
        if (v7) {
          goto LABEL_5;
        }
        return (char)v10;
      }
    }
  }
  return (char)v10;
}

- (BOOL)isSubsetOfHashTable:(NSHashTable *)other
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v5 = [(NSHashTable *)self countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(self);
      }
      id v9 = [(NSHashTable *)other member:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
      if (!v9) {
        break;
      }
      if (v6 == ++v8)
      {
        unint64_t v6 = [(NSHashTable *)self countByEnumeratingWithState:&v12 objects:v11 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v9) = 1;
  }
  return (char)v9;
}

- (void)intersectHashTable:(NSHashTable *)other
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = [(NSHashTable *)self count];
  if (v5 >> 60)
  {
    CFStringRef v15 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v5);
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v15 userInfo:0];
    CFRelease(v15);
    objc_exception_throw(v16);
  }
  if (v5 <= 1) {
    NSUInteger v5 = 1;
  }
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (void *)((char *)v17 - v6);
  v17[1] = 0;
  if (v8 >= 0x101)
  {
    uint64_t v7 = (uint64_t *)_CFCreateArrayStorage();
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v10 = [(NSHashTable *)self countByEnumeratingWithState:&v19 objects:v18 count:16];
  long long v11 = v7;
  if (v10)
  {
    uint64_t v12 = *(void *)v20;
    long long v11 = v7;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(self);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (![(NSHashTable *)other member:v14]) {
          *v11++ = v14;
        }
      }
      unint64_t v10 = [(NSHashTable *)self countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v10);
  }
  while (v7 < v11)
    [(NSHashTable *)self removeObject:*v7++];
  free(v9);
}

- (id)mutableSet
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v4 = [(NSHashTable *)self countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(self);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      unint64_t v5 = [(NSHashTable *)self countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v5);
  }
  return v3;
}

@end