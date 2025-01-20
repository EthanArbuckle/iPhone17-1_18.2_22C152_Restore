@interface _NSFaultingMutableOrderedSet
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isIdenticalFault:(id)a3;
- (BOOL)_reorderObjectsToLocationsByOrderKey:(id)a3 error:(id *)a4;
- (BOOL)_shouldProcessKVOChange;
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOrderedSet:(id)a3;
- (BOOL)isFault;
- (Class)classForCoder;
- (NSManagedObject)source;
- (NSPropertyDescription)relationship;
- (_BYTE)willChange;
- (_NSFaultingMutableOrderedSet)initWithOrderedSet:(id)a3;
- (_NSFaultingMutableOrderedSet)initWithSource:(id)a3 destinations:(id)a4 forRelationship:(id)a5 inContext:(id)a6;
- (_NSFaultingMutableOrderedSet)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5;
- (id)_newOrderKeys;
- (id)_orderedObjectsAndKeys;
- (id)_updateOrderKeysFromOrderOfObjectIDs:(id *)result;
- (id)allObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (id)replacementObjectForCoder:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (uint64_t)_orderKeyForObject:(uint64_t)a1;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)_populateOrderKeysUsingSnapshot:(void *)a3 orderKeys:(void *)a4 newIndexes:(void *)a5 reorderedIndexes:;
- (void)_setProcessingIdempotentKVO:(BOOL)a3;
- (void)addObject:(id)a3;
- (void)addObjects:(const void *)a3 count:(unint64_t)a4;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)minusOrderedSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsInArray:(id)a3;
- (void)removeObjectsInRange:(_NSRange)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)sortUsingComparator:(id)a3;
- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (void)turnIntoFault;
- (void)unionOrderedSet:(id)a3;
- (void)unionSet:(id)a3;
- (void)willRead;
- (void)willReadWithContents:(id)a3;
@end

@implementation _NSFaultingMutableOrderedSet

- (_NSFaultingMutableOrderedSet)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5
{
  BOOL v5 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_NSFaultingMutableOrderedSet;
  v8 = [(_NSFaultingMutableOrderedSet *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_source = (NSManagedObject *)a3;
    if ([a4 _isRelationship]) {
      unsigned int v10 = *(_DWORD *)&v9->_flags & 0xFFFFFFFD | (2 * ((unint64_t)([a4 deleteRule] - 1) < 2));
    }
    else {
      unsigned int v10 = *(_DWORD *)&v9->_flags & 0xFFFFFFFD;
    }
    v9->_flags = (_NSFaultingMutableOrderedSetFlags)v10;
    v9->_flags = (_NSFaultingMutableOrderedSetFlags)(v10 & 0xFFFF001F);
    unsigned int v11 = *(_DWORD *)&v9->_flags & 0xFFE3 | ([a4 _entitysReferenceID] << 16);
    if (v5)
    {
      id v12 = 0;
      v9->_flags = (_NSFaultingMutableOrderedSetFlags)(v11 | 1);
    }
    else
    {
      v9->_flags = (_NSFaultingMutableOrderedSetFlags)(v11 & 0xFFFFFFE2);
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    }
    v9->_realSet = v12;
    v9->_orderKeys = 0;
  }
  return v9;
}

- (uint64_t)_orderKeyForObject:(uint64_t)a1
{
  while (1)
  {
    if (!a1) {
      return 0;
    }
    unint64_t v4 = [*(id *)(a1 + 16) indexOfObject:a2];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    a1 = *(void *)(a1 + 40);
    if (!a1) {
      return 0;
    }
  }
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  unint64_t v5 = v4;
  if (v4 >= [*(id *)(a1 + 16) count]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Index of object > number of objects", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", a1, @"_NSFaultingMutableOrderedSet")), "raise");
  }
  return *(unsigned int *)(*(void *)(a1 + 32) + 4 * v5);
}

- (id)objectAtIndex:(unint64_t)a3
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  return (id)[realSet objectAtIndex:a3];
}

- (id)_newOrderKeys
{
  uint64_t v1 = a1;
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return (id)v1;
  }
  unint64_t v2 = [*(id *)(a1 + 16) count];
  unint64_t v9 = v2;
  uint64_t v10 = *(void *)(v1 + 32);
  if (v10) {
    BOOL v11 = v2 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    if (v2 >= 0x201) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v2;
    }
    unint64_t v16 = (8 * v15 + 15) & 0xFFFFFFFFFFFFFFF0;
    v17 = (char *)v20 - v16;
    if (v2 > 0x200) {
      v17 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v20 - v16, 8 * v2);
    }
    uint64_t v18 = 0;
    do
    {
      *(void *)&v17[8 * v18] = [objc_alloc(NSNumber) initWithUnsignedInt:*(unsigned int *)(*(void *)(v1 + 32) + 4 * v18)];
      ++v18;
    }
    while (v9 != v18);
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v17 count:v9];
    uint64_t v19 = 0;
    do

    while (v9 != v19);
    if (v9 >= 0x201) {
      NSZoneFree(0, v17);
    }
    return (id)v1;
  }
  if (v10) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v2 == 0;
  }
  if (!v12) {
    _NSCoreDataLog(1, @"nil order keys and %d objects in real set", v3, v4, v5, v6, v7, v8, v2);
  }
  v13 = NSArray_EmptyArray;

  return v13;
}

- (BOOL)_shouldProcessKVOChange
{
  return (*(unsigned char *)&self->_flags & 4) == 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  return [realSet countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (unint64_t)count
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  return [realSet count];
}

- (void)willRead
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)[(NSManagedObject *)self->_source managedObjectContext], a2);
  }
  if (*(unsigned char *)&self->_flags)
  {
    [(_NSFaultingMutableOrderedSet *)self willReadWithContents:0];
  }
}

- (void)dealloc
{
  id realSet = (id *)self->_realSet;
  if (realSet && (*(unsigned char *)&self->_flags & 1) != 0)
  {

    PF_FREE_OBJECT_ARRAY(self->_realSet);
  }
  else
  {
  }
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    uint64_t v5 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
    {
      uint64_t v5 = malloc_default_zone();
      orderKeys = self->_orderKeys;
    }
    malloc_zone_free(v5, orderKeys);
    self->_orderKeys = 0;
  }

  self->_grottyHack = 0;
  self->_id realSet = 0;
  self->_source = 0;

  self->_forcedKeys = 0;

  _PFDeallocateObject(self);
}

