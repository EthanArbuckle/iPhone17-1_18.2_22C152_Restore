@interface BWBreadthFirstEnumerator
- (BWBreadthFirstEnumerator)initWithGraph:(id)a3;
- (id)nextObject;
- (uint64_t)addChildren:(uint64_t)result;
- (void)dealloc;
@end

@implementation BWBreadthFirstEnumerator

- (BWBreadthFirstEnumerator)initWithGraph:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)BWBreadthFirstEnumerator;
  v4 = -[BWNodeEnumerator initWithGraph:](&v16, sel_initWithGraph_);
  if (v4)
  {
    v4->_queue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_holdQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = objc_msgSend(a3, "_sourceNodes", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          [(NSMutableArray *)v4->_queue addObject:v10];
          -[BWNodeEnumerator _updateVisitedCount:]((uint64_t)v4, v10);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWBreadthFirstEnumerator;
  [(BWNodeEnumerator *)&v3 dealloc];
}

- (uint64_t)addChildren:(uint64_t)result
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v3 = objc_msgSend(a2, "outputs", 0);
    result = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v14;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v6), "connection"), "input"), "node");
          if (v7)
          {
            if ((uint64_t v8 = (void *)v7,
                  uint64_t v9 = -[BWNodeEnumerator _updateVisitedCount:](v2, v7),
                  v9 == objc_msgSend((id)objc_msgSend(v8, "inputs"), "count") - 1)
              && (int v10 = [*(id *)(v2 + 40) containsObject:v8],
                  v11 = &OBJC_IVAR___BWBreadthFirstEnumerator__queue,
                  !v10)
              || (char v12 = [*(id *)(v2 + 40) containsObject:v8],
                  v11 = &OBJC_IVAR___BWBreadthFirstEnumerator__holdQueue,
                  (v12 & 1) == 0))
            {
              [*(id *)(v2 + *v11) addObject:v8];
            }
          }
          ++v6;
        }
        while (v4 != v6);
        result = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (id)nextObject
{
  if ([(NSMutableArray *)self->_queue count])
  {
    objc_super v3 = (void *)[(NSMutableArray *)self->_queue firstObject];
    [(NSMutableArray *)self->_queue removeObjectAtIndex:0];
  }
  else
  {
    if (![(NSMutableArray *)self->_holdQueue count]) {
      return 0;
    }
    objc_super v3 = (void *)[(NSMutableArray *)self->_holdQueue firstObject];
    [(NSMutableArray *)self->_holdQueue removeObjectAtIndex:0];
    [(NSMutableArray *)self->_queue addObjectsFromArray:self->_holdQueue];
    [(NSMutableArray *)self->_holdQueue removeAllObjects];
  }
  -[BWBreadthFirstEnumerator addChildren:]((uint64_t)self, v3);
  return v3;
}

@end