@interface _NSProxyWrapperMutableOrderedSet
- (void)addObject:(id)a3;
- (void)addObjects:(const void *)a3 count:(unint64_t)a4;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)initWithContainer:(uint64_t)a3 key:(uint64_t)a4 mutableOrderedSet:(void *)a5 mutationMethods:;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(id *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)intersectOrderedSet:(id)a3;
- (void)intersectSet:(id)a3;
- (void)minusOrderedSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)removeObjectsInArray:(id)a3;
- (void)removeObjectsInRange:(_NSRange)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)sortUsingComparator:(id)a3;
- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (void)unionOrderedSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation _NSProxyWrapperMutableOrderedSet

- (void)dealloc
{
  self->_mutationMethods = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSProxyWrapperMutableOrderedSet;
  [(_NSNotifyingWrapperMutableOrderedSet *)&v3 dealloc];
}

- (void)initWithContainer:(uint64_t)a3 key:(uint64_t)a4 mutableOrderedSet:(void *)a5 mutationMethods:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)_NSProxyWrapperMutableOrderedSet;
  v6 = objc_msgSendSuper2(&v8, sel_initWithContainer_key_mutableOrderedSet_, a2, a3, a4);
  if (v6) {
    v6[4] = a5;
  }
  return v6;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v9 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->super._mutableOrderedSet, "containsObject:")
    && [(NSMutableOrderedSet *)self->super._mutableOrderedSet _shouldProcessKVOChange])
  {
    int v6 = 1;
    [(NSMutableOrderedSet *)self->super._mutableOrderedSet _setProcessingIdempotentKVO:1];
  }
  else
  {
    int v6 = 0;
  }
  if (self->_mutationMethods->_insertObjectMethod)
  {
    method_invoke();
    if (!v6) {
      return;
    }
  }
  else
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v9 count:1];
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:a4];
    method_invoke();

    if (!v6) {
      return;
    }
  }
  [(NSMutableOrderedSet *)self->super._mutableOrderedSet _setProcessingIdempotentKVO:0];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if (self->_mutationMethods->_removeObjectMethod)
  {
    method_invoke();
  }
  else
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:a3];
    method_invoke();
  }
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v10 = a4;
  if ((objc_msgSend(a4, "isEqual:", -[NSMutableOrderedSet objectAtIndex:](self->super._mutableOrderedSet, "objectAtIndex:")) & 1) == 0)
  {
    mutationMethods = self->_mutationMethods;
    if (mutationMethods->_replaceObjectMethod)
    {
      method_invoke();
    }
    else if (mutationMethods->_replaceMethod)
    {
      objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v10 count:1];
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:a3];
      method_invoke();
    }
    else
    {
      [(_NSProxyWrapperMutableOrderedSet *)self removeObjectAtIndex:a3];
      [(_NSProxyWrapperMutableOrderedSet *)self insertObject:a4 atIndex:a3];
    }
  }
}

- (void)addObject:(id)a3
{
  id v6 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->super._mutableOrderedSet, "containsObject:") & 1) == 0)
  {
    if (self->_mutationMethods->_insertObjectMethod)
    {
      [(NSMutableOrderedSet *)self->super._mutableOrderedSet count];
      method_invoke();
    }
    else
    {
      v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v6 count:1];
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndex:", -[NSMutableOrderedSet count](self->super._mutableOrderedSet, "count"));
      method_invoke();
    }
  }
}

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  MEMORY[0x1F4188790](self);
  id v9 = (char *)v19 - v8;
  if (v10 >= 0x201)
  {
    id v9 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v19 - v8, 8 * v7);
    if (!a4) {
      return;
    }
  }
  uint64_t v11 = 0;
  unint64_t v12 = a4;
  do
  {
    v13 = *a3;
    if (([(NSMutableOrderedSet *)self->super._mutableOrderedSet containsObject:*a3] & 1) == 0) {
      *(void *)&v9[8 * v11++] = v13;
    }
    ++a3;
    --v12;
  }
  while (v12);
  if (v11)
  {
    if (self->_mutationMethods->_insertMethod)
    {
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v9 count:v11];
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", -[NSMutableOrderedSet count](self->super._mutableOrderedSet, "count"), v11);
      method_invoke();
    }
    else
    {
      uint64_t v16 = [(NSMutableOrderedSet *)self->super._mutableOrderedSet count];
      v17 = v9;
      do
      {
        v17 += 8;
        uint64_t v18 = v16 + 1;
        method_invoke();
        uint64_t v16 = v18;
        --v11;
      }
      while (v11);
    }
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
    [(_NSProxyWrapperMutableOrderedSet *)self addObjects:v9 count:v6];
    if (v6 >= 0x201) {
      NSZoneFree(0, v9);
    }
  }
}