- (void)willReadWithContents:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)&self->_flags)
  {
    id realSet = self->_realSet;
    uint64_t v6 = [(NSManagedObject *)self->_source managedObjectContext];
    uint64_t v7 = [(NSManagedObject *)self->_source entity];
    if (a3)
    {
      unint64_t v8 = [a3 count];
      unint64_t v9 = MEMORY[0x1F4188790](v8);
      BOOL v12 = (char *)&v27 - v11;
      if (v9 > 0x200) {
        BOOL v12 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v27 - v11, 8 * v10);
      }
      objc_msgSend(a3, "getObjects:range:", v12, 0, v8);
      self->_id realSet = (id)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithObjects:v12 count:v8];
      if (v8 >= 0x201) {
        NSZoneFree(0, v12);
      }
      if (!realSet) {
        goto LABEL_30;
      }
    }
    else
    {
      v13 = *(Class *)((char *)&v7->_properties[3].super.super.isa
                     + (((unint64_t)self->_flags >> 13) & 0x7FFF8));
      source = self->_source;
      if (source) {
        uint64_t v15 = _insertion_fault_handler;
      }
      else {
        uint64_t v15 = 0;
      }
      id v16 = -[NSFaultHandler retainedFulfillAggregateFaultForObject:andRelationship:withContext:](v15, source, v13, (uint64_t)v6);
      uint64_t v17 = [v16 count];
      if (v17)
      {
        unint64_t v18 = v17;
        uint64_t v27 = (uint64_t)&v27;
        unint64_t v19 = MEMORY[0x1F4188790](v17);
        v21 = (char *)&v27 - v20;
        if (v19 > 0x200) {
          v21 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)&v27 - v20, 8 * v19);
        }
        objc_msgSend(v16, "getObjects:", v21, v27, v28);
        for (uint64_t i = 0; i != v18; ++i)
          *(void *)&v21[8 * i] = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v6, *(void **)&v21[8 * i], 0);
        uint64_t v23 = 0;
        self->_id realSet = (id)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithObjects:v21 count:v18];
        do

        while (v18 != v23);
        if (v18 >= 0x201) {
          NSZoneFree(0, v21);
        }
      }
      else
      {
        self->_id realSet = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      }

      if (!realSet) {
        goto LABEL_30;
      }
    }
    v25 = (void *)*realSet;
    v24 = (void *)realSet[1];
    if (*realSet)
    {
      [self->_realSet unionSet:*realSet];
    }
    if (v24)
    {
      [self->_realSet minusSet:v24];
    }
    PF_FREE_OBJECT_ARRAY(realSet);
LABEL_30:
    unint64_t flags = self->_flags;
    self->_unint64_t flags = (_NSFaultingMutableOrderedSetFlags)(flags & 0xFFFFFFFE);
    -[NSManagedObject _commitPhotoshoperyForRelationshipAtIndex:newValue:]((uint64_t)self->_source, flags >> 16, self);
  }
}

- (BOOL)isFault
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  objc_msgSend(realSet, "getObjects:range:", a3, location, length);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)[(NSManagedObject *)self->_source managedObjectContext], a2);
  }
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v6 = [[_NSFaultingMutableOrderedSet alloc] initWithSource:self->_source forRelationship:[(_NSFaultingMutableOrderedSet *)self relationship] asFault:1];
    id realSet = (id *)self->_realSet;
    if (realSet)
    {
      uint64_t v10 = PF_ALLOCATE_OBJECT_ARRAY(2);
      *uint64_t v10 = [*realSet mutableCopyWithZone:a3];
      v10[1] = [realSet[1] mutableCopyWithZone:a3];
      v6->_id realSet = v10;
    }
    v6->_unint64_t flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&v6->_flags & 0xFFFFFFFD | (2
                                                                                          * ((*(_DWORD *)&self->_flags >> 1) & 1)));
    return v6;
  }
  if ([self->_realSet count])
  {
    uint64_t v5 = [[_NSFaultingMutableOrderedSet alloc] initWithSource:self->_source forRelationship:[(_NSFaultingMutableOrderedSet *)self relationship] asFault:0];
    uint64_t v6 = v5;
    id v7 = self->_realSet;
    if (v7)
    {
      id v8 = v5->_realSet;
      if (v8)
      {

        id v7 = self->_realSet;
      }
      v6->_id realSet = v7;
      *(_DWORD *)&self->_flags |= 8u;
      *(_DWORD *)&v6->_flags |= 0x10u;
    }
    return v6;
  }
  BOOL v12 = NSOrderedSet_EmptyOrderedSet;

  return v12;
}

- (NSPropertyDescription)relationship
{
  return *(NSPropertyDescription **)((void)[(NSManagedObject *)self->_source entity][96]
                                   + 24
                                   + (((unint64_t)self->_flags >> 13) & 0x7FFF8));
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

- (id)valueForKey:(id)a3
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  return (id)[realSet valueForKey:a3];
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
      LOBYTE(v5) = [(_NSFaultingMutableOrderedSet *)self isEqualToOrderedSet:a3];
    }
  }
  return v5;
}

- (unint64_t)indexOfObject:(id)a3
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  return [realSet indexOfObject:a3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA70]);
  id realSet = self->_realSet;

  return (id)[v4 initWithOrderedSet:realSet];
}

- (BOOL)isEqualToOrderedSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)[(NSManagedObject *)self->_source managedObjectContext], a2);
  }
  if (a3 == self) {
    return 1;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ([a3 isFault])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        source = self->_source;
        if (source == (NSManagedObject *)[a3 source])
        {
          uint64_t v6 = [(_NSFaultingMutableOrderedSet *)self relationship];
          if (v6 == (NSPropertyDescription *)[a3 relationship]) {
            return 1;
          }
        }
      }
    }
  }
  unint64_t v7 = [(_NSFaultingMutableOrderedSet *)self count];
  if (v7 != [a3 count]) {
    return 0;
  }
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  if (v7 >= 0x201) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = (char *)&v19 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7 > 0x200) {
    uint64_t v10 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v19 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v8);
  }
  [(_NSFaultingMutableOrderedSet *)self getObjects:v10];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  uint64_t v12 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      uint64_t v16 = 0;
      uint64_t v17 = &v10[8 * v14];
      v14 += v13;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(a3);
        }
        if (*(void *)&v17[8 * v16] != *(void *)(*((void *)&v19 + 1) + 8 * v16))
        {
          BOOL v11 = 0;
          goto LABEL_31;
        }
        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_31:
  if (v7 >= 0x201) {
    NSZoneFree(0, v10);
  }
  return v11;
}

