@interface _PFBatchFaultingArray
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (void)initialize;
- (BOOL)isEqualToArray:(id)a3;
- (Class)classForCoder;
- (NSString)description;
- (_PFBatchFaultingArray)initWithPFArray:(id)a3 andRequest:(id)a4 andContext:(id)a5;
- (id)arrayFromObjectIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filteredArrayUsingPredicate:(id)a3;
- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)managedObjectIDAtIndex:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newArrayFromObjectIDs;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (id)retainedObjectAtIndex:(uint64_t)a1;
- (id)sortedArrayUsingComparator:(id)a3;
- (id)sortedArrayUsingDescriptors:(id)a3;
- (id)sortedArrayUsingFunction:(void *)a3 context:(void *)a4;
- (id)sortedArrayUsingFunction:(void *)a3 context:(void *)a4 hint:(id)a5;
- (id)sortedArrayUsingSelector:(SEL)a3;
- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (id)subarrayWithRange:(_NSRange)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (uint64_t)_newSubArrayInRange:(unint64_t)a3 asMutable:(int)a4;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfManagedObjectForObjectID:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)_turnAllBatchesIntoFaults;
- (void)_turnAllBatchesIntoObjects;
- (void)dealloc;
- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation _PFBatchFaultingArray

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

- (void)dealloc
{
  if (self)
  {

    moc = self->_moc;
    if (moc && self->_count)
    {
      -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)moc);
      moc = self->_moc;
    }

    entryFlags = self->_entryFlags;
    if (entryFlags) {
      PF_FREE_OBJECT_ARRAY(entryFlags);
    }
    LRUBatches = self->_LRUBatches;
    if (LRUBatches) {
      PF_FREE_OBJECT_ARRAY(LRUBatches);
    }
    _PFDeallocateObject(self);
  }
}

- (_PFBatchFaultingArray)initWithPFArray:(id)a3 andRequest:(id)a4 andContext:(id)a5
{
  v23.receiver = self;
  v23.super_class = (Class)_PFBatchFaultingArray;
  v8 = [(_PFBatchFaultingArray *)&v23 init];
  if (!v8) {
    return v8;
  }
  v8->_unsigned int count = [a3 count];
  v9 = objc_alloc_init(NSCachingFetchRequest);
  v8->_request = v9;
  if (byte_1E912242C == 1) {
    [(NSCachingFetchRequest *)v9 _disableSQLStatementCaching];
  }
  [a4 _resolveEntityWithContext:a5];
  -[NSFetchRequest setEntity:](v8->_request, "setEntity:", [a4 entity]);
  [(NSFetchRequest *)v8->_request setFetchBatchSize:0];
  [(NSFetchRequest *)v8->_request setIncludesPendingChanges:0];
  [(NSFetchRequest *)v8->_request setSortDescriptors:0];
  [(NSFetchRequest *)v8->_request setFetchOffset:0];
  [(NSFetchRequest *)v8->_request setHavingPredicate:0];
  [(NSFetchRequest *)v8->_request setPropertiesToGroupBy:0];
  -[NSFetchRequest setAffectedStores:](v8->_request, "setAffectedStores:", [a4 affectedStores]);
  -[NSFetchRequest setResultType:](v8->_request, "setResultType:", [a4 resultType]);
  -[NSFetchRequest setIncludesSubentities:](v8->_request, "setIncludesSubentities:", [a4 includesSubentities]);
  -[NSFetchRequest setIncludesPropertyValues:](v8->_request, "setIncludesPropertyValues:", [a4 includesPropertyValues]);
  -[NSFetchRequest setReturnsObjectsAsFaults:](v8->_request, "setReturnsObjectsAsFaults:", [a4 returnsObjectsAsFaults]);
  -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v8->_request, "setRelationshipKeyPathsForPrefetching:", [a4 relationshipKeyPathsForPrefetching]);
  -[NSFetchRequest setReturnsDistinctResults:](v8->_request, "setReturnsDistinctResults:", [a4 returnsDistinctResults]);
  -[NSFetchRequest setPropertiesToFetch:](v8->_request, "setPropertiesToFetch:", [a4 propertiesToFetch]);
  -[NSFetchRequest setShouldRefreshRefetchedObjects:](v8->_request, "setShouldRefreshRefetchedObjects:", [a4 shouldRefreshRefetchedObjects]);
  if ([a4 _disablePersistentStoreResultCaching]) {
    [(NSFetchRequest *)v8->_request _setDisablePersistentStoreResultCaching:1];
  }
  uint64_t v10 = [MEMORY[0x1E4F28C68] expressionForVariable:@"batch"];
  id v11 = objc_alloc(MEMORY[0x1E4F28B98]);
  v12 = objc_msgSend(v11, "initWithLeftExpression:rightExpression:modifier:type:options:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForEvaluatedObject"), v10, 0, 10, 0);
  [(NSFetchRequest *)v8->_request setPredicate:v12];

  v8->_moc = (NSManagedObjectContext *)a5;
  v13 = (_PFArray *)a3;
  v8->_array = v13;
  if (v13)
  {
    *(unsigned char *)&v13->_flags |= 2u;
    *(unsigned char *)&v13->_flags &= ~4u;
    array = v8->_array;
    if (array) {
      *(unsigned char *)&array->_flags &= ~4u;
    }
  }
  v8->_unsigned int batchSize = [a4 fetchBatchSize];
  unsigned int v15 = [a4 _fetchBatchLRUEntriesLimit];
  if (v15) {
    unsigned int v16 = v15;
  }
  else {
    unsigned int v16 = 4;
  }
  v8->_flags = (_PFBatchFaultingArrayFlags)(*(_DWORD *)&v8->_flags & 0xFFF001FF | ((v16 & 0x7FF) << 9));
  unsigned int batchSize = v8->_batchSize;
  if (!batchSize)
  {
    unsigned int batchSize = 27;
LABEL_18:
    v8->_unsigned int batchSize = batchSize;
    goto LABEL_19;
  }
  if (batchSize * v16 <= 0xF)
  {
    if (v16 >= 2) {
      unsigned int batchSize = 8;
    }
    else {
      unsigned int batchSize = 16;
    }
    goto LABEL_18;
  }