- (void)insertObjects:(id *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (a4)
  {
    unint64_t v6 = a4;
    unint64_t v7 = a3;
    if (self->_mutationMethods->_insertMethod)
    {
      id v9 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:a3 count:a4];
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", a5, v6);
      method_invoke();
    }
    else
    {
      do
      {
        ++v7;
        method_invoke();
        ++a5;
        --v6;
      }
      while (v6);
    }
  }
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    if (self->_mutationMethods->_insertMethod)
    {
      method_invoke();
    }
    else
    {
      unint64_t v7 = [a3 count];
      unint64_t v8 = v7;
      if (v7 <= 1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v7;
      }
      if (v7 >= 0x201) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v9;
      }
      uint64_t v11 = (char *)&v17 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v18 = &v17;
      if (v7 > 0x200) {
        uint64_t v11 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v17 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v9);
      }
      objc_msgSend(a4, "getIndexes:maxCount:inIndexRange:", v11, v8, 0, v8, v18);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v12 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = 0;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(a3);
            }
            method_invoke();
          }
          uint64_t v13 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
          v14 += i;
        }
        while (v13);
      }
      if (v17 >= 0x201) {
        NSZoneFree(0, v11);
      }
    }
  }
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  if (a3.length)
  {
    NSUInteger location = a3.location;
    if (self->_mutationMethods->_removeMethod)
    {
      id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", a3.location, a3.length);
      method_invoke();
    }
    else
    {
      NSUInteger v4 = a3.location + a3.length;
      if (a3.location + a3.length > a3.location)
      {
        do
        {
          --v4;
          method_invoke();
        }
        while (v4 > location);
      }
    }
  }
}

- (void)removeObjectsAtIndexes:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    if (self->_mutationMethods->_removeMethod)
    {
      method_invoke();
    }
    else
    {
      unint64_t v5 = [a3 count];
      unint64_t v6 = v5;
      unint64_t v7 = v5 - 1;
      if (v5 <= 1) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = v5;
      }
      if (v5 >= 0x201) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v8;
      }
      uint64_t v10 = (char *)v11 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v5 >= 0x201)
      {
        uint64_t v10 = (char *)NSAllocateScannedUncollectable();
        [a3 getIndexes:v10 maxCount:v6 inIndexRange:0];
      }
      else
      {
        bzero((char *)v11 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v8);
        [a3 getIndexes:v10 maxCount:v6 inIndexRange:0];
        if (!v6) {
          return;
        }
      }
      do
      {
        method_invoke();
        --v7;
      }
      while (v7 != -1);
      if (v6 >= 0x201) {
        NSZoneFree(0, v10);
      }
    }
  }
}

- (void)removeAllObjects
{
  uint64_t v3 = [(NSMutableOrderedSet *)self->super._mutableOrderedSet count];
  if (v3)
  {
    if (self->_mutationMethods->_removeMethod)
    {
      id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, v3);
      method_invoke();
    }
    else
    {
      uint64_t v4 = v3 - 1;
      do
      {
        method_invoke();
        --v4;
      }
      while (v4 != -1);
    }
  }
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
          uint64_t v10 = [(NSMutableOrderedSet *)self->super._mutableOrderedSet indexOfObject:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
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
    if ([v5 count]) {
      [(_NSProxyWrapperMutableOrderedSet *)self removeObjectsAtIndexes:v5];
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
    mutableOrderedSet = self->super._mutableOrderedSet;
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
    [(_NSProxyWrapperMutableOrderedSet *)self removeObjectsAtIndexes:v5];
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
          uint64_t v10 = [(NSMutableOrderedSet *)self->super._mutableOrderedSet indexOfObject:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
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
    [(_NSProxyWrapperMutableOrderedSet *)self removeObjectsAtIndexes:v5];
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
    [(_NSProxyWrapperMutableOrderedSet *)self addObjects:v9 count:v6];
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
    mutableOrderedSet = self->super._mutableOrderedSet;
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
    [(_NSProxyWrapperMutableOrderedSet *)self removeObjectsAtIndexes:v5];
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
    mutableOrderedSet = self->super._mutableOrderedSet;
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
    [(_NSProxyWrapperMutableOrderedSet *)self removeObjectsAtIndexes:v5];
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
    [(_NSProxyWrapperMutableOrderedSet *)self addObjects:v9 count:v6];
    if (v6 >= 0x201) {
      NSZoneFree(0, v9);
    }
  }
}

- (void)sortUsingComparator:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_NSProxyWrapperMutableOrderedSet;
  [(_NSNotifyingWrapperMutableOrderedSet *)&v3 sortUsingComparator:a3];
}

- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)_NSProxyWrapperMutableOrderedSet;
  [(_NSNotifyingWrapperMutableOrderedSet *)&v4 sortWithOptions:a3 usingComparator:a4];
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)_NSProxyWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet sortRange:options:usingComparator:](&v5, sel_sortRange_options_usingComparator_, a3.location, a3.length, a4, a5);
}

@end