- (void)getObjects:(id *)a3
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;
  uint64_t v6 = [realSet count];

  objc_msgSend(realSet, "getObjects:range:", a3, 0, v6);
}

- (void)_populateOrderKeysUsingSnapshot:(void *)a3 orderKeys:(void *)a4 newIndexes:(void *)a5 reorderedIndexes:
{
  id v91 = a3;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  size_t v9 = [*(id *)(a1 + 16) count];
  size_t v10 = v9;
  if (a5)
  {
    BOOL v11 = *a4;
    uint64_t v12 = *a5;
    if (*(void *)(a1 + 32)) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v9 == 0;
    }
    if (v13)
    {
      memset(*a5, 1, v9);
      if (v10)
      {
        uint64_t v14 = *(unsigned int **)(a1 + 32);
        do
        {
          unsigned int v15 = *v14++;
          *v11++ = v15;
          --v10;
        }
        while (v10);
      }
      return;
    }
  }
  else
  {
    if (*(void *)(a1 + 32)) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v9 == 0;
    }
    if (v16) {
      return;
    }
    uint64_t v12 = 0;
    BOOL v11 = 0;
  }
  unsigned int v17 = [a2 count];
  uint64_t v18 = v10;
  *(void *)(a1 + 32) = PF_CALLOC_UNSCANNED_BYTES(4 * v10);
  id v87 = a2;
  if (!a2 || !v91 || !v17 || (unint64_t v19 = v17, v17 != [v91 count]))
  {
    if ((v10 + 1) < 0x400000)
    {
      if (!v10) {
        goto LABEL_29;
      }
      unsigned int v23 = 1024;
    }
    else
    {
      unsigned int v23 = 0xFFFFFFFF / ((int)v10 + 1);
    }
    uint64_t v24 = 0;
    int v25 = 2 * v23;
    do
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 4 * v24) = v25;
      v25 += v23;
      ++v24;
    }
    while (v10 != v24);
LABEL_29:
    if (a5)
    {
      memset(v12, 1, v10);
      if (v10)
      {
        v26 = *(unsigned int **)(a1 + 32);
        do
        {
          unsigned int v27 = *v26++;
          *v11++ = v27;
          --v18;
        }
        while (v18);
      }
    }
    return;
  }
  v88 = v12;
  v86 = &v85;
  ((void (*)(void))MEMORY[0x1F4188790])();
  long long v22 = (char *)&v85 - v20;
  uint64_t v85 = v21;
  if (v10 > 0x200uLL) {
    long long v22 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v85 - v20, 8 * v21);
  }
  uint64_t v28 = *(void **)(a1 + 16);
  v93 = v22;
  objc_msgSend(v28, "getObjects:range:", v22, 0, v10, v85, v86);
  CFDictionaryRef v29 = 0;
  if (v17 >= 6)
  {
    memset(&keyCallBacks, 0, 24);
    *(_OWORD *)&keyCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E4F1D530] + 24);
    keyCallBacks.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E4F1D530] + 40);
    memset(&valueCallBacks, 0, 24);
    *(_OWORD *)&valueCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E4F1D540] + 24);
    MEMORY[0x1F4188790](0);
    v31 = (const void **)((char *)&v85 - v30);
    if (v17 > 0x200uLL)
    {
      v31 = (const void **)NSAllocateScannedUncollectable();
      objc_msgSend(v87, "getObjects:range:", v31, 0, v17);
      v33 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v85 - v30, 8 * v17);
      uint64_t v32 = objc_msgSend(v87, "getObjects:range:", v31, 0, v17);
      MEMORY[0x1F4188790](v32);
      v33 = (char *)&v85 - ((8 * v17 + 15) & 0xFFFFFFFF0);
      bzero(v33, 8 * v19);
    }
    objc_msgSend(v91, "getObjects:range:", v33, 0, v19);
    CFDictionaryRef v29 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v31, (const void **)v33, v19, &keyCallBacks, &valueCallBacks);
    if (v19 >= 0x201)
    {
      v34 = v31;
      CFDictionaryRef v35 = v29;
      NSZoneFree(0, v34);
      NSZoneFree(0, v33);
      CFDictionaryRef v29 = v35;
    }
  }
  CFDictionaryRef v89 = v29;
  v90 = a5;
  if (v10)
  {
    uint64_t v36 = 0;
    int v92 = 0;
    uint64_t v37 = 0;
    char v38 = 1;
    v39 = v93;
    while (1)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v41 = *(const void **)&v39[8 * v36];
      if ((isKindOfClass & 1) == 0) {
        v41 = (const void *)[*(id *)&v39[8 * v36] objectID];
      }
      v42 = *(void **)(a1 + 48);
      if (!v42) {
        goto LABEL_50;
      }
      uint64_t v43 = [v42 objectForKey:v41];
      v44 = (void *)v43;
      if (v90 && v43)
      {
        v88[v36] = 1;
        goto LABEL_56;
      }
      if (!v43)
      {
LABEL_50:
        if (v89)
        {
          Value = (void *)CFDictionaryGetValue(v89, v41);
        }
        else
        {
          uint64_t v46 = [v87 indexOfObject:v41];
          if (v46 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v44 = 0;
            goto LABEL_56;
          }
          Value = (void *)[v91 objectAtIndex:v46];
        }
        v44 = Value;
      }
LABEL_56:
      unsigned int v47 = [v44 unsignedIntValue];
      if (v44 && v47)
      {
        if (v37) {
          BOOL v48 = v37 < v47;
        }
        else {
          BOOL v48 = 1;
        }
        char v49 = v48;
        if (v38) {
          uint64_t v37 = v47;
        }
        v38 &= v49;
        *(_DWORD *)(*(void *)(a1 + 32) + 4 * v36) = v47;
      }
      else
      {
        v38 &= v44 == 0;
        ++v92;
        if (v37) {
          ++v37;
        }
        else {
          uint64_t v37 = 0;
        }
      }
      v39 = v93;
      if (v10 == ++v36) {
        goto LABEL_73;
      }
    }
  }
  int v92 = 0;
  char v38 = 1;
  v39 = v93;