LABEL_19:
  [(NSFetchRequest *)v8->_request setFetchLimit:batchSize];
  unsigned int count = v8->_count;
  unsigned int v19 = v8->_batchSize;
  if (count % v19) {
    unsigned int v20 = count / v19 + 1;
  }
  else {
    unsigned int v20 = count / v19;
  }
  v8->_entryFlags = (unsigned int *)PF_CALLOC_UNSCANNED_BYTES(4 * v20);
  *(_DWORD *)&v8->_flags &= 0xFFFFFF00;
  v21 = (unsigned int *)PF_CALLOC_UNSCANNED_BYTES(4 * v16);
  v8->_LRUBatches = v21;
  memset(v21, 255, 4 * v16);
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (_PF_Threading_Debugging_level)
  {
    v4 = self;
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
    self = v4;
  }

  return self;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&self->_count;
  }
  a3->var1 = a4;
  unint64_t count = self->_count;
  uint64_t v10 = [(_PFArray *)self->_array _objectsPointer];
  unint64_t result = 0;
  unint64_t var0 = a3->var0;
  if (a5 && var0 < count)
  {
    unint64_t result = 0;
    v13 = &v10[var0];
    do
    {
      unint64_t v14 = result;
      unint64_t v15 = var0 + result;
      _faultBatchAtIndex((uint64_t)self, var0 + result, 1);
      unint64_t result = v14 + 1;
      a4[v14] = v13[v14];
    }
    while (v15 + 1 < count && result < a5);
    var0 += result;
  }
  a3->unint64_t var0 = var0;
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  id v5 = -[_PFBatchFaultingArray retainedObjectAtIndex:]((uint64_t)self, a3);

  return v5;
}

- (id)retainedObjectAtIndex:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(*(void *)(a1 + 32), sel_retainedObjectAtIndex_);
  }
  if (*(unsigned int *)(a1 + 12) <= a2)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"%@: index (%lu) beyond bounds (%u)", _NSMethodExceptionProem(), a2, *(unsigned int *)(a1 + 12) format];
    return 0;
  }
  _faultBatchAtIndex(a1, a2, 1);
  v4 = *(void **)([*(id *)(a1 + 16) _objectsPointer] + 8 * a2);

  return v4;
}

- (unint64_t)count
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  return self->_count;
}

- (id)arrayFromObjectIDs
{
  id v2 = [(_PFBatchFaultingArray *)self newArrayFromObjectIDs];

  return v2;
}

