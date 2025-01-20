@interface BWReverseDepthFirstEnumerator
- (BWReverseDepthFirstEnumerator)initWithGraph:(id)a3 vertexOrdering:(int)a4;
- (id)nextObject;
- (uint64_t)_nextUnvisitedParent:(uint64_t)a1;
- (void)dealloc;
@end

@implementation BWReverseDepthFirstEnumerator

- (id)nextObject
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_stack count])
  {
    id v3 = [(BWGraph *)self->super._graph _sinkNodes];
    unint64_t currentSinkIndex = self->_currentSinkIndex;
    if (currentSinkIndex >= [v3 count]) {
      return 0;
    }
    -[NSMutableArray bw_push:](self->_stack, "bw_push:", [v3 objectAtIndexedSubscript:self->_currentSinkIndex]);
    -[BWNodeEnumerator _updateVisitedCount:]((uint64_t)self, [v3 objectAtIndexedSubscript:self->_currentSinkIndex]);
    ++self->_currentSinkIndex;
  }
  stack = self->_stack;
  if (self->_ordering)
  {
    uint64_t v6 = -[BWReverseDepthFirstEnumerator _nextUnvisitedParent:]((uint64_t)self, [(NSMutableArray *)stack bw_peek]);
    if (v6)
    {
      v7 = (void *)v6;
      do
      {
        [(NSMutableArray *)self->_stack bw_push:v7];
        v7 = (void *)-[BWReverseDepthFirstEnumerator _nextUnvisitedParent:]((uint64_t)self, v7);
      }
      while (v7);
    }
    id v8 = [(NSMutableArray *)self->_stack bw_pop];
  }
  else
  {
    id v8 = [(NSMutableArray *)stack bw_pop];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = objc_msgSend((id)objc_msgSend(v8, "inputs", 0), "reverseObjectEnumerator");
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13), "connection"), "output"), "node");
          if (v14)
          {
            uint64_t v15 = v14;
            if (!-[BWNodeEnumerator _updateVisitedCount:]((uint64_t)self, v14)) {
              [(NSMutableArray *)self->_stack bw_push:v15];
            }
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  self->super._depth = 0;
  return v8;
}

- (uint64_t)_nextUnvisitedParent:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend((id)objc_msgSend(a2, "inputs", 0), "reverseObjectEnumerator");
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v12;
LABEL_4:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v12 != v6) {
      objc_enumerationMutation(v3);
    }
    uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "connection"), "output"), "node");
    if (v8)
    {
      uint64_t v9 = v8;
      if (!-[BWNodeEnumerator _updateVisitedCount:](a1, v8)) {
        return v9;
      }
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        goto LABEL_4;
      }
      return 0;
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWReverseDepthFirstEnumerator;
  [(BWNodeEnumerator *)&v3 dealloc];
}

- (BWReverseDepthFirstEnumerator)initWithGraph:(id)a3 vertexOrdering:(int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWReverseDepthFirstEnumerator;
  uint64_t v5 = [(BWNodeEnumerator *)&v8 initWithGraph:a3];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_ordering = a4;
    v5->_stack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6->_unint64_t currentSinkIndex = 0;
  }
  return v6;
}

@end