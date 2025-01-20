@interface _NSFaultingMutableSet
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isIdenticalFault:(id)a3;
- (BOOL)_shouldProcessKVOChange;
- (BOOL)containsObject:(id)a3;
- (BOOL)intersectsSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSet:(id)a3;
- (BOOL)isFault;
- (BOOL)isSubsetOfSet:(id)a3;
- (Class)classForCoder;
- (NSManagedObject)source;
- (NSPropertyDescription)relationship;
- (_NSFaultingMutableSet)initWithSource:(id)a3 destinations:(id)a4 forRelationship:(id)a5 inContext:(id)a6;
- (_NSFaultingMutableSet)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5;
- (id)allObjects;
- (id)anyObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)replacementObjectForCoder:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3;
- (void)intersectSet:(id)a3;
- (void)makeObjectsPerformSelector:(SEL)a3;
- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)turnIntoFault;
- (void)unionSet:(id)a3;
- (void)willRead;
- (void)willReadWithContents:(id)a3;
@end

@implementation _NSFaultingMutableSet

- (void)dealloc
{
  realSet = (id *)self->_realSet;
  if (realSet && (*(unsigned char *)&self->_flags & 1) != 0)
  {

    PF_FREE_OBJECT_ARRAY(self->_realSet);
  }
  else
  {
  }
  self->_realSet = 0;
  self->_source = 0;

  _PFDeallocateObject(self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)[(NSManagedObject *)self->_source managedObjectContext], a2);
  }
  if (*(unsigned char *)&self->_flags)
  {
    CFSetRef v11 = [[_NSFaultingMutableSet alloc] initWithSource:self->_source forRelationship:[(_NSFaultingMutableSet *)self relationship] asFault:1];
    realSet = (id *)self->_realSet;
    if (realSet)
    {
      v13 = PF_ALLOCATE_OBJECT_ARRAY(2);
      void *v13 = [*realSet mutableCopyWithZone:a3];
      v13[1] = [realSet[1] mutableCopyWithZone:a3];
      *((void *)v11 + 2) = v13;
    }
    *((_DWORD *)v11 + 3) = *((_DWORD *)v11 + 3) & 0xFFFFFFFD | (2 * ((*(_DWORD *)&self->_flags >> 1) & 1));
    return v11;
  }
  unint64_t Count = CFSetGetCount((CFSetRef)self->_realSet);
  if (Count)
  {
    unint64_t v6 = Count;
    callBacks.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
    v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
    if (Count >= 0x201) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = Count;
    }
    callBacks.equal = 0;
    callBacks.hash = 0;
    callBacks.copyDescription = v7;
    unint64_t v9 = (8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0;
    v10 = (const void **)((char *)&v16 - v9);
    if (Count > 0x200) {
      v10 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v16 - v9, 8 * Count);
    }
    CFSetGetValues((CFSetRef)self->_realSet, v10);
    CFSetRef v11 = CFSetCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, v6, &callBacks);
    if (v6 >= 0x201) {
      NSZoneFree(0, v10);
    }
    return v11;
  }
  v14 = NSSet_EmptySet;

  return v14;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

- (NSPropertyDescription)relationship
{
  return *(NSPropertyDescription **)((void)[(NSManagedObject *)self->_source entity][96]
                                   + 24
                                   + (((unint64_t)self->_flags >> 13) & 0x7FFF8));
}

- (BOOL)_shouldProcessKVOChange
{
  return 1;
}

- (id)valueForKey:(id)a3
{
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = self->_realSet;

  return (id)[realSet valueForKey:a3];
}

- (BOOL)isFault
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unint64_t)count
{
  [(_NSFaultingMutableSet *)self willRead];
  CFSetRef realSet = (const __CFSet *)self->_realSet;

  return CFSetGetCount(realSet);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = self->_realSet;

  return [realSet countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)willRead
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)[(NSManagedObject *)self->_source managedObjectContext], a2);
  }
  if (*(unsigned char *)&self->_flags)
  {
    [(_NSFaultingMutableSet *)self willReadWithContents:0];
  }
}