- (id)newArrayFromObjectIDs
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  v3 = [(_PFArray *)self->_array _objectsPointer];
  unsigned int count = self->_count;
  MEMORY[0x1F4188790](v3);
  v7 = &v25[-v6];
  unsigned int v26 = count;
  if (count > 0x200)
  {
    v7 = (unsigned char *)NSAllocateScannedUncollectable();
    unsigned int v8 = self->_count;
    if (!v8) {
      goto LABEL_20;
    }
  }
  else
  {
    bzero(&v25[-v6], 8 * v5);
    unsigned int v8 = count;
    if (!count) {
      goto LABEL_20;
    }
  }
  unsigned int v9 = 0;
  do
  {
    unsigned int batchSize = self->_batchSize;
    unsigned int v11 = v9 / batchSize;
    char v12 = ~(v9 / batchSize);
    unsigned int v13 = batchSize + v9;
    if (v13 >= v8) {
      uint64_t v14 = v8;
    }
    else {
      uint64_t v14 = v13;
    }
    if ((self->_entryFlags[v11 >> 5] >> v12))
    {
      int v15 = v14 - v9;
      if (v14 > v9)
      {
        unsigned int v16 = &v7[8 * v9];
        v17 = &v3[v9];
        do
        {
          v18 = *v17++;
          *v16++ = [v18 objectID];
          --v15;
        }
        while (v15);
      }
    }
    else if (v14 > v9)
    {
      uint64_t v19 = v14 - v9;
      unsigned int v20 = &v7[8 * v9];
      v21 = &v3[v9];
      do
      {
        uint64_t v22 = (uint64_t)*v21++;
        *v20++ = v22;
        --v19;
      }
      while (v19);
    }
    unsigned int v8 = self->_count;
    unsigned int v9 = v14;
  }
  while (v14 < v8);
LABEL_20:
  objc_super v23 = [[_PFArray alloc] initWithObjects:v7 count:self->_count andFlags:27];
  if (v26 >= 0x201) {
    NSZoneFree(0, v7);
  }
  return v23;
}