LABEL_73:
  if (v89) {
    CFRelease(v89);
  }
  v50 = *(void **)(a1 + 48);
  v51 = v88;
  if (v50)
  {

    *(void *)(a1 + 48) = 0;
  }
  if (v92 == v10) {
    char v52 = 1;
  }
  else {
    char v52 = v38;
  }
  if ((v52 & 1) == 0)
  {
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    int v55 = ~v92 + v10;
    unsigned int v56 = 2;
    char v57 = 1;
    while (1)
    {
      char v58 = v57;
      int v59 = ((uint64_t (*)(void, size_t, uint64_t, uint64_t))preserveOrderKeyFuncs[v53])(*(void *)(a1 + 32), v10, v54, 1);
      if (v59 == v55) {
        break;
      }
      char v57 = 0;
      BOOL v60 = v59 <= (int)v54;
      if (v59 <= (int)v54) {
        uint64_t v54 = v54;
      }
      else {
        uint64_t v54 = v59;
      }
      if (!v60) {
        unsigned int v56 = v53;
      }
      uint64_t v53 = 1;
      if ((v58 & 1) == 0) {
        goto LABEL_91;
      }
    }
    unsigned int v56 = v53;
LABEL_91:
    if (v56 <= 1) {
      unsigned int v61 = v56;
    }
    else {
      unsigned int v61 = 0;
    }
    ((void (*)(void, size_t, uint64_t, void))preserveOrderKeyFuncs[v61])(*(void *)(a1 + 32), v10, v54, 0);
    v51 = v88;
    v39 = v93;
  }
  v62 = v90;
  if (v10 >= 0x201uLL) {
    NSZoneFree(0, v39);
  }
  if (!v10)
  {
LABEL_126:
    uint64_t v71 = v85;
    if (v62 && v10) {
      goto LABEL_157;
    }
    return;
  }
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v66 = *(void *)(a1 + 32);
    unint64_t v67 = *(unsigned int *)(v66 + 4 * v63);
    if (v65 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v67) {
        uint64_t v65 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v65 = v63;
      }
    }
    else
    {
      if (!v67) {
        goto LABEL_123;
      }
      if (v65)
      {
        uint64_t v64 = *(unsigned int *)(v66 + 4 * (v65 - 1));
        uint64_t v68 = (uint64_t)(v67 - v64) / (v63 - (v65 - 1));
        unint64_t v69 = v68 + v64;
        if (!v68) {
          goto LABEL_114;
        }
      }
      else
      {
        if (v63 >= v67 >> 10) {
          uint64_t v68 = v67 / ((int)v63 + 1);
        }
        else {
          uint64_t v68 = 1024;
        }
        unint64_t v69 = v67 - v68 * v63;
        if (!v68)
        {
LABEL_114:
          *(_DWORD *)(v66 + 4 * v63) = 0;
          goto LABEL_123;
        }
      }
      if (v65 && v68 == 1 && v67 - v64 == v63 - v65 + 1) {
        goto LABEL_114;
      }
      if (v65 < v63)
      {
        do
        {
          if (v69 <= 1) {
            uint64_t v70 = 1;
          }
          else {
            uint64_t v70 = v69;
          }
          *(_DWORD *)(*(void *)(a1 + 32) + 4 * v65) = v70;
          if (v62) {
            v51[v65] = 1;
          }
          unint64_t v69 = v70 + v68;
          ++v65;
        }
        while (v63 != v65);
      }
      uint64_t v65 = 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_123:
    ++v63;
  }
  while (v63 != v10);
  if (v65)
  {
    if (v65 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_126;
    }
    uint64_t v72 = *(void *)(a1 + 32);
    uint64_t v73 = *(unsigned int *)(v72 + 4 * v65 - 4);
    if (v65 >= 1 && v65 + (v10 ^ 0xFFFFFFFFLL) <= v73)
    {
      uint64_t v74 = v72 - 4;
      while (1)
      {
        uint64_t v73 = *(unsigned int *)(v74 + 4 * v65);
        if (v73 && (v10 ^ 0xFFFFFFFFLL) + v65 >= v73) {
          break;
        }
        if ((unint64_t)v65-- <= 1) {
          goto LABEL_138;
        }
      }
    }
    if ((uint64_t)(v73 + ((v10 - v65) << 10)) < 0x100000000) {
      uint64_t v77 = 1024;
    }
    else {
      uint64_t v77 = (v73 ^ 0xFFFFFFFFLL) / (v10 - v65);
    }
    if (v10 > v65)
    {
      unint64_t v82 = v77 + v73;
      if (v82 <= 1) {
        LODWORD(v82) = 1;
      }
      do
      {
        *(_DWORD *)(*(void *)(a1 + 32) + 4 * v65) = v82;
        if (v62) {
          v51[v65] = 1;
        }
        ++v65;
        LODWORD(v82) = v82 + v77;
      }
      while (v10 != v65);
    }
    uint64_t v71 = v85;
    if (v62)
    {
LABEL_157:
      v83 = *(unsigned int **)(a1 + 32);
      do
      {
        unsigned int v84 = *v83++;
        *v11++ = v84;
        --v71;
      }
      while (v71);
    }
  }
  else
  {
LABEL_138:
    if ((v10 + 1) < 0x400000) {
      unsigned int v76 = 1024;
    }
    else {
      unsigned int v76 = 0xFFFFFFFF / ((int)v10 + 1);
    }
    uint64_t v78 = 0;
    int v79 = 2 * v76;
    do
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 4 * v78) = v79;
      v79 += v76;
      ++v78;
    }
    while (v10 != v78);
    if (v62)
    {
      memset(v51, 1, v10);
      v80 = *(unsigned int **)(a1 + 32);
      do
      {
        unsigned int v81 = *v80++;
        *v11++ = v81;
        --v18;
      }
      while (v18);
    }
  }
}

