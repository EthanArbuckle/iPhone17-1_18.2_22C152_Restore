@interface _NSNotifyingWrapperMutableOrderedSet
+ (Class)classForKeyedUnarchiver;
- (BOOL)_reorderObjectsToLocationsByOrderKey:(id)a3 error:(id *)a4;
- (BOOL)containsObject:(id)a3;
- (BOOL)intersectsOrderedSet:(id)a3;
- (BOOL)intersectsSet:(id)a3;
- (BOOL)isEqualToOrderedSet:(id)a3;
- (BOOL)isSubsetOfOrderedSet:(id)a3;
- (BOOL)isSubsetOfSet:(id)a3;
- (Class)classForCoder;
- (_NSNotifyingWrapperMutableOrderedSet)initWithContainer:(id)a3 key:(id)a4 mutableOrderedSet:(id)a5;
- (id)_orderedObjectsAndKeys;
- (id)allObjects;
- (id)array;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4;
- (id)firstObject;
- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)indexesOfObjectsPassingTest:(id)a3;
- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)lastObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (id)objectsAtIndexes:(id)a3;
- (id)reverseObjectEnumerator;
- (id)reversedOrderedSet;
- (id)set;
- (id)sortedArrayUsingComparator:(id)a3;
- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3 inSortedRange:(_NSRange)a4 options:(unint64_t)a5 usingComparator:(id)a6;
- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (unint64_t)indexOfObjectPassingTest:(id)a3;
- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)addObject:(id)a3;
- (void)addObjects:(const void *)a3 count:(unint64_t)a4;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(id *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)intersectOrderedSet:(id)a3;
- (void)intersectSet:(id)a3;
- (void)minusOrderedSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)removeObjectsInArray:(id)a3;
- (void)removeObjectsInRange:(_NSRange)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5;
- (void)setObject:(id)a3 atIndex:(unint64_t)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)sortUsingComparator:(id)a3;
- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (void)unionOrderedSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation _NSNotifyingWrapperMutableOrderedSet

- (void)dealloc
{
  self->_container = 0;
  self->_key = 0;

  self->_mutableOrderedSet = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  [(_NSNotifyingWrapperMutableOrderedSet *)&v3 dealloc];
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v9 = [(NSManagedObject *)self->_container hasFaultForRelationshipNamed:self->_key];
  unint64_t v27 = a4;
  id v28 = a5;
  if (v9)
  {
    v10 = objc_alloc_init(NSFetchRequest);
    [(NSFetchRequest *)v10 setEntity:[(NSManagedObject *)self->_container entity]];
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v10, "setRelationshipKeyPathsForPrefetching:", [MEMORY[0x1E4F1C978] arrayWithObject:self->_key]);
    -[NSFetchRequest setPredicate:](v10, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"self == %@", -[NSManagedObject objectID](self->_container, "objectID")]);
    [(NSFetchRequest *)v10 setReturnsObjectsAsFaults:0];
    [(NSFetchRequest *)v10 setIncludesPendingChanges:0];
    if (!v10) {
      goto LABEL_34;
    }
LABEL_33:
    [(NSManagedObjectContext *)[(NSManagedObject *)self->_container managedObjectContext] executeFetchRequest:v10 error:0];
    goto LABEL_34;
  }
  id v11 = [(NSManagedObject *)self->_container valueForKey:self->_key];
  unint64_t v12 = [v11 count];
  if (length == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger length = v12;
  }
  if (v12)
  {
    unint64_t v13 = v12;
    v26[1] = v26;
    uint64_t v14 = v12 >= 0x201 ? 1 : v12;
    unint64_t v15 = (8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0;
    v16 = (char *)v26 - v15;
    if (v12 > 0x200) {
      v16 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v26 - v15, 8 * v12);
    }
    [v11 getObjects:v16];
    if (location >= v13 + location)
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v18 = 8 * location;
      unint64_t v19 = v13;
      do
      {
        v20 = *(_DWORD **)&v16[v18];
        int v21 = (v20[4] >> 15) & 7;
        if (v21) {
          BOOL v22 = v21 == 5;
        }
        else {
          BOOL v22 = 1;
        }
        if (!v22)
        {
          v23 = (void *)[v20 objectID];
          char v24 = [v23 isTemporaryID];
          if ((v24 & 1) == 0) {
            *(void *)&v16[8 * v17++] = v23;
          }
        }
        v18 += 8;
        --v19;
      }
      while (v19);
      if (v17) {
        uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v16 count:v17];
      }
    }
    if (v13 >= 0x201) {
      NSZoneFree(0, v16);
    }
    if ([(id)v17 count])
    {
      v10 = objc_alloc_init(NSFetchRequest);
      -[NSFetchRequest setEntity:](v10, "setEntity:", objc_msgSend(-[NSDictionary objectForKey:](-[NSEntityDescription relationshipsByName](-[NSManagedObject entity](self->_container, "entity"), "relationshipsByName"), "objectForKey:", self->_key), "destinationEntity"));
      -[NSFetchRequest setPredicate:](v10, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v17]);
      [(NSFetchRequest *)v10 setReturnsObjectsAsFaults:0];
      [(NSFetchRequest *)v10 setIncludesPendingChanges:0];
    }
    else
    {
      v10 = 0;
    }

    if (v10) {
      goto LABEL_33;
    }
  }