- (void)willReadWithContents:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x18C127630](self, a2);
  if (*(unsigned char *)&self->_flags)
  {
    id realSet = self->_realSet;
    callBacks.version = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
    v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
    callBacks.equal = 0;
    callBacks.hash = 0;
    callBacks.copyDescription = v7;
    uint64_t v8 = [(NSManagedObject *)self->_source managedObjectContext];
    unint64_t v9 = *(void **)((void)[(NSManagedObject *)self->_source entity][96]
                  + 24
                  + (((unint64_t)self->_flags >> 13) & 0x7FFF8));
    self->_id realSet = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &callBacks);
    ptr = realSet;
    if (a3)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v10 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(a3);
            }
            CFSetAddValue((CFMutableSetRef)self->_realSet, *(const void **)(*((void *)&v27 + 1) + 8 * i));
          }
          uint64_t v11 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
        }
        while (v11);
      }
    }
    else
    {
      v25 = v5;
      source = self->_source;
      if (source) {
        uint64_t v15 = _insertion_fault_handler;
      }
      else {
        uint64_t v15 = 0;
      }
      id v16 = -[NSFaultHandler retainedFulfillAggregateFaultForObject:andRelationship:withContext:](v15, source, v9, (uint64_t)v8);
      if ([v16 count])
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v32 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v8, *(void **)(*((void *)&v31 + 1) + 8 * j), 0);
              CFSetAddValue((CFMutableSetRef)self->_realSet, v21);
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v37 count:16];
          }
          while (v18);
        }
      }

      v5 = v25;
    }
    if (ptr)
    {
      v23 = (void *)*ptr;
      v22 = (void *)ptr[1];
      if (*ptr)
      {
        [self->_realSet unionSet:*ptr];
      }
      if (v22)
      {
        [self->_realSet minusSet:v22];
      }
      PF_FREE_OBJECT_ARRAY(ptr);
    }
    unint64_t flags = self->_flags;
    self->_unint64_t flags = (_NSFaultingMutableSetFlags)(flags & 0xFFFFFFFE);
    -[NSManagedObject _commitPhotoshoperyForRelationshipAtIndex:newValue:]((uint64_t)self->_source, flags >> 16, self);
  }
}

- (void)getObjects:(id *)a3
{
  [(_NSFaultingMutableSet *)self willRead];
  CFSetRef realSet = (const __CFSet *)self->_realSet;

  CFSetGetValues(realSet, (const void **)a3);
}

- (_NSFaultingMutableSet)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5
{
  BOOL v5 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_NSFaultingMutableSet;
  uint64_t v8 = [(_NSFaultingMutableSet *)&v15 init];
  unint64_t v9 = v8;
  if (v8)
  {
    v8->_source = (NSManagedObject *)a3;
    if ([a4 _isRelationship]) {
      unsigned int v10 = *(_DWORD *)&v9->_flags & 0xFFFFFFFD | (2 * ((unint64_t)([a4 deleteRule] - 1) < 2));
    }
    else {
      unsigned int v10 = *(_DWORD *)&v9->_flags & 0xFFFFFFFD;
    }
    v9->_unint64_t flags = (_NSFaultingMutableSetFlags)v10;
    v9->_unint64_t flags = (_NSFaultingMutableSetFlags)(v10 & 0xFFFF0003);
    unsigned int v11 = *(_WORD *)&v9->_flags | ([a4 _entitysReferenceID] << 16);
    if (v5)
    {
      v9->_unint64_t flags = (_NSFaultingMutableSetFlags)(v11 | 1);
      v9->_CFSetRef realSet = 0;
    }
    else
    {
      v9->_unint64_t flags = (_NSFaultingMutableSetFlags)(v11 & 0xFFFFFFFE);
      v14.version = *MEMORY[0x1E4F1D548];
      *(_OWORD *)&v14.retain = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
      uint64_t v12 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
      v14.equal = 0;
      v14.hash = 0;
      v14.copyDescription = v12;
      v9->_CFSetRef realSet = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v14);
    }
  }
  return v9;
}

- (void)setSet:(id)a3
{
  if (a3 != self)
  {
    [(_NSFaultingMutableSet *)self willRead];
    id realSet = self->_realSet;
    [realSet setSet:a3];
  }
}