- (void)_setProcessingIdempotentKVO:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (_BYTE)willChange
{
  if (result)
  {
    uint64_t v1 = result;
    result = (unsigned char *)[result willRead];
    if ((v1[12] & 0x10) != 0) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot mutate an immutable faulting NSOrderedSet" userInfo:0]);
    }
  }
  return result;
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v22[1] = *MEMORY[0x1E4F143B8];
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if (length > 2)
  {
    unint64_t v9 = [self->_realSet count];
    if (location < v9)
    {
      unint64_t v10 = v9;
      unint64_t v11 = v9 + 1;
      uint64_t v12 = 1;
      if (v9 + 1 > 1) {
        uint64_t v12 = v9 + 1;
      }
      if (v11 >= 0x201) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v12;
      }
      uint64_t v14 = (char *)v22 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v11 > 0x200) {
        uint64_t v14 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)v22 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v12);
      }
      [self->_realSet getObjects:v14];
      NSUInteger v15 = location + length;
      if (location + length >= v10) {
        NSUInteger v16 = v10;
      }
      else {
        NSUInteger v16 = location + length;
      }
      if (v10 > v15)
      {
        NSUInteger v17 = v16;
        NSUInteger v18 = location;
        do
        {
          *(void *)&v14[8 * v18++] = *(void *)&v14[8 * v17];
          if (v18 >= v10) {
            break;
          }
          ++v17;
        }
        while (v17 < v10);
      }
      unint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithObjects:v14 count:v10 + location - v16];
      if (v11 >= 0x201) {
        NSZoneFree(0, v14);
      }
      id realSet = self->_realSet;
      _NSFaultingMutableOrderedSetFlags flags = self->_flags;
      if ((*(unsigned char *)&flags & 8) != 0) {
        self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      }
      self->_id realSet = v19;
    }
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      unint64_t v7 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v7;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    id v8 = self->_realSet;
    objc_msgSend(v8, "removeObjectsInRange:", location, length);
  }
}

- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  -[_NSFaultingMutableOrderedSet willChange](self);
  unint64_t v9 = [self->_realSet count];
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if (v9 <= a5)
  {
    [(_NSFaultingMutableOrderedSet *)self addObjects:a3 count:a4];
  }
  else if (a4 > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) != 0) {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    CFAllocatorRef v15 = _PFStackAllocatorCreate((unint64_t *)&v17, 1024);
    CFArrayRef v16 = CFArrayCreate(v15, a3, a4, 0);
    self->_id realSet = (id)+[_PFRoutines newOrderedSetFromCollection:byInsertingItems:atIndex:]((uint64_t)_PFRoutines, self->_realSet, v16, a5);
    if (*((void *)&v18 + 1))
    {
      if (v16) {
        CFRelease(v16);
      }
    }
    else
    {
      *((void *)&v17 + 1) = v17;
    }
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      unint64_t v11 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v11;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    id v12 = self->_realSet;
    [v12 insertObjects:a3 count:a4 atIndex:a5];
  }
}

- (_NSFaultingMutableOrderedSet)initWithSource:(id)a3 destinations:(id)a4 forRelationship:(id)a5 inContext:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = -[_NSFaultingMutableOrderedSet initWithSource:forRelationship:asFault:](self, "initWithSource:forRelationship:asFault:", a3, a5, 0, a6);
  if (v7)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(a4);
          }
          CFSetAddValue((CFMutableSetRef)v7->_realSet, *(const void **)(*((void *)&v13 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        uint64_t v9 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  return v7;
}

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if (a4 > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) != 0) {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
    }
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
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    CFAllocatorRef v12 = _PFStackAllocatorCreate((unint64_t *)&v14, 1024);
    CFArrayRef v13 = CFArrayCreate(v12, a3, a4, 0);
    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, self->_realSet, v13);
    if (*((void *)&v15 + 1))
    {
      if (v13) {
        CFRelease(v13);
      }
    }
    else
    {
      *((void *)&v14 + 1) = v14;
    }
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      uint64_t v8 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v8;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    id v9 = self->_realSet;
    [v9 addObjects:a3 count:a4];
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (_NSFaultingMutableOrderedSet)initWithOrderedSet:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_NSFaultingMutableOrderedSet;
  id v4 = [(_NSFaultingMutableOrderedSet *)&v7 init];
  int v5 = v4;
  if (v4)
  {
    v4->_source = 0;
    v4->_id realSet = a3;
    *(_DWORD *)&v5->_flags &= 0xFFE0u;
  }
  return v5;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (id)description
{
  _NSFaultingMutableOrderedSetFlags flags = self->_flags;
  id v4 = NSString;
  int v5 = [(NSPropertyDescription *)[(_NSFaultingMutableOrderedSet *)self relationship] name];
  source = self->_source;
  if (*(unsigned char *)&flags) {
    return (id)[v4 stringWithFormat:@"Relationship '%@' fault on managed object (%p) %@", v5, self->_source, source, v8];
  }
  else {
    return (id)[v4 stringWithFormat:@"Relationship '%@' on managed object (%p) %@ with objects %@", v5, source, source, objc_msgSend(self->_realSet, "description")];
  }
}

- (id)descriptionWithLocale:(id)a3
{
  _NSFaultingMutableOrderedSetFlags flags = self->_flags;
  uint64_t v6 = NSString;
  objc_super v7 = [(NSPropertyDescription *)[(_NSFaultingMutableOrderedSet *)self relationship] name];
  source = self->_source;
  if (*(unsigned char *)&flags) {
    return (id)[v6 stringWithFormat:@"Relationship '%@' fault on managed object (%p) %@", v7, self->_source, source, v10];
  }
  else {
    return (id)[v6 stringWithFormat:@"Relationship '%@' on managed object (%p) %@ with objects %@", v7, source, source, objc_msgSend(self->_realSet, "descriptionWithLocale:", a3)];
  }
}