LABEL_34:
  int v25 = [(NSMutableOrderedSet *)self->_mutableOrderedSet _shouldProcessKVOChange];
  if (v25) {
    [(NSMutableOrderedSet *)self->_mutableOrderedSet _setProcessingIdempotentKVO:1];
  }
  if (length == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger length = [(NSMutableOrderedSet *)self->_mutableOrderedSet count];
  }
  v30.receiver = self;
  v30.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet sortRange:options:usingComparator:](&v30, sel_sortRange_options_usingComparator_, location, length, v27, v28);
  if (v25) {
    [(NSMutableOrderedSet *)self->_mutableOrderedSet _setProcessingIdempotentKVO:0];
  }
}

- (void)sortUsingComparator:(id)a3
{
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = [(NSMutableOrderedSet *)self->_mutableOrderedSet _shouldProcessKVOChange];
  if (v10) {
    BOOL v11 = length == a5;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11) {
    goto LABEL_23;
  }
  v22[1] = v22;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0uLL;
  long long v27 = 0uLL;
  long long v24 = 0uLL;
  long long v25 = 0uLL;
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (const void **)((char *)v22 - v13);
  if (a5 > 0x200) {
    uint64_t v14 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v22 - v13, 8 * v12);
  }
  -[NSMutableOrderedSet getObjects:range:](self->_mutableOrderedSet, "getObjects:range:", v14, location, length);
  CFAllocatorRef v15 = _PFStackAllocatorCreate((unint64_t *)&v24, 1024);
  CFSetRef v16 = CFSetCreate(v15, v14, a5, 0);
  CFSetRef v17 = v16;
  if (a5)
  {
    if (CFSetContainsValue(v16, *a4))
    {
      uint64_t v18 = 1;
      do
      {
        unint64_t v19 = v18;
        if (a5 == v18) {
          break;
        }
        int v20 = CFSetContainsValue(v17, a4[v18]);
        uint64_t v18 = v19 + 1;
      }
      while (v20);
      BOOL v21 = v19 < a5;
    }
    else
    {
      BOOL v21 = 1;
    }
    if (a5 >= 0x201) {
      NSZoneFree(0, v14);
    }
  }
  else
  {
    BOOL v21 = 0;
  }
  if (*((void *)&v25 + 1))
  {
    if (v17) {
      CFRelease(v17);
    }
    if (v21) {
      goto LABEL_23;
    }
  }
  else
  {
    *((void *)&v24 + 1) = v24;
    if (v21)
    {
LABEL_23:
      v23.receiver = self;
      v23.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
      -[_NSNotifyingWrapperMutableOrderedSet replaceObjectsInRange:withObjects:count:](&v23, sel_replaceObjectsInRange_withObjects_count_, location, length, a4, a5);
      return;
    }
  }
  [(NSMutableOrderedSet *)self->_mutableOrderedSet _setProcessingIdempotentKVO:1];
  v23.receiver = self;
  v23.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet replaceObjectsInRange:withObjects:count:](&v23, sel_replaceObjectsInRange_withObjects_count_, location, length, a4, a5);
  [(NSMutableOrderedSet *)self->_mutableOrderedSet _setProcessingIdempotentKVO:0];
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", a3.location, a3.length);
    [(NSManagedObject *)self->_container willChange:3 valuesAtIndexes:v6 forKey:self->_key];
    -[NSMutableOrderedSet removeObjectsInRange:](self->_mutableOrderedSet, "removeObjectsInRange:", location, length);
    [(NSManagedObject *)self->_container didChange:3 valuesAtIndexes:v6 forKey:self->_key];
  }
}

