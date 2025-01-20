@interface BWReverseBreadthFirstEnumerator
- (BWReverseBreadthFirstEnumerator)initWithGraph:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation BWReverseBreadthFirstEnumerator

- (BWReverseBreadthFirstEnumerator)initWithGraph:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)BWReverseBreadthFirstEnumerator;
  v4 = -[BWNodeEnumerator initWithGraph:](&v16, sel_initWithGraph_);
  if (v4)
  {
    v4->_queue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = objc_msgSend(a3, "_sinkNodes", 0);
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
  v3.super_class = (Class)BWReverseBreadthFirstEnumerator;
  [(BWNodeEnumerator *)&v3 dealloc];
}

- (id)nextObject
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_queue count]) {
    return 0;
  }
  objc_super v3 = (void *)[(NSMutableArray *)self->_queue firstObject];
  [(NSMutableArray *)self->_queue removeObjectAtIndex:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(v3, "inputs", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "connection"), "output"), "node");
        if (v9)
        {
          uint64_t v10 = v9;
          if (!-[BWNodeEnumerator _updateVisitedCount:]((uint64_t)self, v9)) {
            [(NSMutableArray *)self->_queue addObject:v10];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v3;
}

@end