- (unint64_t)indexOfManagedObjectForObjectID:(id)a3
{
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
    if (!a3) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if (!a3)
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int v5 = (uint64_t (*)(id, char *))[a3 methodForSelector:sel_isEqual_];
  uint64_t v6 = [(_PFArray *)self->_array _objectsPointer];
  unsigned int count = self->_count;
  if (!count) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int v8 = v6;
  unsigned int v9 = 0;
  uint64_t v10 = 24;
  while (1)
  {
    unsigned int batchSize = self->_batchSize;
    unsigned int v12 = batchSize + v9;
    uint64_t v13 = batchSize + v9 >= count ? count : v12;
    uint64_t v14 = v10;
    if ((((*(_DWORD **)((char *)&self->super.super.isa + v10))[(v9 / batchSize) >> 5] >> ~(v9 / batchSize)) & 1) == 0) {
      break;
    }
    if (v9 < v13)
    {
      unint64_t v15 = v9;
      while (*((id *)v8[v15] + 5) != a3 && (v5(a3, sel_isEqual_) & 1) == 0)
      {
        if (v13 == ++v15) {
          goto LABEL_20;
        }
      }
      return v15;
    }
LABEL_20:
    unsigned int v9 = v13;
    uint64_t v10 = v14;
    if (count <= v12) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (v9 >= v13) {
    goto LABEL_20;
  }
  unint64_t v15 = v9;
  while (v8[v15] != a3 && (v5(a3, sel_isEqual_) & 1) == 0)
  {
    if (v13 == ++v15) {
      goto LABEL_20;
    }
  }
  return v15;
}

+ (void)initialize
{
  self;
  id v2 = getprogname();
  if (v2)
  {
    v3 = v2;
    if (!strncmp("iBooks", v2, 6uLL)) {
      _MergedGlobals_37 = 1;
    }
    if (!strncmp("Music", v3, 5uLL)) {
      _MergedGlobals_37 = 1;
    }
    if (!strncmp("homed", v3, 5uLL)) {
      byte_1E912242C = 1;
    }
  }
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  if (self->_count <= a3)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"%@: index (%lu) beyond bounds (%u)", _NSMethodExceptionProem(), a3, self->_count format];
    return 0;
  }
  else
  {
    _faultBatchAtIndex((uint64_t)self, a3, 1);
    id v5 = [(_PFArray *)self->_array _objectsPointer][8 * a3];
    return v5;
  }
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  NSUInteger count = self->_count;
  NSUInteger v9 = location + length;
  if (location + length > count) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"%@: index (%lu) beyond bounds (%lu)", _NSMethodExceptionProem(), v9 - 1, self->_count format];
  }
  if (length)
  {
    if (v9 >= count) {
      NSUInteger v10 = count;
    }
    else {
      NSUInteger v10 = location + length;
    }
    if (location < v10)
    {
      NSUInteger v11 = location;
      do
        _faultBatchAtIndex((uint64_t)self, v11++, 0);
      while (v10 != v11);
    }
    unsigned int v12 = [(_PFArray *)self->_array _objectsPointer] + 8 * location;
    memmove(a3, v12, 8 * length);
  }
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

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (BOOL)isEqualToArray:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
    if (!a3) {
      return 0;
    }
  }
  else if (!a3)
  {
    return 0;
  }
  uint64_t count = self->_count;
  if ([a3 count] != count) {
    return 0;
  }
  uint64_t v6 = [(_PFArray *)self->_array _objectsPointer];
  v44 = &v42;
  v45 = v6;
  MEMORY[0x1F4188790](v6);
  NSUInteger v9 = (char *)&v42 - v8;
  unsigned int v43 = v10;
  id v42 = a3;
  if (v10 > 0x200) {
    NSUInteger v9 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v42 - v8, 8 * v7);
  }
  unsigned int v11 = self->_count;
  if (v11)
  {
    unsigned int v12 = 0;
    do
    {
      unsigned int batchSize = self->_batchSize;
      unsigned int v14 = v12 / batchSize;
      char v15 = ~(v12 / batchSize);
      unsigned int v16 = batchSize + v12;
      if (v16 >= v11) {
        uint64_t v17 = v11;
      }
      else {
        uint64_t v17 = v16;
      }
      if ((self->_entryFlags[v14 >> 5] >> v15))
      {
        int v18 = v17 - v12;
        if (v17 > v12)
        {
          uint64_t v19 = &v9[8 * v12];
          unsigned int v20 = &v45[v12];
          do
          {
            v21 = *v20++;
            *(void *)uint64_t v19 = objc_msgSend(v21, "objectID", v42);
            v19 += 8;
            --v18;
          }
          while (v18);
        }
      }
      else if (v17 > v12)
      {
        uint64_t v22 = v17 - v12;
        objc_super v23 = &v9[8 * v12];
        v24 = &v45[v12];
        do
        {
          uint64_t v25 = (uint64_t)*v24++;
          *(void *)objc_super v23 = v25;
          v23 += 8;
          --v22;
        }
        while (v22);
      }
      unsigned int v11 = self->_count;
      unsigned int v12 = v17;
    }
    while (v17 < v11);
  }
  unsigned int v26 = v42;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v27 = (void *)[v26 newArrayFromObjectIDs];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      int v30 = 0;
      uint64_t v31 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v51 != v31) {
            objc_enumerationMutation(v27);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * i), "isEqual:", *(void *)&v9[8 * (v30 + i)], v42))
          {
            BOOL v33 = 0;
            goto LABEL_43;
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v50 objects:v55 count:16];
        v30 += i;
        if (v29) {
          continue;
        }
        break;
      }
    }
    BOOL v33 = 1;
LABEL_43:
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v34 = [v26 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      int v36 = 0;
      uint64_t v37 = *(void *)v47;
      while (2)
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v47 != v37) {
            objc_enumerationMutation(v26);
          }
          v39 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          v40 = *(void **)&v9[8 * (v36 + j)];
          if ((objc_msgSend(v39, "isEqual:", v40, v42) & 1) == 0
            && ((objc_opt_respondsToSelector() & 1) == 0
             || !objc_msgSend(v40, "isEqual:", objc_msgSend(v39, "objectID"))))
          {
            BOOL v33 = 0;
            goto LABEL_46;
          }
        }
        uint64_t v35 = [v26 countByEnumeratingWithState:&v46 objects:v54 count:16];
        v36 += j;
        BOOL v33 = 1;
        if (v35) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v33 = 1;
    }
  }
LABEL_46:
  if (v43 >= 0x201) {
    NSZoneFree(0, v9);
  }
  return v33;
}