- (id)member:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)[(NSManagedObject *)self->_source managedObjectContext], a2);
  }
  if (*(unsigned char *)&self->_flags)
  {
    id realSet = (id *)self->_realSet;
    if (realSet)
    {
      id result = (id)[*realSet member:a3];
      if (result) {
        return result;
      }
    }
    [(_NSFaultingMutableSet *)self willRead];
  }
  CFSetRef v7 = (const __CFSet *)self->_realSet;

  return (id)CFSetGetValue(v7, a3);
}

- (_NSFaultingMutableSet)initWithSource:(id)a3 destinations:(id)a4 forRelationship:(id)a5 inContext:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CFSetRef v7 = -[_NSFaultingMutableSet initWithSource:forRelationship:asFault:](self, "initWithSource:forRelationship:asFault:", a3, a5, 0, a6);
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

- (void)unionSet:(id)a3
{
  if (a3 != self)
  {
    [(_NSFaultingMutableSet *)self willRead];
    id realSet = self->_realSet;
    [realSet unionSet:a3];
  }
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isNSSet];
    if (v5)
    {
      LOBYTE(v5) = [(_NSFaultingMutableSet *)self isEqualToSet:a3];
    }
  }
  return v5;
}

- (BOOL)isEqualToSet:(id)a3
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
          unint64_t v6 = [(_NSFaultingMutableSet *)self relationship];
          if (v6 == (NSPropertyDescription *)[a3 relationship]) {
            return 1;
          }
        }
      }
    }
  }
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = self->_realSet;

  return [realSet isEqualToSet:a3];
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
          unint64_t v6 = [(_NSFaultingMutableSet *)self relationship];
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
  [(_NSFaultingMutableSet *)self willRead];
  if (*(unsigned char *)&self->_flags)
  {
    id realSet = (id *)self->_realSet;
    if (realSet && ([*realSet containsObject:a3] & 1) != 0) {
      return 1;
    }
    [(_NSFaultingMutableSet *)self willRead];
  }
  return CFSetContainsValue((CFSetRef)self->_realSet, a3) != 0;
}

- (void)addObject:(id)a3
{
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = (id *)self->_realSet;
  if (*(unsigned char *)&self->_flags)
  {
    if (!realSet)
    {
      id realSet = (id *)PF_ALLOCATE_OBJECT_ARRAY(2);
      id *realSet = 0;
      realSet[1] = 0;
      self->_id realSet = realSet;
    }
    CFMutableSetRef v7 = (CFMutableSetRef)*realSet;
    if (!*realSet)
    {
      v9.version = *MEMORY[0x1E4F1D548];
      *(_OWORD *)&v9.retain = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
      uint64_t v8 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
      v9.equal = 0;
      v9.hash = 0;
      v9.copyDescription = v8;
      CFMutableSetRef v7 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v9);
      id *realSet = v7;
    }
    [(__CFSet *)v7 addObject:a3];
    [realSet[1] removeObject:a3];
  }
  else
  {
    unint64_t v6 = (__CFSet *)self->_realSet;
    CFSetAddValue(v6, a3);
  }
}

- (id)allObjects
{
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = self->_realSet;

  return (id)[realSet allObjects];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  [(_NSFaultingMutableSet *)self willRead];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:CFSetGetCount((CFSetRef)self->_realSet)];
  [v4 setSet:self->_realSet];
  return v4;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = self->_realSet;

  [realSet enumerateObjectsWithOptions:a3 usingBlock:a4];
}

- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = self->_realSet;

  return (id)[realSet objectsWithOptions:a3 passingTest:a4];
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
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
  *(_DWORD *)&self->_flags |= 1u;
}

- (NSManagedObject)source
{
  return self->_source;
}

- (id)description
{
  _NSFaultingMutableSetFlags flags = self->_flags;
  v4 = NSString;
  int v5 = [(NSPropertyDescription *)[(_NSFaultingMutableSet *)self relationship] name];
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
  _NSFaultingMutableSetFlags flags = self->_flags;
  unint64_t v6 = NSString;
  CFMutableSetRef v7 = [(NSPropertyDescription *)[(_NSFaultingMutableSet *)self relationship] name];
  source = self->_source;
  if (*(unsigned char *)&flags) {
    return (id)[v6 stringWithFormat:@"Relationship '%@' fault on managed object (%p) %@", v7, self->_source, source, v10];
  }
  else {
    return (id)[v6 stringWithFormat:@"Relationship '%@' on managed object (%p) %@ with objects %@", v7, source, source, objc_msgSend(self->_realSet, "descriptionWithLocale:", a3)];
  }
}