- (id)_updateOrderKeysFromOrderOfObjectIDs:(id *)result
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    int v3 = result;
    if ([result[2] count])
    {
      unsigned int v4 = [v3[2] count];
      if (!v3[4]) {
        v3[4] = PF_CALLOC_UNSCANNED_BYTES(4 * v4);
      }
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
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
      uint64_t v5 = [a2 count];
      unint64_t v6 = MEMORY[0x1F4188790](v5);
      id v9 = (const void **)((char *)&v31 - v8);
      size_t v10 = 8 * v7;
      uint64_t v31 = v11;
      unint64_t v32 = v6;
      if (v6 > 0x200)
      {
        id v9 = (const void **)NSAllocateScannedUncollectable();
        long long v34 = (char *)NSAllocateScannedUncollectable();
      }
      else
      {
        bzero((char *)&v31 - v8, 8 * v7);
        MEMORY[0x1F4188790](v12);
        long long v34 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v34, v10);
      }
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v40, v45, 16, v31);
      long long v33 = v9;
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = 0;
        uint64_t v16 = *(void *)v41;
        do
        {
          uint64_t v17 = 0;
          long long v18 = (char *)&v9[v15];
          long long v19 = &v34[8 * v15];
          do
          {
            if (*(void *)v41 != v16) {
              objc_enumerationMutation(a2);
            }
            uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8 * v17);
            *(void *)&v19[8 * v17] = v15 + v17 + 1;
            *(void *)&v18[8 * v17++] = v20;
          }
          while (v14 != v17);
          uint64_t v14 = [a2 countByEnumeratingWithState:&v40 objects:v45 count:16];
          v15 += v17;
          id v9 = v33;
        }
        while (v14);
      }
      CFAllocatorRef v21 = _PFStackAllocatorCreate((unint64_t *)&v46, 1024);
      memset(&v39, 0, 24);
      *(_OWORD *)&v39.copyDescription = *(_OWORD *)(MEMORY[0x1E4F1D530] + 24);
      v39.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E4F1D530] + 40);
      CFDictionaryRef v22 = CFDictionaryCreate(v21, v9, (const void **)v34, v32, &v39, 0);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v23 = v3[2];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        int v26 = 0;
        uint64_t v27 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v36 != v27) {
              objc_enumerationMutation(v23);
            }
            Value = CFDictionaryGetValue(v22, (const void *)[*(id *)(*((void *)&v35 + 1) + 8 * i) objectID]);
            if (Value) {
              *((_DWORD *)v3[4] + (v26 + i)) = *(_DWORD *)(a2[4] + 4 * (Value - 1));
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v44 count:16];
          v26 += i;
        }
        while (v25);
      }
      if (v32 >= 0x201)
      {
        NSZoneFree(0, v34);
        NSZoneFree(0, v33);
      }
      if (*((void *)&v47 + 1))
      {
        if (v22) {
          CFRelease(v22);
        }
      }
      else
      {
        *((void *)&v46 + 1) = v46;
      }
    }
    id v30 = v3[5];
    if (v30) {

    }
    result = a2;
    v3[5] = result;
  }
  return result;
}

- (void)turnIntoFault
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)[(NSManagedObject *)self->_source managedObjectContext], a2);
  }
  id realSet = (id *)self->_realSet;
  if (realSet && (*(unsigned char *)&self->_flags & 1) != 0)
  {

    PF_FREE_OBJECT_ARRAY(self->_realSet);
  }
  else
  {
  }
  self->_id realSet = 0;
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  *(_DWORD *)&self->_flags |= 1u;
}

- (NSManagedObject)source
{
  return self->_source;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  if (self->_orderKeys && [self->_realSet indexOfObject:a3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    PF_FREE_OBJECT_ARRAY(self->_orderKeys);
    self->_orderKeys = 0;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v7 = (void *)[self->_realSet mutableCopy];

    self->_id realSet = v7;
    *(_DWORD *)&self->_flags &= ~8u;
  }
  id realSet = self->_realSet;

  [realSet insertObject:a3 atIndex:a4];
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  [realSet enumerateObjectsWithOptions:a3 usingBlock:a4];
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  [realSet enumerateObjectsAtIndexes:a3 options:a4 usingBlock:a5];
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  return [realSet indexOfObjectWithOptions:a3 passingTest:a4];
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  return [realSet indexOfObjectAtIndexes:a3 options:a4 passingTest:a5];
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  return (id)[realSet indexesOfObjectsWithOptions:a3 passingTest:a4];
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  return (id)[realSet indexesOfObjectsAtIndexes:a3 options:a4 passingTest:a5];
}

- (id)objectEnumerator
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  return (id)[realSet objectEnumerator];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    unint64_t v6 = (void *)[self->_realSet mutableCopy];

    self->_id realSet = v6;
    *(_DWORD *)&self->_flags &= ~8u;
  }
  id realSet = self->_realSet;

  [realSet removeObjectAtIndex:a3];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  if (self->_orderKeys)
  {
    uint64_t v7 = [self->_realSet indexOfObject:a4];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v7 != a3)
    {
      PF_FREE_OBJECT_ARRAY(self->_orderKeys);
      self->_orderKeys = 0;
    }
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    id v9 = (void *)[self->_realSet mutableCopy];

    self->_id realSet = v9;
    *(_DWORD *)&self->_flags &= ~8u;
  }
  id realSet = self->_realSet;

  [realSet replaceObjectAtIndex:a3 withObject:a4];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v7 = (void *)[self->_realSet mutableCopy];

    self->_id realSet = v7;
    *(_DWORD *)&self->_flags &= ~8u;
  }
  id realSet = self->_realSet;

  [realSet setValue:a3 forKey:a4];
}

- (id)valueForKeyPath:(id)a3
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  return (id)[realSet valueForKeyPath:a3];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (id)replacementObjectForCoder:(id)a3
{
  return self->_realSet;
}

- (BOOL)_isIdenticalFault:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ([a3 isFault])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        source = self->_source;
        if (source == (NSManagedObject *)[a3 source])
        {
          unint64_t v6 = [(_NSFaultingMutableOrderedSet *)self relationship];
          if (v6 == (NSPropertyDescription *)[a3 relationship]) {
            return 1;
          }
        }
      }
    }
  }
  return 0;
}

- (BOOL)containsObject:(id)a3
{
  [(_NSFaultingMutableOrderedSet *)self willRead];
  id realSet = self->_realSet;

  return [realSet containsObject:a3];
}

- (void)addObject:(id)a3
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  if (self->_orderKeys && [self->_realSet indexOfObject:a3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    PF_FREE_OBJECT_ARRAY(self->_orderKeys);
    self->_orderKeys = 0;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v5 = (void *)[self->_realSet mutableCopy];

    self->_id realSet = v5;
    *(_DWORD *)&self->_flags &= ~8u;
  }
  id realSet = self->_realSet;
  uint64_t v7 = [realSet count];

  [realSet insertObject:a3 atIndex:v7];
}

- (void)addObjectsFromArray:(id)a3
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if ((unint64_t)[a3 count] > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    id v10 = realSet;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      id realSet = self->_realSet;
    }
    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, realSet, a3);
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      unint64_t v6 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    id v7 = self->_realSet;
    [v7 addObjectsFromArray:a3];
  }
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  unint64_t v8 = [a4 firstIndex];
  if (v8 >= [self->_realSet count])
  {
    [(_NSFaultingMutableOrderedSet *)self addObjectsFromArray:a3];
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      id v9 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v9;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    id realSet = self->_realSet;
    [realSet insertObjects:a3 atIndexes:a4];
  }
}