- (uint64_t)_newSubArrayInRange:(unint64_t)a3 asMutable:(int)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v7 = a1;
  if (_PF_Threading_Debugging_level) {
    a1 = _PFAssertSafeMultiThreadedAccess_impl(*(void *)(a1 + 32), sel__newSubArrayInRange_asMutable_);
  }
  unsigned int v8 = a2 + a3;
  unsigned int v9 = a2;
  while (v9 < v8)
  {
    unsigned int v10 = *(_DWORD *)(v7 + 48);
    unsigned int v11 = v9 / v10;
    char v12 = ~(v9 / v10);
    v9 += v10;
    if (v9 >= v8) {
      unsigned int v9 = a2 + a3;
    }
    if (((*(_DWORD *)(*(void *)(v7 + 24) + 4 * (v11 >> 5)) >> v12) & 1) == 0)
    {
      uint64_t v13 = [_PFMutableProxyArray alloc];
      return (uint64_t)-[_PFMutableProxyArray initWithPFArray:inRange:](v13, "initWithPFArray:inRange:", v7, a2, a3);
    }
  }
  MEMORY[0x1F4188790](a1);
  uint64_t v17 = (char *)v20 - v16;
  if (a3 > 0x200) {
    uint64_t v17 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v20 - v16, 8 * v15);
  }
  objc_msgSend((id)v7, "getObjects:range:", v17, a2, a3);
  if (a4) {
    int v18 = (_PFArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v17 count:a3];
  }
  else {
    int v18 = [[_PFArray alloc] initWithObjects:v17 count:a3 andFlags:59];
  }
  uint64_t v19 = v18;
  if (a3 >= 0x201) {
    NSZoneFree(0, v17);
  }
  return (uint64_t)v19;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  unint64_t count = self->_count;

  return (id)[(_PFBatchFaultingArray *)(uint64_t)self _newSubArrayInRange:count asMutable:1];
}

- (void)_turnAllBatchesIntoFaults
{
  if (a1)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(*(void *)(a1 + 32), sel__turnAllBatchesIntoFaults);
    }
    unsigned int v2 = *(_DWORD *)(a1 + 12);
    unsigned int v3 = *(_DWORD *)(a1 + 48);
    if (v2 % v3) {
      int v4 = v2 / v3 + 1;
    }
    else {
      int v4 = v2 / v3;
    }
    if (v4)
    {
      for (unsigned int i = 0; i != v4; ++i)
        _releaseStaleBatch(a1, i);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    -[NSManagedObjectContext _processReferenceQueue:](v6, 0);
  }
}

- (void)_turnAllBatchesIntoObjects
{
  if (a1)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(*(void *)(a1 + 32), sel__turnAllBatchesIntoObjects);
    }
    uint64_t v2 = *(unsigned int *)(a1 + 12);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        _faultBatchAtIndex(a1, i, 0);
    }
  }
}