- (id)objectEnumerator
{
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = self->_realSet;

  return (id)[realSet objectEnumerator];
}

- (id)anyObject
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)[(NSManagedObject *)self->_source managedObjectContext], a2);
  }
  if (*(unsigned char *)&self->_flags)
  {
    id realSet = (id *)self->_realSet;
    if (realSet && [*realSet count])
    {
      p_id realSet = (void **)self->_realSet;
      goto LABEL_9;
    }
    [(_NSFaultingMutableSet *)self willRead];
  }
  p_id realSet = &self->_realSet;
LABEL_9:
  int v5 = *p_realSet;

  return (id)[v5 anyObject];
}

- (BOOL)intersectsSet:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = self->_realSet;
  return [realSet intersectsSet:a3];
}

- (BOOL)isSubsetOfSet:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = self->_realSet;
  return [realSet isSubsetOfSet:a3];
}

- (void)makeObjectsPerformSelector:(SEL)a3
{
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = self->_realSet;

  [realSet makeObjectsPerformSelector:a3];
}

- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4
{
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = self->_realSet;

  [realSet makeObjectsPerformSelector:a3 withObject:a4];
}

- (void)removeObject:(id)a3
{
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = (id *)self->_realSet;
  if (*(unsigned char *)&self->_flags)
  {
    if (!realSet)
    {
      id realSet = (id *)PF_ALLOCATE_OBJECT_ARRAY(2);
      id *realSet = 0;
      realSet[1] = 0;
      self->_id realSet = realSet;
    }
    if (!realSet[1])
    {
      v8.version = *MEMORY[0x1E4F1D548];
      *(_OWORD *)&v8.retain = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
      CFMutableSetRef v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
      v8.equal = 0;
      v8.hash = 0;
      v8.copyDescription = v7;
      realSet[1] = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v8);
    }
    [*realSet removeObject:a3];
    [realSet[1] addObject:a3];
  }
  else
  {
    unint64_t v6 = (__CFSet *)self->_realSet;
    CFSetRemoveValue(v6, a3);
  }
}

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(_NSFaultingMutableSet *)self willRead];
  if (*(unsigned char *)&self->_flags)
  {
    id realSet = (id *)self->_realSet;
    if (!realSet)
    {
      id realSet = (id *)PF_ALLOCATE_OBJECT_ARRAY(2);
      id *realSet = 0;
      realSet[1] = 0;
      self->_id realSet = realSet;
    }
    CFMutableSetRef v10 = (CFMutableSetRef)*realSet;
    if (!*realSet)
    {
      callBacks.version = *MEMORY[0x1E4F1D548];
      *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
      uint64_t v11 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
      callBacks.equal = 0;
      callBacks.hash = 0;
      callBacks.copyDescription = v11;
      CFMutableSetRef v10 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &callBacks);
      id *realSet = v10;
    }
    [(__CFSet *)v10 addObjectsFromArray:a3];
    if ([realSet[1] count])
    {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:a3];
      [realSet[1] minusSet:v12];
    }
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(a3);
          }
          CFSetAddValue((CFMutableSetRef)self->_realSet, *(const void **)(*((void *)&v13 + 1) + 8 * i));
        }
        uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v6);
    }
  }
}

- (void)intersectSet:(id)a3
{
  if (a3 != self)
  {
    [(_NSFaultingMutableSet *)self willRead];
    id realSet = self->_realSet;
    [realSet intersectSet:a3];
  }
}

- (void)minusSet:(id)a3
{
  if (a3 == self)
  {
    [a3 removeAllObjects];
  }
  else
  {
    [(_NSFaultingMutableSet *)self willRead];
    id realSet = self->_realSet;
    [realSet minusSet:a3];
  }
}

- (void)removeAllObjects
{
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = (__CFSet *)self->_realSet;

  CFSetRemoveAllValues(realSet);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  [(_NSFaultingMutableSet *)self willRead];
  id realSet = self->_realSet;

  [realSet setValue:a3 forKey:a4];
}

- (id)valueForKeyPath:(id)a3
{
  [(_NSFaultingMutableSet *)self willRead];
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

@end