- (void)insertObjects:(id *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (a4)
  {
    id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", a5, a4);
    [(NSManagedObject *)self->_container willChange:2 valuesAtIndexes:v9 forKey:self->_key];
    [(NSMutableOrderedSet *)self->_mutableOrderedSet insertObjects:a3 count:a4 atIndex:a5];
    [(NSManagedObject *)self->_container didChange:2 valuesAtIndexes:v9 forKey:self->_key];
  }
}

- (_NSNotifyingWrapperMutableOrderedSet)initWithContainer:(id)a3 key:(id)a4 mutableOrderedSet:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  v8 = [(_NSNotifyingWrapperMutableOrderedSet *)&v10 init];
  if (v8)
  {
    v8->_container = (NSManagedObject *)a3;
    v8->_key = (NSString *)[a4 copy];
    v8->_mutableOrderedSet = (NSMutableOrderedSet *)a5;
  }
  return v8;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
}

- (unint64_t)count
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet count];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  mutableOrderedSet = self->_mutableOrderedSet;

  return (id)[v4 initWithOrderedSet:mutableOrderedSet copyItems:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CA70]);
  mutableOrderedSet = self->_mutableOrderedSet;

  return (id)[v4 initWithOrderedSet:mutableOrderedSet copyItems:0];
}

- (id)allObjects
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NSMutableOrderedSet *)self->_mutableOrderedSet count];
  unint64_t v4 = MEMORY[0x1F4188790](v3);
  v7 = (char *)v10 - v6;
  if (v4 > 0x200) {
    v7 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v10 - v6, 8 * v5);
  }
  -[NSMutableOrderedSet getObjects:range:](self->_mutableOrderedSet, "getObjects:range:", v7, 0, v3);
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v7 count:v3];
  if (v3 >= 0x201) {
    NSZoneFree(0, v7);
  }
  return v8;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet objectAtIndex:a3];
}

- (unint64_t)indexOfObject:(id)a3
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet indexOfObject:a3];
}

- (void)getObjects:(id *)a3
{
  mutableOrderedSet = self->_mutableOrderedSet;
  uint64_t v5 = [(NSMutableOrderedSet *)mutableOrderedSet count];

  -[NSMutableOrderedSet getObjects:range:](mutableOrderedSet, "getObjects:range:", a3, 0, v5);
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet objectsAtIndexes:a3];
}

- (id)firstObject
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet firstObject];
}

- (id)lastObject
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet lastObject];
}

- (BOOL)isEqualToOrderedSet:(id)a3
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet isEqualToOrderedSet:a3];
}

- (BOOL)containsObject:(id)a3
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet containsObject:a3];
}

- (BOOL)intersectsOrderedSet:(id)a3
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet intersectsOrderedSet:a3];
}

- (BOOL)intersectsSet:(id)a3
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet intersectsSet:a3];
}

- (BOOL)isSubsetOfSet:(id)a3
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet isSubsetOfSet:a3];
}

- (BOOL)isSubsetOfOrderedSet:(id)a3
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet isSubsetOfOrderedSet:a3];
}

- (id)objectEnumerator
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet objectEnumerator];
}

- (id)reverseObjectEnumerator
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet reverseObjectEnumerator];
}

- (id)reversedOrderedSet
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet reversedOrderedSet];
}

- (id)array
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet array];
}

- (id)set
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet set];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
}

- (unint64_t)indexOfObjectPassingTest:(id)a3
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet indexOfObjectPassingTest:a3];
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet indexOfObjectWithOptions:a3 passingTest:a4];
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet indexOfObjectAtIndexes:a3 options:a4 passingTest:a5];
}

- (id)indexesOfObjectsPassingTest:(id)a3
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet indexesOfObjectsPassingTest:a3];
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet indexesOfObjectsWithOptions:a3 passingTest:a4];
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet indexesOfObjectsAtIndexes:a3 options:a4 passingTest:a5];
}

- (unint64_t)indexOfObject:(id)a3 inSortedRange:(_NSRange)a4 options:(unint64_t)a5 usingComparator:(id)a6
{
  return -[NSMutableOrderedSet indexOfObject:inSortedRange:options:usingComparator:](self->_mutableOrderedSet, "indexOfObject:inSortedRange:options:usingComparator:", a3, a4.location, a4.length, a5, a6);
}