- (void)getObjects:(id *)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  uint64_t count = self->_count;

  -[_PFBatchFaultingArray getObjects:range:](self, "getObjects:range:", a3, 0, count);
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v6 = a4;
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  char v23 = 0;
  unint64_t v9 = [(_PFBatchFaultingArray *)self count];
  uint64_t v10 = [a3 rangeCount];
  if (v9)
  {
    uint64_t v11 = v10;
    if (v10)
    {
      if ((v6 & 2) != 0)
      {
        do
        {
          if (!v11) {
            break;
          }
          unint64_t v19 = [a3 rangeAtIndex:--v11];
          unint64_t v21 = v19 + v20;
          while (v21 <= v9 && v21 > v19)
          {
            id v22 = -[_PFBatchFaultingArray retainedObjectAtIndex:]((uint64_t)self, --v21);
            (*((void (**)(id, id, unint64_t, char *))a5 + 2))(a5, v22, v21, &v23);

            if (v23) {
              return;
            }
          }
        }
        while (!v23);
      }
      else
      {
        uint64_t v12 = 0;
LABEL_7:
        while (1)
        {
          unint64_t v13 = [a3 rangeAtIndex:v12];
          unint64_t v15 = v13;
          unint64_t v16 = v9 >= v13 + v14 ? v13 + v14 : v9;
          if (v13 < v16) {
            break;
          }
          ++v12;
          if (v23) {
            BOOL v18 = 1;
          }
          else {
            BOOL v18 = v12 == v11;
          }
          if (v18) {
            return;
          }
        }
        while (1)
        {
          id v17 = -[_PFBatchFaultingArray retainedObjectAtIndex:]((uint64_t)self, v15);
          (*((void (**)(id, id, unint64_t, char *))a5 + 2))(a5, v17, v15, &v23);

          if (v23) {
            break;
          }
          if (v16 == ++v15)
          {
            if (++v12 != v11) {
              goto LABEL_7;
            }
            return;
          }
        }
      }
    }
  }
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[_PFBatchFaultingArray count](self, "count") && [a3 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68___PFBatchFaultingArray_indexOfObjectAtIndexes_options_passingTest___block_invoke;
    v11[3] = &unk_1E544BC18;
    v11[4] = a5;
    v11[5] = &v12;
    [(_PFBatchFaultingArray *)self enumerateObjectsAtIndexes:a3 options:a4 usingBlock:v11];
  }
  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__7;
  unint64_t v16 = __Block_byref_object_dispose__7;
  uint64_t v17 = 0;
  if (-[_PFBatchFaultingArray count](self, "count") && [a3 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71___PFBatchFaultingArray_indexesOfObjectsAtIndexes_options_passingTest___block_invoke;
    v11[3] = &unk_1E544BC18;
    v11[4] = a5;
    v11[5] = &v12;
    [(_PFBatchFaultingArray *)self enumerateObjectsAtIndexes:a3 options:a4 usingBlock:v11];
  }
  unint64_t v9 = (void *)v13[5];
  if (!v9) {
    unint64_t v9 = (void *)[MEMORY[0x1E4F28D60] indexSet];
  }
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, -[_PFBatchFaultingArray count](self, "count"));
  [(_PFBatchFaultingArray *)self enumerateObjectsAtIndexes:v7 options:a3 usingBlock:a4];
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, -[_PFBatchFaultingArray count](self, "count"));
  unint64_t v8 = [(_PFBatchFaultingArray *)self indexOfObjectAtIndexes:v7 options:a3 passingTest:a4];

  return v8;
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, -[_PFBatchFaultingArray count](self, "count"));
  id v8 = [(_PFBatchFaultingArray *)self indexesOfObjectsAtIndexes:v7 options:a3 passingTest:a4];

  return v8;
}

- (id)sortedArrayUsingFunction:(void *)a3 context:(void *)a4
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v8.receiver = self;
  v8.super_class = (Class)_PFBatchFaultingArray;
  return [(_PFBatchFaultingArray *)&v8 sortedArrayUsingFunction:a3 context:a4];
}

- (id)sortedArrayUsingFunction:(void *)a3 context:(void *)a4 hint:(id)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v10.receiver = self;
  v10.super_class = (Class)_PFBatchFaultingArray;
  return [(_PFBatchFaultingArray *)&v10 sortedArrayUsingFunction:a3 context:a4 hint:a5];
}

- (id)sortedArrayUsingSelector:(SEL)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_PFBatchFaultingArray;
  return [(_PFBatchFaultingArray *)&v6 sortedArrayUsingSelector:a3];
}

- (id)sortedArrayUsingComparator:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_PFBatchFaultingArray;
  return [(_PFBatchFaultingArray *)&v6 sortedArrayUsingComparator:a3];
}

- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v8.receiver = self;
  v8.super_class = (Class)_PFBatchFaultingArray;
  return [(_PFBatchFaultingArray *)&v8 sortedArrayWithOptions:a3 usingComparator:a4];
}

- (id)filteredArrayUsingPredicate:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_PFBatchFaultingArray;
  return [(_PFBatchFaultingArray *)&v6 filteredArrayUsingPredicate:a3];
}

- (id)sortedArrayUsingDescriptors:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_PFBatchFaultingArray;
  return [(_PFBatchFaultingArray *)&v6 sortedArrayUsingDescriptors:a3];
}

- (id)valueForKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  if (![a3 isEqual:@"objectID"]
    || [(NSFetchRequest *)self->_request resultType]
    || (id v5 = [(_PFBatchFaultingArray *)self arrayFromObjectIDs],
        [v5 count] != self->_count))
  {
    -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
    v7.receiver = self;
    v7.super_class = (Class)_PFBatchFaultingArray;
    return [(_PFBatchFaultingArray *)&v7 valueForKey:a3];
  }
  return v5;
}