- (void)removeAllObjects
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  _NSFaultingMutableOrderedSetFlags flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0) {
    self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
  }
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }

  self->_id realSet = objc_alloc_init(MEMORY[0x1E4F1CA70]);
}

- (void)removeObjectsInArray:(id)a3
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  unint64_t v5 = [a3 count];
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if (v5 > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    id v11 = realSet;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      id realSet = self->_realSet;
    }
    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, realSet, a3);
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      id v7 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v7;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    id v8 = self->_realSet;
    [v8 removeObjectsInArray:a3];
  }
}

- (void)minusOrderedSet:(id)a3
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if ((unint64_t)[a3 count] > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    id v10 = realSet;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      id realSet = self->_realSet;
    }
    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, realSet, a3);
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      unint64_t v6 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    id v7 = self->_realSet;
    [v7 minusOrderedSet:a3];
  }
}

- (void)unionOrderedSet:(id)a3
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if ((unint64_t)[a3 count] > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    id v10 = realSet;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      id realSet = self->_realSet;
    }
    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, realSet, a3);
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      unint64_t v6 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    id v7 = self->_realSet;
    [v7 unionOrderedSet:a3];
  }
}

- (void)minusSet:(id)a3
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if ((unint64_t)[a3 count] > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    id v10 = realSet;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      id realSet = self->_realSet;
    }
    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, realSet, a3);
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      unint64_t v6 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    id v7 = self->_realSet;
    [v7 minusSet:a3];
  }
}

- (void)unionSet:(id)a3
{
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if ((unint64_t)[a3 count] > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    id v10 = realSet;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      id realSet = self->_realSet;
    }
    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, realSet, a3);
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      unint64_t v6 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    id v7 = self->_realSet;
    [v7 unionSet:a3];
  }
}

- (void)sortUsingComparator:(id)a3
{
}

- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)[(NSManagedObject *)self->_source managedObjectContext], a2);
  }
  uint64_t v10 = 12;
  uint64_t v11 = objc_msgSend(*(id *)((void)-[NSManagedObject entity](self->_source, "entity")[96]+ 24+ (((unint64_t)self->_flags >> 13) & 0x7FFF8)), "name");
  if ([(NSManagedObject *)self->_source hasFaultForRelationshipNamed:v11])
  {
    NSUInteger v12 = location;
    uint64_t v13 = objc_alloc_init(NSFetchRequest);
    [(NSFetchRequest *)v13 setEntity:[(NSManagedObject *)self->_source entity]];
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v13, "setRelationshipKeyPathsForPrefetching:", [MEMORY[0x1E4F1C978] arrayWithObject:v11]);
    -[NSFetchRequest setPredicate:](v13, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"self == %@", -[NSManagedObject objectID](self->_source, "objectID")]);
    [(NSFetchRequest *)v13 setReturnsObjectsAsFaults:0];
    [(NSFetchRequest *)v13 setIncludesPendingChanges:0];
    if (!v13)
    {
LABEL_6:
      NSUInteger location = v12;
      goto LABEL_7;
    }
LABEL_5:
    [(NSManagedObjectContext *)[(NSManagedObject *)self->_source managedObjectContext] executeFetchRequest:v13 error:0];
    goto LABEL_6;
  }
  uint64_t v33 = 12;
  id v15 = [(NSManagedObject *)self->_source valueForKey:v11];
  uint64_t v16 = [v15 count];
  if (length == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger length = v16;
  }
  if (v16)
  {
    unint64_t v17 = v16;
    uint64_t v31 = &v29;
    unint64_t v32 = a4;
    unint64_t v18 = MEMORY[0x1F4188790](v16);
    uint64_t v20 = (char *)&v29 - v19;
    if (v18 > 0x200) {
      uint64_t v20 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v29 - v19, 8 * v18);
    }
    [v15 getObjects:v20];
    if (location >= v17 + location)
    {
      uint64_t v21 = 0;
    }
    else
    {
      NSUInteger v29 = location;
      id v30 = a5;
      uint64_t v21 = 0;
      uint64_t v22 = 8 * location;
      unint64_t v23 = v17;
      do
      {
        uint64_t v24 = *(_DWORD **)&v20[v22];
        int v25 = (v24[4] >> 15) & 7;
        if (v25) {
          BOOL v26 = v25 == 5;
        }
        else {
          BOOL v26 = 1;
        }
        if (!v26)
        {
          uint64_t v27 = (void *)[v24 objectID];
          if (([v27 isTemporaryID] & 1) == 0) {
            *(void *)&v20[8 * v21++] = v27;
          }
        }
        v22 += 8;
        --v23;
      }
      while (v23);
      if (v21) {
        uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v20 count:v21];
      }
      NSUInteger location = v29;
      a5 = v30;
    }
    if (v17 >= 0x201) {
      NSZoneFree(0, v20);
    }
    NSUInteger v12 = location;
    if (objc_msgSend((id)v21, "count", v29, v30))
    {
      id v28 = [(NSDictionary *)[(NSEntityDescription *)[(NSManagedObject *)self->_source entity] relationshipsByName] objectForKey:v11];
      uint64_t v13 = objc_alloc_init(NSFetchRequest);
      -[NSFetchRequest setEntity:](v13, "setEntity:", [v28 destinationEntity]);
      -[NSFetchRequest setPredicate:](v13, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v21]);
      [(NSFetchRequest *)v13 setReturnsObjectsAsFaults:0];
      [(NSFetchRequest *)v13 setIncludesPendingChanges:0];
    }
    else
    {
      uint64_t v13 = 0;
    }
    a4 = v32;

    uint64_t v10 = v33;
    if (!v13) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v10 = v33;
LABEL_7:
  -[_NSFaultingMutableOrderedSet willChange](self);
  if ((*((unsigned char *)&self->super.super.super.isa + v10) & 8) != 0)
  {
    uint64_t v14 = (void *)[self->_realSet mutableCopy];

    self->_id realSet = v14;
    *(_DWORD *)((char *)&self->super.super.super.isa + v10) &= ~8u;
  }
  if (length == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger length = [self->_realSet count];
  }
  v34.receiver = self;
  v34.super_class = (Class)_NSFaultingMutableOrderedSet;
  -[_NSFaultingMutableOrderedSet sortRange:options:usingComparator:](&v34, sel_sortRange_options_usingComparator_, location, length, a4, a5);
}