- (id)sortedArrayUsingComparator:(id)a3
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet sortedArrayUsingComparator:a3];
}

- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet sortedArrayWithOptions:a3 usingComparator:a4];
}

- (id)description
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet description];
}

- (id)descriptionWithLocale:(id)a3
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet descriptionWithLocale:a3];
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet descriptionWithLocale:a3 indent:a4];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (id)valueForKey:(id)a3
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet valueForKey:a3];
}

- (id)valueForKeyPath:(id)a3
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet valueForKeyPath:a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  if (-[NSMutableOrderedSet containsObject:](self->_mutableOrderedSet, "containsObject:")
    && [(NSMutableOrderedSet *)self->_mutableOrderedSet _shouldProcessKVOChange])
  {
    int v7 = 1;
    [(NSMutableOrderedSet *)self->_mutableOrderedSet _setProcessingIdempotentKVO:1];
  }
  else
  {
    int v7 = 0;
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:a4];
  [(NSManagedObject *)self->_container willChange:2 valuesAtIndexes:v8 forKey:self->_key];
  [(NSMutableOrderedSet *)self->_mutableOrderedSet insertObject:a3 atIndex:a4];
  [(NSManagedObject *)self->_container didChange:2 valuesAtIndexes:v8 forKey:self->_key];

  if (v7)
  {
    mutableOrderedSet = self->_mutableOrderedSet;
    [(NSMutableOrderedSet *)mutableOrderedSet _setProcessingIdempotentKVO:0];
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:a3];
  [(NSManagedObject *)self->_container willChange:3 valuesAtIndexes:v5 forKey:self->_key];
  [(NSMutableOrderedSet *)self->_mutableOrderedSet removeObjectAtIndex:a3];
  [(NSManagedObject *)self->_container didChange:3 valuesAtIndexes:v5 forKey:self->_key];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if ((objc_msgSend(a4, "isEqual:", -[NSMutableOrderedSet objectAtIndex:](self->_mutableOrderedSet, "objectAtIndex:")) & 1) == 0)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:a3];
    [(NSManagedObject *)self->_container willChange:4 valuesAtIndexes:v7 forKey:self->_key];
    [(NSMutableOrderedSet *)self->_mutableOrderedSet replaceObjectAtIndex:a3 withObject:a4];
    [(NSManagedObject *)self->_container didChange:4 valuesAtIndexes:v7 forKey:self->_key];
  }
}

- (void)addObject:(id)a3
{
  if ((-[NSMutableOrderedSet containsObject:](self->_mutableOrderedSet, "containsObject:") & 1) == 0)
  {
    id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndex:", -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count"));
    [(NSManagedObject *)self->_container willChange:2 valuesAtIndexes:v5 forKey:self->_key];
    [(NSMutableOrderedSet *)self->_mutableOrderedSet insertObject:a3 atIndex:[(NSMutableOrderedSet *)self->_mutableOrderedSet count]];
    [(NSManagedObject *)self->_container didChange:2 valuesAtIndexes:v5 forKey:self->_key];
  }
}

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  MEMORY[0x1F4188790](self);
  id v9 = (char *)v15 - v8;
  if (v10 >= 0x201)
  {
    id v9 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v15 - v8, 8 * v7);
    if (!a4) {
      return;
    }
  }
  uint64_t v11 = 0;
  unint64_t v12 = a4;
  do
  {
    uint64_t v13 = *a3;
    if (([(NSMutableOrderedSet *)self->_mutableOrderedSet containsObject:*a3] & 1) == 0) {
      *(void *)&v9[8 * v11++] = v13;
    }
    ++a3;
    --v12;
  }
  while (v12);
  if (v11)
  {
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count"), v11);
    [(NSManagedObject *)self->_container willChange:2 valuesAtIndexes:v14 forKey:self->_key];
    [(NSMutableOrderedSet *)self->_mutableOrderedSet addObjects:v9 count:v11];
    [(NSManagedObject *)self->_container didChange:2 valuesAtIndexes:v14 forKey:self->_key];
  }
  if (a4 >= 0x201) {
    NSZoneFree(0, v9);
  }
}

- (void)addObjectsFromArray:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = MEMORY[0x1F4188790](v5);
    id v9 = (char *)v10 - v8;
    if (v7 > 0x200) {
      id v9 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v10 - v8, 8 * v7);
    }
    objc_msgSend(a3, "getObjects:range:", v9, 0, v6);
    [(_NSNotifyingWrapperMutableOrderedSet *)self addObjects:v9 count:v6];
    if (v6 >= 0x201) {
      NSZoneFree(0, v9);
    }
  }
}

- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4
{
  if ([(NSMutableOrderedSet *)self->_mutableOrderedSet _shouldProcessKVOChange])
  {
    [(NSMutableOrderedSet *)self->_mutableOrderedSet _setProcessingIdempotentKVO:1];
    v7.receiver = self;
    v7.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
    [(_NSNotifyingWrapperMutableOrderedSet *)&v7 exchangeObjectAtIndex:a3 withObjectAtIndex:a4];
    [(NSMutableOrderedSet *)self->_mutableOrderedSet _setProcessingIdempotentKVO:0];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
    [(_NSNotifyingWrapperMutableOrderedSet *)&v7 exchangeObjectAtIndex:a3 withObjectAtIndex:a4];
  }
}

- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  if ([(NSMutableOrderedSet *)self->_mutableOrderedSet _shouldProcessKVOChange])
  {
    [(NSMutableOrderedSet *)self->_mutableOrderedSet _setProcessingIdempotentKVO:1];
    v7.receiver = self;
    v7.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
    [(_NSNotifyingWrapperMutableOrderedSet *)&v7 moveObjectsAtIndexes:a3 toIndex:a4];
    [(NSMutableOrderedSet *)self->_mutableOrderedSet _setProcessingIdempotentKVO:0];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
    [(_NSNotifyingWrapperMutableOrderedSet *)&v7 moveObjectsAtIndexes:a3 toIndex:a4];
  }
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  if ([a3 count])
  {
    [(NSManagedObject *)self->_container willChange:2 valuesAtIndexes:a4 forKey:self->_key];
    [(NSMutableOrderedSet *)self->_mutableOrderedSet insertObjects:a3 atIndexes:a4];
    container = self->_container;
    key = self->_key;
    [(NSManagedObject *)container didChange:2 valuesAtIndexes:a4 forKey:key];
  }
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  [(_NSNotifyingWrapperMutableOrderedSet *)&v4 setObject:a3 atIndex:a4];
}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  [(_NSNotifyingWrapperMutableOrderedSet *)&v4 replaceObjectsAtIndexes:a3 withObjects:a4];
}

- (void)removeObjectsAtIndexes:(id)a3
{
  if ([a3 count])
  {
    [(NSManagedObject *)self->_container willChange:3 valuesAtIndexes:a3 forKey:self->_key];
    [(NSMutableOrderedSet *)self->_mutableOrderedSet removeObjectsAtIndexes:a3];
    container = self->_container;
    key = self->_key;
    [(NSManagedObject *)container didChange:3 valuesAtIndexes:a3 forKey:key];
  }
}

- (void)removeAllObjects
{
  uint64_t v3 = [(NSMutableOrderedSet *)self->_mutableOrderedSet count];
  if (v3)
  {
    id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, v3);
    [(NSManagedObject *)self->_container willChange:3 valuesAtIndexes:v4 forKey:self->_key];
    [(NSMutableOrderedSet *)self->_mutableOrderedSet removeAllObjects];
    [(NSManagedObject *)self->_container didChange:3 valuesAtIndexes:v4 forKey:self->_key];
  }
}

- (void)removeObject:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  [(_NSNotifyingWrapperMutableOrderedSet *)&v3 removeObject:a3];
}

- (void)removeObjectsInArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = [(NSMutableOrderedSet *)self->_mutableOrderedSet indexOfObject:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
          if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    if ([v5 count])
    {
      [(NSManagedObject *)self->_container willChange:3 valuesAtIndexes:v5 forKey:self->_key];
      [(NSMutableOrderedSet *)self->_mutableOrderedSet removeObjectsAtIndexes:v5];
      [(NSManagedObject *)self->_container didChange:3 valuesAtIndexes:v5 forKey:self->_key];
    }
  }
}