- (id)valueForKeyPath:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_PFBatchFaultingArray;
  return [(_PFBatchFaultingArray *)&v6 valueForKeyPath:a3];
}

- (id)objectsAtIndexes:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  unint64_t v5 = [a3 count];
  if (self->_count) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    objc_super v7 = 0;
  }
  else
  {
    unint64_t v8 = v5;
    if (v5 >= 0x201) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v5;
    }
    unint64_t v10 = (8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v11 = (char *)v18 - v10;
    if (v5 > 0x200) {
      uint64_t v11 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v18 - v10, 8 * v5);
    }
    if ([a3 rangeCount])
    {
      unint64_t v12 = 0;
      uint64_t v13 = 0;
      do
      {
        uint64_t v14 = [a3 rangeAtIndex:v12];
        uint64_t v16 = v15;
        -[_PFBatchFaultingArray getObjects:range:](self, "getObjects:range:", &v11[8 * v13], v14, v15);
        v13 += v16;
        ++v12;
      }
      while (v12 < [a3 rangeCount]);
    }
    objc_super v7 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:v8];
    if (v8 >= 0x201) {
      NSZoneFree(0, v11);
    }
  }
  if (v7) {
    return v7;
  }
  else {
    return (id)NSArray_EmptyArray;
  }
}

- (unint64_t)indexOfObject:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  uint64_t count = self->_count;

  return -[_PFBatchFaultingArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, count);
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  uint64_t count = self->_count;

  return -[_PFBatchFaultingArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, count);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  uint64_t count = self->_count;

  return -[_PFBatchFaultingArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, count);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  int length = a4.length;
  unsigned int location = a4.location;
  objc_super v7 = self;
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v8 = (void *)[a3 objectID];
  uint64_t v9 = (uint64_t (*)(void *, char *))[v8 methodForSelector:sel_isEqual_];
  uint64_t v10 = [(_PFArray *)v7->_array _objectsPointer];
  unsigned int v11 = location + length;
  if (location + length <= location) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v12 = v10;
  char v23 = v7;
  while (1)
  {
    unsigned int batchSize = v7->_batchSize;
    unsigned int v14 = location / batchSize;
    char v15 = ~(location / batchSize);
    unsigned int v16 = batchSize + location;
    uint64_t v17 = v7;
    uint64_t v18 = v16 >= v11 ? v11 : v16;
    if (((v17->_entryFlags[v14 >> 5] >> v15) & 1) == 0) {
      break;
    }
    if (location < v18)
    {
      unint64_t v19 = location;
      do
      {
        uint64_t v20 = *(void **)(v12 + 8 * v19);
        BOOL v21 = v20 == a3 || v8 == (void *)v20[5];
        if (v21 || (v9(v8, sel_isEqual_) & 1) != 0) {
          return v19;
        }
      }
      while (v18 != ++v19);
    }
LABEL_24:
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    unsigned int location = v18;
    objc_super v7 = v23;
    if (v11 <= v16) {
      return v19;
    }
  }
  if (location >= v18) {
    goto LABEL_24;
  }
  unint64_t v19 = location;
  while (v8 != *(void **)(v12 + 8 * v19) && (v9(v8, sel_isEqual_) & 1) == 0)
  {
    if (v18 == ++v19) {
      goto LABEL_24;
    }
  }
  return v19;
}

- (id)managedObjectIDAtIndex:(unint64_t)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  }
  id result = [(_PFArray *)self->_array _objectsPointer][8 * a3];
  if (((self->_entryFlags[(a3 / self->_batchSize) >> 5] >> ~(a3
                                                                                           / self->_batchSize)) & 1) != 0)
    return (id)*((void *)result + 5);
  return result;
}

- (id)subarrayWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
    if (location) {
      goto LABEL_6;
    }
  }
  else if (a3.location)
  {
    goto LABEL_6;
  }
  if (length == self->_count)
  {
    BOOL v6 = self;
    goto LABEL_7;
  }
LABEL_6:
  BOOL v6 = (_PFBatchFaultingArray *)[(_PFBatchFaultingArray *)(uint64_t)self _newSubArrayInRange:length asMutable:0];
LABEL_7:

  return v6;
}

- (NSString)description
{
  unsigned int v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"%@ (%p) of %lu items for request %@", NSStringFromClass(v4), self, -[_PFArray count](self->_array, "count"), self->_request];
}

@end