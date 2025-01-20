@interface _PFFetchedResultOrderedSetWrapper
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOrderedSet:(id)a3;
- (Class)classForCoder;
- (NSString)description;
- (_PFFetchedResultOrderedSetWrapper)initWithArray:(id)a3 andContext:(id)a4;
- (id)allObjects;
- (id)array;
- (id)arrayFromObjectIDs;
- (id)descriptionWithLocale:(id)a3;
- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)managedObjectIDAtIndex:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newArrayFromObjectIDs;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (id)sortedArrayUsingComparator:(id)a3;
- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfManagedObjectForObjectID:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)dealloc;
- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation _PFFetchedResultOrderedSetWrapper

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (_PFFetchedResultOrderedSetWrapper)initWithArray:(id)a3 andContext:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_PFFetchedResultOrderedSetWrapper;
  v6 = [(_PFFetchedResultOrderedSetWrapper *)&v9 init];
  if (!v6) {
    return v6;
  }
  if (![a3 count])
  {

    return (_PFFetchedResultOrderedSetWrapper *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {

    return (_PFFetchedResultOrderedSetWrapper *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:a3];
  }
  v6->_underlyingArray = (NSArray *)a3;
  if (a4
    && _PF_shouldAsyncProcessReferenceQueue
    && ([a4 concurrencyType] == 1 || objc_msgSend(a4, "concurrencyType") == 2))
  {
    v6->_weakmoc = [[_PFWeakReference alloc] initWithObject:a4];
  }
  return v6;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (void)dealloc
{
  NSUInteger v3 = [(NSArray *)self->_underlyingArray count];

  if (v3)
  {
    weakmoc = self->_weakmoc;
    if (weakmoc)
    {
      id WeakRetained = objc_loadWeakRetained(&weakmoc->_object);
      if (WeakRetained)
      {
        v6 = WeakRetained;
        -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)WeakRetained);
      }
    }
  }

  _PFDeallocateObject(self);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"NSOrderedSet wrapper '%@' for fetch request results: %@", self, self->_underlyingArray];
}

- (id)descriptionWithLocale:(id)a3
{
  return (id)[NSString stringWithFormat:@"NSOrderedSet wrapper '%@' for fetch request results: %@", self, self->_underlyingArray];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CA70]);
  underlyingArray = self->_underlyingArray;

  return (id)[v4 initWithArray:underlyingArray];
}

- (unint64_t)count
{
  return [(NSArray *)self->_underlyingArray count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_underlyingArray objectAtIndex:a3];
}

- (unint64_t)indexOfObject:(id)a3
{
  return [(NSArray *)self->_underlyingArray indexOfObject:a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSArray *)self->_underlyingArray countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return [(NSArray *)self->_underlyingArray indexOfObjectWithOptions:a3 passingTest:a4];
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return [(NSArray *)self->_underlyingArray indexOfObjectAtIndexes:a3 options:a4 passingTest:a5];
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return [(NSArray *)self->_underlyingArray indexesOfObjectsWithOptions:a3 passingTest:a4];
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return [(NSArray *)self->_underlyingArray indexesOfObjectsAtIndexes:a3 options:a4 passingTest:a5];
}

- (id)sortedArrayUsingComparator:(id)a3
{
  return [(NSArray *)self->_underlyingArray sortedArrayUsingComparator:a3];
}

- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  return [(NSArray *)self->_underlyingArray sortedArrayWithOptions:a3 usingComparator:a4];
}

- (id)array
{
  v2 = self->_underlyingArray;

  return v2;
}

- (id)objectEnumerator
{
  return [(NSArray *)self->_underlyingArray objectEnumerator];
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
}

- (void)getObjects:(id *)a3
{
  underlyingArray = self->_underlyingArray;
  uint64_t v5 = [(NSArray *)underlyingArray count];

  -[NSArray getObjects:range:](underlyingArray, "getObjects:range:", a3, 0, v5);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqualToOrderedSet:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 == self) {
    goto LABEL_13;
  }
  unint64_t v5 = [(_PFFetchedResultOrderedSetWrapper *)self count];
  if (v5 != [a3 count])
  {
    LOBYTE(v13) = 0;
    return v13;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v6)
  {
LABEL_13:
    LOBYTE(v13) = 1;
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(a3);
      }
      id v11 = *(id *)(*((void *)&v15 + 1) + 8 * v10);
      id v12 = [(NSArray *)self->_underlyingArray objectAtIndex:v8 + v10];
      if (v12 != v11)
      {
        int v13 = [v12 isEqual:v11];
        if (!v13) {
          break;
        }
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v8 += v10;
        LOBYTE(v13) = 1;
        if (v7) {
          goto LABEL_5;
        }
        return v13;
      }
    }
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isNSOrderedSet];
    if (v5)
    {
      LOBYTE(v5) = [(_PFFetchedResultOrderedSetWrapper *)self isEqualToOrderedSet:a3];
    }
  }
  return v5;
}

- (BOOL)containsObject:(id)a3
{
  return [(NSArray *)self->_underlyingArray indexOfObject:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)allObjects
{
  v2 = self->_underlyingArray;

  return v2;
}

- (id)managedObjectIDAtIndex:(unint64_t)a3
{
  return (id)[(NSArray *)self->_underlyingArray managedObjectIDAtIndex:a3];
}

- (unint64_t)indexOfManagedObjectForObjectID:(id)a3
{
  return [(NSArray *)self->_underlyingArray indexOfManagedObjectForObjectID:a3];
}

- (id)arrayFromObjectIDs
{
  return (id)[(NSArray *)self->_underlyingArray arrayFromObjectIDs];
}

- (id)newArrayFromObjectIDs
{
  return (id)[(NSArray *)self->_underlyingArray newArrayFromObjectIDs];
}

@end