- (void)intersectOrderedSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    mutableOrderedSet = self->_mutableOrderedSet;
    uint64_t v7 = [(NSMutableOrderedSet *)mutableOrderedSet countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(mutableOrderedSet);
          }
          if ([a3 indexOfObject:*(void *)(*((void *)&v12 + 1) + 8 * i)] == 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v9 + i];
          }
        }
        uint64_t v8 = [(NSMutableOrderedSet *)mutableOrderedSet countByEnumeratingWithState:&v12 objects:v16 count:16];
        v9 += i;
      }
      while (v8);
    }
    if ([v5 count])
    {
      [(NSManagedObject *)self->_container willChange:3 valuesAtIndexes:v5 forKey:self->_key];
      [(NSMutableOrderedSet *)self->_mutableOrderedSet removeObjectsAtIndexes:v5];
      [(NSManagedObject *)self->_container didChange:3 valuesAtIndexes:v5 forKey:self->_key];
    }
  }
}

- (void)minusOrderedSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = [(NSMutableOrderedSet *)self->_mutableOrderedSet indexOfObject:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
          if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    if ([v5 count])
    {
      [(NSManagedObject *)self->_container willChange:3 valuesAtIndexes:v5 forKey:self->_key];
      [(NSMutableOrderedSet *)self->_mutableOrderedSet removeObjectsAtIndexes:v5];
      [(NSManagedObject *)self->_container didChange:3 valuesAtIndexes:v5 forKey:self->_key];
    }
  }
}

- (void)unionOrderedSet:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    if (v5 >= 0x201) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v5;
    }
    unint64_t v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v9 = (char *)v10 - v8;
    if (v5 > 0x200) {
      uint64_t v9 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v10 - v8, 8 * v5);
    }
    [a3 getObjects:v9];
    [(_NSNotifyingWrapperMutableOrderedSet *)self addObjects:v9 count:v6];
    if (v6 >= 0x201) {
      NSZoneFree(0, v9);
    }
  }
}

- (void)intersectSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    mutableOrderedSet = self->_mutableOrderedSet;
    uint64_t v7 = [(NSMutableOrderedSet *)mutableOrderedSet countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(mutableOrderedSet);
          }
          if (([a3 containsObject:*(void *)(*((void *)&v12 + 1) + 8 * i)] & 1) == 0) {
            [v5 addIndex:v9 + i];
          }
        }
        uint64_t v8 = [(NSMutableOrderedSet *)mutableOrderedSet countByEnumeratingWithState:&v12 objects:v16 count:16];
        v9 += i;
      }
      while (v8);
    }
    if ([v5 count])
    {
      [(NSManagedObject *)self->_container willChange:3 valuesAtIndexes:v5 forKey:self->_key];
      [(NSMutableOrderedSet *)self->_mutableOrderedSet removeObjectsAtIndexes:v5];
      [(NSManagedObject *)self->_container didChange:3 valuesAtIndexes:v5 forKey:self->_key];
    }
  }
}

- (void)minusSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    mutableOrderedSet = self->_mutableOrderedSet;
    uint64_t v7 = [(NSMutableOrderedSet *)mutableOrderedSet countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(mutableOrderedSet);
          }
          if ([a3 containsObject:*(void *)(*((void *)&v12 + 1) + 8 * i)]) {
            [v5 addIndex:v9 + i];
          }
        }
        uint64_t v8 = [(NSMutableOrderedSet *)mutableOrderedSet countByEnumeratingWithState:&v12 objects:v16 count:16];
        v9 += i;
      }
      while (v8);
    }
    if ([v5 count])
    {
      [(NSManagedObject *)self->_container willChange:3 valuesAtIndexes:v5 forKey:self->_key];
      [(NSMutableOrderedSet *)self->_mutableOrderedSet removeObjectsAtIndexes:v5];
      [(NSManagedObject *)self->_container didChange:3 valuesAtIndexes:v5 forKey:self->_key];
    }
  }
}

- (void)unionSet:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    if (v5 >= 0x201) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v5;
    }
    unint64_t v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v9 = (char *)v10 - v8;
    if (v5 > 0x200) {
      uint64_t v9 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v10 - v8, 8 * v5);
    }
    [a3 getObjects:v9];
    [(_NSNotifyingWrapperMutableOrderedSet *)self addObjects:v9 count:v6];
    if (v6 >= 0x201) {
      NSZoneFree(0, v9);
    }
  }
}

- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
}

- (id)_orderedObjectsAndKeys
{
  return (id)[(NSMutableOrderedSet *)self->_mutableOrderedSet _orderedObjectsAndKeys];
}

- (BOOL)_reorderObjectsToLocationsByOrderKey:(id)a3 error:(id *)a4
{
  return [(NSMutableOrderedSet *)self->_mutableOrderedSet _reorderObjectsToLocationsByOrderKey:a3 error:a4];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end