- (id)allObjects
{
  v10[1] = *MEMORY[0x1E4F143B8];
  [(_NSFaultingMutableOrderedSet *)self willRead];
  unint64_t v3 = [self->_realSet count];
  unint64_t v4 = MEMORY[0x1F4188790](v3);
  id v7 = (char *)v10 - v6;
  if (v4 > 0x200) {
    id v7 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v10 - v6, 8 * v5);
  }
  objc_msgSend(self->_realSet, "getObjects:range:", v7, 0, v3);
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v7 count:v3];
  if (v3 >= 0x201) {
    NSZoneFree(0, v7);
  }
  return v8;
}

- (id)_orderedObjectsAndKeys
{
  source = self->_source;
  if (source && (source->_cd_stateFlags & 0x38) != 0)
  {
    unint64_t v3 = 0;
  }
  else
  {
    if (source) {
      uint64_t v4 = _insertion_fault_handler;
    }
    else {
      uint64_t v4 = 0;
    }
    unint64_t v3 = (void *)-[NSFaultHandler retainedOrderedFaultInformationForAggregateFaultForObject:andRelationship:withContext:error:](v4, source, [(_NSFaultingMutableOrderedSet *)self relationship], (uint64_t)[(NSManagedObject *)self->_source managedObjectContext], 0);
  }

  return v3;
}

- (BOOL)_reorderObjectsToLocationsByOrderKey:(id)a3 error:(id *)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];

  self->_forcedKeys = 0;
  if ([a3 count])
  {
    if (a4)
    {
      unint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F281F8];
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"bad input oidsAndLocations => should have an even number", @"Reason", 0);
      uint64_t v20 = v17;
      uint64_t v21 = v18;
LABEL_14:
      uint64_t v24 = (void *)[v20 errorWithDomain:v21 code:134060 userInfo:v19];
      LOBYTE(v9) = 0;
      *a4 = v24;
      return (char)v9;
    }
LABEL_15:
    LOBYTE(v9) = 0;
    return (char)v9;
  }
  source = self->_source;
  if (source) {
    uint64_t v8 = _insertion_fault_handler;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = (void *)-[NSFaultHandler retainedOrderedFaultInformationForAggregateFaultForObject:andRelationship:withContext:error:](v8, source, [(_NSFaultingMutableOrderedSet *)self relationship], (uint64_t)[(NSManagedObject *)self->_source managedObjectContext], a4);
  if (!v9) {
    return (char)v9;
  }
  uint64_t v10 = v9;
  if ([v9 count] != 2)
  {

    if (a4)
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F281F8];
      long long v47 = @"message";
      v48[0] = [NSString stringWithFormat:@"failed to retrieve ordering information from fault for object %@ and relationship %@", -[NSManagedObject objectID](self->_source, "objectID"), -[NSPropertyDescription name](-[_NSFaultingMutableOrderedSet relationship](self, "relationship"), "name")];
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
      uint64_t v20 = v22;
      uint64_t v21 = v23;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v11 = (id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", 0), "mutableCopy");
  id v12 = (id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", 1), "mutableCopy");
  uint64_t v13 = [v11 count];
  if (v13)
  {
    unint64_t v14 = v13;
    uint64_t v46 = 48;
    char flags = (char)self->_flags;
    id v44 = v10;
    if (flags)
    {
      id v16 = 0;
    }
    else
    {
      id v16 = self->_realSet;
      [(_NSFaultingMutableOrderedSet *)self turnIntoFault];
    }
    int v25 = [(NSManagedObject *)self->_source managedObjectContext];
    v43[1] = v43;
    MEMORY[0x1F4188790](v25);
    uint64_t v27 = (char *)v43 - v26;
    if (v14 > 0x200) {
      uint64_t v27 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v43 - v26, 8 * v14);
    }
    objc_msgSend(v11, "getObjects:range:", v27, 0, v14);
    for (uint64_t i = 0; i != v14; ++i)
      *(void *)&v27[8 * i] = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v25, *(void **)&v27[8 * i], 0);
    NSUInteger v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v27 count:v14];
    [(_NSFaultingMutableOrderedSet *)self willReadWithContents:v29];

    for (uint64_t j = 0; j != v14; ++j)
    if (v14 >= 0x201) {
      NSZoneFree(0, v27);
    }
    if (v16) {

    }
    uint64_t v31 = (objc_class *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v14];
    *(Class *)((char *)&self->super.super.super.isa + v46) = v31;
    unint64_t v32 = [a3 count];
    uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v11 copyItems:0];
    id v45 = [(NSManagedObject *)self->_source mutableOrderedSetValueForKey:[(NSPropertyDescription *)[(_NSFaultingMutableOrderedSet *)self relationship] name]];
    if (v32)
    {
      uint64_t v34 = 0;
      do
      {
        uint64_t v35 = [a3 objectAtIndex:v34];
        uint64_t v36 = v34 + 1;
        uint64_t v37 = [a3 objectAtIndex:v34 + 1];
        uint64_t v38 = [v33 indexOfObject:v35];
        if (v38 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v39 = v38;
          if ((objc_msgSend((id)objc_msgSend(v12, "objectAtIndex:", v38), "isEqual:", v37) & 1) == 0)
          {
            [v12 removeObjectAtIndex:v39];
            [v33 removeObjectAtIndex:v39];
            uint64_t v40 = objc_msgSend(v12, "indexOfObject:inSortedRange:options:usingComparator:", v37, 0, objc_msgSend(v12, "count"), 1024, &__block_literal_global_24);
            uint64_t v41 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v39];
            [v45 moveObjectsAtIndexes:v41 toIndex:v40];
            [v12 insertObject:v37 atIndex:v40];
            [v33 insertObject:v35 atIndex:v40];
            [*(id *)((char *)&self->super.super.super.isa + v46) setObject:v37 forKey:v35];
          }
        }
        uint64_t v34 = v36 + 1;
      }
      while (v36 + 1 < v32);
    }

    LOBYTE(v9) = 1;
  }
  else
  {

    LOBYTE(v9) = 1;
  }
  return (char)v9;
}

@end